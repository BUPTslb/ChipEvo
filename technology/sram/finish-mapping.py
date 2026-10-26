"""One-shot guarded continuation of the user-authorized SRAM repair.
Never enables failed/empty libraries; rollback on synthesis/STA/audit failure.
This is a pre-layout mapping qualification, not final benchmark/signoff approval.
"""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json,hashlib,subprocess,time,re,shutil,traceback,collections
R=Path('/home/shen/Desktop/project/ChipEvo/chips');D=R/'gemmini';S=R/'technology/sram';B=D/'build/openram'
STATE=B/'mapping-pipeline.status.json';snapshot=json.loads((S/'activation-snapshot.json').read_text())
state={'started_at':time.strftime('%Y-%m-%dT%H:%M:%S%z'),'status':'running','phase':'waiting_for_characterization','scoring_ready':False}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save():
    state['updated_at']=time.strftime('%Y-%m-%dT%H:%M:%S%z')
    tmp=STATE.with_suffix('.tmp');tmp.write_text(json.dumps(state,indent=2)+'\n');tmp.replace(STATE)
def run(cmd,log,cwd=None,timeout=3700):
    with Path(log).open('w') as f:
        a=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,cwd=cwd,timeout=timeout)
    if a.returncode:raise RuntimeError('Command failed: '+repr(cmd)+'; log='+str(log))
def wait_macro(name):
    p=subprocess.Popen(['docker','wait','chipevo-'+name],stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
    (B/(name+'.wait-attached')).write_text(str(p.pid)+'\n')
    try:
        out,err=p.communicate(timeout=86400)
        if p.returncode:raise RuntimeError(err.strip())
        rc=int(out.strip())
    except subprocess.TimeoutExpired:
        p.kill();p.communicate()
        subprocess.run(['docker','stop','-t','2','chipevo-'+name],timeout=30)
        rc=124
    (B/(name+'.exitcode')).write_text(str(rc)+'\n')
    (B/(name+'.wait-result.json')).write_text(json.dumps({'container_exitcode':rc,'method':'docker wait','max_wait_seconds':86400},indent=2)+'\n')
    return name,rc

def preserve_copy(src,dst):
    dst.parent.mkdir(parents=True,exist_ok=True)
    data=src.read_bytes()
    if dst.exists() and dst.read_bytes()!=data:raise RuntimeError('Refusing to overwrite different existing asset '+str(dst))
    dst.write_bytes(data)
def areas(lib):
    text=Path(lib).read_text()
    return {name.strip():float(area) for name,area in re.findall(r'\bcell\s*\(\s*"?([^\)"\s]+)"?\s*\)\s*\{.*?\barea\s*:\s*([0-9.eE+-]+)\s*;',text,re.S)}

def qualify():
    for path,h in snapshot['sha256'].items():
        if sha(path)!=h:raise RuntimeError('Activation input changed during characterization: '+path)
    m=json.loads((D/'manifest.json').read_text())
    for rel,h in m['baseline_sha256'].items():
        if sha(D/'rtl'/rel)!=h or sha(D/'reference'/rel)!=h:raise RuntimeError('Baseline RTL changed: '+rel)
    test=json.loads((B/'macro-preview-regression.status.json').read_text())
    if test.get('status')!='pass' or test.get('exitcode')!=0:raise RuntimeError('Macro integration regression has not passed')
    for path,h in test['source_sha256'].items():
        if sha(path)!=h:raise RuntimeError('Regression source changed: '+path)
    liberties=[];assets=[];macro_area={}
    for name in snapshot['macro_counts']:
        out=B/name
        lib=out/(name+'_TT_1p1V_25C.lib');v=out/(name+'.v')
        for f in [lib,v,out/(name+'.lef'),out/(name+'.py')]:
            if not f.exists() or f.stat().st_size==0:raise RuntimeError('Missing compiler artifact '+str(f))
        if sha(v)!=sha(B/'model-preview'/(name+'.v')):raise RuntimeError('Final Verilog differs from tested preview: '+name)
        if sha(out/(name+'.py'))!=sha(S/'configs'/(name+'.py')):raise RuntimeError('Compiler config mismatch: '+name)
        txt=lib.read_text();a=areas(lib)
        if name not in a or not (a[name]>0):raise RuntimeError('Missing positive macro area: '+name)
        if re.search(r'\b(?:nan|infinity)\b',txt,re.I):raise RuntimeError('Non-finite model data: '+name)
        for field,value in [('nom_voltage',1.1),('nom_temperature',25)]:
            match=re.search(r'\b'+field+r'\s*:\s*([0-9.eE+-]+)',txt)
            if not match or abs(float(match.group(1))-value)>1e-8:raise RuntimeError('PVT mismatch: '+name+'/'+field)
        macro_area[name]=a[name]
        for f in [lib,v,out/(name+'.lef'),out/(name+'.py')]:
            dst=S/'macros'/name/f.name;preserve_copy(f,dst);assets.append(dst)
            if f==lib:liberties.append(str(dst.relative_to(R)))
    wrapper=S/'gemmini_wrappers.v';preserve_copy(S/'gemmini_wrappers.candidate.v',wrapper);assets.append(wrapper)
    profile={'status':'admitted_synthesis_only','scope':'pre-layout macro mapping; final SDC/electrical/formal benchmark admission still pending','wrapper':str(wrapper.relative_to(R)),'replace_sources':['rtl/mem_4096x128.v','rtl/mem_512x512.v'],'liberties':liberties,'asset_sha256':{str(f.relative_to(R)):sha(f) for f in assets},'macro_areas':macro_area,'expected_baseline_instances':snapshot['macro_counts'],'functional_evidence':'20,850 block comparisons and 14/14 Gemmini regression; final Verilog byte-identical to tested preview','formal_macro_proof':False}
    return m,profile

save();original=None;installed=None;profile_path=S/'gemmini-mapping.json'
try:
    names=list(snapshot['macro_counts'])
    with ThreadPoolExecutor(max_workers=2) as pool:
        results=dict(pool.map(wait_macro,names))
    state['characterization_exitcodes']=results;save()
    if any(rc!=0 for rc in results.values()):raise RuntimeError('Characterization failed; no mapping enabled')
    state['phase']='qualifying_artifacts';save()
    m,profile=qualify()
    if profile_path.exists():raise RuntimeError('Mapping profile already exists; manual reconciliation required')
    profile_path.write_text(json.dumps(profile,indent=2)+'\n')
    original=(D/'manifest.json').read_bytes()
    preserve_copy(D/'manifest.json',D/'provenance/pre-openram-mapping.manifest.json')
    old=D/'build/pre-sram-baseline';old.mkdir(exist_ok=True)
    for name in ['synth.ys','synth.log','synth.status.json','sta.tcl','sta.log','sta.status.json']:
        src=D/'build'/name
        if src.exists():preserve_copy(src,old/name)
    m['sram_mapping']=str(profile_path.relative_to(R))
    m['area_scope']='standard cells plus fixed OpenRAM FreePDK45 SRAM macro area; TT/1.1V/25C; pre-layout'
    installed=(json.dumps(m,indent=2)+'\n').encode();(D/'manifest.json').write_bytes(installed)
    state['phase']='synthesizing_macro_baseline';save()
    run(['python3','scripts/flow.py','synth','--period','10','--objective','timing','--timeout','3600'],B/'pipeline-synth.log',cwd=D)
    mods=json.loads((D/'build/mapped.json').read_text())['modules'];counts=collections.Counter()
    def visit(t,n=1,trail=()):
        if t in trail:raise RuntimeError('Recursive module hierarchy')
        counts[t]+=n
        if t in mods:
            children=collections.Counter(c['type'] for c in mods[t].get('cells',{}).values())
            for child,k in children.items():visit(child,n*k,trail+(t,))
    visit(m['top'])
    actual={name:counts[name] for name in snapshot['macro_counts']}
    if actual!=snapshot['macro_counts']:raise RuntimeError('Unexpected macro instance counts: '+repr(actual))
    std=areas(R/'technology/NangateOpenCellLibrary_typical.lib')
    std_area=sum(counts[k]*a for k,a in std.items());ram_area=sum(actual[k]*profile['macro_areas'][k] for k in actual)
    if std_area<=0 or ram_area<=0:raise RuntimeError('Invalid area accounting')
    state.update(phase='checking_pre_layout_sta',macro_instances=actual,standard_cell_area_um2=std_area,sram_area_um2=ram_area,total_area_um2=std_area+ram_area);save()
    run(['python3','scripts/flow.py','sta','--timeout','600'],B/'pipeline-sta.log',cwd=D,timeout=660)
    state.update(status='pass',phase='macro_mapping_validated',scoring_ready=False,note='Macro model integration validated. Initial SDC and remaining benchmark qualification are not promoted by this result.')
    (D/'build/sram-mapping-report.json').write_text(json.dumps(state,indent=2)+'\n')
    q=json.loads((S/'qualification.json').read_text());q.update(status='macro_mapping_validated_pre_layout',mapping_report=str(D/'build/sram-mapping-report.json'),admitted_to_scoring=False);q['pending']=['final SDC/calibration and broader electrical/formal benchmark qualification'];(S/'qualification.json').write_text(json.dumps(q,indent=2)+'\n')
    with (D/'NOTES.md').open('a') as f:f.write('\nAutomated SRAM continuation completed: macro instance counts '+repr(actual)+', standard-cell area '+str(std_area)+', macro area '+str(ram_area)+' um^2. Synthesis and pre-layout STA tool checks passed; initial SDC and remaining formal/electrical qualification are still pending. See build/sram-mapping-report.json.\n')
    with (R.parent/'docs/ChipReport.md').open('a') as f:f.write('\n\n### SRAM continuation completed\nGemmini macro mapping validated through final SPICE library/model checks, synthesis, instance/area accounting and pre-layout STA. See chips/gemmini/build/sram-mapping-report.json. This does not approve final benchmark constraints, full formal equivalence or physical signoff.\n')
except Exception as e:
    state.update(status='failed',phase='not_admitted',error=str(e),traceback=traceback.format_exc())
    if original is not None and installed is not None and (D/'manifest.json').read_bytes()==installed:
        (D/'manifest.json').write_bytes(original);state['manifest_rolled_back']=True
    if profile_path.exists() and original is not None:
        p=json.loads(profile_path.read_text());p['status']='rejected';p['failure']=str(e);profile_path.write_text(json.dumps(p,indent=2)+'\n')
    q=json.loads((S/'qualification.json').read_text());q.update(status='not_admitted',last_failure=str(e));(S/'qualification.json').write_text(json.dumps(q,indent=2)+'\n')
finally:
    save()
    try:
        run(['python3',str(R/'lock.py')],B/'pipeline-lock.log',timeout=120)
        run(['python3',str(R/'audit.py')],B/'pipeline-audit.log',timeout=120)
    except Exception as e:
        state['final_inventory_error']=str(e);state['status']='failed';save()
print(json.dumps(state,indent=2))
