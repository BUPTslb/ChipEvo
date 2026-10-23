/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 12:02:33 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N8, N9, N10, N11, N12, N13, n6, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74;
  wire   [5:0] State;
  assign bill = N13;

  DFF_X1 \State_reg[2]  ( .D(N9), .CK(clk), .Q(State[2]), .QN(n6) );
  DFF_X1 \State_reg[0]  ( .D(n74), .CK(clk), .Q(State[0]), .QN(n41) );
  DFF_X1 \State_reg[4]  ( .D(N11), .CK(clk), .Q(State[4]), .QN(n38) );
  DFF_X1 \State_reg[1]  ( .D(N8), .CK(clk), .Q(State[1]), .QN(n51) );
  DFF_X1 \State_reg[3]  ( .D(N10), .CK(clk), .Q(State[3]), .QN(n70) );
  DFF_X1 \State_reg[5]  ( .D(N12), .CK(clk), .Q(State[5]), .QN(n71) );
  BUF_X1 U34 ( .A(State[0]), .Z(n30) );
  INV_X1 U35 ( .A(State[0]), .ZN(n31) );
  AND2_X1 U36 ( .A1(n51), .A2(n41), .ZN(n32) );
  AND2_X1 U37 ( .A1(n38), .A2(n70), .ZN(n33) );
  AND2_X1 U38 ( .A1(n55), .A2(n60), .ZN(n34) );
  CLKBUF_X1 U39 ( .A(n42), .Z(n35) );
  INV_X1 U40 ( .A(State[5]), .ZN(n36) );
  CLKBUF_X1 U41 ( .A(State[2]), .Z(n37) );
  AND4_X1 U42 ( .A1(n31), .A2(n70), .A3(n60), .A4(State[4]), .ZN(n57) );
  NAND2_X1 U43 ( .A1(n33), .A2(n50), .ZN(n67) );
  AND3_X1 U44 ( .A1(n41), .A2(n70), .A3(State[4]), .ZN(n39) );
  AND3_X1 U45 ( .A1(n51), .A2(n71), .A3(n6), .ZN(n45) );
  INV_X1 U46 ( .A(State[1]), .ZN(n40) );
  INV_X1 U47 ( .A(n41), .ZN(n42) );
  CLKBUF_X1 U48 ( .A(n67), .Z(n43) );
  AND3_X2 U49 ( .A1(n51), .A2(n6), .A3(n71), .ZN(n46) );
  INV_X1 U50 ( .A(n42), .ZN(n44) );
  AND4_X1 U51 ( .A1(n31), .A2(State[3]), .A3(n60), .A4(n38), .ZN(n56) );
  NAND4_X1 U52 ( .A1(n45), .A2(n38), .A3(n42), .A4(n70), .ZN(n47) );
  NAND4_X1 U53 ( .A1(n38), .A2(n44), .A3(State[3]), .A4(n46), .ZN(n48) );
  NAND4_X1 U54 ( .A1(n46), .A2(n38), .A3(n70), .A4(n42), .ZN(n49) );
  NAND4_X1 U55 ( .A1(n45), .A2(n72), .A3(State[3]), .A4(n38), .ZN(n68) );
  INV_X1 U56 ( .A(ten), .ZN(n55) );
  INV_X1 U57 ( .A(clear), .ZN(n60) );
  NAND2_X1 U58 ( .A1(twenty), .A2(n34), .ZN(n53) );
  NAND2_X1 U59 ( .A1(n41), .A2(n51), .ZN(n58) );
  NOR3_X1 U60 ( .A1(n58), .A2(State[2]), .A3(n71), .ZN(n50) );
  INV_X1 U61 ( .A(twenty), .ZN(n54) );
  NAND2_X1 U62 ( .A1(n34), .A2(n54), .ZN(n66) );
  NAND2_X1 U63 ( .A1(ten), .A2(n60), .ZN(n65) );
  NAND2_X1 U64 ( .A1(n39), .A2(n46), .ZN(n52) );
  OAI222_X1 U65 ( .A1(n48), .A2(n53), .B1(n67), .B2(n66), .C1(n65), .C2(n52), 
        .ZN(N12) );
  NOR2_X1 U66 ( .A1(n67), .A2(n53), .ZN(N9) );
  OAI222_X1 U67 ( .A1(n66), .A2(n52), .B1(n68), .B2(n65), .C1(n47), .C2(n53), 
        .ZN(N11) );
  NAND2_X1 U68 ( .A1(n39), .A2(n46), .ZN(n69) );
  OAI22_X1 U69 ( .A1(n53), .A2(n69), .B1(n67), .B2(n65), .ZN(N8) );
  AOI21_X1 U70 ( .B1(n55), .B2(n54), .A(clear), .ZN(n64) );
  OAI21_X1 U71 ( .B1(n56), .B2(n57), .A(n46), .ZN(n62) );
  NOR3_X1 U72 ( .A1(State[3]), .A2(State[2]), .A3(State[4]), .ZN(n59) );
  NAND4_X1 U73 ( .A1(n59), .A2(n60), .A3(State[5]), .A4(n32), .ZN(n61) );
  NAND3_X1 U74 ( .A1(n62), .A2(n61), .A3(n47), .ZN(n63) );
  OAI21_X1 U75 ( .B1(n64), .B2(n49), .A(n63), .ZN(n74) );
  OAI22_X1 U76 ( .A1(n66), .A2(n68), .B1(n49), .B2(n65), .ZN(N10) );
  NAND3_X1 U77 ( .A1(n69), .A2(n48), .A3(n43), .ZN(N13) );
  NAND3_X1 U78 ( .A1(n36), .A2(n38), .A3(n70), .ZN(n73) );
  NOR4_X1 U79 ( .A1(n6), .A2(State[1]), .A3(n35), .A4(n73), .ZN(return_sig) );
  NOR4_X1 U80 ( .A1(n35), .A2(n37), .A3(n40), .A4(n73), .ZN(dispense) );
  INV_X1 U81 ( .A(n30), .ZN(n72) );
  NOR4_X1 U82 ( .A1(n73), .A2(State[1]), .A3(n44), .A4(n37), .ZN(ready) );
endmodule

