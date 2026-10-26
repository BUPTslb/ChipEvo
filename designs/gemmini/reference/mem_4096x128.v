module mem_4096x128 (
	RW0_addr,
	RW0_en,
	RW0_clk,
	RW0_wmode,
	RW0_wdata,
	RW0_rdata,
	RW0_wmask
);
	input [11:0] RW0_addr;
	input RW0_en;
	input RW0_clk;
	input RW0_wmode;
	input [127:0] RW0_wdata;
	output wire [127:0] RW0_rdata;
	input [15:0] RW0_wmask;
	reg [127:0] Memory [0:4095];
	reg [11:0] _RW0_raddr_d0;
	reg _RW0_ren_d0;
	reg _RW0_rmode_d0;
	always @(posedge RW0_clk) begin
		_RW0_raddr_d0 <= RW0_addr;
		_RW0_ren_d0 <= RW0_en;
		_RW0_rmode_d0 <= RW0_wmode;
		if ((RW0_en & RW0_wmask[0]) & RW0_wmode)
			Memory[RW0_addr][32'h00000000+:8] <= RW0_wdata[7:0];
		if ((RW0_en & RW0_wmask[1]) & RW0_wmode)
			Memory[RW0_addr][32'h00000008+:8] <= RW0_wdata[15:8];
		if ((RW0_en & RW0_wmask[2]) & RW0_wmode)
			Memory[RW0_addr][32'h00000010+:8] <= RW0_wdata[23:16];
		if ((RW0_en & RW0_wmask[3]) & RW0_wmode)
			Memory[RW0_addr][32'h00000018+:8] <= RW0_wdata[31:24];
		if ((RW0_en & RW0_wmask[4]) & RW0_wmode)
			Memory[RW0_addr][32'h00000020+:8] <= RW0_wdata[39:32];
		if ((RW0_en & RW0_wmask[5]) & RW0_wmode)
			Memory[RW0_addr][32'h00000028+:8] <= RW0_wdata[47:40];
		if ((RW0_en & RW0_wmask[6]) & RW0_wmode)
			Memory[RW0_addr][32'h00000030+:8] <= RW0_wdata[55:48];
		if ((RW0_en & RW0_wmask[7]) & RW0_wmode)
			Memory[RW0_addr][32'h00000038+:8] <= RW0_wdata[63:56];
		if ((RW0_en & RW0_wmask[8]) & RW0_wmode)
			Memory[RW0_addr][32'h00000040+:8] <= RW0_wdata[71:64];
		if ((RW0_en & RW0_wmask[9]) & RW0_wmode)
			Memory[RW0_addr][32'h00000048+:8] <= RW0_wdata[79:72];
		if ((RW0_en & RW0_wmask[10]) & RW0_wmode)
			Memory[RW0_addr][32'h00000050+:8] <= RW0_wdata[87:80];
		if ((RW0_en & RW0_wmask[11]) & RW0_wmode)
			Memory[RW0_addr][32'h00000058+:8] <= RW0_wdata[95:88];
		if ((RW0_en & RW0_wmask[12]) & RW0_wmode)
			Memory[RW0_addr][32'h00000060+:8] <= RW0_wdata[103:96];
		if ((RW0_en & RW0_wmask[13]) & RW0_wmode)
			Memory[RW0_addr][32'h00000068+:8] <= RW0_wdata[111:104];
		if ((RW0_en & RW0_wmask[14]) & RW0_wmode)
			Memory[RW0_addr][32'h00000070+:8] <= RW0_wdata[119:112];
		if ((RW0_en & RW0_wmask[15]) & RW0_wmode)
			Memory[RW0_addr][32'h00000078+:8] <= RW0_wdata[127:120];
	end
	assign RW0_rdata = (_RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 128'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
