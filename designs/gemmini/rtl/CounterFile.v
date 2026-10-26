module CounterFile (
	clock,
	reset,
	io_counter_reset,
	io_snapshot,
	io_snapshot_reset,
	io_addr,
	io_data,
	io_config_address_valid,
	io_config_address_bits,
	io_external,
	io_event_io_event_signal_1,
	io_event_io_event_signal_2,
	io_event_io_event_signal_3,
	io_event_io_event_signal_4,
	io_event_io_event_signal_5,
	io_event_io_event_signal_6,
	io_event_io_event_signal_7,
	io_event_io_event_signal_8,
	io_event_io_event_signal_9,
	io_event_io_event_signal_10,
	io_event_io_event_signal_11,
	io_event_io_event_signal_12,
	io_event_io_event_signal_13,
	io_event_io_event_signal_14,
	io_event_io_event_signal_15,
	io_event_io_event_signal_16,
	io_event_io_event_signal_17,
	io_event_io_event_signal_18,
	io_event_io_event_signal_19,
	io_event_io_event_signal_20,
	io_event_io_event_signal_21,
	io_event_io_event_signal_22,
	io_event_io_event_signal_23,
	io_event_io_event_signal_24,
	io_event_io_event_signal_25,
	io_event_io_event_signal_26,
	io_event_io_event_signal_27,
	io_event_io_event_signal_28,
	io_event_io_event_signal_29,
	io_event_io_event_signal_30,
	io_event_io_event_signal_31,
	io_event_io_event_signal_32,
	io_event_io_event_signal_33,
	io_event_io_event_signal_34,
	io_event_io_event_signal_35,
	io_event_io_event_signal_36,
	io_event_io_event_signal_37,
	io_event_io_event_signal_38,
	io_event_io_event_signal_39,
	io_event_io_event_signal_40,
	io_event_io_event_signal_41,
	io_event_io_event_signal_42,
	io_event_io_event_signal_43,
	io_event_io_external_values_1,
	io_event_io_external_values_2,
	io_event_io_external_values_3,
	io_event_io_external_values_4,
	io_event_io_external_values_5,
	io_event_io_external_values_6,
	io_event_io_external_values_7,
	io_event_io_external_reset
);
	input clock;
	input reset;
	input io_counter_reset;
	input io_snapshot;
	input io_snapshot_reset;
	input [2:0] io_addr;
	output wire [63:0] io_data;
	input io_config_address_valid;
	input [5:0] io_config_address_bits;
	input io_external;
	input io_event_io_event_signal_1;
	input io_event_io_event_signal_2;
	input io_event_io_event_signal_3;
	input io_event_io_event_signal_4;
	input io_event_io_event_signal_5;
	input io_event_io_event_signal_6;
	input io_event_io_event_signal_7;
	input io_event_io_event_signal_8;
	input io_event_io_event_signal_9;
	input io_event_io_event_signal_10;
	input io_event_io_event_signal_11;
	input io_event_io_event_signal_12;
	input io_event_io_event_signal_13;
	input io_event_io_event_signal_14;
	input io_event_io_event_signal_15;
	input io_event_io_event_signal_16;
	input io_event_io_event_signal_17;
	input io_event_io_event_signal_18;
	input io_event_io_event_signal_19;
	input io_event_io_event_signal_20;
	input io_event_io_event_signal_21;
	input io_event_io_event_signal_22;
	input io_event_io_event_signal_23;
	input io_event_io_event_signal_24;
	input io_event_io_event_signal_25;
	input io_event_io_event_signal_26;
	input io_event_io_event_signal_27;
	input io_event_io_event_signal_28;
	input io_event_io_event_signal_29;
	input io_event_io_event_signal_30;
	input io_event_io_event_signal_31;
	input io_event_io_event_signal_32;
	input io_event_io_event_signal_33;
	input io_event_io_event_signal_34;
	input io_event_io_event_signal_35;
	input io_event_io_event_signal_36;
	input io_event_io_event_signal_37;
	input io_event_io_event_signal_38;
	input io_event_io_event_signal_39;
	input io_event_io_event_signal_40;
	input io_event_io_event_signal_41;
	input io_event_io_event_signal_42;
	input io_event_io_event_signal_43;
	input [31:0] io_event_io_external_values_1;
	input [31:0] io_event_io_external_values_2;
	input [31:0] io_event_io_external_values_3;
	input [31:0] io_event_io_external_values_4;
	input [31:0] io_event_io_external_values_5;
	input [31:0] io_event_io_external_values_6;
	input [31:0] io_event_io_external_values_7;
	output wire io_event_io_external_reset;
	reg [6:0] counter_config_0;
	reg [6:0] counter_config_1;
	reg [6:0] counter_config_2;
	reg [6:0] counter_config_3;
	reg [6:0] counter_config_4;
	reg [6:0] counter_config_5;
	reg [6:0] counter_config_6;
	reg [6:0] counter_config_7;
	reg counter_is_external_0;
	reg counter_is_external_1;
	reg counter_is_external_2;
	reg counter_is_external_3;
	reg counter_is_external_4;
	reg counter_is_external_5;
	reg counter_is_external_6;
	reg counter_is_external_7;
	reg [63:0] counter_snapshot_0;
	reg [63:0] counter_snapshot_1;
	reg [63:0] counter_snapshot_2;
	reg [63:0] counter_snapshot_3;
	reg [63:0] counter_snapshot_4;
	reg [63:0] counter_snapshot_5;
	reg [63:0] counter_snapshot_6;
	reg [63:0] counter_snapshot_7;
	reg [63:0] counters_0;
	reg [63:0] counters_1;
	reg [63:0] counters_2;
	reg [63:0] counters_3;
	reg [63:0] counters_4;
	reg [63:0] counters_5;
	reg [63:0] counters_6;
	reg [63:0] counters_7;
	reg snapshot_enable;
	wire [7:0] _GEN = {{counter_is_external_7}, {counter_is_external_6}, {counter_is_external_5}, {counter_is_external_4}, {counter_is_external_3}, {counter_is_external_2}, {counter_is_external_1}, {counter_is_external_0}};
	wire [255:0] _GEN_0 = {{io_event_io_external_values_7}, {io_event_io_external_values_6}, {io_event_io_external_values_5}, {io_event_io_external_values_4}, {io_event_io_external_values_3}, {io_event_io_external_values_2}, {io_event_io_external_values_1}, 32'h00000000};
	wire [55:0] _GEN_1 = {{counter_config_7}, {counter_config_6}, {counter_config_5}, {counter_config_4}, {counter_config_3}, {counter_config_2}, {counter_config_1}, {counter_config_0}};
	wire [511:0] _GEN_2 = {{counters_7}, {counters_6}, {counters_5}, {counters_4}, {counters_3}, {counters_2}, {counters_1}, {counters_0}};
	wire [511:0] _GEN_3 = {{counter_snapshot_7}, {counter_snapshot_6}, {counter_snapshot_5}, {counter_snapshot_4}, {counter_snapshot_3}, {counter_snapshot_2}, {counter_snapshot_1}, {counter_snapshot_0}};
	wire [6:0] _GEN_4 = {1'h0, io_config_address_bits};
	wire [18:0] _GEN_5 = 19'h00000;
	wire [63:0] _GEN_6 = {_GEN_5, {1'h0, {io_event_io_event_signal_43}, {io_event_io_event_signal_42}, {io_event_io_event_signal_41}, {io_event_io_event_signal_40}, {io_event_io_event_signal_39}, {io_event_io_event_signal_38}, {io_event_io_event_signal_37}, {io_event_io_event_signal_36}, {io_event_io_event_signal_35}, {io_event_io_event_signal_34}, {io_event_io_event_signal_33}, {io_event_io_event_signal_32}, {io_event_io_event_signal_31}, {io_event_io_event_signal_30}, {io_event_io_event_signal_29}, {io_event_io_event_signal_28}, {io_event_io_event_signal_27}, {io_event_io_event_signal_26}, {io_event_io_event_signal_25}, {io_event_io_event_signal_24}, {io_event_io_event_signal_23}, {io_event_io_event_signal_22}, {io_event_io_event_signal_21}, {io_event_io_event_signal_20}, {io_event_io_event_signal_19}, {io_event_io_event_signal_18}, {io_event_io_event_signal_17}, {io_event_io_event_signal_16}, {io_event_io_event_signal_15}, {io_event_io_event_signal_14}, {io_event_io_event_signal_13}, {io_event_io_event_signal_12}, {io_event_io_event_signal_11}, {io_event_io_event_signal_10}, {io_event_io_event_signal_9}, {io_event_io_event_signal_8}, {io_event_io_event_signal_7}, {io_event_io_event_signal_6}, {io_event_io_event_signal_5}, {io_event_io_event_signal_4}, {io_event_io_event_signal_3}, {io_event_io_event_signal_2}, {io_event_io_event_signal_1}, 1'h0}};
	wire _GEN_7 = io_config_address_valid & (io_addr == 3'h0);
	wire _GEN_8 = io_config_address_valid & (io_addr == 3'h1);
	wire _GEN_9 = io_config_address_valid & (io_addr == 3'h2);
	wire _GEN_10 = io_config_address_valid & (io_addr == 3'h3);
	wire _GEN_11 = io_config_address_valid & (io_addr == 3'h4);
	wire _GEN_12 = io_config_address_valid & (io_addr == 3'h5);
	wire _GEN_13 = io_config_address_valid & (io_addr == 3'h6);
	wire _GEN_14 = io_config_address_valid & &io_addr;
	always @(posedge clock) begin
		if (reset) begin
			counter_config_0 <= 7'h00;
			counter_config_1 <= 7'h00;
			counter_config_2 <= 7'h00;
			counter_config_3 <= 7'h00;
			counter_config_4 <= 7'h00;
			counter_config_5 <= 7'h00;
			counter_config_6 <= 7'h00;
			counter_config_7 <= 7'h00;
		end
		else begin
			if (_GEN_7)
				counter_config_0 <= _GEN_4;
			if (_GEN_8)
				counter_config_1 <= _GEN_4;
			if (_GEN_9)
				counter_config_2 <= _GEN_4;
			if (_GEN_10)
				counter_config_3 <= _GEN_4;
			if (_GEN_11)
				counter_config_4 <= _GEN_4;
			if (_GEN_12)
				counter_config_5 <= _GEN_4;
			if (_GEN_13)
				counter_config_6 <= _GEN_4;
			if (_GEN_14)
				counter_config_7 <= _GEN_4;
		end
		if (_GEN_7)
			counter_is_external_0 <= io_external;
		if (_GEN_8)
			counter_is_external_1 <= io_external;
		if (_GEN_9)
			counter_is_external_2 <= io_external;
		if (_GEN_10)
			counter_is_external_3 <= io_external;
		if (_GEN_11)
			counter_is_external_4 <= io_external;
		if (_GEN_12)
			counter_is_external_5 <= io_external;
		if (_GEN_13)
			counter_is_external_6 <= io_external;
		if (_GEN_14)
			counter_is_external_7 <= io_external;
		if (reset | io_counter_reset) begin
			counter_snapshot_0 <= 64'h0000000000000000;
			counter_snapshot_1 <= 64'h0000000000000000;
			counter_snapshot_2 <= 64'h0000000000000000;
			counter_snapshot_3 <= 64'h0000000000000000;
			counter_snapshot_4 <= 64'h0000000000000000;
			counter_snapshot_5 <= 64'h0000000000000000;
			counter_snapshot_6 <= 64'h0000000000000000;
			counter_snapshot_7 <= 64'h0000000000000000;
			counters_0 <= 64'h0000000000000000;
			counters_1 <= 64'h0000000000000000;
			counters_2 <= 64'h0000000000000000;
			counters_3 <= 64'h0000000000000000;
			counters_4 <= 64'h0000000000000000;
			counters_5 <= 64'h0000000000000000;
			counters_6 <= 64'h0000000000000000;
			counters_7 <= 64'h0000000000000000;
			snapshot_enable <= 1'h0;
		end
		else begin
			if (io_snapshot_reset | ~io_snapshot)
				;
			else begin
				counter_snapshot_0 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_0[2:0] * 32+:32]} : counters_0);
				counter_snapshot_1 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_1[2:0] * 32+:32]} : counters_1);
				counter_snapshot_2 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_2[2:0] * 32+:32]} : counters_2);
				counter_snapshot_3 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_3[2:0] * 32+:32]} : counters_3);
				counter_snapshot_4 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_4[2:0] * 32+:32]} : counters_4);
				counter_snapshot_5 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_5[2:0] * 32+:32]} : counters_5);
				counter_snapshot_6 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_6[2:0] * 32+:32]} : counters_6);
				counter_snapshot_7 <= (_GEN[io_addr] ? {32'h00000000, _GEN_0[counter_config_7[2:0] * 32+:32]} : counters_7);
			end
			if (_GEN_6[counter_config_0[5:0]] & ~_GEN_7)
				counters_0 <= counters_0 + 64'h0000000000000001;
			else if (_GEN_7)
				counters_0 <= 64'h0000000000000000;
			if (_GEN_6[counter_config_1[5:0]] & ~_GEN_8)
				counters_1 <= counters_1 + 64'h0000000000000001;
			else if (_GEN_8)
				counters_1 <= 64'h0000000000000000;
			if (_GEN_6[counter_config_2[5:0]] & ~_GEN_9)
				counters_2 <= counters_2 + 64'h0000000000000001;
			else if (_GEN_9)
				counters_2 <= 64'h0000000000000000;
			if (_GEN_6[counter_config_3[5:0]] & ~_GEN_10)
				counters_3 <= counters_3 + 64'h0000000000000001;
			else if (_GEN_10)
				counters_3 <= 64'h0000000000000000;
			if (_GEN_6[counter_config_4[5:0]] & ~_GEN_11)
				counters_4 <= counters_4 + 64'h0000000000000001;
			else if (_GEN_11)
				counters_4 <= 64'h0000000000000000;
			if (_GEN_6[counter_config_5[5:0]] & ~_GEN_12)
				counters_5 <= counters_5 + 64'h0000000000000001;
			else if (_GEN_12)
				counters_5 <= 64'h0000000000000000;
			if (_GEN_6[counter_config_6[5:0]] & ~_GEN_13)
				counters_6 <= counters_6 + 64'h0000000000000001;
			else if (_GEN_13)
				counters_6 <= 64'h0000000000000000;
			if (_GEN_6[counter_config_7[5:0]] & ~_GEN_14)
				counters_7 <= counters_7 + 64'h0000000000000001;
			else if (_GEN_14)
				counters_7 <= 64'h0000000000000000;
			snapshot_enable <= ~io_snapshot_reset & (io_snapshot | snapshot_enable);
		end
	end
	assign io_data = (snapshot_enable ? _GEN_3[io_addr * 64+:64] : (_GEN[io_addr] ? {32'h00000000, _GEN_0[_GEN_1[(io_addr * 7) + 2-:3] * 32+:32]} : _GEN_2[io_addr * 64+:64]));
	assign io_event_io_external_reset = io_counter_reset;
endmodule
