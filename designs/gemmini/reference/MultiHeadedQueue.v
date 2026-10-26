module MultiHeadedQueue (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_cmd_inst_funct,
	io_enq_bits_cmd_rs1,
	io_enq_bits_cmd_rs2,
	io_enq_bits_rob_id_bits,
	io_deq_valid_0,
	io_deq_valid_1,
	io_deq_bits_0_cmd_inst_funct,
	io_deq_bits_0_cmd_rs1,
	io_deq_bits_0_cmd_rs2,
	io_deq_bits_0_rob_id_bits,
	io_deq_bits_1_cmd_inst_funct,
	io_deq_bits_1_cmd_rs1,
	io_deq_bits_1_cmd_rs2,
	io_deq_bits_1_rob_id_bits,
	io_deq_pop
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [6:0] io_enq_bits_cmd_inst_funct;
	input [63:0] io_enq_bits_cmd_rs1;
	input [63:0] io_enq_bits_cmd_rs2;
	input [5:0] io_enq_bits_rob_id_bits;
	output wire io_deq_valid_0;
	output wire io_deq_valid_1;
	output wire [6:0] io_deq_bits_0_cmd_inst_funct;
	output wire [63:0] io_deq_bits_0_cmd_rs1;
	output wire [63:0] io_deq_bits_0_cmd_rs2;
	output wire [5:0] io_deq_bits_0_rob_id_bits;
	output wire [6:0] io_deq_bits_1_cmd_inst_funct;
	output wire [63:0] io_deq_bits_1_cmd_rs1;
	output wire [63:0] io_deq_bits_1_cmd_rs2;
	output wire [5:0] io_deq_bits_1_rob_id_bits;
	input io_deq_pop;
	reg [6:0] regs_0_cmd_inst_funct;
	reg [63:0] regs_0_cmd_rs1;
	reg [63:0] regs_0_cmd_rs2;
	reg [5:0] regs_0_rob_id_bits;
	reg [6:0] regs_1_cmd_inst_funct;
	reg [63:0] regs_1_cmd_rs1;
	reg [63:0] regs_1_cmd_rs2;
	reg [5:0] regs_1_rob_id_bits;
	reg raddr;
	reg waddr;
	reg [1:0] len;
	wire _raddr_T_11 = 1'h1 - raddr;
	wire _io_deq_bits_1_T_19 = (raddr ? (1'h1 - _raddr_T_11) - 1'h1 : raddr - 1'h1);
	wire [1:0] _GEN = {1'h0, io_deq_pop};
	always @(posedge clock)
		if (~reset & (_GEN > len)) begin
// synopsys translate_off
			$error("Assertion failed\n    at MultiHeadedQueue.scala:48 assert(io.deq.pop <= len && io.deq.pop <= heads.U && io.deq.pop <= maxpop.U)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	wire _len_T_4 = ~len[1] & io_enq_valid;
	always @(posedge clock) begin
		if (_len_T_4 & ~waddr) begin
			regs_0_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_0_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_0_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_0_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (_len_T_4 & waddr) begin
			regs_1_cmd_inst_funct <= io_enq_bits_cmd_inst_funct;
			regs_1_cmd_rs1 <= io_enq_bits_cmd_rs1;
			regs_1_cmd_rs2 <= io_enq_bits_cmd_rs2;
			regs_1_rob_id_bits <= io_enq_bits_rob_id_bits;
		end
		if (reset) begin
			raddr <= 1'h0;
			waddr <= 1'h0;
			len <= 2'h0;
		end
		else begin
			if (io_deq_pop) begin
				if ((raddr >= ((1'h1 - io_deq_pop) - 1'h1)) & io_deq_pop)
					raddr <= (io_deq_pop - _raddr_T_11) - 1'h1;
				else
					raddr <= raddr + io_deq_pop;
				len <= (len - _GEN) + {1'h0, _len_T_4};
			end
			else if (_len_T_4)
				len <= len + 2'h1;
			if (_len_T_4)
				if (waddr)
					waddr <= ((1'h1 - 1'h1) + waddr) - 1'h1;
				else
					waddr <= waddr - 1'h1;
		end
	end
	assign io_enq_ready = ~len[1];
	assign io_deq_valid_0 = |len;
	assign io_deq_valid_1 = len[1];
	assign io_deq_bits_0_cmd_inst_funct = (raddr ? regs_1_cmd_inst_funct : regs_0_cmd_inst_funct);
	assign io_deq_bits_0_cmd_rs1 = (raddr ? regs_1_cmd_rs1 : regs_0_cmd_rs1);
	assign io_deq_bits_0_cmd_rs2 = (raddr ? regs_1_cmd_rs2 : regs_0_cmd_rs2);
	assign io_deq_bits_0_rob_id_bits = (raddr ? regs_1_rob_id_bits : regs_0_rob_id_bits);
	assign io_deq_bits_1_cmd_inst_funct = (_io_deq_bits_1_T_19 ? regs_1_cmd_inst_funct : regs_0_cmd_inst_funct);
	assign io_deq_bits_1_cmd_rs1 = (_io_deq_bits_1_T_19 ? regs_1_cmd_rs1 : regs_0_cmd_rs1);
	assign io_deq_bits_1_cmd_rs2 = (_io_deq_bits_1_T_19 ? regs_1_cmd_rs2 : regs_0_cmd_rs2);
	assign io_deq_bits_1_rob_id_bits = (_io_deq_bits_1_T_19 ? regs_1_rob_id_bits : regs_0_rob_id_bits);
endmodule
