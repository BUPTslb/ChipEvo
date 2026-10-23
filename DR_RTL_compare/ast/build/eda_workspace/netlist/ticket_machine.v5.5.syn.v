/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:10:13 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N23, N24, N26, N27, N28, n1, n2, n6, n8, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122;
  wire   [5:0] State;

  DFF_X1 \State_reg[2]  ( .D(n2), .CK(clk), .Q(State[2]), .QN(n8) );
  DFF_X1 \State_reg[4]  ( .D(N27), .CK(clk), .Q(State[4]), .QN(n6) );
  DFF_X1 \State_reg[0]  ( .D(N23), .CK(clk), .Q(State[0]), .QN(n79) );
  DFF_X1 \State_reg[1]  ( .D(N24), .CK(clk), .Q(State[1]), .QN(n74) );
  DFF_X1 \State_reg[5]  ( .D(N28), .CK(clk), .Q(State[5]), .QN(n1) );
  DFF_X1 \State_reg[3]  ( .D(N26), .CK(clk), .Q(State[3]), .QN(n108) );
  INV_X1 U43 ( .A(n42), .ZN(n117) );
  CLKBUF_X1 U44 ( .A(n79), .Z(n41) );
  AND2_X1 U45 ( .A1(n60), .A2(n67), .ZN(n42) );
  INV_X1 U46 ( .A(n44), .ZN(n43) );
  CLKBUF_X1 U47 ( .A(n72), .Z(n50) );
  CLKBUF_X1 U48 ( .A(State[5]), .Z(n62) );
  CLKBUF_X1 U49 ( .A(n75), .Z(n44) );
  INV_X1 U50 ( .A(n109), .ZN(n45) );
  AND2_X1 U51 ( .A1(n74), .A2(n8), .ZN(n46) );
  NOR3_X1 U52 ( .A1(n77), .A2(n78), .A3(State[3]), .ZN(n47) );
  CLKBUF_X1 U53 ( .A(n1), .Z(n48) );
  AND2_X1 U54 ( .A1(n63), .A2(n59), .ZN(n49) );
  NAND3_X1 U55 ( .A1(n121), .A2(n97), .A3(n120), .ZN(n51) );
  BUF_X1 U56 ( .A(n108), .Z(n52) );
  NOR3_X1 U57 ( .A1(State[0]), .A2(State[2]), .A3(State[1]), .ZN(n67) );
  INV_X1 U58 ( .A(State[0]), .ZN(n53) );
  INV_X1 U59 ( .A(State[1]), .ZN(n54) );
  INV_X1 U60 ( .A(n59), .ZN(n95) );
  AND2_X1 U61 ( .A1(n63), .A2(n59), .ZN(n55) );
  AND3_X1 U62 ( .A1(n1), .A2(n6), .A3(State[0]), .ZN(n56) );
  AND2_X1 U63 ( .A1(State[3]), .A2(n53), .ZN(n57) );
  OAI221_X1 U64 ( .B1(n101), .B2(n100), .C1(n95), .C2(n101), .A(n94), .ZN(n58)
         );
  AND4_X1 U65 ( .A1(State[4]), .A2(n108), .A3(n111), .A4(n1), .ZN(n59) );
  AND3_X1 U66 ( .A1(n6), .A2(n108), .A3(State[5]), .ZN(n60) );
  OR2_X1 U67 ( .A1(n105), .A2(n61), .ZN(N23) );
  AND3_X1 U68 ( .A1(n99), .A2(n98), .A3(n68), .ZN(n61) );
  AND3_X1 U69 ( .A1(n54), .A2(n79), .A3(n107), .ZN(n63) );
  INV_X1 U70 ( .A(State[4]), .ZN(n64) );
  CLKBUF_X1 U71 ( .A(n121), .Z(n65) );
  CLKBUF_X1 U72 ( .A(n120), .Z(n66) );
  INV_X1 U73 ( .A(n53), .ZN(n68) );
  NOR3_X1 U74 ( .A1(n77), .A2(n78), .A3(State[3]), .ZN(n69) );
  NOR2_X1 U75 ( .A1(n89), .A2(n62), .ZN(n70) );
  NAND2_X1 U76 ( .A1(n1), .A2(n6), .ZN(n80) );
  AND2_X1 U77 ( .A1(n8), .A2(n74), .ZN(n71) );
  INV_X1 U78 ( .A(n107), .ZN(n72) );
  NAND4_X1 U79 ( .A1(n71), .A2(ten), .A3(State[3]), .A4(n79), .ZN(n81) );
  NOR2_X1 U80 ( .A1(n81), .A2(n80), .ZN(n90) );
  INV_X1 U81 ( .A(n54), .ZN(n73) );
  INV_X1 U82 ( .A(State[2]), .ZN(n75) );
  AND4_X1 U83 ( .A1(n6), .A2(n108), .A3(n1), .A4(n79), .ZN(n76) );
  NAND3_X1 U84 ( .A1(n73), .A2(n76), .A3(n75), .ZN(n121) );
  INV_X1 U85 ( .A(clear), .ZN(n97) );
  NAND3_X1 U86 ( .A1(n76), .A2(n72), .A3(n109), .ZN(n120) );
  NAND3_X1 U87 ( .A1(n121), .A2(n120), .A3(n97), .ZN(n105) );
  NAND2_X1 U88 ( .A1(n74), .A2(n8), .ZN(n77) );
  INV_X1 U89 ( .A(n77), .ZN(n88) );
  INV_X1 U90 ( .A(ten), .ZN(n83) );
  NAND2_X1 U91 ( .A1(twenty), .A2(n83), .ZN(n78) );
  INV_X1 U92 ( .A(n78), .ZN(n111) );
  NAND2_X1 U93 ( .A1(n69), .A2(n56), .ZN(n98) );
  INV_X1 U94 ( .A(n98), .ZN(n82) );
  NOR3_X1 U95 ( .A1(n90), .A2(State[4]), .A3(n82), .ZN(n86) );
  INV_X1 U96 ( .A(State[2]), .ZN(n107) );
  INV_X1 U97 ( .A(State[1]), .ZN(n109) );
  NAND4_X1 U98 ( .A1(State[4]), .A2(n109), .A3(n53), .A4(n52), .ZN(n84) );
  NOR4_X1 U99 ( .A1(n84), .A2(n50), .A3(n62), .A4(n83), .ZN(n85) );
  NOR4_X1 U100 ( .A1(n86), .A2(n51), .A3(n85), .A4(n49), .ZN(N27) );
  NOR3_X1 U101 ( .A1(State[4]), .A2(State[5]), .A3(n79), .ZN(n87) );
  NAND4_X1 U102 ( .A1(n87), .A2(ten), .A3(n52), .A4(n88), .ZN(n99) );
  INV_X1 U103 ( .A(n99), .ZN(n93) );
  NAND2_X1 U104 ( .A1(n46), .A2(n6), .ZN(n89) );
  INV_X1 U105 ( .A(n89), .ZN(n115) );
  NAND3_X1 U106 ( .A1(twenty), .A2(n57), .A3(n70), .ZN(n92) );
  AOI21_X1 U107 ( .B1(n47), .B2(n56), .A(n90), .ZN(n91) );
  OAI211_X1 U108 ( .C1(n93), .C2(State[3]), .A(n92), .B(n91), .ZN(n96) );
  NAND3_X1 U109 ( .A1(n75), .A2(n54), .A3(n41), .ZN(n101) );
  NAND4_X1 U110 ( .A1(State[5]), .A2(n108), .A3(ten), .A4(n6), .ZN(n100) );
  NAND3_X1 U111 ( .A1(n67), .A2(n60), .A3(twenty), .ZN(n94) );
  NOR3_X1 U112 ( .A1(n96), .A2(clear), .A3(n58), .ZN(N26) );
  NAND3_X1 U113 ( .A1(n121), .A2(n97), .A3(n120), .ZN(n112) );
  INV_X1 U114 ( .A(n100), .ZN(n103) );
  INV_X1 U115 ( .A(n101), .ZN(n102) );
  AOI211_X1 U116 ( .C1(n103), .C2(n102), .A(n45), .B(n55), .ZN(n104) );
  NOR2_X1 U117 ( .A1(n104), .A2(n105), .ZN(N24) );
  NAND2_X1 U118 ( .A1(n42), .A2(n111), .ZN(n106) );
  AOI21_X1 U119 ( .B1(n106), .B2(n44), .A(n105), .ZN(n2) );
  NAND3_X1 U120 ( .A1(n53), .A2(n108), .A3(n75), .ZN(n119) );
  NAND3_X1 U121 ( .A1(n1), .A2(n109), .A3(State[4]), .ZN(n118) );
  NOR2_X1 U122 ( .A1(n119), .A2(n118), .ZN(n110) );
  AOI21_X1 U123 ( .B1(n110), .B2(ten), .A(n62), .ZN(n114) );
  NAND3_X1 U124 ( .A1(n111), .A2(n57), .A3(n70), .ZN(n113) );
  AOI211_X1 U125 ( .C1(n114), .C2(n113), .A(n112), .B(n58), .ZN(N28) );
  NAND3_X1 U126 ( .A1(n57), .A2(n115), .A3(n48), .ZN(n116) );
  OAI211_X1 U127 ( .C1(n119), .C2(n118), .A(n117), .B(n116), .ZN(bill) );
  INV_X1 U128 ( .A(n66), .ZN(return_sig) );
  INV_X1 U129 ( .A(n65), .ZN(dispense) );
  NAND3_X1 U130 ( .A1(n52), .A2(n64), .A3(n48), .ZN(n122) );
  NOR4_X1 U131 ( .A1(n122), .A2(n53), .A3(n43), .A4(n45), .ZN(ready) );
endmodule

