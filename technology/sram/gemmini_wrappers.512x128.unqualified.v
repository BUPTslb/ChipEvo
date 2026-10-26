// Evaluator-owned candidate mapping. NOT ENABLED until qualification.
// OpenRAM captures requests on rising edges and produces read data on falling
// edges. Validate at the consuming rising edge, including memory timing arcs.
`ifdef CHIP_EVO_MACRO_SIM
`define CE_RAM_PARAMS #(.DELAY(0), .T_HOLD(0), .VERBOSE(0))
`else
`define CE_RAM_PARAMS
`endif
module mem_4096x128(
 input [11:0] RW0_addr, input RW0_en, RW0_clk, RW0_wmode,
 input [127:0] RW0_wdata, output [127:0] RW0_rdata,
 input [15:0] RW0_wmask);
 reg [2:0] read_bank;
 reg read_valid;
 wire [127:0] data [0:7];
 always @(posedge RW0_clk) begin
   read_bank <= RW0_addr[11:9];
   read_valid <= RW0_en && !RW0_wmode;
 end
 genvar b;
 generate for (b=0; b<8; b=b+1) begin: banks
   sram_1rw_512x128 `CE_RAM_PARAMS ram (
     .clk0(RW0_clk), .csb0(!(RW0_en && RW0_addr[11:9] == b)),
     .web0(!RW0_wmode), .wmask0(RW0_wmask), .addr0(RW0_addr[8:0]),
     .din0(RW0_wdata), .dout0(data[b]));
 end endgenerate
 assign RW0_rdata = read_valid ? data[read_bank] : 128'bx;
endmodule
module mem_512x512(
 input [8:0] R0_addr, input R0_en, R0_clk, output [511:0] R0_data,
 input [8:0] W0_addr, input W0_en, W0_clk,
 input [511:0] W0_data, input [63:0] W0_mask);
 wire [511:0] read_data;
 reg read_valid;
 always @(posedge R0_clk) read_valid <= R0_en;
 genvar s;
 generate for (s=0; s<4; s=s+1) begin: slices
   sram_1r1w_512x128 `CE_RAM_PARAMS ram (
     .clk0(W0_clk), .csb0(!W0_en), .wmask0(W0_mask[s*16+:16]),
     .addr0(W0_addr), .din0(W0_data[s*128+:128]),
     .clk1(R0_clk), .csb1(!R0_en), .addr1(R0_addr),
     .dout1(read_data[s*128+:128]));
 end endgenerate
 assign R0_data = read_valid ? read_data : 512'bx;
endmodule
`undef CE_RAM_PARAMS
