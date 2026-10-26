module ZeroWriter (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_laddr_is_acc_addr,
	io_req_bits_laddr_accumulate,
	io_req_bits_laddr_data,
	io_req_bits_tag_cols,
	io_req_bits_tag_pixel_repeats,
	io_req_bits_tag_cmd_id,
	io_req_bits_cols,
	io_req_bits_block_stride,
	io_resp_ready,
	io_resp_valid,
	io_resp_bits_tag_cols,
	io_resp_bits_tag_pixel_repeats,
	io_resp_bits_tag_cmd_id,
	io_resp_bits_laddr_is_acc_addr,
	io_resp_bits_laddr_accumulate,
	io_resp_bits_laddr_data,
	io_resp_bits_mask_0,
	io_resp_bits_mask_1,
	io_resp_bits_mask_2,
	io_resp_bits_mask_3,
	io_resp_bits_mask_4,
	io_resp_bits_mask_5,
	io_resp_bits_mask_6,
	io_resp_bits_mask_7,
	io_resp_bits_mask_8,
	io_resp_bits_mask_9,
	io_resp_bits_mask_10,
	io_resp_bits_mask_11,
	io_resp_bits_mask_12,
	io_resp_bits_mask_13,
	io_resp_bits_mask_14,
	io_resp_bits_mask_15,
	io_resp_bits_last
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input io_req_bits_laddr_is_acc_addr;
	input io_req_bits_laddr_accumulate;
	input [13:0] io_req_bits_laddr_data;
	input [15:0] io_req_bits_tag_cols;
	input [7:0] io_req_bits_tag_pixel_repeats;
	input [7:0] io_req_bits_tag_cmd_id;
	input [6:0] io_req_bits_cols;
	input [15:0] io_req_bits_block_stride;
	input io_resp_ready;
	output wire io_resp_valid;
	output wire [15:0] io_resp_bits_tag_cols;
	output wire [7:0] io_resp_bits_tag_pixel_repeats;
	output wire [7:0] io_resp_bits_tag_cmd_id;
	output wire io_resp_bits_laddr_is_acc_addr;
	output wire io_resp_bits_laddr_accumulate;
	output wire [13:0] io_resp_bits_laddr_data;
	output wire io_resp_bits_mask_0;
	output wire io_resp_bits_mask_1;
	output wire io_resp_bits_mask_2;
	output wire io_resp_bits_mask_3;
	output wire io_resp_bits_mask_4;
	output wire io_resp_bits_mask_5;
	output wire io_resp_bits_mask_6;
	output wire io_resp_bits_mask_7;
	output wire io_resp_bits_mask_8;
	output wire io_resp_bits_mask_9;
	output wire io_resp_bits_mask_10;
	output wire io_resp_bits_mask_11;
	output wire io_resp_bits_mask_12;
	output wire io_resp_bits_mask_13;
	output wire io_resp_bits_mask_14;
	output wire io_resp_bits_mask_15;
	output wire io_resp_bits_last;
	reg req_valid;
	reg req_bits_laddr_is_acc_addr;
	reg req_bits_laddr_accumulate;
	reg [13:0] req_bits_laddr_data;
	reg [15:0] req_bits_tag_cols;
	reg [7:0] req_bits_tag_pixel_repeats;
	reg [7:0] req_bits_tag_cmd_id;
	reg [6:0] req_bits_cols;
	reg [15:0] req_bits_block_stride;
	reg [5:0] col_counter;
	wire [6:0] _GEN = {1'h0, col_counter};
	wire [6:0] _next_col_counter_T_3 = _GEN + 7'h10;
	wire _GEN_0 = io_resp_ready & req_valid;
	wire _next_col_counter_T_4 = _next_col_counter_T_3 > (req_bits_cols - 7'h01);
	wire _GEN_1 = _GEN_0 & ((_next_col_counter_T_4 ? 6'h00 : _next_col_counter_T_3[5:0]) == 6'h00);
	wire io_req_ready_0 = _GEN_1 | ~req_valid;
	wire _GEN_2 = io_req_ready_0 & io_req_valid;
	always @(posedge clock) begin
		if (reset)
			req_valid <= 1'h0;
		else
			req_valid <= _GEN_2 | (~_GEN_1 & req_valid);
		if (_GEN_2) begin
			req_bits_laddr_is_acc_addr <= io_req_bits_laddr_is_acc_addr;
			req_bits_laddr_accumulate <= io_req_bits_laddr_accumulate;
			req_bits_laddr_data <= io_req_bits_laddr_data;
			req_bits_tag_cols <= io_req_bits_tag_cols;
			req_bits_tag_pixel_repeats <= io_req_bits_tag_pixel_repeats;
			req_bits_tag_cmd_id <= io_req_bits_tag_cmd_id;
			req_bits_cols <= io_req_bits_cols;
			req_bits_block_stride <= io_req_bits_block_stride;
			col_counter <= 6'h00;
		end
		else if (_GEN_0)
			if (_next_col_counter_T_4)
				col_counter <= 6'h00;
			else
				col_counter <= _next_col_counter_T_3[5:0];
	end
	assign io_req_ready = io_req_ready_0;
	assign io_resp_valid = req_valid;
	assign io_resp_bits_tag_cols = req_bits_tag_cols;
	assign io_resp_bits_tag_pixel_repeats = req_bits_tag_pixel_repeats;
	assign io_resp_bits_tag_cmd_id = req_bits_tag_cmd_id;
	assign io_resp_bits_laddr_is_acc_addr = req_bits_laddr_is_acc_addr;
	assign io_resp_bits_laddr_accumulate = req_bits_laddr_accumulate;
	assign io_resp_bits_laddr_data = req_bits_laddr_data + (req_bits_block_stride[13:0] * {8'h00, col_counter / 6'h10});
	assign io_resp_bits_mask_0 = _GEN < req_bits_cols;
	assign io_resp_bits_mask_1 = {1'h0, col_counter + 6'h01} < req_bits_cols;
	assign io_resp_bits_mask_2 = {1'h0, col_counter + 6'h02} < req_bits_cols;
	assign io_resp_bits_mask_3 = {1'h0, col_counter + 6'h03} < req_bits_cols;
	assign io_resp_bits_mask_4 = {1'h0, col_counter + 6'h04} < req_bits_cols;
	assign io_resp_bits_mask_5 = {1'h0, col_counter + 6'h05} < req_bits_cols;
	assign io_resp_bits_mask_6 = {1'h0, col_counter + 6'h06} < req_bits_cols;
	assign io_resp_bits_mask_7 = {1'h0, col_counter + 6'h07} < req_bits_cols;
	assign io_resp_bits_mask_8 = {1'h0, col_counter + 6'h08} < req_bits_cols;
	assign io_resp_bits_mask_9 = {1'h0, col_counter + 6'h09} < req_bits_cols;
	assign io_resp_bits_mask_10 = {1'h0, col_counter + 6'h0a} < req_bits_cols;
	assign io_resp_bits_mask_11 = {1'h0, col_counter + 6'h0b} < req_bits_cols;
	assign io_resp_bits_mask_12 = {1'h0, col_counter + 6'h0c} < req_bits_cols;
	assign io_resp_bits_mask_13 = {1'h0, col_counter + 6'h0d} < req_bits_cols;
	assign io_resp_bits_mask_14 = {1'h0, col_counter + 6'h0e} < req_bits_cols;
	assign io_resp_bits_mask_15 = {1'h0, col_counter + 6'h0f} < req_bits_cols;
	assign io_resp_bits_last = _next_col_counter_T_3 >= req_bits_cols;
endmodule
