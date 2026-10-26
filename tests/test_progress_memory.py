import json,tempfile,unittest
from pathlib import Path
from unittest.mock import patch
from chipevo.progress import ProgressLedger,recall_document
from chipevo.context_manager import ContextManager
from chipevo.rollout import agent
from chipevo.util import load,save
from test_context_budget import BASE,MODEL,pair
import test_context_manager as fixtures
ROOT=fixtures.ROOT


class ProgressMemoryTests(unittest.TestCase):
    def budget(self,**kw):
        return {**load(ROOT/'configs/studies/multimodel.json')['budget'],'max_output_tokens':8192,**kw}

    def manager(self,**kw):
        archives={}
        def store(text,kind):
            ref=str(len(archives));archives[ref]=text;return ref
        return ContextManager(MODEL,self.budget(**kw),store),archives

    def test_evaluation_bound_to_version_even_when_metrics_pass(self):
        p=ProgressLedger({'a.v':'baseline'});p.edited({'a.v':'first'},3)
        version=p.rtl_hash();p.evaluated({'formal_status':'PASS','feasible':True,'grade':{'resolved':True}},version,'snapshot')
        self.assertTrue(p.snapshot()['latest_evaluation']['applies_to_current_rtl'])
        p.edited({'a.v':'second'},6)
        s=p.snapshot(99,0)
        self.assertEqual(s['stage'],'validation_stale')
        self.assertFalse(s['latest_evaluation']['applies_to_current_rtl'])
        self.assertEqual(s['latest_evaluation']['evaluated_rtl_hash'],version)
        self.assertEqual(s['remaining_active_s'],99)
        s['recent_edits'].clear();self.assertEqual(len(p.edits),2)

    def test_old_read_only_excerpt_does_not_omit_authoritative_edits(self):
        m,_=self.manager(max_estimated_input_tokens=7000)
        m.memory='Old investigation: no edits made.'
        p=ProgressLedger({'a.v':'baseline'});p.edited({'a.v':'new'},3)
        state={'authoritative_progress':p.snapshot(120,1)};seen=[]
        body,r=m.prepare(BASE+pair(1,'old reads'),[],state,lambda text:seen.append(text) or 'Next: evaluate modified RTL.',force=True)
        self.assertIn('"successful_edit_calls": 1',seen[0])
        self.assertIn('CURRENT AUTHORITATIVE STATE overrides',seen[0])
        self.assertIn('excerpt covers only SOME past interactions',seen[0])
        self.assertIn('"current_rtl_hash": "'+p.rtl_hash()+'"',seen[0])
        host=next(x['content'] for x in body['messages'] if x.get('content','').startswith('HOST STATE'))
        self.assertIn('"remaining_active_s": 120',host)

    def test_authority_survives_summary_failure(self):
        m,_=self.manager(max_estimated_input_tokens=7000)
        facts={'current_rtl_hash':'new','stage':'validation_stale','successful_edit_calls':2}
        def fail(_):raise ValueError('fixture')
        req,_=m.prepare(BASE+pair(1,'x'*9000),[],{'authoritative_progress':facts},fail,force=True)
        host=next(x['content'] for x in req['messages'] if x.get('content','').startswith('HOST STATE'))
        self.assertIn('"stage": "validation_stale"',host)

    def test_recall_projection_decodes_nested_text_and_omits_reasoning(self):
        history=[{'role':'assistant','content':'Next: evaluate.','reasoning_content':'PRIVATE_CHAIN_MARKER',
                  'tool_calls':[{'function':{'name':'read_source','arguments':'{"file":"a.v"}'}}]},
                 {'role':'tool','content':json.dumps({'source':'wire x;','file':'a.v','source_ref':'p'})}]
        wrapped=json.dumps({'ref':'h','text':json.dumps(history)})
        view=recall_document(wrapped,'tool-result')
        self.assertIn('Next: evaluate.',view);self.assertIn('wire x;',view)
        self.assertNotIn('PRIVATE_CHAIN_MARKER',view);self.assertNotIn('reasoning_content',view)
        self.assertNotIn('\\\\\\\\',view)
        self.assertEqual(view,recall_document(wrapped,'tool-result'))

    def test_digest_does_not_ingest_recalled_history_body(self):
        m,_=self.manager()
        recalled={'ref':'h','text':'PRIVATE_OR_NESTED_MARKER'*1000,'next_offset':None}
        digest=m.digest([pair(1,json.dumps(recalled))],'archive',10000)
        self.assertNotIn('PRIVATE_OR_NESTED_MARKER',digest);self.assertIn('"ref": "h"',digest)

    def test_digest_prioritizes_actual_edits_over_later_reads(self):
        m,_=self.manager()
        edit=[{'role':'assistant','content':'','tool_calls':[{'id':'e','function':{'name':'apply_edits','arguments':json.dumps({'edits':[{'file':'a.v','old':'x','new':'y'}]})}}]},
              {'role':'tool','tool_call_id':'e','content':json.dumps({'changed_files':['a.v'],'current_rtl_hash':'new'})}]
        digest=m.digest([edit]+[pair(i,'read '*1000) for i in range(20)],'archive',3000)
        self.assertIn('CALL apply_edits',digest);self.assertIn('"current_rtl_hash": "new"',digest)

    def test_working_source_is_retained_under_soft_pressure(self):
        m,_=self.manager(max_estimated_input_tokens=7000)
        source={'source':'wire work;\n'*200,'source_ref':'work','file':'a.v','file_sha256':'v1'}
        h=BASE+pair(0,json.dumps(source))+sum([pair(i,'x'*4500) for i in range(1,10)],[])
        state={'file_versions':{'a.v':'v1'},'source_ledger':[{'source_ref':'work','file':'a.v','file_sha256':'v1'}]}
        req,r=m.prepare(h,[],state,lambda _:'Next: edit a.v.')
        self.assertTrue(m.has_source('work'));self.assertLessEqual(m.size(req),7000)

    def test_old_working_page_not_pinned_after_version_change(self):
        m,_=self.manager(max_estimated_input_tokens=7000)
        source={'source':'old\n'*2500,'source_ref':'old','file':'a.v','file_sha256':'v1'}
        h=BASE+pair(0,json.dumps(source))+sum([pair(i,'x'*4500) for i in range(1,10)],[])
        state={'file_versions':{'a.v':'v2'},'source_ledger':[{'source_ref':'old','file':'a.v','file_sha256':'v1'}]}
        m.prepare(h,[],state,lambda _:'Use current v2.')
        self.assertFalse(m.has_source('old'))

    def test_agent_rejects_in_candidate_evaluation_and_keeps_edits(self):
        fixture=fixtures.ManagedContextTests();b=self.budget(max_estimated_input_tokens=200000)
        with tempfile.TemporaryDirectory() as t:
            root,rtl=fixture.fixture(t)
            actions=[('apply_edits',{'edits':[{'file':'m.v','old':'wire x=0','new':'wire x=1'}]}),
                     ('evaluate_candidate',{}),
                     ('apply_edits',{'edits':[{'file':'m.v','old':'wire x=1','new':'wire x=0'}]})]
            replies=[fixture.response({'role':'assistant','content':None,'tool_calls':[{'id':str(i),'function':{'name':n,'arguments':json.dumps(a)}}]}) for i,(n,a) in enumerate(actions)]
            replies.append(fixture.response({'role':'assistant','content':'done'}))
            def evaluate(root,design,objective,rtl,out):
                self.fail('In-candidate EDA must not execute')
            with patch('chipevo.providers.call',side_effect=replies):
                r=agent(root,'d','timing',rtl,'task',MODEL,b,root/'agent',evaluate)
            self.assertEqual(r['status'],'completed')
            facts=load(root/'agent/progress.json')
            self.assertEqual(facts['stage'],'edited_unvalidated')
            self.assertIsNone(facts['latest_evaluation'])
            self.assertFalse((root/'agent/evaluated-rtl-1').exists())
            self.assertIn('wire x=0',(rtl/'m.v').read_text())
            self.assertEqual(r['tool_failure'],1)

    def test_failed_replacement_does_not_claim_applied_edit(self):
        fixture=fixtures.ManagedContextTests()
        with tempfile.TemporaryDirectory() as t:
            root,rtl=fixture.fixture(t)
            action=fixture.response({'role':'assistant','content':None,'tool_calls':[{'id':'e','function':{
                'name':'apply_edits','arguments':json.dumps({'edits':[{'file':'m.v','old':'MISSING','new':'x'}]})}}]})
            with patch('chipevo.providers.call',side_effect=[action,fixture.response({'role':'assistant','content':'done'})]):
                r=agent(root,'d','timing',rtl,'task',MODEL,self.budget(),root/'agent',lambda *a:None)
            self.assertEqual(r['tool_failure'],1)
            facts=load(root/'agent/progress.json');self.assertEqual(facts['successful_edit_calls'],0)
            self.assertEqual(facts['stage'],'not_edited');self.assertIn('wire x=0',(rtl/'m.v').read_text())

    def test_rejected_evaluation_does_not_create_validation_record(self):
        fixture=fixtures.ManagedContextTests()
        with tempfile.TemporaryDirectory() as t:
            root,rtl=fixture.fixture(t)
            action=fixture.response({'role':'assistant','content':None,'tool_calls':[{'id':'v','function':{'name':'evaluate_candidate','arguments':'{}'}}]})
            def fail(*args):raise RuntimeError('fixture synthesis failed')
            with patch('chipevo.providers.call',side_effect=[action,fixture.response({'role':'assistant','content':'done'})]):
                r=agent(root,'d','timing',rtl,'task',MODEL,self.budget(),root/'agent',fail)
            self.assertEqual(r['tool_failure'],1)
            facts=load(root/'agent/progress.json');self.assertIsNone(facts['latest_evaluation'])
            self.assertEqual(facts['feedback_calls_remaining'],0)


if __name__=='__main__':unittest.main()
