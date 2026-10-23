/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:29:08 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   n1, n5, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101;
  wire   [5:0] State;
  wire   [5:0] state_next_selected;

  DFF_X1 \State_reg[5]  ( .D(state_next_selected[5]), .CK(clk), .Q(State[5]), 
        .QN(n1) );
  DFF_X1 \State_reg[3]  ( .D(state_next_selected[3]), .CK(clk), .Q(State[3]), 
        .QN(n72) );
  DFF_X1 \State_reg[4]  ( .D(state_next_selected[4]), .CK(clk), .Q(State[4]), 
        .QN(n73) );
  DFF_X1 \State_reg[0]  ( .D(state_next_selected[0]), .CK(clk), .Q(State[0]), 
        .QN(n88) );
  DFF_X1 \State_reg[1]  ( .D(state_next_selected[1]), .CK(clk), .Q(State[1]), 
        .QN(n95) );
  DFF_X1 \State_reg[2]  ( .D(state_next_selected[2]), .CK(clk), .Q(State[2]), 
        .QN(n5) );
  BUF_X1 U35 ( .A(State[0]), .Z(n34) );
  CLKBUF_X1 U36 ( .A(State[2]), .Z(n54) );
  CLKBUF_X1 U37 ( .A(n55), .Z(n32) );
  AND3_X2 U38 ( .A1(n73), .A2(n5), .A3(n95), .ZN(n33) );
  INV_X4 U39 ( .A(n33), .ZN(n75) );
  CLKBUF_X1 U40 ( .A(n73), .Z(n52) );
  BUF_X2 U41 ( .A(n5), .Z(n53) );
  INV_X1 U42 ( .A(clear), .ZN(n91) );
  AND2_X1 U43 ( .A1(n52), .A2(State[5]), .ZN(n35) );
  AND2_X1 U44 ( .A1(State[4]), .A2(n1), .ZN(n36) );
  AND2_X1 U45 ( .A1(ten), .A2(n91), .ZN(n37) );
  NAND2_X1 U46 ( .A1(n38), .A2(n39), .ZN(n56) );
  AND4_X1 U47 ( .A1(n53), .A2(n88), .A3(n55), .A4(n91), .ZN(n38) );
  AND2_X1 U48 ( .A1(n86), .A2(n85), .ZN(n39) );
  BUF_X1 U49 ( .A(n88), .Z(n65) );
  AND3_X2 U50 ( .A1(n66), .A2(n91), .A3(n53), .ZN(n43) );
  CLKBUF_X1 U51 ( .A(n1), .Z(n40) );
  CLKBUF_X1 U52 ( .A(n98), .Z(n41) );
  INV_X1 U53 ( .A(State[1]), .ZN(n42) );
  BUF_X1 U54 ( .A(State[4]), .Z(n44) );
  NAND3_X1 U55 ( .A1(n45), .A2(n46), .A3(n47), .ZN(state_next_selected[4]) );
  NAND4_X1 U56 ( .A1(n60), .A2(n91), .A3(n89), .A4(twenty), .ZN(n45) );
  NAND4_X1 U57 ( .A1(n60), .A2(n65), .A3(n61), .A4(n37), .ZN(n46) );
  NAND4_X1 U58 ( .A1(n40), .A2(n32), .A3(n44), .A4(n94), .ZN(n47) );
  CLKBUF_X1 U59 ( .A(n53), .Z(n48) );
  CLKBUF_X1 U60 ( .A(n101), .Z(n49) );
  INV_X1 U61 ( .A(n72), .ZN(n50) );
  BUF_X1 U62 ( .A(State[5]), .Z(n51) );
  OR2_X1 U63 ( .A1(State[4]), .A2(State[0]), .ZN(n98) );
  NAND3_X1 U64 ( .A1(n43), .A2(ten), .A3(n36), .ZN(n82) );
  INV_X1 U65 ( .A(State[1]), .ZN(n55) );
  NAND2_X1 U66 ( .A1(n87), .A2(n56), .ZN(state_next_selected[1]) );
  NAND3_X1 U67 ( .A1(n43), .A2(ten), .A3(n35), .ZN(n87) );
  NOR2_X1 U68 ( .A1(n52), .A2(n84), .ZN(n85) );
  NOR2_X1 U69 ( .A1(n1), .A2(n58), .ZN(n57) );
  AND3_X1 U70 ( .A1(n95), .A2(n73), .A3(n72), .ZN(n58) );
  AND4_X1 U71 ( .A1(n50), .A2(n1), .A3(n59), .A4(n65), .ZN(n81) );
  AND3_X1 U72 ( .A1(n95), .A2(n91), .A3(n5), .ZN(n59) );
  AND4_X1 U73 ( .A1(n52), .A2(n1), .A3(n53), .A4(n42), .ZN(n60) );
  NOR2_X1 U74 ( .A1(n51), .A2(State[3]), .ZN(n86) );
  INV_X1 U75 ( .A(n64), .ZN(n61) );
  NOR3_X1 U76 ( .A1(State[3]), .A2(State[5]), .A3(n88), .ZN(n62) );
  NAND3_X1 U77 ( .A1(n1), .A2(n72), .A3(State[0]), .ZN(n63) );
  INV_X1 U78 ( .A(State[3]), .ZN(n64) );
  AND3_X1 U79 ( .A1(n72), .A2(n88), .A3(n95), .ZN(n66) );
  NAND3_X1 U80 ( .A1(n66), .A2(n91), .A3(n53), .ZN(n79) );
  INV_X1 U81 ( .A(ten), .ZN(n92) );
  NAND2_X1 U82 ( .A1(twenty), .A2(n92), .ZN(n84) );
  NOR4_X1 U83 ( .A1(n79), .A2(n44), .A3(n1), .A4(n84), .ZN(
        state_next_selected[2]) );
  NAND4_X1 U84 ( .A1(n34), .A2(n64), .A3(n37), .A4(n1), .ZN(n70) );
  NOR3_X1 U85 ( .A1(State[1]), .A2(n54), .A3(ten), .ZN(n68) );
  NOR3_X1 U86 ( .A1(n98), .A2(clear), .A3(twenty), .ZN(n67) );
  NAND4_X1 U87 ( .A1(n67), .A2(n40), .A3(n68), .A4(n61), .ZN(n69) );
  OAI21_X1 U88 ( .B1(n75), .B2(n70), .A(n69), .ZN(state_next_selected[3]) );
  NOR3_X1 U89 ( .A1(State[0]), .A2(State[2]), .A3(clear), .ZN(n71) );
  OAI221_X1 U90 ( .B1(n51), .B2(n55), .C1(n63), .C2(State[4]), .A(n71), .ZN(
        n77) );
  OAI221_X1 U91 ( .B1(State[3]), .B2(n73), .C1(State[4]), .C2(n72), .A(n1), 
        .ZN(n74) );
  INV_X1 U92 ( .A(n74), .ZN(n96) );
  NAND2_X1 U93 ( .A1(n62), .A2(n33), .ZN(n101) );
  NOR2_X1 U94 ( .A1(twenty), .A2(ten), .ZN(n76) );
  OAI33_X1 U95 ( .A1(n96), .A2(n77), .A3(n57), .B1(n101), .B2(clear), .B3(n76), 
        .ZN(n78) );
  INV_X1 U96 ( .A(n78), .ZN(state_next_selected[0]) );
  INV_X1 U97 ( .A(twenty), .ZN(n90) );
  AOI211_X1 U98 ( .C1(n90), .C2(n1), .A(ten), .B(State[4]), .ZN(n80) );
  OAI221_X1 U99 ( .B1(n43), .B2(twenty), .C1(n81), .C2(n90), .A(n80), .ZN(n83)
         );
  NAND2_X1 U100 ( .A1(n83), .A2(n82), .ZN(state_next_selected[5]) );
  NOR3_X1 U101 ( .A1(ten), .A2(n65), .A3(State[3]), .ZN(n89) );
  NAND4_X1 U102 ( .A1(n72), .A2(n91), .A3(n90), .A4(n92), .ZN(n93) );
  NOR3_X1 U103 ( .A1(n93), .A2(n54), .A3(n34), .ZN(n94) );
  OAI211_X1 U104 ( .C1(n51), .C2(n32), .A(n65), .B(n48), .ZN(n97) );
  NOR3_X1 U105 ( .A1(n97), .A2(n57), .A3(n96), .ZN(bill) );
  INV_X1 U106 ( .A(n41), .ZN(n99) );
  NAND3_X1 U107 ( .A1(n40), .A2(n64), .A3(n99), .ZN(n100) );
  NOR3_X1 U108 ( .A1(n48), .A2(State[1]), .A3(n100), .ZN(return_sig) );
  NOR3_X1 U109 ( .A1(n32), .A2(n54), .A3(n100), .ZN(dispense) );
  INV_X1 U110 ( .A(n49), .ZN(ready) );
endmodule

