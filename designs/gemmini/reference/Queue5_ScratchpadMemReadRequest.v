module Queue5_ScratchpadMemReadRequest (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_vaddr,
	io_enq_bits_laddr_is_acc_addr,
	io_enq_bits_laddr_accumulate,
	io_enq_bits_laddr_read_full_acc_row,
	io_enq_bits_laddr_norm_cmd,
	io_enq_bits_laddr_garbage,
	io_enq_bits_laddr_garbage_bit,
	io_enq_bits_laddr_data,
	io_enq_bits_cols,
	io_enq_bits_repeats,
	io_enq_bits_scale,
	io_enq_bits_has_acc_bitwidth,
	io_enq_bits_all_zeros,
	io_enq_bits_block_stride,
	io_enq_bits_pixel_repeats,
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
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_vaddr,
	io_deq_bits_laddr_is_acc_addr,
	io_deq_bits_laddr_accumulate,
	io_deq_bits_laddr_data,
	io_deq_bits_cols,
	io_deq_bits_repeats,
	io_deq_bits_scale,
	io_deq_bits_has_acc_bitwidth,
	io_deq_bits_block_stride,
	io_deq_bits_pixel_repeats,
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
	io_deq_bits_status_uie
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [39:0] io_enq_bits_vaddr;
	input io_enq_bits_laddr_is_acc_addr;
	input io_enq_bits_laddr_accumulate;
	input io_enq_bits_laddr_read_full_acc_row;
	input [2:0] io_enq_bits_laddr_norm_cmd;
	input [10:0] io_enq_bits_laddr_garbage;
	input io_enq_bits_laddr_garbage_bit;
	input [13:0] io_enq_bits_laddr_data;
	input [15:0] io_enq_bits_cols;
	input [15:0] io_enq_bits_repeats;
	input [31:0] io_enq_bits_scale;
	input io_enq_bits_has_acc_bitwidth;
	input io_enq_bits_all_zeros;
	input [15:0] io_enq_bits_block_stride;
	input [7:0] io_enq_bits_pixel_repeats;
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
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [39:0] io_deq_bits_vaddr;
	output wire io_deq_bits_laddr_is_acc_addr;
	output wire io_deq_bits_laddr_accumulate;
	output wire [13:0] io_deq_bits_laddr_data;
	output wire [15:0] io_deq_bits_cols;
	output wire [15:0] io_deq_bits_repeats;
	output wire [31:0] io_deq_bits_scale;
	output wire io_deq_bits_has_acc_bitwidth;
	output wire [15:0] io_deq_bits_block_stride;
	output wire [7:0] io_deq_bits_pixel_repeats;
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
	wire io_enq_ready_0;
	wire [257:0] _ram_ext_R0_data;
	reg [2:0] enq_ptr_value;
	reg [2:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire empty = ptr_match & ~maybe_full;
	wire do_enq = io_enq_ready_0 & io_enq_valid;
	assign io_enq_ready_0 = io_deq_ready | ~(ptr_match & maybe_full);
	wire do_deq = io_deq_ready & ~empty;
	always @(posedge clock)
		if (reset) begin
			enq_ptr_value <= 3'h0;
			deq_ptr_value <= 3'h0;
			maybe_full <= 1'h0;
		end
		else begin
			if (do_enq)
				if (enq_ptr_value == 3'h4)
					enq_ptr_value <= 3'h0;
				else
					enq_ptr_value <= enq_ptr_value + 3'h1;
			if (do_deq)
				if (deq_ptr_value == 3'h4)
					deq_ptr_value <= 3'h0;
				else
					deq_ptr_value <= deq_ptr_value + 3'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_5x258 ram_ext(
		.R0_addr(deq_ptr_value),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(enq_ptr_value),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_status_uie, io_enq_bits_status_sie, io_enq_bits_status_hie, io_enq_bits_status_mie, io_enq_bits_status_upie, io_enq_bits_status_spie, io_enq_bits_status_ube, io_enq_bits_status_mpie, io_enq_bits_status_spp, io_enq_bits_status_vs, io_enq_bits_status_mpp, io_enq_bits_status_fs, io_enq_bits_status_xs, io_enq_bits_status_mprv, io_enq_bits_status_sum, io_enq_bits_status_mxr, io_enq_bits_status_tvm, io_enq_bits_status_tw, io_enq_bits_status_tsr, io_enq_bits_status_zero1, io_enq_bits_status_sd_rv32, io_enq_bits_status_uxl, io_enq_bits_status_sxl, io_enq_bits_status_sbe, io_enq_bits_status_mbe, io_enq_bits_status_gva, io_enq_bits_status_mpv, io_enq_bits_status_zero2, io_enq_bits_status_sd, io_enq_bits_status_v, io_enq_bits_status_prv, io_enq_bits_status_dv, io_enq_bits_status_dprv, io_enq_bits_status_isa, io_enq_bits_status_wfi, io_enq_bits_status_cease, io_enq_bits_status_debug, io_enq_bits_cmd_id, io_enq_bits_pixel_repeats, io_enq_bits_block_stride, io_enq_bits_has_acc_bitwidth, io_enq_bits_scale, io_enq_bits_repeats, io_enq_bits_cols, io_enq_bits_laddr_data, io_enq_bits_laddr_accumulate, io_enq_bits_laddr_is_acc_addr, io_enq_bits_vaddr})
	);
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_vaddr = _ram_ext_R0_data[39:0];
	assign io_deq_bits_laddr_is_acc_addr = _ram_ext_R0_data[40];
	assign io_deq_bits_laddr_accumulate = _ram_ext_R0_data[41];
	assign io_deq_bits_laddr_data = _ram_ext_R0_data[55:42];
	assign io_deq_bits_cols = _ram_ext_R0_data[71:56];
	assign io_deq_bits_repeats = _ram_ext_R0_data[87:72];
	assign io_deq_bits_scale = _ram_ext_R0_data[119:88];
	assign io_deq_bits_has_acc_bitwidth = _ram_ext_R0_data[120];
	assign io_deq_bits_block_stride = _ram_ext_R0_data[136:121];
	assign io_deq_bits_pixel_repeats = _ram_ext_R0_data[144:137];
	assign io_deq_bits_cmd_id = _ram_ext_R0_data[152:145];
	assign io_deq_bits_status_debug = _ram_ext_R0_data[153];
	assign io_deq_bits_status_cease = _ram_ext_R0_data[154];
	assign io_deq_bits_status_wfi = _ram_ext_R0_data[155];
	assign io_deq_bits_status_isa = _ram_ext_R0_data[187:156];
	assign io_deq_bits_status_dprv = _ram_ext_R0_data[189:188];
	assign io_deq_bits_status_dv = _ram_ext_R0_data[190];
	assign io_deq_bits_status_prv = _ram_ext_R0_data[192:191];
	assign io_deq_bits_status_v = _ram_ext_R0_data[193];
	assign io_deq_bits_status_sd = _ram_ext_R0_data[194];
	assign io_deq_bits_status_zero2 = _ram_ext_R0_data[217:195];
	assign io_deq_bits_status_mpv = _ram_ext_R0_data[218];
	assign io_deq_bits_status_gva = _ram_ext_R0_data[219];
	assign io_deq_bits_status_mbe = _ram_ext_R0_data[220];
	assign io_deq_bits_status_sbe = _ram_ext_R0_data[221];
	assign io_deq_bits_status_sxl = _ram_ext_R0_data[223:222];
	assign io_deq_bits_status_uxl = _ram_ext_R0_data[225:224];
	assign io_deq_bits_status_sd_rv32 = _ram_ext_R0_data[226];
	assign io_deq_bits_status_zero1 = _ram_ext_R0_data[234:227];
	assign io_deq_bits_status_tsr = _ram_ext_R0_data[235];
	assign io_deq_bits_status_tw = _ram_ext_R0_data[236];
	assign io_deq_bits_status_tvm = _ram_ext_R0_data[237];
	assign io_deq_bits_status_mxr = _ram_ext_R0_data[238];
	assign io_deq_bits_status_sum = _ram_ext_R0_data[239];
	assign io_deq_bits_status_mprv = _ram_ext_R0_data[240];
	assign io_deq_bits_status_xs = _ram_ext_R0_data[242:241];
	assign io_deq_bits_status_fs = _ram_ext_R0_data[244:243];
	assign io_deq_bits_status_mpp = _ram_ext_R0_data[246:245];
	assign io_deq_bits_status_vs = _ram_ext_R0_data[248:247];
	assign io_deq_bits_status_spp = _ram_ext_R0_data[249];
	assign io_deq_bits_status_mpie = _ram_ext_R0_data[250];
	assign io_deq_bits_status_ube = _ram_ext_R0_data[251];
	assign io_deq_bits_status_spie = _ram_ext_R0_data[252];
	assign io_deq_bits_status_upie = _ram_ext_R0_data[253];
	assign io_deq_bits_status_mie = _ram_ext_R0_data[254];
	assign io_deq_bits_status_hie = _ram_ext_R0_data[255];
	assign io_deq_bits_status_sie = _ram_ext_R0_data[256];
	assign io_deq_bits_status_uie = _ram_ext_R0_data[257];
endmodule
