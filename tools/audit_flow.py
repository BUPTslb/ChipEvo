"""Repeatable maintenance audit. Native synthetic tests require explicit opt-in."""
from pathlib import Path
import argparse,contextlib,datetime,io,json,os,subprocess,sys,unittest
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--native-unit-tests',action='store_true',help='Run tiny synthetic formal/STA/mapping regressions, never real designs')
    p.add_argument('--check-tools',action='store_true',help='Verify runtime files and start version/help commands only')
    a=p.parse_args();root=Path(__file__).resolve().parents[1]
    from chipevo.engine import verify_assets
    from chipevo.toolchain import doctor
    from chipevo.util import save,sha
    verify_assets(root)
    inv=subprocess.run([sys.executable,str(root/'tools/audit_flow_inventory.py')],cwd=root,text=True,capture_output=True)
    for key in ['CHIPEVO_NATIVE_FORMAL_TESTS','CHIPEVO_NATIVE_STA_TESTS','CHIPEVO_NATIVE_PIPELINE_TESTS']:
        os.environ[key]='1' if a.native_unit_tests else '0'
    stream=io.StringIO()
    with contextlib.redirect_stdout(stream),contextlib.redirect_stderr(stream):
        suite=unittest.defaultTestLoader.discover(str(root/'tests'))
        result=unittest.TextTestRunner(stream=stream,verbosity=2).run(suite)
    (root/'reports/flow-audit-tests.log').write_text(stream.getvalue())
    report={'release':'flow-audit-v1','time_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
            'asset_lock_sha256':sha(root/'configs/assets.sha256.json'),
            'tests':{'run':result.testsRun,'skipped':len(result.skipped),'failures':len(result.failures),'errors':len(result.errors),'passed':result.wasSuccessful(),
                     'native_synthetic_enabled':a.native_unit_tests,'log':'reports/flow-audit-tests.log'},
            'inventory':{'passed':inv.returncode==0,'report':'reports/flow-audit-inventory.json','summary':inv.stdout.splitlines()[:1],'stderr':inv.stderr[:2000]},
            'runtime':doctor(root) if a.check_tools else {'not_checked_in_this_run':True},
            'model_calls':0,'real_design_eda_jobs':0,'historical_results_modified':False,
            'limitations':['Regression tests do not prove absence of every bug.',
                'No renewed five-design qualification or model experiment was launched.',
                'tools/legacy and tools/runtime are third-party dependencies, not benchmark flow scripts; runtime bytes are pinned and verified.',
                'Historical standalone NVDLA setup/characterization tools are inventory/syntax checked, not rerun or behaviorally requalified.',
                'Resume behavior is protocol-specific; preserve checkpoints and candidate identity when explicitly resuming.',
                'Explicit initialized nets retain their names and initial values; unsupported remapping is rejected conservatively.',
                'STA coverage checks clocking, endpoints, loops and generated clocks; this is synthesis-only timing, not physical/electrical signoff.'],
            'fixes_document':'docs/FLOW_AUDIT.md'}
    report['passed']=result.wasSuccessful() and inv.returncode==0
    save(root/'reports/flow-audit-latest.json',report)
    print(json.dumps({'passed':report['passed'],'tests':report['tests'],'report':'reports/flow-audit-latest.json'},indent=2))
    return 0 if report['passed'] else 1

if __name__=='__main__':raise SystemExit(main())
