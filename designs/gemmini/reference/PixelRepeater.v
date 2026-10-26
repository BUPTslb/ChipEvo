module PixelRepeater (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_mask_0,
	io_req_bits_mask_1,
	io_req_bits_mask_2,
	io_req_bits_mask_3,
	io_req_bits_mask_4,
	io_req_bits_mask_5,
	io_req_bits_mask_6,
	io_req_bits_mask_7,
	io_req_bits_mask_8,
	io_req_bits_mask_9,
	io_req_bits_mask_10,
	io_req_bits_mask_11,
	io_req_bits_mask_12,
	io_req_bits_mask_13,
	io_req_bits_mask_14,
	io_req_bits_mask_15,
	io_req_bits_laddr_is_acc_addr,
	io_req_bits_laddr_accumulate,
	io_req_bits_laddr_data,
	io_req_bits_len,
	io_req_bits_pixel_repeats,
	io_req_bits_last,
	io_req_bits_tag_cols,
	io_req_bits_tag_cmd_id,
	io_resp_ready,
	io_resp_valid,
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
	io_resp_bits_laddr_is_acc_addr,
	io_resp_bits_laddr_accumulate,
	io_resp_bits_laddr_data,
	io_resp_bits_last,
	io_resp_bits_tag_cols,
	io_resp_bits_tag_cmd_id
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input io_req_bits_mask_0;
	input io_req_bits_mask_1;
	input io_req_bits_mask_2;
	input io_req_bits_mask_3;
	input io_req_bits_mask_4;
	input io_req_bits_mask_5;
	input io_req_bits_mask_6;
	input io_req_bits_mask_7;
	input io_req_bits_mask_8;
	input io_req_bits_mask_9;
	input io_req_bits_mask_10;
	input io_req_bits_mask_11;
	input io_req_bits_mask_12;
	input io_req_bits_mask_13;
	input io_req_bits_mask_14;
	input io_req_bits_mask_15;
	input io_req_bits_laddr_is_acc_addr;
	input io_req_bits_laddr_accumulate;
	input [13:0] io_req_bits_laddr_data;
	input [4:0] io_req_bits_len;
	input [7:0] io_req_bits_pixel_repeats;
	input io_req_bits_last;
	input [15:0] io_req_bits_tag_cols;
	input [7:0] io_req_bits_tag_cmd_id;
	input io_resp_ready;
	output wire io_resp_valid;
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
	output wire io_resp_bits_laddr_is_acc_addr;
	output wire io_resp_bits_laddr_accumulate;
	output wire [13:0] io_resp_bits_laddr_data;
	output wire io_resp_bits_last;
	output wire [15:0] io_resp_bits_tag_cols;
	output wire [7:0] io_resp_bits_tag_cmd_id;
	reg req_valid;
	reg req_bits_mask_0;
	reg req_bits_mask_1;
	reg req_bits_mask_2;
	reg req_bits_mask_3;
	reg req_bits_mask_4;
	reg req_bits_mask_5;
	reg req_bits_mask_6;
	reg req_bits_mask_7;
	reg req_bits_mask_8;
	reg req_bits_mask_9;
	reg req_bits_mask_10;
	reg req_bits_mask_11;
	reg req_bits_mask_12;
	reg req_bits_mask_13;
	reg req_bits_mask_14;
	reg req_bits_mask_15;
	reg req_bits_laddr_is_acc_addr;
	reg req_bits_laddr_accumulate;
	reg [13:0] req_bits_laddr_data;
	reg [4:0] req_bits_len;
	reg [7:0] req_bits_pixel_repeats;
	reg req_bits_last;
	reg [15:0] req_bits_tag_cols;
	reg [7:0] req_bits_tag_cmd_id;
	wire _io_resp_bits_last_T = req_bits_pixel_repeats == 8'h00;
	wire io_req_ready_0 = ~req_valid | (io_resp_ready & _io_resp_bits_last_T);
	wire [46:0] _GEN = {31'h00000000, req_bits_mask_15, req_bits_mask_14, req_bits_mask_13, req_bits_mask_12, req_bits_mask_11, req_bits_mask_10, req_bits_mask_9, req_bits_mask_8, req_bits_mask_7, req_bits_mask_6, req_bits_mask_5, req_bits_mask_4, req_bits_mask_3, req_bits_mask_2, req_bits_mask_1, req_bits_mask_0} << (req_bits_pixel_repeats[3:0] * req_bits_len[3:0]);
	always @(posedge clock)
		if (((~reset & req_valid) & req_bits_laddr_is_acc_addr) & |req_bits_pixel_repeats) begin
// synopsys translate_off
			$error("Assertion failed\n    at PixelRepeater.scala:58 assert(!(req.valid && is_acc_addr && req.bits.pixel_repeats > 0.U))\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	wire [13:0] _GEN_0 = {6'h00, req_bits_pixel_repeats};
	wire [14:0] _GEN_1 = {1'h0, req_bits_laddr_data};
	wire [13:0] _underflow_result_data_T_3 = req_bits_laddr_data - _GEN_0;
	wire [14:0] _underflow_underflow_T_1 = {7'h00, req_bits_pixel_repeats} + 15'h2000;
	wire underflow = ~req_bits_laddr_is_acc_addr & (req_bits_laddr_data[13] ? _GEN_1 < _underflow_underflow_T_1 : req_bits_laddr_data < _GEN_0);
	wire io_resp_valid_0 = req_valid & ~underflow;
	wire _GEN_2 = (io_resp_ready & io_resp_valid_0) | underflow;
	wire _GEN_3 = io_req_ready_0 & io_req_valid;
	always @(posedge clock) begin
		if (reset)
			req_valid <= 1'h0;
		else
			req_valid <= _GEN_3 | (~(_GEN_2 & _io_resp_bits_last_T) & req_valid);
		if (_GEN_3) begin
			req_bits_mask_0 <= io_req_bits_mask_0;
			req_bits_mask_1 <= io_req_bits_mask_1;
			req_bits_mask_2 <= io_req_bits_mask_2;
			req_bits_mask_3 <= io_req_bits_mask_3;
			req_bits_mask_4 <= io_req_bits_mask_4;
			req_bits_mask_5 <= io_req_bits_mask_5;
			req_bits_mask_6 <= io_req_bits_mask_6;
			req_bits_mask_7 <= io_req_bits_mask_7;
			req_bits_mask_8 <= io_req_bits_mask_8;
			req_bits_mask_9 <= io_req_bits_mask_9;
			req_bits_mask_10 <= io_req_bits_mask_10;
			req_bits_mask_11 <= io_req_bits_mask_11;
			req_bits_mask_12 <= io_req_bits_mask_12;
			req_bits_mask_13 <= io_req_bits_mask_13;
			req_bits_mask_14 <= io_req_bits_mask_14;
			req_bits_mask_15 <= io_req_bits_mask_15;
			req_bits_laddr_is_acc_addr <= io_req_bits_laddr_is_acc_addr;
			req_bits_laddr_accumulate <= io_req_bits_laddr_accumulate;
			req_bits_laddr_data <= io_req_bits_laddr_data;
			req_bits_len <= io_req_bits_len;
			req_bits_pixel_repeats <= io_req_bits_pixel_repeats - 8'h01;
			req_bits_last <= io_req_bits_last;
			req_bits_tag_cols <= io_req_bits_tag_cols;
			req_bits_tag_cmd_id <= io_req_bits_tag_cmd_id;
		end
		else if (_GEN_2)
			req_bits_pixel_repeats <= req_bits_pixel_repeats - 8'h01;
	end
	assign io_req_ready = io_req_ready_0;
	assign io_resp_valid = io_resp_valid_0;
	assign io_resp_bits_mask_0 = _GEN[0];
	assign io_resp_bits_mask_1 = _GEN[1];
	assign io_resp_bits_mask_2 = _GEN[2];
	assign io_resp_bits_mask_3 = _GEN[3];
	assign io_resp_bits_mask_4 = _GEN[4];
	assign io_resp_bits_mask_5 = _GEN[5];
	assign io_resp_bits_mask_6 = _GEN[6];
	assign io_resp_bits_mask_7 = _GEN[7];
	assign io_resp_bits_mask_8 = _GEN[8];
	assign io_resp_bits_mask_9 = _GEN[9];
	assign io_resp_bits_mask_10 = _GEN[10];
	assign io_resp_bits_mask_11 = _GEN[11];
	assign io_resp_bits_mask_12 = _GEN[12];
	assign io_resp_bits_mask_13 = _GEN[13];
	assign io_resp_bits_mask_14 = _GEN[14];
	assign io_resp_bits_mask_15 = _GEN[15];
	assign io_resp_bits_laddr_is_acc_addr = req_bits_laddr_is_acc_addr;
	assign io_resp_bits_laddr_accumulate = req_bits_laddr_accumulate;
	assign io_resp_bits_laddr_data = (req_bits_laddr_is_acc_addr ? req_bits_laddr_data : (req_bits_laddr_data[13] ? (_GEN_1 < _underflow_underflow_T_1 ? 14'h2000 : _underflow_result_data_T_3) : (req_bits_laddr_data < _GEN_0 ? 14'h0000 : _underflow_result_data_T_3)));
	assign io_resp_bits_last = req_bits_last & _io_resp_bits_last_T;
	assign io_resp_bits_tag_cols = req_bits_tag_cols;
	assign io_resp_bits_tag_cmd_id = req_bits_tag_cmd_id;
endmodule
