module Queue1_ScratchpadReadResp (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_data,
	io_enq_bits_fromDMA,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_data,
	io_deq_bits_fromDMA,
	io_count
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
	output wire io_count;
	wire io_enq_ready_0;
	reg [128:0] ram;
	reg full;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire do_enq = (~(~full & io_deq_ready) & io_enq_ready_0) & io_enq_valid;
	assign io_enq_ready_0 = io_deq_ready | ~full;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {io_enq_bits_fromDMA, io_enq_bits_data};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & io_deq_valid_0)))
			full <= do_enq;
	end
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_data = (full ? ram[127:0] : io_enq_bits_data);
	assign io_deq_bits_fromDMA = (full ? ram[128] : io_enq_bits_fromDMA);
	assign io_count = full;
endmodule
