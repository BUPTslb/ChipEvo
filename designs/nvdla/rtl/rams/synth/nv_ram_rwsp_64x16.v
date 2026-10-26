// ChipEvo macro-reference-v1: intentionally replaces legacy RAM semantics.
`timescale 1ns/1ps
module nv_ram_rwsp_64x16 #(parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0)(input clk,
 input [5:0] ra,
 input re,
 input ore,
 output [15:0] dout,
 input [5:0] wa,
 input we,
 input [15:0] di,
 input [31:0] pwrbus_ram_pd);
ce_nv_sram_bank #(.WIDTH(16),.DEPTH(64),.AW(6),.PIPELINED(1),.HAS_BYPASS(0)) storage(
 .clk(clk),
 .ra(ra),
 .re(re),
 .dout(dout),
 .wa(wa),
 .we(we),
 .di(di),
 .pwrbus_ram_pd(pwrbus_ram_pd),
 .ore(ore),
 .byp_sel(1'b0),
 .dbyp({ 16{1'b0} }));
endmodule
