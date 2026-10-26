module BeatMerger (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_shift,
	io_req_bits_addr,
	io_req_bits_is_acc,
	io_req_bits_accumulate,
	io_req_bits_has_acc_bitwidth,
	io_req_bits_block_stride,
	io_req_bits_spad_row_offset,
	io_req_bits_lg_len_req,
	io_req_bits_bytes_to_read,
	io_in_ready,
	io_in_valid,
	io_in_bits,
	io_out_ready,
	io_out_valid,
	io_out_bits_data,
	io_out_bits_addr,
	io_out_bits_is_acc,
	io_out_bits_accumulate,
	io_out_bits_has_acc_bitwidth,
	io_out_bits_mask_0,
	io_out_bits_mask_1,
	io_out_bits_mask_2,
	io_out_bits_mask_3,
	io_out_bits_mask_4,
	io_out_bits_mask_5,
	io_out_bits_mask_6,
	io_out_bits_mask_7,
	io_out_bits_mask_8,
	io_out_bits_mask_9,
	io_out_bits_mask_10,
	io_out_bits_mask_11,
	io_out_bits_mask_12,
	io_out_bits_mask_13,
	io_out_bits_mask_14,
	io_out_bits_mask_15,
	io_out_bits_mask_16,
	io_out_bits_mask_17,
	io_out_bits_mask_18,
	io_out_bits_mask_19,
	io_out_bits_mask_20,
	io_out_bits_mask_21,
	io_out_bits_mask_22,
	io_out_bits_mask_23,
	io_out_bits_mask_24,
	io_out_bits_mask_25,
	io_out_bits_mask_26,
	io_out_bits_mask_27,
	io_out_bits_mask_28,
	io_out_bits_mask_29,
	io_out_bits_mask_30,
	io_out_bits_mask_31,
	io_out_bits_mask_32,
	io_out_bits_mask_33,
	io_out_bits_mask_34,
	io_out_bits_mask_35,
	io_out_bits_mask_36,
	io_out_bits_mask_37,
	io_out_bits_mask_38,
	io_out_bits_mask_39,
	io_out_bits_mask_40,
	io_out_bits_mask_41,
	io_out_bits_mask_42,
	io_out_bits_mask_43,
	io_out_bits_mask_44,
	io_out_bits_mask_45,
	io_out_bits_mask_46,
	io_out_bits_mask_47,
	io_out_bits_mask_48,
	io_out_bits_mask_49,
	io_out_bits_mask_50,
	io_out_bits_mask_51,
	io_out_bits_mask_52,
	io_out_bits_mask_53,
	io_out_bits_mask_54,
	io_out_bits_mask_55,
	io_out_bits_mask_56,
	io_out_bits_mask_57,
	io_out_bits_mask_58,
	io_out_bits_mask_59,
	io_out_bits_mask_60,
	io_out_bits_mask_61,
	io_out_bits_mask_62,
	io_out_bits_mask_63,
	io_out_bits_last
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [5:0] io_req_bits_shift;
	input [13:0] io_req_bits_addr;
	input io_req_bits_is_acc;
	input io_req_bits_accumulate;
	input io_req_bits_has_acc_bitwidth;
	input [15:0] io_req_bits_block_stride;
	input [8:0] io_req_bits_spad_row_offset;
	input [2:0] io_req_bits_lg_len_req;
	input [6:0] io_req_bits_bytes_to_read;
	output wire io_in_ready;
	input io_in_valid;
	input [127:0] io_in_bits;
	input io_out_ready;
	output wire io_out_valid;
	output wire [511:0] io_out_bits_data;
	output wire [13:0] io_out_bits_addr;
	output wire io_out_bits_is_acc;
	output wire io_out_bits_accumulate;
	output wire io_out_bits_has_acc_bitwidth;
	output wire io_out_bits_mask_0;
	output wire io_out_bits_mask_1;
	output wire io_out_bits_mask_2;
	output wire io_out_bits_mask_3;
	output wire io_out_bits_mask_4;
	output wire io_out_bits_mask_5;
	output wire io_out_bits_mask_6;
	output wire io_out_bits_mask_7;
	output wire io_out_bits_mask_8;
	output wire io_out_bits_mask_9;
	output wire io_out_bits_mask_10;
	output wire io_out_bits_mask_11;
	output wire io_out_bits_mask_12;
	output wire io_out_bits_mask_13;
	output wire io_out_bits_mask_14;
	output wire io_out_bits_mask_15;
	output wire io_out_bits_mask_16;
	output wire io_out_bits_mask_17;
	output wire io_out_bits_mask_18;
	output wire io_out_bits_mask_19;
	output wire io_out_bits_mask_20;
	output wire io_out_bits_mask_21;
	output wire io_out_bits_mask_22;
	output wire io_out_bits_mask_23;
	output wire io_out_bits_mask_24;
	output wire io_out_bits_mask_25;
	output wire io_out_bits_mask_26;
	output wire io_out_bits_mask_27;
	output wire io_out_bits_mask_28;
	output wire io_out_bits_mask_29;
	output wire io_out_bits_mask_30;
	output wire io_out_bits_mask_31;
	output wire io_out_bits_mask_32;
	output wire io_out_bits_mask_33;
	output wire io_out_bits_mask_34;
	output wire io_out_bits_mask_35;
	output wire io_out_bits_mask_36;
	output wire io_out_bits_mask_37;
	output wire io_out_bits_mask_38;
	output wire io_out_bits_mask_39;
	output wire io_out_bits_mask_40;
	output wire io_out_bits_mask_41;
	output wire io_out_bits_mask_42;
	output wire io_out_bits_mask_43;
	output wire io_out_bits_mask_44;
	output wire io_out_bits_mask_45;
	output wire io_out_bits_mask_46;
	output wire io_out_bits_mask_47;
	output wire io_out_bits_mask_48;
	output wire io_out_bits_mask_49;
	output wire io_out_bits_mask_50;
	output wire io_out_bits_mask_51;
	output wire io_out_bits_mask_52;
	output wire io_out_bits_mask_53;
	output wire io_out_bits_mask_54;
	output wire io_out_bits_mask_55;
	output wire io_out_bits_mask_56;
	output wire io_out_bits_mask_57;
	output wire io_out_bits_mask_58;
	output wire io_out_bits_mask_59;
	output wire io_out_bits_mask_60;
	output wire io_out_bits_mask_61;
	output wire io_out_bits_mask_62;
	output wire io_out_bits_mask_63;
	output wire io_out_bits_last;
	wire io_req_ready_0;
	reg req_valid;
	reg [5:0] req_bits_shift;
	reg [13:0] req_bits_addr;
	reg req_bits_is_acc;
	reg req_bits_accumulate;
	reg req_bits_has_acc_bitwidth;
	reg [15:0] req_bits_block_stride;
	reg [8:0] req_bits_spad_row_offset;
	reg [2:0] req_bits_lg_len_req;
	reg [6:0] req_bits_bytes_to_read;
	reg [511:0] buffer;
	wire [6:0] rowBytes = (req_bits_has_acc_bitwidth ? 7'h40 : 7'h10);
	reg [6:0] bytesSent;
	reg [6:0] bytesRead;
	wire [6:0] _GEN = {1'h0, req_bits_shift};
	wire [7:0] _GEN_0 = {1'h0, bytesRead};
	wire [6:0] bytesReadAfterShift = (bytesRead > _GEN ? bytesRead - _GEN : 7'h00);
	wire [6:0] usefulBytesRead = (bytesReadAfterShift < req_bits_bytes_to_read ? bytesReadAfterShift : req_bits_bytes_to_read);
	wire _spad_row_offset_T_63 = bytesSent == 7'h00;
	wire [9:0] _bytesSent_next_T_4 = {3'h0, bytesSent} + {1'h0, {2'h0, rowBytes} - (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000)};
	wire [8:0] _GEN_1 = {2'h0, req_bits_bytes_to_read};
	wire [8:0] bytesSent_next = (_bytesSent_next_T_4 > {3'h0, req_bits_bytes_to_read} ? _GEN_1 : _bytesSent_next_T_4[8:0]);
	wire last_sending = bytesSent_next == _GEN_1;
	wire [7:0] _io_in_ready_T_1 = 8'h01 << req_bits_lg_len_req;
	wire _current_lg_len_req_T = io_req_ready_0 & io_req_valid;
	wire io_in_ready_0 = _current_lg_len_req_T | (req_valid & (_GEN_0 != _io_in_ready_T_1));
	wire io_out_valid_0 = (req_valid & (usefulBytesRead > bytesSent)) & (((usefulBytesRead - bytesSent) >= rowBytes) | (usefulBytesRead == req_bits_bytes_to_read));
	wire [8702:0] _io_out_bits_data_T_5 = {8191'h0, buffer >> {502'h0, bytesSent, 3'h0}} << (_spad_row_offset_T_63 ? {1'h0, req_bits_spad_row_offset, 3'h0} : 13'h0000);
	wire [8:0] spad_row_offset = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [9:0] _GEN_2 = {3'h0, req_bits_bytes_to_read - bytesSent};
	wire [8:0] spad_row_offset_1 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [9:0] _GEN_3 = {1'h0, spad_row_offset_1} + _GEN_2;
	wire [8:0] spad_row_offset_2 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_3 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [9:0] _GEN_4 = {1'h0, spad_row_offset_3} + _GEN_2;
	wire [8:0] spad_row_offset_4 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_5 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_6 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_7 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [9:0] _GEN_5 = {1'h0, spad_row_offset_7} + _GEN_2;
	wire [8:0] spad_row_offset_8 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_9 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_10 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_11 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_12 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_13 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_14 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_15 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [9:0] _GEN_6 = {1'h0, spad_row_offset_15} + _GEN_2;
	wire [8:0] spad_row_offset_16 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_17 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_18 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_19 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_20 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_21 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_22 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_23 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_24 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_25 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_26 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_27 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_28 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_29 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_30 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_31 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [9:0] _GEN_7 = {1'h0, spad_row_offset_31} + _GEN_2;
	wire [8:0] spad_row_offset_32 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_33 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_34 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_35 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_36 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_37 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_38 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_39 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_40 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_41 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_42 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_43 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_44 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_45 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_46 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_47 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_48 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_49 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_50 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_51 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_52 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_53 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_54 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_55 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_56 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_57 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_58 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_59 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_60 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_61 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_62 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [8:0] spad_row_offset_63 = (_spad_row_offset_T_63 ? req_bits_spad_row_offset : 9'h000);
	wire [9:0] _GEN_8 = {1'h0, spad_row_offset_63} + _GEN_2;
	wire [8:0] _io_out_bits_addr_total_bytes_sent_T = req_bits_spad_row_offset + {2'h0, bytesSent};
	wire _GEN_9 = _GEN_0 == _io_in_ready_T_1;
	wire _GEN_10 = io_out_ready & io_out_valid_0;
	wire _GEN_11 = last_sending & _GEN_9;
	assign io_req_ready_0 = (_GEN_10 & _GEN_11) | ~req_valid;
	wire [2174:0] _GEN_12 = {2165'h0, (_current_lg_len_req_T ? 7'h00 : usefulBytesRead), 3'h0};
	wire [7:0] current_len_req = 8'h01 << (_current_lg_len_req_T ? io_req_bits_lg_len_req : req_bits_lg_len_req);
	wire [7:0] _bytesRead_T_2 = {1'h0, (_current_lg_len_req_T ? 7'h00 : bytesRead)} + 8'h10;
	wire _GEN_13 = bytesSent == req_bits_bytes_to_read;
	wire _GEN_14 = _GEN_9 & _GEN_13;
	wire _GEN_15 = io_in_ready_0 & io_in_valid;
	wire [6:0] _rshift_T = {1'h0, (_current_lg_len_req_T ? io_req_bits_shift : req_bits_shift)} - (_current_lg_len_req_T ? 7'h00 : bytesRead - bytesReadAfterShift);
	wire [127:0] _GEN_16 = {118'h000000000000000000000000000000, _rshift_T, 3'h0};
	wire [2174:0] _buffer_T_2 = {2047'h0, io_in_bits >> _GEN_16} << _GEN_12;
	wire [2174:0] _mask_T_2 = {2047'h0, 128'hffffffffffffffffffffffffffffffff >> _GEN_16} << _GEN_12;
	always @(posedge clock) begin
		req_valid <= ~(reset | (((_GEN_15 & ~_current_lg_len_req_T) & _GEN_13) & ((_io_in_ready_T_1 - _GEN_0) < 8'h11))) & (_current_lg_len_req_T | (_GEN_10 ? ~(_GEN_11 | _GEN_14) & req_valid : ~_GEN_14 & req_valid));
		if (_current_lg_len_req_T) begin
			req_bits_shift <= io_req_bits_shift;
			req_bits_addr <= io_req_bits_addr;
			req_bits_is_acc <= io_req_bits_is_acc;
			req_bits_accumulate <= io_req_bits_accumulate;
			req_bits_has_acc_bitwidth <= io_req_bits_has_acc_bitwidth;
			req_bits_block_stride <= io_req_bits_block_stride;
			req_bits_spad_row_offset <= io_req_bits_spad_row_offset;
			req_bits_lg_len_req <= io_req_bits_lg_len_req;
			req_bits_bytes_to_read <= io_req_bits_bytes_to_read;
			bytesSent <= 7'h00;
		end
		else if (_GEN_10)
			bytesSent <= bytesSent_next[6:0];
		if (_GEN_15 & (_rshift_T < 7'h11))
			buffer <= (~_mask_T_2[511:0] & buffer) | _buffer_T_2[511:0];
		if (_GEN_15)
			bytesRead <= (_bytesRead_T_2 > current_len_req ? current_len_req[6:0] : _bytesRead_T_2[6:0]);
		else if (_current_lg_len_req_T)
			bytesRead <= 7'h00;
	end
	assign io_req_ready = io_req_ready_0;
	assign io_in_ready = io_in_ready_0;
	assign io_out_valid = io_out_valid_0;
	assign io_out_bits_data = _io_out_bits_data_T_5[511:0];
	assign io_out_bits_addr = req_bits_addr + (req_bits_block_stride[13:0] * {5'h00, (req_bits_has_acc_bitwidth ? _io_out_bits_addr_total_bytes_sent_T / 9'h040 : _io_out_bits_addr_total_bytes_sent_T / 9'h010)});
	assign io_out_bits_is_acc = req_bits_is_acc;
	assign io_out_bits_accumulate = req_bits_accumulate;
	assign io_out_bits_has_acc_bitwidth = req_bits_has_acc_bitwidth;
	assign io_out_bits_mask_0 = (spad_row_offset == 9'h000) & |({1'h0, spad_row_offset} + _GEN_2);
	assign io_out_bits_mask_1 = (spad_row_offset_1 < 9'h002) & |_GEN_3[9:1];
	assign io_out_bits_mask_2 = (spad_row_offset_2 < 9'h003) & (({1'h0, spad_row_offset_2} + _GEN_2) > 10'h002);
	assign io_out_bits_mask_3 = (spad_row_offset_3 < 9'h004) & |_GEN_4[9:2];
	assign io_out_bits_mask_4 = (spad_row_offset_4 < 9'h005) & (({1'h0, spad_row_offset_4} + _GEN_2) > 10'h004);
	assign io_out_bits_mask_5 = (spad_row_offset_5 < 9'h006) & (({1'h0, spad_row_offset_5} + _GEN_2) > 10'h005);
	assign io_out_bits_mask_6 = (spad_row_offset_6 < 9'h007) & (({1'h0, spad_row_offset_6} + _GEN_2) > 10'h006);
	assign io_out_bits_mask_7 = (spad_row_offset_7 < 9'h008) & |_GEN_5[9:3];
	assign io_out_bits_mask_8 = (spad_row_offset_8 < 9'h009) & (({1'h0, spad_row_offset_8} + _GEN_2) > 10'h008);
	assign io_out_bits_mask_9 = (spad_row_offset_9 < 9'h00a) & (({1'h0, spad_row_offset_9} + _GEN_2) > 10'h009);
	assign io_out_bits_mask_10 = (spad_row_offset_10 < 9'h00b) & (({1'h0, spad_row_offset_10} + _GEN_2) > 10'h00a);
	assign io_out_bits_mask_11 = (spad_row_offset_11 < 9'h00c) & (({1'h0, spad_row_offset_11} + _GEN_2) > 10'h00b);
	assign io_out_bits_mask_12 = (spad_row_offset_12 < 9'h00d) & (({1'h0, spad_row_offset_12} + _GEN_2) > 10'h00c);
	assign io_out_bits_mask_13 = (spad_row_offset_13 < 9'h00e) & (({1'h0, spad_row_offset_13} + _GEN_2) > 10'h00d);
	assign io_out_bits_mask_14 = (spad_row_offset_14 < 9'h00f) & (({1'h0, spad_row_offset_14} + _GEN_2) > 10'h00e);
	assign io_out_bits_mask_15 = (spad_row_offset_15 < 9'h010) & |_GEN_6[9:4];
	assign io_out_bits_mask_16 = (spad_row_offset_16 < 9'h011) & (({1'h0, spad_row_offset_16} + _GEN_2) > 10'h010);
	assign io_out_bits_mask_17 = (spad_row_offset_17 < 9'h012) & (({1'h0, spad_row_offset_17} + _GEN_2) > 10'h011);
	assign io_out_bits_mask_18 = (spad_row_offset_18 < 9'h013) & (({1'h0, spad_row_offset_18} + _GEN_2) > 10'h012);
	assign io_out_bits_mask_19 = (spad_row_offset_19 < 9'h014) & (({1'h0, spad_row_offset_19} + _GEN_2) > 10'h013);
	assign io_out_bits_mask_20 = (spad_row_offset_20 < 9'h015) & (({1'h0, spad_row_offset_20} + _GEN_2) > 10'h014);
	assign io_out_bits_mask_21 = (spad_row_offset_21 < 9'h016) & (({1'h0, spad_row_offset_21} + _GEN_2) > 10'h015);
	assign io_out_bits_mask_22 = (spad_row_offset_22 < 9'h017) & (({1'h0, spad_row_offset_22} + _GEN_2) > 10'h016);
	assign io_out_bits_mask_23 = (spad_row_offset_23 < 9'h018) & (({1'h0, spad_row_offset_23} + _GEN_2) > 10'h017);
	assign io_out_bits_mask_24 = (spad_row_offset_24 < 9'h019) & (({1'h0, spad_row_offset_24} + _GEN_2) > 10'h018);
	assign io_out_bits_mask_25 = (spad_row_offset_25 < 9'h01a) & (({1'h0, spad_row_offset_25} + _GEN_2) > 10'h019);
	assign io_out_bits_mask_26 = (spad_row_offset_26 < 9'h01b) & (({1'h0, spad_row_offset_26} + _GEN_2) > 10'h01a);
	assign io_out_bits_mask_27 = (spad_row_offset_27 < 9'h01c) & (({1'h0, spad_row_offset_27} + _GEN_2) > 10'h01b);
	assign io_out_bits_mask_28 = (spad_row_offset_28 < 9'h01d) & (({1'h0, spad_row_offset_28} + _GEN_2) > 10'h01c);
	assign io_out_bits_mask_29 = (spad_row_offset_29 < 9'h01e) & (({1'h0, spad_row_offset_29} + _GEN_2) > 10'h01d);
	assign io_out_bits_mask_30 = (spad_row_offset_30 < 9'h01f) & (({1'h0, spad_row_offset_30} + _GEN_2) > 10'h01e);
	assign io_out_bits_mask_31 = (spad_row_offset_31 < 9'h020) & |_GEN_7[9:5];
	assign io_out_bits_mask_32 = (spad_row_offset_32 < 9'h021) & (({1'h0, spad_row_offset_32} + _GEN_2) > 10'h020);
	assign io_out_bits_mask_33 = (spad_row_offset_33 < 9'h022) & (({1'h0, spad_row_offset_33} + _GEN_2) > 10'h021);
	assign io_out_bits_mask_34 = (spad_row_offset_34 < 9'h023) & (({1'h0, spad_row_offset_34} + _GEN_2) > 10'h022);
	assign io_out_bits_mask_35 = (spad_row_offset_35 < 9'h024) & (({1'h0, spad_row_offset_35} + _GEN_2) > 10'h023);
	assign io_out_bits_mask_36 = (spad_row_offset_36 < 9'h025) & (({1'h0, spad_row_offset_36} + _GEN_2) > 10'h024);
	assign io_out_bits_mask_37 = (spad_row_offset_37 < 9'h026) & (({1'h0, spad_row_offset_37} + _GEN_2) > 10'h025);
	assign io_out_bits_mask_38 = (spad_row_offset_38 < 9'h027) & (({1'h0, spad_row_offset_38} + _GEN_2) > 10'h026);
	assign io_out_bits_mask_39 = (spad_row_offset_39 < 9'h028) & (({1'h0, spad_row_offset_39} + _GEN_2) > 10'h027);
	assign io_out_bits_mask_40 = (spad_row_offset_40 < 9'h029) & (({1'h0, spad_row_offset_40} + _GEN_2) > 10'h028);
	assign io_out_bits_mask_41 = (spad_row_offset_41 < 9'h02a) & (({1'h0, spad_row_offset_41} + _GEN_2) > 10'h029);
	assign io_out_bits_mask_42 = (spad_row_offset_42 < 9'h02b) & (({1'h0, spad_row_offset_42} + _GEN_2) > 10'h02a);
	assign io_out_bits_mask_43 = (spad_row_offset_43 < 9'h02c) & (({1'h0, spad_row_offset_43} + _GEN_2) > 10'h02b);
	assign io_out_bits_mask_44 = (spad_row_offset_44 < 9'h02d) & (({1'h0, spad_row_offset_44} + _GEN_2) > 10'h02c);
	assign io_out_bits_mask_45 = (spad_row_offset_45 < 9'h02e) & (({1'h0, spad_row_offset_45} + _GEN_2) > 10'h02d);
	assign io_out_bits_mask_46 = (spad_row_offset_46 < 9'h02f) & (({1'h0, spad_row_offset_46} + _GEN_2) > 10'h02e);
	assign io_out_bits_mask_47 = (spad_row_offset_47 < 9'h030) & (({1'h0, spad_row_offset_47} + _GEN_2) > 10'h02f);
	assign io_out_bits_mask_48 = (spad_row_offset_48 < 9'h031) & (({1'h0, spad_row_offset_48} + _GEN_2) > 10'h030);
	assign io_out_bits_mask_49 = (spad_row_offset_49 < 9'h032) & (({1'h0, spad_row_offset_49} + _GEN_2) > 10'h031);
	assign io_out_bits_mask_50 = (spad_row_offset_50 < 9'h033) & (({1'h0, spad_row_offset_50} + _GEN_2) > 10'h032);
	assign io_out_bits_mask_51 = (spad_row_offset_51 < 9'h034) & (({1'h0, spad_row_offset_51} + _GEN_2) > 10'h033);
	assign io_out_bits_mask_52 = (spad_row_offset_52 < 9'h035) & (({1'h0, spad_row_offset_52} + _GEN_2) > 10'h034);
	assign io_out_bits_mask_53 = (spad_row_offset_53 < 9'h036) & (({1'h0, spad_row_offset_53} + _GEN_2) > 10'h035);
	assign io_out_bits_mask_54 = (spad_row_offset_54 < 9'h037) & (({1'h0, spad_row_offset_54} + _GEN_2) > 10'h036);
	assign io_out_bits_mask_55 = (spad_row_offset_55 < 9'h038) & (({1'h0, spad_row_offset_55} + _GEN_2) > 10'h037);
	assign io_out_bits_mask_56 = (spad_row_offset_56 < 9'h039) & (({1'h0, spad_row_offset_56} + _GEN_2) > 10'h038);
	assign io_out_bits_mask_57 = (spad_row_offset_57 < 9'h03a) & (({1'h0, spad_row_offset_57} + _GEN_2) > 10'h039);
	assign io_out_bits_mask_58 = (spad_row_offset_58 < 9'h03b) & (({1'h0, spad_row_offset_58} + _GEN_2) > 10'h03a);
	assign io_out_bits_mask_59 = (spad_row_offset_59 < 9'h03c) & (({1'h0, spad_row_offset_59} + _GEN_2) > 10'h03b);
	assign io_out_bits_mask_60 = (spad_row_offset_60 < 9'h03d) & (({1'h0, spad_row_offset_60} + _GEN_2) > 10'h03c);
	assign io_out_bits_mask_61 = (spad_row_offset_61 < 9'h03e) & (({1'h0, spad_row_offset_61} + _GEN_2) > 10'h03d);
	assign io_out_bits_mask_62 = (spad_row_offset_62 < 9'h03f) & (({1'h0, spad_row_offset_62} + _GEN_2) > 10'h03e);
	assign io_out_bits_mask_63 = (spad_row_offset_63 < 9'h040) & |_GEN_8[9:6];
	assign io_out_bits_last = last_sending;
endmodule
