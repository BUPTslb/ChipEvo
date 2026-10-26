from pathlib import Path
import concurrent.futures,copy,hashlib,json,tempfile,time,unittest
from unittest.mock import patch
from chipevo.baseline_cache import BaselineCache,canonical,fingerprint
from chipevo.util import save,load

METRICS={'total_area_um2':110.,'standard_cell_area_um2':100.,'fixed_sram_macro_area_um2':10.,
         'effective_delay_ns':3.,'ordinary_setup_worst_slack_ns':2.,'global_setup_worst_slack_ns':2.,
         'hold_worst_slack_ns':.1,'special_worst_slack_ns':None,'tns_ns':0.,'period_ns':5.,'macro_instances':{'m':1}}

def fixture(root):
    for name in ['designs/d/reference','designs/d/constraints','designs/d/context','technology','chipevo/eda','configs','tools/runtime']:
        (root/name).mkdir(parents=True,exist_ok=True)
    for rel,text in {'designs/d/reference/top.v':'module top;endmodule','designs/d/constraints/benchmark.sdc':'create_clock -period 5',
                     'designs/d/manifest.json':'{"top":"top","params":{}}','designs/d/policy.json':'{}',
                     'configs/toolchain.json':'{}','tools/runtime/FILES.sha256.json':'{}',
                     'technology/library.lib':'library fixture','chipevo/eda/synthesis.py':'fixed recipe'}.items():(root/rel).write_text(text)

class CacheTests(unittest.TestCase):
    def test_inputs_invalidate_and_paths_do_not(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t)/'a';other=Path(t)/'b';fixture(root);fixture(other)
            def key(r=root,o='area',p=5):return fingerprint(r,'d',o,p)[0]
            initial=key();self.assertEqual(initial,key(other));self.assertNotEqual(initial,key(o='timing'));self.assertNotEqual(initial,key(p=6))
            for rel in ['designs/d/reference/top.v','designs/d/manifest.json','designs/d/policy.json','designs/d/constraints/benchmark.sdc',
                        'technology/library.lib','chipevo/eda/synthesis.py','configs/toolchain.json','tools/runtime/FILES.sha256.json']:
                f=root/rel;original=f.read_text();f.write_text(original+' ')
                self.assertNotEqual(initial,key(),rel);f.write_text(original)
            (root/'chipevo/eda/__pycache__').mkdir();(root/'chipevo/eda/__pycache__/x.pyc').write_bytes(b'cache')
            self.assertEqual(initial,key())

    def test_concurrent_miss_built_once_and_hit(self):
        with tempfile.TemporaryDirectory() as t:
            cache=BaselineCache(t);inputs={'period_ns':5};key=hashlib.sha256(canonical(inputs)).hexdigest();calls=[]
            def build():calls.append(1);time.sleep(.03);return {'metrics':copy.deepcopy(METRICS),'files':{}}
            with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:
                result=list(pool.map(lambda _:cache.get_or_build(key,inputs,build),range(5)))
            self.assertEqual(len(calls),1);self.assertEqual(sum(r[1]['hit'] for r in result),4)

    def test_modified_payload_cannot_be_used(self):
        with tempfile.TemporaryDirectory() as t:
            c=BaselineCache(t);inputs={};key=hashlib.sha256(canonical(inputs)).hexdigest();build=lambda:{'metrics':copy.deepcopy(METRICS),'files':{}}
            c.get_or_build(key,inputs,build);path=Path(t)/(key+'.json');record=load(path);record['payload']['metrics']['total_area_um2']=.001;save(path,record)
            payload,info=c.get_or_build(key,inputs,build)
            self.assertFalse(info['hit']);self.assertEqual(info['miss_reason'],'invalid_entry_rebuilt');self.assertEqual(payload['metrics']['total_area_um2'],110)

    def test_failed_builder_not_published_and_retried(self):
        with tempfile.TemporaryDirectory() as t:
            c=BaselineCache(t);inputs={};key=hashlib.sha256(canonical(inputs)).hexdigest()
            with self.assertRaises(RuntimeError):c.get_or_build(key,inputs,lambda:(_ for _ in ()).throw(RuntimeError('failed')))
            self.assertFalse((Path(t)/(key+'.json')).exists())
            _,info=c.get_or_build(key,inputs,lambda:{'metrics':METRICS,'files':{}});self.assertFalse(info['hit'])

    def test_wrong_period_and_key_rejected(self):
        with tempfile.TemporaryDirectory() as t:
            c=BaselineCache(t);inputs={'period_ns':2};key=hashlib.sha256(canonical(inputs)).hexdigest()
            with self.assertRaises(ValueError):c.get_or_build(key,inputs,lambda:{'metrics':METRICS})
            with self.assertRaises(ValueError):c.get_or_build('0'*64,inputs,lambda:{'metrics':METRICS})

    def test_lru_bounded(self):
        with tempfile.TemporaryDirectory() as t:
            c=BaselineCache(t,max_entries=2)
            for i in range(3):
                inputs={'version':i};key=hashlib.sha256(canonical(inputs)).hexdigest()
                c.get_or_build(key,inputs,lambda:{'metrics':METRICS,'files':{}})
            self.assertEqual(len(list(Path(t).glob('*.json'))),2)

    def test_entry_larger_than_configured_byte_budget_not_published(self):
        with tempfile.TemporaryDirectory() as t:
            c=BaselineCache(t,max_bytes=100);inputs={};key=hashlib.sha256(canonical(inputs)).hexdigest()
            payload,info=c.get_or_build(key,inputs,lambda:{'metrics':METRICS,'files':{}})
            self.assertEqual(payload['metrics'],METRICS)
            self.assertEqual(info['miss_reason'],'entry_exceeds_cache_budget')
            self.assertFalse((Path(t)/(key+'.json')).exists())

    def test_cache_from_other_authority_not_accepted(self):
        with tempfile.TemporaryDirectory() as t:
            a=Path(t)/'a';b=Path(t)/'b';c=BaselineCache(a);other=BaselineCache(b);inputs={};key=hashlib.sha256(canonical(inputs)).hexdigest()
            c.get_or_build(key,inputs,lambda:{'metrics':METRICS,'files':{}})
            (b/(key+'.json')).write_bytes((a/(key+'.json')).read_bytes())
            _,info=other.get_or_build(key,inputs,lambda:{'metrics':METRICS,'files':{}})
            self.assertFalse(info['hit'])

class EngineCacheTests(unittest.TestCase):
    def test_every_candidate_proved_and_measured_baseline_reused_and_pruned(self):
        from chipevo.engine import evaluate
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);fixture(root);d=root/'designs/d';(d/'rtl').mkdir();(d/'rtl/top.v').write_text('candidate')
            save(d/'manifest.json',{'top':'top','sources':['rtl/top.v'],'includes':[],'defines':[],'params':{}})
            save(root/'configs/tasks/d.area.json',{'design':'d','objective':'area','period_ns':5.,'synthesis_timeout_s':10,'sta_timeout_s':10,
                 'scoring':{'max_area_ratio':1.05,'max_delay_ratio':1.,'full_score_improvement':.1,'resolved_improvement':.02,'delay_constraint':'period'}})
            calls=[];proofs=[]
            def synth(_root,work,*args):
                calls.append(work.name);(work/'build/mapped.json').write_text('X'*50000);(work/'build/mapped.v').write_text('X'*50000)
                save(work/'build/area.json',METRICS)
            def analyze(_root,work,*args):save(work/'build/metrics.json',METRICS);return {'error':'in-memory metrics must be ignored'}
            def prove(work,*args):
                proofs.append(work);save(work/'build/hierproof-v6/result.json',{'status':'PASS','count':1})
            evidence={'module_index':[],'suggested_targets':[],'evidence':{}}
            with patch('chipevo.engine.verify_assets'),patch('chipevo.engine.resolve',return_value={'yosys':'fake'}),patch('chipevo.engine.validate',return_value={}),\
                 patch('chipevo.engine.synthesize',side_effect=synth),patch('chipevo.engine.analyze',side_effect=analyze),\
                 patch('chipevo.eda.formal.prove',side_effect=prove),patch('chipevo.localization.context',return_value=evidence):
                first=evaluate(root,'d','area',d/'rtl',root/'one');second=evaluate(root,'d','area',d/'rtl',root/'two')
                uncached=evaluate(root,'d','area',d/'rtl',root/'three',use_cache=False,retention='full')
            self.assertEqual(first['status'],'evaluated');self.assertEqual(second['status'],'evaluated')
            self.assertFalse(first['baseline_cache']['hit']);self.assertTrue(second['baseline_cache']['hit'])
            self.assertEqual(calls,['baseline','candidate','candidate','baseline','candidate']);self.assertEqual(len(proofs),3)
            self.assertEqual(uncached['status'],'evaluated');self.assertTrue(uncached['baseline_cache']['disabled'])
            self.assertTrue((root/'three/candidate/build/mapped.json').exists())
            self.assertEqual(first['grade'],second['grade']);self.assertTrue((root/'two/candidate/rtl/top.v').exists())
            self.assertFalse((root/'one/candidate/build/mapped.json').exists());self.assertFalse((root/'one/baseline/build/mapped.json').exists())
            self.assertTrue((root/'two/baseline/build/localization-timing_module.json').exists())
            self.assertTrue((root/'two/candidate/build/hierproof-v6/result.json').exists())
            from chipevo.localization import context
            self.assertEqual(context(root,'d','timing_module',root/'two')['module_index'],[])
