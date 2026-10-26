import importlib.util,json,hashlib,tempfile,unittest
from pathlib import Path

source=Path(__file__).resolve().parents[1]/'tools/prepare_platform_upload.py'
spec=importlib.util.spec_from_file_location('platform_upload',source)
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)

class PlatformUploadTest(unittest.TestCase):
    def check_parts(self,corrupt=False):
        with tempfile.TemporaryDirectory() as tmp:
            tmp=Path(tmp);tests=tmp/'tests';tests.mkdir();out=tmp/'eval'
            data=b'synthetic evaluator archive';name='grader.part0000'
            (tests/name).write_bytes(b'corrupted' if corrupt else data)
            (tests/'grader_bundle.json').write_text(json.dumps({'sha256':hashlib.sha256(data).hexdigest(),
                'parts':[{'name':name,'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}]}))
            code=module.CHUNK_LOADER.replace("'/test_files/grader_bundle.json'",repr(str(tests/'grader_bundle.json')))
            code=code.replace("'/test_files'",repr(str(tests))).replace("'/eval/chipevo_grader.tar.gz'",repr(str(out/'chipevo_grader.tar.gz')))
            code=code.replace("'/eval/code_result.json'",repr(str(out/'code_result.json'))).replace("'/eval'",repr(str(out)))
            if corrupt:
                with self.assertRaises(SystemExit):exec(compile(code,'loader','exec'),{})
                result=json.loads((out/'code_result.json').read_text())
                self.assertEqual(set(result),{'resolved','score','reason'});self.assertFalse(result['resolved'])
            else:
                exec(compile(code,'loader','exec'),{})
                self.assertEqual((out/'chipevo_grader.tar.gz').read_bytes(),data)
    def test_chunk_assembly(self):self.check_parts()
    def test_corrupt_part_fails_closed(self):self.check_parts(True)
