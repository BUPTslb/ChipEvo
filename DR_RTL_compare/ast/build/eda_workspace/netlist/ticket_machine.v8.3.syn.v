/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:52:07 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N9, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71;
  wire   [5:0] State_dup;
  wire   [5:0] clear_or_next;
  assign bill = N9;

  DFF_X1 \State_dup_reg[5]  ( .D(clear_or_next[5]), .CK(clk), .Q(n36), .QN(n43) );
  DFF_X1 \State_dup_reg[2]  ( .D(clear_or_next[2]), .CK(clk), .Q(State_dup[2]), 
        .QN(n42) );
  DFF_X1 \State_dup_reg[3]  ( .D(clear_or_next[3]), .CK(clk), .Q(State_dup[3]), 
        .QN(n66) );
  DFF_X1 \State_dup_reg[4]  ( .D(clear_or_next[4]), .CK(clk), .Q(State_dup[4]), 
        .QN(n67) );
  DFF_X1 \State_dup_reg[1]  ( .D(clear_or_next[1]), .CK(clk), .Q(n68), .QN(n47) );
  DFF_X1 \State_dup_reg[0]  ( .D(n71), .CK(clk), .Q(State_dup[0]), .QN(n45) );
  INV_X1 U33 ( .A(State_dup[2]), .ZN(n28) );
  CLKBUF_X1 U34 ( .A(n67), .Z(n29) );
  BUF_X1 U35 ( .A(n43), .Z(n30) );
  AND2_X1 U36 ( .A1(n61), .A2(n44), .ZN(n31) );
  CLKBUF_X1 U37 ( .A(n41), .Z(n32) );
  OR2_X1 U38 ( .A1(n58), .A2(n59), .ZN(n54) );
  BUF_X1 U39 ( .A(n66), .Z(n34) );
  INV_X1 U40 ( .A(n37), .ZN(n33) );
  BUF_X1 U41 ( .A(n47), .Z(n37) );
  AND2_X1 U42 ( .A1(n36), .A2(n67), .ZN(n48) );
  CLKBUF_X1 U43 ( .A(State_dup[0]), .Z(n35) );
  OR2_X1 U44 ( .A1(n58), .A2(n59), .ZN(n38) );
  OR2_X1 U45 ( .A1(n56), .A2(n57), .ZN(n39) );
  NAND3_X1 U46 ( .A1(n38), .A2(n39), .A3(n55), .ZN(N9) );
  AND3_X1 U47 ( .A1(State_dup[0]), .A2(n66), .A3(n67), .ZN(n46) );
  OR2_X1 U48 ( .A1(n56), .A2(n57), .ZN(n50) );
  NAND2_X1 U49 ( .A1(n61), .A2(n60), .ZN(n64) );
  NOR2_X1 U50 ( .A1(n41), .A2(clear), .ZN(n65) );
  NOR2_X1 U51 ( .A1(State_dup[0]), .A2(n68), .ZN(n49) );
  INV_X1 U52 ( .A(twenty), .ZN(n60) );
  INV_X1 U53 ( .A(ten), .ZN(n61) );
  NAND4_X1 U54 ( .A1(n49), .A2(n48), .A3(n34), .A4(n69), .ZN(n40) );
  NAND4_X1 U55 ( .A1(n49), .A2(n48), .A3(n34), .A4(n42), .ZN(n55) );
  NAND4_X1 U56 ( .A1(n46), .A2(n30), .A3(n28), .A4(n37), .ZN(n41) );
  AND3_X1 U57 ( .A1(N9), .A2(n62), .A3(n44), .ZN(n63) );
  AOI21_X1 U58 ( .B1(n65), .B2(n64), .A(n63), .ZN(n71) );
  NAND4_X1 U59 ( .A1(State_dup[3]), .A2(n67), .A3(n47), .A4(n45), .ZN(n58) );
  INV_X1 U60 ( .A(State_dup[2]), .ZN(n69) );
  NAND2_X1 U61 ( .A1(n42), .A2(n43), .ZN(n59) );
  INV_X1 U62 ( .A(clear), .ZN(n44) );
  NAND2_X1 U63 ( .A1(ten), .A2(n44), .ZN(n52) );
  NAND2_X1 U64 ( .A1(n31), .A2(n60), .ZN(n53) );
  NAND4_X1 U65 ( .A1(State_dup[4]), .A2(n66), .A3(n47), .A4(n45), .ZN(n56) );
  NAND2_X1 U66 ( .A1(n42), .A2(n43), .ZN(n57) );
  NAND4_X1 U67 ( .A1(n46), .A2(n30), .A3(n69), .A4(n37), .ZN(n62) );
  NAND2_X1 U68 ( .A1(twenty), .A2(n31), .ZN(n51) );
  OAI222_X1 U69 ( .A1(n54), .A2(n52), .B1(n53), .B2(n50), .C1(n62), .C2(n51), 
        .ZN(clear_or_next[4]) );
  OAI222_X1 U70 ( .A1(n52), .A2(n50), .B1(n54), .B2(n51), .C1(n40), .C2(n53), 
        .ZN(clear_or_next[5]) );
  OAI22_X1 U71 ( .A1(n51), .A2(n50), .B1(n40), .B2(n52), .ZN(clear_or_next[1])
         );
  NOR2_X1 U72 ( .A1(n40), .A2(n51), .ZN(clear_or_next[2]) );
  OAI22_X1 U73 ( .A1(n54), .A2(n53), .B1(n41), .B2(n52), .ZN(clear_or_next[3])
         );
  INV_X1 U74 ( .A(n32), .ZN(ready) );
  NAND3_X1 U75 ( .A1(n29), .A2(n30), .A3(n34), .ZN(n70) );
  NOR4_X1 U76 ( .A1(n70), .A2(n28), .A3(n35), .A4(n33), .ZN(return_sig) );
  NOR4_X1 U77 ( .A1(n35), .A2(n37), .A3(State_dup[2]), .A4(n70), .ZN(dispense)
         );
endmodule

