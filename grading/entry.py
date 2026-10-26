"""Trusted code-grade entry. Candidate supplies RTL only, never metrics/code."""
from pathlib import Path
import argparse,json,sys,uuid,traceback

def main(objective):
    p=argparse.ArgumentParser()
    p.add_argument('--design',default=None);p.add_argument('--candidate-root',default='/workspace')
    p.add_argument('--trusted-root',default=str(Path(__file__).resolve().parents[1]))
    p.add_argument('--task-file',default='/test_files/task.json');p.add_argument('--result',default='/eval/code_result.json')
    p.add_argument('--artifacts',default='/eval/artifacts');a=p.parse_args()
    root=Path(a.trusted_root).resolve();sys.path.insert(0,str(root))
    from chipevo.util import load,save
    result={'resolved':False,'score':0.0,'reason':'Evaluation not completed'}
    report=None
    try:
        config=load(a.task_file) if Path(a.task_file).exists() else {}
        design=a.design or config.get('design')
        if not design or design not in ['zipcpu','feather','cgra','nvdla','gemmini']:raise ValueError('Set design in trusted /test_files/task.json or --design')
        if config.get('objective',objective)!=objective:raise ValueError('Wrong grading script for this task objective')
        workspace=Path(a.candidate_root).absolute()
        candidates=[workspace/'designs'/design/'rtl',workspace/'ChipEvo/designs'/design/'rtl',workspace/'rtl']
        found=[x for x in candidates if x.is_dir()]
        if len(found)!=1:raise ValueError('Expected exactly one candidate RTL location: designs/<design>/rtl or rtl/')
        from chipevo.engine import evaluate
        out=Path(a.artifacts)/uuid.uuid4().hex
        # Evaluator-owned /eval storage, never /workspace or a candidate path.
        report=evaluate(root,design,objective,found[0],out,cache_dir=Path(a.artifacts).parent/'baseline-cache')
        result=report['grade']
        save(Path(a.result).parent/'chipevo_report.json',report)
    except Exception as e:
        result={'resolved':False,'score':0.0,'reason':str(e)[:1500]}
        save(Path(a.result).parent/'chipevo_report.json',{'status':'failed','error':str(e)[:1500],'grade':result})
    # The platform contract allows exactly these three keys.
    save(a.result,{k:result[k] for k in ['resolved','score','reason']})
    print(json.dumps(result,ensure_ascii=False))
