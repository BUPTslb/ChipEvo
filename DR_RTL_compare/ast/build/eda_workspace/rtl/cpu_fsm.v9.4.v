`timescale 1ns/1ps

module mini_cpu(

	input  wire		   clk,
	input  wire		   rst,
	input  wire		   en,
					   
	input wire 		   imem_we,
	input wire  [7:0]  imem_addr,
	input wire  [15:0] imem_wdata,
					   
	input wire 		   rf_we,
	input wire  [1:0]  rf_addr,
	input wire  [7:0]  rf_wdata,
					   
	output reg  [7:0]  PC,
	output wire	 	   halt,
	output wire [7:0]  dbg_r0,
	output wire [7:0]  dbg_r1,
	output wire [7:0]  dbg_r2,
	output wire [7:0]  dbg_r3,
	output wire [2:0]  dbg_state
	);


// Registers
reg [15:0] IR;
reg [7:0] regis [0:3];

// Instruction Memory
reg [15:0] imem [0:255];
wire [7:0] rs_data	   ;
wire [7:0] rd_data	   ;

  
// DECODE
wire [3:0] opcode;
wire [1:0] rd	 ;
wire [1:0] rs	 ;
wire [7:0] imm8  ;

assign opcode 	 = IR[15:12];
assign rd	   	 = IR[11:10];
assign rs     	 = IR[9:8]	;
assign imm8   	 = IR[7:0]	;

  
// FSM Parameters
localparam FETCH  = 0;
localparam DECODE = 1;
localparam EXEC   = 2;
localparam WB 	  = 3;
localparam HALT   = 4;

reg [2:0] state, nst ;

  
// Memory Assignments
assign dbg_r0 = regis[0];
assign dbg_r1 = regis[1];
assign dbg_r2 = regis[2];
assign dbg_r3 = regis[3];

assign dbg_state = state;

  
// Control Unit
reg  reg_write  	   ;
wire [2:0] alu_op      ;
reg  alu_src_imm	   ;
reg  [7:0] ALU_OUT     ;
wire [7:0] alu_inA 	   ;
wire [7:0] alu_inB 	   ;
wire [7:0] alu_result  ;
reg  zero_flag		   ;
reg  zero_en		   ;


// Opcodes
localparam [3:0] OP_BEQ  = 4'H8;
localparam [3:0] OP_BNE  = 4'H9;
localparam [3:0] OP_ADD  = 4'hA;
localparam [3:0] OP_ADDI = 4'hB;
localparam [3:0] OP_SUB  = 4'hC;
localparam [3:0] OP_CMP  = 4'HD;
localparam [3:0] OP_JMP  = 4'HE;
localparam [3:0] OP_HALT = 4'hF;


//ALU Operation codes
localparam [2:0] ALU_ADD = 3'b001;
localparam [2:0] ALU_SUB = 3'b010;


// --- One-hot pre-decode of opcode (condition_precompute) ---
wire op_is_add  = (opcode == OP_ADD );
wire op_is_addi = (opcode == OP_ADDI);
wire op_is_sub  = (opcode == OP_SUB );
wire op_is_cmp  = (opcode == OP_CMP );
wire op_is_beq  = (opcode == OP_BEQ );
wire op_is_bne  = (opcode == OP_BNE );
wire op_is_jmp  = (opcode == OP_JMP );
wire op_is_halt = (opcode == OP_HALT);

// --- One-hot pre-decode of state (condition_precompute) ---
wire state_is_fetch  = (state == FETCH);
wire state_is_decode = (state == DECODE);
wire state_is_exec   = (state == EXEC);
wire state_is_wb     = (state == WB);
wire state_is_halt   = (state == HALT);

// --- L6: Pre-computed ALU zero detection (CSE) ---
wire alu_result_is_zero = (alu_result == 8'h00);

// --- L6: Pre-computed ALU arithmetic (parallel computation) ---
wire [7:0] alu_sum  = alu_inA + alu_inB;
wire [7:0] alu_diff = alu_inA - alu_inB;

// --- L5: Direct alu_op from opcode bits (condition_precompute) ---
// L5: Balanced tree structure for alu_op[1] reduces depth from 3 to 2 levels
wire alu_op1_sub_cmp  = op_is_sub | op_is_cmp;
wire alu_op1_beq_bne  = op_is_beq | op_is_bne;
assign alu_op[1] = alu_op1_sub_cmp | alu_op1_beq_bne;
assign alu_op[0] = op_is_add | op_is_addi;

// --- L5: Pre-computed ALU result mux (condition_precompute) ---
assign alu_result = alu_op[0] ? alu_sum : alu_diff;

// --- L5: Pre-computed branch conditions (condition_precompute) ---
wire branch_take_beq = op_is_beq & alu_result_is_zero;
wire branch_take_bne = op_is_bne & ~alu_result_is_zero;
wire branch_taken    = branch_take_beq | branch_take_bne | op_is_jmp;

// --- L6: Pre-computed sign-extended immediate (condition_precompute) ---
wire [7:0] imm8_sext = $signed(imm8);

// --- L6: Pre-computed PC targets (CSE) ---
wire [7:0] pc_branch_target = PC + imm8_sext;
wire [7:0] pc_plus_1        = PC + 8'd1;

// --- L5: Pre-computed register write enable (condition_precompute) ---
// Combines state_is_wb & reg_write once, eliminating one AND gate from
// the critical IR→regis write-back path in WB state.
wire wb_write_en = state_is_wb & reg_write;

// --- L5: Pre-computed PC mux selectors (condition_precompute) ---
// Extract branch-taken-in-exec condition as named wire for mux clarity.
wire sel_pc_exec = state_is_exec & branch_taken;

// --- L5: Unified PC next-value mux (condition_precompute) ---
wire [7:0] pc_next = state_is_fetch ? pc_plus_1        :
                     sel_pc_exec    ? pc_branch_target :
                     PC;

// Sync Main Logic
always @(posedge clk)
begin
    if (rst)
		begin
			PC        <= 8'd0;
			state     <= FETCH;
			IR        <= 16'h0000;
	
			regis[0]  <= 8'h11;
			regis[1]  <= 8'h22;
			regis[2]  <= 8'h33;
			regis[3]  <= 8'h44;
	
			zero_flag <= 1'b0;
			ALU_OUT   <= 8'h00;
		end
	
	else if (!en)
		begin
			if (rf_we)
        begin
				  regis[rf_addr] <= rf_wdata;
        end
			state <= state;
		end
	
    else
		begin
			
			state <= nst;
			PC    <= pc_next;
	
			case (state)
	
				FETCH:
					begin
						IR <= imem[PC];
					end
	
				EXEC:
					begin
						ALU_OUT <= alu_result;

						if (zero_en)
							zero_flag <= alu_result_is_zero;
					end
	
				WB:
					begin
						if (wb_write_en)
							regis[rd] <= ALU_OUT;
					end
	
				HALT:
					begin
						// stay here forever, no actions
					end
	
				default:
					begin
						// do nothing
					end
	
			endcase
		end
end



// Instruction memory init
wire imem_write_en = !en & imem_we;
always @(posedge clk)
begin
	if (imem_write_en)
		imem[imem_addr] <= imem_wdata;
end

assign halt = state_is_halt;

//L5: Register file read — direct continuous assign replaces combinational always block.
//Eliminates procedural overhead for register file mux, simplifying the critical path
//from decode (rs/rd fields) through register data to ALU inputs.
assign rs_data = regis[rs];
assign rd_data = regis[rd];


//MUX for source of the ADD params
assign alu_inB = (alu_src_imm ? imm8 : rs_data);

// rd_data assignment to alu_inA
assign alu_inA = rd_data;


// ALU Control Logic — direct Boolean expressions from pre-decoded opcodes
always @(*)
begin
	// Default / inactive values
	reg_write   = 1'b0;
	alu_src_imm = 1'b0;
	zero_en     = 1'b0;

	// L5: Control signals as direct Boolean combinations of pre-decoded opcodes.
	reg_write   = op_is_add | op_is_addi | op_is_sub;
	alu_src_imm = op_is_addi;
	zero_en     = op_is_add | op_is_addi | op_is_sub | op_is_cmp;
end


// FSM next-state — Direct Boolean equations for state bits
always @(*)
begin
    nst[0] = state_is_fetch | state_is_exec;
    nst[1] = (state_is_decode & ~op_is_halt) | state_is_exec;
    nst[2] = (state_is_decode & op_is_halt) | state_is_halt;
end
		
endmodule
