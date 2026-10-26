module Queue5_ComputeCntlSignals (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_perform_mul_pre,
	io_enq_bits_perform_single_mul,
	io_enq_bits_perform_single_preload,
	io_enq_bits_a_bank,
	io_enq_bits_b_bank,
	io_enq_bits_d_bank,
	io_enq_bits_a_bank_acc,
	io_enq_bits_b_bank_acc,
	io_enq_bits_d_bank_acc,
	io_enq_bits_a_read_from_acc,
	io_enq_bits_b_read_from_acc,
	io_enq_bits_d_read_from_acc,
	io_enq_bits_a_garbage,
	io_enq_bits_b_garbage,
	io_enq_bits_d_garbage,
	io_enq_bits_accumulate_zeros,
	io_enq_bits_preload_zeros,
	io_enq_bits_a_fire,
	io_enq_bits_b_fire,
	io_enq_bits_d_fire,
	io_enq_bits_a_unpadded_cols,
	io_enq_bits_b_unpadded_cols,
	io_enq_bits_d_unpadded_cols,
	io_enq_bits_c_addr_is_acc_addr,
	io_enq_bits_c_addr_accumulate,
	io_enq_bits_c_addr_read_full_acc_row,
	io_enq_bits_c_addr_norm_cmd,
	io_enq_bits_c_addr_garbage,
	io_enq_bits_c_addr_garbage_bit,
	io_enq_bits_c_addr_data,
	io_enq_bits_c_rows,
	io_enq_bits_c_cols,
	io_enq_bits_a_transpose,
	io_enq_bits_bd_transpose,
	io_enq_bits_total_rows,
	io_enq_bits_rob_id_valid,
	io_enq_bits_rob_id_bits,
	io_enq_bits_dataflow,
	io_enq_bits_prop,
	io_enq_bits_shift,
	io_enq_bits_first,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_perform_single_mul,
	io_deq_bits_perform_single_preload,
	io_deq_bits_a_bank,
	io_deq_bits_b_bank,
	io_deq_bits_d_bank,
	io_deq_bits_a_bank_acc,
	io_deq_bits_b_bank_acc,
	io_deq_bits_d_bank_acc,
	io_deq_bits_a_read_from_acc,
	io_deq_bits_b_read_from_acc,
	io_deq_bits_d_read_from_acc,
	io_deq_bits_a_garbage,
	io_deq_bits_b_garbage,
	io_deq_bits_d_garbage,
	io_deq_bits_accumulate_zeros,
	io_deq_bits_preload_zeros,
	io_deq_bits_a_fire,
	io_deq_bits_b_fire,
	io_deq_bits_d_fire,
	io_deq_bits_a_unpadded_cols,
	io_deq_bits_b_unpadded_cols,
	io_deq_bits_d_unpadded_cols,
	io_deq_bits_c_addr_is_acc_addr,
	io_deq_bits_c_addr_accumulate,
	io_deq_bits_c_addr_read_full_acc_row,
	io_deq_bits_c_addr_garbage_bit,
	io_deq_bits_c_addr_data,
	io_deq_bits_c_rows,
	io_deq_bits_c_cols,
	io_deq_bits_a_transpose,
	io_deq_bits_bd_transpose,
	io_deq_bits_total_rows,
	io_deq_bits_rob_id_valid,
	io_deq_bits_rob_id_bits,
	io_deq_bits_dataflow,
	io_deq_bits_prop,
	io_deq_bits_shift,
	io_deq_bits_im2colling,
	io_deq_bits_first
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input io_enq_bits_perform_mul_pre;
	input io_enq_bits_perform_single_mul;
	input io_enq_bits_perform_single_preload;
	input [1:0] io_enq_bits_a_bank;
	input [1:0] io_enq_bits_b_bank;
	input [1:0] io_enq_bits_d_bank;
	input io_enq_bits_a_bank_acc;
	input io_enq_bits_b_bank_acc;
	input io_enq_bits_d_bank_acc;
	input io_enq_bits_a_read_from_acc;
	input io_enq_bits_b_read_from_acc;
	input io_enq_bits_d_read_from_acc;
	input io_enq_bits_a_garbage;
	input io_enq_bits_b_garbage;
	input io_enq_bits_d_garbage;
	input io_enq_bits_accumulate_zeros;
	input io_enq_bits_preload_zeros;
	input io_enq_bits_a_fire;
	input io_enq_bits_b_fire;
	input io_enq_bits_d_fire;
	input [4:0] io_enq_bits_a_unpadded_cols;
	input [4:0] io_enq_bits_b_unpadded_cols;
	input [4:0] io_enq_bits_d_unpadded_cols;
	input io_enq_bits_c_addr_is_acc_addr;
	input io_enq_bits_c_addr_accumulate;
	input io_enq_bits_c_addr_read_full_acc_row;
	input [2:0] io_enq_bits_c_addr_norm_cmd;
	input [10:0] io_enq_bits_c_addr_garbage;
	input io_enq_bits_c_addr_garbage_bit;
	input [13:0] io_enq_bits_c_addr_data;
	input [4:0] io_enq_bits_c_rows;
	input [4:0] io_enq_bits_c_cols;
	input io_enq_bits_a_transpose;
	input io_enq_bits_bd_transpose;
	input [4:0] io_enq_bits_total_rows;
	input io_enq_bits_rob_id_valid;
	input [5:0] io_enq_bits_rob_id_bits;
	input io_enq_bits_dataflow;
	input io_enq_bits_prop;
	input [4:0] io_enq_bits_shift;
	input io_enq_bits_first;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire io_deq_bits_perform_single_mul;
	output wire io_deq_bits_perform_single_preload;
	output wire [1:0] io_deq_bits_a_bank;
	output wire [1:0] io_deq_bits_b_bank;
	output wire [1:0] io_deq_bits_d_bank;
	output wire io_deq_bits_a_bank_acc;
	output wire io_deq_bits_b_bank_acc;
	output wire io_deq_bits_d_bank_acc;
	output wire io_deq_bits_a_read_from_acc;
	output wire io_deq_bits_b_read_from_acc;
	output wire io_deq_bits_d_read_from_acc;
	output wire io_deq_bits_a_garbage;
	output wire io_deq_bits_b_garbage;
	output wire io_deq_bits_d_garbage;
	output wire io_deq_bits_accumulate_zeros;
	output wire io_deq_bits_preload_zeros;
	output wire io_deq_bits_a_fire;
	output wire io_deq_bits_b_fire;
	output wire io_deq_bits_d_fire;
	output wire [4:0] io_deq_bits_a_unpadded_cols;
	output wire [4:0] io_deq_bits_b_unpadded_cols;
	output wire [4:0] io_deq_bits_d_unpadded_cols;
	output wire io_deq_bits_c_addr_is_acc_addr;
	output wire io_deq_bits_c_addr_accumulate;
	output wire io_deq_bits_c_addr_read_full_acc_row;
	output wire io_deq_bits_c_addr_garbage_bit;
	output wire [13:0] io_deq_bits_c_addr_data;
	output wire [4:0] io_deq_bits_c_rows;
	output wire [4:0] io_deq_bits_c_cols;
	output wire io_deq_bits_a_transpose;
	output wire io_deq_bits_bd_transpose;
	output wire [4:0] io_deq_bits_total_rows;
	output wire io_deq_bits_rob_id_valid;
	output wire [5:0] io_deq_bits_rob_id_bits;
	output wire io_deq_bits_dataflow;
	output wire io_deq_bits_prop;
	output wire [4:0] io_deq_bits_shift;
	output wire io_deq_bits_im2colling;
	output wire io_deq_bits_first;
	wire io_enq_ready_0;
	wire [87:0] _ram_ext_R0_data;
	reg [2:0] enq_ptr_value;
	reg [2:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire empty = ptr_match & ~maybe_full;
	wire do_enq = io_enq_ready_0 & io_enq_valid;
	assign io_enq_ready_0 = io_deq_ready | ~(ptr_match & maybe_full);
	wire do_deq = io_deq_ready & ~empty;
	always @(posedge clock)
		if (reset) begin
			enq_ptr_value <= 3'h0;
			deq_ptr_value <= 3'h0;
			maybe_full <= 1'h0;
		end
		else begin
			if (do_enq)
				if (enq_ptr_value == 3'h4)
					enq_ptr_value <= 3'h0;
				else
					enq_ptr_value <= enq_ptr_value + 3'h1;
			if (do_deq)
				if (deq_ptr_value == 3'h4)
					deq_ptr_value <= 3'h0;
				else
					deq_ptr_value <= deq_ptr_value + 3'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_5x88 ram_ext(
		.R0_addr(deq_ptr_value),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(enq_ptr_value),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_first, 1'h0, io_enq_bits_shift, io_enq_bits_prop, io_enq_bits_dataflow, io_enq_bits_rob_id_bits, io_enq_bits_rob_id_valid, io_enq_bits_total_rows, io_enq_bits_bd_transpose, io_enq_bits_a_transpose, io_enq_bits_c_cols, io_enq_bits_c_rows, io_enq_bits_c_addr_data, io_enq_bits_c_addr_garbage_bit, io_enq_bits_c_addr_read_full_acc_row, io_enq_bits_c_addr_accumulate, io_enq_bits_c_addr_is_acc_addr, io_enq_bits_d_unpadded_cols, io_enq_bits_b_unpadded_cols, io_enq_bits_a_unpadded_cols, io_enq_bits_d_fire, io_enq_bits_b_fire, io_enq_bits_a_fire, io_enq_bits_preload_zeros, io_enq_bits_accumulate_zeros, io_enq_bits_d_garbage, io_enq_bits_b_garbage, io_enq_bits_a_garbage, io_enq_bits_d_read_from_acc, io_enq_bits_b_read_from_acc, io_enq_bits_a_read_from_acc, io_enq_bits_d_bank_acc, io_enq_bits_b_bank_acc, io_enq_bits_a_bank_acc, io_enq_bits_d_bank, io_enq_bits_b_bank, io_enq_bits_a_bank, io_enq_bits_perform_single_preload, io_enq_bits_perform_single_mul})
	);
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_perform_single_mul = _ram_ext_R0_data[0];
	assign io_deq_bits_perform_single_preload = _ram_ext_R0_data[1];
	assign io_deq_bits_a_bank = _ram_ext_R0_data[3:2];
	assign io_deq_bits_b_bank = _ram_ext_R0_data[5:4];
	assign io_deq_bits_d_bank = _ram_ext_R0_data[7:6];
	assign io_deq_bits_a_bank_acc = _ram_ext_R0_data[8];
	assign io_deq_bits_b_bank_acc = _ram_ext_R0_data[9];
	assign io_deq_bits_d_bank_acc = _ram_ext_R0_data[10];
	assign io_deq_bits_a_read_from_acc = _ram_ext_R0_data[11];
	assign io_deq_bits_b_read_from_acc = _ram_ext_R0_data[12];
	assign io_deq_bits_d_read_from_acc = _ram_ext_R0_data[13];
	assign io_deq_bits_a_garbage = _ram_ext_R0_data[14];
	assign io_deq_bits_b_garbage = _ram_ext_R0_data[15];
	assign io_deq_bits_d_garbage = _ram_ext_R0_data[16];
	assign io_deq_bits_accumulate_zeros = _ram_ext_R0_data[17];
	assign io_deq_bits_preload_zeros = _ram_ext_R0_data[18];
	assign io_deq_bits_a_fire = _ram_ext_R0_data[19];
	assign io_deq_bits_b_fire = _ram_ext_R0_data[20];
	assign io_deq_bits_d_fire = _ram_ext_R0_data[21];
	assign io_deq_bits_a_unpadded_cols = _ram_ext_R0_data[26:22];
	assign io_deq_bits_b_unpadded_cols = _ram_ext_R0_data[31:27];
	assign io_deq_bits_d_unpadded_cols = _ram_ext_R0_data[36:32];
	assign io_deq_bits_c_addr_is_acc_addr = _ram_ext_R0_data[37];
	assign io_deq_bits_c_addr_accumulate = _ram_ext_R0_data[38];
	assign io_deq_bits_c_addr_read_full_acc_row = _ram_ext_R0_data[39];
	assign io_deq_bits_c_addr_garbage_bit = _ram_ext_R0_data[40];
	assign io_deq_bits_c_addr_data = _ram_ext_R0_data[54:41];
	assign io_deq_bits_c_rows = _ram_ext_R0_data[59:55];
	assign io_deq_bits_c_cols = _ram_ext_R0_data[64:60];
	assign io_deq_bits_a_transpose = _ram_ext_R0_data[65];
	assign io_deq_bits_bd_transpose = _ram_ext_R0_data[66];
	assign io_deq_bits_total_rows = _ram_ext_R0_data[71:67];
	assign io_deq_bits_rob_id_valid = _ram_ext_R0_data[72];
	assign io_deq_bits_rob_id_bits = _ram_ext_R0_data[78:73];
	assign io_deq_bits_dataflow = _ram_ext_R0_data[79];
	assign io_deq_bits_prop = _ram_ext_R0_data[80];
	assign io_deq_bits_shift = _ram_ext_R0_data[85:81];
	assign io_deq_bits_im2colling = _ram_ext_R0_data[86];
	assign io_deq_bits_first = _ram_ext_R0_data[87];
endmodule
