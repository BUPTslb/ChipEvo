import unittest
from chipevo.rollout import tools, agent
from chipevo.scoring import score
from chipevo.study_config import read_config
from unittest.mock import patch

class RoundFeedbackTests(unittest.TestCase):
    def test_no_eda_schema(self):
        self.assertNotIn('evaluate_candidate', [t['function']['name'] for t in tools(0)])

    def test_legacy_budget_rejected_before_execution(self):
        with self.assertRaisesRegex(ValueError, 'In-candidate EDA'):
            agent(None,None,None,None,None,None,{'max_eda_feedback_calls':1},None,None)

    def test_legacy_resume_rejected(self):
        with self.assertRaisesRegex(ValueError, 'Legacy checkpoints'):
            agent(None,None,None,None,None,None,{'max_eda_feedback_calls':0},None,None,resume_from='old')

    def test_old_launch_rejected(self):
        cfg={'study_id':'old','candidates_per_round':5,'rounds':1,'budget':{'max_eda_feedback_calls':1}}
        with patch('chipevo.study_config.load',return_value=cfg):
            with self.assertRaisesRegex(ValueError,'round-feedback-v1'):
                read_config('unused',ready=True)

    def test_positive_gain_below_two_percent(self):
        base={'total_area_um2':100.,'effective_delay_ns':10.,'hold_worst_slack_ns':0.}
        cfg={'max_area_ratio':1.05,'max_delay_ratio':1.,'full_score_improvement':.4}
        self.assertTrue(score('timing',base,{**base,'effective_delay_ns':9.99},cfg)['resolved'])
        self.assertTrue(score('area',base,{**base,'total_area_um2':99.9},cfg)['resolved'])
        self.assertFalse(score('timing',base,base,cfg)['resolved'])
        self.assertFalse(score('timing',base,{**base,'effective_delay_ns':9.99},cfg,formal_pass=False)['resolved'])

if __name__=='__main__':unittest.main()

