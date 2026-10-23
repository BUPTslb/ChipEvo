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

//=====================================================================================
// Memory Mapped Registers Address
//=====================================================================================
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

// Pre-computed intermediate signals for complex conditionals (v0.3 optimization)
wire last_round_and_mode_cbc_and_not_enc_dec;
wire last_round_and_mode_ctr;
wire last_round_special_case;
wire last_round_and_enc_dec;
wire not_last_round_and_enc_dec;
wire not_enc_dec;
wire not_last_round;

// --- v0.4: Pre-computed enc_dec mux branch values (L5 slices) ---
// ROUND0 state col_sel pre-computation
wire [1:0] round0_col0_sel_enc  = ADD_RK_OUT;
wire [1:0] round0_col0_sel_dec  = SHIFT_ROWS;
wire [1:0] round0_col0_sel      = enc_dec ? round0_col0_sel_enc : round0_col0_sel_dec;

wire [1:0] round0_col3_sel_enc  = SHIFT_ROWS;
wire [1:0] round0_col3_sel_dec  = ADD_RK_OUT;
wire [1:0] round0_col3_sel      = enc_dec ? round0_col3_sel_enc : round0_col3_sel_dec;

// ROUND0 col_en pre-computation
wire [3:0] round0_col0_en_enc  = EN_COL_0;
wire [3:0] round0_col0_en_dec  = COL_ALL;
wire [3:0] round0_col0_en      = enc_dec ? round0_col0_en_enc : round0_col0_en_dec;

wire [3:0] round0_col3_en_enc  = COL_ALL;
wire [3:0] round0_col3_en_dec  = EN_COL_3;
wire [3:0] round0_col3_en      = enc_dec ? round0_col3_en_enc : round0_col3_en_dec;

// ROUND_COL0 col_sel pre-computation (3-level nested mux flattened)
wire [1:0] rc0_sel_enc  = ADD_RK_OUT;
wire [1:0] rc0_sel_dec_last  = ADD_RK_OUT;
wire [1:0] rc0_sel_dec_nlast = SHIFT_ROWS;
wire [1:0] rc0_sel_dec       = last_round ? rc0_sel_dec_last : rc0_sel_dec_nlast;
wire [1:0] rc0_sel_not_special = enc_dec ? rc0_sel_enc : rc0_sel_dec;

// ROUND_COL0 col_en pre-computation
wire [3:0] rc0_en_enc  = EN_COL_0;
wire [3:0] rc0_en_dec_last  = EN_COL_0;
wire [3:0] rc0_en_dec_nlast = COL_ALL;
wire [3:0] rc0_en_dec       = last_round ? rc0_en_dec_last : rc0_en_dec_nlast;

// ROUND_COL3 col_sel pre-computation (3-level nested mux flattened)
wire [1:0] rc3_sel_enc_last  = ADD_RK_OUT;
wire [1:0] rc3_sel_enc_nlast = SHIFT_ROWS;
wire [1:0] rc3_sel_enc       = last_round ? rc3_sel_enc_last : rc3_sel_enc_nlast;
wire [1:0] rc3_sel_dec  = ADD_RK_OUT;
wire [1:0] rc3_sel_not_special = enc_dec ? rc3_sel_enc : rc3_sel_dec;

// ROUND_COL3 col_en pre-computation
wire [3:0] rc3_en_enc_last  = EN_COL_3;
wire [3:0] rc3_en_enc_nlast = COL_ALL;
wire [3:0] rc3_en_enc       = last_round ? rc3_en_enc_last : rc3_en_enc_nlast;
wire [3:0] rc3_en_dec  = EN_COL_3;

// key_en pre-computation for enc_dec muxed states
wire [3:0] r0c1_key_en_enc  = KEY_DIS;
wire [3:0] r0c1_key_en_dec  = EN_KEY_1;
wire [3:0] r0c2_key_en_enc  = KEY_DIS;
wire [3:0] r0c2_key_en_dec  = EN_KEY_2;
wire [3:0] r0c3_key_en_enc  = KEY_DIS;
wire [3:0] r0c3_key_en_dec  = EN_KEY_3;
wire [3:0] rc1_key_en_enc   = EN_KEY_2;
wire [3:0] rc1_key_en_dec   = EN_KEY_1;
wire [3:0] rc2_key_en_enc   = EN_KEY_3;
wire [3:0] rc2_key_en_dec   = EN_KEY_2;

// --- v0.4: Pre-computed round-key bypass enable ---
wire r0_bypass_en = (state == ROUND0_COL0) | (state == ROUND0_COL1) | (state == ROUND0_COL2) | (state == ROUND0_COL3);

// --- v0.4: Pre-computed next_state mux for ROUND_KEY0 (L5 slice) ---
wire [3:0] rndkey0_ns_enc  = ROUND_COL0;
wire [3:0] rndkey0_ns_dec  = ROUND_COL3;
wire [3:0] rndkey0_ns      = enc_dec ? rndkey0_ns_enc : rndkey0_ns_dec;

// --- v1.5: Additional condition pre-computation for ROUND_COL states ---
// Pre-compute rk_sel for ROUND_COL states (repeated condition)
wire [1:0] rk_sel_round_col = last_round ? MIXCOL_IN : MIXCOL_OUT;

// Pre-compute key_en for ROUND_COL states with last_round condition
wire [3:0] rc0_key_en_enc_last = EN_KEY_1;
wire [3:0] rc0_key_en_enc_not_last = KEY_DIS;
wire [3:0] rc0_key_en_enc = last_round ? rc0_key_en_enc_last : rc0_key_en_enc_not_last;

wire [3:0] rc1_key_en_enc_last = EN_KEY_2;
wire [3:0] rc1_key_en_enc_not_last = EN_KEY_1;
wire [3:0] rc1_key_en_enc_adj = last_round ? rc1_key_en_enc_last : rc1_key_en_enc_not_last;

wire [3:0] rc2_key_en_enc_last = EN_KEY_3;
wire [3:0] rc2_key_en_enc_not_last = EN_KEY_2;
wire [3:0] rc2_key_en_enc_adj = last_round ? rc2_key_en_enc_last : rc2_key_en_enc_not_last;

wire [3:0] rc3_key_en_enc_last = KEY_DIS;
wire [3:0] rc3_key_en_enc_not_last = EN_KEY_3;
wire [3:0] rc3_key_en_enc_adj = last_round ? rc3_key_en_enc_last : rc3_key_en_enc_not_last;

// v3.2: Pre-compute state_is_gen_key conditions with balanced OR tree
wire state_is_gen_key01 = (state == GEN_KEY0) || (state == GEN_KEY1);
wire state_is_gen_key23 = (state == GEN_KEY2) || (state == GEN_KEY3);
wire state_is_gen_key   = state_is_gen_key01 || state_is_gen_key23;

// v3.2: Pre-compute op_mode conditions
wire op_mode_is_enc = (op_mode == ENCRYPTION);
wire op_mode_is_kd  = (op_mode == KEY_DERIVATION);

// --- v7.1: Pre-compute key_sel and key_en for ROUND0 and ROUND_COL states (L5 condition precompute) ---
// key_sel for ROUND0 states (enc_dec dependent)
wire key_sel_round0 = not_enc_dec ? KEY_OUT : KEY_HOST;

// key_en for ROUND0_COL1, COL2, COL3
wire [3:0] key_en_round0_col1 = enc_dec ? r0c1_key_en_enc : r0c1_key_en_dec;
wire [3:0] key_en_round0_col2 = enc_dec ? r0c2_key_en_enc : r0c2_key_en_dec;
wire [3:0] key_en_round0_col3 = enc_dec ? r0c3_key_en_enc : r0c3_key_en_dec;

// key_en for ROUND_COL2 and ROUND_COL3 (enc_dec and last_round dependent)
wire [3:0] key_en_round_col2 = enc_dec ? rc2_key_en_enc_adj : EN_KEY_2;
wire [3:0] key_en_round_col3 = enc_dec ? rc3_key_en_enc_adj : EN_KEY_3;

// v9.1: Pre-compute col_sel for ROUND_COL0 and ROUND_COL3 (L5 condition precompute)
wire [1:0] col_sel_round_col0 = last_round_special_case ? INPUT : rc0_sel_not_special;
wire [1:0] col_sel_round_col3 = last_round_special_case ? INPUT : rc3_sel_not_special;

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

// v3.2: Decomposed and pre-computed encrypt_decrypt condition
assign encrypt_decrypt = op_mode_is_enc || op_mode_is_kd || state_is_gen_key;

assign enc_dec = encrypt_decrypt | mode_ctr;
assign key_gen = (state == ROUND_KEY0);

assign op_key_derivation = (op_mode == KEY_DERIVATION);

assign mode_ctr = (aes_mode == CTR);
assign mode_cbc = (aes_mode == CBC);

assign key_init = start;

// Pre-computed intermediate signals for complex conditional reduction (v0.3)
assign not_enc_dec = ~enc_dec;
assign not_last_round = ~last_round;
assign last_round_and_enc_dec = last_round & enc_dec;
assign not_last_round_and_enc_dec = not_last_round & enc_dec;
assign last_round_and_mode_cbc_and_not_enc_dec = last_round & mode_cbc & not_enc_dec;
assign last_round_and_mode_ctr = last_round & mode_ctr;
assign last_round_special_case = last_round_and_mode_cbc_and_not_enc_dec | last_round_and_mode_ctr;

assign op_mode = (mode_ctr) ? ENCRYPTION : operation_mode;

// Next State Logic
always @(*)
	begin
		next_state = state;
		case(state)
			IDLE:
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
			ROUND0_COL0:
				begin
					next_state = (enc_dec) ? ROUND0_COL1 : ROUND_KEY0; 
				end
			ROUND0_COL1:
				begin
					next_state = (enc_dec) ? ROUND0_COL2 : ROUND0_COL0;
				end
			ROUND0_COL2:
				begin
					next_state = (enc_dec) ? ROUND0_COL3 : ROUND0_COL1;
				end
			ROUND0_COL3:
				begin
					next_state = (enc_dec) ? ROUND_KEY0 : ROUND0_COL2;
				end
			ROUND_KEY0 :
				begin
					if(!first_round)
						begin
							next_state = (last_round) ? READY : NOP;
						end
					else
						begin
							// v0.4: Pre-computed enc_dec mux for next_state
							next_state = rndkey0_ns;
						end
				end
			NOP        :
				begin
					next_state = (enc_dec) ? ROUND_COL0 : ROUND_COL3;
				end
			ROUND_COL0 :
				begin
					next_state = (enc_dec) ? ROUND_COL1 : ROUND_KEY0;
				end
			ROUND_COL1 :
				begin
					next_state = (enc_dec) ? ROUND_COL2 : ROUND0_COL0;
				end
			ROUND_COL2 :
				begin
					next_state = (enc_dec) ? ROUND_COL3 : ROUND0_COL1;
				end
			ROUND_COL3 :
				begin
					if(last_round_and_enc_dec)
						next_state = READY;
					else
					next_state = (enc_dec) ? ROUND_KEY0 : ROUND_COL2;
				end
			GEN_KEY0   :
				begin
					next_state = GEN_KEY1;
				end
			GEN_KEY1   :
				begin
					next_state = GEN_KEY2;
				end
			GEN_KEY2   :
				begin
					next_state = GEN_KEY3;
				end
			GEN_KEY3   :
				begin
					if(last_round)
						next_state = (op_key_derivation) ? READY : ROUND0_COL3;
					else
						next_state = GEN_KEY0;
				end
			READY      :
				begin
					next_state = IDLE;
				end
		endcase
	end

       
// Output Logic
assign end_comp = (state == READY)?ENABLE:DISABLE;

// v5.1: Pre-compute key_en assignments for ROUND_COL0 and ROUND_COL1 to reduce critical path
wire [3:0] rc0_key_en = enc_dec ? rc0_key_en_enc : KEY_DIS;
wire [3:0] rc1_key_en = enc_dec ? rc1_key_en_enc_adj : EN_KEY_1;

// v8.3: Pre-compute col_sel for ROUND_COL1 and ROUND_COL2 (L5 condition precompute)
wire [1:0] rc1_rc2_col_sel = last_round_special_case ? INPUT : ADD_RK_OUT;

always @(*)
	begin
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
		case(state)
			ROUND0_COL0:
				begin
					sbox_sel = COL_0;
					rk_sel   = COL;
					// v0.4: Simplified round0 bypass using pre-computed wire
					bypass_rk = ENABLE;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_0;
					// v0.4: Pre-computed col_sel and col_en muxes (L5 slices)
					col_sel = round0_col0_sel;
					col_en  = round0_col0_en;
				end
			ROUND0_COL1:
				begin
					sbox_sel = COL_1;
					rk_sel   = COL;
					bypass_rk = ENABLE;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_1;
					col_sel = ADD_RK_OUT;
					col_en = EN_COL_1;
					// v7.1: Use pre-computed key_sel for ROUND0 states
					key_sel = key_sel_round0;
					// v7.1: Use pre-computed key_en for ROUND0_COL1
					key_en = key_en_round0_col1;
				end
			ROUND0_COL2:
				begin
					sbox_sel = COL_2;
					rk_sel   = COL;
					bypass_rk = ENABLE;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_2;
					col_sel = ADD_RK_OUT;
					col_en = EN_COL_2;
					// v7.1: Use pre-computed key_sel for ROUND0 states
					key_sel = key_sel_round0;
					// v7.1: Use pre-computed key_en for ROUND0_COL2
					key_en = key_en_round0_col2;
				end
			ROUND0_COL3:
				begin
					sbox_sel = COL_3;
					rk_sel   = COL;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_3;
					// v0.4: Pre-computed col_sel and col_en muxes (L5 slices)
					col_sel = round0_col3_sel;
					col_en  = round0_col3_en;
					bypass_rk = ENABLE;
					// v7.1: Use pre-computed key_sel for ROUND0 states
					key_sel = key_sel_round0;
					// v7.1: Use pre-computed key_en for ROUND0_COL3
					key_en = key_en_round0_col3;
				end
			ROUND_KEY0:
				begin
					sbox_sel = G_FUNCTION;
					key_sel = KEY_OUT;
					key_en = EN_KEY_0;
					rd_count_en = ENABLE;
				end
			ROUND_COL0:
				begin
					sbox_sel = COL_0;
					// v1.5: Use pre-computed rk_sel for ROUND_COL states
					rk_sel = rk_sel_round_col;
					key_out_sel = KEY_0;
					key_sel = KEY_OUT;
					// v5.1: Use pre-computed key_en for ROUND_COL0
					key_en = rc0_key_en;
					// v9.1: Use pre-computed col_sel for ROUND_COL0
					col_sel = col_sel_round_col0;
					// v0.4: Pre-computed col_en (L5 slice)
					col_en = enc_dec ? rc0_en_enc : rc0_en_dec;
				end
			ROUND_COL1:
				begin
					sbox_sel = COL_1;
					// v1.5: Use pre-computed rk_sel for ROUND_COL states
					rk_sel = rk_sel_round_col;
					key_out_sel = KEY_1;
					key_sel = KEY_OUT;
					// v5.1: Use pre-computed key_en for ROUND_COL1
					key_en = rc1_key_en;
					// v8.3: Use pre-computed col_sel for ROUND_COL1/2
					col_sel = rc1_rc2_col_sel;
					col_en = EN_COL_1;
				end
			ROUND_COL2:
				begin
					sbox_sel = COL_2;
					// v1.5: Use pre-computed rk_sel for ROUND_COL states
					rk_sel = rk_sel_round_col;
					key_out_sel = KEY_2;
					key_sel = KEY_OUT;
					// v7.1: Use pre-computed key_en for ROUND_COL2
					key_en = key_en_round_col2;
					// v8.3: Use pre-computed col_sel for ROUND_COL1/2
					col_sel = rc1_rc2_col_sel;
					col_en = EN_COL_2;
				end
			ROUND_COL3:
				begin
					sbox_sel = COL_3;
					// v1.5: Use pre-computed rk_sel for ROUND_COL states
					rk_sel = rk_sel_round_col;
					key_out_sel = KEY_3;
					key_sel = KEY_OUT;
					// v7.1: Use pre-computed key_en for ROUND_COL3
					key_en = key_en_round_col3;
					// v9.1: Use pre-computed col_sel for ROUND_COL3
					col_sel = col_sel_round_col3;
					// v0.4: Pre-computed col_en (L5 slice)
					col_en = enc_dec ? rc3_en_enc : rc3_en_dec;
					if(last_round_and_mode_ctr)
						begin
							iv_cnt_en = ENABLE;
							iv_cnt_sel = IV_CNT;
						end
				end
			GEN_KEY0:
				begin
					sbox_sel = G_FUNCTION;
					rd_count_en = ENABLE;
				end
			GEN_KEY1:
				begin
					key_en = EN_KEY_1 | EN_KEY_0;
					key_sel = KEY_OUT;
					bypass_key_en = ENABLE;
				end
			GEN_KEY2:
				begin
					key_en = EN_KEY_2;
					key_sel = KEY_OUT;
					bypass_key_en = ENABLE;
				end
			GEN_KEY3:
				begin
					key_en = EN_KEY_3;
					key_sel = KEY_OUT;
					bypass_key_en = ENABLE;
				end
			READY:
				begin
					if(op_mode == KEY_DERIVATION)
						key_derivation_en = ENABLE;
				end
		endcase
	end

// Round Counter
always @(posedge clk, negedge rst_n)
	begin
		if(!rst_n)
			rd_count <= INITIAL_ROUND;
		else
			if(state == IDLE || (state == GEN_KEY3 && last_round))
				rd_count <= INITIAL_ROUND;
			else 
				if(rd_count_en)
					rd_count <= rd_count + 1'b1;
	end

assign round = rd_count;
assign first_round = (rd_count == INITIAL_ROUND);

// v8.3: Simplify last_round condition to equality checks (L6 expression transform)
assign last_round = (rd_count == NUMBER_ROUND) || (rd_count == NUMBER_ROUND_INC);

endmodule