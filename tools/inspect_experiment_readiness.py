"""Read-only checks. Never prints credentials or calls inference endpoints."""
import json,os,re,shlex,subprocess
from pathlib import Path

root=Path(__file__).resolve().parents[1]
child="import os,json; print('CHIPEVO_ENV='+json.dumps({'exported_names':sorted(k for k in os.environ if any(s in k.lower() for s in ['chipevo','openai','astra','deepseek','kimi'])),'deepseek_exported':bool(os.environ.get('ChipEVO_Deepseek')),'kimi_exported':bool(os.environ.get('ChipEVO_Kimi'))}))"
command='python3 -c '+shlex.quote(child)
command+='; for name in ChipEVO_Deepseek ChipEVO_Kimi OPENAI_API_KEY; do if [[ -v "$name" ]]; then printf "CHIPEVO_DEFINED=%s\\n" "$name"; fi; done'
p=subprocess.run(['bash','-ic',command],capture_output=True,text=True)
env={};defined=[]
for line in p.stdout.splitlines():
    if line.startswith('CHIPEVO_ENV='):env=json.loads(line.split('=',1)[1])
    if line.startswith('CHIPEVO_DEFINED='):defined.append(line.split('=',1)[1])
service=subprocess.run(['systemctl','--user','is-active','astra-api-proxy.service'],capture_output=True,text=True)
result={'bashrc_environment':env,'defined_shell_variables':defined,
        'proxy_key_file_present':(Path.home()/'.local/share/astra-api-proxy/client.key').is_file(),
        'proxy_service':service.stdout.strip(),'credentials_printed':False,'inference_requests':0}
print(json.dumps(result,indent=2))
