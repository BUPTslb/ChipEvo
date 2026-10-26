"""Linux host-wide model request slots, shared across processes and studies."""
from contextlib import contextmanager
from pathlib import Path
import hashlib, os, time
from urllib.parse import urlsplit

@contextmanager
def request_slot(model, timeout=None):
    import fcntl
    limit=model.get('max_concurrent_requests',5)
    if isinstance(limit,bool) or not isinstance(limit,int) or not 1<=limit<=5:
        raise ValueError('max_concurrent_requests must be an integer from 1 to 5')
    u=urlsplit(model['base_url'])
    host=(u.hostname or '').lower()
    if host in ['localhost','::1']:host='127.0.0.1'
    identity=f'{u.scheme.lower()}://{host}:{u.port or (443 if u.scheme=="https" else 80)}{u.path.rstrip("/")}|{model["model"]}'
    key=hashlib.sha256(identity.encode()).hexdigest()
    base=Path(os.environ.get('CHIPEVO_API_LOCK_DIR',str(Path.home()/'.cache/chipevo/api-slots')))
    base.mkdir(parents=True,exist_ok=True,mode=0o700)
    start=time.monotonic();held=None
    admission=open(base/f'{key}-admission.lock','a+b');admitted=False
    try:
        # A waiting caller owns admission until a slot becomes free, so fresh
        # callers cannot repeatedly take slots ahead of that waiter.
        if timeout is None:
            fcntl.flock(admission,fcntl.LOCK_EX);admitted=True
        else:
            while not admitted:
                try:fcntl.flock(admission,fcntl.LOCK_EX|fcntl.LOCK_NB);admitted=True
                except BlockingIOError:
                    remaining=timeout-(time.monotonic()-start)
                    if remaining<=0:raise TimeoutError('Explicit API queue timeout exhausted')
                    time.sleep(min(.05,remaining))
        while held is None:
            for slot in range(limit):
                handle=open(base/f'{key}-{slot}.lock','a+b')
                try:fcntl.flock(handle,fcntl.LOCK_EX|fcntl.LOCK_NB)
                except BlockingIOError:handle.close();continue
                held=handle;break
            if held is None:
                remaining=None if timeout is None else timeout-(time.monotonic()-start)
                if remaining is not None and remaining<=0:raise TimeoutError('Explicit API queue timeout exhausted')
                time.sleep(.05 if remaining is None else min(.05,remaining))
        waited=time.monotonic()-start
        if timeout is not None and waited>=timeout:raise TimeoutError('Explicit API queue timeout exhausted')
        fcntl.flock(admission,fcntl.LOCK_UN);admitted=False
        yield waited
    finally:
        if admitted:fcntl.flock(admission,fcntl.LOCK_UN)
        admission.close()
        if held is not None:
            fcntl.flock(held,fcntl.LOCK_UN);held.close()
