/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 03:03:38 2026
/////////////////////////////////////////////////////////////


module i2c_master_top ( wb_clk_i, wb_rst_i, arst_i, wb_adr_i, wb_dat_i, 
        wb_dat_o, wb_we_i, wb_stb_i, wb_cyc_i, wb_ack_o, wb_inta_o, scl_pad_i, 
        scl_pad_o, scl_padoen_o, sda_pad_i, sda_pad_o, sda_padoen_o );
  input [2:0] wb_adr_i;
  input [7:0] wb_dat_i;
  output [7:0] wb_dat_o;
  input wb_clk_i, wb_rst_i, arst_i, wb_we_i, wb_stb_i, wb_cyc_i, scl_pad_i,
         sda_pad_i;
  output wb_ack_o, wb_inta_o, scl_pad_o, scl_padoen_o, sda_pad_o, sda_padoen_o;
  wire   N20, sr_1, sr_0, N43, N44, N45, N46, N47, N48, N49, N50, done, i2c_al,
         irxack, N114, N115, N116, N117, N121, n1, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, \byte_controller/n143 ,
         \byte_controller/n142 , \byte_controller/n141 ,
         \byte_controller/n140 , \byte_controller/n139 ,
         \byte_controller/n138 , \byte_controller/n137 ,
         \byte_controller/n136 , \byte_controller/n135 ,
         \byte_controller/n134 , \byte_controller/n133 ,
         \byte_controller/n132 , \byte_controller/n131 ,
         \byte_controller/n130 , \byte_controller/n129 ,
         \byte_controller/n128 , \byte_controller/n127 ,
         \byte_controller/n126 , \byte_controller/n125 ,
         \byte_controller/n124 , \byte_controller/n123 ,
         \byte_controller/n122 , \byte_controller/n121 ,
         \byte_controller/n120 , \byte_controller/n119 ,
         \byte_controller/n118 , \byte_controller/n117 ,
         \byte_controller/n116 , \byte_controller/n115 ,
         \byte_controller/n114 , \byte_controller/n113 ,
         \byte_controller/n112 , \byte_controller/n111 ,
         \byte_controller/n110 , \byte_controller/n109 ,
         \byte_controller/n108 , \byte_controller/n107 ,
         \byte_controller/n106 , \byte_controller/n105 ,
         \byte_controller/n104 , \byte_controller/n103 ,
         \byte_controller/n102 , \byte_controller/n101 ,
         \byte_controller/n100 , \byte_controller/n90 , \byte_controller/n78 ,
         \byte_controller/n77 , \byte_controller/n76 , \byte_controller/n75 ,
         \byte_controller/n74 , \byte_controller/n73 , \byte_controller/n72 ,
         \byte_controller/n71 , \byte_controller/n70 , \byte_controller/n69 ,
         \byte_controller/n68 , \byte_controller/n67 , \byte_controller/n66 ,
         \byte_controller/n65 , \byte_controller/n64 , \byte_controller/n63 ,
         \byte_controller/n62 , \byte_controller/n61 , \byte_controller/n60 ,
         \byte_controller/n59 , \byte_controller/n58 , \byte_controller/n57 ,
         \byte_controller/n56 , \byte_controller/n55 , \byte_controller/n54 ,
         \byte_controller/n53 , \byte_controller/n52 , \byte_controller/n51 ,
         \byte_controller/n50 , \byte_controller/n49 , \byte_controller/n48 ,
         \byte_controller/n47 , \byte_controller/n46 , \byte_controller/n45 ,
         \byte_controller/n44 , \byte_controller/n43 , \byte_controller/n42 ,
         \byte_controller/n41 , \byte_controller/n40 , \byte_controller/n39 ,
         \byte_controller/n38 , \byte_controller/n37 , \byte_controller/n36 ,
         \byte_controller/n35 , \byte_controller/n34 , \byte_controller/n33 ,
         \byte_controller/n32 , \byte_controller/n31 , \byte_controller/n30 ,
         \byte_controller/n29 , \byte_controller/n26 , \byte_controller/n25 ,
         \byte_controller/n23 , \byte_controller/n21 , \byte_controller/n20 ,
         \byte_controller/n19 , \byte_controller/n17 , \byte_controller/n16 ,
         \byte_controller/n14 , \byte_controller/n13 , \byte_controller/n12 ,
         \byte_controller/n11 , \byte_controller/n10 , \byte_controller/n9 ,
         \byte_controller/n8 , \byte_controller/n7 , \byte_controller/n5 ,
         \byte_controller/n4 , \byte_controller/n3 , \byte_controller/n2 ,
         \byte_controller/n1 , \byte_controller/n99 , \byte_controller/n98 ,
         \byte_controller/n97 , \byte_controller/n96 , \byte_controller/n95 ,
         \byte_controller/n94 , \byte_controller/n93 , \byte_controller/n92 ,
         \byte_controller/n91 , \byte_controller/n89 , \byte_controller/n88 ,
         \byte_controller/n87 , \byte_controller/n86 , \byte_controller/n85 ,
         \byte_controller/n84 , \byte_controller/n83 , \byte_controller/n82 ,
         \byte_controller/n81 , \byte_controller/n80 , \byte_controller/n79 ,
         \byte_controller/n28 , \byte_controller/n27 , \byte_controller/n24 ,
         \byte_controller/n22 , \byte_controller/n18 , \byte_controller/n15 ,
         \byte_controller/n6 , \byte_controller/N107 , \byte_controller/N106 ,
         \byte_controller/N105 , \byte_controller/N104 ,
         \byte_controller/dcnt[1] , \byte_controller/ld ,
         \byte_controller/core_rxd , \byte_controller/core_txd ,
         \byte_controller/core_ack , \byte_controller/bit_controller/n300 ,
         \byte_controller/bit_controller/n299 ,
         \byte_controller/bit_controller/n298 ,
         \byte_controller/bit_controller/n297 ,
         \byte_controller/bit_controller/n296 ,
         \byte_controller/bit_controller/n295 ,
         \byte_controller/bit_controller/n294 ,
         \byte_controller/bit_controller/n293 ,
         \byte_controller/bit_controller/n292 ,
         \byte_controller/bit_controller/n291 ,
         \byte_controller/bit_controller/n290 ,
         \byte_controller/bit_controller/n289 ,
         \byte_controller/bit_controller/n288 ,
         \byte_controller/bit_controller/n287 ,
         \byte_controller/bit_controller/n286 ,
         \byte_controller/bit_controller/n285 ,
         \byte_controller/bit_controller/n284 ,
         \byte_controller/bit_controller/n283 ,
         \byte_controller/bit_controller/n282 ,
         \byte_controller/bit_controller/n281 ,
         \byte_controller/bit_controller/n280 ,
         \byte_controller/bit_controller/n279 ,
         \byte_controller/bit_controller/n278 ,
         \byte_controller/bit_controller/n277 ,
         \byte_controller/bit_controller/n276 ,
         \byte_controller/bit_controller/n275 ,
         \byte_controller/bit_controller/n274 ,
         \byte_controller/bit_controller/n273 ,
         \byte_controller/bit_controller/n272 ,
         \byte_controller/bit_controller/n271 ,
         \byte_controller/bit_controller/n270 ,
         \byte_controller/bit_controller/n269 ,
         \byte_controller/bit_controller/n268 ,
         \byte_controller/bit_controller/n267 ,
         \byte_controller/bit_controller/n266 ,
         \byte_controller/bit_controller/n265 ,
         \byte_controller/bit_controller/n264 ,
         \byte_controller/bit_controller/n263 ,
         \byte_controller/bit_controller/n262 ,
         \byte_controller/bit_controller/n261 ,
         \byte_controller/bit_controller/n260 ,
         \byte_controller/bit_controller/n259 ,
         \byte_controller/bit_controller/n258 ,
         \byte_controller/bit_controller/n257 ,
         \byte_controller/bit_controller/n256 ,
         \byte_controller/bit_controller/n255 ,
         \byte_controller/bit_controller/n254 ,
         \byte_controller/bit_controller/n253 ,
         \byte_controller/bit_controller/n252 ,
         \byte_controller/bit_controller/n251 ,
         \byte_controller/bit_controller/n250 ,
         \byte_controller/bit_controller/n249 ,
         \byte_controller/bit_controller/n248 ,
         \byte_controller/bit_controller/n247 ,
         \byte_controller/bit_controller/n246 ,
         \byte_controller/bit_controller/n245 ,
         \byte_controller/bit_controller/n244 ,
         \byte_controller/bit_controller/n243 ,
         \byte_controller/bit_controller/n242 ,
         \byte_controller/bit_controller/n241 ,
         \byte_controller/bit_controller/n240 ,
         \byte_controller/bit_controller/n239 ,
         \byte_controller/bit_controller/n238 ,
         \byte_controller/bit_controller/n237 ,
         \byte_controller/bit_controller/n236 ,
         \byte_controller/bit_controller/n235 ,
         \byte_controller/bit_controller/n234 ,
         \byte_controller/bit_controller/n233 ,
         \byte_controller/bit_controller/n232 ,
         \byte_controller/bit_controller/n231 ,
         \byte_controller/bit_controller/n230 ,
         \byte_controller/bit_controller/n229 ,
         \byte_controller/bit_controller/n228 ,
         \byte_controller/bit_controller/n227 ,
         \byte_controller/bit_controller/n226 ,
         \byte_controller/bit_controller/n225 ,
         \byte_controller/bit_controller/n224 ,
         \byte_controller/bit_controller/n223 ,
         \byte_controller/bit_controller/n222 ,
         \byte_controller/bit_controller/n221 ,
         \byte_controller/bit_controller/n220 ,
         \byte_controller/bit_controller/n219 ,
         \byte_controller/bit_controller/n218 ,
         \byte_controller/bit_controller/n217 ,
         \byte_controller/bit_controller/n216 ,
         \byte_controller/bit_controller/n215 ,
         \byte_controller/bit_controller/n214 ,
         \byte_controller/bit_controller/n213 ,
         \byte_controller/bit_controller/n212 ,
         \byte_controller/bit_controller/n211 ,
         \byte_controller/bit_controller/n210 ,
         \byte_controller/bit_controller/n209 ,
         \byte_controller/bit_controller/n208 ,
         \byte_controller/bit_controller/n207 ,
         \byte_controller/bit_controller/n206 ,
         \byte_controller/bit_controller/n205 ,
         \byte_controller/bit_controller/n204 ,
         \byte_controller/bit_controller/n203 ,
         \byte_controller/bit_controller/n202 ,
         \byte_controller/bit_controller/n201 ,
         \byte_controller/bit_controller/n200 ,
         \byte_controller/bit_controller/n199 ,
         \byte_controller/bit_controller/n198 ,
         \byte_controller/bit_controller/n197 ,
         \byte_controller/bit_controller/n196 ,
         \byte_controller/bit_controller/n195 ,
         \byte_controller/bit_controller/n194 ,
         \byte_controller/bit_controller/n193 ,
         \byte_controller/bit_controller/n192 ,
         \byte_controller/bit_controller/n191 ,
         \byte_controller/bit_controller/n190 ,
         \byte_controller/bit_controller/n189 ,
         \byte_controller/bit_controller/n188 ,
         \byte_controller/bit_controller/n187 ,
         \byte_controller/bit_controller/n186 ,
         \byte_controller/bit_controller/n185 ,
         \byte_controller/bit_controller/n184 ,
         \byte_controller/bit_controller/n183 ,
         \byte_controller/bit_controller/n182 ,
         \byte_controller/bit_controller/n181 ,
         \byte_controller/bit_controller/n180 ,
         \byte_controller/bit_controller/n179 ,
         \byte_controller/bit_controller/n178 ,
         \byte_controller/bit_controller/n174 ,
         \byte_controller/bit_controller/n173 ,
         \byte_controller/bit_controller/n172 ,
         \byte_controller/bit_controller/n171 ,
         \byte_controller/bit_controller/n170 ,
         \byte_controller/bit_controller/n169 ,
         \byte_controller/bit_controller/n168 ,
         \byte_controller/bit_controller/n167 ,
         \byte_controller/bit_controller/n117 ,
         \byte_controller/bit_controller/n116 ,
         \byte_controller/bit_controller/n115 ,
         \byte_controller/bit_controller/n114 ,
         \byte_controller/bit_controller/n113 ,
         \byte_controller/bit_controller/n111 ,
         \byte_controller/bit_controller/n109 ,
         \byte_controller/bit_controller/n108 ,
         \byte_controller/bit_controller/n107 ,
         \byte_controller/bit_controller/n106 ,
         \byte_controller/bit_controller/n105 ,
         \byte_controller/bit_controller/n104 ,
         \byte_controller/bit_controller/n103 ,
         \byte_controller/bit_controller/n100 ,
         \byte_controller/bit_controller/n99 ,
         \byte_controller/bit_controller/n93 ,
         \byte_controller/bit_controller/n92 ,
         \byte_controller/bit_controller/n91 ,
         \byte_controller/bit_controller/n90 ,
         \byte_controller/bit_controller/n89 ,
         \byte_controller/bit_controller/n88 ,
         \byte_controller/bit_controller/n87 ,
         \byte_controller/bit_controller/n86 ,
         \byte_controller/bit_controller/n85 ,
         \byte_controller/bit_controller/n84 ,
         \byte_controller/bit_controller/n83 ,
         \byte_controller/bit_controller/n82 ,
         \byte_controller/bit_controller/n81 ,
         \byte_controller/bit_controller/n80 ,
         \byte_controller/bit_controller/n79 ,
         \byte_controller/bit_controller/n78 ,
         \byte_controller/bit_controller/n77 ,
         \byte_controller/bit_controller/n76 ,
         \byte_controller/bit_controller/n75 ,
         \byte_controller/bit_controller/n74 ,
         \byte_controller/bit_controller/n73 ,
         \byte_controller/bit_controller/n72 ,
         \byte_controller/bit_controller/n71 ,
         \byte_controller/bit_controller/n70 ,
         \byte_controller/bit_controller/n69 ,
         \byte_controller/bit_controller/n68 ,
         \byte_controller/bit_controller/n67 ,
         \byte_controller/bit_controller/n66 ,
         \byte_controller/bit_controller/n65 ,
         \byte_controller/bit_controller/n64 ,
         \byte_controller/bit_controller/n63 ,
         \byte_controller/bit_controller/n62 ,
         \byte_controller/bit_controller/n61 ,
         \byte_controller/bit_controller/n60 ,
         \byte_controller/bit_controller/n59 ,
         \byte_controller/bit_controller/n58 ,
         \byte_controller/bit_controller/n57 ,
         \byte_controller/bit_controller/n56 ,
         \byte_controller/bit_controller/n55 ,
         \byte_controller/bit_controller/n54 ,
         \byte_controller/bit_controller/n53 ,
         \byte_controller/bit_controller/n52 ,
         \byte_controller/bit_controller/n51 ,
         \byte_controller/bit_controller/n50 ,
         \byte_controller/bit_controller/n49 ,
         \byte_controller/bit_controller/n48 ,
         \byte_controller/bit_controller/n47 ,
         \byte_controller/bit_controller/n46 ,
         \byte_controller/bit_controller/n45 ,
         \byte_controller/bit_controller/n44 ,
         \byte_controller/bit_controller/n43 ,
         \byte_controller/bit_controller/n42 ,
         \byte_controller/bit_controller/n41 ,
         \byte_controller/bit_controller/n40 ,
         \byte_controller/bit_controller/n39 ,
         \byte_controller/bit_controller/n38 ,
         \byte_controller/bit_controller/n37 ,
         \byte_controller/bit_controller/n36 ,
         \byte_controller/bit_controller/n35 ,
         \byte_controller/bit_controller/n34 ,
         \byte_controller/bit_controller/n33 ,
         \byte_controller/bit_controller/n32 ,
         \byte_controller/bit_controller/n31 ,
         \byte_controller/bit_controller/n30 ,
         \byte_controller/bit_controller/n29 ,
         \byte_controller/bit_controller/n28 ,
         \byte_controller/bit_controller/n27 ,
         \byte_controller/bit_controller/n26 ,
         \byte_controller/bit_controller/n25 ,
         \byte_controller/bit_controller/n24 ,
         \byte_controller/bit_controller/n23 ,
         \byte_controller/bit_controller/n22 ,
         \byte_controller/bit_controller/n21 ,
         \byte_controller/bit_controller/n20 ,
         \byte_controller/bit_controller/n19 ,
         \byte_controller/bit_controller/n18 ,
         \byte_controller/bit_controller/n17 ,
         \byte_controller/bit_controller/n16 ,
         \byte_controller/bit_controller/n15 ,
         \byte_controller/bit_controller/n14 ,
         \byte_controller/bit_controller/n13 ,
         \byte_controller/bit_controller/n12 ,
         \byte_controller/bit_controller/n11 ,
         \byte_controller/bit_controller/n10 ,
         \byte_controller/bit_controller/n9 ,
         \byte_controller/bit_controller/n8 ,
         \byte_controller/bit_controller/n7 ,
         \byte_controller/bit_controller/n6 ,
         \byte_controller/bit_controller/n5 ,
         \byte_controller/bit_controller/n4 ,
         \byte_controller/bit_controller/n3 ,
         \byte_controller/bit_controller/n2 ,
         \byte_controller/bit_controller/n1 ,
         \byte_controller/bit_controller/n177 ,
         \byte_controller/bit_controller/n176 ,
         \byte_controller/bit_controller/n175 ,
         \byte_controller/bit_controller/n166 ,
         \byte_controller/bit_controller/n165 ,
         \byte_controller/bit_controller/n164 ,
         \byte_controller/bit_controller/n163 ,
         \byte_controller/bit_controller/n162 ,
         \byte_controller/bit_controller/n161 ,
         \byte_controller/bit_controller/n160 ,
         \byte_controller/bit_controller/n159 ,
         \byte_controller/bit_controller/n158 ,
         \byte_controller/bit_controller/n157 ,
         \byte_controller/bit_controller/n156 ,
         \byte_controller/bit_controller/n155 ,
         \byte_controller/bit_controller/n154 ,
         \byte_controller/bit_controller/n153 ,
         \byte_controller/bit_controller/n152 ,
         \byte_controller/bit_controller/n151 ,
         \byte_controller/bit_controller/n150 ,
         \byte_controller/bit_controller/n149 ,
         \byte_controller/bit_controller/n148 ,
         \byte_controller/bit_controller/n147 ,
         \byte_controller/bit_controller/n146 ,
         \byte_controller/bit_controller/n145 ,
         \byte_controller/bit_controller/n144 ,
         \byte_controller/bit_controller/n143 ,
         \byte_controller/bit_controller/n142 ,
         \byte_controller/bit_controller/n141 ,
         \byte_controller/bit_controller/n140 ,
         \byte_controller/bit_controller/n139 ,
         \byte_controller/bit_controller/n138 ,
         \byte_controller/bit_controller/n137 ,
         \byte_controller/bit_controller/n136 ,
         \byte_controller/bit_controller/n135 ,
         \byte_controller/bit_controller/n134 ,
         \byte_controller/bit_controller/n133 ,
         \byte_controller/bit_controller/n132 ,
         \byte_controller/bit_controller/n131 ,
         \byte_controller/bit_controller/n130 ,
         \byte_controller/bit_controller/n129 ,
         \byte_controller/bit_controller/n128 ,
         \byte_controller/bit_controller/n127 ,
         \byte_controller/bit_controller/n126 ,
         \byte_controller/bit_controller/n125 ,
         \byte_controller/bit_controller/n124 ,
         \byte_controller/bit_controller/n123 ,
         \byte_controller/bit_controller/n122 ,
         \byte_controller/bit_controller/n121 ,
         \byte_controller/bit_controller/n120 ,
         \byte_controller/bit_controller/n119 ,
         \byte_controller/bit_controller/n118 ,
         \byte_controller/bit_controller/n112 ,
         \byte_controller/bit_controller/n110 ,
         \byte_controller/bit_controller/n102 ,
         \byte_controller/bit_controller/n101 ,
         \byte_controller/bit_controller/n98 ,
         \byte_controller/bit_controller/n97 ,
         \byte_controller/bit_controller/n96 ,
         \byte_controller/bit_controller/n95 ,
         \byte_controller/bit_controller/n94 ,
         \byte_controller/bit_controller/N155 ,
         \byte_controller/bit_controller/N67 ,
         \byte_controller/bit_controller/N59 ,
         \byte_controller/bit_controller/N57 ,
         \byte_controller/bit_controller/N56 ,
         \byte_controller/bit_controller/sto_condition ,
         \byte_controller/bit_controller/N53 ,
         \byte_controller/bit_controller/N51 ,
         \byte_controller/bit_controller/N50 ;
  wire   [15:0] prer;
  wire   [7:0] ctr;
  wire   [7:0] rxr;
  wire   [7:5] sr;
  wire   [7:0] txr;
  wire   [7:0] cr;
  wire   [4:0] \byte_controller/c_state ;
  wire   [3:0] \byte_controller/core_cmd ;
  wire   [15:0] \byte_controller/bit_controller/cnt_hold ;
  assign scl_pad_o = 1'b0;
  assign sda_pad_o = 1'b0;

  DFF_X1 wb_ack_o_reg ( .D(N20), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \ctr_reg[7]  ( .D(n146), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[6]  ( .D(n145), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[5]  ( .D(n144), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n5) );
  DFFR_X1 \ctr_reg[4]  ( .D(n143), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[3]  ( .D(n142), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n7) );
  DFFR_X1 \ctr_reg[2]  ( .D(n141), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n8) );
  DFFR_X1 \ctr_reg[1]  ( .D(n140), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n9) );
  DFFR_X1 \ctr_reg[0]  ( .D(n139), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n10) );
  DFFS_X1 \prer_reg[15]  ( .D(n130), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[14]  ( .D(n129), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[13]  ( .D(n128), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n21) );
  DFFS_X1 \prer_reg[12]  ( .D(n127), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n22) );
  DFFS_X1 \prer_reg[11]  ( .D(n126), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n23) );
  DFFS_X1 \prer_reg[10]  ( .D(n125), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n24) );
  DFFS_X1 \prer_reg[9]  ( .D(n124), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n25) );
  DFFS_X1 \prer_reg[8]  ( .D(n123), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n26) );
  DFFS_X1 \prer_reg[7]  ( .D(n122), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n27) );
  DFFS_X1 \prer_reg[6]  ( .D(n121), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n28) );
  DFFS_X1 \prer_reg[5]  ( .D(n120), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n29) );
  DFFS_X1 \prer_reg[4]  ( .D(n119), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n30) );
  DFFS_X1 \prer_reg[3]  ( .D(n118), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n31) );
  DFFS_X1 \prer_reg[2]  ( .D(n117), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n32) );
  DFFS_X1 \prer_reg[1]  ( .D(n116), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n33) );
  DFFS_X1 \prer_reg[0]  ( .D(n115), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n34) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N49), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFFR_X1 \cr_reg[5]  ( .D(n112), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n37) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N47), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N46), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N45), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFR_X1 al_reg ( .D(N114), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N48), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N115), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N50), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N116), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N44), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFFR_X1 irq_flag_reg ( .D(N117), .CK(wb_clk_i), .RN(arst_i), .Q(sr_0), .QN(
        n43) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N43), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N121), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 \txr_reg[4]  ( .D(n135), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n14) );
  DFFR_X1 \txr_reg[3]  ( .D(n134), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n15) );
  DFFR_X1 \txr_reg[2]  ( .D(n133), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n16) );
  DFFR_X1 \txr_reg[7]  ( .D(n138), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n11) );
  DFFR_X1 \txr_reg[6]  ( .D(n137), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n12) );
  DFFR_X1 \txr_reg[5]  ( .D(n136), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n13) );
  DFFR_X1 \txr_reg[1]  ( .D(n132), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n17) );
  DFFR_X1 \txr_reg[0]  ( .D(n131), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n18) );
  DFFR_X1 \cr_reg[3]  ( .D(n114), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n39) );
  DFFR_X1 \cr_reg[0]  ( .D(n107), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n42) );
  DFFR_X1 \cr_reg[2]  ( .D(n109), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]), .QN(
        n40) );
  DFFR_X1 \cr_reg[7]  ( .D(n110), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n35) );
  DFFR_X1 \cr_reg[6]  ( .D(n111), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n36) );
  DFFR_X1 \cr_reg[4]  ( .D(n113), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n38) );
  DFFR_X1 \cr_reg[1]  ( .D(n108), .CK(wb_clk_i), .RN(arst_i), .QN(n41) );
  AND2_X1 U121 ( .A1(n184), .A2(n164), .ZN(n147) );
  AND2_X1 U122 ( .A1(n184), .A2(n152), .ZN(n148) );
  AND3_X1 U123 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n149) );
  INV_X1 U124 ( .A(n3), .ZN(n150) );
  INV_X1 U125 ( .A(n156), .ZN(n184) );
  NAND3_X1 U126 ( .A1(n189), .A2(n173), .A3(n188), .ZN(n230) );
  NOR2_X1 U127 ( .A1(done), .A2(i2c_al), .ZN(n151) );
  INV_X1 U128 ( .A(wb_rst_i), .ZN(n221) );
  AND3_X1 U129 ( .A1(wb_adr_i[0]), .A2(n173), .A3(n188), .ZN(n152) );
  INV_X1 U131 ( .A(wb_dat_i[0]), .ZN(n185) );
  NAND2_X1 U132 ( .A1(n149), .A2(n221), .ZN(n156) );
  INV_X1 U133 ( .A(wb_adr_i[2]), .ZN(n173) );
  NAND3_X1 U134 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[1]), .A3(n173), .ZN(n187) );
  OAI21_X1 U135 ( .B1(n187), .B2(n156), .A(n221), .ZN(n154) );
  NAND2_X1 U136 ( .A1(n184), .A2(n154), .ZN(n155) );
  OAI22_X1 U137 ( .A1(n185), .A2(n155), .B1(n18), .B2(n154), .ZN(n131) );
  INV_X1 U138 ( .A(wb_dat_i[1]), .ZN(n193) );
  OAI22_X1 U139 ( .A1(n193), .A2(n155), .B1(n17), .B2(n154), .ZN(n132) );
  INV_X1 U140 ( .A(wb_dat_i[2]), .ZN(n199) );
  OAI22_X1 U141 ( .A1(n199), .A2(n155), .B1(n16), .B2(n154), .ZN(n133) );
  INV_X1 U142 ( .A(wb_dat_i[3]), .ZN(n202) );
  OAI22_X1 U143 ( .A1(n202), .A2(n155), .B1(n15), .B2(n154), .ZN(n134) );
  INV_X1 U144 ( .A(wb_dat_i[4]), .ZN(n205) );
  OAI22_X1 U145 ( .A1(n205), .A2(n155), .B1(n14), .B2(n154), .ZN(n135) );
  INV_X1 U146 ( .A(wb_dat_i[5]), .ZN(n213) );
  OAI22_X1 U147 ( .A1(n213), .A2(n155), .B1(n13), .B2(n154), .ZN(n136) );
  INV_X1 U148 ( .A(wb_dat_i[6]), .ZN(n183) );
  OAI22_X1 U149 ( .A1(n183), .A2(n155), .B1(n12), .B2(n154), .ZN(n137) );
  INV_X1 U150 ( .A(wb_dat_i[7]), .ZN(n181) );
  OAI22_X1 U151 ( .A1(n181), .A2(n155), .B1(n11), .B2(n154), .ZN(n138) );
  INV_X1 U152 ( .A(wb_adr_i[0]), .ZN(n189) );
  NAND3_X1 U153 ( .A1(wb_adr_i[1]), .A2(n189), .A3(n173), .ZN(n186) );
  OAI21_X1 U154 ( .B1(n186), .B2(n156), .A(n221), .ZN(n212) );
  NAND2_X1 U155 ( .A1(n184), .A2(n212), .ZN(n214) );
  OAI22_X1 U156 ( .A1(n214), .A2(n181), .B1(n3), .B2(n212), .ZN(n146) );
  INV_X1 U157 ( .A(n3), .ZN(n157) );
  NAND2_X1 U158 ( .A1(n184), .A2(n157), .ZN(n160) );
  INV_X1 U159 ( .A(wb_adr_i[1]), .ZN(n188) );
  NAND3_X1 U160 ( .A1(wb_adr_i[2]), .A2(n189), .A3(n188), .ZN(n159) );
  INV_X1 U161 ( .A(n159), .ZN(n226) );
  NAND3_X1 U162 ( .A1(ctr[7]), .A2(n226), .A3(n184), .ZN(n198) );
  INV_X1 U163 ( .A(n198), .ZN(n158) );
  OAI33_X1 U164 ( .A1(n160), .A2(n159), .A3(n202), .B1(n39), .B2(wb_rst_i), 
        .B3(n158), .ZN(n114) );
  NAND3_X1 U165 ( .A1(n184), .A2(n226), .A3(ctr[7]), .ZN(n161) );
  OAI211_X1 U166 ( .C1(n149), .C2(n151), .A(n161), .B(n221), .ZN(n162) );
  NAND2_X1 U167 ( .A1(n184), .A2(n162), .ZN(n163) );
  OAI22_X1 U168 ( .A1(n205), .A2(n163), .B1(n38), .B2(n162), .ZN(n113) );
  OAI22_X1 U169 ( .A1(n213), .A2(n163), .B1(n37), .B2(n162), .ZN(n112) );
  OAI22_X1 U170 ( .A1(n183), .A2(n163), .B1(n36), .B2(n162), .ZN(n111) );
  OAI22_X1 U171 ( .A1(n163), .A2(n181), .B1(n35), .B2(n162), .ZN(n110) );
  INV_X1 U172 ( .A(n230), .ZN(n164) );
  MUX2_X1 U173 ( .A(n34), .B(n185), .S(n147), .Z(n165) );
  NAND2_X1 U174 ( .A1(n221), .A2(n165), .ZN(n115) );
  MUX2_X1 U175 ( .A(n33), .B(n193), .S(n147), .Z(n166) );
  NAND2_X1 U176 ( .A1(n221), .A2(n166), .ZN(n116) );
  MUX2_X1 U177 ( .A(n32), .B(n199), .S(n147), .Z(n167) );
  NAND2_X1 U178 ( .A1(n221), .A2(n167), .ZN(n117) );
  MUX2_X1 U179 ( .A(n31), .B(n202), .S(n147), .Z(n168) );
  NAND2_X1 U180 ( .A1(n221), .A2(n168), .ZN(n118) );
  MUX2_X1 U181 ( .A(n30), .B(n205), .S(n147), .Z(n169) );
  NAND2_X1 U182 ( .A1(n221), .A2(n169), .ZN(n119) );
  MUX2_X1 U183 ( .A(n29), .B(n213), .S(n147), .Z(n170) );
  NAND2_X1 U184 ( .A1(n221), .A2(n170), .ZN(n120) );
  MUX2_X1 U185 ( .A(n28), .B(n183), .S(n147), .Z(n171) );
  NAND2_X1 U186 ( .A1(n221), .A2(n171), .ZN(n121) );
  MUX2_X1 U187 ( .A(n27), .B(n181), .S(n147), .Z(n172) );
  NAND2_X1 U188 ( .A1(n221), .A2(n172), .ZN(n122) );
  MUX2_X1 U189 ( .A(n26), .B(n185), .S(n148), .Z(n174) );
  NAND2_X1 U190 ( .A1(n221), .A2(n174), .ZN(n123) );
  MUX2_X1 U191 ( .A(n25), .B(n193), .S(n148), .Z(n175) );
  NAND2_X1 U192 ( .A1(n221), .A2(n175), .ZN(n124) );
  MUX2_X1 U193 ( .A(n24), .B(n199), .S(n148), .Z(n176) );
  NAND2_X1 U194 ( .A1(n221), .A2(n176), .ZN(n125) );
  MUX2_X1 U195 ( .A(n23), .B(n202), .S(n148), .Z(n177) );
  NAND2_X1 U196 ( .A1(n221), .A2(n177), .ZN(n126) );
  MUX2_X1 U197 ( .A(n22), .B(n205), .S(n148), .Z(n178) );
  NAND2_X1 U198 ( .A1(n221), .A2(n178), .ZN(n127) );
  MUX2_X1 U199 ( .A(n21), .B(n213), .S(n148), .Z(n179) );
  NAND2_X1 U200 ( .A1(n221), .A2(n179), .ZN(n128) );
  MUX2_X1 U201 ( .A(n20), .B(n183), .S(n148), .Z(n180) );
  NAND2_X1 U202 ( .A1(n221), .A2(n180), .ZN(n129) );
  MUX2_X1 U203 ( .A(n19), .B(n181), .S(n148), .Z(n182) );
  NAND2_X1 U204 ( .A1(n221), .A2(n182), .ZN(n130) );
  OAI22_X1 U205 ( .A1(n214), .A2(n183), .B1(n4), .B2(n212), .ZN(n145) );
  NAND2_X1 U206 ( .A1(n184), .A2(n198), .ZN(n197) );
  OAI22_X1 U207 ( .A1(n198), .A2(n185), .B1(n42), .B2(n197), .ZN(n107) );
  AOI211_X1 U208 ( .C1(n43), .C2(n151), .A(cr[0]), .B(wb_rst_i), .ZN(N117) );
  NOR3_X1 U209 ( .A1(n43), .A2(n4), .A3(wb_rst_i), .ZN(N121) );
  AND3_X1 U210 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N20) );
  OAI22_X1 U211 ( .A1(n214), .A2(n185), .B1(n10), .B2(n212), .ZN(n139) );
  INV_X1 U212 ( .A(n186), .ZN(n222) );
  AOI22_X1 U213 ( .A1(prer[8]), .A2(n152), .B1(ctr[0]), .B2(n222), .ZN(n192)
         );
  INV_X1 U214 ( .A(n187), .ZN(n227) );
  NAND3_X1 U215 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[2]), .A3(n188), .ZN(n224) );
  NAND3_X1 U216 ( .A1(wb_adr_i[2]), .A2(wb_adr_i[1]), .A3(n189), .ZN(n223) );
  OAI22_X1 U217 ( .A1(n18), .A2(n224), .B1(n42), .B2(n223), .ZN(n190) );
  AOI221_X1 U218 ( .B1(rxr[0]), .B2(n227), .C1(sr_0), .C2(n226), .A(n190), 
        .ZN(n191) );
  OAI211_X1 U219 ( .C1(n34), .C2(n230), .A(n192), .B(n191), .ZN(N43) );
  OAI22_X1 U220 ( .A1(n198), .A2(n193), .B1(n41), .B2(n197), .ZN(n108) );
  AOI21_X1 U221 ( .B1(n37), .B2(n38), .A(wb_rst_i), .ZN(N116) );
  OAI22_X1 U222 ( .A1(n214), .A2(n193), .B1(n9), .B2(n212), .ZN(n140) );
  AOI22_X1 U223 ( .A1(prer[9]), .A2(n152), .B1(ctr[1]), .B2(n222), .ZN(n196)
         );
  OAI22_X1 U224 ( .A1(n17), .A2(n224), .B1(n41), .B2(n223), .ZN(n194) );
  AOI221_X1 U225 ( .B1(rxr[1]), .B2(n227), .C1(sr_1), .C2(n226), .A(n194), 
        .ZN(n195) );
  OAI211_X1 U226 ( .C1(n33), .C2(n230), .A(n196), .B(n195), .ZN(N44) );
  OAI22_X1 U227 ( .A1(n199), .A2(n198), .B1(n40), .B2(n197), .ZN(n109) );
  OAI22_X1 U228 ( .A1(n214), .A2(n199), .B1(n8), .B2(n212), .ZN(n141) );
  AOI22_X1 U229 ( .A1(prer[10]), .A2(n152), .B1(ctr[2]), .B2(n222), .ZN(n201)
         );
  INV_X1 U230 ( .A(n223), .ZN(n207) );
  INV_X1 U231 ( .A(n224), .ZN(n206) );
  AOI222_X1 U232 ( .A1(rxr[2]), .A2(n227), .B1(cr[2]), .B2(n207), .C1(txr[2]), 
        .C2(n206), .ZN(n200) );
  OAI211_X1 U233 ( .C1(n32), .C2(n230), .A(n201), .B(n200), .ZN(N45) );
  OAI22_X1 U234 ( .A1(n214), .A2(n202), .B1(n7), .B2(n212), .ZN(n142) );
  AOI22_X1 U235 ( .A1(prer[11]), .A2(n152), .B1(ctr[3]), .B2(n222), .ZN(n204)
         );
  AOI222_X1 U236 ( .A1(rxr[3]), .A2(n227), .B1(cr[3]), .B2(n207), .C1(txr[3]), 
        .C2(n206), .ZN(n203) );
  OAI211_X1 U237 ( .C1(n31), .C2(n230), .A(n204), .B(n203), .ZN(N46) );
  OAI22_X1 U238 ( .A1(n214), .A2(n205), .B1(n6), .B2(n212), .ZN(n143) );
  AOI22_X1 U239 ( .A1(prer[12]), .A2(n152), .B1(ctr[4]), .B2(n222), .ZN(n209)
         );
  AOI222_X1 U240 ( .A1(rxr[4]), .A2(n227), .B1(cr[4]), .B2(n207), .C1(txr[4]), 
        .C2(n206), .ZN(n208) );
  OAI211_X1 U241 ( .C1(n30), .C2(n230), .A(n209), .B(n208), .ZN(N47) );
  NAND2_X1 U242 ( .A1(n35), .A2(sr[5]), .ZN(n211) );
  INV_X1 U243 ( .A(i2c_al), .ZN(n210) );
  AOI21_X1 U244 ( .B1(n211), .B2(n210), .A(wb_rst_i), .ZN(N114) );
  OAI22_X1 U245 ( .A1(n214), .A2(n213), .B1(n5), .B2(n212), .ZN(n144) );
  AOI22_X1 U246 ( .A1(prer[13]), .A2(n152), .B1(ctr[5]), .B2(n222), .ZN(n217)
         );
  OAI22_X1 U247 ( .A1(n13), .A2(n224), .B1(n37), .B2(n223), .ZN(n215) );
  AOI221_X1 U248 ( .B1(rxr[5]), .B2(n227), .C1(sr[5]), .C2(n226), .A(n215), 
        .ZN(n216) );
  OAI211_X1 U249 ( .C1(n29), .C2(n230), .A(n217), .B(n216), .ZN(N48) );
  AOI22_X1 U250 ( .A1(prer[14]), .A2(n152), .B1(ctr[6]), .B2(n222), .ZN(n220)
         );
  OAI22_X1 U251 ( .A1(n12), .A2(n224), .B1(n36), .B2(n223), .ZN(n218) );
  AOI221_X1 U252 ( .B1(rxr[6]), .B2(n227), .C1(sr[6]), .C2(n226), .A(n218), 
        .ZN(n219) );
  OAI211_X1 U253 ( .C1(n28), .C2(n230), .A(n220), .B(n219), .ZN(N49) );
  AND2_X1 U254 ( .A1(irxack), .A2(n221), .ZN(N115) );
  AOI22_X1 U255 ( .A1(prer[15]), .A2(n152), .B1(ctr[7]), .B2(n222), .ZN(n229)
         );
  OAI22_X1 U256 ( .A1(n11), .A2(n224), .B1(n35), .B2(n223), .ZN(n225) );
  AOI221_X1 U257 ( .B1(rxr[7]), .B2(n227), .C1(sr[7]), .C2(n226), .A(n225), 
        .ZN(n228) );
  OAI211_X1 U258 ( .C1(n27), .C2(n230), .A(n229), .B(n228), .ZN(N50) );
  NOR2_X1 \byte_controller/U125  ( .A1(\byte_controller/n142 ), .A2(
        \byte_controller/n141 ), .ZN(\byte_controller/n79 ) );
  NAND4_X1 \byte_controller/U124  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n135 ), .A3(\byte_controller/n137 ), .A4(
        \byte_controller/n136 ), .ZN(\byte_controller/n80 ) );
  OAI211_X1 \byte_controller/U123  ( .C1(\byte_controller/n132 ), .C2(
        \byte_controller/n133 ), .A(\byte_controller/core_cmd [3]), .B(
        \byte_controller/n9 ), .ZN(\byte_controller/n135 ) );
  NAND4_X1 \byte_controller/U122  ( .A1(\byte_controller/n13 ), .A2(
        \byte_controller/n9 ), .A3(\byte_controller/n130 ), .A4(
        \byte_controller/n129 ), .ZN(\byte_controller/n137 ) );
  NAND4_X1 \byte_controller/U121  ( .A1(\byte_controller/n126 ), .A2(
        \byte_controller/n127 ), .A3(\byte_controller/n128 ), .A4(
        \byte_controller/n125 ), .ZN(\byte_controller/n81 ) );
  OAI211_X1 \byte_controller/U120  ( .C1(\byte_controller/n132 ), .C2(
        \byte_controller/n133 ), .A(\byte_controller/core_cmd [2]), .B(
        \byte_controller/n9 ), .ZN(\byte_controller/n126 ) );
  INV_X1 \byte_controller/U119  ( .A(\byte_controller/n124 ), .ZN(
        \byte_controller/n132 ) );
  INV_X1 \byte_controller/U118  ( .A(\byte_controller/n123 ), .ZN(
        \byte_controller/n133 ) );
  NAND3_X1 \byte_controller/U117  ( .A1(\byte_controller/n20 ), .A2(
        \byte_controller/n130 ), .A3(\byte_controller/n129 ), .ZN(
        \byte_controller/n128 ) );
  OAI22_X1 \byte_controller/U116  ( .A1(\byte_controller/n11 ), .A2(
        \byte_controller/n122 ), .B1(\byte_controller/n17 ), .B2(
        \byte_controller/n28 ), .ZN(\byte_controller/n82 ) );
  OAI21_X1 \byte_controller/U115  ( .B1(\byte_controller/n17 ), .B2(
        \byte_controller/n121 ), .A(\byte_controller/n120 ), .ZN(
        \byte_controller/n83 ) );
  AOI21_X1 \byte_controller/U114  ( .B1(\byte_controller/n119 ), .B2(
        \byte_controller/n138 ), .A(\byte_controller/n141 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U113  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/n118 ), .ZN(\byte_controller/n138 ) );
  AOI22_X1 \byte_controller/U112  ( .A1(cr[3]), .A2(\byte_controller/n117 ), 
        .B1(rxr[7]), .B2(\byte_controller/n116 ), .ZN(\byte_controller/n119 )
         );
  NAND3_X1 \byte_controller/U111  ( .A1(\byte_controller/n7 ), .A2(
        \byte_controller/n4 ), .A3(\byte_controller/n113 ), .ZN(
        \byte_controller/n116 ) );
  AOI221_X1 \byte_controller/U110  ( .B1(\byte_controller/n112 ), .B2(
        \byte_controller/n111 ), .C1(\byte_controller/n110 ), .C2(
        \byte_controller/n109 ), .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n113 ) );
  OAI21_X1 \byte_controller/U109  ( .B1(\byte_controller/n24 ), .B2(
        \byte_controller/n110 ), .A(\byte_controller/n112 ), .ZN(
        \byte_controller/n117 ) );
  OAI221_X1 \byte_controller/U108  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n106 ), .A(\byte_controller/n105 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U107  ( .A1(txr[7]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n105 ) );
  OAI221_X1 \byte_controller/U106  ( .B1(\byte_controller/n106 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n103 ), .A(\byte_controller/n102 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U105  ( .A1(txr[6]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n102 ) );
  OAI221_X1 \byte_controller/U104  ( .B1(\byte_controller/n103 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n101 ), .A(\byte_controller/n100 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U103  ( .A1(txr[5]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n100 ) );
  OAI221_X1 \byte_controller/U102  ( .B1(\byte_controller/n101 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n90 ), .A(\byte_controller/n78 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U101  ( .A1(txr[4]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n78 ) );
  OAI221_X1 \byte_controller/U100  ( .B1(\byte_controller/n90 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n77 ), .A(\byte_controller/n76 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U99  ( .A1(txr[3]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n76 ) );
  OAI221_X1 \byte_controller/U98  ( .B1(\byte_controller/n77 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n75 ), .A(\byte_controller/n74 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U97  ( .A1(txr[2]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n74 ) );
  OAI221_X1 \byte_controller/U96  ( .B1(\byte_controller/n75 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n73 ), .A(\byte_controller/n72 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U95  ( .A1(txr[1]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n72 ) );
  OAI221_X1 \byte_controller/U94  ( .B1(\byte_controller/n73 ), .B2(
        \byte_controller/n108 ), .C1(\byte_controller/n107 ), .C2(
        \byte_controller/n139 ), .A(\byte_controller/n71 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U93  ( .A1(txr[0]), .A2(\byte_controller/n104 ), 
        .ZN(\byte_controller/n71 ) );
  INV_X1 \byte_controller/U92  ( .A(\byte_controller/n70 ), .ZN(
        \byte_controller/n104 ) );
  INV_X1 \byte_controller/U91  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n139 ) );
  NAND3_X1 \byte_controller/U90  ( .A1(\byte_controller/n107 ), .A2(
        \byte_controller/n69 ), .A3(\byte_controller/n70 ), .ZN(
        \byte_controller/n108 ) );
  NAND3_X1 \byte_controller/U89  ( .A1(\byte_controller/n136 ), .A2(
        \byte_controller/n127 ), .A3(\byte_controller/n68 ), .ZN(
        \byte_controller/n84 ) );
  NAND3_X1 \byte_controller/U88  ( .A1(\byte_controller/n20 ), .A2(
        \byte_controller/n67 ), .A3(\byte_controller/n66 ), .ZN(
        \byte_controller/n136 ) );
  NAND4_X1 \byte_controller/U87  ( .A1(\byte_controller/n65 ), .A2(
        \byte_controller/n9 ), .A3(\byte_controller/n13 ), .A4(
        \byte_controller/n67 ), .ZN(\byte_controller/n127 ) );
  INV_X1 \byte_controller/U86  ( .A(\byte_controller/n64 ), .ZN(
        \byte_controller/n65 ) );
  NAND3_X1 \byte_controller/U85  ( .A1(\byte_controller/n9 ), .A2(
        \byte_controller/n118 ), .A3(\byte_controller/n110 ), .ZN(
        \byte_controller/n68 ) );
  NAND2_X1 \byte_controller/U84  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n125 ), .ZN(\byte_controller/n85 ) );
  NAND3_X1 \byte_controller/U83  ( .A1(\byte_controller/n9 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n63 ) );
  NAND3_X1 \byte_controller/U82  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n60 ), .A3(\byte_controller/n66 ), .ZN(
        \byte_controller/n125 ) );
  NAND2_X1 \byte_controller/U81  ( .A1(\byte_controller/n59 ), .A2(
        \byte_controller/n64 ), .ZN(\byte_controller/n66 ) );
  AOI211_X1 \byte_controller/U80  ( .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n57 ), .A(\byte_controller/n141 ), .B(
        \byte_controller/n2 ), .ZN(\byte_controller/n61 ) );
  OAI221_X1 \byte_controller/U79  ( .B1(\byte_controller/n56 ), .B2(
        \byte_controller/n107 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n55 ), .A(\byte_controller/n70 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U78  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n54 ), .A(\byte_controller/n67 ), .ZN(
        \byte_controller/n56 ) );
  OAI211_X1 \byte_controller/U77  ( .C1(\byte_controller/n51 ), .C2(
        \byte_controller/n55 ), .A(\byte_controller/n53 ), .B(
        \byte_controller/n70 ), .ZN(\byte_controller/n143 ) );
  NAND3_X1 \byte_controller/U76  ( .A1(\byte_controller/n52 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n51 ), .ZN(
        \byte_controller/n53 ) );
  OAI21_X1 \byte_controller/U75  ( .B1(\byte_controller/n50 ), .B2(
        \byte_controller/n107 ), .A(\byte_controller/n69 ), .ZN(
        \byte_controller/n55 ) );
  NAND2_X1 \byte_controller/U74  ( .A1(\byte_controller/n70 ), .A2(
        \byte_controller/n49 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U73  ( .A(\byte_controller/n48 ), .B(
        \byte_controller/n50 ), .S(\byte_controller/n52 ), .Z(
        \byte_controller/n49 ) );
  INV_X1 \byte_controller/U72  ( .A(\byte_controller/n107 ), .ZN(
        \byte_controller/n52 ) );
  NAND2_X1 \byte_controller/U71  ( .A1(\byte_controller/n69 ), .A2(
        \byte_controller/n50 ), .ZN(\byte_controller/n48 ) );
  NAND2_X1 \byte_controller/U70  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n69 ), .ZN(\byte_controller/n70 ) );
  AOI21_X1 \byte_controller/U69  ( .B1(\byte_controller/n47 ), .B2(
        \byte_controller/n14 ), .A(\byte_controller/n46 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U68  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n130 ), .ZN(\byte_controller/n47 ) );
  OAI21_X1 \byte_controller/U67  ( .B1(\byte_controller/n57 ), .B2(
        \byte_controller/n46 ), .A(\byte_controller/n45 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U66  ( .A1(\byte_controller/n10 ), .A2(
        \byte_controller/n9 ), .A3(\byte_controller/n3 ), .A4(
        \byte_controller/n42 ), .ZN(\byte_controller/n45 ) );
  OAI22_X1 \byte_controller/U65  ( .A1(\byte_controller/n11 ), .A2(
        \byte_controller/n122 ), .B1(\byte_controller/n16 ), .B2(
        \byte_controller/n7 ), .ZN(\byte_controller/n91 ) );
  NAND2_X1 \byte_controller/U64  ( .A1(\byte_controller/n9 ), .A2(
        \byte_controller/n129 ), .ZN(\byte_controller/n122 ) );
  INV_X1 \byte_controller/U63  ( .A(\byte_controller/c_state [3]), .ZN(
        \byte_controller/n112 ) );
  NAND2_X1 \byte_controller/U62  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n36 ), .ZN(\byte_controller/n86 ) );
  NAND3_X1 \byte_controller/U61  ( .A1(\byte_controller/n9 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/n109 ), .ZN(
        \byte_controller/n36 ) );
  NAND3_X1 \byte_controller/U60  ( .A1(\byte_controller/n124 ), .A2(
        \byte_controller/n123 ), .A3(\byte_controller/n67 ), .ZN(
        \byte_controller/n62 ) );
  INV_X1 \byte_controller/U59  ( .A(\byte_controller/n130 ), .ZN(
        \byte_controller/n67 ) );
  NAND3_X1 \byte_controller/U58  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n51 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n130 ) );
  NAND2_X1 \byte_controller/U57  ( .A1(\byte_controller/n35 ), .A2(
        \byte_controller/n110 ), .ZN(\byte_controller/n123 ) );
  NAND2_X1 \byte_controller/U56  ( .A1(\byte_controller/n44 ), .A2(
        \byte_controller/n34 ), .ZN(\byte_controller/n124 ) );
  INV_X1 \byte_controller/U55  ( .A(\byte_controller/n24 ), .ZN(
        \byte_controller/n109 ) );
  NAND4_X1 \byte_controller/U54  ( .A1(\byte_controller/n129 ), .A2(
        \byte_controller/n9 ), .A3(\byte_controller/n60 ), .A4(
        \byte_controller/n2 ), .ZN(\byte_controller/n134 ) );
  NAND2_X1 \byte_controller/U53  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n57 ), .ZN(\byte_controller/n60 ) );
  NAND3_X1 \byte_controller/U52  ( .A1(\byte_controller/n8 ), .A2(
        \byte_controller/n14 ), .A3(\byte_controller/n37 ), .ZN(
        \byte_controller/n33 ) );
  INV_X1 \byte_controller/U51  ( .A(cr[7]), .ZN(\byte_controller/n37 ) );
  OAI21_X1 \byte_controller/U50  ( .B1(\byte_controller/n16 ), .B2(
        \byte_controller/n57 ), .A(\byte_controller/n120 ), .ZN(
        \byte_controller/n87 ) );
  NAND4_X1 \byte_controller/U49  ( .A1(\byte_controller/n66 ), .A2(
        \byte_controller/n10 ), .A3(\byte_controller/n9 ), .A4(cr[7]), .ZN(
        \byte_controller/n120 ) );
  NAND2_X1 \byte_controller/U48  ( .A1(\byte_controller/n59 ), .A2(
        \byte_controller/n64 ), .ZN(\byte_controller/n129 ) );
  NAND2_X1 \byte_controller/U47  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n64 ) );
  NAND4_X1 \byte_controller/U46  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/n112 ), .A4(
        \byte_controller/n111 ), .ZN(\byte_controller/n32 ) );
  INV_X1 \byte_controller/U45  ( .A(\byte_controller/n30 ), .ZN(
        \byte_controller/n31 ) );
  NAND4_X1 \byte_controller/U44  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n14 ), .A3(\byte_controller/n57 ), .A4(
        \byte_controller/n43 ), .ZN(\byte_controller/n59 ) );
  NAND3_X1 \byte_controller/U43  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n38 ), .A3(\byte_controller/n58 ), .ZN(
        \byte_controller/n43 ) );
  NOR3_X1 \byte_controller/U42  ( .A1(done), .A2(\byte_controller/n30 ), .A3(
        \byte_controller/n118 ), .ZN(\byte_controller/n29 ) );
  INV_X1 \byte_controller/U41  ( .A(\byte_controller/n22 ), .ZN(
        \byte_controller/n118 ) );
  NAND2_X1 \byte_controller/U40  ( .A1(\byte_controller/n115 ), .A2(
        \byte_controller/n114 ), .ZN(\byte_controller/n30 ) );
  NAND3_X1 \byte_controller/U39  ( .A1(\byte_controller/n131 ), .A2(
        \byte_controller/n34 ), .A3(\byte_controller/n10 ), .ZN(
        \byte_controller/n40 ) );
  INV_X1 \byte_controller/U38  ( .A(\byte_controller/n35 ), .ZN(
        \byte_controller/n44 ) );
  NAND2_X1 \byte_controller/U37  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n42 ), .ZN(\byte_controller/n34 ) );
  NAND3_X1 \byte_controller/U36  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n38 ), .A3(\byte_controller/n58 ), .ZN(
        \byte_controller/n26 ) );
  INV_X1 \byte_controller/U35  ( .A(cr[4]), .ZN(\byte_controller/n58 ) );
  INV_X1 \byte_controller/U34  ( .A(cr[5]), .ZN(\byte_controller/n38 ) );
  NAND3_X1 \byte_controller/U33  ( .A1(\byte_controller/n131 ), .A2(
        \byte_controller/n110 ), .A3(\byte_controller/n35 ), .ZN(
        \byte_controller/n41 ) );
  NAND3_X1 \byte_controller/U32  ( .A1(\byte_controller/n19 ), .A2(
        \byte_controller/n111 ), .A3(\byte_controller/n57 ), .ZN(
        \byte_controller/n35 ) );
  INV_X1 \byte_controller/U31  ( .A(\byte_controller/c_state [1]), .ZN(
        \byte_controller/n111 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n110 ) );
  AOI21_X1 \byte_controller/U29  ( .B1(\byte_controller/n25 ), .B2(
        \byte_controller/n7 ), .A(\byte_controller/n46 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U28  ( .A1(\byte_controller/n131 ), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n46 ) );
  INV_X1 \byte_controller/U27  ( .A(wb_rst_i), .ZN(\byte_controller/n69 ) );
  INV_X1 \byte_controller/U26  ( .A(i2c_al), .ZN(\byte_controller/n23 ) );
  NAND2_X1 \byte_controller/U25  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n39 ), .ZN(\byte_controller/n25 ) );
  INV_X1 \byte_controller/U24  ( .A(cr[6]), .ZN(\byte_controller/n39 ) );
  OR3_X2 \byte_controller/U23  ( .A1(\byte_controller/n27 ), .A2(wb_rst_i), 
        .A3(\byte_controller/ld ), .ZN(\byte_controller/n107 ) );
  BUF_X2 \byte_controller/U22  ( .A(arst_i), .Z(\byte_controller/n21 ) );
  MUX2_X1 \byte_controller/U21  ( .A(\byte_controller/n139 ), .B(
        \byte_controller/n140 ), .S(\byte_controller/n138 ), .Z(
        \byte_controller/n142 ) );
  AND2_X1 \byte_controller/U20  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n131 ), .ZN(\byte_controller/n20 ) );
  AND3_X1 \byte_controller/U19  ( .A1(\byte_controller/n115 ), .A2(
        \byte_controller/n114 ), .A3(\byte_controller/n22 ), .ZN(
        \byte_controller/n19 ) );
  AND2_X1 \byte_controller/U18  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n41 ), .ZN(\byte_controller/n17 ) );
  AND2_X1 \byte_controller/U17  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n41 ), .ZN(\byte_controller/n16 ) );
  INV_X1 \byte_controller/U16  ( .A(\byte_controller/n109 ), .ZN(
        \byte_controller/n14 ) );
  BUF_X1 \byte_controller/U15  ( .A(\byte_controller/c_state [1]), .Z(
        \byte_controller/n13 ) );
  AND4_X1 \byte_controller/U14  ( .A1(\byte_controller/n44 ), .A2(
        \byte_controller/n1 ), .A3(\byte_controller/n38 ), .A4(
        \byte_controller/n37 ), .ZN(\byte_controller/n12 ) );
  AOI21_X1 \byte_controller/U13  ( .B1(cr[6]), .B2(
        \byte_controller/c_state [3]), .A(\byte_controller/n12 ), .ZN(
        \byte_controller/n11 ) );
  INV_X1 \byte_controller/U12  ( .A(\byte_controller/n35 ), .ZN(
        \byte_controller/n10 ) );
  INV_X1 \byte_controller/U11  ( .A(\byte_controller/n141 ), .ZN(
        \byte_controller/n131 ) );
  NAND2_X2 \byte_controller/U10  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n69 ), .ZN(\byte_controller/n141 ) );
  INV_X2 \byte_controller/U9  ( .A(\byte_controller/n141 ), .ZN(
        \byte_controller/n9 ) );
  AND3_X1 \byte_controller/U8  ( .A1(\byte_controller/n115 ), .A2(
        \byte_controller/n114 ), .A3(\byte_controller/n22 ), .ZN(
        \byte_controller/n8 ) );
  INV_X1 \byte_controller/U7  ( .A(\byte_controller/n5 ), .ZN(
        \byte_controller/n7 ) );
  INV_X1 \byte_controller/U6  ( .A(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n4 ) );
  BUF_X1 \byte_controller/U5  ( .A(\byte_controller/n26 ), .Z(
        \byte_controller/n3 ) );
  BUF_X1 \byte_controller/U4  ( .A(cr[5]), .Z(\byte_controller/n2 ) );
  BUF_X1 \byte_controller/U3  ( .A(\byte_controller/n58 ), .Z(
        \byte_controller/n1 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/n5 ), .QN(
        \byte_controller/n115 ) );
  DFFR_X2 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n28 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .QN(\byte_controller/n27 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/n50 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/n54 ), .QN(
        \byte_controller/n15 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [0]), .QN(\byte_controller/n121 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(done), .QN(
        \byte_controller/n42 ) );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n21 ), .Q(\byte_controller/ld ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n140 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n114 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/c_state [0]), .QN(\byte_controller/n57 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[0]), .QN(
        \byte_controller/n73 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[1]), .QN(
        \byte_controller/n75 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[2]), .QN(
        \byte_controller/n77 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[3]), .QN(
        \byte_controller/n90 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[4]), .QN(
        \byte_controller/n101 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[5]), .QN(
        \byte_controller/n103 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[6]), .QN(
        \byte_controller/n106 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n143 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n51 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n22 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n24 ) );
  AOI21_X1 \byte_controller/bit_controller/U242  ( .B1(
        \byte_controller/bit_controller/n292 ), .B2(
        \byte_controller/bit_controller/n291 ), .A(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/N155 ) );
  INV_X1 \byte_controller/bit_controller/U241  ( .A(
        \byte_controller/bit_controller/n290 ), .ZN(
        \byte_controller/bit_controller/n291 ) );
  NOR2_X1 \byte_controller/bit_controller/U240  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/bit_controller/n289 ), .ZN(
        \byte_controller/bit_controller/n292 ) );
  AOI211_X1 \byte_controller/bit_controller/U239  ( .C1(
        \byte_controller/bit_controller/n97 ), .C2(
        \byte_controller/bit_controller/n96 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N59 ) );
  NOR3_X1 \byte_controller/bit_controller/U238  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/N53 ), .ZN(
        \byte_controller/bit_controller/N56 ) );
  MUX2_X1 \byte_controller/bit_controller/U237  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n288 ), .S(
        \byte_controller/bit_controller/n287 ), .Z(
        \byte_controller/bit_controller/n141 ) );
  AOI21_X1 \byte_controller/bit_controller/U236  ( .B1(
        \byte_controller/bit_controller/n43 ), .B2(
        \byte_controller/bit_controller/n10 ), .A(
        \byte_controller/bit_controller/n286 ), .ZN(
        \byte_controller/bit_controller/n287 ) );
  NAND3_X1 \byte_controller/bit_controller/U235  ( .A1(
        \byte_controller/bit_controller/n285 ), .A2(
        \byte_controller/bit_controller/n138 ), .A3(
        \byte_controller/bit_controller/n137 ), .ZN(
        \byte_controller/bit_controller/n288 ) );
  AOI21_X1 \byte_controller/bit_controller/U234  ( .B1(
        \byte_controller/bit_controller/n283 ), .B2(
        \byte_controller/bit_controller/n284 ), .A(
        \byte_controller/bit_controller/n282 ), .ZN(
        \byte_controller/bit_controller/n285 ) );
  NAND4_X1 \byte_controller/bit_controller/U233  ( .A1(
        \byte_controller/bit_controller/n129 ), .A2(
        \byte_controller/bit_controller/n128 ), .A3(
        \byte_controller/bit_controller/n127 ), .A4(
        \byte_controller/bit_controller/n281 ), .ZN(
        \byte_controller/bit_controller/n284 ) );
  NOR2_X1 \byte_controller/bit_controller/U232  ( .A1(
        \byte_controller/core_txd ), .A2(\byte_controller/bit_controller/n290 ), .ZN(\byte_controller/bit_controller/n281 ) );
  NAND2_X1 \byte_controller/bit_controller/U231  ( .A1(
        \byte_controller/bit_controller/n130 ), .A2(
        \byte_controller/bit_controller/n126 ), .ZN(
        \byte_controller/bit_controller/n290 ) );
  OAI21_X1 \byte_controller/bit_controller/U230  ( .B1(
        \byte_controller/bit_controller/n280 ), .B2(
        \byte_controller/bit_controller/n138 ), .A(
        \byte_controller/bit_controller/n279 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  NAND4_X1 \byte_controller/bit_controller/U229  ( .A1(
        \byte_controller/core_cmd [0]), .A2(
        \byte_controller/bit_controller/n25 ), .A3(
        \byte_controller/bit_controller/n277 ), .A4(
        \byte_controller/bit_controller/n278 ), .ZN(
        \byte_controller/bit_controller/n279 ) );
  OAI33_X1 \byte_controller/bit_controller/U228  ( .A1(
        \byte_controller/bit_controller/n276 ), .A2(
        \byte_controller/bit_controller/n275 ), .A3(
        \byte_controller/bit_controller/n274 ), .B1(
        \byte_controller/bit_controller/n140 ), .B2(
        \byte_controller/bit_controller/N53 ), .B3(
        \byte_controller/bit_controller/n273 ), .ZN(
        \byte_controller/bit_controller/N67 ) );
  OAI22_X1 \byte_controller/bit_controller/U227  ( .A1(
        \byte_controller/bit_controller/n52 ), .A2(
        \byte_controller/bit_controller/n12 ), .B1(
        \byte_controller/bit_controller/n140 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  NOR2_X1 \byte_controller/bit_controller/U226  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n271 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  MUX2_X1 \byte_controller/bit_controller/U225  ( .A(
        \byte_controller/bit_controller/n270 ), .B(
        \byte_controller/bit_controller/n121 ), .S(
        \byte_controller/bit_controller/n101 ), .Z(
        \byte_controller/bit_controller/n271 ) );
  NAND2_X1 \byte_controller/bit_controller/U224  ( .A1(
        \byte_controller/bit_controller/n269 ), .A2(
        \byte_controller/bit_controller/n268 ), .ZN(
        \byte_controller/bit_controller/n270 ) );
  INV_X1 \byte_controller/bit_controller/U223  ( .A(
        \byte_controller/bit_controller/n267 ), .ZN(
        \byte_controller/bit_controller/n269 ) );
  INV_X1 \byte_controller/bit_controller/U222  ( .A(
        \byte_controller/bit_controller/n266 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  AOI221_X1 \byte_controller/bit_controller/U221  ( .B1(prer[15]), .B2(
        \byte_controller/bit_controller/n67 ), .C1(
        \byte_controller/bit_controller/n47 ), .C2(
        \byte_controller/bit_controller/n264 ), .A(
        \byte_controller/bit_controller/n263 ), .ZN(
        \byte_controller/bit_controller/n266 ) );
  NOR3_X1 \byte_controller/bit_controller/U220  ( .A1(
        \byte_controller/bit_controller/n261 ), .A2(
        \byte_controller/bit_controller/n34 ), .A3(
        \byte_controller/bit_controller/n262 ), .ZN(
        \byte_controller/bit_controller/n263 ) );
  XOR2_X1 \byte_controller/bit_controller/U219  ( .A(
        \byte_controller/bit_controller/cnt_hold [15]), .B(
        \byte_controller/bit_controller/n260 ), .Z(
        \byte_controller/bit_controller/n264 ) );
  INV_X1 \byte_controller/bit_controller/U218  ( .A(
        \byte_controller/bit_controller/n259 ), .ZN(
        \byte_controller/bit_controller/n260 ) );
  INV_X1 \byte_controller/bit_controller/U217  ( .A(
        \byte_controller/bit_controller/n258 ), .ZN(
        \byte_controller/bit_controller/n160 ) );
  AOI221_X1 \byte_controller/bit_controller/U216  ( .B1(prer[14]), .B2(
        \byte_controller/bit_controller/n67 ), .C1(
        \byte_controller/bit_controller/n47 ), .C2(
        \byte_controller/bit_controller/n257 ), .A(
        \byte_controller/bit_controller/n256 ), .ZN(
        \byte_controller/bit_controller/n258 ) );
  NOR3_X1 \byte_controller/bit_controller/U215  ( .A1(
        \byte_controller/bit_controller/n261 ), .A2(
        \byte_controller/bit_controller/n20 ), .A3(
        \byte_controller/bit_controller/n262 ), .ZN(
        \byte_controller/bit_controller/n256 ) );
  INV_X1 \byte_controller/bit_controller/U214  ( .A(
        \byte_controller/bit_controller/n65 ), .ZN(
        \byte_controller/bit_controller/n262 ) );
  OAI21_X1 \byte_controller/bit_controller/U213  ( .B1(
        \byte_controller/bit_controller/n5 ), .B2(
        \byte_controller/bit_controller/n20 ), .A(
        \byte_controller/bit_controller/n259 ), .ZN(
        \byte_controller/bit_controller/n257 ) );
  NAND4_X1 \byte_controller/bit_controller/U212  ( .A1(
        \byte_controller/bit_controller/n38 ), .A2(
        \byte_controller/bit_controller/n42 ), .A3(
        \byte_controller/bit_controller/n39 ), .A4(
        \byte_controller/bit_controller/n250 ), .ZN(
        \byte_controller/bit_controller/n259 ) );
  NOR4_X1 \byte_controller/bit_controller/U211  ( .A1(
        \byte_controller/bit_controller/cnt_hold [12]), .A2(
        \byte_controller/bit_controller/cnt_hold [11]), .A3(
        \byte_controller/bit_controller/cnt_hold [14]), .A4(
        \byte_controller/bit_controller/cnt_hold [13]), .ZN(
        \byte_controller/bit_controller/n250 ) );
  INV_X1 \byte_controller/bit_controller/U210  ( .A(
        \byte_controller/bit_controller/n63 ), .ZN(
        \byte_controller/bit_controller/n261 ) );
  INV_X1 \byte_controller/bit_controller/U209  ( .A(
        \byte_controller/bit_controller/n248 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  AOI221_X1 \byte_controller/bit_controller/U208  ( .B1(
        \byte_controller/bit_controller/n66 ), .B2(
        \byte_controller/bit_controller/cnt_hold [13]), .C1(
        \byte_controller/bit_controller/n265 ), .C2(prer[13]), .A(
        \byte_controller/bit_controller/n247 ), .ZN(
        \byte_controller/bit_controller/n248 ) );
  AOI211_X1 \byte_controller/bit_controller/U207  ( .C1(
        \byte_controller/bit_controller/n246 ), .C2(
        \byte_controller/bit_controller/n245 ), .A(
        \byte_controller/bit_controller/n249 ), .B(
        \byte_controller/bit_controller/n244 ), .ZN(
        \byte_controller/bit_controller/n247 ) );
  NOR4_X1 \byte_controller/bit_controller/U206  ( .A1(
        \byte_controller/bit_controller/cnt_hold [9]), .A2(
        \byte_controller/bit_controller/cnt_hold [8]), .A3(
        \byte_controller/bit_controller/cnt_hold [11]), .A4(
        \byte_controller/bit_controller/cnt_hold [10]), .ZN(
        \byte_controller/bit_controller/n241 ) );
  NOR3_X1 \byte_controller/bit_controller/U205  ( .A1(
        \byte_controller/bit_controller/n240 ), .A2(
        \byte_controller/bit_controller/cnt_hold [10]), .A3(
        \byte_controller/bit_controller/cnt_hold [9]), .ZN(
        \byte_controller/bit_controller/n246 ) );
  NAND3_X1 \byte_controller/bit_controller/U204  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/n44 ), .A3(
        \byte_controller/bit_controller/n39 ), .ZN(
        \byte_controller/bit_controller/n240 ) );
  INV_X1 \byte_controller/bit_controller/U203  ( .A(
        \byte_controller/bit_controller/n238 ), .ZN(
        \byte_controller/bit_controller/n162 ) );
  AOI221_X1 \byte_controller/bit_controller/U202  ( .B1(
        \byte_controller/bit_controller/n66 ), .B2(
        \byte_controller/bit_controller/cnt_hold [12]), .C1(
        \byte_controller/bit_controller/n68 ), .C2(prer[12]), .A(
        \byte_controller/bit_controller/n237 ), .ZN(
        \byte_controller/bit_controller/n238 ) );
  NOR3_X1 \byte_controller/bit_controller/U201  ( .A1(
        \byte_controller/bit_controller/n236 ), .A2(wb_rst_i), .A3(
        \byte_controller/bit_controller/n63 ), .ZN(
        \byte_controller/bit_controller/n237 ) );
  AOI221_X1 \byte_controller/bit_controller/U200  ( .B1(
        \byte_controller/bit_controller/n235 ), .B2(
        \byte_controller/bit_controller/n44 ), .C1(
        \byte_controller/bit_controller/cnt_hold [12]), .C2(
        \byte_controller/bit_controller/n234 ), .A(
        \byte_controller/bit_controller/n233 ), .ZN(
        \byte_controller/bit_controller/n236 ) );
  AOI21_X1 \byte_controller/bit_controller/U199  ( .B1(
        \byte_controller/bit_controller/n42 ), .B2(
        \byte_controller/bit_controller/n45 ), .A(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/n233 ) );
  NOR4_X1 \byte_controller/bit_controller/U198  ( .A1(
        \byte_controller/bit_controller/cnt_hold [11]), .A2(
        \byte_controller/bit_controller/cnt_hold [9]), .A3(
        \byte_controller/bit_controller/cnt_hold [10]), .A4(
        \byte_controller/bit_controller/cnt_hold [8]), .ZN(
        \byte_controller/bit_controller/n235 ) );
  INV_X1 \byte_controller/bit_controller/U197  ( .A(
        \byte_controller/bit_controller/n232 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  AOI221_X1 \byte_controller/bit_controller/U196  ( .B1(
        \byte_controller/bit_controller/n66 ), .B2(
        \byte_controller/bit_controller/n16 ), .C1(
        \byte_controller/bit_controller/n68 ), .C2(prer[11]), .A(
        \byte_controller/bit_controller/n231 ), .ZN(
        \byte_controller/bit_controller/n232 ) );
  NOR3_X1 \byte_controller/bit_controller/U195  ( .A1(
        \byte_controller/bit_controller/n230 ), .A2(wb_rst_i), .A3(
        \byte_controller/bit_controller/n63 ), .ZN(
        \byte_controller/bit_controller/n231 ) );
  AOI22_X1 \byte_controller/bit_controller/U194  ( .A1(
        \byte_controller/bit_controller/n229 ), .A2(
        \byte_controller/bit_controller/n45 ), .B1(
        \byte_controller/bit_controller/n16 ), .B2(
        \byte_controller/bit_controller/n228 ), .ZN(
        \byte_controller/bit_controller/n230 ) );
  INV_X1 \byte_controller/bit_controller/U193  ( .A(
        \byte_controller/bit_controller/n228 ), .ZN(
        \byte_controller/bit_controller/n229 ) );
  INV_X1 \byte_controller/bit_controller/U192  ( .A(
        \byte_controller/bit_controller/n227 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  AOI221_X1 \byte_controller/bit_controller/U191  ( .B1(
        \byte_controller/bit_controller/n66 ), .B2(
        \byte_controller/bit_controller/n24 ), .C1(
        \byte_controller/bit_controller/n68 ), .C2(prer[10]), .A(
        \byte_controller/bit_controller/n226 ), .ZN(
        \byte_controller/bit_controller/n227 ) );
  AOI211_X1 \byte_controller/bit_controller/U190  ( .C1(
        \byte_controller/bit_controller/n225 ), .C2(
        \byte_controller/bit_controller/n228 ), .A(
        \byte_controller/bit_controller/n249 ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n226 ) );
  NAND3_X1 \byte_controller/bit_controller/U189  ( .A1(
        \byte_controller/bit_controller/n38 ), .A2(
        \byte_controller/bit_controller/n42 ), .A3(
        \byte_controller/bit_controller/n39 ), .ZN(
        \byte_controller/bit_controller/n228 ) );
  NAND2_X1 \byte_controller/bit_controller/U188  ( .A1(
        \byte_controller/bit_controller/n24 ), .A2(
        \byte_controller/bit_controller/n234 ), .ZN(
        \byte_controller/bit_controller/n225 ) );
  INV_X1 \byte_controller/bit_controller/U187  ( .A(
        \byte_controller/bit_controller/n224 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  AOI221_X1 \byte_controller/bit_controller/U186  ( .B1(
        \byte_controller/bit_controller/n66 ), .B2(
        \byte_controller/bit_controller/cnt_hold [9]), .C1(
        \byte_controller/bit_controller/n68 ), .C2(prer[9]), .A(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n224 ) );
  AOI211_X1 \byte_controller/bit_controller/U185  ( .C1(
        \byte_controller/bit_controller/n222 ), .C2(
        \byte_controller/bit_controller/n234 ), .A(
        \byte_controller/bit_controller/n249 ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n223 ) );
  NAND2_X1 \byte_controller/bit_controller/U184  ( .A1(
        \byte_controller/bit_controller/n39 ), .A2(
        \byte_controller/bit_controller/n38 ), .ZN(
        \byte_controller/bit_controller/n234 ) );
  NAND2_X1 \byte_controller/bit_controller/U183  ( .A1(
        \byte_controller/bit_controller/cnt_hold [9]), .A2(
        \byte_controller/bit_controller/cnt_hold [8]), .ZN(
        \byte_controller/bit_controller/n222 ) );
  INV_X1 \byte_controller/bit_controller/U182  ( .A(
        \byte_controller/bit_controller/n221 ), .ZN(
        \byte_controller/bit_controller/n166 ) );
  AOI221_X1 \byte_controller/bit_controller/U181  ( .B1(
        \byte_controller/bit_controller/n66 ), .B2(
        \byte_controller/bit_controller/cnt_hold [8]), .C1(
        \byte_controller/bit_controller/n265 ), .C2(prer[8]), .A(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  NOR3_X1 \byte_controller/bit_controller/U180  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(
        \byte_controller/bit_controller/cnt_hold [8]), .A3(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n220 ) );
  OAI21_X1 \byte_controller/bit_controller/U179  ( .B1(n150), .B2(wb_rst_i), 
        .A(\byte_controller/bit_controller/n219 ), .ZN(
        \byte_controller/bit_controller/n249 ) );
  NAND4_X1 \byte_controller/bit_controller/U178  ( .A1(
        \byte_controller/bit_controller/n217 ), .A2(
        \byte_controller/bit_controller/n218 ), .A3(
        \byte_controller/bit_controller/n40 ), .A4(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n219 ) );
  NOR3_X1 \byte_controller/bit_controller/U177  ( .A1(
        \byte_controller/bit_controller/cnt_hold [4]), .A2(
        \byte_controller/bit_controller/cnt_hold [6]), .A3(
        \byte_controller/bit_controller/cnt_hold [5]), .ZN(
        \byte_controller/bit_controller/n218 ) );
  AOI211_X1 \byte_controller/bit_controller/U176  ( .C1(
        \byte_controller/bit_controller/n215 ), .C2(
        \byte_controller/bit_controller/n214 ), .A(
        \byte_controller/bit_controller/n74 ), .B(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  NAND2_X1 \byte_controller/bit_controller/U175  ( .A1(
        \byte_controller/bit_controller/n4 ), .A2(
        \byte_controller/bit_controller/n213 ), .ZN(
        \byte_controller/bit_controller/n215 ) );
  NAND4_X1 \byte_controller/bit_controller/U174  ( .A1(
        \byte_controller/bit_controller/n41 ), .A2(
        \byte_controller/bit_controller/n46 ), .A3(
        \byte_controller/bit_controller/n23 ), .A4(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  INV_X1 \byte_controller/bit_controller/U173  ( .A(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n295 ) );
  AOI221_X1 \byte_controller/bit_controller/U172  ( .B1(
        \byte_controller/bit_controller/n6 ), .B2(
        \byte_controller/bit_controller/cnt_hold [7]), .C1(
        \byte_controller/bit_controller/n265 ), .C2(prer[7]), .A(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  NOR3_X1 \byte_controller/bit_controller/U171  ( .A1(
        \byte_controller/bit_controller/n72 ), .A2(
        \byte_controller/bit_controller/n206 ), .A3(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  XOR2_X1 \byte_controller/bit_controller/U170  ( .A(
        \byte_controller/bit_controller/n205 ), .B(
        \byte_controller/bit_controller/cnt_hold [7]), .Z(
        \byte_controller/bit_controller/n206 ) );
  AOI211_X1 \byte_controller/bit_controller/U169  ( .C1(
        \byte_controller/bit_controller/n203 ), .C2(
        \byte_controller/bit_controller/n15 ), .A(
        \byte_controller/bit_controller/n1 ), .B(
        \byte_controller/bit_controller/n70 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  NAND4_X1 \byte_controller/bit_controller/U168  ( .A1(
        \byte_controller/bit_controller/n33 ), .A2(
        \byte_controller/bit_controller/n26 ), .A3(
        \byte_controller/bit_controller/n40 ), .A4(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  NOR4_X1 \byte_controller/bit_controller/U167  ( .A1(
        \byte_controller/bit_controller/cnt_hold [2]), .A2(
        \byte_controller/bit_controller/cnt_hold [4]), .A3(
        \byte_controller/bit_controller/cnt_hold [5]), .A4(
        \byte_controller/bit_controller/cnt_hold [1]), .ZN(
        \byte_controller/bit_controller/n200 ) );
  NAND2_X1 \byte_controller/bit_controller/U166  ( .A1(
        \byte_controller/bit_controller/cnt_hold [6]), .A2(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  NAND3_X1 \byte_controller/bit_controller/U165  ( .A1(
        \byte_controller/bit_controller/n195 ), .A2(
        \byte_controller/bit_controller/n23 ), .A3(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U164  ( .A(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n195 ) );
  AOI22_X1 \byte_controller/bit_controller/U163  ( .A1(
        \byte_controller/bit_controller/cnt_hold [4]), .A2(
        \byte_controller/bit_controller/n194 ), .B1(
        \byte_controller/bit_controller/cnt_hold [4]), .B2(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  NAND2_X1 \byte_controller/bit_controller/U162  ( .A1(
        \byte_controller/bit_controller/n37 ), .A2(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/n194 ) );
  INV_X1 \byte_controller/bit_controller/U161  ( .A(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n297 ) );
  AOI221_X1 \byte_controller/bit_controller/U160  ( .B1(
        \byte_controller/bit_controller/n6 ), .B2(
        \byte_controller/bit_controller/cnt_hold [3]), .C1(
        \byte_controller/bit_controller/n265 ), .C2(prer[3]), .A(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n193 ) );
  NOR3_X1 \byte_controller/bit_controller/U159  ( .A1(
        \byte_controller/bit_controller/n293 ), .A2(
        \byte_controller/bit_controller/n70 ), .A3(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n192 ) );
  AOI22_X1 \byte_controller/bit_controller/U158  ( .A1(
        \byte_controller/bit_controller/n190 ), .A2(
        \byte_controller/bit_controller/n46 ), .B1(
        \byte_controller/bit_controller/cnt_hold [3]), .B2(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n191 ) );
  INV_X1 \byte_controller/bit_controller/U157  ( .A(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  AOI211_X1 \byte_controller/bit_controller/U156  ( .C1(
        \byte_controller/bit_controller/n187 ), .C2(
        \byte_controller/bit_controller/n189 ), .A(
        \byte_controller/bit_controller/n71 ), .B(
        \byte_controller/bit_controller/n72 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  NAND2_X1 \byte_controller/bit_controller/U155  ( .A1(
        \byte_controller/bit_controller/n50 ), .A2(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n189 ) );
  NAND2_X1 \byte_controller/bit_controller/U154  ( .A1(
        \byte_controller/bit_controller/n14 ), .A2(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  INV_X1 \byte_controller/bit_controller/U153  ( .A(
        \byte_controller/bit_controller/n185 ), .ZN(
        \byte_controller/bit_controller/n299 ) );
  AOI221_X1 \byte_controller/bit_controller/U152  ( .B1(
        \byte_controller/bit_controller/n6 ), .B2(
        \byte_controller/bit_controller/cnt_hold [1]), .C1(
        \byte_controller/bit_controller/n68 ), .C2(prer[1]), .A(
        \byte_controller/bit_controller/n184 ), .ZN(
        \byte_controller/bit_controller/n185 ) );
  AOI211_X1 \byte_controller/bit_controller/U151  ( .C1(
        \byte_controller/bit_controller/n183 ), .C2(
        \byte_controller/bit_controller/n199 ), .A(
        \byte_controller/bit_controller/n71 ), .B(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  NAND2_X1 \byte_controller/bit_controller/U150  ( .A1(
        \byte_controller/bit_controller/n33 ), .A2(
        \byte_controller/bit_controller/n36 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  NAND2_X1 \byte_controller/bit_controller/U149  ( .A1(
        \byte_controller/bit_controller/cnt_hold [1]), .A2(
        \byte_controller/bit_controller/cnt_hold [0]), .ZN(
        \byte_controller/bit_controller/n183 ) );
  INV_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n300 ) );
  AOI221_X1 \byte_controller/bit_controller/U147  ( .B1(
        \byte_controller/bit_controller/n6 ), .B2(
        \byte_controller/bit_controller/cnt_hold [0]), .C1(
        \byte_controller/bit_controller/n265 ), .C2(prer[0]), .A(
        \byte_controller/bit_controller/n181 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  NOR3_X1 \byte_controller/bit_controller/U146  ( .A1(
        \byte_controller/bit_controller/n207 ), .A2(
        \byte_controller/bit_controller/cnt_hold [0]), .A3(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n181 ) );
  NAND2_X1 \byte_controller/bit_controller/U145  ( .A1(
        \byte_controller/bit_controller/n65 ), .A2(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  NAND2_X1 \byte_controller/bit_controller/U144  ( .A1(
        \byte_controller/bit_controller/n179 ), .A2(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n255 ) );
  NAND4_X1 \byte_controller/bit_controller/U143  ( .A1(
        \byte_controller/bit_controller/n173 ), .A2(
        \byte_controller/bit_controller/n3 ), .A3(
        \byte_controller/bit_controller/n180 ), .A4(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U142  ( .A(
        \byte_controller/bit_controller/n294 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  INV_X1 \byte_controller/bit_controller/U141  ( .A(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  NAND2_X1 \byte_controller/bit_controller/U140  ( .A1(
        \byte_controller/bit_controller/n170 ), .A2(n150), .ZN(
        \byte_controller/bit_controller/n173 ) );
  NAND2_X1 \byte_controller/bit_controller/U139  ( .A1(n150), .A2(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  NAND2_X1 \byte_controller/bit_controller/U138  ( .A1(
        \byte_controller/bit_controller/n120 ), .A2(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n294 ) );
  NAND2_X1 \byte_controller/bit_controller/U137  ( .A1(
        \byte_controller/bit_controller/n255 ), .A2(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n293 ) );
  OAI21_X1 \byte_controller/bit_controller/U136  ( .B1(
        \byte_controller/bit_controller/n169 ), .B2(
        \byte_controller/bit_controller/n170 ), .A(n150), .ZN(
        \byte_controller/bit_controller/n179 ) );
  OR2_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n180 ) );
  OR2_X1 \byte_controller/bit_controller/U134  ( .A1(
        \byte_controller/bit_controller/n117 ), .A2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n176 ) );
  OAI33_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/n283 ), .A2(
        \byte_controller/bit_controller/n139 ), .A3(
        \byte_controller/bit_controller/n115 ), .B1(
        \byte_controller/bit_controller/n286 ), .B2(
        \byte_controller/bit_controller/n114 ), .B3(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n116 ) );
  NOR4_X1 \byte_controller/bit_controller/U132  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n108 ), .A4(
        \byte_controller/bit_controller/n107 ), .ZN(
        \byte_controller/bit_controller/n114 ) );
  NAND3_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/n128 ), .A2(
        \byte_controller/bit_controller/n127 ), .A3(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n109 ) );
  NAND4_X1 \byte_controller/bit_controller/U130  ( .A1(
        \byte_controller/bit_controller/n136 ), .A2(
        \byte_controller/bit_controller/n137 ), .A3(
        \byte_controller/bit_controller/n135 ), .A4(
        \byte_controller/bit_controller/n52 ), .ZN(
        \byte_controller/bit_controller/n111 ) );
  NAND2_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/n133 ), .A2(
        \byte_controller/bit_controller/n134 ), .ZN(
        \byte_controller/bit_controller/n115 ) );
  OAI222_X1 \byte_controller/bit_controller/U128  ( .A1(
        \byte_controller/bit_controller/n139 ), .A2(
        \byte_controller/bit_controller/n280 ), .B1(
        \byte_controller/bit_controller/n139 ), .B2(
        \byte_controller/bit_controller/n138 ), .C1(
        \byte_controller/bit_controller/n286 ), .C2(
        \byte_controller/bit_controller/n10 ), .ZN(
        \byte_controller/bit_controller/n117 ) );
  INV_X1 \byte_controller/bit_controller/U127  ( .A(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n286 ) );
  OAI22_X1 \byte_controller/bit_controller/U126  ( .A1(
        \byte_controller/bit_controller/n129 ), .A2(
        \byte_controller/bit_controller/n12 ), .B1(
        \byte_controller/bit_controller/n128 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI21_X1 \byte_controller/bit_controller/U125  ( .B1(
        \byte_controller/bit_controller/n129 ), .B2(
        \byte_controller/bit_controller/n280 ), .A(
        \byte_controller/bit_controller/n106 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  NAND3_X1 \byte_controller/bit_controller/U124  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n277 ), .A3(
        \byte_controller/bit_controller/n105 ), .ZN(
        \byte_controller/bit_controller/n106 ) );
  NOR3_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/bit_controller/n13 ), .A2(
        \byte_controller/bit_controller/n104 ), .A3(
        \byte_controller/bit_controller/n268 ), .ZN(
        \byte_controller/bit_controller/n105 ) );
  OAI22_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/n131 ), .A2(
        \byte_controller/bit_controller/n13 ), .B1(
        \byte_controller/bit_controller/n130 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  OAI22_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n127 ), .A2(
        \byte_controller/bit_controller/n12 ), .B1(
        \byte_controller/bit_controller/n126 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  OAI22_X1 \byte_controller/bit_controller/U120  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n13 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n158 ) );
  OAI22_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n12 ), .B1(
        \byte_controller/bit_controller/n123 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n13 ), .B1(
        \byte_controller/bit_controller/n124 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI21_X1 \byte_controller/bit_controller/U117  ( .B1(
        \byte_controller/bit_controller/n125 ), .B2(
        \byte_controller/bit_controller/n280 ), .A(
        \byte_controller/bit_controller/n103 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  NAND4_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n25 ), .A2(
        \byte_controller/bit_controller/n100 ), .A3(
        \byte_controller/bit_controller/n277 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n103 ) );
  INV_X1 \byte_controller/bit_controller/U115  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n277 ) );
  OAI22_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n128 ), .A2(
        \byte_controller/bit_controller/n13 ), .B1(
        \byte_controller/bit_controller/n127 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n135 ), .A2(
        \byte_controller/bit_controller/n12 ), .B1(
        \byte_controller/bit_controller/n134 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  OAI22_X1 \byte_controller/bit_controller/U112  ( .A1(
        \byte_controller/bit_controller/n136 ), .A2(
        \byte_controller/bit_controller/n13 ), .B1(
        \byte_controller/bit_controller/n135 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n137 ), .A2(
        \byte_controller/bit_controller/n13 ), .B1(
        \byte_controller/bit_controller/n136 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U110  ( .A1(
        \byte_controller/bit_controller/n132 ), .A2(
        \byte_controller/bit_controller/n12 ), .B1(
        \byte_controller/bit_controller/n131 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI22_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n133 ), .A2(
        \byte_controller/bit_controller/n13 ), .B1(
        \byte_controller/bit_controller/n132 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n99 ), .A2(
        \byte_controller/bit_controller/n267 ), .B1(
        \byte_controller/bit_controller/n133 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  NAND2_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n267 ) );
  NAND2_X1 \byte_controller/bit_controller/U106  ( .A1(
        \byte_controller/bit_controller/n278 ), .A2(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/n104 ) );
  INV_X1 \byte_controller/bit_controller/U105  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n100 ) );
  INV_X1 \byte_controller/bit_controller/U104  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n278 ) );
  NAND3_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n268 ), .A3(
        \byte_controller/bit_controller/n10 ), .ZN(
        \byte_controller/bit_controller/n99 ) );
  NOR4_X1 \byte_controller/bit_controller/U102  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n88 ), .A3(
        \byte_controller/bit_controller/n89 ), .A4(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n90 ) );
  NOR4_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n289 ), .A2(
        \byte_controller/bit_controller/n87 ), .A3(
        \byte_controller/bit_controller/n86 ), .A4(
        \byte_controller/bit_controller/n56 ), .ZN(
        \byte_controller/bit_controller/n91 ) );
  NOR4_X1 \byte_controller/bit_controller/U100  ( .A1(
        \byte_controller/bit_controller/n8 ), .A2(
        \byte_controller/bit_controller/n85 ), .A3(
        \byte_controller/bit_controller/n113 ), .A4(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n92 ) );
  NOR4_X1 \byte_controller/bit_controller/U99  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/bit_controller/n83 ), .A3(
        \byte_controller/bit_controller/n82 ), .A4(
        \byte_controller/bit_controller/n107 ), .ZN(
        \byte_controller/bit_controller/n93 ) );
  INV_X1 \byte_controller/bit_controller/U98  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n268 ) );
  OAI22_X1 \byte_controller/bit_controller/U97  ( .A1(
        \byte_controller/bit_controller/n138 ), .A2(
        \byte_controller/bit_controller/n12 ), .B1(
        \byte_controller/bit_controller/n137 ), .B2(
        \byte_controller/bit_controller/n280 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  INV_X1 \byte_controller/bit_controller/U96  ( .A(
        \byte_controller/bit_controller/n282 ), .ZN(
        \byte_controller/bit_controller/n81 ) );
  NAND2_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/bit_controller/n94 ), .A2(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n282 ) );
  NOR4_X1 \byte_controller/bit_controller/U94  ( .A1(
        \byte_controller/bit_controller/n120 ), .A2(
        \byte_controller/bit_controller/n119 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n79 ), .ZN(
        \byte_controller/bit_controller/N57 ) );
  OR2_X1 \byte_controller/bit_controller/U93  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N50 ) );
  NAND2_X1 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/N53 ) );
  OR2_X1 \byte_controller/bit_controller/U91  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N51 ) );
  AND2_X1 \byte_controller/bit_controller/U90  ( .A1(prer[6]), .A2(
        \byte_controller/bit_controller/n67 ), .ZN(
        \byte_controller/bit_controller/n78 ) );
  AND2_X1 \byte_controller/bit_controller/U89  ( .A1(
        \byte_controller/bit_controller/n70 ), .A2(
        \byte_controller/bit_controller/cnt_hold [6]), .ZN(
        \byte_controller/bit_controller/n77 ) );
  AND2_X1 \byte_controller/bit_controller/U88  ( .A1(prer[5]), .A2(
        \byte_controller/bit_controller/n67 ), .ZN(
        \byte_controller/bit_controller/n76 ) );
  AND2_X1 \byte_controller/bit_controller/U87  ( .A1(
        \byte_controller/bit_controller/n70 ), .A2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n75 ) );
  AND3_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n127 ), .A3(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  INV_X1 \byte_controller/bit_controller/U85  ( .A(
        \byte_controller/bit_controller/n73 ), .ZN(
        \byte_controller/bit_controller/n283 ) );
  NAND2_X1 \byte_controller/bit_controller/U84  ( .A1(
        \byte_controller/bit_controller/n255 ), .A2(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n72 ) );
  AND4_X2 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n173 ), .A2(
        \byte_controller/bit_controller/n3 ), .A3(
        \byte_controller/bit_controller/n172 ), .A4(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n70 ) );
  INV_X1 \byte_controller/bit_controller/U82  ( .A(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n265 ) );
  INV_X1 \byte_controller/bit_controller/U81  ( .A(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n68 ) );
  INV_X1 \byte_controller/bit_controller/U80  ( .A(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  NAND2_X1 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n7 ), .A2(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n65 ) );
  OAI21_X1 \byte_controller/bit_controller/U78  ( .B1(n150), .B2(wb_rst_i), 
        .A(\byte_controller/bit_controller/n219 ), .ZN(
        \byte_controller/bit_controller/n63 ) );
  NAND2_X1 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n167 ), .A2(
        \byte_controller/bit_controller/n168 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  INV_X1 \byte_controller/bit_controller/U76  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n272 ) );
  NAND2_X1 \byte_controller/bit_controller/U75  ( .A1(
        \byte_controller/bit_controller/n98 ), .A2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n55 ) );
  MUX2_X1 \byte_controller/bit_controller/U74  ( .A(
        \byte_controller/bit_controller/n54 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n55 ), .Z(
        \byte_controller/bit_controller/n53 ) );
  AND2_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n52 ) );
  OR4_X1 \byte_controller/bit_controller/U72  ( .A1(
        \byte_controller/bit_controller/cnt_hold [4]), .A2(
        \byte_controller/bit_controller/cnt_hold [5]), .A3(
        \byte_controller/bit_controller/cnt_hold [3]), .A4(
        \byte_controller/bit_controller/cnt_hold [2]), .ZN(
        \byte_controller/bit_controller/n51 ) );
  OR2_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n51 ), .A2(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n214 ) );
  AND2_X1 \byte_controller/bit_controller/U70  ( .A1(
        \byte_controller/bit_controller/n33 ), .A2(
        \byte_controller/bit_controller/n36 ), .ZN(
        \byte_controller/bit_controller/n50 ) );
  AND3_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n73 ), .A2(
        \byte_controller/bit_controller/n92 ), .A3(
        \byte_controller/bit_controller/n93 ), .ZN(
        \byte_controller/bit_controller/n64 ) );
  OR3_X1 \byte_controller/bit_controller/U68  ( .A1(
        \byte_controller/bit_controller/n78 ), .A2(
        \byte_controller/bit_controller/n77 ), .A3(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n49 ) );
  OR3_X1 \byte_controller/bit_controller/U67  ( .A1(
        \byte_controller/bit_controller/n76 ), .A2(
        \byte_controller/bit_controller/n75 ), .A3(
        \byte_controller/bit_controller/n216 ), .ZN(
        \byte_controller/bit_controller/n48 ) );
  BUF_X1 \byte_controller/bit_controller/U66  ( .A(\byte_controller/n21 ), .Z(
        \byte_controller/bit_controller/n57 ) );
  BUF_X1 \byte_controller/bit_controller/U65  ( .A(
        \byte_controller/bit_controller/n57 ), .Z(
        \byte_controller/bit_controller/n62 ) );
  BUF_X1 \byte_controller/bit_controller/U64  ( .A(
        \byte_controller/bit_controller/n62 ), .Z(
        \byte_controller/bit_controller/n58 ) );
  BUF_X1 \byte_controller/bit_controller/U63  ( .A(
        \byte_controller/bit_controller/n57 ), .Z(
        \byte_controller/bit_controller/n61 ) );
  BUF_X1 \byte_controller/bit_controller/U62  ( .A(
        \byte_controller/bit_controller/n61 ), .Z(
        \byte_controller/bit_controller/n59 ) );
  BUF_X1 \byte_controller/bit_controller/U61  ( .A(
        \byte_controller/bit_controller/n61 ), .Z(
        \byte_controller/bit_controller/n60 ) );
  INV_X1 \byte_controller/bit_controller/U60  ( .A(
        \byte_controller/bit_controller/cnt_hold [3]), .ZN(
        \byte_controller/bit_controller/n46 ) );
  BUF_X1 \byte_controller/bit_controller/U59  ( .A(
        \byte_controller/bit_controller/n242 ), .Z(
        \byte_controller/bit_controller/n44 ) );
  AND3_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n73 ), .A2(
        \byte_controller/bit_controller/n92 ), .A3(
        \byte_controller/bit_controller/n93 ), .ZN(
        \byte_controller/bit_controller/n43 ) );
  BUF_X1 \byte_controller/bit_controller/U57  ( .A(
        \byte_controller/bit_controller/n239 ), .Z(
        \byte_controller/bit_controller/n45 ) );
  AND4_X1 \byte_controller/bit_controller/U56  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(
        \byte_controller/bit_controller/n32 ), .A3(
        \byte_controller/bit_controller/n272 ), .A4(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n217 ) );
  INV_X1 \byte_controller/bit_controller/U55  ( .A(
        \byte_controller/bit_controller/cnt_hold [2]), .ZN(
        \byte_controller/bit_controller/n41 ) );
  BUF_X1 \byte_controller/bit_controller/U54  ( .A(
        \byte_controller/bit_controller/n32 ), .Z(
        \byte_controller/bit_controller/n37 ) );
  BUF_X1 \byte_controller/bit_controller/U53  ( .A(
        \byte_controller/bit_controller/n186 ), .Z(
        \byte_controller/bit_controller/n36 ) );
  INV_X1 \byte_controller/bit_controller/U52  ( .A(
        \byte_controller/bit_controller/cnt_hold [15]), .ZN(
        \byte_controller/bit_controller/n34 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U51  ( .A(
        \byte_controller/bit_controller/n252 ), .Z(
        \byte_controller/bit_controller/n42 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U50  ( .A(
        \byte_controller/bit_controller/n202 ), .Z(
        \byte_controller/bit_controller/n33 ) );
  BUF_X1 \byte_controller/bit_controller/U49  ( .A(
        \byte_controller/bit_controller/n212 ), .Z(
        \byte_controller/bit_controller/n32 ) );
  AND4_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n253 ), .A2(
        \byte_controller/bit_controller/n251 ), .A3(
        \byte_controller/bit_controller/n239 ), .A4(
        \byte_controller/bit_controller/n252 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  AND4_X1 \byte_controller/bit_controller/U47  ( .A1(
        \byte_controller/bit_controller/n242 ), .A2(
        \byte_controller/bit_controller/n243 ), .A3(
        \byte_controller/bit_controller/n254 ), .A4(
        \byte_controller/bit_controller/n102 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  INV_X1 \byte_controller/bit_controller/U46  ( .A(
        \byte_controller/bit_controller/n188 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  INV_X1 \byte_controller/bit_controller/U45  ( .A(prer[2]), .ZN(
        \byte_controller/bit_controller/n30 ) );
  OAI221_X1 \byte_controller/bit_controller/U44  ( .B1(
        \byte_controller/bit_controller/n27 ), .B2(
        \byte_controller/bit_controller/n37 ), .C1(
        \byte_controller/bit_controller/n30 ), .C2(
        \byte_controller/bit_controller/n178 ), .A(
        \byte_controller/bit_controller/n31 ), .ZN(
        \byte_controller/bit_controller/n298 ) );
  AOI211_X1 \byte_controller/bit_controller/U43  ( .C1(
        \byte_controller/bit_controller/n196 ), .C2(
        \byte_controller/bit_controller/n197 ), .A(
        \byte_controller/bit_controller/n293 ), .B(
        \byte_controller/bit_controller/n70 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  OAI21_X1 \byte_controller/bit_controller/U42  ( .B1(
        \byte_controller/bit_controller/n5 ), .B2(
        \byte_controller/bit_controller/cnt_hold [13]), .A(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n244 ) );
  INV_X1 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n29 ) );
  INV_X1 \byte_controller/bit_controller/U40  ( .A(prer[4]), .ZN(
        \byte_controller/bit_controller/n28 ) );
  INV_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  OAI221_X1 \byte_controller/bit_controller/U38  ( .B1(
        \byte_controller/bit_controller/n27 ), .B2(
        \byte_controller/bit_controller/n23 ), .C1(
        \byte_controller/bit_controller/n28 ), .C2(
        \byte_controller/bit_controller/n178 ), .A(
        \byte_controller/bit_controller/n29 ), .ZN(
        \byte_controller/bit_controller/n296 ) );
  INV_X1 \byte_controller/bit_controller/U37  ( .A(
        \byte_controller/bit_controller/cnt_hold [6]), .ZN(
        \byte_controller/bit_controller/n26 ) );
  AND3_X1 \byte_controller/bit_controller/U36  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n268 ), .A3(
        \byte_controller/bit_controller/n10 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  BUF_X1 \byte_controller/bit_controller/U35  ( .A(
        \byte_controller/bit_controller/n211 ), .Z(
        \byte_controller/bit_controller/n40 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U34  ( .A(
        \byte_controller/bit_controller/cnt_hold [10]), .Z(
        \byte_controller/bit_controller/n24 ) );
  INV_X1 \byte_controller/bit_controller/U33  ( .A(
        \byte_controller/bit_controller/cnt_hold [4]), .ZN(
        \byte_controller/bit_controller/n23 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U32  ( .A(
        \byte_controller/bit_controller/n110 ), .Z(
        \byte_controller/bit_controller/n22 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U31  ( .A(
        \byte_controller/bit_controller/n243 ), .Z(
        \byte_controller/bit_controller/n21 ) );
  BUF_X1 \byte_controller/bit_controller/U30  ( .A(
        \byte_controller/bit_controller/n251 ), .Z(
        \byte_controller/bit_controller/n39 ) );
  INV_X1 \byte_controller/bit_controller/U29  ( .A(
        \byte_controller/bit_controller/cnt_hold [14]), .ZN(
        \byte_controller/bit_controller/n20 ) );
  NAND2_X1 \byte_controller/bit_controller/U28  ( .A1(
        \byte_controller/bit_controller/n18 ), .A2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U27  ( .A(
        \byte_controller/bit_controller/n207 ), .Z(
        \byte_controller/bit_controller/n17 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U26  ( .A(
        \byte_controller/bit_controller/cnt_hold [11]), .Z(
        \byte_controller/bit_controller/n16 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U25  ( .A(
        \byte_controller/bit_controller/n205 ), .Z(
        \byte_controller/bit_controller/n15 ) );
  INV_X1 \byte_controller/bit_controller/U24  ( .A(
        \byte_controller/bit_controller/n41 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  OR2_X4 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n80 ), .A2(
        \byte_controller/bit_controller/n282 ), .ZN(
        \byte_controller/bit_controller/n280 ) );
  OR2_X1 \byte_controller/bit_controller/U22  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n276 ) );
  NAND2_X2 \byte_controller/bit_controller/U21  ( .A1(
        \byte_controller/bit_controller/n81 ), .A2(
        \byte_controller/bit_controller/n80 ), .ZN(
        \byte_controller/bit_controller/n13 ) );
  NAND2_X1 \byte_controller/bit_controller/U20  ( .A1(
        \byte_controller/bit_controller/n81 ), .A2(
        \byte_controller/bit_controller/n80 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  AND2_X1 \byte_controller/bit_controller/U19  ( .A1(
        \byte_controller/bit_controller/n278 ), .A2(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  BUF_X1 \byte_controller/bit_controller/U18  ( .A(
        \byte_controller/bit_controller/n253 ), .Z(
        \byte_controller/bit_controller/n38 ) );
  AND2_X1 \byte_controller/bit_controller/U17  ( .A1(
        \byte_controller/bit_controller/n81 ), .A2(
        \byte_controller/bit_controller/n80 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  AND4_X1 \byte_controller/bit_controller/U16  ( .A1(
        \byte_controller/bit_controller/n211 ), .A2(
        \byte_controller/bit_controller/n210 ), .A3(
        \byte_controller/bit_controller/n201 ), .A4(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/n19 ) );
  AND4_X2 \byte_controller/bit_controller/U15  ( .A1(
        \byte_controller/bit_controller/n173 ), .A2(
        \byte_controller/bit_controller/n174 ), .A3(
        \byte_controller/bit_controller/n172 ), .A4(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n71 ) );
  OAI21_X1 \byte_controller/bit_controller/U14  ( .B1(
        \byte_controller/bit_controller/n169 ), .B2(
        \byte_controller/bit_controller/n170 ), .A(n150), .ZN(
        \byte_controller/bit_controller/n7 ) );
  AND4_X1 \byte_controller/bit_controller/U13  ( .A1(
        \byte_controller/bit_controller/n173 ), .A2(
        \byte_controller/bit_controller/n174 ), .A3(
        \byte_controller/bit_controller/n172 ), .A4(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/U12  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n47 ) );
  INV_X1 \byte_controller/bit_controller/U11  ( .A(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n245 ) );
  AND3_X1 \byte_controller/bit_controller/U10  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/n44 ), .A3(
        \byte_controller/bit_controller/n241 ), .ZN(
        \byte_controller/bit_controller/n5 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U9  ( .A(
        \byte_controller/bit_controller/cnt_hold [5]), .Z(
        \byte_controller/bit_controller/n4 ) );
  NAND2_X1 \byte_controller/bit_controller/U8  ( .A1(n150), .A2(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  AND4_X2 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n202 ), .A2(
        \byte_controller/bit_controller/n186 ), .A3(
        \byte_controller/bit_controller/n212 ), .A4(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n18 ) );
  NAND2_X1 \byte_controller/bit_controller/U6  ( .A1(
        \byte_controller/bit_controller/n18 ), .A2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n2 ) );
  NAND2_X1 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n255 ), .A2(
        \byte_controller/bit_controller/n272 ), .ZN(
        \byte_controller/bit_controller/n1 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U4  ( .A(
        \byte_controller/bit_controller/n71 ), .Z(
        \byte_controller/bit_controller/n6 ) );
  AND2_X1 \byte_controller/bit_controller/U3  ( .A1(
        \byte_controller/bit_controller/n65 ), .A2(
        \byte_controller/bit_controller/n249 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n84 ), .QN(
        \byte_controller/bit_controller/n132 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n82 ), .QN(
        \byte_controller/bit_controller/n137 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/n21 ), .Q(\byte_controller/bit_controller/n107 ), 
        .QN(\byte_controller/bit_controller/n131 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n17 ), .CK(wb_clk_i), .SN(
        \byte_controller/n21 ), .Q(\byte_controller/bit_controller/n80 ), .QN(
        \byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n85 ), .QN(
        \byte_controller/bit_controller/n135 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n83 ), .QN(
        \byte_controller/bit_controller/n133 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n275 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n177 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n140 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n289 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n176 ), .CK(wb_clk_i), .SN(
        \byte_controller/n21 ), .Q(scl_padoen_o), .QN(
        \byte_controller/bit_controller/n139 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N53 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n79 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/n294 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n98 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n300 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt_hold [0]), .QN(
        \byte_controller/bit_controller/n202 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n299 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [1]), .QN(
        \byte_controller/bit_controller/n186 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n298 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [2]), .QN(
        \byte_controller/bit_controller/n212 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/n56 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n164 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [10]), .QN(
        \byte_controller/bit_controller/n252 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n163 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [11]), .QN(
        \byte_controller/bit_controller/n239 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n128 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n113 ), .QN(
        \byte_controller/bit_controller/n138 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/n21 ), .Q(\byte_controller/bit_controller/n89 ), .QN(
        \byte_controller/bit_controller/n125 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n160 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [14]), .QN(
        \byte_controller/bit_controller/n254 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n175 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [15]), .QN(
        \byte_controller/bit_controller/n102 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n296 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [4]), .QN(
        \byte_controller/bit_controller/n210 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n297 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [3]), .QN(
        \byte_controller/bit_controller/n211 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n295 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [7]), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n166 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [8]), .QN(
        \byte_controller/bit_controller/n251 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n162 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [12]), .QN(
        \byte_controller/bit_controller/n242 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n161 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [13]), .QN(
        \byte_controller/bit_controller/n243 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n165 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt_hold [9]), .QN(
        \byte_controller/bit_controller/n253 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n48 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt_hold [5]), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n49 ), .CK(wb_clk_i), .RN(
        \byte_controller/n21 ), .Q(
        \byte_controller/bit_controller/cnt_hold [6]), .QN(
        \byte_controller/bit_controller/n201 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n86 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n108 ), .QN(
        \byte_controller/bit_controller/n130 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n88 ), .QN(
        \byte_controller/bit_controller/n129 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n87 ), .QN(
        \byte_controller/bit_controller/n126 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(\byte_controller/core_ack )
         );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n273 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n9 ), .QN(
        \byte_controller/bit_controller/n134 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n8 ), .QN(
        \byte_controller/bit_controller/n136 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n127 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n95 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n94 ) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n53 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N59 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n97 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N57 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n274 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N56 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .QN(
        \byte_controller/bit_controller/n96 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N50 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n35 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N51 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n54 ), .QN(
        \byte_controller/bit_controller/n119 ) );
endmodule

