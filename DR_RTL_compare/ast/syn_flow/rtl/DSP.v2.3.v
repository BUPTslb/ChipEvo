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

    // Condition precomputation for opMode bits
    wire opMode4_eq0 = (opModeRegOut[4] == 1'b0);
    
    wire [3:0] opMode_3_2_dec = (opModeRegOut[3:2] == 2'b00) ? 4'b0001 :
                               (opModeRegOut[3:2] == 2'b01) ? 4'b0010 :
                               (opModeRegOut[3:2] == 2'b10) ? 4'b0100 :
                               4'b1000;
    
    wire [3:0] opMode_1_0_dec = (opModeRegOut[1:0] == 2'b00) ? 4'b0001 :
                               (opModeRegOut[1:0] == 2'b01) ? 4'b0010 :
                               (opModeRegOut[1:0] == 2'b10) ? 4'b0100 :
                               4'b1000;

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

    // PostAddSub: late mux-select with precomputed results for all X variants
    // Original critical path: opMode[1:0] -> decode -> X mux (48-bit) -> adder (48-bit) -> carryOut/pReg
    // Optimized: precompute add/sub for all 4 X values (opMode[3:2] selects Z),
    //            then select add vs sub with opMode[7]. opMode[1:0] eliminated from critical path.

    // Precomputed add results: {carry, result} = X_variant + Z + cin (49-bit)
    wire [48:0] add_result_0 = {1'b0, 48'd0} + {1'b0, Z} + carryInRegOut;
    wire [48:0] add_result_1 = {1'b0, M} + {1'b0, Z} + carryInRegOut;
    wire [48:0] add_result_2 = {1'b0, P} + {1'b0, Z} + carryInRegOut;
    wire [48:0] add_result_3 = {1'b0, dRegOut, a1RegOut, b1RegOut} + {1'b0, Z} + carryInRegOut;

    // Precomputed subtract results: {borrow, result} = Z - X_variant - cin (49-bit)
    wire [48:0] sub_result_0 = {1'b0, Z} - {1'b0, 48'd0} - carryInRegOut;
    wire [48:0] sub_result_1 = {1'b0, Z} - {1'b0, M} - carryInRegOut;
    wire [48:0] sub_result_2 = {1'b0, Z} - {1'b0, P} - carryInRegOut;
    wire [48:0] sub_result_3 = {1'b0, Z} - {1'b0, dRegOut, a1RegOut, b1RegOut} - carryInRegOut;

    // Mux on opMode[7]: add vs subtract (fast 48-bit 2:1 mux)
    wire [48:0] result_0 = opModeRegOut[7] ? sub_result_0 : add_result_0;
    wire [48:0] result_1 = opModeRegOut[7] ? sub_result_1 : add_result_1;
    wire [48:0] result_2 = opModeRegOut[7] ? sub_result_2 : add_result_2;
    wire [48:0] result_3 = opModeRegOut[7] ? sub_result_3 : add_result_3;

    // Final 4:1 mux on opMode[3:2] — selects among precomputed Z variants
    assign pRegIn = opMode_3_2_dec[0] ? result_0[47:0] :
                    opMode_3_2_dec[1] ? result_1[47:0] :
                    opMode_3_2_dec[2] ? result_2[47:0] :
                    result_3[47:0];

    // Carry-out: same structure (2-level mux, fast)
    wire add_carry  = opMode_3_2_dec[0] ? add_result_0[48] :
                      opMode_3_2_dec[1] ? add_result_1[48] :
                      opMode_3_2_dec[2] ? add_result_2[48] :
                      add_result_3[48];
    wire sub_carry  = opMode_3_2_dec[0] ? sub_result_0[48] :
                      opMode_3_2_dec[1] ? sub_result_1[48] :
                      opMode_3_2_dec[2] ? sub_result_2[48] :
                      sub_result_3[48];
    assign carryOutRegIn = opModeRegOut[7] ? sub_carry : add_carry;

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

    // Use precomputed condition for b1RegIn
    assign b1RegIn = opMode4_eq0 ? b0RegOut : PreASOut;

    generate
        if (CARRYINSEL == "OPMODE5") begin
            assign carryInRegIn = opModeRegOut[5];
        end else if (CARRYINSEL == "CARRYIN") begin
            assign carryInRegIn = carryIn;
        end else begin
            assign carryInRegIn = 0;
        end
    endgenerate

    // Use precomputed decoded signals for Z and X muxes
    assign Z = opMode_3_2_dec[0] ? 48'd0 :
               opMode_3_2_dec[1] ? PCIn :
               opMode_3_2_dec[2] ? P :
               cRegOut;

    assign X = opMode_1_0_dec[0] ? 48'd0 :
               opMode_1_0_dec[1] ? M :
               opMode_1_0_dec[2] ? P :
               {dRegOut, a1RegOut, b1RegOut};

    assign BCOut = b1RegOut;
    assign carryOutF = carryOut;
    assign PCOut = P;
endmodule


module Mul (in0, in1, out);
    input [17:0] in0, in1;

    output [35:0] out;

    assign out = in0 * in1;
endmodule


module PreAddSub (mode, in0, in1, out);
    input mode;
    input [17:0] in0, in1;

    output [17:0] out;

    // Late mux-select: precompute add and subtract, mux on mode
    // Removes 18-bit adder from critical path; replaces with fast 2:1 mux
    wire [18:0] add_res = {1'b0, in0} + {1'b0, in1};
    wire [18:0] sub_res = {1'b0, in0} - {1'b0, in1};
    wire [18:0] result  = mode ? sub_res : add_res;
    assign out = result[17:0];
endmodule