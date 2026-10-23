/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 10:42:33 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   n7, n9, n12, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103;
  wire   [5:0] State;

  DFF_X1 \State_reg[0]  ( .D(n41), .CK(clk), .Q(State[0]), .QN(n12) );
  DFF_X1 \State_reg[3]  ( .D(n38), .CK(clk), .Q(State[3]), .QN(n9) );
  DFF_X1 \State_reg[2]  ( .D(n39), .CK(clk), .Q(n99), .QN(n66) );
  DFF_X1 \State_reg[4]  ( .D(n37), .CK(clk), .Q(State[4]), .QN(n70) );
  DFF_X1 \State_reg[5]  ( .D(n36), .CK(clk), .Q(State[5]), .QN(n7) );
  DFF_X2 \State_reg[1]  ( .D(n40), .CK(clk), .Q(State[1]), .QN(n63) );
  AND2_X1 U40 ( .A1(n79), .A2(n72), .ZN(n42) );
  INV_X1 U41 ( .A(n101), .ZN(n43) );
  BUF_X1 U42 ( .A(n50), .Z(n47) );
  NAND3_X1 U43 ( .A1(n58), .A2(n57), .A3(n48), .ZN(n61) );
  INV_X1 U44 ( .A(State[1]), .ZN(n44) );
  CLKBUF_X1 U45 ( .A(State[5]), .Z(n52) );
  INV_X1 U46 ( .A(n70), .ZN(n45) );
  INV_X1 U47 ( .A(n45), .ZN(n46) );
  AOI21_X1 U48 ( .B1(n71), .B2(n70), .A(n69), .ZN(n48) );
  AOI21_X1 U49 ( .B1(n46), .B2(n71), .A(n69), .ZN(n76) );
  XNOR2_X1 U50 ( .A(n46), .B(n52), .ZN(n97) );
  OR2_X1 U51 ( .A1(n74), .A2(n75), .ZN(n91) );
  AND3_X1 U52 ( .A1(State[3]), .A2(n70), .A3(n7), .ZN(n49) );
  AND3_X1 U53 ( .A1(State[5]), .A2(n9), .A3(n70), .ZN(n50) );
  CLKBUF_X1 U54 ( .A(n103), .Z(n51) );
  CLKBUF_X1 U55 ( .A(n49), .Z(n53) );
  NAND4_X1 U56 ( .A1(n66), .A2(n98), .A3(n44), .A4(n53), .ZN(n54) );
  BUF_X1 U57 ( .A(n88), .Z(n55) );
  CLKBUF_X1 U58 ( .A(n89), .Z(n56) );
  NAND2_X1 U59 ( .A1(n62), .A2(n65), .ZN(n57) );
  NAND2_X1 U60 ( .A1(n65), .A2(n64), .ZN(n58) );
  CLKBUF_X1 U61 ( .A(n48), .Z(n59) );
  NAND2_X1 U62 ( .A1(n12), .A2(n63), .ZN(n67) );
  NOR4_X1 U63 ( .A1(n52), .A2(n67), .A3(n66), .A4(State[3]), .ZN(n71) );
  NAND2_X1 U64 ( .A1(n103), .A2(n79), .ZN(n69) );
  NAND3_X1 U65 ( .A1(n48), .A2(n58), .A3(n57), .ZN(n60) );
  INV_X1 U66 ( .A(State[0]), .ZN(n98) );
  NAND3_X1 U67 ( .A1(n66), .A2(n98), .A3(n63), .ZN(n93) );
  NAND3_X1 U68 ( .A1(n7), .A2(n9), .A3(State[4]), .ZN(n82) );
  NAND4_X1 U69 ( .A1(n50), .A2(n98), .A3(n63), .A4(n66), .ZN(n89) );
  OAI21_X1 U70 ( .B1(n93), .B2(n82), .A(n89), .ZN(n62) );
  OR2_X1 U71 ( .A1(twenty), .A2(ten), .ZN(n65) );
  NAND2_X1 U72 ( .A1(n65), .A2(n62), .ZN(n78) );
  NAND2_X1 U73 ( .A1(n70), .A2(n9), .ZN(n75) );
  NAND4_X1 U74 ( .A1(n63), .A2(n66), .A3(n7), .A4(State[0]), .ZN(n74) );
  NAND4_X1 U75 ( .A1(n49), .A2(n98), .A3(n63), .A4(n66), .ZN(n96) );
  OAI21_X1 U76 ( .B1(n75), .B2(n74), .A(n96), .ZN(n64) );
  NAND2_X1 U77 ( .A1(n65), .A2(n64), .ZN(n77) );
  INV_X1 U78 ( .A(clear), .ZN(n79) );
  NOR3_X1 U79 ( .A1(State[3]), .A2(State[4]), .A3(State[5]), .ZN(n68) );
  NAND4_X1 U80 ( .A1(n68), .A2(n12), .A3(n66), .A4(State[1]), .ZN(n103) );
  NAND3_X1 U81 ( .A1(n78), .A2(n77), .A3(n76), .ZN(n90) );
  OAI21_X1 U82 ( .B1(n60), .B2(n12), .A(n59), .ZN(n41) );
  INV_X1 U83 ( .A(ten), .ZN(n72) );
  NAND3_X1 U84 ( .A1(n90), .A2(n47), .A3(n42), .ZN(n73) );
  OAI21_X1 U85 ( .B1(n66), .B2(n60), .A(n73), .ZN(n39) );
  INV_X1 U86 ( .A(n91), .ZN(ready) );
  NAND3_X1 U87 ( .A1(n78), .A2(n76), .A3(n77), .ZN(n88) );
  NAND3_X1 U88 ( .A1(n61), .A2(ready), .A3(n42), .ZN(n81) );
  NAND2_X1 U89 ( .A1(ten), .A2(n79), .ZN(n92) );
  INV_X1 U90 ( .A(n92), .ZN(n83) );
  NAND3_X1 U91 ( .A1(n90), .A2(n53), .A3(n83), .ZN(n80) );
  OAI211_X1 U92 ( .C1(n55), .C2(n46), .A(n80), .B(n81), .ZN(n37) );
  NAND3_X1 U93 ( .A1(n90), .A2(n53), .A3(n42), .ZN(n85) );
  INV_X1 U94 ( .A(n82), .ZN(n86) );
  NAND3_X1 U95 ( .A1(n61), .A2(n83), .A3(n86), .ZN(n84) );
  OAI211_X1 U96 ( .C1(n55), .C2(n7), .A(n85), .B(n84), .ZN(n36) );
  NAND3_X1 U97 ( .A1(n88), .A2(n86), .A3(n42), .ZN(n87) );
  OAI221_X1 U98 ( .B1(n92), .B2(n56), .C1(n60), .C2(n44), .A(n87), .ZN(n40) );
  OAI22_X1 U99 ( .A1(n92), .A2(n91), .B1(n60), .B2(n43), .ZN(n38) );
  INV_X1 U100 ( .A(n93), .ZN(n94) );
  NAND3_X1 U101 ( .A1(n94), .A2(n43), .A3(n97), .ZN(n95) );
  NAND2_X1 U102 ( .A1(n54), .A2(n95), .ZN(bill) );
  INV_X1 U103 ( .A(n97), .ZN(n100) );
  NAND3_X1 U104 ( .A1(n100), .A2(n99), .A3(n98), .ZN(n102) );
  INV_X1 U105 ( .A(n9), .ZN(n101) );
  NOR4_X1 U106 ( .A1(n102), .A2(n45), .A3(State[1]), .A4(n101), .ZN(return_sig) );
  INV_X1 U107 ( .A(n51), .ZN(dispense) );
endmodule

