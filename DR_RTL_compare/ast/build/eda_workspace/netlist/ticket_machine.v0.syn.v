/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 10:33:32 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N17, N18, N19, N20, N21, n5, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74;
  wire   [5:0] State;

  DFF_X1 \State_reg[1]  ( .D(N17), .CK(clk), .QN(n64) );
  DFF_X1 \State_reg[2]  ( .D(N18), .CK(clk), .Q(State[2]), .QN(n71) );
  DFF_X1 \State_reg[3]  ( .D(N19), .CK(clk), .Q(State[3]), .QN(n47) );
  DFF_X1 \State_reg[0]  ( .D(n74), .CK(clk), .Q(State[0]), .QN(n65) );
  DFF_X1 \State_reg[4]  ( .D(N20), .CK(clk), .Q(State[4]), .QN(n5) );
  DFF_X1 \State_reg[5]  ( .D(N21), .CK(clk), .Q(State[5]), .QN(n62) );
  AND4_X2 U35 ( .A1(State[0]), .A2(n47), .A3(n5), .A4(n62), .ZN(n53) );
  AND2_X1 U36 ( .A1(n55), .A2(n49), .ZN(n29) );
  INV_X1 U37 ( .A(n34), .ZN(n30) );
  CLKBUF_X1 U38 ( .A(n48), .Z(n31) );
  CLKBUF_X1 U39 ( .A(n67), .Z(n32) );
  CLKBUF_X1 U40 ( .A(State[4]), .Z(n33) );
  CLKBUF_X1 U41 ( .A(n47), .Z(n34) );
  CLKBUF_X1 U42 ( .A(n62), .Z(n35) );
  CLKBUF_X1 U43 ( .A(State[0]), .Z(n36) );
  AND2_X1 U44 ( .A1(n64), .A2(n71), .ZN(n37) );
  OR2_X1 U45 ( .A1(n67), .A2(n59), .ZN(n38) );
  OR2_X1 U46 ( .A1(n58), .A2(n60), .ZN(n39) );
  OR2_X1 U47 ( .A1(n50), .A2(n61), .ZN(n40) );
  NAND3_X1 U48 ( .A1(n38), .A2(n40), .A3(n39), .ZN(N21) );
  NAND2_X1 U49 ( .A1(n53), .A2(n37), .ZN(n73) );
  NAND2_X1 U50 ( .A1(n41), .A2(n45), .ZN(n51) );
  AOI22_X1 U51 ( .A1(n43), .A2(n46), .B1(n44), .B2(n42), .ZN(n52) );
  AND4_X1 U52 ( .A1(n47), .A2(n62), .A3(n65), .A4(State[4]), .ZN(n41) );
  AND2_X1 U53 ( .A1(n71), .A2(n64), .ZN(n42) );
  AND4_X1 U54 ( .A1(State[3]), .A2(n62), .A3(n5), .A4(n65), .ZN(n43) );
  AND4_X1 U55 ( .A1(State[5]), .A2(n5), .A3(n47), .A4(n65), .ZN(n44) );
  AND2_X1 U56 ( .A1(n71), .A2(n64), .ZN(n45) );
  AND2_X1 U57 ( .A1(n71), .A2(n64), .ZN(n46) );
  INV_X1 U58 ( .A(twenty), .ZN(n54) );
  INV_X1 U59 ( .A(ten), .ZN(n55) );
  AOI21_X1 U60 ( .B1(n52), .B2(n58), .A(clear), .ZN(n57) );
  AOI21_X1 U61 ( .B1(n57), .B2(n48), .A(n56), .ZN(n74) );
  AOI211_X1 U62 ( .C1(n55), .C2(n54), .A(clear), .B(n73), .ZN(n56) );
  BUF_X1 U63 ( .A(n73), .Z(n48) );
  INV_X1 U64 ( .A(clear), .ZN(n49) );
  NAND2_X1 U65 ( .A1(twenty), .A2(n29), .ZN(n59) );
  NAND2_X1 U66 ( .A1(n44), .A2(n42), .ZN(n50) );
  NOR2_X1 U67 ( .A1(n50), .A2(n59), .ZN(N18) );
  NAND2_X1 U68 ( .A1(n41), .A2(n45), .ZN(n58) );
  NAND2_X1 U69 ( .A1(ten), .A2(n49), .ZN(n60) );
  OAI22_X1 U70 ( .A1(n51), .A2(n59), .B1(n50), .B2(n60), .ZN(N17) );
  NAND2_X1 U71 ( .A1(n43), .A2(n46), .ZN(n67) );
  NAND2_X1 U72 ( .A1(n29), .A2(n54), .ZN(n61) );
  OAI222_X1 U73 ( .A1(n67), .A2(n60), .B1(n48), .B2(n59), .C1(n61), .C2(n51), 
        .ZN(N20) );
  OAI22_X1 U74 ( .A1(n67), .A2(n61), .B1(n48), .B2(n60), .ZN(N19) );
  XOR2_X1 U75 ( .A(n35), .B(n33), .Z(n68) );
  NOR3_X1 U76 ( .A1(State[2]), .A2(n68), .A3(n30), .ZN(n63) );
  NAND3_X1 U77 ( .A1(n65), .A2(n64), .A3(n63), .ZN(n66) );
  NAND2_X1 U78 ( .A1(n32), .A2(n66), .ZN(bill) );
  NAND3_X1 U79 ( .A1(n64), .A2(n5), .A3(n34), .ZN(n70) );
  INV_X1 U80 ( .A(n68), .ZN(n69) );
  NOR4_X1 U81 ( .A1(n70), .A2(n71), .A3(n36), .A4(n69), .ZN(return_sig) );
  NAND3_X1 U82 ( .A1(n34), .A2(n35), .A3(n71), .ZN(n72) );
  NOR4_X1 U83 ( .A1(n72), .A2(n33), .A3(n64), .A4(n36), .ZN(dispense) );
  INV_X1 U84 ( .A(n31), .ZN(ready) );
endmodule

