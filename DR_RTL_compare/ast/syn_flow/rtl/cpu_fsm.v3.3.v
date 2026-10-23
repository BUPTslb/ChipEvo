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
reg [7:0] rs_data	   ;
reg [7:0] rd_data	   ;

  
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

// Condition pre-computation: State comparison wires
wire state_is_fetch = (state == FETCH);
wire state_is_decode = (state == DECODE);
wire state_is_exec = (state == EXEC);
wire state_is_wb = (state == WB);
wire state_is_halt = (state == HALT);

  
// Memory Assignments
assign dbg_r0 = regis[0];
assign dbg_r1 = regis[1];
assign dbg_r2 = regis[2];
assign dbg_r3 = regis[3];

assign dbg_state = state;

  
// Control Unit
reg  reg_write  	   ;
reg  alu_src_imm	   ;
reg  [7:0] ALU_OUT     ;
wire [7:0] alu_inA 	   ;
wire [7:0] alu_inB 	   ;
reg  [7:0] alu_result  ;
reg  zero_flag		   ;
reg  zero_en		   ;
reg  branch_en		   ;


// Opcodes
localparam [3:0] OP_BEQ  = 4'H8;
localparam [3:0] OP_BNE  = 4'H9;
localparam [3:0] OP_ADD  = 4'hA;
localparam [3:0] OP_ADDI = 4'hB;
localparam [3:0] OP_SUB  = 4'hC;
localparam [3:0] OP_CMP  = 4'HD;
localparam [3:0] OP_JMP  = 4'HE;
localparam [3:0] OP_HALT = 4'hF;

// Pre-computed opcode comparison wires
wire op_is_add = (opcode == OP_ADD);
wire op_is_addi = (opcode == OP_ADDI);
wire op_is_sub = (opcode == OP_SUB);
wire op_is_cmp = (opcode == OP_CMP);
wire op_is_beq = (opcode == OP_BEQ);
wire op_is_bne = (opcode == OP_BNE);
wire op_is_jmp = (opcode == OP_JMP);
wire op_is_halt = (opcode == OP_HALT);

// Condition pre-computation for PC update in EXEC state
wire alu_zero = (alu_result == 8'h00);
wire branch_cond = (op_is_beq & alu_zero) | (op_is_bne & ~alu_zero) | op_is_jmp;

// Late mux-select optimization: Compute PC addition unconditionally
wire [7:0] pc_plus_imm = PC + $signed(imm8);

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
			// Load mode(init):
			if (rf_we)
        begin
				  regis[rf_addr] <= rf_wdata;
        end
			state <= state;
		end
	
    else
		begin
			
			state <= nst;
	
			case (1'b1)  // One-hot state comparison
	
				state_is_fetch:
					begin
						IR <= imem[PC];
						PC <= PC + 1;
					end
	
				state_is_exec:
					begin
						ALU_OUT <= alu_result;
		
						if (zero_en)
							zero_flag <= alu_zero;
		
						// Late mux-select: Use precomputed addition result conditionally
						if (branch_cond)
							PC <= pc_plus_imm;
					end
	
				state_is_wb:
					begin
						if (reg_write)
							regis[rd] <= ALU_OUT;
					end
	
				state_is_halt:
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
always @(posedge clk)
begin
	if (!en && imem_we)
		imem[imem_addr] <= imem_wdata;
end

assign halt = state_is_halt;

// Optimized register file muxes using direct indexing
always @(*)
begin
    case (rs)
        2'b00: rs_data = regis[0];
        2'b01: rs_data = regis[1];
        2'b10: rs_data = regis[2];
        default: rs_data = regis[3];
    endcase
end

always @(*)
begin
    case (rd)
        2'b00: rd_data = regis[0];
        2'b01: rd_data = regis[1];
        2'b10: rd_data = regis[2];
        default: rd_data = regis[3];
    endcase
end


//MUX for source of the ADD params
assign alu_inB = (alu_src_imm ? imm8 : rs_data);

// rd_data assignment to alu_inA
assign alu_inA = rd_data;


// ALU Operation Logic - Optimized to compute directly from opcode
always @(*)
begin
	reg_write 	= 1'b0	;
	alu_src_imm = 1'b0	;
	alu_result  = 8'h00 ;
	zero_en     = 1'b0  ;
	branch_en   = 1'b0  ;
	
	// Direct computation from precomputed opcode wires
	if (op_is_add || op_is_addi) begin
		alu_result = alu_inA + alu_inB;
		reg_write = 1'b1;
		zero_en = 1'b1;
		alu_src_imm = op_is_addi;
	end
	else if (op_is_sub || op_is_cmp) begin
		alu_result = alu_inA - alu_inB;
		zero_en = 1'b1;
		if (op_is_sub)
			reg_write = 1'b1;
	end
	else if (op_is_beq || op_is_bne) begin
		alu_result = alu_inA - alu_inB;
		branch_en = 1'b1;
	end
	else if (op_is_jmp) begin
		// JMP doesn't need ALU operation
	end
	else if (op_is_halt) begin
		// HALT doesn't need ALU operation
	end
	// Default: all signals remain at initial values
end


// Next state logic
always @(*)
begin
	nst = state;
	case (1'b1)
	
		state_is_fetch:
			nst = DECODE;
		state_is_decode:
      begin
			  if (op_is_halt)
				  nst = HALT;
			  else
				  nst = EXEC;
			end
		state_is_exec:
			nst = WB;
		state_is_wb:
			nst = FETCH;
		state_is_halt:
			nst = HALT;
	
		default:
      begin
        nst = FETCH;
      end	
  endcase
end
		
endmodule