module LoopMatmulExecute (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_max_j,
	io_req_bits_max_k,
	io_req_bits_max_i,
	io_req_bits_pad_j,
	io_req_bits_pad_k,
	io_req_bits_pad_i,
	io_req_bits_a_tranpose,
	io_req_bits_b_tranpose,
	io_req_bits_accumulate,
	io_req_bits_a_addr_start,
	io_req_bits_b_addr_end,
	io_req_bits_c_addr_start,
	io_req_bits_loop_id,
	io_req_bits_skip,
	io_cmd_ready,
	io_cmd_valid,
	io_cmd_bits_inst_funct,
	io_cmd_bits_rs1,
	io_cmd_bits_rs2,
	io_k,
	io_j,
	io_i,
	io_ld_ka,
	io_ld_kb,
	io_ld_j,
	io_ld_i,
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
	input [15:0] io_req_bits_max_j;
	input [15:0] io_req_bits_max_k;
	input [15:0] io_req_bits_max_i;
	input [3:0] io_req_bits_pad_j;
	input [3:0] io_req_bits_pad_k;
	input [3:0] io_req_bits_pad_i;
	input io_req_bits_a_tranpose;
	input io_req_bits_b_tranpose;
	input io_req_bits_accumulate;
	input [13:0] io_req_bits_a_addr_start;
	input [14:0] io_req_bits_b_addr_end;
	input [9:0] io_req_bits_c_addr_start;
	input io_req_bits_loop_id;
	input io_req_bits_skip;
	input io_cmd_ready;
	output wire io_cmd_valid;
	output wire [6:0] io_cmd_bits_inst_funct;
	output wire [63:0] io_cmd_bits_rs1;
	output wire [63:0] io_cmd_bits_rs2;
	output wire [15:0] io_k;
	output wire [15:0] io_j;
	output wire [15:0] io_i;
	input [15:0] io_ld_ka;
	input [15:0] io_ld_kb;
	input [15:0] io_ld_j;
	input [15:0] io_ld_i;
	input io_lda_completed;
	input io_ldb_completed;
	input io_ldd_completed;
	output wire io_idle;
	input io_rob_overloaded;
	output wire io_loop_id;
	reg [1:0] state;
	reg [15:0] req_max_j;
	reg [15:0] req_max_k;
	reg [15:0] req_max_i;
	reg [3:0] req_pad_j;
	reg [3:0] req_pad_k;
	reg [3:0] req_pad_i;
	reg req_a_tranpose;
	reg req_b_tranpose;
	reg req_accumulate;
	reg [13:0] req_a_addr_start;
	reg [14:0] req_b_addr_end;
	reg [9:0] req_c_addr_start;
	reg req_loop_id;
	reg req_skip;
	wire [24:0] _GEN = {9'h000, req_max_j};
	reg [15:0] k;
	reg [15:0] j;
	reg [15:0] i;
	wire [28:0] _a_addr_T_4 = {15'h0000, req_a_addr_start} + {({9'h000, (req_a_tranpose ? k : i)} * {9'h000, (req_a_tranpose ? req_max_i : req_max_k)}) + {9'h000, (req_a_tranpose ? i : k)}, 4'h0};
	wire [28:0] _b_addr_T_4 = ({14'h0000, req_b_addr_end} - {{9'h000, req_max_k} * _GEN, 4'h0}) + {({9'h000, (req_b_tranpose ? j : k)} * {9'h000, (req_b_tranpose ? req_max_k : req_max_j)}) + {9'h000, (req_b_tranpose ? k : j)}, 4'h0};
	wire [28:0] _c_addr_T_4 = {19'h00000, req_c_addr_start} + {({9'h000, i} * _GEN) + {9'h000, j}, 4'h0};
	wire [15:0] _next_k_max_T = req_max_k - 16'h0001;
	wire [15:0] _next_i_max_T = req_max_i - 16'h0001;
	wire [15:0] _next_j_max_T = req_max_j - 16'h0001;
	wire io_idle_0 = state == 2'h0;
	wire _ldb_ahead_T_2 = io_ld_ka == k;
	wire io_cmd_valid_0 = ((((|state & ~io_rob_overloaded) & ((io_lda_completed | (io_ld_ka > k)) | (_ldb_ahead_T_2 & (io_ld_i > i)))) & ((io_ldb_completed | (io_ld_kb > k)) | (_ldb_ahead_T_2 & (io_ld_j > j)))) & io_ldd_completed) & ~req_skip;
	wire _io_cmd_bits_T = state == 2'h1;
	always @(posedge clock)
		if (((~reset & |state) & req_a_tranpose) & req_b_tranpose) begin
// synopsys translate_off
			$error("Assertion failed\n    at LoopMatmul.scala:494 assert(!(state =/= idle && req.a_tranpose && req.b_tranpose))\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	wire _GEN_0 = io_cmd_ready & io_cmd_valid_0;
	wire [16:0] _next_i_T_3 = {1'h0, i} + 17'h00001;
	wire _next_i_T_4 = _next_i_T_3 > {1'h0, _next_i_max_T};
	wire [15:0] next_i = (_next_i_T_4 ? 16'h0000 : _next_i_T_3[15:0]);
	wire [16:0] _next_j_T_4 = {1'h0, j} + 17'h00001;
	wire _next_j_T_5 = _next_j_T_4 > {1'h0, _next_j_max_T};
	wire _state_T_1 = (|next_i ? j : (_next_j_T_5 ? 16'h0000 : _next_j_T_4[15:0])) == 16'h0000;
	wire _next_k_T_2 = _state_T_1 & ~(|next_i);
	wire [16:0] _next_k_T_6 = {1'h0, k} + 17'h00001;
	wire _next_k_T_7 = _next_k_T_6 > {1'h0, _next_k_max_T};
	wire _GEN_1 = io_idle_0 & io_req_valid;
	always @(posedge clock) begin
		if (reset)
			state <= 2'h0;
		else if (_GEN_1)
			state <= 2'h1;
		else if (req_skip)
			state <= 2'h0;
		else if (_GEN_0)
			if (_io_cmd_bits_T)
				state <= 2'h2;
			else
				state <= {1'h0, ~((((_next_k_T_2 ? (_next_k_T_7 ? 16'h0000 : _next_k_T_6[15:0]) : k) == 16'h0000) & _state_T_1) & ~(|next_i))};
		if (_GEN_1) begin
			req_max_j <= io_req_bits_max_j;
			req_max_k <= io_req_bits_max_k;
			req_max_i <= io_req_bits_max_i;
			req_pad_j <= io_req_bits_pad_j;
			req_pad_k <= io_req_bits_pad_k;
			req_pad_i <= io_req_bits_pad_i;
			req_a_tranpose <= io_req_bits_a_tranpose;
			req_b_tranpose <= io_req_bits_b_tranpose;
			req_accumulate <= io_req_bits_accumulate;
			req_a_addr_start <= io_req_bits_a_addr_start;
			req_b_addr_end <= io_req_bits_b_addr_end;
			req_c_addr_start <= io_req_bits_c_addr_start;
			req_loop_id <= io_req_bits_loop_id;
			req_skip <= io_req_bits_skip;
			k <= 16'h0000;
			j <= 16'h0000;
			i <= 16'h0000;
		end
		else begin
			if (((req_skip | ~_GEN_0) | _io_cmd_bits_T) | ~_next_k_T_2)
				;
			else if (_next_k_T_7)
				k <= 16'h0000;
			else
				k <= _next_k_T_6[15:0];
			if (((req_skip | ~_GEN_0) | _io_cmd_bits_T) | |next_i)
				;
			else if (_next_j_T_5)
				j <= 16'h0000;
			else
				j <= _next_j_T_4[15:0];
			if ((req_skip | ~_GEN_0) | _io_cmd_bits_T)
				;
			else if (_next_i_T_4)
				i <= 16'h0000;
			else
				i <= _next_i_T_3[15:0];
		end
	end
	assign io_req_ready = io_idle_0;
	assign io_cmd_valid = io_cmd_valid_0;
	assign io_cmd_bits_inst_funct = (_io_cmd_bits_T ? 7'h06 : {6'h02, |i});
	assign io_cmd_bits_rs1 = {11'h000, (_io_cmd_bits_T ? {5'h10 - {1'h0, (k == _next_k_max_T ? req_pad_k : 4'h0)}, 11'h000, 5'h10 - {1'h0, (j == _next_j_max_T ? req_pad_j : 4'h0)}, {3 {|i}}, (|i ? 3'h0 : _b_addr_T_4[28:26]), 11'h000, |i | _b_addr_T_4[14], (|i ? 14'h3fff : _b_addr_T_4[13:0])} : {5'h10 - {1'h0, (i == _next_i_max_T ? req_pad_i : 4'h0)}, 11'h000, 5'h10 - {1'h0, (k == _next_k_max_T ? req_pad_k : 4'h0)}, 3'h0, _a_addr_T_4[28:26], 11'h000, _a_addr_T_4[14:0]})};
	assign io_cmd_bits_rs2 = (_io_cmd_bits_T ? {11'h000, 5'h10 - {1'h0, (i == _next_i_max_T ? req_pad_i : 4'h0)}, 11'h000, 5'h10 - {1'h0, (j == _next_j_max_T ? req_pad_j : 4'h0)}, 1'h1, req_accumulate | |k, 1'h0, _c_addr_T_4[28:26], 11'h000, _c_addr_T_4[14:0]} : 64'h00100010e0007fff);
	assign io_k = k;
	assign io_j = j;
	assign io_i = i;
	assign io_idle = io_idle_0;
	assign io_loop_id = req_loop_id;
endmodule
