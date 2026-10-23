/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 02:43:06 2026
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
  wire   N15, done, i2c_al, sr_1, N36, N37, N38, N39, N40, N41, N42, N43, N70,
         N71, N72, irxack, N87, N88, N89, N90, N94, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215,
         \byte_controller/n156 , \byte_controller/n155 ,
         \byte_controller/n154 , \byte_controller/n153 ,
         \byte_controller/n152 , \byte_controller/n151 ,
         \byte_controller/n150 , \byte_controller/n149 ,
         \byte_controller/n148 , \byte_controller/n147 ,
         \byte_controller/n146 , \byte_controller/n145 ,
         \byte_controller/n144 , \byte_controller/n143 ,
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
         \byte_controller/n27 , \byte_controller/n26 , \byte_controller/n25 ,
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
         \byte_controller/n24 , \byte_controller/n18 , \byte_controller/n15 ,
         \byte_controller/n6 , \byte_controller/N107 , \byte_controller/N106 ,
         \byte_controller/N105 , \byte_controller/N104 ,
         \byte_controller/dcnt[1] , \byte_controller/ld ,
         \byte_controller/core_rxd , \byte_controller/core_txd ,
         \byte_controller/core_ack , \byte_controller/bit_controller/n215 ,
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
         \byte_controller/bit_controller/n164 ,
         \byte_controller/bit_controller/n163 ,
         \byte_controller/bit_controller/n144 ,
         \byte_controller/bit_controller/n143 ,
         \byte_controller/bit_controller/n142 ,
         \byte_controller/bit_controller/n141 ,
         \byte_controller/bit_controller/n140 ,
         \byte_controller/bit_controller/n139 ,
         \byte_controller/bit_controller/n138 ,
         \byte_controller/bit_controller/n137 ,
         \byte_controller/bit_controller/n136 ,
         \byte_controller/bit_controller/n133 ,
         \byte_controller/bit_controller/n131 ,
         \byte_controller/bit_controller/n130 ,
         \byte_controller/bit_controller/n127 ,
         \byte_controller/bit_controller/n105 ,
         \byte_controller/bit_controller/n104 ,
         \byte_controller/bit_controller/n103 ,
         \byte_controller/bit_controller/n102 ,
         \byte_controller/bit_controller/n101 ,
         \byte_controller/bit_controller/n100 ,
         \byte_controller/bit_controller/n99 ,
         \byte_controller/bit_controller/n96 ,
         \byte_controller/bit_controller/n95 ,
         \byte_controller/bit_controller/n94 ,
         \byte_controller/bit_controller/n93 ,
         \byte_controller/bit_controller/n92 ,
         \byte_controller/bit_controller/n91 ,
         \byte_controller/bit_controller/n90 ,
         \byte_controller/bit_controller/n88 ,
         \byte_controller/bit_controller/n87 ,
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
         \byte_controller/bit_controller/n165 ,
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
         \byte_controller/bit_controller/n135 ,
         \byte_controller/bit_controller/n134 ,
         \byte_controller/bit_controller/n132 ,
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
         \byte_controller/bit_controller/n98 ,
         \byte_controller/bit_controller/n97 ,
         \byte_controller/bit_controller/n89 ,
         \byte_controller/bit_controller/n86 ,
         \byte_controller/bit_controller/n85 ,
         \byte_controller/bit_controller/n84 ,
         \byte_controller/bit_controller/n83 ,
         \byte_controller/bit_controller/N174 ,
         \byte_controller/bit_controller/N86 ,
         \byte_controller/bit_controller/N78 ,
         \byte_controller/bit_controller/N76 ,
         \byte_controller/bit_controller/N75 ,
         \byte_controller/bit_controller/sto_condition ,
         \byte_controller/bit_controller/N72 ,
         \byte_controller/bit_controller/N71 ,
         \byte_controller/bit_controller/N70 ,
         \byte_controller/bit_controller/N69 ,
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
         \byte_controller/bit_controller/N31 ,
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
         \byte_controller/bit_controller/sub_105/n124 ;
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

  DFF_X1 wb_ack_o_reg ( .D(N15), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n1) );
  DFFR_X1 \ctr_reg[7]  ( .D(n135), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n2) );
  DFFR_X1 \ctr_reg[6]  ( .D(n134), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[5]  ( .D(n133), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[4]  ( .D(n132), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n5) );
  DFFR_X1 \ctr_reg[3]  ( .D(n131), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[2]  ( .D(n130), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n7) );
  DFFR_X1 \ctr_reg[0]  ( .D(n128), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n9) );
  DFFS_X1 \prer_reg[15]  ( .D(n127), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n10) );
  DFFS_X1 \prer_reg[14]  ( .D(n126), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n11) );
  DFFS_X1 \prer_reg[13]  ( .D(n125), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n12) );
  DFFS_X1 \prer_reg[12]  ( .D(n124), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n13) );
  DFFS_X1 \prer_reg[11]  ( .D(n123), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n14) );
  DFFS_X1 \prer_reg[10]  ( .D(n122), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n15) );
  DFFS_X1 \prer_reg[8]  ( .D(n120), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n17) );
  DFFS_X1 \prer_reg[7]  ( .D(n119), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n18) );
  DFFS_X1 \prer_reg[6]  ( .D(n118), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[5]  ( .D(n117), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[4]  ( .D(n116), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n21) );
  DFFS_X1 \prer_reg[3]  ( .D(n115), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n22) );
  DFFS_X1 \prer_reg[2]  ( .D(n114), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n23) );
  DFFS_X1 \prer_reg[1]  ( .D(n113), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n24) );
  DFFS_X1 \prer_reg[0]  ( .D(n112), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n25) );
  DFFR_X1 \txr_reg[4]  ( .D(n108), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n29) );
  DFFR_X1 \txr_reg[3]  ( .D(n107), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n30) );
  DFFR_X1 \txr_reg[2]  ( .D(n106), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n31) );
  DFFR_X1 \txr_reg[1]  ( .D(n105), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n32) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N42), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFFR_X1 \cr_reg[5]  ( .D(n101), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n36) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N40), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N39), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N38), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFR_X1 al_reg ( .D(N87), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N41), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N88), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N43), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N89), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N37), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFFR_X1 irq_flag_reg ( .D(N90), .CK(wb_clk_i), .RN(arst_i), .Q(n169), .QN(
        n39) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N36), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N94), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFS_X1 \prer_reg[9]  ( .D(n121), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n16) );
  DFFR_X1 \ctr_reg[1]  ( .D(n129), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n8) );
  DFFR_X1 \txr_reg[7]  ( .D(n111), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n26) );
  DFFR_X1 \txr_reg[6]  ( .D(n110), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n27) );
  DFFR_X1 \txr_reg[5]  ( .D(n109), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n28) );
  DFFR_X1 \txr_reg[0]  ( .D(n104), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n33) );
  DFFR_X1 \cr_reg[0]  ( .D(N70), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n38) );
  DFFR_X1 \cr_reg[7]  ( .D(n99), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n34) );
  DFFR_X1 \cr_reg[6]  ( .D(n100), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n35) );
  DFFR_X1 \cr_reg[1]  ( .D(N71), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]) );
  DFFR_X1 \cr_reg[2]  ( .D(N72), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]) );
  DFFR_X1 \cr_reg[3]  ( .D(n103), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n144) );
  DFFR_X1 \cr_reg[4]  ( .D(n102), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n37) );
  INV_X1 U116 ( .A(n37), .ZN(n136) );
  AND2_X1 U117 ( .A1(n158), .A2(n180), .ZN(n137) );
  AND2_X1 U118 ( .A1(n158), .A2(n140), .ZN(n138) );
  AND3_X1 U119 ( .A1(wb_adr_i[2]), .A2(n175), .A3(n174), .ZN(n139) );
  NAND4_X2 U120 ( .A1(ctr[7]), .A2(n139), .A3(n158), .A4(n207), .ZN(n184) );
  MUX2_X1 U121 ( .A(wb_dat_i[3]), .B(n146), .S(n184), .Z(n103) );
  INV_X1 U122 ( .A(wb_rst_i), .ZN(n207) );
  AND3_X1 U123 ( .A1(wb_adr_i[0]), .A2(n157), .A3(n174), .ZN(n140) );
  INV_X1 U125 ( .A(wb_dat_i[0]), .ZN(n171) );
  INV_X1 U126 ( .A(wb_adr_i[2]), .ZN(n157) );
  NAND3_X1 U127 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[1]), .A3(n157), .ZN(n173) );
  NAND3_X1 U128 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n145) );
  OAI21_X1 U129 ( .B1(n173), .B2(n145), .A(n207), .ZN(n142) );
  NAND2_X1 U130 ( .A1(n142), .A2(n207), .ZN(n143) );
  OAI22_X1 U131 ( .A1(n171), .A2(n143), .B1(n33), .B2(n142), .ZN(n104) );
  INV_X1 U132 ( .A(wb_dat_i[1]), .ZN(n179) );
  OAI22_X1 U133 ( .A1(n179), .A2(n143), .B1(n32), .B2(n142), .ZN(n105) );
  INV_X1 U134 ( .A(wb_dat_i[2]), .ZN(n185) );
  OAI22_X1 U135 ( .A1(n185), .A2(n143), .B1(n31), .B2(n142), .ZN(n106) );
  INV_X1 U136 ( .A(wb_dat_i[3]), .ZN(n188) );
  OAI22_X1 U137 ( .A1(n188), .A2(n143), .B1(n30), .B2(n142), .ZN(n107) );
  INV_X1 U138 ( .A(wb_dat_i[4]), .ZN(n191) );
  OAI22_X1 U139 ( .A1(n191), .A2(n143), .B1(n29), .B2(n142), .ZN(n108) );
  INV_X1 U140 ( .A(wb_dat_i[5]), .ZN(n199) );
  OAI22_X1 U141 ( .A1(n199), .A2(n143), .B1(n28), .B2(n142), .ZN(n109) );
  INV_X1 U142 ( .A(wb_dat_i[6]), .ZN(n168) );
  OAI22_X1 U143 ( .A1(n168), .A2(n143), .B1(n27), .B2(n142), .ZN(n110) );
  INV_X1 U144 ( .A(wb_dat_i[7]), .ZN(n166) );
  OAI22_X1 U145 ( .A1(n166), .A2(n143), .B1(n26), .B2(n142), .ZN(n111) );
  INV_X1 U146 ( .A(wb_adr_i[0]), .ZN(n175) );
  NAND3_X1 U147 ( .A1(wb_adr_i[1]), .A2(n175), .A3(n157), .ZN(n172) );
  OAI21_X1 U148 ( .B1(n172), .B2(n145), .A(n207), .ZN(n198) );
  NAND2_X1 U149 ( .A1(n198), .A2(n207), .ZN(n200) );
  OAI22_X1 U150 ( .A1(n200), .A2(n166), .B1(n2), .B2(n198), .ZN(n135) );
  NOR2_X1 U151 ( .A1(wb_rst_i), .A2(n144), .ZN(n146) );
  INV_X1 U152 ( .A(wb_adr_i[1]), .ZN(n174) );
  INV_X1 U153 ( .A(n145), .ZN(n158) );
  INV_X1 U154 ( .A(done), .ZN(n147) );
  INV_X1 U155 ( .A(i2c_al), .ZN(n196) );
  NAND4_X1 U156 ( .A1(n184), .A2(n207), .A3(n147), .A4(n196), .ZN(n148) );
  OAI22_X1 U157 ( .A1(n37), .A2(n148), .B1(n191), .B2(n184), .ZN(n102) );
  OAI22_X1 U158 ( .A1(n36), .A2(n148), .B1(n199), .B2(n184), .ZN(n101) );
  OAI22_X1 U159 ( .A1(n35), .A2(n148), .B1(n184), .B2(n168), .ZN(n100) );
  OAI22_X1 U160 ( .A1(n34), .A2(n148), .B1(n184), .B2(n166), .ZN(n99) );
  NAND3_X1 U161 ( .A1(n175), .A2(n157), .A3(n174), .ZN(n215) );
  INV_X1 U162 ( .A(n215), .ZN(n180) );
  MUX2_X1 U163 ( .A(n25), .B(n171), .S(n137), .Z(n149) );
  NAND2_X1 U164 ( .A1(n207), .A2(n149), .ZN(n112) );
  MUX2_X1 U165 ( .A(n24), .B(n179), .S(n137), .Z(n150) );
  NAND2_X1 U166 ( .A1(n207), .A2(n150), .ZN(n113) );
  MUX2_X1 U167 ( .A(n23), .B(n185), .S(n137), .Z(n151) );
  NAND2_X1 U168 ( .A1(n207), .A2(n151), .ZN(n114) );
  MUX2_X1 U169 ( .A(n22), .B(n188), .S(n137), .Z(n152) );
  NAND2_X1 U170 ( .A1(n207), .A2(n152), .ZN(n115) );
  MUX2_X1 U171 ( .A(n21), .B(n191), .S(n137), .Z(n153) );
  NAND2_X1 U172 ( .A1(n207), .A2(n153), .ZN(n116) );
  MUX2_X1 U173 ( .A(n20), .B(n199), .S(n137), .Z(n154) );
  NAND2_X1 U174 ( .A1(n207), .A2(n154), .ZN(n117) );
  MUX2_X1 U175 ( .A(n19), .B(n168), .S(n137), .Z(n155) );
  NAND2_X1 U176 ( .A1(n207), .A2(n155), .ZN(n118) );
  MUX2_X1 U177 ( .A(n18), .B(n166), .S(n137), .Z(n156) );
  NAND2_X1 U178 ( .A1(n207), .A2(n156), .ZN(n119) );
  MUX2_X1 U179 ( .A(n17), .B(n171), .S(n138), .Z(n159) );
  NAND2_X1 U180 ( .A1(n207), .A2(n159), .ZN(n120) );
  MUX2_X1 U181 ( .A(n16), .B(n179), .S(n138), .Z(n160) );
  NAND2_X1 U182 ( .A1(n207), .A2(n160), .ZN(n121) );
  MUX2_X1 U183 ( .A(n15), .B(n185), .S(n138), .Z(n161) );
  NAND2_X1 U184 ( .A1(n207), .A2(n161), .ZN(n122) );
  MUX2_X1 U185 ( .A(n14), .B(n188), .S(n138), .Z(n162) );
  NAND2_X1 U186 ( .A1(n207), .A2(n162), .ZN(n123) );
  MUX2_X1 U187 ( .A(n13), .B(n191), .S(n138), .Z(n163) );
  NAND2_X1 U188 ( .A1(n207), .A2(n163), .ZN(n124) );
  MUX2_X1 U189 ( .A(n12), .B(n199), .S(n138), .Z(n164) );
  NAND2_X1 U190 ( .A1(n207), .A2(n164), .ZN(n125) );
  MUX2_X1 U191 ( .A(n11), .B(n168), .S(n138), .Z(n165) );
  NAND2_X1 U192 ( .A1(n207), .A2(n165), .ZN(n126) );
  MUX2_X1 U193 ( .A(n10), .B(n166), .S(n138), .Z(n167) );
  NAND2_X1 U194 ( .A1(n207), .A2(n167), .ZN(n127) );
  OAI22_X1 U195 ( .A1(n200), .A2(n168), .B1(n3), .B2(n198), .ZN(n134) );
  NOR2_X1 U196 ( .A1(n184), .A2(n171), .ZN(N70) );
  NOR2_X1 U197 ( .A1(done), .A2(n169), .ZN(n170) );
  AOI211_X1 U198 ( .C1(n170), .C2(n196), .A(cr[0]), .B(wb_rst_i), .ZN(N90) );
  NOR3_X1 U199 ( .A1(n39), .A2(n3), .A3(wb_rst_i), .ZN(N94) );
  AND3_X1 U200 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N15) );
  OAI22_X1 U201 ( .A1(n200), .A2(n171), .B1(n9), .B2(n198), .ZN(n128) );
  INV_X1 U202 ( .A(n172), .ZN(n208) );
  AOI22_X1 U203 ( .A1(prer[8]), .A2(n140), .B1(ctr[0]), .B2(n208), .ZN(n178)
         );
  INV_X1 U204 ( .A(n173), .ZN(n212) );
  NAND3_X1 U205 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[2]), .A3(n174), .ZN(n210) );
  NAND3_X1 U206 ( .A1(wb_adr_i[2]), .A2(wb_adr_i[1]), .A3(n175), .ZN(n209) );
  OAI22_X1 U207 ( .A1(n33), .A2(n210), .B1(n38), .B2(n209), .ZN(n176) );
  AOI221_X1 U208 ( .B1(rxr[0]), .B2(n212), .C1(n169), .C2(n139), .A(n176), 
        .ZN(n177) );
  OAI211_X1 U209 ( .C1(n25), .C2(n215), .A(n178), .B(n177), .ZN(N36) );
  NOR2_X1 U210 ( .A1(n184), .A2(n179), .ZN(N71) );
  AOI21_X1 U211 ( .B1(n36), .B2(n37), .A(wb_rst_i), .ZN(N89) );
  OAI22_X1 U212 ( .A1(n200), .A2(n179), .B1(n8), .B2(n198), .ZN(n129) );
  INV_X1 U213 ( .A(n209), .ZN(n193) );
  INV_X1 U214 ( .A(n210), .ZN(n192) );
  AOI22_X1 U215 ( .A1(cr[1]), .A2(n193), .B1(txr[1]), .B2(n192), .ZN(n183) );
  AOI22_X1 U216 ( .A1(rxr[1]), .A2(n212), .B1(sr_1), .B2(n139), .ZN(n182) );
  AOI222_X1 U217 ( .A1(prer[1]), .A2(n180), .B1(prer[9]), .B2(n140), .C1(
        ctr[1]), .C2(n208), .ZN(n181) );
  NAND3_X1 U218 ( .A1(n183), .A2(n182), .A3(n181), .ZN(N37) );
  NOR2_X1 U219 ( .A1(n185), .A2(n184), .ZN(N72) );
  OAI22_X1 U220 ( .A1(n200), .A2(n185), .B1(n7), .B2(n198), .ZN(n130) );
  AOI22_X1 U221 ( .A1(prer[10]), .A2(n140), .B1(ctr[2]), .B2(n208), .ZN(n187)
         );
  AOI222_X1 U222 ( .A1(rxr[2]), .A2(n212), .B1(cr[2]), .B2(n193), .C1(txr[2]), 
        .C2(n192), .ZN(n186) );
  OAI211_X1 U223 ( .C1(n23), .C2(n215), .A(n187), .B(n186), .ZN(N38) );
  OAI22_X1 U224 ( .A1(n200), .A2(n188), .B1(n6), .B2(n198), .ZN(n131) );
  AOI22_X1 U225 ( .A1(prer[11]), .A2(n140), .B1(ctr[3]), .B2(n208), .ZN(n190)
         );
  AOI222_X1 U226 ( .A1(rxr[3]), .A2(n212), .B1(cr[3]), .B2(n193), .C1(txr[3]), 
        .C2(n192), .ZN(n189) );
  OAI211_X1 U227 ( .C1(n22), .C2(n215), .A(n190), .B(n189), .ZN(N39) );
  OAI22_X1 U228 ( .A1(n200), .A2(n191), .B1(n5), .B2(n198), .ZN(n132) );
  AOI22_X1 U229 ( .A1(prer[12]), .A2(n140), .B1(ctr[4]), .B2(n208), .ZN(n195)
         );
  AOI222_X1 U230 ( .A1(rxr[4]), .A2(n212), .B1(n136), .B2(n193), .C1(txr[4]), 
        .C2(n192), .ZN(n194) );
  OAI211_X1 U231 ( .C1(n21), .C2(n215), .A(n195), .B(n194), .ZN(N40) );
  NAND2_X1 U232 ( .A1(n34), .A2(sr[5]), .ZN(n197) );
  AOI21_X1 U233 ( .B1(n197), .B2(n196), .A(wb_rst_i), .ZN(N87) );
  OAI22_X1 U234 ( .A1(n200), .A2(n199), .B1(n4), .B2(n198), .ZN(n133) );
  AOI22_X1 U235 ( .A1(prer[13]), .A2(n140), .B1(ctr[5]), .B2(n208), .ZN(n203)
         );
  OAI22_X1 U236 ( .A1(n28), .A2(n210), .B1(n36), .B2(n209), .ZN(n201) );
  AOI221_X1 U237 ( .B1(rxr[5]), .B2(n212), .C1(sr[5]), .C2(n139), .A(n201), 
        .ZN(n202) );
  OAI211_X1 U238 ( .C1(n20), .C2(n215), .A(n203), .B(n202), .ZN(N41) );
  AOI22_X1 U239 ( .A1(prer[14]), .A2(n140), .B1(ctr[6]), .B2(n208), .ZN(n206)
         );
  OAI22_X1 U240 ( .A1(n27), .A2(n210), .B1(n35), .B2(n209), .ZN(n204) );
  AOI221_X1 U241 ( .B1(rxr[6]), .B2(n212), .C1(sr[6]), .C2(n139), .A(n204), 
        .ZN(n205) );
  OAI211_X1 U242 ( .C1(n19), .C2(n215), .A(n206), .B(n205), .ZN(N42) );
  AND2_X1 U243 ( .A1(irxack), .A2(n207), .ZN(N88) );
  AOI22_X1 U244 ( .A1(prer[15]), .A2(n140), .B1(ctr[7]), .B2(n208), .ZN(n214)
         );
  OAI22_X1 U245 ( .A1(n26), .A2(n210), .B1(n34), .B2(n209), .ZN(n211) );
  AOI221_X1 U246 ( .B1(rxr[7]), .B2(n212), .C1(sr[7]), .C2(n139), .A(n211), 
        .ZN(n213) );
  OAI211_X1 U247 ( .C1(n18), .C2(n215), .A(n214), .B(n213), .ZN(N43) );
  NOR2_X1 \byte_controller/U138  ( .A1(\byte_controller/n156 ), .A2(
        \byte_controller/n155 ), .ZN(\byte_controller/n79 ) );
  NAND3_X1 \byte_controller/U137  ( .A1(\byte_controller/n149 ), .A2(
        \byte_controller/n150 ), .A3(\byte_controller/n151 ), .ZN(
        \byte_controller/n80 ) );
  NAND3_X1 \byte_controller/U136  ( .A1(\byte_controller/core_cmd [3]), .A2(
        \byte_controller/n148 ), .A3(\byte_controller/n23 ), .ZN(
        \byte_controller/n149 ) );
  OAI221_X1 \byte_controller/U135  ( .B1(\byte_controller/n146 ), .B2(
        \byte_controller/n145 ), .C1(\byte_controller/c_state [2]), .C2(
        \byte_controller/n144 ), .A(\byte_controller/n143 ), .ZN(
        \byte_controller/n151 ) );
  OAI21_X1 \byte_controller/U134  ( .B1(\byte_controller/n142 ), .B2(
        \byte_controller/n24 ), .A(\byte_controller/n141 ), .ZN(
        \byte_controller/n143 ) );
  INV_X1 \byte_controller/U133  ( .A(\byte_controller/n142 ), .ZN(
        \byte_controller/n144 ) );
  NAND2_X1 \byte_controller/U132  ( .A1(\byte_controller/n147 ), .A2(
        \byte_controller/n140 ), .ZN(\byte_controller/n142 ) );
  INV_X1 \byte_controller/U131  ( .A(\byte_controller/n19 ), .ZN(
        \byte_controller/n145 ) );
  INV_X1 \byte_controller/U130  ( .A(\byte_controller/n17 ), .ZN(
        \byte_controller/n146 ) );
  OR3_X1 \byte_controller/U129  ( .A1(\byte_controller/n137 ), .A2(
        \byte_controller/n135 ), .A3(\byte_controller/n136 ), .ZN(
        \byte_controller/n81 ) );
  OAI33_X1 \byte_controller/U128  ( .A1(\byte_controller/n134 ), .A2(
        \byte_controller/n155 ), .A3(\byte_controller/n29 ), .B1(
        \byte_controller/n29 ), .B2(\byte_controller/n155 ), .B3(
        \byte_controller/n133 ), .ZN(\byte_controller/n135 ) );
  INV_X1 \byte_controller/U127  ( .A(\byte_controller/n131 ), .ZN(
        \byte_controller/n137 ) );
  NAND2_X1 \byte_controller/U126  ( .A1(\byte_controller/n130 ), .A2(
        \byte_controller/n129 ), .ZN(\byte_controller/n82 ) );
  INV_X1 \byte_controller/U125  ( .A(\byte_controller/n128 ), .ZN(
        \byte_controller/n132 ) );
  NAND2_X1 \byte_controller/U124  ( .A1(\byte_controller/n126 ), .A2(
        \byte_controller/n127 ), .ZN(\byte_controller/n83 ) );
  NAND3_X1 \byte_controller/U123  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n71 ), .A3(\byte_controller/core_cmd [0]), .ZN(
        \byte_controller/n126 ) );
  AOI21_X1 \byte_controller/U122  ( .B1(\byte_controller/n125 ), .B2(
        \byte_controller/n152 ), .A(\byte_controller/n155 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U121  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n152 ) );
  AOI22_X1 \byte_controller/U120  ( .A1(cr[3]), .A2(\byte_controller/n124 ), 
        .B1(\byte_controller/n123 ), .B2(rxr[7]), .ZN(\byte_controller/n125 )
         );
  NAND3_X1 \byte_controller/U119  ( .A1(\byte_controller/n122 ), .A2(
        \byte_controller/n121 ), .A3(\byte_controller/n120 ), .ZN(
        \byte_controller/n123 ) );
  AOI221_X1 \byte_controller/U118  ( .B1(\byte_controller/n24 ), .B2(
        \byte_controller/n119 ), .C1(\byte_controller/n118 ), .C2(
        \byte_controller/c_state [1]), .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n120 ) );
  OAI21_X1 \byte_controller/U117  ( .B1(\byte_controller/n24 ), .B2(
        \byte_controller/n118 ), .A(\byte_controller/n26 ), .ZN(
        \byte_controller/n124 ) );
  OAI221_X1 \byte_controller/U116  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n12 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n115 ), .A(\byte_controller/n114 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U115  ( .A1(txr[7]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n114 ) );
  OAI221_X1 \byte_controller/U114  ( .B1(\byte_controller/n115 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n112 ), .A(\byte_controller/n111 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U113  ( .A1(txr[6]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n111 ) );
  OAI221_X1 \byte_controller/U112  ( .B1(\byte_controller/n112 ), .B2(
        \byte_controller/n13 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n110 ), .A(\byte_controller/n109 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U111  ( .A1(txr[5]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n109 ) );
  OAI221_X1 \byte_controller/U110  ( .B1(\byte_controller/n110 ), .B2(
        \byte_controller/n13 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n108 ), .A(\byte_controller/n107 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U109  ( .A1(txr[4]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n107 ) );
  OAI221_X1 \byte_controller/U108  ( .B1(\byte_controller/n108 ), .B2(
        \byte_controller/n10 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n106 ), .A(\byte_controller/n105 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U107  ( .A1(txr[3]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n105 ) );
  OAI221_X1 \byte_controller/U106  ( .B1(\byte_controller/n106 ), .B2(
        \byte_controller/n12 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n104 ), .A(\byte_controller/n103 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U105  ( .A1(txr[2]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n103 ) );
  OAI221_X1 \byte_controller/U104  ( .B1(\byte_controller/n104 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n102 ), .A(\byte_controller/n101 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U103  ( .A1(txr[1]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n101 ) );
  OAI221_X1 \byte_controller/U102  ( .B1(\byte_controller/n102 ), .B2(
        \byte_controller/n10 ), .C1(\byte_controller/n116 ), .C2(
        \byte_controller/n153 ), .A(\byte_controller/n100 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U101  ( .A1(txr[0]), .A2(\byte_controller/n113 ), 
        .ZN(\byte_controller/n100 ) );
  INV_X1 \byte_controller/U100  ( .A(\byte_controller/n78 ), .ZN(
        \byte_controller/n113 ) );
  INV_X1 \byte_controller/U99  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n153 ) );
  NAND3_X1 \byte_controller/U98  ( .A1(\byte_controller/n116 ), .A2(
        \byte_controller/n77 ), .A3(\byte_controller/n78 ), .ZN(
        \byte_controller/n117 ) );
  NAND3_X1 \byte_controller/U97  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/n74 ), .A3(\byte_controller/n76 ), .ZN(
        \byte_controller/n84 ) );
  NAND2_X1 \byte_controller/U96  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/n72 ), .ZN(\byte_controller/n134 ) );
  NAND3_X1 \byte_controller/U95  ( .A1(\byte_controller/n71 ), .A2(
        \byte_controller/c_state [3]), .A3(\byte_controller/n148 ), .ZN(
        \byte_controller/n75 ) );
  NAND3_X1 \byte_controller/U94  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n70 ), .A3(\byte_controller/n21 ), .ZN(
        \byte_controller/n76 ) );
  NAND2_X1 \byte_controller/U93  ( .A1(\byte_controller/n72 ), .A2(
        \byte_controller/n147 ), .ZN(\byte_controller/n141 ) );
  AOI21_X1 \byte_controller/U92  ( .B1(\byte_controller/n68 ), .B2(
        \byte_controller/n4 ), .A(\byte_controller/n67 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U91  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n3 ), .ZN(\byte_controller/n68 ) );
  NAND2_X1 \byte_controller/U90  ( .A1(\byte_controller/n130 ), .A2(
        \byte_controller/n65 ), .ZN(\byte_controller/n91 ) );
  NAND3_X1 \byte_controller/U89  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n64 ), .A3(\byte_controller/n23 ), .ZN(
        \byte_controller/n65 ) );
  NAND2_X1 \byte_controller/U88  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n2 ), .ZN(\byte_controller/n130 ) );
  OAI21_X1 \byte_controller/U87  ( .B1(\byte_controller/n3 ), .B2(
        \byte_controller/n26 ), .A(\byte_controller/n62 ), .ZN(
        \byte_controller/n63 ) );
  NAND4_X1 \byte_controller/U86  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n16 ), .A3(\byte_controller/n59 ), .A4(
        \byte_controller/n58 ), .ZN(\byte_controller/n62 ) );
  INV_X1 \byte_controller/U85  ( .A(cr[7]), .ZN(\byte_controller/n58 ) );
  NAND2_X1 \byte_controller/U84  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/n131 ), .ZN(\byte_controller/n85 ) );
  OAI211_X1 \byte_controller/U83  ( .C1(\byte_controller/n140 ), .C2(
        \byte_controller/n148 ), .A(\byte_controller/n71 ), .B(
        \byte_controller/c_state [2]), .ZN(\byte_controller/n57 ) );
  NAND4_X1 \byte_controller/U82  ( .A1(\byte_controller/n69 ), .A2(
        \byte_controller/n56 ), .A3(\byte_controller/n55 ), .A4(
        \byte_controller/n71 ), .ZN(\byte_controller/n131 ) );
  AOI21_X1 \byte_controller/U81  ( .B1(\byte_controller/n16 ), .B2(
        \byte_controller/n54 ), .A(\byte_controller/n20 ), .ZN(
        \byte_controller/n55 ) );
  OAI221_X1 \byte_controller/U80  ( .B1(\byte_controller/n53 ), .B2(
        \byte_controller/n116 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n52 ), .A(\byte_controller/n78 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U79  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n5 ), .A(\byte_controller/n72 ), .ZN(
        \byte_controller/n53 ) );
  INV_X1 \byte_controller/U78  ( .A(\byte_controller/n140 ), .ZN(
        \byte_controller/n72 ) );
  OAI211_X1 \byte_controller/U77  ( .C1(\byte_controller/n49 ), .C2(
        \byte_controller/n52 ), .A(\byte_controller/n51 ), .B(
        \byte_controller/n78 ), .ZN(\byte_controller/n90 ) );
  NAND3_X1 \byte_controller/U76  ( .A1(\byte_controller/n50 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n49 ), .ZN(
        \byte_controller/n51 ) );
  OAI21_X1 \byte_controller/U75  ( .B1(\byte_controller/n48 ), .B2(
        \byte_controller/n116 ), .A(\byte_controller/n77 ), .ZN(
        \byte_controller/n52 ) );
  NAND2_X1 \byte_controller/U74  ( .A1(\byte_controller/n78 ), .A2(
        \byte_controller/n47 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U73  ( .A(\byte_controller/n46 ), .B(
        \byte_controller/n48 ), .S(\byte_controller/n50 ), .Z(
        \byte_controller/n47 ) );
  INV_X1 \byte_controller/U72  ( .A(\byte_controller/n116 ), .ZN(
        \byte_controller/n50 ) );
  NAND2_X1 \byte_controller/U71  ( .A1(\byte_controller/n77 ), .A2(
        \byte_controller/n48 ), .ZN(\byte_controller/n46 ) );
  NAND2_X1 \byte_controller/U70  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n77 ), .ZN(\byte_controller/n78 ) );
  AOI21_X1 \byte_controller/U69  ( .B1(\byte_controller/n133 ), .B2(
        \byte_controller/n24 ), .A(\byte_controller/n67 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U68  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n140 ), .ZN(\byte_controller/n133 ) );
  OAI21_X1 \byte_controller/U67  ( .B1(\byte_controller/n54 ), .B2(
        \byte_controller/n67 ), .A(\byte_controller/n45 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U66  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n23 ), .A3(\byte_controller/n44 ), .A4(
        \byte_controller/n43 ), .ZN(\byte_controller/n45 ) );
  NAND2_X1 \byte_controller/U65  ( .A1(\byte_controller/n25 ), .A2(
        \byte_controller/n11 ), .ZN(\byte_controller/n67 ) );
  NAND2_X1 \byte_controller/U64  ( .A1(\byte_controller/n42 ), .A2(
        \byte_controller/n150 ), .ZN(\byte_controller/n86 ) );
  OAI211_X1 \byte_controller/U63  ( .C1(\byte_controller/n140 ), .C2(
        \byte_controller/n148 ), .A(\byte_controller/n25 ), .B(
        \byte_controller/c_state [1]), .ZN(\byte_controller/n42 ) );
  MUX2_X1 \byte_controller/U62  ( .A(\byte_controller/n118 ), .B(
        \byte_controller/n41 ), .S(\byte_controller/n61 ), .Z(
        \byte_controller/n148 ) );
  NAND3_X1 \byte_controller/U61  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n49 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n140 ) );
  NAND4_X1 \byte_controller/U60  ( .A1(\byte_controller/n69 ), .A2(
        \byte_controller/n56 ), .A3(\byte_controller/n20 ), .A4(
        \byte_controller/n25 ), .ZN(\byte_controller/n150 ) );
  OAI21_X1 \byte_controller/U59  ( .B1(cr[7]), .B2(\byte_controller/n40 ), .A(
        \byte_controller/n54 ), .ZN(\byte_controller/n56 ) );
  NAND3_X1 \byte_controller/U58  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/c_state [0]), .A3(\byte_controller/n25 ), .ZN(
        \byte_controller/n39 ) );
  NAND2_X1 \byte_controller/U57  ( .A1(\byte_controller/n38 ), .A2(
        \byte_controller/n43 ), .ZN(\byte_controller/n41 ) );
  INV_X1 \byte_controller/U56  ( .A(done), .ZN(\byte_controller/n43 ) );
  NAND3_X1 \byte_controller/U55  ( .A1(\byte_controller/n60 ), .A2(
        \byte_controller/n59 ), .A3(\byte_controller/n66 ), .ZN(
        \byte_controller/n38 ) );
  INV_X1 \byte_controller/U54  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n118 ) );
  NAND3_X1 \byte_controller/U53  ( .A1(\byte_controller/n27 ), .A2(
        \byte_controller/n33 ), .A3(cr[7]), .ZN(\byte_controller/n127 ) );
  NAND2_X1 \byte_controller/U52  ( .A1(\byte_controller/n139 ), .A2(
        \byte_controller/n138 ), .ZN(\byte_controller/n69 ) );
  NAND3_X1 \byte_controller/U51  ( .A1(\byte_controller/n30 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n37 ) );
  NAND2_X1 \byte_controller/U50  ( .A1(\byte_controller/n36 ), .A2(
        \byte_controller/n44 ), .ZN(\byte_controller/n139 ) );
  NAND3_X1 \byte_controller/U49  ( .A1(\byte_controller/n66 ), .A2(
        \byte_controller/n59 ), .A3(\byte_controller/n60 ), .ZN(
        \byte_controller/n44 ) );
  INV_X1 \byte_controller/U48  ( .A(cr[6]), .ZN(\byte_controller/n66 ) );
  INV_X1 \byte_controller/U47  ( .A(cr[5]), .ZN(\byte_controller/n59 ) );
  INV_X1 \byte_controller/U46  ( .A(cr[4]), .ZN(\byte_controller/n60 ) );
  INV_X1 \byte_controller/U45  ( .A(\byte_controller/n155 ), .ZN(
        \byte_controller/n147 ) );
  INV_X1 \byte_controller/U44  ( .A(wb_rst_i), .ZN(\byte_controller/n77 ) );
  INV_X1 \byte_controller/U43  ( .A(i2c_al), .ZN(\byte_controller/n35 ) );
  INV_X1 \byte_controller/U42  ( .A(\byte_controller/n40 ), .ZN(
        \byte_controller/n61 ) );
  NAND3_X1 \byte_controller/U41  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/n54 ), .ZN(
        \byte_controller/n40 ) );
  AND3_X1 \byte_controller/U40  ( .A1(\byte_controller/n121 ), .A2(
        \byte_controller/n122 ), .A3(\byte_controller/n119 ), .ZN(
        \byte_controller/n34 ) );
  AND4_X1 \byte_controller/U39  ( .A1(\byte_controller/n30 ), .A2(
        \byte_controller/n32 ), .A3(\byte_controller/n24 ), .A4(
        \byte_controller/n54 ), .ZN(\byte_controller/n36 ) );
  INV_X1 \byte_controller/U38  ( .A(\byte_controller/n155 ), .ZN(
        \byte_controller/n71 ) );
  AND3_X1 \byte_controller/U37  ( .A1(\byte_controller/n128 ), .A2(
        \byte_controller/n71 ), .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/n136 ) );
  NAND2_X1 \byte_controller/U36  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n127 ), .ZN(\byte_controller/n87 ) );
  BUF_X2 \byte_controller/U35  ( .A(arst_i), .Z(\byte_controller/n31 ) );
  MUX2_X1 \byte_controller/U34  ( .A(\byte_controller/n153 ), .B(
        \byte_controller/n154 ), .S(\byte_controller/n152 ), .Z(
        \byte_controller/n156 ) );
  NAND2_X1 \byte_controller/U33  ( .A1(\byte_controller/n1 ), .A2(
        \byte_controller/n37 ), .ZN(\byte_controller/n138 ) );
  NAND2_X1 \byte_controller/U32  ( .A1(\byte_controller/n2 ), .A2(
        \byte_controller/n73 ), .ZN(\byte_controller/n74 ) );
  AND3_X1 \byte_controller/U31  ( .A1(\byte_controller/n121 ), .A2(
        \byte_controller/n122 ), .A3(\byte_controller/n119 ), .ZN(
        \byte_controller/n30 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/n134 ), .ZN(
        \byte_controller/n73 ) );
  AND2_X1 \byte_controller/U29  ( .A1(\byte_controller/n139 ), .A2(
        \byte_controller/n138 ), .ZN(\byte_controller/n29 ) );
  INV_X1 \byte_controller/U28  ( .A(\byte_controller/n141 ), .ZN(
        \byte_controller/n70 ) );
  CLKBUF_X1 \byte_controller/U27  ( .A(\byte_controller/n119 ), .Z(
        \byte_controller/n26 ) );
  MUX2_X1 \byte_controller/U26  ( .A(\byte_controller/n41 ), .B(
        \byte_controller/n118 ), .S(\byte_controller/n40 ), .Z(
        \byte_controller/n128 ) );
  NAND2_X2 \byte_controller/U25  ( .A1(\byte_controller/n35 ), .A2(
        \byte_controller/n77 ), .ZN(\byte_controller/n155 ) );
  INV_X1 \byte_controller/U24  ( .A(\byte_controller/n155 ), .ZN(
        \byte_controller/n25 ) );
  INV_X1 \byte_controller/U23  ( .A(\byte_controller/n155 ), .ZN(
        \byte_controller/n23 ) );
  INV_X1 \byte_controller/U22  ( .A(\byte_controller/n132 ), .ZN(
        \byte_controller/n22 ) );
  BUF_X1 \byte_controller/U21  ( .A(\byte_controller/n61 ), .Z(
        \byte_controller/n33 ) );
  INV_X1 \byte_controller/U20  ( .A(\byte_controller/n29 ), .ZN(
        \byte_controller/n21 ) );
  CLKBUF_X1 \byte_controller/U19  ( .A(cr[5]), .Z(\byte_controller/n20 ) );
  CLKBUF_X1 \byte_controller/U18  ( .A(\byte_controller/n139 ), .Z(
        \byte_controller/n19 ) );
  CLKBUF_X1 \byte_controller/U17  ( .A(\byte_controller/n138 ), .Z(
        \byte_controller/n17 ) );
  INV_X1 \byte_controller/U16  ( .A(\byte_controller/n14 ), .ZN(
        \byte_controller/n16 ) );
  OR3_X2 \byte_controller/U15  ( .A1(\byte_controller/n28 ), .A2(
        \byte_controller/n155 ), .A3(\byte_controller/n132 ), .ZN(
        \byte_controller/n129 ) );
  CLKBUF_X1 \byte_controller/U14  ( .A(cr[4]), .Z(\byte_controller/n14 ) );
  BUF_X1 \byte_controller/U13  ( .A(\byte_controller/n117 ), .Z(
        \byte_controller/n13 ) );
  BUF_X1 \byte_controller/U12  ( .A(\byte_controller/n117 ), .Z(
        \byte_controller/n12 ) );
  INV_X1 \byte_controller/U11  ( .A(\byte_controller/n118 ), .ZN(
        \byte_controller/n11 ) );
  BUF_X1 \byte_controller/U10  ( .A(\byte_controller/n117 ), .Z(
        \byte_controller/n10 ) );
  BUF_X1 \byte_controller/U9  ( .A(\byte_controller/n117 ), .Z(
        \byte_controller/n9 ) );
  NAND3_X2 \byte_controller/U8  ( .A1(\byte_controller/n7 ), .A2(
        \byte_controller/n77 ), .A3(\byte_controller/n8 ), .ZN(
        \byte_controller/n116 ) );
  INV_X1 \byte_controller/U7  ( .A(\byte_controller/n64 ), .ZN(
        \byte_controller/n4 ) );
  INV_X1 \byte_controller/U6  ( .A(cr[6]), .ZN(\byte_controller/n3 ) );
  AND2_X1 \byte_controller/U5  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n69 ), .ZN(\byte_controller/n27 ) );
  AND2_X1 \byte_controller/U4  ( .A1(\byte_controller/n23 ), .A2(
        \byte_controller/n69 ), .ZN(\byte_controller/n2 ) );
  INV_X1 \byte_controller/U3  ( .A(\byte_controller/n118 ), .ZN(
        \byte_controller/n1 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(
        \byte_controller/core_cmd [0]) );
  DFFR_X2 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n28 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/n64 ), .QN(
        \byte_controller/n121 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/c_state [0]), .QN(\byte_controller/n54 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [2]), .QN(
        \byte_controller/n122 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/n48 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/n7 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n31 ), .Q(\byte_controller/ld ), .QN(
        \byte_controller/n8 ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n154 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[0]), .QN(
        \byte_controller/n102 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[1]), .QN(
        \byte_controller/n104 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[2]), .QN(
        \byte_controller/n106 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[3]), .QN(
        \byte_controller/n108 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[4]), .QN(
        \byte_controller/n110 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[5]), .QN(
        \byte_controller/n112 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[6]), .QN(
        \byte_controller/n115 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n90 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n49 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n119 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n24 ) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(done), .QN(
        \byte_controller/n32 ) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(\byte_controller/n31 ), .Q(\byte_controller/n5 ), .QN(
        \byte_controller/n15 ) );
  AOI21_X1 \byte_controller/bit_controller/U163  ( .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n203 ), .A(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/N174 ) );
  NOR3_X1 \byte_controller/bit_controller/U162  ( .A1(
        \byte_controller/bit_controller/n201 ), .A2(
        \byte_controller/bit_controller/n200 ), .A3(
        \byte_controller/bit_controller/n15 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  AOI211_X1 \byte_controller/bit_controller/U161  ( .C1(
        \byte_controller/bit_controller/n85 ), .C2(
        \byte_controller/bit_controller/n84 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N78 ) );
  NOR3_X1 \byte_controller/bit_controller/U160  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n108 ), .A3(
        \byte_controller/bit_controller/N72 ), .ZN(
        \byte_controller/bit_controller/N75 ) );
  MUX2_X1 \byte_controller/bit_controller/U159  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n199 ), .S(
        \byte_controller/bit_controller/n198 ), .Z(
        \byte_controller/bit_controller/n129 ) );
  AOI21_X1 \byte_controller/bit_controller/U158  ( .B1(
        \byte_controller/bit_controller/n20 ), .B2(
        \byte_controller/bit_controller/n197 ), .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  OAI211_X1 \byte_controller/bit_controller/U157  ( .C1(
        \byte_controller/bit_controller/n11 ), .C2(
        \byte_controller/bit_controller/n196 ), .A(
        \byte_controller/bit_controller/n195 ), .B(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  NOR2_X1 \byte_controller/bit_controller/U156  ( .A1(
        \byte_controller/bit_controller/n193 ), .A2(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n194 ) );
  NOR4_X1 \byte_controller/bit_controller/U155  ( .A1(
        \byte_controller/core_txd ), .A2(\byte_controller/bit_controller/n191 ), .A3(\byte_controller/bit_controller/n59 ), .A4(
        \byte_controller/bit_controller/n68 ), .ZN(
        \byte_controller/bit_controller/n196 ) );
  OAI21_X1 \byte_controller/bit_controller/U154  ( .B1(
        \byte_controller/bit_controller/n126 ), .B2(
        \byte_controller/bit_controller/n75 ), .A(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n160 ) );
  NAND4_X1 \byte_controller/bit_controller/U153  ( .A1(
        \byte_controller/bit_controller/n66 ), .A2(
        \byte_controller/bit_controller/n188 ), .A3(
        \byte_controller/bit_controller/n187 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n189 ) );
  OAI33_X1 \byte_controller/bit_controller/U152  ( .A1(
        \byte_controller/bit_controller/n186 ), .A2(
        \byte_controller/bit_controller/n185 ), .A3(
        \byte_controller/bit_controller/n184 ), .B1(
        \byte_controller/bit_controller/n128 ), .B2(
        \byte_controller/bit_controller/N72 ), .B3(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/N86 ) );
  OAI22_X1 \byte_controller/bit_controller/U151  ( .A1(
        \byte_controller/bit_controller/n181 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n128 ), .B2(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  INV_X1 \byte_controller/bit_controller/U150  ( .A(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n181 ) );
  NOR2_X1 \byte_controller/bit_controller/U149  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n162 ) );
  MUX2_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n178 ), .B(
        \byte_controller/bit_controller/n109 ), .S(
        \byte_controller/bit_controller/n89 ), .Z(
        \byte_controller/bit_controller/n179 ) );
  NAND2_X1 \byte_controller/bit_controller/U147  ( .A1(
        \byte_controller/bit_controller/n177 ), .A2(
        \byte_controller/bit_controller/n176 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U146  ( .A(
        \byte_controller/bit_controller/n175 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  AOI21_X1 \byte_controller/bit_controller/U145  ( .B1(
        \byte_controller/bit_controller/n174 ), .B2(
        \byte_controller/bit_controller/n182 ), .A(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n215 ) );
  INV_X1 \byte_controller/bit_controller/U144  ( .A(
        \byte_controller/bit_controller/n173 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  AOI222_X1 \byte_controller/bit_controller/U143  ( .A1(
        \byte_controller/bit_controller/N46 ), .A2(
        \byte_controller/bit_controller/n70 ), .B1(
        \byte_controller/bit_controller/n33 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(
        \byte_controller/bit_controller/n171 ), .C2(prer[15]), .ZN(
        \byte_controller/bit_controller/n173 ) );
  INV_X1 \byte_controller/bit_controller/U142  ( .A(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n214 ) );
  AOI222_X1 \byte_controller/bit_controller/U141  ( .A1(
        \byte_controller/bit_controller/n171 ), .A2(prer[0]), .B1(
        \byte_controller/bit_controller/n33 ), .B2(
        \byte_controller/bit_controller/n2 ), .C1(
        \byte_controller/bit_controller/N31 ), .C2(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  INV_X1 \byte_controller/bit_controller/U140  ( .A(
        \byte_controller/bit_controller/n169 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  AOI222_X1 \byte_controller/bit_controller/U139  ( .A1(prer[1]), .A2(
        \byte_controller/bit_controller/n65 ), .B1(
        \byte_controller/bit_controller/n33 ), .B2(
        \byte_controller/bit_controller/cnt [1]), .C1(
        \byte_controller/bit_controller/n69 ), .C2(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  INV_X1 \byte_controller/bit_controller/U138  ( .A(
        \byte_controller/bit_controller/n168 ), .ZN(
        \byte_controller/bit_controller/n212 ) );
  AOI222_X1 \byte_controller/bit_controller/U137  ( .A1(prer[2]), .A2(
        \byte_controller/bit_controller/n32 ), .B1(
        \byte_controller/bit_controller/n60 ), .B2(
        \byte_controller/bit_controller/n3 ), .C1(
        \byte_controller/bit_controller/N33 ), .C2(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  INV_X1 \byte_controller/bit_controller/U136  ( .A(
        \byte_controller/bit_controller/n167 ), .ZN(
        \byte_controller/bit_controller/n211 ) );
  AOI222_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/n171 ), .A2(prer[3]), .B1(
        \byte_controller/bit_controller/n33 ), .B2(
        \byte_controller/bit_controller/cnt [3]), .C1(
        \byte_controller/bit_controller/N34 ), .C2(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  INV_X1 \byte_controller/bit_controller/U134  ( .A(
        \byte_controller/bit_controller/n166 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  AOI222_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/N36 ), .A2(
        \byte_controller/bit_controller/n70 ), .B1(
        \byte_controller/bit_controller/n65 ), .B2(prer[5]), .C1(
        \byte_controller/bit_controller/n60 ), .C2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/n166 ) );
  INV_X1 \byte_controller/bit_controller/U132  ( .A(
        \byte_controller/bit_controller/n164 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  AOI222_X1 \byte_controller/bit_controller/U131  ( .A1(prer[7]), .A2(
        \byte_controller/bit_controller/n65 ), .B1(
        \byte_controller/bit_controller/n33 ), .B2(
        \byte_controller/bit_controller/cnt [7]), .C1(
        \byte_controller/bit_controller/N38 ), .C2(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  OAI21_X1 \byte_controller/bit_controller/U130  ( .B1(
        \byte_controller/bit_controller/n9 ), .B2(
        \byte_controller/bit_controller/n97 ), .A(
        \byte_controller/bit_controller/n144 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  AOI22_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n1 ), .B1(prer[8]), .B2(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  INV_X1 \byte_controller/bit_controller/U128  ( .A(
        \byte_controller/bit_controller/n143 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  AOI222_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n16 ), .B1(prer[9]), .B2(
        \byte_controller/bit_controller/n32 ), .C1(
        \byte_controller/bit_controller/n60 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n143 ) );
  INV_X1 \byte_controller/bit_controller/U126  ( .A(
        \byte_controller/bit_controller/n142 ), .ZN(
        \byte_controller/bit_controller/n134 ) );
  AOI222_X1 \byte_controller/bit_controller/U125  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n70 ), .B1(
        \byte_controller/bit_controller/n65 ), .B2(prer[10]), .C1(
        \byte_controller/bit_controller/n60 ), .C2(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  INV_X1 \byte_controller/bit_controller/U124  ( .A(
        \byte_controller/bit_controller/n141 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  AOI222_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n16 ), .B1(
        \byte_controller/bit_controller/n32 ), .B2(prer[11]), .C1(
        \byte_controller/bit_controller/n172 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n141 ) );
  INV_X1 \byte_controller/bit_controller/U122  ( .A(
        \byte_controller/bit_controller/n140 ), .ZN(
        \byte_controller/bit_controller/n132 ) );
  AOI222_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n1 ), .B1(
        \byte_controller/bit_controller/n171 ), .B2(prer[12]), .C1(
        \byte_controller/bit_controller/n172 ), .C2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  INV_X1 \byte_controller/bit_controller/U120  ( .A(
        \byte_controller/bit_controller/n139 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  AOI222_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/N44 ), .A2(
        \byte_controller/bit_controller/n16 ), .B1(
        \byte_controller/bit_controller/n33 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(
        \byte_controller/bit_controller/n65 ), .C2(prer[13]), .ZN(
        \byte_controller/bit_controller/n139 ) );
  INV_X1 \byte_controller/bit_controller/U118  ( .A(
        \byte_controller/bit_controller/n138 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  AOI222_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/N45 ), .A2(
        \byte_controller/bit_controller/n1 ), .B1(
        \byte_controller/bit_controller/n33 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(
        \byte_controller/bit_controller/n171 ), .C2(prer[14]), .ZN(
        \byte_controller/bit_controller/n138 ) );
  NAND2_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n17 ), .A2(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  INV_X1 \byte_controller/bit_controller/U115  ( .A(
        \byte_controller/bit_controller/n63 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  NAND2_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/N71 ) );
  AOI21_X1 \byte_controller/bit_controller/U113  ( .B1(
        \byte_controller/bit_controller/n99 ), .B2(
        \byte_controller/bit_controller/n190 ), .A(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n100 ) );
  AOI211_X1 \byte_controller/bit_controller/U112  ( .C1(
        \byte_controller/bit_controller/n95 ), .C2(
        \byte_controller/bit_controller/n47 ), .A(
        \byte_controller/bit_controller/n13 ), .B(
        \byte_controller/bit_controller/n193 ), .ZN(
        \byte_controller/bit_controller/n96 ) );
  OAI21_X1 \byte_controller/bit_controller/U111  ( .B1(
        \byte_controller/bit_controller/n61 ), .B2(
        \byte_controller/bit_controller/n193 ), .A(
        \byte_controller/bit_controller/n197 ), .ZN(
        \byte_controller/bit_controller/n99 ) );
  INV_X1 \byte_controller/bit_controller/U110  ( .A(
        \byte_controller/bit_controller/n202 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  NAND2_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n195 ), .A2(
        \byte_controller/bit_controller/n14 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  NAND3_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n116 ), .A3(
        \byte_controller/bit_controller/n118 ), .ZN(
        \byte_controller/bit_controller/n191 ) );
  OAI22_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/bit_controller/n117 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n116 ), .B2(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI21_X1 \byte_controller/bit_controller/U106  ( .B1(
        \byte_controller/bit_controller/n117 ), .B2(
        \byte_controller/bit_controller/n76 ), .A(
        \byte_controller/bit_controller/n92 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  NAND4_X1 \byte_controller/bit_controller/U105  ( .A1(
        \byte_controller/bit_controller/n20 ), .A2(
        \byte_controller/bit_controller/n39 ), .A3(
        \byte_controller/core_cmd [3]), .A4(
        \byte_controller/bit_controller/n91 ), .ZN(
        \byte_controller/bit_controller/n92 ) );
  NOR3_X1 \byte_controller/bit_controller/U104  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n91 ) );
  OAI22_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n114 ), .B2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI22_X1 \byte_controller/bit_controller/U102  ( .A1(
        \byte_controller/bit_controller/n116 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n115 ), .B2(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  OAI22_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n110 ), .B2(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  OAI22_X1 \byte_controller/bit_controller/U100  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n111 ), .B2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  OAI22_X1 \byte_controller/bit_controller/U99  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n112 ), .B2(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI21_X1 \byte_controller/bit_controller/U98  ( .B1(
        \byte_controller/bit_controller/n113 ), .B2(
        \byte_controller/bit_controller/n75 ), .A(
        \byte_controller/bit_controller/n90 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  NAND4_X1 \byte_controller/bit_controller/U97  ( .A1(
        \byte_controller/bit_controller/n12 ), .A2(
        \byte_controller/bit_controller/n88 ), .A3(
        \byte_controller/bit_controller/n187 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n90 ) );
  INV_X1 \byte_controller/bit_controller/U96  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n187 ) );
  OAI22_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n118 ), .B2(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U94  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U93  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n123 ), .B2(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OAI22_X1 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n124 ), .B2(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n158 ) );
  OAI22_X1 \byte_controller/bit_controller/U91  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n125 ), .B2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  OAI22_X1 \byte_controller/bit_controller/U90  ( .A1(
        \byte_controller/bit_controller/n120 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n75 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  OAI22_X1 \byte_controller/bit_controller/U89  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n62 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U88  ( .A1(
        \byte_controller/bit_controller/n87 ), .A2(
        \byte_controller/bit_controller/n175 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  NAND3_X1 \byte_controller/bit_controller/U87  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n88 ), .A3(
        \byte_controller/bit_controller/n188 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  INV_X1 \byte_controller/bit_controller/U86  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n188 ) );
  INV_X1 \byte_controller/bit_controller/U85  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n88 ) );
  NAND3_X1 \byte_controller/bit_controller/U84  ( .A1(
        \byte_controller/bit_controller/n20 ), .A2(
        \byte_controller/bit_controller/n39 ), .A3(
        \byte_controller/bit_controller/n176 ), .ZN(
        \byte_controller/bit_controller/n87 ) );
  INV_X1 \byte_controller/bit_controller/U83  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n176 ) );
  NOR4_X1 \byte_controller/bit_controller/U82  ( .A1(
        \byte_controller/bit_controller/n80 ), .A2(
        \byte_controller/bit_controller/n68 ), .A3(
        \byte_controller/bit_controller/n67 ), .A4(
        \byte_controller/bit_controller/n79 ), .ZN(
        \byte_controller/bit_controller/n81 ) );
  NOR4_X1 \byte_controller/bit_controller/U81  ( .A1(
        \byte_controller/bit_controller/n180 ), .A2(
        \byte_controller/bit_controller/n201 ), .A3(
        \byte_controller/bit_controller/n200 ), .A4(
        \byte_controller/bit_controller/n59 ), .ZN(
        \byte_controller/bit_controller/n82 ) );
  NAND2_X1 \byte_controller/bit_controller/U80  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/n180 ) );
  INV_X1 \byte_controller/bit_controller/U79  ( .A(
        \byte_controller/bit_controller/n93 ), .ZN(
        \byte_controller/bit_controller/n95 ) );
  NAND3_X1 \byte_controller/bit_controller/U78  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n124 ), .A3(
        \byte_controller/bit_controller/n78 ), .ZN(
        \byte_controller/bit_controller/n93 ) );
  NAND2_X1 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n83 ), .A2(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n94 ) );
  NOR4_X1 \byte_controller/bit_controller/U76  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n107 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n77 ), .ZN(
        \byte_controller/bit_controller/N76 ) );
  OR2_X1 \byte_controller/bit_controller/U75  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N69 ) );
  NAND2_X1 \byte_controller/bit_controller/U74  ( .A1(
        \byte_controller/bit_controller/n107 ), .A2(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  INV_X1 \byte_controller/bit_controller/U73  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n182 ) );
  OR2_X1 \byte_controller/bit_controller/U72  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N70 ) );
  NAND2_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n75 ) );
  AND2_X1 \byte_controller/bit_controller/U70  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n69 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  AND2_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n172 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n72 ) );
  AND2_X1 \byte_controller/bit_controller/U68  ( .A1(
        \byte_controller/bit_controller/n32 ), .A2(prer[6]), .ZN(
        \byte_controller/bit_controller/n71 ) );
  INV_X1 \byte_controller/bit_controller/U67  ( .A(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  INV_X1 \byte_controller/bit_controller/U66  ( .A(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n65 ) );
  AND2_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n82 ), .A2(
        \byte_controller/bit_controller/n81 ), .ZN(
        \byte_controller/bit_controller/n64 ) );
  NAND4_X1 \byte_controller/bit_controller/U64  ( .A1(
        \byte_controller/bit_controller/n131 ), .A2(
        \byte_controller/bit_controller/n130 ), .A3(
        \byte_controller/bit_controller/n127 ), .A4(
        \byte_controller/bit_controller/n105 ), .ZN(
        \byte_controller/bit_controller/n133 ) );
  OAI21_X1 \byte_controller/bit_controller/U63  ( .B1(
        \byte_controller/bit_controller/n133 ), .B2(
        \byte_controller/bit_controller/n10 ), .A(ctr[7]), .ZN(
        \byte_controller/bit_controller/n63 ) );
  NAND2_X2 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n195 ), .A2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n62 ) );
  INV_X1 \byte_controller/bit_controller/U61  ( .A(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  INV_X1 \byte_controller/bit_controller/U60  ( .A(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n60 ) );
  NAND4_X1 \byte_controller/bit_controller/U59  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n103 ), .A3(
        \byte_controller/bit_controller/n102 ), .A4(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  AND3_X1 \byte_controller/bit_controller/U58  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n119 ), .ZN(
        \byte_controller/bit_controller/n78 ) );
  NAND4_X1 \byte_controller/bit_controller/U57  ( .A1(
        \byte_controller/bit_controller/n130 ), .A2(
        \byte_controller/bit_controller/n131 ), .A3(
        \byte_controller/bit_controller/n127 ), .A4(
        \byte_controller/bit_controller/n105 ), .ZN(
        \byte_controller/bit_controller/n58 ) );
  NAND2_X1 \byte_controller/bit_controller/U56  ( .A1(
        \byte_controller/bit_controller/n86 ), .A2(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n50 ) );
  MUX2_X1 \byte_controller/bit_controller/U55  ( .A(
        \byte_controller/bit_controller/n49 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n50 ), .Z(
        \byte_controller/bit_controller/n48 ) );
  AND2_X1 \byte_controller/bit_controller/U54  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n122 ), .ZN(
        \byte_controller/bit_controller/n47 ) );
  NOR2_X1 \byte_controller/bit_controller/U53  ( .A1(
        \byte_controller/bit_controller/n137 ), .A2(
        \byte_controller/bit_controller/N71 ), .ZN(
        \byte_controller/bit_controller/n46 ) );
  OR4_X1 \byte_controller/bit_controller/U52  ( .A1(
        \byte_controller/bit_controller/n94 ), .A2(
        \byte_controller/bit_controller/n180 ), .A3(
        \byte_controller/bit_controller/n191 ), .A4(
        \byte_controller/bit_controller/n93 ), .ZN(
        \byte_controller/bit_controller/n45 ) );
  MUX2_X1 \byte_controller/bit_controller/U51  ( .A(
        \byte_controller/bit_controller/n45 ), .B(scl_padoen_o), .S(
        \byte_controller/bit_controller/n100 ), .Z(
        \byte_controller/bit_controller/n44 ) );
  NAND2_X1 \byte_controller/bit_controller/U50  ( .A1(
        \byte_controller/bit_controller/N35 ), .A2(
        \byte_controller/bit_controller/n16 ), .ZN(
        \byte_controller/bit_controller/n43 ) );
  NAND2_X1 \byte_controller/bit_controller/U49  ( .A1(
        \byte_controller/bit_controller/n172 ), .A2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/n42 ) );
  NAND2_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n171 ), .A2(prer[4]), .ZN(
        \byte_controller/bit_controller/n41 ) );
  NAND3_X1 \byte_controller/bit_controller/U47  ( .A1(
        \byte_controller/bit_controller/n41 ), .A2(
        \byte_controller/bit_controller/n42 ), .A3(
        \byte_controller/bit_controller/n43 ), .ZN(
        \byte_controller/bit_controller/n57 ) );
  AND2_X1 \byte_controller/bit_controller/U46  ( .A1(
        \byte_controller/bit_controller/n97 ), .A2(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n104 ) );
  BUF_X1 \byte_controller/bit_controller/U45  ( .A(\byte_controller/n31 ), .Z(
        \byte_controller/bit_controller/n51 ) );
  AND2_X1 \byte_controller/bit_controller/U44  ( .A1(
        \byte_controller/bit_controller/n195 ), .A2(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n39 ) );
  INV_X1 \byte_controller/bit_controller/U43  ( .A(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n195 ) );
  BUF_X1 \byte_controller/bit_controller/U42  ( .A(
        \byte_controller/bit_controller/n51 ), .Z(
        \byte_controller/bit_controller/n56 ) );
  BUF_X1 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n56 ), .Z(
        \byte_controller/bit_controller/n52 ) );
  BUF_X1 \byte_controller/bit_controller/U40  ( .A(
        \byte_controller/bit_controller/n51 ), .Z(
        \byte_controller/bit_controller/n55 ) );
  BUF_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n55 ), .Z(
        \byte_controller/bit_controller/n53 ) );
  BUF_X1 \byte_controller/bit_controller/U38  ( .A(
        \byte_controller/bit_controller/n55 ), .Z(
        \byte_controller/bit_controller/n54 ) );
  OAI211_X1 \byte_controller/bit_controller/U37  ( .C1(
        \byte_controller/bit_controller/n5 ), .C2(
        \byte_controller/bit_controller/n137 ), .A(
        \byte_controller/bit_controller/n17 ), .B(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  AND2_X1 \byte_controller/bit_controller/U36  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n127 ) );
  INV_X1 \byte_controller/bit_controller/U35  ( .A(
        \byte_controller/bit_controller/n163 ), .ZN(
        \byte_controller/bit_controller/n33 ) );
  INV_X1 \byte_controller/bit_controller/U34  ( .A(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  AND2_X1 \byte_controller/bit_controller/U33  ( .A1(
        \byte_controller/bit_controller/n30 ), .A2(
        \byte_controller/bit_controller/n31 ), .ZN(
        \byte_controller/bit_controller/n105 ) );
  AND2_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n38 ), .A2(
        \byte_controller/bit_controller/n36 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AND4_X1 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n126 ), .A3(
        \byte_controller/bit_controller/n95 ), .A4(
        \byte_controller/bit_controller/n47 ), .ZN(
        \byte_controller/bit_controller/n74 ) );
  AND2_X1 \byte_controller/bit_controller/U30  ( .A1(
        \byte_controller/bit_controller/n18 ), .A2(
        \byte_controller/bit_controller/n24 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  NOR2_X1 \byte_controller/bit_controller/U29  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n69 ) );
  OAI21_X1 \byte_controller/bit_controller/U28  ( .B1(
        \byte_controller/bit_controller/n58 ), .B2(
        \byte_controller/bit_controller/n136 ), .A(ctr[7]), .ZN(
        \byte_controller/bit_controller/n17 ) );
  AND2_X2 \byte_controller/bit_controller/U27  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n16 ) );
  INV_X1 \byte_controller/bit_controller/U26  ( .A(
        \byte_controller/bit_controller/n114 ), .ZN(
        \byte_controller/bit_controller/n15 ) );
  NOR2_X1 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n14 ), .A2(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n13 ) );
  AND2_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n19 ), .A2(
        \byte_controller/bit_controller/n23 ), .ZN(
        \byte_controller/bit_controller/n101 ) );
  AND2_X1 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/n28 ), .ZN(
        \byte_controller/bit_controller/n102 ) );
  OR2_X2 \byte_controller/bit_controller/U22  ( .A1(
        \byte_controller/bit_controller/n14 ), .A2(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n76 ) );
  AND2_X1 \byte_controller/bit_controller/U21  ( .A1(
        \byte_controller/bit_controller/n26 ), .A2(
        \byte_controller/bit_controller/n29 ), .ZN(
        \byte_controller/bit_controller/n103 ) );
  AND3_X1 \byte_controller/bit_controller/U20  ( .A1(
        \byte_controller/bit_controller/n74 ), .A2(
        \byte_controller/bit_controller/n39 ), .A3(
        \byte_controller/bit_controller/n176 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  AND3_X1 \byte_controller/bit_controller/U19  ( .A1(
        \byte_controller/bit_controller/n74 ), .A2(
        \byte_controller/bit_controller/n39 ), .A3(
        \byte_controller/bit_controller/n176 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  BUF_X1 \byte_controller/bit_controller/U18  ( .A(
        \byte_controller/bit_controller/n64 ), .Z(
        \byte_controller/bit_controller/n61 ) );
  NAND4_X1 \byte_controller/bit_controller/U17  ( .A1(
        \byte_controller/bit_controller/n7 ), .A2(
        \byte_controller/bit_controller/n103 ), .A3(
        \byte_controller/bit_controller/n6 ), .A4(
        \byte_controller/bit_controller/n8 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  BUF_X1 \byte_controller/bit_controller/U16  ( .A(
        \byte_controller/bit_controller/n61 ), .Z(
        \byte_controller/bit_controller/n11 ) );
  INV_X1 \byte_controller/bit_controller/U15  ( .A(
        \byte_controller/bit_controller/n60 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  AND2_X1 \byte_controller/bit_controller/U14  ( .A1(
        \byte_controller/bit_controller/n19 ), .A2(
        \byte_controller/bit_controller/n23 ), .ZN(
        \byte_controller/bit_controller/n8 ) );
  AND2_X1 \byte_controller/bit_controller/U13  ( .A1(
        \byte_controller/bit_controller/n97 ), .A2(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n7 ) );
  AND2_X1 \byte_controller/bit_controller/U12  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/n28 ), .ZN(
        \byte_controller/bit_controller/n6 ) );
  OR2_X1 \byte_controller/bit_controller/U11  ( .A1(
        \byte_controller/bit_controller/n20 ), .A2(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n186 ) );
  INV_X1 \byte_controller/bit_controller/U10  ( .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U9  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/n4 ) );
  INV_X1 \byte_controller/bit_controller/U8  ( .A(
        \byte_controller/bit_controller/n38 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  OR3_X1 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n73 ), .A2(
        \byte_controller/bit_controller/n71 ), .A3(
        \byte_controller/bit_controller/n72 ), .ZN(
        \byte_controller/bit_controller/n40 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U6  ( .A(
        \byte_controller/bit_controller/n25 ), .Z(
        \byte_controller/bit_controller/n2 ) );
  AND2_X1 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n70 ) );
  AND2_X1 \byte_controller/bit_controller/U4  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n1 ) );
  AND4_X1 \byte_controller/bit_controller/U3  ( .A1(
        \byte_controller/bit_controller/n64 ), .A2(
        \byte_controller/bit_controller/n126 ), .A3(
        \byte_controller/bit_controller/n95 ), .A4(
        \byte_controller/bit_controller/n47 ), .ZN(
        \byte_controller/bit_controller/n20 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n212 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n38 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/n31 ), .Q(\byte_controller/bit_controller/n80 ), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n160 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/n193 ), .QN(
        \byte_controller/bit_controller/n126 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n44 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n55 ), .Q(scl_padoen_o) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n129 ), .CK(wb_clk_i), .SN(
        \byte_controller/n31 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n183 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n134 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/n27 ), .QN(
        \byte_controller/bit_controller/n26 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n132 ), .CK(wb_clk_i), .RN(
        \byte_controller/n31 ), .Q(\byte_controller/bit_controller/n22 ), .QN(
        \byte_controller/bit_controller/n21 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n214 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/n25 ), .QN(
        \byte_controller/bit_controller/n24 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n206 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n19 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n205 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n18 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n209 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n23 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n208 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n28 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n207 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n31 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n135 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n29 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n40 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n30 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n204 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n97 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n211 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n35 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n210 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n98 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n165 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .QN(
        \byte_controller/bit_controller/n128 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n162 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n185 ), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n68 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N86 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n215 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n14 ), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n77 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N71 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .QN(
        \byte_controller/bit_controller/n86 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n57 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n34 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n213 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [1]), .QN(
        \byte_controller/bit_controller/n36 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n161 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n200 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n79 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/n201 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/n31 ), .Q(\byte_controller/bit_controller/n192 ), 
        .QN(\byte_controller/bit_controller/n125 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n67 ), .QN(
        \byte_controller/bit_controller/n116 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N174 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n59 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .QN(\byte_controller/bit_controller/n137 ) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n48 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N78 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n85 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N76 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n184 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .QN(
        \byte_controller/bit_controller/n84 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n5 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N70 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n49 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U140  ( .A1(
        \byte_controller/bit_controller/sub_105/n123 ), .A2(
        \byte_controller/bit_controller/sub_105/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U139  ( .A1(
        \byte_controller/bit_controller/sub_105/n120 ), .A2(
        \byte_controller/bit_controller/sub_105/n98 ), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U138  ( .A1(
        \byte_controller/bit_controller/sub_105/n48 ), .A2(
        \byte_controller/bit_controller/sub_105/n115 ), .A3(
        \byte_controller/bit_controller/sub_105/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n111 ), .A2(
        \byte_controller/bit_controller/sub_105/n112 ), .A3(
        \byte_controller/bit_controller/sub_105/n98 ), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U136  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/sub_105/n110 ), .A3(
        \byte_controller/bit_controller/sub_105/n109 ), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U135  ( .A1(
        \byte_controller/bit_controller/sub_105/n102 ), .A2(
        \byte_controller/bit_controller/sub_105/n48 ), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U134  ( .A1(
        \byte_controller/bit_controller/sub_105/n101 ), .A2(
        \byte_controller/bit_controller/sub_105/n124 ), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n97 ), .A2(
        \byte_controller/bit_controller/sub_105/n98 ), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/sub_105/n96 ), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U131  ( .B1(
        \byte_controller/bit_controller/sub_105/n10 ), .B2(
        \byte_controller/bit_controller/sub_105/n91 ), .A(
        \byte_controller/bit_controller/sub_105/n90 ), .ZN(
        \byte_controller/bit_controller/N42 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U130  ( .A1(
        \byte_controller/bit_controller/sub_105/n89 ), .A2(
        \byte_controller/bit_controller/sub_105/n48 ), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n88 ), .A2(
        \byte_controller/bit_controller/sub_105/n124 ), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n84 ), .A2(
        \byte_controller/bit_controller/sub_105/n85 ), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A1(
        \byte_controller/bit_controller/sub_105/n83 ), .A2(
        \byte_controller/bit_controller/sub_105/n38 ), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U126  ( .B1(
        \byte_controller/bit_controller/sub_105/n6 ), .B2(
        \byte_controller/bit_controller/sub_105/n78 ), .A(
        \byte_controller/bit_controller/sub_105/n77 ), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U125  ( .A1(
        \byte_controller/bit_controller/sub_105/n75 ), .A2(
        \byte_controller/bit_controller/sub_105/n76 ), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n74 ), .A2(
        \byte_controller/bit_controller/sub_105/n124 ), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U123  ( .A1(
        \byte_controller/bit_controller/sub_105/n70 ), .A2(
        \byte_controller/bit_controller/sub_105/n71 ), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U122  ( .A1(
        \byte_controller/bit_controller/sub_105/n69 ), .A2(
        \byte_controller/bit_controller/sub_105/n115 ), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U121  ( .B1(
        \byte_controller/bit_controller/sub_105/n5 ), .B2(
        \byte_controller/bit_controller/sub_105/n64 ), .A(
        \byte_controller/bit_controller/sub_105/n63 ), .ZN(
        \byte_controller/bit_controller/N44 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U120  ( .A1(
        \byte_controller/bit_controller/sub_105/n61 ), .A2(
        \byte_controller/bit_controller/sub_105/n62 ), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U119  ( .A1(
        \byte_controller/bit_controller/sub_105/n60 ), .A2(
        \byte_controller/bit_controller/N31 ), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U118  ( .A1(
        \byte_controller/bit_controller/sub_105/n56 ), .A2(
        \byte_controller/bit_controller/sub_105/n57 ), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U117  ( .A1(
        \byte_controller/bit_controller/sub_105/n54 ), .A2(
        \byte_controller/bit_controller/sub_105/n55 ), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U116  ( .A1(
        \byte_controller/bit_controller/sub_105/n50 ), .A2(
        \byte_controller/bit_controller/sub_105/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U115  ( .A(
        \byte_controller/bit_controller/sub_105/n49 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N46 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U114  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U113  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/sub_105/n42 ), .A3(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U112  ( .A(
        \byte_controller/bit_controller/sub_105/n39 ), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U111  ( .B1(
        \byte_controller/bit_controller/sub_105/n35 ), .B2(
        \byte_controller/bit_controller/sub_105/n109 ), .A(
        \byte_controller/bit_controller/sub_105/n7 ), .ZN(
        \byte_controller/bit_controller/N36 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U110  ( .A1(
        \byte_controller/bit_controller/sub_105/n29 ), .A2(
        \byte_controller/bit_controller/sub_105/n30 ), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A1(
        \byte_controller/bit_controller/sub_105/n36 ), .A2(
        \byte_controller/bit_controller/N31 ), .ZN(
        \byte_controller/bit_controller/sub_105/n28 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/sub_105/n26 ), .A2(
        \byte_controller/bit_controller/sub_105/n15 ), .ZN(
        \byte_controller/bit_controller/N38 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U107  ( .A1(
        \byte_controller/bit_controller/sub_105/n22 ), .A2(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/sub_105/n18 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/sub_105/n15 ), .ZN(
        \byte_controller/bit_controller/sub_105/n14 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/sub_105/n13 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/N39 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U104  ( .A(
        \byte_controller/bit_controller/sub_105/n34 ), .B(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/N37 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U103  ( .A1(
        \byte_controller/bit_controller/sub_105/n39 ), .A2(
        \byte_controller/bit_controller/sub_105/n40 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U102  ( .B1(
        \byte_controller/bit_controller/sub_105/n3 ), .B2(
        \byte_controller/bit_controller/sub_105/n112 ), .A(
        \byte_controller/bit_controller/sub_105/n12 ), .ZN(
        \byte_controller/bit_controller/N40 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U101  ( .A(
        \byte_controller/bit_controller/sub_105/n63 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N45 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U100  ( .B1(
        \byte_controller/bit_controller/sub_105/n9 ), .B2(
        \byte_controller/bit_controller/sub_105/n104 ), .A(
        \byte_controller/bit_controller/sub_105/n103 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n25 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U98  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U97  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U96  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U95  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U94  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U93  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U91  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U90  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U89  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U88  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U87  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U86  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U84  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U83  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n21 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U82  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n24 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U81  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U80  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U79  ( .A1(
        \byte_controller/bit_controller/sub_105/n2 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/sub_105/n2 ), .A2(
        \byte_controller/bit_controller/cnt [2]), .A3(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U77  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U76  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U75  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U74  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U73  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/sub_105/n58 ), .A2(
        \byte_controller/bit_controller/sub_105/n59 ), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U71  ( .A(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U70  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U69  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U68  ( .A1(
        \byte_controller/bit_controller/sub_105/n31 ), .A2(
        \byte_controller/bit_controller/sub_105/n25 ), .A3(
        \byte_controller/bit_controller/sub_105/n32 ), .A4(
        \byte_controller/bit_controller/sub_105/n33 ), .ZN(
        \byte_controller/bit_controller/sub_105/n15 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U67  ( .A(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U66  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/sub_105/n41 ), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U65  ( .A1(
        \byte_controller/bit_controller/sub_105/n36 ), .A2(
        \byte_controller/bit_controller/sub_105/n124 ), .A3(
        \byte_controller/bit_controller/sub_105/n37 ), .A4(
        \byte_controller/bit_controller/sub_105/n38 ), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U64  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U63  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U62  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U61  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U60  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U59  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U58  ( .A(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U57  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n22 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U56  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U55  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U54  ( .A1(
        \byte_controller/bit_controller/sub_105/n52 ), .A2(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U53  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U52  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U51  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U50  ( .A1(
        \byte_controller/bit_controller/sub_105/n19 ), .A2(
        \byte_controller/bit_controller/sub_105/n18 ), .ZN(
        \byte_controller/bit_controller/sub_105/n17 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U49  ( .A1(
        \byte_controller/bit_controller/sub_105/n24 ), .A2(
        \byte_controller/bit_controller/sub_105/n25 ), .ZN(
        \byte_controller/bit_controller/sub_105/n16 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U48  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n16 ), .ZN(
        \byte_controller/bit_controller/sub_105/n13 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U47  ( .A1(
        \byte_controller/bit_controller/sub_105/n44 ), .A2(
        \byte_controller/bit_controller/sub_105/n45 ), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U46  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U45  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U44  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n20 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U43  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n23 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U42  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U41  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U40  ( .A1(
        \byte_controller/bit_controller/sub_105/n46 ), .A2(
        \byte_controller/bit_controller/sub_105/n47 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U39  ( .B1(
        \byte_controller/bit_controller/sub_105/n28 ), .B2(
        \byte_controller/bit_controller/sub_105/n27 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U38  ( .B1(
        \byte_controller/bit_controller/sub_105/n43 ), .B2(
        \byte_controller/bit_controller/sub_105/n38 ), .A(
        \byte_controller/bit_controller/sub_105/n41 ), .ZN(
        \byte_controller/bit_controller/N34 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U37  ( .A(
        \byte_controller/bit_controller/sub_105/n46 ), .B(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/N33 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U36  ( .A(
        \byte_controller/bit_controller/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U35  ( .A(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U34  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U33  ( .A1(
        \byte_controller/bit_controller/N31 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U32  ( .A1(
        \byte_controller/bit_controller/sub_105/n48 ), .A2(
        \byte_controller/bit_controller/N31 ), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U31  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/sub_105/n21 ), .ZN(
        \byte_controller/bit_controller/sub_105/n19 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U30  ( .A1(
        \byte_controller/bit_controller/sub_105/n99 ), .A2(
        \byte_controller/bit_controller/sub_105/n100 ), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U29  ( .A1(
        \byte_controller/bit_controller/sub_105/n94 ), .A2(
        \byte_controller/bit_controller/sub_105/n95 ), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U28  ( .A1(
        \byte_controller/bit_controller/sub_105/n92 ), .A2(
        \byte_controller/bit_controller/sub_105/n93 ), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U27  ( .A1(
        \byte_controller/bit_controller/sub_105/n21 ), .A2(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U26  ( .A1(
        \byte_controller/bit_controller/sub_105/n67 ), .A2(
        \byte_controller/bit_controller/sub_105/n68 ), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U25  ( .A1(
        \byte_controller/bit_controller/sub_105/n72 ), .A2(
        \byte_controller/bit_controller/sub_105/n73 ), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U24  ( .A1(
        \byte_controller/bit_controller/sub_105/n66 ), .A2(
        \byte_controller/bit_controller/sub_105/n65 ), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U23  ( .A1(
        \byte_controller/bit_controller/sub_105/n86 ), .A2(
        \byte_controller/bit_controller/sub_105/n87 ), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U22  ( .A1(
        \byte_controller/bit_controller/sub_105/n81 ), .A2(
        \byte_controller/bit_controller/sub_105/n82 ), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U21  ( .A1(
        \byte_controller/bit_controller/sub_105/n79 ), .A2(
        \byte_controller/bit_controller/sub_105/n80 ), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U20  ( .A1(
        \byte_controller/bit_controller/sub_105/n113 ), .A2(
        \byte_controller/bit_controller/sub_105/n114 ), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U19  ( .A1(
        \byte_controller/bit_controller/sub_105/n107 ), .A2(
        \byte_controller/bit_controller/sub_105/n108 ), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U18  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U17  ( .A1(
        \byte_controller/bit_controller/sub_105/n122 ), .A2(
        \byte_controller/bit_controller/sub_105/n121 ), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U16  ( .A1(
        \byte_controller/bit_controller/sub_105/n118 ), .A2(
        \byte_controller/bit_controller/sub_105/n119 ), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U15  ( .A1(
        \byte_controller/bit_controller/sub_105/n116 ), .A2(
        \byte_controller/bit_controller/sub_105/n117 ), .ZN(
        \byte_controller/bit_controller/sub_105/n12 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U14  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n106 ), .ZN(
        \byte_controller/bit_controller/sub_105/n10 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U13  ( .A1(
        \byte_controller/bit_controller/sub_105/n116 ), .A2(
        \byte_controller/bit_controller/sub_105/n117 ), .ZN(
        \byte_controller/bit_controller/sub_105/n9 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U12  ( .A(
        \byte_controller/bit_controller/n25 ), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U11  ( .A(
        \byte_controller/bit_controller/n25 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U10  ( .A1(
        \byte_controller/bit_controller/sub_105/n92 ), .A2(
        \byte_controller/bit_controller/sub_105/n93 ), .ZN(
        \byte_controller/bit_controller/sub_105/n6 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U9  ( .A1(
        \byte_controller/bit_controller/sub_105/n79 ), .A2(
        \byte_controller/bit_controller/sub_105/n80 ), .ZN(
        \byte_controller/bit_controller/sub_105/n5 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U8  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_105/n4 ) );
  OR2_X1 \byte_controller/bit_controller/sub_105/U7  ( .A1(
        \byte_controller/bit_controller/sub_105/n11 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U6  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n16 ), .ZN(
        \byte_controller/bit_controller/sub_105/n3 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U5  ( .A(
        \byte_controller/bit_controller/n25 ), .Z(
        \byte_controller/bit_controller/sub_105/n11 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U4  ( .A(
        \byte_controller/bit_controller/n25 ), .Z(
        \byte_controller/bit_controller/sub_105/n2 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U3  ( .A(
        \byte_controller/bit_controller/n25 ), .Z(
        \byte_controller/bit_controller/sub_105/n1 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/sub_105/n34 ), .Z(
        \byte_controller/bit_controller/sub_105/n7 ) );
endmodule

