module AccPipe (
	clock,
	io_op1,
	io_op2,
	io_sum
);
	input clock;
	input [31:0] io_op1;
	input [31:0] io_op2;
	output wire [31:0] io_sum;
	reg [31:0] io_sum_r;
	always @(posedge clock) io_sum_r <= io_op1 + io_op2;
	assign io_sum = io_sum_r;
endmodule
