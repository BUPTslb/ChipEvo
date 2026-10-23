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
    
    // L6: Pre-decode opMode[3:2] and opMode[1:0] into one-hot signals
    wire [3:0] opMode_3_2_dec = (opModeRegOut[3:2] == 2'b00) ? 4'b0001 :
                               (opModeRegOut[3:2] == 2'b01) ? 4'b0010 :
                               (opModeRegOut[3:2] == 2'b10) ? 4'b0100 :
                               4'b1000;
    
    wire [3:0] opMode_1_0_dec = (opModeRegOut[1:0] == 2'b00) ? 4'b0001 :
                               (opModeRegOut[1:0] == 2'b01) ? 4'b0010 :
                               (opModeRegOut[1:0] == 2'b10) ? 4'b0100 :
                               4'b1000;

    // L6: Precompute shared condition for PreAddSub
    wire opMode6_eq0 = (opModeRegOut[6] == 1'b0);
    
    RegMux #(8, RSTTYPE, OPMODEREG) opReg (clk, CEOpMode, rstOpMode, opMode, opModeRegOut);
    RegMux #(18, RSTTYPE, DREG) dReg (clk, CED, rstD, D, dRegOut);
    RegMux #(18, RSTTYPE, B0REG) b0Reg (clk, CEB, rstB, bIn, b0RegOut);
    RegMux #(18, RSTTYPE, A0REG) a0Reg (clk, CEA, rstA, A, a0RegOut);
    RegMux #(48, RSTTYPE, CREG) cReg (clk, CEC, rstC, C, cRegOut);

    // L5: Restructured PreAddSub with parallel add/subtract and late mux
    PreAddSub PreAS (opMode6_eq0, dRegOut, b0RegOut, PreASOut);

    RegMux #(18, RSTTYPE, B1REG) b1Reg (clk, CEB, rstB, b1RegIn, b1RegOut);
    RegMux #(18, RSTTYPE, A1REG) a1Reg (clk, CEA, rstA, a0RegOut, a1RegOut);

    // L5: Restructured multiplier with balanced tree
    Mul mul (b1RegOut, a1RegOut, mulOut);

    RegMux #(36, RSTTYPE, MREG) mulReg (clk, CEM, rstM, mulOut, M);
    RegMux #(1, RSTTYPE, CARRYINREG) carryInReg (clk, CECarryIn, rstCarryIn, carryInRegIn, carryInRegOut);

    // L5: Restructured PostAddSub with carry-select style
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

    // L5: Use precomputed decoded signals for Z and X muxes with balanced tree
    // L6: Extract shared intermediate signals for Z mux
    wire [47:0] z_mux_0 = 48'd0;
    wire [47:0] z_mux_1 = PCIn;
    wire [47:0] z_mux_2 = P;
    wire [47:0] z_mux_3 = cRegOut;
    
    // L6: Balanced Z mux tree
    wire [47:0] z_level0_0 = opMode_3_2_dec[0] ? z_mux_0 : z_mux_1;
    wire [47:0] z_level0_1 = opMode_3_2_dec[2] ? z_mux_2 : z_mux_3;
    assign Z = opMode_3_2_dec[1] ? z_mux_1 : 
               opMode_3_2_dec[3] ? z_mux_3 : 
               opMode_3_2_dec[0] ? z_mux_0 : z_level0_1;

    // L6: Extract shared intermediate signals for X mux
    wire [47:0] x_mux_0 = 48'd0;
    wire [47:0] x_mux_1 = M;
    wire [47:0] x_mux_2 = P;
    wire [47:0] x_mux_3 = {dRegOut, a1RegOut, b1RegOut};
    
    // L6: Balanced X mux tree
    wire [47:0] x_level0_0 = opMode_1_0_dec[0] ? x_mux_0 : x_mux_1;
    wire [47:0] x_level0_1 = opMode_1_0_dec[2] ? x_mux_2 : x_mux_3;
    assign X = opMode_1_0_dec[1] ? x_mux_1 : 
               opMode_1_0_dec[3] ? x_mux_3 : 
               opMode_1_0_dec[0] ? x_mux_0 : x_level0_1;

    assign BCOut = b1RegOut;
    assign carryOutF = carryOut;
    assign PCOut = P;
endmodule


module Mul (in0, in1, out);
    input [17:0] in0, in1;
    output [35:0] out;

    // L5: Tree-balanced multiplier with partial products
    wire [8:0] in0_lo = in0[8:0];
    wire [8:0] in0_hi = in0[17:9];
    wire [8:0] in1_lo = in1[8:0];
    wire [8:0] in1_hi = in1[17:9];

    wire [17:0] p0 = in0_lo * in1_lo;
    wire [17:0] p1 = in0_hi * in1_lo;
    wire [17:0] p2 = in0_lo * in1_hi;
    wire [17:0] p3 = in0_hi * in1_hi;

    // Balanced addition tree for partial products
    wire [35:0] p0_shifted = {18'b0, p0};
    wire [35:0] p1_shifted = {9'b0, p1, 9'b0};
    wire [35:0] p2_shifted = {9'b0, p2, 9'b0};
    wire [35:0] p3_shifted = {p3, 18'b0};

    wire [35:0] sum01 = p0_shifted + p1_shifted;
    wire [35:0] sum23 = p2_shifted + p3_shifted;
    assign out = sum01 + sum23;
endmodule


module PostAddSub (mode, in0, in1, cin, out, carryOut);
    input mode, cin;
    input [47:0] in0, in1;
    output [47:0] out;
    output carryOut;

    // L5: Carry-select style implementation
    // Split into three 16-bit blocks
    wire [15:0] in0_lo = in0[15:0];
    wire [15:0] in0_mid = in0[31:16];
    wire [15:0] in0_hi = in0[47:32];
    
    wire [15:0] in1_lo = in1[15:0];
    wire [15:0] in1_mid = in1[31:16];
    wire [15:0] in1_hi = in1[47:32];

    // Compute carry-propagate and generate for each block
    wire c0, c1, c2;
    wire [15:0] sum0, sum1, sum2;
    
    if (mode == 0) begin // Addition
        // Block 0: low 16 bits
        wire [16:0] add0 = {1'b0, in0_lo} + {1'b0, in1_lo} + cin;
        assign sum0 = add0[15:0];
        assign c0 = add0[16];
        
        // Block 1: middle 16 bits
        wire [16:0] add1_c0 = {1'b0, in0_mid} + {1'b0, in1_mid};
        wire [16:0] add1_c1 = {1'b0, in0_mid} + {1'b0, in1_mid} + 1;
        assign sum1 = c0 ? add1_c1[15:0] : add1_c0[15:0];
        assign c1 = c0 ? add1_c1[16] : add1_c0[16];
        
        // Block 2: high 16 bits
        wire [16:0] add2_c0 = {1'b0, in0_hi} + {1'b0, in1_hi};
        wire [16:0] add2_c1 = {1'b0, in0_hi} + {1'b0, in1_hi} + 1;
        assign sum2 = c1 ? add2_c1[15:0] : add2_c0[15:0];
        assign c2 = c1 ? add2_c1[16] : add2_c0[16];
        
        assign out = {sum2, sum1, sum0};
        assign carryOut = c2;
    end else begin // Subtraction: in1 - in0 - cin
        // Block 0: low 16 bits
        wire [16:0] sub0 = {1'b0, in1_lo} - {1'b0, in0_lo} - cin;
        assign sum0 = sub0[15:0];
        assign c0 = sub0[16]; // Borrow out
        
        // Block 1: middle 16 bits
        wire [16:0] sub1_c0 = {1'b0, in1_mid} - {1'b0, in0_mid};
        wire [16:0] sub1_c1 = {1'b0, in1_mid} - {1'b0, in0_mid} - 1;
        assign sum1 = c0 ? sub1_c1[15:0] : sub1_c0[15:0];
        assign c1 = c0 ? sub1_c1[16] : sub1_c0[16];
        
        // Block 2: high 16 bits
        wire [16:0] sub2_c0 = {1'b0, in1_hi} - {1'b0, in0_hi};
        wire [16:0] sub2_c1 = {1'b0, in1_hi} - {1'b0, in0_hi} - 1;
        assign sum2 = c1 ? sub2_c1[15:0] : sub2_c0[15:0];
        assign c2 = c1 ? sub2_c1[16] : sub2_c0[16];
        
        assign out = {sum2, sum1, sum0};
        assign carryOut = ~c2; // Invert borrow for carry out
    end
endmodule

module PreAddSub (mode, in0, in1, out);
    input mode;
    input [17:0] in0, in1;
    output [17:0] out;

    // L5: Carry-select style for 18-bit operation
    wire [8:0] in0_lo = in0[8:0];
    wire [8:0] in0_hi = in0[17:9];
    wire [8:0] in1_lo = in1[8:0];
    wire [8:0] in1_hi = in1[17:9];
    
    if (mode == 0) begin // Addition
        // Block 0: low 9 bits
        wire [9:0] add0 = {1'b0, in0_lo} + {1'b0, in1_lo};
        wire [8:0] sum0 = add0[8:0];
        wire c0 = add0[9];
        
        // Block 1: high 9 bits
        wire [9:0] add1_c0 = {1'b0, in0_hi} + {1'b0, in1_hi};
        wire [9:0] add1_c1 = {1'b0, in0_hi} + {1'b0, in1_hi} + 1;
        wire [8:0] sum1 = c0 ? add1_c1[8:0] : add1_c0[8:0];
        
        assign out = {sum1, sum0};
    end else begin // Subtraction: in0 - in1
        // Block 0: low 9 bits
        wire [9:0] sub0 = {1'b0, in0_lo} - {1'b0, in1_lo};
        wire [8:0] sum0 = sub0[8:0];
        wire c0 = sub0[9]; // Borrow out
        
        // Block 1: high 9 bits
        wire [9:0] sub1_c0 = {1'b0, in0_hi} - {1'b0, in1_hi};
        wire [9:0] sub1_c1 = {1'b0, in0_hi} - {1'b0, in1_hi} - 1;
        wire [8:0] sum1 = c0 ? sub1_c1[8:0] : sub1_c0[8:0];
        
        assign out = {sum1, sum0};
    end
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