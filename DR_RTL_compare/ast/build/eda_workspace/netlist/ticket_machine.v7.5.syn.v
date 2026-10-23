/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:42:27 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N6, N7, N8, N9, N10, N11, n7, n8, n10, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86;
  wire   [5:0] State;
  assign bill = N11;

  DFF_X1 \State_reg[1]  ( .D(N6), .CK(clk), .Q(State[1]), .QN(n10) );
  DFF_X1 \State_reg[5]  ( .D(N10), .CK(clk), .Q(State[5]), .QN(n58) );
  DFF_X1 \State_reg[0]  ( .D(n86), .CK(clk), .Q(State[0]), .QN(n56) );
  DFF_X1 \State_reg[2]  ( .D(N7), .CK(clk), .Q(State[2]), .QN(n54) );
  DFF_X1 \State_reg[3]  ( .D(N8), .CK(clk), .Q(State[3]), .QN(n8) );
  DFF_X1 \State_reg[4]  ( .D(N9), .CK(clk), .Q(State[4]), .QN(n7) );
  CLKBUF_X1 U34 ( .A(n74), .Z(n30) );
  INV_X1 U35 ( .A(n34), .ZN(n83) );
  CLKBUF_X1 U36 ( .A(n58), .Z(n31) );
  INV_X1 U37 ( .A(n42), .ZN(n32) );
  CLKBUF_X1 U38 ( .A(n7), .Z(n42) );
  INV_X1 U39 ( .A(n47), .ZN(n33) );
  AND3_X2 U40 ( .A1(n10), .A2(n56), .A3(n54), .ZN(n34) );
  AND2_X1 U41 ( .A1(twenty), .A2(n64), .ZN(n35) );
  NOR3_X1 U42 ( .A1(State[3]), .A2(State[4]), .A3(n58), .ZN(n43) );
  INV_X1 U43 ( .A(State[2]), .ZN(n36) );
  CLKBUF_X1 U44 ( .A(n85), .Z(n37) );
  BUF_X2 U45 ( .A(State[0]), .Z(n38) );
  NAND2_X1 U46 ( .A1(n49), .A2(n39), .ZN(n77) );
  NOR2_X1 U47 ( .A1(n73), .A2(n64), .ZN(n39) );
  CLKBUF_X1 U48 ( .A(n49), .Z(n40) );
  NAND2_X1 U49 ( .A1(n49), .A2(n41), .ZN(n79) );
  AND2_X1 U50 ( .A1(n74), .A2(n35), .ZN(n41) );
  CLKBUF_X1 U51 ( .A(n78), .Z(n44) );
  AND4_X1 U52 ( .A1(n68), .A2(n38), .A3(n31), .A4(n36), .ZN(n45) );
  AND4_X1 U53 ( .A1(n8), .A2(State[5]), .A3(n7), .A4(ten), .ZN(n59) );
  INV_X1 U54 ( .A(State[2]), .ZN(n46) );
  INV_X1 U55 ( .A(n8), .ZN(n47) );
  INV_X1 U56 ( .A(n51), .ZN(n80) );
  NAND4_X1 U57 ( .A1(n67), .A2(n66), .A3(n46), .A4(n65), .ZN(n78) );
  AND3_X1 U58 ( .A1(State[4]), .A2(n58), .A3(n8), .ZN(n48) );
  OR4_X1 U59 ( .A1(n32), .A2(State[5]), .A3(n47), .A4(n38), .ZN(n84) );
  AND4_X1 U60 ( .A1(State[3]), .A2(n58), .A3(n7), .A4(n56), .ZN(n49) );
  NAND3_X1 U61 ( .A1(n43), .A2(n35), .A3(n34), .ZN(n50) );
  CLKBUF_X1 U62 ( .A(n52), .Z(n51) );
  AND2_X1 U63 ( .A1(n48), .A2(n34), .ZN(n52) );
  NAND2_X1 U64 ( .A1(n45), .A2(n35), .ZN(n76) );
  NOR2_X1 U65 ( .A1(n64), .A2(State[3]), .ZN(n66) );
  AND2_X1 U66 ( .A1(State[4]), .A2(n58), .ZN(n67) );
  NOR2_X1 U67 ( .A1(State[1]), .A2(State[0]), .ZN(n65) );
  AOI21_X1 U68 ( .B1(n76), .B2(n77), .A(clear), .ZN(N9) );
  CLKBUF_X1 U69 ( .A(n10), .Z(n53) );
  NAND4_X1 U70 ( .A1(n42), .A2(n58), .A3(n47), .A4(n56), .ZN(n55) );
  AND3_X1 U71 ( .A1(n10), .A2(n7), .A3(n8), .ZN(n68) );
  INV_X1 U72 ( .A(ten), .ZN(n64) );
  NOR3_X1 U73 ( .A1(State[5]), .A2(State[3]), .A3(State[4]), .ZN(n57) );
  NAND4_X1 U74 ( .A1(n57), .A2(n38), .A3(n53), .A4(n36), .ZN(n85) );
  NOR3_X1 U75 ( .A1(n85), .A2(n64), .A3(clear), .ZN(N8) );
  NAND2_X1 U76 ( .A1(n52), .A2(n35), .ZN(n60) );
  NAND2_X1 U77 ( .A1(n59), .A2(n34), .ZN(n62) );
  AOI21_X1 U78 ( .B1(n60), .B2(n62), .A(clear), .ZN(N6) );
  NAND3_X1 U79 ( .A1(n33), .A2(n42), .A3(State[5]), .ZN(n82) );
  NAND3_X1 U80 ( .A1(n48), .A2(n35), .A3(n34), .ZN(n61) );
  NAND3_X1 U81 ( .A1(n50), .A2(n62), .A3(n61), .ZN(n72) );
  INV_X1 U82 ( .A(clear), .ZN(n71) );
  INV_X1 U83 ( .A(twenty), .ZN(n63) );
  AOI21_X1 U84 ( .B1(n64), .B2(n63), .A(clear), .ZN(n70) );
  NAND2_X1 U85 ( .A1(n10), .A2(n54), .ZN(n73) );
  NAND4_X1 U86 ( .A1(n31), .A2(n68), .A3(n36), .A4(n38), .ZN(n75) );
  OAI211_X1 U87 ( .C1(n73), .C2(n55), .A(n78), .B(n75), .ZN(n69) );
  AOI22_X1 U88 ( .A1(n72), .A2(n71), .B1(n69), .B2(n70), .ZN(n86) );
  INV_X1 U89 ( .A(n73), .ZN(n74) );
  NAND2_X1 U90 ( .A1(n40), .A2(n30), .ZN(n81) );
  NOR2_X1 U91 ( .A1(n50), .A2(clear), .ZN(N7) );
  AOI21_X1 U92 ( .B1(n44), .B2(n79), .A(clear), .ZN(N10) );
  OAI211_X1 U93 ( .C1(n83), .C2(n82), .A(n81), .B(n80), .ZN(N11) );
  NOR3_X1 U94 ( .A1(n46), .A2(State[1]), .A3(n84), .ZN(return_sig) );
  NOR3_X1 U95 ( .A1(State[2]), .A2(n53), .A3(n84), .ZN(dispense) );
  INV_X1 U96 ( .A(n37), .ZN(ready) );
endmodule

