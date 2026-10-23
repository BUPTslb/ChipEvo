/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 13:15:10 2026
/////////////////////////////////////////////////////////////


module ticket_machine ( clk, clear, ten, twenty, ready, dispense, return_sig, 
        bill );
  input clk, clear, ten, twenty;
  output ready, dispense, return_sig, bill;
  wire   N30, N31, N32, N33, N34, N35, N36, n5, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55;
  wire   [5:0] State;
  assign return_sig = State[2];
  assign dispense = State[1];
  assign bill = N36;

  DFF_X1 \State_reg[3]  ( .D(N33), .CK(clk), .Q(State[3]), .QN(n5) );
  DFF_X1 \State_reg[4]  ( .D(N34), .CK(clk), .Q(State[4]), .QN(n31) );
  DFF_X1 \State_reg[0]  ( .D(N30), .CK(clk), .Q(State[0]), .QN(n51) );
  DFF_X1 \State_reg[5]  ( .D(N35), .CK(clk), .Q(State[5]), .QN(n49) );
  DFF_X2 \State_reg[1]  ( .D(N31), .CK(clk), .Q(State[1]) );
  DFF_X2 \State_reg[2]  ( .D(N32), .CK(clk), .Q(State[2]) );
  CLKBUF_X1 U26 ( .A(State[0]), .Z(ready) );
  AND3_X1 U27 ( .A1(n20), .A2(n31), .A3(n45), .ZN(N32) );
  AND3_X1 U28 ( .A1(n5), .A2(n28), .A3(n22), .ZN(n20) );
  BUF_X1 U29 ( .A(n5), .Z(n21) );
  AND2_X1 U30 ( .A1(twenty), .A2(n24), .ZN(n22) );
  AND2_X1 U31 ( .A1(n24), .A2(n41), .ZN(n23) );
  AND2_X1 U32 ( .A1(n39), .A2(n43), .ZN(n24) );
  BUF_X1 U33 ( .A(n49), .Z(n25) );
  INV_X1 U34 ( .A(State[0]), .ZN(n26) );
  CLKBUF_X1 U35 ( .A(n50), .Z(n27) );
  AND3_X1 U36 ( .A1(n5), .A2(State[5]), .A3(n23), .ZN(n35) );
  INV_X1 U37 ( .A(n49), .ZN(n28) );
  INV_X1 U38 ( .A(ready), .ZN(n30) );
  NAND4_X1 U39 ( .A1(n50), .A2(State[4]), .A3(n51), .A4(n22), .ZN(n55) );
  NAND4_X1 U40 ( .A1(n21), .A2(n51), .A3(n23), .A4(State[4]), .ZN(n33) );
  NAND2_X1 U41 ( .A1(n55), .A2(n54), .ZN(N31) );
  NOR2_X1 U42 ( .A1(State[3]), .A2(n49), .ZN(n53) );
  NAND2_X1 U43 ( .A1(n40), .A2(n22), .ZN(n34) );
  NAND4_X1 U44 ( .A1(n51), .A2(n52), .A3(n31), .A4(n53), .ZN(n54) );
  INV_X1 U45 ( .A(ten), .ZN(n39) );
  INV_X1 U46 ( .A(clear), .ZN(n43) );
  INV_X1 U47 ( .A(twenty), .ZN(n41) );
  INV_X1 U48 ( .A(n5), .ZN(n46) );
  INV_X1 U49 ( .A(State[0]), .ZN(n45) );
  NAND2_X1 U50 ( .A1(ten), .A2(n43), .ZN(n48) );
  INV_X1 U51 ( .A(n48), .ZN(n52) );
  NAND3_X1 U52 ( .A1(n45), .A2(n46), .A3(n52), .ZN(n32) );
  NAND3_X1 U53 ( .A1(n32), .A2(n33), .A3(n34), .ZN(N34) );
  NAND3_X1 U54 ( .A1(n26), .A2(n46), .A3(n22), .ZN(n38) );
  NAND4_X1 U55 ( .A1(n51), .A2(n21), .A3(n52), .A4(State[4]), .ZN(n37) );
  NAND3_X1 U56 ( .A1(n35), .A2(n31), .A3(n51), .ZN(n36) );
  NAND3_X1 U57 ( .A1(n36), .A2(n37), .A3(n38), .ZN(N35) );
  INV_X1 U58 ( .A(n51), .ZN(n40) );
  NAND3_X1 U59 ( .A1(n40), .A2(n41), .A3(n39), .ZN(n44) );
  INV_X1 U60 ( .A(State[3]), .ZN(n50) );
  NAND4_X1 U61 ( .A1(n45), .A2(n31), .A3(n50), .A4(n25), .ZN(n42) );
  NAND3_X1 U62 ( .A1(n42), .A2(n44), .A3(n43), .ZN(N30) );
  NAND3_X1 U63 ( .A1(n26), .A2(n23), .A3(n46), .ZN(n47) );
  OAI21_X1 U64 ( .B1(n30), .B2(n48), .A(n47), .ZN(N33) );
  NAND3_X1 U65 ( .A1(n31), .A2(n27), .A3(n25), .ZN(N36) );
endmodule

