/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 03:34:15 2026
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
  wire   N13, sr_1, sr_0, N21, N22, N23, N24, N25, N26, N27, N28, done, i2c_al,
         irxack, N103, N104, N105, N106, N110, n1, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n40, n41, n42, n43, n117, n118,
         n119, n120, n121, n122, n123, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249,
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
         \byte_controller/n29 , \byte_controller/n26 , \byte_controller/n25 ,
         \byte_controller/n24 , \byte_controller/n23 , \byte_controller/n22 ,
         \byte_controller/n21 , \byte_controller/n20 , \byte_controller/n19 ,
         \byte_controller/n17 , \byte_controller/n16 , \byte_controller/n14 ,
         \byte_controller/n13 , \byte_controller/n12 , \byte_controller/n11 ,
         \byte_controller/n10 , \byte_controller/n9 , \byte_controller/n8 ,
         \byte_controller/n7 , \byte_controller/n5 , \byte_controller/n4 ,
         \byte_controller/n3 , \byte_controller/n2 , \byte_controller/n1 ,
         \byte_controller/n99 , \byte_controller/n98 , \byte_controller/n97 ,
         \byte_controller/n96 , \byte_controller/n95 , \byte_controller/n94 ,
         \byte_controller/n93 , \byte_controller/n92 , \byte_controller/n91 ,
         \byte_controller/n90 , \byte_controller/n89 , \byte_controller/n88 ,
         \byte_controller/n87 , \byte_controller/n86 , \byte_controller/n85 ,
         \byte_controller/n84 , \byte_controller/n83 , \byte_controller/n82 ,
         \byte_controller/n81 , \byte_controller/n80 , \byte_controller/n79 ,
         \byte_controller/n28 , \byte_controller/n27 , \byte_controller/n18 ,
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
         \byte_controller/bit_controller/sub_105/n136 ,
         \byte_controller/bit_controller/sub_105/n135 ,
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
         \byte_controller/bit_controller/sub_105/n14 ,
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
         \byte_controller/bit_controller/sub_105/n1 ,
         \byte_controller/bit_controller/sub_105/n137 ;
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

  DFF_X1 wb_ack_o_reg ( .D(N13), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \ctr_reg[7]  ( .D(n148), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[6]  ( .D(n147), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[5]  ( .D(n146), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n5) );
  DFFR_X1 \ctr_reg[4]  ( .D(n145), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[3]  ( .D(n144), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n7) );
  DFFR_X1 \ctr_reg[2]  ( .D(n143), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n8) );
  DFFR_X1 \ctr_reg[1]  ( .D(n142), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n9) );
  DFFR_X1 \ctr_reg[0]  ( .D(n141), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n10) );
  DFFS_X1 \prer_reg[15]  ( .D(n249), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n150) );
  DFFS_X1 \prer_reg[14]  ( .D(n248), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n149) );
  DFFS_X1 \prer_reg[13]  ( .D(n247), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n188) );
  DFFS_X1 \prer_reg[12]  ( .D(n246), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n186) );
  DFFS_X1 \prer_reg[11]  ( .D(n245), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n184) );
  DFFS_X1 \prer_reg[10]  ( .D(n244), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n182) );
  DFFS_X1 \prer_reg[9]  ( .D(n243), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n180) );
  DFFS_X1 \prer_reg[8]  ( .D(n242), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n178) );
  DFFS_X1 \prer_reg[7]  ( .D(n132), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n27) );
  DFFS_X1 \prer_reg[6]  ( .D(n131), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n28) );
  DFFS_X1 \prer_reg[5]  ( .D(n130), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n29) );
  DFFS_X1 \prer_reg[4]  ( .D(n129), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n30) );
  DFFS_X1 \prer_reg[3]  ( .D(n128), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n31) );
  DFFS_X1 \prer_reg[2]  ( .D(n127), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n32) );
  DFFS_X1 \prer_reg[1]  ( .D(n126), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n33) );
  DFFS_X1 \prer_reg[0]  ( .D(n125), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n34) );
  DFFR_X1 \cr_reg[3]  ( .D(n158), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N27), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N25), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N24), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N23), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFR_X1 al_reg ( .D(N103), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N26), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N104), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N28), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N105), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N22), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFFR_X1 irq_flag_reg ( .D(N106), .CK(wb_clk_i), .RN(arst_i), .Q(sr_0), .QN(
        n43) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N21), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N110), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 \cr_reg[6]  ( .D(n121), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n36) );
  DFFR_X1 \cr_reg[4]  ( .D(n123), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n38) );
  DFFR_X1 \cr_reg[5]  ( .D(n122), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n37) );
  DFFR_X1 \txr_reg[4]  ( .D(n137), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n14) );
  DFFR_X1 \txr_reg[3]  ( .D(n136), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n15) );
  DFFR_X1 \txr_reg[2]  ( .D(n135), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n16) );
  DFFR_X1 \txr_reg[7]  ( .D(n140), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n11) );
  DFFR_X1 \txr_reg[6]  ( .D(n139), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n12) );
  DFFR_X1 \txr_reg[5]  ( .D(n138), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n13) );
  DFFR_X1 \txr_reg[1]  ( .D(n134), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n17) );
  DFFR_X1 \txr_reg[0]  ( .D(n133), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n18) );
  DFFR_X1 \cr_reg[0]  ( .D(n117), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n42) );
  DFFR_X1 \cr_reg[2]  ( .D(n119), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]), .QN(
        n40) );
  DFFR_X1 \cr_reg[7]  ( .D(n120), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n35) );
  DFFR_X1 \cr_reg[1]  ( .D(n118), .CK(wb_clk_i), .RN(arst_i), .QN(n41) );
  AND2_X1 U131 ( .A1(n194), .A2(n168), .ZN(n151) );
  AND2_X1 U132 ( .A1(n194), .A2(n160), .ZN(n152) );
  AND3_X1 U133 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n153) );
  INV_X1 U134 ( .A(n3), .ZN(n154) );
  OAI21_X1 U135 ( .B1(n153), .B2(n157), .A(n156), .ZN(n155) );
  OAI21_X1 U136 ( .B1(n153), .B2(n157), .A(n156), .ZN(n166) );
  AND2_X2 U137 ( .A1(n165), .A2(n232), .ZN(n156) );
  NAND3_X1 U138 ( .A1(n199), .A2(n177), .A3(n197), .ZN(n241) );
  NOR2_X1 U139 ( .A1(i2c_al), .A2(done), .ZN(n157) );
  MUX2_X1 U140 ( .A(n159), .B(cr[3]), .S(n156), .Z(n158) );
  AND2_X1 U141 ( .A1(wb_dat_i[3]), .A2(n194), .ZN(n159) );
  INV_X1 U142 ( .A(wb_rst_i), .ZN(n232) );
  AND3_X1 U143 ( .A1(wb_adr_i[0]), .A2(n177), .A3(n197), .ZN(n160) );
  INV_X1 U145 ( .A(wb_dat_i[0]), .ZN(n195) );
  NAND2_X1 U146 ( .A1(n153), .A2(n232), .ZN(n164) );
  INV_X1 U147 ( .A(n164), .ZN(n194) );
  INV_X1 U148 ( .A(wb_adr_i[2]), .ZN(n177) );
  NAND3_X1 U149 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[1]), .A3(n177), .ZN(n196) );
  OAI21_X1 U150 ( .B1(n196), .B2(n164), .A(n232), .ZN(n162) );
  NAND2_X1 U151 ( .A1(n194), .A2(n162), .ZN(n163) );
  OAI22_X1 U152 ( .A1(n195), .A2(n163), .B1(n18), .B2(n162), .ZN(n133) );
  INV_X1 U153 ( .A(wb_dat_i[1]), .ZN(n204) );
  OAI22_X1 U154 ( .A1(n204), .A2(n163), .B1(n17), .B2(n162), .ZN(n134) );
  INV_X1 U155 ( .A(wb_dat_i[2]), .ZN(n210) );
  OAI22_X1 U156 ( .A1(n210), .A2(n163), .B1(n16), .B2(n162), .ZN(n135) );
  INV_X1 U157 ( .A(wb_dat_i[3]), .ZN(n213) );
  OAI22_X1 U158 ( .A1(n213), .A2(n163), .B1(n15), .B2(n162), .ZN(n136) );
  INV_X1 U159 ( .A(wb_dat_i[4]), .ZN(n216) );
  OAI22_X1 U160 ( .A1(n216), .A2(n163), .B1(n14), .B2(n162), .ZN(n137) );
  INV_X1 U161 ( .A(wb_dat_i[5]), .ZN(n224) );
  OAI22_X1 U162 ( .A1(n224), .A2(n163), .B1(n13), .B2(n162), .ZN(n138) );
  INV_X1 U163 ( .A(wb_dat_i[6]), .ZN(n193) );
  OAI22_X1 U164 ( .A1(n193), .A2(n163), .B1(n12), .B2(n162), .ZN(n139) );
  INV_X1 U165 ( .A(wb_dat_i[7]), .ZN(n191) );
  OAI22_X1 U166 ( .A1(n191), .A2(n163), .B1(n11), .B2(n162), .ZN(n140) );
  INV_X1 U167 ( .A(wb_adr_i[0]), .ZN(n199) );
  NAND3_X1 U168 ( .A1(wb_adr_i[1]), .A2(n199), .A3(n177), .ZN(n200) );
  OAI21_X1 U169 ( .B1(n200), .B2(n164), .A(n232), .ZN(n223) );
  NAND2_X1 U170 ( .A1(n194), .A2(n223), .ZN(n225) );
  OAI22_X1 U171 ( .A1(n225), .A2(n191), .B1(n3), .B2(n223), .ZN(n148) );
  INV_X1 U172 ( .A(wb_adr_i[1]), .ZN(n197) );
  NAND3_X1 U173 ( .A1(wb_adr_i[2]), .A2(n199), .A3(n197), .ZN(n198) );
  INV_X1 U174 ( .A(n198), .ZN(n237) );
  NAND3_X1 U175 ( .A1(ctr[7]), .A2(n237), .A3(n194), .ZN(n165) );
  NAND2_X1 U176 ( .A1(n194), .A2(n166), .ZN(n167) );
  OAI22_X1 U177 ( .A1(n216), .A2(n167), .B1(n38), .B2(n155), .ZN(n123) );
  OAI22_X1 U178 ( .A1(n224), .A2(n167), .B1(n37), .B2(n155), .ZN(n122) );
  OAI22_X1 U179 ( .A1(n193), .A2(n167), .B1(n36), .B2(n155), .ZN(n121) );
  OAI22_X1 U180 ( .A1(n167), .A2(n191), .B1(n35), .B2(n155), .ZN(n120) );
  INV_X1 U181 ( .A(n241), .ZN(n168) );
  MUX2_X1 U182 ( .A(n34), .B(n195), .S(n151), .Z(n169) );
  NAND2_X1 U183 ( .A1(n232), .A2(n169), .ZN(n125) );
  MUX2_X1 U184 ( .A(n33), .B(n204), .S(n151), .Z(n170) );
  NAND2_X1 U185 ( .A1(n232), .A2(n170), .ZN(n126) );
  MUX2_X1 U186 ( .A(n32), .B(n210), .S(n151), .Z(n171) );
  NAND2_X1 U187 ( .A1(n232), .A2(n171), .ZN(n127) );
  MUX2_X1 U188 ( .A(n31), .B(n213), .S(n151), .Z(n172) );
  NAND2_X1 U189 ( .A1(n232), .A2(n172), .ZN(n128) );
  MUX2_X1 U190 ( .A(n30), .B(n216), .S(n151), .Z(n173) );
  NAND2_X1 U191 ( .A1(n232), .A2(n173), .ZN(n129) );
  MUX2_X1 U192 ( .A(n29), .B(n224), .S(n151), .Z(n174) );
  NAND2_X1 U193 ( .A1(n232), .A2(n174), .ZN(n130) );
  MUX2_X1 U194 ( .A(n28), .B(n193), .S(n151), .Z(n175) );
  NAND2_X1 U195 ( .A1(n232), .A2(n175), .ZN(n131) );
  MUX2_X1 U196 ( .A(n27), .B(n191), .S(n151), .Z(n176) );
  NAND2_X1 U197 ( .A1(n232), .A2(n176), .ZN(n132) );
  MUX2_X1 U198 ( .A(n178), .B(n195), .S(n152), .Z(n179) );
  NAND2_X1 U199 ( .A1(n232), .A2(n179), .ZN(n242) );
  MUX2_X1 U200 ( .A(n180), .B(n204), .S(n152), .Z(n181) );
  NAND2_X1 U201 ( .A1(n232), .A2(n181), .ZN(n243) );
  MUX2_X1 U202 ( .A(n182), .B(n210), .S(n152), .Z(n183) );
  NAND2_X1 U203 ( .A1(n232), .A2(n183), .ZN(n244) );
  MUX2_X1 U204 ( .A(n184), .B(n213), .S(n152), .Z(n185) );
  NAND2_X1 U205 ( .A1(n232), .A2(n185), .ZN(n245) );
  MUX2_X1 U206 ( .A(n186), .B(n216), .S(n152), .Z(n187) );
  NAND2_X1 U207 ( .A1(n232), .A2(n187), .ZN(n246) );
  MUX2_X1 U208 ( .A(n188), .B(n224), .S(n152), .Z(n189) );
  NAND2_X1 U209 ( .A1(n232), .A2(n189), .ZN(n247) );
  MUX2_X1 U210 ( .A(n149), .B(n193), .S(n152), .Z(n190) );
  NAND2_X1 U211 ( .A1(n232), .A2(n190), .ZN(n248) );
  MUX2_X1 U212 ( .A(n150), .B(n191), .S(n152), .Z(n192) );
  NAND2_X1 U213 ( .A1(n232), .A2(n192), .ZN(n249) );
  OAI22_X1 U214 ( .A1(n225), .A2(n193), .B1(n4), .B2(n223), .ZN(n147) );
  NAND2_X1 U215 ( .A1(n156), .A2(n153), .ZN(n209) );
  NAND2_X1 U216 ( .A1(n194), .A2(n209), .ZN(n208) );
  OAI22_X1 U217 ( .A1(n42), .A2(n209), .B1(n208), .B2(n195), .ZN(n117) );
  AOI211_X1 U218 ( .C1(n43), .C2(n157), .A(cr[0]), .B(wb_rst_i), .ZN(N106) );
  NOR3_X1 U219 ( .A1(n43), .A2(n4), .A3(wb_rst_i), .ZN(N110) );
  AND3_X1 U220 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N13) );
  OAI22_X1 U221 ( .A1(n225), .A2(n195), .B1(n10), .B2(n223), .ZN(n141) );
  INV_X1 U222 ( .A(n200), .ZN(n233) );
  AOI22_X1 U223 ( .A1(prer[8]), .A2(n160), .B1(ctr[0]), .B2(n233), .ZN(n203)
         );
  INV_X1 U224 ( .A(n196), .ZN(n238) );
  NAND3_X1 U225 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[2]), .A3(n197), .ZN(n235) );
  NAND4_X1 U226 ( .A1(n200), .A2(n199), .A3(n241), .A4(n198), .ZN(n234) );
  OAI22_X1 U227 ( .A1(n18), .A2(n235), .B1(n42), .B2(n234), .ZN(n201) );
  AOI221_X1 U228 ( .B1(rxr[0]), .B2(n238), .C1(sr_0), .C2(n237), .A(n201), 
        .ZN(n202) );
  OAI211_X1 U229 ( .C1(n34), .C2(n241), .A(n203), .B(n202), .ZN(N21) );
  OAI22_X1 U230 ( .A1(n41), .A2(n209), .B1(n208), .B2(n204), .ZN(n118) );
  AOI21_X1 U231 ( .B1(n37), .B2(n38), .A(wb_rst_i), .ZN(N105) );
  OAI22_X1 U232 ( .A1(n225), .A2(n204), .B1(n9), .B2(n223), .ZN(n142) );
  AOI22_X1 U233 ( .A1(prer[9]), .A2(n160), .B1(ctr[1]), .B2(n233), .ZN(n207)
         );
  OAI22_X1 U234 ( .A1(n17), .A2(n235), .B1(n41), .B2(n234), .ZN(n205) );
  AOI221_X1 U235 ( .B1(rxr[1]), .B2(n238), .C1(sr_1), .C2(n237), .A(n205), 
        .ZN(n206) );
  OAI211_X1 U236 ( .C1(n33), .C2(n241), .A(n207), .B(n206), .ZN(N22) );
  OAI22_X1 U237 ( .A1(n40), .A2(n209), .B1(n210), .B2(n208), .ZN(n119) );
  OAI22_X1 U238 ( .A1(n225), .A2(n210), .B1(n8), .B2(n223), .ZN(n143) );
  AOI22_X1 U239 ( .A1(prer[10]), .A2(n160), .B1(ctr[2]), .B2(n233), .ZN(n212)
         );
  INV_X1 U240 ( .A(n234), .ZN(n218) );
  INV_X1 U241 ( .A(n235), .ZN(n217) );
  AOI222_X1 U242 ( .A1(rxr[2]), .A2(n238), .B1(cr[2]), .B2(n218), .C1(txr[2]), 
        .C2(n217), .ZN(n211) );
  OAI211_X1 U243 ( .C1(n32), .C2(n241), .A(n212), .B(n211), .ZN(N23) );
  OAI22_X1 U244 ( .A1(n225), .A2(n213), .B1(n7), .B2(n223), .ZN(n144) );
  AOI22_X1 U245 ( .A1(prer[11]), .A2(n160), .B1(ctr[3]), .B2(n233), .ZN(n215)
         );
  AOI222_X1 U246 ( .A1(rxr[3]), .A2(n238), .B1(cr[3]), .B2(n218), .C1(txr[3]), 
        .C2(n217), .ZN(n214) );
  OAI211_X1 U247 ( .C1(n31), .C2(n241), .A(n215), .B(n214), .ZN(N24) );
  OAI22_X1 U248 ( .A1(n225), .A2(n216), .B1(n6), .B2(n223), .ZN(n145) );
  AOI22_X1 U249 ( .A1(prer[12]), .A2(n160), .B1(ctr[4]), .B2(n233), .ZN(n220)
         );
  AOI222_X1 U250 ( .A1(rxr[4]), .A2(n238), .B1(cr[4]), .B2(n218), .C1(txr[4]), 
        .C2(n217), .ZN(n219) );
  OAI211_X1 U251 ( .C1(n30), .C2(n241), .A(n220), .B(n219), .ZN(N25) );
  NAND2_X1 U252 ( .A1(n35), .A2(sr[5]), .ZN(n222) );
  INV_X1 U253 ( .A(i2c_al), .ZN(n221) );
  AOI21_X1 U254 ( .B1(n222), .B2(n221), .A(wb_rst_i), .ZN(N103) );
  OAI22_X1 U255 ( .A1(n225), .A2(n224), .B1(n5), .B2(n223), .ZN(n146) );
  AOI22_X1 U256 ( .A1(prer[13]), .A2(n160), .B1(ctr[5]), .B2(n233), .ZN(n228)
         );
  OAI22_X1 U257 ( .A1(n13), .A2(n235), .B1(n37), .B2(n234), .ZN(n226) );
  AOI221_X1 U258 ( .B1(rxr[5]), .B2(n238), .C1(sr[5]), .C2(n237), .A(n226), 
        .ZN(n227) );
  OAI211_X1 U259 ( .C1(n29), .C2(n241), .A(n228), .B(n227), .ZN(N26) );
  AOI22_X1 U260 ( .A1(prer[14]), .A2(n160), .B1(ctr[6]), .B2(n233), .ZN(n231)
         );
  OAI22_X1 U261 ( .A1(n12), .A2(n235), .B1(n36), .B2(n234), .ZN(n229) );
  AOI221_X1 U262 ( .B1(rxr[6]), .B2(n238), .C1(sr[6]), .C2(n237), .A(n229), 
        .ZN(n230) );
  OAI211_X1 U263 ( .C1(n28), .C2(n241), .A(n231), .B(n230), .ZN(N27) );
  AND2_X1 U264 ( .A1(irxack), .A2(n232), .ZN(N104) );
  AOI22_X1 U265 ( .A1(prer[15]), .A2(n160), .B1(ctr[7]), .B2(n233), .ZN(n240)
         );
  OAI22_X1 U266 ( .A1(n11), .A2(n235), .B1(n35), .B2(n234), .ZN(n236) );
  AOI221_X1 U267 ( .B1(rxr[7]), .B2(n238), .C1(sr[7]), .C2(n237), .A(n236), 
        .ZN(n239) );
  OAI211_X1 U268 ( .C1(n27), .C2(n241), .A(n240), .B(n239), .ZN(N28) );
  NOR2_X1 \byte_controller/U136  ( .A1(\byte_controller/n153 ), .A2(
        \byte_controller/n152 ), .ZN(\byte_controller/n79 ) );
  NAND3_X1 \byte_controller/U135  ( .A1(\byte_controller/n148 ), .A2(
        \byte_controller/n147 ), .A3(\byte_controller/n146 ), .ZN(
        \byte_controller/n80 ) );
  NAND3_X1 \byte_controller/U134  ( .A1(\byte_controller/core_cmd [3]), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/n2 ), .ZN(
        \byte_controller/n146 ) );
  OAI221_X1 \byte_controller/U133  ( .B1(\byte_controller/n144 ), .B2(
        \byte_controller/n143 ), .C1(\byte_controller/n142 ), .C2(
        \byte_controller/c_state [2]), .A(\byte_controller/n141 ), .ZN(
        \byte_controller/n148 ) );
  OAI21_X1 \byte_controller/U132  ( .B1(\byte_controller/n140 ), .B2(
        \byte_controller/n139 ), .A(\byte_controller/n138 ), .ZN(
        \byte_controller/n141 ) );
  INV_X1 \byte_controller/U131  ( .A(\byte_controller/n140 ), .ZN(
        \byte_controller/n142 ) );
  INV_X1 \byte_controller/U130  ( .A(\byte_controller/n10 ), .ZN(
        \byte_controller/n143 ) );
  INV_X1 \byte_controller/U129  ( .A(\byte_controller/n136 ), .ZN(
        \byte_controller/n144 ) );
  OR3_X1 \byte_controller/U128  ( .A1(\byte_controller/n135 ), .A2(
        \byte_controller/n133 ), .A3(\byte_controller/n134 ), .ZN(
        \byte_controller/n81 ) );
  OAI33_X1 \byte_controller/U127  ( .A1(\byte_controller/n19 ), .A2(
        \byte_controller/n152 ), .A3(\byte_controller/n132 ), .B1(
        \byte_controller/n19 ), .B2(\byte_controller/n152 ), .B3(
        \byte_controller/n131 ), .ZN(\byte_controller/n133 ) );
  INV_X1 \byte_controller/U126  ( .A(\byte_controller/n129 ), .ZN(
        \byte_controller/n135 ) );
  NAND2_X1 \byte_controller/U125  ( .A1(\byte_controller/n128 ), .A2(
        \byte_controller/n127 ), .ZN(\byte_controller/n82 ) );
  OR3_X1 \byte_controller/U124  ( .A1(\byte_controller/n130 ), .A2(
        \byte_controller/n28 ), .A3(\byte_controller/n152 ), .ZN(
        \byte_controller/n127 ) );
  NAND2_X1 \byte_controller/U123  ( .A1(\byte_controller/n126 ), .A2(
        \byte_controller/n125 ), .ZN(\byte_controller/n83 ) );
  NAND3_X1 \byte_controller/U122  ( .A1(\byte_controller/n2 ), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/core_cmd [0]), .ZN(
        \byte_controller/n125 ) );
  AOI21_X1 \byte_controller/U121  ( .B1(\byte_controller/n124 ), .B2(
        \byte_controller/n149 ), .A(\byte_controller/n152 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U120  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n149 ) );
  AOI22_X1 \byte_controller/U119  ( .A1(cr[3]), .A2(\byte_controller/n123 ), 
        .B1(\byte_controller/n122 ), .B2(rxr[7]), .ZN(\byte_controller/n124 )
         );
  NAND3_X1 \byte_controller/U118  ( .A1(\byte_controller/n121 ), .A2(
        \byte_controller/n120 ), .A3(\byte_controller/n119 ), .ZN(
        \byte_controller/n122 ) );
  AOI221_X1 \byte_controller/U117  ( .B1(\byte_controller/n16 ), .B2(
        \byte_controller/n139 ), .C1(\byte_controller/n117 ), .C2(
        \byte_controller/c_state [1]), .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n119 ) );
  OAI21_X1 \byte_controller/U116  ( .B1(\byte_controller/n117 ), .B2(
        \byte_controller/n139 ), .A(\byte_controller/n16 ), .ZN(
        \byte_controller/n123 ) );
  OAI221_X1 \byte_controller/U115  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n7 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n114 ), .A(\byte_controller/n113 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U114  ( .A1(txr[7]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n113 ) );
  OAI221_X1 \byte_controller/U113  ( .B1(\byte_controller/n114 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n111 ), .A(\byte_controller/n110 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U112  ( .A1(txr[6]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n110 ) );
  OAI221_X1 \byte_controller/U111  ( .B1(\byte_controller/n111 ), .B2(
        \byte_controller/n7 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n109 ), .A(\byte_controller/n108 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U110  ( .A1(txr[5]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n108 ) );
  OAI221_X1 \byte_controller/U109  ( .B1(\byte_controller/n109 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n107 ), .A(\byte_controller/n106 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U108  ( .A1(txr[4]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n106 ) );
  OAI221_X1 \byte_controller/U107  ( .B1(\byte_controller/n107 ), .B2(
        \byte_controller/n7 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n105 ), .A(\byte_controller/n104 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U106  ( .A1(txr[3]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n104 ) );
  OAI221_X1 \byte_controller/U105  ( .B1(\byte_controller/n105 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n103 ), .A(\byte_controller/n102 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U104  ( .A1(txr[2]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n102 ) );
  OAI221_X1 \byte_controller/U103  ( .B1(\byte_controller/n103 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n101 ), .A(\byte_controller/n100 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U102  ( .A1(txr[1]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n100 ) );
  OAI221_X1 \byte_controller/U101  ( .B1(\byte_controller/n101 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n150 ), .A(\byte_controller/n78 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U100  ( .A1(txr[0]), .A2(\byte_controller/n112 ), 
        .ZN(\byte_controller/n78 ) );
  INV_X1 \byte_controller/U99  ( .A(\byte_controller/n77 ), .ZN(
        \byte_controller/n112 ) );
  INV_X1 \byte_controller/U98  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n150 ) );
  NAND3_X1 \byte_controller/U97  ( .A1(\byte_controller/n115 ), .A2(
        \byte_controller/n76 ), .A3(\byte_controller/n77 ), .ZN(
        \byte_controller/n116 ) );
  NAND3_X1 \byte_controller/U96  ( .A1(\byte_controller/n73 ), .A2(
        \byte_controller/n74 ), .A3(\byte_controller/n75 ), .ZN(
        \byte_controller/n84 ) );
  NAND2_X1 \byte_controller/U95  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/n71 ), .ZN(\byte_controller/n132 ) );
  NAND3_X1 \byte_controller/U94  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/n2 ), .ZN(
        \byte_controller/n74 ) );
  NAND3_X1 \byte_controller/U93  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n70 ), .A3(\byte_controller/n14 ), .ZN(
        \byte_controller/n75 ) );
  NAND2_X1 \byte_controller/U92  ( .A1(\byte_controller/n71 ), .A2(
        \byte_controller/n29 ), .ZN(\byte_controller/n138 ) );
  AOI21_X1 \byte_controller/U91  ( .B1(\byte_controller/n68 ), .B2(
        \byte_controller/n12 ), .A(\byte_controller/n67 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U90  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n66 ), .ZN(\byte_controller/n68 ) );
  NAND2_X1 \byte_controller/U89  ( .A1(\byte_controller/n65 ), .A2(
        \byte_controller/n128 ), .ZN(\byte_controller/n91 ) );
  NAND3_X1 \byte_controller/U88  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n64 ), .A3(\byte_controller/n2 ), .ZN(
        \byte_controller/n65 ) );
  NAND2_X1 \byte_controller/U87  ( .A1(\byte_controller/n17 ), .A2(
        \byte_controller/n63 ), .ZN(\byte_controller/n128 ) );
  OAI21_X1 \byte_controller/U86  ( .B1(\byte_controller/n66 ), .B2(
        \byte_controller/n118 ), .A(\byte_controller/n62 ), .ZN(
        \byte_controller/n63 ) );
  NAND4_X1 \byte_controller/U85  ( .A1(\byte_controller/n30 ), .A2(
        \byte_controller/n9 ), .A3(\byte_controller/n60 ), .A4(
        \byte_controller/n59 ), .ZN(\byte_controller/n62 ) );
  INV_X1 \byte_controller/U84  ( .A(cr[7]), .ZN(\byte_controller/n59 ) );
  NAND2_X1 \byte_controller/U83  ( .A1(\byte_controller/n58 ), .A2(
        \byte_controller/n129 ), .ZN(\byte_controller/n85 ) );
  NAND3_X1 \byte_controller/U82  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/c_state [2]), .A3(\byte_controller/n2 ), .ZN(
        \byte_controller/n58 ) );
  NAND4_X1 \byte_controller/U81  ( .A1(\byte_controller/n69 ), .A2(
        \byte_controller/n56 ), .A3(\byte_controller/n55 ), .A4(
        \byte_controller/n29 ), .ZN(\byte_controller/n129 ) );
  AOI21_X1 \byte_controller/U80  ( .B1(\byte_controller/n9 ), .B2(
        \byte_controller/n54 ), .A(\byte_controller/n11 ), .ZN(
        \byte_controller/n55 ) );
  OAI221_X1 \byte_controller/U79  ( .B1(\byte_controller/n53 ), .B2(
        \byte_controller/n1 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n52 ), .A(\byte_controller/n77 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U78  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n51 ), .A(\byte_controller/n71 ), .ZN(
        \byte_controller/n53 ) );
  INV_X1 \byte_controller/U77  ( .A(\byte_controller/n50 ), .ZN(
        \byte_controller/n71 ) );
  OAI211_X1 \byte_controller/U76  ( .C1(\byte_controller/n47 ), .C2(
        \byte_controller/n52 ), .A(\byte_controller/n49 ), .B(
        \byte_controller/n77 ), .ZN(\byte_controller/n90 ) );
  NAND3_X1 \byte_controller/U75  ( .A1(\byte_controller/n48 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n47 ), .ZN(
        \byte_controller/n49 ) );
  OAI21_X1 \byte_controller/U74  ( .B1(\byte_controller/n46 ), .B2(
        \byte_controller/n115 ), .A(\byte_controller/n76 ), .ZN(
        \byte_controller/n52 ) );
  NAND2_X1 \byte_controller/U73  ( .A1(\byte_controller/n45 ), .A2(
        \byte_controller/n77 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U72  ( .A(\byte_controller/n44 ), .B(
        \byte_controller/n46 ), .S(\byte_controller/n48 ), .Z(
        \byte_controller/n45 ) );
  INV_X1 \byte_controller/U71  ( .A(\byte_controller/n115 ), .ZN(
        \byte_controller/n48 ) );
  NAND2_X1 \byte_controller/U70  ( .A1(\byte_controller/n76 ), .A2(
        \byte_controller/n46 ), .ZN(\byte_controller/n44 ) );
  NAND2_X1 \byte_controller/U69  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n76 ), .ZN(\byte_controller/n77 ) );
  AOI21_X1 \byte_controller/U68  ( .B1(\byte_controller/n131 ), .B2(
        \byte_controller/n139 ), .A(\byte_controller/n67 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U67  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n50 ), .ZN(\byte_controller/n131 ) );
  OAI21_X1 \byte_controller/U66  ( .B1(\byte_controller/n54 ), .B2(
        \byte_controller/n67 ), .A(\byte_controller/n43 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U65  ( .A1(\byte_controller/n30 ), .A2(
        \byte_controller/n2 ), .A3(\byte_controller/n42 ), .A4(
        \byte_controller/n41 ), .ZN(\byte_controller/n43 ) );
  NAND2_X1 \byte_controller/U64  ( .A1(\byte_controller/n2 ), .A2(
        \byte_controller/n4 ), .ZN(\byte_controller/n67 ) );
  NAND2_X1 \byte_controller/U63  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n147 ), .ZN(\byte_controller/n86 ) );
  NAND3_X1 \byte_controller/U62  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/c_state [1]), .A3(\byte_controller/n2 ), .ZN(
        \byte_controller/n40 ) );
  NAND2_X1 \byte_controller/U61  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n140 ), .ZN(\byte_controller/n57 ) );
  NAND2_X1 \byte_controller/U60  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n50 ), .ZN(\byte_controller/n140 ) );
  NAND3_X1 \byte_controller/U59  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n47 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n50 ) );
  INV_X1 \byte_controller/U58  ( .A(\byte_controller/n145 ), .ZN(
        \byte_controller/n130 ) );
  NAND4_X1 \byte_controller/U57  ( .A1(\byte_controller/n69 ), .A2(
        \byte_controller/n56 ), .A3(\byte_controller/n11 ), .A4(
        \byte_controller/n2 ), .ZN(\byte_controller/n147 ) );
  OAI21_X1 \byte_controller/U56  ( .B1(cr[7]), .B2(\byte_controller/n39 ), .A(
        \byte_controller/n54 ), .ZN(\byte_controller/n56 ) );
  NAND2_X1 \byte_controller/U55  ( .A1(\byte_controller/n126 ), .A2(
        \byte_controller/n38 ), .ZN(\byte_controller/n87 ) );
  NAND3_X1 \byte_controller/U54  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/c_state [0]), .A3(\byte_controller/n2 ), .ZN(
        \byte_controller/n38 ) );
  MUX2_X1 \byte_controller/U53  ( .A(\byte_controller/n117 ), .B(
        \byte_controller/n37 ), .S(\byte_controller/n25 ), .Z(
        \byte_controller/n145 ) );
  NAND2_X1 \byte_controller/U52  ( .A1(\byte_controller/n36 ), .A2(
        \byte_controller/n41 ), .ZN(\byte_controller/n37 ) );
  INV_X1 \byte_controller/U51  ( .A(done), .ZN(\byte_controller/n41 ) );
  NAND3_X1 \byte_controller/U50  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n60 ), .A3(\byte_controller/n66 ), .ZN(
        \byte_controller/n36 ) );
  INV_X1 \byte_controller/U49  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n117 ) );
  NAND3_X1 \byte_controller/U48  ( .A1(\byte_controller/n17 ), .A2(
        \byte_controller/n30 ), .A3(cr[7]), .ZN(\byte_controller/n126 ) );
  NAND2_X1 \byte_controller/U47  ( .A1(\byte_controller/n137 ), .A2(
        \byte_controller/n136 ), .ZN(\byte_controller/n69 ) );
  NAND3_X1 \byte_controller/U46  ( .A1(\byte_controller/n20 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n35 ) );
  NAND2_X1 \byte_controller/U45  ( .A1(\byte_controller/n42 ), .A2(
        \byte_controller/n34 ), .ZN(\byte_controller/n137 ) );
  NAND3_X1 \byte_controller/U44  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n60 ), .A3(\byte_controller/n66 ), .ZN(
        \byte_controller/n42 ) );
  INV_X1 \byte_controller/U43  ( .A(cr[6]), .ZN(\byte_controller/n66 ) );
  INV_X1 \byte_controller/U42  ( .A(cr[5]), .ZN(\byte_controller/n60 ) );
  INV_X1 \byte_controller/U41  ( .A(cr[4]), .ZN(\byte_controller/n61 ) );
  INV_X1 \byte_controller/U40  ( .A(wb_rst_i), .ZN(\byte_controller/n76 ) );
  INV_X1 \byte_controller/U39  ( .A(i2c_al), .ZN(\byte_controller/n33 ) );
  NAND3_X1 \byte_controller/U38  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n39 ) );
  NAND2_X2 \byte_controller/U37  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n76 ), .ZN(\byte_controller/n152 ) );
  INV_X1 \byte_controller/U36  ( .A(\byte_controller/n152 ), .ZN(
        \byte_controller/n29 ) );
  AND3_X1 \byte_controller/U35  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n29 ), .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/n134 ) );
  INV_X1 \byte_controller/U34  ( .A(\byte_controller/n130 ), .ZN(
        \byte_controller/n26 ) );
  AND3_X1 \byte_controller/U33  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n25 ) );
  AND4_X1 \byte_controller/U32  ( .A1(\byte_controller/n20 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/n139 ), .A4(
        \byte_controller/n54 ), .ZN(\byte_controller/n34 ) );
  INV_X1 \byte_controller/U31  ( .A(\byte_controller/n145 ), .ZN(
        \byte_controller/n23 ) );
  CLKBUF_X1 \byte_controller/U30  ( .A(\byte_controller/n13 ), .Z(
        \byte_controller/n30 ) );
  MUX2_X1 \byte_controller/U29  ( .A(\byte_controller/n117 ), .B(
        \byte_controller/n37 ), .S(\byte_controller/n13 ), .Z(
        \byte_controller/n22 ) );
  AND3_X1 \byte_controller/U28  ( .A1(\byte_controller/n120 ), .A2(
        \byte_controller/n121 ), .A3(\byte_controller/n118 ), .ZN(
        \byte_controller/n32 ) );
  NAND2_X1 \byte_controller/U27  ( .A1(\byte_controller/n3 ), .A2(
        \byte_controller/n35 ), .ZN(\byte_controller/n136 ) );
  NAND2_X1 \byte_controller/U26  ( .A1(\byte_controller/n17 ), .A2(
        \byte_controller/n72 ), .ZN(\byte_controller/n73 ) );
  MUX2_X1 \byte_controller/U25  ( .A(\byte_controller/n150 ), .B(
        \byte_controller/n151 ), .S(\byte_controller/n149 ), .Z(
        \byte_controller/n153 ) );
  AND3_X1 \byte_controller/U24  ( .A1(\byte_controller/n121 ), .A2(
        \byte_controller/n120 ), .A3(\byte_controller/n118 ), .ZN(
        \byte_controller/n20 ) );
  INV_X1 \byte_controller/U23  ( .A(\byte_controller/n132 ), .ZN(
        \byte_controller/n72 ) );
  MUX2_X1 \byte_controller/U22  ( .A(\byte_controller/n37 ), .B(
        \byte_controller/n117 ), .S(\byte_controller/n39 ), .Z(
        \byte_controller/n31 ) );
  AND2_X1 \byte_controller/U21  ( .A1(\byte_controller/n137 ), .A2(
        \byte_controller/n136 ), .ZN(\byte_controller/n19 ) );
  AND2_X2 \byte_controller/U20  ( .A1(\byte_controller/n69 ), .A2(
        \byte_controller/n2 ), .ZN(\byte_controller/n17 ) );
  INV_X1 \byte_controller/U19  ( .A(\byte_controller/n138 ), .ZN(
        \byte_controller/n70 ) );
  CLKBUF_X1 \byte_controller/U18  ( .A(\byte_controller/n118 ), .Z(
        \byte_controller/n16 ) );
  INV_X1 \byte_controller/U17  ( .A(\byte_controller/n19 ), .ZN(
        \byte_controller/n14 ) );
  AND3_X1 \byte_controller/U16  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n13 ) );
  INV_X1 \byte_controller/U15  ( .A(\byte_controller/n64 ), .ZN(
        \byte_controller/n12 ) );
  CLKBUF_X1 \byte_controller/U14  ( .A(cr[5]), .Z(\byte_controller/n11 ) );
  CLKBUF_X1 \byte_controller/U13  ( .A(\byte_controller/n137 ), .Z(
        \byte_controller/n10 ) );
  INV_X1 \byte_controller/U12  ( .A(cr[4]), .ZN(\byte_controller/n9 ) );
  BUF_X1 \byte_controller/U11  ( .A(\byte_controller/n116 ), .Z(
        \byte_controller/n8 ) );
  BUF_X1 \byte_controller/U10  ( .A(\byte_controller/n116 ), .Z(
        \byte_controller/n7 ) );
  BUF_X1 \byte_controller/U9  ( .A(\byte_controller/n116 ), .Z(
        \byte_controller/n5 ) );
  INV_X1 \byte_controller/U8  ( .A(\byte_controller/n117 ), .ZN(
        \byte_controller/n4 ) );
  INV_X1 \byte_controller/U7  ( .A(\byte_controller/n117 ), .ZN(
        \byte_controller/n3 ) );
  BUF_X1 \byte_controller/U6  ( .A(arst_i), .Z(\byte_controller/n21 ) );
  AND2_X2 \byte_controller/U5  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n76 ), .ZN(\byte_controller/n2 ) );
  OR3_X2 \byte_controller/U4  ( .A1(\byte_controller/ld ), .A2(wb_rst_i), .A3(
        \byte_controller/n27 ), .ZN(\byte_controller/n115 ) );
  BUF_X2 \byte_controller/U3  ( .A(\byte_controller/n115 ), .Z(
        \byte_controller/n1 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/n46 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .QN(\byte_controller/n27 ) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/n51 ), .QN(
        \byte_controller/n15 ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n151 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n28 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[0]), .QN(
        \byte_controller/n101 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[1]), .QN(
        \byte_controller/n103 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[2]), .QN(
        \byte_controller/n105 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[3]), .QN(
        \byte_controller/n107 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[4]), .QN(
        \byte_controller/n109 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[5]), .QN(
        \byte_controller/n111 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[6]), .QN(
        \byte_controller/n114 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n90 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n47 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n118 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/n64 ), .QN(
        \byte_controller/n120 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [2]), .QN(
        \byte_controller/n121 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [0]) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/c_state [0]), .QN(\byte_controller/n54 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [1]), .QN(
        \byte_controller/n139 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(done), .QN(
        \byte_controller/n24 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n21 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n21 ), .Q(\byte_controller/ld ) );
  NOR3_X1 \byte_controller/bit_controller/U189  ( .A1(
        \byte_controller/bit_controller/n87 ), .A2(
        \byte_controller/bit_controller/n230 ), .A3(
        \byte_controller/bit_controller/n15 ), .ZN(
        \byte_controller/bit_controller/N154 ) );
  INV_X1 \byte_controller/bit_controller/U188  ( .A(
        \byte_controller/bit_controller/n30 ), .ZN(
        \byte_controller/bit_controller/n230 ) );
  AOI211_X1 \byte_controller/bit_controller/U187  ( .C1(
        \byte_controller/bit_controller/n81 ), .C2(
        \byte_controller/bit_controller/n80 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N75 ) );
  NOR3_X1 \byte_controller/bit_controller/U186  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  MUX2_X1 \byte_controller/bit_controller/U185  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n227 ), .S(
        \byte_controller/bit_controller/n226 ), .Z(
        \byte_controller/bit_controller/n158 ) );
  AOI21_X1 \byte_controller/bit_controller/U184  ( .B1(
        \byte_controller/bit_controller/n4 ), .B2(
        \byte_controller/bit_controller/n7 ), .A(
        \byte_controller/bit_controller/n224 ), .ZN(
        \byte_controller/bit_controller/n226 ) );
  NAND4_X1 \byte_controller/bit_controller/U183  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n124 ), .A3(
        \byte_controller/bit_controller/n3 ), .A4(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n227 ) );
  AOI211_X1 \byte_controller/bit_controller/U182  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n222 ), .A(\byte_controller/bit_controller/n15 ), .B(
        \byte_controller/bit_controller/n221 ), .ZN(
        \byte_controller/bit_controller/n223 ) );
  NAND4_X1 \byte_controller/bit_controller/U181  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n111 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  NAND4_X1 \byte_controller/bit_controller/U180  ( .A1(
        \byte_controller/bit_controller/n16 ), .A2(
        \byte_controller/bit_controller/n218 ), .A3(
        \byte_controller/bit_controller/n217 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n219 ) );
  OAI22_X1 \byte_controller/bit_controller/U179  ( .A1(
        \byte_controller/bit_controller/n22 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n14 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U178  ( .A1(
        \byte_controller/bit_controller/n109 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n108 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U177  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  NAND4_X1 \byte_controller/bit_controller/U176  ( .A1(
        \byte_controller/core_cmd [2]), .A2(
        \byte_controller/bit_controller/n214 ), .A3(
        \byte_controller/bit_controller/n217 ), .A4(
        \byte_controller/bit_controller/n70 ), .ZN(
        \byte_controller/bit_controller/n215 ) );
  INV_X1 \byte_controller/bit_controller/U175  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n217 ) );
  AOI21_X1 \byte_controller/bit_controller/U174  ( .B1(
        \byte_controller/bit_controller/n65 ), .B2(
        \byte_controller/bit_controller/n211 ), .A(
        \byte_controller/bit_controller/n53 ), .ZN(
        \byte_controller/bit_controller/n243 ) );
  INV_X1 \byte_controller/bit_controller/U173  ( .A(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/n232 ) );
  AOI222_X1 \byte_controller/bit_controller/U172  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n116 ), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  INV_X1 \byte_controller/bit_controller/U171  ( .A(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n242 ) );
  AOI222_X1 \byte_controller/bit_controller/U170  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(prer[0]), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/n206 ), .C1(
        \byte_controller/bit_controller/N28 ), .C2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  INV_X1 \byte_controller/bit_controller/U169  ( .A(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n241 ) );
  AOI222_X1 \byte_controller/bit_controller/U168  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(prer[1]), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/n44 ), .C1(
        \byte_controller/bit_controller/N29 ), .C2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  INV_X1 \byte_controller/bit_controller/U167  ( .A(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n240 ) );
  AOI222_X1 \byte_controller/bit_controller/U166  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(prer[2]), .B1(
        \byte_controller/bit_controller/n209 ), .B2(
        \byte_controller/bit_controller/n203 ), .C1(
        \byte_controller/bit_controller/N30 ), .C2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  INV_X1 \byte_controller/bit_controller/U165  ( .A(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n239 ) );
  AOI222_X1 \byte_controller/bit_controller/U164  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(prer[3]), .B1(
        \byte_controller/bit_controller/n209 ), .B2(
        \byte_controller/bit_controller/cnt [3]), .C1(
        \byte_controller/bit_controller/N31 ), .C2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  INV_X1 \byte_controller/bit_controller/U163  ( .A(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n238 ) );
  AOI222_X1 \byte_controller/bit_controller/U162  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(prer[4]), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/cnt [4]), .C1(
        \byte_controller/bit_controller/N32 ), .C2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n201 ) );
  INV_X1 \byte_controller/bit_controller/U161  ( .A(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n234 ) );
  AOI222_X1 \byte_controller/bit_controller/U160  ( .A1(
        \byte_controller/bit_controller/N33 ), .A2(
        \byte_controller/bit_controller/n116 ), .B1(prer[5]), .B2(
        \byte_controller/bit_controller/n208 ), .C1(
        \byte_controller/bit_controller/n69 ), .C2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/n200 ) );
  INV_X1 \byte_controller/bit_controller/U159  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n237 ) );
  AOI222_X1 \byte_controller/bit_controller/U158  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(prer[7]), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/n28 ), .C1(
        \byte_controller/bit_controller/N35 ), .C2(
        \byte_controller/bit_controller/n88 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  OAI21_X1 \byte_controller/bit_controller/U157  ( .B1(
        \byte_controller/bit_controller/n95 ), .B2(
        \byte_controller/bit_controller/n32 ), .A(
        \byte_controller/bit_controller/n197 ), .ZN(
        \byte_controller/bit_controller/n231 ) );
  AOI22_X1 \byte_controller/bit_controller/U156  ( .A1(
        \byte_controller/bit_controller/N36 ), .A2(
        \byte_controller/bit_controller/n116 ), .B1(prer[8]), .B2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  INV_X1 \byte_controller/bit_controller/U155  ( .A(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  AOI222_X1 \byte_controller/bit_controller/U154  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n33 ), .B1(prer[9]), .B2(
        \byte_controller/bit_controller/n74 ), .C1(
        \byte_controller/bit_controller/n69 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U153  ( .A(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AOI222_X1 \byte_controller/bit_controller/U152  ( .A1(
        \byte_controller/bit_controller/N38 ), .A2(
        \byte_controller/bit_controller/n33 ), .B1(prer[10]), .B2(
        \byte_controller/bit_controller/n74 ), .C1(
        \byte_controller/bit_controller/n209 ), .C2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/n195 ) );
  INV_X1 \byte_controller/bit_controller/U151  ( .A(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n235 ) );
  AOI222_X1 \byte_controller/bit_controller/U150  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n116 ), .B1(prer[11]), .B2(
        \byte_controller/bit_controller/n74 ), .C1(
        \byte_controller/bit_controller/n209 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n194 ) );
  INV_X1 \byte_controller/bit_controller/U149  ( .A(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n128 ) );
  AOI222_X1 \byte_controller/bit_controller/U148  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n33 ), .B1(prer[12]), .B2(
        \byte_controller/bit_controller/n208 ), .C1(
        \byte_controller/bit_controller/n68 ), .C2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/n193 ) );
  INV_X1 \byte_controller/bit_controller/U147  ( .A(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n236 ) );
  AOI222_X1 \byte_controller/bit_controller/U146  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n33 ), .B1(
        \byte_controller/bit_controller/n209 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(
        \byte_controller/bit_controller/n208 ), .C2(prer[13]), .ZN(
        \byte_controller/bit_controller/n192 ) );
  INV_X1 \byte_controller/bit_controller/U145  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n233 ) );
  AOI222_X1 \byte_controller/bit_controller/U144  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n116 ), .B1(
        \byte_controller/bit_controller/n68 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n191 ) );
  OAI211_X1 \byte_controller/bit_controller/U143  ( .C1(
        \byte_controller/bit_controller/n6 ), .C2(
        \byte_controller/bit_controller/n189 ), .A(
        \byte_controller/bit_controller/n39 ), .B(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  NAND2_X1 \byte_controller/bit_controller/U142  ( .A1(
        \byte_controller/bit_controller/n188 ), .A2(
        \byte_controller/bit_controller/n53 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  INV_X1 \byte_controller/bit_controller/U141  ( .A(
        \byte_controller/bit_controller/n29 ), .ZN(
        \byte_controller/bit_controller/n212 ) );
  INV_X1 \byte_controller/bit_controller/U140  ( .A(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  INV_X1 \byte_controller/bit_controller/U139  ( .A(
        \byte_controller/bit_controller/n103 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  NAND2_X1 \byte_controller/bit_controller/U138  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/N68 ) );
  AOI21_X1 \byte_controller/bit_controller/U137  ( .B1(
        \byte_controller/bit_controller/n7 ), .B2(
        \byte_controller/bit_controller/n177 ), .A(
        \byte_controller/bit_controller/n224 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n224 ) );
  NAND2_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/n77 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  NAND3_X1 \byte_controller/bit_controller/U134  ( .A1(
        \byte_controller/bit_controller/n225 ), .A2(
        \byte_controller/bit_controller/n18 ), .A3(
        \byte_controller/bit_controller/n122 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  NAND4_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/n172 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n118 ), .ZN(
        \byte_controller/bit_controller/n176 ) );
  INV_X1 \byte_controller/bit_controller/U132  ( .A(
        \byte_controller/bit_controller/n221 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  NAND3_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n123 ), .A3(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  OAI22_X1 \byte_controller/bit_controller/U130  ( .A1(
        \byte_controller/bit_controller/n20 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n113 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI21_X1 \byte_controller/bit_controller/U128  ( .B1(
        \byte_controller/bit_controller/n9 ), .B2(
        \byte_controller/bit_controller/n85 ), .A(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  NAND4_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/n4 ), .A2(
        \byte_controller/core_cmd [3]), .A3(
        \byte_controller/bit_controller/n170 ), .A4(
        \byte_controller/bit_controller/n169 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  NOR3_X1 \byte_controller/bit_controller/U126  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n169 ) );
  OAI22_X1 \byte_controller/bit_controller/U125  ( .A1(
        \byte_controller/bit_controller/n122 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U124  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/n36 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/n25 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n18 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI22_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n25 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U120  ( .A1(
        \byte_controller/bit_controller/n2 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n118 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n213 ), .A2(
        \byte_controller/bit_controller/n168 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n86 ) );
  NAND3_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/bit_controller/n4 ), .A2(
        \byte_controller/bit_controller/n167 ), .A3(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  OAI33_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n165 ), .A2(
        \byte_controller/bit_controller/n164 ), .A3(
        \byte_controller/bit_controller/n163 ), .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/N69 ), .B3(
        \byte_controller/bit_controller/n162 ), .ZN(
        \byte_controller/bit_controller/N83 ) );
  NAND2_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n166 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  NAND2_X1 \byte_controller/bit_controller/U115  ( .A1(
        \byte_controller/bit_controller/n76 ), .A2(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n166 ) );
  NAND4_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  NAND3_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n125 ), .ZN(
        \byte_controller/bit_controller/n228 ) );
  OAI21_X1 \byte_controller/bit_controller/U112  ( .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/n85 ), .A(
        \byte_controller/bit_controller/n136 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  OAI21_X1 \byte_controller/bit_controller/U111  ( .B1(
        \byte_controller/bit_controller/n174 ), .B2(
        \byte_controller/bit_controller/n71 ), .A(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  INV_X1 \byte_controller/bit_controller/U110  ( .A(
        \byte_controller/bit_controller/n216 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  OAI22_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n11 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n42 ), .B1(
        \byte_controller/bit_controller/n11 ), .B2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  INV_X1 \byte_controller/bit_controller/U107  ( .A(
        \byte_controller/bit_controller/n229 ), .ZN(
        \byte_controller/bit_controller/n225 ) );
  NAND2_X1 \byte_controller/bit_controller/U106  ( .A1(
        \byte_controller/bit_controller/n79 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n229 ) );
  NOR2_X1 \byte_controller/bit_controller/U105  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n135 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  MUX2_X1 \byte_controller/bit_controller/U104  ( .A(
        \byte_controller/bit_controller/n134 ), .B(
        \byte_controller/bit_controller/n82 ), .S(
        \byte_controller/bit_controller/n87 ), .Z(
        \byte_controller/bit_controller/n135 ) );
  NAND2_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n133 ), .A2(
        \byte_controller/bit_controller/n167 ), .ZN(
        \byte_controller/bit_controller/n134 ) );
  INV_X1 \byte_controller/bit_controller/U102  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n167 ) );
  INV_X1 \byte_controller/bit_controller/U101  ( .A(
        \byte_controller/bit_controller/n168 ), .ZN(
        \byte_controller/bit_controller/n133 ) );
  NAND3_X1 \byte_controller/bit_controller/U100  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n214 ), .A3(
        \byte_controller/bit_controller/n218 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  INV_X1 \byte_controller/bit_controller/U99  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n218 ) );
  INV_X1 \byte_controller/bit_controller/U98  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n214 ) );
  NOR4_X1 \byte_controller/bit_controller/U97  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n105 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  OR2_X1 \byte_controller/bit_controller/U96  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N66 ) );
  NAND2_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  INV_X1 \byte_controller/bit_controller/U94  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n211 ) );
  OR2_X1 \byte_controller/bit_controller/U93  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n219 ), .A2(
        \byte_controller/bit_controller/n126 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OR2_X1 \byte_controller/bit_controller/U91  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n126 ) );
  AND2_X2 \byte_controller/bit_controller/U90  ( .A1(
        \byte_controller/bit_controller/n212 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n116 ) );
  OR2_X2 \byte_controller/bit_controller/U89  ( .A1(
        \byte_controller/bit_controller/n129 ), .A2(
        \byte_controller/bit_controller/n229 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  INV_X2 \byte_controller/bit_controller/U88  ( .A(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n85 ) );
  INV_X1 \byte_controller/bit_controller/U87  ( .A(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  NAND2_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n78 ), .A2(
        \byte_controller/bit_controller/n215 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  OR2_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n78 ) );
  NAND2_X1 \byte_controller/bit_controller/U84  ( .A1(
        \byte_controller/bit_controller/n40 ), .A2(
        \byte_controller/bit_controller/n72 ), .ZN(
        \byte_controller/bit_controller/n77 ) );
  AND2_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n160 ), .ZN(
        \byte_controller/bit_controller/n76 ) );
  INV_X1 \byte_controller/bit_controller/U82  ( .A(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  INV_X1 \byte_controller/bit_controller/U81  ( .A(
        \byte_controller/bit_controller/n41 ), .ZN(
        \byte_controller/bit_controller/n75 ) );
  INV_X1 \byte_controller/bit_controller/U80  ( .A(
        \byte_controller/bit_controller/n41 ), .ZN(
        \byte_controller/bit_controller/n74 ) );
  OAI21_X1 \byte_controller/bit_controller/U79  ( .B1(
        \byte_controller/bit_controller/n187 ), .B2(
        \byte_controller/bit_controller/n37 ), .A(n154), .ZN(
        \byte_controller/bit_controller/n188 ) );
  OAI21_X1 \byte_controller/bit_controller/U78  ( .B1(
        \byte_controller/bit_controller/n38 ), .B2(
        \byte_controller/bit_controller/n23 ), .A(n154), .ZN(
        \byte_controller/bit_controller/n73 ) );
  NOR4_X1 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n140 ), .A2(
        \byte_controller/bit_controller/n173 ), .A3(
        \byte_controller/bit_controller/n139 ), .A4(
        \byte_controller/bit_controller/n138 ), .ZN(
        \byte_controller/bit_controller/n160 ) );
  NOR4_X1 \byte_controller/bit_controller/U76  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n173 ), .A3(
        \byte_controller/bit_controller/n139 ), .A4(
        \byte_controller/bit_controller/n138 ), .ZN(
        \byte_controller/bit_controller/n72 ) );
  INV_X1 \byte_controller/bit_controller/U75  ( .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  INV_X1 \byte_controller/bit_controller/U74  ( .A(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n69 ) );
  INV_X1 \byte_controller/bit_controller/U73  ( .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n68 ) );
  NAND4_X1 \byte_controller/bit_controller/U72  ( .A1(
        \byte_controller/bit_controller/n182 ), .A2(
        \byte_controller/bit_controller/n181 ), .A3(
        \byte_controller/bit_controller/n180 ), .A4(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  NAND4_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n184 ), .A2(
        \byte_controller/bit_controller/n26 ), .A3(
        \byte_controller/bit_controller/n186 ), .A4(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  AND2_X1 \byte_controller/bit_controller/U70  ( .A1(
        \byte_controller/bit_controller/n102 ), .A2(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n185 ) );
  NAND4_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n27 ), .A2(
        \byte_controller/bit_controller/n181 ), .A3(
        \byte_controller/bit_controller/n180 ), .A4(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  AND2_X1 \byte_controller/bit_controller/U68  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n180 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U67  ( .A(
        \byte_controller/bit_controller/n212 ), .Z(
        \byte_controller/bit_controller/n65 ) );
  AND2_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n76 ), .A2(
        \byte_controller/bit_controller/n161 ), .ZN(
        \byte_controller/bit_controller/n64 ) );
  AND2_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n93 ), .A2(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n181 ) );
  NAND2_X1 \byte_controller/bit_controller/U64  ( .A1(
        \byte_controller/bit_controller/n83 ), .A2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n56 ) );
  MUX2_X1 \byte_controller/bit_controller/U63  ( .A(
        \byte_controller/bit_controller/n55 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n56 ), .Z(
        \byte_controller/bit_controller/n54 ) );
  NOR2_X1 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n189 ), .A2(
        \byte_controller/bit_controller/N68 ), .ZN(
        \byte_controller/bit_controller/n53 ) );
  AND2_X1 \byte_controller/bit_controller/U61  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  OR4_X1 \byte_controller/bit_controller/U60  ( .A1(
        \byte_controller/bit_controller/n176 ), .A2(
        \byte_controller/bit_controller/n175 ), .A3(
        \byte_controller/bit_controller/n174 ), .A4(
        \byte_controller/bit_controller/n173 ), .ZN(
        \byte_controller/bit_controller/n52 ) );
  MUX2_X1 \byte_controller/bit_controller/U59  ( .A(scl_padoen_o), .B(
        \byte_controller/bit_controller/n52 ), .S(
        \byte_controller/bit_controller/n178 ), .Z(
        \byte_controller/bit_controller/n51 ) );
  NOR4_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n30 ), .A2(
        \byte_controller/bit_controller/n12 ), .A3(
        \byte_controller/bit_controller/n137 ), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  BUF_X1 \byte_controller/bit_controller/U57  ( .A(\byte_controller/n21 ), .Z(
        \byte_controller/bit_controller/n57 ) );
  BUF_X1 \byte_controller/bit_controller/U56  ( .A(
        \byte_controller/bit_controller/n57 ), .Z(
        \byte_controller/bit_controller/n63 ) );
  BUF_X1 \byte_controller/bit_controller/U55  ( .A(
        \byte_controller/bit_controller/n63 ), .Z(
        \byte_controller/bit_controller/n58 ) );
  BUF_X1 \byte_controller/bit_controller/U54  ( .A(
        \byte_controller/bit_controller/n62 ), .Z(
        \byte_controller/bit_controller/n61 ) );
  BUF_X1 \byte_controller/bit_controller/U53  ( .A(
        \byte_controller/bit_controller/n62 ), .Z(
        \byte_controller/bit_controller/n60 ) );
  BUF_X1 \byte_controller/bit_controller/U52  ( .A(
        \byte_controller/bit_controller/n62 ), .Z(
        \byte_controller/bit_controller/n59 ) );
  BUF_X1 \byte_controller/bit_controller/U51  ( .A(
        \byte_controller/bit_controller/n57 ), .Z(
        \byte_controller/bit_controller/n62 ) );
  NAND2_X1 \byte_controller/bit_controller/U50  ( .A1(
        \byte_controller/bit_controller/N34 ), .A2(
        \byte_controller/bit_controller/n33 ), .ZN(
        \byte_controller/bit_controller/n50 ) );
  NAND2_X1 \byte_controller/bit_controller/U49  ( .A1(
        \byte_controller/bit_controller/n68 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n49 ) );
  NAND2_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(prer[6]), .ZN(
        \byte_controller/bit_controller/n48 ) );
  NAND3_X1 \byte_controller/bit_controller/U47  ( .A1(
        \byte_controller/bit_controller/n48 ), .A2(
        \byte_controller/bit_controller/n49 ), .A3(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/n47 ) );
  NOR4_X1 \byte_controller/bit_controller/U46  ( .A1(
        \byte_controller/bit_controller/n228 ), .A2(
        \byte_controller/bit_controller/n12 ), .A3(
        \byte_controller/bit_controller/n137 ), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/U45  ( .A1(
        \byte_controller/bit_controller/n73 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n88 ) );
  INV_X1 \byte_controller/bit_controller/U44  ( .A(
        \byte_controller/bit_controller/n43 ), .ZN(
        \byte_controller/bit_controller/n44 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U43  ( .A(
        \byte_controller/bit_controller/n102 ), .Z(
        \byte_controller/bit_controller/n43 ) );
  NAND2_X1 \byte_controller/bit_controller/U42  ( .A1(
        \byte_controller/bit_controller/n225 ), .A2(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  CLKBUF_X3 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n216 ), .Z(
        \byte_controller/bit_controller/n42 ) );
  OAI211_X1 \byte_controller/bit_controller/U40  ( .C1(
        \byte_controller/bit_controller/n6 ), .C2(
        \byte_controller/bit_controller/n189 ), .A(
        \byte_controller/bit_controller/n39 ), .B(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n41 ) );
  NOR4_X1 \byte_controller/bit_controller/U39  ( .A1(
        \byte_controller/bit_controller/n31 ), .A2(
        \byte_controller/bit_controller/n12 ), .A3(
        \byte_controller/bit_controller/n137 ), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n40 ) );
  OAI21_X1 \byte_controller/bit_controller/U38  ( .B1(
        \byte_controller/bit_controller/n67 ), .B2(
        \byte_controller/bit_controller/n66 ), .A(n154), .ZN(
        \byte_controller/bit_controller/n39 ) );
  NAND4_X1 \byte_controller/bit_controller/U37  ( .A1(
        \byte_controller/bit_controller/n185 ), .A2(
        \byte_controller/bit_controller/n186 ), .A3(
        \byte_controller/bit_controller/n183 ), .A4(
        \byte_controller/bit_controller/n184 ), .ZN(
        \byte_controller/bit_controller/n38 ) );
  NAND4_X1 \byte_controller/bit_controller/U36  ( .A1(
        \byte_controller/bit_controller/n185 ), .A2(
        \byte_controller/bit_controller/n184 ), .A3(
        \byte_controller/bit_controller/n186 ), .A4(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  INV_X1 \byte_controller/bit_controller/U35  ( .A(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n36 ) );
  NAND4_X1 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n34 ) );
  AND2_X2 \byte_controller/bit_controller/U33  ( .A1(
        \byte_controller/bit_controller/n212 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n33 ) );
  NAND2_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n188 ), .A2(
        \byte_controller/bit_controller/n53 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  AND2_X2 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n100 ), .A2(
        \byte_controller/bit_controller/n99 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  AND2_X2 \byte_controller/bit_controller/U30  ( .A1(
        \byte_controller/bit_controller/n97 ), .A2(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  NAND3_X1 \byte_controller/bit_controller/U29  ( .A1(
        \byte_controller/bit_controller/n10 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  NAND3_X1 \byte_controller/bit_controller/U28  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n125 ), .ZN(
        \byte_controller/bit_controller/n30 ) );
  OAI21_X1 \byte_controller/bit_controller/U27  ( .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/n38 ), .A(n154), .ZN(
        \byte_controller/bit_controller/n29 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U26  ( .A(
        \byte_controller/bit_controller/cnt [7]), .Z(
        \byte_controller/bit_controller/n28 ) );
  AND2_X1 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  AND2_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n102 ), .A2(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  INV_X1 \byte_controller/bit_controller/U23  ( .A(
        \byte_controller/bit_controller/n24 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  NAND4_X1 \byte_controller/bit_controller/U22  ( .A1(
        \byte_controller/bit_controller/n182 ), .A2(
        \byte_controller/bit_controller/n181 ), .A3(
        \byte_controller/bit_controller/n180 ), .A4(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  INV_X1 \byte_controller/bit_controller/U21  ( .A(
        \byte_controller/bit_controller/n21 ), .ZN(
        \byte_controller/bit_controller/n22 ) );
  INV_X1 \byte_controller/bit_controller/U20  ( .A(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n20 ) );
  INV_X1 \byte_controller/bit_controller/U19  ( .A(
        \byte_controller/bit_controller/n17 ), .ZN(
        \byte_controller/bit_controller/n18 ) );
  AND2_X2 \byte_controller/bit_controller/U18  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/n103 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  AND3_X1 \byte_controller/bit_controller/U17  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n170 ), .A3(
        \byte_controller/bit_controller/n167 ), .ZN(
        \byte_controller/bit_controller/n70 ) );
  AND3_X1 \byte_controller/bit_controller/U16  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n167 ), .A3(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n16 ) );
  AND2_X2 \byte_controller/bit_controller/U15  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n179 ) );
  INV_X1 \byte_controller/bit_controller/U14  ( .A(
        \byte_controller/bit_controller/n225 ), .ZN(
        \byte_controller/bit_controller/n15 ) );
  INV_X1 \byte_controller/bit_controller/U13  ( .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  NAND3_X1 \byte_controller/bit_controller/U12  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n115 ), .A3(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  INV_X1 \byte_controller/bit_controller/U11  ( .A(
        \byte_controller/bit_controller/n174 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  AND2_X1 \byte_controller/bit_controller/U10  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n127 ), .ZN(
        \byte_controller/bit_controller/n125 ) );
  AND2_X1 \byte_controller/bit_controller/U9  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n127 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  INV_X1 \byte_controller/bit_controller/U8  ( .A(
        \byte_controller/bit_controller/n8 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  INV_X1 \byte_controller/bit_controller/U7  ( .A(
        \byte_controller/bit_controller/n15 ), .ZN(
        \byte_controller/bit_controller/n7 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U6  ( .A(
        \byte_controller/bit_controller/n114 ), .Z(
        \byte_controller/bit_controller/n5 ) );
  AND2_X1 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n76 ), .A2(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n4 ) );
  BUF_X1 \byte_controller/bit_controller/U4  ( .A(
        \byte_controller/bit_controller/n10 ), .Z(
        \byte_controller/bit_controller/n3 ) );
  INV_X1 \byte_controller/bit_controller/U3  ( .A(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n2 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n86 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n1 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n19 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/n174 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n8 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n24 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n35 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n13 ), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n164 ), .QN(
        \byte_controller/bit_controller/n82 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n132 ), .QN(
        \byte_controller/bit_controller/n104 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n237 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n96 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n238 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n99 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n231 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n95 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n239 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n100 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n241 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [1]), .QN(
        \byte_controller/bit_controller/n102 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n131 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n94 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n235 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n92 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n130 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n93 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n232 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n45 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n128 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n91 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n233 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n236 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n90 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n137 ), .QN(
        \byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/n21 ), .QN(\byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n234 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n98 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n138 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n139 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n21 ), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/n21 ), .Q(\byte_controller/bit_controller/n173 ), 
        .QN(\byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n240 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n47 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n97 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n242 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/cnt [0]), .QN(
        \byte_controller/bit_controller/n103 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n58 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n17 ), .QN(
        \byte_controller/bit_controller/n127 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/n71 ), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N83 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n79 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n61 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n162 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n243 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n129 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n189 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n51 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n61 ), .Q(scl_padoen_o) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n54 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n81 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n59 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n163 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n60 ), .QN(
        \byte_controller/bit_controller/n80 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N66 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n6 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n60 ), .Q(
        \byte_controller/bit_controller/n55 ), .QN(
        \byte_controller/bit_controller/n105 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U153  ( .A1(
        \byte_controller/bit_controller/sub_105/n136 ), .A2(
        \byte_controller/bit_controller/sub_105/n114 ), .A3(
        \byte_controller/bit_controller/sub_105/n111 ), .ZN(
        \byte_controller/bit_controller/sub_105/n134 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U152  ( .A1(
        \byte_controller/bit_controller/sub_105/n30 ), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .A3(
        \byte_controller/bit_controller/sub_105/n60 ), .ZN(
        \byte_controller/bit_controller/sub_105/n135 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U151  ( .A1(
        \byte_controller/bit_controller/sub_105/n42 ), .A2(
        \byte_controller/bit_controller/sub_105/n57 ), .ZN(
        \byte_controller/bit_controller/sub_105/n132 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U150  ( .A1(
        \byte_controller/bit_controller/sub_105/n131 ), .A2(
        \byte_controller/bit_controller/sub_105/n114 ), .ZN(
        \byte_controller/bit_controller/sub_105/n128 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U149  ( .A1(
        \byte_controller/bit_controller/sub_105/n127 ), .A2(
        \byte_controller/bit_controller/sub_105/n126 ), .ZN(
        \byte_controller/bit_controller/sub_105/n125 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U148  ( .A(
        \byte_controller/bit_controller/sub_105/n124 ), .B(
        \byte_controller/bit_controller/sub_105/n125 ), .S(
        \byte_controller/bit_controller/cnt [10]), .Z(
        \byte_controller/bit_controller/N38 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U147  ( .A1(
        \byte_controller/bit_controller/sub_105/n43 ), .A2(
        \byte_controller/bit_controller/sub_105/n112 ), .A3(
        \byte_controller/bit_controller/sub_105/n123 ), .A4(
        \byte_controller/bit_controller/sub_105/n114 ), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U146  ( .A1(
        \byte_controller/bit_controller/sub_105/n31 ), .A2(
        \byte_controller/bit_controller/sub_105/n67 ), .A3(
        \byte_controller/bit_controller/sub_105/n122 ), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U145  ( .A1(
        \byte_controller/bit_controller/sub_105/n120 ), .A2(
        \byte_controller/bit_controller/sub_105/n121 ), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U144  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n117 ), .A3(
        \byte_controller/bit_controller/sub_105/n118 ), .A4(
        \byte_controller/bit_controller/sub_105/n119 ), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U143  ( .A(
        \byte_controller/bit_controller/sub_105/n115 ), .B(
        \byte_controller/bit_controller/sub_105/n116 ), .S(
        \byte_controller/bit_controller/cnt [11]), .Z(
        \byte_controller/bit_controller/N39 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U142  ( .A1(
        \byte_controller/bit_controller/sub_105/n111 ), .A2(
        \byte_controller/bit_controller/sub_105/n112 ), .A3(
        \byte_controller/bit_controller/sub_105/n113 ), .A4(
        \byte_controller/bit_controller/sub_105/n114 ), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U141  ( .A1(
        \byte_controller/bit_controller/sub_105/n109 ), .A2(
        \byte_controller/bit_controller/sub_105/n15 ), .A3(
        \byte_controller/bit_controller/sub_105/n31 ), .A4(
        \byte_controller/bit_controller/sub_105/n67 ), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U140  ( .A1(
        \byte_controller/bit_controller/sub_105/n107 ), .A2(
        \byte_controller/bit_controller/sub_105/n108 ), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U139  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .A3(
        \byte_controller/bit_controller/sub_105/n118 ), .A4(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U138  ( .A(
        \byte_controller/bit_controller/sub_105/n102 ), .B(
        \byte_controller/bit_controller/sub_105/n103 ), .S(
        \byte_controller/bit_controller/cnt [12]), .Z(
        \byte_controller/bit_controller/N40 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n99 ), .A2(
        \byte_controller/bit_controller/sub_105/n50 ), .A3(
        \byte_controller/bit_controller/sub_105/n100 ), .A4(
        \byte_controller/bit_controller/sub_105/n101 ), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U136  ( .A1(
        \byte_controller/bit_controller/sub_105/n97 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .A3(
        \byte_controller/bit_controller/sub_105/n98 ), .A4(
        \byte_controller/bit_controller/sub_105/n67 ), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U135  ( .A1(
        \byte_controller/bit_controller/sub_105/n95 ), .A2(
        \byte_controller/bit_controller/sub_105/n96 ), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U134  ( .A1(
        \byte_controller/bit_controller/sub_105/n90 ), .A2(
        \byte_controller/bit_controller/sub_105/n91 ), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n89 ), .A2(
        \byte_controller/bit_controller/sub_105/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n80 ), .A2(
        \byte_controller/bit_controller/sub_105/n81 ), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U131  ( .A1(
        \byte_controller/bit_controller/sub_105/n79 ), .A2(
        \byte_controller/bit_controller/sub_105/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U130  ( .A1(
        \byte_controller/bit_controller/sub_105/n75 ), .A2(
        \byte_controller/bit_controller/sub_105/n76 ), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n73 ), .A2(
        \byte_controller/bit_controller/sub_105/n74 ), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n69 ), .A2(
        \byte_controller/bit_controller/sub_105/n70 ), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A(
        \byte_controller/bit_controller/sub_105/n68 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U126  ( .A1(
        \byte_controller/bit_controller/sub_105/n21 ), .A2(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U125  ( .A1(
        \byte_controller/bit_controller/sub_105/n60 ), .A2(
        \byte_controller/bit_controller/sub_105/n13 ), .A3(
        \byte_controller/bit_controller/sub_105/n61 ), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n14 ), .A2(
        \byte_controller/bit_controller/sub_105/n4 ), .A3(
        \byte_controller/bit_controller/sub_105/n56 ), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U123  ( .A(
        \byte_controller/bit_controller/sub_105/n51 ), .B(
        \byte_controller/bit_controller/sub_105/n52 ), .S(
        \byte_controller/bit_controller/sub_105/n6 ), .Z(
        \byte_controller/bit_controller/N33 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U122  ( .A1(
        \byte_controller/bit_controller/sub_105/n48 ), .A2(
        \byte_controller/bit_controller/sub_105/n15 ), .A3(
        \byte_controller/bit_controller/sub_105/n49 ), .A4(
        \byte_controller/bit_controller/sub_105/n5 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U121  ( .A(
        \byte_controller/bit_controller/cnt [6]), .B(
        \byte_controller/bit_controller/sub_105/n47 ), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U120  ( .A1(
        \byte_controller/bit_controller/sub_105/n60 ), .A2(
        \byte_controller/bit_controller/sub_105/n43 ), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U119  ( .A1(
        \byte_controller/bit_controller/sub_105/n41 ), .A2(
        \byte_controller/bit_controller/sub_105/n15 ), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U118  ( .A1(
        \byte_controller/bit_controller/sub_105/n38 ), .A2(
        \byte_controller/bit_controller/sub_105/n35 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U117  ( .A1(
        \byte_controller/bit_controller/sub_105/n99 ), .A2(
        \byte_controller/bit_controller/sub_105/n100 ), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U116  ( .A(
        \byte_controller/bit_controller/sub_105/n34 ), .B(
        \byte_controller/bit_controller/sub_105/n35 ), .S(
        \byte_controller/bit_controller/sub_105/n11 ), .Z(
        \byte_controller/bit_controller/N36 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U115  ( .A1(
        \byte_controller/bit_controller/sub_105/n32 ), .A2(
        \byte_controller/bit_controller/sub_105/n33 ), .A3(
        \byte_controller/bit_controller/sub_105/n99 ), .ZN(
        \byte_controller/bit_controller/sub_105/n28 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U114  ( .A1(
        \byte_controller/bit_controller/sub_105/n30 ), .A2(
        \byte_controller/bit_controller/sub_105/n31 ), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U113  ( .A1(
        \byte_controller/bit_controller/sub_105/n49 ), .A2(
        \byte_controller/bit_controller/sub_105/n26 ), .A3(
        \byte_controller/bit_controller/sub_105/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n25 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U112  ( .A(
        \byte_controller/bit_controller/sub_105/n24 ), .B(
        \byte_controller/bit_controller/sub_105/n25 ), .S(
        \byte_controller/bit_controller/cnt [9]), .Z(
        \byte_controller/bit_controller/N37 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U111  ( .A(
        \byte_controller/bit_controller/sub_105/n82 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U110  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/sub_105/n18 ), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/sub_105/n20 ), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U107  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/sub_105/n19 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U104  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U103  ( .A1(
        \byte_controller/bit_controller/sub_105/n19 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .A3(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U102  ( .A1(
        \byte_controller/bit_controller/sub_105/n18 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U101  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n3 ), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U100  ( .A1(
        \byte_controller/bit_controller/sub_105/n23 ), .A2(
        \byte_controller/bit_controller/cnt [11]), .A3(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/sub_105/n12 ), .A2(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U98  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U97  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n3 ), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U96  ( .A1(
        \byte_controller/bit_controller/sub_105/n23 ), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U95  ( .A(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U94  ( .A1(
        \byte_controller/bit_controller/cnt [10]), .A2(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U93  ( .A1(
        \byte_controller/bit_controller/sub_105/n21 ), .A2(
        \byte_controller/bit_controller/sub_105/n20 ), .A3(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U91  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U90  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U89  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [6]), .A3(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U88  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U87  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U86  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/sub_105/n59 ), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U84  ( .A1(
        \byte_controller/bit_controller/sub_105/n1 ), .A2(
        \byte_controller/bit_controller/sub_105/n12 ), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U83  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U82  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U81  ( .A1(
        \byte_controller/bit_controller/sub_105/n18 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U80  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U79  ( .A1(
        \byte_controller/bit_controller/sub_105/n137 ), .A2(
        \byte_controller/bit_controller/sub_105/n56 ), .ZN(
        \byte_controller/bit_controller/sub_105/n133 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U77  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U76  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U75  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U74  ( .A(
        \byte_controller/bit_controller/sub_105/n19 ), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U73  ( .B1(
        \byte_controller/bit_controller/sub_105/n83 ), .B2(
        \byte_controller/bit_controller/sub_105/n84 ), .A(
        \byte_controller/bit_controller/sub_105/n82 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [8]), .A3(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U71  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U70  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U69  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U68  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U67  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U66  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U65  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U64  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U63  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n131 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U62  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n136 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U61  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n22 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U60  ( .A(
        \byte_controller/bit_controller/sub_105/n65 ), .B(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/N30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U59  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U58  ( .B1(
        \byte_controller/bit_controller/sub_105/n62 ), .B2(
        \byte_controller/bit_controller/sub_105/n5 ), .A(
        \byte_controller/bit_controller/sub_105/n59 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U57  ( .A1(
        \byte_controller/bit_controller/sub_105/n86 ), .A2(
        \byte_controller/bit_controller/sub_105/n85 ), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U56  ( .A(
        \byte_controller/bit_controller/sub_105/n56 ), .ZN(
        \byte_controller/bit_controller/sub_105/n21 ) );
  BUF_X2 \byte_controller/bit_controller/sub_105/U55  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n20 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U54  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U53  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U52  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U51  ( .A1(
        \byte_controller/bit_controller/sub_105/n132 ), .A2(
        \byte_controller/bit_controller/sub_105/n133 ), .ZN(
        \byte_controller/bit_controller/sub_105/n126 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U50  ( .A1(
        \byte_controller/bit_controller/sub_105/n87 ), .A2(
        \byte_controller/bit_controller/sub_105/n88 ), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U49  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U48  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U47  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U46  ( .A1(
        \byte_controller/bit_controller/sub_105/n44 ), .A2(
        \byte_controller/bit_controller/sub_105/n45 ), .A3(
        \byte_controller/bit_controller/sub_105/n49 ), .A4(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U45  ( .B1(
        \byte_controller/bit_controller/sub_105/n39 ), .B2(
        \byte_controller/bit_controller/sub_105/n40 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U44  ( .A1(
        \byte_controller/bit_controller/sub_105/n65 ), .A2(
        \byte_controller/bit_controller/sub_105/n66 ), .ZN(
        \byte_controller/bit_controller/N29 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U43  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U42  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n130 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U41  ( .A1(
        \byte_controller/bit_controller/sub_105/n130 ), .A2(
        \byte_controller/bit_controller/sub_105/n33 ), .ZN(
        \byte_controller/bit_controller/sub_105/n129 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U40  ( .A1(
        \byte_controller/bit_controller/sub_105/n128 ), .A2(
        \byte_controller/bit_controller/sub_105/n129 ), .ZN(
        \byte_controller/bit_controller/sub_105/n127 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U39  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U38  ( .A1(
        \byte_controller/bit_controller/sub_105/n63 ), .A2(
        \byte_controller/bit_controller/sub_105/n64 ), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U37  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U36  ( .A1(
        \byte_controller/bit_controller/sub_105/n37 ), .A2(
        \byte_controller/bit_controller/sub_105/n36 ), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U35  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U34  ( .A1(
        \byte_controller/bit_controller/sub_105/n77 ), .A2(
        \byte_controller/bit_controller/sub_105/n78 ), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U33  ( .A1(
        \byte_controller/bit_controller/sub_105/n72 ), .A2(
        \byte_controller/bit_controller/sub_105/n71 ), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U32  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U31  ( .A1(
        \byte_controller/bit_controller/sub_105/n28 ), .A2(
        \byte_controller/bit_controller/sub_105/n29 ), .ZN(
        \byte_controller/bit_controller/sub_105/n24 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U30  ( .A1(
        \byte_controller/bit_controller/sub_105/n135 ), .A2(
        \byte_controller/bit_controller/sub_105/n134 ), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U29  ( .A1(
        \byte_controller/bit_controller/sub_105/n54 ), .A2(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U28  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U27  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U26  ( .A1(
        \byte_controller/bit_controller/sub_105/n67 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U25  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/sub_105/n20 ), .ZN(
        \byte_controller/bit_controller/sub_105/n17 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U24  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U23  ( .A1(
        \byte_controller/bit_controller/sub_105/n22 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n16 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U22  ( .A1(
        \byte_controller/bit_controller/sub_105/n16 ), .A2(
        \byte_controller/bit_controller/sub_105/n110 ), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U21  ( .A(
        \byte_controller/bit_controller/sub_105/n8 ), .ZN(
        \byte_controller/bit_controller/sub_105/n137 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U20  ( .A(
        \byte_controller/bit_controller/sub_105/n3 ), .ZN(
        \byte_controller/bit_controller/sub_105/n15 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U19  ( .A(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n14 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U18  ( .A(
        \byte_controller/bit_controller/sub_105/n20 ), .ZN(
        \byte_controller/bit_controller/sub_105/n13 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U17  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n18 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U16  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_105/n19 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U15  ( .A(
        \byte_controller/bit_controller/cnt [8]), .Z(
        \byte_controller/bit_controller/sub_105/n11 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U14  ( .A(
        \byte_controller/bit_controller/sub_105/n20 ), .Z(
        \byte_controller/bit_controller/sub_105/n10 ) );
  AND4_X1 \byte_controller/bit_controller/sub_105/U13  ( .A1(
        \byte_controller/bit_controller/sub_105/n94 ), .A2(
        \byte_controller/bit_controller/sub_105/n93 ), .A3(
        \byte_controller/bit_controller/sub_105/n92 ), .A4(
        \byte_controller/bit_controller/sub_105/n137 ), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U12  ( .A(
        \byte_controller/bit_controller/cnt [1]), .Z(
        \byte_controller/bit_controller/sub_105/n12 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U11  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n9 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U10  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n8 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U9  ( .A(
        \byte_controller/bit_controller/sub_105/n20 ), .ZN(
        \byte_controller/bit_controller/sub_105/n7 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U8  ( .A(
        \byte_controller/bit_controller/sub_105/n130 ), .ZN(
        \byte_controller/bit_controller/sub_105/n6 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U7  ( .A(
        \byte_controller/bit_controller/sub_105/n50 ), .Z(
        \byte_controller/bit_controller/sub_105/n5 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U6  ( .A(
        \byte_controller/bit_controller/sub_105/n20 ), .ZN(
        \byte_controller/bit_controller/sub_105/n4 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U5  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n3 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U4  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_105/n23 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U3  ( .A(
        \byte_controller/bit_controller/sub_105/n14 ), .Z(
        \byte_controller/bit_controller/N28 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/sub_105/n20 ), .Z(
        \byte_controller/bit_controller/sub_105/n1 ) );
endmodule

