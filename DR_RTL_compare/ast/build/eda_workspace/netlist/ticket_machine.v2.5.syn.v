/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:24:06 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N3, N4, N5, N6, N7, N8, N9, n8, n9, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95;
  wire   [5:0] State;
  assign bill = N9;

  DFF_X1 \State_reg[2]  ( .D(N5), .CK(clk), .Q(State[2]), .QN(n52) );
  DFF_X1 \State_reg[4]  ( .D(N7), .CK(clk), .Q(State[4]), .QN(n67) );
  DFF_X1 \State_reg[5]  ( .D(N8), .CK(clk), .Q(State[5]), .QN(n57) );
  DFF_X1 \State_reg[0]  ( .D(N3), .CK(clk), .Q(n46), .QN(n86) );
  DFF_X1 \State_reg[1]  ( .D(N4), .CK(clk), .Q(State[1]), .QN(n9) );
  DFF_X1 \State_reg[3]  ( .D(N6), .CK(clk), .Q(State[3]), .QN(n8) );
  CLKBUF_X1 U35 ( .A(n94), .Z(n30) );
  INV_X1 U36 ( .A(n46), .ZN(n31) );
  INV_X1 U37 ( .A(State[4]), .ZN(n32) );
  CLKBUF_X1 U38 ( .A(n52), .Z(n44) );
  AND2_X1 U39 ( .A1(n52), .A2(n57), .ZN(n33) );
  AND2_X1 U40 ( .A1(n88), .A2(n90), .ZN(n34) );
  BUF_X1 U41 ( .A(n38), .Z(n35) );
  CLKBUF_X1 U42 ( .A(n91), .Z(n36) );
  CLKBUF_X1 U43 ( .A(n63), .Z(n37) );
  OR2_X1 U44 ( .A1(State[3]), .A2(State[2]), .ZN(n68) );
  CLKBUF_X1 U45 ( .A(n8), .Z(n39) );
  AND2_X1 U46 ( .A1(n86), .A2(n9), .ZN(n38) );
  BUF_X1 U47 ( .A(State[1]), .Z(n47) );
  AND2_X1 U48 ( .A1(n86), .A2(n8), .ZN(n40) );
  INV_X1 U49 ( .A(State[1]), .ZN(n41) );
  AND4_X1 U50 ( .A1(n67), .A2(n41), .A3(n31), .A4(State[3]), .ZN(n42) );
  INV_X1 U51 ( .A(n54), .ZN(n43) );
  CLKBUF_X1 U52 ( .A(n93), .Z(n45) );
  AND4_X1 U53 ( .A1(n67), .A2(n46), .A3(n8), .A4(n9), .ZN(n59) );
  INV_X1 U54 ( .A(n67), .ZN(n48) );
  INV_X1 U55 ( .A(n74), .ZN(n61) );
  INV_X1 U56 ( .A(n78), .ZN(n60) );
  AND2_X1 U57 ( .A1(n57), .A2(n52), .ZN(n49) );
  NAND4_X1 U58 ( .A1(n62), .A2(State[5]), .A3(n35), .A4(n61), .ZN(n65) );
  NAND2_X1 U59 ( .A1(n63), .A2(n69), .ZN(n64) );
  AND3_X1 U60 ( .A1(n54), .A2(n38), .A3(State[5]), .ZN(n50) );
  NOR2_X1 U61 ( .A1(n68), .A2(n43), .ZN(n62) );
  CLKBUF_X1 U62 ( .A(n31), .Z(n51) );
  BUF_X1 U63 ( .A(n57), .Z(n53) );
  INV_X1 U64 ( .A(State[4]), .ZN(n54) );
  NOR4_X1 U65 ( .A1(n47), .A2(State[4]), .A3(State[3]), .A4(n86), .ZN(n55) );
  AND3_X1 U66 ( .A1(n53), .A2(n84), .A3(n59), .ZN(ready) );
  INV_X1 U67 ( .A(n37), .ZN(n58) );
  INV_X1 U68 ( .A(n93), .ZN(n63) );
  INV_X1 U69 ( .A(ten), .ZN(n88) );
  INV_X1 U70 ( .A(clear), .ZN(n90) );
  INV_X1 U71 ( .A(twenty), .ZN(n87) );
  NAND2_X1 U72 ( .A1(n34), .A2(n87), .ZN(n74) );
  NAND4_X1 U73 ( .A1(n32), .A2(n31), .A3(n41), .A4(State[3]), .ZN(n77) );
  INV_X1 U74 ( .A(State[2]), .ZN(n84) );
  NAND2_X1 U75 ( .A1(n53), .A2(n84), .ZN(n78) );
  NAND2_X1 U76 ( .A1(n42), .A2(n60), .ZN(n92) );
  NAND3_X1 U77 ( .A1(n53), .A2(n44), .A3(n55), .ZN(n73) );
  NAND2_X1 U78 ( .A1(ten), .A2(n90), .ZN(n79) );
  OAI22_X1 U79 ( .A1(n92), .A2(n74), .B1(n73), .B2(n79), .ZN(N6) );
  NAND2_X1 U80 ( .A1(twenty), .A2(n34), .ZN(n72) );
  NAND3_X1 U81 ( .A1(n42), .A2(n81), .A3(n60), .ZN(n66) );
  NAND2_X1 U82 ( .A1(n86), .A2(n8), .ZN(n75) );
  NAND4_X1 U83 ( .A1(n40), .A2(n41), .A3(n48), .A4(n33), .ZN(n93) );
  INV_X1 U84 ( .A(n79), .ZN(n69) );
  NAND3_X1 U85 ( .A1(n65), .A2(n66), .A3(n64), .ZN(N8) );
  INV_X1 U86 ( .A(n68), .ZN(n70) );
  NAND2_X1 U87 ( .A1(n50), .A2(n70), .ZN(n91) );
  NOR2_X1 U88 ( .A1(n91), .A2(n72), .ZN(N5) );
  NAND3_X1 U89 ( .A1(n50), .A2(n70), .A3(n69), .ZN(n71) );
  OAI21_X1 U90 ( .B1(n72), .B2(n45), .A(n71), .ZN(N4) );
  INV_X1 U91 ( .A(n72), .ZN(n81) );
  NAND3_X1 U92 ( .A1(n49), .A2(n48), .A3(n9), .ZN(n76) );
  OAI33_X1 U93 ( .A1(n77), .A2(n78), .A3(n79), .B1(n76), .B2(n75), .B3(n74), 
        .ZN(n80) );
  AOI21_X1 U94 ( .B1(ready), .B2(n81), .A(n80), .ZN(n82) );
  INV_X1 U95 ( .A(n82), .ZN(N7) );
  NOR4_X1 U96 ( .A1(State[2]), .A2(State[4]), .A3(State[5]), .A4(n9), .ZN(n83)
         );
  NAND3_X1 U97 ( .A1(n39), .A2(n51), .A3(n83), .ZN(n95) );
  NOR4_X1 U98 ( .A1(n47), .A2(n44), .A3(State[5]), .A4(State[4]), .ZN(n85) );
  NAND3_X1 U99 ( .A1(n39), .A2(n51), .A3(n85), .ZN(n94) );
  NAND3_X1 U100 ( .A1(ready), .A2(n87), .A3(n88), .ZN(n89) );
  NAND4_X1 U101 ( .A1(n89), .A2(n90), .A3(n94), .A4(n95), .ZN(N3) );
  NAND3_X1 U102 ( .A1(n58), .A2(n92), .A3(n36), .ZN(N9) );
  INV_X1 U103 ( .A(n30), .ZN(return_sig) );
  INV_X1 U104 ( .A(n95), .ZN(dispense) );
endmodule

