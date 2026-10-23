/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:22:36 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N3, N4, N5, N6, N7, N8, N9, n1, n2, n3, n4, n10, n11, n12, n13, n14,
         n15, n16, n18, n19, n20, n21, n22, n23, n24, n25, n26;
  wire   [5:0] State;
  assign return_sig = State[2];
  assign dispense = State[1];
  assign bill = N9;

  DFF_X1 \State_reg[5]  ( .D(N8), .CK(clk), .Q(n16), .QN(n1) );
  DFF_X1 \State_reg[4]  ( .D(N7), .CK(clk), .Q(n13), .QN(n2) );
  DFF_X1 \State_reg[3]  ( .D(N6), .CK(clk), .Q(n10), .QN(n3) );
  DFF_X1 \State_reg[0]  ( .D(N3), .CK(clk), .Q(State[0]), .QN(n4) );
  DFF_X1 \State_reg[2]  ( .D(N5), .CK(clk), .Q(State[2]), .QN(n18) );
  DFF_X1 \State_reg[1]  ( .D(N4), .CK(clk), .Q(State[1]), .QN(n19) );
  INV_X1 U15 ( .A(n10), .ZN(n11) );
  CLKBUF_X1 U16 ( .A(n4), .Z(n12) );
  INV_X1 U17 ( .A(n13), .ZN(n14) );
  INV_X1 U18 ( .A(n25), .ZN(n15) );
  AND2_X1 U19 ( .A1(n16), .A2(n15), .ZN(N8) );
  INV_X1 U20 ( .A(twenty), .ZN(n21) );
  INV_X1 U21 ( .A(n12), .ZN(ready) );
  AND2_X1 U22 ( .A1(n18), .A2(n19), .ZN(n22) );
  INV_X1 U23 ( .A(ten), .ZN(n20) );
  INV_X1 U24 ( .A(clear), .ZN(n24) );
  NAND3_X1 U25 ( .A1(twenty), .A2(n20), .A3(n24), .ZN(n25) );
  NAND2_X1 U26 ( .A1(ten), .A2(n24), .ZN(n26) );
  OAI22_X1 U27 ( .A1(n1), .A2(n26), .B1(n2), .B2(n25), .ZN(N7) );
  OAI22_X1 U28 ( .A1(n2), .A2(n26), .B1(n3), .B2(n25), .ZN(N6) );
  NAND3_X1 U29 ( .A1(n14), .A2(n1), .A3(n11), .ZN(N9) );
  NOR2_X1 U30 ( .A1(n4), .A2(n26), .ZN(N4) );
  NAND3_X1 U31 ( .A1(State[0]), .A2(n21), .A3(n20), .ZN(n23) );
  NAND3_X1 U32 ( .A1(n23), .A2(n24), .A3(n22), .ZN(N3) );
  OAI22_X1 U33 ( .A1(n3), .A2(n26), .B1(n4), .B2(n25), .ZN(N5) );
endmodule

