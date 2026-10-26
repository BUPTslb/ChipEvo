module AccumulatorMem (
	clock,
	reset,
	io_read_req_ready,
	io_read_req_valid,
	io_read_req_bits_scale_bits,
	io_read_req_bits_addr,
	io_read_req_bits_igelu_qb,
	io_read_req_bits_igelu_qc,
	io_read_req_bits_iexp_qln2,
	io_read_req_bits_iexp_qln2_inv,
	io_read_req_bits_act,
	io_read_req_bits_fromDMA,
	io_read_resp_ready,
	io_read_resp_valid,
	io_read_resp_bits_data_0_0,
	io_read_resp_bits_data_1_0,
	io_read_resp_bits_data_2_0,
	io_read_resp_bits_data_3_0,
	io_read_resp_bits_data_4_0,
	io_read_resp_bits_data_5_0,
	io_read_resp_bits_data_6_0,
	io_read_resp_bits_data_7_0,
	io_read_resp_bits_data_8_0,
	io_read_resp_bits_data_9_0,
	io_read_resp_bits_data_10_0,
	io_read_resp_bits_data_11_0,
	io_read_resp_bits_data_12_0,
	io_read_resp_bits_data_13_0,
	io_read_resp_bits_data_14_0,
	io_read_resp_bits_data_15_0,
	io_read_resp_bits_fromDMA,
	io_read_resp_bits_scale_bits,
	io_read_resp_bits_igelu_qb,
	io_read_resp_bits_igelu_qc,
	io_read_resp_bits_iexp_qln2,
	io_read_resp_bits_iexp_qln2_inv,
	io_read_resp_bits_act,
	io_write_ready,
	io_write_valid,
	io_write_bits_addr,
	io_write_bits_data_0_0,
	io_write_bits_data_1_0,
	io_write_bits_data_2_0,
	io_write_bits_data_3_0,
	io_write_bits_data_4_0,
	io_write_bits_data_5_0,
	io_write_bits_data_6_0,
	io_write_bits_data_7_0,
	io_write_bits_data_8_0,
	io_write_bits_data_9_0,
	io_write_bits_data_10_0,
	io_write_bits_data_11_0,
	io_write_bits_data_12_0,
	io_write_bits_data_13_0,
	io_write_bits_data_14_0,
	io_write_bits_data_15_0,
	io_write_bits_acc,
	io_write_bits_mask_0,
	io_write_bits_mask_1,
	io_write_bits_mask_2,
	io_write_bits_mask_3,
	io_write_bits_mask_4,
	io_write_bits_mask_5,
	io_write_bits_mask_6,
	io_write_bits_mask_7,
	io_write_bits_mask_8,
	io_write_bits_mask_9,
	io_write_bits_mask_10,
	io_write_bits_mask_11,
	io_write_bits_mask_12,
	io_write_bits_mask_13,
	io_write_bits_mask_14,
	io_write_bits_mask_15,
	io_write_bits_mask_16,
	io_write_bits_mask_17,
	io_write_bits_mask_18,
	io_write_bits_mask_19,
	io_write_bits_mask_20,
	io_write_bits_mask_21,
	io_write_bits_mask_22,
	io_write_bits_mask_23,
	io_write_bits_mask_24,
	io_write_bits_mask_25,
	io_write_bits_mask_26,
	io_write_bits_mask_27,
	io_write_bits_mask_28,
	io_write_bits_mask_29,
	io_write_bits_mask_30,
	io_write_bits_mask_31,
	io_write_bits_mask_32,
	io_write_bits_mask_33,
	io_write_bits_mask_34,
	io_write_bits_mask_35,
	io_write_bits_mask_36,
	io_write_bits_mask_37,
	io_write_bits_mask_38,
	io_write_bits_mask_39,
	io_write_bits_mask_40,
	io_write_bits_mask_41,
	io_write_bits_mask_42,
	io_write_bits_mask_43,
	io_write_bits_mask_44,
	io_write_bits_mask_45,
	io_write_bits_mask_46,
	io_write_bits_mask_47,
	io_write_bits_mask_48,
	io_write_bits_mask_49,
	io_write_bits_mask_50,
	io_write_bits_mask_51,
	io_write_bits_mask_52,
	io_write_bits_mask_53,
	io_write_bits_mask_54,
	io_write_bits_mask_55,
	io_write_bits_mask_56,
	io_write_bits_mask_57,
	io_write_bits_mask_58,
	io_write_bits_mask_59,
	io_write_bits_mask_60,
	io_write_bits_mask_61,
	io_write_bits_mask_62,
	io_write_bits_mask_63,
	io_adder_valid,
	io_adder_op1_0_0,
	io_adder_op1_1_0,
	io_adder_op1_2_0,
	io_adder_op1_3_0,
	io_adder_op1_4_0,
	io_adder_op1_5_0,
	io_adder_op1_6_0,
	io_adder_op1_7_0,
	io_adder_op1_8_0,
	io_adder_op1_9_0,
	io_adder_op1_10_0,
	io_adder_op1_11_0,
	io_adder_op1_12_0,
	io_adder_op1_13_0,
	io_adder_op1_14_0,
	io_adder_op1_15_0,
	io_adder_op2_0_0,
	io_adder_op2_1_0,
	io_adder_op2_2_0,
	io_adder_op2_3_0,
	io_adder_op2_4_0,
	io_adder_op2_5_0,
	io_adder_op2_6_0,
	io_adder_op2_7_0,
	io_adder_op2_8_0,
	io_adder_op2_9_0,
	io_adder_op2_10_0,
	io_adder_op2_11_0,
	io_adder_op2_12_0,
	io_adder_op2_13_0,
	io_adder_op2_14_0,
	io_adder_op2_15_0,
	io_adder_sum_0_0,
	io_adder_sum_1_0,
	io_adder_sum_2_0,
	io_adder_sum_3_0,
	io_adder_sum_4_0,
	io_adder_sum_5_0,
	io_adder_sum_6_0,
	io_adder_sum_7_0,
	io_adder_sum_8_0,
	io_adder_sum_9_0,
	io_adder_sum_10_0,
	io_adder_sum_11_0,
	io_adder_sum_12_0,
	io_adder_sum_13_0,
	io_adder_sum_14_0,
	io_adder_sum_15_0
);
	input clock;
	input reset;
	output wire io_read_req_ready;
	input io_read_req_valid;
	input [31:0] io_read_req_bits_scale_bits;
	input [8:0] io_read_req_bits_addr;
	input [31:0] io_read_req_bits_igelu_qb;
	input [31:0] io_read_req_bits_igelu_qc;
	input [31:0] io_read_req_bits_iexp_qln2;
	input [31:0] io_read_req_bits_iexp_qln2_inv;
	input [2:0] io_read_req_bits_act;
	input io_read_req_bits_fromDMA;
	input io_read_resp_ready;
	output wire io_read_resp_valid;
	output wire [31:0] io_read_resp_bits_data_0_0;
	output wire [31:0] io_read_resp_bits_data_1_0;
	output wire [31:0] io_read_resp_bits_data_2_0;
	output wire [31:0] io_read_resp_bits_data_3_0;
	output wire [31:0] io_read_resp_bits_data_4_0;
	output wire [31:0] io_read_resp_bits_data_5_0;
	output wire [31:0] io_read_resp_bits_data_6_0;
	output wire [31:0] io_read_resp_bits_data_7_0;
	output wire [31:0] io_read_resp_bits_data_8_0;
	output wire [31:0] io_read_resp_bits_data_9_0;
	output wire [31:0] io_read_resp_bits_data_10_0;
	output wire [31:0] io_read_resp_bits_data_11_0;
	output wire [31:0] io_read_resp_bits_data_12_0;
	output wire [31:0] io_read_resp_bits_data_13_0;
	output wire [31:0] io_read_resp_bits_data_14_0;
	output wire [31:0] io_read_resp_bits_data_15_0;
	output wire io_read_resp_bits_fromDMA;
	output wire [31:0] io_read_resp_bits_scale_bits;
	output wire [31:0] io_read_resp_bits_igelu_qb;
	output wire [31:0] io_read_resp_bits_igelu_qc;
	output wire [31:0] io_read_resp_bits_iexp_qln2;
	output wire [31:0] io_read_resp_bits_iexp_qln2_inv;
	output wire [2:0] io_read_resp_bits_act;
	output wire io_write_ready;
	input io_write_valid;
	input [8:0] io_write_bits_addr;
	input [31:0] io_write_bits_data_0_0;
	input [31:0] io_write_bits_data_1_0;
	input [31:0] io_write_bits_data_2_0;
	input [31:0] io_write_bits_data_3_0;
	input [31:0] io_write_bits_data_4_0;
	input [31:0] io_write_bits_data_5_0;
	input [31:0] io_write_bits_data_6_0;
	input [31:0] io_write_bits_data_7_0;
	input [31:0] io_write_bits_data_8_0;
	input [31:0] io_write_bits_data_9_0;
	input [31:0] io_write_bits_data_10_0;
	input [31:0] io_write_bits_data_11_0;
	input [31:0] io_write_bits_data_12_0;
	input [31:0] io_write_bits_data_13_0;
	input [31:0] io_write_bits_data_14_0;
	input [31:0] io_write_bits_data_15_0;
	input io_write_bits_acc;
	input io_write_bits_mask_0;
	input io_write_bits_mask_1;
	input io_write_bits_mask_2;
	input io_write_bits_mask_3;
	input io_write_bits_mask_4;
	input io_write_bits_mask_5;
	input io_write_bits_mask_6;
	input io_write_bits_mask_7;
	input io_write_bits_mask_8;
	input io_write_bits_mask_9;
	input io_write_bits_mask_10;
	input io_write_bits_mask_11;
	input io_write_bits_mask_12;
	input io_write_bits_mask_13;
	input io_write_bits_mask_14;
	input io_write_bits_mask_15;
	input io_write_bits_mask_16;
	input io_write_bits_mask_17;
	input io_write_bits_mask_18;
	input io_write_bits_mask_19;
	input io_write_bits_mask_20;
	input io_write_bits_mask_21;
	input io_write_bits_mask_22;
	input io_write_bits_mask_23;
	input io_write_bits_mask_24;
	input io_write_bits_mask_25;
	input io_write_bits_mask_26;
	input io_write_bits_mask_27;
	input io_write_bits_mask_28;
	input io_write_bits_mask_29;
	input io_write_bits_mask_30;
	input io_write_bits_mask_31;
	input io_write_bits_mask_32;
	input io_write_bits_mask_33;
	input io_write_bits_mask_34;
	input io_write_bits_mask_35;
	input io_write_bits_mask_36;
	input io_write_bits_mask_37;
	input io_write_bits_mask_38;
	input io_write_bits_mask_39;
	input io_write_bits_mask_40;
	input io_write_bits_mask_41;
	input io_write_bits_mask_42;
	input io_write_bits_mask_43;
	input io_write_bits_mask_44;
	input io_write_bits_mask_45;
	input io_write_bits_mask_46;
	input io_write_bits_mask_47;
	input io_write_bits_mask_48;
	input io_write_bits_mask_49;
	input io_write_bits_mask_50;
	input io_write_bits_mask_51;
	input io_write_bits_mask_52;
	input io_write_bits_mask_53;
	input io_write_bits_mask_54;
	input io_write_bits_mask_55;
	input io_write_bits_mask_56;
	input io_write_bits_mask_57;
	input io_write_bits_mask_58;
	input io_write_bits_mask_59;
	input io_write_bits_mask_60;
	input io_write_bits_mask_61;
	input io_write_bits_mask_62;
	input io_write_bits_mask_63;
	output wire io_adder_valid;
	output wire [31:0] io_adder_op1_0_0;
	output wire [31:0] io_adder_op1_1_0;
	output wire [31:0] io_adder_op1_2_0;
	output wire [31:0] io_adder_op1_3_0;
	output wire [31:0] io_adder_op1_4_0;
	output wire [31:0] io_adder_op1_5_0;
	output wire [31:0] io_adder_op1_6_0;
	output wire [31:0] io_adder_op1_7_0;
	output wire [31:0] io_adder_op1_8_0;
	output wire [31:0] io_adder_op1_9_0;
	output wire [31:0] io_adder_op1_10_0;
	output wire [31:0] io_adder_op1_11_0;
	output wire [31:0] io_adder_op1_12_0;
	output wire [31:0] io_adder_op1_13_0;
	output wire [31:0] io_adder_op1_14_0;
	output wire [31:0] io_adder_op1_15_0;
	output wire [31:0] io_adder_op2_0_0;
	output wire [31:0] io_adder_op2_1_0;
	output wire [31:0] io_adder_op2_2_0;
	output wire [31:0] io_adder_op2_3_0;
	output wire [31:0] io_adder_op2_4_0;
	output wire [31:0] io_adder_op2_5_0;
	output wire [31:0] io_adder_op2_6_0;
	output wire [31:0] io_adder_op2_7_0;
	output wire [31:0] io_adder_op2_8_0;
	output wire [31:0] io_adder_op2_9_0;
	output wire [31:0] io_adder_op2_10_0;
	output wire [31:0] io_adder_op2_11_0;
	output wire [31:0] io_adder_op2_12_0;
	output wire [31:0] io_adder_op2_13_0;
	output wire [31:0] io_adder_op2_14_0;
	output wire [31:0] io_adder_op2_15_0;
	input [31:0] io_adder_sum_0_0;
	input [31:0] io_adder_sum_1_0;
	input [31:0] io_adder_sum_2_0;
	input [31:0] io_adder_sum_3_0;
	input [31:0] io_adder_sum_4_0;
	input [31:0] io_adder_sum_5_0;
	input [31:0] io_adder_sum_6_0;
	input [31:0] io_adder_sum_7_0;
	input [31:0] io_adder_sum_8_0;
	input [31:0] io_adder_sum_9_0;
	input [31:0] io_adder_sum_10_0;
	input [31:0] io_adder_sum_11_0;
	input [31:0] io_adder_sum_12_0;
	input [31:0] io_adder_sum_13_0;
	input [31:0] io_adder_sum_14_0;
	input [31:0] io_adder_sum_15_0;
	wire _io_write_ready_T_7;
	wire io_read_req_ready_0;
	wire _q_io_enq_ready;
	wire _q_io_deq_valid;
	wire _q_io_count;
	wire [31:0] _mem_io_rdata_0_0;
	wire [31:0] _mem_io_rdata_1_0;
	wire [31:0] _mem_io_rdata_2_0;
	wire [31:0] _mem_io_rdata_3_0;
	wire [31:0] _mem_io_rdata_4_0;
	wire [31:0] _mem_io_rdata_5_0;
	wire [31:0] _mem_io_rdata_6_0;
	wire [31:0] _mem_io_rdata_7_0;
	wire [31:0] _mem_io_rdata_8_0;
	wire [31:0] _mem_io_rdata_9_0;
	wire [31:0] _mem_io_rdata_10_0;
	wire [31:0] _mem_io_rdata_11_0;
	wire [31:0] _mem_io_rdata_12_0;
	wire [31:0] _mem_io_rdata_13_0;
	wire [31:0] _mem_io_rdata_14_0;
	wire [31:0] _mem_io_rdata_15_0;
	reg pipelined_writes_0_valid;
	reg [8:0] pipelined_writes_0_bits_addr;
	reg [31:0] pipelined_writes_0_bits_data_0_0;
	reg [31:0] pipelined_writes_0_bits_data_1_0;
	reg [31:0] pipelined_writes_0_bits_data_2_0;
	reg [31:0] pipelined_writes_0_bits_data_3_0;
	reg [31:0] pipelined_writes_0_bits_data_4_0;
	reg [31:0] pipelined_writes_0_bits_data_5_0;
	reg [31:0] pipelined_writes_0_bits_data_6_0;
	reg [31:0] pipelined_writes_0_bits_data_7_0;
	reg [31:0] pipelined_writes_0_bits_data_8_0;
	reg [31:0] pipelined_writes_0_bits_data_9_0;
	reg [31:0] pipelined_writes_0_bits_data_10_0;
	reg [31:0] pipelined_writes_0_bits_data_11_0;
	reg [31:0] pipelined_writes_0_bits_data_12_0;
	reg [31:0] pipelined_writes_0_bits_data_13_0;
	reg [31:0] pipelined_writes_0_bits_data_14_0;
	reg [31:0] pipelined_writes_0_bits_data_15_0;
	reg pipelined_writes_0_bits_acc;
	reg pipelined_writes_0_bits_mask_0;
	reg pipelined_writes_0_bits_mask_1;
	reg pipelined_writes_0_bits_mask_2;
	reg pipelined_writes_0_bits_mask_3;
	reg pipelined_writes_0_bits_mask_4;
	reg pipelined_writes_0_bits_mask_5;
	reg pipelined_writes_0_bits_mask_6;
	reg pipelined_writes_0_bits_mask_7;
	reg pipelined_writes_0_bits_mask_8;
	reg pipelined_writes_0_bits_mask_9;
	reg pipelined_writes_0_bits_mask_10;
	reg pipelined_writes_0_bits_mask_11;
	reg pipelined_writes_0_bits_mask_12;
	reg pipelined_writes_0_bits_mask_13;
	reg pipelined_writes_0_bits_mask_14;
	reg pipelined_writes_0_bits_mask_15;
	reg pipelined_writes_0_bits_mask_16;
	reg pipelined_writes_0_bits_mask_17;
	reg pipelined_writes_0_bits_mask_18;
	reg pipelined_writes_0_bits_mask_19;
	reg pipelined_writes_0_bits_mask_20;
	reg pipelined_writes_0_bits_mask_21;
	reg pipelined_writes_0_bits_mask_22;
	reg pipelined_writes_0_bits_mask_23;
	reg pipelined_writes_0_bits_mask_24;
	reg pipelined_writes_0_bits_mask_25;
	reg pipelined_writes_0_bits_mask_26;
	reg pipelined_writes_0_bits_mask_27;
	reg pipelined_writes_0_bits_mask_28;
	reg pipelined_writes_0_bits_mask_29;
	reg pipelined_writes_0_bits_mask_30;
	reg pipelined_writes_0_bits_mask_31;
	reg pipelined_writes_0_bits_mask_32;
	reg pipelined_writes_0_bits_mask_33;
	reg pipelined_writes_0_bits_mask_34;
	reg pipelined_writes_0_bits_mask_35;
	reg pipelined_writes_0_bits_mask_36;
	reg pipelined_writes_0_bits_mask_37;
	reg pipelined_writes_0_bits_mask_38;
	reg pipelined_writes_0_bits_mask_39;
	reg pipelined_writes_0_bits_mask_40;
	reg pipelined_writes_0_bits_mask_41;
	reg pipelined_writes_0_bits_mask_42;
	reg pipelined_writes_0_bits_mask_43;
	reg pipelined_writes_0_bits_mask_44;
	reg pipelined_writes_0_bits_mask_45;
	reg pipelined_writes_0_bits_mask_46;
	reg pipelined_writes_0_bits_mask_47;
	reg pipelined_writes_0_bits_mask_48;
	reg pipelined_writes_0_bits_mask_49;
	reg pipelined_writes_0_bits_mask_50;
	reg pipelined_writes_0_bits_mask_51;
	reg pipelined_writes_0_bits_mask_52;
	reg pipelined_writes_0_bits_mask_53;
	reg pipelined_writes_0_bits_mask_54;
	reg pipelined_writes_0_bits_mask_55;
	reg pipelined_writes_0_bits_mask_56;
	reg pipelined_writes_0_bits_mask_57;
	reg pipelined_writes_0_bits_mask_58;
	reg pipelined_writes_0_bits_mask_59;
	reg pipelined_writes_0_bits_mask_60;
	reg pipelined_writes_0_bits_mask_61;
	reg pipelined_writes_0_bits_mask_62;
	reg pipelined_writes_0_bits_mask_63;
	reg pipelined_writes_1_valid;
	reg [8:0] pipelined_writes_1_bits_addr;
	reg [31:0] pipelined_writes_1_bits_data_0_0;
	reg [31:0] pipelined_writes_1_bits_data_1_0;
	reg [31:0] pipelined_writes_1_bits_data_2_0;
	reg [31:0] pipelined_writes_1_bits_data_3_0;
	reg [31:0] pipelined_writes_1_bits_data_4_0;
	reg [31:0] pipelined_writes_1_bits_data_5_0;
	reg [31:0] pipelined_writes_1_bits_data_6_0;
	reg [31:0] pipelined_writes_1_bits_data_7_0;
	reg [31:0] pipelined_writes_1_bits_data_8_0;
	reg [31:0] pipelined_writes_1_bits_data_9_0;
	reg [31:0] pipelined_writes_1_bits_data_10_0;
	reg [31:0] pipelined_writes_1_bits_data_11_0;
	reg [31:0] pipelined_writes_1_bits_data_12_0;
	reg [31:0] pipelined_writes_1_bits_data_13_0;
	reg [31:0] pipelined_writes_1_bits_data_14_0;
	reg [31:0] pipelined_writes_1_bits_data_15_0;
	reg pipelined_writes_1_bits_acc;
	reg pipelined_writes_1_bits_mask_0;
	reg pipelined_writes_1_bits_mask_1;
	reg pipelined_writes_1_bits_mask_2;
	reg pipelined_writes_1_bits_mask_3;
	reg pipelined_writes_1_bits_mask_4;
	reg pipelined_writes_1_bits_mask_5;
	reg pipelined_writes_1_bits_mask_6;
	reg pipelined_writes_1_bits_mask_7;
	reg pipelined_writes_1_bits_mask_8;
	reg pipelined_writes_1_bits_mask_9;
	reg pipelined_writes_1_bits_mask_10;
	reg pipelined_writes_1_bits_mask_11;
	reg pipelined_writes_1_bits_mask_12;
	reg pipelined_writes_1_bits_mask_13;
	reg pipelined_writes_1_bits_mask_14;
	reg pipelined_writes_1_bits_mask_15;
	reg pipelined_writes_1_bits_mask_16;
	reg pipelined_writes_1_bits_mask_17;
	reg pipelined_writes_1_bits_mask_18;
	reg pipelined_writes_1_bits_mask_19;
	reg pipelined_writes_1_bits_mask_20;
	reg pipelined_writes_1_bits_mask_21;
	reg pipelined_writes_1_bits_mask_22;
	reg pipelined_writes_1_bits_mask_23;
	reg pipelined_writes_1_bits_mask_24;
	reg pipelined_writes_1_bits_mask_25;
	reg pipelined_writes_1_bits_mask_26;
	reg pipelined_writes_1_bits_mask_27;
	reg pipelined_writes_1_bits_mask_28;
	reg pipelined_writes_1_bits_mask_29;
	reg pipelined_writes_1_bits_mask_30;
	reg pipelined_writes_1_bits_mask_31;
	reg pipelined_writes_1_bits_mask_32;
	reg pipelined_writes_1_bits_mask_33;
	reg pipelined_writes_1_bits_mask_34;
	reg pipelined_writes_1_bits_mask_35;
	reg pipelined_writes_1_bits_mask_36;
	reg pipelined_writes_1_bits_mask_37;
	reg pipelined_writes_1_bits_mask_38;
	reg pipelined_writes_1_bits_mask_39;
	reg pipelined_writes_1_bits_mask_40;
	reg pipelined_writes_1_bits_mask_41;
	reg pipelined_writes_1_bits_mask_42;
	reg pipelined_writes_1_bits_mask_43;
	reg pipelined_writes_1_bits_mask_44;
	reg pipelined_writes_1_bits_mask_45;
	reg pipelined_writes_1_bits_mask_46;
	reg pipelined_writes_1_bits_mask_47;
	reg pipelined_writes_1_bits_mask_48;
	reg pipelined_writes_1_bits_mask_49;
	reg pipelined_writes_1_bits_mask_50;
	reg pipelined_writes_1_bits_mask_51;
	reg pipelined_writes_1_bits_mask_52;
	reg pipelined_writes_1_bits_mask_53;
	reg pipelined_writes_1_bits_mask_54;
	reg pipelined_writes_1_bits_mask_55;
	reg pipelined_writes_1_bits_mask_56;
	reg pipelined_writes_1_bits_mask_57;
	reg pipelined_writes_1_bits_mask_58;
	reg pipelined_writes_1_bits_mask_59;
	reg pipelined_writes_1_bits_mask_60;
	reg pipelined_writes_1_bits_mask_61;
	reg pipelined_writes_1_bits_mask_62;
	reg pipelined_writes_1_bits_mask_63;
	wire _mem_io_ren_T_1 = ~_io_write_ready_T_7 & io_write_valid;
	wire _q_io_enq_valid_T = io_read_req_ready_0 & io_read_req_valid;
	reg [31:0] q_io_enq_bits_scale_REG_bits;
	reg [31:0] q_io_enq_bits_igelu_qb_REG;
	reg [31:0] q_io_enq_bits_igelu_qc_REG;
	reg [31:0] q_io_enq_bits_iexp_qln2_REG;
	reg [31:0] q_io_enq_bits_iexp_qln2_inv_REG;
	reg [2:0] q_io_enq_bits_act_REG;
	reg q_io_enq_bits_fromDMA_REG;
	reg q_io_enq_valid_REG;
	assign io_read_req_ready_0 = (((({1'h0, _q_io_count} + {1'h0, _q_io_enq_ready & q_io_enq_valid_REG}) - {1'h0, io_read_resp_ready & _q_io_deq_valid}) == 2'h0) & ~(io_write_valid & io_write_bits_acc)) & ~((pipelined_writes_0_valid & (pipelined_writes_0_bits_addr == io_read_req_bits_addr)) | (pipelined_writes_1_valid & (pipelined_writes_1_bits_addr == io_read_req_bits_addr)));
	assign _io_write_ready_T_7 = ((pipelined_writes_0_valid & (pipelined_writes_0_bits_addr == io_write_bits_addr)) & io_write_bits_acc) | ((pipelined_writes_1_valid & (pipelined_writes_1_bits_addr == io_write_bits_addr)) & io_write_bits_acc);
	always @(posedge clock)
		if (((~reset & _q_io_enq_valid_T) & _mem_io_ren_T_1) & (io_read_req_bits_addr == io_write_bits_addr)) begin
// synopsys translate_off
			$error("Assertion failed: reading from and writing to same address is not supported\n    at AccumulatorMem.scala:395 assert(!(io.read.req.fire && io.write.fire && io.read.req.bits.addr === io.write.bits.addr), \"reading from and writing to same address is not supported\")\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	always @(posedge clock) begin
		if (reset) begin
			pipelined_writes_0_valid <= 1'h0;
			pipelined_writes_1_valid <= 1'h0;
		end
		else begin
			pipelined_writes_0_valid <= _mem_io_ren_T_1;
			pipelined_writes_1_valid <= pipelined_writes_0_valid;
		end
		pipelined_writes_0_bits_addr <= io_write_bits_addr;
		pipelined_writes_0_bits_data_0_0 <= io_write_bits_data_0_0;
		pipelined_writes_0_bits_data_1_0 <= io_write_bits_data_1_0;
		pipelined_writes_0_bits_data_2_0 <= io_write_bits_data_2_0;
		pipelined_writes_0_bits_data_3_0 <= io_write_bits_data_3_0;
		pipelined_writes_0_bits_data_4_0 <= io_write_bits_data_4_0;
		pipelined_writes_0_bits_data_5_0 <= io_write_bits_data_5_0;
		pipelined_writes_0_bits_data_6_0 <= io_write_bits_data_6_0;
		pipelined_writes_0_bits_data_7_0 <= io_write_bits_data_7_0;
		pipelined_writes_0_bits_data_8_0 <= io_write_bits_data_8_0;
		pipelined_writes_0_bits_data_9_0 <= io_write_bits_data_9_0;
		pipelined_writes_0_bits_data_10_0 <= io_write_bits_data_10_0;
		pipelined_writes_0_bits_data_11_0 <= io_write_bits_data_11_0;
		pipelined_writes_0_bits_data_12_0 <= io_write_bits_data_12_0;
		pipelined_writes_0_bits_data_13_0 <= io_write_bits_data_13_0;
		pipelined_writes_0_bits_data_14_0 <= io_write_bits_data_14_0;
		pipelined_writes_0_bits_data_15_0 <= io_write_bits_data_15_0;
		pipelined_writes_0_bits_acc <= io_write_bits_acc;
		pipelined_writes_0_bits_mask_0 <= io_write_bits_mask_0;
		pipelined_writes_0_bits_mask_1 <= io_write_bits_mask_1;
		pipelined_writes_0_bits_mask_2 <= io_write_bits_mask_2;
		pipelined_writes_0_bits_mask_3 <= io_write_bits_mask_3;
		pipelined_writes_0_bits_mask_4 <= io_write_bits_mask_4;
		pipelined_writes_0_bits_mask_5 <= io_write_bits_mask_5;
		pipelined_writes_0_bits_mask_6 <= io_write_bits_mask_6;
		pipelined_writes_0_bits_mask_7 <= io_write_bits_mask_7;
		pipelined_writes_0_bits_mask_8 <= io_write_bits_mask_8;
		pipelined_writes_0_bits_mask_9 <= io_write_bits_mask_9;
		pipelined_writes_0_bits_mask_10 <= io_write_bits_mask_10;
		pipelined_writes_0_bits_mask_11 <= io_write_bits_mask_11;
		pipelined_writes_0_bits_mask_12 <= io_write_bits_mask_12;
		pipelined_writes_0_bits_mask_13 <= io_write_bits_mask_13;
		pipelined_writes_0_bits_mask_14 <= io_write_bits_mask_14;
		pipelined_writes_0_bits_mask_15 <= io_write_bits_mask_15;
		pipelined_writes_0_bits_mask_16 <= io_write_bits_mask_16;
		pipelined_writes_0_bits_mask_17 <= io_write_bits_mask_17;
		pipelined_writes_0_bits_mask_18 <= io_write_bits_mask_18;
		pipelined_writes_0_bits_mask_19 <= io_write_bits_mask_19;
		pipelined_writes_0_bits_mask_20 <= io_write_bits_mask_20;
		pipelined_writes_0_bits_mask_21 <= io_write_bits_mask_21;
		pipelined_writes_0_bits_mask_22 <= io_write_bits_mask_22;
		pipelined_writes_0_bits_mask_23 <= io_write_bits_mask_23;
		pipelined_writes_0_bits_mask_24 <= io_write_bits_mask_24;
		pipelined_writes_0_bits_mask_25 <= io_write_bits_mask_25;
		pipelined_writes_0_bits_mask_26 <= io_write_bits_mask_26;
		pipelined_writes_0_bits_mask_27 <= io_write_bits_mask_27;
		pipelined_writes_0_bits_mask_28 <= io_write_bits_mask_28;
		pipelined_writes_0_bits_mask_29 <= io_write_bits_mask_29;
		pipelined_writes_0_bits_mask_30 <= io_write_bits_mask_30;
		pipelined_writes_0_bits_mask_31 <= io_write_bits_mask_31;
		pipelined_writes_0_bits_mask_32 <= io_write_bits_mask_32;
		pipelined_writes_0_bits_mask_33 <= io_write_bits_mask_33;
		pipelined_writes_0_bits_mask_34 <= io_write_bits_mask_34;
		pipelined_writes_0_bits_mask_35 <= io_write_bits_mask_35;
		pipelined_writes_0_bits_mask_36 <= io_write_bits_mask_36;
		pipelined_writes_0_bits_mask_37 <= io_write_bits_mask_37;
		pipelined_writes_0_bits_mask_38 <= io_write_bits_mask_38;
		pipelined_writes_0_bits_mask_39 <= io_write_bits_mask_39;
		pipelined_writes_0_bits_mask_40 <= io_write_bits_mask_40;
		pipelined_writes_0_bits_mask_41 <= io_write_bits_mask_41;
		pipelined_writes_0_bits_mask_42 <= io_write_bits_mask_42;
		pipelined_writes_0_bits_mask_43 <= io_write_bits_mask_43;
		pipelined_writes_0_bits_mask_44 <= io_write_bits_mask_44;
		pipelined_writes_0_bits_mask_45 <= io_write_bits_mask_45;
		pipelined_writes_0_bits_mask_46 <= io_write_bits_mask_46;
		pipelined_writes_0_bits_mask_47 <= io_write_bits_mask_47;
		pipelined_writes_0_bits_mask_48 <= io_write_bits_mask_48;
		pipelined_writes_0_bits_mask_49 <= io_write_bits_mask_49;
		pipelined_writes_0_bits_mask_50 <= io_write_bits_mask_50;
		pipelined_writes_0_bits_mask_51 <= io_write_bits_mask_51;
		pipelined_writes_0_bits_mask_52 <= io_write_bits_mask_52;
		pipelined_writes_0_bits_mask_53 <= io_write_bits_mask_53;
		pipelined_writes_0_bits_mask_54 <= io_write_bits_mask_54;
		pipelined_writes_0_bits_mask_55 <= io_write_bits_mask_55;
		pipelined_writes_0_bits_mask_56 <= io_write_bits_mask_56;
		pipelined_writes_0_bits_mask_57 <= io_write_bits_mask_57;
		pipelined_writes_0_bits_mask_58 <= io_write_bits_mask_58;
		pipelined_writes_0_bits_mask_59 <= io_write_bits_mask_59;
		pipelined_writes_0_bits_mask_60 <= io_write_bits_mask_60;
		pipelined_writes_0_bits_mask_61 <= io_write_bits_mask_61;
		pipelined_writes_0_bits_mask_62 <= io_write_bits_mask_62;
		pipelined_writes_0_bits_mask_63 <= io_write_bits_mask_63;
		pipelined_writes_1_bits_addr <= pipelined_writes_0_bits_addr;
		pipelined_writes_1_bits_data_0_0 <= pipelined_writes_0_bits_data_0_0;
		pipelined_writes_1_bits_data_1_0 <= pipelined_writes_0_bits_data_1_0;
		pipelined_writes_1_bits_data_2_0 <= pipelined_writes_0_bits_data_2_0;
		pipelined_writes_1_bits_data_3_0 <= pipelined_writes_0_bits_data_3_0;
		pipelined_writes_1_bits_data_4_0 <= pipelined_writes_0_bits_data_4_0;
		pipelined_writes_1_bits_data_5_0 <= pipelined_writes_0_bits_data_5_0;
		pipelined_writes_1_bits_data_6_0 <= pipelined_writes_0_bits_data_6_0;
		pipelined_writes_1_bits_data_7_0 <= pipelined_writes_0_bits_data_7_0;
		pipelined_writes_1_bits_data_8_0 <= pipelined_writes_0_bits_data_8_0;
		pipelined_writes_1_bits_data_9_0 <= pipelined_writes_0_bits_data_9_0;
		pipelined_writes_1_bits_data_10_0 <= pipelined_writes_0_bits_data_10_0;
		pipelined_writes_1_bits_data_11_0 <= pipelined_writes_0_bits_data_11_0;
		pipelined_writes_1_bits_data_12_0 <= pipelined_writes_0_bits_data_12_0;
		pipelined_writes_1_bits_data_13_0 <= pipelined_writes_0_bits_data_13_0;
		pipelined_writes_1_bits_data_14_0 <= pipelined_writes_0_bits_data_14_0;
		pipelined_writes_1_bits_data_15_0 <= pipelined_writes_0_bits_data_15_0;
		pipelined_writes_1_bits_acc <= pipelined_writes_0_bits_acc;
		pipelined_writes_1_bits_mask_0 <= pipelined_writes_0_bits_mask_0;
		pipelined_writes_1_bits_mask_1 <= pipelined_writes_0_bits_mask_1;
		pipelined_writes_1_bits_mask_2 <= pipelined_writes_0_bits_mask_2;
		pipelined_writes_1_bits_mask_3 <= pipelined_writes_0_bits_mask_3;
		pipelined_writes_1_bits_mask_4 <= pipelined_writes_0_bits_mask_4;
		pipelined_writes_1_bits_mask_5 <= pipelined_writes_0_bits_mask_5;
		pipelined_writes_1_bits_mask_6 <= pipelined_writes_0_bits_mask_6;
		pipelined_writes_1_bits_mask_7 <= pipelined_writes_0_bits_mask_7;
		pipelined_writes_1_bits_mask_8 <= pipelined_writes_0_bits_mask_8;
		pipelined_writes_1_bits_mask_9 <= pipelined_writes_0_bits_mask_9;
		pipelined_writes_1_bits_mask_10 <= pipelined_writes_0_bits_mask_10;
		pipelined_writes_1_bits_mask_11 <= pipelined_writes_0_bits_mask_11;
		pipelined_writes_1_bits_mask_12 <= pipelined_writes_0_bits_mask_12;
		pipelined_writes_1_bits_mask_13 <= pipelined_writes_0_bits_mask_13;
		pipelined_writes_1_bits_mask_14 <= pipelined_writes_0_bits_mask_14;
		pipelined_writes_1_bits_mask_15 <= pipelined_writes_0_bits_mask_15;
		pipelined_writes_1_bits_mask_16 <= pipelined_writes_0_bits_mask_16;
		pipelined_writes_1_bits_mask_17 <= pipelined_writes_0_bits_mask_17;
		pipelined_writes_1_bits_mask_18 <= pipelined_writes_0_bits_mask_18;
		pipelined_writes_1_bits_mask_19 <= pipelined_writes_0_bits_mask_19;
		pipelined_writes_1_bits_mask_20 <= pipelined_writes_0_bits_mask_20;
		pipelined_writes_1_bits_mask_21 <= pipelined_writes_0_bits_mask_21;
		pipelined_writes_1_bits_mask_22 <= pipelined_writes_0_bits_mask_22;
		pipelined_writes_1_bits_mask_23 <= pipelined_writes_0_bits_mask_23;
		pipelined_writes_1_bits_mask_24 <= pipelined_writes_0_bits_mask_24;
		pipelined_writes_1_bits_mask_25 <= pipelined_writes_0_bits_mask_25;
		pipelined_writes_1_bits_mask_26 <= pipelined_writes_0_bits_mask_26;
		pipelined_writes_1_bits_mask_27 <= pipelined_writes_0_bits_mask_27;
		pipelined_writes_1_bits_mask_28 <= pipelined_writes_0_bits_mask_28;
		pipelined_writes_1_bits_mask_29 <= pipelined_writes_0_bits_mask_29;
		pipelined_writes_1_bits_mask_30 <= pipelined_writes_0_bits_mask_30;
		pipelined_writes_1_bits_mask_31 <= pipelined_writes_0_bits_mask_31;
		pipelined_writes_1_bits_mask_32 <= pipelined_writes_0_bits_mask_32;
		pipelined_writes_1_bits_mask_33 <= pipelined_writes_0_bits_mask_33;
		pipelined_writes_1_bits_mask_34 <= pipelined_writes_0_bits_mask_34;
		pipelined_writes_1_bits_mask_35 <= pipelined_writes_0_bits_mask_35;
		pipelined_writes_1_bits_mask_36 <= pipelined_writes_0_bits_mask_36;
		pipelined_writes_1_bits_mask_37 <= pipelined_writes_0_bits_mask_37;
		pipelined_writes_1_bits_mask_38 <= pipelined_writes_0_bits_mask_38;
		pipelined_writes_1_bits_mask_39 <= pipelined_writes_0_bits_mask_39;
		pipelined_writes_1_bits_mask_40 <= pipelined_writes_0_bits_mask_40;
		pipelined_writes_1_bits_mask_41 <= pipelined_writes_0_bits_mask_41;
		pipelined_writes_1_bits_mask_42 <= pipelined_writes_0_bits_mask_42;
		pipelined_writes_1_bits_mask_43 <= pipelined_writes_0_bits_mask_43;
		pipelined_writes_1_bits_mask_44 <= pipelined_writes_0_bits_mask_44;
		pipelined_writes_1_bits_mask_45 <= pipelined_writes_0_bits_mask_45;
		pipelined_writes_1_bits_mask_46 <= pipelined_writes_0_bits_mask_46;
		pipelined_writes_1_bits_mask_47 <= pipelined_writes_0_bits_mask_47;
		pipelined_writes_1_bits_mask_48 <= pipelined_writes_0_bits_mask_48;
		pipelined_writes_1_bits_mask_49 <= pipelined_writes_0_bits_mask_49;
		pipelined_writes_1_bits_mask_50 <= pipelined_writes_0_bits_mask_50;
		pipelined_writes_1_bits_mask_51 <= pipelined_writes_0_bits_mask_51;
		pipelined_writes_1_bits_mask_52 <= pipelined_writes_0_bits_mask_52;
		pipelined_writes_1_bits_mask_53 <= pipelined_writes_0_bits_mask_53;
		pipelined_writes_1_bits_mask_54 <= pipelined_writes_0_bits_mask_54;
		pipelined_writes_1_bits_mask_55 <= pipelined_writes_0_bits_mask_55;
		pipelined_writes_1_bits_mask_56 <= pipelined_writes_0_bits_mask_56;
		pipelined_writes_1_bits_mask_57 <= pipelined_writes_0_bits_mask_57;
		pipelined_writes_1_bits_mask_58 <= pipelined_writes_0_bits_mask_58;
		pipelined_writes_1_bits_mask_59 <= pipelined_writes_0_bits_mask_59;
		pipelined_writes_1_bits_mask_60 <= pipelined_writes_0_bits_mask_60;
		pipelined_writes_1_bits_mask_61 <= pipelined_writes_0_bits_mask_61;
		pipelined_writes_1_bits_mask_62 <= pipelined_writes_0_bits_mask_62;
		pipelined_writes_1_bits_mask_63 <= pipelined_writes_0_bits_mask_63;
		q_io_enq_bits_scale_REG_bits <= io_read_req_bits_scale_bits;
		q_io_enq_bits_igelu_qb_REG <= io_read_req_bits_igelu_qb;
		q_io_enq_bits_igelu_qc_REG <= io_read_req_bits_igelu_qc;
		q_io_enq_bits_iexp_qln2_REG <= io_read_req_bits_iexp_qln2;
		q_io_enq_bits_iexp_qln2_inv_REG <= io_read_req_bits_iexp_qln2_inv;
		q_io_enq_bits_act_REG <= io_read_req_bits_act;
		q_io_enq_bits_fromDMA_REG <= io_read_req_bits_fromDMA;
		q_io_enq_valid_REG <= _q_io_enq_valid_T;
	end
	TwoPortSyncMem mem(
		.clock(clock),
		.reset(reset),
		.io_waddr(pipelined_writes_1_bits_addr),
		.io_raddr((_mem_io_ren_T_1 & io_write_bits_acc ? io_write_bits_addr : io_read_req_bits_addr)),
		.io_wdata_0_0((pipelined_writes_1_bits_acc ? io_adder_sum_0_0 : pipelined_writes_1_bits_data_0_0)),
		.io_wdata_1_0((pipelined_writes_1_bits_acc ? io_adder_sum_1_0 : pipelined_writes_1_bits_data_1_0)),
		.io_wdata_2_0((pipelined_writes_1_bits_acc ? io_adder_sum_2_0 : pipelined_writes_1_bits_data_2_0)),
		.io_wdata_3_0((pipelined_writes_1_bits_acc ? io_adder_sum_3_0 : pipelined_writes_1_bits_data_3_0)),
		.io_wdata_4_0((pipelined_writes_1_bits_acc ? io_adder_sum_4_0 : pipelined_writes_1_bits_data_4_0)),
		.io_wdata_5_0((pipelined_writes_1_bits_acc ? io_adder_sum_5_0 : pipelined_writes_1_bits_data_5_0)),
		.io_wdata_6_0((pipelined_writes_1_bits_acc ? io_adder_sum_6_0 : pipelined_writes_1_bits_data_6_0)),
		.io_wdata_7_0((pipelined_writes_1_bits_acc ? io_adder_sum_7_0 : pipelined_writes_1_bits_data_7_0)),
		.io_wdata_8_0((pipelined_writes_1_bits_acc ? io_adder_sum_8_0 : pipelined_writes_1_bits_data_8_0)),
		.io_wdata_9_0((pipelined_writes_1_bits_acc ? io_adder_sum_9_0 : pipelined_writes_1_bits_data_9_0)),
		.io_wdata_10_0((pipelined_writes_1_bits_acc ? io_adder_sum_10_0 : pipelined_writes_1_bits_data_10_0)),
		.io_wdata_11_0((pipelined_writes_1_bits_acc ? io_adder_sum_11_0 : pipelined_writes_1_bits_data_11_0)),
		.io_wdata_12_0((pipelined_writes_1_bits_acc ? io_adder_sum_12_0 : pipelined_writes_1_bits_data_12_0)),
		.io_wdata_13_0((pipelined_writes_1_bits_acc ? io_adder_sum_13_0 : pipelined_writes_1_bits_data_13_0)),
		.io_wdata_14_0((pipelined_writes_1_bits_acc ? io_adder_sum_14_0 : pipelined_writes_1_bits_data_14_0)),
		.io_wdata_15_0((pipelined_writes_1_bits_acc ? io_adder_sum_15_0 : pipelined_writes_1_bits_data_15_0)),
		.io_rdata_0_0(_mem_io_rdata_0_0),
		.io_rdata_1_0(_mem_io_rdata_1_0),
		.io_rdata_2_0(_mem_io_rdata_2_0),
		.io_rdata_3_0(_mem_io_rdata_3_0),
		.io_rdata_4_0(_mem_io_rdata_4_0),
		.io_rdata_5_0(_mem_io_rdata_5_0),
		.io_rdata_6_0(_mem_io_rdata_6_0),
		.io_rdata_7_0(_mem_io_rdata_7_0),
		.io_rdata_8_0(_mem_io_rdata_8_0),
		.io_rdata_9_0(_mem_io_rdata_9_0),
		.io_rdata_10_0(_mem_io_rdata_10_0),
		.io_rdata_11_0(_mem_io_rdata_11_0),
		.io_rdata_12_0(_mem_io_rdata_12_0),
		.io_rdata_13_0(_mem_io_rdata_13_0),
		.io_rdata_14_0(_mem_io_rdata_14_0),
		.io_rdata_15_0(_mem_io_rdata_15_0),
		.io_wen(pipelined_writes_1_valid),
		.io_ren(_q_io_enq_valid_T | (_mem_io_ren_T_1 & io_write_bits_acc)),
		.io_mask_0(pipelined_writes_1_bits_mask_0),
		.io_mask_1(pipelined_writes_1_bits_mask_1),
		.io_mask_2(pipelined_writes_1_bits_mask_2),
		.io_mask_3(pipelined_writes_1_bits_mask_3),
		.io_mask_4(pipelined_writes_1_bits_mask_4),
		.io_mask_5(pipelined_writes_1_bits_mask_5),
		.io_mask_6(pipelined_writes_1_bits_mask_6),
		.io_mask_7(pipelined_writes_1_bits_mask_7),
		.io_mask_8(pipelined_writes_1_bits_mask_8),
		.io_mask_9(pipelined_writes_1_bits_mask_9),
		.io_mask_10(pipelined_writes_1_bits_mask_10),
		.io_mask_11(pipelined_writes_1_bits_mask_11),
		.io_mask_12(pipelined_writes_1_bits_mask_12),
		.io_mask_13(pipelined_writes_1_bits_mask_13),
		.io_mask_14(pipelined_writes_1_bits_mask_14),
		.io_mask_15(pipelined_writes_1_bits_mask_15),
		.io_mask_16(pipelined_writes_1_bits_mask_16),
		.io_mask_17(pipelined_writes_1_bits_mask_17),
		.io_mask_18(pipelined_writes_1_bits_mask_18),
		.io_mask_19(pipelined_writes_1_bits_mask_19),
		.io_mask_20(pipelined_writes_1_bits_mask_20),
		.io_mask_21(pipelined_writes_1_bits_mask_21),
		.io_mask_22(pipelined_writes_1_bits_mask_22),
		.io_mask_23(pipelined_writes_1_bits_mask_23),
		.io_mask_24(pipelined_writes_1_bits_mask_24),
		.io_mask_25(pipelined_writes_1_bits_mask_25),
		.io_mask_26(pipelined_writes_1_bits_mask_26),
		.io_mask_27(pipelined_writes_1_bits_mask_27),
		.io_mask_28(pipelined_writes_1_bits_mask_28),
		.io_mask_29(pipelined_writes_1_bits_mask_29),
		.io_mask_30(pipelined_writes_1_bits_mask_30),
		.io_mask_31(pipelined_writes_1_bits_mask_31),
		.io_mask_32(pipelined_writes_1_bits_mask_32),
		.io_mask_33(pipelined_writes_1_bits_mask_33),
		.io_mask_34(pipelined_writes_1_bits_mask_34),
		.io_mask_35(pipelined_writes_1_bits_mask_35),
		.io_mask_36(pipelined_writes_1_bits_mask_36),
		.io_mask_37(pipelined_writes_1_bits_mask_37),
		.io_mask_38(pipelined_writes_1_bits_mask_38),
		.io_mask_39(pipelined_writes_1_bits_mask_39),
		.io_mask_40(pipelined_writes_1_bits_mask_40),
		.io_mask_41(pipelined_writes_1_bits_mask_41),
		.io_mask_42(pipelined_writes_1_bits_mask_42),
		.io_mask_43(pipelined_writes_1_bits_mask_43),
		.io_mask_44(pipelined_writes_1_bits_mask_44),
		.io_mask_45(pipelined_writes_1_bits_mask_45),
		.io_mask_46(pipelined_writes_1_bits_mask_46),
		.io_mask_47(pipelined_writes_1_bits_mask_47),
		.io_mask_48(pipelined_writes_1_bits_mask_48),
		.io_mask_49(pipelined_writes_1_bits_mask_49),
		.io_mask_50(pipelined_writes_1_bits_mask_50),
		.io_mask_51(pipelined_writes_1_bits_mask_51),
		.io_mask_52(pipelined_writes_1_bits_mask_52),
		.io_mask_53(pipelined_writes_1_bits_mask_53),
		.io_mask_54(pipelined_writes_1_bits_mask_54),
		.io_mask_55(pipelined_writes_1_bits_mask_55),
		.io_mask_56(pipelined_writes_1_bits_mask_56),
		.io_mask_57(pipelined_writes_1_bits_mask_57),
		.io_mask_58(pipelined_writes_1_bits_mask_58),
		.io_mask_59(pipelined_writes_1_bits_mask_59),
		.io_mask_60(pipelined_writes_1_bits_mask_60),
		.io_mask_61(pipelined_writes_1_bits_mask_61),
		.io_mask_62(pipelined_writes_1_bits_mask_62),
		.io_mask_63(pipelined_writes_1_bits_mask_63)
	);
	Queue1_AccumulatorReadResp q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_q_io_enq_ready),
		.io_enq_valid(q_io_enq_valid_REG),
		.io_enq_bits_data_0_0(_mem_io_rdata_0_0),
		.io_enq_bits_data_1_0(_mem_io_rdata_1_0),
		.io_enq_bits_data_2_0(_mem_io_rdata_2_0),
		.io_enq_bits_data_3_0(_mem_io_rdata_3_0),
		.io_enq_bits_data_4_0(_mem_io_rdata_4_0),
		.io_enq_bits_data_5_0(_mem_io_rdata_5_0),
		.io_enq_bits_data_6_0(_mem_io_rdata_6_0),
		.io_enq_bits_data_7_0(_mem_io_rdata_7_0),
		.io_enq_bits_data_8_0(_mem_io_rdata_8_0),
		.io_enq_bits_data_9_0(_mem_io_rdata_9_0),
		.io_enq_bits_data_10_0(_mem_io_rdata_10_0),
		.io_enq_bits_data_11_0(_mem_io_rdata_11_0),
		.io_enq_bits_data_12_0(_mem_io_rdata_12_0),
		.io_enq_bits_data_13_0(_mem_io_rdata_13_0),
		.io_enq_bits_data_14_0(_mem_io_rdata_14_0),
		.io_enq_bits_data_15_0(_mem_io_rdata_15_0),
		.io_enq_bits_fromDMA(q_io_enq_bits_fromDMA_REG),
		.io_enq_bits_scale_bits(q_io_enq_bits_scale_REG_bits),
		.io_enq_bits_igelu_qb(q_io_enq_bits_igelu_qb_REG),
		.io_enq_bits_igelu_qc(q_io_enq_bits_igelu_qc_REG),
		.io_enq_bits_iexp_qln2(q_io_enq_bits_iexp_qln2_REG),
		.io_enq_bits_iexp_qln2_inv(q_io_enq_bits_iexp_qln2_inv_REG),
		.io_enq_bits_act(q_io_enq_bits_act_REG),
		.io_deq_ready(io_read_resp_ready),
		.io_deq_valid(_q_io_deq_valid),
		.io_deq_bits_data_0_0(io_read_resp_bits_data_0_0),
		.io_deq_bits_data_1_0(io_read_resp_bits_data_1_0),
		.io_deq_bits_data_2_0(io_read_resp_bits_data_2_0),
		.io_deq_bits_data_3_0(io_read_resp_bits_data_3_0),
		.io_deq_bits_data_4_0(io_read_resp_bits_data_4_0),
		.io_deq_bits_data_5_0(io_read_resp_bits_data_5_0),
		.io_deq_bits_data_6_0(io_read_resp_bits_data_6_0),
		.io_deq_bits_data_7_0(io_read_resp_bits_data_7_0),
		.io_deq_bits_data_8_0(io_read_resp_bits_data_8_0),
		.io_deq_bits_data_9_0(io_read_resp_bits_data_9_0),
		.io_deq_bits_data_10_0(io_read_resp_bits_data_10_0),
		.io_deq_bits_data_11_0(io_read_resp_bits_data_11_0),
		.io_deq_bits_data_12_0(io_read_resp_bits_data_12_0),
		.io_deq_bits_data_13_0(io_read_resp_bits_data_13_0),
		.io_deq_bits_data_14_0(io_read_resp_bits_data_14_0),
		.io_deq_bits_data_15_0(io_read_resp_bits_data_15_0),
		.io_deq_bits_fromDMA(io_read_resp_bits_fromDMA),
		.io_deq_bits_scale_bits(io_read_resp_bits_scale_bits),
		.io_deq_bits_igelu_qb(io_read_resp_bits_igelu_qb),
		.io_deq_bits_igelu_qc(io_read_resp_bits_igelu_qc),
		.io_deq_bits_iexp_qln2(io_read_resp_bits_iexp_qln2),
		.io_deq_bits_iexp_qln2_inv(io_read_resp_bits_iexp_qln2_inv),
		.io_deq_bits_act(io_read_resp_bits_act),
		.io_count(_q_io_count)
	);
	assign io_read_req_ready = io_read_req_ready_0;
	assign io_read_resp_valid = _q_io_deq_valid;
	assign io_write_ready = ~_io_write_ready_T_7;
	assign io_adder_valid = pipelined_writes_0_valid & pipelined_writes_0_bits_acc;
	assign io_adder_op1_0_0 = _mem_io_rdata_0_0;
	assign io_adder_op1_1_0 = _mem_io_rdata_1_0;
	assign io_adder_op1_2_0 = _mem_io_rdata_2_0;
	assign io_adder_op1_3_0 = _mem_io_rdata_3_0;
	assign io_adder_op1_4_0 = _mem_io_rdata_4_0;
	assign io_adder_op1_5_0 = _mem_io_rdata_5_0;
	assign io_adder_op1_6_0 = _mem_io_rdata_6_0;
	assign io_adder_op1_7_0 = _mem_io_rdata_7_0;
	assign io_adder_op1_8_0 = _mem_io_rdata_8_0;
	assign io_adder_op1_9_0 = _mem_io_rdata_9_0;
	assign io_adder_op1_10_0 = _mem_io_rdata_10_0;
	assign io_adder_op1_11_0 = _mem_io_rdata_11_0;
	assign io_adder_op1_12_0 = _mem_io_rdata_12_0;
	assign io_adder_op1_13_0 = _mem_io_rdata_13_0;
	assign io_adder_op1_14_0 = _mem_io_rdata_14_0;
	assign io_adder_op1_15_0 = _mem_io_rdata_15_0;
	assign io_adder_op2_0_0 = pipelined_writes_0_bits_data_0_0;
	assign io_adder_op2_1_0 = pipelined_writes_0_bits_data_1_0;
	assign io_adder_op2_2_0 = pipelined_writes_0_bits_data_2_0;
	assign io_adder_op2_3_0 = pipelined_writes_0_bits_data_3_0;
	assign io_adder_op2_4_0 = pipelined_writes_0_bits_data_4_0;
	assign io_adder_op2_5_0 = pipelined_writes_0_bits_data_5_0;
	assign io_adder_op2_6_0 = pipelined_writes_0_bits_data_6_0;
	assign io_adder_op2_7_0 = pipelined_writes_0_bits_data_7_0;
	assign io_adder_op2_8_0 = pipelined_writes_0_bits_data_8_0;
	assign io_adder_op2_9_0 = pipelined_writes_0_bits_data_9_0;
	assign io_adder_op2_10_0 = pipelined_writes_0_bits_data_10_0;
	assign io_adder_op2_11_0 = pipelined_writes_0_bits_data_11_0;
	assign io_adder_op2_12_0 = pipelined_writes_0_bits_data_12_0;
	assign io_adder_op2_13_0 = pipelined_writes_0_bits_data_13_0;
	assign io_adder_op2_14_0 = pipelined_writes_0_bits_data_14_0;
	assign io_adder_op2_15_0 = pipelined_writes_0_bits_data_15_0;
endmodule
