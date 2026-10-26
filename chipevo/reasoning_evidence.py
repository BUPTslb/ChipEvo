"""Observable provider evidence, not a claim about hidden computation."""
def observe(raw, model):
    blocks=raw.get('content') or []
    blocks=blocks if isinstance(blocks,list) else []
    thinking=[b for b in blocks if isinstance(b,dict) and b.get('type')=='thinking']
    detail=(raw.get('usage') or {}).get('output_tokens_details') or {}
    tokens=detail.get('thinking_tokens',detail.get('reasoning_tokens'))
    if isinstance(tokens,bool) or not isinstance(tokens,int) or tokens<0:tokens=None
    visible=any(bool(b.get('thinking')) for b in thinking)
    options=model.get('request_options') or {}
    return {'requested_effort':(options.get('output_config') or {}).get('effort'),
            'requested_thinking':options.get('thinking'),
            'thinking_blocks':len(thinking),'nonempty_thinking_observed':visible,
            'reasoning_tokens':tokens,
            'status':'observed' if visible or (tokens is not None and tokens>0) else 'unconfirmed',
            'note':'Requested effort is not independently verified upstream effort.'}

def aggregate(rows):
    known=[r['reasoning_tokens'] for r in rows if r.get('reasoning_tokens') is not None]
    observed=sum(r.get('status')=='observed' for r in rows)
    return {'responses':len(rows),'observed_responses':observed,
            'unconfirmed_responses':len(rows)-observed,
            'reported_reasoning_tokens':sum(known) if known else None,
            'reasoning_usage_complete':bool(rows) and len(known)==len(rows),
            'status':'unconfirmed' if not observed else 'mixed' if observed<len(rows) else 'observed'}

