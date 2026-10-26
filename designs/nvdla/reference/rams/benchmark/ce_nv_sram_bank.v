`timescale 1ns/1ps
// Evaluator-owned storage. This definition is the new baseline contract.
module ce_nv_sram_bank #(parameter WIDTH=32, DEPTH=256, AW=$clog2(DEPTH),
 PIPELINED=0, HAS_BYPASS=0)(input clk,input [AW-1:0] ra,wa,input re,we,ore,
 input [WIDTH-1:0] di,dbyp,input byp_sel,input [31:0] pwrbus_ram_pd,
 output [WIDTH-1:0] dout);
 localparam TILES=(WIDTH+31)/32;
 genvar lane_index;
 wire active=~(|pwrbus_ram_pd[8:0]);
 wire rd_en=active && re && (ra<DEPTH);
 wire wr_en=active && we && (wa<DEPTH);
 wire [WIDTH-1:0] raw;
 reg collision; reg [WIDTH-1:0] forwarded;
 // Same-address writes are forwarded independently of macro collision behavior.
 // When reads are disabled, both the macro result and forwarding tag hold.
 always @(posedge clk) if(rd_en) begin
   collision <= wr_en && (ra==wa); forwarded<=di;
 end
 generate if(DEPTH==80 && WIDTH==17) begin: exact80
   sram_1r1w_80x17 ram(.clk0(clk),.csb0(!wr_en),.addr0(wa),.din0(di),
     .clk1(clk),.csb1(!rd_en),.addr1(ra),.dout1(raw));
 end else begin: tiled
   wire [TILES*32-1:0] padded={{(TILES*32-WIDTH){1'b0}},di};
   wire [TILES*32-1:0] result;
   wire [7:0] waddr={{(8-AW){1'b0}},wa};
   wire [7:0] raddr={{(8-AW){1'b0}},ra};
   for(lane_index=0;lane_index<TILES;lane_index=lane_index+1) begin: lane
     sram_1r1w_256x32 ram(.clk0(clk),.csb0(!wr_en),.wmask0(4'b1111),
       .addr0(waddr),.din0(padded[lane_index*32 +:32]),.clk1(clk),.csb1(!rd_en),
       .addr1(raddr),.dout1(result[lane_index*32 +:32]));
   end
   assign raw=result[WIDTH-1:0];
 end endgenerate
 wire [WIDTH-1:0] committed_read=collision?forwarded:raw;
 reg pending;
 reg [WIDTH-1:0] held;
 // OpenRAM may invalidate its output even on a disabled read clock edge.
 // Capture the previous valid result before that edge and select it explicitly.
 always @(posedge clk) begin
   if(pending) held<=committed_read;
   pending<=rd_en;
 end
 wire [WIDTH-1:0] read_result=pending?committed_read:held;
 generate if(PIPELINED) begin: output_stage
   reg [WIDTH-1:0] q;
   always @(posedge clk) if(active && ore)
     q <= (HAS_BYPASS && byp_sel) ? dbyp : read_result;
   assign dout=q;
 end else begin: unregistered_output
   assign dout=read_result;
 end endgenerate
endmodule
