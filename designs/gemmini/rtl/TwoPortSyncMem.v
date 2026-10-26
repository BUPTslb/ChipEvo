module TwoPortSyncMem (
	clock,
	reset,
	io_waddr,
	io_raddr,
	io_wdata_0_0,
	io_wdata_1_0,
	io_wdata_2_0,
	io_wdata_3_0,
	io_wdata_4_0,
	io_wdata_5_0,
	io_wdata_6_0,
	io_wdata_7_0,
	io_wdata_8_0,
	io_wdata_9_0,
	io_wdata_10_0,
	io_wdata_11_0,
	io_wdata_12_0,
	io_wdata_13_0,
	io_wdata_14_0,
	io_wdata_15_0,
	io_rdata_0_0,
	io_rdata_1_0,
	io_rdata_2_0,
	io_rdata_3_0,
	io_rdata_4_0,
	io_rdata_5_0,
	io_rdata_6_0,
	io_rdata_7_0,
	io_rdata_8_0,
	io_rdata_9_0,
	io_rdata_10_0,
	io_rdata_11_0,
	io_rdata_12_0,
	io_rdata_13_0,
	io_rdata_14_0,
	io_rdata_15_0,
	io_wen,
	io_ren,
	io_mask_0,
	io_mask_1,
	io_mask_2,
	io_mask_3,
	io_mask_4,
	io_mask_5,
	io_mask_6,
	io_mask_7,
	io_mask_8,
	io_mask_9,
	io_mask_10,
	io_mask_11,
	io_mask_12,
	io_mask_13,
	io_mask_14,
	io_mask_15,
	io_mask_16,
	io_mask_17,
	io_mask_18,
	io_mask_19,
	io_mask_20,
	io_mask_21,
	io_mask_22,
	io_mask_23,
	io_mask_24,
	io_mask_25,
	io_mask_26,
	io_mask_27,
	io_mask_28,
	io_mask_29,
	io_mask_30,
	io_mask_31,
	io_mask_32,
	io_mask_33,
	io_mask_34,
	io_mask_35,
	io_mask_36,
	io_mask_37,
	io_mask_38,
	io_mask_39,
	io_mask_40,
	io_mask_41,
	io_mask_42,
	io_mask_43,
	io_mask_44,
	io_mask_45,
	io_mask_46,
	io_mask_47,
	io_mask_48,
	io_mask_49,
	io_mask_50,
	io_mask_51,
	io_mask_52,
	io_mask_53,
	io_mask_54,
	io_mask_55,
	io_mask_56,
	io_mask_57,
	io_mask_58,
	io_mask_59,
	io_mask_60,
	io_mask_61,
	io_mask_62,
	io_mask_63
);
	input clock;
	input reset;
	input [8:0] io_waddr;
	input [8:0] io_raddr;
	input [31:0] io_wdata_0_0;
	input [31:0] io_wdata_1_0;
	input [31:0] io_wdata_2_0;
	input [31:0] io_wdata_3_0;
	input [31:0] io_wdata_4_0;
	input [31:0] io_wdata_5_0;
	input [31:0] io_wdata_6_0;
	input [31:0] io_wdata_7_0;
	input [31:0] io_wdata_8_0;
	input [31:0] io_wdata_9_0;
	input [31:0] io_wdata_10_0;
	input [31:0] io_wdata_11_0;
	input [31:0] io_wdata_12_0;
	input [31:0] io_wdata_13_0;
	input [31:0] io_wdata_14_0;
	input [31:0] io_wdata_15_0;
	output wire [31:0] io_rdata_0_0;
	output wire [31:0] io_rdata_1_0;
	output wire [31:0] io_rdata_2_0;
	output wire [31:0] io_rdata_3_0;
	output wire [31:0] io_rdata_4_0;
	output wire [31:0] io_rdata_5_0;
	output wire [31:0] io_rdata_6_0;
	output wire [31:0] io_rdata_7_0;
	output wire [31:0] io_rdata_8_0;
	output wire [31:0] io_rdata_9_0;
	output wire [31:0] io_rdata_10_0;
	output wire [31:0] io_rdata_11_0;
	output wire [31:0] io_rdata_12_0;
	output wire [31:0] io_rdata_13_0;
	output wire [31:0] io_rdata_14_0;
	output wire [31:0] io_rdata_15_0;
	input io_wen;
	input io_ren;
	input io_mask_0;
	input io_mask_1;
	input io_mask_2;
	input io_mask_3;
	input io_mask_4;
	input io_mask_5;
	input io_mask_6;
	input io_mask_7;
	input io_mask_8;
	input io_mask_9;
	input io_mask_10;
	input io_mask_11;
	input io_mask_12;
	input io_mask_13;
	input io_mask_14;
	input io_mask_15;
	input io_mask_16;
	input io_mask_17;
	input io_mask_18;
	input io_mask_19;
	input io_mask_20;
	input io_mask_21;
	input io_mask_22;
	input io_mask_23;
	input io_mask_24;
	input io_mask_25;
	input io_mask_26;
	input io_mask_27;
	input io_mask_28;
	input io_mask_29;
	input io_mask_30;
	input io_mask_31;
	input io_mask_32;
	input io_mask_33;
	input io_mask_34;
	input io_mask_35;
	input io_mask_36;
	input io_mask_37;
	input io_mask_38;
	input io_mask_39;
	input io_mask_40;
	input io_mask_41;
	input io_mask_42;
	input io_mask_43;
	input io_mask_44;
	input io_mask_45;
	input io_mask_46;
	input io_mask_47;
	input io_mask_48;
	input io_mask_49;
	input io_mask_50;
	input io_mask_51;
	input io_mask_52;
	input io_mask_53;
	input io_mask_54;
	input io_mask_55;
	input io_mask_56;
	input io_mask_57;
	input io_mask_58;
	input io_mask_59;
	input io_mask_60;
	input io_mask_61;
	input io_mask_62;
	input io_mask_63;
	wire [511:0] _mem_ext_R0_data;
	always @(posedge clock)
		if (((~reset & io_wen) & io_ren) & (io_raddr == io_waddr)) begin
// synopsys translate_off
			$error("Assertion failed: undefined behavior in dual-ported SRAM\n    at SyncMem.scala:41 assert(!(io.wen && io.ren && io.raddr === io.waddr), \"undefined behavior in dual-ported SRAM\")\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	mem_512x512 mem_ext(
		.R0_addr(io_raddr),
		.R0_en(io_ren),
		.R0_clk(clock),
		.R0_data(_mem_ext_R0_data),
		.W0_addr(io_waddr),
		.W0_en(io_wen),
		.W0_clk(clock),
		.W0_data({io_wdata_15_0, io_wdata_14_0, io_wdata_13_0, io_wdata_12_0, io_wdata_11_0, io_wdata_10_0, io_wdata_9_0, io_wdata_8_0, io_wdata_7_0, io_wdata_6_0, io_wdata_5_0, io_wdata_4_0, io_wdata_3_0, io_wdata_2_0, io_wdata_1_0, io_wdata_0_0}),
		.W0_mask({io_mask_63, io_mask_62, io_mask_61, io_mask_60, io_mask_59, io_mask_58, io_mask_57, io_mask_56, io_mask_55, io_mask_54, io_mask_53, io_mask_52, io_mask_51, io_mask_50, io_mask_49, io_mask_48, io_mask_47, io_mask_46, io_mask_45, io_mask_44, io_mask_43, io_mask_42, io_mask_41, io_mask_40, io_mask_39, io_mask_38, io_mask_37, io_mask_36, io_mask_35, io_mask_34, io_mask_33, io_mask_32, io_mask_31, io_mask_30, io_mask_29, io_mask_28, io_mask_27, io_mask_26, io_mask_25, io_mask_24, io_mask_23, io_mask_22, io_mask_21, io_mask_20, io_mask_19, io_mask_18, io_mask_17, io_mask_16, io_mask_15, io_mask_14, io_mask_13, io_mask_12, io_mask_11, io_mask_10, io_mask_9, io_mask_8, io_mask_7, io_mask_6, io_mask_5, io_mask_4, io_mask_3, io_mask_2, io_mask_1, io_mask_0})
	);
	assign io_rdata_0_0 = _mem_ext_R0_data[31:0];
	assign io_rdata_1_0 = _mem_ext_R0_data[63:32];
	assign io_rdata_2_0 = _mem_ext_R0_data[95:64];
	assign io_rdata_3_0 = _mem_ext_R0_data[127:96];
	assign io_rdata_4_0 = _mem_ext_R0_data[159:128];
	assign io_rdata_5_0 = _mem_ext_R0_data[191:160];
	assign io_rdata_6_0 = _mem_ext_R0_data[223:192];
	assign io_rdata_7_0 = _mem_ext_R0_data[255:224];
	assign io_rdata_8_0 = _mem_ext_R0_data[287:256];
	assign io_rdata_9_0 = _mem_ext_R0_data[319:288];
	assign io_rdata_10_0 = _mem_ext_R0_data[351:320];
	assign io_rdata_11_0 = _mem_ext_R0_data[383:352];
	assign io_rdata_12_0 = _mem_ext_R0_data[415:384];
	assign io_rdata_13_0 = _mem_ext_R0_data[447:416];
	assign io_rdata_14_0 = _mem_ext_R0_data[479:448];
	assign io_rdata_15_0 = _mem_ext_R0_data[511:480];
endmodule
