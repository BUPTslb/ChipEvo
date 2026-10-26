module ExecuteController (
	clock,
	reset,
	io_cmd_ready,
	io_cmd_valid,
	io_cmd_bits_cmd_inst_funct,
	io_cmd_bits_cmd_rs1,
	io_cmd_bits_cmd_rs2,
	io_cmd_bits_rob_id_bits,
	io_im2col_req_bits_addr_data,
	io_im2col_req_bits_ocol,
	io_im2col_req_bits_krow,
	io_im2col_req_bits_icol,
	io_im2col_req_bits_stride,
	io_im2col_req_bits_row_turn,
	io_im2col_req_bits_kdim2,
	io_im2col_req_bits_row_left,
	io_im2col_req_bits_start_inputting,
	io_im2col_resp_bits_a_im2col_0,
	io_im2col_resp_bits_a_im2col_1,
	io_im2col_resp_bits_a_im2col_2,
	io_im2col_resp_bits_a_im2col_3,
	io_im2col_resp_bits_a_im2col_4,
	io_im2col_resp_bits_a_im2col_5,
	io_im2col_resp_bits_a_im2col_6,
	io_im2col_resp_bits_a_im2col_7,
	io_im2col_resp_bits_a_im2col_8,
	io_im2col_resp_bits_a_im2col_9,
	io_im2col_resp_bits_a_im2col_10,
	io_im2col_resp_bits_a_im2col_11,
	io_im2col_resp_bits_a_im2col_12,
	io_im2col_resp_bits_a_im2col_13,
	io_im2col_resp_bits_a_im2col_14,
	io_im2col_resp_bits_a_im2col_15,
	io_srams_read_0_req_ready,
	io_srams_read_0_req_valid,
	io_srams_read_0_req_bits_addr,
	io_srams_read_0_resp_ready,
	io_srams_read_0_resp_valid,
	io_srams_read_0_resp_bits_data,
	io_srams_read_0_resp_bits_fromDMA,
	io_srams_read_1_req_ready,
	io_srams_read_1_req_valid,
	io_srams_read_1_req_bits_addr,
	io_srams_read_1_resp_ready,
	io_srams_read_1_resp_valid,
	io_srams_read_1_resp_bits_data,
	io_srams_read_1_resp_bits_fromDMA,
	io_srams_read_2_req_ready,
	io_srams_read_2_req_valid,
	io_srams_read_2_req_bits_addr,
	io_srams_read_2_resp_ready,
	io_srams_read_2_resp_valid,
	io_srams_read_2_resp_bits_data,
	io_srams_read_2_resp_bits_fromDMA,
	io_srams_read_3_req_ready,
	io_srams_read_3_req_valid,
	io_srams_read_3_req_bits_addr,
	io_srams_read_3_resp_ready,
	io_srams_read_3_resp_valid,
	io_srams_read_3_resp_bits_data,
	io_srams_read_3_resp_bits_fromDMA,
	io_srams_write_0_valid,
	io_srams_write_0_addr,
	io_srams_write_0_mask_0,
	io_srams_write_0_mask_1,
	io_srams_write_0_mask_2,
	io_srams_write_0_mask_3,
	io_srams_write_0_mask_4,
	io_srams_write_0_mask_5,
	io_srams_write_0_mask_6,
	io_srams_write_0_mask_7,
	io_srams_write_0_mask_8,
	io_srams_write_0_mask_9,
	io_srams_write_0_mask_10,
	io_srams_write_0_mask_11,
	io_srams_write_0_mask_12,
	io_srams_write_0_mask_13,
	io_srams_write_0_mask_14,
	io_srams_write_0_mask_15,
	io_srams_write_0_data,
	io_srams_write_1_valid,
	io_srams_write_1_addr,
	io_srams_write_1_mask_0,
	io_srams_write_1_mask_1,
	io_srams_write_1_mask_2,
	io_srams_write_1_mask_3,
	io_srams_write_1_mask_4,
	io_srams_write_1_mask_5,
	io_srams_write_1_mask_6,
	io_srams_write_1_mask_7,
	io_srams_write_1_mask_8,
	io_srams_write_1_mask_9,
	io_srams_write_1_mask_10,
	io_srams_write_1_mask_11,
	io_srams_write_1_mask_12,
	io_srams_write_1_mask_13,
	io_srams_write_1_mask_14,
	io_srams_write_1_mask_15,
	io_srams_write_1_data,
	io_srams_write_2_valid,
	io_srams_write_2_addr,
	io_srams_write_2_mask_0,
	io_srams_write_2_mask_1,
	io_srams_write_2_mask_2,
	io_srams_write_2_mask_3,
	io_srams_write_2_mask_4,
	io_srams_write_2_mask_5,
	io_srams_write_2_mask_6,
	io_srams_write_2_mask_7,
	io_srams_write_2_mask_8,
	io_srams_write_2_mask_9,
	io_srams_write_2_mask_10,
	io_srams_write_2_mask_11,
	io_srams_write_2_mask_12,
	io_srams_write_2_mask_13,
	io_srams_write_2_mask_14,
	io_srams_write_2_mask_15,
	io_srams_write_2_data,
	io_srams_write_3_valid,
	io_srams_write_3_addr,
	io_srams_write_3_mask_0,
	io_srams_write_3_mask_1,
	io_srams_write_3_mask_2,
	io_srams_write_3_mask_3,
	io_srams_write_3_mask_4,
	io_srams_write_3_mask_5,
	io_srams_write_3_mask_6,
	io_srams_write_3_mask_7,
	io_srams_write_3_mask_8,
	io_srams_write_3_mask_9,
	io_srams_write_3_mask_10,
	io_srams_write_3_mask_11,
	io_srams_write_3_mask_12,
	io_srams_write_3_mask_13,
	io_srams_write_3_mask_14,
	io_srams_write_3_mask_15,
	io_srams_write_3_data,
	io_acc_read_req_0_ready,
	io_acc_read_req_0_valid,
	io_acc_read_req_0_bits_scale_bits,
	io_acc_read_req_0_bits_addr,
	io_acc_read_req_0_bits_act,
	io_acc_read_req_1_ready,
	io_acc_read_req_1_valid,
	io_acc_read_req_1_bits_scale_bits,
	io_acc_read_req_1_bits_addr,
	io_acc_read_req_1_bits_act,
	io_acc_read_resp_0_ready,
	io_acc_read_resp_0_valid,
	io_acc_read_resp_0_bits_data_0_0,
	io_acc_read_resp_0_bits_data_1_0,
	io_acc_read_resp_0_bits_data_2_0,
	io_acc_read_resp_0_bits_data_3_0,
	io_acc_read_resp_0_bits_data_4_0,
	io_acc_read_resp_0_bits_data_5_0,
	io_acc_read_resp_0_bits_data_6_0,
	io_acc_read_resp_0_bits_data_7_0,
	io_acc_read_resp_0_bits_data_8_0,
	io_acc_read_resp_0_bits_data_9_0,
	io_acc_read_resp_0_bits_data_10_0,
	io_acc_read_resp_0_bits_data_11_0,
	io_acc_read_resp_0_bits_data_12_0,
	io_acc_read_resp_0_bits_data_13_0,
	io_acc_read_resp_0_bits_data_14_0,
	io_acc_read_resp_0_bits_data_15_0,
	io_acc_read_resp_0_bits_fromDMA,
	io_acc_read_resp_1_ready,
	io_acc_read_resp_1_valid,
	io_acc_read_resp_1_bits_data_0_0,
	io_acc_read_resp_1_bits_data_1_0,
	io_acc_read_resp_1_bits_data_2_0,
	io_acc_read_resp_1_bits_data_3_0,
	io_acc_read_resp_1_bits_data_4_0,
	io_acc_read_resp_1_bits_data_5_0,
	io_acc_read_resp_1_bits_data_6_0,
	io_acc_read_resp_1_bits_data_7_0,
	io_acc_read_resp_1_bits_data_8_0,
	io_acc_read_resp_1_bits_data_9_0,
	io_acc_read_resp_1_bits_data_10_0,
	io_acc_read_resp_1_bits_data_11_0,
	io_acc_read_resp_1_bits_data_12_0,
	io_acc_read_resp_1_bits_data_13_0,
	io_acc_read_resp_1_bits_data_14_0,
	io_acc_read_resp_1_bits_data_15_0,
	io_acc_read_resp_1_bits_fromDMA,
	io_acc_write_0_valid,
	io_acc_write_0_bits_addr,
	io_acc_write_0_bits_data_0_0,
	io_acc_write_0_bits_data_1_0,
	io_acc_write_0_bits_data_2_0,
	io_acc_write_0_bits_data_3_0,
	io_acc_write_0_bits_data_4_0,
	io_acc_write_0_bits_data_5_0,
	io_acc_write_0_bits_data_6_0,
	io_acc_write_0_bits_data_7_0,
	io_acc_write_0_bits_data_8_0,
	io_acc_write_0_bits_data_9_0,
	io_acc_write_0_bits_data_10_0,
	io_acc_write_0_bits_data_11_0,
	io_acc_write_0_bits_data_12_0,
	io_acc_write_0_bits_data_13_0,
	io_acc_write_0_bits_data_14_0,
	io_acc_write_0_bits_data_15_0,
	io_acc_write_0_bits_acc,
	io_acc_write_0_bits_mask_0,
	io_acc_write_0_bits_mask_1,
	io_acc_write_0_bits_mask_2,
	io_acc_write_0_bits_mask_3,
	io_acc_write_0_bits_mask_4,
	io_acc_write_0_bits_mask_5,
	io_acc_write_0_bits_mask_6,
	io_acc_write_0_bits_mask_7,
	io_acc_write_0_bits_mask_8,
	io_acc_write_0_bits_mask_9,
	io_acc_write_0_bits_mask_10,
	io_acc_write_0_bits_mask_11,
	io_acc_write_0_bits_mask_12,
	io_acc_write_0_bits_mask_13,
	io_acc_write_0_bits_mask_14,
	io_acc_write_0_bits_mask_15,
	io_acc_write_0_bits_mask_16,
	io_acc_write_0_bits_mask_17,
	io_acc_write_0_bits_mask_18,
	io_acc_write_0_bits_mask_19,
	io_acc_write_0_bits_mask_20,
	io_acc_write_0_bits_mask_21,
	io_acc_write_0_bits_mask_22,
	io_acc_write_0_bits_mask_23,
	io_acc_write_0_bits_mask_24,
	io_acc_write_0_bits_mask_25,
	io_acc_write_0_bits_mask_26,
	io_acc_write_0_bits_mask_27,
	io_acc_write_0_bits_mask_28,
	io_acc_write_0_bits_mask_29,
	io_acc_write_0_bits_mask_30,
	io_acc_write_0_bits_mask_31,
	io_acc_write_0_bits_mask_32,
	io_acc_write_0_bits_mask_33,
	io_acc_write_0_bits_mask_34,
	io_acc_write_0_bits_mask_35,
	io_acc_write_0_bits_mask_36,
	io_acc_write_0_bits_mask_37,
	io_acc_write_0_bits_mask_38,
	io_acc_write_0_bits_mask_39,
	io_acc_write_0_bits_mask_40,
	io_acc_write_0_bits_mask_41,
	io_acc_write_0_bits_mask_42,
	io_acc_write_0_bits_mask_43,
	io_acc_write_0_bits_mask_44,
	io_acc_write_0_bits_mask_45,
	io_acc_write_0_bits_mask_46,
	io_acc_write_0_bits_mask_47,
	io_acc_write_0_bits_mask_48,
	io_acc_write_0_bits_mask_49,
	io_acc_write_0_bits_mask_50,
	io_acc_write_0_bits_mask_51,
	io_acc_write_0_bits_mask_52,
	io_acc_write_0_bits_mask_53,
	io_acc_write_0_bits_mask_54,
	io_acc_write_0_bits_mask_55,
	io_acc_write_0_bits_mask_56,
	io_acc_write_0_bits_mask_57,
	io_acc_write_0_bits_mask_58,
	io_acc_write_0_bits_mask_59,
	io_acc_write_0_bits_mask_60,
	io_acc_write_0_bits_mask_61,
	io_acc_write_0_bits_mask_62,
	io_acc_write_0_bits_mask_63,
	io_acc_write_1_valid,
	io_acc_write_1_bits_addr,
	io_acc_write_1_bits_data_0_0,
	io_acc_write_1_bits_data_1_0,
	io_acc_write_1_bits_data_2_0,
	io_acc_write_1_bits_data_3_0,
	io_acc_write_1_bits_data_4_0,
	io_acc_write_1_bits_data_5_0,
	io_acc_write_1_bits_data_6_0,
	io_acc_write_1_bits_data_7_0,
	io_acc_write_1_bits_data_8_0,
	io_acc_write_1_bits_data_9_0,
	io_acc_write_1_bits_data_10_0,
	io_acc_write_1_bits_data_11_0,
	io_acc_write_1_bits_data_12_0,
	io_acc_write_1_bits_data_13_0,
	io_acc_write_1_bits_data_14_0,
	io_acc_write_1_bits_data_15_0,
	io_acc_write_1_bits_acc,
	io_acc_write_1_bits_mask_0,
	io_acc_write_1_bits_mask_1,
	io_acc_write_1_bits_mask_2,
	io_acc_write_1_bits_mask_3,
	io_acc_write_1_bits_mask_4,
	io_acc_write_1_bits_mask_5,
	io_acc_write_1_bits_mask_6,
	io_acc_write_1_bits_mask_7,
	io_acc_write_1_bits_mask_8,
	io_acc_write_1_bits_mask_9,
	io_acc_write_1_bits_mask_10,
	io_acc_write_1_bits_mask_11,
	io_acc_write_1_bits_mask_12,
	io_acc_write_1_bits_mask_13,
	io_acc_write_1_bits_mask_14,
	io_acc_write_1_bits_mask_15,
	io_acc_write_1_bits_mask_16,
	io_acc_write_1_bits_mask_17,
	io_acc_write_1_bits_mask_18,
	io_acc_write_1_bits_mask_19,
	io_acc_write_1_bits_mask_20,
	io_acc_write_1_bits_mask_21,
	io_acc_write_1_bits_mask_22,
	io_acc_write_1_bits_mask_23,
	io_acc_write_1_bits_mask_24,
	io_acc_write_1_bits_mask_25,
	io_acc_write_1_bits_mask_26,
	io_acc_write_1_bits_mask_27,
	io_acc_write_1_bits_mask_28,
	io_acc_write_1_bits_mask_29,
	io_acc_write_1_bits_mask_30,
	io_acc_write_1_bits_mask_31,
	io_acc_write_1_bits_mask_32,
	io_acc_write_1_bits_mask_33,
	io_acc_write_1_bits_mask_34,
	io_acc_write_1_bits_mask_35,
	io_acc_write_1_bits_mask_36,
	io_acc_write_1_bits_mask_37,
	io_acc_write_1_bits_mask_38,
	io_acc_write_1_bits_mask_39,
	io_acc_write_1_bits_mask_40,
	io_acc_write_1_bits_mask_41,
	io_acc_write_1_bits_mask_42,
	io_acc_write_1_bits_mask_43,
	io_acc_write_1_bits_mask_44,
	io_acc_write_1_bits_mask_45,
	io_acc_write_1_bits_mask_46,
	io_acc_write_1_bits_mask_47,
	io_acc_write_1_bits_mask_48,
	io_acc_write_1_bits_mask_49,
	io_acc_write_1_bits_mask_50,
	io_acc_write_1_bits_mask_51,
	io_acc_write_1_bits_mask_52,
	io_acc_write_1_bits_mask_53,
	io_acc_write_1_bits_mask_54,
	io_acc_write_1_bits_mask_55,
	io_acc_write_1_bits_mask_56,
	io_acc_write_1_bits_mask_57,
	io_acc_write_1_bits_mask_58,
	io_acc_write_1_bits_mask_59,
	io_acc_write_1_bits_mask_60,
	io_acc_write_1_bits_mask_61,
	io_acc_write_1_bits_mask_62,
	io_acc_write_1_bits_mask_63,
	io_completed_valid,
	io_completed_bits,
	io_busy,
	io_counter_event_signal_24,
	io_counter_event_signal_25,
	io_counter_event_signal_26,
	io_counter_event_signal_27,
	io_counter_event_signal_28,
	io_counter_event_signal_29,
	io_counter_event_signal_30,
	io_counter_event_signal_31,
	io_counter_event_signal_32,
	io_counter_event_signal_33,
	io_counter_event_signal_34,
	io_counter_event_signal_35,
	io_counter_event_signal_36,
	io_counter_event_signal_37
);
	input clock;
	input reset;
	output wire io_cmd_ready;
	input io_cmd_valid;
	input [6:0] io_cmd_bits_cmd_inst_funct;
	input [63:0] io_cmd_bits_cmd_rs1;
	input [63:0] io_cmd_bits_cmd_rs2;
	input [5:0] io_cmd_bits_rob_id_bits;
	output wire [13:0] io_im2col_req_bits_addr_data;
	output wire [7:0] io_im2col_req_bits_ocol;
	output wire [3:0] io_im2col_req_bits_krow;
	output wire [8:0] io_im2col_req_bits_icol;
	output wire [2:0] io_im2col_req_bits_stride;
	output wire [10:0] io_im2col_req_bits_row_turn;
	output wire [7:0] io_im2col_req_bits_kdim2;
	output wire [3:0] io_im2col_req_bits_row_left;
	output wire io_im2col_req_bits_start_inputting;
	input [7:0] io_im2col_resp_bits_a_im2col_0;
	input [7:0] io_im2col_resp_bits_a_im2col_1;
	input [7:0] io_im2col_resp_bits_a_im2col_2;
	input [7:0] io_im2col_resp_bits_a_im2col_3;
	input [7:0] io_im2col_resp_bits_a_im2col_4;
	input [7:0] io_im2col_resp_bits_a_im2col_5;
	input [7:0] io_im2col_resp_bits_a_im2col_6;
	input [7:0] io_im2col_resp_bits_a_im2col_7;
	input [7:0] io_im2col_resp_bits_a_im2col_8;
	input [7:0] io_im2col_resp_bits_a_im2col_9;
	input [7:0] io_im2col_resp_bits_a_im2col_10;
	input [7:0] io_im2col_resp_bits_a_im2col_11;
	input [7:0] io_im2col_resp_bits_a_im2col_12;
	input [7:0] io_im2col_resp_bits_a_im2col_13;
	input [7:0] io_im2col_resp_bits_a_im2col_14;
	input [7:0] io_im2col_resp_bits_a_im2col_15;
	input io_srams_read_0_req_ready;
	output wire io_srams_read_0_req_valid;
	output wire [11:0] io_srams_read_0_req_bits_addr;
	output wire io_srams_read_0_resp_ready;
	input io_srams_read_0_resp_valid;
	input [127:0] io_srams_read_0_resp_bits_data;
	input io_srams_read_0_resp_bits_fromDMA;
	input io_srams_read_1_req_ready;
	output wire io_srams_read_1_req_valid;
	output wire [11:0] io_srams_read_1_req_bits_addr;
	output wire io_srams_read_1_resp_ready;
	input io_srams_read_1_resp_valid;
	input [127:0] io_srams_read_1_resp_bits_data;
	input io_srams_read_1_resp_bits_fromDMA;
	input io_srams_read_2_req_ready;
	output wire io_srams_read_2_req_valid;
	output wire [11:0] io_srams_read_2_req_bits_addr;
	output wire io_srams_read_2_resp_ready;
	input io_srams_read_2_resp_valid;
	input [127:0] io_srams_read_2_resp_bits_data;
	input io_srams_read_2_resp_bits_fromDMA;
	input io_srams_read_3_req_ready;
	output wire io_srams_read_3_req_valid;
	output wire [11:0] io_srams_read_3_req_bits_addr;
	output wire io_srams_read_3_resp_ready;
	input io_srams_read_3_resp_valid;
	input [127:0] io_srams_read_3_resp_bits_data;
	input io_srams_read_3_resp_bits_fromDMA;
	output wire io_srams_write_0_valid;
	output wire [11:0] io_srams_write_0_addr;
	output wire io_srams_write_0_mask_0;
	output wire io_srams_write_0_mask_1;
	output wire io_srams_write_0_mask_2;
	output wire io_srams_write_0_mask_3;
	output wire io_srams_write_0_mask_4;
	output wire io_srams_write_0_mask_5;
	output wire io_srams_write_0_mask_6;
	output wire io_srams_write_0_mask_7;
	output wire io_srams_write_0_mask_8;
	output wire io_srams_write_0_mask_9;
	output wire io_srams_write_0_mask_10;
	output wire io_srams_write_0_mask_11;
	output wire io_srams_write_0_mask_12;
	output wire io_srams_write_0_mask_13;
	output wire io_srams_write_0_mask_14;
	output wire io_srams_write_0_mask_15;
	output wire [127:0] io_srams_write_0_data;
	output wire io_srams_write_1_valid;
	output wire [11:0] io_srams_write_1_addr;
	output wire io_srams_write_1_mask_0;
	output wire io_srams_write_1_mask_1;
	output wire io_srams_write_1_mask_2;
	output wire io_srams_write_1_mask_3;
	output wire io_srams_write_1_mask_4;
	output wire io_srams_write_1_mask_5;
	output wire io_srams_write_1_mask_6;
	output wire io_srams_write_1_mask_7;
	output wire io_srams_write_1_mask_8;
	output wire io_srams_write_1_mask_9;
	output wire io_srams_write_1_mask_10;
	output wire io_srams_write_1_mask_11;
	output wire io_srams_write_1_mask_12;
	output wire io_srams_write_1_mask_13;
	output wire io_srams_write_1_mask_14;
	output wire io_srams_write_1_mask_15;
	output wire [127:0] io_srams_write_1_data;
	output wire io_srams_write_2_valid;
	output wire [11:0] io_srams_write_2_addr;
	output wire io_srams_write_2_mask_0;
	output wire io_srams_write_2_mask_1;
	output wire io_srams_write_2_mask_2;
	output wire io_srams_write_2_mask_3;
	output wire io_srams_write_2_mask_4;
	output wire io_srams_write_2_mask_5;
	output wire io_srams_write_2_mask_6;
	output wire io_srams_write_2_mask_7;
	output wire io_srams_write_2_mask_8;
	output wire io_srams_write_2_mask_9;
	output wire io_srams_write_2_mask_10;
	output wire io_srams_write_2_mask_11;
	output wire io_srams_write_2_mask_12;
	output wire io_srams_write_2_mask_13;
	output wire io_srams_write_2_mask_14;
	output wire io_srams_write_2_mask_15;
	output wire [127:0] io_srams_write_2_data;
	output wire io_srams_write_3_valid;
	output wire [11:0] io_srams_write_3_addr;
	output wire io_srams_write_3_mask_0;
	output wire io_srams_write_3_mask_1;
	output wire io_srams_write_3_mask_2;
	output wire io_srams_write_3_mask_3;
	output wire io_srams_write_3_mask_4;
	output wire io_srams_write_3_mask_5;
	output wire io_srams_write_3_mask_6;
	output wire io_srams_write_3_mask_7;
	output wire io_srams_write_3_mask_8;
	output wire io_srams_write_3_mask_9;
	output wire io_srams_write_3_mask_10;
	output wire io_srams_write_3_mask_11;
	output wire io_srams_write_3_mask_12;
	output wire io_srams_write_3_mask_13;
	output wire io_srams_write_3_mask_14;
	output wire io_srams_write_3_mask_15;
	output wire [127:0] io_srams_write_3_data;
	input io_acc_read_req_0_ready;
	output wire io_acc_read_req_0_valid;
	output wire [31:0] io_acc_read_req_0_bits_scale_bits;
	output wire [8:0] io_acc_read_req_0_bits_addr;
	output wire [2:0] io_acc_read_req_0_bits_act;
	input io_acc_read_req_1_ready;
	output wire io_acc_read_req_1_valid;
	output wire [31:0] io_acc_read_req_1_bits_scale_bits;
	output wire [8:0] io_acc_read_req_1_bits_addr;
	output wire [2:0] io_acc_read_req_1_bits_act;
	output wire io_acc_read_resp_0_ready;
	input io_acc_read_resp_0_valid;
	input [31:0] io_acc_read_resp_0_bits_data_0_0;
	input [31:0] io_acc_read_resp_0_bits_data_1_0;
	input [31:0] io_acc_read_resp_0_bits_data_2_0;
	input [31:0] io_acc_read_resp_0_bits_data_3_0;
	input [31:0] io_acc_read_resp_0_bits_data_4_0;
	input [31:0] io_acc_read_resp_0_bits_data_5_0;
	input [31:0] io_acc_read_resp_0_bits_data_6_0;
	input [31:0] io_acc_read_resp_0_bits_data_7_0;
	input [31:0] io_acc_read_resp_0_bits_data_8_0;
	input [31:0] io_acc_read_resp_0_bits_data_9_0;
	input [31:0] io_acc_read_resp_0_bits_data_10_0;
	input [31:0] io_acc_read_resp_0_bits_data_11_0;
	input [31:0] io_acc_read_resp_0_bits_data_12_0;
	input [31:0] io_acc_read_resp_0_bits_data_13_0;
	input [31:0] io_acc_read_resp_0_bits_data_14_0;
	input [31:0] io_acc_read_resp_0_bits_data_15_0;
	input io_acc_read_resp_0_bits_fromDMA;
	output wire io_acc_read_resp_1_ready;
	input io_acc_read_resp_1_valid;
	input [31:0] io_acc_read_resp_1_bits_data_0_0;
	input [31:0] io_acc_read_resp_1_bits_data_1_0;
	input [31:0] io_acc_read_resp_1_bits_data_2_0;
	input [31:0] io_acc_read_resp_1_bits_data_3_0;
	input [31:0] io_acc_read_resp_1_bits_data_4_0;
	input [31:0] io_acc_read_resp_1_bits_data_5_0;
	input [31:0] io_acc_read_resp_1_bits_data_6_0;
	input [31:0] io_acc_read_resp_1_bits_data_7_0;
	input [31:0] io_acc_read_resp_1_bits_data_8_0;
	input [31:0] io_acc_read_resp_1_bits_data_9_0;
	input [31:0] io_acc_read_resp_1_bits_data_10_0;
	input [31:0] io_acc_read_resp_1_bits_data_11_0;
	input [31:0] io_acc_read_resp_1_bits_data_12_0;
	input [31:0] io_acc_read_resp_1_bits_data_13_0;
	input [31:0] io_acc_read_resp_1_bits_data_14_0;
	input [31:0] io_acc_read_resp_1_bits_data_15_0;
	input io_acc_read_resp_1_bits_fromDMA;
	output wire io_acc_write_0_valid;
	output wire [8:0] io_acc_write_0_bits_addr;
	output wire [31:0] io_acc_write_0_bits_data_0_0;
	output wire [31:0] io_acc_write_0_bits_data_1_0;
	output wire [31:0] io_acc_write_0_bits_data_2_0;
	output wire [31:0] io_acc_write_0_bits_data_3_0;
	output wire [31:0] io_acc_write_0_bits_data_4_0;
	output wire [31:0] io_acc_write_0_bits_data_5_0;
	output wire [31:0] io_acc_write_0_bits_data_6_0;
	output wire [31:0] io_acc_write_0_bits_data_7_0;
	output wire [31:0] io_acc_write_0_bits_data_8_0;
	output wire [31:0] io_acc_write_0_bits_data_9_0;
	output wire [31:0] io_acc_write_0_bits_data_10_0;
	output wire [31:0] io_acc_write_0_bits_data_11_0;
	output wire [31:0] io_acc_write_0_bits_data_12_0;
	output wire [31:0] io_acc_write_0_bits_data_13_0;
	output wire [31:0] io_acc_write_0_bits_data_14_0;
	output wire [31:0] io_acc_write_0_bits_data_15_0;
	output wire io_acc_write_0_bits_acc;
	output wire io_acc_write_0_bits_mask_0;
	output wire io_acc_write_0_bits_mask_1;
	output wire io_acc_write_0_bits_mask_2;
	output wire io_acc_write_0_bits_mask_3;
	output wire io_acc_write_0_bits_mask_4;
	output wire io_acc_write_0_bits_mask_5;
	output wire io_acc_write_0_bits_mask_6;
	output wire io_acc_write_0_bits_mask_7;
	output wire io_acc_write_0_bits_mask_8;
	output wire io_acc_write_0_bits_mask_9;
	output wire io_acc_write_0_bits_mask_10;
	output wire io_acc_write_0_bits_mask_11;
	output wire io_acc_write_0_bits_mask_12;
	output wire io_acc_write_0_bits_mask_13;
	output wire io_acc_write_0_bits_mask_14;
	output wire io_acc_write_0_bits_mask_15;
	output wire io_acc_write_0_bits_mask_16;
	output wire io_acc_write_0_bits_mask_17;
	output wire io_acc_write_0_bits_mask_18;
	output wire io_acc_write_0_bits_mask_19;
	output wire io_acc_write_0_bits_mask_20;
	output wire io_acc_write_0_bits_mask_21;
	output wire io_acc_write_0_bits_mask_22;
	output wire io_acc_write_0_bits_mask_23;
	output wire io_acc_write_0_bits_mask_24;
	output wire io_acc_write_0_bits_mask_25;
	output wire io_acc_write_0_bits_mask_26;
	output wire io_acc_write_0_bits_mask_27;
	output wire io_acc_write_0_bits_mask_28;
	output wire io_acc_write_0_bits_mask_29;
	output wire io_acc_write_0_bits_mask_30;
	output wire io_acc_write_0_bits_mask_31;
	output wire io_acc_write_0_bits_mask_32;
	output wire io_acc_write_0_bits_mask_33;
	output wire io_acc_write_0_bits_mask_34;
	output wire io_acc_write_0_bits_mask_35;
	output wire io_acc_write_0_bits_mask_36;
	output wire io_acc_write_0_bits_mask_37;
	output wire io_acc_write_0_bits_mask_38;
	output wire io_acc_write_0_bits_mask_39;
	output wire io_acc_write_0_bits_mask_40;
	output wire io_acc_write_0_bits_mask_41;
	output wire io_acc_write_0_bits_mask_42;
	output wire io_acc_write_0_bits_mask_43;
	output wire io_acc_write_0_bits_mask_44;
	output wire io_acc_write_0_bits_mask_45;
	output wire io_acc_write_0_bits_mask_46;
	output wire io_acc_write_0_bits_mask_47;
	output wire io_acc_write_0_bits_mask_48;
	output wire io_acc_write_0_bits_mask_49;
	output wire io_acc_write_0_bits_mask_50;
	output wire io_acc_write_0_bits_mask_51;
	output wire io_acc_write_0_bits_mask_52;
	output wire io_acc_write_0_bits_mask_53;
	output wire io_acc_write_0_bits_mask_54;
	output wire io_acc_write_0_bits_mask_55;
	output wire io_acc_write_0_bits_mask_56;
	output wire io_acc_write_0_bits_mask_57;
	output wire io_acc_write_0_bits_mask_58;
	output wire io_acc_write_0_bits_mask_59;
	output wire io_acc_write_0_bits_mask_60;
	output wire io_acc_write_0_bits_mask_61;
	output wire io_acc_write_0_bits_mask_62;
	output wire io_acc_write_0_bits_mask_63;
	output wire io_acc_write_1_valid;
	output wire [8:0] io_acc_write_1_bits_addr;
	output wire [31:0] io_acc_write_1_bits_data_0_0;
	output wire [31:0] io_acc_write_1_bits_data_1_0;
	output wire [31:0] io_acc_write_1_bits_data_2_0;
	output wire [31:0] io_acc_write_1_bits_data_3_0;
	output wire [31:0] io_acc_write_1_bits_data_4_0;
	output wire [31:0] io_acc_write_1_bits_data_5_0;
	output wire [31:0] io_acc_write_1_bits_data_6_0;
	output wire [31:0] io_acc_write_1_bits_data_7_0;
	output wire [31:0] io_acc_write_1_bits_data_8_0;
	output wire [31:0] io_acc_write_1_bits_data_9_0;
	output wire [31:0] io_acc_write_1_bits_data_10_0;
	output wire [31:0] io_acc_write_1_bits_data_11_0;
	output wire [31:0] io_acc_write_1_bits_data_12_0;
	output wire [31:0] io_acc_write_1_bits_data_13_0;
	output wire [31:0] io_acc_write_1_bits_data_14_0;
	output wire [31:0] io_acc_write_1_bits_data_15_0;
	output wire io_acc_write_1_bits_acc;
	output wire io_acc_write_1_bits_mask_0;
	output wire io_acc_write_1_bits_mask_1;
	output wire io_acc_write_1_bits_mask_2;
	output wire io_acc_write_1_bits_mask_3;
	output wire io_acc_write_1_bits_mask_4;
	output wire io_acc_write_1_bits_mask_5;
	output wire io_acc_write_1_bits_mask_6;
	output wire io_acc_write_1_bits_mask_7;
	output wire io_acc_write_1_bits_mask_8;
	output wire io_acc_write_1_bits_mask_9;
	output wire io_acc_write_1_bits_mask_10;
	output wire io_acc_write_1_bits_mask_11;
	output wire io_acc_write_1_bits_mask_12;
	output wire io_acc_write_1_bits_mask_13;
	output wire io_acc_write_1_bits_mask_14;
	output wire io_acc_write_1_bits_mask_15;
	output wire io_acc_write_1_bits_mask_16;
	output wire io_acc_write_1_bits_mask_17;
	output wire io_acc_write_1_bits_mask_18;
	output wire io_acc_write_1_bits_mask_19;
	output wire io_acc_write_1_bits_mask_20;
	output wire io_acc_write_1_bits_mask_21;
	output wire io_acc_write_1_bits_mask_22;
	output wire io_acc_write_1_bits_mask_23;
	output wire io_acc_write_1_bits_mask_24;
	output wire io_acc_write_1_bits_mask_25;
	output wire io_acc_write_1_bits_mask_26;
	output wire io_acc_write_1_bits_mask_27;
	output wire io_acc_write_1_bits_mask_28;
	output wire io_acc_write_1_bits_mask_29;
	output wire io_acc_write_1_bits_mask_30;
	output wire io_acc_write_1_bits_mask_31;
	output wire io_acc_write_1_bits_mask_32;
	output wire io_acc_write_1_bits_mask_33;
	output wire io_acc_write_1_bits_mask_34;
	output wire io_acc_write_1_bits_mask_35;
	output wire io_acc_write_1_bits_mask_36;
	output wire io_acc_write_1_bits_mask_37;
	output wire io_acc_write_1_bits_mask_38;
	output wire io_acc_write_1_bits_mask_39;
	output wire io_acc_write_1_bits_mask_40;
	output wire io_acc_write_1_bits_mask_41;
	output wire io_acc_write_1_bits_mask_42;
	output wire io_acc_write_1_bits_mask_43;
	output wire io_acc_write_1_bits_mask_44;
	output wire io_acc_write_1_bits_mask_45;
	output wire io_acc_write_1_bits_mask_46;
	output wire io_acc_write_1_bits_mask_47;
	output wire io_acc_write_1_bits_mask_48;
	output wire io_acc_write_1_bits_mask_49;
	output wire io_acc_write_1_bits_mask_50;
	output wire io_acc_write_1_bits_mask_51;
	output wire io_acc_write_1_bits_mask_52;
	output wire io_acc_write_1_bits_mask_53;
	output wire io_acc_write_1_bits_mask_54;
	output wire io_acc_write_1_bits_mask_55;
	output wire io_acc_write_1_bits_mask_56;
	output wire io_acc_write_1_bits_mask_57;
	output wire io_acc_write_1_bits_mask_58;
	output wire io_acc_write_1_bits_mask_59;
	output wire io_acc_write_1_bits_mask_60;
	output wire io_acc_write_1_bits_mask_61;
	output wire io_acc_write_1_bits_mask_62;
	output wire io_acc_write_1_bits_mask_63;
	output wire io_completed_valid;
	output wire [5:0] io_completed_bits;
	output wire io_busy;
	output wire io_counter_event_signal_24;
	output wire io_counter_event_signal_25;
	output wire io_counter_event_signal_26;
	output wire io_counter_event_signal_27;
	output wire io_counter_event_signal_28;
	output wire io_counter_event_signal_29;
	output wire io_counter_event_signal_30;
	output wire io_counter_event_signal_31;
	output wire io_counter_event_signal_32;
	output wire io_counter_event_signal_33;
	output wire io_counter_event_signal_34;
	output wire io_counter_event_signal_35;
	output wire io_counter_event_signal_36;
	output wire io_counter_event_signal_37;
	wire start_array_outputting;
	wire _GEN;
	wire _GEN_0;
	wire _GEN_1;
	wire start_inputting_b;
	wire start_inputting_a;
	wire start_inputting_d;
	wire _GEN_2;
	wire _GEN_3;
	wire _GEN_4;
	wire _GEN_5;
	wire _GEN_6;
	wire _GEN_7;
	wire _mesh_io_a_ready;
	wire _mesh_io_b_ready;
	wire _mesh_io_d_ready;
	wire _mesh_io_req_ready;
	wire _mesh_io_resp_valid;
	wire _mesh_io_resp_bits_tag_rob_id_valid;
	wire [5:0] _mesh_io_resp_bits_tag_rob_id_bits;
	wire _mesh_io_resp_bits_tag_addr_is_acc_addr;
	wire _mesh_io_resp_bits_tag_addr_accumulate;
	wire _mesh_io_resp_bits_tag_addr_read_full_acc_row;
	wire _mesh_io_resp_bits_tag_addr_garbage_bit;
	wire [13:0] _mesh_io_resp_bits_tag_addr_data;
	wire [4:0] _mesh_io_resp_bits_tag_rows;
	wire [4:0] _mesh_io_resp_bits_tag_cols;
	wire [19:0] _mesh_io_resp_bits_data_0_0;
	wire [19:0] _mesh_io_resp_bits_data_1_0;
	wire [19:0] _mesh_io_resp_bits_data_2_0;
	wire [19:0] _mesh_io_resp_bits_data_3_0;
	wire [19:0] _mesh_io_resp_bits_data_4_0;
	wire [19:0] _mesh_io_resp_bits_data_5_0;
	wire [19:0] _mesh_io_resp_bits_data_6_0;
	wire [19:0] _mesh_io_resp_bits_data_7_0;
	wire [19:0] _mesh_io_resp_bits_data_8_0;
	wire [19:0] _mesh_io_resp_bits_data_9_0;
	wire [19:0] _mesh_io_resp_bits_data_10_0;
	wire [19:0] _mesh_io_resp_bits_data_11_0;
	wire [19:0] _mesh_io_resp_bits_data_12_0;
	wire [19:0] _mesh_io_resp_bits_data_13_0;
	wire [19:0] _mesh_io_resp_bits_data_14_0;
	wire [19:0] _mesh_io_resp_bits_data_15_0;
	wire [4:0] _mesh_io_resp_bits_total_rows;
	wire _mesh_io_resp_bits_last;
	wire _mesh_io_tags_in_progress_0_rob_id_valid;
	wire _mesh_io_tags_in_progress_0_addr_is_acc_addr;
	wire _mesh_io_tags_in_progress_0_addr_accumulate;
	wire _mesh_io_tags_in_progress_0_addr_read_full_acc_row;
	wire _mesh_io_tags_in_progress_0_addr_garbage_bit;
	wire [13:0] _mesh_io_tags_in_progress_0_addr_data;
	wire _mesh_io_tags_in_progress_1_rob_id_valid;
	wire _mesh_io_tags_in_progress_1_addr_is_acc_addr;
	wire _mesh_io_tags_in_progress_1_addr_accumulate;
	wire _mesh_io_tags_in_progress_1_addr_read_full_acc_row;
	wire _mesh_io_tags_in_progress_1_addr_garbage_bit;
	wire [13:0] _mesh_io_tags_in_progress_1_addr_data;
	wire _mesh_io_tags_in_progress_2_rob_id_valid;
	wire _mesh_io_tags_in_progress_2_addr_is_acc_addr;
	wire _mesh_io_tags_in_progress_2_addr_accumulate;
	wire _mesh_io_tags_in_progress_2_addr_read_full_acc_row;
	wire _mesh_io_tags_in_progress_2_addr_garbage_bit;
	wire [13:0] _mesh_io_tags_in_progress_2_addr_data;
	wire _mesh_io_tags_in_progress_3_rob_id_valid;
	wire _mesh_io_tags_in_progress_3_addr_is_acc_addr;
	wire _mesh_io_tags_in_progress_3_addr_accumulate;
	wire _mesh_io_tags_in_progress_3_addr_read_full_acc_row;
	wire _mesh_io_tags_in_progress_3_addr_garbage_bit;
	wire [13:0] _mesh_io_tags_in_progress_3_addr_data;
	wire _mesh_io_tags_in_progress_4_rob_id_valid;
	wire _mesh_io_tags_in_progress_4_addr_is_acc_addr;
	wire _mesh_io_tags_in_progress_4_addr_accumulate;
	wire _mesh_io_tags_in_progress_4_addr_read_full_acc_row;
	wire _mesh_io_tags_in_progress_4_addr_garbage_bit;
	wire [13:0] _mesh_io_tags_in_progress_4_addr_data;
	wire _mesh_io_tags_in_progress_5_rob_id_valid;
	wire _mesh_io_tags_in_progress_5_addr_is_acc_addr;
	wire _mesh_io_tags_in_progress_5_addr_accumulate;
	wire _mesh_io_tags_in_progress_5_addr_read_full_acc_row;
	wire _mesh_io_tags_in_progress_5_addr_garbage_bit;
	wire [13:0] _mesh_io_tags_in_progress_5_addr_data;
	wire _mesh_cntl_signals_q_io_enq_ready;
	wire _mesh_cntl_signals_q_io_deq_valid;
	wire _mesh_cntl_signals_q_io_deq_bits_perform_single_mul;
	wire _mesh_cntl_signals_q_io_deq_bits_perform_single_preload;
	wire [1:0] _mesh_cntl_signals_q_io_deq_bits_a_bank;
	wire [1:0] _mesh_cntl_signals_q_io_deq_bits_b_bank;
	wire [1:0] _mesh_cntl_signals_q_io_deq_bits_d_bank;
	wire _mesh_cntl_signals_q_io_deq_bits_a_bank_acc;
	wire _mesh_cntl_signals_q_io_deq_bits_b_bank_acc;
	wire _mesh_cntl_signals_q_io_deq_bits_d_bank_acc;
	wire _mesh_cntl_signals_q_io_deq_bits_a_read_from_acc;
	wire _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc;
	wire _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc;
	wire _mesh_cntl_signals_q_io_deq_bits_a_garbage;
	wire _mesh_cntl_signals_q_io_deq_bits_b_garbage;
	wire _mesh_cntl_signals_q_io_deq_bits_d_garbage;
	wire _mesh_cntl_signals_q_io_deq_bits_accumulate_zeros;
	wire _mesh_cntl_signals_q_io_deq_bits_preload_zeros;
	wire _mesh_cntl_signals_q_io_deq_bits_a_fire;
	wire _mesh_cntl_signals_q_io_deq_bits_b_fire;
	wire _mesh_cntl_signals_q_io_deq_bits_d_fire;
	wire [4:0] _mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols;
	wire [4:0] _mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols;
	wire [4:0] _mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols;
	wire _mesh_cntl_signals_q_io_deq_bits_c_addr_is_acc_addr;
	wire _mesh_cntl_signals_q_io_deq_bits_c_addr_accumulate;
	wire _mesh_cntl_signals_q_io_deq_bits_c_addr_read_full_acc_row;
	wire _mesh_cntl_signals_q_io_deq_bits_c_addr_garbage_bit;
	wire [13:0] _mesh_cntl_signals_q_io_deq_bits_c_addr_data;
	wire [4:0] _mesh_cntl_signals_q_io_deq_bits_c_rows;
	wire [4:0] _mesh_cntl_signals_q_io_deq_bits_c_cols;
	wire _mesh_cntl_signals_q_io_deq_bits_a_transpose;
	wire _mesh_cntl_signals_q_io_deq_bits_bd_transpose;
	wire [4:0] _mesh_cntl_signals_q_io_deq_bits_total_rows;
	wire _mesh_cntl_signals_q_io_deq_bits_rob_id_valid;
	wire [5:0] _mesh_cntl_signals_q_io_deq_bits_rob_id_bits;
	wire _mesh_cntl_signals_q_io_deq_bits_dataflow;
	wire _mesh_cntl_signals_q_io_deq_bits_prop;
	wire [4:0] _mesh_cntl_signals_q_io_deq_bits_shift;
	wire _mesh_cntl_signals_q_io_deq_bits_im2colling;
	wire _mesh_cntl_signals_q_io_deq_bits_first;
	wire _cmd_q_io_enq_ready;
	wire _cmd_q_io_deq_valid_0;
	wire _cmd_q_io_deq_valid_1;
	wire _cmd_q_io_deq_valid_2;
	wire [6:0] _cmd_q_io_deq_bits_0_cmd_inst_funct;
	wire [63:0] _cmd_q_io_deq_bits_0_cmd_rs1;
	wire [63:0] _cmd_q_io_deq_bits_0_cmd_rs2;
	wire _cmd_q_io_deq_bits_0_rob_id_valid;
	wire [5:0] _cmd_q_io_deq_bits_0_rob_id_bits;
	wire [6:0] _cmd_q_io_deq_bits_1_cmd_inst_funct;
	wire [63:0] _cmd_q_io_deq_bits_1_cmd_rs1;
	wire [63:0] _cmd_q_io_deq_bits_1_cmd_rs2;
	wire _cmd_q_io_deq_bits_1_rob_id_valid;
	wire [5:0] _cmd_q_io_deq_bits_1_rob_id_bits;
	wire [63:0] _cmd_q_io_deq_bits_2_cmd_rs1;
	wire [63:0] _cmd_q_io_deq_bits_2_cmd_rs2;
	wire [5:0] _cmd_q_io_deq_bits_2_rob_id_bits;
	wire _unrolled_cmd_mod_io_out_valid;
	wire [6:0] _unrolled_cmd_mod_io_out_bits_cmd_inst_funct;
	wire [63:0] _unrolled_cmd_mod_io_out_bits_cmd_rs1;
	wire [63:0] _unrolled_cmd_mod_io_out_bits_cmd_rs2;
	wire _unrolled_cmd_mod_io_out_bits_rob_id_valid;
	wire [5:0] _unrolled_cmd_mod_io_out_bits_rob_id_bits;
	reg [1:0] control_state;
	reg current_dataflow;
	wire DoConfig = _cmd_q_io_deq_bits_0_cmd_inst_funct == 7'h00;
	wire in_prop = _cmd_q_io_deq_bits_0_cmd_inst_funct == 7'h04;
	wire DoComputes_0 = in_prop | (_cmd_q_io_deq_bits_0_cmd_inst_funct == 7'h05);
	wire DoPreloads_0 = _cmd_q_io_deq_bits_0_cmd_inst_funct == 7'h06;
	wire DoPreloads_1 = _cmd_q_io_deq_bits_1_cmd_inst_funct == 7'h06;
	reg in_prop_flush;
	reg [7:0] ocol;
	reg [3:0] krow;
	reg [2:0] weight_stride;
	reg [10:0] row_turn;
	reg [3:0] row_left;
	reg [7:0] kdim2;
	reg [4:0] in_shift;
	reg [31:0] acc_scale_bits;
	reg [2:0] activation;
	reg a_transpose;
	reg bd_transpose;
	reg config_initialized;
	wire a_should_be_fed_into_transposer = current_dataflow ^ ~a_transpose;
	wire b_should_be_fed_into_transposer = ~current_dataflow & bd_transpose;
	wire d_should_be_fed_into_transposer = current_dataflow & bd_transpose;
	wire [255:0] _GEN_8 = {{_cmd_q_io_deq_bits_0_cmd_rs1}, {_cmd_q_io_deq_bits_2_cmd_rs1}, {_cmd_q_io_deq_bits_1_cmd_rs1}, {_cmd_q_io_deq_bits_0_cmd_rs1}};
	wire [63:0] _GEN_9 = _GEN_8[(DoPreloads_0 ? 2'h1 : {a_should_be_fed_into_transposer, 1'h0}) * 64+:64];
	wire [255:0] _GEN_10 = {{_cmd_q_io_deq_bits_0_cmd_rs2}, {_cmd_q_io_deq_bits_2_cmd_rs2}, {_cmd_q_io_deq_bits_1_cmd_rs2}, {_cmd_q_io_deq_bits_0_cmd_rs2}};
	wire [63:0] _GEN_11 = _GEN_10[(DoPreloads_0 ? 2'h1 : {b_should_be_fed_into_transposer, 1'h0}) * 64+:64];
	wire [1:0] _GEN_12 = {1'h0, ~DoPreloads_0};
	wire _a_garbage_T = _GEN_9[31] & _GEN_9[30];
	wire multiply_garbage = ((_a_garbage_T & _GEN_9[29]) & &_GEN_9[13:0]) & _GEN_9[14];
	wire _b_garbage_T = _GEN_11[31] & _GEN_11[30];
	wire accumulate_zeros = ((_b_garbage_T & _GEN_11[29]) & &_GEN_11[13:0]) & _GEN_11[14];
	wire _d_garbage_T = _GEN_8[(_GEN_12 * 64) + 31] & _GEN_8[(_GEN_12 * 64) + 30];
	wire preload_zeros = ((_d_garbage_T & _GEN_8[(_GEN_12 * 64) + 29]) & &_GEN_8[(_GEN_12 * 64) + 13-:14]) & _GEN_8[(_GEN_12 * 64) + 14];
	wire [4:0] a_rows = (a_transpose ? _GEN_9[36:32] : _GEN_9[52:48]);
	wire [4:0] b_rows = (~current_dataflow & bd_transpose ? _GEN_11[36:32] : _GEN_11[52:48]);
	reg pending_completed_rob_ids_0_valid;
	reg [5:0] pending_completed_rob_ids_0_bits;
	reg pending_completed_rob_ids_1_valid;
	reg [5:0] pending_completed_rob_ids_1_bits;
	wire _mesh_io_req_bits_flush_T = control_state == 2'h2;
	wire _raw_hazard_mulpre_is_garbage_T = _mesh_io_tags_in_progress_0_addr_is_acc_addr & _mesh_io_tags_in_progress_0_addr_accumulate;
	wire _raw_hazard_mulpre_is_garbage_T_5 = _mesh_io_tags_in_progress_1_addr_is_acc_addr & _mesh_io_tags_in_progress_1_addr_accumulate;
	wire _raw_hazard_mulpre_is_garbage_T_10 = _mesh_io_tags_in_progress_2_addr_is_acc_addr & _mesh_io_tags_in_progress_2_addr_accumulate;
	wire _raw_hazard_mulpre_is_garbage_T_15 = _mesh_io_tags_in_progress_3_addr_is_acc_addr & _mesh_io_tags_in_progress_3_addr_accumulate;
	wire _raw_hazard_mulpre_is_garbage_T_20 = _mesh_io_tags_in_progress_4_addr_is_acc_addr & _mesh_io_tags_in_progress_4_addr_accumulate;
	wire _raw_hazard_mulpre_is_garbage_T_25 = _mesh_io_tags_in_progress_5_addr_is_acc_addr & _mesh_io_tags_in_progress_5_addr_accumulate;
	wire raw_hazard_pre = (((((~(((_raw_hazard_mulpre_is_garbage_T & _mesh_io_tags_in_progress_0_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_0_addr_data) & _mesh_io_tags_in_progress_0_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_0_addr_is_acc_addr == _cmd_q_io_deq_bits_0_cmd_rs1[31]) & (_mesh_io_tags_in_progress_0_addr_data == _cmd_q_io_deq_bits_0_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_0_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_0_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))) | ((_mesh_io_tags_in_progress_0_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs2[31]) & (_mesh_io_tags_in_progress_0_addr_data == _cmd_q_io_deq_bits_1_cmd_rs2[13:0])))) | (~(((_raw_hazard_mulpre_is_garbage_T_5 & _mesh_io_tags_in_progress_1_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_1_addr_data) & _mesh_io_tags_in_progress_1_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_1_addr_is_acc_addr == _cmd_q_io_deq_bits_0_cmd_rs1[31]) & (_mesh_io_tags_in_progress_1_addr_data == _cmd_q_io_deq_bits_0_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_1_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_1_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))) | ((_mesh_io_tags_in_progress_1_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs2[31]) & (_mesh_io_tags_in_progress_1_addr_data == _cmd_q_io_deq_bits_1_cmd_rs2[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_10 & _mesh_io_tags_in_progress_2_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_2_addr_data) & _mesh_io_tags_in_progress_2_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_2_addr_is_acc_addr == _cmd_q_io_deq_bits_0_cmd_rs1[31]) & (_mesh_io_tags_in_progress_2_addr_data == _cmd_q_io_deq_bits_0_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_2_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_2_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))) | ((_mesh_io_tags_in_progress_2_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs2[31]) & (_mesh_io_tags_in_progress_2_addr_data == _cmd_q_io_deq_bits_1_cmd_rs2[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_15 & _mesh_io_tags_in_progress_3_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_3_addr_data) & _mesh_io_tags_in_progress_3_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_3_addr_is_acc_addr == _cmd_q_io_deq_bits_0_cmd_rs1[31]) & (_mesh_io_tags_in_progress_3_addr_data == _cmd_q_io_deq_bits_0_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_3_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_3_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))) | ((_mesh_io_tags_in_progress_3_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs2[31]) & (_mesh_io_tags_in_progress_3_addr_data == _cmd_q_io_deq_bits_1_cmd_rs2[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_20 & _mesh_io_tags_in_progress_4_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_4_addr_data) & _mesh_io_tags_in_progress_4_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_4_addr_is_acc_addr == _cmd_q_io_deq_bits_0_cmd_rs1[31]) & (_mesh_io_tags_in_progress_4_addr_data == _cmd_q_io_deq_bits_0_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_4_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_4_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))) | ((_mesh_io_tags_in_progress_4_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs2[31]) & (_mesh_io_tags_in_progress_4_addr_data == _cmd_q_io_deq_bits_1_cmd_rs2[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_25 & _mesh_io_tags_in_progress_5_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_5_addr_data) & _mesh_io_tags_in_progress_5_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_5_addr_is_acc_addr == _cmd_q_io_deq_bits_0_cmd_rs1[31]) & (_mesh_io_tags_in_progress_5_addr_data == _cmd_q_io_deq_bits_0_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_5_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_5_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))) | ((_mesh_io_tags_in_progress_5_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs2[31]) & (_mesh_io_tags_in_progress_5_addr_data == _cmd_q_io_deq_bits_1_cmd_rs2[13:0]))));
	wire raw_hazard_mulpre = (((((~(((_raw_hazard_mulpre_is_garbage_T & _mesh_io_tags_in_progress_0_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_0_addr_data) & _mesh_io_tags_in_progress_0_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_0_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs1[31]) & (_mesh_io_tags_in_progress_0_addr_data == _cmd_q_io_deq_bits_2_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_0_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs2[31]) & (_mesh_io_tags_in_progress_0_addr_data == _cmd_q_io_deq_bits_2_cmd_rs2[13:0]))) | ((_mesh_io_tags_in_progress_0_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_0_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0])))) | (~(((_raw_hazard_mulpre_is_garbage_T_5 & _mesh_io_tags_in_progress_1_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_1_addr_data) & _mesh_io_tags_in_progress_1_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_1_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs1[31]) & (_mesh_io_tags_in_progress_1_addr_data == _cmd_q_io_deq_bits_2_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_1_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs2[31]) & (_mesh_io_tags_in_progress_1_addr_data == _cmd_q_io_deq_bits_2_cmd_rs2[13:0]))) | ((_mesh_io_tags_in_progress_1_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_1_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_10 & _mesh_io_tags_in_progress_2_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_2_addr_data) & _mesh_io_tags_in_progress_2_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_2_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs1[31]) & (_mesh_io_tags_in_progress_2_addr_data == _cmd_q_io_deq_bits_2_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_2_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs2[31]) & (_mesh_io_tags_in_progress_2_addr_data == _cmd_q_io_deq_bits_2_cmd_rs2[13:0]))) | ((_mesh_io_tags_in_progress_2_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_2_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_15 & _mesh_io_tags_in_progress_3_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_3_addr_data) & _mesh_io_tags_in_progress_3_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_3_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs1[31]) & (_mesh_io_tags_in_progress_3_addr_data == _cmd_q_io_deq_bits_2_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_3_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs2[31]) & (_mesh_io_tags_in_progress_3_addr_data == _cmd_q_io_deq_bits_2_cmd_rs2[13:0]))) | ((_mesh_io_tags_in_progress_3_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_3_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_20 & _mesh_io_tags_in_progress_4_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_4_addr_data) & _mesh_io_tags_in_progress_4_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_4_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs1[31]) & (_mesh_io_tags_in_progress_4_addr_data == _cmd_q_io_deq_bits_2_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_4_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs2[31]) & (_mesh_io_tags_in_progress_4_addr_data == _cmd_q_io_deq_bits_2_cmd_rs2[13:0]))) | ((_mesh_io_tags_in_progress_4_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_4_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))))) | (~(((_raw_hazard_mulpre_is_garbage_T_25 & _mesh_io_tags_in_progress_5_addr_read_full_acc_row) & &_mesh_io_tags_in_progress_5_addr_data) & _mesh_io_tags_in_progress_5_addr_garbage_bit) & ((((_mesh_io_tags_in_progress_5_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs1[31]) & (_mesh_io_tags_in_progress_5_addr_data == _cmd_q_io_deq_bits_2_cmd_rs1[13:0])) | ((_mesh_io_tags_in_progress_5_addr_is_acc_addr == _cmd_q_io_deq_bits_2_cmd_rs2[31]) & (_mesh_io_tags_in_progress_5_addr_data == _cmd_q_io_deq_bits_2_cmd_rs2[13:0]))) | ((_mesh_io_tags_in_progress_5_addr_is_acc_addr == _cmd_q_io_deq_bits_1_cmd_rs1[31]) & (_mesh_io_tags_in_progress_5_addr_data == _cmd_q_io_deq_bits_1_cmd_rs1[13:0]))));
	wire matmul_in_progress = ((((_mesh_io_tags_in_progress_0_rob_id_valid | _mesh_io_tags_in_progress_1_rob_id_valid) | _mesh_io_tags_in_progress_2_rob_id_valid) | _mesh_io_tags_in_progress_3_rob_id_valid) | _mesh_io_tags_in_progress_4_rob_id_valid) | _mesh_io_tags_in_progress_5_rob_id_valid;
	reg [3:0] a_fire_counter;
	reg [3:0] b_fire_counter;
	reg [3:0] d_fire_counter;
	reg a_fire_started;
	reg d_fire_started;
	reg b_fire_started;
	reg [19:0] a_addr_offset;
	reg [15:0] a_addr_stride;
	reg [15:0] c_addr_stride;
	wire [13:0] _a_address_result_data_T = _GEN_9[13:0] + a_addr_offset[13:0];
	wire [13:0] _b_address_result_data_T = _GEN_11[13:0] + {10'h000, b_fire_counter};
	wire [4:0] _GEN_13 = {1'h0, d_fire_counter};
	wire [13:0] _d_address_result_data_T = _GEN_8[(_GEN_12 * 64) + 13-:14] + {9'h000, 5'h0f - _GEN_13};
	wire a_garbage = (((_a_garbage_T & _GEN_9[29]) & &_GEN_9[13:0]) & _GEN_9[14]) | ~start_inputting_a;
	wire b_garbage = (((_b_garbage_T & _GEN_11[29]) & &_GEN_11[13:0]) & _GEN_11[14]) | ~start_inputting_b;
	wire d_garbage = (((_d_garbage_T & _GEN_8[(_GEN_12 * 64) + 29]) & &_GEN_8[(_GEN_12 * 64) + 13-:14]) & _GEN_8[(_GEN_12 * 64) + 14]) | ~start_inputting_d;
	reg perform_single_preload;
	reg perform_single_mul;
	reg perform_mul_pre;
	wire io_counter_event_signal_24_0 = control_state == 2'h1;
	wire [4:0] rows_a = (a_garbage ? 5'h01 : a_rows);
	wire [4:0] rows_b = (b_garbage ? 5'h01 : b_rows);
	wire [4:0] _total_rows_T_1 = (rows_a > rows_b ? rows_a : rows_b);
	wire [4:0] total_rows = ((((current_dataflow & d_garbage) & ~a_should_be_fed_into_transposer) & ~b_should_be_fed_into_transposer) & ~d_should_be_fed_into_transposer ? (_total_rows_T_1 > 5'h04 ? _total_rows_T_1 : 5'h04) : 5'h10);
	wire [4:0] _GEN_14 = {1'h0, a_fire_counter};
	wire a_row_is_not_all_zeros = _GEN_14 < a_rows;
	wire [4:0] _GEN_15 = {1'h0, b_fire_counter};
	wire b_row_is_not_all_zeros = _GEN_15 < b_rows;
	wire d_row_is_not_all_zeros = (5'h0f - _GEN_13) < (current_dataflow & bd_transpose ? _GEN_8[(_GEN_12 * 64) + 36-:5] : _GEN_8[(_GEN_12 * 64) + 52-:5]);
	wire _GEN_16 = ((_a_garbage_T & _GEN_9[29]) & &_GEN_9[13:0]) & _GEN_9[14];
	wire _GEN_17 = ((_b_garbage_T & _GEN_11[29]) & &_GEN_11[13:0]) & _GEN_11[14];
	wire _GEN_18 = ((_d_garbage_T & _GEN_8[(_GEN_12 * 64) + 29]) & &_GEN_8[(_GEN_12 * 64) + 13-:14]) & _GEN_8[(_GEN_12 * 64) + 14];
	wire [4:0] _about_to_fire_all_rows_T_13 = total_rows - 5'h01;
	wire [3:0] _b_fire_counter_T_6 = b_fire_counter + 4'h1;
	wire [4:0] _GEN_19 = {1'h0, _b_fire_counter_T_6};
	wire [3:0] _d_fire_counter_T_6 = d_fire_counter + 4'h1;
	wire [4:0] _GEN_20 = {1'h0, _d_fire_counter_T_6};
	wire _GEN_21 = (a_fire_started & (_GEN_14 == (_about_to_fire_all_rows_T_13 == 5'h00 ? 5'h00 : (_GEN_15 >= (total_rows - 5'h01) ? (5'h01 - (_about_to_fire_all_rows_T_13 - _GEN_15)) - 5'h01 : _GEN_19)))) | (a_fire_started & (_GEN_14 == (_about_to_fire_all_rows_T_13 == 5'h00 ? 5'h00 : (_GEN_13 >= (total_rows - 5'h01) ? (5'h01 - (_about_to_fire_all_rows_T_13 - _GEN_13)) - 5'h01 : _GEN_20))));
	wire [3:0] _a_fire_counter_T_6 = a_fire_counter + 4'h1;
	wire [4:0] _GEN_22 = {1'h0, _a_fire_counter_T_6};
	wire _GEN_23 = ((((~(((_GEN_17 | _GEN_16) | ~start_inputting_b) | ~start_inputting_a) & ((_GEN_11[31] & _GEN_9[31]) | ((~_GEN_11[31] & ~_GEN_9[31]) & (_b_address_result_data_T[13:12] == _a_address_result_data_T[13:12])))) & (b_fire_started == a_fire_started)) & (b_fire_counter == a_fire_counter)) | (b_fire_started & (_GEN_15 == (_about_to_fire_all_rows_T_13 == 5'h00 ? 5'h00 : (_GEN_14 >= (total_rows - 5'h01) ? (5'h01 - (_about_to_fire_all_rows_T_13 - _GEN_14)) - 5'h01 : _GEN_22))))) | (b_fire_started & (_GEN_15 == (_about_to_fire_all_rows_T_13 == 5'h00 ? 5'h00 : (_GEN_13 >= (total_rows - 5'h01) ? (5'h01 - (_about_to_fire_all_rows_T_13 - _GEN_13)) - 5'h01 : _GEN_20))));
	wire _GEN_24 = (((((~(((_GEN_18 | _GEN_16) | ~start_inputting_d) | ~start_inputting_a) & ((_GEN_8[(_GEN_12 * 64) + 31] & _GEN_9[31]) | ((~_GEN_8[(_GEN_12 * 64) + 31] & ~_GEN_9[31]) & (_d_address_result_data_T[13:12] == _a_address_result_data_T[13:12])))) & (d_fire_started == a_fire_started)) & (d_fire_counter == a_fire_counter)) | (d_fire_started & (_GEN_13 == (_about_to_fire_all_rows_T_13 == 5'h00 ? 5'h00 : (_GEN_14 >= (total_rows - 5'h01) ? (5'h01 - (_about_to_fire_all_rows_T_13 - _GEN_14)) - 5'h01 : _GEN_22))))) | (((~(((_GEN_18 | _GEN_17) | ~start_inputting_d) | ~start_inputting_b) & ((_GEN_8[(_GEN_12 * 64) + 31] & _GEN_11[31]) | ((~_GEN_8[(_GEN_12 * 64) + 31] & ~_GEN_11[31]) & (_d_address_result_data_T[13:12] == _b_address_result_data_T[13:12])))) & (d_fire_started == b_fire_started)) & (d_fire_counter == b_fire_counter))) | (d_fire_started & (_GEN_13 == (_about_to_fire_all_rows_T_13 == 5'h00 ? 5'h00 : (_GEN_15 >= (total_rows - 5'h01) ? (5'h01 - (_about_to_fire_all_rows_T_13 - _GEN_15)) - 5'h01 : _GEN_19))));
	wire a_fire = (~_GEN_21 & _GEN_4) & _GEN_7;
	wire b_fire = (~_GEN_23 & _GEN_3) & _GEN_6;
	wire d_fire = (~_GEN_24 & _GEN_2) & _GEN_5;
	wire about_to_fire_all_rows = ((((((_GEN_14 == _about_to_fire_all_rows_T_13) & a_fire) | (a_fire_counter == 4'h0)) & (((_GEN_15 == _about_to_fire_all_rows_T_13) & b_fire) | (b_fire_counter == 4'h0))) & (((_GEN_13 == _about_to_fire_all_rows_T_13) & d_fire) | (d_fire_counter == 4'h0))) & ((a_fire_started | b_fire_started) | d_fire_started)) & _mesh_cntl_signals_q_io_enq_ready;
	wire read_a = ((((~_GEN_21 & ~_GEN_9[31]) & (_a_address_result_data_T[13:12] == 2'h0)) & start_inputting_a) & ~multiply_garbage) & a_row_is_not_all_zeros;
	wire read_b = ((((~_GEN_23 & ~_GEN_11[31]) & (_b_address_result_data_T[13:12] == 2'h0)) & start_inputting_b) & ~accumulate_zeros) & b_row_is_not_all_zeros;
	wire read_d = ((((~_GEN_24 & ~_GEN_8[(_GEN_12 * 64) + 31]) & (_d_address_result_data_T[13:12] == 2'h0)) & start_inputting_d) & ~preload_zeros) & d_row_is_not_all_zeros;
	assign _GEN_7 = ~(read_a & ~io_srams_read_0_req_ready);
	assign _GEN_6 = ~(read_b & ~io_srams_read_0_req_ready);
	assign _GEN_5 = ~(read_d & ~io_srams_read_0_req_ready);
	wire read_a_1 = ((((~_GEN_21 & ~_GEN_9[31]) & (_a_address_result_data_T[13:12] == 2'h1)) & start_inputting_a) & ~multiply_garbage) & a_row_is_not_all_zeros;
	wire read_b_1 = ((((~_GEN_23 & ~_GEN_11[31]) & (_b_address_result_data_T[13:12] == 2'h1)) & start_inputting_b) & ~accumulate_zeros) & b_row_is_not_all_zeros;
	wire read_d_1 = ((((~_GEN_24 & ~_GEN_8[(_GEN_12 * 64) + 31]) & (_d_address_result_data_T[13:12] == 2'h1)) & start_inputting_d) & ~preload_zeros) & d_row_is_not_all_zeros;
	wire read_a_2 = ((((~_GEN_21 & ~_GEN_9[31]) & (_a_address_result_data_T[13:12] == 2'h2)) & start_inputting_a) & ~multiply_garbage) & a_row_is_not_all_zeros;
	wire read_b_2 = ((((~_GEN_23 & ~_GEN_11[31]) & (_b_address_result_data_T[13:12] == 2'h2)) & start_inputting_b) & ~accumulate_zeros) & b_row_is_not_all_zeros;
	wire read_d_2 = ((((~_GEN_24 & ~_GEN_8[(_GEN_12 * 64) + 31]) & (_d_address_result_data_T[13:12] == 2'h2)) & start_inputting_d) & ~preload_zeros) & d_row_is_not_all_zeros;
	wire read_a_3 = ((((~_GEN_21 & ~_GEN_9[31]) & &_a_address_result_data_T[13:12]) & start_inputting_a) & ~multiply_garbage) & a_row_is_not_all_zeros;
	wire read_b_3 = ((((~_GEN_23 & ~_GEN_11[31]) & &_b_address_result_data_T[13:12]) & start_inputting_b) & ~accumulate_zeros) & b_row_is_not_all_zeros;
	wire read_d_3 = ((((~_GEN_24 & ~_GEN_8[(_GEN_12 * 64) + 31]) & &_d_address_result_data_T[13:12]) & start_inputting_d) & ~preload_zeros) & d_row_is_not_all_zeros;
	wire _read_a_from_acc_T_9 = ~_GEN_21 & _GEN_9[31];
	wire read_a_from_acc = (((_read_a_from_acc_T_9 & ~_a_address_result_data_T[9]) & start_inputting_a) & ~multiply_garbage) & a_row_is_not_all_zeros;
	wire _read_b_from_acc_T_6 = ~_GEN_23 & _GEN_11[31];
	wire read_b_from_acc = (((_read_b_from_acc_T_6 & ~_b_address_result_data_T[9]) & start_inputting_b) & ~accumulate_zeros) & b_row_is_not_all_zeros;
	wire _read_d_from_acc_T_6 = ~_GEN_24 & _GEN_8[(_GEN_12 * 64) + 31];
	wire read_d_from_acc = (((_read_d_from_acc_T_6 & ~_d_address_result_data_T[9]) & start_inputting_d) & ~preload_zeros) & d_row_is_not_all_zeros;
	wire read_a_from_acc_1 = (((_read_a_from_acc_T_9 & _a_address_result_data_T[9]) & start_inputting_a) & ~multiply_garbage) & a_row_is_not_all_zeros;
	wire read_b_from_acc_1 = (((_read_b_from_acc_T_6 & _b_address_result_data_T[9]) & start_inputting_b) & ~accumulate_zeros) & b_row_is_not_all_zeros;
	wire read_d_from_acc_1 = (((_read_d_from_acc_T_6 & _d_address_result_data_T[9]) & start_inputting_d) & ~preload_zeros) & d_row_is_not_all_zeros;
	assign _GEN_4 = ~(((((read_a_from_acc_1 & ~io_acc_read_req_1_ready) | (read_a_from_acc & ~io_acc_read_req_0_ready)) | (read_a_3 & ~io_srams_read_3_req_ready)) | (read_a_2 & ~io_srams_read_2_req_ready)) | (read_a_1 & ~io_srams_read_1_req_ready));
	assign _GEN_3 = ~(((((read_b_from_acc_1 & ~io_acc_read_req_1_ready) | (read_b_from_acc & ~io_acc_read_req_0_ready)) | (read_b_3 & ~io_srams_read_3_req_ready)) | (read_b_2 & ~io_srams_read_2_req_ready)) | (read_b_1 & ~io_srams_read_1_req_ready));
	assign _GEN_2 = ~(((((read_d_from_acc_1 & ~io_acc_read_req_1_ready) | (read_d_from_acc & ~io_acc_read_req_0_ready)) | (read_d_3 & ~io_srams_read_3_req_ready)) | (read_d_2 & ~io_srams_read_2_req_ready)) | (read_d_1 & ~io_srams_read_1_req_ready));
	wire _GEN_25 = control_state == 2'h0;
	wire _GEN_26 = (DoConfig & ~matmul_in_progress) & ~(pending_completed_rob_ids_0_valid | pending_completed_rob_ids_1_valid);
	wire _GEN_27 = _cmd_q_io_deq_valid_0 & _GEN_26;
	wire _GEN_28 = _GEN_25 & _GEN_27;
	wire _GEN_29 = _GEN_28 & _cmd_q_io_deq_bits_0_rob_id_valid;
	wire _GEN_30 = (DoPreloads_0 & _cmd_q_io_deq_valid_1) & ~raw_hazard_pre;
	wire _GEN_31 = _GEN_25 & _cmd_q_io_deq_valid_0;
	wire performing_single_preload = ((_GEN_31 & ~_GEN_26) & _GEN_30) | (perform_single_preload & io_counter_event_signal_24_0);
	wire _GEN_32 = (((DoComputes_0 & _cmd_q_io_deq_valid_1) & DoPreloads_1) & _cmd_q_io_deq_valid_2) & ~raw_hazard_mulpre;
	wire _GEN_33 = _GEN_26 | _GEN_30;
	wire performing_mul_pre = ((_GEN_31 & ~_GEN_33) & _GEN_32) | (perform_mul_pre & io_counter_event_signal_24_0);
	wire _GEN_34 = (_GEN_26 | _GEN_30) | _GEN_32;
	wire performing_single_mul = ((_GEN_31 & ~_GEN_34) & DoComputes_0) | (perform_single_mul & io_counter_event_signal_24_0);
	wire _GEN_35 = control_state == 2'h1;
	assign start_inputting_d = (_GEN_25 ? (_cmd_q_io_deq_valid_0 & ~_GEN_26) & (_GEN_30 | _GEN_32) : _GEN_35 & (perform_single_preload | perform_mul_pre));
	assign start_inputting_a = (_GEN_25 ? (_cmd_q_io_deq_valid_0 & ~_GEN_26) & (_GEN_30 ? a_should_be_fed_into_transposer : _GEN_32 | (DoComputes_0 & ~a_should_be_fed_into_transposer)) : _GEN_35 & (perform_single_preload ? a_should_be_fed_into_transposer : perform_mul_pre | (perform_single_mul & ~a_should_be_fed_into_transposer)));
	assign start_inputting_b = (_GEN_25 ? (_cmd_q_io_deq_valid_0 & ~_GEN_26) & (_GEN_30 ? b_should_be_fed_into_transposer : _GEN_32 | (DoComputes_0 & ~b_should_be_fed_into_transposer)) : _GEN_35 & (perform_single_preload ? b_should_be_fed_into_transposer : perform_mul_pre | (perform_single_mul & ~b_should_be_fed_into_transposer)));
	wire computing = (performing_mul_pre | performing_single_mul) | performing_single_preload;
	wire [23:0] _GEN_36 = {{_cmd_q_io_deq_bits_0_rob_id_bits}, {_cmd_q_io_deq_bits_2_rob_id_bits}, {_cmd_q_io_deq_bits_1_rob_id_bits}, {_cmd_q_io_deq_bits_0_rob_id_bits}};
	wire accReadValid_0 = io_acc_read_resp_0_valid & ~io_acc_read_resp_0_bits_fromDMA;
	wire accReadValid_1 = io_acc_read_resp_1_valid & ~io_acc_read_resp_1_bits_fromDMA;
	wire _mesh_cntl_signals_q_io_deq_ready_T_1 = _mesh_io_a_ready & _GEN_1;
	wire _mesh_cntl_signals_q_io_deq_ready_T_6 = _mesh_io_b_ready & _GEN_0;
	wire _mesh_cntl_signals_q_io_deq_ready_T_12 = _mesh_io_d_ready & _GEN;
	wire _mesh_cntl_signals_q_io_deq_ready_T_19 = ((((~_mesh_cntl_signals_q_io_deq_bits_a_fire | _mesh_cntl_signals_q_io_deq_ready_T_1) | ~_mesh_io_a_ready) & ((~_mesh_cntl_signals_q_io_deq_bits_b_fire | _mesh_cntl_signals_q_io_deq_ready_T_6) | ~_mesh_io_b_ready)) & ((~_mesh_cntl_signals_q_io_deq_bits_d_fire | _mesh_cntl_signals_q_io_deq_ready_T_12) | ~_mesh_io_d_ready)) & (~_mesh_cntl_signals_q_io_deq_bits_first | _mesh_io_req_ready);
	wire [3:0] _GEN_37 = {{io_srams_read_3_resp_valid & ~io_srams_read_3_resp_bits_fromDMA}, {io_srams_read_2_resp_valid & ~io_srams_read_2_resp_bits_fromDMA}, {io_srams_read_1_resp_valid & ~io_srams_read_1_resp_bits_fromDMA}, {io_srams_read_0_resp_valid & ~io_srams_read_0_resp_bits_fromDMA}};
	wire [127:0] _GEN_38 = {io_acc_read_resp_1_bits_data_3_0, io_acc_read_resp_1_bits_data_2_0, io_acc_read_resp_1_bits_data_1_0, io_acc_read_resp_1_bits_data_0_0};
	wire [127:0] _GEN_39 = {io_acc_read_resp_0_bits_data_3_0, io_acc_read_resp_0_bits_data_2_0, io_acc_read_resp_0_bits_data_1_0, io_acc_read_resp_0_bits_data_0_0};
	wire [511:0] _GEN_40 = {{io_srams_read_3_resp_bits_data}, {io_srams_read_2_resp_bits_data}, {io_srams_read_1_resp_bits_data}, {io_srams_read_0_resp_bits_data}};
	wire [127:0] dataA_unpadded = (_mesh_cntl_signals_q_io_deq_bits_im2colling ? {io_im2col_resp_bits_a_im2col_15, io_im2col_resp_bits_a_im2col_14, io_im2col_resp_bits_a_im2col_13, io_im2col_resp_bits_a_im2col_12, io_im2col_resp_bits_a_im2col_11, io_im2col_resp_bits_a_im2col_10, io_im2col_resp_bits_a_im2col_9, io_im2col_resp_bits_a_im2col_8, io_im2col_resp_bits_a_im2col_7, io_im2col_resp_bits_a_im2col_6, io_im2col_resp_bits_a_im2col_5, io_im2col_resp_bits_a_im2col_4, io_im2col_resp_bits_a_im2col_3, io_im2col_resp_bits_a_im2col_2, io_im2col_resp_bits_a_im2col_1, io_im2col_resp_bits_a_im2col_0} : (_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc ? (_mesh_cntl_signals_q_io_deq_bits_a_bank_acc ? _GEN_38 : _GEN_39) : _GEN_40[_mesh_cntl_signals_q_io_deq_bits_a_bank * 128+:128]));
	wire [127:0] dataB_unpadded = (_mesh_cntl_signals_q_io_deq_bits_accumulate_zeros ? 128'h00000000000000000000000000000000 : (_mesh_cntl_signals_q_io_deq_bits_b_read_from_acc ? (_mesh_cntl_signals_q_io_deq_bits_b_bank_acc ? _GEN_38 : _GEN_39) : _GEN_40[_mesh_cntl_signals_q_io_deq_bits_b_bank * 128+:128]));
	wire [127:0] dataD_unpadded = (_mesh_cntl_signals_q_io_deq_bits_preload_zeros ? 128'h00000000000000000000000000000000 : (_mesh_cntl_signals_q_io_deq_bits_d_read_from_acc ? (_mesh_cntl_signals_q_io_deq_bits_d_bank_acc ? _GEN_38 : _GEN_39) : _GEN_40[_mesh_cntl_signals_q_io_deq_bits_d_bank * 128+:128]));
	wire [7:0] dataA_0 = (|_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols ? dataA_unpadded[7:0] : 8'h00);
	wire [7:0] dataA_1 = (|_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols[4:1] ? dataA_unpadded[15:8] : 8'h00);
	wire [7:0] dataA_2 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h02 ? dataA_unpadded[23:16] : 8'h00);
	wire [7:0] dataA_3 = (|_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols[4:2] ? dataA_unpadded[31:24] : 8'h00);
	wire [7:0] dataA_4 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h04 ? dataA_unpadded[39:32] : 8'h00);
	wire [7:0] dataA_5 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h05 ? dataA_unpadded[47:40] : 8'h00);
	wire [7:0] dataA_6 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h06 ? dataA_unpadded[55:48] : 8'h00);
	wire [7:0] dataA_7 = (|_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols[4:3] ? dataA_unpadded[63:56] : 8'h00);
	wire [7:0] dataA_8 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h08 ? dataA_unpadded[71:64] : 8'h00);
	wire [7:0] dataA_9 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h09 ? dataA_unpadded[79:72] : 8'h00);
	wire [7:0] dataA_10 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h0a ? dataA_unpadded[87:80] : 8'h00);
	wire [7:0] dataA_11 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h0b ? dataA_unpadded[95:88] : 8'h00);
	wire [7:0] dataA_12 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h0c ? dataA_unpadded[103:96] : 8'h00);
	wire [7:0] dataA_13 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h0d ? dataA_unpadded[111:104] : 8'h00);
	wire [7:0] dataA_14 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols > 5'h0e ? dataA_unpadded[119:112] : 8'h00);
	wire [7:0] dataA_15 = (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols[4] ? dataA_unpadded[127:120] : 8'h00);
	wire [7:0] dataB_0 = (|_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols ? dataB_unpadded[7:0] : 8'h00);
	wire [7:0] dataB_1 = (|_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols[4:1] ? dataB_unpadded[15:8] : 8'h00);
	wire [7:0] dataB_2 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h02 ? dataB_unpadded[23:16] : 8'h00);
	wire [7:0] dataB_3 = (|_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols[4:2] ? dataB_unpadded[31:24] : 8'h00);
	wire [7:0] dataB_4 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h04 ? dataB_unpadded[39:32] : 8'h00);
	wire [7:0] dataB_5 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h05 ? dataB_unpadded[47:40] : 8'h00);
	wire [7:0] dataB_6 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h06 ? dataB_unpadded[55:48] : 8'h00);
	wire [7:0] dataB_7 = (|_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols[4:3] ? dataB_unpadded[63:56] : 8'h00);
	wire [7:0] dataB_8 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h08 ? dataB_unpadded[71:64] : 8'h00);
	wire [7:0] dataB_9 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h09 ? dataB_unpadded[79:72] : 8'h00);
	wire [7:0] dataB_10 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h0a ? dataB_unpadded[87:80] : 8'h00);
	wire [7:0] dataB_11 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h0b ? dataB_unpadded[95:88] : 8'h00);
	wire [7:0] dataB_12 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h0c ? dataB_unpadded[103:96] : 8'h00);
	wire [7:0] dataB_13 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h0d ? dataB_unpadded[111:104] : 8'h00);
	wire [7:0] dataB_14 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols > 5'h0e ? dataB_unpadded[119:112] : 8'h00);
	wire [7:0] dataB_15 = (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols[4] ? dataB_unpadded[127:120] : 8'h00);
	wire _mesh_io_req_valid_T_1 = _mesh_cntl_signals_q_io_deq_ready_T_19 & _mesh_cntl_signals_q_io_deq_valid;
	wire _GEN_41 = (((_mesh_cntl_signals_q_io_deq_bits_a_fire & _mesh_cntl_signals_q_io_deq_ready_T_1) & ~_mesh_cntl_signals_q_io_deq_bits_a_garbage) & |_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols) & ~_mesh_cntl_signals_q_io_deq_bits_im2colling;
	wire _GEN_42 = (_mesh_cntl_signals_q_io_deq_bits_a_bank_acc ? io_acc_read_resp_1_bits_fromDMA : io_acc_read_resp_0_bits_fromDMA);
	wire [3:0] _GEN_43 = {{io_srams_read_3_resp_bits_fromDMA}, {io_srams_read_2_resp_bits_fromDMA}, {io_srams_read_1_resp_bits_fromDMA}, {io_srams_read_0_resp_bits_fromDMA}};
	wire _GEN_44 = _GEN_43[_mesh_cntl_signals_q_io_deq_bits_a_bank];
	wire _GEN_45 = (((_mesh_cntl_signals_q_io_deq_bits_b_fire & _mesh_cntl_signals_q_io_deq_ready_T_6) & ~_mesh_cntl_signals_q_io_deq_bits_b_garbage) & ~_mesh_cntl_signals_q_io_deq_bits_accumulate_zeros) & |_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols;
	wire _GEN_46 = (_mesh_cntl_signals_q_io_deq_bits_b_bank_acc ? io_acc_read_resp_1_bits_fromDMA : io_acc_read_resp_0_bits_fromDMA);
	wire _GEN_47 = _GEN_43[_mesh_cntl_signals_q_io_deq_bits_b_bank];
	wire _GEN_48 = (((_mesh_cntl_signals_q_io_deq_bits_d_fire & _mesh_cntl_signals_q_io_deq_ready_T_12) & ~_mesh_cntl_signals_q_io_deq_bits_d_garbage) & ~_mesh_cntl_signals_q_io_deq_bits_preload_zeros) & |_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols;
	wire _GEN_49 = (_mesh_cntl_signals_q_io_deq_bits_d_bank_acc ? io_acc_read_resp_1_bits_fromDMA : io_acc_read_resp_0_bits_fromDMA);
	wire _GEN_50 = _GEN_43[_mesh_cntl_signals_q_io_deq_bits_d_bank];
	assign _GEN_1 = (_mesh_cntl_signals_q_io_deq_valid & _mesh_cntl_signals_q_io_deq_bits_a_fire) & ((_mesh_cntl_signals_q_io_deq_bits_a_garbage | (_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols == 5'h00)) | (~_mesh_cntl_signals_q_io_deq_bits_im2colling & (_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc ? (_mesh_cntl_signals_q_io_deq_bits_a_bank_acc ? accReadValid_1 : accReadValid_0) : _GEN_37[_mesh_cntl_signals_q_io_deq_bits_a_bank])));
	assign _GEN_0 = (_mesh_cntl_signals_q_io_deq_valid & _mesh_cntl_signals_q_io_deq_bits_b_fire) & ((_mesh_cntl_signals_q_io_deq_bits_b_garbage | (_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols == 5'h00)) | (~_mesh_cntl_signals_q_io_deq_bits_accumulate_zeros & (_mesh_cntl_signals_q_io_deq_bits_b_read_from_acc ? (_mesh_cntl_signals_q_io_deq_bits_b_bank_acc ? accReadValid_1 : accReadValid_0) : _GEN_37[_mesh_cntl_signals_q_io_deq_bits_b_bank])));
	assign _GEN = (_mesh_cntl_signals_q_io_deq_valid & _mesh_cntl_signals_q_io_deq_bits_d_fire) & ((_mesh_cntl_signals_q_io_deq_bits_d_garbage | (_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols == 5'h00)) | (~_mesh_cntl_signals_q_io_deq_bits_preload_zeros & (_mesh_cntl_signals_q_io_deq_bits_d_read_from_acc ? (_mesh_cntl_signals_q_io_deq_bits_d_bank_acc ? accReadValid_1 : accReadValid_0) : _GEN_37[_mesh_cntl_signals_q_io_deq_bits_d_bank])));
	wire _GEN_51 = (_mesh_cntl_signals_q_io_deq_valid ? _mesh_io_req_valid_T_1 & ((_mesh_cntl_signals_q_io_deq_bits_a_fire | _mesh_cntl_signals_q_io_deq_bits_b_fire) | _mesh_cntl_signals_q_io_deq_bits_d_fire) : _mesh_io_req_bits_flush_T);
	wire _GEN_52 = _mesh_cntl_signals_q_io_deq_valid & _mesh_cntl_signals_q_io_deq_bits_perform_single_preload;
	wire [127:0] _GEN_53 = {dataA_15, dataA_14, dataA_13, dataA_12, dataA_11, dataA_10, dataA_9, dataA_8, dataA_7, dataA_6, dataA_5, dataA_4, dataA_3, dataA_2, dataA_1, dataA_0};
	wire [127:0] _GEN_54 = (a_should_be_fed_into_transposer ? _GEN_53 : 128'h00000000000000000000000000000000);
	wire [127:0] _GEN_55 = {dataB_15, dataB_14, dataB_13, dataB_12, dataB_11, dataB_10, dataB_9, dataB_8, dataB_7, dataB_6, dataB_5, dataB_4, dataB_3, dataB_2, dataB_1, dataB_0};
	wire [127:0] _GEN_56 = (b_should_be_fed_into_transposer ? _GEN_55 : 128'h00000000000000000000000000000000);
	wire _GEN_57 = _mesh_cntl_signals_q_io_deq_valid & _mesh_cntl_signals_q_io_deq_bits_perform_single_mul;
	wire [127:0] _GEN_58 = (a_should_be_fed_into_transposer ? 128'h00000000000000000000000000000000 : _GEN_53);
	wire [127:0] _GEN_59 = (b_should_be_fed_into_transposer ? 128'h00000000000000000000000000000000 : _GEN_55);
	reg [3:0] output_counter;
	wire [13:0] _w_address_T_4 = {10'h000, output_counter} * c_addr_stride[13:0];
	wire [4:0] _output_counter_max_T = _mesh_io_resp_bits_total_rows - 5'h01;
	wire [13:0] w_address_data = (current_dataflow ? _mesh_io_resp_bits_tag_addr_data + _w_address_T_4 : (_mesh_io_resp_bits_tag_addr_data + {9'h000, _output_counter_max_T}) - _w_address_T_4);
	wire [1:0] w_bank = (_mesh_io_resp_bits_tag_addr_is_acc_addr ? {1'h0, w_address_data[9]} : w_address_data[13:12]);
	wire [11:0] w_row = (_mesh_io_resp_bits_tag_addr_is_acc_addr ? {3'h0, w_address_data[8:0]} : w_address_data[11:0]);
	wire is_garbage_addr = (((_mesh_io_resp_bits_tag_addr_is_acc_addr & _mesh_io_resp_bits_tag_addr_accumulate) & _mesh_io_resp_bits_tag_addr_read_full_acc_row) & &_mesh_io_resp_bits_tag_addr_data) & _mesh_io_resp_bits_tag_addr_garbage_bit;
	wire [4:0] _GEN_60 = {1'h0, output_counter};
	wire write_this_row = (current_dataflow ? _GEN_60 < _mesh_io_resp_bits_tag_rows : (_output_counter_max_T - _GEN_60) < _mesh_io_resp_bits_tag_rows);
	wire w_mask_2 = _mesh_io_resp_bits_tag_cols > 5'h02;
	wire w_mask_4 = _mesh_io_resp_bits_tag_cols > 5'h04;
	wire w_mask_5 = _mesh_io_resp_bits_tag_cols > 5'h05;
	wire w_mask_6 = _mesh_io_resp_bits_tag_cols > 5'h06;
	wire w_mask_8 = _mesh_io_resp_bits_tag_cols > 5'h08;
	wire w_mask_9 = _mesh_io_resp_bits_tag_cols > 5'h09;
	wire w_mask_10 = _mesh_io_resp_bits_tag_cols > 5'h0a;
	wire w_mask_11 = _mesh_io_resp_bits_tag_cols > 5'h0b;
	wire w_mask_12 = _mesh_io_resp_bits_tag_cols > 5'h0c;
	wire w_mask_13 = _mesh_io_resp_bits_tag_cols > 5'h0d;
	wire w_mask_14 = _mesh_io_resp_bits_tag_cols > 5'h0e;
	wire _activated_wdata_e_clipped_T_240 = $signed(_mesh_io_resp_bits_data_0_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_241 = $signed(_mesh_io_resp_bits_data_0_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_3 = (_activated_wdata_e_clipped_T_240 ? 8'h7f : (_activated_wdata_e_clipped_T_241 ? 8'h80 : _mesh_io_resp_bits_data_0_0[7:0]));
	wire _GEN_61 = activation != 3'h1;
	wire _activated_wdata_e_clipped_T_245 = $signed(_mesh_io_resp_bits_data_1_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_246 = $signed(_mesh_io_resp_bits_data_1_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_8 = (_activated_wdata_e_clipped_T_245 ? 8'h7f : (_activated_wdata_e_clipped_T_246 ? 8'h80 : _mesh_io_resp_bits_data_1_0[7:0]));
	wire _activated_wdata_e_clipped_T_250 = $signed(_mesh_io_resp_bits_data_2_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_251 = $signed(_mesh_io_resp_bits_data_2_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_13 = (_activated_wdata_e_clipped_T_250 ? 8'h7f : (_activated_wdata_e_clipped_T_251 ? 8'h80 : _mesh_io_resp_bits_data_2_0[7:0]));
	wire _activated_wdata_e_clipped_T_255 = $signed(_mesh_io_resp_bits_data_3_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_256 = $signed(_mesh_io_resp_bits_data_3_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_18 = (_activated_wdata_e_clipped_T_255 ? 8'h7f : (_activated_wdata_e_clipped_T_256 ? 8'h80 : _mesh_io_resp_bits_data_3_0[7:0]));
	wire _activated_wdata_e_clipped_T_260 = $signed(_mesh_io_resp_bits_data_4_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_261 = $signed(_mesh_io_resp_bits_data_4_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_23 = (_activated_wdata_e_clipped_T_260 ? 8'h7f : (_activated_wdata_e_clipped_T_261 ? 8'h80 : _mesh_io_resp_bits_data_4_0[7:0]));
	wire _activated_wdata_e_clipped_T_265 = $signed(_mesh_io_resp_bits_data_5_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_266 = $signed(_mesh_io_resp_bits_data_5_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_28 = (_activated_wdata_e_clipped_T_265 ? 8'h7f : (_activated_wdata_e_clipped_T_266 ? 8'h80 : _mesh_io_resp_bits_data_5_0[7:0]));
	wire _activated_wdata_e_clipped_T_270 = $signed(_mesh_io_resp_bits_data_6_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_271 = $signed(_mesh_io_resp_bits_data_6_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_33 = (_activated_wdata_e_clipped_T_270 ? 8'h7f : (_activated_wdata_e_clipped_T_271 ? 8'h80 : _mesh_io_resp_bits_data_6_0[7:0]));
	wire _activated_wdata_e_clipped_T_275 = $signed(_mesh_io_resp_bits_data_7_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_276 = $signed(_mesh_io_resp_bits_data_7_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_38 = (_activated_wdata_e_clipped_T_275 ? 8'h7f : (_activated_wdata_e_clipped_T_276 ? 8'h80 : _mesh_io_resp_bits_data_7_0[7:0]));
	wire _activated_wdata_e_clipped_T_280 = $signed(_mesh_io_resp_bits_data_8_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_281 = $signed(_mesh_io_resp_bits_data_8_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_43 = (_activated_wdata_e_clipped_T_280 ? 8'h7f : (_activated_wdata_e_clipped_T_281 ? 8'h80 : _mesh_io_resp_bits_data_8_0[7:0]));
	wire _activated_wdata_e_clipped_T_285 = $signed(_mesh_io_resp_bits_data_9_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_286 = $signed(_mesh_io_resp_bits_data_9_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_48 = (_activated_wdata_e_clipped_T_285 ? 8'h7f : (_activated_wdata_e_clipped_T_286 ? 8'h80 : _mesh_io_resp_bits_data_9_0[7:0]));
	wire _activated_wdata_e_clipped_T_290 = $signed(_mesh_io_resp_bits_data_10_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_291 = $signed(_mesh_io_resp_bits_data_10_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_53 = (_activated_wdata_e_clipped_T_290 ? 8'h7f : (_activated_wdata_e_clipped_T_291 ? 8'h80 : _mesh_io_resp_bits_data_10_0[7:0]));
	wire _activated_wdata_e_clipped_T_295 = $signed(_mesh_io_resp_bits_data_11_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_296 = $signed(_mesh_io_resp_bits_data_11_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_58 = (_activated_wdata_e_clipped_T_295 ? 8'h7f : (_activated_wdata_e_clipped_T_296 ? 8'h80 : _mesh_io_resp_bits_data_11_0[7:0]));
	wire _activated_wdata_e_clipped_T_300 = $signed(_mesh_io_resp_bits_data_12_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_301 = $signed(_mesh_io_resp_bits_data_12_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_63 = (_activated_wdata_e_clipped_T_300 ? 8'h7f : (_activated_wdata_e_clipped_T_301 ? 8'h80 : _mesh_io_resp_bits_data_12_0[7:0]));
	wire _activated_wdata_e_clipped_T_305 = $signed(_mesh_io_resp_bits_data_13_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_306 = $signed(_mesh_io_resp_bits_data_13_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_68 = (_activated_wdata_e_clipped_T_305 ? 8'h7f : (_activated_wdata_e_clipped_T_306 ? 8'h80 : _mesh_io_resp_bits_data_13_0[7:0]));
	wire _activated_wdata_e_clipped_T_310 = $signed(_mesh_io_resp_bits_data_14_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_311 = $signed(_mesh_io_resp_bits_data_14_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_73 = (_activated_wdata_e_clipped_T_310 ? 8'h7f : (_activated_wdata_e_clipped_T_311 ? 8'h80 : _mesh_io_resp_bits_data_14_0[7:0]));
	wire _activated_wdata_e_clipped_T_315 = $signed(_mesh_io_resp_bits_data_15_0) > 20'sh0007f;
	wire _activated_wdata_e_clipped_T_316 = $signed(_mesh_io_resp_bits_data_15_0) < -20'sh00080;
	wire [7:0] _activated_wdata_e_clipped_T_78 = (_activated_wdata_e_clipped_T_315 ? 8'h7f : (_activated_wdata_e_clipped_T_316 ? 8'h80 : _mesh_io_resp_bits_data_15_0[7:0]));
	wire _io_acc_write_0_valid_T = w_bank == 2'h0;
	wire [7:0] _activated_wdata_e_clipped_T_83 = (_activated_wdata_e_clipped_T_240 ? 8'h7f : (_activated_wdata_e_clipped_T_241 ? 8'h80 : _mesh_io_resp_bits_data_0_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_88 = (_activated_wdata_e_clipped_T_245 ? 8'h7f : (_activated_wdata_e_clipped_T_246 ? 8'h80 : _mesh_io_resp_bits_data_1_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_93 = (_activated_wdata_e_clipped_T_250 ? 8'h7f : (_activated_wdata_e_clipped_T_251 ? 8'h80 : _mesh_io_resp_bits_data_2_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_98 = (_activated_wdata_e_clipped_T_255 ? 8'h7f : (_activated_wdata_e_clipped_T_256 ? 8'h80 : _mesh_io_resp_bits_data_3_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_103 = (_activated_wdata_e_clipped_T_260 ? 8'h7f : (_activated_wdata_e_clipped_T_261 ? 8'h80 : _mesh_io_resp_bits_data_4_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_108 = (_activated_wdata_e_clipped_T_265 ? 8'h7f : (_activated_wdata_e_clipped_T_266 ? 8'h80 : _mesh_io_resp_bits_data_5_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_113 = (_activated_wdata_e_clipped_T_270 ? 8'h7f : (_activated_wdata_e_clipped_T_271 ? 8'h80 : _mesh_io_resp_bits_data_6_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_118 = (_activated_wdata_e_clipped_T_275 ? 8'h7f : (_activated_wdata_e_clipped_T_276 ? 8'h80 : _mesh_io_resp_bits_data_7_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_123 = (_activated_wdata_e_clipped_T_280 ? 8'h7f : (_activated_wdata_e_clipped_T_281 ? 8'h80 : _mesh_io_resp_bits_data_8_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_128 = (_activated_wdata_e_clipped_T_285 ? 8'h7f : (_activated_wdata_e_clipped_T_286 ? 8'h80 : _mesh_io_resp_bits_data_9_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_133 = (_activated_wdata_e_clipped_T_290 ? 8'h7f : (_activated_wdata_e_clipped_T_291 ? 8'h80 : _mesh_io_resp_bits_data_10_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_138 = (_activated_wdata_e_clipped_T_295 ? 8'h7f : (_activated_wdata_e_clipped_T_296 ? 8'h80 : _mesh_io_resp_bits_data_11_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_143 = (_activated_wdata_e_clipped_T_300 ? 8'h7f : (_activated_wdata_e_clipped_T_301 ? 8'h80 : _mesh_io_resp_bits_data_12_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_148 = (_activated_wdata_e_clipped_T_305 ? 8'h7f : (_activated_wdata_e_clipped_T_306 ? 8'h80 : _mesh_io_resp_bits_data_13_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_153 = (_activated_wdata_e_clipped_T_310 ? 8'h7f : (_activated_wdata_e_clipped_T_311 ? 8'h80 : _mesh_io_resp_bits_data_14_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_158 = (_activated_wdata_e_clipped_T_315 ? 8'h7f : (_activated_wdata_e_clipped_T_316 ? 8'h80 : _mesh_io_resp_bits_data_15_0[7:0]));
	wire _io_acc_write_1_valid_T = w_bank == 2'h1;
	wire [7:0] _activated_wdata_e_clipped_T_163 = (_activated_wdata_e_clipped_T_240 ? 8'h7f : (_activated_wdata_e_clipped_T_241 ? 8'h80 : _mesh_io_resp_bits_data_0_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_168 = (_activated_wdata_e_clipped_T_245 ? 8'h7f : (_activated_wdata_e_clipped_T_246 ? 8'h80 : _mesh_io_resp_bits_data_1_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_173 = (_activated_wdata_e_clipped_T_250 ? 8'h7f : (_activated_wdata_e_clipped_T_251 ? 8'h80 : _mesh_io_resp_bits_data_2_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_178 = (_activated_wdata_e_clipped_T_255 ? 8'h7f : (_activated_wdata_e_clipped_T_256 ? 8'h80 : _mesh_io_resp_bits_data_3_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_183 = (_activated_wdata_e_clipped_T_260 ? 8'h7f : (_activated_wdata_e_clipped_T_261 ? 8'h80 : _mesh_io_resp_bits_data_4_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_188 = (_activated_wdata_e_clipped_T_265 ? 8'h7f : (_activated_wdata_e_clipped_T_266 ? 8'h80 : _mesh_io_resp_bits_data_5_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_193 = (_activated_wdata_e_clipped_T_270 ? 8'h7f : (_activated_wdata_e_clipped_T_271 ? 8'h80 : _mesh_io_resp_bits_data_6_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_198 = (_activated_wdata_e_clipped_T_275 ? 8'h7f : (_activated_wdata_e_clipped_T_276 ? 8'h80 : _mesh_io_resp_bits_data_7_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_203 = (_activated_wdata_e_clipped_T_280 ? 8'h7f : (_activated_wdata_e_clipped_T_281 ? 8'h80 : _mesh_io_resp_bits_data_8_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_208 = (_activated_wdata_e_clipped_T_285 ? 8'h7f : (_activated_wdata_e_clipped_T_286 ? 8'h80 : _mesh_io_resp_bits_data_9_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_213 = (_activated_wdata_e_clipped_T_290 ? 8'h7f : (_activated_wdata_e_clipped_T_291 ? 8'h80 : _mesh_io_resp_bits_data_10_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_218 = (_activated_wdata_e_clipped_T_295 ? 8'h7f : (_activated_wdata_e_clipped_T_296 ? 8'h80 : _mesh_io_resp_bits_data_11_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_223 = (_activated_wdata_e_clipped_T_300 ? 8'h7f : (_activated_wdata_e_clipped_T_301 ? 8'h80 : _mesh_io_resp_bits_data_12_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_228 = (_activated_wdata_e_clipped_T_305 ? 8'h7f : (_activated_wdata_e_clipped_T_306 ? 8'h80 : _mesh_io_resp_bits_data_13_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_233 = (_activated_wdata_e_clipped_T_310 ? 8'h7f : (_activated_wdata_e_clipped_T_311 ? 8'h80 : _mesh_io_resp_bits_data_14_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_238 = (_activated_wdata_e_clipped_T_315 ? 8'h7f : (_activated_wdata_e_clipped_T_316 ? 8'h80 : _mesh_io_resp_bits_data_15_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_243 = (_activated_wdata_e_clipped_T_240 ? 8'h7f : (_activated_wdata_e_clipped_T_241 ? 8'h80 : _mesh_io_resp_bits_data_0_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_248 = (_activated_wdata_e_clipped_T_245 ? 8'h7f : (_activated_wdata_e_clipped_T_246 ? 8'h80 : _mesh_io_resp_bits_data_1_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_253 = (_activated_wdata_e_clipped_T_250 ? 8'h7f : (_activated_wdata_e_clipped_T_251 ? 8'h80 : _mesh_io_resp_bits_data_2_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_258 = (_activated_wdata_e_clipped_T_255 ? 8'h7f : (_activated_wdata_e_clipped_T_256 ? 8'h80 : _mesh_io_resp_bits_data_3_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_263 = (_activated_wdata_e_clipped_T_260 ? 8'h7f : (_activated_wdata_e_clipped_T_261 ? 8'h80 : _mesh_io_resp_bits_data_4_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_268 = (_activated_wdata_e_clipped_T_265 ? 8'h7f : (_activated_wdata_e_clipped_T_266 ? 8'h80 : _mesh_io_resp_bits_data_5_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_273 = (_activated_wdata_e_clipped_T_270 ? 8'h7f : (_activated_wdata_e_clipped_T_271 ? 8'h80 : _mesh_io_resp_bits_data_6_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_278 = (_activated_wdata_e_clipped_T_275 ? 8'h7f : (_activated_wdata_e_clipped_T_276 ? 8'h80 : _mesh_io_resp_bits_data_7_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_283 = (_activated_wdata_e_clipped_T_280 ? 8'h7f : (_activated_wdata_e_clipped_T_281 ? 8'h80 : _mesh_io_resp_bits_data_8_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_288 = (_activated_wdata_e_clipped_T_285 ? 8'h7f : (_activated_wdata_e_clipped_T_286 ? 8'h80 : _mesh_io_resp_bits_data_9_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_293 = (_activated_wdata_e_clipped_T_290 ? 8'h7f : (_activated_wdata_e_clipped_T_291 ? 8'h80 : _mesh_io_resp_bits_data_10_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_298 = (_activated_wdata_e_clipped_T_295 ? 8'h7f : (_activated_wdata_e_clipped_T_296 ? 8'h80 : _mesh_io_resp_bits_data_11_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_303 = (_activated_wdata_e_clipped_T_300 ? 8'h7f : (_activated_wdata_e_clipped_T_301 ? 8'h80 : _mesh_io_resp_bits_data_12_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_308 = (_activated_wdata_e_clipped_T_305 ? 8'h7f : (_activated_wdata_e_clipped_T_306 ? 8'h80 : _mesh_io_resp_bits_data_13_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_313 = (_activated_wdata_e_clipped_T_310 ? 8'h7f : (_activated_wdata_e_clipped_T_311 ? 8'h80 : _mesh_io_resp_bits_data_14_0[7:0]));
	wire [7:0] _activated_wdata_e_clipped_T_318 = (_activated_wdata_e_clipped_T_315 ? 8'h7f : (_activated_wdata_e_clipped_T_316 ? 8'h80 : _mesh_io_resp_bits_data_15_0[7:0]));
	wire [11:0] _GEN_62 = {12 {_mesh_io_resp_bits_data_0_0[19]}};
	wire [11:0] _GEN_63 = {12 {_mesh_io_resp_bits_data_1_0[19]}};
	wire [11:0] _GEN_64 = {12 {_mesh_io_resp_bits_data_2_0[19]}};
	wire [11:0] _GEN_65 = {12 {_mesh_io_resp_bits_data_3_0[19]}};
	wire [11:0] _GEN_66 = {12 {_mesh_io_resp_bits_data_4_0[19]}};
	wire [11:0] _GEN_67 = {12 {_mesh_io_resp_bits_data_5_0[19]}};
	wire [11:0] _GEN_68 = {12 {_mesh_io_resp_bits_data_6_0[19]}};
	wire [11:0] _GEN_69 = {12 {_mesh_io_resp_bits_data_7_0[19]}};
	wire [11:0] _GEN_70 = {12 {_mesh_io_resp_bits_data_8_0[19]}};
	wire [11:0] _GEN_71 = {12 {_mesh_io_resp_bits_data_9_0[19]}};
	wire [11:0] _GEN_72 = {12 {_mesh_io_resp_bits_data_10_0[19]}};
	wire [11:0] _GEN_73 = {12 {_mesh_io_resp_bits_data_11_0[19]}};
	wire [11:0] _GEN_74 = {12 {_mesh_io_resp_bits_data_12_0[19]}};
	wire [11:0] _GEN_75 = {12 {_mesh_io_resp_bits_data_13_0[19]}};
	wire [11:0] _GEN_76 = {12 {_mesh_io_resp_bits_data_14_0[19]}};
	wire [11:0] _GEN_77 = {12 {_mesh_io_resp_bits_data_15_0[19]}};
	wire _GEN_78 = _mesh_io_resp_valid & _mesh_io_resp_bits_tag_rob_id_valid;
	wire [2:0] _GEN_79 = {1'h0, {1'h0, a_should_be_fed_into_transposer} + {1'h0, b_should_be_fed_into_transposer}} + {2'h0, d_should_be_fed_into_transposer};
	always @(posedge clock)
		if ((~reset & config_initialized) & |_GEN_79[2:1]) begin
// synopsys translate_off
			$error("Assertion failed: Too many inputs are being fed into the single transposer we have\n    at ExecuteController.scala:131 assert(!(config_initialized &&\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	wire mesh_completed_rob_id_fire = _GEN_78 & _mesh_io_resp_bits_last;
	wire _GEN_80 = _GEN_78 & _mesh_io_resp_bits_last;
	wire [5:0] _GEN_81 = (_GEN_80 ? _mesh_io_resp_bits_tag_rob_id_bits : _cmd_q_io_deq_bits_0_rob_id_bits);
	assign start_array_outputting = _GEN_78 & ~is_garbage_addr;
	wire _GEN_82 = (~_mesh_cntl_signals_q_io_deq_bits_a_fire | _mesh_cntl_signals_q_io_deq_ready_T_1) | ~_mesh_io_a_ready;
	wire _GEN_83 = (~_mesh_cntl_signals_q_io_deq_bits_b_fire | _mesh_cntl_signals_q_io_deq_ready_T_6) | ~_mesh_io_b_ready;
	wire _GEN_84 = (~_mesh_cntl_signals_q_io_deq_bits_d_fire | _mesh_cntl_signals_q_io_deq_ready_T_12) | ~_mesh_io_d_ready;
	wire _GEN_85 = about_to_fire_all_rows & ~current_dataflow;
	wire _GEN_86 = ~current_dataflow & in_prop_flush;
	wire firing = (start_inputting_a | start_inputting_b) | start_inputting_d;
	wire _GEN_87 = (firing & a_fire) & _mesh_cntl_signals_q_io_enq_ready;
	wire _GEN_88 = (firing & b_fire) & _mesh_cntl_signals_q_io_enq_ready;
	wire _GEN_89 = (firing & d_fire) & _mesh_cntl_signals_q_io_enq_ready;
	wire _GEN_90 = _cmd_q_io_deq_bits_0_cmd_rs1[1:0] == 2'h0;
	wire _GEN_91 = ((_GEN_25 & _cmd_q_io_deq_valid_0) & _GEN_26) & _GEN_90;
	wire _GEN_92 = ((_GEN_25 | ~_GEN_35) | perform_single_preload) | ~(perform_mul_pre & about_to_fire_all_rows);
	wire _GEN_93 = _GEN_25 | ~_GEN_35;
	wire _GEN_94 = (perform_single_preload | perform_mul_pre) | perform_single_mul;
	wire [7:0] _GEN_95 = {{(&control_state & _mesh_io_req_ready ? 2'h0 : control_state)}, {(_mesh_io_req_ready & _GEN_51 ? 2'h3 : control_state)}, {(_GEN_94 & about_to_fire_all_rows ? 2'h0 : control_state)}, {(_cmd_q_io_deq_valid_0 ? (_GEN_26 ? control_state : ((_GEN_30 | _GEN_32) | DoComputes_0 ? 2'h1 : (matmul_in_progress & (~current_dataflow | DoConfig) ? 2'h2 : control_state))) : (matmul_in_progress & ~current_dataflow ? 2'h2 : control_state))}};
	always @(posedge clock) begin
		if (reset) begin
			control_state <= 2'h0;
			ocol <= 8'h00;
			krow <= 4'h0;
			weight_stride <= 3'h0;
			row_turn <= 11'h000;
			row_left <= 4'h0;
			kdim2 <= 8'h00;
			config_initialized <= 1'h0;
			pending_completed_rob_ids_1_valid <= 1'h0;
			a_fire_started <= 1'h0;
			d_fire_started <= 1'h0;
			b_fire_started <= 1'h0;
			perform_single_preload <= 1'h0;
			perform_single_mul <= 1'h0;
			perform_mul_pre <= 1'h0;
			output_counter <= 4'h0;
		end
		else begin
			control_state <= _GEN_95[control_state * 2+:2];
			if (~_GEN_28 | _GEN_90)
				;
			else begin
				ocol <= _cmd_q_io_deq_bits_0_cmd_rs2[63:56];
				krow <= _cmd_q_io_deq_bits_0_cmd_rs2[47:44];
				weight_stride <= _cmd_q_io_deq_bits_0_cmd_rs2[22:20];
				row_turn <= _cmd_q_io_deq_bits_0_cmd_rs1[52:42];
				row_left <= _cmd_q_io_deq_bits_0_cmd_rs1[57:54];
				kdim2 <= _cmd_q_io_deq_bits_0_cmd_rs2[55:48];
			end
			config_initialized <= _GEN_91 | config_initialized;
			pending_completed_rob_ids_1_valid <= ((mesh_completed_rob_id_fire | pending_completed_rob_ids_0_valid) | ~pending_completed_rob_ids_1_valid) & (_GEN_92 ? pending_completed_rob_ids_1_valid : ((((_cmd_q_io_deq_bits_1_rob_id_valid & _GEN_10[(_GEN_12 * 64) + 31]) & _GEN_10[(_GEN_12 * 64) + 30]) & _GEN_10[(_GEN_12 * 64) + 29]) & &_GEN_10[(_GEN_12 * 64) + 13-:14]) & _GEN_10[(_GEN_12 * 64) + 14]);
			a_fire_started <= ~about_to_fire_all_rows & ((firing & _GEN_87) | a_fire_started);
			d_fire_started <= ~about_to_fire_all_rows & ((firing & _GEN_89) | d_fire_started);
			b_fire_started <= ~about_to_fire_all_rows & ((firing & _GEN_88) | b_fire_started);
			if (_GEN_25) begin
				perform_single_preload <= (_cmd_q_io_deq_valid_0 & ~_GEN_26) & _GEN_30;
				perform_single_mul <= (_cmd_q_io_deq_valid_0 & ~_GEN_34) & DoComputes_0;
				perform_mul_pre <= (_cmd_q_io_deq_valid_0 & ~_GEN_33) & _GEN_32;
			end
			if (_GEN_78)
				output_counter <= (_output_counter_max_T == 5'h00 ? 4'h0 : (_GEN_60 >= (_mesh_io_resp_bits_total_rows - 5'h01) ? (4'h1 - (_output_counter_max_T[3:0] - output_counter)) - 4'h1 : output_counter + 4'h1));
		end
		if ((((_GEN_25 & _cmd_q_io_deq_valid_0) & _GEN_26) & _GEN_90) & ~_cmd_q_io_deq_bits_0_cmd_rs1[7]) begin
			current_dataflow <= _cmd_q_io_deq_bits_0_cmd_rs1[2];
			in_shift <= _cmd_q_io_deq_bits_0_cmd_rs2[4:0];
			acc_scale_bits <= _cmd_q_io_deq_bits_0_cmd_rs1[63:32];
			activation <= {1'h0, _cmd_q_io_deq_bits_0_cmd_rs1[4:3]};
			a_transpose <= _cmd_q_io_deq_bits_0_cmd_rs1[8];
			bd_transpose <= _cmd_q_io_deq_bits_0_cmd_rs1[9];
		end
		if (_GEN_93)
			in_prop_flush <= _GEN_86;
		else if (perform_single_preload) begin
			if (_GEN_85)
				in_prop_flush <= ~((((_cmd_q_io_deq_bits_0_cmd_rs2[31] & _cmd_q_io_deq_bits_0_cmd_rs2[30]) & _cmd_q_io_deq_bits_0_cmd_rs2[29]) & &_cmd_q_io_deq_bits_0_cmd_rs2[13:0]) & _cmd_q_io_deq_bits_0_cmd_rs2[14]);
			else
				in_prop_flush <= _GEN_86;
		end
		else if (perform_mul_pre & _GEN_85)
			in_prop_flush <= ~((((_cmd_q_io_deq_bits_1_cmd_rs2[31] & _cmd_q_io_deq_bits_1_cmd_rs2[30]) & _cmd_q_io_deq_bits_1_cmd_rs2[29]) & &_cmd_q_io_deq_bits_1_cmd_rs2[13:0]) & _cmd_q_io_deq_bits_1_cmd_rs2[14]);
		else
			in_prop_flush <= _GEN_86;
		pending_completed_rob_ids_0_valid <= ~(reset | (~mesh_completed_rob_id_fire & pending_completed_rob_ids_0_valid)) & (_GEN_93 ? pending_completed_rob_ids_0_valid : (perform_single_preload ? (about_to_fire_all_rows ? ((((_cmd_q_io_deq_bits_0_rob_id_valid & _GEN_10[(_GEN_12 * 64) + 31]) & _GEN_10[(_GEN_12 * 64) + 30]) & _GEN_10[(_GEN_12 * 64) + 29]) & &_GEN_10[(_GEN_12 * 64) + 13-:14]) & _GEN_10[(_GEN_12 * 64) + 14] : pending_completed_rob_ids_0_valid) : ((perform_mul_pre | perform_single_mul) & about_to_fire_all_rows ? _cmd_q_io_deq_bits_0_rob_id_valid : pending_completed_rob_ids_0_valid)));
		if (_GEN_25 | ~((_GEN_35 & _GEN_94) & about_to_fire_all_rows))
			;
		else
			pending_completed_rob_ids_0_bits <= _cmd_q_io_deq_bits_0_rob_id_bits;
		if (_GEN_92)
			;
		else
			pending_completed_rob_ids_1_bits <= _cmd_q_io_deq_bits_1_rob_id_bits;
		if (firing) begin
			if (_GEN_87) begin
				a_fire_counter <= (_about_to_fire_all_rows_T_13 == 5'h00 ? 4'h0 : (_GEN_14 >= (total_rows - 5'h01) ? (4'h1 - (_about_to_fire_all_rows_T_13[3:0] - a_fire_counter)) - 4'h1 : _a_fire_counter_T_6));
				if (_GEN_14 == _about_to_fire_all_rows_T_13)
					a_addr_offset <= 20'h00000;
				else
					a_addr_offset <= a_addr_offset + {4'h0, a_addr_stride};
			end
			if (_GEN_88)
				b_fire_counter <= (_about_to_fire_all_rows_T_13 == 5'h00 ? 4'h0 : (_GEN_15 >= (total_rows - 5'h01) ? (4'h1 - (_about_to_fire_all_rows_T_13[3:0] - b_fire_counter)) - 4'h1 : _b_fire_counter_T_6));
			if (_GEN_89)
				d_fire_counter <= (_about_to_fire_all_rows_T_13 == 5'h00 ? 4'h0 : (_GEN_13 >= (total_rows - 5'h01) ? (4'h1 - (_about_to_fire_all_rows_T_13[3:0] - d_fire_counter)) - 4'h1 : _d_fire_counter_T_6));
		end
		else begin
			a_fire_counter <= 4'h0;
			b_fire_counter <= 4'h0;
			d_fire_counter <= 4'h0;
			a_addr_offset <= 20'h00000;
		end
		if (_GEN_91) begin
			a_addr_stride <= _cmd_q_io_deq_bits_0_cmd_rs1[31:16];
			c_addr_stride <= _cmd_q_io_deq_bits_0_cmd_rs2[63:48];
		end
	end
	TransposePreloadUnroller unrolled_cmd_mod(
		.clock(clock),
		.reset(reset),
		.io_in_ready(io_cmd_ready),
		.io_in_valid(io_cmd_valid),
		.io_in_bits_cmd_inst_funct(io_cmd_bits_cmd_inst_funct),
		.io_in_bits_cmd_rs1(io_cmd_bits_cmd_rs1),
		.io_in_bits_cmd_rs2(io_cmd_bits_cmd_rs2),
		.io_in_bits_rob_id_bits(io_cmd_bits_rob_id_bits),
		.io_out_ready(_cmd_q_io_enq_ready),
		.io_out_valid(_unrolled_cmd_mod_io_out_valid),
		.io_out_bits_cmd_inst_funct(_unrolled_cmd_mod_io_out_bits_cmd_inst_funct),
		.io_out_bits_cmd_rs1(_unrolled_cmd_mod_io_out_bits_cmd_rs1),
		.io_out_bits_cmd_rs2(_unrolled_cmd_mod_io_out_bits_cmd_rs2),
		.io_out_bits_rob_id_valid(_unrolled_cmd_mod_io_out_bits_rob_id_valid),
		.io_out_bits_rob_id_bits(_unrolled_cmd_mod_io_out_bits_rob_id_bits)
	);
	MultiHeadedQueue_1 cmd_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_cmd_q_io_enq_ready),
		.io_enq_valid(_unrolled_cmd_mod_io_out_valid),
		.io_enq_bits_cmd_inst_funct(_unrolled_cmd_mod_io_out_bits_cmd_inst_funct),
		.io_enq_bits_cmd_rs1(_unrolled_cmd_mod_io_out_bits_cmd_rs1),
		.io_enq_bits_cmd_rs2(_unrolled_cmd_mod_io_out_bits_cmd_rs2),
		.io_enq_bits_rob_id_valid(_unrolled_cmd_mod_io_out_bits_rob_id_valid),
		.io_enq_bits_rob_id_bits(_unrolled_cmd_mod_io_out_bits_rob_id_bits),
		.io_deq_valid_0(_cmd_q_io_deq_valid_0),
		.io_deq_valid_1(_cmd_q_io_deq_valid_1),
		.io_deq_valid_2(_cmd_q_io_deq_valid_2),
		.io_deq_bits_0_cmd_inst_funct(_cmd_q_io_deq_bits_0_cmd_inst_funct),
		.io_deq_bits_0_cmd_rs1(_cmd_q_io_deq_bits_0_cmd_rs1),
		.io_deq_bits_0_cmd_rs2(_cmd_q_io_deq_bits_0_cmd_rs2),
		.io_deq_bits_0_rob_id_valid(_cmd_q_io_deq_bits_0_rob_id_valid),
		.io_deq_bits_0_rob_id_bits(_cmd_q_io_deq_bits_0_rob_id_bits),
		.io_deq_bits_1_cmd_inst_funct(_cmd_q_io_deq_bits_1_cmd_inst_funct),
		.io_deq_bits_1_cmd_rs1(_cmd_q_io_deq_bits_1_cmd_rs1),
		.io_deq_bits_1_cmd_rs2(_cmd_q_io_deq_bits_1_cmd_rs2),
		.io_deq_bits_1_rob_id_valid(_cmd_q_io_deq_bits_1_rob_id_valid),
		.io_deq_bits_1_rob_id_bits(_cmd_q_io_deq_bits_1_rob_id_bits),
		.io_deq_bits_2_cmd_rs1(_cmd_q_io_deq_bits_2_cmd_rs1),
		.io_deq_bits_2_cmd_rs2(_cmd_q_io_deq_bits_2_cmd_rs2),
		.io_deq_bits_2_rob_id_bits(_cmd_q_io_deq_bits_2_rob_id_bits),
		.io_deq_pop((_GEN_25 ? {1'h0, _GEN_27} : (_GEN_35 ? (perform_single_preload ? {1'h0, about_to_fire_all_rows} : (perform_mul_pre ? {about_to_fire_all_rows, 1'h0} : {1'h0, perform_single_mul & about_to_fire_all_rows})) : 2'h0)))
	);
	Queue5_ComputeCntlSignals mesh_cntl_signals_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_mesh_cntl_signals_q_io_enq_ready),
		.io_enq_valid(computing),
		.io_enq_bits_perform_mul_pre(performing_mul_pre),
		.io_enq_bits_perform_single_mul(performing_single_mul),
		.io_enq_bits_perform_single_preload(performing_single_preload),
		.io_enq_bits_a_bank(_a_address_result_data_T[13:12]),
		.io_enq_bits_b_bank(_b_address_result_data_T[13:12]),
		.io_enq_bits_d_bank(_d_address_result_data_T[13:12]),
		.io_enq_bits_a_bank_acc(_a_address_result_data_T[9]),
		.io_enq_bits_b_bank_acc(_b_address_result_data_T[9]),
		.io_enq_bits_d_bank_acc(_d_address_result_data_T[9]),
		.io_enq_bits_a_read_from_acc(_GEN_9[31]),
		.io_enq_bits_b_read_from_acc(_GEN_11[31]),
		.io_enq_bits_d_read_from_acc(_GEN_8[(_GEN_12 * 64) + 31]),
		.io_enq_bits_a_garbage(a_garbage),
		.io_enq_bits_b_garbage(b_garbage),
		.io_enq_bits_d_garbage(d_garbage),
		.io_enq_bits_accumulate_zeros(accumulate_zeros),
		.io_enq_bits_preload_zeros(preload_zeros),
		.io_enq_bits_a_fire(a_fire),
		.io_enq_bits_b_fire(b_fire),
		.io_enq_bits_d_fire(d_fire),
		.io_enq_bits_a_unpadded_cols((a_row_is_not_all_zeros ? (a_transpose ? _GEN_9[52:48] : _GEN_9[36:32]) : 5'h00)),
		.io_enq_bits_b_unpadded_cols((b_row_is_not_all_zeros ? (~current_dataflow & bd_transpose ? _GEN_11[52:48] : _GEN_11[36:32]) : 5'h00)),
		.io_enq_bits_d_unpadded_cols((d_row_is_not_all_zeros ? (current_dataflow & bd_transpose ? _GEN_8[(_GEN_12 * 64) + 52-:5] : _GEN_8[(_GEN_12 * 64) + 36-:5]) : 5'h00)),
		.io_enq_bits_c_addr_is_acc_addr(_GEN_10[(_GEN_12 * 64) + 31]),
		.io_enq_bits_c_addr_accumulate(_GEN_10[(_GEN_12 * 64) + 30]),
		.io_enq_bits_c_addr_read_full_acc_row(_GEN_10[(_GEN_12 * 64) + 29]),
		.io_enq_bits_c_addr_norm_cmd(_GEN_10[(_GEN_12 * 64) + 28-:3]),
		.io_enq_bits_c_addr_garbage(_GEN_10[(_GEN_12 * 64) + 25-:11]),
		.io_enq_bits_c_addr_garbage_bit(_GEN_10[(_GEN_12 * 64) + 14]),
		.io_enq_bits_c_addr_data(_GEN_10[(_GEN_12 * 64) + 13-:14]),
		.io_enq_bits_c_rows(_GEN_10[(_GEN_12 * 64) + 52-:5]),
		.io_enq_bits_c_cols(_GEN_10[(_GEN_12 * 64) + 36-:5]),
		.io_enq_bits_a_transpose(a_transpose),
		.io_enq_bits_bd_transpose(bd_transpose),
		.io_enq_bits_total_rows(total_rows),
		.io_enq_bits_rob_id_valid(~performing_single_mul & ~((((_GEN_10[(_GEN_12 * 64) + 31] & _GEN_10[(_GEN_12 * 64) + 30]) & _GEN_10[(_GEN_12 * 64) + 29]) & &_GEN_10[(_GEN_12 * 64) + 13-:14]) & _GEN_10[(_GEN_12 * 64) + 14])),
		.io_enq_bits_rob_id_bits(_GEN_36[_GEN_12 * 6+:6]),
		.io_enq_bits_dataflow(current_dataflow),
		.io_enq_bits_prop((performing_single_preload ? in_prop_flush : in_prop)),
		.io_enq_bits_shift(in_shift),
		.io_enq_bits_first((~a_fire_started & ~b_fire_started) & ~d_fire_started),
		.io_deq_ready(_mesh_cntl_signals_q_io_deq_ready_T_19),
		.io_deq_valid(_mesh_cntl_signals_q_io_deq_valid),
		.io_deq_bits_perform_single_mul(_mesh_cntl_signals_q_io_deq_bits_perform_single_mul),
		.io_deq_bits_perform_single_preload(_mesh_cntl_signals_q_io_deq_bits_perform_single_preload),
		.io_deq_bits_a_bank(_mesh_cntl_signals_q_io_deq_bits_a_bank),
		.io_deq_bits_b_bank(_mesh_cntl_signals_q_io_deq_bits_b_bank),
		.io_deq_bits_d_bank(_mesh_cntl_signals_q_io_deq_bits_d_bank),
		.io_deq_bits_a_bank_acc(_mesh_cntl_signals_q_io_deq_bits_a_bank_acc),
		.io_deq_bits_b_bank_acc(_mesh_cntl_signals_q_io_deq_bits_b_bank_acc),
		.io_deq_bits_d_bank_acc(_mesh_cntl_signals_q_io_deq_bits_d_bank_acc),
		.io_deq_bits_a_read_from_acc(_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc),
		.io_deq_bits_b_read_from_acc(_mesh_cntl_signals_q_io_deq_bits_b_read_from_acc),
		.io_deq_bits_d_read_from_acc(_mesh_cntl_signals_q_io_deq_bits_d_read_from_acc),
		.io_deq_bits_a_garbage(_mesh_cntl_signals_q_io_deq_bits_a_garbage),
		.io_deq_bits_b_garbage(_mesh_cntl_signals_q_io_deq_bits_b_garbage),
		.io_deq_bits_d_garbage(_mesh_cntl_signals_q_io_deq_bits_d_garbage),
		.io_deq_bits_accumulate_zeros(_mesh_cntl_signals_q_io_deq_bits_accumulate_zeros),
		.io_deq_bits_preload_zeros(_mesh_cntl_signals_q_io_deq_bits_preload_zeros),
		.io_deq_bits_a_fire(_mesh_cntl_signals_q_io_deq_bits_a_fire),
		.io_deq_bits_b_fire(_mesh_cntl_signals_q_io_deq_bits_b_fire),
		.io_deq_bits_d_fire(_mesh_cntl_signals_q_io_deq_bits_d_fire),
		.io_deq_bits_a_unpadded_cols(_mesh_cntl_signals_q_io_deq_bits_a_unpadded_cols),
		.io_deq_bits_b_unpadded_cols(_mesh_cntl_signals_q_io_deq_bits_b_unpadded_cols),
		.io_deq_bits_d_unpadded_cols(_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols),
		.io_deq_bits_c_addr_is_acc_addr(_mesh_cntl_signals_q_io_deq_bits_c_addr_is_acc_addr),
		.io_deq_bits_c_addr_accumulate(_mesh_cntl_signals_q_io_deq_bits_c_addr_accumulate),
		.io_deq_bits_c_addr_read_full_acc_row(_mesh_cntl_signals_q_io_deq_bits_c_addr_read_full_acc_row),
		.io_deq_bits_c_addr_garbage_bit(_mesh_cntl_signals_q_io_deq_bits_c_addr_garbage_bit),
		.io_deq_bits_c_addr_data(_mesh_cntl_signals_q_io_deq_bits_c_addr_data),
		.io_deq_bits_c_rows(_mesh_cntl_signals_q_io_deq_bits_c_rows),
		.io_deq_bits_c_cols(_mesh_cntl_signals_q_io_deq_bits_c_cols),
		.io_deq_bits_a_transpose(_mesh_cntl_signals_q_io_deq_bits_a_transpose),
		.io_deq_bits_bd_transpose(_mesh_cntl_signals_q_io_deq_bits_bd_transpose),
		.io_deq_bits_total_rows(_mesh_cntl_signals_q_io_deq_bits_total_rows),
		.io_deq_bits_rob_id_valid(_mesh_cntl_signals_q_io_deq_bits_rob_id_valid),
		.io_deq_bits_rob_id_bits(_mesh_cntl_signals_q_io_deq_bits_rob_id_bits),
		.io_deq_bits_dataflow(_mesh_cntl_signals_q_io_deq_bits_dataflow),
		.io_deq_bits_prop(_mesh_cntl_signals_q_io_deq_bits_prop),
		.io_deq_bits_shift(_mesh_cntl_signals_q_io_deq_bits_shift),
		.io_deq_bits_im2colling(_mesh_cntl_signals_q_io_deq_bits_im2colling),
		.io_deq_bits_first(_mesh_cntl_signals_q_io_deq_bits_first)
	);
	MeshWithDelays mesh(
		.clock(clock),
		.reset(reset),
		.io_a_ready(_mesh_io_a_ready),
		.io_a_valid(_GEN_1),
		.io_a_bits_0_0((_GEN_57 ? _GEN_58[7:0] : (_GEN_52 ? _GEN_54[7:0] : dataA_0))),
		.io_a_bits_1_0((_GEN_57 ? _GEN_58[15:8] : (_GEN_52 ? _GEN_54[15:8] : dataA_1))),
		.io_a_bits_2_0((_GEN_57 ? _GEN_58[23:16] : (_GEN_52 ? _GEN_54[23:16] : dataA_2))),
		.io_a_bits_3_0((_GEN_57 ? _GEN_58[31:24] : (_GEN_52 ? _GEN_54[31:24] : dataA_3))),
		.io_a_bits_4_0((_GEN_57 ? _GEN_58[39:32] : (_GEN_52 ? _GEN_54[39:32] : dataA_4))),
		.io_a_bits_5_0((_GEN_57 ? _GEN_58[47:40] : (_GEN_52 ? _GEN_54[47:40] : dataA_5))),
		.io_a_bits_6_0((_GEN_57 ? _GEN_58[55:48] : (_GEN_52 ? _GEN_54[55:48] : dataA_6))),
		.io_a_bits_7_0((_GEN_57 ? _GEN_58[63:56] : (_GEN_52 ? _GEN_54[63:56] : dataA_7))),
		.io_a_bits_8_0((_GEN_57 ? _GEN_58[71:64] : (_GEN_52 ? _GEN_54[71:64] : dataA_8))),
		.io_a_bits_9_0((_GEN_57 ? _GEN_58[79:72] : (_GEN_52 ? _GEN_54[79:72] : dataA_9))),
		.io_a_bits_10_0((_GEN_57 ? _GEN_58[87:80] : (_GEN_52 ? _GEN_54[87:80] : dataA_10))),
		.io_a_bits_11_0((_GEN_57 ? _GEN_58[95:88] : (_GEN_52 ? _GEN_54[95:88] : dataA_11))),
		.io_a_bits_12_0((_GEN_57 ? _GEN_58[103:96] : (_GEN_52 ? _GEN_54[103:96] : dataA_12))),
		.io_a_bits_13_0((_GEN_57 ? _GEN_58[111:104] : (_GEN_52 ? _GEN_54[111:104] : dataA_13))),
		.io_a_bits_14_0((_GEN_57 ? _GEN_58[119:112] : (_GEN_52 ? _GEN_54[119:112] : dataA_14))),
		.io_a_bits_15_0((_GEN_57 ? _GEN_58[127:120] : (_GEN_52 ? _GEN_54[127:120] : dataA_15))),
		.io_b_ready(_mesh_io_b_ready),
		.io_b_valid(_GEN_0),
		.io_b_bits_0_0((_GEN_57 ? _GEN_59[7:0] : (_GEN_52 ? _GEN_56[7:0] : dataB_0))),
		.io_b_bits_1_0((_GEN_57 ? _GEN_59[15:8] : (_GEN_52 ? _GEN_56[15:8] : dataB_1))),
		.io_b_bits_2_0((_GEN_57 ? _GEN_59[23:16] : (_GEN_52 ? _GEN_56[23:16] : dataB_2))),
		.io_b_bits_3_0((_GEN_57 ? _GEN_59[31:24] : (_GEN_52 ? _GEN_56[31:24] : dataB_3))),
		.io_b_bits_4_0((_GEN_57 ? _GEN_59[39:32] : (_GEN_52 ? _GEN_56[39:32] : dataB_4))),
		.io_b_bits_5_0((_GEN_57 ? _GEN_59[47:40] : (_GEN_52 ? _GEN_56[47:40] : dataB_5))),
		.io_b_bits_6_0((_GEN_57 ? _GEN_59[55:48] : (_GEN_52 ? _GEN_56[55:48] : dataB_6))),
		.io_b_bits_7_0((_GEN_57 ? _GEN_59[63:56] : (_GEN_52 ? _GEN_56[63:56] : dataB_7))),
		.io_b_bits_8_0((_GEN_57 ? _GEN_59[71:64] : (_GEN_52 ? _GEN_56[71:64] : dataB_8))),
		.io_b_bits_9_0((_GEN_57 ? _GEN_59[79:72] : (_GEN_52 ? _GEN_56[79:72] : dataB_9))),
		.io_b_bits_10_0((_GEN_57 ? _GEN_59[87:80] : (_GEN_52 ? _GEN_56[87:80] : dataB_10))),
		.io_b_bits_11_0((_GEN_57 ? _GEN_59[95:88] : (_GEN_52 ? _GEN_56[95:88] : dataB_11))),
		.io_b_bits_12_0((_GEN_57 ? _GEN_59[103:96] : (_GEN_52 ? _GEN_56[103:96] : dataB_12))),
		.io_b_bits_13_0((_GEN_57 ? _GEN_59[111:104] : (_GEN_52 ? _GEN_56[111:104] : dataB_13))),
		.io_b_bits_14_0((_GEN_57 ? _GEN_59[119:112] : (_GEN_52 ? _GEN_56[119:112] : dataB_14))),
		.io_b_bits_15_0((_GEN_57 ? _GEN_59[127:120] : (_GEN_52 ? _GEN_56[127:120] : dataB_15))),
		.io_d_ready(_mesh_io_d_ready),
		.io_d_valid(_GEN),
		.io_d_bits_0_0((|_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols ? dataD_unpadded[7:0] : 8'h00)),
		.io_d_bits_1_0((|_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols[4:1] ? dataD_unpadded[15:8] : 8'h00)),
		.io_d_bits_2_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h02 ? dataD_unpadded[23:16] : 8'h00)),
		.io_d_bits_3_0((|_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols[4:2] ? dataD_unpadded[31:24] : 8'h00)),
		.io_d_bits_4_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h04 ? dataD_unpadded[39:32] : 8'h00)),
		.io_d_bits_5_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h05 ? dataD_unpadded[47:40] : 8'h00)),
		.io_d_bits_6_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h06 ? dataD_unpadded[55:48] : 8'h00)),
		.io_d_bits_7_0((|_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols[4:3] ? dataD_unpadded[63:56] : 8'h00)),
		.io_d_bits_8_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h08 ? dataD_unpadded[71:64] : 8'h00)),
		.io_d_bits_9_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h09 ? dataD_unpadded[79:72] : 8'h00)),
		.io_d_bits_10_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h0a ? dataD_unpadded[87:80] : 8'h00)),
		.io_d_bits_11_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h0b ? dataD_unpadded[95:88] : 8'h00)),
		.io_d_bits_12_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h0c ? dataD_unpadded[103:96] : 8'h00)),
		.io_d_bits_13_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h0d ? dataD_unpadded[111:104] : 8'h00)),
		.io_d_bits_14_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols > 5'h0e ? dataD_unpadded[119:112] : 8'h00)),
		.io_d_bits_15_0((_mesh_cntl_signals_q_io_deq_bits_d_unpadded_cols[4] ? dataD_unpadded[127:120] : 8'h00)),
		.io_req_ready(_mesh_io_req_ready),
		.io_req_valid(_GEN_51),
		.io_req_bits_tag_rob_id_valid(_mesh_cntl_signals_q_io_deq_bits_rob_id_valid),
		.io_req_bits_tag_rob_id_bits(_mesh_cntl_signals_q_io_deq_bits_rob_id_bits),
		.io_req_bits_tag_addr_is_acc_addr(_GEN_57 | _mesh_cntl_signals_q_io_deq_bits_c_addr_is_acc_addr),
		.io_req_bits_tag_addr_accumulate(_GEN_57 | _mesh_cntl_signals_q_io_deq_bits_c_addr_accumulate),
		.io_req_bits_tag_addr_read_full_acc_row(_GEN_57 | _mesh_cntl_signals_q_io_deq_bits_c_addr_read_full_acc_row),
		.io_req_bits_tag_addr_garbage_bit(_GEN_57 | _mesh_cntl_signals_q_io_deq_bits_c_addr_garbage_bit),
		.io_req_bits_tag_addr_data((_GEN_57 ? 14'h3fff : _mesh_cntl_signals_q_io_deq_bits_c_addr_data)),
		.io_req_bits_tag_rows(_mesh_cntl_signals_q_io_deq_bits_c_rows),
		.io_req_bits_tag_cols(_mesh_cntl_signals_q_io_deq_bits_c_cols),
		.io_req_bits_pe_control_dataflow(_mesh_cntl_signals_q_io_deq_bits_dataflow),
		.io_req_bits_pe_control_propagate((_mesh_io_req_bits_flush_T ? in_prop_flush : _mesh_cntl_signals_q_io_deq_bits_prop)),
		.io_req_bits_pe_control_shift(_mesh_cntl_signals_q_io_deq_bits_shift),
		.io_req_bits_a_transpose(_mesh_cntl_signals_q_io_deq_bits_a_transpose),
		.io_req_bits_bd_transpose(_mesh_cntl_signals_q_io_deq_bits_bd_transpose),
		.io_req_bits_total_rows((_mesh_cntl_signals_q_io_deq_valid ? _mesh_cntl_signals_q_io_deq_bits_total_rows : 5'h10)),
		.io_req_bits_flush({1'h0, _mesh_io_req_bits_flush_T & ~_mesh_cntl_signals_q_io_deq_valid}),
		.io_resp_valid(_mesh_io_resp_valid),
		.io_resp_bits_tag_rob_id_valid(_mesh_io_resp_bits_tag_rob_id_valid),
		.io_resp_bits_tag_rob_id_bits(_mesh_io_resp_bits_tag_rob_id_bits),
		.io_resp_bits_tag_addr_is_acc_addr(_mesh_io_resp_bits_tag_addr_is_acc_addr),
		.io_resp_bits_tag_addr_accumulate(_mesh_io_resp_bits_tag_addr_accumulate),
		.io_resp_bits_tag_addr_read_full_acc_row(_mesh_io_resp_bits_tag_addr_read_full_acc_row),
		.io_resp_bits_tag_addr_garbage_bit(_mesh_io_resp_bits_tag_addr_garbage_bit),
		.io_resp_bits_tag_addr_data(_mesh_io_resp_bits_tag_addr_data),
		.io_resp_bits_tag_rows(_mesh_io_resp_bits_tag_rows),
		.io_resp_bits_tag_cols(_mesh_io_resp_bits_tag_cols),
		.io_resp_bits_data_0_0(_mesh_io_resp_bits_data_0_0),
		.io_resp_bits_data_1_0(_mesh_io_resp_bits_data_1_0),
		.io_resp_bits_data_2_0(_mesh_io_resp_bits_data_2_0),
		.io_resp_bits_data_3_0(_mesh_io_resp_bits_data_3_0),
		.io_resp_bits_data_4_0(_mesh_io_resp_bits_data_4_0),
		.io_resp_bits_data_5_0(_mesh_io_resp_bits_data_5_0),
		.io_resp_bits_data_6_0(_mesh_io_resp_bits_data_6_0),
		.io_resp_bits_data_7_0(_mesh_io_resp_bits_data_7_0),
		.io_resp_bits_data_8_0(_mesh_io_resp_bits_data_8_0),
		.io_resp_bits_data_9_0(_mesh_io_resp_bits_data_9_0),
		.io_resp_bits_data_10_0(_mesh_io_resp_bits_data_10_0),
		.io_resp_bits_data_11_0(_mesh_io_resp_bits_data_11_0),
		.io_resp_bits_data_12_0(_mesh_io_resp_bits_data_12_0),
		.io_resp_bits_data_13_0(_mesh_io_resp_bits_data_13_0),
		.io_resp_bits_data_14_0(_mesh_io_resp_bits_data_14_0),
		.io_resp_bits_data_15_0(_mesh_io_resp_bits_data_15_0),
		.io_resp_bits_total_rows(_mesh_io_resp_bits_total_rows),
		.io_resp_bits_last(_mesh_io_resp_bits_last),
		.io_tags_in_progress_0_rob_id_valid(_mesh_io_tags_in_progress_0_rob_id_valid),
		.io_tags_in_progress_0_addr_is_acc_addr(_mesh_io_tags_in_progress_0_addr_is_acc_addr),
		.io_tags_in_progress_0_addr_accumulate(_mesh_io_tags_in_progress_0_addr_accumulate),
		.io_tags_in_progress_0_addr_read_full_acc_row(_mesh_io_tags_in_progress_0_addr_read_full_acc_row),
		.io_tags_in_progress_0_addr_garbage_bit(_mesh_io_tags_in_progress_0_addr_garbage_bit),
		.io_tags_in_progress_0_addr_data(_mesh_io_tags_in_progress_0_addr_data),
		.io_tags_in_progress_1_rob_id_valid(_mesh_io_tags_in_progress_1_rob_id_valid),
		.io_tags_in_progress_1_addr_is_acc_addr(_mesh_io_tags_in_progress_1_addr_is_acc_addr),
		.io_tags_in_progress_1_addr_accumulate(_mesh_io_tags_in_progress_1_addr_accumulate),
		.io_tags_in_progress_1_addr_read_full_acc_row(_mesh_io_tags_in_progress_1_addr_read_full_acc_row),
		.io_tags_in_progress_1_addr_garbage_bit(_mesh_io_tags_in_progress_1_addr_garbage_bit),
		.io_tags_in_progress_1_addr_data(_mesh_io_tags_in_progress_1_addr_data),
		.io_tags_in_progress_2_rob_id_valid(_mesh_io_tags_in_progress_2_rob_id_valid),
		.io_tags_in_progress_2_addr_is_acc_addr(_mesh_io_tags_in_progress_2_addr_is_acc_addr),
		.io_tags_in_progress_2_addr_accumulate(_mesh_io_tags_in_progress_2_addr_accumulate),
		.io_tags_in_progress_2_addr_read_full_acc_row(_mesh_io_tags_in_progress_2_addr_read_full_acc_row),
		.io_tags_in_progress_2_addr_garbage_bit(_mesh_io_tags_in_progress_2_addr_garbage_bit),
		.io_tags_in_progress_2_addr_data(_mesh_io_tags_in_progress_2_addr_data),
		.io_tags_in_progress_3_rob_id_valid(_mesh_io_tags_in_progress_3_rob_id_valid),
		.io_tags_in_progress_3_addr_is_acc_addr(_mesh_io_tags_in_progress_3_addr_is_acc_addr),
		.io_tags_in_progress_3_addr_accumulate(_mesh_io_tags_in_progress_3_addr_accumulate),
		.io_tags_in_progress_3_addr_read_full_acc_row(_mesh_io_tags_in_progress_3_addr_read_full_acc_row),
		.io_tags_in_progress_3_addr_garbage_bit(_mesh_io_tags_in_progress_3_addr_garbage_bit),
		.io_tags_in_progress_3_addr_data(_mesh_io_tags_in_progress_3_addr_data),
		.io_tags_in_progress_4_rob_id_valid(_mesh_io_tags_in_progress_4_rob_id_valid),
		.io_tags_in_progress_4_addr_is_acc_addr(_mesh_io_tags_in_progress_4_addr_is_acc_addr),
		.io_tags_in_progress_4_addr_accumulate(_mesh_io_tags_in_progress_4_addr_accumulate),
		.io_tags_in_progress_4_addr_read_full_acc_row(_mesh_io_tags_in_progress_4_addr_read_full_acc_row),
		.io_tags_in_progress_4_addr_garbage_bit(_mesh_io_tags_in_progress_4_addr_garbage_bit),
		.io_tags_in_progress_4_addr_data(_mesh_io_tags_in_progress_4_addr_data),
		.io_tags_in_progress_5_rob_id_valid(_mesh_io_tags_in_progress_5_rob_id_valid),
		.io_tags_in_progress_5_addr_is_acc_addr(_mesh_io_tags_in_progress_5_addr_is_acc_addr),
		.io_tags_in_progress_5_addr_accumulate(_mesh_io_tags_in_progress_5_addr_accumulate),
		.io_tags_in_progress_5_addr_read_full_acc_row(_mesh_io_tags_in_progress_5_addr_read_full_acc_row),
		.io_tags_in_progress_5_addr_garbage_bit(_mesh_io_tags_in_progress_5_addr_garbage_bit),
		.io_tags_in_progress_5_addr_data(_mesh_io_tags_in_progress_5_addr_data)
	);
	assign io_im2col_req_bits_addr_data = _GEN_9[13:0];
	assign io_im2col_req_bits_ocol = ocol;
	assign io_im2col_req_bits_krow = krow;
	assign io_im2col_req_bits_icol = ({1'h0, ocol - 8'h01} * {6'h00, weight_stride}) + {5'h00, krow};
	assign io_im2col_req_bits_stride = weight_stride;
	assign io_im2col_req_bits_row_turn = row_turn;
	assign io_im2col_req_bits_kdim2 = kdim2;
	assign io_im2col_req_bits_row_left = row_left;
	assign io_im2col_req_bits_start_inputting = start_inputting_a;
	assign io_srams_read_0_req_valid = ((read_a | read_b) | read_d) & _mesh_cntl_signals_q_io_enq_ready;
	assign io_srams_read_0_req_bits_addr = (read_b ? _b_address_result_data_T[11:0] : (read_d ? _d_address_result_data_T[11:0] : _a_address_result_data_T[11:0]));
	assign io_srams_read_0_resp_ready = _mesh_io_req_valid_T_1 & ((~_GEN_48 | _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc) | |_mesh_cntl_signals_q_io_deq_bits_d_bank ? ((~_GEN_45 | _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc) | |_mesh_cntl_signals_q_io_deq_bits_b_bank ? ((_GEN_41 & ~_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & (_mesh_cntl_signals_q_io_deq_bits_a_bank == 2'h0)) & ~_GEN_44 : ~_GEN_47) : ~_GEN_50);
	assign io_srams_read_1_req_valid = ((read_a_1 | read_b_1) | read_d_1) & _mesh_cntl_signals_q_io_enq_ready;
	assign io_srams_read_1_req_bits_addr = (read_b_1 ? _b_address_result_data_T[11:0] : (read_d_1 ? _d_address_result_data_T[11:0] : _a_address_result_data_T[11:0]));
	assign io_srams_read_1_resp_ready = _mesh_io_req_valid_T_1 & ((~_GEN_48 | _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc) | (_mesh_cntl_signals_q_io_deq_bits_d_bank != 2'h1) ? ((~_GEN_45 | _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc) | (_mesh_cntl_signals_q_io_deq_bits_b_bank != 2'h1) ? ((_GEN_41 & ~_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & (_mesh_cntl_signals_q_io_deq_bits_a_bank == 2'h1)) & ~_GEN_44 : ~_GEN_47) : ~_GEN_50);
	assign io_srams_read_2_req_valid = ((read_a_2 | read_b_2) | read_d_2) & _mesh_cntl_signals_q_io_enq_ready;
	assign io_srams_read_2_req_bits_addr = (read_b_2 ? _b_address_result_data_T[11:0] : (read_d_2 ? _d_address_result_data_T[11:0] : _a_address_result_data_T[11:0]));
	assign io_srams_read_2_resp_ready = _mesh_io_req_valid_T_1 & ((~_GEN_48 | _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc) | (_mesh_cntl_signals_q_io_deq_bits_d_bank != 2'h2) ? ((~_GEN_45 | _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc) | (_mesh_cntl_signals_q_io_deq_bits_b_bank != 2'h2) ? ((_GEN_41 & ~_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & (_mesh_cntl_signals_q_io_deq_bits_a_bank == 2'h2)) & ~_GEN_44 : ~_GEN_47) : ~_GEN_50);
	assign io_srams_read_3_req_valid = ((read_a_3 | read_b_3) | read_d_3) & _mesh_cntl_signals_q_io_enq_ready;
	assign io_srams_read_3_req_bits_addr = (read_b_3 ? _b_address_result_data_T[11:0] : (read_d_3 ? _d_address_result_data_T[11:0] : _a_address_result_data_T[11:0]));
	assign io_srams_read_3_resp_ready = _mesh_io_req_valid_T_1 & ((~_GEN_48 | _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc) | (_mesh_cntl_signals_q_io_deq_bits_d_bank != 2'h3) ? ((~_GEN_45 | _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc) | (_mesh_cntl_signals_q_io_deq_bits_b_bank != 2'h3) ? ((_GEN_41 & ~_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & &_mesh_cntl_signals_q_io_deq_bits_a_bank) & ~_GEN_44 : ~_GEN_47) : ~_GEN_50);
	assign io_srams_write_0_valid = (((start_array_outputting & _io_acc_write_0_valid_T) & ~_mesh_io_resp_bits_tag_addr_is_acc_addr) & ~is_garbage_addr) & write_this_row;
	assign io_srams_write_0_addr = w_row;
	assign io_srams_write_0_mask_0 = |_mesh_io_resp_bits_tag_cols;
	assign io_srams_write_0_mask_1 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_srams_write_0_mask_2 = w_mask_2;
	assign io_srams_write_0_mask_3 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_srams_write_0_mask_4 = w_mask_4;
	assign io_srams_write_0_mask_5 = w_mask_5;
	assign io_srams_write_0_mask_6 = w_mask_6;
	assign io_srams_write_0_mask_7 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_srams_write_0_mask_8 = w_mask_8;
	assign io_srams_write_0_mask_9 = w_mask_9;
	assign io_srams_write_0_mask_10 = w_mask_10;
	assign io_srams_write_0_mask_11 = w_mask_11;
	assign io_srams_write_0_mask_12 = w_mask_12;
	assign io_srams_write_0_mask_13 = w_mask_13;
	assign io_srams_write_0_mask_14 = w_mask_14;
	assign io_srams_write_0_mask_15 = _mesh_io_resp_bits_tag_cols[4];
	assign io_srams_write_0_data = {(_GEN_61 | ($signed(_activated_wdata_e_clipped_T_78) > -8'sh01) ? _activated_wdata_e_clipped_T_78 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_73) > -8'sh01) ? _activated_wdata_e_clipped_T_73 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_68) > -8'sh01) ? _activated_wdata_e_clipped_T_68 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_63) > -8'sh01) ? _activated_wdata_e_clipped_T_63 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_58) > -8'sh01) ? _activated_wdata_e_clipped_T_58 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_53) > -8'sh01) ? _activated_wdata_e_clipped_T_53 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_48) > -8'sh01) ? _activated_wdata_e_clipped_T_48 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_43) > -8'sh01) ? _activated_wdata_e_clipped_T_43 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_38) > -8'sh01) ? _activated_wdata_e_clipped_T_38 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_33) > -8'sh01) ? _activated_wdata_e_clipped_T_33 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_28) > -8'sh01) ? _activated_wdata_e_clipped_T_28 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_23) > -8'sh01) ? _activated_wdata_e_clipped_T_23 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_18) > -8'sh01) ? _activated_wdata_e_clipped_T_18 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_13) > -8'sh01) ? _activated_wdata_e_clipped_T_13 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_8) > -8'sh01) ? _activated_wdata_e_clipped_T_8 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_3) > -8'sh01) ? _activated_wdata_e_clipped_T_3 : 8'h00)};
	assign io_srams_write_1_valid = (((start_array_outputting & _io_acc_write_1_valid_T) & ~_mesh_io_resp_bits_tag_addr_is_acc_addr) & ~is_garbage_addr) & write_this_row;
	assign io_srams_write_1_addr = w_row;
	assign io_srams_write_1_mask_0 = |_mesh_io_resp_bits_tag_cols;
	assign io_srams_write_1_mask_1 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_srams_write_1_mask_2 = w_mask_2;
	assign io_srams_write_1_mask_3 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_srams_write_1_mask_4 = w_mask_4;
	assign io_srams_write_1_mask_5 = w_mask_5;
	assign io_srams_write_1_mask_6 = w_mask_6;
	assign io_srams_write_1_mask_7 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_srams_write_1_mask_8 = w_mask_8;
	assign io_srams_write_1_mask_9 = w_mask_9;
	assign io_srams_write_1_mask_10 = w_mask_10;
	assign io_srams_write_1_mask_11 = w_mask_11;
	assign io_srams_write_1_mask_12 = w_mask_12;
	assign io_srams_write_1_mask_13 = w_mask_13;
	assign io_srams_write_1_mask_14 = w_mask_14;
	assign io_srams_write_1_mask_15 = _mesh_io_resp_bits_tag_cols[4];
	assign io_srams_write_1_data = {(_GEN_61 | ($signed(_activated_wdata_e_clipped_T_158) > -8'sh01) ? _activated_wdata_e_clipped_T_158 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_153) > -8'sh01) ? _activated_wdata_e_clipped_T_153 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_148) > -8'sh01) ? _activated_wdata_e_clipped_T_148 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_143) > -8'sh01) ? _activated_wdata_e_clipped_T_143 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_138) > -8'sh01) ? _activated_wdata_e_clipped_T_138 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_133) > -8'sh01) ? _activated_wdata_e_clipped_T_133 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_128) > -8'sh01) ? _activated_wdata_e_clipped_T_128 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_123) > -8'sh01) ? _activated_wdata_e_clipped_T_123 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_118) > -8'sh01) ? _activated_wdata_e_clipped_T_118 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_113) > -8'sh01) ? _activated_wdata_e_clipped_T_113 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_108) > -8'sh01) ? _activated_wdata_e_clipped_T_108 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_103) > -8'sh01) ? _activated_wdata_e_clipped_T_103 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_98) > -8'sh01) ? _activated_wdata_e_clipped_T_98 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_93) > -8'sh01) ? _activated_wdata_e_clipped_T_93 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_88) > -8'sh01) ? _activated_wdata_e_clipped_T_88 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_83) > -8'sh01) ? _activated_wdata_e_clipped_T_83 : 8'h00)};
	assign io_srams_write_2_valid = (((start_array_outputting & (w_bank == 2'h2)) & ~_mesh_io_resp_bits_tag_addr_is_acc_addr) & ~is_garbage_addr) & write_this_row;
	assign io_srams_write_2_addr = w_row;
	assign io_srams_write_2_mask_0 = |_mesh_io_resp_bits_tag_cols;
	assign io_srams_write_2_mask_1 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_srams_write_2_mask_2 = w_mask_2;
	assign io_srams_write_2_mask_3 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_srams_write_2_mask_4 = w_mask_4;
	assign io_srams_write_2_mask_5 = w_mask_5;
	assign io_srams_write_2_mask_6 = w_mask_6;
	assign io_srams_write_2_mask_7 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_srams_write_2_mask_8 = w_mask_8;
	assign io_srams_write_2_mask_9 = w_mask_9;
	assign io_srams_write_2_mask_10 = w_mask_10;
	assign io_srams_write_2_mask_11 = w_mask_11;
	assign io_srams_write_2_mask_12 = w_mask_12;
	assign io_srams_write_2_mask_13 = w_mask_13;
	assign io_srams_write_2_mask_14 = w_mask_14;
	assign io_srams_write_2_mask_15 = _mesh_io_resp_bits_tag_cols[4];
	assign io_srams_write_2_data = {(_GEN_61 | ($signed(_activated_wdata_e_clipped_T_238) > -8'sh01) ? _activated_wdata_e_clipped_T_238 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_233) > -8'sh01) ? _activated_wdata_e_clipped_T_233 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_228) > -8'sh01) ? _activated_wdata_e_clipped_T_228 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_223) > -8'sh01) ? _activated_wdata_e_clipped_T_223 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_218) > -8'sh01) ? _activated_wdata_e_clipped_T_218 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_213) > -8'sh01) ? _activated_wdata_e_clipped_T_213 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_208) > -8'sh01) ? _activated_wdata_e_clipped_T_208 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_203) > -8'sh01) ? _activated_wdata_e_clipped_T_203 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_198) > -8'sh01) ? _activated_wdata_e_clipped_T_198 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_193) > -8'sh01) ? _activated_wdata_e_clipped_T_193 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_188) > -8'sh01) ? _activated_wdata_e_clipped_T_188 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_183) > -8'sh01) ? _activated_wdata_e_clipped_T_183 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_178) > -8'sh01) ? _activated_wdata_e_clipped_T_178 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_173) > -8'sh01) ? _activated_wdata_e_clipped_T_173 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_168) > -8'sh01) ? _activated_wdata_e_clipped_T_168 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_163) > -8'sh01) ? _activated_wdata_e_clipped_T_163 : 8'h00)};
	assign io_srams_write_3_valid = (((start_array_outputting & &w_bank) & ~_mesh_io_resp_bits_tag_addr_is_acc_addr) & ~is_garbage_addr) & write_this_row;
	assign io_srams_write_3_addr = w_row;
	assign io_srams_write_3_mask_0 = |_mesh_io_resp_bits_tag_cols;
	assign io_srams_write_3_mask_1 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_srams_write_3_mask_2 = w_mask_2;
	assign io_srams_write_3_mask_3 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_srams_write_3_mask_4 = w_mask_4;
	assign io_srams_write_3_mask_5 = w_mask_5;
	assign io_srams_write_3_mask_6 = w_mask_6;
	assign io_srams_write_3_mask_7 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_srams_write_3_mask_8 = w_mask_8;
	assign io_srams_write_3_mask_9 = w_mask_9;
	assign io_srams_write_3_mask_10 = w_mask_10;
	assign io_srams_write_3_mask_11 = w_mask_11;
	assign io_srams_write_3_mask_12 = w_mask_12;
	assign io_srams_write_3_mask_13 = w_mask_13;
	assign io_srams_write_3_mask_14 = w_mask_14;
	assign io_srams_write_3_mask_15 = _mesh_io_resp_bits_tag_cols[4];
	assign io_srams_write_3_data = {(_GEN_61 | ($signed(_activated_wdata_e_clipped_T_318) > -8'sh01) ? _activated_wdata_e_clipped_T_318 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_313) > -8'sh01) ? _activated_wdata_e_clipped_T_313 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_308) > -8'sh01) ? _activated_wdata_e_clipped_T_308 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_303) > -8'sh01) ? _activated_wdata_e_clipped_T_303 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_298) > -8'sh01) ? _activated_wdata_e_clipped_T_298 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_293) > -8'sh01) ? _activated_wdata_e_clipped_T_293 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_288) > -8'sh01) ? _activated_wdata_e_clipped_T_288 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_283) > -8'sh01) ? _activated_wdata_e_clipped_T_283 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_278) > -8'sh01) ? _activated_wdata_e_clipped_T_278 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_273) > -8'sh01) ? _activated_wdata_e_clipped_T_273 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_268) > -8'sh01) ? _activated_wdata_e_clipped_T_268 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_263) > -8'sh01) ? _activated_wdata_e_clipped_T_263 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_258) > -8'sh01) ? _activated_wdata_e_clipped_T_258 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_253) > -8'sh01) ? _activated_wdata_e_clipped_T_253 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_248) > -8'sh01) ? _activated_wdata_e_clipped_T_248 : 8'h00), (_GEN_61 | ($signed(_activated_wdata_e_clipped_T_243) > -8'sh01) ? _activated_wdata_e_clipped_T_243 : 8'h00)};
	assign io_acc_read_req_0_valid = (read_a_from_acc | read_b_from_acc) | read_d_from_acc;
	assign io_acc_read_req_0_bits_scale_bits = acc_scale_bits;
	assign io_acc_read_req_0_bits_addr = (read_b_from_acc ? _b_address_result_data_T[8:0] : (read_d_from_acc ? _d_address_result_data_T[8:0] : _a_address_result_data_T[8:0]));
	assign io_acc_read_req_0_bits_act = activation;
	assign io_acc_read_req_1_valid = (read_a_from_acc_1 | read_b_from_acc_1) | read_d_from_acc_1;
	assign io_acc_read_req_1_bits_scale_bits = acc_scale_bits;
	assign io_acc_read_req_1_bits_addr = (read_b_from_acc_1 ? _b_address_result_data_T[8:0] : (read_d_from_acc_1 ? _d_address_result_data_T[8:0] : _a_address_result_data_T[8:0]));
	assign io_acc_read_req_1_bits_act = activation;
	assign io_acc_read_resp_0_ready = _mesh_io_req_valid_T_1 & ((_GEN_48 & _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc) & ~_mesh_cntl_signals_q_io_deq_bits_d_bank_acc ? ~_GEN_49 : ((_GEN_45 & _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc) & ~_mesh_cntl_signals_q_io_deq_bits_b_bank_acc ? ~_GEN_46 : ((_GEN_41 & _mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & ~_mesh_cntl_signals_q_io_deq_bits_a_bank_acc) & ~_GEN_42));
	assign io_acc_read_resp_1_ready = _mesh_io_req_valid_T_1 & ((_GEN_48 & _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc) & _mesh_cntl_signals_q_io_deq_bits_d_bank_acc ? ~_GEN_49 : ((_GEN_45 & _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc) & _mesh_cntl_signals_q_io_deq_bits_b_bank_acc ? ~_GEN_46 : ((_GEN_41 & _mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & _mesh_cntl_signals_q_io_deq_bits_a_bank_acc) & ~_GEN_42));
	assign io_acc_write_0_valid = (((start_array_outputting & _io_acc_write_0_valid_T) & _mesh_io_resp_bits_tag_addr_is_acc_addr) & ~is_garbage_addr) & write_this_row;
	assign io_acc_write_0_bits_addr = w_row[8:0];
	assign io_acc_write_0_bits_data_0_0 = {_GEN_62, _mesh_io_resp_bits_data_0_0};
	assign io_acc_write_0_bits_data_1_0 = {_GEN_63, _mesh_io_resp_bits_data_1_0};
	assign io_acc_write_0_bits_data_2_0 = {_GEN_64, _mesh_io_resp_bits_data_2_0};
	assign io_acc_write_0_bits_data_3_0 = {_GEN_65, _mesh_io_resp_bits_data_3_0};
	assign io_acc_write_0_bits_data_4_0 = {_GEN_66, _mesh_io_resp_bits_data_4_0};
	assign io_acc_write_0_bits_data_5_0 = {_GEN_67, _mesh_io_resp_bits_data_5_0};
	assign io_acc_write_0_bits_data_6_0 = {_GEN_68, _mesh_io_resp_bits_data_6_0};
	assign io_acc_write_0_bits_data_7_0 = {_GEN_69, _mesh_io_resp_bits_data_7_0};
	assign io_acc_write_0_bits_data_8_0 = {_GEN_70, _mesh_io_resp_bits_data_8_0};
	assign io_acc_write_0_bits_data_9_0 = {_GEN_71, _mesh_io_resp_bits_data_9_0};
	assign io_acc_write_0_bits_data_10_0 = {_GEN_72, _mesh_io_resp_bits_data_10_0};
	assign io_acc_write_0_bits_data_11_0 = {_GEN_73, _mesh_io_resp_bits_data_11_0};
	assign io_acc_write_0_bits_data_12_0 = {_GEN_74, _mesh_io_resp_bits_data_12_0};
	assign io_acc_write_0_bits_data_13_0 = {_GEN_75, _mesh_io_resp_bits_data_13_0};
	assign io_acc_write_0_bits_data_14_0 = {_GEN_76, _mesh_io_resp_bits_data_14_0};
	assign io_acc_write_0_bits_data_15_0 = {_GEN_77, _mesh_io_resp_bits_data_15_0};
	assign io_acc_write_0_bits_acc = _mesh_io_resp_bits_tag_addr_accumulate;
	assign io_acc_write_0_bits_mask_0 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_0_bits_mask_1 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_0_bits_mask_2 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_0_bits_mask_3 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_0_bits_mask_4 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_0_bits_mask_5 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_0_bits_mask_6 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_0_bits_mask_7 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_0_bits_mask_8 = w_mask_2;
	assign io_acc_write_0_bits_mask_9 = w_mask_2;
	assign io_acc_write_0_bits_mask_10 = w_mask_2;
	assign io_acc_write_0_bits_mask_11 = w_mask_2;
	assign io_acc_write_0_bits_mask_12 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_0_bits_mask_13 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_0_bits_mask_14 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_0_bits_mask_15 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_0_bits_mask_16 = w_mask_4;
	assign io_acc_write_0_bits_mask_17 = w_mask_4;
	assign io_acc_write_0_bits_mask_18 = w_mask_4;
	assign io_acc_write_0_bits_mask_19 = w_mask_4;
	assign io_acc_write_0_bits_mask_20 = w_mask_5;
	assign io_acc_write_0_bits_mask_21 = w_mask_5;
	assign io_acc_write_0_bits_mask_22 = w_mask_5;
	assign io_acc_write_0_bits_mask_23 = w_mask_5;
	assign io_acc_write_0_bits_mask_24 = w_mask_6;
	assign io_acc_write_0_bits_mask_25 = w_mask_6;
	assign io_acc_write_0_bits_mask_26 = w_mask_6;
	assign io_acc_write_0_bits_mask_27 = w_mask_6;
	assign io_acc_write_0_bits_mask_28 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_0_bits_mask_29 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_0_bits_mask_30 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_0_bits_mask_31 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_0_bits_mask_32 = w_mask_8;
	assign io_acc_write_0_bits_mask_33 = w_mask_8;
	assign io_acc_write_0_bits_mask_34 = w_mask_8;
	assign io_acc_write_0_bits_mask_35 = w_mask_8;
	assign io_acc_write_0_bits_mask_36 = w_mask_9;
	assign io_acc_write_0_bits_mask_37 = w_mask_9;
	assign io_acc_write_0_bits_mask_38 = w_mask_9;
	assign io_acc_write_0_bits_mask_39 = w_mask_9;
	assign io_acc_write_0_bits_mask_40 = w_mask_10;
	assign io_acc_write_0_bits_mask_41 = w_mask_10;
	assign io_acc_write_0_bits_mask_42 = w_mask_10;
	assign io_acc_write_0_bits_mask_43 = w_mask_10;
	assign io_acc_write_0_bits_mask_44 = w_mask_11;
	assign io_acc_write_0_bits_mask_45 = w_mask_11;
	assign io_acc_write_0_bits_mask_46 = w_mask_11;
	assign io_acc_write_0_bits_mask_47 = w_mask_11;
	assign io_acc_write_0_bits_mask_48 = w_mask_12;
	assign io_acc_write_0_bits_mask_49 = w_mask_12;
	assign io_acc_write_0_bits_mask_50 = w_mask_12;
	assign io_acc_write_0_bits_mask_51 = w_mask_12;
	assign io_acc_write_0_bits_mask_52 = w_mask_13;
	assign io_acc_write_0_bits_mask_53 = w_mask_13;
	assign io_acc_write_0_bits_mask_54 = w_mask_13;
	assign io_acc_write_0_bits_mask_55 = w_mask_13;
	assign io_acc_write_0_bits_mask_56 = w_mask_14;
	assign io_acc_write_0_bits_mask_57 = w_mask_14;
	assign io_acc_write_0_bits_mask_58 = w_mask_14;
	assign io_acc_write_0_bits_mask_59 = w_mask_14;
	assign io_acc_write_0_bits_mask_60 = _mesh_io_resp_bits_tag_cols[4];
	assign io_acc_write_0_bits_mask_61 = _mesh_io_resp_bits_tag_cols[4];
	assign io_acc_write_0_bits_mask_62 = _mesh_io_resp_bits_tag_cols[4];
	assign io_acc_write_0_bits_mask_63 = _mesh_io_resp_bits_tag_cols[4];
	assign io_acc_write_1_valid = (((start_array_outputting & _io_acc_write_1_valid_T) & _mesh_io_resp_bits_tag_addr_is_acc_addr) & ~is_garbage_addr) & write_this_row;
	assign io_acc_write_1_bits_addr = w_row[8:0];
	assign io_acc_write_1_bits_data_0_0 = {_GEN_62, _mesh_io_resp_bits_data_0_0};
	assign io_acc_write_1_bits_data_1_0 = {_GEN_63, _mesh_io_resp_bits_data_1_0};
	assign io_acc_write_1_bits_data_2_0 = {_GEN_64, _mesh_io_resp_bits_data_2_0};
	assign io_acc_write_1_bits_data_3_0 = {_GEN_65, _mesh_io_resp_bits_data_3_0};
	assign io_acc_write_1_bits_data_4_0 = {_GEN_66, _mesh_io_resp_bits_data_4_0};
	assign io_acc_write_1_bits_data_5_0 = {_GEN_67, _mesh_io_resp_bits_data_5_0};
	assign io_acc_write_1_bits_data_6_0 = {_GEN_68, _mesh_io_resp_bits_data_6_0};
	assign io_acc_write_1_bits_data_7_0 = {_GEN_69, _mesh_io_resp_bits_data_7_0};
	assign io_acc_write_1_bits_data_8_0 = {_GEN_70, _mesh_io_resp_bits_data_8_0};
	assign io_acc_write_1_bits_data_9_0 = {_GEN_71, _mesh_io_resp_bits_data_9_0};
	assign io_acc_write_1_bits_data_10_0 = {_GEN_72, _mesh_io_resp_bits_data_10_0};
	assign io_acc_write_1_bits_data_11_0 = {_GEN_73, _mesh_io_resp_bits_data_11_0};
	assign io_acc_write_1_bits_data_12_0 = {_GEN_74, _mesh_io_resp_bits_data_12_0};
	assign io_acc_write_1_bits_data_13_0 = {_GEN_75, _mesh_io_resp_bits_data_13_0};
	assign io_acc_write_1_bits_data_14_0 = {_GEN_76, _mesh_io_resp_bits_data_14_0};
	assign io_acc_write_1_bits_data_15_0 = {_GEN_77, _mesh_io_resp_bits_data_15_0};
	assign io_acc_write_1_bits_acc = _mesh_io_resp_bits_tag_addr_accumulate;
	assign io_acc_write_1_bits_mask_0 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_1_bits_mask_1 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_1_bits_mask_2 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_1_bits_mask_3 = |_mesh_io_resp_bits_tag_cols;
	assign io_acc_write_1_bits_mask_4 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_1_bits_mask_5 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_1_bits_mask_6 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_1_bits_mask_7 = |_mesh_io_resp_bits_tag_cols[4:1];
	assign io_acc_write_1_bits_mask_8 = w_mask_2;
	assign io_acc_write_1_bits_mask_9 = w_mask_2;
	assign io_acc_write_1_bits_mask_10 = w_mask_2;
	assign io_acc_write_1_bits_mask_11 = w_mask_2;
	assign io_acc_write_1_bits_mask_12 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_1_bits_mask_13 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_1_bits_mask_14 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_1_bits_mask_15 = |_mesh_io_resp_bits_tag_cols[4:2];
	assign io_acc_write_1_bits_mask_16 = w_mask_4;
	assign io_acc_write_1_bits_mask_17 = w_mask_4;
	assign io_acc_write_1_bits_mask_18 = w_mask_4;
	assign io_acc_write_1_bits_mask_19 = w_mask_4;
	assign io_acc_write_1_bits_mask_20 = w_mask_5;
	assign io_acc_write_1_bits_mask_21 = w_mask_5;
	assign io_acc_write_1_bits_mask_22 = w_mask_5;
	assign io_acc_write_1_bits_mask_23 = w_mask_5;
	assign io_acc_write_1_bits_mask_24 = w_mask_6;
	assign io_acc_write_1_bits_mask_25 = w_mask_6;
	assign io_acc_write_1_bits_mask_26 = w_mask_6;
	assign io_acc_write_1_bits_mask_27 = w_mask_6;
	assign io_acc_write_1_bits_mask_28 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_1_bits_mask_29 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_1_bits_mask_30 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_1_bits_mask_31 = |_mesh_io_resp_bits_tag_cols[4:3];
	assign io_acc_write_1_bits_mask_32 = w_mask_8;
	assign io_acc_write_1_bits_mask_33 = w_mask_8;
	assign io_acc_write_1_bits_mask_34 = w_mask_8;
	assign io_acc_write_1_bits_mask_35 = w_mask_8;
	assign io_acc_write_1_bits_mask_36 = w_mask_9;
	assign io_acc_write_1_bits_mask_37 = w_mask_9;
	assign io_acc_write_1_bits_mask_38 = w_mask_9;
	assign io_acc_write_1_bits_mask_39 = w_mask_9;
	assign io_acc_write_1_bits_mask_40 = w_mask_10;
	assign io_acc_write_1_bits_mask_41 = w_mask_10;
	assign io_acc_write_1_bits_mask_42 = w_mask_10;
	assign io_acc_write_1_bits_mask_43 = w_mask_10;
	assign io_acc_write_1_bits_mask_44 = w_mask_11;
	assign io_acc_write_1_bits_mask_45 = w_mask_11;
	assign io_acc_write_1_bits_mask_46 = w_mask_11;
	assign io_acc_write_1_bits_mask_47 = w_mask_11;
	assign io_acc_write_1_bits_mask_48 = w_mask_12;
	assign io_acc_write_1_bits_mask_49 = w_mask_12;
	assign io_acc_write_1_bits_mask_50 = w_mask_12;
	assign io_acc_write_1_bits_mask_51 = w_mask_12;
	assign io_acc_write_1_bits_mask_52 = w_mask_13;
	assign io_acc_write_1_bits_mask_53 = w_mask_13;
	assign io_acc_write_1_bits_mask_54 = w_mask_13;
	assign io_acc_write_1_bits_mask_55 = w_mask_13;
	assign io_acc_write_1_bits_mask_56 = w_mask_14;
	assign io_acc_write_1_bits_mask_57 = w_mask_14;
	assign io_acc_write_1_bits_mask_58 = w_mask_14;
	assign io_acc_write_1_bits_mask_59 = w_mask_14;
	assign io_acc_write_1_bits_mask_60 = _mesh_io_resp_bits_tag_cols[4];
	assign io_acc_write_1_bits_mask_61 = _mesh_io_resp_bits_tag_cols[4];
	assign io_acc_write_1_bits_mask_62 = _mesh_io_resp_bits_tag_cols[4];
	assign io_acc_write_1_bits_mask_63 = _mesh_io_resp_bits_tag_cols[4];
	assign io_completed_valid = (mesh_completed_rob_id_fire ? _GEN_80 | _GEN_29 : ((pending_completed_rob_ids_0_valid | pending_completed_rob_ids_1_valid) | _GEN_80) | _GEN_29);
	assign io_completed_bits = (mesh_completed_rob_id_fire ? _GEN_81 : (pending_completed_rob_ids_0_valid ? pending_completed_rob_ids_0_bits : (pending_completed_rob_ids_1_valid ? pending_completed_rob_ids_1_bits : _GEN_81)));
	assign io_busy = _cmd_q_io_deq_valid_0 | matmul_in_progress;
	assign io_counter_event_signal_24 = io_counter_event_signal_24_0;
	assign io_counter_event_signal_25 = &control_state | _mesh_io_req_bits_flush_T;
	assign io_counter_event_signal_26 = ~_mesh_cntl_signals_q_io_enq_ready & computing;
	assign io_counter_event_signal_27 = ((_cmd_q_io_deq_valid_0 & DoPreloads_0) & _cmd_q_io_deq_valid_1) & raw_hazard_pre;
	assign io_counter_event_signal_28 = ((((_cmd_q_io_deq_valid_0 & DoPreloads_1) & _cmd_q_io_deq_valid_1) & DoComputes_0) & _cmd_q_io_deq_valid_2) & raw_hazard_mulpre;
	assign io_counter_event_signal_29 = (~_GEN_82 & ~_mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & ~_mesh_cntl_signals_q_io_deq_bits_im2colling;
	assign io_counter_event_signal_30 = ~_GEN_83 & ~_mesh_cntl_signals_q_io_deq_bits_b_read_from_acc;
	assign io_counter_event_signal_31 = ~_GEN_84 & ~_mesh_cntl_signals_q_io_deq_bits_d_read_from_acc;
	assign io_counter_event_signal_32 = (~_GEN_82 & _mesh_cntl_signals_q_io_deq_bits_a_read_from_acc) & ~_mesh_cntl_signals_q_io_deq_bits_im2colling;
	assign io_counter_event_signal_33 = ~_GEN_83 & _mesh_cntl_signals_q_io_deq_bits_b_read_from_acc;
	assign io_counter_event_signal_34 = ~_GEN_84 & _mesh_cntl_signals_q_io_deq_bits_d_read_from_acc;
	assign io_counter_event_signal_35 = _mesh_cntl_signals_q_io_deq_bits_a_garbage;
	assign io_counter_event_signal_36 = _mesh_cntl_signals_q_io_deq_bits_b_garbage;
	assign io_counter_event_signal_37 = _mesh_cntl_signals_q_io_deq_bits_d_garbage;
endmodule
