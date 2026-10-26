module VectorScalarMultiplier_1 (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_in_0,
	io_req_bits_in_1,
	io_req_bits_in_2,
	io_req_bits_in_3,
	io_req_bits_in_4,
	io_req_bits_in_5,
	io_req_bits_in_6,
	io_req_bits_in_7,
	io_req_bits_in_8,
	io_req_bits_in_9,
	io_req_bits_in_10,
	io_req_bits_in_11,
	io_req_bits_in_12,
	io_req_bits_in_13,
	io_req_bits_in_14,
	io_req_bits_in_15,
	io_req_bits_repeats,
	io_req_bits_last,
	io_req_bits_tag_addr,
	io_req_bits_tag_mask_0,
	io_req_bits_tag_mask_1,
	io_req_bits_tag_mask_2,
	io_req_bits_tag_mask_3,
	io_req_bits_tag_mask_4,
	io_req_bits_tag_mask_5,
	io_req_bits_tag_mask_6,
	io_req_bits_tag_mask_7,
	io_req_bits_tag_mask_8,
	io_req_bits_tag_mask_9,
	io_req_bits_tag_mask_10,
	io_req_bits_tag_mask_11,
	io_req_bits_tag_mask_12,
	io_req_bits_tag_mask_13,
	io_req_bits_tag_mask_14,
	io_req_bits_tag_mask_15,
	io_req_bits_tag_mask_16,
	io_req_bits_tag_mask_17,
	io_req_bits_tag_mask_18,
	io_req_bits_tag_mask_19,
	io_req_bits_tag_mask_20,
	io_req_bits_tag_mask_21,
	io_req_bits_tag_mask_22,
	io_req_bits_tag_mask_23,
	io_req_bits_tag_mask_24,
	io_req_bits_tag_mask_25,
	io_req_bits_tag_mask_26,
	io_req_bits_tag_mask_27,
	io_req_bits_tag_mask_28,
	io_req_bits_tag_mask_29,
	io_req_bits_tag_mask_30,
	io_req_bits_tag_mask_31,
	io_req_bits_tag_mask_32,
	io_req_bits_tag_mask_33,
	io_req_bits_tag_mask_34,
	io_req_bits_tag_mask_35,
	io_req_bits_tag_mask_36,
	io_req_bits_tag_mask_37,
	io_req_bits_tag_mask_38,
	io_req_bits_tag_mask_39,
	io_req_bits_tag_mask_40,
	io_req_bits_tag_mask_41,
	io_req_bits_tag_mask_42,
	io_req_bits_tag_mask_43,
	io_req_bits_tag_mask_44,
	io_req_bits_tag_mask_45,
	io_req_bits_tag_mask_46,
	io_req_bits_tag_mask_47,
	io_req_bits_tag_mask_48,
	io_req_bits_tag_mask_49,
	io_req_bits_tag_mask_50,
	io_req_bits_tag_mask_51,
	io_req_bits_tag_mask_52,
	io_req_bits_tag_mask_53,
	io_req_bits_tag_mask_54,
	io_req_bits_tag_mask_55,
	io_req_bits_tag_mask_56,
	io_req_bits_tag_mask_57,
	io_req_bits_tag_mask_58,
	io_req_bits_tag_mask_59,
	io_req_bits_tag_mask_60,
	io_req_bits_tag_mask_61,
	io_req_bits_tag_mask_62,
	io_req_bits_tag_mask_63,
	io_req_bits_tag_is_acc,
	io_req_bits_tag_accumulate,
	io_req_bits_tag_bytes_read,
	io_req_bits_tag_cmd_id,
	io_resp_ready,
	io_resp_valid,
	io_resp_bits_out_0,
	io_resp_bits_out_1,
	io_resp_bits_out_2,
	io_resp_bits_out_3,
	io_resp_bits_out_4,
	io_resp_bits_out_5,
	io_resp_bits_out_6,
	io_resp_bits_out_7,
	io_resp_bits_out_8,
	io_resp_bits_out_9,
	io_resp_bits_out_10,
	io_resp_bits_out_11,
	io_resp_bits_out_12,
	io_resp_bits_out_13,
	io_resp_bits_out_14,
	io_resp_bits_out_15,
	io_resp_bits_row,
	io_resp_bits_last,
	io_resp_bits_tag_addr,
	io_resp_bits_tag_mask_0,
	io_resp_bits_tag_mask_1,
	io_resp_bits_tag_mask_2,
	io_resp_bits_tag_mask_3,
	io_resp_bits_tag_mask_4,
	io_resp_bits_tag_mask_5,
	io_resp_bits_tag_mask_6,
	io_resp_bits_tag_mask_7,
	io_resp_bits_tag_mask_8,
	io_resp_bits_tag_mask_9,
	io_resp_bits_tag_mask_10,
	io_resp_bits_tag_mask_11,
	io_resp_bits_tag_mask_12,
	io_resp_bits_tag_mask_13,
	io_resp_bits_tag_mask_14,
	io_resp_bits_tag_mask_15,
	io_resp_bits_tag_mask_16,
	io_resp_bits_tag_mask_17,
	io_resp_bits_tag_mask_18,
	io_resp_bits_tag_mask_19,
	io_resp_bits_tag_mask_20,
	io_resp_bits_tag_mask_21,
	io_resp_bits_tag_mask_22,
	io_resp_bits_tag_mask_23,
	io_resp_bits_tag_mask_24,
	io_resp_bits_tag_mask_25,
	io_resp_bits_tag_mask_26,
	io_resp_bits_tag_mask_27,
	io_resp_bits_tag_mask_28,
	io_resp_bits_tag_mask_29,
	io_resp_bits_tag_mask_30,
	io_resp_bits_tag_mask_31,
	io_resp_bits_tag_mask_32,
	io_resp_bits_tag_mask_33,
	io_resp_bits_tag_mask_34,
	io_resp_bits_tag_mask_35,
	io_resp_bits_tag_mask_36,
	io_resp_bits_tag_mask_37,
	io_resp_bits_tag_mask_38,
	io_resp_bits_tag_mask_39,
	io_resp_bits_tag_mask_40,
	io_resp_bits_tag_mask_41,
	io_resp_bits_tag_mask_42,
	io_resp_bits_tag_mask_43,
	io_resp_bits_tag_mask_44,
	io_resp_bits_tag_mask_45,
	io_resp_bits_tag_mask_46,
	io_resp_bits_tag_mask_47,
	io_resp_bits_tag_mask_48,
	io_resp_bits_tag_mask_49,
	io_resp_bits_tag_mask_50,
	io_resp_bits_tag_mask_51,
	io_resp_bits_tag_mask_52,
	io_resp_bits_tag_mask_53,
	io_resp_bits_tag_mask_54,
	io_resp_bits_tag_mask_55,
	io_resp_bits_tag_mask_56,
	io_resp_bits_tag_mask_57,
	io_resp_bits_tag_mask_58,
	io_resp_bits_tag_mask_59,
	io_resp_bits_tag_mask_60,
	io_resp_bits_tag_mask_61,
	io_resp_bits_tag_mask_62,
	io_resp_bits_tag_mask_63,
	io_resp_bits_tag_is_acc,
	io_resp_bits_tag_accumulate,
	io_resp_bits_tag_bytes_read,
	io_resp_bits_tag_cmd_id
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [31:0] io_req_bits_in_0;
	input [31:0] io_req_bits_in_1;
	input [31:0] io_req_bits_in_2;
	input [31:0] io_req_bits_in_3;
	input [31:0] io_req_bits_in_4;
	input [31:0] io_req_bits_in_5;
	input [31:0] io_req_bits_in_6;
	input [31:0] io_req_bits_in_7;
	input [31:0] io_req_bits_in_8;
	input [31:0] io_req_bits_in_9;
	input [31:0] io_req_bits_in_10;
	input [31:0] io_req_bits_in_11;
	input [31:0] io_req_bits_in_12;
	input [31:0] io_req_bits_in_13;
	input [31:0] io_req_bits_in_14;
	input [31:0] io_req_bits_in_15;
	input [15:0] io_req_bits_repeats;
	input io_req_bits_last;
	input [13:0] io_req_bits_tag_addr;
	input io_req_bits_tag_mask_0;
	input io_req_bits_tag_mask_1;
	input io_req_bits_tag_mask_2;
	input io_req_bits_tag_mask_3;
	input io_req_bits_tag_mask_4;
	input io_req_bits_tag_mask_5;
	input io_req_bits_tag_mask_6;
	input io_req_bits_tag_mask_7;
	input io_req_bits_tag_mask_8;
	input io_req_bits_tag_mask_9;
	input io_req_bits_tag_mask_10;
	input io_req_bits_tag_mask_11;
	input io_req_bits_tag_mask_12;
	input io_req_bits_tag_mask_13;
	input io_req_bits_tag_mask_14;
	input io_req_bits_tag_mask_15;
	input io_req_bits_tag_mask_16;
	input io_req_bits_tag_mask_17;
	input io_req_bits_tag_mask_18;
	input io_req_bits_tag_mask_19;
	input io_req_bits_tag_mask_20;
	input io_req_bits_tag_mask_21;
	input io_req_bits_tag_mask_22;
	input io_req_bits_tag_mask_23;
	input io_req_bits_tag_mask_24;
	input io_req_bits_tag_mask_25;
	input io_req_bits_tag_mask_26;
	input io_req_bits_tag_mask_27;
	input io_req_bits_tag_mask_28;
	input io_req_bits_tag_mask_29;
	input io_req_bits_tag_mask_30;
	input io_req_bits_tag_mask_31;
	input io_req_bits_tag_mask_32;
	input io_req_bits_tag_mask_33;
	input io_req_bits_tag_mask_34;
	input io_req_bits_tag_mask_35;
	input io_req_bits_tag_mask_36;
	input io_req_bits_tag_mask_37;
	input io_req_bits_tag_mask_38;
	input io_req_bits_tag_mask_39;
	input io_req_bits_tag_mask_40;
	input io_req_bits_tag_mask_41;
	input io_req_bits_tag_mask_42;
	input io_req_bits_tag_mask_43;
	input io_req_bits_tag_mask_44;
	input io_req_bits_tag_mask_45;
	input io_req_bits_tag_mask_46;
	input io_req_bits_tag_mask_47;
	input io_req_bits_tag_mask_48;
	input io_req_bits_tag_mask_49;
	input io_req_bits_tag_mask_50;
	input io_req_bits_tag_mask_51;
	input io_req_bits_tag_mask_52;
	input io_req_bits_tag_mask_53;
	input io_req_bits_tag_mask_54;
	input io_req_bits_tag_mask_55;
	input io_req_bits_tag_mask_56;
	input io_req_bits_tag_mask_57;
	input io_req_bits_tag_mask_58;
	input io_req_bits_tag_mask_59;
	input io_req_bits_tag_mask_60;
	input io_req_bits_tag_mask_61;
	input io_req_bits_tag_mask_62;
	input io_req_bits_tag_mask_63;
	input io_req_bits_tag_is_acc;
	input io_req_bits_tag_accumulate;
	input [7:0] io_req_bits_tag_bytes_read;
	input [7:0] io_req_bits_tag_cmd_id;
	input io_resp_ready;
	output wire io_resp_valid;
	output wire [31:0] io_resp_bits_out_0;
	output wire [31:0] io_resp_bits_out_1;
	output wire [31:0] io_resp_bits_out_2;
	output wire [31:0] io_resp_bits_out_3;
	output wire [31:0] io_resp_bits_out_4;
	output wire [31:0] io_resp_bits_out_5;
	output wire [31:0] io_resp_bits_out_6;
	output wire [31:0] io_resp_bits_out_7;
	output wire [31:0] io_resp_bits_out_8;
	output wire [31:0] io_resp_bits_out_9;
	output wire [31:0] io_resp_bits_out_10;
	output wire [31:0] io_resp_bits_out_11;
	output wire [31:0] io_resp_bits_out_12;
	output wire [31:0] io_resp_bits_out_13;
	output wire [31:0] io_resp_bits_out_14;
	output wire [31:0] io_resp_bits_out_15;
	output wire [15:0] io_resp_bits_row;
	output wire io_resp_bits_last;
	output wire [13:0] io_resp_bits_tag_addr;
	output wire io_resp_bits_tag_mask_0;
	output wire io_resp_bits_tag_mask_1;
	output wire io_resp_bits_tag_mask_2;
	output wire io_resp_bits_tag_mask_3;
	output wire io_resp_bits_tag_mask_4;
	output wire io_resp_bits_tag_mask_5;
	output wire io_resp_bits_tag_mask_6;
	output wire io_resp_bits_tag_mask_7;
	output wire io_resp_bits_tag_mask_8;
	output wire io_resp_bits_tag_mask_9;
	output wire io_resp_bits_tag_mask_10;
	output wire io_resp_bits_tag_mask_11;
	output wire io_resp_bits_tag_mask_12;
	output wire io_resp_bits_tag_mask_13;
	output wire io_resp_bits_tag_mask_14;
	output wire io_resp_bits_tag_mask_15;
	output wire io_resp_bits_tag_mask_16;
	output wire io_resp_bits_tag_mask_17;
	output wire io_resp_bits_tag_mask_18;
	output wire io_resp_bits_tag_mask_19;
	output wire io_resp_bits_tag_mask_20;
	output wire io_resp_bits_tag_mask_21;
	output wire io_resp_bits_tag_mask_22;
	output wire io_resp_bits_tag_mask_23;
	output wire io_resp_bits_tag_mask_24;
	output wire io_resp_bits_tag_mask_25;
	output wire io_resp_bits_tag_mask_26;
	output wire io_resp_bits_tag_mask_27;
	output wire io_resp_bits_tag_mask_28;
	output wire io_resp_bits_tag_mask_29;
	output wire io_resp_bits_tag_mask_30;
	output wire io_resp_bits_tag_mask_31;
	output wire io_resp_bits_tag_mask_32;
	output wire io_resp_bits_tag_mask_33;
	output wire io_resp_bits_tag_mask_34;
	output wire io_resp_bits_tag_mask_35;
	output wire io_resp_bits_tag_mask_36;
	output wire io_resp_bits_tag_mask_37;
	output wire io_resp_bits_tag_mask_38;
	output wire io_resp_bits_tag_mask_39;
	output wire io_resp_bits_tag_mask_40;
	output wire io_resp_bits_tag_mask_41;
	output wire io_resp_bits_tag_mask_42;
	output wire io_resp_bits_tag_mask_43;
	output wire io_resp_bits_tag_mask_44;
	output wire io_resp_bits_tag_mask_45;
	output wire io_resp_bits_tag_mask_46;
	output wire io_resp_bits_tag_mask_47;
	output wire io_resp_bits_tag_mask_48;
	output wire io_resp_bits_tag_mask_49;
	output wire io_resp_bits_tag_mask_50;
	output wire io_resp_bits_tag_mask_51;
	output wire io_resp_bits_tag_mask_52;
	output wire io_resp_bits_tag_mask_53;
	output wire io_resp_bits_tag_mask_54;
	output wire io_resp_bits_tag_mask_55;
	output wire io_resp_bits_tag_mask_56;
	output wire io_resp_bits_tag_mask_57;
	output wire io_resp_bits_tag_mask_58;
	output wire io_resp_bits_tag_mask_59;
	output wire io_resp_bits_tag_mask_60;
	output wire io_resp_bits_tag_mask_61;
	output wire io_resp_bits_tag_mask_62;
	output wire io_resp_bits_tag_mask_63;
	output wire io_resp_bits_tag_is_acc;
	output wire io_resp_bits_tag_accumulate;
	output wire [7:0] io_resp_bits_tag_bytes_read;
	output wire [7:0] io_resp_bits_tag_cmd_id;
	wire in_fire;
	wire _pipe_io_in_ready;
	reg in_valid;
	reg [31:0] in_bits_in_0;
	reg [31:0] in_bits_in_1;
	reg [31:0] in_bits_in_2;
	reg [31:0] in_bits_in_3;
	reg [31:0] in_bits_in_4;
	reg [31:0] in_bits_in_5;
	reg [31:0] in_bits_in_6;
	reg [31:0] in_bits_in_7;
	reg [31:0] in_bits_in_8;
	reg [31:0] in_bits_in_9;
	reg [31:0] in_bits_in_10;
	reg [31:0] in_bits_in_11;
	reg [31:0] in_bits_in_12;
	reg [31:0] in_bits_in_13;
	reg [31:0] in_bits_in_14;
	reg [31:0] in_bits_in_15;
	reg [15:0] in_bits_repeats;
	reg in_bits_last;
	reg [13:0] in_bits_tag_addr;
	reg in_bits_tag_mask_0;
	reg in_bits_tag_mask_1;
	reg in_bits_tag_mask_2;
	reg in_bits_tag_mask_3;
	reg in_bits_tag_mask_4;
	reg in_bits_tag_mask_5;
	reg in_bits_tag_mask_6;
	reg in_bits_tag_mask_7;
	reg in_bits_tag_mask_8;
	reg in_bits_tag_mask_9;
	reg in_bits_tag_mask_10;
	reg in_bits_tag_mask_11;
	reg in_bits_tag_mask_12;
	reg in_bits_tag_mask_13;
	reg in_bits_tag_mask_14;
	reg in_bits_tag_mask_15;
	reg in_bits_tag_mask_16;
	reg in_bits_tag_mask_17;
	reg in_bits_tag_mask_18;
	reg in_bits_tag_mask_19;
	reg in_bits_tag_mask_20;
	reg in_bits_tag_mask_21;
	reg in_bits_tag_mask_22;
	reg in_bits_tag_mask_23;
	reg in_bits_tag_mask_24;
	reg in_bits_tag_mask_25;
	reg in_bits_tag_mask_26;
	reg in_bits_tag_mask_27;
	reg in_bits_tag_mask_28;
	reg in_bits_tag_mask_29;
	reg in_bits_tag_mask_30;
	reg in_bits_tag_mask_31;
	reg in_bits_tag_mask_32;
	reg in_bits_tag_mask_33;
	reg in_bits_tag_mask_34;
	reg in_bits_tag_mask_35;
	reg in_bits_tag_mask_36;
	reg in_bits_tag_mask_37;
	reg in_bits_tag_mask_38;
	reg in_bits_tag_mask_39;
	reg in_bits_tag_mask_40;
	reg in_bits_tag_mask_41;
	reg in_bits_tag_mask_42;
	reg in_bits_tag_mask_43;
	reg in_bits_tag_mask_44;
	reg in_bits_tag_mask_45;
	reg in_bits_tag_mask_46;
	reg in_bits_tag_mask_47;
	reg in_bits_tag_mask_48;
	reg in_bits_tag_mask_49;
	reg in_bits_tag_mask_50;
	reg in_bits_tag_mask_51;
	reg in_bits_tag_mask_52;
	reg in_bits_tag_mask_53;
	reg in_bits_tag_mask_54;
	reg in_bits_tag_mask_55;
	reg in_bits_tag_mask_56;
	reg in_bits_tag_mask_57;
	reg in_bits_tag_mask_58;
	reg in_bits_tag_mask_59;
	reg in_bits_tag_mask_60;
	reg in_bits_tag_mask_61;
	reg in_bits_tag_mask_62;
	reg in_bits_tag_mask_63;
	reg in_bits_tag_is_acc;
	reg in_bits_tag_accumulate;
	reg [7:0] in_bits_tag_bytes_read;
	reg [7:0] in_bits_tag_cmd_id;
	wire _pipe_io_in_bits_last_T = in_bits_repeats == 16'h0000;
	wire io_req_ready_0 = ~in_valid | (_pipe_io_in_bits_last_T & in_fire);
	assign in_fire = _pipe_io_in_ready & in_valid;
	wire _GEN = io_req_ready_0 & io_req_valid;
	always @(posedge clock) begin
		if (reset)
			in_valid <= 1'h0;
		else if (_GEN)
			in_valid <= io_req_valid;
		else
			in_valid <= ~(in_fire & _pipe_io_in_bits_last_T) & in_valid;
		if (_GEN) begin
			in_bits_in_0 <= io_req_bits_in_0;
			in_bits_in_1 <= io_req_bits_in_1;
			in_bits_in_2 <= io_req_bits_in_2;
			in_bits_in_3 <= io_req_bits_in_3;
			in_bits_in_4 <= io_req_bits_in_4;
			in_bits_in_5 <= io_req_bits_in_5;
			in_bits_in_6 <= io_req_bits_in_6;
			in_bits_in_7 <= io_req_bits_in_7;
			in_bits_in_8 <= io_req_bits_in_8;
			in_bits_in_9 <= io_req_bits_in_9;
			in_bits_in_10 <= io_req_bits_in_10;
			in_bits_in_11 <= io_req_bits_in_11;
			in_bits_in_12 <= io_req_bits_in_12;
			in_bits_in_13 <= io_req_bits_in_13;
			in_bits_in_14 <= io_req_bits_in_14;
			in_bits_in_15 <= io_req_bits_in_15;
			in_bits_repeats <= io_req_bits_repeats;
			in_bits_last <= io_req_bits_last;
			in_bits_tag_addr <= io_req_bits_tag_addr;
			in_bits_tag_mask_0 <= io_req_bits_tag_mask_0;
			in_bits_tag_mask_1 <= io_req_bits_tag_mask_1;
			in_bits_tag_mask_2 <= io_req_bits_tag_mask_2;
			in_bits_tag_mask_3 <= io_req_bits_tag_mask_3;
			in_bits_tag_mask_4 <= io_req_bits_tag_mask_4;
			in_bits_tag_mask_5 <= io_req_bits_tag_mask_5;
			in_bits_tag_mask_6 <= io_req_bits_tag_mask_6;
			in_bits_tag_mask_7 <= io_req_bits_tag_mask_7;
			in_bits_tag_mask_8 <= io_req_bits_tag_mask_8;
			in_bits_tag_mask_9 <= io_req_bits_tag_mask_9;
			in_bits_tag_mask_10 <= io_req_bits_tag_mask_10;
			in_bits_tag_mask_11 <= io_req_bits_tag_mask_11;
			in_bits_tag_mask_12 <= io_req_bits_tag_mask_12;
			in_bits_tag_mask_13 <= io_req_bits_tag_mask_13;
			in_bits_tag_mask_14 <= io_req_bits_tag_mask_14;
			in_bits_tag_mask_15 <= io_req_bits_tag_mask_15;
			in_bits_tag_mask_16 <= io_req_bits_tag_mask_16;
			in_bits_tag_mask_17 <= io_req_bits_tag_mask_17;
			in_bits_tag_mask_18 <= io_req_bits_tag_mask_18;
			in_bits_tag_mask_19 <= io_req_bits_tag_mask_19;
			in_bits_tag_mask_20 <= io_req_bits_tag_mask_20;
			in_bits_tag_mask_21 <= io_req_bits_tag_mask_21;
			in_bits_tag_mask_22 <= io_req_bits_tag_mask_22;
			in_bits_tag_mask_23 <= io_req_bits_tag_mask_23;
			in_bits_tag_mask_24 <= io_req_bits_tag_mask_24;
			in_bits_tag_mask_25 <= io_req_bits_tag_mask_25;
			in_bits_tag_mask_26 <= io_req_bits_tag_mask_26;
			in_bits_tag_mask_27 <= io_req_bits_tag_mask_27;
			in_bits_tag_mask_28 <= io_req_bits_tag_mask_28;
			in_bits_tag_mask_29 <= io_req_bits_tag_mask_29;
			in_bits_tag_mask_30 <= io_req_bits_tag_mask_30;
			in_bits_tag_mask_31 <= io_req_bits_tag_mask_31;
			in_bits_tag_mask_32 <= io_req_bits_tag_mask_32;
			in_bits_tag_mask_33 <= io_req_bits_tag_mask_33;
			in_bits_tag_mask_34 <= io_req_bits_tag_mask_34;
			in_bits_tag_mask_35 <= io_req_bits_tag_mask_35;
			in_bits_tag_mask_36 <= io_req_bits_tag_mask_36;
			in_bits_tag_mask_37 <= io_req_bits_tag_mask_37;
			in_bits_tag_mask_38 <= io_req_bits_tag_mask_38;
			in_bits_tag_mask_39 <= io_req_bits_tag_mask_39;
			in_bits_tag_mask_40 <= io_req_bits_tag_mask_40;
			in_bits_tag_mask_41 <= io_req_bits_tag_mask_41;
			in_bits_tag_mask_42 <= io_req_bits_tag_mask_42;
			in_bits_tag_mask_43 <= io_req_bits_tag_mask_43;
			in_bits_tag_mask_44 <= io_req_bits_tag_mask_44;
			in_bits_tag_mask_45 <= io_req_bits_tag_mask_45;
			in_bits_tag_mask_46 <= io_req_bits_tag_mask_46;
			in_bits_tag_mask_47 <= io_req_bits_tag_mask_47;
			in_bits_tag_mask_48 <= io_req_bits_tag_mask_48;
			in_bits_tag_mask_49 <= io_req_bits_tag_mask_49;
			in_bits_tag_mask_50 <= io_req_bits_tag_mask_50;
			in_bits_tag_mask_51 <= io_req_bits_tag_mask_51;
			in_bits_tag_mask_52 <= io_req_bits_tag_mask_52;
			in_bits_tag_mask_53 <= io_req_bits_tag_mask_53;
			in_bits_tag_mask_54 <= io_req_bits_tag_mask_54;
			in_bits_tag_mask_55 <= io_req_bits_tag_mask_55;
			in_bits_tag_mask_56 <= io_req_bits_tag_mask_56;
			in_bits_tag_mask_57 <= io_req_bits_tag_mask_57;
			in_bits_tag_mask_58 <= io_req_bits_tag_mask_58;
			in_bits_tag_mask_59 <= io_req_bits_tag_mask_59;
			in_bits_tag_mask_60 <= io_req_bits_tag_mask_60;
			in_bits_tag_mask_61 <= io_req_bits_tag_mask_61;
			in_bits_tag_mask_62 <= io_req_bits_tag_mask_62;
			in_bits_tag_mask_63 <= io_req_bits_tag_mask_63;
			in_bits_tag_is_acc <= io_req_bits_tag_is_acc;
			in_bits_tag_accumulate <= io_req_bits_tag_accumulate;
			in_bits_tag_bytes_read <= io_req_bits_tag_bytes_read;
			in_bits_tag_cmd_id <= io_req_bits_tag_cmd_id;
		end
		else if (in_fire)
			in_bits_repeats <= in_bits_repeats - 16'h0001;
	end
	Pipeline pipe(
		.io_in_ready(_pipe_io_in_ready),
		.io_in_valid(in_valid),
		.io_in_bits_out_0(in_bits_in_0),
		.io_in_bits_out_1(in_bits_in_1),
		.io_in_bits_out_2(in_bits_in_2),
		.io_in_bits_out_3(in_bits_in_3),
		.io_in_bits_out_4(in_bits_in_4),
		.io_in_bits_out_5(in_bits_in_5),
		.io_in_bits_out_6(in_bits_in_6),
		.io_in_bits_out_7(in_bits_in_7),
		.io_in_bits_out_8(in_bits_in_8),
		.io_in_bits_out_9(in_bits_in_9),
		.io_in_bits_out_10(in_bits_in_10),
		.io_in_bits_out_11(in_bits_in_11),
		.io_in_bits_out_12(in_bits_in_12),
		.io_in_bits_out_13(in_bits_in_13),
		.io_in_bits_out_14(in_bits_in_14),
		.io_in_bits_out_15(in_bits_in_15),
		.io_in_bits_row(in_bits_repeats),
		.io_in_bits_last(_pipe_io_in_bits_last_T & in_bits_last),
		.io_in_bits_tag_addr(in_bits_tag_addr),
		.io_in_bits_tag_mask_0(in_bits_tag_mask_0),
		.io_in_bits_tag_mask_1(in_bits_tag_mask_1),
		.io_in_bits_tag_mask_2(in_bits_tag_mask_2),
		.io_in_bits_tag_mask_3(in_bits_tag_mask_3),
		.io_in_bits_tag_mask_4(in_bits_tag_mask_4),
		.io_in_bits_tag_mask_5(in_bits_tag_mask_5),
		.io_in_bits_tag_mask_6(in_bits_tag_mask_6),
		.io_in_bits_tag_mask_7(in_bits_tag_mask_7),
		.io_in_bits_tag_mask_8(in_bits_tag_mask_8),
		.io_in_bits_tag_mask_9(in_bits_tag_mask_9),
		.io_in_bits_tag_mask_10(in_bits_tag_mask_10),
		.io_in_bits_tag_mask_11(in_bits_tag_mask_11),
		.io_in_bits_tag_mask_12(in_bits_tag_mask_12),
		.io_in_bits_tag_mask_13(in_bits_tag_mask_13),
		.io_in_bits_tag_mask_14(in_bits_tag_mask_14),
		.io_in_bits_tag_mask_15(in_bits_tag_mask_15),
		.io_in_bits_tag_mask_16(in_bits_tag_mask_16),
		.io_in_bits_tag_mask_17(in_bits_tag_mask_17),
		.io_in_bits_tag_mask_18(in_bits_tag_mask_18),
		.io_in_bits_tag_mask_19(in_bits_tag_mask_19),
		.io_in_bits_tag_mask_20(in_bits_tag_mask_20),
		.io_in_bits_tag_mask_21(in_bits_tag_mask_21),
		.io_in_bits_tag_mask_22(in_bits_tag_mask_22),
		.io_in_bits_tag_mask_23(in_bits_tag_mask_23),
		.io_in_bits_tag_mask_24(in_bits_tag_mask_24),
		.io_in_bits_tag_mask_25(in_bits_tag_mask_25),
		.io_in_bits_tag_mask_26(in_bits_tag_mask_26),
		.io_in_bits_tag_mask_27(in_bits_tag_mask_27),
		.io_in_bits_tag_mask_28(in_bits_tag_mask_28),
		.io_in_bits_tag_mask_29(in_bits_tag_mask_29),
		.io_in_bits_tag_mask_30(in_bits_tag_mask_30),
		.io_in_bits_tag_mask_31(in_bits_tag_mask_31),
		.io_in_bits_tag_mask_32(in_bits_tag_mask_32),
		.io_in_bits_tag_mask_33(in_bits_tag_mask_33),
		.io_in_bits_tag_mask_34(in_bits_tag_mask_34),
		.io_in_bits_tag_mask_35(in_bits_tag_mask_35),
		.io_in_bits_tag_mask_36(in_bits_tag_mask_36),
		.io_in_bits_tag_mask_37(in_bits_tag_mask_37),
		.io_in_bits_tag_mask_38(in_bits_tag_mask_38),
		.io_in_bits_tag_mask_39(in_bits_tag_mask_39),
		.io_in_bits_tag_mask_40(in_bits_tag_mask_40),
		.io_in_bits_tag_mask_41(in_bits_tag_mask_41),
		.io_in_bits_tag_mask_42(in_bits_tag_mask_42),
		.io_in_bits_tag_mask_43(in_bits_tag_mask_43),
		.io_in_bits_tag_mask_44(in_bits_tag_mask_44),
		.io_in_bits_tag_mask_45(in_bits_tag_mask_45),
		.io_in_bits_tag_mask_46(in_bits_tag_mask_46),
		.io_in_bits_tag_mask_47(in_bits_tag_mask_47),
		.io_in_bits_tag_mask_48(in_bits_tag_mask_48),
		.io_in_bits_tag_mask_49(in_bits_tag_mask_49),
		.io_in_bits_tag_mask_50(in_bits_tag_mask_50),
		.io_in_bits_tag_mask_51(in_bits_tag_mask_51),
		.io_in_bits_tag_mask_52(in_bits_tag_mask_52),
		.io_in_bits_tag_mask_53(in_bits_tag_mask_53),
		.io_in_bits_tag_mask_54(in_bits_tag_mask_54),
		.io_in_bits_tag_mask_55(in_bits_tag_mask_55),
		.io_in_bits_tag_mask_56(in_bits_tag_mask_56),
		.io_in_bits_tag_mask_57(in_bits_tag_mask_57),
		.io_in_bits_tag_mask_58(in_bits_tag_mask_58),
		.io_in_bits_tag_mask_59(in_bits_tag_mask_59),
		.io_in_bits_tag_mask_60(in_bits_tag_mask_60),
		.io_in_bits_tag_mask_61(in_bits_tag_mask_61),
		.io_in_bits_tag_mask_62(in_bits_tag_mask_62),
		.io_in_bits_tag_mask_63(in_bits_tag_mask_63),
		.io_in_bits_tag_is_acc(in_bits_tag_is_acc),
		.io_in_bits_tag_accumulate(in_bits_tag_accumulate),
		.io_in_bits_tag_bytes_read(in_bits_tag_bytes_read),
		.io_in_bits_tag_cmd_id(in_bits_tag_cmd_id),
		.io_out_ready(io_resp_ready),
		.io_out_valid(io_resp_valid),
		.io_out_bits_out_0(io_resp_bits_out_0),
		.io_out_bits_out_1(io_resp_bits_out_1),
		.io_out_bits_out_2(io_resp_bits_out_2),
		.io_out_bits_out_3(io_resp_bits_out_3),
		.io_out_bits_out_4(io_resp_bits_out_4),
		.io_out_bits_out_5(io_resp_bits_out_5),
		.io_out_bits_out_6(io_resp_bits_out_6),
		.io_out_bits_out_7(io_resp_bits_out_7),
		.io_out_bits_out_8(io_resp_bits_out_8),
		.io_out_bits_out_9(io_resp_bits_out_9),
		.io_out_bits_out_10(io_resp_bits_out_10),
		.io_out_bits_out_11(io_resp_bits_out_11),
		.io_out_bits_out_12(io_resp_bits_out_12),
		.io_out_bits_out_13(io_resp_bits_out_13),
		.io_out_bits_out_14(io_resp_bits_out_14),
		.io_out_bits_out_15(io_resp_bits_out_15),
		.io_out_bits_row(io_resp_bits_row),
		.io_out_bits_last(io_resp_bits_last),
		.io_out_bits_tag_addr(io_resp_bits_tag_addr),
		.io_out_bits_tag_mask_0(io_resp_bits_tag_mask_0),
		.io_out_bits_tag_mask_1(io_resp_bits_tag_mask_1),
		.io_out_bits_tag_mask_2(io_resp_bits_tag_mask_2),
		.io_out_bits_tag_mask_3(io_resp_bits_tag_mask_3),
		.io_out_bits_tag_mask_4(io_resp_bits_tag_mask_4),
		.io_out_bits_tag_mask_5(io_resp_bits_tag_mask_5),
		.io_out_bits_tag_mask_6(io_resp_bits_tag_mask_6),
		.io_out_bits_tag_mask_7(io_resp_bits_tag_mask_7),
		.io_out_bits_tag_mask_8(io_resp_bits_tag_mask_8),
		.io_out_bits_tag_mask_9(io_resp_bits_tag_mask_9),
		.io_out_bits_tag_mask_10(io_resp_bits_tag_mask_10),
		.io_out_bits_tag_mask_11(io_resp_bits_tag_mask_11),
		.io_out_bits_tag_mask_12(io_resp_bits_tag_mask_12),
		.io_out_bits_tag_mask_13(io_resp_bits_tag_mask_13),
		.io_out_bits_tag_mask_14(io_resp_bits_tag_mask_14),
		.io_out_bits_tag_mask_15(io_resp_bits_tag_mask_15),
		.io_out_bits_tag_mask_16(io_resp_bits_tag_mask_16),
		.io_out_bits_tag_mask_17(io_resp_bits_tag_mask_17),
		.io_out_bits_tag_mask_18(io_resp_bits_tag_mask_18),
		.io_out_bits_tag_mask_19(io_resp_bits_tag_mask_19),
		.io_out_bits_tag_mask_20(io_resp_bits_tag_mask_20),
		.io_out_bits_tag_mask_21(io_resp_bits_tag_mask_21),
		.io_out_bits_tag_mask_22(io_resp_bits_tag_mask_22),
		.io_out_bits_tag_mask_23(io_resp_bits_tag_mask_23),
		.io_out_bits_tag_mask_24(io_resp_bits_tag_mask_24),
		.io_out_bits_tag_mask_25(io_resp_bits_tag_mask_25),
		.io_out_bits_tag_mask_26(io_resp_bits_tag_mask_26),
		.io_out_bits_tag_mask_27(io_resp_bits_tag_mask_27),
		.io_out_bits_tag_mask_28(io_resp_bits_tag_mask_28),
		.io_out_bits_tag_mask_29(io_resp_bits_tag_mask_29),
		.io_out_bits_tag_mask_30(io_resp_bits_tag_mask_30),
		.io_out_bits_tag_mask_31(io_resp_bits_tag_mask_31),
		.io_out_bits_tag_mask_32(io_resp_bits_tag_mask_32),
		.io_out_bits_tag_mask_33(io_resp_bits_tag_mask_33),
		.io_out_bits_tag_mask_34(io_resp_bits_tag_mask_34),
		.io_out_bits_tag_mask_35(io_resp_bits_tag_mask_35),
		.io_out_bits_tag_mask_36(io_resp_bits_tag_mask_36),
		.io_out_bits_tag_mask_37(io_resp_bits_tag_mask_37),
		.io_out_bits_tag_mask_38(io_resp_bits_tag_mask_38),
		.io_out_bits_tag_mask_39(io_resp_bits_tag_mask_39),
		.io_out_bits_tag_mask_40(io_resp_bits_tag_mask_40),
		.io_out_bits_tag_mask_41(io_resp_bits_tag_mask_41),
		.io_out_bits_tag_mask_42(io_resp_bits_tag_mask_42),
		.io_out_bits_tag_mask_43(io_resp_bits_tag_mask_43),
		.io_out_bits_tag_mask_44(io_resp_bits_tag_mask_44),
		.io_out_bits_tag_mask_45(io_resp_bits_tag_mask_45),
		.io_out_bits_tag_mask_46(io_resp_bits_tag_mask_46),
		.io_out_bits_tag_mask_47(io_resp_bits_tag_mask_47),
		.io_out_bits_tag_mask_48(io_resp_bits_tag_mask_48),
		.io_out_bits_tag_mask_49(io_resp_bits_tag_mask_49),
		.io_out_bits_tag_mask_50(io_resp_bits_tag_mask_50),
		.io_out_bits_tag_mask_51(io_resp_bits_tag_mask_51),
		.io_out_bits_tag_mask_52(io_resp_bits_tag_mask_52),
		.io_out_bits_tag_mask_53(io_resp_bits_tag_mask_53),
		.io_out_bits_tag_mask_54(io_resp_bits_tag_mask_54),
		.io_out_bits_tag_mask_55(io_resp_bits_tag_mask_55),
		.io_out_bits_tag_mask_56(io_resp_bits_tag_mask_56),
		.io_out_bits_tag_mask_57(io_resp_bits_tag_mask_57),
		.io_out_bits_tag_mask_58(io_resp_bits_tag_mask_58),
		.io_out_bits_tag_mask_59(io_resp_bits_tag_mask_59),
		.io_out_bits_tag_mask_60(io_resp_bits_tag_mask_60),
		.io_out_bits_tag_mask_61(io_resp_bits_tag_mask_61),
		.io_out_bits_tag_mask_62(io_resp_bits_tag_mask_62),
		.io_out_bits_tag_mask_63(io_resp_bits_tag_mask_63),
		.io_out_bits_tag_is_acc(io_resp_bits_tag_is_acc),
		.io_out_bits_tag_accumulate(io_resp_bits_tag_accumulate),
		.io_out_bits_tag_bytes_read(io_resp_bits_tag_bytes_read),
		.io_out_bits_tag_cmd_id(io_resp_bits_tag_cmd_id)
	);
	assign io_req_ready = io_req_ready_0;
endmodule
