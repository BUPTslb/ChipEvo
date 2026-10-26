"""Prepare objective-specific, read-only localization evidence for rollout."""
from pathlib import Path
import json
from .util import load
from .localization import context
from .engine import task
from .prompt_contract import english_prompt


def prepare_context(root, design, objective, run=None, strategy=None):
    root = Path(root)
    cfg = task(root, design, objective)
    strategy = strategy or cfg.get('localization', {}).get(
        'strategy', 'timing_module' if objective == 'timing' else 'hierarchy_area')
    if run is not None or strategy == 'hierarchy_area':
        result = context(root, design, strategy, run)
    else:
        saved = root / 'designs' / design / 'context' / (strategy + '.json')
        if not saved.exists():
            raise ValueError('Missing frozen timing evidence; supply --run for existing evaluated results')
        result = load(saved)
        if result.get('design') != design or result.get('strategy') != strategy:
            raise ValueError('Frozen context identity mismatch')
    rows = result['module_index']
    area = sorted((r for r in rows if not r.get('protected') and
                   r.get('exclusive_area_all_instances_um2') is not None),
                  key=lambda r: r['exclusive_area_all_instances_um2'], reverse=True)[:10]
    result['objective'] = objective
    result['secondary_evidence'] = {
        'area_targets': area,
        'instruction': ('Use critical paths as primary targets; check area cost.' if objective == 'timing'
                        else 'Use area contribution as primary targets; check critical-path risk.')}
    # Area optimization still needs timing evidence to avoid consuming critical-path slack.
    if objective == 'area':
        if run is not None:
            timing = context(root, design, 'timing_module', run)
        else:
            p = root / 'designs' / design / 'context/timing_module.json'
            if not p.exists():
                raise ValueError('Area task requires secondary timing evidence; supply --run')
            timing = load(p)
        result['secondary_evidence']['timing_targets'] = timing.get('timing_targets', [])[:10]
        result['secondary_evidence']['critical_paths'] = timing.get('critical_paths', [])
        result['secondary_evidence']['timing_provenance'] = timing.get('evidence', timing.get('source'))
    result['task_period_ns'] = cfg['period_ns']
    if not result.get('suggested_targets'):
        raise ValueError('No editable localization targets; review protection policy and source mapping')
    return result


def compact(result):
    """Keep actionable locations; avoid copying huge gate-by-gate traces into a prompt."""
    fields = ['module', 'file', 'start_line', 'end_line', 'instances',
              'exclusive_area_all_instances_um2', 'sum_path_cell_delay_ns',
              'path_count', 'source_anchors', 'protected', 'fixed_storage']
    def rows(values):
        return [{k: (v[:8] if k == 'source_anchors' else v)
                 for k, v in r.items() if k in fields} for r in values]
    def paths(values):
        return [{k: p[k] for k in ['slack', 'source_clock', 'target_clock',
                 'path_group', 'module_delay_ns'] if k in p} for p in values[:10]]
    secondary = result.get('secondary_evidence', {})
    return {
        'design': result['design'], 'objective': result['objective'],
        'strategy': result['strategy'], 'evidence': result.get('evidence', result.get('source')),
        'timing_evidence_format': result.get('timing_evidence_format'),
        'task_period_ns': result['task_period_ns'],
        'suggested_targets': rows(result['suggested_targets']),
        'critical_paths': paths(result.get('critical_paths', [])),
        'fixed_only_critical_paths': paths(result.get('fixed_only_critical_paths', [])),
        'localization_scope': result.get('localization_scope'),
        'secondary_evidence': {
            'instruction': secondary.get('instruction'),
            'area_targets': rows(secondary.get('area_targets', [])),
            'timing_targets': rows(secondary.get('timing_targets', [])),
            'critical_paths': paths(secondary.get('critical_paths', [])),
            'timing_provenance': secondary.get('timing_provenance')},
        'syntax_spans': result.get('syntax_spans', []),
        'note': 'Locations are suggestions, not edit permissions or guaranteed gains. '
                'Historical evidence may use an older recipe; final score uses fresh measurements. '
                'Path slack in JSON is in seconds; module delay fields ending ns are nanoseconds.'}


def render(root, design, objective, feedback_budget=0, run=None, strategy=None):
    root = Path(root)
    if feedback_budget < 0:
        raise ValueError('Feedback budget must be nonnegative')
    cfg = task(root, design, objective)
    evidence = prepare_context(root, design, objective, run, strategy)
    text = (root / f'prompts/{objective}.md').read_text()
    for key, value in {'design': design, 'eda_feedback_budget': feedback_budget,
                       'period_ns': cfg['period_ns'],
                       'area_timing_contract': ('setup requirements at the fixed '+str(cfg['period_ns'])+' ns period (you may spend baseline timing margin; D <= D0 is not required)'
                                               if cfg['scoring'].get('delay_constraint')=='period' else 'D must not exceed the initial baseline D0')}.items():
        text = text.replace('{{' + key + '}}', str(value))
    text += '\n\nFixed task configuration:\n' + json.dumps(cfg, ensure_ascii=False, indent=2)
    text += '\n\nLocalization context (policy.json defines edit permissions):\n'
    text += json.dumps(compact(evidence), ensure_ascii=False, indent=2) + '\n'
    return english_prompt(text), evidence
