from contextlib import contextmanager
import unittest
from unittest.mock import patch
from pathlib import Path
import tempfile,json
from chipevo.timing_budget import CandidateClock,current_candidate_clock
from chipevo import providers

class ClockTest(unittest.TestCase):
    def test_rollout_file_handoff_survives_queue_longer_than_budget(self):
        from chipevo.rollout import agent
        from chipevo.study_metrics import normalize_usage
        from chipevo.util import save,load,sha
        now=[100.];clock=CandidateClock(3600,now=lambda:now[0])
        @contextmanager
        def gate(*args,**kwargs):now[0]+=4500;yield 4500
        replies=[{'role':'assistant','content':None,'tool_calls':[{'id':'read','function':{'name':'read_source','arguments':json.dumps({'file':'m.v','start_line':1,'end_line':1})}}]},
                 {'role':'assistant','content':'done'}]
        def http(*args):
            now[0]+=10;message=replies.pop(0)
            return {'message':message,'stop_reason':'tool_calls' if message.get('tool_calls') else 'stop',
                    'usage':normalize_usage({'prompt_tokens':10,'completion_tokens':2},'openai_chat'),
                    'raw':{'fixture':True},'latency_s':10,'returned_model':'fixture'}
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);d=root/'designs/d';d.mkdir(parents=True);rtl=root/'rtl';rtl.mkdir()
            (rtl/'m.v').write_text('module m;endmodule');(root/'fixed-prompt.md').write_text('Fixed goal.')
            save(d/'policy.json',{'file_sha256':{'m.v':sha(rtl/'m.v')}})
            budget=load(Path(__file__).resolve().parents[1]/'configs/studies/multimodel.json')['budget']
            model={'model':'fixture','protocol':'openai_chat','context_window_tokens':262144}
            with patch('chipevo.rollout.time.monotonic',lambda:now[0]),patch('chipevo.rollout.CandidateClock',return_value=clock),patch('chipevo.api_gate.request_slot',gate),patch('chipevo.providers._call',side_effect=http):
                state=agent(root,'d','timing',rtl,'Fixed goal.',model,budget,root/'agent',lambda *a:None)
            self.assertEqual(state['status'],'completed')
            self.assertEqual(state['candidate_active_s'],20)
            self.assertEqual(state['api_queue_wait_total_s'],9000)
            self.assertEqual(state['agent_wall_s'],9020)
            self.assertEqual(load(root/'agent/agent.json')['candidate_active_s'],20)
            self.assertEqual(load(root/'agent/usage-0.json')['api_queue_wait_s'],4500)
            self.assertTrue((root/'agent/tool-000001.json').is_file())
            self.assertIsNone(current_candidate_clock.get())
    def test_long_queue_does_not_use_active_budget(self):
        now=[0.];clock=CandidateClock(3600,now=lambda:now[0])
        now[0]=10
        with clock.waiting():
            now[0]+=7200
            self.assertEqual(clock.remaining(),3590)
            self.assertTrue(clock.snapshot()['waiting_for_api_slot'])
        now[0]+=20
        self.assertEqual(clock.snapshot()['agent_wall_s'],7230)
        self.assertEqual(clock.snapshot()['candidate_active_s'],30)
        self.assertEqual(clock.snapshot()['api_queue_wait_total_s'],7200)
        self.assertEqual(clock.remaining(),3570)
    def test_exception_retains_queue_measurement(self):
        now=[0.];clock=CandidateClock(3600,now=lambda:now[0])
        with self.assertRaises(RuntimeError):
            with clock.waiting():now[0]=5000;raise RuntimeError('fixture')
        self.assertEqual(clock.remaining(),3600)
        self.assertFalse(clock.snapshot()['waiting_for_api_slot'])
    def test_provider_starts_full_http_timeout_after_long_queue(self):
        now=[0.];clock=CandidateClock(3600,now=lambda:now[0]);token=current_candidate_clock.set(clock)
        @contextmanager
        def gate(*args,**kwargs):now[0]+=5000;yield 5000
        try:
            with patch('chipevo.api_gate.request_slot',gate),patch('chipevo.providers._call',return_value={}) as http:
                response=providers.call({}, {},1200,1000)
            self.assertEqual(http.call_args.args[2],1200)
            self.assertEqual(response['api_queue_wait_s'],5000)
            self.assertEqual(clock.remaining(),3600)
        finally:current_candidate_clock.reset(token)
    def test_http_timeout_is_capped_by_remaining_active_time(self):
        now=[0.];clock=CandidateClock(3600,now=lambda:now[0]);now[0]=3550
        token=current_candidate_clock.set(clock)
        @contextmanager
        def gate(*args,**kwargs):now[0]+=2000;yield 2000
        try:
            with patch('chipevo.api_gate.request_slot',gate),patch('chipevo.providers._call',return_value={}) as http:
                providers.call({}, {},1200,1000)
            self.assertEqual(http.call_args.args[2],50)
            self.assertEqual(clock.remaining(),50)
        finally:current_candidate_clock.reset(token)
    def test_failed_http_keeps_queue_excluded_and_active_time_charged(self):
        now=[0.];clock=CandidateClock(3600,now=lambda:now[0]);token=current_candidate_clock.set(clock)
        @contextmanager
        def gate(*args,**kwargs):now[0]+=4000;yield 4000
        def failed(*args):now[0]+=1200;raise RuntimeError('fixture HTTP timeout')
        try:
            with patch('chipevo.api_gate.request_slot',gate),patch('chipevo.providers._call',side_effect=failed):
                with self.assertRaises(RuntimeError):providers.call({}, {},1200,1000)
            self.assertEqual(clock.snapshot()['api_queue_wait_total_s'],4000)
            self.assertEqual(clock.snapshot()['candidate_active_s'],1200)
            self.assertEqual(clock.remaining(),2400)
        finally:current_candidate_clock.reset(token)
