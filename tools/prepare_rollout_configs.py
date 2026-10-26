"""Prepare launch configurations only. Does not read keys or call providers/EDA."""
from pathlib import Path
import copy,json
root=Path(__file__).resolve().parents[1]
base=json.loads((root/'configs/studies/multimodel.json').read_text())
models=[
 {'id':'deepseek','protocol':'openai_chat','base_url':'https://api.deepseek.com','model':'deepseek-v4-pro','api_key_env':'ChipEVO_Deepseek',
  'context_window_tokens':1048576,'request_options':{'thinking':{'type':'enabled'},'reasoning_effort':'high'},
  'context_window_source':'https://api-docs.deepseek.com/api/list-models/'},
 {'id':'kimi','protocol':'openai_chat','base_url':'https://api.kimi.com/coding/v1','model':'k3','api_key_env':'ChipEVO_Kimi',
  'context_window_tokens':262144,'request_options':{'reasoning_effort':'high'},
  'context_window_note':'Conservative client ceiling; k3 capacity depends on account tier. Shared input estimate stays 65536.',
  'context_window_source':'https://www.kimi.com/en/help/kimi-code/models'},
 {'id':'chatgpt','protocol':'openai_responses','base_url':'http://127.0.0.1:8317/v1','model':'gpt-6-astra','api_key_env':'ChipEVO_Astra',
  'context_window_tokens':262144,'request_options':{'reasoning':{'effort':'high'}},
  'context_window_note':'Conservative client ceiling below existing project configuration; actual proxy model window not probed in preparation.'}
]
configs={}
for model in models:model['max_concurrent_requests']=5
for name,selected,rounds,designs in [('pilot-kimi-zipcpu',[models[1]],1,['zipcpu']),
                                     ('pilot-three-models',models,1,['zipcpu']),
                                     ('three-models-10rounds',models,10,list(base['designs']))]:
    cfg=copy.deepcopy(base);cfg.update(study_id=name+'-v1',models=selected,rounds=rounds)
    cfg['designs']={d:base['designs'][d] for d in designs}
    cfg['storage']={'min_free_gib':10,'estimated_agent_bytes_per_candidate':8388608}
    configs[root/'configs/studies'/(name+'.json')]=cfg
if any(p.exists() for p in configs):raise SystemExit('Refusing to overwrite existing launch configurations')
for p,cfg in configs.items():p.write_text(json.dumps(cfg,ensure_ascii=False,indent=2)+'\n');print(str(p.relative_to(root)))
