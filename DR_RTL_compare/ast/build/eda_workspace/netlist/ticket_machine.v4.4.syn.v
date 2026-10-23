/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:54:05 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N3, N5, N9, n6, n8, n9, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n100, n101, n102, n103;
  wire   [5:0] State;
  assign bill = N9;

  DFF_X1 \State_reg[2]  ( .D(N5), .CK(clk), .Q(State[2]), .QN(n8) );
  DFF_X1 \State_reg[4]  ( .D(n103), .CK(clk), .Q(State[4]), .QN(n85) );
  DFF_X1 \State_reg[3]  ( .D(n100), .CK(clk), .Q(State[3]), .QN(n60) );
  DFF_X1 \State_reg[0]  ( .D(N3), .CK(clk), .Q(State[0]), .QN(n41) );
  DFF_X1 \State_reg[1]  ( .D(n102), .CK(clk), .Q(State[1]), .QN(n9) );
  DFF_X1 \State_reg[5]  ( .D(n101), .CK(clk), .Q(State[5]), .QN(n6) );
  BUF_X1 U33 ( .A(n8), .Z(n29) );
  BUF_X1 U34 ( .A(State[3]), .Z(n30) );
  BUF_X1 U35 ( .A(n59), .Z(n52) );
  AND2_X2 U36 ( .A1(n85), .A2(n9), .ZN(n31) );
  AND3_X1 U37 ( .A1(State[5]), .A2(n60), .A3(n41), .ZN(n32) );
  AND2_X1 U38 ( .A1(n34), .A2(n89), .ZN(n33) );
  AND2_X1 U39 ( .A1(n67), .A2(n76), .ZN(n34) );
  BUF_X1 U40 ( .A(n85), .Z(n57) );
  CLKBUF_X1 U41 ( .A(n94), .Z(n35) );
  INV_X1 U42 ( .A(n36), .ZN(n98) );
  AND3_X1 U43 ( .A1(State[0]), .A2(n60), .A3(n6), .ZN(n36) );
  INV_X1 U44 ( .A(State[4]), .ZN(n37) );
  INV_X1 U45 ( .A(n53), .ZN(n97) );
  AND2_X1 U46 ( .A1(n57), .A2(n60), .ZN(n38) );
  AND2_X1 U47 ( .A1(n60), .A2(n57), .ZN(n39) );
  AND2_X1 U48 ( .A1(n51), .A2(n41), .ZN(n40) );
  INV_X1 U49 ( .A(n37), .ZN(n42) );
  INV_X1 U50 ( .A(n38), .ZN(n43) );
  AND2_X1 U51 ( .A1(n6), .A2(n41), .ZN(n44) );
  AND2_X1 U52 ( .A1(n31), .A2(n47), .ZN(n45) );
  AND2_X1 U53 ( .A1(n31), .A2(n29), .ZN(n46) );
  AND2_X1 U54 ( .A1(n31), .A2(n47), .ZN(n54) );
  BUF_X1 U55 ( .A(n8), .Z(n47) );
  CLKBUF_X1 U56 ( .A(n60), .Z(n48) );
  AND2_X1 U57 ( .A1(n59), .A2(n41), .ZN(n49) );
  INV_X1 U58 ( .A(n40), .ZN(n50) );
  CLKBUF_X1 U59 ( .A(n6), .Z(n51) );
  BUF_X1 U60 ( .A(n9), .Z(n59) );
  CLKBUF_X1 U61 ( .A(n55), .Z(n53) );
  AND3_X1 U62 ( .A1(n58), .A2(n59), .A3(n8), .ZN(n55) );
  BUF_X1 U63 ( .A(n85), .Z(n58) );
  CLKBUF_X1 U64 ( .A(n91), .Z(n56) );
  INV_X1 U65 ( .A(State[2]), .ZN(n95) );
  INV_X1 U66 ( .A(clear), .ZN(n89) );
  NAND2_X1 U67 ( .A1(twenty), .A2(n89), .ZN(n75) );
  NAND2_X1 U68 ( .A1(n6), .A2(n8), .ZN(n73) );
  INV_X1 U69 ( .A(n73), .ZN(n61) );
  NAND4_X1 U70 ( .A1(n49), .A2(n48), .A3(n42), .A4(n61), .ZN(n91) );
  NAND2_X1 U71 ( .A1(ten), .A2(n89), .ZN(n71) );
  INV_X1 U72 ( .A(n71), .ZN(n81) );
  NAND3_X1 U73 ( .A1(State[5]), .A2(n60), .A3(n41), .ZN(n92) );
  NAND3_X1 U74 ( .A1(n45), .A2(n32), .A3(n81), .ZN(n62) );
  OAI21_X1 U75 ( .B1(n91), .B2(n75), .A(n62), .ZN(n102) );
  INV_X1 U76 ( .A(ten), .ZN(n76) );
  NOR3_X1 U77 ( .A1(State[1]), .A2(n76), .A3(State[0]), .ZN(n64) );
  NOR3_X1 U78 ( .A1(n37), .A2(clear), .A3(State[5]), .ZN(n63) );
  NAND4_X1 U79 ( .A1(n63), .A2(n64), .A3(n48), .A4(n95), .ZN(n70) );
  INV_X1 U80 ( .A(twenty), .ZN(n67) );
  NOR3_X1 U81 ( .A1(n67), .A2(State[5]), .A3(State[0]), .ZN(n66) );
  NOR4_X1 U82 ( .A1(State[1]), .A2(State[4]), .A3(clear), .A4(ten), .ZN(n65)
         );
  NAND4_X1 U83 ( .A1(n65), .A2(n95), .A3(n30), .A4(n66), .ZN(n69) );
  NAND3_X1 U84 ( .A1(n54), .A2(n32), .A3(n33), .ZN(n68) );
  NAND3_X1 U85 ( .A1(n70), .A2(n69), .A3(n68), .ZN(n101) );
  NAND2_X1 U86 ( .A1(n31), .A2(n29), .ZN(n94) );
  NOR3_X1 U87 ( .A1(n94), .A2(n92), .A3(n75), .ZN(N5) );
  NOR3_X1 U88 ( .A1(n71), .A2(State[5]), .A3(State[0]), .ZN(n72) );
  NAND4_X1 U89 ( .A1(n30), .A2(n95), .A3(n72), .A4(n31), .ZN(n80) );
  NOR3_X1 U90 ( .A1(n73), .A2(n58), .A3(State[3]), .ZN(n74) );
  NAND3_X1 U91 ( .A1(n33), .A2(n49), .A3(n74), .ZN(n79) );
  INV_X1 U92 ( .A(n75), .ZN(n77) );
  NAND4_X1 U93 ( .A1(n55), .A2(n36), .A3(n76), .A4(n77), .ZN(n78) );
  NAND3_X1 U94 ( .A1(n78), .A2(n79), .A3(n80), .ZN(n103) );
  NAND4_X1 U95 ( .A1(n37), .A2(n29), .A3(n81), .A4(n52), .ZN(n84) );
  NAND3_X1 U96 ( .A1(n6), .A2(n41), .A3(State[3]), .ZN(n93) );
  INV_X1 U97 ( .A(n93), .ZN(n82) );
  NAND3_X1 U98 ( .A1(n46), .A2(n82), .A3(n33), .ZN(n83) );
  OAI21_X1 U99 ( .B1(n98), .B2(n84), .A(n83), .ZN(n100) );
  NAND4_X1 U100 ( .A1(n44), .A2(n39), .A3(n52), .A4(State[2]), .ZN(n90) );
  NAND2_X1 U101 ( .A1(n8), .A2(State[1]), .ZN(n96) );
  INV_X1 U102 ( .A(n96), .ZN(n86) );
  NAND3_X1 U103 ( .A1(n44), .A2(n38), .A3(n86), .ZN(n88) );
  NAND3_X1 U104 ( .A1(n55), .A2(n36), .A3(n34), .ZN(n87) );
  NAND4_X1 U105 ( .A1(n87), .A2(n88), .A3(n90), .A4(n89), .ZN(N3) );
  OAI221_X1 U106 ( .B1(n35), .B2(n93), .C1(n35), .C2(n92), .A(n56), .ZN(N9) );
  NOR4_X1 U107 ( .A1(n50), .A2(n43), .A3(n95), .A4(State[1]), .ZN(return_sig)
         );
  NOR3_X1 U108 ( .A1(n50), .A2(n43), .A3(n96), .ZN(dispense) );
  NOR2_X1 U109 ( .A1(n98), .A2(n97), .ZN(ready) );
endmodule

