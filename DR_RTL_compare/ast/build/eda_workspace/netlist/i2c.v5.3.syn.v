/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 04:11:01 2026
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
  wire   N12, sr_1, done, i2c_al, irxack, N76, N77, N78, N79, N83, n1, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n37, n38, n40, n41, n42, n43, n44, n110, n111, n112, n113, n114,
         n115, n116, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, \byte_controller/n156 ,
         \byte_controller/n155 , \byte_controller/n154 ,
         \byte_controller/n153 , \byte_controller/n152 ,
         \byte_controller/n151 , \byte_controller/n150 ,
         \byte_controller/n149 , \byte_controller/n148 ,
         \byte_controller/n147 , \byte_controller/n146 ,
         \byte_controller/n145 , \byte_controller/n144 ,
         \byte_controller/n143 , \byte_controller/n142 ,
         \byte_controller/n141 , \byte_controller/n140 ,
         \byte_controller/n139 , \byte_controller/n138 ,
         \byte_controller/n137 , \byte_controller/n136 ,
         \byte_controller/n135 , \byte_controller/n134 ,
         \byte_controller/n133 , \byte_controller/n132 ,
         \byte_controller/n131 , \byte_controller/n130 ,
         \byte_controller/n129 , \byte_controller/n128 ,
         \byte_controller/n127 , \byte_controller/n126 ,
         \byte_controller/n125 , \byte_controller/n124 ,
         \byte_controller/n123 , \byte_controller/n122 ,
         \byte_controller/n121 , \byte_controller/n120 ,
         \byte_controller/n119 , \byte_controller/n118 ,
         \byte_controller/n117 , \byte_controller/n116 ,
         \byte_controller/n115 , \byte_controller/n114 ,
         \byte_controller/n113 , \byte_controller/n112 ,
         \byte_controller/n111 , \byte_controller/n110 ,
         \byte_controller/n109 , \byte_controller/n108 ,
         \byte_controller/n107 , \byte_controller/n106 ,
         \byte_controller/n105 , \byte_controller/n104 ,
         \byte_controller/n103 , \byte_controller/n102 ,
         \byte_controller/n101 , \byte_controller/n100 , \byte_controller/n78 ,
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
         \byte_controller/n29 , \byte_controller/n27 , \byte_controller/n26 ,
         \byte_controller/n25 , \byte_controller/n24 , \byte_controller/n23 ,
         \byte_controller/n22 , \byte_controller/n21 , \byte_controller/n20 ,
         \byte_controller/n19 , \byte_controller/n17 , \byte_controller/n16 ,
         \byte_controller/n14 , \byte_controller/n13 , \byte_controller/n12 ,
         \byte_controller/n11 , \byte_controller/n10 , \byte_controller/n9 ,
         \byte_controller/n8 , \byte_controller/n7 , \byte_controller/n5 ,
         \byte_controller/n4 , \byte_controller/n3 , \byte_controller/n2 ,
         \byte_controller/n1 , \byte_controller/n99 , \byte_controller/n98 ,
         \byte_controller/n97 , \byte_controller/n96 , \byte_controller/n95 ,
         \byte_controller/n94 , \byte_controller/n93 , \byte_controller/n92 ,
         \byte_controller/n91 , \byte_controller/n90 , \byte_controller/n89 ,
         \byte_controller/n88 , \byte_controller/n87 , \byte_controller/n86 ,
         \byte_controller/n85 , \byte_controller/n84 , \byte_controller/n83 ,
         \byte_controller/n82 , \byte_controller/n81 , \byte_controller/n80 ,
         \byte_controller/n79 , \byte_controller/n28 , \byte_controller/n18 ,
         \byte_controller/n15 , \byte_controller/n6 , \byte_controller/N107 ,
         \byte_controller/N106 , \byte_controller/N105 ,
         \byte_controller/N104 , \byte_controller/dcnt[1] ,
         \byte_controller/ld , \byte_controller/core_rxd ,
         \byte_controller/core_txd , \byte_controller/core_ack ,
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
         \byte_controller/bit_controller/n177 ,
         \byte_controller/bit_controller/n176 ,
         \byte_controller/bit_controller/n175 ,
         \byte_controller/bit_controller/n174 ,
         \byte_controller/bit_controller/n173 ,
         \byte_controller/bit_controller/n172 ,
         \byte_controller/bit_controller/n171 ,
         \byte_controller/bit_controller/n170 ,
         \byte_controller/bit_controller/n169 ,
         \byte_controller/bit_controller/n168 ,
         \byte_controller/bit_controller/n167 ,
         \byte_controller/bit_controller/n166 ,
         \byte_controller/bit_controller/n165 ,
         \byte_controller/bit_controller/n164 ,
         \byte_controller/bit_controller/n163 ,
         \byte_controller/bit_controller/n162 ,
         \byte_controller/bit_controller/n161 ,
         \byte_controller/bit_controller/n160 ,
         \byte_controller/bit_controller/n140 ,
         \byte_controller/bit_controller/n139 ,
         \byte_controller/bit_controller/n138 ,
         \byte_controller/bit_controller/n137 ,
         \byte_controller/bit_controller/n136 ,
         \byte_controller/bit_controller/n135 ,
         \byte_controller/bit_controller/n134 ,
         \byte_controller/bit_controller/n133 ,
         \byte_controller/bit_controller/n132 ,
         \byte_controller/bit_controller/n129 ,
         \byte_controller/bit_controller/n127 ,
         \byte_controller/bit_controller/n126 ,
         \byte_controller/bit_controller/n125 ,
         \byte_controller/bit_controller/n116 ,
         \byte_controller/bit_controller/n88 ,
         \byte_controller/bit_controller/n85 ,
         \byte_controller/bit_controller/n84 ,
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
         \byte_controller/bit_controller/n131 ,
         \byte_controller/bit_controller/n130 ,
         \byte_controller/bit_controller/n128 ,
         \byte_controller/bit_controller/n124 ,
         \byte_controller/bit_controller/n123 ,
         \byte_controller/bit_controller/n122 ,
         \byte_controller/bit_controller/n121 ,
         \byte_controller/bit_controller/n120 ,
         \byte_controller/bit_controller/n119 ,
         \byte_controller/bit_controller/n118 ,
         \byte_controller/bit_controller/n117 ,
         \byte_controller/bit_controller/n115 ,
         \byte_controller/bit_controller/n114 ,
         \byte_controller/bit_controller/n113 ,
         \byte_controller/bit_controller/n112 ,
         \byte_controller/bit_controller/n111 ,
         \byte_controller/bit_controller/n110 ,
         \byte_controller/bit_controller/n109 ,
         \byte_controller/bit_controller/n108 ,
         \byte_controller/bit_controller/n107 ,
         \byte_controller/bit_controller/n106 ,
         \byte_controller/bit_controller/n105 ,
         \byte_controller/bit_controller/n104 ,
         \byte_controller/bit_controller/n103 ,
         \byte_controller/bit_controller/n102 ,
         \byte_controller/bit_controller/n101 ,
         \byte_controller/bit_controller/n100 ,
         \byte_controller/bit_controller/n99 ,
         \byte_controller/bit_controller/n98 ,
         \byte_controller/bit_controller/n97 ,
         \byte_controller/bit_controller/n96 ,
         \byte_controller/bit_controller/n95 ,
         \byte_controller/bit_controller/n94 ,
         \byte_controller/bit_controller/n93 ,
         \byte_controller/bit_controller/n92 ,
         \byte_controller/bit_controller/n91 ,
         \byte_controller/bit_controller/n90 ,
         \byte_controller/bit_controller/n89 ,
         \byte_controller/bit_controller/n87 ,
         \byte_controller/bit_controller/n86 ,
         \byte_controller/bit_controller/n83 ,
         \byte_controller/bit_controller/n82 ,
         \byte_controller/bit_controller/n81 ,
         \byte_controller/bit_controller/n80 ,
         \byte_controller/bit_controller/n79 ,
         \byte_controller/bit_controller/N154 ,
         \byte_controller/bit_controller/N83 ,
         \byte_controller/bit_controller/N75 ,
         \byte_controller/bit_controller/N73 ,
         \byte_controller/bit_controller/N72 ,
         \byte_controller/bit_controller/sto_condition ,
         \byte_controller/bit_controller/N69 ,
         \byte_controller/bit_controller/N68 ,
         \byte_controller/bit_controller/N67 ,
         \byte_controller/bit_controller/N66 ,
         \byte_controller/bit_controller/N43 ,
         \byte_controller/bit_controller/N42 ,
         \byte_controller/bit_controller/N41 ,
         \byte_controller/bit_controller/N40 ,
         \byte_controller/bit_controller/N39 ,
         \byte_controller/bit_controller/N38 ,
         \byte_controller/bit_controller/N37 ,
         \byte_controller/bit_controller/N36 ,
         \byte_controller/bit_controller/N35 ,
         \byte_controller/bit_controller/N34 ,
         \byte_controller/bit_controller/N33 ,
         \byte_controller/bit_controller/N32 ,
         \byte_controller/bit_controller/N31 ,
         \byte_controller/bit_controller/N30 ,
         \byte_controller/bit_controller/N29 ,
         \byte_controller/bit_controller/N28 ,
         \byte_controller/bit_controller/sub_105/n134 ,
         \byte_controller/bit_controller/sub_105/n133 ,
         \byte_controller/bit_controller/sub_105/n132 ,
         \byte_controller/bit_controller/sub_105/n131 ,
         \byte_controller/bit_controller/sub_105/n130 ,
         \byte_controller/bit_controller/sub_105/n129 ,
         \byte_controller/bit_controller/sub_105/n128 ,
         \byte_controller/bit_controller/sub_105/n127 ,
         \byte_controller/bit_controller/sub_105/n126 ,
         \byte_controller/bit_controller/sub_105/n125 ,
         \byte_controller/bit_controller/sub_105/n124 ,
         \byte_controller/bit_controller/sub_105/n123 ,
         \byte_controller/bit_controller/sub_105/n122 ,
         \byte_controller/bit_controller/sub_105/n121 ,
         \byte_controller/bit_controller/sub_105/n120 ,
         \byte_controller/bit_controller/sub_105/n119 ,
         \byte_controller/bit_controller/sub_105/n118 ,
         \byte_controller/bit_controller/sub_105/n117 ,
         \byte_controller/bit_controller/sub_105/n116 ,
         \byte_controller/bit_controller/sub_105/n115 ,
         \byte_controller/bit_controller/sub_105/n114 ,
         \byte_controller/bit_controller/sub_105/n113 ,
         \byte_controller/bit_controller/sub_105/n112 ,
         \byte_controller/bit_controller/sub_105/n111 ,
         \byte_controller/bit_controller/sub_105/n110 ,
         \byte_controller/bit_controller/sub_105/n109 ,
         \byte_controller/bit_controller/sub_105/n108 ,
         \byte_controller/bit_controller/sub_105/n107 ,
         \byte_controller/bit_controller/sub_105/n106 ,
         \byte_controller/bit_controller/sub_105/n105 ,
         \byte_controller/bit_controller/sub_105/n104 ,
         \byte_controller/bit_controller/sub_105/n103 ,
         \byte_controller/bit_controller/sub_105/n102 ,
         \byte_controller/bit_controller/sub_105/n101 ,
         \byte_controller/bit_controller/sub_105/n100 ,
         \byte_controller/bit_controller/sub_105/n99 ,
         \byte_controller/bit_controller/sub_105/n98 ,
         \byte_controller/bit_controller/sub_105/n97 ,
         \byte_controller/bit_controller/sub_105/n96 ,
         \byte_controller/bit_controller/sub_105/n95 ,
         \byte_controller/bit_controller/sub_105/n94 ,
         \byte_controller/bit_controller/sub_105/n93 ,
         \byte_controller/bit_controller/sub_105/n92 ,
         \byte_controller/bit_controller/sub_105/n91 ,
         \byte_controller/bit_controller/sub_105/n90 ,
         \byte_controller/bit_controller/sub_105/n89 ,
         \byte_controller/bit_controller/sub_105/n88 ,
         \byte_controller/bit_controller/sub_105/n87 ,
         \byte_controller/bit_controller/sub_105/n86 ,
         \byte_controller/bit_controller/sub_105/n85 ,
         \byte_controller/bit_controller/sub_105/n84 ,
         \byte_controller/bit_controller/sub_105/n83 ,
         \byte_controller/bit_controller/sub_105/n82 ,
         \byte_controller/bit_controller/sub_105/n81 ,
         \byte_controller/bit_controller/sub_105/n80 ,
         \byte_controller/bit_controller/sub_105/n79 ,
         \byte_controller/bit_controller/sub_105/n78 ,
         \byte_controller/bit_controller/sub_105/n77 ,
         \byte_controller/bit_controller/sub_105/n76 ,
         \byte_controller/bit_controller/sub_105/n75 ,
         \byte_controller/bit_controller/sub_105/n74 ,
         \byte_controller/bit_controller/sub_105/n73 ,
         \byte_controller/bit_controller/sub_105/n72 ,
         \byte_controller/bit_controller/sub_105/n71 ,
         \byte_controller/bit_controller/sub_105/n70 ,
         \byte_controller/bit_controller/sub_105/n69 ,
         \byte_controller/bit_controller/sub_105/n68 ,
         \byte_controller/bit_controller/sub_105/n67 ,
         \byte_controller/bit_controller/sub_105/n66 ,
         \byte_controller/bit_controller/sub_105/n65 ,
         \byte_controller/bit_controller/sub_105/n64 ,
         \byte_controller/bit_controller/sub_105/n63 ,
         \byte_controller/bit_controller/sub_105/n62 ,
         \byte_controller/bit_controller/sub_105/n61 ,
         \byte_controller/bit_controller/sub_105/n60 ,
         \byte_controller/bit_controller/sub_105/n59 ,
         \byte_controller/bit_controller/sub_105/n58 ,
         \byte_controller/bit_controller/sub_105/n57 ,
         \byte_controller/bit_controller/sub_105/n56 ,
         \byte_controller/bit_controller/sub_105/n55 ,
         \byte_controller/bit_controller/sub_105/n54 ,
         \byte_controller/bit_controller/sub_105/n53 ,
         \byte_controller/bit_controller/sub_105/n52 ,
         \byte_controller/bit_controller/sub_105/n51 ,
         \byte_controller/bit_controller/sub_105/n50 ,
         \byte_controller/bit_controller/sub_105/n49 ,
         \byte_controller/bit_controller/sub_105/n48 ,
         \byte_controller/bit_controller/sub_105/n47 ,
         \byte_controller/bit_controller/sub_105/n46 ,
         \byte_controller/bit_controller/sub_105/n45 ,
         \byte_controller/bit_controller/sub_105/n44 ,
         \byte_controller/bit_controller/sub_105/n43 ,
         \byte_controller/bit_controller/sub_105/n42 ,
         \byte_controller/bit_controller/sub_105/n41 ,
         \byte_controller/bit_controller/sub_105/n40 ,
         \byte_controller/bit_controller/sub_105/n39 ,
         \byte_controller/bit_controller/sub_105/n38 ,
         \byte_controller/bit_controller/sub_105/n37 ,
         \byte_controller/bit_controller/sub_105/n36 ,
         \byte_controller/bit_controller/sub_105/n35 ,
         \byte_controller/bit_controller/sub_105/n34 ,
         \byte_controller/bit_controller/sub_105/n33 ,
         \byte_controller/bit_controller/sub_105/n32 ,
         \byte_controller/bit_controller/sub_105/n31 ,
         \byte_controller/bit_controller/sub_105/n30 ,
         \byte_controller/bit_controller/sub_105/n29 ,
         \byte_controller/bit_controller/sub_105/n28 ,
         \byte_controller/bit_controller/sub_105/n27 ,
         \byte_controller/bit_controller/sub_105/n26 ,
         \byte_controller/bit_controller/sub_105/n25 ,
         \byte_controller/bit_controller/sub_105/n24 ,
         \byte_controller/bit_controller/sub_105/n23 ,
         \byte_controller/bit_controller/sub_105/n22 ,
         \byte_controller/bit_controller/sub_105/n21 ,
         \byte_controller/bit_controller/sub_105/n20 ,
         \byte_controller/bit_controller/sub_105/n19 ,
         \byte_controller/bit_controller/sub_105/n18 ,
         \byte_controller/bit_controller/sub_105/n17 ,
         \byte_controller/bit_controller/sub_105/n16 ,
         \byte_controller/bit_controller/sub_105/n15 ,
         \byte_controller/bit_controller/sub_105/n13 ,
         \byte_controller/bit_controller/sub_105/n12 ,
         \byte_controller/bit_controller/sub_105/n11 ,
         \byte_controller/bit_controller/sub_105/n10 ,
         \byte_controller/bit_controller/sub_105/n9 ,
         \byte_controller/bit_controller/sub_105/n8 ,
         \byte_controller/bit_controller/sub_105/n7 ,
         \byte_controller/bit_controller/sub_105/n6 ,
         \byte_controller/bit_controller/sub_105/n5 ,
         \byte_controller/bit_controller/sub_105/n4 ,
         \byte_controller/bit_controller/sub_105/n3 ,
         \byte_controller/bit_controller/sub_105/n2 ,
         \byte_controller/bit_controller/sub_105/n1 ;
  wire   [15:0] prer;
  wire   [7:0] ctr;
  wire   [7:0] rxr;
  wire   [7:5] sr;
  wire   [7:0] txr;
  wire   [7:0] cr;
  wire   [7:0] wb_dat_o_next;
  wire   [4:0] \byte_controller/c_state ;
  wire   [3:0] \byte_controller/core_cmd ;
  wire   [15:0] \byte_controller/bit_controller/cnt ;
  assign scl_pad_o = 1'b0;
  assign sda_pad_o = 1'b0;

  DFF_X1 wb_ack_o_reg ( .D(N12), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \ctr_reg[7]  ( .D(n149), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[6]  ( .D(n148), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[5]  ( .D(n147), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n5) );
  DFFR_X1 \ctr_reg[4]  ( .D(n146), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[3]  ( .D(n145), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n7) );
  DFFR_X1 \ctr_reg[2]  ( .D(n144), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n8) );
  DFFR_X1 \ctr_reg[1]  ( .D(n143), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n9) );
  DFFR_X1 \ctr_reg[0]  ( .D(n142), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n10) );
  DFFR_X1 \txr_reg[7]  ( .D(n141), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n11) );
  DFFR_X1 \txr_reg[6]  ( .D(n140), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n12) );
  DFFR_X1 \txr_reg[1]  ( .D(n135), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n17) );
  DFFS_X1 \prer_reg[15]  ( .D(n133), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[14]  ( .D(n132), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[13]  ( .D(n131), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n21) );
  DFFS_X1 \prer_reg[12]  ( .D(n130), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n22) );
  DFFS_X1 \prer_reg[11]  ( .D(n129), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n23) );
  DFFS_X1 \prer_reg[10]  ( .D(n128), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n24) );
  DFFS_X1 \prer_reg[9]  ( .D(n127), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n25) );
  DFFS_X1 \prer_reg[8]  ( .D(n126), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n26) );
  DFFS_X1 \prer_reg[7]  ( .D(n125), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n27) );
  DFFS_X1 \prer_reg[6]  ( .D(n124), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n28) );
  DFFS_X1 \prer_reg[5]  ( .D(n123), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n29) );
  DFFR_X1 \cr_reg[3]  ( .D(n159), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(wb_dat_o_next[6]), .CK(wb_clk_i), .Q(
        wb_dat_o[6]) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(wb_dat_o_next[4]), .CK(wb_clk_i), .Q(
        wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(wb_dat_o_next[3]), .CK(wb_clk_i), .Q(
        wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(wb_dat_o_next[2]), .CK(wb_clk_i), .Q(
        wb_dat_o[2]) );
  DFFR_X1 al_reg ( .D(N76), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]), .QN(n43) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(wb_dat_o_next[5]), .CK(wb_clk_i), .Q(
        wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N77), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(wb_dat_o_next[7]), .CK(wb_clk_i), .Q(
        wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N78), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(wb_dat_o_next[1]), .CK(wb_clk_i), .Q(
        wb_dat_o[1]) );
  DFFR_X1 irq_flag_reg ( .D(N79), .CK(wb_clk_i), .RN(arst_i), .QN(n44) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(wb_dat_o_next[0]), .CK(wb_clk_i), .Q(
        wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N83), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFS_X1 \prer_reg[0]  ( .D(n118), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n34) );
  DFFS_X1 \prer_reg[4]  ( .D(n122), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n30) );
  DFFS_X1 \prer_reg[3]  ( .D(n121), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n31) );
  DFFS_X1 \prer_reg[2]  ( .D(n120), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n32) );
  DFFS_X1 \prer_reg[1]  ( .D(n119), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n33) );
  DFFR_X1 \txr_reg[4]  ( .D(n138), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n14) );
  DFFR_X1 \txr_reg[3]  ( .D(n137), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n15) );
  DFFR_X1 \txr_reg[2]  ( .D(n136), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n16) );
  DFFR_X1 \txr_reg[5]  ( .D(n139), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n13) );
  DFFR_X1 \txr_reg[0]  ( .D(n134), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n18) );
  DFFR_X1 \cr_reg[1]  ( .D(n111), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]), .QN(
        n41) );
  DFFR_X1 \cr_reg[0]  ( .D(n110), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n42) );
  DFFR_X1 \cr_reg[2]  ( .D(n112), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]), .QN(
        n40) );
  DFFR_X1 \cr_reg[7]  ( .D(n113), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n232) );
  DFFR_X1 \cr_reg[4]  ( .D(n116), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n38) );
  DFFR_X1 \cr_reg[5]  ( .D(n115), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n37) );
  DFFR_X1 \cr_reg[6]  ( .D(n114), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n227) );
  INV_X1 U123 ( .A(n164), .ZN(n188) );
  AND2_X1 U124 ( .A1(n188), .A2(n157), .ZN(n150) );
  AND2_X1 U125 ( .A1(n188), .A2(n238), .ZN(n151) );
  AND3_X1 U126 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n152) );
  NAND2_X1 U127 ( .A1(n187), .A2(n152), .ZN(n153) );
  NAND2_X1 U128 ( .A1(n188), .A2(n202), .ZN(n154) );
  OAI21_X1 U129 ( .B1(n152), .B2(n158), .A(n187), .ZN(n155) );
  OAI21_X1 U130 ( .B1(n152), .B2(n158), .A(n187), .ZN(n166) );
  AND2_X2 U131 ( .A1(n165), .A2(n231), .ZN(n187) );
  INV_X1 U132 ( .A(n38), .ZN(n156) );
  AND3_X1 U133 ( .A1(n193), .A2(n176), .A3(n192), .ZN(n157) );
  NOR2_X1 U134 ( .A1(i2c_al), .A2(done), .ZN(n158) );
  MUX2_X1 U135 ( .A(n160), .B(cr[3]), .S(n187), .Z(n159) );
  AND2_X1 U136 ( .A1(wb_dat_i[3]), .A2(n188), .ZN(n160) );
  INV_X1 U137 ( .A(wb_rst_i), .ZN(n231) );
  INV_X1 U139 ( .A(wb_dat_i[0]), .ZN(n189) );
  NAND2_X1 U140 ( .A1(n152), .A2(n231), .ZN(n164) );
  INV_X1 U141 ( .A(wb_adr_i[2]), .ZN(n176) );
  NAND3_X1 U142 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[1]), .A3(n176), .ZN(n191) );
  OAI21_X1 U143 ( .B1(n191), .B2(n164), .A(n231), .ZN(n162) );
  NAND2_X1 U144 ( .A1(n188), .A2(n162), .ZN(n163) );
  OAI22_X1 U145 ( .A1(n189), .A2(n163), .B1(n18), .B2(n162), .ZN(n134) );
  INV_X1 U146 ( .A(wb_dat_i[1]), .ZN(n197) );
  OAI22_X1 U147 ( .A1(n197), .A2(n163), .B1(n17), .B2(n162), .ZN(n135) );
  INV_X1 U148 ( .A(wb_dat_i[2]), .ZN(n203) );
  OAI22_X1 U149 ( .A1(n203), .A2(n163), .B1(n16), .B2(n162), .ZN(n136) );
  INV_X1 U150 ( .A(wb_dat_i[3]), .ZN(n207) );
  OAI22_X1 U151 ( .A1(n207), .A2(n163), .B1(n15), .B2(n162), .ZN(n137) );
  INV_X1 U152 ( .A(wb_dat_i[4]), .ZN(n211) );
  OAI22_X1 U153 ( .A1(n211), .A2(n163), .B1(n14), .B2(n162), .ZN(n138) );
  INV_X1 U154 ( .A(wb_dat_i[5]), .ZN(n219) );
  OAI22_X1 U155 ( .A1(n219), .A2(n163), .B1(n13), .B2(n162), .ZN(n139) );
  INV_X1 U156 ( .A(wb_dat_i[6]), .ZN(n186) );
  OAI22_X1 U157 ( .A1(n186), .A2(n163), .B1(n12), .B2(n162), .ZN(n140) );
  INV_X1 U158 ( .A(wb_dat_i[7]), .ZN(n184) );
  OAI22_X1 U159 ( .A1(n184), .A2(n163), .B1(n11), .B2(n162), .ZN(n141) );
  INV_X1 U160 ( .A(wb_adr_i[0]), .ZN(n193) );
  NAND3_X1 U161 ( .A1(wb_adr_i[1]), .A2(n193), .A3(n176), .ZN(n190) );
  OAI21_X1 U162 ( .B1(n190), .B2(n164), .A(n231), .ZN(n218) );
  NAND2_X1 U163 ( .A1(n188), .A2(n218), .ZN(n220) );
  OAI22_X1 U164 ( .A1(n220), .A2(n184), .B1(n3), .B2(n218), .ZN(n149) );
  INV_X1 U165 ( .A(wb_adr_i[1]), .ZN(n192) );
  NAND3_X1 U166 ( .A1(wb_adr_i[2]), .A2(n193), .A3(n192), .ZN(n226) );
  INV_X1 U167 ( .A(n226), .ZN(n239) );
  NAND3_X1 U168 ( .A1(ctr[7]), .A2(n239), .A3(n188), .ZN(n165) );
  NAND2_X1 U169 ( .A1(n188), .A2(n166), .ZN(n167) );
  OAI22_X1 U170 ( .A1(n211), .A2(n167), .B1(n38), .B2(n155), .ZN(n116) );
  OAI22_X1 U171 ( .A1(n219), .A2(n167), .B1(n37), .B2(n155), .ZN(n115) );
  OAI22_X1 U172 ( .A1(n186), .A2(n167), .B1(n227), .B2(n155), .ZN(n114) );
  OAI22_X1 U173 ( .A1(n167), .A2(n184), .B1(n232), .B2(n155), .ZN(n113) );
  MUX2_X1 U174 ( .A(n34), .B(n189), .S(n150), .Z(n168) );
  NAND2_X1 U175 ( .A1(n231), .A2(n168), .ZN(n118) );
  MUX2_X1 U176 ( .A(n33), .B(n197), .S(n150), .Z(n169) );
  NAND2_X1 U177 ( .A1(n231), .A2(n169), .ZN(n119) );
  MUX2_X1 U178 ( .A(n32), .B(n203), .S(n150), .Z(n170) );
  NAND2_X1 U179 ( .A1(n231), .A2(n170), .ZN(n120) );
  MUX2_X1 U180 ( .A(n31), .B(n207), .S(n150), .Z(n171) );
  NAND2_X1 U181 ( .A1(n231), .A2(n171), .ZN(n121) );
  MUX2_X1 U182 ( .A(n30), .B(n211), .S(n150), .Z(n172) );
  NAND2_X1 U183 ( .A1(n231), .A2(n172), .ZN(n122) );
  MUX2_X1 U184 ( .A(n29), .B(n219), .S(n150), .Z(n173) );
  NAND2_X1 U185 ( .A1(n231), .A2(n173), .ZN(n123) );
  MUX2_X1 U186 ( .A(n28), .B(n186), .S(n150), .Z(n174) );
  NAND2_X1 U187 ( .A1(n231), .A2(n174), .ZN(n124) );
  MUX2_X1 U188 ( .A(n27), .B(n184), .S(n150), .Z(n175) );
  NAND2_X1 U189 ( .A1(n231), .A2(n175), .ZN(n125) );
  NAND3_X1 U190 ( .A1(wb_adr_i[0]), .A2(n176), .A3(n192), .ZN(n217) );
  INV_X1 U191 ( .A(n217), .ZN(n238) );
  MUX2_X1 U192 ( .A(n26), .B(n189), .S(n151), .Z(n177) );
  NAND2_X1 U193 ( .A1(n231), .A2(n177), .ZN(n126) );
  MUX2_X1 U194 ( .A(n25), .B(n197), .S(n151), .Z(n178) );
  NAND2_X1 U195 ( .A1(n231), .A2(n178), .ZN(n127) );
  MUX2_X1 U196 ( .A(n24), .B(n203), .S(n151), .Z(n179) );
  NAND2_X1 U197 ( .A1(n231), .A2(n179), .ZN(n128) );
  MUX2_X1 U198 ( .A(n23), .B(n207), .S(n151), .Z(n180) );
  NAND2_X1 U199 ( .A1(n231), .A2(n180), .ZN(n129) );
  MUX2_X1 U200 ( .A(n22), .B(n211), .S(n151), .Z(n181) );
  NAND2_X1 U201 ( .A1(n231), .A2(n181), .ZN(n130) );
  MUX2_X1 U202 ( .A(n21), .B(n219), .S(n151), .Z(n182) );
  NAND2_X1 U203 ( .A1(n231), .A2(n182), .ZN(n131) );
  MUX2_X1 U204 ( .A(n20), .B(n186), .S(n151), .Z(n183) );
  NAND2_X1 U205 ( .A1(n231), .A2(n183), .ZN(n132) );
  MUX2_X1 U206 ( .A(n19), .B(n184), .S(n151), .Z(n185) );
  NAND2_X1 U207 ( .A1(n231), .A2(n185), .ZN(n133) );
  OAI22_X1 U208 ( .A1(n220), .A2(n186), .B1(n4), .B2(n218), .ZN(n148) );
  NAND2_X1 U209 ( .A1(n187), .A2(n152), .ZN(n202) );
  NAND2_X1 U210 ( .A1(n188), .A2(n202), .ZN(n201) );
  OAI22_X1 U211 ( .A1(n42), .A2(n153), .B1(n154), .B2(n189), .ZN(n110) );
  AOI211_X1 U212 ( .C1(n44), .C2(n158), .A(cr[0]), .B(wb_rst_i), .ZN(N79) );
  NOR3_X1 U213 ( .A1(n44), .A2(n4), .A3(wb_rst_i), .ZN(N83) );
  AND3_X1 U214 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N12) );
  OAI22_X1 U215 ( .A1(n220), .A2(n189), .B1(n10), .B2(n218), .ZN(n142) );
  AOI22_X1 U216 ( .A1(prer[0]), .A2(n157), .B1(prer[8]), .B2(n238), .ZN(n196)
         );
  INV_X1 U217 ( .A(n190), .ZN(n237) );
  INV_X1 U218 ( .A(n191), .ZN(n236) );
  NAND3_X1 U219 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[2]), .A3(n192), .ZN(n234) );
  NAND3_X1 U220 ( .A1(wb_adr_i[2]), .A2(wb_adr_i[1]), .A3(n193), .ZN(n233) );
  OAI22_X1 U221 ( .A1(n18), .A2(n234), .B1(n42), .B2(n233), .ZN(n194) );
  AOI221_X1 U222 ( .B1(ctr[0]), .B2(n237), .C1(rxr[0]), .C2(n236), .A(n194), 
        .ZN(n195) );
  OAI211_X1 U223 ( .C1(n44), .C2(n226), .A(n196), .B(n195), .ZN(
        wb_dat_o_next[0]) );
  OAI22_X1 U224 ( .A1(n41), .A2(n153), .B1(n154), .B2(n197), .ZN(n111) );
  OAI22_X1 U225 ( .A1(n220), .A2(n197), .B1(n9), .B2(n218), .ZN(n143) );
  AOI21_X1 U226 ( .B1(n37), .B2(n38), .A(wb_rst_i), .ZN(N78) );
  INV_X1 U227 ( .A(n233), .ZN(n213) );
  INV_X1 U228 ( .A(n234), .ZN(n212) );
  AOI22_X1 U229 ( .A1(cr[1]), .A2(n213), .B1(txr[1]), .B2(n212), .ZN(n200) );
  AOI22_X1 U230 ( .A1(ctr[1]), .A2(n237), .B1(rxr[1]), .B2(n236), .ZN(n199) );
  AOI222_X1 U231 ( .A1(sr_1), .A2(n239), .B1(prer[1]), .B2(n157), .C1(prer[9]), 
        .C2(n238), .ZN(n198) );
  NAND3_X1 U232 ( .A1(n200), .A2(n199), .A3(n198), .ZN(wb_dat_o_next[1]) );
  OAI22_X1 U233 ( .A1(n40), .A2(n153), .B1(n203), .B2(n201), .ZN(n112) );
  OAI22_X1 U234 ( .A1(n220), .A2(n203), .B1(n8), .B2(n218), .ZN(n144) );
  INV_X1 U235 ( .A(prer[10]), .ZN(n206) );
  AOI22_X1 U236 ( .A1(rxr[2]), .A2(n236), .B1(n157), .B2(prer[2]), .ZN(n205)
         );
  AOI222_X1 U237 ( .A1(ctr[2]), .A2(n237), .B1(cr[2]), .B2(n213), .C1(txr[2]), 
        .C2(n212), .ZN(n204) );
  OAI211_X1 U238 ( .C1(n217), .C2(n206), .A(n205), .B(n204), .ZN(
        wb_dat_o_next[2]) );
  OAI22_X1 U239 ( .A1(n220), .A2(n207), .B1(n7), .B2(n218), .ZN(n145) );
  INV_X1 U240 ( .A(prer[11]), .ZN(n210) );
  AOI22_X1 U241 ( .A1(rxr[3]), .A2(n236), .B1(n157), .B2(prer[3]), .ZN(n209)
         );
  AOI222_X1 U242 ( .A1(ctr[3]), .A2(n237), .B1(cr[3]), .B2(n213), .C1(txr[3]), 
        .C2(n212), .ZN(n208) );
  OAI211_X1 U243 ( .C1(n217), .C2(n210), .A(n209), .B(n208), .ZN(
        wb_dat_o_next[3]) );
  OAI22_X1 U244 ( .A1(n220), .A2(n211), .B1(n6), .B2(n218), .ZN(n146) );
  INV_X1 U245 ( .A(prer[12]), .ZN(n216) );
  AOI22_X1 U246 ( .A1(rxr[4]), .A2(n236), .B1(n157), .B2(prer[4]), .ZN(n215)
         );
  AOI222_X1 U247 ( .A1(ctr[4]), .A2(n237), .B1(n156), .B2(n213), .C1(txr[4]), 
        .C2(n212), .ZN(n214) );
  OAI211_X1 U248 ( .C1(n217), .C2(n216), .A(n215), .B(n214), .ZN(
        wb_dat_o_next[4]) );
  OAI22_X1 U249 ( .A1(n220), .A2(n219), .B1(n5), .B2(n218), .ZN(n147) );
  NAND2_X1 U250 ( .A1(sr[5]), .A2(n232), .ZN(n222) );
  INV_X1 U251 ( .A(i2c_al), .ZN(n221) );
  AOI21_X1 U252 ( .B1(n222), .B2(n221), .A(wb_rst_i), .ZN(N76) );
  AOI22_X1 U253 ( .A1(prer[5]), .A2(n157), .B1(prer[13]), .B2(n238), .ZN(n225)
         );
  OAI22_X1 U254 ( .A1(n13), .A2(n234), .B1(n37), .B2(n233), .ZN(n223) );
  AOI221_X1 U255 ( .B1(ctr[5]), .B2(n237), .C1(rxr[5]), .C2(n236), .A(n223), 
        .ZN(n224) );
  OAI211_X1 U256 ( .C1(n43), .C2(n226), .A(n225), .B(n224), .ZN(
        wb_dat_o_next[5]) );
  OAI22_X1 U257 ( .A1(n234), .A2(n12), .B1(n233), .B2(n227), .ZN(n228) );
  AOI221_X1 U258 ( .B1(ctr[6]), .B2(n237), .C1(rxr[6]), .C2(n236), .A(n228), 
        .ZN(n230) );
  AOI222_X1 U259 ( .A1(sr[6]), .A2(n239), .B1(prer[6]), .B2(n157), .C1(
        prer[14]), .C2(n238), .ZN(n229) );
  NAND2_X1 U260 ( .A1(n230), .A2(n229), .ZN(wb_dat_o_next[6]) );
  AND2_X1 U261 ( .A1(irxack), .A2(n231), .ZN(N77) );
  OAI22_X1 U262 ( .A1(n234), .A2(n11), .B1(n233), .B2(n232), .ZN(n235) );
  AOI221_X1 U263 ( .B1(ctr[7]), .B2(n237), .C1(rxr[7]), .C2(n236), .A(n235), 
        .ZN(n241) );
  AOI222_X1 U264 ( .A1(sr[7]), .A2(n239), .B1(prer[7]), .B2(n157), .C1(
        prer[15]), .C2(n238), .ZN(n240) );
  NAND2_X1 U265 ( .A1(n241), .A2(n240), .ZN(wb_dat_o_next[7]) );
  NOR2_X1 \byte_controller/U138  ( .A1(\byte_controller/n156 ), .A2(
        \byte_controller/n10 ), .ZN(\byte_controller/n79 ) );
  NAND3_X1 \byte_controller/U137  ( .A1(\byte_controller/n152 ), .A2(
        \byte_controller/n151 ), .A3(\byte_controller/n150 ), .ZN(
        \byte_controller/n80 ) );
  NAND3_X1 \byte_controller/U136  ( .A1(\byte_controller/core_cmd [3]), .A2(
        \byte_controller/n38 ), .A3(\byte_controller/n7 ), .ZN(
        \byte_controller/n150 ) );
  OAI221_X1 \byte_controller/U135  ( .B1(\byte_controller/n147 ), .B2(
        \byte_controller/n148 ), .C1(\byte_controller/n8 ), .C2(
        \byte_controller/c_state [2]), .A(\byte_controller/n146 ), .ZN(
        \byte_controller/n152 ) );
  OAI21_X1 \byte_controller/U134  ( .B1(\byte_controller/n145 ), .B2(
        \byte_controller/n144 ), .A(\byte_controller/n143 ), .ZN(
        \byte_controller/n146 ) );
  INV_X1 \byte_controller/U133  ( .A(\byte_controller/n23 ), .ZN(
        \byte_controller/n147 ) );
  INV_X1 \byte_controller/U132  ( .A(\byte_controller/n141 ), .ZN(
        \byte_controller/n148 ) );
  OR3_X1 \byte_controller/U131  ( .A1(\byte_controller/n140 ), .A2(
        \byte_controller/n138 ), .A3(\byte_controller/n139 ), .ZN(
        \byte_controller/n81 ) );
  OAI33_X1 \byte_controller/U130  ( .A1(\byte_controller/n30 ), .A2(
        \byte_controller/n10 ), .A3(\byte_controller/n137 ), .B1(
        \byte_controller/n30 ), .B2(\byte_controller/n10 ), .B3(
        \byte_controller/n136 ), .ZN(\byte_controller/n138 ) );
  INV_X1 \byte_controller/U129  ( .A(\byte_controller/n135 ), .ZN(
        \byte_controller/n140 ) );
  NAND2_X1 \byte_controller/U128  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n133 ), .ZN(\byte_controller/n82 ) );
  OR3_X1 \byte_controller/U127  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n28 ), .A3(\byte_controller/n10 ), .ZN(
        \byte_controller/n133 ) );
  NAND2_X1 \byte_controller/U126  ( .A1(\byte_controller/n132 ), .A2(
        \byte_controller/n131 ), .ZN(\byte_controller/n83 ) );
  NAND3_X1 \byte_controller/U125  ( .A1(\byte_controller/n7 ), .A2(
        \byte_controller/n38 ), .A3(\byte_controller/core_cmd [0]), .ZN(
        \byte_controller/n131 ) );
  AOI21_X1 \byte_controller/U124  ( .B1(\byte_controller/n130 ), .B2(
        \byte_controller/n153 ), .A(\byte_controller/n10 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U123  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n153 ) );
  AOI22_X1 \byte_controller/U122  ( .A1(cr[3]), .A2(\byte_controller/n129 ), 
        .B1(\byte_controller/n128 ), .B2(rxr[7]), .ZN(\byte_controller/n130 )
         );
  NAND3_X1 \byte_controller/U121  ( .A1(\byte_controller/n127 ), .A2(
        \byte_controller/n25 ), .A3(\byte_controller/n125 ), .ZN(
        \byte_controller/n128 ) );
  AOI221_X1 \byte_controller/U120  ( .B1(\byte_controller/n144 ), .B2(
        \byte_controller/n26 ), .C1(\byte_controller/n123 ), .C2(
        \byte_controller/c_state [1]), .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n125 ) );
  OAI21_X1 \byte_controller/U119  ( .B1(\byte_controller/n123 ), .B2(
        \byte_controller/n144 ), .A(\byte_controller/n26 ), .ZN(
        \byte_controller/n129 ) );
  OAI221_X1 \byte_controller/U118  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n16 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n120 ), .A(\byte_controller/n119 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U117  ( .A1(txr[7]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n119 ) );
  OAI221_X1 \byte_controller/U116  ( .B1(\byte_controller/n120 ), .B2(
        \byte_controller/n17 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n117 ), .A(\byte_controller/n116 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U115  ( .A1(txr[6]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n116 ) );
  OAI221_X1 \byte_controller/U114  ( .B1(\byte_controller/n117 ), .B2(
        \byte_controller/n16 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n115 ), .A(\byte_controller/n114 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U113  ( .A1(txr[5]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n114 ) );
  OAI221_X1 \byte_controller/U112  ( .B1(\byte_controller/n115 ), .B2(
        \byte_controller/n17 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n113 ), .A(\byte_controller/n112 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U111  ( .A1(txr[4]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n112 ) );
  OAI221_X1 \byte_controller/U110  ( .B1(\byte_controller/n16 ), .B2(
        \byte_controller/n113 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n111 ), .A(\byte_controller/n110 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U109  ( .A1(txr[3]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n110 ) );
  OAI221_X1 \byte_controller/U108  ( .B1(\byte_controller/n111 ), .B2(
        \byte_controller/n14 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n109 ), .A(\byte_controller/n108 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U107  ( .A1(txr[2]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n108 ) );
  OAI221_X1 \byte_controller/U106  ( .B1(\byte_controller/n109 ), .B2(
        \byte_controller/n14 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n107 ), .A(\byte_controller/n106 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U105  ( .A1(txr[1]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n106 ) );
  OAI221_X1 \byte_controller/U104  ( .B1(\byte_controller/n107 ), .B2(
        \byte_controller/n14 ), .C1(\byte_controller/n121 ), .C2(
        \byte_controller/n154 ), .A(\byte_controller/n105 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U103  ( .A1(txr[0]), .A2(\byte_controller/n118 ), 
        .ZN(\byte_controller/n105 ) );
  INV_X1 \byte_controller/U102  ( .A(\byte_controller/n104 ), .ZN(
        \byte_controller/n118 ) );
  INV_X1 \byte_controller/U101  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n154 ) );
  NAND3_X1 \byte_controller/U100  ( .A1(\byte_controller/n121 ), .A2(
        \byte_controller/n103 ), .A3(\byte_controller/n104 ), .ZN(
        \byte_controller/n122 ) );
  NAND3_X1 \byte_controller/U99  ( .A1(\byte_controller/n100 ), .A2(
        \byte_controller/n101 ), .A3(\byte_controller/n102 ), .ZN(
        \byte_controller/n84 ) );
  NAND2_X1 \byte_controller/U98  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/n77 ), .ZN(\byte_controller/n137 ) );
  NAND3_X1 \byte_controller/U97  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n38 ), .A3(\byte_controller/n7 ), .ZN(
        \byte_controller/n101 ) );
  NAND3_X1 \byte_controller/U96  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n76 ), .A3(\byte_controller/n27 ), .ZN(
        \byte_controller/n102 ) );
  NAND2_X1 \byte_controller/U95  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n77 ), .ZN(\byte_controller/n143 ) );
  AOI21_X1 \byte_controller/U94  ( .B1(\byte_controller/n74 ), .B2(
        \byte_controller/n25 ), .A(\byte_controller/n73 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U93  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n19 ), .ZN(\byte_controller/n74 ) );
  NAND2_X1 \byte_controller/U92  ( .A1(\byte_controller/n71 ), .A2(
        \byte_controller/n134 ), .ZN(\byte_controller/n91 ) );
  NAND3_X1 \byte_controller/U91  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/n70 ), .A3(\byte_controller/n7 ), .ZN(
        \byte_controller/n71 ) );
  NAND2_X1 \byte_controller/U90  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n69 ), .ZN(\byte_controller/n134 ) );
  OAI21_X1 \byte_controller/U89  ( .B1(\byte_controller/n19 ), .B2(
        \byte_controller/n13 ), .A(\byte_controller/n68 ), .ZN(
        \byte_controller/n69 ) );
  NAND4_X1 \byte_controller/U88  ( .A1(\byte_controller/n21 ), .A2(
        \byte_controller/n22 ), .A3(\byte_controller/n9 ), .A4(
        \byte_controller/n65 ), .ZN(\byte_controller/n68 ) );
  INV_X1 \byte_controller/U87  ( .A(cr[7]), .ZN(\byte_controller/n65 ) );
  NAND2_X1 \byte_controller/U86  ( .A1(\byte_controller/n64 ), .A2(
        \byte_controller/n135 ), .ZN(\byte_controller/n85 ) );
  NAND3_X1 \byte_controller/U85  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/c_state [2]), .A3(\byte_controller/n7 ), .ZN(
        \byte_controller/n64 ) );
  NAND4_X1 \byte_controller/U84  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/n4 ), .A4(
        \byte_controller/n61 ), .ZN(\byte_controller/n135 ) );
  AOI21_X1 \byte_controller/U83  ( .B1(\byte_controller/n22 ), .B2(
        \byte_controller/n60 ), .A(\byte_controller/n24 ), .ZN(
        \byte_controller/n61 ) );
  OAI221_X1 \byte_controller/U82  ( .B1(\byte_controller/n59 ), .B2(
        \byte_controller/n121 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n58 ), .A(\byte_controller/n104 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U81  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n12 ), .A(\byte_controller/n77 ), .ZN(
        \byte_controller/n59 ) );
  INV_X1 \byte_controller/U80  ( .A(\byte_controller/n57 ), .ZN(
        \byte_controller/n77 ) );
  OAI211_X1 \byte_controller/U79  ( .C1(\byte_controller/n54 ), .C2(
        \byte_controller/n58 ), .A(\byte_controller/n56 ), .B(
        \byte_controller/n104 ), .ZN(\byte_controller/n90 ) );
  NAND3_X1 \byte_controller/U78  ( .A1(\byte_controller/n55 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n56 ) );
  OAI21_X1 \byte_controller/U77  ( .B1(\byte_controller/n53 ), .B2(
        \byte_controller/n121 ), .A(\byte_controller/n103 ), .ZN(
        \byte_controller/n58 ) );
  NAND2_X1 \byte_controller/U76  ( .A1(\byte_controller/n104 ), .A2(
        \byte_controller/n52 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U75  ( .A(\byte_controller/n51 ), .B(
        \byte_controller/n53 ), .S(\byte_controller/n55 ), .Z(
        \byte_controller/n52 ) );
  INV_X1 \byte_controller/U74  ( .A(\byte_controller/n121 ), .ZN(
        \byte_controller/n55 ) );
  NAND2_X1 \byte_controller/U73  ( .A1(\byte_controller/n103 ), .A2(
        \byte_controller/n53 ), .ZN(\byte_controller/n51 ) );
  NAND2_X1 \byte_controller/U72  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n103 ), .ZN(\byte_controller/n104 ) );
  AOI21_X1 \byte_controller/U71  ( .B1(\byte_controller/n136 ), .B2(
        \byte_controller/n144 ), .A(\byte_controller/n73 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U70  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n57 ), .ZN(\byte_controller/n136 ) );
  OAI21_X1 \byte_controller/U69  ( .B1(\byte_controller/n60 ), .B2(
        \byte_controller/n73 ), .A(\byte_controller/n50 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U68  ( .A1(\byte_controller/n21 ), .A2(
        \byte_controller/n7 ), .A3(\byte_controller/n20 ), .A4(
        \byte_controller/n48 ), .ZN(\byte_controller/n50 ) );
  NAND2_X1 \byte_controller/U67  ( .A1(\byte_controller/n7 ), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n73 ) );
  NAND2_X1 \byte_controller/U66  ( .A1(\byte_controller/n47 ), .A2(
        \byte_controller/n151 ), .ZN(\byte_controller/n86 ) );
  NAND3_X1 \byte_controller/U65  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/c_state [1]), .A3(\byte_controller/n7 ), .ZN(
        \byte_controller/n47 ) );
  NAND2_X1 \byte_controller/U64  ( .A1(\byte_controller/n11 ), .A2(
        \byte_controller/n5 ), .ZN(\byte_controller/n63 ) );
  NAND2_X1 \byte_controller/U63  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n57 ), .ZN(\byte_controller/n145 ) );
  NAND3_X1 \byte_controller/U62  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n54 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n57 ) );
  NAND4_X1 \byte_controller/U61  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/n24 ), .A4(
        \byte_controller/n7 ), .ZN(\byte_controller/n151 ) );
  OAI21_X1 \byte_controller/U60  ( .B1(cr[7]), .B2(\byte_controller/n46 ), .A(
        \byte_controller/n60 ), .ZN(\byte_controller/n62 ) );
  NAND2_X1 \byte_controller/U59  ( .A1(\byte_controller/n132 ), .A2(
        \byte_controller/n45 ), .ZN(\byte_controller/n87 ) );
  NAND3_X1 \byte_controller/U58  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/c_state [0]), .A3(\byte_controller/n7 ), .ZN(
        \byte_controller/n45 ) );
  MUX2_X1 \byte_controller/U57  ( .A(\byte_controller/n123 ), .B(
        \byte_controller/n44 ), .S(\byte_controller/n36 ), .Z(
        \byte_controller/n149 ) );
  NAND2_X1 \byte_controller/U56  ( .A1(\byte_controller/n43 ), .A2(
        \byte_controller/n48 ), .ZN(\byte_controller/n44 ) );
  INV_X1 \byte_controller/U55  ( .A(done), .ZN(\byte_controller/n48 ) );
  NAND3_X1 \byte_controller/U54  ( .A1(\byte_controller/n67 ), .A2(
        \byte_controller/n66 ), .A3(\byte_controller/n72 ), .ZN(
        \byte_controller/n43 ) );
  INV_X1 \byte_controller/U53  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n123 ) );
  NAND3_X1 \byte_controller/U52  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n21 ), .A3(cr[7]), .ZN(\byte_controller/n132 ) );
  NAND2_X1 \byte_controller/U51  ( .A1(\byte_controller/n142 ), .A2(
        \byte_controller/n141 ), .ZN(\byte_controller/n75 ) );
  NAND3_X1 \byte_controller/U50  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n144 ), .A3(\byte_controller/n60 ), .ZN(
        \byte_controller/n42 ) );
  NAND2_X1 \byte_controller/U49  ( .A1(\byte_controller/n49 ), .A2(
        \byte_controller/n41 ), .ZN(\byte_controller/n142 ) );
  NAND3_X1 \byte_controller/U48  ( .A1(\byte_controller/n67 ), .A2(
        \byte_controller/n66 ), .A3(\byte_controller/n72 ), .ZN(
        \byte_controller/n49 ) );
  INV_X1 \byte_controller/U47  ( .A(cr[6]), .ZN(\byte_controller/n72 ) );
  INV_X1 \byte_controller/U46  ( .A(cr[5]), .ZN(\byte_controller/n66 ) );
  INV_X1 \byte_controller/U45  ( .A(cr[4]), .ZN(\byte_controller/n67 ) );
  INV_X1 \byte_controller/U44  ( .A(wb_rst_i), .ZN(\byte_controller/n103 ) );
  INV_X1 \byte_controller/U43  ( .A(i2c_al), .ZN(\byte_controller/n40 ) );
  NAND3_X1 \byte_controller/U42  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n144 ), .A3(\byte_controller/n60 ), .ZN(
        \byte_controller/n46 ) );
  AND3_X1 \byte_controller/U41  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n4 ), .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/n139 ) );
  INV_X1 \byte_controller/U40  ( .A(\byte_controller/n34 ), .ZN(
        \byte_controller/n37 ) );
  AND3_X1 \byte_controller/U39  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n144 ), .A3(\byte_controller/n60 ), .ZN(
        \byte_controller/n36 ) );
  AND4_X1 \byte_controller/U38  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n35 ), .A3(\byte_controller/n144 ), .A4(
        \byte_controller/n60 ), .ZN(\byte_controller/n41 ) );
  INV_X1 \byte_controller/U37  ( .A(\byte_controller/n149 ), .ZN(
        \byte_controller/n34 ) );
  MUX2_X1 \byte_controller/U36  ( .A(\byte_controller/n123 ), .B(
        \byte_controller/n44 ), .S(\byte_controller/n36 ), .Z(
        \byte_controller/n33 ) );
  BUF_X2 \byte_controller/U35  ( .A(arst_i), .Z(\byte_controller/n32 ) );
  MUX2_X1 \byte_controller/U34  ( .A(\byte_controller/n154 ), .B(
        \byte_controller/n155 ), .S(\byte_controller/n153 ), .Z(
        \byte_controller/n156 ) );
  NAND2_X1 \byte_controller/U33  ( .A1(\byte_controller/n42 ), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n141 ) );
  NAND2_X1 \byte_controller/U32  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n78 ), .ZN(\byte_controller/n100 ) );
  AND3_X1 \byte_controller/U31  ( .A1(\byte_controller/n127 ), .A2(
        \byte_controller/n124 ), .A3(\byte_controller/n126 ), .ZN(
        \byte_controller/n31 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/n137 ), .ZN(
        \byte_controller/n78 ) );
  MUX2_X1 \byte_controller/U29  ( .A(\byte_controller/n44 ), .B(
        \byte_controller/n123 ), .S(\byte_controller/n46 ), .Z(
        \byte_controller/n38 ) );
  INV_X1 \byte_controller/U28  ( .A(\byte_controller/n143 ), .ZN(
        \byte_controller/n76 ) );
  AND3_X1 \byte_controller/U27  ( .A1(\byte_controller/n127 ), .A2(
        \byte_controller/n124 ), .A3(\byte_controller/n126 ), .ZN(
        \byte_controller/n39 ) );
  INV_X1 \byte_controller/U26  ( .A(\byte_controller/n30 ), .ZN(
        \byte_controller/n27 ) );
  AND2_X1 \byte_controller/U25  ( .A1(\byte_controller/n142 ), .A2(
        \byte_controller/n141 ), .ZN(\byte_controller/n30 ) );
  INV_X1 \byte_controller/U24  ( .A(\byte_controller/n70 ), .ZN(
        \byte_controller/n25 ) );
  CLKBUF_X1 \byte_controller/U23  ( .A(cr[5]), .Z(\byte_controller/n24 ) );
  INV_X1 \byte_controller/U22  ( .A(cr[4]), .ZN(\byte_controller/n22 ) );
  INV_X1 \byte_controller/U21  ( .A(\byte_controller/n46 ), .ZN(
        \byte_controller/n21 ) );
  AND2_X2 \byte_controller/U20  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n7 ), .ZN(\byte_controller/n29 ) );
  CLKBUF_X1 \byte_controller/U19  ( .A(\byte_controller/n49 ), .Z(
        \byte_controller/n20 ) );
  INV_X1 \byte_controller/U18  ( .A(cr[6]), .ZN(\byte_controller/n19 ) );
  CLKBUF_X1 \byte_controller/U17  ( .A(\byte_controller/n124 ), .Z(
        \byte_controller/n26 ) );
  BUF_X1 \byte_controller/U16  ( .A(\byte_controller/n122 ), .Z(
        \byte_controller/n17 ) );
  BUF_X1 \byte_controller/U15  ( .A(\byte_controller/n122 ), .Z(
        \byte_controller/n16 ) );
  BUF_X1 \byte_controller/U14  ( .A(\byte_controller/n122 ), .Z(
        \byte_controller/n14 ) );
  CLKBUF_X1 \byte_controller/U13  ( .A(\byte_controller/n26 ), .Z(
        \byte_controller/n13 ) );
  INV_X1 \byte_controller/U12  ( .A(\byte_controller/n149 ), .ZN(
        \byte_controller/n11 ) );
  INV_X1 \byte_controller/U11  ( .A(\byte_controller/n4 ), .ZN(
        \byte_controller/n10 ) );
  BUF_X1 \byte_controller/U10  ( .A(\byte_controller/n66 ), .Z(
        \byte_controller/n9 ) );
  AND2_X1 \byte_controller/U9  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n57 ), .ZN(\byte_controller/n8 ) );
  AND2_X2 \byte_controller/U8  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n103 ), .ZN(\byte_controller/n7 ) );
  BUF_X1 \byte_controller/U7  ( .A(\byte_controller/n142 ), .Z(
        \byte_controller/n23 ) );
  BUF_X1 \byte_controller/U6  ( .A(\byte_controller/n145 ), .Z(
        \byte_controller/n5 ) );
  NOR2_X2 \byte_controller/U5  ( .A1(i2c_al), .A2(wb_rst_i), .ZN(
        \byte_controller/n4 ) );
  INV_X32 \byte_controller/U4  ( .A(wb_rst_i), .ZN(\byte_controller/n1 ) );
  NAND3_X2 \byte_controller/U3  ( .A1(\byte_controller/n2 ), .A2(
        \byte_controller/n1 ), .A3(\byte_controller/n3 ), .ZN(
        \byte_controller/n121 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [3]), .QN(
        \byte_controller/n124 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[0]), .QN(
        \byte_controller/n107 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[1]), .QN(
        \byte_controller/n109 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[2]), .QN(
        \byte_controller/n111 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[3]), .QN(
        \byte_controller/n113 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[4]), .QN(
        \byte_controller/n115 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[5]), .QN(
        \byte_controller/n117 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[6]), .QN(
        \byte_controller/n120 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n90 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n54 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/n53 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/n2 ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n155 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [0]) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n127 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n144 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/c_state [0]), .QN(\byte_controller/n60 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/n70 ), .QN(
        \byte_controller/n126 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n28 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(done), .QN(
        \byte_controller/n35 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/n12 ), .QN(
        \byte_controller/n15 ) );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n32 ), .Q(\byte_controller/ld ), .QN(
        \byte_controller/n3 ) );
  NOR3_X1 \byte_controller/bit_controller/U190  ( .A1(
        \byte_controller/bit_controller/n87 ), .A2(
        \byte_controller/bit_controller/n230 ), .A3(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/N154 ) );
  INV_X1 \byte_controller/bit_controller/U189  ( .A(
        \byte_controller/bit_controller/n72 ), .ZN(
        \byte_controller/bit_controller/n230 ) );
  AOI211_X1 \byte_controller/bit_controller/U188  ( .C1(
        \byte_controller/bit_controller/n81 ), .C2(
        \byte_controller/bit_controller/n80 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N75 ) );
  NOR3_X1 \byte_controller/bit_controller/U187  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  MUX2_X1 \byte_controller/bit_controller/U186  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n227 ), .S(
        \byte_controller/bit_controller/n226 ), .Z(
        \byte_controller/bit_controller/n158 ) );
  AOI21_X1 \byte_controller/bit_controller/U185  ( .B1(
        \byte_controller/bit_controller/n25 ), .B2(
        \byte_controller/bit_controller/n225 ), .A(
        \byte_controller/bit_controller/n224 ), .ZN(
        \byte_controller/bit_controller/n226 ) );
  NAND4_X1 \byte_controller/bit_controller/U184  ( .A1(
        \byte_controller/bit_controller/n1 ), .A2(
        \byte_controller/bit_controller/n124 ), .A3(
        \byte_controller/bit_controller/n127 ), .A4(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n227 ) );
  AOI211_X1 \byte_controller/bit_controller/U183  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n222 ), .A(\byte_controller/bit_controller/n22 ), .B(
        \byte_controller/bit_controller/n221 ), .ZN(
        \byte_controller/bit_controller/n223 ) );
  NAND4_X1 \byte_controller/bit_controller/U182  ( .A1(
        \byte_controller/bit_controller/n4 ), .A2(
        \byte_controller/bit_controller/n111 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  NAND4_X1 \byte_controller/bit_controller/U181  ( .A1(
        \byte_controller/bit_controller/n70 ), .A2(
        \byte_controller/bit_controller/n218 ), .A3(
        \byte_controller/bit_controller/n217 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n219 ) );
  OAI22_X1 \byte_controller/bit_controller/U180  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n9 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U179  ( .A1(
        \byte_controller/bit_controller/n109 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n108 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U178  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  NAND4_X1 \byte_controller/bit_controller/U177  ( .A1(
        \byte_controller/bit_controller/n70 ), .A2(
        \byte_controller/bit_controller/n214 ), .A3(
        \byte_controller/bit_controller/n217 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n215 ) );
  INV_X1 \byte_controller/bit_controller/U176  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n217 ) );
  AOI21_X1 \byte_controller/bit_controller/U175  ( .B1(
        \byte_controller/bit_controller/n212 ), .B2(
        \byte_controller/bit_controller/n211 ), .A(
        \byte_controller/bit_controller/n54 ), .ZN(
        \byte_controller/bit_controller/n243 ) );
  INV_X1 \byte_controller/bit_controller/U174  ( .A(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/n232 ) );
  AOI222_X1 \byte_controller/bit_controller/U173  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  INV_X1 \byte_controller/bit_controller/U172  ( .A(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n242 ) );
  AOI222_X1 \byte_controller/bit_controller/U171  ( .A1(prer[0]), .A2(
        \byte_controller/bit_controller/n28 ), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/n206 ), .C1(
        \byte_controller/bit_controller/N28 ), .C2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  INV_X1 \byte_controller/bit_controller/U170  ( .A(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n241 ) );
  AOI222_X1 \byte_controller/bit_controller/U169  ( .A1(prer[1]), .A2(
        \byte_controller/bit_controller/n76 ), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/n51 ), .C1(
        \byte_controller/bit_controller/N29 ), .C2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  INV_X1 \byte_controller/bit_controller/U168  ( .A(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n240 ) );
  AOI222_X1 \byte_controller/bit_controller/U167  ( .A1(prer[2]), .A2(
        \byte_controller/bit_controller/n28 ), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/n43 ), .C1(
        \byte_controller/bit_controller/N30 ), .C2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  INV_X1 \byte_controller/bit_controller/U166  ( .A(
        \byte_controller/bit_controller/n203 ), .ZN(
        \byte_controller/bit_controller/n239 ) );
  AOI222_X1 \byte_controller/bit_controller/U165  ( .A1(prer[3]), .A2(
        \byte_controller/bit_controller/n28 ), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/cnt [3]), .C1(
        \byte_controller/bit_controller/N31 ), .C2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  INV_X1 \byte_controller/bit_controller/U164  ( .A(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n238 ) );
  AOI222_X1 \byte_controller/bit_controller/U163  ( .A1(prer[4]), .A2(
        \byte_controller/bit_controller/n28 ), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/cnt [4]), .C1(
        \byte_controller/bit_controller/N32 ), .C2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  INV_X1 \byte_controller/bit_controller/U162  ( .A(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n234 ) );
  AOI222_X1 \byte_controller/bit_controller/U161  ( .A1(
        \byte_controller/bit_controller/N33 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(prer[5]), .B2(
        \byte_controller/bit_controller/n75 ), .C1(
        \byte_controller/bit_controller/n209 ), .C2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/n201 ) );
  INV_X1 \byte_controller/bit_controller/U160  ( .A(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n237 ) );
  AOI222_X1 \byte_controller/bit_controller/U159  ( .A1(prer[7]), .A2(
        \byte_controller/bit_controller/n76 ), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/n18 ), .C1(
        \byte_controller/bit_controller/N35 ), .C2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n200 ) );
  OAI21_X1 \byte_controller/bit_controller/U158  ( .B1(
        \byte_controller/bit_controller/n16 ), .B2(
        \byte_controller/bit_controller/n38 ), .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n231 ) );
  AOI22_X1 \byte_controller/bit_controller/U157  ( .A1(
        \byte_controller/bit_controller/N36 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(prer[8]), .B2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  INV_X1 \byte_controller/bit_controller/U156  ( .A(
        \byte_controller/bit_controller/n197 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  AOI222_X1 \byte_controller/bit_controller/U155  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(prer[9]), .B2(
        \byte_controller/bit_controller/n75 ), .C1(
        \byte_controller/bit_controller/n209 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n197 ) );
  INV_X1 \byte_controller/bit_controller/U154  ( .A(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AOI222_X1 \byte_controller/bit_controller/U153  ( .A1(
        \byte_controller/bit_controller/N38 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(prer[10]), .B2(
        \byte_controller/bit_controller/n75 ), .C1(
        \byte_controller/bit_controller/n209 ), .C2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U152  ( .A(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n235 ) );
  AOI222_X1 \byte_controller/bit_controller/U151  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(
        \byte_controller/bit_controller/n76 ), .B2(prer[11]), .C1(
        \byte_controller/bit_controller/n209 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n195 ) );
  INV_X1 \byte_controller/bit_controller/U150  ( .A(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n128 ) );
  AOI222_X1 \byte_controller/bit_controller/U149  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(prer[12]), .B2(
        \byte_controller/bit_controller/n208 ), .C1(
        \byte_controller/bit_controller/n209 ), .C2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/n194 ) );
  INV_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n236 ) );
  AOI222_X1 \byte_controller/bit_controller/U147  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(prer[13]), .C2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n193 ) );
  INV_X1 \byte_controller/bit_controller/U146  ( .A(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n233 ) );
  AOI222_X1 \byte_controller/bit_controller/U145  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n125 ), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n192 ) );
  OAI211_X1 \byte_controller/bit_controller/U144  ( .C1(
        \byte_controller/bit_controller/n19 ), .C2(
        \byte_controller/bit_controller/n190 ), .A(
        \byte_controller/bit_controller/n211 ), .B(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n191 ) );
  NAND2_X1 \byte_controller/bit_controller/U143  ( .A1(
        \byte_controller/bit_controller/n189 ), .A2(
        \byte_controller/bit_controller/n54 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  INV_X1 \byte_controller/bit_controller/U142  ( .A(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n212 ) );
  INV_X1 \byte_controller/bit_controller/U141  ( .A(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  NAND2_X1 \byte_controller/bit_controller/U140  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/N68 ) );
  AOI21_X1 \byte_controller/bit_controller/U139  ( .B1(
        \byte_controller/bit_controller/n178 ), .B2(
        \byte_controller/bit_controller/n225 ), .A(
        \byte_controller/bit_controller/n224 ), .ZN(
        \byte_controller/bit_controller/n179 ) );
  INV_X1 \byte_controller/bit_controller/U138  ( .A(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n224 ) );
  NAND2_X1 \byte_controller/bit_controller/U137  ( .A1(
        \byte_controller/bit_controller/n78 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n221 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  NAND3_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n123 ), .A3(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  OAI22_X1 \byte_controller/bit_controller/U134  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n113 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/n11 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n114 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI21_X1 \byte_controller/bit_controller/U132  ( .B1(
        \byte_controller/bit_controller/n11 ), .B2(
        \byte_controller/bit_controller/n88 ), .A(
        \byte_controller/bit_controller/n174 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  NAND4_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/n25 ), .A2(
        \byte_controller/core_cmd [3]), .A3(
        \byte_controller/bit_controller/n173 ), .A4(
        \byte_controller/bit_controller/n172 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  NOR3_X1 \byte_controller/bit_controller/U130  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n172 ) );
  OAI22_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/n122 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U128  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n88 ), .B2(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U126  ( .A1(
        \byte_controller/bit_controller/n30 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n14 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI22_X1 \byte_controller/bit_controller/U125  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n117 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U124  ( .A1(
        \byte_controller/bit_controller/n6 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n118 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/bit_controller/n213 ), .A2(
        \byte_controller/bit_controller/n171 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n86 ) );
  NAND3_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/n25 ), .A2(
        \byte_controller/bit_controller/n170 ), .A3(
        \byte_controller/bit_controller/n173 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  OAI33_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n168 ), .A2(
        \byte_controller/bit_controller/n167 ), .A3(
        \byte_controller/bit_controller/n166 ), .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/N69 ), .B3(
        \byte_controller/bit_controller/n165 ), .ZN(
        \byte_controller/bit_controller/N83 ) );
  NAND2_X1 \byte_controller/bit_controller/U120  ( .A1(
        \byte_controller/bit_controller/n169 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  NAND2_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n77 ), .A2(
        \byte_controller/bit_controller/n24 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  NAND4_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n162 ) );
  NAND3_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n115 ), .A3(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  NAND3_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n228 ) );
  OAI21_X1 \byte_controller/bit_controller/U115  ( .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/n88 ), .A(
        \byte_controller/bit_controller/n138 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  OAI21_X1 \byte_controller/bit_controller/U114  ( .B1(
        \byte_controller/bit_controller/n177 ), .B2(
        \byte_controller/bit_controller/n71 ), .A(
        \byte_controller/bit_controller/n23 ), .ZN(
        \byte_controller/bit_controller/n138 ) );
  INV_X1 \byte_controller/bit_controller/U113  ( .A(
        \byte_controller/bit_controller/n41 ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  OAI22_X1 \byte_controller/bit_controller/U112  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n7 ), .B2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  INV_X1 \byte_controller/bit_controller/U110  ( .A(
        \byte_controller/bit_controller/n229 ), .ZN(
        \byte_controller/bit_controller/n225 ) );
  NAND2_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n79 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n229 ) );
  NOR2_X1 \byte_controller/bit_controller/U108  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n137 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  MUX2_X1 \byte_controller/bit_controller/U107  ( .A(
        \byte_controller/bit_controller/n136 ), .B(
        \byte_controller/bit_controller/n82 ), .S(
        \byte_controller/bit_controller/n87 ), .Z(
        \byte_controller/bit_controller/n137 ) );
  NAND2_X1 \byte_controller/bit_controller/U106  ( .A1(
        \byte_controller/bit_controller/n135 ), .A2(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  INV_X1 \byte_controller/bit_controller/U105  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n170 ) );
  INV_X1 \byte_controller/bit_controller/U104  ( .A(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  NAND3_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n214 ), .A3(
        \byte_controller/bit_controller/n218 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  INV_X1 \byte_controller/bit_controller/U102  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n218 ) );
  INV_X1 \byte_controller/bit_controller/U101  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n214 ) );
  NOR4_X1 \byte_controller/bit_controller/U100  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n105 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n134 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  OR2_X1 \byte_controller/bit_controller/U99  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N66 ) );
  NAND2_X1 \byte_controller/bit_controller/U98  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  INV_X1 \byte_controller/bit_controller/U97  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n211 ) );
  OR2_X1 \byte_controller/bit_controller/U96  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/bit_controller/n219 ), .A2(
        \byte_controller/bit_controller/n129 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OR2_X1 \byte_controller/bit_controller/U94  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n129 ) );
  AND2_X1 \byte_controller/bit_controller/U93  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n127 ) );
  AND2_X2 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n212 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n125 ) );
  OR2_X2 \byte_controller/bit_controller/U91  ( .A1(
        \byte_controller/bit_controller/n133 ), .A2(
        \byte_controller/bit_controller/n229 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  INV_X2 \byte_controller/bit_controller/U90  ( .A(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n88 ) );
  INV_X1 \byte_controller/bit_controller/U89  ( .A(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n85 ) );
  NAND2_X1 \byte_controller/bit_controller/U88  ( .A1(
        \byte_controller/bit_controller/n215 ), .A2(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  OR2_X1 \byte_controller/bit_controller/U87  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  NAND2_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n39 ), .A2(
        \byte_controller/bit_controller/n73 ), .ZN(
        \byte_controller/bit_controller/n78 ) );
  AND2_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n77 ) );
  INV_X1 \byte_controller/bit_controller/U84  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  INV_X1 \byte_controller/bit_controller/U83  ( .A(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/n76 ) );
  INV_X1 \byte_controller/bit_controller/U82  ( .A(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/n75 ) );
  OAI21_X1 \byte_controller/bit_controller/U81  ( .B1(
        \byte_controller/bit_controller/n67 ), .B2(
        \byte_controller/bit_controller/n66 ), .A(ctr[7]), .ZN(
        \byte_controller/bit_controller/n189 ) );
  OAI21_X1 \byte_controller/bit_controller/U80  ( .B1(
        \byte_controller/bit_controller/n37 ), .B2(
        \byte_controller/bit_controller/n188 ), .A(ctr[7]), .ZN(
        \byte_controller/bit_controller/n74 ) );
  NOR4_X1 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n162 ), .A2(
        \byte_controller/bit_controller/n176 ), .A3(
        \byte_controller/bit_controller/n161 ), .A4(
        \byte_controller/bit_controller/n160 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  NOR4_X1 \byte_controller/bit_controller/U78  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n176 ), .A3(
        \byte_controller/bit_controller/n161 ), .A4(
        \byte_controller/bit_controller/n160 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U77  ( .A(
        \byte_controller/bit_controller/n31 ), .Z(
        \byte_controller/bit_controller/n72 ) );
  INV_X1 \byte_controller/bit_controller/U76  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  INV_X1 \byte_controller/bit_controller/U75  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n69 ) );
  INV_X1 \byte_controller/bit_controller/U74  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n68 ) );
  NAND4_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n33 ), .A2(
        \byte_controller/bit_controller/n182 ), .A3(
        \byte_controller/bit_controller/n15 ), .A4(
        \byte_controller/bit_controller/n26 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  NAND4_X1 \byte_controller/bit_controller/U72  ( .A1(
        \byte_controller/bit_controller/n186 ), .A2(
        \byte_controller/bit_controller/n185 ), .A3(
        \byte_controller/bit_controller/n184 ), .A4(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  AND2_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n102 ), .A2(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  NAND4_X1 \byte_controller/bit_controller/U70  ( .A1(
        \byte_controller/bit_controller/n183 ), .A2(
        \byte_controller/bit_controller/n182 ), .A3(
        \byte_controller/bit_controller/n181 ), .A4(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  AND2_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n97 ), .A2(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  AND2_X1 \byte_controller/bit_controller/U68  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n181 ) );
  AND2_X1 \byte_controller/bit_controller/U67  ( .A1(
        \byte_controller/bit_controller/n99 ), .A2(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/n185 ) );
  AND2_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n77 ), .A2(
        \byte_controller/bit_controller/n164 ), .ZN(
        \byte_controller/bit_controller/n65 ) );
  AND2_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n93 ), .A2(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  AND2_X1 \byte_controller/bit_controller/U64  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n180 ) );
  NAND2_X1 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n83 ), .A2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n57 ) );
  MUX2_X1 \byte_controller/bit_controller/U62  ( .A(
        \byte_controller/bit_controller/n56 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n57 ), .Z(
        \byte_controller/bit_controller/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/U61  ( .A1(
        \byte_controller/bit_controller/n190 ), .A2(
        \byte_controller/bit_controller/N68 ), .ZN(
        \byte_controller/bit_controller/n54 ) );
  AND2_X1 \byte_controller/bit_controller/U60  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  MUX2_X1 \byte_controller/bit_controller/U59  ( .A(scl_padoen_o), .B(
        \byte_controller/bit_controller/n53 ), .S(
        \byte_controller/bit_controller/n179 ), .Z(
        \byte_controller/bit_controller/n52 ) );
  NOR4_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n31 ), .A2(
        \byte_controller/bit_controller/n140 ), .A3(
        \byte_controller/bit_controller/n139 ), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  BUF_X1 \byte_controller/bit_controller/U57  ( .A(\byte_controller/n32 ), .Z(
        \byte_controller/bit_controller/n58 ) );
  BUF_X1 \byte_controller/bit_controller/U56  ( .A(
        \byte_controller/bit_controller/n58 ), .Z(
        \byte_controller/bit_controller/n64 ) );
  BUF_X1 \byte_controller/bit_controller/U55  ( .A(
        \byte_controller/bit_controller/n64 ), .Z(
        \byte_controller/bit_controller/n59 ) );
  BUF_X1 \byte_controller/bit_controller/U54  ( .A(
        \byte_controller/bit_controller/n63 ), .Z(
        \byte_controller/bit_controller/n62 ) );
  BUF_X1 \byte_controller/bit_controller/U53  ( .A(
        \byte_controller/bit_controller/n63 ), .Z(
        \byte_controller/bit_controller/n61 ) );
  BUF_X1 \byte_controller/bit_controller/U52  ( .A(
        \byte_controller/bit_controller/n63 ), .Z(
        \byte_controller/bit_controller/n60 ) );
  INV_X1 \byte_controller/bit_controller/U51  ( .A(
        \byte_controller/bit_controller/n17 ), .ZN(
        \byte_controller/bit_controller/n51 ) );
  BUF_X1 \byte_controller/bit_controller/U50  ( .A(
        \byte_controller/bit_controller/n58 ), .Z(
        \byte_controller/bit_controller/n63 ) );
  NAND2_X1 \byte_controller/bit_controller/U49  ( .A1(
        \byte_controller/bit_controller/N34 ), .A2(
        \byte_controller/bit_controller/n125 ), .ZN(
        \byte_controller/bit_controller/n49 ) );
  NAND2_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n69 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n48 ) );
  NAND2_X1 \byte_controller/bit_controller/U47  ( .A1(prer[6]), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n47 ) );
  NAND3_X1 \byte_controller/bit_controller/U46  ( .A1(
        \byte_controller/bit_controller/n48 ), .A2(
        \byte_controller/bit_controller/n47 ), .A3(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/U45  ( .A1(
        \byte_controller/bit_controller/n74 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n116 ) );
  AND2_X1 \byte_controller/bit_controller/U44  ( .A1(
        \byte_controller/bit_controller/n103 ), .A2(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  INV_X1 \byte_controller/bit_controller/U43  ( .A(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n43 ) );
  NAND2_X1 \byte_controller/bit_controller/U42  ( .A1(
        \byte_controller/bit_controller/n225 ), .A2(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  CLKBUF_X3 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n216 ), .Z(
        \byte_controller/bit_controller/n42 ) );
  OAI211_X1 \byte_controller/bit_controller/U40  ( .C1(
        \byte_controller/bit_controller/n19 ), .C2(
        \byte_controller/bit_controller/n190 ), .A(
        \byte_controller/bit_controller/n211 ), .B(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n40 ) );
  NOR4_X1 \byte_controller/bit_controller/U39  ( .A1(
        \byte_controller/bit_controller/n32 ), .A2(
        \byte_controller/bit_controller/n140 ), .A3(
        \byte_controller/bit_controller/n139 ), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n39 ) );
  INV_X1 \byte_controller/bit_controller/U38  ( .A(
        \byte_controller/bit_controller/n68 ), .ZN(
        \byte_controller/bit_controller/n38 ) );
  NAND4_X1 \byte_controller/bit_controller/U37  ( .A1(
        \byte_controller/bit_controller/n185 ), .A2(
        \byte_controller/bit_controller/n186 ), .A3(
        \byte_controller/bit_controller/n187 ), .A4(
        \byte_controller/bit_controller/n184 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  INV_X1 \byte_controller/bit_controller/U36  ( .A(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n36 ) );
  NAND4_X1 \byte_controller/bit_controller/U35  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n34 ) );
  AND2_X1 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n33 ) );
  NAND3_X1 \byte_controller/bit_controller/U33  ( .A1(
        \byte_controller/bit_controller/n127 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  NAND3_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n126 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  AND3_X2 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n65 ), .A2(
        \byte_controller/bit_controller/n170 ), .A3(
        \byte_controller/bit_controller/n173 ), .ZN(
        \byte_controller/bit_controller/n70 ) );
  INV_X1 \byte_controller/bit_controller/U30  ( .A(
        \byte_controller/bit_controller/n29 ), .ZN(
        \byte_controller/bit_controller/n30 ) );
  INV_X1 \byte_controller/bit_controller/U29  ( .A(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  INV_X1 \byte_controller/bit_controller/U28  ( .A(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/n50 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U27  ( .A(
        \byte_controller/bit_controller/n103 ), .Z(
        \byte_controller/bit_controller/n27 ) );
  AND2_X1 \byte_controller/bit_controller/U26  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  AND2_X1 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n77 ), .A2(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  NOR4_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n228 ), .A2(
        \byte_controller/bit_controller/n140 ), .A3(
        \byte_controller/bit_controller/n139 ), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n45 ) );
  NOR4_X1 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n228 ), .A2(
        \byte_controller/bit_controller/n140 ), .A3(
        \byte_controller/bit_controller/n139 ), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n24 ) );
  BUF_X1 \byte_controller/bit_controller/U22  ( .A(
        \byte_controller/bit_controller/n216 ), .Z(
        \byte_controller/bit_controller/n41 ) );
  INV_X1 \byte_controller/bit_controller/U21  ( .A(
        \byte_controller/bit_controller/n41 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  INV_X1 \byte_controller/bit_controller/U20  ( .A(
        \byte_controller/bit_controller/n225 ), .ZN(
        \byte_controller/bit_controller/n22 ) );
  INV_X1 \byte_controller/bit_controller/U19  ( .A(
        \byte_controller/bit_controller/n20 ), .ZN(\byte_controller/core_ack )
         );
  CLKBUF_X1 \byte_controller/bit_controller/U18  ( .A(
        \byte_controller/bit_controller/cnt [7]), .Z(
        \byte_controller/bit_controller/n18 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U17  ( .A(
        \byte_controller/bit_controller/n102 ), .Z(
        \byte_controller/bit_controller/n17 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U16  ( .A(
        \byte_controller/bit_controller/n95 ), .Z(
        \byte_controller/bit_controller/n16 ) );
  AND2_X1 \byte_controller/bit_controller/U15  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n15 ) );
  INV_X1 \byte_controller/bit_controller/U14  ( .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  INV_X1 \byte_controller/bit_controller/U13  ( .A(
        \byte_controller/bit_controller/n177 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  INV_X1 \byte_controller/bit_controller/U12  ( .A(
        \byte_controller/bit_controller/n10 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  INV_X1 \byte_controller/bit_controller/U11  ( .A(
        \byte_controller/bit_controller/n8 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U10  ( .A(
        \byte_controller/bit_controller/n4 ), .Z(
        \byte_controller/bit_controller/n7 ) );
  INV_X1 \byte_controller/bit_controller/U9  ( .A(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n6 ) );
  BUF_X1 \byte_controller/bit_controller/U8  ( .A(
        \byte_controller/bit_controller/n110 ), .Z(
        \byte_controller/bit_controller/n4 ) );
  AND3_X1 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n225 ), .A2(
        \byte_controller/bit_controller/n14 ), .A3(
        \byte_controller/bit_controller/n122 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  AND4_X1 \byte_controller/bit_controller/U6  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n2 ) );
  NAND4_X1 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n2 ), .A2(
        \byte_controller/bit_controller/n3 ), .A3(
        \byte_controller/bit_controller/n12 ), .A4(
        \byte_controller/bit_controller/n121 ), .ZN(
        \byte_controller/bit_controller/n53 ) );
  AND2_X1 \byte_controller/bit_controller/U4  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n126 ) );
  BUF_X1 \byte_controller/bit_controller/U3  ( .A(
        \byte_controller/bit_controller/n115 ), .Z(
        \byte_controller/bit_controller/n1 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n10 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n13 ), .QN(
        \byte_controller/bit_controller/n132 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n237 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n96 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n241 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [1]), .QN(
        \byte_controller/bit_controller/n102 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n46 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n97 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n139 ), .QN(
        \byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n29 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n86 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n5 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n167 ), .QN(
        \byte_controller/bit_controller/n82 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n134 ), .QN(
        \byte_controller/bit_controller/n104 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n61 ), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n231 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n95 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n238 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n99 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n239 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n100 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n240 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N83 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n79 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/n32 ), .QN(\byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n131 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n94 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n235 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n92 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n130 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n93 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n232 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n44 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n128 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n91 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n233 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n236 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n90 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n234 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n98 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n160 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n35 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n161 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n177 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/n32 ), .Q(\byte_controller/bit_controller/n176 ), 
        .QN(\byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n242 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/cnt [0]), .QN(
        \byte_controller/bit_controller/n103 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .QN(
        \byte_controller/bit_controller/n20 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n8 ), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n71 ), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n62 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n165 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n243 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n133 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n190 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n52 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n62 ), .Q(scl_padoen_o) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n55 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n81 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n166 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n61 ), .QN(
        \byte_controller/bit_controller/n80 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N66 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n19 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n61 ), .Q(
        \byte_controller/bit_controller/n56 ), .QN(
        \byte_controller/bit_controller/n105 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U150  ( .A1(
        \byte_controller/bit_controller/sub_105/n133 ), .A2(
        \byte_controller/bit_controller/sub_105/n109 ), .A3(
        \byte_controller/bit_controller/sub_105/n134 ), .ZN(
        \byte_controller/bit_controller/sub_105/n131 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U149  ( .A1(
        \byte_controller/bit_controller/sub_105/n59 ), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .A3(
        \byte_controller/bit_controller/sub_105/n36 ), .ZN(
        \byte_controller/bit_controller/sub_105/n132 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U148  ( .A1(
        \byte_controller/bit_controller/sub_105/n130 ), .A2(
        \byte_controller/bit_controller/sub_105/n56 ), .ZN(
        \byte_controller/bit_controller/sub_105/n128 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U147  ( .A1(
        \byte_controller/bit_controller/sub_105/n127 ), .A2(
        \byte_controller/bit_controller/sub_105/n109 ), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U146  ( .A1(
        \byte_controller/bit_controller/sub_105/n123 ), .A2(
        \byte_controller/bit_controller/sub_105/n122 ), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U145  ( .A(
        \byte_controller/bit_controller/sub_105/n120 ), .B(
        \byte_controller/bit_controller/sub_105/n121 ), .S(
        \byte_controller/bit_controller/cnt [10]), .Z(
        \byte_controller/bit_controller/N38 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U144  ( .A1(
        \byte_controller/bit_controller/sub_105/n43 ), .A2(
        \byte_controller/bit_controller/sub_105/n107 ), .A3(
        \byte_controller/bit_controller/sub_105/n119 ), .A4(
        \byte_controller/bit_controller/sub_105/n109 ), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U143  ( .A1(
        \byte_controller/bit_controller/sub_105/n37 ), .A2(
        \byte_controller/bit_controller/sub_105/n66 ), .A3(
        \byte_controller/bit_controller/sub_105/n118 ), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U142  ( .A1(
        \byte_controller/bit_controller/sub_105/n116 ), .A2(
        \byte_controller/bit_controller/sub_105/n117 ), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U141  ( .A1(
        \byte_controller/bit_controller/sub_105/n113 ), .A2(
        \byte_controller/bit_controller/sub_105/n112 ), .A3(
        \byte_controller/bit_controller/sub_105/n114 ), .A4(
        \byte_controller/bit_controller/sub_105/n115 ), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U140  ( .A(
        \byte_controller/bit_controller/sub_105/n110 ), .B(
        \byte_controller/bit_controller/sub_105/n111 ), .S(
        \byte_controller/bit_controller/cnt [11]), .Z(
        \byte_controller/bit_controller/N39 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U139  ( .A1(
        \byte_controller/bit_controller/sub_105/n106 ), .A2(
        \byte_controller/bit_controller/sub_105/n107 ), .A3(
        \byte_controller/bit_controller/sub_105/n108 ), .A4(
        \byte_controller/bit_controller/sub_105/n109 ), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U138  ( .A1(
        \byte_controller/bit_controller/sub_105/n44 ), .A2(
        \byte_controller/bit_controller/sub_105/n54 ), .A3(
        \byte_controller/bit_controller/sub_105/n105 ), .A4(
        \byte_controller/bit_controller/sub_105/n66 ), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n103 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U136  ( .A1(
        \byte_controller/bit_controller/sub_105/n113 ), .A2(
        \byte_controller/bit_controller/sub_105/n101 ), .A3(
        \byte_controller/bit_controller/sub_105/n114 ), .A4(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U135  ( .A(
        \byte_controller/bit_controller/sub_105/n99 ), .B(
        \byte_controller/bit_controller/sub_105/n100 ), .S(
        \byte_controller/bit_controller/cnt [12]), .Z(
        \byte_controller/bit_controller/N40 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U134  ( .A1(
        \byte_controller/bit_controller/sub_105/n93 ), .A2(
        \byte_controller/bit_controller/sub_105/n92 ), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n91 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n79 ), .A2(
        \byte_controller/bit_controller/sub_105/n80 ), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U131  ( .A1(
        \byte_controller/bit_controller/sub_105/n78 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U130  ( .A1(
        \byte_controller/bit_controller/sub_105/n74 ), .A2(
        \byte_controller/bit_controller/sub_105/n75 ), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n72 ), .A2(
        \byte_controller/bit_controller/sub_105/n73 ), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n68 ), .A2(
        \byte_controller/bit_controller/sub_105/n69 ), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A(
        \byte_controller/bit_controller/sub_105/n67 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U126  ( .A1(
        \byte_controller/bit_controller/sub_105/n1 ), .A2(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U125  ( .A1(
        \byte_controller/bit_controller/sub_105/n59 ), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .A3(
        \byte_controller/bit_controller/sub_105/n60 ), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n54 ), .A2(
        \byte_controller/bit_controller/sub_105/n66 ), .A3(
        \byte_controller/bit_controller/sub_105/n56 ), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U123  ( .A(
        \byte_controller/bit_controller/sub_105/n50 ), .B(
        \byte_controller/bit_controller/sub_105/n51 ), .S(
        \byte_controller/bit_controller/cnt [5]), .Z(
        \byte_controller/bit_controller/N33 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U122  ( .A1(
        \byte_controller/bit_controller/sub_105/n2 ), .A2(
        \byte_controller/bit_controller/sub_105/n48 ), .A3(
        \byte_controller/bit_controller/sub_105/n45 ), .A4(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U121  ( .A(
        \byte_controller/bit_controller/sub_105/n47 ), .B(
        \byte_controller/bit_controller/sub_105/n5 ), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U120  ( .A1(
        \byte_controller/bit_controller/sub_105/n42 ), .A2(
        \byte_controller/bit_controller/sub_105/n43 ), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U119  ( .A1(
        \byte_controller/bit_controller/sub_105/n41 ), .A2(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U118  ( .A1(
        \byte_controller/bit_controller/sub_105/n38 ), .A2(
        \byte_controller/bit_controller/sub_105/n34 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U117  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U116  ( .A(
        \byte_controller/bit_controller/sub_105/n33 ), .B(
        \byte_controller/bit_controller/sub_105/n34 ), .S(
        \byte_controller/bit_controller/sub_105/n6 ), .Z(
        \byte_controller/bit_controller/N36 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U115  ( .A1(
        \byte_controller/bit_controller/sub_105/n31 ), .A2(
        \byte_controller/bit_controller/sub_105/n32 ), .A3(
        \byte_controller/bit_controller/sub_105/n96 ), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U114  ( .A1(
        \byte_controller/bit_controller/sub_105/n36 ), .A2(
        \byte_controller/bit_controller/sub_105/n37 ), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U113  ( .A1(
        \byte_controller/bit_controller/sub_105/n28 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .A3(
        \byte_controller/bit_controller/sub_105/n45 ), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U112  ( .A(
        \byte_controller/bit_controller/sub_105/n25 ), .B(
        \byte_controller/bit_controller/sub_105/n26 ), .S(
        \byte_controller/bit_controller/cnt [9]), .Z(
        \byte_controller/bit_controller/N37 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U111  ( .A(
        \byte_controller/bit_controller/sub_105/n15 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U110  ( .A1(
        \byte_controller/bit_controller/n50 ), .A2(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/n50 ), .A2(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U107  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U104  ( .A(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U103  ( .A1(
        \byte_controller/bit_controller/sub_105/n22 ), .A2(
        \byte_controller/bit_controller/n50 ), .A3(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U102  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n130 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U101  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U100  ( .A1(
        \byte_controller/bit_controller/sub_105/n8 ), .A2(
        \byte_controller/bit_controller/cnt [11]), .A3(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n8 ), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U98  ( .A1(
        \byte_controller/bit_controller/cnt [10]), .A2(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U97  ( .A(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U96  ( .A1(
        \byte_controller/bit_controller/cnt [10]), .A2(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U95  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U94  ( .A1(
        \byte_controller/bit_controller/sub_105/n8 ), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .A3(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U93  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U91  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U90  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [6]), .A3(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U89  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U88  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U87  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U86  ( .A1(
        \byte_controller/bit_controller/sub_105/n23 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/sub_105/n22 ), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U84  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U83  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U82  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U81  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U80  ( .A1(
        \byte_controller/bit_controller/N28 ), .A2(
        \byte_controller/bit_controller/sub_105/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n129 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U79  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U77  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U76  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U75  ( .A(
        \byte_controller/bit_controller/sub_105/n21 ), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U74  ( .B1(
        \byte_controller/bit_controller/sub_105/n82 ), .B2(
        \byte_controller/bit_controller/sub_105/n83 ), .A(
        \byte_controller/bit_controller/sub_105/n81 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U73  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [8]), .A3(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U71  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U70  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U69  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U68  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U67  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U66  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U65  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U64  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n127 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U63  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n133 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U62  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n24 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U61  ( .A(
        \byte_controller/bit_controller/sub_105/n64 ), .B(
        \byte_controller/bit_controller/sub_105/n3 ), .ZN(
        \byte_controller/bit_controller/N30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U60  ( .A1(
        \byte_controller/bit_controller/sub_105/n23 ), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U59  ( .B1(
        \byte_controller/bit_controller/sub_105/n61 ), .B2(
        \byte_controller/bit_controller/sub_105/n11 ), .A(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U58  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/sub_105/n85 ), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U57  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n23 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U56  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U55  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U54  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U53  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n134 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U52  ( .A1(
        \byte_controller/bit_controller/sub_105/n128 ), .A2(
        \byte_controller/bit_controller/sub_105/n129 ), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U51  ( .A1(
        \byte_controller/bit_controller/sub_105/n89 ), .A2(
        \byte_controller/bit_controller/sub_105/n90 ), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U50  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U49  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  AND4_X1 \byte_controller/bit_controller/sub_105/U48  ( .A1(
        \byte_controller/bit_controller/sub_105/n94 ), .A2(
        \byte_controller/bit_controller/N28 ), .A3(
        \byte_controller/bit_controller/sub_105/n95 ), .A4(
        \byte_controller/bit_controller/sub_105/n66 ), .ZN(
        \byte_controller/bit_controller/sub_105/n19 ) );
  AND4_X1 \byte_controller/bit_controller/sub_105/U47  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/sub_105/n10 ), .A3(
        \byte_controller/bit_controller/sub_105/n97 ), .A4(
        \byte_controller/bit_controller/sub_105/n98 ), .ZN(
        \byte_controller/bit_controller/sub_105/n18 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U46  ( .A1(
        \byte_controller/bit_controller/sub_105/n18 ), .A2(
        \byte_controller/bit_controller/sub_105/n19 ), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U45  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U44  ( .A1(
        \byte_controller/bit_controller/sub_105/n21 ), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n17 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U43  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n16 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U42  ( .A1(
        \byte_controller/bit_controller/sub_105/n16 ), .A2(
        \byte_controller/bit_controller/sub_105/n17 ), .ZN(
        \byte_controller/bit_controller/sub_105/n28 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U41  ( .A1(
        \byte_controller/bit_controller/sub_105/n60 ), .A2(
        \byte_controller/bit_controller/sub_105/n44 ), .A3(
        \byte_controller/bit_controller/sub_105/n45 ), .A4(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U40  ( .B1(
        \byte_controller/bit_controller/sub_105/n40 ), .B2(
        \byte_controller/bit_controller/sub_105/n39 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U39  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U38  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n126 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U37  ( .A1(
        \byte_controller/bit_controller/sub_105/n126 ), .A2(
        \byte_controller/bit_controller/sub_105/n32 ), .ZN(
        \byte_controller/bit_controller/sub_105/n125 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U36  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U35  ( .A1(
        \byte_controller/bit_controller/sub_105/n35 ), .A2(
        \byte_controller/bit_controller/sub_105/n30 ), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U34  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U33  ( .A1(
        \byte_controller/bit_controller/sub_105/n76 ), .A2(
        \byte_controller/bit_controller/sub_105/n77 ), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U32  ( .A1(
        \byte_controller/bit_controller/sub_105/n51 ), .A2(
        \byte_controller/bit_controller/sub_105/n57 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U31  ( .A1(
        \byte_controller/bit_controller/sub_105/n62 ), .A2(
        \byte_controller/bit_controller/sub_105/n63 ), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U30  ( .A1(
        \byte_controller/bit_controller/sub_105/n70 ), .A2(
        \byte_controller/bit_controller/sub_105/n71 ), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U29  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U28  ( .A1(
        \byte_controller/bit_controller/sub_105/n29 ), .A2(
        \byte_controller/bit_controller/sub_105/n30 ), .ZN(
        \byte_controller/bit_controller/sub_105/n25 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U27  ( .A1(
        \byte_controller/bit_controller/n50 ), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U26  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U25  ( .A1(
        \byte_controller/bit_controller/sub_105/n64 ), .A2(
        \byte_controller/bit_controller/sub_105/n65 ), .ZN(
        \byte_controller/bit_controller/N29 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U24  ( .A1(
        \byte_controller/bit_controller/sub_105/n131 ), .A2(
        \byte_controller/bit_controller/sub_105/n132 ), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U23  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U22  ( .A1(
        \byte_controller/bit_controller/sub_105/n66 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U21  ( .A1(
        \byte_controller/bit_controller/sub_105/n124 ), .A2(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U20  ( .A1(
        \byte_controller/bit_controller/sub_105/n85 ), .A2(
        \byte_controller/bit_controller/sub_105/n84 ), .ZN(
        \byte_controller/bit_controller/sub_105/n15 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U19  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/N28 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U18  ( .A1(
        \byte_controller/bit_controller/sub_105/n86 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n13 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U17  ( .A1(
        \byte_controller/bit_controller/sub_105/n87 ), .A2(
        \byte_controller/bit_controller/sub_105/n88 ), .ZN(
        \byte_controller/bit_controller/sub_105/n12 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U16  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n21 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U15  ( .A(
        \byte_controller/bit_controller/sub_105/n49 ), .Z(
        \byte_controller/bit_controller/sub_105/n10 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U14  ( .A(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/sub_105/n7 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U13  ( .A(
        \byte_controller/bit_controller/cnt [8]), .Z(
        \byte_controller/bit_controller/sub_105/n6 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U12  ( .A(
        \byte_controller/bit_controller/sub_105/n32 ), .ZN(
        \byte_controller/bit_controller/sub_105/n5 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U11  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n20 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U10  ( .A1(
        \byte_controller/bit_controller/sub_105/n89 ), .A2(
        \byte_controller/bit_controller/sub_105/n90 ), .ZN(
        \byte_controller/bit_controller/sub_105/n4 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U9  ( .A(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/sub_105/n3 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U8  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n8 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U7  ( .A(
        \byte_controller/bit_controller/sub_105/n10 ), .Z(
        \byte_controller/bit_controller/sub_105/n11 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U6  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n9 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U5  ( .A1(
        \byte_controller/bit_controller/sub_105/n12 ), .A2(
        \byte_controller/bit_controller/sub_105/n13 ), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U4  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n22 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U3  ( .A(
        \byte_controller/bit_controller/sub_105/n54 ), .Z(
        \byte_controller/bit_controller/sub_105/n2 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/cnt [1]), .Z(
        \byte_controller/bit_controller/sub_105/n1 ) );
endmodule

