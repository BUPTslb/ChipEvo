import copy,json,tempfile,unittest
from pathlib import Path
from unittest.mock import patch
from chipevo.context_manager import ContextManager
from chipevo.providers import payload,decode,ContextWindowExceeded
from chipevo.study_metrics import normalize_usage
from chipevo.rollout import agent
from chipevo.util import load,save,sha
from test_context_budget import BASE,MODEL,pair

ROOT=Path(__file__).resolve().parents[1]

class ManagedContextTests(unittest.TestCase):
    def setUp(self):
        self.budget=load(ROOT/'configs/studies/multimodel.json')['budget'];self.archives={}
        self.budget['max_output_tokens']=8192  # Synthetic small-window fixture.
    def archive(self,text,kind):
        ref=str(len(self.archives));self.archives[ref]=text;return ref
    def test_pressure_prunes_large_result_keeps_exact_archive(self):
        b={**self.budget,'max_estimated_input_tokens':12000}
        m=ContextManager(MODEL,b,self.archive)
        history=BASE+pair(1,'source'*18000)
        request,record=m.prepare(history,[],{},lambda s:'checkpoint')
        self.assertEqual(record['pruned_results'],1);self.assertIn('source'*18000,self.archives.values())
        self.assertLessEqual(m.size(request),12000);self.assertEqual(history[-1]['content'],'source'*18000)
    def test_semantic_summary_and_recent_complete_pair(self):
        b={**self.budget,'max_estimated_input_tokens':7000}
        m=ContextManager(MODEL,b,self.archive);history=BASE+sum([pair(i,'x'*6000) for i in range(9)],[])
        seen=[]
        request,record=m.prepare(history,[],{},lambda s:seen.append(s) or 'm.v: prior change failed equivalence; try mux reassociation')
        self.assertTrue(seen);self.assertGreater(record['summary_calls'],0)
        self.assertIn('mux reassociation',json.dumps(request));self.assertEqual(request['messages'][-2:],history[-2:])
        self.assertLessEqual(m.size(request),7000)
    def test_forced_recovery_can_offload_latest_huge_call(self):
        m=ContextManager(MODEL,self.budget,self.archive)
        h=BASE+pair(1);m.prepare(h,[],{},lambda s:'prior')
        req,r=m.prepare(h,[],{},lambda s:'recovered state',force=True)
        self.assertTrue(r['forced_recovery']);self.assertGreater(r['removed_groups'],0)
        self.assertIn('recovered state',json.dumps(req));self.assertNotIn('tool_calls',json.dumps(req))
    def test_incremental_view_does_not_duplicate_history(self):
        m=ContextManager(MODEL,self.budget,self.archive);h=BASE+pair(1)
        m.prepare(h,[],{},lambda s:'unused');req,_=m.prepare(h+pair(2),[],{},lambda s:'unused')
        ids=[x['tool_call_id'] for x in req['messages'] if x['role']=='tool']
        self.assertEqual(ids,['1','2'])
    def test_calibration_uses_actual_usage(self):
        m=ContextManager(MODEL,self.budget,self.archive)
        m.observe({'input':'test'},{'input_tokens':1000});self.assertGreater(m.ratio,1/3)
    def test_responses_roundtrip_and_usage(self):
        model={**MODEL,'protocol':'openai_responses'}
        raw={'id':'r','status':'completed','model':'gpt-6-astra','output':[
            {'type':'reasoning','id':'rs','encrypted_content':'opaque'},
            {'type':'function_call','call_id':'c','name':'read_source','arguments':'{}'}],
            'usage':{'input_tokens':20,'output_tokens':10,'input_tokens_details':{'cached_tokens':4},'output_tokens_details':{'reasoning_tokens':6}}}
        d=decode(raw,'openai_responses');body=payload(model,BASE+[d['message'],{'role':'tool','tool_call_id':'c','content':'source'}],[],8192)
        self.assertEqual(body['input'][-3],raw['output'][0]);self.assertEqual(body['input'][-1]['call_id'],'c')
        self.assertFalse(body['store']);self.assertNotIn('previous_response_id',body)
        self.assertEqual(d['usage']['total_tokens'],30);self.assertEqual(d['usage']['reasoning_tokens'],6)
    def fixture(self,t):
        root=Path(t);d=root/'designs/d';(d/'reference').mkdir(parents=True);rtl=root/'rtl';rtl.mkdir()
        body='module m;wire x=0;endmodule';(rtl/'m.v').write_text(body);(d/'reference/m.v').write_text(body)
        (root/'fixed-prompt.md').write_text('task')
        save(d/'policy.json',{'version':2,'file_sha256':{'m.v':sha(rtl/'m.v')},'editable_files':['m.v'],'protected_modules':{},'fixed_storage_modules':{}})
        return root,rtl
    def response(self,msg):
        return {'message':msg,'stop_reason':'stop','usage':normalize_usage({'prompt_tokens':10,'completion_tokens':2},'openai_chat'),
                'raw':{'fixture':True},'latency_s':.01,'returned_model':'fixture'}
    def test_unlimited_requests_and_source_reads_beyond_old_caps(self):
        self.budget['max_estimated_input_tokens']=200000
        with tempfile.TemporaryDirectory() as t:
            root,rtl=self.fixture(t)
            (rtl/'m.v').write_text('module m;wire x=0;endmodule\n'+('//'+'a'*22000+'\n')*7)
            save(root/'designs/d/policy.json',{'version':2,'file_sha256':{'m.v':sha(rtl/'m.v')},'editable_files':['m.v'],'protected_modules':{},'fixed_storage_modules':{}})
            responses=[self.response({'role':'assistant','content':None,'tool_calls':[{'id':str(i),'function':{'name':'read_source','arguments':json.dumps({'file':'m.v','start_line':i+2,'end_line':i+2})}}]}) for i in range(7)]
            responses.append(self.response({'role':'assistant','content':'done'}))
            with patch('chipevo.providers.call',side_effect=responses),patch('chipevo.study.evaluate') as eda:
                result=agent(root,'d','area',rtl,'task',MODEL,self.budget,root/'agent',eda)
            self.assertEqual(result['status'],'completed');self.assertEqual(result['api_calls_completed'],8)
            self.assertGreater(result['source_chars_read'],100000)
    def test_confirmed_overflow_recovery_is_counted(self):
        with tempfile.TemporaryDirectory() as t:
            root,rtl=self.fixture(t)
            with patch('chipevo.providers.call',side_effect=[ContextWindowExceeded('fixture'),self.response({'role':'assistant','content':'done'})]),patch('chipevo.study.evaluate') as eda:
                result=agent(root,'d','area',rtl,'task',MODEL,self.budget,root/'agent',eda)
            self.assertEqual(result['status'],'completed');self.assertEqual(result['api_calls_attempted'],2)
            self.assertEqual(result['unmetered_failed_requests'],1);self.assertFalse(result['usage']['total_tokens_complete'])
    def test_failed_summary_preserves_recall_and_continues(self):
        m=ContextManager(MODEL,{**self.budget,'max_estimated_input_tokens':4000},self.archive)
        def fail(_):raise ValueError('fixture summary failure')
        request,_=m.prepare(BASE+pair(1,'x'*30000),[],{},fail,force=True)
        self.assertIn('Summary unavailable',json.dumps(request));self.assertTrue(self.archives)

    def test_summary_requests_are_charged_in_agent_totals(self):
        with tempfile.TemporaryDirectory() as t:
            root,rtl=self.fixture(t)
            (rtl/'m.v').write_text('module m;endmodule\n'+('//'+'x'*9000+'\n')*6)
            self.budget['max_estimated_input_tokens']=8500
            self.budget['prune_threshold_chars']=20000
            turns=[0]
            def reply(model,body,*args):
                if not body['tools']:return self.response({'role':'assistant','content':'Read m.v; no edits yet; continue local optimization.'})
                turns[0]+=1
                if turns[0]>=7:return self.response({'role':'assistant','content':'done'})
                return self.response({'role':'assistant','content':None,'tool_calls':[{'id':str(turns[0]),'function':{'name':'read_source','arguments':json.dumps({'file':'m.v','start_line':turns[0]+1,'end_line':turns[0]+1})}}]})
            with patch('chipevo.providers.call',side_effect=reply),patch('chipevo.study.evaluate') as eda:
                r=agent(root,'d','area',rtl,'task',MODEL,self.budget,root/'agent',eda)
            self.assertEqual(r['status'],'completed');self.assertIn('compaction',r['api_purposes'])
            self.assertGreater(r['api_calls_completed'],7)
            self.assertEqual(r['usage']['total_tokens'],12*r['api_calls_completed'])

    def test_long_single_line_can_be_paged(self):
        with tempfile.TemporaryDirectory() as t:
            root,rtl=self.fixture(t);(rtl/'m.v').write_text('//'+('x'*50000))
            responses=[]
            for i,offset in enumerate([0,24000,48000]):
                responses.append(self.response({'role':'assistant','content':None,'tool_calls':[{'id':str(i),'function':{'name':'read_source','arguments':json.dumps({'file':'m.v','start_line':1,'end_line':1,'offset_chars':offset})}}]}))
            responses.append(self.response({'role':'assistant','content':'done'}))
            self.budget['max_estimated_input_tokens']=200000
            with patch('chipevo.providers.call',side_effect=responses),patch('chipevo.study.evaluate') as eda:
                r=agent(root,'d','area',rtl,'task',MODEL,self.budget,root/'agent',eda)
            ev=load(root/'agent/tool-events.json');self.assertEqual(ev[0]['result']['next_offset_chars'],24000)
            self.assertEqual(ev[1]['result']['next_offset_chars'],48000);self.assertIsNone(ev[2]['result']['next_offset_chars'])
            self.assertEqual(r['source_chars_read'],50005)

    def test_one_bounded_summary_for_large_history(self):
        b={**self.budget,'max_estimated_input_tokens':7000,'summary_input_chars':16000}
        m=ContextManager(MODEL,b,self.archive);seen=[]
        history=BASE+sum([pair(i,'raw-source-marker'*3000) for i in range(20)],[])
        request,record=m.prepare(history,[],{},lambda s:seen.append(s) or 'No validated edit; inspect the current target.')
        self.assertEqual(record['summary_attempts'],1);self.assertEqual(len(seen),1)
        self.assertLess(len(seen[0]),8000)
        self.assertNotIn('raw-source-marker'*200,seen[0])
        self.assertLessEqual(m.size(request),7000)
        again,r=m.prepare(history,[],{},lambda _:self.fail('No new history must not trigger another summary'))
        self.assertEqual(r['summary_attempts'],0)

    def test_pruned_source_is_not_repeatedly_archived(self):
        b={**self.budget,'max_estimated_input_tokens':7000}
        m=ContextManager(MODEL,b,self.archive)
        value={'source':'x'*40000,'source_ref':'page-a','file':'a.v','file_sha256':'v1'}
        history=BASE+pair(1,json.dumps(value))
        m.prepare(history,[],{},lambda _:'state')
        count=len(self.archives)
        request,r=m.prepare(history,[],{},lambda _:self.fail('No repeated summary'))
        self.assertEqual(len(self.archives),count);self.assertEqual(r['pruned_results'],0)
        self.assertFalse(m.has_source('page-a'))

    def test_receipt_survives_source_eviction_during_prepare(self):
        b={**self.budget,'max_estimated_input_tokens':5000}
        m=ContextManager(MODEL,b,self.archive)
        source='original source '*300
        value={'source':source,'source_ref':'page-a','file':'a.v','file_sha256':'v1'}
        history=BASE+pair(1,json.dumps(value));m.prepare(history,[],{},lambda _:'state')
        # Simulate a reuse receipt issued just before old source leaves the view.
        m.active=[]
        history+=pair(2,json.dumps({'source_ref':'page-a','already_in_context':True,'unchanged':True}))
        request,r=m.prepare(history,[],{},lambda _:'state')
        result=json.loads(request['messages'][-1]['content'])
        self.assertEqual(result['source'],source);self.assertTrue(result['restored_for_context'])
        self.assertEqual(r['receipt_restorations_total'],1)

    def test_summary_failure_keeps_prior_memory_and_cooldown(self):
        b={**self.budget,'max_estimated_input_tokens':4000,'summary_min_new_groups':4,'prune_threshold_chars':100000}
        m=ContextManager(MODEL,b,self.archive);m.memory='Prior proven checkpoint.'
        def fail(_):raise ValueError('failure')
        history=BASE+pair(1,'x'*30000)
        _,r=m.prepare(history,[],{},fail,force=True)
        self.assertEqual(r['summary_attempts'],1)
        self.assertIn('Prior proven checkpoint.',m.memory)
        history+=pair(2,'y'*30000)+pair(3,'z'*30000)
        _,r=m.prepare(history,[],{},lambda _:self.fail('Cooldown must skip semantic summary'))
        self.assertEqual(r['summary_attempts'],0)

    def test_duplicate_source_receipt_and_edited_version_refresh(self):
        with tempfile.TemporaryDirectory() as t:
            root,rtl=self.fixture(t)
            calls=[('read_source',{'file':'m.v','start_line':1,'end_line':1}),
                   ('read_source',{'file':'m.v','start_line':1,'end_line':1}),
                   ('apply_edits',{'edits':[{'file':'m.v','old':'wire x=0','new':'wire x=1'}]}),
                   ('read_source',{'file':'m.v','start_line':1,'end_line':1})]
            responses=[self.response({'role':'assistant','content':None,'tool_calls':[{'id':str(i),'function':{'name':name,'arguments':json.dumps(args)}}]}) for i,(name,args) in enumerate(calls)]
            responses.append(self.response({'role':'assistant','content':'done'}))
            with patch('chipevo.providers.call',side_effect=responses),patch('chipevo.study.evaluate') as eda:
                r=agent(root,'d','area',rtl,'task',MODEL,self.budget,root/'agent',eda)
            self.assertEqual(r['status'],'completed');self.assertEqual(r['source_reuse_receipts'],1)
            ev=load(root/'agent/tool-events.json')
            self.assertNotIn('source',ev[1]['result']);self.assertTrue(ev[1]['result']['already_in_context'])
            self.assertIn('wire x=1',ev[3]['result']['source'])
            self.assertNotEqual(ev[0]['result']['file_sha256'],ev[3]['result']['file_sha256'])
            self.assertNotEqual(ev[0]['result']['source_ref'],ev[3]['result']['source_ref'])

    def test_evicted_source_is_restored_on_request(self):
        with tempfile.TemporaryDirectory() as t:
            root,rtl=self.fixture(t);args={'file':'m.v','start_line':1,'end_line':1}
            def response_read(i):return self.response({'role':'assistant','content':None,'tool_calls':[{'id':str(i),'function':{'name':'read_source','arguments':json.dumps(args)}}]})
            original=ContextManager.prepare
            count=[0]
            def evict(manager,*args,**kwargs):
                request,record=original(manager,*args,**kwargs);count[0]+=1
                if count[0]==2:manager.active=[]
                return request,record
            with patch('chipevo.providers.call',side_effect=[response_read(1),response_read(2),self.response({'role':'assistant','content':'done'})]),patch.object(ContextManager,'prepare',evict):
                r=agent(root,'d','area',rtl,'task',MODEL,self.budget,root/'agent',lambda *a:None)
            self.assertEqual(r['source_page_restorations'],1)
            self.assertIn('source',load(root/'agent/tool-000002.json')['result'])

if __name__=='__main__':unittest.main()
