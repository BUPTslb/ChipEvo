module LoopMatmulStC (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_max_k,
	io_req_bits_max_j,
	io_req_bits_max_i,
	io_req_bits_pad_j,
	io_req_bits_pad_i,
	io_req_bits_dram_addr,
	io_req_bits_dram_stride,
	io_req_bits_full_c,
	io_req_bits_act,
	io_req_bits_addr_start,
	io_req_bits_loop_id,
	io_req_bits_is_resadd,
	io_cmd_ready,
	io_cmd_valid,
	io_cmd_bits_inst_funct,
	io_cmd_bits_rs1,
	io_cmd_bits_rs2,
	io_ex_k,
	io_ex_j,
	io_ex_i,
	io_ex_completed,
	io_idle,
	io_rob_overloaded,
	io_loop_id
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [15:0] io_req_bits_max_k;
	input [15:0] io_req_bits_max_j;
	input [15:0] io_req_bits_max_i;
	input [3:0] io_req_bits_pad_j;
	input [3:0] io_req_bits_pad_i;
	input [39:0] io_req_bits_dram_addr;
	input [39:0] io_req_bits_dram_stride;
	input io_req_bits_full_c;
	input [2:0] io_req_bits_act;
	input [9:0] io_req_bits_addr_start;
	input io_req_bits_loop_id;
	input io_req_bits_is_resadd;
	input io_cmd_ready;
	output wire io_cmd_valid;
	output wire [6:0] io_cmd_bits_inst_funct;
	output wire [63:0] io_cmd_bits_rs1;
	output wire [63:0] io_cmd_bits_rs2;
	input [15:0] io_ex_k;
	input [15:0] io_ex_j;
	input [15:0] io_ex_i;
	input io_ex_completed;
	output wire io_idle;
	input io_rob_overloaded;
	output wire io_loop_id;
	wire [11:0] _GEN = 12'ha35;
	wire [11:0] _GEN_0 = 12'h219;
	wire [11:0] _GEN_1 = 12'ha3d;
	wire [11:0] _GEN_2 = 12'h422;
	reg [1:0] state;
	reg [15:0] req_max_k;
	reg [15:0] req_max_j;
	reg [15:0] req_max_i;
	reg [3:0] req_pad_j;
	reg [3:0] req_pad_i;
	reg [39:0] req_dram_addr;
	reg [39:0] req_dram_stride;
	reg req_full_c;
	reg [2:0] req_act;
	reg [9:0] req_addr_start;
	reg req_loop_id;
	reg req_is_resadd;
	wire [15:0] max_blocks = (req_full_c ? 16'h0001 : (req_max_j < 16'h0005 ? req_max_j : 16'h0004));
	reg [15:0] j;
	reg [15:0] i;
	wire [27:0] _ln_dram_offset_T = {12'h000, i} * req_dram_stride[27:0];
	wire [27:0] _GEN_3 = {12'h000, j};
	wire [40:0] _GEN_4 = {1'h0, req_dram_addr};
	wire [24:0] _ln_sp_addr_T = {9'h000, i} * {9'h000, req_max_j};
	wire [28:0] _sp_addr_T_4 = {19'h00000, req_addr_start} + {_ln_sp_addr_T + {9'h000, j}, 4'h0};
	wire [16:0] _next_j_T_10 = {1'h0, j} + {1'h0, max_blocks};
	wire [15:0] blocks = (_next_j_T_10[15:0] <= req_max_j ? max_blocks : req_max_j - j);
	wire [15:0] _ex_ahead_T_22 = j + blocks;
	wire [6:0] ln_mvout_cmd_rs2_num_cols = {blocks[2:0], 4'h0} - {3'h0, (_ex_ahead_T_22 >= req_max_j ? req_pad_j : 4'h0)};
	wire [15:0] _next_i_max_T_1 = req_max_i - 16'h0001;
	wire [4:0] mvout_cmd_rs2_num_rows = 5'h10 - {1'h0, (i == _next_i_max_T_1 ? req_pad_i : 4'h0)};
	reg [15:0] ln_row;
	reg [15:0] ln_cmd;
	reg [15:0] ln_stat_id;
	wire [16:0] _GEN_5 = {1'h0, ln_row};
	wire [16:0] _GEN_6 = {1'h0, ln_stat_id};
	wire [16:0] ln_r = _GEN_5 + _GEN_6;
	wire _ln_norm_cmd_T_6 = req_act == 3'h2;
	wire io_idle_0 = state == 2'h0;
	wire _ex_ahead_T_20 = io_ex_i > i;
	wire io_cmd_valid_0 = ((|state & ~io_rob_overloaded) & (req_is_resadd ? (io_ex_completed | _ex_ahead_T_20) | ((io_ex_i == i) & (io_ex_j >= _ex_ahead_T_22)) : io_ex_completed | ((((req_act != 3'h2) & (req_act != 3'h4)) & (io_ex_k == (req_max_k - 16'h0001))) & ((io_ex_j >= _ex_ahead_T_22) | ((io_ex_j == (_ex_ahead_T_22 - 16'h0001)) & _ex_ahead_T_20))))) & |req_dram_addr;
	wire _io_cmd_bits_T = state == 2'h2;
	wire [16:0] _ln_stat_ids_T_4 = {12'h000, mvout_cmd_rs2_num_rows} - _GEN_5;
	wire _GEN_7 = req_dram_addr == 40'h0000000000;
	wire _GEN_8 = io_cmd_ready & io_cmd_valid_0;
	wire _GEN_9 = _GEN_8 & (state == 2'h1);
	wire [16:0] _GEN_10 = {1'h0, i};
	wire [16:0] _next_i_T_3 = _GEN_10 + 17'h00001;
	wire [16:0] _GEN_11 = {1'h0, _next_i_max_T_1};
	wire _next_i_T_4 = _next_i_T_3 > _GEN_11;
	wire [15:0] next_i = (_next_i_T_4 ? 16'h0000 : _next_i_T_3[15:0]);
	wire _next_j_T_5 = _next_j_T_10 > {1'h0, req_max_j - 16'h0001};
	wire _GEN_12 = _GEN_8 & _io_cmd_bits_T;
	wire _GEN_13 = _GEN_8 & &state;
	wire _next_j_T_11 = _next_j_T_10 > {1'h0, req_max_j - 16'h0001};
	wire [15:0] next_j_1 = (_next_j_T_11 ? 16'h0000 : _next_j_T_10[15:0]);
	wire [16:0] _next_stat_id_T_4 = _GEN_6 + 17'h00001;
	wire _next_stat_id_T_5 = _next_stat_id_T_4 > ((_ln_stat_ids_T_4 > 17'h00002 ? 17'h00002 : _ln_stat_ids_T_4) - 17'h00001);
	wire _next_i_T_7 = (|next_j_1 ? ln_stat_id : (_next_stat_id_T_5 ? 16'h0000 : _next_stat_id_T_4[15:0])) == 16'h0000;
	wire _next_cmd_T_2 = ~(|next_j_1) & _next_i_T_7;
	wire [16:0] _next_cmd_T_6 = {1'h0, ln_cmd} + 17'h00001;
	wire _next_cmd_T_7 = _next_cmd_T_6 > 17'h00002;
	wire _next_i_T_9 = (_next_cmd_T_2 ? (_next_cmd_T_7 ? 16'h0000 : _next_cmd_T_6[15:0]) : ln_cmd) == 16'h0000;
	wire _next_row_T_4 = (~(|next_j_1) & _next_i_T_7) & _next_i_T_9;
	wire [16:0] _next_row_T_8 = _GEN_5 + 17'h00002;
	wire _next_row_T_9 = _next_row_T_8 > {12'h000, mvout_cmd_rs2_num_rows - 5'h01};
	wire _next_i_T_11 = (_next_row_T_4 ? (_next_row_T_9 ? 16'h0000 : _next_row_T_8[15:0]) : ln_row) == 16'h0000;
	wire _next_i_T_12 = ((~(|next_j_1) & _next_i_T_7) & _next_i_T_9) & _next_i_T_11;
	wire [16:0] _next_i_T_16 = _GEN_10 + 17'h00001;
	wire _next_i_T_17 = _next_i_T_16 > _GEN_11;
	wire _GEN_14 = io_idle_0 & io_req_valid;
	wire _GEN_15 = (_GEN_7 | _GEN_9) | _GEN_12;
	always @(posedge clock) begin
		if (reset)
			state <= 2'h0;
		else if (_GEN_14)
			state <= ((io_req_bits_act == 3'h2) | (io_req_bits_act == 3'h4) ? 2'h2 : 2'h1);
		else if (_GEN_7)
			state <= 2'h0;
		else if (_GEN_9) begin
			if (~(|next_i) & ((|next_i ? j : (_next_j_T_5 ? 16'h0000 : _next_j_T_10[15:0])) == 16'h0000))
				state <= 2'h0;
		end
		else if (_GEN_12)
			state <= 2'h3;
		else if (_GEN_13)
			if ((((((_next_i_T_12 ? (_next_i_T_17 ? 16'h0000 : _next_i_T_16[15:0]) : i) == 16'h0000) & _next_i_T_11) & _next_i_T_9) & _next_i_T_7) & ~(|next_j_1))
				state <= 2'h0;
			else if (~(|next_j_1))
				state <= 2'h2;
		if (_GEN_14) begin
			req_max_k <= io_req_bits_max_k;
			req_max_j <= io_req_bits_max_j;
			req_max_i <= io_req_bits_max_i;
			req_pad_j <= io_req_bits_pad_j;
			req_pad_i <= io_req_bits_pad_i;
			req_dram_addr <= io_req_bits_dram_addr;
			req_dram_stride <= io_req_bits_dram_stride;
			req_full_c <= io_req_bits_full_c;
			req_act <= io_req_bits_act;
			req_addr_start <= io_req_bits_addr_start;
			req_loop_id <= io_req_bits_loop_id;
			req_is_resadd <= io_req_bits_is_resadd;
			j <= 16'h0000;
			i <= 16'h0000;
			ln_row <= 16'h0000;
			ln_cmd <= 16'h0000;
			ln_stat_id <= 16'h0000;
		end
		else begin
			if (~_GEN_7)
				if (_GEN_9) begin
					if (~(|next_i))
						if (_next_j_T_5)
							j <= 16'h0000;
						else
							j <= _next_j_T_10[15:0];
					if (_next_i_T_4)
						i <= 16'h0000;
					else
						i <= _next_i_T_3[15:0];
				end
				else begin
					if (_GEN_12 | ~_GEN_13)
						;
					else if (_next_j_T_11)
						j <= 16'h0000;
					else
						j <= _next_j_T_10[15:0];
					if (_GEN_12 | ~(_GEN_13 & _next_i_T_12))
						;
					else if (_next_i_T_17)
						i <= 16'h0000;
					else
						i <= _next_i_T_16[15:0];
				end
			if (_GEN_15 | ~(_GEN_13 & _next_row_T_4))
				;
			else if (_next_row_T_9)
				ln_row <= 16'h0000;
			else
				ln_row <= _next_row_T_8[15:0];
			if (_GEN_15 | ~(_GEN_13 & _next_cmd_T_2))
				;
			else if (_next_cmd_T_7)
				ln_cmd <= 16'h0000;
			else
				ln_cmd <= _next_cmd_T_6[15:0];
			if ((_GEN_15 | ~_GEN_13) | |next_j_1)
				;
			else if (_next_stat_id_T_5)
				ln_stat_id <= 16'h0000;
			else
				ln_stat_id <= _next_stat_id_T_4[15:0];
		end
	end
	assign io_req_ready = io_idle_0;
	assign io_cmd_valid = io_cmd_valid_0;
	assign io_cmd_bits_inst_funct = (_io_cmd_bits_T ? 7'h00 : 7'h03);
	assign io_cmd_bits_rs1 = (_io_cmd_bits_T ? {48'h000000000002, ln_stat_id[7:0], 8'h03} : {23'h000000, (&state ? {9'h000, {_ln_dram_offset_T + _GEN_3, 4'h0} + ({15'h0000, ln_r} * req_dram_stride[31:0])} + _GEN_4 : {9'h000, (req_full_c ? {_ln_dram_offset_T[25:0] + {10'h000, j}, 6'h00} : {_ln_dram_offset_T + _GEN_3, 4'h0})} + _GEN_4)});
	assign io_cmd_bits_rs2 = (_io_cmd_bits_T ? 64'h0000000000000000 : (&state ? {25'h0000200, ln_mvout_cmd_rs2_num_cols, 2'h2, req_full_c, (_next_j_T_10 >= {1'h0, req_max_j} ? (_ln_norm_cmd_T_6 ? _GEN_2[ln_cmd[1:0] * 3+:3] : _GEN_1[ln_cmd[1:0] * 3+:3]) : (_ln_norm_cmd_T_6 ? _GEN_0[ln_cmd[1:0] * 3+:3] : _GEN[ln_cmd[1:0] * 3+:3])), 11'h000, ({5'h00, req_addr_start} + {_ln_sp_addr_T[10:0] + j[10:0], 4'h0}) + ln_r[14:0]} : {11'h000, mvout_cmd_rs2_num_rows, 9'h000, ln_mvout_cmd_rs2_num_cols, 2'h2, req_full_c, _sp_addr_T_4[28:26], 11'h000, _sp_addr_T_4[14:0]}));
	assign io_idle = io_idle_0;
	assign io_loop_id = req_loop_id;
endmodule
