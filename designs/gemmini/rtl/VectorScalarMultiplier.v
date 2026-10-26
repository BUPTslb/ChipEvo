module VectorScalarMultiplier (
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
	io_req_bits_scale_bits,
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
	io_req_bits_tag_is_acc,
	io_req_bits_tag_accumulate,
	io_req_bits_tag_pixel_repeats,
	io_req_bits_tag_len,
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
	io_resp_bits_tag_is_acc,
	io_resp_bits_tag_accumulate,
	io_resp_bits_tag_pixel_repeats,
	io_resp_bits_tag_len,
	io_resp_bits_tag_bytes_read,
	io_resp_bits_tag_cmd_id
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [7:0] io_req_bits_in_0;
	input [7:0] io_req_bits_in_1;
	input [7:0] io_req_bits_in_2;
	input [7:0] io_req_bits_in_3;
	input [7:0] io_req_bits_in_4;
	input [7:0] io_req_bits_in_5;
	input [7:0] io_req_bits_in_6;
	input [7:0] io_req_bits_in_7;
	input [7:0] io_req_bits_in_8;
	input [7:0] io_req_bits_in_9;
	input [7:0] io_req_bits_in_10;
	input [7:0] io_req_bits_in_11;
	input [7:0] io_req_bits_in_12;
	input [7:0] io_req_bits_in_13;
	input [7:0] io_req_bits_in_14;
	input [7:0] io_req_bits_in_15;
	input [31:0] io_req_bits_scale_bits;
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
	input io_req_bits_tag_is_acc;
	input io_req_bits_tag_accumulate;
	input [15:0] io_req_bits_tag_pixel_repeats;
	input [15:0] io_req_bits_tag_len;
	input [7:0] io_req_bits_tag_bytes_read;
	input [7:0] io_req_bits_tag_cmd_id;
	input io_resp_ready;
	output wire io_resp_valid;
	output wire [7:0] io_resp_bits_out_0;
	output wire [7:0] io_resp_bits_out_1;
	output wire [7:0] io_resp_bits_out_2;
	output wire [7:0] io_resp_bits_out_3;
	output wire [7:0] io_resp_bits_out_4;
	output wire [7:0] io_resp_bits_out_5;
	output wire [7:0] io_resp_bits_out_6;
	output wire [7:0] io_resp_bits_out_7;
	output wire [7:0] io_resp_bits_out_8;
	output wire [7:0] io_resp_bits_out_9;
	output wire [7:0] io_resp_bits_out_10;
	output wire [7:0] io_resp_bits_out_11;
	output wire [7:0] io_resp_bits_out_12;
	output wire [7:0] io_resp_bits_out_13;
	output wire [7:0] io_resp_bits_out_14;
	output wire [7:0] io_resp_bits_out_15;
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
	output wire io_resp_bits_tag_is_acc;
	output wire io_resp_bits_tag_accumulate;
	output wire [15:0] io_resp_bits_tag_pixel_repeats;
	output wire [15:0] io_resp_bits_tag_len;
	output wire [7:0] io_resp_bits_tag_bytes_read;
	output wire [7:0] io_resp_bits_tag_cmd_id;
	wire in_fire;
	wire _pipe_3_io_out_valid;
	wire [7:0] _pipe_3_io_out_bits_data;
	wire [1:0] _pipe_3_io_out_bits_id;
	wire [3:0] _pipe_3_io_out_bits_index;
	wire _arb_3_io_in_0_ready;
	wire _arb_3_io_in_1_ready;
	wire _arb_3_io_in_2_ready;
	wire _arb_3_io_in_3_ready;
	wire _arb_3_io_in_4_ready;
	wire _arb_3_io_in_5_ready;
	wire _arb_3_io_in_6_ready;
	wire _arb_3_io_in_7_ready;
	wire _arb_3_io_in_8_ready;
	wire _arb_3_io_in_9_ready;
	wire _arb_3_io_in_10_ready;
	wire _arb_3_io_in_11_ready;
	wire _arb_3_io_out_valid;
	wire [7:0] _arb_3_io_out_bits_data;
	wire [31:0] _arb_3_io_out_bits_scale_bits;
	wire [1:0] _arb_3_io_out_bits_id;
	wire [3:0] _arb_3_io_out_bits_index;
	wire _pipe_2_io_out_valid;
	wire [7:0] _pipe_2_io_out_bits_data;
	wire [1:0] _pipe_2_io_out_bits_id;
	wire [3:0] _pipe_2_io_out_bits_index;
	wire _arb_2_io_in_0_ready;
	wire _arb_2_io_in_1_ready;
	wire _arb_2_io_in_2_ready;
	wire _arb_2_io_in_3_ready;
	wire _arb_2_io_in_4_ready;
	wire _arb_2_io_in_5_ready;
	wire _arb_2_io_in_6_ready;
	wire _arb_2_io_in_7_ready;
	wire _arb_2_io_in_8_ready;
	wire _arb_2_io_in_9_ready;
	wire _arb_2_io_in_10_ready;
	wire _arb_2_io_in_11_ready;
	wire _arb_2_io_out_valid;
	wire [7:0] _arb_2_io_out_bits_data;
	wire [31:0] _arb_2_io_out_bits_scale_bits;
	wire [1:0] _arb_2_io_out_bits_id;
	wire [3:0] _arb_2_io_out_bits_index;
	wire _pipe_1_io_out_valid;
	wire [7:0] _pipe_1_io_out_bits_data;
	wire [1:0] _pipe_1_io_out_bits_id;
	wire [3:0] _pipe_1_io_out_bits_index;
	wire _arb_1_io_in_0_ready;
	wire _arb_1_io_in_1_ready;
	wire _arb_1_io_in_2_ready;
	wire _arb_1_io_in_3_ready;
	wire _arb_1_io_in_4_ready;
	wire _arb_1_io_in_5_ready;
	wire _arb_1_io_in_6_ready;
	wire _arb_1_io_in_7_ready;
	wire _arb_1_io_in_8_ready;
	wire _arb_1_io_in_9_ready;
	wire _arb_1_io_in_10_ready;
	wire _arb_1_io_in_11_ready;
	wire _arb_1_io_out_valid;
	wire [7:0] _arb_1_io_out_bits_data;
	wire [31:0] _arb_1_io_out_bits_scale_bits;
	wire [1:0] _arb_1_io_out_bits_id;
	wire [3:0] _arb_1_io_out_bits_index;
	wire _pipe_io_out_valid;
	wire [7:0] _pipe_io_out_bits_data;
	wire [1:0] _pipe_io_out_bits_id;
	wire [3:0] _pipe_io_out_bits_index;
	wire _arb_io_in_0_ready;
	wire _arb_io_in_1_ready;
	wire _arb_io_in_2_ready;
	wire _arb_io_in_3_ready;
	wire _arb_io_in_4_ready;
	wire _arb_io_in_5_ready;
	wire _arb_io_in_6_ready;
	wire _arb_io_in_7_ready;
	wire _arb_io_in_8_ready;
	wire _arb_io_in_9_ready;
	wire _arb_io_in_10_ready;
	wire _arb_io_in_11_ready;
	wire _arb_io_out_valid;
	wire [7:0] _arb_io_out_bits_data;
	wire [31:0] _arb_io_out_bits_scale_bits;
	wire [1:0] _arb_io_out_bits_id;
	wire [3:0] _arb_io_out_bits_index;
	reg in_valid;
	reg [7:0] in_bits_in_0;
	reg [7:0] in_bits_in_1;
	reg [7:0] in_bits_in_2;
	reg [7:0] in_bits_in_3;
	reg [7:0] in_bits_in_4;
	reg [7:0] in_bits_in_5;
	reg [7:0] in_bits_in_6;
	reg [7:0] in_bits_in_7;
	reg [7:0] in_bits_in_8;
	reg [7:0] in_bits_in_9;
	reg [7:0] in_bits_in_10;
	reg [7:0] in_bits_in_11;
	reg [7:0] in_bits_in_12;
	reg [7:0] in_bits_in_13;
	reg [7:0] in_bits_in_14;
	reg [7:0] in_bits_in_15;
	reg [31:0] in_bits_scale_bits;
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
	reg in_bits_tag_is_acc;
	reg in_bits_tag_accumulate;
	reg [15:0] in_bits_tag_pixel_repeats;
	reg [15:0] in_bits_tag_len;
	reg [7:0] in_bits_tag_bytes_read;
	reg [7:0] in_bits_tag_cmd_id;
	wire _out_regs_2_last_T = in_bits_repeats == 16'h0000;
	wire io_req_ready_0 = ~in_valid | (_out_regs_2_last_T & in_fire);
	reg regs_0_valid;
	reg [7:0] regs_0_bits_in_0;
	reg [7:0] regs_0_bits_in_1;
	reg [7:0] regs_0_bits_in_2;
	reg [7:0] regs_0_bits_in_3;
	reg [7:0] regs_0_bits_in_4;
	reg [7:0] regs_0_bits_in_5;
	reg [7:0] regs_0_bits_in_6;
	reg [7:0] regs_0_bits_in_7;
	reg [7:0] regs_0_bits_in_8;
	reg [7:0] regs_0_bits_in_9;
	reg [7:0] regs_0_bits_in_10;
	reg [7:0] regs_0_bits_in_11;
	reg [7:0] regs_0_bits_in_12;
	reg [7:0] regs_0_bits_in_13;
	reg [7:0] regs_0_bits_in_14;
	reg [7:0] regs_0_bits_in_15;
	reg [31:0] regs_0_bits_scale_bits;
	reg regs_1_valid;
	reg [7:0] regs_1_bits_in_0;
	reg [7:0] regs_1_bits_in_1;
	reg [7:0] regs_1_bits_in_2;
	reg [7:0] regs_1_bits_in_3;
	reg [7:0] regs_1_bits_in_4;
	reg [7:0] regs_1_bits_in_5;
	reg [7:0] regs_1_bits_in_6;
	reg [7:0] regs_1_bits_in_7;
	reg [7:0] regs_1_bits_in_8;
	reg [7:0] regs_1_bits_in_9;
	reg [7:0] regs_1_bits_in_10;
	reg [7:0] regs_1_bits_in_11;
	reg [7:0] regs_1_bits_in_12;
	reg [7:0] regs_1_bits_in_13;
	reg [7:0] regs_1_bits_in_14;
	reg [7:0] regs_1_bits_in_15;
	reg [31:0] regs_1_bits_scale_bits;
	reg regs_2_valid;
	reg [7:0] regs_2_bits_in_0;
	reg [7:0] regs_2_bits_in_1;
	reg [7:0] regs_2_bits_in_2;
	reg [7:0] regs_2_bits_in_3;
	reg [7:0] regs_2_bits_in_4;
	reg [7:0] regs_2_bits_in_5;
	reg [7:0] regs_2_bits_in_6;
	reg [7:0] regs_2_bits_in_7;
	reg [7:0] regs_2_bits_in_8;
	reg [7:0] regs_2_bits_in_9;
	reg [7:0] regs_2_bits_in_10;
	reg [7:0] regs_2_bits_in_11;
	reg [7:0] regs_2_bits_in_12;
	reg [7:0] regs_2_bits_in_13;
	reg [7:0] regs_2_bits_in_14;
	reg [7:0] regs_2_bits_in_15;
	reg [31:0] regs_2_bits_scale_bits;
	reg [7:0] out_regs_0_out_0;
	reg [7:0] out_regs_0_out_1;
	reg [7:0] out_regs_0_out_2;
	reg [7:0] out_regs_0_out_3;
	reg [7:0] out_regs_0_out_4;
	reg [7:0] out_regs_0_out_5;
	reg [7:0] out_regs_0_out_6;
	reg [7:0] out_regs_0_out_7;
	reg [7:0] out_regs_0_out_8;
	reg [7:0] out_regs_0_out_9;
	reg [7:0] out_regs_0_out_10;
	reg [7:0] out_regs_0_out_11;
	reg [7:0] out_regs_0_out_12;
	reg [7:0] out_regs_0_out_13;
	reg [7:0] out_regs_0_out_14;
	reg [7:0] out_regs_0_out_15;
	reg [15:0] out_regs_0_row;
	reg out_regs_0_last;
	reg [13:0] out_regs_0_tag_addr;
	reg out_regs_0_tag_mask_0;
	reg out_regs_0_tag_mask_1;
	reg out_regs_0_tag_mask_2;
	reg out_regs_0_tag_mask_3;
	reg out_regs_0_tag_mask_4;
	reg out_regs_0_tag_mask_5;
	reg out_regs_0_tag_mask_6;
	reg out_regs_0_tag_mask_7;
	reg out_regs_0_tag_mask_8;
	reg out_regs_0_tag_mask_9;
	reg out_regs_0_tag_mask_10;
	reg out_regs_0_tag_mask_11;
	reg out_regs_0_tag_mask_12;
	reg out_regs_0_tag_mask_13;
	reg out_regs_0_tag_mask_14;
	reg out_regs_0_tag_mask_15;
	reg out_regs_0_tag_is_acc;
	reg out_regs_0_tag_accumulate;
	reg [15:0] out_regs_0_tag_pixel_repeats;
	reg [15:0] out_regs_0_tag_len;
	reg [7:0] out_regs_0_tag_bytes_read;
	reg [7:0] out_regs_0_tag_cmd_id;
	reg [7:0] out_regs_1_out_0;
	reg [7:0] out_regs_1_out_1;
	reg [7:0] out_regs_1_out_2;
	reg [7:0] out_regs_1_out_3;
	reg [7:0] out_regs_1_out_4;
	reg [7:0] out_regs_1_out_5;
	reg [7:0] out_regs_1_out_6;
	reg [7:0] out_regs_1_out_7;
	reg [7:0] out_regs_1_out_8;
	reg [7:0] out_regs_1_out_9;
	reg [7:0] out_regs_1_out_10;
	reg [7:0] out_regs_1_out_11;
	reg [7:0] out_regs_1_out_12;
	reg [7:0] out_regs_1_out_13;
	reg [7:0] out_regs_1_out_14;
	reg [7:0] out_regs_1_out_15;
	reg [15:0] out_regs_1_row;
	reg out_regs_1_last;
	reg [13:0] out_regs_1_tag_addr;
	reg out_regs_1_tag_mask_0;
	reg out_regs_1_tag_mask_1;
	reg out_regs_1_tag_mask_2;
	reg out_regs_1_tag_mask_3;
	reg out_regs_1_tag_mask_4;
	reg out_regs_1_tag_mask_5;
	reg out_regs_1_tag_mask_6;
	reg out_regs_1_tag_mask_7;
	reg out_regs_1_tag_mask_8;
	reg out_regs_1_tag_mask_9;
	reg out_regs_1_tag_mask_10;
	reg out_regs_1_tag_mask_11;
	reg out_regs_1_tag_mask_12;
	reg out_regs_1_tag_mask_13;
	reg out_regs_1_tag_mask_14;
	reg out_regs_1_tag_mask_15;
	reg out_regs_1_tag_is_acc;
	reg out_regs_1_tag_accumulate;
	reg [15:0] out_regs_1_tag_pixel_repeats;
	reg [15:0] out_regs_1_tag_len;
	reg [7:0] out_regs_1_tag_bytes_read;
	reg [7:0] out_regs_1_tag_cmd_id;
	reg [7:0] out_regs_2_out_0;
	reg [7:0] out_regs_2_out_1;
	reg [7:0] out_regs_2_out_2;
	reg [7:0] out_regs_2_out_3;
	reg [7:0] out_regs_2_out_4;
	reg [7:0] out_regs_2_out_5;
	reg [7:0] out_regs_2_out_6;
	reg [7:0] out_regs_2_out_7;
	reg [7:0] out_regs_2_out_8;
	reg [7:0] out_regs_2_out_9;
	reg [7:0] out_regs_2_out_10;
	reg [7:0] out_regs_2_out_11;
	reg [7:0] out_regs_2_out_12;
	reg [7:0] out_regs_2_out_13;
	reg [7:0] out_regs_2_out_14;
	reg [7:0] out_regs_2_out_15;
	reg [15:0] out_regs_2_row;
	reg out_regs_2_last;
	reg [13:0] out_regs_2_tag_addr;
	reg out_regs_2_tag_mask_0;
	reg out_regs_2_tag_mask_1;
	reg out_regs_2_tag_mask_2;
	reg out_regs_2_tag_mask_3;
	reg out_regs_2_tag_mask_4;
	reg out_regs_2_tag_mask_5;
	reg out_regs_2_tag_mask_6;
	reg out_regs_2_tag_mask_7;
	reg out_regs_2_tag_mask_8;
	reg out_regs_2_tag_mask_9;
	reg out_regs_2_tag_mask_10;
	reg out_regs_2_tag_mask_11;
	reg out_regs_2_tag_mask_12;
	reg out_regs_2_tag_mask_13;
	reg out_regs_2_tag_mask_14;
	reg out_regs_2_tag_mask_15;
	reg out_regs_2_tag_is_acc;
	reg out_regs_2_tag_accumulate;
	reg [15:0] out_regs_2_tag_pixel_repeats;
	reg [15:0] out_regs_2_tag_len;
	reg [7:0] out_regs_2_tag_bytes_read;
	reg [7:0] out_regs_2_tag_cmd_id;
	reg fired_masks_0_0;
	reg fired_masks_0_1;
	reg fired_masks_0_2;
	reg fired_masks_0_3;
	reg fired_masks_0_4;
	reg fired_masks_0_5;
	reg fired_masks_0_6;
	reg fired_masks_0_7;
	reg fired_masks_0_8;
	reg fired_masks_0_9;
	reg fired_masks_0_10;
	reg fired_masks_0_11;
	reg fired_masks_0_12;
	reg fired_masks_0_13;
	reg fired_masks_0_14;
	reg fired_masks_0_15;
	reg fired_masks_1_0;
	reg fired_masks_1_1;
	reg fired_masks_1_2;
	reg fired_masks_1_3;
	reg fired_masks_1_4;
	reg fired_masks_1_5;
	reg fired_masks_1_6;
	reg fired_masks_1_7;
	reg fired_masks_1_8;
	reg fired_masks_1_9;
	reg fired_masks_1_10;
	reg fired_masks_1_11;
	reg fired_masks_1_12;
	reg fired_masks_1_13;
	reg fired_masks_1_14;
	reg fired_masks_1_15;
	reg fired_masks_2_0;
	reg fired_masks_2_1;
	reg fired_masks_2_2;
	reg fired_masks_2_3;
	reg fired_masks_2_4;
	reg fired_masks_2_5;
	reg fired_masks_2_6;
	reg fired_masks_2_7;
	reg fired_masks_2_8;
	reg fired_masks_2_9;
	reg fired_masks_2_10;
	reg fired_masks_2_11;
	reg fired_masks_2_12;
	reg fired_masks_2_13;
	reg fired_masks_2_14;
	reg fired_masks_2_15;
	reg completed_masks_0_0;
	reg completed_masks_0_1;
	reg completed_masks_0_2;
	reg completed_masks_0_3;
	reg completed_masks_0_4;
	reg completed_masks_0_5;
	reg completed_masks_0_6;
	reg completed_masks_0_7;
	reg completed_masks_0_8;
	reg completed_masks_0_9;
	reg completed_masks_0_10;
	reg completed_masks_0_11;
	reg completed_masks_0_12;
	reg completed_masks_0_13;
	reg completed_masks_0_14;
	reg completed_masks_0_15;
	reg completed_masks_1_0;
	reg completed_masks_1_1;
	reg completed_masks_1_2;
	reg completed_masks_1_3;
	reg completed_masks_1_4;
	reg completed_masks_1_5;
	reg completed_masks_1_6;
	reg completed_masks_1_7;
	reg completed_masks_1_8;
	reg completed_masks_1_9;
	reg completed_masks_1_10;
	reg completed_masks_1_11;
	reg completed_masks_1_12;
	reg completed_masks_1_13;
	reg completed_masks_1_14;
	reg completed_masks_1_15;
	reg completed_masks_2_0;
	reg completed_masks_2_1;
	reg completed_masks_2_2;
	reg completed_masks_2_3;
	reg completed_masks_2_4;
	reg completed_masks_2_5;
	reg completed_masks_2_6;
	reg completed_masks_2_7;
	reg completed_masks_2_8;
	reg completed_masks_2_9;
	reg completed_masks_2_10;
	reg completed_masks_2_11;
	reg completed_masks_2_12;
	reg completed_masks_2_13;
	reg completed_masks_2_14;
	reg completed_masks_2_15;
	reg [2:0] head_oh;
	reg [2:0] tail_oh;
	wire _io_resp_valid_T_55 = ((((((((((((((((((head_oh[0] & regs_0_valid) & completed_masks_0_0) & completed_masks_0_1) & completed_masks_0_2) & completed_masks_0_3) & completed_masks_0_4) & completed_masks_0_5) & completed_masks_0_6) & completed_masks_0_7) & completed_masks_0_8) & completed_masks_0_9) & completed_masks_0_10) & completed_masks_0_11) & completed_masks_0_12) & completed_masks_0_13) & completed_masks_0_14) & completed_masks_0_15) | (((((((((((((((((head_oh[1] & regs_1_valid) & completed_masks_1_0) & completed_masks_1_1) & completed_masks_1_2) & completed_masks_1_3) & completed_masks_1_4) & completed_masks_1_5) & completed_masks_1_6) & completed_masks_1_7) & completed_masks_1_8) & completed_masks_1_9) & completed_masks_1_10) & completed_masks_1_11) & completed_masks_1_12) & completed_masks_1_13) & completed_masks_1_14) & completed_masks_1_15)) | (((((((((((((((((head_oh[2] & regs_2_valid) & completed_masks_2_0) & completed_masks_2_1) & completed_masks_2_2) & completed_masks_2_3) & completed_masks_2_4) & completed_masks_2_5) & completed_masks_2_6) & completed_masks_2_7) & completed_masks_2_8) & completed_masks_2_9) & completed_masks_2_10) & completed_masks_2_11) & completed_masks_2_12) & completed_masks_2_13) & completed_masks_2_14) & completed_masks_2_15);
	assign in_fire = in_valid & ~(((tail_oh[0] & regs_0_valid) | (tail_oh[1] & regs_1_valid)) | (tail_oh[2] & regs_2_valid));
	wire inputs_0_valid = regs_0_valid & ~fired_masks_0_0;
	wire inputs_1_valid = regs_0_valid & ~fired_masks_0_1;
	wire inputs_2_valid = regs_0_valid & ~fired_masks_0_2;
	wire inputs_3_valid = regs_0_valid & ~fired_masks_0_3;
	wire inputs_4_valid = regs_0_valid & ~fired_masks_0_4;
	wire inputs_5_valid = regs_0_valid & ~fired_masks_0_5;
	wire inputs_6_valid = regs_0_valid & ~fired_masks_0_6;
	wire inputs_7_valid = regs_0_valid & ~fired_masks_0_7;
	wire inputs_8_valid = regs_0_valid & ~fired_masks_0_8;
	wire inputs_9_valid = regs_0_valid & ~fired_masks_0_9;
	wire inputs_10_valid = regs_0_valid & ~fired_masks_0_10;
	wire inputs_11_valid = regs_0_valid & ~fired_masks_0_11;
	wire inputs_12_valid = regs_0_valid & ~fired_masks_0_12;
	wire inputs_13_valid = regs_0_valid & ~fired_masks_0_13;
	wire inputs_14_valid = regs_0_valid & ~fired_masks_0_14;
	wire inputs_15_valid = regs_0_valid & ~fired_masks_0_15;
	wire inputs_16_valid = regs_1_valid & ~fired_masks_1_0;
	wire inputs_17_valid = regs_1_valid & ~fired_masks_1_1;
	wire inputs_18_valid = regs_1_valid & ~fired_masks_1_2;
	wire inputs_19_valid = regs_1_valid & ~fired_masks_1_3;
	wire inputs_20_valid = regs_1_valid & ~fired_masks_1_4;
	wire inputs_21_valid = regs_1_valid & ~fired_masks_1_5;
	wire inputs_22_valid = regs_1_valid & ~fired_masks_1_6;
	wire inputs_23_valid = regs_1_valid & ~fired_masks_1_7;
	wire inputs_24_valid = regs_1_valid & ~fired_masks_1_8;
	wire inputs_25_valid = regs_1_valid & ~fired_masks_1_9;
	wire inputs_26_valid = regs_1_valid & ~fired_masks_1_10;
	wire inputs_27_valid = regs_1_valid & ~fired_masks_1_11;
	wire inputs_28_valid = regs_1_valid & ~fired_masks_1_12;
	wire inputs_29_valid = regs_1_valid & ~fired_masks_1_13;
	wire inputs_30_valid = regs_1_valid & ~fired_masks_1_14;
	wire inputs_31_valid = regs_1_valid & ~fired_masks_1_15;
	wire inputs_32_valid = regs_2_valid & ~fired_masks_2_0;
	wire inputs_33_valid = regs_2_valid & ~fired_masks_2_1;
	wire inputs_34_valid = regs_2_valid & ~fired_masks_2_2;
	wire inputs_35_valid = regs_2_valid & ~fired_masks_2_3;
	wire inputs_36_valid = regs_2_valid & ~fired_masks_2_4;
	wire inputs_37_valid = regs_2_valid & ~fired_masks_2_5;
	wire inputs_38_valid = regs_2_valid & ~fired_masks_2_6;
	wire inputs_39_valid = regs_2_valid & ~fired_masks_2_7;
	wire inputs_40_valid = regs_2_valid & ~fired_masks_2_8;
	wire inputs_41_valid = regs_2_valid & ~fired_masks_2_9;
	wire inputs_42_valid = regs_2_valid & ~fired_masks_2_10;
	wire inputs_43_valid = regs_2_valid & ~fired_masks_2_11;
	wire inputs_44_valid = regs_2_valid & ~fired_masks_2_12;
	wire inputs_45_valid = regs_2_valid & ~fired_masks_2_13;
	wire inputs_46_valid = regs_2_valid & ~fired_masks_2_14;
	wire inputs_47_valid = regs_2_valid & ~fired_masks_2_15;
	reg arbOut_valid;
	reg [7:0] arbOut_bits_data;
	reg [31:0] arbOut_bits_scale_bits;
	reg [1:0] arbOut_bits_id;
	reg [3:0] arbOut_bits_index;
	reg arbOut_1_valid;
	reg [7:0] arbOut_1_bits_data;
	reg [31:0] arbOut_1_bits_scale_bits;
	reg [1:0] arbOut_1_bits_id;
	reg [3:0] arbOut_1_bits_index;
	reg arbOut_2_valid;
	reg [7:0] arbOut_2_bits_data;
	reg [31:0] arbOut_2_bits_scale_bits;
	reg [1:0] arbOut_2_bits_id;
	reg [3:0] arbOut_2_bits_index;
	reg arbOut_3_valid;
	reg [7:0] arbOut_3_bits_data;
	reg [31:0] arbOut_3_bits_scale_bits;
	reg [1:0] arbOut_3_bits_id;
	reg [3:0] arbOut_3_bits_index;
	wire _GEN = io_resp_ready & _io_resp_valid_T_55;
	wire _GEN_0 = io_req_ready_0 & io_req_valid;
	wire _GEN_1 = in_fire & tail_oh[0];
	wire _completed_masks_0_15_T_1 = in_bits_scale_bits == 32'h3f800000;
	wire _GEN_2 = in_fire & tail_oh[1];
	wire _completed_masks_1_15_T_1 = in_bits_scale_bits == 32'h3f800000;
	wire _GEN_3 = in_fire & tail_oh[2];
	wire _completed_masks_2_15_T_1 = in_bits_scale_bits == 32'h3f800000;
	wire _GEN_4 = _pipe_io_out_valid & (_pipe_io_out_bits_id == 2'h0);
	wire _GEN_5 = _pipe_io_out_bits_index == 4'h0;
	wire _GEN_6 = _GEN_4 & _GEN_5;
	wire _GEN_7 = _pipe_io_out_bits_index == 4'h4;
	wire _GEN_8 = _GEN_4 & _GEN_7;
	wire _GEN_9 = _pipe_io_out_bits_index == 4'h8;
	wire _GEN_10 = _GEN_4 & _GEN_9;
	wire _GEN_11 = _pipe_io_out_bits_index == 4'hc;
	wire _GEN_12 = _GEN_4 & _GEN_11;
	wire _GEN_13 = _pipe_io_out_valid & (_pipe_io_out_bits_id == 2'h1);
	wire _GEN_14 = _GEN_13 & _GEN_5;
	wire _GEN_15 = _GEN_13 & _GEN_7;
	wire _GEN_16 = _GEN_13 & _GEN_9;
	wire _GEN_17 = _GEN_13 & _GEN_11;
	wire _GEN_18 = _pipe_io_out_valid & (_pipe_io_out_bits_id == 2'h2);
	wire _GEN_19 = _GEN_18 & _GEN_5;
	wire _GEN_20 = _GEN_18 & _GEN_7;
	wire _GEN_21 = _GEN_18 & _GEN_9;
	wire _GEN_22 = _GEN_18 & _GEN_11;
	wire _GEN_23 = _pipe_1_io_out_valid & (_pipe_1_io_out_bits_id == 2'h0);
	wire _GEN_24 = _pipe_1_io_out_bits_index == 4'h1;
	wire _GEN_25 = _GEN_23 & _GEN_24;
	wire _GEN_26 = _pipe_1_io_out_bits_index == 4'h5;
	wire _GEN_27 = _GEN_23 & _GEN_26;
	wire _GEN_28 = _pipe_1_io_out_bits_index == 4'h9;
	wire _GEN_29 = _GEN_23 & _GEN_28;
	wire _GEN_30 = _pipe_1_io_out_bits_index == 4'hd;
	wire _GEN_31 = _GEN_23 & _GEN_30;
	wire _GEN_32 = _pipe_1_io_out_valid & (_pipe_1_io_out_bits_id == 2'h1);
	wire _GEN_33 = _GEN_32 & _GEN_24;
	wire _GEN_34 = _GEN_32 & _GEN_26;
	wire _GEN_35 = _GEN_32 & _GEN_28;
	wire _GEN_36 = _GEN_32 & _GEN_30;
	wire _GEN_37 = _pipe_1_io_out_valid & (_pipe_1_io_out_bits_id == 2'h2);
	wire _GEN_38 = _GEN_37 & _GEN_24;
	wire _GEN_39 = _GEN_37 & _GEN_26;
	wire _GEN_40 = _GEN_37 & _GEN_28;
	wire _GEN_41 = _GEN_37 & _GEN_30;
	wire _GEN_42 = _pipe_2_io_out_valid & (_pipe_2_io_out_bits_id == 2'h0);
	wire _GEN_43 = _pipe_2_io_out_bits_index == 4'h2;
	wire _GEN_44 = _GEN_42 & _GEN_43;
	wire _GEN_45 = _pipe_2_io_out_bits_index == 4'h6;
	wire _GEN_46 = _GEN_42 & _GEN_45;
	wire _GEN_47 = _pipe_2_io_out_bits_index == 4'ha;
	wire _GEN_48 = _GEN_42 & _GEN_47;
	wire _GEN_49 = _pipe_2_io_out_bits_index == 4'he;
	wire _GEN_50 = _GEN_42 & _GEN_49;
	wire _GEN_51 = _pipe_2_io_out_valid & (_pipe_2_io_out_bits_id == 2'h1);
	wire _GEN_52 = _GEN_51 & _GEN_43;
	wire _GEN_53 = _GEN_51 & _GEN_45;
	wire _GEN_54 = _GEN_51 & _GEN_47;
	wire _GEN_55 = _GEN_51 & _GEN_49;
	wire _GEN_56 = _pipe_2_io_out_valid & (_pipe_2_io_out_bits_id == 2'h2);
	wire _GEN_57 = _GEN_56 & _GEN_43;
	wire _GEN_58 = _GEN_56 & _GEN_45;
	wire _GEN_59 = _GEN_56 & _GEN_47;
	wire _GEN_60 = _GEN_56 & _GEN_49;
	wire _GEN_61 = _pipe_3_io_out_valid & (_pipe_3_io_out_bits_id == 2'h0);
	wire _GEN_62 = _pipe_3_io_out_bits_index == 4'h3;
	wire _GEN_63 = _GEN_61 & _GEN_62;
	wire _GEN_64 = _pipe_3_io_out_bits_index == 4'h7;
	wire _GEN_65 = _GEN_61 & _GEN_64;
	wire _GEN_66 = _pipe_3_io_out_bits_index == 4'hb;
	wire _GEN_67 = _GEN_61 & _GEN_66;
	wire _GEN_68 = _GEN_61 & &_pipe_3_io_out_bits_index;
	wire _GEN_69 = _pipe_3_io_out_valid & (_pipe_3_io_out_bits_id == 2'h1);
	wire _GEN_70 = _GEN_69 & _GEN_62;
	wire _GEN_71 = _GEN_69 & _GEN_64;
	wire _GEN_72 = _GEN_69 & _GEN_66;
	wire _GEN_73 = _GEN_69 & &_pipe_3_io_out_bits_index;
	wire _GEN_74 = _pipe_3_io_out_valid & (_pipe_3_io_out_bits_id == 2'h2);
	wire _GEN_75 = _GEN_74 & _GEN_62;
	wire _GEN_76 = _GEN_74 & _GEN_64;
	wire _GEN_77 = _GEN_74 & _GEN_66;
	wire _GEN_78 = _GEN_74 & &_pipe_3_io_out_bits_index;
	always @(posedge clock) begin
		if (reset) begin
			in_valid <= 1'h0;
			regs_0_valid <= 1'h0;
			regs_1_valid <= 1'h0;
			regs_2_valid <= 1'h0;
			head_oh <= 3'h1;
			tail_oh <= 3'h1;
			arbOut_valid <= 1'h0;
			arbOut_1_valid <= 1'h0;
			arbOut_2_valid <= 1'h0;
			arbOut_3_valid <= 1'h0;
		end
		else begin
			if (_GEN_0)
				in_valid <= io_req_valid;
			else
				in_valid <= ~(in_fire & _out_regs_2_last_T) & in_valid;
			regs_0_valid <= _GEN_1 | (~(_GEN & head_oh[0]) & regs_0_valid);
			regs_1_valid <= _GEN_2 | (~(_GEN & head_oh[1]) & regs_1_valid);
			regs_2_valid <= _GEN_3 | (~(_GEN & head_oh[2]) & regs_2_valid);
			if (_GEN)
				head_oh <= {head_oh[1:0], head_oh[2]};
			if (in_fire)
				tail_oh <= {tail_oh[1:0], tail_oh[2]};
			arbOut_valid <= _arb_io_out_valid;
			arbOut_1_valid <= _arb_1_io_out_valid;
			arbOut_2_valid <= _arb_2_io_out_valid;
			arbOut_3_valid <= _arb_3_io_out_valid;
		end
		if (_GEN_0) begin
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
			in_bits_scale_bits <= io_req_bits_scale_bits;
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
			in_bits_tag_is_acc <= io_req_bits_tag_is_acc;
			in_bits_tag_accumulate <= io_req_bits_tag_accumulate;
			in_bits_tag_pixel_repeats <= io_req_bits_tag_pixel_repeats;
			in_bits_tag_len <= io_req_bits_tag_len;
			in_bits_tag_bytes_read <= io_req_bits_tag_bytes_read;
			in_bits_tag_cmd_id <= io_req_bits_tag_cmd_id;
		end
		else if (in_fire)
			in_bits_repeats <= in_bits_repeats - 16'h0001;
		if (_GEN_1) begin
			regs_0_bits_in_0 <= in_bits_in_0;
			regs_0_bits_in_1 <= in_bits_in_1;
			regs_0_bits_in_2 <= in_bits_in_2;
			regs_0_bits_in_3 <= in_bits_in_3;
			regs_0_bits_in_4 <= in_bits_in_4;
			regs_0_bits_in_5 <= in_bits_in_5;
			regs_0_bits_in_6 <= in_bits_in_6;
			regs_0_bits_in_7 <= in_bits_in_7;
			regs_0_bits_in_8 <= in_bits_in_8;
			regs_0_bits_in_9 <= in_bits_in_9;
			regs_0_bits_in_10 <= in_bits_in_10;
			regs_0_bits_in_11 <= in_bits_in_11;
			regs_0_bits_in_12 <= in_bits_in_12;
			regs_0_bits_in_13 <= in_bits_in_13;
			regs_0_bits_in_14 <= in_bits_in_14;
			regs_0_bits_in_15 <= in_bits_in_15;
			regs_0_bits_scale_bits <= in_bits_scale_bits;
			out_regs_0_row <= in_bits_repeats;
			out_regs_0_last <= _out_regs_2_last_T & in_bits_last;
			out_regs_0_tag_addr <= in_bits_tag_addr;
			out_regs_0_tag_mask_0 <= in_bits_tag_mask_0;
			out_regs_0_tag_mask_1 <= in_bits_tag_mask_1;
			out_regs_0_tag_mask_2 <= in_bits_tag_mask_2;
			out_regs_0_tag_mask_3 <= in_bits_tag_mask_3;
			out_regs_0_tag_mask_4 <= in_bits_tag_mask_4;
			out_regs_0_tag_mask_5 <= in_bits_tag_mask_5;
			out_regs_0_tag_mask_6 <= in_bits_tag_mask_6;
			out_regs_0_tag_mask_7 <= in_bits_tag_mask_7;
			out_regs_0_tag_mask_8 <= in_bits_tag_mask_8;
			out_regs_0_tag_mask_9 <= in_bits_tag_mask_9;
			out_regs_0_tag_mask_10 <= in_bits_tag_mask_10;
			out_regs_0_tag_mask_11 <= in_bits_tag_mask_11;
			out_regs_0_tag_mask_12 <= in_bits_tag_mask_12;
			out_regs_0_tag_mask_13 <= in_bits_tag_mask_13;
			out_regs_0_tag_mask_14 <= in_bits_tag_mask_14;
			out_regs_0_tag_mask_15 <= in_bits_tag_mask_15;
			out_regs_0_tag_is_acc <= in_bits_tag_is_acc;
			out_regs_0_tag_accumulate <= in_bits_tag_accumulate;
			out_regs_0_tag_pixel_repeats <= in_bits_tag_pixel_repeats;
			out_regs_0_tag_len <= in_bits_tag_len;
			out_regs_0_tag_bytes_read <= in_bits_tag_bytes_read;
			out_regs_0_tag_cmd_id <= in_bits_tag_cmd_id;
		end
		if (_GEN_2) begin
			regs_1_bits_in_0 <= in_bits_in_0;
			regs_1_bits_in_1 <= in_bits_in_1;
			regs_1_bits_in_2 <= in_bits_in_2;
			regs_1_bits_in_3 <= in_bits_in_3;
			regs_1_bits_in_4 <= in_bits_in_4;
			regs_1_bits_in_5 <= in_bits_in_5;
			regs_1_bits_in_6 <= in_bits_in_6;
			regs_1_bits_in_7 <= in_bits_in_7;
			regs_1_bits_in_8 <= in_bits_in_8;
			regs_1_bits_in_9 <= in_bits_in_9;
			regs_1_bits_in_10 <= in_bits_in_10;
			regs_1_bits_in_11 <= in_bits_in_11;
			regs_1_bits_in_12 <= in_bits_in_12;
			regs_1_bits_in_13 <= in_bits_in_13;
			regs_1_bits_in_14 <= in_bits_in_14;
			regs_1_bits_in_15 <= in_bits_in_15;
			regs_1_bits_scale_bits <= in_bits_scale_bits;
			out_regs_1_row <= in_bits_repeats;
			out_regs_1_last <= _out_regs_2_last_T & in_bits_last;
			out_regs_1_tag_addr <= in_bits_tag_addr;
			out_regs_1_tag_mask_0 <= in_bits_tag_mask_0;
			out_regs_1_tag_mask_1 <= in_bits_tag_mask_1;
			out_regs_1_tag_mask_2 <= in_bits_tag_mask_2;
			out_regs_1_tag_mask_3 <= in_bits_tag_mask_3;
			out_regs_1_tag_mask_4 <= in_bits_tag_mask_4;
			out_regs_1_tag_mask_5 <= in_bits_tag_mask_5;
			out_regs_1_tag_mask_6 <= in_bits_tag_mask_6;
			out_regs_1_tag_mask_7 <= in_bits_tag_mask_7;
			out_regs_1_tag_mask_8 <= in_bits_tag_mask_8;
			out_regs_1_tag_mask_9 <= in_bits_tag_mask_9;
			out_regs_1_tag_mask_10 <= in_bits_tag_mask_10;
			out_regs_1_tag_mask_11 <= in_bits_tag_mask_11;
			out_regs_1_tag_mask_12 <= in_bits_tag_mask_12;
			out_regs_1_tag_mask_13 <= in_bits_tag_mask_13;
			out_regs_1_tag_mask_14 <= in_bits_tag_mask_14;
			out_regs_1_tag_mask_15 <= in_bits_tag_mask_15;
			out_regs_1_tag_is_acc <= in_bits_tag_is_acc;
			out_regs_1_tag_accumulate <= in_bits_tag_accumulate;
			out_regs_1_tag_pixel_repeats <= in_bits_tag_pixel_repeats;
			out_regs_1_tag_len <= in_bits_tag_len;
			out_regs_1_tag_bytes_read <= in_bits_tag_bytes_read;
			out_regs_1_tag_cmd_id <= in_bits_tag_cmd_id;
		end
		if (_GEN_3) begin
			regs_2_bits_in_0 <= in_bits_in_0;
			regs_2_bits_in_1 <= in_bits_in_1;
			regs_2_bits_in_2 <= in_bits_in_2;
			regs_2_bits_in_3 <= in_bits_in_3;
			regs_2_bits_in_4 <= in_bits_in_4;
			regs_2_bits_in_5 <= in_bits_in_5;
			regs_2_bits_in_6 <= in_bits_in_6;
			regs_2_bits_in_7 <= in_bits_in_7;
			regs_2_bits_in_8 <= in_bits_in_8;
			regs_2_bits_in_9 <= in_bits_in_9;
			regs_2_bits_in_10 <= in_bits_in_10;
			regs_2_bits_in_11 <= in_bits_in_11;
			regs_2_bits_in_12 <= in_bits_in_12;
			regs_2_bits_in_13 <= in_bits_in_13;
			regs_2_bits_in_14 <= in_bits_in_14;
			regs_2_bits_in_15 <= in_bits_in_15;
			regs_2_bits_scale_bits <= in_bits_scale_bits;
			out_regs_2_row <= in_bits_repeats;
			out_regs_2_last <= _out_regs_2_last_T & in_bits_last;
			out_regs_2_tag_addr <= in_bits_tag_addr;
			out_regs_2_tag_mask_0 <= in_bits_tag_mask_0;
			out_regs_2_tag_mask_1 <= in_bits_tag_mask_1;
			out_regs_2_tag_mask_2 <= in_bits_tag_mask_2;
			out_regs_2_tag_mask_3 <= in_bits_tag_mask_3;
			out_regs_2_tag_mask_4 <= in_bits_tag_mask_4;
			out_regs_2_tag_mask_5 <= in_bits_tag_mask_5;
			out_regs_2_tag_mask_6 <= in_bits_tag_mask_6;
			out_regs_2_tag_mask_7 <= in_bits_tag_mask_7;
			out_regs_2_tag_mask_8 <= in_bits_tag_mask_8;
			out_regs_2_tag_mask_9 <= in_bits_tag_mask_9;
			out_regs_2_tag_mask_10 <= in_bits_tag_mask_10;
			out_regs_2_tag_mask_11 <= in_bits_tag_mask_11;
			out_regs_2_tag_mask_12 <= in_bits_tag_mask_12;
			out_regs_2_tag_mask_13 <= in_bits_tag_mask_13;
			out_regs_2_tag_mask_14 <= in_bits_tag_mask_14;
			out_regs_2_tag_mask_15 <= in_bits_tag_mask_15;
			out_regs_2_tag_is_acc <= in_bits_tag_is_acc;
			out_regs_2_tag_accumulate <= in_bits_tag_accumulate;
			out_regs_2_tag_pixel_repeats <= in_bits_tag_pixel_repeats;
			out_regs_2_tag_len <= in_bits_tag_len;
			out_regs_2_tag_bytes_read <= in_bits_tag_bytes_read;
			out_regs_2_tag_cmd_id <= in_bits_tag_cmd_id;
		end
		if (_GEN_6)
			out_regs_0_out_0 <= _pipe_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_0 <= in_bits_in_0;
		if (_GEN_25)
			out_regs_0_out_1 <= _pipe_1_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_1 <= in_bits_in_1;
		if (_GEN_44)
			out_regs_0_out_2 <= _pipe_2_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_2 <= in_bits_in_2;
		if (_GEN_63)
			out_regs_0_out_3 <= _pipe_3_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_3 <= in_bits_in_3;
		if (_GEN_8)
			out_regs_0_out_4 <= _pipe_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_4 <= in_bits_in_4;
		if (_GEN_27)
			out_regs_0_out_5 <= _pipe_1_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_5 <= in_bits_in_5;
		if (_GEN_46)
			out_regs_0_out_6 <= _pipe_2_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_6 <= in_bits_in_6;
		if (_GEN_65)
			out_regs_0_out_7 <= _pipe_3_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_7 <= in_bits_in_7;
		if (_GEN_10)
			out_regs_0_out_8 <= _pipe_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_8 <= in_bits_in_8;
		if (_GEN_29)
			out_regs_0_out_9 <= _pipe_1_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_9 <= in_bits_in_9;
		if (_GEN_48)
			out_regs_0_out_10 <= _pipe_2_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_10 <= in_bits_in_10;
		if (_GEN_67)
			out_regs_0_out_11 <= _pipe_3_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_11 <= in_bits_in_11;
		if (_GEN_12)
			out_regs_0_out_12 <= _pipe_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_12 <= in_bits_in_12;
		if (_GEN_31)
			out_regs_0_out_13 <= _pipe_1_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_13 <= in_bits_in_13;
		if (_GEN_50)
			out_regs_0_out_14 <= _pipe_2_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_14 <= in_bits_in_14;
		if (_GEN_68)
			out_regs_0_out_15 <= _pipe_3_io_out_bits_data;
		else if (_GEN_1)
			out_regs_0_out_15 <= in_bits_in_15;
		if (_GEN_14)
			out_regs_1_out_0 <= _pipe_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_0 <= in_bits_in_0;
		if (_GEN_33)
			out_regs_1_out_1 <= _pipe_1_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_1 <= in_bits_in_1;
		if (_GEN_52)
			out_regs_1_out_2 <= _pipe_2_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_2 <= in_bits_in_2;
		if (_GEN_70)
			out_regs_1_out_3 <= _pipe_3_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_3 <= in_bits_in_3;
		if (_GEN_15)
			out_regs_1_out_4 <= _pipe_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_4 <= in_bits_in_4;
		if (_GEN_34)
			out_regs_1_out_5 <= _pipe_1_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_5 <= in_bits_in_5;
		if (_GEN_53)
			out_regs_1_out_6 <= _pipe_2_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_6 <= in_bits_in_6;
		if (_GEN_71)
			out_regs_1_out_7 <= _pipe_3_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_7 <= in_bits_in_7;
		if (_GEN_16)
			out_regs_1_out_8 <= _pipe_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_8 <= in_bits_in_8;
		if (_GEN_35)
			out_regs_1_out_9 <= _pipe_1_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_9 <= in_bits_in_9;
		if (_GEN_54)
			out_regs_1_out_10 <= _pipe_2_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_10 <= in_bits_in_10;
		if (_GEN_72)
			out_regs_1_out_11 <= _pipe_3_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_11 <= in_bits_in_11;
		if (_GEN_17)
			out_regs_1_out_12 <= _pipe_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_12 <= in_bits_in_12;
		if (_GEN_36)
			out_regs_1_out_13 <= _pipe_1_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_13 <= in_bits_in_13;
		if (_GEN_55)
			out_regs_1_out_14 <= _pipe_2_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_14 <= in_bits_in_14;
		if (_GEN_73)
			out_regs_1_out_15 <= _pipe_3_io_out_bits_data;
		else if (_GEN_2)
			out_regs_1_out_15 <= in_bits_in_15;
		if (_GEN_19)
			out_regs_2_out_0 <= _pipe_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_0 <= in_bits_in_0;
		if (_GEN_38)
			out_regs_2_out_1 <= _pipe_1_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_1 <= in_bits_in_1;
		if (_GEN_57)
			out_regs_2_out_2 <= _pipe_2_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_2 <= in_bits_in_2;
		if (_GEN_75)
			out_regs_2_out_3 <= _pipe_3_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_3 <= in_bits_in_3;
		if (_GEN_20)
			out_regs_2_out_4 <= _pipe_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_4 <= in_bits_in_4;
		if (_GEN_39)
			out_regs_2_out_5 <= _pipe_1_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_5 <= in_bits_in_5;
		if (_GEN_58)
			out_regs_2_out_6 <= _pipe_2_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_6 <= in_bits_in_6;
		if (_GEN_76)
			out_regs_2_out_7 <= _pipe_3_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_7 <= in_bits_in_7;
		if (_GEN_21)
			out_regs_2_out_8 <= _pipe_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_8 <= in_bits_in_8;
		if (_GEN_40)
			out_regs_2_out_9 <= _pipe_1_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_9 <= in_bits_in_9;
		if (_GEN_59)
			out_regs_2_out_10 <= _pipe_2_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_10 <= in_bits_in_10;
		if (_GEN_77)
			out_regs_2_out_11 <= _pipe_3_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_11 <= in_bits_in_11;
		if (_GEN_22)
			out_regs_2_out_12 <= _pipe_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_12 <= in_bits_in_12;
		if (_GEN_41)
			out_regs_2_out_13 <= _pipe_1_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_13 <= in_bits_in_13;
		if (_GEN_60)
			out_regs_2_out_14 <= _pipe_2_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_14 <= in_bits_in_14;
		if (_GEN_78)
			out_regs_2_out_15 <= _pipe_3_io_out_bits_data;
		else if (_GEN_3)
			out_regs_2_out_15 <= in_bits_in_15;
		fired_masks_0_0 <= (_arb_io_in_0_ready & inputs_0_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_0);
		fired_masks_0_1 <= (_arb_1_io_in_0_ready & inputs_1_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_1);
		fired_masks_0_2 <= (_arb_2_io_in_0_ready & inputs_2_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_2);
		fired_masks_0_3 <= (_arb_3_io_in_0_ready & inputs_3_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_3);
		fired_masks_0_4 <= (_arb_io_in_1_ready & inputs_4_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_4);
		fired_masks_0_5 <= (_arb_1_io_in_1_ready & inputs_5_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_5);
		fired_masks_0_6 <= (_arb_2_io_in_1_ready & inputs_6_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_6);
		fired_masks_0_7 <= (_arb_3_io_in_1_ready & inputs_7_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_7);
		fired_masks_0_8 <= (_arb_io_in_2_ready & inputs_8_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_8);
		fired_masks_0_9 <= (_arb_1_io_in_2_ready & inputs_9_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_9);
		fired_masks_0_10 <= (_arb_2_io_in_2_ready & inputs_10_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_10);
		fired_masks_0_11 <= (_arb_3_io_in_2_ready & inputs_11_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_11);
		fired_masks_0_12 <= (_arb_io_in_3_ready & inputs_12_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_12);
		fired_masks_0_13 <= (_arb_1_io_in_3_ready & inputs_13_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_13);
		fired_masks_0_14 <= (_arb_2_io_in_3_ready & inputs_14_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_14);
		fired_masks_0_15 <= (_arb_3_io_in_3_ready & inputs_15_valid) | (_GEN_1 ? _completed_masks_0_15_T_1 : fired_masks_0_15);
		fired_masks_1_0 <= (_arb_io_in_4_ready & inputs_16_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_0);
		fired_masks_1_1 <= (_arb_1_io_in_4_ready & inputs_17_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_1);
		fired_masks_1_2 <= (_arb_2_io_in_4_ready & inputs_18_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_2);
		fired_masks_1_3 <= (_arb_3_io_in_4_ready & inputs_19_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_3);
		fired_masks_1_4 <= (_arb_io_in_5_ready & inputs_20_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_4);
		fired_masks_1_5 <= (_arb_1_io_in_5_ready & inputs_21_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_5);
		fired_masks_1_6 <= (_arb_2_io_in_5_ready & inputs_22_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_6);
		fired_masks_1_7 <= (_arb_3_io_in_5_ready & inputs_23_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_7);
		fired_masks_1_8 <= (_arb_io_in_6_ready & inputs_24_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_8);
		fired_masks_1_9 <= (_arb_1_io_in_6_ready & inputs_25_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_9);
		fired_masks_1_10 <= (_arb_2_io_in_6_ready & inputs_26_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_10);
		fired_masks_1_11 <= (_arb_3_io_in_6_ready & inputs_27_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_11);
		fired_masks_1_12 <= (_arb_io_in_7_ready & inputs_28_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_12);
		fired_masks_1_13 <= (_arb_1_io_in_7_ready & inputs_29_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_13);
		fired_masks_1_14 <= (_arb_2_io_in_7_ready & inputs_30_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_14);
		fired_masks_1_15 <= (_arb_3_io_in_7_ready & inputs_31_valid) | (_GEN_2 ? _completed_masks_1_15_T_1 : fired_masks_1_15);
		fired_masks_2_0 <= (_arb_io_in_8_ready & inputs_32_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_0);
		fired_masks_2_1 <= (_arb_1_io_in_8_ready & inputs_33_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_1);
		fired_masks_2_2 <= (_arb_2_io_in_8_ready & inputs_34_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_2);
		fired_masks_2_3 <= (_arb_3_io_in_8_ready & inputs_35_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_3);
		fired_masks_2_4 <= (_arb_io_in_9_ready & inputs_36_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_4);
		fired_masks_2_5 <= (_arb_1_io_in_9_ready & inputs_37_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_5);
		fired_masks_2_6 <= (_arb_2_io_in_9_ready & inputs_38_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_6);
		fired_masks_2_7 <= (_arb_3_io_in_9_ready & inputs_39_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_7);
		fired_masks_2_8 <= (_arb_io_in_10_ready & inputs_40_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_8);
		fired_masks_2_9 <= (_arb_1_io_in_10_ready & inputs_41_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_9);
		fired_masks_2_10 <= (_arb_2_io_in_10_ready & inputs_42_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_10);
		fired_masks_2_11 <= (_arb_3_io_in_10_ready & inputs_43_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_11);
		fired_masks_2_12 <= (_arb_io_in_11_ready & inputs_44_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_12);
		fired_masks_2_13 <= (_arb_1_io_in_11_ready & inputs_45_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_13);
		fired_masks_2_14 <= (_arb_2_io_in_11_ready & inputs_46_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_14);
		fired_masks_2_15 <= (_arb_3_io_in_11_ready & inputs_47_valid) | (_GEN_3 ? _completed_masks_2_15_T_1 : fired_masks_2_15);
		completed_masks_0_0 <= _GEN_6 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_0);
		completed_masks_0_1 <= _GEN_25 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_1);
		completed_masks_0_2 <= _GEN_44 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_2);
		completed_masks_0_3 <= _GEN_63 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_3);
		completed_masks_0_4 <= _GEN_8 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_4);
		completed_masks_0_5 <= _GEN_27 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_5);
		completed_masks_0_6 <= _GEN_46 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_6);
		completed_masks_0_7 <= _GEN_65 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_7);
		completed_masks_0_8 <= _GEN_10 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_8);
		completed_masks_0_9 <= _GEN_29 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_9);
		completed_masks_0_10 <= _GEN_48 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_10);
		completed_masks_0_11 <= _GEN_67 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_11);
		completed_masks_0_12 <= _GEN_12 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_12);
		completed_masks_0_13 <= _GEN_31 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_13);
		completed_masks_0_14 <= _GEN_50 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_14);
		completed_masks_0_15 <= _GEN_68 | (_GEN_1 ? _completed_masks_0_15_T_1 : completed_masks_0_15);
		completed_masks_1_0 <= _GEN_14 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_0);
		completed_masks_1_1 <= _GEN_33 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_1);
		completed_masks_1_2 <= _GEN_52 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_2);
		completed_masks_1_3 <= _GEN_70 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_3);
		completed_masks_1_4 <= _GEN_15 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_4);
		completed_masks_1_5 <= _GEN_34 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_5);
		completed_masks_1_6 <= _GEN_53 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_6);
		completed_masks_1_7 <= _GEN_71 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_7);
		completed_masks_1_8 <= _GEN_16 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_8);
		completed_masks_1_9 <= _GEN_35 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_9);
		completed_masks_1_10 <= _GEN_54 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_10);
		completed_masks_1_11 <= _GEN_72 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_11);
		completed_masks_1_12 <= _GEN_17 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_12);
		completed_masks_1_13 <= _GEN_36 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_13);
		completed_masks_1_14 <= _GEN_55 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_14);
		completed_masks_1_15 <= _GEN_73 | (_GEN_2 ? _completed_masks_1_15_T_1 : completed_masks_1_15);
		completed_masks_2_0 <= _GEN_19 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_0);
		completed_masks_2_1 <= _GEN_38 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_1);
		completed_masks_2_2 <= _GEN_57 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_2);
		completed_masks_2_3 <= _GEN_75 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_3);
		completed_masks_2_4 <= _GEN_20 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_4);
		completed_masks_2_5 <= _GEN_39 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_5);
		completed_masks_2_6 <= _GEN_58 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_6);
		completed_masks_2_7 <= _GEN_76 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_7);
		completed_masks_2_8 <= _GEN_21 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_8);
		completed_masks_2_9 <= _GEN_40 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_9);
		completed_masks_2_10 <= _GEN_59 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_10);
		completed_masks_2_11 <= _GEN_77 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_11);
		completed_masks_2_12 <= _GEN_22 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_12);
		completed_masks_2_13 <= _GEN_41 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_13);
		completed_masks_2_14 <= _GEN_60 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_14);
		completed_masks_2_15 <= _GEN_78 | (_GEN_3 ? _completed_masks_2_15_T_1 : completed_masks_2_15);
		arbOut_bits_data <= _arb_io_out_bits_data;
		arbOut_bits_scale_bits <= _arb_io_out_bits_scale_bits;
		arbOut_bits_id <= _arb_io_out_bits_id;
		arbOut_bits_index <= _arb_io_out_bits_index;
		arbOut_1_bits_data <= _arb_1_io_out_bits_data;
		arbOut_1_bits_scale_bits <= _arb_1_io_out_bits_scale_bits;
		arbOut_1_bits_id <= _arb_1_io_out_bits_id;
		arbOut_1_bits_index <= _arb_1_io_out_bits_index;
		arbOut_2_bits_data <= _arb_2_io_out_bits_data;
		arbOut_2_bits_scale_bits <= _arb_2_io_out_bits_scale_bits;
		arbOut_2_bits_id <= _arb_2_io_out_bits_id;
		arbOut_2_bits_index <= _arb_2_io_out_bits_index;
		arbOut_3_bits_data <= _arb_3_io_out_bits_data;
		arbOut_3_bits_scale_bits <= _arb_3_io_out_bits_scale_bits;
		arbOut_3_bits_id <= _arb_3_io_out_bits_id;
		arbOut_3_bits_index <= _arb_3_io_out_bits_index;
	end
	RRArbiter arb(
		.clock(clock),
		.io_in_0_ready(_arb_io_in_0_ready),
		.io_in_0_valid(inputs_0_valid),
		.io_in_0_bits_data(regs_0_bits_in_0),
		.io_in_0_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_0_bits_index(4'h0),
		.io_in_1_ready(_arb_io_in_1_ready),
		.io_in_1_valid(inputs_4_valid),
		.io_in_1_bits_data(regs_0_bits_in_4),
		.io_in_1_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_1_bits_index(4'h4),
		.io_in_2_ready(_arb_io_in_2_ready),
		.io_in_2_valid(inputs_8_valid),
		.io_in_2_bits_data(regs_0_bits_in_8),
		.io_in_2_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_2_bits_index(4'h8),
		.io_in_3_ready(_arb_io_in_3_ready),
		.io_in_3_valid(inputs_12_valid),
		.io_in_3_bits_data(regs_0_bits_in_12),
		.io_in_3_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_3_bits_index(4'hc),
		.io_in_4_ready(_arb_io_in_4_ready),
		.io_in_4_valid(inputs_16_valid),
		.io_in_4_bits_data(regs_1_bits_in_0),
		.io_in_4_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_4_bits_index(4'h0),
		.io_in_5_ready(_arb_io_in_5_ready),
		.io_in_5_valid(inputs_20_valid),
		.io_in_5_bits_data(regs_1_bits_in_4),
		.io_in_5_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_5_bits_index(4'h4),
		.io_in_6_ready(_arb_io_in_6_ready),
		.io_in_6_valid(inputs_24_valid),
		.io_in_6_bits_data(regs_1_bits_in_8),
		.io_in_6_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_6_bits_index(4'h8),
		.io_in_7_ready(_arb_io_in_7_ready),
		.io_in_7_valid(inputs_28_valid),
		.io_in_7_bits_data(regs_1_bits_in_12),
		.io_in_7_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_7_bits_index(4'hc),
		.io_in_8_ready(_arb_io_in_8_ready),
		.io_in_8_valid(inputs_32_valid),
		.io_in_8_bits_data(regs_2_bits_in_0),
		.io_in_8_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_8_bits_index(4'h0),
		.io_in_9_ready(_arb_io_in_9_ready),
		.io_in_9_valid(inputs_36_valid),
		.io_in_9_bits_data(regs_2_bits_in_4),
		.io_in_9_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_9_bits_index(4'h4),
		.io_in_10_ready(_arb_io_in_10_ready),
		.io_in_10_valid(inputs_40_valid),
		.io_in_10_bits_data(regs_2_bits_in_8),
		.io_in_10_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_10_bits_index(4'h8),
		.io_in_11_ready(_arb_io_in_11_ready),
		.io_in_11_valid(inputs_44_valid),
		.io_in_11_bits_data(regs_2_bits_in_12),
		.io_in_11_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_11_bits_index(4'hc),
		.io_out_valid(_arb_io_out_valid),
		.io_out_bits_data(_arb_io_out_bits_data),
		.io_out_bits_scale_bits(_arb_io_out_bits_scale_bits),
		.io_out_bits_id(_arb_io_out_bits_id),
		.io_out_bits_index(_arb_io_out_bits_index)
	);
	ScalePipe pipe(
		.clock(clock),
		.reset(reset),
		.io_in_valid(arbOut_valid),
		.io_in_bits_data(arbOut_bits_data),
		.io_in_bits_scale_bits(arbOut_bits_scale_bits),
		.io_in_bits_id(arbOut_bits_id),
		.io_in_bits_index(arbOut_bits_index),
		.io_out_valid(_pipe_io_out_valid),
		.io_out_bits_data(_pipe_io_out_bits_data),
		.io_out_bits_id(_pipe_io_out_bits_id),
		.io_out_bits_index(_pipe_io_out_bits_index)
	);
	RRArbiter arb_1(
		.clock(clock),
		.io_in_0_ready(_arb_1_io_in_0_ready),
		.io_in_0_valid(inputs_1_valid),
		.io_in_0_bits_data(regs_0_bits_in_1),
		.io_in_0_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_0_bits_index(4'h1),
		.io_in_1_ready(_arb_1_io_in_1_ready),
		.io_in_1_valid(inputs_5_valid),
		.io_in_1_bits_data(regs_0_bits_in_5),
		.io_in_1_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_1_bits_index(4'h5),
		.io_in_2_ready(_arb_1_io_in_2_ready),
		.io_in_2_valid(inputs_9_valid),
		.io_in_2_bits_data(regs_0_bits_in_9),
		.io_in_2_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_2_bits_index(4'h9),
		.io_in_3_ready(_arb_1_io_in_3_ready),
		.io_in_3_valid(inputs_13_valid),
		.io_in_3_bits_data(regs_0_bits_in_13),
		.io_in_3_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_3_bits_index(4'hd),
		.io_in_4_ready(_arb_1_io_in_4_ready),
		.io_in_4_valid(inputs_17_valid),
		.io_in_4_bits_data(regs_1_bits_in_1),
		.io_in_4_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_4_bits_index(4'h1),
		.io_in_5_ready(_arb_1_io_in_5_ready),
		.io_in_5_valid(inputs_21_valid),
		.io_in_5_bits_data(regs_1_bits_in_5),
		.io_in_5_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_5_bits_index(4'h5),
		.io_in_6_ready(_arb_1_io_in_6_ready),
		.io_in_6_valid(inputs_25_valid),
		.io_in_6_bits_data(regs_1_bits_in_9),
		.io_in_6_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_6_bits_index(4'h9),
		.io_in_7_ready(_arb_1_io_in_7_ready),
		.io_in_7_valid(inputs_29_valid),
		.io_in_7_bits_data(regs_1_bits_in_13),
		.io_in_7_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_7_bits_index(4'hd),
		.io_in_8_ready(_arb_1_io_in_8_ready),
		.io_in_8_valid(inputs_33_valid),
		.io_in_8_bits_data(regs_2_bits_in_1),
		.io_in_8_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_8_bits_index(4'h1),
		.io_in_9_ready(_arb_1_io_in_9_ready),
		.io_in_9_valid(inputs_37_valid),
		.io_in_9_bits_data(regs_2_bits_in_5),
		.io_in_9_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_9_bits_index(4'h5),
		.io_in_10_ready(_arb_1_io_in_10_ready),
		.io_in_10_valid(inputs_41_valid),
		.io_in_10_bits_data(regs_2_bits_in_9),
		.io_in_10_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_10_bits_index(4'h9),
		.io_in_11_ready(_arb_1_io_in_11_ready),
		.io_in_11_valid(inputs_45_valid),
		.io_in_11_bits_data(regs_2_bits_in_13),
		.io_in_11_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_11_bits_index(4'hd),
		.io_out_valid(_arb_1_io_out_valid),
		.io_out_bits_data(_arb_1_io_out_bits_data),
		.io_out_bits_scale_bits(_arb_1_io_out_bits_scale_bits),
		.io_out_bits_id(_arb_1_io_out_bits_id),
		.io_out_bits_index(_arb_1_io_out_bits_index)
	);
	ScalePipe pipe_1(
		.clock(clock),
		.reset(reset),
		.io_in_valid(arbOut_1_valid),
		.io_in_bits_data(arbOut_1_bits_data),
		.io_in_bits_scale_bits(arbOut_1_bits_scale_bits),
		.io_in_bits_id(arbOut_1_bits_id),
		.io_in_bits_index(arbOut_1_bits_index),
		.io_out_valid(_pipe_1_io_out_valid),
		.io_out_bits_data(_pipe_1_io_out_bits_data),
		.io_out_bits_id(_pipe_1_io_out_bits_id),
		.io_out_bits_index(_pipe_1_io_out_bits_index)
	);
	RRArbiter arb_2(
		.clock(clock),
		.io_in_0_ready(_arb_2_io_in_0_ready),
		.io_in_0_valid(inputs_2_valid),
		.io_in_0_bits_data(regs_0_bits_in_2),
		.io_in_0_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_0_bits_index(4'h2),
		.io_in_1_ready(_arb_2_io_in_1_ready),
		.io_in_1_valid(inputs_6_valid),
		.io_in_1_bits_data(regs_0_bits_in_6),
		.io_in_1_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_1_bits_index(4'h6),
		.io_in_2_ready(_arb_2_io_in_2_ready),
		.io_in_2_valid(inputs_10_valid),
		.io_in_2_bits_data(regs_0_bits_in_10),
		.io_in_2_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_2_bits_index(4'ha),
		.io_in_3_ready(_arb_2_io_in_3_ready),
		.io_in_3_valid(inputs_14_valid),
		.io_in_3_bits_data(regs_0_bits_in_14),
		.io_in_3_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_3_bits_index(4'he),
		.io_in_4_ready(_arb_2_io_in_4_ready),
		.io_in_4_valid(inputs_18_valid),
		.io_in_4_bits_data(regs_1_bits_in_2),
		.io_in_4_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_4_bits_index(4'h2),
		.io_in_5_ready(_arb_2_io_in_5_ready),
		.io_in_5_valid(inputs_22_valid),
		.io_in_5_bits_data(regs_1_bits_in_6),
		.io_in_5_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_5_bits_index(4'h6),
		.io_in_6_ready(_arb_2_io_in_6_ready),
		.io_in_6_valid(inputs_26_valid),
		.io_in_6_bits_data(regs_1_bits_in_10),
		.io_in_6_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_6_bits_index(4'ha),
		.io_in_7_ready(_arb_2_io_in_7_ready),
		.io_in_7_valid(inputs_30_valid),
		.io_in_7_bits_data(regs_1_bits_in_14),
		.io_in_7_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_7_bits_index(4'he),
		.io_in_8_ready(_arb_2_io_in_8_ready),
		.io_in_8_valid(inputs_34_valid),
		.io_in_8_bits_data(regs_2_bits_in_2),
		.io_in_8_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_8_bits_index(4'h2),
		.io_in_9_ready(_arb_2_io_in_9_ready),
		.io_in_9_valid(inputs_38_valid),
		.io_in_9_bits_data(regs_2_bits_in_6),
		.io_in_9_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_9_bits_index(4'h6),
		.io_in_10_ready(_arb_2_io_in_10_ready),
		.io_in_10_valid(inputs_42_valid),
		.io_in_10_bits_data(regs_2_bits_in_10),
		.io_in_10_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_10_bits_index(4'ha),
		.io_in_11_ready(_arb_2_io_in_11_ready),
		.io_in_11_valid(inputs_46_valid),
		.io_in_11_bits_data(regs_2_bits_in_14),
		.io_in_11_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_11_bits_index(4'he),
		.io_out_valid(_arb_2_io_out_valid),
		.io_out_bits_data(_arb_2_io_out_bits_data),
		.io_out_bits_scale_bits(_arb_2_io_out_bits_scale_bits),
		.io_out_bits_id(_arb_2_io_out_bits_id),
		.io_out_bits_index(_arb_2_io_out_bits_index)
	);
	ScalePipe pipe_2(
		.clock(clock),
		.reset(reset),
		.io_in_valid(arbOut_2_valid),
		.io_in_bits_data(arbOut_2_bits_data),
		.io_in_bits_scale_bits(arbOut_2_bits_scale_bits),
		.io_in_bits_id(arbOut_2_bits_id),
		.io_in_bits_index(arbOut_2_bits_index),
		.io_out_valid(_pipe_2_io_out_valid),
		.io_out_bits_data(_pipe_2_io_out_bits_data),
		.io_out_bits_id(_pipe_2_io_out_bits_id),
		.io_out_bits_index(_pipe_2_io_out_bits_index)
	);
	RRArbiter arb_3(
		.clock(clock),
		.io_in_0_ready(_arb_3_io_in_0_ready),
		.io_in_0_valid(inputs_3_valid),
		.io_in_0_bits_data(regs_0_bits_in_3),
		.io_in_0_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_0_bits_index(4'h3),
		.io_in_1_ready(_arb_3_io_in_1_ready),
		.io_in_1_valid(inputs_7_valid),
		.io_in_1_bits_data(regs_0_bits_in_7),
		.io_in_1_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_1_bits_index(4'h7),
		.io_in_2_ready(_arb_3_io_in_2_ready),
		.io_in_2_valid(inputs_11_valid),
		.io_in_2_bits_data(regs_0_bits_in_11),
		.io_in_2_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_2_bits_index(4'hb),
		.io_in_3_ready(_arb_3_io_in_3_ready),
		.io_in_3_valid(inputs_15_valid),
		.io_in_3_bits_data(regs_0_bits_in_15),
		.io_in_3_bits_scale_bits(regs_0_bits_scale_bits),
		.io_in_3_bits_index(4'hf),
		.io_in_4_ready(_arb_3_io_in_4_ready),
		.io_in_4_valid(inputs_19_valid),
		.io_in_4_bits_data(regs_1_bits_in_3),
		.io_in_4_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_4_bits_index(4'h3),
		.io_in_5_ready(_arb_3_io_in_5_ready),
		.io_in_5_valid(inputs_23_valid),
		.io_in_5_bits_data(regs_1_bits_in_7),
		.io_in_5_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_5_bits_index(4'h7),
		.io_in_6_ready(_arb_3_io_in_6_ready),
		.io_in_6_valid(inputs_27_valid),
		.io_in_6_bits_data(regs_1_bits_in_11),
		.io_in_6_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_6_bits_index(4'hb),
		.io_in_7_ready(_arb_3_io_in_7_ready),
		.io_in_7_valid(inputs_31_valid),
		.io_in_7_bits_data(regs_1_bits_in_15),
		.io_in_7_bits_scale_bits(regs_1_bits_scale_bits),
		.io_in_7_bits_index(4'hf),
		.io_in_8_ready(_arb_3_io_in_8_ready),
		.io_in_8_valid(inputs_35_valid),
		.io_in_8_bits_data(regs_2_bits_in_3),
		.io_in_8_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_8_bits_index(4'h3),
		.io_in_9_ready(_arb_3_io_in_9_ready),
		.io_in_9_valid(inputs_39_valid),
		.io_in_9_bits_data(regs_2_bits_in_7),
		.io_in_9_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_9_bits_index(4'h7),
		.io_in_10_ready(_arb_3_io_in_10_ready),
		.io_in_10_valid(inputs_43_valid),
		.io_in_10_bits_data(regs_2_bits_in_11),
		.io_in_10_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_10_bits_index(4'hb),
		.io_in_11_ready(_arb_3_io_in_11_ready),
		.io_in_11_valid(inputs_47_valid),
		.io_in_11_bits_data(regs_2_bits_in_15),
		.io_in_11_bits_scale_bits(regs_2_bits_scale_bits),
		.io_in_11_bits_index(4'hf),
		.io_out_valid(_arb_3_io_out_valid),
		.io_out_bits_data(_arb_3_io_out_bits_data),
		.io_out_bits_scale_bits(_arb_3_io_out_bits_scale_bits),
		.io_out_bits_id(_arb_3_io_out_bits_id),
		.io_out_bits_index(_arb_3_io_out_bits_index)
	);
	ScalePipe pipe_3(
		.clock(clock),
		.reset(reset),
		.io_in_valid(arbOut_3_valid),
		.io_in_bits_data(arbOut_3_bits_data),
		.io_in_bits_scale_bits(arbOut_3_bits_scale_bits),
		.io_in_bits_id(arbOut_3_bits_id),
		.io_in_bits_index(arbOut_3_bits_index),
		.io_out_valid(_pipe_3_io_out_valid),
		.io_out_bits_data(_pipe_3_io_out_bits_data),
		.io_out_bits_id(_pipe_3_io_out_bits_id),
		.io_out_bits_index(_pipe_3_io_out_bits_index)
	);
	assign io_req_ready = io_req_ready_0;
	assign io_resp_valid = _io_resp_valid_T_55;
	assign io_resp_bits_out_0 = ((head_oh[0] ? out_regs_0_out_0 : 8'h00) | (head_oh[1] ? out_regs_1_out_0 : 8'h00)) | (head_oh[2] ? out_regs_2_out_0 : 8'h00);
	assign io_resp_bits_out_1 = ((head_oh[0] ? out_regs_0_out_1 : 8'h00) | (head_oh[1] ? out_regs_1_out_1 : 8'h00)) | (head_oh[2] ? out_regs_2_out_1 : 8'h00);
	assign io_resp_bits_out_2 = ((head_oh[0] ? out_regs_0_out_2 : 8'h00) | (head_oh[1] ? out_regs_1_out_2 : 8'h00)) | (head_oh[2] ? out_regs_2_out_2 : 8'h00);
	assign io_resp_bits_out_3 = ((head_oh[0] ? out_regs_0_out_3 : 8'h00) | (head_oh[1] ? out_regs_1_out_3 : 8'h00)) | (head_oh[2] ? out_regs_2_out_3 : 8'h00);
	assign io_resp_bits_out_4 = ((head_oh[0] ? out_regs_0_out_4 : 8'h00) | (head_oh[1] ? out_regs_1_out_4 : 8'h00)) | (head_oh[2] ? out_regs_2_out_4 : 8'h00);
	assign io_resp_bits_out_5 = ((head_oh[0] ? out_regs_0_out_5 : 8'h00) | (head_oh[1] ? out_regs_1_out_5 : 8'h00)) | (head_oh[2] ? out_regs_2_out_5 : 8'h00);
	assign io_resp_bits_out_6 = ((head_oh[0] ? out_regs_0_out_6 : 8'h00) | (head_oh[1] ? out_regs_1_out_6 : 8'h00)) | (head_oh[2] ? out_regs_2_out_6 : 8'h00);
	assign io_resp_bits_out_7 = ((head_oh[0] ? out_regs_0_out_7 : 8'h00) | (head_oh[1] ? out_regs_1_out_7 : 8'h00)) | (head_oh[2] ? out_regs_2_out_7 : 8'h00);
	assign io_resp_bits_out_8 = ((head_oh[0] ? out_regs_0_out_8 : 8'h00) | (head_oh[1] ? out_regs_1_out_8 : 8'h00)) | (head_oh[2] ? out_regs_2_out_8 : 8'h00);
	assign io_resp_bits_out_9 = ((head_oh[0] ? out_regs_0_out_9 : 8'h00) | (head_oh[1] ? out_regs_1_out_9 : 8'h00)) | (head_oh[2] ? out_regs_2_out_9 : 8'h00);
	assign io_resp_bits_out_10 = ((head_oh[0] ? out_regs_0_out_10 : 8'h00) | (head_oh[1] ? out_regs_1_out_10 : 8'h00)) | (head_oh[2] ? out_regs_2_out_10 : 8'h00);
	assign io_resp_bits_out_11 = ((head_oh[0] ? out_regs_0_out_11 : 8'h00) | (head_oh[1] ? out_regs_1_out_11 : 8'h00)) | (head_oh[2] ? out_regs_2_out_11 : 8'h00);
	assign io_resp_bits_out_12 = ((head_oh[0] ? out_regs_0_out_12 : 8'h00) | (head_oh[1] ? out_regs_1_out_12 : 8'h00)) | (head_oh[2] ? out_regs_2_out_12 : 8'h00);
	assign io_resp_bits_out_13 = ((head_oh[0] ? out_regs_0_out_13 : 8'h00) | (head_oh[1] ? out_regs_1_out_13 : 8'h00)) | (head_oh[2] ? out_regs_2_out_13 : 8'h00);
	assign io_resp_bits_out_14 = ((head_oh[0] ? out_regs_0_out_14 : 8'h00) | (head_oh[1] ? out_regs_1_out_14 : 8'h00)) | (head_oh[2] ? out_regs_2_out_14 : 8'h00);
	assign io_resp_bits_out_15 = ((head_oh[0] ? out_regs_0_out_15 : 8'h00) | (head_oh[1] ? out_regs_1_out_15 : 8'h00)) | (head_oh[2] ? out_regs_2_out_15 : 8'h00);
	assign io_resp_bits_row = ((head_oh[0] ? out_regs_0_row : 16'h0000) | (head_oh[1] ? out_regs_1_row : 16'h0000)) | (head_oh[2] ? out_regs_2_row : 16'h0000);
	assign io_resp_bits_last = ((head_oh[0] & out_regs_0_last) | (head_oh[1] & out_regs_1_last)) | (head_oh[2] & out_regs_2_last);
	assign io_resp_bits_tag_addr = ((head_oh[0] ? out_regs_0_tag_addr : 14'h0000) | (head_oh[1] ? out_regs_1_tag_addr : 14'h0000)) | (head_oh[2] ? out_regs_2_tag_addr : 14'h0000);
	assign io_resp_bits_tag_mask_0 = ((head_oh[0] & out_regs_0_tag_mask_0) | (head_oh[1] & out_regs_1_tag_mask_0)) | (head_oh[2] & out_regs_2_tag_mask_0);
	assign io_resp_bits_tag_mask_1 = ((head_oh[0] & out_regs_0_tag_mask_1) | (head_oh[1] & out_regs_1_tag_mask_1)) | (head_oh[2] & out_regs_2_tag_mask_1);
	assign io_resp_bits_tag_mask_2 = ((head_oh[0] & out_regs_0_tag_mask_2) | (head_oh[1] & out_regs_1_tag_mask_2)) | (head_oh[2] & out_regs_2_tag_mask_2);
	assign io_resp_bits_tag_mask_3 = ((head_oh[0] & out_regs_0_tag_mask_3) | (head_oh[1] & out_regs_1_tag_mask_3)) | (head_oh[2] & out_regs_2_tag_mask_3);
	assign io_resp_bits_tag_mask_4 = ((head_oh[0] & out_regs_0_tag_mask_4) | (head_oh[1] & out_regs_1_tag_mask_4)) | (head_oh[2] & out_regs_2_tag_mask_4);
	assign io_resp_bits_tag_mask_5 = ((head_oh[0] & out_regs_0_tag_mask_5) | (head_oh[1] & out_regs_1_tag_mask_5)) | (head_oh[2] & out_regs_2_tag_mask_5);
	assign io_resp_bits_tag_mask_6 = ((head_oh[0] & out_regs_0_tag_mask_6) | (head_oh[1] & out_regs_1_tag_mask_6)) | (head_oh[2] & out_regs_2_tag_mask_6);
	assign io_resp_bits_tag_mask_7 = ((head_oh[0] & out_regs_0_tag_mask_7) | (head_oh[1] & out_regs_1_tag_mask_7)) | (head_oh[2] & out_regs_2_tag_mask_7);
	assign io_resp_bits_tag_mask_8 = ((head_oh[0] & out_regs_0_tag_mask_8) | (head_oh[1] & out_regs_1_tag_mask_8)) | (head_oh[2] & out_regs_2_tag_mask_8);
	assign io_resp_bits_tag_mask_9 = ((head_oh[0] & out_regs_0_tag_mask_9) | (head_oh[1] & out_regs_1_tag_mask_9)) | (head_oh[2] & out_regs_2_tag_mask_9);
	assign io_resp_bits_tag_mask_10 = ((head_oh[0] & out_regs_0_tag_mask_10) | (head_oh[1] & out_regs_1_tag_mask_10)) | (head_oh[2] & out_regs_2_tag_mask_10);
	assign io_resp_bits_tag_mask_11 = ((head_oh[0] & out_regs_0_tag_mask_11) | (head_oh[1] & out_regs_1_tag_mask_11)) | (head_oh[2] & out_regs_2_tag_mask_11);
	assign io_resp_bits_tag_mask_12 = ((head_oh[0] & out_regs_0_tag_mask_12) | (head_oh[1] & out_regs_1_tag_mask_12)) | (head_oh[2] & out_regs_2_tag_mask_12);
	assign io_resp_bits_tag_mask_13 = ((head_oh[0] & out_regs_0_tag_mask_13) | (head_oh[1] & out_regs_1_tag_mask_13)) | (head_oh[2] & out_regs_2_tag_mask_13);
	assign io_resp_bits_tag_mask_14 = ((head_oh[0] & out_regs_0_tag_mask_14) | (head_oh[1] & out_regs_1_tag_mask_14)) | (head_oh[2] & out_regs_2_tag_mask_14);
	assign io_resp_bits_tag_mask_15 = ((head_oh[0] & out_regs_0_tag_mask_15) | (head_oh[1] & out_regs_1_tag_mask_15)) | (head_oh[2] & out_regs_2_tag_mask_15);
	assign io_resp_bits_tag_is_acc = ((head_oh[0] & out_regs_0_tag_is_acc) | (head_oh[1] & out_regs_1_tag_is_acc)) | (head_oh[2] & out_regs_2_tag_is_acc);
	assign io_resp_bits_tag_accumulate = ((head_oh[0] & out_regs_0_tag_accumulate) | (head_oh[1] & out_regs_1_tag_accumulate)) | (head_oh[2] & out_regs_2_tag_accumulate);
	assign io_resp_bits_tag_pixel_repeats = ((head_oh[0] ? out_regs_0_tag_pixel_repeats : 16'h0000) | (head_oh[1] ? out_regs_1_tag_pixel_repeats : 16'h0000)) | (head_oh[2] ? out_regs_2_tag_pixel_repeats : 16'h0000);
	assign io_resp_bits_tag_len = ((head_oh[0] ? out_regs_0_tag_len : 16'h0000) | (head_oh[1] ? out_regs_1_tag_len : 16'h0000)) | (head_oh[2] ? out_regs_2_tag_len : 16'h0000);
	assign io_resp_bits_tag_bytes_read = ((head_oh[0] ? out_regs_0_tag_bytes_read : 8'h00) | (head_oh[1] ? out_regs_1_tag_bytes_read : 8'h00)) | (head_oh[2] ? out_regs_2_tag_bytes_read : 8'h00);
	assign io_resp_bits_tag_cmd_id = ((head_oh[0] ? out_regs_0_tag_cmd_id : 8'h00) | (head_oh[1] ? out_regs_1_tag_cmd_id : 8'h00)) | (head_oh[2] ? out_regs_2_tag_cmd_id : 8'h00);
endmodule
