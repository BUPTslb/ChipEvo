from pathlib import Path
import argparse,json,uuid
from .util import save

def main():
    p=argparse.ArgumentParser(description='ChipEvo: nothing launches an experiment implicitly')
    p.add_argument('--root',default=str(Path(__file__).resolve().parents[1]))
    sub=p.add_subparsers(dest='command',required=True)
    sub.add_parser('doctor',help='Verify native files and print version strings; no EDA workload')
    c=sub.add_parser('context',help='Read existing localization evidence; no synthesis')
    c.add_argument('--design',required=True);c.add_argument('--strategy',choices=['hierarchy_area','timing_module','timing_syntax'],default='hierarchy_area');c.add_argument('--run');c.add_argument('--output')
    e=sub.add_parser('evaluate',help='Explicitly run equivalence, baseline/candidate synthesis and STA')
    e.add_argument('--design',required=True);e.add_argument('--objective',choices=['area','timing'],required=True);e.add_argument('--candidate',required=True);e.add_argument('--output');e.add_argument('--run-eda',action='store_true')
    e.add_argument('--retention',choices=['compact','diagnostic','full'],help='Override evaluator artifact retention for this evaluation')
    e.add_argument('--no-baseline-cache',action='store_true',help='Remeasure the baseline; candidate always remeasured')
    b=sub.add_parser('package-grader',help='Create trusted upload bundle; does not run tools')
    b.add_argument('--output',default='dist/chipevo_grader.tar.gz')
    b=sub.add_parser('package-deployment',help='Package clean project without history or experiment outputs')
    b.add_argument('--output',default='dist/ChipEvo-deployment.tar.gz')
    q=sub.add_parser('prompt',help='Render a prompt from task config and existing module index; no model call')
    q.add_argument('--design',required=True);q.add_argument('--objective',choices=['area','timing'],required=True);q.add_argument('--eda-feedback-budget',type=int,default=0);q.add_argument('--output',required=True)
    q.add_argument('--run',help='Read localization evidence from an existing evaluation; never launches EDA')
    q.add_argument('--strategy',choices=['hierarchy_area','timing_module','timing_syntax'],help='Explicit localization ablation; default comes from task objective')
    sp=sub.add_parser('study-plan',help='Validate and print experiment matrix; no model or EDA work')
    sp.add_argument('--config',required=True)
    sr=sub.add_parser('study-run',help='Explicitly execute a configured isolated best-of-five study')
    sr.add_argument('--config',required=True);sr.add_argument('--output',required=True)
    sr.add_argument('--run-model',action='store_true');sr.add_argument('--run-eda',action='store_true')
    ss=sub.add_parser('study-report',help='Summarize existing study records only')
    ss.add_argument('--output',required=True)
    ce=sub.add_parser('candidate-bundle',help='Export one qualified objective and RTL only; no grader, reference, secrets, or experiments')
    ce.add_argument('--task-root',required=True);ce.add_argument('--design',required=True);ce.add_argument('--candidate',required=True);ce.add_argument('--output',required=True)
    a=p.parse_args();root=Path(a.root).resolve()
    if a.command=='candidate-bundle':
        from .candidate_bundle import export
        print(export(a.task_root,a.design,a.candidate,a.output));return
    if a.command=='study-plan':
        from .study_config import read_config,plan
        print(json.dumps(plan(read_config(a.config)),ensure_ascii=False,indent=2));return
    if a.command=='study-run':
        if not a.run_model or not a.run_eda:p.error('Study requires explicit --run-model and --run-eda; nothing launched')
        from .study import run
        result=run(a.config,root,a.output,a.run_model,a.run_eda)
        print(json.dumps({'status':result['status'],'report':str(Path(a.output)/'report.json')},ensure_ascii=False))
        if result['status']!='completed':raise SystemExit(1)
        return
    if a.command=='study-report':
        from .study import summarize
        print(json.dumps(summarize(a.output),ensure_ascii=False,indent=2));return
    if a.command=='doctor':
        from .toolchain import doctor
        print(json.dumps(doctor(root),indent=2));return
    if a.command=='context':
        from .localization import context
        result=context(root,a.design,a.strategy,a.run)
        if a.output:save(a.output,result)
        else:print(json.dumps(result,indent=2))
        return
    if a.command=='prompt':
        from .prompting import render
        text,evidence=render(root,a.design,a.objective,a.eda_feedback_budget,a.run,a.strategy)
        destination=Path(a.output);destination.parent.mkdir(parents=True,exist_ok=True)
        destination.write_text(text,encoding='utf-8')
        save(destination.with_suffix('.context.json'),evidence)
        print(a.output);return
    if a.command=='evaluate':
        if not a.run_eda:p.error('Evaluation requires explicit --run-eda; no tools were launched')
        from .engine import evaluate
        out=Path(a.output) if a.output else root/'artifacts/runs'/uuid.uuid4().hex
        result=evaluate(root,a.design,a.objective,a.candidate,out,retention=a.retention,use_cache=False if a.no_baseline_cache else None)
        report=root/'reports'/f'{out.name}.json';save(report,result)
        print(json.dumps({'grade':result['grade'],'artifacts':str(out),'report':str(report)},indent=2));return
    if a.command=='package-grader':
        from .packaging import package
        print(package(root,root/a.output))
    if a.command=='package-deployment':
        from .packaging import deployment
        print(deployment(root,root/a.output))
