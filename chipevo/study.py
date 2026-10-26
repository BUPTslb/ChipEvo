"""Explicit best-of-five RTL evolution with host-mediated model isolation."""
from pathlib import Path
import concurrent.futures,shutil,time,json,hashlib,os,collections,datetime
from functools import partial
from .util import load,save,sha
from .study_config import read_config,plan
from .study_metrics import choose,sum_usage
from .engine import evaluate,asset_manifest,verify_assets,seed_reference_candidate
from .localization import context
from .prompting import compact
from .prompt_contract import BASELINE_SECTION,LANGUAGE_RULE,english_prompt
from .rollout import agent
from . import artifacts

def tree_hash(directory):
    directory=Path(directory);h=hashlib.sha256()
    for p in sorted(directory.rglob('*')):
        if p.is_symlink():raise ValueError('RTL snapshots may not contain symlinks')
        if p.is_file():h.update(str(p.relative_to(directory)).encode());h.update(bytes.fromhex(sha(p)))
    return h.hexdigest()

def eda_summary(directory):
    rows=[]
    for p in Path(directory).rglob('*.status.json'):
        d=load(p)
        if 'seconds' in d:rows.append({'path':str(p.relative_to(directory)),'seconds':d['seconds'],'exit_code':d.get('exit_code')})
    return {'processes':rows,'summed_process_wall_s':sum(r['seconds'] for r in rows),
            'note':'Summed process durations may overlap; not elapsed wall time or CPU time. Baseline remeasurement overhead included and separately labeled by path.'}

def fixed_prompt(cfg,design,objective,task_cfg,evidence,baseline):
    period=task_cfg['period_ns'];frequency=1000/period
    goal=(f'Minimize evaluation delay D under the fixed synthesis target of {frequency:g} MHz ({period:g} ns). Setup violations may remain at this aggressive target; do not stop merely because a frequency target has been met. Total area must not exceed {task_cfg["scoring"]["max_area_ratio"]:g} times the initial baseline area.'
          if objective=='timing' else
          f'Minimize total mapped area at the fixed target of {frequency:g} MHz ({period:g} ns). The candidate must satisfy setup requirements at this frequency. You may spend the initial timing margin; delay need not improve over the initial baseline. Additional frequency improvement does not earn area reward.')
    budget=cfg['budget']
    text=f'''Optimize the non-storage RTL of {design}. Objective: {objective}.
{LANGUAGE_RULE}
{goal}
D = the fixed clock period minus the worst ordinary same-clock setup slack. It is not the number of output latency cycles.
Preserve functionality, ports, parameters, state correspondence, reset behavior, and cycle behavior. Do not add pipeline cycles or change hierarchy or state encoding.
Memory implementation, capacity, ports, masks, initialization, and read/write latency are fixed. Clock, CDC, and reset synchronizers are fixed.
Preserve the file list, module set, and submodule instance set. There is no default two-file or 200-line edit limit.
Read and modify only your own candidate RTL through list_sources, read_source, search_source, and apply_edits.
Tools enforce protection rules. You cannot access grading code, reference RTL, other candidates, other models, or other objectives.
Do not worsen hold or special timing checks relative to the initial baseline. See the protection summary below.
Submit actual RTL changes through apply_edits. A final textual explanation is not an RTL submission.
API request limit for this candidate: {budget.get('max_api_calls') or 'unlimited'}. Tool-call limit: {budget.get('max_tool_calls') or 'unlimited'}.
Each response is limited to {budget['max_output_tokens']} output tokens. No in-candidate EDA feedback is available.
Analyze the supplied baseline and previous-round evidence, choose a concrete optimization, edit the RTL, and submit.
Multiple file edits are allowed before submission. Do not request evaluation or wait for new timing/proof feedback.
Submission ends this candidate. The host freezes and evaluates the submitted RTL; results are used only for selection and the next round.
The model configuration controls the context window. The shared working-input budget is {budget['max_estimated_input_tokens']} estimated tokens, calibrated using reported usage.
Each read returns at most {budget['max_read_lines']} lines / {budget['max_source_result_chars']} characters. Cumulative source-read limit: {budget.get('max_source_chars') or 'unlimited'}.
Under context pressure, large tool results are offloaded and older history is summarized by the same model while recent interactions are retained. Summary calls count toward consumption.
Use recall_history to page through this candidate's offloaded history. Current source files are authoritative and may be read again.
The external evaluator performs evaluation after submission, without returning results to this candidate.
Each round starts from the current best RTL, but each candidate has a fresh conversation. Localization hints come from the initial baseline; search current source because line numbers may have shifted.
Preserve all legal input behaviors. Do not exploit test cases, undefined inputs, or fabricated results.
'''
    text+=BASELINE_SECTION+json.dumps(baseline,ensure_ascii=False,indent=2)
    text+='\nFixed localization hints:\n'+json.dumps(compact(evidence),ensure_ascii=False,indent=2)
    return english_prompt(text)

def snapshot(root,out,cfg):
    """Copy trusted assets once; model tools never expose this directory."""
    common=out/'trusted-assets';common.mkdir()
    for name in ['chipevo','technology','tools/runtime']:
        shutil.copytree(root/name,common/name,**({} if name=='tools/runtime' else {'ignore':shutil.ignore_patterns('__pycache__','*.pyc')}))
    (common/'configs').mkdir();shutil.copy2(root/'configs/toolchain.json',common/'configs/toolchain.json')
    if (root/'configs/artifacts.json').exists():shutil.copy2(root/'configs/artifacts.json',common/'configs/artifacts.json')
    for design in cfg['designs']:
        src=root/'designs'/design;dest=common/'designs'/design;dest.mkdir(parents=True)
        for name in ['reference','constraints','context']:shutil.copytree(src/name,dest/name)
        for name in ['manifest.json','policy.json']:shutil.copy2(src/name,dest/name)
    return common

def make_task(root,common,out,cfg,design,objective):
    target=out/'tasks'/design/objective;target.mkdir(parents=True)
    for name in ['chipevo','technology','tools/runtime']:
        shutil.copytree(common/name,target/name,copy_function=os.link)
    (target/'configs/tasks').mkdir(parents=True)
    shutil.copy2(common/'configs/toolchain.json',target/'configs/toolchain.json')
    if (common/'configs/artifacts.json').exists():shutil.copy2(common/'configs/artifacts.json',target/'configs/artifacts.json')
    shutil.copytree(common/'designs'/design,target/'designs'/design,copy_function=os.link)
    task_cfg=load(root/f'configs/tasks/{design}.{objective}.json')
    task_cfg['period_ns']=1000/cfg['designs'][design][objective+'_frequency_mhz']
    task_cfg['scoring']['delay_constraint']='period' if objective=='area' else 'baseline'
    task_cfg['study_id']=cfg['study_id'];task_cfg['qualification']='Must qualify this new frequency before starting model candidates'
    save(target/f'configs/tasks/{design}.{objective}.json',task_cfg)
    save(target/'configs/assets.sha256.json',asset_manifest(target))
    return target,task_cfg

def run(config,root,output,run_model=False,run_eda=False):
    if not run_model or not run_eda:raise ValueError('study-run requires explicit --run-model and --run-eda; nothing launched')
    cfg=read_config(config,ready=True);root=Path(root).resolve();out=Path(output).resolve()
    if out.exists():raise ValueError('Use a fresh study output directory; completed studies are never overwritten')
    # Check credentials before launching even baseline EDA.
    for model in cfg['models']:
        if not os.environ.get(model['api_key_env']):raise ValueError('Missing credential environment variable: '+model['api_key_env'])
    verify_assets(root);out.mkdir(parents=True);save(out/'study.json',cfg);save(out/'plan.json',plan(cfg))
    for model in cfg['models']:
        if model['protocol']=='anthropic_messages':
            from .provider_preflight import check
            check(model,cfg['budget'],out/('provider-preflight-'+model['id']+'.json'))
    common=snapshot(root,out,cfg);tasks={};started=time.monotonic();settings=artifacts.policy(root)
    # All models/tasks share the host's private, content-addressed baseline cache.
    evaluate_task=partial(evaluate,cache_dir=root/'.cache/baselines')
    state={'status':'qualifying','chains':[],'model_calls_started':False,'started_at':datetime.datetime.now(datetime.timezone.utc).isoformat()};save(out/'state.json',state)
    try:
        # Qualify all configured goals first: a failed area target must not silently start a partial comparison.
        for design in cfg['designs']:
            for objective in cfg.get('objectives',['timing','area']):
                task_root,task_cfg=make_task(root,common,out,cfg,design,objective)
                work=out/'qualification'/design/objective
                seed=seed_reference_candidate(task_root,design,task_root/'initial-rtl')
                evaluate_task(task_root,design,objective,seed,work)
                # The evaluator snapshots localization before pruning, including
                # when qualification fails. No unbounded deferred build survives.
                report=load(work/'report.json')
                if report['status']!='evaluated' or not report.get('feasible'):
                    raise ValueError('Baseline qualification failed at configured frequency: '+design+'/'+objective)
                evidence=context(task_root,design,'timing_module' if objective=='timing' else 'hierarchy_area',work)
                evidence.update(objective=objective,task_period_ns=task_cfg['period_ns'])
                timing=context(task_root,design,'timing_module',work)
                evidence['secondary_evidence']={'instruction':'Area contribution and critical-path risk under this fixed objective.',
                    'area_targets':sorted((r for r in evidence['module_index'] if not r.get('protected')),key=lambda r:r.get('exclusive_area_all_instances_um2',0),reverse=True)[:10],
                    'timing_targets':timing.get('timing_targets',[])[:10],'critical_paths':timing.get('critical_paths',[])}
                policy=load(task_root/'designs'/design/'policy.json')
                prompt=fixed_prompt(cfg,design,objective,task_cfg,evidence,report['baseline'])
                prompt+='\nProtection rules summary:\n'+json.dumps({k:policy[k] for k in ['editable_files','protected_modules','fixed_storage_modules']},ensure_ascii=False)
                english_prompt(prompt)
                (task_root/'fixed-prompt.md').write_text(prompt);save(task_root/'fixed-context.json',evidence)
                # Baseline metrics stay initial; all model chains share this same frozen goal/prompt.
                tasks[design,objective]=(task_root,prompt,report['baseline'])
        # Estimate retained evidence separately from five concurrent working sets.
        sizes={d+'/'+o:sum(p.stat().st_size for p in (out/'qualification'/d/o).rglob('*') if p.is_file()) for d,o in tasks}
        multiplier=cfg['rounds']*5*len(cfg['models'])*(1+cfg['budget']['max_eda_feedback_calls'])
        agent_bytes=cfg.get('storage',{}).get('estimated_agent_bytes_per_candidate',8*1024**2)
        count=cfg['rounds']*5*len(cfg['models'])*len(tasks)
        retained=sum(sizes.values())*multiplier+count*agent_bytes
        peak=max((load(out/'qualification'/d/o/'report.json').get('retention',{}).get('bytes_before',0) for d,o in tasks),default=0)*5
        estimate=retained+peak
        free=shutil.disk_usage(out).free;reserve=cfg.get('storage',{}).get('min_free_gib',10)*1024**3
        state['storage_estimate']={'baseline_artifact_bytes':sizes,'estimated_retained_bytes':retained,'estimated_concurrent_working_bytes':peak,'estimated_candidate_artifact_bytes':estimate,
            'free_bytes_before_model_calls':free,'reserve_bytes':reserve,
            'note':'Compact retained evidence plus five concurrent working sets and estimated agent logs; an estimate, not a hard quota. Candidate designs and unlimited API logs can grow.'}
        save(out/'state.json',state)
        if free<estimate+reserve:raise ValueError('Insufficient estimated disk capacity for retained study artifacts; no model calls started. See storage_estimate.')
        state['status']='running';save(out/'state.json',state)
        for model in cfg['models']:
            for design in cfg['designs']:
                for objective in cfg.get('objectives',['timing','area']):
                    task_root,_,_=tasks[design,objective]
                    initial=load(out/'qualification'/design/objective/'report.json')['baseline']
                    chain=out/'chains'/model['id']/design/objective;chain.mkdir(parents=True)
                    shutil.copytree(task_root/'initial-rtl',chain/'initial-rtl')
                    incumbent=chain/'initial-rtl';metrics=initial;rounds=[];prompt_hash=sha(task_root/'fixed-prompt.md')
                    save(chain/'progress.json',{'completed_rounds':0,'incumbent_rtl':str(incumbent.relative_to(out)),
                        'incumbent_rtl_hash':tree_hash(incumbent),'metrics':metrics,'prompt_sha256':prompt_hash})
                    for number in range(1,cfg['rounds']+1):
                        parent=load(chain/'progress.json')
                        incumbent=(out/parent['incumbent_rtl']).resolve();metrics=parent['metrics']
                        if not incumbent.is_relative_to(chain.resolve()) or tree_hash(incumbent)!=parent['incumbent_rtl_hash']:
                            raise ValueError('Published incumbent RTL path/hash mismatch')
                        if parent['completed_rounds']!=number-1 or parent['prompt_sha256']!=prompt_hash:
                            raise ValueError('Published round/prompt mismatch')
                        if shutil.disk_usage(out).free<peak+5*agent_bytes+reserve:
                            raise ValueError('Insufficient disk space for next isolated round; prior RTL/results preserved')
                        rounddir=chain/f'round-{number:03d}';rounddir.mkdir()
                        start_hash=tree_hash(incumbent);jobs=[]
                        save(rounddir/'input.json',{'round':number,'parent_rtl':str(incumbent.relative_to(out)),
                            'parent_rtl_hash':start_hash,'parent_metrics':metrics,'progress_sha256':sha(chain/'progress.json'),
                            'prompt_file':str((task_root/'fixed-prompt.md').relative_to(out)),'prompt_sha256':prompt_hash})
                        # All five copies are made BEFORE any candidate starts.
                        for idx in range(5):
                            trial=rounddir/f'candidate-{idx:02d}';trial.mkdir();shutil.copytree(incumbent,trial/'rtl')
                            save(trial/'start.json',{'parent_rtl_hash':start_hash,'prompt_sha256':prompt_hash,'candidate_id':idx,'round':number,
                                'round_input_file':str((rounddir/'input.json').relative_to(out)),'round_input_sha256':sha(rounddir/'input.json')})
                            jobs.append((idx,trial))
                        def candidate(job):
                            idx,trial=job;t=time.monotonic();record={'candidate_id':idx,'parent_rtl_hash':start_hash,'prompt_sha256':prompt_hash,'started_at':datetime.datetime.now(datetime.timezone.utc).isoformat()}
                            try:
                                if sha(task_root/'fixed-prompt.md')!=prompt_hash:raise ValueError('Frozen prompt changed')
                                candidate_prompt=(task_root/'fixed-prompt.md').read_text()
                                feedback={'round':number,'parent_metrics':metrics,'parent_rtl_hash':start_hash}
                                if rounds:
                                    feedback['previous_round']={'selected_candidate':rounds[-1]['selected_candidate'],'candidates':[{'candidate_id':v['candidate_id'],'status':v.get('report',{}).get('status'),'formal_status':v.get('report',{}).get('formal_status'),'grade':v.get('report',{}).get('grade')} for v in rounds[-1]['candidates']]}
                                save(trial/'round-feedback.json',feedback)
                                candidate_prompt+='\nRound input evidence (read-only):\n'+json.dumps(feedback,ensure_ascii=True)
                                (trial/'candidate-prompt.md').write_text(candidate_prompt)
                                agent(task_root,design,objective,trial/'rtl',candidate_prompt,model,cfg['budget'],trial/'agent',evaluate_task)
                                a=load(trial/'agent/agent.json')
                                record['agent']=a
                                record['delivery_status']=a['status']
                                if a['status']=='failed':
                                    record['agent_error']=a.get('error','unknown')
                                record['submission_rtl_hash']=tree_hash(trial/'rtl')
                                save(trial/'submission.json',{'rtl_hash':record['submission_rtl_hash'],'delivery_status':a['status'],'agent_error':record.get('agent_error')})
                                evaluate_task(task_root,design,objective,trial/'rtl',trial/'evaluation')
                                record['report']=load(trial/'evaluation/report.json')
                                if tree_hash(trial/'rtl')!=record['submission_rtl_hash']:raise ValueError('Submitted RTL changed during evaluation')
                            except Exception as e:record.update(error=str(e)[:1200],report={'status':'failed','formal_status':None,'feasible':False})
                            record.update(final_rtl_hash=tree_hash(trial/'rtl'),total_wall_s=time.monotonic()-t,finished_at=datetime.datetime.now(datetime.timezone.utc).isoformat(),
                                          eda=eda_summary(trial),rtl=str((trial/'rtl').relative_to(out)))
                            save(trial/'result.json',record)
                            try:artifacts.compress_agent(trial/'agent',settings)
                            except Exception as exc:record['agent_compression_error']=str(exc)[:500];save(trial/'result.json',record)
                            return trial/'result.json'
                        state['model_calls_started']=True;save(out/'state.json',state)
                        with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
                            result_files=list(executor.map(candidate,jobs))
                        candidates=[load(path) for path in result_files]
                        best=choose(candidates,objective,metrics,cfg['promotion_delay_epsilon_ns'],cfg['promotion_area_epsilon_um2'])
                        if best is not None:
                            promoted=rounddir/'selected-rtl';shutil.copytree(out/best['rtl'],promoted)
                            if tree_hash(promoted)!=best['final_rtl_hash']:raise ValueError('Selected RTL differs from evaluated RTL')
                            incumbent=promoted;metrics=best['report']['candidate']
                        if tree_hash(chain/'initial-rtl')!=tree_hash(task_root/'initial-rtl'):raise ValueError('Initial RTL snapshot changed')
                        summary={'round':number,'parent_rtl_hash':start_hash,'prompt_sha256':prompt_hash,
                                 'selected_candidate':best['candidate_id'] if best else None,'retained_previous':best is None,
                                 'incumbent_rtl':str(incumbent.relative_to(out)),'incumbent_rtl_hash':tree_hash(incumbent),
                                 'incumbent_metrics':metrics,'candidates':candidates}
                        rounds.append(summary);save(rounddir/'round.json',summary)
                        published=load(rounddir/'round.json')
                        save(chain/'progress.json',{'completed_rounds':published['round'],'incumbent_rtl':published['incumbent_rtl'],
                            'incumbent_rtl_hash':published['incumbent_rtl_hash'],'metrics':published['incumbent_metrics'],
                            'prompt_sha256':published['prompt_sha256'],'round_file':str((rounddir/'round.json').relative_to(out)),
                            'round_sha256':sha(rounddir/'round.json')})
                        incumbent=out/published['incumbent_rtl'];metrics=published['incumbent_metrics']
                    record={'model_id':model['id'],'requested_model':model['model'],'design':design,'objective':objective,
                            'initial':initial,'final':metrics,'rounds_completed':len(rounds),
                            'improvement':1-metrics['effective_delay_ns']/initial['effective_delay_ns'] if objective=='timing' else 1-metrics['total_area_um2']/initial['total_area_um2'],
                            'incumbent_rtl':str(incumbent.relative_to(out)),'prompt_sha256':prompt_hash}
                    from .scoring import score
                    final_cfg=load(task_root/f'configs/tasks/{design}.{objective}.json')
                    record['grade']=score(objective,initial,metrics,{**final_cfg['scoring'],'target_period_ns':final_cfg['period_ns']})
                    save(chain/'summary.json',record);state['chains'].append(record);save(out/'state.json',state)
        state.update(status='completed',wall_s=time.monotonic()-started)
    except Exception as e:state.update(status='failed',error=str(e)[:1500],wall_s=time.monotonic()-started)
    state['finished_at']=datetime.datetime.now(datetime.timezone.utc).isoformat()
    save(out/'state.json',state);summarize(out);return state

def summarize(out):
    out=Path(out);groups=collections.defaultdict(list)
    for p in sorted((out/'chains').glob('*/*/*/round-*/candidate-*/result.json')):
        model,design,objective=p.relative_to(out/'chains').parts[:3];groups[model,design,objective].append(load(p))
    rows=[]
    for (model,design,objective),records in groups.items():
        agents=[r.get('agent',{}) for r in records];usages=[a['usage'] for a in agents if 'usage' in a]
        usage={}
        for k in ['input_tokens','output_tokens','total_tokens','cached_input_tokens','cache_write_input_tokens','reasoning_tokens']:
            known=[u[k] for u in usages if u.get(k) is not None]
            usage[k]=sum(known) if known else None
            usage[k+'_complete']=len(usages)==len(records) and all(u.get(k+'_complete',False) for u in usages)
        row={'model_id':model,'design':design,'objective':objective,'candidates':len(records),
             'baseline_cache_hits':sum(bool(r['report'].get('baseline_cache',{}).get('hit')) for r in records),
             'baseline_cache_misses':sum(r['report'].get('baseline_cache',{}).get('hit') is False for r in records),
             'formal_pass':sum(r['report'].get('formal_status')=='PASS' for r in records),
             'feasible':sum(bool(r['report'].get('feasible')) for r in records),
             'resolved_candidates':sum(bool(r['report'].get('grade',{}).get('resolved')) for r in records),
             'failed_or_unproven':sum(r['report'].get('status')!='evaluated' for r in records),
             'api_calls_attempted':sum(a.get('api_calls_attempted',0) for a in agents),
             'api_calls_completed':sum(a.get('api_calls_completed',0) for a in agents),
             'api_queue_wait_s':sum(sum(a.get('api_queue_wait_s',[])) for a in agents),
             'api_queue_wait_total_s':sum(a.get('api_queue_wait_total_s',sum(a.get('api_queue_wait_s',[]))) for a in agents),
             'candidate_active_sum_s':sum(a.get('candidate_active_s',a.get('agent_wall_s',0)) for a in agents),
             'context_trimmed_requests':sum(c.get('removed_groups',0)>0 for a in agents for c in a.get('context_requests',[])),
             'context_limit_failures':sum('context_limit_exceeded' in a.get('error','') for a in agents),
             'compaction_api_calls':sum(a.get('api_purposes',[]).count('compaction') for a in agents),
             'context_recovery_api_calls':sum(a.get('api_purposes',[]).count('context_overflow_recovery') for a in agents),
             'source_chars_read':sum(a.get('source_chars_read',0) for a in agents),
             'unmetered_failed_requests':sum(a.get('unmetered_failed_requests',0) for a in agents),
             'tool_calls':sum(a.get('tool_calls',0) for a in agents),'tool_failures':sum(a.get('tool_failure',0) for a in agents),
             'eda_feedback_calls':sum(a.get('eda_feedback_calls',0) for a in agents),
             'candidate_wall_sum_s':sum(r.get('total_wall_s',0) for r in records),'usage':usage}
        summary=out/'chains'/model/design/objective/'summary.json'
        if summary.exists():row['optimization']=load(summary)
        events=[]
        for p in (out/'chains'/model/design/objective).glob('round-*/candidate-*/agent/tool-events.json'):events.extend(load(p))
        row['tools_by_name']={name:{'calls':sum(e['name']==name for e in events),
            'success':sum(e['name']==name and e['ok'] for e in events),
            'wall_s':sum(e['wall_s'] for e in events if e['name']==name)} for name in sorted({e['name'] for e in events})}
        rows.append(row)
    result={'groups':rows,'state':load(out/'state.json'),
            'comparison_notes':['Tokenizers and cache/reasoning accounting differ across providers; raw usage is retained.',
                'Five candidates share one parent RTL but no messages or tool outputs. Only a selected RTL crosses rounds.',
                'Missing usage is null/incomplete, never treated as free zero-cost inference.',
                'Only confirmed context overflow triggers one compaction/retry per turn; all attempts and summary usage count.',
                'Final resolved uses initial-baseline improvement; promotion uses strict improvement over incumbent.']}
    save(out/'report.json',result);return result
