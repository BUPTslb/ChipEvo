module Queue5_im2colRowSignals (
	clock,
	reset,
	io_deq_valid,
	io_deq_bits_im2col_fin_pulse
);
	input clock;
	input reset;
	output wire io_deq_valid;
	output wire io_deq_bits_im2col_fin_pulse;
	reg [2:0] deq_ptr_value;
	wire ptr_match = deq_ptr_value == 3'h0;
	always @(posedge clock)
		if (reset)
			deq_ptr_value <= 3'h0;
		else if (~ptr_match)
			if (deq_ptr_value == 3'h4)
				deq_ptr_value <= 3'h0;
			else
				deq_ptr_value <= deq_ptr_value + 3'h1;
	assign io_deq_valid = ~ptr_match;
	assign io_deq_bits_im2col_fin_pulse = 1'h0;
endmodule
