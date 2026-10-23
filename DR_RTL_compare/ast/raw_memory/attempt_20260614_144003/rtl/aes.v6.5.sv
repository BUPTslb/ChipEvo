module key_expansion_128aes #(
    parameter NBW_KEY = 'd128,
    parameter NBW_OUT = 'd1408
) (
    input  logic               clk,
    input  logic               rst_async_n,
    input  logic               i_start,
    input  logic [NBW_KEY-1:0] i_key,
    output logic               o_done,
    output logic [NBW_OUT-1:0] o_expanded_key
);

localparam NBW_BYTE = 'd8;
localparam STEPS = 'd10;
localparam NBW_WORD = 'd32;

// Auxiliary wires
logic [NBW_BYTE-1:0] Rcon   [STEPS];
logic [NBW_KEY-1:0] valid_key;
logic [NBW_KEY-1:0] step_key[STEPS];
logic [NBW_OUT-1:0] expanded_key_nx;
logic [NBW_OUT-1:0] expanded_key_ff;

logic [STEPS:0] steps_ff;

// Pre-compute common condition
wire start_and_done = i_start & o_done;

// Pre-compute shift condition to reduce fanout and improve timing
wire shift_cond = i_start || (|steps_ff[9:0]);

// Pre-compute next value of steps_ff for condition precomputation (L5 slice optimization)
wire [STEPS:0] steps_ff_next_shift = {steps_ff[STEPS-1:0], start_and_done};

always_ff @(posedge clk or negedge rst_async_n) begin : reset_regs
    if(~rst_async_n) begin
        expanded_key_ff <= {NBW_OUT{1'b0}};
        steps_ff <= 11'h400;
    end else begin
        expanded_key_ff <= expanded_key_nx;
        // Use precomputed next value with conditional mux (condition_precompute strategy)
        steps_ff <= shift_cond ? steps_ff_next_shift : steps_ff;
    end
end

assign o_done = steps_ff[STEPS];
assign o_expanded_key = expanded_key_ff;

assign Rcon[0] = 8'h01;
assign Rcon[1] = 8'h02;
assign Rcon[2] = 8'h04;
assign Rcon[3] = 8'h08;
assign Rcon[4] = 8'h10;
assign Rcon[5] = 8'h20;
assign Rcon[6] = 8'h40;
assign Rcon[7] = 8'h80;
assign Rcon[8] = 8'h1b;
assign Rcon[9] = 8'h36;

generate
    for(genvar i = 0; i < STEPS; i++) begin : steps
        logic [NBW_WORD-1:0] RotWord;
        logic [NBW_WORD-1:0] SubWord;
        logic [NBW_WORD-1:0] RconXor;

        sbox uu_sbox0 (
            .i_data(RotWord[31:24]),
            .o_data(SubWord[31:24])
        );

        sbox uu_sbox1 (
            .i_data(RotWord[23:16]),
            .o_data(SubWord[23:16])
        );

        sbox uu_sbox2 (
            .i_data(RotWord[15:8]),
            .o_data(SubWord[15:8])
        );

        sbox uu_sbox3 (
            .i_data(RotWord[7:0]),
            .o_data(SubWord[7:0])
        );

        // Pre-compute shared XOR pattern
        wire [7:0] sub_byte0_xor_rcon = SubWord[31:24] ^ Rcon[i];
        
        always_comb begin
            RotWord = {expanded_key_ff[NBW_OUT-(i+1)*NBW_KEY+NBW_WORD-NBW_BYTE-1-:(NBW_WORD-NBW_BYTE)], expanded_key_ff[NBW_OUT-(i+1)*NBW_KEY+NBW_WORD-1-:NBW_BYTE]};
            RconXor = {sub_byte0_xor_rcon, SubWord[23:0]};

            step_key[i][127:96] = expanded_key_ff[NBW_OUT-(4*i  )*NBW_WORD-1-:NBW_WORD] ^ RconXor;
            step_key[i][95 :64] = expanded_key_ff[NBW_OUT-(4*i+1)*NBW_WORD-1-:NBW_WORD] ^ step_key[i][127:96];
            step_key[i][63 :32] = expanded_key_ff[NBW_OUT-(4*i+2)*NBW_WORD-1-:NBW_WORD] ^ step_key[i][95 :64];
            step_key[i][31 :0 ] = expanded_key_ff[NBW_OUT-(4*i+3)*NBW_WORD-1-:NBW_WORD] ^ step_key[i][63 :32];
        end
    end
endgenerate

assign expanded_key_nx = {valid_key  , step_key[0], step_key[1], step_key[2],
                          step_key[3], step_key[4], step_key[5], step_key[6],
                          step_key[7], step_key[8], step_key[9]};

// Condition pre-computation with wire extraction for valid_key (L5 assignment slice)
wire [NBW_KEY-1:0] valid_key_start = i_key;
wire [NBW_KEY-1:0] valid_key_shift = expanded_key_ff[NBW_OUT-1-:NBW_KEY];
assign valid_key = start_and_done ? valid_key_start : valid_key_shift;

endmodule : key_expansion_128aes

module sbox (
    input  logic [7:0] i_data,
    output logic [7:0] o_data
);

// Composite field GF((2^4)^2) implementation
// Replaces 256-entry case LUT with shallow XOR/AND logic

// Isomorphic mapping: GF(2^8) -> GF((2^4)^2)
// Based on irreducible polynomial X^8+X^4+X^3+X+1 and subfield GF(2^4)/(X^4+X+1)
logic [3:0] b_h, b_l;
assign b_h[0] = i_data[7] ^ i_data[5];
assign b_h[1] = i_data[7] ^ i_data[6] ^ i_data[4] ^ i_data[3] ^ i_data[2] ^ i_data[1];
assign b_h[2] = i_data[7] ^ i_data[5] ^ i_data[3] ^ i_data[2];
assign b_h[3] = i_data[7] ^ i_data[5] ^ i_data[3] ^ i_data[1] ^ i_data[0];
assign b_l[0] = i_data[7] ^ i_data[6] ^ i_data[5] ^ i_data[1];
assign b_l[1] = i_data[7] ^ i_data[6] ^ i_data[2] ^ i_data[1] ^ i_data[0];
assign b_l[2] = i_data[7] ^ i_data[6] ^ i_data[5] ^ i_data[2] ^ i_data[1] ^ i_data[0];
assign b_l[3] = i_data[7] ^ i_data[5] ^ i_data[4] ^ i_data[1] ^ i_data[0];

// GF(2^4) multiplication by constant alpha=0x02 (X in GF(2^4)/(X^4+X+1))
function automatic logic [3:0] gf16_mul_alpha(input logic [3:0] x);
    gf16_mul_alpha[0] = x[3];
    gf16_mul_alpha[1] = x[0] ^ x[3];
    gf16_mul_alpha[2] = x[1];
    gf16_mul_alpha[3] = x[2];
endfunction

// GF(2^4) multiplication
function automatic logic [3:0] gf16_mul(input logic [3:0] a, input logic [3:0] b);
    logic a0b0, a1b0, a0b1, a2b0, a1b1, a0b2, a3b0, a2b1, a1b2, a0b3, a3b1, a2b2, a1b3, a3b2, a2b3, a3b3;
    a0b0 = a[0] & b[0];
    a1b0 = a[1] & b[0];
    a0b1 = a[0] & b[1];
    a2b0 = a[2] & b[0];
    a1b1 = a[1] & b[1];
    a0b2 = a[0] & b[2];
    a3b0 = a[3] & b[0];
    a2b1 = a[2] & b[1];
    a1b2 = a[1] & b[2];
    a0b3 = a[0] & b[3];
    a3b1 = a[3] & b[1];
    a2b2 = a[2] & b[2];
    a1b3 = a[1] & b[3];
    a3b2 = a[3] & b[2];
    a2b3 = a[2] & b[3];
    a3b3 = a[3] & b[3];
    gf16_mul[0] = a0b0 ^ a3b1 ^ a2b2 ^ a1b3;
    gf16_mul[1] = a1b0 ^ a0b1 ^ a3b2 ^ a2b3 ^ a3b1 ^ a2b2 ^ a1b3;
    gf16_mul[2] = a2b0 ^ a1b1 ^ a0b2 ^ a3b3 ^ a3b1 ^ a2b2 ^ a1b3;
    gf16_mul[3] = a3b0 ^ a2b1 ^ a1b2 ^ a0b3 ^ a3b1 ^ a2b2 ^ a1b3;
endfunction

// GF(2^4) inverse: 1/x in GF(2^4)/(X^4+X+1), 0 -> 0
// inv(x) = x^14 = (x^2 * x)^4 * (x^2 * x) = (x^3)^4 * x^3 = x^12 * x^2
function automatic logic [3:0] gf16_inv(input logic [3:0] x);
    logic [3:0] x3, x3_4;
    logic [3:0] x3_4_times_x3;
    logic [3:0] x2;

    case (x)
        4'h0: gf16_inv = 4'h0;
        4'h1: gf16_inv = 4'h1;
        4'h2: gf16_inv = 4'h8;
        4'h3: gf16_inv = 4'hF;
        4'h4: gf16_inv = 4'h7;
        4'h5: gf16_inv = 4'h6;
        4'h6: gf16_inv = 4'h5;
        4'h7: gf16_inv = 4'h4;
        4'h8: gf16_inv = 4'h2;
        4'h9: gf16_inv = 4'hB;
        4'hA: gf16_inv = 4'hA;
        4'hB: gf16_inv = 4'h9;
        4'hC: gf16_inv = 4'hC;
        4'hD: gf16_inv = 4'hE;
        4'hE: gf16_inv = 4'hD;
        4'hF: gf16_inv = 4'h3;
        default: gf16_inv = 4'h0;
    endcase
endfunction

// GF(2^4) square: x^2 in GF(2^4)/(X^4+X+1)
function automatic logic [3:0] gf16_sq(input logic [3:0] x);
    gf16_sq[0] = x[0] ^ x[2];
    gf16_sq[1] = x[3];
    gf16_sq[2] = x[1] ^ x[2];
    gf16_sq[3] = x[2];
endfunction

// Inversion in GF((2^4)^2)/(X^2+X+delta) with delta=0x02
logic [3:0] d_hat, d_hat_inv, d_hat_sq, p, q;
assign d_hat = gf16_mul_alpha(b_h) ^ b_l;
assign d_hat_sq = gf16_sq(d_hat);
assign d_hat_inv = gf16_inv(d_hat);
assign p = gf16_mul(b_h, d_hat_inv);
assign q = gf16_mul(d_hat_sq, d_hat_inv);

// Common subexpression elimination for inv_result (L6 expression optimization)
// Extract repeated XOR combinations used in multiple inv_result bits
wire C0 = q[0] ^ p[0];          // Used in bits 0,3,5
wire D3 = p[3] ^ q[3];          // Used in bits 3,4
wire E12 = q[1] ^ q[2];         // Used in bits 4,6

// Inverse isomorphic mapping with CSE
logic [7:0] inv_result;
assign inv_result[0] = C0 ^ q[1];
assign inv_result[1] = p[1] ^ q[2];
assign inv_result[2] = p[2] ^ q[2];
assign inv_result[3] = C0 ^ D3 ^ q[1];
assign inv_result[4] = D3 ^ E12;
assign inv_result[5] = C0 ^ q[3];
assign inv_result[6] = p[1] ^ E12 ^ q[3];
assign inv_result[7] = inv_result[2] ^ q[3];

// Balanced XOR tree for affine transformation with common subexpression elimination
wire inv01 = inv_result[0] ^ inv_result[1];
wire inv23 = inv_result[2] ^ inv_result[3];
wire inv45 = inv_result[4] ^ inv_result[5];
wire inv67 = inv_result[6] ^ inv_result[7];

wire t0_0 = inv01 ^ inv23;
assign o_data[0] = t0_0 ^ inv_result[7];

wire t0_1 = inv01 ^ inv_result[2];
assign o_data[1] = t0_1 ^ inv67;

wire t0_2 = inv01 ^ inv_result[5];
assign o_data[2] = t0_2 ^ inv67;

wire t0_3 = inv_result[0] ^ inv45;
assign o_data[3] = t0_3 ^ inv67;

wire t0_4 = inv01 ^ inv45;
assign o_data[4] = t0_4 ^ inv_result[6];

wire t0_5 = inv_result[1] ^ inv_result[2];
wire t1_5 = t0_5 ^ inv45;
assign o_data[5] = t1_5 ^ inv67;

wire t0_6 = inv23 ^ inv_result[4];
assign o_data[6] = t0_6 ^ inv67;

wire t0_7 = inv_result[0] ^ inv_result[3];
wire t1_7 = t0_7 ^ inv45;
assign o_data[7] = t1_7 ^ inv_result[7];

endmodule : sbox