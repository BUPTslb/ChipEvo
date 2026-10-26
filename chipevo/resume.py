"""Fail-closed restoration at a recorded, rejected Chat Completions request.

No model requests, RTL edits or EDA are executed during reconstruction. The last
request is the authoritative model-visible context, including reasoning fields.
"""
from pathlib import Path
import copy,gzip,json,hashlib,shutil
from .util import load,save,sha
from .progress import ProgressLedger,recall_document
from .providers import payload

HOST='HOST STATE (current files authoritative): '
MEMORY='COMPACTED HISTORY (advisory; fixed rules above prevail):\n'

def read_saved(path):
    path=Path(path)
    if path.exists():return load(path)
    with gzip.open(str(path)+'.gz','rt',encoding='utf-8') as f:return json.load(f)

def exists_saved(path):return Path(path).is_file() or Path(str(path)+'.gz').is_file()

def clone_agent(source,destination):
    """Copy, never hardlink, mutable history. Expand lossless logs in the copy."""
    source=Path(source);destination=Path(destination)
    if any(p.is_symlink() for p in source.rglob('*')):raise ValueError('Symlink in checkpoint')
    shutil.copytree(source,destination)
    for p in destination.rglob('*.json.gz'):
        target=p.with_suffix('')
        if target.exists():raise ValueError('Ambiguous compressed/uncompressed checkpoint')
        with gzip.open(p,'rb') as src,target.open('xb') as dst:shutil.copyfileobj(src,dst)
        p.unlink() # Only the newly created continuation copy.
    if (destination/'compression.json').exists():
        number=len(load(destination/'agent.json').get('resume_history',[]))+1
        (destination/'compression.json').rename(destination/f'prior-compression-{number:03d}.json')

def restore(source,rtl,task_root,model,budget,schema,manager):
    source=Path(source);rtl=Path(rtl);task_root=Path(task_root)
    state=read_saved(source/'agent.json');messages=read_saved(source/'transcript.json')
    events=read_saved(source/'tool-events.json');ledger=read_saved(source/'source-ledger.json')
    saved_progress=read_saved(source/'progress.json')
    rejected={'Provider HTTP 402; error body omitted'}
    # Kimi Coding also reports exhausted account quota using HTTP 429. A human
    # explicitly requests continuation after quota recovery; no automatic retry.
    if model.get('id')=='kimi' and model.get('model')=='k3.1-pro':
        rejected.add('Provider HTTP 429; error body omitted')
    if state.get('status')!='failed' or state.get('error') not in rejected:
        raise ValueError('Resume requires an explicitly supported rejected request, not an arbitrary crash')
    if model['protocol']!='openai_chat' or state['requested_model']!=model['model']:
        raise ValueError('Resume protocol/model mismatch')
    if state['prompt_sha256']!=sha(task_root/'fixed-prompt.md'):
        raise ValueError('Resume fixed prompt changed')
    if state['tool_schema_sha256']!=hashlib.sha256(json.dumps(schema,sort_keys=True).encode()).hexdigest():
        raise ValueError('Resume tool schema changed')
    n=state['api_calls_attempted']-1
    if len(state['api_purposes'])!=n+1 or state['api_purposes'][n] not in ['optimization','context_overflow_recovery']:
        raise ValueError('Resume requires a main-request boundary')
    if exists_saved(source/f'response-{n}.metadata.json') or exists_saved(source/f'response-{n}.json'):
        raise ValueError('Rejected request unexpectedly has a response; refusing duplicate execution')
    body=read_saved(source/f'request-{n}.json')
    if body!=payload(model,body['messages'],schema,budget['max_output_tokens']):
        raise ValueError('Resume request configuration changed')
    view=body['messages'];i=2;memory=''
    if view[i].get('role')=='user' and view[i].get('content','').startswith(MEMORY):
        memory=view[i]['content'][len(MEMORY):];i+=1
    if view[i].get('role')!='user' or not view[i].get('content','').startswith(HOST):
        raise ValueError('Missing authoritative host state in request')
    host=json.loads(view[i]['content'][len(HOST):])
    if host['tool_calls_used']!=state['tool_calls'] or host['eda_feedback_calls_used']!=state['eda_feedback_calls']:
        raise ValueError('Tool execution occurred after the saved request')
    # Ensure all successful model turns and tool results are accounted for.
    cursor=2;event_cursor=0
    prior_rejections={item['failed_request_number'] for item in state.get('resume_history',[])}
    for number,purpose in enumerate(state['api_purposes']):
        if purpose=='compaction':continue
        meta=source/f'response-{number}.metadata.json'
        if not exists_saved(meta):
            if number!=n and number not in prior_rejections:raise ValueError('Earlier missing main response')
            continue
        message=read_saved(meta)['message']
        if messages[cursor]!=message:raise ValueError('Transcript/response mismatch')
        cursor+=1
        for call in message.get('tool_calls') or []:
            event=events[event_cursor];event_cursor+=1
            expected={'role':'tool','tool_call_id':call['id'],'content':json.dumps(event['result'],ensure_ascii=False)}
            if event['name']!=call['function']['name'] or event['arguments']!=call['function']['arguments'] or messages[cursor]!=expected:
                raise ValueError('Pending or mismatched tool execution')
            cursor+=1
    if cursor!=len(messages) or event_cursor!=len(events) or len(events)!=state['tool_calls']:
        raise ValueError('Incomplete transcript/tool ledger')
    if any(e['number']!=i+1 for i,e in enumerate(events)):raise ValueError('Nonsequential tool ledger')
    record=state['context_requests'][-1]
    manager.cursor=len(messages);manager.active=copy.deepcopy(view[i+1:]);manager.memory=memory
    manager.ratio=record['observed_tokens_per_byte_guard']
    manager.new_groups=record['new_groups_since_summary']
    manager.events=read_saved(source/'context-events.json')
    manager.compactions=sum(e.get('summary_attempts',0) for e in manager.events)
    manager.receipt_restorations=record['receipt_restorations_total']
    manager.summary_failure_streak=0
    for e in manager.events:
        if 'summary_failed' in e:manager.summary_failure_streak=e['failure_streak']
        elif e.get('summary_calls'):manager.summary_failure_streak=0
    archives={};archive_views={};source_cache={}
    for p in sorted((source/'context-archive').glob('*.json*')):
        ident=p.name.split('.json')[0]
        if ident in archives:raise ValueError('Duplicate archive')
        value=read_saved(source/'context-archive'/(ident+'.json'))
        if ident!=value['kind']+'-'+hashlib.sha256(value['text'].encode()).hexdigest()[:16]:
            raise ValueError('Archive checksum mismatch')
        archives[ident]=value['text'];archive_views[ident]=(value['kind'],recall_document(value['text'],value['kind']))
    for e in events:
        v=e['result']
        if e['ok'] and e['name'] in ['read_source','search_source'] and 'source' in v:
            args=json.loads(e['arguments']);key=(e['name'],v['file'],v['file_sha256'],json.dumps({k:w for k,w in args.items() if k!='file'},sort_keys=True))
            source_cache[key]=v;manager.source_pages[v['source_ref']]=v['source']
    # Recover the full edit count, including edits older than the six-item UI view.
    initial=task_root/'initial-rtl'
    versions={str(p.relative_to(initial)).replace('\\','/'):sha(p) for p in initial.rglob('*') if p.is_file()}
    progress=ProgressLedger(versions);at=0
    for e in events:
        if e['name']!='apply_edits' or not e['ok']:continue
        files=list(dict.fromkeys(v['file'].removeprefix('rtl/') for v in json.loads(e['arguments'])['edits']))
        changed={}
        for file in files:
            item=ledger['edits'][at];at+=1
            if item['file']!=file:raise ValueError('Edit ledger file mismatch')
            changed[file]=item['file_sha256']
        progress.edited(changed,e['number'])
        if progress.rtl_hash()!=e['result']['current_rtl_hash']:raise ValueError('Edit ledger hash mismatch')
    if at!=len(ledger['edits']):raise ValueError('Extra edit ledger entries')
    current={str(p.relative_to(rtl)).replace('\\','/'):sha(p) for p in rtl.rglob('*') if p.is_file()}
    if any(p.is_symlink() for p in rtl.rglob('*')) or progress.versions!=current:
        raise ValueError('Current RTL does not match checkpoint')
    if saved_progress['latest_evaluation']:
        value=copy.deepcopy(saved_progress['latest_evaluation']);value.pop('applies_to_current_rtl',None)
        progress.evaluations=[value]
    actual=progress.snapshot()
    for key in ['current_rtl_hash','stage','successful_edit_calls','recent_edits','latest_evaluation']:
        if actual[key]!=saved_progress[key]:raise ValueError('Progress mismatch: '+key)
    if host['authoritative_progress']['current_rtl_hash']!=progress.rtl_hash():raise ValueError('Last request RTL mismatch')
    if saved_progress['feedback_calls_remaining']!=budget['max_eda_feedback_calls']-state['eda_feedback_calls']:
        raise ValueError('Feedback allowance changed')
    if abs(saved_progress['remaining_active_s']-max(0,budget['candidate_wall_timeout_s']-state['candidate_active_s']))>1:
        raise ValueError('Remaining time mismatch')
    if state['candidate_active_s']>=budget['candidate_wall_timeout_s']:raise ValueError('No remaining active budget')
    return dict(state=state,messages=messages,events=events,usage=state['usage_raw'],body=body,
                archives=archives,archive_views=archive_views,source_cache=source_cache,
                source_ledger=ledger['pages'],file_versions=ledger['file_versions'],edit_ledger=ledger['edits'],progress=progress,
                audit={'source':str(source),'rejected_error':state['error'],'failed_request_number':n,'request_sha256':hashlib.sha256(json.dumps(body,sort_keys=True).encode()).hexdigest(),
                       'rtl_hash':progress.rtl_hash(),'prior_active_s':state['candidate_active_s'],
                       'remaining_active_s':budget['candidate_wall_timeout_s']-state['candidate_active_s'],
                       'feedback_calls_used':state['eda_feedback_calls'],'transcript_messages':len(messages),
                       'active_context_messages':len(manager.active),'archive_count':len(archives),
                       'restoration':'exact last request; no model, tool or EDA replay'})
