module Arbiter2_ScratchpadReadReq (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_addr,
	io_in_1_bits_addr,
	io_out_ready,
	io_out_valid,
	io_out_bits_addr
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [11:0] io_in_0_bits_addr;
	input [11:0] io_in_1_bits_addr;
	input io_out_ready;
	output wire io_out_valid;
	output wire [11:0] io_out_bits_addr;
	assign io_in_0_ready = io_out_ready;
	assign io_out_valid = io_in_0_valid;
	assign io_out_bits_addr = (io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr);
endmodule
