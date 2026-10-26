"""Prospective retention for marked evaluation directories; never sweeps old runs."""
from pathlib import Path
import copy,gzip,hashlib,os
from .util import load,save,sha

DEFAULT={'schema_version':1,'baseline_cache':{'enabled':True,'max_entries':32,'max_bytes':268435456},'retention':{
    'successful':'compact','failed':'diagnostic','max_log_bytes':131072,
    'max_failure_evidence_bytes':16777216,'compress_agent_logs':True}}

def policy(root):
    p=Path(root)/'configs/artifacts.json';value=load(p) if p.exists() else copy.deepcopy(DEFAULT)
    if value.get('schema_version')!=1:raise ValueError('Unsupported artifacts policy')
    if not isinstance(value.get('baseline_cache',{}).get('enabled'),bool):raise ValueError('Invalid cache policy')
    for key,default in [('max_entries',32),('max_bytes',268435456)]:
        n=value['baseline_cache'].setdefault(key,default)
        if isinstance(n,bool) or not isinstance(n,int) or n<1:raise ValueError('Invalid cache limit')
    r=value['retention']
    for k in ['successful','failed']:
        if r[k] not in ['compact','diagnostic','full']:raise ValueError('Unknown retention mode')
    for k in ['max_log_bytes','max_failure_evidence_bytes']:
        if isinstance(r[k],bool) or not isinstance(r[k],int) or r[k]<1024:raise ValueError('Invalid retention budget')
    if not isinstance(r.get('compress_agent_logs'),bool):raise ValueError('Invalid compression flag')
    return value

def size(directory):
    return sum(p.stat().st_size for p in Path(directory).rglob('*') if p.is_file() and not p.is_symlink())

def mark(directory):
    save(Path(directory)/'.chipevo-evaluation.json',{'kind':'evaluation','schema_version':1})

def within(root,path):
    root=Path(root).resolve();path=Path(path)
    if path.is_symlink() or not path.resolve().is_relative_to(root):raise ValueError('Refusing to clean outside marked evaluation')

def compact_log(path,limit):
    """Bounded head/tail with original length/hash; truncation is explicit."""
    path=Path(path);n=path.stat().st_size;digest=sha(path)
    with path.open('rb') as src:
        if n<=limit:data=src.read()
        else:
            first=limit//4;src.seek(0);head=src.read(first);src.seek(-(limit-first),os.SEEK_END)
            data=head+b'\n[CHIPEVO: middle omitted; see retention.json for original bytes and SHA256]\n'+src.read(limit-first)
    dest=path.with_name(path.name+'.gz');temp=dest.with_name(dest.name+'.tmp')
    if dest.exists() or dest.is_symlink() or temp.exists():raise ValueError('Compressed log destination exists')
    with gzip.open(temp,'wb') as f:f.write(data)
    temp.replace(dest);path.unlink()
    return {'file':path.name,'compressed_file':dest.name,'original_bytes':n,'original_sha256':digest,'truncated':n>limit}

def retain(directory,status,settings,override=None):
    out=Path(directory);marker=out/'.chipevo-evaluation.json'
    if out.is_symlink() or not marker.is_file() or load(marker).get('kind')!='evaluation':
        raise ValueError('Cleanup requires an evaluator-created marker')
    r=settings['retention'];mode=override or r['successful' if status=='evaluated' else 'failed']
    if mode not in ['compact','diagnostic','full']:raise ValueError('Invalid retention override')
    previous=load(out/'retention.json') if (out/'retention.json').exists() else {}
    result={'mode':mode,'bytes_before':size(out),'removed_files':previous.get('removed_files',0),'removed_bytes':previous.get('removed_bytes',0),'logs':previous.get('logs',[]),
            'preserved':'candidate RTL, config, metrics, scripts, status, proof result, bounded logs; external study/agent records untouched'}
    if mode=='full':result['bytes_after']=result['bytes_before'];save(out/'retention.json',result);return result
    budget=r['max_failure_evidence_bytes'] if mode=='diagnostic' else 0
    kept=0
    known={'metrics.json','area.json','synthesis-config.json','timing.json','timing.txt','electrical.txt',
           'evaluation.sdc','abc.script','abc.constr','synthesis.ys','sta.tcl','result.json',
           'localization-hierarchy_area.json','localization-timing_module.json','localization-timing_syntax.json',
           'baseline-cache.json','constraint-coverage.txt'}
    # Only evaluator build directories and duplicate reference trees are eligible.
    roots=[out/'baseline',out/'candidate']
    files=[]
    for work in roots:
        if not work.exists():continue
        for p in work.rglob('*'):
            within(out,p)
            if p.is_file():files.append((work,p))
    failed_prefix=None
    proof=out/'candidate/build/hierproof-v6/result.json'
    if proof.exists():
        data=load(proof)
        failed=next((v for v in reversed(data.get('modules',[])) if not v.get('passed',False)),None)
        if failed and failed.get('log'):failed_prefix=Path(failed['log']).stem
    files.sort(key=lambda item:0 if item[1].suffix in ['.vcd','.fst','.cex'] or (failed_prefix and item[1].name.startswith(failed_prefix)) else 1)
    for work,p in files:
        rel=p.relative_to(work)
        duplicate=rel.parts[0]=='reference' or (work.name=='baseline' and rel.parts[0]=='rtl')
        if rel.parts[0] not in ['build','reference'] and not duplicate:continue
        n=p.stat().st_size
        keep=not duplicate and (p.name in known or p.name.endswith('.status.json') or p.suffix in ['.ys','.tcl'])
        if not duplicate and p.suffix=='.log':
            record=compact_log(p,r['max_log_bytes']);record['directory']=str(p.parent.relative_to(out));result['logs'].append(record);continue
        if not duplicate and p.name.endswith('.log.gz'):continue
        extra=p.suffix in ['.vcd','.fst','.cex'] or (failed_prefix and p.name.startswith(failed_prefix)) or (not failed_prefix and p.name in ['mapped.v','mapped.json','gold.json','gate.json'])
        if not keep and not duplicate and mode=='diagnostic' and extra and n+kept<=budget:
            keep=True;kept+=n
        if not keep:
            p.unlink();result['removed_files']+=1;result['removed_bytes']+=n
    # Remove empty managed folders only; never touch external candidate/selected RTL.
    for work in roots:
        if work.exists():
            for p in sorted(work.rglob('*'),key=lambda p:len(p.parts),reverse=True):
                if p.is_dir() and not any(p.iterdir()):p.rmdir()
    result['diagnostic_extra_bytes']=kept;result['bytes_after']=size(out)
    save(out/'retention.json',result);return result

def compress_agent(directory,settings):
    """Lossless gzip after a candidate finishes; live contexts are never touched."""
    out=Path(directory)
    if not out.exists() or not settings['retention']['compress_agent_logs']:return {}
    agent=out/'agent.json'
    if not agent.exists() or load(agent).get('status')=='running':return {}
    paths=[*out.glob('request-*.json'),*out.glob('response-*.json'),*out.glob('tool-[0-9]*.json')]
    if (out/'transcript.json').exists():paths.append(out/'transcript.json')
    paths.extend((out/'context-archive').glob('*.json'))
    previous=load(out/'compression.json') if (out/'compression.json').exists() else {'lossless':True,'files':[]}
    if not paths:return previous
    result=previous['files']
    for p in paths:
        within(out,p);dest=p.with_name(p.name+'.gz');temp=dest.with_name(dest.name+'.tmp')
        if dest.exists() or dest.is_symlink() or temp.exists():raise ValueError('Agent compression destination exists')
        original=sha(p);before=p.stat().st_size
        with p.open('rb') as src,gzip.open(temp,'wb') as target:
            import shutil
            shutil.copyfileobj(src,target)
        temp.replace(dest);p.unlink();result.append({'file':str(p.relative_to(out)),'sha256':original,'bytes':before,'gzip_bytes':dest.stat().st_size})
    summary={'lossless':True,'files':result};save(out/'compression.json',summary);return summary
