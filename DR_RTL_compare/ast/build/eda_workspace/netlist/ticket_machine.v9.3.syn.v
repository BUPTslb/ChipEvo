/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 13:07:53 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   n2, n4, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53;
  wire   [5:0] State;
  wire   [2:0] clear_or_next_low;
  wire   [2:0] clear_or_next_high;
  assign return_sig = State[2];
  assign dispense = State[1];

  DFF_X1 \State_reg[3]  ( .D(clear_or_next_high[0]), .CK(clk), .Q(State[3]), 
        .QN(n4) );
  DFF_X1 \State_reg[4]  ( .D(n53), .CK(clk), .Q(State[4]), .QN(n48) );
  DFF_X1 \State_reg[5]  ( .D(clear_or_next_high[2]), .CK(clk), .Q(n29), .QN(n2) );
  DFF_X1 \State_reg[0]  ( .D(clear_or_next_low[0]), .CK(clk), .Q(State[0]), 
        .QN(n31) );
  DFF_X2 \State_reg[1]  ( .D(clear_or_next_low[1]), .CK(clk), .Q(State[1]) );
  DFF_X2 \State_reg[2]  ( .D(clear_or_next_low[2]), .CK(clk), .Q(State[2]) );
  INV_X1 U24 ( .A(clear), .ZN(n45) );
  NAND2_X1 U25 ( .A1(n23), .A2(n25), .ZN(bill) );
  CLKBUF_X1 U26 ( .A(n24), .Z(n20) );
  BUF_X1 U27 ( .A(n4), .Z(n24) );
  BUF_X1 U28 ( .A(State[0]), .Z(ready) );
  INV_X1 U29 ( .A(State[0]), .ZN(n22) );
  CLKBUF_X1 U30 ( .A(n48), .Z(n23) );
  AND2_X1 U31 ( .A1(n20), .A2(n2), .ZN(n25) );
  NAND2_X1 U32 ( .A1(n31), .A2(n45), .ZN(n26) );
  INV_X1 U33 ( .A(State[4]), .ZN(n27) );
  NOR2_X1 U34 ( .A1(clear), .A2(n43), .ZN(n33) );
  AND2_X1 U35 ( .A1(n48), .A2(n4), .ZN(n28) );
  NAND4_X1 U36 ( .A1(n31), .A2(State[3]), .A3(n45), .A4(ten), .ZN(n35) );
  NOR2_X1 U37 ( .A1(State[3]), .A2(n48), .ZN(n32) );
  INV_X1 U38 ( .A(twenty), .ZN(n30) );
  INV_X1 U39 ( .A(ten), .ZN(n42) );
  NAND2_X1 U40 ( .A1(n30), .A2(n42), .ZN(n43) );
  NAND3_X1 U41 ( .A1(n32), .A2(n33), .A3(n44), .ZN(n36) );
  NAND2_X1 U42 ( .A1(twenty), .A2(n42), .ZN(n46) );
  INV_X1 U43 ( .A(n46), .ZN(n49) );
  NAND3_X1 U44 ( .A1(ready), .A2(n45), .A3(n49), .ZN(n34) );
  NAND3_X1 U45 ( .A1(n36), .A2(n35), .A3(n34), .ZN(n53) );
  NOR2_X1 U46 ( .A1(n48), .A2(n42), .ZN(n37) );
  AOI22_X1 U47 ( .A1(n37), .A2(n4), .B1(State[3]), .B2(n49), .ZN(n40) );
  INV_X1 U48 ( .A(n43), .ZN(n38) );
  NAND4_X1 U49 ( .A1(n48), .A2(n29), .A3(n38), .A4(n4), .ZN(n39) );
  NAND2_X1 U50 ( .A1(n31), .A2(n45), .ZN(n50) );
  AOI21_X1 U51 ( .B1(n40), .B2(n39), .A(n26), .ZN(clear_or_next_high[2]) );
  INV_X1 U52 ( .A(State[0]), .ZN(n44) );
  NAND3_X1 U53 ( .A1(n28), .A2(n22), .A3(n2), .ZN(n41) );
  OAI211_X1 U54 ( .C1(n43), .C2(n44), .A(n41), .B(n45), .ZN(
        clear_or_next_low[0]) );
  OAI33_X1 U55 ( .A1(n26), .A2(n24), .A3(n43), .B1(clear), .B2(n31), .B3(n42), 
        .ZN(clear_or_next_high[0]) );
  NAND3_X1 U56 ( .A1(n29), .A2(n45), .A3(n31), .ZN(n47) );
  NOR4_X1 U57 ( .A1(n47), .A2(n46), .A3(State[4]), .A4(State[3]), .ZN(
        clear_or_next_low[2]) );
  NAND3_X1 U58 ( .A1(n27), .A2(n29), .A3(ten), .ZN(n52) );
  NAND2_X1 U59 ( .A1(State[4]), .A2(n49), .ZN(n51) );
  AOI211_X1 U60 ( .C1(n52), .C2(n51), .A(State[3]), .B(n50), .ZN(
        clear_or_next_low[1]) );
endmodule

