import copy,unittest
from chipevo.providers import summary_model,payload
from chipevo.context_manager import ContextManager
from test_context_budget import BASE,MODEL,pair

class SummaryPolicyTests(unittest.TestCase):
    def test_deepseek_summary_retains_unified_high_without_mutating_main(self):
        main={'model':'deepseek-v4-pro','protocol':'openai_chat','request_options':{'thinking':{'type':'enabled'},'reasoning_effort':'high'}}
        original=copy.deepcopy(main);adapted=summary_model(main)
        body=payload(adapted,[{'role':'user','content':'Summarize progress.'}],[],16384)
        self.assertEqual(main,original);self.assertEqual(body['thinking'],{'type':'enabled'})
        self.assertEqual(body['reasoning_effort'],'high');self.assertEqual(body['max_tokens'],16384)
        self.assertEqual(body['model'],'deepseek-v4-pro')
    def test_other_model_options_are_preserved(self):
        model={'model':'k3.1-pro','protocol':'openai_chat','request_options':{'reasoning_effort':'high'}}
        self.assertEqual(summary_model(model),model)
        self.assertIsNot(summary_model(model)['request_options'],model['request_options'])
    def test_failed_summary_backs_off_even_during_forced_compaction(self):
        from pathlib import Path
        from chipevo.util import load
        budget=load(Path(__file__).resolve().parents[1]/'configs/studies/multimodel.json')['budget']
        budget={**budget,'max_output_tokens':8192,'max_estimated_input_tokens':12000}
        archive=[]
        def store(text,kind):archive.append(text);return str(len(archive))
        manager=ContextManager(MODEL,budget,store);history=BASE+pair(0,'fixture')
        attempts=[]
        def broken(text):attempts.append(text);raise ValueError('Incomplete summary fixture')
        manager.prepare(history,[],{},broken,force=True)
        self.assertEqual(len(attempts),1)
        for i in range(1,8):
            history+=pair(i,'new evidence');manager.prepare(history,[],{},broken,force=True)
        self.assertEqual(len(attempts),1)
        history+=pair(8,'new evidence');manager.prepare(history,[],{},broken,force=True)
        self.assertEqual(len(attempts),2)
        self.assertTrue(manager.memory)
        self.assertEqual(next(e['retry_after_new_groups'] for e in reversed(manager.events) if 'retry_after_new_groups' in e),16)
