// ChipEvo macro-reference-v1: intentionally replaces legacy RAM semantics.
`timescale 1ns/1ps
module nv_ram_rws_128x18 #(parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0)(input clk,
 input [6:0] ra,
 input re,
 output [17:0] dout,
 input [6:0] wa,
 input we,
 input [17:0] di,
 input [31:0] pwrbus_ram_pd);
ce_nv_sram_bank #(.WIDTH(18),.DEPTH(128),.AW(7),.PIPELINED(0),.HAS_BYPASS(0)) storage(
 .clk(clk),
 .ra(ra),
 .re(re),
 .dout(dout),
 .wa(wa),
 .we(we),
 .di(di),
 .pwrbus_ram_pd(pwrbus_ram_pd),
 .ore(1'b1),
 .byp_sel(1'b0),
 .dbyp({ 18{1'b0} }));
endmodule
