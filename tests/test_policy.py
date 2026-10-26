from pathlib import Path
import tempfile,unittest
from chipevo.policy import validate,module_segments
from chipevo.util import sha,save,load

class PolicyTests(unittest.TestCase):
    def setUp(self):
        self.tmp=tempfile.TemporaryDirectory();self.root=Path(self.tmp.name);self.d=self.root/'design';self.c=self.root/'candidate';(self.d/'reference').mkdir(parents=True);self.c.mkdir()
        self.text='module ram(input a,output b); assign b=a; endmodule\nmodule alu(input a,output b);assign b=a;endmodule\n'
        for p in [self.d/'reference/m.v',self.c/'m.v']:p.write_text(self.text)
        save(self.d/'policy.json',{'version':2,'file_sha256':{'m.v':sha(self.c/'m.v')},'editable_files':['m.v'],'protected_modules':{'m.v':['ram']}})
    def tearDown(self):self.tmp.cleanup()
    def test_protected_storage_in_shared_file(self):
        (self.c/'m.v').write_text(self.text.replace('assign b=a','assign b=~a',1))
        with self.assertRaisesRegex(ValueError,'Protected module'):validate(self.d,self.c)
    def test_mutable_module_in_same_file(self):
        (self.c/'m.v').write_text(self.text.replace('assign b=a;endmodule','assign b=~a;endmodule'))
        self.assertEqual(validate(self.d,self.c)['changed_files'],['m.v'])
    def test_new_file_and_module_rejected(self):
        (self.c/'x.v').write_text('module x;endmodule')
        with self.assertRaises(ValueError):validate(self.d,self.c)
    def test_comments_do_not_create_modules(self):
        self.assertEqual(set(module_segments('// module fake\n'+self.text)),{'ram','alu'})
    def test_global_define_cannot_change_protected_interpretation(self):
        (self.c/'m.v').write_text('`define ALTER_MEMORY\n'+self.text)
        with self.assertRaisesRegex(ValueError,'outside module'):validate(self.d,self.c)
    def test_optional_budget_only_when_explicit(self):
        (self.c/'m.v').write_text(self.text.replace('assign b=a;endmodule','assign b=~a;endmodule'))
        p=load(self.d/'policy.json');p['max_changed_files']=0;save(self.d/'policy.json',p)
        with self.assertRaisesRegex(ValueError,'file budget'):validate(self.d,self.c)
        p['max_changed_files']=None;p['max_changed_lines']=1;save(self.d/'policy.json',p)
        with self.assertRaisesRegex(ValueError,'line budget'):validate(self.d,self.c)

if __name__=='__main__':unittest.main()
