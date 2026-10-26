from pathlib import Path
import copy,gzip,json,tempfile,unittest
from chipevo.artifacts import DEFAULT,mark,retain,compress_agent
from chipevo.util import save,load

class RetentionTests(unittest.TestCase):
    def fixture(self,root):
        mark(root)
        for rel in ['candidate/rtl','candidate/reference','baseline/rtl','baseline/reference','candidate/build/hierproof-v6','baseline/build']:(root/rel).mkdir(parents=True)
        for rel in ['candidate/rtl/a.v','candidate/reference/a.v','baseline/rtl/a.v','baseline/reference/a.v']:(root/rel).write_text('original')
        for rel in ['candidate/build/mapped.json','baseline/build/mapped.v','candidate/build/hierproof-v6/module-001-gold.json']:(root/rel).write_text('x'*200000)
        (root/'candidate/build/synthesis.log').write_text('BEGIN'+('x'*20000)+'END')
        save(root/'candidate/build/hierproof-v6/result.json',{'status':'PASS'})
        save(root/'candidate/build/metrics.json',{'value':1})
        save(root/'report.json',{'grade':1})
        settings=copy.deepcopy(DEFAULT);settings['retention']['max_log_bytes']=1024;return settings

    def test_compact_keeps_rtl_score_evidence_and_bounded_logs(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);cfg=self.fixture(root);r=retain(root,'evaluated',cfg)
            self.assertTrue((root/'candidate/rtl/a.v').exists());self.assertTrue((root/'report.json').exists())
            self.assertFalse((root/'candidate/reference').exists());self.assertFalse((root/'baseline/rtl').exists())
            self.assertFalse((root/'candidate/build/mapped.json').exists());self.assertTrue((root/'candidate/build/metrics.json').exists())
            self.assertTrue((root/'candidate/build/hierproof-v6/result.json').exists())
            data=gzip.decompress((root/'candidate/build/synthesis.log.gz').read_bytes())
            self.assertTrue(data.startswith(b'BEGIN'));self.assertTrue(data.endswith(b'END'));self.assertIn(b'CHIPEVO',data)
            self.assertTrue(r['logs'][0]['truncated']);self.assertLess(r['bytes_after'],r['bytes_before'])
            again=retain(root,'evaluated',cfg);self.assertEqual(again['logs'],r['logs'])

    def test_failed_diagnostic_budget_prioritizes_failed_module(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);cfg=self.fixture(root);cfg['retention']['max_failure_evidence_bytes']=4096
            p=root/'candidate/build/hierproof-v6'
            (p/'module-000-gold.json').write_text('x'*3000);(p/'module-009-gold.json').write_text('x'*3000)
            save(p/'result.json',{'status':'unproven','modules':[{'passed':False,'log':str(p/'module-009.log')}]})
            r=retain(root,'failed',cfg)
            self.assertTrue((p/'module-009-gold.json').exists());self.assertFalse((p/'module-000-gold.json').exists())
            self.assertLessEqual(r['diagnostic_extra_bytes'],4096)

    def test_full_and_unmarked_and_link_safety(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);cfg=self.fixture(root);retain(root,'evaluated',cfg,'full')
            self.assertTrue((root/'candidate/build/mapped.json').exists())
            other=root/'unmarked';other.mkdir()
            with self.assertRaises(ValueError):retain(other,'evaluated',cfg)
            try:(root/'candidate/build/link').symlink_to(root/'report.json')
            except OSError:return
            with self.assertRaises(ValueError):retain(root,'evaluated',cfg)
            self.assertTrue((root/'report.json').exists())

    def test_agent_compression_lossless_and_does_not_touch_live_or_stats(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);save(root/'agent.json',{'status':'running','usage':{'total_tokens':123}})
            body=b'{"content":"full original response"}';(root/'response-0.json').write_bytes(body)
            self.assertEqual(compress_agent(root,DEFAULT),{});self.assertTrue((root/'response-0.json').exists())
            save(root/'agent.json',{'status':'completed','usage':{'total_tokens':123}});save(root/'tool-events.json',[])
            save(root/'tool-000001.json',{'result':'tool file retained losslessly'})
            report=compress_agent(root,DEFAULT);self.assertTrue(report['lossless'])
            self.assertEqual(gzip.decompress((root/'response-0.json.gz').read_bytes()),body)
            self.assertEqual(load(root/'agent.json')['usage']['total_tokens'],123);self.assertTrue((root/'tool-events.json').exists())
            self.assertEqual(json.loads(gzip.decompress((root/'tool-000001.json.gz').read_bytes())),{'result':'tool file retained losslessly'})
            self.assertEqual(compress_agent(root,DEFAULT),report)
