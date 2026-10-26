module INToRecFN_i32_e8_s24 (
	io_in,
	io_out
);
	input [31:0] io_in;
	output wire [32:0] io_out;
	wire [31:0] intAsRawFloat_absIn = (io_in[31] ? 32'h00000000 - io_in : io_in);
	wire [4:0] intAsRawFloat_adjustedNormDist = (intAsRawFloat_absIn[31] ? 5'h00 : (intAsRawFloat_absIn[30] ? 5'h01 : (intAsRawFloat_absIn[29] ? 5'h02 : (intAsRawFloat_absIn[28] ? 5'h03 : (intAsRawFloat_absIn[27] ? 5'h04 : (intAsRawFloat_absIn[26] ? 5'h05 : (intAsRawFloat_absIn[25] ? 5'h06 : (intAsRawFloat_absIn[24] ? 5'h07 : (intAsRawFloat_absIn[23] ? 5'h08 : (intAsRawFloat_absIn[22] ? 5'h09 : (intAsRawFloat_absIn[21] ? 5'h0a : (intAsRawFloat_absIn[20] ? 5'h0b : (intAsRawFloat_absIn[19] ? 5'h0c : (intAsRawFloat_absIn[18] ? 5'h0d : (intAsRawFloat_absIn[17] ? 5'h0e : (intAsRawFloat_absIn[16] ? 5'h0f : (intAsRawFloat_absIn[15] ? 5'h10 : (intAsRawFloat_absIn[14] ? 5'h11 : (intAsRawFloat_absIn[13] ? 5'h12 : (intAsRawFloat_absIn[12] ? 5'h13 : (intAsRawFloat_absIn[11] ? 5'h14 : (intAsRawFloat_absIn[10] ? 5'h15 : (intAsRawFloat_absIn[9] ? 5'h16 : (intAsRawFloat_absIn[8] ? 5'h17 : (intAsRawFloat_absIn[7] ? 5'h18 : (intAsRawFloat_absIn[6] ? 5'h19 : (intAsRawFloat_absIn[5] ? 5'h1a : (intAsRawFloat_absIn[4] ? 5'h1b : (intAsRawFloat_absIn[3] ? 5'h1c : (intAsRawFloat_absIn[2] ? 5'h1d : {4'hf, ~intAsRawFloat_absIn[1]}))))))))))))))))))))))))))))));
	wire [62:0] _intAsRawFloat_sig_T = {31'h00000000, intAsRawFloat_absIn} << intAsRawFloat_adjustedNormDist;
	RoundAnyRawFNToRecFN_ie6_is32_oe8_os24 roundAnyRawFNToRecFN(
		.io_in_isZero(~_intAsRawFloat_sig_T[31]),
		.io_in_sign(io_in[31]),
		.io_in_sExp({3'h2, ~intAsRawFloat_adjustedNormDist}),
		.io_in_sig({1'h0, _intAsRawFloat_sig_T[31:0]}),
		.io_out(io_out)
	);
endmodule
