module DMACommandTracker (
	clock,
	reset,
	io_alloc_valid,
	io_alloc_ready,
	io_alloc_bits_tag_rob_id,
	io_alloc_bits_bytes_to_read,
	io_alloc_bits_cmd_id,
	io_request_returned_valid,
	io_request_returned_bits_bytes_read,
	io_request_returned_bits_cmd_id,
	io_cmd_completed_ready,
	io_cmd_completed_valid,
	io_cmd_completed_bits_tag_rob_id,
	io_busy
);
	input clock;
	input reset;
	input io_alloc_valid;
	output wire io_alloc_ready;
	input [5:0] io_alloc_bits_tag_rob_id;
	input [10:0] io_alloc_bits_bytes_to_read;
	output wire io_alloc_bits_cmd_id;
	input io_request_returned_valid;
	input [10:0] io_request_returned_bits_bytes_read;
	input io_request_returned_bits_cmd_id;
	input io_cmd_completed_ready;
	output wire io_cmd_completed_valid;
	output wire [5:0] io_cmd_completed_bits_tag_rob_id;
	output wire io_busy;
	reg cmds_0_valid;
	reg [5:0] cmds_0_tag_rob_id;
	reg [10:0] cmds_0_bytes_left;
	reg cmds_1_valid;
	reg [5:0] cmds_1_tag_rob_id;
	reg [10:0] cmds_1_bytes_left;
	wire next_empty_alloc = cmds_0_valid & ~cmds_1_valid;
	wire _io_alloc_ready_T = cmds_0_valid & cmds_1_valid;
	wire _io_cmd_completed_valid_T = cmds_0_bytes_left == 11'h000;
	wire _io_cmd_completed_valid_T_2 = cmds_1_bytes_left == 11'h000;
	wire cmd_completed_id = (~(cmds_0_valid & _io_cmd_completed_valid_T) & cmds_1_valid) & _io_cmd_completed_valid_T_2;
	wire io_cmd_completed_valid_0 = (cmds_0_valid & _io_cmd_completed_valid_T) | (cmds_1_valid & _io_cmd_completed_valid_T_2);
	wire _GEN = (io_request_returned_bits_cmd_id ? cmds_1_valid : cmds_0_valid);
	wire [10:0] _GEN_0 = (io_request_returned_bits_cmd_id ? cmds_1_bytes_left : cmds_0_bytes_left);
	wire _GEN_1 = io_request_returned_valid & ~reset;
	always @(posedge clock) begin
		if (_GEN_1 & ~_GEN) begin
// synopsys translate_off
			$error("Assertion failed\n    at DMACommandTracker.scala:88 assert(cmds(cmd_id).valid)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_1 & (_GEN_0 < io_request_returned_bits_bytes_read)) begin
// synopsys translate_off
			$error("Assertion failed\n    at DMACommandTracker.scala:89 assert(cmds(cmd_id).bytes_left >= io.request_returned.bits.bytes_read)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	end
	wire _GEN_2 = io_alloc_valid & ~_io_alloc_ready_T;
	wire _GEN_3 = _GEN_2 & ~next_empty_alloc;
	wire _GEN_4 = _GEN_2 & next_empty_alloc;
	wire [10:0] _cmds_bytes_left_T = _GEN_0 - io_request_returned_bits_bytes_read;
	wire _GEN_5 = io_cmd_completed_ready & io_cmd_completed_valid_0;
	always @(posedge clock) begin
		if (_GEN_1) begin : assert__assert
			
		end
		cmds_0_valid <= ~(reset | (_GEN_5 & ~cmd_completed_id)) & (_GEN_3 | cmds_0_valid);
		if (_GEN_3)
			cmds_0_tag_rob_id <= io_alloc_bits_tag_rob_id;
		if (io_request_returned_valid & ~io_request_returned_bits_cmd_id)
			cmds_0_bytes_left <= _cmds_bytes_left_T;
		else if (_GEN_3)
			cmds_0_bytes_left <= io_alloc_bits_bytes_to_read;
		cmds_1_valid <= ~(reset | (_GEN_5 & cmd_completed_id)) & (_GEN_4 | cmds_1_valid);
		if (_GEN_4)
			cmds_1_tag_rob_id <= io_alloc_bits_tag_rob_id;
		if (io_request_returned_valid & io_request_returned_bits_cmd_id)
			cmds_1_bytes_left <= _cmds_bytes_left_T;
		else if (_GEN_4)
			cmds_1_bytes_left <= io_alloc_bits_bytes_to_read;
	end
	assign io_alloc_ready = ~_io_alloc_ready_T;
	assign io_alloc_bits_cmd_id = next_empty_alloc;
	assign io_cmd_completed_valid = io_cmd_completed_valid_0;
	assign io_cmd_completed_bits_tag_rob_id = (cmd_completed_id ? cmds_1_tag_rob_id : cmds_0_tag_rob_id);
	assign io_busy = cmds_0_valid | cmds_1_valid;
endmodule
