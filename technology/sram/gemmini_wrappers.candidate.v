// Evaluator-owned 256x32 macro mapping candidate, not yet admitted.
`ifdef CHIP_EVO_MACRO_SIM
`define CE_RAM_PARAMS #(.DELAY(0),.T_HOLD(0),.VERBOSE(0))
`else
`define CE_RAM_PARAMS
`endif
module mem_4096x128(input[11:0] RW0_addr,input RW0_en,RW0_clk,RW0_wmode,
 input[127:0] RW0_wdata,output[127:0] RW0_rdata,input[15:0] RW0_wmask);
 reg[3:0] read_bank;reg read_valid;wire[127:0] data[0:15];
 always @(posedge RW0_clk) begin read_bank<=RW0_addr[11:8];read_valid<=RW0_en&&!RW0_wmode;end
 genvar b,s;
 generate for(b=0;b<16;b=b+1)begin:banks
   for(s=0;s<4;s=s+1)begin:slices
     sram_1rw_256x32 `CE_RAM_PARAMS ram(.clk0(RW0_clk),
       .csb0(!(RW0_en&&RW0_addr[11:8]==b)),.web0(!RW0_wmode),
       .wmask0(RW0_wmask[s*4+:4]),.addr0(RW0_addr[7:0]),
       .din0(RW0_wdata[s*32+:32]),.dout0(data[b][s*32+:32]));
   end
 end endgenerate
 assign RW0_rdata=read_valid?data[read_bank]:128'bx;
endmodule
module mem_512x512(input[8:0] R0_addr,input R0_en,R0_clk,output[511:0] R0_data,
 input[8:0] W0_addr,input W0_en,W0_clk,input[511:0] W0_data,input[63:0] W0_mask);
 reg read_bank,read_valid;wire[511:0] data[0:1];
 always @(posedge R0_clk)begin read_bank<=R0_addr[8];read_valid<=R0_en;end
 genvar b,s;
 generate for(b=0;b<2;b=b+1)begin:banks
   for(s=0;s<16;s=s+1)begin:slices
     sram_1r1w_256x32 `CE_RAM_PARAMS ram(.clk0(W0_clk),
       .csb0(!(W0_en&&W0_addr[8]==b)),.wmask0(W0_mask[s*4+:4]),
       .addr0(W0_addr[7:0]),.din0(W0_data[s*32+:32]),.clk1(R0_clk),
       .csb1(!(R0_en&&R0_addr[8]==b)),.addr1(R0_addr[7:0]),
       .dout1(data[b][s*32+:32]));
   end
 end endgenerate
 assign R0_data=read_valid?data[read_bank]:512'bx;
endmodule
`undef CE_RAM_PARAMS
