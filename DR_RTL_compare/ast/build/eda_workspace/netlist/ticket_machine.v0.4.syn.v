/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 10:45:15 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   n13, n14, n15, n45, n46, n47, n48, n49, n50, n51, n52, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157;
  wire   [5:0] State;

  DFF_X1 \State_reg[3]  ( .D(n47), .CK(clk), .Q(State[3]), .QN(n13) );
  DFF_X1 \State_reg[0]  ( .D(n50), .CK(clk), .Q(State[0]), .QN(n92) );
  DFF_X1 \State_reg[5]  ( .D(n49), .CK(clk), .Q(State[5]), .QN(n111) );
  DFF_X1 \State_reg[1]  ( .D(n45), .CK(clk), .Q(State[1]), .QN(n15) );
  DFF_X2 \State_reg[4]  ( .D(n48), .CK(clk), .Q(State[4]), .QN(n94) );
  DFF_X1 \State_reg[2]  ( .D(n46), .CK(clk), .Q(State[2]), .QN(n14) );
  CLKBUF_X1 U51 ( .A(n157), .Z(n51) );
  INV_X1 U52 ( .A(ready), .ZN(n144) );
  CLKBUF_X1 U53 ( .A(State[1]), .Z(n52) );
  AND2_X2 U54 ( .A1(n70), .A2(n69), .ZN(ready) );
  AND3_X1 U55 ( .A1(n108), .A2(n90), .A3(n77), .ZN(n67) );
  BUF_X1 U56 ( .A(n146), .Z(n93) );
  AND2_X1 U57 ( .A1(State[4]), .A2(n111), .ZN(n54) );
  INV_X1 U58 ( .A(n86), .ZN(n55) );
  CLKBUF_X1 U59 ( .A(n94), .Z(n71) );
  INV_X1 U60 ( .A(n64), .ZN(n56) );
  BUF_X1 U61 ( .A(n92), .Z(n64) );
  BUF_X1 U62 ( .A(n92), .Z(n57) );
  INV_X1 U63 ( .A(n85), .ZN(n58) );
  BUF_X1 U64 ( .A(n13), .Z(n95) );
  CLKBUF_X1 U65 ( .A(n150), .Z(n59) );
  NAND3_X1 U66 ( .A1(n123), .A2(n150), .A3(ten), .ZN(n60) );
  NAND3_X1 U67 ( .A1(n123), .A2(n150), .A3(ten), .ZN(n61) );
  BUF_X1 U68 ( .A(n133), .Z(n78) );
  AND3_X1 U69 ( .A1(n68), .A2(State[0]), .A3(n90), .ZN(n62) );
  AND2_X1 U70 ( .A1(n15), .A2(n14), .ZN(n100) );
  INV_X1 U71 ( .A(n71), .ZN(n63) );
  AND2_X1 U72 ( .A1(n147), .A2(n113), .ZN(n65) );
  INV_X1 U73 ( .A(State[5]), .ZN(n66) );
  NAND3_X1 U74 ( .A1(twenty), .A2(n110), .A3(n54), .ZN(n127) );
  AND4_X1 U75 ( .A1(n95), .A2(n57), .A3(n14), .A4(n15), .ZN(n110) );
  INV_X1 U76 ( .A(n67), .ZN(n126) );
  NAND4_X1 U77 ( .A1(n88), .A2(n138), .A3(n137), .A4(n136), .ZN(n139) );
  AND2_X1 U78 ( .A1(n94), .A2(n111), .ZN(n68) );
  NAND2_X1 U79 ( .A1(n120), .A2(n88), .ZN(n116) );
  AND2_X1 U80 ( .A1(n14), .A2(n81), .ZN(n69) );
  INV_X1 U81 ( .A(n62), .ZN(n112) );
  AND3_X1 U82 ( .A1(n68), .A2(State[0]), .A3(n90), .ZN(n70) );
  NAND2_X1 U83 ( .A1(n87), .A2(n60), .ZN(n138) );
  OAI21_X1 U84 ( .B1(n106), .B2(n105), .A(n104), .ZN(n72) );
  OAI21_X1 U85 ( .B1(n106), .B2(n105), .A(n104), .ZN(n73) );
  AND2_X1 U86 ( .A1(n113), .A2(n125), .ZN(n74) );
  INV_X1 U87 ( .A(n93), .ZN(n75) );
  CLKBUF_X1 U88 ( .A(n90), .Z(n76) );
  CLKBUF_X1 U89 ( .A(n94), .Z(n77) );
  NAND2_X1 U90 ( .A1(n134), .A2(n135), .ZN(n140) );
  OR2_X1 U91 ( .A1(n118), .A2(n117), .ZN(n157) );
  INV_X1 U92 ( .A(n74), .ZN(n79) );
  CLKBUF_X1 U93 ( .A(n76), .Z(n80) );
  OR2_X1 U94 ( .A1(State[0]), .A2(State[2]), .ZN(n117) );
  BUF_X1 U95 ( .A(n15), .Z(n81) );
  INV_X1 U96 ( .A(n127), .ZN(n82) );
  AND2_X1 U97 ( .A1(n67), .A2(n69), .ZN(n83) );
  CLKBUF_X1 U98 ( .A(n155), .Z(n84) );
  INV_X1 U99 ( .A(n111), .ZN(n85) );
  BUF_X1 U100 ( .A(n15), .Z(n86) );
  NAND4_X1 U101 ( .A1(n102), .A2(n101), .A3(n64), .A4(n100), .ZN(n87) );
  NOR2_X1 U102 ( .A1(State[4]), .A2(n107), .ZN(n101) );
  AND2_X1 U103 ( .A1(n113), .A2(n112), .ZN(n88) );
  AND4_X1 U104 ( .A1(n128), .A2(n73), .A3(n124), .A4(n127), .ZN(n89) );
  INV_X1 U105 ( .A(n133), .ZN(n134) );
  INV_X1 U106 ( .A(State[3]), .ZN(n90) );
  AND4_X1 U107 ( .A1(n101), .A2(n102), .A3(n57), .A4(n100), .ZN(n91) );
  CLKBUF_X1 U108 ( .A(n147), .Z(n96) );
  NAND2_X1 U109 ( .A1(n140), .A2(n139), .ZN(n49) );
  NOR2_X1 U110 ( .A1(n132), .A2(n58), .ZN(n135) );
  AND2_X1 U111 ( .A1(State[3]), .A2(n111), .ZN(n102) );
  AOI21_X1 U112 ( .B1(n103), .B2(n76), .A(n91), .ZN(n147) );
  NOR4_X1 U113 ( .A1(n99), .A2(State[2]), .A3(State[0]), .A4(State[1]), .ZN(
        n103) );
  NAND3_X1 U114 ( .A1(State[5]), .A2(n94), .A3(ten), .ZN(n99) );
  INV_X1 U115 ( .A(n99), .ZN(n97) );
  NAND4_X1 U116 ( .A1(n97), .A2(n69), .A3(n90), .A4(n64), .ZN(n137) );
  NAND3_X1 U117 ( .A1(n95), .A2(n94), .A3(n92), .ZN(n155) );
  NAND3_X1 U118 ( .A1(n111), .A2(n81), .A3(State[2]), .ZN(n119) );
  NAND4_X1 U119 ( .A1(n94), .A2(n111), .A3(n13), .A4(State[1]), .ZN(n118) );
  INV_X1 U120 ( .A(clear), .ZN(n141) );
  OAI221_X1 U121 ( .B1(n119), .B2(n155), .C1(n118), .C2(n117), .A(n141), .ZN(
        n98) );
  INV_X1 U122 ( .A(n98), .ZN(n113) );
  INV_X1 U123 ( .A(twenty), .ZN(n107) );
  NAND2_X1 U124 ( .A1(n147), .A2(n113), .ZN(n132) );
  NAND3_X1 U125 ( .A1(n95), .A2(State[4]), .A3(n66), .ZN(n121) );
  INV_X1 U126 ( .A(n121), .ZN(n106) );
  NAND3_X1 U127 ( .A1(n66), .A2(n94), .A3(State[3]), .ZN(n122) );
  INV_X1 U128 ( .A(n122), .ZN(n105) );
  INV_X1 U129 ( .A(ten), .ZN(n145) );
  NOR4_X1 U130 ( .A1(n52), .A2(State[2]), .A3(State[0]), .A4(n145), .ZN(n104)
         );
  AOI211_X1 U131 ( .C1(n145), .C2(n107), .A(n92), .B(State[5]), .ZN(n108) );
  NAND2_X1 U132 ( .A1(n67), .A2(n69), .ZN(n124) );
  NOR4_X1 U133 ( .A1(State[2]), .A2(State[0]), .A3(State[3]), .A4(State[1]), 
        .ZN(n109) );
  NAND4_X1 U134 ( .A1(n109), .A2(n85), .A3(n71), .A4(twenty), .ZN(n128) );
  NAND4_X1 U135 ( .A1(n128), .A2(n72), .A3(n124), .A4(n127), .ZN(n133) );
  NAND3_X1 U136 ( .A1(n89), .A2(n65), .A3(n55), .ZN(n115) );
  NAND2_X1 U137 ( .A1(ten), .A2(n62), .ZN(n125) );
  NAND3_X1 U138 ( .A1(n145), .A2(n74), .A3(n82), .ZN(n114) );
  NAND3_X1 U139 ( .A1(n115), .A2(n116), .A3(n114), .ZN(n45) );
  OAI211_X1 U140 ( .C1(n84), .C2(n119), .A(n157), .B(n141), .ZN(n146) );
  INV_X1 U141 ( .A(n137), .ZN(n120) );
  OAI33_X1 U142 ( .A1(n78), .A2(n14), .A3(n132), .B1(n93), .B2(n120), .B3(n128), .ZN(n46) );
  NAND2_X1 U143 ( .A1(n68), .A2(ten), .ZN(n136) );
  NAND3_X1 U144 ( .A1(n14), .A2(n86), .A3(n57), .ZN(n152) );
  INV_X1 U145 ( .A(n152), .ZN(n123) );
  NAND2_X1 U146 ( .A1(n122), .A2(n121), .ZN(n150) );
  INV_X1 U147 ( .A(n146), .ZN(n148) );
  OAI21_X1 U148 ( .B1(n83), .B2(n63), .A(n148), .ZN(n131) );
  AOI22_X1 U149 ( .A1(n127), .A2(n126), .B1(ready), .B2(n125), .ZN(n130) );
  NAND3_X1 U150 ( .A1(n137), .A2(n128), .A3(n61), .ZN(n129) );
  OAI33_X1 U151 ( .A1(n136), .A2(n79), .A3(n61), .B1(n131), .B2(n130), .B3(
        n129), .ZN(n48) );
  INV_X1 U152 ( .A(n73), .ZN(n143) );
  NAND2_X1 U153 ( .A1(n87), .A2(n141), .ZN(n142) );
  OAI33_X1 U154 ( .A1(n93), .A2(n145), .A3(n144), .B1(n143), .B2(n80), .B3(
        n142), .ZN(n47) );
  NAND3_X1 U155 ( .A1(n89), .A2(n56), .A3(n96), .ZN(n149) );
  NAND2_X1 U156 ( .A1(n149), .A2(n75), .ZN(n50) );
  INV_X1 U157 ( .A(n59), .ZN(n153) );
  NAND4_X1 U158 ( .A1(n80), .A2(n14), .A3(n64), .A4(n86), .ZN(n151) );
  NAND2_X1 U159 ( .A1(n85), .A2(n71), .ZN(n154) );
  OAI22_X1 U160 ( .A1(n153), .A2(n152), .B1(n151), .B2(n154), .ZN(bill) );
  INV_X1 U161 ( .A(n154), .ZN(n156) );
  NOR4_X1 U162 ( .A1(n14), .A2(n156), .A3(n84), .A4(n55), .ZN(return_sig) );
  INV_X1 U163 ( .A(n51), .ZN(dispense) );
endmodule

