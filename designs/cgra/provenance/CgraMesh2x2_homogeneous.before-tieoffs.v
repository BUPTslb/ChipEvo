module Mux__e251eb6629f2a636 (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [403:0] in_;
	output reg [201:0] out;
	input wire [0:0] reset;
	input wire [0:0] sel;
	always @(*) begin : up_mux
		out = in_[(1 - sel) * 202+:202];
	end
endmodule
module BypassQueue1EntryRTL__d3296a4a8c71ad6a (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [0:0] count;
	input wire [0:0] reset;
	input wire [201:0] recv__msg;
	output reg [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [201:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	reg [201:0] entry;
	reg [0:0] full;
	wire [0:0] bypass_mux__clk;
	wire [403:0] bypass_mux__in_;
	wire [201:0] bypass_mux__out;
	wire [0:0] bypass_mux__reset;
	wire [0:0] bypass_mux__sel;
	Mux__e251eb6629f2a636 bypass_mux(
		.clk(bypass_mux__clk),
		.in_(bypass_mux__in_),
		.out(bypass_mux__out),
		.reset(bypass_mux__reset),
		.sel(bypass_mux__sel)
	);
	always @(*) begin : _lambda__s_dut_bypass_queue_q_recv_rdy
		recv__rdy = ~full;
	end
	always @(*) begin : _lambda__s_dut_bypass_queue_q_send_val
		send__val = full | recv__val;
	end
	always @(posedge clk) begin : ff_bypass1
		if (reset)
			full <= 1'd0;
		else
			full <= ~send__rdy & (full | recv__val);
		if ((~send__rdy & ~full) & recv__val)
			entry <= recv__msg;
	end
	assign bypass_mux__clk = clk;
	assign bypass_mux__reset = reset;
	assign bypass_mux__in_[202+:202] = recv__msg;
	assign bypass_mux__in_[0+:202] = entry;
	assign send__msg = bypass_mux__out;
	assign bypass_mux__sel = full;
	assign count = full;
endmodule
module BypassQueueRTL__cf12eb093b04a1b9 (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [0:0] count;
	input wire [0:0] reset;
	input wire [201:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [201:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] q__clk;
	wire [0:0] q__count;
	wire [0:0] q__reset;
	wire [201:0] q__recv__msg;
	wire [0:0] q__recv__rdy;
	wire [0:0] q__recv__val;
	wire [201:0] q__send__msg;
	wire [0:0] q__send__rdy;
	wire [0:0] q__send__val;
	BypassQueue1EntryRTL__d3296a4a8c71ad6a q(
		.clk(q__clk),
		.count(q__count),
		.reset(q__reset),
		.recv__msg(q__recv__msg),
		.recv__rdy(q__recv__rdy),
		.recv__val(q__recv__val),
		.send__msg(q__send__msg),
		.send__rdy(q__send__rdy),
		.send__val(q__send__val)
	);
	assign q__clk = clk;
	assign q__reset = reset;
	assign q__recv__msg = recv__msg;
	assign recv__rdy = q__recv__rdy;
	assign q__recv__val = recv__val;
	assign send__msg = q__send__msg;
	assign q__send__rdy = send__rdy;
	assign send__val = q__send__val;
	assign count = q__count;
endmodule
module NormalQueueCtrlRTL__num_entries_2 (
	clk,
	count,
	raddr,
	recv_rdy,
	recv_val,
	reset,
	send_rdy,
	send_val,
	waddr,
	wen
);
	input wire [0:0] clk;
	output reg [1:0] count;
	output wire [0:0] raddr;
	output reg [0:0] recv_rdy;
	input wire [0:0] recv_val;
	input wire [0:0] reset;
	input wire [0:0] send_rdy;
	output reg [0:0] send_val;
	output wire [0:0] waddr;
	output wire [0:0] wen;
	localparam [1:0] __const__num_entries_at__lambda__s_dut_controller_crossbar_input_units_0__queue_ctrl_recv_rdy = 2'd2;
	localparam [1:0] __const__num_entries_at_up_reg = 2'd2;
	reg [0:0] head;
	reg [0:0] recv_xfer;
	reg [0:0] send_xfer;
	reg [0:0] tail;
	always @(*) begin : _lambda__s_dut_controller_crossbar_input_units_0__queue_ctrl_recv_rdy
		recv_rdy = count < __const__num_entries_at__lambda__s_dut_controller_crossbar_input_units_0__queue_ctrl_recv_rdy;
	end
	always @(*) begin : _lambda__s_dut_controller_crossbar_input_units_0__queue_ctrl_recv_xfer
		recv_xfer = recv_val & recv_rdy;
	end
	always @(*) begin : _lambda__s_dut_controller_crossbar_input_units_0__queue_ctrl_send_val
		send_val = count > 2'd0;
	end
	always @(*) begin : _lambda__s_dut_controller_crossbar_input_units_0__queue_ctrl_send_xfer
		send_xfer = send_val & send_rdy;
	end
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(posedge clk) begin : up_reg
		if (reset) begin
			head <= 1'd0;
			tail <= 1'd0;
			count <= 2'd0;
		end
		else begin
			if (recv_xfer)
				tail <= (tail < (sv2v_cast_1(__const__num_entries_at_up_reg) - 1'd1) ? tail + 1'd1 : 1'd0);
			if (send_xfer)
				head <= (head < (sv2v_cast_1(__const__num_entries_at_up_reg) - 1'd1) ? head + 1'd1 : 1'd0);
			if (recv_xfer & ~send_xfer)
				count <= count + 2'd1;
			else if (~recv_xfer & send_xfer)
				count <= count - 2'd1;
		end
	end
	assign wen = recv_xfer;
	assign waddr = tail;
	assign raddr = head;
endmodule
module RegisterFile__7e065e99bcbcb3c9 (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	output reg [202:0] rdata;
	input wire [0:0] reset;
	input wire [0:0] waddr;
	input wire [202:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [202:0] regs [0:1];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 203+:203] = regs[raddr[sv2v_cast_1(i)+:1]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i)+:1]] <= wdata[sv2v_cast_1(i) * 203+:203];
		end
	end
endmodule
module NormalQueueDpathRTL__7ef8d7c4e0895436 (
	clk,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	input wire [202:0] recv_msg;
	input wire [0:0] reset;
	output wire [202:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [202:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [202:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__7e065e99bcbcb3c9 rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign send_msg = rf__rdata[0+:203];
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:203] = recv_msg;
endmodule
module NormalQueueRTL__7ef8d7c4e0895436 (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [202:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [202:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	NormalQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__raddr;
	wire [202:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [202:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	NormalQueueDpathRTL__7ef8d7c4e0895436 dpath(
		.clk(dpath__clk),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign dpath__recv_msg = recv__msg;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign send__msg = dpath__send_msg;
	assign count = ctrl__count;
endmodule
module InputUnitRTL__b13fbc4a05fc0d93 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [202:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [202:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] queue__clk;
	wire [1:0] queue__count;
	wire [0:0] queue__reset;
	wire [202:0] queue__recv__msg;
	wire [0:0] queue__recv__rdy;
	wire [0:0] queue__recv__val;
	wire [202:0] queue__send__msg;
	wire [0:0] queue__send__rdy;
	wire [0:0] queue__send__val;
	NormalQueueRTL__7ef8d7c4e0895436 queue(
		.clk(queue__clk),
		.count(queue__count),
		.reset(queue__reset),
		.recv__msg(queue__recv__msg),
		.recv__rdy(queue__recv__rdy),
		.recv__val(queue__recv__val),
		.send__msg(queue__send__msg),
		.send__rdy(queue__send__rdy),
		.send__val(queue__send__val)
	);
	assign queue__clk = clk;
	assign queue__reset = reset;
	assign queue__recv__msg = recv__msg;
	assign recv__rdy = queue__recv__rdy;
	assign queue__recv__val = recv__val;
	assign send__msg = queue__send__msg;
	assign queue__send__rdy = send__rdy;
	assign send__val = queue__send__val;
endmodule
module OutputUnitRTL__64437ef86e4e35ee (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [202:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [202:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	assign send__msg = recv__msg;
	assign recv__rdy = send__rdy;
	assign send__val = recv__val;
endmodule
module XbarRouteUnitRTL__9d3d24c0a1986ad3 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [202:0] recv__msg;
	output reg [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [202:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [0:0] __const__num_outports_at_up_ru_routing = 1'd1;
	reg [0:0] out_dir;
	wire [0:0] send_val;
	always @(*) begin : up_ru_recv_rdy
		recv__rdy = send__rdy[out_dir+:1] > 1'd0;
	end
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_ru_routing
		out_dir = recv__msg[202];
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_up_ru_routing; i = i + 1'd1)
				send__val[sv2v_cast_1(i)+:1] = 1'd0;
		end
		if (recv__val)
			send__val[out_dir+:1] = 1'd1;
	end
	assign send__msg[0+:203] = recv__msg;
	assign send_val[0:0] = send__val[0+:1];
endmodule
module RegEnRst__Type_Bits7__reset_value_1 (
	clk,
	en,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	input wire [6:0] in_;
	output reg [6:0] out;
	input wire [0:0] reset;
	localparam [0:0] __const__reset_value_at_up_regenrst = 1'd1;
	function automatic [6:0] sv2v_cast_7;
		input reg [6:0] inp;
		sv2v_cast_7 = inp;
	endfunction
	always @(posedge clk) begin : up_regenrst
		if (reset)
			out <= sv2v_cast_7(__const__reset_value_at_up_regenrst);
		else if (en)
			out <= in_;
	end
endmodule
module RoundRobinArbiterEn__nreqs_7 (
	clk,
	en,
	grants,
	reqs,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	output reg [6:0] grants;
	input wire [6:0] reqs;
	input wire [0:0] reset;
	localparam [2:0] __const__nreqs_at_comb_reqs_int = 3'd7;
	localparam [3:0] __const__nreqsX2_at_comb_reqs_int = 4'd14;
	localparam [2:0] __const__nreqs_at_comb_grants = 3'd7;
	localparam [2:0] __const__nreqs_at_comb_priority_int = 3'd7;
	localparam [3:0] __const__nreqsX2_at_comb_priority_int = 4'd14;
	localparam [3:0] __const__nreqsX2_at_comb_kills = 4'd14;
	localparam [3:0] __const__nreqsX2_at_comb_grants_int = 4'd14;
	reg [13:0] grants_int;
	reg [14:0] kills;
	reg [0:0] priority_en;
	reg [13:0] priority_int;
	reg [13:0] reqs_int;
	wire [0:0] priority_reg__clk;
	wire [0:0] priority_reg__en;
	wire [6:0] priority_reg__in_;
	wire [6:0] priority_reg__out;
	wire [0:0] priority_reg__reset;
	RegEnRst__Type_Bits7__reset_value_1 priority_reg(
		.clk(priority_reg__clk),
		.en(priority_reg__en),
		.in_(priority_reg__in_),
		.out(priority_reg__out),
		.reset(priority_reg__reset)
	);
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : comb_grants
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqs_at_comb_grants; i = i + 1'd1)
				grants[sv2v_cast_3(i)] = grants_int[sv2v_cast_4(i)] | grants_int[sv2v_cast_4(__const__nreqs_at_comb_grants) + sv2v_cast_4(i)];
		end
	end
	always @(*) begin : comb_grants_int
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_grants_int; i = i + 1'd1)
				if (priority_int[sv2v_cast_4(i)])
					grants_int[sv2v_cast_4(i)] = reqs_int[sv2v_cast_4(i)];
				else
					grants_int[sv2v_cast_4(i)] = ~kills[sv2v_cast_4(i)] & reqs_int[sv2v_cast_4(i)];
		end
	end
	always @(*) begin : comb_kills
		kills[4'd0] = 1'd1;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_kills; i = i + 1'd1)
				if (priority_int[sv2v_cast_4(i)])
					kills[sv2v_cast_4(i) + 4'd1] = reqs_int[sv2v_cast_4(i)];
				else
					kills[sv2v_cast_4(i) + 4'd1] = kills[sv2v_cast_4(i)] | (~kills[sv2v_cast_4(i)] & reqs_int[sv2v_cast_4(i)]);
		end
	end
	always @(*) begin : comb_priority_en
		priority_en = (grants != 7'd0) & en;
	end
	always @(*) begin : comb_priority_int
		priority_int[4'd6:4'd0] = priority_reg__out;
		priority_int[4'd13:sv2v_cast_4(__const__nreqs_at_comb_priority_int)] = 7'd0;
	end
	always @(*) begin : comb_reqs_int
		reqs_int[4'd6:4'd0] = reqs;
		reqs_int[4'd13:sv2v_cast_4(__const__nreqs_at_comb_reqs_int)] = reqs;
	end
	assign priority_reg__clk = clk;
	assign priority_reg__reset = reset;
	assign priority_reg__en = priority_en;
	assign priority_reg__in_[6:1] = grants[5:0];
	assign priority_reg__in_[0:0] = grants[6:6];
endmodule
module Encoder__in_nbits_7__out_nbits_3 (
	clk,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [6:0] in_;
	output reg [2:0] out;
	input wire [0:0] reset;
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : encode
		out = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < 3'd7; i = i + 1'd1)
				if (in_[sv2v_cast_3(i)])
					out = sv2v_cast_3(i);
		end
	end
endmodule
module Mux__e3fae52f387252cd (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [1420:0] in_;
	output reg [202:0] out;
	input wire [0:0] reset;
	input wire [2:0] sel;
	always @(*) begin : up_mux
		out = in_[(6 - sel) * 203+:203];
	end
endmodule
module SwitchUnitRTL__6a10258d770d7164 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [1420:0] recv__msg;
	output reg [6:0] recv__rdy;
	input wire [6:0] recv__val;
	output wire [202:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [2:0] __const__num_inports_at_up_get_en = 3'd7;
	wire [0:0] arbiter__clk;
	wire [0:0] arbiter__en;
	wire [6:0] arbiter__grants;
	wire [6:0] arbiter__reqs;
	wire [0:0] arbiter__reset;
	RoundRobinArbiterEn__nreqs_7 arbiter(
		.clk(arbiter__clk),
		.en(arbiter__en),
		.grants(arbiter__grants),
		.reqs(arbiter__reqs),
		.reset(arbiter__reset)
	);
	wire [0:0] encoder__clk;
	wire [6:0] encoder__in_;
	wire [2:0] encoder__out;
	wire [0:0] encoder__reset;
	Encoder__in_nbits_7__out_nbits_3 encoder(
		.clk(encoder__clk),
		.in_(encoder__in_),
		.out(encoder__out),
		.reset(encoder__reset)
	);
	wire [0:0] mux__clk;
	wire [1420:0] mux__in_;
	wire [202:0] mux__out;
	wire [0:0] mux__reset;
	wire [2:0] mux__sel;
	Mux__e3fae52f387252cd mux(
		.clk(mux__clk),
		.in_(mux__in_),
		.out(mux__out),
		.reset(mux__reset),
		.sel(mux__sel)
	);
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : up_get_en
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_up_get_en; i = i + 1'd1)
				recv__rdy[6 - sv2v_cast_3(i)+:1] = send__rdy & (mux__sel == sv2v_cast_3(i));
		end
	end
	always @(*) begin : up_send_val
		send__val = arbiter__grants > 7'd0;
	end
	assign arbiter__clk = clk;
	assign arbiter__reset = reset;
	assign arbiter__en = 1'd1;
	assign mux__clk = clk;
	assign mux__reset = reset;
	assign send__msg = mux__out;
	assign encoder__clk = clk;
	assign encoder__reset = reset;
	assign encoder__in_ = arbiter__grants;
	assign mux__sel = encoder__out;
	assign arbiter__reqs[0:0] = recv__val[6+:1];
	assign mux__in_[1218+:203] = recv__msg[1218+:203];
	assign arbiter__reqs[1:1] = recv__val[5+:1];
	assign mux__in_[1015+:203] = recv__msg[1015+:203];
	assign arbiter__reqs[2:2] = recv__val[4+:1];
	assign mux__in_[812+:203] = recv__msg[812+:203];
	assign arbiter__reqs[3:3] = recv__val[3+:1];
	assign mux__in_[609+:203] = recv__msg[609+:203];
	assign arbiter__reqs[4:4] = recv__val[2+:1];
	assign mux__in_[406+:203] = recv__msg[406+:203];
	assign arbiter__reqs[5:5] = recv__val[1+:1];
	assign mux__in_[203+:203] = recv__msg[203+:203];
	assign arbiter__reqs[6:6] = recv__val[0+:1];
	assign mux__in_[0+:203] = recv__msg[0+:203];
endmodule
module XbarRTL__6c7ab8185a86fe91 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [1420:0] recv__msg;
	output wire [6:0] recv__rdy;
	input wire [6:0] recv__val;
	output wire [202:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] input_units__clk [0:6];
	wire [0:0] input_units__reset [0:6];
	wire [202:0] input_units__recv__msg [0:6];
	wire [0:0] input_units__recv__rdy [0:6];
	wire [0:0] input_units__recv__val [0:6];
	wire [202:0] input_units__send__msg [0:6];
	wire [0:0] input_units__send__rdy [0:6];
	wire [0:0] input_units__send__val [0:6];
	InputUnitRTL__b13fbc4a05fc0d93 input_units__0(
		.clk(input_units__clk[0]),
		.reset(input_units__reset[0]),
		.recv__msg(input_units__recv__msg[0]),
		.recv__rdy(input_units__recv__rdy[0]),
		.recv__val(input_units__recv__val[0]),
		.send__msg(input_units__send__msg[0]),
		.send__rdy(input_units__send__rdy[0]),
		.send__val(input_units__send__val[0])
	);
	InputUnitRTL__b13fbc4a05fc0d93 input_units__1(
		.clk(input_units__clk[1]),
		.reset(input_units__reset[1]),
		.recv__msg(input_units__recv__msg[1]),
		.recv__rdy(input_units__recv__rdy[1]),
		.recv__val(input_units__recv__val[1]),
		.send__msg(input_units__send__msg[1]),
		.send__rdy(input_units__send__rdy[1]),
		.send__val(input_units__send__val[1])
	);
	InputUnitRTL__b13fbc4a05fc0d93 input_units__2(
		.clk(input_units__clk[2]),
		.reset(input_units__reset[2]),
		.recv__msg(input_units__recv__msg[2]),
		.recv__rdy(input_units__recv__rdy[2]),
		.recv__val(input_units__recv__val[2]),
		.send__msg(input_units__send__msg[2]),
		.send__rdy(input_units__send__rdy[2]),
		.send__val(input_units__send__val[2])
	);
	InputUnitRTL__b13fbc4a05fc0d93 input_units__3(
		.clk(input_units__clk[3]),
		.reset(input_units__reset[3]),
		.recv__msg(input_units__recv__msg[3]),
		.recv__rdy(input_units__recv__rdy[3]),
		.recv__val(input_units__recv__val[3]),
		.send__msg(input_units__send__msg[3]),
		.send__rdy(input_units__send__rdy[3]),
		.send__val(input_units__send__val[3])
	);
	InputUnitRTL__b13fbc4a05fc0d93 input_units__4(
		.clk(input_units__clk[4]),
		.reset(input_units__reset[4]),
		.recv__msg(input_units__recv__msg[4]),
		.recv__rdy(input_units__recv__rdy[4]),
		.recv__val(input_units__recv__val[4]),
		.send__msg(input_units__send__msg[4]),
		.send__rdy(input_units__send__rdy[4]),
		.send__val(input_units__send__val[4])
	);
	InputUnitRTL__b13fbc4a05fc0d93 input_units__5(
		.clk(input_units__clk[5]),
		.reset(input_units__reset[5]),
		.recv__msg(input_units__recv__msg[5]),
		.recv__rdy(input_units__recv__rdy[5]),
		.recv__val(input_units__recv__val[5]),
		.send__msg(input_units__send__msg[5]),
		.send__rdy(input_units__send__rdy[5]),
		.send__val(input_units__send__val[5])
	);
	InputUnitRTL__b13fbc4a05fc0d93 input_units__6(
		.clk(input_units__clk[6]),
		.reset(input_units__reset[6]),
		.recv__msg(input_units__recv__msg[6]),
		.recv__rdy(input_units__recv__rdy[6]),
		.recv__val(input_units__recv__val[6]),
		.send__msg(input_units__send__msg[6]),
		.send__rdy(input_units__send__rdy[6]),
		.send__val(input_units__send__val[6])
	);
	wire [0:0] output_units__clk [0:0];
	wire [0:0] output_units__reset [0:0];
	wire [202:0] output_units__recv__msg [0:0];
	wire [0:0] output_units__recv__rdy [0:0];
	wire [0:0] output_units__recv__val [0:0];
	wire [202:0] output_units__send__msg [0:0];
	wire [0:0] output_units__send__rdy [0:0];
	wire [0:0] output_units__send__val [0:0];
	OutputUnitRTL__64437ef86e4e35ee output_units__0(
		.clk(output_units__clk[0]),
		.reset(output_units__reset[0]),
		.recv__msg(output_units__recv__msg[0]),
		.recv__rdy(output_units__recv__rdy[0]),
		.recv__val(output_units__recv__val[0]),
		.send__msg(output_units__send__msg[0]),
		.send__rdy(output_units__send__rdy[0]),
		.send__val(output_units__send__val[0])
	);
	wire [0:0] route_units__clk [0:6];
	wire [0:0] route_units__reset [0:6];
	wire [202:0] route_units__recv__msg [0:6];
	wire [0:0] route_units__recv__rdy [0:6];
	wire [0:0] route_units__recv__val [0:6];
	wire [202:0] route_units__send__msg [0:6];
	wire [0:0] route_units__send__rdy [0:6];
	wire [0:0] route_units__send__val [0:6];
	XbarRouteUnitRTL__9d3d24c0a1986ad3 route_units__0(
		.clk(route_units__clk[0]),
		.reset(route_units__reset[0]),
		.recv__msg(route_units__recv__msg[0]),
		.recv__rdy(route_units__recv__rdy[0]),
		.recv__val(route_units__recv__val[0]),
		.send__msg(route_units__send__msg[0]),
		.send__rdy(route_units__send__rdy[0]),
		.send__val(route_units__send__val[0])
	);
	XbarRouteUnitRTL__9d3d24c0a1986ad3 route_units__1(
		.clk(route_units__clk[1]),
		.reset(route_units__reset[1]),
		.recv__msg(route_units__recv__msg[1]),
		.recv__rdy(route_units__recv__rdy[1]),
		.recv__val(route_units__recv__val[1]),
		.send__msg(route_units__send__msg[1]),
		.send__rdy(route_units__send__rdy[1]),
		.send__val(route_units__send__val[1])
	);
	XbarRouteUnitRTL__9d3d24c0a1986ad3 route_units__2(
		.clk(route_units__clk[2]),
		.reset(route_units__reset[2]),
		.recv__msg(route_units__recv__msg[2]),
		.recv__rdy(route_units__recv__rdy[2]),
		.recv__val(route_units__recv__val[2]),
		.send__msg(route_units__send__msg[2]),
		.send__rdy(route_units__send__rdy[2]),
		.send__val(route_units__send__val[2])
	);
	XbarRouteUnitRTL__9d3d24c0a1986ad3 route_units__3(
		.clk(route_units__clk[3]),
		.reset(route_units__reset[3]),
		.recv__msg(route_units__recv__msg[3]),
		.recv__rdy(route_units__recv__rdy[3]),
		.recv__val(route_units__recv__val[3]),
		.send__msg(route_units__send__msg[3]),
		.send__rdy(route_units__send__rdy[3]),
		.send__val(route_units__send__val[3])
	);
	XbarRouteUnitRTL__9d3d24c0a1986ad3 route_units__4(
		.clk(route_units__clk[4]),
		.reset(route_units__reset[4]),
		.recv__msg(route_units__recv__msg[4]),
		.recv__rdy(route_units__recv__rdy[4]),
		.recv__val(route_units__recv__val[4]),
		.send__msg(route_units__send__msg[4]),
		.send__rdy(route_units__send__rdy[4]),
		.send__val(route_units__send__val[4])
	);
	XbarRouteUnitRTL__9d3d24c0a1986ad3 route_units__5(
		.clk(route_units__clk[5]),
		.reset(route_units__reset[5]),
		.recv__msg(route_units__recv__msg[5]),
		.recv__rdy(route_units__recv__rdy[5]),
		.recv__val(route_units__recv__val[5]),
		.send__msg(route_units__send__msg[5]),
		.send__rdy(route_units__send__rdy[5]),
		.send__val(route_units__send__val[5])
	);
	XbarRouteUnitRTL__9d3d24c0a1986ad3 route_units__6(
		.clk(route_units__clk[6]),
		.reset(route_units__reset[6]),
		.recv__msg(route_units__recv__msg[6]),
		.recv__rdy(route_units__recv__rdy[6]),
		.recv__val(route_units__recv__val[6]),
		.send__msg(route_units__send__msg[6]),
		.send__rdy(route_units__send__rdy[6]),
		.send__val(route_units__send__val[6])
	);
	wire [0:0] switch_units__clk [0:0];
	wire [0:0] switch_units__reset [0:0];
	wire [1420:0] switch_units__recv__msg [0:0];
	wire [6:0] switch_units__recv__rdy [0:0];
	wire [6:0] switch_units__recv__val [0:0];
	wire [202:0] switch_units__send__msg [0:0];
	wire [0:0] switch_units__send__rdy [0:0];
	wire [0:0] switch_units__send__val [0:0];
	SwitchUnitRTL__6a10258d770d7164 switch_units__0(
		.clk(switch_units__clk[0]),
		.reset(switch_units__reset[0]),
		.recv__msg(switch_units__recv__msg[0]),
		.recv__rdy(switch_units__recv__rdy[0]),
		.recv__val(switch_units__recv__val[0]),
		.send__msg(switch_units__send__msg[0]),
		.send__rdy(switch_units__send__rdy[0]),
		.send__val(switch_units__send__val[0])
	);
	assign input_units__clk[0] = clk;
	assign input_units__reset[0] = reset;
	assign input_units__clk[1] = clk;
	assign input_units__reset[1] = reset;
	assign input_units__clk[2] = clk;
	assign input_units__reset[2] = reset;
	assign input_units__clk[3] = clk;
	assign input_units__reset[3] = reset;
	assign input_units__clk[4] = clk;
	assign input_units__reset[4] = reset;
	assign input_units__clk[5] = clk;
	assign input_units__reset[5] = reset;
	assign input_units__clk[6] = clk;
	assign input_units__reset[6] = reset;
	assign route_units__clk[0] = clk;
	assign route_units__reset[0] = reset;
	assign route_units__clk[1] = clk;
	assign route_units__reset[1] = reset;
	assign route_units__clk[2] = clk;
	assign route_units__reset[2] = reset;
	assign route_units__clk[3] = clk;
	assign route_units__reset[3] = reset;
	assign route_units__clk[4] = clk;
	assign route_units__reset[4] = reset;
	assign route_units__clk[5] = clk;
	assign route_units__reset[5] = reset;
	assign route_units__clk[6] = clk;
	assign route_units__reset[6] = reset;
	assign switch_units__clk[0] = clk;
	assign switch_units__reset[0] = reset;
	assign output_units__clk[0] = clk;
	assign output_units__reset[0] = reset;
	assign input_units__recv__msg[0] = recv__msg[1218+:203];
	assign recv__rdy[6+:1] = input_units__recv__rdy[0];
	assign input_units__recv__val[0] = recv__val[6+:1];
	assign route_units__recv__msg[0] = input_units__send__msg[0];
	assign input_units__send__rdy[0] = route_units__recv__rdy[0];
	assign route_units__recv__val[0] = input_units__send__val[0];
	assign input_units__recv__msg[1] = recv__msg[1015+:203];
	assign recv__rdy[5+:1] = input_units__recv__rdy[1];
	assign input_units__recv__val[1] = recv__val[5+:1];
	assign route_units__recv__msg[1] = input_units__send__msg[1];
	assign input_units__send__rdy[1] = route_units__recv__rdy[1];
	assign route_units__recv__val[1] = input_units__send__val[1];
	assign input_units__recv__msg[2] = recv__msg[812+:203];
	assign recv__rdy[4+:1] = input_units__recv__rdy[2];
	assign input_units__recv__val[2] = recv__val[4+:1];
	assign route_units__recv__msg[2] = input_units__send__msg[2];
	assign input_units__send__rdy[2] = route_units__recv__rdy[2];
	assign route_units__recv__val[2] = input_units__send__val[2];
	assign input_units__recv__msg[3] = recv__msg[609+:203];
	assign recv__rdy[3+:1] = input_units__recv__rdy[3];
	assign input_units__recv__val[3] = recv__val[3+:1];
	assign route_units__recv__msg[3] = input_units__send__msg[3];
	assign input_units__send__rdy[3] = route_units__recv__rdy[3];
	assign route_units__recv__val[3] = input_units__send__val[3];
	assign input_units__recv__msg[4] = recv__msg[406+:203];
	assign recv__rdy[2+:1] = input_units__recv__rdy[4];
	assign input_units__recv__val[4] = recv__val[2+:1];
	assign route_units__recv__msg[4] = input_units__send__msg[4];
	assign input_units__send__rdy[4] = route_units__recv__rdy[4];
	assign route_units__recv__val[4] = input_units__send__val[4];
	assign input_units__recv__msg[5] = recv__msg[203+:203];
	assign recv__rdy[1+:1] = input_units__recv__rdy[5];
	assign input_units__recv__val[5] = recv__val[1+:1];
	assign route_units__recv__msg[5] = input_units__send__msg[5];
	assign input_units__send__rdy[5] = route_units__recv__rdy[5];
	assign route_units__recv__val[5] = input_units__send__val[5];
	assign input_units__recv__msg[6] = recv__msg[0+:203];
	assign recv__rdy[0+:1] = input_units__recv__rdy[6];
	assign input_units__recv__val[6] = recv__val[0+:1];
	assign route_units__recv__msg[6] = input_units__send__msg[6];
	assign input_units__send__rdy[6] = route_units__recv__rdy[6];
	assign route_units__recv__val[6] = input_units__send__val[6];
	assign switch_units__recv__msg[0][1218+:203] = route_units__send__msg[0][0+:203];
	assign route_units__send__rdy[0][0+:1] = switch_units__recv__rdy[0][6+:1];
	assign switch_units__recv__val[0][6+:1] = route_units__send__val[0][0+:1];
	assign switch_units__recv__msg[0][1015+:203] = route_units__send__msg[1][0+:203];
	assign route_units__send__rdy[1][0+:1] = switch_units__recv__rdy[0][5+:1];
	assign switch_units__recv__val[0][5+:1] = route_units__send__val[1][0+:1];
	assign switch_units__recv__msg[0][812+:203] = route_units__send__msg[2][0+:203];
	assign route_units__send__rdy[2][0+:1] = switch_units__recv__rdy[0][4+:1];
	assign switch_units__recv__val[0][4+:1] = route_units__send__val[2][0+:1];
	assign switch_units__recv__msg[0][609+:203] = route_units__send__msg[3][0+:203];
	assign route_units__send__rdy[3][0+:1] = switch_units__recv__rdy[0][3+:1];
	assign switch_units__recv__val[0][3+:1] = route_units__send__val[3][0+:1];
	assign switch_units__recv__msg[0][406+:203] = route_units__send__msg[4][0+:203];
	assign route_units__send__rdy[4][0+:1] = switch_units__recv__rdy[0][2+:1];
	assign switch_units__recv__val[0][2+:1] = route_units__send__val[4][0+:1];
	assign switch_units__recv__msg[0][203+:203] = route_units__send__msg[5][0+:203];
	assign route_units__send__rdy[5][0+:1] = switch_units__recv__rdy[0][1+:1];
	assign switch_units__recv__val[0][1+:1] = route_units__send__val[5][0+:1];
	assign switch_units__recv__msg[0][0+:203] = route_units__send__msg[6][0+:203];
	assign route_units__send__rdy[6][0+:1] = switch_units__recv__rdy[0][0+:1];
	assign switch_units__recv__val[0][0+:1] = route_units__send__val[6][0+:1];
	assign output_units__recv__msg[0] = switch_units__send__msg[0];
	assign switch_units__send__rdy[0] = output_units__recv__rdy[0];
	assign output_units__recv__val[0] = switch_units__send__val[0];
	assign send__msg[0+:203] = output_units__send__msg[0];
	assign output_units__send__rdy[0] = send__rdy[0+:1];
	assign send__val[0+:1] = output_units__send__val[0];
endmodule
module NormalQueueCtrlRTL__num_entries_16 (
	clk,
	count,
	raddr,
	recv_rdy,
	recv_val,
	reset,
	send_rdy,
	send_val,
	waddr,
	wen
);
	input wire [0:0] clk;
	output reg [4:0] count;
	output wire [3:0] raddr;
	output reg [0:0] recv_rdy;
	input wire [0:0] recv_val;
	input wire [0:0] reset;
	input wire [0:0] send_rdy;
	output reg [0:0] send_val;
	output wire [3:0] waddr;
	output wire [0:0] wen;
	localparam [4:0] __const__num_entries_at__lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_rdy = 5'd16;
	localparam [4:0] __const__num_entries_at_up_reg = 5'd16;
	reg [3:0] head;
	reg [0:0] recv_xfer;
	reg [0:0] send_xfer;
	reg [3:0] tail;
	always @(*) begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_rdy
		recv_rdy = count < __const__num_entries_at__lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_rdy;
	end
	always @(*) begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_recv_xfer
		recv_xfer = recv_val & recv_rdy;
	end
	always @(*) begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_send_val
		send_val = count > 5'd0;
	end
	always @(*) begin : _lambda__s_dut_controller_global_reduce_unit_queue_ctrl_send_xfer
		send_xfer = send_val & send_rdy;
	end
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(posedge clk) begin : up_reg
		if (reset) begin
			head <= 4'd0;
			tail <= 4'd0;
			count <= 5'd0;
		end
		else begin
			if (recv_xfer)
				tail <= (tail < (sv2v_cast_4(__const__num_entries_at_up_reg) - 4'd1) ? tail + 4'd1 : 4'd0);
			if (send_xfer)
				head <= (head < (sv2v_cast_4(__const__num_entries_at_up_reg) - 4'd1) ? head + 4'd1 : 4'd0);
			if (recv_xfer & ~send_xfer)
				count <= count + 5'd1;
			else if (~recv_xfer & send_xfer)
				count <= count - 5'd1;
		end
	end
	assign wen = recv_xfer;
	assign waddr = tail;
	assign raddr = head;
endmodule
module RegisterFile__97521c3e6de8d08e (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [3:0] raddr;
	output reg [201:0] rdata;
	input wire [0:0] reset;
	input wire [3:0] waddr;
	input wire [201:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [201:0] regs [0:15];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 202+:202] = regs[raddr[sv2v_cast_1(i) * 4+:4]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i) * 4+:4]] <= wdata[sv2v_cast_1(i) * 202+:202];
		end
	end
endmodule
module NormalQueueDpathRTL__3237358e22368b3c (
	clk,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [3:0] raddr;
	input wire [201:0] recv_msg;
	input wire [0:0] reset;
	output wire [201:0] send_msg;
	input wire [3:0] waddr;
	input wire [0:0] wen;
	wire [0:0] rf__clk;
	wire [3:0] rf__raddr;
	wire [201:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [3:0] rf__waddr;
	wire [201:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__97521c3e6de8d08e rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:4] = raddr;
	assign send_msg = rf__rdata[0+:202];
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:4] = waddr;
	assign rf__wdata[0+:202] = recv_msg;
endmodule
module NormalQueueRTL__3237358e22368b3c (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [4:0] count;
	input wire [0:0] reset;
	input wire [201:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [201:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [4:0] ctrl__count;
	wire [3:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [3:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	NormalQueueCtrlRTL__num_entries_16 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [3:0] dpath__raddr;
	wire [201:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [201:0] dpath__send_msg;
	wire [3:0] dpath__waddr;
	wire [0:0] dpath__wen;
	NormalQueueDpathRTL__3237358e22368b3c dpath(
		.clk(dpath__clk),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign dpath__recv_msg = recv__msg;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign send__msg = dpath__send_msg;
	assign count = ctrl__count;
endmodule
module GlobalReduceUnitRTL__f4c437a52d97698d (
	clk,
	reset,
	recv_count__msg,
	recv_count__rdy,
	recv_count__val,
	recv_data__msg,
	recv_data__rdy,
	recv_data__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [201:0] recv_count__msg;
	output wire [0:0] recv_count__rdy;
	input wire [0:0] recv_count__val;
	input wire [201:0] recv_data__msg;
	output reg [0:0] recv_data__rdy;
	input wire [0:0] recv_data__val;
	output reg [202:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_ADD = 5'd18;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE = 5'd20;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_MUL = 5'd19;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE = 5'd21;
	reg [34:0] receiving_count;
	reg [34:0] reduce_add_value;
	reg [34:0] reduce_mul_value;
	reg [34:0] sending_count;
	reg [34:0] target_count;
	wire [0:0] queue__clk;
	wire [4:0] queue__count;
	wire [0:0] queue__reset;
	reg [201:0] queue__recv__msg;
	wire [0:0] queue__recv__rdy;
	reg [0:0] queue__recv__val;
	wire [201:0] queue__send__msg;
	reg [0:0] queue__send__rdy;
	wire [0:0] queue__send__val;
	NormalQueueRTL__3237358e22368b3c queue(
		.clk(queue__clk),
		.count(queue__count),
		.reset(queue__reset),
		.recv__msg(queue__recv__msg),
		.recv__rdy(queue__recv__rdy),
		.recv__val(queue__recv__val),
		.send__msg(queue__send__msg),
		.send__rdy(queue__send__rdy),
		.send__val(queue__send__val)
	);
	always @(*) begin : set_recv_rdy
		recv_data__rdy = 1'd0;
		queue__recv__val = 1'd0;
		queue__recv__msg = 202'h000000000000000000000000000000000000000000000000000;
		if (target_count[34-:32] > receiving_count[34-:32]) begin
			recv_data__rdy = queue__recv__rdy;
			queue__recv__msg = recv_data__msg;
			queue__recv__val = recv_data__val;
		end
	end
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin : update_send
		send__msg = 203'h000000000000000000000000000000000000000000000000000;
		send__val = 1'd0;
		queue__send__rdy = 1'd0;
		if ((target_count[34-:32] > 32'd0) & (receiving_count[34-:32] == target_count[34-:32])) begin
			if (queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD)) begin
				send__msg[173-:6] = sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD_RESPONSE);
				send__msg[167-:35] = reduce_add_value;
			end
			else if (queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_MUL)) begin
				send__msg[173-:6] = sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_MUL_RESPONSE);
				send__msg[167-:35] = reduce_mul_value;
			end
			send__msg[201-:2] = queue__send__msg[199-:2];
			send__msg[199-:2] = queue__send__msg[201-:2];
			send__msg[197-:2] = queue__send__msg[194-:2];
			send__msg[195] = queue__send__msg[192];
			send__msg[194-:2] = queue__send__msg[197-:2];
			send__msg[192] = queue__send__msg[195];
			send__msg[191-:3] = queue__send__msg[188-:3];
			send__msg[188-:3] = queue__send__msg[191-:3];
			queue__send__rdy = send__rdy;
			send__val = queue__send__val;
		end
	end
	always @(posedge clk) begin : accumulate_value
		if (reset | (sending_count == target_count)) begin
			reduce_add_value <= 35'h000000000;
			reduce_mul_value <= 35'h000000008;
		end
		else if (recv_data__val & recv_data__rdy)
			if (recv_data__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD))
				reduce_add_value <= {reduce_add_value[34-:32] + recv_data__msg[167-:32], recv_data__msg[135], 1'd0, 1'd0};
			else if (recv_data__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_MUL))
				reduce_mul_value <= {reduce_mul_value[34-:32] * recv_data__msg[167-:32], recv_data__msg[135], 1'd0, 1'd0};
	end
	always @(posedge clk) begin : update_count
		if (reset) begin
			target_count <= 35'h000000000;
			receiving_count <= 35'h000000000;
			sending_count <= 35'h000000000;
		end
		else begin
			if (recv_count__val & recv_count__rdy)
				target_count <= {recv_count__msg[167-:32], 1'd0, 1'd0, 1'd0};
			if (recv_data__val & recv_data__rdy)
				receiving_count <= {receiving_count[34-:32] + 32'd1, 1'd0, 1'd0, 1'd0};
			if (send__rdy & send__val)
				sending_count <= {sending_count[34-:32] + 32'd1, 1'd0, 1'd0, 1'd0};
			else if (((sending_count == receiving_count) & (sending_count == target_count)) & (target_count[34-:32] > 32'd0)) begin
				sending_count <= 35'h000000000;
				receiving_count <= 35'h000000000;
			end
		end
	end
	assign queue__clk = clk;
	assign queue__reset = reset;
	assign recv_count__rdy = 1'd1;
endmodule
module RegisterFile__3b3c54e4f90e121d (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	output reg [198:0] rdata;
	input wire [0:0] reset;
	input wire [0:0] waddr;
	input wire [198:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [198:0] regs [0:1];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 199+:199] = regs[raddr[sv2v_cast_1(i)+:1]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i)+:1]] <= wdata[sv2v_cast_1(i) * 199+:199];
		end
	end
endmodule
module NormalQueueDpathRTL__81615e1e2a6a0781 (
	clk,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	input wire [198:0] recv_msg;
	input wire [0:0] reset;
	output wire [198:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [198:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [198:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__3b3c54e4f90e121d rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign send_msg = rf__rdata[0+:199];
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:199] = recv_msg;
endmodule
module NormalQueueRTL__81615e1e2a6a0781 (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [198:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [198:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	NormalQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__raddr;
	wire [198:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [198:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	NormalQueueDpathRTL__81615e1e2a6a0781 dpath(
		.clk(dpath__clk),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign dpath__recv_msg = recv__msg;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign send__msg = dpath__send_msg;
	assign count = ctrl__count;
endmodule
module ChannelRTL__673a1c2e63951e3b (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [198:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [198:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] queues__clk [0:0];
	wire [1:0] queues__count [0:0];
	wire [0:0] queues__reset [0:0];
	wire [198:0] queues__recv__msg [0:0];
	wire [0:0] queues__recv__rdy [0:0];
	wire [0:0] queues__recv__val [0:0];
	wire [198:0] queues__send__msg [0:0];
	wire [0:0] queues__send__rdy [0:0];
	wire [0:0] queues__send__val [0:0];
	NormalQueueRTL__81615e1e2a6a0781 queues__0(
		.clk(queues__clk[0]),
		.count(queues__count[0]),
		.reset(queues__reset[0]),
		.recv__msg(queues__recv__msg[0]),
		.recv__rdy(queues__recv__rdy[0]),
		.recv__val(queues__recv__val[0]),
		.send__msg(queues__send__msg[0]),
		.send__rdy(queues__send__rdy[0]),
		.send__val(queues__send__val[0])
	);
	assign queues__clk[0] = clk;
	assign queues__reset[0] = reset;
	assign queues__recv__msg[0] = recv__msg;
	assign recv__rdy = queues__recv__rdy[0];
	assign queues__recv__val[0] = recv__val;
	assign send__msg = queues__send__msg[0];
	assign queues__send__rdy[0] = send__rdy;
	assign send__val = queues__send__val[0];
endmodule
module RegisterFile__be5b75af204f20bd (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	output reg [201:0] rdata;
	input wire [0:0] reset;
	input wire [0:0] waddr;
	input wire [201:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [201:0] regs [0:1];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 202+:202] = regs[raddr[sv2v_cast_1(i)+:1]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i)+:1]] <= wdata[sv2v_cast_1(i) * 202+:202];
		end
	end
endmodule
module NormalQueueDpathRTL__e47313c50ea3896f (
	clk,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	input wire [201:0] recv_msg;
	input wire [0:0] reset;
	output wire [201:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [201:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [201:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__be5b75af204f20bd rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign send_msg = rf__rdata[0+:202];
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:202] = recv_msg;
endmodule
module NormalQueueRTL__e47313c50ea3896f (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [201:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [201:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	NormalQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__raddr;
	wire [201:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [201:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	NormalQueueDpathRTL__e47313c50ea3896f dpath(
		.clk(dpath__clk),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign dpath__recv_msg = recv__msg;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign send__msg = dpath__send_msg;
	assign count = ctrl__count;
endmodule
module ChannelRTL__380c4a6127312dbb (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [201:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [201:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] queues__clk [0:0];
	wire [1:0] queues__count [0:0];
	wire [0:0] queues__reset [0:0];
	wire [201:0] queues__recv__msg [0:0];
	wire [0:0] queues__recv__rdy [0:0];
	wire [0:0] queues__recv__val [0:0];
	wire [201:0] queues__send__msg [0:0];
	wire [0:0] queues__send__rdy [0:0];
	wire [0:0] queues__send__val [0:0];
	NormalQueueRTL__e47313c50ea3896f queues__0(
		.clk(queues__clk[0]),
		.count(queues__count[0]),
		.reset(queues__reset[0]),
		.recv__msg(queues__recv__msg[0]),
		.recv__rdy(queues__recv__rdy[0]),
		.recv__val(queues__recv__val[0]),
		.send__msg(queues__send__msg[0]),
		.send__rdy(queues__send__rdy[0]),
		.send__val(queues__send__val[0])
	);
	assign queues__clk[0] = clk;
	assign queues__reset[0] = reset;
	assign queues__recv__msg[0] = recv__msg;
	assign recv__rdy = queues__recv__rdy[0];
	assign queues__recv__val[0] = recv__val;
	assign send__msg = queues__send__msg[0];
	assign queues__send__rdy[0] = send__rdy;
	assign send__val = queues__send__val[0];
endmodule
module ControllerRTL__ddd56b6da3a23069 (
	cgra_id,
	clk,
	reset,
	dma_cmd__msg,
	dma_cmd__rdy,
	dma_cmd__val,
	dma_done__msg,
	dma_done__rdy,
	dma_done__val,
	recv_from_cpu_pkt__msg,
	recv_from_cpu_pkt__rdy,
	recv_from_cpu_pkt__val,
	recv_from_ctrl_ring_pkt__msg,
	recv_from_ctrl_ring_pkt__rdy,
	recv_from_ctrl_ring_pkt__val,
	recv_from_dma_spm_rd_req__msg,
	recv_from_dma_spm_rd_req__rdy,
	recv_from_dma_spm_rd_req__val,
	recv_from_dma_spm_wr_req__msg,
	recv_from_dma_spm_wr_req__rdy,
	recv_from_dma_spm_wr_req__val,
	recv_from_im2col_pkt__msg,
	recv_from_im2col_pkt__rdy,
	recv_from_im2col_pkt__val,
	recv_from_inter_cgra_noc__msg,
	recv_from_inter_cgra_noc__rdy,
	recv_from_inter_cgra_noc__val,
	recv_from_sram_load_response__msg,
	recv_from_sram_load_response__rdy,
	recv_from_sram_load_response__val,
	recv_from_tile_load_request_pkt__msg,
	recv_from_tile_load_request_pkt__rdy,
	recv_from_tile_load_request_pkt__val,
	recv_from_tile_load_response_pkt__msg,
	recv_from_tile_load_response_pkt__rdy,
	recv_from_tile_load_response_pkt__val,
	recv_from_tile_store_request_pkt__msg,
	recv_from_tile_store_request_pkt__rdy,
	recv_from_tile_store_request_pkt__val,
	send_to_cpu_pkt__msg,
	send_to_cpu_pkt__rdy,
	send_to_cpu_pkt__val,
	send_to_ctrl_ring_pkt__msg,
	send_to_ctrl_ring_pkt__rdy,
	send_to_ctrl_ring_pkt__val,
	send_to_dma_spm_rd_resp__msg,
	send_to_dma_spm_rd_resp__rdy,
	send_to_dma_spm_rd_resp__val,
	send_to_im2col_engine_pkt__msg,
	send_to_im2col_engine_pkt__rdy,
	send_to_im2col_engine_pkt__val,
	send_to_inter_cgra_noc__msg,
	send_to_inter_cgra_noc__rdy,
	send_to_inter_cgra_noc__val,
	send_to_sram_load_request_from_dma__msg,
	send_to_sram_load_request_from_dma__rdy,
	send_to_sram_load_request_from_dma__val,
	send_to_sram_load_request_from_noc__msg,
	send_to_sram_load_request_from_noc__rdy,
	send_to_sram_load_request_from_noc__val,
	send_to_sram_store_request_from_dma__msg,
	send_to_sram_store_request_from_dma__rdy,
	send_to_sram_store_request_from_dma__val,
	send_to_sram_store_request_from_noc__msg,
	send_to_sram_store_request_from_noc__rdy,
	send_to_sram_store_request_from_noc__val,
	send_to_tile_load_response__msg,
	send_to_tile_load_response__rdy,
	send_to_tile_load_response__val
);
	input wire [1:0] cgra_id;
	input wire [0:0] clk;
	input wire [0:0] reset;
	output reg [138:0] dma_cmd__msg;
	input wire [0:0] dma_cmd__rdy;
	output reg [0:0] dma_cmd__val;
	input wire [7:0] dma_done__msg;
	output reg [0:0] dma_done__rdy;
	input wire [0:0] dma_done__val;
	input wire [198:0] recv_from_cpu_pkt__msg;
	output wire [0:0] recv_from_cpu_pkt__rdy;
	input wire [0:0] recv_from_cpu_pkt__val;
	input wire [198:0] recv_from_ctrl_ring_pkt__msg;
	output reg [0:0] recv_from_ctrl_ring_pkt__rdy;
	input wire [0:0] recv_from_ctrl_ring_pkt__val;
	input wire [31:0] recv_from_dma_spm_rd_req__msg;
	output reg [0:0] recv_from_dma_spm_rd_req__rdy;
	input wire [0:0] recv_from_dma_spm_rd_req__val;
	input wire [67:0] recv_from_dma_spm_wr_req__msg;
	output reg [0:0] recv_from_dma_spm_wr_req__rdy;
	input wire [0:0] recv_from_dma_spm_wr_req__val;
	input wire [198:0] recv_from_im2col_pkt__msg;
	output wire [0:0] recv_from_im2col_pkt__rdy;
	input wire [0:0] recv_from_im2col_pkt__val;
	input wire [201:0] recv_from_inter_cgra_noc__msg;
	output reg [0:0] recv_from_inter_cgra_noc__rdy;
	input wire [0:0] recv_from_inter_cgra_noc__val;
	input wire [31:0] recv_from_sram_load_response__msg;
	output reg [0:0] recv_from_sram_load_response__rdy;
	input wire [0:0] recv_from_sram_load_response__val;
	input wire [201:0] recv_from_tile_load_request_pkt__msg;
	output wire [0:0] recv_from_tile_load_request_pkt__rdy;
	input wire [0:0] recv_from_tile_load_request_pkt__val;
	input wire [201:0] recv_from_tile_load_response_pkt__msg;
	output wire [0:0] recv_from_tile_load_response_pkt__rdy;
	input wire [0:0] recv_from_tile_load_response_pkt__val;
	input wire [201:0] recv_from_tile_store_request_pkt__msg;
	output wire [0:0] recv_from_tile_store_request_pkt__rdy;
	input wire [0:0] recv_from_tile_store_request_pkt__val;
	output wire [198:0] send_to_cpu_pkt__msg;
	input wire [0:0] send_to_cpu_pkt__rdy;
	output wire [0:0] send_to_cpu_pkt__val;
	output reg [198:0] send_to_ctrl_ring_pkt__msg;
	input wire [0:0] send_to_ctrl_ring_pkt__rdy;
	output reg [0:0] send_to_ctrl_ring_pkt__val;
	output reg [31:0] send_to_dma_spm_rd_resp__msg;
	input wire [0:0] send_to_dma_spm_rd_resp__rdy;
	output reg [0:0] send_to_dma_spm_rd_resp__val;
	output reg [198:0] send_to_im2col_engine_pkt__msg;
	input wire [0:0] send_to_im2col_engine_pkt__rdy;
	output reg [0:0] send_to_im2col_engine_pkt__val;
	output reg [201:0] send_to_inter_cgra_noc__msg;
	input wire [0:0] send_to_inter_cgra_noc__rdy;
	output reg [0:0] send_to_inter_cgra_noc__val;
	output reg [31:0] send_to_sram_load_request_from_dma__msg;
	input wire [0:0] send_to_sram_load_request_from_dma__rdy;
	output reg [0:0] send_to_sram_load_request_from_dma__val;
	output wire [201:0] send_to_sram_load_request_from_noc__msg;
	input wire [0:0] send_to_sram_load_request_from_noc__rdy;
	output wire [0:0] send_to_sram_load_request_from_noc__val;
	output reg [67:0] send_to_sram_store_request_from_dma__msg;
	input wire [0:0] send_to_sram_store_request_from_dma__rdy;
	output reg [0:0] send_to_sram_store_request_from_dma__val;
	output wire [201:0] send_to_sram_store_request_from_noc__msg;
	input wire [0:0] send_to_sram_store_request_from_noc__rdy;
	output wire [0:0] send_to_sram_store_request_from_noc__val;
	output wire [201:0] send_to_tile_load_response__msg;
	input wire [0:0] send_to_tile_load_response__rdy;
	output wire [0:0] send_to_tile_load_response__val;
	localparam [0:0] __const__has_dma_ports_at_update_dma_cmd_regs = 1'd0;
	localparam [5:0] __const__CMD_DMA_CONFIG_DRAM_ADDR_LO = 6'd44;
	localparam [5:0] __const__CMD_DMA_CONFIG_DRAM_ADDR_HI = 6'd45;
	localparam [5:0] __const__CMD_DMA_CONFIG_SPM_ADDR = 6'd46;
	localparam [5:0] __const__CMD_DMA_CONFIG_BYTES = 6'd47;
	localparam [5:0] __const__CMD_DMA_CONFIG_TAG = 6'd48;
	localparam [0:0] __const__has_dma_ports_at_update_dma_spm_forwarding = 1'd0;
	localparam [0:0] __const__DMA_MVIN = 1'd0;
	localparam [2:0] __const__CONTROLLER_CROSSBAR_INPORTS = 3'd7;
	localparam [2:0] __const__kFromInterTileRingIdx = 3'd4;
	localparam [0:0] __const__kLoadRequestInportIdx = 1'd0;
	localparam [1:0] __const__kStoreRequestInportIdx = 2'd2;
	localparam [0:0] __const__kLoadResponseInportIdx = 1'd1;
	localparam [2:0] __const__kFromReduceUnitIdx = 3'd5;
	localparam [2:0] __const__kFromIm2colIdx = 3'd6;
	localparam [2:0] __const__num_tiles_at_update_received_msg = 3'd4;
	localparam [0:0] __const__has_dma_ports_at_update_received_msg = 1'd0;
	localparam [5:0] __const__CMD_DMA_MVIN = 6'd49;
	localparam [5:0] __const__CMD_DMA_MVOUT = 6'd50;
	localparam [0:0] __const__DMA_MVOUT = 1'd1;
	localparam [0:0] __const__has_im2col_engine_at_update_received_msg = 1'd0;
	localparam [5:0] __const__CMD_IM2COL_LAUNCH = 6'd52;
	localparam [5:0] __const__CMD_IM2COL_H = 6'd53;
	localparam [5:0] __const__CMD_IM2COL_W = 6'd54;
	localparam [5:0] __const__CMD_IM2COL_KH = 6'd55;
	localparam [5:0] __const__CMD_IM2COL_KW = 6'd56;
	localparam [5:0] __const__CMD_IM2COL_LOG2_STRIDE = 6'd57;
	localparam [5:0] __const__CMD_IM2COL_DST_SRAM_BASE = 6'd58;
	localparam [1:0] __const__kFromCpuCtrlAndDataIdx = 2'd3;
	localparam [3:0] __const__CMD_LOAD_REQUEST = 4'd10;
	localparam [3:0] __const__CMD_STORE_REQUEST = 4'd12;
	localparam [3:0] __const__CMD_LOAD_RESPONSE = 4'd11;
	localparam [3:0] __const__CMD_COMPLETE = 4'd14;
	localparam [4:0] __const__CMD_LEAF_COUNTER_COMPLETE = 5'd31;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_ADD = 5'd18;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_COUNT = 5'd17;
	localparam [1:0] __const__CMD_CONFIG = 2'd3;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_FU = 3'd4;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR = 3'd5;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR = 3'd6;
	localparam [2:0] __const__CMD_CONFIG_TOTAL_CTRL_COUNT = 3'd7;
	localparam [3:0] __const__CMD_CONFIG_COUNT_PER_ITER = 4'd8;
	localparam [3:0] __const__CMD_CONFIG_CTRL_LOWER_BOUND = 4'd9;
	localparam [3:0] __const__CMD_CONST = 4'd13;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE = 5'd20;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE = 5'd21;
	localparam [4:0] __const__CMD_CONFIG_STREAMING_LD_START_ADDR = 5'd23;
	localparam [4:0] __const__CMD_CONFIG_STREAMING_LD_STRIDE = 5'd24;
	localparam [4:0] __const__CMD_CONFIG_STREAMING_LD_END_ADDR = 5'd25;
	localparam [0:0] __const__CMD_PAUSE = 1'd1;
	localparam [4:0] __const__CMD_PRESERVE = 5'd22;
	localparam [3:0] __const__CMD_RESUME = 4'd15;
	localparam [4:0] __const__CMD_RECORD_PHI_ADDR = 5'd16;
	localparam [1:0] __const__CMD_TERMINATE = 2'd2;
	localparam [0:0] __const__CMD_LAUNCH = 1'd0;
	localparam [4:0] __const__CMD_CONFIG_LOOP_LOWER = 5'd28;
	localparam [4:0] __const__CMD_CONFIG_LOOP_UPPER = 5'd29;
	localparam [4:0] __const__CMD_CONFIG_LOOP_STEP = 5'd30;
	localparam [5:0] __const__CMD_DMA_DONE = 6'd51;
	localparam [2:0] __const__addr_offset_nbits_at_capture_addr_dst_id = 3'd5;
	wire [1:0] addr2controller_lut [0:3];
	reg [1:0] addr_dst_id;
	reg [31:0] dma_bytes;
	reg [31:0] dma_dram_addr_hi;
	reg [31:0] dma_dram_addr_lo;
	reg [31:0] dma_spm_addr;
	reg [7:0] dma_tag;
	wire [1:0] idTo2d_x_lut [0:3];
	wire [0:0] idTo2d_y_lut [0:3];
	wire [0:0] crossbar__clk;
	wire [0:0] crossbar__reset;
	reg [1420:0] crossbar__recv__msg;
	wire [6:0] crossbar__recv__rdy;
	reg [6:0] crossbar__recv__val;
	wire [202:0] crossbar__send__msg;
	reg [0:0] crossbar__send__rdy;
	wire [0:0] crossbar__send__val;
	XbarRTL__6c7ab8185a86fe91 crossbar(
		.clk(crossbar__clk),
		.reset(crossbar__reset),
		.recv__msg(crossbar__recv__msg),
		.recv__rdy(crossbar__recv__rdy),
		.recv__val(crossbar__recv__val),
		.send__msg(crossbar__send__msg),
		.send__rdy(crossbar__send__rdy),
		.send__val(crossbar__send__val)
	);
	wire [0:0] global_reduce_unit__clk;
	wire [0:0] global_reduce_unit__reset;
	reg [201:0] global_reduce_unit__recv_count__msg;
	wire [0:0] global_reduce_unit__recv_count__rdy;
	reg [0:0] global_reduce_unit__recv_count__val;
	reg [201:0] global_reduce_unit__recv_data__msg;
	wire [0:0] global_reduce_unit__recv_data__rdy;
	reg [0:0] global_reduce_unit__recv_data__val;
	wire [202:0] global_reduce_unit__send__msg;
	reg [0:0] global_reduce_unit__send__rdy;
	wire [0:0] global_reduce_unit__send__val;
	GlobalReduceUnitRTL__f4c437a52d97698d global_reduce_unit(
		.clk(global_reduce_unit__clk),
		.reset(global_reduce_unit__reset),
		.recv_count__msg(global_reduce_unit__recv_count__msg),
		.recv_count__rdy(global_reduce_unit__recv_count__rdy),
		.recv_count__val(global_reduce_unit__recv_count__val),
		.recv_data__msg(global_reduce_unit__recv_data__msg),
		.recv_data__rdy(global_reduce_unit__recv_data__rdy),
		.recv_data__val(global_reduce_unit__recv_data__val),
		.send__msg(global_reduce_unit__send__msg),
		.send__rdy(global_reduce_unit__send__rdy),
		.send__val(global_reduce_unit__send__val)
	);
	wire [0:0] recv_from_cpu_pkt_queue__clk;
	wire [1:0] recv_from_cpu_pkt_queue__count;
	wire [0:0] recv_from_cpu_pkt_queue__reset;
	wire [198:0] recv_from_cpu_pkt_queue__recv__msg;
	wire [0:0] recv_from_cpu_pkt_queue__recv__rdy;
	wire [0:0] recv_from_cpu_pkt_queue__recv__val;
	wire [198:0] recv_from_cpu_pkt_queue__send__msg;
	reg [0:0] recv_from_cpu_pkt_queue__send__rdy;
	wire [0:0] recv_from_cpu_pkt_queue__send__val;
	NormalQueueRTL__81615e1e2a6a0781 recv_from_cpu_pkt_queue(
		.clk(recv_from_cpu_pkt_queue__clk),
		.count(recv_from_cpu_pkt_queue__count),
		.reset(recv_from_cpu_pkt_queue__reset),
		.recv__msg(recv_from_cpu_pkt_queue__recv__msg),
		.recv__rdy(recv_from_cpu_pkt_queue__recv__rdy),
		.recv__val(recv_from_cpu_pkt_queue__recv__val),
		.send__msg(recv_from_cpu_pkt_queue__send__msg),
		.send__rdy(recv_from_cpu_pkt_queue__send__rdy),
		.send__val(recv_from_cpu_pkt_queue__send__val)
	);
	wire [0:0] recv_from_im2col_pkt_queue__clk;
	wire [0:0] recv_from_im2col_pkt_queue__reset;
	wire [198:0] recv_from_im2col_pkt_queue__recv__msg;
	wire [0:0] recv_from_im2col_pkt_queue__recv__rdy;
	wire [0:0] recv_from_im2col_pkt_queue__recv__val;
	wire [198:0] recv_from_im2col_pkt_queue__send__msg;
	reg [0:0] recv_from_im2col_pkt_queue__send__rdy;
	wire [0:0] recv_from_im2col_pkt_queue__send__val;
	ChannelRTL__673a1c2e63951e3b recv_from_im2col_pkt_queue(
		.clk(recv_from_im2col_pkt_queue__clk),
		.reset(recv_from_im2col_pkt_queue__reset),
		.recv__msg(recv_from_im2col_pkt_queue__recv__msg),
		.recv__rdy(recv_from_im2col_pkt_queue__recv__rdy),
		.recv__val(recv_from_im2col_pkt_queue__recv__val),
		.send__msg(recv_from_im2col_pkt_queue__send__msg),
		.send__rdy(recv_from_im2col_pkt_queue__send__rdy),
		.send__val(recv_from_im2col_pkt_queue__send__val)
	);
	wire [0:0] recv_from_tile_load_request_pkt_queue__clk;
	wire [0:0] recv_from_tile_load_request_pkt_queue__reset;
	wire [201:0] recv_from_tile_load_request_pkt_queue__recv__msg;
	wire [0:0] recv_from_tile_load_request_pkt_queue__recv__rdy;
	wire [0:0] recv_from_tile_load_request_pkt_queue__recv__val;
	wire [201:0] recv_from_tile_load_request_pkt_queue__send__msg;
	reg [0:0] recv_from_tile_load_request_pkt_queue__send__rdy;
	wire [0:0] recv_from_tile_load_request_pkt_queue__send__val;
	ChannelRTL__380c4a6127312dbb recv_from_tile_load_request_pkt_queue(
		.clk(recv_from_tile_load_request_pkt_queue__clk),
		.reset(recv_from_tile_load_request_pkt_queue__reset),
		.recv__msg(recv_from_tile_load_request_pkt_queue__recv__msg),
		.recv__rdy(recv_from_tile_load_request_pkt_queue__recv__rdy),
		.recv__val(recv_from_tile_load_request_pkt_queue__recv__val),
		.send__msg(recv_from_tile_load_request_pkt_queue__send__msg),
		.send__rdy(recv_from_tile_load_request_pkt_queue__send__rdy),
		.send__val(recv_from_tile_load_request_pkt_queue__send__val)
	);
	wire [0:0] recv_from_tile_load_response_pkt_queue__clk;
	wire [0:0] recv_from_tile_load_response_pkt_queue__reset;
	wire [201:0] recv_from_tile_load_response_pkt_queue__recv__msg;
	wire [0:0] recv_from_tile_load_response_pkt_queue__recv__rdy;
	wire [0:0] recv_from_tile_load_response_pkt_queue__recv__val;
	wire [201:0] recv_from_tile_load_response_pkt_queue__send__msg;
	reg [0:0] recv_from_tile_load_response_pkt_queue__send__rdy;
	wire [0:0] recv_from_tile_load_response_pkt_queue__send__val;
	ChannelRTL__380c4a6127312dbb recv_from_tile_load_response_pkt_queue(
		.clk(recv_from_tile_load_response_pkt_queue__clk),
		.reset(recv_from_tile_load_response_pkt_queue__reset),
		.recv__msg(recv_from_tile_load_response_pkt_queue__recv__msg),
		.recv__rdy(recv_from_tile_load_response_pkt_queue__recv__rdy),
		.recv__val(recv_from_tile_load_response_pkt_queue__recv__val),
		.send__msg(recv_from_tile_load_response_pkt_queue__send__msg),
		.send__rdy(recv_from_tile_load_response_pkt_queue__send__rdy),
		.send__val(recv_from_tile_load_response_pkt_queue__send__val)
	);
	wire [0:0] recv_from_tile_store_request_pkt_queue__clk;
	wire [0:0] recv_from_tile_store_request_pkt_queue__reset;
	wire [201:0] recv_from_tile_store_request_pkt_queue__recv__msg;
	wire [0:0] recv_from_tile_store_request_pkt_queue__recv__rdy;
	wire [0:0] recv_from_tile_store_request_pkt_queue__recv__val;
	wire [201:0] recv_from_tile_store_request_pkt_queue__send__msg;
	reg [0:0] recv_from_tile_store_request_pkt_queue__send__rdy;
	wire [0:0] recv_from_tile_store_request_pkt_queue__send__val;
	ChannelRTL__380c4a6127312dbb recv_from_tile_store_request_pkt_queue(
		.clk(recv_from_tile_store_request_pkt_queue__clk),
		.reset(recv_from_tile_store_request_pkt_queue__reset),
		.recv__msg(recv_from_tile_store_request_pkt_queue__recv__msg),
		.recv__rdy(recv_from_tile_store_request_pkt_queue__recv__rdy),
		.recv__val(recv_from_tile_store_request_pkt_queue__recv__val),
		.send__msg(recv_from_tile_store_request_pkt_queue__send__msg),
		.send__rdy(recv_from_tile_store_request_pkt_queue__send__rdy),
		.send__val(recv_from_tile_store_request_pkt_queue__send__val)
	);
	wire [0:0] send_to_cpu_pkt_queue__clk;
	wire [1:0] send_to_cpu_pkt_queue__count;
	wire [0:0] send_to_cpu_pkt_queue__reset;
	reg [198:0] send_to_cpu_pkt_queue__recv__msg;
	wire [0:0] send_to_cpu_pkt_queue__recv__rdy;
	reg [0:0] send_to_cpu_pkt_queue__recv__val;
	wire [198:0] send_to_cpu_pkt_queue__send__msg;
	wire [0:0] send_to_cpu_pkt_queue__send__rdy;
	wire [0:0] send_to_cpu_pkt_queue__send__val;
	NormalQueueRTL__81615e1e2a6a0781 send_to_cpu_pkt_queue(
		.clk(send_to_cpu_pkt_queue__clk),
		.count(send_to_cpu_pkt_queue__count),
		.reset(send_to_cpu_pkt_queue__reset),
		.recv__msg(send_to_cpu_pkt_queue__recv__msg),
		.recv__rdy(send_to_cpu_pkt_queue__recv__rdy),
		.recv__val(send_to_cpu_pkt_queue__recv__val),
		.send__msg(send_to_cpu_pkt_queue__send__msg),
		.send__rdy(send_to_cpu_pkt_queue__send__rdy),
		.send__val(send_to_cpu_pkt_queue__send__val)
	);
	wire [0:0] send_to_mem_load_request_queue__clk;
	wire [0:0] send_to_mem_load_request_queue__reset;
	reg [201:0] send_to_mem_load_request_queue__recv__msg;
	wire [0:0] send_to_mem_load_request_queue__recv__rdy;
	reg [0:0] send_to_mem_load_request_queue__recv__val;
	wire [201:0] send_to_mem_load_request_queue__send__msg;
	wire [0:0] send_to_mem_load_request_queue__send__rdy;
	wire [0:0] send_to_mem_load_request_queue__send__val;
	ChannelRTL__380c4a6127312dbb send_to_mem_load_request_queue(
		.clk(send_to_mem_load_request_queue__clk),
		.reset(send_to_mem_load_request_queue__reset),
		.recv__msg(send_to_mem_load_request_queue__recv__msg),
		.recv__rdy(send_to_mem_load_request_queue__recv__rdy),
		.recv__val(send_to_mem_load_request_queue__recv__val),
		.send__msg(send_to_mem_load_request_queue__send__msg),
		.send__rdy(send_to_mem_load_request_queue__send__rdy),
		.send__val(send_to_mem_load_request_queue__send__val)
	);
	wire [0:0] send_to_mem_store_request_queue__clk;
	wire [0:0] send_to_mem_store_request_queue__reset;
	reg [201:0] send_to_mem_store_request_queue__recv__msg;
	wire [0:0] send_to_mem_store_request_queue__recv__rdy;
	reg [0:0] send_to_mem_store_request_queue__recv__val;
	wire [201:0] send_to_mem_store_request_queue__send__msg;
	wire [0:0] send_to_mem_store_request_queue__send__rdy;
	wire [0:0] send_to_mem_store_request_queue__send__val;
	ChannelRTL__380c4a6127312dbb send_to_mem_store_request_queue(
		.clk(send_to_mem_store_request_queue__clk),
		.reset(send_to_mem_store_request_queue__reset),
		.recv__msg(send_to_mem_store_request_queue__recv__msg),
		.recv__rdy(send_to_mem_store_request_queue__recv__rdy),
		.recv__val(send_to_mem_store_request_queue__recv__val),
		.send__msg(send_to_mem_store_request_queue__send__msg),
		.send__rdy(send_to_mem_store_request_queue__send__rdy),
		.send__val(send_to_mem_store_request_queue__send__val)
	);
	wire [0:0] send_to_tile_load_response_queue__clk;
	wire [0:0] send_to_tile_load_response_queue__reset;
	reg [201:0] send_to_tile_load_response_queue__recv__msg;
	wire [0:0] send_to_tile_load_response_queue__recv__rdy;
	reg [0:0] send_to_tile_load_response_queue__recv__val;
	wire [201:0] send_to_tile_load_response_queue__send__msg;
	wire [0:0] send_to_tile_load_response_queue__send__rdy;
	wire [0:0] send_to_tile_load_response_queue__send__val;
	ChannelRTL__380c4a6127312dbb send_to_tile_load_response_queue(
		.clk(send_to_tile_load_response_queue__clk),
		.reset(send_to_tile_load_response_queue__reset),
		.recv__msg(send_to_tile_load_response_queue__recv__msg),
		.recv__rdy(send_to_tile_load_response_queue__recv__rdy),
		.recv__val(send_to_tile_load_response_queue__recv__val),
		.send__msg(send_to_tile_load_response_queue__send__msg),
		.send__rdy(send_to_tile_load_response_queue__send__rdy),
		.send__val(send_to_tile_load_response_queue__send__val)
	);
	reg [173:0] __tmpvar__update_dma_cmd_regs_cpu_payload;
	reg [5:0] __tmpvar__update_dma_cmd_regs_cpu_cmd;
	reg [31:0] __tmpvar__update_dma_cmd_regs_cpu_data;
	reg [173:0] __tmpvar__update_received_msg_cpu_payload;
	reg [5:0] __tmpvar__update_received_msg_cpu_cmd;
	reg [201:0] __tmpvar__update_received_msg_received_pkt;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : capture_addr_dst_id
		addr_dst_id = addr2controller_lut[sv2v_cast_2(crossbar__send__msg[(1'd0 * 203) + 132-:7] >> __const__addr_offset_nbits_at_capture_addr_dst_id)];
	end
	always @(*) begin : update_dma_spm_forwarding
		if (__const__has_dma_ports_at_update_dma_spm_forwarding) begin
			send_to_sram_store_request_from_dma__val = recv_from_dma_spm_wr_req__val;
			recv_from_dma_spm_wr_req__rdy = send_to_sram_store_request_from_dma__rdy;
			send_to_sram_store_request_from_dma__msg = recv_from_dma_spm_wr_req__msg;
			send_to_sram_load_request_from_dma__val = recv_from_dma_spm_rd_req__val;
			recv_from_dma_spm_rd_req__rdy = send_to_sram_load_request_from_dma__rdy;
			send_to_sram_load_request_from_dma__msg = recv_from_dma_spm_rd_req__msg;
			send_to_dma_spm_rd_resp__val = recv_from_sram_load_response__val;
			recv_from_sram_load_response__rdy = send_to_dma_spm_rd_resp__rdy;
			send_to_dma_spm_rd_resp__msg = recv_from_sram_load_response__msg;
		end
		else begin
			send_to_sram_store_request_from_dma__val = 1'd0;
			send_to_sram_store_request_from_dma__msg = 68'h00000000000000000;
			send_to_sram_load_request_from_dma__val = 1'd0;
			send_to_sram_load_request_from_dma__msg = 32'd0;
			recv_from_sram_load_response__rdy = 1'd0;
			recv_from_dma_spm_wr_req__rdy = 1'd0;
			recv_from_dma_spm_rd_req__rdy = 1'd0;
			send_to_dma_spm_rd_resp__val = 1'd0;
			send_to_dma_spm_rd_resp__msg = 32'd0;
		end
	end
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin : update_received_msg
		send_to_cpu_pkt_queue__recv__val = 1'd0;
		send_to_cpu_pkt_queue__recv__msg = 199'h00000000000000000000000000000000000000000000000000;
		recv_from_ctrl_ring_pkt__rdy = 1'd0;
		dma_cmd__val = 1'd0;
		dma_cmd__msg = {3'd0, {dma_dram_addr_hi, dma_dram_addr_lo}, dma_spm_addr, dma_bytes, dma_tag};
		dma_done__rdy = 1'd0;
		send_to_im2col_engine_pkt__val = 1'd0;
		send_to_im2col_engine_pkt__msg = 199'h00000000000000000000000000000000000000000000000000;
		recv_from_im2col_pkt_queue__send__rdy = 1'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__CONTROLLER_CROSSBAR_INPORTS; i = i + 1'd1)
				begin
					crossbar__recv__val[6 - sv2v_cast_3(i)+:1] = 1'd0;
					crossbar__recv__msg[(6 - sv2v_cast_3(i)) * 203+:203] = 203'h000000000000000000000000000000000000000000000000000;
				end
		end
		crossbar__recv__val[6 - __const__kFromInterTileRingIdx+:1] = recv_from_ctrl_ring_pkt__val;
		recv_from_ctrl_ring_pkt__rdy = crossbar__recv__rdy[6 - __const__kFromInterTileRingIdx+:1];
		crossbar__recv__msg[(6 - __const__kFromInterTileRingIdx) * 203+:203] = {1'd0, {cgra_id, recv_from_ctrl_ring_pkt__msg[190-:2], idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], recv_from_ctrl_ring_pkt__msg[185-:2], recv_from_ctrl_ring_pkt__msg[183], recv_from_ctrl_ring_pkt__msg[198-:3], recv_from_ctrl_ring_pkt__msg[195-:3], 2'd0, 8'd0, 2'd0, recv_from_ctrl_ring_pkt__msg[173-:174]}};
		crossbar__recv__val[6 - sv2v_cast_3(__const__kLoadRequestInportIdx)+:1] = recv_from_tile_load_request_pkt_queue__send__val;
		recv_from_tile_load_request_pkt_queue__send__rdy = crossbar__recv__rdy[6 - sv2v_cast_3(__const__kLoadRequestInportIdx)+:1];
		crossbar__recv__msg[(6 - sv2v_cast_3(__const__kLoadRequestInportIdx)) * 203+:203] = {1'd0, recv_from_tile_load_request_pkt_queue__send__msg};
		crossbar__recv__val[6 - sv2v_cast_3(__const__kStoreRequestInportIdx)+:1] = recv_from_tile_store_request_pkt_queue__send__val;
		recv_from_tile_store_request_pkt_queue__send__rdy = crossbar__recv__rdy[6 - sv2v_cast_3(__const__kStoreRequestInportIdx)+:1];
		crossbar__recv__msg[(6 - sv2v_cast_3(__const__kStoreRequestInportIdx)) * 203+:203] = {1'd0, recv_from_tile_store_request_pkt_queue__send__msg};
		crossbar__recv__val[6 - sv2v_cast_3(__const__kLoadResponseInportIdx)+:1] = recv_from_tile_load_response_pkt_queue__send__val;
		recv_from_tile_load_response_pkt_queue__send__rdy = crossbar__recv__rdy[6 - sv2v_cast_3(__const__kLoadResponseInportIdx)+:1];
		crossbar__recv__msg[(6 - sv2v_cast_3(__const__kLoadResponseInportIdx)) * 203+:203] = {1'd0, recv_from_tile_load_response_pkt_queue__send__msg};
		crossbar__recv__val[6 - __const__kFromReduceUnitIdx+:1] = global_reduce_unit__send__val;
		global_reduce_unit__send__rdy = crossbar__recv__rdy[6 - __const__kFromReduceUnitIdx+:1];
		crossbar__recv__msg[(6 - __const__kFromReduceUnitIdx) * 203+:203] = global_reduce_unit__send__msg;
		crossbar__recv__val[6 - __const__kFromIm2colIdx+:1] = recv_from_im2col_pkt_queue__send__val;
		recv_from_im2col_pkt_queue__send__rdy = crossbar__recv__rdy[6 - __const__kFromIm2colIdx+:1];
		crossbar__recv__msg[(6 - __const__kFromIm2colIdx) * 203+:203] = {1'd0, {cgra_id, recv_from_im2col_pkt_queue__send__msg[190-:2], 2'd0, 1'd0, idTo2d_x_lut[recv_from_im2col_pkt_queue__send__msg[190-:2]], idTo2d_y_lut[recv_from_im2col_pkt_queue__send__msg[190-:2]], __const__num_tiles_at_update_received_msg, recv_from_im2col_pkt_queue__send__msg[195-:3], 2'd0, 8'd0, 2'd0, recv_from_im2col_pkt_queue__send__msg[173-:174]}};
		__tmpvar__update_received_msg_cpu_payload = recv_from_cpu_pkt_queue__send__msg[173-:174];
		__tmpvar__update_received_msg_cpu_cmd = __tmpvar__update_received_msg_cpu_payload[173-:6];
		if (__const__has_dma_ports_at_update_received_msg & (((((__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_CONFIG_DRAM_ADDR_LO) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_CONFIG_DRAM_ADDR_HI)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_CONFIG_SPM_ADDR)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_CONFIG_BYTES)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_CONFIG_TAG)))
			recv_from_cpu_pkt_queue__send__rdy = 1'd1;
		else if (__const__has_dma_ports_at_update_received_msg & ((__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_MVIN) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_MVOUT))) begin
			dma_cmd__val = recv_from_cpu_pkt_queue__send__val;
			if (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_DMA_MVIN)
				dma_cmd__msg = {3'd0, {dma_dram_addr_hi, dma_dram_addr_lo}, dma_spm_addr, dma_bytes, dma_tag};
			else
				dma_cmd__msg = {3'd1, {dma_dram_addr_hi, dma_dram_addr_lo}, dma_spm_addr, dma_bytes, dma_tag};
			recv_from_cpu_pkt_queue__send__rdy = dma_cmd__rdy;
		end
		else if (__const__has_im2col_engine_at_update_received_msg & (((((((__tmpvar__update_received_msg_cpu_cmd == __const__CMD_IM2COL_LAUNCH) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_IM2COL_H)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_IM2COL_W)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_IM2COL_KH)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_IM2COL_KW)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_IM2COL_LOG2_STRIDE)) | (__tmpvar__update_received_msg_cpu_cmd == __const__CMD_IM2COL_DST_SRAM_BASE))) begin
			send_to_im2col_engine_pkt__val = recv_from_cpu_pkt_queue__send__val;
			send_to_im2col_engine_pkt__msg = recv_from_cpu_pkt_queue__send__msg;
			recv_from_cpu_pkt_queue__send__rdy = send_to_im2col_engine_pkt__rdy;
		end
		else begin
			crossbar__recv__val[6 - sv2v_cast_3(__const__kFromCpuCtrlAndDataIdx)+:1] = recv_from_cpu_pkt_queue__send__val;
			recv_from_cpu_pkt_queue__send__rdy = crossbar__recv__rdy[6 - sv2v_cast_3(__const__kFromCpuCtrlAndDataIdx)+:1];
			crossbar__recv__msg[(6 - sv2v_cast_3(__const__kFromCpuCtrlAndDataIdx)) * 203+:203] = {1'd0, {cgra_id, recv_from_cpu_pkt_queue__send__msg[190-:2], 2'd0, 1'd0, idTo2d_x_lut[recv_from_cpu_pkt_queue__send__msg[190-:2]], idTo2d_y_lut[recv_from_cpu_pkt_queue__send__msg[190-:2]], __const__num_tiles_at_update_received_msg, recv_from_cpu_pkt_queue__send__msg[195-:3], 2'd0, 8'd0, 2'd0, recv_from_cpu_pkt_queue__send__msg[173-:174]}};
		end
		send_to_mem_load_request_queue__recv__val = 1'd0;
		send_to_mem_store_request_queue__recv__val = 1'd0;
		send_to_tile_load_response_queue__recv__val = 1'd0;
		send_to_mem_load_request_queue__recv__msg = 202'h000000000000000000000000000000000000000000000000000;
		send_to_mem_store_request_queue__recv__msg = 202'h000000000000000000000000000000000000000000000000000;
		send_to_tile_load_response_queue__recv__msg = 202'h000000000000000000000000000000000000000000000000000;
		recv_from_inter_cgra_noc__rdy = 1'd0;
		send_to_ctrl_ring_pkt__val = 1'd0;
		send_to_ctrl_ring_pkt__msg = 199'h00000000000000000000000000000000000000000000000000;
		global_reduce_unit__recv_count__val = 1'd0;
		global_reduce_unit__recv_count__msg = 202'h000000000000000000000000000000000000000000000000000;
		global_reduce_unit__recv_data__val = 1'd0;
		global_reduce_unit__recv_data__msg = 202'h000000000000000000000000000000000000000000000000000;
		__tmpvar__update_received_msg_received_pkt = recv_from_inter_cgra_noc__msg;
		if (recv_from_inter_cgra_noc__val)
			if (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_LOAD_REQUEST)) begin
				send_to_mem_load_request_queue__recv__val = 1'd1;
				if (send_to_mem_load_request_queue__recv__rdy) begin
					recv_from_inter_cgra_noc__rdy = 1'd1;
					send_to_mem_load_request_queue__recv__msg = __tmpvar__update_received_msg_received_pkt;
				end
			end
			else if (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_STORE_REQUEST)) begin
				send_to_mem_store_request_queue__recv__msg = __tmpvar__update_received_msg_received_pkt;
				send_to_mem_store_request_queue__recv__val = 1'd1;
				if (send_to_mem_store_request_queue__recv__rdy)
					recv_from_inter_cgra_noc__rdy = 1'd1;
			end
			else if (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_LOAD_RESPONSE)) begin
				if (recv_from_inter_cgra_noc__msg[188-:3] == __const__num_tiles_at_update_received_msg) begin
					recv_from_inter_cgra_noc__rdy = send_to_cpu_pkt_queue__recv__rdy;
					send_to_cpu_pkt_queue__recv__val = 1'd1;
					send_to_cpu_pkt_queue__recv__msg = {recv_from_inter_cgra_noc__msg[191-:3], recv_from_inter_cgra_noc__msg[188-:3], recv_from_inter_cgra_noc__msg[201-:2], recv_from_inter_cgra_noc__msg[199-:2], recv_from_inter_cgra_noc__msg[197-:2], recv_from_inter_cgra_noc__msg[195], recv_from_inter_cgra_noc__msg[194-:2], recv_from_inter_cgra_noc__msg[192], 8'd0, 1'd0, recv_from_inter_cgra_noc__msg[173-:174]};
				end
				else begin
					recv_from_inter_cgra_noc__rdy = send_to_tile_load_response_queue__recv__rdy;
					send_to_tile_load_response_queue__recv__msg = __tmpvar__update_received_msg_received_pkt;
					send_to_tile_load_response_queue__recv__val = 1'd1;
				end
			end
			else if (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_COMPLETE)) begin
				recv_from_inter_cgra_noc__rdy = send_to_cpu_pkt_queue__recv__rdy;
				send_to_cpu_pkt_queue__recv__val = 1'd1;
				send_to_cpu_pkt_queue__recv__msg = {recv_from_inter_cgra_noc__msg[191-:3], recv_from_inter_cgra_noc__msg[188-:3], recv_from_inter_cgra_noc__msg[201-:2], recv_from_inter_cgra_noc__msg[199-:2], recv_from_inter_cgra_noc__msg[197-:2], recv_from_inter_cgra_noc__msg[195], recv_from_inter_cgra_noc__msg[194-:2], recv_from_inter_cgra_noc__msg[192], 8'd0, 1'd0, recv_from_inter_cgra_noc__msg[173-:174]};
			end
			else if (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_LEAF_COUNTER_COMPLETE))
				recv_from_inter_cgra_noc__rdy = 1'd1;
			else if (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD)) begin
				recv_from_inter_cgra_noc__rdy = global_reduce_unit__recv_data__rdy;
				global_reduce_unit__recv_data__val = 1'd1;
				global_reduce_unit__recv_data__msg = recv_from_inter_cgra_noc__msg;
			end
			else if (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_COUNT)) begin
				recv_from_inter_cgra_noc__rdy = global_reduce_unit__recv_count__rdy;
				global_reduce_unit__recv_count__val = 1'd1;
				global_reduce_unit__recv_count__msg = recv_from_inter_cgra_noc__msg;
			end
			else if ((((((((((((((((((((((recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG)) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_TOTAL_CTRL_COUNT))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_COUNT_PER_ITER))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_CTRL_LOWER_BOUND))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONST))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD_RESPONSE))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_MUL_RESPONSE))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_STREAMING_LD_START_ADDR))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_STREAMING_LD_STRIDE))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_STREAMING_LD_END_ADDR))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_PAUSE))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_PRESERVE))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_RESUME))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_RECORD_PHI_ADDR))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_TERMINATE))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_LAUNCH))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_LOWER))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_UPPER))) | (recv_from_inter_cgra_noc__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_STEP))) begin
				recv_from_inter_cgra_noc__rdy = send_to_ctrl_ring_pkt__rdy;
				send_to_ctrl_ring_pkt__val = recv_from_inter_cgra_noc__val;
				send_to_ctrl_ring_pkt__msg = {recv_from_inter_cgra_noc__msg[191-:3], recv_from_inter_cgra_noc__msg[188-:3], recv_from_inter_cgra_noc__msg[201-:2], recv_from_inter_cgra_noc__msg[199-:2], recv_from_inter_cgra_noc__msg[197-:2], recv_from_inter_cgra_noc__msg[195], recv_from_inter_cgra_noc__msg[194-:2], recv_from_inter_cgra_noc__msg[192], 8'd0, 1'd0, recv_from_inter_cgra_noc__msg[173-:174]};
			end
		if (__const__has_dma_ports_at_update_received_msg & dma_done__val) begin
			dma_done__rdy = send_to_cpu_pkt_queue__recv__rdy;
			send_to_cpu_pkt_queue__recv__val = 1'd1;
			send_to_cpu_pkt_queue__recv__msg = {__const__num_tiles_at_update_received_msg, __const__num_tiles_at_update_received_msg, cgra_id, cgra_id, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], dma_done__msg[7-:8], 1'd0, {__const__CMD_DMA_DONE, {{{24 {1'b0}}, dma_done__msg[7-:8]}, 1'd1, 1'd0, 1'd0}, 7'd0, 123'd0, 3'd0}};
		end
	end
	always @(*) begin : update_sending_to_noc_msg
		send_to_inter_cgra_noc__val = crossbar__send__val[1'd0+:1];
		crossbar__send__rdy[1'd0+:1] = send_to_inter_cgra_noc__rdy;
		send_to_inter_cgra_noc__msg = crossbar__send__msg[(1'd0 * 203) + 201-:202];
		if ((crossbar__send__msg[(1'd0 * 203) + 173-:6] == sv2v_cast_6(__const__CMD_LOAD_REQUEST)) | (crossbar__send__msg[(1'd0 * 203) + 173-:6] == sv2v_cast_6(__const__CMD_STORE_REQUEST))) begin
			send_to_inter_cgra_noc__msg[199-:2] = addr_dst_id;
			send_to_inter_cgra_noc__msg[194-:2] = idTo2d_x_lut[addr_dst_id];
			send_to_inter_cgra_noc__msg[192] = idTo2d_y_lut[addr_dst_id];
		end
	end
	function automatic [7:0] sv2v_cast_8;
		input reg [7:0] inp;
		sv2v_cast_8 = inp;
	endfunction
	always @(posedge clk) begin : update_dma_cmd_regs
		if (reset) begin
			dma_dram_addr_lo <= 32'd0;
			dma_dram_addr_hi <= 32'd0;
			dma_spm_addr <= 32'd0;
			dma_bytes <= 32'd0;
			dma_tag <= 8'd0;
		end
		else if (__const__has_dma_ports_at_update_dma_cmd_regs) begin
			__tmpvar__update_dma_cmd_regs_cpu_payload = recv_from_cpu_pkt_queue__send__msg[173-:174];
			__tmpvar__update_dma_cmd_regs_cpu_cmd = __tmpvar__update_dma_cmd_regs_cpu_payload[173-:6];
			__tmpvar__update_dma_cmd_regs_cpu_data = __tmpvar__update_dma_cmd_regs_cpu_payload[167-:32];
			if (recv_from_cpu_pkt_queue__send__val & recv_from_cpu_pkt_queue__send__rdy)
				if (__tmpvar__update_dma_cmd_regs_cpu_cmd == __const__CMD_DMA_CONFIG_DRAM_ADDR_LO)
					dma_dram_addr_lo <= __tmpvar__update_dma_cmd_regs_cpu_data;
				else if (__tmpvar__update_dma_cmd_regs_cpu_cmd == __const__CMD_DMA_CONFIG_DRAM_ADDR_HI)
					dma_dram_addr_hi <= __tmpvar__update_dma_cmd_regs_cpu_data;
				else if (__tmpvar__update_dma_cmd_regs_cpu_cmd == __const__CMD_DMA_CONFIG_SPM_ADDR)
					dma_spm_addr <= {{25 {1'b0}}, __tmpvar__update_dma_cmd_regs_cpu_payload[132-:7]};
				else if (__tmpvar__update_dma_cmd_regs_cpu_cmd == __const__CMD_DMA_CONFIG_BYTES)
					dma_bytes <= __tmpvar__update_dma_cmd_regs_cpu_data;
				else if (__tmpvar__update_dma_cmd_regs_cpu_cmd == __const__CMD_DMA_CONFIG_TAG)
					dma_tag <= sv2v_cast_8(__tmpvar__update_dma_cmd_regs_cpu_data);
		end
	end
	assign recv_from_tile_load_request_pkt_queue__clk = clk;
	assign recv_from_tile_load_request_pkt_queue__reset = reset;
	assign recv_from_tile_load_response_pkt_queue__clk = clk;
	assign recv_from_tile_load_response_pkt_queue__reset = reset;
	assign recv_from_tile_store_request_pkt_queue__clk = clk;
	assign recv_from_tile_store_request_pkt_queue__reset = reset;
	assign send_to_mem_load_request_queue__clk = clk;
	assign send_to_mem_load_request_queue__reset = reset;
	assign send_to_tile_load_response_queue__clk = clk;
	assign send_to_tile_load_response_queue__reset = reset;
	assign send_to_mem_store_request_queue__clk = clk;
	assign send_to_mem_store_request_queue__reset = reset;
	assign crossbar__clk = clk;
	assign crossbar__reset = reset;
	assign recv_from_cpu_pkt_queue__clk = clk;
	assign recv_from_cpu_pkt_queue__reset = reset;
	assign recv_from_im2col_pkt_queue__clk = clk;
	assign recv_from_im2col_pkt_queue__reset = reset;
	assign send_to_cpu_pkt_queue__clk = clk;
	assign send_to_cpu_pkt_queue__reset = reset;
	assign global_reduce_unit__clk = clk;
	assign global_reduce_unit__reset = reset;
	assign addr2controller_lut[0] = 2'd0;
	assign addr2controller_lut[1] = 2'd1;
	assign addr2controller_lut[2] = 2'd2;
	assign addr2controller_lut[3] = 2'd3;
	assign idTo2d_x_lut[0] = 2'd0;
	assign idTo2d_y_lut[0] = 1'd0;
	assign idTo2d_x_lut[1] = 2'd1;
	assign idTo2d_y_lut[1] = 1'd0;
	assign idTo2d_x_lut[2] = 2'd2;
	assign idTo2d_y_lut[2] = 1'd0;
	assign idTo2d_x_lut[3] = 2'd3;
	assign idTo2d_y_lut[3] = 1'd0;
	assign recv_from_tile_load_request_pkt_queue__recv__msg = recv_from_tile_load_request_pkt__msg;
	assign recv_from_tile_load_request_pkt__rdy = recv_from_tile_load_request_pkt_queue__recv__rdy;
	assign recv_from_tile_load_request_pkt_queue__recv__val = recv_from_tile_load_request_pkt__val;
	assign recv_from_tile_load_response_pkt_queue__recv__msg = recv_from_tile_load_response_pkt__msg;
	assign recv_from_tile_load_response_pkt__rdy = recv_from_tile_load_response_pkt_queue__recv__rdy;
	assign recv_from_tile_load_response_pkt_queue__recv__val = recv_from_tile_load_response_pkt__val;
	assign recv_from_tile_store_request_pkt_queue__recv__msg = recv_from_tile_store_request_pkt__msg;
	assign recv_from_tile_store_request_pkt__rdy = recv_from_tile_store_request_pkt_queue__recv__rdy;
	assign recv_from_tile_store_request_pkt_queue__recv__val = recv_from_tile_store_request_pkt__val;
	assign send_to_sram_load_request_from_noc__msg = send_to_mem_load_request_queue__send__msg;
	assign send_to_mem_load_request_queue__send__rdy = send_to_sram_load_request_from_noc__rdy;
	assign send_to_sram_load_request_from_noc__val = send_to_mem_load_request_queue__send__val;
	assign send_to_tile_load_response__msg = send_to_tile_load_response_queue__send__msg;
	assign send_to_tile_load_response_queue__send__rdy = send_to_tile_load_response__rdy;
	assign send_to_tile_load_response__val = send_to_tile_load_response_queue__send__val;
	assign send_to_sram_store_request_from_noc__msg = send_to_mem_store_request_queue__send__msg;
	assign send_to_mem_store_request_queue__send__rdy = send_to_sram_store_request_from_noc__rdy;
	assign send_to_sram_store_request_from_noc__val = send_to_mem_store_request_queue__send__val;
	assign recv_from_cpu_pkt_queue__recv__msg = recv_from_cpu_pkt__msg;
	assign recv_from_cpu_pkt__rdy = recv_from_cpu_pkt_queue__recv__rdy;
	assign recv_from_cpu_pkt_queue__recv__val = recv_from_cpu_pkt__val;
	assign send_to_cpu_pkt__msg = send_to_cpu_pkt_queue__send__msg;
	assign send_to_cpu_pkt_queue__send__rdy = send_to_cpu_pkt__rdy;
	assign send_to_cpu_pkt__val = send_to_cpu_pkt_queue__send__val;
	assign recv_from_im2col_pkt_queue__recv__val = 1'd0;
	assign recv_from_im2col_pkt_queue__recv__msg = 199'h00000000000000000000000000000000000000000000000000;
endmodule
module Counter__Type_Bits2__reset_value_2 (
	clk,
	count,
	decr,
	incr,
	load,
	load_value,
	reset
);
	input wire [0:0] clk;
	output reg [1:0] count;
	input wire [0:0] decr;
	input wire [0:0] incr;
	input wire [0:0] load;
	input wire [1:0] load_value;
	input wire [0:0] reset;
	localparam [1:0] __const__reset_value_at_up_count = 2'd2;
	always @(posedge clk) begin : up_count
		if (reset)
			count <= __const__reset_value_at_up_count;
		else if (load)
			count <= load_value;
		else if (incr & ~decr)
			count <= count + 2'd1;
		else if (~incr & decr)
			count <= count - 2'd1;
	end
endmodule
module RecvRTL2CreditSendRTL__6d31c46182ddb0c6 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__en,
	send__msg,
	send__yum
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [198:0] recv__msg;
	output reg [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output reg [0:0] send__en;
	output wire [198:0] send__msg;
	input wire [1:0] send__yum;
	localparam [1:0] __const__vc_at_up_credit_send = 2'd2;
	localparam [1:0] __const__vc_at_up_counter_decr = 2'd2;
	wire [0:0] credit__clk [0:1];
	wire [1:0] credit__count [0:1];
	reg [0:0] credit__decr [0:1];
	wire [0:0] credit__incr [0:1];
	wire [0:0] credit__load [0:1];
	wire [1:0] credit__load_value [0:1];
	wire [0:0] credit__reset [0:1];
	Counter__Type_Bits2__reset_value_2 credit__0(
		.clk(credit__clk[0]),
		.count(credit__count[0]),
		.decr(credit__decr[0]),
		.incr(credit__incr[0]),
		.load(credit__load[0]),
		.load_value(credit__load_value[0]),
		.reset(credit__reset[0])
	);
	Counter__Type_Bits2__reset_value_2 credit__1(
		.clk(credit__clk[1]),
		.count(credit__count[1]),
		.decr(credit__decr[1]),
		.incr(credit__incr[1]),
		.load(credit__load[1]),
		.load_value(credit__load_value[1]),
		.reset(credit__reset[1])
	);
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_counter_decr
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_counter_decr; i = i + 1'd1)
				credit__decr[sv2v_cast_1(i)] = send__en & (sv2v_cast_1(i) == send__msg[174]);
		end
	end
	always @(*) begin : up_credit_send
		send__en = 1'd0;
		recv__rdy = 1'd0;
		if (recv__val) begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_credit_send; i = i + 1'd1)
				if ((sv2v_cast_1(i) == recv__msg[174]) & (credit__count[sv2v_cast_1(i)] > 2'd0)) begin
					send__en = 1'd1;
					recv__rdy = 1'd1;
				end
		end
	end
	assign credit__clk[0] = clk;
	assign credit__reset[0] = reset;
	assign credit__clk[1] = clk;
	assign credit__reset[1] = reset;
	assign send__msg = recv__msg;
	assign credit__incr[0] = send__yum[1+:1];
	assign credit__load[0] = 1'd0;
	assign credit__load_value[0] = 2'd0;
	assign credit__incr[1] = send__yum[0+:1];
	assign credit__load[1] = 1'd0;
	assign credit__load_value[1] = 2'd0;
endmodule
module InputUnitCreditRTL__cee857d8d31bccfc (
	clk,
	reset,
	recv__en,
	recv__msg,
	recv__yum,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [0:0] recv__en;
	input wire [198:0] recv__msg;
	output reg [1:0] recv__yum;
	output wire [397:0] send__msg;
	input wire [1:0] send__rdy;
	output wire [1:0] send__val;
	localparam [0:0] __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_ = 1'd0;
	localparam [0:0] __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_ = 1'd1;
	localparam [1:0] __const__vc_at_up_enq = 2'd2;
	wire [0:0] buffers__clk [0:1];
	wire [1:0] buffers__count [0:1];
	wire [0:0] buffers__reset [0:1];
	wire [198:0] buffers__recv__msg [0:1];
	wire [0:0] buffers__recv__rdy [0:1];
	reg [0:0] buffers__recv__val [0:1];
	wire [198:0] buffers__send__msg [0:1];
	wire [0:0] buffers__send__rdy [0:1];
	wire [0:0] buffers__send__val [0:1];
	NormalQueueRTL__81615e1e2a6a0781 buffers__0(
		.clk(buffers__clk[0]),
		.count(buffers__count[0]),
		.reset(buffers__reset[0]),
		.recv__msg(buffers__recv__msg[0]),
		.recv__rdy(buffers__recv__rdy[0]),
		.recv__val(buffers__recv__val[0]),
		.send__msg(buffers__send__msg[0]),
		.send__rdy(buffers__send__rdy[0]),
		.send__val(buffers__send__val[0])
	);
	NormalQueueRTL__81615e1e2a6a0781 buffers__1(
		.clk(buffers__clk[1]),
		.count(buffers__count[1]),
		.reset(buffers__reset[1]),
		.recv__msg(buffers__recv__msg[1]),
		.recv__rdy(buffers__recv__rdy[1]),
		.recv__val(buffers__recv__val[1]),
		.send__msg(buffers__send__msg[1]),
		.send__rdy(buffers__send__rdy[1]),
		.send__val(buffers__send__val[1])
	);
	always @(*) begin : _lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_
		recv__yum[(1 - 1'd0) + 0+:1] = send__val[1 - __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_+:1] & send__rdy[1 - __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_0_+:1];
	end
	always @(*) begin : _lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_
		recv__yum[(1 - 1'd1) + 0+:1] = send__val[1 - __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_+:1] & send__rdy[1 - __const__i_at__lambda__s_dut_ctrl_ring_routers_0__input_units_0__recv_yum_1_+:1];
	end
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_enq
		if (recv__en) begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_enq; i = i + 1'd1)
				buffers__recv__val[sv2v_cast_1(i)] = recv__msg[174] == sv2v_cast_1(i);
		end
		else begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_enq; i = i + 1'd1)
				buffers__recv__val[sv2v_cast_1(i)] = 1'd0;
		end
	end
	assign buffers__clk[0] = clk;
	assign buffers__reset[0] = reset;
	assign buffers__clk[1] = clk;
	assign buffers__reset[1] = reset;
	assign buffers__recv__msg[0] = recv__msg;
	assign send__msg[199+:199] = buffers__send__msg[0];
	assign buffers__send__rdy[0] = send__rdy[1+:1];
	assign send__val[1+:1] = buffers__send__val[0];
	assign buffers__recv__msg[1] = recv__msg;
	assign send__msg[0+:199] = buffers__send__msg[1];
	assign buffers__send__rdy[1] = send__rdy[0+:1];
	assign send__val[0+:1] = buffers__send__val[1];
endmodule
module OutputUnitCreditRTL__6d31c46182ddb0c6 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__en,
	send__msg,
	send__yum
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [198:0] recv__msg;
	output reg [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output reg [0:0] send__en;
	output wire [198:0] send__msg;
	input wire [1:0] send__yum;
	localparam [1:0] __const__vc_at_up_credit_send = 2'd2;
	localparam [1:0] __const__vc_at_up_counter_decr = 2'd2;
	wire [0:0] credit__clk [0:1];
	wire [1:0] credit__count [0:1];
	reg [0:0] credit__decr [0:1];
	wire [0:0] credit__incr [0:1];
	wire [0:0] credit__load [0:1];
	wire [1:0] credit__load_value [0:1];
	wire [0:0] credit__reset [0:1];
	Counter__Type_Bits2__reset_value_2 credit__0(
		.clk(credit__clk[0]),
		.count(credit__count[0]),
		.decr(credit__decr[0]),
		.incr(credit__incr[0]),
		.load(credit__load[0]),
		.load_value(credit__load_value[0]),
		.reset(credit__reset[0])
	);
	Counter__Type_Bits2__reset_value_2 credit__1(
		.clk(credit__clk[1]),
		.count(credit__count[1]),
		.decr(credit__decr[1]),
		.incr(credit__incr[1]),
		.load(credit__load[1]),
		.load_value(credit__load_value[1]),
		.reset(credit__reset[1])
	);
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_counter_decr
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_counter_decr; i = i + 1'd1)
				credit__decr[sv2v_cast_1(i)] = send__en & (sv2v_cast_1(i) == send__msg[174]);
		end
	end
	always @(*) begin : up_credit_send
		send__en = 1'd0;
		recv__rdy = 1'd0;
		if (recv__val) begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_credit_send; i = i + 1'd1)
				if ((sv2v_cast_1(i) == recv__msg[174]) & (credit__count[sv2v_cast_1(i)] > 2'd0)) begin
					send__en = 1'd1;
					recv__rdy = 1'd1;
				end
		end
	end
	assign credit__clk[0] = clk;
	assign credit__reset[0] = reset;
	assign credit__clk[1] = clk;
	assign credit__reset[1] = reset;
	assign send__msg = recv__msg;
	assign credit__incr[0] = send__yum[1+:1];
	assign credit__load[0] = 1'd0;
	assign credit__load_value[0] = 2'd0;
	assign credit__incr[1] = send__yum[0+:1];
	assign credit__load[1] = 1'd0;
	assign credit__load_value[1] = 2'd0;
endmodule
module RingRouteUnitRTL__811433b6dff0599c (
	clk,
	pos,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [2:0] pos;
	input wire [0:0] reset;
	input wire [198:0] recv__msg;
	output reg [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output reg [596:0] send__msg;
	input wire [2:0] send__rdy;
	output reg [2:0] send__val;
	localparam [1:0] __const__SELF = 2'd2;
	localparam [0:0] __const__LEFT = 1'd0;
	localparam [0:0] __const__RIGHT = 1'd1;
	reg [2:0] left_dist;
	reg [1:0] out_dir;
	reg [2:0] right_dist;
	reg [198:0] send_msg_wire;
	wire [2:0] send_rdy;
	always @(*) begin : up_left_right_dist
		if (recv__msg[195-:3] < pos) begin
			left_dist = pos - recv__msg[195-:3];
			right_dist = ((3'd4 - pos) + recv__msg[195-:3]) + 3'd1;
		end
		else begin
			left_dist = ((3'd1 + 3'd4) + pos) - recv__msg[195-:3];
			right_dist = recv__msg[195-:3] - pos;
		end
	end
	always @(*) begin : up_ru_recv_rdy
		recv__rdy = send_rdy[out_dir];
	end
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : up_ru_routing
		out_dir = 2'd0;
		send_msg_wire = recv__msg;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < 2'd3; i = i + 1'd1)
				begin
					send__val[2 - sv2v_cast_2(i)+:1] = 1'd0;
					send__msg[(2 - sv2v_cast_2(i)) * 199+:199] = recv__msg;
				end
		end
		if (recv__val) begin
			if (pos == recv__msg[195-:3])
				out_dir = __const__SELF;
			else if (left_dist < right_dist)
				out_dir = sv2v_cast_2(__const__LEFT);
			else
				out_dir = sv2v_cast_2(__const__RIGHT);
			if ((pos == 3'd4) & (out_dir == sv2v_cast_2(__const__RIGHT)))
				send_msg_wire[174] = 1'd1;
			else if ((pos == 3'd0) & (out_dir == sv2v_cast_2(__const__LEFT)))
				send_msg_wire[174] = 1'd1;
			send__val[2 - out_dir+:1] = 1'd1;
			send__msg[(2 - out_dir) * 199+:199] = send_msg_wire;
		end
	end
	assign send_rdy[0:0] = send__rdy[2+:1];
	assign send_rdy[1:1] = send__rdy[1+:1];
	assign send_rdy[2:2] = send__rdy[0+:1];
endmodule
module RegEnRst__Type_Bits6__reset_value_1 (
	clk,
	en,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	input wire [5:0] in_;
	output reg [5:0] out;
	input wire [0:0] reset;
	localparam [0:0] __const__reset_value_at_up_regenrst = 1'd1;
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(posedge clk) begin : up_regenrst
		if (reset)
			out <= sv2v_cast_6(__const__reset_value_at_up_regenrst);
		else if (en)
			out <= in_;
	end
endmodule
module RoundRobinArbiterEn__nreqs_6 (
	clk,
	en,
	grants,
	reqs,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	output reg [5:0] grants;
	input wire [5:0] reqs;
	input wire [0:0] reset;
	localparam [2:0] __const__nreqs_at_comb_reqs_int = 3'd6;
	localparam [3:0] __const__nreqsX2_at_comb_reqs_int = 4'd12;
	localparam [2:0] __const__nreqs_at_comb_grants = 3'd6;
	localparam [2:0] __const__nreqs_at_comb_priority_int = 3'd6;
	localparam [3:0] __const__nreqsX2_at_comb_priority_int = 4'd12;
	localparam [3:0] __const__nreqsX2_at_comb_kills = 4'd12;
	localparam [3:0] __const__nreqsX2_at_comb_grants_int = 4'd12;
	reg [11:0] grants_int;
	reg [12:0] kills;
	reg [0:0] priority_en;
	reg [11:0] priority_int;
	reg [11:0] reqs_int;
	wire [0:0] priority_reg__clk;
	wire [0:0] priority_reg__en;
	wire [5:0] priority_reg__in_;
	wire [5:0] priority_reg__out;
	wire [0:0] priority_reg__reset;
	RegEnRst__Type_Bits6__reset_value_1 priority_reg(
		.clk(priority_reg__clk),
		.en(priority_reg__en),
		.in_(priority_reg__in_),
		.out(priority_reg__out),
		.reset(priority_reg__reset)
	);
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : comb_grants
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqs_at_comb_grants; i = i + 1'd1)
				grants[sv2v_cast_3(i)] = grants_int[sv2v_cast_4(i)] | grants_int[sv2v_cast_4(__const__nreqs_at_comb_grants) + sv2v_cast_4(i)];
		end
	end
	always @(*) begin : comb_grants_int
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_grants_int; i = i + 1'd1)
				if (priority_int[sv2v_cast_4(i)])
					grants_int[sv2v_cast_4(i)] = reqs_int[sv2v_cast_4(i)];
				else
					grants_int[sv2v_cast_4(i)] = ~kills[sv2v_cast_4(i)] & reqs_int[sv2v_cast_4(i)];
		end
	end
	always @(*) begin : comb_kills
		kills[4'd0] = 1'd1;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_kills; i = i + 1'd1)
				if (priority_int[sv2v_cast_4(i)])
					kills[sv2v_cast_4(i) + 4'd1] = reqs_int[sv2v_cast_4(i)];
				else
					kills[sv2v_cast_4(i) + 4'd1] = kills[sv2v_cast_4(i)] | (~kills[sv2v_cast_4(i)] & reqs_int[sv2v_cast_4(i)]);
		end
	end
	always @(*) begin : comb_priority_en
		priority_en = (grants != 6'd0) & en;
	end
	always @(*) begin : comb_priority_int
		priority_int[4'd5:4'd0] = priority_reg__out;
		priority_int[4'd11:sv2v_cast_4(__const__nreqs_at_comb_priority_int)] = 6'd0;
	end
	always @(*) begin : comb_reqs_int
		reqs_int[4'd5:4'd0] = reqs;
		reqs_int[4'd11:sv2v_cast_4(__const__nreqs_at_comb_reqs_int)] = reqs;
	end
	assign priority_reg__clk = clk;
	assign priority_reg__reset = reset;
	assign priority_reg__en = priority_en;
	assign priority_reg__in_[5:1] = grants[4:0];
	assign priority_reg__in_[0:0] = grants[5:5];
endmodule
module Encoder__in_nbits_6__out_nbits_3 (
	clk,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [5:0] in_;
	output reg [2:0] out;
	input wire [0:0] reset;
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : encode
		out = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < 3'd6; i = i + 1'd1)
				if (in_[sv2v_cast_3(i)])
					out = sv2v_cast_3(i);
		end
	end
endmodule
module Mux__da6d3ae684ad7806 (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [1193:0] in_;
	output reg [198:0] out;
	input wire [0:0] reset;
	input wire [2:0] sel;
	always @(*) begin : up_mux
		out = in_[(5 - sel) * 199+:199];
	end
endmodule
module SwitchUnitRTL__1084276829834de0 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [1193:0] recv__msg;
	output reg [5:0] recv__rdy;
	input wire [5:0] recv__val;
	output wire [198:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [2:0] __const__num_inports_at_up_get_en = 3'd6;
	wire [0:0] arbiter__clk;
	wire [0:0] arbiter__en;
	wire [5:0] arbiter__grants;
	wire [5:0] arbiter__reqs;
	wire [0:0] arbiter__reset;
	RoundRobinArbiterEn__nreqs_6 arbiter(
		.clk(arbiter__clk),
		.en(arbiter__en),
		.grants(arbiter__grants),
		.reqs(arbiter__reqs),
		.reset(arbiter__reset)
	);
	wire [0:0] encoder__clk;
	wire [5:0] encoder__in_;
	wire [2:0] encoder__out;
	wire [0:0] encoder__reset;
	Encoder__in_nbits_6__out_nbits_3 encoder(
		.clk(encoder__clk),
		.in_(encoder__in_),
		.out(encoder__out),
		.reset(encoder__reset)
	);
	wire [0:0] mux__clk;
	wire [1193:0] mux__in_;
	wire [198:0] mux__out;
	wire [0:0] mux__reset;
	wire [2:0] mux__sel;
	Mux__da6d3ae684ad7806 mux(
		.clk(mux__clk),
		.in_(mux__in_),
		.out(mux__out),
		.reset(mux__reset),
		.sel(mux__sel)
	);
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : up_get_en
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_up_get_en; i = i + 1'd1)
				recv__rdy[5 - sv2v_cast_3(i)+:1] = send__rdy & (mux__sel == sv2v_cast_3(i));
		end
	end
	always @(*) begin : up_send_val
		send__val = arbiter__grants > 6'd0;
	end
	assign arbiter__clk = clk;
	assign arbiter__reset = reset;
	assign arbiter__en = 1'd1;
	assign mux__clk = clk;
	assign mux__reset = reset;
	assign send__msg = mux__out;
	assign encoder__clk = clk;
	assign encoder__reset = reset;
	assign encoder__in_ = arbiter__grants;
	assign mux__sel = encoder__out;
	assign arbiter__reqs[0:0] = recv__val[5+:1];
	assign mux__in_[995+:199] = recv__msg[995+:199];
	assign arbiter__reqs[1:1] = recv__val[4+:1];
	assign mux__in_[796+:199] = recv__msg[796+:199];
	assign arbiter__reqs[2:2] = recv__val[3+:1];
	assign mux__in_[597+:199] = recv__msg[597+:199];
	assign arbiter__reqs[3:3] = recv__val[2+:1];
	assign mux__in_[398+:199] = recv__msg[398+:199];
	assign arbiter__reqs[4:4] = recv__val[1+:1];
	assign mux__in_[199+:199] = recv__msg[199+:199];
	assign arbiter__reqs[5:5] = recv__val[0+:1];
	assign mux__in_[0+:199] = recv__msg[0+:199];
endmodule
module RingRouterRTL__c342fe1d66581078 (
	clk,
	pos,
	reset,
	recv__en,
	recv__msg,
	recv__yum,
	send__en,
	send__msg,
	send__yum
);
	input wire [0:0] clk;
	input wire [2:0] pos;
	input wire [0:0] reset;
	input wire [2:0] recv__en;
	input wire [596:0] recv__msg;
	output wire [5:0] recv__yum;
	output wire [2:0] send__en;
	output wire [596:0] send__msg;
	input wire [5:0] send__yum;
	wire [0:0] input_units__clk [0:2];
	wire [0:0] input_units__reset [0:2];
	wire [0:0] input_units__recv__en [0:2];
	wire [198:0] input_units__recv__msg [0:2];
	wire [1:0] input_units__recv__yum [0:2];
	wire [397:0] input_units__send__msg [0:2];
	wire [1:0] input_units__send__rdy [0:2];
	wire [1:0] input_units__send__val [0:2];
	InputUnitCreditRTL__cee857d8d31bccfc input_units__0(
		.clk(input_units__clk[0]),
		.reset(input_units__reset[0]),
		.recv__en(input_units__recv__en[0]),
		.recv__msg(input_units__recv__msg[0]),
		.recv__yum(input_units__recv__yum[0]),
		.send__msg(input_units__send__msg[0]),
		.send__rdy(input_units__send__rdy[0]),
		.send__val(input_units__send__val[0])
	);
	InputUnitCreditRTL__cee857d8d31bccfc input_units__1(
		.clk(input_units__clk[1]),
		.reset(input_units__reset[1]),
		.recv__en(input_units__recv__en[1]),
		.recv__msg(input_units__recv__msg[1]),
		.recv__yum(input_units__recv__yum[1]),
		.send__msg(input_units__send__msg[1]),
		.send__rdy(input_units__send__rdy[1]),
		.send__val(input_units__send__val[1])
	);
	InputUnitCreditRTL__cee857d8d31bccfc input_units__2(
		.clk(input_units__clk[2]),
		.reset(input_units__reset[2]),
		.recv__en(input_units__recv__en[2]),
		.recv__msg(input_units__recv__msg[2]),
		.recv__yum(input_units__recv__yum[2]),
		.send__msg(input_units__send__msg[2]),
		.send__rdy(input_units__send__rdy[2]),
		.send__val(input_units__send__val[2])
	);
	wire [0:0] output_units__clk [0:2];
	wire [0:0] output_units__reset [0:2];
	wire [198:0] output_units__recv__msg [0:2];
	wire [0:0] output_units__recv__rdy [0:2];
	wire [0:0] output_units__recv__val [0:2];
	wire [0:0] output_units__send__en [0:2];
	wire [198:0] output_units__send__msg [0:2];
	wire [1:0] output_units__send__yum [0:2];
	OutputUnitCreditRTL__6d31c46182ddb0c6 output_units__0(
		.clk(output_units__clk[0]),
		.reset(output_units__reset[0]),
		.recv__msg(output_units__recv__msg[0]),
		.recv__rdy(output_units__recv__rdy[0]),
		.recv__val(output_units__recv__val[0]),
		.send__en(output_units__send__en[0]),
		.send__msg(output_units__send__msg[0]),
		.send__yum(output_units__send__yum[0])
	);
	OutputUnitCreditRTL__6d31c46182ddb0c6 output_units__1(
		.clk(output_units__clk[1]),
		.reset(output_units__reset[1]),
		.recv__msg(output_units__recv__msg[1]),
		.recv__rdy(output_units__recv__rdy[1]),
		.recv__val(output_units__recv__val[1]),
		.send__en(output_units__send__en[1]),
		.send__msg(output_units__send__msg[1]),
		.send__yum(output_units__send__yum[1])
	);
	OutputUnitCreditRTL__6d31c46182ddb0c6 output_units__2(
		.clk(output_units__clk[2]),
		.reset(output_units__reset[2]),
		.recv__msg(output_units__recv__msg[2]),
		.recv__rdy(output_units__recv__rdy[2]),
		.recv__val(output_units__recv__val[2]),
		.send__en(output_units__send__en[2]),
		.send__msg(output_units__send__msg[2]),
		.send__yum(output_units__send__yum[2])
	);
	wire [0:0] route_units__clk [0:5];
	wire [2:0] route_units__pos [0:5];
	wire [0:0] route_units__reset [0:5];
	wire [198:0] route_units__recv__msg [0:5];
	wire [0:0] route_units__recv__rdy [0:5];
	wire [0:0] route_units__recv__val [0:5];
	wire [596:0] route_units__send__msg [0:5];
	wire [2:0] route_units__send__rdy [0:5];
	wire [2:0] route_units__send__val [0:5];
	RingRouteUnitRTL__811433b6dff0599c route_units__0(
		.clk(route_units__clk[0]),
		.pos(route_units__pos[0]),
		.reset(route_units__reset[0]),
		.recv__msg(route_units__recv__msg[0]),
		.recv__rdy(route_units__recv__rdy[0]),
		.recv__val(route_units__recv__val[0]),
		.send__msg(route_units__send__msg[0]),
		.send__rdy(route_units__send__rdy[0]),
		.send__val(route_units__send__val[0])
	);
	RingRouteUnitRTL__811433b6dff0599c route_units__1(
		.clk(route_units__clk[1]),
		.pos(route_units__pos[1]),
		.reset(route_units__reset[1]),
		.recv__msg(route_units__recv__msg[1]),
		.recv__rdy(route_units__recv__rdy[1]),
		.recv__val(route_units__recv__val[1]),
		.send__msg(route_units__send__msg[1]),
		.send__rdy(route_units__send__rdy[1]),
		.send__val(route_units__send__val[1])
	);
	RingRouteUnitRTL__811433b6dff0599c route_units__2(
		.clk(route_units__clk[2]),
		.pos(route_units__pos[2]),
		.reset(route_units__reset[2]),
		.recv__msg(route_units__recv__msg[2]),
		.recv__rdy(route_units__recv__rdy[2]),
		.recv__val(route_units__recv__val[2]),
		.send__msg(route_units__send__msg[2]),
		.send__rdy(route_units__send__rdy[2]),
		.send__val(route_units__send__val[2])
	);
	RingRouteUnitRTL__811433b6dff0599c route_units__3(
		.clk(route_units__clk[3]),
		.pos(route_units__pos[3]),
		.reset(route_units__reset[3]),
		.recv__msg(route_units__recv__msg[3]),
		.recv__rdy(route_units__recv__rdy[3]),
		.recv__val(route_units__recv__val[3]),
		.send__msg(route_units__send__msg[3]),
		.send__rdy(route_units__send__rdy[3]),
		.send__val(route_units__send__val[3])
	);
	RingRouteUnitRTL__811433b6dff0599c route_units__4(
		.clk(route_units__clk[4]),
		.pos(route_units__pos[4]),
		.reset(route_units__reset[4]),
		.recv__msg(route_units__recv__msg[4]),
		.recv__rdy(route_units__recv__rdy[4]),
		.recv__val(route_units__recv__val[4]),
		.send__msg(route_units__send__msg[4]),
		.send__rdy(route_units__send__rdy[4]),
		.send__val(route_units__send__val[4])
	);
	RingRouteUnitRTL__811433b6dff0599c route_units__5(
		.clk(route_units__clk[5]),
		.pos(route_units__pos[5]),
		.reset(route_units__reset[5]),
		.recv__msg(route_units__recv__msg[5]),
		.recv__rdy(route_units__recv__rdy[5]),
		.recv__val(route_units__recv__val[5]),
		.send__msg(route_units__send__msg[5]),
		.send__rdy(route_units__send__rdy[5]),
		.send__val(route_units__send__val[5])
	);
	wire [0:0] switch_units__clk [0:2];
	wire [0:0] switch_units__reset [0:2];
	wire [1193:0] switch_units__recv__msg [0:2];
	wire [5:0] switch_units__recv__rdy [0:2];
	wire [5:0] switch_units__recv__val [0:2];
	wire [198:0] switch_units__send__msg [0:2];
	wire [0:0] switch_units__send__rdy [0:2];
	wire [0:0] switch_units__send__val [0:2];
	SwitchUnitRTL__1084276829834de0 switch_units__0(
		.clk(switch_units__clk[0]),
		.reset(switch_units__reset[0]),
		.recv__msg(switch_units__recv__msg[0]),
		.recv__rdy(switch_units__recv__rdy[0]),
		.recv__val(switch_units__recv__val[0]),
		.send__msg(switch_units__send__msg[0]),
		.send__rdy(switch_units__send__rdy[0]),
		.send__val(switch_units__send__val[0])
	);
	SwitchUnitRTL__1084276829834de0 switch_units__1(
		.clk(switch_units__clk[1]),
		.reset(switch_units__reset[1]),
		.recv__msg(switch_units__recv__msg[1]),
		.recv__rdy(switch_units__recv__rdy[1]),
		.recv__val(switch_units__recv__val[1]),
		.send__msg(switch_units__send__msg[1]),
		.send__rdy(switch_units__send__rdy[1]),
		.send__val(switch_units__send__val[1])
	);
	SwitchUnitRTL__1084276829834de0 switch_units__2(
		.clk(switch_units__clk[2]),
		.reset(switch_units__reset[2]),
		.recv__msg(switch_units__recv__msg[2]),
		.recv__rdy(switch_units__recv__rdy[2]),
		.recv__val(switch_units__recv__val[2]),
		.send__msg(switch_units__send__msg[2]),
		.send__rdy(switch_units__send__rdy[2]),
		.send__val(switch_units__send__val[2])
	);
	assign input_units__clk[0] = clk;
	assign input_units__reset[0] = reset;
	assign input_units__clk[1] = clk;
	assign input_units__reset[1] = reset;
	assign input_units__clk[2] = clk;
	assign input_units__reset[2] = reset;
	assign route_units__clk[0] = clk;
	assign route_units__reset[0] = reset;
	assign route_units__clk[1] = clk;
	assign route_units__reset[1] = reset;
	assign route_units__clk[2] = clk;
	assign route_units__reset[2] = reset;
	assign route_units__clk[3] = clk;
	assign route_units__reset[3] = reset;
	assign route_units__clk[4] = clk;
	assign route_units__reset[4] = reset;
	assign route_units__clk[5] = clk;
	assign route_units__reset[5] = reset;
	assign switch_units__clk[0] = clk;
	assign switch_units__reset[0] = reset;
	assign switch_units__clk[1] = clk;
	assign switch_units__reset[1] = reset;
	assign switch_units__clk[2] = clk;
	assign switch_units__reset[2] = reset;
	assign output_units__clk[0] = clk;
	assign output_units__reset[0] = reset;
	assign output_units__clk[1] = clk;
	assign output_units__reset[1] = reset;
	assign output_units__clk[2] = clk;
	assign output_units__reset[2] = reset;
	assign input_units__recv__en[0] = recv__en[2+:1];
	assign input_units__recv__msg[0] = recv__msg[398+:199];
	assign recv__yum[5+:1] = input_units__recv__yum[0][1+:1];
	assign recv__yum[4+:1] = input_units__recv__yum[0][0+:1];
	assign route_units__recv__msg[0] = input_units__send__msg[0][199+:199];
	assign input_units__send__rdy[0][1+:1] = route_units__recv__rdy[0];
	assign route_units__recv__val[0] = input_units__send__val[0][1+:1];
	assign route_units__pos[0] = pos;
	assign route_units__recv__msg[1] = input_units__send__msg[0][0+:199];
	assign input_units__send__rdy[0][0+:1] = route_units__recv__rdy[1];
	assign route_units__recv__val[1] = input_units__send__val[0][0+:1];
	assign route_units__pos[1] = pos;
	assign input_units__recv__en[1] = recv__en[1+:1];
	assign input_units__recv__msg[1] = recv__msg[199+:199];
	assign recv__yum[3+:1] = input_units__recv__yum[1][1+:1];
	assign recv__yum[2+:1] = input_units__recv__yum[1][0+:1];
	assign route_units__recv__msg[2] = input_units__send__msg[1][199+:199];
	assign input_units__send__rdy[1][1+:1] = route_units__recv__rdy[2];
	assign route_units__recv__val[2] = input_units__send__val[1][1+:1];
	assign route_units__pos[2] = pos;
	assign route_units__recv__msg[3] = input_units__send__msg[1][0+:199];
	assign input_units__send__rdy[1][0+:1] = route_units__recv__rdy[3];
	assign route_units__recv__val[3] = input_units__send__val[1][0+:1];
	assign route_units__pos[3] = pos;
	assign input_units__recv__en[2] = recv__en[0+:1];
	assign input_units__recv__msg[2] = recv__msg[0+:199];
	assign recv__yum[1+:1] = input_units__recv__yum[2][1+:1];
	assign recv__yum[0+:1] = input_units__recv__yum[2][0+:1];
	assign route_units__recv__msg[4] = input_units__send__msg[2][199+:199];
	assign input_units__send__rdy[2][1+:1] = route_units__recv__rdy[4];
	assign route_units__recv__val[4] = input_units__send__val[2][1+:1];
	assign route_units__pos[4] = pos;
	assign route_units__recv__msg[5] = input_units__send__msg[2][0+:199];
	assign input_units__send__rdy[2][0+:1] = route_units__recv__rdy[5];
	assign route_units__recv__val[5] = input_units__send__val[2][0+:1];
	assign route_units__pos[5] = pos;
	assign switch_units__recv__msg[0][995+:199] = route_units__send__msg[0][398+:199];
	assign route_units__send__rdy[0][2+:1] = switch_units__recv__rdy[0][5+:1];
	assign switch_units__recv__val[0][5+:1] = route_units__send__val[0][2+:1];
	assign switch_units__recv__msg[1][995+:199] = route_units__send__msg[0][199+:199];
	assign route_units__send__rdy[0][1+:1] = switch_units__recv__rdy[1][5+:1];
	assign switch_units__recv__val[1][5+:1] = route_units__send__val[0][1+:1];
	assign switch_units__recv__msg[2][995+:199] = route_units__send__msg[0][0+:199];
	assign route_units__send__rdy[0][0+:1] = switch_units__recv__rdy[2][5+:1];
	assign switch_units__recv__val[2][5+:1] = route_units__send__val[0][0+:1];
	assign switch_units__recv__msg[0][796+:199] = route_units__send__msg[1][398+:199];
	assign route_units__send__rdy[1][2+:1] = switch_units__recv__rdy[0][4+:1];
	assign switch_units__recv__val[0][4+:1] = route_units__send__val[1][2+:1];
	assign switch_units__recv__msg[1][796+:199] = route_units__send__msg[1][199+:199];
	assign route_units__send__rdy[1][1+:1] = switch_units__recv__rdy[1][4+:1];
	assign switch_units__recv__val[1][4+:1] = route_units__send__val[1][1+:1];
	assign switch_units__recv__msg[2][796+:199] = route_units__send__msg[1][0+:199];
	assign route_units__send__rdy[1][0+:1] = switch_units__recv__rdy[2][4+:1];
	assign switch_units__recv__val[2][4+:1] = route_units__send__val[1][0+:1];
	assign switch_units__recv__msg[0][597+:199] = route_units__send__msg[2][398+:199];
	assign route_units__send__rdy[2][2+:1] = switch_units__recv__rdy[0][3+:1];
	assign switch_units__recv__val[0][3+:1] = route_units__send__val[2][2+:1];
	assign switch_units__recv__msg[1][597+:199] = route_units__send__msg[2][199+:199];
	assign route_units__send__rdy[2][1+:1] = switch_units__recv__rdy[1][3+:1];
	assign switch_units__recv__val[1][3+:1] = route_units__send__val[2][1+:1];
	assign switch_units__recv__msg[2][597+:199] = route_units__send__msg[2][0+:199];
	assign route_units__send__rdy[2][0+:1] = switch_units__recv__rdy[2][3+:1];
	assign switch_units__recv__val[2][3+:1] = route_units__send__val[2][0+:1];
	assign switch_units__recv__msg[0][398+:199] = route_units__send__msg[3][398+:199];
	assign route_units__send__rdy[3][2+:1] = switch_units__recv__rdy[0][2+:1];
	assign switch_units__recv__val[0][2+:1] = route_units__send__val[3][2+:1];
	assign switch_units__recv__msg[1][398+:199] = route_units__send__msg[3][199+:199];
	assign route_units__send__rdy[3][1+:1] = switch_units__recv__rdy[1][2+:1];
	assign switch_units__recv__val[1][2+:1] = route_units__send__val[3][1+:1];
	assign switch_units__recv__msg[2][398+:199] = route_units__send__msg[3][0+:199];
	assign route_units__send__rdy[3][0+:1] = switch_units__recv__rdy[2][2+:1];
	assign switch_units__recv__val[2][2+:1] = route_units__send__val[3][0+:1];
	assign switch_units__recv__msg[0][199+:199] = route_units__send__msg[4][398+:199];
	assign route_units__send__rdy[4][2+:1] = switch_units__recv__rdy[0][1+:1];
	assign switch_units__recv__val[0][1+:1] = route_units__send__val[4][2+:1];
	assign switch_units__recv__msg[1][199+:199] = route_units__send__msg[4][199+:199];
	assign route_units__send__rdy[4][1+:1] = switch_units__recv__rdy[1][1+:1];
	assign switch_units__recv__val[1][1+:1] = route_units__send__val[4][1+:1];
	assign switch_units__recv__msg[2][199+:199] = route_units__send__msg[4][0+:199];
	assign route_units__send__rdy[4][0+:1] = switch_units__recv__rdy[2][1+:1];
	assign switch_units__recv__val[2][1+:1] = route_units__send__val[4][0+:1];
	assign switch_units__recv__msg[0][0+:199] = route_units__send__msg[5][398+:199];
	assign route_units__send__rdy[5][2+:1] = switch_units__recv__rdy[0][0+:1];
	assign switch_units__recv__val[0][0+:1] = route_units__send__val[5][2+:1];
	assign switch_units__recv__msg[1][0+:199] = route_units__send__msg[5][199+:199];
	assign route_units__send__rdy[5][1+:1] = switch_units__recv__rdy[1][0+:1];
	assign switch_units__recv__val[1][0+:1] = route_units__send__val[5][1+:1];
	assign switch_units__recv__msg[2][0+:199] = route_units__send__msg[5][0+:199];
	assign route_units__send__rdy[5][0+:1] = switch_units__recv__rdy[2][0+:1];
	assign switch_units__recv__val[2][0+:1] = route_units__send__val[5][0+:1];
	assign output_units__recv__msg[0] = switch_units__send__msg[0];
	assign switch_units__send__rdy[0] = output_units__recv__rdy[0];
	assign output_units__recv__val[0] = switch_units__send__val[0];
	assign send__en[2+:1] = output_units__send__en[0];
	assign send__msg[398+:199] = output_units__send__msg[0];
	assign output_units__send__yum[0][1+:1] = send__yum[5+:1];
	assign output_units__send__yum[0][0+:1] = send__yum[4+:1];
	assign output_units__recv__msg[1] = switch_units__send__msg[1];
	assign switch_units__send__rdy[1] = output_units__recv__rdy[1];
	assign output_units__recv__val[1] = switch_units__send__val[1];
	assign send__en[1+:1] = output_units__send__en[1];
	assign send__msg[199+:199] = output_units__send__msg[1];
	assign output_units__send__yum[1][1+:1] = send__yum[3+:1];
	assign output_units__send__yum[1][0+:1] = send__yum[2+:1];
	assign output_units__recv__msg[2] = switch_units__send__msg[2];
	assign switch_units__send__rdy[2] = output_units__recv__rdy[2];
	assign output_units__recv__val[2] = switch_units__send__val[2];
	assign send__en[0+:1] = output_units__send__en[2];
	assign send__msg[0+:199] = output_units__send__msg[2];
	assign output_units__send__yum[2][1+:1] = send__yum[1+:1];
	assign output_units__send__yum[2][0+:1] = send__yum[0+:1];
endmodule
module RegEnRst__Type_Bits2__reset_value_1 (
	clk,
	en,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	input wire [1:0] in_;
	output reg [1:0] out;
	input wire [0:0] reset;
	localparam [0:0] __const__reset_value_at_up_regenrst = 1'd1;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(posedge clk) begin : up_regenrst
		if (reset)
			out <= sv2v_cast_2(__const__reset_value_at_up_regenrst);
		else if (en)
			out <= in_;
	end
endmodule
module RoundRobinArbiterEn__nreqs_2 (
	clk,
	en,
	grants,
	reqs,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	output reg [1:0] grants;
	input wire [1:0] reqs;
	input wire [0:0] reset;
	localparam [1:0] __const__nreqs_at_comb_reqs_int = 2'd2;
	localparam [2:0] __const__nreqsX2_at_comb_reqs_int = 3'd4;
	localparam [1:0] __const__nreqs_at_comb_grants = 2'd2;
	localparam [1:0] __const__nreqs_at_comb_priority_int = 2'd2;
	localparam [2:0] __const__nreqsX2_at_comb_priority_int = 3'd4;
	localparam [2:0] __const__nreqsX2_at_comb_kills = 3'd4;
	localparam [2:0] __const__nreqsX2_at_comb_grants_int = 3'd4;
	reg [3:0] grants_int;
	reg [4:0] kills;
	reg [0:0] priority_en;
	reg [3:0] priority_int;
	reg [3:0] reqs_int;
	wire [0:0] priority_reg__clk;
	wire [0:0] priority_reg__en;
	wire [1:0] priority_reg__in_;
	wire [1:0] priority_reg__out;
	wire [0:0] priority_reg__reset;
	RegEnRst__Type_Bits2__reset_value_1 priority_reg(
		.clk(priority_reg__clk),
		.en(priority_reg__en),
		.in_(priority_reg__in_),
		.out(priority_reg__out),
		.reset(priority_reg__reset)
	);
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : comb_grants
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqs_at_comb_grants; i = i + 1'd1)
				grants[sv2v_cast_1(i)] = grants_int[sv2v_cast_2(i)] | grants_int[__const__nreqs_at_comb_grants + sv2v_cast_2(i)];
		end
	end
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : comb_grants_int
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_grants_int; i = i + 1'd1)
				if (priority_int[sv2v_cast_2(i)])
					grants_int[sv2v_cast_2(i)] = reqs_int[sv2v_cast_2(i)];
				else
					grants_int[sv2v_cast_2(i)] = ~kills[sv2v_cast_3(i)] & reqs_int[sv2v_cast_2(i)];
		end
	end
	always @(*) begin : comb_kills
		kills[3'd0] = 1'd1;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_kills; i = i + 1'd1)
				if (priority_int[sv2v_cast_2(i)])
					kills[sv2v_cast_3(i) + 3'd1] = reqs_int[sv2v_cast_2(i)];
				else
					kills[sv2v_cast_3(i) + 3'd1] = kills[sv2v_cast_3(i)] | (~kills[sv2v_cast_3(i)] & reqs_int[sv2v_cast_2(i)]);
		end
	end
	always @(*) begin : comb_priority_en
		priority_en = (grants != 2'd0) & en;
	end
	always @(*) begin : comb_priority_int
		priority_int[2'd1:2'd0] = priority_reg__out;
		priority_int[2'd3:__const__nreqs_at_comb_priority_int] = 2'd0;
	end
	always @(*) begin : comb_reqs_int
		reqs_int[2'd1:2'd0] = reqs;
		reqs_int[2'd3:__const__nreqs_at_comb_reqs_int] = reqs;
	end
	assign priority_reg__clk = clk;
	assign priority_reg__reset = reset;
	assign priority_reg__en = priority_en;
	assign priority_reg__in_[1:1] = grants[0:0];
	assign priority_reg__in_[0:0] = grants[1:1];
endmodule
module BypassQueueCtrlRTL__num_entries_2 (
	clk,
	count,
	mux_sel,
	raddr,
	recv_rdy,
	recv_val,
	reset,
	send_rdy,
	send_val,
	waddr,
	wen
);
	input wire [0:0] clk;
	output reg [1:0] count;
	output reg [0:0] mux_sel;
	output wire [0:0] raddr;
	output reg [0:0] recv_rdy;
	input wire [0:0] recv_val;
	input wire [0:0] reset;
	input wire [0:0] send_rdy;
	output reg [0:0] send_val;
	output wire [0:0] waddr;
	output wire [0:0] wen;
	localparam [1:0] __const__num_entries_at__lambda__s_dut_ctrl_ring_send_adp_0__buffers_0__ctrl_recv_rdy = 2'd2;
	localparam [1:0] __const__num_entries_at_up_reg = 2'd2;
	reg [0:0] head;
	reg [0:0] recv_xfer;
	reg [0:0] send_xfer;
	reg [0:0] tail;
	always @(*) begin : _lambda__s_dut_ctrl_ring_send_adp_0__buffers_0__ctrl_mux_sel
		mux_sel = count == 2'd0;
	end
	always @(*) begin : _lambda__s_dut_ctrl_ring_send_adp_0__buffers_0__ctrl_recv_rdy
		recv_rdy = count < __const__num_entries_at__lambda__s_dut_ctrl_ring_send_adp_0__buffers_0__ctrl_recv_rdy;
	end
	always @(*) begin : _lambda__s_dut_ctrl_ring_send_adp_0__buffers_0__ctrl_recv_xfer
		recv_xfer = recv_val & recv_rdy;
	end
	always @(*) begin : _lambda__s_dut_ctrl_ring_send_adp_0__buffers_0__ctrl_send_val
		send_val = (count > 2'd0) | recv_val;
	end
	always @(*) begin : _lambda__s_dut_ctrl_ring_send_adp_0__buffers_0__ctrl_send_xfer
		send_xfer = send_val & send_rdy;
	end
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(posedge clk) begin : up_reg
		if (reset) begin
			head <= 1'd0;
			tail <= 1'd0;
			count <= 2'd0;
		end
		else begin
			if (recv_xfer)
				tail <= (tail < (sv2v_cast_1(__const__num_entries_at_up_reg) - 1'd1) ? tail + 1'd1 : 1'd0);
			if (send_xfer)
				head <= (head < (sv2v_cast_1(__const__num_entries_at_up_reg) - 1'd1) ? head + 1'd1 : 1'd0);
			if (recv_xfer & ~send_xfer)
				count <= count + 2'd1;
			if (~recv_xfer & send_xfer)
				count <= count - 2'd1;
		end
	end
	assign wen = recv_xfer;
	assign waddr = tail;
	assign raddr = head;
endmodule
module Mux__e74309b8c051af19 (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [397:0] in_;
	output reg [198:0] out;
	input wire [0:0] reset;
	input wire [0:0] sel;
	always @(*) begin : up_mux
		out = in_[(1 - sel) * 199+:199];
	end
endmodule
module BypassQueueDpathRTL__81615e1e2a6a0781 (
	clk,
	mux_sel,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] mux_sel;
	input wire [0:0] raddr;
	input wire [198:0] recv_msg;
	input wire [0:0] reset;
	output wire [198:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] mux__clk;
	wire [397:0] mux__in_;
	wire [198:0] mux__out;
	wire [0:0] mux__reset;
	wire [0:0] mux__sel;
	Mux__e74309b8c051af19 mux(
		.clk(mux__clk),
		.in_(mux__in_),
		.out(mux__out),
		.reset(mux__reset),
		.sel(mux__sel)
	);
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [198:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [198:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__3b3c54e4f90e121d rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:199] = recv_msg;
	assign mux__clk = clk;
	assign mux__reset = reset;
	assign mux__sel = mux_sel;
	assign mux__in_[199+:199] = rf__rdata[0+:199];
	assign mux__in_[0+:199] = recv_msg;
	assign send_msg = mux__out;
endmodule
module BypassQueueRTL__81615e1e2a6a0781 (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [198:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [198:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__mux_sel;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	BypassQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.mux_sel(ctrl__mux_sel),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__mux_sel;
	wire [0:0] dpath__raddr;
	wire [198:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [198:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	BypassQueueDpathRTL__81615e1e2a6a0781 dpath(
		.clk(dpath__clk),
		.mux_sel(dpath__mux_sel),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign dpath__mux_sel = ctrl__mux_sel;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign count = ctrl__count;
	assign dpath__recv_msg = recv__msg;
	assign send__msg = dpath__send_msg;
endmodule
module Encoder__in_nbits_2__out_nbits_1 (
	clk,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [1:0] in_;
	output reg [0:0] out;
	input wire [0:0] reset;
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : encode
		out = 1'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < 2'd2; i = i + 1'd1)
				if (in_[sv2v_cast_1(i)])
					out = sv2v_cast_1(i);
		end
	end
endmodule
module CreditRecvRTL2SendRTL__8f5183a92c9ca658 (
	clk,
	reset,
	recv__en,
	recv__msg,
	recv__yum,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [0:0] recv__en;
	input wire [198:0] recv__msg;
	output reg [1:0] recv__yum;
	output reg [198:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [1:0] __const__vc_at_up_enq = 2'd2;
	localparam [1:0] __const__vc_at_up_deq_and_send = 2'd2;
	localparam [1:0] __const__vc_at_up_yummy = 2'd2;
	wire [0:0] arbiter__clk;
	wire [0:0] arbiter__en;
	wire [1:0] arbiter__grants;
	wire [1:0] arbiter__reqs;
	wire [0:0] arbiter__reset;
	RoundRobinArbiterEn__nreqs_2 arbiter(
		.clk(arbiter__clk),
		.en(arbiter__en),
		.grants(arbiter__grants),
		.reqs(arbiter__reqs),
		.reset(arbiter__reset)
	);
	wire [0:0] buffers__clk [0:1];
	wire [1:0] buffers__count [0:1];
	wire [0:0] buffers__reset [0:1];
	wire [198:0] buffers__recv__msg [0:1];
	wire [0:0] buffers__recv__rdy [0:1];
	reg [0:0] buffers__recv__val [0:1];
	wire [198:0] buffers__send__msg [0:1];
	reg [0:0] buffers__send__rdy [0:1];
	wire [0:0] buffers__send__val [0:1];
	BypassQueueRTL__81615e1e2a6a0781 buffers__0(
		.clk(buffers__clk[0]),
		.count(buffers__count[0]),
		.reset(buffers__reset[0]),
		.recv__msg(buffers__recv__msg[0]),
		.recv__rdy(buffers__recv__rdy[0]),
		.recv__val(buffers__recv__val[0]),
		.send__msg(buffers__send__msg[0]),
		.send__rdy(buffers__send__rdy[0]),
		.send__val(buffers__send__val[0])
	);
	BypassQueueRTL__81615e1e2a6a0781 buffers__1(
		.clk(buffers__clk[1]),
		.count(buffers__count[1]),
		.reset(buffers__reset[1]),
		.recv__msg(buffers__recv__msg[1]),
		.recv__rdy(buffers__recv__rdy[1]),
		.recv__val(buffers__recv__val[1]),
		.send__msg(buffers__send__msg[1]),
		.send__rdy(buffers__send__rdy[1]),
		.send__val(buffers__send__val[1])
	);
	wire [0:0] encoder__clk;
	wire [1:0] encoder__in_;
	wire [0:0] encoder__out;
	wire [0:0] encoder__reset;
	Encoder__in_nbits_2__out_nbits_1 encoder(
		.clk(encoder__clk),
		.in_(encoder__in_),
		.out(encoder__out),
		.reset(encoder__reset)
	);
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_deq_and_send
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_deq_and_send; i = i + 1'd1)
				buffers__send__rdy[sv2v_cast_1(i)] = 1'd0;
		end
		send__msg = buffers__send__msg[encoder__out];
		if (arbiter__grants > 2'd0) begin
			send__val = 1'd1;
			buffers__send__rdy[encoder__out] = send__rdy;
		end
		else
			send__val = 1'd0;
	end
	always @(*) begin : up_enq
		if (recv__en) begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_enq; i = i + 1'd1)
				buffers__recv__val[sv2v_cast_1(i)] = recv__msg[174] == sv2v_cast_1(i);
		end
		else begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_enq; i = i + 1'd1)
				buffers__recv__val[sv2v_cast_1(i)] = 1'd0;
		end
	end
	always @(*) begin : up_yummy
		begin : sv2v_autoblock_4
			reg [31:0] i;
			for (i = 1'd0; i < __const__vc_at_up_yummy; i = i + 1'd1)
				recv__yum[1 - sv2v_cast_1(i)+:1] = buffers__send__val[sv2v_cast_1(i)] & buffers__send__rdy[sv2v_cast_1(i)];
		end
	end
	assign buffers__clk[0] = clk;
	assign buffers__reset[0] = reset;
	assign buffers__clk[1] = clk;
	assign buffers__reset[1] = reset;
	assign arbiter__clk = clk;
	assign arbiter__reset = reset;
	assign encoder__clk = clk;
	assign encoder__reset = reset;
	assign buffers__recv__msg[0] = recv__msg;
	assign arbiter__reqs[0:0] = buffers__send__val[0];
	assign buffers__recv__msg[1] = recv__msg;
	assign arbiter__reqs[1:1] = buffers__send__val[1];
	assign encoder__in_ = arbiter__grants;
	assign arbiter__en = send__val;
endmodule
module RingNetworkRTL__ea2a16af74aa57fe (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [994:0] recv__msg;
	output wire [4:0] recv__rdy;
	input wire [4:0] recv__val;
	output wire [994:0] send__msg;
	input wire [4:0] send__rdy;
	output wire [4:0] send__val;
	wire [0:0] recv_adp__clk [0:4];
	wire [0:0] recv_adp__reset [0:4];
	wire [198:0] recv_adp__recv__msg [0:4];
	wire [0:0] recv_adp__recv__rdy [0:4];
	wire [0:0] recv_adp__recv__val [0:4];
	wire [0:0] recv_adp__send__en [0:4];
	wire [198:0] recv_adp__send__msg [0:4];
	wire [1:0] recv_adp__send__yum [0:4];
	RecvRTL2CreditSendRTL__6d31c46182ddb0c6 recv_adp__0(
		.clk(recv_adp__clk[0]),
		.reset(recv_adp__reset[0]),
		.recv__msg(recv_adp__recv__msg[0]),
		.recv__rdy(recv_adp__recv__rdy[0]),
		.recv__val(recv_adp__recv__val[0]),
		.send__en(recv_adp__send__en[0]),
		.send__msg(recv_adp__send__msg[0]),
		.send__yum(recv_adp__send__yum[0])
	);
	RecvRTL2CreditSendRTL__6d31c46182ddb0c6 recv_adp__1(
		.clk(recv_adp__clk[1]),
		.reset(recv_adp__reset[1]),
		.recv__msg(recv_adp__recv__msg[1]),
		.recv__rdy(recv_adp__recv__rdy[1]),
		.recv__val(recv_adp__recv__val[1]),
		.send__en(recv_adp__send__en[1]),
		.send__msg(recv_adp__send__msg[1]),
		.send__yum(recv_adp__send__yum[1])
	);
	RecvRTL2CreditSendRTL__6d31c46182ddb0c6 recv_adp__2(
		.clk(recv_adp__clk[2]),
		.reset(recv_adp__reset[2]),
		.recv__msg(recv_adp__recv__msg[2]),
		.recv__rdy(recv_adp__recv__rdy[2]),
		.recv__val(recv_adp__recv__val[2]),
		.send__en(recv_adp__send__en[2]),
		.send__msg(recv_adp__send__msg[2]),
		.send__yum(recv_adp__send__yum[2])
	);
	RecvRTL2CreditSendRTL__6d31c46182ddb0c6 recv_adp__3(
		.clk(recv_adp__clk[3]),
		.reset(recv_adp__reset[3]),
		.recv__msg(recv_adp__recv__msg[3]),
		.recv__rdy(recv_adp__recv__rdy[3]),
		.recv__val(recv_adp__recv__val[3]),
		.send__en(recv_adp__send__en[3]),
		.send__msg(recv_adp__send__msg[3]),
		.send__yum(recv_adp__send__yum[3])
	);
	RecvRTL2CreditSendRTL__6d31c46182ddb0c6 recv_adp__4(
		.clk(recv_adp__clk[4]),
		.reset(recv_adp__reset[4]),
		.recv__msg(recv_adp__recv__msg[4]),
		.recv__rdy(recv_adp__recv__rdy[4]),
		.recv__val(recv_adp__recv__val[4]),
		.send__en(recv_adp__send__en[4]),
		.send__msg(recv_adp__send__msg[4]),
		.send__yum(recv_adp__send__yum[4])
	);
	wire [0:0] routers__clk [0:4];
	reg [2:0] routers__pos [0:4];
	wire [0:0] routers__reset [0:4];
	wire [2:0] routers__recv__en [0:4];
	wire [596:0] routers__recv__msg [0:4];
	wire [5:0] routers__recv__yum [0:4];
	wire [2:0] routers__send__en [0:4];
	wire [596:0] routers__send__msg [0:4];
	wire [5:0] routers__send__yum [0:4];
	RingRouterRTL__c342fe1d66581078 routers__0(
		.clk(routers__clk[0]),
		.pos(routers__pos[0]),
		.reset(routers__reset[0]),
		.recv__en(routers__recv__en[0]),
		.recv__msg(routers__recv__msg[0]),
		.recv__yum(routers__recv__yum[0]),
		.send__en(routers__send__en[0]),
		.send__msg(routers__send__msg[0]),
		.send__yum(routers__send__yum[0])
	);
	RingRouterRTL__c342fe1d66581078 routers__1(
		.clk(routers__clk[1]),
		.pos(routers__pos[1]),
		.reset(routers__reset[1]),
		.recv__en(routers__recv__en[1]),
		.recv__msg(routers__recv__msg[1]),
		.recv__yum(routers__recv__yum[1]),
		.send__en(routers__send__en[1]),
		.send__msg(routers__send__msg[1]),
		.send__yum(routers__send__yum[1])
	);
	RingRouterRTL__c342fe1d66581078 routers__2(
		.clk(routers__clk[2]),
		.pos(routers__pos[2]),
		.reset(routers__reset[2]),
		.recv__en(routers__recv__en[2]),
		.recv__msg(routers__recv__msg[2]),
		.recv__yum(routers__recv__yum[2]),
		.send__en(routers__send__en[2]),
		.send__msg(routers__send__msg[2]),
		.send__yum(routers__send__yum[2])
	);
	RingRouterRTL__c342fe1d66581078 routers__3(
		.clk(routers__clk[3]),
		.pos(routers__pos[3]),
		.reset(routers__reset[3]),
		.recv__en(routers__recv__en[3]),
		.recv__msg(routers__recv__msg[3]),
		.recv__yum(routers__recv__yum[3]),
		.send__en(routers__send__en[3]),
		.send__msg(routers__send__msg[3]),
		.send__yum(routers__send__yum[3])
	);
	RingRouterRTL__c342fe1d66581078 routers__4(
		.clk(routers__clk[4]),
		.pos(routers__pos[4]),
		.reset(routers__reset[4]),
		.recv__en(routers__recv__en[4]),
		.recv__msg(routers__recv__msg[4]),
		.recv__yum(routers__recv__yum[4]),
		.send__en(routers__send__en[4]),
		.send__msg(routers__send__msg[4]),
		.send__yum(routers__send__yum[4])
	);
	wire [0:0] send_adp__clk [0:4];
	wire [0:0] send_adp__reset [0:4];
	wire [0:0] send_adp__recv__en [0:4];
	wire [198:0] send_adp__recv__msg [0:4];
	wire [1:0] send_adp__recv__yum [0:4];
	wire [198:0] send_adp__send__msg [0:4];
	wire [0:0] send_adp__send__rdy [0:4];
	wire [0:0] send_adp__send__val [0:4];
	CreditRecvRTL2SendRTL__8f5183a92c9ca658 send_adp__0(
		.clk(send_adp__clk[0]),
		.reset(send_adp__reset[0]),
		.recv__en(send_adp__recv__en[0]),
		.recv__msg(send_adp__recv__msg[0]),
		.recv__yum(send_adp__recv__yum[0]),
		.send__msg(send_adp__send__msg[0]),
		.send__rdy(send_adp__send__rdy[0]),
		.send__val(send_adp__send__val[0])
	);
	CreditRecvRTL2SendRTL__8f5183a92c9ca658 send_adp__1(
		.clk(send_adp__clk[1]),
		.reset(send_adp__reset[1]),
		.recv__en(send_adp__recv__en[1]),
		.recv__msg(send_adp__recv__msg[1]),
		.recv__yum(send_adp__recv__yum[1]),
		.send__msg(send_adp__send__msg[1]),
		.send__rdy(send_adp__send__rdy[1]),
		.send__val(send_adp__send__val[1])
	);
	CreditRecvRTL2SendRTL__8f5183a92c9ca658 send_adp__2(
		.clk(send_adp__clk[2]),
		.reset(send_adp__reset[2]),
		.recv__en(send_adp__recv__en[2]),
		.recv__msg(send_adp__recv__msg[2]),
		.recv__yum(send_adp__recv__yum[2]),
		.send__msg(send_adp__send__msg[2]),
		.send__rdy(send_adp__send__rdy[2]),
		.send__val(send_adp__send__val[2])
	);
	CreditRecvRTL2SendRTL__8f5183a92c9ca658 send_adp__3(
		.clk(send_adp__clk[3]),
		.reset(send_adp__reset[3]),
		.recv__en(send_adp__recv__en[3]),
		.recv__msg(send_adp__recv__msg[3]),
		.recv__yum(send_adp__recv__yum[3]),
		.send__msg(send_adp__send__msg[3]),
		.send__rdy(send_adp__send__rdy[3]),
		.send__val(send_adp__send__val[3])
	);
	CreditRecvRTL2SendRTL__8f5183a92c9ca658 send_adp__4(
		.clk(send_adp__clk[4]),
		.reset(send_adp__reset[4]),
		.recv__en(send_adp__recv__en[4]),
		.recv__msg(send_adp__recv__msg[4]),
		.recv__yum(send_adp__recv__yum[4]),
		.send__msg(send_adp__send__msg[4]),
		.send__rdy(send_adp__send__rdy[4]),
		.send__val(send_adp__send__val[4])
	);
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : up_pos
		begin : sv2v_autoblock_1
			reg [31:0] r;
			for (r = 1'd0; r < 3'd5; r = r + 1'd1)
				routers__pos[sv2v_cast_3(r)] = sv2v_cast_3(r);
		end
	end
	assign routers__clk[0] = clk;
	assign routers__reset[0] = reset;
	assign routers__clk[1] = clk;
	assign routers__reset[1] = reset;
	assign routers__clk[2] = clk;
	assign routers__reset[2] = reset;
	assign routers__clk[3] = clk;
	assign routers__reset[3] = reset;
	assign routers__clk[4] = clk;
	assign routers__reset[4] = reset;
	assign recv_adp__clk[0] = clk;
	assign recv_adp__reset[0] = reset;
	assign recv_adp__clk[1] = clk;
	assign recv_adp__reset[1] = reset;
	assign recv_adp__clk[2] = clk;
	assign recv_adp__reset[2] = reset;
	assign recv_adp__clk[3] = clk;
	assign recv_adp__reset[3] = reset;
	assign recv_adp__clk[4] = clk;
	assign recv_adp__reset[4] = reset;
	assign send_adp__clk[0] = clk;
	assign send_adp__reset[0] = reset;
	assign send_adp__clk[1] = clk;
	assign send_adp__reset[1] = reset;
	assign send_adp__clk[2] = clk;
	assign send_adp__reset[2] = reset;
	assign send_adp__clk[3] = clk;
	assign send_adp__reset[3] = reset;
	assign send_adp__clk[4] = clk;
	assign send_adp__reset[4] = reset;
	assign routers__recv__en[1][2+:1] = routers__send__en[0][1+:1];
	assign routers__recv__msg[1][398+:199] = routers__send__msg[0][199+:199];
	assign routers__send__yum[0][3+:1] = routers__recv__yum[1][5+:1];
	assign routers__send__yum[0][2+:1] = routers__recv__yum[1][4+:1];
	assign routers__recv__en[0][1+:1] = routers__send__en[1][2+:1];
	assign routers__recv__msg[0][199+:199] = routers__send__msg[1][398+:199];
	assign routers__send__yum[1][5+:1] = routers__recv__yum[0][3+:1];
	assign routers__send__yum[1][4+:1] = routers__recv__yum[0][2+:1];
	assign recv_adp__recv__msg[0] = recv__msg[796+:199];
	assign recv__rdy[4+:1] = recv_adp__recv__rdy[0];
	assign recv_adp__recv__val[0] = recv__val[4+:1];
	assign routers__recv__en[0][0+:1] = recv_adp__send__en[0];
	assign routers__recv__msg[0][0+:199] = recv_adp__send__msg[0];
	assign recv_adp__send__yum[0][1+:1] = routers__recv__yum[0][1+:1];
	assign recv_adp__send__yum[0][0+:1] = routers__recv__yum[0][0+:1];
	assign send_adp__recv__en[0] = routers__send__en[0][0+:1];
	assign send_adp__recv__msg[0] = routers__send__msg[0][0+:199];
	assign routers__send__yum[0][1+:1] = send_adp__recv__yum[0][1+:1];
	assign routers__send__yum[0][0+:1] = send_adp__recv__yum[0][0+:1];
	assign send__msg[796+:199] = send_adp__send__msg[0];
	assign send_adp__send__rdy[0] = send__rdy[4+:1];
	assign send__val[4+:1] = send_adp__send__val[0];
	assign routers__recv__en[2][2+:1] = routers__send__en[1][1+:1];
	assign routers__recv__msg[2][398+:199] = routers__send__msg[1][199+:199];
	assign routers__send__yum[1][3+:1] = routers__recv__yum[2][5+:1];
	assign routers__send__yum[1][2+:1] = routers__recv__yum[2][4+:1];
	assign routers__recv__en[1][1+:1] = routers__send__en[2][2+:1];
	assign routers__recv__msg[1][199+:199] = routers__send__msg[2][398+:199];
	assign routers__send__yum[2][5+:1] = routers__recv__yum[1][3+:1];
	assign routers__send__yum[2][4+:1] = routers__recv__yum[1][2+:1];
	assign recv_adp__recv__msg[1] = recv__msg[597+:199];
	assign recv__rdy[3+:1] = recv_adp__recv__rdy[1];
	assign recv_adp__recv__val[1] = recv__val[3+:1];
	assign routers__recv__en[1][0+:1] = recv_adp__send__en[1];
	assign routers__recv__msg[1][0+:199] = recv_adp__send__msg[1];
	assign recv_adp__send__yum[1][1+:1] = routers__recv__yum[1][1+:1];
	assign recv_adp__send__yum[1][0+:1] = routers__recv__yum[1][0+:1];
	assign send_adp__recv__en[1] = routers__send__en[1][0+:1];
	assign send_adp__recv__msg[1] = routers__send__msg[1][0+:199];
	assign routers__send__yum[1][1+:1] = send_adp__recv__yum[1][1+:1];
	assign routers__send__yum[1][0+:1] = send_adp__recv__yum[1][0+:1];
	assign send__msg[597+:199] = send_adp__send__msg[1];
	assign send_adp__send__rdy[1] = send__rdy[3+:1];
	assign send__val[3+:1] = send_adp__send__val[1];
	assign routers__recv__en[3][2+:1] = routers__send__en[2][1+:1];
	assign routers__recv__msg[3][398+:199] = routers__send__msg[2][199+:199];
	assign routers__send__yum[2][3+:1] = routers__recv__yum[3][5+:1];
	assign routers__send__yum[2][2+:1] = routers__recv__yum[3][4+:1];
	assign routers__recv__en[2][1+:1] = routers__send__en[3][2+:1];
	assign routers__recv__msg[2][199+:199] = routers__send__msg[3][398+:199];
	assign routers__send__yum[3][5+:1] = routers__recv__yum[2][3+:1];
	assign routers__send__yum[3][4+:1] = routers__recv__yum[2][2+:1];
	assign recv_adp__recv__msg[2] = recv__msg[398+:199];
	assign recv__rdy[2+:1] = recv_adp__recv__rdy[2];
	assign recv_adp__recv__val[2] = recv__val[2+:1];
	assign routers__recv__en[2][0+:1] = recv_adp__send__en[2];
	assign routers__recv__msg[2][0+:199] = recv_adp__send__msg[2];
	assign recv_adp__send__yum[2][1+:1] = routers__recv__yum[2][1+:1];
	assign recv_adp__send__yum[2][0+:1] = routers__recv__yum[2][0+:1];
	assign send_adp__recv__en[2] = routers__send__en[2][0+:1];
	assign send_adp__recv__msg[2] = routers__send__msg[2][0+:199];
	assign routers__send__yum[2][1+:1] = send_adp__recv__yum[2][1+:1];
	assign routers__send__yum[2][0+:1] = send_adp__recv__yum[2][0+:1];
	assign send__msg[398+:199] = send_adp__send__msg[2];
	assign send_adp__send__rdy[2] = send__rdy[2+:1];
	assign send__val[2+:1] = send_adp__send__val[2];
	assign routers__recv__en[4][2+:1] = routers__send__en[3][1+:1];
	assign routers__recv__msg[4][398+:199] = routers__send__msg[3][199+:199];
	assign routers__send__yum[3][3+:1] = routers__recv__yum[4][5+:1];
	assign routers__send__yum[3][2+:1] = routers__recv__yum[4][4+:1];
	assign routers__recv__en[3][1+:1] = routers__send__en[4][2+:1];
	assign routers__recv__msg[3][199+:199] = routers__send__msg[4][398+:199];
	assign routers__send__yum[4][5+:1] = routers__recv__yum[3][3+:1];
	assign routers__send__yum[4][4+:1] = routers__recv__yum[3][2+:1];
	assign recv_adp__recv__msg[3] = recv__msg[199+:199];
	assign recv__rdy[1+:1] = recv_adp__recv__rdy[3];
	assign recv_adp__recv__val[3] = recv__val[1+:1];
	assign routers__recv__en[3][0+:1] = recv_adp__send__en[3];
	assign routers__recv__msg[3][0+:199] = recv_adp__send__msg[3];
	assign recv_adp__send__yum[3][1+:1] = routers__recv__yum[3][1+:1];
	assign recv_adp__send__yum[3][0+:1] = routers__recv__yum[3][0+:1];
	assign send_adp__recv__en[3] = routers__send__en[3][0+:1];
	assign send_adp__recv__msg[3] = routers__send__msg[3][0+:199];
	assign routers__send__yum[3][1+:1] = send_adp__recv__yum[3][1+:1];
	assign routers__send__yum[3][0+:1] = send_adp__recv__yum[3][0+:1];
	assign send__msg[199+:199] = send_adp__send__msg[3];
	assign send_adp__send__rdy[3] = send__rdy[1+:1];
	assign send__val[1+:1] = send_adp__send__val[3];
	assign routers__recv__en[0][2+:1] = routers__send__en[4][1+:1];
	assign routers__recv__msg[0][398+:199] = routers__send__msg[4][199+:199];
	assign routers__send__yum[4][3+:1] = routers__recv__yum[0][5+:1];
	assign routers__send__yum[4][2+:1] = routers__recv__yum[0][4+:1];
	assign routers__recv__en[4][1+:1] = routers__send__en[0][2+:1];
	assign routers__recv__msg[4][199+:199] = routers__send__msg[0][398+:199];
	assign routers__send__yum[0][5+:1] = routers__recv__yum[4][3+:1];
	assign routers__send__yum[0][4+:1] = routers__recv__yum[4][2+:1];
	assign recv_adp__recv__msg[4] = recv__msg[0+:199];
	assign recv__rdy[0+:1] = recv_adp__recv__rdy[4];
	assign recv_adp__recv__val[4] = recv__val[0+:1];
	assign routers__recv__en[4][0+:1] = recv_adp__send__en[4];
	assign routers__recv__msg[4][0+:199] = recv_adp__send__msg[4];
	assign recv_adp__send__yum[4][1+:1] = routers__recv__yum[4][1+:1];
	assign recv_adp__send__yum[4][0+:1] = routers__recv__yum[4][0+:1];
	assign send_adp__recv__en[4] = routers__send__en[4][0+:1];
	assign send_adp__recv__msg[4] = routers__send__msg[4][0+:199];
	assign routers__send__yum[4][1+:1] = send_adp__recv__yum[4][1+:1];
	assign routers__send__yum[4][0+:1] = send_adp__recv__yum[4][0+:1];
	assign send__msg[0+:199] = send_adp__send__msg[4];
	assign send_adp__send__rdy[4] = send__rdy[0+:1];
	assign send__val[0+:1] = send_adp__send__val[4];
endmodule
module ChannelRTL__9cfa4311ae6b2bdc (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	assign send__msg = recv__msg;
	assign recv__rdy = send__rdy;
	assign send__val = recv__val;
endmodule
module RegisterFile__84f0703fd9bfd535 (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [3:0] raddr;
	output reg [34:0] rdata;
	input wire [0:0] reset;
	input wire [3:0] waddr;
	input wire [34:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [34:0] regs [0:15];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 35+:35] = regs[raddr[sv2v_cast_1(i) * 4+:4]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i) * 4+:4]] <= wdata[sv2v_cast_1(i) * 35+:35];
		end
	end
endmodule
module DataMemWrapperRTL__d40387976026818a (
	clk,
	reset,
	recv_rd__msg,
	recv_rd__rdy,
	recv_rd__val,
	recv_wr__msg,
	recv_wr__rdy,
	recv_wr__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv_rd__msg;
	output wire [0:0] recv_rd__rdy;
	input wire [0:0] recv_rd__val;
	input wire [52:0] recv_wr__msg;
	output wire [0:0] recv_wr__rdy;
	input wire [0:0] recv_wr__val;
	output reg [52:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [4:0] __const__per_bank_data_mem_size_at_request_memory = 5'd16;
	wire [0:0] channel_rd__clk;
	wire [0:0] channel_rd__reset;
	wire [52:0] channel_rd__recv__msg;
	wire [0:0] channel_rd__recv__rdy;
	wire [0:0] channel_rd__recv__val;
	wire [52:0] channel_rd__send__msg;
	reg [0:0] channel_rd__send__rdy;
	wire [0:0] channel_rd__send__val;
	ChannelRTL__9cfa4311ae6b2bdc channel_rd(
		.clk(channel_rd__clk),
		.reset(channel_rd__reset),
		.recv__msg(channel_rd__recv__msg),
		.recv__rdy(channel_rd__recv__rdy),
		.recv__val(channel_rd__recv__val),
		.send__msg(channel_rd__send__msg),
		.send__rdy(channel_rd__send__rdy),
		.send__val(channel_rd__send__val)
	);
	wire [0:0] channel_wr__clk;
	wire [0:0] channel_wr__reset;
	wire [52:0] channel_wr__recv__msg;
	wire [0:0] channel_wr__recv__rdy;
	wire [0:0] channel_wr__recv__val;
	wire [52:0] channel_wr__send__msg;
	reg [0:0] channel_wr__send__rdy;
	wire [0:0] channel_wr__send__val;
	ChannelRTL__9cfa4311ae6b2bdc channel_wr(
		.clk(channel_wr__clk),
		.reset(channel_wr__reset),
		.recv__msg(channel_wr__recv__msg),
		.recv__rdy(channel_wr__recv__rdy),
		.recv__val(channel_wr__recv__val),
		.send__msg(channel_wr__send__msg),
		.send__rdy(channel_wr__send__rdy),
		.send__val(channel_wr__send__val)
	);
	wire [0:0] memory__clk;
	reg [3:0] memory__raddr;
	wire [34:0] memory__rdata;
	wire [0:0] memory__reset;
	reg [3:0] memory__waddr;
	reg [34:0] memory__wdata;
	reg [0:0] memory__wen;
	RegisterFile__84f0703fd9bfd535 memory(
		.clk(memory__clk),
		.raddr(memory__raddr),
		.rdata(memory__rdata),
		.reset(memory__reset),
		.waddr(memory__waddr),
		.wdata(memory__wdata),
		.wen(memory__wen)
	);
	always @(*) begin : compose_send_msg
		send__msg = 53'h00000000000000;
		if (channel_rd__send__val) begin
			send__msg[52-:2] = channel_rd__send__msg[50-:2];
			send__msg[50-:2] = channel_rd__send__msg[52-:2];
			send__msg[48-:7] = channel_rd__send__msg[48-:7];
			send__msg[41-:35] = memory__rdata[1'd0 * 35+:35];
			send__msg[6-:2] = channel_rd__send__msg[6-:2];
			send__msg[4-:3] = channel_rd__send__msg[4-:3];
			send__msg[1-:2] = channel_rd__send__msg[1-:2];
		end
	end
	always @(*) begin : notify_channel_rdy
		channel_rd__send__rdy = send__rdy;
		channel_wr__send__rdy = 1'd1;
	end
	always @(*) begin : notify_send_val
		send__val = channel_rd__send__val;
	end
	function automatic [6:0] sv2v_cast_7;
		input reg [6:0] inp;
		sv2v_cast_7 = inp;
	endfunction
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : request_memory
		memory__wen[1'd0+:1] = 1'd0;
		memory__raddr[1'd0 * 4+:4] = 4'd0;
		memory__waddr[1'd0 * 4+:4] = 4'd0;
		memory__wdata[1'd0 * 35+:35] = 35'h000000000;
		if (channel_rd__send__val)
			memory__raddr[1'd0 * 4+:4] = sv2v_cast_4(channel_rd__send__msg[48-:7] % sv2v_cast_7(__const__per_bank_data_mem_size_at_request_memory));
		if (channel_wr__send__val) begin
			memory__waddr[1'd0 * 4+:4] = sv2v_cast_4(channel_wr__send__msg[48-:7] % sv2v_cast_7(__const__per_bank_data_mem_size_at_request_memory));
			memory__wdata[1'd0 * 35+:35] = channel_wr__send__msg[41-:35];
			memory__wen[1'd0+:1] = 1'd1;
		end
	end
	assign memory__clk = clk;
	assign memory__reset = reset;
	assign channel_rd__clk = clk;
	assign channel_rd__reset = reset;
	assign channel_wr__clk = clk;
	assign channel_wr__reset = reset;
	assign channel_rd__recv__msg = recv_rd__msg;
	assign recv_rd__rdy = channel_rd__recv__rdy;
	assign channel_rd__recv__val = recv_rd__val;
	assign channel_wr__recv__msg = recv_wr__msg;
	assign recv_wr__rdy = channel_wr__recv__rdy;
	assign channel_wr__recv__val = recv_wr__val;
endmodule
module Mux__Type_MemAccessPacket_4_3_128__d2e885ad92ecb31c__ninputs_2 (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [105:0] in_;
	output reg [52:0] out;
	input wire [0:0] reset;
	input wire [0:0] sel;
	always @(*) begin : up_mux
		out = in_[(1 - sel) * 53+:53];
	end
endmodule
module RegisterFile__419a96305de89f85 (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	output reg [52:0] rdata;
	input wire [0:0] reset;
	input wire [0:0] waddr;
	input wire [52:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [52:0] regs [0:1];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 53+:53] = regs[raddr[sv2v_cast_1(i)+:1]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i)+:1]] <= wdata[sv2v_cast_1(i) * 53+:53];
		end
	end
endmodule
module BypassQueueDpathRTL__14fd9da3b44ff47c (
	clk,
	mux_sel,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] mux_sel;
	input wire [0:0] raddr;
	input wire [52:0] recv_msg;
	input wire [0:0] reset;
	output wire [52:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] mux__clk;
	wire [105:0] mux__in_;
	wire [52:0] mux__out;
	wire [0:0] mux__reset;
	wire [0:0] mux__sel;
	Mux__Type_MemAccessPacket_4_3_128__d2e885ad92ecb31c__ninputs_2 mux(
		.clk(mux__clk),
		.in_(mux__in_),
		.out(mux__out),
		.reset(mux__reset),
		.sel(mux__sel)
	);
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [52:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [52:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__419a96305de89f85 rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:53] = recv_msg;
	assign mux__clk = clk;
	assign mux__reset = reset;
	assign mux__sel = mux_sel;
	assign mux__in_[53+:53] = rf__rdata[0+:53];
	assign mux__in_[0+:53] = recv_msg;
	assign send_msg = mux__out;
endmodule
module BypassQueueRTL__14fd9da3b44ff47c (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__mux_sel;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	BypassQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.mux_sel(ctrl__mux_sel),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__mux_sel;
	wire [0:0] dpath__raddr;
	wire [52:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [52:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	BypassQueueDpathRTL__14fd9da3b44ff47c dpath(
		.clk(dpath__clk),
		.mux_sel(dpath__mux_sel),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign dpath__mux_sel = ctrl__mux_sel;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign count = ctrl__count;
	assign dpath__recv_msg = recv__msg;
	assign send__msg = dpath__send_msg;
endmodule
module InputUnitRTL__038aec93b1308e36 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] queue__clk;
	wire [1:0] queue__count;
	wire [0:0] queue__reset;
	wire [52:0] queue__recv__msg;
	wire [0:0] queue__recv__rdy;
	wire [0:0] queue__recv__val;
	wire [52:0] queue__send__msg;
	wire [0:0] queue__send__rdy;
	wire [0:0] queue__send__val;
	BypassQueueRTL__14fd9da3b44ff47c queue(
		.clk(queue__clk),
		.count(queue__count),
		.reset(queue__reset),
		.recv__msg(queue__recv__msg),
		.recv__rdy(queue__recv__rdy),
		.recv__val(queue__recv__val),
		.send__msg(queue__send__msg),
		.send__rdy(queue__send__rdy),
		.send__val(queue__send__val)
	);
	assign queue__clk = clk;
	assign queue__reset = reset;
	assign queue__recv__msg = recv__msg;
	assign recv__rdy = queue__recv__rdy;
	assign queue__recv__val = recv__val;
	assign send__msg = queue__send__msg;
	assign queue__send__rdy = send__rdy;
	assign send__val = queue__send__val;
endmodule
module OutputUnitRTL__2be89df1167853ab (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	assign send__msg = recv__msg;
	assign recv__rdy = send__rdy;
	assign send__val = recv__val;
endmodule
module XbarRouteUnitRTL__00a6195ffedfd51d (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output reg [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [158:0] send__msg;
	input wire [2:0] send__rdy;
	output reg [2:0] send__val;
	localparam [1:0] __const__num_outports_at_up_ru_routing = 2'd3;
	reg [1:0] out_dir;
	wire [2:0] send_val;
	always @(*) begin : up_ru_recv_rdy
		recv__rdy = send__rdy[2 - out_dir+:1] > 1'd0;
	end
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : up_ru_routing
		out_dir = recv__msg[50-:2];
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_up_ru_routing; i = i + 1'd1)
				send__val[2 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		if (recv__val)
			send__val[2 - out_dir+:1] = 1'd1;
	end
	assign send__msg[106+:53] = recv__msg;
	assign send_val[0:0] = send__val[2+:1];
	assign send__msg[53+:53] = recv__msg;
	assign send_val[1:1] = send__val[1+:1];
	assign send__msg[0+:53] = recv__msg;
	assign send_val[2:2] = send__val[0+:1];
endmodule
module RegEnRst__Type_Bits4__reset_value_1 (
	clk,
	en,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	input wire [3:0] in_;
	output reg [3:0] out;
	input wire [0:0] reset;
	localparam [0:0] __const__reset_value_at_up_regenrst = 1'd1;
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(posedge clk) begin : up_regenrst
		if (reset)
			out <= sv2v_cast_4(__const__reset_value_at_up_regenrst);
		else if (en)
			out <= in_;
	end
endmodule
module RoundRobinArbiterEn__nreqs_4 (
	clk,
	en,
	grants,
	reqs,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	output reg [3:0] grants;
	input wire [3:0] reqs;
	input wire [0:0] reset;
	localparam [2:0] __const__nreqs_at_comb_reqs_int = 3'd4;
	localparam [3:0] __const__nreqsX2_at_comb_reqs_int = 4'd8;
	localparam [2:0] __const__nreqs_at_comb_grants = 3'd4;
	localparam [2:0] __const__nreqs_at_comb_priority_int = 3'd4;
	localparam [3:0] __const__nreqsX2_at_comb_priority_int = 4'd8;
	localparam [3:0] __const__nreqsX2_at_comb_kills = 4'd8;
	localparam [3:0] __const__nreqsX2_at_comb_grants_int = 4'd8;
	reg [7:0] grants_int;
	reg [8:0] kills;
	reg [0:0] priority_en;
	reg [7:0] priority_int;
	reg [7:0] reqs_int;
	wire [0:0] priority_reg__clk;
	wire [0:0] priority_reg__en;
	wire [3:0] priority_reg__in_;
	wire [3:0] priority_reg__out;
	wire [0:0] priority_reg__reset;
	RegEnRst__Type_Bits4__reset_value_1 priority_reg(
		.clk(priority_reg__clk),
		.en(priority_reg__en),
		.in_(priority_reg__in_),
		.out(priority_reg__out),
		.reset(priority_reg__reset)
	);
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : comb_grants
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqs_at_comb_grants; i = i + 1'd1)
				grants[sv2v_cast_2(i)] = grants_int[sv2v_cast_3(i)] | grants_int[__const__nreqs_at_comb_grants + sv2v_cast_3(i)];
		end
	end
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : comb_grants_int
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_grants_int; i = i + 1'd1)
				if (priority_int[sv2v_cast_3(i)])
					grants_int[sv2v_cast_3(i)] = reqs_int[sv2v_cast_3(i)];
				else
					grants_int[sv2v_cast_3(i)] = ~kills[sv2v_cast_4(i)] & reqs_int[sv2v_cast_3(i)];
		end
	end
	always @(*) begin : comb_kills
		kills[4'd0] = 1'd1;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_kills; i = i + 1'd1)
				if (priority_int[sv2v_cast_3(i)])
					kills[sv2v_cast_4(i) + 4'd1] = reqs_int[sv2v_cast_3(i)];
				else
					kills[sv2v_cast_4(i) + 4'd1] = kills[sv2v_cast_4(i)] | (~kills[sv2v_cast_4(i)] & reqs_int[sv2v_cast_3(i)]);
		end
	end
	always @(*) begin : comb_priority_en
		priority_en = (grants != 4'd0) & en;
	end
	always @(*) begin : comb_priority_int
		priority_int[3'd3:3'd0] = priority_reg__out;
		priority_int[3'd7:__const__nreqs_at_comb_priority_int] = 4'd0;
	end
	always @(*) begin : comb_reqs_int
		reqs_int[3'd3:3'd0] = reqs;
		reqs_int[3'd7:__const__nreqs_at_comb_reqs_int] = reqs;
	end
	assign priority_reg__clk = clk;
	assign priority_reg__reset = reset;
	assign priority_reg__en = priority_en;
	assign priority_reg__in_[3:1] = grants[2:0];
	assign priority_reg__in_[0:0] = grants[3:3];
endmodule
module Encoder__in_nbits_4__out_nbits_2 (
	clk,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [3:0] in_;
	output reg [1:0] out;
	input wire [0:0] reset;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : encode
		out = 2'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < 3'd4; i = i + 1'd1)
				if (in_[sv2v_cast_2(i)])
					out = sv2v_cast_2(i);
		end
	end
endmodule
module Mux__Type_MemAccessPacket_4_3_128__d2e885ad92ecb31c__ninputs_4 (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [211:0] in_;
	output reg [52:0] out;
	input wire [0:0] reset;
	input wire [1:0] sel;
	always @(*) begin : up_mux
		out = in_[(3 - sel) * 53+:53];
	end
endmodule
module SwitchUnitRTL__dd1d08bfc1bf9063 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [211:0] recv__msg;
	output reg [3:0] recv__rdy;
	input wire [3:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [2:0] __const__num_inports_at_up_get_en = 3'd4;
	wire [0:0] arbiter__clk;
	wire [0:0] arbiter__en;
	wire [3:0] arbiter__grants;
	wire [3:0] arbiter__reqs;
	wire [0:0] arbiter__reset;
	RoundRobinArbiterEn__nreqs_4 arbiter(
		.clk(arbiter__clk),
		.en(arbiter__en),
		.grants(arbiter__grants),
		.reqs(arbiter__reqs),
		.reset(arbiter__reset)
	);
	wire [0:0] encoder__clk;
	wire [3:0] encoder__in_;
	wire [1:0] encoder__out;
	wire [0:0] encoder__reset;
	Encoder__in_nbits_4__out_nbits_2 encoder(
		.clk(encoder__clk),
		.in_(encoder__in_),
		.out(encoder__out),
		.reset(encoder__reset)
	);
	wire [0:0] mux__clk;
	wire [211:0] mux__in_;
	wire [52:0] mux__out;
	wire [0:0] mux__reset;
	wire [1:0] mux__sel;
	Mux__Type_MemAccessPacket_4_3_128__d2e885ad92ecb31c__ninputs_4 mux(
		.clk(mux__clk),
		.in_(mux__in_),
		.out(mux__out),
		.reset(mux__reset),
		.sel(mux__sel)
	);
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : up_get_en
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_up_get_en; i = i + 1'd1)
				recv__rdy[3 - sv2v_cast_2(i)+:1] = send__rdy & (mux__sel == sv2v_cast_2(i));
		end
	end
	always @(*) begin : up_send_val
		send__val = arbiter__grants > 4'd0;
	end
	assign arbiter__clk = clk;
	assign arbiter__reset = reset;
	assign arbiter__en = 1'd1;
	assign mux__clk = clk;
	assign mux__reset = reset;
	assign send__msg = mux__out;
	assign encoder__clk = clk;
	assign encoder__reset = reset;
	assign encoder__in_ = arbiter__grants;
	assign mux__sel = encoder__out;
	assign arbiter__reqs[0:0] = recv__val[3+:1];
	assign mux__in_[159+:53] = recv__msg[159+:53];
	assign arbiter__reqs[1:1] = recv__val[2+:1];
	assign mux__in_[106+:53] = recv__msg[106+:53];
	assign arbiter__reqs[2:2] = recv__val[1+:1];
	assign mux__in_[53+:53] = recv__msg[53+:53];
	assign arbiter__reqs[3:3] = recv__val[0+:1];
	assign mux__in_[0+:53] = recv__msg[0+:53];
endmodule
module XbarBypassQueueRTL__0de4e0c11bc743cb (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [211:0] recv__msg;
	output wire [3:0] recv__rdy;
	input wire [3:0] recv__val;
	output wire [158:0] send__msg;
	input wire [2:0] send__rdy;
	output wire [2:0] send__val;
	wire [0:0] input_units__clk [0:3];
	wire [0:0] input_units__reset [0:3];
	wire [52:0] input_units__recv__msg [0:3];
	wire [0:0] input_units__recv__rdy [0:3];
	wire [0:0] input_units__recv__val [0:3];
	wire [52:0] input_units__send__msg [0:3];
	wire [0:0] input_units__send__rdy [0:3];
	wire [0:0] input_units__send__val [0:3];
	InputUnitRTL__038aec93b1308e36 input_units__0(
		.clk(input_units__clk[0]),
		.reset(input_units__reset[0]),
		.recv__msg(input_units__recv__msg[0]),
		.recv__rdy(input_units__recv__rdy[0]),
		.recv__val(input_units__recv__val[0]),
		.send__msg(input_units__send__msg[0]),
		.send__rdy(input_units__send__rdy[0]),
		.send__val(input_units__send__val[0])
	);
	InputUnitRTL__038aec93b1308e36 input_units__1(
		.clk(input_units__clk[1]),
		.reset(input_units__reset[1]),
		.recv__msg(input_units__recv__msg[1]),
		.recv__rdy(input_units__recv__rdy[1]),
		.recv__val(input_units__recv__val[1]),
		.send__msg(input_units__send__msg[1]),
		.send__rdy(input_units__send__rdy[1]),
		.send__val(input_units__send__val[1])
	);
	InputUnitRTL__038aec93b1308e36 input_units__2(
		.clk(input_units__clk[2]),
		.reset(input_units__reset[2]),
		.recv__msg(input_units__recv__msg[2]),
		.recv__rdy(input_units__recv__rdy[2]),
		.recv__val(input_units__recv__val[2]),
		.send__msg(input_units__send__msg[2]),
		.send__rdy(input_units__send__rdy[2]),
		.send__val(input_units__send__val[2])
	);
	InputUnitRTL__038aec93b1308e36 input_units__3(
		.clk(input_units__clk[3]),
		.reset(input_units__reset[3]),
		.recv__msg(input_units__recv__msg[3]),
		.recv__rdy(input_units__recv__rdy[3]),
		.recv__val(input_units__recv__val[3]),
		.send__msg(input_units__send__msg[3]),
		.send__rdy(input_units__send__rdy[3]),
		.send__val(input_units__send__val[3])
	);
	wire [0:0] output_units__clk [0:2];
	wire [0:0] output_units__reset [0:2];
	wire [52:0] output_units__recv__msg [0:2];
	wire [0:0] output_units__recv__rdy [0:2];
	wire [0:0] output_units__recv__val [0:2];
	wire [52:0] output_units__send__msg [0:2];
	wire [0:0] output_units__send__rdy [0:2];
	wire [0:0] output_units__send__val [0:2];
	OutputUnitRTL__2be89df1167853ab output_units__0(
		.clk(output_units__clk[0]),
		.reset(output_units__reset[0]),
		.recv__msg(output_units__recv__msg[0]),
		.recv__rdy(output_units__recv__rdy[0]),
		.recv__val(output_units__recv__val[0]),
		.send__msg(output_units__send__msg[0]),
		.send__rdy(output_units__send__rdy[0]),
		.send__val(output_units__send__val[0])
	);
	OutputUnitRTL__2be89df1167853ab output_units__1(
		.clk(output_units__clk[1]),
		.reset(output_units__reset[1]),
		.recv__msg(output_units__recv__msg[1]),
		.recv__rdy(output_units__recv__rdy[1]),
		.recv__val(output_units__recv__val[1]),
		.send__msg(output_units__send__msg[1]),
		.send__rdy(output_units__send__rdy[1]),
		.send__val(output_units__send__val[1])
	);
	OutputUnitRTL__2be89df1167853ab output_units__2(
		.clk(output_units__clk[2]),
		.reset(output_units__reset[2]),
		.recv__msg(output_units__recv__msg[2]),
		.recv__rdy(output_units__recv__rdy[2]),
		.recv__val(output_units__recv__val[2]),
		.send__msg(output_units__send__msg[2]),
		.send__rdy(output_units__send__rdy[2]),
		.send__val(output_units__send__val[2])
	);
	wire [0:0] route_units__clk [0:3];
	wire [0:0] route_units__reset [0:3];
	wire [52:0] route_units__recv__msg [0:3];
	wire [0:0] route_units__recv__rdy [0:3];
	wire [0:0] route_units__recv__val [0:3];
	wire [158:0] route_units__send__msg [0:3];
	wire [2:0] route_units__send__rdy [0:3];
	wire [2:0] route_units__send__val [0:3];
	XbarRouteUnitRTL__00a6195ffedfd51d route_units__0(
		.clk(route_units__clk[0]),
		.reset(route_units__reset[0]),
		.recv__msg(route_units__recv__msg[0]),
		.recv__rdy(route_units__recv__rdy[0]),
		.recv__val(route_units__recv__val[0]),
		.send__msg(route_units__send__msg[0]),
		.send__rdy(route_units__send__rdy[0]),
		.send__val(route_units__send__val[0])
	);
	XbarRouteUnitRTL__00a6195ffedfd51d route_units__1(
		.clk(route_units__clk[1]),
		.reset(route_units__reset[1]),
		.recv__msg(route_units__recv__msg[1]),
		.recv__rdy(route_units__recv__rdy[1]),
		.recv__val(route_units__recv__val[1]),
		.send__msg(route_units__send__msg[1]),
		.send__rdy(route_units__send__rdy[1]),
		.send__val(route_units__send__val[1])
	);
	XbarRouteUnitRTL__00a6195ffedfd51d route_units__2(
		.clk(route_units__clk[2]),
		.reset(route_units__reset[2]),
		.recv__msg(route_units__recv__msg[2]),
		.recv__rdy(route_units__recv__rdy[2]),
		.recv__val(route_units__recv__val[2]),
		.send__msg(route_units__send__msg[2]),
		.send__rdy(route_units__send__rdy[2]),
		.send__val(route_units__send__val[2])
	);
	XbarRouteUnitRTL__00a6195ffedfd51d route_units__3(
		.clk(route_units__clk[3]),
		.reset(route_units__reset[3]),
		.recv__msg(route_units__recv__msg[3]),
		.recv__rdy(route_units__recv__rdy[3]),
		.recv__val(route_units__recv__val[3]),
		.send__msg(route_units__send__msg[3]),
		.send__rdy(route_units__send__rdy[3]),
		.send__val(route_units__send__val[3])
	);
	wire [0:0] switch_units__clk [0:2];
	wire [0:0] switch_units__reset [0:2];
	wire [211:0] switch_units__recv__msg [0:2];
	wire [3:0] switch_units__recv__rdy [0:2];
	wire [3:0] switch_units__recv__val [0:2];
	wire [52:0] switch_units__send__msg [0:2];
	wire [0:0] switch_units__send__rdy [0:2];
	wire [0:0] switch_units__send__val [0:2];
	SwitchUnitRTL__dd1d08bfc1bf9063 switch_units__0(
		.clk(switch_units__clk[0]),
		.reset(switch_units__reset[0]),
		.recv__msg(switch_units__recv__msg[0]),
		.recv__rdy(switch_units__recv__rdy[0]),
		.recv__val(switch_units__recv__val[0]),
		.send__msg(switch_units__send__msg[0]),
		.send__rdy(switch_units__send__rdy[0]),
		.send__val(switch_units__send__val[0])
	);
	SwitchUnitRTL__dd1d08bfc1bf9063 switch_units__1(
		.clk(switch_units__clk[1]),
		.reset(switch_units__reset[1]),
		.recv__msg(switch_units__recv__msg[1]),
		.recv__rdy(switch_units__recv__rdy[1]),
		.recv__val(switch_units__recv__val[1]),
		.send__msg(switch_units__send__msg[1]),
		.send__rdy(switch_units__send__rdy[1]),
		.send__val(switch_units__send__val[1])
	);
	SwitchUnitRTL__dd1d08bfc1bf9063 switch_units__2(
		.clk(switch_units__clk[2]),
		.reset(switch_units__reset[2]),
		.recv__msg(switch_units__recv__msg[2]),
		.recv__rdy(switch_units__recv__rdy[2]),
		.recv__val(switch_units__recv__val[2]),
		.send__msg(switch_units__send__msg[2]),
		.send__rdy(switch_units__send__rdy[2]),
		.send__val(switch_units__send__val[2])
	);
	assign input_units__clk[0] = clk;
	assign input_units__reset[0] = reset;
	assign input_units__clk[1] = clk;
	assign input_units__reset[1] = reset;
	assign input_units__clk[2] = clk;
	assign input_units__reset[2] = reset;
	assign input_units__clk[3] = clk;
	assign input_units__reset[3] = reset;
	assign route_units__clk[0] = clk;
	assign route_units__reset[0] = reset;
	assign route_units__clk[1] = clk;
	assign route_units__reset[1] = reset;
	assign route_units__clk[2] = clk;
	assign route_units__reset[2] = reset;
	assign route_units__clk[3] = clk;
	assign route_units__reset[3] = reset;
	assign switch_units__clk[0] = clk;
	assign switch_units__reset[0] = reset;
	assign switch_units__clk[1] = clk;
	assign switch_units__reset[1] = reset;
	assign switch_units__clk[2] = clk;
	assign switch_units__reset[2] = reset;
	assign output_units__clk[0] = clk;
	assign output_units__reset[0] = reset;
	assign output_units__clk[1] = clk;
	assign output_units__reset[1] = reset;
	assign output_units__clk[2] = clk;
	assign output_units__reset[2] = reset;
	assign input_units__recv__msg[0] = recv__msg[159+:53];
	assign recv__rdy[3+:1] = input_units__recv__rdy[0];
	assign input_units__recv__val[0] = recv__val[3+:1];
	assign route_units__recv__msg[0] = input_units__send__msg[0];
	assign input_units__send__rdy[0] = route_units__recv__rdy[0];
	assign route_units__recv__val[0] = input_units__send__val[0];
	assign input_units__recv__msg[1] = recv__msg[106+:53];
	assign recv__rdy[2+:1] = input_units__recv__rdy[1];
	assign input_units__recv__val[1] = recv__val[2+:1];
	assign route_units__recv__msg[1] = input_units__send__msg[1];
	assign input_units__send__rdy[1] = route_units__recv__rdy[1];
	assign route_units__recv__val[1] = input_units__send__val[1];
	assign input_units__recv__msg[2] = recv__msg[53+:53];
	assign recv__rdy[1+:1] = input_units__recv__rdy[2];
	assign input_units__recv__val[2] = recv__val[1+:1];
	assign route_units__recv__msg[2] = input_units__send__msg[2];
	assign input_units__send__rdy[2] = route_units__recv__rdy[2];
	assign route_units__recv__val[2] = input_units__send__val[2];
	assign input_units__recv__msg[3] = recv__msg[0+:53];
	assign recv__rdy[0+:1] = input_units__recv__rdy[3];
	assign input_units__recv__val[3] = recv__val[0+:1];
	assign route_units__recv__msg[3] = input_units__send__msg[3];
	assign input_units__send__rdy[3] = route_units__recv__rdy[3];
	assign route_units__recv__val[3] = input_units__send__val[3];
	assign switch_units__recv__msg[0][159+:53] = route_units__send__msg[0][106+:53];
	assign route_units__send__rdy[0][2+:1] = switch_units__recv__rdy[0][3+:1];
	assign switch_units__recv__val[0][3+:1] = route_units__send__val[0][2+:1];
	assign switch_units__recv__msg[1][159+:53] = route_units__send__msg[0][53+:53];
	assign route_units__send__rdy[0][1+:1] = switch_units__recv__rdy[1][3+:1];
	assign switch_units__recv__val[1][3+:1] = route_units__send__val[0][1+:1];
	assign switch_units__recv__msg[2][159+:53] = route_units__send__msg[0][0+:53];
	assign route_units__send__rdy[0][0+:1] = switch_units__recv__rdy[2][3+:1];
	assign switch_units__recv__val[2][3+:1] = route_units__send__val[0][0+:1];
	assign switch_units__recv__msg[0][106+:53] = route_units__send__msg[1][106+:53];
	assign route_units__send__rdy[1][2+:1] = switch_units__recv__rdy[0][2+:1];
	assign switch_units__recv__val[0][2+:1] = route_units__send__val[1][2+:1];
	assign switch_units__recv__msg[1][106+:53] = route_units__send__msg[1][53+:53];
	assign route_units__send__rdy[1][1+:1] = switch_units__recv__rdy[1][2+:1];
	assign switch_units__recv__val[1][2+:1] = route_units__send__val[1][1+:1];
	assign switch_units__recv__msg[2][106+:53] = route_units__send__msg[1][0+:53];
	assign route_units__send__rdy[1][0+:1] = switch_units__recv__rdy[2][2+:1];
	assign switch_units__recv__val[2][2+:1] = route_units__send__val[1][0+:1];
	assign switch_units__recv__msg[0][53+:53] = route_units__send__msg[2][106+:53];
	assign route_units__send__rdy[2][2+:1] = switch_units__recv__rdy[0][1+:1];
	assign switch_units__recv__val[0][1+:1] = route_units__send__val[2][2+:1];
	assign switch_units__recv__msg[1][53+:53] = route_units__send__msg[2][53+:53];
	assign route_units__send__rdy[2][1+:1] = switch_units__recv__rdy[1][1+:1];
	assign switch_units__recv__val[1][1+:1] = route_units__send__val[2][1+:1];
	assign switch_units__recv__msg[2][53+:53] = route_units__send__msg[2][0+:53];
	assign route_units__send__rdy[2][0+:1] = switch_units__recv__rdy[2][1+:1];
	assign switch_units__recv__val[2][1+:1] = route_units__send__val[2][0+:1];
	assign switch_units__recv__msg[0][0+:53] = route_units__send__msg[3][106+:53];
	assign route_units__send__rdy[3][2+:1] = switch_units__recv__rdy[0][0+:1];
	assign switch_units__recv__val[0][0+:1] = route_units__send__val[3][2+:1];
	assign switch_units__recv__msg[1][0+:53] = route_units__send__msg[3][53+:53];
	assign route_units__send__rdy[3][1+:1] = switch_units__recv__rdy[1][0+:1];
	assign switch_units__recv__val[1][0+:1] = route_units__send__val[3][1+:1];
	assign switch_units__recv__msg[2][0+:53] = route_units__send__msg[3][0+:53];
	assign route_units__send__rdy[3][0+:1] = switch_units__recv__rdy[2][0+:1];
	assign switch_units__recv__val[2][0+:1] = route_units__send__val[3][0+:1];
	assign output_units__recv__msg[0] = switch_units__send__msg[0];
	assign switch_units__send__rdy[0] = output_units__recv__rdy[0];
	assign output_units__recv__val[0] = switch_units__send__val[0];
	assign send__msg[106+:53] = output_units__send__msg[0];
	assign output_units__send__rdy[0] = send__rdy[2+:1];
	assign send__val[2+:1] = output_units__send__val[0];
	assign output_units__recv__msg[1] = switch_units__send__msg[1];
	assign switch_units__send__rdy[1] = output_units__recv__rdy[1];
	assign output_units__recv__val[1] = switch_units__send__val[1];
	assign send__msg[53+:53] = output_units__send__msg[1];
	assign output_units__send__rdy[1] = send__rdy[1+:1];
	assign send__val[1+:1] = output_units__send__val[1];
	assign output_units__recv__msg[2] = switch_units__send__msg[2];
	assign switch_units__send__rdy[2] = output_units__recv__rdy[2];
	assign output_units__recv__val[2] = switch_units__send__val[2];
	assign send__msg[0+:53] = output_units__send__msg[2];
	assign output_units__send__rdy[2] = send__rdy[0+:1];
	assign send__val[0+:1] = output_units__send__val[2];
endmodule
module Mux__Type_MemAccessPacket_3_4_128__d2e885ad92ecb31c__ninputs_2 (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [105:0] in_;
	output reg [52:0] out;
	input wire [0:0] reset;
	input wire [0:0] sel;
	always @(*) begin : up_mux
		out = in_[(1 - sel) * 53+:53];
	end
endmodule
module RegisterFile__d7db49d148735cf9 (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	output reg [52:0] rdata;
	input wire [0:0] reset;
	input wire [0:0] waddr;
	input wire [52:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [52:0] regs [0:1];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 53+:53] = regs[raddr[sv2v_cast_1(i)+:1]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i)+:1]] <= wdata[sv2v_cast_1(i) * 53+:53];
		end
	end
endmodule
module BypassQueueDpathRTL__ed203f02fe6e2575 (
	clk,
	mux_sel,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] mux_sel;
	input wire [0:0] raddr;
	input wire [52:0] recv_msg;
	input wire [0:0] reset;
	output wire [52:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] mux__clk;
	wire [105:0] mux__in_;
	wire [52:0] mux__out;
	wire [0:0] mux__reset;
	wire [0:0] mux__sel;
	Mux__Type_MemAccessPacket_3_4_128__d2e885ad92ecb31c__ninputs_2 mux(
		.clk(mux__clk),
		.in_(mux__in_),
		.out(mux__out),
		.reset(mux__reset),
		.sel(mux__sel)
	);
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [52:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [52:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__d7db49d148735cf9 rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:53] = recv_msg;
	assign mux__clk = clk;
	assign mux__reset = reset;
	assign mux__sel = mux_sel;
	assign mux__in_[53+:53] = rf__rdata[0+:53];
	assign mux__in_[0+:53] = recv_msg;
	assign send_msg = mux__out;
endmodule
module BypassQueueRTL__ed203f02fe6e2575 (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__mux_sel;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	BypassQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.mux_sel(ctrl__mux_sel),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__mux_sel;
	wire [0:0] dpath__raddr;
	wire [52:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [52:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	BypassQueueDpathRTL__ed203f02fe6e2575 dpath(
		.clk(dpath__clk),
		.mux_sel(dpath__mux_sel),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign dpath__mux_sel = ctrl__mux_sel;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign count = ctrl__count;
	assign dpath__recv_msg = recv__msg;
	assign send__msg = dpath__send_msg;
endmodule
module InputUnitRTL__6c9f5552096daf0d (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] queue__clk;
	wire [1:0] queue__count;
	wire [0:0] queue__reset;
	wire [52:0] queue__recv__msg;
	wire [0:0] queue__recv__rdy;
	wire [0:0] queue__recv__val;
	wire [52:0] queue__send__msg;
	wire [0:0] queue__send__rdy;
	wire [0:0] queue__send__val;
	BypassQueueRTL__ed203f02fe6e2575 queue(
		.clk(queue__clk),
		.count(queue__count),
		.reset(queue__reset),
		.recv__msg(queue__recv__msg),
		.recv__rdy(queue__recv__rdy),
		.recv__val(queue__recv__val),
		.send__msg(queue__send__msg),
		.send__rdy(queue__send__rdy),
		.send__val(queue__send__val)
	);
	assign queue__clk = clk;
	assign queue__reset = reset;
	assign queue__recv__msg = recv__msg;
	assign recv__rdy = queue__recv__rdy;
	assign queue__recv__val = recv__val;
	assign send__msg = queue__send__msg;
	assign queue__send__rdy = send__rdy;
	assign send__val = queue__send__val;
endmodule
module OutputUnitRTL__bd3139ab3632fd74 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	assign send__msg = recv__msg;
	assign recv__rdy = send__rdy;
	assign send__val = recv__val;
endmodule
module XbarRouteUnitRTL__3d381188eecf2ad5 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [52:0] recv__msg;
	output reg [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [211:0] send__msg;
	input wire [3:0] send__rdy;
	output reg [3:0] send__val;
	localparam [2:0] __const__num_outports_at_up_ru_routing = 3'd4;
	reg [1:0] out_dir;
	wire [3:0] send_val;
	always @(*) begin : up_ru_recv_rdy
		recv__rdy = send__rdy[3 - out_dir+:1] > 1'd0;
	end
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : up_ru_routing
		out_dir = recv__msg[50-:2];
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_up_ru_routing; i = i + 1'd1)
				send__val[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		if (recv__val)
			send__val[3 - out_dir+:1] = 1'd1;
	end
	assign send__msg[159+:53] = recv__msg;
	assign send_val[0:0] = send__val[3+:1];
	assign send__msg[106+:53] = recv__msg;
	assign send_val[1:1] = send__val[2+:1];
	assign send__msg[53+:53] = recv__msg;
	assign send_val[2:2] = send__val[1+:1];
	assign send__msg[0+:53] = recv__msg;
	assign send_val[3:3] = send__val[0+:1];
endmodule
module RegEnRst__Type_Bits3__reset_value_1 (
	clk,
	en,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	input wire [2:0] in_;
	output reg [2:0] out;
	input wire [0:0] reset;
	localparam [0:0] __const__reset_value_at_up_regenrst = 1'd1;
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(posedge clk) begin : up_regenrst
		if (reset)
			out <= sv2v_cast_3(__const__reset_value_at_up_regenrst);
		else if (en)
			out <= in_;
	end
endmodule
module RoundRobinArbiterEn__nreqs_3 (
	clk,
	en,
	grants,
	reqs,
	reset
);
	input wire [0:0] clk;
	input wire [0:0] en;
	output reg [2:0] grants;
	input wire [2:0] reqs;
	input wire [0:0] reset;
	localparam [1:0] __const__nreqs_at_comb_reqs_int = 2'd3;
	localparam [2:0] __const__nreqsX2_at_comb_reqs_int = 3'd6;
	localparam [1:0] __const__nreqs_at_comb_grants = 2'd3;
	localparam [1:0] __const__nreqs_at_comb_priority_int = 2'd3;
	localparam [2:0] __const__nreqsX2_at_comb_priority_int = 3'd6;
	localparam [2:0] __const__nreqsX2_at_comb_kills = 3'd6;
	localparam [2:0] __const__nreqsX2_at_comb_grants_int = 3'd6;
	reg [5:0] grants_int;
	reg [6:0] kills;
	reg [0:0] priority_en;
	reg [5:0] priority_int;
	reg [5:0] reqs_int;
	wire [0:0] priority_reg__clk;
	wire [0:0] priority_reg__en;
	wire [2:0] priority_reg__in_;
	wire [2:0] priority_reg__out;
	wire [0:0] priority_reg__reset;
	RegEnRst__Type_Bits3__reset_value_1 priority_reg(
		.clk(priority_reg__clk),
		.en(priority_reg__en),
		.in_(priority_reg__in_),
		.out(priority_reg__out),
		.reset(priority_reg__reset)
	);
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : comb_grants
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqs_at_comb_grants; i = i + 1'd1)
				grants[sv2v_cast_2(i)] = grants_int[sv2v_cast_3(i)] | grants_int[sv2v_cast_3(__const__nreqs_at_comb_grants) + sv2v_cast_3(i)];
		end
	end
	always @(*) begin : comb_grants_int
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_grants_int; i = i + 1'd1)
				if (priority_int[sv2v_cast_3(i)])
					grants_int[sv2v_cast_3(i)] = reqs_int[sv2v_cast_3(i)];
				else
					grants_int[sv2v_cast_3(i)] = ~kills[sv2v_cast_3(i)] & reqs_int[sv2v_cast_3(i)];
		end
	end
	always @(*) begin : comb_kills
		kills[3'd0] = 1'd1;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__nreqsX2_at_comb_kills; i = i + 1'd1)
				if (priority_int[sv2v_cast_3(i)])
					kills[sv2v_cast_3(i) + 3'd1] = reqs_int[sv2v_cast_3(i)];
				else
					kills[sv2v_cast_3(i) + 3'd1] = kills[sv2v_cast_3(i)] | (~kills[sv2v_cast_3(i)] & reqs_int[sv2v_cast_3(i)]);
		end
	end
	always @(*) begin : comb_priority_en
		priority_en = (grants != 3'd0) & en;
	end
	always @(*) begin : comb_priority_int
		priority_int[3'd2:3'd0] = priority_reg__out;
		priority_int[3'd5:sv2v_cast_3(__const__nreqs_at_comb_priority_int)] = 3'd0;
	end
	always @(*) begin : comb_reqs_int
		reqs_int[3'd2:3'd0] = reqs;
		reqs_int[3'd5:sv2v_cast_3(__const__nreqs_at_comb_reqs_int)] = reqs;
	end
	assign priority_reg__clk = clk;
	assign priority_reg__reset = reset;
	assign priority_reg__en = priority_en;
	assign priority_reg__in_[2:1] = grants[1:0];
	assign priority_reg__in_[0:0] = grants[2:2];
endmodule
module Encoder__in_nbits_3__out_nbits_2 (
	clk,
	in_,
	out,
	reset
);
	input wire [0:0] clk;
	input wire [2:0] in_;
	output reg [1:0] out;
	input wire [0:0] reset;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : encode
		out = 2'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < 2'd3; i = i + 1'd1)
				if (in_[sv2v_cast_2(i)])
					out = sv2v_cast_2(i);
		end
	end
endmodule
module Mux__Type_MemAccessPacket_3_4_128__d2e885ad92ecb31c__ninputs_3 (
	clk,
	in_,
	out,
	reset,
	sel
);
	input wire [0:0] clk;
	input wire [158:0] in_;
	output reg [52:0] out;
	input wire [0:0] reset;
	input wire [1:0] sel;
	always @(*) begin : up_mux
		out = in_[(2 - sel) * 53+:53];
	end
endmodule
module SwitchUnitRTL__1d80e2f7633297e5 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [158:0] recv__msg;
	output reg [2:0] recv__rdy;
	input wire [2:0] recv__val;
	output wire [52:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	localparam [1:0] __const__num_inports_at_up_get_en = 2'd3;
	wire [0:0] arbiter__clk;
	wire [0:0] arbiter__en;
	wire [2:0] arbiter__grants;
	wire [2:0] arbiter__reqs;
	wire [0:0] arbiter__reset;
	RoundRobinArbiterEn__nreqs_3 arbiter(
		.clk(arbiter__clk),
		.en(arbiter__en),
		.grants(arbiter__grants),
		.reqs(arbiter__reqs),
		.reset(arbiter__reset)
	);
	wire [0:0] encoder__clk;
	wire [2:0] encoder__in_;
	wire [1:0] encoder__out;
	wire [0:0] encoder__reset;
	Encoder__in_nbits_3__out_nbits_2 encoder(
		.clk(encoder__clk),
		.in_(encoder__in_),
		.out(encoder__out),
		.reset(encoder__reset)
	);
	wire [0:0] mux__clk;
	wire [158:0] mux__in_;
	wire [52:0] mux__out;
	wire [0:0] mux__reset;
	wire [1:0] mux__sel;
	Mux__Type_MemAccessPacket_3_4_128__d2e885ad92ecb31c__ninputs_3 mux(
		.clk(mux__clk),
		.in_(mux__in_),
		.out(mux__out),
		.reset(mux__reset),
		.sel(mux__sel)
	);
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : up_get_en
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_up_get_en; i = i + 1'd1)
				recv__rdy[2 - sv2v_cast_2(i)+:1] = send__rdy & (mux__sel == sv2v_cast_2(i));
		end
	end
	always @(*) begin : up_send_val
		send__val = arbiter__grants > 3'd0;
	end
	assign arbiter__clk = clk;
	assign arbiter__reset = reset;
	assign arbiter__en = 1'd1;
	assign mux__clk = clk;
	assign mux__reset = reset;
	assign send__msg = mux__out;
	assign encoder__clk = clk;
	assign encoder__reset = reset;
	assign encoder__in_ = arbiter__grants;
	assign mux__sel = encoder__out;
	assign arbiter__reqs[0:0] = recv__val[2+:1];
	assign mux__in_[106+:53] = recv__msg[106+:53];
	assign arbiter__reqs[1:1] = recv__val[1+:1];
	assign mux__in_[53+:53] = recv__msg[53+:53];
	assign arbiter__reqs[2:2] = recv__val[0+:1];
	assign mux__in_[0+:53] = recv__msg[0+:53];
endmodule
module XbarBypassQueueRTL__bc2d5635c510e13b (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [158:0] recv__msg;
	output wire [2:0] recv__rdy;
	input wire [2:0] recv__val;
	output wire [211:0] send__msg;
	input wire [3:0] send__rdy;
	output wire [3:0] send__val;
	wire [0:0] input_units__clk [0:2];
	wire [0:0] input_units__reset [0:2];
	wire [52:0] input_units__recv__msg [0:2];
	wire [0:0] input_units__recv__rdy [0:2];
	wire [0:0] input_units__recv__val [0:2];
	wire [52:0] input_units__send__msg [0:2];
	wire [0:0] input_units__send__rdy [0:2];
	wire [0:0] input_units__send__val [0:2];
	InputUnitRTL__6c9f5552096daf0d input_units__0(
		.clk(input_units__clk[0]),
		.reset(input_units__reset[0]),
		.recv__msg(input_units__recv__msg[0]),
		.recv__rdy(input_units__recv__rdy[0]),
		.recv__val(input_units__recv__val[0]),
		.send__msg(input_units__send__msg[0]),
		.send__rdy(input_units__send__rdy[0]),
		.send__val(input_units__send__val[0])
	);
	InputUnitRTL__6c9f5552096daf0d input_units__1(
		.clk(input_units__clk[1]),
		.reset(input_units__reset[1]),
		.recv__msg(input_units__recv__msg[1]),
		.recv__rdy(input_units__recv__rdy[1]),
		.recv__val(input_units__recv__val[1]),
		.send__msg(input_units__send__msg[1]),
		.send__rdy(input_units__send__rdy[1]),
		.send__val(input_units__send__val[1])
	);
	InputUnitRTL__6c9f5552096daf0d input_units__2(
		.clk(input_units__clk[2]),
		.reset(input_units__reset[2]),
		.recv__msg(input_units__recv__msg[2]),
		.recv__rdy(input_units__recv__rdy[2]),
		.recv__val(input_units__recv__val[2]),
		.send__msg(input_units__send__msg[2]),
		.send__rdy(input_units__send__rdy[2]),
		.send__val(input_units__send__val[2])
	);
	wire [0:0] output_units__clk [0:3];
	wire [0:0] output_units__reset [0:3];
	wire [52:0] output_units__recv__msg [0:3];
	wire [0:0] output_units__recv__rdy [0:3];
	wire [0:0] output_units__recv__val [0:3];
	wire [52:0] output_units__send__msg [0:3];
	wire [0:0] output_units__send__rdy [0:3];
	wire [0:0] output_units__send__val [0:3];
	OutputUnitRTL__bd3139ab3632fd74 output_units__0(
		.clk(output_units__clk[0]),
		.reset(output_units__reset[0]),
		.recv__msg(output_units__recv__msg[0]),
		.recv__rdy(output_units__recv__rdy[0]),
		.recv__val(output_units__recv__val[0]),
		.send__msg(output_units__send__msg[0]),
		.send__rdy(output_units__send__rdy[0]),
		.send__val(output_units__send__val[0])
	);
	OutputUnitRTL__bd3139ab3632fd74 output_units__1(
		.clk(output_units__clk[1]),
		.reset(output_units__reset[1]),
		.recv__msg(output_units__recv__msg[1]),
		.recv__rdy(output_units__recv__rdy[1]),
		.recv__val(output_units__recv__val[1]),
		.send__msg(output_units__send__msg[1]),
		.send__rdy(output_units__send__rdy[1]),
		.send__val(output_units__send__val[1])
	);
	OutputUnitRTL__bd3139ab3632fd74 output_units__2(
		.clk(output_units__clk[2]),
		.reset(output_units__reset[2]),
		.recv__msg(output_units__recv__msg[2]),
		.recv__rdy(output_units__recv__rdy[2]),
		.recv__val(output_units__recv__val[2]),
		.send__msg(output_units__send__msg[2]),
		.send__rdy(output_units__send__rdy[2]),
		.send__val(output_units__send__val[2])
	);
	OutputUnitRTL__bd3139ab3632fd74 output_units__3(
		.clk(output_units__clk[3]),
		.reset(output_units__reset[3]),
		.recv__msg(output_units__recv__msg[3]),
		.recv__rdy(output_units__recv__rdy[3]),
		.recv__val(output_units__recv__val[3]),
		.send__msg(output_units__send__msg[3]),
		.send__rdy(output_units__send__rdy[3]),
		.send__val(output_units__send__val[3])
	);
	wire [0:0] route_units__clk [0:2];
	wire [0:0] route_units__reset [0:2];
	wire [52:0] route_units__recv__msg [0:2];
	wire [0:0] route_units__recv__rdy [0:2];
	wire [0:0] route_units__recv__val [0:2];
	wire [211:0] route_units__send__msg [0:2];
	wire [3:0] route_units__send__rdy [0:2];
	wire [3:0] route_units__send__val [0:2];
	XbarRouteUnitRTL__3d381188eecf2ad5 route_units__0(
		.clk(route_units__clk[0]),
		.reset(route_units__reset[0]),
		.recv__msg(route_units__recv__msg[0]),
		.recv__rdy(route_units__recv__rdy[0]),
		.recv__val(route_units__recv__val[0]),
		.send__msg(route_units__send__msg[0]),
		.send__rdy(route_units__send__rdy[0]),
		.send__val(route_units__send__val[0])
	);
	XbarRouteUnitRTL__3d381188eecf2ad5 route_units__1(
		.clk(route_units__clk[1]),
		.reset(route_units__reset[1]),
		.recv__msg(route_units__recv__msg[1]),
		.recv__rdy(route_units__recv__rdy[1]),
		.recv__val(route_units__recv__val[1]),
		.send__msg(route_units__send__msg[1]),
		.send__rdy(route_units__send__rdy[1]),
		.send__val(route_units__send__val[1])
	);
	XbarRouteUnitRTL__3d381188eecf2ad5 route_units__2(
		.clk(route_units__clk[2]),
		.reset(route_units__reset[2]),
		.recv__msg(route_units__recv__msg[2]),
		.recv__rdy(route_units__recv__rdy[2]),
		.recv__val(route_units__recv__val[2]),
		.send__msg(route_units__send__msg[2]),
		.send__rdy(route_units__send__rdy[2]),
		.send__val(route_units__send__val[2])
	);
	wire [0:0] switch_units__clk [0:3];
	wire [0:0] switch_units__reset [0:3];
	wire [158:0] switch_units__recv__msg [0:3];
	wire [2:0] switch_units__recv__rdy [0:3];
	wire [2:0] switch_units__recv__val [0:3];
	wire [52:0] switch_units__send__msg [0:3];
	wire [0:0] switch_units__send__rdy [0:3];
	wire [0:0] switch_units__send__val [0:3];
	SwitchUnitRTL__1d80e2f7633297e5 switch_units__0(
		.clk(switch_units__clk[0]),
		.reset(switch_units__reset[0]),
		.recv__msg(switch_units__recv__msg[0]),
		.recv__rdy(switch_units__recv__rdy[0]),
		.recv__val(switch_units__recv__val[0]),
		.send__msg(switch_units__send__msg[0]),
		.send__rdy(switch_units__send__rdy[0]),
		.send__val(switch_units__send__val[0])
	);
	SwitchUnitRTL__1d80e2f7633297e5 switch_units__1(
		.clk(switch_units__clk[1]),
		.reset(switch_units__reset[1]),
		.recv__msg(switch_units__recv__msg[1]),
		.recv__rdy(switch_units__recv__rdy[1]),
		.recv__val(switch_units__recv__val[1]),
		.send__msg(switch_units__send__msg[1]),
		.send__rdy(switch_units__send__rdy[1]),
		.send__val(switch_units__send__val[1])
	);
	SwitchUnitRTL__1d80e2f7633297e5 switch_units__2(
		.clk(switch_units__clk[2]),
		.reset(switch_units__reset[2]),
		.recv__msg(switch_units__recv__msg[2]),
		.recv__rdy(switch_units__recv__rdy[2]),
		.recv__val(switch_units__recv__val[2]),
		.send__msg(switch_units__send__msg[2]),
		.send__rdy(switch_units__send__rdy[2]),
		.send__val(switch_units__send__val[2])
	);
	SwitchUnitRTL__1d80e2f7633297e5 switch_units__3(
		.clk(switch_units__clk[3]),
		.reset(switch_units__reset[3]),
		.recv__msg(switch_units__recv__msg[3]),
		.recv__rdy(switch_units__recv__rdy[3]),
		.recv__val(switch_units__recv__val[3]),
		.send__msg(switch_units__send__msg[3]),
		.send__rdy(switch_units__send__rdy[3]),
		.send__val(switch_units__send__val[3])
	);
	assign input_units__clk[0] = clk;
	assign input_units__reset[0] = reset;
	assign input_units__clk[1] = clk;
	assign input_units__reset[1] = reset;
	assign input_units__clk[2] = clk;
	assign input_units__reset[2] = reset;
	assign route_units__clk[0] = clk;
	assign route_units__reset[0] = reset;
	assign route_units__clk[1] = clk;
	assign route_units__reset[1] = reset;
	assign route_units__clk[2] = clk;
	assign route_units__reset[2] = reset;
	assign switch_units__clk[0] = clk;
	assign switch_units__reset[0] = reset;
	assign switch_units__clk[1] = clk;
	assign switch_units__reset[1] = reset;
	assign switch_units__clk[2] = clk;
	assign switch_units__reset[2] = reset;
	assign switch_units__clk[3] = clk;
	assign switch_units__reset[3] = reset;
	assign output_units__clk[0] = clk;
	assign output_units__reset[0] = reset;
	assign output_units__clk[1] = clk;
	assign output_units__reset[1] = reset;
	assign output_units__clk[2] = clk;
	assign output_units__reset[2] = reset;
	assign output_units__clk[3] = clk;
	assign output_units__reset[3] = reset;
	assign input_units__recv__msg[0] = recv__msg[106+:53];
	assign recv__rdy[2+:1] = input_units__recv__rdy[0];
	assign input_units__recv__val[0] = recv__val[2+:1];
	assign route_units__recv__msg[0] = input_units__send__msg[0];
	assign input_units__send__rdy[0] = route_units__recv__rdy[0];
	assign route_units__recv__val[0] = input_units__send__val[0];
	assign input_units__recv__msg[1] = recv__msg[53+:53];
	assign recv__rdy[1+:1] = input_units__recv__rdy[1];
	assign input_units__recv__val[1] = recv__val[1+:1];
	assign route_units__recv__msg[1] = input_units__send__msg[1];
	assign input_units__send__rdy[1] = route_units__recv__rdy[1];
	assign route_units__recv__val[1] = input_units__send__val[1];
	assign input_units__recv__msg[2] = recv__msg[0+:53];
	assign recv__rdy[0+:1] = input_units__recv__rdy[2];
	assign input_units__recv__val[2] = recv__val[0+:1];
	assign route_units__recv__msg[2] = input_units__send__msg[2];
	assign input_units__send__rdy[2] = route_units__recv__rdy[2];
	assign route_units__recv__val[2] = input_units__send__val[2];
	assign switch_units__recv__msg[0][106+:53] = route_units__send__msg[0][159+:53];
	assign route_units__send__rdy[0][3+:1] = switch_units__recv__rdy[0][2+:1];
	assign switch_units__recv__val[0][2+:1] = route_units__send__val[0][3+:1];
	assign switch_units__recv__msg[1][106+:53] = route_units__send__msg[0][106+:53];
	assign route_units__send__rdy[0][2+:1] = switch_units__recv__rdy[1][2+:1];
	assign switch_units__recv__val[1][2+:1] = route_units__send__val[0][2+:1];
	assign switch_units__recv__msg[2][106+:53] = route_units__send__msg[0][53+:53];
	assign route_units__send__rdy[0][1+:1] = switch_units__recv__rdy[2][2+:1];
	assign switch_units__recv__val[2][2+:1] = route_units__send__val[0][1+:1];
	assign switch_units__recv__msg[3][106+:53] = route_units__send__msg[0][0+:53];
	assign route_units__send__rdy[0][0+:1] = switch_units__recv__rdy[3][2+:1];
	assign switch_units__recv__val[3][2+:1] = route_units__send__val[0][0+:1];
	assign switch_units__recv__msg[0][53+:53] = route_units__send__msg[1][159+:53];
	assign route_units__send__rdy[1][3+:1] = switch_units__recv__rdy[0][1+:1];
	assign switch_units__recv__val[0][1+:1] = route_units__send__val[1][3+:1];
	assign switch_units__recv__msg[1][53+:53] = route_units__send__msg[1][106+:53];
	assign route_units__send__rdy[1][2+:1] = switch_units__recv__rdy[1][1+:1];
	assign switch_units__recv__val[1][1+:1] = route_units__send__val[1][2+:1];
	assign switch_units__recv__msg[2][53+:53] = route_units__send__msg[1][53+:53];
	assign route_units__send__rdy[1][1+:1] = switch_units__recv__rdy[2][1+:1];
	assign switch_units__recv__val[2][1+:1] = route_units__send__val[1][1+:1];
	assign switch_units__recv__msg[3][53+:53] = route_units__send__msg[1][0+:53];
	assign route_units__send__rdy[1][0+:1] = switch_units__recv__rdy[3][1+:1];
	assign switch_units__recv__val[3][1+:1] = route_units__send__val[1][0+:1];
	assign switch_units__recv__msg[0][0+:53] = route_units__send__msg[2][159+:53];
	assign route_units__send__rdy[2][3+:1] = switch_units__recv__rdy[0][0+:1];
	assign switch_units__recv__val[0][0+:1] = route_units__send__val[2][3+:1];
	assign switch_units__recv__msg[1][0+:53] = route_units__send__msg[2][106+:53];
	assign route_units__send__rdy[2][2+:1] = switch_units__recv__rdy[1][0+:1];
	assign switch_units__recv__val[1][0+:1] = route_units__send__val[2][2+:1];
	assign switch_units__recv__msg[2][0+:53] = route_units__send__msg[2][53+:53];
	assign route_units__send__rdy[2][1+:1] = switch_units__recv__rdy[2][0+:1];
	assign switch_units__recv__val[2][0+:1] = route_units__send__val[2][1+:1];
	assign switch_units__recv__msg[3][0+:53] = route_units__send__msg[2][0+:53];
	assign route_units__send__rdy[2][0+:1] = switch_units__recv__rdy[3][0+:1];
	assign switch_units__recv__val[3][0+:1] = route_units__send__val[2][0+:1];
	assign output_units__recv__msg[0] = switch_units__send__msg[0];
	assign switch_units__send__rdy[0] = output_units__recv__rdy[0];
	assign output_units__recv__val[0] = switch_units__send__val[0];
	assign send__msg[159+:53] = output_units__send__msg[0];
	assign output_units__send__rdy[0] = send__rdy[3+:1];
	assign send__val[3+:1] = output_units__send__val[0];
	assign output_units__recv__msg[1] = switch_units__send__msg[1];
	assign switch_units__send__rdy[1] = output_units__recv__rdy[1];
	assign output_units__recv__val[1] = switch_units__send__val[1];
	assign send__msg[106+:53] = output_units__send__msg[1];
	assign output_units__send__rdy[1] = send__rdy[2+:1];
	assign send__val[2+:1] = output_units__send__val[1];
	assign output_units__recv__msg[2] = switch_units__send__msg[2];
	assign switch_units__send__rdy[2] = output_units__recv__rdy[2];
	assign output_units__recv__val[2] = switch_units__send__val[2];
	assign send__msg[53+:53] = output_units__send__msg[2];
	assign output_units__send__rdy[2] = send__rdy[1+:1];
	assign send__val[1+:1] = output_units__send__val[2];
	assign output_units__recv__msg[3] = switch_units__send__msg[3];
	assign switch_units__send__rdy[3] = output_units__recv__rdy[3];
	assign output_units__recv__val[3] = switch_units__send__val[3];
	assign send__msg[0+:53] = output_units__send__msg[3];
	assign output_units__send__rdy[3] = send__rdy[0+:1];
	assign send__val[0+:1] = output_units__send__val[3];
endmodule
module DataMemControllerRTL__855c64d5103d1825 (
	address_lower,
	address_upper,
	cgra_id,
	clk,
	reset,
	recv_from_controller_spm_rd_req__msg,
	recv_from_controller_spm_rd_req__rdy,
	recv_from_controller_spm_rd_req__val,
	recv_from_controller_spm_wr_req__msg,
	recv_from_controller_spm_wr_req__rdy,
	recv_from_controller_spm_wr_req__val,
	recv_from_noc_load_request__msg,
	recv_from_noc_load_request__rdy,
	recv_from_noc_load_request__val,
	recv_from_noc_load_response_pkt__msg,
	recv_from_noc_load_response_pkt__rdy,
	recv_from_noc_load_response_pkt__val,
	recv_from_noc_store_request__msg,
	recv_from_noc_store_request__rdy,
	recv_from_noc_store_request__val,
	recv_raddr__msg,
	recv_raddr__rdy,
	recv_raddr__val,
	recv_waddr__msg,
	recv_waddr__rdy,
	recv_waddr__val,
	recv_wdata__msg,
	recv_wdata__rdy,
	recv_wdata__val,
	send_rdata__msg,
	send_rdata__rdy,
	send_rdata__val,
	send_to_controller_spm_rd_resp__msg,
	send_to_controller_spm_rd_resp__rdy,
	send_to_controller_spm_rd_resp__val,
	send_to_noc_load_request_pkt__msg,
	send_to_noc_load_request_pkt__rdy,
	send_to_noc_load_request_pkt__val,
	send_to_noc_load_response_pkt__msg,
	send_to_noc_load_response_pkt__rdy,
	send_to_noc_load_response_pkt__val,
	send_to_noc_store_pkt__msg,
	send_to_noc_store_pkt__rdy,
	send_to_noc_store_pkt__val
);
	input wire [6:0] address_lower;
	input wire [6:0] address_upper;
	input wire [1:0] cgra_id;
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [31:0] recv_from_controller_spm_rd_req__msg;
	output reg [0:0] recv_from_controller_spm_rd_req__rdy;
	input wire [0:0] recv_from_controller_spm_rd_req__val;
	input wire [67:0] recv_from_controller_spm_wr_req__msg;
	output reg [0:0] recv_from_controller_spm_wr_req__rdy;
	input wire [0:0] recv_from_controller_spm_wr_req__val;
	input wire [201:0] recv_from_noc_load_request__msg;
	output reg [0:0] recv_from_noc_load_request__rdy;
	input wire [0:0] recv_from_noc_load_request__val;
	input wire [201:0] recv_from_noc_load_response_pkt__msg;
	output reg [0:0] recv_from_noc_load_response_pkt__rdy;
	input wire [0:0] recv_from_noc_load_response_pkt__val;
	input wire [201:0] recv_from_noc_store_request__msg;
	output reg [0:0] recv_from_noc_store_request__rdy;
	input wire [0:0] recv_from_noc_store_request__val;
	input wire [20:0] recv_raddr__msg;
	output reg [2:0] recv_raddr__rdy;
	input wire [2:0] recv_raddr__val;
	input wire [20:0] recv_waddr__msg;
	output reg [2:0] recv_waddr__rdy;
	input wire [2:0] recv_waddr__val;
	input wire [104:0] recv_wdata__msg;
	output reg [2:0] recv_wdata__rdy;
	input wire [2:0] recv_wdata__val;
	output reg [104:0] send_rdata__msg;
	input wire [2:0] send_rdata__rdy;
	output reg [2:0] send_rdata__val;
	output reg [31:0] send_to_controller_spm_rd_resp__msg;
	input wire [0:0] send_to_controller_spm_rd_resp__rdy;
	output reg [0:0] send_to_controller_spm_rd_resp__val;
	output reg [201:0] send_to_noc_load_request_pkt__msg;
	input wire [0:0] send_to_noc_load_request_pkt__rdy;
	output reg [0:0] send_to_noc_load_request_pkt__val;
	output reg [201:0] send_to_noc_load_response_pkt__msg;
	input wire [0:0] send_to_noc_load_response_pkt__rdy;
	output reg [0:0] send_to_noc_load_response_pkt__val;
	output reg [201:0] send_to_noc_store_pkt__msg;
	input wire [0:0] send_to_noc_store_pkt__rdy;
	output reg [0:0] send_to_noc_store_pkt__val;
	localparam [2:0] __const__num_xbar_in_rd_ports_at_assemble_xbar_pkt = 3'd4;
	localparam [2:0] __const__num_xbar_in_wr_ports_at_assemble_xbar_pkt = 3'd4;
	localparam [1:0] __const__num_rd_tiles_at_assemble_xbar_pkt = 2'd3;
	localparam [2:0] __const__per_bank_addr_nbits_at_assemble_xbar_pkt = 3'd4;
	localparam [1:0] __const__num_banks_per_cgra_at_assemble_xbar_pkt = 2'd2;
	localparam [1:0] __const__num_wr_tiles_at_assemble_xbar_pkt = 2'd3;
	localparam [0:0] __const__has_dma_ports_at_assemble_xbar_pkt = 1'd0;
	localparam [1:0] __const__num_rd_tiles_at_update_all = 2'd3;
	localparam [1:0] __const__num_wr_tiles_at_update_all = 2'd3;
	localparam [2:0] __const__num_xbar_in_rd_ports_at_update_all = 3'd4;
	localparam [2:0] __const__num_xbar_in_wr_ports_at_update_all = 3'd4;
	localparam [0:0] __const__has_dma_ports_at_update_all = 1'd0;
	localparam [3:0] __const__CMD_LOAD_RESPONSE = 4'd11;
	localparam [1:0] __const__num_banks_per_cgra_at_update_all = 2'd2;
	localparam [3:0] __const__CMD_LOAD_REQUEST = 4'd10;
	localparam [3:0] __const__CMD_STORE_REQUEST = 4'd12;
	wire [1:0] idTo2d_x_lut [0:3];
	wire [0:0] idTo2d_y_lut [0:3];
	reg [52:0] rd_pkt [0:3];
	reg [52:0] wr_pkt [0:3];
	wire [0:0] memory_wrapper__clk [0:1];
	wire [0:0] memory_wrapper__reset [0:1];
	wire [52:0] memory_wrapper__recv_rd__msg [0:1];
	wire [0:0] memory_wrapper__recv_rd__rdy [0:1];
	wire [0:0] memory_wrapper__recv_rd__val [0:1];
	wire [52:0] memory_wrapper__recv_wr__msg [0:1];
	wire [0:0] memory_wrapper__recv_wr__rdy [0:1];
	wire [0:0] memory_wrapper__recv_wr__val [0:1];
	wire [52:0] memory_wrapper__send__msg [0:1];
	wire [0:0] memory_wrapper__send__rdy [0:1];
	wire [0:0] memory_wrapper__send__val [0:1];
	DataMemWrapperRTL__d40387976026818a memory_wrapper__0(
		.clk(memory_wrapper__clk[0]),
		.reset(memory_wrapper__reset[0]),
		.recv_rd__msg(memory_wrapper__recv_rd__msg[0]),
		.recv_rd__rdy(memory_wrapper__recv_rd__rdy[0]),
		.recv_rd__val(memory_wrapper__recv_rd__val[0]),
		.recv_wr__msg(memory_wrapper__recv_wr__msg[0]),
		.recv_wr__rdy(memory_wrapper__recv_wr__rdy[0]),
		.recv_wr__val(memory_wrapper__recv_wr__val[0]),
		.send__msg(memory_wrapper__send__msg[0]),
		.send__rdy(memory_wrapper__send__rdy[0]),
		.send__val(memory_wrapper__send__val[0])
	);
	DataMemWrapperRTL__d40387976026818a memory_wrapper__1(
		.clk(memory_wrapper__clk[1]),
		.reset(memory_wrapper__reset[1]),
		.recv_rd__msg(memory_wrapper__recv_rd__msg[1]),
		.recv_rd__rdy(memory_wrapper__recv_rd__rdy[1]),
		.recv_rd__val(memory_wrapper__recv_rd__val[1]),
		.recv_wr__msg(memory_wrapper__recv_wr__msg[1]),
		.recv_wr__rdy(memory_wrapper__recv_wr__rdy[1]),
		.recv_wr__val(memory_wrapper__recv_wr__val[1]),
		.send__msg(memory_wrapper__send__msg[1]),
		.send__rdy(memory_wrapper__send__rdy[1]),
		.send__val(memory_wrapper__send__val[1])
	);
	wire [0:0] read_crossbar__clk;
	wire [0:0] read_crossbar__reset;
	reg [211:0] read_crossbar__recv__msg;
	wire [3:0] read_crossbar__recv__rdy;
	reg [3:0] read_crossbar__recv__val;
	wire [158:0] read_crossbar__send__msg;
	reg [2:0] read_crossbar__send__rdy;
	wire [2:0] read_crossbar__send__val;
	XbarBypassQueueRTL__0de4e0c11bc743cb read_crossbar(
		.clk(read_crossbar__clk),
		.reset(read_crossbar__reset),
		.recv__msg(read_crossbar__recv__msg),
		.recv__rdy(read_crossbar__recv__rdy),
		.recv__val(read_crossbar__recv__val),
		.send__msg(read_crossbar__send__msg),
		.send__rdy(read_crossbar__send__rdy),
		.send__val(read_crossbar__send__val)
	);
	wire [0:0] response_crossbar__clk;
	wire [0:0] response_crossbar__reset;
	reg [158:0] response_crossbar__recv__msg;
	wire [2:0] response_crossbar__recv__rdy;
	reg [2:0] response_crossbar__recv__val;
	wire [211:0] response_crossbar__send__msg;
	reg [3:0] response_crossbar__send__rdy;
	wire [3:0] response_crossbar__send__val;
	XbarBypassQueueRTL__bc2d5635c510e13b response_crossbar(
		.clk(response_crossbar__clk),
		.reset(response_crossbar__reset),
		.recv__msg(response_crossbar__recv__msg),
		.recv__rdy(response_crossbar__recv__rdy),
		.recv__val(response_crossbar__recv__val),
		.send__msg(response_crossbar__send__msg),
		.send__rdy(response_crossbar__send__rdy),
		.send__val(response_crossbar__send__val)
	);
	wire [0:0] write_crossbar__clk;
	wire [0:0] write_crossbar__reset;
	reg [211:0] write_crossbar__recv__msg;
	wire [3:0] write_crossbar__recv__rdy;
	reg [3:0] write_crossbar__recv__val;
	wire [158:0] write_crossbar__send__msg;
	reg [2:0] write_crossbar__send__rdy;
	wire [2:0] write_crossbar__send__val;
	XbarBypassQueueRTL__0de4e0c11bc743cb write_crossbar(
		.clk(write_crossbar__clk),
		.reset(write_crossbar__reset),
		.recv__msg(write_crossbar__recv__msg),
		.recv__rdy(write_crossbar__recv__rdy),
		.recv__val(write_crossbar__recv__val),
		.send__msg(write_crossbar__send__msg),
		.send__rdy(write_crossbar__send__rdy),
		.send__val(write_crossbar__send__val)
	);
	reg [6:0] __tmpvar__assemble_xbar_pkt_recv_raddr;
	reg [1:0] __tmpvar__assemble_xbar_pkt_bank_index_load_local;
	reg [6:0] __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc;
	reg [1:0] __tmpvar__assemble_xbar_pkt_bank_index_load_from_noc;
	reg [6:0] __tmpvar__assemble_xbar_pkt_recv_waddr;
	reg [1:0] __tmpvar__assemble_xbar_pkt_bank_index_store_local;
	reg [6:0] __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc;
	reg [34:0] __tmpvar__assemble_xbar_pkt_recv_wdata_from_noc;
	reg [1:0] __tmpvar__assemble_xbar_pkt_bank_index_store_from_noc;
	reg [1:0] __tmpvar__assemble_xbar_pkt_dma_rd_idx;
	reg [1:0] __tmpvar__assemble_xbar_pkt_dma_wr_idx;
	reg [6:0] __tmpvar__assemble_xbar_pkt_recv_raddr_from_dma;
	reg [1:0] __tmpvar__assemble_xbar_pkt_bank_index_load_from_dma;
	reg [6:0] __tmpvar__assemble_xbar_pkt_recv_waddr_from_dma;
	reg [1:0] __tmpvar__assemble_xbar_pkt_bank_index_store_from_dma;
	reg [1:0] __tmpvar__update_all_dma_rd_idx;
	reg [1:0] __tmpvar__update_all_dma_wr_idx;
	reg [1:0] __tmpvar__update_all_from_cgra_id;
	reg [2:0] __tmpvar__update_all_from_tile_id;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [6:0] sv2v_cast_7;
		input reg [6:0] inp;
		sv2v_cast_7 = inp;
	endfunction
	always @(*) begin : assemble_xbar_pkt
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_xbar_in_rd_ports_at_assemble_xbar_pkt; i = i + 1'd1)
				rd_pkt[sv2v_cast_2(i)] = {sv2v_cast_2(i), 2'd0, 7'd0, 35'h000000000, 2'd0, 3'd0, 2'd0};
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_xbar_in_wr_ports_at_assemble_xbar_pkt; i = i + 1'd1)
				wr_pkt[sv2v_cast_2(i)] = {sv2v_cast_2(i), 2'd0, 7'd0, 35'h000000000, 2'd0, 3'd0, 2'd0};
		end
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_rd_tiles_at_assemble_xbar_pkt; i = i + 1'd1)
				begin
					__tmpvar__assemble_xbar_pkt_recv_raddr = recv_raddr__msg[(2 - sv2v_cast_2(i)) * 7+:7];
					if ((__tmpvar__assemble_xbar_pkt_recv_raddr >= address_lower) & (__tmpvar__assemble_xbar_pkt_recv_raddr <= address_upper))
						__tmpvar__assemble_xbar_pkt_bank_index_load_local = sv2v_cast_2((__tmpvar__assemble_xbar_pkt_recv_raddr - address_lower) >> __const__per_bank_addr_nbits_at_assemble_xbar_pkt);
					else
						__tmpvar__assemble_xbar_pkt_bank_index_load_local = 2'd2;
					rd_pkt[sv2v_cast_2(i)] = {sv2v_cast_2(i), __tmpvar__assemble_xbar_pkt_bank_index_load_local, __tmpvar__assemble_xbar_pkt_recv_raddr, 35'h000000000, cgra_id, 3'd0, sv2v_cast_2(i)};
				end
		end
		__tmpvar__assemble_xbar_pkt_recv_raddr_from_noc = recv_from_noc_load_request__msg[132-:7];
		if ((__tmpvar__assemble_xbar_pkt_recv_raddr_from_noc >= address_lower) & (__tmpvar__assemble_xbar_pkt_recv_raddr_from_noc <= address_upper))
			__tmpvar__assemble_xbar_pkt_bank_index_load_from_noc = sv2v_cast_2((__tmpvar__assemble_xbar_pkt_recv_raddr_from_noc - address_lower) >> __const__per_bank_addr_nbits_at_assemble_xbar_pkt);
		else
			__tmpvar__assemble_xbar_pkt_bank_index_load_from_noc = 2'd2;
		rd_pkt[__const__num_rd_tiles_at_assemble_xbar_pkt] = {__const__num_rd_tiles_at_assemble_xbar_pkt, __tmpvar__assemble_xbar_pkt_bank_index_load_from_noc, __tmpvar__assemble_xbar_pkt_recv_raddr_from_noc, 35'h000000000, recv_from_noc_load_request__msg[201-:2], recv_from_noc_load_request__msg[191-:3], recv_from_noc_load_request__msg[185-:2]};
		begin : sv2v_autoblock_4
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_wr_tiles_at_assemble_xbar_pkt; i = i + 1'd1)
				begin
					__tmpvar__assemble_xbar_pkt_recv_waddr = recv_waddr__msg[(2 - sv2v_cast_2(i)) * 7+:7];
					if ((__tmpvar__assemble_xbar_pkt_recv_waddr >= address_lower) & (__tmpvar__assemble_xbar_pkt_recv_waddr <= address_upper))
						__tmpvar__assemble_xbar_pkt_bank_index_store_local = sv2v_cast_2((__tmpvar__assemble_xbar_pkt_recv_waddr - address_lower) >> __const__per_bank_addr_nbits_at_assemble_xbar_pkt);
					else
						__tmpvar__assemble_xbar_pkt_bank_index_store_local = 2'd2;
					wr_pkt[sv2v_cast_2(i)] = {sv2v_cast_2(i), __tmpvar__assemble_xbar_pkt_bank_index_store_local, __tmpvar__assemble_xbar_pkt_recv_waddr, recv_wdata__msg[(2 - sv2v_cast_2(i)) * 35+:35], 2'd0, 3'd0, sv2v_cast_2(i)};
				end
		end
		__tmpvar__assemble_xbar_pkt_recv_waddr_from_noc = recv_from_noc_store_request__msg[132-:7];
		__tmpvar__assemble_xbar_pkt_recv_wdata_from_noc = recv_from_noc_store_request__msg[167-:35];
		if ((__tmpvar__assemble_xbar_pkt_recv_waddr_from_noc >= address_lower) & (__tmpvar__assemble_xbar_pkt_recv_waddr_from_noc <= address_upper))
			__tmpvar__assemble_xbar_pkt_bank_index_store_from_noc = sv2v_cast_2((__tmpvar__assemble_xbar_pkt_recv_waddr_from_noc - address_lower) >> __const__per_bank_addr_nbits_at_assemble_xbar_pkt);
		else
			__tmpvar__assemble_xbar_pkt_bank_index_store_from_noc = 2'd2;
		wr_pkt[__const__num_wr_tiles_at_assemble_xbar_pkt] = {__const__num_wr_tiles_at_assemble_xbar_pkt, __tmpvar__assemble_xbar_pkt_bank_index_store_from_noc, __tmpvar__assemble_xbar_pkt_recv_waddr_from_noc, __tmpvar__assemble_xbar_pkt_recv_wdata_from_noc, 2'd0, 3'd0, __const__num_wr_tiles_at_assemble_xbar_pkt};
		if (__const__has_dma_ports_at_assemble_xbar_pkt) begin
			__tmpvar__assemble_xbar_pkt_dma_rd_idx = 2'd3;
			__tmpvar__assemble_xbar_pkt_dma_wr_idx = 2'd3;
			__tmpvar__assemble_xbar_pkt_recv_raddr_from_dma = sv2v_cast_7(recv_from_controller_spm_rd_req__msg[31-:32]);
			if ((__tmpvar__assemble_xbar_pkt_recv_raddr_from_dma >= address_lower) & (__tmpvar__assemble_xbar_pkt_recv_raddr_from_dma <= address_upper))
				__tmpvar__assemble_xbar_pkt_bank_index_load_from_dma = sv2v_cast_2((__tmpvar__assemble_xbar_pkt_recv_raddr_from_dma - address_lower) >> __const__per_bank_addr_nbits_at_assemble_xbar_pkt);
			else
				__tmpvar__assemble_xbar_pkt_bank_index_load_from_dma = 2'd2;
			rd_pkt[__tmpvar__assemble_xbar_pkt_dma_rd_idx] = {__tmpvar__assemble_xbar_pkt_dma_rd_idx, __tmpvar__assemble_xbar_pkt_bank_index_load_from_dma, __tmpvar__assemble_xbar_pkt_recv_raddr_from_dma, 35'h000000000, cgra_id, 3'd0, 2'd0};
			__tmpvar__assemble_xbar_pkt_recv_waddr_from_dma = sv2v_cast_7(recv_from_controller_spm_wr_req__msg[67-:32]);
			if ((__tmpvar__assemble_xbar_pkt_recv_waddr_from_dma >= address_lower) & (__tmpvar__assemble_xbar_pkt_recv_waddr_from_dma <= address_upper))
				__tmpvar__assemble_xbar_pkt_bank_index_store_from_dma = sv2v_cast_2((__tmpvar__assemble_xbar_pkt_recv_waddr_from_dma - address_lower) >> __const__per_bank_addr_nbits_at_assemble_xbar_pkt);
			else
				__tmpvar__assemble_xbar_pkt_bank_index_store_from_dma = 2'd2;
			wr_pkt[__tmpvar__assemble_xbar_pkt_dma_wr_idx] = {__tmpvar__assemble_xbar_pkt_dma_wr_idx, __tmpvar__assemble_xbar_pkt_bank_index_store_from_dma, __tmpvar__assemble_xbar_pkt_recv_waddr_from_dma, {recv_from_controller_spm_wr_req__msg[35-:32], 1'd1, 1'd0, 1'd0}, 2'd0, 3'd0, 2'd0};
		end
	end
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin : update_all
		begin : sv2v_autoblock_5
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_rd_tiles_at_update_all; i = i + 1'd1)
				recv_raddr__rdy[2 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		recv_from_noc_load_request__rdy = 1'd0;
		begin : sv2v_autoblock_6
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_wr_tiles_at_update_all; i = i + 1'd1)
				recv_waddr__rdy[2 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		recv_from_noc_store_request__rdy = 1'd0;
		begin : sv2v_autoblock_7
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_rd_tiles_at_update_all; i = i + 1'd1)
				begin
					send_rdata__val[2 - sv2v_cast_2(i)+:1] = 1'd0;
					send_rdata__msg[(2 - sv2v_cast_2(i)) * 35+:35] = 35'h000000000;
				end
		end
		send_to_noc_load_response_pkt__val = 1'd0;
		send_to_noc_load_response_pkt__msg = 202'h000000000000000000000000000000000000000000000000000;
		begin : sv2v_autoblock_8
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_wr_tiles_at_update_all; i = i + 1'd1)
				recv_wdata__rdy[2 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		send_to_noc_store_pkt__msg = 202'h000000000000000000000000000000000000000000000000000;
		send_to_noc_store_pkt__val = 1'd0;
		begin : sv2v_autoblock_9
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_xbar_in_rd_ports_at_update_all; i = i + 1'd1)
				begin
					read_crossbar__recv__val[3 - sv2v_cast_2(i)+:1] = 1'd0;
					read_crossbar__recv__msg[(3 - sv2v_cast_2(i)) * 53+:53] = 53'h00000000000000;
				end
		end
		recv_from_noc_load_response_pkt__rdy = 1'd0;
		begin : sv2v_autoblock_10
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_xbar_in_wr_ports_at_update_all; i = i + 1'd1)
				begin
					write_crossbar__recv__val[3 - sv2v_cast_2(i)+:1] = 1'd0;
					write_crossbar__recv__msg[(3 - sv2v_cast_2(i)) * 53+:53] = 53'h00000000000000;
				end
		end
		recv_from_controller_spm_wr_req__rdy = 1'd0;
		recv_from_controller_spm_rd_req__rdy = 1'd0;
		send_to_controller_spm_rd_resp__val = 1'd0;
		send_to_controller_spm_rd_resp__msg = 32'd0;
		send_to_noc_load_request_pkt__msg = 202'h000000000000000000000000000000000000000000000000000;
		send_to_noc_load_request_pkt__val = 1'd0;
		begin : sv2v_autoblock_11
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_rd_tiles_at_update_all; i = i + 1'd1)
				begin
					read_crossbar__recv__val[3 - sv2v_cast_2(i)+:1] = recv_raddr__val[2 - sv2v_cast_2(i)+:1];
					read_crossbar__recv__msg[(3 - sv2v_cast_2(i)) * 53+:53] = rd_pkt[sv2v_cast_2(i)];
					recv_raddr__rdy[2 - sv2v_cast_2(i)+:1] = read_crossbar__recv__rdy[3 - sv2v_cast_2(i)+:1];
				end
		end
		read_crossbar__recv__val[3 - __const__num_rd_tiles_at_update_all+:1] = recv_from_noc_load_request__val;
		read_crossbar__recv__msg[(3 - __const__num_rd_tiles_at_update_all) * 53+:53] = rd_pkt[__const__num_rd_tiles_at_update_all];
		recv_from_noc_load_request__rdy = read_crossbar__recv__rdy[3 - __const__num_rd_tiles_at_update_all+:1];
		if (__const__has_dma_ports_at_update_all) begin
			__tmpvar__update_all_dma_rd_idx = 2'd3;
			read_crossbar__recv__val[3 - __tmpvar__update_all_dma_rd_idx+:1] = recv_from_controller_spm_rd_req__val;
			read_crossbar__recv__msg[(3 - __tmpvar__update_all_dma_rd_idx) * 53+:53] = rd_pkt[__tmpvar__update_all_dma_rd_idx];
			recv_from_controller_spm_rd_req__rdy = read_crossbar__recv__rdy[3 - __tmpvar__update_all_dma_rd_idx+:1];
		end
		begin : sv2v_autoblock_12
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_wr_tiles_at_update_all; i = i + 1'd1)
				begin
					write_crossbar__recv__val[3 - sv2v_cast_2(i)+:1] = recv_waddr__val[2 - sv2v_cast_2(i)+:1];
					write_crossbar__recv__msg[(3 - sv2v_cast_2(i)) * 53+:53] = wr_pkt[sv2v_cast_2(i)];
					recv_waddr__rdy[2 - sv2v_cast_2(i)+:1] = write_crossbar__recv__rdy[3 - sv2v_cast_2(i)+:1];
					recv_wdata__rdy[2 - sv2v_cast_2(i)+:1] = write_crossbar__recv__rdy[3 - sv2v_cast_2(i)+:1];
				end
		end
		write_crossbar__recv__val[3 - __const__num_wr_tiles_at_update_all+:1] = recv_from_noc_store_request__val;
		write_crossbar__recv__msg[(3 - __const__num_wr_tiles_at_update_all) * 53+:53] = wr_pkt[__const__num_wr_tiles_at_update_all];
		recv_from_noc_store_request__rdy = write_crossbar__recv__rdy[3 - __const__num_wr_tiles_at_update_all+:1];
		if (__const__has_dma_ports_at_update_all) begin
			__tmpvar__update_all_dma_wr_idx = 2'd3;
			write_crossbar__recv__val[3 - __tmpvar__update_all_dma_wr_idx+:1] = recv_from_controller_spm_wr_req__val;
			write_crossbar__recv__msg[(3 - __tmpvar__update_all_dma_wr_idx) * 53+:53] = wr_pkt[__tmpvar__update_all_dma_wr_idx];
			recv_from_controller_spm_wr_req__rdy = write_crossbar__recv__rdy[3 - __tmpvar__update_all_dma_wr_idx+:1];
		end
		begin : sv2v_autoblock_13
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_xbar_in_rd_ports_at_update_all; i = i + 1'd1)
				if (sv2v_cast_2(i) < __const__num_rd_tiles_at_update_all) begin
					send_rdata__msg[(2 - sv2v_cast_2(i)) * 35+:35] = response_crossbar__send__msg[((3 - sv2v_cast_2(i)) * 53) + 41-:35];
					send_rdata__val[2 - sv2v_cast_2(i)+:1] = response_crossbar__send__val[3 - sv2v_cast_2(i)+:1];
					response_crossbar__send__rdy[3 - sv2v_cast_2(i)+:1] = send_rdata__rdy[2 - sv2v_cast_2(i)+:1];
				end
				else if (sv2v_cast_2(i) == __const__num_rd_tiles_at_update_all) begin
					__tmpvar__update_all_from_cgra_id = response_crossbar__send__msg[((3 - sv2v_cast_2(i)) * 53) + 6-:2];
					__tmpvar__update_all_from_tile_id = response_crossbar__send__msg[((3 - sv2v_cast_2(i)) * 53) + 4-:3];
					send_to_noc_load_response_pkt__msg = {cgra_id, __tmpvar__update_all_from_cgra_id, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], idTo2d_x_lut[__tmpvar__update_all_from_cgra_id], idTo2d_y_lut[__tmpvar__update_all_from_cgra_id], 3'd0, __tmpvar__update_all_from_tile_id, response_crossbar__send__msg[((3 - sv2v_cast_2(i)) * 53) + 1-:2], 8'd0, 2'd0, {sv2v_cast_6(__const__CMD_LOAD_RESPONSE), response_crossbar__send__msg[((3 - sv2v_cast_2(i)) * 53) + 41-:35], response_crossbar__send__msg[((3 - sv2v_cast_2(i)) * 53) + 48-:7], 123'd0, 3'd0}};
					send_to_noc_load_response_pkt__val = response_crossbar__send__val[3 - sv2v_cast_2(i)+:1];
					response_crossbar__send__rdy[3 - sv2v_cast_2(i)+:1] = send_to_noc_load_response_pkt__rdy;
				end
				else if (__const__has_dma_ports_at_update_all) begin
					send_to_controller_spm_rd_resp__msg = response_crossbar__send__msg[((3 - sv2v_cast_2(i)) * 53) + 41-:32];
					send_to_controller_spm_rd_resp__val = response_crossbar__send__val[3 - sv2v_cast_2(i)+:1];
					response_crossbar__send__rdy[3 - sv2v_cast_2(i)+:1] = send_to_controller_spm_rd_resp__rdy;
				end
		end
		send_to_noc_load_request_pkt__msg = {cgra_id, 2'd0, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], 2'd0, 1'd0, 3'd0, 3'd0, read_crossbar__send__msg[((2 - __const__num_banks_per_cgra_at_update_all) * 53) + 52-:2], 8'd0, 2'd0, {sv2v_cast_6(__const__CMD_LOAD_REQUEST), 35'd0, read_crossbar__send__msg[((2 - __const__num_banks_per_cgra_at_update_all) * 53) + 48-:7], 123'd0, 3'd0}};
		send_to_noc_load_request_pkt__val = read_crossbar__send__val[2 - __const__num_banks_per_cgra_at_update_all+:1];
		recv_from_noc_load_response_pkt__rdy = response_crossbar__recv__rdy[2 - __const__num_banks_per_cgra_at_update_all+:1];
		response_crossbar__recv__val[2 - __const__num_banks_per_cgra_at_update_all+:1] = recv_from_noc_load_response_pkt__val;
		response_crossbar__recv__msg[(2 - __const__num_banks_per_cgra_at_update_all) * 53+:53] = {__const__num_banks_per_cgra_at_update_all, recv_from_noc_load_response_pkt__msg[185-:2], recv_from_noc_load_response_pkt__msg[132-:7], recv_from_noc_load_response_pkt__msg[167-:35], recv_from_noc_load_response_pkt__msg[201-:2], recv_from_noc_load_response_pkt__msg[191-:3], 2'd0};
		read_crossbar__send__rdy[2 - __const__num_banks_per_cgra_at_update_all+:1] = send_to_noc_load_request_pkt__rdy;
		send_to_noc_store_pkt__msg = {cgra_id, 2'd0, idTo2d_x_lut[cgra_id], idTo2d_y_lut[cgra_id], 2'd0, 1'd0, 3'd0, 3'd0, write_crossbar__send__msg[((2 - __const__num_banks_per_cgra_at_update_all) * 53) + 52-:2], 8'd0, 2'd0, {sv2v_cast_6(__const__CMD_STORE_REQUEST), write_crossbar__send__msg[((2 - __const__num_banks_per_cgra_at_update_all) * 53) + 41-:35], write_crossbar__send__msg[((2 - __const__num_banks_per_cgra_at_update_all) * 53) + 48-:7], 123'd0, 3'd0}};
		send_to_noc_store_pkt__val = write_crossbar__send__val[2 - __const__num_banks_per_cgra_at_update_all+:1];
		write_crossbar__send__rdy[2 - __const__num_banks_per_cgra_at_update_all+:1] = send_to_noc_store_pkt__rdy;
	end
	assign memory_wrapper__clk[0] = clk;
	assign memory_wrapper__reset[0] = reset;
	assign memory_wrapper__clk[1] = clk;
	assign memory_wrapper__reset[1] = reset;
	assign read_crossbar__clk = clk;
	assign read_crossbar__reset = reset;
	assign write_crossbar__clk = clk;
	assign write_crossbar__reset = reset;
	assign response_crossbar__clk = clk;
	assign response_crossbar__reset = reset;
	assign idTo2d_x_lut[0] = 2'd0;
	assign idTo2d_y_lut[0] = 1'd0;
	assign idTo2d_x_lut[1] = 2'd1;
	assign idTo2d_y_lut[1] = 1'd0;
	assign idTo2d_x_lut[2] = 2'd2;
	assign idTo2d_y_lut[2] = 1'd0;
	assign idTo2d_x_lut[3] = 2'd3;
	assign idTo2d_y_lut[3] = 1'd0;
	assign memory_wrapper__recv_rd__msg[0] = read_crossbar__send__msg[106+:53];
	wire [1:1] sv2v_tmp_3E539;
	assign sv2v_tmp_3E539 = memory_wrapper__recv_rd__rdy[0];
	always @(*) read_crossbar__send__rdy[2+:1] = sv2v_tmp_3E539;
	assign memory_wrapper__recv_rd__val[0] = read_crossbar__send__val[2+:1];
	assign memory_wrapper__recv_wr__msg[0] = write_crossbar__send__msg[106+:53];
	wire [1:1] sv2v_tmp_4A68C;
	assign sv2v_tmp_4A68C = memory_wrapper__recv_wr__rdy[0];
	always @(*) write_crossbar__send__rdy[2+:1] = sv2v_tmp_4A68C;
	assign memory_wrapper__recv_wr__val[0] = write_crossbar__send__val[2+:1];
	wire [53:1] sv2v_tmp_FBACF;
	assign sv2v_tmp_FBACF = memory_wrapper__send__msg[0];
	always @(*) response_crossbar__recv__msg[106+:53] = sv2v_tmp_FBACF;
	assign memory_wrapper__send__rdy[0] = response_crossbar__recv__rdy[2+:1];
	wire [1:1] sv2v_tmp_8130E;
	assign sv2v_tmp_8130E = memory_wrapper__send__val[0];
	always @(*) response_crossbar__recv__val[2+:1] = sv2v_tmp_8130E;
	assign memory_wrapper__recv_rd__msg[1] = read_crossbar__send__msg[53+:53];
	wire [1:1] sv2v_tmp_1ED15;
	assign sv2v_tmp_1ED15 = memory_wrapper__recv_rd__rdy[1];
	always @(*) read_crossbar__send__rdy[1+:1] = sv2v_tmp_1ED15;
	assign memory_wrapper__recv_rd__val[1] = read_crossbar__send__val[1+:1];
	assign memory_wrapper__recv_wr__msg[1] = write_crossbar__send__msg[53+:53];
	wire [1:1] sv2v_tmp_BC698;
	assign sv2v_tmp_BC698 = memory_wrapper__recv_wr__rdy[1];
	always @(*) write_crossbar__send__rdy[1+:1] = sv2v_tmp_BC698;
	assign memory_wrapper__recv_wr__val[1] = write_crossbar__send__val[1+:1];
	wire [53:1] sv2v_tmp_126F6;
	assign sv2v_tmp_126F6 = memory_wrapper__send__msg[1];
	always @(*) response_crossbar__recv__msg[53+:53] = sv2v_tmp_126F6;
	assign memory_wrapper__send__rdy[1] = response_crossbar__recv__rdy[1+:1];
	wire [1:1] sv2v_tmp_B6F34;
	assign sv2v_tmp_B6F34 = memory_wrapper__send__val[1];
	always @(*) response_crossbar__recv__val[1+:1] = sv2v_tmp_B6F34;
endmodule
module RegisterFile__e6e244c14d4afbbe (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [2:0] raddr;
	output reg [34:0] rdata;
	input wire [0:0] reset;
	input wire [2:0] waddr;
	input wire [34:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [34:0] regs [0:5];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 35+:35] = regs[raddr[sv2v_cast_1(i) * 3+:3]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i) * 3+:3]] <= wdata[sv2v_cast_1(i) * 35+:35];
		end
	end
endmodule
module ConstQueueDynamicRTL__8f4d11f2dd80f063 (
	clear,
	clk,
	ctrl_proceed,
	reset,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	send_const__msg,
	send_const__rdy,
	send_const__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] ctrl_proceed;
	input wire [0:0] reset;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	output wire [34:0] send_const__msg;
	input wire [0:0] send_const__rdy;
	output reg [0:0] send_const__val;
	localparam [2:0] __const__const_mem_size_at_load_const = 3'd6;
	localparam [2:0] __const__const_mem_size_at_update_wr_cur = 3'd6;
	reg [0:0] consume_pending;
	reg [2:0] rd_cur;
	reg [2:0] wr_cur;
	wire [0:0] reg_file__clk;
	wire [2:0] reg_file__raddr;
	wire [34:0] reg_file__rdata;
	wire [0:0] reg_file__reset;
	reg [2:0] reg_file__waddr;
	reg [34:0] reg_file__wdata;
	reg [0:0] reg_file__wen;
	RegisterFile__e6e244c14d4afbbe reg_file(
		.clk(reg_file__clk),
		.raddr(reg_file__raddr),
		.rdata(reg_file__rdata),
		.reset(reg_file__reset),
		.waddr(reg_file__waddr),
		.wdata(reg_file__wdata),
		.wen(reg_file__wen)
	);
	reg [0:0] __tmpvar__load_const_not_full;
	reg [0:0] __tmpvar__update_wr_cur_not_full;
	reg [0:0] __tmpvar__update_rd_cur_handshake_now;
	reg [0:0] __tmpvar__update_rd_cur_consume_retire;
	always @(*) begin : load_const
		reg_file__waddr[1'd0 * 3+:3] = 3'd0;
		reg_file__wdata[1'd0 * 35+:35] = 35'h000000000;
		reg_file__wen[1'd0+:1] = 1'd0;
		__tmpvar__load_const_not_full = wr_cur < __const__const_mem_size_at_load_const;
		recv_const__rdy = __tmpvar__load_const_not_full;
		if (recv_const__val & __tmpvar__load_const_not_full) begin
			reg_file__waddr[1'd0 * 3+:3] = wr_cur;
			reg_file__wdata[1'd0 * 35+:35] = recv_const__msg;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
	end
	always @(*) begin : update_send_val
		if (rd_cur < wr_cur)
			send_const__val = 1'd1;
		else
			send_const__val = 1'd0;
	end
	always @(posedge clk) begin : update_rd_cur
		if (reset | clear) begin
			rd_cur <= 3'd0;
			consume_pending <= 1'd0;
		end
		else begin
			__tmpvar__update_rd_cur_handshake_now = send_const__rdy;
			__tmpvar__update_rd_cur_consume_retire = (consume_pending | __tmpvar__update_rd_cur_handshake_now) & ctrl_proceed;
			if (__tmpvar__update_rd_cur_consume_retire) begin
				if (rd_cur < (wr_cur - 3'd1))
					rd_cur <= rd_cur + 3'd1;
				else
					rd_cur <= 3'd0;
				consume_pending <= 1'd0;
			end
			else
				consume_pending <= consume_pending | __tmpvar__update_rd_cur_handshake_now;
		end
	end
	always @(posedge clk) begin : update_wr_cur
		__tmpvar__update_wr_cur_not_full = wr_cur < __const__const_mem_size_at_update_wr_cur;
		if (reset | clear)
			wr_cur <= 3'd0;
		else if (recv_const__val & __tmpvar__update_wr_cur_not_full)
			wr_cur <= wr_cur + 3'd1;
	end
	assign reg_file__clk = clk;
	assign reg_file__reset = reset;
	assign send_const__msg = reg_file__rdata[0+:35];
	assign reg_file__raddr[0+:3] = rd_cur;
endmodule
module RegisterFile__78ad02bf7eb2979b (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	output reg [173:0] rdata;
	input wire [0:0] reset;
	input wire [0:0] waddr;
	input wire [173:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [173:0] regs [0:1];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 174+:174] = regs[raddr[sv2v_cast_1(i)+:1]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i)+:1]] <= wdata[sv2v_cast_1(i) * 174+:174];
		end
	end
endmodule
module NormalQueueDpathRTL__64fd0ceeaebb3f45 (
	clk,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	input wire [173:0] recv_msg;
	input wire [0:0] reset;
	output wire [173:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [173:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [173:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__78ad02bf7eb2979b rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign send_msg = rf__rdata[0+:174];
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:174] = recv_msg;
endmodule
module NormalQueueRTL__64fd0ceeaebb3f45 (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [173:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [173:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	NormalQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__raddr;
	wire [173:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [173:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	NormalQueueDpathRTL__64fd0ceeaebb3f45 dpath(
		.clk(dpath__clk),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign dpath__recv_msg = recv__msg;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign send__msg = dpath__send_msg;
	assign count = ctrl__count;
endmodule
module RegisterFile__532c9a19654f92d3 (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [2:0] raddr;
	output reg [122:0] rdata;
	input wire [0:0] reset;
	input wire [2:0] waddr;
	input wire [122:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [122:0] regs [0:5];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 123+:123] = regs[raddr[sv2v_cast_1(i) * 3+:3]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i) * 3+:3]] <= wdata[sv2v_cast_1(i) * 123+:123];
		end
	end
endmodule
module CtrlMemDynamicRTL__7531561cc1c156b4 (
	cgra_id,
	clk,
	ctrl_addr_outport,
	prologue_count_outport_fu,
	prologue_count_outport_fu_crossbar,
	prologue_count_outport_routing_crossbar,
	reset,
	tile_id,
	recv_from_element__msg,
	recv_from_element__rdy,
	recv_from_element__val,
	recv_pkt_from_controller__msg,
	recv_pkt_from_controller__rdy,
	recv_pkt_from_controller__val,
	send_ctrl__msg,
	send_ctrl__rdy,
	send_ctrl__val,
	send_pkt_to_controller__msg,
	send_pkt_to_controller__rdy,
	send_pkt_to_controller__val,
	send_to_element__msg,
	send_to_element__rdy,
	send_to_element__val
);
	input wire [1:0] cgra_id;
	input wire [0:0] clk;
	output reg [2:0] ctrl_addr_outport;
	output reg [2:0] prologue_count_outport_fu;
	output reg [35:0] prologue_count_outport_fu_crossbar;
	output reg [143:0] prologue_count_outport_routing_crossbar;
	input wire [0:0] reset;
	input wire [2:0] tile_id;
	input wire [173:0] recv_from_element__msg;
	output wire [0:0] recv_from_element__rdy;
	input wire [0:0] recv_from_element__val;
	input wire [198:0] recv_pkt_from_controller__msg;
	output wire [0:0] recv_pkt_from_controller__rdy;
	input wire [0:0] recv_pkt_from_controller__val;
	output reg [122:0] send_ctrl__msg;
	input wire [0:0] send_ctrl__rdy;
	output reg [0:0] send_ctrl__val;
	output reg [198:0] send_pkt_to_controller__msg;
	input wire [0:0] send_pkt_to_controller__rdy;
	output reg [0:0] send_pkt_to_controller__val;
	output reg [173:0] send_to_element__msg;
	input wire [0:0] send_to_element__rdy;
	output reg [0:0] send_to_element__val;
	localparam [2:0] __const__num_fu_inports_at_update_msg = 3'd4;
	localparam [3:0] __const__num_routing_outports_at_update_msg = 4'd8;
	localparam [1:0] __const__CMD_CONFIG = 2'd3;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE = 5'd20;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE = 5'd21;
	localparam [4:0] __const__CMD_CONFIG_LOOP_LOWER = 5'd28;
	localparam [4:0] __const__CMD_CONFIG_LOOP_UPPER = 5'd29;
	localparam [4:0] __const__CMD_CONFIG_LOOP_STEP = 5'd30;
	localparam [5:0] __const__CMD_CONFIG_GEP_STRIDE = 6'd43;
	localparam [4:0] __const__CMD_UPDATE_COUNTER_SHADOW_VALUE = 5'd26;
	localparam [4:0] __const__CMD_RESET_LEAF_COUNTER = 5'd27;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_FU = 3'd4;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR = 3'd5;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR = 3'd6;
	localparam [0:0] __const__CMD_LAUNCH = 1'd0;
	localparam [1:0] __const__CMD_TERMINATE = 2'd2;
	localparam [0:0] __const__CMD_PAUSE = 1'd1;
	localparam [4:0] __const__CMD_PRESERVE = 5'd22;
	localparam [3:0] __const__CMD_RESUME = 4'd15;
	localparam [2:0] __const__CMD_CONFIG_TOTAL_CTRL_COUNT = 3'd7;
	localparam [3:0] __const__CMD_CONFIG_COUNT_PER_ITER = 4'd8;
	localparam [3:0] __const__CMD_CONFIG_CTRL_LOWER_BOUND = 4'd9;
	localparam [4:0] __const__CMD_RECORD_PHI_ADDR = 5'd16;
	localparam [4:0] __const__CMD_CONFIG_STREAMING_LD_START_ADDR = 5'd23;
	localparam [4:0] __const__CMD_CONFIG_STREAMING_LD_STRIDE = 5'd24;
	localparam [4:0] __const__CMD_CONFIG_STREAMING_LD_END_ADDR = 5'd25;
	localparam [2:0] __const__num_tiles_at_update_send_pkt_to_controller = 3'd4;
	localparam [3:0] __const__CMD_COMPLETE = 4'd14;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [2:0] __const__num_fu_inports_at_update_send_ctrl_msg = 3'd4;
	localparam [3:0] __const__num_routing_outports_at_update_send_ctrl_msg = 4'd8;
	localparam [6:0] __const__OPT_NAH = 7'd1;
	localparam [2:0] __const__ctrl_mem_size_at_update_raddr_and_fu_prologue = 3'd6;
	localparam [2:0] __const__ctrl_mem_size_at_update_prologue_outport = 3'd6;
	localparam [3:0] __const__num_routing_xbar_inports_at_update_prologue_outport = 4'd8;
	localparam [1:0] __const__num_fu_outports_at_update_prologue_outport = 2'd2;
	localparam [2:0] __const__ctrl_mem_size_at_update_prologue_reg = 3'd6;
	localparam [3:0] __const__num_routing_xbar_inports_at_update_prologue_reg = 4'd8;
	localparam [1:0] __const__num_fu_outports_at_update_prologue_reg = 2'd2;
	localparam [2:0] __const__ctrl_count_per_iter_at_update_ctrl_count_per_iter = 3'd6;
	localparam [2:0] __const__total_ctrl_steps_at_update_total_ctrl_steps = 3'd6;
	reg [2:0] ctrl_count_lower_bound;
	reg [2:0] ctrl_count_per_iter_val;
	reg [2:0] ctrl_count_upper_bound;
	reg [2:0] prologue_count_reg_fu [0:5];
	reg [2:0] prologue_count_reg_fu_crossbar [0:5][0:1];
	reg [2:0] prologue_count_reg_routing_crossbar [0:5][0:7];
	reg [0:0] sent_complete;
	reg [0:0] start_iterate_ctrl;
	reg [10:0] times;
	reg [10:0] total_ctrl_steps_val;
	wire [0:0] recv_from_element_queue__clk;
	wire [1:0] recv_from_element_queue__count;
	wire [0:0] recv_from_element_queue__reset;
	wire [173:0] recv_from_element_queue__recv__msg;
	wire [0:0] recv_from_element_queue__recv__rdy;
	wire [0:0] recv_from_element_queue__recv__val;
	wire [173:0] recv_from_element_queue__send__msg;
	reg [0:0] recv_from_element_queue__send__rdy;
	wire [0:0] recv_from_element_queue__send__val;
	NormalQueueRTL__64fd0ceeaebb3f45 recv_from_element_queue(
		.clk(recv_from_element_queue__clk),
		.count(recv_from_element_queue__count),
		.reset(recv_from_element_queue__reset),
		.recv__msg(recv_from_element_queue__recv__msg),
		.recv__rdy(recv_from_element_queue__recv__rdy),
		.recv__val(recv_from_element_queue__recv__val),
		.send__msg(recv_from_element_queue__send__msg),
		.send__rdy(recv_from_element_queue__send__rdy),
		.send__val(recv_from_element_queue__send__val)
	);
	wire [0:0] recv_pkt_from_controller_queue__clk;
	wire [1:0] recv_pkt_from_controller_queue__count;
	wire [0:0] recv_pkt_from_controller_queue__reset;
	wire [198:0] recv_pkt_from_controller_queue__recv__msg;
	wire [0:0] recv_pkt_from_controller_queue__recv__rdy;
	wire [0:0] recv_pkt_from_controller_queue__recv__val;
	wire [198:0] recv_pkt_from_controller_queue__send__msg;
	reg [0:0] recv_pkt_from_controller_queue__send__rdy;
	wire [0:0] recv_pkt_from_controller_queue__send__val;
	NormalQueueRTL__81615e1e2a6a0781 recv_pkt_from_controller_queue(
		.clk(recv_pkt_from_controller_queue__clk),
		.count(recv_pkt_from_controller_queue__count),
		.reset(recv_pkt_from_controller_queue__reset),
		.recv__msg(recv_pkt_from_controller_queue__recv__msg),
		.recv__rdy(recv_pkt_from_controller_queue__recv__rdy),
		.recv__val(recv_pkt_from_controller_queue__recv__val),
		.send__msg(recv_pkt_from_controller_queue__send__msg),
		.send__rdy(recv_pkt_from_controller_queue__send__rdy),
		.send__val(recv_pkt_from_controller_queue__send__val)
	);
	wire [0:0] reg_file__clk;
	reg [2:0] reg_file__raddr;
	wire [122:0] reg_file__rdata;
	wire [0:0] reg_file__reset;
	reg [2:0] reg_file__waddr;
	reg [122:0] reg_file__wdata;
	reg [0:0] reg_file__wen;
	RegisterFile__532c9a19654f92d3 reg_file(
		.clk(reg_file__clk),
		.raddr(reg_file__raddr),
		.rdata(reg_file__rdata),
		.reset(reg_file__reset),
		.waddr(reg_file__waddr),
		.wdata(reg_file__wdata),
		.wen(reg_file__wen)
	);
	reg [3:0] __tmpvar__update_prologue_reg_temp_routing_crossbar_in;
	reg [1:0] __tmpvar__update_prologue_reg_temp_fu_crossbar_in;
	always @(*) begin : update_ctrl_addr_outport
		ctrl_addr_outport = reg_file__raddr[1'd0 * 3+:3];
	end
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin : update_msg
		recv_pkt_from_controller_queue__send__rdy = 1'd0;
		send_to_element__msg = 174'h00000000000000000000000000000000000000000000;
		send_to_element__val = 1'd0;
		reg_file__wen[1'd0+:1] = 1'd0;
		reg_file__waddr[1'd0 * 3+:3] = recv_pkt_from_controller_queue__send__msg[2-:3];
		reg_file__wdata[(1'd0 * 123) + 122-:7] = 7'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_fu_inports_at_update_msg; i = i + 1'd1)
				begin
					reg_file__wdata[(1'd0 * 123) + (104 + (sv2v_cast_2(i) * 3))+:3] = 3'd0;
					reg_file__wdata[(1'd0 * 123) + (44 + (sv2v_cast_2(i) * 2))+:2] = recv_pkt_from_controller_queue__send__msg[47 + (sv2v_cast_2(i) * 2)+:2];
					reg_file__wdata[(1'd0 * 123) + (28 + (sv2v_cast_2(i) * 4))+:4] = recv_pkt_from_controller_queue__send__msg[31 + (sv2v_cast_2(i) * 4)+:4];
					reg_file__wdata[(1'd0 * 123) + (20 + (sv2v_cast_2(i) * 2))+:2] = recv_pkt_from_controller_queue__send__msg[23 + (sv2v_cast_2(i) * 2)+:2];
					reg_file__wdata[(1'd0 * 123) + (4 + (sv2v_cast_2(i) * 4))+:4] = recv_pkt_from_controller_queue__send__msg[7 + (sv2v_cast_2(i) * 4)+:4];
					reg_file__wdata[(1'd0 * 123) + (0 + sv2v_cast_2(i))+:1] = recv_pkt_from_controller_queue__send__msg[3 + sv2v_cast_2(i)+:1];
				end
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_routing_outports_at_update_msg; i = i + 1'd1)
				begin
					reg_file__wdata[(1'd0 * 123) + (72 + (sv2v_cast_3(i) * 4))+:4] = 4'd0;
					reg_file__wdata[(1'd0 * 123) + (56 + (sv2v_cast_3(i) * 2))+:2] = 2'd0;
				end
		end
		reg_file__wdata[(1'd0 * 123) + 55-:3] = recv_pkt_from_controller_queue__send__msg[58-:3];
		reg_file__wdata[(1'd0 * 123) + 52] = 1'd0;
		if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG))) begin
			reg_file__wen[1'd0+:1] = 1'd1;
			reg_file__waddr[1'd0 * 3+:3] = recv_pkt_from_controller_queue__send__msg[2-:3];
			reg_file__wdata[(1'd0 * 123) + 122-:7] = recv_pkt_from_controller_queue__send__msg[125-:7];
			begin : sv2v_autoblock_3
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_fu_inports_at_update_msg; i = i + 1'd1)
					begin
						reg_file__wdata[(1'd0 * 123) + (104 + (sv2v_cast_2(i) * 3))+:3] = recv_pkt_from_controller_queue__send__msg[107 + (sv2v_cast_2(i) * 3)+:3];
						reg_file__wdata[(1'd0 * 123) + (44 + (sv2v_cast_2(i) * 2))+:2] = recv_pkt_from_controller_queue__send__msg[47 + (sv2v_cast_2(i) * 2)+:2];
						reg_file__wdata[(1'd0 * 123) + (28 + (sv2v_cast_2(i) * 4))+:4] = recv_pkt_from_controller_queue__send__msg[31 + (sv2v_cast_2(i) * 4)+:4];
						reg_file__wdata[(1'd0 * 123) + (20 + (sv2v_cast_2(i) * 2))+:2] = recv_pkt_from_controller_queue__send__msg[23 + (sv2v_cast_2(i) * 2)+:2];
						reg_file__wdata[(1'd0 * 123) + (4 + (sv2v_cast_2(i) * 4))+:4] = recv_pkt_from_controller_queue__send__msg[7 + (sv2v_cast_2(i) * 4)+:4];
						reg_file__wdata[(1'd0 * 123) + (0 + sv2v_cast_2(i))+:1] = recv_pkt_from_controller_queue__send__msg[3 + sv2v_cast_2(i)+:1];
					end
			end
			begin : sv2v_autoblock_4
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_routing_outports_at_update_msg; i = i + 1'd1)
					begin
						reg_file__wdata[(1'd0 * 123) + (72 + (sv2v_cast_3(i) * 4))+:4] = recv_pkt_from_controller_queue__send__msg[75 + (sv2v_cast_3(i) * 4)+:4];
						reg_file__wdata[(1'd0 * 123) + (56 + (sv2v_cast_3(i) * 2))+:2] = recv_pkt_from_controller_queue__send__msg[59 + (sv2v_cast_3(i) * 2)+:2];
					end
			end
			reg_file__wdata[(1'd0 * 123) + 55-:3] = recv_pkt_from_controller_queue__send__msg[58-:3];
			reg_file__wdata[(1'd0 * 123) + 52] = recv_pkt_from_controller_queue__send__msg[55];
		end
		else if (recv_pkt_from_controller_queue__send__val & ((((((((recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD_RESPONSE)) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_MUL_RESPONSE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_LOWER))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_UPPER))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_STEP))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == __const__CMD_CONFIG_GEP_STRIDE)) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_UPDATE_COUNTER_SHADOW_VALUE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_RESET_LEAF_COUNTER)))) begin
			send_to_element__msg = recv_pkt_from_controller_queue__send__msg[173-:174];
			send_to_element__val = 1'd1;
		end
		if ((((((((((((((((((((((((recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG)) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_LAUNCH))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_TERMINATE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_PAUSE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_PRESERVE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_RESUME))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_TOTAL_CTRL_COUNT))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_COUNT_PER_ITER))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_CTRL_LOWER_BOUND))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_RECORD_PHI_ADDR))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD_RESPONSE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_STREAMING_LD_START_ADDR))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_STREAMING_LD_STRIDE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_STREAMING_LD_END_ADDR))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_MUL_RESPONSE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_LOWER))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_UPPER))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_STEP))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == __const__CMD_CONFIG_GEP_STRIDE)) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_UPDATE_COUNTER_SHADOW_VALUE))) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_RESET_LEAF_COUNTER)))
			recv_pkt_from_controller_queue__send__rdy = 1'd1;
	end
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : update_prologue_outport
		prologue_count_outport_fu = prologue_count_reg_fu[reg_file__raddr[1'd0 * 3+:3]];
		begin : sv2v_autoblock_5
			reg [31:0] addr;
			for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_outport; addr = addr + 1'd1)
				begin
					begin : sv2v_autoblock_6
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_routing_xbar_inports_at_update_prologue_outport; i = i + 1'd1)
							prologue_count_outport_routing_crossbar[(((5 - sv2v_cast_3(addr)) * 8) + (7 - sv2v_cast_3(i))) * 3+:3] = prologue_count_reg_routing_crossbar[sv2v_cast_3(addr)][sv2v_cast_3(i)];
					end
					begin : sv2v_autoblock_7
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_fu_outports_at_update_prologue_outport; i = i + 1'd1)
							prologue_count_outport_fu_crossbar[(((5 - sv2v_cast_3(addr)) * 2) + (1 - sv2v_cast_1(i))) * 3+:3] = prologue_count_reg_fu_crossbar[sv2v_cast_3(addr)][sv2v_cast_1(i)];
					end
				end
		end
	end
	always @(*) begin : update_send_ctrl_msg
		begin : sv2v_autoblock_8
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_fu_inports_at_update_send_ctrl_msg; i = i + 1'd1)
				begin
					send_ctrl__msg[104 + (sv2v_cast_2(i) * 3)+:3] = reg_file__rdata[(1'd0 * 123) + (104 + (sv2v_cast_2(i) * 3))+:3];
					send_ctrl__msg[44 + (sv2v_cast_2(i) * 2)+:2] = reg_file__rdata[(1'd0 * 123) + (44 + (sv2v_cast_2(i) * 2))+:2];
					send_ctrl__msg[28 + (sv2v_cast_2(i) * 4)+:4] = reg_file__rdata[(1'd0 * 123) + (28 + (sv2v_cast_2(i) * 4))+:4];
					send_ctrl__msg[20 + (sv2v_cast_2(i) * 2)+:2] = reg_file__rdata[(1'd0 * 123) + (20 + (sv2v_cast_2(i) * 2))+:2];
					send_ctrl__msg[4 + (sv2v_cast_2(i) * 4)+:4] = reg_file__rdata[(1'd0 * 123) + (4 + (sv2v_cast_2(i) * 4))+:4];
					send_ctrl__msg[0 + sv2v_cast_2(i)+:1] = reg_file__rdata[(1'd0 * 123) + (0 + sv2v_cast_2(i))+:1];
				end
		end
		begin : sv2v_autoblock_9
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_routing_outports_at_update_send_ctrl_msg; i = i + 1'd1)
				begin
					send_ctrl__msg[72 + (sv2v_cast_3(i) * 4)+:4] = reg_file__rdata[(1'd0 * 123) + (72 + (sv2v_cast_3(i) * 4))+:4];
					send_ctrl__msg[56 + (sv2v_cast_3(i) * 2)+:2] = reg_file__rdata[(1'd0 * 123) + (56 + (sv2v_cast_3(i) * 2))+:2];
				end
		end
		send_ctrl__msg[55-:3] = reg_file__rdata[(1'd0 * 123) + 55-:3];
		send_ctrl__msg[52] = reg_file__rdata[(1'd0 * 123) + 52];
		if (prologue_count_outport_fu != 3'd0)
			send_ctrl__msg[122-:7] = __const__OPT_NAH;
		else
			send_ctrl__msg[122-:7] = reg_file__rdata[(1'd0 * 123) + 122-:7];
	end
	always @(*) begin : update_send_ctrl_val
		send_ctrl__val = 1'd0;
		if (start_iterate_ctrl == 1'd1)
			if (sent_complete)
				send_ctrl__val = 1'd0;
			else if (((total_ctrl_steps_val > 11'd0) & (times == total_ctrl_steps_val)) | (reg_file__rdata[(1'd0 * 123) + 122-:7] == __const__OPT_START))
				send_ctrl__val = 1'd0;
			else
				send_ctrl__val = 1'd1;
		if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_TERMINATE)))
			send_ctrl__val = 1'd0;
	end
	always @(*) begin : update_send_pkt_to_controller
		send_pkt_to_controller__val = 1'd0;
		send_pkt_to_controller__msg = {3'd0, __const__num_tiles_at_update_send_pkt_to_controller, 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, {sv2v_cast_6(__const__CMD_COMPLETE), 35'd0, 7'd0, 123'd0, 3'd0}};
		recv_from_element_queue__send__rdy = 1'd0;
		if (start_iterate_ctrl == 1'd1)
			if (recv_from_element_queue__send__val & ~sent_complete) begin
				send_pkt_to_controller__msg = {tile_id, __const__num_tiles_at_update_send_pkt_to_controller, 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, recv_from_element_queue__send__msg};
				send_pkt_to_controller__val = 1'd1;
				recv_from_element_queue__send__rdy = send_pkt_to_controller__rdy;
			end
			else if (((total_ctrl_steps_val > 11'd0) & (times == total_ctrl_steps_val)) | (reg_file__rdata[(1'd0 * 123) + 122-:7] == __const__OPT_START))
				if (((~sent_complete & (total_ctrl_steps_val > 11'd0)) & (times == total_ctrl_steps_val)) & start_iterate_ctrl) begin
					send_pkt_to_controller__msg = {tile_id, __const__num_tiles_at_update_send_pkt_to_controller, 2'd0, 2'd0, 2'd0, 1'd0, 2'd0, 1'd0, 8'd0, 1'd0, {sv2v_cast_6(__const__CMD_COMPLETE), 35'd0, 7'd0, 123'd0, 3'd0}};
					send_pkt_to_controller__val = 1'd1;
				end
	end
	always @(*) begin : update_upper_bound
		ctrl_count_upper_bound = ctrl_count_lower_bound + ctrl_count_per_iter_val;
	end
	always @(posedge clk) begin : issue_complete
		if (reset)
			sent_complete <= 1'd0;
		else if ((send_pkt_to_controller__val & send_pkt_to_controller__rdy) & (send_pkt_to_controller__msg[173-:6] == sv2v_cast_6(__const__CMD_COMPLETE)))
			sent_complete <= 1'd1;
		else if (recv_pkt_from_controller_queue__send__val & ((recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_LAUNCH)) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_RESUME))))
			sent_complete <= 1'd0;
	end
	always @(posedge clk) begin : update_ctrl_count_per_iter
		if (reset)
			ctrl_count_per_iter_val <= 3'd6;
		else if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_COUNT_PER_ITER)))
			ctrl_count_per_iter_val <= sv2v_cast_3(recv_pkt_from_controller_queue__send__msg[167-:32]);
	end
	always @(posedge clk) begin : update_lower_bound
		if (reset)
			ctrl_count_lower_bound <= 3'd0;
		else if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_CTRL_LOWER_BOUND)))
			ctrl_count_lower_bound <= sv2v_cast_3(recv_pkt_from_controller_queue__send__msg[167-:32]);
	end
	always @(posedge clk) begin : update_prologue_reg
		if (reset) begin : sv2v_autoblock_10
			reg [31:0] addr;
			for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_reg; addr = addr + 1'd1)
				begin
					begin : sv2v_autoblock_11
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_routing_xbar_inports_at_update_prologue_reg; i = i + 1'd1)
							prologue_count_reg_routing_crossbar[sv2v_cast_3(addr)][sv2v_cast_3(i)] <= 3'd0;
					end
					begin : sv2v_autoblock_12
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_fu_outports_at_update_prologue_reg; i = i + 1'd1)
							prologue_count_reg_fu_crossbar[sv2v_cast_3(addr)][sv2v_cast_1(i)] <= 3'd0;
					end
				end
		end
		else if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR))) begin
			__tmpvar__update_prologue_reg_temp_routing_crossbar_in = recv_pkt_from_controller_queue__send__msg[75 + (3'd0 * 4)+:4];
			if (__tmpvar__update_prologue_reg_temp_routing_crossbar_in > 4'd0)
				prologue_count_reg_routing_crossbar[recv_pkt_from_controller_queue__send__msg[2-:3]][sv2v_cast_3(__tmpvar__update_prologue_reg_temp_routing_crossbar_in - 4'd1)] <= sv2v_cast_3(recv_pkt_from_controller_queue__send__msg[167-:32]);
		end
		else if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR))) begin
			__tmpvar__update_prologue_reg_temp_fu_crossbar_in = recv_pkt_from_controller_queue__send__msg[59 + (3'd0 * 2)+:2];
			prologue_count_reg_fu_crossbar[recv_pkt_from_controller_queue__send__msg[2-:3]][sv2v_cast_1(__tmpvar__update_prologue_reg_temp_fu_crossbar_in)] <= sv2v_cast_3(recv_pkt_from_controller_queue__send__msg[167-:32]);
		end
	end
	always @(posedge clk) begin : update_raddr_and_fu_prologue
		if (reset) begin
			times <= 11'd0;
			reg_file__raddr[1'd0 * 3+:3] <= 3'd0;
			begin : sv2v_autoblock_13
				reg [31:0] i;
				for (i = 1'd0; i < __const__ctrl_mem_size_at_update_raddr_and_fu_prologue; i = i + 1'd1)
					prologue_count_reg_fu[sv2v_cast_3(i)] <= 3'd0;
			end
		end
		else if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_CTRL_LOWER_BOUND)))
			reg_file__raddr[1'd0 * 3+:3] <= sv2v_cast_3(recv_pkt_from_controller_queue__send__msg[167-:32]);
		else if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_TERMINATE)))
			times <= 11'd0;
		else begin
			if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU)))
				prologue_count_reg_fu[recv_pkt_from_controller_queue__send__msg[2-:3]] <= sv2v_cast_3(recv_pkt_from_controller_queue__send__msg[167-:32]);
			if (start_iterate_ctrl == 1'd1) begin
				if ((((total_ctrl_steps_val == 11'd0) | (times < total_ctrl_steps_val)) & send_ctrl__rdy) & send_ctrl__val)
					times <= times + 11'd1;
				if (send_ctrl__rdy & send_ctrl__val) begin
					if (reg_file__raddr[1'd0 * 3+:3] == (ctrl_count_upper_bound - 3'd1))
						reg_file__raddr[1'd0 * 3+:3] <= ctrl_count_lower_bound;
					else
						reg_file__raddr[1'd0 * 3+:3] <= reg_file__raddr[1'd0 * 3+:3] + 3'd1;
					if (prologue_count_reg_fu[reg_file__raddr[1'd0 * 3+:3]] > 3'd0)
						prologue_count_reg_fu[reg_file__raddr[1'd0 * 3+:3]] <= prologue_count_reg_fu[reg_file__raddr[1'd0 * 3+:3]] - 3'd1;
				end
			end
		end
	end
	function automatic [10:0] sv2v_cast_11;
		input reg [10:0] inp;
		sv2v_cast_11 = inp;
	endfunction
	always @(posedge clk) begin : update_total_ctrl_steps
		if (reset)
			total_ctrl_steps_val <= 11'd6;
		else if (recv_pkt_from_controller_queue__send__val & (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_TOTAL_CTRL_COUNT)))
			total_ctrl_steps_val <= sv2v_cast_11(recv_pkt_from_controller_queue__send__msg[167-:32]);
	end
	always @(posedge clk) begin : update_whether_we_can_iterate_ctrl
		if (reset)
			start_iterate_ctrl <= 1'd0;
		else if (recv_pkt_from_controller_queue__send__val)
			if ((recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_LAUNCH)) | (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_RESUME)))
				start_iterate_ctrl <= 1'd1;
			else if (recv_pkt_from_controller_queue__send__msg[173-:6] == sv2v_cast_6(__const__CMD_TERMINATE))
				start_iterate_ctrl <= 1'd0;
	end
	assign reg_file__clk = clk;
	assign reg_file__reset = reset;
	assign recv_pkt_from_controller_queue__clk = clk;
	assign recv_pkt_from_controller_queue__reset = reset;
	assign recv_from_element_queue__clk = clk;
	assign recv_from_element_queue__reset = reset;
	assign recv_pkt_from_controller_queue__recv__msg = recv_pkt_from_controller__msg;
	assign recv_pkt_from_controller__rdy = recv_pkt_from_controller_queue__recv__rdy;
	assign recv_pkt_from_controller_queue__recv__val = recv_pkt_from_controller__val;
	assign recv_from_element_queue__recv__msg = recv_from_element__msg;
	assign recv_from_element__rdy = recv_from_element_queue__recv__rdy;
	assign recv_from_element_queue__recv__val = recv_from_element__val;
endmodule
module AdderRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_ADD = 7'd2;
	localparam [6:0] __const__OPT_ADD_CONST = 7'd25;
	localparam [6:0] __const__OPT_INC = 7'd3;
	localparam [6:0] __const__OPT_SUB = 7'd4;
	localparam [6:0] __const__OPT_SUB_CONST = 7'd36;
	localparam [6:0] __const__OPT_PAS = 7'd31;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_ADD) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] + recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_ADD_CONST) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] + recv_const__msg[34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				recv_const__rdy = send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_INC) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] + 32'd1;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = recv_in__msg[((3 - in0_idx) * 35) + 2] & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_SUB) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] - recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_SUB_CONST) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] - recv_const__msg[34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_PAS) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = recv_in__msg[((3 - in0_idx) * 35) + 2] & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
endmodule
module NahRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_NAH = 7'd1;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val & (recv_opt__msg[122-:7] == __const__OPT_NAH))
			recv_opt__rdy = 1'd1;
		else begin
			begin : sv2v_autoblock_3
				reg [31:0] j;
				for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
					send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
			end
			recv_opt__rdy = 1'd0;
		end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
endmodule
module MulRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_MUL = 7'd7;
	localparam [6:0] __const__OPT_MUL_CONST = 7'd29;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_MUL) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] * recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_MUL_CONST) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] * recv_const__msg[34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = recv_in__msg[((3 - in0_idx) * 35) + 2] & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
endmodule
module LogicRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_OR = 7'd8;
	localparam [6:0] __const__OPT_AND = 7'd10;
	localparam [6:0] __const__OPT_BIT_NOT = 7'd43;
	localparam [6:0] __const__OPT_NOT = 7'd11;
	localparam [6:0] __const__OPT_XOR = 7'd9;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_OR) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] | recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_AND) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] & recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_BIT_NOT) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = ~recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = recv_in__msg[((3 - in0_idx) * 35) + 2] & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_NOT) begin
				if (recv_in__msg[((3 - in0_idx) * 35) + 34-:32] == 32'd0)
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = 32'd1;
				else
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = 32'd0;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = recv_in__msg[((3 - in0_idx) * 35) + 2] & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_XOR) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] ^ recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
endmodule
module ShifterRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_LLS = 7'd5;
	localparam [6:0] __const__OPT_LLS_CONST = 7'd96;
	localparam [6:0] __const__OPT_LRS = 7'd6;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_LLS) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] << recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_LLS_CONST) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] << recv_const__msg[34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_LRS) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32] >> recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
endmodule
module PhiRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_PHI = 7'd17;
	localparam [6:0] __const__OPT_PHI_START = 7'd84;
	localparam [6:0] __const__OPT_PHI_CONST = 7'd32;
	reg [0:0] first [0:7];
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_PHI) begin
				if (recv_in__msg[((3 - in0_idx) * 35) + 2] == 1'd1) begin
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor;
				end
				else if (recv_in__msg[((3 - in1_idx) * 35) + 2] == 1'd1) begin
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor;
				end
				else begin
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = 1'd0;
				end
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_PHI_START) begin
				if (first[ctrl_addr_inport]) begin
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor;
				end
				else if (recv_in__msg[((3 - in0_idx) * 35) + 2] == 1'd1) begin
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor;
				end
				else if (recv_in__msg[((3 - in1_idx) * 35) + 2] == 1'd1) begin
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in1_idx) * 35) + 34-:32];
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor;
				end
				else begin
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = 1'd0;
				end
				recv_all_val = (first[ctrl_addr_inport] & recv_in__val[3 - in0_idx+:1]) | ((~first[ctrl_addr_inport] & recv_in__val[3 - in0_idx+:1]) & recv_in__val[3 - in1_idx+:1]);
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = (~first[ctrl_addr_inport] & recv_all_val) & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_PHI_CONST) begin
				if (first[ctrl_addr_inport])
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_const__msg[34-:32];
				else
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
				recv_all_val = (first[ctrl_addr_inport] & recv_const__val) | (~first[ctrl_addr_inport] & recv_in__val[3 - in0_idx+:1]);
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				if (first[ctrl_addr_inport])
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = recv_const__msg[2] & reached_vector_factor;
				else
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = recv_in__msg[((3 - in0_idx) * 35) + 2] & reached_vector_factor;
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(posedge clk) begin : record_first_execution
		if (reset | clear) begin : sv2v_autoblock_4
			reg [31:0] i;
			for (i = 1'd0; i < (2'd2 ** 2'd3); i = i + 1'd1)
				first[sv2v_cast_3(i)] <= 1'd1;
		end
		if (((recv_opt__msg[122-:7] == __const__OPT_PHI_CONST) | (recv_opt__msg[122-:7] == __const__OPT_PHI_START)) & reached_vector_factor)
			first[ctrl_addr_inport] <= 1'd0;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
endmodule
module CompRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_one = 35'h000000008;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_read_reg = 3'd4;
	localparam [1:0] __const__num_outports_at_read_reg = 2'd2;
	localparam [6:0] __const__OPT_EQ = 7'd14;
	localparam [6:0] __const__OPT_NE = 7'd45;
	localparam [6:0] __const__OPT_EQ_CONST = 7'd33;
	localparam [6:0] __const__OPT_NE_CONST = 7'd46;
	localparam [6:0] __const__OPT_LT = 7'd60;
	localparam [31:0] __const__sign_flip_at_read_reg = 32'd2147483648;
	localparam [6:0] __const__OPT_GTE_CONST = 7'd90;
	localparam [6:0] __const__OPT_GT_CONST = 7'd97;
	localparam [6:0] __const__OPT_LT_CONST = 7'd98;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : read_reg
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_read_reg; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_read_reg; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if ((recv_opt__msg[122-:7] == __const__OPT_EQ) | (recv_opt__msg[122-:7] == __const__OPT_NE)) begin
				if ((recv_opt__msg[122-:7] == __const__OPT_EQ) & (recv_in__msg[((3 - in0_idx) * 35) + 34-:32] == recv_in__msg[((3 - in1_idx) * 35) + 34-:32]))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else if ((recv_opt__msg[122-:7] == __const__OPT_NE) & (recv_in__msg[((3 - in0_idx) * 35) + 34-:32] != recv_in__msg[((3 - in1_idx) * 35) + 34-:32]))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_zero;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if ((recv_opt__msg[122-:7] == __const__OPT_EQ_CONST) | (recv_opt__msg[122-:7] == __const__OPT_NE_CONST)) begin
				if ((recv_opt__msg[122-:7] == __const__OPT_EQ_CONST) & (recv_in__msg[((3 - in0_idx) * 35) + 34-:32] == recv_const__msg[34-:32]))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else if ((recv_opt__msg[122-:7] == __const__OPT_NE_CONST) & (recv_in__msg[((3 - in0_idx) * 35) + 34-:32] != recv_const__msg[34-:32]))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_zero;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_LT) begin
				if ((recv_in__msg[((3 - in0_idx) * 35) + 34-:32] ^ __const__sign_flip_at_read_reg) < (recv_in__msg[((3 - in1_idx) * 35) + 34-:32] ^ __const__sign_flip_at_read_reg))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_zero;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_GTE_CONST) begin
				if ((recv_in__msg[((3 - in0_idx) * 35) + 34-:32] ^ __const__sign_flip_at_read_reg) >= (recv_const__msg[34-:32] ^ __const__sign_flip_at_read_reg))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_zero;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_GT_CONST) begin
				if ((recv_in__msg[((3 - in0_idx) * 35) + 34-:32] ^ __const__sign_flip_at_read_reg) > (recv_const__msg[34-:32] ^ __const__sign_flip_at_read_reg))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_zero;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_LT_CONST) begin
				if ((recv_in__msg[((3 - in0_idx) * 35) + 34-:32] ^ __const__sign_flip_at_read_reg) < (recv_const__msg[34-:32] ^ __const__sign_flip_at_read_reg))
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_one;
				else
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = const_zero;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_read_reg; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
endmodule
module GrantRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_GRT_PRED = 7'd16;
	localparam [6:0] __const__OPT_GRT_ALWAYS = 7'd34;
	localparam [6:0] __const__OPT_GRT_ONCE = 7'd47;
	localparam [6:0] __const__OPT_GRT_ONCE_CONST = 7'd88;
	localparam [3:0] __const__num_slots_at_record_grt_once = 4'd8;
	reg [0:0] already_grt_once [0:7];
	reg [0:0] cur_already_grt_once;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		cur_already_grt_once = already_grt_once[ctrl_addr_inport];
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_GRT_PRED) begin
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 34-:32] = recv_in__msg[((3 - in0_idx) * 35) + 34-:32];
				if (recv_in__msg[((3 - in1_idx) * 35) + 34-:32] != 32'd0)
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				else
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = 1'd0;
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_GRT_ALWAYS) begin
				send_out__msg[((1 - 1'd0) + 0) * 35+:35] = recv_in__msg[(3 - in0_idx) * 35+:35];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor;
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_GRT_ONCE) begin
				send_out__msg[((1 - 1'd0) + 0) * 35+:35] = recv_in__msg[(3 - in0_idx) * 35+:35];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor & ~cur_already_grt_once;
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_GRT_ONCE_CONST) begin
				send_out__msg[((1 - 1'd0) + 0) * 35+:35] = recv_const__msg;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = reached_vector_factor & ~cur_already_grt_once;
				recv_all_val = recv_const__val;
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_const__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(posedge clk) begin : record_grt_once
		begin : sv2v_autoblock_4
			reg [31:0] k;
			for (k = 1'd0; k < __const__num_slots_at_record_grt_once; k = k + 1'd1)
				if (reset | clear)
					already_grt_once[sv2v_cast_3(k)] <= 1'd0;
				else if (((((ctrl_addr_inport == sv2v_cast_3(k)) & ~already_grt_once[sv2v_cast_3(k)]) & send_out__val[(1 - 1'd0) + 0+:1]) & send_out__rdy[(1 - 1'd0) + 0+:1]) & ((recv_opt__msg[122-:7] == __const__OPT_GRT_ONCE) | (recv_opt__msg[122-:7] == __const__OPT_GRT_ONCE_CONST)))
					already_grt_once[sv2v_cast_3(k)] <= 1'd1;
				else
					already_grt_once[sv2v_cast_3(k)] <= already_grt_once[sv2v_cast_3(k)];
		end
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
endmodule
module MemUnitRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_LD = 7'd12;
	localparam [6:0] __const__OPT_ADD_CONST_LD = 7'd81;
	localparam [6:0] __const__OPT_LD_CONST = 7'd28;
	localparam [6:0] __const__OPT_STR = 7'd13;
	localparam [6:0] __const__OPT_STR_CONST = 7'd58;
	reg [0:0] already_sent_raddr;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	wire [3:0] recv_in_val_vector;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	function automatic [6:0] sv2v_cast_7;
		input reg [6:0] inp;
		sv2v_cast_7 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
		end
		to_mem_waddr__val = 1'd0;
		to_mem_waddr__msg = 7'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = 35'h000000000;
		to_mem_raddr__val = 1'd0;
		to_mem_raddr__msg = 7'd0;
		from_mem_rdata__rdy = 1'd0;
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_LD) begin
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & to_mem_raddr__rdy;
				to_mem_raddr__msg = sv2v_cast_7(recv_in__msg[((3 - in0_idx) * 35) + ((3 + 5'd6) >= (3 + 5'd0) ? 3 + 5'd6 : ((3 + 5'd6) + ((3 + 5'd6) >= (3 + 5'd0) ? ((3 + 5'd6) - (3 + 5'd0)) + 1 : ((3 + 5'd0) - (3 + 5'd6)) + 1)) - 1)-:((3 + 5'd6) >= (3 + 5'd0) ? ((3 + 5'd6) - (3 + 5'd0)) + 1 : ((3 + 5'd0) - (3 + 5'd6)) + 1)]);
				if (recv_all_val & (recv_in__msg[((3 - in0_idx) * 35) + 2] == 1'd0))
					to_mem_raddr__val = 1'd0;
				else
					to_mem_raddr__val = recv_all_val & ~already_sent_raddr;
				from_mem_rdata__rdy = send_out__rdy[(1 - 1'd0) + 0+:1];
				if (recv_all_val & (recv_in__msg[((3 - in0_idx) * 35) + 2] == 1'd0)) begin
					send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = 1'd0;
					recv_opt__rdy = send_out__rdy[(1 - 1'd0) + 0+:1];
				end
				else begin
					send_out__val[(1 - 1'd0) + 0+:1] = from_mem_rdata__val;
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = from_mem_rdata__msg;
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = from_mem_rdata__msg[2] & reached_vector_factor;
					recv_opt__rdy = send_out__rdy[(1 - 1'd0) + 0+:1] & from_mem_rdata__val;
				end
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_ADD_CONST_LD) begin
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & to_mem_raddr__rdy;
				recv_const__rdy = 1'd1;
				to_mem_raddr__msg = sv2v_cast_7(recv_in__msg[((3 - in0_idx) * 35) + ((3 + 5'd6) >= (3 + 5'd0) ? 3 + 5'd6 : ((3 + 5'd6) + ((3 + 5'd6) >= (3 + 5'd0) ? ((3 + 5'd6) - (3 + 5'd0)) + 1 : ((3 + 5'd0) - (3 + 5'd6)) + 1)) - 1)-:((3 + 5'd6) >= (3 + 5'd0) ? ((3 + 5'd6) - (3 + 5'd0)) + 1 : ((3 + 5'd0) - (3 + 5'd6)) + 1)] + recv_const__msg[3 + 5'd6:3 + 5'd0]);
				if (recv_all_val & (recv_in__msg[((3 - in0_idx) * 35) + 2] == 1'd0))
					to_mem_raddr__val = 1'd0;
				else
					to_mem_raddr__val = recv_all_val & ~already_sent_raddr;
				from_mem_rdata__rdy = send_out__rdy[(1 - 1'd0) + 0+:1];
				if (recv_all_val & (recv_in__msg[((3 - in0_idx) * 35) + 2] == 1'd0)) begin
					send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = 1'd0;
					recv_opt__rdy = send_out__rdy[(1 - 1'd0) + 0+:1];
				end
				else begin
					send_out__val[(1 - 1'd0) + 0+:1] = from_mem_rdata__val;
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = from_mem_rdata__msg;
					send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = from_mem_rdata__msg[2] & reached_vector_factor;
					recv_opt__rdy = send_out__rdy[(1 - 1'd0) + 0+:1] & from_mem_rdata__val;
				end
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_LD_CONST) begin
				recv_all_val = recv_const__val;
				recv_const__rdy = 1'd1;
				to_mem_raddr__msg = sv2v_cast_7(recv_const__msg[3 + 5'd6:3 + 5'd0]);
				to_mem_raddr__val = recv_all_val & ~already_sent_raddr;
				from_mem_rdata__rdy = send_out__rdy[(1 - 1'd0) + 0+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = from_mem_rdata__val;
				send_out__msg[((1 - 1'd0) + 0) * 35+:35] = from_mem_rdata__msg;
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = (recv_const__msg[2] & from_mem_rdata__msg[2]) & reached_vector_factor;
				recv_opt__rdy = send_out__rdy[(1 - 1'd0) + 0+:1] & from_mem_rdata__val;
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_STR) begin
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1];
				recv_in__rdy[3 - in0_idx+:1] = (recv_all_val & to_mem_waddr__rdy) & to_mem_wdata__rdy;
				recv_in__rdy[3 - in1_idx+:1] = (recv_all_val & to_mem_waddr__rdy) & to_mem_wdata__rdy;
				to_mem_waddr__msg = sv2v_cast_7(recv_in__msg[((3 - in0_idx) * 35) + ((3 + 5'd6) >= (3 + 5'd0) ? 3 + 5'd6 : ((3 + 5'd6) + ((3 + 5'd6) >= (3 + 5'd0) ? ((3 + 5'd6) - (3 + 5'd0)) + 1 : ((3 + 5'd0) - (3 + 5'd6)) + 1)) - 1)-:((3 + 5'd6) >= (3 + 5'd0) ? ((3 + 5'd6) - (3 + 5'd0)) + 1 : ((3 + 5'd0) - (3 + 5'd6)) + 1)]);
				to_mem_waddr__val = (recv_all_val & recv_in__msg[((3 - in0_idx) * 35) + 2]) & recv_in__msg[((3 - in1_idx) * 35) + 2];
				to_mem_wdata__msg = recv_in__msg[(3 - in1_idx) * 35+:35];
				to_mem_wdata__msg[2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & reached_vector_factor;
				to_mem_wdata__val = (recv_all_val & recv_in__msg[((3 - in0_idx) * 35) + 2]) & recv_in__msg[((3 - in1_idx) * 35) + 2];
				send_out__val[(1 - 1'd0) + 0+:1] = 1'd0;
				recv_opt__rdy = (recv_all_val & to_mem_waddr__rdy) & to_mem_wdata__rdy;
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_STR_CONST) begin
				recv_all_val = recv_in__val[3 - in0_idx+:1] & recv_const__val;
				recv_const__rdy = (recv_all_val & to_mem_waddr__rdy) & to_mem_wdata__rdy;
				recv_in__rdy[3 - in0_idx+:1] = (recv_all_val & to_mem_waddr__rdy) & to_mem_wdata__rdy;
				to_mem_waddr__msg = sv2v_cast_7(recv_const__msg[3 + 5'd6:3 + 5'd0]);
				to_mem_waddr__val = (recv_all_val & recv_in__msg[((3 - in0_idx) * 35) + 2]) & recv_const__msg[2];
				to_mem_wdata__msg = recv_in__msg[(3 - in0_idx) * 35+:35];
				to_mem_wdata__msg[2] = (recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_const__msg[2]) & reached_vector_factor;
				to_mem_wdata__val = (recv_all_val & recv_in__msg[((3 - in0_idx) * 35) + 2]) & recv_const__msg[2];
				send_out__val[(1 - 1'd0) + 0+:1] = 1'd0;
				recv_opt__rdy = (recv_all_val & to_mem_waddr__rdy) & to_mem_wdata__rdy;
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : update_already_sent_raddr
		if (reset)
			already_sent_raddr <= 1'd0;
		else if (~recv_opt__val)
			already_sent_raddr <= 1'd0;
		else if (from_mem_rdata__val & from_mem_rdata__rdy)
			already_sent_raddr <= 1'd0;
		else if ((to_mem_raddr__val & to_mem_raddr__rdy) & ~already_sent_raddr)
			already_sent_raddr <= 1'd1;
		else
			already_sent_raddr <= already_sent_raddr;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
	assign vector_factor_power = 3'd0;
endmodule
module SelRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_SEL = 7'd27;
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [2:0] in1;
	wire [1:0] in1_idx;
	reg [2:0] in2;
	wire [1:0] in2_idx;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		in1 = 3'd0;
		in2 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		recv_const__rdy = 1'd0;
		recv_opt__rdy = send_out__rdy[(1 - 1'd0) + 0+:1];
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_comb_logic; i = i + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(i)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(i)) * 35+:35] = 35'h000000000;
				end
		end
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		if (recv_opt__val) begin
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd1 * 3)+:3] != 3'd0)
				in1 = recv_opt__msg[104 + (2'd1 * 3)+:3] - 3'd1;
			if (recv_opt__msg[104 + (2'd2 * 3)+:3] != 3'd0)
				in2 = recv_opt__msg[104 + (2'd2 * 3)+:3] - 3'd1;
		end
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_SEL) begin
				if (recv_in__msg[((3 - in0_idx) * 35) + 34-:32] == 32'd1)
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = recv_in__msg[(3 - in1_idx) * 35+:35];
				else
					send_out__msg[((1 - 1'd0) + 0) * 35+:35] = recv_in__msg[(3 - in2_idx) * 35+:35];
				send_out__msg[(((1 - 1'd0) + 0) * 35) + 2] = ((recv_in__msg[((3 - in0_idx) * 35) + 2] & recv_in__msg[((3 - in1_idx) * 35) + 2]) & recv_in__msg[((3 - in2_idx) * 35) + 2]) & reached_vector_factor;
				recv_all_val = (recv_in__val[3 - in0_idx+:1] & recv_in__val[3 - in1_idx+:1]) & recv_in__val[3 - in2_idx+:1];
				send_out__val[(1 - 1'd0) + 0+:1] = recv_all_val;
				recv_in__rdy[3 - in0_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in1_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_in__rdy[3 - in2_idx+:1] = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
				recv_opt__rdy = recv_all_val & send_out__rdy[(1 - 1'd0) + 0+:1];
			end
			else begin
				begin : sv2v_autoblock_3
					reg [31:0] j;
					for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
						send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
				end
				recv_opt__rdy = 1'd0;
				recv_in__rdy[3 - in0_idx+:1] = 1'd0;
				recv_in__rdy[3 - in1_idx+:1] = 1'd0;
				recv_in__rdy[3 - in2_idx+:1] = 1'd0;
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign in0_idx = in0[1:0];
	assign in1_idx = in1[1:0];
	assign in2_idx = in2[1:0];
	assign vector_factor_power = 3'd0;
endmodule
module RetRTL__21e487e69ebe8a50 (
	clear,
	clk,
	ctrl_addr_inport,
	reset,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [0:0] reset;
	input wire [34:0] from_mem_rdata__msg;
	output reg [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output reg [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output reg [0:0] to_mem_raddr__val;
	output reg [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output reg [0:0] to_mem_waddr__val;
	output reg [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output reg [0:0] to_mem_wdata__val;
	localparam [34:0] const_zero = 35'h000000000;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [0:0] __const__latency_at_proceed_latency = 1'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_RET = 7'd35;
	localparam [3:0] __const__CMD_COMPLETE = 4'd14;
	localparam [6:0] __const__OPT_RET_VOID = 7'd64;
	localparam [3:0] __const__ctrl_mem_size_at_update_already_done = 4'd8;
	reg [0:0] already_done [0:7];
	reg [2:0] in0;
	wire [1:0] in0_idx;
	reg [0:0] latency;
	reg [0:0] reached_vector_factor;
	reg [0:0] recv_all_val;
	reg [7:0] vector_factor_counter;
	wire [2:0] vector_factor_power;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin : comb_logic
		recv_all_val = 1'd0;
		in0 = 3'd0;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_comb_logic; i = i + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_2
			reg [31:0] j;
			for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(j)) * 35+:35] = 35'h000000000;
				end
		end
		send_to_ctrl_mem__val = 1'd0;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		recv_from_ctrl_mem__rdy = 1'd0;
		recv_const__rdy = 1'd0;
		recv_opt__rdy = 1'd0;
		if (recv_opt__val)
			if (recv_opt__msg[104 + (2'd0 * 3)+:3] != 3'd0)
				in0 = recv_opt__msg[104 + (2'd0 * 3)+:3] - 3'd1;
		if (recv_opt__val)
			if (recv_opt__msg[122-:7] == __const__OPT_RET) begin
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				if (already_done[ctrl_addr_inport]) begin
					recv_in__rdy[3 - in0_idx+:1] = recv_all_val;
					recv_opt__rdy = recv_all_val;
				end
				else if (recv_in__msg[((3 - in0_idx) * 35) + 2]) begin
					send_to_ctrl_mem__val = recv_all_val & reached_vector_factor;
					send_to_ctrl_mem__msg = {sv2v_cast_6(__const__CMD_COMPLETE), recv_in__msg[(3 - in0_idx) * 35+:35], 7'd0, recv_opt__msg, 3'd0};
					recv_in__rdy[3 - in0_idx+:1] = (recv_all_val & reached_vector_factor) & send_to_ctrl_mem__rdy;
					recv_opt__rdy = (recv_all_val & reached_vector_factor) & send_to_ctrl_mem__rdy;
				end
				else begin
					recv_in__rdy[3 - in0_idx+:1] = recv_all_val & reached_vector_factor;
					recv_opt__rdy = recv_all_val & reached_vector_factor;
				end
			end
			else if (recv_opt__msg[122-:7] == __const__OPT_RET_VOID) begin
				recv_all_val = recv_in__val[3 - in0_idx+:1];
				if (already_done[ctrl_addr_inport]) begin
					recv_in__rdy[3 - in0_idx+:1] = recv_all_val;
					recv_opt__rdy = recv_all_val;
				end
				else if (recv_in__msg[((3 - in0_idx) * 35) + 2]) begin
					send_to_ctrl_mem__val = recv_all_val & reached_vector_factor;
					send_to_ctrl_mem__msg = {sv2v_cast_6(__const__CMD_COMPLETE), 35'd0, 7'd0, recv_opt__msg, 3'd0};
					recv_in__rdy[3 - in0_idx+:1] = (recv_all_val & reached_vector_factor) & send_to_ctrl_mem__rdy;
					recv_opt__rdy = (recv_all_val & reached_vector_factor) & send_to_ctrl_mem__rdy;
				end
				else begin
					recv_in__rdy[3 - in0_idx+:1] = recv_all_val & reached_vector_factor;
					recv_opt__rdy = recv_all_val & reached_vector_factor;
				end
			end
	end
	always @(*) begin : update_mem
		to_mem_waddr__val = 1'd0;
		to_mem_wdata__val = 1'd0;
		to_mem_wdata__msg = const_zero;
		to_mem_waddr__msg = 7'd0;
		to_mem_raddr__msg = 7'd0;
		to_mem_raddr__val = 1'd0;
		from_mem_rdata__rdy = 1'd0;
	end
	always @(*) begin : update_reached_vector_factor
		reached_vector_factor = 1'd0;
		if (recv_opt__val & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) >= (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
			reached_vector_factor = 1'd1;
	end
	always @(posedge clk) begin : proceed_latency
		if (recv_opt__msg[122-:7] == __const__OPT_START)
			latency <= 1'd0;
		else if (latency == (__const__latency_at_proceed_latency - 1'd1))
			latency <= 1'd0;
		else
			latency <= latency + 1'd1;
	end
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(posedge clk) begin : update_already_done
		if (reset | clear) begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__ctrl_mem_size_at_update_already_done; i = i + 1'd1)
				already_done[sv2v_cast_3(i)] <= 1'd0;
		end
		else if ((((((recv_opt__val & ((recv_opt__msg[122-:7] == __const__OPT_RET) | (recv_opt__msg[122-:7] == __const__OPT_RET_VOID))) & ~already_done[ctrl_addr_inport]) & recv_all_val) & recv_in__msg[((3 - in0_idx) * 35) + 2]) & send_to_ctrl_mem__val) & send_to_ctrl_mem__rdy) begin : sv2v_autoblock_4
			reg [31:0] i;
			for (i = 1'd0; i < __const__ctrl_mem_size_at_update_already_done; i = i + 1'd1)
				if (sv2v_cast_3(i) == ctrl_addr_inport)
					already_done[sv2v_cast_3(i)] <= 1'd1;
				else
					already_done[sv2v_cast_3(i)] <= already_done[sv2v_cast_3(i)];
		end
		else begin : sv2v_autoblock_5
			reg [31:0] i;
			for (i = 1'd0; i < __const__ctrl_mem_size_at_update_already_done; i = i + 1'd1)
				already_done[sv2v_cast_3(i)] <= already_done[sv2v_cast_3(i)];
		end
	end
	always @(posedge clk) begin : update_vector_factor_counter
		if (reset)
			vector_factor_counter <= 8'd0;
		else if (recv_opt__val)
			if (recv_opt__msg[52] & ((vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power})) < (8'd1 << {{5 {1'b0}}, recv_opt__msg[55-:3]})))
				vector_factor_counter <= vector_factor_counter + (8'd1 << {{5 {1'b0}}, vector_factor_power});
			else if (recv_opt__msg[52] & reached_vector_factor)
				vector_factor_counter <= 8'd0;
	end
	assign vector_factor_power = 3'd0;
	assign in0_idx = in0[1:0];
endmodule
module FlexibleFuRTL__489b9127525b3431 (
	clear,
	clk,
	ctrl_addr_inport,
	prologue_count_inport,
	reset,
	tile_id,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_const__msg,
	recv_const__rdy,
	recv_const__val,
	recv_from_ctrl_mem__msg,
	recv_from_ctrl_mem__rdy,
	recv_from_ctrl_mem__val,
	recv_in__msg,
	recv_in__rdy,
	recv_in__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	recv_pkt_from_controller__msg,
	recv_pkt_from_controller__rdy,
	recv_pkt_from_controller__val,
	send_out__msg,
	send_out__rdy,
	send_out__val,
	send_to_ctrl_mem__msg,
	send_to_ctrl_mem__rdy,
	send_to_ctrl_mem__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [10:0] clear;
	input wire [0:0] clk;
	input wire [2:0] ctrl_addr_inport;
	input wire [2:0] prologue_count_inport;
	input wire [0:0] reset;
	input wire [2:0] tile_id;
	input wire [384:0] from_mem_rdata__msg;
	output wire [10:0] from_mem_rdata__rdy;
	input wire [10:0] from_mem_rdata__val;
	input wire [34:0] recv_const__msg;
	output reg [0:0] recv_const__rdy;
	input wire [0:0] recv_const__val;
	input wire [173:0] recv_from_ctrl_mem__msg;
	output reg [0:0] recv_from_ctrl_mem__rdy;
	input wire [0:0] recv_from_ctrl_mem__val;
	input wire [139:0] recv_in__msg;
	output reg [3:0] recv_in__rdy;
	input wire [3:0] recv_in__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	input wire [198:0] recv_pkt_from_controller__msg;
	output wire [0:0] recv_pkt_from_controller__rdy;
	input wire [0:0] recv_pkt_from_controller__val;
	output reg [69:0] send_out__msg;
	input wire [1:0] send_out__rdy;
	output reg [1:0] send_out__val;
	output reg [173:0] send_to_ctrl_mem__msg;
	input wire [0:0] send_to_ctrl_mem__rdy;
	output reg [0:0] send_to_ctrl_mem__val;
	output wire [76:0] to_mem_raddr__msg;
	input wire [10:0] to_mem_raddr__rdy;
	output wire [10:0] to_mem_raddr__val;
	output wire [76:0] to_mem_waddr__msg;
	input wire [10:0] to_mem_waddr__rdy;
	output wire [10:0] to_mem_waddr__val;
	output wire [384:0] to_mem_wdata__msg;
	input wire [10:0] to_mem_wdata__rdy;
	output wire [10:0] to_mem_wdata__val;
	localparam [1:0] __const__num_outports_at_comb_logic = 2'd2;
	localparam [6:0] __const__OPT_NAH = 7'd1;
	localparam [2:0] __const__num_inports_at_comb_logic = 3'd4;
	reg [10:0] fu_recv_const_rdy_vector;
	reg [10:0] fu_recv_in_rdy_vector [0:3];
	reg [10:0] fu_recv_opt_rdy_vector;
	reg [10:0] recv_from_controller_rdy_vector;
	wire [0:0] fu__clear [0:10];
	wire [0:0] fu__clk [0:10];
	reg [2:0] fu__ctrl_addr_inport [0:10];
	wire [0:0] fu__reset [0:10];
	wire [34:0] fu__from_mem_rdata__msg [0:10];
	wire [0:0] fu__from_mem_rdata__rdy [0:10];
	wire [0:0] fu__from_mem_rdata__val [0:10];
	reg [34:0] fu__recv_const__msg [0:10];
	wire [0:0] fu__recv_const__rdy [0:10];
	reg [0:0] fu__recv_const__val [0:10];
	reg [173:0] fu__recv_from_ctrl_mem__msg [0:10];
	wire [0:0] fu__recv_from_ctrl_mem__rdy [0:10];
	reg [0:0] fu__recv_from_ctrl_mem__val [0:10];
	reg [139:0] fu__recv_in__msg [0:10];
	wire [3:0] fu__recv_in__rdy [0:10];
	reg [3:0] fu__recv_in__val [0:10];
	reg [122:0] fu__recv_opt__msg [0:10];
	wire [0:0] fu__recv_opt__rdy [0:10];
	reg [0:0] fu__recv_opt__val [0:10];
	wire [69:0] fu__send_out__msg [0:10];
	reg [1:0] fu__send_out__rdy [0:10];
	wire [1:0] fu__send_out__val [0:10];
	wire [173:0] fu__send_to_ctrl_mem__msg [0:10];
	reg [0:0] fu__send_to_ctrl_mem__rdy [0:10];
	wire [0:0] fu__send_to_ctrl_mem__val [0:10];
	wire [6:0] fu__to_mem_raddr__msg [0:10];
	wire [0:0] fu__to_mem_raddr__rdy [0:10];
	wire [0:0] fu__to_mem_raddr__val [0:10];
	wire [6:0] fu__to_mem_waddr__msg [0:10];
	wire [0:0] fu__to_mem_waddr__rdy [0:10];
	wire [0:0] fu__to_mem_waddr__val [0:10];
	wire [34:0] fu__to_mem_wdata__msg [0:10];
	wire [0:0] fu__to_mem_wdata__rdy [0:10];
	wire [0:0] fu__to_mem_wdata__val [0:10];
	AdderRTL__21e487e69ebe8a50 fu__0(
		.clear(fu__clear[0]),
		.clk(fu__clk[0]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[0]),
		.reset(fu__reset[0]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[0]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[0]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[0]),
		.recv_const__msg(fu__recv_const__msg[0]),
		.recv_const__rdy(fu__recv_const__rdy[0]),
		.recv_const__val(fu__recv_const__val[0]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[0]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[0]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[0]),
		.recv_in__msg(fu__recv_in__msg[0]),
		.recv_in__rdy(fu__recv_in__rdy[0]),
		.recv_in__val(fu__recv_in__val[0]),
		.recv_opt__msg(fu__recv_opt__msg[0]),
		.recv_opt__rdy(fu__recv_opt__rdy[0]),
		.recv_opt__val(fu__recv_opt__val[0]),
		.send_out__msg(fu__send_out__msg[0]),
		.send_out__rdy(fu__send_out__rdy[0]),
		.send_out__val(fu__send_out__val[0]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[0]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[0]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[0]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[0]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[0]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[0]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[0]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[0]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[0]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[0]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[0]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[0])
	);
	MulRTL__21e487e69ebe8a50 fu__1(
		.clear(fu__clear[1]),
		.clk(fu__clk[1]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[1]),
		.reset(fu__reset[1]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[1]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[1]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[1]),
		.recv_const__msg(fu__recv_const__msg[1]),
		.recv_const__rdy(fu__recv_const__rdy[1]),
		.recv_const__val(fu__recv_const__val[1]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[1]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[1]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[1]),
		.recv_in__msg(fu__recv_in__msg[1]),
		.recv_in__rdy(fu__recv_in__rdy[1]),
		.recv_in__val(fu__recv_in__val[1]),
		.recv_opt__msg(fu__recv_opt__msg[1]),
		.recv_opt__rdy(fu__recv_opt__rdy[1]),
		.recv_opt__val(fu__recv_opt__val[1]),
		.send_out__msg(fu__send_out__msg[1]),
		.send_out__rdy(fu__send_out__rdy[1]),
		.send_out__val(fu__send_out__val[1]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[1]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[1]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[1]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[1]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[1]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[1]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[1]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[1]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[1]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[1]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[1]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[1])
	);
	LogicRTL__21e487e69ebe8a50 fu__2(
		.clear(fu__clear[2]),
		.clk(fu__clk[2]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[2]),
		.reset(fu__reset[2]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[2]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[2]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[2]),
		.recv_const__msg(fu__recv_const__msg[2]),
		.recv_const__rdy(fu__recv_const__rdy[2]),
		.recv_const__val(fu__recv_const__val[2]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[2]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[2]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[2]),
		.recv_in__msg(fu__recv_in__msg[2]),
		.recv_in__rdy(fu__recv_in__rdy[2]),
		.recv_in__val(fu__recv_in__val[2]),
		.recv_opt__msg(fu__recv_opt__msg[2]),
		.recv_opt__rdy(fu__recv_opt__rdy[2]),
		.recv_opt__val(fu__recv_opt__val[2]),
		.send_out__msg(fu__send_out__msg[2]),
		.send_out__rdy(fu__send_out__rdy[2]),
		.send_out__val(fu__send_out__val[2]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[2]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[2]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[2]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[2]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[2]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[2]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[2]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[2]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[2]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[2]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[2]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[2])
	);
	ShifterRTL__21e487e69ebe8a50 fu__3(
		.clear(fu__clear[3]),
		.clk(fu__clk[3]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[3]),
		.reset(fu__reset[3]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[3]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[3]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[3]),
		.recv_const__msg(fu__recv_const__msg[3]),
		.recv_const__rdy(fu__recv_const__rdy[3]),
		.recv_const__val(fu__recv_const__val[3]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[3]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[3]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[3]),
		.recv_in__msg(fu__recv_in__msg[3]),
		.recv_in__rdy(fu__recv_in__rdy[3]),
		.recv_in__val(fu__recv_in__val[3]),
		.recv_opt__msg(fu__recv_opt__msg[3]),
		.recv_opt__rdy(fu__recv_opt__rdy[3]),
		.recv_opt__val(fu__recv_opt__val[3]),
		.send_out__msg(fu__send_out__msg[3]),
		.send_out__rdy(fu__send_out__rdy[3]),
		.send_out__val(fu__send_out__val[3]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[3]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[3]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[3]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[3]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[3]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[3]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[3]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[3]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[3]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[3]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[3]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[3])
	);
	PhiRTL__21e487e69ebe8a50 fu__4(
		.clear(fu__clear[4]),
		.clk(fu__clk[4]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[4]),
		.reset(fu__reset[4]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[4]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[4]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[4]),
		.recv_const__msg(fu__recv_const__msg[4]),
		.recv_const__rdy(fu__recv_const__rdy[4]),
		.recv_const__val(fu__recv_const__val[4]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[4]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[4]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[4]),
		.recv_in__msg(fu__recv_in__msg[4]),
		.recv_in__rdy(fu__recv_in__rdy[4]),
		.recv_in__val(fu__recv_in__val[4]),
		.recv_opt__msg(fu__recv_opt__msg[4]),
		.recv_opt__rdy(fu__recv_opt__rdy[4]),
		.recv_opt__val(fu__recv_opt__val[4]),
		.send_out__msg(fu__send_out__msg[4]),
		.send_out__rdy(fu__send_out__rdy[4]),
		.send_out__val(fu__send_out__val[4]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[4]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[4]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[4]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[4]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[4]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[4]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[4]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[4]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[4]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[4]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[4]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[4])
	);
	CompRTL__21e487e69ebe8a50 fu__5(
		.clear(fu__clear[5]),
		.clk(fu__clk[5]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[5]),
		.reset(fu__reset[5]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[5]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[5]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[5]),
		.recv_const__msg(fu__recv_const__msg[5]),
		.recv_const__rdy(fu__recv_const__rdy[5]),
		.recv_const__val(fu__recv_const__val[5]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[5]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[5]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[5]),
		.recv_in__msg(fu__recv_in__msg[5]),
		.recv_in__rdy(fu__recv_in__rdy[5]),
		.recv_in__val(fu__recv_in__val[5]),
		.recv_opt__msg(fu__recv_opt__msg[5]),
		.recv_opt__rdy(fu__recv_opt__rdy[5]),
		.recv_opt__val(fu__recv_opt__val[5]),
		.send_out__msg(fu__send_out__msg[5]),
		.send_out__rdy(fu__send_out__rdy[5]),
		.send_out__val(fu__send_out__val[5]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[5]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[5]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[5]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[5]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[5]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[5]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[5]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[5]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[5]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[5]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[5]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[5])
	);
	GrantRTL__21e487e69ebe8a50 fu__6(
		.clear(fu__clear[6]),
		.clk(fu__clk[6]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[6]),
		.reset(fu__reset[6]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[6]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[6]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[6]),
		.recv_const__msg(fu__recv_const__msg[6]),
		.recv_const__rdy(fu__recv_const__rdy[6]),
		.recv_const__val(fu__recv_const__val[6]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[6]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[6]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[6]),
		.recv_in__msg(fu__recv_in__msg[6]),
		.recv_in__rdy(fu__recv_in__rdy[6]),
		.recv_in__val(fu__recv_in__val[6]),
		.recv_opt__msg(fu__recv_opt__msg[6]),
		.recv_opt__rdy(fu__recv_opt__rdy[6]),
		.recv_opt__val(fu__recv_opt__val[6]),
		.send_out__msg(fu__send_out__msg[6]),
		.send_out__rdy(fu__send_out__rdy[6]),
		.send_out__val(fu__send_out__val[6]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[6]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[6]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[6]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[6]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[6]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[6]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[6]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[6]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[6]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[6]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[6]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[6])
	);
	MemUnitRTL__21e487e69ebe8a50 fu__7(
		.clear(fu__clear[7]),
		.clk(fu__clk[7]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[7]),
		.reset(fu__reset[7]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[7]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[7]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[7]),
		.recv_const__msg(fu__recv_const__msg[7]),
		.recv_const__rdy(fu__recv_const__rdy[7]),
		.recv_const__val(fu__recv_const__val[7]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[7]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[7]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[7]),
		.recv_in__msg(fu__recv_in__msg[7]),
		.recv_in__rdy(fu__recv_in__rdy[7]),
		.recv_in__val(fu__recv_in__val[7]),
		.recv_opt__msg(fu__recv_opt__msg[7]),
		.recv_opt__rdy(fu__recv_opt__rdy[7]),
		.recv_opt__val(fu__recv_opt__val[7]),
		.send_out__msg(fu__send_out__msg[7]),
		.send_out__rdy(fu__send_out__rdy[7]),
		.send_out__val(fu__send_out__val[7]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[7]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[7]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[7]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[7]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[7]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[7]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[7]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[7]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[7]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[7]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[7]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[7])
	);
	SelRTL__21e487e69ebe8a50 fu__8(
		.clear(fu__clear[8]),
		.clk(fu__clk[8]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[8]),
		.reset(fu__reset[8]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[8]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[8]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[8]),
		.recv_const__msg(fu__recv_const__msg[8]),
		.recv_const__rdy(fu__recv_const__rdy[8]),
		.recv_const__val(fu__recv_const__val[8]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[8]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[8]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[8]),
		.recv_in__msg(fu__recv_in__msg[8]),
		.recv_in__rdy(fu__recv_in__rdy[8]),
		.recv_in__val(fu__recv_in__val[8]),
		.recv_opt__msg(fu__recv_opt__msg[8]),
		.recv_opt__rdy(fu__recv_opt__rdy[8]),
		.recv_opt__val(fu__recv_opt__val[8]),
		.send_out__msg(fu__send_out__msg[8]),
		.send_out__rdy(fu__send_out__rdy[8]),
		.send_out__val(fu__send_out__val[8]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[8]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[8]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[8]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[8]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[8]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[8]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[8]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[8]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[8]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[8]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[8]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[8])
	);
	RetRTL__21e487e69ebe8a50 fu__9(
		.clear(fu__clear[9]),
		.clk(fu__clk[9]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[9]),
		.reset(fu__reset[9]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[9]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[9]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[9]),
		.recv_const__msg(fu__recv_const__msg[9]),
		.recv_const__rdy(fu__recv_const__rdy[9]),
		.recv_const__val(fu__recv_const__val[9]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[9]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[9]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[9]),
		.recv_in__msg(fu__recv_in__msg[9]),
		.recv_in__rdy(fu__recv_in__rdy[9]),
		.recv_in__val(fu__recv_in__val[9]),
		.recv_opt__msg(fu__recv_opt__msg[9]),
		.recv_opt__rdy(fu__recv_opt__rdy[9]),
		.recv_opt__val(fu__recv_opt__val[9]),
		.send_out__msg(fu__send_out__msg[9]),
		.send_out__rdy(fu__send_out__rdy[9]),
		.send_out__val(fu__send_out__val[9]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[9]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[9]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[9]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[9]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[9]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[9]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[9]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[9]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[9]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[9]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[9]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[9])
	);
	NahRTL__21e487e69ebe8a50 fu__10(
		.clear(fu__clear[10]),
		.clk(fu__clk[10]),
		.ctrl_addr_inport(fu__ctrl_addr_inport[10]),
		.reset(fu__reset[10]),
		.from_mem_rdata__msg(fu__from_mem_rdata__msg[10]),
		.from_mem_rdata__rdy(fu__from_mem_rdata__rdy[10]),
		.from_mem_rdata__val(fu__from_mem_rdata__val[10]),
		.recv_const__msg(fu__recv_const__msg[10]),
		.recv_const__rdy(fu__recv_const__rdy[10]),
		.recv_const__val(fu__recv_const__val[10]),
		.recv_from_ctrl_mem__msg(fu__recv_from_ctrl_mem__msg[10]),
		.recv_from_ctrl_mem__rdy(fu__recv_from_ctrl_mem__rdy[10]),
		.recv_from_ctrl_mem__val(fu__recv_from_ctrl_mem__val[10]),
		.recv_in__msg(fu__recv_in__msg[10]),
		.recv_in__rdy(fu__recv_in__rdy[10]),
		.recv_in__val(fu__recv_in__val[10]),
		.recv_opt__msg(fu__recv_opt__msg[10]),
		.recv_opt__rdy(fu__recv_opt__rdy[10]),
		.recv_opt__val(fu__recv_opt__val[10]),
		.send_out__msg(fu__send_out__msg[10]),
		.send_out__rdy(fu__send_out__rdy[10]),
		.send_out__val(fu__send_out__val[10]),
		.send_to_ctrl_mem__msg(fu__send_to_ctrl_mem__msg[10]),
		.send_to_ctrl_mem__rdy(fu__send_to_ctrl_mem__rdy[10]),
		.send_to_ctrl_mem__val(fu__send_to_ctrl_mem__val[10]),
		.to_mem_raddr__msg(fu__to_mem_raddr__msg[10]),
		.to_mem_raddr__rdy(fu__to_mem_raddr__rdy[10]),
		.to_mem_raddr__val(fu__to_mem_raddr__val[10]),
		.to_mem_waddr__msg(fu__to_mem_waddr__msg[10]),
		.to_mem_waddr__rdy(fu__to_mem_waddr__rdy[10]),
		.to_mem_waddr__val(fu__to_mem_waddr__val[10]),
		.to_mem_wdata__msg(fu__to_mem_wdata__msg[10]),
		.to_mem_wdata__rdy(fu__to_mem_wdata__rdy[10]),
		.to_mem_wdata__val(fu__to_mem_wdata__val[10])
	);
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : comb_logic
		begin : sv2v_autoblock_1
			reg [31:0] j;
			for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
				begin
					send_out__val[1 - sv2v_cast_1(j)+:1] = 1'd0;
					send_out__msg[(1 - sv2v_cast_1(j)) * 35+:35] = 35'h000000000;
				end
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < 4'd11; i = i + 1'd1)
				begin
					fu__recv_const__msg[sv2v_cast_4(i)] = recv_const__msg;
					fu__recv_const__val[sv2v_cast_4(i)] = recv_const__val;
					fu_recv_const_rdy_vector[sv2v_cast_4(i)] = fu__recv_const__rdy[sv2v_cast_4(i)];
					fu__recv_opt__msg[sv2v_cast_4(i)] = recv_opt__msg;
					if (prologue_count_inport != 3'd0)
						fu__recv_opt__msg[sv2v_cast_4(i)][122-:7] = __const__OPT_NAH;
					fu__recv_opt__val[sv2v_cast_4(i)] = recv_opt__val;
					fu_recv_opt_rdy_vector[sv2v_cast_4(i)] = fu__recv_opt__rdy[sv2v_cast_4(i)];
					begin : sv2v_autoblock_3
						reg [31:0] j;
						for (j = 1'd0; j < __const__num_outports_at_comb_logic; j = j + 1'd1)
							begin
								if (fu__send_out__val[sv2v_cast_4(i)][1 - sv2v_cast_1(j)+:1]) begin
									send_out__msg[(1 - sv2v_cast_1(j)) * 35+:35] = fu__send_out__msg[sv2v_cast_4(i)][(1 - sv2v_cast_1(j)) * 35+:35];
									send_out__val[1 - sv2v_cast_1(j)+:1] = fu__send_out__val[sv2v_cast_4(i)][1 - sv2v_cast_1(j)+:1];
								end
								fu__send_out__rdy[sv2v_cast_4(i)][1 - sv2v_cast_1(j)+:1] = send_out__rdy[1 - sv2v_cast_1(j)+:1];
							end
					end
				end
		end
		recv_const__rdy = |fu_recv_const_rdy_vector;
		recv_opt__rdy = |fu_recv_opt_rdy_vector | (prologue_count_inport != 3'd0);
		begin : sv2v_autoblock_4
			reg [31:0] j;
			for (j = 1'd0; j < __const__num_inports_at_comb_logic; j = j + 1'd1)
				recv_in__rdy[3 - sv2v_cast_2(j)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_5
			reg [31:0] port;
			for (port = 1'd0; port < __const__num_inports_at_comb_logic; port = port + 1'd1)
				begin
					begin : sv2v_autoblock_6
						reg [31:0] i;
						for (i = 1'd0; i < 4'd11; i = i + 1'd1)
							begin
								fu__recv_in__msg[sv2v_cast_4(i)][(3 - sv2v_cast_2(port)) * 35+:35] = recv_in__msg[(3 - sv2v_cast_2(port)) * 35+:35];
								fu__recv_in__val[sv2v_cast_4(i)][3 - sv2v_cast_2(port)+:1] = recv_in__val[3 - sv2v_cast_2(port)+:1];
								fu_recv_in_rdy_vector[sv2v_cast_2(port)][sv2v_cast_4(i)] = fu__recv_in__rdy[sv2v_cast_4(i)][3 - sv2v_cast_2(port)+:1];
							end
					end
					recv_in__rdy[3 - sv2v_cast_2(port)+:1] = |fu_recv_in_rdy_vector[sv2v_cast_2(port)];
				end
		end
	end
	always @(*) begin : connect_to_controller
		begin : sv2v_autoblock_7
			reg [31:0] i;
			for (i = 1'd0; i < 4'd11; i = i + 1'd1)
				begin
					fu__recv_from_ctrl_mem__msg[sv2v_cast_4(i)] = recv_from_ctrl_mem__msg;
					fu__recv_from_ctrl_mem__val[sv2v_cast_4(i)] = recv_from_ctrl_mem__val;
					recv_from_controller_rdy_vector[sv2v_cast_4(i)] = fu__recv_from_ctrl_mem__rdy[sv2v_cast_4(i)];
				end
		end
		recv_from_ctrl_mem__rdy = |recv_from_controller_rdy_vector;
		send_to_ctrl_mem__msg = 174'h00000000000000000000000000000000000000000000;
		send_to_ctrl_mem__val = 1'd0;
		begin : sv2v_autoblock_8
			reg [31:0] i;
			for (i = 1'd0; i < 4'd11; i = i + 1'd1)
				begin
					if (fu__send_to_ctrl_mem__val[sv2v_cast_4(i)]) begin
						send_to_ctrl_mem__msg = fu__send_to_ctrl_mem__msg[sv2v_cast_4(i)];
						send_to_ctrl_mem__val = fu__send_to_ctrl_mem__val[sv2v_cast_4(i)];
					end
					fu__send_to_ctrl_mem__rdy[sv2v_cast_4(i)] = send_to_ctrl_mem__rdy;
					fu__ctrl_addr_inport[sv2v_cast_4(i)] = ctrl_addr_inport;
				end
		end
	end
	assign fu__clk[0] = clk;
	assign fu__reset[0] = reset;
	assign fu__clk[1] = clk;
	assign fu__reset[1] = reset;
	assign fu__clk[2] = clk;
	assign fu__reset[2] = reset;
	assign fu__clk[3] = clk;
	assign fu__reset[3] = reset;
	assign fu__clk[4] = clk;
	assign fu__reset[4] = reset;
	assign fu__clk[5] = clk;
	assign fu__reset[5] = reset;
	assign fu__clk[6] = clk;
	assign fu__reset[6] = reset;
	assign fu__clk[7] = clk;
	assign fu__reset[7] = reset;
	assign fu__clk[8] = clk;
	assign fu__reset[8] = reset;
	assign fu__clk[9] = clk;
	assign fu__reset[9] = reset;
	assign fu__clk[10] = clk;
	assign fu__reset[10] = reset;
	assign to_mem_raddr__msg[70+:7] = fu__to_mem_raddr__msg[0];
	assign fu__to_mem_raddr__rdy[0] = to_mem_raddr__rdy[10+:1];
	assign to_mem_raddr__val[10+:1] = fu__to_mem_raddr__val[0];
	assign fu__from_mem_rdata__msg[0] = from_mem_rdata__msg[350+:35];
	assign from_mem_rdata__rdy[10+:1] = fu__from_mem_rdata__rdy[0];
	assign fu__from_mem_rdata__val[0] = from_mem_rdata__val[10+:1];
	assign to_mem_waddr__msg[70+:7] = fu__to_mem_waddr__msg[0];
	assign fu__to_mem_waddr__rdy[0] = to_mem_waddr__rdy[10+:1];
	assign to_mem_waddr__val[10+:1] = fu__to_mem_waddr__val[0];
	assign to_mem_wdata__msg[350+:35] = fu__to_mem_wdata__msg[0];
	assign fu__to_mem_wdata__rdy[0] = to_mem_wdata__rdy[10+:1];
	assign to_mem_wdata__val[10+:1] = fu__to_mem_wdata__val[0];
	assign fu__clear[0] = clear[10+:1];
	assign to_mem_raddr__msg[63+:7] = fu__to_mem_raddr__msg[1];
	assign fu__to_mem_raddr__rdy[1] = to_mem_raddr__rdy[9+:1];
	assign to_mem_raddr__val[9+:1] = fu__to_mem_raddr__val[1];
	assign fu__from_mem_rdata__msg[1] = from_mem_rdata__msg[315+:35];
	assign from_mem_rdata__rdy[9+:1] = fu__from_mem_rdata__rdy[1];
	assign fu__from_mem_rdata__val[1] = from_mem_rdata__val[9+:1];
	assign to_mem_waddr__msg[63+:7] = fu__to_mem_waddr__msg[1];
	assign fu__to_mem_waddr__rdy[1] = to_mem_waddr__rdy[9+:1];
	assign to_mem_waddr__val[9+:1] = fu__to_mem_waddr__val[1];
	assign to_mem_wdata__msg[315+:35] = fu__to_mem_wdata__msg[1];
	assign fu__to_mem_wdata__rdy[1] = to_mem_wdata__rdy[9+:1];
	assign to_mem_wdata__val[9+:1] = fu__to_mem_wdata__val[1];
	assign fu__clear[1] = clear[9+:1];
	assign to_mem_raddr__msg[56+:7] = fu__to_mem_raddr__msg[2];
	assign fu__to_mem_raddr__rdy[2] = to_mem_raddr__rdy[8+:1];
	assign to_mem_raddr__val[8+:1] = fu__to_mem_raddr__val[2];
	assign fu__from_mem_rdata__msg[2] = from_mem_rdata__msg[280+:35];
	assign from_mem_rdata__rdy[8+:1] = fu__from_mem_rdata__rdy[2];
	assign fu__from_mem_rdata__val[2] = from_mem_rdata__val[8+:1];
	assign to_mem_waddr__msg[56+:7] = fu__to_mem_waddr__msg[2];
	assign fu__to_mem_waddr__rdy[2] = to_mem_waddr__rdy[8+:1];
	assign to_mem_waddr__val[8+:1] = fu__to_mem_waddr__val[2];
	assign to_mem_wdata__msg[280+:35] = fu__to_mem_wdata__msg[2];
	assign fu__to_mem_wdata__rdy[2] = to_mem_wdata__rdy[8+:1];
	assign to_mem_wdata__val[8+:1] = fu__to_mem_wdata__val[2];
	assign fu__clear[2] = clear[8+:1];
	assign to_mem_raddr__msg[49+:7] = fu__to_mem_raddr__msg[3];
	assign fu__to_mem_raddr__rdy[3] = to_mem_raddr__rdy[7+:1];
	assign to_mem_raddr__val[7+:1] = fu__to_mem_raddr__val[3];
	assign fu__from_mem_rdata__msg[3] = from_mem_rdata__msg[245+:35];
	assign from_mem_rdata__rdy[7+:1] = fu__from_mem_rdata__rdy[3];
	assign fu__from_mem_rdata__val[3] = from_mem_rdata__val[7+:1];
	assign to_mem_waddr__msg[49+:7] = fu__to_mem_waddr__msg[3];
	assign fu__to_mem_waddr__rdy[3] = to_mem_waddr__rdy[7+:1];
	assign to_mem_waddr__val[7+:1] = fu__to_mem_waddr__val[3];
	assign to_mem_wdata__msg[245+:35] = fu__to_mem_wdata__msg[3];
	assign fu__to_mem_wdata__rdy[3] = to_mem_wdata__rdy[7+:1];
	assign to_mem_wdata__val[7+:1] = fu__to_mem_wdata__val[3];
	assign fu__clear[3] = clear[7+:1];
	assign to_mem_raddr__msg[42+:7] = fu__to_mem_raddr__msg[4];
	assign fu__to_mem_raddr__rdy[4] = to_mem_raddr__rdy[6+:1];
	assign to_mem_raddr__val[6+:1] = fu__to_mem_raddr__val[4];
	assign fu__from_mem_rdata__msg[4] = from_mem_rdata__msg[210+:35];
	assign from_mem_rdata__rdy[6+:1] = fu__from_mem_rdata__rdy[4];
	assign fu__from_mem_rdata__val[4] = from_mem_rdata__val[6+:1];
	assign to_mem_waddr__msg[42+:7] = fu__to_mem_waddr__msg[4];
	assign fu__to_mem_waddr__rdy[4] = to_mem_waddr__rdy[6+:1];
	assign to_mem_waddr__val[6+:1] = fu__to_mem_waddr__val[4];
	assign to_mem_wdata__msg[210+:35] = fu__to_mem_wdata__msg[4];
	assign fu__to_mem_wdata__rdy[4] = to_mem_wdata__rdy[6+:1];
	assign to_mem_wdata__val[6+:1] = fu__to_mem_wdata__val[4];
	assign fu__clear[4] = clear[6+:1];
	assign to_mem_raddr__msg[35+:7] = fu__to_mem_raddr__msg[5];
	assign fu__to_mem_raddr__rdy[5] = to_mem_raddr__rdy[5+:1];
	assign to_mem_raddr__val[5+:1] = fu__to_mem_raddr__val[5];
	assign fu__from_mem_rdata__msg[5] = from_mem_rdata__msg[175+:35];
	assign from_mem_rdata__rdy[5+:1] = fu__from_mem_rdata__rdy[5];
	assign fu__from_mem_rdata__val[5] = from_mem_rdata__val[5+:1];
	assign to_mem_waddr__msg[35+:7] = fu__to_mem_waddr__msg[5];
	assign fu__to_mem_waddr__rdy[5] = to_mem_waddr__rdy[5+:1];
	assign to_mem_waddr__val[5+:1] = fu__to_mem_waddr__val[5];
	assign to_mem_wdata__msg[175+:35] = fu__to_mem_wdata__msg[5];
	assign fu__to_mem_wdata__rdy[5] = to_mem_wdata__rdy[5+:1];
	assign to_mem_wdata__val[5+:1] = fu__to_mem_wdata__val[5];
	assign fu__clear[5] = clear[5+:1];
	assign to_mem_raddr__msg[28+:7] = fu__to_mem_raddr__msg[6];
	assign fu__to_mem_raddr__rdy[6] = to_mem_raddr__rdy[4+:1];
	assign to_mem_raddr__val[4+:1] = fu__to_mem_raddr__val[6];
	assign fu__from_mem_rdata__msg[6] = from_mem_rdata__msg[140+:35];
	assign from_mem_rdata__rdy[4+:1] = fu__from_mem_rdata__rdy[6];
	assign fu__from_mem_rdata__val[6] = from_mem_rdata__val[4+:1];
	assign to_mem_waddr__msg[28+:7] = fu__to_mem_waddr__msg[6];
	assign fu__to_mem_waddr__rdy[6] = to_mem_waddr__rdy[4+:1];
	assign to_mem_waddr__val[4+:1] = fu__to_mem_waddr__val[6];
	assign to_mem_wdata__msg[140+:35] = fu__to_mem_wdata__msg[6];
	assign fu__to_mem_wdata__rdy[6] = to_mem_wdata__rdy[4+:1];
	assign to_mem_wdata__val[4+:1] = fu__to_mem_wdata__val[6];
	assign fu__clear[6] = clear[4+:1];
	assign to_mem_raddr__msg[21+:7] = fu__to_mem_raddr__msg[7];
	assign fu__to_mem_raddr__rdy[7] = to_mem_raddr__rdy[3+:1];
	assign to_mem_raddr__val[3+:1] = fu__to_mem_raddr__val[7];
	assign fu__from_mem_rdata__msg[7] = from_mem_rdata__msg[105+:35];
	assign from_mem_rdata__rdy[3+:1] = fu__from_mem_rdata__rdy[7];
	assign fu__from_mem_rdata__val[7] = from_mem_rdata__val[3+:1];
	assign to_mem_waddr__msg[21+:7] = fu__to_mem_waddr__msg[7];
	assign fu__to_mem_waddr__rdy[7] = to_mem_waddr__rdy[3+:1];
	assign to_mem_waddr__val[3+:1] = fu__to_mem_waddr__val[7];
	assign to_mem_wdata__msg[105+:35] = fu__to_mem_wdata__msg[7];
	assign fu__to_mem_wdata__rdy[7] = to_mem_wdata__rdy[3+:1];
	assign to_mem_wdata__val[3+:1] = fu__to_mem_wdata__val[7];
	assign fu__clear[7] = clear[3+:1];
	assign to_mem_raddr__msg[14+:7] = fu__to_mem_raddr__msg[8];
	assign fu__to_mem_raddr__rdy[8] = to_mem_raddr__rdy[2+:1];
	assign to_mem_raddr__val[2+:1] = fu__to_mem_raddr__val[8];
	assign fu__from_mem_rdata__msg[8] = from_mem_rdata__msg[70+:35];
	assign from_mem_rdata__rdy[2+:1] = fu__from_mem_rdata__rdy[8];
	assign fu__from_mem_rdata__val[8] = from_mem_rdata__val[2+:1];
	assign to_mem_waddr__msg[14+:7] = fu__to_mem_waddr__msg[8];
	assign fu__to_mem_waddr__rdy[8] = to_mem_waddr__rdy[2+:1];
	assign to_mem_waddr__val[2+:1] = fu__to_mem_waddr__val[8];
	assign to_mem_wdata__msg[70+:35] = fu__to_mem_wdata__msg[8];
	assign fu__to_mem_wdata__rdy[8] = to_mem_wdata__rdy[2+:1];
	assign to_mem_wdata__val[2+:1] = fu__to_mem_wdata__val[8];
	assign fu__clear[8] = clear[2+:1];
	assign to_mem_raddr__msg[7+:7] = fu__to_mem_raddr__msg[9];
	assign fu__to_mem_raddr__rdy[9] = to_mem_raddr__rdy[1+:1];
	assign to_mem_raddr__val[1+:1] = fu__to_mem_raddr__val[9];
	assign fu__from_mem_rdata__msg[9] = from_mem_rdata__msg[35+:35];
	assign from_mem_rdata__rdy[1+:1] = fu__from_mem_rdata__rdy[9];
	assign fu__from_mem_rdata__val[9] = from_mem_rdata__val[1+:1];
	assign to_mem_waddr__msg[7+:7] = fu__to_mem_waddr__msg[9];
	assign fu__to_mem_waddr__rdy[9] = to_mem_waddr__rdy[1+:1];
	assign to_mem_waddr__val[1+:1] = fu__to_mem_waddr__val[9];
	assign to_mem_wdata__msg[35+:35] = fu__to_mem_wdata__msg[9];
	assign fu__to_mem_wdata__rdy[9] = to_mem_wdata__rdy[1+:1];
	assign to_mem_wdata__val[1+:1] = fu__to_mem_wdata__val[9];
	assign fu__clear[9] = clear[1+:1];
	assign to_mem_raddr__msg[0+:7] = fu__to_mem_raddr__msg[10];
	assign fu__to_mem_raddr__rdy[10] = to_mem_raddr__rdy[0+:1];
	assign to_mem_raddr__val[0+:1] = fu__to_mem_raddr__val[10];
	assign fu__from_mem_rdata__msg[10] = from_mem_rdata__msg[0+:35];
	assign from_mem_rdata__rdy[0+:1] = fu__from_mem_rdata__rdy[10];
	assign fu__from_mem_rdata__val[10] = from_mem_rdata__val[0+:1];
	assign to_mem_waddr__msg[0+:7] = fu__to_mem_waddr__msg[10];
	assign fu__to_mem_waddr__rdy[10] = to_mem_waddr__rdy[0+:1];
	assign to_mem_waddr__val[0+:1] = fu__to_mem_waddr__val[10];
	assign to_mem_wdata__msg[0+:35] = fu__to_mem_wdata__msg[10];
	assign fu__to_mem_wdata__rdy[10] = to_mem_wdata__rdy[0+:1];
	assign to_mem_wdata__val[0+:1] = fu__to_mem_wdata__val[10];
	assign fu__clear[10] = clear[0+:1];
endmodule
module CrossbarRTL__35a0feee61c1221d (
	cgra_id,
	clear,
	clk,
	compute_done,
	crossbar_id,
	crossbar_outport,
	ctrl_addr_inport,
	prologue_count_inport,
	reset,
	tile_id,
	recv_data__msg,
	recv_data__rdy,
	recv_data__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_data__msg,
	send_data__rdy,
	send_data__val
);
	input wire [1:0] cgra_id;
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] compute_done;
	input wire [0:0] crossbar_id;
	input wire [15:0] crossbar_outport;
	input wire [2:0] ctrl_addr_inport;
	input wire [35:0] prologue_count_inport;
	input wire [0:0] reset;
	input wire [2:0] tile_id;
	input wire [69:0] recv_data__msg;
	output reg [1:0] recv_data__rdy;
	input wire [1:0] recv_data__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [279:0] send_data__msg;
	input wire [7:0] send_data__rdy;
	output reg [7:0] send_data__val;
	localparam [1:0] __const__num_inports_at_update_signal = 2'd2;
	localparam [3:0] __const__num_outports_at_update_signal = 4'd8;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [2:0] __const__ctrl_mem_size_at_update_prologue_counter = 3'd6;
	localparam [1:0] __const__num_inports_at_update_prologue_counter = 2'd2;
	localparam [2:0] __const__ctrl_mem_size_at_update_prologue_counter_next = 3'd6;
	localparam [1:0] __const__num_inports_at_update_prologue_counter_next = 2'd2;
	localparam [3:0] __const__num_outports_at_update_prologue_counter_next = 4'd8;
	localparam [3:0] __const__num_outports_at_update_send_accepted_next = 4'd8;
	localparam [3:0] __const__num_outports_at_update_prologue_allowing_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_prologue_or_valid_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_in_dir_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_rdy_vector = 4'd8;
	localparam [2:0] __const__outport_towards_local_base_id_at_update_rdy_vector = 3'd4;
	localparam [3:0] __const__num_outports_at_update_valid_vector = 4'd8;
	localparam [1:0] __const__num_inports_at_update_recv_required_vector = 2'd2;
	localparam [3:0] __const__num_outports_at_update_recv_required_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_send_required_vector = 4'd8;
	reg [0:0] all_send_accepted;
	reg [7:0] during_prologue_allowing_vector;
	reg [1:0] in_dir [0:7];
	reg [0:0] in_dir_local [0:7];
	wire [2:0] prologue_count_wire [0:5][0:1];
	reg [2:0] prologue_counter [0:5][0:1];
	reg [2:0] prologue_counter_next [0:5][0:1];
	wire [34:0] recv_data_msg [0:1];
	wire [0:0] recv_data_val [0:1];
	reg [1:0] recv_required_vector;
	reg [7:0] recv_valid_excluding_prologue_vector;
	reg [7:0] recv_valid_or_during_prologue_allowing_vector;
	reg [7:0] send_accepted;
	reg [7:0] send_accepted_next;
	reg [7:0] send_rdy_or_during_prologue_vector;
	reg [7:0] send_required_vector;
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : update_in_dir_vector
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_in_dir_vector; i = i + 1'd1)
				begin
					in_dir[sv2v_cast_3(i)] = 2'd0;
					in_dir_local[sv2v_cast_3(i)] = 1'd0;
				end
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_in_dir_vector; i = i + 1'd1)
				begin
					in_dir[sv2v_cast_3(i)] = crossbar_outport[(7 - sv2v_cast_3(i)) * 2+:2];
					if (in_dir[sv2v_cast_3(i)] > 2'd0)
						in_dir_local[sv2v_cast_3(i)] = sv2v_cast_1(in_dir[sv2v_cast_3(i)] - 2'd1);
				end
		end
	end
	always @(*) begin : update_prologue_allowing_vector
		during_prologue_allowing_vector = 8'd0;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_prologue_allowing_vector; i = i + 1'd1)
				if (in_dir[sv2v_cast_3(i)] > 2'd0)
					during_prologue_allowing_vector[sv2v_cast_3(i)] = prologue_counter[ctrl_addr_inport][in_dir_local[sv2v_cast_3(i)]] < prologue_count_wire[ctrl_addr_inport][in_dir_local[sv2v_cast_3(i)]];
				else
					during_prologue_allowing_vector[sv2v_cast_3(i)] = 1'd0;
		end
	end
	always @(*) begin : update_prologue_counter_next
		begin : sv2v_autoblock_4
			reg [31:0] addr;
			for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_counter_next; addr = addr + 1'd1)
				begin : sv2v_autoblock_5
					reg [31:0] i;
					for (i = 1'd0; i < __const__num_inports_at_update_prologue_counter_next; i = i + 1'd1)
						begin
							prologue_counter_next[sv2v_cast_3(addr)][sv2v_cast_1(i)] = prologue_counter[sv2v_cast_3(addr)][sv2v_cast_1(i)];
							begin : sv2v_autoblock_6
								reg [31:0] j;
								for (j = 1'd0; j < __const__num_outports_at_update_prologue_counter_next; j = j + 1'd1)
									if ((((recv_opt__rdy & (in_dir[sv2v_cast_3(j)] > 2'd0)) & (in_dir_local[sv2v_cast_3(j)] == sv2v_cast_1(i))) & (sv2v_cast_3(addr) == ctrl_addr_inport)) & (prologue_counter[sv2v_cast_3(addr)][sv2v_cast_1(i)] < prologue_count_wire[sv2v_cast_3(addr)][sv2v_cast_1(i)]))
										prologue_counter_next[sv2v_cast_3(addr)][sv2v_cast_1(i)] = prologue_counter[sv2v_cast_3(addr)][sv2v_cast_1(i)] + 3'd1;
							end
						end
				end
		end
	end
	always @(*) begin : update_prologue_or_valid_vector
		recv_valid_or_during_prologue_allowing_vector = 8'd0;
		begin : sv2v_autoblock_7
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_prologue_or_valid_vector; i = i + 1'd1)
				recv_valid_or_during_prologue_allowing_vector[sv2v_cast_3(i)] = recv_valid_excluding_prologue_vector[sv2v_cast_3(i)] | during_prologue_allowing_vector[sv2v_cast_3(i)];
		end
	end
	always @(*) begin : update_rdy_vector
		send_rdy_or_during_prologue_vector = 8'd0;
		begin : sv2v_autoblock_8
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_rdy_vector; i = i + 1'd1)
				if ((in_dir[sv2v_cast_3(i)] > 2'd0) & (~compute_done | (sv2v_cast_3(i) < __const__outport_towards_local_base_id_at_update_rdy_vector)))
					send_rdy_or_during_prologue_vector[sv2v_cast_3(i)] = send_data__rdy[7 - sv2v_cast_3(i)+:1] | during_prologue_allowing_vector[sv2v_cast_3(i)];
				else
					send_rdy_or_during_prologue_vector[sv2v_cast_3(i)] = 1'd1;
		end
	end
	always @(*) begin : update_recv_required_vector
		begin : sv2v_autoblock_9
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_update_recv_required_vector; i = i + 1'd1)
				recv_required_vector[sv2v_cast_1(i)] = 1'd0;
		end
		begin : sv2v_autoblock_10
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_recv_required_vector; i = i + 1'd1)
				if ((in_dir[sv2v_cast_3(i)] > 2'd0) & ~during_prologue_allowing_vector[sv2v_cast_3(i)])
					recv_required_vector[in_dir_local[sv2v_cast_3(i)]] = 1'd1;
		end
	end
	always @(*) begin : update_send_accepted_next
		send_accepted_next = send_accepted;
		if (recv_opt__val & (recv_opt__msg[122-:7] != __const__OPT_START)) begin
			begin : sv2v_autoblock_11
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_outports_at_update_send_accepted_next; i = i + 1'd1)
					if (((send_required_vector[sv2v_cast_3(i)] & ~send_accepted[sv2v_cast_3(i)]) & send_data__rdy[7 - sv2v_cast_3(i)+:1]) & send_data__val[7 - sv2v_cast_3(i)+:1])
						send_accepted_next[sv2v_cast_3(i)] = 1'd1;
			end
			if (recv_opt__rdy)
				send_accepted_next = 8'd0;
		end
		else
			send_accepted_next = 8'd0;
	end
	always @(*) begin : update_send_required_vector
		begin : sv2v_autoblock_12
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_send_required_vector; i = i + 1'd1)
				send_required_vector[sv2v_cast_3(i)] = 1'd0;
		end
		begin : sv2v_autoblock_13
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_send_required_vector; i = i + 1'd1)
				if ((in_dir[sv2v_cast_3(i)] > 2'd0) & ~during_prologue_allowing_vector[sv2v_cast_3(i)])
					send_required_vector[sv2v_cast_3(i)] = 1'd1;
		end
	end
	always @(*) begin : update_signal
		begin : sv2v_autoblock_14
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_update_signal; i = i + 1'd1)
				recv_data__rdy[1 - sv2v_cast_1(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_15
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_signal; i = i + 1'd1)
				begin
					send_data__val[7 - sv2v_cast_3(i)+:1] = 1'd0;
					send_data__msg[(7 - sv2v_cast_3(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_opt__rdy = 1'd0;
		all_send_accepted = 1'd0;
		if (recv_opt__val & (recv_opt__msg[122-:7] != __const__OPT_START)) begin
			all_send_accepted = 1'd1;
			begin : sv2v_autoblock_16
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_outports_at_update_signal; i = i + 1'd1)
					if ((send_required_vector[sv2v_cast_3(i)] & ~send_accepted[sv2v_cast_3(i)]) & ~send_rdy_or_during_prologue_vector[sv2v_cast_3(i)])
						all_send_accepted = 1'd0;
			end
			begin : sv2v_autoblock_17
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_inports_at_update_signal; i = i + 1'd1)
					recv_data__rdy[1 - sv2v_cast_1(i)+:1] = (&recv_valid_or_during_prologue_allowing_vector & all_send_accepted) & recv_required_vector[sv2v_cast_1(i)];
			end
			begin : sv2v_autoblock_18
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_outports_at_update_signal; i = i + 1'd1)
					begin
						send_data__val[7 - sv2v_cast_3(i)+:1] = (&recv_valid_or_during_prologue_allowing_vector & send_required_vector[sv2v_cast_3(i)]) & ~send_accepted[sv2v_cast_3(i)];
						if ((&recv_valid_or_during_prologue_allowing_vector & send_required_vector[sv2v_cast_3(i)]) & ~send_accepted[sv2v_cast_3(i)]) begin
							send_data__msg[((7 - sv2v_cast_3(i)) * 35) + 34-:32] = recv_data_msg[in_dir_local[sv2v_cast_3(i)]][34-:32];
							send_data__msg[((7 - sv2v_cast_3(i)) * 35) + 2] = recv_data_msg[in_dir_local[sv2v_cast_3(i)]][2];
						end
					end
			end
			recv_opt__rdy = all_send_accepted & &recv_valid_or_during_prologue_allowing_vector;
		end
	end
	always @(*) begin : update_valid_vector
		recv_valid_excluding_prologue_vector = 8'd0;
		begin : sv2v_autoblock_19
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_valid_vector; i = i + 1'd1)
				if (in_dir[sv2v_cast_3(i)] > 2'd0)
					recv_valid_excluding_prologue_vector[sv2v_cast_3(i)] = recv_data_val[in_dir_local[sv2v_cast_3(i)]] & ~during_prologue_allowing_vector[sv2v_cast_3(i)];
				else
					recv_valid_excluding_prologue_vector[sv2v_cast_3(i)] = 1'd1;
		end
	end
	always @(posedge clk) begin : update_prologue_counter
		if (reset | clear) begin
			begin : sv2v_autoblock_20
				reg [31:0] addr;
				for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_counter; addr = addr + 1'd1)
					begin : sv2v_autoblock_21
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_inports_at_update_prologue_counter; i = i + 1'd1)
							prologue_counter[sv2v_cast_3(addr)][sv2v_cast_1(i)] <= 3'd0;
					end
			end
			send_accepted <= 8'd0;
		end
		else begin
			begin : sv2v_autoblock_22
				reg [31:0] addr;
				for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_counter; addr = addr + 1'd1)
					begin : sv2v_autoblock_23
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_inports_at_update_prologue_counter; i = i + 1'd1)
							prologue_counter[sv2v_cast_3(addr)][sv2v_cast_1(i)] <= prologue_counter_next[sv2v_cast_3(addr)][sv2v_cast_1(i)];
					end
			end
			send_accepted <= send_accepted_next;
		end
	end
	assign recv_data_msg[0] = recv_data__msg[35+:35];
	assign recv_data_val[0] = recv_data__val[1+:1];
	assign recv_data_msg[1] = recv_data__msg[0+:35];
	assign recv_data_val[1] = recv_data__val[0+:1];
	assign prologue_count_wire[0][0] = prologue_count_inport[33+:3];
	assign prologue_count_wire[0][1] = prologue_count_inport[30+:3];
	assign prologue_count_wire[1][0] = prologue_count_inport[27+:3];
	assign prologue_count_wire[1][1] = prologue_count_inport[24+:3];
	assign prologue_count_wire[2][0] = prologue_count_inport[21+:3];
	assign prologue_count_wire[2][1] = prologue_count_inport[18+:3];
	assign prologue_count_wire[3][0] = prologue_count_inport[15+:3];
	assign prologue_count_wire[3][1] = prologue_count_inport[12+:3];
	assign prologue_count_wire[4][0] = prologue_count_inport[9+:3];
	assign prologue_count_wire[4][1] = prologue_count_inport[6+:3];
	assign prologue_count_wire[5][0] = prologue_count_inport[3+:3];
	assign prologue_count_wire[5][1] = prologue_count_inport[0+:3];
endmodule
module RegisterBankRTL__8b95a13a898ab3e7 (
	clear,
	clk,
	inport_ctrl_proceed,
	inport_opt,
	inport_valid,
	inport_wdata,
	outport_wr_rdy,
	reset,
	send_data_to_fu__msg,
	send_data_to_fu__rdy,
	send_data_to_fu__val,
	send_data_to_xbar__msg,
	send_data_to_xbar__rdy,
	send_data_to_xbar__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] inport_ctrl_proceed;
	input wire [122:0] inport_opt;
	input wire [2:0] inport_valid;
	input wire [104:0] inport_wdata;
	output reg [0:0] outport_wr_rdy;
	input wire [0:0] reset;
	output reg [34:0] send_data_to_fu__msg;
	input wire [0:0] send_data_to_fu__rdy;
	output reg [0:0] send_data_to_fu__val;
	output reg [34:0] send_data_to_xbar__msg;
	input wire [0:0] send_data_to_xbar__rdy;
	output reg [0:0] send_data_to_xbar__val;
	localparam [0:0] __const__reg_bank_id_at_update_token_status = 1'd0;
	localparam [0:0] __const__READ_TOWARDS_FU = 1'd1;
	localparam [1:0] __const__READ_TOWARDS_BOTH = 2'd3;
	localparam [1:0] __const__READ_TOWARDS_ROUTING_XBAR = 2'd2;
	localparam [4:0] __const__num_registers_at_update_token_status = 5'd16;
	localparam [0:0] __const__reg_bank_id_at_access_registers = 1'd0;
	localparam [4:0] __const__num_registers_at_update_token_masks = 5'd16;
	localparam [0:0] __const__reg_bank_id_at_update_token_masks = 1'd0;
	localparam [0:0] __const__reg_bank_id_at_update_token_valid = 1'd0;
	reg [15:0] armed;
	reg [0:0] read_armed;
	reg [0:0] read_token_valid;
	reg [0:0] read_towards_fu;
	reg [0:0] read_towards_xbar;
	reg [0:0] skid_commit;
	reg [34:0] skid_data;
	reg [3:0] skid_idx;
	reg [0:0] skid_park;
	reg [0:0] skid_target_being_read;
	reg [0:0] skid_target_holds_token;
	reg [0:0] skid_valid;
	reg [15:0] token_clear_mask;
	reg [15:0] token_set_mask;
	reg [15:0] token_valid;
	reg [0:0] wr_accept;
	reg [0:0] wr_en;
	reg [34:0] wr_sel_data;
	reg [0:0] wr_target_being_read;
	reg [0:0] wr_target_holds_token;
	wire [0:0] reg_file__clk;
	reg [3:0] reg_file__raddr;
	wire [34:0] reg_file__rdata;
	wire [0:0] reg_file__reset;
	reg [3:0] reg_file__waddr;
	reg [34:0] reg_file__wdata;
	reg [0:0] reg_file__wen;
	RegisterFile__84f0703fd9bfd535 reg_file(
		.clk(reg_file__clk),
		.raddr(reg_file__raddr),
		.rdata(reg_file__rdata),
		.reset(reg_file__reset),
		.waddr(reg_file__waddr),
		.wdata(reg_file__wdata),
		.wen(reg_file__wen)
	);
	reg [1:0] __tmpvar__update_token_status_read_towards;
	reg [1:0] __tmpvar__access_registers_read_towards;
	reg [1:0] __tmpvar__access_registers_write_reg_from;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : access_registers
		reg_file__raddr[1'd0 * 4+:4] = 4'd0;
		send_data_to_fu__msg = 35'h000000000;
		send_data_to_xbar__msg = 35'h000000000;
		reg_file__waddr[1'd0 * 4+:4] = 4'd0;
		reg_file__wdata[1'd0 * 35+:35] = 35'h000000000;
		reg_file__wen[1'd0+:1] = 1'd0;
		wr_accept = 1'd0;
		wr_en = 1'd0;
		skid_park = 1'd0;
		wr_sel_data = 35'h000000000;
		__tmpvar__access_registers_read_towards = inport_opt[20 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 2)+:2];
		if (__tmpvar__access_registers_read_towards > 2'd0) begin
			reg_file__raddr[1'd0 * 4+:4] = inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 4)+:4];
			send_data_to_fu__msg = reg_file__rdata[1'd0 * 35+:35];
			send_data_to_xbar__msg = reg_file__rdata[1'd0 * 35+:35];
		end
		__tmpvar__access_registers_write_reg_from = inport_opt[44 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 2)+:2];
		if (~reset & (__tmpvar__access_registers_write_reg_from > 2'd0)) begin
			wr_sel_data = inport_wdata[((2 + 2'd1) - __tmpvar__access_registers_write_reg_from) * 35+:35];
			if (inport_valid[(2 + 2'd1) - __tmpvar__access_registers_write_reg_from+:1] & outport_wr_rdy) begin
				wr_accept = 1'd1;
				if ((~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & inport_ctrl_proceed))
					wr_en = 1'd1;
				else
					skid_park = 1'd1;
			end
		end
		if (skid_commit) begin
			reg_file__waddr[1'd0 * 4+:4] = skid_idx;
			reg_file__wdata[1'd0 * 35+:35] = skid_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
		else if (wr_en) begin
			reg_file__waddr[1'd0 * 4+:4] = inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 4)+:4];
			reg_file__wdata[1'd0 * 35+:35] = wr_sel_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
	end
	always @(*) begin : update_send_val
		send_data_to_fu__val = (~reset & read_towards_fu) & (read_token_valid | ~read_armed);
		send_data_to_xbar__val = (~reset & read_towards_xbar) & (read_token_valid | ~read_armed);
	end
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : update_token_masks
		begin : sv2v_autoblock_1
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_masks; r = r + 1'd1)
				begin
					token_set_mask[sv2v_cast_4(r)] = (wr_en & (inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_masks) * 4)+:4] == sv2v_cast_4(r))) | (skid_commit & (skid_idx == sv2v_cast_4(r)));
					token_clear_mask[sv2v_cast_4(r)] = (((inport_ctrl_proceed & (read_towards_fu | read_towards_xbar)) & (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_masks) * 4)+:4] == sv2v_cast_4(r))) & ~inport_opt[0 + sv2v_cast_2(__const__reg_bank_id_at_update_token_masks)+:1]) & token_valid[sv2v_cast_4(r)];
				end
		end
	end
	always @(*) begin : update_token_status
		__tmpvar__update_token_status_read_towards = inport_opt[20 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 2)+:2];
		read_towards_fu = (__tmpvar__update_token_status_read_towards == sv2v_cast_2(__const__READ_TOWARDS_FU)) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_towards_xbar = (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_ROUTING_XBAR) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_token_valid = 1'd0;
		read_armed = 1'd0;
		wr_target_holds_token = 1'd0;
		skid_target_holds_token = 1'd0;
		begin : sv2v_autoblock_2
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_status; r = r + 1'd1)
				begin
					if (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == sv2v_cast_4(r)) begin
						read_token_valid = token_valid[sv2v_cast_4(r)];
						read_armed = armed[sv2v_cast_4(r)];
					end
					if (inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == sv2v_cast_4(r))
						wr_target_holds_token = token_valid[sv2v_cast_4(r)];
					if (skid_idx == sv2v_cast_4(r))
						skid_target_holds_token = token_valid[sv2v_cast_4(r)];
				end
		end
		wr_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4]);
		skid_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == skid_idx);
		skid_commit = skid_valid & ((skid_target_being_read & inport_ctrl_proceed) | (~skid_target_being_read & ~skid_target_holds_token));
		outport_wr_rdy = (~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & ~skid_valid);
	end
	always @(posedge clk) begin : update_token_valid
		if (reset | clear) begin
			token_valid <= 16'd0;
			armed <= 16'd0;
			skid_valid <= 1'd0;
		end
		else begin
			token_valid <= (token_valid & ~token_clear_mask) | token_set_mask;
			armed <= armed | token_set_mask;
			if (skid_park) begin
				skid_valid <= 1'd1;
				skid_data <= wr_sel_data;
				skid_idx <= inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_valid) * 4)+:4];
			end
			else if (skid_commit)
				skid_valid <= 1'd0;
		end
	end
	assign reg_file__clk = clk;
	assign reg_file__reset = reset;
endmodule
module RegisterBankRTL__bc9cc99cab2bb455 (
	clear,
	clk,
	inport_ctrl_proceed,
	inport_opt,
	inport_valid,
	inport_wdata,
	outport_wr_rdy,
	reset,
	send_data_to_fu__msg,
	send_data_to_fu__rdy,
	send_data_to_fu__val,
	send_data_to_xbar__msg,
	send_data_to_xbar__rdy,
	send_data_to_xbar__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] inport_ctrl_proceed;
	input wire [122:0] inport_opt;
	input wire [2:0] inport_valid;
	input wire [104:0] inport_wdata;
	output reg [0:0] outport_wr_rdy;
	input wire [0:0] reset;
	output reg [34:0] send_data_to_fu__msg;
	input wire [0:0] send_data_to_fu__rdy;
	output reg [0:0] send_data_to_fu__val;
	output reg [34:0] send_data_to_xbar__msg;
	input wire [0:0] send_data_to_xbar__rdy;
	output reg [0:0] send_data_to_xbar__val;
	localparam [0:0] __const__reg_bank_id_at_update_token_status = 1'd1;
	localparam [0:0] __const__READ_TOWARDS_FU = 1'd1;
	localparam [1:0] __const__READ_TOWARDS_BOTH = 2'd3;
	localparam [1:0] __const__READ_TOWARDS_ROUTING_XBAR = 2'd2;
	localparam [4:0] __const__num_registers_at_update_token_status = 5'd16;
	localparam [0:0] __const__reg_bank_id_at_access_registers = 1'd1;
	localparam [4:0] __const__num_registers_at_update_token_masks = 5'd16;
	localparam [0:0] __const__reg_bank_id_at_update_token_masks = 1'd1;
	localparam [0:0] __const__reg_bank_id_at_update_token_valid = 1'd1;
	reg [15:0] armed;
	reg [0:0] read_armed;
	reg [0:0] read_token_valid;
	reg [0:0] read_towards_fu;
	reg [0:0] read_towards_xbar;
	reg [0:0] skid_commit;
	reg [34:0] skid_data;
	reg [3:0] skid_idx;
	reg [0:0] skid_park;
	reg [0:0] skid_target_being_read;
	reg [0:0] skid_target_holds_token;
	reg [0:0] skid_valid;
	reg [15:0] token_clear_mask;
	reg [15:0] token_set_mask;
	reg [15:0] token_valid;
	reg [0:0] wr_accept;
	reg [0:0] wr_en;
	reg [34:0] wr_sel_data;
	reg [0:0] wr_target_being_read;
	reg [0:0] wr_target_holds_token;
	wire [0:0] reg_file__clk;
	reg [3:0] reg_file__raddr;
	wire [34:0] reg_file__rdata;
	wire [0:0] reg_file__reset;
	reg [3:0] reg_file__waddr;
	reg [34:0] reg_file__wdata;
	reg [0:0] reg_file__wen;
	RegisterFile__84f0703fd9bfd535 reg_file(
		.clk(reg_file__clk),
		.raddr(reg_file__raddr),
		.rdata(reg_file__rdata),
		.reset(reg_file__reset),
		.waddr(reg_file__waddr),
		.wdata(reg_file__wdata),
		.wen(reg_file__wen)
	);
	reg [1:0] __tmpvar__update_token_status_read_towards;
	reg [1:0] __tmpvar__access_registers_read_towards;
	reg [1:0] __tmpvar__access_registers_write_reg_from;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : access_registers
		reg_file__raddr[1'd0 * 4+:4] = 4'd0;
		send_data_to_fu__msg = 35'h000000000;
		send_data_to_xbar__msg = 35'h000000000;
		reg_file__waddr[1'd0 * 4+:4] = 4'd0;
		reg_file__wdata[1'd0 * 35+:35] = 35'h000000000;
		reg_file__wen[1'd0+:1] = 1'd0;
		wr_accept = 1'd0;
		wr_en = 1'd0;
		skid_park = 1'd0;
		wr_sel_data = 35'h000000000;
		__tmpvar__access_registers_read_towards = inport_opt[20 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 2)+:2];
		if (__tmpvar__access_registers_read_towards > 2'd0) begin
			reg_file__raddr[1'd0 * 4+:4] = inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 4)+:4];
			send_data_to_fu__msg = reg_file__rdata[1'd0 * 35+:35];
			send_data_to_xbar__msg = reg_file__rdata[1'd0 * 35+:35];
		end
		__tmpvar__access_registers_write_reg_from = inport_opt[44 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 2)+:2];
		if (~reset & (__tmpvar__access_registers_write_reg_from > 2'd0)) begin
			wr_sel_data = inport_wdata[((2 + 2'd1) - __tmpvar__access_registers_write_reg_from) * 35+:35];
			if (inport_valid[(2 + 2'd1) - __tmpvar__access_registers_write_reg_from+:1] & outport_wr_rdy) begin
				wr_accept = 1'd1;
				if ((~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & inport_ctrl_proceed))
					wr_en = 1'd1;
				else
					skid_park = 1'd1;
			end
		end
		if (skid_commit) begin
			reg_file__waddr[1'd0 * 4+:4] = skid_idx;
			reg_file__wdata[1'd0 * 35+:35] = skid_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
		else if (wr_en) begin
			reg_file__waddr[1'd0 * 4+:4] = inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_access_registers) * 4)+:4];
			reg_file__wdata[1'd0 * 35+:35] = wr_sel_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
	end
	always @(*) begin : update_send_val
		send_data_to_fu__val = (~reset & read_towards_fu) & (read_token_valid | ~read_armed);
		send_data_to_xbar__val = (~reset & read_towards_xbar) & (read_token_valid | ~read_armed);
	end
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : update_token_masks
		begin : sv2v_autoblock_1
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_masks; r = r + 1'd1)
				begin
					token_set_mask[sv2v_cast_4(r)] = (wr_en & (inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_masks) * 4)+:4] == sv2v_cast_4(r))) | (skid_commit & (skid_idx == sv2v_cast_4(r)));
					token_clear_mask[sv2v_cast_4(r)] = (((inport_ctrl_proceed & (read_towards_fu | read_towards_xbar)) & (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_masks) * 4)+:4] == sv2v_cast_4(r))) & ~inport_opt[0 + sv2v_cast_2(__const__reg_bank_id_at_update_token_masks)+:1]) & token_valid[sv2v_cast_4(r)];
				end
		end
	end
	always @(*) begin : update_token_status
		__tmpvar__update_token_status_read_towards = inport_opt[20 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 2)+:2];
		read_towards_fu = (__tmpvar__update_token_status_read_towards == sv2v_cast_2(__const__READ_TOWARDS_FU)) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_towards_xbar = (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_ROUTING_XBAR) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_token_valid = 1'd0;
		read_armed = 1'd0;
		wr_target_holds_token = 1'd0;
		skid_target_holds_token = 1'd0;
		begin : sv2v_autoblock_2
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_status; r = r + 1'd1)
				begin
					if (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == sv2v_cast_4(r)) begin
						read_token_valid = token_valid[sv2v_cast_4(r)];
						read_armed = armed[sv2v_cast_4(r)];
					end
					if (inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == sv2v_cast_4(r))
						wr_target_holds_token = token_valid[sv2v_cast_4(r)];
					if (skid_idx == sv2v_cast_4(r))
						skid_target_holds_token = token_valid[sv2v_cast_4(r)];
				end
		end
		wr_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4]);
		skid_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_status) * 4)+:4] == skid_idx);
		skid_commit = skid_valid & ((skid_target_being_read & inport_ctrl_proceed) | (~skid_target_being_read & ~skid_target_holds_token));
		outport_wr_rdy = (~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & ~skid_valid);
	end
	always @(posedge clk) begin : update_token_valid
		if (reset | clear) begin
			token_valid <= 16'd0;
			armed <= 16'd0;
			skid_valid <= 1'd0;
		end
		else begin
			token_valid <= (token_valid & ~token_clear_mask) | token_set_mask;
			armed <= armed | token_set_mask;
			if (skid_park) begin
				skid_valid <= 1'd1;
				skid_data <= wr_sel_data;
				skid_idx <= inport_opt[28 + (sv2v_cast_2(__const__reg_bank_id_at_update_token_valid) * 4)+:4];
			end
			else if (skid_commit)
				skid_valid <= 1'd0;
		end
	end
	assign reg_file__clk = clk;
	assign reg_file__reset = reset;
endmodule
module RegisterBankRTL__884a83c2388b61ea (
	clear,
	clk,
	inport_ctrl_proceed,
	inport_opt,
	inport_valid,
	inport_wdata,
	outport_wr_rdy,
	reset,
	send_data_to_fu__msg,
	send_data_to_fu__rdy,
	send_data_to_fu__val,
	send_data_to_xbar__msg,
	send_data_to_xbar__rdy,
	send_data_to_xbar__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] inport_ctrl_proceed;
	input wire [122:0] inport_opt;
	input wire [2:0] inport_valid;
	input wire [104:0] inport_wdata;
	output reg [0:0] outport_wr_rdy;
	input wire [0:0] reset;
	output reg [34:0] send_data_to_fu__msg;
	input wire [0:0] send_data_to_fu__rdy;
	output reg [0:0] send_data_to_fu__val;
	output reg [34:0] send_data_to_xbar__msg;
	input wire [0:0] send_data_to_xbar__rdy;
	output reg [0:0] send_data_to_xbar__val;
	localparam [1:0] __const__reg_bank_id_at_update_token_status = 2'd2;
	localparam [0:0] __const__READ_TOWARDS_FU = 1'd1;
	localparam [1:0] __const__READ_TOWARDS_BOTH = 2'd3;
	localparam [1:0] __const__READ_TOWARDS_ROUTING_XBAR = 2'd2;
	localparam [4:0] __const__num_registers_at_update_token_status = 5'd16;
	localparam [1:0] __const__reg_bank_id_at_access_registers = 2'd2;
	localparam [4:0] __const__num_registers_at_update_token_masks = 5'd16;
	localparam [1:0] __const__reg_bank_id_at_update_token_masks = 2'd2;
	localparam [1:0] __const__reg_bank_id_at_update_token_valid = 2'd2;
	reg [15:0] armed;
	reg [0:0] read_armed;
	reg [0:0] read_token_valid;
	reg [0:0] read_towards_fu;
	reg [0:0] read_towards_xbar;
	reg [0:0] skid_commit;
	reg [34:0] skid_data;
	reg [3:0] skid_idx;
	reg [0:0] skid_park;
	reg [0:0] skid_target_being_read;
	reg [0:0] skid_target_holds_token;
	reg [0:0] skid_valid;
	reg [15:0] token_clear_mask;
	reg [15:0] token_set_mask;
	reg [15:0] token_valid;
	reg [0:0] wr_accept;
	reg [0:0] wr_en;
	reg [34:0] wr_sel_data;
	reg [0:0] wr_target_being_read;
	reg [0:0] wr_target_holds_token;
	wire [0:0] reg_file__clk;
	reg [3:0] reg_file__raddr;
	wire [34:0] reg_file__rdata;
	wire [0:0] reg_file__reset;
	reg [3:0] reg_file__waddr;
	reg [34:0] reg_file__wdata;
	reg [0:0] reg_file__wen;
	RegisterFile__84f0703fd9bfd535 reg_file(
		.clk(reg_file__clk),
		.raddr(reg_file__raddr),
		.rdata(reg_file__rdata),
		.reset(reg_file__reset),
		.waddr(reg_file__waddr),
		.wdata(reg_file__wdata),
		.wen(reg_file__wen)
	);
	reg [1:0] __tmpvar__update_token_status_read_towards;
	reg [1:0] __tmpvar__access_registers_read_towards;
	reg [1:0] __tmpvar__access_registers_write_reg_from;
	always @(*) begin : access_registers
		reg_file__raddr[1'd0 * 4+:4] = 4'd0;
		send_data_to_fu__msg = 35'h000000000;
		send_data_to_xbar__msg = 35'h000000000;
		reg_file__waddr[1'd0 * 4+:4] = 4'd0;
		reg_file__wdata[1'd0 * 35+:35] = 35'h000000000;
		reg_file__wen[1'd0+:1] = 1'd0;
		wr_accept = 1'd0;
		wr_en = 1'd0;
		skid_park = 1'd0;
		wr_sel_data = 35'h000000000;
		__tmpvar__access_registers_read_towards = inport_opt[20 + (__const__reg_bank_id_at_access_registers * 2)+:2];
		if (__tmpvar__access_registers_read_towards > 2'd0) begin
			reg_file__raddr[1'd0 * 4+:4] = inport_opt[4 + (__const__reg_bank_id_at_access_registers * 4)+:4];
			send_data_to_fu__msg = reg_file__rdata[1'd0 * 35+:35];
			send_data_to_xbar__msg = reg_file__rdata[1'd0 * 35+:35];
		end
		__tmpvar__access_registers_write_reg_from = inport_opt[44 + (__const__reg_bank_id_at_access_registers * 2)+:2];
		if (~reset & (__tmpvar__access_registers_write_reg_from > 2'd0)) begin
			wr_sel_data = inport_wdata[((2 + 2'd1) - __tmpvar__access_registers_write_reg_from) * 35+:35];
			if (inport_valid[(2 + 2'd1) - __tmpvar__access_registers_write_reg_from+:1] & outport_wr_rdy) begin
				wr_accept = 1'd1;
				if ((~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & inport_ctrl_proceed))
					wr_en = 1'd1;
				else
					skid_park = 1'd1;
			end
		end
		if (skid_commit) begin
			reg_file__waddr[1'd0 * 4+:4] = skid_idx;
			reg_file__wdata[1'd0 * 35+:35] = skid_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
		else if (wr_en) begin
			reg_file__waddr[1'd0 * 4+:4] = inport_opt[28 + (__const__reg_bank_id_at_access_registers * 4)+:4];
			reg_file__wdata[1'd0 * 35+:35] = wr_sel_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
	end
	always @(*) begin : update_send_val
		send_data_to_fu__val = (~reset & read_towards_fu) & (read_token_valid | ~read_armed);
		send_data_to_xbar__val = (~reset & read_towards_xbar) & (read_token_valid | ~read_armed);
	end
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : update_token_masks
		begin : sv2v_autoblock_1
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_masks; r = r + 1'd1)
				begin
					token_set_mask[sv2v_cast_4(r)] = (wr_en & (inport_opt[28 + (__const__reg_bank_id_at_update_token_masks * 4)+:4] == sv2v_cast_4(r))) | (skid_commit & (skid_idx == sv2v_cast_4(r)));
					token_clear_mask[sv2v_cast_4(r)] = (((inport_ctrl_proceed & (read_towards_fu | read_towards_xbar)) & (inport_opt[4 + (__const__reg_bank_id_at_update_token_masks * 4)+:4] == sv2v_cast_4(r))) & ~inport_opt[0 + __const__reg_bank_id_at_update_token_masks+:1]) & token_valid[sv2v_cast_4(r)];
				end
		end
	end
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : update_token_status
		__tmpvar__update_token_status_read_towards = inport_opt[20 + (__const__reg_bank_id_at_update_token_status * 2)+:2];
		read_towards_fu = (__tmpvar__update_token_status_read_towards == sv2v_cast_2(__const__READ_TOWARDS_FU)) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_towards_xbar = (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_ROUTING_XBAR) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_token_valid = 1'd0;
		read_armed = 1'd0;
		wr_target_holds_token = 1'd0;
		skid_target_holds_token = 1'd0;
		begin : sv2v_autoblock_2
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_status; r = r + 1'd1)
				begin
					if (inport_opt[4 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == sv2v_cast_4(r)) begin
						read_token_valid = token_valid[sv2v_cast_4(r)];
						read_armed = armed[sv2v_cast_4(r)];
					end
					if (inport_opt[28 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == sv2v_cast_4(r))
						wr_target_holds_token = token_valid[sv2v_cast_4(r)];
					if (skid_idx == sv2v_cast_4(r))
						skid_target_holds_token = token_valid[sv2v_cast_4(r)];
				end
		end
		wr_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == inport_opt[28 + (__const__reg_bank_id_at_update_token_status * 4)+:4]);
		skid_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == skid_idx);
		skid_commit = skid_valid & ((skid_target_being_read & inport_ctrl_proceed) | (~skid_target_being_read & ~skid_target_holds_token));
		outport_wr_rdy = (~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & ~skid_valid);
	end
	always @(posedge clk) begin : update_token_valid
		if (reset | clear) begin
			token_valid <= 16'd0;
			armed <= 16'd0;
			skid_valid <= 1'd0;
		end
		else begin
			token_valid <= (token_valid & ~token_clear_mask) | token_set_mask;
			armed <= armed | token_set_mask;
			if (skid_park) begin
				skid_valid <= 1'd1;
				skid_data <= wr_sel_data;
				skid_idx <= inport_opt[28 + (__const__reg_bank_id_at_update_token_valid * 4)+:4];
			end
			else if (skid_commit)
				skid_valid <= 1'd0;
		end
	end
	assign reg_file__clk = clk;
	assign reg_file__reset = reset;
endmodule
module RegisterBankRTL__5cd5a8a1bb8b6889 (
	clear,
	clk,
	inport_ctrl_proceed,
	inport_opt,
	inport_valid,
	inport_wdata,
	outport_wr_rdy,
	reset,
	send_data_to_fu__msg,
	send_data_to_fu__rdy,
	send_data_to_fu__val,
	send_data_to_xbar__msg,
	send_data_to_xbar__rdy,
	send_data_to_xbar__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] inport_ctrl_proceed;
	input wire [122:0] inport_opt;
	input wire [2:0] inport_valid;
	input wire [104:0] inport_wdata;
	output reg [0:0] outport_wr_rdy;
	input wire [0:0] reset;
	output reg [34:0] send_data_to_fu__msg;
	input wire [0:0] send_data_to_fu__rdy;
	output reg [0:0] send_data_to_fu__val;
	output reg [34:0] send_data_to_xbar__msg;
	input wire [0:0] send_data_to_xbar__rdy;
	output reg [0:0] send_data_to_xbar__val;
	localparam [1:0] __const__reg_bank_id_at_update_token_status = 2'd3;
	localparam [0:0] __const__READ_TOWARDS_FU = 1'd1;
	localparam [1:0] __const__READ_TOWARDS_BOTH = 2'd3;
	localparam [1:0] __const__READ_TOWARDS_ROUTING_XBAR = 2'd2;
	localparam [4:0] __const__num_registers_at_update_token_status = 5'd16;
	localparam [1:0] __const__reg_bank_id_at_access_registers = 2'd3;
	localparam [4:0] __const__num_registers_at_update_token_masks = 5'd16;
	localparam [1:0] __const__reg_bank_id_at_update_token_masks = 2'd3;
	localparam [1:0] __const__reg_bank_id_at_update_token_valid = 2'd3;
	reg [15:0] armed;
	reg [0:0] read_armed;
	reg [0:0] read_token_valid;
	reg [0:0] read_towards_fu;
	reg [0:0] read_towards_xbar;
	reg [0:0] skid_commit;
	reg [34:0] skid_data;
	reg [3:0] skid_idx;
	reg [0:0] skid_park;
	reg [0:0] skid_target_being_read;
	reg [0:0] skid_target_holds_token;
	reg [0:0] skid_valid;
	reg [15:0] token_clear_mask;
	reg [15:0] token_set_mask;
	reg [15:0] token_valid;
	reg [0:0] wr_accept;
	reg [0:0] wr_en;
	reg [34:0] wr_sel_data;
	reg [0:0] wr_target_being_read;
	reg [0:0] wr_target_holds_token;
	wire [0:0] reg_file__clk;
	reg [3:0] reg_file__raddr;
	wire [34:0] reg_file__rdata;
	wire [0:0] reg_file__reset;
	reg [3:0] reg_file__waddr;
	reg [34:0] reg_file__wdata;
	reg [0:0] reg_file__wen;
	RegisterFile__84f0703fd9bfd535 reg_file(
		.clk(reg_file__clk),
		.raddr(reg_file__raddr),
		.rdata(reg_file__rdata),
		.reset(reg_file__reset),
		.waddr(reg_file__waddr),
		.wdata(reg_file__wdata),
		.wen(reg_file__wen)
	);
	reg [1:0] __tmpvar__update_token_status_read_towards;
	reg [1:0] __tmpvar__access_registers_read_towards;
	reg [1:0] __tmpvar__access_registers_write_reg_from;
	always @(*) begin : access_registers
		reg_file__raddr[1'd0 * 4+:4] = 4'd0;
		send_data_to_fu__msg = 35'h000000000;
		send_data_to_xbar__msg = 35'h000000000;
		reg_file__waddr[1'd0 * 4+:4] = 4'd0;
		reg_file__wdata[1'd0 * 35+:35] = 35'h000000000;
		reg_file__wen[1'd0+:1] = 1'd0;
		wr_accept = 1'd0;
		wr_en = 1'd0;
		skid_park = 1'd0;
		wr_sel_data = 35'h000000000;
		__tmpvar__access_registers_read_towards = inport_opt[20 + (__const__reg_bank_id_at_access_registers * 2)+:2];
		if (__tmpvar__access_registers_read_towards > 2'd0) begin
			reg_file__raddr[1'd0 * 4+:4] = inport_opt[4 + (__const__reg_bank_id_at_access_registers * 4)+:4];
			send_data_to_fu__msg = reg_file__rdata[1'd0 * 35+:35];
			send_data_to_xbar__msg = reg_file__rdata[1'd0 * 35+:35];
		end
		__tmpvar__access_registers_write_reg_from = inport_opt[44 + (__const__reg_bank_id_at_access_registers * 2)+:2];
		if (~reset & (__tmpvar__access_registers_write_reg_from > 2'd0)) begin
			wr_sel_data = inport_wdata[((2 + 2'd1) - __tmpvar__access_registers_write_reg_from) * 35+:35];
			if (inport_valid[(2 + 2'd1) - __tmpvar__access_registers_write_reg_from+:1] & outport_wr_rdy) begin
				wr_accept = 1'd1;
				if ((~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & inport_ctrl_proceed))
					wr_en = 1'd1;
				else
					skid_park = 1'd1;
			end
		end
		if (skid_commit) begin
			reg_file__waddr[1'd0 * 4+:4] = skid_idx;
			reg_file__wdata[1'd0 * 35+:35] = skid_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
		else if (wr_en) begin
			reg_file__waddr[1'd0 * 4+:4] = inport_opt[28 + (__const__reg_bank_id_at_access_registers * 4)+:4];
			reg_file__wdata[1'd0 * 35+:35] = wr_sel_data;
			reg_file__wen[1'd0+:1] = 1'd1;
		end
	end
	always @(*) begin : update_send_val
		send_data_to_fu__val = (~reset & read_towards_fu) & (read_token_valid | ~read_armed);
		send_data_to_xbar__val = (~reset & read_towards_xbar) & (read_token_valid | ~read_armed);
	end
	function automatic [3:0] sv2v_cast_4;
		input reg [3:0] inp;
		sv2v_cast_4 = inp;
	endfunction
	always @(*) begin : update_token_masks
		begin : sv2v_autoblock_1
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_masks; r = r + 1'd1)
				begin
					token_set_mask[sv2v_cast_4(r)] = (wr_en & (inport_opt[28 + (__const__reg_bank_id_at_update_token_masks * 4)+:4] == sv2v_cast_4(r))) | (skid_commit & (skid_idx == sv2v_cast_4(r)));
					token_clear_mask[sv2v_cast_4(r)] = (((inport_ctrl_proceed & (read_towards_fu | read_towards_xbar)) & (inport_opt[4 + (__const__reg_bank_id_at_update_token_masks * 4)+:4] == sv2v_cast_4(r))) & ~inport_opt[0 + __const__reg_bank_id_at_update_token_masks+:1]) & token_valid[sv2v_cast_4(r)];
				end
		end
	end
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin : update_token_status
		__tmpvar__update_token_status_read_towards = inport_opt[20 + (__const__reg_bank_id_at_update_token_status * 2)+:2];
		read_towards_fu = (__tmpvar__update_token_status_read_towards == sv2v_cast_2(__const__READ_TOWARDS_FU)) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_towards_xbar = (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_ROUTING_XBAR) | (__tmpvar__update_token_status_read_towards == __const__READ_TOWARDS_BOTH);
		read_token_valid = 1'd0;
		read_armed = 1'd0;
		wr_target_holds_token = 1'd0;
		skid_target_holds_token = 1'd0;
		begin : sv2v_autoblock_2
			reg [31:0] r;
			for (r = 1'd0; r < __const__num_registers_at_update_token_status; r = r + 1'd1)
				begin
					if (inport_opt[4 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == sv2v_cast_4(r)) begin
						read_token_valid = token_valid[sv2v_cast_4(r)];
						read_armed = armed[sv2v_cast_4(r)];
					end
					if (inport_opt[28 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == sv2v_cast_4(r))
						wr_target_holds_token = token_valid[sv2v_cast_4(r)];
					if (skid_idx == sv2v_cast_4(r))
						skid_target_holds_token = token_valid[sv2v_cast_4(r)];
				end
		end
		wr_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == inport_opt[28 + (__const__reg_bank_id_at_update_token_status * 4)+:4]);
		skid_target_being_read = (read_towards_fu | read_towards_xbar) & (inport_opt[4 + (__const__reg_bank_id_at_update_token_status * 4)+:4] == skid_idx);
		skid_commit = skid_valid & ((skid_target_being_read & inport_ctrl_proceed) | (~skid_target_being_read & ~skid_target_holds_token));
		outport_wr_rdy = (~wr_target_holds_token & ~wr_target_being_read) | (wr_target_being_read & ~skid_valid);
	end
	always @(posedge clk) begin : update_token_valid
		if (reset | clear) begin
			token_valid <= 16'd0;
			armed <= 16'd0;
			skid_valid <= 1'd0;
		end
		else begin
			token_valid <= (token_valid & ~token_clear_mask) | token_set_mask;
			armed <= armed | token_set_mask;
			if (skid_park) begin
				skid_valid <= 1'd1;
				skid_data <= wr_sel_data;
				skid_idx <= inport_opt[28 + (__const__reg_bank_id_at_update_token_valid * 4)+:4];
			end
			else if (skid_commit)
				skid_valid <= 1'd0;
		end
	end
	assign reg_file__clk = clk;
	assign reg_file__reset = reset;
endmodule
module RegisterClusterRTL__9b64e99d13e3878e (
	clear,
	clk,
	inport_ctrl_proceed,
	inport_opt,
	reset,
	recv_data_from_const__msg,
	recv_data_from_const__rdy,
	recv_data_from_const__val,
	recv_data_from_fu_crossbar__msg,
	recv_data_from_fu_crossbar__rdy,
	recv_data_from_fu_crossbar__val,
	recv_data_from_routing_crossbar__msg,
	recv_data_from_routing_crossbar__rdy,
	recv_data_from_routing_crossbar__val,
	send_data_to_fu__msg,
	send_data_to_fu__rdy,
	send_data_to_fu__val,
	send_data_to_routing_crossbar__msg,
	send_data_to_routing_crossbar__rdy,
	send_data_to_routing_crossbar__val
);
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] inport_ctrl_proceed;
	input wire [122:0] inport_opt;
	input wire [0:0] reset;
	input wire [139:0] recv_data_from_const__msg;
	output reg [3:0] recv_data_from_const__rdy;
	input wire [3:0] recv_data_from_const__val;
	input wire [139:0] recv_data_from_fu_crossbar__msg;
	output reg [3:0] recv_data_from_fu_crossbar__rdy;
	input wire [3:0] recv_data_from_fu_crossbar__val;
	input wire [139:0] recv_data_from_routing_crossbar__msg;
	output reg [3:0] recv_data_from_routing_crossbar__rdy;
	input wire [3:0] recv_data_from_routing_crossbar__val;
	output reg [139:0] send_data_to_fu__msg;
	input wire [3:0] send_data_to_fu__rdy;
	output reg [3:0] send_data_to_fu__val;
	output wire [139:0] send_data_to_routing_crossbar__msg;
	input wire [3:0] send_data_to_routing_crossbar__rdy;
	output wire [3:0] send_data_to_routing_crossbar__val;
	localparam [2:0] __const__num_reg_banks_at_update_msgs_signals = 3'd4;
	localparam [0:0] __const__READ_TOWARDS_FU = 1'd1;
	localparam [1:0] __const__READ_TOWARDS_BOTH = 2'd3;
	localparam [0:0] __const__PORT_ROUTING_CROSSBAR = 1'd1;
	localparam [6:0] __const__OPT_NAH = 7'd1;
	localparam [1:0] __const__PORT_FU_CROSSBAR = 2'd2;
	localparam [1:0] __const__PORT_CONST = 2'd3;
	wire [0:0] reg_bank__clear [0:3];
	wire [0:0] reg_bank__clk [0:3];
	wire [0:0] reg_bank__inport_ctrl_proceed [0:3];
	wire [122:0] reg_bank__inport_opt [0:3];
	wire [2:0] reg_bank__inport_valid [0:3];
	wire [104:0] reg_bank__inport_wdata [0:3];
	wire [0:0] reg_bank__outport_wr_rdy [0:3];
	wire [0:0] reg_bank__reset [0:3];
	wire [34:0] reg_bank__send_data_to_fu__msg [0:3];
	reg [0:0] reg_bank__send_data_to_fu__rdy [0:3];
	wire [0:0] reg_bank__send_data_to_fu__val [0:3];
	wire [34:0] reg_bank__send_data_to_xbar__msg [0:3];
	wire [0:0] reg_bank__send_data_to_xbar__rdy [0:3];
	wire [0:0] reg_bank__send_data_to_xbar__val [0:3];
	RegisterBankRTL__8b95a13a898ab3e7 reg_bank__0(
		.clear(reg_bank__clear[0]),
		.clk(reg_bank__clk[0]),
		.inport_ctrl_proceed(reg_bank__inport_ctrl_proceed[0]),
		.inport_opt(reg_bank__inport_opt[0]),
		.inport_valid(reg_bank__inport_valid[0]),
		.inport_wdata(reg_bank__inport_wdata[0]),
		.outport_wr_rdy(reg_bank__outport_wr_rdy[0]),
		.reset(reg_bank__reset[0]),
		.send_data_to_fu__msg(reg_bank__send_data_to_fu__msg[0]),
		.send_data_to_fu__rdy(reg_bank__send_data_to_fu__rdy[0]),
		.send_data_to_fu__val(reg_bank__send_data_to_fu__val[0]),
		.send_data_to_xbar__msg(reg_bank__send_data_to_xbar__msg[0]),
		.send_data_to_xbar__rdy(reg_bank__send_data_to_xbar__rdy[0]),
		.send_data_to_xbar__val(reg_bank__send_data_to_xbar__val[0])
	);
	RegisterBankRTL__bc9cc99cab2bb455 reg_bank__1(
		.clear(reg_bank__clear[1]),
		.clk(reg_bank__clk[1]),
		.inport_ctrl_proceed(reg_bank__inport_ctrl_proceed[1]),
		.inport_opt(reg_bank__inport_opt[1]),
		.inport_valid(reg_bank__inport_valid[1]),
		.inport_wdata(reg_bank__inport_wdata[1]),
		.outport_wr_rdy(reg_bank__outport_wr_rdy[1]),
		.reset(reg_bank__reset[1]),
		.send_data_to_fu__msg(reg_bank__send_data_to_fu__msg[1]),
		.send_data_to_fu__rdy(reg_bank__send_data_to_fu__rdy[1]),
		.send_data_to_fu__val(reg_bank__send_data_to_fu__val[1]),
		.send_data_to_xbar__msg(reg_bank__send_data_to_xbar__msg[1]),
		.send_data_to_xbar__rdy(reg_bank__send_data_to_xbar__rdy[1]),
		.send_data_to_xbar__val(reg_bank__send_data_to_xbar__val[1])
	);
	RegisterBankRTL__884a83c2388b61ea reg_bank__2(
		.clear(reg_bank__clear[2]),
		.clk(reg_bank__clk[2]),
		.inport_ctrl_proceed(reg_bank__inport_ctrl_proceed[2]),
		.inport_opt(reg_bank__inport_opt[2]),
		.inport_valid(reg_bank__inport_valid[2]),
		.inport_wdata(reg_bank__inport_wdata[2]),
		.outport_wr_rdy(reg_bank__outport_wr_rdy[2]),
		.reset(reg_bank__reset[2]),
		.send_data_to_fu__msg(reg_bank__send_data_to_fu__msg[2]),
		.send_data_to_fu__rdy(reg_bank__send_data_to_fu__rdy[2]),
		.send_data_to_fu__val(reg_bank__send_data_to_fu__val[2]),
		.send_data_to_xbar__msg(reg_bank__send_data_to_xbar__msg[2]),
		.send_data_to_xbar__rdy(reg_bank__send_data_to_xbar__rdy[2]),
		.send_data_to_xbar__val(reg_bank__send_data_to_xbar__val[2])
	);
	RegisterBankRTL__5cd5a8a1bb8b6889 reg_bank__3(
		.clear(reg_bank__clear[3]),
		.clk(reg_bank__clk[3]),
		.inport_ctrl_proceed(reg_bank__inport_ctrl_proceed[3]),
		.inport_opt(reg_bank__inport_opt[3]),
		.inport_valid(reg_bank__inport_valid[3]),
		.inport_wdata(reg_bank__inport_wdata[3]),
		.outport_wr_rdy(reg_bank__outport_wr_rdy[3]),
		.reset(reg_bank__reset[3]),
		.send_data_to_fu__msg(reg_bank__send_data_to_fu__msg[3]),
		.send_data_to_fu__rdy(reg_bank__send_data_to_fu__rdy[3]),
		.send_data_to_fu__val(reg_bank__send_data_to_fu__val[3]),
		.send_data_to_xbar__msg(reg_bank__send_data_to_xbar__msg[3]),
		.send_data_to_xbar__rdy(reg_bank__send_data_to_xbar__rdy[3]),
		.send_data_to_xbar__val(reg_bank__send_data_to_xbar__val[3])
	);
	reg [0:0] __tmpvar__update_msgs_signals_lane_used_by_fu;
	reg [1:0] __tmpvar__update_msgs_signals_read_towards;
	reg [0:0] __tmpvar__update_msgs_signals_reg_towards_fu;
	reg [0:0] __tmpvar__update_msgs_signals_routing_selected_for_write;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : update_msgs_signals
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_reg_banks_at_update_msgs_signals; i = i + 1'd1)
				begin
					send_data_to_fu__msg[(3 - sv2v_cast_2(i)) * 35+:35] = 35'h000000000;
					recv_data_from_routing_crossbar__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
					recv_data_from_fu_crossbar__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
					recv_data_from_const__rdy[3 - sv2v_cast_2(i)+:1] = 1'd0;
					send_data_to_fu__val[3 - sv2v_cast_2(i)+:1] = 1'd0;
				end
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_reg_banks_at_update_msgs_signals; i = i + 1'd1)
				begin
					if (reg_bank__send_data_to_fu__val[sv2v_cast_2(i)])
						send_data_to_fu__msg[(3 - sv2v_cast_2(i)) * 35+:35] = reg_bank__send_data_to_fu__msg[sv2v_cast_2(i)];
					else if (recv_data_from_routing_crossbar__val[3 - sv2v_cast_2(i)+:1])
						send_data_to_fu__msg[(3 - sv2v_cast_2(i)) * 35+:35] = recv_data_from_routing_crossbar__msg[(3 - sv2v_cast_2(i)) * 35+:35];
					send_data_to_fu__val[3 - sv2v_cast_2(i)+:1] = recv_data_from_routing_crossbar__val[3 - sv2v_cast_2(i)+:1] | reg_bank__send_data_to_fu__val[sv2v_cast_2(i)];
					reg_bank__send_data_to_fu__rdy[sv2v_cast_2(i)] = send_data_to_fu__rdy[3 - sv2v_cast_2(i)+:1];
					__tmpvar__update_msgs_signals_lane_used_by_fu = inport_opt[104 + (2'd0 * 3)+:3] == (sv2v_cast_3(i) + 3'd1);
					begin : sv2v_autoblock_3
						reg [31:0] operand_slot;
						for (operand_slot = 1'd1; operand_slot < __const__num_reg_banks_at_update_msgs_signals; operand_slot = operand_slot + 1'd1)
							__tmpvar__update_msgs_signals_lane_used_by_fu = __tmpvar__update_msgs_signals_lane_used_by_fu | (inport_opt[104 + (sv2v_cast_2(operand_slot) * 3)+:3] == (sv2v_cast_3(i) + 3'd1));
					end
					__tmpvar__update_msgs_signals_read_towards = inport_opt[20 + (sv2v_cast_2(i) * 2)+:2];
					__tmpvar__update_msgs_signals_reg_towards_fu = (__tmpvar__update_msgs_signals_read_towards == sv2v_cast_2(__const__READ_TOWARDS_FU)) | (__tmpvar__update_msgs_signals_read_towards == __const__READ_TOWARDS_BOTH);
					__tmpvar__update_msgs_signals_routing_selected_for_write = (inport_opt[44 + (sv2v_cast_2(i) * 2)+:2] == sv2v_cast_2(__const__PORT_ROUTING_CROSSBAR)) & ((inport_opt[122-:7] == __const__OPT_NAH) | __tmpvar__update_msgs_signals_reg_towards_fu);
					recv_data_from_routing_crossbar__rdy[3 - sv2v_cast_2(i)+:1] = (__tmpvar__update_msgs_signals_routing_selected_for_write & reg_bank__outport_wr_rdy[sv2v_cast_2(i)]) | (~__tmpvar__update_msgs_signals_routing_selected_for_write & ((((inport_opt[122-:7] == __const__OPT_NAH) | ~__tmpvar__update_msgs_signals_lane_used_by_fu) | __tmpvar__update_msgs_signals_reg_towards_fu) | send_data_to_fu__rdy[3 - sv2v_cast_2(i)+:1]));
					recv_data_from_fu_crossbar__rdy[3 - sv2v_cast_2(i)+:1] = (inport_opt[44 + (sv2v_cast_2(i) * 2)+:2] != __const__PORT_FU_CROSSBAR) | reg_bank__outport_wr_rdy[sv2v_cast_2(i)];
					recv_data_from_const__rdy[3 - sv2v_cast_2(i)+:1] = (inport_opt[44 + (sv2v_cast_2(i) * 2)+:2] != __const__PORT_CONST) | reg_bank__outport_wr_rdy[sv2v_cast_2(i)];
				end
		end
	end
	assign reg_bank__clk[0] = clk;
	assign reg_bank__reset[0] = reset;
	assign reg_bank__clk[1] = clk;
	assign reg_bank__reset[1] = reset;
	assign reg_bank__clk[2] = clk;
	assign reg_bank__reset[2] = reset;
	assign reg_bank__clk[3] = clk;
	assign reg_bank__reset[3] = reset;
	assign reg_bank__inport_opt[0] = inport_opt;
	assign reg_bank__inport_ctrl_proceed[0] = inport_ctrl_proceed;
	assign reg_bank__clear[0] = clear;
	assign reg_bank__inport_wdata[0][70+:35] = recv_data_from_routing_crossbar__msg[105+:35];
	assign reg_bank__inport_wdata[0][35+:35] = recv_data_from_fu_crossbar__msg[105+:35];
	assign reg_bank__inport_wdata[0][0+:35] = recv_data_from_const__msg[105+:35];
	assign reg_bank__inport_valid[0][2+:1] = recv_data_from_routing_crossbar__val[3+:1];
	assign reg_bank__inport_valid[0][1+:1] = recv_data_from_fu_crossbar__val[3+:1];
	assign reg_bank__inport_valid[0][0+:1] = recv_data_from_const__val[3+:1];
	assign send_data_to_routing_crossbar__msg[105+:35] = reg_bank__send_data_to_xbar__msg[0];
	assign reg_bank__send_data_to_xbar__rdy[0] = send_data_to_routing_crossbar__rdy[3+:1];
	assign send_data_to_routing_crossbar__val[3+:1] = reg_bank__send_data_to_xbar__val[0];
	assign reg_bank__inport_opt[1] = inport_opt;
	assign reg_bank__inport_ctrl_proceed[1] = inport_ctrl_proceed;
	assign reg_bank__clear[1] = clear;
	assign reg_bank__inport_wdata[1][70+:35] = recv_data_from_routing_crossbar__msg[70+:35];
	assign reg_bank__inport_wdata[1][35+:35] = recv_data_from_fu_crossbar__msg[70+:35];
	assign reg_bank__inport_wdata[1][0+:35] = recv_data_from_const__msg[70+:35];
	assign reg_bank__inport_valid[1][2+:1] = recv_data_from_routing_crossbar__val[2+:1];
	assign reg_bank__inport_valid[1][1+:1] = recv_data_from_fu_crossbar__val[2+:1];
	assign reg_bank__inport_valid[1][0+:1] = recv_data_from_const__val[2+:1];
	assign send_data_to_routing_crossbar__msg[70+:35] = reg_bank__send_data_to_xbar__msg[1];
	assign reg_bank__send_data_to_xbar__rdy[1] = send_data_to_routing_crossbar__rdy[2+:1];
	assign send_data_to_routing_crossbar__val[2+:1] = reg_bank__send_data_to_xbar__val[1];
	assign reg_bank__inport_opt[2] = inport_opt;
	assign reg_bank__inport_ctrl_proceed[2] = inport_ctrl_proceed;
	assign reg_bank__clear[2] = clear;
	assign reg_bank__inport_wdata[2][70+:35] = recv_data_from_routing_crossbar__msg[35+:35];
	assign reg_bank__inport_wdata[2][35+:35] = recv_data_from_fu_crossbar__msg[35+:35];
	assign reg_bank__inport_wdata[2][0+:35] = recv_data_from_const__msg[35+:35];
	assign reg_bank__inport_valid[2][2+:1] = recv_data_from_routing_crossbar__val[1+:1];
	assign reg_bank__inport_valid[2][1+:1] = recv_data_from_fu_crossbar__val[1+:1];
	assign reg_bank__inport_valid[2][0+:1] = recv_data_from_const__val[1+:1];
	assign send_data_to_routing_crossbar__msg[35+:35] = reg_bank__send_data_to_xbar__msg[2];
	assign reg_bank__send_data_to_xbar__rdy[2] = send_data_to_routing_crossbar__rdy[1+:1];
	assign send_data_to_routing_crossbar__val[1+:1] = reg_bank__send_data_to_xbar__val[2];
	assign reg_bank__inport_opt[3] = inport_opt;
	assign reg_bank__inport_ctrl_proceed[3] = inport_ctrl_proceed;
	assign reg_bank__clear[3] = clear;
	assign reg_bank__inport_wdata[3][70+:35] = recv_data_from_routing_crossbar__msg[0+:35];
	assign reg_bank__inport_wdata[3][35+:35] = recv_data_from_fu_crossbar__msg[0+:35];
	assign reg_bank__inport_wdata[3][0+:35] = recv_data_from_const__msg[0+:35];
	assign reg_bank__inport_valid[3][2+:1] = recv_data_from_routing_crossbar__val[0+:1];
	assign reg_bank__inport_valid[3][1+:1] = recv_data_from_fu_crossbar__val[0+:1];
	assign reg_bank__inport_valid[3][0+:1] = recv_data_from_const__val[0+:1];
	assign send_data_to_routing_crossbar__msg[0+:35] = reg_bank__send_data_to_xbar__msg[3];
	assign reg_bank__send_data_to_xbar__rdy[3] = send_data_to_routing_crossbar__rdy[0+:1];
	assign send_data_to_routing_crossbar__val[0+:1] = reg_bank__send_data_to_xbar__val[3];
endmodule
module CrossbarRTL__daed722bd45da2f6 (
	cgra_id,
	clear,
	clk,
	compute_done,
	crossbar_id,
	crossbar_outport,
	ctrl_addr_inport,
	prologue_count_inport,
	reset,
	tile_id,
	recv_data__msg,
	recv_data__rdy,
	recv_data__val,
	recv_opt__msg,
	recv_opt__rdy,
	recv_opt__val,
	send_data__msg,
	send_data__rdy,
	send_data__val
);
	input wire [1:0] cgra_id;
	input wire [0:0] clear;
	input wire [0:0] clk;
	input wire [0:0] compute_done;
	input wire [0:0] crossbar_id;
	input wire [31:0] crossbar_outport;
	input wire [2:0] ctrl_addr_inport;
	input wire [143:0] prologue_count_inport;
	input wire [0:0] reset;
	input wire [2:0] tile_id;
	input wire [279:0] recv_data__msg;
	output reg [7:0] recv_data__rdy;
	input wire [7:0] recv_data__val;
	input wire [122:0] recv_opt__msg;
	output reg [0:0] recv_opt__rdy;
	input wire [0:0] recv_opt__val;
	output reg [279:0] send_data__msg;
	input wire [7:0] send_data__rdy;
	output reg [7:0] send_data__val;
	localparam [3:0] __const__num_inports_at_update_signal = 4'd8;
	localparam [3:0] __const__num_outports_at_update_signal = 4'd8;
	localparam [6:0] __const__OPT_START = 7'd0;
	localparam [2:0] __const__ctrl_mem_size_at_update_prologue_counter = 3'd6;
	localparam [3:0] __const__num_inports_at_update_prologue_counter = 4'd8;
	localparam [2:0] __const__ctrl_mem_size_at_update_prologue_counter_next = 3'd6;
	localparam [3:0] __const__num_inports_at_update_prologue_counter_next = 4'd8;
	localparam [3:0] __const__num_outports_at_update_prologue_counter_next = 4'd8;
	localparam [3:0] __const__num_outports_at_update_send_accepted_next = 4'd8;
	localparam [3:0] __const__num_outports_at_update_prologue_allowing_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_prologue_or_valid_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_in_dir_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_rdy_vector = 4'd8;
	localparam [2:0] __const__outport_towards_local_base_id_at_update_rdy_vector = 3'd4;
	localparam [3:0] __const__num_outports_at_update_valid_vector = 4'd8;
	localparam [3:0] __const__num_inports_at_update_recv_required_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_recv_required_vector = 4'd8;
	localparam [3:0] __const__num_outports_at_update_send_required_vector = 4'd8;
	reg [0:0] all_send_accepted;
	reg [7:0] during_prologue_allowing_vector;
	reg [3:0] in_dir [0:7];
	reg [2:0] in_dir_local [0:7];
	wire [2:0] prologue_count_wire [0:5][0:7];
	reg [2:0] prologue_counter [0:5][0:7];
	reg [2:0] prologue_counter_next [0:5][0:7];
	wire [34:0] recv_data_msg [0:7];
	wire [0:0] recv_data_val [0:7];
	reg [7:0] recv_required_vector;
	reg [7:0] recv_valid_excluding_prologue_vector;
	reg [7:0] recv_valid_or_during_prologue_allowing_vector;
	reg [7:0] send_accepted;
	reg [7:0] send_accepted_next;
	reg [7:0] send_rdy_or_during_prologue_vector;
	reg [7:0] send_required_vector;
	function automatic [2:0] sv2v_cast_3;
		input reg [2:0] inp;
		sv2v_cast_3 = inp;
	endfunction
	always @(*) begin : update_in_dir_vector
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_in_dir_vector; i = i + 1'd1)
				begin
					in_dir[sv2v_cast_3(i)] = 4'd0;
					in_dir_local[sv2v_cast_3(i)] = 3'd0;
				end
		end
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_in_dir_vector; i = i + 1'd1)
				begin
					in_dir[sv2v_cast_3(i)] = crossbar_outport[(7 - sv2v_cast_3(i)) * 4+:4];
					if (in_dir[sv2v_cast_3(i)] > 4'd0)
						in_dir_local[sv2v_cast_3(i)] = sv2v_cast_3(in_dir[sv2v_cast_3(i)] - 4'd1);
				end
		end
	end
	always @(*) begin : update_prologue_allowing_vector
		during_prologue_allowing_vector = 8'd0;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_prologue_allowing_vector; i = i + 1'd1)
				if (in_dir[sv2v_cast_3(i)] > 4'd0)
					during_prologue_allowing_vector[sv2v_cast_3(i)] = prologue_counter[ctrl_addr_inport][in_dir_local[sv2v_cast_3(i)]] < prologue_count_wire[ctrl_addr_inport][in_dir_local[sv2v_cast_3(i)]];
				else
					during_prologue_allowing_vector[sv2v_cast_3(i)] = 1'd0;
		end
	end
	always @(*) begin : update_prologue_counter_next
		begin : sv2v_autoblock_4
			reg [31:0] addr;
			for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_counter_next; addr = addr + 1'd1)
				begin : sv2v_autoblock_5
					reg [31:0] i;
					for (i = 1'd0; i < __const__num_inports_at_update_prologue_counter_next; i = i + 1'd1)
						begin
							prologue_counter_next[sv2v_cast_3(addr)][sv2v_cast_3(i)] = prologue_counter[sv2v_cast_3(addr)][sv2v_cast_3(i)];
							begin : sv2v_autoblock_6
								reg [31:0] j;
								for (j = 1'd0; j < __const__num_outports_at_update_prologue_counter_next; j = j + 1'd1)
									if ((((recv_opt__rdy & (in_dir[sv2v_cast_3(j)] > 4'd0)) & (in_dir_local[sv2v_cast_3(j)] == sv2v_cast_3(i))) & (sv2v_cast_3(addr) == ctrl_addr_inport)) & (prologue_counter[sv2v_cast_3(addr)][sv2v_cast_3(i)] < prologue_count_wire[sv2v_cast_3(addr)][sv2v_cast_3(i)]))
										prologue_counter_next[sv2v_cast_3(addr)][sv2v_cast_3(i)] = prologue_counter[sv2v_cast_3(addr)][sv2v_cast_3(i)] + 3'd1;
							end
						end
				end
		end
	end
	always @(*) begin : update_prologue_or_valid_vector
		recv_valid_or_during_prologue_allowing_vector = 8'd0;
		begin : sv2v_autoblock_7
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_prologue_or_valid_vector; i = i + 1'd1)
				recv_valid_or_during_prologue_allowing_vector[sv2v_cast_3(i)] = recv_valid_excluding_prologue_vector[sv2v_cast_3(i)] | during_prologue_allowing_vector[sv2v_cast_3(i)];
		end
	end
	always @(*) begin : update_rdy_vector
		send_rdy_or_during_prologue_vector = 8'd0;
		begin : sv2v_autoblock_8
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_rdy_vector; i = i + 1'd1)
				if ((in_dir[sv2v_cast_3(i)] > 4'd0) & (~compute_done | (sv2v_cast_3(i) < __const__outport_towards_local_base_id_at_update_rdy_vector)))
					send_rdy_or_during_prologue_vector[sv2v_cast_3(i)] = send_data__rdy[7 - sv2v_cast_3(i)+:1] | during_prologue_allowing_vector[sv2v_cast_3(i)];
				else
					send_rdy_or_during_prologue_vector[sv2v_cast_3(i)] = 1'd1;
		end
	end
	always @(*) begin : update_recv_required_vector
		begin : sv2v_autoblock_9
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_update_recv_required_vector; i = i + 1'd1)
				recv_required_vector[sv2v_cast_3(i)] = 1'd0;
		end
		begin : sv2v_autoblock_10
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_recv_required_vector; i = i + 1'd1)
				if ((in_dir[sv2v_cast_3(i)] > 4'd0) & ~during_prologue_allowing_vector[sv2v_cast_3(i)])
					recv_required_vector[in_dir_local[sv2v_cast_3(i)]] = 1'd1;
		end
	end
	always @(*) begin : update_send_accepted_next
		send_accepted_next = send_accepted;
		if (recv_opt__val & (recv_opt__msg[122-:7] != __const__OPT_START)) begin
			begin : sv2v_autoblock_11
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_outports_at_update_send_accepted_next; i = i + 1'd1)
					if (((send_required_vector[sv2v_cast_3(i)] & ~send_accepted[sv2v_cast_3(i)]) & send_data__rdy[7 - sv2v_cast_3(i)+:1]) & send_data__val[7 - sv2v_cast_3(i)+:1])
						send_accepted_next[sv2v_cast_3(i)] = 1'd1;
			end
			if (recv_opt__rdy)
				send_accepted_next = 8'd0;
		end
		else
			send_accepted_next = 8'd0;
	end
	always @(*) begin : update_send_required_vector
		begin : sv2v_autoblock_12
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_send_required_vector; i = i + 1'd1)
				send_required_vector[sv2v_cast_3(i)] = 1'd0;
		end
		begin : sv2v_autoblock_13
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_send_required_vector; i = i + 1'd1)
				if ((in_dir[sv2v_cast_3(i)] > 4'd0) & ~during_prologue_allowing_vector[sv2v_cast_3(i)])
					send_required_vector[sv2v_cast_3(i)] = 1'd1;
		end
	end
	always @(*) begin : update_signal
		begin : sv2v_autoblock_14
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_inports_at_update_signal; i = i + 1'd1)
				recv_data__rdy[7 - sv2v_cast_3(i)+:1] = 1'd0;
		end
		begin : sv2v_autoblock_15
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_signal; i = i + 1'd1)
				begin
					send_data__val[7 - sv2v_cast_3(i)+:1] = 1'd0;
					send_data__msg[(7 - sv2v_cast_3(i)) * 35+:35] = 35'h000000000;
				end
		end
		recv_opt__rdy = 1'd0;
		all_send_accepted = 1'd0;
		if (recv_opt__val & (recv_opt__msg[122-:7] != __const__OPT_START)) begin
			all_send_accepted = 1'd1;
			begin : sv2v_autoblock_16
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_outports_at_update_signal; i = i + 1'd1)
					if ((send_required_vector[sv2v_cast_3(i)] & ~send_accepted[sv2v_cast_3(i)]) & ~send_rdy_or_during_prologue_vector[sv2v_cast_3(i)])
						all_send_accepted = 1'd0;
			end
			begin : sv2v_autoblock_17
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_inports_at_update_signal; i = i + 1'd1)
					recv_data__rdy[7 - sv2v_cast_3(i)+:1] = (&recv_valid_or_during_prologue_allowing_vector & all_send_accepted) & recv_required_vector[sv2v_cast_3(i)];
			end
			begin : sv2v_autoblock_18
				reg [31:0] i;
				for (i = 1'd0; i < __const__num_outports_at_update_signal; i = i + 1'd1)
					begin
						send_data__val[7 - sv2v_cast_3(i)+:1] = (&recv_valid_or_during_prologue_allowing_vector & send_required_vector[sv2v_cast_3(i)]) & ~send_accepted[sv2v_cast_3(i)];
						if ((&recv_valid_or_during_prologue_allowing_vector & send_required_vector[sv2v_cast_3(i)]) & ~send_accepted[sv2v_cast_3(i)]) begin
							send_data__msg[((7 - sv2v_cast_3(i)) * 35) + 34-:32] = recv_data_msg[in_dir_local[sv2v_cast_3(i)]][34-:32];
							send_data__msg[((7 - sv2v_cast_3(i)) * 35) + 2] = recv_data_msg[in_dir_local[sv2v_cast_3(i)]][2];
						end
					end
			end
			recv_opt__rdy = all_send_accepted & &recv_valid_or_during_prologue_allowing_vector;
		end
	end
	always @(*) begin : update_valid_vector
		recv_valid_excluding_prologue_vector = 8'd0;
		begin : sv2v_autoblock_19
			reg [31:0] i;
			for (i = 1'd0; i < __const__num_outports_at_update_valid_vector; i = i + 1'd1)
				if (in_dir[sv2v_cast_3(i)] > 4'd0)
					recv_valid_excluding_prologue_vector[sv2v_cast_3(i)] = recv_data_val[in_dir_local[sv2v_cast_3(i)]] & ~during_prologue_allowing_vector[sv2v_cast_3(i)];
				else
					recv_valid_excluding_prologue_vector[sv2v_cast_3(i)] = 1'd1;
		end
	end
	always @(posedge clk) begin : update_prologue_counter
		if (reset | clear) begin
			begin : sv2v_autoblock_20
				reg [31:0] addr;
				for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_counter; addr = addr + 1'd1)
					begin : sv2v_autoblock_21
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_inports_at_update_prologue_counter; i = i + 1'd1)
							prologue_counter[sv2v_cast_3(addr)][sv2v_cast_3(i)] <= 3'd0;
					end
			end
			send_accepted <= 8'd0;
		end
		else begin
			begin : sv2v_autoblock_22
				reg [31:0] addr;
				for (addr = 1'd0; addr < __const__ctrl_mem_size_at_update_prologue_counter; addr = addr + 1'd1)
					begin : sv2v_autoblock_23
						reg [31:0] i;
						for (i = 1'd0; i < __const__num_inports_at_update_prologue_counter; i = i + 1'd1)
							prologue_counter[sv2v_cast_3(addr)][sv2v_cast_3(i)] <= prologue_counter_next[sv2v_cast_3(addr)][sv2v_cast_3(i)];
					end
			end
			send_accepted <= send_accepted_next;
		end
	end
	assign recv_data_msg[0] = recv_data__msg[245+:35];
	assign recv_data_val[0] = recv_data__val[7+:1];
	assign recv_data_msg[1] = recv_data__msg[210+:35];
	assign recv_data_val[1] = recv_data__val[6+:1];
	assign recv_data_msg[2] = recv_data__msg[175+:35];
	assign recv_data_val[2] = recv_data__val[5+:1];
	assign recv_data_msg[3] = recv_data__msg[140+:35];
	assign recv_data_val[3] = recv_data__val[4+:1];
	assign recv_data_msg[4] = recv_data__msg[105+:35];
	assign recv_data_val[4] = recv_data__val[3+:1];
	assign recv_data_msg[5] = recv_data__msg[70+:35];
	assign recv_data_val[5] = recv_data__val[2+:1];
	assign recv_data_msg[6] = recv_data__msg[35+:35];
	assign recv_data_val[6] = recv_data__val[1+:1];
	assign recv_data_msg[7] = recv_data__msg[0+:35];
	assign recv_data_val[7] = recv_data__val[0+:1];
	assign prologue_count_wire[0][0] = prologue_count_inport[141+:3];
	assign prologue_count_wire[0][1] = prologue_count_inport[138+:3];
	assign prologue_count_wire[0][2] = prologue_count_inport[135+:3];
	assign prologue_count_wire[0][3] = prologue_count_inport[132+:3];
	assign prologue_count_wire[0][4] = prologue_count_inport[129+:3];
	assign prologue_count_wire[0][5] = prologue_count_inport[126+:3];
	assign prologue_count_wire[0][6] = prologue_count_inport[123+:3];
	assign prologue_count_wire[0][7] = prologue_count_inport[120+:3];
	assign prologue_count_wire[1][0] = prologue_count_inport[117+:3];
	assign prologue_count_wire[1][1] = prologue_count_inport[114+:3];
	assign prologue_count_wire[1][2] = prologue_count_inport[111+:3];
	assign prologue_count_wire[1][3] = prologue_count_inport[108+:3];
	assign prologue_count_wire[1][4] = prologue_count_inport[105+:3];
	assign prologue_count_wire[1][5] = prologue_count_inport[102+:3];
	assign prologue_count_wire[1][6] = prologue_count_inport[99+:3];
	assign prologue_count_wire[1][7] = prologue_count_inport[96+:3];
	assign prologue_count_wire[2][0] = prologue_count_inport[93+:3];
	assign prologue_count_wire[2][1] = prologue_count_inport[90+:3];
	assign prologue_count_wire[2][2] = prologue_count_inport[87+:3];
	assign prologue_count_wire[2][3] = prologue_count_inport[84+:3];
	assign prologue_count_wire[2][4] = prologue_count_inport[81+:3];
	assign prologue_count_wire[2][5] = prologue_count_inport[78+:3];
	assign prologue_count_wire[2][6] = prologue_count_inport[75+:3];
	assign prologue_count_wire[2][7] = prologue_count_inport[72+:3];
	assign prologue_count_wire[3][0] = prologue_count_inport[69+:3];
	assign prologue_count_wire[3][1] = prologue_count_inport[66+:3];
	assign prologue_count_wire[3][2] = prologue_count_inport[63+:3];
	assign prologue_count_wire[3][3] = prologue_count_inport[60+:3];
	assign prologue_count_wire[3][4] = prologue_count_inport[57+:3];
	assign prologue_count_wire[3][5] = prologue_count_inport[54+:3];
	assign prologue_count_wire[3][6] = prologue_count_inport[51+:3];
	assign prologue_count_wire[3][7] = prologue_count_inport[48+:3];
	assign prologue_count_wire[4][0] = prologue_count_inport[45+:3];
	assign prologue_count_wire[4][1] = prologue_count_inport[42+:3];
	assign prologue_count_wire[4][2] = prologue_count_inport[39+:3];
	assign prologue_count_wire[4][3] = prologue_count_inport[36+:3];
	assign prologue_count_wire[4][4] = prologue_count_inport[33+:3];
	assign prologue_count_wire[4][5] = prologue_count_inport[30+:3];
	assign prologue_count_wire[4][6] = prologue_count_inport[27+:3];
	assign prologue_count_wire[4][7] = prologue_count_inport[24+:3];
	assign prologue_count_wire[5][0] = prologue_count_inport[21+:3];
	assign prologue_count_wire[5][1] = prologue_count_inport[18+:3];
	assign prologue_count_wire[5][2] = prologue_count_inport[15+:3];
	assign prologue_count_wire[5][3] = prologue_count_inport[12+:3];
	assign prologue_count_wire[5][4] = prologue_count_inport[9+:3];
	assign prologue_count_wire[5][5] = prologue_count_inport[6+:3];
	assign prologue_count_wire[5][6] = prologue_count_inport[3+:3];
	assign prologue_count_wire[5][7] = prologue_count_inport[0+:3];
endmodule
module RegisterFile__da749a1852bb59a5 (
	clk,
	raddr,
	rdata,
	reset,
	waddr,
	wdata,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	output reg [34:0] rdata;
	input wire [0:0] reset;
	input wire [0:0] waddr;
	input wire [34:0] wdata;
	input wire [0:0] wen;
	localparam [0:0] __const__rd_ports_at_up_rf_read = 1'd1;
	localparam [0:0] __const__wr_ports_at_up_rf_write = 1'd1;
	reg [34:0] regs [0:1];
	function automatic [0:0] sv2v_cast_1;
		input reg [0:0] inp;
		sv2v_cast_1 = inp;
	endfunction
	always @(*) begin : up_rf_read
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 1'd0; i < __const__rd_ports_at_up_rf_read; i = i + 1'd1)
				rdata[sv2v_cast_1(i) * 35+:35] = regs[raddr[sv2v_cast_1(i)+:1]];
		end
	end
	always @(posedge clk) begin : up_rf_write
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1'd0; i < __const__wr_ports_at_up_rf_write; i = i + 1'd1)
				if (wen[sv2v_cast_1(i)+:1])
					regs[waddr[sv2v_cast_1(i)+:1]] <= wdata[sv2v_cast_1(i) * 35+:35];
		end
	end
endmodule
module NormalQueueDpathRTL__e10c2d77bcb9538e (
	clk,
	raddr,
	recv_msg,
	reset,
	send_msg,
	waddr,
	wen
);
	input wire [0:0] clk;
	input wire [0:0] raddr;
	input wire [34:0] recv_msg;
	input wire [0:0] reset;
	output wire [34:0] send_msg;
	input wire [0:0] waddr;
	input wire [0:0] wen;
	wire [0:0] rf__clk;
	wire [0:0] rf__raddr;
	wire [34:0] rf__rdata;
	wire [0:0] rf__reset;
	wire [0:0] rf__waddr;
	wire [34:0] rf__wdata;
	wire [0:0] rf__wen;
	RegisterFile__da749a1852bb59a5 rf(
		.clk(rf__clk),
		.raddr(rf__raddr),
		.rdata(rf__rdata),
		.reset(rf__reset),
		.waddr(rf__waddr),
		.wdata(rf__wdata),
		.wen(rf__wen)
	);
	assign rf__clk = clk;
	assign rf__reset = reset;
	assign rf__raddr[0+:1] = raddr;
	assign send_msg = rf__rdata[0+:35];
	assign rf__wen[0+:1] = wen;
	assign rf__waddr[0+:1] = waddr;
	assign rf__wdata[0+:35] = recv_msg;
endmodule
module NormalQueueRTL__e10c2d77bcb9538e (
	clk,
	count,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	output wire [1:0] count;
	input wire [0:0] reset;
	input wire [34:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [34:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] ctrl__clk;
	wire [1:0] ctrl__count;
	wire [0:0] ctrl__raddr;
	wire [0:0] ctrl__recv_rdy;
	wire [0:0] ctrl__recv_val;
	wire [0:0] ctrl__reset;
	wire [0:0] ctrl__send_rdy;
	wire [0:0] ctrl__send_val;
	wire [0:0] ctrl__waddr;
	wire [0:0] ctrl__wen;
	NormalQueueCtrlRTL__num_entries_2 ctrl(
		.clk(ctrl__clk),
		.count(ctrl__count),
		.raddr(ctrl__raddr),
		.recv_rdy(ctrl__recv_rdy),
		.recv_val(ctrl__recv_val),
		.reset(ctrl__reset),
		.send_rdy(ctrl__send_rdy),
		.send_val(ctrl__send_val),
		.waddr(ctrl__waddr),
		.wen(ctrl__wen)
	);
	wire [0:0] dpath__clk;
	wire [0:0] dpath__raddr;
	wire [34:0] dpath__recv_msg;
	wire [0:0] dpath__reset;
	wire [34:0] dpath__send_msg;
	wire [0:0] dpath__waddr;
	wire [0:0] dpath__wen;
	NormalQueueDpathRTL__e10c2d77bcb9538e dpath(
		.clk(dpath__clk),
		.raddr(dpath__raddr),
		.recv_msg(dpath__recv_msg),
		.reset(dpath__reset),
		.send_msg(dpath__send_msg),
		.waddr(dpath__waddr),
		.wen(dpath__wen)
	);
	assign ctrl__clk = clk;
	assign ctrl__reset = reset;
	assign dpath__clk = clk;
	assign dpath__reset = reset;
	assign dpath__wen = ctrl__wen;
	assign dpath__waddr = ctrl__waddr;
	assign dpath__raddr = ctrl__raddr;
	assign ctrl__recv_val = recv__val;
	assign recv__rdy = ctrl__recv_rdy;
	assign dpath__recv_msg = recv__msg;
	assign send__val = ctrl__send_val;
	assign ctrl__send_rdy = send__rdy;
	assign send__msg = dpath__send_msg;
	assign count = ctrl__count;
endmodule
module ChannelRTL__d316842813c529a6 (
	clk,
	reset,
	recv__msg,
	recv__rdy,
	recv__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [34:0] recv__msg;
	output wire [0:0] recv__rdy;
	input wire [0:0] recv__val;
	output wire [34:0] send__msg;
	input wire [0:0] send__rdy;
	output wire [0:0] send__val;
	wire [0:0] queues__clk [0:0];
	wire [1:0] queues__count [0:0];
	wire [0:0] queues__reset [0:0];
	wire [34:0] queues__recv__msg [0:0];
	wire [0:0] queues__recv__rdy [0:0];
	wire [0:0] queues__recv__val [0:0];
	wire [34:0] queues__send__msg [0:0];
	wire [0:0] queues__send__rdy [0:0];
	wire [0:0] queues__send__val [0:0];
	NormalQueueRTL__e10c2d77bcb9538e queues__0(
		.clk(queues__clk[0]),
		.count(queues__count[0]),
		.reset(queues__reset[0]),
		.recv__msg(queues__recv__msg[0]),
		.recv__rdy(queues__recv__rdy[0]),
		.recv__val(queues__recv__val[0]),
		.send__msg(queues__send__msg[0]),
		.send__rdy(queues__send__rdy[0]),
		.send__val(queues__send__val[0])
	);
	assign queues__clk[0] = clk;
	assign queues__reset[0] = reset;
	assign queues__recv__msg[0] = recv__msg;
	assign recv__rdy = queues__recv__rdy[0];
	assign queues__recv__val[0] = recv__val;
	assign send__msg = queues__send__msg[0];
	assign queues__send__rdy[0] = send__rdy;
	assign send__val = queues__send__val[0];
endmodule
module LinkOrRTL__a54ca58e7852ace8 (
	clk,
	reset,
	recv_fu__msg,
	recv_fu__rdy,
	recv_fu__val,
	recv_xbar__msg,
	recv_xbar__rdy,
	recv_xbar__val,
	send__msg,
	send__rdy,
	send__val
);
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [34:0] recv_fu__msg;
	output reg [0:0] recv_fu__rdy;
	input wire [0:0] recv_fu__val;
	input wire [34:0] recv_xbar__msg;
	output reg [0:0] recv_xbar__rdy;
	input wire [0:0] recv_xbar__val;
	output reg [34:0] send__msg;
	input wire [0:0] send__rdy;
	output reg [0:0] send__val;
	always @(*) begin : process
		send__msg = 35'h000000000;
		send__msg[2] = recv_fu__msg[2] | recv_xbar__msg[2];
		send__msg[34-:32] = recv_xbar__msg[34-:32] | recv_fu__msg[34-:32];
		send__val = recv_fu__val | recv_xbar__val;
		recv_fu__rdy = send__rdy;
		recv_xbar__rdy = send__rdy;
	end
endmodule
module TileRTL__80552dd1320c93e4 (
	cgra_id,
	clk,
	reset,
	tile_id,
	from_mem_rdata__msg,
	from_mem_rdata__rdy,
	from_mem_rdata__val,
	recv_data__msg,
	recv_data__rdy,
	recv_data__val,
	recv_from_controller_pkt__msg,
	recv_from_controller_pkt__rdy,
	recv_from_controller_pkt__val,
	send_data__msg,
	send_data__rdy,
	send_data__val,
	send_to_controller_pkt__msg,
	send_to_controller_pkt__rdy,
	send_to_controller_pkt__val,
	to_mem_raddr__msg,
	to_mem_raddr__rdy,
	to_mem_raddr__val,
	to_mem_waddr__msg,
	to_mem_waddr__rdy,
	to_mem_waddr__val,
	to_mem_wdata__msg,
	to_mem_wdata__rdy,
	to_mem_wdata__val
);
	input wire [1:0] cgra_id;
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [2:0] tile_id;
	input wire [34:0] from_mem_rdata__msg;
	output wire [0:0] from_mem_rdata__rdy;
	input wire [0:0] from_mem_rdata__val;
	input wire [139:0] recv_data__msg;
	output wire [3:0] recv_data__rdy;
	input wire [3:0] recv_data__val;
	input wire [198:0] recv_from_controller_pkt__msg;
	output reg [0:0] recv_from_controller_pkt__rdy;
	input wire [0:0] recv_from_controller_pkt__val;
	output wire [139:0] send_data__msg;
	input wire [3:0] send_data__rdy;
	output wire [3:0] send_data__val;
	output reg [198:0] send_to_controller_pkt__msg;
	input wire [0:0] send_to_controller_pkt__rdy;
	output reg [0:0] send_to_controller_pkt__val;
	output wire [6:0] to_mem_raddr__msg;
	input wire [0:0] to_mem_raddr__rdy;
	output wire [0:0] to_mem_raddr__val;
	output wire [6:0] to_mem_waddr__msg;
	input wire [0:0] to_mem_waddr__rdy;
	output wire [0:0] to_mem_waddr__val;
	output wire [34:0] to_mem_wdata__msg;
	input wire [0:0] to_mem_wdata__rdy;
	output wire [0:0] to_mem_wdata__val;
	localparam [1:0] __const__CMD_CONFIG = 2'd3;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_FU = 3'd4;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR = 3'd5;
	localparam [2:0] __const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR = 3'd6;
	localparam [2:0] __const__CMD_CONFIG_TOTAL_CTRL_COUNT = 3'd7;
	localparam [3:0] __const__CMD_CONFIG_COUNT_PER_ITER = 4'd8;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_ADD_RESPONSE = 5'd20;
	localparam [4:0] __const__CMD_GLOBAL_REDUCE_MUL_RESPONSE = 5'd21;
	localparam [0:0] __const__CMD_LAUNCH = 1'd0;
	localparam [4:0] __const__CMD_CONFIG_LOOP_LOWER = 5'd28;
	localparam [4:0] __const__CMD_CONFIG_LOOP_UPPER = 5'd29;
	localparam [4:0] __const__CMD_CONFIG_LOOP_STEP = 5'd30;
	localparam [5:0] __const__CMD_CONFIG_GEP_STRIDE = 6'd43;
	localparam [3:0] __const__CMD_CONST = 4'd13;
	reg [0:0] element_done;
	reg [0:0] fu_crossbar_done;
	reg [0:0] routing_crossbar_done;
	wire [0:0] const_mem__clear;
	wire [0:0] const_mem__clk;
	reg [0:0] const_mem__ctrl_proceed;
	wire [0:0] const_mem__reset;
	reg [34:0] const_mem__recv_const__msg;
	wire [0:0] const_mem__recv_const__rdy;
	reg [0:0] const_mem__recv_const__val;
	wire [34:0] const_mem__send_const__msg;
	wire [0:0] const_mem__send_const__rdy;
	wire [0:0] const_mem__send_const__val;
	ConstQueueDynamicRTL__8f4d11f2dd80f063 const_mem(
		.clear(const_mem__clear),
		.clk(const_mem__clk),
		.ctrl_proceed(const_mem__ctrl_proceed),
		.reset(const_mem__reset),
		.recv_const__msg(const_mem__recv_const__msg),
		.recv_const__rdy(const_mem__recv_const__rdy),
		.recv_const__val(const_mem__recv_const__val),
		.send_const__msg(const_mem__send_const__msg),
		.send_const__rdy(const_mem__send_const__rdy),
		.send_const__val(const_mem__send_const__val)
	);
	wire [1:0] ctrl_mem__cgra_id;
	wire [0:0] ctrl_mem__clk;
	wire [2:0] ctrl_mem__ctrl_addr_outport;
	wire [2:0] ctrl_mem__prologue_count_outport_fu;
	wire [35:0] ctrl_mem__prologue_count_outport_fu_crossbar;
	wire [143:0] ctrl_mem__prologue_count_outport_routing_crossbar;
	wire [0:0] ctrl_mem__reset;
	wire [2:0] ctrl_mem__tile_id;
	wire [173:0] ctrl_mem__recv_from_element__msg;
	wire [0:0] ctrl_mem__recv_from_element__rdy;
	wire [0:0] ctrl_mem__recv_from_element__val;
	reg [198:0] ctrl_mem__recv_pkt_from_controller__msg;
	wire [0:0] ctrl_mem__recv_pkt_from_controller__rdy;
	reg [0:0] ctrl_mem__recv_pkt_from_controller__val;
	wire [122:0] ctrl_mem__send_ctrl__msg;
	reg [0:0] ctrl_mem__send_ctrl__rdy;
	wire [0:0] ctrl_mem__send_ctrl__val;
	wire [198:0] ctrl_mem__send_pkt_to_controller__msg;
	reg [0:0] ctrl_mem__send_pkt_to_controller__rdy;
	wire [0:0] ctrl_mem__send_pkt_to_controller__val;
	wire [173:0] ctrl_mem__send_to_element__msg;
	wire [0:0] ctrl_mem__send_to_element__rdy;
	wire [0:0] ctrl_mem__send_to_element__val;
	CtrlMemDynamicRTL__7531561cc1c156b4 ctrl_mem(
		.cgra_id(ctrl_mem__cgra_id),
		.clk(ctrl_mem__clk),
		.ctrl_addr_outport(ctrl_mem__ctrl_addr_outport),
		.prologue_count_outport_fu(ctrl_mem__prologue_count_outport_fu),
		.prologue_count_outport_fu_crossbar(ctrl_mem__prologue_count_outport_fu_crossbar),
		.prologue_count_outport_routing_crossbar(ctrl_mem__prologue_count_outport_routing_crossbar),
		.reset(ctrl_mem__reset),
		.tile_id(ctrl_mem__tile_id),
		.recv_from_element__msg(ctrl_mem__recv_from_element__msg),
		.recv_from_element__rdy(ctrl_mem__recv_from_element__rdy),
		.recv_from_element__val(ctrl_mem__recv_from_element__val),
		.recv_pkt_from_controller__msg(ctrl_mem__recv_pkt_from_controller__msg),
		.recv_pkt_from_controller__rdy(ctrl_mem__recv_pkt_from_controller__rdy),
		.recv_pkt_from_controller__val(ctrl_mem__recv_pkt_from_controller__val),
		.send_ctrl__msg(ctrl_mem__send_ctrl__msg),
		.send_ctrl__rdy(ctrl_mem__send_ctrl__rdy),
		.send_ctrl__val(ctrl_mem__send_ctrl__val),
		.send_pkt_to_controller__msg(ctrl_mem__send_pkt_to_controller__msg),
		.send_pkt_to_controller__rdy(ctrl_mem__send_pkt_to_controller__rdy),
		.send_pkt_to_controller__val(ctrl_mem__send_pkt_to_controller__val),
		.send_to_element__msg(ctrl_mem__send_to_element__msg),
		.send_to_element__rdy(ctrl_mem__send_to_element__rdy),
		.send_to_element__val(ctrl_mem__send_to_element__val)
	);
	wire [10:0] element__clear;
	wire [0:0] element__clk;
	wire [2:0] element__ctrl_addr_inport;
	wire [2:0] element__prologue_count_inport;
	wire [0:0] element__reset;
	wire [2:0] element__tile_id;
	wire [384:0] element__from_mem_rdata__msg;
	wire [10:0] element__from_mem_rdata__rdy;
	wire [10:0] element__from_mem_rdata__val;
	wire [34:0] element__recv_const__msg;
	wire [0:0] element__recv_const__rdy;
	wire [0:0] element__recv_const__val;
	wire [173:0] element__recv_from_ctrl_mem__msg;
	wire [0:0] element__recv_from_ctrl_mem__rdy;
	wire [0:0] element__recv_from_ctrl_mem__val;
	wire [139:0] element__recv_in__msg;
	wire [3:0] element__recv_in__rdy;
	wire [3:0] element__recv_in__val;
	reg [122:0] element__recv_opt__msg;
	wire [0:0] element__recv_opt__rdy;
	reg [0:0] element__recv_opt__val;
	wire [198:0] element__recv_pkt_from_controller__msg;
	wire [0:0] element__recv_pkt_from_controller__rdy;
	wire [0:0] element__recv_pkt_from_controller__val;
	wire [69:0] element__send_out__msg;
	wire [1:0] element__send_out__rdy;
	wire [1:0] element__send_out__val;
	wire [173:0] element__send_to_ctrl_mem__msg;
	wire [0:0] element__send_to_ctrl_mem__rdy;
	wire [0:0] element__send_to_ctrl_mem__val;
	wire [76:0] element__to_mem_raddr__msg;
	wire [10:0] element__to_mem_raddr__rdy;
	wire [10:0] element__to_mem_raddr__val;
	wire [76:0] element__to_mem_waddr__msg;
	wire [10:0] element__to_mem_waddr__rdy;
	wire [10:0] element__to_mem_waddr__val;
	wire [384:0] element__to_mem_wdata__msg;
	wire [10:0] element__to_mem_wdata__rdy;
	wire [10:0] element__to_mem_wdata__val;
	FlexibleFuRTL__489b9127525b3431 element(
		.clear(element__clear),
		.clk(element__clk),
		.ctrl_addr_inport(element__ctrl_addr_inport),
		.prologue_count_inport(element__prologue_count_inport),
		.reset(element__reset),
		.tile_id(element__tile_id),
		.from_mem_rdata__msg(element__from_mem_rdata__msg),
		.from_mem_rdata__rdy(element__from_mem_rdata__rdy),
		.from_mem_rdata__val(element__from_mem_rdata__val),
		.recv_const__msg(element__recv_const__msg),
		.recv_const__rdy(element__recv_const__rdy),
		.recv_const__val(element__recv_const__val),
		.recv_from_ctrl_mem__msg(element__recv_from_ctrl_mem__msg),
		.recv_from_ctrl_mem__rdy(element__recv_from_ctrl_mem__rdy),
		.recv_from_ctrl_mem__val(element__recv_from_ctrl_mem__val),
		.recv_in__msg(element__recv_in__msg),
		.recv_in__rdy(element__recv_in__rdy),
		.recv_in__val(element__recv_in__val),
		.recv_opt__msg(element__recv_opt__msg),
		.recv_opt__rdy(element__recv_opt__rdy),
		.recv_opt__val(element__recv_opt__val),
		.recv_pkt_from_controller__msg(element__recv_pkt_from_controller__msg),
		.recv_pkt_from_controller__rdy(element__recv_pkt_from_controller__rdy),
		.recv_pkt_from_controller__val(element__recv_pkt_from_controller__val),
		.send_out__msg(element__send_out__msg),
		.send_out__rdy(element__send_out__rdy),
		.send_out__val(element__send_out__val),
		.send_to_ctrl_mem__msg(element__send_to_ctrl_mem__msg),
		.send_to_ctrl_mem__rdy(element__send_to_ctrl_mem__rdy),
		.send_to_ctrl_mem__val(element__send_to_ctrl_mem__val),
		.to_mem_raddr__msg(element__to_mem_raddr__msg),
		.to_mem_raddr__rdy(element__to_mem_raddr__rdy),
		.to_mem_raddr__val(element__to_mem_raddr__val),
		.to_mem_waddr__msg(element__to_mem_waddr__msg),
		.to_mem_waddr__rdy(element__to_mem_waddr__rdy),
		.to_mem_waddr__val(element__to_mem_waddr__val),
		.to_mem_wdata__msg(element__to_mem_wdata__msg),
		.to_mem_wdata__rdy(element__to_mem_wdata__rdy),
		.to_mem_wdata__val(element__to_mem_wdata__val)
	);
	wire [1:0] fu_crossbar__cgra_id;
	wire [0:0] fu_crossbar__clear;
	wire [0:0] fu_crossbar__clk;
	reg [0:0] fu_crossbar__compute_done;
	wire [0:0] fu_crossbar__crossbar_id;
	wire [15:0] fu_crossbar__crossbar_outport;
	wire [2:0] fu_crossbar__ctrl_addr_inport;
	wire [35:0] fu_crossbar__prologue_count_inport;
	wire [0:0] fu_crossbar__reset;
	wire [2:0] fu_crossbar__tile_id;
	wire [69:0] fu_crossbar__recv_data__msg;
	wire [1:0] fu_crossbar__recv_data__rdy;
	wire [1:0] fu_crossbar__recv_data__val;
	reg [122:0] fu_crossbar__recv_opt__msg;
	wire [0:0] fu_crossbar__recv_opt__rdy;
	reg [0:0] fu_crossbar__recv_opt__val;
	wire [279:0] fu_crossbar__send_data__msg;
	wire [7:0] fu_crossbar__send_data__rdy;
	wire [7:0] fu_crossbar__send_data__val;
	CrossbarRTL__35a0feee61c1221d fu_crossbar(
		.cgra_id(fu_crossbar__cgra_id),
		.clear(fu_crossbar__clear),
		.clk(fu_crossbar__clk),
		.compute_done(fu_crossbar__compute_done),
		.crossbar_id(fu_crossbar__crossbar_id),
		.crossbar_outport(fu_crossbar__crossbar_outport),
		.ctrl_addr_inport(fu_crossbar__ctrl_addr_inport),
		.prologue_count_inport(fu_crossbar__prologue_count_inport),
		.reset(fu_crossbar__reset),
		.tile_id(fu_crossbar__tile_id),
		.recv_data__msg(fu_crossbar__recv_data__msg),
		.recv_data__rdy(fu_crossbar__recv_data__rdy),
		.recv_data__val(fu_crossbar__recv_data__val),
		.recv_opt__msg(fu_crossbar__recv_opt__msg),
		.recv_opt__rdy(fu_crossbar__recv_opt__rdy),
		.recv_opt__val(fu_crossbar__recv_opt__val),
		.send_data__msg(fu_crossbar__send_data__msg),
		.send_data__rdy(fu_crossbar__send_data__rdy),
		.send_data__val(fu_crossbar__send_data__val)
	);
	wire [0:0] register_cluster__clear;
	wire [0:0] register_cluster__clk;
	reg [0:0] register_cluster__inport_ctrl_proceed;
	wire [122:0] register_cluster__inport_opt;
	wire [0:0] register_cluster__reset;
	wire [139:0] register_cluster__recv_data_from_const__msg;
	wire [3:0] register_cluster__recv_data_from_const__rdy;
	wire [3:0] register_cluster__recv_data_from_const__val;
	wire [139:0] register_cluster__recv_data_from_fu_crossbar__msg;
	wire [3:0] register_cluster__recv_data_from_fu_crossbar__rdy;
	wire [3:0] register_cluster__recv_data_from_fu_crossbar__val;
	wire [139:0] register_cluster__recv_data_from_routing_crossbar__msg;
	wire [3:0] register_cluster__recv_data_from_routing_crossbar__rdy;
	wire [3:0] register_cluster__recv_data_from_routing_crossbar__val;
	wire [139:0] register_cluster__send_data_to_fu__msg;
	wire [3:0] register_cluster__send_data_to_fu__rdy;
	wire [3:0] register_cluster__send_data_to_fu__val;
	wire [139:0] register_cluster__send_data_to_routing_crossbar__msg;
	wire [3:0] register_cluster__send_data_to_routing_crossbar__rdy;
	wire [3:0] register_cluster__send_data_to_routing_crossbar__val;
	RegisterClusterRTL__9b64e99d13e3878e register_cluster(
		.clear(register_cluster__clear),
		.clk(register_cluster__clk),
		.inport_ctrl_proceed(register_cluster__inport_ctrl_proceed),
		.inport_opt(register_cluster__inport_opt),
		.reset(register_cluster__reset),
		.recv_data_from_const__msg(register_cluster__recv_data_from_const__msg),
		.recv_data_from_const__rdy(register_cluster__recv_data_from_const__rdy),
		.recv_data_from_const__val(register_cluster__recv_data_from_const__val),
		.recv_data_from_fu_crossbar__msg(register_cluster__recv_data_from_fu_crossbar__msg),
		.recv_data_from_fu_crossbar__rdy(register_cluster__recv_data_from_fu_crossbar__rdy),
		.recv_data_from_fu_crossbar__val(register_cluster__recv_data_from_fu_crossbar__val),
		.recv_data_from_routing_crossbar__msg(register_cluster__recv_data_from_routing_crossbar__msg),
		.recv_data_from_routing_crossbar__rdy(register_cluster__recv_data_from_routing_crossbar__rdy),
		.recv_data_from_routing_crossbar__val(register_cluster__recv_data_from_routing_crossbar__val),
		.send_data_to_fu__msg(register_cluster__send_data_to_fu__msg),
		.send_data_to_fu__rdy(register_cluster__send_data_to_fu__rdy),
		.send_data_to_fu__val(register_cluster__send_data_to_fu__val),
		.send_data_to_routing_crossbar__msg(register_cluster__send_data_to_routing_crossbar__msg),
		.send_data_to_routing_crossbar__rdy(register_cluster__send_data_to_routing_crossbar__rdy),
		.send_data_to_routing_crossbar__val(register_cluster__send_data_to_routing_crossbar__val)
	);
	wire [1:0] routing_crossbar__cgra_id;
	wire [0:0] routing_crossbar__clear;
	wire [0:0] routing_crossbar__clk;
	reg [0:0] routing_crossbar__compute_done;
	wire [0:0] routing_crossbar__crossbar_id;
	wire [31:0] routing_crossbar__crossbar_outport;
	wire [2:0] routing_crossbar__ctrl_addr_inport;
	wire [143:0] routing_crossbar__prologue_count_inport;
	wire [0:0] routing_crossbar__reset;
	wire [2:0] routing_crossbar__tile_id;
	wire [279:0] routing_crossbar__recv_data__msg;
	wire [7:0] routing_crossbar__recv_data__rdy;
	wire [7:0] routing_crossbar__recv_data__val;
	reg [122:0] routing_crossbar__recv_opt__msg;
	wire [0:0] routing_crossbar__recv_opt__rdy;
	reg [0:0] routing_crossbar__recv_opt__val;
	wire [279:0] routing_crossbar__send_data__msg;
	wire [7:0] routing_crossbar__send_data__rdy;
	wire [7:0] routing_crossbar__send_data__val;
	CrossbarRTL__daed722bd45da2f6 routing_crossbar(
		.cgra_id(routing_crossbar__cgra_id),
		.clear(routing_crossbar__clear),
		.clk(routing_crossbar__clk),
		.compute_done(routing_crossbar__compute_done),
		.crossbar_id(routing_crossbar__crossbar_id),
		.crossbar_outport(routing_crossbar__crossbar_outport),
		.ctrl_addr_inport(routing_crossbar__ctrl_addr_inport),
		.prologue_count_inport(routing_crossbar__prologue_count_inport),
		.reset(routing_crossbar__reset),
		.tile_id(routing_crossbar__tile_id),
		.recv_data__msg(routing_crossbar__recv_data__msg),
		.recv_data__rdy(routing_crossbar__recv_data__rdy),
		.recv_data__val(routing_crossbar__recv_data__val),
		.recv_opt__msg(routing_crossbar__recv_opt__msg),
		.recv_opt__rdy(routing_crossbar__recv_opt__rdy),
		.recv_opt__val(routing_crossbar__recv_opt__val),
		.send_data__msg(routing_crossbar__send_data__msg),
		.send_data__rdy(routing_crossbar__send_data__rdy),
		.send_data__val(routing_crossbar__send_data__val)
	);
	wire [0:0] tile_in_channel__clk [0:3];
	wire [0:0] tile_in_channel__reset [0:3];
	wire [34:0] tile_in_channel__recv__msg [0:3];
	wire [0:0] tile_in_channel__recv__rdy [0:3];
	wire [0:0] tile_in_channel__recv__val [0:3];
	wire [34:0] tile_in_channel__send__msg [0:3];
	wire [0:0] tile_in_channel__send__rdy [0:3];
	wire [0:0] tile_in_channel__send__val [0:3];
	ChannelRTL__d316842813c529a6 tile_in_channel__0(
		.clk(tile_in_channel__clk[0]),
		.reset(tile_in_channel__reset[0]),
		.recv__msg(tile_in_channel__recv__msg[0]),
		.recv__rdy(tile_in_channel__recv__rdy[0]),
		.recv__val(tile_in_channel__recv__val[0]),
		.send__msg(tile_in_channel__send__msg[0]),
		.send__rdy(tile_in_channel__send__rdy[0]),
		.send__val(tile_in_channel__send__val[0])
	);
	ChannelRTL__d316842813c529a6 tile_in_channel__1(
		.clk(tile_in_channel__clk[1]),
		.reset(tile_in_channel__reset[1]),
		.recv__msg(tile_in_channel__recv__msg[1]),
		.recv__rdy(tile_in_channel__recv__rdy[1]),
		.recv__val(tile_in_channel__recv__val[1]),
		.send__msg(tile_in_channel__send__msg[1]),
		.send__rdy(tile_in_channel__send__rdy[1]),
		.send__val(tile_in_channel__send__val[1])
	);
	ChannelRTL__d316842813c529a6 tile_in_channel__2(
		.clk(tile_in_channel__clk[2]),
		.reset(tile_in_channel__reset[2]),
		.recv__msg(tile_in_channel__recv__msg[2]),
		.recv__rdy(tile_in_channel__recv__rdy[2]),
		.recv__val(tile_in_channel__recv__val[2]),
		.send__msg(tile_in_channel__send__msg[2]),
		.send__rdy(tile_in_channel__send__rdy[2]),
		.send__val(tile_in_channel__send__val[2])
	);
	ChannelRTL__d316842813c529a6 tile_in_channel__3(
		.clk(tile_in_channel__clk[3]),
		.reset(tile_in_channel__reset[3]),
		.recv__msg(tile_in_channel__recv__msg[3]),
		.recv__rdy(tile_in_channel__recv__rdy[3]),
		.recv__val(tile_in_channel__recv__val[3]),
		.send__msg(tile_in_channel__send__msg[3]),
		.send__rdy(tile_in_channel__send__rdy[3]),
		.send__val(tile_in_channel__send__val[3])
	);
	wire [0:0] tile_out_or_link__clk [0:3];
	wire [0:0] tile_out_or_link__reset [0:3];
	wire [34:0] tile_out_or_link__recv_fu__msg [0:3];
	wire [0:0] tile_out_or_link__recv_fu__rdy [0:3];
	wire [0:0] tile_out_or_link__recv_fu__val [0:3];
	wire [34:0] tile_out_or_link__recv_xbar__msg [0:3];
	wire [0:0] tile_out_or_link__recv_xbar__rdy [0:3];
	wire [0:0] tile_out_or_link__recv_xbar__val [0:3];
	wire [34:0] tile_out_or_link__send__msg [0:3];
	wire [0:0] tile_out_or_link__send__rdy [0:3];
	wire [0:0] tile_out_or_link__send__val [0:3];
	LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__0(
		.clk(tile_out_or_link__clk[0]),
		.reset(tile_out_or_link__reset[0]),
		.recv_fu__msg(tile_out_or_link__recv_fu__msg[0]),
		.recv_fu__rdy(tile_out_or_link__recv_fu__rdy[0]),
		.recv_fu__val(tile_out_or_link__recv_fu__val[0]),
		.recv_xbar__msg(tile_out_or_link__recv_xbar__msg[0]),
		.recv_xbar__rdy(tile_out_or_link__recv_xbar__rdy[0]),
		.recv_xbar__val(tile_out_or_link__recv_xbar__val[0]),
		.send__msg(tile_out_or_link__send__msg[0]),
		.send__rdy(tile_out_or_link__send__rdy[0]),
		.send__val(tile_out_or_link__send__val[0])
	);
	LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__1(
		.clk(tile_out_or_link__clk[1]),
		.reset(tile_out_or_link__reset[1]),
		.recv_fu__msg(tile_out_or_link__recv_fu__msg[1]),
		.recv_fu__rdy(tile_out_or_link__recv_fu__rdy[1]),
		.recv_fu__val(tile_out_or_link__recv_fu__val[1]),
		.recv_xbar__msg(tile_out_or_link__recv_xbar__msg[1]),
		.recv_xbar__rdy(tile_out_or_link__recv_xbar__rdy[1]),
		.recv_xbar__val(tile_out_or_link__recv_xbar__val[1]),
		.send__msg(tile_out_or_link__send__msg[1]),
		.send__rdy(tile_out_or_link__send__rdy[1]),
		.send__val(tile_out_or_link__send__val[1])
	);
	LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__2(
		.clk(tile_out_or_link__clk[2]),
		.reset(tile_out_or_link__reset[2]),
		.recv_fu__msg(tile_out_or_link__recv_fu__msg[2]),
		.recv_fu__rdy(tile_out_or_link__recv_fu__rdy[2]),
		.recv_fu__val(tile_out_or_link__recv_fu__val[2]),
		.recv_xbar__msg(tile_out_or_link__recv_xbar__msg[2]),
		.recv_xbar__rdy(tile_out_or_link__recv_xbar__rdy[2]),
		.recv_xbar__val(tile_out_or_link__recv_xbar__val[2]),
		.send__msg(tile_out_or_link__send__msg[2]),
		.send__rdy(tile_out_or_link__send__rdy[2]),
		.send__val(tile_out_or_link__send__val[2])
	);
	LinkOrRTL__a54ca58e7852ace8 tile_out_or_link__3(
		.clk(tile_out_or_link__clk[3]),
		.reset(tile_out_or_link__reset[3]),
		.recv_fu__msg(tile_out_or_link__recv_fu__msg[3]),
		.recv_fu__rdy(tile_out_or_link__recv_fu__rdy[3]),
		.recv_fu__val(tile_out_or_link__recv_fu__val[3]),
		.recv_xbar__msg(tile_out_or_link__recv_xbar__msg[3]),
		.recv_xbar__rdy(tile_out_or_link__recv_xbar__rdy[3]),
		.recv_xbar__val(tile_out_or_link__recv_xbar__val[3]),
		.send__msg(tile_out_or_link__send__msg[3]),
		.send__rdy(tile_out_or_link__send__rdy[3]),
		.send__val(tile_out_or_link__send__val[3])
	);
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin : feed_pkt
		ctrl_mem__recv_pkt_from_controller__msg = 199'h00000000000000000000000000000000000000000000000000;
		const_mem__recv_const__msg = 35'h000000000;
		ctrl_mem__recv_pkt_from_controller__val = 1'd0;
		const_mem__recv_const__val = 1'd0;
		recv_from_controller_pkt__rdy = 1'd0;
		if (recv_from_controller_pkt__val & (((((((((((((recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG)) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_FU_CROSSBAR))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_PROLOGUE_ROUTING_CROSSBAR))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_TOTAL_CTRL_COUNT))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_COUNT_PER_ITER))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_ADD_RESPONSE))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_GLOBAL_REDUCE_MUL_RESPONSE))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_LAUNCH))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_LOWER))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_UPPER))) | (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONFIG_LOOP_STEP))) | (recv_from_controller_pkt__msg[173-:6] == __const__CMD_CONFIG_GEP_STRIDE))) begin
			ctrl_mem__recv_pkt_from_controller__val = 1'd1;
			ctrl_mem__recv_pkt_from_controller__msg = recv_from_controller_pkt__msg;
			recv_from_controller_pkt__rdy = ctrl_mem__recv_pkt_from_controller__rdy;
		end
		else if (recv_from_controller_pkt__val & (recv_from_controller_pkt__msg[173-:6] == sv2v_cast_6(__const__CMD_CONST))) begin
			const_mem__recv_const__val = 1'd1;
			const_mem__recv_const__msg = recv_from_controller_pkt__msg[167-:35];
			recv_from_controller_pkt__rdy = const_mem__recv_const__rdy;
		end
	end
	always @(*) begin : notify_const_mem
		const_mem__ctrl_proceed = ctrl_mem__send_ctrl__rdy & ctrl_mem__send_ctrl__val;
		register_cluster__inport_ctrl_proceed = ctrl_mem__send_ctrl__rdy & ctrl_mem__send_ctrl__val;
	end
	always @(*) begin : notify_crossbars_compute_status
		routing_crossbar__compute_done = element_done;
		fu_crossbar__compute_done = element_done;
	end
	always @(*) begin : update_opt
		element__recv_opt__msg = ctrl_mem__send_ctrl__msg;
		routing_crossbar__recv_opt__msg = ctrl_mem__send_ctrl__msg;
		fu_crossbar__recv_opt__msg = ctrl_mem__send_ctrl__msg;
		element__recv_opt__val = ctrl_mem__send_ctrl__val & ~element_done;
		routing_crossbar__recv_opt__val = ctrl_mem__send_ctrl__val & ~routing_crossbar_done;
		fu_crossbar__recv_opt__val = ctrl_mem__send_ctrl__val & ~fu_crossbar_done;
		ctrl_mem__send_ctrl__rdy = ((element__recv_opt__rdy | element_done) & (routing_crossbar__recv_opt__rdy | routing_crossbar_done)) & (fu_crossbar__recv_opt__rdy | fu_crossbar_done);
	end
	always @(*) begin : update_send_out_signal
		send_to_controller_pkt__val = 1'd0;
		send_to_controller_pkt__msg = 199'h00000000000000000000000000000000000000000000000000;
		if (ctrl_mem__send_pkt_to_controller__val) begin
			send_to_controller_pkt__val = 1'd1;
			send_to_controller_pkt__msg = ctrl_mem__send_pkt_to_controller__msg;
		end
		ctrl_mem__send_pkt_to_controller__rdy = send_to_controller_pkt__rdy;
	end
	always @(posedge clk) begin : already_done
		if (reset | ctrl_mem__send_ctrl__rdy) begin
			element_done <= 1'd0;
			fu_crossbar_done <= 1'd0;
			routing_crossbar_done <= 1'd0;
		end
		else begin
			if (element__recv_opt__rdy)
				element_done <= 1'd1;
			if (fu_crossbar__recv_opt__rdy)
				fu_crossbar_done <= 1'd1;
			if (routing_crossbar__recv_opt__rdy)
				routing_crossbar_done <= 1'd1;
		end
	end
	assign element__clk = clk;
	assign element__reset = reset;
	assign const_mem__clk = clk;
	assign const_mem__reset = reset;
	assign routing_crossbar__clk = clk;
	assign routing_crossbar__reset = reset;
	assign fu_crossbar__clk = clk;
	assign fu_crossbar__reset = reset;
	assign register_cluster__clk = clk;
	assign register_cluster__reset = reset;
	assign ctrl_mem__clk = clk;
	assign ctrl_mem__reset = reset;
	assign tile_in_channel__clk[0] = clk;
	assign tile_in_channel__reset[0] = reset;
	assign tile_in_channel__clk[1] = clk;
	assign tile_in_channel__reset[1] = reset;
	assign tile_in_channel__clk[2] = clk;
	assign tile_in_channel__reset[2] = reset;
	assign tile_in_channel__clk[3] = clk;
	assign tile_in_channel__reset[3] = reset;
	assign tile_out_or_link__clk[0] = clk;
	assign tile_out_or_link__reset[0] = reset;
	assign tile_out_or_link__clk[1] = clk;
	assign tile_out_or_link__reset[1] = reset;
	assign tile_out_or_link__clk[2] = clk;
	assign tile_out_or_link__reset[2] = reset;
	assign tile_out_or_link__clk[3] = clk;
	assign tile_out_or_link__reset[3] = reset;
	assign element__tile_id = tile_id;
	assign ctrl_mem__cgra_id = cgra_id;
	assign ctrl_mem__tile_id = tile_id;
	assign fu_crossbar__cgra_id = cgra_id;
	assign fu_crossbar__tile_id = tile_id;
	assign routing_crossbar__cgra_id = cgra_id;
	assign routing_crossbar__tile_id = tile_id;
	assign routing_crossbar__crossbar_id = 1'd0;
	assign fu_crossbar__crossbar_id = 1'd1;
	assign element__recv_const__msg = const_mem__send_const__msg;
	assign const_mem__send_const__rdy = element__recv_const__rdy;
	assign element__recv_const__val = const_mem__send_const__val;
	assign ctrl_mem__recv_from_element__msg = element__send_to_ctrl_mem__msg;
	assign element__send_to_ctrl_mem__rdy = ctrl_mem__recv_from_element__rdy;
	assign ctrl_mem__recv_from_element__val = element__send_to_ctrl_mem__val;
	assign element__recv_from_ctrl_mem__msg = ctrl_mem__send_to_element__msg;
	assign ctrl_mem__send_to_element__rdy = element__recv_from_ctrl_mem__rdy;
	assign element__recv_from_ctrl_mem__val = ctrl_mem__send_to_element__val;
	assign routing_crossbar__ctrl_addr_inport = ctrl_mem__ctrl_addr_outport;
	assign fu_crossbar__ctrl_addr_inport = ctrl_mem__ctrl_addr_outport;
	assign element__ctrl_addr_inport = ctrl_mem__ctrl_addr_outport;
	assign element__prologue_count_inport = ctrl_mem__prologue_count_outport_fu;
	assign routing_crossbar__prologue_count_inport[141+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[141+:3];
	assign routing_crossbar__prologue_count_inport[138+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[138+:3];
	assign routing_crossbar__prologue_count_inport[135+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[135+:3];
	assign routing_crossbar__prologue_count_inport[132+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[132+:3];
	assign routing_crossbar__prologue_count_inport[129+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[129+:3];
	assign routing_crossbar__prologue_count_inport[126+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[126+:3];
	assign routing_crossbar__prologue_count_inport[123+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[123+:3];
	assign routing_crossbar__prologue_count_inport[120+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[120+:3];
	assign fu_crossbar__prologue_count_inport[33+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[33+:3];
	assign fu_crossbar__prologue_count_inport[30+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[30+:3];
	assign routing_crossbar__prologue_count_inport[117+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[117+:3];
	assign routing_crossbar__prologue_count_inport[114+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[114+:3];
	assign routing_crossbar__prologue_count_inport[111+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[111+:3];
	assign routing_crossbar__prologue_count_inport[108+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[108+:3];
	assign routing_crossbar__prologue_count_inport[105+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[105+:3];
	assign routing_crossbar__prologue_count_inport[102+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[102+:3];
	assign routing_crossbar__prologue_count_inport[99+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[99+:3];
	assign routing_crossbar__prologue_count_inport[96+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[96+:3];
	assign fu_crossbar__prologue_count_inport[27+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[27+:3];
	assign fu_crossbar__prologue_count_inport[24+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[24+:3];
	assign routing_crossbar__prologue_count_inport[93+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[93+:3];
	assign routing_crossbar__prologue_count_inport[90+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[90+:3];
	assign routing_crossbar__prologue_count_inport[87+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[87+:3];
	assign routing_crossbar__prologue_count_inport[84+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[84+:3];
	assign routing_crossbar__prologue_count_inport[81+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[81+:3];
	assign routing_crossbar__prologue_count_inport[78+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[78+:3];
	assign routing_crossbar__prologue_count_inport[75+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[75+:3];
	assign routing_crossbar__prologue_count_inport[72+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[72+:3];
	assign fu_crossbar__prologue_count_inport[21+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[21+:3];
	assign fu_crossbar__prologue_count_inport[18+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[18+:3];
	assign routing_crossbar__prologue_count_inport[69+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[69+:3];
	assign routing_crossbar__prologue_count_inport[66+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[66+:3];
	assign routing_crossbar__prologue_count_inport[63+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[63+:3];
	assign routing_crossbar__prologue_count_inport[60+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[60+:3];
	assign routing_crossbar__prologue_count_inport[57+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[57+:3];
	assign routing_crossbar__prologue_count_inport[54+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[54+:3];
	assign routing_crossbar__prologue_count_inport[51+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[51+:3];
	assign routing_crossbar__prologue_count_inport[48+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[48+:3];
	assign fu_crossbar__prologue_count_inport[15+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[15+:3];
	assign fu_crossbar__prologue_count_inport[12+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[12+:3];
	assign routing_crossbar__prologue_count_inport[45+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[45+:3];
	assign routing_crossbar__prologue_count_inport[42+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[42+:3];
	assign routing_crossbar__prologue_count_inport[39+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[39+:3];
	assign routing_crossbar__prologue_count_inport[36+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[36+:3];
	assign routing_crossbar__prologue_count_inport[33+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[33+:3];
	assign routing_crossbar__prologue_count_inport[30+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[30+:3];
	assign routing_crossbar__prologue_count_inport[27+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[27+:3];
	assign routing_crossbar__prologue_count_inport[24+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[24+:3];
	assign fu_crossbar__prologue_count_inport[9+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[9+:3];
	assign fu_crossbar__prologue_count_inport[6+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[6+:3];
	assign routing_crossbar__prologue_count_inport[21+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[21+:3];
	assign routing_crossbar__prologue_count_inport[18+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[18+:3];
	assign routing_crossbar__prologue_count_inport[15+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[15+:3];
	assign routing_crossbar__prologue_count_inport[12+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[12+:3];
	assign routing_crossbar__prologue_count_inport[9+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[9+:3];
	assign routing_crossbar__prologue_count_inport[6+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[6+:3];
	assign routing_crossbar__prologue_count_inport[3+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[3+:3];
	assign routing_crossbar__prologue_count_inport[0+:3] = ctrl_mem__prologue_count_outport_routing_crossbar[0+:3];
	assign fu_crossbar__prologue_count_inport[3+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[3+:3];
	assign fu_crossbar__prologue_count_inport[0+:3] = ctrl_mem__prologue_count_outport_fu_crossbar[0+:3];
	assign element__to_mem_raddr__rdy[10+:1] = 1'd0;
	assign element__from_mem_rdata__val[10+:1] = 1'd0;
	assign element__from_mem_rdata__msg[350+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[10+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[10+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[9+:1] = 1'd0;
	assign element__from_mem_rdata__val[9+:1] = 1'd0;
	assign element__from_mem_rdata__msg[315+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[9+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[9+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[8+:1] = 1'd0;
	assign element__from_mem_rdata__val[8+:1] = 1'd0;
	assign element__from_mem_rdata__msg[280+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[8+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[8+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[7+:1] = 1'd0;
	assign element__from_mem_rdata__val[7+:1] = 1'd0;
	assign element__from_mem_rdata__msg[245+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[7+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[7+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[6+:1] = 1'd0;
	assign element__from_mem_rdata__val[6+:1] = 1'd0;
	assign element__from_mem_rdata__msg[210+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[6+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[6+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[5+:1] = 1'd0;
	assign element__from_mem_rdata__val[5+:1] = 1'd0;
	assign element__from_mem_rdata__msg[175+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[5+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[5+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[4+:1] = 1'd0;
	assign element__from_mem_rdata__val[4+:1] = 1'd0;
	assign element__from_mem_rdata__msg[140+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[4+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[4+:1] = 1'd0;
	assign to_mem_raddr__msg = element__to_mem_raddr__msg[21+:7];
	assign element__to_mem_raddr__rdy[3+:1] = to_mem_raddr__rdy;
	assign to_mem_raddr__val = element__to_mem_raddr__val[3+:1];
	assign element__from_mem_rdata__msg[105+:35] = from_mem_rdata__msg;
	assign from_mem_rdata__rdy = element__from_mem_rdata__rdy[3+:1];
	assign element__from_mem_rdata__val[3+:1] = from_mem_rdata__val;
	assign to_mem_waddr__msg = element__to_mem_waddr__msg[21+:7];
	assign element__to_mem_waddr__rdy[3+:1] = to_mem_waddr__rdy;
	assign to_mem_waddr__val = element__to_mem_waddr__val[3+:1];
	assign to_mem_wdata__msg = element__to_mem_wdata__msg[105+:35];
	assign element__to_mem_wdata__rdy[3+:1] = to_mem_wdata__rdy;
	assign to_mem_wdata__val = element__to_mem_wdata__val[3+:1];
	assign element__to_mem_raddr__rdy[2+:1] = 1'd0;
	assign element__from_mem_rdata__val[2+:1] = 1'd0;
	assign element__from_mem_rdata__msg[70+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[2+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[2+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[1+:1] = 1'd0;
	assign element__from_mem_rdata__val[1+:1] = 1'd0;
	assign element__from_mem_rdata__msg[35+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[1+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[1+:1] = 1'd0;
	assign element__to_mem_raddr__rdy[0+:1] = 1'd0;
	assign element__from_mem_rdata__val[0+:1] = 1'd0;
	assign element__from_mem_rdata__msg[0+:35] = 35'h000000000;
	assign element__to_mem_waddr__rdy[0+:1] = 1'd0;
	assign element__to_mem_wdata__rdy[0+:1] = 1'd0;
	assign tile_in_channel__recv__msg[0] = recv_data__msg[105+:35];
	assign recv_data__rdy[3+:1] = tile_in_channel__recv__rdy[0];
	assign tile_in_channel__recv__val[0] = recv_data__val[3+:1];
	assign routing_crossbar__recv_data__msg[245+:35] = tile_in_channel__send__msg[0];
	assign tile_in_channel__send__rdy[0] = routing_crossbar__recv_data__rdy[7+:1];
	assign routing_crossbar__recv_data__val[7+:1] = tile_in_channel__send__val[0];
	assign tile_in_channel__recv__msg[1] = recv_data__msg[70+:35];
	assign recv_data__rdy[2+:1] = tile_in_channel__recv__rdy[1];
	assign tile_in_channel__recv__val[1] = recv_data__val[2+:1];
	assign routing_crossbar__recv_data__msg[210+:35] = tile_in_channel__send__msg[1];
	assign tile_in_channel__send__rdy[1] = routing_crossbar__recv_data__rdy[6+:1];
	assign routing_crossbar__recv_data__val[6+:1] = tile_in_channel__send__val[1];
	assign tile_in_channel__recv__msg[2] = recv_data__msg[35+:35];
	assign recv_data__rdy[1+:1] = tile_in_channel__recv__rdy[2];
	assign tile_in_channel__recv__val[2] = recv_data__val[1+:1];
	assign routing_crossbar__recv_data__msg[175+:35] = tile_in_channel__send__msg[2];
	assign tile_in_channel__send__rdy[2] = routing_crossbar__recv_data__rdy[5+:1];
	assign routing_crossbar__recv_data__val[5+:1] = tile_in_channel__send__val[2];
	assign tile_in_channel__recv__msg[3] = recv_data__msg[0+:35];
	assign recv_data__rdy[0+:1] = tile_in_channel__recv__rdy[3];
	assign tile_in_channel__recv__val[3] = recv_data__val[0+:1];
	assign routing_crossbar__recv_data__msg[140+:35] = tile_in_channel__send__msg[3];
	assign tile_in_channel__send__rdy[3] = routing_crossbar__recv_data__rdy[4+:1];
	assign routing_crossbar__recv_data__val[4+:1] = tile_in_channel__send__val[3];
	assign routing_crossbar__recv_data__msg[105+:35] = register_cluster__send_data_to_routing_crossbar__msg[105+:35];
	assign register_cluster__send_data_to_routing_crossbar__rdy[3+:1] = routing_crossbar__recv_data__rdy[3+:1];
	assign routing_crossbar__recv_data__val[3+:1] = register_cluster__send_data_to_routing_crossbar__val[3+:1];
	assign routing_crossbar__recv_data__msg[70+:35] = register_cluster__send_data_to_routing_crossbar__msg[70+:35];
	assign register_cluster__send_data_to_routing_crossbar__rdy[2+:1] = routing_crossbar__recv_data__rdy[2+:1];
	assign routing_crossbar__recv_data__val[2+:1] = register_cluster__send_data_to_routing_crossbar__val[2+:1];
	assign routing_crossbar__recv_data__msg[35+:35] = register_cluster__send_data_to_routing_crossbar__msg[35+:35];
	assign register_cluster__send_data_to_routing_crossbar__rdy[1+:1] = routing_crossbar__recv_data__rdy[1+:1];
	assign routing_crossbar__recv_data__val[1+:1] = register_cluster__send_data_to_routing_crossbar__val[1+:1];
	assign routing_crossbar__recv_data__msg[0+:35] = register_cluster__send_data_to_routing_crossbar__msg[0+:35];
	assign register_cluster__send_data_to_routing_crossbar__rdy[0+:1] = routing_crossbar__recv_data__rdy[0+:1];
	assign routing_crossbar__recv_data__val[0+:1] = register_cluster__send_data_to_routing_crossbar__val[0+:1];
	assign routing_crossbar__crossbar_outport[28+:4] = ctrl_mem__send_ctrl__msg[72+:4];
	assign fu_crossbar__crossbar_outport[14+:2] = ctrl_mem__send_ctrl__msg[56+:2];
	assign routing_crossbar__crossbar_outport[24+:4] = ctrl_mem__send_ctrl__msg[76+:4];
	assign fu_crossbar__crossbar_outport[12+:2] = ctrl_mem__send_ctrl__msg[58+:2];
	assign routing_crossbar__crossbar_outport[20+:4] = ctrl_mem__send_ctrl__msg[80+:4];
	assign fu_crossbar__crossbar_outport[10+:2] = ctrl_mem__send_ctrl__msg[60+:2];
	assign routing_crossbar__crossbar_outport[16+:4] = ctrl_mem__send_ctrl__msg[84+:4];
	assign fu_crossbar__crossbar_outport[8+:2] = ctrl_mem__send_ctrl__msg[62+:2];
	assign routing_crossbar__crossbar_outport[12+:4] = ctrl_mem__send_ctrl__msg[88+:4];
	assign fu_crossbar__crossbar_outport[6+:2] = ctrl_mem__send_ctrl__msg[64+:2];
	assign routing_crossbar__crossbar_outport[8+:4] = ctrl_mem__send_ctrl__msg[92+:4];
	assign fu_crossbar__crossbar_outport[4+:2] = ctrl_mem__send_ctrl__msg[66+:2];
	assign routing_crossbar__crossbar_outport[4+:4] = ctrl_mem__send_ctrl__msg[96+:4];
	assign fu_crossbar__crossbar_outport[2+:2] = ctrl_mem__send_ctrl__msg[68+:2];
	assign routing_crossbar__crossbar_outport[0+:4] = ctrl_mem__send_ctrl__msg[100+:4];
	assign fu_crossbar__crossbar_outport[0+:2] = ctrl_mem__send_ctrl__msg[70+:2];
	assign fu_crossbar__recv_data__msg[35+:35] = element__send_out__msg[35+:35];
	assign element__send_out__rdy[1+:1] = fu_crossbar__recv_data__rdy[1+:1];
	assign fu_crossbar__recv_data__val[1+:1] = element__send_out__val[1+:1];
	assign fu_crossbar__recv_data__msg[0+:35] = element__send_out__msg[0+:35];
	assign element__send_out__rdy[0+:1] = fu_crossbar__recv_data__rdy[0+:1];
	assign fu_crossbar__recv_data__val[0+:1] = element__send_out__val[0+:1];
	assign tile_out_or_link__recv_fu__msg[0] = fu_crossbar__send_data__msg[245+:35];
	assign fu_crossbar__send_data__rdy[7+:1] = tile_out_or_link__recv_fu__rdy[0];
	assign tile_out_or_link__recv_fu__val[0] = fu_crossbar__send_data__val[7+:1];
	assign tile_out_or_link__recv_xbar__msg[0] = routing_crossbar__send_data__msg[245+:35];
	assign routing_crossbar__send_data__rdy[7+:1] = tile_out_or_link__recv_xbar__rdy[0];
	assign tile_out_or_link__recv_xbar__val[0] = routing_crossbar__send_data__val[7+:1];
	assign send_data__msg[105+:35] = tile_out_or_link__send__msg[0];
	assign tile_out_or_link__send__rdy[0] = send_data__rdy[3+:1];
	assign send_data__val[3+:1] = tile_out_or_link__send__val[0];
	assign tile_out_or_link__recv_fu__msg[1] = fu_crossbar__send_data__msg[210+:35];
	assign fu_crossbar__send_data__rdy[6+:1] = tile_out_or_link__recv_fu__rdy[1];
	assign tile_out_or_link__recv_fu__val[1] = fu_crossbar__send_data__val[6+:1];
	assign tile_out_or_link__recv_xbar__msg[1] = routing_crossbar__send_data__msg[210+:35];
	assign routing_crossbar__send_data__rdy[6+:1] = tile_out_or_link__recv_xbar__rdy[1];
	assign tile_out_or_link__recv_xbar__val[1] = routing_crossbar__send_data__val[6+:1];
	assign send_data__msg[70+:35] = tile_out_or_link__send__msg[1];
	assign tile_out_or_link__send__rdy[1] = send_data__rdy[2+:1];
	assign send_data__val[2+:1] = tile_out_or_link__send__val[1];
	assign tile_out_or_link__recv_fu__msg[2] = fu_crossbar__send_data__msg[175+:35];
	assign fu_crossbar__send_data__rdy[5+:1] = tile_out_or_link__recv_fu__rdy[2];
	assign tile_out_or_link__recv_fu__val[2] = fu_crossbar__send_data__val[5+:1];
	assign tile_out_or_link__recv_xbar__msg[2] = routing_crossbar__send_data__msg[175+:35];
	assign routing_crossbar__send_data__rdy[5+:1] = tile_out_or_link__recv_xbar__rdy[2];
	assign tile_out_or_link__recv_xbar__val[2] = routing_crossbar__send_data__val[5+:1];
	assign send_data__msg[35+:35] = tile_out_or_link__send__msg[2];
	assign tile_out_or_link__send__rdy[2] = send_data__rdy[1+:1];
	assign send_data__val[1+:1] = tile_out_or_link__send__val[2];
	assign tile_out_or_link__recv_fu__msg[3] = fu_crossbar__send_data__msg[140+:35];
	assign fu_crossbar__send_data__rdy[4+:1] = tile_out_or_link__recv_fu__rdy[3];
	assign tile_out_or_link__recv_fu__val[3] = fu_crossbar__send_data__val[4+:1];
	assign tile_out_or_link__recv_xbar__msg[3] = routing_crossbar__send_data__msg[140+:35];
	assign routing_crossbar__send_data__rdy[4+:1] = tile_out_or_link__recv_xbar__rdy[3];
	assign tile_out_or_link__recv_xbar__val[3] = routing_crossbar__send_data__val[4+:1];
	assign send_data__msg[0+:35] = tile_out_or_link__send__msg[3];
	assign tile_out_or_link__send__rdy[3] = send_data__rdy[0+:1];
	assign send_data__val[0+:1] = tile_out_or_link__send__val[3];
	assign register_cluster__recv_data_from_routing_crossbar__msg[105+:35] = routing_crossbar__send_data__msg[105+:35];
	assign routing_crossbar__send_data__rdy[3+:1] = register_cluster__recv_data_from_routing_crossbar__rdy[3+:1];
	assign register_cluster__recv_data_from_routing_crossbar__val[3+:1] = routing_crossbar__send_data__val[3+:1];
	assign register_cluster__recv_data_from_fu_crossbar__msg[105+:35] = fu_crossbar__send_data__msg[105+:35];
	assign fu_crossbar__send_data__rdy[3+:1] = register_cluster__recv_data_from_fu_crossbar__rdy[3+:1];
	assign register_cluster__recv_data_from_fu_crossbar__val[3+:1] = fu_crossbar__send_data__val[3+:1];
	assign register_cluster__recv_data_from_const__msg[105+:35] = 35'h000000000;
	assign register_cluster__recv_data_from_const__val[3+:1] = 1'd0;
	assign element__recv_in__msg[105+:35] = register_cluster__send_data_to_fu__msg[105+:35];
	assign register_cluster__send_data_to_fu__rdy[3+:1] = element__recv_in__rdy[3+:1];
	assign element__recv_in__val[3+:1] = register_cluster__send_data_to_fu__val[3+:1];
	assign register_cluster__inport_opt = ctrl_mem__send_ctrl__msg;
	assign register_cluster__recv_data_from_routing_crossbar__msg[70+:35] = routing_crossbar__send_data__msg[70+:35];
	assign routing_crossbar__send_data__rdy[2+:1] = register_cluster__recv_data_from_routing_crossbar__rdy[2+:1];
	assign register_cluster__recv_data_from_routing_crossbar__val[2+:1] = routing_crossbar__send_data__val[2+:1];
	assign register_cluster__recv_data_from_fu_crossbar__msg[70+:35] = fu_crossbar__send_data__msg[70+:35];
	assign fu_crossbar__send_data__rdy[2+:1] = register_cluster__recv_data_from_fu_crossbar__rdy[2+:1];
	assign register_cluster__recv_data_from_fu_crossbar__val[2+:1] = fu_crossbar__send_data__val[2+:1];
	assign register_cluster__recv_data_from_const__msg[70+:35] = 35'h000000000;
	assign register_cluster__recv_data_from_const__val[2+:1] = 1'd0;
	assign element__recv_in__msg[70+:35] = register_cluster__send_data_to_fu__msg[70+:35];
	assign register_cluster__send_data_to_fu__rdy[2+:1] = element__recv_in__rdy[2+:1];
	assign element__recv_in__val[2+:1] = register_cluster__send_data_to_fu__val[2+:1];
	assign register_cluster__recv_data_from_routing_crossbar__msg[35+:35] = routing_crossbar__send_data__msg[35+:35];
	assign routing_crossbar__send_data__rdy[1+:1] = register_cluster__recv_data_from_routing_crossbar__rdy[1+:1];
	assign register_cluster__recv_data_from_routing_crossbar__val[1+:1] = routing_crossbar__send_data__val[1+:1];
	assign register_cluster__recv_data_from_fu_crossbar__msg[35+:35] = fu_crossbar__send_data__msg[35+:35];
	assign fu_crossbar__send_data__rdy[1+:1] = register_cluster__recv_data_from_fu_crossbar__rdy[1+:1];
	assign register_cluster__recv_data_from_fu_crossbar__val[1+:1] = fu_crossbar__send_data__val[1+:1];
	assign register_cluster__recv_data_from_const__msg[35+:35] = 35'h000000000;
	assign register_cluster__recv_data_from_const__val[1+:1] = 1'd0;
	assign element__recv_in__msg[35+:35] = register_cluster__send_data_to_fu__msg[35+:35];
	assign register_cluster__send_data_to_fu__rdy[1+:1] = element__recv_in__rdy[1+:1];
	assign element__recv_in__val[1+:1] = register_cluster__send_data_to_fu__val[1+:1];
	assign register_cluster__recv_data_from_routing_crossbar__msg[0+:35] = routing_crossbar__send_data__msg[0+:35];
	assign routing_crossbar__send_data__rdy[0+:1] = register_cluster__recv_data_from_routing_crossbar__rdy[0+:1];
	assign register_cluster__recv_data_from_routing_crossbar__val[0+:1] = routing_crossbar__send_data__val[0+:1];
	assign register_cluster__recv_data_from_fu_crossbar__msg[0+:35] = fu_crossbar__send_data__msg[0+:35];
	assign fu_crossbar__send_data__rdy[0+:1] = register_cluster__recv_data_from_fu_crossbar__rdy[0+:1];
	assign register_cluster__recv_data_from_fu_crossbar__val[0+:1] = fu_crossbar__send_data__val[0+:1];
	assign register_cluster__recv_data_from_const__msg[0+:35] = 35'h000000000;
	assign register_cluster__recv_data_from_const__val[0+:1] = 1'd0;
	assign element__recv_in__msg[0+:35] = register_cluster__send_data_to_fu__msg[0+:35];
	assign register_cluster__send_data_to_fu__rdy[0+:1] = element__recv_in__rdy[0+:1];
	assign element__recv_in__val[0+:1] = register_cluster__send_data_to_fu__val[0+:1];
	assign element__clear[10+:1] = 1'd0;
	assign element__clear[9+:1] = 1'd0;
	assign element__clear[8+:1] = 1'd0;
	assign element__clear[7+:1] = 1'd0;
	assign element__clear[6+:1] = 1'd0;
	assign element__clear[5+:1] = 1'd0;
	assign element__clear[4+:1] = 1'd0;
	assign element__clear[3+:1] = 1'd0;
	assign element__clear[2+:1] = 1'd0;
	assign element__clear[1+:1] = 1'd0;
	assign element__clear[0+:1] = 1'd0;
	assign fu_crossbar__clear = 1'd0;
	assign register_cluster__clear = 1'd0;
	assign routing_crossbar__clear = 1'd0;
endmodule
module CgraRTL__ee448ce8f855514e (
	address_lower,
	address_upper,
	cgra_id,
	clk,
	reset,
	recv_data_on_boundary_east__msg,
	recv_data_on_boundary_east__rdy,
	recv_data_on_boundary_east__val,
	recv_data_on_boundary_north__msg,
	recv_data_on_boundary_north__rdy,
	recv_data_on_boundary_north__val,
	recv_data_on_boundary_south__msg,
	recv_data_on_boundary_south__rdy,
	recv_data_on_boundary_south__val,
	recv_data_on_boundary_west__msg,
	recv_data_on_boundary_west__rdy,
	recv_data_on_boundary_west__val,
	recv_from_cpu_pkt__msg,
	recv_from_cpu_pkt__rdy,
	recv_from_cpu_pkt__val,
	recv_from_inter_cgra_noc__msg,
	recv_from_inter_cgra_noc__rdy,
	recv_from_inter_cgra_noc__val,
	send_data_on_boundary_east__msg,
	send_data_on_boundary_east__rdy,
	send_data_on_boundary_east__val,
	send_data_on_boundary_north__msg,
	send_data_on_boundary_north__rdy,
	send_data_on_boundary_north__val,
	send_data_on_boundary_south__msg,
	send_data_on_boundary_south__rdy,
	send_data_on_boundary_south__val,
	send_data_on_boundary_west__msg,
	send_data_on_boundary_west__rdy,
	send_data_on_boundary_west__val,
	send_to_cpu_pkt__msg,
	send_to_cpu_pkt__rdy,
	send_to_cpu_pkt__val,
	send_to_inter_cgra_noc__msg,
	send_to_inter_cgra_noc__rdy,
	send_to_inter_cgra_noc__val
);
	input wire [6:0] address_lower;
	input wire [6:0] address_upper;
	input wire [1:0] cgra_id;
	input wire [0:0] clk;
	input wire [0:0] reset;
	input wire [69:0] recv_data_on_boundary_east__msg;
	output wire [1:0] recv_data_on_boundary_east__rdy;
	input wire [1:0] recv_data_on_boundary_east__val;
	input wire [69:0] recv_data_on_boundary_north__msg;
	output wire [1:0] recv_data_on_boundary_north__rdy;
	input wire [1:0] recv_data_on_boundary_north__val;
	input wire [69:0] recv_data_on_boundary_south__msg;
	output wire [1:0] recv_data_on_boundary_south__rdy;
	input wire [1:0] recv_data_on_boundary_south__val;
	input wire [69:0] recv_data_on_boundary_west__msg;
	output wire [1:0] recv_data_on_boundary_west__rdy;
	input wire [1:0] recv_data_on_boundary_west__val;
	input wire [198:0] recv_from_cpu_pkt__msg;
	output wire [0:0] recv_from_cpu_pkt__rdy;
	input wire [0:0] recv_from_cpu_pkt__val;
	input wire [201:0] recv_from_inter_cgra_noc__msg;
	output wire [0:0] recv_from_inter_cgra_noc__rdy;
	input wire [0:0] recv_from_inter_cgra_noc__val;
	output wire [69:0] send_data_on_boundary_east__msg;
	input wire [1:0] send_data_on_boundary_east__rdy;
	output wire [1:0] send_data_on_boundary_east__val;
	output wire [69:0] send_data_on_boundary_north__msg;
	input wire [1:0] send_data_on_boundary_north__rdy;
	output wire [1:0] send_data_on_boundary_north__val;
	output wire [69:0] send_data_on_boundary_south__msg;
	input wire [1:0] send_data_on_boundary_south__rdy;
	output wire [1:0] send_data_on_boundary_south__val;
	output wire [69:0] send_data_on_boundary_west__msg;
	input wire [1:0] send_data_on_boundary_west__rdy;
	output wire [1:0] send_data_on_boundary_west__val;
	output wire [198:0] send_to_cpu_pkt__msg;
	input wire [0:0] send_to_cpu_pkt__rdy;
	output wire [0:0] send_to_cpu_pkt__val;
	output wire [201:0] send_to_inter_cgra_noc__msg;
	input wire [0:0] send_to_inter_cgra_noc__rdy;
	output wire [0:0] send_to_inter_cgra_noc__val;
	wire [0:0] bypass_queue__clk;
	wire [0:0] bypass_queue__count;
	wire [0:0] bypass_queue__reset;
	wire [201:0] bypass_queue__recv__msg;
	wire [0:0] bypass_queue__recv__rdy;
	wire [0:0] bypass_queue__recv__val;
	wire [201:0] bypass_queue__send__msg;
	wire [0:0] bypass_queue__send__rdy;
	wire [0:0] bypass_queue__send__val;
	BypassQueueRTL__cf12eb093b04a1b9 bypass_queue(
		.clk(bypass_queue__clk),
		.count(bypass_queue__count),
		.reset(bypass_queue__reset),
		.recv__msg(bypass_queue__recv__msg),
		.recv__rdy(bypass_queue__recv__rdy),
		.recv__val(bypass_queue__recv__val),
		.send__msg(bypass_queue__send__msg),
		.send__rdy(bypass_queue__send__rdy),
		.send__val(bypass_queue__send__val)
	);
	wire [1:0] controller__cgra_id;
	wire [0:0] controller__clk;
	wire [0:0] controller__reset;
	wire [138:0] controller__dma_cmd__msg;
	wire [0:0] controller__dma_cmd__rdy;
	wire [0:0] controller__dma_cmd__val;
	wire [7:0] controller__dma_done__msg;
	wire [0:0] controller__dma_done__rdy;
	wire [0:0] controller__dma_done__val;
	wire [198:0] controller__recv_from_cpu_pkt__msg;
	wire [0:0] controller__recv_from_cpu_pkt__rdy;
	wire [0:0] controller__recv_from_cpu_pkt__val;
	wire [198:0] controller__recv_from_ctrl_ring_pkt__msg;
	wire [0:0] controller__recv_from_ctrl_ring_pkt__rdy;
	wire [0:0] controller__recv_from_ctrl_ring_pkt__val;
	wire [31:0] controller__recv_from_dma_spm_rd_req__msg;
	wire [0:0] controller__recv_from_dma_spm_rd_req__rdy;
	wire [0:0] controller__recv_from_dma_spm_rd_req__val;
	wire [67:0] controller__recv_from_dma_spm_wr_req__msg;
	wire [0:0] controller__recv_from_dma_spm_wr_req__rdy;
	wire [0:0] controller__recv_from_dma_spm_wr_req__val;
	wire [198:0] controller__recv_from_im2col_pkt__msg;
	wire [0:0] controller__recv_from_im2col_pkt__rdy;
	wire [0:0] controller__recv_from_im2col_pkt__val;
	wire [201:0] controller__recv_from_inter_cgra_noc__msg;
	wire [0:0] controller__recv_from_inter_cgra_noc__rdy;
	wire [0:0] controller__recv_from_inter_cgra_noc__val;
	wire [31:0] controller__recv_from_sram_load_response__msg;
	wire [0:0] controller__recv_from_sram_load_response__rdy;
	wire [0:0] controller__recv_from_sram_load_response__val;
	wire [201:0] controller__recv_from_tile_load_request_pkt__msg;
	wire [0:0] controller__recv_from_tile_load_request_pkt__rdy;
	wire [0:0] controller__recv_from_tile_load_request_pkt__val;
	wire [201:0] controller__recv_from_tile_load_response_pkt__msg;
	wire [0:0] controller__recv_from_tile_load_response_pkt__rdy;
	wire [0:0] controller__recv_from_tile_load_response_pkt__val;
	wire [201:0] controller__recv_from_tile_store_request_pkt__msg;
	wire [0:0] controller__recv_from_tile_store_request_pkt__rdy;
	wire [0:0] controller__recv_from_tile_store_request_pkt__val;
	wire [198:0] controller__send_to_cpu_pkt__msg;
	wire [0:0] controller__send_to_cpu_pkt__rdy;
	wire [0:0] controller__send_to_cpu_pkt__val;
	wire [198:0] controller__send_to_ctrl_ring_pkt__msg;
	wire [0:0] controller__send_to_ctrl_ring_pkt__rdy;
	wire [0:0] controller__send_to_ctrl_ring_pkt__val;
	wire [31:0] controller__send_to_dma_spm_rd_resp__msg;
	wire [0:0] controller__send_to_dma_spm_rd_resp__rdy;
	wire [0:0] controller__send_to_dma_spm_rd_resp__val;
	wire [198:0] controller__send_to_im2col_engine_pkt__msg;
	wire [0:0] controller__send_to_im2col_engine_pkt__rdy;
	wire [0:0] controller__send_to_im2col_engine_pkt__val;
	wire [201:0] controller__send_to_inter_cgra_noc__msg;
	wire [0:0] controller__send_to_inter_cgra_noc__rdy;
	wire [0:0] controller__send_to_inter_cgra_noc__val;
	wire [31:0] controller__send_to_sram_load_request_from_dma__msg;
	wire [0:0] controller__send_to_sram_load_request_from_dma__rdy;
	wire [0:0] controller__send_to_sram_load_request_from_dma__val;
	wire [201:0] controller__send_to_sram_load_request_from_noc__msg;
	wire [0:0] controller__send_to_sram_load_request_from_noc__rdy;
	wire [0:0] controller__send_to_sram_load_request_from_noc__val;
	wire [67:0] controller__send_to_sram_store_request_from_dma__msg;
	wire [0:0] controller__send_to_sram_store_request_from_dma__rdy;
	wire [0:0] controller__send_to_sram_store_request_from_dma__val;
	wire [201:0] controller__send_to_sram_store_request_from_noc__msg;
	wire [0:0] controller__send_to_sram_store_request_from_noc__rdy;
	wire [0:0] controller__send_to_sram_store_request_from_noc__val;
	wire [201:0] controller__send_to_tile_load_response__msg;
	wire [0:0] controller__send_to_tile_load_response__rdy;
	wire [0:0] controller__send_to_tile_load_response__val;
	ControllerRTL__ddd56b6da3a23069 controller(
		.cgra_id(controller__cgra_id),
		.clk(controller__clk),
		.reset(controller__reset),
		.dma_cmd__msg(controller__dma_cmd__msg),
		.dma_cmd__rdy(controller__dma_cmd__rdy),
		.dma_cmd__val(controller__dma_cmd__val),
		.dma_done__msg(controller__dma_done__msg),
		.dma_done__rdy(controller__dma_done__rdy),
		.dma_done__val(controller__dma_done__val),
		.recv_from_cpu_pkt__msg(controller__recv_from_cpu_pkt__msg),
		.recv_from_cpu_pkt__rdy(controller__recv_from_cpu_pkt__rdy),
		.recv_from_cpu_pkt__val(controller__recv_from_cpu_pkt__val),
		.recv_from_ctrl_ring_pkt__msg(controller__recv_from_ctrl_ring_pkt__msg),
		.recv_from_ctrl_ring_pkt__rdy(controller__recv_from_ctrl_ring_pkt__rdy),
		.recv_from_ctrl_ring_pkt__val(controller__recv_from_ctrl_ring_pkt__val),
		.recv_from_dma_spm_rd_req__msg(controller__recv_from_dma_spm_rd_req__msg),
		.recv_from_dma_spm_rd_req__rdy(controller__recv_from_dma_spm_rd_req__rdy),
		.recv_from_dma_spm_rd_req__val(controller__recv_from_dma_spm_rd_req__val),
		.recv_from_dma_spm_wr_req__msg(controller__recv_from_dma_spm_wr_req__msg),
		.recv_from_dma_spm_wr_req__rdy(controller__recv_from_dma_spm_wr_req__rdy),
		.recv_from_dma_spm_wr_req__val(controller__recv_from_dma_spm_wr_req__val),
		.recv_from_im2col_pkt__msg(controller__recv_from_im2col_pkt__msg),
		.recv_from_im2col_pkt__rdy(controller__recv_from_im2col_pkt__rdy),
		.recv_from_im2col_pkt__val(controller__recv_from_im2col_pkt__val),
		.recv_from_inter_cgra_noc__msg(controller__recv_from_inter_cgra_noc__msg),
		.recv_from_inter_cgra_noc__rdy(controller__recv_from_inter_cgra_noc__rdy),
		.recv_from_inter_cgra_noc__val(controller__recv_from_inter_cgra_noc__val),
		.recv_from_sram_load_response__msg(controller__recv_from_sram_load_response__msg),
		.recv_from_sram_load_response__rdy(controller__recv_from_sram_load_response__rdy),
		.recv_from_sram_load_response__val(controller__recv_from_sram_load_response__val),
		.recv_from_tile_load_request_pkt__msg(controller__recv_from_tile_load_request_pkt__msg),
		.recv_from_tile_load_request_pkt__rdy(controller__recv_from_tile_load_request_pkt__rdy),
		.recv_from_tile_load_request_pkt__val(controller__recv_from_tile_load_request_pkt__val),
		.recv_from_tile_load_response_pkt__msg(controller__recv_from_tile_load_response_pkt__msg),
		.recv_from_tile_load_response_pkt__rdy(controller__recv_from_tile_load_response_pkt__rdy),
		.recv_from_tile_load_response_pkt__val(controller__recv_from_tile_load_response_pkt__val),
		.recv_from_tile_store_request_pkt__msg(controller__recv_from_tile_store_request_pkt__msg),
		.recv_from_tile_store_request_pkt__rdy(controller__recv_from_tile_store_request_pkt__rdy),
		.recv_from_tile_store_request_pkt__val(controller__recv_from_tile_store_request_pkt__val),
		.send_to_cpu_pkt__msg(controller__send_to_cpu_pkt__msg),
		.send_to_cpu_pkt__rdy(controller__send_to_cpu_pkt__rdy),
		.send_to_cpu_pkt__val(controller__send_to_cpu_pkt__val),
		.send_to_ctrl_ring_pkt__msg(controller__send_to_ctrl_ring_pkt__msg),
		.send_to_ctrl_ring_pkt__rdy(controller__send_to_ctrl_ring_pkt__rdy),
		.send_to_ctrl_ring_pkt__val(controller__send_to_ctrl_ring_pkt__val),
		.send_to_dma_spm_rd_resp__msg(controller__send_to_dma_spm_rd_resp__msg),
		.send_to_dma_spm_rd_resp__rdy(controller__send_to_dma_spm_rd_resp__rdy),
		.send_to_dma_spm_rd_resp__val(controller__send_to_dma_spm_rd_resp__val),
		.send_to_im2col_engine_pkt__msg(controller__send_to_im2col_engine_pkt__msg),
		.send_to_im2col_engine_pkt__rdy(controller__send_to_im2col_engine_pkt__rdy),
		.send_to_im2col_engine_pkt__val(controller__send_to_im2col_engine_pkt__val),
		.send_to_inter_cgra_noc__msg(controller__send_to_inter_cgra_noc__msg),
		.send_to_inter_cgra_noc__rdy(controller__send_to_inter_cgra_noc__rdy),
		.send_to_inter_cgra_noc__val(controller__send_to_inter_cgra_noc__val),
		.send_to_sram_load_request_from_dma__msg(controller__send_to_sram_load_request_from_dma__msg),
		.send_to_sram_load_request_from_dma__rdy(controller__send_to_sram_load_request_from_dma__rdy),
		.send_to_sram_load_request_from_dma__val(controller__send_to_sram_load_request_from_dma__val),
		.send_to_sram_load_request_from_noc__msg(controller__send_to_sram_load_request_from_noc__msg),
		.send_to_sram_load_request_from_noc__rdy(controller__send_to_sram_load_request_from_noc__rdy),
		.send_to_sram_load_request_from_noc__val(controller__send_to_sram_load_request_from_noc__val),
		.send_to_sram_store_request_from_dma__msg(controller__send_to_sram_store_request_from_dma__msg),
		.send_to_sram_store_request_from_dma__rdy(controller__send_to_sram_store_request_from_dma__rdy),
		.send_to_sram_store_request_from_dma__val(controller__send_to_sram_store_request_from_dma__val),
		.send_to_sram_store_request_from_noc__msg(controller__send_to_sram_store_request_from_noc__msg),
		.send_to_sram_store_request_from_noc__rdy(controller__send_to_sram_store_request_from_noc__rdy),
		.send_to_sram_store_request_from_noc__val(controller__send_to_sram_store_request_from_noc__val),
		.send_to_tile_load_response__msg(controller__send_to_tile_load_response__msg),
		.send_to_tile_load_response__rdy(controller__send_to_tile_load_response__rdy),
		.send_to_tile_load_response__val(controller__send_to_tile_load_response__val)
	);
	wire [0:0] ctrl_ring__clk;
	wire [0:0] ctrl_ring__reset;
	wire [994:0] ctrl_ring__recv__msg;
	wire [4:0] ctrl_ring__recv__rdy;
	wire [4:0] ctrl_ring__recv__val;
	wire [994:0] ctrl_ring__send__msg;
	wire [4:0] ctrl_ring__send__rdy;
	wire [4:0] ctrl_ring__send__val;
	RingNetworkRTL__ea2a16af74aa57fe ctrl_ring(
		.clk(ctrl_ring__clk),
		.reset(ctrl_ring__reset),
		.recv__msg(ctrl_ring__recv__msg),
		.recv__rdy(ctrl_ring__recv__rdy),
		.recv__val(ctrl_ring__recv__val),
		.send__msg(ctrl_ring__send__msg),
		.send__rdy(ctrl_ring__send__rdy),
		.send__val(ctrl_ring__send__val)
	);
	wire [6:0] data_mem__address_lower;
	wire [6:0] data_mem__address_upper;
	wire [1:0] data_mem__cgra_id;
	wire [0:0] data_mem__clk;
	wire [0:0] data_mem__reset;
	wire [31:0] data_mem__recv_from_controller_spm_rd_req__msg;
	wire [0:0] data_mem__recv_from_controller_spm_rd_req__rdy;
	wire [0:0] data_mem__recv_from_controller_spm_rd_req__val;
	wire [67:0] data_mem__recv_from_controller_spm_wr_req__msg;
	wire [0:0] data_mem__recv_from_controller_spm_wr_req__rdy;
	wire [0:0] data_mem__recv_from_controller_spm_wr_req__val;
	wire [201:0] data_mem__recv_from_noc_load_request__msg;
	wire [0:0] data_mem__recv_from_noc_load_request__rdy;
	wire [0:0] data_mem__recv_from_noc_load_request__val;
	wire [201:0] data_mem__recv_from_noc_load_response_pkt__msg;
	wire [0:0] data_mem__recv_from_noc_load_response_pkt__rdy;
	wire [0:0] data_mem__recv_from_noc_load_response_pkt__val;
	wire [201:0] data_mem__recv_from_noc_store_request__msg;
	wire [0:0] data_mem__recv_from_noc_store_request__rdy;
	wire [0:0] data_mem__recv_from_noc_store_request__val;
	wire [20:0] data_mem__recv_raddr__msg;
	wire [2:0] data_mem__recv_raddr__rdy;
	wire [2:0] data_mem__recv_raddr__val;
	wire [20:0] data_mem__recv_waddr__msg;
	wire [2:0] data_mem__recv_waddr__rdy;
	wire [2:0] data_mem__recv_waddr__val;
	wire [104:0] data_mem__recv_wdata__msg;
	wire [2:0] data_mem__recv_wdata__rdy;
	wire [2:0] data_mem__recv_wdata__val;
	wire [104:0] data_mem__send_rdata__msg;
	wire [2:0] data_mem__send_rdata__rdy;
	wire [2:0] data_mem__send_rdata__val;
	wire [31:0] data_mem__send_to_controller_spm_rd_resp__msg;
	wire [0:0] data_mem__send_to_controller_spm_rd_resp__rdy;
	wire [0:0] data_mem__send_to_controller_spm_rd_resp__val;
	wire [201:0] data_mem__send_to_noc_load_request_pkt__msg;
	wire [0:0] data_mem__send_to_noc_load_request_pkt__rdy;
	wire [0:0] data_mem__send_to_noc_load_request_pkt__val;
	wire [201:0] data_mem__send_to_noc_load_response_pkt__msg;
	wire [0:0] data_mem__send_to_noc_load_response_pkt__rdy;
	wire [0:0] data_mem__send_to_noc_load_response_pkt__val;
	wire [201:0] data_mem__send_to_noc_store_pkt__msg;
	wire [0:0] data_mem__send_to_noc_store_pkt__rdy;
	wire [0:0] data_mem__send_to_noc_store_pkt__val;
	DataMemControllerRTL__855c64d5103d1825 data_mem(
		.address_lower(data_mem__address_lower),
		.address_upper(data_mem__address_upper),
		.cgra_id(data_mem__cgra_id),
		.clk(data_mem__clk),
		.reset(data_mem__reset),
		.recv_from_controller_spm_rd_req__msg(data_mem__recv_from_controller_spm_rd_req__msg),
		.recv_from_controller_spm_rd_req__rdy(data_mem__recv_from_controller_spm_rd_req__rdy),
		.recv_from_controller_spm_rd_req__val(data_mem__recv_from_controller_spm_rd_req__val),
		.recv_from_controller_spm_wr_req__msg(data_mem__recv_from_controller_spm_wr_req__msg),
		.recv_from_controller_spm_wr_req__rdy(data_mem__recv_from_controller_spm_wr_req__rdy),
		.recv_from_controller_spm_wr_req__val(data_mem__recv_from_controller_spm_wr_req__val),
		.recv_from_noc_load_request__msg(data_mem__recv_from_noc_load_request__msg),
		.recv_from_noc_load_request__rdy(data_mem__recv_from_noc_load_request__rdy),
		.recv_from_noc_load_request__val(data_mem__recv_from_noc_load_request__val),
		.recv_from_noc_load_response_pkt__msg(data_mem__recv_from_noc_load_response_pkt__msg),
		.recv_from_noc_load_response_pkt__rdy(data_mem__recv_from_noc_load_response_pkt__rdy),
		.recv_from_noc_load_response_pkt__val(data_mem__recv_from_noc_load_response_pkt__val),
		.recv_from_noc_store_request__msg(data_mem__recv_from_noc_store_request__msg),
		.recv_from_noc_store_request__rdy(data_mem__recv_from_noc_store_request__rdy),
		.recv_from_noc_store_request__val(data_mem__recv_from_noc_store_request__val),
		.recv_raddr__msg(data_mem__recv_raddr__msg),
		.recv_raddr__rdy(data_mem__recv_raddr__rdy),
		.recv_raddr__val(data_mem__recv_raddr__val),
		.recv_waddr__msg(data_mem__recv_waddr__msg),
		.recv_waddr__rdy(data_mem__recv_waddr__rdy),
		.recv_waddr__val(data_mem__recv_waddr__val),
		.recv_wdata__msg(data_mem__recv_wdata__msg),
		.recv_wdata__rdy(data_mem__recv_wdata__rdy),
		.recv_wdata__val(data_mem__recv_wdata__val),
		.send_rdata__msg(data_mem__send_rdata__msg),
		.send_rdata__rdy(data_mem__send_rdata__rdy),
		.send_rdata__val(data_mem__send_rdata__val),
		.send_to_controller_spm_rd_resp__msg(data_mem__send_to_controller_spm_rd_resp__msg),
		.send_to_controller_spm_rd_resp__rdy(data_mem__send_to_controller_spm_rd_resp__rdy),
		.send_to_controller_spm_rd_resp__val(data_mem__send_to_controller_spm_rd_resp__val),
		.send_to_noc_load_request_pkt__msg(data_mem__send_to_noc_load_request_pkt__msg),
		.send_to_noc_load_request_pkt__rdy(data_mem__send_to_noc_load_request_pkt__rdy),
		.send_to_noc_load_request_pkt__val(data_mem__send_to_noc_load_request_pkt__val),
		.send_to_noc_load_response_pkt__msg(data_mem__send_to_noc_load_response_pkt__msg),
		.send_to_noc_load_response_pkt__rdy(data_mem__send_to_noc_load_response_pkt__rdy),
		.send_to_noc_load_response_pkt__val(data_mem__send_to_noc_load_response_pkt__val),
		.send_to_noc_store_pkt__msg(data_mem__send_to_noc_store_pkt__msg),
		.send_to_noc_store_pkt__rdy(data_mem__send_to_noc_store_pkt__rdy),
		.send_to_noc_store_pkt__val(data_mem__send_to_noc_store_pkt__val)
	);
	wire [1:0] tile__cgra_id [0:3];
	wire [0:0] tile__clk [0:3];
	wire [0:0] tile__reset [0:3];
	wire [2:0] tile__tile_id [0:3];
	wire [34:0] tile__from_mem_rdata__msg [0:3];
	wire [0:0] tile__from_mem_rdata__rdy [0:3];
	wire [0:0] tile__from_mem_rdata__val [0:3];
	wire [139:0] tile__recv_data__msg [0:3];
	wire [3:0] tile__recv_data__rdy [0:3];
	wire [3:0] tile__recv_data__val [0:3];
	wire [198:0] tile__recv_from_controller_pkt__msg [0:3];
	wire [0:0] tile__recv_from_controller_pkt__rdy [0:3];
	wire [0:0] tile__recv_from_controller_pkt__val [0:3];
	wire [139:0] tile__send_data__msg [0:3];
	wire [3:0] tile__send_data__rdy [0:3];
	wire [3:0] tile__send_data__val [0:3];
	wire [198:0] tile__send_to_controller_pkt__msg [0:3];
	wire [0:0] tile__send_to_controller_pkt__rdy [0:3];
	wire [0:0] tile__send_to_controller_pkt__val [0:3];
	wire [6:0] tile__to_mem_raddr__msg [0:3];
	wire [0:0] tile__to_mem_raddr__rdy [0:3];
	wire [0:0] tile__to_mem_raddr__val [0:3];
	wire [6:0] tile__to_mem_waddr__msg [0:3];
	wire [0:0] tile__to_mem_waddr__rdy [0:3];
	wire [0:0] tile__to_mem_waddr__val [0:3];
	wire [34:0] tile__to_mem_wdata__msg [0:3];
	wire [0:0] tile__to_mem_wdata__rdy [0:3];
	wire [0:0] tile__to_mem_wdata__val [0:3];
	TileRTL__80552dd1320c93e4 tile__0(
		.cgra_id(tile__cgra_id[0]),
		.clk(tile__clk[0]),
		.reset(tile__reset[0]),
		.tile_id(tile__tile_id[0]),
		.from_mem_rdata__msg(tile__from_mem_rdata__msg[0]),
		.from_mem_rdata__rdy(tile__from_mem_rdata__rdy[0]),
		.from_mem_rdata__val(tile__from_mem_rdata__val[0]),
		.recv_data__msg(tile__recv_data__msg[0]),
		.recv_data__rdy(tile__recv_data__rdy[0]),
		.recv_data__val(tile__recv_data__val[0]),
		.recv_from_controller_pkt__msg(tile__recv_from_controller_pkt__msg[0]),
		.recv_from_controller_pkt__rdy(tile__recv_from_controller_pkt__rdy[0]),
		.recv_from_controller_pkt__val(tile__recv_from_controller_pkt__val[0]),
		.send_data__msg(tile__send_data__msg[0]),
		.send_data__rdy(tile__send_data__rdy[0]),
		.send_data__val(tile__send_data__val[0]),
		.send_to_controller_pkt__msg(tile__send_to_controller_pkt__msg[0]),
		.send_to_controller_pkt__rdy(tile__send_to_controller_pkt__rdy[0]),
		.send_to_controller_pkt__val(tile__send_to_controller_pkt__val[0]),
		.to_mem_raddr__msg(tile__to_mem_raddr__msg[0]),
		.to_mem_raddr__rdy(tile__to_mem_raddr__rdy[0]),
		.to_mem_raddr__val(tile__to_mem_raddr__val[0]),
		.to_mem_waddr__msg(tile__to_mem_waddr__msg[0]),
		.to_mem_waddr__rdy(tile__to_mem_waddr__rdy[0]),
		.to_mem_waddr__val(tile__to_mem_waddr__val[0]),
		.to_mem_wdata__msg(tile__to_mem_wdata__msg[0]),
		.to_mem_wdata__rdy(tile__to_mem_wdata__rdy[0]),
		.to_mem_wdata__val(tile__to_mem_wdata__val[0])
	);
	TileRTL__80552dd1320c93e4 tile__1(
		.cgra_id(tile__cgra_id[1]),
		.clk(tile__clk[1]),
		.reset(tile__reset[1]),
		.tile_id(tile__tile_id[1]),
		.from_mem_rdata__msg(tile__from_mem_rdata__msg[1]),
		.from_mem_rdata__rdy(tile__from_mem_rdata__rdy[1]),
		.from_mem_rdata__val(tile__from_mem_rdata__val[1]),
		.recv_data__msg(tile__recv_data__msg[1]),
		.recv_data__rdy(tile__recv_data__rdy[1]),
		.recv_data__val(tile__recv_data__val[1]),
		.recv_from_controller_pkt__msg(tile__recv_from_controller_pkt__msg[1]),
		.recv_from_controller_pkt__rdy(tile__recv_from_controller_pkt__rdy[1]),
		.recv_from_controller_pkt__val(tile__recv_from_controller_pkt__val[1]),
		.send_data__msg(tile__send_data__msg[1]),
		.send_data__rdy(tile__send_data__rdy[1]),
		.send_data__val(tile__send_data__val[1]),
		.send_to_controller_pkt__msg(tile__send_to_controller_pkt__msg[1]),
		.send_to_controller_pkt__rdy(tile__send_to_controller_pkt__rdy[1]),
		.send_to_controller_pkt__val(tile__send_to_controller_pkt__val[1]),
		.to_mem_raddr__msg(tile__to_mem_raddr__msg[1]),
		.to_mem_raddr__rdy(tile__to_mem_raddr__rdy[1]),
		.to_mem_raddr__val(tile__to_mem_raddr__val[1]),
		.to_mem_waddr__msg(tile__to_mem_waddr__msg[1]),
		.to_mem_waddr__rdy(tile__to_mem_waddr__rdy[1]),
		.to_mem_waddr__val(tile__to_mem_waddr__val[1]),
		.to_mem_wdata__msg(tile__to_mem_wdata__msg[1]),
		.to_mem_wdata__rdy(tile__to_mem_wdata__rdy[1]),
		.to_mem_wdata__val(tile__to_mem_wdata__val[1])
	);
	TileRTL__80552dd1320c93e4 tile__2(
		.cgra_id(tile__cgra_id[2]),
		.clk(tile__clk[2]),
		.reset(tile__reset[2]),
		.tile_id(tile__tile_id[2]),
		.from_mem_rdata__msg(tile__from_mem_rdata__msg[2]),
		.from_mem_rdata__rdy(tile__from_mem_rdata__rdy[2]),
		.from_mem_rdata__val(tile__from_mem_rdata__val[2]),
		.recv_data__msg(tile__recv_data__msg[2]),
		.recv_data__rdy(tile__recv_data__rdy[2]),
		.recv_data__val(tile__recv_data__val[2]),
		.recv_from_controller_pkt__msg(tile__recv_from_controller_pkt__msg[2]),
		.recv_from_controller_pkt__rdy(tile__recv_from_controller_pkt__rdy[2]),
		.recv_from_controller_pkt__val(tile__recv_from_controller_pkt__val[2]),
		.send_data__msg(tile__send_data__msg[2]),
		.send_data__rdy(tile__send_data__rdy[2]),
		.send_data__val(tile__send_data__val[2]),
		.send_to_controller_pkt__msg(tile__send_to_controller_pkt__msg[2]),
		.send_to_controller_pkt__rdy(tile__send_to_controller_pkt__rdy[2]),
		.send_to_controller_pkt__val(tile__send_to_controller_pkt__val[2]),
		.to_mem_raddr__msg(tile__to_mem_raddr__msg[2]),
		.to_mem_raddr__rdy(tile__to_mem_raddr__rdy[2]),
		.to_mem_raddr__val(tile__to_mem_raddr__val[2]),
		.to_mem_waddr__msg(tile__to_mem_waddr__msg[2]),
		.to_mem_waddr__rdy(tile__to_mem_waddr__rdy[2]),
		.to_mem_waddr__val(tile__to_mem_waddr__val[2]),
		.to_mem_wdata__msg(tile__to_mem_wdata__msg[2]),
		.to_mem_wdata__rdy(tile__to_mem_wdata__rdy[2]),
		.to_mem_wdata__val(tile__to_mem_wdata__val[2])
	);
	TileRTL__80552dd1320c93e4 tile__3(
		.cgra_id(tile__cgra_id[3]),
		.clk(tile__clk[3]),
		.reset(tile__reset[3]),
		.tile_id(tile__tile_id[3]),
		.from_mem_rdata__msg(tile__from_mem_rdata__msg[3]),
		.from_mem_rdata__rdy(tile__from_mem_rdata__rdy[3]),
		.from_mem_rdata__val(tile__from_mem_rdata__val[3]),
		.recv_data__msg(tile__recv_data__msg[3]),
		.recv_data__rdy(tile__recv_data__rdy[3]),
		.recv_data__val(tile__recv_data__val[3]),
		.recv_from_controller_pkt__msg(tile__recv_from_controller_pkt__msg[3]),
		.recv_from_controller_pkt__rdy(tile__recv_from_controller_pkt__rdy[3]),
		.recv_from_controller_pkt__val(tile__recv_from_controller_pkt__val[3]),
		.send_data__msg(tile__send_data__msg[3]),
		.send_data__rdy(tile__send_data__rdy[3]),
		.send_data__val(tile__send_data__val[3]),
		.send_to_controller_pkt__msg(tile__send_to_controller_pkt__msg[3]),
		.send_to_controller_pkt__rdy(tile__send_to_controller_pkt__rdy[3]),
		.send_to_controller_pkt__val(tile__send_to_controller_pkt__val[3]),
		.to_mem_raddr__msg(tile__to_mem_raddr__msg[3]),
		.to_mem_raddr__rdy(tile__to_mem_raddr__rdy[3]),
		.to_mem_raddr__val(tile__to_mem_raddr__val[3]),
		.to_mem_waddr__msg(tile__to_mem_waddr__msg[3]),
		.to_mem_waddr__rdy(tile__to_mem_waddr__rdy[3]),
		.to_mem_waddr__val(tile__to_mem_waddr__val[3]),
		.to_mem_wdata__msg(tile__to_mem_wdata__msg[3]),
		.to_mem_wdata__rdy(tile__to_mem_wdata__rdy[3]),
		.to_mem_wdata__val(tile__to_mem_wdata__val[3])
	);
	assign tile__clk[0] = clk;
	assign tile__reset[0] = reset;
	assign tile__clk[1] = clk;
	assign tile__reset[1] = reset;
	assign tile__clk[2] = clk;
	assign tile__reset[2] = reset;
	assign tile__clk[3] = clk;
	assign tile__reset[3] = reset;
	assign data_mem__clk = clk;
	assign data_mem__reset = reset;
	assign controller__clk = clk;
	assign controller__reset = reset;
	assign ctrl_ring__clk = clk;
	assign ctrl_ring__reset = reset;
	assign controller__cgra_id = cgra_id;
	assign data_mem__cgra_id = cgra_id;
	assign data_mem__address_lower = address_lower;
	assign data_mem__address_upper = address_upper;
	assign data_mem__recv_from_noc_load_request__msg = controller__send_to_sram_load_request_from_noc__msg;
	assign controller__send_to_sram_load_request_from_noc__rdy = data_mem__recv_from_noc_load_request__rdy;
	assign data_mem__recv_from_noc_load_request__val = controller__send_to_sram_load_request_from_noc__val;
	assign data_mem__recv_from_noc_store_request__msg = controller__send_to_sram_store_request_from_noc__msg;
	assign controller__send_to_sram_store_request_from_noc__rdy = data_mem__recv_from_noc_store_request__rdy;
	assign data_mem__recv_from_noc_store_request__val = controller__send_to_sram_store_request_from_noc__val;
	assign data_mem__recv_from_noc_load_response_pkt__msg = controller__send_to_tile_load_response__msg;
	assign controller__send_to_tile_load_response__rdy = data_mem__recv_from_noc_load_response_pkt__rdy;
	assign data_mem__recv_from_noc_load_response_pkt__val = controller__send_to_tile_load_response__val;
	assign controller__recv_from_tile_load_request_pkt__msg = data_mem__send_to_noc_load_request_pkt__msg;
	assign data_mem__send_to_noc_load_request_pkt__rdy = controller__recv_from_tile_load_request_pkt__rdy;
	assign controller__recv_from_tile_load_request_pkt__val = data_mem__send_to_noc_load_request_pkt__val;
	assign controller__recv_from_tile_load_response_pkt__msg = data_mem__send_to_noc_load_response_pkt__msg;
	assign data_mem__send_to_noc_load_response_pkt__rdy = controller__recv_from_tile_load_response_pkt__rdy;
	assign controller__recv_from_tile_load_response_pkt__val = data_mem__send_to_noc_load_response_pkt__val;
	assign controller__recv_from_tile_store_request_pkt__msg = data_mem__send_to_noc_store_pkt__msg;
	assign data_mem__send_to_noc_store_pkt__rdy = controller__recv_from_tile_store_request_pkt__rdy;
	assign controller__recv_from_tile_store_request_pkt__val = data_mem__send_to_noc_store_pkt__val;
	assign bypass_queue__clk = clk;
	assign bypass_queue__reset = reset;
	assign controller__recv_from_inter_cgra_noc__msg = bypass_queue__send__msg;
	assign bypass_queue__send__rdy = controller__recv_from_inter_cgra_noc__rdy;
	assign controller__recv_from_inter_cgra_noc__val = bypass_queue__send__val;
	assign bypass_queue__recv__msg = controller__send_to_inter_cgra_noc__msg;
	assign controller__send_to_inter_cgra_noc__rdy = bypass_queue__recv__rdy;
	assign bypass_queue__recv__val = controller__send_to_inter_cgra_noc__val;
	assign controller__recv_from_cpu_pkt__msg = recv_from_cpu_pkt__msg;
	assign recv_from_cpu_pkt__rdy = controller__recv_from_cpu_pkt__rdy;
	assign controller__recv_from_cpu_pkt__val = recv_from_cpu_pkt__val;
	assign send_to_cpu_pkt__msg = controller__send_to_cpu_pkt__msg;
	assign controller__send_to_cpu_pkt__rdy = send_to_cpu_pkt__rdy;
	assign send_to_cpu_pkt__val = controller__send_to_cpu_pkt__val;
	assign controller__send_to_im2col_engine_pkt__rdy = 1'd0;
	assign controller__recv_from_im2col_pkt__val = 1'd0;
	assign controller__recv_from_im2col_pkt__msg = 199'h00000000000000000000000000000000000000000000000000;
	assign tile__tile_id[0] = 3'd0;
	assign tile__cgra_id[0] = cgra_id;
	assign tile__tile_id[1] = 3'd1;
	assign tile__cgra_id[1] = cgra_id;
	assign tile__tile_id[2] = 3'd2;
	assign tile__cgra_id[2] = cgra_id;
	assign tile__tile_id[3] = 3'd3;
	assign tile__cgra_id[3] = cgra_id;
	assign tile__recv_from_controller_pkt__msg[0] = ctrl_ring__send__msg[796+:199];
	assign ctrl_ring__send__rdy[4+:1] = tile__recv_from_controller_pkt__rdy[0];
	assign tile__recv_from_controller_pkt__val[0] = ctrl_ring__send__val[4+:1];
	assign ctrl_ring__recv__msg[796+:199] = tile__send_to_controller_pkt__msg[0];
	assign tile__send_to_controller_pkt__rdy[0] = ctrl_ring__recv__rdy[4+:1];
	assign ctrl_ring__recv__val[4+:1] = tile__send_to_controller_pkt__val[0];
	assign tile__recv_from_controller_pkt__msg[1] = ctrl_ring__send__msg[597+:199];
	assign ctrl_ring__send__rdy[3+:1] = tile__recv_from_controller_pkt__rdy[1];
	assign tile__recv_from_controller_pkt__val[1] = ctrl_ring__send__val[3+:1];
	assign ctrl_ring__recv__msg[597+:199] = tile__send_to_controller_pkt__msg[1];
	assign tile__send_to_controller_pkt__rdy[1] = ctrl_ring__recv__rdy[3+:1];
	assign ctrl_ring__recv__val[3+:1] = tile__send_to_controller_pkt__val[1];
	assign tile__recv_from_controller_pkt__msg[2] = ctrl_ring__send__msg[398+:199];
	assign ctrl_ring__send__rdy[2+:1] = tile__recv_from_controller_pkt__rdy[2];
	assign tile__recv_from_controller_pkt__val[2] = ctrl_ring__send__val[2+:1];
	assign ctrl_ring__recv__msg[398+:199] = tile__send_to_controller_pkt__msg[2];
	assign tile__send_to_controller_pkt__rdy[2] = ctrl_ring__recv__rdy[2+:1];
	assign ctrl_ring__recv__val[2+:1] = tile__send_to_controller_pkt__val[2];
	assign tile__recv_from_controller_pkt__msg[3] = ctrl_ring__send__msg[199+:199];
	assign ctrl_ring__send__rdy[1+:1] = tile__recv_from_controller_pkt__rdy[3];
	assign tile__recv_from_controller_pkt__val[3] = ctrl_ring__send__val[1+:1];
	assign ctrl_ring__recv__msg[199+:199] = tile__send_to_controller_pkt__msg[3];
	assign tile__send_to_controller_pkt__rdy[3] = ctrl_ring__recv__rdy[1+:1];
	assign ctrl_ring__recv__val[1+:1] = tile__send_to_controller_pkt__val[3];
	assign ctrl_ring__recv__msg[0+:199] = controller__send_to_ctrl_ring_pkt__msg;
	assign controller__send_to_ctrl_ring_pkt__rdy = ctrl_ring__recv__rdy[0+:1];
	assign ctrl_ring__recv__val[0+:1] = controller__send_to_ctrl_ring_pkt__val;
	assign controller__recv_from_ctrl_ring_pkt__msg = ctrl_ring__send__msg[0+:199];
	assign ctrl_ring__send__rdy[0+:1] = controller__recv_from_ctrl_ring_pkt__rdy;
	assign controller__recv_from_ctrl_ring_pkt__val = ctrl_ring__send__val[0+:1];
	assign tile__recv_data__msg[2][70+:35] = tile__send_data__msg[0][105+:35];
	assign tile__send_data__rdy[0][3+:1] = tile__recv_data__rdy[2][2+:1];
	assign tile__recv_data__val[2][2+:1] = tile__send_data__val[0][3+:1];
	assign tile__recv_data__msg[1][35+:35] = tile__send_data__msg[0][0+:35];
	assign tile__send_data__rdy[0][0+:1] = tile__recv_data__rdy[1][1+:1];
	assign tile__recv_data__val[1][1+:1] = tile__send_data__val[0][0+:1];
	assign send_data_on_boundary_south__msg[35+:35] = tile__send_data__msg[0][70+:35];
	assign tile__send_data__rdy[0][2+:1] = send_data_on_boundary_south__rdy[1+:1];
	assign send_data_on_boundary_south__val[1+:1] = tile__send_data__val[0][2+:1];
	assign tile__recv_data__msg[0][70+:35] = recv_data_on_boundary_south__msg[35+:35];
	assign recv_data_on_boundary_south__rdy[1+:1] = tile__recv_data__rdy[0][2+:1];
	assign tile__recv_data__val[0][2+:1] = recv_data_on_boundary_south__val[1+:1];
	assign send_data_on_boundary_west__msg[35+:35] = tile__send_data__msg[0][35+:35];
	assign tile__send_data__rdy[0][1+:1] = send_data_on_boundary_west__rdy[1+:1];
	assign send_data_on_boundary_west__val[1+:1] = tile__send_data__val[0][1+:1];
	assign tile__recv_data__msg[0][35+:35] = recv_data_on_boundary_west__msg[35+:35];
	assign recv_data_on_boundary_west__rdy[1+:1] = tile__recv_data__rdy[0][1+:1];
	assign tile__recv_data__val[0][1+:1] = recv_data_on_boundary_west__val[1+:1];
	assign data_mem__recv_raddr__msg[14+:7] = tile__to_mem_raddr__msg[0];
	assign tile__to_mem_raddr__rdy[0] = data_mem__recv_raddr__rdy[2+:1];
	assign data_mem__recv_raddr__val[2+:1] = tile__to_mem_raddr__val[0];
	assign tile__from_mem_rdata__msg[0] = data_mem__send_rdata__msg[70+:35];
	assign data_mem__send_rdata__rdy[2+:1] = tile__from_mem_rdata__rdy[0];
	assign tile__from_mem_rdata__val[0] = data_mem__send_rdata__val[2+:1];
	assign data_mem__recv_waddr__msg[14+:7] = tile__to_mem_waddr__msg[0];
	assign tile__to_mem_waddr__rdy[0] = data_mem__recv_waddr__rdy[2+:1];
	assign data_mem__recv_waddr__val[2+:1] = tile__to_mem_waddr__val[0];
	assign data_mem__recv_wdata__msg[70+:35] = tile__to_mem_wdata__msg[0];
	assign tile__to_mem_wdata__rdy[0] = data_mem__recv_wdata__rdy[2+:1];
	assign data_mem__recv_wdata__val[2+:1] = tile__to_mem_wdata__val[0];
	assign tile__recv_data__msg[3][70+:35] = tile__send_data__msg[1][105+:35];
	assign tile__send_data__rdy[1][3+:1] = tile__recv_data__rdy[3][2+:1];
	assign tile__recv_data__val[3][2+:1] = tile__send_data__val[1][3+:1];
	assign tile__recv_data__msg[0][0+:35] = tile__send_data__msg[1][35+:35];
	assign tile__send_data__rdy[1][1+:1] = tile__recv_data__rdy[0][0+:1];
	assign tile__recv_data__val[0][0+:1] = tile__send_data__val[1][1+:1];
	assign send_data_on_boundary_south__msg[0+:35] = tile__send_data__msg[1][70+:35];
	assign tile__send_data__rdy[1][2+:1] = send_data_on_boundary_south__rdy[0+:1];
	assign send_data_on_boundary_south__val[0+:1] = tile__send_data__val[1][2+:1];
	assign tile__recv_data__msg[1][70+:35] = recv_data_on_boundary_south__msg[0+:35];
	assign recv_data_on_boundary_south__rdy[0+:1] = tile__recv_data__rdy[1][2+:1];
	assign tile__recv_data__val[1][2+:1] = recv_data_on_boundary_south__val[0+:1];
	assign send_data_on_boundary_east__msg[35+:35] = tile__send_data__msg[1][0+:35];
	assign tile__send_data__rdy[1][0+:1] = send_data_on_boundary_east__rdy[1+:1];
	assign send_data_on_boundary_east__val[1+:1] = tile__send_data__val[1][0+:1];
	assign tile__recv_data__msg[1][0+:35] = recv_data_on_boundary_east__msg[35+:35];
	assign recv_data_on_boundary_east__rdy[1+:1] = tile__recv_data__rdy[1][0+:1];
	assign tile__recv_data__val[1][0+:1] = recv_data_on_boundary_east__val[1+:1];
	assign data_mem__recv_raddr__msg[7+:7] = tile__to_mem_raddr__msg[1];
	assign tile__to_mem_raddr__rdy[1] = data_mem__recv_raddr__rdy[1+:1];
	assign data_mem__recv_raddr__val[1+:1] = tile__to_mem_raddr__val[1];
	assign tile__from_mem_rdata__msg[1] = data_mem__send_rdata__msg[35+:35];
	assign data_mem__send_rdata__rdy[1+:1] = tile__from_mem_rdata__rdy[1];
	assign tile__from_mem_rdata__val[1] = data_mem__send_rdata__val[1+:1];
	assign data_mem__recv_waddr__msg[7+:7] = tile__to_mem_waddr__msg[1];
	assign tile__to_mem_waddr__rdy[1] = data_mem__recv_waddr__rdy[1+:1];
	assign data_mem__recv_waddr__val[1+:1] = tile__to_mem_waddr__val[1];
	assign data_mem__recv_wdata__msg[35+:35] = tile__to_mem_wdata__msg[1];
	assign tile__to_mem_wdata__rdy[1] = data_mem__recv_wdata__rdy[1+:1];
	assign data_mem__recv_wdata__val[1+:1] = tile__to_mem_wdata__val[1];
	assign tile__recv_data__msg[0][105+:35] = tile__send_data__msg[2][70+:35];
	assign tile__send_data__rdy[2][2+:1] = tile__recv_data__rdy[0][3+:1];
	assign tile__recv_data__val[0][3+:1] = tile__send_data__val[2][2+:1];
	assign tile__recv_data__msg[3][35+:35] = tile__send_data__msg[2][0+:35];
	assign tile__send_data__rdy[2][0+:1] = tile__recv_data__rdy[3][1+:1];
	assign tile__recv_data__val[3][1+:1] = tile__send_data__val[2][0+:1];
	assign send_data_on_boundary_north__msg[35+:35] = tile__send_data__msg[2][105+:35];
	assign tile__send_data__rdy[2][3+:1] = send_data_on_boundary_north__rdy[1+:1];
	assign send_data_on_boundary_north__val[1+:1] = tile__send_data__val[2][3+:1];
	assign tile__recv_data__msg[2][105+:35] = recv_data_on_boundary_north__msg[35+:35];
	assign recv_data_on_boundary_north__rdy[1+:1] = tile__recv_data__rdy[2][3+:1];
	assign tile__recv_data__val[2][3+:1] = recv_data_on_boundary_north__val[1+:1];
	assign send_data_on_boundary_west__msg[0+:35] = tile__send_data__msg[2][35+:35];
	assign tile__send_data__rdy[2][1+:1] = send_data_on_boundary_west__rdy[0+:1];
	assign send_data_on_boundary_west__val[0+:1] = tile__send_data__val[2][1+:1];
	assign tile__recv_data__msg[2][35+:35] = recv_data_on_boundary_west__msg[0+:35];
	assign recv_data_on_boundary_west__rdy[0+:1] = tile__recv_data__rdy[2][1+:1];
	assign tile__recv_data__val[2][1+:1] = recv_data_on_boundary_west__val[0+:1];
	assign data_mem__recv_raddr__msg[0+:7] = tile__to_mem_raddr__msg[2];
	assign tile__to_mem_raddr__rdy[2] = data_mem__recv_raddr__rdy[0+:1];
	assign data_mem__recv_raddr__val[0+:1] = tile__to_mem_raddr__val[2];
	assign tile__from_mem_rdata__msg[2] = data_mem__send_rdata__msg[0+:35];
	assign data_mem__send_rdata__rdy[0+:1] = tile__from_mem_rdata__rdy[2];
	assign tile__from_mem_rdata__val[2] = data_mem__send_rdata__val[0+:1];
	assign data_mem__recv_waddr__msg[0+:7] = tile__to_mem_waddr__msg[2];
	assign tile__to_mem_waddr__rdy[2] = data_mem__recv_waddr__rdy[0+:1];
	assign data_mem__recv_waddr__val[0+:1] = tile__to_mem_waddr__val[2];
	assign data_mem__recv_wdata__msg[0+:35] = tile__to_mem_wdata__msg[2];
	assign tile__to_mem_wdata__rdy[2] = data_mem__recv_wdata__rdy[0+:1];
	assign data_mem__recv_wdata__val[0+:1] = tile__to_mem_wdata__val[2];
	assign tile__recv_data__msg[1][105+:35] = tile__send_data__msg[3][70+:35];
	assign tile__send_data__rdy[3][2+:1] = tile__recv_data__rdy[1][3+:1];
	assign tile__recv_data__val[1][3+:1] = tile__send_data__val[3][2+:1];
	assign tile__recv_data__msg[2][0+:35] = tile__send_data__msg[3][35+:35];
	assign tile__send_data__rdy[3][1+:1] = tile__recv_data__rdy[2][0+:1];
	assign tile__recv_data__val[2][0+:1] = tile__send_data__val[3][1+:1];
	assign send_data_on_boundary_north__msg[0+:35] = tile__send_data__msg[3][105+:35];
	assign tile__send_data__rdy[3][3+:1] = send_data_on_boundary_north__rdy[0+:1];
	assign send_data_on_boundary_north__val[0+:1] = tile__send_data__val[3][3+:1];
	assign tile__recv_data__msg[3][105+:35] = recv_data_on_boundary_north__msg[0+:35];
	assign recv_data_on_boundary_north__rdy[0+:1] = tile__recv_data__rdy[3][3+:1];
	assign tile__recv_data__val[3][3+:1] = recv_data_on_boundary_north__val[0+:1];
	assign send_data_on_boundary_east__msg[0+:35] = tile__send_data__msg[3][0+:35];
	assign tile__send_data__rdy[3][0+:1] = send_data_on_boundary_east__rdy[0+:1];
	assign send_data_on_boundary_east__val[0+:1] = tile__send_data__val[3][0+:1];
	assign tile__recv_data__msg[3][0+:35] = recv_data_on_boundary_east__msg[0+:35];
	assign recv_data_on_boundary_east__rdy[0+:1] = tile__recv_data__rdy[3][0+:1];
	assign tile__recv_data__val[3][0+:1] = recv_data_on_boundary_east__val[0+:1];
	assign tile__to_mem_raddr__rdy[3] = 1'd0;
	assign tile__from_mem_rdata__val[3] = 1'd0;
	assign tile__from_mem_rdata__msg[3] = 35'h000000000;
	assign tile__to_mem_waddr__rdy[3] = 1'd0;
	assign tile__to_mem_wdata__rdy[3] = 1'd0;
endmodule
