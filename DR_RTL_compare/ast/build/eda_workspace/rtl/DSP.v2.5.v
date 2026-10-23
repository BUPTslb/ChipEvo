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
    // zSel_11 = default case (11)
    
    // Pre-compute X mux conditions
    wire xSel_00 = (xSel == 2'b00);
    wire xSel_01 = (xSel == 2'b01);
    wire xSel_10 = (xSel == 2'b10);
    // xSel_11 = default case (11)

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

    // Optimized Z mux using balanced 2-level 2:1 tree structure
    wire [47:0] z_stage0_0 = zSel_00 ? 48'b0 : PCIn;
    wire [47:0] z_stage0_1 = zSel_10 ? P : cRegOut;
    wire [47:0] z_stage1 = zSel_01 ? z_stage0_0 : z_stage0_1;
    assign Z = zSel_00 ? 48'b0 : z_stage1;

    // Optimized X mux using balanced 2-level 2:1 tree structure
    wire [47:0] x_stage0_0 = xSel_00 ? 48'b0 : M;
    wire [47:0] x_stage0_1 = xSel_10 ? P : {dRegOut, a1RegOut, b1RegOut};
    wire [47:0] x_stage1 = xSel_01 ? x_stage0_0 : x_stage0_1;
    assign X = xSel_00 ? 48'b0 : x_stage1;

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

    // Optimized 48-bit adder with carry-select structure
    // Split into three 16-bit blocks
    wire [15:0] in0_lo = in0[15:0];
    wire [15:0] in1_lo = in1[15:0];
    wire [15:0] in0_mid = in0[31:16];
    wire [15:0] in1_mid = in1[31:16];
    wire [15:0] in0_hi = in0[47:32];
    wire [15:0] in1_hi = in1[47:32];

    // For addition (mode==0)
    wire [16:0] sum_lo_c0 = in0_lo + in1_lo + 0;
    wire [16:0] sum_lo_c1 = in0_lo + in1_lo + 1;
    wire [15:0] sum_lo = cin ? sum_lo_c1[15:0] : sum_lo_c0[15:0];
    wire carry_lo = cin ? sum_lo_c1[16] : sum_lo_c0[16];

    wire [16:0] sum_mid_c0 = in0_mid + in1_mid + 0;
    wire [16:0] sum_mid_c1 = in0_mid + in1_mid + 1;
    wire [15:0] sum_mid = carry_lo ? sum_mid_c1[15:0] : sum_mid_c0[15:0];
    wire carry_mid = carry_lo ? sum_mid_c1[16] : sum_mid_c0[16];

    wire [16:0] sum_hi_c0 = in0_hi + in1_hi + 0;
    wire [16:0] sum_hi_c1 = in0_hi + in1_hi + 1;
    wire [15:0] sum_hi = carry_mid ? sum_hi_c1[15:0] : sum_hi_c0[15:0];
    wire carry_hi = carry_mid ? sum_hi_c1[16] : sum_hi_c0[16];

    // For subtraction (mode==1): in1 - in0 - cin
    // This is equivalent to in1 + (~in0) + (1-cin)
    // Optimized: compute 48-bit complement once and slice
    wire [47:0] in0_comp = ~in0;
    wire [15:0] in0_comp_lo = in0_comp[15:0];
    wire [15:0] in0_comp_mid = in0_comp[31:16];
    wire [15:0] in0_comp_hi = in0_comp[47:32];
    wire cin_adj = ~cin;  // 1-cin

    wire [16:0] sub_lo_c0 = in1_lo + in0_comp_lo + 0;
    wire [16:0] sub_lo_c1 = in1_lo + in0_comp_lo + 1;
    wire [15:0] sub_lo = cin_adj ? sub_lo_c1[15:0] : sub_lo_c0[15:0];
    wire sub_carry_lo = cin_adj ? sub_lo_c1[16] : sub_lo_c0[16];

    wire [16:0] sub_mid_c0 = in1_mid + in0_comp_mid + 0;
    wire [16:0] sub_mid_c1 = in1_mid + in0_comp_mid + 1;
    wire [15:0] sub_mid = sub_carry_lo ? sub_mid_c1[15:0] : sub_mid_c0[15:0];
    wire sub_carry_mid = sub_carry_lo ? sub_mid_c1[16] : sub_mid_c0[16];

    wire [16:0] sub_hi_c0 = in1_hi + in0_comp_hi + 0;
    wire [16:0] sub_hi_c1 = in1_hi + in0_comp_hi + 1;
    wire [15:0] sub_hi = sub_carry_mid ? sub_hi_c1[15:0] : sub_hi_c0[15:0];
    wire sub_carry_hi = sub_carry_mid ? sub_hi_c1[16] : sub_hi_c0[16];

    // Select between addition and subtraction results
    assign out = mode ? {sub_hi, sub_mid, sub_lo} : {sum_hi, sum_mid, sum_lo};
    assign carryOut = mode ? (~sub_carry_hi) : carry_hi;  // Invert borrow for subtraction
endmodule

module PreAddSub (mode, in0, in1, out);
    input mode;
    input [17:0] in0, in1;

    output [17:0] out;

    assign out = (mode == 0)? in0 + in1 : in0 - in1;
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
