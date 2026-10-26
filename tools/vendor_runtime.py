"""One-time explicit packaging of the already-qualified open-source executables.
Copies binaries and dependencies; never synthesizes or evaluates a design.
"""
from pathlib import Path
import subprocess,re,shutil,json,hashlib,os

def vendor(root,yosys,abc,sta,share):
    root=Path(root).resolve();runtime=root/'tools/runtime/linux-x86_64'
    if runtime.exists():raise RuntimeError('Refuse to replace an existing runtime')
    for folder in ['bin','lib','share','licenses']:(runtime/folder).mkdir(parents=True,exist_ok=True)
    sources={'yosys':Path(yosys),'abc':Path(abc),'sta':Path(sta)};dependencies=set();records={}
    for name,p in sources.items():
        shutil.copy2(p,runtime/'bin'/(name+'.elf'))
        text=subprocess.check_output(['ldd',str(p)],text=True)
        for match in re.finditer(r'(?:=>\s+)?(/[^\s()]+)',text):dependencies.add(Path(match[1]))
        records[name]={'original_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'source_path':str(p)}
    for p in dependencies:shutil.copy2(p.resolve(),runtime/'lib'/p.name)
    loader=next((p.name for p in dependencies if p.name.startswith('ld-linux')),None)
    if loader is None:raise RuntimeError('ELF loader was not found')
    shutil.copytree(share,runtime/'share/yosys')
    tcl=Path('/usr/share/tcltk/tcl8.6')
    if tcl.exists():shutil.copytree(tcl,runtime/'share/tcl8.6')
    for name in sources:
        wrapper=runtime/'bin'/name
        wrapper.write_text('#!/bin/sh\nset -eu\nR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)\nexport TCL_LIBRARY="$R/share/tcl8.6"\nexec "$R/lib/'+loader+'" --library-path "$R/lib" "$R/bin/'+name+'.elf" "$@"\n')
        wrapper.chmod(0o755)
    docs=Path('/usr/share/doc')
    for name in ['libc6','libstdc++6','libgcc-s1','libreadline8','libtinfo6','libffi7','libtcl8.6','zlib1g']:
        p=docs/name/'copyright'
        if p.exists():shutil.copy2(p,runtime/'licenses'/(name+'.copyright'))
    yosysroot=Path(share).parent
    for p in [yosysroot/'COPYING',yosysroot/'abc/copyright.txt',Path(sta).parents[0]/'LICENSE',Path(sta).parents[0]/'LICENSE.txt']:
        if p.exists():shutil.copy2(p,runtime/'licenses'/(p.parent.name+'-'+p.name))
    (runtime/'PROVENANCE.json').write_text(json.dumps({'platform':'Linux x86_64','native_tools':records,'yosys_source':'https://github.com/YosysHQ/yosys/tree/77005b69a','opensta_source':'https://github.com/The-OpenROAD-Project/OpenSTA/tree/12683d645c','scope':'version-identical binaries from qualified flow; bundled Linux ELF loader and runtime libraries; no EDA job executed'},indent=2)+'\n')
    manifest={str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(runtime.rglob('*')) if p.is_file()}
    target=root/'tools/runtime/FILES.sha256.json';target.write_text(json.dumps(manifest,indent=2)+'\n')
    return len(manifest)
