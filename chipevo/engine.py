from pathlib import Path
import json,shutil,tempfile,datetime,math,re,hashlib
from .util import load,save,sha,inside
from .toolchain import resolve,verify_runtime
from .policy import validate,safe_tree
from .scoring import score,feasible
from .eda.synthesis import synthesize
from .eda.sta import analyze
from . import artifacts
from .baseline_cache import BaselineCache,fingerprint,capture,restore

def asset_manifest(root):
    root=Path(root)
    paths=[]
    for folder in ['designs','technology','configs','chipevo','grading']:
        for p in (root/folder).rglob('*'):
            if p.name=='assets.sha256.json':continue
            excluded=folder=='designs' and any(x in p.relative_to(root/folder).parts for x in ['rtl','tb','model','provenance','licenses'])
            if p.is_file() and '__pycache__' not in p.parts and p.suffix!='.pyc' and not excluded:paths.append(p)
    runtime_manifest=root/'tools/runtime/FILES.sha256.json'
    if runtime_manifest.is_file():paths.append(runtime_manifest)
    return {str(p.relative_to(root)):sha(p) for p in sorted(paths)}

def verify_assets(root):
    root=Path(root);expected=load(root/'configs/assets.sha256.json')
    for rel,h in expected.items():
        if sha(root/rel)!=h:raise RuntimeError('Trusted evaluator asset changed: '+rel)
    if asset_manifest(root)!=expected:raise RuntimeError('Trusted evaluator asset inventory changed')
    verify_runtime(root)

def task(root,design,objective):
    if not re.fullmatch(r'[a-z0-9_-]+',design) or objective not in ['timing','area']:raise ValueError('Invalid task identity')
    root=Path(root);cfg=load(root/f'configs/tasks/{design}.{objective}.json')
    if cfg['design']!=design or cfg['objective']!=objective:raise ValueError('Mismatched task configuration')
    for value in [cfg['period_ns'],cfg['synthesis_timeout_s'],cfg['sta_timeout_s'],cfg['scoring']['max_area_ratio'],cfg['scoring']['max_delay_ratio'],cfg['scoring']['full_score_improvement']]:
        if isinstance(value,bool) or not isinstance(value,(int,float)) or not math.isfinite(value) or value<=0:raise ValueError('Task thresholds/time budgets must be finite and positive')
    return cfg

def stage(root,design,rtl,destination):
    root=Path(root);source=root/'designs'/design;destination=Path(destination)
    rtl=safe_tree(rtl)
    if destination.exists():raise ValueError('Refusing to overwrite a run directory')
    destination.mkdir(parents=True);(destination/'build').mkdir()
    shutil.copytree(rtl,destination/'rtl');shutil.copytree(source/'reference',destination/'reference')
    shutil.copytree(source/'constraints',destination/'constraints');shutil.copy2(source/'manifest.json',destination/'manifest.json')
    return destination

def seed_reference_candidate(root,design,destination):
    """Copy reference RTL into candidate layout without weakening protected hashes."""
    source=Path(root)/'designs'/design;destination=Path(destination)
    if destination.exists():raise ValueError('Candidate seed destination already exists')
    shutil.copytree(source/'reference',destination)
    policy=load(source/'policy.json');expected=policy['file_sha256'].get('files.f')
    filelist=destination/'files.f'
    if expected and filelist.is_file() and sha(filelist)!=expected:
        canonical=''.join(path+'\n' for path in load(source/'manifest.json')['sources'])
        if 'files.f' in policy['editable_files'] or hashlib.sha256(canonical.encode()).hexdigest()!=expected:
            raise ValueError('Cannot adapt reference file list to the frozen candidate contract')
        filelist.write_text(canonical,encoding='utf-8')
    checked=validate(source,destination)
    if checked['changed_files']:raise ValueError('Reference seed differs from the frozen initial RTL')
    return destination

def evaluate(root,design,objective,candidate,output,*,cache_dir=None,retention=None,defer_cleanup=False,use_cache=None):
    """Prove every candidate; reuse only verified, evaluator-built baseline metrics."""
    root=Path(root).resolve();output=Path(output).resolve();candidate=safe_tree(candidate)
    if output.is_relative_to(candidate) or candidate.is_relative_to(output):raise ValueError('Candidate RTL and evaluation output must not overlap')
    if output.exists():raise ValueError('Use a fresh evaluation output directory')
    cfg=task(root,design,objective);verify_assets(root);tools=resolve(root);settings=artifacts.policy(root)
    if retention not in [None,'compact','diagnostic','full']:raise ValueError('Invalid retention override')
    if use_cache is not None and not isinstance(use_cache,bool):raise ValueError('use_cache must be a boolean')
    enabled=settings['baseline_cache']['enabled'] if use_cache is None else use_cache
    cache_path=Path(cache_dir) if cache_dir is not None else root/'.cache/baselines'
    if cache_path.resolve().is_relative_to(candidate) or cache_path.resolve().is_relative_to(output):
        raise ValueError('Baseline cache must be outside candidate RTL and evaluation output')
    report={'design':design,'objective':objective,'status':'running','config':cfg,'baseline':None,'candidate':None}
    output.mkdir(parents=True)
    artifacts.mark(output)
    try:
        report['policy']=validate(root/'designs'/design,candidate)
        before=sha(root/f'configs/tasks/{design}.{objective}.json')
        candidate_work=stage(root,design,candidate,output/'candidate')
        from .eda.formal import prove
        prove(candidate_work,tools['yosys'])
        proof=load(candidate_work/'build/hierproof-v6/result.json')
        report['formal_status']=proof['status']
        report['formal_contract']={k:proof.get(k) for k in ['proof_recipe','method','scope','count','initial_state_contracts','unconnected_inputs','module']}
        if proof['status']!='PASS':raise ValueError('Candidate equivalence was not proven; see proof logs')
        produced=None
        key,inputs=fingerprint(root,design,objective,cfg['period_ns'])
        def measure_baseline():
            nonlocal produced
            work=stage(root,design,root/'designs'/design/'reference',output/'baseline')
            synthesize(root,work,tools,objective,cfg['period_ns'],cfg['synthesis_timeout_s'])
            analyze(root,work,tools,cfg['period_ns'],cfg['sta_timeout_s'])
            metrics=load(work/'build/metrics.json')
            # Localization consumes the big mapped JSON once, BEFORE pruning.
            # Persist compact evidence so cache hits/compacted runs still localize.
            from .localization import context
            evidence_errors={}
            for strategy in ['hierarchy_area','timing_module','timing_syntax']:
                try:save(work/'build'/('localization-'+strategy+'.json'),context(root,design,strategy,work))
                except Exception as exc:evidence_errors[strategy]=str(exc)[:500]
            verify_assets(root)
            if fingerprint(root,design,objective,cfg['period_ns'])[0]!=key:
                raise ValueError('Baseline inputs changed while measuring')
            produced={'metrics':metrics,'files':capture(work/'build'),'localization_errors':evidence_errors}
            return produced
        if enabled:
            try:cache=BaselineCache(cache_path,settings['baseline_cache']['max_entries'],settings['baseline_cache']['max_bytes'])
            except (OSError,ValueError) as exc:
                payload=measure_baseline();cache_info={'hit':False,'disabled_reason':str(exc)[:500],'key':key}
            else:
                try:payload,cache_info=cache.get_or_build(key,inputs,measure_baseline)
                except OSError as exc:
                    payload=produced if produced is not None else measure_baseline()
                    cache_info={'hit':False,'write_or_lock_error':str(exc)[:500],'key':key}
        else:
            payload=measure_baseline();cache_info={'hit':False,'disabled':True,'key':key}
        report['baseline']=payload['metrics'];report['baseline_cache']=cache_info
        restore(output/'baseline/build',payload['files'])
        if load(output/'baseline/build/metrics.json')!=report['baseline']:
            raise ValueError('Published baseline metrics do not match trusted cache payload')
        save(output/'baseline/build/baseline-cache.json',cache_info)
        synthesize(root,candidate_work,tools,objective,cfg['period_ns'],cfg['synthesis_timeout_s'])
        analyze(root,candidate_work,tools,cfg['period_ns'],cfg['sta_timeout_s'])
        report['candidate']=load(candidate_work/'build/metrics.json')
        if report['baseline']['macro_instances']!=report['candidate']['macro_instances']:
            raise ValueError('Fixed SRAM macro instance counts changed')
        score_cfg={**cfg['scoring'],'target_period_ns':cfg['period_ns']}
        report['feasible'],report['constraint_reason']=feasible(objective,report['baseline'],report['candidate'],score_cfg)
        report['grade']=score(objective,report['baseline'],report['candidate'],score_cfg)
        if sha(root/f'configs/tasks/{design}.{objective}.json')!=before:raise ValueError('Task configuration changed during evaluation')
        verify_assets(root);report['status']='evaluated'
    except Exception as e:
        report['status']='failed';report['error']=str(e)
        report['grade']={'resolved':False,'score':0.0,'reason':str(e)[:1200]}
    save(output/'report.json',report)
    if not defer_cleanup:
        try:report['retention']=artifacts.retain(output,report['status'],settings,retention)
        except Exception as exc:report['retention_error']=str(exc)[:1000]
        save(output/'report.json',report)
    return report
