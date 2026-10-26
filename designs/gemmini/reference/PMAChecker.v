module PMAChecker (
	io_paddr,
	io_resp_r,
	io_resp_w,
	io_resp_pp,
	io_resp_x
);
	input [39:0] io_paddr;
	output wire io_resp_r;
	output wire io_resp_w;
	output wire io_resp_pp;
	output wire io_resp_x;
	wire _legal_address_T_4 = io_paddr[39:32] == 8'h00;
	assign io_resp_r = _legal_address_T_4;
	assign io_resp_w = _legal_address_T_4;
	assign io_resp_pp = _legal_address_T_4;
	assign io_resp_x = _legal_address_T_4;
endmodule
