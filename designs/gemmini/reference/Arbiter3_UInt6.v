module Arbiter3_UInt6 (
	io_in_0_valid,
	io_in_0_bits,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits,
	io_in_2_ready,
	io_in_2_valid,
	io_in_2_bits,
	io_out_valid,
	io_out_bits
);
	input io_in_0_valid;
	input [5:0] io_in_0_bits;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [5:0] io_in_1_bits;
	output wire io_in_2_ready;
	input io_in_2_valid;
	input [5:0] io_in_2_bits;
	output wire io_out_valid;
	output wire [5:0] io_out_bits;
	wire _io_out_valid_T = io_in_0_valid | io_in_1_valid;
	assign io_in_1_ready = ~io_in_0_valid;
	assign io_in_2_ready = ~_io_out_valid_T;
	assign io_out_valid = _io_out_valid_T | io_in_2_valid;
	assign io_out_bits = (io_in_0_valid ? io_in_0_bits : (io_in_1_valid ? io_in_1_bits : io_in_2_bits));
endmodule
