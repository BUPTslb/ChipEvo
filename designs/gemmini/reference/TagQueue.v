module TagQueue (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_tag_rob_id_valid,
	io_enq_bits_tag_rob_id_bits,
	io_enq_bits_tag_addr_is_acc_addr,
	io_enq_bits_tag_addr_accumulate,
	io_enq_bits_tag_addr_read_full_acc_row,
	io_enq_bits_tag_addr_garbage_bit,
	io_enq_bits_tag_addr_data,
	io_enq_bits_tag_rows,
	io_enq_bits_tag_cols,
	io_enq_bits_id,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_tag_rob_id_valid,
	io_deq_bits_tag_rob_id_bits,
	io_deq_bits_tag_addr_is_acc_addr,
	io_deq_bits_tag_addr_accumulate,
	io_deq_bits_tag_addr_read_full_acc_row,
	io_deq_bits_tag_addr_garbage_bit,
	io_deq_bits_tag_addr_data,
	io_deq_bits_tag_rows,
	io_deq_bits_tag_cols,
	io_deq_bits_id,
	io_all_0_tag_rob_id_valid,
	io_all_0_tag_addr_is_acc_addr,
	io_all_0_tag_addr_accumulate,
	io_all_0_tag_addr_read_full_acc_row,
	io_all_0_tag_addr_garbage_bit,
	io_all_0_tag_addr_data,
	io_all_1_tag_rob_id_valid,
	io_all_1_tag_addr_is_acc_addr,
	io_all_1_tag_addr_accumulate,
	io_all_1_tag_addr_read_full_acc_row,
	io_all_1_tag_addr_garbage_bit,
	io_all_1_tag_addr_data,
	io_all_2_tag_rob_id_valid,
	io_all_2_tag_addr_is_acc_addr,
	io_all_2_tag_addr_accumulate,
	io_all_2_tag_addr_read_full_acc_row,
	io_all_2_tag_addr_garbage_bit,
	io_all_2_tag_addr_data,
	io_all_3_tag_rob_id_valid,
	io_all_3_tag_addr_is_acc_addr,
	io_all_3_tag_addr_accumulate,
	io_all_3_tag_addr_read_full_acc_row,
	io_all_3_tag_addr_garbage_bit,
	io_all_3_tag_addr_data,
	io_all_4_tag_rob_id_valid,
	io_all_4_tag_addr_is_acc_addr,
	io_all_4_tag_addr_accumulate,
	io_all_4_tag_addr_read_full_acc_row,
	io_all_4_tag_addr_garbage_bit,
	io_all_4_tag_addr_data,
	io_all_5_tag_rob_id_valid,
	io_all_5_tag_addr_is_acc_addr,
	io_all_5_tag_addr_accumulate,
	io_all_5_tag_addr_read_full_acc_row,
	io_all_5_tag_addr_garbage_bit,
	io_all_5_tag_addr_data
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input io_enq_bits_tag_rob_id_valid;
	input [5:0] io_enq_bits_tag_rob_id_bits;
	input io_enq_bits_tag_addr_is_acc_addr;
	input io_enq_bits_tag_addr_accumulate;
	input io_enq_bits_tag_addr_read_full_acc_row;
	input io_enq_bits_tag_addr_garbage_bit;
	input [13:0] io_enq_bits_tag_addr_data;
	input [4:0] io_enq_bits_tag_rows;
	input [4:0] io_enq_bits_tag_cols;
	input [2:0] io_enq_bits_id;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire io_deq_bits_tag_rob_id_valid;
	output wire [5:0] io_deq_bits_tag_rob_id_bits;
	output wire io_deq_bits_tag_addr_is_acc_addr;
	output wire io_deq_bits_tag_addr_accumulate;
	output wire io_deq_bits_tag_addr_read_full_acc_row;
	output wire io_deq_bits_tag_addr_garbage_bit;
	output wire [13:0] io_deq_bits_tag_addr_data;
	output wire [4:0] io_deq_bits_tag_rows;
	output wire [4:0] io_deq_bits_tag_cols;
	output wire [2:0] io_deq_bits_id;
	output wire io_all_0_tag_rob_id_valid;
	output wire io_all_0_tag_addr_is_acc_addr;
	output wire io_all_0_tag_addr_accumulate;
	output wire io_all_0_tag_addr_read_full_acc_row;
	output wire io_all_0_tag_addr_garbage_bit;
	output wire [13:0] io_all_0_tag_addr_data;
	output wire io_all_1_tag_rob_id_valid;
	output wire io_all_1_tag_addr_is_acc_addr;
	output wire io_all_1_tag_addr_accumulate;
	output wire io_all_1_tag_addr_read_full_acc_row;
	output wire io_all_1_tag_addr_garbage_bit;
	output wire [13:0] io_all_1_tag_addr_data;
	output wire io_all_2_tag_rob_id_valid;
	output wire io_all_2_tag_addr_is_acc_addr;
	output wire io_all_2_tag_addr_accumulate;
	output wire io_all_2_tag_addr_read_full_acc_row;
	output wire io_all_2_tag_addr_garbage_bit;
	output wire [13:0] io_all_2_tag_addr_data;
	output wire io_all_3_tag_rob_id_valid;
	output wire io_all_3_tag_addr_is_acc_addr;
	output wire io_all_3_tag_addr_accumulate;
	output wire io_all_3_tag_addr_read_full_acc_row;
	output wire io_all_3_tag_addr_garbage_bit;
	output wire [13:0] io_all_3_tag_addr_data;
	output wire io_all_4_tag_rob_id_valid;
	output wire io_all_4_tag_addr_is_acc_addr;
	output wire io_all_4_tag_addr_accumulate;
	output wire io_all_4_tag_addr_read_full_acc_row;
	output wire io_all_4_tag_addr_garbage_bit;
	output wire [13:0] io_all_4_tag_addr_data;
	output wire io_all_5_tag_rob_id_valid;
	output wire io_all_5_tag_addr_is_acc_addr;
	output wire io_all_5_tag_addr_accumulate;
	output wire io_all_5_tag_addr_read_full_acc_row;
	output wire io_all_5_tag_addr_garbage_bit;
	output wire [13:0] io_all_5_tag_addr_data;
	reg regs_0_tag_rob_id_valid;
	reg [5:0] regs_0_tag_rob_id_bits;
	reg regs_0_tag_addr_is_acc_addr;
	reg regs_0_tag_addr_accumulate;
	reg regs_0_tag_addr_read_full_acc_row;
	reg regs_0_tag_addr_garbage_bit;
	reg [13:0] regs_0_tag_addr_data;
	reg [4:0] regs_0_tag_rows;
	reg [4:0] regs_0_tag_cols;
	reg [2:0] regs_0_id;
	reg regs_1_tag_rob_id_valid;
	reg [5:0] regs_1_tag_rob_id_bits;
	reg regs_1_tag_addr_is_acc_addr;
	reg regs_1_tag_addr_accumulate;
	reg regs_1_tag_addr_read_full_acc_row;
	reg regs_1_tag_addr_garbage_bit;
	reg [13:0] regs_1_tag_addr_data;
	reg [4:0] regs_1_tag_rows;
	reg [4:0] regs_1_tag_cols;
	reg [2:0] regs_1_id;
	reg regs_2_tag_rob_id_valid;
	reg [5:0] regs_2_tag_rob_id_bits;
	reg regs_2_tag_addr_is_acc_addr;
	reg regs_2_tag_addr_accumulate;
	reg regs_2_tag_addr_read_full_acc_row;
	reg regs_2_tag_addr_garbage_bit;
	reg [13:0] regs_2_tag_addr_data;
	reg [4:0] regs_2_tag_rows;
	reg [4:0] regs_2_tag_cols;
	reg [2:0] regs_2_id;
	reg regs_3_tag_rob_id_valid;
	reg [5:0] regs_3_tag_rob_id_bits;
	reg regs_3_tag_addr_is_acc_addr;
	reg regs_3_tag_addr_accumulate;
	reg regs_3_tag_addr_read_full_acc_row;
	reg regs_3_tag_addr_garbage_bit;
	reg [13:0] regs_3_tag_addr_data;
	reg [4:0] regs_3_tag_rows;
	reg [4:0] regs_3_tag_cols;
	reg [2:0] regs_3_id;
	reg regs_4_tag_rob_id_valid;
	reg [5:0] regs_4_tag_rob_id_bits;
	reg regs_4_tag_addr_is_acc_addr;
	reg regs_4_tag_addr_accumulate;
	reg regs_4_tag_addr_read_full_acc_row;
	reg regs_4_tag_addr_garbage_bit;
	reg [13:0] regs_4_tag_addr_data;
	reg [4:0] regs_4_tag_rows;
	reg [4:0] regs_4_tag_cols;
	reg [2:0] regs_4_id;
	reg regs_5_tag_rob_id_valid;
	reg [5:0] regs_5_tag_rob_id_bits;
	reg regs_5_tag_addr_is_acc_addr;
	reg regs_5_tag_addr_accumulate;
	reg regs_5_tag_addr_read_full_acc_row;
	reg regs_5_tag_addr_garbage_bit;
	reg [13:0] regs_5_tag_addr_data;
	reg [4:0] regs_5_tag_rows;
	reg [4:0] regs_5_tag_cols;
	reg [2:0] regs_5_id;
	reg [2:0] raddr;
	reg [2:0] waddr;
	reg [2:0] len;
	wire io_enq_ready_0 = len != 3'h6;
	wire [7:0] _GEN = {{regs_0_tag_rob_id_valid}, {regs_0_tag_rob_id_valid}, {regs_5_tag_rob_id_valid}, {regs_4_tag_rob_id_valid}, {regs_3_tag_rob_id_valid}, {regs_2_tag_rob_id_valid}, {regs_1_tag_rob_id_valid}, {regs_0_tag_rob_id_valid}};
	wire [47:0] _GEN_0 = {{regs_0_tag_rob_id_bits}, {regs_0_tag_rob_id_bits}, {regs_5_tag_rob_id_bits}, {regs_4_tag_rob_id_bits}, {regs_3_tag_rob_id_bits}, {regs_2_tag_rob_id_bits}, {regs_1_tag_rob_id_bits}, {regs_0_tag_rob_id_bits}};
	wire [7:0] _GEN_1 = {{regs_0_tag_addr_is_acc_addr}, {regs_0_tag_addr_is_acc_addr}, {regs_5_tag_addr_is_acc_addr}, {regs_4_tag_addr_is_acc_addr}, {regs_3_tag_addr_is_acc_addr}, {regs_2_tag_addr_is_acc_addr}, {regs_1_tag_addr_is_acc_addr}, {regs_0_tag_addr_is_acc_addr}};
	wire [7:0] _GEN_2 = {{regs_0_tag_addr_accumulate}, {regs_0_tag_addr_accumulate}, {regs_5_tag_addr_accumulate}, {regs_4_tag_addr_accumulate}, {regs_3_tag_addr_accumulate}, {regs_2_tag_addr_accumulate}, {regs_1_tag_addr_accumulate}, {regs_0_tag_addr_accumulate}};
	wire [7:0] _GEN_3 = {{regs_0_tag_addr_read_full_acc_row}, {regs_0_tag_addr_read_full_acc_row}, {regs_5_tag_addr_read_full_acc_row}, {regs_4_tag_addr_read_full_acc_row}, {regs_3_tag_addr_read_full_acc_row}, {regs_2_tag_addr_read_full_acc_row}, {regs_1_tag_addr_read_full_acc_row}, {regs_0_tag_addr_read_full_acc_row}};
	wire [7:0] _GEN_4 = {{regs_0_tag_addr_garbage_bit}, {regs_0_tag_addr_garbage_bit}, {regs_5_tag_addr_garbage_bit}, {regs_4_tag_addr_garbage_bit}, {regs_3_tag_addr_garbage_bit}, {regs_2_tag_addr_garbage_bit}, {regs_1_tag_addr_garbage_bit}, {regs_0_tag_addr_garbage_bit}};
	wire [111:0] _GEN_5 = {{regs_0_tag_addr_data}, {regs_0_tag_addr_data}, {regs_5_tag_addr_data}, {regs_4_tag_addr_data}, {regs_3_tag_addr_data}, {regs_2_tag_addr_data}, {regs_1_tag_addr_data}, {regs_0_tag_addr_data}};
	wire [39:0] _GEN_6 = {{regs_0_tag_rows}, {regs_0_tag_rows}, {regs_5_tag_rows}, {regs_4_tag_rows}, {regs_3_tag_rows}, {regs_2_tag_rows}, {regs_1_tag_rows}, {regs_0_tag_rows}};
	wire [39:0] _GEN_7 = {{regs_0_tag_cols}, {regs_0_tag_cols}, {regs_5_tag_cols}, {regs_4_tag_cols}, {regs_3_tag_cols}, {regs_2_tag_cols}, {regs_1_tag_cols}, {regs_0_tag_cols}};
	wire [23:0] _GEN_8 = {{regs_0_id}, {regs_0_id}, {regs_5_id}, {regs_4_id}, {regs_3_id}, {regs_2_id}, {regs_1_id}, {regs_0_id}};
	always @(posedge clock)
		if (~reset & &len) begin
// synopsys translate_off
			$error("Assertion failed\n    at TagQueue.scala:51 assert(len <= entries.U)\n");
// synopsys translate_on
// synopsys translate_off
			$fatal;
// synopsys translate_on
		end
	wire _GEN_9 = io_enq_ready_0 & io_enq_valid;
	wire _GEN_10 = _GEN_9 & (waddr == 3'h0);
	wire _GEN_11 = _GEN_9 & (waddr == 3'h1);
	wire _GEN_12 = _GEN_9 & (waddr == 3'h2);
	wire _GEN_13 = _GEN_9 & (waddr == 3'h3);
	wire _GEN_14 = _GEN_9 & (waddr == 3'h4);
	wire _GEN_15 = _GEN_9 & (waddr == 3'h5);
	wire _GEN_16 = io_deq_ready & |len;
	wire _GEN_17 = reset | (_GEN_16 & (raddr == 3'h0));
	wire _GEN_18 = reset | (_GEN_16 & (raddr == 3'h1));
	wire _GEN_19 = reset | (_GEN_16 & (raddr == 3'h2));
	wire _GEN_20 = reset | (_GEN_16 & (raddr == 3'h3));
	wire _GEN_21 = reset | (_GEN_16 & (raddr == 3'h4));
	wire _GEN_22 = reset | (_GEN_16 & (raddr == 3'h5));
	always @(posedge clock) begin
		regs_0_tag_rob_id_valid <= ~_GEN_17 & (_GEN_10 ? io_enq_bits_tag_rob_id_valid : regs_0_tag_rob_id_valid);
		if (_GEN_10) begin
			regs_0_tag_rob_id_bits <= io_enq_bits_tag_rob_id_bits;
			regs_0_tag_rows <= io_enq_bits_tag_rows;
			regs_0_tag_cols <= io_enq_bits_tag_cols;
			regs_0_id <= io_enq_bits_id;
		end
		regs_0_tag_addr_is_acc_addr <= _GEN_17 | (_GEN_10 ? io_enq_bits_tag_addr_is_acc_addr : regs_0_tag_addr_is_acc_addr);
		regs_0_tag_addr_accumulate <= _GEN_17 | (_GEN_10 ? io_enq_bits_tag_addr_accumulate : regs_0_tag_addr_accumulate);
		regs_0_tag_addr_read_full_acc_row <= _GEN_17 | (_GEN_10 ? io_enq_bits_tag_addr_read_full_acc_row : regs_0_tag_addr_read_full_acc_row);
		regs_0_tag_addr_garbage_bit <= _GEN_17 | (_GEN_10 ? io_enq_bits_tag_addr_garbage_bit : regs_0_tag_addr_garbage_bit);
		if (_GEN_17)
			regs_0_tag_addr_data <= 14'h3fff;
		else if (_GEN_10)
			regs_0_tag_addr_data <= io_enq_bits_tag_addr_data;
		regs_1_tag_rob_id_valid <= ~_GEN_18 & (_GEN_11 ? io_enq_bits_tag_rob_id_valid : regs_1_tag_rob_id_valid);
		if (_GEN_11) begin
			regs_1_tag_rob_id_bits <= io_enq_bits_tag_rob_id_bits;
			regs_1_tag_rows <= io_enq_bits_tag_rows;
			regs_1_tag_cols <= io_enq_bits_tag_cols;
			regs_1_id <= io_enq_bits_id;
		end
		regs_1_tag_addr_is_acc_addr <= _GEN_18 | (_GEN_11 ? io_enq_bits_tag_addr_is_acc_addr : regs_1_tag_addr_is_acc_addr);
		regs_1_tag_addr_accumulate <= _GEN_18 | (_GEN_11 ? io_enq_bits_tag_addr_accumulate : regs_1_tag_addr_accumulate);
		regs_1_tag_addr_read_full_acc_row <= _GEN_18 | (_GEN_11 ? io_enq_bits_tag_addr_read_full_acc_row : regs_1_tag_addr_read_full_acc_row);
		regs_1_tag_addr_garbage_bit <= _GEN_18 | (_GEN_11 ? io_enq_bits_tag_addr_garbage_bit : regs_1_tag_addr_garbage_bit);
		if (_GEN_18)
			regs_1_tag_addr_data <= 14'h3fff;
		else if (_GEN_11)
			regs_1_tag_addr_data <= io_enq_bits_tag_addr_data;
		regs_2_tag_rob_id_valid <= ~_GEN_19 & (_GEN_12 ? io_enq_bits_tag_rob_id_valid : regs_2_tag_rob_id_valid);
		if (_GEN_12) begin
			regs_2_tag_rob_id_bits <= io_enq_bits_tag_rob_id_bits;
			regs_2_tag_rows <= io_enq_bits_tag_rows;
			regs_2_tag_cols <= io_enq_bits_tag_cols;
			regs_2_id <= io_enq_bits_id;
		end
		regs_2_tag_addr_is_acc_addr <= _GEN_19 | (_GEN_12 ? io_enq_bits_tag_addr_is_acc_addr : regs_2_tag_addr_is_acc_addr);
		regs_2_tag_addr_accumulate <= _GEN_19 | (_GEN_12 ? io_enq_bits_tag_addr_accumulate : regs_2_tag_addr_accumulate);
		regs_2_tag_addr_read_full_acc_row <= _GEN_19 | (_GEN_12 ? io_enq_bits_tag_addr_read_full_acc_row : regs_2_tag_addr_read_full_acc_row);
		regs_2_tag_addr_garbage_bit <= _GEN_19 | (_GEN_12 ? io_enq_bits_tag_addr_garbage_bit : regs_2_tag_addr_garbage_bit);
		if (_GEN_19)
			regs_2_tag_addr_data <= 14'h3fff;
		else if (_GEN_12)
			regs_2_tag_addr_data <= io_enq_bits_tag_addr_data;
		regs_3_tag_rob_id_valid <= ~_GEN_20 & (_GEN_13 ? io_enq_bits_tag_rob_id_valid : regs_3_tag_rob_id_valid);
		if (_GEN_13) begin
			regs_3_tag_rob_id_bits <= io_enq_bits_tag_rob_id_bits;
			regs_3_tag_rows <= io_enq_bits_tag_rows;
			regs_3_tag_cols <= io_enq_bits_tag_cols;
			regs_3_id <= io_enq_bits_id;
		end
		regs_3_tag_addr_is_acc_addr <= _GEN_20 | (_GEN_13 ? io_enq_bits_tag_addr_is_acc_addr : regs_3_tag_addr_is_acc_addr);
		regs_3_tag_addr_accumulate <= _GEN_20 | (_GEN_13 ? io_enq_bits_tag_addr_accumulate : regs_3_tag_addr_accumulate);
		regs_3_tag_addr_read_full_acc_row <= _GEN_20 | (_GEN_13 ? io_enq_bits_tag_addr_read_full_acc_row : regs_3_tag_addr_read_full_acc_row);
		regs_3_tag_addr_garbage_bit <= _GEN_20 | (_GEN_13 ? io_enq_bits_tag_addr_garbage_bit : regs_3_tag_addr_garbage_bit);
		if (_GEN_20)
			regs_3_tag_addr_data <= 14'h3fff;
		else if (_GEN_13)
			regs_3_tag_addr_data <= io_enq_bits_tag_addr_data;
		regs_4_tag_rob_id_valid <= ~_GEN_21 & (_GEN_14 ? io_enq_bits_tag_rob_id_valid : regs_4_tag_rob_id_valid);
		if (_GEN_14) begin
			regs_4_tag_rob_id_bits <= io_enq_bits_tag_rob_id_bits;
			regs_4_tag_rows <= io_enq_bits_tag_rows;
			regs_4_tag_cols <= io_enq_bits_tag_cols;
			regs_4_id <= io_enq_bits_id;
		end
		regs_4_tag_addr_is_acc_addr <= _GEN_21 | (_GEN_14 ? io_enq_bits_tag_addr_is_acc_addr : regs_4_tag_addr_is_acc_addr);
		regs_4_tag_addr_accumulate <= _GEN_21 | (_GEN_14 ? io_enq_bits_tag_addr_accumulate : regs_4_tag_addr_accumulate);
		regs_4_tag_addr_read_full_acc_row <= _GEN_21 | (_GEN_14 ? io_enq_bits_tag_addr_read_full_acc_row : regs_4_tag_addr_read_full_acc_row);
		regs_4_tag_addr_garbage_bit <= _GEN_21 | (_GEN_14 ? io_enq_bits_tag_addr_garbage_bit : regs_4_tag_addr_garbage_bit);
		if (_GEN_21)
			regs_4_tag_addr_data <= 14'h3fff;
		else if (_GEN_14)
			regs_4_tag_addr_data <= io_enq_bits_tag_addr_data;
		regs_5_tag_rob_id_valid <= ~_GEN_22 & (_GEN_15 ? io_enq_bits_tag_rob_id_valid : regs_5_tag_rob_id_valid);
		if (_GEN_15) begin
			regs_5_tag_rob_id_bits <= io_enq_bits_tag_rob_id_bits;
			regs_5_tag_rows <= io_enq_bits_tag_rows;
			regs_5_tag_cols <= io_enq_bits_tag_cols;
			regs_5_id <= io_enq_bits_id;
		end
		regs_5_tag_addr_is_acc_addr <= _GEN_22 | (_GEN_15 ? io_enq_bits_tag_addr_is_acc_addr : regs_5_tag_addr_is_acc_addr);
		regs_5_tag_addr_accumulate <= _GEN_22 | (_GEN_15 ? io_enq_bits_tag_addr_accumulate : regs_5_tag_addr_accumulate);
		regs_5_tag_addr_read_full_acc_row <= _GEN_22 | (_GEN_15 ? io_enq_bits_tag_addr_read_full_acc_row : regs_5_tag_addr_read_full_acc_row);
		regs_5_tag_addr_garbage_bit <= _GEN_22 | (_GEN_15 ? io_enq_bits_tag_addr_garbage_bit : regs_5_tag_addr_garbage_bit);
		if (_GEN_22)
			regs_5_tag_addr_data <= 14'h3fff;
		else if (_GEN_15)
			regs_5_tag_addr_data <= io_enq_bits_tag_addr_data;
		if (reset) begin
			raddr <= 3'h0;
			waddr <= 3'h0;
			len <= 3'h0;
		end
		else begin
			if (_GEN_16)
				if (raddr > 3'h4)
					raddr <= ((3'h1 - 3'h5) + raddr) - 3'h1;
				else
					raddr <= raddr + 3'h1;
			if (_GEN_9)
				if (waddr > 3'h4)
					waddr <= ((3'h1 - 3'h5) + waddr) - 3'h1;
				else
					waddr <= waddr + 3'h1;
			if (_GEN_9 & ~_GEN_16)
				len <= len + 3'h1;
			else if (~_GEN_9 & _GEN_16)
				len <= len - 3'h1;
		end
	end
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = |len;
	assign io_deq_bits_tag_rob_id_valid = _GEN[raddr];
	assign io_deq_bits_tag_rob_id_bits = _GEN_0[raddr * 6+:6];
	assign io_deq_bits_tag_addr_is_acc_addr = _GEN_1[raddr];
	assign io_deq_bits_tag_addr_accumulate = _GEN_2[raddr];
	assign io_deq_bits_tag_addr_read_full_acc_row = _GEN_3[raddr];
	assign io_deq_bits_tag_addr_garbage_bit = _GEN_4[raddr];
	assign io_deq_bits_tag_addr_data = _GEN_5[raddr * 14+:14];
	assign io_deq_bits_tag_rows = _GEN_6[raddr * 5+:5];
	assign io_deq_bits_tag_cols = _GEN_7[raddr * 5+:5];
	assign io_deq_bits_id = _GEN_8[raddr * 3+:3];
	assign io_all_0_tag_rob_id_valid = regs_0_tag_rob_id_valid;
	assign io_all_0_tag_addr_is_acc_addr = regs_0_tag_addr_is_acc_addr;
	assign io_all_0_tag_addr_accumulate = regs_0_tag_addr_accumulate;
	assign io_all_0_tag_addr_read_full_acc_row = regs_0_tag_addr_read_full_acc_row;
	assign io_all_0_tag_addr_garbage_bit = regs_0_tag_addr_garbage_bit;
	assign io_all_0_tag_addr_data = regs_0_tag_addr_data;
	assign io_all_1_tag_rob_id_valid = regs_1_tag_rob_id_valid;
	assign io_all_1_tag_addr_is_acc_addr = regs_1_tag_addr_is_acc_addr;
	assign io_all_1_tag_addr_accumulate = regs_1_tag_addr_accumulate;
	assign io_all_1_tag_addr_read_full_acc_row = regs_1_tag_addr_read_full_acc_row;
	assign io_all_1_tag_addr_garbage_bit = regs_1_tag_addr_garbage_bit;
	assign io_all_1_tag_addr_data = regs_1_tag_addr_data;
	assign io_all_2_tag_rob_id_valid = regs_2_tag_rob_id_valid;
	assign io_all_2_tag_addr_is_acc_addr = regs_2_tag_addr_is_acc_addr;
	assign io_all_2_tag_addr_accumulate = regs_2_tag_addr_accumulate;
	assign io_all_2_tag_addr_read_full_acc_row = regs_2_tag_addr_read_full_acc_row;
	assign io_all_2_tag_addr_garbage_bit = regs_2_tag_addr_garbage_bit;
	assign io_all_2_tag_addr_data = regs_2_tag_addr_data;
	assign io_all_3_tag_rob_id_valid = regs_3_tag_rob_id_valid;
	assign io_all_3_tag_addr_is_acc_addr = regs_3_tag_addr_is_acc_addr;
	assign io_all_3_tag_addr_accumulate = regs_3_tag_addr_accumulate;
	assign io_all_3_tag_addr_read_full_acc_row = regs_3_tag_addr_read_full_acc_row;
	assign io_all_3_tag_addr_garbage_bit = regs_3_tag_addr_garbage_bit;
	assign io_all_3_tag_addr_data = regs_3_tag_addr_data;
	assign io_all_4_tag_rob_id_valid = regs_4_tag_rob_id_valid;
	assign io_all_4_tag_addr_is_acc_addr = regs_4_tag_addr_is_acc_addr;
	assign io_all_4_tag_addr_accumulate = regs_4_tag_addr_accumulate;
	assign io_all_4_tag_addr_read_full_acc_row = regs_4_tag_addr_read_full_acc_row;
	assign io_all_4_tag_addr_garbage_bit = regs_4_tag_addr_garbage_bit;
	assign io_all_4_tag_addr_data = regs_4_tag_addr_data;
	assign io_all_5_tag_rob_id_valid = regs_5_tag_rob_id_valid;
	assign io_all_5_tag_addr_is_acc_addr = regs_5_tag_addr_is_acc_addr;
	assign io_all_5_tag_addr_accumulate = regs_5_tag_addr_accumulate;
	assign io_all_5_tag_addr_read_full_acc_row = regs_5_tag_addr_read_full_acc_row;
	assign io_all_5_tag_addr_garbage_bit = regs_5_tag_addr_garbage_bit;
	assign io_all_5_tag_addr_data = regs_5_tag_addr_data;
endmodule
