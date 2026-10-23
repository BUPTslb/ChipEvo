/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 04:43:43 2026
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
  wire   N26, sr_1, sr_0, N30, N31, N32, N33, N34, N35, N36, N37, done, i2c_al,
         irxack, N101, N102, N103, N104, N108, n1, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n17, n18, n19, n20, n21, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n40, n41, n43, n115, n116, n117,
         n118, n119, n120, n121, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, \byte_controller/n147 , \byte_controller/n146 ,
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
         \byte_controller/bit_controller/n112 ,
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
         \byte_controller/bit_controller/n116 ,
         \byte_controller/bit_controller/n115 ,
         \byte_controller/bit_controller/n114 ,
         \byte_controller/bit_controller/n113 ,
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
         \byte_controller/bit_controller/n88 ,
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
         \byte_controller/bit_controller/sub_105/n1 ,
         \byte_controller/bit_controller/sub_105/n130 ;
  wire   [15:0] prer;
  wire   [7:0] ctr;
  wire   [7:0] rxr;
  wire   [7:5] sr;
  wire   [7:0] txr;
  wire   [7:0] cr;
  wire   [4:0] \byte_controller/c_state ;
  wire   [3:0] \byte_controller/core_cmd ;
  wire   [15:0] \byte_controller/bit_controller/cnt ;
  assign scl_pad_o = 1'b0;
  assign sda_pad_o = 1'b0;

  DFF_X1 wb_ack_o_reg ( .D(N26), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \ctr_reg[7]  ( .D(n151), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[4]  ( .D(n148), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[3]  ( .D(n147), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n7) );
  DFFR_X1 \ctr_reg[2]  ( .D(n146), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n8) );
  DFFR_X1 \ctr_reg[0]  ( .D(n144), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n10) );
  DFFR_X1 \txr_reg[7]  ( .D(n143), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n11) );
  DFFR_X1 \txr_reg[6]  ( .D(n142), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n12) );
  DFFR_X1 \txr_reg[4]  ( .D(n140), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n14) );
  DFFR_X1 \txr_reg[3]  ( .D(n139), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n15) );
  DFFR_X1 \txr_reg[1]  ( .D(n137), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n17) );
  DFFR_X1 \txr_reg[0]  ( .D(n136), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n18) );
  DFFS_X1 \prer_reg[15]  ( .D(n135), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[14]  ( .D(n134), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[12]  ( .D(n263), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n190) );
  DFFS_X1 \prer_reg[11]  ( .D(n262), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n188) );
  DFFS_X1 \prer_reg[10]  ( .D(n261), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n186) );
  DFFS_X1 \prer_reg[9]  ( .D(n132), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n25) );
  DFFS_X1 \prer_reg[5]  ( .D(n128), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n29) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N36), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N34), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N33), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N32), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFR_X1 rxack_reg ( .D(N102), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N37), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N103), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N31), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N30), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N35), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 \cr_reg[6]  ( .D(n119), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n247) );
  DFFR_X1 \cr_reg[4]  ( .D(n121), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n235) );
  DFFR_X1 \cr_reg[5]  ( .D(n120), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n241) );
  DFFR_X1 wb_inta_o_reg ( .D(N108), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 al_reg ( .D(N101), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]), .QN(n245)
         );
  DFFR_X1 \txr_reg[2]  ( .D(n138), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n225) );
  DFFR_X1 \ctr_reg[5]  ( .D(n149), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n5) );
  DFFR_X1 \txr_reg[5]  ( .D(n141), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n13) );
  DFFR_X1 \ctr_reg[6]  ( .D(n150), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[1]  ( .D(n145), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n9) );
  DFFS_X1 \prer_reg[2]  ( .D(n125), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n32) );
  DFFS_X1 \prer_reg[1]  ( .D(n124), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n33) );
  DFFS_X1 \prer_reg[8]  ( .D(n131), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n26) );
  DFFR_X1 irq_flag_reg ( .D(N104), .CK(wb_clk_i), .RN(arst_i), .Q(sr_0), .QN(
        n43) );
  DFFR_X1 \cr_reg[1]  ( .D(n116), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]), .QN(
        n41) );
  DFFR_X1 \cr_reg[0]  ( .D(n115), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n208) );
  DFFR_X1 \cr_reg[2]  ( .D(n117), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]), .QN(
        n40) );
  DFFR_X1 \cr_reg[7]  ( .D(n118), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n252) );
  DFFS_X1 \prer_reg[7]  ( .D(n130), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n27) );
  DFFS_X1 \prer_reg[6]  ( .D(n129), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n28) );
  DFFS_X1 \prer_reg[0]  ( .D(n123), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n34) );
  DFFS_X1 \prer_reg[13]  ( .D(n133), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n21) );
  DFFS_X1 \prer_reg[4]  ( .D(n127), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n30) );
  DFFS_X1 \prer_reg[3]  ( .D(n126), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n31) );
  DFFR_X1 \cr_reg[3]  ( .D(n162), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n230) );
  INV_X1 U129 ( .A(n168), .ZN(n198) );
  AND2_X1 U130 ( .A1(n157), .A2(n204), .ZN(n152) );
  AND2_X1 U131 ( .A1(n198), .A2(n232), .ZN(n153) );
  AND2_X1 U132 ( .A1(n183), .A2(n198), .ZN(n154) );
  AND2_X1 U133 ( .A1(n201), .A2(n254), .ZN(n155) );
  AND3_X1 U134 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n156) );
  AND2_X1 U135 ( .A1(n202), .A2(n210), .ZN(n157) );
  NAND2_X1 U136 ( .A1(n197), .A2(n156), .ZN(n158) );
  NAND2_X1 U137 ( .A1(n198), .A2(n220), .ZN(n159) );
  OAI21_X1 U138 ( .B1(n156), .B2(n161), .A(n197), .ZN(n160) );
  OAI21_X1 U139 ( .B1(n156), .B2(n161), .A(n197), .ZN(n170) );
  AND2_X2 U140 ( .A1(n169), .A2(n251), .ZN(n197) );
  NOR2_X1 U141 ( .A1(i2c_al), .A2(done), .ZN(n161) );
  MUX2_X1 U142 ( .A(n163), .B(cr[3]), .S(n197), .Z(n162) );
  AND2_X1 U143 ( .A1(wb_dat_i[3]), .A2(n198), .ZN(n163) );
  INV_X1 U144 ( .A(wb_rst_i), .ZN(n251) );
  INV_X1 U146 ( .A(wb_dat_i[0]), .ZN(n199) );
  NAND2_X1 U147 ( .A1(n156), .A2(n251), .ZN(n168) );
  INV_X1 U148 ( .A(wb_adr_i[2]), .ZN(n172) );
  NAND2_X1 U149 ( .A1(wb_adr_i[0]), .A2(n172), .ZN(n203) );
  INV_X1 U150 ( .A(n203), .ZN(n182) );
  NAND3_X1 U151 ( .A1(wb_adr_i[1]), .A2(n182), .A3(n198), .ZN(n165) );
  NAND2_X1 U152 ( .A1(n165), .A2(n251), .ZN(n166) );
  NAND2_X1 U153 ( .A1(n198), .A2(n166), .ZN(n167) );
  OAI22_X1 U154 ( .A1(n199), .A2(n167), .B1(n18), .B2(n166), .ZN(n136) );
  INV_X1 U155 ( .A(wb_dat_i[1]), .ZN(n214) );
  OAI22_X1 U156 ( .A1(n214), .A2(n167), .B1(n17), .B2(n166), .ZN(n137) );
  INV_X1 U157 ( .A(wb_dat_i[2]), .ZN(n221) );
  OAI22_X1 U158 ( .A1(n221), .A2(n167), .B1(n225), .B2(n166), .ZN(n138) );
  INV_X1 U159 ( .A(wb_dat_i[3]), .ZN(n227) );
  OAI22_X1 U160 ( .A1(n227), .A2(n167), .B1(n15), .B2(n166), .ZN(n139) );
  INV_X1 U161 ( .A(wb_dat_i[4]), .ZN(n231) );
  OAI22_X1 U162 ( .A1(n231), .A2(n167), .B1(n14), .B2(n166), .ZN(n140) );
  INV_X1 U163 ( .A(wb_dat_i[5]), .ZN(n237) );
  OAI22_X1 U164 ( .A1(n237), .A2(n167), .B1(n13), .B2(n166), .ZN(n141) );
  INV_X1 U165 ( .A(wb_dat_i[6]), .ZN(n196) );
  OAI22_X1 U166 ( .A1(n196), .A2(n167), .B1(n12), .B2(n166), .ZN(n142) );
  INV_X1 U167 ( .A(wb_dat_i[7]), .ZN(n194) );
  OAI22_X1 U168 ( .A1(n194), .A2(n167), .B1(n11), .B2(n166), .ZN(n143) );
  INV_X1 U169 ( .A(wb_adr_i[0]), .ZN(n206) );
  NAND3_X1 U170 ( .A1(wb_adr_i[1]), .A2(n206), .A3(n172), .ZN(n210) );
  OAI21_X1 U171 ( .B1(n210), .B2(n168), .A(n251), .ZN(n236) );
  NAND2_X1 U172 ( .A1(n198), .A2(n236), .ZN(n238) );
  OAI22_X1 U173 ( .A1(n238), .A2(n194), .B1(n3), .B2(n236), .ZN(n151) );
  INV_X1 U174 ( .A(wb_adr_i[1]), .ZN(n181) );
  NAND2_X1 U175 ( .A1(wb_adr_i[2]), .A2(n181), .ZN(n205) );
  INV_X1 U176 ( .A(n205), .ZN(n211) );
  NAND2_X1 U177 ( .A1(n211), .A2(n206), .ZN(n246) );
  INV_X1 U178 ( .A(n246), .ZN(n258) );
  NAND3_X1 U179 ( .A1(ctr[7]), .A2(n198), .A3(n258), .ZN(n169) );
  NAND2_X1 U180 ( .A1(n198), .A2(n170), .ZN(n171) );
  OAI22_X1 U181 ( .A1(n231), .A2(n171), .B1(n235), .B2(n160), .ZN(n121) );
  OAI22_X1 U182 ( .A1(n237), .A2(n171), .B1(n241), .B2(n160), .ZN(n120) );
  OAI22_X1 U183 ( .A1(n196), .A2(n171), .B1(n247), .B2(n160), .ZN(n119) );
  OAI22_X1 U184 ( .A1(n171), .A2(n194), .B1(n252), .B2(n160), .ZN(n118) );
  NAND3_X1 U185 ( .A1(n172), .A2(n206), .A3(n181), .ZN(n254) );
  INV_X1 U186 ( .A(n254), .ZN(n232) );
  MUX2_X1 U187 ( .A(n34), .B(n199), .S(n153), .Z(n173) );
  NAND2_X1 U188 ( .A1(n251), .A2(n173), .ZN(n123) );
  MUX2_X1 U189 ( .A(n33), .B(n214), .S(n153), .Z(n174) );
  NAND2_X1 U190 ( .A1(n251), .A2(n174), .ZN(n124) );
  MUX2_X1 U191 ( .A(n32), .B(n221), .S(n153), .Z(n175) );
  NAND2_X1 U192 ( .A1(n251), .A2(n175), .ZN(n125) );
  MUX2_X1 U193 ( .A(n31), .B(n227), .S(n153), .Z(n176) );
  NAND2_X1 U194 ( .A1(n251), .A2(n176), .ZN(n126) );
  MUX2_X1 U195 ( .A(n30), .B(n231), .S(n153), .Z(n177) );
  NAND2_X1 U196 ( .A1(n251), .A2(n177), .ZN(n127) );
  MUX2_X1 U197 ( .A(n29), .B(n237), .S(n153), .Z(n178) );
  NAND2_X1 U198 ( .A1(n251), .A2(n178), .ZN(n128) );
  MUX2_X1 U199 ( .A(n28), .B(n196), .S(n153), .Z(n179) );
  NAND2_X1 U200 ( .A1(n251), .A2(n179), .ZN(n129) );
  MUX2_X1 U201 ( .A(n27), .B(n194), .S(n153), .Z(n180) );
  NAND2_X1 U202 ( .A1(n251), .A2(n180), .ZN(n130) );
  NAND2_X1 U203 ( .A1(n182), .A2(n181), .ZN(n200) );
  INV_X1 U204 ( .A(n200), .ZN(n183) );
  MUX2_X1 U205 ( .A(n26), .B(n199), .S(n154), .Z(n184) );
  NAND2_X1 U206 ( .A1(n251), .A2(n184), .ZN(n131) );
  MUX2_X1 U207 ( .A(n25), .B(n214), .S(n154), .Z(n185) );
  NAND2_X1 U208 ( .A1(n251), .A2(n185), .ZN(n132) );
  MUX2_X1 U209 ( .A(n186), .B(n221), .S(n154), .Z(n187) );
  NAND2_X1 U210 ( .A1(n251), .A2(n187), .ZN(n261) );
  MUX2_X1 U211 ( .A(n188), .B(n227), .S(n154), .Z(n189) );
  NAND2_X1 U212 ( .A1(n251), .A2(n189), .ZN(n262) );
  MUX2_X1 U213 ( .A(n190), .B(n231), .S(n154), .Z(n191) );
  NAND2_X1 U214 ( .A1(n251), .A2(n191), .ZN(n263) );
  MUX2_X1 U215 ( .A(n21), .B(n237), .S(n154), .Z(n192) );
  NAND2_X1 U216 ( .A1(n251), .A2(n192), .ZN(n133) );
  MUX2_X1 U217 ( .A(n20), .B(n196), .S(n154), .Z(n193) );
  NAND2_X1 U218 ( .A1(n251), .A2(n193), .ZN(n134) );
  MUX2_X1 U219 ( .A(n19), .B(n194), .S(n154), .Z(n195) );
  NAND2_X1 U220 ( .A1(n251), .A2(n195), .ZN(n135) );
  OAI22_X1 U221 ( .A1(n238), .A2(n196), .B1(n4), .B2(n236), .ZN(n150) );
  NAND2_X1 U222 ( .A1(n197), .A2(n156), .ZN(n220) );
  NAND2_X1 U223 ( .A1(n198), .A2(n220), .ZN(n219) );
  OAI22_X1 U224 ( .A1(n208), .A2(n158), .B1(n159), .B2(n199), .ZN(n115) );
  AOI211_X1 U225 ( .C1(n43), .C2(n161), .A(cr[0]), .B(wb_rst_i), .ZN(N104) );
  NOR3_X1 U226 ( .A1(n43), .A2(n4), .A3(wb_rst_i), .ZN(N108) );
  AND3_X1 U227 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N26) );
  OAI22_X1 U228 ( .A1(n238), .A2(n199), .B1(n10), .B2(n236), .ZN(n144) );
  NAND2_X1 U229 ( .A1(n200), .A2(n254), .ZN(n201) );
  INV_X1 U230 ( .A(n201), .ZN(n202) );
  NAND2_X1 U231 ( .A1(n157), .A2(n203), .ZN(n204) );
  INV_X1 U232 ( .A(n204), .ZN(n207) );
  NAND3_X1 U233 ( .A1(n207), .A2(n206), .A3(n205), .ZN(n253) );
  OAI22_X1 U234 ( .A1(n34), .A2(n254), .B1(n253), .B2(n208), .ZN(n209) );
  AOI221_X1 U235 ( .B1(n155), .B2(prer[8]), .C1(rxr[0]), .C2(n152), .A(n209), 
        .ZN(n213) );
  INV_X1 U236 ( .A(n210), .ZN(n257) );
  NAND2_X1 U237 ( .A1(n211), .A2(n246), .ZN(n226) );
  INV_X1 U238 ( .A(n226), .ZN(n256) );
  AOI222_X1 U239 ( .A1(sr_0), .A2(n258), .B1(ctr[0]), .B2(n257), .C1(n256), 
        .C2(txr[0]), .ZN(n212) );
  NAND2_X1 U240 ( .A1(n213), .A2(n212), .ZN(N30) );
  OAI22_X1 U241 ( .A1(n41), .A2(n158), .B1(n159), .B2(n214), .ZN(n116) );
  OAI22_X1 U242 ( .A1(n238), .A2(n214), .B1(n9), .B2(n236), .ZN(n145) );
  AOI21_X1 U243 ( .B1(n241), .B2(n235), .A(wb_rst_i), .ZN(N103) );
  INV_X1 U244 ( .A(n25), .ZN(n215) );
  AOI22_X1 U245 ( .A1(n155), .A2(n215), .B1(rxr[1]), .B2(n152), .ZN(n218) );
  INV_X1 U246 ( .A(n253), .ZN(n222) );
  AOI22_X1 U247 ( .A1(cr[1]), .A2(n222), .B1(n232), .B2(prer[1]), .ZN(n217) );
  AOI222_X1 U248 ( .A1(sr_1), .A2(n258), .B1(ctr[1]), .B2(n257), .C1(n256), 
        .C2(txr[1]), .ZN(n216) );
  NAND3_X1 U249 ( .A1(n218), .A2(n217), .A3(n216), .ZN(N31) );
  OAI22_X1 U250 ( .A1(n40), .A2(n158), .B1(n221), .B2(n219), .ZN(n117) );
  OAI22_X1 U251 ( .A1(n238), .A2(n221), .B1(n8), .B2(n236), .ZN(n146) );
  AOI22_X1 U252 ( .A1(n232), .A2(prer[2]), .B1(ctr[2]), .B2(n257), .ZN(n224)
         );
  AOI222_X1 U253 ( .A1(cr[2]), .A2(n222), .B1(prer[10]), .B2(n155), .C1(rxr[2]), .C2(n152), .ZN(n223) );
  OAI211_X1 U254 ( .C1(n226), .C2(n225), .A(n224), .B(n223), .ZN(N32) );
  OAI22_X1 U255 ( .A1(n238), .A2(n227), .B1(n7), .B2(n236), .ZN(n147) );
  AOI22_X1 U256 ( .A1(prer[11]), .A2(n155), .B1(rxr[3]), .B2(n152), .ZN(n229)
         );
  AOI222_X1 U257 ( .A1(txr[3]), .A2(n256), .B1(n232), .B2(prer[3]), .C1(ctr[3]), .C2(n257), .ZN(n228) );
  OAI211_X1 U258 ( .C1(n253), .C2(n230), .A(n229), .B(n228), .ZN(N33) );
  OAI22_X1 U259 ( .A1(n238), .A2(n231), .B1(n6), .B2(n236), .ZN(n148) );
  AOI22_X1 U260 ( .A1(prer[12]), .A2(n155), .B1(rxr[4]), .B2(n152), .ZN(n234)
         );
  AOI222_X1 U261 ( .A1(txr[4]), .A2(n256), .B1(n232), .B2(prer[4]), .C1(ctr[4]), .C2(n257), .ZN(n233) );
  OAI211_X1 U262 ( .C1(n253), .C2(n235), .A(n234), .B(n233), .ZN(N34) );
  OAI22_X1 U263 ( .A1(n238), .A2(n237), .B1(n5), .B2(n236), .ZN(n149) );
  NAND2_X1 U264 ( .A1(n252), .A2(sr[5]), .ZN(n240) );
  INV_X1 U265 ( .A(i2c_al), .ZN(n239) );
  AOI21_X1 U266 ( .B1(n240), .B2(n239), .A(wb_rst_i), .ZN(N101) );
  AOI22_X1 U267 ( .A1(ctr[5]), .A2(n257), .B1(n256), .B2(txr[5]), .ZN(n244) );
  OAI22_X1 U268 ( .A1(n29), .A2(n254), .B1(n253), .B2(n241), .ZN(n242) );
  AOI221_X1 U269 ( .B1(n155), .B2(prer[13]), .C1(rxr[5]), .C2(n152), .A(n242), 
        .ZN(n243) );
  OAI211_X1 U270 ( .C1(n246), .C2(n245), .A(n244), .B(n243), .ZN(N35) );
  OAI22_X1 U271 ( .A1(n28), .A2(n254), .B1(n253), .B2(n247), .ZN(n248) );
  AOI221_X1 U272 ( .B1(n155), .B2(prer[14]), .C1(rxr[6]), .C2(n152), .A(n248), 
        .ZN(n250) );
  AOI222_X1 U273 ( .A1(sr[6]), .A2(n258), .B1(ctr[6]), .B2(n257), .C1(n256), 
        .C2(txr[6]), .ZN(n249) );
  NAND2_X1 U274 ( .A1(n250), .A2(n249), .ZN(N36) );
  AND2_X1 U275 ( .A1(irxack), .A2(n251), .ZN(N102) );
  OAI22_X1 U276 ( .A1(n27), .A2(n254), .B1(n253), .B2(n252), .ZN(n255) );
  AOI221_X1 U277 ( .B1(n155), .B2(prer[15]), .C1(rxr[7]), .C2(n152), .A(n255), 
        .ZN(n260) );
  AOI222_X1 U278 ( .A1(sr[7]), .A2(n258), .B1(ctr[7]), .B2(n257), .C1(n256), 
        .C2(txr[7]), .ZN(n259) );
  NAND2_X1 U279 ( .A1(n260), .A2(n259), .ZN(N37) );
  NOR2_X1 \byte_controller/U128  ( .A1(\byte_controller/n147 ), .A2(
        \byte_controller/n146 ), .ZN(\byte_controller/n79 ) );
  NAND3_X1 \byte_controller/U127  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n138 ), .A3(\byte_controller/n17 ), .ZN(
        \byte_controller/n139 ) );
  NAND3_X1 \byte_controller/U126  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n11 ), .A3(\byte_controller/core_cmd [3]), .ZN(
        \byte_controller/n141 ) );
  NAND3_X1 \byte_controller/U125  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n10 ), .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/n133 ) );
  OAI21_X1 \byte_controller/U124  ( .B1(\byte_controller/n28 ), .B2(
        \byte_controller/n130 ), .A(\byte_controller/n129 ), .ZN(
        \byte_controller/n82 ) );
  OAI21_X1 \byte_controller/U123  ( .B1(\byte_controller/n130 ), .B2(
        \byte_controller/n128 ), .A(\byte_controller/n127 ), .ZN(
        \byte_controller/n83 ) );
  AOI21_X1 \byte_controller/U122  ( .B1(\byte_controller/n126 ), .B2(
        \byte_controller/n143 ), .A(\byte_controller/n146 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U121  ( .A1(\byte_controller/n9 ), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n143 ) );
  AOI22_X1 \byte_controller/U120  ( .A1(cr[3]), .A2(\byte_controller/n125 ), 
        .B1(rxr[7]), .B2(\byte_controller/n124 ), .ZN(\byte_controller/n126 )
         );
  NAND3_X1 \byte_controller/U119  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n19 ), .A3(\byte_controller/n121 ), .ZN(
        \byte_controller/n124 ) );
  AOI221_X1 \byte_controller/U118  ( .B1(\byte_controller/n30 ), .B2(
        \byte_controller/n43 ), .C1(\byte_controller/c_state [1]), .C2(
        \byte_controller/n119 ), .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n121 ) );
  OAI21_X1 \byte_controller/U117  ( .B1(\byte_controller/n43 ), .B2(
        \byte_controller/n119 ), .A(\byte_controller/n30 ), .ZN(
        \byte_controller/n125 ) );
  OAI221_X1 \byte_controller/U116  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n7 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n116 ), .A(\byte_controller/n115 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U115  ( .A1(txr[7]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n115 ) );
  OAI221_X1 \byte_controller/U114  ( .B1(\byte_controller/n116 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n113 ), .A(\byte_controller/n112 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U113  ( .A1(txr[6]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n112 ) );
  OAI221_X1 \byte_controller/U112  ( .B1(\byte_controller/n113 ), .B2(
        \byte_controller/n7 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n111 ), .A(\byte_controller/n110 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U111  ( .A1(txr[5]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n110 ) );
  OAI221_X1 \byte_controller/U110  ( .B1(\byte_controller/n111 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n109 ), .A(\byte_controller/n108 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U109  ( .A1(txr[4]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n108 ) );
  OAI221_X1 \byte_controller/U108  ( .B1(\byte_controller/n7 ), .B2(
        \byte_controller/n109 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n107 ), .A(\byte_controller/n106 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U107  ( .A1(txr[3]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n106 ) );
  OAI221_X1 \byte_controller/U106  ( .B1(\byte_controller/n107 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n105 ), .A(\byte_controller/n104 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U105  ( .A1(txr[2]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n104 ) );
  OAI221_X1 \byte_controller/U104  ( .B1(\byte_controller/n105 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n103 ), .A(\byte_controller/n102 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U103  ( .A1(txr[1]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n102 ) );
  OAI221_X1 \byte_controller/U102  ( .B1(\byte_controller/n103 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/n144 ), .A(\byte_controller/n101 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U101  ( .A1(txr[0]), .A2(\byte_controller/n114 ), 
        .ZN(\byte_controller/n101 ) );
  INV_X1 \byte_controller/U100  ( .A(\byte_controller/n100 ), .ZN(
        \byte_controller/n114 ) );
  INV_X1 \byte_controller/U99  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n144 ) );
  NAND3_X1 \byte_controller/U98  ( .A1(\byte_controller/n117 ), .A2(
        \byte_controller/n78 ), .A3(\byte_controller/n100 ), .ZN(
        \byte_controller/n118 ) );
  NAND3_X1 \byte_controller/U97  ( .A1(\byte_controller/n136 ), .A2(
        \byte_controller/n142 ), .A3(\byte_controller/n77 ), .ZN(
        \byte_controller/n84 ) );
  NAND3_X1 \byte_controller/U96  ( .A1(\byte_controller/n10 ), .A2(
        \byte_controller/c_state [3]), .A3(\byte_controller/n119 ), .ZN(
        \byte_controller/n77 ) );
  INV_X1 \byte_controller/U95  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n119 ) );
  NAND4_X1 \byte_controller/U94  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n76 ), .A3(\byte_controller/n11 ), .A4(
        \byte_controller/c_state [2]), .ZN(\byte_controller/n142 ) );
  NAND3_X1 \byte_controller/U93  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n17 ), .A3(\byte_controller/n76 ), .ZN(
        \byte_controller/n136 ) );
  NAND2_X1 \byte_controller/U92  ( .A1(\byte_controller/n74 ), .A2(
        \byte_controller/n140 ), .ZN(\byte_controller/n86 ) );
  NAND3_X1 \byte_controller/U91  ( .A1(\byte_controller/n73 ), .A2(
        \byte_controller/n17 ), .A3(\byte_controller/n10 ), .ZN(
        \byte_controller/n74 ) );
  OAI221_X1 \byte_controller/U90  ( .B1(\byte_controller/n71 ), .B2(
        \byte_controller/n117 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n70 ), .A(\byte_controller/n100 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U89  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n69 ), .A(\byte_controller/n76 ), .ZN(
        \byte_controller/n71 ) );
  OAI211_X1 \byte_controller/U88  ( .C1(\byte_controller/n66 ), .C2(
        \byte_controller/n70 ), .A(\byte_controller/n68 ), .B(
        \byte_controller/n100 ), .ZN(\byte_controller/n90 ) );
  NAND3_X1 \byte_controller/U87  ( .A1(\byte_controller/n67 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n66 ), .ZN(
        \byte_controller/n68 ) );
  OAI21_X1 \byte_controller/U86  ( .B1(\byte_controller/n65 ), .B2(
        \byte_controller/n117 ), .A(\byte_controller/n78 ), .ZN(
        \byte_controller/n70 ) );
  NAND2_X1 \byte_controller/U85  ( .A1(\byte_controller/n100 ), .A2(
        \byte_controller/n64 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U84  ( .A(\byte_controller/n63 ), .B(
        \byte_controller/n65 ), .S(\byte_controller/n67 ), .Z(
        \byte_controller/n64 ) );
  INV_X1 \byte_controller/U83  ( .A(\byte_controller/n117 ), .ZN(
        \byte_controller/n67 ) );
  NAND2_X1 \byte_controller/U82  ( .A1(\byte_controller/n78 ), .A2(
        \byte_controller/n65 ), .ZN(\byte_controller/n63 ) );
  NAND2_X1 \byte_controller/U81  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n78 ), .ZN(\byte_controller/n100 ) );
  AOI21_X1 \byte_controller/U80  ( .B1(\byte_controller/n131 ), .B2(
        \byte_controller/n43 ), .A(\byte_controller/n62 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U79  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n138 ), .ZN(\byte_controller/n131 ) );
  OAI21_X1 \byte_controller/U78  ( .B1(\byte_controller/n36 ), .B2(
        \byte_controller/n62 ), .A(\byte_controller/n61 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U77  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n11 ), .A3(\byte_controller/n14 ), .A4(
        \byte_controller/n59 ), .ZN(\byte_controller/n61 ) );
  OAI21_X1 \byte_controller/U76  ( .B1(\byte_controller/n22 ), .B2(
        \byte_controller/n130 ), .A(\byte_controller/n129 ), .ZN(
        \byte_controller/n91 ) );
  NAND2_X1 \byte_controller/U75  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n58 ), .ZN(\byte_controller/n129 ) );
  OAI21_X1 \byte_controller/U74  ( .B1(\byte_controller/n57 ), .B2(
        \byte_controller/n30 ), .A(\byte_controller/n56 ), .ZN(
        \byte_controller/n58 ) );
  NAND4_X1 \byte_controller/U73  ( .A1(\byte_controller/n13 ), .A2(
        \byte_controller/n55 ), .A3(\byte_controller/n27 ), .A4(
        \byte_controller/n53 ), .ZN(\byte_controller/n56 ) );
  INV_X1 \byte_controller/U72  ( .A(cr[7]), .ZN(\byte_controller/n53 ) );
  NAND2_X1 \byte_controller/U71  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n52 ), .ZN(\byte_controller/n85 ) );
  NAND3_X1 \byte_controller/U70  ( .A1(\byte_controller/n73 ), .A2(
        \byte_controller/c_state [2]), .A3(\byte_controller/n11 ), .ZN(
        \byte_controller/n52 ) );
  NAND2_X1 \byte_controller/U69  ( .A1(\byte_controller/n51 ), .A2(
        \byte_controller/n76 ), .ZN(\byte_controller/n73 ) );
  INV_X1 \byte_controller/U68  ( .A(\byte_controller/n138 ), .ZN(
        \byte_controller/n76 ) );
  NAND3_X1 \byte_controller/U67  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n66 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n138 ) );
  INV_X1 \byte_controller/U66  ( .A(\byte_controller/n137 ), .ZN(
        \byte_controller/n51 ) );
  OAI211_X1 \byte_controller/U65  ( .C1(\byte_controller/c_state [0]), .C2(
        cr[4]), .A(\byte_controller/n72 ), .B(\byte_controller/n27 ), .ZN(
        \byte_controller/n134 ) );
  INV_X1 \byte_controller/U64  ( .A(\byte_controller/n50 ), .ZN(
        \byte_controller/n72 ) );
  OAI211_X1 \byte_controller/U63  ( .C1(\byte_controller/c_state [0]), .C2(
        \byte_controller/n49 ), .A(\byte_controller/n75 ), .B(
        \byte_controller/n10 ), .ZN(\byte_controller/n50 ) );
  NOR3_X1 \byte_controller/U62  ( .A1(\byte_controller/n48 ), .A2(
        \byte_controller/c_state [1]), .A3(cr[7]), .ZN(\byte_controller/n49 )
         );
  OAI21_X1 \byte_controller/U61  ( .B1(\byte_controller/n36 ), .B2(
        \byte_controller/n130 ), .A(\byte_controller/n127 ), .ZN(
        \byte_controller/n87 ) );
  NAND3_X1 \byte_controller/U60  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n29 ), .A3(cr[7]), .ZN(\byte_controller/n127 ) );
  NAND2_X1 \byte_controller/U59  ( .A1(\byte_controller/n123 ), .A2(
        \byte_controller/n122 ), .ZN(\byte_controller/n42 ) );
  NAND2_X1 \byte_controller/U58  ( .A1(\byte_controller/n137 ), .A2(
        \byte_controller/n10 ), .ZN(\byte_controller/n130 ) );
  OAI22_X1 \byte_controller/U57  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n38 ), .B1(\byte_controller/n13 ), .B2(
        \byte_controller/n9 ), .ZN(\byte_controller/n137 ) );
  NAND3_X1 \byte_controller/U56  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/n36 ), .A3(\byte_controller/n43 ), .ZN(
        \byte_controller/n38 ) );
  INV_X1 \byte_controller/U55  ( .A(\byte_controller/n48 ), .ZN(
        \byte_controller/n37 ) );
  NAND3_X1 \byte_controller/U54  ( .A1(\byte_controller/n122 ), .A2(
        \byte_controller/n120 ), .A3(\byte_controller/n123 ), .ZN(
        \byte_controller/n48 ) );
  OAI222_X1 \byte_controller/U53  ( .A1(done), .A2(\byte_controller/n55 ), 
        .B1(\byte_controller/n57 ), .B2(done), .C1(\byte_controller/n54 ), 
        .C2(done), .ZN(\byte_controller/n39 ) );
  INV_X1 \byte_controller/U52  ( .A(cr[5]), .ZN(\byte_controller/n54 ) );
  INV_X1 \byte_controller/U51  ( .A(cr[4]), .ZN(\byte_controller/n55 ) );
  AOI21_X1 \byte_controller/U50  ( .B1(\byte_controller/n35 ), .B2(
        \byte_controller/n22 ), .A(\byte_controller/n62 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U49  ( .A1(\byte_controller/n10 ), .A2(
        \byte_controller/n9 ), .ZN(\byte_controller/n62 ) );
  INV_X1 \byte_controller/U48  ( .A(wb_rst_i), .ZN(\byte_controller/n78 ) );
  INV_X1 \byte_controller/U47  ( .A(i2c_al), .ZN(\byte_controller/n34 ) );
  NAND2_X1 \byte_controller/U46  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n57 ), .ZN(\byte_controller/n35 ) );
  INV_X1 \byte_controller/U45  ( .A(cr[6]), .ZN(\byte_controller/n57 ) );
  NAND4_X1 \byte_controller/U44  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n136 ), .A3(\byte_controller/n135 ), .A4(
        \byte_controller/n133 ), .ZN(\byte_controller/n81 ) );
  NAND2_X1 \byte_controller/U43  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n132 ), .ZN(\byte_controller/n135 ) );
  NAND4_X1 \byte_controller/U42  ( .A1(\byte_controller/n139 ), .A2(
        \byte_controller/n140 ), .A3(\byte_controller/n141 ), .A4(
        \byte_controller/n142 ), .ZN(\byte_controller/n80 ) );
  BUF_X1 \byte_controller/U41  ( .A(\byte_controller/n137 ), .Z(
        \byte_controller/n33 ) );
  NAND4_X1 \byte_controller/U40  ( .A1(\byte_controller/n41 ), .A2(
        \byte_controller/n60 ), .A3(\byte_controller/n30 ), .A4(
        \byte_controller/n40 ), .ZN(\byte_controller/n47 ) );
  NOR2_X1 \byte_controller/U39  ( .A1(\byte_controller/c_state [0]), .A2(
        \byte_controller/c_state [1]), .ZN(\byte_controller/n40 ) );
  NOR2_X1 \byte_controller/U38  ( .A1(done), .A2(\byte_controller/n42 ), .ZN(
        \byte_controller/n41 ) );
  NAND2_X1 \byte_controller/U37  ( .A1(\byte_controller/n46 ), .A2(
        \byte_controller/n47 ), .ZN(\byte_controller/n75 ) );
  BUF_X2 \byte_controller/U36  ( .A(arst_i), .Z(\byte_controller/n32 ) );
  MUX2_X1 \byte_controller/U35  ( .A(\byte_controller/n144 ), .B(
        \byte_controller/n145 ), .S(\byte_controller/n143 ), .Z(
        \byte_controller/n147 ) );
  NAND2_X1 \byte_controller/U34  ( .A1(\byte_controller/n43 ), .A2(
        \byte_controller/n36 ), .ZN(\byte_controller/n44 ) );
  INV_X1 \byte_controller/U33  ( .A(\byte_controller/n131 ), .ZN(
        \byte_controller/n132 ) );
  OAI21_X1 \byte_controller/U32  ( .B1(\byte_controller/n45 ), .B2(
        \byte_controller/n44 ), .A(\byte_controller/n9 ), .ZN(
        \byte_controller/n46 ) );
  BUF_X2 \byte_controller/U31  ( .A(\byte_controller/n120 ), .Z(
        \byte_controller/n30 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/n38 ), .ZN(
        \byte_controller/n29 ) );
  NAND2_X1 \byte_controller/U29  ( .A1(\byte_controller/n25 ), .A2(
        \byte_controller/n24 ), .ZN(\byte_controller/n26 ) );
  NAND4_X1 \byte_controller/U28  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n30 ), .A3(\byte_controller/n20 ), .A4(
        \byte_controller/n40 ), .ZN(\byte_controller/n25 ) );
  OAI21_X1 \byte_controller/U27  ( .B1(\byte_controller/n16 ), .B2(
        \byte_controller/n44 ), .A(\byte_controller/n9 ), .ZN(
        \byte_controller/n24 ) );
  NAND3_X1 \byte_controller/U26  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/n12 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n23 ) );
  INV_X1 \byte_controller/U25  ( .A(\byte_controller/n21 ), .ZN(
        \byte_controller/n22 ) );
  NOR2_X1 \byte_controller/U24  ( .A1(done), .A2(\byte_controller/n42 ), .ZN(
        \byte_controller/n20 ) );
  OR2_X1 \byte_controller/U23  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n42 ), .ZN(\byte_controller/n45 ) );
  INV_X1 \byte_controller/U22  ( .A(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n19 ) );
  OR3_X1 \byte_controller/U21  ( .A1(cr[4]), .A2(cr[5]), .A3(cr[6]), .ZN(
        \byte_controller/n60 ) );
  OR2_X1 \byte_controller/U20  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n42 ), .ZN(\byte_controller/n16 ) );
  CLKBUF_X1 \byte_controller/U19  ( .A(\byte_controller/n23 ), .Z(
        \byte_controller/n14 ) );
  AND3_X1 \byte_controller/U18  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/n36 ), .A3(\byte_controller/n43 ), .ZN(
        \byte_controller/n13 ) );
  OR2_X1 \byte_controller/U17  ( .A1(\byte_controller/n50 ), .A2(
        \byte_controller/n27 ), .ZN(\byte_controller/n140 ) );
  INV_X1 \byte_controller/U16  ( .A(cr[4]), .ZN(\byte_controller/n12 ) );
  INV_X1 \byte_controller/U15  ( .A(\byte_controller/n146 ), .ZN(
        \byte_controller/n11 ) );
  INV_X1 \byte_controller/U14  ( .A(\byte_controller/n146 ), .ZN(
        \byte_controller/n10 ) );
  CLKBUF_X1 \byte_controller/U13  ( .A(\byte_controller/c_state [1]), .Z(
        \byte_controller/n17 ) );
  BUF_X1 \byte_controller/U12  ( .A(\byte_controller/n54 ), .Z(
        \byte_controller/n27 ) );
  BUF_X2 \byte_controller/U11  ( .A(\byte_controller/core_ack ), .Z(
        \byte_controller/n9 ) );
  BUF_X1 \byte_controller/U10  ( .A(\byte_controller/n118 ), .Z(
        \byte_controller/n8 ) );
  BUF_X1 \byte_controller/U9  ( .A(\byte_controller/n118 ), .Z(
        \byte_controller/n7 ) );
  BUF_X1 \byte_controller/U8  ( .A(\byte_controller/n118 ), .Z(
        \byte_controller/n5 ) );
  NAND2_X1 \byte_controller/U7  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n78 ), .ZN(\byte_controller/n146 ) );
  AND2_X1 \byte_controller/U6  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n11 ), .ZN(\byte_controller/n31 ) );
  AND2_X1 \byte_controller/U5  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n11 ), .ZN(\byte_controller/n4 ) );
  INV_X32 \byte_controller/U4  ( .A(wb_rst_i), .ZN(\byte_controller/n1 ) );
  NAND3_X2 \byte_controller/U3  ( .A1(\byte_controller/n2 ), .A2(
        \byte_controller/n1 ), .A3(\byte_controller/n3 ), .ZN(
        \byte_controller/n117 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/n21 ), .QN(
        \byte_controller/n123 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/n65 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/n2 ) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/n69 ), .QN(
        \byte_controller/n15 ) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(done), .QN(
        \byte_controller/n59 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n32 ), .Q(\byte_controller/ld ), .QN(
        \byte_controller/n3 ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n145 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n120 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n28 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[0]), .QN(
        \byte_controller/n103 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[1]), .QN(
        \byte_controller/n105 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[2]), .QN(
        \byte_controller/n107 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[3]), .QN(
        \byte_controller/n109 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[4]), .QN(
        \byte_controller/n111 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[5]), .QN(
        \byte_controller/n113 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[6]), .QN(
        \byte_controller/n116 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n90 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n66 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [0]), .QN(\byte_controller/n128 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/c_state [0]), .QN(\byte_controller/n36 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n122 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(\byte_controller/n32 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n43 ) );
  NOR3_X1 \byte_controller/bit_controller/U176  ( .A1(
        \byte_controller/bit_controller/n87 ), .A2(
        \byte_controller/bit_controller/n66 ), .A3(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/N154 ) );
  AOI211_X1 \byte_controller/bit_controller/U175  ( .C1(
        \byte_controller/bit_controller/n81 ), .C2(
        \byte_controller/bit_controller/n80 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N75 ) );
  NOR3_X1 \byte_controller/bit_controller/U174  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  MUX2_X1 \byte_controller/bit_controller/U173  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n216 ), .S(
        \byte_controller/bit_controller/n215 ), .Z(
        \byte_controller/bit_controller/n158 ) );
  AOI21_X1 \byte_controller/bit_controller/U172  ( .B1(
        \byte_controller/bit_controller/n54 ), .B2(
        \byte_controller/bit_controller/n214 ), .A(
        \byte_controller/bit_controller/n213 ), .ZN(
        \byte_controller/bit_controller/n215 ) );
  NAND4_X1 \byte_controller/bit_controller/U171  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n124 ), .A3(
        \byte_controller/bit_controller/n8 ), .A4(
        \byte_controller/bit_controller/n212 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  AOI211_X1 \byte_controller/bit_controller/U170  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n211 ), .A(\byte_controller/bit_controller/n217 ), .B(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/n212 ) );
  NAND4_X1 \byte_controller/bit_controller/U169  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n111 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n211 ) );
  NAND4_X1 \byte_controller/bit_controller/U168  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/n207 ), .A3(
        \byte_controller/bit_controller/n206 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n208 ) );
  OAI22_X1 \byte_controller/bit_controller/U167  ( .A1(
        \byte_controller/bit_controller/n7 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n35 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U166  ( .A1(
        \byte_controller/bit_controller/n109 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n108 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U165  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  OAI21_X1 \byte_controller/bit_controller/U164  ( .B1(
        \byte_controller/bit_controller/n111 ), .B2(
        \byte_controller/bit_controller/n11 ), .A(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  NAND4_X1 \byte_controller/bit_controller/U163  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n203 ), .A3(
        \byte_controller/bit_controller/n206 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n204 ) );
  INV_X1 \byte_controller/bit_controller/U162  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n206 ) );
  AOI21_X1 \byte_controller/bit_controller/U161  ( .B1(
        \byte_controller/bit_controller/n55 ), .B2(
        \byte_controller/bit_controller/n200 ), .A(
        \byte_controller/bit_controller/n43 ), .ZN(
        \byte_controller/bit_controller/n229 ) );
  INV_X1 \byte_controller/bit_controller/U160  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n219 ) );
  AOI222_X1 \byte_controller/bit_controller/U159  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n71 ), .B1(
        \byte_controller/bit_controller/n29 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n31 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  INV_X1 \byte_controller/bit_controller/U158  ( .A(
        \byte_controller/bit_controller/n197 ), .ZN(
        \byte_controller/bit_controller/n228 ) );
  AOI222_X1 \byte_controller/bit_controller/U157  ( .A1(prer[0]), .A2(
        \byte_controller/bit_controller/n65 ), .B1(
        \byte_controller/bit_controller/n62 ), .B2(
        \byte_controller/bit_controller/cnt [0]), .C1(
        \byte_controller/bit_controller/n3 ), .C2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  INV_X1 \byte_controller/bit_controller/U156  ( .A(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/n227 ) );
  AOI222_X1 \byte_controller/bit_controller/U155  ( .A1(prer[1]), .A2(
        \byte_controller/bit_controller/n65 ), .B1(
        \byte_controller/bit_controller/n62 ), .B2(
        \byte_controller/bit_controller/cnt [1]), .C1(
        \byte_controller/bit_controller/n71 ), .C2(
        \byte_controller/bit_controller/N29 ), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U154  ( .A(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n226 ) );
  AOI222_X1 \byte_controller/bit_controller/U153  ( .A1(prer[2]), .A2(
        \byte_controller/bit_controller/n31 ), .B1(
        \byte_controller/bit_controller/n62 ), .B2(
        \byte_controller/bit_controller/n33 ), .C1(
        \byte_controller/bit_controller/n1 ), .C2(
        \byte_controller/bit_controller/N30 ), .ZN(
        \byte_controller/bit_controller/n195 ) );
  INV_X1 \byte_controller/bit_controller/U152  ( .A(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n225 ) );
  AOI222_X1 \byte_controller/bit_controller/U151  ( .A1(prer[3]), .A2(
        \byte_controller/bit_controller/n65 ), .B1(
        \byte_controller/bit_controller/n29 ), .B2(
        \byte_controller/bit_controller/cnt [3]), .C1(
        \byte_controller/bit_controller/N31 ), .C2(
        \byte_controller/bit_controller/n70 ), .ZN(
        \byte_controller/bit_controller/n194 ) );
  INV_X1 \byte_controller/bit_controller/U150  ( .A(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  AOI222_X1 \byte_controller/bit_controller/U149  ( .A1(
        \byte_controller/bit_controller/N33 ), .A2(
        \byte_controller/bit_controller/n71 ), .B1(
        \byte_controller/bit_controller/n65 ), .B2(prer[5]), .C1(
        \byte_controller/bit_controller/n62 ), .C2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/n193 ) );
  INV_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n224 ) );
  AOI222_X1 \byte_controller/bit_controller/U147  ( .A1(prer[7]), .A2(
        \byte_controller/bit_controller/n31 ), .B1(
        \byte_controller/bit_controller/n29 ), .B2(
        \byte_controller/bit_controller/cnt [7]), .C1(
        \byte_controller/bit_controller/N35 ), .C2(
        \byte_controller/bit_controller/n70 ), .ZN(
        \byte_controller/bit_controller/n192 ) );
  OAI21_X1 \byte_controller/bit_controller/U146  ( .B1(
        \byte_controller/bit_controller/n9 ), .B2(
        \byte_controller/bit_controller/n95 ), .A(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n218 ) );
  AOI22_X1 \byte_controller/bit_controller/U145  ( .A1(
        \byte_controller/bit_controller/N36 ), .A2(
        \byte_controller/bit_controller/n2 ), .B1(prer[8]), .B2(
        \byte_controller/bit_controller/n31 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  INV_X1 \byte_controller/bit_controller/U144  ( .A(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  AOI222_X1 \byte_controller/bit_controller/U143  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n1 ), .B1(prer[9]), .B2(
        \byte_controller/bit_controller/n31 ), .C1(
        \byte_controller/bit_controller/n62 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n189 ) );
  INV_X1 \byte_controller/bit_controller/U142  ( .A(
        \byte_controller/bit_controller/n188 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AOI222_X1 \byte_controller/bit_controller/U141  ( .A1(
        \byte_controller/bit_controller/N38 ), .A2(
        \byte_controller/bit_controller/n2 ), .B1(prer[10]), .B2(
        \byte_controller/bit_controller/n65 ), .C1(
        \byte_controller/bit_controller/n62 ), .C2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/n188 ) );
  INV_X1 \byte_controller/bit_controller/U140  ( .A(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  AOI222_X1 \byte_controller/bit_controller/U139  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n1 ), .B1(prer[11]), .B2(
        \byte_controller/bit_controller/n59 ), .C1(
        \byte_controller/bit_controller/n198 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n187 ) );
  INV_X1 \byte_controller/bit_controller/U138  ( .A(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/n128 ) );
  AOI222_X1 \byte_controller/bit_controller/U137  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n2 ), .B1(
        \byte_controller/bit_controller/n31 ), .B2(prer[12]), .C1(
        \byte_controller/bit_controller/n198 ), .C2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/n186 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n185 ), .ZN(
        \byte_controller/bit_controller/n223 ) );
  AOI222_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n3 ), .B1(
        \byte_controller/bit_controller/n29 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(prer[13]), .C2(
        \byte_controller/bit_controller/n59 ), .ZN(
        \byte_controller/bit_controller/n185 ) );
  INV_X1 \byte_controller/bit_controller/U134  ( .A(
        \byte_controller/bit_controller/n184 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  AOI222_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n3 ), .B1(
        \byte_controller/bit_controller/n29 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n59 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  OAI211_X1 \byte_controller/bit_controller/U132  ( .C1(
        \byte_controller/bit_controller/n10 ), .C2(
        \byte_controller/bit_controller/n182 ), .A(
        \byte_controller/bit_controller/n181 ), .B(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  NAND2_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n181 ), .ZN(
        \byte_controller/bit_controller/n191 ) );
  INV_X1 \byte_controller/bit_controller/U130  ( .A(
        \byte_controller/bit_controller/n63 ), .ZN(
        \byte_controller/bit_controller/n201 ) );
  NAND2_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/N68 ) );
  AOI21_X1 \byte_controller/bit_controller/U128  ( .B1(
        \byte_controller/bit_controller/n169 ), .B2(
        \byte_controller/bit_controller/n214 ), .A(
        \byte_controller/bit_controller/n213 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  INV_X1 \byte_controller/bit_controller/U127  ( .A(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  NAND3_X1 \byte_controller/bit_controller/U126  ( .A1(
        \byte_controller/bit_controller/n214 ), .A2(
        \byte_controller/bit_controller/n68 ), .A3(
        \byte_controller/bit_controller/n122 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  NAND4_X1 \byte_controller/bit_controller/U125  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n164 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  INV_X1 \byte_controller/bit_controller/U124  ( .A(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  NAND3_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n123 ), .A3(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  OAI22_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/n14 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n7 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n14 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI21_X1 \byte_controller/bit_controller/U120  ( .B1(
        \byte_controller/bit_controller/n115 ), .B2(
        \byte_controller/bit_controller/n11 ), .A(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  NAND4_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n54 ), .A2(
        \byte_controller/core_cmd [3]), .A3(
        \byte_controller/bit_controller/n32 ), .A4(
        \byte_controller/bit_controller/n162 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  NOR3_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n162 ) );
  OAI22_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n122 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n18 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U115  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n18 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n16 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI22_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n16 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U112  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n118 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n202 ), .A2(
        \byte_controller/bit_controller/n161 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n86 ) );
  NAND3_X1 \byte_controller/bit_controller/U110  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(
        \byte_controller/bit_controller/n160 ), .A3(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  OAI33_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n140 ), .A2(
        \byte_controller/bit_controller/n139 ), .A3(
        \byte_controller/bit_controller/n138 ), .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/N69 ), .B3(
        \byte_controller/bit_controller/n137 ), .ZN(
        \byte_controller/bit_controller/N83 ) );
  NOR4_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n134 ), .A2(
        \byte_controller/bit_controller/n165 ), .A3(
        \byte_controller/bit_controller/n133 ), .A4(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  NAND4_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n113 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n114 ), .ZN(
        \byte_controller/bit_controller/n134 ) );
  OAI21_X1 \byte_controller/bit_controller/U106  ( .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/n11 ), .A(
        \byte_controller/bit_controller/n129 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  OAI21_X1 \byte_controller/bit_controller/U105  ( .B1(
        \byte_controller/bit_controller/n166 ), .B2(
        \byte_controller/bit_controller/n56 ), .A(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n129 ) );
  OAI22_X1 \byte_controller/bit_controller/U104  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n205 ), .B1(
        \byte_controller/bit_controller/n110 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  INV_X1 \byte_controller/bit_controller/U102  ( .A(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n214 ) );
  NAND2_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n79 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n217 ) );
  NOR2_X1 \byte_controller/bit_controller/U100  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n127 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  MUX2_X1 \byte_controller/bit_controller/U99  ( .A(
        \byte_controller/bit_controller/n126 ), .B(
        \byte_controller/bit_controller/n82 ), .S(
        \byte_controller/bit_controller/n87 ), .Z(
        \byte_controller/bit_controller/n127 ) );
  NAND2_X1 \byte_controller/bit_controller/U98  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n160 ), .ZN(
        \byte_controller/bit_controller/n126 ) );
  INV_X1 \byte_controller/bit_controller/U97  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n160 ) );
  INV_X1 \byte_controller/bit_controller/U96  ( .A(
        \byte_controller/bit_controller/n161 ), .ZN(
        \byte_controller/bit_controller/n125 ) );
  NAND3_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n203 ), .A3(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  INV_X1 \byte_controller/bit_controller/U94  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n207 ) );
  INV_X1 \byte_controller/bit_controller/U93  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n203 ) );
  NOR4_X1 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n105 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  OR2_X1 \byte_controller/bit_controller/U91  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N66 ) );
  NAND2_X1 \byte_controller/bit_controller/U90  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  INV_X1 \byte_controller/bit_controller/U89  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n200 ) );
  OR2_X1 \byte_controller/bit_controller/U88  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U87  ( .A1(
        \byte_controller/bit_controller/n208 ), .A2(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OR2_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  AND2_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n2 ), .A2(
        \byte_controller/bit_controller/N34 ), .ZN(
        \byte_controller/bit_controller/n77 ) );
  AND2_X1 \byte_controller/bit_controller/U84  ( .A1(
        \byte_controller/bit_controller/n198 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n76 ) );
  AND2_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n59 ), .A2(prer[6]), .ZN(
        \byte_controller/bit_controller/n75 ) );
  AND2_X1 \byte_controller/bit_controller/U82  ( .A1(
        \byte_controller/bit_controller/n2 ), .A2(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/n74 ) );
  AND2_X1 \byte_controller/bit_controller/U81  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  AND2_X1 \byte_controller/bit_controller/U80  ( .A1(prer[4]), .A2(
        \byte_controller/bit_controller/n65 ), .ZN(
        \byte_controller/bit_controller/n72 ) );
  AND2_X1 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n136 ), .A2(
        \byte_controller/bit_controller/n30 ), .ZN(
        \byte_controller/bit_controller/n69 ) );
  INV_X1 \byte_controller/bit_controller/U78  ( .A(
        \byte_controller/bit_controller/n67 ), .ZN(
        \byte_controller/bit_controller/n68 ) );
  AND3_X1 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n8 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  INV_X1 \byte_controller/bit_controller/U76  ( .A(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n65 ) );
  NAND4_X1 \byte_controller/bit_controller/U75  ( .A1(
        \byte_controller/bit_controller/n25 ), .A2(
        \byte_controller/bit_controller/n175 ), .A3(
        \byte_controller/bit_controller/n176 ), .A4(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n179 ) );
  OAI21_X1 \byte_controller/bit_controller/U74  ( .B1(
        \byte_controller/bit_controller/n179 ), .B2(
        \byte_controller/bit_controller/n180 ), .A(ctr[7]), .ZN(
        \byte_controller/bit_controller/n181 ) );
  OAI21_X1 \byte_controller/bit_controller/U73  ( .B1(
        \byte_controller/bit_controller/n60 ), .B2(
        \byte_controller/bit_controller/n58 ), .A(ctr[7]), .ZN(
        \byte_controller/bit_controller/n63 ) );
  INV_X1 \byte_controller/bit_controller/U72  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  NAND4_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n24 ), .A2(
        \byte_controller/bit_controller/n173 ), .A3(
        \byte_controller/bit_controller/n23 ), .A4(
        \byte_controller/bit_controller/n26 ), .ZN(
        \byte_controller/bit_controller/n180 ) );
  NAND4_X1 \byte_controller/bit_controller/U70  ( .A1(
        \byte_controller/bit_controller/n178 ), .A2(
        \byte_controller/bit_controller/n177 ), .A3(
        \byte_controller/bit_controller/n176 ), .A4(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n60 ) );
  NAND2_X2 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n214 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  INV_X1 \byte_controller/bit_controller/U68  ( .A(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n59 ) );
  AND2_X1 \byte_controller/bit_controller/U67  ( .A1(
        \byte_controller/bit_controller/n97 ), .A2(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  AND2_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n99 ), .A2(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/n176 ) );
  NAND4_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n173 ), .A3(
        \byte_controller/bit_controller/n172 ), .A4(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n58 ) );
  AND2_X1 \byte_controller/bit_controller/U64  ( .A1(
        \byte_controller/bit_controller/n88 ), .A2(
        \byte_controller/bit_controller/n103 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  AND2_X1 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n101 ), .A2(
        \byte_controller/bit_controller/n102 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  AND2_X1 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U61  ( .A(
        \byte_controller/bit_controller/n201 ), .Z(
        \byte_controller/bit_controller/n55 ) );
  AND2_X1 \byte_controller/bit_controller/U60  ( .A1(
        \byte_controller/bit_controller/n93 ), .A2(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  AND2_X1 \byte_controller/bit_controller/U59  ( .A1(
        \byte_controller/bit_controller/n69 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n54 ) );
  AND2_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  BUF_X1 \byte_controller/bit_controller/U57  ( .A(
        \byte_controller/bit_controller/n52 ), .Z(
        \byte_controller/bit_controller/n51 ) );
  NAND2_X1 \byte_controller/bit_controller/U56  ( .A1(
        \byte_controller/bit_controller/n83 ), .A2(
        \byte_controller/bit_controller/n10 ), .ZN(
        \byte_controller/bit_controller/n46 ) );
  MUX2_X1 \byte_controller/bit_controller/U55  ( .A(
        \byte_controller/bit_controller/n45 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n46 ), .Z(
        \byte_controller/bit_controller/n44 ) );
  NOR2_X1 \byte_controller/bit_controller/U54  ( .A1(
        \byte_controller/bit_controller/n182 ), .A2(
        \byte_controller/bit_controller/N68 ), .ZN(
        \byte_controller/bit_controller/n43 ) );
  AND2_X1 \byte_controller/bit_controller/U53  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  OR4_X1 \byte_controller/bit_controller/U52  ( .A1(
        \byte_controller/bit_controller/n168 ), .A2(
        \byte_controller/bit_controller/n167 ), .A3(
        \byte_controller/bit_controller/n166 ), .A4(
        \byte_controller/bit_controller/n165 ), .ZN(
        \byte_controller/bit_controller/n41 ) );
  MUX2_X1 \byte_controller/bit_controller/U51  ( .A(scl_padoen_o), .B(
        \byte_controller/bit_controller/n41 ), .S(
        \byte_controller/bit_controller/n170 ), .Z(
        \byte_controller/bit_controller/n40 ) );
  OR2_X1 \byte_controller/bit_controller/U50  ( .A1(
        \byte_controller/bit_controller/n69 ), .A2(
        \byte_controller/bit_controller/n39 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  BUF_X1 \byte_controller/bit_controller/U49  ( .A(\byte_controller/n32 ), .Z(
        \byte_controller/bit_controller/n47 ) );
  OR3_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n72 ), .A2(
        \byte_controller/bit_controller/n74 ), .A3(
        \byte_controller/bit_controller/n73 ), .ZN(
        \byte_controller/bit_controller/n38 ) );
  BUF_X1 \byte_controller/bit_controller/U47  ( .A(
        \byte_controller/bit_controller/n47 ), .Z(
        \byte_controller/bit_controller/n53 ) );
  BUF_X1 \byte_controller/bit_controller/U46  ( .A(
        \byte_controller/bit_controller/n53 ), .Z(
        \byte_controller/bit_controller/n48 ) );
  BUF_X1 \byte_controller/bit_controller/U45  ( .A(
        \byte_controller/bit_controller/n47 ), .Z(
        \byte_controller/bit_controller/n52 ) );
  BUF_X1 \byte_controller/bit_controller/U44  ( .A(
        \byte_controller/bit_controller/n52 ), .Z(
        \byte_controller/bit_controller/n49 ) );
  BUF_X1 \byte_controller/bit_controller/U43  ( .A(
        \byte_controller/bit_controller/n52 ), .Z(
        \byte_controller/bit_controller/n50 ) );
  NOR2_X1 \byte_controller/bit_controller/U42  ( .A1(
        \byte_controller/bit_controller/n56 ), .A2(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  AND2_X1 \byte_controller/bit_controller/U41  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n135 ), .ZN(
        \byte_controller/bit_controller/n36 ) );
  AND2_X1 \byte_controller/bit_controller/U40  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n61 ) );
  INV_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n34 ), .ZN(
        \byte_controller/bit_controller/n35 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U38  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/n33 ) );
  AND2_X1 \byte_controller/bit_controller/U37  ( .A1(
        \byte_controller/bit_controller/n214 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  INV_X1 \byte_controller/bit_controller/U36  ( .A(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  INV_X1 \byte_controller/bit_controller/U35  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n62 ) );
  NOR4_X1 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n20 ), .A2(
        \byte_controller/bit_controller/n165 ), .A3(
        \byte_controller/bit_controller/n133 ), .A4(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n30 ) );
  INV_X1 \byte_controller/bit_controller/U33  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n29 ) );
  AND3_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n115 ), .A3(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  AND3_X1 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n78 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  AND3_X1 \byte_controller/bit_controller/U30  ( .A1(
        \byte_controller/bit_controller/n27 ), .A2(
        \byte_controller/bit_controller/n28 ), .A3(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  AND2_X1 \byte_controller/bit_controller/U29  ( .A1(
        \byte_controller/bit_controller/n90 ), .A2(
        \byte_controller/bit_controller/n89 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  AND2_X1 \byte_controller/bit_controller/U28  ( .A1(
        \byte_controller/bit_controller/n101 ), .A2(
        \byte_controller/bit_controller/n102 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  AND2_X1 \byte_controller/bit_controller/U27  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n24 ) );
  AND2_X1 \byte_controller/bit_controller/U26  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  OR3_X2 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(
        \byte_controller/bit_controller/n77 ), .A3(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n42 ) );
  AND3_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n61 ), .A2(
        \byte_controller/bit_controller/n160 ), .A3(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n64 ) );
  AND3_X1 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n61 ), .A2(
        \byte_controller/bit_controller/n160 ), .A3(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n21 ) );
  NAND4_X1 \byte_controller/bit_controller/U22  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n113 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n20 ) );
  AND3_X1 \byte_controller/bit_controller/U21  ( .A1(
        \byte_controller/bit_controller/n27 ), .A2(
        \byte_controller/bit_controller/n28 ), .A3(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n19 ) );
  INV_X1 \byte_controller/bit_controller/U20  ( .A(
        \byte_controller/bit_controller/n17 ), .ZN(
        \byte_controller/bit_controller/n18 ) );
  INV_X1 \byte_controller/bit_controller/U19  ( .A(
        \byte_controller/bit_controller/n15 ), .ZN(
        \byte_controller/bit_controller/n16 ) );
  INV_X1 \byte_controller/bit_controller/U18  ( .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  AND2_X1 \byte_controller/bit_controller/U17  ( .A1(
        \byte_controller/bit_controller/n5 ), .A2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  OR2_X1 \byte_controller/bit_controller/U16  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n140 ) );
  OR2_X2 \byte_controller/bit_controller/U15  ( .A1(
        \byte_controller/bit_controller/n85 ), .A2(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  BUF_X2 \byte_controller/bit_controller/U14  ( .A(
        \byte_controller/bit_controller/n209 ), .Z(
        \byte_controller/bit_controller/n11 ) );
  AND2_X1 \byte_controller/bit_controller/U13  ( .A1(
        \byte_controller/bit_controller/n57 ), .A2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n78 ) );
  INV_X1 \byte_controller/bit_controller/U12  ( .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  AND2_X1 \byte_controller/bit_controller/U11  ( .A1(
        \byte_controller/bit_controller/n116 ), .A2(
        \byte_controller/bit_controller/n57 ), .ZN(
        \byte_controller/bit_controller/n8 ) );
  INV_X1 \byte_controller/bit_controller/U10  ( .A(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n7 ) );
  AND2_X1 \byte_controller/bit_controller/U9  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n30 ), .ZN(
        \byte_controller/bit_controller/n5 ) );
  OAI211_X1 \byte_controller/bit_controller/U8  ( .C1(
        \byte_controller/bit_controller/n10 ), .C2(
        \byte_controller/bit_controller/n182 ), .A(
        \byte_controller/bit_controller/n181 ), .B(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n4 ) );
  AND2_X1 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n201 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  AND2_X1 \byte_controller/bit_controller/U6  ( .A1(
        \byte_controller/bit_controller/n201 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n2 ) );
  AND2_X1 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n201 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n70 ) );
  AND2_X1 \byte_controller/bit_controller/U4  ( .A1(
        \byte_controller/bit_controller/n201 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n71 ) );
  AND2_X1 \byte_controller/bit_controller/U3  ( .A1(
        \byte_controller/bit_controller/n201 ), .A2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n1 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/n6 ), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/n39 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/n15 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n17 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/n13 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n22 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/n133 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n86 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n139 ), .QN(
        \byte_controller/bit_controller/n82 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n229 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n85 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n81 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n112 ), .QN(
        \byte_controller/bit_controller/n104 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n50 ), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n138 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n226 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n38 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n99 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/n32 ), .Q(\byte_controller/bit_controller/n132 ), 
        .QN(\byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/n166 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/n34 ), .QN(
        \byte_controller/bit_controller/n57 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n227 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [1]), .QN(
        \byte_controller/bit_controller/n102 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n228 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [0]), .QN(
        \byte_controller/bit_controller/n103 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n218 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n95 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n221 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n98 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n220 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n219 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n88 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n223 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n90 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n131 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n94 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n130 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n93 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n222 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n92 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n128 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n91 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n225 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n100 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n224 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n96 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n42 ), .CK(wb_clk_i), .RN(
        \byte_controller/n32 ), .Q(\byte_controller/bit_controller/cnt [6]), 
        .QN(\byte_controller/bit_controller/n97 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n165 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n48 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n67 ), .QN(
        \byte_controller/bit_controller/n116 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n49 ), .Q(
        \byte_controller/bit_controller/n56 ), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N83 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n79 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n51 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n137 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n182 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n40 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n51 ), .Q(scl_padoen_o) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n44 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n50 ), .QN(
        \byte_controller/bit_controller/n80 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N66 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n10 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n50 ), .Q(
        \byte_controller/bit_controller/n45 ), .QN(
        \byte_controller/bit_controller/n105 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U146  ( .A1(
        \byte_controller/bit_controller/sub_105/n129 ), .A2(
        \byte_controller/bit_controller/sub_105/n48 ), .ZN(
        \byte_controller/bit_controller/sub_105/n127 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U145  ( .A1(
        \byte_controller/bit_controller/sub_105/n126 ), .A2(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U144  ( .A(
        \byte_controller/bit_controller/sub_105/n16 ), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U143  ( .A1(
        \byte_controller/bit_controller/sub_105/n120 ), .A2(
        \byte_controller/bit_controller/sub_105/n121 ), .A3(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U142  ( .A1(
        \byte_controller/bit_controller/sub_105/n116 ), .A2(
        \byte_controller/bit_controller/sub_105/n117 ), .A3(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U141  ( .A1(
        \byte_controller/bit_controller/sub_105/n114 ), .A2(
        \byte_controller/bit_controller/sub_105/n115 ), .A3(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U140  ( .A1(
        \byte_controller/bit_controller/sub_105/n106 ), .A2(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U139  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n11 ), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U138  ( .A1(
        \byte_controller/bit_controller/sub_105/n101 ), .A2(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n100 ), .A2(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U136  ( .B1(
        \byte_controller/bit_controller/sub_105/n3 ), .B2(
        \byte_controller/bit_controller/sub_105/n95 ), .A(
        \byte_controller/bit_controller/sub_105/n94 ), .ZN(
        \byte_controller/bit_controller/N39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U135  ( .A1(
        \byte_controller/bit_controller/sub_105/n93 ), .A2(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U134  ( .A1(
        \byte_controller/bit_controller/sub_105/n92 ), .A2(
        \byte_controller/bit_controller/sub_105/n130 ), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n88 ), .A2(
        \byte_controller/bit_controller/sub_105/n89 ), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n87 ), .A2(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U131  ( .B1(
        \byte_controller/bit_controller/sub_105/n2 ), .B2(
        \byte_controller/bit_controller/sub_105/n82 ), .A(
        \byte_controller/bit_controller/sub_105/n81 ), .ZN(
        \byte_controller/bit_controller/N40 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U130  ( .A(
        \byte_controller/bit_controller/sub_105/n81 ), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n79 ), .A2(
        \byte_controller/bit_controller/sub_105/n80 ), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n78 ), .A2(
        \byte_controller/bit_controller/sub_105/n130 ), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A1(
        \byte_controller/bit_controller/sub_105/n74 ), .A2(
        \byte_controller/bit_controller/sub_105/n75 ), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U126  ( .A1(
        \byte_controller/bit_controller/sub_105/n73 ), .A2(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U125  ( .B1(
        \byte_controller/bit_controller/sub_105/n67 ), .B2(
        \byte_controller/bit_controller/sub_105/n68 ), .A(
        \byte_controller/bit_controller/sub_105/n66 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n64 ), .A2(
        \byte_controller/bit_controller/sub_105/n65 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U123  ( .A1(
        \byte_controller/bit_controller/sub_105/n63 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U122  ( .A1(
        \byte_controller/bit_controller/sub_105/n56 ), .A2(
        \byte_controller/bit_controller/sub_105/n57 ), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U121  ( .A(
        \byte_controller/bit_controller/sub_105/n55 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U120  ( .A1(
        \byte_controller/bit_controller/sub_105/n5 ), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U119  ( .A1(
        \byte_controller/bit_controller/sub_105/n129 ), .A2(
        \byte_controller/bit_controller/sub_105/n48 ), .A3(
        \byte_controller/bit_controller/sub_105/n36 ), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U118  ( .A(
        \byte_controller/bit_controller/sub_105/n45 ), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U117  ( .B1(
        \byte_controller/bit_controller/sub_105/n41 ), .B2(
        \byte_controller/bit_controller/sub_105/n25 ), .A(
        \byte_controller/bit_controller/sub_105/n40 ), .ZN(
        \byte_controller/bit_controller/N33 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U116  ( .A1(
        \byte_controller/bit_controller/sub_105/n34 ), .A2(
        \byte_controller/bit_controller/sub_105/n35 ), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U115  ( .A1(
        \byte_controller/bit_controller/sub_105/n33 ), .A2(
        \byte_controller/bit_controller/sub_105/n11 ), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U114  ( .A1(
        \byte_controller/bit_controller/sub_105/n19 ), .A2(
        \byte_controller/bit_controller/sub_105/n30 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U113  ( .A1(
        \byte_controller/bit_controller/sub_105/n26 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n22 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U112  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/sub_105/n19 ), .ZN(
        \byte_controller/bit_controller/sub_105/n18 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U111  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n18 ), .ZN(
        \byte_controller/bit_controller/N36 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U110  ( .A(
        \byte_controller/bit_controller/sub_105/n17 ), .ZN(
        \byte_controller/bit_controller/sub_105/n15 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A(
        \byte_controller/bit_controller/sub_105/n40 ), .B(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/sub_105/n45 ), .A2(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U107  ( .B1(
        \byte_controller/bit_controller/sub_105/n15 ), .B2(
        \byte_controller/bit_controller/sub_105/n117 ), .A(
        \byte_controller/bit_controller/sub_105/n16 ), .ZN(
        \byte_controller/bit_controller/N37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A1(
        \byte_controller/bit_controller/sub_105/n13 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U104  ( .A1(
        \byte_controller/bit_controller/sub_105/n13 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U103  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U102  ( .A1(
        \byte_controller/bit_controller/sub_105/n8 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U101  ( .A1(
        \byte_controller/bit_controller/sub_105/n1 ), .A2(
        \byte_controller/bit_controller/sub_105/n4 ), .A3(
        \byte_controller/bit_controller/sub_105/n5 ), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U100  ( .A(
        \byte_controller/bit_controller/sub_105/n52 ), .B(
        \byte_controller/bit_controller/sub_105/n4 ), .ZN(
        \byte_controller/bit_controller/N30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U98  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U97  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U96  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U95  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U94  ( .B1(
        \byte_controller/bit_controller/sub_105/n108 ), .B2(
        \byte_controller/bit_controller/sub_105/n109 ), .A(
        \byte_controller/bit_controller/sub_105/n107 ), .ZN(
        \byte_controller/bit_controller/N38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U93  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n28 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U91  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U90  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U89  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n24 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U88  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U87  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U86  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n129 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U84  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/sub_105/n8 ), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U83  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U82  ( .A1(
        \byte_controller/bit_controller/sub_105/n12 ), .A2(
        \byte_controller/bit_controller/sub_105/n47 ), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U81  ( .A1(
        \byte_controller/bit_controller/sub_105/n42 ), .A2(
        \byte_controller/bit_controller/sub_105/n10 ), .A3(
        \byte_controller/bit_controller/sub_105/n43 ), .A4(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U80  ( .A1(
        \byte_controller/bit_controller/sub_105/n9 ), .A2(
        \byte_controller/bit_controller/sub_105/n130 ), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U79  ( .A1(
        \byte_controller/bit_controller/sub_105/n10 ), .A2(
        \byte_controller/bit_controller/sub_105/n109 ), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/N28 ), .A2(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/sub_105/n128 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U77  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U76  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U75  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U74  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U73  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U71  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U70  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U69  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U68  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U67  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U66  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U65  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U64  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U63  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U62  ( .A(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U61  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n126 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U60  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n130 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U59  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/N28 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U58  ( .A(
        \byte_controller/bit_controller/sub_105/n121 ), .ZN(
        \byte_controller/bit_controller/sub_105/n13 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U57  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U56  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U55  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n12 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U54  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n11 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U53  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n10 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U52  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U51  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U50  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U49  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U48  ( .A(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U47  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U46  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n25 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U45  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n9 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U44  ( .A(
        \byte_controller/bit_controller/cnt [3]), .Z(
        \byte_controller/bit_controller/sub_105/n8 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U43  ( .A(
        \byte_controller/bit_controller/sub_105/n66 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U42  ( .A1(
        \byte_controller/bit_controller/sub_105/n25 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n125 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U41  ( .A1(
        \byte_controller/bit_controller/sub_105/n24 ), .A2(
        \byte_controller/bit_controller/sub_105/n25 ), .ZN(
        \byte_controller/bit_controller/sub_105/n23 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U40  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U39  ( .A1(
        \byte_controller/bit_controller/sub_105/n61 ), .A2(
        \byte_controller/bit_controller/sub_105/n62 ), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U38  ( .A1(
        \byte_controller/bit_controller/sub_105/n50 ), .A2(
        \byte_controller/bit_controller/sub_105/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U37  ( .A1(
        \byte_controller/bit_controller/sub_105/n36 ), .A2(
        \byte_controller/bit_controller/sub_105/n37 ), .A3(
        \byte_controller/bit_controller/sub_105/n38 ), .A4(
        \byte_controller/bit_controller/sub_105/n39 ), .ZN(
        \byte_controller/bit_controller/sub_105/n19 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U36  ( .A1(
        \byte_controller/bit_controller/sub_105/n22 ), .A2(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/sub_105/n21 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U35  ( .A1(
        \byte_controller/bit_controller/sub_105/n28 ), .A2(
        \byte_controller/bit_controller/sub_105/n29 ), .ZN(
        \byte_controller/bit_controller/sub_105/n20 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U34  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/sub_105/n21 ), .ZN(
        \byte_controller/bit_controller/sub_105/n17 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U33  ( .B1(
        \byte_controller/bit_controller/sub_105/n31 ), .B2(
        \byte_controller/bit_controller/sub_105/n32 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U32  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/N29 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U31  ( .B1(
        \byte_controller/bit_controller/sub_105/n49 ), .B2(
        \byte_controller/bit_controller/sub_105/n44 ), .A(
        \byte_controller/bit_controller/sub_105/n47 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U30  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U29  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U28  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U27  ( .A(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U26  ( .A(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U25  ( .A(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U24  ( .A1(
        \byte_controller/bit_controller/sub_105/n90 ), .A2(
        \byte_controller/bit_controller/sub_105/n91 ), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U23  ( .A1(
        \byte_controller/bit_controller/sub_105/n85 ), .A2(
        \byte_controller/bit_controller/sub_105/n86 ), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U22  ( .A1(
        \byte_controller/bit_controller/sub_105/n83 ), .A2(
        \byte_controller/bit_controller/sub_105/n84 ), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U21  ( .A1(
        \byte_controller/bit_controller/sub_105/n76 ), .A2(
        \byte_controller/bit_controller/sub_105/n77 ), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U20  ( .A1(
        \byte_controller/bit_controller/sub_105/n71 ), .A2(
        \byte_controller/bit_controller/sub_105/n72 ), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U19  ( .A1(
        \byte_controller/bit_controller/sub_105/n70 ), .A2(
        \byte_controller/bit_controller/sub_105/n69 ), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U18  ( .A1(
        \byte_controller/bit_controller/sub_105/n127 ), .A2(
        \byte_controller/bit_controller/sub_105/n128 ), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U17  ( .A1(
        \byte_controller/bit_controller/sub_105/n124 ), .A2(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U16  ( .A1(
        \byte_controller/bit_controller/sub_105/n122 ), .A2(
        \byte_controller/bit_controller/sub_105/n123 ), .ZN(
        \byte_controller/bit_controller/sub_105/n16 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U15  ( .A1(
        \byte_controller/bit_controller/sub_105/n118 ), .A2(
        \byte_controller/bit_controller/sub_105/n119 ), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U14  ( .A1(
        \byte_controller/bit_controller/sub_105/n113 ), .A2(
        \byte_controller/bit_controller/sub_105/n112 ), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U13  ( .A1(
        \byte_controller/bit_controller/sub_105/n110 ), .A2(
        \byte_controller/bit_controller/sub_105/n111 ), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U12  ( .A1(
        \byte_controller/bit_controller/sub_105/n103 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U11  ( .A1(
        \byte_controller/bit_controller/sub_105/n98 ), .A2(
        \byte_controller/bit_controller/sub_105/n99 ), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U10  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/sub_105/n97 ), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U9  ( .A1(
        \byte_controller/bit_controller/sub_105/n106 ), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n7 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U8  ( .A1(
        \byte_controller/bit_controller/sub_105/n59 ), .A2(
        \byte_controller/bit_controller/sub_105/n60 ), .ZN(
        \byte_controller/bit_controller/sub_105/n6 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U7  ( .A1(
        \byte_controller/bit_controller/sub_105/n6 ), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U6  ( .A(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n5 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U5  ( .A(
        \byte_controller/bit_controller/sub_105/n120 ), .ZN(
        \byte_controller/bit_controller/sub_105/n4 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U4  ( .A1(
        \byte_controller/bit_controller/sub_105/n110 ), .A2(
        \byte_controller/bit_controller/sub_105/n111 ), .ZN(
        \byte_controller/bit_controller/sub_105/n3 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U3  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/sub_105/n97 ), .ZN(
        \byte_controller/bit_controller/sub_105/n2 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n1 ) );
endmodule

