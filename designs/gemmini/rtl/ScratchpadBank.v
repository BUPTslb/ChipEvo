module ScratchpadBank (
	clock,
	reset,
	io_read_req_ready,
	io_read_req_valid,
	io_read_req_bits_addr,
	io_read_req_bits_fromDMA,
	io_read_resp_ready,
	io_read_resp_valid,
	io_read_resp_bits_data,
	io_read_resp_bits_fromDMA,
	io_write_valid,
	io_write_addr,
	io_write_mask_0,
	io_write_mask_1,
	io_write_mask_2,
	io_write_mask_3,
	io_write_mask_4,
	io_write_mask_5,
	io_write_mask_6,
	io_write_mask_7,
	io_write_mask_8,
	io_write_mask_9,
	io_write_mask_10,
	io_write_mask_11,
	io_write_mask_12,
	io_write_mask_13,
	io_write_mask_14,
	io_write_mask_15,
	io_write_data
);
	input clock;
	input reset;
	output wire io_read_req_ready;
	input io_read_req_valid;
	input [11:0] io_read_req_bits_addr;
	input io_read_req_bits_fromDMA;
	input io_read_resp_ready;
	output wire io_read_resp_valid;
	output wire [127:0] io_read_resp_bits_data;
	output wire io_read_resp_bits_fromDMA;
	input io_write_valid;
	input [11:0] io_write_addr;
	input io_write_mask_0;
	input io_write_mask_1;
	input io_write_mask_2;
	input io_write_mask_3;
	input io_write_mask_4;
	input io_write_mask_5;
	input io_write_mask_6;
	input io_write_mask_7;
	input io_write_mask_8;
	input io_write_mask_9;
	input io_write_mask_10;
	input io_write_mask_11;
	input io_write_mask_12;
	input io_write_mask_13;
	input io_write_mask_14;
	input io_write_mask_15;
	input [127:0] io_write_data;
	wire io_read_req_ready_0;
	reg q_io_enq_valid_REG;
	wire mem_rdata_MPORT_en;
	wire [127:0] _mem_ext_RW0_rdata;
	wire _q_io_enq_ready;
	wire _q_io_deq_valid;
	wire _q_io_count;
	wire ren = io_read_req_ready_0 & io_read_req_valid;
	always @(posedge clock)
		if ((~reset & ren) & io_write_valid) begin
// synopsys translate_off
			$error("Assertion failed\n    at Scratchpad.scala:167 assert(!(ren && io.write.fire))\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	assign mem_rdata_MPORT_en = ren & ~io_write_valid;
	reg q_io_enq_bits_fromDMA_REG;
	assign io_read_req_ready_0 = ((({1'h0, _q_io_count} + {1'h0, _q_io_enq_ready & q_io_enq_valid_REG}) - {1'h0, io_read_resp_ready & _q_io_deq_valid}) == 2'h0) & ~io_write_valid;
	always @(posedge clock) begin
		q_io_enq_valid_REG <= ren;
		q_io_enq_bits_fromDMA_REG <= io_read_req_bits_fromDMA;
	end
	Queue1_ScratchpadReadResp q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_q_io_enq_ready),
		.io_enq_valid(q_io_enq_valid_REG),
		.io_enq_bits_data(_mem_ext_RW0_rdata),
		.io_enq_bits_fromDMA(q_io_enq_bits_fromDMA_REG),
		.io_deq_ready(io_read_resp_ready),
		.io_deq_valid(_q_io_deq_valid),
		.io_deq_bits_data(io_read_resp_bits_data),
		.io_deq_bits_fromDMA(io_read_resp_bits_fromDMA),
		.io_count(_q_io_count)
	);
	mem_4096x128 mem_ext(
		.RW0_addr((io_write_valid ? io_write_addr : io_read_req_bits_addr)),
		.RW0_en(mem_rdata_MPORT_en | io_write_valid),
		.RW0_clk(clock),
		.RW0_wmode(io_write_valid),
		.RW0_wdata(io_write_data),
		.RW0_rdata(_mem_ext_RW0_rdata),
		.RW0_wmask({io_write_mask_15, io_write_mask_14, io_write_mask_13, io_write_mask_12, io_write_mask_11, io_write_mask_10, io_write_mask_9, io_write_mask_8, io_write_mask_7, io_write_mask_6, io_write_mask_5, io_write_mask_4, io_write_mask_3, io_write_mask_2, io_write_mask_1, io_write_mask_0})
	);
	assign io_read_req_ready = io_read_req_ready_0;
	assign io_read_resp_valid = _q_io_deq_valid;
endmodule
