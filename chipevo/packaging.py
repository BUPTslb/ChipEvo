from pathlib import Path
import tarfile,os
from .engine import verify_assets
from .policy import safe_tree

def packaging_paths(root,folder,output):
    base=root/folder
    if not base.exists():return []
    safe_tree(base)
    if output.resolve().is_relative_to(base.resolve()):raise ValueError('Package output must be outside packaged source directories')
    return sorted(base.rglob('*'))

def package(root,output):
    root=Path(root);output=Path(output);verify_assets(root);output.parent.mkdir(parents=True,exist_ok=True)
    temp=output.with_suffix(output.suffix+'.tmp')
    with tarfile.open(temp,'w:gz',compresslevel=6) as tar:
        for folder in ['chipevo','designs','technology','configs','grading','tools/runtime']:
            for p in packaging_paths(root,folder,output):
                if not p.is_file():continue
                if folder!='tools/runtime' and ('__pycache__' in p.parts or p.suffix=='.pyc'):continue
                if p.is_symlink():raise ValueError('No symlinks in trusted grader upload: '+str(p))
                # Candidate starter RTL is unnecessary in the hidden evaluator.
                if folder=='designs' and any(x in p.relative_to(root/'designs').parts for x in ['rtl','tb','model','provenance','licenses']):continue
                tar.add(p,arcname='chipevo_grader/'+str(p.relative_to(root)),recursive=False)
    verify_assets(root);temp.replace(output)
    return str(output)

def deployment(root,output):
    root=Path(root);output=Path(output);verify_assets(root);output.parent.mkdir(parents=True,exist_ok=True)
    folders=['chipevo','designs','technology','configs','grading','tools/runtime','prompts','tests']
    temp=output.with_suffix(output.suffix+'.tmp')
    with tarfile.open(temp,'w:gz',compresslevel=6) as tar:
        for folder in folders:
            for p in packaging_paths(root,folder,output):
                if p.is_file() and (folder=='tools/runtime' or ('__pycache__' not in p.parts and p.suffix!='.pyc')):tar.add(p,arcname='ChipEvo/'+str(p.relative_to(root)),recursive=False)
        for rel in ['README.md','AGENTS.md','requirements.txt','pyproject.toml','Dockerfile','.dockerignore','.gitignore','tools/doctor.py','tools/freeze_assets.py','tools/kimi_smoke.py','tools/calibrate_area.py','tools/probe_nvdla_sram.py','tools/start_rollout.sh','tools/prepare_rollout_configs.py','tools/inspect_experiment_readiness.py','docs/PLATFORM.md','docs/LOCALIZATION.md','docs/STUDY.md','docs/CONTEXT.md','docs/NVDLA_SRAM.md','docs/AREA_FREQUENCIES.md','docs/STORAGE.md','docs/START_EXPERIMENT.md']:
            tar.add(root/rel,arcname='ChipEvo/'+rel,recursive=False)
        for rel in ['tools/audit_flow.py','tools/audit_flow_inventory.py','docs/FLOW_AUDIT.md','docs/PROGRESS_MEMORY.md']:
            tar.add(root/rel,arcname='ChipEvo/'+rel,recursive=False)
        tar.add(root/'tools/prepare_platform_upload.py',arcname='ChipEvo/tools/prepare_platform_upload.py',recursive=False)
    verify_assets(root);temp.replace(output)
    return str(output)
