from pathlib import Path
import tempfile,unittest,os
from unittest.mock import patch
from chipevo.eda.synthesis import synthesize,recipe
from chipevo.util import save

class SynthesisInvocationTests(unittest.TestCase):
    def test_abc_pass_uses_literal_safe_names_and_trusted_path(self):
        with tempfile.TemporaryDirectory(prefix='path with spaces ') as tmp:
            root=Path(tmp);work=root/'work';(work/'constraints').mkdir(parents=True)
            (root/'technology').mkdir();(root/'technology/NangateOpenCellLibrary_typical.lib').write_text('fixture')
            (work/'constraints/abc.constr').write_text('fixture')
            save(work/'manifest.json',{'top':'m','sources':[],'defines':[],'includes':['rtl/include'],'params':{}})
            tools={'yosys':str(root/'trusted/bin/yosys'),'abc':str(root/'trusted/bin/abc')}
            with patch('chipevo.eda.synthesis.checked') as checked,patch('chipevo.eda.synthesis.measure_area',return_value={}):
                synthesize(root,work,tools,'timing',10)
            text=(work/'build/synthesis.ys').read_text()
            self.assertIn('abc -exe abc -liberty build/mapping.lib',text)
            self.assertNotIn('abc -exe "',text)
            self.assertIn('-script "+strash;',text);self.assertNotIn('-script build/abc.script',text)
            self.assertIn('-Irtl/include',text);self.assertNotIn('-I"',text)
            self.assertTrue(checked.call_args.args[4]['PATH'].startswith(str(root/'trusted/bin')+os.pathsep))

    def test_timing_recipe_has_target_area_recipe_does_not(self):
        self.assertIn('-D 10000',recipe('timing',10))
        self.assertNotIn('-D ',recipe('area',10))

if __name__=='__main__':unittest.main()
