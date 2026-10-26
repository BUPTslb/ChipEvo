module Queue2_TLBundleA_a32d128s5k1z3u (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_opcode,
	io_enq_bits_param,
	io_enq_bits_size,
	io_enq_bits_source,
	io_enq_bits_address,
	io_enq_bits_mask,
	io_enq_bits_data,
	io_enq_bits_corrupt,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_opcode,
	io_deq_bits_param,
	io_deq_bits_size,
	io_deq_bits_source,
	io_deq_bits_address,
	io_deq_bits_mask,
	io_deq_bits_data,
	io_deq_bits_corrupt
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [2:0] io_enq_bits_opcode;
	input [2:0] io_enq_bits_param;
	input [2:0] io_enq_bits_size;
	input [4:0] io_enq_bits_source;
	input [31:0] io_enq_bits_address;
	input [15:0] io_enq_bits_mask;
	input [127:0] io_enq_bits_data;
	input io_enq_bits_corrupt;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [2:0] io_deq_bits_opcode;
	output wire [2:0] io_deq_bits_param;
	output wire [2:0] io_deq_bits_size;
	output wire [4:0] io_deq_bits_source;
	output wire [31:0] io_deq_bits_address;
	output wire [15:0] io_deq_bits_mask;
	output wire [127:0] io_deq_bits_data;
	output wire io_deq_bits_corrupt;
	wire [190:0] _ram_ext_R0_data;
	reg wrap;
	reg wrap_1;
	reg maybe_full;
	wire ptr_match = wrap == wrap_1;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = ~full & io_enq_valid;
	wire do_deq = io_deq_ready & ~empty;
	always @(posedge clock)
		if (reset) begin
			wrap <= 1'h0;
			wrap_1 <= 1'h0;
			maybe_full <= 1'h0;
		end
		else begin
			if (do_enq)
				wrap <= wrap - 1'h1;
			if (do_deq)
				wrap_1 <= wrap_1 - 1'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_2x191 ram_ext(
		.R0_addr(wrap_1),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(wrap),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_corrupt, io_enq_bits_data, io_enq_bits_mask, io_enq_bits_address, io_enq_bits_source, io_enq_bits_size, io_enq_bits_param, io_enq_bits_opcode})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_opcode = _ram_ext_R0_data[2:0];
	assign io_deq_bits_param = _ram_ext_R0_data[5:3];
	assign io_deq_bits_size = _ram_ext_R0_data[8:6];
	assign io_deq_bits_source = _ram_ext_R0_data[13:9];
	assign io_deq_bits_address = _ram_ext_R0_data[45:14];
	assign io_deq_bits_mask = _ram_ext_R0_data[61:46];
	assign io_deq_bits_data = _ram_ext_R0_data[189:62];
	assign io_deq_bits_corrupt = _ram_ext_R0_data[190];
endmodule
