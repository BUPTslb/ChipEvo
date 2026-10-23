/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:57:07 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N9, n1, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49;
  wire   [5:0] State;
  wire   [5:0] clear_or_next;
  assign return_sig = State[2];
  assign dispense = State[1];
  assign ready = State[0];
  assign bill = N9;

  DFF_X1 \State_reg[5]  ( .D(clear_or_next[5]), .CK(clk), .Q(n45), .QN(n1) );
  DFF_X1 \State_reg[4]  ( .D(n49), .CK(clk), .Q(State[4]), .QN(n25) );
  DFF_X1 \State_reg[0]  ( .D(clear_or_next[0]), .CK(clk), .Q(State[0]), .QN(
        n26) );
  DFF_X1 \State_reg[3]  ( .D(clear_or_next[3]), .CK(clk), .Q(State[3]), .QN(
        n41) );
  DFF_X2 \State_reg[1]  ( .D(clear_or_next[1]), .CK(clk), .Q(State[1]) );
  DFF_X2 \State_reg[2]  ( .D(clear_or_next[2]), .CK(clk), .Q(State[2]) );
  INV_X1 U24 ( .A(clear), .ZN(n38) );
  BUF_X1 U25 ( .A(n25), .Z(n20) );
  NAND4_X1 U26 ( .A1(n35), .A2(n38), .A3(State[0]), .A4(twenty), .ZN(n32) );
  INV_X1 U27 ( .A(ten), .ZN(n35) );
  BUF_X1 U28 ( .A(n41), .Z(n19) );
  BUF_X1 U29 ( .A(n41), .Z(n23) );
  NOR3_X1 U30 ( .A1(n30), .A2(n21), .A3(n22), .ZN(clear_or_next[3]) );
  AND2_X1 U31 ( .A1(n26), .A2(n31), .ZN(n21) );
  NOR2_X1 U32 ( .A1(ten), .A2(n26), .ZN(n22) );
  INV_X1 U33 ( .A(State[4]), .ZN(n24) );
  NAND2_X1 U34 ( .A1(n26), .A2(n38), .ZN(n27) );
  NAND3_X1 U35 ( .A1(n25), .A2(n41), .A3(n1), .ZN(N9) );
  INV_X1 U36 ( .A(twenty), .ZN(n28) );
  NAND2_X1 U37 ( .A1(n28), .A2(n35), .ZN(n31) );
  MUX2_X1 U38 ( .A(N9), .B(n31), .S(State[0]), .Z(n29) );
  NAND2_X1 U39 ( .A1(n29), .A2(n38), .ZN(clear_or_next[0]) );
  OAI21_X1 U40 ( .B1(State[3]), .B2(State[0]), .A(n38), .ZN(n30) );
  INV_X1 U41 ( .A(n31), .ZN(n37) );
  NAND4_X1 U42 ( .A1(n26), .A2(n19), .A3(n37), .A4(n38), .ZN(n34) );
  NAND4_X1 U43 ( .A1(n26), .A2(State[3]), .A3(n38), .A4(ten), .ZN(n33) );
  NAND2_X1 U44 ( .A1(twenty), .A2(n35), .ZN(n42) );
  INV_X1 U45 ( .A(n42), .ZN(n44) );
  OAI211_X1 U46 ( .C1(n34), .C2(n24), .A(n32), .B(n33), .ZN(n49) );
  NOR2_X1 U47 ( .A1(n25), .A2(n35), .ZN(n36) );
  AOI22_X1 U48 ( .A1(n23), .A2(n36), .B1(State[3]), .B2(n44), .ZN(n40) );
  NAND4_X1 U49 ( .A1(n20), .A2(n23), .A3(n37), .A4(n45), .ZN(n39) );
  NAND2_X1 U50 ( .A1(n26), .A2(n38), .ZN(n46) );
  AOI21_X1 U51 ( .B1(n39), .B2(n40), .A(n27), .ZN(clear_or_next[5]) );
  NAND3_X1 U52 ( .A1(n24), .A2(n19), .A3(n45), .ZN(n43) );
  NOR3_X1 U53 ( .A1(n43), .A2(n27), .A3(n42), .ZN(clear_or_next[2]) );
  NAND2_X1 U54 ( .A1(State[4]), .A2(n44), .ZN(n48) );
  NAND3_X1 U55 ( .A1(n20), .A2(n45), .A3(ten), .ZN(n47) );
  AOI211_X1 U56 ( .C1(n47), .C2(n48), .A(State[3]), .B(n46), .ZN(
        clear_or_next[1]) );
endmodule

