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

    // Precompute opMode[7] condition for PostAddSub
    wire opMode7_is_sub = opModeRegOut[7];

    // ============================================================
    // Carry-Select PostAddSub — reduces 49-bit carry chain to 25-bit
    // Split: lower 24 bits + upper 25 bits
    // Precompute upper 25-bit add/sub for carry-in=0 and carry-in=1
    // in parallel, then select with actual carry from lower block.
    // ============================================================

    // Lower 24-bit block: parallel add and sub with carry/borrow extraction
    wire [24:0] x_plus_z_lo  = {1'b0, X[23:0]} + {1'b0, Z[23:0]};
    wire [24:0] x_minus_z_lo = {1'b0, Z[23:0]} - {1'b0, X[23:0]};
    wire        add_carry_lo  = x_plus_z_lo[24];
    wire        sub_borrow_lo = x_minus_z_lo[24];

    // Upper 25-bit block precomputed for carry=0 and carry=1 (parallel)
    // Addition path
    wire [24:0] add_hi_c0 = {1'b0, Z[47:24]} + {1'b0, X[47:24]};
    wire [24:0] add_hi_c1 = add_hi_c0 + 25'd1;
    wire [24:0] add_hi_sel = add_carry_lo ? add_hi_c1 : add_hi_c0;
    wire [48:0] add_result = {add_hi_sel, x_plus_z_lo[23:0]};

    // Subtraction path
    wire [24:0] sub_hi_c0 = {1'b0, Z[47:24]} - {1'b0, X[47:24]};
    wire [24:0] sub_hi_c1 = sub_hi_c0 - 25'd1;
    wire [24:0] sub_hi_sel = sub_borrow_lo ? sub_hi_c1 : sub_hi_c0;
    wire [48:0] sub_result = {sub_hi_sel, x_minus_z_lo[23:0]};

    // Final result select
    assign {carryOutRegIn, pRegIn} = opMode7_is_sub ? sub_result : add_result;

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

    // OPTIMIZED Z-mux: Balanced 2-level 4:1 mux tree with dedicated condition wires
    wire [3:0] opMode_3_2_dec_Z = opMode_3_2_dec;
    
    wire [47:0] z_mux_pair01 = opMode_3_2_dec_Z[0] ? 48'd0 : PCIn;
    wire [47:0] z_mux_pair23 = opMode_3_2_dec_Z[2] ? P : cRegOut;
    
    assign Z = opMode_3_2_dec_Z[0] | opMode_3_2_dec_Z[1] ? z_mux_pair01 : z_mux_pair23;

    // OPTIMIZED X-mux: Balanced 2-level 4:1 mux tree with dedicated condition wires
    wire [3:0] opMode_1_0_dec_X = opMode_1_0_dec;
    
    wire [47:0] x_mux_pair01 = opMode_1_0_dec_X[0] ? 48'd0 : {12'd0, M};
    wire [47:0] x_mux_pair23 = opMode_1_0_dec_X[2] ? P : {dRegOut[11:0], a1RegOut, b1RegOut};
    
    assign X = opMode_1_0_dec_X[0] | opMode_1_0_dec_X[1] ? x_mux_pair01 : x_mux_pair23;

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