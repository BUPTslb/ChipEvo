"""Opt-in native STA tests on a one-flop synthetic design, without synthesis."""
import os,tempfile,unittest
from pathlib import Path
from chipevo.eda.sta import analyze
from chipevo.util import save

ROOT=Path(__file__).resolve().parents[1]
STA=ROOT/'tools/runtime/linux-x86_64/bin/sta'

@unittest.skipUnless(os.environ.get('CHIPEVO_NATIVE_STA_TESTS')=='1' and STA.exists(),
                     'Native STA tests require explicit CHIPEVO_NATIVE_STA_TESTS=1')
class STARegressionTests(unittest.TestCase):
    def check_case(self,complete):
        with tempfile.TemporaryDirectory(prefix='audit sta ') as t:
            work=Path(t);b=work/'build';b.mkdir();(work/'constraints').mkdir()
            (b/'mapped.v').write_text('module m(input clk,a,output y); DFF_X1 ff(.D(a),.CK(clk),.Q(y),.QN()); endmodule\n')
            save(work/'manifest.json',{'top':'m'})
            save(b/'area.json',{'total_area_um2':1.,'standard_cell_area_um2':1.,'fixed_sram_macro_area_um2':0.,'macro_instances':{}})
            sdc='create_clock -name clk -period 5 [get_ports clk]\n'
            if complete:sdc+='set_input_delay -max 1 -clock clk [get_ports a]\nset_input_delay -min .1 -clock clk [get_ports a]\nset_output_delay -max 1 -clock clk [get_ports y]\nset_output_delay -min .1 -clock clk [get_ports y]\n'
            (work/'constraints/benchmark.sdc').write_text(sdc)
            def measure():
                try:return analyze(ROOT,work,{'sta':str(STA)},5.,20)
                except RuntimeError as exc:raise RuntimeError(str(exc)+'\n'+(b/'sta.log').read_text()) from exc
            if complete:
                result=measure()
                self.assertTrue(result['constraint_coverage']['passed']);self.assertGreater(result['effective_delay_ns'],0)
                self.assertEqual((b/'constraint-coverage.txt').read_text(),'')
            else:
                with self.assertRaisesRegex(ValueError,'constraint coverage'):measure()
                self.assertIn('unconstrained endpoints',(b/'constraint-coverage.txt').read_text())
    def test_complete_constraints_pass(self):self.check_case(True)
    def test_unconstrained_endpoints_fail_even_when_process_exits_zero(self):self.check_case(False)

if __name__=='__main__':unittest.main()
