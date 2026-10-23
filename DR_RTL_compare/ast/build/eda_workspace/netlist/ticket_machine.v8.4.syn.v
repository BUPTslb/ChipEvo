/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:54:45 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   \clear_or_next[2] , N18, n7, n8, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102;
  wire   [5:0] State;
  assign bill = N18;

  DFF_X1 \State_reg[1]  ( .D(n98), .CK(clk), .Q(State[1]), .QN(n8) );
  DFF_X1 \State_reg[3]  ( .D(n99), .CK(clk), .Q(State[3]), .QN(n94) );
  DFF_X1 \State_reg[0]  ( .D(n102), .CK(clk), .Q(State[0]), .QN(n96) );
  DFF_X1 \State_reg[5]  ( .D(n100), .CK(clk), .Q(State[5]), .QN(n60) );
  DFF_X1 \State_reg[4]  ( .D(n101), .CK(clk), .Q(State[4]), .QN(n95) );
  DFF_X2 \State_reg[2]  ( .D(\clear_or_next[2] ), .CK(clk), .Q(State[2]), .QN(
        n7) );
  CLKBUF_X1 U34 ( .A(n60), .Z(n30) );
  CLKBUF_X1 U35 ( .A(n45), .Z(n31) );
  AND2_X1 U36 ( .A1(twenty), .A2(n62), .ZN(n32) );
  CLKBUF_X1 U37 ( .A(n92), .Z(n33) );
  INV_X1 U38 ( .A(n49), .ZN(n34) );
  CLKBUF_X1 U39 ( .A(n91), .Z(n35) );
  CLKBUF_X1 U40 ( .A(n60), .Z(n43) );
  CLKBUF_X1 U41 ( .A(n93), .Z(n36) );
  OAI21_X1 U42 ( .B1(n37), .B2(clear), .A(n38), .ZN(n101) );
  INV_X1 U43 ( .A(n53), .ZN(n37) );
  INV_X1 U44 ( .A(n79), .ZN(n38) );
  CLKBUF_X1 U45 ( .A(n95), .Z(n39) );
  BUF_X2 U46 ( .A(State[0]), .Z(n40) );
  INV_X1 U47 ( .A(n47), .ZN(n41) );
  CLKBUF_X1 U48 ( .A(n8), .Z(n42) );
  NOR3_X1 U49 ( .A1(State[2]), .A2(State[1]), .A3(State[5]), .ZN(n44) );
  INV_X1 U50 ( .A(State[0]), .ZN(n45) );
  BUF_X1 U51 ( .A(n94), .Z(n46) );
  INV_X1 U52 ( .A(n7), .ZN(n47) );
  INV_X1 U53 ( .A(n94), .ZN(n48) );
  CLKBUF_X1 U54 ( .A(n60), .Z(n49) );
  INV_X1 U55 ( .A(n95), .ZN(n50) );
  AND2_X1 U56 ( .A1(n95), .A2(n94), .ZN(n51) );
  AND2_X1 U57 ( .A1(n46), .A2(n7), .ZN(n52) );
  AND4_X1 U58 ( .A1(n80), .A2(n51), .A3(n40), .A4(n32), .ZN(n53) );
  AND4_X1 U59 ( .A1(n96), .A2(n8), .A3(n95), .A4(State[5]), .ZN(n54) );
  INV_X1 U60 ( .A(State[3]), .ZN(n55) );
  AND4_X1 U61 ( .A1(n43), .A2(n50), .A3(n45), .A4(n55), .ZN(n56) );
  INV_X1 U62 ( .A(State[4]), .ZN(n57) );
  AND4_X1 U63 ( .A1(n45), .A2(n30), .A3(n8), .A4(n7), .ZN(n85) );
  AND4_X1 U64 ( .A1(n43), .A2(n48), .A3(n39), .A4(n45), .ZN(n58) );
  NAND2_X1 U65 ( .A1(n8), .A2(n7), .ZN(n59) );
  INV_X1 U66 ( .A(ten), .ZN(n62) );
  INV_X1 U67 ( .A(clear), .ZN(n90) );
  NAND2_X1 U68 ( .A1(n32), .A2(n90), .ZN(n72) );
  NAND2_X1 U69 ( .A1(n54), .A2(n52), .ZN(n92) );
  NOR2_X1 U70 ( .A1(n92), .A2(n72), .ZN(\clear_or_next[2] ) );
  NAND3_X1 U71 ( .A1(n57), .A2(n55), .A3(n7), .ZN(n63) );
  INV_X1 U72 ( .A(twenty), .ZN(n61) );
  NAND2_X1 U73 ( .A1(n62), .A2(n61), .ZN(n74) );
  NAND2_X1 U74 ( .A1(n8), .A2(n96), .ZN(n67) );
  NOR4_X1 U75 ( .A1(n63), .A2(n49), .A3(n67), .A4(n74), .ZN(n65) );
  NAND2_X1 U76 ( .A1(n8), .A2(n7), .ZN(n78) );
  NAND4_X1 U77 ( .A1(State[3]), .A2(n95), .A3(n60), .A4(n96), .ZN(n81) );
  NAND2_X1 U78 ( .A1(ten), .A2(n90), .ZN(n76) );
  NAND4_X1 U79 ( .A1(State[4]), .A2(n60), .A3(n96), .A4(n94), .ZN(n77) );
  OAI33_X1 U80 ( .A1(n72), .A2(n59), .A3(n81), .B1(n77), .B2(n78), .B3(n76), 
        .ZN(n64) );
  AOI21_X1 U81 ( .B1(n65), .B2(n90), .A(n64), .ZN(n66) );
  INV_X1 U82 ( .A(n66), .ZN(n100) );
  INV_X1 U83 ( .A(n59), .ZN(n82) );
  NAND2_X1 U84 ( .A1(n56), .A2(n82), .ZN(n91) );
  INV_X1 U85 ( .A(n67), .ZN(n70) );
  INV_X1 U86 ( .A(n76), .ZN(n69) );
  NOR3_X1 U87 ( .A1(n47), .A2(n50), .A3(n48), .ZN(n68) );
  NAND4_X1 U88 ( .A1(n68), .A2(n34), .A3(n69), .A4(n70), .ZN(n71) );
  OAI21_X1 U89 ( .B1(n91), .B2(n72), .A(n71), .ZN(n98) );
  NOR3_X1 U90 ( .A1(State[2]), .A2(State[1]), .A3(State[5]), .ZN(n73) );
  NAND4_X1 U91 ( .A1(n44), .A2(n51), .A3(n40), .A4(n32), .ZN(n87) );
  INV_X1 U92 ( .A(n74), .ZN(n75) );
  NAND2_X1 U93 ( .A1(n75), .A2(n90), .ZN(n83) );
  OAI33_X1 U94 ( .A1(n83), .A2(n59), .A3(n77), .B1(n81), .B2(n78), .B3(n76), 
        .ZN(n79) );
  NOR3_X1 U95 ( .A1(State[2]), .A2(State[1]), .A3(State[5]), .ZN(n80) );
  NAND4_X1 U96 ( .A1(n73), .A2(n51), .A3(n40), .A4(ten), .ZN(n88) );
  NAND2_X1 U97 ( .A1(n58), .A2(n82), .ZN(n93) );
  OAI22_X1 U98 ( .A1(clear), .A2(n88), .B1(n93), .B2(n83), .ZN(n99) );
  OAI22_X1 U99 ( .A1(n46), .A2(n50), .B1(n48), .B2(n57), .ZN(n84) );
  AOI22_X1 U100 ( .A1(n54), .A2(n52), .B1(n85), .B2(n84), .ZN(n86) );
  NAND3_X1 U101 ( .A1(n86), .A2(n87), .A3(n88), .ZN(n89) );
  NAND2_X1 U102 ( .A1(n89), .A2(n90), .ZN(n102) );
  NAND3_X1 U103 ( .A1(n36), .A2(n33), .A3(n35), .ZN(N18) );
  NAND3_X1 U104 ( .A1(n49), .A2(n57), .A3(n55), .ZN(n97) );
  NOR4_X1 U105 ( .A1(n41), .A2(State[1]), .A3(n40), .A4(n97), .ZN(return_sig)
         );
  NOR4_X1 U106 ( .A1(n42), .A2(n40), .A3(n47), .A4(n97), .ZN(dispense) );
  NOR4_X1 U107 ( .A1(n97), .A2(n47), .A3(n31), .A4(State[1]), .ZN(ready) );
endmodule

