module CounterController (
	clock,
	reset,
	io_in_ready,
	io_in_valid,
	io_in_bits_inst_rd,
	io_in_bits_rs1,
	io_out_ready,
	io_out_valid,
	io_out_bits_rd,
	io_out_bits_data,
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
	output wire io_in_ready;
	input io_in_valid;
	input [4:0] io_in_bits_inst_rd;
	input [63:0] io_in_bits_rs1;
	input io_out_ready;
	output wire io_out_valid;
	output wire [4:0] io_out_bits_rd;
	output wire [63:0] io_out_bits_data;
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
	wire [63:0] _counterfile_io_data;
	reg [4:0] out_reg_rd;
	reg [63:0] out_reg_data;
	reg out_valid_reg;
	wire _counterfile_io_config_address_valid_T_1 = ~out_valid_reg & io_in_valid;
	wire _GEN = io_out_ready & out_valid_reg;
	always @(posedge clock) begin
		if (_GEN | ~_counterfile_io_config_address_valid_T_1)
			;
		else begin
			out_reg_rd <= io_in_bits_inst_rd;
			out_reg_data <= _counterfile_io_data;
		end
		if (reset)
			out_valid_reg <= 1'h0;
		else
			out_valid_reg <= ~_GEN & (_counterfile_io_config_address_valid_T_1 | out_valid_reg);
	end
	CounterFile counterfile(
		.clock(clock),
		.reset(reset),
		.io_counter_reset(io_in_bits_rs1[0] & _counterfile_io_config_address_valid_T_1),
		.io_snapshot(io_in_bits_rs1[2] & _counterfile_io_config_address_valid_T_1),
		.io_snapshot_reset(io_in_bits_rs1[1] & _counterfile_io_config_address_valid_T_1),
		.io_addr(io_in_bits_rs1[6:4]),
		.io_data(_counterfile_io_data),
		.io_config_address_valid(io_in_bits_rs1[3] & _counterfile_io_config_address_valid_T_1),
		.io_config_address_bits(io_in_bits_rs1[17:12]),
		.io_external(io_in_bits_rs1[31]),
		.io_event_io_event_signal_1(io_event_io_event_signal_1),
		.io_event_io_event_signal_2(io_event_io_event_signal_2),
		.io_event_io_event_signal_3(io_event_io_event_signal_3),
		.io_event_io_event_signal_4(io_event_io_event_signal_4),
		.io_event_io_event_signal_5(io_event_io_event_signal_5),
		.io_event_io_event_signal_6(io_event_io_event_signal_6),
		.io_event_io_event_signal_7(io_event_io_event_signal_7),
		.io_event_io_event_signal_8(io_event_io_event_signal_8),
		.io_event_io_event_signal_9(io_event_io_event_signal_9),
		.io_event_io_event_signal_10(io_event_io_event_signal_10),
		.io_event_io_event_signal_11(io_event_io_event_signal_11),
		.io_event_io_event_signal_12(io_event_io_event_signal_12),
		.io_event_io_event_signal_13(io_event_io_event_signal_13),
		.io_event_io_event_signal_14(io_event_io_event_signal_14),
		.io_event_io_event_signal_15(io_event_io_event_signal_15),
		.io_event_io_event_signal_16(io_event_io_event_signal_16),
		.io_event_io_event_signal_17(io_event_io_event_signal_17),
		.io_event_io_event_signal_18(io_event_io_event_signal_18),
		.io_event_io_event_signal_19(io_event_io_event_signal_19),
		.io_event_io_event_signal_20(io_event_io_event_signal_20),
		.io_event_io_event_signal_21(io_event_io_event_signal_21),
		.io_event_io_event_signal_22(io_event_io_event_signal_22),
		.io_event_io_event_signal_23(io_event_io_event_signal_23),
		.io_event_io_event_signal_24(io_event_io_event_signal_24),
		.io_event_io_event_signal_25(io_event_io_event_signal_25),
		.io_event_io_event_signal_26(io_event_io_event_signal_26),
		.io_event_io_event_signal_27(io_event_io_event_signal_27),
		.io_event_io_event_signal_28(io_event_io_event_signal_28),
		.io_event_io_event_signal_29(io_event_io_event_signal_29),
		.io_event_io_event_signal_30(io_event_io_event_signal_30),
		.io_event_io_event_signal_31(io_event_io_event_signal_31),
		.io_event_io_event_signal_32(io_event_io_event_signal_32),
		.io_event_io_event_signal_33(io_event_io_event_signal_33),
		.io_event_io_event_signal_34(io_event_io_event_signal_34),
		.io_event_io_event_signal_35(io_event_io_event_signal_35),
		.io_event_io_event_signal_36(io_event_io_event_signal_36),
		.io_event_io_event_signal_37(io_event_io_event_signal_37),
		.io_event_io_event_signal_38(io_event_io_event_signal_38),
		.io_event_io_event_signal_39(io_event_io_event_signal_39),
		.io_event_io_event_signal_40(io_event_io_event_signal_40),
		.io_event_io_event_signal_41(io_event_io_event_signal_41),
		.io_event_io_event_signal_42(io_event_io_event_signal_42),
		.io_event_io_event_signal_43(io_event_io_event_signal_43),
		.io_event_io_external_values_1(io_event_io_external_values_1),
		.io_event_io_external_values_2(io_event_io_external_values_2),
		.io_event_io_external_values_3(io_event_io_external_values_3),
		.io_event_io_external_values_4(io_event_io_external_values_4),
		.io_event_io_external_values_5(io_event_io_external_values_5),
		.io_event_io_external_values_6(io_event_io_external_values_6),
		.io_event_io_external_values_7(io_event_io_external_values_7),
		.io_event_io_external_reset(io_event_io_external_reset)
	);
	assign io_in_ready = ~out_valid_reg;
	assign io_out_valid = out_valid_reg;
	assign io_out_bits_rd = out_reg_rd;
	assign io_out_bits_data = out_reg_data;
endmodule
