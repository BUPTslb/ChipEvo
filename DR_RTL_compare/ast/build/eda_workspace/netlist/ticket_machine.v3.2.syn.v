/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:31:17 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N3, N4, N5, N6, N7, N8, N9, n5, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66;
  wire   [5:0] State;
  assign bill = N9;

  DFF_X1 \State_reg[1]  ( .D(N4), .CK(clk), .Q(State[1]), .QN(n33) );
  DFF_X1 \State_reg[3]  ( .D(N6), .CK(clk), .Q(State[3]), .QN(n31) );
  DFF_X1 \State_reg[4]  ( .D(N7), .CK(clk), .Q(State[4]), .QN(n5) );
  DFF_X1 \State_reg[0]  ( .D(N3), .CK(clk), .Q(n27), .QN(n54) );
  DFF_X2 \State_reg[5]  ( .D(N8), .CK(clk), .Q(State[5]), .QN(n38) );
  DFF_X1 \State_reg[2]  ( .D(N5), .CK(clk), .Q(State[2]), .QN(n49) );
  BUF_X1 U28 ( .A(n49), .Z(n25) );
  CLKBUF_X1 U29 ( .A(n41), .Z(n23) );
  AND2_X1 U30 ( .A1(n5), .A2(n31), .ZN(n24) );
  CLKBUF_X1 U31 ( .A(n66), .Z(n26) );
  INV_X1 U32 ( .A(n27), .ZN(n28) );
  AND2_X1 U33 ( .A1(n5), .A2(n31), .ZN(n29) );
  AND4_X1 U34 ( .A1(n5), .A2(n38), .A3(State[1]), .A4(n49), .ZN(n53) );
  CLKBUF_X1 U35 ( .A(n54), .Z(n30) );
  NOR2_X1 U36 ( .A1(State[5]), .A2(State[4]), .ZN(n51) );
  NAND4_X1 U37 ( .A1(n52), .A2(n51), .A3(n30), .A4(n37), .ZN(n64) );
  CLKBUF_X1 U38 ( .A(n65), .Z(n32) );
  CLKBUF_X1 U39 ( .A(n59), .Z(n34) );
  CLKBUF_X1 U40 ( .A(n60), .Z(n35) );
  CLKBUF_X1 U41 ( .A(n62), .Z(n36) );
  INV_X1 U42 ( .A(State[3]), .ZN(n37) );
  AND2_X1 U43 ( .A1(n33), .A2(State[2]), .ZN(n52) );
  INV_X1 U44 ( .A(ten), .ZN(n39) );
  INV_X1 U45 ( .A(clear), .ZN(n57) );
  NAND3_X1 U46 ( .A1(twenty), .A2(n39), .A3(n57), .ZN(n43) );
  NAND2_X1 U47 ( .A1(n33), .A2(n54), .ZN(n41) );
  INV_X1 U48 ( .A(n41), .ZN(n40) );
  NAND4_X1 U49 ( .A1(n40), .A2(State[5]), .A3(n25), .A4(n24), .ZN(n59) );
  NOR2_X1 U50 ( .A1(n59), .A2(n43), .ZN(N5) );
  NAND2_X1 U51 ( .A1(ten), .A2(n57), .ZN(n50) );
  NAND3_X1 U52 ( .A1(n25), .A2(n24), .A3(State[5]), .ZN(n42) );
  NAND4_X1 U53 ( .A1(State[4]), .A2(n31), .A3(n33), .A4(n54), .ZN(n62) );
  NAND2_X1 U54 ( .A1(n49), .A2(n38), .ZN(n63) );
  OAI33_X1 U55 ( .A1(n42), .A2(n50), .A3(n23), .B1(n62), .B2(n43), .B3(n63), 
        .ZN(N4) );
  NAND2_X1 U56 ( .A1(n49), .A2(n38), .ZN(n61) );
  NAND4_X1 U57 ( .A1(State[3]), .A2(n5), .A3(n33), .A4(n54), .ZN(n60) );
  OAI33_X1 U58 ( .A1(n50), .A2(n63), .A3(n62), .B1(n60), .B2(n61), .B3(n43), 
        .ZN(N8) );
  INV_X1 U59 ( .A(n43), .ZN(n44) );
  NAND2_X1 U60 ( .A1(n5), .A2(n31), .ZN(n47) );
  NAND3_X1 U61 ( .A1(n29), .A2(n44), .A3(n38), .ZN(n46) );
  NAND2_X1 U62 ( .A1(n33), .A2(n49), .ZN(n45) );
  OAI33_X1 U63 ( .A1(n50), .A2(n61), .A3(n60), .B1(n46), .B2(n28), .B3(n45), 
        .ZN(N7) );
  NOR3_X1 U64 ( .A1(n47), .A2(n54), .A3(State[1]), .ZN(n48) );
  NAND3_X1 U65 ( .A1(n48), .A2(n38), .A3(n25), .ZN(n66) );
  NOR2_X1 U66 ( .A1(n66), .A2(n50), .ZN(N6) );
  NAND3_X1 U67 ( .A1(n53), .A2(n30), .A3(n37), .ZN(n65) );
  NOR4_X1 U68 ( .A1(State[3]), .A2(State[4]), .A3(twenty), .A4(ten), .ZN(n56)
         );
  NOR3_X1 U69 ( .A1(n28), .A2(State[1]), .A3(State[2]), .ZN(n55) );
  NAND3_X1 U70 ( .A1(n55), .A2(n38), .A3(n56), .ZN(n58) );
  NAND4_X1 U71 ( .A1(n58), .A2(n65), .A3(n64), .A4(n57), .ZN(N3) );
  OAI221_X1 U72 ( .B1(n63), .B2(n36), .C1(n61), .C2(n35), .A(n34), .ZN(N9) );
  INV_X1 U73 ( .A(n64), .ZN(return_sig) );
  INV_X1 U74 ( .A(n32), .ZN(dispense) );
  INV_X1 U75 ( .A(n26), .ZN(ready) );
endmodule

