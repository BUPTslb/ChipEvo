"""Provider usage is recorded as reported; missing counts are never zero-filled."""
import math

def normalize_usage(raw,protocol):
    raw=raw or {}
    def count(value):return value if isinstance(value,int) and not isinstance(value,bool) and value>=0 else None
    def detail(name,key):return count((raw.get(name) or {}).get(key))
    if protocol=='anthropic_messages':
        parts=[count(raw.get(k,0)) for k in ['cache_creation_input_tokens','cache_read_input_tokens']]
        inp=count(raw.get('input_tokens'));inp=inp+sum(parts) if inp is not None and all(v is not None for v in parts) else None
        out=count(raw.get('output_tokens'));cache=count(raw.get('cache_read_input_tokens'));reason=detail('output_tokens_details','thinking_tokens')
        if reason is None:reason=detail('output_tokens_details','reasoning_tokens')
    elif protocol=='openai_responses':
        inp=count(raw.get('input_tokens'));out=count(raw.get('output_tokens'))
        cache=detail('input_tokens_details','cached_tokens')
        reason=detail('output_tokens_details','reasoning_tokens')
    else:
        inp=count(raw.get('prompt_tokens'));out=count(raw.get('completion_tokens'))
        cache=count((raw.get('prompt_tokens_details') or {}).get('cached_tokens',raw.get('prompt_cache_hit_tokens',raw.get('cached_tokens'))))
        reason=detail('completion_tokens_details','reasoning_tokens')
    return {'input_tokens':inp,'output_tokens':out,'total_tokens':inp+out if inp is not None and out is not None else None,
            'cached_input_tokens':cache,'reasoning_tokens':reason,
            'cache_write_input_tokens':count(raw.get('cache_creation_input_tokens')) if protocol=='anthropic_messages' else detail('input_tokens_details','cache_write_tokens'),
            'raw':raw}

def sum_usage(rows):
    out={}
    for key in ['input_tokens','output_tokens','total_tokens','cached_input_tokens','cache_write_input_tokens','reasoning_tokens']:
        vals=[r.get(key) for r in rows];known=[v for v in vals if v is not None]
        out[key]=sum(known) if known else None
        out[key+'_complete']=bool(vals) and len(known)==len(vals)
    return out

def promotable(report,objective,incumbent,delay_epsilon,area_epsilon):
    if report.get('status')!='evaluated' or report.get('formal_status')!='PASS' or not report.get('feasible',False):return False
    m=report.get('candidate') or {};key='effective_delay_ns' if objective=='timing' else 'total_area_um2'
    v=m.get(key);old=incumbent.get(key)
    if any(isinstance(x,bool) or not isinstance(x,(int,float)) or not math.isfinite(x) or x<=0 for x in [v,old]):return False
    eps=delay_epsilon if objective=='timing' else area_epsilon
    return v<old-eps

def choose(candidates,objective,incumbent,delay_epsilon,area_epsilon):
    valid=[r for r in candidates if promotable(r['report'],objective,incumbent,delay_epsilon,area_epsilon)]
    if not valid:return None
    primary='effective_delay_ns' if objective=='timing' else 'total_area_um2'
    secondary='total_area_um2' if objective=='timing' else 'effective_delay_ns'
    return min(valid,key=lambda r:(r['report']['candidate'][primary],r['report']['candidate'][secondary],r['candidate_id']))
