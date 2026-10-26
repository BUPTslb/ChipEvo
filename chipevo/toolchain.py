from pathlib import Path
import os,platform,subprocess
import re,tempfile
from .util import load,sha

def linked_paths(output):
    # Loader output separates a full pathname from its address with " (0x...)".
    # A pathname itself may contain spaces after relocating the project.
    return re.findall(r'=>[ \t]+(/[^\r\n]*?)[ \t]+\(0x[0-9a-fA-F]+\)',output)

def resolve(root,override=None):
    root=Path(root).resolve()
    cfg=load(override or root/"configs/toolchain.json")
    if platform.system()!="Linux" or platform.machine() not in ["x86_64","AMD64"]:
        raise RuntimeError("The bundled runtime supports Linux x86_64; use a Linux container on other hosts")
    tools={}
    for name,rel in cfg["executables"].items():
        p=(root/rel).resolve()
        if not p.is_file() or not os.access(p,os.X_OK):raise RuntimeError(f"Missing native tool: {p}")
        tools[name]=str(p)
    return tools

def verify_runtime(root):
    root=Path(root).resolve();manifest=load(root/"tools/runtime/FILES.sha256.json")
    for rel,h in manifest.items():
        if sha(root/rel)!=h:raise RuntimeError("Native runtime changed: "+rel)
    return len(manifest)

def doctor(root):
    tools=resolve(root);count=verify_runtime(root);rows={}
    for name,args in [("yosys",["-V"]),("abc",["-c","version"]),("sta",["-version"])]:
        p=subprocess.run([tools[name],*args],text=True,capture_output=True,timeout=30)
        rows[name]={"ok":p.returncode==0,"version":(p.stdout+p.stderr).strip()[:600]}
    if not all(v["ok"] for v in rows.values()):raise RuntimeError(str(rows))
    startup=subprocess.run([tools['yosys'],'-Q','-T','-p','help synth'],text=True,capture_output=True,timeout=30)
    if startup.returncode:raise RuntimeError('Yosys runtime/share initialization failed: '+startup.stderr[-600:])
    runtime=Path(root)/'tools/runtime/linux-x86_64';loader=next((runtime/'lib').glob('ld-linux*'))
    for name in tools:
        linked=subprocess.run([str(loader),'--library-path',str(runtime/'lib'),'--list',str(runtime/'bin'/(name+'.elf'))],text=True,capture_output=True,timeout=30)
        if linked.returncode:raise RuntimeError('Cannot resolve native libraries for '+name)
        for value in linked_paths(linked.stdout):
            if not Path(value).resolve().is_relative_to(runtime.resolve()):raise RuntimeError('Native tool uses a library outside the vendored runtime: '+value)
    with tempfile.TemporaryDirectory(prefix='chipevo-tool-startup-') as tmp:
        script=Path(tmp)/'startup.tcl';script.write_text('puts CHIPEVO_TCL_OK\n')
        tcl=subprocess.run([tools['sta'],'-exit',str(script)],text=True,capture_output=True,timeout=30)
        if tcl.returncode or 'CHIPEVO_TCL_OK' not in tcl.stdout:raise RuntimeError('OpenSTA Tcl initialization failed')
    return {"platform":"linux-x86_64","runtime_files_verified":count,"tools":rows,"vendored_shared_libraries_only":True,"tcl_startup":True,"runs_eda":False}
