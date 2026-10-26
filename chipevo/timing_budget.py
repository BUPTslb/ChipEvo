"""Candidate active-time accounting. API-slot waiting is measured separately."""
from contextlib import contextmanager
from contextvars import ContextVar
import time,math

current_candidate_clock=ContextVar('chipevo_candidate_clock',default=None)

class CandidateClock:
    def __init__(self,limit,now=time.monotonic,started=None):
        self.limit=limit;self.now=now;self.started=now() if started is None else started
        self.queue_s=0.;self.wait_started=None
    def snapshot(self):
        now=self.now();wall=max(0.,now-self.started)
        queued=self.queue_s+(max(0.,now-self.wait_started) if self.wait_started is not None else 0.)
        return {'agent_wall_s':wall,'api_queue_wait_total_s':queued,
                'candidate_active_s':max(0.,wall-queued),'waiting_for_api_slot':self.wait_started is not None}
    def remaining(self):return max(0.,self.limit-self.snapshot()['candidate_active_s'])
    def carry_forward(self,snapshot):
        """Carry completed work/queue time, excluding offline and restore time."""
        wall=snapshot['agent_wall_s'];queued=snapshot['api_queue_wait_total_s']
        active=snapshot['candidate_active_s']
        if not all(isinstance(x,(int,float)) and math.isfinite(x) and x>=0 for x in [wall,queued,active]):
            raise ValueError('Invalid saved candidate clock')
        if queued>wall or abs(wall-queued-active)>0.01:raise ValueError('Inconsistent saved candidate clock')
        self.started=self.now()-wall;self.queue_s=queued;self.wait_started=None
    @contextmanager
    def waiting(self):
        if self.wait_started is not None:raise RuntimeError('Nested API-slot waits are unsupported')
        self.wait_started=self.now()
        try:yield
        finally:
            self.queue_s+=max(0.,self.now()-self.wait_started);self.wait_started=None
