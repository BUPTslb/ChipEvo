"""Minimal single-objective workspace export for an external rollout platform."""
from pathlib import Path
import tarfile,tempfile,shutil
from .policy import validate
from .util import load,save

def export(task_root,design,rtl,output):
    root=Path(task_root);rtl=Path(rtl);output=Path(output)
    validate(root/'designs'/design,rtl)
    if output.exists():raise ValueError('Refusing to overwrite an existing candidate bundle')
    if not (root/'fixed-prompt.md').is_file():raise ValueError('Use a qualified single-objective task root')
    output.parent.mkdir(parents=True,exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='chipevo-candidate-export-') as tmp:
        stage=Path(tmp);shutil.copytree(rtl,stage/'rtl');shutil.copy2(root/'fixed-prompt.md',stage/'task.md')
        save(stage/'policy.json',load(root/'designs'/design/'policy.json'))
        manifest=load(root/'designs'/design/'manifest.json')
        save(stage/'manifest.json',{k:manifest[k] for k in ['top','params','defines','includes','sources'] if k in manifest})
        if (root/'fixed-context.json').exists():shutil.copy2(root/'fixed-context.json',stage/'context.json')
        with tarfile.open(output,'w:gz') as tar:
            for p in sorted(stage.rglob('*')):
                if p.is_file():tar.add(p,arcname=str(p.relative_to(stage)),recursive=False)
    return str(output)
