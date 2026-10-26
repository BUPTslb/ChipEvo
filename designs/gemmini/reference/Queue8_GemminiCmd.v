module Queue8_GemminiCmd (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_cmd_inst_funct,
	io_enq_bits_cmd_inst_rs2,
	io_enq_bits_cmd_inst_rs1,
	io_enq_bits_cmd_inst_xd,
	io_enq_bits_cmd_inst_xs1,
	io_enq_bits_cmd_inst_xs2,
	io_enq_bits_cmd_inst_rd,
	io_enq_bits_cmd_inst_opcode,
	io_enq_bits_cmd_rs1,
	io_enq_bits_cmd_rs2,
	io_enq_bits_cmd_status_debug,
	io_enq_bits_cmd_status_cease,
	io_enq_bits_cmd_status_wfi,
	io_enq_bits_cmd_status_isa,
	io_enq_bits_cmd_status_dprv,
	io_enq_bits_cmd_status_dv,
	io_enq_bits_cmd_status_prv,
	io_enq_bits_cmd_status_v,
	io_enq_bits_cmd_status_sd,
	io_enq_bits_cmd_status_zero2,
	io_enq_bits_cmd_status_mpv,
	io_enq_bits_cmd_status_gva,
	io_enq_bits_cmd_status_mbe,
	io_enq_bits_cmd_status_sbe,
	io_enq_bits_cmd_status_sxl,
	io_enq_bits_cmd_status_uxl,
	io_enq_bits_cmd_status_sd_rv32,
	io_enq_bits_cmd_status_zero1,
	io_enq_bits_cmd_status_tsr,
	io_enq_bits_cmd_status_tw,
	io_enq_bits_cmd_status_tvm,
	io_enq_bits_cmd_status_mxr,
	io_enq_bits_cmd_status_sum,
	io_enq_bits_cmd_status_mprv,
	io_enq_bits_cmd_status_xs,
	io_enq_bits_cmd_status_fs,
	io_enq_bits_cmd_status_mpp,
	io_enq_bits_cmd_status_vs,
	io_enq_bits_cmd_status_spp,
	io_enq_bits_cmd_status_mpie,
	io_enq_bits_cmd_status_ube,
	io_enq_bits_cmd_status_spie,
	io_enq_bits_cmd_status_upie,
	io_enq_bits_cmd_status_mie,
	io_enq_bits_cmd_status_hie,
	io_enq_bits_cmd_status_sie,
	io_enq_bits_cmd_status_uie,
	io_enq_bits_rob_id_bits,
	io_enq_bits_from_matmul_fsm,
	io_enq_bits_from_conv_fsm,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_cmd_inst_funct,
	io_deq_bits_cmd_rs1,
	io_deq_bits_cmd_rs2,
	io_deq_bits_cmd_status_debug,
	io_deq_bits_cmd_status_cease,
	io_deq_bits_cmd_status_wfi,
	io_deq_bits_cmd_status_isa,
	io_deq_bits_cmd_status_dprv,
	io_deq_bits_cmd_status_dv,
	io_deq_bits_cmd_status_prv,
	io_deq_bits_cmd_status_v,
	io_deq_bits_cmd_status_sd,
	io_deq_bits_cmd_status_zero2,
	io_deq_bits_cmd_status_mpv,
	io_deq_bits_cmd_status_gva,
	io_deq_bits_cmd_status_mbe,
	io_deq_bits_cmd_status_sbe,
	io_deq_bits_cmd_status_sxl,
	io_deq_bits_cmd_status_uxl,
	io_deq_bits_cmd_status_sd_rv32,
	io_deq_bits_cmd_status_zero1,
	io_deq_bits_cmd_status_tsr,
	io_deq_bits_cmd_status_tw,
	io_deq_bits_cmd_status_tvm,
	io_deq_bits_cmd_status_mxr,
	io_deq_bits_cmd_status_sum,
	io_deq_bits_cmd_status_mprv,
	io_deq_bits_cmd_status_xs,
	io_deq_bits_cmd_status_fs,
	io_deq_bits_cmd_status_mpp,
	io_deq_bits_cmd_status_vs,
	io_deq_bits_cmd_status_spp,
	io_deq_bits_cmd_status_mpie,
	io_deq_bits_cmd_status_ube,
	io_deq_bits_cmd_status_spie,
	io_deq_bits_cmd_status_upie,
	io_deq_bits_cmd_status_mie,
	io_deq_bits_cmd_status_hie,
	io_deq_bits_cmd_status_sie,
	io_deq_bits_cmd_status_uie,
	io_deq_bits_rob_id_bits
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [6:0] io_enq_bits_cmd_inst_funct;
	input [4:0] io_enq_bits_cmd_inst_rs2;
	input [4:0] io_enq_bits_cmd_inst_rs1;
	input io_enq_bits_cmd_inst_xd;
	input io_enq_bits_cmd_inst_xs1;
	input io_enq_bits_cmd_inst_xs2;
	input [4:0] io_enq_bits_cmd_inst_rd;
	input [6:0] io_enq_bits_cmd_inst_opcode;
	input [63:0] io_enq_bits_cmd_rs1;
	input [63:0] io_enq_bits_cmd_rs2;
	input io_enq_bits_cmd_status_debug;
	input io_enq_bits_cmd_status_cease;
	input io_enq_bits_cmd_status_wfi;
	input [31:0] io_enq_bits_cmd_status_isa;
	input [1:0] io_enq_bits_cmd_status_dprv;
	input io_enq_bits_cmd_status_dv;
	input [1:0] io_enq_bits_cmd_status_prv;
	input io_enq_bits_cmd_status_v;
	input io_enq_bits_cmd_status_sd;
	input [22:0] io_enq_bits_cmd_status_zero2;
	input io_enq_bits_cmd_status_mpv;
	input io_enq_bits_cmd_status_gva;
	input io_enq_bits_cmd_status_mbe;
	input io_enq_bits_cmd_status_sbe;
	input [1:0] io_enq_bits_cmd_status_sxl;
	input [1:0] io_enq_bits_cmd_status_uxl;
	input io_enq_bits_cmd_status_sd_rv32;
	input [7:0] io_enq_bits_cmd_status_zero1;
	input io_enq_bits_cmd_status_tsr;
	input io_enq_bits_cmd_status_tw;
	input io_enq_bits_cmd_status_tvm;
	input io_enq_bits_cmd_status_mxr;
	input io_enq_bits_cmd_status_sum;
	input io_enq_bits_cmd_status_mprv;
	input [1:0] io_enq_bits_cmd_status_xs;
	input [1:0] io_enq_bits_cmd_status_fs;
	input [1:0] io_enq_bits_cmd_status_mpp;
	input [1:0] io_enq_bits_cmd_status_vs;
	input io_enq_bits_cmd_status_spp;
	input io_enq_bits_cmd_status_mpie;
	input io_enq_bits_cmd_status_ube;
	input io_enq_bits_cmd_status_spie;
	input io_enq_bits_cmd_status_upie;
	input io_enq_bits_cmd_status_mie;
	input io_enq_bits_cmd_status_hie;
	input io_enq_bits_cmd_status_sie;
	input io_enq_bits_cmd_status_uie;
	input [5:0] io_enq_bits_rob_id_bits;
	input io_enq_bits_from_matmul_fsm;
	input io_enq_bits_from_conv_fsm;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [6:0] io_deq_bits_cmd_inst_funct;
	output wire [63:0] io_deq_bits_cmd_rs1;
	output wire [63:0] io_deq_bits_cmd_rs2;
	output wire io_deq_bits_cmd_status_debug;
	output wire io_deq_bits_cmd_status_cease;
	output wire io_deq_bits_cmd_status_wfi;
	output wire [31:0] io_deq_bits_cmd_status_isa;
	output wire [1:0] io_deq_bits_cmd_status_dprv;
	output wire io_deq_bits_cmd_status_dv;
	output wire [1:0] io_deq_bits_cmd_status_prv;
	output wire io_deq_bits_cmd_status_v;
	output wire io_deq_bits_cmd_status_sd;
	output wire [22:0] io_deq_bits_cmd_status_zero2;
	output wire io_deq_bits_cmd_status_mpv;
	output wire io_deq_bits_cmd_status_gva;
	output wire io_deq_bits_cmd_status_mbe;
	output wire io_deq_bits_cmd_status_sbe;
	output wire [1:0] io_deq_bits_cmd_status_sxl;
	output wire [1:0] io_deq_bits_cmd_status_uxl;
	output wire io_deq_bits_cmd_status_sd_rv32;
	output wire [7:0] io_deq_bits_cmd_status_zero1;
	output wire io_deq_bits_cmd_status_tsr;
	output wire io_deq_bits_cmd_status_tw;
	output wire io_deq_bits_cmd_status_tvm;
	output wire io_deq_bits_cmd_status_mxr;
	output wire io_deq_bits_cmd_status_sum;
	output wire io_deq_bits_cmd_status_mprv;
	output wire [1:0] io_deq_bits_cmd_status_xs;
	output wire [1:0] io_deq_bits_cmd_status_fs;
	output wire [1:0] io_deq_bits_cmd_status_mpp;
	output wire [1:0] io_deq_bits_cmd_status_vs;
	output wire io_deq_bits_cmd_status_spp;
	output wire io_deq_bits_cmd_status_mpie;
	output wire io_deq_bits_cmd_status_ube;
	output wire io_deq_bits_cmd_status_spie;
	output wire io_deq_bits_cmd_status_upie;
	output wire io_deq_bits_cmd_status_mie;
	output wire io_deq_bits_cmd_status_hie;
	output wire io_deq_bits_cmd_status_sie;
	output wire io_deq_bits_cmd_status_uie;
	output wire [5:0] io_deq_bits_rob_id_bits;
	wire [245:0] _ram_ext_R0_data;
	reg [2:0] enq_ptr_value;
	reg [2:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = ~full & io_enq_valid;
	wire do_deq = io_deq_ready & ~empty;
	always @(posedge clock)
		if (reset) begin
			enq_ptr_value <= 3'h0;
			deq_ptr_value <= 3'h0;
			maybe_full <= 1'h0;
		end
		else begin
			if (do_enq)
				enq_ptr_value <= enq_ptr_value + 3'h1;
			if (do_deq)
				deq_ptr_value <= deq_ptr_value + 3'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_8x246 ram_ext(
		.R0_addr(deq_ptr_value),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(enq_ptr_value),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_rob_id_bits, io_enq_bits_cmd_status_uie, io_enq_bits_cmd_status_sie, io_enq_bits_cmd_status_hie, io_enq_bits_cmd_status_mie, io_enq_bits_cmd_status_upie, io_enq_bits_cmd_status_spie, io_enq_bits_cmd_status_ube, io_enq_bits_cmd_status_mpie, io_enq_bits_cmd_status_spp, io_enq_bits_cmd_status_vs, io_enq_bits_cmd_status_mpp, io_enq_bits_cmd_status_fs, io_enq_bits_cmd_status_xs, io_enq_bits_cmd_status_mprv, io_enq_bits_cmd_status_sum, io_enq_bits_cmd_status_mxr, io_enq_bits_cmd_status_tvm, io_enq_bits_cmd_status_tw, io_enq_bits_cmd_status_tsr, io_enq_bits_cmd_status_zero1, io_enq_bits_cmd_status_sd_rv32, io_enq_bits_cmd_status_uxl, io_enq_bits_cmd_status_sxl, io_enq_bits_cmd_status_sbe, io_enq_bits_cmd_status_mbe, io_enq_bits_cmd_status_gva, io_enq_bits_cmd_status_mpv, io_enq_bits_cmd_status_zero2, io_enq_bits_cmd_status_sd, io_enq_bits_cmd_status_v, io_enq_bits_cmd_status_prv, io_enq_bits_cmd_status_dv, io_enq_bits_cmd_status_dprv, io_enq_bits_cmd_status_isa, io_enq_bits_cmd_status_wfi, io_enq_bits_cmd_status_cease, io_enq_bits_cmd_status_debug, io_enq_bits_cmd_rs2, io_enq_bits_cmd_rs1, io_enq_bits_cmd_inst_funct})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_cmd_inst_funct = _ram_ext_R0_data[6:0];
	assign io_deq_bits_cmd_rs1 = _ram_ext_R0_data[70:7];
	assign io_deq_bits_cmd_rs2 = _ram_ext_R0_data[134:71];
	assign io_deq_bits_cmd_status_debug = _ram_ext_R0_data[135];
	assign io_deq_bits_cmd_status_cease = _ram_ext_R0_data[136];
	assign io_deq_bits_cmd_status_wfi = _ram_ext_R0_data[137];
	assign io_deq_bits_cmd_status_isa = _ram_ext_R0_data[169:138];
	assign io_deq_bits_cmd_status_dprv = _ram_ext_R0_data[171:170];
	assign io_deq_bits_cmd_status_dv = _ram_ext_R0_data[172];
	assign io_deq_bits_cmd_status_prv = _ram_ext_R0_data[174:173];
	assign io_deq_bits_cmd_status_v = _ram_ext_R0_data[175];
	assign io_deq_bits_cmd_status_sd = _ram_ext_R0_data[176];
	assign io_deq_bits_cmd_status_zero2 = _ram_ext_R0_data[199:177];
	assign io_deq_bits_cmd_status_mpv = _ram_ext_R0_data[200];
	assign io_deq_bits_cmd_status_gva = _ram_ext_R0_data[201];
	assign io_deq_bits_cmd_status_mbe = _ram_ext_R0_data[202];
	assign io_deq_bits_cmd_status_sbe = _ram_ext_R0_data[203];
	assign io_deq_bits_cmd_status_sxl = _ram_ext_R0_data[205:204];
	assign io_deq_bits_cmd_status_uxl = _ram_ext_R0_data[207:206];
	assign io_deq_bits_cmd_status_sd_rv32 = _ram_ext_R0_data[208];
	assign io_deq_bits_cmd_status_zero1 = _ram_ext_R0_data[216:209];
	assign io_deq_bits_cmd_status_tsr = _ram_ext_R0_data[217];
	assign io_deq_bits_cmd_status_tw = _ram_ext_R0_data[218];
	assign io_deq_bits_cmd_status_tvm = _ram_ext_R0_data[219];
	assign io_deq_bits_cmd_status_mxr = _ram_ext_R0_data[220];
	assign io_deq_bits_cmd_status_sum = _ram_ext_R0_data[221];
	assign io_deq_bits_cmd_status_mprv = _ram_ext_R0_data[222];
	assign io_deq_bits_cmd_status_xs = _ram_ext_R0_data[224:223];
	assign io_deq_bits_cmd_status_fs = _ram_ext_R0_data[226:225];
	assign io_deq_bits_cmd_status_mpp = _ram_ext_R0_data[228:227];
	assign io_deq_bits_cmd_status_vs = _ram_ext_R0_data[230:229];
	assign io_deq_bits_cmd_status_spp = _ram_ext_R0_data[231];
	assign io_deq_bits_cmd_status_mpie = _ram_ext_R0_data[232];
	assign io_deq_bits_cmd_status_ube = _ram_ext_R0_data[233];
	assign io_deq_bits_cmd_status_spie = _ram_ext_R0_data[234];
	assign io_deq_bits_cmd_status_upie = _ram_ext_R0_data[235];
	assign io_deq_bits_cmd_status_mie = _ram_ext_R0_data[236];
	assign io_deq_bits_cmd_status_hie = _ram_ext_R0_data[237];
	assign io_deq_bits_cmd_status_sie = _ram_ext_R0_data[238];
	assign io_deq_bits_cmd_status_uie = _ram_ext_R0_data[239];
	assign io_deq_bits_rob_id_bits = _ram_ext_R0_data[245:240];
endmodule
