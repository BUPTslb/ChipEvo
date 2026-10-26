"""Explicit NVDLA functional regression against the frozen current reference."""
from pathlib import Path
import os,shutil,sys
from ..util import load,save,execute

def nvdla_regression(root,output):
    root=Path(root).resolve();out=Path(output).resolve()
    if out.exists():raise ValueError('Use a fresh regression output directory')
    verilator=shutil.which('verilator');compiler=shutil.which('g++-11') or shutil.which('g++')
    if not verilator or not compiler or not shutil.which('make'):
        raise RuntimeError('Functional regression requires Verilator, make and a C++20 compiler; native equivalence grading does not require this optional simulator')
    out.mkdir(parents=True);obj=out/'obj';obj.mkdir();d=root/'designs/nvdla';tb=d/'tb';m=load(d/'manifest.json')
    source=(tb/'upstream/nvdla.cpp').read_text().replace('#include "../spec/defs/project.h"','#include "'+str(tb/'spec/defs/project.h')+'"')
    marker='while (!csb->done() || (quiesc_timer--)) {'
    if marker not in source:raise ValueError('Upstream testbench watchdog location changed')
    source=source.replace(marker,marker+'\n if(ticks>200000){fprintf(stderr,"CYCLE_WATCHDOG\\n");return 2;}')
    (out/'nvdla.cpp').write_text(source)
    def ref(path):return d/path.replace('rtl/','reference/',1)
    cmd=[verilator,'--timing','-Wno-fatal','--top-module',m['top']]+['-D'+v for v in m['defines']]
    cmd+=['-I'+str(ref(v)) for v in m['includes']]+[ref(v) for v in m['sources']]
    cmd+=['--cc','--exe','--Mdir',obj,out/'nvdla.cpp']
    result={'status':'running','baseline_version':m.get('baseline_version'),'runs':{},'compiler_cache_disabled':True}
    env=dict(os.environ);env['CCACHE_DISABLE']='1';env['PYTHONPATH']=str(tb/'manual')
    result['generate']=execute(cmd,root,out/'generate.log',600,env);save(out/'report.json',result)
    if result['generate']['exit_code']==0:
        result['compile']=execute(['make','-C',obj,'-f','VNV_nvdla.mk','-j4','CXX='+compiler,'LINK='+compiler,
                                  'CXXFLAGS=-std=c++20 -fcoroutines'],root,out/'compile.log',900,env)
        save(out/'report.json',result)
        if result['compile']['exit_code']==0:
            for workload in ['sdp_1x1x1_pass_through_int8','pdp_8x8x64_2x2_int8','cdp_8x8x32_lrn3_int8_0','dc_1x1x8_1x1x8x1_int8_0']:
                work=out/workload;work.mkdir();row={}
                row['parse']=execute([sys.executable,tb/'tools/nvdla_trace_parser.py','--file_path',tb/'traces'/workload/(workload+'.cfg')],work,work/'parse.log',60,env)
                if row['parse']['exit_code']==0:
                    row['convert']=execute([sys.executable,tb/'upstream/new_trace_to_verilator.py',work,work/'trace.bin'],work,work/'convert.log',60,env)
                    if row['convert']['exit_code']==0:
                        row['simulation']=execute([obj/'VNV_nvdla',work/'trace.bin'],work,work/'simulation.log',60,env)
                        row['passed']=row['simulation']['exit_code']==0 and '*** PASS' in (work/'simulation.log').read_text(errors='replace')
                result['runs'][workload]=row;save(out/'report.json',result)
    result['status']='completed';result['passed']=len(result['runs'])==4 and all(x.get('passed',False) for x in result['runs'].values())
    save(out/'report.json',result);return result
