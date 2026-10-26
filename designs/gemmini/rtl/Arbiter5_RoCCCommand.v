module Arbiter5_RoCCCommand (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_inst_funct,
	io_in_0_bits_rs1,
	io_in_0_bits_rs2,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_inst_funct,
	io_in_1_bits_rs1,
	io_in_1_bits_rs2,
	io_in_2_ready,
	io_in_2_valid,
	io_in_2_bits_inst_funct,
	io_in_2_bits_rs1,
	io_in_2_bits_rs2,
	io_in_3_ready,
	io_in_3_valid,
	io_in_3_bits_inst_funct,
	io_in_3_bits_rs1,
	io_in_3_bits_rs2,
	io_in_4_ready,
	io_in_4_valid,
	io_in_4_bits_inst_funct,
	io_in_4_bits_rs1,
	io_in_4_bits_rs2,
	io_out_ready,
	io_out_valid,
	io_out_bits_inst_funct,
	io_out_bits_rs1,
	io_out_bits_rs2
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [6:0] io_in_0_bits_inst_funct;
	input [63:0] io_in_0_bits_rs1;
	input [63:0] io_in_0_bits_rs2;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [6:0] io_in_1_bits_inst_funct;
	input [63:0] io_in_1_bits_rs1;
	input [63:0] io_in_1_bits_rs2;
	output wire io_in_2_ready;
	input io_in_2_valid;
	input [6:0] io_in_2_bits_inst_funct;
	input [63:0] io_in_2_bits_rs1;
	input [63:0] io_in_2_bits_rs2;
	output wire io_in_3_ready;
	input io_in_3_valid;
	input [6:0] io_in_3_bits_inst_funct;
	input [63:0] io_in_3_bits_rs1;
	input [63:0] io_in_3_bits_rs2;
	output wire io_in_4_ready;
	input io_in_4_valid;
	input [6:0] io_in_4_bits_inst_funct;
	input [63:0] io_in_4_bits_rs1;
	input [63:0] io_in_4_bits_rs2;
	input io_out_ready;
	output wire io_out_valid;
	output wire [6:0] io_out_bits_inst_funct;
	output wire [63:0] io_out_bits_rs1;
	output wire [63:0] io_out_bits_rs2;
	wire _grant_T = io_in_0_valid | io_in_1_valid;
	wire _grant_T_1 = _grant_T | io_in_2_valid;
	wire _io_out_valid_T = _grant_T_1 | io_in_3_valid;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_in_2_ready = ~_grant_T & io_out_ready;
	assign io_in_3_ready = ~_grant_T_1 & io_out_ready;
	assign io_in_4_ready = ~_io_out_valid_T & io_out_ready;
	assign io_out_valid = _io_out_valid_T | io_in_4_valid;
	assign io_out_bits_inst_funct = (io_in_0_valid ? io_in_0_bits_inst_funct : (io_in_1_valid ? io_in_1_bits_inst_funct : (io_in_2_valid ? io_in_2_bits_inst_funct : (io_in_3_valid ? io_in_3_bits_inst_funct : io_in_4_bits_inst_funct))));
	assign io_out_bits_rs1 = (io_in_0_valid ? io_in_0_bits_rs1 : (io_in_1_valid ? io_in_1_bits_rs1 : (io_in_2_valid ? io_in_2_bits_rs1 : (io_in_3_valid ? io_in_3_bits_rs1 : io_in_4_bits_rs1))));
	assign io_out_bits_rs2 = (io_in_0_valid ? io_in_0_bits_rs2 : (io_in_1_valid ? io_in_1_bits_rs2 : (io_in_2_valid ? io_in_2_bits_rs2 : (io_in_3_valid ? io_in_3_bits_rs2 : io_in_4_bits_rs2))));
endmodule
