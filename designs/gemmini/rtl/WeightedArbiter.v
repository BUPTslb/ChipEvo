module WeightedArbiter (
	clock,
	reset,
	io_inA_ready,
	io_inA_valid,
	io_inA_bits_rs1,
	io_inA_bits_rs2,
	io_inB_ready,
	io_inB_valid,
	io_inB_bits_rs1,
	io_inB_bits_rs2,
	io_forceA,
	io_forceB,
	io_out_ready,
	io_out_valid,
	io_out_bits_inst_funct,
	io_out_bits_rs1,
	io_out_bits_rs2,
	io_inA_idle,
	io_inB_idle,
	io_inA_k,
	io_inB_k,
	io_inB_j
);
	input clock;
	input reset;
	output wire io_inA_ready;
	input io_inA_valid;
	input [63:0] io_inA_bits_rs1;
	input [63:0] io_inA_bits_rs2;
	output wire io_inB_ready;
	input io_inB_valid;
	input [63:0] io_inB_bits_rs1;
	input [63:0] io_inB_bits_rs2;
	input io_forceA;
	input io_forceB;
	input io_out_ready;
	output wire io_out_valid;
	output wire [6:0] io_out_bits_inst_funct;
	output wire [63:0] io_out_bits_rs1;
	output wire [63:0] io_out_bits_rs2;
	input io_inA_idle;
	input io_inB_idle;
	input [15:0] io_inA_k;
	input [15:0] io_inB_k;
	input [15:0] io_inB_j;
	wire _GEN = (io_inA_k > io_inB_k) | ((io_inB_k == 16'h0000) & (io_inB_j == 16'h0000));
	wire _GEN_0 = io_forceB | io_inA_idle;
	wire _GEN_1 = io_inB_idle | ~_GEN;
	wire _GEN_2 = io_forceA | ~(_GEN_0 | ~_GEN_1);
	always @(posedge clock)
		if ((~reset & io_forceA) & io_forceB) begin
// synopsys translate_off
			$error("Assertion failed\n    at WeightedArbiter.scala:72 assert(!(io.forceA && io.forceB))\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	assign io_inA_ready = (io_forceA | (~_GEN_0 & _GEN_1)) & io_out_ready;
	assign io_inB_ready = (~io_forceA & (_GEN_0 | (~io_inB_idle & _GEN))) & io_out_ready;
	assign io_out_valid = (_GEN_2 ? io_inA_valid : io_inB_valid);
	assign io_out_bits_inst_funct = (_GEN_2 ? 7'h02 : 7'h01);
	assign io_out_bits_rs1 = (_GEN_2 ? io_inA_bits_rs1 : io_inB_bits_rs1);
	assign io_out_bits_rs2 = (_GEN_2 ? io_inA_bits_rs2 : io_inB_bits_rs2);
endmodule
