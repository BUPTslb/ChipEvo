/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 13:10:49 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   state_is_bill, n7, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114;
  wire   [5:0] State;
  wire   [2:0] clear_or_next_low;
  wire   [2:0] clear_or_next_high;
  assign bill = state_is_bill;

  DFF_X1 \State_reg[2]  ( .D(n114), .CK(clk), .Q(State[2]), .QN(n7) );
  DFF_X1 \State_reg[3]  ( .D(clear_or_next_high[0]), .CK(clk), .Q(State[3]), 
        .QN(n77) );
  DFF_X1 \State_reg[1]  ( .D(clear_or_next_low[1]), .CK(clk), .Q(State[1]), 
        .QN(n51) );
  DFF_X2 \State_reg[4]  ( .D(clear_or_next_high[1]), .CK(clk), .Q(State[4]), 
        .QN(n86) );
  DFF_X1 \State_reg[0]  ( .D(clear_or_next_low[0]), .CK(clk), .Q(State[0]), 
        .QN(n54) );
  DFF_X1 \State_reg[5]  ( .D(clear_or_next_high[2]), .CK(clk), .Q(State[5]), 
        .QN(n87) );
  BUF_X1 U41 ( .A(n56), .Z(n38) );
  AND2_X1 U42 ( .A1(n7), .A2(n82), .ZN(n39) );
  AND2_X1 U43 ( .A1(n7), .A2(n82), .ZN(n58) );
  CLKBUF_X1 U44 ( .A(n77), .Z(n47) );
  BUF_X1 U45 ( .A(n51), .Z(n40) );
  BUF_X1 U46 ( .A(n66), .Z(n41) );
  BUF_X1 U47 ( .A(n54), .Z(n66) );
  AND2_X1 U48 ( .A1(n54), .A2(n51), .ZN(n42) );
  AND2_X1 U49 ( .A1(n54), .A2(n51), .ZN(n62) );
  NOR2_X1 U50 ( .A1(n86), .A2(n46), .ZN(n43) );
  BUF_X1 U51 ( .A(n77), .Z(n46) );
  INV_X1 U52 ( .A(State[2]), .ZN(n44) );
  AND2_X1 U53 ( .A1(n87), .A2(n79), .ZN(n45) );
  NOR2_X1 U54 ( .A1(n45), .A2(n66), .ZN(n73) );
  BUF_X1 U55 ( .A(n77), .Z(n48) );
  INV_X1 U56 ( .A(n91), .ZN(n92) );
  AND2_X1 U57 ( .A1(n86), .A2(n48), .ZN(n49) );
  AND2_X1 U58 ( .A1(ten), .A2(n44), .ZN(n85) );
  INV_X1 U59 ( .A(State[1]), .ZN(n50) );
  NAND4_X1 U60 ( .A1(n88), .A2(n87), .A3(n86), .A4(n85), .ZN(n95) );
  CLKBUF_X1 U61 ( .A(State[0]), .Z(n60) );
  CLKBUF_X1 U62 ( .A(n43), .Z(n52) );
  INV_X1 U63 ( .A(n104), .ZN(n80) );
  AND3_X1 U64 ( .A1(n62), .A2(n47), .A3(n39), .ZN(n53) );
  CLKBUF_X1 U65 ( .A(State[1]), .Z(n65) );
  AND4_X1 U66 ( .A1(State[0]), .A2(n44), .A3(n86), .A4(n70), .ZN(n55) );
  NAND2_X1 U67 ( .A1(n105), .A2(n99), .ZN(n101) );
  BUF_X1 U68 ( .A(n87), .Z(n56) );
  INV_X1 U69 ( .A(n52), .ZN(n109) );
  NAND3_X1 U70 ( .A1(n50), .A2(n48), .A3(n82), .ZN(n57) );
  OAI22_X1 U71 ( .A1(n100), .A2(n99), .B1(n98), .B2(n99), .ZN(n108) );
  NOR2_X1 U72 ( .A1(n46), .A2(n86), .ZN(n59) );
  NOR3_X1 U73 ( .A1(State[1]), .A2(State[5]), .A3(State[0]), .ZN(n100) );
  NOR2_X1 U74 ( .A1(n83), .A2(State[1]), .ZN(n88) );
  AND3_X1 U75 ( .A1(State[3]), .A2(n44), .A3(n82), .ZN(n98) );
  BUF_X1 U76 ( .A(State[3]), .Z(n63) );
  INV_X1 U77 ( .A(n86), .ZN(n61) );
  OAI21_X1 U78 ( .B1(n107), .B2(n108), .A(n106), .ZN(clear_or_next_high[2]) );
  AOI21_X1 U79 ( .B1(n56), .B2(n99), .A(State[4]), .ZN(n103) );
  NAND4_X1 U80 ( .A1(n81), .A2(n41), .A3(n68), .A4(n80), .ZN(n96) );
  INV_X1 U81 ( .A(n65), .ZN(n64) );
  NOR2_X1 U82 ( .A1(n89), .A2(n79), .ZN(n81) );
  NAND2_X1 U83 ( .A1(n86), .A2(ten), .ZN(n69) );
  NAND3_X1 U84 ( .A1(n42), .A2(n48), .A3(n58), .ZN(n67) );
  INV_X1 U85 ( .A(n97), .ZN(n68) );
  INV_X1 U86 ( .A(State[5]), .ZN(n70) );
  INV_X1 U87 ( .A(clear), .ZN(n82) );
  NAND3_X1 U88 ( .A1(n62), .A2(n47), .A3(n58), .ZN(n105) );
  INV_X1 U89 ( .A(ten), .ZN(n102) );
  NAND2_X1 U90 ( .A1(twenty), .A2(n102), .ZN(n91) );
  NAND2_X1 U91 ( .A1(State[4]), .A2(n87), .ZN(n104) );
  OAI33_X1 U92 ( .A1(n70), .A2(n67), .A3(n69), .B1(n67), .B2(n91), .B3(n104), 
        .ZN(clear_or_next_low[1]) );
  NAND4_X1 U93 ( .A1(n66), .A2(n63), .A3(n70), .A4(n82), .ZN(n72) );
  INV_X1 U94 ( .A(State[2]), .ZN(n84) );
  INV_X1 U95 ( .A(twenty), .ZN(n99) );
  NAND4_X1 U96 ( .A1(n44), .A2(n99), .A3(n86), .A4(n40), .ZN(n71) );
  NAND4_X1 U97 ( .A1(State[0]), .A2(n84), .A3(n86), .A4(n87), .ZN(n90) );
  NAND3_X1 U98 ( .A1(n47), .A2(n82), .A3(n40), .ZN(n89) );
  OAI33_X1 U99 ( .A1(ten), .A2(n72), .A3(n71), .B1(n57), .B2(n90), .B3(n102), 
        .ZN(clear_or_next_high[0]) );
  NAND2_X1 U100 ( .A1(n102), .A2(n99), .ZN(n79) );
  INV_X1 U101 ( .A(n7), .ZN(n97) );
  NOR4_X1 U102 ( .A1(n73), .A2(clear), .A3(State[1]), .A4(n97), .ZN(n76) );
  OAI33_X1 U103 ( .A1(n61), .A2(n63), .A3(n43), .B1(n59), .B2(State[0]), .B3(
        State[5]), .ZN(n75) );
  NAND3_X1 U104 ( .A1(n41), .A2(n38), .A3(n49), .ZN(n74) );
  NAND3_X1 U105 ( .A1(n76), .A2(n74), .A3(n75), .ZN(clear_or_next_low[0]) );
  NAND4_X1 U106 ( .A1(n42), .A2(n48), .A3(n39), .A4(n86), .ZN(n78) );
  NOR4_X1 U107 ( .A1(n78), .A2(ten), .A3(n56), .A4(n99), .ZN(n114) );
  NAND3_X1 U108 ( .A1(State[3]), .A2(n54), .A3(n82), .ZN(n83) );
  INV_X1 U109 ( .A(n57), .ZN(n93) );
  NAND3_X1 U110 ( .A1(n93), .A2(n55), .A3(n92), .ZN(n94) );
  NAND3_X1 U111 ( .A1(n96), .A2(n95), .A3(n94), .ZN(clear_or_next_high[1]) );
  NAND3_X1 U112 ( .A1(n101), .A2(n102), .A3(n103), .ZN(n107) );
  NAND3_X1 U113 ( .A1(n80), .A2(n53), .A3(ten), .ZN(n106) );
  OAI211_X1 U114 ( .C1(n38), .C2(n49), .A(n68), .B(n109), .ZN(n110) );
  NAND2_X1 U115 ( .A1(n38), .A2(n49), .ZN(n111) );
  INV_X1 U116 ( .A(n111), .ZN(n112) );
  NOR4_X1 U117 ( .A1(n110), .A2(n65), .A3(n112), .A4(State[0]), .ZN(
        state_is_bill) );
  NOR4_X1 U118 ( .A1(n60), .A2(n68), .A3(n65), .A4(n111), .ZN(return_sig) );
  NAND2_X1 U119 ( .A1(n68), .A2(n112), .ZN(n113) );
  NOR3_X1 U120 ( .A1(n113), .A2(n64), .A3(n60), .ZN(dispense) );
  NOR3_X1 U121 ( .A1(n113), .A2(n65), .A3(n41), .ZN(ready) );
endmodule

