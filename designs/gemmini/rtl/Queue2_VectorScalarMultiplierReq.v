module Queue2_VectorScalarMultiplierReq (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_in_0,
	io_enq_bits_in_1,
	io_enq_bits_in_2,
	io_enq_bits_in_3,
	io_enq_bits_in_4,
	io_enq_bits_in_5,
	io_enq_bits_in_6,
	io_enq_bits_in_7,
	io_enq_bits_in_8,
	io_enq_bits_in_9,
	io_enq_bits_in_10,
	io_enq_bits_in_11,
	io_enq_bits_in_12,
	io_enq_bits_in_13,
	io_enq_bits_in_14,
	io_enq_bits_in_15,
	io_enq_bits_scale_bits,
	io_enq_bits_repeats,
	io_enq_bits_pixel_repeats,
	io_enq_bits_last,
	io_enq_bits_tag_data,
	io_enq_bits_tag_addr,
	io_enq_bits_tag_mask_0,
	io_enq_bits_tag_mask_1,
	io_enq_bits_tag_mask_2,
	io_enq_bits_tag_mask_3,
	io_enq_bits_tag_mask_4,
	io_enq_bits_tag_mask_5,
	io_enq_bits_tag_mask_6,
	io_enq_bits_tag_mask_7,
	io_enq_bits_tag_mask_8,
	io_enq_bits_tag_mask_9,
	io_enq_bits_tag_mask_10,
	io_enq_bits_tag_mask_11,
	io_enq_bits_tag_mask_12,
	io_enq_bits_tag_mask_13,
	io_enq_bits_tag_mask_14,
	io_enq_bits_tag_mask_15,
	io_enq_bits_tag_mask_16,
	io_enq_bits_tag_mask_17,
	io_enq_bits_tag_mask_18,
	io_enq_bits_tag_mask_19,
	io_enq_bits_tag_mask_20,
	io_enq_bits_tag_mask_21,
	io_enq_bits_tag_mask_22,
	io_enq_bits_tag_mask_23,
	io_enq_bits_tag_mask_24,
	io_enq_bits_tag_mask_25,
	io_enq_bits_tag_mask_26,
	io_enq_bits_tag_mask_27,
	io_enq_bits_tag_mask_28,
	io_enq_bits_tag_mask_29,
	io_enq_bits_tag_mask_30,
	io_enq_bits_tag_mask_31,
	io_enq_bits_tag_mask_32,
	io_enq_bits_tag_mask_33,
	io_enq_bits_tag_mask_34,
	io_enq_bits_tag_mask_35,
	io_enq_bits_tag_mask_36,
	io_enq_bits_tag_mask_37,
	io_enq_bits_tag_mask_38,
	io_enq_bits_tag_mask_39,
	io_enq_bits_tag_mask_40,
	io_enq_bits_tag_mask_41,
	io_enq_bits_tag_mask_42,
	io_enq_bits_tag_mask_43,
	io_enq_bits_tag_mask_44,
	io_enq_bits_tag_mask_45,
	io_enq_bits_tag_mask_46,
	io_enq_bits_tag_mask_47,
	io_enq_bits_tag_mask_48,
	io_enq_bits_tag_mask_49,
	io_enq_bits_tag_mask_50,
	io_enq_bits_tag_mask_51,
	io_enq_bits_tag_mask_52,
	io_enq_bits_tag_mask_53,
	io_enq_bits_tag_mask_54,
	io_enq_bits_tag_mask_55,
	io_enq_bits_tag_mask_56,
	io_enq_bits_tag_mask_57,
	io_enq_bits_tag_mask_58,
	io_enq_bits_tag_mask_59,
	io_enq_bits_tag_mask_60,
	io_enq_bits_tag_mask_61,
	io_enq_bits_tag_mask_62,
	io_enq_bits_tag_mask_63,
	io_enq_bits_tag_is_acc,
	io_enq_bits_tag_accumulate,
	io_enq_bits_tag_has_acc_bitwidth,
	io_enq_bits_tag_scale,
	io_enq_bits_tag_repeats,
	io_enq_bits_tag_pixel_repeats,
	io_enq_bits_tag_len,
	io_enq_bits_tag_last,
	io_enq_bits_tag_bytes_read,
	io_enq_bits_tag_cmd_id,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_in_0,
	io_deq_bits_in_1,
	io_deq_bits_in_2,
	io_deq_bits_in_3,
	io_deq_bits_in_4,
	io_deq_bits_in_5,
	io_deq_bits_in_6,
	io_deq_bits_in_7,
	io_deq_bits_in_8,
	io_deq_bits_in_9,
	io_deq_bits_in_10,
	io_deq_bits_in_11,
	io_deq_bits_in_12,
	io_deq_bits_in_13,
	io_deq_bits_in_14,
	io_deq_bits_in_15,
	io_deq_bits_scale_bits,
	io_deq_bits_repeats,
	io_deq_bits_last,
	io_deq_bits_tag_addr,
	io_deq_bits_tag_mask_0,
	io_deq_bits_tag_mask_1,
	io_deq_bits_tag_mask_2,
	io_deq_bits_tag_mask_3,
	io_deq_bits_tag_mask_4,
	io_deq_bits_tag_mask_5,
	io_deq_bits_tag_mask_6,
	io_deq_bits_tag_mask_7,
	io_deq_bits_tag_mask_8,
	io_deq_bits_tag_mask_9,
	io_deq_bits_tag_mask_10,
	io_deq_bits_tag_mask_11,
	io_deq_bits_tag_mask_12,
	io_deq_bits_tag_mask_13,
	io_deq_bits_tag_mask_14,
	io_deq_bits_tag_mask_15,
	io_deq_bits_tag_is_acc,
	io_deq_bits_tag_accumulate,
	io_deq_bits_tag_pixel_repeats,
	io_deq_bits_tag_len,
	io_deq_bits_tag_bytes_read,
	io_deq_bits_tag_cmd_id
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [7:0] io_enq_bits_in_0;
	input [7:0] io_enq_bits_in_1;
	input [7:0] io_enq_bits_in_2;
	input [7:0] io_enq_bits_in_3;
	input [7:0] io_enq_bits_in_4;
	input [7:0] io_enq_bits_in_5;
	input [7:0] io_enq_bits_in_6;
	input [7:0] io_enq_bits_in_7;
	input [7:0] io_enq_bits_in_8;
	input [7:0] io_enq_bits_in_9;
	input [7:0] io_enq_bits_in_10;
	input [7:0] io_enq_bits_in_11;
	input [7:0] io_enq_bits_in_12;
	input [7:0] io_enq_bits_in_13;
	input [7:0] io_enq_bits_in_14;
	input [7:0] io_enq_bits_in_15;
	input [31:0] io_enq_bits_scale_bits;
	input [15:0] io_enq_bits_repeats;
	input [7:0] io_enq_bits_pixel_repeats;
	input io_enq_bits_last;
	input [511:0] io_enq_bits_tag_data;
	input [13:0] io_enq_bits_tag_addr;
	input io_enq_bits_tag_mask_0;
	input io_enq_bits_tag_mask_1;
	input io_enq_bits_tag_mask_2;
	input io_enq_bits_tag_mask_3;
	input io_enq_bits_tag_mask_4;
	input io_enq_bits_tag_mask_5;
	input io_enq_bits_tag_mask_6;
	input io_enq_bits_tag_mask_7;
	input io_enq_bits_tag_mask_8;
	input io_enq_bits_tag_mask_9;
	input io_enq_bits_tag_mask_10;
	input io_enq_bits_tag_mask_11;
	input io_enq_bits_tag_mask_12;
	input io_enq_bits_tag_mask_13;
	input io_enq_bits_tag_mask_14;
	input io_enq_bits_tag_mask_15;
	input io_enq_bits_tag_mask_16;
	input io_enq_bits_tag_mask_17;
	input io_enq_bits_tag_mask_18;
	input io_enq_bits_tag_mask_19;
	input io_enq_bits_tag_mask_20;
	input io_enq_bits_tag_mask_21;
	input io_enq_bits_tag_mask_22;
	input io_enq_bits_tag_mask_23;
	input io_enq_bits_tag_mask_24;
	input io_enq_bits_tag_mask_25;
	input io_enq_bits_tag_mask_26;
	input io_enq_bits_tag_mask_27;
	input io_enq_bits_tag_mask_28;
	input io_enq_bits_tag_mask_29;
	input io_enq_bits_tag_mask_30;
	input io_enq_bits_tag_mask_31;
	input io_enq_bits_tag_mask_32;
	input io_enq_bits_tag_mask_33;
	input io_enq_bits_tag_mask_34;
	input io_enq_bits_tag_mask_35;
	input io_enq_bits_tag_mask_36;
	input io_enq_bits_tag_mask_37;
	input io_enq_bits_tag_mask_38;
	input io_enq_bits_tag_mask_39;
	input io_enq_bits_tag_mask_40;
	input io_enq_bits_tag_mask_41;
	input io_enq_bits_tag_mask_42;
	input io_enq_bits_tag_mask_43;
	input io_enq_bits_tag_mask_44;
	input io_enq_bits_tag_mask_45;
	input io_enq_bits_tag_mask_46;
	input io_enq_bits_tag_mask_47;
	input io_enq_bits_tag_mask_48;
	input io_enq_bits_tag_mask_49;
	input io_enq_bits_tag_mask_50;
	input io_enq_bits_tag_mask_51;
	input io_enq_bits_tag_mask_52;
	input io_enq_bits_tag_mask_53;
	input io_enq_bits_tag_mask_54;
	input io_enq_bits_tag_mask_55;
	input io_enq_bits_tag_mask_56;
	input io_enq_bits_tag_mask_57;
	input io_enq_bits_tag_mask_58;
	input io_enq_bits_tag_mask_59;
	input io_enq_bits_tag_mask_60;
	input io_enq_bits_tag_mask_61;
	input io_enq_bits_tag_mask_62;
	input io_enq_bits_tag_mask_63;
	input io_enq_bits_tag_is_acc;
	input io_enq_bits_tag_accumulate;
	input io_enq_bits_tag_has_acc_bitwidth;
	input [31:0] io_enq_bits_tag_scale;
	input [15:0] io_enq_bits_tag_repeats;
	input [15:0] io_enq_bits_tag_pixel_repeats;
	input [15:0] io_enq_bits_tag_len;
	input io_enq_bits_tag_last;
	input [7:0] io_enq_bits_tag_bytes_read;
	input [7:0] io_enq_bits_tag_cmd_id;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [7:0] io_deq_bits_in_0;
	output wire [7:0] io_deq_bits_in_1;
	output wire [7:0] io_deq_bits_in_2;
	output wire [7:0] io_deq_bits_in_3;
	output wire [7:0] io_deq_bits_in_4;
	output wire [7:0] io_deq_bits_in_5;
	output wire [7:0] io_deq_bits_in_6;
	output wire [7:0] io_deq_bits_in_7;
	output wire [7:0] io_deq_bits_in_8;
	output wire [7:0] io_deq_bits_in_9;
	output wire [7:0] io_deq_bits_in_10;
	output wire [7:0] io_deq_bits_in_11;
	output wire [7:0] io_deq_bits_in_12;
	output wire [7:0] io_deq_bits_in_13;
	output wire [7:0] io_deq_bits_in_14;
	output wire [7:0] io_deq_bits_in_15;
	output wire [31:0] io_deq_bits_scale_bits;
	output wire [15:0] io_deq_bits_repeats;
	output wire io_deq_bits_last;
	output wire [13:0] io_deq_bits_tag_addr;
	output wire io_deq_bits_tag_mask_0;
	output wire io_deq_bits_tag_mask_1;
	output wire io_deq_bits_tag_mask_2;
	output wire io_deq_bits_tag_mask_3;
	output wire io_deq_bits_tag_mask_4;
	output wire io_deq_bits_tag_mask_5;
	output wire io_deq_bits_tag_mask_6;
	output wire io_deq_bits_tag_mask_7;
	output wire io_deq_bits_tag_mask_8;
	output wire io_deq_bits_tag_mask_9;
	output wire io_deq_bits_tag_mask_10;
	output wire io_deq_bits_tag_mask_11;
	output wire io_deq_bits_tag_mask_12;
	output wire io_deq_bits_tag_mask_13;
	output wire io_deq_bits_tag_mask_14;
	output wire io_deq_bits_tag_mask_15;
	output wire io_deq_bits_tag_is_acc;
	output wire io_deq_bits_tag_accumulate;
	output wire [15:0] io_deq_bits_tag_pixel_repeats;
	output wire [15:0] io_deq_bits_tag_len;
	output wire [7:0] io_deq_bits_tag_bytes_read;
	output wire [7:0] io_deq_bits_tag_cmd_id;
	wire [256:0] _ram_ext_R0_data;
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
	ram_2x257 ram_ext(
		.R0_addr(wrap_1),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(wrap),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_tag_cmd_id, io_enq_bits_tag_bytes_read, io_enq_bits_tag_len, io_enq_bits_tag_pixel_repeats, io_enq_bits_tag_accumulate, io_enq_bits_tag_is_acc, io_enq_bits_tag_mask_15, io_enq_bits_tag_mask_14, io_enq_bits_tag_mask_13, io_enq_bits_tag_mask_12, io_enq_bits_tag_mask_11, io_enq_bits_tag_mask_10, io_enq_bits_tag_mask_9, io_enq_bits_tag_mask_8, io_enq_bits_tag_mask_7, io_enq_bits_tag_mask_6, io_enq_bits_tag_mask_5, io_enq_bits_tag_mask_4, io_enq_bits_tag_mask_3, io_enq_bits_tag_mask_2, io_enq_bits_tag_mask_1, io_enq_bits_tag_mask_0, io_enq_bits_tag_addr, io_enq_bits_last, io_enq_bits_repeats, io_enq_bits_scale_bits, io_enq_bits_in_15, io_enq_bits_in_14, io_enq_bits_in_13, io_enq_bits_in_12, io_enq_bits_in_11, io_enq_bits_in_10, io_enq_bits_in_9, io_enq_bits_in_8, io_enq_bits_in_7, io_enq_bits_in_6, io_enq_bits_in_5, io_enq_bits_in_4, io_enq_bits_in_3, io_enq_bits_in_2, io_enq_bits_in_1, io_enq_bits_in_0})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_in_0 = _ram_ext_R0_data[7:0];
	assign io_deq_bits_in_1 = _ram_ext_R0_data[15:8];
	assign io_deq_bits_in_2 = _ram_ext_R0_data[23:16];
	assign io_deq_bits_in_3 = _ram_ext_R0_data[31:24];
	assign io_deq_bits_in_4 = _ram_ext_R0_data[39:32];
	assign io_deq_bits_in_5 = _ram_ext_R0_data[47:40];
	assign io_deq_bits_in_6 = _ram_ext_R0_data[55:48];
	assign io_deq_bits_in_7 = _ram_ext_R0_data[63:56];
	assign io_deq_bits_in_8 = _ram_ext_R0_data[71:64];
	assign io_deq_bits_in_9 = _ram_ext_R0_data[79:72];
	assign io_deq_bits_in_10 = _ram_ext_R0_data[87:80];
	assign io_deq_bits_in_11 = _ram_ext_R0_data[95:88];
	assign io_deq_bits_in_12 = _ram_ext_R0_data[103:96];
	assign io_deq_bits_in_13 = _ram_ext_R0_data[111:104];
	assign io_deq_bits_in_14 = _ram_ext_R0_data[119:112];
	assign io_deq_bits_in_15 = _ram_ext_R0_data[127:120];
	assign io_deq_bits_scale_bits = _ram_ext_R0_data[159:128];
	assign io_deq_bits_repeats = _ram_ext_R0_data[175:160];
	assign io_deq_bits_last = _ram_ext_R0_data[176];
	assign io_deq_bits_tag_addr = _ram_ext_R0_data[190:177];
	assign io_deq_bits_tag_mask_0 = _ram_ext_R0_data[191];
	assign io_deq_bits_tag_mask_1 = _ram_ext_R0_data[192];
	assign io_deq_bits_tag_mask_2 = _ram_ext_R0_data[193];
	assign io_deq_bits_tag_mask_3 = _ram_ext_R0_data[194];
	assign io_deq_bits_tag_mask_4 = _ram_ext_R0_data[195];
	assign io_deq_bits_tag_mask_5 = _ram_ext_R0_data[196];
	assign io_deq_bits_tag_mask_6 = _ram_ext_R0_data[197];
	assign io_deq_bits_tag_mask_7 = _ram_ext_R0_data[198];
	assign io_deq_bits_tag_mask_8 = _ram_ext_R0_data[199];
	assign io_deq_bits_tag_mask_9 = _ram_ext_R0_data[200];
	assign io_deq_bits_tag_mask_10 = _ram_ext_R0_data[201];
	assign io_deq_bits_tag_mask_11 = _ram_ext_R0_data[202];
	assign io_deq_bits_tag_mask_12 = _ram_ext_R0_data[203];
	assign io_deq_bits_tag_mask_13 = _ram_ext_R0_data[204];
	assign io_deq_bits_tag_mask_14 = _ram_ext_R0_data[205];
	assign io_deq_bits_tag_mask_15 = _ram_ext_R0_data[206];
	assign io_deq_bits_tag_is_acc = _ram_ext_R0_data[207];
	assign io_deq_bits_tag_accumulate = _ram_ext_R0_data[208];
	assign io_deq_bits_tag_pixel_repeats = _ram_ext_R0_data[224:209];
	assign io_deq_bits_tag_len = _ram_ext_R0_data[240:225];
	assign io_deq_bits_tag_bytes_read = _ram_ext_R0_data[248:241];
	assign io_deq_bits_tag_cmd_id = _ram_ext_R0_data[256:249];
endmodule
