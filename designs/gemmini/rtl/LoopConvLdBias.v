module LoopConvLdBias (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_inner_bounds_batches,
	io_req_bits_inner_bounds_orows,
	io_req_bits_inner_bounds_ocols,
	io_req_bits_derived_params_ochs,
	io_req_bits_derived_params_bias_spad_stride,
	io_req_bits_addr_start,
	io_req_bits_dram_addr,
	io_req_bits_no_bias,
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
	input [15:0] io_req_bits_inner_bounds_batches;
	input [15:0] io_req_bits_inner_bounds_orows;
	input [15:0] io_req_bits_inner_bounds_ocols;
	input [15:0] io_req_bits_derived_params_ochs;
	input [15:0] io_req_bits_derived_params_bias_spad_stride;
	input [9:0] io_req_bits_addr_start;
	input [39:0] io_req_bits_dram_addr;
	input io_req_bits_no_bias;
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
	wire [39:0] _command_p_io_out_bits_dram_addr;
	wire [67:0] _command_p_io_out_bits_spad_addr;
	wire [15:0] _command_p_io_out_bits_I;
	wire [15:0] _command_p_io_out_bits_J;
	wire _command_p_io_busy;
	reg [1:0] state;
	reg [15:0] req_inner_bounds_batches;
	reg [15:0] req_inner_bounds_orows;
	reg [15:0] req_inner_bounds_ocols;
	reg [15:0] req_derived_params_ochs;
	reg [15:0] req_derived_params_bias_spad_stride;
	reg [9:0] req_addr_start;
	reg [39:0] req_dram_addr;
	reg req_no_bias;
	reg req_loop_id;
	wire [15:0] max_ochs_per_mvin = (req_derived_params_ochs < 16'h0010 ? req_derived_params_ochs : 16'h0010);
	reg [15:0] b;
	reg [15:0] orow;
	reg [15:0] ocol;
	reg [15:0] och;
	wire [15:0] _I_T_3 = req_inner_bounds_ocols - ocol;
	wire [15:0] _J_T_3 = req_derived_params_ochs - och;
	wire _io_idle_T = state == 2'h0;
	wire io_req_ready_0 = _io_idle_T & ~_command_p_io_busy;
	wire _command_p_io_in_valid_T_4 = (|state & ~io_wait_for_prev_loop) & |req_dram_addr;
	wire _command_p_io_in_bits_cmd_T = state == 2'h1;
	wire _GEN = _command_p_io_out_bits_cmd_inst_funct == 7'h0e;
	wire _GEN_0 = _command_p_io_in_ready & _command_p_io_in_valid_T_4;
	wire [16:0] _next_och_T_3 = {1'h0, och} + {1'h0, max_ochs_per_mvin};
	wire _next_och_T_4 = _next_och_T_3 > {1'h0, req_derived_params_ochs - 16'h0001};
	wire [15:0] next_och = (_next_och_T_4 ? 16'h0000 : _next_och_T_3[15:0]);
	wire [16:0] _next_ocol_T_4 = {1'h0, ocol} + 17'h00010;
	wire _next_ocol_T_5 = _next_ocol_T_4 > {1'h0, req_inner_bounds_ocols - 16'h0001};
	wire _state_T_3 = (|next_och ? ocol : (_next_ocol_T_5 ? 16'h0000 : _next_ocol_T_4[15:0])) == 16'h0000;
	wire _next_orow_T_2 = _state_T_3 & ~(|next_och);
	wire [16:0] _next_orow_T_6 = {1'h0, orow} + 17'h00001;
	wire _next_orow_T_7 = _next_orow_T_6 > {1'h0, req_inner_bounds_orows - 16'h0001};
	wire _state_T_1 = (_next_orow_T_2 ? (_next_orow_T_7 ? 16'h0000 : _next_orow_T_6[15:0]) : orow) == 16'h0000;
	wire _next_b_T_4 = (_state_T_1 & _state_T_3) & ~(|next_och);
	wire [16:0] _next_b_T_8 = {1'h0, b} + 17'h00001;
	wire _next_b_T_9 = _next_b_T_8 > {1'h0, req_inner_bounds_batches - 16'h0001};
	wire _GEN_1 = io_req_ready_0 & io_req_valid;
	always @(posedge clock) begin
		if (reset)
			state <= 2'h0;
		else if (_GEN_1)
			state <= 2'h1;
		else if (|req_dram_addr) begin
			if (_GEN_0)
				if (_command_p_io_in_bits_cmd_T)
					state <= 2'h2;
				else
					state <= {~(((((_next_b_T_4 ? (_next_b_T_9 ? 16'h0000 : _next_b_T_8[15:0]) : b) == 16'h0000) & _state_T_1) & _state_T_3) & ~(|next_och)), 1'h0};
		end
		else
			state <= 2'h0;
		if (_GEN_1) begin
			req_inner_bounds_batches <= io_req_bits_inner_bounds_batches;
			req_inner_bounds_orows <= io_req_bits_inner_bounds_orows;
			req_inner_bounds_ocols <= io_req_bits_inner_bounds_ocols;
			req_derived_params_ochs <= io_req_bits_derived_params_ochs;
			req_derived_params_bias_spad_stride <= io_req_bits_derived_params_bias_spad_stride;
			req_addr_start <= io_req_bits_addr_start;
			req_dram_addr <= io_req_bits_dram_addr;
			req_no_bias <= io_req_bits_no_bias;
			req_loop_id <= io_req_bits_loop_id;
			b <= 16'h0000;
			orow <= 16'h0000;
			ocol <= 16'h0000;
			och <= 16'h0000;
		end
		else begin
			if (((~(|req_dram_addr) | ~_GEN_0) | _command_p_io_in_bits_cmd_T) | ~_next_b_T_4)
				;
			else if (_next_b_T_9)
				b <= 16'h0000;
			else
				b <= _next_b_T_8[15:0];
			if (((~(|req_dram_addr) | ~_GEN_0) | _command_p_io_in_bits_cmd_T) | ~_next_orow_T_2)
				;
			else if (_next_orow_T_7)
				orow <= 16'h0000;
			else
				orow <= _next_orow_T_6[15:0];
			if (((~(|req_dram_addr) | ~_GEN_0) | _command_p_io_in_bits_cmd_T) | |next_och)
				;
			else if (_next_ocol_T_5)
				ocol <= 16'h0000;
			else
				ocol <= _next_ocol_T_4[15:0];
			if ((~(|req_dram_addr) | ~_GEN_0) | _command_p_io_in_bits_cmd_T)
				;
			else if (_next_och_T_4)
				och <= 16'h0000;
			else
				och <= _next_och_T_3[15:0];
		end
	end
	Pipeline_2 command_p(
		.clock(clock),
		.reset(reset),
		.io_in_ready(_command_p_io_in_ready),
		.io_in_valid(_command_p_io_in_valid_T_4),
		.io_in_bits_cmd_inst_funct((_command_p_io_in_bits_cmd_T ? 7'h00 : 7'h0e)),
		.io_in_bits_cmd_rs1((_command_p_io_in_bits_cmd_T ? {34'h0fe000000, req_derived_params_bias_spad_stride[13:0], 16'h0111} : 64'h0000000000000000)),
		.io_in_bits_dram_addr((req_no_bias ? 40'h0000000000 : {22'h000000, och, 2'h0} + req_dram_addr)),
		.io_in_bits_spad_addr({1'h0, {1'h0, {1'h0, {55'h00000000000000, req_addr_start} + {1'h0, {16'h0000, {16'h0000, {16'h0000, och / 16'h0010} * {16'h0000, req_inner_bounds_batches}} * {32'h00000000, req_inner_bounds_orows}} * {48'h000000000000, req_inner_bounds_ocols}}} + {18'h00000, {16'h0000, {16'h0000, b} * {16'h0000, req_inner_bounds_orows}} * {32'h00000000, req_inner_bounds_ocols}}} + {35'h000000000, {16'h0000, orow} * {16'h0000, req_inner_bounds_ocols}}} + {52'h0000000000000, ocol}),
		.io_in_bits_I((_I_T_3 > 16'h0010 ? 16'h0010 : _I_T_3)),
		.io_in_bits_J((_J_T_3 > max_ochs_per_mvin ? max_ochs_per_mvin : _J_T_3)),
		.io_out_ready(io_cmd_ready & ~io_rob_overloaded),
		.io_out_valid(_command_p_io_out_valid),
		.io_out_bits_cmd_inst_funct(_command_p_io_out_bits_cmd_inst_funct),
		.io_out_bits_cmd_rs1(_command_p_io_out_bits_cmd_rs1),
		.io_out_bits_dram_addr(_command_p_io_out_bits_dram_addr),
		.io_out_bits_spad_addr(_command_p_io_out_bits_spad_addr),
		.io_out_bits_I(_command_p_io_out_bits_I),
		.io_out_bits_J(_command_p_io_out_bits_J),
		.io_busy(_command_p_io_busy)
	);
	assign io_req_ready = io_req_ready_0;
	assign io_cmd_valid = _command_p_io_out_valid & ~io_rob_overloaded;
	assign io_cmd_bits_inst_funct = _command_p_io_out_bits_cmd_inst_funct;
	assign io_cmd_bits_rs1 = (_GEN ? {24'h000000, _command_p_io_out_bits_dram_addr} : _command_p_io_out_bits_cmd_rs1);
	assign io_cmd_bits_rs2 = (_GEN ? {11'h000, _command_p_io_out_bits_I[4:0], 9'h000, _command_p_io_out_bits_J[6:0], 3'h4, _command_p_io_out_bits_spad_addr[28:26], 11'h000, _command_p_io_out_bits_spad_addr[14:0]} : 64'h0000000000000000);
	assign io_idle = _io_idle_T & ~_command_p_io_busy;
	assign io_loop_id = req_loop_id;
endmodule
