module RoundAnyRawFNToRecFN_ie8_is26_oe8_os24 (
	io_invalidExc,
	io_in_isNaN,
	io_in_isInf,
	io_in_isZero,
	io_in_sign,
	io_in_sExp,
	io_in_sig,
	io_out
);
	input io_invalidExc;
	input io_in_isNaN;
	input io_in_isInf;
	input io_in_isZero;
	input io_in_sign;
	input [9:0] io_in_sExp;
	input [26:0] io_in_sig;
	output wire [32:0] io_out;
	wire [8:0] _roundMask_T_1 = ~io_in_sExp[8:0];
	wire [64:0] _GEN = {59'h000000000000000, _roundMask_T_1[5:0]};
	wire [64:0] roundMask_shift = $signed(65'sh10000000000000000 >>> _GEN);
	wire [64:0] roundMask_shift_1 = $signed(65'sh10000000000000000 >>> _GEN);
	wire [24:0] _roundMask_T_73 = (_roundMask_T_1[8] ? (_roundMask_T_1[7] ? {~(_roundMask_T_1[6] ? 22'h000000 : ~{roundMask_shift[42], roundMask_shift[43], roundMask_shift[44], roundMask_shift[45], roundMask_shift[46], {{roundMask_shift[47:46], roundMask_shift[49]} & 3'h5, 1'h0} | ({roundMask_shift[49:48], roundMask_shift[51:50]} & 4'h5), roundMask_shift[51], roundMask_shift[52], roundMask_shift[53], roundMask_shift[54], roundMask_shift[55], roundMask_shift[56], roundMask_shift[57], roundMask_shift[58], roundMask_shift[59], roundMask_shift[60], roundMask_shift[61], roundMask_shift[62], roundMask_shift[63]}), 3'h7} : {22'h000000, (_roundMask_T_1[6] ? {roundMask_shift_1[0], roundMask_shift_1[1], roundMask_shift_1[2]} : 3'h0)}) : 25'h0000000);
	wire _GEN_0 = _roundMask_T_73[0] | io_in_sig[26];
	wire [25:0] _GEN_1 = {_roundMask_T_73[24:1], _GEN_0, 1'h1};
	wire [25:0] _roundPosBit_T = (io_in_sig[26:1] & {1'h1, ~_roundMask_T_73[24:1], ~_GEN_0}) & _GEN_1;
	wire [25:0] roundedSig = (|_roundPosBit_T ? ({1'h0, io_in_sig[26:2] | {_roundMask_T_73[24:1], _GEN_0}} + 26'h0000001) & ~(|_roundPosBit_T & ((io_in_sig[25:0] & _GEN_1) == 26'h0000000) ? {_roundMask_T_73[24:1], _GEN_0, 1'h1} : 26'h0000000) : {1'h0, io_in_sig[26:2] & {~_roundMask_T_73[24:1], ~_GEN_0}});
	wire [10:0] sRoundedExp = {io_in_sExp[9], io_in_sExp} + {9'h000, roundedSig[25:24]};
	wire common_totalUnderflow = $signed(sRoundedExp) < 11'sh06b;
	wire isNaNOut = io_invalidExc | io_in_isNaN;
	wire notNaN_isInfOut = io_in_isInf | (((~isNaNOut & ~io_in_isInf) & ~io_in_isZero) & ($signed(sRoundedExp[10:7]) > 4'sh2));
	assign io_out = {~isNaNOut & io_in_sign, (((sRoundedExp[8:0] & ~(io_in_isZero | common_totalUnderflow ? 9'h1c0 : 9'h000)) & {2'h3, ~notNaN_isInfOut, 6'h3f}) | (notNaN_isInfOut ? 9'h180 : 9'h000)) | (isNaNOut ? 9'h1c0 : 9'h000), ((isNaNOut | io_in_isZero) | common_totalUnderflow ? {isNaNOut, 22'h000000} : (io_in_sig[26] ? roundedSig[23:1] : roundedSig[22:0]))};
endmodule
