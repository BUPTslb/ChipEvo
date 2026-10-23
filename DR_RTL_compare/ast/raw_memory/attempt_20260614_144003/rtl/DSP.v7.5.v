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
    
    // Precompute mux selection conditions directly from 2-bit fields
    // For Z-mux: opMode[3:2] selects between {0, PCIn, P, cRegOut}
    wire [1:0] opMode_3_2 = opModeRegOut[3:2];
    wire sel_Z_low = (opMode_3_2 == 2'b00) || (opMode_3_2 == 2'b01);
    
    // For X-mux: opMode[1:0] selects between {0, M, P, concatenated}
    wire [1:0] opMode_1_0 = opModeRegOut[1:0];
    wire sel_X_low = (opMode_1_0 == 2'b00) || (opMode_1_0 == 2'b01);

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

    // Precompute opMode[7] condition for PostAddSub
    wire opMode7_is_sub = opModeRegOut[7];
    
    // L5 refinement: Split 49-bit PostAddSub into lower 24-bit and upper 25-bit stages
    // This reduces carry chain depth from 49 to max(24,25)
    
    // LOWER 24-bit stage (split at bit boundary)
    wire [24:0] X_lower = {1'b0, X[23:0]};
    wire [24:0] Z_lower = {1'b0, Z[23:0]};
    wire [24:0] lower_add = X_lower + Z_lower + {24'b0, carryInRegOut};
    wire [24:0] lower_sub = Z_lower - X_lower - {24'b0, carryInRegOut};
    wire [24:0] lower_result = opMode7_is_sub ? lower_sub : lower_add;
    wire lower_carry = lower_result[24];
    
    // UPPER 25-bit stage with carry-select
    wire [25:0] X_upper = {1'b0, X[47:24]};
    wire [25:0] Z_upper = {1'b0, Z[47:24]};
    
    // Compute upper stage for carry=0 and carry=1 in parallel
    wire [25:0] upper_add_c0 = X_upper + Z_upper;
    wire [25:0] upper_add_c1 = X_upper + Z_upper + 1'b1;
    wire [25:0] upper_sub_c0 = Z_upper - X_upper;
    wire [25:0] upper_sub_c1 = Z_upper - X_upper - 1'b1;
    
    // Select based on operation and lower carry
    wire [25:0] upper_add = lower_carry ? upper_add_c1 : upper_add_c0;
    wire [25:0] upper_sub = lower_carry ? upper_sub_c1 : upper_sub_c0;
    wire [25:0] upper_result = opMode7_is_sub ? upper_sub : upper_add;
    
    // Combine results
    assign pRegIn = {upper_result[23:0], lower_result[23:0]};
    assign carryOutRegIn = upper_result[24];

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

    // OPTIMIZED Z-mux: 2-level 2:1 mux tree with direct condition
    // First stage: select between {0, PCIn} based on opMode[3:2][0]
    wire [47:0] z_mux_low = opMode_3_2[0] ? 48'd0 : PCIn;
    
    // Second stage: select between {P, cRegOut} based on opMode[3:2][0]
    wire [47:0] z_mux_high = opMode_3_2[0] ? P : cRegOut;
    
    // Final selection using precomputed condition
    assign Z = sel_Z_low ? z_mux_low : z_mux_high;

    // OPTIMIZED X-mux: 2-level 2:1 mux tree with direct condition
    // First stage: select between {0, M} based on opMode[1:0][0]
    wire [47:0] x_mux_low = opMode_1_0[0] ? 48'd0 : {12'd0, M};
    
    // Second stage: select between {P, concatenated} based on opMode[1:0][0]
    wire [47:0] x_mux_high = opMode_1_0[0] ? P : {dRegOut[11:0], a1RegOut, b1RegOut};
    
    // Final selection using precomputed condition
    assign X = sel_X_low ? x_mux_low : x_mux_high;

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