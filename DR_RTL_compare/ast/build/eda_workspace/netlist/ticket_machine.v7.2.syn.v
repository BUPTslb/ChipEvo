/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:30:10 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N5, N6, N7, N8, N9, N10, N11, n1, n21, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [5:0] State;
  assign return_sig = State[2];
  assign dispense = State[1];
  assign bill = N11;

  DFF_X1 \State_reg[4]  ( .D(N9), .CK(clk), .Q(State[4]), .QN(n1) );
  DFF_X1 \State_reg[3]  ( .D(N8), .CK(clk), .Q(State[3]), .QN(n46) );
  DFF_X1 \State_reg[0]  ( .D(N5), .CK(clk), .Q(State[0]), .QN(n42) );
  DFF_X1 \State_reg[5]  ( .D(N10), .CK(clk), .Q(State[5]), .QN(n47) );
  DFF_X2 \State_reg[2]  ( .D(N7), .CK(clk), .Q(State[2]) );
  DFF_X2 \State_reg[1]  ( .D(N6), .CK(clk), .Q(State[1]) );
  CLKBUF_X1 U27 ( .A(n42), .Z(n23) );
  BUF_X1 U28 ( .A(n45), .Z(n21) );
  AND4_X1 U29 ( .A1(n27), .A2(n26), .A3(State[5]), .A4(n21), .ZN(N7) );
  INV_X1 U30 ( .A(n24), .ZN(ready) );
  AOI21_X1 U31 ( .B1(State[4]), .B2(n46), .A(n34), .ZN(n37) );
  OR2_X1 U32 ( .A1(n1), .A2(n48), .ZN(n51) );
  INV_X1 U33 ( .A(State[0]), .ZN(n24) );
  AOI21_X1 U34 ( .B1(State[5]), .B2(n1), .A(n39), .ZN(n35) );
  AND2_X1 U35 ( .A1(n42), .A2(n40), .ZN(n25) );
  XNOR2_X1 U36 ( .A(State[0]), .B(ten), .ZN(n26) );
  AND3_X1 U37 ( .A1(n25), .A2(twenty), .A3(n46), .ZN(n27) );
  NOR3_X1 U38 ( .A1(n36), .A2(n37), .A3(n35), .ZN(N10) );
  OAI221_X1 U39 ( .B1(n39), .B2(n46), .C1(n48), .C2(State[3]), .A(n25), .ZN(
        n36) );
  INV_X1 U40 ( .A(twenty), .ZN(n33) );
  INV_X1 U41 ( .A(ten), .ZN(n34) );
  INV_X1 U42 ( .A(clear), .ZN(n40) );
  NAND2_X1 U43 ( .A1(n34), .A2(n40), .ZN(n30) );
  INV_X1 U44 ( .A(n30), .ZN(n28) );
  NAND3_X1 U45 ( .A1(n33), .A2(State[4]), .A3(n28), .ZN(n29) );
  NOR3_X1 U46 ( .A1(n29), .A2(State[3]), .A3(State[0]), .ZN(n32) );
  NAND2_X1 U47 ( .A1(n42), .A2(n40), .ZN(n49) );
  OAI33_X1 U48 ( .A1(n23), .A2(n33), .A3(n30), .B1(n49), .B2(n46), .B3(n34), 
        .ZN(n31) );
  OR2_X1 U49 ( .A1(n31), .A2(n32), .ZN(N9) );
  NAND2_X1 U50 ( .A1(n34), .A2(n33), .ZN(n39) );
  NAND2_X1 U51 ( .A1(twenty), .A2(n34), .ZN(n48) );
  INV_X1 U52 ( .A(State[4]), .ZN(n45) );
  NAND4_X1 U53 ( .A1(n23), .A2(n46), .A3(n45), .A4(n47), .ZN(n38) );
  OAI211_X1 U54 ( .C1(n24), .C2(n39), .A(n38), .B(n40), .ZN(N5) );
  NAND2_X1 U55 ( .A1(ten), .A2(n40), .ZN(n44) );
  INV_X1 U56 ( .A(n39), .ZN(n41) );
  NAND3_X1 U57 ( .A1(State[3]), .A2(n40), .A3(n41), .ZN(n43) );
  AOI22_X1 U58 ( .A1(ready), .A2(n44), .B1(n43), .B2(n23), .ZN(N8) );
  NAND3_X1 U59 ( .A1(n46), .A2(n21), .A3(n47), .ZN(N11) );
  NAND3_X1 U60 ( .A1(State[5]), .A2(ten), .A3(n1), .ZN(n50) );
  AOI211_X1 U61 ( .C1(n51), .C2(n50), .A(State[3]), .B(n49), .ZN(N6) );
endmodule

