/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:20:06 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N11, n6, n8, n35, n38, n39, n40, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122;
  wire   [5:0] State;
  assign bill = N11;

  DFF_X1 \State_reg[2]  ( .D(n38), .CK(clk), .Q(State[2]), .QN(n6) );
  DFF_X1 \State_reg[4]  ( .D(n121), .CK(clk), .Q(State[4]), .QN(n98) );
  DFF_X1 \State_reg[5]  ( .D(n35), .CK(clk), .Q(State[5]), .QN(n111) );
  DFF_X1 \State_reg[1]  ( .D(n39), .CK(clk), .Q(State[1]), .QN(n61) );
  DFF_X1 \State_reg[0]  ( .D(n40), .CK(clk), .Q(State[0]), .QN(n8) );
  DFF_X1 \State_reg[3]  ( .D(n122), .CK(clk), .Q(n53), .QN(n110) );
  INV_X1 U41 ( .A(twenty), .ZN(n51) );
  AND2_X1 U42 ( .A1(n103), .A2(n111), .ZN(n44) );
  CLKBUF_X1 U43 ( .A(n56), .Z(n45) );
  CLKBUF_X1 U44 ( .A(n119), .Z(n46) );
  INV_X1 U45 ( .A(State[0]), .ZN(n47) );
  BUF_X1 U46 ( .A(n8), .Z(n59) );
  AND4_X1 U47 ( .A1(n59), .A2(n52), .A3(n62), .A4(n111), .ZN(n48) );
  CLKBUF_X1 U48 ( .A(n111), .Z(n49) );
  INV_X1 U49 ( .A(n63), .ZN(n50) );
  AND3_X1 U50 ( .A1(n76), .A2(n51), .A3(n52), .ZN(n91) );
  BUF_X1 U51 ( .A(n98), .Z(n52) );
  NAND2_X1 U52 ( .A1(n82), .A2(n44), .ZN(n83) );
  INV_X1 U53 ( .A(n53), .ZN(n54) );
  INV_X1 U54 ( .A(State[1]), .ZN(n55) );
  AND2_X1 U55 ( .A1(State[0]), .A2(n98), .ZN(n56) );
  AND2_X1 U56 ( .A1(n70), .A2(n61), .ZN(n57) );
  CLKBUF_X1 U57 ( .A(n67), .Z(n58) );
  BUF_X1 U58 ( .A(n110), .Z(n70) );
  CLKBUF_X1 U59 ( .A(State[2]), .Z(n60) );
  INV_X1 U60 ( .A(n70), .ZN(n62) );
  CLKBUF_X1 U61 ( .A(n60), .Z(n63) );
  INV_X1 U62 ( .A(n73), .ZN(n64) );
  BUF_X2 U63 ( .A(State[4]), .Z(n65) );
  CLKBUF_X1 U64 ( .A(n62), .Z(n66) );
  AND3_X1 U65 ( .A1(n98), .A2(n95), .A3(n77), .ZN(n102) );
  BUF_X1 U66 ( .A(n110), .Z(n67) );
  AND3_X1 U67 ( .A1(n72), .A2(n59), .A3(n61), .ZN(n68) );
  INV_X1 U68 ( .A(State[2]), .ZN(n69) );
  INV_X1 U69 ( .A(n66), .ZN(n71) );
  AND3_X1 U70 ( .A1(n6), .A2(n95), .A3(n110), .ZN(n72) );
  NAND3_X1 U71 ( .A1(n72), .A2(n59), .A3(n61), .ZN(n73) );
  INV_X1 U72 ( .A(ten), .ZN(n76) );
  NAND2_X1 U73 ( .A1(twenty), .A2(n76), .ZN(n79) );
  NOR4_X1 U74 ( .A1(n73), .A2(n49), .A3(n65), .A4(n79), .ZN(n38) );
  INV_X1 U75 ( .A(n79), .ZN(n88) );
  NAND4_X1 U76 ( .A1(n68), .A2(n49), .A3(n65), .A4(n88), .ZN(n75) );
  NAND4_X1 U77 ( .A1(n68), .A2(State[5]), .A3(n52), .A4(ten), .ZN(n74) );
  NAND2_X1 U78 ( .A1(n75), .A2(n74), .ZN(n39) );
  NAND4_X1 U79 ( .A1(n62), .A2(n52), .A3(n59), .A4(n111), .ZN(n100) );
  INV_X1 U80 ( .A(State[2]), .ZN(n103) );
  NAND2_X1 U81 ( .A1(n61), .A2(n103), .ZN(n114) );
  NAND2_X1 U82 ( .A1(n79), .A2(n76), .ZN(n77) );
  INV_X1 U83 ( .A(n77), .ZN(n101) );
  INV_X1 U84 ( .A(clear), .ZN(n95) );
  NAND2_X1 U85 ( .A1(n101), .A2(n95), .ZN(n78) );
  NAND3_X1 U86 ( .A1(n67), .A2(n61), .A3(n111), .ZN(n99) );
  NAND2_X1 U87 ( .A1(n56), .A2(n103), .ZN(n119) );
  NAND2_X1 U88 ( .A1(ten), .A2(n95), .ZN(n81) );
  OAI33_X1 U89 ( .A1(n100), .A2(n114), .A3(n78), .B1(n119), .B2(n99), .B3(n81), 
        .ZN(n122) );
  NAND4_X1 U90 ( .A1(n101), .A2(n47), .A3(n95), .A4(n111), .ZN(n86) );
  NAND4_X1 U91 ( .A1(n65), .A2(n103), .A3(n58), .A4(n55), .ZN(n85) );
  NOR4_X1 U92 ( .A1(clear), .A2(State[5]), .A3(n79), .A4(State[2]), .ZN(n80)
         );
  NAND3_X1 U93 ( .A1(n57), .A2(n45), .A3(n80), .ZN(n84) );
  NAND2_X1 U94 ( .A1(n8), .A2(n98), .ZN(n87) );
  NOR4_X1 U95 ( .A1(n87), .A2(n67), .A3(State[1]), .A4(n81), .ZN(n82) );
  OAI211_X1 U96 ( .C1(n86), .C2(n85), .A(n83), .B(n84), .ZN(n121) );
  INV_X1 U97 ( .A(n87), .ZN(n117) );
  NAND3_X1 U98 ( .A1(n6), .A2(n95), .A3(n88), .ZN(n89) );
  NOR3_X1 U99 ( .A1(n70), .A2(n89), .A3(State[1]), .ZN(n90) );
  NAND3_X1 U100 ( .A1(n117), .A2(n49), .A3(n90), .ZN(n94) );
  NAND4_X1 U101 ( .A1(n68), .A2(n49), .A3(n65), .A4(ten), .ZN(n93) );
  NAND3_X1 U102 ( .A1(n64), .A2(State[5]), .A3(n91), .ZN(n92) );
  NAND3_X1 U103 ( .A1(n93), .A2(n94), .A3(n92), .ZN(n35) );
  NAND3_X1 U104 ( .A1(n8), .A2(n6), .A3(n95), .ZN(n97) );
  AOI21_X1 U105 ( .B1(n54), .B2(n61), .A(State[4]), .ZN(n96) );
  AOI211_X1 U106 ( .C1(n111), .C2(n52), .A(n97), .B(n96), .ZN(n109) );
  NAND2_X1 U107 ( .A1(n65), .A2(n99), .ZN(n108) );
  NOR3_X1 U108 ( .A1(clear), .A2(n60), .A3(State[1]), .ZN(n107) );
  NAND3_X1 U109 ( .A1(n102), .A2(n69), .A3(State[0]), .ZN(n105) );
  INV_X1 U110 ( .A(n70), .ZN(n104) );
  NOR4_X1 U111 ( .A1(n105), .A2(n104), .A3(State[1]), .A4(State[5]), .ZN(n106)
         );
  AOI221_X1 U112 ( .B1(n108), .B2(n109), .C1(n48), .C2(n107), .A(n106), .ZN(
        n40) );
  NAND3_X1 U113 ( .A1(n55), .A2(State[5]), .A3(n71), .ZN(n112) );
  NAND2_X1 U114 ( .A1(n57), .A2(n49), .ZN(n120) );
  MUX2_X1 U115 ( .A(n112), .B(n120), .S(n65), .Z(n116) );
  INV_X1 U116 ( .A(n47), .ZN(n115) );
  NAND2_X1 U117 ( .A1(n66), .A2(n117), .ZN(n113) );
  OAI33_X1 U118 ( .A1(n63), .A2(n116), .A3(n115), .B1(n114), .B2(State[5]), 
        .B3(n113), .ZN(N11) );
  NAND3_X1 U119 ( .A1(n49), .A2(n58), .A3(n117), .ZN(n118) );
  NOR3_X1 U120 ( .A1(n50), .A2(State[1]), .A3(n118), .ZN(return_sig) );
  NOR3_X1 U121 ( .A1(n55), .A2(n63), .A3(n118), .ZN(dispense) );
  NOR2_X1 U122 ( .A1(n120), .A2(n46), .ZN(ready) );
endmodule

