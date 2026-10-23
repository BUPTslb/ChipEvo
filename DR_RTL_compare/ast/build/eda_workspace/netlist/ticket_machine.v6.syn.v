/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:11:37 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N4, N6, N7, N9, N10, n1, n4, n5, n6, n8, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90;
  wire   [5:0] State;
  assign bill = N10;

  DFF_X1 \State_reg[4]  ( .D(n90), .CK(clk), .Q(State[4]), .QN(n4) );
  DFF_X1 \State_reg[0]  ( .D(N4), .CK(clk), .Q(State[0]), .QN(n8) );
  DFF_X1 \State_reg[2]  ( .D(N6), .CK(clk), .Q(State[2]), .QN(n6) );
  DFF_X1 \State_reg[3]  ( .D(N7), .CK(clk), .Q(State[3]), .QN(n5) );
  DFF_X1 \State_reg[1]  ( .D(n1), .CK(clk), .Q(State[1]), .QN(n61) );
  DFF_X1 \State_reg[5]  ( .D(N9), .CK(clk), .Q(State[5]), .QN(n49) );
  INV_X1 U42 ( .A(ten), .ZN(n74) );
  INV_X1 U43 ( .A(clear), .ZN(n85) );
  BUF_X1 U44 ( .A(n51), .Z(n39) );
  AND4_X1 U45 ( .A1(State[3]), .A2(n6), .A3(n4), .A4(n8), .ZN(n60) );
  AND3_X1 U46 ( .A1(n60), .A2(n61), .A3(n49), .ZN(n46) );
  NAND4_X1 U47 ( .A1(n46), .A2(n74), .A3(n85), .A4(n69), .ZN(n66) );
  AND3_X1 U48 ( .A1(n49), .A2(n61), .A3(n6), .ZN(n51) );
  CLKBUF_X1 U49 ( .A(n49), .Z(n40) );
  INV_X1 U50 ( .A(n88), .ZN(n41) );
  NAND2_X1 U51 ( .A1(n46), .A2(n62), .ZN(n42) );
  INV_X1 U52 ( .A(n5), .ZN(n43) );
  NOR2_X1 U53 ( .A1(n80), .A2(n79), .ZN(n44) );
  INV_X1 U54 ( .A(State[1]), .ZN(n45) );
  OR2_X1 U55 ( .A1(n80), .A2(n79), .ZN(n54) );
  INV_X1 U56 ( .A(State[0]), .ZN(n47) );
  AND4_X1 U57 ( .A1(n50), .A2(n47), .A3(n5), .A4(State[4]), .ZN(n48) );
  AND4_X1 U58 ( .A1(n5), .A2(n62), .A3(State[0]), .A4(n4), .ZN(n70) );
  AND3_X1 U59 ( .A1(n49), .A2(n61), .A3(n6), .ZN(n50) );
  NAND4_X1 U60 ( .A1(n8), .A2(n61), .A3(n6), .A4(State[5]), .ZN(n79) );
  INV_X1 U61 ( .A(State[4]), .ZN(n86) );
  INV_X1 U62 ( .A(State[3]), .ZN(n87) );
  NAND2_X1 U63 ( .A1(n4), .A2(n87), .ZN(n80) );
  NAND2_X1 U64 ( .A1(n44), .A2(ten), .ZN(n53) );
  NAND2_X1 U65 ( .A1(n8), .A2(n5), .ZN(n56) );
  INV_X1 U66 ( .A(n56), .ZN(n52) );
  NAND2_X1 U67 ( .A1(twenty), .A2(n74), .ZN(n69) );
  INV_X1 U68 ( .A(n69), .ZN(n62) );
  NAND4_X1 U69 ( .A1(n52), .A2(n62), .A3(State[4]), .A4(n51), .ZN(n73) );
  NAND4_X1 U70 ( .A1(n47), .A2(n4), .A3(n43), .A4(ten), .ZN(n67) );
  NAND2_X1 U71 ( .A1(n67), .A2(n85), .ZN(n63) );
  AOI21_X1 U72 ( .B1(n53), .B2(n73), .A(n63), .ZN(n1) );
  NOR3_X1 U73 ( .A1(n54), .A2(n63), .A3(n69), .ZN(N6) );
  NOR3_X1 U74 ( .A1(n40), .A2(n43), .A3(State[2]), .ZN(n59) );
  NAND3_X1 U75 ( .A1(n8), .A2(n45), .A3(n86), .ZN(n55) );
  NOR3_X1 U76 ( .A1(n55), .A2(twenty), .A3(ten), .ZN(n58) );
  NOR3_X1 U77 ( .A1(n86), .A2(n74), .A3(n56), .ZN(n57) );
  AOI22_X1 U78 ( .A1(n59), .A2(n58), .B1(n57), .B2(n39), .ZN(n64) );
  INV_X1 U79 ( .A(n4), .ZN(n68) );
  NAND3_X1 U80 ( .A1(n60), .A2(n61), .A3(n49), .ZN(n78) );
  AOI21_X1 U81 ( .B1(n64), .B2(n42), .A(n63), .ZN(N9) );
  INV_X1 U82 ( .A(State[0]), .ZN(n88) );
  NOR4_X1 U83 ( .A1(n68), .A2(n88), .A3(n74), .A4(State[3]), .ZN(n65) );
  NAND2_X1 U84 ( .A1(n65), .A2(n39), .ZN(n82) );
  OAI21_X1 U85 ( .B1(clear), .B2(n82), .A(n66), .ZN(N7) );
  INV_X1 U86 ( .A(n67), .ZN(n72) );
  NAND2_X1 U87 ( .A1(n70), .A2(n51), .ZN(n83) );
  INV_X1 U88 ( .A(n83), .ZN(n71) );
  AOI21_X1 U89 ( .B1(n72), .B2(n39), .A(n71), .ZN(n76) );
  NAND4_X1 U90 ( .A1(n50), .A2(n8), .A3(n5), .A4(State[4]), .ZN(n77) );
  NAND4_X1 U91 ( .A1(n73), .A2(n85), .A3(n48), .A4(n74), .ZN(n75) );
  OAI21_X1 U92 ( .B1(n76), .B2(clear), .A(n75), .ZN(n90) );
  OAI211_X1 U93 ( .C1(n80), .C2(n79), .A(n78), .B(n77), .ZN(N10) );
  INV_X1 U94 ( .A(N10), .ZN(n81) );
  NAND3_X1 U95 ( .A1(n81), .A2(n82), .A3(n83), .ZN(n84) );
  NAND2_X1 U96 ( .A1(n84), .A2(n85), .ZN(N4) );
  NAND3_X1 U97 ( .A1(n40), .A2(n87), .A3(n86), .ZN(n89) );
  NOR4_X1 U98 ( .A1(n6), .A2(State[1]), .A3(n41), .A4(n89), .ZN(return_sig) );
  NOR4_X1 U99 ( .A1(n45), .A2(n41), .A3(State[2]), .A4(n89), .ZN(dispense) );
  NOR4_X1 U100 ( .A1(n89), .A2(State[2]), .A3(n88), .A4(State[1]), .ZN(ready)
         );
endmodule

