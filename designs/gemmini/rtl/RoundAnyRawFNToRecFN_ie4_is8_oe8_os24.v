module RoundAnyRawFNToRecFN_ie4_is8_oe8_os24 (
	io_in_isZero,
	io_in_sign,
	io_in_sExp,
	io_in_sig,
	io_out
);
	input io_in_isZero;
	input io_in_sign;
	input [5:0] io_in_sExp;
	input [8:0] io_in_sig;
	output wire [32:0] io_out;
	assign io_out = {io_in_sign, ({{3 {io_in_sExp[5]}}, io_in_sExp} + 9'h0f0) & ~(io_in_isZero ? 9'h1c0 : 9'h000), (io_in_isZero ? 23'h000000 : {io_in_sig[6:0], 16'h0000})};
endmodule
