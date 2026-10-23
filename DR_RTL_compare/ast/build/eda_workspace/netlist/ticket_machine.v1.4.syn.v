/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:00:10 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N3, N5, N9, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [5:0] State;
  assign return_sig = State[2];
  assign dispense = State[1];
  assign ready = State[0];
  assign bill = N9;

  DFF_X1 \State_reg[3]  ( .D(n30), .CK(clk), .Q(n8), .QN(n28) );
  DFF_X1 \State_reg[1]  ( .D(n29), .CK(clk), .Q(State[1]), .QN(n17) );
  DFF_X1 \State_reg[2]  ( .D(N5), .CK(clk), .Q(State[2]), .QN(n16) );
  DFF_X1 \State_reg[5]  ( .D(n31), .CK(clk), .Q(n13), .QN(n27) );
  DFF_X1 \State_reg[4]  ( .D(n32), .CK(clk), .Q(n11), .QN(n14) );
  DFF_X1 \State_reg[0]  ( .D(N3), .CK(clk), .Q(State[0]), .QN(n15) );
  INV_X1 U17 ( .A(n8), .ZN(n9) );
  CLKBUF_X1 U18 ( .A(n27), .Z(n10) );
  INV_X1 U19 ( .A(n11), .ZN(n12) );
  AND3_X1 U20 ( .A1(n13), .A2(n19), .A3(twenty), .ZN(N5) );
  AND3_X1 U21 ( .A1(n17), .A2(n16), .A3(n19), .ZN(n23) );
  INV_X1 U22 ( .A(clear), .ZN(n19) );
  NAND2_X1 U23 ( .A1(ten), .A2(n19), .ZN(n26) );
  NAND2_X1 U24 ( .A1(twenty), .A2(n19), .ZN(n21) );
  INV_X1 U25 ( .A(twenty), .ZN(n22) );
  INV_X1 U26 ( .A(ten), .ZN(n18) );
  NAND2_X1 U27 ( .A1(n22), .A2(n18), .ZN(n24) );
  INV_X1 U28 ( .A(n24), .ZN(n20) );
  NAND2_X1 U29 ( .A1(n20), .A2(n19), .ZN(n25) );
  OAI222_X1 U30 ( .A1(n26), .A2(n28), .B1(n15), .B2(n21), .C1(n14), .C2(n25), 
        .ZN(n32) );
  OAI222_X1 U31 ( .A1(n14), .A2(n26), .B1(n28), .B2(n21), .C1(n27), .C2(n25), 
        .ZN(n31) );
  OAI22_X1 U32 ( .A1(n21), .A2(n14), .B1(n27), .B2(n26), .ZN(n29) );
  OAI21_X1 U33 ( .B1(n15), .B2(n24), .A(n23), .ZN(N3) );
  OAI22_X1 U34 ( .A1(n26), .A2(n15), .B1(n28), .B2(n25), .ZN(n30) );
  NAND3_X1 U35 ( .A1(n12), .A2(n9), .A3(n10), .ZN(N9) );
endmodule

