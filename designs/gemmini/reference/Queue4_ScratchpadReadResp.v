module Queue4_ScratchpadReadResp (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_data,
	io_enq_bits_fromDMA,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_data,
	io_deq_bits_fromDMA
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [127:0] io_enq_bits_data;
	input io_enq_bits_fromDMA;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [127:0] io_deq_bits_data;
	output wire io_deq_bits_fromDMA;
	wire io_enq_ready_0;
	wire [128:0] _ram_ext_R0_data;
	reg [1:0] enq_ptr_value;
	reg [1:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire empty = ptr_match & ~maybe_full;
	wire do_enq = io_enq_ready_0 & io_enq_valid;
	assign io_enq_ready_0 = io_deq_ready | ~(ptr_match & maybe_full);
	wire do_deq = io_deq_ready & ~empty;
	always @(posedge clock)
		if (reset) begin
			enq_ptr_value <= 2'h0;
			deq_ptr_value <= 2'h0;
			maybe_full <= 1'h0;
		end
		else begin
			if (do_enq)
				enq_ptr_value <= enq_ptr_value + 2'h1;
			if (do_deq)
				deq_ptr_value <= deq_ptr_value + 2'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_4x129 ram_ext(
		.R0_addr(deq_ptr_value),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(enq_ptr_value),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_fromDMA, io_enq_bits_data})
	);
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_data = _ram_ext_R0_data[127:0];
	assign io_deq_bits_fromDMA = _ram_ext_R0_data[128];
endmodule
