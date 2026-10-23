/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 01:32:18 2026
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
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234,
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
         \byte_controller/n29 , \byte_controller/n28 , \byte_controller/n26 ,
         \byte_controller/n23 , \byte_controller/n21 , \byte_controller/n20 ,
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
         \byte_controller/n79 , \byte_controller/n27 , \byte_controller/n25 ,
         \byte_controller/n24 , \byte_controller/n22 , \byte_controller/n18 ,
         \byte_controller/n15 , \byte_controller/n6 , \byte_controller/N107 ,
         \byte_controller/N106 , \byte_controller/N105 ,
         \byte_controller/N104 , \byte_controller/dcnt[1] ,
         \byte_controller/ld , \byte_controller/core_rxd ,
         \byte_controller/core_txd , \byte_controller/core_ack ,
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
         \byte_controller/bit_controller/n162 ,
         \byte_controller/bit_controller/n159 ,
         \byte_controller/bit_controller/n158 ,
         \byte_controller/bit_controller/n157 ,
         \byte_controller/bit_controller/n156 ,
         \byte_controller/bit_controller/n155 ,
         \byte_controller/bit_controller/n153 ,
         \byte_controller/bit_controller/n152 ,
         \byte_controller/bit_controller/n133 ,
         \byte_controller/bit_controller/n127 ,
         \byte_controller/bit_controller/n98 ,
         \byte_controller/bit_controller/n93 ,
         \byte_controller/bit_controller/n90 ,
         \byte_controller/bit_controller/n85 ,
         \byte_controller/bit_controller/n84 ,
         \byte_controller/bit_controller/n83 ,
         \byte_controller/bit_controller/n82 ,
         \byte_controller/bit_controller/n81 ,
         \byte_controller/bit_controller/n80 ,
         \byte_controller/bit_controller/n79 ,
         \byte_controller/bit_controller/n78 ,
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
         \byte_controller/bit_controller/n169 ,
         \byte_controller/bit_controller/n168 ,
         \byte_controller/bit_controller/n167 ,
         \byte_controller/bit_controller/n166 ,
         \byte_controller/bit_controller/n165 ,
         \byte_controller/bit_controller/n164 ,
         \byte_controller/bit_controller/n163 ,
         \byte_controller/bit_controller/n161 ,
         \byte_controller/bit_controller/n160 ,
         \byte_controller/bit_controller/n154 ,
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
         \byte_controller/bit_controller/n132 ,
         \byte_controller/bit_controller/n131 ,
         \byte_controller/bit_controller/n130 ,
         \byte_controller/bit_controller/n129 ,
         \byte_controller/bit_controller/n128 ,
         \byte_controller/bit_controller/n126 ,
         \byte_controller/bit_controller/n125 ,
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
         \byte_controller/bit_controller/n103 ,
         \byte_controller/bit_controller/n102 ,
         \byte_controller/bit_controller/n101 ,
         \byte_controller/bit_controller/n100 ,
         \byte_controller/bit_controller/n99 ,
         \byte_controller/bit_controller/n97 ,
         \byte_controller/bit_controller/n96 ,
         \byte_controller/bit_controller/n95 ,
         \byte_controller/bit_controller/n94 ,
         \byte_controller/bit_controller/n92 ,
         \byte_controller/bit_controller/n91 ,
         \byte_controller/bit_controller/n89 ,
         \byte_controller/bit_controller/n88 ,
         \byte_controller/bit_controller/n87 ,
         \byte_controller/bit_controller/n86 ,
         \byte_controller/bit_controller/N172 ,
         \byte_controller/bit_controller/N84 ,
         \byte_controller/bit_controller/N76 ,
         \byte_controller/bit_controller/N74 ,
         \byte_controller/bit_controller/N73 ,
         \byte_controller/bit_controller/sto_condition ,
         \byte_controller/bit_controller/N70 ,
         \byte_controller/bit_controller/N69 ,
         \byte_controller/bit_controller/N68 ,
         \byte_controller/bit_controller/N67 ,
         \byte_controller/bit_controller/N64 ,
         \byte_controller/bit_controller/N47 ,
         \byte_controller/bit_controller/N46 ,
         \byte_controller/bit_controller/N45 ,
         \byte_controller/bit_controller/N44 ,
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
         \byte_controller/bit_controller/sub_103/n128 ,
         \byte_controller/bit_controller/sub_103/n127 ,
         \byte_controller/bit_controller/sub_103/n126 ,
         \byte_controller/bit_controller/sub_103/n125 ,
         \byte_controller/bit_controller/sub_103/n124 ,
         \byte_controller/bit_controller/sub_103/n123 ,
         \byte_controller/bit_controller/sub_103/n122 ,
         \byte_controller/bit_controller/sub_103/n121 ,
         \byte_controller/bit_controller/sub_103/n120 ,
         \byte_controller/bit_controller/sub_103/n119 ,
         \byte_controller/bit_controller/sub_103/n118 ,
         \byte_controller/bit_controller/sub_103/n117 ,
         \byte_controller/bit_controller/sub_103/n116 ,
         \byte_controller/bit_controller/sub_103/n115 ,
         \byte_controller/bit_controller/sub_103/n114 ,
         \byte_controller/bit_controller/sub_103/n113 ,
         \byte_controller/bit_controller/sub_103/n112 ,
         \byte_controller/bit_controller/sub_103/n111 ,
         \byte_controller/bit_controller/sub_103/n110 ,
         \byte_controller/bit_controller/sub_103/n109 ,
         \byte_controller/bit_controller/sub_103/n108 ,
         \byte_controller/bit_controller/sub_103/n107 ,
         \byte_controller/bit_controller/sub_103/n106 ,
         \byte_controller/bit_controller/sub_103/n105 ,
         \byte_controller/bit_controller/sub_103/n104 ,
         \byte_controller/bit_controller/sub_103/n103 ,
         \byte_controller/bit_controller/sub_103/n102 ,
         \byte_controller/bit_controller/sub_103/n101 ,
         \byte_controller/bit_controller/sub_103/n100 ,
         \byte_controller/bit_controller/sub_103/n99 ,
         \byte_controller/bit_controller/sub_103/n98 ,
         \byte_controller/bit_controller/sub_103/n97 ,
         \byte_controller/bit_controller/sub_103/n96 ,
         \byte_controller/bit_controller/sub_103/n95 ,
         \byte_controller/bit_controller/sub_103/n94 ,
         \byte_controller/bit_controller/sub_103/n93 ,
         \byte_controller/bit_controller/sub_103/n92 ,
         \byte_controller/bit_controller/sub_103/n91 ,
         \byte_controller/bit_controller/sub_103/n90 ,
         \byte_controller/bit_controller/sub_103/n89 ,
         \byte_controller/bit_controller/sub_103/n88 ,
         \byte_controller/bit_controller/sub_103/n87 ,
         \byte_controller/bit_controller/sub_103/n86 ,
         \byte_controller/bit_controller/sub_103/n85 ,
         \byte_controller/bit_controller/sub_103/n84 ,
         \byte_controller/bit_controller/sub_103/n83 ,
         \byte_controller/bit_controller/sub_103/n82 ,
         \byte_controller/bit_controller/sub_103/n81 ,
         \byte_controller/bit_controller/sub_103/n80 ,
         \byte_controller/bit_controller/sub_103/n79 ,
         \byte_controller/bit_controller/sub_103/n78 ,
         \byte_controller/bit_controller/sub_103/n77 ,
         \byte_controller/bit_controller/sub_103/n76 ,
         \byte_controller/bit_controller/sub_103/n75 ,
         \byte_controller/bit_controller/sub_103/n74 ,
         \byte_controller/bit_controller/sub_103/n73 ,
         \byte_controller/bit_controller/sub_103/n72 ,
         \byte_controller/bit_controller/sub_103/n71 ,
         \byte_controller/bit_controller/sub_103/n70 ,
         \byte_controller/bit_controller/sub_103/n69 ,
         \byte_controller/bit_controller/sub_103/n68 ,
         \byte_controller/bit_controller/sub_103/n67 ,
         \byte_controller/bit_controller/sub_103/n66 ,
         \byte_controller/bit_controller/sub_103/n65 ,
         \byte_controller/bit_controller/sub_103/n64 ,
         \byte_controller/bit_controller/sub_103/n63 ,
         \byte_controller/bit_controller/sub_103/n62 ,
         \byte_controller/bit_controller/sub_103/n61 ,
         \byte_controller/bit_controller/sub_103/n60 ,
         \byte_controller/bit_controller/sub_103/n59 ,
         \byte_controller/bit_controller/sub_103/n58 ,
         \byte_controller/bit_controller/sub_103/n57 ,
         \byte_controller/bit_controller/sub_103/n56 ,
         \byte_controller/bit_controller/sub_103/n55 ,
         \byte_controller/bit_controller/sub_103/n54 ,
         \byte_controller/bit_controller/sub_103/n53 ,
         \byte_controller/bit_controller/sub_103/n52 ,
         \byte_controller/bit_controller/sub_103/n51 ,
         \byte_controller/bit_controller/sub_103/n50 ,
         \byte_controller/bit_controller/sub_103/n49 ,
         \byte_controller/bit_controller/sub_103/n48 ,
         \byte_controller/bit_controller/sub_103/n47 ,
         \byte_controller/bit_controller/sub_103/n46 ,
         \byte_controller/bit_controller/sub_103/n45 ,
         \byte_controller/bit_controller/sub_103/n44 ,
         \byte_controller/bit_controller/sub_103/n43 ,
         \byte_controller/bit_controller/sub_103/n42 ,
         \byte_controller/bit_controller/sub_103/n41 ,
         \byte_controller/bit_controller/sub_103/n40 ,
         \byte_controller/bit_controller/sub_103/n39 ,
         \byte_controller/bit_controller/sub_103/n38 ,
         \byte_controller/bit_controller/sub_103/n37 ,
         \byte_controller/bit_controller/sub_103/n36 ,
         \byte_controller/bit_controller/sub_103/n35 ,
         \byte_controller/bit_controller/sub_103/n34 ,
         \byte_controller/bit_controller/sub_103/n33 ,
         \byte_controller/bit_controller/sub_103/n32 ,
         \byte_controller/bit_controller/sub_103/n31 ,
         \byte_controller/bit_controller/sub_103/n30 ,
         \byte_controller/bit_controller/sub_103/n29 ,
         \byte_controller/bit_controller/sub_103/n28 ,
         \byte_controller/bit_controller/sub_103/n27 ,
         \byte_controller/bit_controller/sub_103/n26 ,
         \byte_controller/bit_controller/sub_103/n25 ,
         \byte_controller/bit_controller/sub_103/n24 ,
         \byte_controller/bit_controller/sub_103/n23 ,
         \byte_controller/bit_controller/sub_103/n22 ,
         \byte_controller/bit_controller/sub_103/n21 ,
         \byte_controller/bit_controller/sub_103/n20 ,
         \byte_controller/bit_controller/sub_103/n19 ,
         \byte_controller/bit_controller/sub_103/n18 ,
         \byte_controller/bit_controller/sub_103/n17 ,
         \byte_controller/bit_controller/sub_103/n16 ,
         \byte_controller/bit_controller/sub_103/n15 ,
         \byte_controller/bit_controller/sub_103/n14 ,
         \byte_controller/bit_controller/sub_103/n13 ,
         \byte_controller/bit_controller/sub_103/n12 ,
         \byte_controller/bit_controller/sub_103/n11 ,
         \byte_controller/bit_controller/sub_103/n10 ,
         \byte_controller/bit_controller/sub_103/n9 ,
         \byte_controller/bit_controller/sub_103/n8 ,
         \byte_controller/bit_controller/sub_103/n7 ,
         \byte_controller/bit_controller/sub_103/n6 ,
         \byte_controller/bit_controller/sub_103/n5 ,
         \byte_controller/bit_controller/sub_103/n4 ,
         \byte_controller/bit_controller/sub_103/n2 ,
         \byte_controller/bit_controller/sub_103/n1 ,
         \byte_controller/bit_controller/sub_103/n129 ;
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

  DFF_X1 wb_ack_o_reg ( .D(N20), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
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
  DFFR_X1 \cr_reg[5]  ( .D(n112), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n37) );
  DFFR_X1 \cr_reg[4]  ( .D(n113), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n38) );
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
  DFFR_X1 \cr_reg[2]  ( .D(n109), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]), .QN(
        n40) );
  DFFR_X1 \cr_reg[0]  ( .D(n107), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n42) );
  DFFR_X1 \cr_reg[7]  ( .D(n110), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n35) );
  DFFR_X1 \cr_reg[6]  ( .D(n111), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n36) );
  DFFR_X1 \cr_reg[1]  ( .D(n108), .CK(wb_clk_i), .RN(arst_i), .QN(n41) );
  SDFFR_X1 \ctr_reg[7]  ( .D(1'b1), .SI(1'b0), .SE(n158), .CK(wb_clk_i), .RN(
        arst_i), .Q(ctr[7]), .QN(n3) );
  BUF_X2 U121 ( .A(ctr[7]), .Z(n147) );
  BUF_X1 U122 ( .A(n203), .Z(n148) );
  INV_X1 U123 ( .A(n38), .ZN(n149) );
  AND2_X1 U124 ( .A1(n189), .A2(n169), .ZN(n150) );
  AND2_X1 U125 ( .A1(n189), .A2(n157), .ZN(n151) );
  AND3_X1 U126 ( .A1(wb_adr_i[2]), .A2(n194), .A3(n193), .ZN(n152) );
  AND3_X1 U127 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n153) );
  INV_X1 U128 ( .A(n166), .ZN(n154) );
  OAI21_X1 U129 ( .B1(n153), .B2(n156), .A(n154), .ZN(n155) );
  OAI21_X1 U130 ( .B1(n153), .B2(n156), .A(n154), .ZN(n167) );
  NAND3_X1 U131 ( .A1(n194), .A2(n178), .A3(n193), .ZN(n234) );
  NOR2_X1 U132 ( .A1(done), .A2(i2c_al), .ZN(n156) );
  INV_X1 U133 ( .A(wb_rst_i), .ZN(n226) );
  AND3_X1 U134 ( .A1(wb_adr_i[0]), .A2(n178), .A3(n193), .ZN(n157) );
  INV_X1 U135 ( .A(n146), .ZN(n158) );
  INV_X1 U139 ( .A(wb_dat_i[0]), .ZN(n190) );
  NAND2_X1 U140 ( .A1(n153), .A2(n226), .ZN(n164) );
  INV_X1 U141 ( .A(n164), .ZN(n189) );
  INV_X1 U142 ( .A(wb_adr_i[2]), .ZN(n178) );
  NAND3_X1 U143 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[1]), .A3(n178), .ZN(n192) );
  OAI21_X1 U144 ( .B1(n192), .B2(n164), .A(n226), .ZN(n162) );
  NAND2_X1 U145 ( .A1(n189), .A2(n162), .ZN(n163) );
  OAI22_X1 U146 ( .A1(n190), .A2(n163), .B1(n18), .B2(n162), .ZN(n131) );
  INV_X1 U147 ( .A(wb_dat_i[1]), .ZN(n198) );
  OAI22_X1 U148 ( .A1(n198), .A2(n163), .B1(n17), .B2(n162), .ZN(n132) );
  INV_X1 U149 ( .A(wb_dat_i[2]), .ZN(n204) );
  OAI22_X1 U150 ( .A1(n204), .A2(n163), .B1(n16), .B2(n162), .ZN(n133) );
  INV_X1 U151 ( .A(wb_dat_i[3]), .ZN(n207) );
  OAI22_X1 U152 ( .A1(n207), .A2(n163), .B1(n15), .B2(n162), .ZN(n134) );
  INV_X1 U153 ( .A(wb_dat_i[4]), .ZN(n210) );
  OAI22_X1 U154 ( .A1(n210), .A2(n163), .B1(n14), .B2(n162), .ZN(n135) );
  INV_X1 U155 ( .A(wb_dat_i[5]), .ZN(n218) );
  OAI22_X1 U156 ( .A1(n218), .A2(n163), .B1(n13), .B2(n162), .ZN(n136) );
  INV_X1 U157 ( .A(wb_dat_i[6]), .ZN(n188) );
  OAI22_X1 U158 ( .A1(n188), .A2(n163), .B1(n12), .B2(n162), .ZN(n137) );
  INV_X1 U159 ( .A(wb_dat_i[7]), .ZN(n186) );
  OAI22_X1 U160 ( .A1(n186), .A2(n163), .B1(n11), .B2(n162), .ZN(n138) );
  INV_X1 U161 ( .A(wb_adr_i[0]), .ZN(n194) );
  NAND3_X1 U162 ( .A1(wb_adr_i[1]), .A2(n194), .A3(n178), .ZN(n191) );
  OAI21_X1 U163 ( .B1(n191), .B2(n164), .A(n226), .ZN(n217) );
  NAND2_X1 U164 ( .A1(n189), .A2(n217), .ZN(n219) );
  OAI22_X1 U165 ( .A1(n219), .A2(n186), .B1(n3), .B2(n217), .ZN(n146) );
  INV_X1 U166 ( .A(wb_adr_i[1]), .ZN(n193) );
  NAND3_X1 U167 ( .A1(ctr[7]), .A2(n152), .A3(n189), .ZN(n203) );
  NAND2_X1 U168 ( .A1(n203), .A2(n226), .ZN(n166) );
  NAND4_X1 U169 ( .A1(wb_dat_i[3]), .A2(n152), .A3(n189), .A4(n147), .ZN(n165)
         );
  OAI21_X1 U170 ( .B1(n39), .B2(n166), .A(n165), .ZN(n114) );
  NAND2_X1 U171 ( .A1(n167), .A2(n189), .ZN(n168) );
  OAI22_X1 U172 ( .A1(n210), .A2(n168), .B1(n38), .B2(n155), .ZN(n113) );
  OAI22_X1 U173 ( .A1(n218), .A2(n168), .B1(n37), .B2(n155), .ZN(n112) );
  OAI22_X1 U174 ( .A1(n188), .A2(n168), .B1(n36), .B2(n155), .ZN(n111) );
  OAI22_X1 U175 ( .A1(n168), .A2(n186), .B1(n35), .B2(n155), .ZN(n110) );
  INV_X1 U176 ( .A(n234), .ZN(n169) );
  MUX2_X1 U177 ( .A(n34), .B(n190), .S(n150), .Z(n170) );
  NAND2_X1 U178 ( .A1(n226), .A2(n170), .ZN(n115) );
  MUX2_X1 U179 ( .A(n33), .B(n198), .S(n150), .Z(n171) );
  NAND2_X1 U180 ( .A1(n226), .A2(n171), .ZN(n116) );
  MUX2_X1 U181 ( .A(n32), .B(n204), .S(n150), .Z(n172) );
  NAND2_X1 U182 ( .A1(n226), .A2(n172), .ZN(n117) );
  MUX2_X1 U183 ( .A(n31), .B(n207), .S(n150), .Z(n173) );
  NAND2_X1 U184 ( .A1(n226), .A2(n173), .ZN(n118) );
  MUX2_X1 U185 ( .A(n30), .B(n210), .S(n150), .Z(n174) );
  NAND2_X1 U186 ( .A1(n226), .A2(n174), .ZN(n119) );
  MUX2_X1 U187 ( .A(n29), .B(n218), .S(n150), .Z(n175) );
  NAND2_X1 U188 ( .A1(n226), .A2(n175), .ZN(n120) );
  MUX2_X1 U189 ( .A(n28), .B(n188), .S(n150), .Z(n176) );
  NAND2_X1 U190 ( .A1(n226), .A2(n176), .ZN(n121) );
  MUX2_X1 U191 ( .A(n27), .B(n186), .S(n150), .Z(n177) );
  NAND2_X1 U192 ( .A1(n226), .A2(n177), .ZN(n122) );
  MUX2_X1 U193 ( .A(n26), .B(n190), .S(n151), .Z(n179) );
  NAND2_X1 U194 ( .A1(n226), .A2(n179), .ZN(n123) );
  MUX2_X1 U195 ( .A(n25), .B(n198), .S(n151), .Z(n180) );
  NAND2_X1 U196 ( .A1(n226), .A2(n180), .ZN(n124) );
  MUX2_X1 U197 ( .A(n24), .B(n204), .S(n151), .Z(n181) );
  NAND2_X1 U198 ( .A1(n226), .A2(n181), .ZN(n125) );
  MUX2_X1 U199 ( .A(n23), .B(n207), .S(n151), .Z(n182) );
  NAND2_X1 U200 ( .A1(n226), .A2(n182), .ZN(n126) );
  MUX2_X1 U201 ( .A(n22), .B(n210), .S(n151), .Z(n183) );
  NAND2_X1 U202 ( .A1(n226), .A2(n183), .ZN(n127) );
  MUX2_X1 U203 ( .A(n21), .B(n218), .S(n151), .Z(n184) );
  NAND2_X1 U204 ( .A1(n226), .A2(n184), .ZN(n128) );
  MUX2_X1 U205 ( .A(n20), .B(n188), .S(n151), .Z(n185) );
  NAND2_X1 U206 ( .A1(n226), .A2(n185), .ZN(n129) );
  MUX2_X1 U207 ( .A(n19), .B(n186), .S(n151), .Z(n187) );
  NAND2_X1 U208 ( .A1(n226), .A2(n187), .ZN(n130) );
  OAI22_X1 U209 ( .A1(n219), .A2(n188), .B1(n4), .B2(n217), .ZN(n145) );
  NAND2_X1 U210 ( .A1(n189), .A2(n203), .ZN(n202) );
  OAI22_X1 U211 ( .A1(n148), .A2(n190), .B1(n42), .B2(n202), .ZN(n107) );
  AOI211_X1 U212 ( .C1(n43), .C2(n156), .A(cr[0]), .B(wb_rst_i), .ZN(N117) );
  NOR3_X1 U213 ( .A1(n43), .A2(n4), .A3(wb_rst_i), .ZN(N121) );
  AND3_X1 U214 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N20) );
  OAI22_X1 U215 ( .A1(n219), .A2(n190), .B1(n10), .B2(n217), .ZN(n139) );
  INV_X1 U216 ( .A(n191), .ZN(n227) );
  AOI22_X1 U217 ( .A1(prer[8]), .A2(n157), .B1(ctr[0]), .B2(n227), .ZN(n197)
         );
  INV_X1 U218 ( .A(n192), .ZN(n231) );
  NAND3_X1 U219 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[2]), .A3(n193), .ZN(n229) );
  NAND3_X1 U220 ( .A1(wb_adr_i[2]), .A2(wb_adr_i[1]), .A3(n194), .ZN(n228) );
  OAI22_X1 U221 ( .A1(n18), .A2(n229), .B1(n42), .B2(n228), .ZN(n195) );
  AOI221_X1 U222 ( .B1(rxr[0]), .B2(n231), .C1(sr_0), .C2(n152), .A(n195), 
        .ZN(n196) );
  OAI211_X1 U223 ( .C1(n34), .C2(n234), .A(n197), .B(n196), .ZN(N43) );
  OAI22_X1 U224 ( .A1(n148), .A2(n198), .B1(n41), .B2(n202), .ZN(n108) );
  AOI21_X1 U225 ( .B1(n37), .B2(n38), .A(wb_rst_i), .ZN(N116) );
  OAI22_X1 U226 ( .A1(n219), .A2(n198), .B1(n9), .B2(n217), .ZN(n140) );
  AOI22_X1 U227 ( .A1(prer[9]), .A2(n157), .B1(ctr[1]), .B2(n227), .ZN(n201)
         );
  OAI22_X1 U228 ( .A1(n17), .A2(n229), .B1(n41), .B2(n228), .ZN(n199) );
  AOI221_X1 U229 ( .B1(rxr[1]), .B2(n231), .C1(sr_1), .C2(n152), .A(n199), 
        .ZN(n200) );
  OAI211_X1 U230 ( .C1(n33), .C2(n234), .A(n201), .B(n200), .ZN(N44) );
  OAI22_X1 U231 ( .A1(n204), .A2(n148), .B1(n40), .B2(n202), .ZN(n109) );
  OAI22_X1 U232 ( .A1(n219), .A2(n204), .B1(n8), .B2(n217), .ZN(n141) );
  AOI22_X1 U233 ( .A1(prer[10]), .A2(n157), .B1(ctr[2]), .B2(n227), .ZN(n206)
         );
  INV_X1 U234 ( .A(n228), .ZN(n212) );
  INV_X1 U235 ( .A(n229), .ZN(n211) );
  AOI222_X1 U236 ( .A1(rxr[2]), .A2(n231), .B1(cr[2]), .B2(n212), .C1(txr[2]), 
        .C2(n211), .ZN(n205) );
  OAI211_X1 U237 ( .C1(n32), .C2(n234), .A(n206), .B(n205), .ZN(N45) );
  OAI22_X1 U238 ( .A1(n219), .A2(n207), .B1(n7), .B2(n217), .ZN(n142) );
  AOI22_X1 U239 ( .A1(prer[11]), .A2(n157), .B1(ctr[3]), .B2(n227), .ZN(n209)
         );
  AOI222_X1 U240 ( .A1(rxr[3]), .A2(n231), .B1(cr[3]), .B2(n212), .C1(txr[3]), 
        .C2(n211), .ZN(n208) );
  OAI211_X1 U241 ( .C1(n31), .C2(n234), .A(n209), .B(n208), .ZN(N46) );
  OAI22_X1 U242 ( .A1(n219), .A2(n210), .B1(n6), .B2(n217), .ZN(n143) );
  AOI22_X1 U243 ( .A1(prer[12]), .A2(n157), .B1(ctr[4]), .B2(n227), .ZN(n214)
         );
  AOI222_X1 U244 ( .A1(rxr[4]), .A2(n231), .B1(n149), .B2(n212), .C1(txr[4]), 
        .C2(n211), .ZN(n213) );
  OAI211_X1 U245 ( .C1(n30), .C2(n234), .A(n214), .B(n213), .ZN(N47) );
  NAND2_X1 U246 ( .A1(n35), .A2(sr[5]), .ZN(n216) );
  INV_X1 U247 ( .A(i2c_al), .ZN(n215) );
  AOI21_X1 U248 ( .B1(n216), .B2(n215), .A(wb_rst_i), .ZN(N114) );
  OAI22_X1 U249 ( .A1(n219), .A2(n218), .B1(n5), .B2(n217), .ZN(n144) );
  AOI22_X1 U250 ( .A1(prer[13]), .A2(n157), .B1(ctr[5]), .B2(n227), .ZN(n222)
         );
  OAI22_X1 U251 ( .A1(n13), .A2(n229), .B1(n37), .B2(n228), .ZN(n220) );
  AOI221_X1 U252 ( .B1(rxr[5]), .B2(n231), .C1(sr[5]), .C2(n152), .A(n220), 
        .ZN(n221) );
  OAI211_X1 U253 ( .C1(n29), .C2(n234), .A(n222), .B(n221), .ZN(N48) );
  AOI22_X1 U254 ( .A1(prer[14]), .A2(n157), .B1(ctr[6]), .B2(n227), .ZN(n225)
         );
  OAI22_X1 U255 ( .A1(n12), .A2(n229), .B1(n36), .B2(n228), .ZN(n223) );
  AOI221_X1 U256 ( .B1(rxr[6]), .B2(n231), .C1(sr[6]), .C2(n152), .A(n223), 
        .ZN(n224) );
  OAI211_X1 U257 ( .C1(n28), .C2(n234), .A(n225), .B(n224), .ZN(N49) );
  AND2_X1 U258 ( .A1(irxack), .A2(n226), .ZN(N115) );
  AOI22_X1 U259 ( .A1(prer[15]), .A2(n157), .B1(n147), .B2(n227), .ZN(n233) );
  OAI22_X1 U260 ( .A1(n11), .A2(n229), .B1(n35), .B2(n228), .ZN(n230) );
  AOI221_X1 U261 ( .B1(rxr[7]), .B2(n231), .C1(sr[7]), .C2(n152), .A(n230), 
        .ZN(n232) );
  OAI211_X1 U262 ( .C1(n27), .C2(n234), .A(n233), .B(n232), .ZN(N50) );
  NOR2_X1 \byte_controller/U143  ( .A1(\byte_controller/n159 ), .A2(
        \byte_controller/n158 ), .ZN(\byte_controller/n79 ) );
  NAND3_X1 \byte_controller/U142  ( .A1(\byte_controller/n154 ), .A2(
        \byte_controller/n153 ), .A3(\byte_controller/n152 ), .ZN(
        \byte_controller/n80 ) );
  NAND3_X1 \byte_controller/U141  ( .A1(\byte_controller/core_cmd [3]), .A2(
        \byte_controller/n32 ), .A3(\byte_controller/n151 ), .ZN(
        \byte_controller/n152 ) );
  OAI221_X1 \byte_controller/U140  ( .B1(\byte_controller/n150 ), .B2(
        \byte_controller/n149 ), .C1(\byte_controller/c_state [2]), .C2(
        \byte_controller/n148 ), .A(\byte_controller/n147 ), .ZN(
        \byte_controller/n154 ) );
  OAI21_X1 \byte_controller/U139  ( .B1(\byte_controller/n146 ), .B2(
        \byte_controller/n39 ), .A(\byte_controller/n145 ), .ZN(
        \byte_controller/n147 ) );
  INV_X1 \byte_controller/U138  ( .A(\byte_controller/n146 ), .ZN(
        \byte_controller/n148 ) );
  INV_X1 \byte_controller/U137  ( .A(\byte_controller/n11 ), .ZN(
        \byte_controller/n149 ) );
  INV_X1 \byte_controller/U136  ( .A(\byte_controller/n143 ), .ZN(
        \byte_controller/n150 ) );
  OAI33_X1 \byte_controller/U135  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n158 ), .A3(\byte_controller/n140 ), .B1(
        \byte_controller/n29 ), .B2(\byte_controller/n158 ), .B3(
        \byte_controller/n139 ), .ZN(\byte_controller/n141 ) );
  NAND2_X1 \byte_controller/U134  ( .A1(\byte_controller/n136 ), .A2(
        \byte_controller/n135 ), .ZN(\byte_controller/n82 ) );
  NAND2_X1 \byte_controller/U133  ( .A1(\byte_controller/n133 ), .A2(
        \byte_controller/n132 ), .ZN(\byte_controller/n83 ) );
  NAND3_X1 \byte_controller/U132  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n134 ), .A3(\byte_controller/core_cmd [0]), .ZN(
        \byte_controller/n132 ) );
  AOI21_X1 \byte_controller/U131  ( .B1(\byte_controller/n131 ), .B2(
        \byte_controller/n155 ), .A(\byte_controller/n158 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U130  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/n7 ), .ZN(\byte_controller/n155 ) );
  AOI22_X1 \byte_controller/U129  ( .A1(cr[3]), .A2(\byte_controller/n130 ), 
        .B1(\byte_controller/n129 ), .B2(rxr[7]), .ZN(\byte_controller/n131 )
         );
  NAND3_X1 \byte_controller/U128  ( .A1(\byte_controller/n10 ), .A2(
        \byte_controller/n26 ), .A3(\byte_controller/n126 ), .ZN(
        \byte_controller/n129 ) );
  AOI221_X1 \byte_controller/U127  ( .B1(\byte_controller/n24 ), .B2(
        \byte_controller/n125 ), .C1(\byte_controller/n124 ), .C2(
        \byte_controller/c_state [1]), .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n126 ) );
  OAI21_X1 \byte_controller/U126  ( .B1(\byte_controller/n24 ), .B2(
        \byte_controller/n124 ), .A(\byte_controller/n21 ), .ZN(
        \byte_controller/n130 ) );
  OAI221_X1 \byte_controller/U125  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n4 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n121 ), .A(\byte_controller/n120 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U124  ( .A1(txr[7]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n120 ) );
  OAI221_X1 \byte_controller/U123  ( .B1(\byte_controller/n121 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n118 ), .A(\byte_controller/n117 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U122  ( .A1(txr[6]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n117 ) );
  OAI221_X1 \byte_controller/U121  ( .B1(\byte_controller/n118 ), .B2(
        \byte_controller/n4 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n116 ), .A(\byte_controller/n115 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U120  ( .A1(txr[5]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n115 ) );
  OAI221_X1 \byte_controller/U119  ( .B1(\byte_controller/n116 ), .B2(
        \byte_controller/n5 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n114 ), .A(\byte_controller/n113 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U118  ( .A1(txr[4]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n113 ) );
  OAI221_X1 \byte_controller/U117  ( .B1(\byte_controller/n114 ), .B2(
        \byte_controller/n4 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n112 ), .A(\byte_controller/n111 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U116  ( .A1(txr[3]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n111 ) );
  OAI221_X1 \byte_controller/U115  ( .B1(\byte_controller/n112 ), .B2(
        \byte_controller/n1 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n110 ), .A(\byte_controller/n109 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U114  ( .A1(txr[2]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n109 ) );
  OAI221_X1 \byte_controller/U113  ( .B1(\byte_controller/n110 ), .B2(
        \byte_controller/n1 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n108 ), .A(\byte_controller/n107 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U112  ( .A1(txr[1]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n107 ) );
  OAI221_X1 \byte_controller/U111  ( .B1(\byte_controller/n108 ), .B2(
        \byte_controller/n1 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/n156 ), .A(\byte_controller/n106 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U110  ( .A1(txr[0]), .A2(\byte_controller/n119 ), 
        .ZN(\byte_controller/n106 ) );
  INV_X1 \byte_controller/U109  ( .A(\byte_controller/n105 ), .ZN(
        \byte_controller/n119 ) );
  INV_X1 \byte_controller/U108  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n156 ) );
  NAND3_X1 \byte_controller/U107  ( .A1(\byte_controller/n122 ), .A2(
        \byte_controller/n104 ), .A3(\byte_controller/n105 ), .ZN(
        \byte_controller/n123 ) );
  NAND3_X1 \byte_controller/U106  ( .A1(\byte_controller/n101 ), .A2(
        \byte_controller/n102 ), .A3(\byte_controller/n103 ), .ZN(
        \byte_controller/n84 ) );
  NAND2_X1 \byte_controller/U105  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/n78 ), .ZN(\byte_controller/n139 ) );
  NAND3_X1 \byte_controller/U104  ( .A1(\byte_controller/n7 ), .A2(
        \byte_controller/n134 ), .A3(\byte_controller/n32 ), .ZN(
        \byte_controller/n102 ) );
  NAND3_X1 \byte_controller/U103  ( .A1(\byte_controller/n77 ), .A2(
        \byte_controller/n76 ), .A3(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n103 ) );
  NAND2_X1 \byte_controller/U102  ( .A1(\byte_controller/n78 ), .A2(
        \byte_controller/n33 ), .ZN(\byte_controller/n145 ) );
  AOI21_X1 \byte_controller/U101  ( .B1(\byte_controller/n75 ), .B2(
        \byte_controller/n26 ), .A(\byte_controller/n74 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U100  ( .A1(\byte_controller/n7 ), .A2(
        \byte_controller/n2 ), .ZN(\byte_controller/n75 ) );
  NAND2_X1 \byte_controller/U99  ( .A1(\byte_controller/n136 ), .A2(
        \byte_controller/n72 ), .ZN(\byte_controller/n91 ) );
  NAND3_X1 \byte_controller/U98  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n71 ), .A3(\byte_controller/n32 ), .ZN(
        \byte_controller/n72 ) );
  NAND2_X1 \byte_controller/U97  ( .A1(\byte_controller/n70 ), .A2(
        \byte_controller/n8 ), .ZN(\byte_controller/n136 ) );
  OAI21_X1 \byte_controller/U96  ( .B1(\byte_controller/n125 ), .B2(
        \byte_controller/n2 ), .A(\byte_controller/n69 ), .ZN(
        \byte_controller/n70 ) );
  NAND4_X1 \byte_controller/U95  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/n9 ), .A3(\byte_controller/n67 ), .A4(
        \byte_controller/n66 ), .ZN(\byte_controller/n69 ) );
  INV_X1 \byte_controller/U94  ( .A(cr[7]), .ZN(\byte_controller/n66 ) );
  INV_X1 \byte_controller/U93  ( .A(\byte_controller/c_state [3]), .ZN(
        \byte_controller/n125 ) );
  NAND2_X1 \byte_controller/U92  ( .A1(\byte_controller/n65 ), .A2(
        \byte_controller/n137 ), .ZN(\byte_controller/n85 ) );
  NAND3_X1 \byte_controller/U91  ( .A1(\byte_controller/n64 ), .A2(
        \byte_controller/c_state [2]), .A3(\byte_controller/n32 ), .ZN(
        \byte_controller/n65 ) );
  NAND3_X1 \byte_controller/U90  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/n30 ), .ZN(
        \byte_controller/n137 ) );
  OAI221_X1 \byte_controller/U89  ( .B1(\byte_controller/n61 ), .B2(
        \byte_controller/n122 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n60 ), .A(\byte_controller/n105 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U88  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n3 ), .A(\byte_controller/n78 ), .ZN(
        \byte_controller/n61 ) );
  INV_X1 \byte_controller/U87  ( .A(\byte_controller/n59 ), .ZN(
        \byte_controller/n78 ) );
  OAI211_X1 \byte_controller/U86  ( .C1(\byte_controller/n56 ), .C2(
        \byte_controller/n60 ), .A(\byte_controller/n58 ), .B(
        \byte_controller/n105 ), .ZN(\byte_controller/n90 ) );
  NAND3_X1 \byte_controller/U85  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n56 ), .ZN(
        \byte_controller/n58 ) );
  OAI21_X1 \byte_controller/U84  ( .B1(\byte_controller/n55 ), .B2(
        \byte_controller/n122 ), .A(\byte_controller/n104 ), .ZN(
        \byte_controller/n60 ) );
  NAND2_X1 \byte_controller/U83  ( .A1(\byte_controller/n105 ), .A2(
        \byte_controller/n54 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U82  ( .A(\byte_controller/n53 ), .B(
        \byte_controller/n55 ), .S(\byte_controller/n57 ), .Z(
        \byte_controller/n54 ) );
  INV_X1 \byte_controller/U81  ( .A(\byte_controller/n122 ), .ZN(
        \byte_controller/n57 ) );
  NAND2_X1 \byte_controller/U80  ( .A1(\byte_controller/n104 ), .A2(
        \byte_controller/n55 ), .ZN(\byte_controller/n53 ) );
  NAND2_X1 \byte_controller/U79  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n104 ), .ZN(\byte_controller/n105 ) );
  AOI21_X1 \byte_controller/U78  ( .B1(\byte_controller/n140 ), .B2(
        \byte_controller/n39 ), .A(\byte_controller/n74 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U77  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n59 ), .ZN(\byte_controller/n140 ) );
  OAI21_X1 \byte_controller/U76  ( .B1(\byte_controller/n19 ), .B2(
        \byte_controller/n74 ), .A(\byte_controller/n52 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U75  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/n32 ), .A3(\byte_controller/n35 ), .A4(
        \byte_controller/n50 ), .ZN(\byte_controller/n52 ) );
  NAND2_X1 \byte_controller/U74  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n74 ) );
  NAND2_X1 \byte_controller/U73  ( .A1(\byte_controller/n49 ), .A2(
        \byte_controller/n153 ), .ZN(\byte_controller/n86 ) );
  NAND3_X1 \byte_controller/U72  ( .A1(\byte_controller/n64 ), .A2(
        \byte_controller/c_state [1]), .A3(\byte_controller/n32 ), .ZN(
        \byte_controller/n49 ) );
  NAND2_X1 \byte_controller/U71  ( .A1(\byte_controller/n138 ), .A2(
        \byte_controller/n146 ), .ZN(\byte_controller/n64 ) );
  NAND2_X1 \byte_controller/U70  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n59 ), .ZN(\byte_controller/n146 ) );
  NAND3_X1 \byte_controller/U69  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n56 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n59 ) );
  INV_X1 \byte_controller/U68  ( .A(\byte_controller/n151 ), .ZN(
        \byte_controller/n138 ) );
  MUX2_X1 \byte_controller/U67  ( .A(\byte_controller/n124 ), .B(
        \byte_controller/n48 ), .S(\byte_controller/n12 ), .Z(
        \byte_controller/n151 ) );
  NAND3_X1 \byte_controller/U66  ( .A1(\byte_controller/n13 ), .A2(
        \byte_controller/n77 ), .A3(\byte_controller/n30 ), .ZN(
        \byte_controller/n153 ) );
  OAI21_X1 \byte_controller/U65  ( .B1(cr[7]), .B2(\byte_controller/n46 ), .A(
        \byte_controller/n19 ), .ZN(\byte_controller/n47 ) );
  NAND2_X1 \byte_controller/U64  ( .A1(\byte_controller/n133 ), .A2(
        \byte_controller/n45 ), .ZN(\byte_controller/n87 ) );
  NAND3_X1 \byte_controller/U63  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/c_state [0]), .A3(\byte_controller/n32 ), .ZN(
        \byte_controller/n45 ) );
  INV_X1 \byte_controller/U62  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n124 ) );
  NAND3_X1 \byte_controller/U61  ( .A1(\byte_controller/n28 ), .A2(
        \byte_controller/n37 ), .A3(cr[7]), .ZN(\byte_controller/n133 ) );
  NAND2_X1 \byte_controller/U60  ( .A1(\byte_controller/n144 ), .A2(
        \byte_controller/n14 ), .ZN(\byte_controller/n77 ) );
  NAND2_X1 \byte_controller/U59  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/n43 ), .ZN(\byte_controller/n143 ) );
  NAND4_X1 \byte_controller/U58  ( .A1(\byte_controller/n25 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/n36 ), .A4(
        \byte_controller/n21 ), .ZN(\byte_controller/n43 ) );
  NAND3_X1 \byte_controller/U57  ( .A1(\byte_controller/n68 ), .A2(
        \byte_controller/n67 ), .A3(\byte_controller/n73 ), .ZN(
        \byte_controller/n51 ) );
  INV_X1 \byte_controller/U56  ( .A(cr[6]), .ZN(\byte_controller/n73 ) );
  INV_X1 \byte_controller/U55  ( .A(cr[5]), .ZN(\byte_controller/n67 ) );
  INV_X1 \byte_controller/U54  ( .A(cr[4]), .ZN(\byte_controller/n68 ) );
  INV_X1 \byte_controller/U53  ( .A(wb_rst_i), .ZN(\byte_controller/n104 ) );
  NAND2_X1 \byte_controller/U52  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n24 ), .ZN(\byte_controller/n46 ) );
  NAND4_X1 \byte_controller/U51  ( .A1(\byte_controller/n51 ), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/n42 ), .A4(
        \byte_controller/n41 ), .ZN(\byte_controller/n144 ) );
  CLKBUF_X1 \byte_controller/U50  ( .A(\byte_controller/n24 ), .Z(
        \byte_controller/n39 ) );
  NAND4_X1 \byte_controller/U49  ( .A1(\byte_controller/n35 ), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/n42 ), .A4(
        \byte_controller/n41 ), .ZN(\byte_controller/n38 ) );
  NOR2_X1 \byte_controller/U48  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n13 ), .ZN(\byte_controller/n63 ) );
  AND2_X1 \byte_controller/U47  ( .A1(\byte_controller/n128 ), .A2(
        \byte_controller/n127 ), .ZN(\byte_controller/n36 ) );
  AND3_X1 \byte_controller/U46  ( .A1(\byte_controller/n151 ), .A2(
        \byte_controller/n33 ), .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/n142 ) );
  NAND3_X1 \byte_controller/U45  ( .A1(\byte_controller/n68 ), .A2(
        \byte_controller/n67 ), .A3(\byte_controller/n73 ), .ZN(
        \byte_controller/n35 ) );
  BUF_X2 \byte_controller/U44  ( .A(arst_i), .Z(\byte_controller/n34 ) );
  MUX2_X1 \byte_controller/U43  ( .A(\byte_controller/n156 ), .B(
        \byte_controller/n157 ), .S(\byte_controller/n155 ), .Z(
        \byte_controller/n159 ) );
  AND2_X1 \byte_controller/U42  ( .A1(\byte_controller/n10 ), .A2(
        \byte_controller/n127 ), .ZN(\byte_controller/n31 ) );
  NAND2_X1 \byte_controller/U41  ( .A1(\byte_controller/n8 ), .A2(
        \byte_controller/n100 ), .ZN(\byte_controller/n101 ) );
  NOR2_X1 \byte_controller/U40  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/c_state [0]), .ZN(\byte_controller/n41 ) );
  NAND2_X1 \byte_controller/U39  ( .A1(\byte_controller/n44 ), .A2(
        \byte_controller/n50 ), .ZN(\byte_controller/n48 ) );
  AND2_X1 \byte_controller/U38  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n47 ), .ZN(\byte_controller/n30 ) );
  NAND2_X1 \byte_controller/U37  ( .A1(\byte_controller/n9 ), .A2(
        \byte_controller/n19 ), .ZN(\byte_controller/n62 ) );
  INV_X1 \byte_controller/U36  ( .A(\byte_controller/n139 ), .ZN(
        \byte_controller/n100 ) );
  AND2_X1 \byte_controller/U35  ( .A1(\byte_controller/n38 ), .A2(
        \byte_controller/n14 ), .ZN(\byte_controller/n29 ) );
  AND2_X1 \byte_controller/U34  ( .A1(\byte_controller/n77 ), .A2(
        \byte_controller/n32 ), .ZN(\byte_controller/n28 ) );
  INV_X1 \byte_controller/U33  ( .A(\byte_controller/n145 ), .ZN(
        \byte_controller/n76 ) );
  INV_X1 \byte_controller/U32  ( .A(\byte_controller/n71 ), .ZN(
        \byte_controller/n26 ) );
  AND2_X1 \byte_controller/U31  ( .A1(\byte_controller/n144 ), .A2(
        \byte_controller/n143 ), .ZN(\byte_controller/n23 ) );
  AND4_X2 \byte_controller/U30  ( .A1(\byte_controller/n25 ), .A2(
        \byte_controller/n127 ), .A3(\byte_controller/n128 ), .A4(
        \byte_controller/n22 ), .ZN(\byte_controller/n40 ) );
  AND2_X1 \byte_controller/U29  ( .A1(\byte_controller/n50 ), .A2(
        \byte_controller/n21 ), .ZN(\byte_controller/n42 ) );
  NOR2_X2 \byte_controller/U28  ( .A1(i2c_al), .A2(wb_rst_i), .ZN(
        \byte_controller/n17 ) );
  AND3_X1 \byte_controller/U27  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/n30 ), .ZN(
        \byte_controller/n16 ) );
  NAND2_X1 \byte_controller/U26  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/n43 ), .ZN(\byte_controller/n14 ) );
  CLKBUF_X1 \byte_controller/U25  ( .A(\byte_controller/n25 ), .Z(
        \byte_controller/n19 ) );
  OR3_X1 \byte_controller/U24  ( .A1(cr[4]), .A2(cr[6]), .A3(cr[5]), .ZN(
        \byte_controller/n44 ) );
  CLKBUF_X1 \byte_controller/U23  ( .A(cr[5]), .Z(\byte_controller/n13 ) );
  AND2_X1 \byte_controller/U22  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n24 ), .ZN(\byte_controller/n20 ) );
  AND2_X1 \byte_controller/U21  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n24 ), .ZN(\byte_controller/n12 ) );
  INV_X1 \byte_controller/U20  ( .A(\byte_controller/n17 ), .ZN(
        \byte_controller/n158 ) );
  NAND3_X1 \byte_controller/U19  ( .A1(\byte_controller/core_cmd [1]), .A2(
        \byte_controller/n134 ), .A3(\byte_controller/n17 ), .ZN(
        \byte_controller/n135 ) );
  OR3_X1 \byte_controller/U18  ( .A1(\byte_controller/n16 ), .A2(
        \byte_controller/n142 ), .A3(\byte_controller/n141 ), .ZN(
        \byte_controller/n81 ) );
  CLKBUF_X1 \byte_controller/U17  ( .A(\byte_controller/n38 ), .Z(
        \byte_controller/n11 ) );
  CLKBUF_X1 \byte_controller/U16  ( .A(\byte_controller/n128 ), .Z(
        \byte_controller/n10 ) );
  INV_X1 \byte_controller/U15  ( .A(cr[4]), .ZN(\byte_controller/n9 ) );
  AND2_X1 \byte_controller/U14  ( .A1(\byte_controller/n77 ), .A2(
        \byte_controller/n32 ), .ZN(\byte_controller/n8 ) );
  MUX2_X1 \byte_controller/U13  ( .A(\byte_controller/n124 ), .B(
        \byte_controller/n48 ), .S(\byte_controller/n20 ), .Z(
        \byte_controller/n134 ) );
  BUF_X1 \byte_controller/U12  ( .A(\byte_controller/c_state [3]), .Z(
        \byte_controller/n7 ) );
  BUF_X1 \byte_controller/U11  ( .A(\byte_controller/n123 ), .Z(
        \byte_controller/n5 ) );
  BUF_X1 \byte_controller/U10  ( .A(\byte_controller/n123 ), .Z(
        \byte_controller/n4 ) );
  BUF_X1 \byte_controller/U9  ( .A(\byte_controller/n22 ), .Z(
        \byte_controller/n21 ) );
  BUF_X2 \byte_controller/U8  ( .A(\byte_controller/n17 ), .Z(
        \byte_controller/n32 ) );
  BUF_X1 \byte_controller/U7  ( .A(\byte_controller/n17 ), .Z(
        \byte_controller/n33 ) );
  INV_X1 \byte_controller/U6  ( .A(cr[6]), .ZN(\byte_controller/n2 ) );
  BUF_X2 \byte_controller/U5  ( .A(\byte_controller/n20 ), .Z(
        \byte_controller/n37 ) );
  OR3_X4 \byte_controller/U4  ( .A1(\byte_controller/ld ), .A2(wb_rst_i), .A3(
        \byte_controller/n27 ), .ZN(\byte_controller/n122 ) );
  NAND3_X1 \byte_controller/U3  ( .A1(\byte_controller/n122 ), .A2(
        \byte_controller/n104 ), .A3(\byte_controller/n105 ), .ZN(
        \byte_controller/n1 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(
        \byte_controller/core_cmd [1]) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n34 ), .Q(\byte_controller/ld ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n157 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .QN(\byte_controller/n27 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/n55 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(done), .QN(\byte_controller/n50 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[0]), .QN(
        \byte_controller/n108 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[1]), .QN(
        \byte_controller/n110 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[2]), .QN(
        \byte_controller/n112 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[3]), .QN(
        \byte_controller/n114 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[4]), .QN(
        \byte_controller/n116 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[5]), .QN(
        \byte_controller/n118 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[6]), .QN(
        \byte_controller/n121 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n90 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n56 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n22 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n128 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/n71 ), .QN(
        \byte_controller/n127 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [0]), .QN(
        \byte_controller/n25 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n24 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(
        \byte_controller/core_cmd [0]) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(\byte_controller/n34 ), .Q(\byte_controller/n3 ), .QN(
        \byte_controller/n15 ) );
  AOI21_X1 \byte_controller/bit_controller/U173  ( .B1(
        \byte_controller/bit_controller/n130 ), .B2(
        \byte_controller/bit_controller/n40 ), .A(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/N172 ) );
  AOI211_X1 \byte_controller/bit_controller/U172  ( .C1(
        \byte_controller/bit_controller/n89 ), .C2(
        \byte_controller/bit_controller/n88 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N76 ) );
  NOR3_X1 \byte_controller/bit_controller/U171  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/N70 ), .A3(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  INV_X1 \byte_controller/bit_controller/U170  ( .A(
        \byte_controller/bit_controller/n212 ), .ZN(
        \byte_controller/bit_controller/n102 ) );
  INV_X1 \byte_controller/bit_controller/U169  ( .A(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n134 ) );
  MUX2_X1 \byte_controller/bit_controller/U168  ( .A(
        \byte_controller/bit_controller/n210 ), .B(
        \byte_controller/bit_controller/n209 ), .S(
        \byte_controller/bit_controller/n208 ), .Z(
        \byte_controller/bit_controller/n211 ) );
  AOI21_X1 \byte_controller/bit_controller/U167  ( .B1(
        \byte_controller/bit_controller/n39 ), .B2(
        \byte_controller/bit_controller/n207 ), .A(
        \byte_controller/bit_controller/n206 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  INV_X1 \byte_controller/bit_controller/U166  ( .A(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  INV_X1 \byte_controller/bit_controller/U165  ( .A(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  AOI211_X1 \byte_controller/bit_controller/U164  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n204 ), .A(\byte_controller/bit_controller/n203 ), .B(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  NAND3_X1 \byte_controller/bit_controller/U163  ( .A1(
        \byte_controller/bit_controller/n201 ), .A2(
        \byte_controller/bit_controller/n200 ), .A3(
        \byte_controller/bit_controller/n28 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  INV_X1 \byte_controller/bit_controller/U162  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n201 ) );
  NAND4_X1 \byte_controller/bit_controller/U161  ( .A1(
        \byte_controller/bit_controller/n44 ), .A2(
        \byte_controller/bit_controller/n125 ), .A3(
        \byte_controller/bit_controller/n131 ), .A4(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  NAND3_X1 \byte_controller/bit_controller/U160  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(
        \byte_controller/bit_controller/n122 ), .A3(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  OAI22_X1 \byte_controller/bit_controller/U159  ( .A1(
        \byte_controller/bit_controller/n53 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n125 ), .B2(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/n138 ) );
  OAI22_X1 \byte_controller/bit_controller/U158  ( .A1(
        \byte_controller/bit_controller/n53 ), .A2(
        \byte_controller/bit_controller/n200 ), .B1(
        \byte_controller/bit_controller/n197 ), .B2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n139 ) );
  OAI22_X1 \byte_controller/bit_controller/U157  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n52 ), .B1(
        \byte_controller/bit_controller/n205 ), .B2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  OAI33_X1 \byte_controller/bit_controller/U156  ( .A1(
        \byte_controller/bit_controller/n196 ), .A2(
        \byte_controller/bit_controller/n195 ), .A3(
        \byte_controller/bit_controller/n194 ), .B1(
        \byte_controller/bit_controller/N70 ), .B2(
        \byte_controller/bit_controller/n193 ), .B3(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/N84 ) );
  NAND2_X1 \byte_controller/bit_controller/U155  ( .A1(
        \byte_controller/bit_controller/n23 ), .A2(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n196 ) );
  OAI22_X1 \byte_controller/bit_controller/U154  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(
        \byte_controller/bit_controller/n53 ), .B1(
        \byte_controller/bit_controller/n57 ), .B2(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  NOR2_X1 \byte_controller/bit_controller/U153  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n103 ) );
  MUX2_X1 \byte_controller/bit_controller/U152  ( .A(
        \byte_controller/bit_controller/n189 ), .B(
        \byte_controller/bit_controller/n91 ), .S(
        \byte_controller/bit_controller/n104 ), .Z(
        \byte_controller/bit_controller/n190 ) );
  NAND3_X1 \byte_controller/bit_controller/U151  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n188 ), .A3(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n189 ) );
  NAND2_X1 \byte_controller/bit_controller/U150  ( .A1(
        \byte_controller/bit_controller/n191 ), .A2(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/N64 ) );
  OAI21_X1 \byte_controller/bit_controller/U149  ( .B1(
        \byte_controller/bit_controller/n87 ), .B2(
        \byte_controller/bit_controller/n99 ), .A(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  INV_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n184 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  AOI222_X1 \byte_controller/bit_controller/U147  ( .A1(prer[0]), .A2(
        \byte_controller/bit_controller/n38 ), .B1(
        \byte_controller/bit_controller/N32 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n5 ), .C2(
        \byte_controller/bit_controller/n20 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  INV_X1 \byte_controller/bit_controller/U146  ( .A(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  AOI222_X1 \byte_controller/bit_controller/U145  ( .A1(
        \byte_controller/bit_controller/N47 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n15 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  INV_X1 \byte_controller/bit_controller/U144  ( .A(
        \byte_controller/bit_controller/n181 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  AOI222_X1 \byte_controller/bit_controller/U143  ( .A1(prer[13]), .A2(
        \byte_controller/bit_controller/n4 ), .B1(
        \byte_controller/bit_controller/N45 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n15 ), .C2(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/n181 ) );
  INV_X1 \byte_controller/bit_controller/U142  ( .A(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n217 ) );
  AOI222_X1 \byte_controller/bit_controller/U141  ( .A1(
        \byte_controller/bit_controller/N46 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n15 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n25 ), .ZN(
        \byte_controller/bit_controller/n180 ) );
  INV_X1 \byte_controller/bit_controller/U140  ( .A(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n218 ) );
  AOI222_X1 \byte_controller/bit_controller/U139  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n5 ), .B2(
        \byte_controller/bit_controller/cnt [11]), .C1(
        \byte_controller/bit_controller/n25 ), .C2(prer[11]), .ZN(
        \byte_controller/bit_controller/n179 ) );
  INV_X1 \byte_controller/bit_controller/U138  ( .A(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  AOI222_X1 \byte_controller/bit_controller/U137  ( .A1(
        \byte_controller/bit_controller/N44 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n5 ), .B2(
        \byte_controller/bit_controller/cnt [12]), .C1(prer[12]), .C2(
        \byte_controller/bit_controller/n25 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n177 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  AOI222_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n15 ), .B2(
        \byte_controller/bit_controller/cnt [10]), .C1(
        \byte_controller/bit_controller/n25 ), .C2(prer[10]), .ZN(
        \byte_controller/bit_controller/n177 ) );
  INV_X1 \byte_controller/bit_controller/U134  ( .A(
        \byte_controller/bit_controller/n176 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  AOI222_X1 \byte_controller/bit_controller/U133  ( .A1(prer[6]), .A2(
        \byte_controller/bit_controller/n4 ), .B1(
        \byte_controller/bit_controller/N38 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n15 ), .C2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n176 ) );
  INV_X1 \byte_controller/bit_controller/U132  ( .A(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n160 ) );
  AOI222_X1 \byte_controller/bit_controller/U131  ( .A1(prer[7]), .A2(
        \byte_controller/bit_controller/n38 ), .B1(
        \byte_controller/bit_controller/N39 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n15 ), .C2(
        \byte_controller/bit_controller/n174 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  INV_X1 \byte_controller/bit_controller/U130  ( .A(
        \byte_controller/bit_controller/n173 ), .ZN(
        \byte_controller/bit_controller/n215 ) );
  AOI222_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n5 ), .B2(
        \byte_controller/bit_controller/cnt [8]), .C1(prer[8]), .C2(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  INV_X1 \byte_controller/bit_controller/U128  ( .A(
        \byte_controller/bit_controller/n172 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  AOI222_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n15 ), .B2(
        \byte_controller/bit_controller/n37 ), .C1(prer[9]), .C2(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  INV_X1 \byte_controller/bit_controller/U126  ( .A(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n166 ) );
  AOI222_X1 \byte_controller/bit_controller/U125  ( .A1(
        \byte_controller/bit_controller/n17 ), .A2(prer[1]), .B1(
        \byte_controller/bit_controller/N33 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n15 ), .C2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/n171 ) );
  INV_X1 \byte_controller/bit_controller/U124  ( .A(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  AOI222_X1 \byte_controller/bit_controller/U123  ( .A1(prer[2]), .A2(
        \byte_controller/bit_controller/n4 ), .B1(
        \byte_controller/bit_controller/N34 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n5 ), .C2(
        \byte_controller/bit_controller/n21 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  INV_X1 \byte_controller/bit_controller/U122  ( .A(
        \byte_controller/bit_controller/n162 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  AOI222_X1 \byte_controller/bit_controller/U121  ( .A1(prer[3]), .A2(
        \byte_controller/bit_controller/n38 ), .B1(
        \byte_controller/bit_controller/N35 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n15 ), .C2(
        \byte_controller/bit_controller/n24 ), .ZN(
        \byte_controller/bit_controller/n162 ) );
  INV_X1 \byte_controller/bit_controller/U120  ( .A(
        \byte_controller/bit_controller/n159 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  AOI222_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n17 ), .A2(prer[4]), .B1(
        \byte_controller/bit_controller/N36 ), .B2(
        \byte_controller/bit_controller/n55 ), .C1(
        \byte_controller/bit_controller/n15 ), .C2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/n159 ) );
  INV_X1 \byte_controller/bit_controller/U118  ( .A(
        \byte_controller/bit_controller/n158 ), .ZN(
        \byte_controller/bit_controller/n219 ) );
  AOI222_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n41 ), .B1(
        \byte_controller/bit_controller/n15 ), .B2(
        \byte_controller/bit_controller/cnt [5]), .C1(
        \byte_controller/bit_controller/n183 ), .C2(prer[5]), .ZN(
        \byte_controller/bit_controller/n158 ) );
  OAI21_X1 \byte_controller/bit_controller/U116  ( .B1(
        \byte_controller/bit_controller/n87 ), .B2(
        \byte_controller/bit_controller/N69 ), .A(
        \byte_controller/bit_controller/n156 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OAI22_X1 \byte_controller/bit_controller/U115  ( .A1(n147), .A2(wb_rst_i), 
        .B1(\byte_controller/bit_controller/n153 ), .B2(
        \byte_controller/bit_controller/n155 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  NAND4_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n152 ), .A2(
        \byte_controller/bit_controller/n119 ), .A3(
        \byte_controller/bit_controller/n120 ), .A4(
        \byte_controller/bit_controller/n133 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  NAND4_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n110 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n127 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  INV_X1 \byte_controller/bit_controller/U112  ( .A(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/n98 ) );
  NAND2_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n90 ), .A2(n147), .ZN(
        \byte_controller/bit_controller/n185 ) );
  NAND4_X1 \byte_controller/bit_controller/U110  ( .A1(
        \byte_controller/bit_controller/n85 ), .A2(
        \byte_controller/bit_controller/n84 ), .A3(
        \byte_controller/bit_controller/n83 ), .A4(
        \byte_controller/bit_controller/n82 ), .ZN(
        \byte_controller/bit_controller/n90 ) );
  INV_X1 \byte_controller/bit_controller/U109  ( .A(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  OAI211_X1 \byte_controller/bit_controller/U108  ( .C1(
        \byte_controller/bit_controller/n81 ), .C2(
        \byte_controller/bit_controller/n80 ), .A(
        \byte_controller/bit_controller/n79 ), .B(
        \byte_controller/bit_controller/n78 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  AOI22_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/bit_controller/n56 ), .A2(
        \byte_controller/bit_controller/n214 ), .B1(
        \byte_controller/bit_controller/n80 ), .B2(scl_padoen_o), .ZN(
        \byte_controller/bit_controller/n78 ) );
  NAND2_X1 \byte_controller/bit_controller/U106  ( .A1(
        \byte_controller/bit_controller/n28 ), .A2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n214 ) );
  NAND3_X1 \byte_controller/bit_controller/U105  ( .A1(
        \byte_controller/bit_controller/n3 ), .A2(scl_padoen_o), .A3(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n79 ) );
  NOR3_X1 \byte_controller/bit_controller/U104  ( .A1(
        \byte_controller/bit_controller/n213 ), .A2(
        \byte_controller/bit_controller/n97 ), .A3(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n75 ) );
  NAND2_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n48 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  NAND2_X1 \byte_controller/bit_controller/U102  ( .A1(
        \byte_controller/bit_controller/n132 ), .A2(
        \byte_controller/bit_controller/n56 ), .ZN(
        \byte_controller/bit_controller/n80 ) );
  NOR4_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n74 ), .A2(
        \byte_controller/bit_controller/n73 ), .A3(
        \byte_controller/bit_controller/n92 ), .A4(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n81 ) );
  NAND3_X1 \byte_controller/bit_controller/U100  ( .A1(
        \byte_controller/bit_controller/n200 ), .A2(
        \byte_controller/bit_controller/n48 ), .A3(
        \byte_controller/bit_controller/n7 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  NAND4_X1 \byte_controller/bit_controller/U99  ( .A1(
        \byte_controller/bit_controller/n128 ), .A2(
        \byte_controller/bit_controller/n44 ), .A3(
        \byte_controller/bit_controller/n131 ), .A4(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n74 ) );
  OAI21_X1 \byte_controller/bit_controller/U98  ( .B1(
        \byte_controller/bit_controller/n132 ), .B2(
        \byte_controller/bit_controller/n57 ), .A(
        \byte_controller/bit_controller/n72 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  NAND4_X1 \byte_controller/bit_controller/U97  ( .A1(
        \byte_controller/bit_controller/n26 ), .A2(
        \byte_controller/bit_controller/n71 ), .A3(
        \byte_controller/bit_controller/n70 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n72 ) );
  OAI22_X1 \byte_controller/bit_controller/U96  ( .A1(
        \byte_controller/bit_controller/n53 ), .A2(
        \byte_controller/bit_controller/n7 ), .B1(
        \byte_controller/bit_controller/n130 ), .B2(
        \byte_controller/bit_controller/n57 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/bit_controller/n52 ), .A2(
        \byte_controller/bit_controller/n69 ), .B1(
        \byte_controller/bit_controller/n2 ), .B2(
        \byte_controller/bit_controller/n7 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U94  ( .A1(
        \byte_controller/bit_controller/n14 ), .A2(
        \byte_controller/bit_controller/n53 ), .B1(
        \byte_controller/bit_controller/n205 ), .B2(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI22_X1 \byte_controller/bit_controller/U93  ( .A1(
        \byte_controller/bit_controller/n132 ), .A2(
        \byte_controller/bit_controller/n53 ), .B1(
        \byte_controller/bit_controller/n131 ), .B2(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  OAI21_X1 \byte_controller/bit_controller/U92  ( .B1(
        \byte_controller/bit_controller/n126 ), .B2(
        \byte_controller/bit_controller/n2 ), .A(
        \byte_controller/bit_controller/n68 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  NAND3_X1 \byte_controller/bit_controller/U91  ( .A1(
        \byte_controller/bit_controller/n67 ), .A2(
        \byte_controller/bit_controller/n70 ), .A3(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/n68 ) );
  NOR3_X1 \byte_controller/bit_controller/U90  ( .A1(
        \byte_controller/bit_controller/n192 ), .A2(
        \byte_controller/bit_controller/n66 ), .A3(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  OAI22_X1 \byte_controller/bit_controller/U89  ( .A1(
        \byte_controller/bit_controller/n128 ), .A2(
        \byte_controller/bit_controller/n52 ), .B1(
        \byte_controller/bit_controller/n44 ), .B2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U88  ( .A1(
        \byte_controller/bit_controller/n52 ), .A2(
        \byte_controller/bit_controller/n65 ), .B1(
        \byte_controller/bit_controller/n128 ), .B2(
        \byte_controller/bit_controller/n57 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U87  ( .A1(
        \byte_controller/bit_controller/n129 ), .A2(
        \byte_controller/bit_controller/n52 ), .B1(
        \byte_controller/bit_controller/n57 ), .B2(
        \byte_controller/bit_controller/n65 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  OAI22_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n52 ), .B1(
        \byte_controller/bit_controller/n129 ), .B2(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  NAND4_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n39 ), .A2(
        \byte_controller/bit_controller/n187 ), .A3(
        \byte_controller/bit_controller/n188 ), .A4(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n64 ) );
  INV_X1 \byte_controller/bit_controller/U84  ( .A(
        \byte_controller/bit_controller/n66 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  NAND2_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  INV_X1 \byte_controller/bit_controller/U82  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n71 ) );
  OAI22_X1 \byte_controller/bit_controller/U81  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n52 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U80  ( .A1(
        \byte_controller/bit_controller/n46 ), .A2(
        \byte_controller/bit_controller/n52 ), .B1(
        \byte_controller/bit_controller/n43 ), .B2(
        \byte_controller/bit_controller/n57 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  OAI22_X1 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n53 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n46 ), .B2(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  OAI21_X1 \byte_controller/bit_controller/U78  ( .B1(
        \byte_controller/bit_controller/n57 ), .B2(
        \byte_controller/bit_controller/n198 ), .A(
        \byte_controller/bit_controller/n62 ), .ZN(
        \byte_controller/bit_controller/n137 ) );
  NAND4_X1 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n26 ), .A2(
        \byte_controller/bit_controller/n63 ), .A3(
        \byte_controller/bit_controller/n70 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n62 ) );
  INV_X1 \byte_controller/bit_controller/U76  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n187 ) );
  NAND2_X1 \byte_controller/bit_controller/U75  ( .A1(
        \byte_controller/bit_controller/n19 ), .A2(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/n192 ) );
  NAND3_X1 \byte_controller/bit_controller/U74  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n122 ), .A3(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  NAND4_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n50 ), .A2(
        \byte_controller/bit_controller/n48 ), .A3(
        \byte_controller/bit_controller/n126 ), .A4(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n59 ) );
  INV_X1 \byte_controller/bit_controller/U72  ( .A(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  INV_X1 \byte_controller/bit_controller/U71  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n70 ) );
  INV_X1 \byte_controller/bit_controller/U70  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n63 ) );
  NAND2_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n191 ), .A2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  NOR4_X1 \byte_controller/bit_controller/U68  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n6 ), .A3(
        \byte_controller/bit_controller/n8 ), .A4(
        \byte_controller/bit_controller/n58 ), .ZN(
        \byte_controller/bit_controller/N74 ) );
  OR2_X1 \byte_controller/bit_controller/U67  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n191 ), .A2(
        \byte_controller/bit_controller/n8 ), .ZN(
        \byte_controller/bit_controller/N70 ) );
  INV_X1 \byte_controller/bit_controller/U65  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n191 ) );
  OR2_X1 \byte_controller/bit_controller/U64  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N68 ) );
  NAND2_X1 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n28 ), .ZN(
        \byte_controller/bit_controller/n57 ) );
  AND4_X1 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n117 ), .A3(
        \byte_controller/bit_controller/n119 ), .A4(
        \byte_controller/bit_controller/n120 ), .ZN(
        \byte_controller/bit_controller/n85 ) );
  NAND2_X2 \byte_controller/bit_controller/U61  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n28 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  AND4_X1 \byte_controller/bit_controller/U60  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n112 ), .A4(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n133 ) );
  AND4_X1 \byte_controller/bit_controller/U59  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n118 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  NAND2_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n28 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n53 ) );
  NAND2_X1 \byte_controller/bit_controller/U57  ( .A1(
        \byte_controller/bit_controller/n28 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n52 ) );
  AND4_X1 \byte_controller/bit_controller/U56  ( .A1(
        \byte_controller/bit_controller/n107 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/n191 ), .A4(
        \byte_controller/bit_controller/n105 ), .ZN(
        \byte_controller/bit_controller/n127 ) );
  AND2_X1 \byte_controller/bit_controller/U55  ( .A1(
        \byte_controller/bit_controller/n10 ), .A2(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n54 ) );
  NAND2_X1 \byte_controller/bit_controller/U54  ( .A1(n147), .A2(
        \byte_controller/bit_controller/n18 ), .ZN(
        \byte_controller/bit_controller/n49 ) );
  AND4_X1 \byte_controller/bit_controller/U53  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/n108 ), .A4(
        \byte_controller/bit_controller/n107 ), .ZN(
        \byte_controller/bit_controller/n82 ) );
  AND2_X1 \byte_controller/bit_controller/U52  ( .A1(n147), .A2(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n47 ) );
  INV_X1 \byte_controller/bit_controller/U51  ( .A(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/n46 ) );
  INV_X1 \byte_controller/bit_controller/U50  ( .A(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/n43 ) );
  AND4_X1 \byte_controller/bit_controller/U49  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n115 ), .A3(
        \byte_controller/bit_controller/n114 ), .A4(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  AND3_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n122 ), .A3(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/n40 ) );
  INV_X1 \byte_controller/bit_controller/U47  ( .A(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n39 ) );
  INV_X1 \byte_controller/bit_controller/U46  ( .A(
        \byte_controller/bit_controller/n157 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U45  ( .A(
        \byte_controller/bit_controller/cnt [9]), .Z(
        \byte_controller/bit_controller/n37 ) );
  AND4_X1 \byte_controller/bit_controller/U44  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n111 ), .A4(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/n83 ) );
  NAND2_X1 \byte_controller/bit_controller/U43  ( .A1(
        \byte_controller/bit_controller/n100 ), .A2(
        \byte_controller/bit_controller/n99 ), .ZN(
        \byte_controller/bit_controller/n29 ) );
  MUX2_X1 \byte_controller/bit_controller/U42  ( .A(
        \byte_controller/bit_controller/n8 ), .B(
        \byte_controller/bit_controller/n101 ), .S(
        \byte_controller/bit_controller/n29 ), .Z(
        \byte_controller/bit_controller/n212 ) );
  NAND2_X1 \byte_controller/bit_controller/U41  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n28 ), .ZN(
        \byte_controller/bit_controller/n56 ) );
  AND2_X2 \byte_controller/bit_controller/U40  ( .A1(
        \byte_controller/bit_controller/n86 ), .A2(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  BUF_X1 \byte_controller/bit_controller/U39  ( .A(\byte_controller/n34 ), .Z(
        \byte_controller/bit_controller/n30 ) );
  AND2_X1 \byte_controller/bit_controller/U38  ( .A1(
        \byte_controller/bit_controller/n28 ), .A2(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  BUF_X1 \byte_controller/bit_controller/U37  ( .A(
        \byte_controller/bit_controller/n30 ), .Z(
        \byte_controller/bit_controller/n36 ) );
  BUF_X1 \byte_controller/bit_controller/U36  ( .A(
        \byte_controller/bit_controller/n36 ), .Z(
        \byte_controller/bit_controller/n31 ) );
  BUF_X1 \byte_controller/bit_controller/U35  ( .A(
        \byte_controller/bit_controller/n35 ), .Z(
        \byte_controller/bit_controller/n34 ) );
  BUF_X1 \byte_controller/bit_controller/U34  ( .A(
        \byte_controller/bit_controller/n35 ), .Z(
        \byte_controller/bit_controller/n33 ) );
  BUF_X1 \byte_controller/bit_controller/U33  ( .A(
        \byte_controller/bit_controller/n35 ), .Z(
        \byte_controller/bit_controller/n32 ) );
  NOR3_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n213 ), .A2(
        \byte_controller/bit_controller/n16 ), .A3(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n61 ) );
  BUF_X1 \byte_controller/bit_controller/U31  ( .A(
        \byte_controller/bit_controller/n30 ), .Z(
        \byte_controller/bit_controller/n35 ) );
  INV_X1 \byte_controller/bit_controller/U30  ( .A(
        \byte_controller/bit_controller/n157 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  INV_X1 \byte_controller/bit_controller/U29  ( .A(
        \byte_controller/bit_controller/n117 ), .ZN(
        \byte_controller/bit_controller/n24 ) );
  INV_X1 \byte_controller/bit_controller/U28  ( .A(
        \byte_controller/bit_controller/n54 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  OAI21_X1 \byte_controller/bit_controller/U27  ( .B1(
        \byte_controller/bit_controller/n87 ), .B2(
        \byte_controller/bit_controller/N69 ), .A(
        \byte_controller/bit_controller/n156 ), .ZN(
        \byte_controller/bit_controller/n22 ) );
  INV_X1 \byte_controller/bit_controller/U26  ( .A(
        \byte_controller/bit_controller/n118 ), .ZN(
        \byte_controller/bit_controller/n21 ) );
  INV_X1 \byte_controller/bit_controller/U25  ( .A(
        \byte_controller/bit_controller/n120 ), .ZN(
        \byte_controller/bit_controller/n20 ) );
  NOR3_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n213 ), .A2(
        \byte_controller/bit_controller/n59 ), .A3(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n19 ) );
  NAND4_X1 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n85 ), .A2(
        \byte_controller/bit_controller/n82 ), .A3(
        \byte_controller/bit_controller/n83 ), .A4(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n18 ) );
  INV_X1 \byte_controller/bit_controller/U22  ( .A(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n38 ) );
  INV_X1 \byte_controller/bit_controller/U21  ( .A(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n17 ) );
  NAND4_X1 \byte_controller/bit_controller/U20  ( .A1(
        \byte_controller/bit_controller/n50 ), .A2(
        \byte_controller/bit_controller/n48 ), .A3(
        \byte_controller/bit_controller/n126 ), .A4(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n16 ) );
  AND3_X2 \byte_controller/bit_controller/U19  ( .A1(
        \byte_controller/bit_controller/n54 ), .A2(
        \byte_controller/bit_controller/n27 ), .A3(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  INV_X1 \byte_controller/bit_controller/U18  ( .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  AND2_X1 \byte_controller/bit_controller/U17  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n50 ) );
  AND2_X1 \byte_controller/bit_controller/U16  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  OR2_X2 \byte_controller/bit_controller/U15  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n97 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  AND4_X1 \byte_controller/bit_controller/U14  ( .A1(
        \byte_controller/bit_controller/n60 ), .A2(
        \byte_controller/bit_controller/n7 ), .A3(
        \byte_controller/bit_controller/n65 ), .A4(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n51 ) );
  AND4_X1 \byte_controller/bit_controller/U13  ( .A1(
        \byte_controller/bit_controller/n130 ), .A2(
        \byte_controller/bit_controller/n131 ), .A3(
        \byte_controller/bit_controller/n129 ), .A4(
        \byte_controller/bit_controller/n128 ), .ZN(
        \byte_controller/bit_controller/n60 ) );
  AND4_X1 \byte_controller/bit_controller/U12  ( .A1(
        \byte_controller/bit_controller/n130 ), .A2(
        \byte_controller/bit_controller/n131 ), .A3(
        \byte_controller/bit_controller/n129 ), .A4(
        \byte_controller/bit_controller/n128 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  AND4_X1 \byte_controller/bit_controller/U11  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/bit_controller/n7 ), .A3(
        \byte_controller/bit_controller/n65 ), .A4(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  AND3_X2 \byte_controller/bit_controller/U10  ( .A1(
        \byte_controller/bit_controller/n185 ), .A2(
        \byte_controller/bit_controller/n98 ), .A3(
        \byte_controller/bit_controller/n93 ), .ZN(
        \byte_controller/bit_controller/n15 ) );
  NOR2_X2 \byte_controller/bit_controller/U9  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n41 ) );
  INV_X1 \byte_controller/bit_controller/U8  ( .A(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n4 ) );
  AND4_X1 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/bit_controller/n7 ), .A3(
        \byte_controller/bit_controller/n65 ), .A4(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  AND3_X1 \byte_controller/bit_controller/U6  ( .A1(
        \byte_controller/bit_controller/n185 ), .A2(
        \byte_controller/bit_controller/n98 ), .A3(
        \byte_controller/bit_controller/n93 ), .ZN(
        \byte_controller/bit_controller/n5 ) );
  AND2_X2 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n18 ), .A2(
        \byte_controller/bit_controller/n47 ), .ZN(
        \byte_controller/bit_controller/n55 ) );
  INV_X1 \byte_controller/bit_controller/U4  ( .A(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n2 ) );
  INV_X1 \byte_controller/bit_controller/U3  ( .A(
        \byte_controller/bit_controller/n56 ), .ZN(
        \byte_controller/bit_controller/n1 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n164 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n165 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .QN(
        \byte_controller/bit_controller/n132 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/n13 ), .QN(
        \byte_controller/bit_controller/n131 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .QN(
        \byte_controller/bit_controller/n128 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n140 ), .CK(wb_clk_i), .RN(
        \byte_controller/n34 ), .Q(\byte_controller/bit_controller/n95 ), .QN(
        \byte_controller/bit_controller/n200 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .Q(\byte_controller/bit_controller/n93 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/N64 ), .CK(wb_clk_i), .SN(
        \byte_controller/n34 ), .Q(\byte_controller/bit_controller/n76 ), .QN(
        \byte_controller/bit_controller/n104 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/n92 ), .QN(
        \byte_controller/bit_controller/n69 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/n94 ), .QN(
        \byte_controller/bit_controller/n65 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n169 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .QN(
        \byte_controller/bit_controller/n193 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .QN(
        \byte_controller/bit_controller/n129 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .QN(
        \byte_controller/bit_controller/n126 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n103 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/n195 ), .QN(
        \byte_controller/bit_controller/n91 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N70 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n33 ), .Q(
        \byte_controller/bit_controller/n58 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n33 ), .QN(
        \byte_controller/bit_controller/n100 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n222 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n111 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n219 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n163 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n116 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n215 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n216 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n105 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n217 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n220 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n221 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n218 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n134 ), .CK(wb_clk_i), .SN(
        \byte_controller/n34 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n210 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n138 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .QN(
        \byte_controller/bit_controller/n125 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .QN(
        \byte_controller/bit_controller/n44 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n167 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .Q(
        \byte_controller/bit_controller/cnt [0]), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n137 ), .CK(wb_clk_i), .RN(
        \byte_controller/n34 ), .Q(\byte_controller/bit_controller/n97 ), .QN(
        \byte_controller/bit_controller/n198 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n166 ), .CK(wb_clk_i), .RN(
        \byte_controller/n34 ), .Q(\byte_controller/bit_controller/cnt [1]), 
        .QN(\byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n161 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N172 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .QN(
        \byte_controller/bit_controller/n130 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .QN(
        \byte_controller/bit_controller/n7 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n135 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/n42 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n136 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/n45 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n139 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n31 ), .Q(
        \byte_controller/bit_controller/n96 ), .QN(
        \byte_controller/bit_controller/n48 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n160 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n32 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n168 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n34 ), .Q(scl_padoen_o) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N84 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n86 ) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n102 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ), .QN(\byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N76 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N74 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n194 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n33 ), .QN(
        \byte_controller/bit_controller/n88 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n33 ), .Q(
        \byte_controller/bit_controller/n99 ), .QN(
        \byte_controller/bit_controller/n6 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n34 ), .QN(
        \byte_controller/bit_controller/n8 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U145  ( .A1(
        \byte_controller/bit_controller/sub_103/n128 ), .A2(
        \byte_controller/bit_controller/sub_103/n42 ), .ZN(
        \byte_controller/bit_controller/sub_103/n126 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U144  ( .A1(
        \byte_controller/bit_controller/sub_103/n125 ), .A2(
        \byte_controller/bit_controller/sub_103/n95 ), .ZN(
        \byte_controller/bit_controller/sub_103/n123 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U143  ( .A(
        \byte_controller/bit_controller/sub_103/n10 ), .ZN(
        \byte_controller/bit_controller/sub_103/n108 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U142  ( .A1(
        \byte_controller/bit_controller/sub_103/n119 ), .A2(
        \byte_controller/bit_controller/sub_103/n36 ), .A3(
        \byte_controller/bit_controller/sub_103/n51 ), .ZN(
        \byte_controller/bit_controller/sub_103/n117 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U141  ( .A1(
        \byte_controller/bit_controller/sub_103/n115 ), .A2(
        \byte_controller/bit_controller/sub_103/n116 ), .A3(
        \byte_controller/bit_controller/sub_103/n95 ), .ZN(
        \byte_controller/bit_controller/sub_103/n112 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U140  ( .A1(
        \byte_controller/bit_controller/sub_103/n19 ), .A2(
        \byte_controller/bit_controller/sub_103/n114 ), .A3(
        \byte_controller/bit_controller/sub_103/n18 ), .ZN(
        \byte_controller/bit_controller/sub_103/n113 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U139  ( .A1(
        \byte_controller/bit_controller/sub_103/n106 ), .A2(
        \byte_controller/bit_controller/sub_103/n46 ), .ZN(
        \byte_controller/bit_controller/sub_103/n103 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U138  ( .A1(
        \byte_controller/bit_controller/sub_103/n105 ), .A2(
        \byte_controller/bit_controller/sub_103/n129 ), .ZN(
        \byte_controller/bit_controller/sub_103/n104 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U137  ( .A1(
        \byte_controller/bit_controller/sub_103/n102 ), .A2(
        \byte_controller/bit_controller/sub_103/n95 ), .ZN(
        \byte_controller/bit_controller/sub_103/n99 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U136  ( .A1(
        \byte_controller/bit_controller/sub_103/n101 ), .A2(
        \byte_controller/bit_controller/sub_103/n18 ), .ZN(
        \byte_controller/bit_controller/sub_103/n100 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_103/U135  ( .B1(
        \byte_controller/bit_controller/sub_103/n1 ), .B2(
        \byte_controller/bit_controller/sub_103/n96 ), .A(
        \byte_controller/bit_controller/sub_103/n88 ), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U134  ( .A1(
        \byte_controller/bit_controller/sub_103/n93 ), .A2(
        \byte_controller/bit_controller/sub_103/n5 ), .A3(
        \byte_controller/bit_controller/sub_103/n94 ), .A4(
        \byte_controller/bit_controller/sub_103/n95 ), .ZN(
        \byte_controller/bit_controller/sub_103/n89 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U133  ( .A1(
        \byte_controller/bit_controller/sub_103/n91 ), .A2(
        \byte_controller/bit_controller/N32 ), .A3(
        \byte_controller/bit_controller/sub_103/n51 ), .A4(
        \byte_controller/bit_controller/sub_103/n92 ), .ZN(
        \byte_controller/bit_controller/sub_103/n90 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U132  ( .A1(
        \byte_controller/bit_controller/sub_103/n89 ), .A2(
        \byte_controller/bit_controller/sub_103/n90 ), .ZN(
        \byte_controller/bit_controller/sub_103/n87 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U131  ( .A(
        \byte_controller/bit_controller/sub_103/n87 ), .B(
        \byte_controller/bit_controller/sub_103/n88 ), .S(
        \byte_controller/bit_controller/cnt [12]), .Z(
        \byte_controller/bit_controller/N44 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U130  ( .A1(
        \byte_controller/bit_controller/sub_103/n84 ), .A2(
        \byte_controller/bit_controller/sub_103/n120 ), .A3(
        \byte_controller/bit_controller/sub_103/n85 ), .A4(
        \byte_controller/bit_controller/sub_103/n86 ), .ZN(
        \byte_controller/bit_controller/sub_103/n80 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U129  ( .A1(
        \byte_controller/bit_controller/sub_103/n82 ), .A2(
        \byte_controller/bit_controller/sub_103/n129 ), .A3(
        \byte_controller/bit_controller/sub_103/n83 ), .A4(
        \byte_controller/bit_controller/sub_103/n46 ), .ZN(
        \byte_controller/bit_controller/sub_103/n81 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U128  ( .A1(
        \byte_controller/bit_controller/sub_103/n80 ), .A2(
        \byte_controller/bit_controller/sub_103/n81 ), .ZN(
        \byte_controller/bit_controller/sub_103/n67 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U127  ( .A1(
        \byte_controller/bit_controller/sub_103/n34 ), .A2(
        \byte_controller/bit_controller/sub_103/n79 ), .ZN(
        \byte_controller/bit_controller/sub_103/n76 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U126  ( .A1(
        \byte_controller/bit_controller/sub_103/n78 ), .A2(
        \byte_controller/bit_controller/sub_103/n129 ), .ZN(
        \byte_controller/bit_controller/sub_103/n77 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U125  ( .A1(
        \byte_controller/bit_controller/sub_103/n74 ), .A2(
        \byte_controller/bit_controller/sub_103/n75 ), .ZN(
        \byte_controller/bit_controller/sub_103/n71 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U124  ( .A1(
        \byte_controller/bit_controller/sub_103/n36 ), .A2(
        \byte_controller/bit_controller/sub_103/n73 ), .ZN(
        \byte_controller/bit_controller/sub_103/n72 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U123  ( .A1(
        \byte_controller/bit_controller/sub_103/n64 ), .A2(
        \byte_controller/bit_controller/sub_103/n65 ), .ZN(
        \byte_controller/bit_controller/sub_103/n61 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U122  ( .A1(
        \byte_controller/bit_controller/sub_103/n63 ), .A2(
        \byte_controller/bit_controller/sub_103/n129 ), .ZN(
        \byte_controller/bit_controller/sub_103/n62 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U121  ( .A1(
        \byte_controller/bit_controller/sub_103/n59 ), .A2(
        \byte_controller/bit_controller/sub_103/n60 ), .ZN(
        \byte_controller/bit_controller/sub_103/n55 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U120  ( .A1(
        \byte_controller/bit_controller/sub_103/n57 ), .A2(
        \byte_controller/bit_controller/sub_103/n58 ), .ZN(
        \byte_controller/bit_controller/sub_103/n56 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U119  ( .A1(
        \byte_controller/bit_controller/sub_103/n53 ), .A2(
        \byte_controller/bit_controller/sub_103/n54 ), .ZN(
        \byte_controller/bit_controller/sub_103/n52 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U118  ( .A(
        \byte_controller/bit_controller/sub_103/n52 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N47 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U117  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n7 ), .ZN(
        \byte_controller/bit_controller/sub_103/n50 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U116  ( .A1(
        \byte_controller/bit_controller/sub_103/n51 ), .A2(
        \byte_controller/bit_controller/sub_103/n47 ), .A3(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/sub_103/n45 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U115  ( .A1(
        \byte_controller/bit_controller/sub_103/n41 ), .A2(
        \byte_controller/bit_controller/sub_103/n42 ), .A3(
        \byte_controller/bit_controller/sub_103/n43 ), .ZN(
        \byte_controller/bit_controller/sub_103/n38 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U114  ( .A(
        \byte_controller/bit_controller/sub_103/n37 ), .B(
        \byte_controller/bit_controller/sub_103/n38 ), .S(
        \byte_controller/bit_controller/cnt [5]), .Z(
        \byte_controller/bit_controller/N37 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U113  ( .A1(
        \byte_controller/bit_controller/sub_103/n34 ), .A2(
        \byte_controller/bit_controller/N32 ), .A3(
        \byte_controller/bit_controller/sub_103/n35 ), .A4(
        \byte_controller/bit_controller/sub_103/n120 ), .ZN(
        \byte_controller/bit_controller/sub_103/n33 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U112  ( .A(
        \byte_controller/bit_controller/sub_103/n33 ), .B(
        \byte_controller/bit_controller/sub_103/n8 ), .ZN(
        \byte_controller/bit_controller/N38 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U111  ( .A1(
        \byte_controller/bit_controller/sub_103/n28 ), .A2(
        \byte_controller/bit_controller/sub_103/n93 ), .ZN(
        \byte_controller/bit_controller/sub_103/n25 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U110  ( .A1(
        \byte_controller/bit_controller/sub_103/n27 ), .A2(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/sub_103/n26 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U109  ( .A1(
        \byte_controller/bit_controller/sub_103/n13 ), .A2(
        \byte_controller/bit_controller/sub_103/n24 ), .ZN(
        \byte_controller/bit_controller/N39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U108  ( .A1(
        \byte_controller/bit_controller/sub_103/n20 ), .A2(
        \byte_controller/bit_controller/sub_103/n21 ), .ZN(
        \byte_controller/bit_controller/sub_103/n16 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U107  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/sub_103/n13 ), .ZN(
        \byte_controller/bit_controller/sub_103/n12 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U106  ( .A1(
        \byte_controller/bit_controller/sub_103/n11 ), .A2(
        \byte_controller/bit_controller/sub_103/n12 ), .ZN(
        \byte_controller/bit_controller/N40 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U105  ( .A(
        \byte_controller/bit_controller/sub_103/n11 ), .ZN(
        \byte_controller/bit_controller/sub_103/n9 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U104  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n23 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U103  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n27 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U102  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U101  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n34 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U100  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n47 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U99  ( .A(
        \byte_controller/bit_controller/sub_103/n49 ), .B(
        \byte_controller/bit_controller/sub_103/n2 ), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U98  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n57 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U97  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_103/n83 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U96  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n92 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U95  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n106 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U94  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n119 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U93  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n42 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U92  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_103/n18 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U91  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_103/n73 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U90  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n128 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U89  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_103/n58 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U88  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_103/n35 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U87  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_103/n84 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U86  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_103/n31 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U85  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n28 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U84  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n41 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U83  ( .A1(
        \byte_controller/bit_controller/sub_103/n39 ), .A2(
        \byte_controller/bit_controller/sub_103/n4 ), .ZN(
        \byte_controller/bit_controller/sub_103/n40 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U82  ( .A1(
        \byte_controller/bit_controller/sub_103/n39 ), .A2(
        \byte_controller/bit_controller/sub_103/n4 ), .ZN(
        \byte_controller/bit_controller/sub_103/n37 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U81  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n51 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U80  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_103/n65 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U79  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n7 ), .ZN(
        \byte_controller/bit_controller/sub_103/n48 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U78  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n7 ), .ZN(
        \byte_controller/bit_controller/sub_103/n22 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U77  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U76  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n7 ), .ZN(
        \byte_controller/bit_controller/sub_103/n29 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U75  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n7 ), .ZN(
        \byte_controller/bit_controller/sub_103/n43 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_103/U74  ( .A(
        \byte_controller/bit_controller/cnt [6]), .Z(
        \byte_controller/bit_controller/sub_103/n8 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U73  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_103/n20 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U72  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n60 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U71  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n75 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U70  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n86 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U69  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n94 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U68  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n102 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U67  ( .A(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n115 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U66  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n125 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U65  ( .A1(
        \byte_controller/bit_controller/sub_103/n129 ), .A2(
        \byte_controller/bit_controller/sub_103/n51 ), .ZN(
        \byte_controller/bit_controller/sub_103/n127 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U64  ( .A1(
        \byte_controller/bit_controller/sub_103/n129 ), .A2(
        \byte_controller/bit_controller/sub_103/n109 ), .ZN(
        \byte_controller/bit_controller/sub_103/n118 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U63  ( .A1(
        \byte_controller/bit_controller/sub_103/n46 ), .A2(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/sub_103/n49 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_103/U62  ( .B1(
        \byte_controller/bit_controller/sub_103/n9 ), .B2(
        \byte_controller/bit_controller/sub_103/n116 ), .A(
        \byte_controller/bit_controller/sub_103/n10 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U61  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_103/n101 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U60  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_103/n19 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U59  ( .A(
        \byte_controller/bit_controller/sub_103/n66 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N46 ) );
  BUF_X2 \byte_controller/bit_controller/sub_103/U58  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_103/n7 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U57  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n32 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U56  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n59 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U55  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U54  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n85 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U53  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_103/n93 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U52  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n114 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U51  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n21 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U50  ( .A1(
        \byte_controller/bit_controller/sub_103/n45 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n44 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U49  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n36 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U48  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n120 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U47  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n63 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U46  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n78 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U45  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n82 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U44  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n91 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U43  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n105 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U42  ( .A(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n109 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U41  ( .A1(
        \byte_controller/bit_controller/sub_103/n5 ), .A2(
        \byte_controller/bit_controller/sub_103/n19 ), .ZN(
        \byte_controller/bit_controller/sub_103/n17 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_103/U40  ( .B1(
        \byte_controller/bit_controller/sub_103/n108 ), .B2(
        \byte_controller/bit_controller/sub_103/n109 ), .A(
        \byte_controller/bit_controller/sub_103/n107 ), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U39  ( .A1(
        \byte_controller/bit_controller/sub_103/n69 ), .A2(
        \byte_controller/bit_controller/sub_103/n70 ), .ZN(
        \byte_controller/bit_controller/sub_103/n66 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U38  ( .A1(
        \byte_controller/bit_controller/sub_103/n99 ), .A2(
        \byte_controller/bit_controller/sub_103/n100 ), .ZN(
        \byte_controller/bit_controller/sub_103/n98 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U37  ( .A1(
        \byte_controller/bit_controller/sub_103/n97 ), .A2(
        \byte_controller/bit_controller/sub_103/n98 ), .ZN(
        \byte_controller/bit_controller/sub_103/n88 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U36  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_103/n64 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_103/U35  ( .B1(
        \byte_controller/bit_controller/sub_103/n25 ), .B2(
        \byte_controller/bit_controller/sub_103/n26 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_103/n24 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U34  ( .A1(
        \byte_controller/bit_controller/sub_103/n29 ), .A2(
        \byte_controller/bit_controller/sub_103/n30 ), .A3(
        \byte_controller/bit_controller/sub_103/n31 ), .A4(
        \byte_controller/bit_controller/sub_103/n32 ), .ZN(
        \byte_controller/bit_controller/sub_103/n13 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U33  ( .A1(
        \byte_controller/bit_controller/sub_103/n61 ), .A2(
        \byte_controller/bit_controller/sub_103/n62 ), .ZN(
        \byte_controller/bit_controller/sub_103/n53 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U32  ( .A1(
        \byte_controller/bit_controller/sub_103/n39 ), .A2(
        \byte_controller/bit_controller/sub_103/n44 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U31  ( .A1(
        \byte_controller/bit_controller/sub_103/n49 ), .A2(
        \byte_controller/bit_controller/sub_103/n50 ), .ZN(
        \byte_controller/bit_controller/N33 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U30  ( .A1(
        \byte_controller/bit_controller/sub_103/n16 ), .A2(
        \byte_controller/bit_controller/sub_103/n17 ), .ZN(
        \byte_controller/bit_controller/sub_103/n15 ) );
  AND2_X1 \byte_controller/bit_controller/sub_103/U29  ( .A1(
        \byte_controller/bit_controller/sub_103/n22 ), .A2(
        \byte_controller/bit_controller/sub_103/n23 ), .ZN(
        \byte_controller/bit_controller/sub_103/n14 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U28  ( .A1(
        \byte_controller/bit_controller/sub_103/n14 ), .A2(
        \byte_controller/bit_controller/sub_103/n15 ), .ZN(
        \byte_controller/bit_controller/sub_103/n11 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U27  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_103/n95 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U26  ( .A(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/sub_103/n116 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U25  ( .A1(
        \byte_controller/bit_controller/sub_103/n55 ), .A2(
        \byte_controller/bit_controller/sub_103/n56 ), .ZN(
        \byte_controller/bit_controller/sub_103/n54 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U24  ( .A(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/sub_103/n96 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U23  ( .A1(
        \byte_controller/bit_controller/sub_103/n40 ), .A2(
        \byte_controller/bit_controller/sub_103/n38 ), .ZN(
        \byte_controller/bit_controller/N36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U22  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_103/n79 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U21  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_103/n68 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U20  ( .A1(
        \byte_controller/bit_controller/sub_103/n92 ), .A2(
        \byte_controller/bit_controller/sub_103/n48 ), .ZN(
        \byte_controller/bit_controller/sub_103/n39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U19  ( .A1(
        \byte_controller/bit_controller/sub_103/n19 ), .A2(
        \byte_controller/bit_controller/sub_103/n21 ), .ZN(
        \byte_controller/bit_controller/sub_103/n124 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U18  ( .A1(
        \byte_controller/bit_controller/sub_103/n112 ), .A2(
        \byte_controller/bit_controller/sub_103/n113 ), .ZN(
        \byte_controller/bit_controller/sub_103/n111 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U17  ( .A1(
        \byte_controller/bit_controller/sub_103/n117 ), .A2(
        \byte_controller/bit_controller/sub_103/n118 ), .ZN(
        \byte_controller/bit_controller/sub_103/n110 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U16  ( .A1(
        \byte_controller/bit_controller/sub_103/n110 ), .A2(
        \byte_controller/bit_controller/sub_103/n111 ), .ZN(
        \byte_controller/bit_controller/sub_103/n107 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U15  ( .A1(
        \byte_controller/bit_controller/sub_103/n126 ), .A2(
        \byte_controller/bit_controller/sub_103/n127 ), .ZN(
        \byte_controller/bit_controller/sub_103/n121 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U14  ( .A1(
        \byte_controller/bit_controller/sub_103/n123 ), .A2(
        \byte_controller/bit_controller/sub_103/n124 ), .ZN(
        \byte_controller/bit_controller/sub_103/n122 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U13  ( .A1(
        \byte_controller/bit_controller/sub_103/n121 ), .A2(
        \byte_controller/bit_controller/sub_103/n122 ), .ZN(
        \byte_controller/bit_controller/sub_103/n10 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U12  ( .A1(
        \byte_controller/bit_controller/sub_103/n103 ), .A2(
        \byte_controller/bit_controller/sub_103/n104 ), .ZN(
        \byte_controller/bit_controller/sub_103/n97 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U11  ( .A1(
        \byte_controller/bit_controller/sub_103/n71 ), .A2(
        \byte_controller/bit_controller/sub_103/n72 ), .ZN(
        \byte_controller/bit_controller/sub_103/n70 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U10  ( .A1(
        \byte_controller/bit_controller/sub_103/n76 ), .A2(
        \byte_controller/bit_controller/sub_103/n77 ), .ZN(
        \byte_controller/bit_controller/sub_103/n69 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U9  ( .A1(
        \byte_controller/bit_controller/sub_103/n6 ), .A2(
        \byte_controller/bit_controller/sub_103/n66 ), .ZN(
        \byte_controller/bit_controller/N45 ) );
  OR2_X1 \byte_controller/bit_controller/sub_103/U8  ( .A1(
        \byte_controller/bit_controller/sub_103/n67 ), .A2(
        \byte_controller/bit_controller/sub_103/n68 ), .ZN(
        \byte_controller/bit_controller/sub_103/n6 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U7  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_103/n5 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U6  ( .A(
        \byte_controller/bit_controller/sub_103/n5 ), .ZN(
        \byte_controller/bit_controller/sub_103/n4 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U5  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_103/n129 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U4  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/N32 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U3  ( .A(
        \byte_controller/bit_controller/sub_103/n47 ), .ZN(
        \byte_controller/bit_controller/sub_103/n2 ) );
  AND2_X1 \byte_controller/bit_controller/sub_103/U2  ( .A1(
        \byte_controller/bit_controller/sub_103/n110 ), .A2(
        \byte_controller/bit_controller/sub_103/n111 ), .ZN(
        \byte_controller/bit_controller/sub_103/n1 ) );
endmodule

