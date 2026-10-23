/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:07:38 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N11, N12, N13, N14, N15, N16, n5, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88;
  wire   [5:0] State;
  assign bill = N16;

  DFF_X1 \State_reg[1]  ( .D(N11), .CK(clk), .Q(State[1]), .QN(n61) );
  DFF_X1 \State_reg[2]  ( .D(N12), .CK(clk), .Q(State[2]), .QN(n62) );
  DFF_X1 \State_reg[4]  ( .D(N14), .CK(clk), .Q(State[4]), .QN(n57) );
  DFF_X1 \State_reg[0]  ( .D(n88), .CK(clk), .Q(State[0]), .QN(n85) );
  DFF_X1 \State_reg[5]  ( .D(N15), .CK(clk), .Q(State[5]), .QN(n5) );
  DFF_X1 \State_reg[3]  ( .D(N13), .CK(clk), .Q(State[3]), .QN(n58) );
  BUF_X1 U36 ( .A(State[3]), .Z(n32) );
  AND2_X1 U37 ( .A1(n67), .A2(n74), .ZN(n33) );
  AND3_X1 U38 ( .A1(n61), .A2(n85), .A3(n62), .ZN(n34) );
  NAND2_X1 U39 ( .A1(n42), .A2(n34), .ZN(n35) );
  NOR2_X1 U40 ( .A1(State[2]), .A2(State[1]), .ZN(n36) );
  CLKBUF_X1 U41 ( .A(State[2]), .Z(n37) );
  INV_X1 U42 ( .A(n71), .ZN(n38) );
  AND3_X1 U43 ( .A1(n61), .A2(n62), .A3(n85), .ZN(n39) );
  INV_X1 U44 ( .A(n43), .ZN(n40) );
  BUF_X1 U45 ( .A(n57), .Z(n41) );
  AND3_X1 U46 ( .A1(State[5]), .A2(n58), .A3(n57), .ZN(n42) );
  CLKBUF_X1 U47 ( .A(n61), .Z(n43) );
  OR2_X2 U48 ( .A1(State[2]), .A2(State[1]), .ZN(n71) );
  INV_X1 U49 ( .A(State[0]), .ZN(n44) );
  AND4_X1 U50 ( .A1(n57), .A2(State[3]), .A3(n5), .A4(n85), .ZN(n45) );
  INV_X1 U51 ( .A(n37), .ZN(n46) );
  CLKBUF_X1 U52 ( .A(n87), .Z(n47) );
  NAND3_X1 U53 ( .A1(State[0]), .A2(n58), .A3(n57), .ZN(n72) );
  AND2_X1 U54 ( .A1(State[0]), .A2(n52), .ZN(n48) );
  AND3_X1 U55 ( .A1(n61), .A2(n85), .A3(n62), .ZN(n68) );
  CLKBUF_X1 U56 ( .A(State[5]), .Z(n49) );
  CLKBUF_X1 U57 ( .A(n84), .Z(n50) );
  NAND2_X1 U58 ( .A1(n55), .A2(n39), .ZN(n79) );
  AND3_X1 U59 ( .A1(n61), .A2(n5), .A3(n62), .ZN(n51) );
  NAND2_X1 U60 ( .A1(n42), .A2(n34), .ZN(n65) );
  AND3_X1 U61 ( .A1(n57), .A2(n58), .A3(State[5]), .ZN(n54) );
  AND2_X1 U62 ( .A1(n58), .A2(n57), .ZN(n52) );
  XNOR2_X1 U63 ( .A(n49), .B(n59), .ZN(n53) );
  AND3_X1 U64 ( .A1(n58), .A2(State[4]), .A3(n5), .ZN(n55) );
  INV_X1 U65 ( .A(n71), .ZN(n56) );
  CLKBUF_X1 U66 ( .A(n41), .Z(n59) );
  CLKBUF_X1 U67 ( .A(n58), .Z(n60) );
  INV_X1 U68 ( .A(ten), .ZN(n67) );
  INV_X1 U69 ( .A(clear), .ZN(n74) );
  NAND2_X1 U70 ( .A1(twenty), .A2(n33), .ZN(n80) );
  NOR2_X1 U71 ( .A1(n35), .A2(n80), .ZN(N12) );
  NAND2_X1 U72 ( .A1(ten), .A2(n74), .ZN(n81) );
  INV_X1 U73 ( .A(twenty), .ZN(n66) );
  NAND2_X1 U74 ( .A1(n33), .A2(n66), .ZN(n82) );
  NAND4_X1 U75 ( .A1(n41), .A2(n5), .A3(n32), .A4(n85), .ZN(n70) );
  INV_X1 U76 ( .A(n80), .ZN(n63) );
  NAND3_X1 U77 ( .A1(n45), .A2(n56), .A3(n63), .ZN(n64) );
  OAI221_X1 U78 ( .B1(n79), .B2(n81), .C1(n82), .C2(n65), .A(n64), .ZN(N15) );
  OAI22_X1 U79 ( .A1(n80), .A2(n79), .B1(n65), .B2(n81), .ZN(N11) );
  NAND3_X1 U80 ( .A1(n67), .A2(n66), .A3(n48), .ZN(n75) );
  NAND3_X1 U81 ( .A1(n61), .A2(n5), .A3(n62), .ZN(n76) );
  OAI21_X1 U82 ( .B1(n55), .B2(n54), .A(n68), .ZN(n69) );
  OAI221_X1 U83 ( .B1(n72), .B2(n76), .C1(n70), .C2(n71), .A(n69), .ZN(n73) );
  NAND3_X1 U84 ( .A1(n75), .A2(n74), .A3(n73), .ZN(n88) );
  NAND3_X1 U85 ( .A1(n51), .A2(n52), .A3(State[0]), .ZN(n87) );
  INV_X1 U86 ( .A(n81), .ZN(n77) );
  NAND3_X1 U87 ( .A1(n45), .A2(n36), .A3(n77), .ZN(n78) );
  OAI221_X1 U88 ( .B1(n87), .B2(n80), .C1(n82), .C2(n79), .A(n78), .ZN(N14) );
  NAND2_X1 U89 ( .A1(n45), .A2(n36), .ZN(n84) );
  OAI22_X1 U90 ( .A1(n84), .A2(n82), .B1(n81), .B2(n87), .ZN(N13) );
  NAND4_X1 U91 ( .A1(n60), .A2(n53), .A3(n44), .A4(n38), .ZN(n83) );
  NAND2_X1 U92 ( .A1(n50), .A2(n83), .ZN(N16) );
  NAND3_X1 U93 ( .A1(n59), .A2(n60), .A3(n44), .ZN(n86) );
  NOR4_X1 U94 ( .A1(n46), .A2(n53), .A3(n40), .A4(n86), .ZN(return_sig) );
  NOR4_X1 U95 ( .A1(n43), .A2(n37), .A3(n49), .A4(n86), .ZN(dispense) );
  INV_X1 U96 ( .A(n47), .ZN(ready) );
endmodule

