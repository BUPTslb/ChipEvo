"""Build offline timing-only platform uploads. No API calls or native EDA."""
from pathlib import Path
import argparse,hashlib,json,shutil,sys,tarfile,tempfile,zipfile
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from chipevo.engine import verify_assets,seed_reference_candidate
from chipevo.packaging import package
from chipevo.prompting import render
from chipevo.policy import validate
from chipevo.util import load,save,sha

CHUNK_LOADER = '''from pathlib import Path
import json,hashlib,re
Path('/eval').mkdir(parents=True,exist_ok=True)
try:
    spec=json.loads(Path('/test_files/grader_bundle.json').read_text())
    archive=Path('/eval/chipevo_grader.tar.gz')
    whole=hashlib.sha256()
    with archive.open('wb') as dest:
        for item in spec['parts']:
            if not re.fullmatch(r'grader.part[0-9]{4}',item['name']):raise RuntimeError('Invalid grader part name')
            source=Path('/test_files')/item['name']
            if source.is_symlink():raise RuntimeError('Grader parts must not be symlinks')
            data=source.read_bytes()
            if len(data)!=item['bytes'] or hashlib.sha256(data).hexdigest()!=item['sha256']:raise RuntimeError('Missing or corrupt grader part: '+item['name'])
            dest.write(data);whole.update(data)
    if whole.hexdigest()!=spec['sha256']:raise RuntimeError('Assembled grader checksum mismatch')
except Exception as exc:
    Path('/eval/code_result.json').write_text(json.dumps({'resolved':False,'score':0.0,'reason':str(exc)[:1500]}))
    raise SystemExit(0)
'''

def main():
    p=argparse.ArgumentParser();p.add_argument('--output',required=True);a=p.parse_args()
    root=Path(__file__).resolve().parents[1];out=Path(a.output).resolve()
    if out.exists():raise ValueError('Choose a new upload release directory')
    verify_assets(root);out.mkdir(parents=True)
    grader=out/'grader-attachments';grader.mkdir()
    with tempfile.TemporaryDirectory(prefix='chipevo-platform-') as temp:
        temp=Path(temp);archive=temp/'chipevo_grader.tar.gz';package(root,archive)
        parts=[]
        with archive.open('rb') as stream:
            while data:=stream.read(900000):
                name=f'grader.part{len(parts):04d}';(grader/name).write_bytes(data)
                parts.append({'name':name,'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()})
        save(grader/'grader_bundle.json',{'schema_version':1,'sha256':sha(archive),'bytes':archive.stat().st_size,'parts':parts})
        bootstrap=(root/'grading/test_timing_by_code.py').read_text()
        bootstrap=bootstrap.replace("archive=tests/'chipevo_grader.tar.gz'","archive=Path('/eval/chipevo_grader.tar.gz')")
        (out/'test_by_code.py').write_text(CHUNK_LOADER+'\n'+bootstrap)
        designs=[]
        for design in ['gemmini','nvdla','zipcpu','cgra','feather']:
            cfg=load(root/f'configs/tasks/{design}.timing.json')
            prompt,evidence=render(root,design,'timing',0)
            # Standalone prompt uses shell/file tools supplied by the platform.
            prompt=prompt.replace(f'under designs/{design}/rtl/', 'under /workspace/rtl/')
            prompt+='\nWorkspace layout: /workspace/rtl/ contains your candidate sources; /workspace/policy.json, manifest.json and context.json are read-only task information. Read task.md for this same standalone specification. Use the platform file and shell tools directly; do not call any LLM API or start the ChipEvo API runner. Submit changes as files in /workspace/rtl/. Do not create five candidates yourself: each platform rollout is one independent candidate, and the platform batch size is 5. Do not run EDA feedback in this task. Final grading runs independently.\n'
            work=temp/design;work.mkdir();seed_reference_candidate(root,design,work/'rtl')
            validate(root/'designs'/design,work/'rtl')
            for name in ['policy.json','manifest.json']:shutil.copy2(root/'designs'/design/name,work/name)
            shutil.copy2(root/'requirements.txt',work/'requirements.txt')
            save(work/'context.json',evidence);(work/'task.md').write_text(prompt)
            target=out/design;target.mkdir();(target/'prompt.txt').write_text(prompt)
            save(target/'task.json',{'design':design,'objective':'timing'})
            with tarfile.open(target/'workspace.tar.gz','w:gz') as tar:
                for f in sorted(work.rglob('*')):
                    if f.is_file():tar.add(f,arcname=str(f.relative_to(work)),recursive=False)
            designs.append({'design':design,'objective':'timing','period_ns':cfg['period_ns'],
                            'frequency_mhz':1000/cfg['period_ns'],'workspace_bytes':(target/'workspace.tar.gz').stat().st_size,
                            'source_rtl':'fresh reference seed; no historical optimized candidate',
                            'eda_feedback_calls':0})
        # Keep the attachment ZIP out of the model workspace; unzip locally and
        # upload its individual files, each below the platform's 1 MB limit.
        with zipfile.ZipFile(out/'grader-attachments.zip','w',zipfile.ZIP_STORED) as z:
            for f in sorted(grader.iterdir()):z.write(f,f.name)
        save(out/'release.json',{'schema_version':1,'api_calls':0,'eda_jobs':0,'designs':designs,
                               'grader_parts':len(parts),'max_attachment_bytes':max(x['bytes'] for x in parts),
                               'grader_archive_sha256':sha(archive),'asset_lock_sha256':sha(root/'configs/assets.sha256.json'),
                               'platform_controls_model_concurrency':True,'host_api_limit_does_not_control_platform':True,
                               'external_platform_acceptance':'not yet run'})
    guide='''ChipEvo timing-only platform upload

1. Create a separate platform task/container for EACH design. Upload that
   design's workspace.tar.gz through the workspace/VS Code upload path and
   extract directly into /workspace (RTL must be /workspace/rtl).
2. In the Linux x86_64 Python >=3.10 container, run:
       cd /workspace
       python -m pip install -r requirements.txt
   The grader includes pinned native Yosys/ABC/OpenSTA binaries. No LLM API,
   local proxy, Docker daemon, API credentials or rollout runner is needed.
3. Finish environment preparation, then send a separate confirmation message
   to the platform assistant to save a snapshot. Only AFTER that turn ends,
   send the complete contents of the matching prompt.txt as the TASK prompt.
   Select that later task turn for testing; the platform restores its PREVIOUS
   snapshot. Use no-context mode. The prompt is entirely English.
4. In the grading attachment uploader, upload all files extracted locally
   from grader-attachments.zip (grader.partNNNN and grader_bundle.json).
   Upload the selected design's task.json as /test_files/task.json.
   Do NOT upload grader-attachments.zip as a single test attachment: it exceeds
   the 1 MB limit. Every extracted part is at most 900000 bytes.
   Keep all grader attachments OUTSIDE the model's workspace snapshot.
5. Paste all of test_by_code.py into Code Grade. It verifies and assembles the
   private parts in /eval, imports only that trusted evaluator, remeasures
   baseline/candidate, verifies equivalence and writes exactly
   resolved/score/reason to /eval/code_result.json. Candidate metrics are ignored.
6. Batch size 5 means five independent copies of the SAME snapshot and prompt,
   NOT one conversation producing five variants. Start only one batch per task.
   Platform request concurrency is managed by the platform, not our host API
   limiter. Set a model-wide platform cap of 5 if its controls support it;
   otherwise start ONE design batch at a time to avoid 25 overlapping agents.
7. Run grading after rollout. Save each result and actual RTL files. Inspect
   feasibility and select the best valid timing result; retain the old parent
   if no improvement. Do not put other candidates/models/objectives into the
   next snapshot. Create the next snapshot manually from only that selected
   RTL and reuse the same task prompt. This release does not auto-promote or
   start subsequent rounds on the external platform.

This release grants ZERO in-rollout EDA feedback calls; it measures source
inspection/editing with independent final grading. It is a distinct protocol
from host API studies that grant one feedback call. Do not merge their scores
as if they used the same tool-feedback protocol. The native evaluator and
large-design time/memory compatibility still need acceptance on the actual
platform. No model calls, synthesis, STA or formal jobs were launched here.
'''
    (out/'UPLOAD_INSTRUCTIONS.txt').write_text(guide)
    print(json.dumps(load(out/'release.json'),indent=2))

if __name__=='__main__':main()
