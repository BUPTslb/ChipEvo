// ChipEvo macro-reference-v1: intentionally replaces legacy RAM semantics.
`timescale 1ns/1ps
module nv_ram_rwsp_128x6 #(parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0)(input clk,
 input [6:0] ra,
 input re,
 input ore,
 output [5:0] dout,
 input [6:0] wa,
 input we,
 input [5:0] di,
 input [31:0] pwrbus_ram_pd);
ce_nv_sram_bank #(.WIDTH(6),.DEPTH(128),.AW(7),.PIPELINED(1),.HAS_BYPASS(0)) storage(
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
 .dbyp({ 6{1'b0} }));
endmodule
