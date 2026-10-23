/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:39:34 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N34, N35, N36, N37, N39, N40, n4, n6, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89;
  wire   [5:0] State;
  assign bill = N40;

  DFF_X1 \State_reg[5]  ( .D(N39), .CK(clk), .Q(State[5]), .QN(n48) );
  DFF_X1 \State_reg[4]  ( .D(n89), .CK(clk), .Q(State[4]), .QN(n4) );
  DFF_X1 \State_reg[0]  ( .D(N34), .CK(clk), .Q(n71), .QN(n87) );
  DFF_X1 \State_reg[1]  ( .D(N35), .CK(clk), .Q(State[1]), .QN(n55) );
  DFF_X1 \State_reg[3]  ( .D(N37), .CK(clk), .Q(State[3]), .QN(n86) );
  DFF_X1 \State_reg[2]  ( .D(N36), .CK(clk), .Q(State[2]), .QN(n6) );
  AND4_X1 U35 ( .A1(n37), .A2(n87), .A3(State[4]), .A4(n55), .ZN(n46) );
  BUF_X1 U36 ( .A(n6), .Z(n31) );
  CLKBUF_X1 U37 ( .A(n44), .Z(n35) );
  AND2_X1 U38 ( .A1(n33), .A2(n76), .ZN(n32) );
  AND2_X1 U39 ( .A1(n70), .A2(n54), .ZN(n33) );
  CLKBUF_X1 U40 ( .A(State[4]), .Z(n34) );
  CLKBUF_X1 U41 ( .A(n46), .Z(n36) );
  BUF_X1 U42 ( .A(n86), .Z(n37) );
  INV_X1 U43 ( .A(n34), .ZN(n38) );
  INV_X1 U44 ( .A(n71), .ZN(n39) );
  AND2_X1 U45 ( .A1(n6), .A2(n48), .ZN(n40) );
  NAND2_X1 U46 ( .A1(n53), .A2(n40), .ZN(n83) );
  AND2_X1 U47 ( .A1(n87), .A2(n55), .ZN(n41) );
  AND3_X1 U48 ( .A1(n43), .A2(n37), .A3(n6), .ZN(n42) );
  BUF_X1 U49 ( .A(n4), .Z(n43) );
  NAND3_X1 U50 ( .A1(n53), .A2(n31), .A3(n48), .ZN(n44) );
  AND4_X1 U51 ( .A1(n49), .A2(n62), .A3(n6), .A4(n48), .ZN(n45) );
  INV_X1 U52 ( .A(n36), .ZN(n84) );
  AND2_X1 U53 ( .A1(n4), .A2(n86), .ZN(n62) );
  AND4_X1 U54 ( .A1(n43), .A2(State[3]), .A3(n76), .A4(n87), .ZN(n74) );
  INV_X1 U55 ( .A(n39), .ZN(n47) );
  NOR2_X1 U56 ( .A1(State[1]), .A2(n87), .ZN(n49) );
  NAND4_X1 U57 ( .A1(n49), .A2(n62), .A3(n6), .A4(n48), .ZN(n50) );
  AND4_X1 U58 ( .A1(State[3]), .A2(n55), .A3(n87), .A4(n4), .ZN(n53) );
  NAND4_X1 U59 ( .A1(n63), .A2(n62), .A3(n6), .A4(n48), .ZN(n79) );
  NOR2_X1 U60 ( .A1(State[1]), .A2(n87), .ZN(n63) );
  INV_X1 U61 ( .A(ten), .ZN(n70) );
  NAND2_X1 U62 ( .A1(twenty), .A2(n70), .ZN(n68) );
  INV_X1 U63 ( .A(clear), .ZN(n76) );
  NOR3_X1 U64 ( .A1(State[2]), .A2(State[3]), .A3(State[4]), .ZN(n51) );
  NAND4_X1 U65 ( .A1(n51), .A2(n76), .A3(State[5]), .A4(n41), .ZN(n61) );
  NOR2_X1 U66 ( .A1(n61), .A2(n68), .ZN(N36) );
  INV_X1 U67 ( .A(n68), .ZN(n52) );
  NAND2_X1 U68 ( .A1(n52), .A2(n76), .ZN(n67) );
  INV_X1 U69 ( .A(twenty), .ZN(n54) );
  NAND4_X1 U70 ( .A1(n41), .A2(State[5]), .A3(n32), .A4(n42), .ZN(n58) );
  NAND2_X1 U71 ( .A1(ten), .A2(n76), .ZN(n66) );
  INV_X1 U72 ( .A(n66), .ZN(n56) );
  NAND2_X1 U73 ( .A1(n48), .A2(n6), .ZN(n85) );
  INV_X1 U74 ( .A(n85), .ZN(n64) );
  NAND3_X1 U75 ( .A1(n64), .A2(n46), .A3(n56), .ZN(n57) );
  OAI211_X1 U76 ( .C1(n67), .C2(n83), .A(n57), .B(n58), .ZN(N39) );
  INV_X1 U77 ( .A(n67), .ZN(n59) );
  NAND3_X1 U78 ( .A1(n46), .A2(n64), .A3(n59), .ZN(n60) );
  OAI21_X1 U79 ( .B1(n61), .B2(n70), .A(n60), .ZN(N35) );
  NAND3_X1 U80 ( .A1(n46), .A2(n64), .A3(n32), .ZN(n65) );
  OAI221_X1 U81 ( .B1(n50), .B2(n67), .C1(n44), .C2(n66), .A(n65), .ZN(n89) );
  NAND2_X1 U82 ( .A1(n68), .A2(n76), .ZN(n69) );
  AOI221_X1 U83 ( .B1(n79), .B2(ten), .C1(n83), .C2(n70), .A(n69), .ZN(N37) );
  NOR4_X1 U84 ( .A1(n43), .A2(State[3]), .A3(clear), .A4(n71), .ZN(n73) );
  NOR3_X1 U85 ( .A1(State[5]), .A2(State[1]), .A3(State[2]), .ZN(n72) );
  OAI21_X1 U86 ( .B1(n73), .B2(n74), .A(n72), .ZN(n78) );
  NOR3_X1 U87 ( .A1(State[2]), .A2(State[3]), .A3(State[4]), .ZN(n75) );
  NAND4_X1 U88 ( .A1(n41), .A2(n76), .A3(State[5]), .A4(n75), .ZN(n77) );
  NAND3_X1 U89 ( .A1(n78), .A2(n79), .A3(n77), .ZN(n81) );
  OAI21_X1 U90 ( .B1(clear), .B2(n33), .A(n45), .ZN(n80) );
  NAND2_X1 U91 ( .A1(n81), .A2(n80), .ZN(N34) );
  NAND4_X1 U92 ( .A1(n39), .A2(n55), .A3(State[5]), .A4(n42), .ZN(n82) );
  OAI211_X1 U93 ( .C1(n85), .C2(n84), .A(n35), .B(n82), .ZN(N40) );
  NAND3_X1 U94 ( .A1(n48), .A2(n37), .A3(n38), .ZN(n88) );
  NOR4_X1 U95 ( .A1(n31), .A2(State[1]), .A3(n47), .A4(n88), .ZN(return_sig)
         );
  NOR4_X1 U96 ( .A1(n47), .A2(n55), .A3(State[2]), .A4(n88), .ZN(dispense) );
  NOR4_X1 U97 ( .A1(n88), .A2(State[2]), .A3(State[1]), .A4(n39), .ZN(ready)
         );
endmodule

