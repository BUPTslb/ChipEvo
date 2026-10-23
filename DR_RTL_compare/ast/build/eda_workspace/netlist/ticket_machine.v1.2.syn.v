/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 10:54:34 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N8, N9, N10, N11, N12, N13, N14, n1, n15, n16, n17, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  wire   [5:0] State;
  assign return_sig = State[2];
  assign dispense = State[1];
  assign bill = N14;

  DFF_X1 \State_reg[1]  ( .D(N9), .CK(clk), .Q(State[1]), .QN(n29) );
  DFF_X1 \State_reg[4]  ( .D(N12), .CK(clk), .Q(n21), .QN(n23) );
  DFF_X1 \State_reg[5]  ( .D(N13), .CK(clk), .Q(n16), .QN(n1) );
  DFF_X1 \State_reg[3]  ( .D(N11), .CK(clk), .Q(n19), .QN(n33) );
  DFF_X1 \State_reg[2]  ( .D(N10), .CK(clk), .Q(State[2]), .QN(n28) );
  DFF_X1 \State_reg[0]  ( .D(N8), .CK(clk), .Q(State[0]), .QN(n24) );
  AND2_X1 U20 ( .A1(n27), .A2(n30), .ZN(n15) );
  INV_X1 U21 ( .A(n16), .ZN(n17) );
  INV_X1 U22 ( .A(n24), .ZN(ready) );
  INV_X1 U23 ( .A(n19), .ZN(n20) );
  OAI222_X1 U24 ( .A1(n1), .A2(n34), .B1(n23), .B2(n32), .C1(n33), .C2(n25), 
        .ZN(N13) );
  INV_X1 U25 ( .A(n21), .ZN(n22) );
  INV_X1 U26 ( .A(ten), .ZN(n27) );
  INV_X1 U27 ( .A(clear), .ZN(n30) );
  NAND2_X1 U28 ( .A1(twenty), .A2(n15), .ZN(n25) );
  NAND2_X1 U29 ( .A1(ten), .A2(n30), .ZN(n32) );
  INV_X1 U30 ( .A(twenty), .ZN(n26) );
  NAND2_X1 U31 ( .A1(n15), .A2(n26), .ZN(n34) );
  OAI222_X1 U32 ( .A1(n24), .A2(n25), .B1(n33), .B2(n32), .C1(n23), .C2(n34), 
        .ZN(N12) );
  OAI22_X1 U33 ( .A1(n25), .A2(n23), .B1(n1), .B2(n32), .ZN(N9) );
  NOR2_X1 U34 ( .A1(n1), .A2(n25), .ZN(N10) );
  NAND3_X1 U35 ( .A1(State[0]), .A2(n26), .A3(n27), .ZN(n31) );
  NAND4_X1 U36 ( .A1(n31), .A2(n30), .A3(n29), .A4(n28), .ZN(N8) );
  OAI22_X1 U37 ( .A1(n34), .A2(n33), .B1(n24), .B2(n32), .ZN(N11) );
  NAND3_X1 U38 ( .A1(n22), .A2(n20), .A3(n17), .ZN(N14) );
endmodule

