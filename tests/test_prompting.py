from pathlib import Path
import tempfile,unittest
from unittest.mock import patch
from chipevo.prompting import prepare_context,render,compact
from chipevo.localization import read_timing,context
from chipevo.util import save

class PromptTests(unittest.TestCase):
    def fixture(self,root,objective):
        save(root/f'configs/tasks/cgra.{objective}.json',{
            'design':'cgra','objective':objective,'period_ns':7.5,
            'synthesis_timeout_s':1,'sta_timeout_s':1,
            'scoring':{k:1 for k in ['max_area_ratio','max_delay_ratio','full_score_improvement','resolved_improvement']},
            'localization':{'strategy':'timing_module' if objective=='timing' else 'hierarchy_area'}})
        (root/'prompts').mkdir(exist_ok=True)
        (root/f'prompts/{objective}.md').write_text('{{design}} period={{period_ns}} budget={{eda_feedback_budget}}')
        evidence={'design':'cgra','strategy':'timing_module','module_index':[{'module':'alu','protected':False,'exclusive_area_all_instances_um2':10}],
            'suggested_targets':[{'module':'alu','file':'rtl/x.v','protected':False}],
            'timing_targets':[{'module':'alu','protected':False}],
            'critical_paths':[{'slack':-1e-9,'source_path':[{'huge':'excluded'}]}]}
        save(root/'designs/cgra/context/timing_module.json',evidence)
        return evidence

    def test_timing_prompt_automatically_includes_evidence_and_period(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);self.fixture(root,'timing')
            with patch('chipevo.prompting.context') as c:
                text,evidence=render(root,'cgra','timing')
                c.assert_not_called()
            self.assertIn('period=7.5',text);self.assertIn('"suggested_targets"',text)
            self.assertIn('alu',text);self.assertNotIn('huge',text)
            self.assertEqual(evidence['strategy'],'timing_module')

    def test_area_has_secondary_timing_without_starting_eda(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);evidence=self.fixture(root,'area');evidence['strategy']='hierarchy_area'
            with patch('chipevo.prompting.context',return_value=evidence) as c:
                out=prepare_context(root,'cgra','area')
            c.assert_called_once_with(root,'cgra','hierarchy_area',None)
            self.assertTrue(out['secondary_evidence']['timing_targets'])

    def test_missing_timing_fails_instead_of_silent_area_fallback(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);self.fixture(root,'timing')
            (root/'designs/cgra/context/timing_module.json').unlink()
            with self.assertRaisesRegex(ValueError,'Missing frozen timing'):prepare_context(root,'cgra','timing')

    def test_no_editable_targets_cannot_silently_produce_task(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);e=self.fixture(root,'timing');e['suggested_targets']=[]
            save(root/'designs/cgra/context/timing_module.json',e)
            with self.assertRaisesRegex(ValueError,'No editable'):prepare_context(root,'cgra','timing')

    def test_historical_text_fallback_preserves_units(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);(root/'sta.log').write_text('Startpoint: a\n (rising edge-triggered flip-flop clocked by clk)\nEndpoint: b\n (rising edge-triggered flip-flop clocked by clk)\nPath Group: clk\nPath Type: max\n 1 2 0.20 ^ u/q/Q (DFF_X1)\n 1 2 0.30 ^ u/add/Z (AND2_X1)\n 0.30 data arrival time\n -0.10 slack (VIOLATED)\n')
            data,note=read_timing(root)
            self.assertAlmostEqual(data['checks'][0]['slack'],-1e-10)
            self.assertEqual(data['checks'][0]['source_path'][1]['instance'],'u/add')
            self.assertIn('printed precision',note)

    def test_fixed_worst_paths_do_not_hide_mutable_targets(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d=root/'designs/cgra';(d/'reference').mkdir(parents=True)
            (d/'reference/m.v').write_text('module ram;endmodule\nmodule alu;endmodule\nmodule top;endmodule\n')
            save(d/'policy.json',{'editable_files':['m.v'],'protected_modules':{'m.v':['ram']},'fixed_storage_modules':{'m.v':['ram']}})
            save(d/'manifest.json',{'top':'top'})
            index=[{'module':n,'file':'rtl/m.v','start_line':i,'end_line':i} for i,n in enumerate(['ram','alu','top'],1)]
            save(d/'context/module-index.json',index)
            (root/'technology').mkdir();(root/'technology/NangateOpenCellLibrary_typical.lib').write_text('cell (AND2_X1) { area : 1; }')
            b=root/'run/build';b.mkdir(parents=True)
            save(b/'mapped.json',{'modules':{'top':{'cells':{'r':{'type':'ram'},'a':{'type':'alu'}}},'ram':{'cells':{'g':{'type':'AND2_X1'}}},'alu':{'cells':{'g':{'type':'AND2_X1'}}}}})
            def path(instance,slack):return {'path_group':'clk','target_clock':'clk','source_clock':'clk','slack':slack,'source_path':[{'arrival':0},{'arrival':2e-9,'instance':instance}]}
            save(b/'timing.json',{'checks':[path('r/g',-2e-9)]*12+[path('a/g',-1e-9)]})
            result=context(root,'cgra','timing_module',root/'run')
            self.assertEqual(result['suggested_targets'][0]['module'],'alu')
            self.assertEqual(len(result['fixed_only_critical_paths']),10)
            self.assertEqual(len(result['critical_paths']),1)

if __name__=='__main__':unittest.main()
