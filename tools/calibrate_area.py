"""Explicit baseline-only area-mode frequency calibration; no model calls/proof claims."""
from pathlib import Path
import argparse,sys,time,concurrent.futures
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from chipevo.study_config import read_config
from chipevo.study import snapshot,make_task
from chipevo.engine import stage,verify_assets
from chipevo.toolchain import resolve
from chipevo.eda.synthesis import synthesize
from chipevo.eda.sta import analyze
from chipevo.util import save,load,sha

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',required=True);p.add_argument('--output',required=True)
    p.add_argument('--run-eda',action='store_true');a=p.parse_args()
    if not a.run_eda:p.error('Explicit --run-eda required; nothing launched')
    root=Path(__file__).resolve().parents[1];cfg=read_config(a.config);out=Path(a.output).resolve()
    if out.exists():raise ValueError('Use a fresh calibration directory')
    verify_assets(root);out.mkdir(parents=True);save(out/'requested-config.json',cfg);common=snapshot(root,out,cfg)
    def one(design):
        row={'design':design,'trials':[],'scope':'Area-mode original-reference synthesis and STA only; no new equivalence qualification and no model calls'}
        try:
            tr,tc=make_task(root,common,out,cfg,design,'area');work=stage(tr,design,tr/'designs'/design/'reference',out/'runs'/design)
            tools=resolve(tr);period=tc['period_ns'];begin=time.monotonic()
            synthesize(tr,work,tools,'area',period,tc['synthesis_timeout_s'])
            # Area ABC recipe does not depend on period. Reuse exactly this mapped netlist for STA sweeps.
            netlist_hash=sha(work/'build/mapped.v');low=high=None
            for i in range(9):
                period=round(period,3)
                metrics=analyze(tr,work,tools,period,tc['sta_timeout_s'])
                if sha(work/'build/mapped.v')!=netlist_hash:raise ValueError('Frozen calibration netlist changed')
                slack=min(metrics['ordinary_setup_worst_slack_ns'],metrics['global_setup_worst_slack_ns'])
                ratio=slack/period;trial={'trial':i,'period_ns':period,'frequency_mhz':1000/period,
                    'setup_pass':slack>=-1e-6,'worst_setup_slack_ns':slack,'slack_fraction':ratio,'metrics':metrics}
                row['trials'].append(trial);save(out/f'{design}.json',row)
                dest=work/'build'/f'sta-trial-{i}';dest.mkdir()
                import shutil
                for name in ['evaluation.sdc','sta.tcl','sta.log','timing.json','timing.txt','electrical.txt','metrics.json']:shutil.copy2(work/'build'/name,dest/name)
                print(design,period,'ns',f'slack={slack:.6f}ns',f'margin={ratio:.2%}',flush=True)
                checks=load(work/'build/timing.json').get('checks',[])
                if trial['setup_pass'] and abs(slack)<1e-6 and any(c.get('type')=='latch_check' and abs(c.get('slack',1))<1e-15 for c in checks):
                    row['slack_ratio_unavailable']='Nonviolating latch checks report zero slack; do not keep relaxing frequency to chase a positive ratio.'
                    break
                if .10<=ratio<=.20:break
                if ratio<.15:
                    low=period
                    period=(low+high)/2 if high is not None else max(period*1.4,period+max(0,-slack)*2+.1)
                else:
                    high=period
                    period=(low+high)/2 if low is not None else period*.75
                if period<.001 or period>10000:break
            feasible=[t for t in row['trials'] if t['setup_pass']]
            row['initial_200mhz']=row['trials'][0]
            if feasible:
                selected=min(feasible,key=lambda t:abs(t['slack_fraction']-.15))
                row.update(status='calibrated',selected=selected,
                    recommended_area_frequency_mhz=selected['frequency_mhz'],
                    margin_in_preferred_range=.10<=selected['slack_fraction']<=.20)
            else:row.update(status='no_feasible_tested_frequency',recommended_area_frequency_mhz=None)
            row['wall_s']=time.monotonic()-begin
        except Exception as e:row.update(status='failed',error=str(e))
        save(out/f'{design}.json',row);return row
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:rows=list(executor.map(one,list(cfg['designs'])))
    result={'scope':'Original reference area-mode synthesis once per design; STA-only period sweep of unchanged area-mapped netlist. No LLM calls. Not all-design equivalence qualification.',
            'preferred_setup_slack_fraction':[.10,.20],'requested_area_frequency_mhz':200,'results':rows}
    save(out/'report.json',result)
    # Write recommendation separately; activating it is an explicit reviewed config edit.
    recommendation=dict(cfg);recommendation['designs']={k:dict(v) for k,v in cfg['designs'].items()}
    for row in rows:
        if row.get('recommended_area_frequency_mhz'):recommendation['designs'][row['design']]['area_frequency_mhz']=row['recommended_area_frequency_mhz']
    save(out/'recommended-config.json',recommendation)
    print('Calibration finished:',out/'report.json',flush=True)

if __name__=='__main__':main()
