"""Fail-closed flow regressions; no model calls or real-design EDA."""
from pathlib import Path
import tempfile,unittest,json,math,os
import ast,types,subprocess
from unittest.mock import patch
from chipevo.policy import validate,edge_events
from chipevo.engine import asset_manifest,verify_assets
from chipevo.util import save,sha,load
from chipevo.providers import decode
from chipevo.scoring import score
from chipevo.study_metrics import normalize_usage
from chipevo.eda.sta import extract_metrics
from chipevo.rollout import agent
from chipevo.packaging import package

ROOT=Path(__file__).resolve().parents[1]
BASE={'total_area_um2':100.,'effective_delay_ns':3.,'hold_worst_slack_ns':0.,'special_worst_slack_ns':None}
CFG={'max_area_ratio':1.05,'max_delay_ratio':1.,'full_score_improvement':.1,'resolved_improvement':.02}

class FlowAuditTests(unittest.TestCase):
    def fixture(self,root,body='module m(input clk,a,output reg y);always @(posedge clk)y<=a;endmodule'):
        d=root/'designs/d';(d/'reference').mkdir(parents=True);rtl=root/'rtl';rtl.mkdir()
        (d/'reference/m.v').write_text(body);(rtl/'m.v').write_text(body)
        save(d/'policy.json',{'version':2,'file_sha256':{'m.v':sha(rtl/'m.v')},'editable_files':['m.v'],'protected_modules':{}})
        return d,rtl,body
    def test_extra_directory_symlink_is_rejected(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d,rtl,_=self.fixture(root);outside=root/'outside';outside.mkdir()
            try:(rtl/'extra').symlink_to(outside,target_is_directory=True)
            except OSError as e:self.skipTest(str(e))
            with self.assertRaisesRegex(ValueError,'links'):validate(d,rtl)
    def test_candidate_root_symlink_is_rejected(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d,rtl,_=self.fixture(root);link=root/'alias'
            try:link.symlink_to(rtl,target_is_directory=True)
            except OSError as e:self.skipTest(str(e))
            with self.assertRaisesRegex(ValueError,'symlink'):validate(d,link)
    def test_clock_and_async_reset_are_fixed(self):
        with tempfile.TemporaryDirectory() as t:
            d,rtl,body=self.fixture(Path(t))
            for new in ['negedge clk','posedge a','posedge clk or posedge a']:
                (rtl/'m.v').write_text(body.replace('posedge clk',new))
                with self.assertRaisesRegex(ValueError,'clock/asynchronous-reset'):validate(d,rtl)
            (rtl/'m.v').write_text(body.replace('posedge clk','posedge  clk').replace('y<=a','y<=~a'))
            self.assertEqual(validate(d,rtl)['changed_files'],['m.v'])
    def test_event_scanner_ignores_comments_and_strings(self):
        self.assertEqual(edge_events('// @(posedge fake)\ninitial $display("@(negedge fake)");'),set())
        self.assertEqual(edge_events('always @(posedge (clk)) q<=a;'),{'posedge(clk)'})
    def test_refusal_empty_and_failure_delivery(self):
        cases=[({'choices':[{'finish_reason':'stop','message':{'role':'assistant','content':None,'refusal':'refused'}}]},'openai_chat','refusal'),
               ({'choices':[{'finish_reason':'stop','message':{'role':'assistant','content':''}}]},'openai_chat','empty_delivery'),
               ({'choices':[{'finish_reason':'tool_calls','message':{'role':'assistant','content':''}}]},'openai_chat','invalid_tool_delivery'),
               ({'status':'completed','output':[{'type':'message','content':[{'type':'refusal','refusal':'refused'}]}]},'openai_responses','refusal'),
               ({'status':'failed','output':[],'usage':{'input_tokens':10,'output_tokens':2}},'openai_responses','failed')]
        for data,protocol,expected in cases:
            with self.subTest(protocol=protocol,stop=expected):self.assertEqual(decode(data,protocol)['stop_reason'],expected)
        self.assertEqual(decode(cases[-1][0],cases[-1][1])['usage']['total_tokens'],12)
    def test_agent_records_refusal_usage_then_fails_without_tools(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);_,rtl,_=self.fixture(root);(root/'fixed-prompt.md').write_text('Fixed goal.')
            budget=load(ROOT/'configs/studies/multimodel.json')['budget']
            response={'message':{'role':'assistant','content':''},'stop_reason':'refusal','usage':normalize_usage({'prompt_tokens':10,'completion_tokens':2},'openai_chat'),'raw':{'fixture':True},'latency_s':.01,'returned_model':'fixture'}
            with patch('chipevo.providers.call',return_value=response),patch('chipevo.engine.evaluate') as eda:
                state=agent(root,'d','timing',rtl,'Fixed goal.',{'model':'fixture','protocol':'openai_chat'},budget,root/'agent',eda)
            eda.assert_not_called();self.assertEqual(state['status'],'failed');self.assertEqual(state['tool_calls'],0)
            self.assertEqual(state['usage']['total_tokens'],12);self.assertTrue((root/'agent/response-0.json').exists())
    def test_wrong_returned_model_cannot_be_a_successful_sample(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);_,rtl,_=self.fixture(root);(root/'fixed-prompt.md').write_text('Fixed goal.')
            budget=load(ROOT/'configs/studies/multimodel.json')['budget']
            response={'message':{'role':'assistant','content':'Done.'},'stop_reason':'stop','usage':normalize_usage({'prompt_tokens':10,'completion_tokens':2},'openai_chat'),'raw':{'fixture':True},'latency_s':.01,'returned_model':'different-model'}
            with patch('chipevo.providers.call',return_value=response):
                state=agent(root,'d','timing',rtl,'Fixed goal.',{'model':'expected-model','protocol':'openai_chat'},budget,root/'agent',lambda *a:None)
            self.assertEqual(state['status'],'failed');self.assertIn('model identity',state['error'])
            self.assertEqual(state['usage']['total_tokens'],12)
    def test_nonfinite_and_boolean_metrics_never_score(self):
        for key in ['total_area_um2','effective_delay_ns','hold_worst_slack_ns','special_worst_slack_ns','global_setup_worst_slack_ns','tns_ns']:
            for value in [float('nan'),float('inf'),True]:
                self.assertEqual(score('timing',BASE,{**BASE,'effective_delay_ns':2.,key:value},CFG)['score'],0.)
        with self.assertRaises(ValueError):score('timing',BASE,BASE,{**CFG,'max_area_ratio':True})
    def test_sta_summary_must_be_complete_and_finite(self):
        data={'checks':[{'path_group':'clk','target_clock':'clk','source_clock':'clk','slack':1e-9}]}
        for log in ['worst slack max 1','worst slack max 1\nworst slack min 1e309\ntns max 0']:
            with self.assertRaises(ValueError):extract_metrics(data,log,5.)
    def test_invalid_usage_is_unknown_instead_of_negative_or_crash(self):
        usage=normalize_usage({'prompt_tokens':-1,'completion_tokens':True,'prompt_tokens_details':None},'openai_chat')
        self.assertIsNone(usage['total_tokens'])
        usage=normalize_usage({'input_tokens':10,'output_tokens':2,'cache_read_input_tokens':None},'anthropic_messages')
        self.assertIsNone(usage['input_tokens'])
    def test_grading_and_runtime_manifest_are_locked(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t)
            for rel in ['grading/entry.py','tools/runtime/FILES.sha256.json','chipevo/a.py']:
                p=root/rel;p.parent.mkdir(parents=True,exist_ok=True);p.write_text('{}')
            assets=asset_manifest(root);self.assertIn('grading/entry.py',assets);self.assertIn('tools/runtime/FILES.sha256.json',assets)
            save(root/'configs/assets.sha256.json',assets)
            with patch('chipevo.engine.verify_runtime'):verify_assets(root)
            (root/'chipevo/extra.py').write_text('')
            with patch('chipevo.engine.verify_runtime'),self.assertRaisesRegex(RuntimeError,'inventory'):verify_assets(root)
    def test_package_rejects_links_and_recursive_output(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);(root/'chipevo').mkdir();(root/'chipevo/a.py').write_text('')
            with patch('chipevo.packaging.verify_assets'),self.assertRaisesRegex(ValueError,'outside packaged'):package(root,root/'chipevo/x.tar.gz')
            (root/'outside').mkdir()
            try:(root/'chipevo/link').symlink_to(root/'outside',target_is_directory=True)
            except OSError as e:self.skipTest(str(e))
            with patch('chipevo.packaging.verify_assets'),self.assertRaises(ValueError):package(root,root/'dist/x.tar.gz')
    def test_platform_wrappers_reject_stale_and_malformed_results(self):
        for objective in ['area','timing']:
            script=ROOT/'grading'/('test_'+objective+'_by_code.py')
            tree=ast.parse(script.read_text());tree.body=[n for n in tree.body if isinstance(n,(ast.Import,ast.ImportFrom,ast.FunctionDef))]
            namespace={};exec(compile(tree,str(script),'exec'),namespace)
            with tempfile.TemporaryDirectory() as t:
                root=Path(t);(root/'test_files/chipevo_grader').mkdir(parents=True);(root/'eval').mkdir()
                def mapped(value):return root/str(value).lstrip('/')
                namespace['Path']=mapped;result=root/'eval/code_result.json'
                result.write_text('{"resolved":true,"score":1,"reason":"stale"}')
                namespace['subprocess']=types.SimpleNamespace(run=lambda *a,**k:types.SimpleNamespace(returncode=0))
                with self.assertRaisesRegex(RuntimeError,'did not produce'):namespace['run']()
                for data in [{'resolved':True,'score':True,'reason':'bad'},{'resolved':True,'score':1,'reason':'bad','extra':1},{'resolved':True,'score':float('nan'),'reason':'bad'}]:
                    def child(*a,**k):result.write_text(json.dumps(data));return types.SimpleNamespace(returncode=0)
                    namespace['subprocess']=types.SimpleNamespace(run=child)
                    with self.assertRaisesRegex(RuntimeError,'invalid result'):namespace['run']()
                def child(*a,**k):result.write_text('{"resolved":true,"score":0.5,"reason":"fresh"}');return types.SimpleNamespace(returncode=0)
                namespace['subprocess']=types.SimpleNamespace(run=child);namespace['run']()
    def test_timeout_process_exit_race_still_writes_status(self):
        from chipevo.util import execute
        process=types.SimpleNamespace(pid=123,wait=unittest.mock.Mock(side_effect=[subprocess.TimeoutExpired('tool',1),0]))
        with tempfile.TemporaryDirectory() as t,patch('chipevo.util.subprocess.Popen',return_value=process),patch('chipevo.util.os.killpg',side_effect=ProcessLookupError,create=True):
            result=execute(['synthetic'],t,Path(t)/'tool.log',1)
            self.assertEqual(result['exit_code'],124);self.assertEqual(load(Path(t)/'tool.status.json')['exit_code'],124)
    def test_syntax_localization_uses_reference_headers(self):
        from chipevo.localization import context
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d=root/'designs/d';(d/'reference/include').mkdir(parents=True)
            (d/'reference/include/width.vh').write_text('`define WIDTH 4\n')
            (d/'reference/m.v').write_text('`include "width.vh"\nmodule m(input [`WIDTH-1:0] a,output [`WIDTH-1:0] y);assign y=a;endmodule\n')
            save(d/'policy.json',{'editable_files':['m.v'],'protected_modules':{},'fixed_storage_modules':{}})
            save(d/'manifest.json',{'top':'m','defines':[],'includes':['rtl/include']})
            b=root/'run/build';b.mkdir(parents=True);(root/'technology').mkdir()
            (root/'technology/NangateOpenCellLibrary_typical.lib').write_text('cell (BUF) { area : 1; }')
            save(b/'mapped.json',{'modules':{'m':{'attributes':{'src':'/frozen/rtl/m.v:2.1-2.80'},'cells':{'buf':{'type':'BUF'}}}}})
            save(b/'timing.json',{'checks':[{'path_group':'clk','target_clock':'clk','source_clock':'clk','slack':0,'source_path':[{'arrival':0},{'arrival':1e-9,'instance':'buf'}]}]})
            result=context(root,'d','timing_syntax',root/'run');self.assertTrue(result['syntax_spans'])
    def test_loader_library_paths_can_contain_spaces(self):
        from chipevo.toolchain import linked_paths
        self.assertEqual(linked_paths('libc.so => /tmp/a project/lib/libc.so (0x123ab)\nlibm.so => /tmp/a project/lib/libm.so (0x456cd)\n'),['/tmp/a project/lib/libc.so','/tmp/a project/lib/libm.so'])
    def test_exact_graph_never_infers_input_or_state_matches(self):
        from chipevo.eda.formal import exact_graph
        import copy
        mod={'ports':{'a':{'direction':'input','bits':[2]},'b':{'direction':'input','bits':[3]},'y':{'direction':'output','bits':[4]}},
             'netnames':{'state':{'hide_name':0,'bits':[5],'attributes':{}}},
             'cells':{'auto1':{'type':'$and','parameters':{'A_WIDTH':'1'},'connections':{'A':[2],'B':[3],'Y':[4]},'attributes':{'src':'gold.v'}}}}
        renamed=copy.deepcopy(mod);renamed['cells']['auto2']=renamed['cells'].pop('auto1');renamed['cells']['auto2']['attributes']['src']='gate.v'
        self.assertEqual(exact_graph(mod),exact_graph(renamed))
        for change in ['input','state','parameter','port']:
            bad=copy.deepcopy(mod)
            if change=='input':bad['cells']['auto1']['connections']['A']=[3]
            elif change=='state':bad['netnames']['state']['bits']=[6]
            elif change=='parameter':bad['cells']['auto1']['parameters']['A_WIDTH']='2'
            else:bad['ports']['a']['bits']=[3]
            self.assertNotEqual(exact_graph(mod),exact_graph(bad))

if __name__=='__main__':unittest.main()
