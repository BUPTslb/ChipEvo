/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:49:26 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N8, n4, n8, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87;
  wire   [5:0] State;
  wire   [5:0] clear_or_next;
  assign bill = N8;

  DFF_X1 \State_reg[4]  ( .D(clear_or_next[4]), .CK(clk), .Q(State[4]), .QN(n4) );
  DFF_X1 \State_reg[3]  ( .D(clear_or_next[3]), .CK(clk), .Q(State[3]), .QN(
        n82) );
  DFF_X1 \State_reg[2]  ( .D(clear_or_next[2]), .CK(clk), .Q(State[2]), .QN(
        n85) );
  DFF_X2 \State_reg[5]  ( .D(clear_or_next[5]), .CK(clk), .Q(State[5]), .QN(
        n38) );
  DFF_X2 \State_reg[0]  ( .D(clear_or_next[0]), .CK(clk), .Q(State[0]), .QN(n8) );
  DFF_X2 \State_reg[1]  ( .D(clear_or_next[1]), .CK(clk), .Q(State[1]), .QN(
        n48) );
  CLKBUF_X1 U33 ( .A(n60), .Z(n29) );
  NAND2_X1 U34 ( .A1(n55), .A2(n57), .ZN(n79) );
  CLKBUF_X1 U35 ( .A(n79), .Z(n30) );
  CLKBUF_X1 U36 ( .A(n83), .Z(n31) );
  AND2_X1 U37 ( .A1(n48), .A2(n8), .ZN(n32) );
  CLKBUF_X1 U38 ( .A(n37), .Z(n33) );
  AND2_X1 U39 ( .A1(n48), .A2(n8), .ZN(n37) );
  INV_X1 U40 ( .A(n33), .ZN(n86) );
  AND2_X1 U41 ( .A1(n74), .A2(n77), .ZN(n34) );
  CLKBUF_X1 U42 ( .A(n80), .Z(n35) );
  INV_X1 U43 ( .A(n82), .ZN(n36) );
  INV_X1 U44 ( .A(State[5]), .ZN(n84) );
  AND3_X1 U45 ( .A1(n32), .A2(n83), .A3(State[5]), .ZN(n39) );
  AND2_X1 U46 ( .A1(n38), .A2(n85), .ZN(n40) );
  AND2_X1 U47 ( .A1(n40), .A2(n61), .ZN(ready) );
  INV_X1 U48 ( .A(State[0]), .ZN(n41) );
  INV_X1 U49 ( .A(n70), .ZN(n56) );
  OR2_X1 U50 ( .A1(n66), .A2(n67), .ZN(n81) );
  INV_X1 U51 ( .A(n66), .ZN(n58) );
  INV_X1 U52 ( .A(n53), .ZN(n57) );
  INV_X1 U53 ( .A(n54), .ZN(n55) );
  INV_X1 U54 ( .A(n59), .ZN(n62) );
  INV_X1 U55 ( .A(State[4]), .ZN(n42) );
  NAND2_X1 U56 ( .A1(ready), .A2(n62), .ZN(n63) );
  NOR4_X1 U57 ( .A1(n8), .A2(State[4]), .A3(State[1]), .A4(State[3]), .ZN(n43)
         );
  NOR4_X1 U58 ( .A1(n8), .A2(State[1]), .A3(State[3]), .A4(n60), .ZN(n61) );
  INV_X1 U59 ( .A(ten), .ZN(n74) );
  INV_X1 U60 ( .A(clear), .ZN(n77) );
  NAND2_X1 U61 ( .A1(twenty), .A2(n34), .ZN(n59) );
  INV_X1 U62 ( .A(State[4]), .ZN(n83) );
  NAND3_X1 U63 ( .A1(n37), .A2(n83), .A3(State[5]), .ZN(n50) );
  NAND2_X1 U64 ( .A1(n85), .A2(n82), .ZN(n49) );
  INV_X1 U65 ( .A(n49), .ZN(n46) );
  NAND2_X1 U66 ( .A1(n39), .A2(n46), .ZN(n80) );
  NOR2_X1 U67 ( .A1(n80), .A2(n59), .ZN(clear_or_next[2]) );
  NAND4_X1 U68 ( .A1(n29), .A2(n8), .A3(n48), .A4(n82), .ZN(n54) );
  NAND2_X1 U69 ( .A1(n85), .A2(n38), .ZN(n53) );
  NAND2_X1 U70 ( .A1(ten), .A2(n77), .ZN(n68) );
  INV_X1 U71 ( .A(n68), .ZN(n45) );
  NAND3_X1 U72 ( .A1(n39), .A2(n46), .A3(n45), .ZN(n47) );
  OAI21_X1 U73 ( .B1(n79), .B2(n59), .A(n47), .ZN(clear_or_next[1]) );
  NAND2_X1 U74 ( .A1(n85), .A2(n38), .ZN(n67) );
  NAND4_X1 U75 ( .A1(n42), .A2(n8), .A3(n48), .A4(State[3]), .ZN(n66) );
  NOR3_X1 U76 ( .A1(n59), .A2(n67), .A3(n66), .ZN(n52) );
  INV_X1 U77 ( .A(twenty), .ZN(n73) );
  NAND2_X1 U78 ( .A1(n34), .A2(n73), .ZN(n70) );
  OAI33_X1 U79 ( .A1(n68), .A2(n53), .A3(n54), .B1(n50), .B2(n49), .B3(n70), 
        .ZN(n51) );
  OR2_X1 U80 ( .A1(n51), .A2(n52), .ZN(clear_or_next[5]) );
  NAND3_X1 U81 ( .A1(n55), .A2(n56), .A3(n57), .ZN(n65) );
  NAND3_X1 U82 ( .A1(n57), .A2(n45), .A3(n58), .ZN(n64) );
  INV_X1 U83 ( .A(n4), .ZN(n60) );
  NAND3_X1 U84 ( .A1(n85), .A2(n38), .A3(n43), .ZN(n69) );
  NAND3_X1 U85 ( .A1(n63), .A2(n64), .A3(n65), .ZN(clear_or_next[4]) );
  OAI22_X1 U86 ( .A1(n70), .A2(n81), .B1(n69), .B2(n68), .ZN(clear_or_next[3])
         );
  NOR3_X1 U87 ( .A1(n85), .A2(State[4]), .A3(State[1]), .ZN(n71) );
  NAND4_X1 U88 ( .A1(n84), .A2(n41), .A3(n82), .A4(n71), .ZN(n78) );
  NOR4_X1 U89 ( .A1(n48), .A2(n36), .A3(State[0]), .A4(State[4]), .ZN(n72) );
  NAND3_X1 U90 ( .A1(n85), .A2(n84), .A3(n72), .ZN(n76) );
  NAND3_X1 U91 ( .A1(ready), .A2(n73), .A3(n74), .ZN(n75) );
  NAND4_X1 U92 ( .A1(n75), .A2(n77), .A3(n76), .A4(n78), .ZN(clear_or_next[0])
         );
  NAND3_X1 U93 ( .A1(n81), .A2(n35), .A3(n30), .ZN(N8) );
  NAND3_X1 U94 ( .A1(n84), .A2(n31), .A3(n82), .ZN(n87) );
  NOR3_X1 U95 ( .A1(n86), .A2(n87), .A3(n85), .ZN(return_sig) );
  NOR4_X1 U96 ( .A1(n48), .A2(State[0]), .A3(State[2]), .A4(n87), .ZN(dispense) );
endmodule

