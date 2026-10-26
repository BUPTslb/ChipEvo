"""Strict experiment configuration; reading/planning never launches work."""
from pathlib import Path
import math,re
from urllib.parse import urlsplit
from .util import load

def identifier(value):
    if not isinstance(value,str) or not re.fullmatch(r'[a-zA-Z0-9_-]+',value):
        raise ValueError('Unsafe/missing identifier')
    return value

def positive(value,name,integer=False):
    if isinstance(value,bool) or not isinstance(value,(int,float)) or not math.isfinite(value) or value<=0 or (integer and not isinstance(value,int)):
        raise ValueError(name+' must be explicitly set to a positive '+('integer' if integer else 'number'))
    return value

def validate_base_url(value):
    """Remote providers use TLS; explicit loopback proxies may use HTTP."""
    if not isinstance(value,str):raise ValueError('Set an explicit API base URL')
    u=urlsplit(value)
    if not u.hostname or u.username is not None or u.password is not None or u.query or u.fragment:
        raise ValueError('API base URL must have a host and no credentials/query/fragment')
    _=u.port  # Reject invalid port syntax before launching any work.
    if u.scheme=='https':return
    if u.scheme=='http' and u.hostname in ['127.0.0.1','localhost','::1']:return
    raise ValueError('Use HTTPS for remote providers; HTTP is allowed only on loopback')

def read_config(path,ready=False):
    cfg=load(path)
    identifier(cfg['study_id'])
    objectives=cfg.get('objectives',['timing','area'])
    if not isinstance(objectives,list) or not objectives or any(o not in ['timing','area'] for o in objectives) or len(set(objectives))!=len(objectives):
        raise ValueError('objectives must be a nonempty unique list of timing/area')
    if cfg.get('candidates_per_round')!=5:raise ValueError('This protocol requires exactly five independent candidates per round')
    if ready:positive(cfg.get('rounds'),'rounds',True)
    budget=cfg['budget']
    if ready and (cfg.get('experiment_protocol')!='round-feedback-v1' or budget.get('max_eda_feedback_calls')!=0):
        raise ValueError('New launches require round-feedback-v1 with zero in-candidate EDA calls')
    storage=cfg.get('storage',{})
    positive(storage.get('min_free_gib',10),'storage.min_free_gib')
    positive(storage.get('estimated_agent_bytes_per_candidate',8*1024**2),'storage.estimated_agent_bytes_per_candidate',True)
    for key in ['max_output_tokens','max_http_response_bytes',
                'max_estimated_input_tokens','context_safety_tokens','max_read_lines','max_source_result_chars']:
        positive(budget.get(key),key,True)
    for key in ['max_api_calls','max_source_chars','max_tool_calls']:
        if budget.get(key) is not None:positive(budget[key],key,True)
    if not 0<budget.get('context_trigger_ratio',.8)<1:raise ValueError('Invalid context trigger ratio')
    if not 0<budget.get('context_retain_ratio',.5)<budget.get('context_trigger_ratio',.8):
        raise ValueError('Context retain ratio must be positive and below trigger ratio')
    for key,default in [('summary_input_chars',16000),('summary_min_new_groups',4)]:
        positive(budget.get(key,default),key,True)
    for key in ['api_timeout_s','candidate_wall_timeout_s']:positive(budget.get(key),key)
    if isinstance(budget.get('max_eda_feedback_calls'),bool) or not isinstance(budget.get('max_eda_feedback_calls'),int) or budget['max_eda_feedback_calls']<0:raise ValueError('Invalid EDA feedback budget')
    for key,default in [('summary_max_output_tokens',16384),('context_keep_recent_groups',4)]:
        if key in budget:positive(budget[key],key,True)
    for key in ['promotion_delay_epsilon_ns','promotion_area_epsilon_um2']:positive(cfg[key],key)
    if not cfg.get('designs') or not cfg.get('models'):raise ValueError('At least one design and model required')
    for design,settings in cfg['designs'].items():
        identifier(design)
        for objective in ['timing','area']:
            value=settings.get(objective+'_frequency_mhz')
            if ready or value is not None:positive(value,design+'/'+objective+'_frequency_mhz')
        t=settings.get('timing_frequency_mhz');a=settings.get('area_frequency_mhz')
        if t is not None and a is not None and t<=a:raise ValueError('Timing-optimization frequency must exceed area-constraint frequency')
    for model in cfg['models']:
        identifier(model['id'])
        limit=model.get('max_concurrent_requests',5)
        if isinstance(limit,bool) or not isinstance(limit,int) or not 1<=limit<=5:
            raise ValueError('max_concurrent_requests must be an integer from 1 to 5')
        aliases=model.get('accepted_returned_models')
        if aliases is not None and (not isinstance(aliases,list) or not aliases or any(not isinstance(x,str) or not x.strip() for x in aliases)):
            raise ValueError('accepted_returned_models must explicitly list permitted provider model identities')
        if model['protocol'] not in ['openai_chat','openai_responses','anthropic_messages']:raise ValueError('Unsupported model protocol')
        window=model.get('context_window_tokens')
        if ready or window is not None:
            positive(window,'Verified context_window_tokens for '+model['id'],True)
            if window<=budget['max_output_tokens']+budget['context_safety_tokens']:
                raise ValueError('Context window must leave room for input, output and safety')
        if ready:
            if not model.get('model'):raise ValueError('Exact model/version must be configured: '+model['id'])
            validate_base_url(model.get('base_url'))
            if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*',model.get('api_key_env','')):raise ValueError('Set an API key environment-variable NAME, never a secret in config')
        forbidden={'messages','input','tools','stream','model','max_tokens','max_completion_tokens','max_output_tokens','previous_response_id','conversation','store','include'} & set(model.get('request_options',{}))
        if forbidden:raise ValueError('Reserved request fields cannot be overridden')
    ids=[m['id'] for m in cfg['models']]
    if len(ids)!=len(set(ids)):raise ValueError('Duplicate model IDs')
    return cfg

def plan(cfg):
    rounds=cfg.get('rounds')
    return {'study_id':cfg['study_id'],'ready':rounds is not None and
            all(s.get(o+'_frequency_mhz') for s in cfg['designs'].values() for o in ['timing','area']) and all(m.get('model') and m.get('context_window_tokens') for m in cfg['models']),
            'rounds':rounds,'candidates_per_round':5,'model_calls_launched':0,'eda_jobs_launched':0,
            'candidate_count':len(cfg['designs'])*len(cfg.get('objectives',['timing','area']))*len(cfg['models'])*rounds*5 if rounds else None,
            'tasks':[{'design':d,'objective':o,'frequency_mhz':s.get(o+'_frequency_mhz'),
                      'period_ns':1000/s[o+'_frequency_mhz'] if s.get(o+'_frequency_mhz') else None}
                     for d,s in cfg['designs'].items() for o in cfg.get('objectives',['timing','area'])],
            'protocol':'Each model/objective chain starts from original RTL; five fresh conversations fork from one immutable incumbent each round.'}
