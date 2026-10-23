/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:38:37 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N16, N17, N18, N19, N20, N21, N22, n4, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94;
  wire   [5:0] State;
  assign bill = N22;

  DFF_X1 \State_reg[4]  ( .D(N20), .CK(clk), .Q(State[4]), .QN(n4) );
  DFF_X1 \State_reg[5]  ( .D(N21), .CK(clk), .Q(State[5]), .QN(n49) );
  DFF_X1 \State_reg[3]  ( .D(N19), .CK(clk), .Q(State[3]), .QN(n91) );
  DFF_X1 \State_reg[0]  ( .D(N16), .CK(clk), .Q(State[0]), .QN(n80) );
  DFF_X1 \State_reg[2]  ( .D(N18), .CK(clk), .Q(State[2]), .QN(n93) );
  DFF_X1 \State_reg[1]  ( .D(N17), .CK(clk), .Q(State[1]), .QN(n58) );
  AND2_X1 U33 ( .A1(n92), .A2(n91), .ZN(n29) );
  INV_X1 U34 ( .A(n52), .ZN(n30) );
  INV_X1 U35 ( .A(State[3]), .ZN(n31) );
  CLKBUF_X1 U36 ( .A(State[0]), .Z(n52) );
  AND2_X1 U37 ( .A1(n83), .A2(n86), .ZN(n32) );
  CLKBUF_X1 U38 ( .A(n92), .Z(n33) );
  CLKBUF_X1 U39 ( .A(n89), .Z(n34) );
  CLKBUF_X1 U40 ( .A(n90), .Z(n36) );
  INV_X1 U41 ( .A(n42), .ZN(n35) );
  CLKBUF_X1 U42 ( .A(n88), .Z(n37) );
  NAND2_X1 U43 ( .A1(n53), .A2(n38), .ZN(n71) );
  AND2_X1 U44 ( .A1(n50), .A2(n70), .ZN(n38) );
  INV_X1 U45 ( .A(State[2]), .ZN(n39) );
  INV_X1 U46 ( .A(n4), .ZN(n40) );
  INV_X1 U47 ( .A(State[1]), .ZN(n41) );
  AND4_X1 U48 ( .A1(State[0]), .A2(n4), .A3(n58), .A4(n91), .ZN(n53) );
  INV_X1 U49 ( .A(State[1]), .ZN(n42) );
  INV_X1 U50 ( .A(State[2]), .ZN(n43) );
  NAND2_X1 U51 ( .A1(n53), .A2(n44), .ZN(n77) );
  INV_X1 U52 ( .A(n63), .ZN(n44) );
  AND4_X1 U53 ( .A1(n46), .A2(n80), .A3(n58), .A4(State[3]), .ZN(n45) );
  BUF_X1 U54 ( .A(n4), .Z(n46) );
  NAND2_X1 U55 ( .A1(n43), .A2(n49), .ZN(n47) );
  NAND2_X1 U56 ( .A1(n81), .A2(n48), .ZN(n85) );
  INV_X1 U57 ( .A(n47), .ZN(n48) );
  AND4_X1 U58 ( .A1(State[0]), .A2(n4), .A3(n58), .A4(n91), .ZN(n69) );
  AND2_X1 U59 ( .A1(n49), .A2(n93), .ZN(n50) );
  AND2_X1 U60 ( .A1(n69), .A2(n50), .ZN(ready) );
  INV_X1 U61 ( .A(n78), .ZN(n65) );
  INV_X1 U62 ( .A(n75), .ZN(n66) );
  INV_X1 U63 ( .A(n74), .ZN(n67) );
  INV_X1 U64 ( .A(n68), .ZN(n70) );
  AND4_X1 U65 ( .A1(n58), .A2(State[5]), .A3(n80), .A4(n93), .ZN(n51) );
  INV_X1 U66 ( .A(ten), .ZN(n83) );
  INV_X1 U67 ( .A(clear), .ZN(n86) );
  NAND2_X1 U68 ( .A1(twenty), .A2(n32), .ZN(n68) );
  NAND4_X1 U69 ( .A1(n58), .A2(State[5]), .A3(n80), .A4(n93), .ZN(n60) );
  INV_X1 U70 ( .A(State[4]), .ZN(n92) );
  NAND2_X1 U71 ( .A1(n92), .A2(n91), .ZN(n59) );
  NAND2_X1 U72 ( .A1(n29), .A2(n51), .ZN(n89) );
  NOR2_X1 U73 ( .A1(n89), .A2(n68), .ZN(N18) );
  NAND4_X1 U74 ( .A1(n58), .A2(State[4]), .A3(n80), .A4(n91), .ZN(n64) );
  INV_X1 U75 ( .A(n64), .ZN(n55) );
  NAND2_X1 U76 ( .A1(n93), .A2(n49), .ZN(n63) );
  NAND2_X1 U77 ( .A1(n55), .A2(n66), .ZN(n88) );
  NAND2_X1 U78 ( .A1(ten), .A2(n86), .ZN(n76) );
  INV_X1 U79 ( .A(n76), .ZN(n56) );
  NAND3_X1 U80 ( .A1(n51), .A2(n29), .A3(n56), .ZN(n57) );
  OAI21_X1 U81 ( .B1(n88), .B2(n68), .A(n57), .ZN(N17) );
  NAND2_X1 U82 ( .A1(n93), .A2(n49), .ZN(n75) );
  NAND4_X1 U83 ( .A1(n46), .A2(n41), .A3(n80), .A4(State[3]), .ZN(n74) );
  NOR3_X1 U84 ( .A1(n74), .A2(n75), .A3(n68), .ZN(n62) );
  INV_X1 U85 ( .A(twenty), .ZN(n82) );
  NAND2_X1 U86 ( .A1(n32), .A2(n82), .ZN(n78) );
  OAI33_X1 U87 ( .A1(n76), .A2(n63), .A3(n64), .B1(n59), .B2(n60), .B3(n78), 
        .ZN(n61) );
  OR2_X1 U88 ( .A1(n61), .A2(n62), .ZN(N21) );
  NAND3_X1 U89 ( .A1(n55), .A2(n65), .A3(n66), .ZN(n73) );
  NAND3_X1 U90 ( .A1(n67), .A2(n56), .A3(n66), .ZN(n72) );
  NAND3_X1 U91 ( .A1(n72), .A2(n71), .A3(n73), .ZN(N20) );
  NAND2_X1 U92 ( .A1(n45), .A2(n44), .ZN(n90) );
  OAI22_X1 U93 ( .A1(n90), .A2(n78), .B1(n77), .B2(n76), .ZN(N19) );
  NOR3_X1 U94 ( .A1(n40), .A2(n39), .A3(State[1]), .ZN(n79) );
  NAND4_X1 U95 ( .A1(n79), .A2(n30), .A3(n31), .A4(n49), .ZN(n87) );
  NOR4_X1 U96 ( .A1(n42), .A2(State[3]), .A3(n40), .A4(State[0]), .ZN(n81) );
  NAND3_X1 U97 ( .A1(ready), .A2(n82), .A3(n83), .ZN(n84) );
  NAND4_X1 U98 ( .A1(n85), .A2(n84), .A3(n86), .A4(n87), .ZN(N16) );
  NAND3_X1 U99 ( .A1(n36), .A2(n34), .A3(n37), .ZN(N22) );
  NAND3_X1 U100 ( .A1(n33), .A2(n49), .A3(n31), .ZN(n94) );
  NOR4_X1 U101 ( .A1(n94), .A2(n35), .A3(n43), .A4(n52), .ZN(return_sig) );
  NOR4_X1 U102 ( .A1(n42), .A2(n52), .A3(State[2]), .A4(n94), .ZN(dispense) );
endmodule

