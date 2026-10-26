module TransposePreloadUnroller (
	clock,
	reset,
	io_in_ready,
	io_in_valid,
	io_in_bits_cmd_inst_funct,
	io_in_bits_cmd_rs1,
	io_in_bits_cmd_rs2,
	io_in_bits_rob_id_bits,
	io_out_ready,
	io_out_valid,
	io_out_bits_cmd_inst_funct,
	io_out_bits_cmd_rs1,
	io_out_bits_cmd_rs2,
	io_out_bits_rob_id_valid,
	io_out_bits_rob_id_bits
);
	input clock;
	input reset;
	output wire io_in_ready;
	input io_in_valid;
	input [6:0] io_in_bits_cmd_inst_funct;
	input [63:0] io_in_bits_cmd_rs1;
	input [63:0] io_in_bits_cmd_rs2;
	input [5:0] io_in_bits_rob_id_bits;
	input io_out_ready;
	output wire io_out_valid;
	output wire [6:0] io_out_bits_cmd_inst_funct;
	output wire [63:0] io_out_bits_cmd_rs1;
	output wire [63:0] io_out_bits_cmd_rs2;
	output wire io_out_bits_rob_id_valid;
	output wire [5:0] io_out_bits_rob_id_bits;
	wire _q_io_deq_valid_0;
	wire _q_io_deq_valid_1;
	wire [6:0] _q_io_deq_bits_0_cmd_inst_funct;
	wire [63:0] _q_io_deq_bits_0_cmd_rs1;
	wire [63:0] _q_io_deq_bits_0_cmd_rs2;
	wire [5:0] _q_io_deq_bits_0_rob_id_bits;
	wire [6:0] _q_io_deq_bits_1_cmd_inst_funct;
	wire [63:0] _q_io_deq_bits_1_cmd_rs1;
	wire [63:0] _q_io_deq_bits_1_cmd_rs2;
	wire [5:0] _q_io_deq_bits_1_rob_id_bits;
	reg [1:0] state;
	wire _state_T = state == 2'h0;
	wire first_preload = (_q_io_deq_valid_0 & (_q_io_deq_bits_0_cmd_inst_funct == 7'h06)) & _state_T;
	reg b_transposed_and_ws;
	wire io_out_valid_0 = (first_preload ? ~b_transposed_and_ws | _q_io_deq_valid_1 : state[1] | _q_io_deq_valid_0);
	wire _q_io_deq_pop_T_1 = ((first_preload & b_transposed_and_ws) & _q_io_deq_valid_1) & (_q_io_deq_bits_1_cmd_inst_funct == 7'h04);
	wire _state_T_1 = state == 2'h1;
	wire _GEN = _q_io_deq_pop_T_1 | ~_state_T_1;
	wire _q_io_deq_pop_T = io_out_ready & io_out_valid_0;
	wire is_config = (_q_io_deq_bits_0_cmd_inst_funct == 7'h00) & (_q_io_deq_bits_0_cmd_rs1[1:0] == 2'h0);
	always @(posedge clock) begin
		if (reset)
			state <= 2'h0;
		else if (~_q_io_deq_pop_T | is_config)
			;
		else if (_q_io_deq_pop_T_1)
			state <= 2'h1;
		else if (|state)
			if (_state_T)
				state <= 2'h1;
			else
				state <= {_state_T_1, 1'h0};
		if ((_q_io_deq_pop_T & is_config) & ~_q_io_deq_bits_0_cmd_rs1[7])
			b_transposed_and_ws <= _q_io_deq_bits_0_cmd_rs1[2] & _q_io_deq_bits_0_cmd_rs1[9];
	end
	MultiHeadedQueue q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(io_in_ready),
		.io_enq_valid(io_in_valid),
		.io_enq_bits_cmd_inst_funct(io_in_bits_cmd_inst_funct),
		.io_enq_bits_cmd_rs1(io_in_bits_cmd_rs1),
		.io_enq_bits_cmd_rs2(io_in_bits_cmd_rs2),
		.io_enq_bits_rob_id_bits(io_in_bits_rob_id_bits),
		.io_deq_valid_0(_q_io_deq_valid_0),
		.io_deq_valid_1(_q_io_deq_valid_1),
		.io_deq_bits_0_cmd_inst_funct(_q_io_deq_bits_0_cmd_inst_funct),
		.io_deq_bits_0_cmd_rs1(_q_io_deq_bits_0_cmd_rs1),
		.io_deq_bits_0_cmd_rs2(_q_io_deq_bits_0_cmd_rs2),
		.io_deq_bits_0_rob_id_bits(_q_io_deq_bits_0_rob_id_bits),
		.io_deq_bits_1_cmd_inst_funct(_q_io_deq_bits_1_cmd_inst_funct),
		.io_deq_bits_1_cmd_rs1(_q_io_deq_bits_1_cmd_rs1),
		.io_deq_bits_1_cmd_rs2(_q_io_deq_bits_1_cmd_rs2),
		.io_deq_bits_1_rob_id_bits(_q_io_deq_bits_1_rob_id_bits),
		.io_deq_pop((_q_io_deq_pop_T & ~_q_io_deq_pop_T_1) & (state != 2'h1))
	);
	assign io_out_valid = io_out_valid_0;
	assign io_out_bits_cmd_inst_funct = (_GEN ? _q_io_deq_bits_0_cmd_inst_funct : 7'h05);
	assign io_out_bits_cmd_rs1 = (_q_io_deq_pop_T_1 ? _q_io_deq_bits_0_cmd_rs1 : (_state_T_1 ? _q_io_deq_bits_1_cmd_rs1 : (state == 2'h2 ? {_q_io_deq_bits_0_cmd_rs1[63:32], 32'hffffffff} : _q_io_deq_bits_0_cmd_rs1)));
	assign io_out_bits_cmd_rs2 = (_q_io_deq_pop_T_1 ? {_q_io_deq_bits_0_cmd_rs2[63:32], 32'hffffffff} : (_state_T_1 ? _q_io_deq_bits_1_cmd_rs2 : _q_io_deq_bits_0_cmd_rs2));
	assign io_out_bits_rob_id_valid = ~(_q_io_deq_pop_T_1 | _state_T_1);
	assign io_out_bits_rob_id_bits = (_GEN ? _q_io_deq_bits_0_rob_id_bits : _q_io_deq_bits_1_rob_id_bits);
endmodule
