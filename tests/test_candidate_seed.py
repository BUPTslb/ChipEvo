from pathlib import Path
import hashlib,tempfile,unittest
from chipevo.engine import seed_reference_candidate
from chipevo.policy import validate
from chipevo.util import save,sha

class CandidateSeedTests(unittest.TestCase):
    def fixture(self,root,canonical='rtl/top.v\n'):
        d=root/'designs/d';r=d/'reference';r.mkdir(parents=True)
        (r/'top.v').write_text('module top;endmodule\n')
        (r/'files.f').write_text('reference/top.v\n')
        save(d/'manifest.json',{'sources':['rtl/top.v']})
        save(d/'policy.json',{'version':2,'file_sha256':{'top.v':sha(r/'top.v'),'files.f':hashlib.sha256(canonical.encode()).hexdigest()},
            'editable_files':['top.v'],'protected_modules':{},'fixed_storage_modules':{}})
        return d

    def test_candidate_paths_adapt_but_reference_and_protection_remain(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);d=self.fixture(root);before=sha(d/'reference/top.v')
            seed=seed_reference_candidate(root,'d',root/'seed')
            self.assertEqual((seed/'files.f').read_text(),'rtl/top.v\n')
            self.assertEqual((d/'reference/files.f').read_text(),'reference/top.v\n')
            self.assertEqual(sha(seed/'top.v'),before);self.assertEqual(validate(d,seed)['changed_files'],[])
            (seed/'files.f').write_text('rtl/other.v\n')
            with self.assertRaisesRegex(ValueError,'Protected RTL file'):validate(d,seed)

    def test_mismatched_frozen_file_list_cannot_be_silently_repaired(self):
        with tempfile.TemporaryDirectory() as t:
            root=Path(t);self.fixture(root,'rtl/other.v\n')
            with self.assertRaisesRegex(ValueError,'frozen candidate contract'):seed_reference_candidate(root,'d',root/'seed')
