module TLMonitor_2 (
	clock,
	reset,
	io_in_a_ready,
	io_in_a_valid,
	io_in_a_bits_opcode,
	io_in_a_bits_param,
	io_in_a_bits_size,
	io_in_a_bits_source,
	io_in_a_bits_address,
	io_in_a_bits_mask,
	io_in_a_bits_corrupt,
	io_in_d_ready,
	io_in_d_valid,
	io_in_d_bits_opcode,
	io_in_d_bits_param,
	io_in_d_bits_size,
	io_in_d_bits_source,
	io_in_d_bits_sink,
	io_in_d_bits_denied,
	io_in_d_bits_corrupt
);
	input clock;
	input reset;
	input io_in_a_ready;
	input io_in_a_valid;
	input [2:0] io_in_a_bits_opcode;
	input [2:0] io_in_a_bits_param;
	input [2:0] io_in_a_bits_size;
	input [3:0] io_in_a_bits_source;
	input [31:0] io_in_a_bits_address;
	input [15:0] io_in_a_bits_mask;
	input io_in_a_bits_corrupt;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [1:0] io_in_d_bits_param;
	input [2:0] io_in_d_bits_size;
	input [3:0] io_in_d_bits_source;
	input io_in_d_bits_sink;
	input io_in_d_bits_denied;
	input io_in_d_bits_corrupt;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire [12:0] _GEN = {10'h000, io_in_a_bits_size};
	wire _a_first_T_1 = io_in_a_ready & io_in_a_valid;
	reg [1:0] a_first_counter;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [2:0] size;
	reg [3:0] source;
	reg [31:0] address;
	reg [1:0] d_first_counter;
	reg [2:0] opcode_1;
	reg [1:0] param_1;
	reg [2:0] size_1;
	reg [3:0] source_1;
	reg sink;
	reg denied;
	reg [15:0] inflight;
	reg [63:0] inflight_opcodes;
	reg [63:0] inflight_sizes;
	reg [1:0] a_first_counter_1;
	wire a_first_1 = a_first_counter_1 == 2'h0;
	reg [1:0] d_first_counter_1;
	wire d_first_1 = d_first_counter_1 == 2'h0;
	wire [15:0] _GEN_0 = {12'h000, io_in_a_bits_source};
	wire _GEN_1 = _a_first_T_1 & a_first_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	wire [15:0] _GEN_2 = {12'h000, io_in_d_bits_source};
	reg [31:0] watchdog;
	reg [15:0] inflight_1;
	reg [63:0] inflight_sizes_1;
	reg [1:0] d_first_counter_2;
	wire d_first_2 = d_first_counter_2 == 2'h0;
	reg [31:0] watchdog_1;
	wire [23:0] _GEN_3 = 24'h951240;
	wire [23:0] _GEN_4 = 24'h911240;
	wire [12:0] _is_aligned_mask_T = 13'h003f << _GEN;
	wire [5:0] _GEN_5 = io_in_a_bits_address[5:0] & ~_is_aligned_mask_T[5:0];
	wire mask_sub_sub_sub_0_1 = io_in_a_bits_size[2] | (&io_in_a_bits_size[1:0] & ~io_in_a_bits_address[3]);
	wire mask_sub_sub_sub_1_1 = io_in_a_bits_size[2] | (&io_in_a_bits_size[1:0] & io_in_a_bits_address[3]);
	wire mask_sub_sub_size = io_in_a_bits_size[1:0] == 2'h2;
	wire mask_sub_sub_0_2 = ~io_in_a_bits_address[3] & ~io_in_a_bits_address[2];
	wire mask_sub_sub_0_1 = mask_sub_sub_sub_0_1 | (mask_sub_sub_size & mask_sub_sub_0_2);
	wire mask_sub_sub_1_2 = ~io_in_a_bits_address[3] & io_in_a_bits_address[2];
	wire mask_sub_sub_1_1 = mask_sub_sub_sub_0_1 | (mask_sub_sub_size & mask_sub_sub_1_2);
	wire mask_sub_sub_2_2 = io_in_a_bits_address[3] & ~io_in_a_bits_address[2];
	wire mask_sub_sub_2_1 = mask_sub_sub_sub_1_1 | (mask_sub_sub_size & mask_sub_sub_2_2);
	wire mask_sub_sub_3_2 = io_in_a_bits_address[3] & io_in_a_bits_address[2];
	wire mask_sub_sub_3_1 = mask_sub_sub_sub_1_1 | (mask_sub_sub_size & mask_sub_sub_3_2);
	wire mask_sub_size = io_in_a_bits_size[1:0] == 2'h1;
	wire mask_sub_0_2 = mask_sub_sub_0_2 & ~io_in_a_bits_address[1];
	wire mask_sub_0_1 = mask_sub_sub_0_1 | (mask_sub_size & mask_sub_0_2);
	wire mask_sub_1_2 = mask_sub_sub_0_2 & io_in_a_bits_address[1];
	wire mask_sub_1_1 = mask_sub_sub_0_1 | (mask_sub_size & mask_sub_1_2);
	wire mask_sub_2_2 = mask_sub_sub_1_2 & ~io_in_a_bits_address[1];
	wire mask_sub_2_1 = mask_sub_sub_1_1 | (mask_sub_size & mask_sub_2_2);
	wire mask_sub_3_2 = mask_sub_sub_1_2 & io_in_a_bits_address[1];
	wire mask_sub_3_1 = mask_sub_sub_1_1 | (mask_sub_size & mask_sub_3_2);
	wire mask_sub_4_2 = mask_sub_sub_2_2 & ~io_in_a_bits_address[1];
	wire mask_sub_4_1 = mask_sub_sub_2_1 | (mask_sub_size & mask_sub_4_2);
	wire mask_sub_5_2 = mask_sub_sub_2_2 & io_in_a_bits_address[1];
	wire mask_sub_5_1 = mask_sub_sub_2_1 | (mask_sub_size & mask_sub_5_2);
	wire mask_sub_6_2 = mask_sub_sub_3_2 & ~io_in_a_bits_address[1];
	wire mask_sub_6_1 = mask_sub_sub_3_1 | (mask_sub_size & mask_sub_6_2);
	wire mask_sub_7_2 = mask_sub_sub_3_2 & io_in_a_bits_address[1];
	wire mask_sub_7_1 = mask_sub_sub_3_1 | (mask_sub_size & mask_sub_7_2);
	wire [15:0] mask = {mask_sub_7_1 | (mask_sub_7_2 & io_in_a_bits_address[0]), mask_sub_7_1 | (mask_sub_7_2 & ~io_in_a_bits_address[0]), mask_sub_6_1 | (mask_sub_6_2 & io_in_a_bits_address[0]), mask_sub_6_1 | (mask_sub_6_2 & ~io_in_a_bits_address[0]), mask_sub_5_1 | (mask_sub_5_2 & io_in_a_bits_address[0]), mask_sub_5_1 | (mask_sub_5_2 & ~io_in_a_bits_address[0]), mask_sub_4_1 | (mask_sub_4_2 & io_in_a_bits_address[0]), mask_sub_4_1 | (mask_sub_4_2 & ~io_in_a_bits_address[0]), mask_sub_3_1 | (mask_sub_3_2 & io_in_a_bits_address[0]), mask_sub_3_1 | (mask_sub_3_2 & ~io_in_a_bits_address[0]), mask_sub_2_1 | (mask_sub_2_2 & io_in_a_bits_address[0]), mask_sub_2_1 | (mask_sub_2_2 & ~io_in_a_bits_address[0]), mask_sub_1_1 | (mask_sub_1_2 & io_in_a_bits_address[0]), mask_sub_1_1 | (mask_sub_1_2 & ~io_in_a_bits_address[0]), mask_sub_0_1 | (mask_sub_0_2 & io_in_a_bits_address[0]), mask_sub_0_1 | (mask_sub_0_2 & ~io_in_a_bits_address[0])};
	wire _GEN_6 = (io_in_a_valid & (io_in_a_bits_opcode == 3'h6)) & ~reset;
	wire _GEN_7 = io_in_a_bits_param > 3'h2;
	wire _GEN_8 = io_in_a_bits_mask != 16'hffff;
	wire _GEN_9 = (io_in_a_valid & &io_in_a_bits_opcode) & ~reset;
	wire _GEN_10 = (io_in_a_valid & (io_in_a_bits_opcode == 3'h4)) & ~reset;
	wire _GEN_11 = io_in_a_bits_mask != mask;
	wire _GEN_12 = (io_in_a_valid & (io_in_a_bits_opcode == 3'h0)) & ~reset;
	wire _GEN_13 = (io_in_a_valid & (io_in_a_bits_opcode == 3'h1)) & ~reset;
	wire _GEN_14 = (io_in_a_valid & (io_in_a_bits_opcode == 3'h2)) & ~reset;
	wire _GEN_15 = (io_in_a_valid & (io_in_a_bits_opcode == 3'h3)) & ~reset;
	wire _GEN_16 = (io_in_a_valid & (io_in_a_bits_opcode == 3'h5)) & ~reset;
	wire _GEN_17 = (io_in_d_valid & (io_in_d_bits_opcode == 3'h6)) & ~reset;
	wire _GEN_18 = (io_in_d_valid & (io_in_d_bits_opcode == 3'h4)) & ~reset;
	wire _GEN_19 = io_in_d_bits_param == 2'h2;
	wire _GEN_20 = (io_in_d_valid & (io_in_d_bits_opcode == 3'h5)) & ~reset;
	wire _GEN_21 = ~io_in_d_bits_denied | io_in_d_bits_corrupt;
	wire _GEN_22 = (io_in_d_valid & (io_in_d_bits_opcode == 3'h0)) & ~reset;
	wire _GEN_23 = (io_in_d_valid & (io_in_d_bits_opcode == 3'h1)) & ~reset;
	wire _GEN_24 = (io_in_d_valid & (io_in_d_bits_opcode == 3'h2)) & ~reset;
	wire _GEN_25 = (io_in_a_valid & |a_first_counter) & ~reset;
	wire _GEN_26 = (io_in_d_valid & |d_first_counter) & ~reset;
	wire [63:0] _GEN_27 = {58'h000000000000000, io_in_d_bits_source, 2'h0};
	wire [63:0] _a_opcode_lookup_T_1 = inflight_opcodes >> _GEN_27;
	wire _same_cycle_resp_T_1 = io_in_a_valid & a_first_1;
	wire [15:0] a_set_wo_ready = (_same_cycle_resp_T_1 ? 16'h0001 << _GEN_0 : 16'h0000);
	wire _GEN_28 = io_in_d_valid & d_first_1;
	wire _GEN_29 = _GEN_28 & ~d_release_ack;
	wire same_cycle_resp = _same_cycle_resp_T_1 & (io_in_a_bits_source == io_in_d_bits_source);
	wire _GEN_30 = (_GEN_29 & same_cycle_resp) & ~reset;
	wire _GEN_31 = (_GEN_29 & ~same_cycle_resp) & ~reset;
	wire _GEN_32 = ((io_in_d_valid & d_first_2) & d_release_ack) & ~reset;
	wire [15:0] _GEN_33 = inflight >> _GEN_0;
	wire [15:0] _GEN_34 = inflight >> _GEN_2;
	wire [63:0] _a_size_lookup_T_1 = inflight_sizes >> _GEN_27;
	wire [15:0] _GEN_35 = inflight_1 >> _GEN_2;
	wire [63:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _GEN_27;
	always @(posedge clock) begin
		if (_GEN_6) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_6 & ~io_in_a_bits_size[2]) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_6 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_6 & _GEN_7) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_6 & _GEN_8) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_6 & io_in_a_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquireBlock is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_9) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_9 & ~io_in_a_bits_size[2]) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_9 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_9 & _GEN_7) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_9 & ~(|io_in_a_bits_param)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_9 & _GEN_8) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_9 & io_in_a_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel AcquirePerm is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_10 & &io_in_a_bits_size) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_10 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Get address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_10 & |io_in_a_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Get carries invalid param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_10 & _GEN_11) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Get contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_10 & io_in_a_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Get is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_12 & &io_in_a_bits_size) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_12 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel PutFull address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_12 & |io_in_a_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel PutFull carries invalid param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_12 & _GEN_11) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel PutFull contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_13 & &io_in_a_bits_size) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_13 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel PutPartial address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_13 & |io_in_a_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel PutPartial carries invalid param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_13 & |(io_in_a_bits_mask & ~mask)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel PutPartial contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_14) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_14 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_14 & (io_in_a_bits_param > 3'h4)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_14 & _GEN_11) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_15) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_15 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Logical address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_15 & io_in_a_bits_param[2]) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Logical carries invalid opcode param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_15 & _GEN_11) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Logical contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_16) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_16 & |_GEN_5) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Hint address not aligned to size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_16 & |io_in_a_bits_param[2:1]) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Hint carries invalid opcode param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_16 & _GEN_11) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Hint contains invalid mask (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_16 & io_in_a_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel Hint is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if ((io_in_d_valid & ~reset) & &io_in_d_bits_opcode) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel has invalid opcode (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_17 & ~io_in_d_bits_size[2]) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_17 & |io_in_d_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_17 & io_in_d_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_17 & io_in_d_bits_denied) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel ReleaseAck is denied (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_18) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel Grant carries invalid sink ID (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_18 & ~io_in_d_bits_size[2]) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel Grant smaller than a beat (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_18 & &io_in_d_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel Grant carries invalid cap param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_18 & _GEN_19) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel Grant carries toN param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_18 & io_in_d_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel Grant is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_18 & io_in_d_bits_denied) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel Grant is denied (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_20) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_20 & ~io_in_d_bits_size[2]) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel GrantData smaller than a beat (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_20 & &io_in_d_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_20 & _GEN_19) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel GrantData carries toN param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_20 & ~_GEN_21) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_20 & io_in_d_bits_denied) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel GrantData is denied (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_22 & |io_in_d_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel AccessAck carries invalid param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_22 & io_in_d_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel AccessAck is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_22 & io_in_d_bits_denied) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel AccessAck is denied (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_23 & |io_in_d_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_23 & ~_GEN_21) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_23 & io_in_d_bits_denied) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel AccessAckData is denied (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_24 & |io_in_d_bits_param) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel HintAck carries invalid param (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_24 & io_in_d_bits_corrupt) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel HintAck is corrupt (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_24 & io_in_d_bits_denied) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel HintAck is denied (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_25 & (io_in_a_bits_opcode != opcode)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel opcode changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_25 & (io_in_a_bits_param != param)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel param changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_25 & (io_in_a_bits_size != size)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel size changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_25 & (io_in_a_bits_source != source)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel source changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_25 & (io_in_a_bits_address != address)) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel address changed with multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_26 & (io_in_d_bits_opcode != opcode_1)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_26 & (io_in_d_bits_param != param_1)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel param changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_26 & (io_in_d_bits_size != size_1)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel size changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_26 & (io_in_d_bits_source != source_1)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel source changed within multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_26 & (io_in_d_bits_sink != sink)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel sink changed with multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_26 & (io_in_d_bits_denied != denied)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel denied changed with multibeat operation (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if ((_GEN_1 & ~reset) & _GEN_33[0]) begin
// synopsys translate_off
			$error("Assertion failed: 'A' channel re-used a source ID (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if ((_GEN_29 & ~reset) & ~(_GEN_34[0] | same_cycle_resp)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_30 & ~((io_in_d_bits_opcode == _GEN_4[io_in_a_bits_opcode * 3+:3]) | (io_in_d_bits_opcode == _GEN_3[io_in_a_bits_opcode * 3+:3]))) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel contains improper opcode response (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_30 & (io_in_a_bits_size != io_in_d_bits_size)) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel contains improper response size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_31 & ~((io_in_d_bits_opcode == _GEN_4[_a_opcode_lookup_T_1[3:1] * 3+:3]) | (io_in_d_bits_opcode == _GEN_3[_a_opcode_lookup_T_1[3:1] * 3+:3]))) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel contains improper opcode response (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_31 & (io_in_d_bits_size != _a_size_lookup_T_1[3:1])) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel contains improper response size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if ((((((_GEN_28 & a_first_1) & io_in_a_valid) & (io_in_a_bits_source == io_in_d_bits_source)) & ~d_release_ack) & ~reset) & ~(~io_in_d_ready | io_in_a_ready)) begin
// synopsys translate_off
			$error("Assertion failed: ready check\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (~reset & ~((a_set_wo_ready != (_GEN_29 ? 16'h0001 << _GEN_2 : 16'h0000)) | (a_set_wo_ready == 16'h0000))) begin
// synopsys translate_off
			$error("Assertion failed: 'A' and 'D' concurrent, despite minlatency > 0 (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (~reset & ~(((inflight == 16'h0000) | (_plusarg_reader_out == 32'h00000000)) | (watchdog < _plusarg_reader_out))) begin
// synopsys translate_off
			$error("Assertion failed: TileLink timeout expired (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_32 & ~_GEN_35[0]) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (_GEN_32 & (io_in_d_bits_size != _c_size_lookup_T_1[3:1])) begin
// synopsys translate_off
			$error("Assertion failed: 'D' channel contains improper response size (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:52 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if (~reset & ~(((inflight_1 == 16'h0000) | (_plusarg_reader_1_out == 32'h00000000)) | (watchdog_1 < _plusarg_reader_1_out))) begin
// synopsys translate_off
			$error("Assertion failed: TileLink timeout expired (connected at home/shen/Desktop/project/3D-Bench/external/gemmini/src/main/scala/gemmini/Scratchpad.scala:222:27)\n    at Monitor.scala:45 assert(cond, message)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	end
	wire [12:0] _a_first_beats1_decode_T_3 = 13'h003f << _GEN;
	wire [12:0] _d_first_beats1_decode_T_6 = 13'h003f << io_in_d_bits_size;
	wire [130:0] _GEN_36 = {125'h00000000000000000000000000000000, io_in_a_bits_source, 2'h0};
	wire [142:0] _GEN_37 = {137'h00000000000000000000000000000000000, io_in_d_bits_source, 2'h0};
	wire [142:0] _d_opcodes_clr_T_5 = 143'h00000000000000000000000000000000000f << _GEN_37;
	wire [130:0] _a_opcodes_set_T_1 = {127'h00000000000000000000000000000000, (_GEN_1 ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << _GEN_36;
	wire [142:0] _d_sizes_clr_T_5 = 143'h00000000000000000000000000000000000f << _GEN_37;
	wire [130:0] _a_sizes_set_T_1 = {127'h00000000000000000000000000000000, (_GEN_1 ? {io_in_a_bits_size, 1'h1} : 4'h0)} << _GEN_36;
	wire [142:0] _d_sizes_clr_T_11 = 143'h00000000000000000000000000000000000f << _GEN_37;
	wire _d_first_T_2 = io_in_d_ready & io_in_d_valid;
	wire _GEN_38 = (_d_first_T_2 & d_first_1) & ~d_release_ack;
	wire _GEN_39 = (_d_first_T_2 & d_first_2) & d_release_ack;
	always @(posedge clock) begin
		if (reset) begin
			a_first_counter <= 2'h0;
			d_first_counter <= 2'h0;
			inflight <= 16'h0000;
			inflight_opcodes <= 64'h0000000000000000;
			inflight_sizes <= 64'h0000000000000000;
			a_first_counter_1 <= 2'h0;
			d_first_counter_1 <= 2'h0;
			watchdog <= 32'h00000000;
			inflight_1 <= 16'h0000;
			inflight_sizes_1 <= 64'h0000000000000000;
			d_first_counter_2 <= 2'h0;
			watchdog_1 <= 32'h00000000;
		end
		else begin
			if (_a_first_T_1) begin
				if (|a_first_counter)
					a_first_counter <= a_first_counter - 2'h1;
				else
					a_first_counter <= (io_in_a_bits_opcode[2] ? 2'h0 : ~_a_first_beats1_decode_T_3[5:4]);
				if (a_first_1)
					a_first_counter_1 <= (io_in_a_bits_opcode[2] ? 2'h0 : ~_a_first_beats1_decode_T_3[5:4]);
				else
					a_first_counter_1 <= a_first_counter_1 - 2'h1;
			end
			if (_d_first_T_2) begin
				if (|d_first_counter)
					d_first_counter <= d_first_counter - 2'h1;
				else
					d_first_counter <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[5:4] : 2'h0);
				if (d_first_1)
					d_first_counter_1 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[5:4] : 2'h0);
				else
					d_first_counter_1 <= d_first_counter_1 - 2'h1;
				if (d_first_2)
					d_first_counter_2 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[5:4] : 2'h0);
				else
					d_first_counter_2 <= d_first_counter_2 - 2'h1;
				watchdog_1 <= 32'h00000000;
			end
			else
				watchdog_1 <= watchdog_1 + 32'h00000001;
			inflight <= (inflight | (_GEN_1 ? 16'h0001 << _GEN_0 : 16'h0000)) & ~(_GEN_38 ? 16'h0001 << _GEN_2 : 16'h0000);
			inflight_opcodes <= (inflight_opcodes | (_GEN_1 ? _a_opcodes_set_T_1[63:0] : 64'h0000000000000000)) & ~(_GEN_38 ? _d_opcodes_clr_T_5[63:0] : 64'h0000000000000000);
			inflight_sizes <= (inflight_sizes | (_GEN_1 ? _a_sizes_set_T_1[63:0] : 64'h0000000000000000)) & ~(_GEN_38 ? _d_sizes_clr_T_5[63:0] : 64'h0000000000000000);
			if (_a_first_T_1 | _d_first_T_2)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= inflight_1 & ~(_GEN_39 ? 16'h0001 << _GEN_2 : 16'h0000);
			inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_39 ? _d_sizes_clr_T_11[63:0] : 64'h0000000000000000);
		end
		if (_a_first_T_1 & ~(|a_first_counter)) begin
			opcode <= io_in_a_bits_opcode;
			param <= io_in_a_bits_param;
			size <= io_in_a_bits_size;
			source <= io_in_a_bits_source;
			address <= io_in_a_bits_address;
		end
		if (_d_first_T_2 & ~(|d_first_counter)) begin
			opcode_1 <= io_in_d_bits_opcode;
			param_1 <= io_in_d_bits_param;
			size_1 <= io_in_d_bits_size;
			source_1 <= io_in_d_bits_source;
			sink <= io_in_d_bits_sink;
			denied <= io_in_d_bits_denied;
		end
	end
	plusarg_reader #(
		.DEFAULT(0),
		.FORMAT("tilelink_timeout=%d"),
		.WIDTH(32)
	) plusarg_reader(.out(_plusarg_reader_out));
	plusarg_reader #(
		.DEFAULT(0),
		.FORMAT("tilelink_timeout=%d"),
		.WIDTH(32)
	) plusarg_reader_1(.out(_plusarg_reader_1_out));
endmodule
