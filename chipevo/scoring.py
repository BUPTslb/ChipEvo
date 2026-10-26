"""Pure numerical scoring; never accepts a candidate-supplied metrics file."""
import math

def finite_number(value):
    return not isinstance(value,bool) and isinstance(value,(int,float)) and math.isfinite(value)

def score(objective,baseline,candidate,config,formal_pass=True,policy_pass=True,_constraints_only=False):
    result={"resolved":False,"score":0.0,"reason":""}
    if objective not in ['timing','area']:raise ValueError("Unknown objective")
    if not formal_pass or not policy_pass:
        result['reason']='Functional equivalence or immutable-asset policy did not pass';return result
    names=['total_area_um2','effective_delay_ns']
    for values in [baseline,candidate]:
        if any(not finite_number(values.get(k)) or values[k]<=0 for k in names):
            result['reason']='Missing or invalid metrics';return result
        for key in ['hold_worst_slack_ns','special_worst_slack_ns','ordinary_setup_worst_slack_ns','global_setup_worst_slack_ns','tns_ns']:
            if values.get(key) is not None and not finite_number(values[key]):
                result['reason']='Invalid timing metric: '+key;return result
    for key in ['max_area_ratio','max_delay_ratio','full_score_improvement']:
        if not finite_number(config.get(key)) or config[key]<=0:raise ValueError('Invalid scoring threshold: '+key)
    for key in ['area_tolerance_um2','delay_tolerance_ns','hold_tolerance_ns']:
        if key in config and (not finite_number(config[key]) or config[key]<0):raise ValueError('Invalid scoring tolerance: '+key)
    a0,d0=baseline[names[0]],baseline[names[1]];a,d=candidate[names[0]],candidate[names[1]]
    area_limit=a0*config['max_area_ratio']
    mode=config.get('delay_constraint','baseline')
    if mode not in ['baseline','period']:raise ValueError('Unknown delay constraint mode')
    delay_limit=config.get('target_period_ns') if mode=='period' else d0*config['max_delay_ratio']
    if not finite_number(delay_limit) or delay_limit<=0:raise ValueError('Missing positive target period')
    if a>area_limit+config.get('area_tolerance_um2',1e-6):
        result['reason']=f'Area cap failed: {a:.6f} > {area_limit:.6f} um2';return result
    if d>delay_limit+config.get('delay_tolerance_ns',1e-6):
        result['reason']=f'Delay cap failed: {d:.6f} > {delay_limit:.6f} ns';return result
    if mode=='period':
        # Meeting an ordinary path budget does not hide clock-gating or other setup failures.
        for key in ['ordinary_setup_worst_slack_ns','global_setup_worst_slack_ns']:
            value=candidate.get(key)
            if not isinstance(value,(int,float)) or not math.isfinite(value) or value < -config.get('delay_tolerance_ns',1e-6):
                result['reason']='Fixed-frequency setup timing failed or missing: '+key;return result
    # Baseline violations are disclosed; forbid making them worse, rather than
    # silently treating STA process exit as hold/electrical closure.
    h0=baseline.get('hold_worst_slack_ns');h=candidate.get('hold_worst_slack_ns')
    if config.get('no_hold_regression',True) and (h0 is None or h is None or h<min(0.,h0)-config.get('hold_tolerance_ns',1e-3)):
        result['reason']='Hold check missing or worsened beyond the configured tolerance';return result
    if config.get('no_special_check_regression',True):
        s0=baseline.get('special_worst_slack_ns');s=candidate.get('special_worst_slack_ns')
        if s0 is not None and (s is None or s<min(0.,s0)-config.get('hold_tolerance_ns',1e-3)):
            result['reason']='Special timing check missing or worsened';return result
        if s0 is None and s is not None and s < -config.get('hold_tolerance_ns',1e-3):
            result['reason']='A new failing special timing check appeared';return result
    if _constraints_only:return {'feasible':True,'reason':'All functional and resource/timing constraints passed'}
    gain=1-d/d0 if objective=='timing' else 1-a/a0
    secondary=min(1.,a0/a) if objective=='timing' else (1. if mode=='period' else min(1.,d0/d))
    value=max(0.,min(1.,gain/config['full_score_improvement']))*secondary
    result.update(resolved=(d0-d>config.get('delay_tolerance_ns',1e-6) if objective=='timing' else a0-a>config.get('area_tolerance_um2',1e-6)),score=round(value,8),reason=f'{objective}: gain={gain:.8%}; secondary_factor={secondary:.8f}; area={a:.6f} um2; delay={d:.6f} ns; equivalence passed')
    return result

def feasible(objective,baseline,candidate,config):
    result=score(objective,baseline,candidate,config,_constraints_only=True)
    return result.get('feasible',False),result['reason']
