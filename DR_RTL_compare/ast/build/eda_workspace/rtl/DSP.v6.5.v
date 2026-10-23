module DSP (clk, opMode, CEA, CEB, CEC, CECarryIn, CED, CEM, CEOpMode, CEP,
                rstA, rstB, rstC, rstCarryIn, rstD, rstM, rstOpMode, rstP,
                A, B, D, C, carryIn, BCIn, PCIn,
                BCOut, PCOut, P, M, carryOut, carryOutF);
    parameter A0REG = 0;
    parameter A1REG = 1;
    parameter B0REG = 0;
    parameter B1REG = 1;

    parameter CREG = 1;
    parameter DREG = 1;
    parameter MREG = 1;
    parameter PREG = 1;
    parameter CARRYINREG = 1;
    parameter CARRYOUTREG = 1;
    parameter OPMODEREG = 1;

    parameter CARRYINSEL = "OPMODE5";
    parameter B_INPUT = "DIRECT";
    parameter RSTTYPE = "SYNC";

    input clk, carryIn, rstA, rstB, rstC, rstCarryIn, rstD, rstM, rstOpMode, rstP,
            CEA, CEB, CEC, CECarryIn, CED, CEM, CEOpMode, CEP;
    input [17:0] A, B, D, BCIn;
    input [47:0] C, PCIn;
    input [7:0] opMode;

    output carryOut, carryOutF;
    output [17:0] BCOut;
    output [47:0] PCOut, P;
    output [35:0] M;

    wire [7:0] opModeRegOut;
    wire [17:0] dRegOut, bIn, b0RegOut, a0RegOut, b1RegIn,
                b1RegOut, a1RegOut;
    wire [35:0] mulOut;
    wire carryInRegIn, carryInRegOut, carryOutRegIn;
    wire [47:0] cRegOut, Z, X, pRegIn;

    RegMux #(8, RSTTYPE, OPMODEREG) opReg (clk, CEOpMode, rstOpMode, opMode, opModeRegOut);
    RegMux #(18, RSTTYPE, DREG) dReg (clk, CED, rstD, D, dRegOut);
    RegMux #(18, RSTTYPE, B0REG) b0Reg (clk, CEB, rstB, bIn, b0RegOut);
    RegMux #(18, RSTTYPE, A0REG) a0Reg (clk, CEA, rstA, A, a0RegOut);
    RegMux #(48, RSTTYPE, CREG) cReg (clk, CEC, rstC, C, cRegOut);

    RegMux #(18, RSTTYPE, B1REG) b1Reg (clk, CEB, rstB, b1RegIn, b1RegOut);
    RegMux #(18, RSTTYPE, A1REG) a1Reg (clk, CEA, rstA, a0RegOut, a1RegOut);

    Mul mul (b1RegOut, a1RegOut, mulOut);

    RegMux #(36, RSTTYPE, MREG) mulReg (clk, CEM, rstM, mulOut, M);
    RegMux #(1, RSTTYPE, CARRYINREG) carryInReg (clk, CECarryIn, rstCarryIn, carryInRegIn, carryInRegOut);

    // Pre-decode opMode bits used in multiple conditions
    wire [1:0] zSel = opModeRegOut[3:2];
    wire [1:0] xSel = opModeRegOut[1:0];
    
    // Pre-compute Z mux conditions
    wire zSel_00 = (zSel == 2'b00);
    wire zSel_01 = (zSel == 2'b01);
    wire zSel_10 = (zSel == 2'b10);
    
    // Pre-compute X mux conditions
    wire xSel_00 = (xSel == 2'b00);
    wire xSel_01 = (xSel == 2'b01);
    wire xSel_10 = (xSel == 2'b10);

    // L5 assignment-slice optimization: Combined condition pre-computation for b1RegIn
    // Replaces two-level mux (PreAddSub + b1RegIn mux) with single 3:1 mux
    // Additional L5 optimization: Pre-compute sum/difference with shared intermediate
    wire [17:0] d_plus_b = dRegOut + b0RegOut;  // Pre-compute addition
    wire [17:0] d_minus_b = dRegOut - b0RegOut; // Pre-compute subtraction
    
    wire sel_b0 = ~opModeRegOut[4];
    wire sel_add = opModeRegOut[4] & ~opModeRegOut[6];
    wire sel_sub = opModeRegOut[4] & opModeRegOut[6];
    
    assign b1RegIn = sel_b0 ? b0RegOut : (sel_add ? d_plus_b : d_minus_b);

    // L5/L6 optimization: Pre-compute carryInRegIn condition with balanced tree
    // Extract shared sub-condition for CARRYINSEL
    wire sel_opmode5 = (CARRYINSEL == "OPMODE5");
    wire sel_carryin = (CARRYINSEL == "CARRYIN");
    wire sel_default = ~(sel_opmode5 | sel_carryin);
    
    // Pre-compute candidates for carryInRegIn
    wire carryIn_from_opmode = opModeRegOut[5];
    wire carryIn_from_carryin = carryIn;
    wire carryIn_default = 1'b0;
    
    // Balanced mux selection
    assign carryInRegIn = sel_opmode5 ? carryIn_from_opmode :
                          sel_carryin ? carryIn_from_carryin :
                          carryIn_default;

    // Balanced 2-level Z mux tree: all four candidates evaluated in parallel
    wire [47:0] z_cand_00 = 48'b0;
    wire [47:0] z_cand_01 = PCIn;
    wire [47:0] z_cand_10 = P;
    wire [47:0] z_cand_11 = cRegOut;
    wire [47:0] z_lo = zSel[0] ? z_cand_01 : z_cand_00;
    wire [47:0] z_hi = zSel[0] ? z_cand_11 : z_cand_10;
    assign Z = zSel[1] ? z_hi : z_lo;

    // L5/L6 optimization: Pre-compute the concatenated signal for x_cand_11
    // to avoid recomputation and balance load
    wire [47:0] d_a1_b1_concat = {dRegOut, a1RegOut, b1RegOut};
    
    // Balanced 2-level X mux tree: all four candidates evaluated in parallel
    wire [47:0] x_cand_00 = 48'b0;
    wire [47:0] x_cand_01 = M;
    wire [47:0] x_cand_10 = P;
    wire [47:0] x_cand_11 = d_a1_b1_concat;  // Use pre-computed concatenation
    wire [47:0] x_lo = xSel[0] ? x_cand_01 : x_cand_00;
    wire [47:0] x_hi = xSel[0] ? x_cand_11 : x_cand_10;
    assign X = xSel[1] ? x_hi : x_lo;

    PostAddSub PostAS (opModeRegOut[7], X, Z, carryInRegOut, pRegIn, carryOutRegIn);

    RegMux #(1, RSTTYPE, CARRYOUTREG) carryOutReg (clk, CECarryIn, rstCarryIn, carryOutRegIn, carryOut);
    RegMux #(48, RSTTYPE, PREG) pReg (clk, CEP, rstP, pRegIn, P);

    generate
        if (B_INPUT == "DIRECT") begin
            assign bIn = B;
        end else if (B_INPUT == "CASCADE") begin
            assign bIn = BCIn;
        end else begin
            assign bIn = 0;
        end
    endgenerate

    assign BCOut = b1RegOut;
    assign carryOutF = carryOut;
    assign PCOut = P;
endmodule


module Mul (in0, in1, out);
    input [17:0] in0, in1;

    output [35:0] out;

    assign out = in0 * in1;
endmodule


module PostAddSub (mode, in0, in1, cin, out, carryOut);
    input mode, cin;
    input [47:0] in0, in1;

    output [47:0] out;
    output carryOut;

    // L5/L6 optimization: Carry-select with 8-bit blocks (6 blocks)
    // Reduces per-block carry propagation depth from 12 to 8 bits
    // while maintaining balanced block sizes across 48 bits

    wire [7:0] in0_b0 = in0[7:0];
    wire [7:0] in0_b1 = in0[15:8];
    wire [7:0] in0_b2 = in0[23:16];
    wire [7:0] in0_b3 = in0[31:24];
    wire [7:0] in0_b4 = in0[39:32];
    wire [7:0] in0_b5 = in0[47:40];
    wire [7:0] in1_b0 = in1[7:0];
    wire [7:0] in1_b1 = in1[15:8];
    wire [7:0] in1_b2 = in1[23:16];
    wire [7:0] in1_b3 = in1[31:24];
    wire [7:0] in1_b4 = in1[39:32];
    wire [7:0] in1_b5 = in1[47:40];

    // Complement for subtraction path
    wire [7:0] in0_comp_b0 = ~in0_b0;
    wire [7:0] in0_comp_b1 = ~in0_b1;
    wire [7:0] in0_comp_b2 = ~in0_b2;
    wire [7:0] in0_comp_b3 = ~in0_b3;
    wire [7:0] in0_comp_b4 = ~in0_b4;
    wire [7:0] in0_comp_b5 = ~in0_b5;

    // Mode-dependent operand selection: add uses in0, sub uses ~in0
    wire [7:0] op_b0 = mode ? in0_comp_b0 : in0_b0;
    wire [7:0] op_b1 = mode ? in0_comp_b1 : in0_b1;
    wire [7:0] op_b2 = mode ? in0_comp_b2 : in0_b2;
    wire [7:0] op_b3 = mode ? in0_comp_b3 : in0_b3;
    wire [7:0] op_b4 = mode ? in0_comp_b4 : in0_b4;
    wire [7:0] op_b5 = mode ? in0_comp_b5 : in0_b5;

    // Mode-dependent initial carry: add uses cin, sub uses ~cin
    wire cin_xor = cin ^ mode;

    // Carry-select block 0: bits [7:0]
    wire [8:0] cs_b0_c0 = in1_b0 + op_b0 + 0;
    wire [8:0] cs_b0_c1 = in1_b0 + op_b0 + 1;
    wire [7:0] sum_b0 = cin_xor ? cs_b0_c1[7:0] : cs_b0_c0[7:0];
    wire carry_b0 = cin_xor ? cs_b0_c1[8] : cs_b0_c0[8];

    // Carry-select block 1: bits [15:8]
    wire [8:0] cs_b1_c0 = in1_b1 + op_b1 + 0;
    wire [8:0] cs_b1_c1 = in1_b1 + op_b1 + 1;
    wire [7:0] sum_b1 = carry_b0 ? cs_b1_c1[7:0] : cs_b1_c0[7:0];
    wire carry_b1 = carry_b0 ? cs_b1_c1[8] : cs_b1_c0[8];

    // Carry-select block 2: bits [23:16]
    wire [8:0] cs_b2_c0 = in1_b2 + op_b2 + 0;
    wire [8:0] cs_b2_c1 = in1_b2 + op_b2 + 1;
    wire [7:0] sum_b2 = carry_b1 ? cs_b2_c1[7:0] : cs_b2_c0[7:0];
    wire carry_b2 = carry_b1 ? cs_b2_c1[8] : cs_b2_c0[8];

    // Carry-select block 3: bits [31:24]
    wire [8:0] cs_b3_c0 = in1_b3 + op_b3 + 0;
    wire [8:0] cs_b3_c1 = in1_b3 + op_b3 + 1;
    wire [7:0] sum_b3 = carry_b2 ? cs_b3_c1[7:0] : cs_b3_c0[7:0];
    wire carry_b3 = carry_b2 ? cs_b3_c1[8] : cs_b3_c0[8];

    // Carry-select block 4: bits [39:32]
    wire [8:0] cs_b4_c0 = in1_b4 + op_b4 + 0;
    wire [8:0] cs_b4_c1 = in1_b4 + op_b4 + 1;
    wire [7:0] sum_b4 = carry_b3 ? cs_b4_c1[7:0] : cs_b4_c0[7:0];
    wire carry_b4 = carry_b3 ? cs_b4_c1[8] : cs_b4_c0[8];

    // Carry-select block 5: bits [47:40]
    wire [8:0] cs_b5_c0 = in1_b5 + op_b5 + 0;
    wire [8:0] cs_b5_c1 = in1_b5 + op_b5 + 1;
    wire [7:0] sum_b5 = carry_b4 ? cs_b5_c1[7:0] : cs_b5_c0[7:0];
    wire carry_b5 = carry_b4 ? cs_b5_c1[8] : cs_b5_c0[8];

    assign out = {sum_b5, sum_b4, sum_b3, sum_b2, sum_b1, sum_b0};
    // Invert carry for subtraction (borrow semantics)
    assign carryOut = carry_b5 ^ mode;
endmodule


module RegMux (clk, CE, rst, data, out);
    parameter N = 18;
    parameter RSTTYPE = "SYNC";
    parameter DATAREG = 0;
    
    input clk, CE, rst;
    input [N - 1 : 0] data;

    output [N - 1 : 0] out;

    reg [N - 1 : 0] data_reg;

    generate
        if (DATAREG) begin
            if (RSTTYPE == "SYNC") begin
                always @(posedge clk) begin
                    if (rst) begin
                        data_reg <= 0;
                    end else if (CE) begin
                        data_reg <= data;
                    end
                end
            end else begin
                always @(posedge clk or posedge rst) begin
                    if (rst) begin
                        data_reg <= 0;
                    end else if (CE) begin
                        data_reg <= data;
                    end
                end
            end
        end
    endgenerate

    generate
        if (DATAREG) begin
            assign out = data_reg;
        end else begin
            assign out = data;
        end
    endgenerate
endmodule
