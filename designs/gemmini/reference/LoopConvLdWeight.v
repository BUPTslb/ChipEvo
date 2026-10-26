module LoopConvLdWeight (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_outer_bounds_in_channels,
	io_req_bits_outer_bounds_out_channels,
	io_req_bits_outer_bounds_weight_stride,
	io_req_bits_outer_bounds_kernel_dim,
	io_req_bits_inner_bounds_krows,
	io_req_bits_inner_bounds_kcols,
	io_req_bits_inner_bounds_kchs,
	io_req_bits_derived_params_ochs,
	io_req_bits_derived_params_out_channels_per_bank,
	io_req_bits_derived_params_in_channels_per_bank,
	io_req_bits_derived_params_weight_spad_stride,
	io_req_bits_addr_end,
	io_req_bits_dram_addr,
	io_req_bits_trans_weight_1203,
	io_req_bits_trans_weight_0132,
	io_req_bits_dw,
	io_req_bits_loop_id,
	io_cmd_ready,
	io_cmd_valid,
	io_cmd_bits_inst_funct,
	io_cmd_bits_rs1,
	io_cmd_bits_rs2,
	io_idle,
	io_rob_overloaded,
	io_wait_for_prev_loop,
	io_loop_id
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [15:0] io_req_bits_outer_bounds_in_channels;
	input [15:0] io_req_bits_outer_bounds_out_channels;
	input [15:0] io_req_bits_outer_bounds_weight_stride;
	input [15:0] io_req_bits_outer_bounds_kernel_dim;
	input [15:0] io_req_bits_inner_bounds_krows;
	input [15:0] io_req_bits_inner_bounds_kcols;
	input [15:0] io_req_bits_inner_bounds_kchs;
	input [15:0] io_req_bits_derived_params_ochs;
	input [15:0] io_req_bits_derived_params_out_channels_per_bank;
	input [15:0] io_req_bits_derived_params_in_channels_per_bank;
	input [15:0] io_req_bits_derived_params_weight_spad_stride;
	input [14:0] io_req_bits_addr_end;
	input [39:0] io_req_bits_dram_addr;
	input io_req_bits_trans_weight_1203;
	input io_req_bits_trans_weight_0132;
	input io_req_bits_dw;
	input io_req_bits_loop_id;
	input io_cmd_ready;
	output wire io_cmd_valid;
	output wire [6:0] io_cmd_bits_inst_funct;
	output wire [63:0] io_cmd_bits_rs1;
	output wire [63:0] io_cmd_bits_rs2;
	output wire io_idle;
	input io_rob_overloaded;
	input io_wait_for_prev_loop;
	output wire io_loop_id;
	wire _command_p_io_in_ready;
	wire _command_p_io_out_valid;
	wire [6:0] _command_p_io_out_bits_cmd_inst_funct;
	wire [63:0] _command_p_io_out_bits_cmd_rs1;
	wire [63:0] _command_p_io_out_bits_cmd_rs2;
	wire [67:0] _command_p_io_out_bits_dram_addr;
	wire [63:0] _command_p_io_out_bits_spad_addr;
	wire [15:0] _command_p_io_out_bits_K;
	wire [15:0] _command_p_io_out_bits_J;
	wire _command_p_io_busy;
	reg [1:0] state;
	reg [15:0] req_outer_bounds_in_channels;
	reg [15:0] req_outer_bounds_out_channels;
	reg [15:0] req_outer_bounds_weight_stride;
	reg [15:0] req_outer_bounds_kernel_dim;
	reg [15:0] req_inner_bounds_krows;
	reg [15:0] req_inner_bounds_kcols;
	reg [15:0] req_inner_bounds_kchs;
	reg [15:0] req_derived_params_ochs;
	reg [15:0] req_derived_params_out_channels_per_bank;
	reg [15:0] req_derived_params_in_channels_per_bank;
	reg [15:0] req_derived_params_weight_spad_stride;
	reg [14:0] req_addr_end;
	reg [39:0] req_dram_addr;
	reg req_trans_weight_1203;
	reg req_trans_weight_0132;
	reg req_dw;
	reg req_loop_id;
	wire [15:0] max_chs_per_mvin_max_ochs_per_mvin = (req_derived_params_ochs < 16'h0040 ? req_derived_params_ochs : 16'h0040);
	wire [15:0] max_chs_per_mvin_max_kchs_per_mvin = (req_inner_bounds_kchs < 16'h0040 ? req_inner_bounds_kchs : 16'h0040);
	wire [15:0] max_chs_per_mvin = (req_trans_weight_0132 ? max_chs_per_mvin_max_kchs_per_mvin : max_chs_per_mvin_max_ochs_per_mvin);
	wire [31:0] _GEN = {16'h0000, req_inner_bounds_kcols};
	wire [47:0] _GEN_0 = {32'h00000000, req_inner_bounds_krows};
	wire [63:0] _GEN_1 = {48'h000000000000, req_derived_params_ochs};
	wire [63:0] _GEN_2 = {48'h000000000000, req_inner_bounds_kchs};
	wire [63:0] _addr_start_T = {49'h0000000000000, req_addr_end} - (req_trans_weight_0132 ? {16'h0000, {16'h0000, {16'h0000, req_derived_params_in_channels_per_bank} * _GEN} * _GEN_0} * _GEN_1 : {16'h0000, {16'h0000, {16'h0000, req_derived_params_out_channels_per_bank} * _GEN} * _GEN_0} * _GEN_2);
	wire [31:0] _GEN_3 = {16'h0000, req_outer_bounds_kernel_dim};
	reg [15:0] och;
	reg [15:0] krow;
	reg [15:0] kcol;
	reg [15:0] kch;
	wire [31:0] _GEN_4 = {16'h0000, krow};
	wire [31:0] _dram_offset_T_19 = _GEN_4 * _GEN_3;
	wire [31:0] _GEN_5 = {16'h0000, req_outer_bounds_in_channels};
	wire [31:0] _GEN_6 = {16'h0000, kcol};
	wire [31:0] _GEN_7 = {16'h0000, kch};
	wire [31:0] _GEN_8 = {16'h0000, och};
	wire [31:0] _GEN_9 = {16'h0000, req_outer_bounds_out_channels};
	wire [31:0] _GEN_10 = {16'h0000, req_inner_bounds_krows};
	wire [47:0] _GEN_11 = {32'h00000000, req_inner_bounds_kcols};
	wire [47:0] _GEN_12 = {16'h0000, _GEN_4 * _GEN};
	wire [15:0] _K_T_9 = req_inner_bounds_kchs - kch;
	wire [15:0] _K_T_3 = req_derived_params_ochs - och;
	wire _io_idle_T = state == 2'h0;
	wire io_req_ready_0 = _io_idle_T & ~_command_p_io_busy;
	wire _command_p_io_in_valid_T_4 = (|state & ~io_wait_for_prev_loop) & |req_dram_addr;
	wire _command_p_io_in_bits_cmd_T = state == 2'h1;
	wire _GEN_13 = _command_p_io_out_bits_cmd_inst_funct == 7'h01;
	wire _GEN_14 = req_dram_addr == 40'h0000000000;
	wire _GEN_15 = _command_p_io_in_ready & _command_p_io_in_valid_T_4;
	wire [16:0] _next_kch_T_3 = {1'h0, kch} + {1'h0, (req_trans_weight_0132 ? max_chs_per_mvin_max_kchs_per_mvin : 16'h0010)};
	wire _next_kch_T_4 = _next_kch_T_3 > {1'h0, req_inner_bounds_kchs - 16'h0001};
	wire [15:0] next_kch = (_next_kch_T_4 ? 16'h0000 : _next_kch_T_3[15:0]);
	wire [16:0] _next_kcol_T_4 = {1'h0, kcol} + 17'h00001;
	wire _next_kcol_T_5 = _next_kcol_T_4 > {1'h0, req_inner_bounds_kcols - 16'h0001};
	wire _state_T_3 = (|next_kch ? kcol : (_next_kcol_T_5 ? 16'h0000 : _next_kcol_T_4[15:0])) == 16'h0000;
	wire _next_krow_T_2 = _state_T_3 & ~(|next_kch);
	wire [16:0] _next_krow_T_6 = {1'h0, krow} + 17'h00001;
	wire _next_krow_T_7 = _next_krow_T_6 > {1'h0, req_inner_bounds_krows - 16'h0001};
	wire _state_T_1 = (_next_krow_T_2 ? (_next_krow_T_7 ? 16'h0000 : _next_krow_T_6[15:0]) : krow) == 16'h0000;
	wire _next_och_T_4 = (_state_T_1 & _state_T_3) & ~(|next_kch);
	wire [16:0] _next_och_T_8 = {1'h0, och} + {1'h0, (req_trans_weight_0132 ? 16'h0010 : max_chs_per_mvin_max_ochs_per_mvin)};
	wire _next_och_T_9 = _next_och_T_8 > {1'h0, req_derived_params_ochs - 16'h0001};
	wire _GEN_16 = io_req_ready_0 & io_req_valid;
	always @(posedge clock) begin
		if (reset)
			state <= 2'h0;
		else if (_GEN_16)
			state <= 2'h1;
		else if (_GEN_14)
			state <= 2'h0;
		else if (_GEN_15)
			if (_command_p_io_in_bits_cmd_T)
				state <= 2'h2;
			else
				state <= {~(((((_next_och_T_4 ? (_next_och_T_9 ? 16'h0000 : _next_och_T_8[15:0]) : och) == 16'h0000) & _state_T_1) & _state_T_3) & ~(|next_kch)), 1'h0};
		if (_GEN_16) begin
			req_outer_bounds_in_channels <= io_req_bits_outer_bounds_in_channels;
			req_outer_bounds_out_channels <= io_req_bits_outer_bounds_out_channels;
			req_outer_bounds_weight_stride <= io_req_bits_outer_bounds_weight_stride;
			req_outer_bounds_kernel_dim <= io_req_bits_outer_bounds_kernel_dim;
			req_inner_bounds_krows <= io_req_bits_inner_bounds_krows;
			req_inner_bounds_kcols <= io_req_bits_inner_bounds_kcols;
			req_inner_bounds_kchs <= io_req_bits_inner_bounds_kchs;
			req_derived_params_ochs <= io_req_bits_derived_params_ochs;
			req_derived_params_out_channels_per_bank <= io_req_bits_derived_params_out_channels_per_bank;
			req_derived_params_in_channels_per_bank <= io_req_bits_derived_params_in_channels_per_bank;
			req_derived_params_weight_spad_stride <= io_req_bits_derived_params_weight_spad_stride;
			req_addr_end <= io_req_bits_addr_end;
			req_dram_addr <= io_req_bits_dram_addr;
			req_trans_weight_1203 <= io_req_bits_trans_weight_1203;
			req_trans_weight_0132 <= io_req_bits_trans_weight_0132;
			req_dw <= io_req_bits_dw;
			req_loop_id <= io_req_bits_loop_id;
			och <= 16'h0000;
			krow <= 16'h0000;
			kcol <= 16'h0000;
			kch <= 16'h0000;
		end
		else begin
			if (((_GEN_14 | ~_GEN_15) | _command_p_io_in_bits_cmd_T) | ~_next_och_T_4)
				;
			else if (_next_och_T_9)
				och <= 16'h0000;
			else
				och <= _next_och_T_8[15:0];
			if (((_GEN_14 | ~_GEN_15) | _command_p_io_in_bits_cmd_T) | ~_next_krow_T_2)
				;
			else if (_next_krow_T_7)
				krow <= 16'h0000;
			else
				krow <= _next_krow_T_6[15:0];
			if (((_GEN_14 | ~_GEN_15) | _command_p_io_in_bits_cmd_T) | |next_kch)
				;
			else if (_next_kcol_T_5)
				kcol <= 16'h0000;
			else
				kcol <= _next_kcol_T_4[15:0];
			if ((_GEN_14 | ~_GEN_15) | _command_p_io_in_bits_cmd_T)
				;
			else if (_next_kch_T_4)
				kch <= 16'h0000;
			else
				kch <= _next_kch_T_3[15:0];
		end
	end
	Pipeline_4 command_p(
		.clock(clock),
		.reset(reset),
		.io_in_ready(_command_p_io_in_ready),
		.io_in_valid(_command_p_io_in_valid_T_4),
		.io_in_bits_cmd_inst_funct({6'h00, ~_command_p_io_in_bits_cmd_T}),
		.io_in_bits_cmd_rs1((_command_p_io_in_bits_cmd_T ? {34'h0fe000000, req_derived_params_weight_spad_stride[13:0], 16'h0109} : 64'h0000000000000000)),
		.io_in_bits_cmd_rs2((_command_p_io_in_bits_cmd_T ? {16'h0000, (req_dw ? 48'h000000000001 : (req_trans_weight_1203 ? {16'h0000, _GEN_3 * _GEN_3} * {32'h00000000, req_outer_bounds_out_channels} : {32'h00000000, (req_trans_weight_0132 ? req_outer_bounds_in_channels : req_outer_bounds_weight_stride)}))} : 64'h0000000000000000)),
		.io_in_bits_dram_addr({27'h0000000, {9'h000, (req_dw ? _dram_offset_T_19 + _GEN_6 : (req_trans_weight_1203 ? (((((_GEN_7 * _GEN_3) * _GEN_3) + _dram_offset_T_19) + _GEN_6) * _GEN_9) + _GEN_8 : (req_trans_weight_0132 ? ((((_dram_offset_T_19 * _GEN_9) + (_GEN_6 * _GEN_9)) + _GEN_8) * _GEN_5) + _GEN_7 : ((((_dram_offset_T_19 * _GEN_5) + (_GEN_6 * _GEN_5)) + _GEN_7) * {16'h0000, req_outer_bounds_weight_stride}) + _GEN_8)))} + {1'h0, req_dram_addr}}),
		.io_in_bits_spad_addr((req_trans_weight_0132 ? (((_addr_start_T + ({16'h0000, {16'h0000, {16'h0000, kch / 16'h0010} * _GEN_10} * _GEN_11} * _GEN_1)) + {16'h0000, _GEN_12 * {32'h00000000, req_derived_params_ochs}}) + {32'h00000000, _GEN_6 * {16'h0000, req_derived_params_ochs}}) + {48'h000000000000, och} : (((_addr_start_T + ({16'h0000, {16'h0000, {16'h0000, och / 16'h0010} * _GEN_10} * _GEN_11} * _GEN_2)) + {16'h0000, _GEN_12 * {32'h00000000, req_inner_bounds_kchs}}) + {32'h00000000, _GEN_6 * {16'h0000, req_inner_bounds_kchs}}) + {48'h000000000000, kch})),
		.io_in_bits_K((req_trans_weight_0132 ? (_K_T_3 > 16'h0010 ? 16'h0010 : _K_T_3) : (_K_T_9 > 16'h0010 ? 16'h0010 : _K_T_9))),
		.io_in_bits_J((req_trans_weight_0132 ? (_K_T_9 > max_chs_per_mvin ? max_chs_per_mvin_max_kchs_per_mvin : _K_T_9) : (_K_T_3 > max_chs_per_mvin ? max_chs_per_mvin_max_ochs_per_mvin : _K_T_3))),
		.io_out_ready(io_cmd_ready & ~io_rob_overloaded),
		.io_out_valid(_command_p_io_out_valid),
		.io_out_bits_cmd_inst_funct(_command_p_io_out_bits_cmd_inst_funct),
		.io_out_bits_cmd_rs1(_command_p_io_out_bits_cmd_rs1),
		.io_out_bits_cmd_rs2(_command_p_io_out_bits_cmd_rs2),
		.io_out_bits_dram_addr(_command_p_io_out_bits_dram_addr),
		.io_out_bits_spad_addr(_command_p_io_out_bits_spad_addr),
		.io_out_bits_K(_command_p_io_out_bits_K),
		.io_out_bits_J(_command_p_io_out_bits_J),
		.io_busy(_command_p_io_busy)
	);
	assign io_req_ready = io_req_ready_0;
	assign io_cmd_valid = _command_p_io_out_valid & ~io_rob_overloaded;
	assign io_cmd_bits_inst_funct = _command_p_io_out_bits_cmd_inst_funct;
	assign io_cmd_bits_rs1 = (_GEN_13 ? _command_p_io_out_bits_dram_addr[63:0] : _command_p_io_out_bits_cmd_rs1);
	assign io_cmd_bits_rs2 = (_GEN_13 ? {11'h000, _command_p_io_out_bits_K[4:0], 9'h000, _command_p_io_out_bits_J[6:0], 3'h0, _command_p_io_out_bits_spad_addr[28:26], 11'h000, _command_p_io_out_bits_spad_addr[14:0]} : _command_p_io_out_bits_cmd_rs2);
	assign io_idle = _io_idle_T & ~_command_p_io_busy;
	assign io_loop_id = req_loop_id;
endmodule
