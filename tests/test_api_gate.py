import multiprocessing as mp
import os,time,tempfile,unittest
from chipevo.api_gate import request_slot

def worker(directory,events,limit=5,timeout=10):
    os.environ['CHIPEVO_API_LOCK_DIR']=directory
    model={'base_url':'http://localhost:8317/v1','model':'test','max_concurrent_requests':limit}
    with request_slot(model,timeout):
        events.put((time.monotonic(),1));time.sleep(.12);events.put((time.monotonic(),-1))

@unittest.skipUnless(os.name=='posix','Production API gates use Linux flock')
class GateTest(unittest.TestCase):
    def test_cross_process_cap_and_release(self):
        with tempfile.TemporaryDirectory() as directory:
            events=mp.Queue();children=[mp.Process(target=worker,args=(directory,events)) for _ in range(15)]
            for p in children:p.start()
            for p in children:p.join(15);self.assertEqual(p.exitcode,0)
            rows=sorted(events.get(timeout=2) for _ in range(30));active=peak=0
            for _,delta in rows:active+=delta;peak=max(active,peak)
            self.assertLessEqual(peak,5);self.assertGreater(peak,1);self.assertEqual(active,0)
    def test_25_queued_candidates_all_finish_with_five_slots(self):
        with tempfile.TemporaryDirectory() as directory:
            events=mp.Queue();children=[mp.Process(target=worker,args=(directory,events,5,None)) for _ in range(25)]
            for p in children:p.start()
            for p in children:p.join(15);self.assertEqual(p.exitcode,0)
            active=peak=0
            for _,delta in sorted(events.get(timeout=2) for _ in range(50)):
                active+=delta;peak=max(active,peak)
            self.assertLessEqual(peak,5);self.assertEqual(active,0)
    def test_timeout_and_exception_release(self):
        with tempfile.TemporaryDirectory() as directory:
            old=os.environ.get('CHIPEVO_API_LOCK_DIR');os.environ['CHIPEVO_API_LOCK_DIR']=directory
            m={'base_url':'http://127.0.0.1:8317/v1','model':'test','max_concurrent_requests':1}
            try:
                with request_slot(m,2):
                    with self.assertRaises(TimeoutError):
                        with request_slot(m,.04):pass
                with self.assertRaises(ValueError):
                    with request_slot(m,2):raise ValueError('synthetic')
                with request_slot(m,2):pass
            finally:
                if old is None:os.environ.pop('CHIPEVO_API_LOCK_DIR',None)
                else:os.environ['CHIPEVO_API_LOCK_DIR']=old
    def test_invalid_limit(self):
        for value in [0,6,True,1.5]:
            with self.assertRaises(ValueError):
                with request_slot({'max_concurrent_requests':value},1):pass
