// ChipEvo macro-reference-v1: intentionally replaces legacy RAM semantics.
`timescale 1ns/1ps
module nv_ram_rwsthp_60x42 #(parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0)(input clk,
 input [5:0] ra,
 input re,
 input ore,
 output [41:0] dout,
 input [5:0] wa,
 input we,
 input [41:0] di,
 input byp_sel,
 input [41:0] dbyp,
 input [31:0] pwrbus_ram_pd);
ce_nv_sram_bank #(.WIDTH(42),.DEPTH(60),.AW(6),.PIPELINED(1),.HAS_BYPASS(1)) storage(
 .clk(clk),
 .ra(ra),
 .re(re),
 .dout(dout),
 .wa(wa),
 .we(we),
 .di(di),
 .pwrbus_ram_pd(pwrbus_ram_pd),
 .ore(ore),
 .byp_sel(byp_sel),
 .dbyp(dbyp));
endmodule
