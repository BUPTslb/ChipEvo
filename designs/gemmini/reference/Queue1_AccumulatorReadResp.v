module Queue1_AccumulatorReadResp (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_data_0_0,
	io_enq_bits_data_1_0,
	io_enq_bits_data_2_0,
	io_enq_bits_data_3_0,
	io_enq_bits_data_4_0,
	io_enq_bits_data_5_0,
	io_enq_bits_data_6_0,
	io_enq_bits_data_7_0,
	io_enq_bits_data_8_0,
	io_enq_bits_data_9_0,
	io_enq_bits_data_10_0,
	io_enq_bits_data_11_0,
	io_enq_bits_data_12_0,
	io_enq_bits_data_13_0,
	io_enq_bits_data_14_0,
	io_enq_bits_data_15_0,
	io_enq_bits_fromDMA,
	io_enq_bits_scale_bits,
	io_enq_bits_igelu_qb,
	io_enq_bits_igelu_qc,
	io_enq_bits_iexp_qln2,
	io_enq_bits_iexp_qln2_inv,
	io_enq_bits_act,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_data_0_0,
	io_deq_bits_data_1_0,
	io_deq_bits_data_2_0,
	io_deq_bits_data_3_0,
	io_deq_bits_data_4_0,
	io_deq_bits_data_5_0,
	io_deq_bits_data_6_0,
	io_deq_bits_data_7_0,
	io_deq_bits_data_8_0,
	io_deq_bits_data_9_0,
	io_deq_bits_data_10_0,
	io_deq_bits_data_11_0,
	io_deq_bits_data_12_0,
	io_deq_bits_data_13_0,
	io_deq_bits_data_14_0,
	io_deq_bits_data_15_0,
	io_deq_bits_fromDMA,
	io_deq_bits_scale_bits,
	io_deq_bits_igelu_qb,
	io_deq_bits_igelu_qc,
	io_deq_bits_iexp_qln2,
	io_deq_bits_iexp_qln2_inv,
	io_deq_bits_act,
	io_count
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [31:0] io_enq_bits_data_0_0;
	input [31:0] io_enq_bits_data_1_0;
	input [31:0] io_enq_bits_data_2_0;
	input [31:0] io_enq_bits_data_3_0;
	input [31:0] io_enq_bits_data_4_0;
	input [31:0] io_enq_bits_data_5_0;
	input [31:0] io_enq_bits_data_6_0;
	input [31:0] io_enq_bits_data_7_0;
	input [31:0] io_enq_bits_data_8_0;
	input [31:0] io_enq_bits_data_9_0;
	input [31:0] io_enq_bits_data_10_0;
	input [31:0] io_enq_bits_data_11_0;
	input [31:0] io_enq_bits_data_12_0;
	input [31:0] io_enq_bits_data_13_0;
	input [31:0] io_enq_bits_data_14_0;
	input [31:0] io_enq_bits_data_15_0;
	input io_enq_bits_fromDMA;
	input [31:0] io_enq_bits_scale_bits;
	input [31:0] io_enq_bits_igelu_qb;
	input [31:0] io_enq_bits_igelu_qc;
	input [31:0] io_enq_bits_iexp_qln2;
	input [31:0] io_enq_bits_iexp_qln2_inv;
	input [2:0] io_enq_bits_act;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [31:0] io_deq_bits_data_0_0;
	output wire [31:0] io_deq_bits_data_1_0;
	output wire [31:0] io_deq_bits_data_2_0;
	output wire [31:0] io_deq_bits_data_3_0;
	output wire [31:0] io_deq_bits_data_4_0;
	output wire [31:0] io_deq_bits_data_5_0;
	output wire [31:0] io_deq_bits_data_6_0;
	output wire [31:0] io_deq_bits_data_7_0;
	output wire [31:0] io_deq_bits_data_8_0;
	output wire [31:0] io_deq_bits_data_9_0;
	output wire [31:0] io_deq_bits_data_10_0;
	output wire [31:0] io_deq_bits_data_11_0;
	output wire [31:0] io_deq_bits_data_12_0;
	output wire [31:0] io_deq_bits_data_13_0;
	output wire [31:0] io_deq_bits_data_14_0;
	output wire [31:0] io_deq_bits_data_15_0;
	output wire io_deq_bits_fromDMA;
	output wire [31:0] io_deq_bits_scale_bits;
	output wire [31:0] io_deq_bits_igelu_qb;
	output wire [31:0] io_deq_bits_igelu_qc;
	output wire [31:0] io_deq_bits_iexp_qln2;
	output wire [31:0] io_deq_bits_iexp_qln2_inv;
	output wire [2:0] io_deq_bits_act;
	output wire io_count;
	wire io_enq_ready_0;
	reg [677:0] ram;
	reg full;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire do_enq = (~(~full & io_deq_ready) & io_enq_ready_0) & io_enq_valid;
	assign io_enq_ready_0 = io_deq_ready | ~full;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {2'h0, io_enq_bits_act, io_enq_bits_iexp_qln2_inv, io_enq_bits_iexp_qln2, io_enq_bits_igelu_qc, io_enq_bits_igelu_qb, io_enq_bits_scale_bits, io_enq_bits_fromDMA, io_enq_bits_data_15_0, io_enq_bits_data_14_0, io_enq_bits_data_13_0, io_enq_bits_data_12_0, io_enq_bits_data_11_0, io_enq_bits_data_10_0, io_enq_bits_data_9_0, io_enq_bits_data_8_0, io_enq_bits_data_7_0, io_enq_bits_data_6_0, io_enq_bits_data_5_0, io_enq_bits_data_4_0, io_enq_bits_data_3_0, io_enq_bits_data_2_0, io_enq_bits_data_1_0, io_enq_bits_data_0_0};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & io_deq_valid_0)))
			full <= do_enq;
	end
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_data_0_0 = (full ? ram[31:0] : io_enq_bits_data_0_0);
	assign io_deq_bits_data_1_0 = (full ? ram[63:32] : io_enq_bits_data_1_0);
	assign io_deq_bits_data_2_0 = (full ? ram[95:64] : io_enq_bits_data_2_0);
	assign io_deq_bits_data_3_0 = (full ? ram[127:96] : io_enq_bits_data_3_0);
	assign io_deq_bits_data_4_0 = (full ? ram[159:128] : io_enq_bits_data_4_0);
	assign io_deq_bits_data_5_0 = (full ? ram[191:160] : io_enq_bits_data_5_0);
	assign io_deq_bits_data_6_0 = (full ? ram[223:192] : io_enq_bits_data_6_0);
	assign io_deq_bits_data_7_0 = (full ? ram[255:224] : io_enq_bits_data_7_0);
	assign io_deq_bits_data_8_0 = (full ? ram[287:256] : io_enq_bits_data_8_0);
	assign io_deq_bits_data_9_0 = (full ? ram[319:288] : io_enq_bits_data_9_0);
	assign io_deq_bits_data_10_0 = (full ? ram[351:320] : io_enq_bits_data_10_0);
	assign io_deq_bits_data_11_0 = (full ? ram[383:352] : io_enq_bits_data_11_0);
	assign io_deq_bits_data_12_0 = (full ? ram[415:384] : io_enq_bits_data_12_0);
	assign io_deq_bits_data_13_0 = (full ? ram[447:416] : io_enq_bits_data_13_0);
	assign io_deq_bits_data_14_0 = (full ? ram[479:448] : io_enq_bits_data_14_0);
	assign io_deq_bits_data_15_0 = (full ? ram[511:480] : io_enq_bits_data_15_0);
	assign io_deq_bits_fromDMA = (full ? ram[512] : io_enq_bits_fromDMA);
	assign io_deq_bits_scale_bits = (full ? ram[544:513] : io_enq_bits_scale_bits);
	assign io_deq_bits_igelu_qb = (full ? ram[576:545] : io_enq_bits_igelu_qb);
	assign io_deq_bits_igelu_qc = (full ? ram[608:577] : io_enq_bits_igelu_qc);
	assign io_deq_bits_iexp_qln2 = (full ? ram[640:609] : io_enq_bits_iexp_qln2);
	assign io_deq_bits_iexp_qln2_inv = (full ? ram[672:641] : io_enq_bits_iexp_qln2_inv);
	assign io_deq_bits_act = (full ? ram[675:673] : io_enq_bits_act);
	assign io_count = full;
endmodule
