from pathlib import Path
import importlib.util,json,tempfile,unittest,sys
from unittest.mock import patch

class GradingContractTests(unittest.TestCase):
    def test_platform_exact_keys_and_separate_report(self):
        script=Path(__file__).resolve().parents[1]/'grading/entry.py'
        spec=importlib.util.spec_from_file_location('grade_entry',script);module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);(root/'workspace/designs/cgra/rtl').mkdir(parents=True)
            task=root/'task.json';task.write_text('{"design":"cgra","objective":"timing"}')
            result=root/'eval/code_result.json'
            args=['grade','--task-file',str(task),'--candidate-root',str(root/'workspace'),'--result',str(result),'--artifacts',str(root/'artifacts')]
            fake={'grade':{'resolved':True,'score':.85,'reason':'synthetic fixture'},'status':'evaluated'}
            with patch.object(sys,'argv',args),patch('chipevo.engine.evaluate',return_value=fake) as evaluate:
                module.main('timing')
                evaluate.assert_called_once()
            data=json.loads(result.read_text());self.assertEqual(set(data),{'resolved','score','reason'});self.assertTrue(data['resolved']);self.assertTrue((result.parent/'chipevo_report.json').is_file())
    def test_cli_no_implicit_eda(self):
        from chipevo.cli import main
        with patch.object(sys,'argv',['chipevo','evaluate','--design','cgra','--objective','timing','--candidate','/tmp/never-used']),patch('chipevo.engine.evaluate') as evaluate:
            with self.assertRaises(SystemExit):main()
            evaluate.assert_not_called()

if __name__=='__main__':unittest.main()
