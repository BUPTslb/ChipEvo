/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:07:53 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N62, N63, N65, N66, n8, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107;
  wire   [5:0] State;
  assign bill = N66;

  DFF_X1 \State_reg[2]  ( .D(N62), .CK(clk), .Q(State[2]), .QN(n8) );
  DFF_X1 \State_reg[1]  ( .D(n105), .CK(clk), .Q(State[1]), .QN(n69) );
  DFF_X1 \State_reg[5]  ( .D(N65), .CK(clk), .Q(State[5]), .QN(n62) );
  DFF_X1 \State_reg[0]  ( .D(n106), .CK(clk), .Q(State[0]), .QN(n59) );
  DFF_X1 \State_reg[3]  ( .D(N63), .CK(clk), .Q(State[3]), .QN(n101) );
  DFF_X1 \State_reg[4]  ( .D(n107), .CK(clk), .Q(State[4]), .QN(n102) );
  AND4_X1 U47 ( .A1(n101), .A2(State[5]), .A3(n59), .A4(n69), .ZN(n43) );
  CLKBUF_X1 U48 ( .A(n96), .Z(n44) );
  CLKBUF_X1 U49 ( .A(n56), .Z(n45) );
  NAND2_X1 U50 ( .A1(n43), .A2(n46), .ZN(n77) );
  NOR2_X1 U51 ( .A1(n84), .A2(n76), .ZN(n46) );
  AOI21_X1 U52 ( .B1(n44), .B2(n97), .A(n95), .ZN(n106) );
  INV_X1 U53 ( .A(State[1]), .ZN(n47) );
  INV_X1 U54 ( .A(State[4]), .ZN(n48) );
  INV_X1 U55 ( .A(State[4]), .ZN(n49) );
  AND4_X1 U56 ( .A1(State[0]), .A2(n48), .A3(n101), .A4(n75), .ZN(n50) );
  INV_X1 U57 ( .A(State[3]), .ZN(n51) );
  INV_X1 U58 ( .A(State[3]), .ZN(n52) );
  INV_X1 U59 ( .A(n60), .ZN(n100) );
  AND3_X1 U60 ( .A1(n69), .A2(n8), .A3(n62), .ZN(n53) );
  INV_X1 U61 ( .A(State[2]), .ZN(n54) );
  CLKBUF_X1 U62 ( .A(State[0]), .Z(n61) );
  AND3_X1 U63 ( .A1(n57), .A2(State[3]), .A3(n102), .ZN(n55) );
  BUF_X1 U64 ( .A(n59), .Z(n57) );
  NOR2_X1 U65 ( .A1(n52), .A2(State[0]), .ZN(n91) );
  OR2_X1 U66 ( .A1(n84), .A2(n83), .ZN(n98) );
  NAND2_X1 U67 ( .A1(n58), .A2(n63), .ZN(n94) );
  NAND2_X1 U68 ( .A1(n65), .A2(n43), .ZN(n56) );
  AND4_X1 U69 ( .A1(State[0]), .A2(n102), .A3(n101), .A4(n75), .ZN(n58) );
  AOI21_X1 U70 ( .B1(n93), .B2(n92), .A(clear), .ZN(n97) );
  CLKBUF_X1 U71 ( .A(n64), .Z(n60) );
  AND4_X1 U72 ( .A1(n101), .A2(n53), .A3(State[4]), .A4(n59), .ZN(n64) );
  AOI22_X1 U73 ( .A1(n91), .A2(n49), .B1(n90), .B2(n51), .ZN(n93) );
  NOR2_X1 U74 ( .A1(n102), .A2(State[0]), .ZN(n90) );
  NAND2_X1 U75 ( .A1(n78), .A2(n77), .ZN(n105) );
  AND3_X1 U76 ( .A1(n69), .A2(n8), .A3(n62), .ZN(n63) );
  AOI21_X1 U77 ( .B1(n94), .B2(n98), .A(clear), .ZN(n95) );
  NAND4_X1 U78 ( .A1(n101), .A2(State[5]), .A3(n59), .A4(n69), .ZN(n83) );
  NAND2_X1 U79 ( .A1(n102), .A2(n8), .ZN(n84) );
  INV_X1 U80 ( .A(n84), .ZN(n65) );
  INV_X1 U81 ( .A(ten), .ZN(n67) );
  NAND2_X1 U82 ( .A1(twenty), .A2(n67), .ZN(n81) );
  NOR3_X1 U83 ( .A1(n56), .A2(clear), .A3(n81), .ZN(N62) );
  INV_X1 U84 ( .A(twenty), .ZN(n66) );
  NAND2_X1 U85 ( .A1(n67), .A2(n66), .ZN(n85) );
  NOR4_X1 U86 ( .A1(n49), .A2(State[0]), .A3(n85), .A4(State[3]), .ZN(n68) );
  INV_X1 U87 ( .A(n81), .ZN(n75) );
  AOI22_X1 U88 ( .A1(n96), .A2(n68), .B1(n50), .B2(n63), .ZN(n70) );
  INV_X1 U89 ( .A(clear), .ZN(n86) );
  NAND2_X1 U90 ( .A1(ten), .A2(n86), .ZN(n76) );
  NAND3_X1 U91 ( .A1(n57), .A2(State[3]), .A3(n102), .ZN(n79) );
  NAND3_X1 U92 ( .A1(n8), .A2(n69), .A3(n62), .ZN(n80) );
  INV_X1 U93 ( .A(n80), .ZN(n96) );
  NAND2_X1 U94 ( .A1(n55), .A2(n63), .ZN(n99) );
  OAI22_X1 U95 ( .A1(n70), .A2(clear), .B1(n99), .B2(n76), .ZN(n107) );
  NAND4_X1 U96 ( .A1(State[0]), .A2(n48), .A3(n51), .A4(ten), .ZN(n92) );
  INV_X1 U97 ( .A(n92), .ZN(n71) );
  NAND2_X1 U98 ( .A1(n71), .A2(n96), .ZN(n74) );
  INV_X1 U99 ( .A(n85), .ZN(n72) );
  NAND3_X1 U100 ( .A1(n55), .A2(n96), .A3(n72), .ZN(n73) );
  AOI21_X1 U101 ( .B1(n74), .B2(n73), .A(clear), .ZN(N63) );
  NAND3_X1 U102 ( .A1(n64), .A2(n86), .A3(n75), .ZN(n78) );
  NOR3_X1 U103 ( .A1(n81), .A2(n80), .A3(n79), .ZN(n88) );
  NAND3_X1 U104 ( .A1(n101), .A2(n59), .A3(ten), .ZN(n82) );
  OAI33_X1 U105 ( .A1(n85), .A2(n84), .A3(n83), .B1(n80), .B2(n82), .B3(n102), 
        .ZN(n87) );
  OAI21_X1 U106 ( .B1(n87), .B2(n88), .A(n86), .ZN(n89) );
  INV_X1 U107 ( .A(n89), .ZN(N65) );
  NAND3_X1 U108 ( .A1(n100), .A2(n99), .A3(n45), .ZN(N66) );
  NAND3_X1 U109 ( .A1(n62), .A2(n49), .A3(n52), .ZN(n104) );
  NOR4_X1 U110 ( .A1(n54), .A2(State[1]), .A3(n61), .A4(n104), .ZN(return_sig)
         );
  NOR4_X1 U111 ( .A1(n47), .A2(n61), .A3(State[2]), .A4(n104), .ZN(dispense)
         );
  INV_X1 U112 ( .A(n61), .ZN(n103) );
  NOR4_X1 U113 ( .A1(n104), .A2(State[2]), .A3(n103), .A4(State[1]), .ZN(ready) );
endmodule

