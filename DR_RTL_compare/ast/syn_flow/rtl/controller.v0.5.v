module control_unit
(
	output reg [ 2:0] sbox_sel,
	output reg [ 1:0] rk_sel,
	output reg [ 1:0] key_out_sel,
	output reg [ 1:0] col_sel,
	output reg [ 3:0] key_en,
	output reg [ 3:0] col_en,
	output     [ 3:0] round,
	output reg bypass_rk,
	output reg bypass_key_en,
	output reg key_sel,
	output reg iv_cnt_en,
	output reg iv_cnt_sel,
	output reg key_derivation_en,
	output end_comp,
	output key_init,
	output key_gen,
	output mode_ctr,
	output mode_cbc,
	output last_round,
  output encrypt_decrypt,	
	input [1:0] operation_mode,
	input [1:0] aes_mode,
	input start,
	input disable_core,
	input clk,
	input rst_n
);

//=============================================================================
// Memory Mapped Registers Address
//=============================================================================
localparam AES_CR    = 4'd00;
localparam AES_SR    = 4'd01;
localparam AES_DINR  = 4'd02;
localparam AES_DOUTR = 4'd03;
localparam AES_KEYR0 = 4'd04;
localparam AES_KEYR1 = 4'd05;
localparam AES_KEYR2 = 4'd06;
localparam AES_KEYR3 = 4'd07;
localparam AES_IVR0  = 4'd08;
localparam AES_IVR1  = 4'd09;
localparam AES_IVR2  = 4'd10;
localparam AES_IVR3  = 4'd11;

//=============================================================================
// Operation Modes
//=============================================================================
localparam ENCRYPTION     = 2'b00;
localparam KEY_DERIVATION = 2'b01;
localparam DECRYPTION     = 2'b10;
localparam DECRYP_W_DERIV = 2'b11;

//=============================================================================
// AES Modes
//=============================================================================
localparam ECB = 2'b00;
localparam CBC = 2'b01;
localparam CTR = 2'b10;

//=============================================================================
// SBOX SEL
//=============================================================================
localparam COL_0 = 3'b000;
localparam COL_1 = 3'b001;
localparam COL_2 = 3'b010;
localparam COL_3 = 3'b011;
localparam G_FUNCTION = 3'b100;

//=============================================================================
// RK_SEL
//=============================================================================
localparam COL        = 2'b00;
localparam MIXCOL_IN  = 2'b01;
localparam MIXCOL_OUT = 2'b10;

//=============================================================================
// KEY_OUT_SEL
//=============================================================================
localparam KEY_0 = 2'b00;
localparam KEY_1 = 2'b01;
localparam KEY_2 = 2'b10;
localparam KEY_3 = 2'b11;

//=============================================================================
// COL_SEL
//=============================================================================
localparam SHIFT_ROWS = 2'b00;
localparam ADD_RK_OUT = 2'b01;
localparam INPUT      = 2'b10;

//=============================================================================
// KEY_SEL
//=============================================================================
localparam KEY_HOST = 1'b0;
localparam KEY_OUT  = 1'b1;

//=============================================================================
// KEY_EN
//=============================================================================
localparam KEY_DIS  = 4'b0000;
localparam EN_KEY_0 = 4'b0001;
localparam EN_KEY_1 = 4'b0010;
localparam EN_KEY_2 = 4'b0100;
localparam EN_KEY_3 = 4'b1000;
localparam KEY_ALL  = 4'b1111;

//=============================================================================
// COL_EN
//=============================================================================
localparam COL_DIS  = 4'b0000;
localparam EN_COL_0 = 4'b0001;
localparam EN_COL_1 = 4'b0010;
localparam EN_COL_2 = 4'b0100;
localparam EN_COL_3 = 4'b1000;
localparam COL_ALL  = 4'b1111;

//=============================================================================
// IV_CNT_SEL
//=============================================================================
localparam IV_CNT = 1'b1;
localparam IV_BUS = 1'b0;

//=============================================================================
// ENABLES
//=============================================================================
localparam ENABLE = 1'b1;
localparam DISABLE = 1'b0;

localparam NUMBER_ROUND      = 4'd10;
localparam NUMBER_ROUND_INC  = 4'd11;
localparam INITIAL_ROUND     = 4'd00;

//=============================================================================
// FSM STATES
//=============================================================================
localparam IDLE        = 4'd00;
localparam ROUND0_COL0 = 4'd01;
localparam ROUND0_COL1 = 4'd02;
localparam ROUND0_COL2 = 4'd03;
localparam ROUND0_COL3 = 4'd04;
localparam ROUND_KEY0  = 4'd05;
localparam ROUND_COL0  = 4'd06;
localparam ROUND_COL1  = 4'd07;
localparam ROUND_COL2  = 4'd08;
localparam ROUND_COL3  = 4'd09;
localparam READY       = 4'd10;
localparam GEN_KEY0    = 4'd11;
localparam GEN_KEY1    = 4'd12;
localparam GEN_KEY2    = 4'd13;
localparam GEN_KEY3    = 4'd14;
localparam NOP         = 4'd15;

reg [3:0] state, next_state;
reg [3:0] rd_count;

reg rd_count_en;
wire op_key_derivation;
wire first_round;
wire [1:0] op_mode;
wire enc_dec;

// v0.5: One-hot bit-indexed state decode — eliminates 4-bit equality comparisons
// STATE BIT MAP: state[0]=IDLE, [1]=R0C0, [2]=R0C1, [3]=R0C2, [4]=R0C3,
//   [5]=RK0, [6]=RC0, [7]=RC1, [8]=RC2, [9]=RC3, [10]=READY,
//   [11]=GK0, [12]=GK1, [13]=GK2, [14]=GK3, [15]=NOP
wire state_is_idle       = state[0];
wire state_is_round0_c0  = state[1];
wire state_is_round0_c1  = state[2];
wire state_is_round0_c2  = state[3];
wire state_is_round0_c3  = state[4];
wire state_is_round_key0 = state[5];
wire state_is_round_c0   = state[6];
wire state_is_round_c1   = state[7];
wire state_is_round_c2   = state[8];
wire state_is_round_c3   = state[9];
wire state_is_ready      = state[10];
wire state_is_gen_key0   = state[11];
wire state_is_gen_key1   = state[12];
wire state_is_gen_key2   = state[13];
wire state_is_gen_key3   = state[14];

// v0.5: Pre-computed condition wires
wire mode_derived;           // L6: CBC or CTR (mutually exclusive, wider than single mode check)
wire key_derivation;         // L6: key derivation mode active
wire enc_dec_and_last_round; // L6: shared compound condition for ROUND_COL output logic
wire last_round_special_case; // L6: CBC/CTR last-round special path

assign mode_derived     = mode_cbc | mode_ctr;
assign key_derivation   = op_key_derivation;
assign enc_dec_and_last_round = enc_dec & last_round;
assign last_round_special_case = (last_round & mode_cbc & ~enc_dec) | (last_round & mode_ctr);

// State Flops Definition
always @(posedge clk, negedge rst_n)
	begin
		if(!rst_n)
			state <= IDLE;
		else
			if(disable_core)
				state <= IDLE;
			else
				state <= next_state;
	end

// v0.5: encrypt_decrypt using one-hot bit-indexed state decode
assign encrypt_decrypt = (op_mode == ENCRYPTION || op_mode == KEY_DERIVATION ||
                          state_is_gen_key0 || state_is_gen_key1 ||
                          state_is_gen_key2 || state_is_gen_key3);

assign enc_dec = encrypt_decrypt | mode_ctr;
assign key_gen = state_is_round_key0;

assign op_key_derivation = (op_mode == KEY_DERIVATION);

assign mode_ctr = (aes_mode == CTR);
assign mode_cbc = (aes_mode == CBC);

assign key_init = start;

assign op_mode = (mode_ctr) ? ENCRYPTION : operation_mode;

// v0.5: Next State Logic — bit-indexed state decode eliminates equality comparisons
always @(*)
	begin
		next_state = state;
		case(1'b1)
			state_is_idle:
				begin
					if(!start)
						next_state = IDLE;
					else
						case(op_mode)
							ENCRYPTION    : next_state = ROUND0_COL0;
							DECRYPTION    : next_state = ROUND0_COL3;
							KEY_DERIVATION: next_state = GEN_KEY0;
							DECRYP_W_DERIV: next_state = GEN_KEY0;
							default       : next_state = IDLE;
						endcase
				end
			state_is_round0_c0:
				begin
					next_state = (enc_dec) ? ROUND0_COL1 : ROUND_KEY0; 
				end
			state_is_round0_c1:
				begin
					next_state = (enc_dec) ? ROUND0_COL2 : ROUND0_COL0;
				end
			state_is_round0_c2:
				begin
					next_state = (enc_dec) ? ROUND0_COL3 : ROUND0_COL1;
				end
			state_is_round0_c3:
				begin
					next_state = (enc_dec) ? ROUND_KEY0 : ROUND0_COL2;
				end
			state_is_round_key0 :
				begin
					if(!first_round)
						begin
							next_state = (last_round) ? READY : NOP;
						end
					else
						begin
							next_state = (enc_dec) ? ROUND_COL0 : ROUND_COL3;
						end
				end
			state_is_round_c0 :
				begin
					next_state = (enc_dec) ? ROUND_COL1 : ROUND_KEY0;
				end
			state_is_round_c1 :
				begin
					next_state = (enc_dec) ? ROUND_COL2 : ROUND_COL0;
				end
			state_is_round_c2 :
				begin
					next_state = (enc_dec) ? ROUND_COL3 : ROUND_COL1;
				end
			state_is_round_c3 :
				begin
					if(enc_dec_and_last_round)
						next_state = READY;
					else
						next_state = (enc_dec) ? ROUND_KEY0 : ROUND_COL2;
				end
			state_is_gen_key0 :
				begin
					next_state = GEN_KEY1;
				end
			state_is_gen_key1 :
				begin
					next_state = GEN_KEY2;
				end
			state_is_gen_key2 :
				begin
					next_state = GEN_KEY3;
				end
			state_is_gen_key3 :
				begin
					if(last_round)
						next_state = (op_key_derivation) ? READY : ROUND0_COL3;
					else
						next_state = GEN_KEY0;
				end
			state_is_ready :
				begin
					next_state = IDLE;
				end
			default:
				begin
					next_state = IDLE;
				end
		endcase
	end

// Output Logic
assign end_comp = state_is_ready;

// v0.5: Output logic with pre-decoded state signals and flattened mux conditions
always @(*)
	begin
		// Defaults
		sbox_sel = COL_0;
		rk_sel = COL;
		bypass_rk = DISABLE;
		key_out_sel = KEY_0;
		col_sel = INPUT;
		key_sel = KEY_HOST;
		key_en = KEY_DIS;
		col_en = COL_DIS;
		rd_count_en = DISABLE;
		iv_cnt_en = DISABLE;
		iv_cnt_sel = IV_BUS;
		bypass_key_en = DISABLE;
		key_derivation_en = DISABLE;

		// ROUND0_COL0: [1]
		if(state_is_round0_c0)
			begin
				sbox_sel = COL_0;
				rk_sel   = COL;
				bypass_rk = ENABLE;
				bypass_key_en = ENABLE;
				key_out_sel = KEY_0;
				col_sel = (enc_dec) ? ADD_RK_OUT : SHIFT_ROWS;
				col_en =  (enc_dec) ? EN_COL_0 : COL_ALL;
			end

		// ROUND0_COL1: [2]
		if(state_is_round0_c1)
			begin
				sbox_sel = COL_1;
				rk_sel   = COL;
				bypass_rk = ENABLE;
				bypass_key_en = ENABLE;
				key_out_sel = KEY_1;
				col_sel = ADD_RK_OUT;
				col_en = EN_COL_1;
				if(!enc_dec)
					begin
						key_sel = KEY_OUT;
						key_en =  EN_KEY_1;
					end
			end

		// ROUND0_COL2: [3]
		if(state_is_round0_c2)
			begin
				sbox_sel = COL_2;
				rk_sel   = COL;
				bypass_rk = ENABLE;
				bypass_key_en = ENABLE;
				key_out_sel = KEY_2;
				col_sel = ADD_RK_OUT;
				col_en = EN_COL_2;
				if(!enc_dec)
					begin
						key_sel = KEY_OUT;
						key_en =  EN_KEY_2;
					end
			end

		// ROUND0_COL3: [4]
		if(state_is_round0_c3)
			begin
				sbox_sel = COL_3;
				rk_sel   = COL;
				bypass_key_en = ENABLE;
				key_out_sel = KEY_3;
				col_sel = (enc_dec) ? SHIFT_ROWS : ADD_RK_OUT;
				col_en =  (enc_dec) ? COL_ALL : EN_COL_3;
				bypass_rk = ENABLE;
				if(!enc_dec)
				begin
						key_sel = KEY_OUT;
						key_en =  EN_KEY_3;
				end
			end

		// ROUND_KEY0: [5]
		if(state_is_round_key0)
			begin
				sbox_sel = G_FUNCTION;
				key_sel = KEY_OUT;
				key_en = EN_KEY_0;
				rd_count_en = ENABLE;
			end

		// ROUND_COL0: [6] — v0.5: flattened mux with pre-computed conditions
		if(state_is_round_c0)
			begin
				sbox_sel = COL_0;
				rk_sel   = last_round ? MIXCOL_IN : MIXCOL_OUT;
				key_out_sel = KEY_0;
				if(enc_dec)
					key_en = EN_KEY_1;
				if(last_round_special_case)
					col_sel = INPUT;
				else if(enc_dec)
					col_sel = ADD_RK_OUT;
				else
					col_sel = last_round ? ADD_RK_OUT : SHIFT_ROWS;
				if(enc_dec)
					col_en = EN_COL_0;
				else
					col_en = last_round ? EN_COL_0 : COL_ALL;
			end

		// ROUND_COL1: [7] — v0.5: flattened col_sel, reduced gate depth
		if(state_is_round_c1)
			begin
				sbox_sel = COL_1;
				rk_sel   = last_round ? MIXCOL_IN : MIXCOL_OUT;
				key_out_sel = KEY_1;
				key_sel = KEY_OUT;
				if(enc_dec)
					key_en = EN_KEY_2;
				else
					key_en = EN_KEY_1;
				if(last_round_special_case)
					col_sel = INPUT;
				else
					col_sel = ADD_RK_OUT;
				col_en = EN_COL_1;
			end

		// ROUND_COL2: [8] — v0.5: same flattening as ROUND_COL1
		if(state_is_round_c2)
			begin
				sbox_sel = COL_2;
				rk_sel   = last_round ? MIXCOL_IN : MIXCOL_OUT;
				key_out_sel = KEY_2;
				key_sel = KEY_OUT;
				if(enc_dec)
					key_en = EN_KEY_3;
				else
					key_en = EN_KEY_2;
				if(last_round_special_case)
					col_sel = INPUT;
				else
					col_sel = ADD_RK_OUT;
				col_en = EN_COL_2;
			end

		// ROUND_COL3: [9] — v0.5: flattened mux with enc_dec_and_last_round
		if(state_is_round_c3)
			begin
				sbox_sel = COL_3;
				rk_sel   = last_round ? MIXCOL_IN : MIXCOL_OUT;
				key_out_sel = KEY_3;
				key_sel = KEY_OUT;
				if(!enc_dec)
					key_en = EN_KEY_3;
				if(last_round_special_case)
					col_sel = INPUT;
				else if(enc_dec)
					col_sel = enc_dec_and_last_round ? ADD_RK_OUT : SHIFT_ROWS;
				else
					col_sel = ADD_RK_OUT;
				if(enc_dec)
					col_en = enc_dec_and_last_round ? EN_COL_3 : COL_ALL;
				else
					col_en = EN_COL_3;
				if(last_round_special_case)
					begin
						iv_cnt_en = ENABLE;
						iv_cnt_sel = IV_CNT;
					end
			end

		// GEN_KEY0: [11]
		if(state_is_gen_key0)
			begin
				sbox_sel = G_FUNCTION;
				rd_count_en = ENABLE;
			end

		// GEN_KEY1: [12]
		if(state_is_gen_key1)
			begin
				key_en = EN_KEY_1 | EN_KEY_0;
				key_sel = KEY_OUT;
				bypass_key_en = ENABLE;
			end

		// GEN_KEY2: [13]
		if(state_is_gen_key2)
			begin
				key_en = EN_KEY_2;
				key_sel = KEY_OUT;
				bypass_key_en = ENABLE;
			end

		// GEN_KEY3: [14]
		if(state_is_gen_key3)
			begin
				key_en = EN_KEY_3;
				key_sel = KEY_OUT;
				bypass_key_en = ENABLE;
			end

		// READY: [10]
		if(state_is_ready)
			begin
				if(op_mode == KEY_DERIVATION)
					key_derivation_en = ENABLE;
			end
	end

// Round Counter
always @(posedge clk, negedge rst_n)
	begin
		if(!rst_n)
			rd_count <= INITIAL_ROUND;
		else
			if(state_is_idle || (state_is_gen_key3 && last_round))
				rd_count <= INITIAL_ROUND;
			else 
				if(rd_count_en)
					rd_count <= rd_count + 1'b1;
	end

assign round = rd_count;
assign first_round = (rd_count == INITIAL_ROUND);
assign last_round  = (rd_count == NUMBER_ROUND || rd_count == NUMBER_ROUND_INC);

endmodule