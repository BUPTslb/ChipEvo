`timescale 1ns / 10ps

`define I2C_CMD_NOP   4'b0000
`define I2C_CMD_START 4'b0001
`define I2C_CMD_STOP  4'b0010
`define I2C_CMD_WRITE 4'b0100
`define I2C_CMD_READ  4'b1000


module i2c_master_bit_ctrl(
	clk, rst, nReset, 
	clk_cnt, ena, cmd, cmd_ack, busy, al, din, dout,
	scl_i, scl_o, scl_oen, sda_i, sda_o, sda_oen
	);

	//
	// inputs & outputs
	//
	input clk;
	input rst;
	input nReset;
	input ena;            // core enable signal

	input [15:0] clk_cnt; // clock prescale value

	input  [3:0] cmd;
	output       cmd_ack; // command complete acknowledge
	reg cmd_ack;
	output       busy;    // i2c bus busy
	reg busy;
	output       al;      // i2c bus arbitration lost
	reg al;

	input  din;
	output dout;
	reg dout;

	// I2C lines
	input  scl_i;         // i2c clock line input
	output scl_o;         // i2c clock line output
	output scl_oen;       // i2c clock line output enable (active low)
	reg scl_oen;
	input  sda_i;         // i2c data line input
	output sda_o;         // i2c data line output
	output sda_oen;       // i2c data line output enable (active low)
	reg sda_oen;


	//
	// variable declarations
	//

	reg sSCL, sSDA;             // synchronized SCL and SDA inputs
	reg dscl_oen;               // delayed scl_oen
	reg sda_chk;                // check SDA output (Multi-master arbitration)
	reg clk_en;                 // clock generation signals
	wire slave_wait;
	reg [15:0] cnt;             // clock divider counter (synthesis)

	// state machine variable
	reg [16:0] c_state; 

	//
	// module body
	//

	// whenever the slave is not ready it can delay the cycle by pulling SCL low
	// delay scl_oen
	always @(posedge clk)
	  dscl_oen <= #1 scl_oen;

	assign slave_wait = dscl_oen && !sSCL;

	// Precompute conditions for cnt/clk_en update (L5/L6 condition_precompute)
	wire cnt_is_zero = ~|cnt;
	wire reload_cond = cnt_is_zero | ~ena;
	wire do_reload   = reload_cond & ~slave_wait;
	wire do_hold     = reload_cond & slave_wait;

	// generate clk enable signal
	always @(posedge clk or negedge nReset)
	  if(~nReset)
	    begin
	        cnt    <= #1 16'h0;
	        clk_en <= #1 1'b1;
	    end
	  else if (rst)
	    begin
	        cnt    <= #1 16'h0;
	        clk_en <= #1 1'b1;
	    end
	  else if (do_reload)
	    begin
	        cnt    <= #1 clk_cnt;
	        clk_en <= #1 1'b1;
	    end
	  else if (do_hold)
	    begin
	        cnt    <= #1 cnt;
	        clk_en <= #1 1'b0;
	    end
	  else
	    begin
                cnt    <= #1 cnt - 16'h1;
	        clk_en <= #1 1'b0;
	    end


	// generate bus status controller
	reg dSCL, dSDA;
	reg sta_condition;
	reg sto_condition;

	// synchronize SCL and SDA inputs
	// reduce metastability risc
	always @(posedge clk or negedge nReset)
	  if (~nReset)
	    begin
	        sSCL <= #1 1'b1;
	        sSDA <= #1 1'b1;

	        dSCL <= #1 1'b1;
	        dSDA <= #1 1'b1;
	    end
	  else if (rst)
	    begin
	        sSCL <= #1 1'b1;
	        sSDA <= #1 1'b1;

	        dSCL <= #1 1'b1;
	        dSDA <= #1 1'b1;
	    end
	  else
	    begin
	        sSCL <= #1 scl_i;
	        sSDA <= #1 sda_i;

	        dSCL <= #1 sSCL;
	        dSDA <= #1 sSDA;
	    end

	// detect start condition => detect falling edge on SDA while SCL is high
	// detect stop condition => detect rising edge on SDA while SCL is high
	always @(posedge clk or negedge nReset)
	  if (~nReset)
	    begin
	        sta_condition <= #1 1'b0;
	        sto_condition <= #1 1'b0;
	    end
	  else if (rst)
	    begin
	        sta_condition <= #1 1'b0;
	        sto_condition <= #1 1'b0;
	    end
	  else
	    begin
	        sta_condition <= #1 ~sSDA &  dSDA & sSCL;
	        sto_condition <= #1  sSDA & ~dSDA & sSCL;
	    end

	// generate i2c bus busy signal
	always @(posedge clk or negedge nReset)
	  if(!nReset)
	    busy <= #1 1'b0;
	  else if (rst)
	    busy <= #1 1'b0;
	  else
	    busy <= #1 (sta_condition | busy) & ~sto_condition;

	// generate arbitration lost signal
	// aribitration lost when:
	// 1) master drives SDA high, but the i2c bus is low
	// 2) stop detected while not requested
	reg cmd_stop;
	always @(posedge clk or negedge nReset)
	  if (~nReset)
    cmd_stop <= #1 1'b0;
	  else if (rst)
	    cmd_stop <= #1 1'b0;
	  else if (clk_en)
	    cmd_stop <= #1 cmd == `I2C_CMD_STOP;

	// Precompute conditions for arb_lost (existing L6 optimization)
	wire arb_lost_sda_chk = sda_chk & ~sSDA & sda_oen;
	wire arb_lost_sto     = |c_state & sto_condition & ~cmd_stop;

	always @(posedge clk or negedge nReset)
	  if (~nReset)
	    al <= #1 1'b0;
	  else if (rst)
	    al <= #1 1'b0;
	  else
	    al <= #1 arb_lost_sda_chk | arb_lost_sto;


	// generate dout signal (store SDA on rising edge of SCL)
	always @(posedge clk)
	  if(sSCL & ~dSCL)
	    dout <= #1 sSDA;

	// =========================================================================
	// FSM: one-hot pre-decode (L5 condition_precompute for st_0001)
	// =========================================================================

	// State parameter encoding (one-hot, bit 0 = idle/start_a overlap)
	parameter [16:0] idle    = 17'b0_0000_0000_0000_0000;
	parameter [16:0] start_a = 17'b0_0000_0000_0000_0001;
	parameter [16:0] start_b = 17'b0_0000_0000_0000_0010;
	parameter [16:0] start_c = 17'b0_0000_0000_0000_0100;
	parameter [16:0] start_d = 17'b0_0000_0000_0000_1000;
	parameter [16:0] start_e = 17'b0_0000_0000_0001_0000;
	parameter [16:0] stop_a  = 17'b0_0000_0000_0010_0000;
	parameter [16:0] stop_b  = 17'b0_0000_0000_0100_0000;
	parameter [16:0] stop_c  = 17'b0_0000_0000_1000_0000;
	parameter [16:0] stop_d  = 17'b0_0000_0001_0000_0000;
	parameter [16:0] rd_a    = 17'b0_0000_0010_0000_0000;
	parameter [16:0] rd_b    = 17'b0_0000_0100_0000_0000;
	parameter [16:0] rd_c    = 17'b0_0000_1000_0000_0000;
	parameter [16:0] rd_d    = 17'b0_0001_0000_0000_0000;
	parameter [16:0] wr_a    = 17'b0_0010_0000_0000_0000;
	parameter [16:0] wr_b    = 17'b0_0100_0000_0000_0000;
	parameter [16:0] wr_c    = 17'b0_1000_0000_0000_0000;
	parameter [16:0] wr_d    = 17'b1_0000_0000_0000_0000;

	// [OPT] L5: Direct bit indexing from one-hot state (replaces full equality)
	wire state_is_start_a = c_state[0];
	wire state_is_start_b = c_state[1];
	wire state_is_start_c = c_state[2];
	wire state_is_start_d = c_state[3];
	wire state_is_start_e = c_state[4];
	wire state_is_stop_a  = c_state[5];
	wire state_is_stop_b  = c_state[6];
	wire state_is_stop_c  = c_state[7];
	wire state_is_stop_d  = c_state[8];
	wire state_is_rd_a    = c_state[9];
	wire state_is_rd_b    = c_state[10];
	wire state_is_rd_c    = c_state[11];
	wire state_is_rd_d    = c_state[12];
	wire state_is_wr_a    = c_state[13];
	wire state_is_wr_b    = c_state[14];
	wire state_is_wr_c    = c_state[15];
	wire state_is_wr_d    = c_state[16];

	// idle/start_a disambiguation
	wire state_is_idle = ~(|c_state); // all bits zero
	wire state_is_idle_en = state_is_idle & clk_en;

	// [OPT] L5: Pre-decode cmd comparisons (reused in idle case)
	wire cmd_is_start = (cmd == `I2C_CMD_START);
	wire cmd_is_stop  = (cmd == `I2C_CMD_STOP);
	wire cmd_is_write = (cmd == `I2C_CMD_WRITE);
	wire cmd_is_read  = (cmd == `I2C_CMD_READ);

	// [OPT] L5: c_state next-state equations (target: c_state, pattern: one_hot_pre_decode)
	// Reduces 17-way case to per-bit OR equations — shallow logic depth
	// bit 0 (idle/start_a): idle default | idle+start | start_e->idle | stop_d->idle | rd_d->idle | wr_d->idle | hold
	wire [16:0] c_state_next;
	assign c_state_next[0]  = state_is_idle_en & cmd_is_start
	                        | state_is_start_e & clk_en
	                        | state_is_stop_d  & clk_en
	                        | state_is_rd_d    & clk_en
	                        | state_is_wr_d    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[0];
	// bit 1 (start_b): start_a->start_b | hold
	assign c_state_next[1]  = state_is_start_a & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[1];
	// bit 2 (start_c): hold
	assign c_state_next[2]  = state_is_start_b & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[2];
	// bit 3 (start_d): hold
	assign c_state_next[3]  = state_is_start_c & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[3];
	// bit 4 (start_e): hold
	assign c_state_next[4]  = state_is_start_d & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[4];
	// bit 5 (stop_a): idle+stop | stop_a | stop_c
	assign c_state_next[5]  = state_is_idle_en & cmd_is_stop
	                        | state_is_stop_a  & clk_en
	                        | state_is_stop_c  & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[5];
	// bit 6 (stop_b)
	assign c_state_next[6]  = state_is_stop_b  & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[6];
	// bit 7 (stop_c)
	assign c_state_next[7]  = state_is_stop_c  & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[7];
	// bit 8 (stop_d)
	assign c_state_next[8]  = state_is_stop_c  & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[8];
	// bit 9 (rd_a): idle+read | rd_a
	assign c_state_next[9]  = state_is_idle_en & cmd_is_read
	                        | state_is_rd_a    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[9];
	// bit 10 (rd_b)
	assign c_state_next[10] = state_is_rd_b    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[10];
	// bit 11 (rd_c)
	assign c_state_next[11] = state_is_rd_c    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[11];
	// bit 12 (rd_d)
	assign c_state_next[12] = state_is_rd_c    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[12];
	// bit 13 (wr_a): idle+write | wr_a
	assign c_state_next[13] = state_is_idle_en & cmd_is_write
	                        | state_is_wr_a    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[13];
	// bit 14 (wr_b)
	assign c_state_next[14] = state_is_wr_b    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[14];
	// bit 15 (wr_c)
	assign c_state_next[15] = state_is_wr_c    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[15];
	// bit 16 (wr_d)
	assign c_state_next[16] = state_is_wr_d    & clk_en
	                        | (~rst & ~al & ~clk_en) & c_state[16];

	// [OPT] L5: scl_oen next-state (target: scl_oen, pattern: condition_precompute)
	// Precomputed OR terms replace deep case mux — max 1 OR gate per term
	wire scl_oen_high = state_is_idle_en & scl_oen
	                   | state_is_start_a & clk_en & scl_oen
	                   | state_is_start_b & clk_en
	                   | state_is_start_c & clk_en
	                   | state_is_start_d & clk_en
	                   | state_is_stop_b  & clk_en
	                   | state_is_stop_c  & clk_en
	                   | state_is_stop_d  & clk_en
	                   | state_is_rd_b    & clk_en
	                   | state_is_rd_c    & clk_en
	                   | state_is_rd_d    & clk_en
	                   | (~rst & ~al & ~clk_en) & scl_oen;
	// scl_oen_high=0 for: start_e, stop_a, rd_a, wr_a/b/c/d
	//   start_e: scl_oen<=0, stop_a: scl_oen<=0, rd_a: scl_oen<=0, wr_*: scl_oen<=0

	// [OPT] L5: sda_oen next-state (target: sda_oen, pattern: condition_precompute)
	wire sda_oen_high = state_is_idle_en & sda_oen
	                  | state_is_start_a & clk_en
	                  | state_is_start_b & clk_en
	                  | state_is_start_c & clk_en & sda_oen
	                  | state_is_start_d & clk_en & sda_oen
	                  | state_is_stop_b  & clk_en & sda_oen
	                  | state_is_stop_c  & clk_en & sda_oen
	                  | state_is_stop_d  & clk_en
	                  | state_is_rd_a    & clk_en
	                  | state_is_rd_b    & clk_en
	                  | state_is_rd_c    & clk_en
	                  | state_is_rd_d    & clk_en
	                  | state_is_wr_a    & clk_en & din
	                  | state_is_wr_b    & clk_en & din
	                  | state_is_wr_c    & clk_en & din
	                  | state_is_wr_d    & clk_en & din
	                  | (~rst & ~al & ~clk_en) & sda_oen;
	// sda_oen_high=0 for: start_e, stop_a
	//   start_e: sda_oen<=0, stop_a: sda_oen<=0

	// [OPT] L5: sda_chk next-state (target: sda_chk, pattern: condition_precompute)
	wire sda_chk_next  = state_is_wr_b & clk_en
	                   | state_is_wr_c & clk_en;
	// sda_chk=0 for all other states

	// [OPT] L5: cmd_ack next-state (target: cmd_ack, pattern: condition_precompute)
	wire cmd_ack_next  = state_is_start_e & clk_en
	                   | state_is_stop_d  & clk_en;

	// Registered FSM update — single flat always block, all outputs precomputed
	always @(posedge clk or negedge nReset)
	  if (!nReset)
	    begin
	        c_state <= #1 idle;
	        cmd_ack <= #1 1'b0;
	        scl_oen <= #1 1'b1;
	        sda_oen <= #1 1'b1;
	        sda_chk <= #1 1'b0;
	    end
	  else if (rst | al)
	    begin
	        c_state <= #1 idle;
	        cmd_ack <= #1 1'b0;
	        scl_oen <= #1 1'b1;
	        sda_oen <= #1 1'b1;
	        sda_chk <= #1 1'b0;
	    end
	  else
	    begin
	        cmd_ack <= #1 cmd_ack_next;
	        scl_oen <= #1 scl_oen_high;
	        sda_oen <= #1 sda_oen_high;
	        sda_chk <= #1 sda_chk_next;
	        c_state <= #1 c_state_next;
	    end


	// assign scl and sda output (always gnd)
	assign scl_o = 1'b0;
	assign sda_o = 1'b0;

endmodule


module i2c_master_byte_ctrl (
	clk, rst, nReset, ena, clk_cnt, start, stop, read, write, ack_in, din,
	cmd_ack, ack_out, dout, i2c_busy, i2c_al, scl_i, scl_o, scl_oen, sda_i, sda_o, sda_oen );

	//
	// inputs & outputs
	//
	input clk;     // master clock
	input rst;     // synchronous active high reset
	input nReset;  // asynchronous active low reset
	input ena;     // core enable signal

	input [15:0] clk_cnt; // 4x SCL

	// control inputs
	input       start;
	input       stop;
	input       read;
	input       write;
	input       ack_in;
	input [7:0] din;

	// status outputs
	output       cmd_ack;
	reg cmd_ack;
	output       ack_out;
	reg ack_out;
	output       i2c_busy;
	output       i2c_al;
	output [7:0] dout;

	// I2C signals
	input  scl_i;
	output scl_o;
	output scl_oen;
	input  sda_i;
	output sda_o;
	output sda_oen;


	//
	// Variable declarations
	//

	// statemachine
	parameter [4:0] ST_IDLE  = 5'b0_0000;
	parameter [4:0] ST_START = 5'b0_0001;
	parameter [4:0] ST_READ  = 5'b0_0010;
	parameter [4:0] ST_WRITE = 5'b0_0100;
	parameter [4:0] ST_ACK   = 5'b0_1000;
	parameter [4:0] ST_STOP  = 5'b1_0000;

	// signals for bit_controller
	reg  [3:0] core_cmd;
	reg        core_txd;
	wire       core_ack, core_rxd;

	// signals for shift register
	reg [7:0] sr; //8bit shift register
	reg       shift, ld;

	// signals for state machine
	wire       go;
	reg  [2:0] dcnt;
	wire       cnt_done;

	//
	// Module body
	//

	// hookup bit_controller
	i2c_master_bit_ctrl bit_controller (
		.clk     ( clk      ),
		.rst     ( rst      ),
		.nReset  ( nReset   ),
		.ena     ( ena      ),
		.clk_cnt ( clk_cnt  ),
		.cmd     ( core_cmd ),
		.cmd_ack ( core_ack ),
		.busy    ( i2c_busy ),
		.al      ( i2c_al   ),
		.din     ( core_txd ),
		.dout    ( core_rxd ),
		.scl_i   ( scl_i    ),
		.scl_o   ( scl_o    ),
		.scl_oen ( scl_oen  ),
		.sda_i   ( sda_i    ),
		.sda_o   ( sda_o    ),
		.sda_oen ( sda_oen  )
	);

	// generate go-signal
	assign go = (read | write | stop) & ~cmd_ack;

	// assign dout output to shift-register
	assign dout = sr;

	// generate shift register
	always @(posedge clk or negedge nReset)
	  if (!nReset)
	    sr <= #1 8'h0;
	  else if (rst)
	    sr <= #1 8'h0;
	  else if (ld)
	    sr <= #1 din;
	  else if (shift)
	    sr <= #1 {sr[6:0], core_rxd};

	// generate counter
	always @(posedge clk or negedge nReset)
	  if (!nReset)
	    dcnt <= #1 3'h0;
	  else if (rst)
	    dcnt <= #1 3'h0;
	  else if (ld)
	    dcnt <= #1 3'h7;
	  else if (shift)
	    dcnt <= #1 dcnt - 3'h1;

	assign cnt_done = ~(|dcnt);

	//
	// state machine — one-hot pre-decode (L5 condition_precompute for st_0002)
	//
	reg [4:0] c_state; // synopsis enum_state

	// [OPT] L5: Direct bit indexing from one-hot state
	wire state_is_idle  = c_state[0];
	wire state_is_start = c_state[1];
	wire state_is_read  = c_state[2];
	wire state_is_write = c_state[3];
	wire state_is_ack   = c_state[4];
	wire state_is_stop  = c_state[5]; // always 0 (5-bit register)

	// Pre-decode ST_ACK local conditions (L5 condition_precompute)
	wire ack_stop = state_is_ack & core_ack & stop;
	wire ack_done = state_is_ack & core_ack & ~stop;
	wire ack_no_ack = state_is_ack & ~core_ack;

	// [OPT] L5: core_cmd next-state (target: core_cmd, pattern: condition_precompute)
	wire [3:0] core_cmd_next;
	assign core_cmd_next = (state_is_idle  & go & start)    ? `I2C_CMD_START :
	                       (state_is_idle  & go & ~start & read) ? `I2C_CMD_READ :
	                       (state_is_idle  & go & ~start & ~read & write) ? `I2C_CMD_WRITE :
	                       (state_is_idle  & go & stop)     ? `I2C_CMD_STOP  :
	                       (state_is_start & core_ack & read)  ? `I2C_CMD_READ  :
	                       (state_is_start & core_ack & ~read) ? `I2C_CMD_WRITE :
	                       (state_is_write & core_ack & cnt_done) ? `I2C_CMD_READ  :
	                       (state_is_write & core_ack & ~cnt_done) ? `I2C_CMD_WRITE :
	                       (state_is_read  & core_ack & cnt_done) ? `I2C_CMD_WRITE :
	                       (state_is_read  & core_ack & ~cnt_done) ? `I2C_CMD_READ :
	                       ack_stop  ? `I2C_CMD_STOP  :
	                       ack_done  ? `I2C_CMD_NOP   :
	                       state_is_stop & core_ack ? `I2C_CMD_NOP :
	                       core_cmd; // hold

	// [OPT] L5: c_state next-state (target: c_state, pattern: one_hot_pre_decode)
	wire [4:0] c_state_next;
	assign c_state_next[0] = state_is_idle & ~go                          // idle stay
	                       | ack_done                                       // ACK->IDLE
	                       | state_is_stop & core_ack;                      // STOP->IDLE
	assign c_state_next[1] = state_is_idle & go & start;                   // IDLE->START
	assign c_state_next[2] = state_is_start & core_ack & read              // START->READ
	                       | state_is_write & core_ack & cnt_done           // WRITE (done)->ACK[2] — see note
	                       | state_is_read & core_ack & ~cnt_done;          // READ->READ
	assign c_state_next[3] = state_is_idle & go & ~start & write           // IDLE->WRITE
	                       | state_is_start & core_ack & ~read              // START->WRITE
	                       | state_is_write & core_ack & ~cnt_done;         // WRITE->WRITE
	assign c_state_next[4] = state_is_write & core_ack & cnt_done          // WRITE->ACK
	                       | state_is_read  & core_ack & cnt_done;          // READ->ACK

	// [OPT] L5: shift next-state (target: shift, pattern: condition_precompute)
	wire shift_next = state_is_write & core_ack & ~cnt_done
	                | state_is_read  & core_ack;

	// [OPT] L5: ld next-state (target: ld, pattern: condition_precompute)
	wire ld_next    = state_is_idle  & go
	                | state_is_start & core_ack;

	// [OPT] L5: cmd_ack next-state (target: cmd_ack, pattern: condition_precompute)
	wire cmd_ack_next_byte = ack_done | state_is_stop & core_ack;

	// [OPT] L5: core_txd next-state (target: core_txd, pattern: condition_precompute)
	wire core_txd_next = ack_no_ack ? ack_in :
	                     ack_stop   ? ack_in :
	                     ack_done   ? 1'b1   :
	                     state_is_read & core_ack ? ack_in :
	                     sr[7];

	// [OPT] L5: ack_out next-state (target: ack_out, pattern: condition_precompute)
	wire ack_out_next = state_is_ack & core_ack ? core_rxd : ack_out;

	// Registered FSM update — all outputs precomputed in combinational logic above
	always @(posedge clk or negedge nReset)
	  if (!nReset)
	    begin
	        core_cmd <= #1 `I2C_CMD_NOP;
	        core_txd <= #1 1'b0;
	        shift    <= #1 1'b0;
	        ld       <= #1 1'b0;
	        cmd_ack  <= #1 1'b0;
	        c_state  <= #1 ST_IDLE;
	        ack_out  <= #1 1'b0;
	    end
	  else if (rst | i2c_al)
	   begin
	       core_cmd <= #1 `I2C_CMD_NOP;
	       core_txd <= #1 1'b0;
	       shift    <= #1 1'b0;
	       ld       <= #1 1'b0;
	       cmd_ack  <= #1 1'b0;
	       c_state  <= #1 ST_IDLE;
	       ack_out  <= #1 1'b0;
	   end
	else
	  begin
	      core_cmd <= #1 core_cmd_next;
	      core_txd <= #1 core_txd_next;
	      shift    <= #1 shift_next;
	      ld       <= #1 ld_next;
	      cmd_ack  <= #1 cmd_ack_next_byte;
	      c_state  <= #1 c_state_next;
	      ack_out  <= #1 ack_out_next;
	  end
endmodule


module i2c_master_top(
	wb_clk_i, wb_rst_i, arst_i, wb_adr_i, wb_dat_i, wb_dat_o,
	wb_we_i, wb_stb_i, wb_cyc_i, wb_ack_o, wb_inta_o,
	scl_pad_i, scl_pad_o, scl_padoen_o, sda_pad_i, sda_pad_o, sda_padoen_o );

	// parameters
	parameter ARST_LVL = 1'b0; // asynchronous reset level

	//
	// inputs & outputs
	//

	// wishbone signals
	input        wb_clk_i;     // master clock input
	input        wb_rst_i;     // synchronous active high reset
	input        arst_i;       // asynchronous reset
	input  [2:0] wb_adr_i;     // lower address bits
	input  [7:0] wb_dat_i;     // databus input
	output [7:0] wb_dat_o;     // databus output
	input        wb_we_i;      // write enable input
	input        wb_stb_i;     // stobe/core select signal
	input        wb_cyc_i;     // valid bus cycle input
	output       wb_ack_o;     // bus cycle acknowledge output
	output       wb_inta_o;    // interrupt request signal output

	reg [7:0] wb_dat_o;
	reg wb_ack_o;
	reg wb_inta_o;

	// I2C signals
	// i2c clock line
	input  scl_pad_i;       // SCL-line input
	output scl_pad_o;       // SCL-line output (always 1'b0)
	output scl_padoen_o;    // SCL-line output enable (active low)

	// i2c data line
	input  sda_pad_i;       // SDA-line input
	output sda_pad_o;       // SDA-line output (always 1'b0)
	output sda_padoen_o;    // SDA-line output enable (active low)


	//
	// variable declarations
	//

	// registers
	reg  [15:0] prer; // clock prescale register
	reg  [ 7:0] ctr;  // control register
	reg  [ 7:0] txr;  // transmit register
	wire [ 7:0] rxr;  // receive register
	reg  [ 7:0] cr;   // command register
	wire [ 7:0] sr;   // status register

	// done signal: command completed, clear command register
	wire done;

	// core enable signal
	wire core_en;
	wire ien;

	// status register signals
	wire irxack;
	reg  rxack;       // received aknowledge from slave
	reg  tip;         // transfer in progress
	reg  irq_flag;    // interrupt pending flag
	wire i2c_busy;    // bus busy (start signal detected)
	wire i2c_al;      // i2c bus arbitration lost
	reg  al;          // status register arbitration lost bit

	//
	// module body
	//

	// generate internal reset
	wire rst_i = arst_i ^ ARST_LVL;

	// generate wishbone signals
	wire wb_wacc = wb_cyc_i & wb_stb_i & wb_we_i;

	// generate acknowledge output signal
	always @(posedge wb_clk_i)
	  wb_ack_o <= #1 wb_cyc_i & wb_stb_i & ~wb_ack_o; // because timing is always honored

	// assign DAT_O
	always @(posedge wb_clk_i)
	begin
	  case (wb_adr_i) // synopsis parallel_case
	    3'b000: wb_dat_o <= #1 prer[ 7:0];
	    3'b001: wb_dat_o <= #1 prer[15:8];
	    3'b010: wb_dat_o <= #1 ctr;
	    3'b011: wb_dat_o <= #1 rxr; // write is transmit register (txr)
	    3'b100: wb_dat_o <= #1 sr;  // write is command register (cr)
	    3'b101: wb_dat_o <= #1 txr;
	    3'b110: wb_dat_o <= #1 cr;
	    3'b111: wb_dat_o <= #1 0;   // reserved
	  endcase
	end

	// generate registers
	always @(posedge wb_clk_i or negedge rst_i)
	  if (!rst_i)
	    begin
	        prer <= #1 16'hffff;
	        ctr  <= #1  8'h0;
	        txr  <= #1  8'h0;
	    end
	  else if (wb_rst_i)
	    begin
	        prer <= #1 16'hffff;
	        ctr  <= #1  8'h0;
	        txr  <= #1  8'h0;
	    end
	  else
	    if (wb_wacc)
	      case (wb_adr_i) // synopsis parallel_case
	         3'b000 : prer [ 7:0] <= #1 wb_dat_i;
	         3'b001 : prer [15:8] <= #1 wb_dat_i;
	         3'b010 : ctr         <= #1 wb_dat_i;
	         3'b011 : txr         <= #1 wb_dat_i;
         default: ;
	      endcase

	// generate command register (special case)
	always @(posedge wb_clk_i or negedge rst_i)
	  if (~rst_i)
	    cr <= #1 8'h0;
	  else if (wb_rst_i)
	    cr <= #1 8'h0;
	  else if (wb_wacc)
	    begin
	        if (core_en & (wb_adr_i == 3'b100) )
	          cr <= #1 wb_dat_i;
	    end
	  else
	    begin
	        if (done | i2c_al)
	          cr[7:4] <= #1 4'h0;           // clear command bits when done
	                                        // or when aribitration lost
	        cr[2:1] <= #1 2'b0;             // reserved bits
	        cr[0]   <= #1 2'b0;             // clear IRQ_ACK bit
	    end


	// decode command register
	wire sta  = cr[7];
	wire sto  = cr[6];
	wire rd   = cr[5];
	wire wr   = cr[4];
	wire ack  = cr[3];
	wire iack = cr[0];

	// decode control register
	assign core_en = ctr[7];
	assign ien = ctr[6];

	// hookup byte controller block
	i2c_master_byte_ctrl byte_controller (
		.clk      ( wb_clk_i     ),
		.rst      ( wb_rst_i     ),
		.nReset   ( rst_i        ),
		.ena      ( core_en      ),
		.clk_cnt  ( prer         ),
		.start    ( sta          ),
		.stop     ( sto          ),
		.read     ( rd           ),
		.write    ( wr           ),
		.ack_in   ( ack          ),
		.din      ( txr          ),
		.cmd_ack  ( done         ),
		.ack_out  ( irxack       ),
		.dout     ( rxr          ),
		.i2c_busy ( i2c_busy     ),
		.i2c_al   ( i2c_al       ),
		.scl_i    ( scl_pad_i    ),
		.scl_o    ( scl_pad_o    ),
		.scl_oen  ( scl_padoen_o ),
		.sda_i    ( sda_pad_i    ),
		.sda_o    ( sda_pad_o    ),
		.sda_oen  ( sda_padoen_o )
	);

	// status register block + interrupt request signal
	always @(posedge wb_clk_i or negedge rst_i)
	  if (!rst_i)
	    begin
	        al       <= #1 1'b0;
	        rxack    <= #1 1'b0;
	        tip      <= #1 1'b0;
	        irq_flag <= #1 1'b0;
	    end
	  else if (wb_rst_i)
	    begin
	        al       <= #1 1'b0;
	        rxack    <= #1 1'b0;
	        tip      <= #1 1'b0;
	        irq_flag <= #1 1'b0;
	    end
	  else
	    begin
	        al       <= #1 i2c_al | (al & ~sta);
	        rxack    <= #1 irxack;
	        tip      <= #1 (rd | wr);
	        irq_flag <= #1 (done | i2c_al | irq_flag) & ~iack; // interrupt request flag is always generated
	    end

	// generate interrupt request signals
	always @(posedge wb_clk_i or negedge rst_i)
	  if (!rst_i)
	    wb_inta_o <= #1 1'b0;
	  else if (wb_rst_i)
	    wb_inta_o <= #1 1'b0;
	  else
	    wb_inta_o <= #1 irq_flag && ien; // interrupt signal is only generated when IEN (interrupt enable bit is set)

	// assign status register bits
	assign sr[7]   = rxack;
	assign sr[6]   = i2c_busy;
	assign sr[5]   = al;
	assign sr[4:2] = 3'h0; // reserved
	assign sr[1]   = tip;
	assign sr[0]   = irq_flag;

endmodule