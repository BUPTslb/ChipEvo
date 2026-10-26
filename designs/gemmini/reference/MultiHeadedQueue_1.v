module MultiHeadedQueue_1 (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_cmd_inst_funct,
	io_enq_bits_cmd_rs1,
	io_enq_bits_cmd_rs2,
	io_enq_bits_rob_id_valid,
	io_enq_bits_rob_id_bits,
	io_deq_valid_0,
	io_deq_valid_1,
	io_deq_valid_2,
	io_deq_bits_0_cmd_inst_funct,
	io_deq_bits_0_cmd_rs1,
	io_deq_bits_0_cmd_rs2,
	io_deq_bits_0_rob_id_valid,
	io_deq_bits_0_rob_id_bits,
	io_deq_bits_1_cmd_inst_funct,
	io_deq_bits_1_cmd_rs1,
	io_deq_bits_1_cmd_rs2,
	io_deq_bits_1_rob_id_valid,
	io_deq_bits_1_rob_id_bits,
	io_deq_bits_2_cmd_rs1,
	io_deq_bits_2_cmd_rs2,
	io_deq_bits_2_rob_id_bits,
	io_deq_pop
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [6:0] io_enq_bits_cmd_inst_funct;
	input [63:0] io_enq_bits_cmd_rs1;
	input [63:0] io_enq_bits_cmd_rs2;
	input io_enq_bits_rob_id_valid;
	input [5:0] io_enq_bits_rob_id_bits;
	output wire io_deq_valid_0;
	output wire io_deq_valid_1;
	output wire io_deq_valid_2;
	output wire [6:0] io_deq_bits_0_cmd_inst_funct;
	output wire [63:0] io_deq_bits_0_cmd_rs1;
	output wire [63:0] io_deq_bits_0_cmd_rs2;
	output wire io_deq_bits_0_rob_id_valid;
	output wire [5:0] io_deq_bits_0_rob_id_bits;
	output wire [6:0] io_deq_bits_1_cmd_inst_funct;
	output wire [63:0] io_deq_bits_1_cmd_rs1;
	output wire [63:0] io_deq_bits_1_cmd_rs2;
	output wire io_deq_bits_1_rob_id_valid;
	output wire [5:0] io_deq_bits_1_rob_id_bits;
	output wire [63:0] io_deq_bits_2_cmd_rs1;
	output wire [63:0] io_deq_bits_2_cmd_rs2;
	output wire [5:0] io_deq_bits_2_rob_id_bits;
	input [1:0] io_deq_pop;
	reg [6:0] regs_0_cmd_inst_funct;
	reg [63:0] regs_0_cmd_rs1;
	reg [63:0] regs_0_cmd_rs2;
	reg regs_0_rob_id_valid;
	reg [5:0] regs_0_rob_id_bits;
	reg [6:0] regs_1_cmd_inst_funct;
	reg [63:0] regs_1_cmd_rs1;
	reg [63:0] regs_1_cmd_rs2;
	reg regs_1_rob_id_valid;
	reg [5:0] regs_1_rob_id_bits;
	reg [6:0] regs_2_cmd_inst_funct;
	reg [63:0] regs_2_cmd_rs1;
	reg [63:0] regs_2_cmd_rs2;
	reg regs_2_rob_id_valid;
	reg [5:0] regs_2_rob_id_bits;
	reg [6:0] regs_3_cmd_inst_funct;
	reg [63:0] regs_3_cmd_rs1;
	reg [63:0] regs_3_cmd_rs2;
	reg regs_3_rob_id_valid;
	reg [5:0] regs_3_rob_id_bits;
	reg [6:0] regs_4_cmd_inst_funct;
	reg [63:0] regs_4_cmd_rs1;
	reg [63:0] regs_4_cmd_rs2;
	reg regs_4_rob_id_valid;
	reg [5:0] regs_4_rob_id_bits;
	reg [6:0] regs_5_cmd_inst_funct;
	reg [63:0] regs_5_cmd_rs1;
	reg [63:0] regs_5_cmd_rs2;
	reg regs_5_rob_id_valid;
	reg [5:0] regs_5_rob_id_bits;
	reg [6:0] regs_6_cmd_inst_funct;
	reg [63:0] regs_6_cmd_rs1;
	reg [63:0] regs_6_cmd_rs2;
	reg regs_6_rob_id_valid;
	reg [5:0] regs_6_rob_id_bits;
	reg [6:0] regs_7_cmd_inst_funct;
	reg [63:0] regs_7_cmd_rs1;
	reg [63:0] regs_7_cmd_rs2;
	reg regs_7_rob_id_valid;
	reg [5:0] regs_7_rob_id_bits;
	reg [2:0] raddr;
	reg [2:0] waddr;
	reg [3:0] len;
	wire [2:0] _raddr_T_11 = 3'h7 - raddr;
	wire [55:0] _GEN = {{regs_7_cmd_inst_funct}, {regs_6_cmd_inst_funct}, {regs_5_cmd_inst_funct}, {regs_4_cmd_inst_funct}, {regs_3_cmd_inst_funct}, {regs_2_cmd_inst_funct}, {regs_1_cmd_inst_funct}, {regs_0_cmd_inst_funct}};
	wire [511:0] _GEN_0 = {{regs_7_cmd_rs1}, {regs_6_cmd_rs1}, {regs_5_cmd_rs1}, {regs_4_cmd_rs1}, {regs_3_cmd_rs1}, {regs_2_cmd_rs1}, {regs_1_cmd_rs1}, {regs_0_cmd_rs1}};
	wire [511:0] _GEN_1 = {{regs_7_cmd_rs2}, {regs_6_cmd_rs2}, {regs_5_cmd_rs2}, {regs_4_cmd_rs2}, {regs_3_cmd_rs2}, {regs_2_cmd_rs2}, {regs_1_cmd_rs2}, {regs_0_cmd_rs2}};
	wire [7:0] _GEN_2 = {{regs_7_rob_id_valid}, {regs_6_rob_id_valid}, {regs_5_rob_id_valid}, {regs_4_rob_id_valid}, {regs_3_rob_id_valid}, {regs_2_rob_id_valid}, {regs_1_rob_id_valid}, {regs_0_rob_id_valid}};
	wire [47:0] _GEN_3 = {{regs_7_rob_id_bits}, {regs_6_rob_id_bits}, {regs_5_rob_id_bits}, {regs_4_rob_id_bits}, {regs_3_rob_id_bits}, {regs_2_rob_id_bits}, {regs_1_rob_id_bits}, {regs_0_rob_id_bits}};
	wire [2:0] _io_deq_bits_1_T_19 = (&raddr ? (3'h1 - _raddr_T_11) - 3'h1 : raddr + 3'h1);
	wire [2:0] _io_deq_bits_2_T_19 = (raddr > 3'h5 ? (3'h2 - _raddr_T_11) - 3'h1 : raddr + 3'h2);
	wire [3:0] _GEN_4 = {2'h0, io_deq_pop};
	always @(posedge clock)
		if (~reset & ~((_GEN_4 <= len) & (io_deq_pop != 2'h3))) begin
// synopsys translate_off
			$error("Assertion failed\n    at MultiHeadedQueue.scala:48 assert(io.deq.pop <= len && io.deq.pop <= heads.U && io.deq.pop <= maxpop.U)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	wire [2:0] _GEN_5 = {1'h0, io_deq_pop};
	wire _len_T_4 = ~len[3] & io_enq_valid;
	always @(posedge clock) begin
		if (_len_T_4 & (waddr == 3'h0)) begin
			regs_0_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_0_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_0_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_0_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_0_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & (waddr == 3'h1)) begin
			regs_1_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_1_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_1_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_1_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_1_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & (waddr == 3'h2)) begin
			regs_2_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_2_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_2_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_2_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_2_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & (waddr == 3'h3)) begin
			regs_3_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_3_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_3_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_3_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_3_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & (waddr == 3'h4)) begin
			regs_4_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_4_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_4_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_4_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_4_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & (waddr == 3'h5)) begin
			regs_5_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_5_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_5_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_5_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_5_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & (waddr == 3'h6)) begin
			regs_6_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_6_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_6_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_6_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_6_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & &waddr) begin
			regs_7_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_7_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_7_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_7_rob_id_valid <= io_enq_bits_rob_id_valid;
			regs_7_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (reset) begin
			raddr <= 3'h0;
			waddr <= 3'h0;
			len <= 4'h0;
		end
		else begin
			if (|io_deq_pop) begin
				if ((raddr >= ((3'h7 + 3'h1) - _GEN_5)) & |io_deq_pop)
					raddr <= (_GEN_5 - _raddr_T_11) - 3'h1;
				else
					raddr <= raddr + _GEN_5;
				len <= (len - _GEN_4) + {3'h0, _len_T_4};
			end
			else if (_len_T_4)
				len <= len + 4'h1;
			if (_len_T_4)
				if (&waddr)
					waddr <= ((3'h1 - 3'h7) + waddr) - 3'h1;
				else
					waddr <= waddr + 3'h1;
		end
	end
	assign io_enq_ready = ~len[3];
	assign io_deq_valid_0 = |len;
	assign io_deq_valid_1 = |len[3:1];
	assign io_deq_valid_2 = len > 4'h2;
	assign io_deq_bits_0_cmd_inst_funct = _GEN[raddr * 7+:7];
	assign io_deq_bits_0_cmd_rs1 = _GEN_0[raddr * 64+:64];
	assign io_deq_bits_0_cmd_rs2 = _GEN_1[raddr * 64+:64];
	assign io_deq_bits_0_rob_id_valid = _GEN_2[raddr];
	assign io_deq_bits_0_rob_id_bits = _GEN_3[raddr * 6+:6];
	assign io_deq_bits_1_cmd_inst_funct = _GEN[_io_deq_bits_1_T_19 * 7+:7];
	assign io_deq_bits_1_cmd_rs1 = _GEN_0[_io_deq_bits_1_T_19 * 64+:64];
	assign io_deq_bits_1_cmd_rs2 = _GEN_1[_io_deq_bits_1_T_19 * 64+:64];
	assign io_deq_bits_1_rob_id_valid = _GEN_2[_io_deq_bits_1_T_19];
	assign io_deq_bits_1_rob_id_bits = _GEN_3[_io_deq_bits_1_T_19 * 6+:6];
	assign io_deq_bits_2_cmd_rs1 = _GEN_0[_io_deq_bits_2_T_19 * 64+:64];
	assign io_deq_bits_2_cmd_rs2 = _GEN_1[_io_deq_bits_2_T_19 * 64+:64];
	assign io_deq_bits_2_rob_id_bits = _GEN_3[_io_deq_bits_2_T_19 * 6+:6];
endmodule
