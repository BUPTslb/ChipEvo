/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 05:19:27 2026
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
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         \byte_controller/n167 , \byte_controller/n166 ,
         \byte_controller/n165 , \byte_controller/n164 ,
         \byte_controller/n163 , \byte_controller/n162 ,
         \byte_controller/n161 , \byte_controller/n160 ,
         \byte_controller/n159 , \byte_controller/n158 ,
         \byte_controller/n157 , \byte_controller/n156 ,
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
         \byte_controller/n106 , \byte_controller/n105 ,
         \byte_controller/n104 , \byte_controller/n103 ,
         \byte_controller/n102 , \byte_controller/n101 ,
         \byte_controller/n100 , \byte_controller/n99 , \byte_controller/n98 ,
         \byte_controller/n97 , \byte_controller/n96 , \byte_controller/n95 ,
         \byte_controller/n94 , \byte_controller/n93 , \byte_controller/n92 ,
         \byte_controller/n91 , \byte_controller/n90 , \byte_controller/n89 ,
         \byte_controller/n88 , \byte_controller/n87 , \byte_controller/n86 ,
         \byte_controller/n85 , \byte_controller/n84 , \byte_controller/n83 ,
         \byte_controller/n82 , \byte_controller/n81 , \byte_controller/n80 ,
         \byte_controller/n79 , \byte_controller/n78 , \byte_controller/n77 ,
         \byte_controller/n76 , \byte_controller/n75 , \byte_controller/n74 ,
         \byte_controller/n73 , \byte_controller/n72 , \byte_controller/n71 ,
         \byte_controller/n70 , \byte_controller/n69 , \byte_controller/n68 ,
         \byte_controller/n67 , \byte_controller/n66 , \byte_controller/n65 ,
         \byte_controller/n64 , \byte_controller/n63 , \byte_controller/n62 ,
         \byte_controller/n61 , \byte_controller/n60 , \byte_controller/n59 ,
         \byte_controller/n58 , \byte_controller/n57 , \byte_controller/n56 ,
         \byte_controller/n55 , \byte_controller/n54 , \byte_controller/n53 ,
         \byte_controller/n52 , \byte_controller/n51 , \byte_controller/n50 ,
         \byte_controller/n49 , \byte_controller/n48 , \byte_controller/n47 ,
         \byte_controller/n46 , \byte_controller/n45 , \byte_controller/n44 ,
         \byte_controller/n43 , \byte_controller/n42 , \byte_controller/n41 ,
         \byte_controller/n40 , \byte_controller/n39 , \byte_controller/n38 ,
         \byte_controller/n37 , \byte_controller/n36 , \byte_controller/n34 ,
         \byte_controller/n33 , \byte_controller/n31 , \byte_controller/n30 ,
         \byte_controller/n29 , \byte_controller/n28 , \byte_controller/n27 ,
         \byte_controller/n26 , \byte_controller/n24 , \byte_controller/n23 ,
         \byte_controller/n22 , \byte_controller/n20 , \byte_controller/n17 ,
         \byte_controller/n16 , \byte_controller/n15 , \byte_controller/n14 ,
         \byte_controller/n13 , \byte_controller/n12 , \byte_controller/n11 ,
         \byte_controller/n10 , \byte_controller/n9 , \byte_controller/n8 ,
         \byte_controller/n6 , \byte_controller/n5 , \byte_controller/n4 ,
         \byte_controller/n3 , \byte_controller/n2 , \byte_controller/n1 ,
         \byte_controller/n121 , \byte_controller/n120 ,
         \byte_controller/n119 , \byte_controller/n118 ,
         \byte_controller/n117 , \byte_controller/n116 ,
         \byte_controller/n115 , \byte_controller/n114 ,
         \byte_controller/n113 , \byte_controller/n112 ,
         \byte_controller/n111 , \byte_controller/n110 ,
         \byte_controller/n109 , \byte_controller/n108 ,
         \byte_controller/n107 , \byte_controller/n35 , \byte_controller/n32 ,
         \byte_controller/n25 , \byte_controller/n21 , \byte_controller/n19 ,
         \byte_controller/n18 , \byte_controller/n7 , \byte_controller/N208 ,
         \byte_controller/N207 , \byte_controller/N205 ,
         \byte_controller/N204 , \byte_controller/N203 ,
         \byte_controller/N202 , \byte_controller/N201 , \byte_controller/ld ,
         \byte_controller/core_rxd , \byte_controller/core_txd ,
         \byte_controller/core_ack , \byte_controller/bit_controller/n237 ,
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
         \byte_controller/bit_controller/n103 ,
         \byte_controller/bit_controller/n100 ,
         \byte_controller/bit_controller/n98 ,
         \byte_controller/bit_controller/n97 ,
         \byte_controller/bit_controller/n90 ,
         \byte_controller/bit_controller/n89 ,
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
         \byte_controller/bit_controller/n112 ,
         \byte_controller/bit_controller/n111 ,
         \byte_controller/bit_controller/n110 ,
         \byte_controller/bit_controller/n109 ,
         \byte_controller/bit_controller/n108 ,
         \byte_controller/bit_controller/n107 ,
         \byte_controller/bit_controller/n106 ,
         \byte_controller/bit_controller/n105 ,
         \byte_controller/bit_controller/n104 ,
         \byte_controller/bit_controller/n102 ,
         \byte_controller/bit_controller/n101 ,
         \byte_controller/bit_controller/n99 ,
         \byte_controller/bit_controller/n96 ,
         \byte_controller/bit_controller/n95 ,
         \byte_controller/bit_controller/n94 ,
         \byte_controller/bit_controller/n93 ,
         \byte_controller/bit_controller/n92 ,
         \byte_controller/bit_controller/n91 ,
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
         \byte_controller/bit_controller/sub_105/n14 ,
         \byte_controller/bit_controller/sub_105/n13 ,
         \byte_controller/bit_controller/sub_105/n12 ,
         \byte_controller/bit_controller/sub_105/n11 ,
         \byte_controller/bit_controller/sub_105/n10 ,
         \byte_controller/bit_controller/sub_105/n9 ,
         \byte_controller/bit_controller/sub_105/n8 ,
         \byte_controller/bit_controller/sub_105/n7 ,
         \byte_controller/bit_controller/sub_105/n6 ,
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
  wire   [2:0] \byte_controller/dcnt ;
  wire   [3:0] \byte_controller/core_cmd ;
  wire   [15:0] \byte_controller/bit_controller/cnt ;
  assign scl_pad_o = 1'b0;
  assign sda_pad_o = 1'b0;

  DFF_X1 wb_ack_o_reg ( .D(N26), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \ctr_reg[7]  ( .D(n151), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[2]  ( .D(n146), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n8) );
  DFFR_X1 \ctr_reg[0]  ( .D(n144), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n10) );
  DFFR_X1 \txr_reg[4]  ( .D(n140), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n14) );
  DFFR_X1 \txr_reg[3]  ( .D(n139), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n15) );
  DFFR_X1 \txr_reg[1]  ( .D(n137), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n17) );
  DFFS_X1 \prer_reg[15]  ( .D(n135), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[14]  ( .D(n134), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[12]  ( .D(n262), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n189) );
  DFFS_X1 \prer_reg[11]  ( .D(n261), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n187) );
  DFFS_X1 \prer_reg[9]  ( .D(n132), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n25) );
  DFFS_X1 \prer_reg[7]  ( .D(n130), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n27) );
  DFFS_X1 \prer_reg[6]  ( .D(n129), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n28) );
  DFFS_X1 \prer_reg[5]  ( .D(n128), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n29) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N36), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N34), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N33), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N32), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N35), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N102), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N37), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N103), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N31), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N30), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N108), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 al_reg ( .D(N101), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]), .QN(n244)
         );
  DFFR_X1 \txr_reg[2]  ( .D(n138), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n224) );
  DFFR_X1 \ctr_reg[5]  ( .D(n149), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n5) );
  DFFR_X1 irq_flag_reg ( .D(N104), .CK(wb_clk_i), .RN(arst_i), .Q(sr_0), .QN(
        n43) );
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
  DFFS_X1 \prer_reg[0]  ( .D(n123), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n34) );
  DFFS_X1 \prer_reg[10]  ( .D(n260), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n185) );
  DFFS_X1 \prer_reg[13]  ( .D(n133), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n21) );
  DFFS_X1 \prer_reg[4]  ( .D(n127), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n30) );
  DFFS_X1 \prer_reg[3]  ( .D(n126), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n31) );
  DFFR_X1 \ctr_reg[4]  ( .D(n148), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[3]  ( .D(n147), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n7) );
  DFFR_X1 \txr_reg[7]  ( .D(n143), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n11) );
  DFFR_X1 \txr_reg[6]  ( .D(n142), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n12) );
  DFFR_X1 \txr_reg[0]  ( .D(n136), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n18) );
  DFFR_X1 \cr_reg[1]  ( .D(n116), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]), .QN(
        n41) );
  DFFR_X1 \cr_reg[0]  ( .D(n115), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n207) );
  DFFR_X1 \cr_reg[2]  ( .D(n117), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]), .QN(
        n40) );
  DFFR_X1 \cr_reg[7]  ( .D(n118), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n251) );
  DFFR_X1 \cr_reg[6]  ( .D(n119), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n246) );
  DFFR_X1 \cr_reg[4]  ( .D(n121), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n234) );
  DFFR_X1 \cr_reg[5]  ( .D(n120), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n240) );
  DFFR_X1 \cr_reg[3]  ( .D(n161), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n229) );
  AND2_X1 U129 ( .A1(n168), .A2(n250), .ZN(n196) );
  AND2_X1 U130 ( .A1(n157), .A2(n203), .ZN(n152) );
  AND2_X1 U131 ( .A1(n197), .A2(n231), .ZN(n153) );
  AND2_X1 U132 ( .A1(n182), .A2(n197), .ZN(n154) );
  AND2_X1 U133 ( .A1(n200), .A2(n253), .ZN(n155) );
  AND3_X1 U134 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n156) );
  AND2_X1 U135 ( .A1(n201), .A2(n209), .ZN(n157) );
  INV_X1 U136 ( .A(n3), .ZN(n158) );
  OAI21_X1 U137 ( .B1(n156), .B2(n160), .A(n196), .ZN(n159) );
  OAI21_X1 U138 ( .B1(n156), .B2(n160), .A(n196), .ZN(n169) );
  INV_X1 U139 ( .A(n167), .ZN(n197) );
  NOR2_X1 U140 ( .A1(i2c_al), .A2(done), .ZN(n160) );
  MUX2_X1 U141 ( .A(n162), .B(cr[3]), .S(n196), .Z(n161) );
  AND2_X1 U142 ( .A1(wb_dat_i[3]), .A2(n197), .ZN(n162) );
  INV_X1 U143 ( .A(wb_rst_i), .ZN(n250) );
  INV_X1 U145 ( .A(wb_dat_i[0]), .ZN(n198) );
  NAND2_X1 U146 ( .A1(n156), .A2(n250), .ZN(n167) );
  INV_X1 U147 ( .A(wb_adr_i[2]), .ZN(n171) );
  NAND2_X1 U148 ( .A1(wb_adr_i[0]), .A2(n171), .ZN(n202) );
  INV_X1 U149 ( .A(n202), .ZN(n181) );
  NAND3_X1 U150 ( .A1(wb_adr_i[1]), .A2(n181), .A3(n197), .ZN(n164) );
  NAND2_X1 U151 ( .A1(n164), .A2(n250), .ZN(n165) );
  NAND2_X1 U152 ( .A1(n197), .A2(n165), .ZN(n166) );
  OAI22_X1 U153 ( .A1(n198), .A2(n166), .B1(n18), .B2(n165), .ZN(n136) );
  INV_X1 U154 ( .A(wb_dat_i[1]), .ZN(n213) );
  OAI22_X1 U155 ( .A1(n213), .A2(n166), .B1(n17), .B2(n165), .ZN(n137) );
  INV_X1 U156 ( .A(wb_dat_i[2]), .ZN(n220) );
  OAI22_X1 U157 ( .A1(n220), .A2(n166), .B1(n224), .B2(n165), .ZN(n138) );
  INV_X1 U158 ( .A(wb_dat_i[3]), .ZN(n226) );
  OAI22_X1 U159 ( .A1(n226), .A2(n166), .B1(n15), .B2(n165), .ZN(n139) );
  INV_X1 U160 ( .A(wb_dat_i[4]), .ZN(n230) );
  OAI22_X1 U161 ( .A1(n230), .A2(n166), .B1(n14), .B2(n165), .ZN(n140) );
  INV_X1 U162 ( .A(wb_dat_i[5]), .ZN(n236) );
  OAI22_X1 U163 ( .A1(n236), .A2(n166), .B1(n13), .B2(n165), .ZN(n141) );
  INV_X1 U164 ( .A(wb_dat_i[6]), .ZN(n195) );
  OAI22_X1 U165 ( .A1(n195), .A2(n166), .B1(n12), .B2(n165), .ZN(n142) );
  INV_X1 U166 ( .A(wb_dat_i[7]), .ZN(n193) );
  OAI22_X1 U167 ( .A1(n193), .A2(n166), .B1(n11), .B2(n165), .ZN(n143) );
  INV_X1 U168 ( .A(wb_adr_i[0]), .ZN(n205) );
  NAND3_X1 U169 ( .A1(wb_adr_i[1]), .A2(n205), .A3(n171), .ZN(n209) );
  OAI21_X1 U170 ( .B1(n209), .B2(n167), .A(n250), .ZN(n235) );
  NAND2_X1 U171 ( .A1(n197), .A2(n235), .ZN(n237) );
  OAI22_X1 U172 ( .A1(n237), .A2(n193), .B1(n3), .B2(n235), .ZN(n151) );
  INV_X1 U173 ( .A(wb_adr_i[1]), .ZN(n180) );
  NAND2_X1 U174 ( .A1(wb_adr_i[2]), .A2(n180), .ZN(n204) );
  INV_X1 U175 ( .A(n204), .ZN(n210) );
  NAND2_X1 U176 ( .A1(n210), .A2(n205), .ZN(n245) );
  INV_X1 U177 ( .A(n245), .ZN(n257) );
  NAND3_X1 U178 ( .A1(ctr[7]), .A2(n197), .A3(n257), .ZN(n168) );
  NAND2_X1 U179 ( .A1(n197), .A2(n169), .ZN(n170) );
  OAI22_X1 U180 ( .A1(n230), .A2(n170), .B1(n234), .B2(n159), .ZN(n121) );
  OAI22_X1 U181 ( .A1(n236), .A2(n170), .B1(n240), .B2(n159), .ZN(n120) );
  OAI22_X1 U182 ( .A1(n195), .A2(n170), .B1(n246), .B2(n159), .ZN(n119) );
  OAI22_X1 U183 ( .A1(n170), .A2(n193), .B1(n251), .B2(n159), .ZN(n118) );
  NAND3_X1 U184 ( .A1(n171), .A2(n205), .A3(n180), .ZN(n253) );
  INV_X1 U185 ( .A(n253), .ZN(n231) );
  MUX2_X1 U186 ( .A(n34), .B(n198), .S(n153), .Z(n172) );
  NAND2_X1 U187 ( .A1(n250), .A2(n172), .ZN(n123) );
  MUX2_X1 U188 ( .A(n33), .B(n213), .S(n153), .Z(n173) );
  NAND2_X1 U189 ( .A1(n250), .A2(n173), .ZN(n124) );
  MUX2_X1 U190 ( .A(n32), .B(n220), .S(n153), .Z(n174) );
  NAND2_X1 U191 ( .A1(n250), .A2(n174), .ZN(n125) );
  MUX2_X1 U192 ( .A(n31), .B(n226), .S(n153), .Z(n175) );
  NAND2_X1 U193 ( .A1(n250), .A2(n175), .ZN(n126) );
  MUX2_X1 U194 ( .A(n30), .B(n230), .S(n153), .Z(n176) );
  NAND2_X1 U195 ( .A1(n250), .A2(n176), .ZN(n127) );
  MUX2_X1 U196 ( .A(n29), .B(n236), .S(n153), .Z(n177) );
  NAND2_X1 U197 ( .A1(n250), .A2(n177), .ZN(n128) );
  MUX2_X1 U198 ( .A(n28), .B(n195), .S(n153), .Z(n178) );
  NAND2_X1 U199 ( .A1(n250), .A2(n178), .ZN(n129) );
  MUX2_X1 U200 ( .A(n27), .B(n193), .S(n153), .Z(n179) );
  NAND2_X1 U201 ( .A1(n250), .A2(n179), .ZN(n130) );
  NAND2_X1 U202 ( .A1(n181), .A2(n180), .ZN(n199) );
  INV_X1 U203 ( .A(n199), .ZN(n182) );
  MUX2_X1 U204 ( .A(n26), .B(n198), .S(n154), .Z(n183) );
  NAND2_X1 U205 ( .A1(n250), .A2(n183), .ZN(n131) );
  MUX2_X1 U206 ( .A(n25), .B(n213), .S(n154), .Z(n184) );
  NAND2_X1 U207 ( .A1(n250), .A2(n184), .ZN(n132) );
  MUX2_X1 U208 ( .A(n185), .B(n220), .S(n154), .Z(n186) );
  NAND2_X1 U209 ( .A1(n250), .A2(n186), .ZN(n260) );
  MUX2_X1 U210 ( .A(n187), .B(n226), .S(n154), .Z(n188) );
  NAND2_X1 U211 ( .A1(n250), .A2(n188), .ZN(n261) );
  MUX2_X1 U212 ( .A(n189), .B(n230), .S(n154), .Z(n190) );
  NAND2_X1 U213 ( .A1(n250), .A2(n190), .ZN(n262) );
  MUX2_X1 U214 ( .A(n21), .B(n236), .S(n154), .Z(n191) );
  NAND2_X1 U215 ( .A1(n250), .A2(n191), .ZN(n133) );
  MUX2_X1 U216 ( .A(n20), .B(n195), .S(n154), .Z(n192) );
  NAND2_X1 U217 ( .A1(n250), .A2(n192), .ZN(n134) );
  MUX2_X1 U218 ( .A(n19), .B(n193), .S(n154), .Z(n194) );
  NAND2_X1 U219 ( .A1(n250), .A2(n194), .ZN(n135) );
  OAI22_X1 U220 ( .A1(n237), .A2(n195), .B1(n4), .B2(n235), .ZN(n150) );
  NAND2_X1 U221 ( .A1(n196), .A2(n156), .ZN(n219) );
  NAND2_X1 U222 ( .A1(n197), .A2(n219), .ZN(n218) );
  OAI22_X1 U223 ( .A1(n207), .A2(n219), .B1(n218), .B2(n198), .ZN(n115) );
  AOI211_X1 U224 ( .C1(n43), .C2(n160), .A(cr[0]), .B(wb_rst_i), .ZN(N104) );
  NOR3_X1 U225 ( .A1(n43), .A2(n4), .A3(wb_rst_i), .ZN(N108) );
  AND3_X1 U226 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N26) );
  OAI22_X1 U227 ( .A1(n237), .A2(n198), .B1(n10), .B2(n235), .ZN(n144) );
  NAND2_X1 U228 ( .A1(n199), .A2(n253), .ZN(n200) );
  INV_X1 U229 ( .A(n200), .ZN(n201) );
  NAND2_X1 U230 ( .A1(n157), .A2(n202), .ZN(n203) );
  INV_X1 U231 ( .A(n203), .ZN(n206) );
  NAND3_X1 U232 ( .A1(n206), .A2(n205), .A3(n204), .ZN(n252) );
  OAI22_X1 U233 ( .A1(n34), .A2(n253), .B1(n252), .B2(n207), .ZN(n208) );
  AOI221_X1 U234 ( .B1(n155), .B2(prer[8]), .C1(rxr[0]), .C2(n152), .A(n208), 
        .ZN(n212) );
  INV_X1 U235 ( .A(n209), .ZN(n256) );
  NAND2_X1 U236 ( .A1(n210), .A2(n245), .ZN(n225) );
  INV_X1 U237 ( .A(n225), .ZN(n255) );
  AOI222_X1 U238 ( .A1(sr_0), .A2(n257), .B1(ctr[0]), .B2(n256), .C1(n255), 
        .C2(txr[0]), .ZN(n211) );
  NAND2_X1 U239 ( .A1(n212), .A2(n211), .ZN(N30) );
  OAI22_X1 U240 ( .A1(n41), .A2(n219), .B1(n218), .B2(n213), .ZN(n116) );
  OAI22_X1 U241 ( .A1(n237), .A2(n213), .B1(n9), .B2(n235), .ZN(n145) );
  AOI21_X1 U242 ( .B1(n240), .B2(n234), .A(wb_rst_i), .ZN(N103) );
  INV_X1 U243 ( .A(n25), .ZN(n214) );
  AOI22_X1 U244 ( .A1(n155), .A2(n214), .B1(rxr[1]), .B2(n152), .ZN(n217) );
  INV_X1 U245 ( .A(n252), .ZN(n221) );
  AOI22_X1 U246 ( .A1(cr[1]), .A2(n221), .B1(n231), .B2(prer[1]), .ZN(n216) );
  AOI222_X1 U247 ( .A1(sr_1), .A2(n257), .B1(ctr[1]), .B2(n256), .C1(n255), 
        .C2(txr[1]), .ZN(n215) );
  NAND3_X1 U248 ( .A1(n217), .A2(n216), .A3(n215), .ZN(N31) );
  OAI22_X1 U249 ( .A1(n40), .A2(n219), .B1(n220), .B2(n218), .ZN(n117) );
  OAI22_X1 U250 ( .A1(n237), .A2(n220), .B1(n8), .B2(n235), .ZN(n146) );
  AOI22_X1 U251 ( .A1(n231), .A2(prer[2]), .B1(ctr[2]), .B2(n256), .ZN(n223)
         );
  AOI222_X1 U252 ( .A1(cr[2]), .A2(n221), .B1(prer[10]), .B2(n155), .C1(rxr[2]), .C2(n152), .ZN(n222) );
  OAI211_X1 U253 ( .C1(n225), .C2(n224), .A(n223), .B(n222), .ZN(N32) );
  OAI22_X1 U254 ( .A1(n237), .A2(n226), .B1(n7), .B2(n235), .ZN(n147) );
  AOI22_X1 U255 ( .A1(prer[11]), .A2(n155), .B1(rxr[3]), .B2(n152), .ZN(n228)
         );
  AOI222_X1 U256 ( .A1(txr[3]), .A2(n255), .B1(n231), .B2(prer[3]), .C1(ctr[3]), .C2(n256), .ZN(n227) );
  OAI211_X1 U257 ( .C1(n252), .C2(n229), .A(n228), .B(n227), .ZN(N33) );
  OAI22_X1 U258 ( .A1(n237), .A2(n230), .B1(n6), .B2(n235), .ZN(n148) );
  AOI22_X1 U259 ( .A1(prer[12]), .A2(n155), .B1(rxr[4]), .B2(n152), .ZN(n233)
         );
  AOI222_X1 U260 ( .A1(txr[4]), .A2(n255), .B1(n231), .B2(prer[4]), .C1(ctr[4]), .C2(n256), .ZN(n232) );
  OAI211_X1 U261 ( .C1(n252), .C2(n234), .A(n233), .B(n232), .ZN(N34) );
  OAI22_X1 U262 ( .A1(n237), .A2(n236), .B1(n5), .B2(n235), .ZN(n149) );
  NAND2_X1 U263 ( .A1(n251), .A2(sr[5]), .ZN(n239) );
  INV_X1 U264 ( .A(i2c_al), .ZN(n238) );
  AOI21_X1 U265 ( .B1(n239), .B2(n238), .A(wb_rst_i), .ZN(N101) );
  AOI22_X1 U266 ( .A1(ctr[5]), .A2(n256), .B1(n255), .B2(txr[5]), .ZN(n243) );
  OAI22_X1 U267 ( .A1(n29), .A2(n253), .B1(n252), .B2(n240), .ZN(n241) );
  AOI221_X1 U268 ( .B1(n155), .B2(prer[13]), .C1(rxr[5]), .C2(n152), .A(n241), 
        .ZN(n242) );
  OAI211_X1 U269 ( .C1(n245), .C2(n244), .A(n243), .B(n242), .ZN(N35) );
  OAI22_X1 U270 ( .A1(n28), .A2(n253), .B1(n252), .B2(n246), .ZN(n247) );
  AOI221_X1 U271 ( .B1(n155), .B2(prer[14]), .C1(rxr[6]), .C2(n152), .A(n247), 
        .ZN(n249) );
  AOI222_X1 U272 ( .A1(sr[6]), .A2(n257), .B1(ctr[6]), .B2(n256), .C1(n255), 
        .C2(txr[6]), .ZN(n248) );
  NAND2_X1 U273 ( .A1(n249), .A2(n248), .ZN(N36) );
  AND2_X1 U274 ( .A1(irxack), .A2(n250), .ZN(N102) );
  OAI22_X1 U275 ( .A1(n27), .A2(n253), .B1(n252), .B2(n251), .ZN(n254) );
  AOI221_X1 U276 ( .B1(n155), .B2(prer[15]), .C1(rxr[7]), .C2(n152), .A(n254), 
        .ZN(n259) );
  AOI222_X1 U277 ( .A1(sr[7]), .A2(n257), .B1(ctr[7]), .B2(n256), .C1(n255), 
        .C2(txr[7]), .ZN(n258) );
  NAND2_X1 U278 ( .A1(n259), .A2(n258), .ZN(N37) );
  NOR2_X1 \byte_controller/U153  ( .A1(\byte_controller/n164 ), .A2(
        \byte_controller/n13 ), .ZN(\byte_controller/n110 ) );
  OAI21_X1 \byte_controller/U152  ( .B1(\byte_controller/n159 ), .B2(
        \byte_controller/n14 ), .A(\byte_controller/n157 ), .ZN(
        \byte_controller/n107 ) );
  NAND3_X1 \byte_controller/U151  ( .A1(\byte_controller/core_cmd [3]), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/n156 ), .ZN(
        \byte_controller/n157 ) );
  AOI21_X1 \byte_controller/U150  ( .B1(\byte_controller/n36 ), .B2(
        \byte_controller/n155 ), .A(\byte_controller/n154 ), .ZN(
        \byte_controller/n159 ) );
  MUX2_X1 \byte_controller/U149  ( .A(\byte_controller/c_state [1]), .B(
        \byte_controller/c_state [2]), .S(\byte_controller/n31 ), .Z(
        \byte_controller/n154 ) );
  OAI21_X1 \byte_controller/U148  ( .B1(cr[7]), .B2(\byte_controller/n153 ), 
        .A(\byte_controller/n152 ), .ZN(\byte_controller/n155 ) );
  OAI21_X1 \byte_controller/U147  ( .B1(\byte_controller/n151 ), .B2(
        \byte_controller/n158 ), .A(\byte_controller/n150 ), .ZN(
        \byte_controller/n108 ) );
  NAND3_X1 \byte_controller/U146  ( .A1(\byte_controller/core_cmd [2]), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/n156 ), .ZN(
        \byte_controller/n150 ) );
  AOI221_X1 \byte_controller/U145  ( .B1(cr[4]), .B2(\byte_controller/n22 ), 
        .C1(\byte_controller/n40 ), .C2(\byte_controller/n149 ), .A(
        \byte_controller/n148 ), .ZN(\byte_controller/n151 ) );
  MUX2_X1 \byte_controller/U144  ( .A(\byte_controller/n30 ), .B(
        \byte_controller/c_state [1]), .S(\byte_controller/n31 ), .Z(
        \byte_controller/n148 ) );
  OAI21_X1 \byte_controller/U143  ( .B1(\byte_controller/n147 ), .B2(
        \byte_controller/n14 ), .A(\byte_controller/n146 ), .ZN(
        \byte_controller/n167 ) );
  NAND3_X1 \byte_controller/U142  ( .A1(\byte_controller/core_cmd [1]), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/n156 ), .ZN(
        \byte_controller/n146 ) );
  AOI22_X1 \byte_controller/U141  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n145 ), .B1(cr[6]), .B2(\byte_controller/c_state [3]), 
        .ZN(\byte_controller/n147 ) );
  OAI33_X1 \byte_controller/U140  ( .A1(\byte_controller/n158 ), .A2(
        \byte_controller/n153 ), .A3(\byte_controller/n144 ), .B1(
        \byte_controller/n143 ), .B2(\byte_controller/n13 ), .B3(
        \byte_controller/n142 ), .ZN(\byte_controller/n109 ) );
  INV_X1 \byte_controller/U139  ( .A(\byte_controller/n156 ), .ZN(
        \byte_controller/n143 ) );
  MUX2_X1 \byte_controller/U138  ( .A(\byte_controller/n41 ), .B(
        \byte_controller/n140 ), .S(\byte_controller/n43 ), .Z(
        \byte_controller/n156 ) );
  NAND3_X1 \byte_controller/U137  ( .A1(\byte_controller/n136 ), .A2(
        \byte_controller/n6 ), .A3(\byte_controller/n140 ), .ZN(
        \byte_controller/n137 ) );
  NOR3_X1 \byte_controller/U136  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n163 ), .A3(\byte_controller/n133 ), .ZN(
        \byte_controller/n138 ) );
  INV_X1 \byte_controller/U135  ( .A(\byte_controller/n132 ), .ZN(
        \byte_controller/n139 ) );
  AOI21_X1 \byte_controller/U134  ( .B1(\byte_controller/n131 ), .B2(
        \byte_controller/n160 ), .A(\byte_controller/n13 ), .ZN(
        \byte_controller/N201 ) );
  NAND2_X1 \byte_controller/U133  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n42 ), .ZN(\byte_controller/n160 ) );
  AOI22_X1 \byte_controller/U132  ( .A1(cr[3]), .A2(\byte_controller/n130 ), 
        .B1(\byte_controller/n129 ), .B2(rxr[7]), .ZN(\byte_controller/n131 )
         );
  OAI221_X1 \byte_controller/U131  ( .B1(\byte_controller/n44 ), .B2(
        \byte_controller/n42 ), .C1(\byte_controller/c_state [3]), .C2(
        \byte_controller/n20 ), .A(\byte_controller/n136 ), .ZN(
        \byte_controller/n129 ) );
  INV_X1 \byte_controller/U130  ( .A(\byte_controller/n134 ), .ZN(
        \byte_controller/n136 ) );
  OAI21_X1 \byte_controller/U129  ( .B1(\byte_controller/n44 ), .B2(
        \byte_controller/n41 ), .A(\byte_controller/n37 ), .ZN(
        \byte_controller/n130 ) );
  OAI221_X1 \byte_controller/U128  ( .B1(\byte_controller/n7 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n126 ), .A(\byte_controller/n125 ), .ZN(
        \byte_controller/n114 ) );
  NAND2_X1 \byte_controller/U127  ( .A1(txr[7]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n125 ) );
  OAI221_X1 \byte_controller/U126  ( .B1(\byte_controller/n126 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n123 ), .A(\byte_controller/n122 ), .ZN(
        \byte_controller/n115 ) );
  NAND2_X1 \byte_controller/U125  ( .A1(txr[6]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n122 ) );
  OAI221_X1 \byte_controller/U124  ( .B1(\byte_controller/n123 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n106 ), .A(\byte_controller/n105 ), .ZN(
        \byte_controller/n116 ) );
  NAND2_X1 \byte_controller/U123  ( .A1(txr[5]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n105 ) );
  OAI221_X1 \byte_controller/U122  ( .B1(\byte_controller/n106 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n104 ), .A(\byte_controller/n103 ), .ZN(
        \byte_controller/n117 ) );
  NAND2_X1 \byte_controller/U121  ( .A1(txr[4]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n103 ) );
  OAI221_X1 \byte_controller/U120  ( .B1(\byte_controller/n104 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n102 ), .A(\byte_controller/n101 ), .ZN(
        \byte_controller/n118 ) );
  NAND2_X1 \byte_controller/U119  ( .A1(txr[3]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n101 ) );
  OAI221_X1 \byte_controller/U118  ( .B1(\byte_controller/n102 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n100 ), .A(\byte_controller/n99 ), .ZN(
        \byte_controller/n119 ) );
  NAND2_X1 \byte_controller/U117  ( .A1(txr[2]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n99 ) );
  OAI221_X1 \byte_controller/U116  ( .B1(\byte_controller/n100 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n98 ), .A(\byte_controller/n97 ), .ZN(
        \byte_controller/n121 ) );
  NAND2_X1 \byte_controller/U115  ( .A1(txr[1]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n97 ) );
  OAI221_X1 \byte_controller/U114  ( .B1(\byte_controller/n98 ), .B2(
        \byte_controller/n128 ), .C1(\byte_controller/n127 ), .C2(
        \byte_controller/n161 ), .A(\byte_controller/n96 ), .ZN(
        \byte_controller/n120 ) );
  NAND2_X1 \byte_controller/U113  ( .A1(txr[0]), .A2(\byte_controller/n124 ), 
        .ZN(\byte_controller/n96 ) );
  INV_X1 \byte_controller/U112  ( .A(\byte_controller/n95 ), .ZN(
        \byte_controller/n124 ) );
  INV_X1 \byte_controller/U111  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n161 ) );
  NAND3_X1 \byte_controller/U110  ( .A1(\byte_controller/n95 ), .A2(
        \byte_controller/n94 ), .A3(\byte_controller/n127 ), .ZN(
        \byte_controller/n128 ) );
  OAI33_X1 \byte_controller/U109  ( .A1(\byte_controller/n132 ), .A2(
        \byte_controller/n93 ), .A3(\byte_controller/n8 ), .B1(
        \byte_controller/n39 ), .B2(\byte_controller/n13 ), .B3(
        \byte_controller/n37 ), .ZN(\byte_controller/N208 ) );
  MUX2_X1 \byte_controller/U108  ( .A(\byte_controller/n91 ), .B(
        \byte_controller/n90 ), .S(\byte_controller/n44 ), .Z(
        \byte_controller/n93 ) );
  NAND3_X1 \byte_controller/U107  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/n12 ), .A3(\byte_controller/n33 ), .ZN(
        \byte_controller/n91 ) );
  OAI221_X1 \byte_controller/U106  ( .B1(\byte_controller/n89 ), .B2(
        \byte_controller/n127 ), .C1(\byte_controller/n18 ), .C2(
        \byte_controller/n88 ), .A(\byte_controller/n95 ), .ZN(
        \byte_controller/n111 ) );
  AOI21_X1 \byte_controller/U105  ( .B1(\byte_controller/dcnt [1]), .B2(
        \byte_controller/n87 ), .A(\byte_controller/n31 ), .ZN(
        \byte_controller/n89 ) );
  NAND2_X1 \byte_controller/U104  ( .A1(\byte_controller/n95 ), .A2(
        \byte_controller/n86 ), .ZN(\byte_controller/n113 ) );
  MUX2_X1 \byte_controller/U103  ( .A(\byte_controller/n88 ), .B(
        \byte_controller/n85 ), .S(\byte_controller/n19 ), .Z(
        \byte_controller/n86 ) );
  NAND2_X1 \byte_controller/U102  ( .A1(\byte_controller/n84 ), .A2(
        \byte_controller/n21 ), .ZN(\byte_controller/n85 ) );
  OAI21_X1 \byte_controller/U101  ( .B1(\byte_controller/n25 ), .B2(
        \byte_controller/dcnt [0]), .A(\byte_controller/n94 ), .ZN(
        \byte_controller/n88 ) );
  NAND2_X1 \byte_controller/U100  ( .A1(\byte_controller/n95 ), .A2(
        \byte_controller/n83 ), .ZN(\byte_controller/n112 ) );
  MUX2_X1 \byte_controller/U99  ( .A(\byte_controller/n82 ), .B(
        \byte_controller/dcnt [0]), .S(\byte_controller/n84 ), .Z(
        \byte_controller/n83 ) );
  INV_X1 \byte_controller/U98  ( .A(\byte_controller/n127 ), .ZN(
        \byte_controller/n84 ) );
  NAND2_X1 \byte_controller/U97  ( .A1(\byte_controller/n94 ), .A2(
        \byte_controller/dcnt [0]), .ZN(\byte_controller/n82 ) );
  NAND2_X1 \byte_controller/U96  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n94 ), .ZN(\byte_controller/n95 ) );
  AOI21_X1 \byte_controller/U95  ( .B1(\byte_controller/n44 ), .B2(
        \byte_controller/n79 ), .A(\byte_controller/n132 ), .ZN(
        \byte_controller/N202 ) );
  NAND2_X1 \byte_controller/U94  ( .A1(\byte_controller/n30 ), .A2(
        \byte_controller/n8 ), .ZN(\byte_controller/n79 ) );
  OAI21_X1 \byte_controller/U93  ( .B1(\byte_controller/n35 ), .B2(
        \byte_controller/n132 ), .A(\byte_controller/n78 ), .ZN(
        \byte_controller/N203 ) );
  OAI33_X1 \byte_controller/U92  ( .A1(\byte_controller/n77 ), .A2(
        \byte_controller/n13 ), .A3(\byte_controller/n144 ), .B1(
        \byte_controller/n39 ), .B2(\byte_controller/n13 ), .B3(
        \byte_controller/n9 ), .ZN(\byte_controller/N205 ) );
  AOI21_X1 \byte_controller/U91  ( .B1(\byte_controller/n76 ), .B2(
        \byte_controller/n75 ), .A(\byte_controller/n132 ), .ZN(
        \byte_controller/N204 ) );
  NAND2_X1 \byte_controller/U90  ( .A1(\byte_controller/n66 ), .A2(
        \byte_controller/n42 ), .ZN(\byte_controller/n132 ) );
  NAND2_X1 \byte_controller/U89  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n74 ), .ZN(\byte_controller/n76 ) );
  NAND3_X1 \byte_controller/U88  ( .A1(\byte_controller/n71 ), .A2(
        \byte_controller/n72 ), .A3(\byte_controller/n73 ), .ZN(
        \byte_controller/n166 ) );
  NAND3_X1 \byte_controller/U87  ( .A1(\byte_controller/n70 ), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/c_state [4]), .ZN(
        \byte_controller/n71 ) );
  NAND4_X1 \byte_controller/U86  ( .A1(cr[6]), .A2(\byte_controller/n5 ), .A3(
        \byte_controller/n27 ), .A4(\byte_controller/n42 ), .ZN(
        \byte_controller/n72 ) );
  NAND4_X1 \byte_controller/U85  ( .A1(\byte_controller/n17 ), .A2(
        \byte_controller/n23 ), .A3(\byte_controller/n5 ), .A4(
        \byte_controller/n4 ), .ZN(\byte_controller/n73 ) );
  NAND3_X1 \byte_controller/U84  ( .A1(\byte_controller/n67 ), .A2(
        \byte_controller/n68 ), .A3(\byte_controller/n69 ), .ZN(
        \byte_controller/n165 ) );
  NAND3_X1 \byte_controller/U83  ( .A1(\byte_controller/n70 ), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/n20 ), .ZN(
        \byte_controller/n67 ) );
  NAND3_X1 \byte_controller/U82  ( .A1(\byte_controller/n5 ), .A2(
        \byte_controller/n11 ), .A3(\byte_controller/n65 ), .ZN(
        \byte_controller/n68 ) );
  NAND3_X1 \byte_controller/U81  ( .A1(\byte_controller/n144 ), .A2(
        \byte_controller/n63 ), .A3(\byte_controller/n36 ), .ZN(
        \byte_controller/n69 ) );
  OAI33_X1 \byte_controller/U80  ( .A1(\byte_controller/n1 ), .A2(
        \byte_controller/n13 ), .A3(\byte_controller/n33 ), .B1(
        \byte_controller/n62 ), .B2(\byte_controller/n13 ), .B3(
        \byte_controller/n145 ), .ZN(\byte_controller/N207 ) );
  OAI22_X1 \byte_controller/U79  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n26 ), .B1(\byte_controller/n17 ), .B2(
        \byte_controller/n26 ), .ZN(\byte_controller/n62 ) );
  NAND2_X1 \byte_controller/U78  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n16 ), .ZN(\byte_controller/n77 ) );
  INV_X1 \byte_controller/U77  ( .A(\byte_controller/n133 ), .ZN(
        \byte_controller/n135 ) );
  NAND2_X1 \byte_controller/U76  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n53 ), .ZN(\byte_controller/n133 ) );
  NAND2_X1 \byte_controller/U75  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n60 ), .ZN(\byte_controller/n140 ) );
  NAND3_X1 \byte_controller/U74  ( .A1(\byte_controller/n145 ), .A2(
        \byte_controller/n149 ), .A3(\byte_controller/n74 ), .ZN(
        \byte_controller/n61 ) );
  INV_X1 \byte_controller/U73  ( .A(cr[6]), .ZN(\byte_controller/n74 ) );
  INV_X1 \byte_controller/U72  ( .A(cr[4]), .ZN(\byte_controller/n145 ) );
  NAND2_X1 \byte_controller/U71  ( .A1(cr[5]), .A2(\byte_controller/n29 ), 
        .ZN(\byte_controller/n64 ) );
  INV_X1 \byte_controller/U70  ( .A(cr[5]), .ZN(\byte_controller/n149 ) );
  INV_X1 \byte_controller/U69  ( .A(cr[7]), .ZN(\byte_controller/n144 ) );
  INV_X1 \byte_controller/U68  ( .A(wb_rst_i), .ZN(\byte_controller/n94 ) );
  INV_X1 \byte_controller/U67  ( .A(i2c_al), .ZN(\byte_controller/n59 ) );
  NAND2_X1 \byte_controller/U66  ( .A1(\byte_controller/n58 ), .A2(
        \byte_controller/n57 ), .ZN(\byte_controller/n70 ) );
  AOI21_X1 \byte_controller/U65  ( .B1(\byte_controller/n27 ), .B2(
        \byte_controller/n10 ), .A(\byte_controller/n56 ), .ZN(
        \byte_controller/n57 ) );
  OAI33_X1 \byte_controller/U64  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n53 ), .A3(\byte_controller/n55 ), .B1(
        \byte_controller/n54 ), .B2(\byte_controller/c_state [3]), .B3(
        \byte_controller/n30 ), .ZN(\byte_controller/n56 ) );
  NAND3_X1 \byte_controller/U63  ( .A1(\byte_controller/n35 ), .A2(
        \byte_controller/n141 ), .A3(\byte_controller/n53 ), .ZN(
        \byte_controller/n54 ) );
  NAND2_X1 \byte_controller/U62  ( .A1(\byte_controller/n141 ), .A2(
        \byte_controller/n37 ), .ZN(\byte_controller/n55 ) );
  NAND3_X1 \byte_controller/U61  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n35 ), .A3(\byte_controller/n75 ), .ZN(
        \byte_controller/n134 ) );
  INV_X1 \byte_controller/U60  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n141 ) );
  AOI221_X1 \byte_controller/U59  ( .B1(\byte_controller/n52 ), .B2(
        \byte_controller/n51 ), .C1(\byte_controller/n11 ), .C2(
        \byte_controller/n50 ), .A(\byte_controller/n49 ), .ZN(
        \byte_controller/n58 ) );
  OAI33_X1 \byte_controller/U58  ( .A1(\byte_controller/n48 ), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/c_state [1]), .B1(
        \byte_controller/n47 ), .B2(\byte_controller/c_state [4]), .B3(
        \byte_controller/n46 ), .ZN(\byte_controller/n49 ) );
  NAND2_X1 \byte_controller/U57  ( .A1(\byte_controller/n92 ), .A2(
        \byte_controller/n32 ), .ZN(\byte_controller/n46 ) );
  NAND3_X1 \byte_controller/U56  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/n152 ), .A3(\byte_controller/n33 ), .ZN(
        \byte_controller/n47 ) );
  INV_X1 \byte_controller/U55  ( .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n152 ) );
  NAND3_X1 \byte_controller/U54  ( .A1(\byte_controller/n18 ), .A2(
        \byte_controller/n19 ), .A3(\byte_controller/n21 ), .ZN(
        \byte_controller/n92 ) );
  NAND3_X1 \byte_controller/U53  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n35 ), .A3(\byte_controller/n75 ), .ZN(
        \byte_controller/n48 ) );
  OAI21_X1 \byte_controller/U52  ( .B1(cr[5]), .B2(cr[4]), .A(
        \byte_controller/n29 ), .ZN(\byte_controller/n50 ) );
  NOR3_X1 \byte_controller/U51  ( .A1(\byte_controller/c_state [4]), .A2(
        \byte_controller/c_state [1]), .A3(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n45 ) );
  NOR2_X1 \byte_controller/U50  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/c_state [1]), .ZN(\byte_controller/n51 ) );
  INV_X1 \byte_controller/U49  ( .A(\byte_controller/n90 ), .ZN(
        \byte_controller/n52 ) );
  NAND3_X1 \byte_controller/U48  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n75 ), .A3(\byte_controller/n35 ), .ZN(
        \byte_controller/n90 ) );
  INV_X1 \byte_controller/U47  ( .A(\byte_controller/n78 ), .ZN(
        \byte_controller/n63 ) );
  INV_X1 \byte_controller/U46  ( .A(\byte_controller/n141 ), .ZN(
        \byte_controller/n42 ) );
  INV_X1 \byte_controller/U45  ( .A(\byte_controller/n29 ), .ZN(
        \byte_controller/n41 ) );
  INV_X1 \byte_controller/U44  ( .A(\byte_controller/n9 ), .ZN(
        \byte_controller/n40 ) );
  INV_X1 \byte_controller/U43  ( .A(\byte_controller/n163 ), .ZN(
        \byte_controller/n66 ) );
  AND2_X1 \byte_controller/U42  ( .A1(\byte_controller/n58 ), .A2(
        \byte_controller/n57 ), .ZN(\byte_controller/n39 ) );
  BUF_X1 \byte_controller/U41  ( .A(\byte_controller/n32 ), .Z(
        \byte_controller/n37 ) );
  CLKBUF_X1 \byte_controller/U40  ( .A(cr[5]), .Z(\byte_controller/n36 ) );
  AND2_X1 \byte_controller/U39  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n60 ), .ZN(\byte_controller/n34 ) );
  AND3_X1 \byte_controller/U38  ( .A1(\byte_controller/n18 ), .A2(
        \byte_controller/n19 ), .A3(\byte_controller/n21 ), .ZN(
        \byte_controller/n31 ) );
  CLKBUF_X1 \byte_controller/U37  ( .A(\byte_controller/c_state [2]), .Z(
        \byte_controller/n30 ) );
  BUF_X2 \byte_controller/U36  ( .A(arst_i), .Z(\byte_controller/n28 ) );
  MUX2_X1 \byte_controller/U35  ( .A(\byte_controller/n161 ), .B(
        \byte_controller/n162 ), .S(\byte_controller/n160 ), .Z(
        \byte_controller/n164 ) );
  AND4_X1 \byte_controller/U34  ( .A1(\byte_controller/n38 ), .A2(
        \byte_controller/n33 ), .A3(\byte_controller/c_state [3]), .A4(
        \byte_controller/n53 ), .ZN(\byte_controller/n27 ) );
  AND2_X1 \byte_controller/U33  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/c_state [2]), .ZN(\byte_controller/n24 ) );
  INV_X1 \byte_controller/U32  ( .A(\byte_controller/n64 ), .ZN(
        \byte_controller/n65 ) );
  AND2_X1 \byte_controller/U31  ( .A1(\byte_controller/n144 ), .A2(
        \byte_controller/n149 ), .ZN(\byte_controller/n23 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/n15 ), .ZN(
        \byte_controller/n153 ) );
  AND2_X1 \byte_controller/U29  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n15 ), .ZN(\byte_controller/n22 ) );
  NAND3_X2 \byte_controller/U28  ( .A1(\byte_controller/n94 ), .A2(
        \byte_controller/n81 ), .A3(\byte_controller/n80 ), .ZN(
        \byte_controller/n127 ) );
  BUF_X1 \byte_controller/U27  ( .A(\byte_controller/n53 ), .Z(
        \byte_controller/n44 ) );
  INV_X1 \byte_controller/U26  ( .A(\byte_controller/n44 ), .ZN(
        \byte_controller/n20 ) );
  AND2_X1 \byte_controller/U25  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n16 ), .ZN(\byte_controller/n17 ) );
  AND3_X1 \byte_controller/U24  ( .A1(\byte_controller/n12 ), .A2(
        \byte_controller/n33 ), .A3(\byte_controller/n135 ), .ZN(
        \byte_controller/n43 ) );
  AND3_X1 \byte_controller/U23  ( .A1(\byte_controller/n135 ), .A2(
        \byte_controller/n33 ), .A3(\byte_controller/n38 ), .ZN(
        \byte_controller/n16 ) );
  AND3_X1 \byte_controller/U22  ( .A1(\byte_controller/n12 ), .A2(
        \byte_controller/n33 ), .A3(\byte_controller/n6 ), .ZN(
        \byte_controller/n15 ) );
  NAND2_X1 \byte_controller/U21  ( .A1(\byte_controller/n59 ), .A2(
        \byte_controller/n94 ), .ZN(\byte_controller/n163 ) );
  INV_X1 \byte_controller/U20  ( .A(\byte_controller/n66 ), .ZN(
        \byte_controller/n13 ) );
  AND2_X1 \byte_controller/U19  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n35 ), .ZN(\byte_controller/n38 ) );
  AND2_X1 \byte_controller/U18  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n35 ), .ZN(\byte_controller/n12 ) );
  OAI21_X1 \byte_controller/U17  ( .B1(\byte_controller/n139 ), .B2(
        \byte_controller/n138 ), .A(\byte_controller/n137 ), .ZN(
        \byte_controller/n158 ) );
  AND3_X1 \byte_controller/U16  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n37 ), .A3(\byte_controller/n45 ), .ZN(
        \byte_controller/n11 ) );
  AND3_X1 \byte_controller/U15  ( .A1(\byte_controller/n11 ), .A2(
        \byte_controller/n42 ), .A3(\byte_controller/n64 ), .ZN(
        \byte_controller/n26 ) );
  OAI21_X1 \byte_controller/U14  ( .B1(\byte_controller/n139 ), .B2(
        \byte_controller/n138 ), .A(\byte_controller/n137 ), .ZN(
        \byte_controller/n14 ) );
  BUF_X2 \byte_controller/U13  ( .A(\byte_controller/core_ack ), .Z(
        \byte_controller/n29 ) );
  INV_X1 \byte_controller/U12  ( .A(\byte_controller/n29 ), .ZN(
        \byte_controller/n10 ) );
  INV_X1 \byte_controller/U11  ( .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n9 ) );
  BUF_X1 \byte_controller/U10  ( .A(\byte_controller/n92 ), .Z(
        \byte_controller/n8 ) );
  INV_X1 \byte_controller/U9  ( .A(\byte_controller/n133 ), .ZN(
        \byte_controller/n6 ) );
  AND2_X2 \byte_controller/U8  ( .A1(\byte_controller/n59 ), .A2(
        \byte_controller/n94 ), .ZN(\byte_controller/n5 ) );
  CLKBUF_X1 \byte_controller/U7  ( .A(\byte_controller/n145 ), .Z(
        \byte_controller/n4 ) );
  INV_X1 \byte_controller/U6  ( .A(\byte_controller/n163 ), .ZN(
        \byte_controller/n3 ) );
  AND2_X1 \byte_controller/U5  ( .A1(\byte_controller/n16 ), .A2(
        \byte_controller/n3 ), .ZN(\byte_controller/n2 ) );
  NAND2_X1 \byte_controller/U4  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n2 ), .ZN(\byte_controller/n78 ) );
  INV_X1 \byte_controller/U3  ( .A(\byte_controller/n70 ), .ZN(
        \byte_controller/n1 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N202 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/n81 ), .QN(
        \byte_controller/n25 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n167 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(
        \byte_controller/core_cmd [1]) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N203 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n28 ), .Q(\byte_controller/ld ), .QN(
        \byte_controller/n80 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N201 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N204 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(done), .QN(
        \byte_controller/n60 ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n110 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(irxack), .QN(
        \byte_controller/n162 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n120 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[0]), .QN(
        \byte_controller/n98 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n121 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[1]), .QN(
        \byte_controller/n100 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n119 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[2]), .QN(
        \byte_controller/n102 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n118 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[3]), .QN(
        \byte_controller/n104 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n117 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[4]), .QN(
        \byte_controller/n106 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n116 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[5]), .QN(
        \byte_controller/n123 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n115 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[6]), .QN(
        \byte_controller/n126 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n114 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(rxr[7]), .QN(
        \byte_controller/n7 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/N208 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [3]), .QN(
        \byte_controller/n32 ) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n111 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/n87 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n112 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/dcnt [0]), 
        .QN(\byte_controller/n21 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n165 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n53 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/N207 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n33 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n113 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/dcnt [1]), 
        .QN(\byte_controller/n19 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n109 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(
        \byte_controller/core_cmd [0]), .QN(\byte_controller/n142 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n108 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/N205 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/c_state [0]), .QN(\byte_controller/n35 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n166 ), .CK(
        wb_clk_i), .RN(\byte_controller/n28 ), .Q(\byte_controller/c_state [4]), .QN(\byte_controller/n75 ) );
  NOR3_X1 \byte_controller/bit_controller/U184  ( .A1(
        \byte_controller/bit_controller/n87 ), .A2(
        \byte_controller/bit_controller/n224 ), .A3(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/N154 ) );
  INV_X1 \byte_controller/bit_controller/U183  ( .A(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n224 ) );
  AOI211_X1 \byte_controller/bit_controller/U182  ( .C1(
        \byte_controller/bit_controller/n81 ), .C2(
        \byte_controller/bit_controller/n80 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N75 ) );
  NOR3_X1 \byte_controller/bit_controller/U181  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  MUX2_X1 \byte_controller/bit_controller/U180  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n221 ), .S(
        \byte_controller/bit_controller/n220 ), .Z(
        \byte_controller/bit_controller/n158 ) );
  AOI21_X1 \byte_controller/bit_controller/U179  ( .B1(
        \byte_controller/bit_controller/n66 ), .B2(
        \byte_controller/bit_controller/n219 ), .A(
        \byte_controller/bit_controller/n218 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  NAND4_X1 \byte_controller/bit_controller/U178  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n124 ), .A3(
        \byte_controller/bit_controller/n88 ), .A4(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  AOI211_X1 \byte_controller/bit_controller/U177  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n216 ), .A(\byte_controller/bit_controller/n12 ), .B(
        \byte_controller/bit_controller/n215 ), .ZN(
        \byte_controller/bit_controller/n217 ) );
  NAND4_X1 \byte_controller/bit_controller/U176  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n111 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  NAND4_X1 \byte_controller/bit_controller/U175  ( .A1(
        \byte_controller/bit_controller/n67 ), .A2(
        \byte_controller/bit_controller/n212 ), .A3(
        \byte_controller/bit_controller/n211 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n213 ) );
  OAI22_X1 \byte_controller/bit_controller/U174  ( .A1(
        \byte_controller/bit_controller/n11 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n64 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U173  ( .A1(
        \byte_controller/bit_controller/n109 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n108 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U172  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  OAI21_X1 \byte_controller/bit_controller/U171  ( .B1(
        \byte_controller/bit_controller/n111 ), .B2(
        \byte_controller/bit_controller/n74 ), .A(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  NAND4_X1 \byte_controller/bit_controller/U170  ( .A1(
        \byte_controller/bit_controller/n67 ), .A2(
        \byte_controller/bit_controller/n208 ), .A3(
        \byte_controller/bit_controller/n211 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n209 ) );
  INV_X1 \byte_controller/bit_controller/U169  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n211 ) );
  AOI21_X1 \byte_controller/bit_controller/U168  ( .B1(
        \byte_controller/bit_controller/n206 ), .B2(
        \byte_controller/bit_controller/n205 ), .A(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n237 ) );
  INV_X1 \byte_controller/bit_controller/U167  ( .A(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n226 ) );
  AOI222_X1 \byte_controller/bit_controller/U166  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n4 ), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n203 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  INV_X1 \byte_controller/bit_controller/U165  ( .A(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n236 ) );
  AOI222_X1 \byte_controller/bit_controller/U164  ( .A1(
        \byte_controller/bit_controller/n5 ), .A2(prer[0]), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/cnt [0]), .C1(
        \byte_controller/bit_controller/n75 ), .C2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  INV_X1 \byte_controller/bit_controller/U163  ( .A(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n235 ) );
  AOI222_X1 \byte_controller/bit_controller/U162  ( .A1(
        \byte_controller/bit_controller/n5 ), .A2(prer[1]), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/n38 ), .C1(
        \byte_controller/bit_controller/N29 ), .C2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n201 ) );
  INV_X1 \byte_controller/bit_controller/U161  ( .A(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n234 ) );
  AOI222_X1 \byte_controller/bit_controller/U160  ( .A1(
        \byte_controller/bit_controller/n5 ), .A2(prer[2]), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/n35 ), .C1(
        \byte_controller/bit_controller/n75 ), .C2(
        \byte_controller/bit_controller/N30 ), .ZN(
        \byte_controller/bit_controller/n200 ) );
  INV_X1 \byte_controller/bit_controller/U159  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n233 ) );
  AOI222_X1 \byte_controller/bit_controller/U158  ( .A1(
        \byte_controller/bit_controller/n5 ), .A2(prer[3]), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/n25 ), .C1(
        \byte_controller/bit_controller/n75 ), .C2(
        \byte_controller/bit_controller/N31 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  INV_X1 \byte_controller/bit_controller/U157  ( .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n232 ) );
  AOI222_X1 \byte_controller/bit_controller/U156  ( .A1(prer[4]), .A2(
        \byte_controller/bit_controller/n5 ), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/n197 ), .C1(
        \byte_controller/bit_controller/N32 ), .C2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  INV_X1 \byte_controller/bit_controller/U155  ( .A(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/n228 ) );
  AOI222_X1 \byte_controller/bit_controller/U154  ( .A1(
        \byte_controller/bit_controller/N33 ), .A2(
        \byte_controller/bit_controller/n4 ), .B1(
        \byte_controller/bit_controller/n71 ), .B2(prer[5]), .C1(
        \byte_controller/bit_controller/n23 ), .C2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U153  ( .A(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n231 ) );
  AOI222_X1 \byte_controller/bit_controller/U152  ( .A1(
        \byte_controller/bit_controller/n5 ), .A2(prer[7]), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/n24 ), .C1(
        \byte_controller/bit_controller/N35 ), .C2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n195 ) );
  OAI21_X1 \byte_controller/bit_controller/U151  ( .B1(
        \byte_controller/bit_controller/n95 ), .B2(
        \byte_controller/bit_controller/n194 ), .A(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n225 ) );
  AOI22_X1 \byte_controller/bit_controller/U150  ( .A1(
        \byte_controller/bit_controller/N36 ), .A2(
        \byte_controller/bit_controller/n76 ), .B1(prer[8]), .B2(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n193 ) );
  INV_X1 \byte_controller/bit_controller/U149  ( .A(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  AOI222_X1 \byte_controller/bit_controller/U148  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n4 ), .B1(prer[9]), .B2(
        \byte_controller/bit_controller/n203 ), .C1(
        \byte_controller/bit_controller/n23 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n192 ) );
  INV_X1 \byte_controller/bit_controller/U147  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AOI222_X1 \byte_controller/bit_controller/U146  ( .A1(
        \byte_controller/bit_controller/N38 ), .A2(
        \byte_controller/bit_controller/n4 ), .B1(
        \byte_controller/bit_controller/n71 ), .B2(prer[10]), .C1(
        \byte_controller/bit_controller/n23 ), .C2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/n191 ) );
  INV_X1 \byte_controller/bit_controller/U145  ( .A(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n229 ) );
  AOI222_X1 \byte_controller/bit_controller/U144  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n76 ), .B1(
        \byte_controller/bit_controller/n71 ), .B2(prer[11]), .C1(
        \byte_controller/bit_controller/n23 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n190 ) );
  INV_X1 \byte_controller/bit_controller/U143  ( .A(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n128 ) );
  AOI222_X1 \byte_controller/bit_controller/U142  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n76 ), .B1(prer[12]), .B2(
        \byte_controller/bit_controller/n203 ), .C1(
        \byte_controller/bit_controller/n23 ), .C2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/n189 ) );
  INV_X1 \byte_controller/bit_controller/U141  ( .A(
        \byte_controller/bit_controller/n188 ), .ZN(
        \byte_controller/bit_controller/n230 ) );
  AOI222_X1 \byte_controller/bit_controller/U140  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n76 ), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(prer[13]), .C2(
        \byte_controller/bit_controller/n203 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  INV_X1 \byte_controller/bit_controller/U139  ( .A(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n227 ) );
  AOI222_X1 \byte_controller/bit_controller/U138  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n4 ), .B1(
        \byte_controller/bit_controller/n1 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n203 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  OAI211_X1 \byte_controller/bit_controller/U137  ( .C1(
        \byte_controller/bit_controller/n6 ), .C2(
        \byte_controller/bit_controller/n185 ), .A(
        \byte_controller/bit_controller/n184 ), .B(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n70 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  INV_X1 \byte_controller/bit_controller/U135  ( .A(
        \byte_controller/bit_controller/n99 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  NAND2_X1 \byte_controller/bit_controller/U134  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/N68 ) );
  AOI21_X1 \byte_controller/bit_controller/U133  ( .B1(
        \byte_controller/bit_controller/n172 ), .B2(
        \byte_controller/bit_controller/n219 ), .A(
        \byte_controller/bit_controller/n218 ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  INV_X1 \byte_controller/bit_controller/U132  ( .A(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/n218 ) );
  NAND3_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/n219 ), .A2(
        \byte_controller/bit_controller/n97 ), .A3(
        \byte_controller/bit_controller/n122 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  NAND4_X1 \byte_controller/bit_controller/U130  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n19 ), .A4(
        \byte_controller/bit_controller/n167 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  INV_X1 \byte_controller/bit_controller/U129  ( .A(
        \byte_controller/bit_controller/n215 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  NAND3_X1 \byte_controller/bit_controller/U128  ( .A1(
        \byte_controller/bit_controller/n7 ), .A2(
        \byte_controller/bit_controller/n123 ), .A3(
        \byte_controller/bit_controller/n8 ), .ZN(
        \byte_controller/bit_controller/n215 ) );
  OAI22_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/n17 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n11 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U126  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n17 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI21_X1 \byte_controller/bit_controller/U125  ( .B1(
        \byte_controller/bit_controller/n115 ), .B2(
        \byte_controller/bit_controller/n74 ), .A(
        \byte_controller/bit_controller/n166 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  NAND4_X1 \byte_controller/bit_controller/U124  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/core_cmd [3]), .A3(
        \byte_controller/bit_controller/n165 ), .A4(
        \byte_controller/bit_controller/n164 ), .ZN(
        \byte_controller/bit_controller/n166 ) );
  NOR3_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n164 ) );
  OAI22_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/n122 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U120  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n15 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n19 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n97 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI22_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n19 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n118 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n207 ), .A2(
        \byte_controller/bit_controller/n163 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n86 ) );
  NAND3_X1 \byte_controller/bit_controller/U115  ( .A1(
        \byte_controller/bit_controller/n165 ), .A2(
        \byte_controller/bit_controller/n9 ), .A3(
        \byte_controller/bit_controller/n162 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  OAI33_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n160 ), .A2(
        \byte_controller/bit_controller/n140 ), .A3(
        \byte_controller/bit_controller/n139 ), .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/N69 ), .B3(
        \byte_controller/bit_controller/n138 ), .ZN(
        \byte_controller/bit_controller/N83 ) );
  NAND2_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n161 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n160 ) );
  NAND2_X1 \byte_controller/bit_controller/U112  ( .A1(
        \byte_controller/bit_controller/n72 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  NOR4_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n135 ), .A2(
        \byte_controller/bit_controller/n168 ), .A3(
        \byte_controller/bit_controller/n134 ), .A4(
        \byte_controller/bit_controller/n133 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  NAND4_X1 \byte_controller/bit_controller/U110  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n123 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  NAND3_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n115 ), .A3(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n132 ) );
  NAND3_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n85 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  OAI21_X1 \byte_controller/bit_controller/U107  ( .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/n74 ), .A(
        \byte_controller/bit_controller/n127 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  OAI21_X1 \byte_controller/bit_controller/U106  ( .B1(
        \byte_controller/bit_controller/n169 ), .B2(
        \byte_controller/bit_controller/n68 ), .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n127 ) );
  INV_X1 \byte_controller/bit_controller/U105  ( .A(
        \byte_controller/bit_controller/n29 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  OAI22_X1 \byte_controller/bit_controller/U104  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n30 ), .B1(
        \byte_controller/bit_controller/n110 ), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  INV_X1 \byte_controller/bit_controller/U102  ( .A(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n219 ) );
  NAND2_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n79 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n223 ) );
  NOR2_X1 \byte_controller/bit_controller/U100  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n126 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  MUX2_X1 \byte_controller/bit_controller/U99  ( .A(
        \byte_controller/bit_controller/n125 ), .B(
        \byte_controller/bit_controller/n82 ), .S(
        \byte_controller/bit_controller/n87 ), .Z(
        \byte_controller/bit_controller/n126 ) );
  NAND2_X1 \byte_controller/bit_controller/U98  ( .A1(
        \byte_controller/bit_controller/n103 ), .A2(
        \byte_controller/bit_controller/n162 ), .ZN(
        \byte_controller/bit_controller/n125 ) );
  INV_X1 \byte_controller/bit_controller/U97  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n162 ) );
  INV_X1 \byte_controller/bit_controller/U96  ( .A(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n103 ) );
  NAND3_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n208 ), .A3(
        \byte_controller/bit_controller/n212 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  INV_X1 \byte_controller/bit_controller/U94  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n212 ) );
  INV_X1 \byte_controller/bit_controller/U93  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n208 ) );
  NOR4_X1 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n105 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  OR2_X1 \byte_controller/bit_controller/U91  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N66 ) );
  NAND2_X1 \byte_controller/bit_controller/U90  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  INV_X1 \byte_controller/bit_controller/U89  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n205 ) );
  OR2_X1 \byte_controller/bit_controller/U88  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  INV_X1 \byte_controller/bit_controller/U87  ( .A(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n97 ) );
  NAND2_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n213 ), .A2(
        \byte_controller/bit_controller/n89 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OR2_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/n89 ) );
  AND2_X1 \byte_controller/bit_controller/U84  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n88 ) );
  AND2_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n85 ) );
  AND2_X1 \byte_controller/bit_controller/U82  ( .A1(
        \byte_controller/bit_controller/N34 ), .A2(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  AND2_X1 \byte_controller/bit_controller/U81  ( .A1(
        \byte_controller/bit_controller/n23 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n78 ) );
  AND2_X1 \byte_controller/bit_controller/U80  ( .A1(prer[6]), .A2(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n77 ) );
  OR2_X2 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n98 ), .A2(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n214 ) );
  INV_X2 \byte_controller/bit_controller/U78  ( .A(
        \byte_controller/bit_controller/n73 ), .ZN(
        \byte_controller/bit_controller/n74 ) );
  INV_X1 \byte_controller/bit_controller/U77  ( .A(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  AND2_X1 \byte_controller/bit_controller/U76  ( .A1(
        \byte_controller/bit_controller/n137 ), .A2(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n72 ) );
  INV_X1 \byte_controller/bit_controller/U75  ( .A(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  INV_X1 \byte_controller/bit_controller/U74  ( .A(
        \byte_controller/bit_controller/n43 ), .ZN(
        \byte_controller/bit_controller/n71 ) );
  NAND4_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n181 ), .A2(
        \byte_controller/bit_controller/n180 ), .A3(
        \byte_controller/bit_controller/n178 ), .A4(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  OAI21_X1 \byte_controller/bit_controller/U72  ( .B1(
        \byte_controller/bit_controller/n182 ), .B2(
        \byte_controller/bit_controller/n183 ), .A(n158), .ZN(
        \byte_controller/bit_controller/n184 ) );
  OAI21_X1 \byte_controller/bit_controller/U71  ( .B1(
        \byte_controller/bit_controller/n65 ), .B2(
        \byte_controller/bit_controller/n60 ), .A(n158), .ZN(
        \byte_controller/bit_controller/n70 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U70  ( .A(
        \byte_controller/bit_controller/n222 ), .Z(
        \byte_controller/bit_controller/n69 ) );
  AND3_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n62 ), .A2(
        \byte_controller/bit_controller/n162 ), .A3(
        \byte_controller/bit_controller/n165 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  NAND4_X1 \byte_controller/bit_controller/U68  ( .A1(
        \byte_controller/bit_controller/n177 ), .A2(
        \byte_controller/bit_controller/n176 ), .A3(
        \byte_controller/bit_controller/n175 ), .A4(
        \byte_controller/bit_controller/n174 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  NOR2_X1 \byte_controller/bit_controller/U67  ( .A1(
        \byte_controller/bit_controller/n197 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/n179 ) );
  NAND4_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n181 ), .A2(
        \byte_controller/bit_controller/n178 ), .A3(
        \byte_controller/bit_controller/n28 ), .A4(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n65 ) );
  NOR2_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n31 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n75 ) );
  INV_X1 \byte_controller/bit_controller/U64  ( .A(
        \byte_controller/bit_controller/n63 ), .ZN(
        \byte_controller/bit_controller/n64 ) );
  OR3_X1 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n77 ), .A2(
        \byte_controller/bit_controller/n78 ), .A3(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n61 ) );
  NAND4_X1 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n177 ), .A2(
        \byte_controller/bit_controller/n176 ), .A3(
        \byte_controller/bit_controller/n175 ), .A4(
        \byte_controller/bit_controller/n174 ), .ZN(
        \byte_controller/bit_controller/n60 ) );
  AND2_X1 \byte_controller/bit_controller/U61  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  AND2_X1 \byte_controller/bit_controller/U60  ( .A1(
        \byte_controller/bit_controller/n93 ), .A2(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n176 ) );
  AND2_X1 \byte_controller/bit_controller/U59  ( .A1(
        \byte_controller/bit_controller/n101 ), .A2(
        \byte_controller/bit_controller/n102 ), .ZN(
        \byte_controller/bit_controller/n180 ) );
  NAND2_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n83 ), .A2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n52 ) );
  MUX2_X1 \byte_controller/bit_controller/U57  ( .A(
        \byte_controller/bit_controller/n51 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n52 ), .Z(
        \byte_controller/bit_controller/n50 ) );
  NOR2_X1 \byte_controller/bit_controller/U56  ( .A1(
        \byte_controller/bit_controller/n185 ), .A2(
        \byte_controller/bit_controller/N68 ), .ZN(
        \byte_controller/bit_controller/n49 ) );
  AND2_X1 \byte_controller/bit_controller/U55  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  OR4_X1 \byte_controller/bit_controller/U54  ( .A1(
        \byte_controller/bit_controller/n171 ), .A2(
        \byte_controller/bit_controller/n170 ), .A3(
        \byte_controller/bit_controller/n169 ), .A4(
        \byte_controller/bit_controller/n168 ), .ZN(
        \byte_controller/bit_controller/n48 ) );
  MUX2_X1 \byte_controller/bit_controller/U53  ( .A(scl_padoen_o), .B(
        \byte_controller/bit_controller/n48 ), .S(
        \byte_controller/bit_controller/n173 ), .Z(
        \byte_controller/bit_controller/n47 ) );
  OR2_X1 \byte_controller/bit_controller/U52  ( .A1(
        \byte_controller/bit_controller/n72 ), .A2(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  NOR2_X1 \byte_controller/bit_controller/U51  ( .A1(
        \byte_controller/bit_controller/cnt [0]), .A2(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/n181 ) );
  BUF_X1 \byte_controller/bit_controller/U50  ( .A(\byte_controller/n28 ), .Z(
        \byte_controller/bit_controller/n53 ) );
  BUF_X1 \byte_controller/bit_controller/U49  ( .A(
        \byte_controller/bit_controller/n53 ), .Z(
        \byte_controller/bit_controller/n59 ) );
  BUF_X1 \byte_controller/bit_controller/U48  ( .A(
        \byte_controller/bit_controller/n59 ), .Z(
        \byte_controller/bit_controller/n54 ) );
  BUF_X1 \byte_controller/bit_controller/U47  ( .A(
        \byte_controller/bit_controller/n58 ), .Z(
        \byte_controller/bit_controller/n57 ) );
  BUF_X1 \byte_controller/bit_controller/U46  ( .A(
        \byte_controller/bit_controller/n58 ), .Z(
        \byte_controller/bit_controller/n56 ) );
  BUF_X1 \byte_controller/bit_controller/U45  ( .A(
        \byte_controller/bit_controller/n58 ), .Z(
        \byte_controller/bit_controller/n55 ) );
  OAI211_X1 \byte_controller/bit_controller/U44  ( .C1(
        \byte_controller/bit_controller/n6 ), .C2(
        \byte_controller/bit_controller/n185 ), .A(
        \byte_controller/bit_controller/n2 ), .B(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n43 ) );
  BUF_X1 \byte_controller/bit_controller/U43  ( .A(
        \byte_controller/bit_controller/n53 ), .Z(
        \byte_controller/bit_controller/n58 ) );
  OAI21_X1 \byte_controller/bit_controller/U42  ( .B1(
        \byte_controller/bit_controller/n183 ), .B2(
        \byte_controller/bit_controller/n182 ), .A(n158), .ZN(
        \byte_controller/bit_controller/n42 ) );
  AND2_X1 \byte_controller/bit_controller/U41  ( .A1(
        \byte_controller/bit_controller/n40 ), .A2(
        \byte_controller/bit_controller/n41 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U40  ( .A(
        \byte_controller/bit_controller/n102 ), .ZN(
        \byte_controller/bit_controller/n38 ) );
  INV_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n36 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  INV_X1 \byte_controller/bit_controller/U38  ( .A(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n35 ) );
  AND2_X1 \byte_controller/bit_controller/U37  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n39 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  NOR3_X1 \byte_controller/bit_controller/U36  ( .A1(
        \byte_controller/bit_controller/n222 ), .A2(
        \byte_controller/bit_controller/n14 ), .A3(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n137 ) );
  AND2_X1 \byte_controller/bit_controller/U35  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n136 ), .ZN(
        \byte_controller/bit_controller/n33 ) );
  AND2_X1 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n33 ), .A2(
        \byte_controller/bit_controller/n3 ), .ZN(
        \byte_controller/bit_controller/n62 ) );
  NOR4_X1 \byte_controller/bit_controller/U33  ( .A1(
        \byte_controller/bit_controller/n135 ), .A2(
        \byte_controller/bit_controller/n168 ), .A3(
        \byte_controller/bit_controller/n134 ), .A4(
        \byte_controller/bit_controller/n133 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  OAI21_X1 \byte_controller/bit_controller/U32  ( .B1(
        \byte_controller/bit_controller/n65 ), .B2(
        \byte_controller/bit_controller/n60 ), .A(n158), .ZN(
        \byte_controller/bit_controller/n31 ) );
  NAND2_X1 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n219 ), .A2(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  CLKBUF_X3 \byte_controller/bit_controller/U30  ( .A(
        \byte_controller/bit_controller/n210 ), .Z(
        \byte_controller/bit_controller/n30 ) );
  INV_X1 \byte_controller/bit_controller/U29  ( .A(
        \byte_controller/bit_controller/n26 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U28  ( .A(
        \byte_controller/bit_controller/cnt [3]), .Z(
        \byte_controller/bit_controller/n25 ) );
  INV_X1 \byte_controller/bit_controller/U27  ( .A(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n24 ) );
  AND2_X2 \byte_controller/bit_controller/U26  ( .A1(
        \byte_controller/bit_controller/n42 ), .A2(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  NOR2_X1 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n31 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n22 ) );
  AND2_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n99 ), .A2(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  INV_X1 \byte_controller/bit_controller/U23  ( .A(
        \byte_controller/bit_controller/n20 ), .ZN(
        \byte_controller/bit_controller/n21 ) );
  INV_X1 \byte_controller/bit_controller/U22  ( .A(
        \byte_controller/bit_controller/n18 ), .ZN(
        \byte_controller/bit_controller/n19 ) );
  INV_X1 \byte_controller/bit_controller/U21  ( .A(
        \byte_controller/bit_controller/n16 ), .ZN(
        \byte_controller/bit_controller/n17 ) );
  BUF_X1 \byte_controller/bit_controller/U20  ( .A(
        \byte_controller/bit_controller/n210 ), .Z(
        \byte_controller/bit_controller/n29 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U19  ( .A(
        \byte_controller/bit_controller/n21 ), .Z(
        \byte_controller/bit_controller/n15 ) );
  OR2_X1 \byte_controller/bit_controller/U18  ( .A1(
        \byte_controller/bit_controller/n68 ), .A2(
        \byte_controller/bit_controller/n129 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  INV_X1 \byte_controller/bit_controller/U17  ( .A(
        \byte_controller/bit_controller/n29 ), .ZN(
        \byte_controller/bit_controller/n13 ) );
  INV_X1 \byte_controller/bit_controller/U16  ( .A(
        \byte_controller/bit_controller/n219 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  INV_X1 \byte_controller/bit_controller/U15  ( .A(
        \byte_controller/bit_controller/n10 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  AND2_X1 \byte_controller/bit_controller/U14  ( .A1(
        \byte_controller/bit_controller/n72 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U13  ( .A(
        \byte_controller/bit_controller/n113 ), .Z(
        \byte_controller/bit_controller/n8 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U12  ( .A(
        \byte_controller/bit_controller/n114 ), .Z(
        \byte_controller/bit_controller/n7 ) );
  INV_X1 \byte_controller/bit_controller/U11  ( .A(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n194 ) );
  INV_X1 \byte_controller/bit_controller/U10  ( .A(
        \byte_controller/bit_controller/n43 ), .ZN(
        \byte_controller/bit_controller/n5 ) );
  INV_X2 \byte_controller/bit_controller/U9  ( .A(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/n45 ) );
  AND2_X1 \byte_controller/bit_controller/U8  ( .A1(
        \byte_controller/bit_controller/n206 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n76 ) );
  AND2_X2 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n206 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n4 ) );
  BUF_X1 \byte_controller/bit_controller/U6  ( .A(
        \byte_controller/bit_controller/n62 ), .Z(
        \byte_controller/bit_controller/n66 ) );
  NOR3_X1 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n222 ), .A2(
        \byte_controller/bit_controller/n14 ), .A3(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  OAI21_X1 \byte_controller/bit_controller/U4  ( .B1(
        \byte_controller/bit_controller/n182 ), .B2(
        \byte_controller/bit_controller/n183 ), .A(n158), .ZN(
        \byte_controller/bit_controller/n2 ) );
  AND2_X2 \byte_controller/bit_controller/U3  ( .A1(
        \byte_controller/bit_controller/n42 ), .A2(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n1 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n235 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [1]), .QN(
        \byte_controller/bit_controller/n102 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n231 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n96 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/n10 ), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/n16 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n18 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/n28 ), .Q(\byte_controller/bit_controller/n129 ), 
        .QN(\byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n20 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n225 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n95 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n133 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n86 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/n28 ), .Q(\byte_controller/bit_controller/n140 ), 
        .QN(\byte_controller/bit_controller/n82 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n237 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n57 ), .Q(
        \byte_controller/bit_controller/n98 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n81 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n100 ), .QN(
        \byte_controller/bit_controller/n104 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n57 ), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n139 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n61 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n40 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n228 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n41 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n234 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n233 ), .CK(wb_clk_i), .RN(
        \byte_controller/n28 ), .Q(\byte_controller/bit_controller/cnt [3]), 
        .QN(\byte_controller/bit_controller/n44 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n236 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/cnt [0]), .QN(
        \byte_controller/bit_controller/n36 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N83 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n79 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n46 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .SN(
        \byte_controller/n28 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n138 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n131 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n94 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n229 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n92 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n226 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n26 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n130 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n93 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n227 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n34 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n128 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n91 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n230 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n39 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n169 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/n134 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n168 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n232 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n99 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n90 ), .QN(
        \byte_controller/bit_controller/n116 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/n63 ), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n55 ), .Q(
        \byte_controller/bit_controller/n68 ), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n185 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n47 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n57 ), .Q(scl_padoen_o) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n50 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n56 ), .QN(
        \byte_controller/bit_controller/n80 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N66 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n6 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n56 ), .Q(
        \byte_controller/bit_controller/n51 ), .QN(
        \byte_controller/bit_controller/n105 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U146  ( .A1(
        \byte_controller/bit_controller/sub_105/n129 ), .A2(
        \byte_controller/bit_controller/sub_105/n106 ), .A3(
        \byte_controller/bit_controller/sub_105/n103 ), .ZN(
        \byte_controller/bit_controller/sub_105/n126 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U145  ( .A1(
        \byte_controller/bit_controller/sub_105/n128 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .A3(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n127 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U144  ( .A1(
        \byte_controller/bit_controller/sub_105/n34 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U143  ( .A1(
        \byte_controller/bit_controller/sub_105/n123 ), .A2(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U142  ( .A1(
        \byte_controller/bit_controller/sub_105/n118 ), .A2(
        \byte_controller/bit_controller/sub_105/n119 ), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U141  ( .A(
        \byte_controller/bit_controller/sub_105/n116 ), .B(
        \byte_controller/bit_controller/sub_105/n117 ), .S(
        \byte_controller/bit_controller/cnt [10]), .Z(
        \byte_controller/bit_controller/N38 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U140  ( .A1(
        \byte_controller/bit_controller/sub_105/n103 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .A3(
        \byte_controller/bit_controller/sub_105/n115 ), .A4(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U139  ( .A1(
        \byte_controller/bit_controller/sub_105/n113 ), .A2(
        \byte_controller/bit_controller/sub_105/n48 ), .A3(
        \byte_controller/bit_controller/sub_105/n114 ), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U138  ( .A1(
        \byte_controller/bit_controller/sub_105/n111 ), .A2(
        \byte_controller/bit_controller/sub_105/n112 ), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n109 ), .A2(
        \byte_controller/bit_controller/sub_105/n97 ), .A3(
        \byte_controller/bit_controller/sub_105/n98 ), .A4(
        \byte_controller/bit_controller/sub_105/n110 ), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U136  ( .A(
        \byte_controller/bit_controller/sub_105/n107 ), .B(
        \byte_controller/bit_controller/sub_105/n108 ), .S(
        \byte_controller/bit_controller/cnt [11]), .Z(
        \byte_controller/bit_controller/N39 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U135  ( .A1(
        \byte_controller/bit_controller/sub_105/n103 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .A3(
        \byte_controller/bit_controller/sub_105/n105 ), .A4(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U134  ( .A1(
        \byte_controller/bit_controller/sub_105/n102 ), .A2(
        \byte_controller/bit_controller/N28 ), .A3(
        \byte_controller/bit_controller/sub_105/n55 ), .A4(
        \byte_controller/bit_controller/sub_105/n48 ), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n100 ), .A2(
        \byte_controller/bit_controller/sub_105/n101 ), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/sub_105/n97 ), .A3(
        \byte_controller/bit_controller/sub_105/n98 ), .A4(
        \byte_controller/bit_controller/sub_105/n99 ), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U131  ( .A(
        \byte_controller/bit_controller/sub_105/n94 ), .B(
        \byte_controller/bit_controller/sub_105/n95 ), .S(
        \byte_controller/bit_controller/cnt [12]), .Z(
        \byte_controller/bit_controller/N40 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U130  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n43 ), .A3(
        \byte_controller/bit_controller/sub_105/n92 ), .A4(
        \byte_controller/bit_controller/sub_105/n93 ), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n90 ), .A2(
        \byte_controller/bit_controller/N28 ), .A3(
        \byte_controller/bit_controller/sub_105/n91 ), .A4(
        \byte_controller/bit_controller/sub_105/n48 ), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n88 ), .A2(
        \byte_controller/bit_controller/sub_105/n89 ), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A1(
        \byte_controller/bit_controller/sub_105/n86 ), .A2(
        \byte_controller/bit_controller/sub_105/n87 ), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U126  ( .A1(
        \byte_controller/bit_controller/sub_105/n85 ), .A2(
        \byte_controller/bit_controller/sub_105/n3 ), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U125  ( .A1(
        \byte_controller/bit_controller/sub_105/n81 ), .A2(
        \byte_controller/bit_controller/sub_105/n82 ), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n80 ), .A2(
        \byte_controller/bit_controller/sub_105/n43 ), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U123  ( .A1(
        \byte_controller/bit_controller/sub_105/n71 ), .A2(
        \byte_controller/bit_controller/sub_105/n72 ), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U122  ( .A1(
        \byte_controller/bit_controller/sub_105/n70 ), .A2(
        \byte_controller/bit_controller/sub_105/n130 ), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U121  ( .A1(
        \byte_controller/bit_controller/sub_105/n66 ), .A2(
        \byte_controller/bit_controller/sub_105/n67 ), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U120  ( .A1(
        \byte_controller/bit_controller/sub_105/n64 ), .A2(
        \byte_controller/bit_controller/sub_105/n65 ), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U119  ( .A1(
        \byte_controller/bit_controller/sub_105/n60 ), .A2(
        \byte_controller/bit_controller/sub_105/n61 ), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U118  ( .A(
        \byte_controller/bit_controller/sub_105/n59 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U117  ( .A1(
        \byte_controller/bit_controller/sub_105/n12 ), .A2(
        \byte_controller/bit_controller/sub_105/n6 ), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U116  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .A3(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U115  ( .A1(
        \byte_controller/bit_controller/sub_105/n3 ), .A2(
        \byte_controller/bit_controller/sub_105/n48 ), .A3(
        \byte_controller/bit_controller/sub_105/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U114  ( .A(
        \byte_controller/bit_controller/sub_105/n44 ), .B(
        \byte_controller/bit_controller/sub_105/n45 ), .S(
        \byte_controller/bit_controller/cnt [5]), .Z(
        \byte_controller/bit_controller/N33 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U113  ( .A1(
        \byte_controller/bit_controller/sub_105/n41 ), .A2(
        \byte_controller/bit_controller/N28 ), .A3(
        \byte_controller/bit_controller/sub_105/n42 ), .A4(
        \byte_controller/bit_controller/sub_105/n43 ), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U112  ( .A(
        \byte_controller/bit_controller/sub_105/n40 ), .B(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U111  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n35 ), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U110  ( .A1(
        \byte_controller/bit_controller/sub_105/n33 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A1(
        \byte_controller/bit_controller/sub_105/n30 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/sub_105/n25 ), .A2(
        \byte_controller/bit_controller/sub_105/n92 ), .ZN(
        \byte_controller/bit_controller/sub_105/n28 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U107  ( .A1(
        \byte_controller/bit_controller/sub_105/n36 ), .A2(
        \byte_controller/bit_controller/sub_105/n37 ), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A(
        \byte_controller/bit_controller/sub_105/n26 ), .B(
        \byte_controller/bit_controller/sub_105/n27 ), .S(
        \byte_controller/bit_controller/cnt [8]), .Z(
        \byte_controller/bit_controller/N36 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/sub_105/n23 ), .A2(
        \byte_controller/bit_controller/sub_105/n24 ), .A3(
        \byte_controller/bit_controller/sub_105/n25 ), .ZN(
        \byte_controller/bit_controller/sub_105/n20 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U104  ( .A1(
        \byte_controller/bit_controller/sub_105/n22 ), .A2(
        \byte_controller/bit_controller/sub_105/n113 ), .ZN(
        \byte_controller/bit_controller/sub_105/n21 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U103  ( .A1(
        \byte_controller/bit_controller/sub_105/n19 ), .A2(
        \byte_controller/bit_controller/sub_105/n18 ), .A3(
        \byte_controller/bit_controller/sub_105/n17 ), .ZN(
        \byte_controller/bit_controller/sub_105/n16 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U102  ( .A(
        \byte_controller/bit_controller/sub_105/n15 ), .B(
        \byte_controller/bit_controller/sub_105/n16 ), .S(
        \byte_controller/bit_controller/cnt [9]), .Z(
        \byte_controller/bit_controller/N37 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U101  ( .A(
        \byte_controller/bit_controller/sub_105/n73 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U100  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U98  ( .A1(
        \byte_controller/bit_controller/sub_105/n1 ), .A2(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U97  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U96  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U95  ( .A(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U94  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/n45 ), .A3(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U93  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n128 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U91  ( .A1(
        \byte_controller/bit_controller/sub_105/n14 ), .A2(
        \byte_controller/bit_controller/cnt [11]), .A3(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U90  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U89  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n6 ), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U88  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n6 ), .ZN(
        \byte_controller/bit_controller/sub_105/n22 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U87  ( .A1(
        \byte_controller/bit_controller/cnt [10]), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U86  ( .A1(
        \byte_controller/bit_controller/cnt [10]), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/sub_105/n6 ), .A2(
        \byte_controller/bit_controller/sub_105/n11 ), .A3(
        \byte_controller/bit_controller/sub_105/n12 ), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U84  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U83  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U82  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U81  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U80  ( .A1(
        \byte_controller/bit_controller/sub_105/n10 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .A3(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U79  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n25 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n17 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U77  ( .A(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U76  ( .A1(
        \byte_controller/bit_controller/sub_105/n10 ), .A2(
        \byte_controller/bit_controller/sub_105/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U75  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U74  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U73  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U71  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U70  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U69  ( .A1(
        \byte_controller/bit_controller/sub_105/n130 ), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n125 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U68  ( .B1(
        \byte_controller/bit_controller/sub_105/n74 ), .B2(
        \byte_controller/bit_controller/sub_105/n75 ), .A(
        \byte_controller/bit_controller/sub_105/n73 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U67  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U66  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [8]), .A3(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n18 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U65  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n23 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U64  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U63  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U62  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U61  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U60  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U59  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U58  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U57  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U56  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n129 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U55  ( .A(
        \byte_controller/bit_controller/sub_105/n56 ), .B(
        \byte_controller/bit_controller/sub_105/n11 ), .ZN(
        \byte_controller/bit_controller/N30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U54  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U53  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U52  ( .A(
        \byte_controller/bit_controller/n37 ), .Z(
        \byte_controller/bit_controller/sub_105/n13 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U51  ( .B1(
        \byte_controller/bit_controller/sub_105/n54 ), .B2(
        \byte_controller/bit_controller/sub_105/n2 ), .A(
        \byte_controller/bit_controller/sub_105/n51 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U50  ( .A1(
        \byte_controller/bit_controller/sub_105/n77 ), .A2(
        \byte_controller/bit_controller/sub_105/n76 ), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U49  ( .B1(
        \byte_controller/bit_controller/sub_105/n31 ), .B2(
        \byte_controller/bit_controller/sub_105/n32 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U48  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U47  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U46  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U45  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U44  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U43  ( .A(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n12 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U42  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n11 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U41  ( .A1(
        \byte_controller/bit_controller/sub_105/n124 ), .A2(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U40  ( .A1(
        \byte_controller/bit_controller/sub_105/n84 ), .A2(
        \byte_controller/bit_controller/sub_105/n83 ), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U39  ( .A1(
        \byte_controller/bit_controller/sub_105/n79 ), .A2(
        \byte_controller/bit_controller/sub_105/n78 ), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U38  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U37  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U36  ( .A1(
        \byte_controller/bit_controller/sub_105/n58 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U35  ( .A1(
        \byte_controller/bit_controller/sub_105/n46 ), .A2(
        \byte_controller/bit_controller/sub_105/n47 ), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U34  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U33  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U32  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U31  ( .A1(
        \byte_controller/bit_controller/sub_105/n36 ), .A2(
        \byte_controller/bit_controller/sub_105/n37 ), .A3(
        \byte_controller/bit_controller/sub_105/n38 ), .A4(
        \byte_controller/bit_controller/sub_105/n39 ), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U30  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U29  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U28  ( .A1(
        \byte_controller/bit_controller/sub_105/n62 ), .A2(
        \byte_controller/bit_controller/sub_105/n63 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U27  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n9 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U26  ( .A1(
        \byte_controller/bit_controller/sub_105/n14 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n8 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U25  ( .A1(
        \byte_controller/bit_controller/sub_105/n8 ), .A2(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n19 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U24  ( .A1(
        \byte_controller/bit_controller/sub_105/n122 ), .A2(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U23  ( .A1(
        \byte_controller/bit_controller/sub_105/n120 ), .A2(
        \byte_controller/bit_controller/sub_105/n121 ), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U22  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n24 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U21  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/sub_105/n21 ), .ZN(
        \byte_controller/bit_controller/sub_105/n15 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U20  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U19  ( .A1(
        \byte_controller/bit_controller/sub_105/n53 ), .A2(
        \byte_controller/bit_controller/sub_105/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U18  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U17  ( .A1(
        \byte_controller/bit_controller/sub_105/n68 ), .A2(
        \byte_controller/bit_controller/sub_105/n69 ), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U16  ( .A1(
        \byte_controller/bit_controller/sub_105/n126 ), .A2(
        \byte_controller/bit_controller/sub_105/n127 ), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U15  ( .A1(
        \byte_controller/bit_controller/sub_105/n28 ), .A2(
        \byte_controller/bit_controller/sub_105/n29 ), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U14  ( .A1(
        \byte_controller/bit_controller/sub_105/n45 ), .A2(
        \byte_controller/bit_controller/sub_105/n50 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U13  ( .A1(
        \byte_controller/bit_controller/sub_105/n56 ), .A2(
        \byte_controller/bit_controller/sub_105/n57 ), .ZN(
        \byte_controller/bit_controller/N29 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U12  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U11  ( .A(
        \byte_controller/bit_controller/sub_105/n13 ), .ZN(
        \byte_controller/bit_controller/sub_105/n130 ) );
  INV_X2 \byte_controller/bit_controller/sub_105/U10  ( .A(
        \byte_controller/bit_controller/sub_105/n13 ), .ZN(
        \byte_controller/bit_controller/N28 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U9  ( .A(
        \byte_controller/bit_controller/n37 ), .Z(
        \byte_controller/bit_controller/sub_105/n14 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U8  ( .A(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/sub_105/n3 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U7  ( .A(
        \byte_controller/bit_controller/sub_105/n43 ), .Z(
        \byte_controller/bit_controller/sub_105/n2 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U6  ( .A(
        \byte_controller/bit_controller/n37 ), .Z(
        \byte_controller/bit_controller/sub_105/n7 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U5  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n10 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U4  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n1 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U3  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n4 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/n37 ), .Z(
        \byte_controller/bit_controller/sub_105/n6 ) );
endmodule

