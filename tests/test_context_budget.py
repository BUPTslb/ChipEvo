import copy,json,tempfile,unittest
from pathlib import Path
from unittest.mock import patch
from chipevo.context_budget import prepare,estimate,groups,ContextLimitError
from chipevo.providers import payload
from chipevo.study_config import read_config
from chipevo.rollout import agent
from chipevo.util import load,save,sha

ROOT=Path(__file__).resolve().parents[1]
MODEL={'protocol':'openai_chat','model':'fixture','context_window_tokens':131072}
BASE=[{'role':'system','content':'fixed system'},{'role':'user','content':'fixed objective and policy'}]

def pair(i,text='source'):
    return [{'role':'assistant','content':None,'reasoning_content':'preserved reasoning',
             'tool_calls':[{'id':str(i),'type':'function','function':{'name':'read_source','arguments':'{}'}}]},
            {'role':'tool','tool_call_id':str(i),'content':text}]

class ContextTests(unittest.TestCase):
    def setUp(self):
        self.budget=load(ROOT/'configs/studies/multimodel.json')['budget']
        # Keep small-window boundary fixtures independent of production budgets.
        self.budget['max_output_tokens']=8192

    def test_trim_preserves_pairs_and_full_original(self):
        history=BASE+sum([pair(i,'v'*6000) for i in range(8)],[]);original=copy.deepcopy(history)
        self.budget['max_estimated_input_tokens']=18000
        body,record=prepare(MODEL,history,[],self.budget,{'edits':2})
        self.assertGreater(record['removed_groups'],0);self.assertLessEqual(estimate(body),18000)
        self.assertEqual(body['messages'][:2],BASE);self.assertEqual(history,original)
        self.assertEqual(body['messages'][-2:],history[-2:]);groups(body['messages'][2:])

    def test_fixed_prompt_or_newest_group_overflow_fails(self):
        self.budget['max_estimated_input_tokens']=2000
        for history in [BASE+[{'role':'assistant','content':'x'*4000}],
                        [BASE[0],{'role':'user','content':'policy'*1000}]]:
            with self.assertRaisesRegex(ContextLimitError,'no API request sent'):
                prepare(MODEL,history,[],self.budget,{})

    def test_window_reserves_output_safety(self):
        model={**MODEL,'context_window_tokens':12000}
        body,r=prepare(model,BASE,[],self.budget,{})
        self.assertEqual(r['effective_input_limit'],1760)
        self.assertEqual(r['output_reserve_tokens'],8192)

    def test_count_actual_schema_and_multibyte_payload(self):
        ascii_body=payload(MODEL,BASE,[],8192)
        cn_body=payload(MODEL,BASE+[{'role':'user','content':'中'*10}],[],8192)
        self.assertGreater(estimate(cn_body)-estimate(ascii_body),30)
        schema=[{'type':'function','function':{'name':'x','description':'large'*1000}}]
        self.assertGreater(estimate(payload(MODEL,BASE,schema,8192)),estimate(ascii_body)+4000)

    def test_incomplete_or_orphan_roundtrip_rejected(self):
        for messages in [pair(1)[:1],pair(1)[1:],pair(1)+pair(2)[:1]]:
            with self.assertRaises(ContextLimitError):groups(messages)

    def test_anthropic_signed_blocks_preserved(self):
        model={**MODEL,'protocol':'anthropic_messages'}
        history=BASE+pair(0,'a'*8000)+pair(1)
        blocks=[{'type':'thinking','thinking':'reason','signature':'original signature'},
                {'type':'tool_use','id':'1','name':'read_source','input':{}}]
        history[-2]['provider_content']=blocks
        self.budget['max_estimated_input_tokens']=4000
        body,r=prepare(model,history,[],self.budget,{})
        self.assertEqual(body['messages'][-2]['content'],blocks)
        self.assertEqual(body['messages'][-1]['content'][0]['tool_use_id'],'1')

    def test_ready_requires_confirmed_context_window(self):
        cfg=load(ROOT/'configs/studies/multimodel.json')
        cfg['models']=[{**MODEL,'id':'fixture','base_url':'https://example.invalid/v1','api_key_env':'FIXTURE'}]
        with tempfile.TemporaryDirectory() as t:
            p=Path(t)/'cfg.json';save(p,cfg);read_config(p,ready=True)
            cfg['models'][0]['context_window_tokens']=None;save(p,cfg)
            with self.assertRaisesRegex(ValueError,'context_window_tokens'):read_config(p,ready=True)

    def test_context_failure_makes_no_provider_or_eda_calls(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d=root/'designs/d';d.mkdir(parents=True);rtl=root/'rtl';rtl.mkdir()
            (rtl/'a.v').write_text('module a; endmodule');(root/'fixed-prompt.md').write_text('task')
            save(d/'policy.json',{'file_sha256':{'a.v':sha(rtl/'a.v')}})
            self.budget['max_estimated_input_tokens']=1000
            with patch('chipevo.providers.call') as api,patch('chipevo.study.evaluate') as eda:
                result=agent(root,'d','area',rtl,'task',MODEL,self.budget,root/'agent',eda)
                api.assert_not_called();eda.assert_not_called()
            self.assertEqual(result['status'],'failed');self.assertEqual(result['api_calls_attempted'],0)
            self.assertEqual(len(load(root/'agent/transcript.json')),2)

if __name__=='__main__':unittest.main()
