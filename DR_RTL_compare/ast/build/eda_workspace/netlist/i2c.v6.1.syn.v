/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 04:26:06 2026
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
  wire   N19, \ctr[7] , sr_1, sr_0, N34, N35, N36, N37, N38, N39, N40, N41,
         done, i2c_al, irxack, N105, N106, N107, N108, N112, n1, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n24, n25, n26, n27, n29, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, \byte_controller/n144 , \byte_controller/n143 ,
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
         \byte_controller/n100 , \byte_controller/n78 , \byte_controller/n77 ,
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
         \byte_controller/n20 , \byte_controller/n19 , \byte_controller/n17 ,
         \byte_controller/n16 , \byte_controller/n14 , \byte_controller/n13 ,
         \byte_controller/n12 , \byte_controller/n11 , \byte_controller/n10 ,
         \byte_controller/n9 , \byte_controller/n8 , \byte_controller/n7 ,
         \byte_controller/n5 , \byte_controller/n4 , \byte_controller/n3 ,
         \byte_controller/n2 , \byte_controller/n1 , \byte_controller/n99 ,
         \byte_controller/n98 , \byte_controller/n97 , \byte_controller/n96 ,
         \byte_controller/n95 , \byte_controller/n94 , \byte_controller/n93 ,
         \byte_controller/n92 , \byte_controller/n91 , \byte_controller/n90 ,
         \byte_controller/n89 , \byte_controller/n88 , \byte_controller/n87 ,
         \byte_controller/n86 , \byte_controller/n85 , \byte_controller/n84 ,
         \byte_controller/n83 , \byte_controller/n82 , \byte_controller/n81 ,
         \byte_controller/n80 , \byte_controller/n79 , \byte_controller/n28 ,
         \byte_controller/n27 , \byte_controller/n18 , \byte_controller/n15 ,
         \byte_controller/n6 , \byte_controller/N107 , \byte_controller/N106 ,
         \byte_controller/N105 , \byte_controller/N104 ,
         \byte_controller/dcnt[1] , \byte_controller/ld ,
         \byte_controller/core_rxd , \byte_controller/core_txd ,
         \byte_controller/core_ack , \byte_controller/bit_controller/n222 ,
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
         \byte_controller/bit_controller/sub_105/n7 ,
         \byte_controller/bit_controller/sub_105/n6 ,
         \byte_controller/bit_controller/sub_105/n5 ,
         \byte_controller/bit_controller/sub_105/n4 ,
         \byte_controller/bit_controller/sub_105/n3 ,
         \byte_controller/bit_controller/sub_105/n2 ,
         \byte_controller/bit_controller/sub_105/n1 ,
         \byte_controller/bit_controller/sub_105/n125 ;
  wire   [15:0] prer;
  wire   [7:0] rxr;
  wire   [7:0] txr;
  wire   [7:5] sr;
  wire   [7:0] cr;
  wire   [4:0] \byte_controller/c_state ;
  wire   [3:0] \byte_controller/core_cmd ;
  wire   [15:0] \byte_controller/bit_controller/cnt ;
  assign scl_pad_o = 1'b0;
  assign sda_pad_o = 1'b0;

  DFF_X1 wb_ack_o_reg ( .D(N19), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \txr_reg[4]  ( .D(n120), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n8) );
  DFFR_X1 \txr_reg[3]  ( .D(n119), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n9) );
  DFFR_X1 \txr_reg[2]  ( .D(n118), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n10) );
  DFFR_X1 \txr_reg[1]  ( .D(n117), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n11) );
  DFFS_X1 \prer_reg[15]  ( .D(n115), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n127) );
  DFFS_X1 \prer_reg[14]  ( .D(n114), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n126) );
  DFFS_X1 \prer_reg[13]  ( .D(n113), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n167) );
  DFFS_X1 \prer_reg[12]  ( .D(n112), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n164) );
  DFFS_X1 \prer_reg[11]  ( .D(n111), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n161) );
  DFFS_X1 \prer_reg[10]  ( .D(n110), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n158) );
  DFFS_X1 \prer_reg[9]  ( .D(n109), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n156) );
  DFFS_X1 \prer_reg[8]  ( .D(n108), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n154) );
  DFFS_X1 \prer_reg[6]  ( .D(n106), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n14) );
  DFFS_X1 \prer_reg[2]  ( .D(n102), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n18) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N40), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N38), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N37), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N36), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFR_X1 al_reg ( .D(N105), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N39), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N106), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N41), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N107), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N35), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFFR_X1 irq_flag_reg ( .D(N108), .CK(wb_clk_i), .RN(arst_i), .Q(sr_0), .QN(
        n29) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N34), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N112), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 \cr_reg[6]  ( .D(n96), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n199) );
  DFFR_X1 \cr_reg[4]  ( .D(n98), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n24) );
  DFFR_X1 \cr_reg[5]  ( .D(n97), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n197) );
  DFFR_X1 \ctr_reg[6]  ( .D(n124), .CK(wb_clk_i), .RN(arst_i), .Q(n175), .QN(
        n4) );
  DFFS_X1 \prer_reg[7]  ( .D(n107), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n13) );
  DFFS_X1 \prer_reg[3]  ( .D(n103), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n17) );
  DFFS_X1 \prer_reg[0]  ( .D(n100), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[1]  ( .D(n101), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[4]  ( .D(n104), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n16) );
  DFFS_X1 \prer_reg[5]  ( .D(n105), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n15) );
  DFFR_X1 \txr_reg[7]  ( .D(n123), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n5) );
  DFFR_X1 \txr_reg[6]  ( .D(n122), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n6) );
  DFFR_X1 \txr_reg[5]  ( .D(n121), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n7) );
  DFFR_X1 \txr_reg[0]  ( .D(n116), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n12) );
  DFFR_X1 \cr_reg[3]  ( .D(n99), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n25) );
  DFFR_X1 \cr_reg[1]  ( .D(n93), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]), .QN(
        n27) );
  DFFR_X1 \cr_reg[0]  ( .D(n92), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n182) );
  DFFR_X1 \cr_reg[7]  ( .D(n95), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n203) );
  DFFR_X1 \ctr_reg[7]  ( .D(n134), .CK(wb_clk_i), .RN(arst_i), .Q(\ctr[7] ) );
  DFFR_X1 \cr_reg[2]  ( .D(n94), .CK(wb_clk_i), .RN(arst_i), .QN(n26) );
  AND3_X1 U114 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[2]), .A3(n180), .ZN(n128) );
  AND3_X1 U115 ( .A1(n177), .A2(n184), .A3(n180), .ZN(n129) );
  AND3_X1 U116 ( .A1(n177), .A2(n136), .A3(n180), .ZN(n130) );
  AND3_X1 U117 ( .A1(wb_adr_i[2]), .A2(n179), .A3(n180), .ZN(n131) );
  AND3_X1 U118 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n132) );
  INV_X1 U119 ( .A(n173), .ZN(n177) );
  NOR2_X1 U120 ( .A1(done), .A2(i2c_al), .ZN(n133) );
  NOR2_X1 U121 ( .A1(n25), .A2(wb_rst_i), .ZN(n143) );
  MUX2_X1 U122 ( .A(n135), .B(\ctr[7] ), .S(n174), .Z(n134) );
  AND2_X1 U123 ( .A1(wb_dat_i[7]), .A2(n177), .ZN(n135) );
  INV_X1 U124 ( .A(wb_rst_i), .ZN(n200) );
  AND2_X1 U125 ( .A1(wb_adr_i[0]), .A2(n141), .ZN(n136) );
  AND2_X1 U126 ( .A1(n142), .A2(n200), .ZN(n174) );
  INV_X1 U128 ( .A(wb_dat_i[0]), .ZN(n178) );
  NAND2_X1 U129 ( .A1(n132), .A2(n200), .ZN(n173) );
  INV_X1 U130 ( .A(wb_adr_i[2]), .ZN(n141) );
  NAND3_X1 U131 ( .A1(wb_adr_i[1]), .A2(n136), .A3(n177), .ZN(n138) );
  NAND2_X1 U132 ( .A1(n138), .A2(n200), .ZN(n139) );
  NAND2_X1 U133 ( .A1(n177), .A2(n139), .ZN(n140) );
  OAI22_X1 U134 ( .A1(n178), .A2(n140), .B1(n12), .B2(n139), .ZN(n116) );
  INV_X1 U135 ( .A(wb_dat_i[1]), .ZN(n183) );
  OAI22_X1 U136 ( .A1(n183), .A2(n140), .B1(n11), .B2(n139), .ZN(n117) );
  INV_X1 U137 ( .A(wb_dat_i[2]), .ZN(n188) );
  OAI22_X1 U138 ( .A1(n188), .A2(n140), .B1(n10), .B2(n139), .ZN(n118) );
  INV_X1 U139 ( .A(wb_dat_i[3]), .ZN(n160) );
  OAI22_X1 U140 ( .A1(n140), .A2(n160), .B1(n9), .B2(n139), .ZN(n119) );
  INV_X1 U141 ( .A(wb_dat_i[4]), .ZN(n163) );
  OAI22_X1 U142 ( .A1(n163), .A2(n140), .B1(n8), .B2(n139), .ZN(n120) );
  INV_X1 U143 ( .A(wb_dat_i[5]), .ZN(n166) );
  OAI22_X1 U144 ( .A1(n166), .A2(n140), .B1(n7), .B2(n139), .ZN(n121) );
  INV_X1 U145 ( .A(wb_dat_i[6]), .ZN(n172) );
  OAI22_X1 U146 ( .A1(n172), .A2(n140), .B1(n6), .B2(n139), .ZN(n122) );
  INV_X1 U147 ( .A(wb_dat_i[7]), .ZN(n170) );
  OAI22_X1 U148 ( .A1(n170), .A2(n140), .B1(n5), .B2(n139), .ZN(n123) );
  INV_X1 U149 ( .A(wb_adr_i[0]), .ZN(n179) );
  NAND2_X1 U150 ( .A1(n141), .A2(n179), .ZN(n202) );
  INV_X1 U151 ( .A(n202), .ZN(n184) );
  NAND3_X1 U152 ( .A1(wb_adr_i[1]), .A2(n184), .A3(n177), .ZN(n142) );
  INV_X1 U153 ( .A(wb_adr_i[1]), .ZN(n180) );
  NAND3_X1 U154 ( .A1(\ctr[7] ), .A2(n131), .A3(n177), .ZN(n189) );
  MUX2_X1 U155 ( .A(wb_dat_i[3]), .B(n143), .S(n189), .Z(n99) );
  OAI211_X1 U156 ( .C1(n132), .C2(n133), .A(n189), .B(n200), .ZN(n144) );
  NAND2_X1 U157 ( .A1(n177), .A2(n144), .ZN(n145) );
  OAI22_X1 U158 ( .A1(n145), .A2(n163), .B1(n24), .B2(n144), .ZN(n98) );
  OAI22_X1 U159 ( .A1(n145), .A2(n166), .B1(n197), .B2(n144), .ZN(n97) );
  OAI22_X1 U160 ( .A1(n172), .A2(n145), .B1(n199), .B2(n144), .ZN(n96) );
  OAI22_X1 U161 ( .A1(n145), .A2(n170), .B1(n203), .B2(n144), .ZN(n95) );
  MUX2_X1 U162 ( .A(n20), .B(n178), .S(n129), .Z(n146) );
  NAND2_X1 U163 ( .A1(n200), .A2(n146), .ZN(n100) );
  MUX2_X1 U164 ( .A(n19), .B(n183), .S(n129), .Z(n147) );
  NAND2_X1 U165 ( .A1(n200), .A2(n147), .ZN(n101) );
  MUX2_X1 U166 ( .A(n18), .B(n188), .S(n129), .Z(n148) );
  NAND2_X1 U167 ( .A1(n200), .A2(n148), .ZN(n102) );
  MUX2_X1 U168 ( .A(n17), .B(n160), .S(n129), .Z(n149) );
  NAND2_X1 U169 ( .A1(n200), .A2(n149), .ZN(n103) );
  MUX2_X1 U170 ( .A(n16), .B(n163), .S(n129), .Z(n150) );
  NAND2_X1 U171 ( .A1(n200), .A2(n150), .ZN(n104) );
  MUX2_X1 U172 ( .A(n15), .B(n166), .S(n129), .Z(n151) );
  NAND2_X1 U173 ( .A1(n200), .A2(n151), .ZN(n105) );
  MUX2_X1 U174 ( .A(n14), .B(n172), .S(n129), .Z(n152) );
  NAND2_X1 U175 ( .A1(n200), .A2(n152), .ZN(n106) );
  MUX2_X1 U176 ( .A(n13), .B(n170), .S(n129), .Z(n153) );
  NAND2_X1 U177 ( .A1(n200), .A2(n153), .ZN(n107) );
  MUX2_X1 U178 ( .A(n154), .B(n178), .S(n130), .Z(n155) );
  NAND2_X1 U179 ( .A1(n200), .A2(n155), .ZN(n108) );
  MUX2_X1 U180 ( .A(n156), .B(n183), .S(n130), .Z(n157) );
  NAND2_X1 U181 ( .A1(n200), .A2(n157), .ZN(n109) );
  MUX2_X1 U182 ( .A(n158), .B(n188), .S(n130), .Z(n159) );
  NAND2_X1 U183 ( .A1(n200), .A2(n159), .ZN(n110) );
  MUX2_X1 U184 ( .A(n161), .B(n160), .S(n130), .Z(n162) );
  NAND2_X1 U185 ( .A1(n200), .A2(n162), .ZN(n111) );
  MUX2_X1 U186 ( .A(n164), .B(n163), .S(n130), .Z(n165) );
  NAND2_X1 U187 ( .A1(n200), .A2(n165), .ZN(n112) );
  MUX2_X1 U188 ( .A(n167), .B(n166), .S(n130), .Z(n168) );
  NAND2_X1 U189 ( .A1(n200), .A2(n168), .ZN(n113) );
  MUX2_X1 U190 ( .A(n126), .B(n172), .S(n130), .Z(n169) );
  NAND2_X1 U191 ( .A1(n200), .A2(n169), .ZN(n114) );
  MUX2_X1 U192 ( .A(n127), .B(n170), .S(n130), .Z(n171) );
  NAND2_X1 U193 ( .A1(n200), .A2(n171), .ZN(n115) );
  NOR2_X1 U194 ( .A1(n173), .A2(n172), .ZN(n176) );
  MUX2_X1 U195 ( .A(n176), .B(n175), .S(n174), .Z(n124) );
  NAND2_X1 U196 ( .A1(n177), .A2(n189), .ZN(n190) );
  OAI22_X1 U197 ( .A1(n182), .A2(n190), .B1(n189), .B2(n178), .ZN(n92) );
  AOI211_X1 U198 ( .C1(n29), .C2(n133), .A(cr[0]), .B(wb_rst_i), .ZN(N108) );
  NOR3_X1 U199 ( .A1(n29), .A2(n4), .A3(wb_rst_i), .ZN(N112) );
  AND3_X1 U200 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N19) );
  NAND3_X1 U201 ( .A1(wb_adr_i[1]), .A2(wb_adr_i[2]), .A3(n179), .ZN(n204) );
  AOI222_X1 U202 ( .A1(sr_0), .A2(n131), .B1(txr[0]), .B2(n128), .C1(rxr[0]), 
        .C2(n136), .ZN(n181) );
  OAI221_X1 U203 ( .B1(n204), .B2(n182), .C1(n20), .C2(n202), .A(n181), .ZN(
        N34) );
  AOI21_X1 U204 ( .B1(n197), .B2(n24), .A(wb_rst_i), .ZN(N107) );
  OAI22_X1 U205 ( .A1(n27), .A2(n190), .B1(n189), .B2(n183), .ZN(n93) );
  AOI222_X1 U206 ( .A1(sr_1), .A2(n131), .B1(txr[1]), .B2(n128), .C1(rxr[1]), 
        .C2(n136), .ZN(n187) );
  INV_X1 U207 ( .A(n204), .ZN(n185) );
  AOI22_X1 U208 ( .A1(cr[1]), .A2(n185), .B1(n184), .B2(prer[1]), .ZN(n186) );
  NAND2_X1 U209 ( .A1(n187), .A2(n186), .ZN(N35) );
  OAI22_X1 U210 ( .A1(n26), .A2(n190), .B1(n189), .B2(n188), .ZN(n94) );
  AOI22_X1 U211 ( .A1(txr[2]), .A2(n128), .B1(rxr[2]), .B2(n136), .ZN(n191) );
  OAI221_X1 U212 ( .B1(n26), .B2(n204), .C1(n18), .C2(n202), .A(n191), .ZN(N36) );
  AOI22_X1 U213 ( .A1(txr[3]), .A2(n128), .B1(rxr[3]), .B2(n136), .ZN(n192) );
  OAI221_X1 U214 ( .B1(n25), .B2(n204), .C1(n17), .C2(n202), .A(n192), .ZN(N37) );
  AOI22_X1 U215 ( .A1(txr[4]), .A2(n128), .B1(rxr[4]), .B2(n136), .ZN(n193) );
  OAI221_X1 U216 ( .B1(n24), .B2(n204), .C1(n16), .C2(n202), .A(n193), .ZN(N38) );
  NAND2_X1 U217 ( .A1(n203), .A2(sr[5]), .ZN(n195) );
  INV_X1 U218 ( .A(i2c_al), .ZN(n194) );
  AOI21_X1 U219 ( .B1(n195), .B2(n194), .A(wb_rst_i), .ZN(N105) );
  AOI222_X1 U220 ( .A1(sr[5]), .A2(n131), .B1(txr[5]), .B2(n128), .C1(rxr[5]), 
        .C2(n136), .ZN(n196) );
  OAI221_X1 U221 ( .B1(n204), .B2(n197), .C1(n15), .C2(n202), .A(n196), .ZN(
        N39) );
  AOI222_X1 U222 ( .A1(sr[6]), .A2(n131), .B1(txr[6]), .B2(n128), .C1(rxr[6]), 
        .C2(n136), .ZN(n198) );
  OAI221_X1 U223 ( .B1(n204), .B2(n199), .C1(n14), .C2(n202), .A(n198), .ZN(
        N40) );
  AND2_X1 U224 ( .A1(irxack), .A2(n200), .ZN(N106) );
  AOI222_X1 U225 ( .A1(sr[7]), .A2(n131), .B1(txr[7]), .B2(n128), .C1(rxr[7]), 
        .C2(n136), .ZN(n201) );
  OAI221_X1 U226 ( .B1(n204), .B2(n203), .C1(n13), .C2(n202), .A(n201), .ZN(
        N41) );
  NOR2_X1 \byte_controller/U126  ( .A1(\byte_controller/n144 ), .A2(
        \byte_controller/n143 ), .ZN(\byte_controller/n79 ) );
  NAND3_X1 \byte_controller/U125  ( .A1(\byte_controller/n135 ), .A2(
        \byte_controller/n13 ), .A3(\byte_controller/n32 ), .ZN(
        \byte_controller/n136 ) );
  NAND3_X1 \byte_controller/U124  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/core_cmd [3]), .ZN(
        \byte_controller/n138 ) );
  NAND3_X1 \byte_controller/U123  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/n130 ) );
  OAI21_X1 \byte_controller/U122  ( .B1(\byte_controller/n127 ), .B2(
        \byte_controller/n28 ), .A(\byte_controller/n126 ), .ZN(
        \byte_controller/n82 ) );
  OAI21_X1 \byte_controller/U121  ( .B1(\byte_controller/n127 ), .B2(
        \byte_controller/n125 ), .A(\byte_controller/n124 ), .ZN(
        \byte_controller/n83 ) );
  AOI21_X1 \byte_controller/U120  ( .B1(\byte_controller/n123 ), .B2(
        \byte_controller/n140 ), .A(\byte_controller/n143 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U119  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n140 ) );
  AOI22_X1 \byte_controller/U118  ( .A1(cr[3]), .A2(\byte_controller/n122 ), 
        .B1(\byte_controller/n121 ), .B2(rxr[7]), .ZN(\byte_controller/n123 )
         );
  NAND3_X1 \byte_controller/U117  ( .A1(\byte_controller/n19 ), .A2(
        \byte_controller/n10 ), .A3(\byte_controller/n118 ), .ZN(
        \byte_controller/n121 ) );
  AOI221_X1 \byte_controller/U116  ( .B1(\byte_controller/n117 ), .B2(
        \byte_controller/n116 ), .C1(\byte_controller/n13 ), .C2(
        \byte_controller/n115 ), .A(\byte_controller/n8 ), .ZN(
        \byte_controller/n118 ) );
  OAI21_X1 \byte_controller/U115  ( .B1(\byte_controller/n116 ), .B2(
        \byte_controller/n115 ), .A(\byte_controller/n117 ), .ZN(
        \byte_controller/n122 ) );
  OAI221_X1 \byte_controller/U114  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n2 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n112 ), .A(\byte_controller/n111 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U113  ( .A1(txr[7]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n111 ) );
  OAI221_X1 \byte_controller/U112  ( .B1(\byte_controller/n112 ), .B2(
        \byte_controller/n3 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n109 ), .A(\byte_controller/n108 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U111  ( .A1(txr[6]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n108 ) );
  OAI221_X1 \byte_controller/U110  ( .B1(\byte_controller/n109 ), .B2(
        \byte_controller/n2 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n107 ), .A(\byte_controller/n106 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U109  ( .A1(txr[5]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n106 ) );
  OAI221_X1 \byte_controller/U108  ( .B1(\byte_controller/n107 ), .B2(
        \byte_controller/n3 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n105 ), .A(\byte_controller/n104 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U107  ( .A1(txr[4]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n104 ) );
  OAI221_X1 \byte_controller/U106  ( .B1(\byte_controller/n105 ), .B2(
        \byte_controller/n2 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n103 ), .A(\byte_controller/n102 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U105  ( .A1(txr[3]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n102 ) );
  OAI221_X1 \byte_controller/U104  ( .B1(\byte_controller/n103 ), .B2(
        \byte_controller/n1 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n101 ), .A(\byte_controller/n100 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U103  ( .A1(txr[2]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n100 ) );
  OAI221_X1 \byte_controller/U102  ( .B1(\byte_controller/n101 ), .B2(
        \byte_controller/n1 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n78 ), .A(\byte_controller/n77 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U101  ( .A1(txr[1]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n77 ) );
  OAI221_X1 \byte_controller/U100  ( .B1(\byte_controller/n78 ), .B2(
        \byte_controller/n1 ), .C1(\byte_controller/n113 ), .C2(
        \byte_controller/n141 ), .A(\byte_controller/n76 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U99  ( .A1(txr[0]), .A2(\byte_controller/n110 ), 
        .ZN(\byte_controller/n76 ) );
  INV_X1 \byte_controller/U98  ( .A(\byte_controller/n75 ), .ZN(
        \byte_controller/n110 ) );
  INV_X1 \byte_controller/U97  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n141 ) );
  NAND3_X1 \byte_controller/U96  ( .A1(\byte_controller/n113 ), .A2(
        \byte_controller/n74 ), .A3(\byte_controller/n75 ), .ZN(
        \byte_controller/n114 ) );
  NAND3_X1 \byte_controller/U95  ( .A1(\byte_controller/n133 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/n73 ), .ZN(
        \byte_controller/n84 ) );
  NAND3_X1 \byte_controller/U94  ( .A1(\byte_controller/n5 ), .A2(
        \byte_controller/c_state [3]), .A3(\byte_controller/n115 ), .ZN(
        \byte_controller/n73 ) );
  INV_X1 \byte_controller/U93  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n115 ) );
  NAND4_X1 \byte_controller/U92  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n72 ), .A3(\byte_controller/n5 ), .A4(
        \byte_controller/c_state [2]), .ZN(\byte_controller/n139 ) );
  NAND3_X1 \byte_controller/U91  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n13 ), .A3(\byte_controller/n72 ), .ZN(
        \byte_controller/n133 ) );
  NAND2_X1 \byte_controller/U90  ( .A1(\byte_controller/n70 ), .A2(
        \byte_controller/n137 ), .ZN(\byte_controller/n86 ) );
  NAND3_X1 \byte_controller/U89  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n13 ), .A3(\byte_controller/n5 ), .ZN(
        \byte_controller/n70 ) );
  NAND2_X1 \byte_controller/U88  ( .A1(\byte_controller/n68 ), .A2(
        \byte_controller/n25 ), .ZN(\byte_controller/n137 ) );
  OAI221_X1 \byte_controller/U87  ( .B1(\byte_controller/n67 ), .B2(
        \byte_controller/n113 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n66 ), .A(\byte_controller/n75 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U86  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n65 ), .A(\byte_controller/n72 ), .ZN(
        \byte_controller/n67 ) );
  OAI211_X1 \byte_controller/U85  ( .C1(\byte_controller/n62 ), .C2(
        \byte_controller/n66 ), .A(\byte_controller/n64 ), .B(
        \byte_controller/n75 ), .ZN(\byte_controller/n90 ) );
  NAND3_X1 \byte_controller/U84  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n62 ), .ZN(
        \byte_controller/n64 ) );
  OAI21_X1 \byte_controller/U83  ( .B1(\byte_controller/n61 ), .B2(
        \byte_controller/n113 ), .A(\byte_controller/n74 ), .ZN(
        \byte_controller/n66 ) );
  NAND2_X1 \byte_controller/U82  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n60 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U81  ( .A(\byte_controller/n59 ), .B(
        \byte_controller/n61 ), .S(\byte_controller/n63 ), .Z(
        \byte_controller/n60 ) );
  INV_X1 \byte_controller/U80  ( .A(\byte_controller/n113 ), .ZN(
        \byte_controller/n63 ) );
  NAND2_X1 \byte_controller/U79  ( .A1(\byte_controller/n74 ), .A2(
        \byte_controller/n61 ), .ZN(\byte_controller/n59 ) );
  NAND2_X1 \byte_controller/U78  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n74 ), .ZN(\byte_controller/n75 ) );
  AOI21_X1 \byte_controller/U77  ( .B1(\byte_controller/n128 ), .B2(
        \byte_controller/n116 ), .A(\byte_controller/n58 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U76  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n135 ), .ZN(\byte_controller/n128 ) );
  OAI21_X1 \byte_controller/U75  ( .B1(\byte_controller/n35 ), .B2(
        \byte_controller/n58 ), .A(\byte_controller/n57 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U74  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n5 ), .A3(\byte_controller/n14 ), .A4(
        \byte_controller/n55 ), .ZN(\byte_controller/n57 ) );
  OAI21_X1 \byte_controller/U73  ( .B1(\byte_controller/n127 ), .B2(
        \byte_controller/n19 ), .A(\byte_controller/n126 ), .ZN(
        \byte_controller/n91 ) );
  NAND2_X1 \byte_controller/U72  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n54 ), .ZN(\byte_controller/n126 ) );
  OAI21_X1 \byte_controller/U71  ( .B1(\byte_controller/n53 ), .B2(
        \byte_controller/n117 ), .A(\byte_controller/n52 ), .ZN(
        \byte_controller/n54 ) );
  NAND4_X1 \byte_controller/U70  ( .A1(\byte_controller/n31 ), .A2(
        \byte_controller/n51 ), .A3(\byte_controller/n9 ), .A4(
        \byte_controller/n49 ), .ZN(\byte_controller/n52 ) );
  INV_X1 \byte_controller/U69  ( .A(cr[7]), .ZN(\byte_controller/n49 ) );
  NAND2_X1 \byte_controller/U68  ( .A1(\byte_controller/n48 ), .A2(
        \byte_controller/n131 ), .ZN(\byte_controller/n85 ) );
  NAND3_X1 \byte_controller/U67  ( .A1(\byte_controller/n69 ), .A2(
        \byte_controller/c_state [2]), .A3(\byte_controller/n5 ), .ZN(
        \byte_controller/n48 ) );
  INV_X1 \byte_controller/U66  ( .A(\byte_controller/n135 ), .ZN(
        \byte_controller/n72 ) );
  NAND3_X1 \byte_controller/U65  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n135 ) );
  OAI211_X1 \byte_controller/U64  ( .C1(\byte_controller/n8 ), .C2(
        \byte_controller/n23 ), .A(\byte_controller/n68 ), .B(
        \byte_controller/n9 ), .ZN(\byte_controller/n131 ) );
  INV_X1 \byte_controller/U63  ( .A(\byte_controller/n47 ), .ZN(
        \byte_controller/n68 ) );
  OAI211_X1 \byte_controller/U62  ( .C1(\byte_controller/n8 ), .C2(
        \byte_controller/n46 ), .A(\byte_controller/n71 ), .B(
        \byte_controller/n5 ), .ZN(\byte_controller/n47 ) );
  NOR3_X1 \byte_controller/U61  ( .A1(\byte_controller/n45 ), .A2(
        \byte_controller/c_state [1]), .A3(cr[7]), .ZN(\byte_controller/n46 )
         );
  OAI21_X1 \byte_controller/U60  ( .B1(\byte_controller/n127 ), .B2(
        \byte_controller/n35 ), .A(\byte_controller/n124 ), .ZN(
        \byte_controller/n87 ) );
  NAND3_X1 \byte_controller/U59  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n31 ), .A3(cr[7]), .ZN(\byte_controller/n124 ) );
  NAND3_X1 \byte_controller/U58  ( .A1(\byte_controller/n53 ), .A2(
        \byte_controller/n50 ), .A3(\byte_controller/n51 ), .ZN(
        \byte_controller/n56 ) );
  INV_X1 \byte_controller/U57  ( .A(cr[4]), .ZN(\byte_controller/n51 ) );
  INV_X1 \byte_controller/U56  ( .A(cr[5]), .ZN(\byte_controller/n50 ) );
  NAND2_X1 \byte_controller/U55  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n5 ), .ZN(\byte_controller/n127 ) );
  OAI21_X1 \byte_controller/U54  ( .B1(\byte_controller/core_ack ), .B2(
        \byte_controller/n31 ), .A(\byte_controller/n37 ), .ZN(
        \byte_controller/n134 ) );
  OAI211_X1 \byte_controller/U53  ( .C1(done), .C2(\byte_controller/n53 ), .A(
        \byte_controller/n30 ), .B(\byte_controller/n36 ), .ZN(
        \byte_controller/n37 ) );
  OAI21_X1 \byte_controller/U52  ( .B1(\byte_controller/n25 ), .B2(
        \byte_controller/n23 ), .A(\byte_controller/n55 ), .ZN(
        \byte_controller/n36 ) );
  NAND3_X1 \byte_controller/U51  ( .A1(\byte_controller/n117 ), .A2(
        \byte_controller/n119 ), .A3(\byte_controller/n120 ), .ZN(
        \byte_controller/n45 ) );
  AOI21_X1 \byte_controller/U50  ( .B1(\byte_controller/n34 ), .B2(
        \byte_controller/n19 ), .A(\byte_controller/n58 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U49  ( .A1(\byte_controller/n5 ), .A2(
        \byte_controller/n4 ), .ZN(\byte_controller/n58 ) );
  NAND2_X1 \byte_controller/U48  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n74 ), .ZN(\byte_controller/n143 ) );
  INV_X1 \byte_controller/U47  ( .A(wb_rst_i), .ZN(\byte_controller/n74 ) );
  INV_X1 \byte_controller/U46  ( .A(i2c_al), .ZN(\byte_controller/n33 ) );
  NAND2_X1 \byte_controller/U45  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n53 ), .ZN(\byte_controller/n34 ) );
  INV_X1 \byte_controller/U44  ( .A(cr[6]), .ZN(\byte_controller/n53 ) );
  NAND4_X1 \byte_controller/U43  ( .A1(\byte_controller/n131 ), .A2(
        \byte_controller/n132 ), .A3(\byte_controller/n133 ), .A4(
        \byte_controller/n130 ), .ZN(\byte_controller/n81 ) );
  NAND2_X1 \byte_controller/U42  ( .A1(\byte_controller/n117 ), .A2(
        \byte_controller/n11 ), .ZN(\byte_controller/n42 ) );
  NAND4_X1 \byte_controller/U41  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n56 ), .A3(\byte_controller/n117 ), .A4(
        \byte_controller/n38 ), .ZN(\byte_controller/n44 ) );
  AND2_X2 \byte_controller/U40  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n5 ), .ZN(\byte_controller/n32 ) );
  OR2_X1 \byte_controller/U39  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n135 ), .ZN(\byte_controller/n69 ) );
  AND3_X1 \byte_controller/U38  ( .A1(\byte_controller/n21 ), .A2(
        \byte_controller/n35 ), .A3(\byte_controller/n116 ), .ZN(
        \byte_controller/n31 ) );
  AND3_X1 \byte_controller/U37  ( .A1(\byte_controller/n21 ), .A2(
        \byte_controller/n35 ), .A3(\byte_controller/n116 ), .ZN(
        \byte_controller/n30 ) );
  NAND2_X1 \byte_controller/U36  ( .A1(\byte_controller/n44 ), .A2(
        \byte_controller/n43 ), .ZN(\byte_controller/n71 ) );
  OAI21_X1 \byte_controller/U35  ( .B1(\byte_controller/n42 ), .B2(
        \byte_controller/n41 ), .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n43 ) );
  NAND2_X1 \byte_controller/U34  ( .A1(\byte_controller/n16 ), .A2(
        \byte_controller/n20 ), .ZN(\byte_controller/n29 ) );
  BUF_X2 \byte_controller/U33  ( .A(arst_i), .Z(\byte_controller/n26 ) );
  MUX2_X1 \byte_controller/U32  ( .A(\byte_controller/n141 ), .B(
        \byte_controller/n142 ), .S(\byte_controller/n140 ), .Z(
        \byte_controller/n144 ) );
  NOR2_X1 \byte_controller/U31  ( .A1(\byte_controller/c_state [0]), .A2(
        \byte_controller/c_state [1]), .ZN(\byte_controller/n38 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/n128 ), .ZN(
        \byte_controller/n129 ) );
  NAND2_X1 \byte_controller/U29  ( .A1(\byte_controller/n129 ), .A2(
        \byte_controller/n32 ), .ZN(\byte_controller/n132 ) );
  INV_X1 \byte_controller/U28  ( .A(\byte_controller/c_state [1]), .ZN(
        \byte_controller/n40 ) );
  NAND4_X1 \byte_controller/U27  ( .A1(\byte_controller/n137 ), .A2(
        \byte_controller/n136 ), .A3(\byte_controller/n139 ), .A4(
        \byte_controller/n138 ), .ZN(\byte_controller/n80 ) );
  CLKBUF_X1 \byte_controller/U26  ( .A(cr[5]), .Z(\byte_controller/n25 ) );
  OAI21_X1 \byte_controller/U25  ( .B1(\byte_controller/n4 ), .B2(
        \byte_controller/n31 ), .A(\byte_controller/n37 ), .ZN(
        \byte_controller/n24 ) );
  CLKBUF_X1 \byte_controller/U24  ( .A(cr[4]), .Z(\byte_controller/n23 ) );
  OR2_X1 \byte_controller/U23  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n135 ), .ZN(\byte_controller/n22 ) );
  AND3_X1 \byte_controller/U22  ( .A1(\byte_controller/n117 ), .A2(
        \byte_controller/n119 ), .A3(\byte_controller/n120 ), .ZN(
        \byte_controller/n21 ) );
  OAI21_X1 \byte_controller/U21  ( .B1(\byte_controller/n42 ), .B2(
        \byte_controller/n41 ), .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n20 ) );
  INV_X1 \byte_controller/U20  ( .A(\byte_controller/n17 ), .ZN(
        \byte_controller/n19 ) );
  NAND4_X1 \byte_controller/U19  ( .A1(\byte_controller/n12 ), .A2(
        \byte_controller/n117 ), .A3(\byte_controller/n39 ), .A4(
        \byte_controller/n38 ), .ZN(\byte_controller/n16 ) );
  CLKBUF_X1 \byte_controller/U18  ( .A(\byte_controller/n12 ), .Z(
        \byte_controller/n14 ) );
  OR2_X1 \byte_controller/U17  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/c_state [0]), .ZN(\byte_controller/n41 ) );
  INV_X1 \byte_controller/U16  ( .A(\byte_controller/n40 ), .ZN(
        \byte_controller/n13 ) );
  NAND3_X1 \byte_controller/U15  ( .A1(\byte_controller/n53 ), .A2(
        \byte_controller/n50 ), .A3(\byte_controller/n51 ), .ZN(
        \byte_controller/n12 ) );
  AND2_X1 \byte_controller/U14  ( .A1(\byte_controller/n119 ), .A2(
        \byte_controller/n120 ), .ZN(\byte_controller/n11 ) );
  INV_X1 \byte_controller/U13  ( .A(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n10 ) );
  CLKBUF_X1 \byte_controller/U12  ( .A(\byte_controller/n50 ), .Z(
        \byte_controller/n9 ) );
  CLKBUF_X1 \byte_controller/U11  ( .A(\byte_controller/c_state [0]), .Z(
        \byte_controller/n8 ) );
  AND2_X1 \byte_controller/U10  ( .A1(\byte_controller/n119 ), .A2(
        \byte_controller/n55 ), .ZN(\byte_controller/n7 ) );
  AND2_X1 \byte_controller/U9  ( .A1(\byte_controller/n7 ), .A2(
        \byte_controller/n120 ), .ZN(\byte_controller/n39 ) );
  AND2_X2 \byte_controller/U8  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n74 ), .ZN(\byte_controller/n5 ) );
  CLKBUF_X1 \byte_controller/U7  ( .A(\byte_controller/core_ack ), .Z(
        \byte_controller/n4 ) );
  BUF_X1 \byte_controller/U6  ( .A(\byte_controller/n114 ), .Z(
        \byte_controller/n3 ) );
  BUF_X1 \byte_controller/U5  ( .A(\byte_controller/n114 ), .Z(
        \byte_controller/n2 ) );
  BUF_X1 \byte_controller/U4  ( .A(\byte_controller/n114 ), .Z(
        \byte_controller/n1 ) );
  OR3_X4 \byte_controller/U3  ( .A1(\byte_controller/n27 ), .A2(wb_rst_i), 
        .A3(\byte_controller/ld ), .ZN(\byte_controller/n113 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/n17 ), .QN(
        \byte_controller/n120 ) );
  DFFR_X2 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n117 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/n61 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .QN(\byte_controller/n27 ) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/n65 ), .QN(
        \byte_controller/n15 ) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(done), .QN(
        \byte_controller/n55 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n26 ), .Q(\byte_controller/ld ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n142 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(
        \byte_controller/core_cmd [0]), .QN(\byte_controller/n125 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[0]), .QN(
        \byte_controller/n78 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[1]), .QN(
        \byte_controller/n101 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[2]), .QN(
        \byte_controller/n103 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[3]), .QN(
        \byte_controller/n105 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[4]), .QN(
        \byte_controller/n107 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[5]), .QN(
        \byte_controller/n109 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[6]), .QN(
        \byte_controller/n112 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n90 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n62 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n116 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [2]), .QN(
        \byte_controller/n119 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(\byte_controller/c_state [0]), .QN(\byte_controller/n35 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n26 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n28 ) );
  NOR3_X1 \byte_controller/bit_controller/U172  ( .A1(
        \byte_controller/bit_controller/n87 ), .A2(
        \byte_controller/bit_controller/n57 ), .A3(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/N154 ) );
  AOI211_X1 \byte_controller/bit_controller/U171  ( .C1(
        \byte_controller/bit_controller/n81 ), .C2(
        \byte_controller/bit_controller/n80 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N75 ) );
  NOR3_X1 \byte_controller/bit_controller/U170  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  MUX2_X1 \byte_controller/bit_controller/U169  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n208 ), .S(
        \byte_controller/bit_controller/n207 ), .Z(
        \byte_controller/bit_controller/n158 ) );
  AOI21_X1 \byte_controller/bit_controller/U168  ( .B1(
        \byte_controller/bit_controller/n45 ), .B2(
        \byte_controller/bit_controller/n206 ), .A(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  NAND4_X1 \byte_controller/bit_controller/U167  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n124 ), .A3(
        \byte_controller/bit_controller/n11 ), .A4(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  AOI211_X1 \byte_controller/bit_controller/U166  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n203 ), .A(\byte_controller/bit_controller/n210 ), .B(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  NAND4_X1 \byte_controller/bit_controller/U165  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n111 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  NAND4_X1 \byte_controller/bit_controller/U164  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(
        \byte_controller/bit_controller/n199 ), .A3(
        \byte_controller/bit_controller/n198 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n200 ) );
  OAI22_X1 \byte_controller/bit_controller/U163  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n48 ), .B2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U162  ( .A1(
        \byte_controller/bit_controller/n109 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n108 ), .B2(
        \byte_controller/bit_controller/n62 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U161  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  OAI21_X1 \byte_controller/bit_controller/U160  ( .B1(
        \byte_controller/bit_controller/n111 ), .B2(
        \byte_controller/bit_controller/n6 ), .A(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  NAND4_X1 \byte_controller/bit_controller/U159  ( .A1(
        \byte_controller/bit_controller/n55 ), .A2(
        \byte_controller/bit_controller/n195 ), .A3(
        \byte_controller/bit_controller/n198 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U158  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n198 ) );
  AOI21_X1 \byte_controller/bit_controller/U157  ( .B1(
        \byte_controller/bit_controller/n193 ), .B2(
        \byte_controller/bit_controller/n192 ), .A(
        \byte_controller/bit_controller/n34 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  INV_X1 \byte_controller/bit_controller/U156  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n212 ) );
  AOI222_X1 \byte_controller/bit_controller/U155  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n56 ), .ZN(
        \byte_controller/bit_controller/n191 ) );
  INV_X1 \byte_controller/bit_controller/U154  ( .A(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  AOI222_X1 \byte_controller/bit_controller/U153  ( .A1(prer[0]), .A2(
        \byte_controller/bit_controller/n24 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [0]), .C1(
        \byte_controller/bit_controller/n63 ), .C2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/n189 ) );
  INV_X1 \byte_controller/bit_controller/U152  ( .A(
        \byte_controller/bit_controller/n188 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  AOI222_X1 \byte_controller/bit_controller/U151  ( .A1(prer[1]), .A2(
        \byte_controller/bit_controller/n24 ), .B1(
        \byte_controller/bit_controller/n53 ), .B2(
        \byte_controller/bit_controller/cnt [1]), .C1(
        \byte_controller/bit_controller/n63 ), .C2(
        \byte_controller/bit_controller/N29 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  INV_X1 \byte_controller/bit_controller/U150  ( .A(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n219 ) );
  AOI222_X1 \byte_controller/bit_controller/U149  ( .A1(prer[2]), .A2(
        \byte_controller/bit_controller/n24 ), .B1(
        \byte_controller/bit_controller/n53 ), .B2(
        \byte_controller/bit_controller/cnt [2]), .C1(
        \byte_controller/bit_controller/n63 ), .C2(
        \byte_controller/bit_controller/N30 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  INV_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/n218 ) );
  AOI222_X1 \byte_controller/bit_controller/U147  ( .A1(prer[3]), .A2(
        \byte_controller/bit_controller/n1 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [3]), .C1(
        \byte_controller/bit_controller/n63 ), .C2(
        \byte_controller/bit_controller/N31 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  INV_X1 \byte_controller/bit_controller/U146  ( .A(
        \byte_controller/bit_controller/n185 ), .ZN(
        \byte_controller/bit_controller/n214 ) );
  AOI222_X1 \byte_controller/bit_controller/U145  ( .A1(
        \byte_controller/bit_controller/N33 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(
        \byte_controller/bit_controller/n1 ), .B2(prer[5]), .C1(
        \byte_controller/bit_controller/n53 ), .C2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/n185 ) );
  INV_X1 \byte_controller/bit_controller/U144  ( .A(
        \byte_controller/bit_controller/n184 ), .ZN(
        \byte_controller/bit_controller/n217 ) );
  AOI222_X1 \byte_controller/bit_controller/U143  ( .A1(prer[7]), .A2(
        \byte_controller/bit_controller/n24 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [7]), .C1(
        \byte_controller/bit_controller/n63 ), .C2(
        \byte_controller/bit_controller/N35 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  OAI21_X1 \byte_controller/bit_controller/U142  ( .B1(
        \byte_controller/bit_controller/n3 ), .B2(
        \byte_controller/bit_controller/n95 ), .A(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n211 ) );
  AOI22_X1 \byte_controller/bit_controller/U141  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/N36 ), .B1(prer[8]), .B2(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  INV_X1 \byte_controller/bit_controller/U140  ( .A(
        \byte_controller/bit_controller/n181 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  AOI222_X1 \byte_controller/bit_controller/U139  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(
        \byte_controller/bit_controller/n50 ), .B2(prer[9]), .C1(
        \byte_controller/bit_controller/n53 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n181 ) );
  INV_X1 \byte_controller/bit_controller/U138  ( .A(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AOI222_X1 \byte_controller/bit_controller/U137  ( .A1(
        \byte_controller/bit_controller/N38 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(prer[10]), .B2(
        \byte_controller/bit_controller/n50 ), .C1(
        \byte_controller/bit_controller/n53 ), .C2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/n180 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n215 ) );
  AOI222_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(prer[11]), .B2(
        \byte_controller/bit_controller/n56 ), .C1(
        \byte_controller/bit_controller/n190 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n179 ) );
  INV_X1 \byte_controller/bit_controller/U134  ( .A(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n128 ) );
  AOI222_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(
        \byte_controller/bit_controller/n1 ), .B2(prer[12]), .C1(
        \byte_controller/bit_controller/n190 ), .C2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U132  ( .A(
        \byte_controller/bit_controller/n177 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  AOI222_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(prer[13]), .C2(
        \byte_controller/bit_controller/n56 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  INV_X1 \byte_controller/bit_controller/U130  ( .A(
        \byte_controller/bit_controller/n176 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  AOI222_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n64 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n56 ), .ZN(
        \byte_controller/bit_controller/n176 ) );
  OAI211_X1 \byte_controller/bit_controller/U128  ( .C1(
        \byte_controller/bit_controller/n4 ), .C2(
        \byte_controller/bit_controller/n174 ), .A(
        \byte_controller/bit_controller/n173 ), .B(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  NAND2_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n173 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  INV_X1 \byte_controller/bit_controller/U126  ( .A(
        \byte_controller/bit_controller/n54 ), .ZN(
        \byte_controller/bit_controller/n193 ) );
  NAND2_X1 \byte_controller/bit_controller/U125  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/N68 ) );
  AOI21_X1 \byte_controller/bit_controller/U124  ( .B1(
        \byte_controller/bit_controller/n161 ), .B2(
        \byte_controller/bit_controller/n206 ), .A(
        \byte_controller/bit_controller/n205 ), .ZN(
        \byte_controller/bit_controller/n162 ) );
  INV_X1 \byte_controller/bit_controller/U123  ( .A(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  NAND3_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/n206 ), .A2(
        \byte_controller/bit_controller/n59 ), .A3(
        \byte_controller/bit_controller/n122 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  NAND4_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n137 ), .ZN(
        \byte_controller/bit_controller/n160 ) );
  INV_X1 \byte_controller/bit_controller/U120  ( .A(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n137 ) );
  NAND3_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n123 ), .A3(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  OAI22_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/bit_controller/n114 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n113 ), .B2(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n8 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n114 ), .B2(
        \byte_controller/bit_controller/n62 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI21_X1 \byte_controller/bit_controller/U116  ( .B1(
        \byte_controller/bit_controller/n8 ), .B2(
        \byte_controller/bit_controller/n5 ), .A(
        \byte_controller/bit_controller/n136 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  NAND4_X1 \byte_controller/bit_controller/U115  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/core_cmd [3]), .A3(
        \byte_controller/bit_controller/n26 ), .A4(
        \byte_controller/bit_controller/n135 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  NOR3_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n135 ) );
  OAI22_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n122 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U112  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n123 ), .B2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U110  ( .A1(
        \byte_controller/bit_controller/n117 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n59 ), .B2(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI22_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n118 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n117 ), .B2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n118 ), .B2(
        \byte_controller/bit_controller/n62 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/bit_controller/n194 ), .A2(
        \byte_controller/bit_controller/n134 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n86 ) );
  NAND3_X1 \byte_controller/bit_controller/U106  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/n133 ), .A3(
        \byte_controller/bit_controller/n26 ), .ZN(
        \byte_controller/bit_controller/n194 ) );
  OAI33_X1 \byte_controller/bit_controller/U105  ( .A1(
        \byte_controller/bit_controller/n132 ), .A2(
        \byte_controller/bit_controller/n129 ), .A3(
        \byte_controller/bit_controller/n127 ), .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/N69 ), .B3(
        \byte_controller/bit_controller/n126 ), .ZN(
        \byte_controller/bit_controller/N83 ) );
  NOR4_X1 \byte_controller/bit_controller/U104  ( .A1(
        \byte_controller/bit_controller/n84 ), .A2(
        \byte_controller/bit_controller/n138 ), .A3(
        \byte_controller/bit_controller/n78 ), .A4(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n85 ) );
  NAND4_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n117 ), .A4(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  NOR4_X1 \byte_controller/bit_controller/U102  ( .A1(
        \byte_controller/bit_controller/n14 ), .A2(
        \byte_controller/bit_controller/n10 ), .A3(
        \byte_controller/bit_controller/n76 ), .A4(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n125 ) );
  NAND3_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n115 ), .A3(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n77 ) );
  NAND3_X1 \byte_controller/bit_controller/U100  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n68 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  OAI21_X1 \byte_controller/bit_controller/U99  ( .B1(
        \byte_controller/bit_controller/n107 ), .B2(
        \byte_controller/bit_controller/n5 ), .A(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  OAI21_X1 \byte_controller/bit_controller/U98  ( .B1(
        \byte_controller/bit_controller/n139 ), .B2(
        \byte_controller/bit_controller/n46 ), .A(
        \byte_controller/bit_controller/n26 ), .ZN(
        \byte_controller/bit_controller/n75 ) );
  OAI22_X1 \byte_controller/bit_controller/U97  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/n62 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U96  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n197 ), .B1(
        \byte_controller/bit_controller/n110 ), .B2(
        \byte_controller/bit_controller/n62 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  INV_X1 \byte_controller/bit_controller/U95  ( .A(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  NAND2_X1 \byte_controller/bit_controller/U94  ( .A1(
        \byte_controller/bit_controller/n79 ), .A2(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  NOR2_X1 \byte_controller/bit_controller/U93  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n74 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  MUX2_X1 \byte_controller/bit_controller/U92  ( .A(
        \byte_controller/bit_controller/n73 ), .B(
        \byte_controller/bit_controller/n82 ), .S(
        \byte_controller/bit_controller/n87 ), .Z(
        \byte_controller/bit_controller/n74 ) );
  NAND2_X1 \byte_controller/bit_controller/U91  ( .A1(
        \byte_controller/bit_controller/n72 ), .A2(
        \byte_controller/bit_controller/n133 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  INV_X1 \byte_controller/bit_controller/U90  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n133 ) );
  INV_X1 \byte_controller/bit_controller/U89  ( .A(
        \byte_controller/bit_controller/n134 ), .ZN(
        \byte_controller/bit_controller/n72 ) );
  NAND3_X1 \byte_controller/bit_controller/U88  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n195 ), .A3(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n134 ) );
  INV_X1 \byte_controller/bit_controller/U87  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n199 ) );
  INV_X1 \byte_controller/bit_controller/U86  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n195 ) );
  NOR4_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n105 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n71 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  OR2_X1 \byte_controller/bit_controller/U84  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N66 ) );
  NAND2_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  INV_X1 \byte_controller/bit_controller/U82  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n192 ) );
  OR2_X1 \byte_controller/bit_controller/U81  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U80  ( .A1(
        \byte_controller/bit_controller/n200 ), .A2(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OR2_X1 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n69 ) );
  AND2_X1 \byte_controller/bit_controller/U78  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/N34 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  AND2_X1 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n190 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n66 ) );
  AND2_X1 \byte_controller/bit_controller/U76  ( .A1(prer[6]), .A2(
        \byte_controller/bit_controller/n50 ), .ZN(
        \byte_controller/bit_controller/n65 ) );
  AND2_X2 \byte_controller/bit_controller/U75  ( .A1(
        \byte_controller/bit_controller/n193 ), .A2(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n64 ) );
  INV_X1 \byte_controller/bit_controller/U74  ( .A(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n61 ) );
  AND2_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n28 ), .A2(
        \byte_controller/bit_controller/n25 ), .ZN(
        \byte_controller/bit_controller/n60 ) );
  INV_X1 \byte_controller/bit_controller/U72  ( .A(
        \byte_controller/bit_controller/n58 ), .ZN(
        \byte_controller/bit_controller/n59 ) );
  AND3_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n57 ) );
  INV_X1 \byte_controller/bit_controller/U70  ( .A(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/n56 ) );
  NAND4_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n22 ), .A2(
        \byte_controller/bit_controller/n167 ), .A3(
        \byte_controller/bit_controller/n168 ), .A4(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  OAI21_X1 \byte_controller/bit_controller/U68  ( .B1(
        \byte_controller/bit_controller/n171 ), .B2(
        \byte_controller/bit_controller/n172 ), .A(\ctr[7] ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  OAI21_X1 \byte_controller/bit_controller/U67  ( .B1(
        \byte_controller/bit_controller/n51 ), .B2(
        \byte_controller/bit_controller/n49 ), .A(\ctr[7] ), .ZN(
        \byte_controller/bit_controller/n54 ) );
  INV_X1 \byte_controller/bit_controller/U66  ( .A(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  NAND4_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n19 ), .A2(
        \byte_controller/bit_controller/n165 ), .A3(
        \byte_controller/bit_controller/n18 ), .A4(
        \byte_controller/bit_controller/n20 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  NAND4_X1 \byte_controller/bit_controller/U64  ( .A1(
        \byte_controller/bit_controller/n167 ), .A2(
        \byte_controller/bit_controller/n169 ), .A3(
        \byte_controller/bit_controller/n168 ), .A4(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n51 ) );
  NAND2_X2 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n206 ), .A2(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  INV_X1 \byte_controller/bit_controller/U62  ( .A(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n50 ) );
  AND2_X1 \byte_controller/bit_controller/U61  ( .A1(
        \byte_controller/bit_controller/n97 ), .A2(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  AND2_X1 \byte_controller/bit_controller/U60  ( .A1(
        \byte_controller/bit_controller/n99 ), .A2(
        \byte_controller/bit_controller/n100 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  NAND4_X1 \byte_controller/bit_controller/U59  ( .A1(
        \byte_controller/bit_controller/n166 ), .A2(
        \byte_controller/bit_controller/n165 ), .A3(
        \byte_controller/bit_controller/n164 ), .A4(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n49 ) );
  AND2_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n88 ), .A2(
        \byte_controller/bit_controller/n103 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  AND2_X1 \byte_controller/bit_controller/U57  ( .A1(
        \byte_controller/bit_controller/n101 ), .A2(
        \byte_controller/bit_controller/n102 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  INV_X1 \byte_controller/bit_controller/U56  ( .A(
        \byte_controller/bit_controller/n47 ), .ZN(
        \byte_controller/bit_controller/n48 ) );
  AND2_X1 \byte_controller/bit_controller/U55  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  AND2_X1 \byte_controller/bit_controller/U54  ( .A1(
        \byte_controller/bit_controller/n93 ), .A2(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  AND2_X1 \byte_controller/bit_controller/U53  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  BUF_X1 \byte_controller/bit_controller/U52  ( .A(
        \byte_controller/bit_controller/n43 ), .Z(
        \byte_controller/bit_controller/n42 ) );
  NAND2_X1 \byte_controller/bit_controller/U51  ( .A1(
        \byte_controller/bit_controller/n83 ), .A2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  MUX2_X1 \byte_controller/bit_controller/U50  ( .A(
        \byte_controller/bit_controller/n36 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n37 ), .Z(
        \byte_controller/bit_controller/n35 ) );
  NOR2_X1 \byte_controller/bit_controller/U49  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/N68 ), .ZN(
        \byte_controller/bit_controller/n34 ) );
  AND2_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n166 ) );
  OR4_X1 \byte_controller/bit_controller/U47  ( .A1(
        \byte_controller/bit_controller/n160 ), .A2(
        \byte_controller/bit_controller/n140 ), .A3(
        \byte_controller/bit_controller/n139 ), .A4(
        \byte_controller/bit_controller/n138 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  MUX2_X1 \byte_controller/bit_controller/U46  ( .A(scl_padoen_o), .B(
        \byte_controller/bit_controller/n31 ), .S(
        \byte_controller/bit_controller/n162 ), .Z(
        \byte_controller/bit_controller/n30 ) );
  OR2_X1 \byte_controller/bit_controller/U45  ( .A1(
        \byte_controller/bit_controller/n29 ), .A2(
        \byte_controller/bit_controller/n60 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  BUF_X1 \byte_controller/bit_controller/U44  ( .A(\byte_controller/n26 ), .Z(
        \byte_controller/bit_controller/n38 ) );
  BUF_X1 \byte_controller/bit_controller/U43  ( .A(
        \byte_controller/bit_controller/n38 ), .Z(
        \byte_controller/bit_controller/n44 ) );
  BUF_X1 \byte_controller/bit_controller/U42  ( .A(
        \byte_controller/bit_controller/n44 ), .Z(
        \byte_controller/bit_controller/n39 ) );
  BUF_X1 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n38 ), .Z(
        \byte_controller/bit_controller/n43 ) );
  INV_X1 \byte_controller/bit_controller/U40  ( .A(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n53 ) );
  BUF_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n43 ), .Z(
        \byte_controller/bit_controller/n40 ) );
  BUF_X1 \byte_controller/bit_controller/U38  ( .A(
        \byte_controller/bit_controller/n43 ), .Z(
        \byte_controller/bit_controller/n41 ) );
  NOR4_X1 \byte_controller/bit_controller/U37  ( .A1(
        \byte_controller/bit_controller/n209 ), .A2(
        \byte_controller/bit_controller/n77 ), .A3(
        \byte_controller/bit_controller/n76 ), .A4(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  AND2_X1 \byte_controller/bit_controller/U36  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n85 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  AND2_X1 \byte_controller/bit_controller/U35  ( .A1(
        \byte_controller/bit_controller/n27 ), .A2(
        \byte_controller/bit_controller/n125 ), .ZN(
        \byte_controller/bit_controller/n52 ) );
  OR2_X1 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n70 ), .A2(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/n201 ) );
  AND2_X1 \byte_controller/bit_controller/U33  ( .A1(
        \byte_controller/bit_controller/n206 ), .A2(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  NOR4_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n84 ), .A2(
        \byte_controller/bit_controller/n138 ), .A3(
        \byte_controller/bit_controller/n78 ), .A4(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  AND2_X2 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n193 ), .A2(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n63 ) );
  INV_X1 \byte_controller/bit_controller/U30  ( .A(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n24 ) );
  INV_X1 \byte_controller/bit_controller/U29  ( .A(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  AND2_X1 \byte_controller/bit_controller/U28  ( .A1(
        \byte_controller/bit_controller/n102 ), .A2(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n22 ) );
  OR3_X2 \byte_controller/bit_controller/U27  ( .A1(
        \byte_controller/bit_controller/n65 ), .A2(
        \byte_controller/bit_controller/n67 ), .A3(
        \byte_controller/bit_controller/n66 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  AND2_X1 \byte_controller/bit_controller/U26  ( .A1(
        \byte_controller/bit_controller/n90 ), .A2(
        \byte_controller/bit_controller/n89 ), .ZN(
        \byte_controller/bit_controller/n20 ) );
  AND2_X1 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n19 ) );
  AND2_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n91 ), .A2(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n18 ) );
  NAND2_X1 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/n17 ) );
  NAND2_X1 \byte_controller/bit_controller/U22  ( .A1(
        \byte_controller/bit_controller/n190 ), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/n16 ) );
  NAND2_X1 \byte_controller/bit_controller/U21  ( .A1(prer[4]), .A2(
        \byte_controller/bit_controller/n24 ), .ZN(
        \byte_controller/bit_controller/n15 ) );
  NAND3_X1 \byte_controller/bit_controller/U20  ( .A1(
        \byte_controller/bit_controller/n15 ), .A2(
        \byte_controller/bit_controller/n16 ), .A3(
        \byte_controller/bit_controller/n17 ), .ZN(
        \byte_controller/bit_controller/n33 ) );
  NAND3_X1 \byte_controller/bit_controller/U19  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  AND2_X2 \byte_controller/bit_controller/U18  ( .A1(
        \byte_controller/bit_controller/n60 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n45 ) );
  BUF_X1 \byte_controller/bit_controller/U17  ( .A(
        \byte_controller/bit_controller/n64 ), .Z(
        \byte_controller/bit_controller/n21 ) );
  AND3_X1 \byte_controller/bit_controller/U16  ( .A1(
        \byte_controller/bit_controller/n52 ), .A2(
        \byte_controller/bit_controller/n133 ), .A3(
        \byte_controller/bit_controller/n26 ), .ZN(
        \byte_controller/bit_controller/n55 ) );
  AND3_X1 \byte_controller/bit_controller/U15  ( .A1(
        \byte_controller/bit_controller/n52 ), .A2(
        \byte_controller/bit_controller/n133 ), .A3(
        \byte_controller/bit_controller/n26 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  AND2_X1 \byte_controller/bit_controller/U14  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n68 ) );
  AND2_X1 \byte_controller/bit_controller/U13  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  NAND3_X1 \byte_controller/bit_controller/U12  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n115 ), .A3(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  INV_X1 \byte_controller/bit_controller/U11  ( .A(
        \byte_controller/bit_controller/n139 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  INV_X1 \byte_controller/bit_controller/U10  ( .A(
        \byte_controller/bit_controller/n7 ), .ZN(
        \byte_controller/bit_controller/n8 ) );
  OR2_X1 \byte_controller/bit_controller/U9  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n132 ) );
  INV_X1 \byte_controller/bit_controller/U8  ( .A(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n62 ) );
  INV_X1 \byte_controller/bit_controller/U7  ( .A(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n6 ) );
  INV_X1 \byte_controller/bit_controller/U6  ( .A(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n5 ) );
  INV_X1 \byte_controller/bit_controller/U5  ( .A(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  OAI211_X1 \byte_controller/bit_controller/U4  ( .C1(
        \byte_controller/bit_controller/n4 ), .C2(
        \byte_controller/bit_controller/n174 ), .A(
        \byte_controller/bit_controller/n173 ), .B(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n2 ) );
  INV_X1 \byte_controller/bit_controller/U3  ( .A(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n1 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .Q(
        \byte_controller/bit_controller/n7 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/n29 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n13 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n86 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n129 ), .QN(
        \byte_controller/bit_controller/n82 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n71 ), .QN(
        \byte_controller/bit_controller/n104 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n41 ), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n221 ), .CK(wb_clk_i), .RN(
        \byte_controller/n26 ), .Q(\byte_controller/bit_controller/cnt [0]), 
        .QN(\byte_controller/bit_controller/n103 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n216 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n90 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n213 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n212 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n88 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n33 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n99 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n220 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .Q(
        \byte_controller/bit_controller/cnt [1]), .QN(
        \byte_controller/bit_controller/n102 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n219 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/n26 ), .Q(\byte_controller/bit_controller/n76 ), .QN(
        \byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n214 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n98 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n131 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n94 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n130 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n93 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n215 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n92 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n128 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n91 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n217 ), .CK(wb_clk_i), .RN(
        \byte_controller/n26 ), .Q(\byte_controller/bit_controller/cnt [7]), 
        .QN(\byte_controller/bit_controller/n96 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/n139 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/n26 ), .Q(\byte_controller/bit_controller/n78 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n138 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n211 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n95 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n32 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n97 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n218 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n100 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n39 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n58 ), .QN(
        \byte_controller/bit_controller/n116 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .Q(
        \byte_controller/bit_controller/n47 ), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .Q(
        \byte_controller/bit_controller/n46 ), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N83 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n79 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n42 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n126 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n222 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n70 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n174 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n30 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n42 ), .Q(scl_padoen_o) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n35 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n81 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n40 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n127 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n41 ), .QN(
        \byte_controller/bit_controller/n80 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N66 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n4 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n41 ), .Q(
        \byte_controller/bit_controller/n36 ), .QN(
        \byte_controller/bit_controller/n105 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U141  ( .A1(
        \byte_controller/bit_controller/sub_105/n124 ), .A2(
        \byte_controller/bit_controller/sub_105/n40 ), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U140  ( .A1(
        \byte_controller/bit_controller/sub_105/n121 ), .A2(
        \byte_controller/bit_controller/sub_105/n97 ), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U139  ( .A(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U138  ( .A1(
        \byte_controller/bit_controller/sub_105/n115 ), .A2(
        \byte_controller/bit_controller/sub_105/n116 ), .A3(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n111 ), .A2(
        \byte_controller/bit_controller/sub_105/n112 ), .A3(
        \byte_controller/bit_controller/sub_105/n97 ), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U136  ( .A1(
        \byte_controller/bit_controller/sub_105/n109 ), .A2(
        \byte_controller/bit_controller/sub_105/n110 ), .A3(
        \byte_controller/bit_controller/sub_105/n18 ), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U135  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U134  ( .A1(
        \byte_controller/bit_controller/sub_105/n100 ), .A2(
        \byte_controller/bit_controller/sub_105/n5 ), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/sub_105/n97 ), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n95 ), .A2(
        \byte_controller/bit_controller/sub_105/n18 ), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U131  ( .B1(
        \byte_controller/bit_controller/sub_105/n3 ), .B2(
        \byte_controller/bit_controller/sub_105/n90 ), .A(
        \byte_controller/bit_controller/sub_105/n89 ), .ZN(
        \byte_controller/bit_controller/N39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U130  ( .A1(
        \byte_controller/bit_controller/sub_105/n88 ), .A2(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n87 ), .A2(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n83 ), .A2(
        \byte_controller/bit_controller/sub_105/n84 ), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A1(
        \byte_controller/bit_controller/sub_105/n82 ), .A2(
        \byte_controller/bit_controller/sub_105/n35 ), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U126  ( .B1(
        \byte_controller/bit_controller/sub_105/n2 ), .B2(
        \byte_controller/bit_controller/sub_105/n77 ), .A(
        \byte_controller/bit_controller/sub_105/n76 ), .ZN(
        \byte_controller/bit_controller/N40 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U125  ( .A(
        \byte_controller/bit_controller/sub_105/n76 ), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n74 ), .A2(
        \byte_controller/bit_controller/sub_105/n75 ), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U123  ( .A1(
        \byte_controller/bit_controller/sub_105/n73 ), .A2(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U122  ( .A1(
        \byte_controller/bit_controller/sub_105/n69 ), .A2(
        \byte_controller/bit_controller/sub_105/n70 ), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U121  ( .A1(
        \byte_controller/bit_controller/sub_105/n68 ), .A2(
        \byte_controller/bit_controller/sub_105/n35 ), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U120  ( .B1(
        \byte_controller/bit_controller/sub_105/n62 ), .B2(
        \byte_controller/bit_controller/sub_105/n63 ), .A(
        \byte_controller/bit_controller/sub_105/n61 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U119  ( .A1(
        \byte_controller/bit_controller/sub_105/n59 ), .A2(
        \byte_controller/bit_controller/sub_105/n60 ), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U118  ( .A1(
        \byte_controller/bit_controller/sub_105/n58 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U117  ( .A1(
        \byte_controller/bit_controller/sub_105/n54 ), .A2(
        \byte_controller/bit_controller/sub_105/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U116  ( .A1(
        \byte_controller/bit_controller/sub_105/n101 ), .A2(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U115  ( .A1(
        \byte_controller/bit_controller/sub_105/n48 ), .A2(
        \byte_controller/bit_controller/sub_105/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U114  ( .A(
        \byte_controller/bit_controller/sub_105/n47 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U113  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U112  ( .A1(
        \byte_controller/bit_controller/sub_105/n39 ), .A2(
        \byte_controller/bit_controller/sub_105/n40 ), .A3(
        \byte_controller/bit_controller/sub_105/n41 ), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U111  ( .A(
        \byte_controller/bit_controller/sub_105/n36 ), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U110  ( .B1(
        \byte_controller/bit_controller/sub_105/n32 ), .B2(
        \byte_controller/bit_controller/sub_105/n19 ), .A(
        \byte_controller/bit_controller/sub_105/n31 ), .ZN(
        \byte_controller/bit_controller/N33 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A1(
        \byte_controller/bit_controller/sub_105/n124 ), .A2(
        \byte_controller/bit_controller/sub_105/n26 ), .ZN(
        \byte_controller/bit_controller/sub_105/n24 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/sub_105/n33 ), .A2(
        \byte_controller/bit_controller/sub_105/n5 ), .ZN(
        \byte_controller/bit_controller/sub_105/n25 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U107  ( .A1(
        \byte_controller/bit_controller/sub_105/n13 ), .A2(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/sub_105/n21 ), .ZN(
        \byte_controller/bit_controller/sub_105/n16 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/sub_105/n13 ), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n12 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U104  ( .A1(
        \byte_controller/bit_controller/sub_105/n11 ), .A2(
        \byte_controller/bit_controller/sub_105/n12 ), .ZN(
        \byte_controller/bit_controller/N36 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U103  ( .A(
        \byte_controller/bit_controller/sub_105/n11 ), .ZN(
        \byte_controller/bit_controller/sub_105/n9 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U102  ( .A(
        \byte_controller/bit_controller/sub_105/n31 ), .B(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U101  ( .A1(
        \byte_controller/bit_controller/sub_105/n36 ), .A2(
        \byte_controller/bit_controller/sub_105/n37 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U100  ( .B1(
        \byte_controller/bit_controller/sub_105/n9 ), .B2(
        \byte_controller/bit_controller/sub_105/n112 ), .A(
        \byte_controller/bit_controller/sub_105/n10 ), .ZN(
        \byte_controller/bit_controller/N37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/sub_105/n7 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n28 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U98  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U97  ( .A1(
        \byte_controller/bit_controller/sub_105/n1 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .A3(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U96  ( .A(
        \byte_controller/bit_controller/sub_105/n44 ), .B(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/N30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U95  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U94  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U93  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U91  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U90  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U89  ( .B1(
        \byte_controller/bit_controller/sub_105/n103 ), .B2(
        \byte_controller/bit_controller/sub_105/n104 ), .A(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/N38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U88  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U87  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U86  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n22 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U84  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U83  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n18 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U82  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U81  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U80  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U79  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U77  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U76  ( .A1(
        \byte_controller/bit_controller/sub_105/n6 ), .A2(
        \byte_controller/bit_controller/sub_105/n38 ), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U75  ( .A1(
        \byte_controller/bit_controller/sub_105/n33 ), .A2(
        \byte_controller/bit_controller/sub_105/n4 ), .A3(
        \byte_controller/bit_controller/sub_105/n34 ), .A4(
        \byte_controller/bit_controller/sub_105/n35 ), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U74  ( .A1(
        \byte_controller/bit_controller/sub_105/n46 ), .A2(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U73  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/N28 ), .A2(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U71  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U70  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U69  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U68  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U67  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U66  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U65  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U64  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n21 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U63  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U62  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U61  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n20 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U60  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U59  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U58  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U57  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U56  ( .A(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U55  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U54  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n125 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U53  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/N28 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U52  ( .A(
        \byte_controller/bit_controller/sub_105/n116 ), .ZN(
        \byte_controller/bit_controller/sub_105/n7 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U51  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U50  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U49  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n6 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U48  ( .A1(
        \byte_controller/bit_controller/sub_105/n43 ), .A2(
        \byte_controller/bit_controller/sub_105/n101 ), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U47  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n5 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U46  ( .A(
        \byte_controller/bit_controller/cnt [0]), .ZN(
        \byte_controller/bit_controller/sub_105/n4 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U45  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U44  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U43  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U42  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U41  ( .A(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U40  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U39  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n19 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U38  ( .A1(
        \byte_controller/bit_controller/sub_105/n19 ), .A2(
        \byte_controller/bit_controller/sub_105/n21 ), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U37  ( .A1(
        \byte_controller/bit_controller/sub_105/n18 ), .A2(
        \byte_controller/bit_controller/sub_105/n19 ), .ZN(
        \byte_controller/bit_controller/sub_105/n17 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U36  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U35  ( .A1(
        \byte_controller/bit_controller/sub_105/n56 ), .A2(
        \byte_controller/bit_controller/sub_105/n57 ), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U34  ( .A1(
        \byte_controller/bit_controller/sub_105/n50 ), .A2(
        \byte_controller/bit_controller/sub_105/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U33  ( .A1(
        \byte_controller/bit_controller/sub_105/n28 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .A3(
        \byte_controller/bit_controller/sub_105/n29 ), .A4(
        \byte_controller/bit_controller/sub_105/n30 ), .ZN(
        \byte_controller/bit_controller/sub_105/n13 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U32  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U31  ( .A1(
        \byte_controller/bit_controller/sub_105/n16 ), .A2(
        \byte_controller/bit_controller/sub_105/n17 ), .ZN(
        \byte_controller/bit_controller/sub_105/n15 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U30  ( .A1(
        \byte_controller/bit_controller/sub_105/n22 ), .A2(
        \byte_controller/bit_controller/sub_105/n52 ), .ZN(
        \byte_controller/bit_controller/sub_105/n14 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U29  ( .A1(
        \byte_controller/bit_controller/sub_105/n14 ), .A2(
        \byte_controller/bit_controller/sub_105/n15 ), .ZN(
        \byte_controller/bit_controller/sub_105/n11 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U28  ( .B1(
        \byte_controller/bit_controller/sub_105/n24 ), .B2(
        \byte_controller/bit_controller/sub_105/n25 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n23 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U27  ( .B1(
        \byte_controller/bit_controller/sub_105/n42 ), .B2(
        \byte_controller/bit_controller/sub_105/n35 ), .A(
        \byte_controller/bit_controller/sub_105/n38 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U26  ( .A1(
        \byte_controller/bit_controller/sub_105/n44 ), .A2(
        \byte_controller/bit_controller/sub_105/n45 ), .ZN(
        \byte_controller/bit_controller/N29 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U25  ( .A(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U24  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U23  ( .A(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U22  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U21  ( .A(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U20  ( .A(
        \byte_controller/bit_controller/sub_105/n61 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U19  ( .A1(
        \byte_controller/bit_controller/sub_105/n80 ), .A2(
        \byte_controller/bit_controller/sub_105/n81 ), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U18  ( .A1(
        \byte_controller/bit_controller/sub_105/n85 ), .A2(
        \byte_controller/bit_controller/sub_105/n86 ), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U17  ( .A1(
        \byte_controller/bit_controller/sub_105/n78 ), .A2(
        \byte_controller/bit_controller/sub_105/n79 ), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U16  ( .A1(
        \byte_controller/bit_controller/sub_105/n93 ), .A2(
        \byte_controller/bit_controller/sub_105/n94 ), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U15  ( .A1(
        \byte_controller/bit_controller/sub_105/n98 ), .A2(
        \byte_controller/bit_controller/sub_105/n99 ), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U14  ( .A1(
        \byte_controller/bit_controller/sub_105/n91 ), .A2(
        \byte_controller/bit_controller/sub_105/n92 ), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U13  ( .A1(
        \byte_controller/bit_controller/sub_105/n122 ), .A2(
        \byte_controller/bit_controller/sub_105/n123 ), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U12  ( .A1(
        \byte_controller/bit_controller/sub_105/n119 ), .A2(
        \byte_controller/bit_controller/sub_105/n120 ), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U11  ( .A1(
        \byte_controller/bit_controller/sub_105/n117 ), .A2(
        \byte_controller/bit_controller/sub_105/n118 ), .ZN(
        \byte_controller/bit_controller/sub_105/n10 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U10  ( .A1(
        \byte_controller/bit_controller/sub_105/n107 ), .A2(
        \byte_controller/bit_controller/sub_105/n108 ), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U9  ( .A1(
        \byte_controller/bit_controller/sub_105/n113 ), .A2(
        \byte_controller/bit_controller/sub_105/n114 ), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U8  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U7  ( .A1(
        \byte_controller/bit_controller/sub_105/n66 ), .A2(
        \byte_controller/bit_controller/sub_105/n67 ), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U6  ( .A1(
        \byte_controller/bit_controller/sub_105/n71 ), .A2(
        \byte_controller/bit_controller/sub_105/n72 ), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U5  ( .A1(
        \byte_controller/bit_controller/sub_105/n64 ), .A2(
        \byte_controller/bit_controller/sub_105/n65 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U4  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n3 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U3  ( .A1(
        \byte_controller/bit_controller/sub_105/n91 ), .A2(
        \byte_controller/bit_controller/sub_105/n92 ), .ZN(
        \byte_controller/bit_controller/sub_105/n2 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/sub_105/n4 ), .ZN(
        \byte_controller/bit_controller/sub_105/n1 ) );
endmodule

