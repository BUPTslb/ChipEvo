/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 07:10:41 2026
/////////////////////////////////////////////////////////////


module simple_spi_top ( clk_i, rst_i, cyc_i, stb_i, adr_i, we_i, dat_i, dat_o, 
        ack_o, inta_o, sck_o, mosi_o, miso_i );
  input [1:0] adr_i;
  input [7:0] dat_i;
  output [7:0] dat_o;
  input clk_i, rst_i, cyc_i, stb_i, we_i, miso_i;
  output ack_o, inta_o, sck_o, mosi_o;
  wire   spsr_7, spsr_6, N64, N65, N66, N67, N69, N70, N71, rfre, N73, N76,
         N78, N79, rfwe, wfre, N82, N83, N84, N85, N86, N87, N88, N89, N90,
         N91, N92, N93, N120, N123, N125, N186, \tcnt[0] , n1, n3, n14, n15,
         n24, n26, n27, n28, n31, n32, n33, n47, n48, n51, n52, n53, n54, n55,
         n57, n58, n61, n62, n162, n163, n165, n172, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         \rfifo/n57 , \rfifo/n56 , \rfifo/n55 , \rfifo/n54 , \rfifo/n53 ,
         \rfifo/n52 , \rfifo/n51 , \rfifo/n50 , \rfifo/n49 , \rfifo/n48 ,
         \rfifo/n47 , \rfifo/n46 , \rfifo/n45 , \rfifo/n44 , \rfifo/n43 ,
         \rfifo/n42 , \rfifo/n41 , \rfifo/n40 , \rfifo/n39 , \rfifo/n38 ,
         \rfifo/n37 , \rfifo/n36 , \rfifo/n35 , \rfifo/n34 , \rfifo/n33 ,
         \rfifo/n32 , \rfifo/n31 , \rfifo/n30 , \rfifo/n29 , \rfifo/n28 ,
         \rfifo/n27 , \rfifo/n26 , \rfifo/n25 , \rfifo/n24 , \rfifo/n23 ,
         \rfifo/n22 , \rfifo/n21 , \rfifo/n20 , \rfifo/n19 , \rfifo/n18 ,
         \rfifo/n17 , \rfifo/n16 , \rfifo/n15 , \rfifo/n14 , \rfifo/n13 ,
         \rfifo/n12 , \rfifo/n10 , \rfifo/n9 , \rfifo/n8 , \rfifo/n7 ,
         \rfifo/n5 , \rfifo/n4 , \rfifo/n3 , \rfifo/n2 , \rfifo/n1 ,
         \rfifo/n108 , \rfifo/n107 , \rfifo/n106 , \rfifo/n105 , \rfifo/n104 ,
         \rfifo/n103 , \rfifo/n102 , \rfifo/n101 , \rfifo/n100 , \rfifo/n99 ,
         \rfifo/n98 , \rfifo/n97 , \rfifo/n96 , \rfifo/n95 , \rfifo/n94 ,
         \rfifo/n93 , \rfifo/n92 , \rfifo/n91 , \rfifo/n90 , \rfifo/n89 ,
         \rfifo/n88 , \rfifo/n87 , \rfifo/n86 , \rfifo/n85 , \rfifo/n84 ,
         \rfifo/n83 , \rfifo/n82 , \rfifo/n81 , \rfifo/n80 , \rfifo/n79 ,
         \rfifo/n78 , \rfifo/n77 , \rfifo/n76 , \rfifo/n75 , \rfifo/n74 ,
         \rfifo/n73 , \rfifo/n72 , \rfifo/n11 , \rfifo/n6 , \rfifo/mem[0][8] ,
         \rfifo/mem[0][7] , \rfifo/mem[0][6] , \rfifo/mem[0][5] ,
         \rfifo/mem[0][4] , \rfifo/mem[0][3] , \rfifo/mem[0][2] ,
         \rfifo/mem[0][1] , \rfifo/mem[1][8] , \rfifo/mem[1][7] ,
         \rfifo/mem[1][6] , \rfifo/mem[1][5] , \rfifo/mem[1][4] ,
         \rfifo/mem[1][3] , \rfifo/mem[1][2] , \rfifo/mem[1][1] ,
         \rfifo/mem[2][8] , \rfifo/mem[2][7] , \rfifo/mem[2][6] ,
         \rfifo/mem[2][5] , \rfifo/mem[2][4] , \rfifo/mem[2][3] ,
         \rfifo/mem[2][2] , \rfifo/mem[2][1] , \rfifo/mem[3][8] ,
         \rfifo/mem[3][7] , \rfifo/mem[3][6] , \rfifo/mem[3][5] ,
         \rfifo/mem[3][4] , \rfifo/mem[3][3] , \rfifo/mem[3][2] ,
         \rfifo/mem[3][1] , \rfifo/N9 , \rfifo/N8 , \wfifo/n139 , \wfifo/n138 ,
         \wfifo/n137 , \wfifo/n136 , \wfifo/n135 , \wfifo/n134 , \wfifo/n133 ,
         \wfifo/n132 , \wfifo/n131 , \wfifo/n130 , \wfifo/n129 , \wfifo/n128 ,
         \wfifo/n127 , \wfifo/n126 , \wfifo/n125 , \wfifo/n124 , \wfifo/n123 ,
         \wfifo/n122 , \wfifo/n121 , \wfifo/n120 , \wfifo/n119 , \wfifo/n118 ,
         \wfifo/n117 , \wfifo/n116 , \wfifo/n115 , \wfifo/n114 , \wfifo/n113 ,
         \wfifo/n112 , \wfifo/n111 , \wfifo/n110 , \wfifo/n109 , \wfifo/n108 ,
         \wfifo/n107 , \wfifo/n106 , \wfifo/n105 , \wfifo/n104 , \wfifo/n71 ,
         \wfifo/n70 , \wfifo/n69 , \wfifo/n68 , \wfifo/n67 , \wfifo/n66 ,
         \wfifo/n65 , \wfifo/n64 , \wfifo/n63 , \wfifo/n62 , \wfifo/n61 ,
         \wfifo/n60 , \wfifo/n59 , \wfifo/n58 , \wfifo/n57 , \wfifo/n56 ,
         \wfifo/n55 , \wfifo/n54 , \wfifo/n53 , \wfifo/n52 , \wfifo/n51 ,
         \wfifo/n50 , \wfifo/n49 , \wfifo/n48 , \wfifo/n47 , \wfifo/n46 ,
         \wfifo/n45 , \wfifo/n44 , \wfifo/n43 , \wfifo/n42 , \wfifo/n41 ,
         \wfifo/n40 , \wfifo/n39 , \wfifo/n38 , \wfifo/n37 , \wfifo/n36 ,
         \wfifo/n35 , \wfifo/n34 , \wfifo/n33 , \wfifo/n32 , \wfifo/n31 ,
         \wfifo/n30 , \wfifo/n29 , \wfifo/n28 , \wfifo/n27 , \wfifo/n26 ,
         \wfifo/n25 , \wfifo/n24 , \wfifo/n23 , \wfifo/n22 , \wfifo/n21 ,
         \wfifo/n20 , \wfifo/n19 , \wfifo/n18 , \wfifo/n17 , \wfifo/n16 ,
         \wfifo/n15 , \wfifo/n14 , \wfifo/n13 , \wfifo/n12 , \wfifo/n9 ,
         \wfifo/n7 , \wfifo/n5 , \wfifo/n4 , \wfifo/n3 , \wfifo/n2 ,
         \wfifo/n1 , \wfifo/mem[0][8] , \wfifo/mem[0][7] , \wfifo/mem[0][6] ,
         \wfifo/mem[0][5] , \wfifo/mem[0][4] , \wfifo/mem[0][3] ,
         \wfifo/mem[0][2] , \wfifo/mem[0][1] , \wfifo/mem[1][8] ,
         \wfifo/mem[1][7] , \wfifo/mem[1][6] , \wfifo/mem[1][5] ,
         \wfifo/mem[1][4] , \wfifo/mem[1][3] , \wfifo/mem[1][2] ,
         \wfifo/mem[1][1] , \wfifo/mem[2][8] , \wfifo/mem[2][7] ,
         \wfifo/mem[2][6] , \wfifo/mem[2][5] , \wfifo/mem[2][4] ,
         \wfifo/mem[2][3] , \wfifo/mem[2][2] , \wfifo/mem[2][1] ,
         \wfifo/mem[3][8] , \wfifo/mem[3][7] , \wfifo/mem[3][6] ,
         \wfifo/mem[3][5] , \wfifo/mem[3][4] , \wfifo/mem[3][3] ,
         \wfifo/mem[3][2] , \wfifo/mem[3][1] , \wfifo/N9 , \wfifo/N8 ,
         \sub_237/n58 , \sub_237/n57 , \sub_237/n56 , \sub_237/n55 ,
         \sub_237/n54 , \sub_237/n53 , \sub_237/n52 , \sub_237/n51 ,
         \sub_237/n50 , \sub_237/n49 , \sub_237/n48 , \sub_237/n47 ,
         \sub_237/n46 , \sub_237/n45 , \sub_237/n44 , \sub_237/n43 ,
         \sub_237/n42 , \sub_237/n41 , \sub_237/n40 , \sub_237/n39 ,
         \sub_237/n38 , \sub_237/n37 , \sub_237/n36 , \sub_237/n35 ,
         \sub_237/n34 , \sub_237/n33 , \sub_237/n32 , \sub_237/n31 ,
         \sub_237/n30 , \sub_237/n29 , \sub_237/n28 , \sub_237/n27 ,
         \sub_237/n26 , \sub_237/n25 , \sub_237/n24 , \sub_237/n23 ,
         \sub_237/n22 , \sub_237/n21 , \sub_237/n20 , \sub_237/n19 ,
         \sub_237/n18 , \sub_237/n17 , \sub_237/n16 , \sub_237/n15 ,
         \sub_237/n14 , \sub_237/n13 , \sub_237/n12 , \sub_237/n11 ,
         \sub_237/n10 , \sub_237/n9 , \sub_237/n8 , \sub_237/n7 , \sub_237/n6 ,
         \sub_237/n5 , \sub_237/n4 , \sub_237/n3 , \sub_237/n2 , \sub_237/n59 
;
  wire   [7:0] spcr;
  wire   [7:0] sper;
  wire   [3:0] spsr;
  wire   [7:0] rfdout;
  wire   [6:0] treg;
  wire   [7:0] wfdout;
  wire   [11:0] clkcnt;
  wire   [1:0] state;
  wire   [2:0] bcnt;
  wire   [1:0] \rfifo/wp ;
  wire   [1:0] \wfifo/wp ;

  DFFR_X1 \sper_reg[7]  ( .D(n187), .CK(clk_i), .RN(rst_i), .Q(n378), .QN(n1)
         );
  DFFR_X1 \sper_reg[6]  ( .D(n186), .CK(clk_i), .RN(rst_i), .Q(n373) );
  DFFR_X1 ack_o_reg ( .D(N73), .CK(clk_i), .RN(rst_i), .Q(ack_o), .QN(n31) );
  DFF_X1 \clkcnt_reg[3]  ( .D(N120), .CK(clk_i), .Q(clkcnt[3]), .QN(n289) );
  DFF_X1 \clkcnt_reg[6]  ( .D(N123), .CK(clk_i), .Q(clkcnt[6]), .QN(n280) );
  DFF_X1 \bcnt_reg[0]  ( .D(n172), .CK(clk_i), .Q(bcnt[0]), .QN(n48) );
  DFF_X1 wfre_reg ( .D(n416), .CK(clk_i), .Q(wfre) );
  DFF_X1 \tcnt_reg[1]  ( .D(n162), .CK(clk_i), .QN(n61) );
  DFF_X1 inta_o_reg ( .D(N79), .CK(clk_i), .Q(inta_o) );
  DFFR_X1 \sper_reg[0]  ( .D(n183), .CK(clk_i), .RN(rst_i), .Q(sper[0]), .QN(
        n14) );
  DFFR_X1 \sper_reg[1]  ( .D(n184), .CK(clk_i), .RN(rst_i), .Q(sper[1]), .QN(
        n273) );
  DFFR_X1 \spcr_reg[6]  ( .D(n181), .CK(clk_i), .RN(rst_i), .Q(spcr[6]), .QN(
        n24) );
  DFFR_X1 \spcr_reg[1]  ( .D(n177), .CK(clk_i), .RN(rst_i), .Q(spcr[1]), .QN(
        n274) );
  SDFF_X1 \clkcnt_reg[7]  ( .D(sper[1]), .SI(N89), .SE(n190), .CK(clk_i), .Q(
        clkcnt[7]), .QN(n279) );
  SDFF_X1 \clkcnt_reg[2]  ( .D(N84), .SI(n295), .SE(n243), .CK(clk_i), .Q(
        clkcnt[2]), .QN(n287) );
  SDFF_X1 \clkcnt_reg[1]  ( .D(n297), .SI(N83), .SE(n303), .CK(clk_i), .Q(
        clkcnt[1]), .QN(n286) );
  MUX2_X1 \clkcnt_reg[4]/U3  ( .A(N86), .B(n216), .S(n243), .Z(n221) );
  DFF_X1 \clkcnt_reg[4]  ( .D(n221), .CK(clk_i), .Q(clkcnt[4]), .QN(n290) );
  DFF_X1 \clkcnt_reg[9]  ( .D(n220), .CK(clk_i), .Q(clkcnt[9]), .QN(n283) );
  MUX2_X1 \clkcnt_reg[10]/U3  ( .A(N92), .B(n302), .S(n243), .Z(n218) );
  DFF_X1 \clkcnt_reg[10]  ( .D(n218), .CK(clk_i), .Q(clkcnt[10]), .QN(n285) );
  DFF_X1 \clkcnt_reg[0]  ( .D(n217), .CK(clk_i), .Q(clkcnt[0]), .QN(n288) );
  DFFR_X1 \spcr_reg[0]  ( .D(n176), .CK(clk_i), .RN(rst_i), .Q(spcr[0]), .QN(
        n389) );
  DFF_X1 spif_reg ( .D(N76), .CK(clk_i), .Q(spsr_7), .QN(n32) );
  DFFR_X1 \spcr_reg[5]  ( .D(n180), .CK(clk_i), .RN(rst_i), .Q(n397), .QN(n26)
         );
  DFFR_X1 \sper_reg[5]  ( .D(n185), .CK(clk_i), .RN(rst_i), .Q(n396), .QN(n3)
         );
  DFFR_X1 \spcr_reg[7]  ( .D(n182), .CK(clk_i), .RN(rst_i), .Q(n408), .QN(n15)
         );
  DFFR_X1 \spcr_reg[3]  ( .D(n179), .CK(clk_i), .RN(rst_i), .Q(n361), .QN(n27)
         );
  DFFR_X1 \sper_reg[4]  ( .D(n420), .CK(clk_i), .RN(rst_i), .Q(sper[4]) );
  DFFR_X1 \sper_reg[3]  ( .D(n419), .CK(clk_i), .RN(rst_i), .Q(sper[3]), .QN(
        n395) );
  DFFR_X1 \sper_reg[2]  ( .D(n418), .CK(clk_i), .RN(rst_i), .Q(sper[2]), .QN(
        n393) );
  DFF_X1 \tcnt_reg[0]  ( .D(n163), .CK(clk_i), .Q(\tcnt[0] ), .QN(n62) );
  DFF_X1 \treg_reg[6]  ( .D(n165), .CK(clk_i), .Q(treg[6]), .QN(n352) );
  DFF_X1 \treg_reg[0]  ( .D(n211), .CK(clk_i), .Q(treg[0]), .QN(n55) );
  DFF_X1 \clkcnt_reg[5]  ( .D(n421), .CK(clk_i), .Q(clkcnt[5]), .QN(n281) );
  DFF_X1 \bcnt_reg[1]  ( .D(n225), .CK(clk_i), .Q(bcnt[1]), .QN(n47) );
  DFF_X1 sck_o_reg ( .D(n219), .CK(clk_i), .Q(sck_o), .QN(n358) );
  DFF_X1 \treg_reg[3]  ( .D(n226), .CK(clk_i), .Q(treg[3]), .QN(n52) );
  DFF_X1 \treg_reg[1]  ( .D(n224), .CK(clk_i), .Q(treg[1]), .QN(n54) );
  DFF_X1 \treg_reg[2]  ( .D(n227), .CK(clk_i), .Q(treg[2]), .QN(n53) );
  DFF_X1 \clkcnt_reg[8]  ( .D(N125), .CK(clk_i), .Q(clkcnt[8]), .QN(n284) );
  DFF_X1 \state_reg[1]  ( .D(n228), .CK(clk_i), .Q(state[1]), .QN(n57) );
  DFF_X1 \state_reg[0]  ( .D(n229), .CK(clk_i), .Q(state[0]), .QN(n58) );
  DFF_X1 \dat_o_reg[4]  ( .D(n248), .CK(clk_i), .Q(dat_o[4]) );
  DFF_X1 \dat_o_reg[6]  ( .D(N70), .CK(clk_i), .Q(dat_o[6]) );
  DFF_X1 \dat_o_reg[5]  ( .D(N69), .CK(clk_i), .Q(dat_o[5]) );
  DFF_X1 rfwe_reg ( .D(N186), .CK(clk_i), .Q(rfwe) );
  DFF_X1 \dat_o_reg[1]  ( .D(N65), .CK(clk_i), .Q(dat_o[1]) );
  DFF_X1 \dat_o_reg[7]  ( .D(N71), .CK(clk_i), .Q(dat_o[7]) );
  DFF_X1 \dat_o_reg[2]  ( .D(N66), .CK(clk_i), .Q(dat_o[2]) );
  DFF_X1 \dat_o_reg[0]  ( .D(N64), .CK(clk_i), .Q(dat_o[0]) );
  DFF_X1 \dat_o_reg[3]  ( .D(N67), .CK(clk_i), .Q(dat_o[3]) );
  DFF_X1 \treg_reg[5]  ( .D(n222), .CK(clk_i), .Q(treg[5]) );
  DFF_X1 \bcnt_reg[2]  ( .D(n415), .CK(clk_i), .Q(bcnt[2]) );
  DFF_X1 \treg_reg[7]  ( .D(n417), .CK(clk_i), .Q(mosi_o) );
  DFFR_X1 \spcr_reg[2]  ( .D(n178), .CK(clk_i), .RN(rst_i), .Q(spcr[2]), .QN(
        n28) );
  DFF_X1 \clkcnt_reg[11]  ( .D(n202), .CK(clk_i), .Q(clkcnt[11]), .QN(n256) );
  DFF_X2 wcol_reg ( .D(N78), .CK(clk_i), .Q(spsr_6), .QN(n33) );
  DFF_X1 \treg_reg[4]  ( .D(n223), .CK(clk_i), .Q(treg[4]), .QN(n51) );
  CLKBUF_X1 U186 ( .A(n247), .Z(n188) );
  INV_X1 U187 ( .A(spcr[6]), .ZN(n189) );
  INV_X1 U188 ( .A(spcr[6]), .ZN(n197) );
  AND2_X1 U189 ( .A1(n203), .A2(n244), .ZN(n190) );
  BUF_X1 U190 ( .A(n357), .Z(n191) );
  INV_X1 U191 ( .A(n24), .ZN(n192) );
  INV_X1 U192 ( .A(n57), .ZN(n193) );
  NOR4_X1 U193 ( .A1(n31), .A2(we_i), .A3(n332), .A4(n331), .ZN(rfre) );
  AND2_X1 U194 ( .A1(spcr[6]), .A2(n200), .ZN(n244) );
  AND2_X1 U195 ( .A1(n57), .A2(n58), .ZN(n194) );
  BUF_X1 U196 ( .A(spcr[6]), .Z(n251) );
  AND2_X1 U197 ( .A1(n385), .A2(n410), .ZN(n195) );
  AND2_X1 U198 ( .A1(n385), .A2(n409), .ZN(n196) );
  NAND2_X1 U199 ( .A1(n237), .A2(n234), .ZN(n198) );
  NAND2_X1 U200 ( .A1(n237), .A2(n234), .ZN(n351) );
  AND2_X1 U201 ( .A1(n317), .A2(n246), .ZN(n199) );
  AND2_X1 U202 ( .A1(n317), .A2(n246), .ZN(n241) );
  AND4_X2 U203 ( .A1(n238), .A2(n286), .A3(n256), .A4(n287), .ZN(n207) );
  NAND2_X1 U204 ( .A1(n57), .A2(n58), .ZN(n200) );
  NAND2_X1 U205 ( .A1(n246), .A2(n215), .ZN(n201) );
  AND2_X1 U206 ( .A1(n204), .A2(n267), .ZN(n239) );
  AND2_X1 U207 ( .A1(N93), .A2(n303), .ZN(n202) );
  NAND2_X1 U208 ( .A1(n207), .A2(n204), .ZN(n203) );
  BUF_X1 U209 ( .A(n296), .Z(n210) );
  AND4_X2 U210 ( .A1(n208), .A2(n280), .A3(n281), .A4(n279), .ZN(n204) );
  AND4_X1 U211 ( .A1(n254), .A2(n280), .A3(n281), .A4(n279), .ZN(n264) );
  AND2_X1 U212 ( .A1(n351), .A2(n246), .ZN(n205) );
  NAND2_X1 U213 ( .A1(n206), .A2(n237), .ZN(n276) );
  AND2_X1 U214 ( .A1(n269), .A2(n265), .ZN(n206) );
  AND4_X1 U215 ( .A1(n238), .A2(n286), .A3(n256), .A4(n287), .ZN(n269) );
  NOR3_X1 U216 ( .A1(n292), .A2(n299), .A3(spcr[1]), .ZN(n268) );
  AND3_X1 U217 ( .A1(n285), .A2(n284), .A3(n283), .ZN(n208) );
  MUX2_X1 U218 ( .A(n298), .B(N82), .S(n308), .Z(n217) );
  AND2_X1 U219 ( .A1(n276), .A2(n246), .ZN(n209) );
  INV_X1 U220 ( .A(spcr[1]), .ZN(n212) );
  AND2_X1 U221 ( .A1(n265), .A2(n251), .ZN(n213) );
  AND2_X2 U222 ( .A1(state[0]), .A2(state[1]), .ZN(n265) );
  AND4_X2 U223 ( .A1(n254), .A2(n280), .A3(n281), .A4(n279), .ZN(n237) );
  INV_X1 U224 ( .A(spcr[0]), .ZN(n214) );
  BUF_X1 U225 ( .A(n356), .Z(n215) );
  INV_X1 U226 ( .A(n210), .ZN(n216) );
  INV_X1 U227 ( .A(n304), .ZN(n220) );
  INV_X1 U228 ( .A(n346), .ZN(n222) );
  INV_X1 U229 ( .A(n344), .ZN(n223) );
  INV_X1 U230 ( .A(n338), .ZN(n224) );
  INV_X1 U231 ( .A(n342), .ZN(n226) );
  INV_X1 U232 ( .A(n340), .ZN(n227) );
  INV_X1 U233 ( .A(n24), .ZN(n230) );
  AND4_X1 U234 ( .A1(n294), .A2(n286), .A3(n256), .A4(n287), .ZN(n267) );
  AND4_X1 U235 ( .A1(n294), .A2(n286), .A3(n256), .A4(n287), .ZN(n234) );
  AND3_X1 U236 ( .A1(n283), .A2(n284), .A3(n285), .ZN(n231) );
  AND2_X2 U237 ( .A1(n200), .A2(n230), .ZN(n246) );
  NOR2_X1 U238 ( .A1(n58), .A2(state[1]), .ZN(n232) );
  NOR2_X1 U239 ( .A1(n233), .A2(n356), .ZN(n253) );
  NAND4_X1 U240 ( .A1(n231), .A2(n280), .A3(n281), .A4(n279), .ZN(n233) );
  NOR3_X1 U241 ( .A1(bcnt[1]), .A2(bcnt[2]), .A3(bcnt[0]), .ZN(n235) );
  AND3_X1 U242 ( .A1(n285), .A2(n284), .A3(n283), .ZN(n254) );
  AND2_X1 U243 ( .A1(n313), .A2(n244), .ZN(n236) );
  AND3_X1 U244 ( .A1(n290), .A2(n289), .A3(n288), .ZN(n238) );
  AOI21_X1 U245 ( .B1(n194), .B2(n363), .A(n311), .ZN(n240) );
  NAND2_X1 U246 ( .A1(n313), .A2(n244), .ZN(n242) );
  NAND2_X1 U247 ( .A1(n203), .A2(n244), .ZN(n243) );
  INV_X1 U248 ( .A(n332), .ZN(n411) );
  AND3_X1 U249 ( .A1(spcr[1]), .A2(sper[1]), .A3(n242), .ZN(n245) );
  OR2_X1 U250 ( .A1(n333), .A2(n48), .ZN(n321) );
  AND3_X2 U251 ( .A1(n330), .A2(n411), .A3(n385), .ZN(n247) );
  NAND3_X1 U252 ( .A1(n262), .A2(n263), .A3(n399), .ZN(n248) );
  OR2_X1 U253 ( .A1(n24), .A2(rfwe), .ZN(n380) );
  AND2_X1 U254 ( .A1(rfwe), .A2(n379), .ZN(n249) );
  BUF_X1 U255 ( .A(spcr[6]), .Z(n250) );
  CLKBUF_X1 U256 ( .A(n307), .Z(n252) );
  NAND2_X1 U257 ( .A1(n253), .A2(n207), .ZN(n317) );
  INV_X1 U258 ( .A(n292), .ZN(n255) );
  OR2_X1 U259 ( .A1(n400), .A2(n393), .ZN(n257) );
  OR2_X1 U260 ( .A1(n28), .A2(n399), .ZN(n258) );
  NAND3_X1 U261 ( .A1(n392), .A2(n258), .A3(n257), .ZN(N66) );
  OR2_X1 U262 ( .A1(n400), .A2(n395), .ZN(n259) );
  OR2_X1 U263 ( .A1(n27), .A2(n399), .ZN(n260) );
  NAND3_X1 U264 ( .A1(n394), .A2(n260), .A3(n259), .ZN(N67) );
  OR2_X1 U265 ( .A1(n212), .A2(n214), .ZN(n261) );
  OR2_X1 U266 ( .A1(n274), .A2(n389), .ZN(n301) );
  AND3_X1 U267 ( .A1(n288), .A2(n289), .A3(n290), .ZN(n294) );
  AND3_X1 U268 ( .A1(n316), .A2(n201), .A3(n321), .ZN(n319) );
  NAND2_X1 U269 ( .A1(rfdout[4]), .A2(n411), .ZN(n262) );
  NAND2_X1 U270 ( .A1(sper[4]), .A2(n410), .ZN(n263) );
  AND2_X1 U271 ( .A1(n246), .A2(n276), .ZN(n266) );
  CLKBUF_X1 U272 ( .A(spsr[2]), .Z(n270) );
  CLKBUF_X1 U273 ( .A(sper[0]), .Z(n271) );
  INV_X1 U274 ( .A(sper[1]), .ZN(n272) );
  AOI21_X1 U275 ( .B1(spcr[1]), .B2(n271), .A(n252), .ZN(n275) );
  NAND2_X1 U276 ( .A1(n246), .A2(n317), .ZN(n277) );
  NAND2_X1 U277 ( .A1(n246), .A2(n317), .ZN(n278) );
  AOI21_X1 U278 ( .B1(spcr[1]), .B2(n271), .A(n307), .ZN(n282) );
  INV_X1 U279 ( .A(n275), .ZN(n309) );
  NAND2_X1 U280 ( .A1(stb_i), .A2(cyc_i), .ZN(n331) );
  INV_X1 U281 ( .A(n331), .ZN(n291) );
  NAND2_X1 U282 ( .A1(we_i), .A2(n291), .ZN(n402) );
  INV_X1 U283 ( .A(n402), .ZN(n385) );
  INV_X1 U284 ( .A(adr_i[0]), .ZN(n329) );
  INV_X1 U285 ( .A(adr_i[1]), .ZN(n384) );
  NAND2_X1 U286 ( .A1(n329), .A2(n384), .ZN(n399) );
  INV_X1 U287 ( .A(n399), .ZN(n409) );
  MUX2_X1 U288 ( .A(n192), .B(dat_i[6]), .S(n196), .Z(n181) );
  INV_X1 U289 ( .A(n14), .ZN(n292) );
  NAND2_X1 U290 ( .A1(adr_i[1]), .A2(adr_i[0]), .ZN(n400) );
  INV_X1 U291 ( .A(n400), .ZN(n410) );
  MUX2_X1 U292 ( .A(n292), .B(dat_i[0]), .S(n195), .Z(n183) );
  MUX2_X1 U293 ( .A(spcr[1]), .B(dat_i[1]), .S(n196), .Z(n177) );
  MUX2_X1 U294 ( .A(spcr[0]), .B(dat_i[0]), .S(n196), .Z(n176) );
  MUX2_X1 U295 ( .A(sper[1]), .B(dat_i[1]), .S(n195), .Z(n184) );
  OAI21_X1 U296 ( .B1(n301), .B2(n14), .A(n273), .ZN(n307) );
  OAI21_X1 U297 ( .B1(spcr[0]), .B2(n255), .A(n282), .ZN(n299) );
  INV_X1 U298 ( .A(n299), .ZN(n296) );
  NAND2_X1 U299 ( .A1(n296), .A2(n261), .ZN(n300) );
  INV_X1 U300 ( .A(n300), .ZN(n293) );
  NAND2_X1 U301 ( .A1(n293), .A2(n255), .ZN(n295) );
  NAND2_X1 U302 ( .A1(n207), .A2(n204), .ZN(n313) );
  INV_X1 U303 ( .A(n242), .ZN(n308) );
  NAND3_X1 U304 ( .A1(n210), .A2(n255), .A3(n212), .ZN(n297) );
  INV_X1 U305 ( .A(n242), .ZN(n303) );
  NAND2_X1 U306 ( .A1(n268), .A2(n214), .ZN(n298) );
  MUX2_X1 U307 ( .A(n300), .B(N85), .S(n308), .Z(N120) );
  NOR2_X1 U308 ( .A1(n261), .A2(n273), .ZN(n302) );
  AOI21_X1 U309 ( .B1(N91), .B2(n303), .A(n245), .ZN(n304) );
  NOR2_X1 U310 ( .A1(n214), .A2(n272), .ZN(n305) );
  MUX2_X1 U311 ( .A(n305), .B(N90), .S(n236), .Z(n306) );
  OR2_X1 U312 ( .A1(n306), .A2(n245), .ZN(N125) );
  MUX2_X1 U313 ( .A(n252), .B(N88), .S(n236), .Z(N123) );
  MUX2_X1 U314 ( .A(n309), .B(N87), .S(n190), .Z(n421) );
  OR2_X1 U315 ( .A1(n193), .A2(n58), .ZN(n325) );
  NOR2_X1 U316 ( .A1(n189), .A2(n325), .ZN(n312) );
  INV_X1 U317 ( .A(spsr[2]), .ZN(n363) );
  NAND2_X1 U318 ( .A1(state[0]), .A2(state[1]), .ZN(n356) );
  OAI211_X1 U319 ( .C1(n265), .C2(n232), .A(n264), .B(n267), .ZN(n310) );
  OAI211_X1 U320 ( .C1(state[0]), .C2(n57), .A(n250), .B(n310), .ZN(n311) );
  AOI21_X1 U321 ( .B1(n194), .B2(n363), .A(n311), .ZN(n327) );
  MUX2_X1 U322 ( .A(n312), .B(n193), .S(n240), .Z(n228) );
  NAND2_X1 U323 ( .A1(n194), .A2(n251), .ZN(n334) );
  INV_X1 U324 ( .A(bcnt[0]), .ZN(n314) );
  NAND2_X1 U325 ( .A1(n265), .A2(n251), .ZN(n350) );
  NAND3_X1 U326 ( .A1(n239), .A2(n314), .A3(n213), .ZN(n315) );
  OAI211_X1 U327 ( .C1(n48), .C2(n277), .A(n315), .B(n334), .ZN(n172) );
  NAND2_X1 U328 ( .A1(n246), .A2(n351), .ZN(n316) );
  NAND2_X1 U329 ( .A1(n246), .A2(n215), .ZN(n320) );
  NAND2_X1 U330 ( .A1(n192), .A2(n265), .ZN(n333) );
  NAND2_X1 U331 ( .A1(n246), .A2(n276), .ZN(n349) );
  NAND4_X1 U332 ( .A1(n349), .A2(n48), .A3(n250), .A4(n47), .ZN(n318) );
  OAI211_X1 U333 ( .C1(n47), .C2(n319), .A(n318), .B(n334), .ZN(n225) );
  OAI211_X1 U334 ( .C1(n47), .C2(n333), .A(n320), .B(n321), .ZN(n322) );
  OAI21_X1 U335 ( .B1(n205), .B2(n322), .A(bcnt[2]), .ZN(n324) );
  OR3_X1 U336 ( .A1(bcnt[1]), .A2(bcnt[2]), .A3(bcnt[0]), .ZN(n357) );
  NAND3_X1 U337 ( .A1(n213), .A2(n239), .A3(n235), .ZN(n323) );
  NAND3_X1 U338 ( .A1(n324), .A2(n334), .A3(n323), .ZN(n415) );
  OAI21_X1 U339 ( .B1(n235), .B2(n356), .A(n325), .ZN(n359) );
  INV_X1 U340 ( .A(n359), .ZN(n326) );
  AOI21_X1 U341 ( .B1(n326), .B2(n200), .A(n189), .ZN(n328) );
  MUX2_X1 U342 ( .A(n328), .B(state[0]), .S(n327), .Z(n229) );
  NAND2_X1 U343 ( .A1(n194), .A2(n230), .ZN(n362) );
  NOR2_X1 U344 ( .A1(n270), .A2(n362), .ZN(n416) );
  NOR2_X1 U345 ( .A1(ack_o), .A2(n331), .ZN(N73) );
  NAND2_X1 U346 ( .A1(adr_i[1]), .A2(n329), .ZN(n332) );
  INV_X1 U347 ( .A(n31), .ZN(n330) );
  NOR3_X1 U348 ( .A1(n351), .A2(n191), .A3(n333), .ZN(N186) );
  NAND3_X1 U349 ( .A1(n213), .A2(n239), .A3(miso_i), .ZN(n336) );
  INV_X1 U350 ( .A(n334), .ZN(n354) );
  AOI22_X1 U351 ( .A1(wfdout[0]), .A2(n354), .B1(n241), .B2(treg[0]), .ZN(n335) );
  NAND2_X1 U352 ( .A1(n335), .A2(n336), .ZN(n211) );
  NOR3_X1 U353 ( .A1(n350), .A2(n55), .A3(n198), .ZN(n337) );
  AOI221_X1 U354 ( .B1(wfdout[1]), .B2(n354), .C1(n199), .C2(treg[1]), .A(n337), .ZN(n338) );
  NOR3_X1 U355 ( .A1(n351), .A2(n54), .A3(n350), .ZN(n339) );
  AOI221_X1 U356 ( .B1(wfdout[2]), .B2(n354), .C1(n209), .C2(treg[2]), .A(n339), .ZN(n340) );
  NOR3_X1 U357 ( .A1(n350), .A2(n53), .A3(n198), .ZN(n341) );
  AOI221_X1 U358 ( .B1(wfdout[3]), .B2(n354), .C1(n209), .C2(treg[3]), .A(n341), .ZN(n342) );
  NOR3_X1 U359 ( .A1(n350), .A2(n52), .A3(n198), .ZN(n343) );
  AOI221_X1 U360 ( .B1(wfdout[4]), .B2(n354), .C1(n199), .C2(treg[4]), .A(n343), .ZN(n344) );
  NOR3_X1 U361 ( .A1(n198), .A2(n51), .A3(n350), .ZN(n345) );
  AOI221_X1 U362 ( .B1(wfdout[5]), .B2(n354), .C1(n241), .C2(treg[5]), .A(n345), .ZN(n346) );
  NAND3_X1 U363 ( .A1(n239), .A2(treg[5]), .A3(n213), .ZN(n348) );
  NAND2_X1 U364 ( .A1(wfdout[6]), .A2(n364), .ZN(n347) );
  OAI211_X1 U365 ( .C1(n352), .C2(n349), .A(n348), .B(n347), .ZN(n165) );
  NOR3_X1 U366 ( .A1(n352), .A2(n198), .A3(n350), .ZN(n353) );
  AOI221_X1 U367 ( .B1(wfdout[7]), .B2(n364), .C1(n266), .C2(mosi_o), .A(n353), 
        .ZN(n355) );
  INV_X1 U368 ( .A(n355), .ZN(n417) );
  MUX2_X1 U369 ( .A(spcr[2]), .B(dat_i[2]), .S(n196), .Z(n178) );
  MUX2_X1 U370 ( .A(n361), .B(dat_i[3]), .S(n196), .Z(n179) );
  NAND2_X1 U371 ( .A1(n232), .A2(n239), .ZN(n370) );
  INV_X1 U372 ( .A(n370), .ZN(n369) );
  OAI22_X1 U373 ( .A1(spcr[2]), .A2(n200), .B1(n215), .B2(n357), .ZN(n360) );
  AOI22_X1 U374 ( .A1(n360), .A2(n361), .B1(n359), .B2(n358), .ZN(n367) );
  NAND4_X1 U375 ( .A1(n194), .A2(n361), .A3(n250), .A4(spsr[2]), .ZN(n366) );
  INV_X1 U376 ( .A(n362), .ZN(n364) );
  NAND4_X1 U377 ( .A1(n363), .A2(spcr[2]), .A3(n364), .A4(n358), .ZN(n365) );
  OAI211_X1 U378 ( .C1(n367), .C2(n189), .A(n365), .B(n366), .ZN(n368) );
  OAI21_X1 U379 ( .B1(n369), .B2(n278), .A(n368), .ZN(n372) );
  NAND3_X1 U380 ( .A1(n370), .A2(sck_o), .A3(n199), .ZN(n371) );
  NAND2_X1 U381 ( .A1(n372), .A2(n371), .ZN(n219) );
  MUX2_X1 U382 ( .A(n408), .B(dat_i[7]), .S(n196), .Z(n182) );
  MUX2_X1 U383 ( .A(n373), .B(dat_i[6]), .S(n195), .Z(n186) );
  NAND2_X1 U384 ( .A1(n61), .A2(n62), .ZN(n374) );
  INV_X1 U385 ( .A(n374), .ZN(n379) );
  OAI21_X1 U386 ( .B1(n189), .B2(n249), .A(n373), .ZN(n377) );
  NAND3_X1 U387 ( .A1(n374), .A2(n192), .A3(n380), .ZN(n375) );
  MUX2_X1 U388 ( .A(n380), .B(n375), .S(n62), .Z(n376) );
  NAND2_X1 U389 ( .A1(n377), .A2(n376), .ZN(n163) );
  MUX2_X1 U390 ( .A(n378), .B(dat_i[7]), .S(n195), .Z(n187) );
  AOI21_X1 U391 ( .B1(n379), .B2(n380), .A(n189), .ZN(n383) );
  INV_X1 U392 ( .A(n380), .ZN(n381) );
  AOI21_X1 U393 ( .B1(\tcnt[0] ), .B2(n192), .A(n381), .ZN(n382) );
  OAI22_X1 U394 ( .A1(n1), .A2(n383), .B1(n61), .B2(n382), .ZN(n162) );
  NAND2_X1 U395 ( .A1(adr_i[0]), .A2(n384), .ZN(n407) );
  INV_X1 U396 ( .A(n407), .ZN(n412) );
  NAND3_X1 U397 ( .A1(dat_i[7]), .A2(n385), .A3(n412), .ZN(n386) );
  OAI211_X1 U398 ( .C1(spsr_7), .C2(n249), .A(n386), .B(n192), .ZN(n387) );
  INV_X1 U399 ( .A(n387), .ZN(N76) );
  NOR2_X1 U400 ( .A1(n32), .A2(n15), .ZN(N79) );
  AOI22_X1 U401 ( .A1(spsr[0]), .A2(n412), .B1(rfdout[0]), .B2(n411), .ZN(n388) );
  OAI221_X1 U402 ( .B1(n255), .B2(n400), .C1(n399), .C2(n214), .A(n388), .ZN(
        N64) );
  AOI22_X1 U403 ( .A1(n410), .A2(sper[1]), .B1(spcr[1]), .B2(n409), .ZN(n391)
         );
  AOI22_X1 U404 ( .A1(spsr[1]), .A2(n412), .B1(rfdout[1]), .B2(n411), .ZN(n390) );
  NAND2_X1 U405 ( .A1(n390), .A2(n391), .ZN(N65) );
  MUX2_X1 U406 ( .A(sper[2]), .B(dat_i[2]), .S(n195), .Z(n418) );
  AOI22_X1 U407 ( .A1(n270), .A2(n412), .B1(rfdout[2]), .B2(n411), .ZN(n392)
         );
  MUX2_X1 U408 ( .A(sper[3]), .B(dat_i[3]), .S(n195), .Z(n419) );
  AOI22_X1 U409 ( .A1(spsr[3]), .A2(n412), .B1(rfdout[3]), .B2(n411), .ZN(n394) );
  MUX2_X1 U410 ( .A(sper[4]), .B(dat_i[4]), .S(n195), .Z(n420) );
  MUX2_X1 U411 ( .A(n396), .B(dat_i[5]), .S(n195), .Z(n185) );
  MUX2_X1 U412 ( .A(n397), .B(dat_i[5]), .S(n196), .Z(n180) );
  NAND2_X1 U413 ( .A1(rfdout[5]), .A2(n411), .ZN(n398) );
  OAI221_X1 U414 ( .B1(n3), .B2(n400), .C1(n26), .C2(n399), .A(n398), .ZN(N69)
         );
  INV_X1 U415 ( .A(dat_i[6]), .ZN(n401) );
  NOR2_X1 U416 ( .A1(n402), .A2(n401), .ZN(n404) );
  AOI21_X1 U417 ( .B1(n188), .B2(spsr[3]), .A(spsr_6), .ZN(n403) );
  AOI211_X1 U418 ( .C1(n404), .C2(n412), .A(n189), .B(n403), .ZN(N78) );
  NAND2_X1 U419 ( .A1(rfdout[6]), .A2(n411), .ZN(n406) );
  AOI22_X1 U420 ( .A1(n373), .A2(n410), .B1(n409), .B2(n251), .ZN(n405) );
  OAI211_X1 U421 ( .C1(n33), .C2(n407), .A(n406), .B(n405), .ZN(N70) );
  AOI22_X1 U422 ( .A1(n378), .A2(n410), .B1(n409), .B2(n408), .ZN(n414) );
  AOI22_X1 U423 ( .A1(n412), .A2(spsr_7), .B1(rfdout[7]), .B2(n411), .ZN(n413)
         );
  NAND2_X1 U424 ( .A1(n413), .A2(n414), .ZN(N71) );
  NOR2_X1 \rfifo/U100  ( .A1(\rfifo/n11 ), .A2(\rfifo/n57 ), .ZN(spsr[1]) );
  NOR2_X1 \rfifo/U99  ( .A1(\rfifo/n48 ), .A2(\rfifo/n57 ), .ZN(spsr[0]) );
  AOI21_X1 \rfifo/U98  ( .B1(\rfifo/n54 ), .B2(\rfifo/n55 ), .A(\rfifo/n39 ), 
        .ZN(\rfifo/n72 ) );
  NAND3_X1 \rfifo/U97  ( .A1(\rfifo/n53 ), .A2(\rfifo/n52 ), .A3(\rfifo/n2 ), 
        .ZN(\rfifo/n54 ) );
  XOR2_X1 \rfifo/U96  ( .A(\rfifo/n51 ), .B(\rfifo/n37 ), .Z(\rfifo/n56 ) );
  XOR2_X1 \rfifo/U95  ( .A(\rfifo/n50 ), .B(\rfifo/n7 ), .Z(\rfifo/n52 ) );
  INV_X1 \rfifo/U94  ( .A(\rfifo/n49 ), .ZN(\rfifo/n53 ) );
  NAND2_X1 \rfifo/U93  ( .A1(\rfifo/n12 ), .A2(\rfifo/n48 ), .ZN(\rfifo/n55 )
         );
  OAI22_X1 \rfifo/U92  ( .A1(\rfifo/n47 ), .A2(n197), .B1(\rfifo/n7 ), .B2(
        \rfifo/n46 ), .ZN(\rfifo/n105 ) );
  MUX2_X1 \rfifo/U91  ( .A(\rfifo/n45 ), .B(\rfifo/n4 ), .S(\rfifo/n13 ), .Z(
        \rfifo/n47 ) );
  NAND2_X1 \rfifo/U90  ( .A1(\rfifo/n4 ), .A2(\rfifo/n46 ), .ZN(\rfifo/n45 )
         );
  MUX2_X1 \rfifo/U89  ( .A(\rfifo/n12 ), .B(\rfifo/n44 ), .S(\rfifo/n5 ), .Z(
        \rfifo/n106 ) );
  NOR2_X1 \rfifo/U88  ( .A1(n197), .A2(\rfifo/n12 ), .ZN(\rfifo/n44 ) );
  OR2_X1 \rfifo/U87  ( .A1(n197), .A2(rfre), .ZN(\rfifo/n46 ) );
  MUX2_X1 \rfifo/U86  ( .A(\rfifo/mem[0][1] ), .B(treg[0]), .S(\rfifo/n19 ), 
        .Z(\rfifo/n97 ) );
  MUX2_X1 \rfifo/U85  ( .A(\rfifo/mem[0][2] ), .B(treg[1]), .S(\rfifo/n19 ), 
        .Z(\rfifo/n98 ) );
  MUX2_X1 \rfifo/U84  ( .A(\rfifo/mem[0][3] ), .B(treg[2]), .S(\rfifo/n19 ), 
        .Z(\rfifo/n99 ) );
  MUX2_X1 \rfifo/U83  ( .A(\rfifo/mem[0][4] ), .B(treg[3]), .S(\rfifo/n19 ), 
        .Z(\rfifo/n100 ) );
  MUX2_X1 \rfifo/U82  ( .A(\rfifo/mem[0][5] ), .B(treg[4]), .S(\rfifo/n19 ), 
        .Z(\rfifo/n101 ) );
  MUX2_X1 \rfifo/U81  ( .A(\rfifo/mem[0][6] ), .B(treg[5]), .S(\rfifo/n19 ), 
        .Z(\rfifo/n102 ) );
  MUX2_X1 \rfifo/U80  ( .A(\rfifo/mem[0][7] ), .B(treg[6]), .S(\rfifo/n19 ), 
        .Z(\rfifo/n103 ) );
  MUX2_X1 \rfifo/U79  ( .A(\rfifo/mem[0][8] ), .B(mosi_o), .S(\rfifo/n19 ), 
        .Z(\rfifo/n104 ) );
  MUX2_X1 \rfifo/U78  ( .A(\rfifo/mem[1][1] ), .B(treg[0]), .S(\rfifo/n20 ), 
        .Z(\rfifo/n89 ) );
  MUX2_X1 \rfifo/U77  ( .A(\rfifo/mem[1][2] ), .B(treg[1]), .S(\rfifo/n20 ), 
        .Z(\rfifo/n90 ) );
  MUX2_X1 \rfifo/U76  ( .A(\rfifo/mem[1][3] ), .B(treg[2]), .S(\rfifo/n20 ), 
        .Z(\rfifo/n91 ) );
  MUX2_X1 \rfifo/U75  ( .A(\rfifo/mem[1][4] ), .B(treg[3]), .S(\rfifo/n20 ), 
        .Z(\rfifo/n92 ) );
  MUX2_X1 \rfifo/U74  ( .A(\rfifo/mem[1][5] ), .B(treg[4]), .S(\rfifo/n20 ), 
        .Z(\rfifo/n93 ) );
  MUX2_X1 \rfifo/U73  ( .A(\rfifo/mem[1][6] ), .B(treg[5]), .S(\rfifo/n20 ), 
        .Z(\rfifo/n94 ) );
  MUX2_X1 \rfifo/U72  ( .A(\rfifo/mem[1][7] ), .B(treg[6]), .S(\rfifo/n20 ), 
        .Z(\rfifo/n95 ) );
  MUX2_X1 \rfifo/U71  ( .A(\rfifo/mem[1][8] ), .B(mosi_o), .S(\rfifo/n20 ), 
        .Z(\rfifo/n96 ) );
  MUX2_X1 \rfifo/U70  ( .A(\rfifo/mem[2][1] ), .B(treg[0]), .S(\rfifo/n10 ), 
        .Z(\rfifo/n81 ) );
  MUX2_X1 \rfifo/U69  ( .A(\rfifo/mem[2][2] ), .B(treg[1]), .S(\rfifo/n10 ), 
        .Z(\rfifo/n82 ) );
  MUX2_X1 \rfifo/U68  ( .A(\rfifo/mem[2][3] ), .B(treg[2]), .S(\rfifo/n10 ), 
        .Z(\rfifo/n83 ) );
  MUX2_X1 \rfifo/U67  ( .A(\rfifo/mem[2][4] ), .B(treg[3]), .S(\rfifo/n10 ), 
        .Z(\rfifo/n84 ) );
  MUX2_X1 \rfifo/U66  ( .A(\rfifo/mem[2][5] ), .B(treg[4]), .S(\rfifo/n10 ), 
        .Z(\rfifo/n85 ) );
  MUX2_X1 \rfifo/U65  ( .A(\rfifo/mem[2][6] ), .B(treg[5]), .S(\rfifo/n10 ), 
        .Z(\rfifo/n86 ) );
  MUX2_X1 \rfifo/U64  ( .A(\rfifo/mem[2][7] ), .B(treg[6]), .S(\rfifo/n10 ), 
        .Z(\rfifo/n87 ) );
  MUX2_X1 \rfifo/U63  ( .A(\rfifo/mem[2][8] ), .B(mosi_o), .S(\rfifo/n10 ), 
        .Z(\rfifo/n88 ) );
  MUX2_X1 \rfifo/U62  ( .A(\rfifo/mem[3][1] ), .B(treg[0]), .S(\rfifo/n8 ), 
        .Z(\rfifo/n73 ) );
  MUX2_X1 \rfifo/U61  ( .A(\rfifo/mem[3][2] ), .B(treg[1]), .S(\rfifo/n8 ), 
        .Z(\rfifo/n74 ) );
  MUX2_X1 \rfifo/U60  ( .A(\rfifo/mem[3][3] ), .B(treg[2]), .S(\rfifo/n8 ), 
        .Z(\rfifo/n75 ) );
  MUX2_X1 \rfifo/U59  ( .A(\rfifo/mem[3][4] ), .B(treg[3]), .S(\rfifo/n8 ), 
        .Z(\rfifo/n76 ) );
  MUX2_X1 \rfifo/U58  ( .A(\rfifo/mem[3][5] ), .B(treg[4]), .S(\rfifo/n8 ), 
        .Z(\rfifo/n77 ) );
  MUX2_X1 \rfifo/U57  ( .A(\rfifo/mem[3][6] ), .B(treg[5]), .S(\rfifo/n8 ), 
        .Z(\rfifo/n78 ) );
  MUX2_X1 \rfifo/U56  ( .A(\rfifo/mem[3][7] ), .B(treg[6]), .S(\rfifo/n8 ), 
        .Z(\rfifo/n79 ) );
  MUX2_X1 \rfifo/U55  ( .A(\rfifo/mem[3][8] ), .B(mosi_o), .S(\rfifo/n8 ), .Z(
        \rfifo/n80 ) );
  OAI22_X1 \rfifo/U54  ( .A1(\rfifo/n6 ), .A2(\rfifo/n43 ), .B1(\rfifo/n49 ), 
        .B2(\rfifo/n42 ), .ZN(\rfifo/n107 ) );
  INV_X1 \rfifo/U53  ( .A(\rfifo/n50 ), .ZN(\rfifo/n42 ) );
  OAI22_X1 \rfifo/U52  ( .A1(\rfifo/n1 ), .A2(\rfifo/n43 ), .B1(\rfifo/n49 ), 
        .B2(\rfifo/wp [0]), .ZN(\rfifo/n108 ) );
  NAND2_X1 \rfifo/U51  ( .A1(\rfifo/n41 ), .A2(\rfifo/n9 ), .ZN(\rfifo/n49 )
         );
  NAND2_X1 \rfifo/U50  ( .A1(\rfifo/n41 ), .A2(\rfifo/n40 ), .ZN(\rfifo/n43 )
         );
  INV_X1 \rfifo/U49  ( .A(n197), .ZN(\rfifo/n41 ) );
  INV_X1 \rfifo/U48  ( .A(\rfifo/n9 ), .ZN(\rfifo/n40 ) );
  AOI22_X1 \rfifo/U47  ( .A1(\rfifo/mem[1][8] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][8] ), .ZN(\rfifo/n35 ) );
  AOI22_X1 \rfifo/U46  ( .A1(\rfifo/mem[3][8] ), .A2(\rfifo/n16 ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][8] ), .ZN(\rfifo/n36 ) );
  NAND2_X1 \rfifo/U45  ( .A1(\rfifo/n35 ), .A2(\rfifo/n36 ), .ZN(rfdout[7]) );
  AOI22_X1 \rfifo/U44  ( .A1(\rfifo/mem[1][7] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][7] ), .ZN(\rfifo/n33 ) );
  AOI22_X1 \rfifo/U43  ( .A1(\rfifo/mem[3][7] ), .A2(\rfifo/n16 ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][7] ), .ZN(\rfifo/n34 ) );
  NAND2_X1 \rfifo/U42  ( .A1(\rfifo/n33 ), .A2(\rfifo/n34 ), .ZN(rfdout[6]) );
  AOI22_X1 \rfifo/U41  ( .A1(\rfifo/mem[1][6] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][6] ), .ZN(\rfifo/n31 ) );
  AOI22_X1 \rfifo/U40  ( .A1(\rfifo/mem[3][6] ), .A2(\rfifo/n16 ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][6] ), .ZN(\rfifo/n32 ) );
  NAND2_X1 \rfifo/U39  ( .A1(\rfifo/n32 ), .A2(\rfifo/n31 ), .ZN(rfdout[5]) );
  AOI22_X1 \rfifo/U38  ( .A1(\rfifo/mem[1][5] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][5] ), .ZN(\rfifo/n29 ) );
  AOI22_X1 \rfifo/U37  ( .A1(\rfifo/mem[3][5] ), .A2(\rfifo/n16 ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][5] ), .ZN(\rfifo/n30 ) );
  NAND2_X1 \rfifo/U36  ( .A1(\rfifo/n29 ), .A2(\rfifo/n30 ), .ZN(rfdout[4]) );
  AOI22_X1 \rfifo/U35  ( .A1(\rfifo/mem[1][4] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][4] ), .ZN(\rfifo/n27 ) );
  AOI22_X1 \rfifo/U34  ( .A1(\rfifo/mem[3][4] ), .A2(\rfifo/n16 ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][4] ), .ZN(\rfifo/n28 ) );
  NAND2_X1 \rfifo/U33  ( .A1(\rfifo/n27 ), .A2(\rfifo/n28 ), .ZN(rfdout[3]) );
  AOI22_X1 \rfifo/U32  ( .A1(\rfifo/mem[1][3] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][3] ), .ZN(\rfifo/n25 ) );
  AOI22_X1 \rfifo/U31  ( .A1(\rfifo/mem[3][3] ), .A2(\rfifo/n16 ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][3] ), .ZN(\rfifo/n26 ) );
  NAND2_X1 \rfifo/U30  ( .A1(\rfifo/n26 ), .A2(\rfifo/n25 ), .ZN(rfdout[2]) );
  AOI22_X1 \rfifo/U29  ( .A1(\rfifo/mem[1][2] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][2] ), .ZN(\rfifo/n23 ) );
  AOI22_X1 \rfifo/U28  ( .A1(\rfifo/mem[3][2] ), .A2(\rfifo/n16 ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][2] ), .ZN(\rfifo/n24 ) );
  NAND2_X1 \rfifo/U27  ( .A1(\rfifo/n23 ), .A2(\rfifo/n24 ), .ZN(rfdout[1]) );
  AOI22_X1 \rfifo/U26  ( .A1(\rfifo/mem[1][1] ), .A2(\rfifo/n17 ), .B1(
        \rfifo/n15 ), .B2(\rfifo/mem[0][1] ), .ZN(\rfifo/n21 ) );
  AOI22_X1 \rfifo/U25  ( .A1(\rfifo/n16 ), .A2(\rfifo/mem[3][1] ), .B1(
        \rfifo/n14 ), .B2(\rfifo/mem[2][1] ), .ZN(\rfifo/n22 ) );
  NAND2_X1 \rfifo/U24  ( .A1(\rfifo/n22 ), .A2(\rfifo/n21 ), .ZN(rfdout[0]) );
  INV_X1 \rfifo/U23  ( .A(rst_i), .ZN(\rfifo/n39 ) );
  AND3_X2 \rfifo/U22  ( .A1(\rfifo/wp [0]), .A2(\rfifo/n6 ), .A3(rfwe), .ZN(
        \rfifo/n20 ) );
  AND3_X2 \rfifo/U21  ( .A1(\rfifo/n6 ), .A2(rfwe), .A3(\rfifo/n51 ), .ZN(
        \rfifo/n19 ) );
  XNOR2_X1 \rfifo/U20  ( .A(\rfifo/n38 ), .B(\rfifo/wp [1]), .ZN(\rfifo/n18 )
         );
  AND2_X2 \rfifo/U19  ( .A1(\rfifo/n38 ), .A2(\rfifo/n37 ), .ZN(\rfifo/n15 )
         );
  AND2_X2 \rfifo/U18  ( .A1(\rfifo/N9 ), .A2(\rfifo/n37 ), .ZN(\rfifo/n14 ) );
  CLKBUF_X1 \rfifo/U17  ( .A(\rfifo/n3 ), .Z(\rfifo/n13 ) );
  XOR2_X1 \rfifo/U16  ( .A(\rfifo/n51 ), .B(\rfifo/n6 ), .Z(\rfifo/n50 ) );
  AND2_X2 \rfifo/U15  ( .A1(\rfifo/N9 ), .A2(\rfifo/N8 ), .ZN(\rfifo/n16 ) );
  AND2_X2 \rfifo/U14  ( .A1(\rfifo/N8 ), .A2(\rfifo/n38 ), .ZN(\rfifo/n17 ) );
  NOR2_X1 \rfifo/U13  ( .A1(n197), .A2(rfre), .ZN(\rfifo/n12 ) );
  AND3_X2 \rfifo/U12  ( .A1(\rfifo/wp [1]), .A2(rfwe), .A3(\rfifo/n51 ), .ZN(
        \rfifo/n10 ) );
  CLKBUF_X1 \rfifo/U11  ( .A(rfwe), .Z(\rfifo/n9 ) );
  AND3_X2 \rfifo/U10  ( .A1(\rfifo/wp [1]), .A2(\rfifo/wp [0]), .A3(rfwe), 
        .ZN(\rfifo/n8 ) );
  OR2_X1 \rfifo/U9  ( .A1(\rfifo/n56 ), .A2(\rfifo/n18 ), .ZN(\rfifo/n57 ) );
  BUF_X1 \rfifo/U8  ( .A(\rfifo/n38 ), .Z(\rfifo/n7 ) );
  CLKBUF_X1 \rfifo/U7  ( .A(\rfifo/n37 ), .Z(\rfifo/n5 ) );
  INV_X1 \rfifo/U6  ( .A(\rfifo/n5 ), .ZN(\rfifo/n4 ) );
  INV_X1 \rfifo/U5  ( .A(\rfifo/n7 ), .ZN(\rfifo/n3 ) );
  BUF_X1 \rfifo/U4  ( .A(\rfifo/n56 ), .Z(\rfifo/n2 ) );
  CLKBUF_X1 \rfifo/U3  ( .A(\rfifo/n51 ), .Z(\rfifo/n1 ) );
  DFFR_X1 \rfifo/rp_reg[1]  ( .D(\rfifo/n105 ), .CK(clk_i), .RN(rst_i), .Q(
        \rfifo/N9 ), .QN(\rfifo/n38 ) );
  DFFR_X1 \rfifo/rp_reg[0]  ( .D(\rfifo/n106 ), .CK(clk_i), .RN(rst_i), .Q(
        \rfifo/N8 ), .QN(\rfifo/n37 ) );
  DFFR_X1 \rfifo/wp_reg[0]  ( .D(\rfifo/n108 ), .CK(clk_i), .RN(rst_i), .Q(
        \rfifo/wp [0]), .QN(\rfifo/n51 ) );
  DFF_X1 \rfifo/gb_reg  ( .D(\rfifo/n72 ), .CK(clk_i), .Q(\rfifo/n48 ), .QN(
        \rfifo/n11 ) );
  DFF_X1 \rfifo/mem_reg[3][1]  ( .D(\rfifo/n73 ), .CK(clk_i), .Q(
        \rfifo/mem[3][1] ) );
  DFF_X1 \rfifo/mem_reg[3][2]  ( .D(\rfifo/n74 ), .CK(clk_i), .Q(
        \rfifo/mem[3][2] ) );
  DFF_X1 \rfifo/mem_reg[3][3]  ( .D(\rfifo/n75 ), .CK(clk_i), .Q(
        \rfifo/mem[3][3] ) );
  DFF_X1 \rfifo/mem_reg[3][4]  ( .D(\rfifo/n76 ), .CK(clk_i), .Q(
        \rfifo/mem[3][4] ) );
  DFF_X1 \rfifo/mem_reg[3][5]  ( .D(\rfifo/n77 ), .CK(clk_i), .Q(
        \rfifo/mem[3][5] ) );
  DFF_X1 \rfifo/mem_reg[3][6]  ( .D(\rfifo/n78 ), .CK(clk_i), .Q(
        \rfifo/mem[3][6] ) );
  DFF_X1 \rfifo/mem_reg[3][7]  ( .D(\rfifo/n79 ), .CK(clk_i), .Q(
        \rfifo/mem[3][7] ) );
  DFF_X1 \rfifo/mem_reg[3][8]  ( .D(\rfifo/n80 ), .CK(clk_i), .Q(
        \rfifo/mem[3][8] ) );
  DFF_X1 \rfifo/mem_reg[2][1]  ( .D(\rfifo/n81 ), .CK(clk_i), .Q(
        \rfifo/mem[2][1] ) );
  DFF_X1 \rfifo/mem_reg[2][2]  ( .D(\rfifo/n82 ), .CK(clk_i), .Q(
        \rfifo/mem[2][2] ) );
  DFF_X1 \rfifo/mem_reg[2][3]  ( .D(\rfifo/n83 ), .CK(clk_i), .Q(
        \rfifo/mem[2][3] ) );
  DFF_X1 \rfifo/mem_reg[2][4]  ( .D(\rfifo/n84 ), .CK(clk_i), .Q(
        \rfifo/mem[2][4] ) );
  DFF_X1 \rfifo/mem_reg[2][5]  ( .D(\rfifo/n85 ), .CK(clk_i), .Q(
        \rfifo/mem[2][5] ) );
  DFF_X1 \rfifo/mem_reg[2][6]  ( .D(\rfifo/n86 ), .CK(clk_i), .Q(
        \rfifo/mem[2][6] ) );
  DFF_X1 \rfifo/mem_reg[2][7]  ( .D(\rfifo/n87 ), .CK(clk_i), .Q(
        \rfifo/mem[2][7] ) );
  DFF_X1 \rfifo/mem_reg[2][8]  ( .D(\rfifo/n88 ), .CK(clk_i), .Q(
        \rfifo/mem[2][8] ) );
  DFF_X1 \rfifo/mem_reg[1][1]  ( .D(\rfifo/n89 ), .CK(clk_i), .Q(
        \rfifo/mem[1][1] ) );
  DFF_X1 \rfifo/mem_reg[1][2]  ( .D(\rfifo/n90 ), .CK(clk_i), .Q(
        \rfifo/mem[1][2] ) );
  DFF_X1 \rfifo/mem_reg[1][3]  ( .D(\rfifo/n91 ), .CK(clk_i), .Q(
        \rfifo/mem[1][3] ) );
  DFF_X1 \rfifo/mem_reg[1][4]  ( .D(\rfifo/n92 ), .CK(clk_i), .Q(
        \rfifo/mem[1][4] ) );
  DFF_X1 \rfifo/mem_reg[1][5]  ( .D(\rfifo/n93 ), .CK(clk_i), .Q(
        \rfifo/mem[1][5] ) );
  DFF_X1 \rfifo/mem_reg[1][6]  ( .D(\rfifo/n94 ), .CK(clk_i), .Q(
        \rfifo/mem[1][6] ) );
  DFF_X1 \rfifo/mem_reg[1][7]  ( .D(\rfifo/n95 ), .CK(clk_i), .Q(
        \rfifo/mem[1][7] ) );
  DFF_X1 \rfifo/mem_reg[1][8]  ( .D(\rfifo/n96 ), .CK(clk_i), .Q(
        \rfifo/mem[1][8] ) );
  DFF_X1 \rfifo/mem_reg[0][1]  ( .D(\rfifo/n97 ), .CK(clk_i), .Q(
        \rfifo/mem[0][1] ) );
  DFF_X1 \rfifo/mem_reg[0][2]  ( .D(\rfifo/n98 ), .CK(clk_i), .Q(
        \rfifo/mem[0][2] ) );
  DFF_X1 \rfifo/mem_reg[0][3]  ( .D(\rfifo/n99 ), .CK(clk_i), .Q(
        \rfifo/mem[0][3] ) );
  DFF_X1 \rfifo/mem_reg[0][4]  ( .D(\rfifo/n100 ), .CK(clk_i), .Q(
        \rfifo/mem[0][4] ) );
  DFF_X1 \rfifo/mem_reg[0][5]  ( .D(\rfifo/n101 ), .CK(clk_i), .Q(
        \rfifo/mem[0][5] ) );
  DFF_X1 \rfifo/mem_reg[0][6]  ( .D(\rfifo/n102 ), .CK(clk_i), .Q(
        \rfifo/mem[0][6] ) );
  DFF_X1 \rfifo/mem_reg[0][7]  ( .D(\rfifo/n103 ), .CK(clk_i), .Q(
        \rfifo/mem[0][7] ) );
  DFF_X1 \rfifo/mem_reg[0][8]  ( .D(\rfifo/n104 ), .CK(clk_i), .Q(
        \rfifo/mem[0][8] ) );
  DFFR_X1 \rfifo/wp_reg[1]  ( .D(\rfifo/n107 ), .CK(clk_i), .RN(rst_i), .Q(
        \rfifo/wp [1]), .QN(\rfifo/n6 ) );
  NOR3_X1 \wfifo/U109  ( .A1(\wfifo/n66 ), .A2(\wfifo/n65 ), .A3(\wfifo/n136 ), 
        .ZN(spsr[3]) );
  AOI21_X1 \wfifo/U108  ( .B1(\wfifo/n63 ), .B2(\wfifo/n64 ), .A(\wfifo/n48 ), 
        .ZN(\wfifo/n135 ) );
  NAND3_X1 \wfifo/U107  ( .A1(\wfifo/n62 ), .A2(\wfifo/n61 ), .A3(\wfifo/n5 ), 
        .ZN(\wfifo/n63 ) );
  XOR2_X1 \wfifo/U106  ( .A(\wfifo/n60 ), .B(\wfifo/n18 ), .Z(\wfifo/n61 ) );
  INV_X1 \wfifo/U105  ( .A(\wfifo/n59 ), .ZN(\wfifo/n62 ) );
  NAND2_X1 \wfifo/U104  ( .A1(\wfifo/n58 ), .A2(\wfifo/n57 ), .ZN(\wfifo/n64 )
         );
  OAI22_X1 \wfifo/U103  ( .A1(n24), .A2(\wfifo/n56 ), .B1(\wfifo/n18 ), .B2(
        \wfifo/n55 ), .ZN(\wfifo/n70 ) );
  MUX2_X1 \wfifo/U102  ( .A(\wfifo/n54 ), .B(\wfifo/n3 ), .S(\wfifo/n9 ), .Z(
        \wfifo/n56 ) );
  NAND2_X1 \wfifo/U101  ( .A1(\wfifo/n3 ), .A2(\wfifo/n55 ), .ZN(\wfifo/n54 )
         );
  MUX2_X1 \wfifo/U100  ( .A(\wfifo/n58 ), .B(\wfifo/n53 ), .S(\wfifo/n15 ), 
        .Z(\wfifo/n69 ) );
  NOR2_X1 \wfifo/U99  ( .A1(n24), .A2(\wfifo/n58 ), .ZN(\wfifo/n53 ) );
  INV_X1 \wfifo/U98  ( .A(\wfifo/n55 ), .ZN(\wfifo/n58 ) );
  OR2_X1 \wfifo/U97  ( .A1(wfre), .A2(n24), .ZN(\wfifo/n55 ) );
  MUX2_X1 \wfifo/U96  ( .A(\wfifo/mem[0][1] ), .B(dat_i[0]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n110 ) );
  MUX2_X1 \wfifo/U95  ( .A(\wfifo/mem[0][2] ), .B(dat_i[1]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n109 ) );
  MUX2_X1 \wfifo/U94  ( .A(\wfifo/mem[0][3] ), .B(dat_i[2]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n108 ) );
  MUX2_X1 \wfifo/U93  ( .A(\wfifo/mem[0][4] ), .B(dat_i[3]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n107 ) );
  MUX2_X1 \wfifo/U92  ( .A(\wfifo/mem[0][5] ), .B(dat_i[4]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n106 ) );
  MUX2_X1 \wfifo/U91  ( .A(\wfifo/mem[0][6] ), .B(dat_i[5]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n105 ) );
  MUX2_X1 \wfifo/U90  ( .A(\wfifo/mem[0][7] ), .B(dat_i[6]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n104 ) );
  MUX2_X1 \wfifo/U89  ( .A(\wfifo/mem[0][8] ), .B(dat_i[7]), .S(\wfifo/n21 ), 
        .Z(\wfifo/n71 ) );
  MUX2_X1 \wfifo/U88  ( .A(\wfifo/mem[1][1] ), .B(dat_i[0]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n118 ) );
  MUX2_X1 \wfifo/U87  ( .A(\wfifo/mem[1][2] ), .B(dat_i[1]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n117 ) );
  MUX2_X1 \wfifo/U86  ( .A(\wfifo/mem[1][3] ), .B(dat_i[2]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n116 ) );
  MUX2_X1 \wfifo/U85  ( .A(\wfifo/mem[1][4] ), .B(dat_i[3]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n115 ) );
  MUX2_X1 \wfifo/U84  ( .A(\wfifo/mem[1][5] ), .B(dat_i[4]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n114 ) );
  MUX2_X1 \wfifo/U83  ( .A(\wfifo/mem[1][6] ), .B(dat_i[5]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n113 ) );
  MUX2_X1 \wfifo/U82  ( .A(\wfifo/mem[1][7] ), .B(dat_i[6]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n112 ) );
  MUX2_X1 \wfifo/U81  ( .A(\wfifo/mem[1][8] ), .B(dat_i[7]), .S(\wfifo/n23 ), 
        .Z(\wfifo/n111 ) );
  MUX2_X1 \wfifo/U80  ( .A(\wfifo/mem[2][1] ), .B(dat_i[0]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n126 ) );
  MUX2_X1 \wfifo/U79  ( .A(\wfifo/mem[2][2] ), .B(dat_i[1]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n125 ) );
  MUX2_X1 \wfifo/U78  ( .A(\wfifo/mem[2][3] ), .B(dat_i[2]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n124 ) );
  MUX2_X1 \wfifo/U77  ( .A(\wfifo/mem[2][4] ), .B(dat_i[3]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n123 ) );
  MUX2_X1 \wfifo/U76  ( .A(\wfifo/mem[2][5] ), .B(dat_i[4]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n122 ) );
  MUX2_X1 \wfifo/U75  ( .A(\wfifo/mem[2][6] ), .B(dat_i[5]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n121 ) );
  MUX2_X1 \wfifo/U74  ( .A(\wfifo/mem[2][7] ), .B(dat_i[6]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n120 ) );
  MUX2_X1 \wfifo/U73  ( .A(\wfifo/mem[2][8] ), .B(dat_i[7]), .S(\wfifo/n22 ), 
        .Z(\wfifo/n119 ) );
  MUX2_X1 \wfifo/U72  ( .A(\wfifo/mem[3][1] ), .B(dat_i[0]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n134 ) );
  MUX2_X1 \wfifo/U71  ( .A(\wfifo/mem[3][2] ), .B(dat_i[1]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n133 ) );
  MUX2_X1 \wfifo/U70  ( .A(\wfifo/mem[3][3] ), .B(dat_i[2]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n132 ) );
  MUX2_X1 \wfifo/U69  ( .A(\wfifo/mem[3][4] ), .B(dat_i[3]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n131 ) );
  MUX2_X1 \wfifo/U68  ( .A(\wfifo/mem[3][5] ), .B(dat_i[4]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n130 ) );
  MUX2_X1 \wfifo/U67  ( .A(\wfifo/mem[3][6] ), .B(dat_i[5]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n129 ) );
  MUX2_X1 \wfifo/U66  ( .A(\wfifo/mem[3][7] ), .B(dat_i[6]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n128 ) );
  MUX2_X1 \wfifo/U65  ( .A(\wfifo/mem[3][8] ), .B(dat_i[7]), .S(\wfifo/n19 ), 
        .Z(\wfifo/n127 ) );
  OAI22_X1 \wfifo/U64  ( .A1(\wfifo/n13 ), .A2(\wfifo/n52 ), .B1(\wfifo/n51 ), 
        .B2(\wfifo/n59 ), .ZN(\wfifo/n68 ) );
  INV_X1 \wfifo/U63  ( .A(\wfifo/n60 ), .ZN(\wfifo/n51 ) );
  XOR2_X1 \wfifo/U62  ( .A(\wfifo/wp [0]), .B(\wfifo/wp [1]), .Z(\wfifo/n60 )
         );
  OAI22_X1 \wfifo/U61  ( .A1(\wfifo/n12 ), .A2(\wfifo/n52 ), .B1(\wfifo/n2 ), 
        .B2(\wfifo/n59 ), .ZN(\wfifo/n67 ) );
  NAND2_X1 \wfifo/U60  ( .A1(\wfifo/n7 ), .A2(\wfifo/n50 ), .ZN(\wfifo/n59 )
         );
  NAND2_X1 \wfifo/U59  ( .A1(\wfifo/n49 ), .A2(\wfifo/n50 ), .ZN(\wfifo/n52 )
         );
  INV_X1 \wfifo/U58  ( .A(n24), .ZN(\wfifo/n50 ) );
  INV_X1 \wfifo/U57  ( .A(\wfifo/n7 ), .ZN(\wfifo/n49 ) );
  INV_X1 \wfifo/U56  ( .A(\wfifo/n42 ), .ZN(\wfifo/n44 ) );
  NAND2_X1 \wfifo/U55  ( .A1(\wfifo/N8 ), .A2(\wfifo/n17 ), .ZN(\wfifo/n43 )
         );
  INV_X1 \wfifo/U54  ( .A(\wfifo/n43 ), .ZN(\wfifo/n26 ) );
  NAND2_X1 \wfifo/U53  ( .A1(\wfifo/n17 ), .A2(\wfifo/n137 ), .ZN(\wfifo/n42 )
         );
  INV_X1 \wfifo/U52  ( .A(\wfifo/n42 ), .ZN(\wfifo/n27 ) );
  AOI22_X1 \wfifo/U51  ( .A1(\wfifo/mem[1][8] ), .A2(\wfifo/n16 ), .B1(
        \wfifo/mem[0][8] ), .B2(\wfifo/n27 ), .ZN(\wfifo/n40 ) );
  AOI22_X1 \wfifo/U50  ( .A1(\wfifo/mem[3][8] ), .A2(\wfifo/n20 ), .B1(
        \wfifo/mem[2][8] ), .B2(\wfifo/n1 ), .ZN(\wfifo/n41 ) );
  NAND2_X1 \wfifo/U49  ( .A1(\wfifo/n40 ), .A2(\wfifo/n41 ), .ZN(wfdout[7]) );
  AOI22_X1 \wfifo/U48  ( .A1(\wfifo/mem[1][7] ), .A2(\wfifo/n26 ), .B1(
        \wfifo/mem[0][7] ), .B2(\wfifo/n27 ), .ZN(\wfifo/n38 ) );
  AOI22_X1 \wfifo/U47  ( .A1(\wfifo/mem[3][7] ), .A2(\wfifo/n20 ), .B1(
        \wfifo/mem[2][7] ), .B2(\wfifo/n1 ), .ZN(\wfifo/n39 ) );
  NAND2_X1 \wfifo/U46  ( .A1(\wfifo/n39 ), .A2(\wfifo/n38 ), .ZN(wfdout[6]) );
  AOI22_X1 \wfifo/U45  ( .A1(\wfifo/mem[1][6] ), .A2(\wfifo/n16 ), .B1(
        \wfifo/mem[0][6] ), .B2(\wfifo/n27 ), .ZN(\wfifo/n36 ) );
  AOI22_X1 \wfifo/U44  ( .A1(\wfifo/n20 ), .A2(\wfifo/mem[3][6] ), .B1(
        \wfifo/n1 ), .B2(\wfifo/mem[2][6] ), .ZN(\wfifo/n37 ) );
  NAND2_X1 \wfifo/U43  ( .A1(\wfifo/n37 ), .A2(\wfifo/n36 ), .ZN(wfdout[5]) );
  AOI22_X1 \wfifo/U42  ( .A1(\wfifo/mem[1][5] ), .A2(\wfifo/n26 ), .B1(
        \wfifo/mem[0][5] ), .B2(\wfifo/n27 ), .ZN(\wfifo/n34 ) );
  AOI22_X1 \wfifo/U41  ( .A1(\wfifo/mem[3][5] ), .A2(\wfifo/n20 ), .B1(
        \wfifo/mem[2][5] ), .B2(\wfifo/n1 ), .ZN(\wfifo/n35 ) );
  NAND2_X1 \wfifo/U40  ( .A1(\wfifo/n35 ), .A2(\wfifo/n34 ), .ZN(wfdout[4]) );
  AOI22_X1 \wfifo/U39  ( .A1(\wfifo/mem[1][4] ), .A2(\wfifo/n26 ), .B1(
        \wfifo/mem[0][4] ), .B2(\wfifo/n27 ), .ZN(\wfifo/n32 ) );
  AOI22_X1 \wfifo/U38  ( .A1(\wfifo/mem[3][4] ), .A2(\wfifo/n20 ), .B1(
        \wfifo/mem[2][4] ), .B2(\wfifo/n1 ), .ZN(\wfifo/n33 ) );
  NAND2_X1 \wfifo/U37  ( .A1(\wfifo/n32 ), .A2(\wfifo/n33 ), .ZN(wfdout[3]) );
  AOI22_X1 \wfifo/U36  ( .A1(\wfifo/mem[1][3] ), .A2(\wfifo/n16 ), .B1(
        \wfifo/mem[0][3] ), .B2(\wfifo/n44 ), .ZN(\wfifo/n30 ) );
  AOI22_X1 \wfifo/U35  ( .A1(\wfifo/mem[3][3] ), .A2(\wfifo/n20 ), .B1(
        \wfifo/mem[2][3] ), .B2(\wfifo/n1 ), .ZN(\wfifo/n31 ) );
  NAND2_X1 \wfifo/U34  ( .A1(\wfifo/n30 ), .A2(\wfifo/n31 ), .ZN(wfdout[2]) );
  AOI22_X1 \wfifo/U33  ( .A1(\wfifo/mem[1][2] ), .A2(\wfifo/n26 ), .B1(
        \wfifo/mem[0][2] ), .B2(\wfifo/n44 ), .ZN(\wfifo/n28 ) );
  AOI22_X1 \wfifo/U32  ( .A1(\wfifo/mem[3][2] ), .A2(\wfifo/n20 ), .B1(
        \wfifo/mem[2][2] ), .B2(\wfifo/n1 ), .ZN(\wfifo/n29 ) );
  NAND2_X1 \wfifo/U31  ( .A1(\wfifo/n28 ), .A2(\wfifo/n29 ), .ZN(wfdout[1]) );
  AOI22_X1 \wfifo/U30  ( .A1(\wfifo/mem[1][1] ), .A2(\wfifo/n16 ), .B1(
        \wfifo/n44 ), .B2(\wfifo/mem[0][1] ), .ZN(\wfifo/n24 ) );
  AOI22_X1 \wfifo/U29  ( .A1(\wfifo/mem[3][1] ), .A2(\wfifo/n20 ), .B1(
        \wfifo/n1 ), .B2(\wfifo/mem[2][1] ), .ZN(\wfifo/n25 ) );
  NAND2_X1 \wfifo/U28  ( .A1(\wfifo/n24 ), .A2(\wfifo/n25 ), .ZN(wfdout[0]) );
  INV_X1 \wfifo/U27  ( .A(rst_i), .ZN(\wfifo/n48 ) );
  AND3_X2 \wfifo/U26  ( .A1(n247), .A2(\wfifo/n45 ), .A3(\wfifo/n12 ), .ZN(
        \wfifo/n22 ) );
  AND3_X2 \wfifo/U25  ( .A1(n247), .A2(\wfifo/n4 ), .A3(\wfifo/n45 ), .ZN(
        \wfifo/n19 ) );
  XNOR2_X1 \wfifo/U24  ( .A(\wfifo/n17 ), .B(\wfifo/n139 ), .ZN(\wfifo/n47 )
         );
  XNOR2_X1 \wfifo/U23  ( .A(\wfifo/n137 ), .B(\wfifo/n138 ), .ZN(\wfifo/n46 )
         );
  CLKBUF_X1 \wfifo/U22  ( .A(\wfifo/n14 ), .Z(\wfifo/n18 ) );
  INV_X1 \wfifo/U21  ( .A(\wfifo/n43 ), .ZN(\wfifo/n16 ) );
  INV_X1 \wfifo/U20  ( .A(\wfifo/n3 ), .ZN(\wfifo/n15 ) );
  INV_X1 \wfifo/U19  ( .A(\wfifo/N9 ), .ZN(\wfifo/n14 ) );
  INV_X1 \wfifo/U18  ( .A(\wfifo/wp [0]), .ZN(\wfifo/n12 ) );
  BUF_X1 \wfifo/U17  ( .A(\wfifo/wp [1]), .Z(\wfifo/n45 ) );
  AND3_X2 \wfifo/U16  ( .A1(\wfifo/n46 ), .A2(\wfifo/n47 ), .A3(\wfifo/n136 ), 
        .ZN(spsr[2]) );
  XOR2_X1 \wfifo/U15  ( .A(\wfifo/N9 ), .B(\wfifo/wp [1]), .Z(\wfifo/n65 ) );
  INV_X1 \wfifo/U14  ( .A(\wfifo/n14 ), .ZN(\wfifo/n9 ) );
  XOR2_X1 \wfifo/U13  ( .A(\wfifo/N8 ), .B(\wfifo/wp [0]), .Z(\wfifo/n66 ) );
  AND3_X2 \wfifo/U12  ( .A1(n247), .A2(\wfifo/n4 ), .A3(\wfifo/n13 ), .ZN(
        \wfifo/n23 ) );
  BUF_X1 \wfifo/U11  ( .A(\wfifo/n139 ), .Z(\wfifo/n13 ) );
  BUF_X1 \wfifo/U10  ( .A(\wfifo/n66 ), .Z(\wfifo/n5 ) );
  AND3_X2 \wfifo/U9  ( .A1(n247), .A2(\wfifo/n13 ), .A3(\wfifo/n138 ), .ZN(
        \wfifo/n21 ) );
  AND2_X2 \wfifo/U8  ( .A1(\wfifo/N9 ), .A2(\wfifo/N8 ), .ZN(\wfifo/n20 ) );
  BUF_X1 \wfifo/U7  ( .A(\wfifo/N8 ), .Z(\wfifo/n3 ) );
  BUF_X1 \wfifo/U6  ( .A(\wfifo/wp [0]), .Z(\wfifo/n4 ) );
  INV_X1 \wfifo/U5  ( .A(\wfifo/n12 ), .ZN(\wfifo/n2 ) );
  BUF_X1 \wfifo/U4  ( .A(n247), .Z(\wfifo/n7 ) );
  AND2_X2 \wfifo/U3  ( .A1(\wfifo/N9 ), .A2(\wfifo/n137 ), .ZN(\wfifo/n1 ) );
  DFF_X1 \wfifo/gb_reg  ( .D(\wfifo/n135 ), .CK(clk_i), .Q(\wfifo/n57 ), .QN(
        \wfifo/n136 ) );
  DFFR_X1 \wfifo/rp_reg[1]  ( .D(\wfifo/n70 ), .CK(clk_i), .RN(rst_i), .Q(
        \wfifo/N9 ), .QN(\wfifo/n17 ) );
  DFFR_X1 \wfifo/rp_reg[0]  ( .D(\wfifo/n69 ), .CK(clk_i), .RN(rst_i), .Q(
        \wfifo/N8 ), .QN(\wfifo/n137 ) );
  DFFR_X1 \wfifo/wp_reg[1]  ( .D(\wfifo/n68 ), .CK(clk_i), .RN(rst_i), .Q(
        \wfifo/wp [1]), .QN(\wfifo/n139 ) );
  DFFR_X1 \wfifo/wp_reg[0]  ( .D(\wfifo/n67 ), .CK(clk_i), .RN(rst_i), .Q(
        \wfifo/wp [0]), .QN(\wfifo/n138 ) );
  DFF_X1 \wfifo/mem_reg[0][1]  ( .D(\wfifo/n110 ), .CK(clk_i), .Q(
        \wfifo/mem[0][1] ) );
  DFF_X1 \wfifo/mem_reg[0][2]  ( .D(\wfifo/n109 ), .CK(clk_i), .Q(
        \wfifo/mem[0][2] ) );
  DFF_X1 \wfifo/mem_reg[0][3]  ( .D(\wfifo/n108 ), .CK(clk_i), .Q(
        \wfifo/mem[0][3] ) );
  DFF_X1 \wfifo/mem_reg[0][4]  ( .D(\wfifo/n107 ), .CK(clk_i), .Q(
        \wfifo/mem[0][4] ) );
  DFF_X1 \wfifo/mem_reg[0][5]  ( .D(\wfifo/n106 ), .CK(clk_i), .Q(
        \wfifo/mem[0][5] ) );
  DFF_X1 \wfifo/mem_reg[0][6]  ( .D(\wfifo/n105 ), .CK(clk_i), .Q(
        \wfifo/mem[0][6] ) );
  DFF_X1 \wfifo/mem_reg[0][7]  ( .D(\wfifo/n104 ), .CK(clk_i), .Q(
        \wfifo/mem[0][7] ) );
  DFF_X1 \wfifo/mem_reg[0][8]  ( .D(\wfifo/n71 ), .CK(clk_i), .Q(
        \wfifo/mem[0][8] ) );
  DFF_X1 \wfifo/mem_reg[2][1]  ( .D(\wfifo/n126 ), .CK(clk_i), .Q(
        \wfifo/mem[2][1] ) );
  DFF_X1 \wfifo/mem_reg[2][2]  ( .D(\wfifo/n125 ), .CK(clk_i), .Q(
        \wfifo/mem[2][2] ) );
  DFF_X1 \wfifo/mem_reg[2][3]  ( .D(\wfifo/n124 ), .CK(clk_i), .Q(
        \wfifo/mem[2][3] ) );
  DFF_X1 \wfifo/mem_reg[2][4]  ( .D(\wfifo/n123 ), .CK(clk_i), .Q(
        \wfifo/mem[2][4] ) );
  DFF_X1 \wfifo/mem_reg[2][5]  ( .D(\wfifo/n122 ), .CK(clk_i), .Q(
        \wfifo/mem[2][5] ) );
  DFF_X1 \wfifo/mem_reg[2][6]  ( .D(\wfifo/n121 ), .CK(clk_i), .Q(
        \wfifo/mem[2][6] ) );
  DFF_X1 \wfifo/mem_reg[2][7]  ( .D(\wfifo/n120 ), .CK(clk_i), .Q(
        \wfifo/mem[2][7] ) );
  DFF_X1 \wfifo/mem_reg[2][8]  ( .D(\wfifo/n119 ), .CK(clk_i), .Q(
        \wfifo/mem[2][8] ) );
  DFF_X1 \wfifo/mem_reg[1][1]  ( .D(\wfifo/n118 ), .CK(clk_i), .Q(
        \wfifo/mem[1][1] ) );
  DFF_X1 \wfifo/mem_reg[1][2]  ( .D(\wfifo/n117 ), .CK(clk_i), .Q(
        \wfifo/mem[1][2] ) );
  DFF_X1 \wfifo/mem_reg[1][3]  ( .D(\wfifo/n116 ), .CK(clk_i), .Q(
        \wfifo/mem[1][3] ) );
  DFF_X1 \wfifo/mem_reg[1][4]  ( .D(\wfifo/n115 ), .CK(clk_i), .Q(
        \wfifo/mem[1][4] ) );
  DFF_X1 \wfifo/mem_reg[1][5]  ( .D(\wfifo/n114 ), .CK(clk_i), .Q(
        \wfifo/mem[1][5] ) );
  DFF_X1 \wfifo/mem_reg[1][6]  ( .D(\wfifo/n113 ), .CK(clk_i), .Q(
        \wfifo/mem[1][6] ) );
  DFF_X1 \wfifo/mem_reg[1][7]  ( .D(\wfifo/n112 ), .CK(clk_i), .Q(
        \wfifo/mem[1][7] ) );
  DFF_X1 \wfifo/mem_reg[1][8]  ( .D(\wfifo/n111 ), .CK(clk_i), .Q(
        \wfifo/mem[1][8] ) );
  DFF_X1 \wfifo/mem_reg[3][1]  ( .D(\wfifo/n134 ), .CK(clk_i), .Q(
        \wfifo/mem[3][1] ) );
  DFF_X1 \wfifo/mem_reg[3][2]  ( .D(\wfifo/n133 ), .CK(clk_i), .Q(
        \wfifo/mem[3][2] ) );
  DFF_X1 \wfifo/mem_reg[3][3]  ( .D(\wfifo/n132 ), .CK(clk_i), .Q(
        \wfifo/mem[3][3] ) );
  DFF_X1 \wfifo/mem_reg[3][4]  ( .D(\wfifo/n131 ), .CK(clk_i), .Q(
        \wfifo/mem[3][4] ) );
  DFF_X1 \wfifo/mem_reg[3][5]  ( .D(\wfifo/n130 ), .CK(clk_i), .Q(
        \wfifo/mem[3][5] ) );
  DFF_X1 \wfifo/mem_reg[3][6]  ( .D(\wfifo/n129 ), .CK(clk_i), .Q(
        \wfifo/mem[3][6] ) );
  DFF_X1 \wfifo/mem_reg[3][7]  ( .D(\wfifo/n128 ), .CK(clk_i), .Q(
        \wfifo/mem[3][7] ) );
  DFF_X1 \wfifo/mem_reg[3][8]  ( .D(\wfifo/n127 ), .CK(clk_i), .Q(
        \wfifo/mem[3][8] ) );
  NAND2_X1 \sub_237/U71  ( .A1(\sub_237/n50 ), .A2(\sub_237/n51 ), .ZN(
        \sub_237/n49 ) );
  NAND2_X1 \sub_237/U70  ( .A1(clkcnt[1]), .A2(clkcnt[0]), .ZN(\sub_237/n47 )
         );
  NAND3_X1 \sub_237/U69  ( .A1(\sub_237/n33 ), .A2(\sub_237/n42 ), .A3(
        \sub_237/n43 ), .ZN(\sub_237/n39 ) );
  INV_X1 \sub_237/U68  ( .A(\sub_237/n39 ), .ZN(\sub_237/n36 ) );
  OAI21_X1 \sub_237/U67  ( .B1(\sub_237/n36 ), .B2(\sub_237/n25 ), .A(
        \sub_237/n35 ), .ZN(N87) );
  NAND2_X1 \sub_237/U66  ( .A1(\sub_237/n33 ), .A2(\sub_237/n34 ), .ZN(
        \sub_237/n30 ) );
  NAND2_X1 \sub_237/U65  ( .A1(\sub_237/n32 ), .A2(\sub_237/n59 ), .ZN(
        \sub_237/n31 ) );
  NAND4_X1 \sub_237/U64  ( .A1(\sub_237/n28 ), .A2(\sub_237/n59 ), .A3(
        \sub_237/n33 ), .A4(\sub_237/n29 ), .ZN(\sub_237/n27 ) );
  MUX2_X1 \sub_237/U63  ( .A(\sub_237/n26 ), .B(\sub_237/n27 ), .S(
        \sub_237/n5 ), .Z(N89) );
  NAND2_X1 \sub_237/U62  ( .A1(\sub_237/n18 ), .A2(\sub_237/n19 ), .ZN(
        \sub_237/n14 ) );
  NAND2_X1 \sub_237/U61  ( .A1(\sub_237/n16 ), .A2(\sub_237/n17 ), .ZN(
        \sub_237/n15 ) );
  MUX2_X1 \sub_237/U60  ( .A(\sub_237/n10 ), .B(\sub_237/n11 ), .S(clkcnt[9]), 
        .Z(N91) );
  NOR2_X1 \sub_237/U59  ( .A1(clkcnt[5]), .A2(clkcnt[4]), .ZN(\sub_237/n18 )
         );
  INV_X1 \sub_237/U58  ( .A(clkcnt[4]), .ZN(\sub_237/n24 ) );
  NOR2_X1 \sub_237/U57  ( .A1(clkcnt[5]), .A2(clkcnt[4]), .ZN(\sub_237/n57 )
         );
  NOR2_X1 \sub_237/U56  ( .A1(clkcnt[3]), .A2(clkcnt[2]), .ZN(\sub_237/n17 )
         );
  NOR2_X1 \sub_237/U55  ( .A1(clkcnt[4]), .A2(clkcnt[3]), .ZN(\sub_237/n33 )
         );
  INV_X1 \sub_237/U54  ( .A(clkcnt[3]), .ZN(\sub_237/n38 ) );
  NOR2_X1 \sub_237/U53  ( .A1(clkcnt[3]), .A2(clkcnt[2]), .ZN(\sub_237/n56 )
         );
  NOR2_X1 \sub_237/U52  ( .A1(clkcnt[1]), .A2(clkcnt[0]), .ZN(\sub_237/n16 )
         );
  NOR2_X1 \sub_237/U51  ( .A1(\sub_237/n6 ), .A2(clkcnt[1]), .ZN(\sub_237/n28 ) );
  NOR2_X1 \sub_237/U50  ( .A1(\sub_237/n6 ), .A2(clkcnt[1]), .ZN(\sub_237/n32 ) );
  NOR2_X1 \sub_237/U49  ( .A1(clkcnt[2]), .A2(clkcnt[1]), .ZN(\sub_237/n37 )
         );
  NOR2_X1 \sub_237/U48  ( .A1(clkcnt[1]), .A2(clkcnt[0]), .ZN(\sub_237/n43 )
         );
  NOR2_X1 \sub_237/U47  ( .A1(clkcnt[1]), .A2(clkcnt[0]), .ZN(\sub_237/n45 )
         );
  NOR3_X1 \sub_237/U46  ( .A1(\sub_237/n6 ), .A2(clkcnt[0]), .A3(clkcnt[1]), 
        .ZN(\sub_237/n44 ) );
  INV_X1 \sub_237/U45  ( .A(clkcnt[1]), .ZN(\sub_237/n48 ) );
  NOR2_X1 \sub_237/U44  ( .A1(clkcnt[1]), .A2(clkcnt[0]), .ZN(\sub_237/n55 )
         );
  NOR2_X1 \sub_237/U43  ( .A1(\sub_237/n2 ), .A2(\sub_237/n4 ), .ZN(
        \sub_237/n10 ) );
  OAI21_X1 \sub_237/U42  ( .B1(\sub_237/n14 ), .B2(\sub_237/n15 ), .A(
        \sub_237/n2 ), .ZN(\sub_237/n13 ) );
  INV_X1 \sub_237/U41  ( .A(\sub_237/n7 ), .ZN(\sub_237/n51 ) );
  NOR2_X1 \sub_237/U40  ( .A1(\sub_237/n5 ), .A2(clkcnt[6]), .ZN(\sub_237/n19 ) );
  NOR2_X1 \sub_237/U39  ( .A1(clkcnt[6]), .A2(clkcnt[5]), .ZN(\sub_237/n29 )
         );
  NOR2_X1 \sub_237/U38  ( .A1(clkcnt[6]), .A2(clkcnt[5]), .ZN(\sub_237/n34 )
         );
  XNOR2_X1 \sub_237/U37  ( .A(\sub_237/n35 ), .B(clkcnt[6]), .ZN(N88) );
  NOR2_X1 \sub_237/U36  ( .A1(clkcnt[7]), .A2(clkcnt[6]), .ZN(\sub_237/n58 )
         );
  NAND2_X1 \sub_237/U35  ( .A1(\sub_237/n24 ), .A2(\sub_237/n25 ), .ZN(
        \sub_237/n23 ) );
  NOR2_X1 \sub_237/U34  ( .A1(\sub_237/n22 ), .A2(\sub_237/n23 ), .ZN(
        \sub_237/n21 ) );
  INV_X1 \sub_237/U33  ( .A(clkcnt[9]), .ZN(\sub_237/n54 ) );
  NOR2_X1 \sub_237/U32  ( .A1(clkcnt[9]), .A2(clkcnt[10]), .ZN(\sub_237/n50 )
         );
  NAND2_X1 \sub_237/U31  ( .A1(\sub_237/n46 ), .A2(\sub_237/n47 ), .ZN(N83) );
  INV_X1 \sub_237/U30  ( .A(clkcnt[2]), .ZN(\sub_237/n42 ) );
  NAND2_X1 \sub_237/U29  ( .A1(\sub_237/n59 ), .A2(\sub_237/n48 ), .ZN(
        \sub_237/n46 ) );
  XNOR2_X1 \sub_237/U28  ( .A(\sub_237/n46 ), .B(\sub_237/n6 ), .ZN(N84) );
  NAND2_X1 \sub_237/U27  ( .A1(\sub_237/n45 ), .A2(\sub_237/n17 ), .ZN(
        \sub_237/n41 ) );
  NAND2_X1 \sub_237/U26  ( .A1(clkcnt[4]), .A2(\sub_237/n41 ), .ZN(
        \sub_237/n40 ) );
  NAND2_X1 \sub_237/U25  ( .A1(\sub_237/n39 ), .A2(\sub_237/n40 ), .ZN(N86) );
  NOR2_X1 \sub_237/U24  ( .A1(\sub_237/n31 ), .A2(\sub_237/n30 ), .ZN(
        \sub_237/n26 ) );
  NAND4_X1 \sub_237/U23  ( .A1(\sub_237/n59 ), .A2(\sub_237/n37 ), .A3(
        \sub_237/n18 ), .A4(\sub_237/n38 ), .ZN(\sub_237/n35 ) );
  INV_X1 \sub_237/U22  ( .A(clkcnt[0]), .ZN(\sub_237/n59 ) );
  NAND2_X1 \sub_237/U21  ( .A1(\sub_237/n3 ), .A2(\sub_237/n54 ), .ZN(
        \sub_237/n53 ) );
  NOR2_X1 \sub_237/U20  ( .A1(\sub_237/n12 ), .A2(\sub_237/n53 ), .ZN(
        \sub_237/n52 ) );
  NAND4_X1 \sub_237/U19  ( .A1(\sub_237/n55 ), .A2(\sub_237/n56 ), .A3(
        \sub_237/n57 ), .A4(\sub_237/n58 ), .ZN(\sub_237/n12 ) );
  OAI21_X1 \sub_237/U18  ( .B1(\sub_237/n44 ), .B2(\sub_237/n38 ), .A(
        \sub_237/n41 ), .ZN(N85) );
  OR2_X1 \sub_237/U17  ( .A1(clkcnt[8]), .A2(clkcnt[7]), .ZN(\sub_237/n9 ) );
  OR2_X1 \sub_237/U16  ( .A1(\sub_237/n9 ), .A2(clkcnt[6]), .ZN(\sub_237/n22 )
         );
  INV_X1 \sub_237/U15  ( .A(clkcnt[5]), .ZN(\sub_237/n25 ) );
  AND2_X1 \sub_237/U14  ( .A1(\sub_237/n45 ), .A2(\sub_237/n56 ), .ZN(
        \sub_237/n20 ) );
  NAND2_X1 \sub_237/U13  ( .A1(\sub_237/n21 ), .A2(\sub_237/n20 ), .ZN(
        \sub_237/n11 ) );
  NAND2_X1 \sub_237/U12  ( .A1(\sub_237/n11 ), .A2(\sub_237/n13 ), .ZN(N90) );
  XOR2_X1 \sub_237/U11  ( .A(\sub_237/n52 ), .B(clkcnt[10]), .Z(N92) );
  NOR2_X1 \sub_237/U10  ( .A1(\sub_237/n4 ), .A2(\sub_237/n49 ), .ZN(
        \sub_237/n8 ) );
  XOR2_X1 \sub_237/U9  ( .A(clkcnt[11]), .B(\sub_237/n8 ), .Z(N93) );
  CLKBUF_X1 \sub_237/U8  ( .A(clkcnt[7]), .Z(\sub_237/n5 ) );
  NAND4_X1 \sub_237/U7  ( .A1(\sub_237/n55 ), .A2(\sub_237/n56 ), .A3(
        \sub_237/n57 ), .A4(\sub_237/n58 ), .ZN(\sub_237/n4 ) );
  BUF_X1 \sub_237/U6  ( .A(clkcnt[2]), .Z(\sub_237/n6 ) );
  BUF_X1 \sub_237/U5  ( .A(clkcnt[8]), .Z(\sub_237/n7 ) );
  INV_X1 \sub_237/U4  ( .A(\sub_237/n7 ), .ZN(\sub_237/n3 ) );
  BUF_X1 \sub_237/U3  ( .A(\sub_237/n7 ), .Z(\sub_237/n2 ) );
  CLKBUF_X1 \sub_237/U2  ( .A(\sub_237/n59 ), .Z(N82) );
endmodule

