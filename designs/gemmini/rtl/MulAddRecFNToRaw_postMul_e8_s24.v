module MulAddRecFNToRaw_postMul_e8_s24 (
	io_fromPreMul_isSigNaNAny,
	io_fromPreMul_isNaNAOrB,
	io_fromPreMul_isInfA,
	io_fromPreMul_isZeroA,
	io_fromPreMul_isInfB,
	io_fromPreMul_isZeroB,
	io_fromPreMul_signProd,
	io_fromPreMul_sExpSum,
	io_fromPreMul_doSubMags,
	io_fromPreMul_highAlignedSigC,
	io_fromPreMul_bit0AlignedSigC,
	io_mulAddResult,
	io_invalidExc,
	io_rawOut_isNaN,
	io_rawOut_isInf,
	io_rawOut_isZero,
	io_rawOut_sign,
	io_rawOut_sExp,
	io_rawOut_sig
);
	input io_fromPreMul_isSigNaNAny;
	input io_fromPreMul_isNaNAOrB;
	input io_fromPreMul_isInfA;
	input io_fromPreMul_isZeroA;
	input io_fromPreMul_isInfB;
	input io_fromPreMul_isZeroB;
	input io_fromPreMul_signProd;
	input [9:0] io_fromPreMul_sExpSum;
	input io_fromPreMul_doSubMags;
	input [25:0] io_fromPreMul_highAlignedSigC;
	input io_fromPreMul_bit0AlignedSigC;
	input [48:0] io_mulAddResult;
	output wire io_invalidExc;
	output wire io_rawOut_isNaN;
	output wire io_rawOut_isInf;
	output wire io_rawOut_isZero;
	output wire io_rawOut_sign;
	output wire [9:0] io_rawOut_sExp;
	output wire [26:0] io_rawOut_sig;
	wire [2:0] _sigSum_T_3 = (io_mulAddResult[48] ? io_fromPreMul_highAlignedSigC[2:0] + 3'h1 : io_fromPreMul_highAlignedSigC[2:0]);
	wire [50:0] notCDom_absSigSum = (_sigSum_T_3[2] ? ~{_sigSum_T_3[1:0], io_mulAddResult[47:0], io_fromPreMul_bit0AlignedSigC} : {_sigSum_T_3[1:0], io_mulAddResult[47:0], io_fromPreMul_bit0AlignedSigC} + {50'h0000000000000, io_fromPreMul_doSubMags});
	wire [4:0] notCDom_normDistReduced2 = (notCDom_absSigSum[50] ? 5'h00 : (|notCDom_absSigSum[49:48] ? 5'h01 : (|notCDom_absSigSum[47:46] ? 5'h02 : (|notCDom_absSigSum[45:44] ? 5'h03 : (|notCDom_absSigSum[43:42] ? 5'h04 : (|notCDom_absSigSum[41:40] ? 5'h05 : (|notCDom_absSigSum[39:38] ? 5'h06 : (|notCDom_absSigSum[37:36] ? 5'h07 : (|notCDom_absSigSum[35:34] ? 5'h08 : (|notCDom_absSigSum[33:32] ? 5'h09 : (|notCDom_absSigSum[31:30] ? 5'h0a : (|notCDom_absSigSum[29:28] ? 5'h0b : (|notCDom_absSigSum[27:26] ? 5'h0c : (|notCDom_absSigSum[25:24] ? 5'h0d : (|notCDom_absSigSum[23:22] ? 5'h0e : (|notCDom_absSigSum[21:20] ? 5'h0f : (|notCDom_absSigSum[19:18] ? 5'h10 : (|notCDom_absSigSum[17:16] ? 5'h11 : (|notCDom_absSigSum[15:14] ? 5'h12 : (|notCDom_absSigSum[13:12] ? 5'h13 : (|notCDom_absSigSum[11:10] ? 5'h14 : (|notCDom_absSigSum[9:8] ? 5'h15 : (|notCDom_absSigSum[7:6] ? 5'h16 : (|notCDom_absSigSum[5:4] ? 5'h17 : {4'hc, ~(|notCDom_absSigSum[3:2])}))))))))))))))))))))))));
	wire [113:0] _notCDom_mainSig_T = {63'h0000000000000000, notCDom_absSigSum} << {108'h000000000000000000000000000, notCDom_normDistReduced2, 1'h0};
	wire [16:0] notCDom_reduced4SigExtra_shift = $signed(17'sh10000 >>> ~notCDom_normDistReduced2[4:1]);
	wire notCDom_completeCancellation = _notCDom_mainSig_T[51:50] == 2'h0;
	wire notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB;
	wire _notNaN_addZeros_T = io_fromPreMul_isZeroA | io_fromPreMul_isZeroB;
	assign io_invalidExc = (io_fromPreMul_isSigNaNAny | (io_fromPreMul_isInfA & io_fromPreMul_isZeroB)) | (io_fromPreMul_isZeroA & io_fromPreMul_isInfB);
	assign io_rawOut_isNaN = io_fromPreMul_isNaNAOrB;
	assign io_rawOut_isInf = notNaN_isInfProd;
	assign io_rawOut_isZero = _notNaN_addZeros_T | notCDom_completeCancellation;
	assign io_rawOut_sign = ((notNaN_isInfProd & io_fromPreMul_signProd) | ((_notNaN_addZeros_T & io_fromPreMul_signProd) & (io_fromPreMul_signProd ^ io_fromPreMul_doSubMags))) | (((~notNaN_isInfProd & ~_notNaN_addZeros_T) & ~notCDom_completeCancellation) & (io_fromPreMul_signProd ^ _sigSum_T_3[2]));
	assign io_rawOut_sExp = io_fromPreMul_sExpSum - {4'h0, notCDom_normDistReduced2, 1'h0};
	assign io_rawOut_sig = {_notCDom_mainSig_T[51:26], |_notCDom_mainSig_T[25:23] | |({|{|notCDom_absSigSum[23:22], |notCDom_absSigSum[21:20]}, |{|notCDom_absSigSum[19:18], |notCDom_absSigSum[17:16]}, |{|notCDom_absSigSum[15:14], |notCDom_absSigSum[13:12]}, |{|notCDom_absSigSum[11:10], |notCDom_absSigSum[9:8]}, |{|notCDom_absSigSum[7:6], |notCDom_absSigSum[5:4]}, |{|notCDom_absSigSum[3:2], |notCDom_absSigSum[1:0]}} & {notCDom_reduced4SigExtra_shift[1], notCDom_reduced4SigExtra_shift[2], notCDom_reduced4SigExtra_shift[3], notCDom_reduced4SigExtra_shift[4], notCDom_reduced4SigExtra_shift[5], notCDom_reduced4SigExtra_shift[6]})};
endmodule
