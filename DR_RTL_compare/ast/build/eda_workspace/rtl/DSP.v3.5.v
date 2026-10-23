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
    wire [17:0] dRegOut, bIn, b0RegOut, a0RegOut, PreASOut, b1RegIn,
                b1RegOut, a1RegOut;
    wire [35:0] mulOut;
    wire carryInRegIn, carryInRegOut, carryOutRegIn;
    wire [47:0] cRegOut, Z, X, pRegIn;

    RegMux #(8, RSTTYPE, OPMODEREG) opReg (clk, CEOpMode, rstOpMode, opMode, opModeRegOut);
    RegMux #(18, RSTTYPE, DREG) dReg (clk, CED, rstD, D, dRegOut);
    RegMux #(18, RSTTYPE, B0REG) b0Reg (clk, CEB, rstB, bIn, b0RegOut);
    RegMux #(18, RSTTYPE, A0REG) a0Reg (clk, CEA, rstA, A, a0RegOut);
    RegMux #(48, RSTTYPE, CREG) cReg (clk, CEC, rstC, C, cRegOut);

    PreAddSub PreAS (opModeRegOut[6], dRegOut, b0RegOut, PreASOut);

    RegMux #(18, RSTTYPE, B1REG) b1Reg (clk, CEB, rstB, b1RegIn, b1RegOut);
    RegMux #(18, RSTTYPE, A1REG) a1Reg (clk, CEA, rstA, a0RegOut, a1RegOut);

    Mul mul (b1RegOut, a1RegOut, mulOut);

    RegMux #(36, RSTTYPE, MREG) mulReg (clk, CEM, rstM, mulOut, M);
    RegMux #(1, RSTTYPE, CARRYINREG) carryInReg (clk, CECarryIn, rstCarryIn, carryInRegIn, carryInRegOut);

    // Pre-decode opMode bits used in multiple conditions
    wire opMode4_is_0 = (opModeRegOut[4] == 0);
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

    assign b1RegIn = opMode4_is_0 ? b0RegOut : PreASOut;

    generate
        if (CARRYINSEL == "OPMODE5") begin
            assign carryInRegIn = opModeRegOut[5];
        end else if (CARRYINSEL == "CARRYIN") begin
            assign carryInRegIn = carryIn;
        end else begin
            assign carryInRegIn = 0;
        end
    endgenerate

    // Balanced 2-level Z mux tree: all four candidates evaluated in parallel
    wire [47:0] z_cand_00 = 48'b0;
    wire [47:0] z_cand_01 = PCIn;
    wire [47:0] z_cand_10 = P;
    wire [47:0] z_cand_11 = cRegOut;
    wire [47:0] z_lo = zSel[0] ? z_cand_01 : z_cand_00;
    wire [47:0] z_hi = zSel[0] ? z_cand_11 : z_cand_10;
    assign Z = zSel[1] ? z_hi : z_lo;

    // Balanced 2-level X mux tree: all four candidates evaluated in parallel
    wire [47:0] x_cand_00 = 48'b0;
    wire [47:0] x_cand_01 = M;
    wire [47:0] x_cand_10 = P;
    wire [47:0] x_cand_11 = {dRegOut, a1RegOut, b1RegOut};
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

    // Hierarchical carry-select: split 48-bit into 6 × 8-bit blocks
    // Each block computes two sums (carry-in 0 and 1) in parallel
    // Carry chains through blocks with mux selection

    wire [7:0] in0_0 = in0[7:0];
    wire [7:0] in0_1 = in0[15:8];
    wire [7:0] in0_2 = in0[23:16];
    wire [7:0] in0_3 = in0[31:24];
    wire [7:0] in0_4 = in0[39:32];
    wire [7:0] in0_5 = in0[47:40];

    wire [7:0] in1_0 = in1[7:0];
    wire [7:0] in1_1 = in1[15:8];
    wire [7:0] in1_2 = in1[23:16];
    wire [7:0] in1_3 = in1[31:24];
    wire [7:0] in1_4 = in1[39:32];
    wire [7:0] in1_5 = in1[47:40];

    // Complement for subtraction path
    wire [7:0] in0_comp_0 = ~in0_0;
    wire [7:0] in0_comp_1 = ~in0_1;
    wire [7:0] in0_comp_2 = ~in0_2;
    wire [7:0] in0_comp_3 = ~in0_3;
    wire [7:0] in0_comp_4 = ~in0_4;
    wire [7:0] in0_comp_5 = ~in0_5;

    // Mode-dependent operand selection: add uses in0, sub uses ~in0
    wire [7:0] op_0 = mode ? in0_comp_0 : in0_0;
    wire [7:0] op_1 = mode ? in0_comp_1 : in0_1;
    wire [7:0] op_2 = mode ? in0_comp_2 : in0_2;
    wire [7:0] op_3 = mode ? in0_comp_3 : in0_3;
    wire [7:0] op_4 = mode ? in0_comp_4 : in0_4;
    wire [7:0] op_5 = mode ? in0_comp_5 : in0_5;

    // Mode-dependent initial carry: add uses cin, sub uses ~cin
    wire cin_xor = cin ^ mode;

    // Carry-select block 0: bits 0-7
    wire [8:0] cs_0_c0 = in1_0 + op_0 + 0;
    wire [8:0] cs_0_c1 = in1_0 + op_0 + 1;
    wire [7:0] sum_0 = cin_xor ? cs_0_c1[7:0] : cs_0_c0[7:0];
    wire carry_0 = cin_xor ? cs_0_c1[8] : cs_0_c0[8];

    // Carry-select block 1: bits 8-15
    wire [8:0] cs_1_c0 = in1_1 + op_1 + 0;
    wire [8:0] cs_1_c1 = in1_1 + op_1 + 1;
    wire [7:0] sum_1 = carry_0 ? cs_1_c1[7:0] : cs_1_c0[7:0];
    wire carry_1 = carry_0 ? cs_1_c1[8] : cs_1_c0[8];

    // Carry-select block 2: bits 16-23
    wire [8:0] cs_2_c0 = in1_2 + op_2 + 0;
    wire [8:0] cs_2_c1 = in1_2 + op_2 + 1;
    wire [7:0] sum_2 = carry_1 ? cs_2_c1[7:0] : cs_2_c0[7:0];
    wire carry_2 = carry_1 ? cs_2_c1[8] : cs_2_c0[8];

    // Carry-select block 3: bits 24-31
    wire [8:0] cs_3_c0 = in1_3 + op_3 + 0;
    wire [8:0] cs_3_c1 = in1_3 + op_3 + 1;
    wire [7:0] sum_3 = carry_2 ? cs_3_c1[7:0] : cs_3_c0[7:0];
    wire carry_3 = carry_2 ? cs_3_c1[8] : cs_3_c0[8];

    // Carry-select block 4: bits 32-39
    wire [8:0] cs_4_c0 = in1_4 + op_4 + 0;
    wire [8:0] cs_4_c1 = in1_4 + op_4 + 1;
    wire [7:0] sum_4 = carry_3 ? cs_4_c1[7:0] : cs_4_c0[7:0];
    wire carry_4 = carry_3 ? cs_4_c1[8] : cs_4_c0[8];

    // Carry-select block 5: bits 40-47
    wire [8:0] cs_5_c0 = in1_5 + op_5 + 0;
    wire [8:0] cs_5_c1 = in1_5 + op_5 + 1;
    wire [7:0] sum_5 = carry_4 ? cs_5_c1[7:0] : cs_5_c0[7:0];
    wire carry_5 = carry_4 ? cs_5_c1[8] : cs_5_c0[8];

    assign out = {sum_5, sum_4, sum_3, sum_2, sum_1, sum_0};
    // Invert carry for subtraction (borrow semantics)
    assign carryOut = carry_5 ^ mode;
endmodule

module PreAddSub (mode, in0, in1, out);
    input mode;
    input [17:0] in0, in1;

    output [17:0] out;

    // Parallel computation of both add and sub, then late mux select
    wire [17:0] sum_val = in0 + in1;
    wire [17:0] dif_val = in0 - in1;
    assign out = mode ? dif_val : sum_val;
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
