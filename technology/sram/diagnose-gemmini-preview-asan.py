from pathlib import Path
import json,subprocess,time,hashlib,os
os.environ["CCACHE_DISABLE"]="1"
R=Path('/home/shen/Desktop/project/ChipEvo/chips');D=R/'gemmini';B=D/'build/openram';S=R/'technology/sram'
m=json.loads((D/'manifest.json').read_text())
for s,h in m['frozen_candidate_sha256'].items():
    assert hashlib.sha256((D/s).read_bytes()).hexdigest()==h
sources=[str(D/s) for s in m['sources'] if s not in m['frozen_candidate_sha256']]
sources += [str(S/'gemmini_wrappers.candidate.v')]+[str(B/'model-preview'/(n+'.v')) for n in ['sram_1rw_256x32','sram_1r1w_256x32']]
# Freeze simulator worker count; avoid machine-dependent automatic NUMA setup.
harness=B/'macro-preview-main.cpp'
text=(D/'tb/main.cpp').read_text().replace('#include "../model/golden.hpp"','#include "'+str(D/'model/golden.hpp')+'"')
text=text.replace(' Verilated::commandArgs(argc,argv);',' Verilated::commandArgs(argc,argv);\n Verilated::threadContextp()->threads(1);')
harness.write_text(text)
obj=B/'obj_macro_preview_256x32_asan';obj.mkdir(exist_ok=True)
cmd=['verilator','--no-timing','-Wno-fatal','--top-module',m['top'],'-DCHIP_EVO_MACRO_SIM']+['-D'+v for v in m['defines']]+['-I'+str(D/v) for v in m['includes']]+sources+['--cc','--exe','--build','-j','8','--assert','--Mdir',str(obj),'-CFLAGS','-std=c++17 -fsanitize=address -g -fno-omit-frame-pointer -I'+str(D/'tb'),'-LDFLAGS','-fsanitize=address',str(harness)]
status={'scope':'Gemmini macro functional-model preview integration; not final SRAM qualification','command':cmd,'source_sha256':{s:hashlib.sha256(Path(s).read_bytes()).hexdigest() for s in sources},'status':'running'}
f=B/'macro-preview-regression.status.json';f.write_text(json.dumps(status,indent=2)+'\n')
with (B/'macro-preview-compile.log').open('w') as out:
    rc=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT).returncode
status['compile_exitcode']=rc
if rc==0:
    with (B/'macro-preview-regression.log').open('w') as out:
        rc=subprocess.run([str(obj/('V'+m['top']))],stdout=out,stderr=subprocess.STDOUT,timeout=300).returncode
status.update(exitcode=rc,status='pass' if rc==0 else 'failed')
f.write_text(json.dumps(status,indent=2)+'\n')
print(status['status'])
