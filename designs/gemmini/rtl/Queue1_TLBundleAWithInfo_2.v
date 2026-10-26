module Queue1_TLBundleAWithInfo_2 (
	clock,
	reset,
	io_enq_valid,
	io_enq_bits_tl_a_opcode,
	io_enq_bits_tl_a_param,
	io_enq_bits_tl_a_size,
	io_enq_bits_tl_a_source,
	io_enq_bits_tl_a_address,
	io_enq_bits_tl_a_mask,
	io_enq_bits_tl_a_data,
	io_enq_bits_tl_a_corrupt,
	io_enq_bits_vaddr,
	io_enq_bits_status_debug,
	io_enq_bits_status_cease,
	io_enq_bits_status_wfi,
	io_enq_bits_status_isa,
	io_enq_bits_status_dprv,
	io_enq_bits_status_dv,
	io_enq_bits_status_prv,
	io_enq_bits_status_v,
	io_enq_bits_status_sd,
	io_enq_bits_status_zero2,
	io_enq_bits_status_mpv,
	io_enq_bits_status_gva,
	io_enq_bits_status_mbe,
	io_enq_bits_status_sbe,
	io_enq_bits_status_sxl,
	io_enq_bits_status_uxl,
	io_enq_bits_status_sd_rv32,
	io_enq_bits_status_zero1,
	io_enq_bits_status_tsr,
	io_enq_bits_status_tw,
	io_enq_bits_status_tvm,
	io_enq_bits_status_mxr,
	io_enq_bits_status_sum,
	io_enq_bits_status_mprv,
	io_enq_bits_status_xs,
	io_enq_bits_status_fs,
	io_enq_bits_status_mpp,
	io_enq_bits_status_vs,
	io_enq_bits_status_spp,
	io_enq_bits_status_mpie,
	io_enq_bits_status_ube,
	io_enq_bits_status_spie,
	io_enq_bits_status_upie,
	io_enq_bits_status_mie,
	io_enq_bits_status_hie,
	io_enq_bits_status_sie,
	io_enq_bits_status_uie,
	io_enq_bits_passthrough,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_tl_a_opcode,
	io_deq_bits_tl_a_param,
	io_deq_bits_tl_a_size,
	io_deq_bits_tl_a_source,
	io_deq_bits_tl_a_address,
	io_deq_bits_tl_a_mask,
	io_deq_bits_tl_a_data,
	io_deq_bits_tl_a_corrupt,
	io_deq_bits_vaddr,
	io_deq_bits_status_debug,
	io_deq_bits_status_cease,
	io_deq_bits_status_wfi,
	io_deq_bits_status_isa,
	io_deq_bits_status_dprv,
	io_deq_bits_status_dv,
	io_deq_bits_status_prv,
	io_deq_bits_status_v,
	io_deq_bits_status_sd,
	io_deq_bits_status_zero2,
	io_deq_bits_status_mpv,
	io_deq_bits_status_gva,
	io_deq_bits_status_mbe,
	io_deq_bits_status_sbe,
	io_deq_bits_status_sxl,
	io_deq_bits_status_uxl,
	io_deq_bits_status_sd_rv32,
	io_deq_bits_status_zero1,
	io_deq_bits_status_tsr,
	io_deq_bits_status_tw,
	io_deq_bits_status_tvm,
	io_deq_bits_status_mxr,
	io_deq_bits_status_sum,
	io_deq_bits_status_mprv,
	io_deq_bits_status_xs,
	io_deq_bits_status_fs,
	io_deq_bits_status_mpp,
	io_deq_bits_status_vs,
	io_deq_bits_status_spp,
	io_deq_bits_status_mpie,
	io_deq_bits_status_ube,
	io_deq_bits_status_spie,
	io_deq_bits_status_upie,
	io_deq_bits_status_mie,
	io_deq_bits_status_hie,
	io_deq_bits_status_sie,
	io_deq_bits_status_uie,
	io_deq_bits_passthrough
);
	input clock;
	input reset;
	input io_enq_valid;
	input [2:0] io_enq_bits_tl_a_opcode;
	input [2:0] io_enq_bits_tl_a_param;
	input [2:0] io_enq_bits_tl_a_size;
	input [3:0] io_enq_bits_tl_a_source;
	input [31:0] io_enq_bits_tl_a_address;
	input [15:0] io_enq_bits_tl_a_mask;
	input [127:0] io_enq_bits_tl_a_data;
	input io_enq_bits_tl_a_corrupt;
	input [38:0] io_enq_bits_vaddr;
	input io_enq_bits_status_debug;
	input io_enq_bits_status_cease;
	input io_enq_bits_status_wfi;
	input [31:0] io_enq_bits_status_isa;
	input [1:0] io_enq_bits_status_dprv;
	input io_enq_bits_status_dv;
	input [1:0] io_enq_bits_status_prv;
	input io_enq_bits_status_v;
	input io_enq_bits_status_sd;
	input [22:0] io_enq_bits_status_zero2;
	input io_enq_bits_status_mpv;
	input io_enq_bits_status_gva;
	input io_enq_bits_status_mbe;
	input io_enq_bits_status_sbe;
	input [1:0] io_enq_bits_status_sxl;
	input [1:0] io_enq_bits_status_uxl;
	input io_enq_bits_status_sd_rv32;
	input [7:0] io_enq_bits_status_zero1;
	input io_enq_bits_status_tsr;
	input io_enq_bits_status_tw;
	input io_enq_bits_status_tvm;
	input io_enq_bits_status_mxr;
	input io_enq_bits_status_sum;
	input io_enq_bits_status_mprv;
	input [1:0] io_enq_bits_status_xs;
	input [1:0] io_enq_bits_status_fs;
	input [1:0] io_enq_bits_status_mpp;
	input [1:0] io_enq_bits_status_vs;
	input io_enq_bits_status_spp;
	input io_enq_bits_status_mpie;
	input io_enq_bits_status_ube;
	input io_enq_bits_status_spie;
	input io_enq_bits_status_upie;
	input io_enq_bits_status_mie;
	input io_enq_bits_status_hie;
	input io_enq_bits_status_sie;
	input io_enq_bits_status_uie;
	input io_enq_bits_passthrough;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [2:0] io_deq_bits_tl_a_opcode;
	output wire [2:0] io_deq_bits_tl_a_param;
	output wire [2:0] io_deq_bits_tl_a_size;
	output wire [3:0] io_deq_bits_tl_a_source;
	output wire [31:0] io_deq_bits_tl_a_address;
	output wire [15:0] io_deq_bits_tl_a_mask;
	output wire [127:0] io_deq_bits_tl_a_data;
	output wire io_deq_bits_tl_a_corrupt;
	output wire [38:0] io_deq_bits_vaddr;
	output wire io_deq_bits_status_debug;
	output wire io_deq_bits_status_cease;
	output wire io_deq_bits_status_wfi;
	output wire [31:0] io_deq_bits_status_isa;
	output wire [1:0] io_deq_bits_status_dprv;
	output wire io_deq_bits_status_dv;
	output wire [1:0] io_deq_bits_status_prv;
	output wire io_deq_bits_status_v;
	output wire io_deq_bits_status_sd;
	output wire [22:0] io_deq_bits_status_zero2;
	output wire io_deq_bits_status_mpv;
	output wire io_deq_bits_status_gva;
	output wire io_deq_bits_status_mbe;
	output wire io_deq_bits_status_sbe;
	output wire [1:0] io_deq_bits_status_sxl;
	output wire [1:0] io_deq_bits_status_uxl;
	output wire io_deq_bits_status_sd_rv32;
	output wire [7:0] io_deq_bits_status_zero1;
	output wire io_deq_bits_status_tsr;
	output wire io_deq_bits_status_tw;
	output wire io_deq_bits_status_tvm;
	output wire io_deq_bits_status_mxr;
	output wire io_deq_bits_status_sum;
	output wire io_deq_bits_status_mprv;
	output wire [1:0] io_deq_bits_status_xs;
	output wire [1:0] io_deq_bits_status_fs;
	output wire [1:0] io_deq_bits_status_mpp;
	output wire [1:0] io_deq_bits_status_vs;
	output wire io_deq_bits_status_spp;
	output wire io_deq_bits_status_mpie;
	output wire io_deq_bits_status_ube;
	output wire io_deq_bits_status_spie;
	output wire io_deq_bits_status_upie;
	output wire io_deq_bits_status_mie;
	output wire io_deq_bits_status_hie;
	output wire io_deq_bits_status_sie;
	output wire io_deq_bits_status_uie;
	output wire io_deq_bits_passthrough;
	reg [334:0] ram;
	reg full;
	wire do_enq = ~full & io_enq_valid;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {io_enq_bits_passthrough, io_enq_bits_status_uie, io_enq_bits_status_sie, io_enq_bits_status_hie, io_enq_bits_status_mie, io_enq_bits_status_upie, io_enq_bits_status_spie, io_enq_bits_status_ube, io_enq_bits_status_mpie, io_enq_bits_status_spp, io_enq_bits_status_vs, io_enq_bits_status_mpp, io_enq_bits_status_fs, io_enq_bits_status_xs, io_enq_bits_status_mprv, io_enq_bits_status_sum, io_enq_bits_status_mxr, io_enq_bits_status_tvm, io_enq_bits_status_tw, io_enq_bits_status_tsr, io_enq_bits_status_zero1, io_enq_bits_status_sd_rv32, io_enq_bits_status_uxl, io_enq_bits_status_sxl, io_enq_bits_status_sbe, io_enq_bits_status_mbe, io_enq_bits_status_gva, io_enq_bits_status_mpv, io_enq_bits_status_zero2, io_enq_bits_status_sd, io_enq_bits_status_v, io_enq_bits_status_prv, io_enq_bits_status_dv, io_enq_bits_status_dprv, io_enq_bits_status_isa, io_enq_bits_status_wfi, io_enq_bits_status_cease, io_enq_bits_status_debug, io_enq_bits_vaddr, io_enq_bits_tl_a_corrupt, io_enq_bits_tl_a_data, io_enq_bits_tl_a_mask, io_enq_bits_tl_a_address, io_enq_bits_tl_a_source, io_enq_bits_tl_a_size, io_enq_bits_tl_a_param, io_enq_bits_tl_a_opcode};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == (io_deq_ready & full)))
			full <= do_enq;
	end
	assign io_deq_valid = full;
	assign io_deq_bits_tl_a_opcode = ram[2:0];
	assign io_deq_bits_tl_a_param = ram[5:3];
	assign io_deq_bits_tl_a_size = ram[8:6];
	assign io_deq_bits_tl_a_source = ram[12:9];
	assign io_deq_bits_tl_a_address = ram[44:13];
	assign io_deq_bits_tl_a_mask = ram[60:45];
	assign io_deq_bits_tl_a_data = ram[188:61];
	assign io_deq_bits_tl_a_corrupt = ram[189];
	assign io_deq_bits_vaddr = ram[228:190];
	assign io_deq_bits_status_debug = ram[229];
	assign io_deq_bits_status_cease = ram[230];
	assign io_deq_bits_status_wfi = ram[231];
	assign io_deq_bits_status_isa = ram[263:232];
	assign io_deq_bits_status_dprv = ram[265:264];
	assign io_deq_bits_status_dv = ram[266];
	assign io_deq_bits_status_prv = ram[268:267];
	assign io_deq_bits_status_v = ram[269];
	assign io_deq_bits_status_sd = ram[270];
	assign io_deq_bits_status_zero2 = ram[293:271];
	assign io_deq_bits_status_mpv = ram[294];
	assign io_deq_bits_status_gva = ram[295];
	assign io_deq_bits_status_mbe = ram[296];
	assign io_deq_bits_status_sbe = ram[297];
	assign io_deq_bits_status_sxl = ram[299:298];
	assign io_deq_bits_status_uxl = ram[301:300];
	assign io_deq_bits_status_sd_rv32 = ram[302];
	assign io_deq_bits_status_zero1 = ram[310:303];
	assign io_deq_bits_status_tsr = ram[311];
	assign io_deq_bits_status_tw = ram[312];
	assign io_deq_bits_status_tvm = ram[313];
	assign io_deq_bits_status_mxr = ram[314];
	assign io_deq_bits_status_sum = ram[315];
	assign io_deq_bits_status_mprv = ram[316];
	assign io_deq_bits_status_xs = ram[318:317];
	assign io_deq_bits_status_fs = ram[320:319];
	assign io_deq_bits_status_mpp = ram[322:321];
	assign io_deq_bits_status_vs = ram[324:323];
	assign io_deq_bits_status_spp = ram[325];
	assign io_deq_bits_status_mpie = ram[326];
	assign io_deq_bits_status_ube = ram[327];
	assign io_deq_bits_status_spie = ram[328];
	assign io_deq_bits_status_upie = ram[329];
	assign io_deq_bits_status_mie = ram[330];
	assign io_deq_bits_status_hie = ram[331];
	assign io_deq_bits_status_sie = ram[332];
	assign io_deq_bits_status_uie = ram[333];
	assign io_deq_bits_passthrough = ram[334];
endmodule
