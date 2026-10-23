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

always_ff @(posedge clk or negedge rst_async_n) begin : reset_regs
    if(~rst_async_n) begin
        expanded_key_ff <= {NBW_OUT{1'b0}};
        steps_ff <= 11'h400;
    end else begin
        expanded_key_ff <= expanded_key_nx;
        if(i_start || (|steps_ff[9:0])) begin
            steps_ff <= {steps_ff[STEPS-1:0], (i_start & o_done)};
        end
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

        // L5 common_subexpression: prefix XOR wires (balanced tree, depth 2)
        logic [NBW_WORD-1:0] prev_key_0, prev_key_1, prev_key_2, prev_key_3;
        logic [NBW_WORD-1:0] xor_ab, xor_cd;
        logic [NBW_WORD-1:0] prefix_xor_0, prefix_xor_1, prefix_xor_2, prefix_xor_3;

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

        // Prefix XOR extraction — runs in parallel with SBox substitution
        assign prev_key_0 = expanded_key_ff[NBW_OUT-(4*i  )*NBW_WORD-1-:NBW_WORD];
        assign prev_key_1 = expanded_key_ff[NBW_OUT-(4*i+1)*NBW_WORD-1-:NBW_WORD];
        assign prev_key_2 = expanded_key_ff[NBW_OUT-(4*i+2)*NBW_WORD-1-:NBW_WORD];
        assign prev_key_3 = expanded_key_ff[NBW_OUT-(4*i+3)*NBW_WORD-1-:NBW_WORD];

        assign xor_ab = prev_key_0 ^ prev_key_1;          // depth 1
        assign xor_cd = prev_key_2 ^ prev_key_3;          // depth 1

        assign prefix_xor_0 = prev_key_0;                  // depth 0
        assign prefix_xor_1 = xor_ab;                      // depth 1
        assign prefix_xor_2 = xor_ab ^ prev_key_2;         // depth 2
        assign prefix_xor_3 = xor_ab ^ xor_cd;             // depth 2

        always_comb begin
            RotWord = {expanded_key_ff[NBW_OUT-(i+1)*NBW_KEY+NBW_WORD-NBW_BYTE-1-:(NBW_WORD-NBW_BYTE)], expanded_key_ff[NBW_OUT-(i+1)*NBW_KEY+NBW_WORD-1-:NBW_BYTE]};
            RconXor = {SubWord[31:24]^Rcon[i], SubWord[23:0]};

            // All four words now have uniform depth: max(prefix_depth, SBox) + 1
            step_key[i][127:96] = prefix_xor_0 ^ RconXor;
            step_key[i][95 :64] = prefix_xor_1 ^ RconXor;
            step_key[i][63 :32] = prefix_xor_2 ^ RconXor;
            step_key[i][31 :0 ] = prefix_xor_3 ^ RconXor;
        end
    end
endgenerate

assign expanded_key_nx = {valid_key  , step_key[0], step_key[1], step_key[2],
                          step_key[3], step_key[4], step_key[5], step_key[6],
                          step_key[7], step_key[8], step_key[9]};

always_comb begin
    if (i_start & o_done) begin
        valid_key = i_key;
    end else begin
        valid_key = expanded_key_ff[NBW_OUT-1-:NBW_KEY];
    end
end

endmodule