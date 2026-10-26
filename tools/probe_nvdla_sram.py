"""Explicit NVDLA/OpenRAM compatibility experiment; never enables scoring mapping."""
from pathlib import Path
import argparse,sys,shutil,json,os,re
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from chipevo.util import save,sha,execute
from chipevo.toolchain import resolve
from chipevo.eda.synthesis import synthesize
from chipevo.eda.sta import analyze

def main():
    p=argparse.ArgumentParser();p.add_argument('--run-eda',action='store_true');p.add_argument('--output',default='artifacts/nvdla-sram-compatibility-20261024');a=p.parse_args()
    if not a.run_eda:p.error('Explicit --run-eda required')
    root=Path(__file__).resolve().parents[1];out=root/a.output
    out.mkdir(exist_ok=False);src=root/'designs/nvdla/rtl/rams/model/RAMPDP_80X17_GL_M2_D2.v'
    macro=root/'technology/sram/macros/sram_1r1w_256x32/sram_1r1w_256x32.v'
    source=src.read_text();name='RAM_BANK_RAMPDP_80X17_GL_M2_D2'
    # Extract complete synthesizable bank and its storage leaf; no change to oracle.
    bank=source[source.index('module '+name):source.index('endmodule',source.index('module '+name))+len('endmodule')]
    leaf=source[source.index('module RAMPDP_80X17_GL_M2_D2_ram'):source.index('endmodule',source.index('module RAMPDP_80X17_GL_M2_D2_ram'))+len('endmodule')]
    (out/'reference.v').write_text(bank+'\n'+leaf+'\n')
    wrapper='''module candidate(input WE,CLK,IDDQ,RE,input[7:0] SVOP,input[16:0] WD,
input[7:0] RA,WA,output[16:0] RD,input[7:0] SLEEP_EN,input RET_EN,clobber_array,clobber_flops);
wire[31:0] q;
`ifdef CE_SIM
sram_1r1w_256x32 #(.DELAY(0),.T_HOLD(0),.VERBOSE(0)) ram(
`else
sram_1r1w_256x32 ram(
`endif
.clk0(CLK),.csb0(!(WE&&!IDDQ&&!RET_EN&&!clobber_flops)),.wmask0(4'b1111),.addr0(WA),.din0({15'b0,WD}),
.clk1(CLK),.csb1(!(RE&&!IDDQ&&!RET_EN&&!clobber_flops)),.addr1(RA),.dout1(q));
assign RD=q[16:0];
endmodule
'''
    (out/'candidate.v').write_text(wrapper)
    tb='''module tb;
reg CLK=0,WE=0,RE=0;reg[7:0] RA=0,WA=0;reg[16:0] WD=0;
wire[16:0] gold,gate;integer i,high_mismatch=0,low_mismatch=0,comparisons=0;
RAM_BANK_RAMPDP_80X17_GL_M2_D2 a(.WE(WE),.CLK(CLK),.IDDQ(1'b0),.RE(RE),.SVOP(8'b0),.WD(WD),.RA(RA),.WA(WA),.RD(gold),.SLEEP_EN(8'b0),.RET_EN(1'b0),.clobber_array(1'b0),.clobber_flops(1'b0));
candidate b(.WE(WE),.CLK(CLK),.IDDQ(1'b0),.RE(RE),.SVOP(8'b0),.WD(WD),.RA(RA),.WA(WA),.RD(gate),.SLEEP_EN(8'b0),.RET_EN(1'b0),.clobber_array(1'b0),.clobber_flops(1'b0));
initial begin
// Initialize every legal word through ordinary writes; no hierarchical force.
for(i=0;i<80;i=i+1)begin WE=1;WA=i;WD=17'h10000+i;#5;CLK=1;#5;CLK=0;#5;end
WE=0;
for(i=0;i<160;i=i+1)begin
 RE=1;RA=i%80;#5;CLK=1;#1;
 comparisons=comparisons+1;
 if(gold!==gate)begin high_mismatch=high_mismatch+1;if(high_mismatch<4)$display("HIGH_MISMATCH addr=%0d gold=%h gate=%h",RA,gold,gate);end
 #4;CLK=0;#1;
 if(gold!==gate)begin low_mismatch=low_mismatch+1;if(low_mismatch<4)$display("LOW_MISMATCH addr=%0d gold=%h gate=%h",RA,gold,gate);end
 #4;
end
$display("RESULT comparisons=%0d high_mismatch=%0d low_mismatch=%0d",comparisons,high_mismatch,low_mismatch);$finish;
end
endmodule
'''
    (out/'tb.v').write_text(tb)
    result={'status':'running','admitted':False,'scope':'80x17 bank compatibility, not full NVDLA qualification',
            'reference_sha256':sha(src),'macro_model_sha256':sha(macro),
            'tool':'Existing OpenRAM v1.2.49 FreePDK45/ngspice-characterized 256x32 1R1W, padding unused words/bits',
            'storage_capacity_contract':'80 legal words x17 bits; padding inaccessible under legal-address probe',
            'normal_mode_only':True,'power_modes_proven':False}
    save(out/'report.json',result)
    extracted=root/'artifacts/nvdla-sram-tools-20261024/extracted/usr'
    sim=extracted/'bin/iverilog' if (extracted/'bin/iverilog').exists() else next(iter(Path('/home/shen/miniconda3').glob('**/bin/iverilog')),None)
    env=dict(os.environ)
    if sim:
        env['PATH']=str(sim.parent)+os.pathsep+env.get('PATH','')
        base=['-B',str(extracted/'lib/x86_64-linux-gnu/ivl')] if str(sim).startswith(str(extracted)) else []
        compile=execute([sim,*base,'-g2012','-DSYNTHESIS','-DCE_SIM','-s','tb','-o',out/'sim',out/'reference.v',out/'candidate.v',macro,out/'tb.v'],out,out/'compile.log',120,env)
        result['compile']=compile
        if compile['exit_code']==0:
            vpi=['-M',str(extracted/'lib/x86_64-linux-gnu/ivl')] if base else []
            result['simulation']=execute([sim.parent/'vvp',*vpi,out/'sim'],out,out/'simulation.log',120,env)
            text=(out/'simulation.log').read_text();match=re.search(r'RESULT comparisons=(\d+) high_mismatch=(\d+) low_mismatch=(\d+)',text)
            if match:result['functional_probe']=dict(zip(['comparisons','high_phase_mismatch','low_phase_mismatch'],map(int,match.groups())))
    else:result['simulation_error']='Icarus not installed'
    tools=resolve(root)
    lib='technology/sram/macros/sram_1r1w_256x32/sram_1r1w_256x32_TT_1p1V_25C.lib'
    libtext=(root/lib).read_text();area=float(re.search(r'\barea\s*:\s*([\d.eE+-]+)',libtext)[1])
    profile={'wrapper':str(out/'candidate.v'),'replace_sources':['rtl/reference.v'],'liberties':[lib],
             'asset_sha256':{},'macro_areas':{'sram_1r1w_256x32':area}}
    save(out/'mapping.json',profile)
    for label in ['reference','candidate']:
        work=out/label;(work/'rtl').mkdir(parents=True);(work/'build').mkdir();(work/'constraints').mkdir()
        shutil.copy2(out/'reference.v',work/'rtl/reference.v')
        sdc='create_clock -name CLK -period 5 [get_ports CLK]\nset_clock_uncertainty 0.1 [get_clocks CLK]\nset_input_delay -max 1 -clock CLK [get_ports {WE IDDQ RE SVOP* WD* RA* WA* SLEEP_EN* RET_EN clobber_array clobber_flops}]\nset_output_delay -max 1 -clock CLK [all_outputs]\nset_load 10 [all_outputs]\n'
        (work/'constraints/benchmark.sdc').write_text(sdc)
        shutil.copy2(root/'designs/nvdla/constraints/abc.constr',work/'constraints/abc.constr')
        m={'sources':['rtl/reference.v'],'includes':[],'defines':['SYNTHESIS'],'params':{},'top':name if label=='reference' else 'candidate'}
        if label=='candidate':m['sram_mapping']=str(out/'mapping.json')
        save(work/'manifest.json',m)
        try:
            result[label+'_area']=synthesize(root,work,tools,'area',5,600)
            result[label+'_metrics']=analyze(root,work,tools,5,120)
        except Exception as e:result[label+'_error']=str(e)
        save(out/'report.json',result)
    result['status']='completed';result['admitted']=False
    result['conclusion']='Preview only: admission requires phase/enable/collision/power semantics equivalence, not merely lower area or slack.'
    save(out/'report.json',result);print(json.dumps(result,indent=2))

if __name__=='__main__':main()
