"""A candidate receives only bounded, host-mediated tools for its own RTL."""
from pathlib import Path
import time,json,hashlib,datetime,shutil
from .util import load,save,sha
from .policy import validate
from . import providers
from .study_metrics import sum_usage
from .context_manager import ContextManager
from .prompt_contract import LANGUAGE_RULE,english_prompt
from .timing_budget import CandidateClock,current_candidate_clock
from .progress import ProgressLedger,recall_document

SUMMARY_POLICY = 'summary-v5-authoritative-progress'
SYSTEM_PROMPT = ('Use only the tools supplied for this candidate. Apply actual RTL edits with apply_edits, then finish with a concise explanation. '
                'Consult the host source ledger and file versions before reading. Reuse visible source pages; read again only when missing or changed. '
                'Host progress facts override advisory summaries. Report concise decisions and the next action in ordinary content when useful; do not expose private reasoning. '
                'No shell, host files, other candidates, external services, or other task objectives are available. '
                'A fresh conversation is used for this one candidate. '+LANGUAGE_RULE)
SUMMARY_SYSTEM_PROMPT = 'Produce a concise factual progress checkpoint in English only. Do not use Chinese. Do not call tools. Return at most 6000 characters. Use sections: decisions, pending work, recall references. Current authoritative state overrides old summaries and archived excerpts. Absence of edits in an excerpt does not mean the current workspace is unmodified. Never claim no changes or no validation contrary to authoritative facts. Do not reproduce reasoning, source code, file inventories, or long reference lists.'

def tools(feedback,max_read_lines=400):
    specs=[('list_sources','List files in this candidate RTL only.',{},[]),
           ('recall_history','Read a page from an offloaded result/history of this candidate only.',{'ref':{'type':'string'},'offset':{'type':'integer'}},['ref','offset']),
           ('read_source',f'Read at most {max_read_lines} numbered lines. Repeated unchanged pages already visible return a receipt and source_ref. Missing or changed pages return source. For truncation repeat the range with offset_chars=next_offset_chars.',{'file':{'type':'string'},'start_line':{'type':'integer'},'end_line':{'type':'integer'},'offset_chars':{'type':'integer'}},['file','start_line','end_line']),
           ('search_source','Find literal text in one candidate RTL file. Reuse existing results when unchanged. Page truncated results with offset_chars.',{'file':{'type':'string'},'text':{'type':'string'},'offset_chars':{'type':'integer'}},['file','text']),
           ('apply_edits','Apply exact unique replacements atomically; protected code cannot change.',{'edits':{'type':'array','items':{'type':'object','properties':{'file':{'type':'string'},'old':{'type':'string'},'new':{'type':'string'}},'required':['file','old','new'],'additionalProperties':False}}},['edits'])]
    if feedback:specs.append(('evaluate_candidate','Run trusted equivalence, synthesis and STA for this candidate and this objective only.',{},[]))
    return [{'type':'function','function':{'name':n,'description':d,'parameters':{'type':'object','properties':p,'required':r,'additionalProperties':False}}} for n,d,p,r in specs]

def safe_file(rtl,rel,allowed):
    if not isinstance(rel,str):raise ValueError('File must be a relative string')
    rel=rel.removeprefix('rtl/');p=rtl/rel
    if Path(rel).is_absolute() or '..' in Path(rel).parts or rel not in allowed:raise ValueError('File is not in this candidate RTL')
    if p.is_symlink() or not p.resolve().is_relative_to(rtl.resolve()):raise ValueError('Links/outside paths forbidden')
    return p

def agent(task_root,design,objective,rtl,prompt,model,budget,out,evaluate_fn,resume_from=None):
    """Fresh messages per invocation; no filesystem/shell/URL tools are offered."""
    if budget.get('max_eda_feedback_calls')!=0:
        raise ValueError('In-candidate EDA is disabled by round-feedback-v1')
    if resume_from is not None:
        raise ValueError('Legacy checkpoints cannot enter round-feedback-v1')
    out=Path(out);rtl=Path(rtl)
    if resume_from is None:out.mkdir(parents=True,exist_ok=False)
    else:
        from .resume import clone_agent
        clone_agent(resume_from,out)
    allowed=load(Path(task_root)/'designs'/design/'policy.json')['file_sha256']
    schema=tools(budget['max_eda_feedback_calls'],budget['max_read_lines']);usage=[];events=[];calls=0;chars=0;eda=0;started=time.monotonic()
    state={'status':'running','api_calls_attempted':0,'api_calls_completed':0,'tool_calls':0,
           'tool_success':0,'tool_failure':0,'eda_feedback_calls':0,'usage':{},'requested_model':model['model'],
           'prompt_sha256':sha(Path(task_root)/'fixed-prompt.md'),'protocol':model['protocol']}
    state['started_at']=datetime.datetime.now(datetime.timezone.utc).isoformat()
    state['tool_schema_sha256']=hashlib.sha256(json.dumps(schema,sort_keys=True).encode()).hexdigest()
    state['summary_policy']=SUMMARY_POLICY
    messages=[{'role':'system','content':english_prompt(SYSTEM_PROMPT)},{'role':'user','content':english_prompt(prompt)}]
    archives={};archive_views={};source_cache={};source_ledger=[];file_versions={};edit_ledger=[]
    progress=ProgressLedger({rel:sha(rtl/rel) for rel in sorted(allowed)})
    def archive(text,kind):
        ident=kind+'-'+hashlib.sha256(text.encode()).hexdigest()[:16]
        archives[ident]=text;archive_views[ident]=(kind,recall_document(text,kind))
        save(out/'context-archive'/f'{ident}.json',{'kind':kind,'text':text})
        return ident
    manager=ContextManager(model,budget,archive)
    pending_body=None
    if resume_from is not None:
        from .resume import restore
        restored=restore(out,rtl,task_root,model,budget,schema,manager)
        state=restored['state'];messages=restored['messages'];events=restored['events'];usage=restored['usage']
        archives=restored['archives'];archive_views=restored['archive_views'];source_cache=restored['source_cache']
        source_ledger=restored['source_ledger'];file_versions=restored['file_versions'];edit_ledger=restored['edit_ledger']
        progress=restored['progress'];pending_body=restored['body']
        chars=state.get('source_chars_read',0);eda=state['eda_feedback_calls']
        audit=restored['audit'];audit['source']=str(Path(resume_from).resolve())
        audit['resumed_at']=datetime.datetime.now(datetime.timezone.utc).isoformat()
        state.setdefault('resume_history',[]).append(audit)
        save(out/f'resume-{len(state["resume_history"]):03d}.json',audit)
        state['status']='running';state.pop('error',None);state.pop('finished_at',None)
        started=time.monotonic()
    clock=CandidateClock(budget['candidate_wall_timeout_s'],started=started)
    if resume_from is not None:clock.carry_forward(state)
    clock_token=current_candidate_clock.set(clock)
    def checkpoint():
        state['usage']=sum_usage(usage);state.update(clock.snapshot())
        state['budget_clock']='active-v2-excludes-api-queue'
        if state.get('unmetered_failed_requests'):
            for key in list(state['usage']):
                if key.endswith('_complete'):state['usage'][key]=False
        save(out/'agent.json',state);save(out/'tool-events.json',events);save(out/'transcript.json',messages)
        save(out/'source-ledger.json',{'pages':source_ledger,'file_versions':file_versions,'edits':edit_ledger})
        save(out/'progress.json',progress.snapshot(clock.remaining(),budget['max_eda_feedback_calls']-eda))
    def tool(name,args):
        nonlocal chars,eda
        if name=='list_sources':return {'files':sorted(allowed)}
        if name=='recall_history':
            ident=args['ref']
            if ident not in archives:raise ValueError('Unknown history reference for this candidate')
            offset=max(0,int(args['offset']));size=budget['max_source_result_chars'];kind,value=archive_views[ident]
            return {'ref':ident,'offset':offset,'text':value[offset:offset+size],
                    'next_offset':offset+size if offset+size<len(value) else None,'total_chars':len(value),
                    'format':'decoded-evidence-v1','kind':kind,'evidence_only':True}
        if name in ['read_source','search_source']:
            f=safe_file(rtl,args['file'],allowed);version=sha(f);rel=str(f.relative_to(rtl))
            file_versions[rel]=version
            key=(name,rel,version,json.dumps({k:v for k,v in args.items() if k!='file'},sort_keys=True))
            state['source_read_requests']=state.get('source_read_requests',0)+1
            if key in source_cache:
                cached=source_cache[key];ref=cached['source_ref']
                state['repeated_source_requests']=state.get('repeated_source_requests',0)+1
                if manager.has_source(ref):
                    state['source_reuse_receipts']=state.get('source_reuse_receipts',0)+1
                    return {k:v for k,v in cached.items() if k not in ['source','source_chars_used']} | {
                        'unchanged':True,'already_in_context':True,
                        'hint':'Reuse the unchanged source page already in the current context. Exact source is also available through recall_history using source_ref.'}
                state['source_page_restorations']=state.get('source_page_restorations',0)+1
            lines=f.read_text().splitlines()
            if name=='read_source':
                start=max(1,int(args['start_line']));end=min(len(lines),int(args['end_line']),start+budget['max_read_lines']-1)
                result='\n'.join(f'{i+1}: {lines[i]}' for i in range(start-1,end))
            else:
                needle=args['text']
                if not isinstance(needle,str) or not needle or len(needle)>200:raise ValueError('Invalid literal search')
                result='\n'.join(f'{i+1}: {s}' for i,s in enumerate(lines) if needle in s)
            offset=max(0,int(args.get('offset_chars',0)));result=result[offset:]
            length=len(result);limit=budget.get('max_source_chars')
            chunk=budget['max_source_result_chars'] if limit is None else max(0,min(budget['max_source_result_chars'],limit-chars))
            result=result[:chunk];chars+=len(result);state['source_chars_read']=chars
            source=result or 'No matches or source budget exhausted'
            response={'source':source,'source_chars_used':chars,'file_sha256':version,
                    'file':rel,'operation':name,'search_text':args.get('text'),'offset_chars':offset,
                    'start_line':args.get('start_line'),'end_line':args.get('end_line'),
                    'next_offset_chars':offset+len(result) if len(result)<length else None,
                    'truncated':len(result)<length,'continue_hint':'Read a smaller following range if truncated; there is no cumulative cap when max_source_chars is null.'}
            # Include file/version/range in the reference identity, even for equal text.
            ref=archive(json.dumps({'file':rel,'file_sha256':version,'operation':name,'arguments':args,'source':source},ensure_ascii=False),'source-page')
            response['source_ref']=ref;source_cache[key]=response
            source_ledger[:]=[item for item in source_ledger if not (item['file']==rel and item['file_sha256']!=version) and item['source_ref']!=ref]
            source_ledger.append({k:response[k] for k in ['file','file_sha256','operation','search_text','start_line','end_line','offset_chars','next_offset_chars','source_ref']})
            return response
        if name=='apply_edits':
            changed={};original={}
            for edit in args['edits']:
                f=safe_file(rtl,edit['file'],allowed);original.setdefault(f,f.read_text());text=changed.get(f,original[f])
                old=edit['old'];new=edit['new']
                if not isinstance(old,str) or not isinstance(new,str) or not old or text.count(old)!=1:raise ValueError('Replacement old text must occur exactly once')
                changed[f]=text.replace(old,new,1)
            try:
                for f,text in changed.items():f.write_text(text)
                result=validate(Path(task_root)/'designs'/design,rtl)
            except Exception:
                for f,text in original.items():f.write_text(text)
                raise
            for f in changed:
                rel=str(f.relative_to(rtl));version=sha(f);file_versions[rel]=version
                source_ledger[:]=[item for item in source_ledger if item['file']!=rel]
                edit_ledger.append({'file':rel,'file_sha256':version,'status':'applied; equivalence not implied'})
            progress.edited({str(f.relative_to(rtl)):sha(f) for f in changed},state['tool_calls'])
            return {**result,'current_rtl_hash':progress.rtl_hash(),
                    'validation':'unvalidated; earlier feedback applies only to its recorded RTL hash'}
        if name=='evaluate_candidate':
            if eda>=budget['max_eda_feedback_calls']:raise ValueError('EDA feedback budget exhausted')
            eda+=1;state['eda_feedback_calls']=eda
            evaluated_hash=progress.rtl_hash();snapshot=out/f'evaluated-rtl-{eda}'
            shutil.copytree(rtl,snapshot)
            try:evaluate_fn(task_root,design,objective,rtl,out/f'feedback-{eda}')
            except Exception as exc:
                progress.evaluated({'status':'failed','constraint_reason':str(exc)[:1000]},evaluated_hash,snapshot.relative_to(out))
                raise
            r=load(out/f'feedback-{eda}'/'report.json')
            progress.evaluated(r,evaluated_hash,snapshot.relative_to(out))
            return {**{k:r.get(k) for k in ['status','formal_status','baseline','candidate','feasible','constraint_reason','grade']},
                    'evaluated_rtl_hash':evaluated_hash,'applies_to_current_rtl':evaluated_hash==progress.rtl_hash()}
        raise ValueError('Tool unavailable')
    def request(body,purpose):
        remaining=clock.remaining()
        if remaining<=0:raise TimeoutError('Candidate active-time budget exhausted')
        number=state['api_calls_attempted'];save(out/f'request-{number}.json',body)
        state['api_calls_attempted']+=1;state.setdefault('api_purposes',[]).append(purpose);checkpoint()
        try:response=providers.call(model,load(out/f'request-{number}.json'),budget['api_timeout_s'],budget['max_http_response_bytes'])
        except Exception:
            state['unmetered_failed_requests']=state.get('unmetered_failed_requests',0)+1
            checkpoint();raise
        save(out/f'response-{number}.json',response['raw']);usage.append(response['usage'])
        from .reasoning_evidence import observe,aggregate
        evidence=observe(response['raw'],model)
        response['reasoning_evidence']=evidence
        state.setdefault('reasoning_evidence_records',[]).append(evidence)
        state['reasoning_evidence']=aggregate(state['reasoning_evidence_records'])
        save(out/'reasoning-evidence.json',state['reasoning_evidence'])
        save(out/f'response-{number}.metadata.json',{k:v for k,v in response.items() if k!='raw'})
        response=load(out/f'response-{number}.metadata.json')
        manager.observe(body,response['usage'])
        state['api_calls_completed']+=1;state.setdefault('api_latency_s',[]).append(response['latency_s'])
        state.setdefault('returned_models',[]).append(response['returned_model']);state.setdefault('stop_reasons',[]).append(response['stop_reason'])
        state.setdefault('api_queue_wait_s',[]).append(response.get('api_queue_wait_s',0))
        save(out/f'usage-{number}.json',{'purpose':purpose,'usage':response['usage'],'latency_s':response['latency_s'],'api_queue_wait_s':response.get('api_queue_wait_s',0)})
        checkpoint()
        accepted=model.get('accepted_returned_models',[model['model']])
        if response['returned_model'] not in accepted:
            raise ValueError('Provider returned an unapproved model identity; see response metadata')
        return response
    def summarize(instruction):
        output_cap=budget.get('summary_max_output_tokens',16384)
        summary_model=providers.summary_model(model)
        thinking=summary_model.get('request_options',{}).get('thinking',{})
        if isinstance(thinking,dict) and isinstance(thinking.get('budget_tokens'),int):
            output_cap=max(output_cap,thinking['budget_tokens']+1024)
        b=providers.payload(summary_model,[{'role':'system','content':SUMMARY_SYSTEM_PROMPT},
                                    {'role':'user','content':instruction}],[],output_cap)
        response=request(b,'compaction')
        if response['stop_reason'] not in ['stop','completed','end_turn']:raise ValueError('Incomplete summary: '+str(response['stop_reason']))
        text=response['message'].get('content')
        if not text:raise ValueError('Empty summary')
        return text
    try:
        number=max([int(p.stem.split('-')[1])+1 for p in out.glob('context-[0-9]*.json')],default=0)
        checkpoint()
        while True:
            if budget.get('max_api_calls') is not None and state['api_calls_attempted']>=budget['max_api_calls']:
                state['status']='completed_at_budget';break
            remaining=clock.remaining()
            if remaining<=0:raise TimeoutError('Candidate agent active-time budget exhausted')
            summary={'source_chars_used':chars,'source_chars_limit':budget.get('max_source_chars'),
                     'usage_so_far':sum_usage(usage),
                     'tool_calls_used':state['tool_calls'],'eda_feedback_calls_used':eda,
                     'recent_operations':[{'name':e['name'],'ok':e['ok']} for e in events[-8:]],
                     'file_versions':dict(list(file_versions.items())[-16:]),'source_ledger':source_ledger[-16:],
                     'recent_edits':edit_ledger[-6:],
                     'latest_evaluation':progress.snapshot()['latest_evaluation'],
                     'authoritative_progress':progress.snapshot(clock.remaining(),budget['max_eda_feedback_calls']-eda),
                     'tools_since_last_edit':state['tool_calls']-(progress.edits[-1]['tool_number'] if progress.edits else 0)}
            if pending_body is not None:
                # Retry only the rejected request, byte-equivalent JSON content.
                # The provider still enforces the carried remaining active time.
                body=pending_body;pending_body=None
            else:
                body,context_record=manager.prepare(messages,schema,summary,summarize)
                state.setdefault('context_requests',[]).append(context_record)
                save(out/f'context-{number}.json',context_record)
            try:response=request(body,'optimization')
            except providers.ContextWindowExceeded:
                # One recovery per turn only for confirmed context overflow.
                body,recovery=manager.prepare(messages,schema,summary,summarize,force=True)
                state['context_requests'].append(recovery)
                response=request(body,'context_overflow_recovery')
            number+=1
            messages.append(response['message']);checkpoint()
            if response['stop_reason'] not in ['stop','completed','end_turn','tool_calls','tool_use']:raise ValueError('Provider stopped without complete delivery: '+str(response['stop_reason']))
            tc=response['message'].get('tool_calls') or []
            if not tc:state['status']='completed';break
            tool_results=[]
            for call in tc:
                if clock.remaining()<=0:raise TimeoutError('Candidate active-time budget exhausted before tool execution')
                state['tool_calls']+=1;name=call['function']['name'];begin=time.monotonic();event={'name':name,'number':state['tool_calls'],'arguments':call['function']['arguments']}
                try:
                    if budget.get('max_tool_calls') is not None and state['tool_calls']>budget['max_tool_calls']:raise ValueError('Tool-call budget exhausted')
                    result=tool(name,json.loads(call['function']['arguments']));event['ok']=True;state['tool_success']+=1
                except Exception as e:
                    result={'error':str(e)[:1000]};event['ok']=False;state['tool_failure']+=1
                event.update(wall_s=time.monotonic()-begin,result=result)
                event_file=out/f'tool-{state["tool_calls"]:06d}.json';save(event_file,event)
                event=load(event_file);events.append(event)
                tool_results.append({'role':'tool','tool_call_id':call['id'],'content':json.dumps(event['result'],ensure_ascii=False)})
            messages.extend(tool_results);checkpoint()
    except Exception as e:state.update(status='failed',error=str(e)[:1500])
    finally:
        state['usage_raw']=usage;state['finished_at']=datetime.datetime.now(datetime.timezone.utc).isoformat()
        save(out/'transcript.json',messages);save(out/'context-events.json',manager.events);checkpoint()
        current_candidate_clock.reset(clock_token)
    return state
