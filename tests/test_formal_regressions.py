"""Explicit native proof regressions; normal maintenance discovery skips these."""
import os,tempfile,unittest
from pathlib import Path
from chipevo.eda.formal import prove
from chipevo.util import load,save

ROOT=Path(__file__).resolve().parents[1]
YOSYS=ROOT/'tools/runtime/linux-x86_64/bin/yosys'

@unittest.skipUnless(os.environ.get('CHIPEVO_NATIVE_FORMAL_TESTS')=='1' and YOSYS.exists(),
                     'Native formal tests require explicit CHIPEVO_NATIVE_FORMAL_TESTS=1')
class FormalRegressionTests(unittest.TestCase):
    def check_pair(self,gold,gate,expected):
        with tempfile.TemporaryDirectory(prefix='formal audit with spaces ') as tmp:
            root=Path(tmp);(root/'reference').mkdir();(root/'rtl').mkdir();(root/'build').mkdir()
            (root/'reference/m.v').write_text(gold);(root/'rtl/m.v').write_text(gate)
            save(root/'manifest.json',{'defines':[],'includes':[],'sources':['rtl/m.v'],'top':'m','params':{}})
            prove(root,str(YOSYS));r=load(root/'build/hierproof-v6/result.json')
            self.assertEqual(r['status'],expected)
    def test_commutative_operand_swap(self):
        gold='module m(input [3:0] a,b,output [3:0] y);assign y=a&b;endmodule'
        self.check_pair(gold,gold.replace('a&b','b&a'),'PASS')
    def test_registered_commutative_operand_swap(self):
        gold='module m(input clk,input [3:0] a,b,output reg [3:0] y);always @(posedge clk)y<=a&b;endmodule'
        self.check_pair(gold,gold.replace('a&b','b&a'),'PASS')
    def test_mux_reexpression(self):
        gold='module m(input s,input [3:0] a,b,output [3:0] y);assign y=s?a:b;endmodule'
        self.check_pair(gold,gold.replace('s?a:b','!s?b:a'),'PASS')
    def test_real_logic_error_rejected(self):
        gold='module m(input [3:0] a,b,output [3:0] y);assign y=a&b;endmodule'
        self.check_pair(gold,gold.replace('a&b','a^b'),'unproven')
    def test_preserved_carry_passes(self):
        gold='module m(input [3:0] a,b,output [4:0] y);assign y=a+b;endmodule'
        gate='module m(input [3:0] a,b,output [4:0] y);wire [4:0] v;assign v=a+b;assign y=v;endmodule'
        self.check_pair(gold,gate,'PASS')
    def test_dropped_carry_rejected(self):
        gold='module m(input [3:0] a,b,output [4:0] y);assign y=a+b;endmodule'
        gate='module m(input [3:0] a,b,output [4:0] y);wire [3:0] v;assign v=a+b;assign y=v;endmodule'
        self.check_pair(gold,gate,'unproven')
    def test_identical_initialized_state_passes(self):
        gold='module m(input clk,rst,en,a,output reg y);initial y=0;always @(posedge clk)if(rst)y<=0;else if(en)y<=a;endmodule'
        self.check_pair(gold,gold,'PASS')
    def test_changed_initial_state_rejected(self):
        gold='module m(input clk,rst,en,a,output reg y);initial y=0;always @(posedge clk)if(rst)y<=0;else if(en)y<=a;endmodule'
        self.check_pair(gold,gold.replace('initial y=0','initial y=1'),'initial_state_mismatch')
    def test_removed_initial_state_rejected(self):
        gold='module m(input clk,a,output reg y);initial y=0;always @(posedge clk)y<=a;endmodule'
        self.check_pair(gold,gold.replace('initial y=0;',''),'initial_state_mismatch')
    def test_changed_reset_rejected(self):
        gold='module m(input clk,rst,en,a,output reg y);always @(posedge clk)if(rst)y<=0;else if(en)y<=a;endmodule'
        self.check_pair(gold,gold.replace('if(rst)y<=0','if(rst)y<=1'),'unproven')
    def test_removed_enable_rejected(self):
        gold='module m(input clk,rst,en,a,output reg y);always @(posedge clk)if(rst)y<=0;else if(en)y<=a;endmodule'
        self.check_pair(gold,gold.replace('else if(en)','else '),'unproven')
    def test_changed_clock_edge_rejected(self):
        gold='module m(input clk,a,output reg y);always @(posedge clk)y<=a;endmodule'
        self.check_pair(gold,gold.replace('posedge','negedge'),'unproven')
    def test_hierarchical_child_rewrite_passes(self):
        gold='module child(input a,b,output y);assign y=a&b;endmodule module m(input a,b,output y);child u(a,b,y);endmodule'
        self.check_pair(gold,gold.replace('a&b','b&a'),'PASS')
    def test_wrong_child_is_not_hidden_by_composition(self):
        gold='module child(input a,b,output y);assign y=a&b;endmodule module m(input a,b,output y);child u(a,b,y);endmodule'
        self.check_pair(gold,gold.replace('a&b','a^b'),'unproven')
    def test_identical_memory_contract_passes(self):
        gold='module m(input clk,we,input [1:0] a,input [3:0] d,output reg [3:0] q);reg [3:0] mem[0:3];always @(posedge clk)begin if(we)mem[a]<=d;q<=mem[a];end endmodule'
        self.check_pair(gold,gold,'PASS')
    def test_memory_address_change_is_rejected(self):
        gold='module m(input clk,we,input [1:0] a,input [3:0] d,output reg [3:0] q);reg [3:0] mem[0:3];always @(posedge clk)begin if(we)mem[a]<=d;q<=mem[a];end endmodule'
        self.check_pair(gold,gold.replace('q<=mem[a]','q<=mem[a^2\'b01]'),'unproven')

if __name__=='__main__':unittest.main()
