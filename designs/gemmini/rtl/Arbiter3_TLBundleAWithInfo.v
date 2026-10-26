module Arbiter3_TLBundleAWithInfo (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_tl_a_opcode,
	io_in_0_bits_tl_a_param,
	io_in_0_bits_tl_a_size,
	io_in_0_bits_tl_a_source,
	io_in_0_bits_tl_a_address,
	io_in_0_bits_tl_a_mask,
	io_in_0_bits_tl_a_data,
	io_in_0_bits_tl_a_corrupt,
	io_in_0_bits_vaddr,
	io_in_0_bits_status_debug,
	io_in_0_bits_status_cease,
	io_in_0_bits_status_wfi,
	io_in_0_bits_status_isa,
	io_in_0_bits_status_dprv,
	io_in_0_bits_status_dv,
	io_in_0_bits_status_prv,
	io_in_0_bits_status_v,
	io_in_0_bits_status_sd,
	io_in_0_bits_status_zero2,
	io_in_0_bits_status_mpv,
	io_in_0_bits_status_gva,
	io_in_0_bits_status_mbe,
	io_in_0_bits_status_sbe,
	io_in_0_bits_status_sxl,
	io_in_0_bits_status_uxl,
	io_in_0_bits_status_sd_rv32,
	io_in_0_bits_status_zero1,
	io_in_0_bits_status_tsr,
	io_in_0_bits_status_tw,
	io_in_0_bits_status_tvm,
	io_in_0_bits_status_mxr,
	io_in_0_bits_status_sum,
	io_in_0_bits_status_mprv,
	io_in_0_bits_status_xs,
	io_in_0_bits_status_fs,
	io_in_0_bits_status_mpp,
	io_in_0_bits_status_vs,
	io_in_0_bits_status_spp,
	io_in_0_bits_status_mpie,
	io_in_0_bits_status_ube,
	io_in_0_bits_status_spie,
	io_in_0_bits_status_upie,
	io_in_0_bits_status_mie,
	io_in_0_bits_status_hie,
	io_in_0_bits_status_sie,
	io_in_0_bits_status_uie,
	io_in_0_bits_passthrough,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_tl_a_opcode,
	io_in_1_bits_tl_a_param,
	io_in_1_bits_tl_a_size,
	io_in_1_bits_tl_a_source,
	io_in_1_bits_tl_a_address,
	io_in_1_bits_tl_a_mask,
	io_in_1_bits_tl_a_data,
	io_in_1_bits_tl_a_corrupt,
	io_in_1_bits_vaddr,
	io_in_1_bits_status_debug,
	io_in_1_bits_status_cease,
	io_in_1_bits_status_wfi,
	io_in_1_bits_status_isa,
	io_in_1_bits_status_dprv,
	io_in_1_bits_status_dv,
	io_in_1_bits_status_prv,
	io_in_1_bits_status_v,
	io_in_1_bits_status_sd,
	io_in_1_bits_status_zero2,
	io_in_1_bits_status_mpv,
	io_in_1_bits_status_gva,
	io_in_1_bits_status_mbe,
	io_in_1_bits_status_sbe,
	io_in_1_bits_status_sxl,
	io_in_1_bits_status_uxl,
	io_in_1_bits_status_sd_rv32,
	io_in_1_bits_status_zero1,
	io_in_1_bits_status_tsr,
	io_in_1_bits_status_tw,
	io_in_1_bits_status_tvm,
	io_in_1_bits_status_mxr,
	io_in_1_bits_status_sum,
	io_in_1_bits_status_mprv,
	io_in_1_bits_status_xs,
	io_in_1_bits_status_fs,
	io_in_1_bits_status_mpp,
	io_in_1_bits_status_vs,
	io_in_1_bits_status_spp,
	io_in_1_bits_status_mpie,
	io_in_1_bits_status_ube,
	io_in_1_bits_status_spie,
	io_in_1_bits_status_upie,
	io_in_1_bits_status_mie,
	io_in_1_bits_status_hie,
	io_in_1_bits_status_sie,
	io_in_1_bits_status_uie,
	io_in_1_bits_passthrough,
	io_in_2_ready,
	io_in_2_valid,
	io_in_2_bits_tl_a_opcode,
	io_in_2_bits_tl_a_size,
	io_in_2_bits_tl_a_source,
	io_in_2_bits_tl_a_mask,
	io_in_2_bits_tl_a_data,
	io_in_2_bits_vaddr,
	io_in_2_bits_status_debug,
	io_in_2_bits_status_cease,
	io_in_2_bits_status_wfi,
	io_in_2_bits_status_isa,
	io_in_2_bits_status_dprv,
	io_in_2_bits_status_dv,
	io_in_2_bits_status_prv,
	io_in_2_bits_status_v,
	io_in_2_bits_status_sd,
	io_in_2_bits_status_zero2,
	io_in_2_bits_status_mpv,
	io_in_2_bits_status_gva,
	io_in_2_bits_status_mbe,
	io_in_2_bits_status_sbe,
	io_in_2_bits_status_sxl,
	io_in_2_bits_status_uxl,
	io_in_2_bits_status_sd_rv32,
	io_in_2_bits_status_zero1,
	io_in_2_bits_status_tsr,
	io_in_2_bits_status_tw,
	io_in_2_bits_status_tvm,
	io_in_2_bits_status_mxr,
	io_in_2_bits_status_sum,
	io_in_2_bits_status_mprv,
	io_in_2_bits_status_xs,
	io_in_2_bits_status_fs,
	io_in_2_bits_status_mpp,
	io_in_2_bits_status_vs,
	io_in_2_bits_status_spp,
	io_in_2_bits_status_mpie,
	io_in_2_bits_status_ube,
	io_in_2_bits_status_spie,
	io_in_2_bits_status_upie,
	io_in_2_bits_status_mie,
	io_in_2_bits_status_hie,
	io_in_2_bits_status_sie,
	io_in_2_bits_status_uie,
	io_in_2_bits_passthrough,
	io_out_ready,
	io_out_valid,
	io_out_bits_tl_a_opcode,
	io_out_bits_tl_a_param,
	io_out_bits_tl_a_size,
	io_out_bits_tl_a_source,
	io_out_bits_tl_a_address,
	io_out_bits_tl_a_mask,
	io_out_bits_tl_a_data,
	io_out_bits_tl_a_corrupt,
	io_out_bits_vaddr,
	io_out_bits_status_debug,
	io_out_bits_status_cease,
	io_out_bits_status_wfi,
	io_out_bits_status_isa,
	io_out_bits_status_dprv,
	io_out_bits_status_dv,
	io_out_bits_status_prv,
	io_out_bits_status_v,
	io_out_bits_status_sd,
	io_out_bits_status_zero2,
	io_out_bits_status_mpv,
	io_out_bits_status_gva,
	io_out_bits_status_mbe,
	io_out_bits_status_sbe,
	io_out_bits_status_sxl,
	io_out_bits_status_uxl,
	io_out_bits_status_sd_rv32,
	io_out_bits_status_zero1,
	io_out_bits_status_tsr,
	io_out_bits_status_tw,
	io_out_bits_status_tvm,
	io_out_bits_status_mxr,
	io_out_bits_status_sum,
	io_out_bits_status_mprv,
	io_out_bits_status_xs,
	io_out_bits_status_fs,
	io_out_bits_status_mpp,
	io_out_bits_status_vs,
	io_out_bits_status_spp,
	io_out_bits_status_mpie,
	io_out_bits_status_ube,
	io_out_bits_status_spie,
	io_out_bits_status_upie,
	io_out_bits_status_mie,
	io_out_bits_status_hie,
	io_out_bits_status_sie,
	io_out_bits_status_uie,
	io_out_bits_passthrough
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [2:0] io_in_0_bits_tl_a_opcode;
	input [2:0] io_in_0_bits_tl_a_param;
	input [2:0] io_in_0_bits_tl_a_size;
	input [3:0] io_in_0_bits_tl_a_source;
	input [31:0] io_in_0_bits_tl_a_address;
	input [15:0] io_in_0_bits_tl_a_mask;
	input [127:0] io_in_0_bits_tl_a_data;
	input io_in_0_bits_tl_a_corrupt;
	input [38:0] io_in_0_bits_vaddr;
	input io_in_0_bits_status_debug;
	input io_in_0_bits_status_cease;
	input io_in_0_bits_status_wfi;
	input [31:0] io_in_0_bits_status_isa;
	input [1:0] io_in_0_bits_status_dprv;
	input io_in_0_bits_status_dv;
	input [1:0] io_in_0_bits_status_prv;
	input io_in_0_bits_status_v;
	input io_in_0_bits_status_sd;
	input [22:0] io_in_0_bits_status_zero2;
	input io_in_0_bits_status_mpv;
	input io_in_0_bits_status_gva;
	input io_in_0_bits_status_mbe;
	input io_in_0_bits_status_sbe;
	input [1:0] io_in_0_bits_status_sxl;
	input [1:0] io_in_0_bits_status_uxl;
	input io_in_0_bits_status_sd_rv32;
	input [7:0] io_in_0_bits_status_zero1;
	input io_in_0_bits_status_tsr;
	input io_in_0_bits_status_tw;
	input io_in_0_bits_status_tvm;
	input io_in_0_bits_status_mxr;
	input io_in_0_bits_status_sum;
	input io_in_0_bits_status_mprv;
	input [1:0] io_in_0_bits_status_xs;
	input [1:0] io_in_0_bits_status_fs;
	input [1:0] io_in_0_bits_status_mpp;
	input [1:0] io_in_0_bits_status_vs;
	input io_in_0_bits_status_spp;
	input io_in_0_bits_status_mpie;
	input io_in_0_bits_status_ube;
	input io_in_0_bits_status_spie;
	input io_in_0_bits_status_upie;
	input io_in_0_bits_status_mie;
	input io_in_0_bits_status_hie;
	input io_in_0_bits_status_sie;
	input io_in_0_bits_status_uie;
	input io_in_0_bits_passthrough;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [2:0] io_in_1_bits_tl_a_opcode;
	input [2:0] io_in_1_bits_tl_a_param;
	input [2:0] io_in_1_bits_tl_a_size;
	input [3:0] io_in_1_bits_tl_a_source;
	input [31:0] io_in_1_bits_tl_a_address;
	input [15:0] io_in_1_bits_tl_a_mask;
	input [127:0] io_in_1_bits_tl_a_data;
	input io_in_1_bits_tl_a_corrupt;
	input [38:0] io_in_1_bits_vaddr;
	input io_in_1_bits_status_debug;
	input io_in_1_bits_status_cease;
	input io_in_1_bits_status_wfi;
	input [31:0] io_in_1_bits_status_isa;
	input [1:0] io_in_1_bits_status_dprv;
	input io_in_1_bits_status_dv;
	input [1:0] io_in_1_bits_status_prv;
	input io_in_1_bits_status_v;
	input io_in_1_bits_status_sd;
	input [22:0] io_in_1_bits_status_zero2;
	input io_in_1_bits_status_mpv;
	input io_in_1_bits_status_gva;
	input io_in_1_bits_status_mbe;
	input io_in_1_bits_status_sbe;
	input [1:0] io_in_1_bits_status_sxl;
	input [1:0] io_in_1_bits_status_uxl;
	input io_in_1_bits_status_sd_rv32;
	input [7:0] io_in_1_bits_status_zero1;
	input io_in_1_bits_status_tsr;
	input io_in_1_bits_status_tw;
	input io_in_1_bits_status_tvm;
	input io_in_1_bits_status_mxr;
	input io_in_1_bits_status_sum;
	input io_in_1_bits_status_mprv;
	input [1:0] io_in_1_bits_status_xs;
	input [1:0] io_in_1_bits_status_fs;
	input [1:0] io_in_1_bits_status_mpp;
	input [1:0] io_in_1_bits_status_vs;
	input io_in_1_bits_status_spp;
	input io_in_1_bits_status_mpie;
	input io_in_1_bits_status_ube;
	input io_in_1_bits_status_spie;
	input io_in_1_bits_status_upie;
	input io_in_1_bits_status_mie;
	input io_in_1_bits_status_hie;
	input io_in_1_bits_status_sie;
	input io_in_1_bits_status_uie;
	input io_in_1_bits_passthrough;
	output wire io_in_2_ready;
	input io_in_2_valid;
	input [2:0] io_in_2_bits_tl_a_opcode;
	input [2:0] io_in_2_bits_tl_a_size;
	input [3:0] io_in_2_bits_tl_a_source;
	input [15:0] io_in_2_bits_tl_a_mask;
	input [127:0] io_in_2_bits_tl_a_data;
	input [38:0] io_in_2_bits_vaddr;
	input io_in_2_bits_status_debug;
	input io_in_2_bits_status_cease;
	input io_in_2_bits_status_wfi;
	input [31:0] io_in_2_bits_status_isa;
	input [1:0] io_in_2_bits_status_dprv;
	input io_in_2_bits_status_dv;
	input [1:0] io_in_2_bits_status_prv;
	input io_in_2_bits_status_v;
	input io_in_2_bits_status_sd;
	input [22:0] io_in_2_bits_status_zero2;
	input io_in_2_bits_status_mpv;
	input io_in_2_bits_status_gva;
	input io_in_2_bits_status_mbe;
	input io_in_2_bits_status_sbe;
	input [1:0] io_in_2_bits_status_sxl;
	input [1:0] io_in_2_bits_status_uxl;
	input io_in_2_bits_status_sd_rv32;
	input [7:0] io_in_2_bits_status_zero1;
	input io_in_2_bits_status_tsr;
	input io_in_2_bits_status_tw;
	input io_in_2_bits_status_tvm;
	input io_in_2_bits_status_mxr;
	input io_in_2_bits_status_sum;
	input io_in_2_bits_status_mprv;
	input [1:0] io_in_2_bits_status_xs;
	input [1:0] io_in_2_bits_status_fs;
	input [1:0] io_in_2_bits_status_mpp;
	input [1:0] io_in_2_bits_status_vs;
	input io_in_2_bits_status_spp;
	input io_in_2_bits_status_mpie;
	input io_in_2_bits_status_ube;
	input io_in_2_bits_status_spie;
	input io_in_2_bits_status_upie;
	input io_in_2_bits_status_mie;
	input io_in_2_bits_status_hie;
	input io_in_2_bits_status_sie;
	input io_in_2_bits_status_uie;
	input io_in_2_bits_passthrough;
	input io_out_ready;
	output wire io_out_valid;
	output wire [2:0] io_out_bits_tl_a_opcode;
	output wire [2:0] io_out_bits_tl_a_param;
	output wire [2:0] io_out_bits_tl_a_size;
	output wire [3:0] io_out_bits_tl_a_source;
	output wire [31:0] io_out_bits_tl_a_address;
	output wire [15:0] io_out_bits_tl_a_mask;
	output wire [127:0] io_out_bits_tl_a_data;
	output wire io_out_bits_tl_a_corrupt;
	output wire [38:0] io_out_bits_vaddr;
	output wire io_out_bits_status_debug;
	output wire io_out_bits_status_cease;
	output wire io_out_bits_status_wfi;
	output wire [31:0] io_out_bits_status_isa;
	output wire [1:0] io_out_bits_status_dprv;
	output wire io_out_bits_status_dv;
	output wire [1:0] io_out_bits_status_prv;
	output wire io_out_bits_status_v;
	output wire io_out_bits_status_sd;
	output wire [22:0] io_out_bits_status_zero2;
	output wire io_out_bits_status_mpv;
	output wire io_out_bits_status_gva;
	output wire io_out_bits_status_mbe;
	output wire io_out_bits_status_sbe;
	output wire [1:0] io_out_bits_status_sxl;
	output wire [1:0] io_out_bits_status_uxl;
	output wire io_out_bits_status_sd_rv32;
	output wire [7:0] io_out_bits_status_zero1;
	output wire io_out_bits_status_tsr;
	output wire io_out_bits_status_tw;
	output wire io_out_bits_status_tvm;
	output wire io_out_bits_status_mxr;
	output wire io_out_bits_status_sum;
	output wire io_out_bits_status_mprv;
	output wire [1:0] io_out_bits_status_xs;
	output wire [1:0] io_out_bits_status_fs;
	output wire [1:0] io_out_bits_status_mpp;
	output wire [1:0] io_out_bits_status_vs;
	output wire io_out_bits_status_spp;
	output wire io_out_bits_status_mpie;
	output wire io_out_bits_status_ube;
	output wire io_out_bits_status_spie;
	output wire io_out_bits_status_upie;
	output wire io_out_bits_status_mie;
	output wire io_out_bits_status_hie;
	output wire io_out_bits_status_sie;
	output wire io_out_bits_status_uie;
	output wire io_out_bits_passthrough;
	wire _io_out_valid_T = io_in_0_valid | io_in_1_valid;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_in_2_ready = ~_io_out_valid_T & io_out_ready;
	assign io_out_valid = _io_out_valid_T | io_in_2_valid;
	assign io_out_bits_tl_a_opcode = (io_in_0_valid ? io_in_0_bits_tl_a_opcode : (io_in_1_valid ? io_in_1_bits_tl_a_opcode : io_in_2_bits_tl_a_opcode));
	assign io_out_bits_tl_a_param = (io_in_0_valid ? io_in_0_bits_tl_a_param : (io_in_1_valid ? io_in_1_bits_tl_a_param : 3'h0));
	assign io_out_bits_tl_a_size = (io_in_0_valid ? io_in_0_bits_tl_a_size : (io_in_1_valid ? io_in_1_bits_tl_a_size : io_in_2_bits_tl_a_size));
	assign io_out_bits_tl_a_source = (io_in_0_valid ? io_in_0_bits_tl_a_source : (io_in_1_valid ? io_in_1_bits_tl_a_source : io_in_2_bits_tl_a_source));
	assign io_out_bits_tl_a_address = (io_in_0_valid ? io_in_0_bits_tl_a_address : (io_in_1_valid ? io_in_1_bits_tl_a_address : 32'h00000000));
	assign io_out_bits_tl_a_mask = (io_in_0_valid ? io_in_0_bits_tl_a_mask : (io_in_1_valid ? io_in_1_bits_tl_a_mask : io_in_2_bits_tl_a_mask));
	assign io_out_bits_tl_a_data = (io_in_0_valid ? io_in_0_bits_tl_a_data : (io_in_1_valid ? io_in_1_bits_tl_a_data : io_in_2_bits_tl_a_data));
	assign io_out_bits_tl_a_corrupt = (io_in_0_valid ? io_in_0_bits_tl_a_corrupt : io_in_1_valid & io_in_1_bits_tl_a_corrupt);
	assign io_out_bits_vaddr = (io_in_0_valid ? io_in_0_bits_vaddr : (io_in_1_valid ? io_in_1_bits_vaddr : io_in_2_bits_vaddr));
	assign io_out_bits_status_debug = (io_in_0_valid ? io_in_0_bits_status_debug : (io_in_1_valid ? io_in_1_bits_status_debug : io_in_2_bits_status_debug));
	assign io_out_bits_status_cease = (io_in_0_valid ? io_in_0_bits_status_cease : (io_in_1_valid ? io_in_1_bits_status_cease : io_in_2_bits_status_cease));
	assign io_out_bits_status_wfi = (io_in_0_valid ? io_in_0_bits_status_wfi : (io_in_1_valid ? io_in_1_bits_status_wfi : io_in_2_bits_status_wfi));
	assign io_out_bits_status_isa = (io_in_0_valid ? io_in_0_bits_status_isa : (io_in_1_valid ? io_in_1_bits_status_isa : io_in_2_bits_status_isa));
	assign io_out_bits_status_dprv = (io_in_0_valid ? io_in_0_bits_status_dprv : (io_in_1_valid ? io_in_1_bits_status_dprv : io_in_2_bits_status_dprv));
	assign io_out_bits_status_dv = (io_in_0_valid ? io_in_0_bits_status_dv : (io_in_1_valid ? io_in_1_bits_status_dv : io_in_2_bits_status_dv));
	assign io_out_bits_status_prv = (io_in_0_valid ? io_in_0_bits_status_prv : (io_in_1_valid ? io_in_1_bits_status_prv : io_in_2_bits_status_prv));
	assign io_out_bits_status_v = (io_in_0_valid ? io_in_0_bits_status_v : (io_in_1_valid ? io_in_1_bits_status_v : io_in_2_bits_status_v));
	assign io_out_bits_status_sd = (io_in_0_valid ? io_in_0_bits_status_sd : (io_in_1_valid ? io_in_1_bits_status_sd : io_in_2_bits_status_sd));
	assign io_out_bits_status_zero2 = (io_in_0_valid ? io_in_0_bits_status_zero2 : (io_in_1_valid ? io_in_1_bits_status_zero2 : io_in_2_bits_status_zero2));
	assign io_out_bits_status_mpv = (io_in_0_valid ? io_in_0_bits_status_mpv : (io_in_1_valid ? io_in_1_bits_status_mpv : io_in_2_bits_status_mpv));
	assign io_out_bits_status_gva = (io_in_0_valid ? io_in_0_bits_status_gva : (io_in_1_valid ? io_in_1_bits_status_gva : io_in_2_bits_status_gva));
	assign io_out_bits_status_mbe = (io_in_0_valid ? io_in_0_bits_status_mbe : (io_in_1_valid ? io_in_1_bits_status_mbe : io_in_2_bits_status_mbe));
	assign io_out_bits_status_sbe = (io_in_0_valid ? io_in_0_bits_status_sbe : (io_in_1_valid ? io_in_1_bits_status_sbe : io_in_2_bits_status_sbe));
	assign io_out_bits_status_sxl = (io_in_0_valid ? io_in_0_bits_status_sxl : (io_in_1_valid ? io_in_1_bits_status_sxl : io_in_2_bits_status_sxl));
	assign io_out_bits_status_uxl = (io_in_0_valid ? io_in_0_bits_status_uxl : (io_in_1_valid ? io_in_1_bits_status_uxl : io_in_2_bits_status_uxl));
	assign io_out_bits_status_sd_rv32 = (io_in_0_valid ? io_in_0_bits_status_sd_rv32 : (io_in_1_valid ? io_in_1_bits_status_sd_rv32 : io_in_2_bits_status_sd_rv32));
	assign io_out_bits_status_zero1 = (io_in_0_valid ? io_in_0_bits_status_zero1 : (io_in_1_valid ? io_in_1_bits_status_zero1 : io_in_2_bits_status_zero1));
	assign io_out_bits_status_tsr = (io_in_0_valid ? io_in_0_bits_status_tsr : (io_in_1_valid ? io_in_1_bits_status_tsr : io_in_2_bits_status_tsr));
	assign io_out_bits_status_tw = (io_in_0_valid ? io_in_0_bits_status_tw : (io_in_1_valid ? io_in_1_bits_status_tw : io_in_2_bits_status_tw));
	assign io_out_bits_status_tvm = (io_in_0_valid ? io_in_0_bits_status_tvm : (io_in_1_valid ? io_in_1_bits_status_tvm : io_in_2_bits_status_tvm));
	assign io_out_bits_status_mxr = (io_in_0_valid ? io_in_0_bits_status_mxr : (io_in_1_valid ? io_in_1_bits_status_mxr : io_in_2_bits_status_mxr));
	assign io_out_bits_status_sum = (io_in_0_valid ? io_in_0_bits_status_sum : (io_in_1_valid ? io_in_1_bits_status_sum : io_in_2_bits_status_sum));
	assign io_out_bits_status_mprv = (io_in_0_valid ? io_in_0_bits_status_mprv : (io_in_1_valid ? io_in_1_bits_status_mprv : io_in_2_bits_status_mprv));
	assign io_out_bits_status_xs = (io_in_0_valid ? io_in_0_bits_status_xs : (io_in_1_valid ? io_in_1_bits_status_xs : io_in_2_bits_status_xs));
	assign io_out_bits_status_fs = (io_in_0_valid ? io_in_0_bits_status_fs : (io_in_1_valid ? io_in_1_bits_status_fs : io_in_2_bits_status_fs));
	assign io_out_bits_status_mpp = (io_in_0_valid ? io_in_0_bits_status_mpp : (io_in_1_valid ? io_in_1_bits_status_mpp : io_in_2_bits_status_mpp));
	assign io_out_bits_status_vs = (io_in_0_valid ? io_in_0_bits_status_vs : (io_in_1_valid ? io_in_1_bits_status_vs : io_in_2_bits_status_vs));
	assign io_out_bits_status_spp = (io_in_0_valid ? io_in_0_bits_status_spp : (io_in_1_valid ? io_in_1_bits_status_spp : io_in_2_bits_status_spp));
	assign io_out_bits_status_mpie = (io_in_0_valid ? io_in_0_bits_status_mpie : (io_in_1_valid ? io_in_1_bits_status_mpie : io_in_2_bits_status_mpie));
	assign io_out_bits_status_ube = (io_in_0_valid ? io_in_0_bits_status_ube : (io_in_1_valid ? io_in_1_bits_status_ube : io_in_2_bits_status_ube));
	assign io_out_bits_status_spie = (io_in_0_valid ? io_in_0_bits_status_spie : (io_in_1_valid ? io_in_1_bits_status_spie : io_in_2_bits_status_spie));
	assign io_out_bits_status_upie = (io_in_0_valid ? io_in_0_bits_status_upie : (io_in_1_valid ? io_in_1_bits_status_upie : io_in_2_bits_status_upie));
	assign io_out_bits_status_mie = (io_in_0_valid ? io_in_0_bits_status_mie : (io_in_1_valid ? io_in_1_bits_status_mie : io_in_2_bits_status_mie));
	assign io_out_bits_status_hie = (io_in_0_valid ? io_in_0_bits_status_hie : (io_in_1_valid ? io_in_1_bits_status_hie : io_in_2_bits_status_hie));
	assign io_out_bits_status_sie = (io_in_0_valid ? io_in_0_bits_status_sie : (io_in_1_valid ? io_in_1_bits_status_sie : io_in_2_bits_status_sie));
	assign io_out_bits_status_uie = (io_in_0_valid ? io_in_0_bits_status_uie : (io_in_1_valid ? io_in_1_bits_status_uie : io_in_2_bits_status_uie));
	assign io_out_bits_passthrough = (io_in_0_valid ? io_in_0_bits_passthrough : (io_in_1_valid ? io_in_1_bits_passthrough : io_in_2_bits_passthrough));
endmodule
