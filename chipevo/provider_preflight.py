"""Batch-local provider probe; no credential or reasoning text in audit files."""
import copy, hashlib, os
from .providers import payload,call
from .reasoning_evidence import observe
from .util import save

def check(model,budget,path):
    key=os.environ.get(model['api_key_env'],'')
    report={'requested_model':model['model'],'protocol':model['protocol'],
            'credential_fingerprint':hashlib.sha256(key.encode()).hexdigest()[:16],
            'requested_options':model.get('request_options'), 'calls':[], 'passed':False}
    save(path,report)
    messages=[{'role':'user','content':'Find the smallest positive integer n such that n modulo 7 is 3, n modulo 11 is 5, and n modulo 13 is 8. Check your result. Return only the integer and a short verification.'}]
    try:
        body=payload(model,messages,[],budget['max_output_tokens'])
        result=call(model,body,budget['api_timeout_s'],budget['max_http_response_bytes'])
        evidence=observe(result['raw'],model)
        report['calls'].append({'kind':'high_probe','response_id':result.get('response_id'),'returned_model':result.get('returned_model'),'usage':result['usage'],'latency_s':result['latency_s'],'evidence':evidence})
        if result.get('returned_model') not in model.get('accepted_returned_models',[model['model']]):raise ValueError('Preflight returned unexpected model')
        if evidence['status']!='observed':raise ValueError('High requested but no observable reasoning evidence; batch not launched')
        bad=copy.deepcopy(model);bad.setdefault('request_options',{}).setdefault('output_config',{})['effort']='INVALID_PROBE'
        try:
            invalid=call(bad,payload(bad,[{'role':'user','content':'Reply OK.'}],[],128),budget['api_timeout_s'],budget['max_http_response_bytes'])
        except RuntimeError as exc:
            report['calls'].append({'kind':'invalid_effort_probe','error':str(exc)})
            if not str(exc).startswith('Provider HTTP 400;'):raise
        else:
            report['calls'].append({'kind':'invalid_effort_probe','usage':invalid['usage']})
            raise ValueError('Provider accepted invalid effort; effort enforcement unconfirmed')
        report['passed']=True
        report['interpretation']='Reasoning output observed and invalid effort rejected; upstream high compute is not independently certified.'
    except Exception as exc:
        report['error']=str(exc)
        raise
    finally:save(path,report)
    return report

