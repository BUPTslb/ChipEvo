/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 10:37:00 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N10, N11, N12, N13, N14, N15, n1, n2, n3, n4, n5, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37;
  wire   [5:0] State;

  DFF_X1 \State_reg[3]  ( .D(N13), .CK(clk), .Q(n18), .QN(n3) );
  DFF_X1 \State_reg[5]  ( .D(N15), .CK(clk), .Q(State[5]), .QN(n1) );
  DFF_X1 \State_reg[2]  ( .D(N12), .CK(clk), .Q(State[2]), .QN(n4) );
  DFF_X1 \State_reg[0]  ( .D(N10), .CK(clk), .Q(State[0]), .QN(n33) );
  DFF_X1 \State_reg[4]  ( .D(N14), .CK(clk), .Q(State[4]), .QN(n2) );
  DFF_X1 \State_reg[1]  ( .D(N11), .CK(clk), .Q(State[1]), .QN(n5) );
  INV_X1 U22 ( .A(State[4]), .ZN(n16) );
  INV_X1 U23 ( .A(State[5]), .ZN(n17) );
  INV_X1 U24 ( .A(n18), .ZN(n19) );
  INV_X1 U25 ( .A(n21), .ZN(n20) );
  CLKBUF_X1 U26 ( .A(n33), .Z(n21) );
  INV_X1 U27 ( .A(State[2]), .ZN(n22) );
  INV_X1 U28 ( .A(ten), .ZN(n26) );
  XOR2_X1 U29 ( .A(n17), .B(State[4]), .Z(n23) );
  INV_X1 U30 ( .A(twenty), .ZN(n25) );
  AND2_X1 U31 ( .A1(n24), .A2(n4), .ZN(n27) );
  INV_X1 U32 ( .A(clear), .ZN(n24) );
  NAND2_X1 U33 ( .A1(ten), .A2(n24), .ZN(n29) );
  NOR2_X1 U34 ( .A1(n33), .A2(n29), .ZN(N13) );
  NAND2_X1 U35 ( .A1(twenty), .A2(n24), .ZN(n30) );
  OAI22_X1 U36 ( .A1(n3), .A2(n30), .B1(n2), .B2(n29), .ZN(N15) );
  NOR2_X1 U37 ( .A1(n1), .A2(n30), .ZN(N12) );
  NAND3_X1 U38 ( .A1(State[0]), .A2(n26), .A3(n25), .ZN(n28) );
  NAND3_X1 U39 ( .A1(n28), .A2(n5), .A3(n27), .ZN(N10) );
  OAI22_X1 U40 ( .A1(n33), .A2(n30), .B1(n3), .B2(n29), .ZN(N14) );
  OAI22_X1 U41 ( .A1(n2), .A2(n30), .B1(n1), .B2(n29), .ZN(N11) );
  OR2_X1 U42 ( .A1(State[4]), .A2(State[5]), .ZN(n31) );
  MUX2_X1 U43 ( .A(n31), .B(n23), .S(n19), .Z(n32) );
  NOR4_X1 U44 ( .A1(State[2]), .A2(n32), .A3(n20), .A4(State[1]), .ZN(bill) );
  NAND3_X1 U45 ( .A1(n23), .A2(n21), .A3(State[2]), .ZN(n34) );
  NAND2_X1 U46 ( .A1(n16), .A2(n19), .ZN(n35) );
  NOR3_X1 U47 ( .A1(n34), .A2(n35), .A3(State[1]), .ZN(return_sig) );
  INV_X1 U48 ( .A(n35), .ZN(n36) );
  NAND3_X1 U49 ( .A1(n22), .A2(n17), .A3(n36), .ZN(n37) );
  NOR3_X1 U50 ( .A1(n37), .A2(n5), .A3(n20), .ZN(dispense) );
  NOR3_X1 U51 ( .A1(n21), .A2(State[1]), .A3(n37), .ZN(ready) );
endmodule

