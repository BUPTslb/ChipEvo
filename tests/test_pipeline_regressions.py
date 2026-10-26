"""Opt-in synthetic native synthesis/STA integration. No model or real design."""
import os,tempfile,unittest
from pathlib import Path
from chipevo.eda.synthesis import synthesize
from chipevo.eda.sta import analyze
from chipevo.toolchain import resolve
from chipevo.util import save

ROOT=Path(__file__).resolve().parents[1]

@unittest.skipUnless(os.environ.get('CHIPEVO_NATIVE_PIPELINE_TESTS')=='1',
                     'Native pipeline tests require explicit CHIPEVO_NATIVE_PIPELINE_TESTS=1')
class PipelineRegressionTests(unittest.TestCase):
    def test_both_objectives_map_and_time_with_the_pinned_tools(self):
        tools=resolve(ROOT)
        with tempfile.TemporaryDirectory(prefix='pipeline audit spaces ') as t:
            for objective in ['timing','area']:
                work=Path(t)/objective;(work/'rtl').mkdir(parents=True);(work/'constraints').mkdir()
                (work/'rtl/m.v').write_text('module m(input clk,input [3:0] a,b,output reg [3:0] y);always @(posedge clk)y<=a^b;endmodule')
                save(work/'manifest.json',{'top':'m','sources':['rtl/m.v'],'defines':[],'includes':[],'params':{}})
                (work/'constraints/abc.constr').write_text('set_driving_cell BUF_X1\nset_load 5\n')
                (work/'constraints/benchmark.sdc').write_text('create_clock -name clk -period 5 [get_ports clk]\nset_input_delay -max 1 -clock clk [get_ports {a* b*}]\nset_input_delay -min .1 -clock clk [get_ports {a* b*}]\nset_output_delay -max 1 -clock clk [get_ports y*]\nset_output_delay -min .1 -clock clk [get_ports y*]\n')
                try:area=synthesize(ROOT,work,tools,objective,5.,30)
                except RuntimeError as exc:raise RuntimeError(str(exc)+'\n'+(work/'build/synthesis.log').read_text()[-7000:]) from exc
                metrics=analyze(ROOT,work,tools,5.,30)
                self.assertGreater(area['total_area_um2'],0);self.assertGreater(metrics['effective_delay_ns'],0)
                self.assertTrue(metrics['constraint_coverage']['passed'])
                self.assertEqual(metrics['macro_instances'],{})

if __name__=='__main__':unittest.main()
