"""Paste this entire file into the platform Code Grade text box (timing)."""
from pathlib import Path
import json,os,subprocess,sys,tarfile,tempfile,math

def run():
    tests=Path('/test_files');trusted=tests/'chipevo_grader'
    if trusted.is_symlink():raise RuntimeError('Trusted grader directory must not be a symlink')
    if not trusted.is_dir():
        archive=tests/'chipevo_grader.tar.gz'
        if not archive.is_file():raise RuntimeError('Upload chipevo_grader.tar.gz to /test_files')
        parent=Path(tempfile.mkdtemp(prefix='chipevo-trusted-',dir='/eval'))
        with tarfile.open(archive,'r:gz') as tar:
            for member in tar.getmembers():
                target=(parent/member.name).resolve()
                if not target.is_relative_to(parent.resolve()) or member.issym() or member.islnk() or not (member.isdir() or member.isfile()):raise RuntimeError('Unsafe trusted upload archive')
            tar.extractall(parent)
        trusted=parent/'chipevo_grader'
    output=Path('/eval/code_result.json');output.unlink(missing_ok=True)
    result=subprocess.run([sys.executable,'-I',str(trusted/'grading/score_timing.py'),'--trusted-root',str(trusted)],cwd='/eval',timeout=21600)
    if result.returncode:raise RuntimeError('Trusted grading process failed')
    if not Path('/eval/code_result.json').is_file():raise RuntimeError('Trusted grader did not produce a result')
    data=json.loads(output.read_text())
    if (set(data)!={'resolved','score','reason'} or not isinstance(data['resolved'],bool) or
        isinstance(data['score'],bool) or not isinstance(data['score'],(int,float)) or not math.isfinite(data['score']) or not 0<=data['score']<=1 or not isinstance(data['reason'],str)):
        raise RuntimeError('Trusted grader produced an invalid result schema')

try:
    Path('/eval').mkdir(parents=True,exist_ok=True);run()
except Exception as e:
    Path('/eval').mkdir(parents=True,exist_ok=True)
    Path('/eval/code_result.json').write_text(json.dumps({'resolved':False,'score':0.0,'reason':str(e)[:1500]}))
