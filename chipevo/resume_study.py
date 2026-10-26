"""Continue one interrupted first round in a separate result tree."""
from pathlib import Path
from functools import partial
import concurrent.futures,datetime,time,shutil
from .util import load,save,sha
from .engine import evaluate,verify_assets
from .rollout import agent
from .study import tree_hash,eda_summary,summarize
from .study_metrics import choose
from .scoring import score
from . import artifacts

def candidate(source,trial,task,model,budget,design,evaluate_fn,settings):
    source=Path(source);trial=Path(trial);task=Path(task)
    (trial/'.resume-claimed').mkdir() # Exclusive claim; no automatic double execution.
    started=time.monotonic();old=load(source/'result.json')
    record={k:old[k] for k in ['candidate_id','parent_rtl_hash','prompt_sha256']}
    record.update(started_at=datetime.datetime.now(datetime.timezone.utc).isoformat(),
                  continuation_of=str(source),prior_total_wall_s=old['total_wall_s'])
    try:
        if sha(task/'fixed-prompt.md')!=record['prompt_sha256']:raise ValueError('Frozen prompt changed')
        a=agent(task,design,'timing',trial/'rtl',(task/'fixed-prompt.md').read_text(),model,budget,
                trial/'agent',evaluate_fn,resume_from=source/'agent')
        record['agent']=a
        if a['status']=='failed':raise ValueError('Agent failed: '+a.get('error','unknown'))
        evaluate_fn(task,design,'timing',trial/'rtl',trial/'evaluation')
        record['report']=load(trial/'evaluation/report.json')
    except Exception as exc:record.update(error=str(exc)[:1200],report={'status':'failed','formal_status':None,'feasible':False})
    out=trial.parents[5]
    record.update(final_rtl_hash=tree_hash(trial/'rtl'),continuation_wall_s=time.monotonic()-started,
                  finished_at=datetime.datetime.now(datetime.timezone.utc).isoformat(),eda=eda_summary(trial),
                  rtl=str((trial/'rtl').relative_to(out)))
    record['total_wall_s']=old['total_wall_s']+record['continuation_wall_s']
    save(trial/'result.json',record)
    try:artifacts.compress_agent(trial/'agent',settings)
    except Exception as exc:record['agent_compression_error']=str(exc)[:500];save(trial/'result.json',record)
    return record

def run(output,cache_dir,expected_model_id='deepseek'):
    out=Path(output);cfg=load(out/'study.json');state=load(out/'state.json')
    if state['status']!='prepared':raise ValueError('Continuation is not in prepared state')
    identities={'deepseek':'deepseek-v4-pro','kimi':'k3.1-pro'}
    if expected_model_id not in identities or len(cfg['models'])!=1 or cfg['models'][0]['id']!=expected_model_id or cfg['rounds']!=1 or cfg['objectives']!=['timing']:
        raise ValueError('Only the explicitly authorized model first timing round may continue')
    model=cfg['models'][0]
    if model['model']!=identities[expected_model_id]:raise ValueError('Unexpected continuation model')
    if model['max_concurrent_requests']!=5:raise ValueError('API concurrency must remain five')
    design=next(iter(cfg['designs']));task=out/'tasks'/design/'timing';verify_assets(task)
    chain=out/'chains'/expected_model_id/design/'timing';rounddir=chain/'round-001'
    source=Path(state['continuation_of']);source_round=source/'chains'/expected_model_id/design/'timing/round-001'
    actions=load(out/'candidate-actions.json') if (out/'candidate-actions.json').exists() else None
    if actions is not None and (set(actions)!={f'candidate-{i:02d}' for i in range(5)} or
                               set(actions.values())-{'resume','preserve_completed'}):
        raise ValueError('Invalid candidate continuation plan')
    initial=load(out/'qualification'/design/'timing/report.json')['baseline']
    settings=artifacts.policy(task);evaluate_fn=partial(evaluate,cache_dir=cache_dir)
    state.update(status='running',model_calls_started=actions is None or 'resume' in actions.values(),
                 started_at=datetime.datetime.now(datetime.timezone.utc).isoformat())
    save(out/'state.json',state);start=time.monotonic()
    try:
        def work(i):
            name=f'candidate-{i:02d}'
            if actions and actions[name]=='preserve_completed':
                old=load(source_round/name/'result.json');copied=load(rounddir/name/'result.json')
                if old!=copied or tree_hash(rounddir/name/'rtl')!=old['final_rtl_hash']:
                    raise ValueError('Preserved completed candidate changed')
                return copied
            return candidate(source_round/name,rounddir/name,task,model,cfg['budget'],design,evaluate_fn,settings)
        with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:records=list(pool.map(work,range(5)))
        best=choose(records,'timing',initial,cfg['promotion_delay_epsilon_ns'],cfg['promotion_area_epsilon_um2'])
        incumbent=chain/'initial-rtl';metrics=initial
        if best:
            incumbent=rounddir/'selected-rtl';shutil.copytree(out/best['rtl'],incumbent)
            if tree_hash(incumbent)!=best['final_rtl_hash']:raise ValueError('Selected RTL hash mismatch')
            metrics=best['report']['candidate']
        inp=load(rounddir/'input.json')
        summary={'round':1,'parent_rtl_hash':inp['parent_rtl_hash'],'prompt_sha256':inp['prompt_sha256'],
                 'selected_candidate':best['candidate_id'] if best else None,'retained_previous':best is None,
                 'incumbent_rtl':str(incumbent.relative_to(out)),'incumbent_rtl_hash':tree_hash(incumbent),
                 'incumbent_metrics':metrics,'candidates':records,'continuation_of':str(source_round)}
        save(rounddir/'round.json',summary)
        save(chain/'progress.json',{'completed_rounds':1,'incumbent_rtl':summary['incumbent_rtl'],
             'incumbent_rtl_hash':summary['incumbent_rtl_hash'],'metrics':metrics,'prompt_sha256':inp['prompt_sha256'],
             'round_file':str((rounddir/'round.json').relative_to(out)),'round_sha256':sha(rounddir/'round.json')})
        task_cfg=load(task/f'configs/tasks/{design}.timing.json')
        record={'model_id':expected_model_id,'requested_model':model['model'],'design':design,'objective':'timing',
                'initial':initial,'final':metrics,'rounds_completed':1,'continuation_of':str(source),
                'improvement':1-metrics['effective_delay_ns']/initial['effective_delay_ns'],
                'incumbent_rtl':summary['incumbent_rtl'],'prompt_sha256':inp['prompt_sha256'],
                'grade':score('timing',initial,metrics,{**task_cfg['scoring'],'target_period_ns':task_cfg['period_ns']})}
        save(chain/'summary.json',record);state.update(status='completed',chains=[record])
    except Exception as exc:state.update(status='failed',error=str(exc)[:1500])
    state.update(finished_at=datetime.datetime.now(datetime.timezone.utc).isoformat(),wall_s=time.monotonic()-start)
    save(out/'state.json',state);summarize(out);return state
