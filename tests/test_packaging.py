from pathlib import Path
import tempfile,tarfile,unittest
from unittest.mock import patch
from chipevo.packaging import package

class PackagingTests(unittest.TestCase):
    def test_all_locked_native_files_survive_packaging(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp)
            for d in ['chipevo','designs/cgra/reference','technology','configs','grading','tools/runtime/linux-x86_64/share/yosys/python3/__pycache__']:(root/d).mkdir(parents=True)
            rel='tools/runtime/linux-x86_64/share/yosys/python3/__pycache__/smtio.cpython-310.pyc'
            (root/rel).write_bytes(b'locked tool data, not framework bytecode')
            (root/'designs/cgra/reference/m.v').write_text('module m;endmodule')
            (root/'.cache/baselines').mkdir(parents=True)
            (root/'.cache/baselines/.authority').write_bytes(b'private cache key')
            (root/'artifacts').mkdir();(root/'artifacts/private.json').write_text('not shipped')
            out=root/'dist/grade.tar.gz'
            with patch('chipevo.packaging.verify_assets'):package(root,out)
            with tarfile.open(out) as tar:
                self.assertIn('chipevo_grader/'+rel,tar.getnames())
                self.assertFalse(any('/.cache/' in p or '/artifacts/' in p or p.endswith('/.authority') for p in tar.getnames()))
            self.assertFalse(out.with_suffix('.gz.tmp').exists())

if __name__=='__main__':unittest.main()
