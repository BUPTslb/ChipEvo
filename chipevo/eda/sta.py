from pathlib import Path
import re,math
from ..util import checked,load,save,tcl_quote

def render_sdc(original,period_ns):
    if not math.isfinite(period_ns) or period_ns<=0:raise ValueError('Invalid period')
    text,count=re.subn(r'(?m)^(create_clock\b[^\n]*?-period\s+)[\d.eE+-]+',lambda m:m[1]+f'{period_ns:g}',original)
    if not count:raise ValueError('No create_clock in SDC template')
    return text

def analyze(root,work,tools,period_ns,timeout=900,report_min_period=False):
    root=Path(root);work=Path(work);b=work/'build';m=load(work/'manifest.json')
    sdc=b/'evaluation.sdc';sdc.write_text(render_sdc((work/'constraints/benchmark.sdc').read_text(),period_ns))
    libs=[root/'technology/NangateOpenCellLibrary_typical.lib']
    if m.get('sram_mapping'):libs.extend(root/x for x in load(root/m['sram_mapping'])['liberties'])
    text=''.join('read_liberty '+tcl_quote(x)+'\n' for x in libs)
    text+=f'read_verilog {tcl_quote(b/"mapped.v")}\nlink_design {m["top"]}\nread_sdc {tcl_quote(sdc)}\ncheck_setup -verbose\n'
    text+=f'check_setup -no_clock -unconstrained_endpoints -loops -generated_clocks -verbose > {tcl_quote(b/"constraint-coverage.txt")}\n'
    text+=f'report_checks -path_delay max -group_path_count 30 -endpoint_path_count 1 -format json > {tcl_quote(b/"timing.json")}\n'
    text+=f'report_checks -path_delay max -group_path_count 30 -fields {{slew cap fanout}} -digits 6 > {tcl_quote(b/"timing.txt")}\n'
    text+=f'report_check_types -max_slew -max_capacitance -violators -max_count 20 > {tcl_quote(b/"electrical.txt")}\n'
    text+='report_worst_slack -max -digits 6\nreport_worst_slack -min -digits 6\nreport_tns -digits 6\n'
    if report_min_period:text+='report_clock_min_period -digits 6\n'
    script=b/'sta.tcl';script.write_text(text)
    # OpenSTA's startup Tcl reparses the script argument. A fixed relative name
    # avoids splitting an absolute workspace path containing spaces.
    checked([tools['sta'],'-exit','build/sta.tcl'],work,b/'sta.log',timeout)
    log=(b/'sta.log').read_text()
    if 'Error:' in log or 'Creating black box' in log:raise RuntimeError('STA has incomplete models or errors')
    coverage=(b/'constraint-coverage.txt').read_text()
    if coverage.strip():raise ValueError('STA constraint coverage failed; see build/constraint-coverage.txt')
    metrics=extract_metrics(load(b/'timing.json'),log,period_ns)
    metrics.update(load(b/'area.json'));metrics['period_ns']=period_ns
    metrics['electrical_report']='build/electrical.txt';metrics['pre_layout']=True
    metrics['constraint_coverage']={'passed':True,'report':'build/constraint-coverage.txt','checks':['no_clock','unconstrained_endpoints','loops','generated_clocks']}
    save(b/'metrics.json',metrics);return metrics

def extract_metrics(data,log,period_ns):
    ordinary=[];special=[]
    for c in data.get('checks',[]):
        if c.get('slack') is None:continue
        same=c.get('path_group')==c.get('target_clock') and c.get('target_clock')
        cross=c.get('source_clock') and c.get('target_clock') and c['source_clock']!=c['target_clock']
        (ordinary if same and not cross else special).append(c)
    if not ordinary:raise ValueError('No modeled ordinary same-clock setup paths; task cannot be scored')
    slack=min(float(c['slack'])*1e9 for c in ordinary)
    def grab(pattern):
        m=re.search(pattern,log);return float(m[1]) if m else None
    result={'ordinary_setup_worst_slack_ns':slack,'effective_delay_ns':period_ns-slack,'hold_worst_slack_ns':grab(r'worst slack min\s+([-\d.eE+]+)'), 'global_setup_worst_slack_ns':grab(r'worst slack max\s+([-\d.eE+]+)'), 'tns_ns':grab(r'tns max\s+([-\d.eE+]+)'), 'special_worst_slack_ns':min((float(c['slack'])*1e9 for c in special),default=None),'ordinary_path_count':len(ordinary),'special_path_count':len(special),'delay_scope':'period minus raw ordinary same-clock setup slack; includes IO/setup/uncertainty budgets; not unconditional fmax'}
    for key,value in result.items():
        if isinstance(value,(int,float)) and not math.isfinite(value):raise ValueError('Nonfinite timing result: '+key)
    if any(result[k] is None for k in ['hold_worst_slack_ns','global_setup_worst_slack_ns','tns_ns']):raise ValueError('Missing required STA summary')
    return result
