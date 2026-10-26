module RoundAnyRawFNToRecFN_ie6_is32_oe8_os24 (
	io_in_isZero,
	io_in_sign,
	io_in_sExp,
	io_in_sig,
	io_out
);
	input io_in_isZero;
	input io_in_sign;
	input [7:0] io_in_sExp;
	input [32:0] io_in_sig;
	output wire [32:0] io_out;
	wire [25:0] roundedSig = (io_in_sig[7] ? ({1'h0, io_in_sig[32:8]} + 26'h0000001) & {25'h1ffffff, ~(io_in_sig[7] & (io_in_sig[6:0] == 7'h00))} : {1'h0, io_in_sig[32:8]});
	assign io_out = {io_in_sign, (({io_in_sExp[7], io_in_sExp} + {7'h00, roundedSig[25:24]}) + 9'h0c0) & ~(io_in_isZero ? 9'h1c0 : 9'h000), (io_in_isZero ? 23'h000000 : roundedSig[22:0])};
endmodule
