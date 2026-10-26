import copy,json,tempfile,unittest
from pathlib import Path
from chipevo.study_config import read_config,plan

class ObjectiveTest(unittest.TestCase):
    def config(self):
        root=Path(__file__).resolve().parents[1]
        cfg=json.loads((root/'configs/studies/example.json').read_text())
        cfg.update(objectives=['timing'],rounds=1)
        return cfg
    def test_timing_only_matrix(self):
        cfg=self.config();result=plan(cfg)
        self.assertEqual(result['candidate_count'],25)
        self.assertEqual(len(result['tasks']),5)
        self.assertTrue(all(t['objective']=='timing' for t in result['tasks']))
    def test_invalid_objectives(self):
        for objectives in [[],['timing','timing'],['power'],'timing']:
            cfg=self.config();cfg['objectives']=objectives
            with tempfile.TemporaryDirectory() as tmp:
                path=Path(tmp)/'config.json';path.write_text(json.dumps(cfg))
                with self.assertRaises(ValueError):read_config(path)
