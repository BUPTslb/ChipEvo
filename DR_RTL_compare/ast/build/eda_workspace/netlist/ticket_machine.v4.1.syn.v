/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:45:39 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N3, N4, N5, N6, N9, n1, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47;
  wire   [5:0] State;
  assign return_sig = State[2];
  assign dispense = State[1];
  assign ready = State[0];
  assign bill = N9;

  DFF_X1 \State_reg[2]  ( .D(N5), .CK(clk), .Q(State[2]), .QN(n22) );
  DFF_X1 \State_reg[5]  ( .D(n46), .CK(clk), .Q(State[5]), .QN(n1) );
  DFF_X1 \State_reg[0]  ( .D(N3), .CK(clk), .Q(State[0]), .QN(n26) );
  DFF_X1 \State_reg[4]  ( .D(n47), .CK(clk), .Q(State[4]), .QN(n36) );
  DFF_X1 \State_reg[3]  ( .D(N6), .CK(clk), .Q(State[3]), .QN(n44) );
  DFF_X2 \State_reg[1]  ( .D(N4), .CK(clk), .Q(State[1]), .QN(n21) );
  AND2_X1 U21 ( .A1(twenty), .A2(n41), .ZN(n16) );
  AND2_X1 U22 ( .A1(n19), .A2(n16), .ZN(N5) );
  CLKBUF_X1 U23 ( .A(n36), .Z(n17) );
  AND2_X1 U24 ( .A1(n45), .A2(n44), .ZN(n18) );
  NOR2_X1 U25 ( .A1(n43), .A2(n18), .ZN(N6) );
  INV_X1 U26 ( .A(n1), .ZN(n19) );
  INV_X1 U27 ( .A(n27), .ZN(n28) );
  INV_X1 U28 ( .A(n29), .ZN(n30) );
  NAND2_X1 U29 ( .A1(n19), .A2(n28), .ZN(n33) );
  CLKBUF_X1 U30 ( .A(n23), .Z(n20) );
  AND3_X1 U31 ( .A1(n41), .A2(n21), .A3(n22), .ZN(n40) );
  NAND2_X1 U32 ( .A1(State[0]), .A2(n42), .ZN(n39) );
  NAND2_X1 U33 ( .A1(State[3]), .A2(n30), .ZN(n31) );
  INV_X1 U34 ( .A(n20), .ZN(N9) );
  NAND2_X1 U35 ( .A1(n23), .A2(n26), .ZN(n38) );
  AND3_X1 U36 ( .A1(n1), .A2(n44), .A3(n36), .ZN(n23) );
  INV_X1 U37 ( .A(clear), .ZN(n41) );
  INV_X1 U38 ( .A(ten), .ZN(n45) );
  NAND2_X1 U39 ( .A1(n16), .A2(n45), .ZN(n29) );
  INV_X1 U40 ( .A(twenty), .ZN(n24) );
  NAND2_X1 U41 ( .A1(n24), .A2(n45), .ZN(n34) );
  INV_X1 U42 ( .A(n34), .ZN(n42) );
  NAND2_X1 U43 ( .A1(n42), .A2(n41), .ZN(n27) );
  NAND3_X1 U44 ( .A1(State[3]), .A2(ten), .A3(n41), .ZN(n25) );
  OAI221_X1 U45 ( .B1(n29), .B2(n26), .C1(n27), .C2(n17), .A(n25), .ZN(n47) );
  NAND3_X1 U46 ( .A1(State[4]), .A2(n41), .A3(ten), .ZN(n32) );
  NAND3_X1 U47 ( .A1(n33), .A2(n32), .A3(n31), .ZN(n46) );
  NAND2_X1 U48 ( .A1(n19), .A2(ten), .ZN(n37) );
  OAI211_X1 U49 ( .C1(State[5]), .C2(twenty), .A(n34), .B(n41), .ZN(n35) );
  AOI21_X1 U50 ( .B1(n37), .B2(n17), .A(n35), .ZN(N4) );
  NAND3_X1 U51 ( .A1(n38), .A2(n39), .A3(n40), .ZN(N3) );
  OAI221_X1 U52 ( .B1(ten), .B2(n42), .C1(State[0]), .C2(n42), .A(n41), .ZN(
        n43) );
endmodule

