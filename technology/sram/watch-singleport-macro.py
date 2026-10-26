from pathlib import Path
import subprocess,json,os,signal
B=Path('/home/shen/Desktop/project/ChipEvo/chips/gemmini/build/openram')
name='chipevo-sram_1rw_512x128'
try:
 r=subprocess.run(['docker','wait',name],capture_output=True,text=True,timeout=7200)
 rc=int(r.stdout.strip()) if r.returncode==0 else -1
except subprocess.TimeoutExpired:
 subprocess.run(['docker','stop','-t','2',name],timeout=30)
 rc=124
(B/'sram_1rw_512x128.exitcode').write_text(str(rc)+'\n')
(B/'sram_1rw_512x128.monitor.json').write_text(json.dumps({'container_exitcode':rc,'method':'docker wait; original sequential launcher suspended to permit parallel macro generation'},indent=2)+'\n')
pid=int((B/'paused-launcher.pid').read_text())
try:
 args=Path('/proc/'+str(pid)+'/cmdline').read_bytes().split(b'\0')
 if args[:2]==[b'bash',b'/home/shen/Desktop/project/ChipEvo/chips/technology/sram/run-candidate-macros.sh']:
  os.kill(pid,signal.SIGKILL)
except FileNotFoundError:pass
print('singleport exit',rc)
