"""Evaluator-owned, content-addressed baseline measurements. Never cache candidates."""
from pathlib import Path
from contextlib import contextmanager
import hashlib,hmac,json,math,os,secrets,time,tempfile
from .util import load,save,sha

SCHEMA=1

def canonical(value):
    return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False,allow_nan=False).encode()

def fingerprint(root,design,objective,period_ns):
    root=Path(root);files={}
    for directory in [root/'designs'/design/'reference',root/'designs'/design/'constraints',root/'designs'/design/'context',root/'technology',root/'chipevo']:
        for path in sorted(directory.rglob('*')):
            if path.is_file() and '__pycache__' not in path.parts and path.suffix!='.pyc':
                if path.is_symlink():raise ValueError('Symlink in baseline inputs: '+str(path))
                files[str(path.relative_to(root))]=sha(path)
    for rel in [f'designs/{design}/manifest.json',f'designs/{design}/policy.json','configs/toolchain.json','tools/runtime/FILES.sha256.json']:
        files[rel]=sha(root/rel)
    # Runtime contents must already have passed verify_assets/verify_runtime.
    # Include the verified manifest, hence every executable/shared library/share file.
    inputs={'schema':SCHEMA,'design':design,'objective':objective,'period_ns':period_ns,'files':files,
            'environment':{k:os.environ.get(k) for k in ['LANG','LC_ALL','LC_NUMERIC','TZ']}}
    return hashlib.sha256(canonical(inputs)).hexdigest(),inputs

@contextmanager
def exclusive(path):
    """OS releases the lock on process death; an interrupted writer cannot deadlock."""
    path=Path(path)
    if path.is_symlink():raise ValueError('Cache lock is a symlink')
    with path.open('a+b') as f:
        if os.name=='nt':
            import msvcrt
            if f.tell()==0:f.write(b'0');f.flush()
            f.seek(0)
            while True:
                try:msvcrt.locking(f.fileno(),msvcrt.LK_NBLCK,1);break
                except OSError:time.sleep(.05)
            try:yield
            finally:f.seek(0);msvcrt.locking(f.fileno(),msvcrt.LK_UNLCK,1)
        else:
            import fcntl
            fcntl.flock(f,fcntl.LOCK_EX)
            try:yield
            finally:fcntl.flock(f,fcntl.LOCK_UN)

def validate_metrics(metrics):
    for key in ['total_area_um2','standard_cell_area_um2','fixed_sram_macro_area_um2','effective_delay_ns','ordinary_setup_worst_slack_ns','period_ns']:
        value=metrics[key]
        if isinstance(value,bool) or not isinstance(value,(int,float)) or not math.isfinite(value):
            raise ValueError('Invalid cached metric: '+key)
    if metrics['total_area_um2']<0 or metrics['period_ns']<=0:raise ValueError('Invalid cache metric range')
    if not isinstance(metrics['macro_instances'],dict):raise ValueError('Invalid macro inventory')
    for key in ['hold_worst_slack_ns','special_worst_slack_ns','global_setup_worst_slack_ns','tns_ns']:
        value=metrics.get(key)
        if value is not None and (isinstance(value,bool) or not isinstance(value,(int,float)) or not math.isfinite(value)):
            raise ValueError('Invalid cached timing metric: '+key)

class BaselineCache:
    def __init__(self,directory,max_entries=32,max_bytes=268435456):
        path=Path(directory).absolute()
        # This directory is evaluator-owned, outside candidate workspaces. Do not
        # follow candidate-created links, accept cache uploads, or expose the key.
        for part in [path,*path.parents]:
            if part.is_symlink():raise ValueError('Cache path contains a symlink')
        path.mkdir(parents=True,exist_ok=True,mode=0o700)
        self.directory=path
        self.max_entries=max_entries;self.max_bytes=max_bytes
        if os.name!='nt':
            if path.stat().st_uid!=os.getuid():raise ValueError('Cache is not evaluator-owned')
            path.chmod(0o700)
        with exclusive(path/'.authority.lock'):
            authority=path/'.authority'
            if authority.is_symlink():raise ValueError('Cache authority is a symlink')
            if not authority.exists():
                fd=os.open(authority,os.O_CREAT|os.O_EXCL|os.O_WRONLY,0o600)
                with os.fdopen(fd,'wb') as f:f.write(secrets.token_bytes(32))
            self.secret=authority.read_bytes()
            if len(self.secret)!=32:raise ValueError('Invalid cache authority; use a new empty cache directory')

    def get_or_build(self,key,inputs,builder):
        if not isinstance(key,str) or len(key)!=64 or any(c not in '0123456789abcdef' for c in key):
            raise ValueError('Invalid cache key')
        if hashlib.sha256(canonical(inputs)).hexdigest()!=key:raise ValueError('Cache key does not match inputs')
        entry=self.directory/(key+'.json');reason='not_found'
        with exclusive(self.directory/(key+'.lock')):
            if entry.is_symlink():raise ValueError('Cache entry is a symlink')
            if entry.exists():
                try:
                    if entry.stat().st_size>min(64*1024**2,self.max_bytes):raise ValueError('Oversized cache entry')
                    record=load(entry);payload=record['payload']
                    expected=hmac.new(self.secret,canonical(payload),hashlib.sha256).hexdigest()
                    if not hmac.compare_digest(expected,record['signature']):raise ValueError('Cache signature mismatch')
                    if payload['key']!=key or payload['inputs']!=inputs:raise ValueError('Cache inputs mismatch')
                    validate_metrics(payload['metrics'])
                    if payload['metrics']['period_ns']!=inputs.get('period_ns',payload['metrics']['period_ns']):raise ValueError('Cache period mismatch')
                    os.utime(entry,None)
                    self.prune(key)
                    return payload,{'hit':True,'key':key,'verified':True,'directory':str(self.directory)}
                except (OSError,ValueError,KeyError,TypeError):reason='invalid_entry_rebuilt'
            # Builder failures never publish an entry. Atomic file replacement
            # prevents readers from accepting a partially written measurement.
            produced=builder();validate_metrics(produced['metrics'])
            if produced['metrics']['period_ns']!=inputs.get('period_ns',produced['metrics']['period_ns']):raise ValueError('Builder used wrong period')
            payload={'key':key,'inputs':inputs,**produced}
            record={'payload':payload,'signature':hmac.new(self.secret,canonical(payload),hashlib.sha256).hexdigest()}
            blob=canonical(record)
            if len(blob)>64*1024**2:raise ValueError('Baseline cache payload exceeds 64 MiB')
            if len(blob)>self.max_bytes:
                entry.unlink(missing_ok=True)
                return payload,{'hit':False,'key':key,'verified':True,'miss_reason':'entry_exceeds_cache_budget','directory':str(self.directory)}
            fd,name=tempfile.mkstemp(prefix=key+'-',suffix='.tmp',dir=self.directory)
            try:
                with os.fdopen(fd,'wb') as f:f.write(blob);f.flush();os.fsync(f.fileno())
                os.replace(name,entry)
            finally:
                if Path(name).exists():Path(name).unlink()
            self.prune(key)
            return payload,{'hit':False,'key':key,'verified':True,'miss_reason':reason,'directory':str(self.directory)}

    def prune(self,current):
        """Bound only this owned cache; eviction never touches experiment records."""
        with exclusive(self.directory/'.prune.lock'):
            files=[p for p in self.directory.glob('*.json') if len(p.stem)==64 and all(c in '0123456789abcdef' for c in p.stem) and not p.is_symlink()]
            files.sort(key=lambda p:p.stat().st_mtime)
            total=sum(p.stat().st_size for p in files);count=len(files)
            for p in files:
                if count<=self.max_entries and total<=self.max_bytes:break
                if p.stem==current:continue
                try:n=p.stat().st_size;p.unlink()
                except OSError:continue
                total-=n;count-=1

def capture(build):
    """Only compact baseline evidence; never persist mapped netlists/proof partitions."""
    build=Path(build);files={}
    names=['metrics.json','area.json','synthesis-config.json','timing.json','timing.txt','electrical.txt',
           'evaluation.sdc','synthesis.ys','abc.script','abc.constr','sta.tcl','sta.log','constraint-coverage.txt',
           'localization-hierarchy_area.json','localization-timing_module.json','localization-timing_syntax.json']
    for name in names:
        path=build/name
        if path.exists():
            if path.stat().st_size>16*1024**2:raise ValueError('Unexpectedly large baseline evidence: '+name)
            files[name]=path.read_text()
    return files

def restore(build,files):
    build=Path(build);build.mkdir(parents=True,exist_ok=True)
    for name,text in files.items():
        if Path(name).name!=name or not isinstance(text,str):raise ValueError('Invalid cached evidence filename')
        (build/name).write_text(text)
