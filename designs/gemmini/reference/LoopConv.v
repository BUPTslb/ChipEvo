module LoopConv (
	clock,
	reset,
	io_in_ready,
	io_in_valid,
	io_in_bits_cmd_inst_funct,
	io_in_bits_cmd_inst_rs2,
	io_in_bits_cmd_inst_rs1,
	io_in_bits_cmd_inst_xd,
	io_in_bits_cmd_inst_xs1,
	io_in_bits_cmd_inst_xs2,
	io_in_bits_cmd_inst_rd,
	io_in_bits_cmd_inst_opcode,
	io_in_bits_cmd_rs1,
	io_in_bits_cmd_rs2,
	io_in_bits_cmd_status_debug,
	io_in_bits_cmd_status_cease,
	io_in_bits_cmd_status_wfi,
	io_in_bits_cmd_status_isa,
	io_in_bits_cmd_status_dprv,
	io_in_bits_cmd_status_dv,
	io_in_bits_cmd_status_prv,
	io_in_bits_cmd_status_v,
	io_in_bits_cmd_status_sd,
	io_in_bits_cmd_status_zero2,
	io_in_bits_cmd_status_mpv,
	io_in_bits_cmd_status_gva,
	io_in_bits_cmd_status_mbe,
	io_in_bits_cmd_status_sbe,
	io_in_bits_cmd_status_sxl,
	io_in_bits_cmd_status_uxl,
	io_in_bits_cmd_status_sd_rv32,
	io_in_bits_cmd_status_zero1,
	io_in_bits_cmd_status_tsr,
	io_in_bits_cmd_status_tw,
	io_in_bits_cmd_status_tvm,
	io_in_bits_cmd_status_mxr,
	io_in_bits_cmd_status_sum,
	io_in_bits_cmd_status_mprv,
	io_in_bits_cmd_status_xs,
	io_in_bits_cmd_status_fs,
	io_in_bits_cmd_status_mpp,
	io_in_bits_cmd_status_vs,
	io_in_bits_cmd_status_spp,
	io_in_bits_cmd_status_mpie,
	io_in_bits_cmd_status_ube,
	io_in_bits_cmd_status_spie,
	io_in_bits_cmd_status_upie,
	io_in_bits_cmd_status_mie,
	io_in_bits_cmd_status_hie,
	io_in_bits_cmd_status_sie,
	io_in_bits_cmd_status_uie,
	io_in_bits_rob_id_valid,
	io_in_bits_rob_id_bits,
	io_in_bits_from_matmul_fsm,
	io_in_bits_from_conv_fsm,
	io_out_ready,
	io_out_valid,
	io_out_bits_cmd_inst_funct,
	io_out_bits_cmd_inst_rs2,
	io_out_bits_cmd_inst_rs1,
	io_out_bits_cmd_inst_xd,
	io_out_bits_cmd_inst_xs1,
	io_out_bits_cmd_inst_xs2,
	io_out_bits_cmd_inst_rd,
	io_out_bits_cmd_inst_opcode,
	io_out_bits_cmd_rs1,
	io_out_bits_cmd_rs2,
	io_out_bits_cmd_status_debug,
	io_out_bits_cmd_status_cease,
	io_out_bits_cmd_status_wfi,
	io_out_bits_cmd_status_isa,
	io_out_bits_cmd_status_dprv,
	io_out_bits_cmd_status_dv,
	io_out_bits_cmd_status_prv,
	io_out_bits_cmd_status_v,
	io_out_bits_cmd_status_sd,
	io_out_bits_cmd_status_zero2,
	io_out_bits_cmd_status_mpv,
	io_out_bits_cmd_status_gva,
	io_out_bits_cmd_status_mbe,
	io_out_bits_cmd_status_sbe,
	io_out_bits_cmd_status_sxl,
	io_out_bits_cmd_status_uxl,
	io_out_bits_cmd_status_sd_rv32,
	io_out_bits_cmd_status_zero1,
	io_out_bits_cmd_status_tsr,
	io_out_bits_cmd_status_tw,
	io_out_bits_cmd_status_tvm,
	io_out_bits_cmd_status_mxr,
	io_out_bits_cmd_status_sum,
	io_out_bits_cmd_status_mprv,
	io_out_bits_cmd_status_xs,
	io_out_bits_cmd_status_fs,
	io_out_bits_cmd_status_mpp,
	io_out_bits_cmd_status_vs,
	io_out_bits_cmd_status_spp,
	io_out_bits_cmd_status_mpie,
	io_out_bits_cmd_status_ube,
	io_out_bits_cmd_status_spie,
	io_out_bits_cmd_status_upie,
	io_out_bits_cmd_status_mie,
	io_out_bits_cmd_status_hie,
	io_out_bits_cmd_status_sie,
	io_out_bits_cmd_status_uie,
	io_out_bits_from_matmul_fsm,
	io_out_bits_from_conv_fsm,
	io_ld_completed,
	io_st_completed,
	io_ex_completed,
	io_busy
);
	input clock;
	input reset;
	output wire io_in_ready;
	input io_in_valid;
	input [6:0] io_in_bits_cmd_inst_funct;
	input [4:0] io_in_bits_cmd_inst_rs2;
	input [4:0] io_in_bits_cmd_inst_rs1;
	input io_in_bits_cmd_inst_xd;
	input io_in_bits_cmd_inst_xs1;
	input io_in_bits_cmd_inst_xs2;
	input [4:0] io_in_bits_cmd_inst_rd;
	input [6:0] io_in_bits_cmd_inst_opcode;
	input [63:0] io_in_bits_cmd_rs1;
	input [63:0] io_in_bits_cmd_rs2;
	input io_in_bits_cmd_status_debug;
	input io_in_bits_cmd_status_cease;
	input io_in_bits_cmd_status_wfi;
	input [31:0] io_in_bits_cmd_status_isa;
	input [1:0] io_in_bits_cmd_status_dprv;
	input io_in_bits_cmd_status_dv;
	input [1:0] io_in_bits_cmd_status_prv;
	input io_in_bits_cmd_status_v;
	input io_in_bits_cmd_status_sd;
	input [22:0] io_in_bits_cmd_status_zero2;
	input io_in_bits_cmd_status_mpv;
	input io_in_bits_cmd_status_gva;
	input io_in_bits_cmd_status_mbe;
	input io_in_bits_cmd_status_sbe;
	input [1:0] io_in_bits_cmd_status_sxl;
	input [1:0] io_in_bits_cmd_status_uxl;
	input io_in_bits_cmd_status_sd_rv32;
	input [7:0] io_in_bits_cmd_status_zero1;
	input io_in_bits_cmd_status_tsr;
	input io_in_bits_cmd_status_tw;
	input io_in_bits_cmd_status_tvm;
	input io_in_bits_cmd_status_mxr;
	input io_in_bits_cmd_status_sum;
	input io_in_bits_cmd_status_mprv;
	input [1:0] io_in_bits_cmd_status_xs;
	input [1:0] io_in_bits_cmd_status_fs;
	input [1:0] io_in_bits_cmd_status_mpp;
	input [1:0] io_in_bits_cmd_status_vs;
	input io_in_bits_cmd_status_spp;
	input io_in_bits_cmd_status_mpie;
	input io_in_bits_cmd_status_ube;
	input io_in_bits_cmd_status_spie;
	input io_in_bits_cmd_status_upie;
	input io_in_bits_cmd_status_mie;
	input io_in_bits_cmd_status_hie;
	input io_in_bits_cmd_status_sie;
	input io_in_bits_cmd_status_uie;
	input io_in_bits_rob_id_valid;
	input [5:0] io_in_bits_rob_id_bits;
	input io_in_bits_from_matmul_fsm;
	input io_in_bits_from_conv_fsm;
	input io_out_ready;
	output wire io_out_valid;
	output wire [6:0] io_out_bits_cmd_inst_funct;
	output wire [4:0] io_out_bits_cmd_inst_rs2;
	output wire [4:0] io_out_bits_cmd_inst_rs1;
	output wire io_out_bits_cmd_inst_xd;
	output wire io_out_bits_cmd_inst_xs1;
	output wire io_out_bits_cmd_inst_xs2;
	output wire [4:0] io_out_bits_cmd_inst_rd;
	output wire [6:0] io_out_bits_cmd_inst_opcode;
	output wire [63:0] io_out_bits_cmd_rs1;
	output wire [63:0] io_out_bits_cmd_rs2;
	output wire io_out_bits_cmd_status_debug;
	output wire io_out_bits_cmd_status_cease;
	output wire io_out_bits_cmd_status_wfi;
	output wire [31:0] io_out_bits_cmd_status_isa;
	output wire [1:0] io_out_bits_cmd_status_dprv;
	output wire io_out_bits_cmd_status_dv;
	output wire [1:0] io_out_bits_cmd_status_prv;
	output wire io_out_bits_cmd_status_v;
	output wire io_out_bits_cmd_status_sd;
	output wire [22:0] io_out_bits_cmd_status_zero2;
	output wire io_out_bits_cmd_status_mpv;
	output wire io_out_bits_cmd_status_gva;
	output wire io_out_bits_cmd_status_mbe;
	output wire io_out_bits_cmd_status_sbe;
	output wire [1:0] io_out_bits_cmd_status_sxl;
	output wire [1:0] io_out_bits_cmd_status_uxl;
	output wire io_out_bits_cmd_status_sd_rv32;
	output wire [7:0] io_out_bits_cmd_status_zero1;
	output wire io_out_bits_cmd_status_tsr;
	output wire io_out_bits_cmd_status_tw;
	output wire io_out_bits_cmd_status_tvm;
	output wire io_out_bits_cmd_status_mxr;
	output wire io_out_bits_cmd_status_sum;
	output wire io_out_bits_cmd_status_mprv;
	output wire [1:0] io_out_bits_cmd_status_xs;
	output wire [1:0] io_out_bits_cmd_status_fs;
	output wire [1:0] io_out_bits_cmd_status_mpp;
	output wire [1:0] io_out_bits_cmd_status_vs;
	output wire io_out_bits_cmd_status_spp;
	output wire io_out_bits_cmd_status_mpie;
	output wire io_out_bits_cmd_status_ube;
	output wire io_out_bits_cmd_status_spie;
	output wire io_out_bits_cmd_status_upie;
	output wire io_out_bits_cmd_status_mie;
	output wire io_out_bits_cmd_status_hie;
	output wire io_out_bits_cmd_status_sie;
	output wire io_out_bits_cmd_status_uie;
	output wire io_out_bits_from_matmul_fsm;
	output wire io_out_bits_from_conv_fsm;
	input [5:0] io_ld_completed;
	input [5:0] io_st_completed;
	input [5:0] io_ex_completed;
	output wire io_busy;
	wire _arb_io_in_0_ready;
	wire _arb_io_in_1_ready;
	wire _arb_io_in_2_ready;
	wire _arb_io_in_3_ready;
	wire _arb_io_in_4_ready;
	wire _arb_io_out_valid;
	wire [6:0] _arb_io_out_bits_inst_funct;
	wire [63:0] _arb_io_out_bits_rs1;
	wire [63:0] _arb_io_out_bits_rs2;
	wire _cmd_q_io_deq_valid;
	wire [6:0] _cmd_q_io_deq_bits_cmd_inst_funct;
	wire [4:0] _cmd_q_io_deq_bits_cmd_inst_rs2;
	wire [4:0] _cmd_q_io_deq_bits_cmd_inst_rs1;
	wire _cmd_q_io_deq_bits_cmd_inst_xd;
	wire _cmd_q_io_deq_bits_cmd_inst_xs1;
	wire _cmd_q_io_deq_bits_cmd_inst_xs2;
	wire [4:0] _cmd_q_io_deq_bits_cmd_inst_rd;
	wire [6:0] _cmd_q_io_deq_bits_cmd_inst_opcode;
	wire [63:0] _cmd_q_io_deq_bits_cmd_rs1;
	wire [63:0] _cmd_q_io_deq_bits_cmd_rs2;
	wire _cmd_q_io_deq_bits_from_matmul_fsm;
	wire _cmd_q_io_deq_bits_from_conv_fsm;
	wire _st_io_req_ready;
	wire _st_io_cmd_valid;
	wire [6:0] _st_io_cmd_bits_inst_funct;
	wire [63:0] _st_io_cmd_bits_rs1;
	wire [63:0] _st_io_cmd_bits_rs2;
	wire _st_io_idle;
	wire _st_io_loop_id;
	wire _ex_io_req_ready;
	wire _ex_io_cmd_valid;
	wire [6:0] _ex_io_cmd_bits_inst_funct;
	wire [63:0] _ex_io_cmd_bits_rs1;
	wire [63:0] _ex_io_cmd_bits_rs2;
	wire _ex_io_idle;
	wire _ex_io_loop_id;
	wire _ld_weights_io_req_ready;
	wire _ld_weights_io_cmd_valid;
	wire [6:0] _ld_weights_io_cmd_bits_inst_funct;
	wire [63:0] _ld_weights_io_cmd_bits_rs1;
	wire [63:0] _ld_weights_io_cmd_bits_rs2;
	wire _ld_weights_io_idle;
	wire _ld_weights_io_loop_id;
	wire _ld_input_io_req_ready;
	wire _ld_input_io_cmd_valid;
	wire [6:0] _ld_input_io_cmd_bits_inst_funct;
	wire [63:0] _ld_input_io_cmd_bits_rs1;
	wire [63:0] _ld_input_io_cmd_bits_rs2;
	wire _ld_input_io_idle;
	wire _ld_input_io_loop_id;
	wire _ld_bias_io_req_ready;
	wire _ld_bias_io_cmd_valid;
	wire [6:0] _ld_bias_io_cmd_bits_inst_funct;
	wire [63:0] _ld_bias_io_cmd_bits_rs1;
	wire [63:0] _ld_bias_io_cmd_bits_rs2;
	wire _ld_bias_io_idle;
	wire _ld_bias_io_loop_id;
	reg [15:0] loops_0_outer_bounds_batch_size;
	reg [15:0] loops_0_outer_bounds_in_row_dim;
	reg [15:0] loops_0_outer_bounds_in_col_dim;
	reg [15:0] loops_0_outer_bounds_in_channels;
	reg [15:0] loops_0_outer_bounds_out_channels;
	reg [15:0] loops_0_outer_bounds_out_col_dim;
	reg [15:0] loops_0_outer_bounds_out_row_dim;
	reg [15:0] loops_0_outer_bounds_out_stride;
	reg [15:0] loops_0_outer_bounds_in_stride;
	reg [15:0] loops_0_outer_bounds_weight_stride;
	reg [15:0] loops_0_outer_bounds_pool_out_row_dim;
	reg [15:0] loops_0_outer_bounds_pool_out_col_dim;
	reg [15:0] loops_0_outer_bounds_stride;
	reg [15:0] loops_0_outer_bounds_kernel_dim;
	reg [15:0] loops_0_outer_bounds_kernel_dilation;
	reg [15:0] loops_0_outer_bounds_pool_size;
	reg [15:0] loops_0_outer_bounds_pool_stride;
	reg [15:0] loops_0_inner_bounds_batches;
	reg [15:0] loops_0_inner_bounds_porows;
	reg [15:0] loops_0_inner_bounds_pocols;
	reg [15:0] loops_0_inner_bounds_pochs;
	reg [15:0] loops_0_inner_bounds_krows;
	reg [15:0] loops_0_inner_bounds_kcols;
	reg [15:0] loops_0_inner_bounds_kchs;
	reg [15:0] loops_0_inner_bounds_lpad;
	reg [15:0] loops_0_inner_bounds_rpad;
	reg [15:0] loops_0_inner_bounds_upad;
	reg [15:0] loops_0_inner_bounds_dpad;
	reg [15:0] loops_0_inner_bounds_plpad;
	reg [15:0] loops_0_inner_bounds_pupad;
	reg [15:0] loops_0_inner_bounds_orows;
	reg [15:0] loops_0_inner_bounds_ocols;
	reg [39:0] loops_0_bias_dram_addr;
	reg [39:0] loops_0_weights_dram_addr;
	reg [39:0] loops_0_input_dram_addr;
	reg [39:0] loops_0_output_dram_addr;
	reg loops_0_no_bias;
	reg loops_0_wrot180;
	reg loops_0_no_pool;
	reg loops_0_downsample;
	reg loops_0_input_dilated;
	reg [1:0] loops_0_activation;
	reg loops_0_trans_output_1203;
	reg loops_0_trans_weight_1203;
	reg loops_0_trans_weight_0132;
	reg loops_0_trans_input_3120;
	reg loops_0_dw;
	reg [15:0] loops_0_max_pixels_per_row;
	reg [1:0] loops_0_a_ex_spad_id;
	reg [1:0] loops_0_b_ex_spad_id;
	reg loops_0_configured;
	reg loops_0_running;
	reg loops_0_ld_bias_started;
	reg loops_0_ld_input_started;
	reg loops_0_ld_weights_started;
	reg loops_0_ex_started;
	reg loops_0_st_started;
	reg loops_0_ld_bias_completed;
	reg loops_0_ld_input_completed;
	reg loops_0_ld_weights_completed;
	reg loops_0_ex_completed;
	reg loops_0_st_completed;
	reg [15:0] loops_1_outer_bounds_batch_size;
	reg [15:0] loops_1_outer_bounds_in_row_dim;
	reg [15:0] loops_1_outer_bounds_in_col_dim;
	reg [15:0] loops_1_outer_bounds_in_channels;
	reg [15:0] loops_1_outer_bounds_out_channels;
	reg [15:0] loops_1_outer_bounds_out_col_dim;
	reg [15:0] loops_1_outer_bounds_out_row_dim;
	reg [15:0] loops_1_outer_bounds_out_stride;
	reg [15:0] loops_1_outer_bounds_in_stride;
	reg [15:0] loops_1_outer_bounds_weight_stride;
	reg [15:0] loops_1_outer_bounds_pool_out_row_dim;
	reg [15:0] loops_1_outer_bounds_pool_out_col_dim;
	reg [15:0] loops_1_outer_bounds_stride;
	reg [15:0] loops_1_outer_bounds_kernel_dim;
	reg [15:0] loops_1_outer_bounds_kernel_dilation;
	reg [15:0] loops_1_outer_bounds_pool_size;
	reg [15:0] loops_1_outer_bounds_pool_stride;
	reg [15:0] loops_1_inner_bounds_batches;
	reg [15:0] loops_1_inner_bounds_porows;
	reg [15:0] loops_1_inner_bounds_pocols;
	reg [15:0] loops_1_inner_bounds_pochs;
	reg [15:0] loops_1_inner_bounds_krows;
	reg [15:0] loops_1_inner_bounds_kcols;
	reg [15:0] loops_1_inner_bounds_kchs;
	reg [15:0] loops_1_inner_bounds_lpad;
	reg [15:0] loops_1_inner_bounds_rpad;
	reg [15:0] loops_1_inner_bounds_upad;
	reg [15:0] loops_1_inner_bounds_dpad;
	reg [15:0] loops_1_inner_bounds_plpad;
	reg [15:0] loops_1_inner_bounds_pupad;
	reg [15:0] loops_1_inner_bounds_orows;
	reg [15:0] loops_1_inner_bounds_ocols;
	reg [39:0] loops_1_bias_dram_addr;
	reg [39:0] loops_1_weights_dram_addr;
	reg [39:0] loops_1_input_dram_addr;
	reg [39:0] loops_1_output_dram_addr;
	reg loops_1_no_bias;
	reg loops_1_wrot180;
	reg loops_1_no_pool;
	reg loops_1_downsample;
	reg loops_1_input_dilated;
	reg [1:0] loops_1_activation;
	reg loops_1_trans_output_1203;
	reg loops_1_trans_weight_1203;
	reg loops_1_trans_weight_0132;
	reg loops_1_trans_input_3120;
	reg loops_1_dw;
	reg [15:0] loops_1_max_pixels_per_row;
	reg [1:0] loops_1_a_ex_spad_id;
	reg [1:0] loops_1_b_ex_spad_id;
	reg loops_1_configured;
	reg loops_1_running;
	reg loops_1_ld_bias_started;
	reg loops_1_ld_input_started;
	reg loops_1_ld_weights_started;
	reg loops_1_ex_started;
	reg loops_1_st_started;
	reg loops_1_ld_bias_completed;
	reg loops_1_ld_input_completed;
	reg loops_1_ld_weights_completed;
	reg loops_1_ex_completed;
	reg loops_1_st_completed;
	reg head_loop_id;
	wire loop_configured = loops_0_configured | loops_1_configured;
	wire loop_being_configured_id = (head_loop_id ? loops_1_configured : loops_0_configured) ^ head_loop_id;
	reg [3:0] ld_utilization;
	reg [2:0] st_utilization;
	reg [4:0] ex_utilization;
	always @(posedge clock) begin
		if (~reset & ({2'h0, ld_utilization} < io_ld_completed)) begin
// synopsys translate_off
			$error("Assertion failed: ld utilization underflow\n    at LoopConv.scala:1237 assert(ld_utilization >= io.ld_completed, \"ld utilization underflow\")\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (~reset & ({3'h0, st_utilization} < io_st_completed)) begin
// synopsys translate_off
			$error("Assertion failed: st utilization underflow\n    at LoopConv.scala:1238 assert(st_utilization >= io.st_completed, \"st utilization underflow\")\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (~reset & ({1'h0, ex_utilization} < io_ex_completed)) begin
// synopsys translate_off
			$error("Assertion failed: ex utilization underflow\n    at LoopConv.scala:1239 assert(ex_utilization >= io.ex_completed, \"ex utilization underflow\")\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	end
	wire is_loop_run_cmd = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h0f;
	wire is_loop_config_cmd = |_cmd_q_io_deq_bits_cmd_inst_funct[6:4] & (_cmd_q_io_deq_bits_cmd_inst_funct < 7'h16);
	wire is_loop_cmd = is_loop_run_cmd | is_loop_config_cmd;
	wire _GEN = (loop_being_configured_id ? loops_1_configured : loops_0_configured);
	wire _GEN_0 = (_ex_io_loop_id ? loops_1_ex_started : loops_0_ex_started);
	wire ex_is_waiting_for_loads = (_GEN_0 & ~(_ex_io_loop_id ? loops_1_ex_completed : loops_0_ex_completed)) & ~(((_ex_io_loop_id ? loops_1_ld_input_completed : loops_0_ld_input_completed) & (_ex_io_loop_id ? loops_1_ld_weights_completed : loops_0_ld_weights_completed)) & (_ex_io_loop_id ? loops_1_ld_bias_completed : loops_0_ld_bias_completed));
	wire _ex_io_ldd_completed_T = _ld_bias_io_loop_id != _ex_io_loop_id;
	wire _ex_io_ldb_completed_T = _ld_weights_io_loop_id != _ex_io_loop_id;
	wire _ex_io_lda_completed_T = _ld_input_io_loop_id != _ex_io_loop_id;
	reg [9:0] ld_bias_addr_start;
	reg [9:0] ex_c_addr_start;
	reg [9:0] st_addr_start;
	wire loop_requesting_ld_bias_id = (head_loop_id ? loops_1_ld_bias_started : loops_0_ld_bias_started) ^ head_loop_id;
	wire [15:0] _GEN_1 = (loop_requesting_ld_bias_id ? loops_1_inner_bounds_batches : loops_0_inner_bounds_batches);
	wire [15:0] _GEN_2 = (loop_requesting_ld_bias_id ? loops_1_inner_bounds_orows : loops_0_inner_bounds_orows);
	wire [15:0] _GEN_3 = (loop_requesting_ld_bias_id ? loops_1_inner_bounds_ocols : loops_0_inner_bounds_ocols);
	wire _ld_bias_io_req_valid_T_1 = ~(loop_requesting_ld_bias_id ? loops_1_ld_bias_started : loops_0_ld_bias_started) & (loop_requesting_ld_bias_id ? loops_1_configured : loops_0_configured);
	wire loop_requesting_ld_input_id = (head_loop_id ? loops_1_ld_input_started : loops_0_ld_input_started) ^ head_loop_id;
	wire [15:0] _GEN_4 = (loop_requesting_ld_input_id ? loops_1_inner_bounds_batches : loops_0_inner_bounds_batches);
	wire [15:0] _GEN_5 = (loop_requesting_ld_input_id ? loops_1_inner_bounds_krows : loops_0_inner_bounds_krows);
	wire [15:0] _GEN_6 = (loop_requesting_ld_input_id ? loops_1_inner_bounds_kcols : loops_0_inner_bounds_kcols);
	wire [15:0] ld_input_io_req_bits_derived_params_result_ichs = (loop_requesting_ld_input_id ? loops_1_inner_bounds_kchs : loops_0_inner_bounds_kchs);
	wire [15:0] _GEN_7 = (loop_requesting_ld_input_id ? loops_1_inner_bounds_lpad : loops_0_inner_bounds_lpad);
	wire [15:0] _GEN_8 = (loop_requesting_ld_input_id ? loops_1_inner_bounds_rpad : loops_0_inner_bounds_rpad);
	wire [15:0] _GEN_9 = (loop_requesting_ld_input_id ? loops_1_inner_bounds_upad : loops_0_inner_bounds_upad);
	wire [15:0] _GEN_10 = (loop_requesting_ld_input_id ? loops_1_inner_bounds_dpad : loops_0_inner_bounds_dpad);
	wire _GEN_11 = (loop_requesting_ld_input_id ? loops_1_downsample : loops_0_downsample);
	wire _GEN_12 = (loop_requesting_ld_input_id ? loops_1_input_dilated : loops_0_input_dilated);
	wire _GEN_13 = (loop_requesting_ld_input_id ? loops_1_trans_input_3120 : loops_0_trans_input_3120);
	wire [1:0] _GEN_14 = (loop_requesting_ld_input_id ? loops_1_a_ex_spad_id : loops_0_a_ex_spad_id);
	wire [31:0] _GEN_15 = {16'h0000, (loop_requesting_ld_input_id ? loops_1_outer_bounds_kernel_dilation : loops_0_outer_bounds_kernel_dilation) - 16'h0001};
	wire [31:0] _GEN_16 = {16'h0000, (loop_requesting_ld_input_id ? loops_1_outer_bounds_stride : loops_0_outer_bounds_stride)};
	wire [33:0] ld_input_io_req_bits_derived_params_irows_without_dilation = {1'h0, {1'h0, {16'h0000, (loop_requesting_ld_input_id ? loops_1_inner_bounds_orows : loops_0_inner_bounds_orows)} * _GEN_16} + {1'h0, {16'h0000, _GEN_5} + (_GEN_15 * {16'h0000, _GEN_5 - 16'h0001})}} - 34'h000000001;
	wire [33:0] ld_input_io_req_bits_derived_params_icols_without_dilation = {1'h0, {1'h0, {16'h0000, (loop_requesting_ld_input_id ? loops_1_inner_bounds_ocols : loops_0_inner_bounds_ocols)} * _GEN_16} + {1'h0, {16'h0000, _GEN_6} + (_GEN_15 * {16'h0000, _GEN_6 - 16'h0001})}} - 34'h000000001;
	wire [36:0] _GEN_17 = {36'h000000000, _GEN_12};
	wire [36:0] ld_input_io_req_bits_derived_params_irows_unpadded = ({1'h0, {1'h0, {1'h0, ld_input_io_req_bits_derived_params_irows_without_dilation} - {19'h00000, _GEN_9}} - {20'h00000, _GEN_10}} + _GEN_17) >> _GEN_17;
	wire [36:0] ld_input_io_req_bits_derived_params_icols_unpadded = ({1'h0, {1'h0, {1'h0, ld_input_io_req_bits_derived_params_icols_without_dilation} - {19'h00000, _GEN_7}} - {20'h00000, _GEN_8}} + _GEN_17) >> _GEN_17;
	wire [16:0] _GEN_18 = {16'h0000, _GEN_12};
	wire [16:0] _ld_input_io_req_bits_derived_params_result_irows_T_1 = ({1'h0, _GEN_9} + _GEN_18) >> _GEN_18;
	wire [16:0] _ld_input_io_req_bits_derived_params_result_irows_T_4 = ({1'h0, _GEN_10} + _GEN_18) >> _GEN_18;
	wire [15:0] _ld_input_io_req_bits_derived_params_result_irows_T_6 = (_GEN_12 ? (ld_input_io_req_bits_derived_params_irows_unpadded[15:0] + _ld_input_io_req_bits_derived_params_result_irows_T_1[15:0]) + _ld_input_io_req_bits_derived_params_result_irows_T_4[15:0] : ld_input_io_req_bits_derived_params_irows_without_dilation[15:0]);
	wire [16:0] _ld_input_io_req_bits_derived_params_result_icols_T_1 = ({1'h0, _GEN_7} + _GEN_18) >> _GEN_18;
	wire [16:0] _ld_input_io_req_bits_derived_params_result_icols_T_4 = ({1'h0, _GEN_8} + _GEN_18) >> _GEN_18;
	wire [15:0] _ld_input_io_req_bits_derived_params_result_icols_T_6 = (_GEN_12 ? (ld_input_io_req_bits_derived_params_icols_unpadded[15:0] + _ld_input_io_req_bits_derived_params_result_icols_T_1[15:0]) + _ld_input_io_req_bits_derived_params_result_icols_T_4[15:0] : ld_input_io_req_bits_derived_params_icols_without_dilation[15:0]);
	wire [15:0] _GEN_19 = {15'h0000, _GEN_11};
	wire [15:0] _ld_input_io_req_bits_derived_params_result_input_spad_stride_T_4 = _ld_input_io_req_bits_derived_params_result_irows_T_6 >> _GEN_19;
	wire [15:0] _ld_input_io_req_bits_derived_params_result_input_spad_stride_T_6 = _ld_input_io_req_bits_derived_params_result_icols_T_6 >> _GEN_19;
	wire _ld_input_io_req_valid_T_1 = ~(loop_requesting_ld_input_id ? loops_1_ld_input_started : loops_0_ld_input_started) & (loop_requesting_ld_input_id ? loops_1_configured : loops_0_configured);
	wire loop_requesting_ld_weights_id = (head_loop_id ? loops_1_ld_weights_started : loops_0_ld_weights_started) ^ head_loop_id;
	wire [15:0] ld_weights_io_req_bits_derived_params_result_ochs = (loop_requesting_ld_weights_id ? loops_1_inner_bounds_pochs : loops_0_inner_bounds_pochs);
	wire [15:0] _GEN_20 = (loop_requesting_ld_weights_id ? loops_1_inner_bounds_krows : loops_0_inner_bounds_krows);
	wire [15:0] _GEN_21 = (loop_requesting_ld_weights_id ? loops_1_inner_bounds_kcols : loops_0_inner_bounds_kcols);
	wire [15:0] ld_weights_io_req_bits_derived_params_result_ichs = (loop_requesting_ld_weights_id ? loops_1_inner_bounds_kchs : loops_0_inner_bounds_kchs);
	wire _GEN_22 = (loop_requesting_ld_weights_id ? loops_1_trans_weight_0132 : loops_0_trans_weight_0132);
	wire [1:0] _GEN_23 = (loop_requesting_ld_weights_id ? loops_1_b_ex_spad_id : loops_0_b_ex_spad_id);
	wire [15:0] _ld_weights_io_req_bits_derived_params_result_out_channels_per_bank_T_1 = ld_weights_io_req_bits_derived_params_result_ochs % 16'h0010;
	wire [15:0] _ld_weights_io_req_bits_derived_params_result_in_channels_per_bank_T_1 = ld_weights_io_req_bits_derived_params_result_ichs % 16'h0010;
	wire [15:0] _ld_weights_io_req_bits_derived_params_result_weight_spad_stride_T_2 = _GEN_20 * _GEN_21;
	wire _ld_weights_io_req_valid_T_1 = ~(loop_requesting_ld_weights_id ? loops_1_ld_weights_started : loops_0_ld_weights_started) & (loop_requesting_ld_weights_id ? loops_1_configured : loops_0_configured);
	wire loop_requesting_ex_id = (head_loop_id ? loops_1_ex_started : loops_0_ex_started) ^ head_loop_id;
	wire [15:0] _GEN_24 = (loop_requesting_ex_id ? loops_1_outer_bounds_stride : loops_0_outer_bounds_stride);
	wire [15:0] _GEN_25 = (loop_requesting_ex_id ? loops_1_outer_bounds_kernel_dilation : loops_0_outer_bounds_kernel_dilation);
	wire [15:0] _GEN_26 = (loop_requesting_ex_id ? loops_1_inner_bounds_batches : loops_0_inner_bounds_batches);
	wire [15:0] ex_io_req_bits_derived_params_result_ochs = (loop_requesting_ex_id ? loops_1_inner_bounds_pochs : loops_0_inner_bounds_pochs);
	wire [15:0] _GEN_27 = (loop_requesting_ex_id ? loops_1_inner_bounds_krows : loops_0_inner_bounds_krows);
	wire [15:0] _GEN_28 = (loop_requesting_ex_id ? loops_1_inner_bounds_kcols : loops_0_inner_bounds_kcols);
	wire [15:0] ex_io_req_bits_derived_params_result_ichs = (loop_requesting_ex_id ? loops_1_inner_bounds_kchs : loops_0_inner_bounds_kchs);
	wire [15:0] _GEN_29 = (loop_requesting_ex_id ? loops_1_inner_bounds_lpad : loops_0_inner_bounds_lpad);
	wire [15:0] _GEN_30 = (loop_requesting_ex_id ? loops_1_inner_bounds_rpad : loops_0_inner_bounds_rpad);
	wire [15:0] _GEN_31 = (loop_requesting_ex_id ? loops_1_inner_bounds_upad : loops_0_inner_bounds_upad);
	wire [15:0] _GEN_32 = (loop_requesting_ex_id ? loops_1_inner_bounds_dpad : loops_0_inner_bounds_dpad);
	wire [15:0] _GEN_33 = (loop_requesting_ex_id ? loops_1_inner_bounds_orows : loops_0_inner_bounds_orows);
	wire [15:0] _GEN_34 = (loop_requesting_ex_id ? loops_1_inner_bounds_ocols : loops_0_inner_bounds_ocols);
	wire _GEN_35 = (loop_requesting_ex_id ? loops_1_downsample : loops_0_downsample);
	wire _GEN_36 = (loop_requesting_ex_id ? loops_1_input_dilated : loops_0_input_dilated);
	wire _GEN_37 = (loop_requesting_ex_id ? loops_1_trans_input_3120 : loops_0_trans_input_3120);
	wire [1:0] _GEN_38 = (loop_requesting_ex_id ? loops_1_a_ex_spad_id : loops_0_a_ex_spad_id);
	wire [1:0] _GEN_39 = (loop_requesting_ex_id ? loops_1_b_ex_spad_id : loops_0_b_ex_spad_id);
	wire [31:0] _GEN_40 = {16'h0000, _GEN_25 - 16'h0001};
	wire [31:0] _GEN_41 = {16'h0000, _GEN_24};
	wire [33:0] ex_io_req_bits_derived_params_irows_without_dilation = {1'h0, {1'h0, {16'h0000, _GEN_33} * _GEN_41} + {1'h0, {16'h0000, _GEN_27} + (_GEN_40 * {16'h0000, _GEN_27 - 16'h0001})}} - 34'h000000001;
	wire [33:0] ex_io_req_bits_derived_params_icols_without_dilation = {1'h0, {1'h0, {16'h0000, _GEN_34} * _GEN_41} + {1'h0, {16'h0000, _GEN_28} + (_GEN_40 * {16'h0000, _GEN_28 - 16'h0001})}} - 34'h000000001;
	wire [36:0] _GEN_42 = {36'h000000000, _GEN_36};
	wire [36:0] ex_io_req_bits_derived_params_irows_unpadded = ({1'h0, {1'h0, {1'h0, ex_io_req_bits_derived_params_irows_without_dilation} - {19'h00000, _GEN_31}} - {20'h00000, _GEN_32}} + _GEN_42) >> _GEN_42;
	wire [36:0] ex_io_req_bits_derived_params_icols_unpadded = ({1'h0, {1'h0, {1'h0, ex_io_req_bits_derived_params_icols_without_dilation} - {19'h00000, _GEN_29}} - {20'h00000, _GEN_30}} + _GEN_42) >> _GEN_42;
	wire [16:0] _GEN_43 = {16'h0000, _GEN_36};
	wire [16:0] _ex_io_req_bits_derived_params_result_irows_T_1 = ({1'h0, _GEN_31} + _GEN_43) >> _GEN_43;
	wire [16:0] _ex_io_req_bits_derived_params_result_irows_T_4 = ({1'h0, _GEN_32} + _GEN_43) >> _GEN_43;
	wire [15:0] _ex_io_req_bits_derived_params_result_irows_T_6 = (_GEN_36 ? (ex_io_req_bits_derived_params_irows_unpadded[15:0] + _ex_io_req_bits_derived_params_result_irows_T_1[15:0]) + _ex_io_req_bits_derived_params_result_irows_T_4[15:0] : ex_io_req_bits_derived_params_irows_without_dilation[15:0]);
	wire [16:0] _ex_io_req_bits_derived_params_result_icols_T_1 = ({1'h0, _GEN_29} + _GEN_43) >> _GEN_43;
	wire [16:0] _ex_io_req_bits_derived_params_result_icols_T_4 = ({1'h0, _GEN_30} + _GEN_43) >> _GEN_43;
	wire [15:0] _ex_io_req_bits_derived_params_result_icols_T_6 = (_GEN_36 ? (ex_io_req_bits_derived_params_icols_unpadded[15:0] + _ex_io_req_bits_derived_params_result_icols_T_1[15:0]) + _ex_io_req_bits_derived_params_result_icols_T_4[15:0] : ex_io_req_bits_derived_params_icols_without_dilation[15:0]);
	wire [15:0] _ex_io_req_bits_derived_params_result_out_channels_per_bank_T_1 = ex_io_req_bits_derived_params_result_ochs % 16'h0010;
	wire [15:0] _ex_io_req_bits_derived_params_result_in_channels_per_bank_T_1 = ex_io_req_bits_derived_params_result_ichs % 16'h0010;
	wire [15:0] _GEN_44 = {15'h0000, _GEN_35};
	wire [15:0] _ex_io_req_bits_derived_params_result_input_spad_stride_T_4 = _ex_io_req_bits_derived_params_result_irows_T_6 >> _GEN_44;
	wire [15:0] _ex_io_req_bits_derived_params_result_input_spad_stride_T_6 = _ex_io_req_bits_derived_params_result_icols_T_6 >> _GEN_44;
	wire _ex_io_req_valid_T_4 = (((~(loop_requesting_ex_id ? loops_1_ex_started : loops_0_ex_started) & (loop_requesting_ex_id ? loops_1_ld_bias_started : loops_0_ld_bias_started)) & (loop_requesting_ex_id ? loops_1_ld_input_started : loops_0_ld_input_started)) & (loop_requesting_ex_id ? loops_1_ld_weights_started : loops_0_ld_weights_started)) & (loop_requesting_ex_id ? loops_1_configured : loops_0_configured);
	wire loop_requesting_st_id = (head_loop_id ? loops_1_st_started : loops_0_st_started) ^ head_loop_id;
	wire [39:0] _GEN_45 = (loop_requesting_st_id ? loops_1_output_dram_addr : loops_0_output_dram_addr);
	wire _st_io_req_valid_T_2 = (~(loop_requesting_st_id ? loops_1_st_started : loops_0_st_started) & (loop_requesting_st_id ? loops_1_ex_started : loops_0_ex_started)) & (loop_requesting_st_id ? loops_1_configured : loops_0_configured);
	wire [10:0] _ld_bias_addr_start_T_3 = {1'h0, ld_bias_addr_start} + 11'h200;
	wire [10:0] _ex_c_addr_start_T_3 = {1'h0, ex_c_addr_start} + 11'h200;
	wire [10:0] _st_addr_start_T_3 = {1'h0, st_addr_start} + 11'h200;
	wire _GEN_46 = (_cmd_q_io_deq_valid & is_loop_cmd) & ~_GEN;
	wire _GEN_47 = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h10;
	wire [15:0] _GEN_48 = {8'h00, _cmd_q_io_deq_bits_cmd_rs2[55:48]};
	wire _GEN_49 = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h11;
	wire _GEN_50 = (~_GEN_46 | _GEN_47) | ~(_GEN_49 & ~loop_being_configured_id);
	wire _GEN_51 = (~_GEN_46 | _GEN_47) | ~(_GEN_49 & loop_being_configured_id);
	wire [15:0] _GEN_52 = {8'h00, _cmd_q_io_deq_bits_cmd_rs1[15:8]};
	wire _GEN_53 = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h12;
	wire _GEN_54 = _GEN_47 | _GEN_49;
	wire _GEN_55 = (~_GEN_46 | _GEN_54) | ~(_GEN_53 & ~loop_being_configured_id);
	wire _GEN_56 = (~_GEN_46 | _GEN_54) | ~(_GEN_53 & loop_being_configured_id);
	wire [15:0] _GEN_57 = {8'h00, _cmd_q_io_deq_bits_cmd_rs2[31:24]};
	wire [15:0] _GEN_58 = {8'h00, _cmd_q_io_deq_bits_cmd_rs2[23:16]};
	wire _GEN_59 = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h13;
	wire _GEN_60 = (_GEN_47 | _GEN_49) | _GEN_53;
	wire _GEN_61 = (~_GEN_46 | _GEN_60) | ~(_GEN_59 & ~loop_being_configured_id);
	wire _GEN_62 = (~_GEN_46 | _GEN_60) | ~(_GEN_59 & loop_being_configured_id);
	wire [15:0] _GEN_63 = {5'h00, _cmd_q_io_deq_bits_cmd_rs1[31:21]};
	wire [15:0] _GEN_64 = {6'h00, _cmd_q_io_deq_bits_cmd_rs1[9:0]};
	wire _GEN_65 = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h14;
	wire _GEN_66 = ((_GEN_47 | _GEN_49) | _GEN_53) | _GEN_59;
	wire _GEN_67 = (~_GEN_46 | _GEN_66) | ~(_GEN_65 & ~loop_being_configured_id);
	wire _GEN_68 = (~_GEN_46 | _GEN_66) | ~(_GEN_65 & loop_being_configured_id);
	wire _GEN_69 = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h15;
	wire _GEN_70 = (((_GEN_47 | _GEN_49) | _GEN_53) | _GEN_59) | _GEN_65;
	wire _GEN_71 = (~_GEN_46 | _GEN_70) | ~(_GEN_69 & ~loop_being_configured_id);
	wire _GEN_72 = (~_GEN_46 | _GEN_70) | ~(_GEN_69 & loop_being_configured_id);
	wire _GEN_73 = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h0f;
	wire _GEN_74 = _GEN_73 & ~loop_being_configured_id;
	wire _GEN_75 = ((((_GEN_47 | _GEN_49) | _GEN_53) | _GEN_59) | _GEN_65) | _GEN_69;
	wire _GEN_76 = _GEN_73 & loop_being_configured_id;
	wire [15:0] _GEN_77 = {8'h00, (_cmd_q_io_deq_bits_cmd_rs1[15:8] == 8'h00 ? 8'h01 : _cmd_q_io_deq_bits_cmd_rs1[15:8])};
	wire _GEN_78 = _ld_bias_io_req_ready & _ld_bias_io_req_valid_T_1;
	wire _GEN_79 = _GEN_78 & ~loop_requesting_ld_bias_id;
	wire _GEN_80 = _GEN_78 & loop_requesting_ld_bias_id;
	wire _GEN_81 = _ld_input_io_req_ready & _ld_input_io_req_valid_T_1;
	wire _GEN_82 = (_GEN_81 ? (~loop_requesting_ld_input_id | _GEN_79) | loops_0_running : _GEN_79 | loops_0_running);
	wire _GEN_83 = (_GEN_81 ? (loop_requesting_ld_input_id | _GEN_80) | loops_1_running : _GEN_80 | loops_1_running);
	wire _GEN_84 = _ld_weights_io_req_ready & _ld_weights_io_req_valid_T_1;
	wire _GEN_85 = _GEN_84 & ~loop_requesting_ld_weights_id;
	wire _GEN_86 = _GEN_84 & loop_requesting_ld_weights_id;
	wire _GEN_87 = _ex_io_req_ready & _ex_io_req_valid_T_4;
	wire _GEN_88 = _st_io_req_ready & _st_io_req_valid_T_2;
	wire _GEN_89 = _GEN_88 & ~loop_requesting_st_id;
	wire _GEN_90 = _GEN_88 & loop_requesting_st_id;
	wire _GEN_91 = (_ld_bias_io_idle & (_ld_bias_io_loop_id ? loops_1_running : loops_0_running)) & (_ld_bias_io_loop_id ? loops_1_ld_bias_started : loops_0_ld_bias_started);
	wire _GEN_92 = (_ld_input_io_idle & (_ld_input_io_loop_id ? loops_1_running : loops_0_running)) & (_ld_input_io_loop_id ? loops_1_ld_input_started : loops_0_ld_input_started);
	wire _GEN_93 = (_ld_weights_io_idle & (_ld_weights_io_loop_id ? loops_1_running : loops_0_running)) & (_ld_weights_io_loop_id ? loops_1_ld_weights_started : loops_0_ld_weights_started);
	wire _GEN_94 = (_ex_io_idle & (_ex_io_loop_id ? loops_1_running : loops_0_running)) & _GEN_0;
	wire _GEN_95 = (_st_io_idle & (_st_io_loop_id ? loops_1_running : loops_0_running)) & (_st_io_loop_id ? loops_1_st_started : loops_0_st_started);
	wire _GEN_96 = (((((head_loop_id ? loops_1_running : loops_0_running) & (head_loop_id ? loops_1_ld_bias_completed : loops_0_ld_bias_completed)) & (head_loop_id ? loops_1_ld_input_completed : loops_0_ld_input_completed)) & (head_loop_id ? loops_1_ld_weights_completed : loops_0_ld_weights_completed)) & (head_loop_id ? loops_1_ex_completed : loops_0_ex_completed)) & (head_loop_id ? loops_1_st_completed : loops_0_st_completed);
	wire _GEN_97 = reset | (_GEN_96 & ~head_loop_id);
	wire _GEN_98 = reset | (_GEN_96 & head_loop_id);
	always @(posedge clock) begin
		if ((_GEN_46 & _GEN_47) & ~loop_being_configured_id) begin
			loops_0_outer_bounds_batch_size <= _cmd_q_io_deq_bits_cmd_rs1[15:0];
			loops_0_outer_bounds_in_row_dim <= _cmd_q_io_deq_bits_cmd_rs1[31:16];
			loops_0_outer_bounds_in_channels <= _cmd_q_io_deq_bits_cmd_rs1[47:32];
			loops_0_outer_bounds_out_channels <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
			loops_0_outer_bounds_out_col_dim <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
			loops_0_outer_bounds_out_row_dim <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
			loops_0_outer_bounds_pool_out_row_dim <= _cmd_q_io_deq_bits_cmd_rs2[31:16];
			loops_0_outer_bounds_stride <= _GEN_48;
		end
		if (_GEN_55)
			;
		else
			loops_0_outer_bounds_in_col_dim <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
		if (_GEN_61)
			;
		else begin
			loops_0_outer_bounds_out_stride <= _cmd_q_io_deq_bits_cmd_rs2[31:16];
			loops_0_outer_bounds_in_stride <= _cmd_q_io_deq_bits_cmd_rs2[63:48];
			loops_0_outer_bounds_weight_stride <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
		end
		if (_GEN_50)
			;
		else begin
			loops_0_outer_bounds_pool_out_col_dim <= _cmd_q_io_deq_bits_cmd_rs1[47:32];
			loops_0_outer_bounds_kernel_dim <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
		end
		if (_GEN_61)
			;
		else
			loops_0_outer_bounds_kernel_dilation <= _GEN_64;
		if (_GEN_50)
			;
		else begin
			loops_0_outer_bounds_pool_size <= _cmd_q_io_deq_bits_cmd_rs1[31:16];
			loops_0_outer_bounds_pool_stride <= _GEN_52;
			loops_0_inner_bounds_batches <= _cmd_q_io_deq_bits_cmd_rs2[63:48];
			loops_0_inner_bounds_porows <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
			loops_0_inner_bounds_pocols <= _cmd_q_io_deq_bits_cmd_rs2[31:16];
			loops_0_inner_bounds_pochs <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
		end
		if (_GEN_55)
			;
		else begin
			loops_0_inner_bounds_krows <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
			loops_0_inner_bounds_kcols <= _cmd_q_io_deq_bits_cmd_rs1[47:32];
			loops_0_inner_bounds_kchs <= _cmd_q_io_deq_bits_cmd_rs1[31:16];
			loops_0_inner_bounds_lpad <= _cmd_q_io_deq_bits_cmd_rs1[15:0];
			loops_0_inner_bounds_rpad <= _cmd_q_io_deq_bits_cmd_rs2[63:48];
			loops_0_inner_bounds_upad <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
			loops_0_inner_bounds_dpad <= _GEN_57;
			loops_0_inner_bounds_plpad <= _GEN_58;
		end
		if (_GEN_61)
			;
		else begin
			loops_0_inner_bounds_pupad <= _GEN_63;
			loops_0_inner_bounds_orows <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
			loops_0_inner_bounds_ocols <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
		end
		if (_GEN_71)
			;
		else
			loops_0_bias_dram_addr <= _cmd_q_io_deq_bits_cmd_rs1[39:0];
		if (_GEN_67)
			;
		else
			loops_0_weights_dram_addr <= _cmd_q_io_deq_bits_cmd_rs1[39:0];
		if (_GEN_71)
			;
		else
			loops_0_input_dram_addr <= _cmd_q_io_deq_bits_cmd_rs2[39:0];
		if (_GEN_67)
			;
		else
			loops_0_output_dram_addr <= _cmd_q_io_deq_bits_cmd_rs2[39:0];
		if ((~_GEN_46 | _GEN_75) | ~_GEN_74)
			;
		else begin
			loops_0_no_bias <= _cmd_q_io_deq_bits_cmd_rs1[0];
			loops_0_wrot180 <= _cmd_q_io_deq_bits_cmd_rs1[1];
			loops_0_no_pool <= _cmd_q_io_deq_bits_cmd_rs2[0];
			loops_0_downsample <= _cmd_q_io_deq_bits_cmd_rs2[1];
			loops_0_input_dilated <= _cmd_q_io_deq_bits_cmd_rs2[2];
			loops_0_activation <= _cmd_q_io_deq_bits_cmd_rs2[4:3];
			loops_0_trans_output_1203 <= _cmd_q_io_deq_bits_cmd_rs1[2];
			loops_0_trans_weight_1203 <= _cmd_q_io_deq_bits_cmd_rs1[3];
			loops_0_trans_weight_0132 <= _cmd_q_io_deq_bits_cmd_rs1[4];
			loops_0_trans_input_3120 <= _cmd_q_io_deq_bits_cmd_rs1[5];
			loops_0_dw <= _cmd_q_io_deq_bits_cmd_rs1[6];
			loops_0_max_pixels_per_row <= _GEN_77;
			loops_0_a_ex_spad_id <= _cmd_q_io_deq_bits_cmd_rs1[19:18];
			loops_0_b_ex_spad_id <= _cmd_q_io_deq_bits_cmd_rs1[17:16];
		end
		loops_0_configured <= ~_GEN_97 & (((_GEN_46 & ~_GEN_75) & _GEN_74) | loops_0_configured);
		loops_0_running <= ~_GEN_97 & (_GEN_89 | (_GEN_87 ? (~loop_requesting_ex_id | _GEN_85) | _GEN_82 : _GEN_85 | _GEN_82));
		loops_0_ld_bias_started <= ~_GEN_97 & (_GEN_79 | loops_0_ld_bias_started);
		loops_0_ld_input_started <= ~_GEN_97 & ((_GEN_81 & ~loop_requesting_ld_input_id) | loops_0_ld_input_started);
		loops_0_ld_weights_started <= ~_GEN_97 & (_GEN_85 | loops_0_ld_weights_started);
		loops_0_ex_started <= ~_GEN_97 & ((_GEN_87 & ~loop_requesting_ex_id) | loops_0_ex_started);
		loops_0_st_started <= ~_GEN_97 & (_GEN_89 | loops_0_st_started);
		loops_0_ld_bias_completed <= ~_GEN_97 & ((_GEN_91 & ~_ld_bias_io_loop_id) | loops_0_ld_bias_completed);
		loops_0_ld_input_completed <= ~_GEN_97 & ((_GEN_92 & ~_ld_input_io_loop_id) | loops_0_ld_input_completed);
		loops_0_ld_weights_completed <= ~_GEN_97 & ((_GEN_93 & ~_ld_weights_io_loop_id) | loops_0_ld_weights_completed);
		loops_0_ex_completed <= ~_GEN_97 & ((_GEN_94 & ~_ex_io_loop_id) | loops_0_ex_completed);
		loops_0_st_completed <= ~_GEN_97 & ((_GEN_95 & ~_st_io_loop_id) | loops_0_st_completed);
		if ((_GEN_46 & _GEN_47) & loop_being_configured_id) begin
			loops_1_outer_bounds_batch_size <= _cmd_q_io_deq_bits_cmd_rs1[15:0];
			loops_1_outer_bounds_in_row_dim <= _cmd_q_io_deq_bits_cmd_rs1[31:16];
			loops_1_outer_bounds_in_channels <= _cmd_q_io_deq_bits_cmd_rs1[47:32];
			loops_1_outer_bounds_out_channels <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
			loops_1_outer_bounds_out_col_dim <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
			loops_1_outer_bounds_out_row_dim <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
			loops_1_outer_bounds_pool_out_row_dim <= _cmd_q_io_deq_bits_cmd_rs2[31:16];
			loops_1_outer_bounds_stride <= _GEN_48;
		end
		if (_GEN_56)
			;
		else
			loops_1_outer_bounds_in_col_dim <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
		if (_GEN_62)
			;
		else begin
			loops_1_outer_bounds_out_stride <= _cmd_q_io_deq_bits_cmd_rs2[31:16];
			loops_1_outer_bounds_in_stride <= _cmd_q_io_deq_bits_cmd_rs2[63:48];
			loops_1_outer_bounds_weight_stride <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
		end
		if (_GEN_51)
			;
		else begin
			loops_1_outer_bounds_pool_out_col_dim <= _cmd_q_io_deq_bits_cmd_rs1[47:32];
			loops_1_outer_bounds_kernel_dim <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
		end
		if (_GEN_62)
			;
		else
			loops_1_outer_bounds_kernel_dilation <= _GEN_64;
		if (_GEN_51)
			;
		else begin
			loops_1_outer_bounds_pool_size <= _cmd_q_io_deq_bits_cmd_rs1[31:16];
			loops_1_outer_bounds_pool_stride <= _GEN_52;
			loops_1_inner_bounds_batches <= _cmd_q_io_deq_bits_cmd_rs2[63:48];
			loops_1_inner_bounds_porows <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
			loops_1_inner_bounds_pocols <= _cmd_q_io_deq_bits_cmd_rs2[31:16];
			loops_1_inner_bounds_pochs <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
		end
		if (_GEN_56)
			;
		else begin
			loops_1_inner_bounds_krows <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
			loops_1_inner_bounds_kcols <= _cmd_q_io_deq_bits_cmd_rs1[47:32];
			loops_1_inner_bounds_kchs <= _cmd_q_io_deq_bits_cmd_rs1[31:16];
			loops_1_inner_bounds_lpad <= _cmd_q_io_deq_bits_cmd_rs1[15:0];
			loops_1_inner_bounds_rpad <= _cmd_q_io_deq_bits_cmd_rs2[63:48];
			loops_1_inner_bounds_upad <= _cmd_q_io_deq_bits_cmd_rs2[47:32];
			loops_1_inner_bounds_dpad <= _GEN_57;
			loops_1_inner_bounds_plpad <= _GEN_58;
		end
		if (_GEN_62)
			;
		else begin
			loops_1_inner_bounds_pupad <= _GEN_63;
			loops_1_inner_bounds_orows <= _cmd_q_io_deq_bits_cmd_rs1[63:48];
			loops_1_inner_bounds_ocols <= _cmd_q_io_deq_bits_cmd_rs2[15:0];
		end
		if (_GEN_72)
			;
		else
			loops_1_bias_dram_addr <= _cmd_q_io_deq_bits_cmd_rs1[39:0];
		if (_GEN_68)
			;
		else
			loops_1_weights_dram_addr <= _cmd_q_io_deq_bits_cmd_rs1[39:0];
		if (_GEN_72)
			;
		else
			loops_1_input_dram_addr <= _cmd_q_io_deq_bits_cmd_rs2[39:0];
		if (_GEN_68)
			;
		else
			loops_1_output_dram_addr <= _cmd_q_io_deq_bits_cmd_rs2[39:0];
		if ((~_GEN_46 | _GEN_75) | ~_GEN_76)
			;
		else begin
			loops_1_no_bias <= _cmd_q_io_deq_bits_cmd_rs1[0];
			loops_1_wrot180 <= _cmd_q_io_deq_bits_cmd_rs1[1];
			loops_1_no_pool <= _cmd_q_io_deq_bits_cmd_rs2[0];
			loops_1_downsample <= _cmd_q_io_deq_bits_cmd_rs2[1];
			loops_1_input_dilated <= _cmd_q_io_deq_bits_cmd_rs2[2];
			loops_1_activation <= _cmd_q_io_deq_bits_cmd_rs2[4:3];
			loops_1_trans_output_1203 <= _cmd_q_io_deq_bits_cmd_rs1[2];
			loops_1_trans_weight_1203 <= _cmd_q_io_deq_bits_cmd_rs1[3];
			loops_1_trans_weight_0132 <= _cmd_q_io_deq_bits_cmd_rs1[4];
			loops_1_trans_input_3120 <= _cmd_q_io_deq_bits_cmd_rs1[5];
			loops_1_dw <= _cmd_q_io_deq_bits_cmd_rs1[6];
			loops_1_max_pixels_per_row <= _GEN_77;
			loops_1_a_ex_spad_id <= _cmd_q_io_deq_bits_cmd_rs1[19:18];
			loops_1_b_ex_spad_id <= _cmd_q_io_deq_bits_cmd_rs1[17:16];
		end
		loops_1_configured <= ~_GEN_98 & (((_GEN_46 & ~_GEN_75) & _GEN_76) | loops_1_configured);
		loops_1_running <= ~_GEN_98 & (_GEN_90 | (_GEN_87 ? (loop_requesting_ex_id | _GEN_86) | _GEN_83 : _GEN_86 | _GEN_83));
		loops_1_ld_bias_started <= ~_GEN_98 & (_GEN_80 | loops_1_ld_bias_started);
		loops_1_ld_input_started <= ~_GEN_98 & ((_GEN_81 & loop_requesting_ld_input_id) | loops_1_ld_input_started);
		loops_1_ld_weights_started <= ~_GEN_98 & (_GEN_86 | loops_1_ld_weights_started);
		loops_1_ex_started <= ~_GEN_98 & ((_GEN_87 & loop_requesting_ex_id) | loops_1_ex_started);
		loops_1_st_started <= ~_GEN_98 & (_GEN_90 | loops_1_st_started);
		loops_1_ld_bias_completed <= ~_GEN_98 & ((_GEN_91 & _ld_bias_io_loop_id) | loops_1_ld_bias_completed);
		loops_1_ld_input_completed <= ~_GEN_98 & ((_GEN_92 & _ld_input_io_loop_id) | loops_1_ld_input_completed);
		loops_1_ld_weights_completed <= ~_GEN_98 & ((_GEN_93 & _ld_weights_io_loop_id) | loops_1_ld_weights_completed);
		loops_1_ex_completed <= ~_GEN_98 & ((_GEN_94 & _ex_io_loop_id) | loops_1_ex_completed);
		loops_1_st_completed <= ~_GEN_98 & ((_GEN_95 & _st_io_loop_id) | loops_1_st_completed);
		if (reset) begin
			head_loop_id <= 1'h0;
			ld_utilization <= 4'h0;
			st_utilization <= 3'h0;
			ex_utilization <= 5'h00;
			ld_bias_addr_start <= 10'h000;
			ex_c_addr_start <= 10'h000;
			st_addr_start <= 10'h000;
		end
		else begin
			head_loop_id <= _GEN_96 ^ head_loop_id;
			ld_utilization <= (ld_utilization + {3'h0, ((_arb_io_in_2_ready & _ld_bias_io_cmd_valid) | (_arb_io_in_3_ready & _ld_weights_io_cmd_valid)) | (_arb_io_in_4_ready & _ld_input_io_cmd_valid)}) - io_ld_completed[3:0];
			st_utilization <= (st_utilization + {2'h0, _arb_io_in_0_ready & _st_io_cmd_valid}) - io_st_completed[2:0];
			ex_utilization <= (ex_utilization + {4'h0, _arb_io_in_1_ready & _ex_io_cmd_valid}) - io_ex_completed[4:0];
			if (_GEN_78 & |(loop_requesting_ld_bias_id ? loops_1_output_dram_addr : loops_0_output_dram_addr))
				if (_ld_bias_addr_start_T_3[10])
					ld_bias_addr_start <= 10'h000;
				else
					ld_bias_addr_start <= _ld_bias_addr_start_T_3[9:0];
			if (_GEN_87 & |(loop_requesting_ex_id ? loops_1_output_dram_addr : loops_0_output_dram_addr))
				if (_ex_c_addr_start_T_3[10])
					ex_c_addr_start <= 10'h000;
				else
					ex_c_addr_start <= _ex_c_addr_start_T_3[9:0];
			if (_GEN_88 & |_GEN_45)
				if (_st_addr_start_T_3[10])
					st_addr_start <= 10'h000;
				else
					st_addr_start <= _st_addr_start_T_3[9:0];
		end
	end
	LoopConvLdBias ld_bias(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_ld_bias_io_req_ready),
		.io_req_valid(_ld_bias_io_req_valid_T_1),
		.io_req_bits_inner_bounds_batches(_GEN_1),
		.io_req_bits_inner_bounds_orows(_GEN_2),
		.io_req_bits_inner_bounds_ocols(_GEN_3),
		.io_req_bits_derived_params_ochs((loop_requesting_ld_bias_id ? loops_1_inner_bounds_pochs : loops_0_inner_bounds_pochs)),
		.io_req_bits_derived_params_bias_spad_stride((_GEN_1 * _GEN_2) * _GEN_3),
		.io_req_bits_addr_start(ld_bias_addr_start),
		.io_req_bits_dram_addr((loop_requesting_ld_bias_id ? loops_1_bias_dram_addr : loops_0_bias_dram_addr)),
		.io_req_bits_no_bias((loop_requesting_ld_bias_id ? loops_1_no_bias : loops_0_no_bias)),
		.io_req_bits_loop_id(loop_requesting_ld_bias_id),
		.io_cmd_ready(_arb_io_in_2_ready),
		.io_cmd_valid(_ld_bias_io_cmd_valid),
		.io_cmd_bits_inst_funct(_ld_bias_io_cmd_bits_inst_funct),
		.io_cmd_bits_rs1(_ld_bias_io_cmd_bits_rs1),
		.io_cmd_bits_rs2(_ld_bias_io_cmd_bits_rs2),
		.io_idle(_ld_bias_io_idle),
		.io_rob_overloaded(ld_utilization[3]),
		.io_wait_for_prev_loop(ex_is_waiting_for_loads & _ex_io_ldd_completed_T),
		.io_loop_id(_ld_bias_io_loop_id)
	);
	LoopConvLdInput ld_input(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_ld_input_io_req_ready),
		.io_req_valid(_ld_input_io_req_valid_T_1),
		.io_req_bits_outer_bounds_batch_size((loop_requesting_ld_input_id ? loops_1_outer_bounds_batch_size : loops_0_outer_bounds_batch_size)),
		.io_req_bits_outer_bounds_in_row_dim((loop_requesting_ld_input_id ? loops_1_outer_bounds_in_row_dim : loops_0_outer_bounds_in_row_dim)),
		.io_req_bits_outer_bounds_in_col_dim((loop_requesting_ld_input_id ? loops_1_outer_bounds_in_col_dim : loops_0_outer_bounds_in_col_dim)),
		.io_req_bits_outer_bounds_in_stride((loop_requesting_ld_input_id ? loops_1_outer_bounds_in_stride : loops_0_outer_bounds_in_stride)),
		.io_req_bits_inner_bounds_batches(_GEN_4),
		.io_req_bits_inner_bounds_lpad(_GEN_7),
		.io_req_bits_inner_bounds_rpad(_GEN_8),
		.io_req_bits_inner_bounds_upad(_GEN_9),
		.io_req_bits_inner_bounds_dpad(_GEN_10),
		.io_req_bits_derived_params_irows(_ld_input_io_req_bits_derived_params_result_irows_T_6),
		.io_req_bits_derived_params_icols(_ld_input_io_req_bits_derived_params_result_icols_T_6),
		.io_req_bits_derived_params_irows_unpadded(ld_input_io_req_bits_derived_params_irows_unpadded[15:0]),
		.io_req_bits_derived_params_icols_unpadded(ld_input_io_req_bits_derived_params_icols_unpadded[15:0]),
		.io_req_bits_derived_params_ichs(ld_input_io_req_bits_derived_params_result_ichs),
		.io_req_bits_derived_params_input_spad_stride((_GEN_13 ? (ld_input_io_req_bits_derived_params_result_ichs * _ld_input_io_req_bits_derived_params_result_input_spad_stride_T_4) * _ld_input_io_req_bits_derived_params_result_input_spad_stride_T_6 : (_GEN_4 * _ld_input_io_req_bits_derived_params_result_input_spad_stride_T_4) * _ld_input_io_req_bits_derived_params_result_input_spad_stride_T_6)),
		.io_req_bits_addr_start({(_GEN_14 == 2'h0 ? loop_requesting_ld_input_id : _GEN_14[0] - 1'h1), 13'h0000}),
		.io_req_bits_dram_addr((loop_requesting_ld_input_id ? loops_1_input_dram_addr : loops_0_input_dram_addr)),
		.io_req_bits_downsample(_GEN_11),
		.io_req_bits_max_pixels_per_row((loop_requesting_ld_input_id ? loops_1_max_pixels_per_row : loops_0_max_pixels_per_row)),
		.io_req_bits_input_dilated(_GEN_12),
		.io_req_bits_trans_input_3120(_GEN_13),
		.io_req_bits_loop_id(loop_requesting_ld_input_id),
		.io_cmd_ready(_arb_io_in_4_ready),
		.io_cmd_valid(_ld_input_io_cmd_valid),
		.io_cmd_bits_inst_funct(_ld_input_io_cmd_bits_inst_funct),
		.io_cmd_bits_rs1(_ld_input_io_cmd_bits_rs1),
		.io_cmd_bits_rs2(_ld_input_io_cmd_bits_rs2),
		.io_idle(_ld_input_io_idle),
		.io_rob_overloaded(ld_utilization[3]),
		.io_wait_for_prev_loop(ex_is_waiting_for_loads & _ex_io_lda_completed_T),
		.io_loop_id(_ld_input_io_loop_id)
	);
	LoopConvLdWeight ld_weights(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_ld_weights_io_req_ready),
		.io_req_valid(_ld_weights_io_req_valid_T_1),
		.io_req_bits_outer_bounds_in_channels((loop_requesting_ld_weights_id ? loops_1_outer_bounds_in_channels : loops_0_outer_bounds_in_channels)),
		.io_req_bits_outer_bounds_out_channels((loop_requesting_ld_weights_id ? loops_1_outer_bounds_out_channels : loops_0_outer_bounds_out_channels)),
		.io_req_bits_outer_bounds_weight_stride((loop_requesting_ld_weights_id ? loops_1_outer_bounds_weight_stride : loops_0_outer_bounds_weight_stride)),
		.io_req_bits_outer_bounds_kernel_dim((loop_requesting_ld_weights_id ? loops_1_outer_bounds_kernel_dim : loops_0_outer_bounds_kernel_dim)),
		.io_req_bits_inner_bounds_krows(_GEN_20),
		.io_req_bits_inner_bounds_kcols(_GEN_21),
		.io_req_bits_inner_bounds_kchs(ld_weights_io_req_bits_derived_params_result_ichs),
		.io_req_bits_derived_params_ochs(ld_weights_io_req_bits_derived_params_result_ochs),
		.io_req_bits_derived_params_out_channels_per_bank((ld_weights_io_req_bits_derived_params_result_ochs / 16'h0010) + {15'h0000, |_ld_weights_io_req_bits_derived_params_result_out_channels_per_bank_T_1[4:0]}),
		.io_req_bits_derived_params_in_channels_per_bank((ld_weights_io_req_bits_derived_params_result_ichs / 16'h0010) + {15'h0000, |_ld_weights_io_req_bits_derived_params_result_in_channels_per_bank_T_1[4:0]}),
		.io_req_bits_derived_params_weight_spad_stride((_GEN_22 ? _ld_weights_io_req_bits_derived_params_result_weight_spad_stride_T_2 * ld_weights_io_req_bits_derived_params_result_ochs : _ld_weights_io_req_bits_derived_params_result_weight_spad_stride_T_2 * ld_weights_io_req_bits_derived_params_result_ichs)),
		.io_req_bits_addr_end((_GEN_23 == 2'h0 ? (loop_requesting_ld_weights_id ? 15'h4000 : 15'h2000) : {_GEN_23, 13'h0000})),
		.io_req_bits_dram_addr((loop_requesting_ld_weights_id ? loops_1_weights_dram_addr : loops_0_weights_dram_addr)),
		.io_req_bits_trans_weight_1203((loop_requesting_ld_weights_id ? loops_1_trans_weight_1203 : loops_0_trans_weight_1203)),
		.io_req_bits_trans_weight_0132(_GEN_22),
		.io_req_bits_dw((loop_requesting_ld_weights_id ? loops_1_dw : loops_0_dw)),
		.io_req_bits_loop_id(loop_requesting_ld_weights_id),
		.io_cmd_ready(_arb_io_in_3_ready),
		.io_cmd_valid(_ld_weights_io_cmd_valid),
		.io_cmd_bits_inst_funct(_ld_weights_io_cmd_bits_inst_funct),
		.io_cmd_bits_rs1(_ld_weights_io_cmd_bits_rs1),
		.io_cmd_bits_rs2(_ld_weights_io_cmd_bits_rs2),
		.io_idle(_ld_weights_io_idle),
		.io_rob_overloaded(ld_utilization[3]),
		.io_wait_for_prev_loop(ex_is_waiting_for_loads & _ex_io_ldb_completed_T),
		.io_loop_id(_ld_weights_io_loop_id)
	);
	LoopConvExecute ex(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_ex_io_req_ready),
		.io_req_valid(_ex_io_req_valid_T_4),
		.io_req_bits_outer_bounds_stride(_GEN_24),
		.io_req_bits_outer_bounds_kernel_dilation(_GEN_25),
		.io_req_bits_inner_bounds_batches(_GEN_26),
		.io_req_bits_inner_bounds_krows(_GEN_27),
		.io_req_bits_inner_bounds_kcols(_GEN_28),
		.io_req_bits_inner_bounds_kchs(ex_io_req_bits_derived_params_result_ichs),
		.io_req_bits_inner_bounds_lpad(_GEN_29),
		.io_req_bits_inner_bounds_upad(_GEN_31),
		.io_req_bits_inner_bounds_orows(_GEN_33),
		.io_req_bits_inner_bounds_ocols(_GEN_34),
		.io_req_bits_derived_params_ochs(ex_io_req_bits_derived_params_result_ochs),
		.io_req_bits_derived_params_irows(_ex_io_req_bits_derived_params_result_irows_T_6),
		.io_req_bits_derived_params_icols(_ex_io_req_bits_derived_params_result_icols_T_6),
		.io_req_bits_derived_params_out_channels_per_bank((ex_io_req_bits_derived_params_result_ochs / 16'h0010) + {15'h0000, |_ex_io_req_bits_derived_params_result_out_channels_per_bank_T_1[4:0]}),
		.io_req_bits_derived_params_in_channels_per_bank((ex_io_req_bits_derived_params_result_ichs / 16'h0010) + {15'h0000, |_ex_io_req_bits_derived_params_result_in_channels_per_bank_T_1[4:0]}),
		.io_req_bits_derived_params_input_spad_stride((_GEN_37 ? (ex_io_req_bits_derived_params_result_ichs * _ex_io_req_bits_derived_params_result_input_spad_stride_T_4) * _ex_io_req_bits_derived_params_result_input_spad_stride_T_6 : (_GEN_26 * _ex_io_req_bits_derived_params_result_input_spad_stride_T_4) * _ex_io_req_bits_derived_params_result_input_spad_stride_T_6)),
		.io_req_bits_a_addr_start({(_GEN_38 == 2'h0 ? loop_requesting_ex_id : _GEN_38[0] - 1'h1), 13'h0000}),
		.io_req_bits_b_addr_end((_GEN_39 == 2'h0 ? (loop_requesting_ex_id ? 15'h4000 : 15'h2000) : {_GEN_39, 13'h0000})),
		.io_req_bits_c_addr_start(ex_c_addr_start),
		.io_req_bits_wrot180((loop_requesting_ex_id ? loops_1_wrot180 : loops_0_wrot180)),
		.io_req_bits_downsample(_GEN_35),
		.io_req_bits_max_pixels_per_row((loop_requesting_ex_id ? loops_1_max_pixels_per_row : loops_0_max_pixels_per_row)),
		.io_req_bits_input_dilated(_GEN_36),
		.io_req_bits_trans_weight_0132((loop_requesting_ex_id ? loops_1_trans_weight_0132 : loops_0_trans_weight_0132)),
		.io_req_bits_trans_input_3120(_GEN_37),
		.io_req_bits_loop_id(loop_requesting_ex_id),
		.io_cmd_ready(_arb_io_in_1_ready),
		.io_cmd_valid(_ex_io_cmd_valid),
		.io_cmd_bits_inst_funct(_ex_io_cmd_bits_inst_funct),
		.io_cmd_bits_rs1(_ex_io_cmd_bits_rs1),
		.io_cmd_bits_rs2(_ex_io_cmd_bits_rs2),
		.io_lda_completed(_ex_io_lda_completed_T | _ld_input_io_idle),
		.io_ldb_completed(_ex_io_ldb_completed_T | _ld_weights_io_idle),
		.io_ldd_completed(_ex_io_ldd_completed_T | _ld_bias_io_idle),
		.io_idle(_ex_io_idle),
		.io_rob_overloaded(ex_utilization[4]),
		.io_loop_id(_ex_io_loop_id)
	);
	LoopConvSt st(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_st_io_req_ready),
		.io_req_valid(_st_io_req_valid_T_2),
		.io_req_bits_outer_bounds_batch_size((loop_requesting_st_id ? loops_1_outer_bounds_batch_size : loops_0_outer_bounds_batch_size)),
		.io_req_bits_outer_bounds_out_channels((loop_requesting_st_id ? loops_1_outer_bounds_out_channels : loops_0_outer_bounds_out_channels)),
		.io_req_bits_outer_bounds_out_col_dim((loop_requesting_st_id ? loops_1_outer_bounds_out_col_dim : loops_0_outer_bounds_out_col_dim)),
		.io_req_bits_outer_bounds_out_row_dim((loop_requesting_st_id ? loops_1_outer_bounds_out_row_dim : loops_0_outer_bounds_out_row_dim)),
		.io_req_bits_outer_bounds_out_stride((loop_requesting_st_id ? loops_1_outer_bounds_out_stride : loops_0_outer_bounds_out_stride)),
		.io_req_bits_outer_bounds_pool_out_row_dim((loop_requesting_st_id ? loops_1_outer_bounds_pool_out_row_dim : loops_0_outer_bounds_pool_out_row_dim)),
		.io_req_bits_outer_bounds_pool_out_col_dim((loop_requesting_st_id ? loops_1_outer_bounds_pool_out_col_dim : loops_0_outer_bounds_pool_out_col_dim)),
		.io_req_bits_outer_bounds_pool_size((loop_requesting_st_id ? loops_1_outer_bounds_pool_size : loops_0_outer_bounds_pool_size)),
		.io_req_bits_outer_bounds_pool_stride((loop_requesting_st_id ? loops_1_outer_bounds_pool_stride : loops_0_outer_bounds_pool_stride)),
		.io_req_bits_inner_bounds_batches((loop_requesting_st_id ? loops_1_inner_bounds_batches : loops_0_inner_bounds_batches)),
		.io_req_bits_inner_bounds_porows((loop_requesting_st_id ? loops_1_inner_bounds_porows : loops_0_inner_bounds_porows)),
		.io_req_bits_inner_bounds_pocols((loop_requesting_st_id ? loops_1_inner_bounds_pocols : loops_0_inner_bounds_pocols)),
		.io_req_bits_inner_bounds_plpad((loop_requesting_st_id ? loops_1_inner_bounds_plpad : loops_0_inner_bounds_plpad)),
		.io_req_bits_inner_bounds_pupad((loop_requesting_st_id ? loops_1_inner_bounds_pupad : loops_0_inner_bounds_pupad)),
		.io_req_bits_inner_bounds_orows((loop_requesting_st_id ? loops_1_inner_bounds_orows : loops_0_inner_bounds_orows)),
		.io_req_bits_inner_bounds_ocols((loop_requesting_st_id ? loops_1_inner_bounds_ocols : loops_0_inner_bounds_ocols)),
		.io_req_bits_derived_params_ochs((loop_requesting_st_id ? loops_1_inner_bounds_pochs : loops_0_inner_bounds_pochs)),
		.io_req_bits_addr_start(st_addr_start),
		.io_req_bits_dram_addr(_GEN_45),
		.io_req_bits_no_pool((loop_requesting_st_id ? loops_1_no_pool : loops_0_no_pool)),
		.io_req_bits_activation((loop_requesting_st_id ? loops_1_activation : loops_0_activation)),
		.io_req_bits_trans_output_1203((loop_requesting_st_id ? loops_1_trans_output_1203 : loops_0_trans_output_1203)),
		.io_req_bits_loop_id(loop_requesting_st_id),
		.io_cmd_ready(_arb_io_in_0_ready),
		.io_cmd_valid(_st_io_cmd_valid),
		.io_cmd_bits_inst_funct(_st_io_cmd_bits_inst_funct),
		.io_cmd_bits_rs1(_st_io_cmd_bits_rs1),
		.io_cmd_bits_rs2(_st_io_cmd_bits_rs2),
		.io_ex_completed((_ex_io_loop_id != _st_io_loop_id) | _ex_io_idle),
		.io_idle(_st_io_idle),
		.io_rob_overloaded(st_utilization[2]),
		.io_loop_id(_st_io_loop_id)
	);
	Queue2_GemminiCmd cmd_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(io_in_ready),
		.io_enq_valid(io_in_valid),
		.io_enq_bits_cmd_inst_funct(io_in_bits_cmd_inst_funct),
		.io_enq_bits_cmd_inst_rs2(io_in_bits_cmd_inst_rs2),
		.io_enq_bits_cmd_inst_rs1(io_in_bits_cmd_inst_rs1),
		.io_enq_bits_cmd_inst_xd(io_in_bits_cmd_inst_xd),
		.io_enq_bits_cmd_inst_xs1(io_in_bits_cmd_inst_xs1),
		.io_enq_bits_cmd_inst_xs2(io_in_bits_cmd_inst_xs2),
		.io_enq_bits_cmd_inst_rd(io_in_bits_cmd_inst_rd),
		.io_enq_bits_cmd_inst_opcode(io_in_bits_cmd_inst_opcode),
		.io_enq_bits_cmd_rs1(io_in_bits_cmd_rs1),
		.io_enq_bits_cmd_rs2(io_in_bits_cmd_rs2),
		.io_enq_bits_cmd_status_debug(io_in_bits_cmd_status_debug),
		.io_enq_bits_cmd_status_cease(io_in_bits_cmd_status_cease),
		.io_enq_bits_cmd_status_wfi(io_in_bits_cmd_status_wfi),
		.io_enq_bits_cmd_status_isa(io_in_bits_cmd_status_isa),
		.io_enq_bits_cmd_status_dprv(io_in_bits_cmd_status_dprv),
		.io_enq_bits_cmd_status_dv(io_in_bits_cmd_status_dv),
		.io_enq_bits_cmd_status_prv(io_in_bits_cmd_status_prv),
		.io_enq_bits_cmd_status_v(io_in_bits_cmd_status_v),
		.io_enq_bits_cmd_status_sd(io_in_bits_cmd_status_sd),
		.io_enq_bits_cmd_status_zero2(io_in_bits_cmd_status_zero2),
		.io_enq_bits_cmd_status_mpv(io_in_bits_cmd_status_mpv),
		.io_enq_bits_cmd_status_gva(io_in_bits_cmd_status_gva),
		.io_enq_bits_cmd_status_mbe(io_in_bits_cmd_status_mbe),
		.io_enq_bits_cmd_status_sbe(io_in_bits_cmd_status_sbe),
		.io_enq_bits_cmd_status_sxl(io_in_bits_cmd_status_sxl),
		.io_enq_bits_cmd_status_uxl(io_in_bits_cmd_status_uxl),
		.io_enq_bits_cmd_status_sd_rv32(io_in_bits_cmd_status_sd_rv32),
		.io_enq_bits_cmd_status_zero1(io_in_bits_cmd_status_zero1),
		.io_enq_bits_cmd_status_tsr(io_in_bits_cmd_status_tsr),
		.io_enq_bits_cmd_status_tw(io_in_bits_cmd_status_tw),
		.io_enq_bits_cmd_status_tvm(io_in_bits_cmd_status_tvm),
		.io_enq_bits_cmd_status_mxr(io_in_bits_cmd_status_mxr),
		.io_enq_bits_cmd_status_sum(io_in_bits_cmd_status_sum),
		.io_enq_bits_cmd_status_mprv(io_in_bits_cmd_status_mprv),
		.io_enq_bits_cmd_status_xs(io_in_bits_cmd_status_xs),
		.io_enq_bits_cmd_status_fs(io_in_bits_cmd_status_fs),
		.io_enq_bits_cmd_status_mpp(io_in_bits_cmd_status_mpp),
		.io_enq_bits_cmd_status_vs(io_in_bits_cmd_status_vs),
		.io_enq_bits_cmd_status_spp(io_in_bits_cmd_status_spp),
		.io_enq_bits_cmd_status_mpie(io_in_bits_cmd_status_mpie),
		.io_enq_bits_cmd_status_ube(io_in_bits_cmd_status_ube),
		.io_enq_bits_cmd_status_spie(io_in_bits_cmd_status_spie),
		.io_enq_bits_cmd_status_upie(io_in_bits_cmd_status_upie),
		.io_enq_bits_cmd_status_mie(io_in_bits_cmd_status_mie),
		.io_enq_bits_cmd_status_hie(io_in_bits_cmd_status_hie),
		.io_enq_bits_cmd_status_sie(io_in_bits_cmd_status_sie),
		.io_enq_bits_cmd_status_uie(io_in_bits_cmd_status_uie),
		.io_enq_bits_rob_id_valid(io_in_bits_rob_id_valid),
		.io_enq_bits_rob_id_bits(io_in_bits_rob_id_bits),
		.io_enq_bits_from_matmul_fsm(io_in_bits_from_matmul_fsm),
		.io_enq_bits_from_conv_fsm(io_in_bits_from_conv_fsm),
		.io_deq_ready((is_loop_cmd ? ~_GEN : ~loop_configured & io_out_ready)),
		.io_deq_valid(_cmd_q_io_deq_valid),
		.io_deq_bits_cmd_inst_funct(_cmd_q_io_deq_bits_cmd_inst_funct),
		.io_deq_bits_cmd_inst_rs2(_cmd_q_io_deq_bits_cmd_inst_rs2),
		.io_deq_bits_cmd_inst_rs1(_cmd_q_io_deq_bits_cmd_inst_rs1),
		.io_deq_bits_cmd_inst_xd(_cmd_q_io_deq_bits_cmd_inst_xd),
		.io_deq_bits_cmd_inst_xs1(_cmd_q_io_deq_bits_cmd_inst_xs1),
		.io_deq_bits_cmd_inst_xs2(_cmd_q_io_deq_bits_cmd_inst_xs2),
		.io_deq_bits_cmd_inst_rd(_cmd_q_io_deq_bits_cmd_inst_rd),
		.io_deq_bits_cmd_inst_opcode(_cmd_q_io_deq_bits_cmd_inst_opcode),
		.io_deq_bits_cmd_rs1(_cmd_q_io_deq_bits_cmd_rs1),
		.io_deq_bits_cmd_rs2(_cmd_q_io_deq_bits_cmd_rs2),
		.io_deq_bits_cmd_status_debug(io_out_bits_cmd_status_debug),
		.io_deq_bits_cmd_status_cease(io_out_bits_cmd_status_cease),
		.io_deq_bits_cmd_status_wfi(io_out_bits_cmd_status_wfi),
		.io_deq_bits_cmd_status_isa(io_out_bits_cmd_status_isa),
		.io_deq_bits_cmd_status_dprv(io_out_bits_cmd_status_dprv),
		.io_deq_bits_cmd_status_dv(io_out_bits_cmd_status_dv),
		.io_deq_bits_cmd_status_prv(io_out_bits_cmd_status_prv),
		.io_deq_bits_cmd_status_v(io_out_bits_cmd_status_v),
		.io_deq_bits_cmd_status_sd(io_out_bits_cmd_status_sd),
		.io_deq_bits_cmd_status_zero2(io_out_bits_cmd_status_zero2),
		.io_deq_bits_cmd_status_mpv(io_out_bits_cmd_status_mpv),
		.io_deq_bits_cmd_status_gva(io_out_bits_cmd_status_gva),
		.io_deq_bits_cmd_status_mbe(io_out_bits_cmd_status_mbe),
		.io_deq_bits_cmd_status_sbe(io_out_bits_cmd_status_sbe),
		.io_deq_bits_cmd_status_sxl(io_out_bits_cmd_status_sxl),
		.io_deq_bits_cmd_status_uxl(io_out_bits_cmd_status_uxl),
		.io_deq_bits_cmd_status_sd_rv32(io_out_bits_cmd_status_sd_rv32),
		.io_deq_bits_cmd_status_zero1(io_out_bits_cmd_status_zero1),
		.io_deq_bits_cmd_status_tsr(io_out_bits_cmd_status_tsr),
		.io_deq_bits_cmd_status_tw(io_out_bits_cmd_status_tw),
		.io_deq_bits_cmd_status_tvm(io_out_bits_cmd_status_tvm),
		.io_deq_bits_cmd_status_mxr(io_out_bits_cmd_status_mxr),
		.io_deq_bits_cmd_status_sum(io_out_bits_cmd_status_sum),
		.io_deq_bits_cmd_status_mprv(io_out_bits_cmd_status_mprv),
		.io_deq_bits_cmd_status_xs(io_out_bits_cmd_status_xs),
		.io_deq_bits_cmd_status_fs(io_out_bits_cmd_status_fs),
		.io_deq_bits_cmd_status_mpp(io_out_bits_cmd_status_mpp),
		.io_deq_bits_cmd_status_vs(io_out_bits_cmd_status_vs),
		.io_deq_bits_cmd_status_spp(io_out_bits_cmd_status_spp),
		.io_deq_bits_cmd_status_mpie(io_out_bits_cmd_status_mpie),
		.io_deq_bits_cmd_status_ube(io_out_bits_cmd_status_ube),
		.io_deq_bits_cmd_status_spie(io_out_bits_cmd_status_spie),
		.io_deq_bits_cmd_status_upie(io_out_bits_cmd_status_upie),
		.io_deq_bits_cmd_status_mie(io_out_bits_cmd_status_mie),
		.io_deq_bits_cmd_status_hie(io_out_bits_cmd_status_hie),
		.io_deq_bits_cmd_status_sie(io_out_bits_cmd_status_sie),
		.io_deq_bits_cmd_status_uie(io_out_bits_cmd_status_uie),
		.io_deq_bits_from_matmul_fsm(_cmd_q_io_deq_bits_from_matmul_fsm),
		.io_deq_bits_from_conv_fsm(_cmd_q_io_deq_bits_from_conv_fsm)
	);
	Arbiter5_RoCCCommand arb(
		.io_in_0_ready(_arb_io_in_0_ready),
		.io_in_0_valid(_st_io_cmd_valid),
		.io_in_0_bits_inst_funct(_st_io_cmd_bits_inst_funct),
		.io_in_0_bits_rs1(_st_io_cmd_bits_rs1),
		.io_in_0_bits_rs2(_st_io_cmd_bits_rs2),
		.io_in_1_ready(_arb_io_in_1_ready),
		.io_in_1_valid(_ex_io_cmd_valid),
		.io_in_1_bits_inst_funct(_ex_io_cmd_bits_inst_funct),
		.io_in_1_bits_rs1(_ex_io_cmd_bits_rs1),
		.io_in_1_bits_rs2(_ex_io_cmd_bits_rs2),
		.io_in_2_ready(_arb_io_in_2_ready),
		.io_in_2_valid(_ld_bias_io_cmd_valid),
		.io_in_2_bits_inst_funct(_ld_bias_io_cmd_bits_inst_funct),
		.io_in_2_bits_rs1(_ld_bias_io_cmd_bits_rs1),
		.io_in_2_bits_rs2(_ld_bias_io_cmd_bits_rs2),
		.io_in_3_ready(_arb_io_in_3_ready),
		.io_in_3_valid(_ld_weights_io_cmd_valid),
		.io_in_3_bits_inst_funct(_ld_weights_io_cmd_bits_inst_funct),
		.io_in_3_bits_rs1(_ld_weights_io_cmd_bits_rs1),
		.io_in_3_bits_rs2(_ld_weights_io_cmd_bits_rs2),
		.io_in_4_ready(_arb_io_in_4_ready),
		.io_in_4_valid(_ld_input_io_cmd_valid),
		.io_in_4_bits_inst_funct(_ld_input_io_cmd_bits_inst_funct),
		.io_in_4_bits_rs1(_ld_input_io_cmd_bits_rs1),
		.io_in_4_bits_rs2(_ld_input_io_cmd_bits_rs2),
		.io_out_ready(io_out_ready),
		.io_out_valid(_arb_io_out_valid),
		.io_out_bits_inst_funct(_arb_io_out_bits_inst_funct),
		.io_out_bits_rs1(_arb_io_out_bits_rs1),
		.io_out_bits_rs2(_arb_io_out_bits_rs2)
	);
	assign io_out_valid = (loop_configured ? _arb_io_out_valid : (_cmd_q_io_deq_valid & ~is_loop_config_cmd) & ~is_loop_run_cmd);
	assign io_out_bits_cmd_inst_funct = (loop_configured ? _arb_io_out_bits_inst_funct : _cmd_q_io_deq_bits_cmd_inst_funct);
	assign io_out_bits_cmd_inst_rs2 = (loop_configured ? 5'h00 : _cmd_q_io_deq_bits_cmd_inst_rs2);
	assign io_out_bits_cmd_inst_rs1 = (loop_configured ? 5'h00 : _cmd_q_io_deq_bits_cmd_inst_rs1);
	assign io_out_bits_cmd_inst_xd = ~loop_configured & _cmd_q_io_deq_bits_cmd_inst_xd;
	assign io_out_bits_cmd_inst_xs1 = ~loop_configured & _cmd_q_io_deq_bits_cmd_inst_xs1;
	assign io_out_bits_cmd_inst_xs2 = ~loop_configured & _cmd_q_io_deq_bits_cmd_inst_xs2;
	assign io_out_bits_cmd_inst_rd = (loop_configured ? 5'h00 : _cmd_q_io_deq_bits_cmd_inst_rd);
	assign io_out_bits_cmd_inst_opcode = (loop_configured ? 7'h00 : _cmd_q_io_deq_bits_cmd_inst_opcode);
	assign io_out_bits_cmd_rs1 = (loop_configured ? _arb_io_out_bits_rs1 : _cmd_q_io_deq_bits_cmd_rs1);
	assign io_out_bits_cmd_rs2 = (loop_configured ? _arb_io_out_bits_rs2 : _cmd_q_io_deq_bits_cmd_rs2);
	assign io_out_bits_from_matmul_fsm = ~loop_configured & _cmd_q_io_deq_bits_from_matmul_fsm;
	assign io_out_bits_from_conv_fsm = loop_configured | _cmd_q_io_deq_bits_from_conv_fsm;
	assign io_busy = _cmd_q_io_deq_valid | loop_configured;
endmodule
