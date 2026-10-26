module LoopConvExecute (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_outer_bounds_stride,
	io_req_bits_outer_bounds_kernel_dilation,
	io_req_bits_inner_bounds_batches,
	io_req_bits_inner_bounds_krows,
	io_req_bits_inner_bounds_kcols,
	io_req_bits_inner_bounds_kchs,
	io_req_bits_inner_bounds_lpad,
	io_req_bits_inner_bounds_upad,
	io_req_bits_inner_bounds_orows,
	io_req_bits_inner_bounds_ocols,
	io_req_bits_derived_params_ochs,
	io_req_bits_derived_params_irows,
	io_req_bits_derived_params_icols,
	io_req_bits_derived_params_out_channels_per_bank,
	io_req_bits_derived_params_in_channels_per_bank,
	io_req_bits_derived_params_input_spad_stride,
	io_req_bits_a_addr_start,
	io_req_bits_b_addr_end,
	io_req_bits_c_addr_start,
	io_req_bits_wrot180,
	io_req_bits_downsample,
	io_req_bits_max_pixels_per_row,
	io_req_bits_input_dilated,
	io_req_bits_trans_weight_0132,
	io_req_bits_trans_input_3120,
	io_req_bits_loop_id,
	io_cmd_ready,
	io_cmd_valid,
	io_cmd_bits_inst_funct,
	io_cmd_bits_rs1,
	io_cmd_bits_rs2,
	io_lda_completed,
	io_ldb_completed,
	io_ldd_completed,
	io_idle,
	io_rob_overloaded,
	io_loop_id
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [15:0] io_req_bits_outer_bounds_stride;
	input [15:0] io_req_bits_outer_bounds_kernel_dilation;
	input [15:0] io_req_bits_inner_bounds_batches;
	input [15:0] io_req_bits_inner_bounds_krows;
	input [15:0] io_req_bits_inner_bounds_kcols;
	input [15:0] io_req_bits_inner_bounds_kchs;
	input [15:0] io_req_bits_inner_bounds_lpad;
	input [15:0] io_req_bits_inner_bounds_upad;
	input [15:0] io_req_bits_inner_bounds_orows;
	input [15:0] io_req_bits_inner_bounds_ocols;
	input [15:0] io_req_bits_derived_params_ochs;
	input [15:0] io_req_bits_derived_params_irows;
	input [15:0] io_req_bits_derived_params_icols;
	input [15:0] io_req_bits_derived_params_out_channels_per_bank;
	input [15:0] io_req_bits_derived_params_in_channels_per_bank;
	input [15:0] io_req_bits_derived_params_input_spad_stride;
	input [13:0] io_req_bits_a_addr_start;
	input [14:0] io_req_bits_b_addr_end;
	input [9:0] io_req_bits_c_addr_start;
	input io_req_bits_wrot180;
	input io_req_bits_downsample;
	input [15:0] io_req_bits_max_pixels_per_row;
	input io_req_bits_input_dilated;
	input io_req_bits_trans_weight_0132;
	input io_req_bits_trans_input_3120;
	input io_req_bits_loop_id;
	input io_cmd_ready;
	output wire io_cmd_valid;
	output wire [6:0] io_cmd_bits_inst_funct;
	output wire [63:0] io_cmd_bits_rs1;
	output wire [63:0] io_cmd_bits_rs2;
	input io_lda_completed;
	input io_ldb_completed;
	input io_ldd_completed;
	output wire io_idle;
	input io_rob_overloaded;
	output wire io_loop_id;
	wire _command_p_io_in_ready;
	wire _command_p_io_out_valid;
	wire [6:0] _command_p_io_out_bits_cmd_inst_funct;
	wire [63:0] _command_p_io_out_bits_cmd_rs1;
	wire [63:0] _command_p_io_out_bits_cmd_rs2;
	wire [51:0] _command_p_io_out_bits_a_addr;
	wire [67:0] _command_p_io_out_bits_b_addr;
	wire [67:0] _command_p_io_out_bits_c_addr;
	wire [16:0] _command_p_io_out_bits_I;
	wire [15:0] _command_p_io_out_bits_J;
	wire [31:0] _command_p_io_out_bits_K;
	wire _command_p_io_out_bits_new_weights;
	wire _command_p_io_busy;
	reg [1:0] state;
	reg [15:0] req_outer_bounds_stride;
	reg [15:0] req_outer_bounds_kernel_dilation;
	reg [15:0] req_inner_bounds_batches;
	reg [15:0] req_inner_bounds_krows;
	reg [15:0] req_inner_bounds_kcols;
	reg [15:0] req_inner_bounds_kchs;
	reg [15:0] req_inner_bounds_lpad;
	reg [15:0] req_inner_bounds_upad;
	reg [15:0] req_inner_bounds_orows;
	reg [15:0] req_inner_bounds_ocols;
	reg [15:0] req_derived_params_ochs;
	reg [15:0] req_derived_params_irows;
	reg [15:0] req_derived_params_icols;
	reg [15:0] req_derived_params_out_channels_per_bank;
	reg [15:0] req_derived_params_in_channels_per_bank;
	reg [15:0] req_derived_params_input_spad_stride;
	reg [13:0] req_a_addr_start;
	reg [14:0] req_b_addr_end;
	reg [9:0] req_c_addr_start;
	reg req_wrot180;
	reg req_downsample;
	reg [15:0] req_max_pixels_per_row;
	reg req_input_dilated;
	reg req_trans_weight_0132;
	reg req_trans_input_3120;
	reg req_loop_id;
	wire [31:0] _GEN = {16'h0000, req_inner_bounds_kcols};
	wire [47:0] _GEN_0 = {32'h00000000, req_inner_bounds_krows};
	wire [63:0] _GEN_1 = {48'h000000000000, req_derived_params_ochs};
	wire [63:0] _GEN_2 = {48'h000000000000, req_inner_bounds_kchs};
	reg [15:0] och;
	reg [15:0] krow;
	reg [15:0] kcol;
	reg [15:0] kch;
	reg [15:0] b;
	reg [15:0] orow;
	reg [15:0] ocol;
	wire [31:0] _GEN_3 = {16'h0000, req_outer_bounds_kernel_dilation};
	wire [31:0] _irow_T_1 = {16'h0000, krow} * _GEN_3;
	wire [31:0] _icol_T_1 = {16'h0000, kcol} * _GEN_3;
	wire skip_iteration = (state[1] & req_input_dilated) & ((((_irow_T_1[0] + orow[0]) - req_inner_bounds_upad[0]) & req_input_dilated) | (((_icol_T_1[0] + ocol[0]) - req_inner_bounds_lpad[0]) & req_input_dilated));
	wire [15:0] _kcol_rot_T = req_inner_bounds_kcols - kcol;
	wire [31:0] _GEN_4 = {16'h0000, orow};
	wire [31:0] _GEN_5 = {16'h0000, req_outer_bounds_stride};
	wire [33:0] _GEN_6 = {33'h000000000, req_input_dilated};
	wire [15:0] _I_T_3 = req_inner_bounds_batches - b;
	wire [15:0] _I_T_11 = req_inner_bounds_ocols - ocol;
	wire [5:0] _ocol_it_T_1 = 6'h10 << req_input_dilated;
	wire [15:0] _GEN_7 = {10'h000, _ocol_it_T_1};
	wire [16:0] _GEN_8 = {16'h0000, req_input_dilated};
	wire [15:0] _J_T_3 = req_derived_params_ochs - och;
	wire [15:0] _K_T_3 = req_inner_bounds_kchs - kch;
	wire [31:0] _GEN_9 = {16'h0000, req_derived_params_input_spad_stride};
	wire [32:0] _GEN_10 = {19'h00000, req_a_addr_start};
	wire [15:0] _GEN_11 = {15'h0000, req_downsample};
	wire [31:0] _GEN_12 = {16'h0000, req_derived_params_irows >> _GEN_11};
	wire [15:0] _a_addr_T_23 = req_derived_params_icols >> _GEN_11;
	wire [47:0] _GEN_13 = {32'h00000000, _a_addr_T_23};
	wire [33:0] _GEN_14 = {33'h000000000, req_downsample};
	wire [49:0] _GEN_15 = {16'h0000, (({1'h0, {1'h0, _GEN_4 * _GEN_5} + {1'h0, _irow_T_1}} + _GEN_6) >> _GEN_6) >> _GEN_14};
	wire [49:0] _GEN_16 = {34'h000000000, _a_addr_T_23};
	wire [51:0] _GEN_17 = {18'h00000, (({1'h0, {1'h0, {16'h0000, ocol} * _GEN_5} + {1'h0, _icol_T_1}} + _GEN_6) >> _GEN_6) >> _GEN_14};
	wire [31:0] _GEN_18 = {16'h0000, kch / 16'h0010};
	wire [31:0] _GEN_19 = {16'h0000, b};
	wire [31:0] _GEN_20 = {16'h0000, och / 16'h0010};
	reg new_weights;
	wire [31:0] _GEN_21 = {16'h0000, req_inner_bounds_krows};
	wire [47:0] _GEN_22 = {32'h00000000, req_inner_bounds_kcols};
	wire [64:0] _GEN_23 = {1'h0, {49'h0000000000000, req_b_addr_end} - (req_trans_weight_0132 ? {16'h0000, {16'h0000, {16'h0000, req_derived_params_in_channels_per_bank} * _GEN} * _GEN_0} * _GEN_1 : {16'h0000, {16'h0000, {16'h0000, req_derived_params_out_channels_per_bank} * _GEN} * _GEN_0} * _GEN_2)};
	wire [47:0] _GEN_24 = {16'h0000, {16'h0000, (req_wrot180 ? (req_inner_bounds_krows - krow) - 16'h0001 : krow)} * _GEN};
	wire [31:0] _GEN_25 = {16'h0000, (req_wrot180 ? _kcol_rot_T - 16'h0001 : kcol)};
	wire _io_idle_T = state == 2'h0;
	wire io_req_ready_0 = _io_idle_T & ~_command_p_io_busy;
	wire _command_p_io_in_valid_T_3 = (((|state & ~skip_iteration) & io_lda_completed) & io_ldb_completed) & io_ldd_completed;
	wire _command_p_io_in_bits_cmd_T = state == 2'h2;
	wire _GEN_26 = _command_p_io_in_bits_cmd_T | &state;
	wire _GEN_27 = _command_p_io_out_bits_cmd_inst_funct == 7'h06;
	wire _GEN_28 = _command_p_io_in_ready & _command_p_io_in_valid_T_3;
	wire _GEN_29 = _GEN_28 | skip_iteration;
	wire _GEN_30 = state == 2'h1;
	wire [16:0] _next_ocol_T_3 = {1'h0, ocol} + {11'h000, (skip_iteration | req_trans_input_3120 ? 6'h01 : _ocol_it_T_1)};
	wire _next_ocol_T_4 = _next_ocol_T_3 > {1'h0, req_inner_bounds_ocols - 16'h0001};
	wire [15:0] next_ocol = (_next_ocol_T_4 ? 16'h0000 : _next_ocol_T_3[15:0]);
	wire [16:0] _next_orow_T_4 = {1'h0, orow} + 17'h00001;
	wire _next_orow_T_5 = _next_orow_T_4 > {1'h0, req_inner_bounds_orows - 16'h0001};
	wire _state_T_9 = (|next_ocol ? orow : (_next_orow_T_5 ? 16'h0000 : _next_orow_T_4[15:0])) == 16'h0000;
	wire _next_b_T_2 = _state_T_9 & ~(|next_ocol);
	wire [16:0] _next_b_T_6 = {1'h0, b} + {12'h000, (req_trans_input_3120 ? 5'h10 : 5'h01)};
	wire _next_b_T_7 = _next_b_T_6 > {1'h0, req_inner_bounds_batches - 16'h0001};
	wire _state_T_7 = (_next_b_T_2 ? (_next_b_T_7 ? 16'h0000 : _next_b_T_6[15:0]) : b) == 16'h0000;
	wire _next_kch_T_4 = (_state_T_7 & _state_T_9) & ~(|next_ocol);
	wire [16:0] _next_kch_T_8 = {1'h0, kch} + 17'h00010;
	wire _next_kch_T_9 = _next_kch_T_8 > {1'h0, req_inner_bounds_kchs - 16'h0001};
	wire _state_T_5 = (_next_kch_T_4 ? (_next_kch_T_9 ? 16'h0000 : _next_kch_T_8[15:0]) : kch) == 16'h0000;
	wire _next_kcol_T_6 = ((_state_T_5 & _state_T_7) & _state_T_9) & ~(|next_ocol);
	wire [16:0] _next_kcol_T_10 = {1'h0, kcol} + {1'h0, req_max_pixels_per_row};
	wire _next_kcol_T_11 = _next_kcol_T_10 > {1'h0, req_inner_bounds_kcols - 16'h0001};
	wire _state_T_3 = (_next_kcol_T_6 ? (_next_kcol_T_11 ? 16'h0000 : _next_kcol_T_10[15:0]) : kcol) == 16'h0000;
	wire _next_krow_T_8 = (((_state_T_3 & _state_T_5) & _state_T_7) & _state_T_9) & ~(|next_ocol);
	wire [16:0] _next_krow_T_12 = {1'h0, krow} + 17'h00001;
	wire _next_krow_T_13 = _next_krow_T_12 > {1'h0, req_inner_bounds_krows - 16'h0001};
	wire _state_T_1 = (_next_krow_T_8 ? (_next_krow_T_13 ? 16'h0000 : _next_krow_T_12[15:0]) : krow) == 16'h0000;
	wire _next_och_T_10 = ((((_state_T_1 & _state_T_3) & _state_T_5) & _state_T_7) & _state_T_9) & ~(|next_ocol);
	wire [16:0] _next_och_T_14 = {1'h0, och} + 17'h00010;
	wire _next_och_T_15 = _next_och_T_14 > {1'h0, req_derived_params_ochs - 16'h0001};
	wire _GEN_31 = _GEN_30 | _command_p_io_in_bits_cmd_T;
	wire _GEN_32 = io_req_ready_0 & io_req_valid;
	always @(posedge clock) begin
		if (reset)
			state <= 2'h0;
		else if (_GEN_32)
			state <= (io_req_bits_trans_input_3120 ? 2'h1 : 2'h2);
		else if (_GEN_29)
			if (_GEN_30)
				state <= 2'h2;
			else if (_command_p_io_in_bits_cmd_T)
				state <= 2'h3;
			else
				state <= {~((((((((_next_och_T_10 ? (_next_och_T_15 ? 16'h0000 : _next_och_T_14[15:0]) : och) == 16'h0000) & _state_T_1) & _state_T_3) & _state_T_5) & _state_T_7) & _state_T_9) & ~(|next_ocol)), 1'h0};
		if (_GEN_32) begin
			req_outer_bounds_stride <= io_req_bits_outer_bounds_stride;
			req_outer_bounds_kernel_dilation <= io_req_bits_outer_bounds_kernel_dilation;
			req_inner_bounds_batches <= io_req_bits_inner_bounds_batches;
			req_inner_bounds_krows <= io_req_bits_inner_bounds_krows;
			req_inner_bounds_kcols <= io_req_bits_inner_bounds_kcols;
			req_inner_bounds_kchs <= io_req_bits_inner_bounds_kchs;
			req_inner_bounds_lpad <= io_req_bits_inner_bounds_lpad;
			req_inner_bounds_upad <= io_req_bits_inner_bounds_upad;
			req_inner_bounds_orows <= io_req_bits_inner_bounds_orows;
			req_inner_bounds_ocols <= io_req_bits_inner_bounds_ocols;
			req_derived_params_ochs <= io_req_bits_derived_params_ochs;
			req_derived_params_irows <= io_req_bits_derived_params_irows;
			req_derived_params_icols <= io_req_bits_derived_params_icols;
			req_derived_params_out_channels_per_bank <= io_req_bits_derived_params_out_channels_per_bank;
			req_derived_params_in_channels_per_bank <= io_req_bits_derived_params_in_channels_per_bank;
			req_derived_params_input_spad_stride <= io_req_bits_derived_params_input_spad_stride;
			req_a_addr_start <= io_req_bits_a_addr_start;
			req_b_addr_end <= io_req_bits_b_addr_end;
			req_c_addr_start <= io_req_bits_c_addr_start;
			req_wrot180 <= io_req_bits_wrot180;
			req_downsample <= io_req_bits_downsample;
			req_max_pixels_per_row <= io_req_bits_max_pixels_per_row;
			req_input_dilated <= io_req_bits_input_dilated;
			req_trans_weight_0132 <= io_req_bits_trans_weight_0132;
			req_trans_input_3120 <= io_req_bits_trans_input_3120;
			req_loop_id <= io_req_bits_loop_id;
			och <= 16'h0000;
			krow <= 16'h0000;
			kcol <= 16'h0000;
			kch <= 16'h0000;
			b <= 16'h0000;
			orow <= 16'h0000;
			ocol <= 16'h0000;
		end
		else begin
			if (((~_GEN_29 | _GEN_30) | _command_p_io_in_bits_cmd_T) | ~_next_och_T_10)
				;
			else if (_next_och_T_15)
				och <= 16'h0000;
			else
				och <= _next_och_T_14[15:0];
			if (((~_GEN_29 | _GEN_30) | _command_p_io_in_bits_cmd_T) | ~_next_krow_T_8)
				;
			else if (_next_krow_T_13)
				krow <= 16'h0000;
			else
				krow <= _next_krow_T_12[15:0];
			if (((~_GEN_29 | _GEN_30) | _command_p_io_in_bits_cmd_T) | ~_next_kcol_T_6)
				;
			else if (_next_kcol_T_11)
				kcol <= 16'h0000;
			else
				kcol <= _next_kcol_T_10[15:0];
			if (((~_GEN_29 | _GEN_30) | _command_p_io_in_bits_cmd_T) | ~_next_kch_T_4)
				;
			else if (_next_kch_T_9)
				kch <= 16'h0000;
			else
				kch <= _next_kch_T_8[15:0];
			if (((~_GEN_29 | _GEN_30) | _command_p_io_in_bits_cmd_T) | ~_next_b_T_2)
				;
			else if (_next_b_T_7)
				b <= 16'h0000;
			else
				b <= _next_b_T_6[15:0];
			if (((~_GEN_29 | _GEN_30) | _command_p_io_in_bits_cmd_T) | |next_ocol)
				;
			else if (_next_orow_T_5)
				orow <= 16'h0000;
			else
				orow <= _next_orow_T_4[15:0];
			if (~_GEN_29 | _GEN_31)
				;
			else if (_next_ocol_T_4)
				ocol <= 16'h0000;
			else
				ocol <= _next_ocol_T_3[15:0];
		end
		new_weights <= (_GEN_32 | ((((_GEN_29 & ~_GEN_31) & _state_T_7) & _state_T_9) & ~(|next_ocol))) | (~(&state & _GEN_28) & new_weights);
	end
	Pipeline_5 command_p(
		.clock(clock),
		.reset(reset),
		.io_in_ready(_command_p_io_in_ready),
		.io_in_valid(_command_p_io_in_valid_T_3),
		.io_in_bits_cmd_inst_funct((_command_p_io_in_bits_cmd_T ? 7'h06 : (&state ? {6'h02, ~new_weights} : 7'h00))),
		.io_in_bits_cmd_rs1((_GEN_26 ? 64'h0000000000000000 : {32'h00000000, req_derived_params_irows * req_derived_params_icols, 16'h0080})),
		.io_in_bits_cmd_rs2((_GEN_26 ? 64'h0000000000000000 : {req_inner_bounds_orows * req_inner_bounds_ocols, 48'h000000000000})),
		.io_in_bits_a_addr((req_trans_input_3120 ? {1'h0, {2'h0, {16'h0000, _GEN_10 + {1'h0, {16'h0000, b / 16'h0010} * _GEN_9}} + {1'h0, {16'h0000, {16'h0000, kch} * _GEN_12} * _GEN_13}} + {1'h0, _GEN_15 * _GEN_16}} + _GEN_17 : {1'h0, {2'h0, {16'h0000, _GEN_10 + {1'h0, _GEN_18 * _GEN_9}} + {1'h0, {16'h0000, _GEN_19 * _GEN_12} * _GEN_13}} + {1'h0, _GEN_15 * _GEN_16}} + _GEN_17)),
		.io_in_bits_b_addr((req_trans_weight_0132 ? {1'h0, {1'h0, {1'h0, _GEN_23 + {1'h0, {16'h0000, {16'h0000, _GEN_18 * _GEN_21} * _GEN_22} * _GEN_1}} + {18'h00000, _GEN_24 * {32'h00000000, req_derived_params_ochs}}} + {35'h000000000, _GEN_25 * {16'h0000, req_derived_params_ochs}}} + {52'h0000000000000, och} : {1'h0, {1'h0, {1'h0, _GEN_23 + {1'h0, {16'h0000, {16'h0000, _GEN_20 * _GEN_21} * _GEN_22} * _GEN_2}} + {18'h00000, _GEN_24 * {32'h00000000, req_inner_bounds_kchs}}} + {35'h000000000, _GEN_25 * {16'h0000, req_inner_bounds_kchs}}} + {52'h0000000000000, kch})),
		.io_in_bits_c_addr({1'h0, {1'h0, {1'h0, {55'h00000000000000, req_c_addr_start} + {1'h0, {16'h0000, {16'h0000, _GEN_20 * {16'h0000, req_inner_bounds_batches}} * {32'h00000000, req_inner_bounds_orows}} * {48'h000000000000, req_inner_bounds_ocols}}} + {18'h00000, {16'h0000, _GEN_19 * {16'h0000, req_inner_bounds_orows}} * {32'h00000000, req_inner_bounds_ocols}}} + {35'h000000000, _GEN_4 * {16'h0000, req_inner_bounds_ocols}}} + {52'h0000000000000, ocol}),
		.io_in_bits_I((req_trans_input_3120 ? {1'h0, (_I_T_3 > 16'h0010 ? 16'h0010 : _I_T_3)} : ({1'h0, (_I_T_11 > _GEN_7 ? _GEN_7 : _I_T_11)} + _GEN_8) >> _GEN_8)),
		.io_in_bits_J((_J_T_3 > 16'h0010 ? 16'h0010 : _J_T_3)),
		.io_in_bits_K({16'h0000, (_kcol_rot_T > req_max_pixels_per_row ? req_max_pixels_per_row : _kcol_rot_T)} * {16'h0000, (_K_T_3 > 16'h0010 ? 16'h0010 : _K_T_3)}),
		.io_in_bits_new_weights(new_weights),
		.io_out_ready(io_cmd_ready & ~io_rob_overloaded),
		.io_out_valid(_command_p_io_out_valid),
		.io_out_bits_cmd_inst_funct(_command_p_io_out_bits_cmd_inst_funct),
		.io_out_bits_cmd_rs1(_command_p_io_out_bits_cmd_rs1),
		.io_out_bits_cmd_rs2(_command_p_io_out_bits_cmd_rs2),
		.io_out_bits_a_addr(_command_p_io_out_bits_a_addr),
		.io_out_bits_b_addr(_command_p_io_out_bits_b_addr),
		.io_out_bits_c_addr(_command_p_io_out_bits_c_addr),
		.io_out_bits_I(_command_p_io_out_bits_I),
		.io_out_bits_J(_command_p_io_out_bits_J),
		.io_out_bits_K(_command_p_io_out_bits_K),
		.io_out_bits_new_weights(_command_p_io_out_bits_new_weights),
		.io_busy(_command_p_io_busy)
	);
	assign io_req_ready = io_req_ready_0;
	assign io_cmd_valid = _command_p_io_out_valid & ~io_rob_overloaded;
	assign io_cmd_bits_inst_funct = _command_p_io_out_bits_cmd_inst_funct;
	assign io_cmd_bits_rs1 = (_GEN_27 ? {11'h000, _command_p_io_out_bits_K[4:0], 9'h000, _command_p_io_out_bits_J[6:0], ~_command_p_io_out_bits_new_weights, ~_command_p_io_out_bits_new_weights, ~_command_p_io_out_bits_new_weights, (_command_p_io_out_bits_new_weights ? _command_p_io_out_bits_b_addr[28:26] : 3'h0), 11'h000, ~_command_p_io_out_bits_new_weights | _command_p_io_out_bits_b_addr[14], (_command_p_io_out_bits_new_weights ? _command_p_io_out_bits_b_addr[13:0] : 14'h3fff)} : (|_command_p_io_out_bits_cmd_inst_funct ? {11'h000, _command_p_io_out_bits_I[4:0], 9'h000, _command_p_io_out_bits_K[6:0], 3'h0, _command_p_io_out_bits_a_addr[28:26], 11'h000, _command_p_io_out_bits_a_addr[14:0]} : _command_p_io_out_bits_cmd_rs1));
	assign io_cmd_bits_rs2 = (_GEN_27 ? {11'h000, _command_p_io_out_bits_I[4:0], 9'h000, _command_p_io_out_bits_J[6:0], 3'h6, _command_p_io_out_bits_c_addr[28:26], 11'h000, _command_p_io_out_bits_c_addr[14:0]} : (|_command_p_io_out_bits_cmd_inst_funct ? {11'h000, _command_p_io_out_bits_I[4:0], 9'h000, _command_p_io_out_bits_J[6:0], 32'he0007fff} : _command_p_io_out_bits_cmd_rs2));
	assign io_idle = _io_idle_T & ~_command_p_io_busy;
	assign io_loop_id = req_loop_id;
endmodule
