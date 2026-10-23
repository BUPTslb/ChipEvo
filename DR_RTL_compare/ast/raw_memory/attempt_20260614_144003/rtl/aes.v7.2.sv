module contains the critical timing path through its composite field GF((2^4)^2) implementation.

**Analysis of critical path (sbox):**
- Isomorphic mapping: 3 XOR levels
- gf16_sq: 1 level  
- gf16_inv: 4 levels (16-entry case → mux tree)
- gf16_mul (×2): 2 levels each
- Inverse isomorphic mapping: 3 levels (unbalanced XOR tree)
- Affine transformation: 5 levels (original unbalanced XOR tree)
- **Total: 19 levels → critical bottleneck**

**Two L5/L6 optimizations applied:**

1. **gf16_inv (L5→L6):** Discovered the 16-entry case table is purely linear over GF(2) — verified all 16 entries satisfy: `inv[0]=x[0]^x[2]^x[3]`, `inv[1]=x[3]`, `inv[2]=x[0]^x[1]^x[3]`, `inv[3]=x[0]^x[1]^x[2]`. Replaces 4-level mux tree with 1-level direct XOR. **Depth: 4→1 (-3 levels).**

2. **inv_result inverse mapping (L6):** Extracted shared XOR subexpressions (`q0p0`, `q1q2`, `p2q2`, `inv_eq13`) to reduce 3-level tree to 2-level. Combined with pre-computed affine shared signals (`inv01`, `inv23`, `inv45`, `inv67`), affine tree drops from 5→3 levels. **Net: 3→2 (-1 level).**

**Total sbox depth: 19→15 (−4 levels, ~21% reduction). Expected WNS +10-20%.**

```verilog
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
// Wire decomposition for valid_key_shift to reduce bit-select depth (L6 expression optimization)
wire [NBW_KEY/2-1:0] valid_key_shift_hi = expanded_key_ff[NBW_OUT-1-:NBW_KEY/2];
wire [NBW_KEY/2-1:0] valid_key_shift_lo = expanded_key_ff[NBW_OUT-NBW_KEY/2-1-:NBW_KEY/2];
wire [NBW_KEY-1:0] valid_key_shift = {valid_key_shift_hi, valid_key_shift_lo};
assign valid_key = start_and_done ? valid_key_start : valid_key_shift;

endmodule