/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 11:21:39 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N9, N10, N11, N12, N13, N14, N15, n3, n4, n6, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68;
  wire   [5:0] State;
  assign bill = N15;

  DFF_X1 \State_reg[0]  ( .D(N9), .CK(clk), .Q(State[0]), .QN(n6) );
  DFF_X1 \State_reg[3]  ( .D(N12), .CK(clk), .Q(State[3]), .QN(n3) );
  DFF_X2 \State_reg[5]  ( .D(N14), .CK(clk), .Q(State[5]), .QN(n42) );
  DFF_X1 \State_reg[4]  ( .D(N13), .CK(clk), .Q(State[4]), .QN(n66) );
  DFF_X1 \State_reg[2]  ( .D(N11), .CK(clk), .Q(State[2]), .QN(n4) );
  DFF_X1 \State_reg[1]  ( .D(N10), .CK(clk), .Q(State[1]), .QN(n57) );
  AND2_X2 U27 ( .A1(n66), .A2(n3), .ZN(n41) );
  CLKBUF_X1 U28 ( .A(n31), .Z(n26) );
  BUF_X1 U29 ( .A(n39), .Z(n23) );
  BUF_X1 U30 ( .A(n66), .Z(n24) );
  INV_X1 U31 ( .A(State[1]), .ZN(n25) );
  CLKBUF_X1 U32 ( .A(n61), .Z(n27) );
  INV_X1 U33 ( .A(State[2]), .ZN(n28) );
  CLKBUF_X1 U34 ( .A(n63), .Z(n29) );
  AOI21_X1 U35 ( .B1(n52), .B2(n51), .A(n60), .ZN(N14) );
  INV_X1 U36 ( .A(State[4]), .ZN(n30) );
  BUF_X1 U37 ( .A(n6), .Z(n36) );
  AND2_X1 U38 ( .A1(n41), .A2(State[0]), .ZN(n31) );
  AND2_X1 U39 ( .A1(n6), .A2(n57), .ZN(n32) );
  NAND4_X1 U40 ( .A1(n41), .A2(State[0]), .A3(ten), .A4(n50), .ZN(n51) );
  CLKBUF_X1 U41 ( .A(n30), .Z(n33) );
  BUF_X1 U42 ( .A(n3), .Z(n34) );
  INV_X1 U43 ( .A(State[3]), .ZN(n35) );
  CLKBUF_X1 U44 ( .A(n57), .Z(n37) );
  NOR3_X1 U45 ( .A1(n44), .A2(n30), .A3(n58), .ZN(n49) );
  NOR3_X1 U46 ( .A1(n47), .A2(n35), .A3(n59), .ZN(n48) );
  AND2_X1 U47 ( .A1(n25), .A2(n36), .ZN(n38) );
  NAND3_X1 U48 ( .A1(n24), .A2(n34), .A3(n28), .ZN(n39) );
  BUF_X1 U49 ( .A(n6), .Z(n40) );
  NOR2_X1 U50 ( .A1(n49), .A2(n48), .ZN(n52) );
  OAI211_X1 U51 ( .C1(ten), .C2(twenty), .A(n56), .B(n31), .ZN(N9) );
  NOR2_X1 U52 ( .A1(n55), .A2(clear), .ZN(n56) );
  NAND2_X1 U53 ( .A1(n36), .A2(n66), .ZN(n47) );
  INV_X1 U54 ( .A(n26), .ZN(n43) );
  NAND2_X1 U55 ( .A1(n40), .A2(n3), .ZN(n44) );
  INV_X1 U56 ( .A(clear), .ZN(n45) );
  NAND2_X1 U57 ( .A1(ten), .A2(n45), .ZN(n58) );
  NAND2_X1 U58 ( .A1(twenty), .A2(n45), .ZN(n54) );
  INV_X1 U59 ( .A(n54), .ZN(n50) );
  INV_X1 U60 ( .A(ten), .ZN(n46) );
  NAND2_X1 U61 ( .A1(n50), .A2(n46), .ZN(n59) );
  NAND3_X1 U62 ( .A1(n57), .A2(n42), .A3(n4), .ZN(n55) );
  NAND3_X1 U63 ( .A1(n57), .A2(n42), .A3(n4), .ZN(n60) );
  NAND3_X1 U64 ( .A1(n65), .A2(n34), .A3(State[4]), .ZN(n64) );
  NAND3_X1 U65 ( .A1(n28), .A2(n35), .A3(n30), .ZN(n62) );
  NAND2_X1 U66 ( .A1(n32), .A2(State[5]), .ZN(n53) );
  OAI33_X1 U67 ( .A1(n60), .A2(n64), .A3(n54), .B1(n62), .B2(n53), .B3(n58), 
        .ZN(N10) );
  NAND2_X1 U68 ( .A1(State[5]), .A2(n38), .ZN(n61) );
  NOR3_X1 U69 ( .A1(n61), .A2(n39), .A3(n59), .ZN(N11) );
  NAND2_X1 U70 ( .A1(n41), .A2(State[0]), .ZN(n68) );
  NOR4_X1 U71 ( .A1(n68), .A2(n55), .A3(twenty), .A4(n58), .ZN(N12) );
  NAND3_X1 U72 ( .A1(n40), .A2(n24), .A3(State[3]), .ZN(n63) );
  OAI33_X1 U73 ( .A1(n60), .A2(n59), .A3(n68), .B1(n63), .B2(n55), .B3(n58), 
        .ZN(N13) );
  OAI222_X1 U74 ( .A1(n60), .A2(n64), .B1(n60), .B2(n29), .C1(n23), .C2(n27), 
        .ZN(N15) );
  INV_X1 U75 ( .A(State[0]), .ZN(n65) );
  NAND4_X1 U76 ( .A1(n42), .A2(n33), .A3(n65), .A4(n34), .ZN(n67) );
  NOR3_X1 U77 ( .A1(n28), .A2(State[1]), .A3(n67), .ZN(return_sig) );
  NOR3_X1 U78 ( .A1(n37), .A2(State[2]), .A3(n67), .ZN(dispense) );
  NOR2_X1 U79 ( .A1(n60), .A2(n43), .ZN(ready) );
endmodule

