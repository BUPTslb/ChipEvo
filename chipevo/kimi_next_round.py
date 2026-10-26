"""One explicitly requested next timing round, seeded from published winners.

The previous study is read-only. Agent prompts, budgets, evaluator and scoring
stay frozen; only the input RTL and round number advance.
"""
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

def published_parent(output,design,expected_round=1):
    out=Path(output).resolve();chain=out/'chains/kimi'/design/'timing'
    cfg=load(out/'study.json');state=load(out/'state.json')
    if state['status']!='completed':raise ValueError('Previous study has not completed')
    if cfg['objectives']!=['timing'] or list(cfg['designs'])!=[design] or len(cfg['models'])!=1:
        raise ValueError('Unexpected source study scope')
    model=cfg['models'][0]
    if model['id']!='kimi' or model['model']!='k3.1-pro':raise ValueError('Unexpected parent model')
    p=load(chain/'progress.json')
    if p['completed_rounds']!=expected_round:raise ValueError('Wrong published parent round')
    roundfile=(out/p['round_file']).resolve();rtl=(out/p['incumbent_rtl']).resolve()
    if not roundfile.is_relative_to(chain) or not rtl.is_relative_to(chain):raise ValueError('Parent escaped its chain')
    if sha(roundfile)!=p['round_sha256'] or tree_hash(rtl)!=p['incumbent_rtl_hash']:
        raise ValueError('Published parent checksum mismatch')
    rd=load(roundfile);inp=load(roundfile.parent/'input.json')
    if rd['round']!=expected_round:raise ValueError('Round number mismatch')
    for key in ['incumbent_rtl','incumbent_rtl_hash','prompt_sha256']:
        if rd[key]!=p[key]:raise ValueError('Round/progress mismatch: '+key)
    if rd['incumbent_metrics']!=p['metrics']:raise ValueError('Parent metrics mismatch')
    task=out/'tasks'/design/'timing'
    if sha(task/'fixed-prompt.md')!=p['prompt_sha256']:raise ValueError('Parent prompt changed')
    files=sorted(roundfile.parent.glob('candidate-*/result.json'))
    if len(files)!=5:raise ValueError('Previous round must have five final candidate records')
    records=[load(f) for f in files]
    if records!=rd['candidates']:raise ValueError('Published candidates differ from final records')
    best=choose(records,'timing',inp['parent_metrics'],cfg['promotion_delay_epsilon_ns'],cfg['promotion_area_epsilon_um2'])
    if (best['candidate_id'] if best else None)!=rd['selected_candidate']:
        raise ValueError('Published winner is not the best valid candidate')
    if best:
        candidate=(out/best['rtl']).resolve()
        if not candidate.is_relative_to(roundfile.parent):raise ValueError('Winner escaped round')
        if tree_hash(candidate)!=best['final_rtl_hash'] or best['final_rtl_hash']!=p['incumbent_rtl_hash']:
            raise ValueError('Selected RTL differs from evaluated winner')
        if best['report']['candidate']!=p['metrics']:raise ValueError('Winner metrics differ')
    elif p['incumbent_rtl_hash']!=inp['parent_rtl_hash'] or p['metrics']!=inp['parent_metrics']:
        raise ValueError('No-winner fallback changed the incumbent')
    return {'source_study':str(out),'source_round_file':str(roundfile),'source_round_sha256':sha(roundfile),
            'source_progress_sha256':sha(chain/'progress.json'),'round':expected_round,
            'selected_candidate':rd['selected_candidate'],'rtl':str(rtl),'rtl_hash':p['incumbent_rtl_hash'],
            'metrics':p['metrics'],'prompt_sha256':p['prompt_sha256']}

def seed_round(out,design,parent,number=2):
    out=Path(out);chain=out/'chains/kimi'/design/'timing';rd=chain/f'round-{number:03d}'
    if number!=parent['round']+1:raise ValueError('Next round must follow the published parent')
    source=chain/'parent-rtl'
    if tree_hash(source)!=parent['rtl_hash']:raise ValueError('Parent copy hash mismatch')
    rd.mkdir()
    save(rd/'input.json',{'round':number,'parent_rtl':str(source.relative_to(out)),'parent_rtl_hash':parent['rtl_hash'],
         'parent_metrics':parent['metrics'],'source_round_file':parent['source_round_file'],
         'source_round_sha256':parent['source_round_sha256'],'prompt_sha256':parent['prompt_sha256'],
         'prompt_file':str((out/'tasks'/design/'timing/fixed-prompt.md').relative_to(out))})
    for i in range(5):
        trial=rd/f'candidate-{i:02d}';trial.mkdir();shutil.copytree(source,trial/'rtl')
        if tree_hash(trial/'rtl')!=parent['rtl_hash']:raise ValueError('Candidate seed hash mismatch')
        save(trial/'start.json',{'round':number,'candidate_id':i,'parent_rtl_hash':parent['rtl_hash'],
             'prompt_sha256':parent['prompt_sha256'],'source_round':parent['round'],
             'round_input_file':str((rd/'input.json').relative_to(out)),'round_input_sha256':sha(rd/'input.json'),
             'conversation':'fresh; no prior agent context inherited'})
    return rd

def candidate(out,trial,task,design,model,budget,evaluate_fn,settings):
    trial=Path(trial);out=Path(out);task=Path(task)
    (trial/'.round-claimed').mkdir()
    start=load(trial/'start.json');t=time.monotonic()
    record={k:start[k] for k in ['candidate_id','parent_rtl_hash','prompt_sha256','round']}
    record['started_at']=datetime.datetime.now(datetime.timezone.utc).isoformat()
    try:
        if tree_hash(trial/'rtl')!=start['parent_rtl_hash']:raise ValueError('Starting RTL changed')
        if sha(task/'fixed-prompt.md')!=start['prompt_sha256']:raise ValueError('Frozen prompt changed')
        a=agent(task,design,'timing',trial/'rtl',(task/'fixed-prompt.md').read_text(),model,budget,trial/'agent',evaluate_fn)
        record['agent']=a
        if a['status']=='failed':raise ValueError('Agent failed: '+a.get('error','unknown'))
        evaluate_fn(task,design,'timing',trial/'rtl',trial/'evaluation')
        record['report']=load(trial/'evaluation/report.json')
    except Exception as exc:record.update(error=str(exc)[:1200],report={'status':'failed','formal_status':None,'feasible':False})
    record.update(final_rtl_hash=tree_hash(trial/'rtl'),total_wall_s=time.monotonic()-t,
                  finished_at=datetime.datetime.now(datetime.timezone.utc).isoformat(),eda=eda_summary(trial),
                  rtl=str((trial/'rtl').relative_to(out)))
    save(trial/'result.json',record)
    try:artifacts.compress_agent(trial/'agent',settings)
    except Exception as exc:record['agent_compression_error']=str(exc)[:500];save(trial/'result.json',record)
    return record

def run(output,cache_dir):
    out=Path(output);cfg=load(out/'study.json');state=load(out/'state.json');parent=load(out/'parent.json')
    if state['status']!='prepared' or state['round']!=2:raise ValueError('Only prepared round two may start')
    if cfg['rounds']!=2 or cfg['objectives']!=['timing'] or len(cfg['models'])!=1 or len(cfg['designs'])!=1:
        raise ValueError('Unexpected next-round scope')
    model=cfg['models'][0];design=next(iter(cfg['designs']))
    if model['id']!='kimi' or model['model']!='k3.1-pro' or model['max_concurrent_requests']!=5:
        raise ValueError('Unexpected Kimi model or concurrency')
    task=out/'tasks'/design/'timing';verify_assets(task)
    if published_parent(parent['source_study'],design)!=parent:raise ValueError('Source parent changed')
    chain=out/'chains/kimi'/design/'timing';rd=chain/'round-002'
    if tree_hash(chain/'parent-rtl')!=parent['rtl_hash']:raise ValueError('Parent RTL changed')
    initial=load(out/'qualification'/design/'timing/report.json')['baseline']
    settings=artifacts.policy(task);evaluate_fn=partial(evaluate,cache_dir=cache_dir)
    state.update(status='running',model_calls_started=True,started_at=datetime.datetime.now(datetime.timezone.utc).isoformat())
    save(out/'state.json',state);started=time.monotonic()
    try:
        with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:
            records=list(pool.map(lambda i:candidate(out,rd/f'candidate-{i:02d}',task,design,model,cfg['budget'],evaluate_fn,settings),range(5)))
        # Promotion compares against round one's incumbent, not the initial baseline.
        best=choose(records,'timing',parent['metrics'],cfg['promotion_delay_epsilon_ns'],cfg['promotion_area_epsilon_um2'])
        incumbent=chain/'parent-rtl';metrics=parent['metrics']
        if best:
            incumbent=rd/'selected-rtl';shutil.copytree(out/best['rtl'],incumbent)
            if tree_hash(incumbent)!=best['final_rtl_hash']:raise ValueError('Winner hash mismatch')
            metrics=best['report']['candidate']
        summary={'round':2,'parent_rtl_hash':parent['rtl_hash'],'prompt_sha256':parent['prompt_sha256'],
                 'selected_candidate':best['candidate_id'] if best else None,'retained_previous':best is None,
                 'incumbent_rtl':str(incumbent.relative_to(out)),'incumbent_rtl_hash':tree_hash(incumbent),
                 'incumbent_metrics':metrics,'candidates':records,'source_round_file':parent['source_round_file']}
        save(rd/'round.json',summary)
        save(chain/'progress.json',{'completed_rounds':2,'incumbent_rtl':summary['incumbent_rtl'],
             'incumbent_rtl_hash':summary['incumbent_rtl_hash'],'metrics':metrics,'prompt_sha256':parent['prompt_sha256'],
             'round_file':str((rd/'round.json').relative_to(out)),'round_sha256':sha(rd/'round.json')})
        task_cfg=load(task/f'configs/tasks/{design}.timing.json')
        record={'model_id':'kimi','requested_model':model['model'],'design':design,'objective':'timing',
                'initial':initial,'previous':parent['metrics'],'final':metrics,'rounds_completed':2,
                'rounds_executed_in_this_directory':[2],'prior_study':parent['source_study'],
                'improvement':1-metrics['effective_delay_ns']/initial['effective_delay_ns'],
                'round_improvement':1-metrics['effective_delay_ns']/parent['metrics']['effective_delay_ns'],
                'incumbent_rtl':summary['incumbent_rtl'],'prompt_sha256':parent['prompt_sha256'],
                'grade':score('timing',initial,metrics,{**task_cfg['scoring'],'target_period_ns':task_cfg['period_ns']})}
        save(chain/'summary.json',record);state.update(status='completed',chains=[record])
    except Exception as exc:state.update(status='failed',error=str(exc)[:1500])
    state.update(finished_at=datetime.datetime.now(datetime.timezone.utc).isoformat(),wall_s=time.monotonic()-started)
    save(out/'state.json',state);summarize(out);return state
