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

    // Corrected Z mux: proper balanced 2-level 2:1 tree (L5 fix)
    wire [47:0] z_lo_0 = zSel_00 ? 48'b0   : PCIn;      // sel=00: 0, sel=01: PCIn
    wire [47:0] z_lo_1 = zSel_10 ? P       : cRegOut;    // sel=10: P, sel=11: cRegOut
    assign Z = zSel[1] ? z_lo_1 : z_lo_0;                 // sel[1] selects upper/lower pair

    // Corrected X mux: proper balanced 2-level 2:1 tree (L5 fix)
    wire [47:0] x_lo_0 = xSel_00 ? 48'b0                    : {dRegOut, a1RegOut, b1RegOut};
    wire [47:0] x_lo_1 = xSel_10 ? P                        : M;
    assign X = xSel[1] ? x_lo_1 : x_lo_0;

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

    // ---- Pre-compute mode select: compute add/sub independently ----
    // Mode mux removed from after the adder; mode selects carry-input and output.
    // add path: in0 + in1 + cin
    // sub path: in1 - in0 - cin = in1 + (~in0) + (1-cin)

    // Split into three 16-bit blocks for carry-select structure
    wire [15:0] in0_lo  = in0[15:0];
    wire [15:0] in1_lo  = in1[15:0];
    wire [15:0] in0_mid = in0[31:16];
    wire [15:0] in1_mid = in1[31:16];
    wire [15:0] in0_hi  = in0[47:32];
    wire [15:0] in1_hi  = in1[47:32];

    // Two's complement inputs for subtraction
    wire [15:0] in0_comp_lo  = ~in0_lo;
    wire [15:0] in0_comp_mid = ~in0_mid;
    wire [15:0] in0_comp_hi  = ~in0_hi;

    // Mode-selected inputs to the first block
    wire [15:0] op_lo  = mode ? in0_comp_lo  : in0_lo;
    wire [15:0] op_mid = mode ? in0_comp_mid : in0_mid;
    wire [15:0] op_hi  = mode ? in0_comp_hi  : in0_hi;

    // Pre-compute cin for each path: add uses cin, sub uses ~cin
    wire cin_add = cin;
    wire cin_sub = ~cin;
    wire cin_sel = mode ? cin_sub : cin_add;

    // ============ Carry-select adder (shared for both paths) ============

    // Low block: cin_sel feeds first addition
    wire [16:0] low_c0 = in1_lo + op_lo + 0;
    wire [16:0] low_c1 = in1_lo + op_lo + 1;
    wire [15:0] out_lo = cin_sel ? low_c1[15:0] : low_c0[15:0];
    wire carry_lo     = cin_sel ? low_c1[16]    : low_c0[16];

    // Mid block: independent of cin_sel
    wire [16:0] mid_c0 = in1_mid + op_mid + 0;
    wire [16:0] mid_c1 = in1_mid + op_mid + 1;
    wire [15:0] out_mid = carry_lo ? mid_c1[15:0] : mid_c0[15:0];
    wire carry_mid     = carry_lo ? mid_c1[16]    : mid_c0[16];

    // High block: independent of cin_sel
    wire [16:0] hi_c0 = in1_hi + op_hi + 0;
    wire [16:0] hi_c1 = in1_hi + op_hi + 1;
    wire [15:0] out_hi = carry_mid ? hi_c1[15:0] : hi_c0[15:0];
    wire carry_hi     = carry_mid ? hi_c1[16]    : hi_c0[16];

    assign out = {out_hi, out_mid, out_lo};

    // Carry-out: addition uses carry directly, subtraction inverts borrow
    assign carryOut = mode ? (~carry_hi) : carry_hi;
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
