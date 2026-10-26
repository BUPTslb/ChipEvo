"""Explicit, bounded official-Kimi smoke test. Never imported by the grader."""
from pathlib import Path
import argparse,json,re,shlex,urllib.request,urllib.error,sys,shutil,time,subprocess,itertools
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from chipevo.prompting import render
from chipevo.util import save,sha
from chipevo.policy import validate
from chipevo.context_budget import prepare
from chipevo.util import load

TOOLS=[{'type':'function','function':{'name':'read_source','description':'Read candidate RTL with original line numbers; maximum 400 lines per request.',
    'parameters':{'type':'object','properties':{'file':{'type':'string'},'start_line':{'type':'integer'},'end_line':{'type':'integer'}},'required':['file','start_line','end_line']}}},
    {'type':'function','function':{'name':'search_source','description':'Literal search in a candidate RTL file.',
    'parameters':{'type':'object','properties':{'file':{'type':'string'},'text':{'type':'string'}},'required':['file','text']}}}]

def get_key():
    import os
    key=os.environ.get('KimiCode_K3')
    if key:return key
    m=re.search(r'^\s*(?:export\s+)?KimiCode_K3\s*=\s*([^\n]+)',(Path.home()/'.bashrc').read_text(),re.M)
    if not m:raise ValueError('KimiCode_K3 is absent; no request sent')
    value=shlex.split(m[1],comments=True)[0]
    if '$' in value or '`' in value:raise ValueError('Only literal API credentials are supported')
    return value

def source_tool(rtl,name,args):
    rel=args['file'].removeprefix('rtl/');p=(rtl/rel).resolve()
    if not p.is_relative_to(rtl.resolve()) or not p.is_file():return 'ERROR: path must be inside candidate RTL'
    lines=p.read_text().splitlines()
    if name=='read_source':
        start=max(1,int(args['start_line']));end=min(len(lines),int(args['end_line']),start+399)
        return '\n'.join(f'{i+1}: {lines[i]}' for i in range(start-1,end))[:24000]
    if name=='search_source':
        needle=args['text']
        if not needle or len(needle)>200:return 'ERROR: invalid search'
        return '\n'.join(f'{i+1}: {s}' for i,s in enumerate(lines) if needle in s)[:16000]
    return 'ERROR: unsupported tool'

def proposal(text):
    texts=[text]+re.findall(r'```(?:json)?\s*([\s\S]*?)```',text)
    for s in texts:
        try:
            obj=json.loads(s)
            if isinstance(obj,dict) and isinstance(obj.get('edits'),list):return obj
        except (ValueError,TypeError):pass
    raise ValueError('No complete JSON proposal; not attempting guessed/truncated RTL')

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--design',required=True);p.add_argument('--objective',required=True,choices=['timing','area'])
    p.add_argument('--run',help='Existing evaluated baseline used for localization')
    p.add_argument('--output',required=True);p.add_argument('--run-model',action='store_true');p.add_argument('--run-eda',action='store_true')
    p.add_argument('--max-calls',type=int,default=None);p.add_argument('--max-tokens',type=int,default=8192)
    p.add_argument('--wall-timeout',type=int,default=1800)
    p.add_argument('--context-window-tokens',type=int,required=True,help='Confirmed context window of the actual API model/account')
    p.add_argument('--resume-delivery',help='Explicitly reuse a failed candidate conversation; records changed delivery budget, not an independent sample')
    a=p.parse_args()
    if not a.run_model or not a.run_eda:p.error('Both --run-model and --run-eda are required for this explicit end-to-end test')
    if (a.max_calls is not None and a.max_calls<1) or not 64<=a.max_tokens<=32768:p.error('Use a positive optional call cap and 64..32768 output tokens')
    root=Path(__file__).resolve().parents[1];out=Path(a.output).resolve()
    context_budget=load(root/'configs/studies/multimodel.json')['budget']
    context_budget['max_output_tokens']=a.max_tokens
    if a.context_window_tokens<=a.max_tokens+context_budget['context_safety_tokens']:
        p.error('Context window must reserve input, output and safety')
    context_model={'model':'k3','protocol':'openai_chat','context_window_tokens':a.context_window_tokens,
                   'request_options':{'temperature':1.0}}
    if out.exists():raise ValueError('Use a fresh output directory')
    text,evidence=render(root,a.design,a.objective,0,a.run)
    out.mkdir(parents=True);save(out/'context.json',evidence);(out/'prompt.md').write_text(text)
    rtl=out/'workspace/designs'/a.design/'rtl';shutil.copytree(root/'designs'/a.design/'rtl',rtl)
    original={str(x.relative_to(root/'designs'/a.design/'rtl')):sha(x) for x in (root/'designs'/a.design/'rtl').rglob('*') if x.is_file()}
    state={'design':a.design,'objective':a.objective,'base_url':'https://api.kimi.com/coding/v1','model':'k3','calls':0,'status':'running','max_calls':a.max_calls,'max_tokens_per_call':a.max_tokens}
    save(out/'state.json',state)
    instruction='''This is one candidate in a smoke test, not multiple independent candidates. You can read/search RTL using the supplied tools. File paths are relative to rtl/ (rtl/ prefix is also accepted). Return one JSON object {"reason":"...","edits":[{"file":"core/cpuops.v","old":"exact unique original substring","new":"replacement"}]}. Each old substring must be nonempty and occur exactly once. Preserve all state names and all legal input behavior. Do not output a unified diff or markdown explanations. Empty edits are allowed only if no defensible improvement is found. No shell or EDA calls are available to you. You have at most five API completions including source queries. Deliver a small complete proposal rather than exhausting output in reasoning.'''
    messages=[{'role':'system','content':instruction},{'role':'user','content':text}]
    messages[0]['content']=instruction.replace('You have at most five API completions including source queries.',
        'There is no default API request count or cumulative source cap; the wall timeout still applies.')
    if a.resume_delivery:
        previous=Path(a.resume_delivery).resolve();prior=json.loads((previous/'state.json').read_text())
        if prior['design']!=a.design or prior['objective']!=a.objective or prior['status']!='failed':raise ValueError('Delivery resume requires the same failed design/objective')
        latest=max(previous.glob('request-*.json'),key=lambda x:int(x.stem.split('-')[-1]))
        response=json.loads((previous/latest.name.replace('request-','response-')).read_text())
        messages=json.loads(latest.read_text())['messages']+[response['choices'][0]['message']]
        messages.append({'role':'user','content':'Your reasoning/output was truncated. Reuse your existing analysis and return ONE complete concise JSON patch now. No tools or further exploration. This is an explicit delivery recovery, not another candidate.'})
        state['delivery_recovery_of']=str(previous);state['comparable_benchmark_sample']=False
    key=get_key();final=None;smoke_started=time.monotonic()
    try:
        for turn in itertools.count():
            if a.max_calls is not None and turn>=a.max_calls:break
            if time.monotonic()-smoke_started>=a.wall_timeout:raise TimeoutError('Smoke wall-time budget exhausted')
            payload,context_record=prepare(context_model,messages,TOOLS,context_budget,{'cumulative_source_cap':None,'api_call_cap':a.max_calls})
            save(out/f'context-{turn}.json',context_record)
            if (a.max_calls is not None and turn==a.max_calls-1) or a.resume_delivery:payload['tool_choice']='none'
            save(out/f'request-{turn}.json',payload)
            req=urllib.request.Request(state['base_url']+'/chat/completions',data=json.dumps(payload).encode(),headers={'Content-Type':'application/json','Authorization':'Bearer '+key})
            started=time.time()
            try:
                with urllib.request.urlopen(req,timeout=600) as response:data=json.load(response)
            except urllib.error.HTTPError as e:
                raise RuntimeError(f'Official API HTTP {e.code}; credentials and response body omitted') from None
            save(out/f'response-{turn}.json',data);state['calls']+=1
            state.setdefault('usage',[]).append(data.get('usage'));state.setdefault('latencies_s',[]).append(time.time()-started)
            save(out/'state.json',state)
            choice=data['choices'][0];msg=choice['message'];messages.append(msg)
            calls=msg.get('tool_calls') or []
            if not calls:
                if choice.get('finish_reason')=='length':
                    messages.append({'role':'user','content':'Output was truncated. Return a concise complete JSON patch now.'});continue
                final=proposal(msg.get('content') or '');break
            for tool in calls:
                try:
                    response=source_tool(rtl,tool['function']['name'],json.loads(tool['function']['arguments']))
                except (ValueError,KeyError,TypeError) as e:response='ERROR: '+str(e)[:300]
                messages.append({'role':'tool','tool_call_id':tool['id'],'content':response or 'Source read budget exhausted.'})
        if final is None:raise ValueError('No complete proposal within configured API budget')
        save(out/'proposal.json',final)
        for edit in final['edits']:
            rel=edit['file'].removeprefix('rtl/');f=(rtl/rel).resolve()
            if not f.is_relative_to(rtl.resolve()) or rel not in original:raise ValueError('Unknown/outside RTL file')
            body=f.read_text();old=edit['old'];new=edit['new']
            if not isinstance(old,str) or not isinstance(new,str) or not old or body.count(old)!=1:raise ValueError('Replacement anchor absent or ambiguous')
            f.write_text(body.replace(old,new,1))
        state['policy']=validate(root/'designs'/a.design,rtl)
        evaldir=out/'eval';evaldir.mkdir()
        args=[sys.executable,'-I',str(root/f'grading/score_{a.objective}.py'),'--design',a.design,'--trusted-root',str(root),'--candidate-root',str(out/'workspace'),'--result',str(evaldir/'code_result.json'),'--artifacts',str(evaldir/'artifacts')]
        with (out/'grading.log').open('w') as log:
            completed=subprocess.run(args,stdout=log,stderr=subprocess.STDOUT,timeout=21600,cwd=evaldir)
        if completed.returncode:raise RuntimeError('Grader entry failed; see grading.log')
        state['grade']=json.loads((evaldir/'code_result.json').read_text())
        report=json.loads((evaldir/'chipevo_report.json').read_text())
        state['status']=report['status'];state['formal_status']=report.get('formal_status')
        state['baseline']=report.get('baseline');state['candidate']=report.get('candidate')
        if report.get('error'):state['error']=report['error']
    except Exception as e:
        state.update(status='failed',error=str(e).replace(key,'[REDACTED]')[:1000])
    finally:
        state['starter_rtl_unchanged']=all(sha(root/'designs'/a.design/'rtl'/rel)==h for rel,h in original.items())
        save(out/'state.json',state);print(json.dumps(state,ensure_ascii=False))
    return 0 if state['status']=='evaluated' else 1

if __name__=='__main__':raise SystemExit(main())
