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
//	reg [15:0] cnt = clk_cnt;   // clock divider counter (simulation)
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

	// [OPT] L5 condition_precompute for arb_lost (st_0003, pattern: condition_precompute)
	// Extract shared sub-conditions to reduce expression depth on critical path
	// Decompose the complex condition into smaller, reusable sub-conditions
	
	// First, extract common sub-conditions (L6 expression level)
	wire sda_chk_active = sda_chk & ~sSDA;
	wire sda_low_with_chk = sda_chk_active & sda_oen;
	wire state_active = |c_state;
	wire stop_condition_active = sto_condition & ~cmd_stop;
	
	// Now combine at L5 assignment level
	wire arb_lost_sda_chk = sda_low_with_chk;  // Already simplified
	wire arb_lost_sto = state_active & stop_condition_active;

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

	// generate statemachine

	// nxt_state decoder
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
	        cmd_ack   <= #1 1'b0; // default no command acknowledge + assert cmd_ack only 1clk cycle

	        if (clk_en)
	          case (c_state) // synopsys full_case parallel_case
	            // idle state
	            idle:
	            begin
	                if (cmd == `I2C_CMD_START)
                    c_state <= #1 start_a;
	                else if (cmd == `I2C_CMD_STOP)
                    c_state <= #1 stop_a;
	                else if (cmd == `I2C_CMD_WRITE)
                    c_state <= #1 wr_a;
	                else if (cmd == `I2C_CMD_READ)
                    c_state <= #1 rd_a;
	                else
                    c_state <= #1 idle;

	                scl_oen <= #1 scl_oen; // keep SCL in same state
	                sda_oen <= #1 sda_oen; // keep SDA in same state
	                sda_chk <= #1 1'b0;    // don't check SDA output
	            end

	            // start
	            start_a:
	            begin
	                c_state <= #1 start_b;
	                scl_oen <= #1 scl_oen; // keep SCL in same state
	                sda_oen <= #1 1'b1;    // set SDA high
	                sda_chk <= #1 1'b0;    // don't check SDA output
	            end

	            start_b:
	            begin
	                c_state <= #1 start_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 1'b1; // keep SDA high
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            start_c:
	            begin
	                c_state <= #1 start_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b0; // set SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            start_d:
	            begin
	                c_state <= #1 start_e;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            start_e:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            // stop
	            stop_a:
	            begin
	                c_state <= #1 stop_b;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 1'b0; // set SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            stop_b:
	            begin
	                c_state <= #1 stop_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            stop_c:
	            begin
	                c_state <= #1 stop_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            stop_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b1; // set SDA high
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            // read
	            rd_a:
	            begin
	                c_state <= #1 rd_b;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 1'b1; // tri-state SDA
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            rd_b:
	            begin
	                c_state <= #1 rd_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            rd_c:
	            begin
	                c_state <= #1 rd_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            rd_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end

	            // write
	            wr_a:
	            begin
	                c_state <= #1 wr_b;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 din;  // set SDA
	                sda_chk <= #1 1'b0; // don't check SDA output (SCL low)
	            end

	            wr_b:
	            begin
	                c_state <= #1 wr_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 din;  // keep SDA
	                sda_chk <= #1 1'b1; // check SDA output
	            end

	            wr_c:
	            begin
	                c_state <= #1 wr_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 din;
	                sda_chk <= #1 1'b1; // check SDA output
	            end

	            wr_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 din;
	                sda_chk <= #1 1'b0; // don't check SDA output (SCL low)
	            end

	          endcase
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
	// state machine
	//
	reg [4:0] c_state; // synopsis enum_state

	// [OPT] st_0001: L5 condition_precompute for next_state + all FSM outputs
	// Pre-decode c_state into next_state and registered-signal set conditions
	// in a single combinational block. Reduces sequential mux depth and breaks
	// critical feedback path: cmd_ack_reg -> go -> next_state -> c_state D-input.
	// Pattern: condition_precompute + one_hot_pre_decode on 5-bit FSM state.

	// --- Combinational next-state decoder (moved outside registered block) ---
	reg [4:0] next_state;
	always @(*) begin
	  // Default: stay in current state
	  next_state = c_state;
	  case (c_state)
	    ST_IDLE: begin
	      if (go) begin
	        if (start)
	          next_state = ST_START;
	        else if (read)
	          next_state = ST_READ;
	        else if (write)
	          next_state = ST_WRITE;
	        else // stop
	          next_state = ST_STOP;
	      end
	    end
	    ST_START: begin
	      if (core_ack) begin
	        if (read)
	          next_state = ST_READ;
	        else
	          next_state = ST_WRITE;
	      end
	    end
	    ST_WRITE: begin
	      if (core_ack) begin
	        if (cnt_done)
	          next_state = ST_ACK;
	        else
	          next_state = ST_WRITE;
	      end
	    end
	    ST_READ: begin
	      if (core_ack) begin
	        if (cnt_done)
	          next_state = ST_ACK;
	        else
	          next_state = ST_READ;
	      end
	    end
	    ST_ACK: begin
	      if (core_ack) begin
	        if (stop)
	          next_state = ST_STOP;
	        else
	          next_state = ST_IDLE;
	      end
	    end
	    ST_STOP: begin
	      if (core_ack)
	        next_state = ST_IDLE;
	    end
	    default: next_state = ST_IDLE;
	  endcase
	end

	// --- L5 precomputed registered-signal set conditions ---
	// Condition precompute: derive cmd_ack_set, core_cmd_set, ld_set, shift_set
	// from c_state + control inputs in combinational logic, reducing sequential block depth.
	wire cmd_ack_set = (c_state == ST_IDLE  & go)                       |
	                   (c_state == ST_START & core_ack)                  |
	                   (c_state == ST_WRITE & core_ack &  cnt_done)      |
	                   (c_state == ST_READ  & core_ack &  cnt_done)      |
	                   (c_state == ST_ACK   & core_ack & ~stop)          |
	                   (c_state == ST_STOP  & core_ack);

	wire ld_set      = (c_state == ST_IDLE  & go)                       |
	                   (c_state == ST_START & core_ack);

	wire shift_set   = (c_state == ST_WRITE & core_ack & ~cnt_done)     |
	                   (c_state == ST_READ  & core_ack);

	// Condition precompute: core_cmd next-state (avoids 9-entry case in seq block)
	// Default is NOP (same as sequential block default)
	wire [3:0] core_cmd_idle = (start) ? `I2C_CMD_START :
	                            (read)  ? `I2C_CMD_READ  :
	                            (write) ? `I2C_CMD_WRITE :
	                                      `I2C_CMD_STOP;

	wire [3:0] core_cmd_set =
	    (c_state == ST_IDLE & go)            ? core_cmd_idle            :
	    (c_state == ST_START & core_ack)     ? (read ? `I2C_CMD_READ :
	                                                      `I2C_CMD_WRITE) :
	    (c_state == ST_WRITE & core_ack)     ? (cnt_done ? `I2C_CMD_READ :
	                                                       `I2C_CMD_WRITE) :
	    (c_state == ST_READ  & core_ack)     ? (cnt_done ? `I2C_CMD_WRITE :
	                                                       `I2C_CMD_READ)  :
	    (c_state == ST_ACK   & core_ack)     ? (stop ? `I2C_CMD_STOP :
	                                                    `I2C_CMD_NOP)   :
	    (c_state == ST_STOP  & core_ack)     ? `I2C_CMD_NOP            :
	                                           `I2C_CMD_NOP;

	// --- Registered block: simple assignments from precomputed values ---
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
	      // initially reset all signals
	      core_txd <= #1 sr[7];
	      shift    <= #1 1'b0;
	      ld       <= #1 1'b0;
	      cmd_ack  <= #1 1'b0;

	      // Update c_state using precomputed next_state
	      c_state <= #1 next_state;

	      // Use precomputed set conditions (condition_precompute optimization)
	      if (cmd_ack_set)   cmd_ack  <= #1 1'b1;
	      if (ld_set)        ld       <= #1 1'b1;
	      if (shift_set)     shift    <= #1 1'b1;
	                           core_cmd <= #1 core_cmd_set;

	      case (c_state) // synopsys full_case parallel_case
	        ST_IDLE:
	          if (go)
	            ld <= #1 1'b1;

	        ST_START:
	          if (core_ack)
	            ld <= #1 1'b1;

	        ST_WRITE:
	          if (core_ack)
            begin
              core_cmd <= #1 cnt_done ? `I2C_CMD_READ : `I2C_CMD_WRITE;
              if (~cnt_done) shift <= #1 1'b1;
            end

	        ST_READ:
          if (core_ack)
            begin
                shift    <= #1 1'b1;
                core_txd <= #1 ack_in;
            end

        ST_ACK:
          if (core_ack)
            begin
                 // assign ack_out output to bit_controller_rxd (contains last received bit)
                 ack_out <= #1 core_rxd;
                 core_txd <= #1 1'b1;
             end
           else
             core_txd <= #1 ack_in;

        ST_STOP:
          if (core_ack)
            begin
                // generate command acknowledge signal
                cmd_ack  <= #1 1'b1;
            end

      endcase
	  end
endmodule