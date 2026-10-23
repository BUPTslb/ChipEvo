/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 05:46:20 2026
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
  wire   N21, sr_1, N25, N26, N27, N28, N29, N30, N31, N32, done, i2c_al, N60,
         N61, N62, irxack, N77, N78, N79, N80, N84, n1, n2, n3, n4, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232,
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
         \byte_controller/n113 , \byte_controller/n112 , \byte_controller/n95 ,
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
         \byte_controller/n37 , \byte_controller/n36 , \byte_controller/n35 ,
         \byte_controller/n34 , \byte_controller/n33 , \byte_controller/n32 ,
         \byte_controller/n31 , \byte_controller/n30 , \byte_controller/n29 ,
         \byte_controller/n26 , \byte_controller/n25 , \byte_controller/n24 ,
         \byte_controller/n23 , \byte_controller/n22 , \byte_controller/n21 ,
         \byte_controller/n19 , \byte_controller/n18 , \byte_controller/n16 ,
         \byte_controller/n13 , \byte_controller/n12 , \byte_controller/n11 ,
         \byte_controller/n10 , \byte_controller/n9 , \byte_controller/n8 ,
         \byte_controller/n7 , \byte_controller/n6 , \byte_controller/n4 ,
         \byte_controller/n3 , \byte_controller/n2 , \byte_controller/n1 ,
         \byte_controller/n111 , \byte_controller/n110 ,
         \byte_controller/n109 , \byte_controller/n108 ,
         \byte_controller/n107 , \byte_controller/n106 ,
         \byte_controller/n105 , \byte_controller/n104 ,
         \byte_controller/n103 , \byte_controller/n102 ,
         \byte_controller/n101 , \byte_controller/n100 , \byte_controller/n99 ,
         \byte_controller/n98 , \byte_controller/n97 , \byte_controller/n96 ,
         \byte_controller/n28 , \byte_controller/n27 , \byte_controller/n20 ,
         \byte_controller/n17 , \byte_controller/n15 , \byte_controller/n14 ,
         \byte_controller/n5 , \byte_controller/N181 , \byte_controller/N180 ,
         \byte_controller/N179 , \byte_controller/N178 ,
         \byte_controller/N177 , \byte_controller/N176 ,
         \byte_controller/N175 , \byte_controller/N174 ,
         \byte_controller/N173 , \byte_controller/dcnt[1] ,
         \byte_controller/ld , \byte_controller/core_rxd ,
         \byte_controller/core_txd , \byte_controller/core_ack ,
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
         \byte_controller/bit_controller/n133 ,
         \byte_controller/bit_controller/n132 ,
         \byte_controller/bit_controller/n125 ,
         \byte_controller/bit_controller/n116 ,
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
         \byte_controller/bit_controller/n131 ,
         \byte_controller/bit_controller/n130 ,
         \byte_controller/bit_controller/n129 ,
         \byte_controller/bit_controller/n128 ,
         \byte_controller/bit_controller/n127 ,
         \byte_controller/bit_controller/n126 ,
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
         \byte_controller/bit_controller/sub_105/n2 ,
         \byte_controller/bit_controller/sub_105/n1 ,
         \byte_controller/bit_controller/sub_105/n134 ;
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

  DFF_X1 wb_ack_o_reg ( .D(N21), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \ctr_reg[7]  ( .D(n140), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n2) );
  DFFR_X1 \ctr_reg[5]  ( .D(n138), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[4]  ( .D(n137), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[3]  ( .D(n136), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n7) );
  DFFR_X1 \ctr_reg[2]  ( .D(n135), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n8) );
  DFFR_X1 \ctr_reg[1]  ( .D(n134), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n9) );
  DFFS_X1 \prer_reg[15]  ( .D(n132), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n11) );
  DFFS_X1 \prer_reg[14]  ( .D(n131), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n12) );
  DFFS_X1 \prer_reg[12]  ( .D(n129), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n14) );
  DFFS_X1 \prer_reg[11]  ( .D(n128), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n15) );
  DFFS_X1 \prer_reg[10]  ( .D(n127), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n16) );
  DFFS_X1 \prer_reg[9]  ( .D(n126), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n17) );
  DFFS_X1 \prer_reg[8]  ( .D(n125), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n18) );
  DFFS_X1 \prer_reg[6]  ( .D(n123), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[5]  ( .D(n122), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n21) );
  DFFS_X1 \prer_reg[2]  ( .D(n119), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n24) );
  DFFS_X1 \prer_reg[1]  ( .D(n118), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n25) );
  DFFR_X1 \txr_reg[4]  ( .D(n113), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n30) );
  DFFR_X1 \txr_reg[3]  ( .D(n112), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n31) );
  DFFR_X1 \cr_reg[3]  ( .D(n108), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n153) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N31), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFFR_X1 \cr_reg[5]  ( .D(n106), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n37) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N29), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N28), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFFR_X1 \cr_reg[2]  ( .D(N62), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N27), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFR_X1 \cr_reg[1]  ( .D(N61), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]) );
  DFFR_X1 \cr_reg[0]  ( .D(N60), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]) );
  DFFR_X1 al_reg ( .D(N77), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N30), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N78), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N32), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N79), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N26), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFFR_X1 irq_flag_reg ( .D(N80), .CK(wb_clk_i), .RN(arst_i), .Q(n179), .QN(
        n39) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N25), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N84), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 \txr_reg[2]  ( .D(n111), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n32) );
  DFFR_X1 \ctr_reg[6]  ( .D(n139), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n3) );
  DFFR_X1 \txr_reg[0]  ( .D(n109), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n34) );
  DFFS_X1 \prer_reg[0]  ( .D(n117), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n26) );
  DFFS_X1 \prer_reg[4]  ( .D(n121), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n22) );
  DFFS_X1 \prer_reg[3]  ( .D(n120), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n23) );
  DFFS_X1 \prer_reg[7]  ( .D(n124), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[13]  ( .D(n130), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n13) );
  DFFR_X1 \ctr_reg[0]  ( .D(n133), .CK(wb_clk_i), .RN(arst_i), .QN(n10) );
  DFFR_X1 \txr_reg[7]  ( .D(n116), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n27) );
  DFFR_X1 \txr_reg[6]  ( .D(n115), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n28) );
  DFFR_X1 \txr_reg[1]  ( .D(n110), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n33) );
  DFFR_X1 \txr_reg[5]  ( .D(n114), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n29) );
  DFFR_X1 \cr_reg[7]  ( .D(n104), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n35) );
  DFFR_X1 \cr_reg[6]  ( .D(n105), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n36) );
  DFFR_X1 \cr_reg[4]  ( .D(n107), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n38) );
  AND2_X1 U122 ( .A1(n186), .A2(n145), .ZN(n141) );
  AND2_X1 U123 ( .A1(n167), .A2(n229), .ZN(n142) );
  AND2_X1 U124 ( .A1(n168), .A2(n167), .ZN(n143) );
  AND4_X1 U125 ( .A1(n186), .A2(n185), .A3(n224), .A4(n184), .ZN(n144) );
  AND2_X1 U126 ( .A1(wb_adr_i[0]), .A2(n157), .ZN(n145) );
  NAND4_X2 U127 ( .A1(n167), .A2(ctr[7]), .A3(n230), .A4(n223), .ZN(n197) );
  INV_X1 U128 ( .A(n36), .ZN(n146) );
  INV_X1 U129 ( .A(n37), .ZN(n147) );
  INV_X1 U130 ( .A(n187), .ZN(n229) );
  MUX2_X1 U131 ( .A(wb_dat_i[3]), .B(n154), .S(n197), .Z(n108) );
  INV_X1 U132 ( .A(wb_rst_i), .ZN(n223) );
  INV_X1 U134 ( .A(wb_dat_i[0]), .ZN(n181) );
  INV_X1 U135 ( .A(wb_adr_i[2]), .ZN(n157) );
  NAND3_X1 U136 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n152) );
  INV_X1 U137 ( .A(n152), .ZN(n167) );
  NAND3_X1 U138 ( .A1(wb_adr_i[1]), .A2(n145), .A3(n167), .ZN(n149) );
  NAND2_X1 U139 ( .A1(n149), .A2(n223), .ZN(n150) );
  NAND2_X1 U140 ( .A1(n150), .A2(n223), .ZN(n151) );
  OAI22_X1 U141 ( .A1(n181), .A2(n151), .B1(n34), .B2(n150), .ZN(n109) );
  INV_X1 U142 ( .A(wb_dat_i[1]), .ZN(n193) );
  OAI22_X1 U143 ( .A1(n193), .A2(n151), .B1(n33), .B2(n150), .ZN(n110) );
  INV_X1 U144 ( .A(wb_dat_i[2]), .ZN(n198) );
  OAI22_X1 U145 ( .A1(n198), .A2(n151), .B1(n32), .B2(n150), .ZN(n111) );
  INV_X1 U146 ( .A(wb_dat_i[3]), .ZN(n201) );
  OAI22_X1 U147 ( .A1(n201), .A2(n151), .B1(n31), .B2(n150), .ZN(n112) );
  INV_X1 U148 ( .A(wb_dat_i[4]), .ZN(n205) );
  OAI22_X1 U149 ( .A1(n205), .A2(n151), .B1(n30), .B2(n150), .ZN(n113) );
  INV_X1 U150 ( .A(wb_dat_i[5]), .ZN(n211) );
  OAI22_X1 U151 ( .A1(n211), .A2(n151), .B1(n29), .B2(n150), .ZN(n114) );
  INV_X1 U152 ( .A(wb_dat_i[6]), .ZN(n178) );
  OAI22_X1 U153 ( .A1(n178), .A2(n151), .B1(n28), .B2(n150), .ZN(n115) );
  INV_X1 U154 ( .A(wb_dat_i[7]), .ZN(n176) );
  OAI22_X1 U155 ( .A1(n176), .A2(n151), .B1(n27), .B2(n150), .ZN(n116) );
  INV_X1 U156 ( .A(wb_adr_i[0]), .ZN(n185) );
  NAND3_X1 U157 ( .A1(wb_adr_i[1]), .A2(n185), .A3(n157), .ZN(n224) );
  OAI21_X1 U158 ( .B1(n224), .B2(n152), .A(n223), .ZN(n210) );
  NAND2_X1 U159 ( .A1(n210), .A2(n223), .ZN(n212) );
  OAI22_X1 U160 ( .A1(n212), .A2(n176), .B1(n2), .B2(n210), .ZN(n140) );
  NOR2_X1 U161 ( .A1(wb_rst_i), .A2(n153), .ZN(n154) );
  INV_X1 U162 ( .A(wb_adr_i[1]), .ZN(n166) );
  NAND2_X1 U163 ( .A1(wb_adr_i[2]), .A2(n166), .ZN(n184) );
  INV_X1 U164 ( .A(n184), .ZN(n182) );
  NAND2_X1 U165 ( .A1(n182), .A2(n185), .ZN(n192) );
  INV_X1 U166 ( .A(n192), .ZN(n230) );
  INV_X1 U167 ( .A(done), .ZN(n155) );
  INV_X1 U168 ( .A(i2c_al), .ZN(n213) );
  NAND4_X1 U169 ( .A1(n197), .A2(n223), .A3(n155), .A4(n213), .ZN(n156) );
  OAI22_X1 U170 ( .A1(n38), .A2(n156), .B1(n205), .B2(n197), .ZN(n107) );
  OAI22_X1 U171 ( .A1(n37), .A2(n156), .B1(n211), .B2(n197), .ZN(n106) );
  OAI22_X1 U172 ( .A1(n36), .A2(n156), .B1(n197), .B2(n178), .ZN(n105) );
  OAI22_X1 U173 ( .A1(n35), .A2(n156), .B1(n197), .B2(n176), .ZN(n104) );
  NAND3_X1 U174 ( .A1(n157), .A2(n185), .A3(n166), .ZN(n187) );
  MUX2_X1 U175 ( .A(n26), .B(n181), .S(n142), .Z(n158) );
  NAND2_X1 U176 ( .A1(n223), .A2(n158), .ZN(n117) );
  MUX2_X1 U177 ( .A(n25), .B(n193), .S(n142), .Z(n159) );
  NAND2_X1 U178 ( .A1(n223), .A2(n159), .ZN(n118) );
  MUX2_X1 U179 ( .A(n24), .B(n198), .S(n142), .Z(n160) );
  NAND2_X1 U180 ( .A1(n223), .A2(n160), .ZN(n119) );
  MUX2_X1 U181 ( .A(n23), .B(n201), .S(n142), .Z(n161) );
  NAND2_X1 U182 ( .A1(n223), .A2(n161), .ZN(n120) );
  MUX2_X1 U183 ( .A(n22), .B(n205), .S(n142), .Z(n162) );
  NAND2_X1 U184 ( .A1(n223), .A2(n162), .ZN(n121) );
  MUX2_X1 U185 ( .A(n21), .B(n211), .S(n142), .Z(n163) );
  NAND2_X1 U186 ( .A1(n223), .A2(n163), .ZN(n122) );
  MUX2_X1 U187 ( .A(n20), .B(n178), .S(n142), .Z(n164) );
  NAND2_X1 U188 ( .A1(n223), .A2(n164), .ZN(n123) );
  MUX2_X1 U189 ( .A(n19), .B(n176), .S(n142), .Z(n165) );
  NAND2_X1 U190 ( .A1(n223), .A2(n165), .ZN(n124) );
  NAND2_X1 U191 ( .A1(n145), .A2(n166), .ZN(n183) );
  INV_X1 U192 ( .A(n183), .ZN(n168) );
  MUX2_X1 U193 ( .A(n18), .B(n181), .S(n143), .Z(n169) );
  NAND2_X1 U194 ( .A1(n223), .A2(n169), .ZN(n125) );
  MUX2_X1 U195 ( .A(n17), .B(n193), .S(n143), .Z(n170) );
  NAND2_X1 U196 ( .A1(n223), .A2(n170), .ZN(n126) );
  MUX2_X1 U197 ( .A(n16), .B(n198), .S(n143), .Z(n171) );
  NAND2_X1 U198 ( .A1(n223), .A2(n171), .ZN(n127) );
  MUX2_X1 U199 ( .A(n15), .B(n201), .S(n143), .Z(n172) );
  NAND2_X1 U200 ( .A1(n223), .A2(n172), .ZN(n128) );
  MUX2_X1 U201 ( .A(n14), .B(n205), .S(n143), .Z(n173) );
  NAND2_X1 U202 ( .A1(n223), .A2(n173), .ZN(n129) );
  MUX2_X1 U203 ( .A(n13), .B(n211), .S(n143), .Z(n174) );
  NAND2_X1 U204 ( .A1(n223), .A2(n174), .ZN(n130) );
  MUX2_X1 U205 ( .A(n12), .B(n178), .S(n143), .Z(n175) );
  NAND2_X1 U206 ( .A1(n223), .A2(n175), .ZN(n131) );
  MUX2_X1 U207 ( .A(n11), .B(n176), .S(n143), .Z(n177) );
  NAND2_X1 U208 ( .A1(n223), .A2(n177), .ZN(n132) );
  OAI22_X1 U209 ( .A1(n212), .A2(n178), .B1(n3), .B2(n210), .ZN(n139) );
  NOR2_X1 U210 ( .A1(n197), .A2(n181), .ZN(N60) );
  NOR2_X1 U211 ( .A1(done), .A2(n179), .ZN(n180) );
  AOI211_X1 U212 ( .C1(n180), .C2(n213), .A(cr[0]), .B(wb_rst_i), .ZN(N80) );
  NOR3_X1 U213 ( .A1(n39), .A2(n3), .A3(wb_rst_i), .ZN(N84) );
  AND3_X1 U214 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N21) );
  OAI22_X1 U215 ( .A1(n212), .A2(n181), .B1(n10), .B2(n210), .ZN(n133) );
  NAND2_X1 U216 ( .A1(n182), .A2(n192), .ZN(n209) );
  INV_X1 U217 ( .A(n209), .ZN(n228) );
  AOI22_X1 U218 ( .A1(prer[0]), .A2(n229), .B1(n228), .B2(txr[0]), .ZN(n191)
         );
  NAND2_X1 U219 ( .A1(n183), .A2(n187), .ZN(n188) );
  INV_X1 U220 ( .A(n188), .ZN(n186) );
  NAND2_X1 U221 ( .A1(n188), .A2(n187), .ZN(n226) );
  OAI22_X1 U222 ( .A1(n226), .A2(n18), .B1(n10), .B2(n224), .ZN(n189) );
  AOI221_X1 U223 ( .B1(rxr[0]), .B2(n141), .C1(cr[0]), .C2(n144), .A(n189), 
        .ZN(n190) );
  OAI211_X1 U224 ( .C1(n39), .C2(n192), .A(n191), .B(n190), .ZN(N25) );
  NOR2_X1 U225 ( .A1(n197), .A2(n193), .ZN(N61) );
  OAI22_X1 U226 ( .A1(n212), .A2(n193), .B1(n9), .B2(n210), .ZN(n134) );
  AOI21_X1 U227 ( .B1(n37), .B2(n38), .A(wb_rst_i), .ZN(N79) );
  AOI22_X1 U228 ( .A1(rxr[1]), .A2(n141), .B1(cr[1]), .B2(n144), .ZN(n196) );
  INV_X1 U229 ( .A(n224), .ZN(n219) );
  INV_X1 U230 ( .A(n226), .ZN(n218) );
  AOI22_X1 U231 ( .A1(ctr[1]), .A2(n219), .B1(prer[9]), .B2(n218), .ZN(n195)
         );
  AOI222_X1 U232 ( .A1(sr_1), .A2(n230), .B1(prer[1]), .B2(n229), .C1(txr[1]), 
        .C2(n228), .ZN(n194) );
  NAND3_X1 U233 ( .A1(n196), .A2(n195), .A3(n194), .ZN(N26) );
  NOR2_X1 U234 ( .A1(n198), .A2(n197), .ZN(N62) );
  OAI22_X1 U235 ( .A1(n212), .A2(n198), .B1(n8), .B2(n210), .ZN(n135) );
  AOI22_X1 U236 ( .A1(prer[10]), .A2(n218), .B1(prer[2]), .B2(n229), .ZN(n200)
         );
  AOI222_X1 U237 ( .A1(ctr[2]), .A2(n219), .B1(rxr[2]), .B2(n141), .C1(cr[2]), 
        .C2(n144), .ZN(n199) );
  OAI211_X1 U238 ( .C1(n32), .C2(n209), .A(n200), .B(n199), .ZN(N27) );
  OAI22_X1 U239 ( .A1(n212), .A2(n201), .B1(n7), .B2(n210), .ZN(n136) );
  INV_X1 U240 ( .A(txr[3]), .ZN(n204) );
  AOI22_X1 U241 ( .A1(prer[11]), .A2(n218), .B1(n229), .B2(prer[3]), .ZN(n203)
         );
  AOI222_X1 U242 ( .A1(ctr[3]), .A2(n219), .B1(rxr[3]), .B2(n141), .C1(cr[3]), 
        .C2(n144), .ZN(n202) );
  OAI211_X1 U243 ( .C1(n209), .C2(n204), .A(n203), .B(n202), .ZN(N28) );
  OAI22_X1 U244 ( .A1(n212), .A2(n205), .B1(n6), .B2(n210), .ZN(n137) );
  INV_X1 U245 ( .A(txr[4]), .ZN(n208) );
  AOI22_X1 U246 ( .A1(prer[12]), .A2(n218), .B1(n229), .B2(prer[4]), .ZN(n207)
         );
  AOI222_X1 U247 ( .A1(ctr[4]), .A2(n219), .B1(rxr[4]), .B2(n141), .C1(cr[4]), 
        .C2(n144), .ZN(n206) );
  OAI211_X1 U248 ( .C1(n209), .C2(n208), .A(n207), .B(n206), .ZN(N29) );
  OAI22_X1 U249 ( .A1(n212), .A2(n211), .B1(n4), .B2(n210), .ZN(n138) );
  NAND2_X1 U250 ( .A1(n35), .A2(sr[5]), .ZN(n214) );
  AOI21_X1 U251 ( .B1(n214), .B2(n213), .A(wb_rst_i), .ZN(N77) );
  AOI22_X1 U252 ( .A1(rxr[5]), .A2(n141), .B1(n147), .B2(n144), .ZN(n217) );
  AOI22_X1 U253 ( .A1(ctr[5]), .A2(n219), .B1(prer[13]), .B2(n218), .ZN(n216)
         );
  AOI222_X1 U254 ( .A1(sr[5]), .A2(n230), .B1(prer[5]), .B2(n229), .C1(n228), 
        .C2(txr[5]), .ZN(n215) );
  NAND3_X1 U255 ( .A1(n217), .A2(n216), .A3(n215), .ZN(N30) );
  AOI22_X1 U256 ( .A1(rxr[6]), .A2(n141), .B1(n146), .B2(n144), .ZN(n222) );
  AOI22_X1 U257 ( .A1(ctr[6]), .A2(n219), .B1(prer[14]), .B2(n218), .ZN(n221)
         );
  AOI222_X1 U258 ( .A1(sr[6]), .A2(n230), .B1(prer[6]), .B2(n229), .C1(txr[6]), 
        .C2(n228), .ZN(n220) );
  NAND3_X1 U259 ( .A1(n222), .A2(n221), .A3(n220), .ZN(N31) );
  AND2_X1 U260 ( .A1(irxack), .A2(n223), .ZN(N78) );
  INV_X1 U261 ( .A(prer[15]), .ZN(n225) );
  OAI22_X1 U262 ( .A1(n226), .A2(n225), .B1(n224), .B2(n2), .ZN(n227) );
  AOI221_X1 U263 ( .B1(rxr[7]), .B2(n141), .C1(cr[7]), .C2(n144), .A(n227), 
        .ZN(n232) );
  AOI222_X1 U264 ( .A1(sr[7]), .A2(n230), .B1(prer[7]), .B2(n229), .C1(txr[7]), 
        .C2(n228), .ZN(n231) );
  NAND2_X1 U265 ( .A1(n232), .A2(n231), .ZN(N32) );
  OAI21_X1 \byte_controller/U144  ( .B1(\byte_controller/n157 ), .B2(
        \byte_controller/n156 ), .A(\byte_controller/n155 ), .ZN(
        \byte_controller/n96 ) );
  OAI211_X1 \byte_controller/U143  ( .C1(\byte_controller/n21 ), .C2(
        \byte_controller/n13 ), .A(irxack), .B(\byte_controller/n12 ), .ZN(
        \byte_controller/n155 ) );
  OAI21_X1 \byte_controller/U142  ( .B1(\byte_controller/n30 ), .B2(
        \byte_controller/n151 ), .A(\byte_controller/n150 ), .ZN(
        \byte_controller/n97 ) );
  NAND3_X1 \byte_controller/U141  ( .A1(\byte_controller/n18 ), .A2(
        \byte_controller/n149 ), .A3(\byte_controller/n3 ), .ZN(
        \byte_controller/n150 ) );
  OAI21_X1 \byte_controller/U140  ( .B1(\byte_controller/n148 ), .B2(
        \byte_controller/n19 ), .A(\byte_controller/n146 ), .ZN(
        \byte_controller/n149 ) );
  MUX2_X1 \byte_controller/U139  ( .A(\byte_controller/n29 ), .B(
        \byte_controller/n6 ), .S(\byte_controller/n2 ), .Z(
        \byte_controller/n146 ) );
  AOI21_X1 \byte_controller/U138  ( .B1(\byte_controller/n33 ), .B2(
        \byte_controller/n144 ), .A(\byte_controller/n23 ), .ZN(
        \byte_controller/n148 ) );
  OAI21_X1 \byte_controller/U137  ( .B1(\byte_controller/n30 ), .B2(
        \byte_controller/n143 ), .A(\byte_controller/n142 ), .ZN(
        \byte_controller/n98 ) );
  NAND4_X1 \byte_controller/U136  ( .A1(\byte_controller/n140 ), .A2(
        \byte_controller/n141 ), .A3(\byte_controller/n12 ), .A4(
        \byte_controller/n152 ), .ZN(\byte_controller/n142 ) );
  NAND3_X1 \byte_controller/U135  ( .A1(\byte_controller/n137 ), .A2(
        \byte_controller/n138 ), .A3(\byte_controller/n139 ), .ZN(
        \byte_controller/n140 ) );
  NAND3_X1 \byte_controller/U134  ( .A1(\byte_controller/n139 ), .A2(
        \byte_controller/n136 ), .A3(\byte_controller/n138 ), .ZN(
        \byte_controller/n141 ) );
  MUX2_X1 \byte_controller/U133  ( .A(\byte_controller/n6 ), .B(
        \byte_controller/n29 ), .S(\byte_controller/n2 ), .Z(
        \byte_controller/n138 ) );
  NAND2_X1 \byte_controller/U132  ( .A1(\byte_controller/n147 ), .A2(
        \byte_controller/n23 ), .ZN(\byte_controller/n139 ) );
  OAI21_X1 \byte_controller/U131  ( .B1(\byte_controller/n135 ), .B2(
        \byte_controller/n30 ), .A(\byte_controller/n134 ), .ZN(
        \byte_controller/n99 ) );
  NAND3_X1 \byte_controller/U130  ( .A1(\byte_controller/n18 ), .A2(
        \byte_controller/n133 ), .A3(\byte_controller/n3 ), .ZN(
        \byte_controller/n134 ) );
  OAI22_X1 \byte_controller/U129  ( .A1(\byte_controller/n13 ), .A2(
        \byte_controller/n132 ), .B1(\byte_controller/n16 ), .B2(
        \byte_controller/n137 ), .ZN(\byte_controller/n133 ) );
  OAI21_X1 \byte_controller/U128  ( .B1(\byte_controller/n3 ), .B2(
        \byte_controller/n131 ), .A(\byte_controller/n130 ), .ZN(
        \byte_controller/n100 ) );
  NAND3_X1 \byte_controller/U127  ( .A1(cr[7]), .A2(\byte_controller/n12 ), 
        .A3(\byte_controller/n11 ), .ZN(\byte_controller/n130 ) );
  OAI211_X1 \byte_controller/U126  ( .C1(\byte_controller/n21 ), .C2(
        \byte_controller/n33 ), .A(\byte_controller/n129 ), .B(
        \byte_controller/n12 ), .ZN(\byte_controller/n152 ) );
  OAI211_X1 \byte_controller/U125  ( .C1(\byte_controller/n128 ), .C2(
        \byte_controller/n127 ), .A(\byte_controller/n126 ), .B(
        \byte_controller/n157 ), .ZN(\byte_controller/N173 ) );
  NAND3_X1 \byte_controller/U124  ( .A1(cr[3]), .A2(\byte_controller/n125 ), 
        .A3(\byte_controller/n124 ), .ZN(\byte_controller/n126 ) );
  AOI22_X1 \byte_controller/U123  ( .A1(rxr[7]), .A2(\byte_controller/n123 ), 
        .B1(cr[3]), .B2(\byte_controller/c_state [3]), .ZN(
        \byte_controller/n128 ) );
  OAI211_X1 \byte_controller/U122  ( .C1(\byte_controller/n29 ), .C2(
        \byte_controller/core_ack ), .A(\byte_controller/n35 ), .B(
        \byte_controller/n122 ), .ZN(\byte_controller/n123 ) );
  OAI221_X1 \byte_controller/U121  ( .B1(\byte_controller/n5 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n119 ), .A(\byte_controller/n118 ), .ZN(
        \byte_controller/n104 ) );
  NAND2_X1 \byte_controller/U120  ( .A1(txr[7]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n118 ) );
  OAI221_X1 \byte_controller/U119  ( .B1(\byte_controller/n119 ), .B2(
        \byte_controller/n10 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n116 ), .A(\byte_controller/n115 ), .ZN(
        \byte_controller/n105 ) );
  NAND2_X1 \byte_controller/U118  ( .A1(txr[6]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n115 ) );
  OAI221_X1 \byte_controller/U117  ( .B1(\byte_controller/n116 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n114 ), .A(\byte_controller/n113 ), .ZN(
        \byte_controller/n106 ) );
  NAND2_X1 \byte_controller/U116  ( .A1(txr[5]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n113 ) );
  OAI221_X1 \byte_controller/U115  ( .B1(\byte_controller/n114 ), .B2(
        \byte_controller/n10 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n112 ), .A(\byte_controller/n95 ), .ZN(
        \byte_controller/n107 ) );
  NAND2_X1 \byte_controller/U114  ( .A1(txr[4]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n95 ) );
  OAI221_X1 \byte_controller/U113  ( .B1(\byte_controller/n112 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n94 ), .A(\byte_controller/n93 ), .ZN(
        \byte_controller/n108 ) );
  NAND2_X1 \byte_controller/U112  ( .A1(txr[3]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n93 ) );
  OAI221_X1 \byte_controller/U111  ( .B1(\byte_controller/n94 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n92 ), .A(\byte_controller/n91 ), .ZN(
        \byte_controller/n109 ) );
  NAND2_X1 \byte_controller/U110  ( .A1(txr[2]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n91 ) );
  OAI221_X1 \byte_controller/U109  ( .B1(\byte_controller/n92 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n90 ), .A(\byte_controller/n89 ), .ZN(
        \byte_controller/n111 ) );
  NAND2_X1 \byte_controller/U108  ( .A1(txr[1]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n89 ) );
  OAI221_X1 \byte_controller/U107  ( .B1(\byte_controller/n90 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n156 ), .C2(
        \byte_controller/n120 ), .A(\byte_controller/n88 ), .ZN(
        \byte_controller/n110 ) );
  NAND2_X1 \byte_controller/U106  ( .A1(txr[0]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n88 ) );
  INV_X1 \byte_controller/U105  ( .A(\byte_controller/n87 ), .ZN(
        \byte_controller/n117 ) );
  INV_X1 \byte_controller/U104  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n156 ) );
  NAND3_X1 \byte_controller/U103  ( .A1(\byte_controller/n120 ), .A2(
        \byte_controller/n86 ), .A3(\byte_controller/n87 ), .ZN(
        \byte_controller/n121 ) );
  OAI21_X1 \byte_controller/U102  ( .B1(\byte_controller/n85 ), .B2(
        \byte_controller/n19 ), .A(\byte_controller/n84 ), .ZN(
        \byte_controller/N178 ) );
  NAND3_X1 \byte_controller/U101  ( .A1(\byte_controller/n83 ), .A2(
        \byte_controller/n12 ), .A3(\byte_controller/c_state [1]), .ZN(
        \byte_controller/n84 ) );
  NAND3_X1 \byte_controller/U100  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n81 ), .A3(\byte_controller/n38 ), .ZN(
        \byte_controller/n83 ) );
  NAND3_X1 \byte_controller/U99  ( .A1(\byte_controller/n35 ), .A2(
        \byte_controller/n13 ), .A3(\byte_controller/n80 ), .ZN(
        \byte_controller/n81 ) );
  AOI22_X1 \byte_controller/U98  ( .A1(\byte_controller/n79 ), .A2(
        \byte_controller/n11 ), .B1(\byte_controller/n4 ), .B2(
        \byte_controller/n125 ), .ZN(\byte_controller/n85 ) );
  NOR2_X1 \byte_controller/U97  ( .A1(cr[7]), .A2(\byte_controller/n127 ), 
        .ZN(\byte_controller/n79 ) );
  OAI211_X1 \byte_controller/U96  ( .C1(\byte_controller/n16 ), .C2(
        \byte_controller/n78 ), .A(\byte_controller/n76 ), .B(
        \byte_controller/n77 ), .ZN(\byte_controller/N181 ) );
  NAND3_X1 \byte_controller/U95  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n12 ), .A3(\byte_controller/c_state [4]), .ZN(
        \byte_controller/n76 ) );
  NAND4_X1 \byte_controller/U94  ( .A1(cr[6]), .A2(\byte_controller/n29 ), 
        .A3(\byte_controller/n35 ), .A4(\byte_controller/n74 ), .ZN(
        \byte_controller/n77 ) );
  INV_X1 \byte_controller/U93  ( .A(\byte_controller/n157 ), .ZN(
        \byte_controller/n74 ) );
  OAI33_X1 \byte_controller/U92  ( .A1(\byte_controller/n73 ), .A2(
        \byte_controller/n72 ), .A3(\byte_controller/n80 ), .B1(
        \byte_controller/n71 ), .B2(\byte_controller/n127 ), .B3(
        \byte_controller/n13 ), .ZN(\byte_controller/N180 ) );
  INV_X1 \byte_controller/U91  ( .A(\byte_controller/n75 ), .ZN(
        \byte_controller/n71 ) );
  AOI21_X1 \byte_controller/U90  ( .B1(\byte_controller/n70 ), .B2(
        \byte_controller/n69 ), .A(\byte_controller/n36 ), .ZN(
        \byte_controller/n73 ) );
  INV_X1 \byte_controller/U89  ( .A(\byte_controller/n68 ), .ZN(
        \byte_controller/n69 ) );
  NOR2_X1 \byte_controller/U88  ( .A1(\byte_controller/c_state [4]), .A2(
        \byte_controller/n67 ), .ZN(\byte_controller/n70 ) );
  OAI221_X1 \byte_controller/U87  ( .B1(\byte_controller/n66 ), .B2(
        \byte_controller/n120 ), .C1(\byte_controller/n14 ), .C2(
        \byte_controller/n65 ), .A(\byte_controller/n87 ), .ZN(
        \byte_controller/n101 ) );
  AOI21_X1 \byte_controller/U86  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n7 ), .A(\byte_controller/n2 ), .ZN(
        \byte_controller/n66 ) );
  OAI211_X1 \byte_controller/U85  ( .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n65 ), .A(\byte_controller/n64 ), .B(
        \byte_controller/n87 ), .ZN(\byte_controller/n103 ) );
  NAND3_X1 \byte_controller/U84  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n17 ), .A3(\byte_controller/n62 ), .ZN(
        \byte_controller/n64 ) );
  INV_X1 \byte_controller/U83  ( .A(\byte_controller/dcnt[1] ), .ZN(
        \byte_controller/n62 ) );
  OAI21_X1 \byte_controller/U82  ( .B1(\byte_controller/n61 ), .B2(
        \byte_controller/n120 ), .A(\byte_controller/n86 ), .ZN(
        \byte_controller/n65 ) );
  NAND2_X1 \byte_controller/U81  ( .A1(\byte_controller/n87 ), .A2(
        \byte_controller/n60 ), .ZN(\byte_controller/n102 ) );
  MUX2_X1 \byte_controller/U80  ( .A(\byte_controller/n59 ), .B(
        \byte_controller/n61 ), .S(\byte_controller/n63 ), .Z(
        \byte_controller/n60 ) );
  INV_X1 \byte_controller/U79  ( .A(\byte_controller/n120 ), .ZN(
        \byte_controller/n63 ) );
  NAND2_X1 \byte_controller/U78  ( .A1(\byte_controller/n86 ), .A2(
        \byte_controller/n61 ), .ZN(\byte_controller/n59 ) );
  NAND2_X1 \byte_controller/U77  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n86 ), .ZN(\byte_controller/n87 ) );
  AOI21_X1 \byte_controller/U76  ( .B1(\byte_controller/n58 ), .B2(
        \byte_controller/n29 ), .A(\byte_controller/n72 ), .ZN(
        \byte_controller/N174 ) );
  NAND2_X1 \byte_controller/U75  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n80 ), .ZN(\byte_controller/n58 ) );
  OAI21_X1 \byte_controller/U74  ( .B1(\byte_controller/n28 ), .B2(
        \byte_controller/n72 ), .A(\byte_controller/n57 ), .ZN(
        \byte_controller/N175 ) );
  OAI21_X1 \byte_controller/U73  ( .B1(\byte_controller/n144 ), .B2(
        \byte_controller/n57 ), .A(\byte_controller/n56 ), .ZN(
        \byte_controller/N177 ) );
  NAND3_X1 \byte_controller/U72  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n23 ), .ZN(
        \byte_controller/n56 ) );
  NAND2_X1 \byte_controller/U71  ( .A1(\byte_controller/n11 ), .A2(
        \byte_controller/n12 ), .ZN(\byte_controller/n57 ) );
  NAND2_X1 \byte_controller/U70  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n33 ), .ZN(\byte_controller/n129 ) );
  OAI221_X1 \byte_controller/U69  ( .B1(\byte_controller/n55 ), .B2(
        \byte_controller/n72 ), .C1(\byte_controller/n78 ), .C2(
        \byte_controller/n136 ), .A(\byte_controller/n54 ), .ZN(
        \byte_controller/N179 ) );
  NAND3_X1 \byte_controller/U68  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n12 ), .A3(\byte_controller/n26 ), .ZN(
        \byte_controller/n54 ) );
  NAND2_X1 \byte_controller/U67  ( .A1(\byte_controller/n82 ), .A2(
        \byte_controller/n39 ), .ZN(\byte_controller/n75 ) );
  NAND2_X1 \byte_controller/U66  ( .A1(\byte_controller/n28 ), .A2(
        \byte_controller/n145 ), .ZN(\byte_controller/n68 ) );
  NAND2_X1 \byte_controller/U65  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/n153 ), .ZN(\byte_controller/n67 ) );
  NAND3_X1 \byte_controller/U64  ( .A1(\byte_controller/n46 ), .A2(
        \byte_controller/n12 ), .A3(\byte_controller/n1 ), .ZN(
        \byte_controller/n78 ) );
  INV_X1 \byte_controller/U63  ( .A(cr[4]), .ZN(\byte_controller/n136 ) );
  INV_X1 \byte_controller/U62  ( .A(cr[6]), .ZN(\byte_controller/n132 ) );
  NAND2_X1 \byte_controller/U61  ( .A1(\byte_controller/n86 ), .A2(
        \byte_controller/n45 ), .ZN(\byte_controller/n127 ) );
  INV_X1 \byte_controller/U60  ( .A(\byte_controller/n137 ), .ZN(
        \byte_controller/n46 ) );
  NAND3_X1 \byte_controller/U59  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n144 ), .A3(\byte_controller/n147 ), .ZN(
        \byte_controller/n137 ) );
  INV_X1 \byte_controller/U58  ( .A(cr[7]), .ZN(\byte_controller/n144 ) );
  AOI22_X1 \byte_controller/U57  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n19 ), .B1(\byte_controller/n36 ), .B2(
        \byte_controller/n80 ), .ZN(\byte_controller/n55 ) );
  NAND3_X1 \byte_controller/U56  ( .A1(\byte_controller/n14 ), .A2(
        \byte_controller/n15 ), .A3(\byte_controller/n17 ), .ZN(
        \byte_controller/n80 ) );
  NAND2_X1 \byte_controller/U55  ( .A1(\byte_controller/n47 ), .A2(
        \byte_controller/c_state [2]), .ZN(\byte_controller/n49 ) );
  INV_X1 \byte_controller/U54  ( .A(\byte_controller/n27 ), .ZN(
        \byte_controller/n124 ) );
  OAI22_X1 \byte_controller/U53  ( .A1(cr[6]), .A2(\byte_controller/n157 ), 
        .B1(\byte_controller/n72 ), .B2(\byte_controller/n47 ), .ZN(
        \byte_controller/N176 ) );
  NAND2_X1 \byte_controller/U52  ( .A1(\byte_controller/n125 ), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n157 ) );
  INV_X1 \byte_controller/U51  ( .A(\byte_controller/n72 ), .ZN(
        \byte_controller/n125 ) );
  INV_X1 \byte_controller/U50  ( .A(i2c_al), .ZN(\byte_controller/n45 ) );
  INV_X1 \byte_controller/U49  ( .A(wb_rst_i), .ZN(\byte_controller/n86 ) );
  OR3_X2 \byte_controller/U48  ( .A1(\byte_controller/ld ), .A2(wb_rst_i), 
        .A3(\byte_controller/n20 ), .ZN(\byte_controller/n120 ) );
  AND4_X1 \byte_controller/U47  ( .A1(\byte_controller/n48 ), .A2(
        \byte_controller/n145 ), .A3(\byte_controller/n154 ), .A4(
        \byte_controller/n153 ), .ZN(\byte_controller/n42 ) );
  AND2_X1 \byte_controller/U46  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n154 ), .ZN(\byte_controller/n41 ) );
  AND2_X1 \byte_controller/U45  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n35 ), .ZN(\byte_controller/n40 ) );
  AOI221_X1 \byte_controller/U44  ( .B1(\byte_controller/n154 ), .B2(
        \byte_controller/n24 ), .C1(\byte_controller/n40 ), .C2(
        \byte_controller/n41 ), .A(\byte_controller/n42 ), .ZN(
        \byte_controller/n39 ) );
  AOI221_X1 \byte_controller/U43  ( .B1(\byte_controller/n21 ), .B2(
        \byte_controller/n24 ), .C1(\byte_controller/n40 ), .C2(
        \byte_controller/n41 ), .A(\byte_controller/n42 ), .ZN(
        \byte_controller/n38 ) );
  BUF_X2 \byte_controller/U42  ( .A(arst_i), .Z(\byte_controller/n37 ) );
  NOR3_X1 \byte_controller/U41  ( .A1(\byte_controller/n49 ), .A2(
        \byte_controller/c_state [0]), .A3(\byte_controller/n122 ), .ZN(
        \byte_controller/n36 ) );
  AND3_X1 \byte_controller/U40  ( .A1(\byte_controller/n145 ), .A2(
        \byte_controller/n47 ), .A3(\byte_controller/n28 ), .ZN(
        \byte_controller/n35 ) );
  NOR2_X1 \byte_controller/U39  ( .A1(\byte_controller/n67 ), .A2(
        \byte_controller/n68 ), .ZN(\byte_controller/n53 ) );
  NOR2_X1 \byte_controller/U38  ( .A1(\byte_controller/c_state [0]), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n51 ) );
  NOR2_X1 \byte_controller/U37  ( .A1(\byte_controller/c_state [4]), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n52 ) );
  AOI22_X1 \byte_controller/U36  ( .A1(\byte_controller/n53 ), .A2(
        \byte_controller/n52 ), .B1(\byte_controller/n51 ), .B2(
        \byte_controller/n50 ), .ZN(\byte_controller/n82 ) );
  INV_X1 \byte_controller/U35  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n154 ) );
  NOR2_X1 \byte_controller/U34  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/c_state [0]), .ZN(\byte_controller/n48 ) );
  NOR2_X1 \byte_controller/U33  ( .A1(\byte_controller/n122 ), .A2(
        \byte_controller/n49 ), .ZN(\byte_controller/n50 ) );
  NAND3_X1 \byte_controller/U32  ( .A1(\byte_controller/n132 ), .A2(
        \byte_controller/n147 ), .A3(\byte_controller/n136 ), .ZN(
        \byte_controller/n31 ) );
  BUF_X1 \byte_controller/U31  ( .A(\byte_controller/n152 ), .Z(
        \byte_controller/n30 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/n25 ), .ZN(
        \byte_controller/n26 ) );
  INV_X1 \byte_controller/U29  ( .A(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n25 ) );
  INV_X1 \byte_controller/U28  ( .A(\byte_controller/n28 ), .ZN(
        \byte_controller/n23 ) );
  BUF_X1 \byte_controller/U27  ( .A(\byte_controller/n82 ), .Z(
        \byte_controller/n22 ) );
  BUF_X2 \byte_controller/U26  ( .A(\byte_controller/n27 ), .Z(
        \byte_controller/n29 ) );
  AND3_X1 \byte_controller/U25  ( .A1(\byte_controller/n47 ), .A2(
        \byte_controller/n27 ), .A3(\byte_controller/n153 ), .ZN(
        \byte_controller/n44 ) );
  AND2_X1 \byte_controller/U24  ( .A1(\byte_controller/n27 ), .A2(
        \byte_controller/n145 ), .ZN(\byte_controller/n43 ) );
  CLKBUF_X1 \byte_controller/U23  ( .A(\byte_controller/n154 ), .Z(
        \byte_controller/n21 ) );
  INV_X1 \byte_controller/U22  ( .A(cr[5]), .ZN(\byte_controller/n147 ) );
  CLKBUF_X1 \byte_controller/U21  ( .A(\byte_controller/n147 ), .Z(
        \byte_controller/n19 ) );
  CLKBUF_X1 \byte_controller/U20  ( .A(\byte_controller/n12 ), .Z(
        \byte_controller/n18 ) );
  CLKBUF_X1 \byte_controller/U19  ( .A(cr[4]), .Z(\byte_controller/n16 ) );
  OR2_X2 \byte_controller/U18  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n122 ) );
  BUF_X1 \byte_controller/U17  ( .A(\byte_controller/n153 ), .Z(
        \byte_controller/n13 ) );
  AND2_X2 \byte_controller/U16  ( .A1(\byte_controller/n86 ), .A2(
        \byte_controller/n45 ), .ZN(\byte_controller/n12 ) );
  BUF_X1 \byte_controller/U15  ( .A(\byte_controller/n121 ), .Z(
        \byte_controller/n10 ) );
  BUF_X1 \byte_controller/U14  ( .A(\byte_controller/n121 ), .Z(
        \byte_controller/n9 ) );
  BUF_X1 \byte_controller/U13  ( .A(\byte_controller/n121 ), .Z(
        \byte_controller/n8 ) );
  BUF_X1 \byte_controller/U12  ( .A(\byte_controller/n145 ), .Z(
        \byte_controller/n6 ) );
  AND4_X1 \byte_controller/U11  ( .A1(\byte_controller/n43 ), .A2(
        \byte_controller/n153 ), .A3(\byte_controller/n47 ), .A4(
        \byte_controller/c_state [0]), .ZN(\byte_controller/n24 ) );
  NAND3_X2 \byte_controller/U10  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/n86 ), .A3(\byte_controller/n45 ), .ZN(
        \byte_controller/n72 ) );
  BUF_X1 \byte_controller/U9  ( .A(\byte_controller/n24 ), .Z(
        \byte_controller/n4 ) );
  OAI211_X1 \byte_controller/U8  ( .C1(\byte_controller/n21 ), .C2(
        \byte_controller/n33 ), .A(\byte_controller/n129 ), .B(
        \byte_controller/n12 ), .ZN(\byte_controller/n3 ) );
  AND3_X1 \byte_controller/U7  ( .A1(\byte_controller/n14 ), .A2(
        \byte_controller/n15 ), .A3(\byte_controller/n17 ), .ZN(
        \byte_controller/n2 ) );
  AND3_X2 \byte_controller/U6  ( .A1(\byte_controller/n44 ), .A2(
        \byte_controller/n6 ), .A3(\byte_controller/n28 ), .ZN(
        \byte_controller/n33 ) );
  AND2_X1 \byte_controller/U5  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n32 ), .ZN(\byte_controller/n34 ) );
  AND2_X1 \byte_controller/U4  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n32 ), .ZN(\byte_controller/n1 ) );
  AND2_X2 \byte_controller/U3  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n1 ), .ZN(\byte_controller/n11 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/N180 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [3]), .QN(
        \byte_controller/n153 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/N181 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(\byte_controller/c_state [4]), .QN(\byte_controller/n47 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/N179 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n145 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(
        \byte_controller/core_cmd [2]), .QN(\byte_controller/n143 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n135 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(
        \byte_controller/core_cmd [3]), .QN(\byte_controller/n151 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/N177 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [0]), .QN(
        \byte_controller/n28 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n110 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[0]), .QN(
        \byte_controller/n90 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n111 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[1]), .QN(
        \byte_controller/n92 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n109 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[2]), .QN(
        \byte_controller/n94 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n108 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[3]), .QN(
        \byte_controller/n112 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[4]), .QN(
        \byte_controller/n114 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n106 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[5]), .QN(
        \byte_controller/n116 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[6]), .QN(
        \byte_controller/n119 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(rxr[7]), .QN(
        \byte_controller/n5 ) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N176 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(done), .QN(
        \byte_controller/n32 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n102 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(\byte_controller/n61 ), .QN(
        \byte_controller/n17 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N174 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .QN(\byte_controller/n20 ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(irxack) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/N178 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n27 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n100 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(
        \byte_controller/core_cmd [0]), .QN(\byte_controller/n131 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N173 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n101 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(\byte_controller/n7 ), .QN(
        \byte_controller/n14 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n103 ), .CK(
        wb_clk_i), .RN(\byte_controller/n37 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n15 ) );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N175 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n37 ), .Q(\byte_controller/ld ) );
  NOR3_X1 \byte_controller/bit_controller/U171  ( .A1(
        \byte_controller/bit_controller/n87 ), .A2(
        \byte_controller/bit_controller/n88 ), .A3(
        \byte_controller/bit_controller/n227 ), .ZN(
        \byte_controller/bit_controller/N154 ) );
  AOI211_X1 \byte_controller/bit_controller/U170  ( .C1(
        \byte_controller/bit_controller/n81 ), .C2(
        \byte_controller/bit_controller/n80 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N75 ) );
  NOR3_X1 \byte_controller/bit_controller/U169  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  MUX2_X1 \byte_controller/bit_controller/U168  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n225 ), .S(
        \byte_controller/bit_controller/n224 ), .Z(
        \byte_controller/bit_controller/n158 ) );
  AOI21_X1 \byte_controller/bit_controller/U167  ( .B1(
        \byte_controller/bit_controller/n31 ), .B2(
        \byte_controller/bit_controller/n222 ), .A(
        \byte_controller/bit_controller/n221 ), .ZN(
        \byte_controller/bit_controller/n224 ) );
  NAND4_X1 \byte_controller/bit_controller/U166  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n124 ), .A3(
        \byte_controller/bit_controller/n17 ), .A4(
        \byte_controller/bit_controller/n220 ), .ZN(
        \byte_controller/bit_controller/n225 ) );
  AOI211_X1 \byte_controller/bit_controller/U165  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n219 ), .A(\byte_controller/bit_controller/n227 ), .B(
        \byte_controller/bit_controller/n218 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  NAND4_X1 \byte_controller/bit_controller/U164  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n111 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n219 ) );
  OAI22_X1 \byte_controller/bit_controller/U163  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n26 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U162  ( .A1(
        \byte_controller/bit_controller/n109 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n108 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U161  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  INV_X1 \byte_controller/bit_controller/U160  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n214 ) );
  AOI21_X1 \byte_controller/bit_controller/U159  ( .B1(
        \byte_controller/bit_controller/n78 ), .B2(
        \byte_controller/bit_controller/n209 ), .A(
        \byte_controller/bit_controller/n67 ), .ZN(
        \byte_controller/bit_controller/n228 ) );
  INV_X1 \byte_controller/bit_controller/U158  ( .A(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n160 ) );
  AOI222_X1 \byte_controller/bit_controller/U157  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  INV_X1 \byte_controller/bit_controller/U156  ( .A(
        \byte_controller/bit_controller/n206 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  AOI222_X1 \byte_controller/bit_controller/U155  ( .A1(prer[0]), .A2(
        \byte_controller/bit_controller/n37 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/n36 ), .C1(
        \byte_controller/bit_controller/N28 ), .C2(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  INV_X1 \byte_controller/bit_controller/U154  ( .A(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n139 ) );
  AOI222_X1 \byte_controller/bit_controller/U153  ( .A1(prer[1]), .A2(
        \byte_controller/bit_controller/n37 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/n2 ), .C1(
        \byte_controller/bit_controller/n98 ), .C2(
        \byte_controller/bit_controller/N29 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  INV_X1 \byte_controller/bit_controller/U152  ( .A(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n138 ) );
  AOI222_X1 \byte_controller/bit_controller/U151  ( .A1(prer[2]), .A2(
        \byte_controller/bit_controller/n90 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/n35 ), .C1(
        \byte_controller/bit_controller/n98 ), .C2(
        \byte_controller/bit_controller/N30 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  INV_X1 \byte_controller/bit_controller/U150  ( .A(
        \byte_controller/bit_controller/n203 ), .ZN(
        \byte_controller/bit_controller/n137 ) );
  AOI222_X1 \byte_controller/bit_controller/U149  ( .A1(
        \byte_controller/bit_controller/n37 ), .A2(prer[3]), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/n32 ), .C1(
        \byte_controller/bit_controller/n98 ), .C2(
        \byte_controller/bit_controller/N31 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  INV_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  AOI222_X1 \byte_controller/bit_controller/U147  ( .A1(
        \byte_controller/bit_controller/n37 ), .A2(prer[4]), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/n33 ), .C1(
        \byte_controller/bit_controller/n98 ), .C2(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  INV_X1 \byte_controller/bit_controller/U146  ( .A(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  AOI222_X1 \byte_controller/bit_controller/U145  ( .A1(
        \byte_controller/bit_controller/N33 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(
        \byte_controller/bit_controller/n90 ), .B2(prer[5]), .C1(
        \byte_controller/bit_controller/n85 ), .C2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/n201 ) );
  INV_X1 \byte_controller/bit_controller/U144  ( .A(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n134 ) );
  AOI222_X1 \byte_controller/bit_controller/U143  ( .A1(prer[6]), .A2(
        \byte_controller/bit_controller/n37 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/cnt [6]), .C1(
        \byte_controller/bit_controller/n97 ), .C2(
        \byte_controller/bit_controller/N34 ), .ZN(
        \byte_controller/bit_controller/n200 ) );
  INV_X1 \byte_controller/bit_controller/U142  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  AOI222_X1 \byte_controller/bit_controller/U141  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(
        \byte_controller/bit_controller/n90 ), .B2(prer[9]), .C1(
        \byte_controller/bit_controller/n85 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n199 ) );
  INV_X1 \byte_controller/bit_controller/U140  ( .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AOI222_X1 \byte_controller/bit_controller/U139  ( .A1(
        \byte_controller/bit_controller/N38 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(
        \byte_controller/bit_controller/n90 ), .B2(prer[10]), .C1(
        \byte_controller/bit_controller/n85 ), .C2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/n198 ) );
  INV_X1 \byte_controller/bit_controller/U138  ( .A(
        \byte_controller/bit_controller/n197 ), .ZN(
        \byte_controller/bit_controller/n129 ) );
  AOI222_X1 \byte_controller/bit_controller/U137  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(prer[11]), .B2(
        \byte_controller/bit_controller/n207 ), .C1(
        \byte_controller/bit_controller/n85 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n197 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/n128 ) );
  AOI222_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(prer[12]), .B2(
        \byte_controller/bit_controller/n207 ), .C1(
        \byte_controller/bit_controller/n85 ), .C2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U134  ( .A(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n127 ) );
  AOI222_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(prer[13]), .C2(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n195 ) );
  INV_X1 \byte_controller/bit_controller/U132  ( .A(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n126 ) );
  AOI222_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n97 ), .B1(
        \byte_controller/bit_controller/n85 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n194 ) );
  OAI211_X1 \byte_controller/bit_controller/U130  ( .C1(
        \byte_controller/bit_controller/n20 ), .C2(
        \byte_controller/bit_controller/n192 ), .A(
        \byte_controller/bit_controller/n191 ), .B(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n193 ) );
  NAND2_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/n190 ), .A2(ctr[7]), .ZN(
        \byte_controller/bit_controller/n191 ) );
  NAND4_X1 \byte_controller/bit_controller/U128  ( .A1(
        \byte_controller/bit_controller/n189 ), .A2(
        \byte_controller/bit_controller/n188 ), .A3(
        \byte_controller/bit_controller/n187 ), .A4(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  NAND2_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/N68 ) );
  AOI21_X1 \byte_controller/bit_controller/U126  ( .B1(
        \byte_controller/bit_controller/n184 ), .B2(
        \byte_controller/bit_controller/n222 ), .A(
        \byte_controller/bit_controller/n221 ), .ZN(
        \byte_controller/bit_controller/n185 ) );
  INV_X1 \byte_controller/bit_controller/U125  ( .A(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  NAND3_X1 \byte_controller/bit_controller/U124  ( .A1(
        \byte_controller/bit_controller/n222 ), .A2(
        \byte_controller/bit_controller/n28 ), .A3(
        \byte_controller/bit_controller/n122 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  NAND4_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  INV_X1 \byte_controller/bit_controller/U122  ( .A(
        \byte_controller/bit_controller/n218 ), .ZN(
        \byte_controller/bit_controller/n179 ) );
  NAND3_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n123 ), .A3(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n218 ) );
  OAI22_X1 \byte_controller/bit_controller/U120  ( .A1(
        \byte_controller/bit_controller/n8 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n113 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n114 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI21_X1 \byte_controller/bit_controller/U118  ( .B1(
        \byte_controller/bit_controller/n10 ), .B2(
        \byte_controller/bit_controller/n4 ), .A(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  NAND4_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n31 ), .A2(
        \byte_controller/core_cmd [3]), .A3(
        \byte_controller/bit_controller/n38 ), .A4(
        \byte_controller/bit_controller/n177 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  NOR3_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n177 ) );
  OAI22_X1 \byte_controller/bit_controller/U115  ( .A1(
        \byte_controller/bit_controller/n122 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n4 ), .B2(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U112  ( .A1(
        \byte_controller/bit_controller/n14 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n28 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI22_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n117 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U110  ( .A1(
        \byte_controller/bit_controller/n6 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n118 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n210 ), .A2(
        \byte_controller/bit_controller/n176 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n86 ) );
  NAND3_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n31 ), .A2(
        \byte_controller/bit_controller/n175 ), .A3(
        \byte_controller/bit_controller/n38 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  OAI33_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/bit_controller/n173 ), .A2(
        \byte_controller/bit_controller/n172 ), .A3(
        \byte_controller/bit_controller/n171 ), .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/N69 ), .B3(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/N83 ) );
  NAND2_X1 \byte_controller/bit_controller/U106  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  NAND2_X1 \byte_controller/bit_controller/U105  ( .A1(
        \byte_controller/bit_controller/n96 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  NAND4_X1 \byte_controller/bit_controller/U104  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  NOR4_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n29 ), .A2(
        \byte_controller/bit_controller/n165 ), .A3(
        \byte_controller/bit_controller/n164 ), .A4(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  NAND3_X1 \byte_controller/bit_controller/U102  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n119 ), .A3(
        \byte_controller/bit_controller/n115 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  NAND3_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n102 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n226 ) );
  OAI21_X1 \byte_controller/bit_controller/U100  ( .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/n4 ), .A(
        \byte_controller/bit_controller/n162 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  OAI21_X1 \byte_controller/bit_controller/U99  ( .B1(
        \byte_controller/bit_controller/n181 ), .B2(
        \byte_controller/bit_controller/n163 ), .A(
        \byte_controller/bit_controller/n38 ), .ZN(
        \byte_controller/bit_controller/n162 ) );
  OAI22_X1 \byte_controller/bit_controller/U98  ( .A1(
        \byte_controller/bit_controller/n16 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U97  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n213 ), .B1(
        \byte_controller/bit_controller/n4 ), .B2(
        \byte_controller/bit_controller/n15 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  NAND2_X1 \byte_controller/bit_controller/U96  ( .A1(
        \byte_controller/bit_controller/n222 ), .A2(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  INV_X1 \byte_controller/bit_controller/U95  ( .A(
        \byte_controller/bit_controller/n227 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  NAND2_X1 \byte_controller/bit_controller/U94  ( .A1(
        \byte_controller/bit_controller/n79 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n227 ) );
  NOR2_X1 \byte_controller/bit_controller/U93  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n161 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  MUX2_X1 \byte_controller/bit_controller/U92  ( .A(
        \byte_controller/bit_controller/n133 ), .B(
        \byte_controller/bit_controller/n82 ), .S(
        \byte_controller/bit_controller/n87 ), .Z(
        \byte_controller/bit_controller/n161 ) );
  NAND2_X1 \byte_controller/bit_controller/U91  ( .A1(
        \byte_controller/bit_controller/n132 ), .A2(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n133 ) );
  INV_X1 \byte_controller/bit_controller/U90  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n175 ) );
  INV_X1 \byte_controller/bit_controller/U89  ( .A(
        \byte_controller/bit_controller/n176 ), .ZN(
        \byte_controller/bit_controller/n132 ) );
  NAND3_X1 \byte_controller/bit_controller/U88  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n211 ), .A3(
        \byte_controller/bit_controller/n215 ), .ZN(
        \byte_controller/bit_controller/n176 ) );
  INV_X1 \byte_controller/bit_controller/U87  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n215 ) );
  INV_X1 \byte_controller/bit_controller/U86  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n211 ) );
  NOR4_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n105 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n125 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  OR2_X1 \byte_controller/bit_controller/U84  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N66 ) );
  NAND2_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  INV_X1 \byte_controller/bit_controller/U82  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n209 ) );
  OR2_X1 \byte_controller/bit_controller/U81  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U80  ( .A1(
        \byte_controller/bit_controller/n216 ), .A2(
        \byte_controller/bit_controller/n103 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OR2_X1 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n103 ) );
  AND2_X1 \byte_controller/bit_controller/U78  ( .A1(
        \byte_controller/bit_controller/N36 ), .A2(
        \byte_controller/bit_controller/n97 ), .ZN(
        \byte_controller/bit_controller/n101 ) );
  AND2_X1 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n85 ), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/n100 ) );
  AND2_X1 \byte_controller/bit_controller/U76  ( .A1(prer[8]), .A2(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n99 ) );
  AND2_X2 \byte_controller/bit_controller/U75  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n98 ) );
  AND2_X2 \byte_controller/bit_controller/U74  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n209 ), .ZN(
        \byte_controller/bit_controller/n97 ) );
  AND2_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n169 ), .A2(
        \byte_controller/bit_controller/n168 ), .ZN(
        \byte_controller/bit_controller/n96 ) );
  NAND2_X1 \byte_controller/bit_controller/U72  ( .A1(
        \byte_controller/bit_controller/N35 ), .A2(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/n95 ) );
  NAND2_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n85 ), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/n94 ) );
  NAND2_X1 \byte_controller/bit_controller/U70  ( .A1(prer[7]), .A2(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n93 ) );
  NAND2_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n212 ), .A2(
        \byte_controller/bit_controller/n91 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  OR2_X1 \byte_controller/bit_controller/U68  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n91 ) );
  INV_X1 \byte_controller/bit_controller/U67  ( .A(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  AND2_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n18 ), .A2(ctr[7]), .ZN(
        \byte_controller/bit_controller/n89 ) );
  NAND3_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n41 ), .A2(
        \byte_controller/bit_controller/n214 ), .A3(
        \byte_controller/bit_controller/n21 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  NAND2_X1 \byte_controller/bit_controller/U64  ( .A1(
        \byte_controller/bit_controller/n23 ), .A2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n212 ) );
  AND3_X1 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n17 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n88 ) );
  AND2_X2 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n3 ), .A2(
        \byte_controller/bit_controller/n67 ), .ZN(
        \byte_controller/bit_controller/n85 ) );
  OAI211_X1 \byte_controller/bit_controller/U61  ( .C1(
        \byte_controller/bit_controller/n20 ), .C2(
        \byte_controller/bit_controller/n192 ), .A(
        \byte_controller/bit_controller/n209 ), .B(
        \byte_controller/bit_controller/n3 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U60  ( .A(
        \byte_controller/bit_controller/n89 ), .Z(
        \byte_controller/bit_controller/n78 ) );
  BUF_X1 \byte_controller/bit_controller/U59  ( .A(
        \byte_controller/bit_controller/n76 ), .Z(
        \byte_controller/bit_controller/n75 ) );
  NAND2_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n83 ), .A2(
        \byte_controller/bit_controller/n20 ), .ZN(
        \byte_controller/bit_controller/n70 ) );
  MUX2_X1 \byte_controller/bit_controller/U57  ( .A(
        \byte_controller/bit_controller/n69 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n70 ), .Z(
        \byte_controller/bit_controller/n68 ) );
  NOR2_X1 \byte_controller/bit_controller/U56  ( .A1(
        \byte_controller/bit_controller/n192 ), .A2(
        \byte_controller/bit_controller/N68 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  OR4_X1 \byte_controller/bit_controller/U55  ( .A1(
        \byte_controller/bit_controller/n183 ), .A2(
        \byte_controller/bit_controller/n182 ), .A3(
        \byte_controller/bit_controller/n181 ), .A4(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  MUX2_X1 \byte_controller/bit_controller/U54  ( .A(scl_padoen_o), .B(
        \byte_controller/bit_controller/n66 ), .S(
        \byte_controller/bit_controller/n185 ), .Z(
        \byte_controller/bit_controller/n65 ) );
  OR2_X1 \byte_controller/bit_controller/U53  ( .A1(
        \byte_controller/bit_controller/n96 ), .A2(
        \byte_controller/bit_controller/n64 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  NAND3_X1 \byte_controller/bit_controller/U52  ( .A1(
        \byte_controller/bit_controller/n93 ), .A2(
        \byte_controller/bit_controller/n94 ), .A3(
        \byte_controller/bit_controller/n95 ), .ZN(
        \byte_controller/bit_controller/n63 ) );
  BUF_X1 \byte_controller/bit_controller/U51  ( .A(\byte_controller/n37 ), .Z(
        \byte_controller/bit_controller/n71 ) );
  BUF_X1 \byte_controller/bit_controller/U50  ( .A(
        \byte_controller/bit_controller/n71 ), .Z(
        \byte_controller/bit_controller/n77 ) );
  BUF_X1 \byte_controller/bit_controller/U49  ( .A(
        \byte_controller/bit_controller/n77 ), .Z(
        \byte_controller/bit_controller/n72 ) );
  BUF_X1 \byte_controller/bit_controller/U48  ( .A(
        \byte_controller/bit_controller/n71 ), .Z(
        \byte_controller/bit_controller/n76 ) );
  BUF_X1 \byte_controller/bit_controller/U47  ( .A(
        \byte_controller/bit_controller/n76 ), .Z(
        \byte_controller/bit_controller/n73 ) );
  BUF_X1 \byte_controller/bit_controller/U46  ( .A(
        \byte_controller/bit_controller/n76 ), .Z(
        \byte_controller/bit_controller/n74 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U45  ( .A(
        \byte_controller/bit_controller/cnt [8]), .Z(
        \byte_controller/bit_controller/n50 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U44  ( .A(
        \byte_controller/bit_controller/n97 ), .Z(
        \byte_controller/bit_controller/n42 ) );
  AND3_X1 \byte_controller/bit_controller/U43  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n24 ), .A3(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n223 ) );
  INV_X1 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n90 ) );
  INV_X1 \byte_controller/bit_controller/U40  ( .A(
        \byte_controller/bit_controller/n84 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  INV_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/n36 ) );
  INV_X1 \byte_controller/bit_controller/U38  ( .A(
        \byte_controller/bit_controller/n30 ), .ZN(
        \byte_controller/bit_controller/n35 ) );
  NOR4_X1 \byte_controller/bit_controller/U37  ( .A1(
        \byte_controller/bit_controller/n226 ), .A2(
        \byte_controller/bit_controller/n165 ), .A3(
        \byte_controller/bit_controller/n164 ), .A4(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n34 ) );
  INV_X1 \byte_controller/bit_controller/U36  ( .A(
        \byte_controller/bit_controller/n58 ), .ZN(
        \byte_controller/bit_controller/n33 ) );
  INV_X1 \byte_controller/bit_controller/U35  ( .A(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  AND3_X1 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n24 ), .A3(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U33  ( .A(
        \byte_controller/bit_controller/n60 ), .Z(
        \byte_controller/bit_controller/n30 ) );
  OR3_X2 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n99 ), .A2(
        \byte_controller/bit_controller/n101 ), .A3(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/n62 ) );
  NAND3_X1 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n17 ), .ZN(
        \byte_controller/bit_controller/n29 ) );
  INV_X1 \byte_controller/bit_controller/U30  ( .A(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  INV_X1 \byte_controller/bit_controller/U29  ( .A(
        \byte_controller/bit_controller/n25 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  NOR4_X1 \byte_controller/bit_controller/U28  ( .A1(
        \byte_controller/bit_controller/n167 ), .A2(
        \byte_controller/bit_controller/n180 ), .A3(
        \byte_controller/bit_controller/n19 ), .A4(
        \byte_controller/bit_controller/n166 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  NOR4_X1 \byte_controller/bit_controller/U27  ( .A1(
        \byte_controller/bit_controller/n167 ), .A2(
        \byte_controller/bit_controller/n180 ), .A3(
        \byte_controller/bit_controller/n19 ), .A4(
        \byte_controller/bit_controller/n166 ), .ZN(
        \byte_controller/bit_controller/n24 ) );
  AND3_X1 \byte_controller/bit_controller/U26  ( .A1(
        \byte_controller/bit_controller/n38 ), .A2(
        \byte_controller/bit_controller/n175 ), .A3(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n41 ) );
  AND3_X1 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n38 ), .A2(
        \byte_controller/bit_controller/n175 ), .A3(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  AND2_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n222 ), .A2(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n38 ) );
  AND3_X1 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n214 ), .A2(
        \byte_controller/bit_controller/n211 ), .A3(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n22 ) );
  AND2_X1 \byte_controller/bit_controller/U22  ( .A1(
        \byte_controller/bit_controller/n215 ), .A2(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n21 ) );
  AND4_X2 \byte_controller/bit_controller/U21  ( .A1(
        \byte_controller/bit_controller/n58 ), .A2(
        \byte_controller/bit_controller/n59 ), .A3(
        \byte_controller/bit_controller/n56 ), .A4(
        \byte_controller/bit_controller/n57 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  NAND4_X1 \byte_controller/bit_controller/U20  ( .A1(
        \byte_controller/bit_controller/n189 ), .A2(
        \byte_controller/bit_controller/n188 ), .A3(
        \byte_controller/bit_controller/n187 ), .A4(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/n18 ) );
  AND4_X2 \byte_controller/bit_controller/U19  ( .A1(
        \byte_controller/bit_controller/n60 ), .A2(
        \byte_controller/bit_controller/n54 ), .A3(
        \byte_controller/bit_controller/n51 ), .A4(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/n189 ) );
  AND2_X1 \byte_controller/bit_controller/U18  ( .A1(
        \byte_controller/bit_controller/n92 ), .A2(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/n102 ) );
  AND2_X1 \byte_controller/bit_controller/U17  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n17 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U16  ( .A(
        \byte_controller/bit_controller/n110 ), .Z(
        \byte_controller/bit_controller/n16 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U15  ( .A(
        \byte_controller/bit_controller/n110 ), .Z(
        \byte_controller/bit_controller/n15 ) );
  INV_X1 \byte_controller/bit_controller/U14  ( .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  INV_X1 \byte_controller/bit_controller/U13  ( .A(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  INV_X1 \byte_controller/bit_controller/U12  ( .A(
        \byte_controller/bit_controller/n9 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  INV_X1 \byte_controller/bit_controller/U11  ( .A(
        \byte_controller/bit_controller/n7 ), .ZN(
        \byte_controller/bit_controller/n8 ) );
  INV_X1 \byte_controller/bit_controller/U10  ( .A(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n6 ) );
  OR2_X2 \byte_controller/bit_controller/U9  ( .A1(
        \byte_controller/bit_controller/n116 ), .A2(
        \byte_controller/bit_controller/n227 ), .ZN(
        \byte_controller/bit_controller/n217 ) );
  BUF_X2 \byte_controller/bit_controller/U8  ( .A(
        \byte_controller/bit_controller/n217 ), .Z(
        \byte_controller/bit_controller/n4 ) );
  NAND2_X1 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n190 ), .A2(ctr[7]), .ZN(
        \byte_controller/bit_controller/n3 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U6  ( .A(
        \byte_controller/bit_controller/n55 ), .Z(
        \byte_controller/bit_controller/n2 ) );
  AND4_X2 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n44 ), .A3(
        \byte_controller/bit_controller/n45 ), .A4(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U4  ( .A(
        \byte_controller/bit_controller/n59 ), .Z(
        \byte_controller/bit_controller/n1 ) );
  AND4_X2 \byte_controller/bit_controller/U3  ( .A1(
        \byte_controller/bit_controller/n47 ), .A2(
        \byte_controller/bit_controller/n48 ), .A3(
        \byte_controller/bit_controller/n49 ), .A4(
        \byte_controller/bit_controller/n53 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/n7 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/n9 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n135 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n57 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n64 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n136 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n58 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n140 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/n52 ), .QN(
        \byte_controller/bit_controller/n51 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n134 ), .CK(wb_clk_i), .RN(
        \byte_controller/n37 ), .Q(\byte_controller/bit_controller/cnt [6]), 
        .QN(\byte_controller/bit_controller/n56 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n137 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n59 ) );
  DFFRS_X2 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N154 ), .CK(wb_clk_i), .RN(
        \byte_controller/n37 ), .SN(1'b1), .Q(\byte_controller/core_ack ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n63 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n53 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n138 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/n61 ), .QN(
        \byte_controller/bit_controller/n60 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n139 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/n55 ), .QN(
        \byte_controller/bit_controller/n54 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n127 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n44 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n128 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n45 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n130 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n47 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n129 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n46 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n126 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n43 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n131 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n48 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n160 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n40 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/n37 ), .Q(\byte_controller/bit_controller/n164 ), 
        .QN(\byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n62 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n49 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/n25 ), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/n37 ), .Q(\byte_controller/bit_controller/n163 ), 
        .QN(\byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/n27 ), .QN(
        \byte_controller/bit_controller/n92 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n181 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n86 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/n5 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n172 ), .QN(
        \byte_controller/bit_controller/n82 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n125 ), .QN(
        \byte_controller/bit_controller/n104 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n75 ), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n81 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n166 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n11 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/n13 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N83 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n79 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n180 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .Q(
        \byte_controller/bit_controller/n19 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n73 ), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n74 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n170 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n228 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n116 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n192 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n65 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n75 ), .Q(scl_padoen_o) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n68 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n171 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n74 ), .QN(
        \byte_controller/bit_controller/n80 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N66 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n20 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n74 ), .Q(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n105 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U150  ( .A1(
        \byte_controller/bit_controller/sub_105/n133 ), .A2(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/sub_105/n131 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U149  ( .A1(
        \byte_controller/bit_controller/sub_105/n130 ), .A2(
        \byte_controller/bit_controller/sub_105/n107 ), .ZN(
        \byte_controller/bit_controller/sub_105/n128 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U148  ( .A(
        \byte_controller/bit_controller/sub_105/n20 ), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U147  ( .A1(
        \byte_controller/bit_controller/sub_105/n61 ), .A2(
        \byte_controller/bit_controller/sub_105/n125 ), .A3(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U146  ( .A1(
        \byte_controller/bit_controller/sub_105/n121 ), .A2(
        \byte_controller/bit_controller/sub_105/n122 ), .A3(
        \byte_controller/bit_controller/sub_105/n107 ), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U145  ( .A1(
        \byte_controller/bit_controller/sub_105/n34 ), .A2(
        \byte_controller/bit_controller/sub_105/n36 ), .A3(
        \byte_controller/bit_controller/sub_105/n16 ), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U144  ( .A(
        \byte_controller/bit_controller/sub_105/n112 ), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U143  ( .A1(
        \byte_controller/bit_controller/sub_105/n26 ), .A2(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U142  ( .A1(
        \byte_controller/bit_controller/sub_105/n110 ), .A2(
        \byte_controller/bit_controller/sub_105/n134 ), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U141  ( .A1(
        \byte_controller/bit_controller/sub_105/n106 ), .A2(
        \byte_controller/bit_controller/sub_105/n107 ), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U140  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n33 ), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U139  ( .B1(
        \byte_controller/bit_controller/sub_105/n99 ), .B2(
        \byte_controller/bit_controller/sub_105/n100 ), .A(
        \byte_controller/bit_controller/sub_105/n98 ), .ZN(
        \byte_controller/bit_controller/N39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U138  ( .A1(
        \byte_controller/bit_controller/sub_105/n97 ), .A2(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U136  ( .A1(
        \byte_controller/bit_controller/sub_105/n92 ), .A2(
        \byte_controller/bit_controller/sub_105/n93 ), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U135  ( .A1(
        \byte_controller/bit_controller/sub_105/n91 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U134  ( .B1(
        \byte_controller/bit_controller/sub_105/n8 ), .B2(
        \byte_controller/bit_controller/sub_105/n86 ), .A(
        \byte_controller/bit_controller/sub_105/n85 ), .ZN(
        \byte_controller/bit_controller/N40 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n81 ), .A2(
        \byte_controller/bit_controller/sub_105/n82 ), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n80 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U131  ( .B1(
        \byte_controller/bit_controller/sub_105/n11 ), .B2(
        \byte_controller/bit_controller/sub_105/n75 ), .A(
        \byte_controller/bit_controller/sub_105/n74 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U130  ( .A1(
        \byte_controller/bit_controller/sub_105/n72 ), .A2(
        \byte_controller/bit_controller/sub_105/n73 ), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n71 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n92 ), .A2(
        \byte_controller/bit_controller/sub_105/n68 ), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A1(
        \byte_controller/bit_controller/sub_105/n111 ), .A2(
        \byte_controller/bit_controller/sub_105/n67 ), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U126  ( .A1(
        \byte_controller/bit_controller/sub_105/n63 ), .A2(
        \byte_controller/bit_controller/sub_105/n64 ), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U125  ( .A(
        \byte_controller/bit_controller/sub_105/n62 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U123  ( .A1(
        \byte_controller/bit_controller/sub_105/n55 ), .A2(
        \byte_controller/bit_controller/sub_105/n54 ), .A3(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U122  ( .A(
        \byte_controller/bit_controller/sub_105/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U121  ( .B1(
        \byte_controller/bit_controller/sub_105/n46 ), .B2(
        \byte_controller/bit_controller/sub_105/n119 ), .A(
        \byte_controller/bit_controller/sub_105/n2 ), .ZN(
        \byte_controller/bit_controller/N33 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U120  ( .A1(
        \byte_controller/bit_controller/sub_105/n53 ), .A2(
        \byte_controller/bit_controller/sub_105/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U119  ( .A1(
        \byte_controller/bit_controller/sub_105/n40 ), .A2(
        \byte_controller/bit_controller/N28 ), .A3(
        \byte_controller/bit_controller/sub_105/n41 ), .A4(
        \byte_controller/bit_controller/sub_105/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U118  ( .A(
        \byte_controller/bit_controller/sub_105/n38 ), .B(
        \byte_controller/bit_controller/sub_105/n39 ), .S(
        \byte_controller/bit_controller/cnt [7]), .Z(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U117  ( .A1(
        \byte_controller/bit_controller/sub_105/n35 ), .A2(
        \byte_controller/bit_controller/sub_105/n120 ), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U116  ( .A1(
        \byte_controller/bit_controller/sub_105/n27 ), .A2(
        \byte_controller/bit_controller/sub_105/n28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n23 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U115  ( .A1(
        \byte_controller/bit_controller/sub_105/n25 ), .A2(
        \byte_controller/bit_controller/sub_105/n26 ), .ZN(
        \byte_controller/bit_controller/sub_105/n24 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U114  ( .A1(
        \byte_controller/bit_controller/sub_105/n21 ), .A2(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/N36 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U113  ( .B1(
        \byte_controller/bit_controller/sub_105/n13 ), .B2(
        \byte_controller/bit_controller/sub_105/n122 ), .A(
        \byte_controller/bit_controller/sub_105/n20 ), .ZN(
        \byte_controller/bit_controller/N37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U112  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U111  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U110  ( .A1(
        \byte_controller/bit_controller/n61 ), .A2(
        \byte_controller/bit_controller/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A1(
        \byte_controller/bit_controller/n61 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/sub_105/n14 ), .A2(
        \byte_controller/bit_controller/n61 ), .A3(
        \byte_controller/bit_controller/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U107  ( .A(
        \byte_controller/bit_controller/sub_105/n59 ), .B(
        \byte_controller/bit_controller/sub_105/n3 ), .ZN(
        \byte_controller/bit_controller/N30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A1(
        \byte_controller/bit_controller/n61 ), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U104  ( .A(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U103  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U102  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U101  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U100  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U98  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U97  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U96  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U95  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U94  ( .B1(
        \byte_controller/bit_controller/sub_105/n113 ), .B2(
        \byte_controller/bit_controller/sub_105/n114 ), .A(
        \byte_controller/bit_controller/sub_105/n112 ), .ZN(
        \byte_controller/bit_controller/N38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U93  ( .A1(
        \byte_controller/bit_controller/n55 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n25 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/n55 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U91  ( .A1(
        \byte_controller/bit_controller/sub_105/n5 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U90  ( .A1(
        \byte_controller/bit_controller/n55 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U89  ( .A1(
        \byte_controller/bit_controller/sub_105/n12 ), .A2(
        \byte_controller/bit_controller/sub_105/n9 ), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U88  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U87  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U86  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n125 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n133 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U84  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U83  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U82  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U81  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U80  ( .A(
        \byte_controller/bit_controller/sub_105/n74 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U79  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n28 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U77  ( .A1(
        \byte_controller/bit_controller/n55 ), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U76  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U75  ( .A(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U74  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U73  ( .A(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/sub_105/n65 ), .A2(
        \byte_controller/bit_controller/sub_105/n66 ), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U71  ( .A(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U70  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U69  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n130 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U68  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U67  ( .A1(
        \byte_controller/bit_controller/sub_105/n57 ), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U66  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U65  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U64  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U63  ( .A1(
        \byte_controller/bit_controller/sub_105/n69 ), .A2(
        \byte_controller/bit_controller/sub_105/n70 ), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U62  ( .A1(
        \byte_controller/bit_controller/sub_105/n43 ), .A2(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U61  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U60  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U59  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U58  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U57  ( .A1(
        \byte_controller/bit_controller/sub_105/n32 ), .A2(
        \byte_controller/bit_controller/sub_105/n31 ), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U56  ( .A1(
        \byte_controller/bit_controller/sub_105/n37 ), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U55  ( .A1(
        \byte_controller/bit_controller/sub_105/n30 ), .A2(
        \byte_controller/bit_controller/sub_105/n29 ), .ZN(
        \byte_controller/bit_controller/sub_105/n21 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U54  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U53  ( .A(
        \byte_controller/bit_controller/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U52  ( .A(
        \byte_controller/bit_controller/sub_105/n45 ), .B(
        \byte_controller/bit_controller/sub_105/n18 ), .ZN(
        \byte_controller/bit_controller/N34 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U51  ( .B1(
        \byte_controller/bit_controller/sub_105/n23 ), .B2(
        \byte_controller/bit_controller/sub_105/n24 ), .A(
        \byte_controller/bit_controller/sub_105/n6 ), .ZN(
        \byte_controller/bit_controller/sub_105/n22 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U50  ( .B1(
        \byte_controller/bit_controller/sub_105/n56 ), .B2(
        \byte_controller/bit_controller/sub_105/n49 ), .A(
        \byte_controller/bit_controller/sub_105/n52 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U49  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n15 ), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U48  ( .A1(
        \byte_controller/bit_controller/sub_105/n50 ), .A2(
        \byte_controller/bit_controller/sub_105/n51 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U47  ( .A1(
        \byte_controller/bit_controller/sub_105/n59 ), .A2(
        \byte_controller/bit_controller/sub_105/n60 ), .ZN(
        \byte_controller/bit_controller/N29 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U46  ( .A(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U45  ( .A(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U44  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U43  ( .A1(
        \byte_controller/bit_controller/sub_105/n10 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U42  ( .A1(
        \byte_controller/bit_controller/sub_105/n79 ), .A2(
        \byte_controller/bit_controller/sub_105/n78 ), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U41  ( .A1(
        \byte_controller/bit_controller/sub_105/n77 ), .A2(
        \byte_controller/bit_controller/sub_105/n76 ), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U40  ( .A1(
        \byte_controller/bit_controller/sub_105/n94 ), .A2(
        \byte_controller/bit_controller/sub_105/n95 ), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U39  ( .A1(
        \byte_controller/bit_controller/sub_105/n89 ), .A2(
        \byte_controller/bit_controller/sub_105/n90 ), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U38  ( .A1(
        \byte_controller/bit_controller/sub_105/n88 ), .A2(
        \byte_controller/bit_controller/sub_105/n87 ), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U37  ( .A1(
        \byte_controller/bit_controller/sub_105/n108 ), .A2(
        \byte_controller/bit_controller/sub_105/n109 ), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U36  ( .A1(
        \byte_controller/bit_controller/sub_105/n103 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U35  ( .A1(
        \byte_controller/bit_controller/sub_105/n101 ), .A2(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U34  ( .A1(
        \byte_controller/bit_controller/sub_105/n134 ), .A2(
        \byte_controller/bit_controller/sub_105/n114 ), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U33  ( .A1(
        \byte_controller/bit_controller/sub_105/n33 ), .A2(
        \byte_controller/bit_controller/sub_105/n34 ), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U32  ( .A1(
        \byte_controller/bit_controller/sub_105/n123 ), .A2(
        \byte_controller/bit_controller/sub_105/n124 ), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U31  ( .A1(
        \byte_controller/bit_controller/sub_105/n117 ), .A2(
        \byte_controller/bit_controller/sub_105/n118 ), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U30  ( .A1(
        \byte_controller/bit_controller/sub_105/n115 ), .A2(
        \byte_controller/bit_controller/sub_105/n116 ), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U29  ( .A1(
        \byte_controller/bit_controller/sub_105/n119 ), .A2(
        \byte_controller/bit_controller/sub_105/n36 ), .ZN(
        \byte_controller/bit_controller/sub_105/n129 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U28  ( .A1(
        \byte_controller/bit_controller/sub_105/n131 ), .A2(
        \byte_controller/bit_controller/sub_105/n132 ), .ZN(
        \byte_controller/bit_controller/sub_105/n126 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U27  ( .A1(
        \byte_controller/bit_controller/sub_105/n128 ), .A2(
        \byte_controller/bit_controller/sub_105/n129 ), .ZN(
        \byte_controller/bit_controller/sub_105/n127 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U26  ( .A1(
        \byte_controller/bit_controller/sub_105/n126 ), .A2(
        \byte_controller/bit_controller/sub_105/n127 ), .ZN(
        \byte_controller/bit_controller/sub_105/n20 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U25  ( .A1(
        \byte_controller/bit_controller/sub_105/n134 ), .A2(
        \byte_controller/bit_controller/sub_105/n61 ), .ZN(
        \byte_controller/bit_controller/sub_105/n132 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U24  ( .A1(
        \byte_controller/bit_controller/sub_105/n134 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .A3(
        \byte_controller/bit_controller/sub_105/n47 ), .A4(
        \byte_controller/bit_controller/sub_105/n48 ), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  AND4_X1 \byte_controller/bit_controller/sub_105/U23  ( .A1(
        \byte_controller/bit_controller/sub_105/n84 ), .A2(
        \byte_controller/bit_controller/sub_105/n47 ), .A3(
        \byte_controller/bit_controller/sub_105/n83 ), .A4(
        \byte_controller/bit_controller/sub_105/n134 ), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U22  ( .A(
        \byte_controller/bit_controller/n52 ), .ZN(
        \byte_controller/bit_controller/sub_105/n134 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U21  ( .A(
        \byte_controller/bit_controller/n52 ), .ZN(
        \byte_controller/bit_controller/N28 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U20  ( .A(
        \byte_controller/bit_controller/cnt [6]), .Z(
        \byte_controller/bit_controller/sub_105/n18 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U19  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n16 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U18  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n15 ) );
  BUF_X2 \byte_controller/bit_controller/sub_105/U17  ( .A(
        \byte_controller/bit_controller/n52 ), .Z(
        \byte_controller/bit_controller/sub_105/n14 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U16  ( .A1(
        \byte_controller/bit_controller/sub_105/n30 ), .A2(
        \byte_controller/bit_controller/sub_105/n29 ), .ZN(
        \byte_controller/bit_controller/sub_105/n13 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U15  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n12 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U14  ( .A1(
        \byte_controller/bit_controller/sub_105/n88 ), .A2(
        \byte_controller/bit_controller/sub_105/n87 ), .ZN(
        \byte_controller/bit_controller/sub_105/n11 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U13  ( .A(
        \byte_controller/bit_controller/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n10 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U12  ( .A(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/sub_105/n9 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U11  ( .A1(
        \byte_controller/bit_controller/sub_105/n101 ), .A2(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/sub_105/n8 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U10  ( .A1(
        \byte_controller/bit_controller/sub_105/n61 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n7 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U9  ( .A1(
        \byte_controller/bit_controller/sub_105/n1 ), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U8  ( .A(
        \byte_controller/bit_controller/n55 ), .Z(
        \byte_controller/bit_controller/sub_105/n17 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U7  ( .A(
        \byte_controller/bit_controller/sub_105/n121 ), .ZN(
        \byte_controller/bit_controller/sub_105/n6 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U6  ( .A(
        \byte_controller/bit_controller/n55 ), .Z(
        \byte_controller/bit_controller/sub_105/n5 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U5  ( .A(
        \byte_controller/bit_controller/sub_105/n120 ), .ZN(
        \byte_controller/bit_controller/sub_105/n4 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U4  ( .A(
        \byte_controller/bit_controller/n61 ), .Z(
        \byte_controller/bit_controller/sub_105/n3 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U3  ( .A(
        \byte_controller/bit_controller/sub_105/n45 ), .Z(
        \byte_controller/bit_controller/sub_105/n2 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/sub_105/n1 ) );
endmodule

