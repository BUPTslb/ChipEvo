from pathlib import Path
import hashlib,json,os,signal,subprocess,time

def load(path):
    return json.loads(Path(path).read_text(encoding="utf-8-sig"))

def save(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    tmp=path.with_suffix(path.suffix+".tmp")
    tmp.write_text(json.dumps(value,ensure_ascii=False,indent=2,allow_nan=False)+"\n",encoding="utf-8")
    tmp.replace(path)

def sha(path):
    h=hashlib.sha256()
    with Path(path).open("rb") as f:
        while chunk:=f.read(1024*1024):h.update(chunk)
    return h.hexdigest()

def inside(root,path):
    root=Path(root).resolve();path=Path(path).resolve()
    if not path.is_relative_to(root):raise ValueError(f"Path outside allowed root: {path}")
    return path

def execute(cmd,cwd,log,timeout=3600,env=None):
    log=Path(log);log.parent.mkdir(parents=True,exist_ok=True);start=time.monotonic()
    with log.open("w",encoding="utf-8") as f:
        p=subprocess.Popen([str(v) for v in cmd],cwd=cwd,stdout=f,stderr=subprocess.STDOUT,env=env,start_new_session=True)
        try:rc=p.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            try:os.killpg(p.pid,signal.SIGTERM)
            except ProcessLookupError:pass
            try:p.wait(timeout=10)
            except subprocess.TimeoutExpired:
                try:os.killpg(p.pid,signal.SIGKILL)
                except ProcessLookupError:pass
                p.wait()
            rc=124
    result={"command":[str(v) for v in cmd],"exit_code":rc,"seconds":round(time.monotonic()-start,3),"log":str(log)}
    save(log.with_suffix(".status.json"),result)
    return result

def checked(cmd,cwd,log,timeout=3600,env=None):
    r=execute(cmd,cwd,log,timeout,env)
    if r["exit_code"]:raise RuntimeError(f"Tool failed ({r['exit_code']}): {log}")
    return r

def ys_quote(path):
    return '"'+str(Path(path).resolve()).replace('\\','/').replace('"','\\"')+'"'

def tcl_quote(path):
    value=str(Path(path).resolve()).replace('\\','/')
    if any(c in value for c in '{}\n\r'):raise ValueError("Unsupported Tcl path characters")
    return '{'+value+'}'
