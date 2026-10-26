"""Stateless HTTPS adapters. Secrets stay in host environment, never transcripts."""
import copy,os,json,time,urllib.request,urllib.error
from .study_metrics import normalize_usage

def summary_model(model):
    """Unified policy: summaries retain each main model's reasoning options."""
    return copy.deepcopy(model)

def anthropic_messages(messages):
    system='\n'.join(m['content'] for m in messages if m['role']=='system');out=[]
    for m in messages:
        if m['role']=='system':continue
        if m['role']=='assistant':
            content=m.get('provider_content')
            if content is None:
                content=([{'type':'text','text':m['content']}] if m.get('content') else [])
                content += [{'type':'tool_use','id':c['id'],'name':c['function']['name'],'input':json.loads(c['function']['arguments'])} for c in m.get('tool_calls',[])]
            role='assistant'
        elif m['role']=='tool':
            role='user';content=[{'type':'tool_result','tool_use_id':m['tool_call_id'],'content':m['content']}]
        else:role='user';content=[{'type':'text','text':m['content']}]
        if out and out[-1]['role']==role:out[-1]['content'].extend(content)
        else:out.append({'role':role,'content':content})
    return system,out

def payload(model,messages,tools,max_tokens):
    options=dict(model.get('request_options',{}))
    if model['protocol']=='openai_responses':
        items=[]
        for m in messages:
            if m['role']=='assistant':
                if m.get('provider_content') is not None:items.extend(m['provider_content'])
                else:
                    if m.get('content'):items.append({'role':'assistant','content':m['content']})
                    items.extend({'type':'function_call','call_id':c['id'],'name':c['function']['name'],'arguments':c['function']['arguments']} for c in m.get('tool_calls',[]))
            elif m['role']=='tool':items.append({'type':'function_call_output','call_id':m['tool_call_id'],'output':m['content']})
            else:items.append({'role':m['role'],'content':m['content']})
        return {**options,'model':model['model'],'input':items,'max_output_tokens':max_tokens,'stream':False,'store':False,
                'include':['reasoning.encrypted_content'],
                'tools':[{'type':'function',**t['function']} for t in tools]}
    if model['protocol']=='anthropic_messages':
        system,msgs=anthropic_messages(messages)
        return {**options,'model':model['model'],'system':system,'messages':msgs,'max_tokens':max_tokens,
                'tools':[{'name':t['function']['name'],'description':t['function']['description'],'input_schema':t['function']['parameters']} for t in tools]}
    field=model.get('token_limit_field','max_tokens')
    if field not in ['max_tokens','max_completion_tokens']:raise ValueError('Invalid token-limit field')
    return {**options,'model':model['model'],'messages':messages,'tools':tools,field:max_tokens,'stream':False}

def decode(data,protocol):
    if protocol=='openai_responses':
        content=data.get('output',[])
        message={'role':'assistant','content':'\n'.join(b.get('text','') for item in content if item.get('type')=='message' for b in item.get('content',[]) if b.get('type')=='output_text'),
                 'provider_content':content,'tool_calls':[{'id':b['call_id'],'type':'function','function':{'name':b['name'],'arguments':b['arguments']}} for b in content if b.get('type')=='function_call']}
        stop=data.get('status')
        if stop=='incomplete':stop=data.get('incomplete_details',{}).get('reason','incomplete')
        if any(b.get('type')=='refusal' for item in content if item.get('type')=='message' for b in item.get('content',[])):stop='refusal'
    elif protocol=='anthropic_messages':
        content=data.get('content',[])
        message={'role':'assistant','content':'\n'.join(b['text'] for b in content if b.get('type')=='text'),
                 'provider_content':content,'tool_calls':[{'id':b['id'],'type':'function','function':{'name':b['name'],'arguments':json.dumps(b['input'])}} for b in content if b.get('type')=='tool_use']}
        stop=data.get('stop_reason')
    else:
        choice=data['choices'][0];message=choice['message'];stop=choice.get('finish_reason')
        if message.get('refusal'):stop='refusal'
    if stop in ['stop','completed','end_turn'] and not message.get('tool_calls') and not (message.get('content') or '').strip():stop='empty_delivery'
    if stop in ['tool_calls','tool_use'] and not message.get('tool_calls'):stop='invalid_tool_delivery'
    return {'message':message,'stop_reason':stop,'usage':normalize_usage(data.get('usage'),protocol),
            'returned_model':data.get('model'),'response_id':data.get('id')}

class ContextWindowExceeded(RuntimeError):pass


def call(model,body,timeout,max_bytes):
    from contextlib import ExitStack,nullcontext
    from .api_gate import request_slot
    from .timing_budget import current_candidate_clock
    clock=current_candidate_clock.get()
    with ExitStack() as slots:
        with clock.waiting() if clock is not None else nullcontext():
            queued=slots.enter_context(request_slot(model))
        http_timeout=timeout if clock is None else min(timeout,clock.remaining())
        if http_timeout<=0:raise TimeoutError('Candidate active-time budget exhausted before HTTP request')
        result=_call(model,body,http_timeout,max_bytes)
    result['api_queue_wait_s']=queued
    return result


def _call(model,body,timeout,max_bytes):
    key=os.environ.get(model['api_key_env'])
    if not key:raise ValueError('Missing API credential environment variable: '+model['api_key_env'])
    protocol=model['protocol'];url=model['base_url'].rstrip('/')+({'anthropic_messages':'/messages','openai_responses':'/responses'}.get(protocol,'/chat/completions'))
    headers={'Content-Type':'application/json'}
    if protocol=='anthropic_messages':headers.update({'x-api-key':key,'anthropic-version':'2023-06-01'})
    else:headers['Authorization']='Bearer '+key
    req=urllib.request.Request(url,data=json.dumps(body).encode(),headers=headers)
    start=time.monotonic()
    try:
        with urllib.request.urlopen(req,timeout=timeout) as response:
            raw=response.read(max_bytes+1)
        if len(raw)>max_bytes:raise RuntimeError('Provider response exceeds configured byte limit')
        data=json.loads(raw)
    except urllib.error.HTTPError as e:
        # Inspect only for the narrow context-error category; never persist server bodies.
        try:detail=e.read(8192).decode('utf-8','replace').lower()
        except Exception:detail=''
        if e.code in [400,413] and any(s in detail for s in ['context_length_exceeded','context_window_exceeded','maximum context length','prompt is too long','exceeds the context window']):
            raise ContextWindowExceeded('Provider confirmed context window exceeded; body omitted') from None
        raise RuntimeError('Provider HTTP '+str(e.code)+'; error body omitted') from None
    except urllib.error.URLError:raise RuntimeError('Provider connection failed; no automatic retry') from None
    except Exception as e:raise RuntimeError(type(e).__name__+': provider response failed; credentials omitted') from None
    result=decode(data,protocol);result.update(raw=data,latency_s=time.monotonic()-start)
    return result
