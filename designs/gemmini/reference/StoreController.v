module StoreController (
	clock,
	reset,
	io_cmd_ready,
	io_cmd_valid,
	io_cmd_bits_cmd_inst_funct,
	io_cmd_bits_cmd_inst_rs2,
	io_cmd_bits_cmd_inst_rs1,
	io_cmd_bits_cmd_inst_xd,
	io_cmd_bits_cmd_inst_xs1,
	io_cmd_bits_cmd_inst_xs2,
	io_cmd_bits_cmd_inst_rd,
	io_cmd_bits_cmd_inst_opcode,
	io_cmd_bits_cmd_rs1,
	io_cmd_bits_cmd_rs2,
	io_cmd_bits_cmd_status_debug,
	io_cmd_bits_cmd_status_cease,
	io_cmd_bits_cmd_status_wfi,
	io_cmd_bits_cmd_status_isa,
	io_cmd_bits_cmd_status_dprv,
	io_cmd_bits_cmd_status_dv,
	io_cmd_bits_cmd_status_prv,
	io_cmd_bits_cmd_status_v,
	io_cmd_bits_cmd_status_sd,
	io_cmd_bits_cmd_status_zero2,
	io_cmd_bits_cmd_status_mpv,
	io_cmd_bits_cmd_status_gva,
	io_cmd_bits_cmd_status_mbe,
	io_cmd_bits_cmd_status_sbe,
	io_cmd_bits_cmd_status_sxl,
	io_cmd_bits_cmd_status_uxl,
	io_cmd_bits_cmd_status_sd_rv32,
	io_cmd_bits_cmd_status_zero1,
	io_cmd_bits_cmd_status_tsr,
	io_cmd_bits_cmd_status_tw,
	io_cmd_bits_cmd_status_tvm,
	io_cmd_bits_cmd_status_mxr,
	io_cmd_bits_cmd_status_sum,
	io_cmd_bits_cmd_status_mprv,
	io_cmd_bits_cmd_status_xs,
	io_cmd_bits_cmd_status_fs,
	io_cmd_bits_cmd_status_mpp,
	io_cmd_bits_cmd_status_vs,
	io_cmd_bits_cmd_status_spp,
	io_cmd_bits_cmd_status_mpie,
	io_cmd_bits_cmd_status_ube,
	io_cmd_bits_cmd_status_spie,
	io_cmd_bits_cmd_status_upie,
	io_cmd_bits_cmd_status_mie,
	io_cmd_bits_cmd_status_hie,
	io_cmd_bits_cmd_status_sie,
	io_cmd_bits_cmd_status_uie,
	io_cmd_bits_rob_id_bits,
	io_cmd_bits_from_matmul_fsm,
	io_cmd_bits_from_conv_fsm,
	io_dma_req_ready,
	io_dma_req_valid,
	io_dma_req_bits_vaddr,
	io_dma_req_bits_laddr_is_acc_addr,
	io_dma_req_bits_laddr_accumulate,
	io_dma_req_bits_laddr_read_full_acc_row,
	io_dma_req_bits_laddr_garbage,
	io_dma_req_bits_laddr_garbage_bit,
	io_dma_req_bits_laddr_data,
	io_dma_req_bits_dest,
	io_dma_req_bits_acc_act,
	io_dma_req_bits_acc_scale,
	io_dma_req_bits_len,
	io_dma_req_bits_block,
	io_dma_req_bits_cmd_id,
	io_dma_req_bits_status_debug,
	io_dma_req_bits_status_cease,
	io_dma_req_bits_status_wfi,
	io_dma_req_bits_status_isa,
	io_dma_req_bits_status_dprv,
	io_dma_req_bits_status_dv,
	io_dma_req_bits_status_prv,
	io_dma_req_bits_status_v,
	io_dma_req_bits_status_sd,
	io_dma_req_bits_status_zero2,
	io_dma_req_bits_status_mpv,
	io_dma_req_bits_status_gva,
	io_dma_req_bits_status_mbe,
	io_dma_req_bits_status_sbe,
	io_dma_req_bits_status_sxl,
	io_dma_req_bits_status_uxl,
	io_dma_req_bits_status_sd_rv32,
	io_dma_req_bits_status_zero1,
	io_dma_req_bits_status_tsr,
	io_dma_req_bits_status_tw,
	io_dma_req_bits_status_tvm,
	io_dma_req_bits_status_mxr,
	io_dma_req_bits_status_sum,
	io_dma_req_bits_status_mprv,
	io_dma_req_bits_status_xs,
	io_dma_req_bits_status_fs,
	io_dma_req_bits_status_mpp,
	io_dma_req_bits_status_vs,
	io_dma_req_bits_status_spp,
	io_dma_req_bits_status_mpie,
	io_dma_req_bits_status_ube,
	io_dma_req_bits_status_spie,
	io_dma_req_bits_status_upie,
	io_dma_req_bits_status_mie,
	io_dma_req_bits_status_hie,
	io_dma_req_bits_status_sie,
	io_dma_req_bits_status_uie,
	io_dma_req_bits_pool_en,
	io_dma_req_bits_store_en,
	io_dma_resp_valid,
	io_dma_resp_bits_cmd_id,
	io_completed_ready,
	io_completed_valid,
	io_completed_bits,
	io_busy,
	io_counter_event_signal_11,
	io_counter_event_signal_12,
	io_counter_event_signal_13,
	io_counter_event_signal_14
);
	input clock;
	input reset;
	output wire io_cmd_ready;
	input io_cmd_valid;
	input [6:0] io_cmd_bits_cmd_inst_funct;
	input [4:0] io_cmd_bits_cmd_inst_rs2;
	input [4:0] io_cmd_bits_cmd_inst_rs1;
	input io_cmd_bits_cmd_inst_xd;
	input io_cmd_bits_cmd_inst_xs1;
	input io_cmd_bits_cmd_inst_xs2;
	input [4:0] io_cmd_bits_cmd_inst_rd;
	input [6:0] io_cmd_bits_cmd_inst_opcode;
	input [63:0] io_cmd_bits_cmd_rs1;
	input [63:0] io_cmd_bits_cmd_rs2;
	input io_cmd_bits_cmd_status_debug;
	input io_cmd_bits_cmd_status_cease;
	input io_cmd_bits_cmd_status_wfi;
	input [31:0] io_cmd_bits_cmd_status_isa;
	input [1:0] io_cmd_bits_cmd_status_dprv;
	input io_cmd_bits_cmd_status_dv;
	input [1:0] io_cmd_bits_cmd_status_prv;
	input io_cmd_bits_cmd_status_v;
	input io_cmd_bits_cmd_status_sd;
	input [22:0] io_cmd_bits_cmd_status_zero2;
	input io_cmd_bits_cmd_status_mpv;
	input io_cmd_bits_cmd_status_gva;
	input io_cmd_bits_cmd_status_mbe;
	input io_cmd_bits_cmd_status_sbe;
	input [1:0] io_cmd_bits_cmd_status_sxl;
	input [1:0] io_cmd_bits_cmd_status_uxl;
	input io_cmd_bits_cmd_status_sd_rv32;
	input [7:0] io_cmd_bits_cmd_status_zero1;
	input io_cmd_bits_cmd_status_tsr;
	input io_cmd_bits_cmd_status_tw;
	input io_cmd_bits_cmd_status_tvm;
	input io_cmd_bits_cmd_status_mxr;
	input io_cmd_bits_cmd_status_sum;
	input io_cmd_bits_cmd_status_mprv;
	input [1:0] io_cmd_bits_cmd_status_xs;
	input [1:0] io_cmd_bits_cmd_status_fs;
	input [1:0] io_cmd_bits_cmd_status_mpp;
	input [1:0] io_cmd_bits_cmd_status_vs;
	input io_cmd_bits_cmd_status_spp;
	input io_cmd_bits_cmd_status_mpie;
	input io_cmd_bits_cmd_status_ube;
	input io_cmd_bits_cmd_status_spie;
	input io_cmd_bits_cmd_status_upie;
	input io_cmd_bits_cmd_status_mie;
	input io_cmd_bits_cmd_status_hie;
	input io_cmd_bits_cmd_status_sie;
	input io_cmd_bits_cmd_status_uie;
	input [5:0] io_cmd_bits_rob_id_bits;
	input io_cmd_bits_from_matmul_fsm;
	input io_cmd_bits_from_conv_fsm;
	input io_dma_req_ready;
	output wire io_dma_req_valid;
	output wire [39:0] io_dma_req_bits_vaddr;
	output wire io_dma_req_bits_laddr_is_acc_addr;
	output wire io_dma_req_bits_laddr_accumulate;
	output wire io_dma_req_bits_laddr_read_full_acc_row;
	output wire [10:0] io_dma_req_bits_laddr_garbage;
	output wire io_dma_req_bits_laddr_garbage_bit;
	output wire [13:0] io_dma_req_bits_laddr_data;
	output wire io_dma_req_bits_dest;
	output wire [2:0] io_dma_req_bits_acc_act;
	output wire [31:0] io_dma_req_bits_acc_scale;
	output wire [15:0] io_dma_req_bits_len;
	output wire [7:0] io_dma_req_bits_block;
	output wire [7:0] io_dma_req_bits_cmd_id;
	output wire io_dma_req_bits_status_debug;
	output wire io_dma_req_bits_status_cease;
	output wire io_dma_req_bits_status_wfi;
	output wire [31:0] io_dma_req_bits_status_isa;
	output wire [1:0] io_dma_req_bits_status_dprv;
	output wire io_dma_req_bits_status_dv;
	output wire [1:0] io_dma_req_bits_status_prv;
	output wire io_dma_req_bits_status_v;
	output wire io_dma_req_bits_status_sd;
	output wire [22:0] io_dma_req_bits_status_zero2;
	output wire io_dma_req_bits_status_mpv;
	output wire io_dma_req_bits_status_gva;
	output wire io_dma_req_bits_status_mbe;
	output wire io_dma_req_bits_status_sbe;
	output wire [1:0] io_dma_req_bits_status_sxl;
	output wire [1:0] io_dma_req_bits_status_uxl;
	output wire io_dma_req_bits_status_sd_rv32;
	output wire [7:0] io_dma_req_bits_status_zero1;
	output wire io_dma_req_bits_status_tsr;
	output wire io_dma_req_bits_status_tw;
	output wire io_dma_req_bits_status_tvm;
	output wire io_dma_req_bits_status_mxr;
	output wire io_dma_req_bits_status_sum;
	output wire io_dma_req_bits_status_mprv;
	output wire [1:0] io_dma_req_bits_status_xs;
	output wire [1:0] io_dma_req_bits_status_fs;
	output wire [1:0] io_dma_req_bits_status_mpp;
	output wire [1:0] io_dma_req_bits_status_vs;
	output wire io_dma_req_bits_status_spp;
	output wire io_dma_req_bits_status_mpie;
	output wire io_dma_req_bits_status_ube;
	output wire io_dma_req_bits_status_spie;
	output wire io_dma_req_bits_status_upie;
	output wire io_dma_req_bits_status_mie;
	output wire io_dma_req_bits_status_hie;
	output wire io_dma_req_bits_status_sie;
	output wire io_dma_req_bits_status_uie;
	output wire io_dma_req_bits_pool_en;
	output wire io_dma_req_bits_store_en;
	input io_dma_resp_valid;
	input [7:0] io_dma_resp_bits_cmd_id;
	input io_completed_ready;
	output wire io_completed_valid;
	output wire [5:0] io_completed_bits;
	output wire io_busy;
	output wire io_counter_event_signal_11;
	output wire io_counter_event_signal_12;
	output wire io_counter_event_signal_13;
	output wire io_counter_event_signal_14;
	wire _cmd_tracker_io_alloc_ready;
	wire _cmd_tracker_io_alloc_bits_cmd_id;
	wire _cmd_tracker_io_busy;
	wire _cmd_q_io_deq_valid;
	wire [6:0] _cmd_q_io_deq_bits_cmd_inst_funct;
	wire [63:0] _cmd_q_io_deq_bits_cmd_rs1;
	wire [63:0] _cmd_q_io_deq_bits_cmd_rs2;
	wire [5:0] _cmd_q_io_deq_bits_rob_id_bits;
	reg [1:0] control_state;
	reg [39:0] stride;
	reg [2:0] activation;
	reg [31:0] acc_scale_bits;
	reg [11:0] row_counter;
	reg [7:0] block_counter;
	reg [1:0] pool_stride;
	reg [1:0] pool_size;
	reg [7:0] pool_out_dim;
	reg [7:0] pool_porows;
	reg [7:0] pool_pocols;
	reg [7:0] pool_orows;
	reg [7:0] pool_ocols;
	reg [1:0] pool_upad;
	reg [1:0] pool_lpad;
	reg [7:0] porow_counter;
	reg [7:0] pocol_counter;
	reg [1:0] wrow_counter;
	reg [1:0] wcol_counter;
	wire mvout_1d_enabled = |pool_size & ~(|pool_stride);
	wire [9:0] _GEN = {8'h00, pool_stride};
	wire [10:0] _GEN_0 = {1'h0, {2'h0, porow_counter} * _GEN};
	wire [10:0] _GEN_1 = {9'h000, wrow_counter};
	wire [10:0] _GEN_2 = {9'h000, pool_upad};
	wire [10:0] _orow_T_2 = (_GEN_0 + _GEN_1) - _GEN_2;
	wire [10:0] _GEN_3 = {1'h0, {2'h0, pocol_counter} * _GEN};
	wire [10:0] _GEN_4 = {9'h000, wcol_counter};
	wire [10:0] _GEN_5 = {9'h000, pool_lpad};
	wire [10:0] _ocol_T_2 = (_GEN_3 + _GEN_4) - _GEN_5;
	wire [14:0] _GEN_6 = {13'h0000, pool_size};
	wire dst_is_spad = _cmd_q_io_deq_bits_cmd_inst_funct == 7'h17;
	wire [6:0] _blocks_T_1 = _cmd_q_io_deq_bits_cmd_rs2[38:32] % 7'h10;
	wire [6:0] _blocks_T_3 = (_cmd_q_io_deq_bits_cmd_rs2[38:32] / 7'h10) + {6'h00, |_blocks_T_1[4:0]};
	wire [39:0] _GEN_7 = {28'h0000000, row_counter};
	wire _GEN_8 = ((((_GEN_0 + _GEN_1) < _GEN_2) | ((_GEN_3 + _GEN_4) < _GEN_5)) | (_orow_T_2 >= {3'h0, pool_orows})) | (_ocol_T_2 >= {3'h0, pool_ocols});
	wire DoConfig = (_cmd_q_io_deq_bits_cmd_inst_funct == 7'h00) & (_cmd_q_io_deq_bits_cmd_rs1[1:0] == 2'h2);
	wire [15:0] mvout_1d_rows = {8'h00, pool_orows} * {8'h00, pool_ocols};
	wire io_counter_event_signal_11_0 = control_state == 2'h1;
	wire _io_dma_req_valid_T_6 = control_state == 2'h2;
	wire io_dma_req_valid_0 = (((((~(|control_state) & _cmd_q_io_deq_valid) & ~DoConfig) & _cmd_tracker_io_alloc_ready) | io_counter_event_signal_11_0) | (_io_dma_req_valid_T_6 & (|block_counter | |row_counter))) | (&control_state & (((|wcol_counter | |wrow_counter) | |pocol_counter) | |porow_counter));
	wire _io_dma_req_bits_vaddr_T = |pool_stride | mvout_1d_enabled;
	wire _GEN_9 = |pool_stride & _GEN_8;
	wire io_dma_req_bits_laddr_read_full_acc_row_0 = _GEN_9 | _cmd_q_io_deq_bits_cmd_rs2[29];
	wire [6:0] _last_block_T = _blocks_T_3 - 7'h01;
	wire [7:0] _GEN_10 = {1'h0, _last_block_T};
	wire [6:0] _io_dma_req_bits_len_T_5 = (_cmd_q_io_deq_bits_cmd_rs2[38:32] - 7'h01) % 7'h10;
	wire [1:0] _last_row_T_26 = pool_size - 2'h1;
	wire _cmd_tracker_io_alloc_valid_T_2 = (~(|control_state) & _cmd_q_io_deq_valid) & ~DoConfig;
	wire _cmd_id_T = _cmd_tracker_io_alloc_valid_T_2 & _cmd_tracker_io_alloc_ready;
	reg cmd_id_buf;
	wire _last_row_T_30 = io_dma_req_ready & io_dma_req_valid_0;
	wire [15:0] _GEN_11 = {4'h0, row_counter};
	wire _GEN_12 = _last_row_T_30 & ~reset;
	always @(posedge clock) begin
		if (~reset & (_cmd_q_io_deq_bits_cmd_rs1[1:0] != _cmd_q_io_deq_bits_cmd_rs1[1:0])) begin
// synopsys translate_off
			$error("Assertion failed\n    at StoreController.scala:123 assert(config_norm_rs1.cmd_type === config_mvout_rs1.cmd_type)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if ((_GEN_12 & io_dma_req_bits_laddr_read_full_acc_row_0) & |_blocks_T_3[6:1]) begin
// synopsys translate_off
			$error("Assertion failed: Block-mvouts are not permitted when moving out full accumulator data\n    at StoreController.scala:225 assert(!(io.dma.req.bits.laddr.read_full_acc_row && blocks > 1.U), \"Block-mvouts are not permitted when moving out full accumulator data\")\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
		if ((_GEN_12 & _io_dma_req_bits_vaddr_T) & |_blocks_T_3[6:1]) begin
// synopsys translate_off
			$error("Assertion failed: Block-mvouts are not permitted when pooling\n    at StoreController.scala:226 assert(!((pooling_is_enabled || mvout_1d_enabled) && blocks > 1.U), \"Block-mvouts are not permitted when pooling\")\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	end
	wire _GEN_13 = control_state == 2'h1;
	wire _GEN_14 = control_state == 2'h2;
	wire _GEN_15 = (((block_counter == _GEN_10) & _last_row_T_30) & (mvout_1d_enabled ? _GEN_11 == (mvout_1d_rows - 16'h0001) : row_counter == {7'h00, _cmd_q_io_deq_bits_cmd_rs2[52:48] - 5'h01})) | ((block_counter == 8'h00) & (row_counter == 12'h000));
	wire last_row_1 = ((((porow_counter == 8'h00) & (pocol_counter == 8'h00)) & (wrow_counter == 2'h0)) & (wcol_counter == 2'h0)) | (((((porow_counter == (pool_porows - 8'h01)) & (pocol_counter == (pool_pocols - 8'h01))) & (wrow_counter == _last_row_T_26)) & (wcol_counter == _last_row_T_26)) & _last_row_T_30);
	wire [15:0] _row_counter_max_T = mvout_1d_rows - 16'h0001;
	wire [11:0] _row_counter_T_35 = row_counter + 12'h001;
	wire [4:0] _row_counter_max_T_1 = _cmd_q_io_deq_bits_cmd_rs2[52:48] - 5'h01;
	wire [7:0] _porow_counter_max_T_1 = pool_porows - 8'h01;
	wire [7:0] _porow_counter_T_29 = pool_pocols - 8'h01;
	wire [7:0] _porow_counter_max_T = pool_orows - 8'h01;
	wire [7:0] _porow_counter_T = pool_ocols - 8'h01;
	always @(posedge clock) begin
		if (reset) begin
			control_state <= 2'h0;
			stride <= 40'h0000000000;
			activation <= 3'h0;
			acc_scale_bits <= 32'h00000000;
			row_counter <= 12'h000;
			block_counter <= 8'h00;
			pool_stride <= 2'h0;
			pool_size <= 2'h0;
			pool_out_dim <= 8'h00;
			pool_porows <= 8'h00;
			pool_pocols <= 8'h00;
			pool_orows <= 8'h00;
			pool_ocols <= 8'h00;
			pool_upad <= 2'h0;
			pool_lpad <= 2'h0;
			porow_counter <= 8'h00;
			pocol_counter <= 8'h00;
			wrow_counter <= 2'h0;
			wcol_counter <= 2'h0;
		end
		else begin
			if (|control_state) begin
				if (_GEN_13) begin
					if (_last_row_T_30)
						control_state <= {1'h1, |pool_stride};
				end
				else if ((_GEN_14 ? _GEN_15 : &control_state & last_row_1))
					control_state <= 2'h0;
			end
			else if ((~_cmd_q_io_deq_valid | DoConfig) | ~(~DoConfig & _cmd_id_T))
				;
			else if (_last_row_T_30)
				control_state <= {1'h1, |pool_stride};
			else
				control_state <= 2'h1;
			if ((~(|control_state) & _cmd_q_io_deq_valid) & DoConfig) begin
				stride <= {8'h00, _cmd_q_io_deq_bits_cmd_rs2[31:0]};
				activation <= {1'h0, _cmd_q_io_deq_bits_cmd_rs1[3:2]};
				pool_stride <= _cmd_q_io_deq_bits_cmd_rs1[5:4];
				pool_size <= _cmd_q_io_deq_bits_cmd_rs1[7:6];
			end
			if (((~(|control_state) & _cmd_q_io_deq_valid) & DoConfig) & (_cmd_q_io_deq_bits_cmd_rs2[63:32] != 32'hffffffff))
				acc_scale_bits <= _cmd_q_io_deq_bits_cmd_rs2[63:32];
			if (_last_row_T_30 & ~(|pool_stride)) begin
				row_counter <= (mvout_1d_enabled ? (_row_counter_max_T == 16'h0000 ? 12'h000 : (_GEN_11 >= (mvout_1d_rows - 16'h0001) ? (12'h001 - (_row_counter_max_T[11:0] - row_counter)) - 12'h001 : _row_counter_T_35)) : (block_counter != _GEN_10 ? row_counter : (_row_counter_max_T_1 == 5'h00 ? 12'h000 : (row_counter >= {7'h00, _cmd_q_io_deq_bits_cmd_rs2[52:48] - 5'h01} ? (12'h001 - ({7'h00, _row_counter_max_T_1} - row_counter)) - 12'h001 : _row_counter_T_35))));
				if (_last_block_T == 7'h00)
					block_counter <= 8'h00;
				else if (block_counter >= {1'h0, _blocks_T_3 - 7'h01})
					block_counter <= (8'h01 - (_GEN_10 - block_counter)) - 8'h01;
				else
					block_counter <= block_counter + 8'h01;
			end
			if (((~(|control_state) & _cmd_q_io_deq_valid) & DoConfig) & (|_cmd_q_io_deq_bits_cmd_rs1[5:4] | |_cmd_q_io_deq_bits_cmd_rs1[7:6])) begin
				pool_out_dim <= _cmd_q_io_deq_bits_cmd_rs1[31:24];
				pool_orows <= _cmd_q_io_deq_bits_cmd_rs1[55:48];
				pool_ocols <= _cmd_q_io_deq_bits_cmd_rs1[63:56];
			end
			if (((~(|control_state) & _cmd_q_io_deq_valid) & DoConfig) & |_cmd_q_io_deq_bits_cmd_rs1[5:4]) begin
				pool_porows <= _cmd_q_io_deq_bits_cmd_rs1[39:32];
				pool_pocols <= _cmd_q_io_deq_bits_cmd_rs1[47:40];
				pool_upad <= _cmd_q_io_deq_bits_cmd_rs1[9:8];
				pool_lpad <= _cmd_q_io_deq_bits_cmd_rs1[11:10];
			end
			if (_last_row_T_30)
				if (|pool_stride) begin
					if (((pocol_counter == _porow_counter_T_29) & (wrow_counter == _last_row_T_26)) & (wcol_counter == _last_row_T_26))
						if (_porow_counter_max_T_1 == 8'h00)
							porow_counter <= 8'h00;
						else if (porow_counter >= (pool_porows - 8'h01))
							porow_counter <= (8'h01 - (_porow_counter_max_T_1 - porow_counter)) - 8'h01;
						else
							porow_counter <= porow_counter + 8'h01;
					if ((wrow_counter == _last_row_T_26) & (wcol_counter == _last_row_T_26))
						if (_porow_counter_T_29 == 8'h00)
							pocol_counter <= 8'h00;
						else if (pocol_counter >= (pool_pocols - 8'h01))
							pocol_counter <= (8'h01 - (_porow_counter_T_29 - pocol_counter)) - 8'h01;
						else
							pocol_counter <= pocol_counter + 8'h01;
				end
				else begin
					if (~mvout_1d_enabled | (pocol_counter != _porow_counter_T))
						;
					else if (_porow_counter_max_T == 8'h00)
						porow_counter <= 8'h00;
					else if (porow_counter >= (pool_orows - 8'h01))
						porow_counter <= (8'h01 - (_porow_counter_max_T - porow_counter)) - 8'h01;
					else
						porow_counter <= porow_counter + 8'h01;
					if (mvout_1d_enabled)
						if (_porow_counter_T == 8'h00)
							pocol_counter <= 8'h00;
						else if (pocol_counter >= (pool_ocols - 8'h01))
							pocol_counter <= (8'h01 - (_porow_counter_T - pocol_counter)) - 8'h01;
						else
							pocol_counter <= pocol_counter + 8'h01;
				end
			if ((~_last_row_T_30 | ~(|pool_stride)) | (wcol_counter != _last_row_T_26))
				;
			else if (_last_row_T_26 == 2'h0)
				wrow_counter <= 2'h0;
			else if (wrow_counter >= (pool_size - 2'h1))
				wrow_counter <= (2'h1 - (_last_row_T_26 - wrow_counter)) - 2'h1;
			else
				wrow_counter <= wrow_counter + 2'h1;
			if (_last_row_T_30 & |pool_stride)
				if (_last_row_T_26 == 2'h0)
					wcol_counter <= 2'h0;
				else if (wcol_counter >= (pool_size - 2'h1))
					wcol_counter <= (2'h1 - (_last_row_T_26 - wcol_counter)) - 2'h1;
				else
					wcol_counter <= wcol_counter + 2'h1;
		end
		if (_cmd_id_T)
			cmd_id_buf <= _cmd_tracker_io_alloc_bits_cmd_id;
	end
	Queue2_GemminiCmd cmd_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(io_cmd_ready),
		.io_enq_valid(io_cmd_valid),
		.io_enq_bits_cmd_inst_funct(io_cmd_bits_cmd_inst_funct),
		.io_enq_bits_cmd_inst_rs2(io_cmd_bits_cmd_inst_rs2),
		.io_enq_bits_cmd_inst_rs1(io_cmd_bits_cmd_inst_rs1),
		.io_enq_bits_cmd_inst_xd(io_cmd_bits_cmd_inst_xd),
		.io_enq_bits_cmd_inst_xs1(io_cmd_bits_cmd_inst_xs1),
		.io_enq_bits_cmd_inst_xs2(io_cmd_bits_cmd_inst_xs2),
		.io_enq_bits_cmd_inst_rd(io_cmd_bits_cmd_inst_rd),
		.io_enq_bits_cmd_inst_opcode(io_cmd_bits_cmd_inst_opcode),
		.io_enq_bits_cmd_rs1(io_cmd_bits_cmd_rs1),
		.io_enq_bits_cmd_rs2(io_cmd_bits_cmd_rs2),
		.io_enq_bits_cmd_status_debug(io_cmd_bits_cmd_status_debug),
		.io_enq_bits_cmd_status_cease(io_cmd_bits_cmd_status_cease),
		.io_enq_bits_cmd_status_wfi(io_cmd_bits_cmd_status_wfi),
		.io_enq_bits_cmd_status_isa(io_cmd_bits_cmd_status_isa),
		.io_enq_bits_cmd_status_dprv(io_cmd_bits_cmd_status_dprv),
		.io_enq_bits_cmd_status_dv(io_cmd_bits_cmd_status_dv),
		.io_enq_bits_cmd_status_prv(io_cmd_bits_cmd_status_prv),
		.io_enq_bits_cmd_status_v(io_cmd_bits_cmd_status_v),
		.io_enq_bits_cmd_status_sd(io_cmd_bits_cmd_status_sd),
		.io_enq_bits_cmd_status_zero2(io_cmd_bits_cmd_status_zero2),
		.io_enq_bits_cmd_status_mpv(io_cmd_bits_cmd_status_mpv),
		.io_enq_bits_cmd_status_gva(io_cmd_bits_cmd_status_gva),
		.io_enq_bits_cmd_status_mbe(io_cmd_bits_cmd_status_mbe),
		.io_enq_bits_cmd_status_sbe(io_cmd_bits_cmd_status_sbe),
		.io_enq_bits_cmd_status_sxl(io_cmd_bits_cmd_status_sxl),
		.io_enq_bits_cmd_status_uxl(io_cmd_bits_cmd_status_uxl),
		.io_enq_bits_cmd_status_sd_rv32(io_cmd_bits_cmd_status_sd_rv32),
		.io_enq_bits_cmd_status_zero1(io_cmd_bits_cmd_status_zero1),
		.io_enq_bits_cmd_status_tsr(io_cmd_bits_cmd_status_tsr),
		.io_enq_bits_cmd_status_tw(io_cmd_bits_cmd_status_tw),
		.io_enq_bits_cmd_status_tvm(io_cmd_bits_cmd_status_tvm),
		.io_enq_bits_cmd_status_mxr(io_cmd_bits_cmd_status_mxr),
		.io_enq_bits_cmd_status_sum(io_cmd_bits_cmd_status_sum),
		.io_enq_bits_cmd_status_mprv(io_cmd_bits_cmd_status_mprv),
		.io_enq_bits_cmd_status_xs(io_cmd_bits_cmd_status_xs),
		.io_enq_bits_cmd_status_fs(io_cmd_bits_cmd_status_fs),
		.io_enq_bits_cmd_status_mpp(io_cmd_bits_cmd_status_mpp),
		.io_enq_bits_cmd_status_vs(io_cmd_bits_cmd_status_vs),
		.io_enq_bits_cmd_status_spp(io_cmd_bits_cmd_status_spp),
		.io_enq_bits_cmd_status_mpie(io_cmd_bits_cmd_status_mpie),
		.io_enq_bits_cmd_status_ube(io_cmd_bits_cmd_status_ube),
		.io_enq_bits_cmd_status_spie(io_cmd_bits_cmd_status_spie),
		.io_enq_bits_cmd_status_upie(io_cmd_bits_cmd_status_upie),
		.io_enq_bits_cmd_status_mie(io_cmd_bits_cmd_status_mie),
		.io_enq_bits_cmd_status_hie(io_cmd_bits_cmd_status_hie),
		.io_enq_bits_cmd_status_sie(io_cmd_bits_cmd_status_sie),
		.io_enq_bits_cmd_status_uie(io_cmd_bits_cmd_status_uie),
		.io_enq_bits_rob_id_valid(1'h1),
		.io_enq_bits_rob_id_bits(io_cmd_bits_rob_id_bits),
		.io_enq_bits_from_matmul_fsm(io_cmd_bits_from_matmul_fsm),
		.io_enq_bits_from_conv_fsm(io_cmd_bits_from_conv_fsm),
		.io_deq_ready((|control_state ? ~_GEN_13 & (_GEN_14 ? _GEN_15 : &control_state & last_row_1) : _cmd_q_io_deq_valid & DoConfig)),
		.io_deq_valid(_cmd_q_io_deq_valid),
		.io_deq_bits_cmd_inst_funct(_cmd_q_io_deq_bits_cmd_inst_funct),
		.io_deq_bits_cmd_rs1(_cmd_q_io_deq_bits_cmd_rs1),
		.io_deq_bits_cmd_rs2(_cmd_q_io_deq_bits_cmd_rs2),
		.io_deq_bits_cmd_status_debug(io_dma_req_bits_status_debug),
		.io_deq_bits_cmd_status_cease(io_dma_req_bits_status_cease),
		.io_deq_bits_cmd_status_wfi(io_dma_req_bits_status_wfi),
		.io_deq_bits_cmd_status_isa(io_dma_req_bits_status_isa),
		.io_deq_bits_cmd_status_dprv(io_dma_req_bits_status_dprv),
		.io_deq_bits_cmd_status_dv(io_dma_req_bits_status_dv),
		.io_deq_bits_cmd_status_prv(io_dma_req_bits_status_prv),
		.io_deq_bits_cmd_status_v(io_dma_req_bits_status_v),
		.io_deq_bits_cmd_status_sd(io_dma_req_bits_status_sd),
		.io_deq_bits_cmd_status_zero2(io_dma_req_bits_status_zero2),
		.io_deq_bits_cmd_status_mpv(io_dma_req_bits_status_mpv),
		.io_deq_bits_cmd_status_gva(io_dma_req_bits_status_gva),
		.io_deq_bits_cmd_status_mbe(io_dma_req_bits_status_mbe),
		.io_deq_bits_cmd_status_sbe(io_dma_req_bits_status_sbe),
		.io_deq_bits_cmd_status_sxl(io_dma_req_bits_status_sxl),
		.io_deq_bits_cmd_status_uxl(io_dma_req_bits_status_uxl),
		.io_deq_bits_cmd_status_sd_rv32(io_dma_req_bits_status_sd_rv32),
		.io_deq_bits_cmd_status_zero1(io_dma_req_bits_status_zero1),
		.io_deq_bits_cmd_status_tsr(io_dma_req_bits_status_tsr),
		.io_deq_bits_cmd_status_tw(io_dma_req_bits_status_tw),
		.io_deq_bits_cmd_status_tvm(io_dma_req_bits_status_tvm),
		.io_deq_bits_cmd_status_mxr(io_dma_req_bits_status_mxr),
		.io_deq_bits_cmd_status_sum(io_dma_req_bits_status_sum),
		.io_deq_bits_cmd_status_mprv(io_dma_req_bits_status_mprv),
		.io_deq_bits_cmd_status_xs(io_dma_req_bits_status_xs),
		.io_deq_bits_cmd_status_fs(io_dma_req_bits_status_fs),
		.io_deq_bits_cmd_status_mpp(io_dma_req_bits_status_mpp),
		.io_deq_bits_cmd_status_vs(io_dma_req_bits_status_vs),
		.io_deq_bits_cmd_status_spp(io_dma_req_bits_status_spp),
		.io_deq_bits_cmd_status_mpie(io_dma_req_bits_status_mpie),
		.io_deq_bits_cmd_status_ube(io_dma_req_bits_status_ube),
		.io_deq_bits_cmd_status_spie(io_dma_req_bits_status_spie),
		.io_deq_bits_cmd_status_upie(io_dma_req_bits_status_upie),
		.io_deq_bits_cmd_status_mie(io_dma_req_bits_status_mie),
		.io_deq_bits_cmd_status_hie(io_dma_req_bits_status_hie),
		.io_deq_bits_cmd_status_sie(io_dma_req_bits_status_sie),
		.io_deq_bits_cmd_status_uie(io_dma_req_bits_status_uie),
		.io_deq_bits_rob_id_bits(_cmd_q_io_deq_bits_rob_id_bits)
	);
	DMACommandTracker_1 cmd_tracker(
		.clock(clock),
		.reset(reset),
		.io_alloc_valid(_cmd_tracker_io_alloc_valid_T_2),
		.io_alloc_ready(_cmd_tracker_io_alloc_ready),
		.io_alloc_bits_tag_rob_id(_cmd_q_io_deq_bits_rob_id_bits),
		.io_alloc_bits_bytes_to_read((|pool_stride ? (({7'h00, pool_porows} * {7'h00, pool_pocols}) * _GEN_6) * _GEN_6 : (mvout_1d_enabled ? mvout_1d_rows[14:0] : {3'h0, {7'h00, _cmd_q_io_deq_bits_cmd_rs2[52:48]} * {5'h00, _blocks_T_3}}))),
		.io_alloc_bits_cmd_id(_cmd_tracker_io_alloc_bits_cmd_id),
		.io_request_returned_valid(io_dma_resp_valid),
		.io_request_returned_bits_cmd_id(io_dma_resp_bits_cmd_id[0]),
		.io_cmd_completed_ready(io_completed_ready),
		.io_cmd_completed_valid(io_completed_valid),
		.io_cmd_completed_bits_tag_rob_id(io_completed_bits),
		.io_busy(_cmd_tracker_io_busy)
	);
	assign io_dma_req_valid = io_dma_req_valid_0;
	assign io_dma_req_bits_vaddr = (dst_is_spad ? {8'h00, _cmd_q_io_deq_bits_cmd_rs1[31:0]} + (_GEN_7 * {8'h00, _cmd_q_io_deq_bits_cmd_rs1[63:32]}) : (_io_dma_req_bits_vaddr_T ? _cmd_q_io_deq_bits_cmd_rs1[39:0] + ({24'h000000, ({8'h00, porow_counter} * {8'h00, pool_out_dim}) + {8'h00, pocol_counter}} * stride) : _cmd_q_io_deq_bits_cmd_rs1[39:0] + (_GEN_7 * stride)));
	assign io_dma_req_bits_laddr_is_acc_addr = _GEN_9 | _cmd_q_io_deq_bits_cmd_rs2[31];
	assign io_dma_req_bits_laddr_accumulate = _GEN_9 | _cmd_q_io_deq_bits_cmd_rs2[30];
	assign io_dma_req_bits_laddr_read_full_acc_row = io_dma_req_bits_laddr_read_full_acc_row_0;
	assign io_dma_req_bits_laddr_garbage = _cmd_q_io_deq_bits_cmd_rs2[25:15];
	assign io_dma_req_bits_laddr_garbage_bit = _GEN_9 | _cmd_q_io_deq_bits_cmd_rs2[14];
	assign io_dma_req_bits_laddr_data = (|pool_stride ? (_GEN_8 ? 14'h3fff : (_cmd_q_io_deq_bits_cmd_rs2[13:0] + ({3'h0, _orow_T_2} * {6'h00, pool_ocols})) + {3'h0, _ocol_T_2}) : _cmd_q_io_deq_bits_cmd_rs2[13:0] + {1'h0, {1'h0, block_counter, 4'h0} + {1'h0, row_counter}});
	assign io_dma_req_bits_dest = dst_is_spad;
	assign io_dma_req_bits_acc_act = activation;
	assign io_dma_req_bits_acc_scale = acc_scale_bits;
	assign io_dma_req_bits_len = {11'h000, (block_counter == _GEN_10 ? _io_dma_req_bits_len_T_5[4:0] + 5'h01 : 5'h10)};
	assign io_dma_req_bits_block = block_counter;
	assign io_dma_req_bits_cmd_id = {7'h00, (_cmd_id_T ? _cmd_tracker_io_alloc_bits_cmd_id : cmd_id_buf)};
	assign io_dma_req_bits_pool_en = |pool_stride & (|wrow_counter | |wcol_counter);
	assign io_dma_req_bits_store_en = (|pool_stride ? (wrow_counter == _last_row_T_26) & (wcol_counter == _last_row_T_26) : block_counter == _GEN_10);
	assign io_busy = _cmd_q_io_deq_valid | _cmd_tracker_io_busy;
	assign io_counter_event_signal_11 = io_counter_event_signal_11_0;
	assign io_counter_event_signal_12 = _io_dma_req_valid_T_6 | &control_state;
	assign io_counter_event_signal_13 = |pool_stride;
	assign io_counter_event_signal_14 = io_dma_req_valid_0 & ~io_dma_req_ready;
endmodule
