import unittest,math
from chipevo.scoring import score
from chipevo.eda.sta import render_sdc,extract_metrics
from chipevo.eda.synthesis import recipe

BASE={'total_area_um2':100.,'effective_delay_ns':10.,'hold_worst_slack_ns':-.05,'special_worst_slack_ns':None}
CFG={'max_area_ratio':1.05,'max_delay_ratio':1.0,'full_score_improvement':.10,'resolved_improvement':.02}

class ScoringTests(unittest.TestCase):
    def test_timing_gain_and_area_penalty(self):
        r=score('timing',BASE,{**BASE,'effective_delay_ns':9.,'total_area_um2':104.},CFG)
        self.assertTrue(r['resolved']);self.assertAlmostEqual(r['score'],100/104,places=7)
    def test_area_cap_is_hard(self):
        self.assertEqual(score('timing',BASE,{**BASE,'effective_delay_ns':5.,'total_area_um2':106.},CFG)['score'],0)
    def test_area_gain_cannot_hide_delay_failure(self):
        self.assertEqual(score('area',BASE,{**BASE,'total_area_um2':50.,'effective_delay_ns':10.01},CFG)['score'],0)
    def test_area_gain(self):
        r=score('area',BASE,{**BASE,'total_area_um2':95.},CFG)
        self.assertTrue(r['resolved']);self.assertAlmostEqual(r['score'],.5)
    def test_no_change_does_not_solve(self):
        r=score('timing',BASE,BASE,CFG);self.assertFalse(r['resolved']);self.assertEqual(r['score'],0)
    def test_unproven_and_nan_rejected(self):
        self.assertEqual(score('timing',BASE,{**BASE,'effective_delay_ns':5},CFG,formal_pass=False)['score'],0)
        self.assertEqual(score('timing',BASE,{**BASE,'effective_delay_ns':float('nan')},CFG)['score'],0)
    def test_hold_regression_rejected(self):
        self.assertEqual(score('timing',BASE,{**BASE,'effective_delay_ns':5,'hold_worst_slack_ns':-.06},CFG)['score'],0)
    def test_new_special_failure_rejected(self):
        self.assertEqual(score('timing',BASE,{**BASE,'effective_delay_ns':5,'special_worst_slack_ns':-.2},CFG)['score'],0)
    def test_period_source_updates_all_clocks(self):
        s='create_clock -name a -period 10 [get_ports a]\ncreate_clock -name b -period 10 [get_ports b]\nset_load .01 [all_outputs]\n'
        t=render_sdc(s,7);self.assertEqual(t.count('-period 7'),2);self.assertIn('set_load .01',t)
        self.assertIn('-D 7000',recipe('timing',7));self.assertNotIn('-D',recipe('area',7))
    def test_special_checks_separated_without_hiding(self):
        checks={'checks':[{'path_group':'clk','source_clock':'clk','target_clock':'clk','slack':4e-9},{'path_group':'gated clock','target_clock':'clk','slack':-2e-9}]}
        m=extract_metrics(checks,'worst slack max -2\nworst slack min -.1\ntns max -2',10)
        self.assertAlmostEqual(m['effective_delay_ns'],6);self.assertAlmostEqual(m['special_worst_slack_ns'],-2)

if __name__=='__main__':unittest.main()
