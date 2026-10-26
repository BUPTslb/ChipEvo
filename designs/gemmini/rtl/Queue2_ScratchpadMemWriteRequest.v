module Queue2_ScratchpadMemWriteRequest (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_vaddr,
	io_enq_bits_laddr_is_acc_addr,
	io_enq_bits_laddr_accumulate,
	io_enq_bits_laddr_read_full_acc_row,
	io_enq_bits_laddr_garbage,
	io_enq_bits_laddr_garbage_bit,
	io_enq_bits_laddr_data,
	io_enq_bits_dest,
	io_enq_bits_acc_act,
	io_enq_bits_acc_scale,
	io_enq_bits_len,
	io_enq_bits_block,
	io_enq_bits_cmd_id,
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
	io_enq_bits_pool_en,
	io_enq_bits_store_en,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_vaddr,
	io_deq_bits_laddr_is_acc_addr,
	io_deq_bits_laddr_accumulate,
	io_deq_bits_laddr_read_full_acc_row,
	io_deq_bits_laddr_norm_cmd,
	io_deq_bits_laddr_garbage,
	io_deq_bits_laddr_garbage_bit,
	io_deq_bits_laddr_data,
	io_deq_bits_dest,
	io_deq_bits_acc_act,
	io_deq_bits_acc_scale,
	io_deq_bits_acc_igelu_qb,
	io_deq_bits_acc_igelu_qc,
	io_deq_bits_acc_iexp_qln2,
	io_deq_bits_acc_iexp_qln2_inv,
	io_deq_bits_acc_norm_stats_id,
	io_deq_bits_len,
	io_deq_bits_block,
	io_deq_bits_cmd_id,
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
	io_deq_bits_pool_en,
	io_deq_bits_store_en
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [39:0] io_enq_bits_vaddr;
	input io_enq_bits_laddr_is_acc_addr;
	input io_enq_bits_laddr_accumulate;
	input io_enq_bits_laddr_read_full_acc_row;
	input [10:0] io_enq_bits_laddr_garbage;
	input io_enq_bits_laddr_garbage_bit;
	input [13:0] io_enq_bits_laddr_data;
	input io_enq_bits_dest;
	input [2:0] io_enq_bits_acc_act;
	input [31:0] io_enq_bits_acc_scale;
	input [15:0] io_enq_bits_len;
	input [7:0] io_enq_bits_block;
	input [7:0] io_enq_bits_cmd_id;
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
	input io_enq_bits_pool_en;
	input io_enq_bits_store_en;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [39:0] io_deq_bits_vaddr;
	output wire io_deq_bits_laddr_is_acc_addr;
	output wire io_deq_bits_laddr_accumulate;
	output wire io_deq_bits_laddr_read_full_acc_row;
	output wire [2:0] io_deq_bits_laddr_norm_cmd;
	output wire [10:0] io_deq_bits_laddr_garbage;
	output wire io_deq_bits_laddr_garbage_bit;
	output wire [13:0] io_deq_bits_laddr_data;
	output wire io_deq_bits_dest;
	output wire [2:0] io_deq_bits_acc_act;
	output wire [31:0] io_deq_bits_acc_scale;
	output wire [31:0] io_deq_bits_acc_igelu_qb;
	output wire [31:0] io_deq_bits_acc_igelu_qc;
	output wire [31:0] io_deq_bits_acc_iexp_qln2;
	output wire [31:0] io_deq_bits_acc_iexp_qln2_inv;
	output wire [7:0] io_deq_bits_acc_norm_stats_id;
	output wire [15:0] io_deq_bits_len;
	output wire [7:0] io_deq_bits_block;
	output wire [7:0] io_deq_bits_cmd_id;
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
	output wire io_deq_bits_pool_en;
	output wire io_deq_bits_store_en;
	wire [382:0] _ram_ext_R0_data;
	reg wrap;
	reg wrap_1;
	reg maybe_full;
	wire ptr_match = wrap == wrap_1;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = ~full & io_enq_valid;
	wire do_deq = io_deq_ready & ~empty;
	always @(posedge clock)
		if (reset) begin
			wrap <= 1'h0;
			wrap_1 <= 1'h0;
			maybe_full <= 1'h0;
		end
		else begin
			if (do_enq)
				wrap <= wrap - 1'h1;
			if (do_deq)
				wrap_1 <= wrap_1 - 1'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_2x383 ram_ext(
		.R0_addr(wrap_1),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(wrap),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_store_en, io_enq_bits_pool_en, io_enq_bits_status_uie, io_enq_bits_status_sie, io_enq_bits_status_hie, io_enq_bits_status_mie, io_enq_bits_status_upie, io_enq_bits_status_spie, io_enq_bits_status_ube, io_enq_bits_status_mpie, io_enq_bits_status_spp, io_enq_bits_status_vs, io_enq_bits_status_mpp, io_enq_bits_status_fs, io_enq_bits_status_xs, io_enq_bits_status_mprv, io_enq_bits_status_sum, io_enq_bits_status_mxr, io_enq_bits_status_tvm, io_enq_bits_status_tw, io_enq_bits_status_tsr, io_enq_bits_status_zero1, io_enq_bits_status_sd_rv32, io_enq_bits_status_uxl, io_enq_bits_status_sxl, io_enq_bits_status_sbe, io_enq_bits_status_mbe, io_enq_bits_status_gva, io_enq_bits_status_mpv, io_enq_bits_status_zero2, io_enq_bits_status_sd, io_enq_bits_status_v, io_enq_bits_status_prv, io_enq_bits_status_dv, io_enq_bits_status_dprv, io_enq_bits_status_isa, io_enq_bits_status_wfi, io_enq_bits_status_cease, io_enq_bits_status_debug, io_enq_bits_cmd_id, io_enq_bits_block, io_enq_bits_len, 136'h0000000000000000000000000000000000, io_enq_bits_acc_scale, io_enq_bits_acc_act, io_enq_bits_dest, io_enq_bits_laddr_data, io_enq_bits_laddr_garbage_bit, io_enq_bits_laddr_garbage, 3'h0, io_enq_bits_laddr_read_full_acc_row, io_enq_bits_laddr_accumulate, io_enq_bits_laddr_is_acc_addr, io_enq_bits_vaddr})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_vaddr = _ram_ext_R0_data[39:0];
	assign io_deq_bits_laddr_is_acc_addr = _ram_ext_R0_data[40];
	assign io_deq_bits_laddr_accumulate = _ram_ext_R0_data[41];
	assign io_deq_bits_laddr_read_full_acc_row = _ram_ext_R0_data[42];
	assign io_deq_bits_laddr_norm_cmd = _ram_ext_R0_data[45:43];
	assign io_deq_bits_laddr_garbage = _ram_ext_R0_data[56:46];
	assign io_deq_bits_laddr_garbage_bit = _ram_ext_R0_data[57];
	assign io_deq_bits_laddr_data = _ram_ext_R0_data[71:58];
	assign io_deq_bits_dest = _ram_ext_R0_data[72];
	assign io_deq_bits_acc_act = _ram_ext_R0_data[75:73];
	assign io_deq_bits_acc_scale = _ram_ext_R0_data[107:76];
	assign io_deq_bits_acc_igelu_qb = _ram_ext_R0_data[139:108];
	assign io_deq_bits_acc_igelu_qc = _ram_ext_R0_data[171:140];
	assign io_deq_bits_acc_iexp_qln2 = _ram_ext_R0_data[203:172];
	assign io_deq_bits_acc_iexp_qln2_inv = _ram_ext_R0_data[235:204];
	assign io_deq_bits_acc_norm_stats_id = _ram_ext_R0_data[243:236];
	assign io_deq_bits_len = _ram_ext_R0_data[259:244];
	assign io_deq_bits_block = _ram_ext_R0_data[267:260];
	assign io_deq_bits_cmd_id = _ram_ext_R0_data[275:268];
	assign io_deq_bits_status_debug = _ram_ext_R0_data[276];
	assign io_deq_bits_status_cease = _ram_ext_R0_data[277];
	assign io_deq_bits_status_wfi = _ram_ext_R0_data[278];
	assign io_deq_bits_status_isa = _ram_ext_R0_data[310:279];
	assign io_deq_bits_status_dprv = _ram_ext_R0_data[312:311];
	assign io_deq_bits_status_dv = _ram_ext_R0_data[313];
	assign io_deq_bits_status_prv = _ram_ext_R0_data[315:314];
	assign io_deq_bits_status_v = _ram_ext_R0_data[316];
	assign io_deq_bits_status_sd = _ram_ext_R0_data[317];
	assign io_deq_bits_status_zero2 = _ram_ext_R0_data[340:318];
	assign io_deq_bits_status_mpv = _ram_ext_R0_data[341];
	assign io_deq_bits_status_gva = _ram_ext_R0_data[342];
	assign io_deq_bits_status_mbe = _ram_ext_R0_data[343];
	assign io_deq_bits_status_sbe = _ram_ext_R0_data[344];
	assign io_deq_bits_status_sxl = _ram_ext_R0_data[346:345];
	assign io_deq_bits_status_uxl = _ram_ext_R0_data[348:347];
	assign io_deq_bits_status_sd_rv32 = _ram_ext_R0_data[349];
	assign io_deq_bits_status_zero1 = _ram_ext_R0_data[357:350];
	assign io_deq_bits_status_tsr = _ram_ext_R0_data[358];
	assign io_deq_bits_status_tw = _ram_ext_R0_data[359];
	assign io_deq_bits_status_tvm = _ram_ext_R0_data[360];
	assign io_deq_bits_status_mxr = _ram_ext_R0_data[361];
	assign io_deq_bits_status_sum = _ram_ext_R0_data[362];
	assign io_deq_bits_status_mprv = _ram_ext_R0_data[363];
	assign io_deq_bits_status_xs = _ram_ext_R0_data[365:364];
	assign io_deq_bits_status_fs = _ram_ext_R0_data[367:366];
	assign io_deq_bits_status_mpp = _ram_ext_R0_data[369:368];
	assign io_deq_bits_status_vs = _ram_ext_R0_data[371:370];
	assign io_deq_bits_status_spp = _ram_ext_R0_data[372];
	assign io_deq_bits_status_mpie = _ram_ext_R0_data[373];
	assign io_deq_bits_status_ube = _ram_ext_R0_data[374];
	assign io_deq_bits_status_spie = _ram_ext_R0_data[375];
	assign io_deq_bits_status_upie = _ram_ext_R0_data[376];
	assign io_deq_bits_status_mie = _ram_ext_R0_data[377];
	assign io_deq_bits_status_hie = _ram_ext_R0_data[378];
	assign io_deq_bits_status_sie = _ram_ext_R0_data[379];
	assign io_deq_bits_status_uie = _ram_ext_R0_data[380];
	assign io_deq_bits_pool_en = _ram_ext_R0_data[381];
	assign io_deq_bits_store_en = _ram_ext_R0_data[382];
endmodule
