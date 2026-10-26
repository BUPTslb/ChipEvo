from pathlib import Path
import tempfile,unittest,json,copy
import tarfile
from unittest.mock import patch
from chipevo.study_config import read_config,plan
from chipevo.study_metrics import choose,normalize_usage,sum_usage
from chipevo.scoring import score,feasible
from chipevo.rollout import safe_file,agent
from chipevo.providers import anthropic_messages,decode,payload
from chipevo.study import snapshot,run
from chipevo.util import save,sha,load

ROOT=Path(__file__).resolve().parents[1]
BASE={'total_area_um2':100.,'effective_delay_ns':3.,'hold_worst_slack_ns':0.1,'special_worst_slack_ns':None,
      'ordinary_setup_worst_slack_ns':2.,'global_setup_worst_slack_ns':2.,'period_ns':5.}
SCORE={'max_area_ratio':1.05,'max_delay_ratio':1.,'full_score_improvement':.1,'resolved_improvement':.02}

class StudyTests(unittest.TestCase):
    def test_area_can_spend_slack_until_fixed_period(self):
        cfg={**SCORE,'delay_constraint':'period','target_period_ns':5.}
        cand={**BASE,'total_area_um2':95.,'effective_delay_ns':4.5,'ordinary_setup_worst_slack_ns':.5,'global_setup_worst_slack_ns':.5}
        self.assertTrue(feasible('area',BASE,cand,cfg)[0]);self.assertAlmostEqual(score('area',BASE,cand,cfg)['score'],.5)
        self.assertFalse(feasible('area',BASE,{**cand,'global_setup_worst_slack_ns':-.01},cfg)[0])
        self.assertFalse(feasible('area',BASE,{**cand,'effective_delay_ns':5.1},cfg)[0])

    def test_small_improvement_promotes_even_when_unresolved(self):
        r={'status':'evaluated','formal_status':'PASS','feasible':True,'candidate':{**BASE,'effective_delay_ns':2.999},'grade':{'resolved':False}}
        chosen=choose([{'candidate_id':0,'report':r}],'timing',BASE,1e-6,1e-6)
        self.assertEqual(chosen['candidate_id'],0)
        self.assertIsNone(choose([{'candidate_id':0,'report':{**r,'feasible':False}}],'timing',BASE,1e-6,1e-6))
        self.assertIsNone(choose([{'candidate_id':0,'report':{**r,'candidate':BASE}}],'timing',BASE,1e-6,1e-6))

    def test_primary_metric_beats_secondary_and_ties_stable(self):
        def r(i,d,a):return {'candidate_id':i,'report':{'status':'evaluated','formal_status':'PASS','feasible':True,'candidate':{**BASE,'effective_delay_ns':d,'total_area_um2':a}}}
        self.assertEqual(choose([r(1,2.9,100),r(0,2.9,100),r(2,2.8,104)],'timing',BASE,1e-6,1e-6)['candidate_id'],2)
        self.assertEqual(choose([r(1,2.9,100),r(0,2.9,100)],'timing',BASE,1e-6,1e-6)['candidate_id'],0)

    def test_usage_no_double_count_or_fake_zero(self):
        a=normalize_usage({'prompt_tokens':100,'completion_tokens':20,'completion_tokens_details':{'reasoning_tokens':10},'prompt_cache_hit_tokens':60},'openai_chat')
        self.assertEqual(a['total_tokens'],120);self.assertEqual(a['cached_input_tokens'],60)
        b=normalize_usage({'input_tokens':10,'cache_creation_input_tokens':20,'cache_read_input_tokens':30,'output_tokens':5},'anthropic_messages')
        self.assertEqual(b['total_tokens'],65)
        s=sum_usage([a,normalize_usage({},'openai_chat')]);self.assertEqual(s['total_tokens'],120);self.assertFalse(s['total_tokens_complete'])
        self.assertIsNone(sum_usage([])['total_tokens'])

    def test_template_not_ready_and_no_work_launched(self):
        cfg=read_config(ROOT/'configs/studies/multimodel.template.json')
        self.assertFalse(plan(cfg)['ready']);self.assertEqual(plan(cfg)['eda_jobs_launched'],0)
        with self.assertRaises(ValueError):read_config(ROOT/'configs/studies/multimodel.template.json',ready=True)
        with self.assertRaises(ValueError):run('never-read','never-used','never-created')

    def test_cli_study_requires_both_explicit_flags(self):
        from chipevo.cli import main
        with patch('sys.argv',['chipevo','study-run','--config','never-read','--output','never-created']),patch('chipevo.study.run') as work:
            with self.assertRaises(SystemExit):main()
            work.assert_not_called()

    def test_paths_cannot_read_other_candidate_or_symlink(self):
        with tempfile.TemporaryDirectory() as t:
            rtl=Path(t)/'rtl';rtl.mkdir();(rtl/'a.v').write_text('x')
            self.assertEqual(safe_file(rtl,'rtl/a.v',{'a.v'}),rtl/'a.v')
            for value in ['../other/rtl/a.v','/etc/passwd','../../fixed-prompt.md','a.v/../../other']:
                with self.assertRaises(ValueError):safe_file(rtl,value,{'a.v'})

    def test_external_bundle_does_not_ship_other_objective_or_grader(self):
        from chipevo.candidate_bundle import export
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d=root/'designs/d';(d/'reference').mkdir(parents=True);rtl=root/'rtl';rtl.mkdir()
            body='module m;endmodule';(rtl/'m.v').write_text(body);(d/'reference/m.v').write_text(body)
            save(d/'policy.json',{'version':2,'file_sha256':{'m.v':sha(rtl/'m.v')},'editable_files':['m.v'],'protected_modules':{},'fixed_storage_modules':{}})
            save(d/'manifest.json',{'top':'m','sources':['rtl/m.v'],'params':{},'defines':[],'includes':[]})
            (root/'fixed-prompt.md').write_text('only area goal');(root/'other-target.md').write_text('private timing goal')
            (root/'grader.py').write_text('private grader');out=root/'bundle.tar.gz';export(root,'d',rtl,out)
            with tarfile.open(out) as tar:names=set(tar.getnames())
            self.assertEqual(names,{'rtl/m.v','task.md','policy.json','manifest.json'})

    def test_anthropic_roundtrip_tool_results(self):
        raw={'model':'fixture','stop_reason':'tool_use','content':[{'type':'tool_use','id':'t1','name':'read_source','input':{'file':'a.v'}}],
             'usage':{'input_tokens':10,'output_tokens':5}}
        d=decode(raw,'anthropic_messages');msgs=[{'role':'system','content':'fixed'},d['message'],{'role':'tool','tool_call_id':'t1','content':'source'}]
        sys,converted=anthropic_messages(msgs);self.assertEqual(sys,'fixed');self.assertEqual(converted[-1]['content'][0]['type'],'tool_result')
        self.assertEqual(converted[0]['content'][0]['id'],'t1')

    def test_agent_denies_other_workspace_and_applies_only_own_edits(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d=root/'designs/d';(d/'reference').mkdir(parents=True);rtl=root/'candidate/rtl';rtl.mkdir(parents=True)
            body='module m; wire x=0; endmodule\n';(d/'reference/m.v').write_text(body);(rtl/'m.v').write_text(body)
            (root/'fixed-prompt.md').write_text('only this objective')
            save(d/'policy.json',{'version':2,'file_sha256':{'m.v':sha(rtl/'m.v')},'editable_files':['m.v'],'protected_modules':{},'fixed_storage_modules':{}})
            def tc(id,name,args):return {'id':id,'type':'function','function':{'name':name,'arguments':json.dumps(args)}}
            first={'role':'assistant','content':None,'tool_calls':[tc('1','read_source',{'file':'../other/prompt.md','start_line':1,'end_line':10}),tc('2','apply_edits',{'edits':[{'file':'m.v','old':'wire x=0','new':'wire x=1'}]})]}
            def response(msg,stop):return {'message':msg,'stop_reason':stop,'usage':normalize_usage({'prompt_tokens':10,'completion_tokens':2},'openai_chat'),'raw':{'fixture':True},'latency_s':.01,'returned_model':'fixture'}
            budget=load(ROOT/'configs/studies/multimodel.json')['budget'];budget.update(max_eda_feedback_calls=0)
            model={'id':'fixture','model':'fixture','protocol':'openai_chat','request_options':{}}
            with patch('chipevo.providers.call',side_effect=[response(first,'tool_calls'),response({'role':'assistant','content':'done'},'stop')]),patch('chipevo.study.evaluate') as eda:
                state=agent(root,'d','area',rtl,'fixed',model,budget,root/'agent',eda)
                eda.assert_not_called()
            self.assertEqual(state['status'],'completed');self.assertEqual(state['tool_failure'],1);self.assertEqual(state['tool_success'],1)
            self.assertIn('wire x=1',(rtl/'m.v').read_text());self.assertEqual(state['usage']['total_tokens'],24)
            events=load(root/'agent/tool-events.json');self.assertIn('arguments',events[0]);self.assertIn('error',events[0]['result'])
            self.assertEqual(load(root/'agent/tool-000001.json'),events[0])
            self.assertEqual(load(root/'agent/response-0.metadata.json')['returned_model'],'fixture')
            self.assertEqual(load(root/'agent/transcript.json')[-1]['content'],'done')

    def test_snapshot_preserves_locked_native_bytecode(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t)/'root';out=Path(t)/'out';out.mkdir()
            for name in ['chipevo','technology','tools/runtime/share/__pycache__','configs','designs/d/reference','designs/d/constraints','designs/d/context']:(root/name).mkdir(parents=True)
            (root/'tools/runtime/share/__pycache__/data.pyc').write_bytes(b'locked')
            for n in ['toolchain.json']:(root/'configs'/n).write_text('{}')
            for n in ['manifest.json','policy.json']:(root/'designs/d'/n).write_text('{}')
            common=snapshot(root,out,{'designs':{'d':{}}});self.assertTrue((common/'tools/runtime/share/__pycache__/data.pyc').exists())

    def test_two_models_two_rounds_five_isolated_candidates(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t)/'root';out=Path(t)/'study'
            for name in ['chipevo','technology','tools/runtime','configs/tasks','designs/d/reference','designs/d/constraints','designs/d/context']:(root/name).mkdir(parents=True)
            body='module m; wire x=0; endmodule\n';(root/'designs/d/reference/m.v').write_text(body)
            save(root/'configs/toolchain.json',{})
            save(root/'designs/d/manifest.json',{})
            save(root/'designs/d/policy.json',{'version':2,'file_sha256':{'m.v':sha(root/'designs/d/reference/m.v')},'editable_files':['m.v'],'protected_modules':{},'fixed_storage_modules':{}})
            for objective in ['timing','area']:save(root/f'configs/tasks/d.{objective}.json',{'design':'d','objective':objective,'period_ns':5.,'scoring':SCORE})
            cfg=load(ROOT/'configs/studies/multimodel.json');cfg.update(study_id='synthetic',rounds=2,designs={'d':{'timing_frequency_mhz':10000,'area_frequency_mhz':200}},models=[{'id':n,'protocol':'openai_chat','base_url':'https://example.invalid/v1','model':n,'api_key_env':'TEST_KEY','context_window_tokens':131072} for n in ['a','b']])
            config=Path(t)/'config.json';save(config,cfg);starts=[]
            def fake_agent(task_root,design,objective,rtl,prompt,model,budget,agent_out,fn):
                p=rtl/'m.v';content=p.read_text();starts.append((model['id'],objective,rtl.parent.parent.name,content,prompt))
                # Only candidate 0 improves; all five must start from identical parent.
                if rtl.parent.name=='candidate-00' and rtl.parent.parent.name=='round-001':p.write_text(content+'// gain\n')
                state={'status':'completed','usage':{'total_tokens':10,'total_tokens_complete':True},'api_calls_attempted':1,'api_calls_completed':1}
                save(agent_out/'agent.json',state)
                # Only published files are authoritative, never the return value.
                return {'status':'failed','error':'in-memory result must be ignored'}
            def fake_evaluate(task_root,design,objective,rtl,output,**kwargs):
                from chipevo.artifacts import mark
                output.mkdir(parents=True);mark(output)
                g=(rtl/'m.v').read_text().count('// gain');metrics={**BASE,'effective_delay_ns':3-.01*g,'total_area_um2':100-g}
                report={'status':'evaluated','formal_status':'PASS','feasible':True,'baseline':BASE,'candidate':metrics,'grade':{'resolved':False}}
                save(output/'report.json',report)
                return {'status':'failed','error':'in-memory result must be ignored'}
            evidence={'design':'d','strategy':'fixture','module_index':[{'module':'m','protected':False,'exclusive_area_all_instances_um2':100}],
                      'suggested_targets':[{'module':'m'}],'timing_targets':[],'critical_paths':[]}
            with patch.dict('os.environ',{'TEST_KEY':'fixture-not-secret'}),patch('chipevo.study.verify_assets'),patch('chipevo.study.evaluate',side_effect=fake_evaluate),patch('chipevo.study.agent',side_effect=fake_agent),patch('chipevo.study.context',side_effect=lambda *a:copy.deepcopy(evidence)):
                result=run(config,root,out,True,True)
            self.assertEqual(result['status'],'completed');self.assertEqual(len(starts),40)
            for model in ['a','b']:
                for objective in ['timing','area']:
                    first=[s for s in starts if s[:3]==(model,objective,'round-001')]
                    second=[s for s in starts if s[:3]==(model,objective,'round-002')]
                    self.assertEqual(len(first),5);self.assertEqual({s[3] for s in first},{body})
                    self.assertEqual({s[3] for s in second},{body+'// gain\n'})
                    self.assertEqual(len({s[4] for s in first}),1)
                    self.assertEqual(len({s[4] for s in second}),1)
                    self.assertNotEqual(first[0][4],second[0][4])
                    self.assertIn('Round input evidence',second[0][4])
                    chain=out/'chains'/model/'d'/objective
                    published=load(chain/'progress.json');self.assertEqual(published['completed_rounds'],2)
                    self.assertIn('round-001/selected-rtl',published['incumbent_rtl'])
                    self.assertTrue(load(chain/'round-002/round.json')['retained_previous'])
                    self.assertFalse((chain/'round-002/selected-rtl').exists())
                    from chipevo.study import tree_hash
                    self.assertEqual(published['incumbent_rtl_hash'],tree_hash(out/published['incumbent_rtl']))
                    inp=load(chain/'round-002/input.json');self.assertEqual(inp['parent_rtl_hash'],published['incumbent_rtl_hash'])
                    self.assertEqual(load(chain/'round-002/candidate-00/start.json')['round_input_sha256'],sha(chain/'round-002/input.json'))
            self.assertEqual(len(load(out/'report.json')['groups']),4)
            self.assertEqual((root/'designs/d/reference/m.v').read_text(),body)

if __name__=='__main__':unittest.main()
