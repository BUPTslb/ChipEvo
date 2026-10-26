from pathlib import Path
import re,os,shutil
from ..util import checked,load,save,sha,ys_quote

def recipe(objective,period_ns,fast=False):
    target=f' -D {period_ns*1000:g}' if objective=='timing' else ''
    retime='dretime; '+('retime -o'+target+'; ' if target else '')
    if fast:body='strash; '+retime+'map'+target+'; '
    else:body='strash; &get -n; &fraig -x; &put; scorr; dc2; '+retime+'strash; &get -n; &dch -f; &nf'+target+'; &put; '
    return body+'cleanup; buffer; upsize'+target+'; dnsize'+target+'; stime -p\n'

def synthesize(root,work,tools,objective,period_ns,timeout=3600):
    root=Path(root);work=Path(work);b=work/'build';b.mkdir(exist_ok=True)
    m=load(work/'manifest.json');lib=root/'technology/NangateOpenCellLibrary_typical.lib'
    sources=[work/x for x in m['sources']];macro={};libs=[]
    if m.get('sram_mapping'):
        macro=load(root/m['sram_mapping'])
        for rel,h in macro['asset_sha256'].items():
            if sha(root/rel)!=h:raise RuntimeError('SRAM asset changed: '+rel)
        for rel,h in m.get('frozen_candidate_sha256',{}).items():
            if sha(work/rel)!=h:raise RuntimeError('Frozen memory RTL changed: '+rel)
        sources=[x for x in sources if str(x.relative_to(work)) not in macro['replace_sources']]+[root/macro['wrapper']]
        libs=[root/x for x in macro['liberties']]
    text=''.join('read_liberty -lib '+ys_quote(x)+'\n' for x in libs)
    includes=[]
    for i,v in enumerate(m['includes']):
        if any(c.isspace() for c in v):
            alias=b/f'include-{i}';shutil.copytree(work/v,alias);v=f'build/include-{i}'
        includes.append('-I'+v)
    text+='read_verilog -sv '+' '.join(['-D'+v for v in m['defines']]+includes+[ys_quote(x) for x in sources])+'\n'
    text+='hierarchy -check -top '+m['top']+''.join(' -chparam '+k+' '+str(v) for k,v in m['params'].items())+'\n'
    text+=f'chformal -remove\nsynth -top {m["top"]} -noabc\ndfflibmap -liberty {ys_quote(lib)}\n'
    abc=b/'abc.script';abc.write_text(recipe(objective,period_ns,m.get('abc_fast',False)))
    # The ABC pass treats several option arguments literally, unlike read_verilog.
    # Use fixed local filenames and resolve only the trusted ABC through PATH.
    shutil.copy2(lib,b/'mapping.lib');shutil.copy2(work/'constraints/abc.constr',b/'abc.constr')
    # A script file is expanded to an unquoted absolute ABC `source` path by
    # Yosys. Inline the identical recipe so workspaces with spaces do not hang.
    text+='abc -exe abc -liberty build/mapping.lib -constr build/abc.constr -script "+'+abc.read_text().strip()+'"\n'
    text+=f'techmap -map {ys_quote(root/"technology/latches_map.v")}\nclean\nread_liberty -lib {ys_quote(lib)}\ncheck -mapped -assert\n'
    text+='stat '+ ' '.join('-liberty '+ys_quote(x) for x in [lib,*libs])+'\n'
    text+=f'write_verilog -norename -noattr -noexpr {ys_quote(b/"mapped.v")}\nwrite_json {ys_quote(b/"mapped.json")}\n'
    script=b/'synthesis.ys';script.write_text(text)
    env=dict(os.environ);env['PATH']=str(Path(tools['abc']).parent)+os.pathsep+env.get('PATH','')
    checked([tools['yosys'],'-s',script],work,b/'synthesis.log',timeout,env)
    area=measure_area(b/'mapped.json',lib,macro.get('macro_areas',{}))
    save(b/'area.json',area)
    save(b/'synthesis-config.json',{'objective':objective,'period_ns':period_ns,'abc_fast':m.get('abc_fast',False),'abc_script':abc.read_text(),'storage_fixed':True})
    return area

def measure_area(mapped,lib,macro_areas):
    modules=load(mapped)['modules'];top=next((n for n,v in modules.items() if str(v.get('attributes',{}).get('top','')).strip('0')),None)
    if top is None:raise ValueError('Mapped netlist has no top attribute')
    areas={n:float(v) for n,v in re.findall(r'\bcell\s*\(\s*([^\s)]+)\s*\)\s*\{.*?\barea\s*:\s*([\d.eE+-]+)',Path(lib).read_text(),re.S)}
    cache={};counts={}
    def count(name):
        if name in areas:return areas[name],0.
        if name in macro_areas:return 0.,float(macro_areas[name])
        if name in cache:return cache[name]
        if name not in modules:raise ValueError('Unmodeled cell '+name)
        a=s=0.
        for c in modules[name]['cells'].values():
            x,y=count(c['type']);a+=x;s+=y
        cache[name]=(a,s);return a,s
    a,s=count(top)
    def macros(name,mult=1):
        if name in macro_areas:counts[name]=counts.get(name,0)+mult;return
        if name in areas:return
        for c in modules[name]['cells'].values():macros(c['type'],mult)
    macros(top)
    return {'standard_cell_area_um2':a,'fixed_sram_macro_area_um2':s,'total_area_um2':a+s,'macro_instances':counts,'area_scope':'total mapped standard cells plus fixed macros; no core/die area'}
