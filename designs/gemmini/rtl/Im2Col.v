module Im2Col (
	clock,
	reset,
	io_req_bits_addr_data,
	io_req_bits_ocol,
	io_req_bits_krow,
	io_req_bits_icol,
	io_req_bits_stride,
	io_req_bits_row_turn,
	io_req_bits_kdim2,
	io_req_bits_row_left,
	io_req_bits_start_inputting,
	io_resp_bits_a_im2col_0,
	io_resp_bits_a_im2col_1,
	io_resp_bits_a_im2col_2,
	io_resp_bits_a_im2col_3,
	io_resp_bits_a_im2col_4,
	io_resp_bits_a_im2col_5,
	io_resp_bits_a_im2col_6,
	io_resp_bits_a_im2col_7,
	io_resp_bits_a_im2col_8,
	io_resp_bits_a_im2col_9,
	io_resp_bits_a_im2col_10,
	io_resp_bits_a_im2col_11,
	io_resp_bits_a_im2col_12,
	io_resp_bits_a_im2col_13,
	io_resp_bits_a_im2col_14,
	io_resp_bits_a_im2col_15,
	io_sram_reads_0_req_bits_addr,
	io_sram_reads_0_resp_valid,
	io_sram_reads_1_req_bits_addr,
	io_sram_reads_1_resp_valid,
	io_sram_reads_2_req_bits_addr,
	io_sram_reads_2_resp_valid,
	io_sram_reads_3_req_bits_addr,
	io_sram_reads_3_resp_valid,
	io_counter_event_signal_38,
	io_counter_event_signal_39,
	io_counter_event_signal_40
);
	input clock;
	input reset;
	input [13:0] io_req_bits_addr_data;
	input [7:0] io_req_bits_ocol;
	input [3:0] io_req_bits_krow;
	input [8:0] io_req_bits_icol;
	input [2:0] io_req_bits_stride;
	input [10:0] io_req_bits_row_turn;
	input [7:0] io_req_bits_kdim2;
	input [3:0] io_req_bits_row_left;
	input io_req_bits_start_inputting;
	output wire [7:0] io_resp_bits_a_im2col_0;
	output wire [7:0] io_resp_bits_a_im2col_1;
	output wire [7:0] io_resp_bits_a_im2col_2;
	output wire [7:0] io_resp_bits_a_im2col_3;
	output wire [7:0] io_resp_bits_a_im2col_4;
	output wire [7:0] io_resp_bits_a_im2col_5;
	output wire [7:0] io_resp_bits_a_im2col_6;
	output wire [7:0] io_resp_bits_a_im2col_7;
	output wire [7:0] io_resp_bits_a_im2col_8;
	output wire [7:0] io_resp_bits_a_im2col_9;
	output wire [7:0] io_resp_bits_a_im2col_10;
	output wire [7:0] io_resp_bits_a_im2col_11;
	output wire [7:0] io_resp_bits_a_im2col_12;
	output wire [7:0] io_resp_bits_a_im2col_13;
	output wire [7:0] io_resp_bits_a_im2col_14;
	output wire [7:0] io_resp_bits_a_im2col_15;
	output wire [11:0] io_sram_reads_0_req_bits_addr;
	input io_sram_reads_0_resp_valid;
	output wire [11:0] io_sram_reads_1_req_bits_addr;
	input io_sram_reads_1_resp_valid;
	output wire [11:0] io_sram_reads_2_req_bits_addr;
	input io_sram_reads_2_resp_valid;
	output wire [11:0] io_sram_reads_3_req_bits_addr;
	input io_sram_reads_3_resp_valid;
	output wire io_counter_event_signal_38;
	output wire io_counter_event_signal_39;
	output wire io_counter_event_signal_40;
	wire _sram_read_signals_q_io_deq_valid;
	wire _sram_read_signals_q_io_deq_bits_im2col_fin_pulse;
	reg req_start_inputting;
	reg [5:0] column_counter;
	reg [12:0] window_row_counter;
	reg [12:0] window_start_counter;
	reg [7:0] im2col_data_0;
	reg [7:0] im2col_data_1;
	reg [7:0] im2col_data_2;
	reg [7:0] im2col_data_3;
	reg [7:0] im2col_data_4;
	reg [7:0] im2col_data_5;
	reg [7:0] im2col_data_6;
	reg [7:0] im2col_data_7;
	reg [7:0] im2col_data_8;
	reg [7:0] im2col_data_9;
	reg [7:0] im2col_data_10;
	reg [7:0] im2col_data_11;
	reg [7:0] im2col_data_12;
	reg [7:0] im2col_data_13;
	reg [7:0] im2col_data_14;
	reg [7:0] im2col_data_15;
	reg valid_reg;
	reg im2col_fin_reg;
	reg im2col_fin;
	reg sram_read_req;
	reg [13:0] copy_addr_data;
	reg [2:0] im2col_state;
	reg [7:0] im2col_turn;
	reg [7:0] modulo_im2col_turn;
	reg im2col_fin_reset;
	reg [10:0] im2col_row_turn_counter;
	reg [10:0] im2col_row_turn_counter_d;
	wire _busy_T_3 = im2col_state == 3'h1;
	reg [15:0] modulo_block_done;
	reg [15:0] modulo_block_save;
	wire [13:0] _im2col_spad_row_qual2_result_data_T = copy_addr_data + {1'h0, window_start_counter + window_row_counter};
	wire [1:0] im2col_spad_bank = _im2col_spad_row_qual2_result_data_T[13:12];
	wire [3:0] _GEN = {{io_sram_reads_3_resp_valid}, {io_sram_reads_2_resp_valid}, {io_sram_reads_1_resp_valid}, {io_sram_reads_0_resp_valid}};
	wire io_counter_event_signal_38_0 = im2col_state == 3'h3;
	wire io_counter_event_signal_39_0 = im2col_state == 3'h2;
	reg row_turn_counter_noreset;
	reg im2col_fin_pulse;
	reg [7:0] turn_count_save;
	reg [12:0] window_start_counter_prev;
	wire sram_resp_valid = ((io_counter_event_signal_38_0 | io_counter_event_signal_39_0) & _GEN[im2col_spad_bank]) & ~im2col_fin_reset;
	reg req_valid;
	reg [4:0] valid_count;
	reg sram_req_deq_valid_d;
	wire _GEN_0 = im2col_state == 3'h2;
	wire _GEN_1 = im2col_state == 3'h3;
	wire _GEN_2 = ((turn_count_save - im2col_turn) + 8'h01) == io_req_bits_kdim2;
	wire _GEN_3 = im2col_turn == 8'h01;
	wire _GEN_4 = _GEN_1 & ~sram_resp_valid;
	wire _GEN_5 = im2col_state == 3'h4;
	wire _GEN_6 = |im2col_row_turn_counter_d & ~im2col_fin;
	wire _GEN_7 = _GEN_3 & im2col_fin_reg;
	wire [12:0] _GEN_8 = {10'h000, io_req_bits_stride};
	wire [15:0] _GEN_9 = {8'h00, io_req_bits_ocol};
	wire [12:0] _GEN_10 = {9'h000, io_req_bits_krow};
	wire [11:0] _GEN_11 = {3'h0, io_req_bits_icol};
	wire _GEN_12 = column_counter == 6'h0f;
	wire _GEN_13 = ((~req_valid & ~req_start_inputting) & ~sram_resp_valid) | im2col_fin_reset;
	wire _GEN_14 = (~sram_resp_valid | ~req_valid) & sram_read_req;
	wire _GEN_15 = (sram_resp_valid & sram_read_req) & req_valid;
	wire [5:0] _column_counter_T_17 = column_counter + 6'h01;
	wire _GEN_16 = (~(|im2col_row_turn_counter) & (column_counter == {2'h0, io_req_bits_row_left - 4'h1})) | _GEN_12;
	wire _GEN_17 = _GEN_15 & ~im2col_fin;
	wire [7:0] _GEN_18 = {4'h0, io_req_bits_krow};
	wire _GEN_19 = (((io_req_bits_kdim2 - im2col_turn) + 8'h01) - modulo_im2col_turn) == _GEN_18;
	wire [23:0] _GEN_20 = {{im2col_state}, {im2col_state}, {im2col_state}, {(_GEN_6 ? 3'h1 : (|im2col_row_turn_counter_d ? im2col_state : 3'h0))}, {(sram_resp_valid ? im2col_state : (_GEN_3 ? 3'h4 : 3'h2))}, {((sram_resp_valid & ~im2col_fin_reset) & req_start_inputting ? 3'h3 : im2col_state)}, 3'h0, {im2col_state}};
	wire _GEN_21 = (_GEN_1 & ~sram_resp_valid) & _GEN_3;
	wire [10:0] _block_done_T = io_req_bits_row_turn - im2col_row_turn_counter;
	wire [15:0] _GEN_22 = {1'h0, _block_done_T, 4'h0};
	wire _GEN_23 = im2col_state == 3'h0;
	wire _GEN_24 = im2col_state == 3'h1;
	wire _GEN_25 = im2col_turn == 8'h00;
	wire _GEN_26 = _GEN_23 | ~(_GEN_24 & _GEN_25);
	wire _GEN_27 = (((_GEN_23 | _GEN_24) | _GEN_0) | _GEN_1) | ~_GEN_5;
	wire _GEN_28 = ({1'h0, _block_done_T + 11'h001, 4'h0} - modulo_block_done) == _GEN_9;
	wire _GEN_29 = (({10'h000, _column_counter_T_17} + _GEN_22) - modulo_block_done) == _GEN_9;
	always @(posedge clock) begin
		if (_GEN_26)
			;
		else
			req_start_inputting <= io_req_bits_start_inputting;
		im2col_fin_pulse <= _sram_read_signals_q_io_deq_bits_im2col_fin_pulse;
		sram_req_deq_valid_d <= _sram_read_signals_q_io_deq_valid;
		if (reset) begin
			column_counter <= 6'h00;
			window_row_counter <= 13'h0000;
			window_start_counter <= 13'h0000;
			im2col_data_0 <= 8'h00;
			im2col_data_1 <= 8'h00;
			im2col_data_2 <= 8'h00;
			im2col_data_3 <= 8'h00;
			im2col_data_4 <= 8'h00;
			im2col_data_5 <= 8'h00;
			im2col_data_6 <= 8'h00;
			im2col_data_7 <= 8'h00;
			im2col_data_8 <= 8'h00;
			im2col_data_9 <= 8'h00;
			im2col_data_10 <= 8'h00;
			im2col_data_11 <= 8'h00;
			im2col_data_12 <= 8'h00;
			im2col_data_13 <= 8'h00;
			im2col_data_14 <= 8'h00;
			im2col_data_15 <= 8'h00;
			valid_reg <= 1'h0;
			im2col_fin_reg <= 1'h0;
			im2col_fin <= 1'h0;
			sram_read_req <= 1'h1;
			copy_addr_data <= io_req_bits_addr_data;
			im2col_state <= 3'h0;
			im2col_turn <= io_req_bits_kdim2;
			modulo_im2col_turn <= io_req_bits_kdim2;
			im2col_fin_reset <= 1'h0;
			im2col_row_turn_counter <= 11'h000;
			im2col_row_turn_counter_d <= im2col_row_turn_counter;
			modulo_block_done <= _GEN_22;
			modulo_block_save <= _GEN_22;
			row_turn_counter_noreset <= 1'h0;
			turn_count_save <= im2col_turn;
			window_start_counter_prev <= 13'h0000;
			req_valid <= 1'h0;
			valid_count <= 5'h00;
		end
		else begin
			if (_GEN_13)
				column_counter <= 6'h00;
			else if (_GEN_14)
				window_start_counter <= window_start_counter_prev;
			else begin
				if (_GEN_15) begin
					if (column_counter > 6'h0e)
						column_counter <= ((6'h01 - 6'h0f) + column_counter) - 6'h01;
					else
						column_counter <= _column_counter_T_17;
				end
				else
					column_counter <= 6'h00;
				if (_GEN_17) begin
					if (~_GEN_16)
						if (_GEN_29)
							window_start_counter <= (window_start_counter + _GEN_10) + {1'h0, {9'h000, io_req_bits_stride - 3'h1} * _GEN_11};
						else
							window_start_counter <= window_start_counter + _GEN_8;
				end
				else
					window_start_counter <= 13'h0000;
			end
			if (_GEN_5 | ~im2col_fin_reg) begin
				if (_GEN_27)
					;
				else
					window_row_counter <= 13'h0000;
			end
			else if (_GEN_2)
				window_row_counter <= 13'h0000;
			else if (_GEN_19)
				window_row_counter <= ((window_row_counter + {4'h0, io_req_bits_icol}) - _GEN_10) + 13'h0001;
			else
				window_row_counter <= window_row_counter + 13'h0001;
			im2col_data_0 <= 8'h00;
			im2col_data_1 <= 8'h00;
			im2col_data_2 <= 8'h00;
			im2col_data_3 <= 8'h00;
			im2col_data_4 <= 8'h00;
			im2col_data_5 <= 8'h00;
			im2col_data_6 <= 8'h00;
			im2col_data_7 <= 8'h00;
			im2col_data_8 <= 8'h00;
			im2col_data_9 <= 8'h00;
			im2col_data_10 <= 8'h00;
			im2col_data_11 <= 8'h00;
			im2col_data_12 <= 8'h00;
			im2col_data_13 <= 8'h00;
			im2col_data_14 <= 8'h00;
			im2col_data_15 <= 8'h00;
			valid_reg <= sram_req_deq_valid_d & ~im2col_fin_pulse;
			im2col_fin_reg <= _GEN_12;
			im2col_fin <= ~_GEN_13 & (_GEN_14 ? im2col_fin : (_GEN_15 ? (~im2col_fin & _GEN_16) | im2col_fin : _GEN_16 | im2col_fin));
			sram_read_req <= ~(_GEN_23 | _GEN_24) & (_GEN_0 | (_GEN_1 ? (~sram_resp_valid & ~_GEN_3) | (~im2col_fin_reg & sram_read_req) : sram_read_req));
			if (_GEN_23 | ~_GEN_24)
				;
			else
				copy_addr_data <= io_req_bits_addr_data;
			im2col_state <= _GEN_20[im2col_state * 3+:3];
			if (~_GEN_23)
				if (_GEN_24) begin
					if (_GEN_25)
						im2col_turn <= io_req_bits_kdim2;
					if (row_turn_counter_noreset)
						;
					else begin
						im2col_row_turn_counter <= io_req_bits_row_turn;
						modulo_block_save <= 16'h0000;
					end
					turn_count_save <= io_req_bits_kdim2;
				end
				else begin
					if (_GEN_0 | ~_GEN_4)
						;
					else if (_GEN_3)
						im2col_turn <= 8'h00;
					else if (im2col_turn == 8'h02)
						im2col_turn <= 8'h01;
					else
						im2col_turn <= im2col_turn - 8'h01;
					if (_GEN_0 | ~(_GEN_21 & |im2col_row_turn_counter))
						;
					else
						im2col_row_turn_counter <= im2col_row_turn_counter - 11'h001;
					if (_GEN_0 | ~_GEN_21)
						;
					else
						modulo_block_save <= modulo_block_done;
					if (_GEN_0 | ~((_GEN_1 & ~sram_resp_valid) & _GEN_2))
						;
					else
						turn_count_save <= im2col_turn - 8'h01;
				end
			if (((_GEN_5 | ~im2col_fin_reg) | _GEN_2) | ~_GEN_19) begin
				if (_GEN_26)
					;
				else
					modulo_im2col_turn <= 8'h00;
			end
			else
				modulo_im2col_turn <= modulo_im2col_turn + _GEN_18;
			im2col_fin_reset <= ~_GEN_23 & (_GEN_24 ? ~io_req_bits_start_inputting : ~_GEN_0 & (_GEN_1 ? ~sram_resp_valid | im2col_fin_reset : _GEN_5 | im2col_fin_reset));
			if (_busy_T_3)
				im2col_row_turn_counter_d <= im2col_row_turn_counter;
			if ((((_GEN_13 | _GEN_14) | ~_GEN_17) | _GEN_16) | ~_GEN_29) begin
				if (_GEN_7 & _GEN_28)
					modulo_block_done <= modulo_block_done + _GEN_9;
				else if (~_GEN_23)
					if (_GEN_24) begin
						if (row_turn_counter_noreset)
							;
						else
							modulo_block_done <= 16'h0000;
					end
					else if ((_GEN_0 | ~_GEN_4) | _GEN_3)
						;
					else
						modulo_block_done <= modulo_block_save;
			end
			else
				modulo_block_done <= modulo_block_done + _GEN_9;
			if (_GEN_27)
				;
			else
				row_turn_counter_noreset <= _GEN_6 | |im2col_row_turn_counter_d;
			if (_GEN_7)
				window_start_counter_prev <= (_GEN_28 ? (window_start_counter + _GEN_10) + {1'h0, {9'h000, io_req_bits_stride - 3'h1} * _GEN_11} : window_start_counter + _GEN_8);
			if (req_valid & valid_reg) begin
				req_valid <= valid_count != 5'h0f;
				if (valid_count > 5'h0e)
					valid_count <= ((5'h01 - 5'h0f) + valid_count) - 5'h01;
				else
					valid_count <= valid_count + 5'h01;
			end
		end
	end
	Queue5_im2colRowSignals sram_read_signals_q(
		.clock(clock),
		.reset(reset),
		.io_deq_valid(_sram_read_signals_q_io_deq_valid),
		.io_deq_bits_im2col_fin_pulse(_sram_read_signals_q_io_deq_bits_im2col_fin_pulse)
	);
	assign io_resp_bits_a_im2col_0 = im2col_data_0;
	assign io_resp_bits_a_im2col_1 = im2col_data_1;
	assign io_resp_bits_a_im2col_2 = im2col_data_2;
	assign io_resp_bits_a_im2col_3 = im2col_data_3;
	assign io_resp_bits_a_im2col_4 = im2col_data_4;
	assign io_resp_bits_a_im2col_5 = im2col_data_5;
	assign io_resp_bits_a_im2col_6 = im2col_data_6;
	assign io_resp_bits_a_im2col_7 = im2col_data_7;
	assign io_resp_bits_a_im2col_8 = im2col_data_8;
	assign io_resp_bits_a_im2col_9 = im2col_data_9;
	assign io_resp_bits_a_im2col_10 = im2col_data_10;
	assign io_resp_bits_a_im2col_11 = im2col_data_11;
	assign io_resp_bits_a_im2col_12 = im2col_data_12;
	assign io_resp_bits_a_im2col_13 = im2col_data_13;
	assign io_resp_bits_a_im2col_14 = im2col_data_14;
	assign io_resp_bits_a_im2col_15 = im2col_data_15;
	assign io_sram_reads_0_req_bits_addr = _im2col_spad_row_qual2_result_data_T[11:0];
	assign io_sram_reads_1_req_bits_addr = _im2col_spad_row_qual2_result_data_T[11:0];
	assign io_sram_reads_2_req_bits_addr = _im2col_spad_row_qual2_result_data_T[11:0];
	assign io_sram_reads_3_req_bits_addr = _im2col_spad_row_qual2_result_data_T[11:0];
	assign io_counter_event_signal_38 = io_counter_event_signal_38_0;
	assign io_counter_event_signal_39 = io_counter_event_signal_39_0;
	assign io_counter_event_signal_40 = _busy_T_3 & sram_read_req;
endmodule
