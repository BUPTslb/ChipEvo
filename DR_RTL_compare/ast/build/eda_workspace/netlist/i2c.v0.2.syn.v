/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 01:48:46 2026
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
  wire   done, i2c_al, N20, sr_1, N43, N44, N45, N46, N47, N48, N49, N50, N94,
         N95, N96, irxack, N111, N112, N113, N114, N118, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
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
         \byte_controller/bit_controller/n133 ,
         \byte_controller/bit_controller/n127 ,
         \byte_controller/bit_controller/n98 ,
         \byte_controller/bit_controller/n96 ,
         \byte_controller/bit_controller/n95 ,
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
         \byte_controller/bit_controller/n169 ,
         \byte_controller/bit_controller/n168 ,
         \byte_controller/bit_controller/n167 ,
         \byte_controller/bit_controller/n166 ,
         \byte_controller/bit_controller/n165 ,
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
         \byte_controller/bit_controller/sub_103/n5 ,
         \byte_controller/bit_controller/sub_103/n4 ,
         \byte_controller/bit_controller/sub_103/n3 ,
         \byte_controller/bit_controller/sub_103/n2 ,
         \byte_controller/bit_controller/sub_103/n1 ,
         \byte_controller/bit_controller/sub_103/n123 ;
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

  DFF_X1 wb_ack_o_reg ( .D(N20), .CK(wb_clk_i), .Q(wb_ack_o), .QN(n142) );
  DFFR_X1 \ctr_reg[7]  ( .D(n137), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n1) );
  DFFR_X1 \ctr_reg[6]  ( .D(n136), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n2) );
  DFFR_X1 \ctr_reg[5]  ( .D(n135), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[4]  ( .D(n134), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[3]  ( .D(n133), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n5) );
  DFFR_X1 \ctr_reg[2]  ( .D(n132), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[1]  ( .D(n131), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n7) );
  DFFR_X1 \ctr_reg[0]  ( .D(n130), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n8) );
  DFFR_X1 \txr_reg[7]  ( .D(n129), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n9) );
  DFFR_X1 \txr_reg[6]  ( .D(n128), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n10) );
  DFFR_X1 \txr_reg[5]  ( .D(n127), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n11) );
  DFFR_X1 \txr_reg[4]  ( .D(n126), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n12) );
  DFFR_X1 \txr_reg[3]  ( .D(n125), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n13) );
  DFFR_X1 \txr_reg[2]  ( .D(n124), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n14) );
  DFFR_X1 \txr_reg[1]  ( .D(n123), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n15) );
  DFFR_X1 \txr_reg[0]  ( .D(n122), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n16) );
  DFFS_X1 \prer_reg[15]  ( .D(n121), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n17) );
  DFFS_X1 \prer_reg[14]  ( .D(n120), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n18) );
  DFFS_X1 \prer_reg[13]  ( .D(n119), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[12]  ( .D(n118), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n20) );
  DFFS_X1 \prer_reg[11]  ( .D(n117), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n21) );
  DFFS_X1 \prer_reg[10]  ( .D(n116), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n22) );
  DFFS_X1 \prer_reg[8]  ( .D(n114), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n24) );
  DFFS_X1 \prer_reg[7]  ( .D(n113), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n25) );
  DFFS_X1 \prer_reg[6]  ( .D(n112), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n26) );
  DFFS_X1 \prer_reg[5]  ( .D(n111), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n27) );
  DFFS_X1 \prer_reg[4]  ( .D(n110), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n28) );
  DFFS_X1 \prer_reg[3]  ( .D(n109), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n29) );
  DFFS_X1 \prer_reg[2]  ( .D(n108), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n30) );
  DFFS_X1 \prer_reg[1]  ( .D(n107), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n31) );
  DFFS_X1 \prer_reg[0]  ( .D(n106), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n32) );
  DFFR_X1 \cr_reg[7]  ( .D(n101), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n33) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N49), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N47), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N46), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N45), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFFR_X1 \cr_reg[0]  ( .D(N94), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n37) );
  DFFR_X1 al_reg ( .D(N111), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N48), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N112), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N50), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N113), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N44), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFFR_X1 irq_flag_reg ( .D(N114), .CK(wb_clk_i), .RN(arst_i), .Q(n172), .QN(
        n38) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N43), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N118), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 \cr_reg[6]  ( .D(n102), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n34) );
  DFFR_X1 \cr_reg[4]  ( .D(n104), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n36) );
  DFFR_X1 \cr_reg[5]  ( .D(n103), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n35) );
  DFFS_X1 \prer_reg[9]  ( .D(n115), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n23) );
  DFFR_X1 \cr_reg[1]  ( .D(N95), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]) );
  DFFR_X1 \cr_reg[2]  ( .D(N96), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]) );
  DFFR_X1 \cr_reg[3]  ( .D(n105), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n148) );
  AND2_X1 U119 ( .A1(n161), .A2(n183), .ZN(n138) );
  AND2_X1 U120 ( .A1(n161), .A2(n143), .ZN(n139) );
  AND3_X1 U121 ( .A1(wb_adr_i[2]), .A2(n178), .A3(n177), .ZN(n140) );
  INV_X1 U122 ( .A(n36), .ZN(n141) );
  NAND3_X1 U123 ( .A1(ctr[7]), .A2(n140), .A3(n161), .ZN(n187) );
  MUX2_X1 U124 ( .A(wb_dat_i[3]), .B(n149), .S(n187), .Z(n105) );
  AND3_X1 U125 ( .A1(n142), .A2(wb_stb_i), .A3(wb_cyc_i), .ZN(N20) );
  INV_X1 U126 ( .A(wb_rst_i), .ZN(n210) );
  AND3_X1 U127 ( .A1(wb_adr_i[0]), .A2(n160), .A3(n177), .ZN(n143) );
  INV_X1 U129 ( .A(wb_dat_i[0]), .ZN(n174) );
  NAND4_X1 U130 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .A4(n210), .ZN(
        n147) );
  INV_X1 U131 ( .A(n147), .ZN(n161) );
  INV_X1 U132 ( .A(wb_adr_i[2]), .ZN(n160) );
  NAND3_X1 U133 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[1]), .A3(n160), .ZN(n176) );
  OAI21_X1 U134 ( .B1(n176), .B2(n147), .A(n210), .ZN(n145) );
  NAND2_X1 U135 ( .A1(n161), .A2(n145), .ZN(n146) );
  OAI22_X1 U136 ( .A1(n174), .A2(n146), .B1(n16), .B2(n145), .ZN(n122) );
  INV_X1 U137 ( .A(wb_dat_i[1]), .ZN(n182) );
  OAI22_X1 U138 ( .A1(n182), .A2(n146), .B1(n15), .B2(n145), .ZN(n123) );
  INV_X1 U139 ( .A(wb_dat_i[2]), .ZN(n188) );
  OAI22_X1 U140 ( .A1(n188), .A2(n146), .B1(n14), .B2(n145), .ZN(n124) );
  INV_X1 U141 ( .A(wb_dat_i[3]), .ZN(n191) );
  OAI22_X1 U142 ( .A1(n191), .A2(n146), .B1(n13), .B2(n145), .ZN(n125) );
  INV_X1 U143 ( .A(wb_dat_i[4]), .ZN(n194) );
  OAI22_X1 U144 ( .A1(n194), .A2(n146), .B1(n12), .B2(n145), .ZN(n126) );
  INV_X1 U145 ( .A(wb_dat_i[5]), .ZN(n202) );
  OAI22_X1 U146 ( .A1(n202), .A2(n146), .B1(n11), .B2(n145), .ZN(n127) );
  INV_X1 U147 ( .A(wb_dat_i[6]), .ZN(n171) );
  OAI22_X1 U148 ( .A1(n171), .A2(n146), .B1(n10), .B2(n145), .ZN(n128) );
  INV_X1 U149 ( .A(wb_dat_i[7]), .ZN(n169) );
  OAI22_X1 U150 ( .A1(n169), .A2(n146), .B1(n9), .B2(n145), .ZN(n129) );
  INV_X1 U151 ( .A(wb_adr_i[0]), .ZN(n178) );
  NAND3_X1 U152 ( .A1(wb_adr_i[1]), .A2(n178), .A3(n160), .ZN(n175) );
  OAI21_X1 U153 ( .B1(n175), .B2(n147), .A(n210), .ZN(n201) );
  NAND2_X1 U154 ( .A1(n161), .A2(n201), .ZN(n203) );
  OAI22_X1 U155 ( .A1(n203), .A2(n169), .B1(n1), .B2(n201), .ZN(n137) );
  NOR2_X1 U156 ( .A1(wb_rst_i), .A2(n148), .ZN(n149) );
  INV_X1 U157 ( .A(wb_adr_i[1]), .ZN(n177) );
  INV_X1 U158 ( .A(done), .ZN(n150) );
  INV_X1 U159 ( .A(i2c_al), .ZN(n199) );
  NAND4_X1 U160 ( .A1(n187), .A2(n210), .A3(n150), .A4(n199), .ZN(n151) );
  OAI22_X1 U161 ( .A1(n36), .A2(n151), .B1(n194), .B2(n187), .ZN(n104) );
  OAI22_X1 U162 ( .A1(n35), .A2(n151), .B1(n202), .B2(n187), .ZN(n103) );
  OAI22_X1 U163 ( .A1(n34), .A2(n151), .B1(n187), .B2(n171), .ZN(n102) );
  OAI22_X1 U164 ( .A1(n33), .A2(n151), .B1(n187), .B2(n169), .ZN(n101) );
  NAND3_X1 U165 ( .A1(n178), .A2(n160), .A3(n177), .ZN(n218) );
  INV_X1 U166 ( .A(n218), .ZN(n183) );
  MUX2_X1 U167 ( .A(n32), .B(n174), .S(n138), .Z(n152) );
  NAND2_X1 U168 ( .A1(n210), .A2(n152), .ZN(n106) );
  MUX2_X1 U169 ( .A(n31), .B(n182), .S(n138), .Z(n153) );
  NAND2_X1 U170 ( .A1(n210), .A2(n153), .ZN(n107) );
  MUX2_X1 U171 ( .A(n30), .B(n188), .S(n138), .Z(n154) );
  NAND2_X1 U172 ( .A1(n210), .A2(n154), .ZN(n108) );
  MUX2_X1 U173 ( .A(n29), .B(n191), .S(n138), .Z(n155) );
  NAND2_X1 U174 ( .A1(n210), .A2(n155), .ZN(n109) );
  MUX2_X1 U175 ( .A(n28), .B(n194), .S(n138), .Z(n156) );
  NAND2_X1 U176 ( .A1(n210), .A2(n156), .ZN(n110) );
  MUX2_X1 U177 ( .A(n27), .B(n202), .S(n138), .Z(n157) );
  NAND2_X1 U178 ( .A1(n210), .A2(n157), .ZN(n111) );
  MUX2_X1 U179 ( .A(n26), .B(n171), .S(n138), .Z(n158) );
  NAND2_X1 U180 ( .A1(n210), .A2(n158), .ZN(n112) );
  MUX2_X1 U181 ( .A(n25), .B(n169), .S(n138), .Z(n159) );
  NAND2_X1 U182 ( .A1(n210), .A2(n159), .ZN(n113) );
  MUX2_X1 U183 ( .A(n24), .B(n174), .S(n139), .Z(n162) );
  NAND2_X1 U184 ( .A1(n210), .A2(n162), .ZN(n114) );
  MUX2_X1 U185 ( .A(n23), .B(n182), .S(n139), .Z(n163) );
  NAND2_X1 U186 ( .A1(n210), .A2(n163), .ZN(n115) );
  MUX2_X1 U187 ( .A(n22), .B(n188), .S(n139), .Z(n164) );
  NAND2_X1 U188 ( .A1(n210), .A2(n164), .ZN(n116) );
  MUX2_X1 U189 ( .A(n21), .B(n191), .S(n139), .Z(n165) );
  NAND2_X1 U190 ( .A1(n210), .A2(n165), .ZN(n117) );
  MUX2_X1 U191 ( .A(n20), .B(n194), .S(n139), .Z(n166) );
  NAND2_X1 U192 ( .A1(n210), .A2(n166), .ZN(n118) );
  MUX2_X1 U193 ( .A(n19), .B(n202), .S(n139), .Z(n167) );
  NAND2_X1 U194 ( .A1(n210), .A2(n167), .ZN(n119) );
  MUX2_X1 U195 ( .A(n18), .B(n171), .S(n139), .Z(n168) );
  NAND2_X1 U196 ( .A1(n210), .A2(n168), .ZN(n120) );
  MUX2_X1 U197 ( .A(n17), .B(n169), .S(n139), .Z(n170) );
  NAND2_X1 U198 ( .A1(n210), .A2(n170), .ZN(n121) );
  OAI22_X1 U199 ( .A1(n203), .A2(n171), .B1(n2), .B2(n201), .ZN(n136) );
  NOR2_X1 U200 ( .A1(n187), .A2(n174), .ZN(N94) );
  NOR2_X1 U201 ( .A1(done), .A2(n172), .ZN(n173) );
  AOI211_X1 U202 ( .C1(n173), .C2(n199), .A(cr[0]), .B(wb_rst_i), .ZN(N114) );
  NOR3_X1 U203 ( .A1(n38), .A2(n2), .A3(wb_rst_i), .ZN(N118) );
  OAI22_X1 U204 ( .A1(n203), .A2(n174), .B1(n8), .B2(n201), .ZN(n130) );
  INV_X1 U205 ( .A(n175), .ZN(n211) );
  AOI22_X1 U206 ( .A1(prer[8]), .A2(n143), .B1(ctr[0]), .B2(n211), .ZN(n181)
         );
  INV_X1 U207 ( .A(n176), .ZN(n215) );
  NAND3_X1 U208 ( .A1(wb_adr_i[0]), .A2(wb_adr_i[2]), .A3(n177), .ZN(n213) );
  NAND3_X1 U209 ( .A1(wb_adr_i[2]), .A2(wb_adr_i[1]), .A3(n178), .ZN(n212) );
  OAI22_X1 U210 ( .A1(n16), .A2(n213), .B1(n37), .B2(n212), .ZN(n179) );
  AOI221_X1 U211 ( .B1(rxr[0]), .B2(n215), .C1(n172), .C2(n140), .A(n179), 
        .ZN(n180) );
  OAI211_X1 U212 ( .C1(n32), .C2(n218), .A(n181), .B(n180), .ZN(N43) );
  NOR2_X1 U213 ( .A1(n187), .A2(n182), .ZN(N95) );
  AOI21_X1 U214 ( .B1(n35), .B2(n36), .A(wb_rst_i), .ZN(N113) );
  OAI22_X1 U215 ( .A1(n203), .A2(n182), .B1(n7), .B2(n201), .ZN(n131) );
  INV_X1 U216 ( .A(n212), .ZN(n196) );
  INV_X1 U217 ( .A(n213), .ZN(n195) );
  AOI22_X1 U218 ( .A1(cr[1]), .A2(n196), .B1(txr[1]), .B2(n195), .ZN(n186) );
  AOI22_X1 U219 ( .A1(rxr[1]), .A2(n215), .B1(sr_1), .B2(n140), .ZN(n185) );
  AOI222_X1 U220 ( .A1(prer[1]), .A2(n183), .B1(prer[9]), .B2(n143), .C1(
        ctr[1]), .C2(n211), .ZN(n184) );
  NAND3_X1 U221 ( .A1(n186), .A2(n185), .A3(n184), .ZN(N44) );
  NOR2_X1 U222 ( .A1(n188), .A2(n187), .ZN(N96) );
  OAI22_X1 U223 ( .A1(n203), .A2(n188), .B1(n6), .B2(n201), .ZN(n132) );
  AOI22_X1 U224 ( .A1(prer[10]), .A2(n143), .B1(ctr[2]), .B2(n211), .ZN(n190)
         );
  AOI222_X1 U225 ( .A1(rxr[2]), .A2(n215), .B1(cr[2]), .B2(n196), .C1(txr[2]), 
        .C2(n195), .ZN(n189) );
  OAI211_X1 U226 ( .C1(n30), .C2(n218), .A(n190), .B(n189), .ZN(N45) );
  OAI22_X1 U227 ( .A1(n203), .A2(n191), .B1(n5), .B2(n201), .ZN(n133) );
  AOI22_X1 U228 ( .A1(prer[11]), .A2(n143), .B1(ctr[3]), .B2(n211), .ZN(n193)
         );
  AOI222_X1 U229 ( .A1(rxr[3]), .A2(n215), .B1(cr[3]), .B2(n196), .C1(txr[3]), 
        .C2(n195), .ZN(n192) );
  OAI211_X1 U230 ( .C1(n29), .C2(n218), .A(n193), .B(n192), .ZN(N46) );
  OAI22_X1 U231 ( .A1(n203), .A2(n194), .B1(n4), .B2(n201), .ZN(n134) );
  AOI22_X1 U232 ( .A1(prer[12]), .A2(n143), .B1(ctr[4]), .B2(n211), .ZN(n198)
         );
  AOI222_X1 U233 ( .A1(rxr[4]), .A2(n215), .B1(n141), .B2(n196), .C1(txr[4]), 
        .C2(n195), .ZN(n197) );
  OAI211_X1 U234 ( .C1(n28), .C2(n218), .A(n198), .B(n197), .ZN(N47) );
  NAND2_X1 U235 ( .A1(n33), .A2(sr[5]), .ZN(n200) );
  AOI21_X1 U236 ( .B1(n200), .B2(n199), .A(wb_rst_i), .ZN(N111) );
  OAI22_X1 U237 ( .A1(n203), .A2(n202), .B1(n3), .B2(n201), .ZN(n135) );
  AOI22_X1 U238 ( .A1(prer[13]), .A2(n143), .B1(ctr[5]), .B2(n211), .ZN(n206)
         );
  OAI22_X1 U239 ( .A1(n11), .A2(n213), .B1(n35), .B2(n212), .ZN(n204) );
  AOI221_X1 U240 ( .B1(rxr[5]), .B2(n215), .C1(sr[5]), .C2(n140), .A(n204), 
        .ZN(n205) );
  OAI211_X1 U241 ( .C1(n27), .C2(n218), .A(n206), .B(n205), .ZN(N48) );
  AOI22_X1 U242 ( .A1(prer[14]), .A2(n143), .B1(ctr[6]), .B2(n211), .ZN(n209)
         );
  OAI22_X1 U243 ( .A1(n10), .A2(n213), .B1(n34), .B2(n212), .ZN(n207) );
  AOI221_X1 U244 ( .B1(rxr[6]), .B2(n215), .C1(sr[6]), .C2(n140), .A(n207), 
        .ZN(n208) );
  OAI211_X1 U245 ( .C1(n26), .C2(n218), .A(n209), .B(n208), .ZN(N49) );
  AND2_X1 U246 ( .A1(irxack), .A2(n210), .ZN(N112) );
  AOI22_X1 U247 ( .A1(prer[15]), .A2(n143), .B1(ctr[7]), .B2(n211), .ZN(n217)
         );
  OAI22_X1 U248 ( .A1(n9), .A2(n213), .B1(n33), .B2(n212), .ZN(n214) );
  AOI221_X1 U249 ( .B1(rxr[7]), .B2(n215), .C1(sr[7]), .C2(n140), .A(n214), 
        .ZN(n216) );
  OAI211_X1 U250 ( .C1(n25), .C2(n218), .A(n217), .B(n216), .ZN(N50) );
  NOR2_X1 \byte_controller/U146  ( .A1(\byte_controller/n163 ), .A2(
        \byte_controller/n162 ), .ZN(\byte_controller/n79 ) );
  NAND3_X1 \byte_controller/U145  ( .A1(\byte_controller/n158 ), .A2(
        \byte_controller/n157 ), .A3(\byte_controller/n156 ), .ZN(
        \byte_controller/n80 ) );
  NAND3_X1 \byte_controller/U144  ( .A1(\byte_controller/core_cmd [3]), .A2(
        \byte_controller/n39 ), .A3(\byte_controller/n26 ), .ZN(
        \byte_controller/n156 ) );
  OAI221_X1 \byte_controller/U143  ( .B1(\byte_controller/n153 ), .B2(
        \byte_controller/n152 ), .C1(\byte_controller/c_state [2]), .C2(
        \byte_controller/n151 ), .A(\byte_controller/n150 ), .ZN(
        \byte_controller/n158 ) );
  OAI21_X1 \byte_controller/U142  ( .B1(\byte_controller/n149 ), .B2(
        \byte_controller/n148 ), .A(\byte_controller/n147 ), .ZN(
        \byte_controller/n150 ) );
  INV_X1 \byte_controller/U141  ( .A(\byte_controller/n149 ), .ZN(
        \byte_controller/n151 ) );
  NAND2_X1 \byte_controller/U140  ( .A1(\byte_controller/n154 ), .A2(
        \byte_controller/n146 ), .ZN(\byte_controller/n149 ) );
  INV_X1 \byte_controller/U139  ( .A(\byte_controller/n38 ), .ZN(
        \byte_controller/n152 ) );
  INV_X1 \byte_controller/U138  ( .A(\byte_controller/n144 ), .ZN(
        \byte_controller/n153 ) );
  NAND3_X1 \byte_controller/U137  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/n141 ) );
  INV_X1 \byte_controller/U136  ( .A(\byte_controller/n37 ), .ZN(
        \byte_controller/n138 ) );
  NAND2_X1 \byte_controller/U135  ( .A1(\byte_controller/n133 ), .A2(
        \byte_controller/n134 ), .ZN(\byte_controller/n82 ) );
  OR3_X1 \byte_controller/U134  ( .A1(\byte_controller/n132 ), .A2(
        \byte_controller/n162 ), .A3(\byte_controller/n28 ), .ZN(
        \byte_controller/n133 ) );
  INV_X1 \byte_controller/U133  ( .A(\byte_controller/n155 ), .ZN(
        \byte_controller/n132 ) );
  NAND2_X1 \byte_controller/U132  ( .A1(\byte_controller/n130 ), .A2(
        \byte_controller/n131 ), .ZN(\byte_controller/n83 ) );
  NAND3_X1 \byte_controller/U131  ( .A1(\byte_controller/core_cmd [0]), .A2(
        \byte_controller/n26 ), .A3(\byte_controller/n39 ), .ZN(
        \byte_controller/n130 ) );
  AOI21_X1 \byte_controller/U130  ( .B1(\byte_controller/n129 ), .B2(
        \byte_controller/n159 ), .A(\byte_controller/n162 ), .ZN(
        \byte_controller/N104 ) );
  NAND2_X1 \byte_controller/U129  ( .A1(\byte_controller/core_ack ), .A2(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n159 ) );
  AOI22_X1 \byte_controller/U128  ( .A1(cr[3]), .A2(\byte_controller/n128 ), 
        .B1(rxr[7]), .B2(\byte_controller/n127 ), .ZN(\byte_controller/n129 )
         );
  NAND3_X1 \byte_controller/U127  ( .A1(\byte_controller/n2 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/n124 ), .ZN(
        \byte_controller/n127 ) );
  AOI221_X1 \byte_controller/U126  ( .B1(\byte_controller/n148 ), .B2(
        \byte_controller/n123 ), .C1(\byte_controller/n122 ), .C2(
        \byte_controller/c_state [1]), .A(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n124 ) );
  OAI21_X1 \byte_controller/U125  ( .B1(\byte_controller/n148 ), .B2(
        \byte_controller/n122 ), .A(\byte_controller/n25 ), .ZN(
        \byte_controller/n128 ) );
  OAI221_X1 \byte_controller/U124  ( .B1(\byte_controller/n6 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n119 ), .A(\byte_controller/n118 ), .ZN(
        \byte_controller/n92 ) );
  NAND2_X1 \byte_controller/U123  ( .A1(txr[7]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n118 ) );
  OAI221_X1 \byte_controller/U122  ( .B1(\byte_controller/n119 ), .B2(
        \byte_controller/n10 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n116 ), .A(\byte_controller/n115 ), .ZN(
        \byte_controller/n93 ) );
  NAND2_X1 \byte_controller/U121  ( .A1(txr[6]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n115 ) );
  OAI221_X1 \byte_controller/U120  ( .B1(\byte_controller/n116 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n114 ), .A(\byte_controller/n113 ), .ZN(
        \byte_controller/n94 ) );
  NAND2_X1 \byte_controller/U119  ( .A1(txr[5]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n113 ) );
  OAI221_X1 \byte_controller/U118  ( .B1(\byte_controller/n114 ), .B2(
        \byte_controller/n10 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n112 ), .A(\byte_controller/n111 ), .ZN(
        \byte_controller/n95 ) );
  NAND2_X1 \byte_controller/U117  ( .A1(txr[4]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n111 ) );
  OAI221_X1 \byte_controller/U116  ( .B1(\byte_controller/n112 ), .B2(
        \byte_controller/n9 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n110 ), .A(\byte_controller/n109 ), .ZN(
        \byte_controller/n96 ) );
  NAND2_X1 \byte_controller/U115  ( .A1(txr[3]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n109 ) );
  OAI221_X1 \byte_controller/U114  ( .B1(\byte_controller/n110 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n108 ), .A(\byte_controller/n107 ), .ZN(
        \byte_controller/n97 ) );
  NAND2_X1 \byte_controller/U113  ( .A1(txr[2]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n107 ) );
  OAI221_X1 \byte_controller/U112  ( .B1(\byte_controller/n108 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n106 ), .A(\byte_controller/n105 ), .ZN(
        \byte_controller/n99 ) );
  NAND2_X1 \byte_controller/U111  ( .A1(txr[1]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n105 ) );
  OAI221_X1 \byte_controller/U110  ( .B1(\byte_controller/n106 ), .B2(
        \byte_controller/n8 ), .C1(\byte_controller/n120 ), .C2(
        \byte_controller/n160 ), .A(\byte_controller/n104 ), .ZN(
        \byte_controller/n98 ) );
  NAND2_X1 \byte_controller/U109  ( .A1(txr[0]), .A2(\byte_controller/n117 ), 
        .ZN(\byte_controller/n104 ) );
  INV_X1 \byte_controller/U108  ( .A(\byte_controller/n103 ), .ZN(
        \byte_controller/n117 ) );
  INV_X1 \byte_controller/U107  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n160 ) );
  NAND3_X1 \byte_controller/U106  ( .A1(\byte_controller/n120 ), .A2(
        \byte_controller/n102 ), .A3(\byte_controller/n103 ), .ZN(
        \byte_controller/n121 ) );
  NAND3_X1 \byte_controller/U105  ( .A1(\byte_controller/n100 ), .A2(
        \byte_controller/n101 ), .A3(\byte_controller/n78 ), .ZN(
        \byte_controller/n84 ) );
  NAND3_X1 \byte_controller/U104  ( .A1(\byte_controller/n76 ), .A2(
        \byte_controller/n39 ), .A3(\byte_controller/n75 ), .ZN(
        \byte_controller/n100 ) );
  NAND3_X1 \byte_controller/U103  ( .A1(\byte_controller/n20 ), .A2(
        \byte_controller/n74 ), .A3(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n101 ) );
  NAND2_X1 \byte_controller/U102  ( .A1(\byte_controller/n77 ), .A2(
        \byte_controller/n154 ), .ZN(\byte_controller/n147 ) );
  AOI21_X1 \byte_controller/U101  ( .B1(\byte_controller/n73 ), .B2(
        \byte_controller/n24 ), .A(\byte_controller/n72 ), .ZN(
        \byte_controller/N107 ) );
  NAND2_X1 \byte_controller/U100  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n14 ), .ZN(\byte_controller/n73 ) );
  NAND2_X1 \byte_controller/U99  ( .A1(\byte_controller/n70 ), .A2(
        \byte_controller/n134 ), .ZN(\byte_controller/n91 ) );
  NAND3_X1 \byte_controller/U98  ( .A1(\byte_controller/n139 ), .A2(
        \byte_controller/n69 ), .A3(\byte_controller/n39 ), .ZN(
        \byte_controller/n70 ) );
  NAND2_X1 \byte_controller/U97  ( .A1(\byte_controller/n1 ), .A2(
        \byte_controller/n68 ), .ZN(\byte_controller/n134 ) );
  OAI21_X1 \byte_controller/U96  ( .B1(\byte_controller/n14 ), .B2(
        \byte_controller/n25 ), .A(\byte_controller/n67 ), .ZN(
        \byte_controller/n68 ) );
  NAND4_X1 \byte_controller/U95  ( .A1(\byte_controller/n3 ), .A2(
        \byte_controller/n16 ), .A3(\byte_controller/n13 ), .A4(
        \byte_controller/n64 ), .ZN(\byte_controller/n67 ) );
  INV_X1 \byte_controller/U94  ( .A(cr[7]), .ZN(\byte_controller/n64 ) );
  NAND2_X1 \byte_controller/U93  ( .A1(\byte_controller/n140 ), .A2(
        \byte_controller/n63 ), .ZN(\byte_controller/n85 ) );
  OAI211_X1 \byte_controller/U92  ( .C1(\byte_controller/n146 ), .C2(
        \byte_controller/n39 ), .A(\byte_controller/n75 ), .B(
        \byte_controller/c_state [2]), .ZN(\byte_controller/n63 ) );
  NAND2_X1 \byte_controller/U91  ( .A1(\byte_controller/n35 ), .A2(
        \byte_controller/n62 ), .ZN(\byte_controller/n140 ) );
  AOI211_X1 \byte_controller/U90  ( .C1(\byte_controller/n16 ), .C2(
        \byte_controller/n30 ), .A(\byte_controller/n12 ), .B(
        \byte_controller/n34 ), .ZN(\byte_controller/n62 ) );
  OAI221_X1 \byte_controller/U89  ( .B1(\byte_controller/n60 ), .B2(
        \byte_controller/n120 ), .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n59 ), .A(\byte_controller/n103 ), .ZN(
        \byte_controller/n88 ) );
  AOI21_X1 \byte_controller/U88  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n7 ), .A(\byte_controller/n77 ), .ZN(
        \byte_controller/n60 ) );
  INV_X1 \byte_controller/U87  ( .A(\byte_controller/n146 ), .ZN(
        \byte_controller/n77 ) );
  OAI211_X1 \byte_controller/U86  ( .C1(\byte_controller/n56 ), .C2(
        \byte_controller/n59 ), .A(\byte_controller/n58 ), .B(
        \byte_controller/n103 ), .ZN(\byte_controller/n90 ) );
  NAND3_X1 \byte_controller/U85  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/n18 ), .A3(\byte_controller/n56 ), .ZN(
        \byte_controller/n58 ) );
  OAI21_X1 \byte_controller/U84  ( .B1(\byte_controller/n55 ), .B2(
        \byte_controller/n120 ), .A(\byte_controller/n102 ), .ZN(
        \byte_controller/n59 ) );
  NAND2_X1 \byte_controller/U83  ( .A1(\byte_controller/n103 ), .A2(
        \byte_controller/n54 ), .ZN(\byte_controller/n89 ) );
  MUX2_X1 \byte_controller/U82  ( .A(\byte_controller/n53 ), .B(
        \byte_controller/n55 ), .S(\byte_controller/n57 ), .Z(
        \byte_controller/n54 ) );
  INV_X1 \byte_controller/U81  ( .A(\byte_controller/n120 ), .ZN(
        \byte_controller/n57 ) );
  NAND2_X1 \byte_controller/U80  ( .A1(\byte_controller/n102 ), .A2(
        \byte_controller/n55 ), .ZN(\byte_controller/n53 ) );
  NAND2_X1 \byte_controller/U79  ( .A1(\byte_controller/ld ), .A2(
        \byte_controller/n102 ), .ZN(\byte_controller/n103 ) );
  AOI21_X1 \byte_controller/U78  ( .B1(\byte_controller/n135 ), .B2(
        \byte_controller/n148 ), .A(\byte_controller/n72 ), .ZN(
        \byte_controller/N105 ) );
  NAND2_X1 \byte_controller/U77  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n146 ), .ZN(\byte_controller/n135 ) );
  OAI21_X1 \byte_controller/U76  ( .B1(\byte_controller/n30 ), .B2(
        \byte_controller/n72 ), .A(\byte_controller/n52 ), .ZN(
        \byte_controller/N106 ) );
  NAND4_X1 \byte_controller/U75  ( .A1(\byte_controller/n3 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/n51 ), .A4(
        \byte_controller/n5 ), .ZN(\byte_controller/n52 ) );
  NAND2_X1 \byte_controller/U74  ( .A1(\byte_controller/n75 ), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n72 ) );
  NAND2_X1 \byte_controller/U73  ( .A1(\byte_controller/n157 ), .A2(
        \byte_controller/n50 ), .ZN(\byte_controller/n86 ) );
  OAI211_X1 \byte_controller/U72  ( .C1(\byte_controller/n146 ), .C2(
        \byte_controller/n155 ), .A(\byte_controller/n29 ), .B(
        \byte_controller/c_state [1]), .ZN(\byte_controller/n50 ) );
  NAND3_X1 \byte_controller/U71  ( .A1(\byte_controller/n15 ), .A2(
        \byte_controller/n56 ), .A3(\byte_controller/n18 ), .ZN(
        \byte_controller/n146 ) );
  NAND3_X1 \byte_controller/U70  ( .A1(\byte_controller/n35 ), .A2(
        \byte_controller/n20 ), .A3(\byte_controller/n12 ), .ZN(
        \byte_controller/n157 ) );
  OAI21_X1 \byte_controller/U69  ( .B1(\byte_controller/n48 ), .B2(cr[7]), .A(
        \byte_controller/n30 ), .ZN(\byte_controller/n49 ) );
  NAND3_X1 \byte_controller/U68  ( .A1(\byte_controller/n39 ), .A2(
        \byte_controller/c_state [0]), .A3(\byte_controller/n29 ), .ZN(
        \byte_controller/n47 ) );
  MUX2_X1 \byte_controller/U67  ( .A(\byte_controller/n122 ), .B(
        \byte_controller/n46 ), .S(\byte_controller/n3 ), .Z(
        \byte_controller/n155 ) );
  NAND2_X1 \byte_controller/U66  ( .A1(\byte_controller/n45 ), .A2(
        \byte_controller/n5 ), .ZN(\byte_controller/n46 ) );
  NAND3_X1 \byte_controller/U65  ( .A1(\byte_controller/n65 ), .A2(
        \byte_controller/n66 ), .A3(\byte_controller/n71 ), .ZN(
        \byte_controller/n45 ) );
  INV_X1 \byte_controller/U64  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n122 ) );
  NAND3_X1 \byte_controller/U63  ( .A1(\byte_controller/n33 ), .A2(
        \byte_controller/n19 ), .A3(cr[7]), .ZN(\byte_controller/n131 ) );
  NAND2_X1 \byte_controller/U62  ( .A1(\byte_controller/n44 ), .A2(
        \byte_controller/core_ack ), .ZN(\byte_controller/n144 ) );
  NAND4_X1 \byte_controller/U61  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n148 ), .A3(\byte_controller/n17 ), .A4(
        \byte_controller/n123 ), .ZN(\byte_controller/n44 ) );
  NAND4_X1 \byte_controller/U60  ( .A1(\byte_controller/n45 ), .A2(
        \byte_controller/n42 ), .A3(\byte_controller/n61 ), .A4(
        \byte_controller/n148 ), .ZN(\byte_controller/n145 ) );
  NAND3_X1 \byte_controller/U59  ( .A1(\byte_controller/n65 ), .A2(
        \byte_controller/n66 ), .A3(\byte_controller/n71 ), .ZN(
        \byte_controller/n51 ) );
  INV_X1 \byte_controller/U58  ( .A(cr[6]), .ZN(\byte_controller/n71 ) );
  INV_X1 \byte_controller/U57  ( .A(cr[5]), .ZN(\byte_controller/n65 ) );
  INV_X1 \byte_controller/U56  ( .A(cr[4]), .ZN(\byte_controller/n66 ) );
  NOR3_X1 \byte_controller/U55  ( .A1(\byte_controller/n43 ), .A2(done), .A3(
        \byte_controller/c_state [3]), .ZN(\byte_controller/n42 ) );
  NAND2_X1 \byte_controller/U54  ( .A1(\byte_controller/n125 ), .A2(
        \byte_controller/n126 ), .ZN(\byte_controller/n43 ) );
  INV_X1 \byte_controller/U53  ( .A(\byte_controller/n162 ), .ZN(
        \byte_controller/n154 ) );
  INV_X1 \byte_controller/U52  ( .A(wb_rst_i), .ZN(\byte_controller/n102 ) );
  INV_X1 \byte_controller/U51  ( .A(i2c_al), .ZN(\byte_controller/n41 ) );
  MUX2_X1 \byte_controller/U50  ( .A(\byte_controller/n122 ), .B(
        \byte_controller/n46 ), .S(\byte_controller/n23 ), .Z(
        \byte_controller/n39 ) );
  NAND2_X1 \byte_controller/U49  ( .A1(\byte_controller/n32 ), .A2(
        \byte_controller/n144 ), .ZN(\byte_controller/n37 ) );
  NAND4_X1 \byte_controller/U48  ( .A1(\byte_controller/n140 ), .A2(
        \byte_controller/n141 ), .A3(\byte_controller/n142 ), .A4(
        \byte_controller/n143 ), .ZN(\byte_controller/n81 ) );
  BUF_X2 \byte_controller/U47  ( .A(arst_i), .Z(\byte_controller/n36 ) );
  INV_X1 \byte_controller/U46  ( .A(\byte_controller/n25 ), .ZN(
        \byte_controller/n76 ) );
  MUX2_X1 \byte_controller/U45  ( .A(\byte_controller/n160 ), .B(
        \byte_controller/n161 ), .S(\byte_controller/n159 ), .Z(
        \byte_controller/n163 ) );
  AND2_X1 \byte_controller/U44  ( .A1(\byte_controller/n49 ), .A2(
        \byte_controller/n29 ), .ZN(\byte_controller/n35 ) );
  NAND2_X1 \byte_controller/U43  ( .A1(\byte_controller/n1 ), .A2(
        \byte_controller/n4 ), .ZN(\byte_controller/n78 ) );
  AND2_X1 \byte_controller/U42  ( .A1(\byte_controller/n145 ), .A2(
        \byte_controller/n144 ), .ZN(\byte_controller/n34 ) );
  NAND2_X1 \byte_controller/U41  ( .A1(\byte_controller/n137 ), .A2(
        \byte_controller/n136 ), .ZN(\byte_controller/n143 ) );
  NAND2_X1 \byte_controller/U40  ( .A1(\byte_controller/n131 ), .A2(
        \byte_controller/n47 ), .ZN(\byte_controller/n87 ) );
  INV_X1 \byte_controller/U39  ( .A(\byte_controller/n135 ), .ZN(
        \byte_controller/n136 ) );
  INV_X1 \byte_controller/U38  ( .A(\byte_controller/n162 ), .ZN(
        \byte_controller/n75 ) );
  INV_X1 \byte_controller/U37  ( .A(\byte_controller/n162 ), .ZN(
        \byte_controller/n139 ) );
  NOR2_X1 \byte_controller/U36  ( .A1(\byte_controller/n138 ), .A2(
        \byte_controller/n162 ), .ZN(\byte_controller/n137 ) );
  INV_X1 \byte_controller/U35  ( .A(\byte_controller/n147 ), .ZN(
        \byte_controller/n74 ) );
  NAND4_X1 \byte_controller/U34  ( .A1(\byte_controller/n51 ), .A2(
        \byte_controller/n31 ), .A3(\byte_controller/n30 ), .A4(
        \byte_controller/n148 ), .ZN(\byte_controller/n32 ) );
  NOR3_X1 \byte_controller/U33  ( .A1(\byte_controller/n43 ), .A2(
        \byte_controller/c_state [3]), .A3(done), .ZN(\byte_controller/n31 )
         );
  CLKBUF_X1 \byte_controller/U32  ( .A(\byte_controller/n61 ), .Z(
        \byte_controller/n30 ) );
  NAND2_X2 \byte_controller/U31  ( .A1(\byte_controller/n41 ), .A2(
        \byte_controller/n102 ), .ZN(\byte_controller/n162 ) );
  INV_X1 \byte_controller/U30  ( .A(\byte_controller/n162 ), .ZN(
        \byte_controller/n29 ) );
  INV_X1 \byte_controller/U29  ( .A(\byte_controller/n162 ), .ZN(
        \byte_controller/n26 ) );
  CLKBUF_X1 \byte_controller/U28  ( .A(\byte_controller/n123 ), .Z(
        \byte_controller/n25 ) );
  INV_X1 \byte_controller/U27  ( .A(\byte_controller/n69 ), .ZN(
        \byte_controller/n24 ) );
  NAND2_X1 \byte_controller/U26  ( .A1(\byte_controller/n4 ), .A2(
        \byte_controller/n21 ), .ZN(\byte_controller/n22 ) );
  OR2_X1 \byte_controller/U25  ( .A1(\byte_controller/n22 ), .A2(
        \byte_controller/n138 ), .ZN(\byte_controller/n142 ) );
  INV_X1 \byte_controller/U24  ( .A(\byte_controller/n162 ), .ZN(
        \byte_controller/n21 ) );
  INV_X1 \byte_controller/U23  ( .A(\byte_controller/n19 ), .ZN(
        \byte_controller/n48 ) );
  AND2_X1 \byte_controller/U22  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n148 ), .ZN(\byte_controller/n23 ) );
  AND2_X1 \byte_controller/U21  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n148 ), .ZN(\byte_controller/n19 ) );
  AND2_X1 \byte_controller/U20  ( .A1(\byte_controller/n125 ), .A2(
        \byte_controller/n126 ), .ZN(\byte_controller/n17 ) );
  CLKBUF_X1 \byte_controller/U19  ( .A(\byte_controller/n66 ), .Z(
        \byte_controller/n16 ) );
  INV_X1 \byte_controller/U18  ( .A(\byte_controller/n11 ), .ZN(
        \byte_controller/n14 ) );
  CLKBUF_X1 \byte_controller/U17  ( .A(\byte_controller/n65 ), .Z(
        \byte_controller/n13 ) );
  INV_X1 \byte_controller/U16  ( .A(\byte_controller/n13 ), .ZN(
        \byte_controller/n12 ) );
  INV_X1 \byte_controller/U15  ( .A(\byte_controller/n71 ), .ZN(
        \byte_controller/n11 ) );
  CLKBUF_X1 \byte_controller/U14  ( .A(\byte_controller/n32 ), .Z(
        \byte_controller/n38 ) );
  BUF_X1 \byte_controller/U13  ( .A(\byte_controller/n121 ), .Z(
        \byte_controller/n10 ) );
  BUF_X1 \byte_controller/U12  ( .A(\byte_controller/n121 ), .Z(
        \byte_controller/n9 ) );
  BUF_X1 \byte_controller/U11  ( .A(\byte_controller/n121 ), .Z(
        \byte_controller/n8 ) );
  AND2_X1 \byte_controller/U10  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/n77 ), .ZN(\byte_controller/n4 ) );
  AND4_X2 \byte_controller/U9  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n125 ), .A3(\byte_controller/n126 ), .A4(
        \byte_controller/n123 ), .ZN(\byte_controller/n40 ) );
  AND2_X1 \byte_controller/U8  ( .A1(\byte_controller/n40 ), .A2(
        \byte_controller/n148 ), .ZN(\byte_controller/n3 ) );
  INV_X1 \byte_controller/U7  ( .A(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n2 ) );
  BUF_X1 \byte_controller/U6  ( .A(\byte_controller/n37 ), .Z(
        \byte_controller/n20 ) );
  AND2_X1 \byte_controller/U5  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n37 ), .ZN(\byte_controller/n33 ) );
  AND2_X1 \byte_controller/U4  ( .A1(\byte_controller/n26 ), .A2(
        \byte_controller/n37 ), .ZN(\byte_controller/n1 ) );
  OR3_X4 \byte_controller/U3  ( .A1(\byte_controller/n27 ), .A2(wb_rst_i), 
        .A3(\byte_controller/ld ), .ZN(\byte_controller/n120 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n80 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(
        \byte_controller/core_cmd [3]) );
  DFFR_X2 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n81 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(
        \byte_controller/core_cmd [2]) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n79 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(irxack), .QN(\byte_controller/n161 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n89 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(\byte_controller/n55 ), .QN(
        \byte_controller/n18 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .QN(\byte_controller/n27 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/n85 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n126 ) );
  DFFR_X1 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/n84 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n123 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/n91 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/n69 ), .QN(
        \byte_controller/n125 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n82 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n28 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/n86 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(\byte_controller/c_state [1]), .QN(\byte_controller/n148 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/n87 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [0]), .QN(
        \byte_controller/n61 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n83 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(
        \byte_controller/core_cmd [0]) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(done), .QN(
        \byte_controller/n5 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[0]), .QN(
        \byte_controller/n106 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n92 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[7]), .QN(
        \byte_controller/n6 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n93 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[6]), .QN(
        \byte_controller/n119 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n94 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[5]), .QN(
        \byte_controller/n116 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n95 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[4]), .QN(
        \byte_controller/n114 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[3]), .QN(
        \byte_controller/n112 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[2]), .QN(
        \byte_controller/n110 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(rxr[1]), .QN(
        \byte_controller/n108 ) );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n88 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(\byte_controller/n7 ), .QN(
        \byte_controller/n15 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n90 ), .CK(
        wb_clk_i), .RN(\byte_controller/n36 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n56 ) );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N106 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n36 ), .Q(\byte_controller/ld ) );
  AOI21_X1 \byte_controller/bit_controller/U191  ( .B1(
        \byte_controller/bit_controller/n130 ), .B2(
        \byte_controller/bit_controller/n9 ), .A(
        \byte_controller/bit_controller/n231 ), .ZN(
        \byte_controller/bit_controller/N172 ) );
  AOI211_X1 \byte_controller/bit_controller/U190  ( .C1(
        \byte_controller/bit_controller/n89 ), .C2(
        \byte_controller/bit_controller/n88 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N76 ) );
  NOR3_X1 \byte_controller/bit_controller/U189  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/N70 ), .A3(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  INV_X1 \byte_controller/bit_controller/U188  ( .A(
        \byte_controller/bit_controller/n229 ), .ZN(
        \byte_controller/bit_controller/n102 ) );
  INV_X1 \byte_controller/bit_controller/U187  ( .A(
        \byte_controller/bit_controller/n228 ), .ZN(
        \byte_controller/bit_controller/n134 ) );
  MUX2_X1 \byte_controller/bit_controller/U186  ( .A(
        \byte_controller/bit_controller/n227 ), .B(
        \byte_controller/bit_controller/n226 ), .S(
        \byte_controller/bit_controller/n225 ), .Z(
        \byte_controller/bit_controller/n228 ) );
  AOI21_X1 \byte_controller/bit_controller/U185  ( .B1(
        \byte_controller/bit_controller/n16 ), .B2(
        \byte_controller/bit_controller/n224 ), .A(
        \byte_controller/bit_controller/n223 ), .ZN(
        \byte_controller/bit_controller/n225 ) );
  INV_X1 \byte_controller/bit_controller/U184  ( .A(
        \byte_controller/bit_controller/n222 ), .ZN(
        \byte_controller/bit_controller/n223 ) );
  INV_X1 \byte_controller/bit_controller/U183  ( .A(
        \byte_controller/bit_controller/n231 ), .ZN(
        \byte_controller/bit_controller/n224 ) );
  AOI211_X1 \byte_controller/bit_controller/U182  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n221 ), .A(\byte_controller/bit_controller/n220 ), .B(
        \byte_controller/bit_controller/n219 ), .ZN(
        \byte_controller/bit_controller/n226 ) );
  NAND3_X1 \byte_controller/bit_controller/U181  ( .A1(
        \byte_controller/bit_controller/n218 ), .A2(
        \byte_controller/bit_controller/n217 ), .A3(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n219 ) );
  INV_X1 \byte_controller/bit_controller/U180  ( .A(
        \byte_controller/bit_controller/n216 ), .ZN(
        \byte_controller/bit_controller/n218 ) );
  NAND4_X1 \byte_controller/bit_controller/U179  ( .A1(
        \byte_controller/bit_controller/n18 ), .A2(
        \byte_controller/bit_controller/n125 ), .A3(
        \byte_controller/bit_controller/n131 ), .A4(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n220 ) );
  NAND3_X1 \byte_controller/bit_controller/U178  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n122 ), .A3(
        \byte_controller/bit_controller/n215 ), .ZN(
        \byte_controller/bit_controller/n221 ) );
  OAI22_X1 \byte_controller/bit_controller/U177  ( .A1(
        \byte_controller/bit_controller/n67 ), .A2(
        \byte_controller/bit_controller/n214 ), .B1(
        \byte_controller/bit_controller/n125 ), .B2(
        \byte_controller/bit_controller/n95 ), .ZN(
        \byte_controller/bit_controller/n138 ) );
  OAI22_X1 \byte_controller/bit_controller/U176  ( .A1(
        \byte_controller/bit_controller/n67 ), .A2(
        \byte_controller/bit_controller/n217 ), .B1(
        \byte_controller/bit_controller/n214 ), .B2(
        \byte_controller/bit_controller/n222 ), .ZN(
        \byte_controller/bit_controller/n139 ) );
  OAI22_X1 \byte_controller/bit_controller/U175  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n66 ), .B1(
        \byte_controller/bit_controller/n222 ), .B2(
        \byte_controller/bit_controller/n217 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  OAI33_X1 \byte_controller/bit_controller/U174  ( .A1(
        \byte_controller/bit_controller/n213 ), .A2(
        \byte_controller/bit_controller/n212 ), .A3(
        \byte_controller/bit_controller/n211 ), .B1(
        \byte_controller/bit_controller/N70 ), .B2(
        \byte_controller/bit_controller/n210 ), .B3(
        \byte_controller/bit_controller/n227 ), .ZN(
        \byte_controller/bit_controller/N84 ) );
  NAND2_X1 \byte_controller/bit_controller/U173  ( .A1(
        \byte_controller/bit_controller/n209 ), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n213 ) );
  OAI22_X1 \byte_controller/bit_controller/U172  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n67 ), .B1(
        \byte_controller/bit_controller/n96 ), .B2(
        \byte_controller/bit_controller/n210 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  NOR2_X1 \byte_controller/bit_controller/U171  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n103 ) );
  MUX2_X1 \byte_controller/bit_controller/U170  ( .A(
        \byte_controller/bit_controller/n206 ), .B(
        \byte_controller/bit_controller/n91 ), .S(
        \byte_controller/bit_controller/n104 ), .Z(
        \byte_controller/bit_controller/n207 ) );
  NAND3_X1 \byte_controller/bit_controller/U169  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n205 ), .A3(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  NAND2_X1 \byte_controller/bit_controller/U168  ( .A1(
        \byte_controller/bit_controller/n203 ), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/N64 ) );
  OAI21_X1 \byte_controller/bit_controller/U167  ( .B1(
        \byte_controller/bit_controller/n87 ), .B2(
        \byte_controller/bit_controller/n99 ), .A(
        \byte_controller/bit_controller/n20 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  INV_X1 \byte_controller/bit_controller/U166  ( .A(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  AOI222_X1 \byte_controller/bit_controller/U165  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(prer[0]), .B1(
        \byte_controller/bit_controller/N32 ), .B2(
        \byte_controller/bit_controller/n71 ), .C1(
        \byte_controller/bit_controller/n69 ), .C2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n201 ) );
  INV_X1 \byte_controller/bit_controller/U164  ( .A(
        \byte_controller/bit_controller/n199 ), .ZN(
        \byte_controller/bit_controller/n233 ) );
  AOI222_X1 \byte_controller/bit_controller/U163  ( .A1(
        \byte_controller/bit_controller/N47 ), .A2(
        \byte_controller/bit_controller/n72 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  INV_X1 \byte_controller/bit_controller/U162  ( .A(
        \byte_controller/bit_controller/n198 ), .ZN(
        \byte_controller/bit_controller/n234 ) );
  AOI222_X1 \byte_controller/bit_controller/U161  ( .A1(
        \byte_controller/bit_controller/N46 ), .A2(
        \byte_controller/bit_controller/n22 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  INV_X1 \byte_controller/bit_controller/U160  ( .A(
        \byte_controller/bit_controller/n197 ), .ZN(
        \byte_controller/bit_controller/n235 ) );
  AOI222_X1 \byte_controller/bit_controller/U159  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n72 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [11]), .C1(prer[11]), .C2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  INV_X1 \byte_controller/bit_controller/U158  ( .A(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/n237 ) );
  AOI222_X1 \byte_controller/bit_controller/U157  ( .A1(
        \byte_controller/bit_controller/N44 ), .A2(
        \byte_controller/bit_controller/n72 ), .B1(
        \byte_controller/bit_controller/n69 ), .B2(
        \byte_controller/bit_controller/cnt [12]), .C1(prer[12]), .C2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n196 ) );
  INV_X1 \byte_controller/bit_controller/U156  ( .A(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n238 ) );
  AOI222_X1 \byte_controller/bit_controller/U155  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n21 ), .B1(
        \byte_controller/bit_controller/n25 ), .B2(
        \byte_controller/bit_controller/cnt [10]), .C1(prer[10]), .C2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n195 ) );
  INV_X1 \byte_controller/bit_controller/U154  ( .A(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n232 ) );
  AOI222_X1 \byte_controller/bit_controller/U153  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n22 ), .B1(
        \byte_controller/bit_controller/n25 ), .B2(
        \byte_controller/bit_controller/n193 ), .C1(prer[8]), .C2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n194 ) );
  INV_X1 \byte_controller/bit_controller/U152  ( .A(
        \byte_controller/bit_controller/n192 ), .ZN(
        \byte_controller/bit_controller/n239 ) );
  AOI222_X1 \byte_controller/bit_controller/U151  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/N41 ), .B1(
        \byte_controller/bit_controller/n23 ), .B2(
        \byte_controller/bit_controller/cnt [9]), .C1(prer[9]), .C2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n192 ) );
  INV_X1 \byte_controller/bit_controller/U150  ( .A(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n166 ) );
  AOI222_X1 \byte_controller/bit_controller/U149  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(prer[1]), .B1(
        \byte_controller/bit_controller/n71 ), .B2(
        \byte_controller/bit_controller/N33 ), .C1(
        \byte_controller/bit_controller/n69 ), .C2(
        \byte_controller/bit_controller/n38 ), .ZN(
        \byte_controller/bit_controller/n191 ) );
  INV_X1 \byte_controller/bit_controller/U148  ( .A(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  AOI222_X1 \byte_controller/bit_controller/U147  ( .A1(prer[2]), .A2(
        \byte_controller/bit_controller/n35 ), .B1(
        \byte_controller/bit_controller/N34 ), .B2(
        \byte_controller/bit_controller/n71 ), .C1(
        \byte_controller/bit_controller/n26 ), .C2(
        \byte_controller/bit_controller/n64 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  INV_X1 \byte_controller/bit_controller/U146  ( .A(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n236 ) );
  AOI222_X1 \byte_controller/bit_controller/U145  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n22 ), .B1(
        \byte_controller/bit_controller/n25 ), .B2(
        \byte_controller/bit_controller/n44 ), .C1(prer[5]), .C2(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n189 ) );
  OAI21_X1 \byte_controller/bit_controller/U144  ( .B1(
        \byte_controller/bit_controller/n87 ), .B2(
        \byte_controller/bit_controller/N69 ), .A(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  OAI22_X1 \byte_controller/bit_controller/U143  ( .A1(ctr[7]), .A2(wb_rst_i), 
        .B1(\byte_controller/bit_controller/n185 ), .B2(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  NAND4_X1 \byte_controller/bit_controller/U142  ( .A1(
        \byte_controller/bit_controller/n184 ), .A2(
        \byte_controller/bit_controller/n183 ), .A3(
        \byte_controller/bit_controller/n58 ), .A4(
        \byte_controller/bit_controller/n119 ), .ZN(
        \byte_controller/bit_controller/n185 ) );
  NAND4_X1 \byte_controller/bit_controller/U141  ( .A1(
        \byte_controller/bit_controller/n182 ), .A2(
        \byte_controller/bit_controller/n33 ), .A3(
        \byte_controller/bit_controller/n109 ), .A4(
        \byte_controller/bit_controller/n108 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  INV_X1 \byte_controller/bit_controller/U140  ( .A(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/n181 ) );
  NAND2_X1 \byte_controller/bit_controller/U139  ( .A1(
        \byte_controller/bit_controller/n179 ), .A2(ctr[7]), .ZN(
        \byte_controller/bit_controller/n202 ) );
  INV_X1 \byte_controller/bit_controller/U138  ( .A(
        \byte_controller/bit_controller/n15 ), .ZN(
        \byte_controller/bit_controller/n193 ) );
  NOR4_X1 \byte_controller/bit_controller/U137  ( .A1(
        \byte_controller/bit_controller/n37 ), .A2(
        \byte_controller/bit_controller/n39 ), .A3(
        \byte_controller/bit_controller/cnt [5]), .A4(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/n178 ) );
  OAI211_X1 \byte_controller/bit_controller/U136  ( .C1(
        \byte_controller/bit_controller/n175 ), .C2(
        \byte_controller/bit_controller/n174 ), .A(
        \byte_controller/bit_controller/n173 ), .B(
        \byte_controller/bit_controller/n172 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  AOI22_X1 \byte_controller/bit_controller/U135  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n231 ), .B1(
        \byte_controller/bit_controller/n174 ), .B2(scl_padoen_o), .ZN(
        \byte_controller/bit_controller/n172 ) );
  NAND2_X1 \byte_controller/bit_controller/U134  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n231 ) );
  NAND3_X1 \byte_controller/bit_controller/U133  ( .A1(
        \byte_controller/bit_controller/n65 ), .A2(scl_padoen_o), .A3(
        \byte_controller/bit_controller/n170 ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  NOR3_X1 \byte_controller/bit_controller/U132  ( .A1(
        \byte_controller/bit_controller/n230 ), .A2(
        \byte_controller/bit_controller/n97 ), .A3(
        \byte_controller/bit_controller/n216 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  NAND2_X1 \byte_controller/bit_controller/U131  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n214 ), .ZN(
        \byte_controller/bit_controller/n216 ) );
  NAND2_X1 \byte_controller/bit_controller/U130  ( .A1(
        \byte_controller/bit_controller/n132 ), .A2(
        \byte_controller/bit_controller/n95 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  NOR4_X1 \byte_controller/bit_controller/U129  ( .A1(
        \byte_controller/bit_controller/n164 ), .A2(
        \byte_controller/bit_controller/n163 ), .A3(
        \byte_controller/bit_controller/n92 ), .A4(
        \byte_controller/bit_controller/n94 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  NAND3_X1 \byte_controller/bit_controller/U128  ( .A1(
        \byte_controller/bit_controller/n217 ), .A2(
        \byte_controller/bit_controller/n214 ), .A3(
        \byte_controller/bit_controller/n3 ), .ZN(
        \byte_controller/bit_controller/n163 ) );
  NAND4_X1 \byte_controller/bit_controller/U127  ( .A1(
        \byte_controller/bit_controller/n128 ), .A2(
        \byte_controller/bit_controller/n18 ), .A3(
        \byte_controller/bit_controller/n131 ), .A4(
        \byte_controller/bit_controller/n34 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  OAI21_X1 \byte_controller/bit_controller/U126  ( .B1(
        \byte_controller/bit_controller/n132 ), .B2(
        \byte_controller/bit_controller/n96 ), .A(
        \byte_controller/bit_controller/n162 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  NAND4_X1 \byte_controller/bit_controller/U125  ( .A1(
        \byte_controller/bit_controller/n10 ), .A2(
        \byte_controller/bit_controller/n161 ), .A3(
        \byte_controller/bit_controller/n160 ), .A4(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n162 ) );
  OAI22_X1 \byte_controller/bit_controller/U124  ( .A1(
        \byte_controller/bit_controller/n67 ), .A2(
        \byte_controller/bit_controller/n3 ), .B1(
        \byte_controller/bit_controller/n130 ), .B2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  OAI22_X1 \byte_controller/bit_controller/U123  ( .A1(
        \byte_controller/bit_controller/n66 ), .A2(
        \byte_controller/bit_controller/n159 ), .B1(
        \byte_controller/bit_controller/n95 ), .B2(
        \byte_controller/bit_controller/n3 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OAI22_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/n6 ), .A2(
        \byte_controller/bit_controller/n67 ), .B1(
        \byte_controller/bit_controller/n222 ), .B2(
        \byte_controller/bit_controller/n159 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI22_X1 \byte_controller/bit_controller/U121  ( .A1(
        \byte_controller/bit_controller/n132 ), .A2(
        \byte_controller/bit_controller/n67 ), .B1(
        \byte_controller/bit_controller/n131 ), .B2(
        \byte_controller/bit_controller/n95 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  OAI21_X1 \byte_controller/bit_controller/U120  ( .B1(
        \byte_controller/bit_controller/n126 ), .B2(
        \byte_controller/bit_controller/n95 ), .A(
        \byte_controller/bit_controller/n158 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  NAND3_X1 \byte_controller/bit_controller/U119  ( .A1(
        \byte_controller/bit_controller/n157 ), .A2(
        \byte_controller/bit_controller/n160 ), .A3(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/n158 ) );
  NOR3_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/bit_controller/n209 ), .A2(
        \byte_controller/bit_controller/n156 ), .A3(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OAI22_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n128 ), .A2(
        \byte_controller/bit_controller/n66 ), .B1(
        \byte_controller/bit_controller/n14 ), .B2(
        \byte_controller/bit_controller/n222 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  OAI22_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n66 ), .A2(
        \byte_controller/bit_controller/n155 ), .B1(
        \byte_controller/bit_controller/n128 ), .B2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  OAI22_X1 \byte_controller/bit_controller/U115  ( .A1(
        \byte_controller/bit_controller/n129 ), .A2(
        \byte_controller/bit_controller/n66 ), .B1(
        \byte_controller/bit_controller/n96 ), .B2(
        \byte_controller/bit_controller/n155 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  OAI22_X1 \byte_controller/bit_controller/U114  ( .A1(
        \byte_controller/bit_controller/n154 ), .A2(
        \byte_controller/bit_controller/n66 ), .B1(
        \byte_controller/bit_controller/n129 ), .B2(
        \byte_controller/bit_controller/n95 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  NAND4_X1 \byte_controller/bit_controller/U113  ( .A1(
        \byte_controller/bit_controller/n16 ), .A2(
        \byte_controller/bit_controller/n204 ), .A3(
        \byte_controller/bit_controller/n205 ), .A4(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n154 ) );
  INV_X1 \byte_controller/bit_controller/U112  ( .A(
        \byte_controller/bit_controller/n156 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  NAND2_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n153 ), .A2(
        \byte_controller/bit_controller/n161 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  INV_X1 \byte_controller/bit_controller/U110  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n161 ) );
  OAI22_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n60 ), .A2(
        \byte_controller/bit_controller/n66 ), .B1(
        \byte_controller/bit_controller/n8 ), .B2(
        \byte_controller/bit_controller/n222 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  OAI22_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n62 ), .A2(
        \byte_controller/bit_controller/n66 ), .B1(
        \byte_controller/bit_controller/n12 ), .B2(
        \byte_controller/bit_controller/n96 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  OAI22_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/bit_controller/n67 ), .A2(
        \byte_controller/bit_controller/n215 ), .B1(
        \byte_controller/bit_controller/n17 ), .B2(
        \byte_controller/bit_controller/n95 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  OAI21_X1 \byte_controller/bit_controller/U106  ( .B1(
        \byte_controller/bit_controller/n96 ), .B2(
        \byte_controller/bit_controller/n215 ), .A(
        \byte_controller/bit_controller/n152 ), .ZN(
        \byte_controller/bit_controller/n137 ) );
  NAND4_X1 \byte_controller/bit_controller/U105  ( .A1(
        \byte_controller/bit_controller/n45 ), .A2(
        \byte_controller/bit_controller/n153 ), .A3(
        \byte_controller/bit_controller/n160 ), .A4(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n152 ) );
  INV_X1 \byte_controller/bit_controller/U104  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n204 ) );
  NAND2_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n11 ), .A2(
        \byte_controller/bit_controller/n65 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  NAND3_X1 \byte_controller/bit_controller/U102  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n122 ), .A3(
        \byte_controller/bit_controller/n18 ), .ZN(
        \byte_controller/bit_controller/n230 ) );
  INV_X1 \byte_controller/bit_controller/U101  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n160 ) );
  INV_X1 \byte_controller/bit_controller/U100  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n153 ) );
  NAND2_X1 \byte_controller/bit_controller/U99  ( .A1(
        \byte_controller/bit_controller/n208 ), .A2(
        \byte_controller/bit_controller/n2 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  NOR4_X1 \byte_controller/bit_controller/U98  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n2 ), .A3(
        \byte_controller/bit_controller/n4 ), .A4(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/N74 ) );
  OR2_X1 \byte_controller/bit_controller/U97  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U96  ( .A1(
        \byte_controller/bit_controller/n208 ), .A2(
        \byte_controller/bit_controller/n4 ), .ZN(
        \byte_controller/bit_controller/N70 ) );
  INV_X1 \byte_controller/bit_controller/U95  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n208 ) );
  OR2_X1 \byte_controller/bit_controller/U94  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N68 ) );
  NAND2_X1 \byte_controller/bit_controller/U93  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n96 ) );
  NAND2_X1 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n25 ), .A2(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/n93 ) );
  NAND2_X1 \byte_controller/bit_controller/U91  ( .A1(
        \byte_controller/bit_controller/N45 ), .A2(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n90 ) );
  NAND2_X1 \byte_controller/bit_controller/U90  ( .A1(prer[13]), .A2(
        \byte_controller/bit_controller/n35 ), .ZN(
        \byte_controller/bit_controller/n85 ) );
  AND2_X1 \byte_controller/bit_controller/U89  ( .A1(
        \byte_controller/bit_controller/n26 ), .A2(
        \byte_controller/bit_controller/n24 ), .ZN(
        \byte_controller/bit_controller/n84 ) );
  AND2_X1 \byte_controller/bit_controller/U88  ( .A1(
        \byte_controller/bit_controller/n71 ), .A2(
        \byte_controller/bit_controller/N35 ), .ZN(
        \byte_controller/bit_controller/n83 ) );
  AND2_X1 \byte_controller/bit_controller/U87  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(prer[3]), .ZN(
        \byte_controller/bit_controller/n82 ) );
  AND2_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n26 ), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/n81 ) );
  AND2_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n71 ), .A2(
        \byte_controller/bit_controller/N39 ), .ZN(
        \byte_controller/bit_controller/n80 ) );
  AND2_X1 \byte_controller/bit_controller/U84  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(prer[7]), .ZN(
        \byte_controller/bit_controller/n79 ) );
  AND2_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n69 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n78 ) );
  AND2_X1 \byte_controller/bit_controller/U82  ( .A1(
        \byte_controller/bit_controller/n71 ), .A2(
        \byte_controller/bit_controller/N38 ), .ZN(
        \byte_controller/bit_controller/n77 ) );
  AND2_X1 \byte_controller/bit_controller/U81  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(prer[6]), .ZN(
        \byte_controller/bit_controller/n76 ) );
  AND2_X1 \byte_controller/bit_controller/U80  ( .A1(
        \byte_controller/bit_controller/n26 ), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/n75 ) );
  AND2_X1 \byte_controller/bit_controller/U79  ( .A1(
        \byte_controller/bit_controller/n71 ), .A2(
        \byte_controller/bit_controller/N36 ), .ZN(
        \byte_controller/bit_controller/n74 ) );
  AND2_X1 \byte_controller/bit_controller/U78  ( .A1(
        \byte_controller/bit_controller/n36 ), .A2(prer[4]), .ZN(
        \byte_controller/bit_controller/n73 ) );
  NAND2_X2 \byte_controller/bit_controller/U77  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n222 ) );
  AND4_X1 \byte_controller/bit_controller/U76  ( .A1(
        \byte_controller/bit_controller/n117 ), .A2(
        \byte_controller/bit_controller/n118 ), .A3(
        \byte_controller/bit_controller/n116 ), .A4(
        \byte_controller/bit_controller/n115 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  AND4_X1 \byte_controller/bit_controller/U75  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n111 ), .A4(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  AND4_X1 \byte_controller/bit_controller/U74  ( .A1(
        \byte_controller/bit_controller/n107 ), .A2(
        \byte_controller/bit_controller/n106 ), .A3(
        \byte_controller/bit_controller/n208 ), .A4(
        \byte_controller/bit_controller/n105 ), .ZN(
        \byte_controller/bit_controller/n182 ) );
  AND2_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n179 ), .A2(ctr[7]), .ZN(
        \byte_controller/bit_controller/n68 ) );
  NAND2_X1 \byte_controller/bit_controller/U72  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n222 ), .ZN(
        \byte_controller/bit_controller/n67 ) );
  NAND2_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n222 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  AND2_X1 \byte_controller/bit_controller/U70  ( .A1(
        \byte_controller/bit_controller/n133 ), .A2(
        \byte_controller/bit_controller/n65 ), .ZN(
        \byte_controller/bit_controller/n70 ) );
  INV_X1 \byte_controller/bit_controller/U69  ( .A(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n62 ) );
  INV_X1 \byte_controller/bit_controller/U68  ( .A(
        \byte_controller/bit_controller/n59 ), .ZN(
        \byte_controller/bit_controller/n60 ) );
  AND4_X1 \byte_controller/bit_controller/U67  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n108 ), .A3(
        \byte_controller/bit_controller/n106 ), .A4(
        \byte_controller/bit_controller/n107 ), .ZN(
        \byte_controller/bit_controller/n176 ) );
  AND4_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n112 ), .A2(
        \byte_controller/bit_controller/n109 ), .A3(
        \byte_controller/bit_controller/n111 ), .A4(
        \byte_controller/bit_controller/n110 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  NAND2_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n100 ), .A2(
        \byte_controller/bit_controller/n99 ), .ZN(
        \byte_controller/bit_controller/n50 ) );
  MUX2_X1 \byte_controller/bit_controller/U64  ( .A(
        \byte_controller/bit_controller/n4 ), .B(
        \byte_controller/bit_controller/n101 ), .S(
        \byte_controller/bit_controller/n50 ), .Z(
        \byte_controller/bit_controller/n229 ) );
  NAND2_X1 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/n95 ) );
  AND2_X2 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n86 ), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n49 ) );
  AND4_X1 \byte_controller/bit_controller/U61  ( .A1(
        \byte_controller/bit_controller/n130 ), .A2(
        \byte_controller/bit_controller/n131 ), .A3(
        \byte_controller/bit_controller/n129 ), .A4(
        \byte_controller/bit_controller/n128 ), .ZN(
        \byte_controller/bit_controller/n127 ) );
  AND2_X1 \byte_controller/bit_controller/U60  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n124 ), .ZN(
        \byte_controller/bit_controller/n48 ) );
  NAND3_X1 \byte_controller/bit_controller/U59  ( .A1(
        \byte_controller/bit_controller/n90 ), .A2(
        \byte_controller/bit_controller/n85 ), .A3(
        \byte_controller/bit_controller/n93 ), .ZN(
        \byte_controller/bit_controller/n47 ) );
  BUF_X1 \byte_controller/bit_controller/U58  ( .A(\byte_controller/n36 ), .Z(
        \byte_controller/bit_controller/n51 ) );
  AND2_X1 \byte_controller/bit_controller/U57  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n222 ), .ZN(
        \byte_controller/bit_controller/n46 ) );
  BUF_X1 \byte_controller/bit_controller/U56  ( .A(
        \byte_controller/bit_controller/n51 ), .Z(
        \byte_controller/bit_controller/n57 ) );
  BUF_X1 \byte_controller/bit_controller/U55  ( .A(
        \byte_controller/bit_controller/n57 ), .Z(
        \byte_controller/bit_controller/n52 ) );
  BUF_X1 \byte_controller/bit_controller/U54  ( .A(
        \byte_controller/bit_controller/n56 ), .Z(
        \byte_controller/bit_controller/n55 ) );
  BUF_X1 \byte_controller/bit_controller/U53  ( .A(
        \byte_controller/bit_controller/n56 ), .Z(
        \byte_controller/bit_controller/n53 ) );
  BUF_X1 \byte_controller/bit_controller/U52  ( .A(
        \byte_controller/bit_controller/n56 ), .Z(
        \byte_controller/bit_controller/n54 ) );
  BUF_X1 \byte_controller/bit_controller/U51  ( .A(
        \byte_controller/bit_controller/n51 ), .Z(
        \byte_controller/bit_controller/n56 ) );
  NAND2_X1 \byte_controller/bit_controller/U50  ( .A1(
        \byte_controller/bit_controller/n176 ), .A2(
        \byte_controller/bit_controller/n177 ), .ZN(
        \byte_controller/bit_controller/n43 ) );
  NAND2_X1 \byte_controller/bit_controller/U49  ( .A1(
        \byte_controller/bit_controller/n41 ), .A2(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n179 ) );
  NAND4_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n117 ), .A2(
        \byte_controller/bit_controller/n120 ), .A3(
        \byte_controller/bit_controller/n119 ), .A4(
        \byte_controller/bit_controller/n118 ), .ZN(
        \byte_controller/bit_controller/n42 ) );
  NOR2_X1 \byte_controller/bit_controller/U47  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/n41 ) );
  INV_X1 \byte_controller/bit_controller/U46  ( .A(
        \byte_controller/bit_controller/n114 ), .ZN(
        \byte_controller/bit_controller/n39 ) );
  INV_X1 \byte_controller/bit_controller/U45  ( .A(
        \byte_controller/bit_controller/n119 ), .ZN(
        \byte_controller/bit_controller/n38 ) );
  INV_X1 \byte_controller/bit_controller/U44  ( .A(
        \byte_controller/bit_controller/n113 ), .ZN(
        \byte_controller/bit_controller/n37 ) );
  INV_X1 \byte_controller/bit_controller/U43  ( .A(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/n200 ) );
  INV_X1 \byte_controller/bit_controller/U42  ( .A(
        \byte_controller/bit_controller/n27 ), .ZN(
        \byte_controller/bit_controller/n36 ) );
  INV_X1 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n188 ), .ZN(
        \byte_controller/bit_controller/n35 ) );
  AND2_X1 \byte_controller/bit_controller/U40  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n123 ), .ZN(
        \byte_controller/bit_controller/n34 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n110 ), .Z(
        \byte_controller/bit_controller/n33 ) );
  AND2_X1 \byte_controller/bit_controller/U38  ( .A1(ctr[7]), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n32 ) );
  OR3_X2 \byte_controller/bit_controller/U37  ( .A1(
        \byte_controller/bit_controller/n84 ), .A2(
        \byte_controller/bit_controller/n83 ), .A3(
        \byte_controller/bit_controller/n82 ), .ZN(
        \byte_controller/bit_controller/n30 ) );
  OR3_X2 \byte_controller/bit_controller/U36  ( .A1(
        \byte_controller/bit_controller/n79 ), .A2(
        \byte_controller/bit_controller/n80 ), .A3(
        \byte_controller/bit_controller/n81 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  OAI21_X1 \byte_controller/bit_controller/U35  ( .B1(
        \byte_controller/bit_controller/n87 ), .B2(
        \byte_controller/bit_controller/N69 ), .A(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  AND3_X1 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n202 ), .A2(
        \byte_controller/bit_controller/n181 ), .A3(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n69 ) );
  AND3_X1 \byte_controller/bit_controller/U33  ( .A1(
        \byte_controller/bit_controller/n202 ), .A2(
        \byte_controller/bit_controller/n181 ), .A3(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  AND3_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n202 ), .A2(
        \byte_controller/bit_controller/n181 ), .A3(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U31  ( .A(
        \byte_controller/bit_controller/cnt [3]), .Z(
        \byte_controller/bit_controller/n24 ) );
  AND3_X1 \byte_controller/bit_controller/U30  ( .A1(
        \byte_controller/bit_controller/n202 ), .A2(
        \byte_controller/bit_controller/n181 ), .A3(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n23 ) );
  AND2_X1 \byte_controller/bit_controller/U29  ( .A1(
        \byte_controller/bit_controller/n68 ), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n72 ) );
  AND2_X1 \byte_controller/bit_controller/U28  ( .A1(
        \byte_controller/bit_controller/n68 ), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n22 ) );
  AND2_X1 \byte_controller/bit_controller/U27  ( .A1(
        \byte_controller/bit_controller/n68 ), .A2(
        \byte_controller/bit_controller/n208 ), .ZN(
        \byte_controller/bit_controller/n21 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U26  ( .A(
        \byte_controller/bit_controller/n202 ), .Z(
        \byte_controller/bit_controller/n20 ) );
  BUF_X1 \byte_controller/bit_controller/U25  ( .A(
        \byte_controller/bit_controller/n120 ), .Z(
        \byte_controller/bit_controller/n58 ) );
  INV_X1 \byte_controller/bit_controller/U24  ( .A(
        \byte_controller/bit_controller/n58 ), .ZN(
        \byte_controller/bit_controller/n19 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U23  ( .A(
        \byte_controller/bit_controller/n62 ), .Z(
        \byte_controller/bit_controller/n17 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U22  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/n64 ) );
  AND2_X1 \byte_controller/bit_controller/U21  ( .A1(
        \byte_controller/bit_controller/n11 ), .A2(
        \byte_controller/bit_controller/n65 ), .ZN(
        \byte_controller/bit_controller/n16 ) );
  AND2_X1 \byte_controller/bit_controller/U20  ( .A1(
        \byte_controller/bit_controller/n179 ), .A2(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n71 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U19  ( .A(
        \byte_controller/bit_controller/n112 ), .Z(
        \byte_controller/bit_controller/n15 ) );
  OR3_X1 \byte_controller/bit_controller/U18  ( .A1(
        \byte_controller/bit_controller/n78 ), .A2(
        \byte_controller/bit_controller/n77 ), .A3(
        \byte_controller/bit_controller/n76 ), .ZN(
        \byte_controller/bit_controller/n29 ) );
  INV_X1 \byte_controller/bit_controller/U17  ( .A(
        \byte_controller/bit_controller/n116 ), .ZN(
        \byte_controller/bit_controller/n40 ) );
  INV_X1 \byte_controller/bit_controller/U16  ( .A(
        \byte_controller/bit_controller/n13 ), .ZN(
        \byte_controller/bit_controller/n14 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U15  ( .A(
        \byte_controller/bit_controller/n60 ), .Z(
        \byte_controller/bit_controller/n12 ) );
  AND4_X2 \byte_controller/bit_controller/U14  ( .A1(
        \byte_controller/bit_controller/n127 ), .A2(
        \byte_controller/bit_controller/n3 ), .A3(
        \byte_controller/bit_controller/n155 ), .A4(
        \byte_controller/bit_controller/n159 ), .ZN(
        \byte_controller/bit_controller/n65 ) );
  AND4_X1 \byte_controller/bit_controller/U13  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(
        \byte_controller/bit_controller/n215 ), .A3(
        \byte_controller/bit_controller/n217 ), .A4(
        \byte_controller/bit_controller/n9 ), .ZN(
        \byte_controller/bit_controller/n133 ) );
  AND4_X2 \byte_controller/bit_controller/U12  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(
        \byte_controller/bit_controller/n215 ), .A3(
        \byte_controller/bit_controller/n217 ), .A4(
        \byte_controller/bit_controller/n9 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  AND3_X1 \byte_controller/bit_controller/U11  ( .A1(
        \byte_controller/bit_controller/n46 ), .A2(
        \byte_controller/bit_controller/n70 ), .A3(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n45 ) );
  AND3_X1 \byte_controller/bit_controller/U10  ( .A1(
        \byte_controller/bit_controller/n46 ), .A2(
        \byte_controller/bit_controller/n70 ), .A3(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  INV_X1 \byte_controller/bit_controller/U9  ( .A(
        \byte_controller/bit_controller/n7 ), .ZN(
        \byte_controller/bit_controller/n8 ) );
  AND3_X1 \byte_controller/bit_controller/U8  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n122 ), .A3(
        \byte_controller/bit_controller/n18 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  AND4_X2 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n48 ), .A2(
        \byte_controller/bit_controller/n214 ), .A3(
        \byte_controller/bit_controller/n126 ), .A4(
        \byte_controller/bit_controller/n132 ), .ZN(
        \byte_controller/bit_controller/n63 ) );
  INV_X1 \byte_controller/bit_controller/U6  ( .A(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n6 ) );
  INV_X1 \byte_controller/bit_controller/U5  ( .A(
        \byte_controller/bit_controller/n115 ), .ZN(
        \byte_controller/bit_controller/n44 ) );
  BUF_X1 \byte_controller/bit_controller/U4  ( .A(
        \byte_controller/bit_controller/n21 ), .Z(
        \byte_controller/bit_controller/n1 ) );
  OR3_X1 \byte_controller/bit_controller/U3  ( .A1(
        \byte_controller/bit_controller/n75 ), .A2(
        \byte_controller/bit_controller/n74 ), .A3(
        \byte_controller/bit_controller/n73 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/n36 ), .Q(\byte_controller/bit_controller/n13 ), .QN(
        \byte_controller/bit_controller/n18 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n5 ), .QN(
        \byte_controller/bit_controller/n131 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .QN(
        \byte_controller/bit_controller/n126 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n132 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n7 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n128 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n138 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .QN(
        \byte_controller/bit_controller/n125 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/n92 ), .QN(
        \byte_controller/bit_controller/n159 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/n94 ), .QN(
        \byte_controller/bit_controller/n155 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n169 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .QN(
        \byte_controller/bit_controller/n210 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/N64 ), .CK(wb_clk_i), .SN(
        \byte_controller/n36 ), .Q(\byte_controller/bit_controller/n171 ), 
        .QN(\byte_controller/bit_controller/n104 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n129 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n103 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/n212 ), .QN(
        \byte_controller/bit_controller/n91 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .Q(\byte_controller/bit_controller/n180 ), .QN(
        \byte_controller/bit_controller/n87 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n134 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n227 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n168 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n55 ), .Q(scl_padoen_o) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N70 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n98 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .QN(
        \byte_controller/bit_controller/n100 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n166 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [1]), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n137 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/n97 ), .QN(
        \byte_controller/bit_controller/n215 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n29 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n165 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [2]), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n28 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [7]), .QN(
        \byte_controller/bit_controller/n113 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n31 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n116 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n30 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [3]), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n139 ), .CK(wb_clk_i), .RN(
        \byte_controller/n36 ), .QN(\byte_controller/bit_controller/n214 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n236 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n239 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [9]), .QN(
        \byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N84 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n86 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n167 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/cnt [0]), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n47 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n107 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n234 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n238 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n233 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n105 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n235 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n237 ), .CK(wb_clk_i), .RN(
        \byte_controller/n36 ), .Q(\byte_controller/bit_controller/cnt [12]), 
        .QN(\byte_controller/bit_controller/n108 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n130 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N172 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .QN(
        \byte_controller/bit_controller/n3 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n135 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/n59 ), .QN(
        \byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n136 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/n61 ), .QN(
        \byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n140 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n52 ), .QN(
        \byte_controller/bit_controller/n217 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n232 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n102 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ), .QN(\byte_controller/bit_controller/n101 ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N76 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N74 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/sto_condition ), .QN(
        \byte_controller/bit_controller/n211 ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n53 ), .QN(
        \byte_controller/bit_controller/n88 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n54 ), .Q(
        \byte_controller/bit_controller/n99 ), .QN(
        \byte_controller/bit_controller/n2 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n55 ), .QN(
        \byte_controller/bit_controller/n4 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U139  ( .A1(
        \byte_controller/bit_controller/sub_103/n121 ), .A2(
        \byte_controller/bit_controller/sub_103/n97 ), .A3(
        \byte_controller/bit_controller/sub_103/n122 ), .ZN(
        \byte_controller/bit_controller/sub_103/n118 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U138  ( .A1(
        \byte_controller/bit_controller/sub_103/n48 ), .A2(
        \byte_controller/bit_controller/sub_103/n45 ), .A3(
        \byte_controller/bit_controller/sub_103/n120 ), .ZN(
        \byte_controller/bit_controller/sub_103/n119 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U137  ( .A1(
        \byte_controller/bit_controller/sub_103/n31 ), .A2(
        \byte_controller/bit_controller/sub_103/n45 ), .ZN(
        \byte_controller/bit_controller/sub_103/n116 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U136  ( .A1(
        \byte_controller/bit_controller/sub_103/n115 ), .A2(
        \byte_controller/bit_controller/sub_103/n97 ), .ZN(
        \byte_controller/bit_controller/sub_103/n112 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U135  ( .A1(
        \byte_controller/bit_controller/sub_103/n110 ), .A2(
        \byte_controller/bit_controller/sub_103/n111 ), .ZN(
        \byte_controller/bit_controller/sub_103/n109 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U134  ( .A(
        \byte_controller/bit_controller/sub_103/n108 ), .B(
        \byte_controller/bit_controller/sub_103/n109 ), .S(
        \byte_controller/bit_controller/cnt [10]), .Z(
        \byte_controller/bit_controller/N42 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U133  ( .A1(
        \byte_controller/bit_controller/sub_103/n122 ), .A2(
        \byte_controller/bit_controller/sub_103/n95 ), .A3(
        \byte_controller/bit_controller/sub_103/n107 ), .A4(
        \byte_controller/bit_controller/sub_103/n97 ), .ZN(
        \byte_controller/bit_controller/sub_103/n103 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U132  ( .A1(
        \byte_controller/bit_controller/sub_103/n105 ), .A2(
        \byte_controller/bit_controller/sub_103/n53 ), .A3(
        \byte_controller/bit_controller/sub_103/n106 ), .ZN(
        \byte_controller/bit_controller/sub_103/n104 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U131  ( .A1(
        \byte_controller/bit_controller/sub_103/n103 ), .A2(
        \byte_controller/bit_controller/sub_103/n104 ), .ZN(
        \byte_controller/bit_controller/sub_103/n98 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U130  ( .A1(
        \byte_controller/bit_controller/sub_103/n100 ), .A2(
        \byte_controller/bit_controller/sub_103/n89 ), .A3(
        \byte_controller/bit_controller/sub_103/n101 ), .A4(
        \byte_controller/bit_controller/sub_103/n102 ), .ZN(
        \byte_controller/bit_controller/sub_103/n99 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U129  ( .A(
        \byte_controller/bit_controller/sub_103/n98 ), .B(
        \byte_controller/bit_controller/sub_103/n99 ), .S(
        \byte_controller/bit_controller/cnt [11]), .Z(
        \byte_controller/bit_controller/N43 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U128  ( .A1(
        \byte_controller/bit_controller/sub_103/n32 ), .A2(
        \byte_controller/bit_controller/sub_103/n95 ), .A3(
        \byte_controller/bit_controller/sub_103/n96 ), .A4(
        \byte_controller/bit_controller/sub_103/n97 ), .ZN(
        \byte_controller/bit_controller/sub_103/n91 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U127  ( .A1(
        \byte_controller/bit_controller/sub_103/n93 ), .A2(
        \byte_controller/bit_controller/sub_103/n44 ), .A3(
        \byte_controller/bit_controller/sub_103/n94 ), .A4(
        \byte_controller/bit_controller/sub_103/n53 ), .ZN(
        \byte_controller/bit_controller/sub_103/n92 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U126  ( .A1(
        \byte_controller/bit_controller/sub_103/n91 ), .A2(
        \byte_controller/bit_controller/sub_103/n92 ), .ZN(
        \byte_controller/bit_controller/sub_103/n86 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U125  ( .A1(
        \byte_controller/bit_controller/sub_103/n101 ), .A2(
        \byte_controller/bit_controller/sub_103/n89 ), .A3(
        \byte_controller/bit_controller/sub_103/n88 ), .A4(
        \byte_controller/bit_controller/sub_103/n90 ), .ZN(
        \byte_controller/bit_controller/sub_103/n87 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U124  ( .A(
        \byte_controller/bit_controller/sub_103/n86 ), .B(
        \byte_controller/bit_controller/sub_103/n87 ), .S(
        \byte_controller/bit_controller/cnt [12]), .Z(
        \byte_controller/bit_controller/N44 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U123  ( .A1(
        \byte_controller/bit_controller/sub_103/n21 ), .A2(
        \byte_controller/bit_controller/sub_103/n39 ), .A3(
        \byte_controller/bit_controller/sub_103/n84 ), .A4(
        \byte_controller/bit_controller/sub_103/n85 ), .ZN(
        \byte_controller/bit_controller/sub_103/n81 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U122  ( .A1(
        \byte_controller/bit_controller/sub_103/n93 ), .A2(
        \byte_controller/bit_controller/N32 ), .A3(
        \byte_controller/bit_controller/sub_103/n83 ), .A4(
        \byte_controller/bit_controller/sub_103/n4 ), .ZN(
        \byte_controller/bit_controller/sub_103/n82 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U121  ( .A1(
        \byte_controller/bit_controller/sub_103/n81 ), .A2(
        \byte_controller/bit_controller/sub_103/n82 ), .ZN(
        \byte_controller/bit_controller/sub_103/n68 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U120  ( .A1(
        \byte_controller/bit_controller/sub_103/n79 ), .A2(
        \byte_controller/bit_controller/sub_103/n80 ), .ZN(
        \byte_controller/bit_controller/sub_103/n77 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U119  ( .A1(
        \byte_controller/bit_controller/sub_103/n64 ), .A2(
        \byte_controller/bit_controller/sub_103/n123 ), .ZN(
        \byte_controller/bit_controller/sub_103/n78 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U118  ( .A1(
        \byte_controller/bit_controller/sub_103/n75 ), .A2(
        \byte_controller/bit_controller/sub_103/n76 ), .ZN(
        \byte_controller/bit_controller/sub_103/n72 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U117  ( .A1(
        \byte_controller/bit_controller/sub_103/n74 ), .A2(
        \byte_controller/bit_controller/sub_103/n39 ), .ZN(
        \byte_controller/bit_controller/sub_103/n73 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U116  ( .A1(
        \byte_controller/bit_controller/sub_103/n65 ), .A2(
        \byte_controller/bit_controller/sub_103/n66 ), .ZN(
        \byte_controller/bit_controller/sub_103/n63 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U115  ( .A1(
        \byte_controller/bit_controller/sub_103/n61 ), .A2(
        \byte_controller/bit_controller/sub_103/n62 ), .ZN(
        \byte_controller/bit_controller/sub_103/n57 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U114  ( .A1(
        \byte_controller/bit_controller/sub_103/n59 ), .A2(
        \byte_controller/bit_controller/sub_103/n60 ), .ZN(
        \byte_controller/bit_controller/sub_103/n58 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U113  ( .A1(
        \byte_controller/bit_controller/sub_103/n55 ), .A2(
        \byte_controller/bit_controller/sub_103/n56 ), .ZN(
        \byte_controller/bit_controller/sub_103/n54 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U112  ( .A(
        \byte_controller/bit_controller/sub_103/n54 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N47 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U111  ( .A1(
        \byte_controller/bit_controller/sub_103/n5 ), .A2(
        \byte_controller/bit_controller/sub_103/n8 ), .ZN(
        \byte_controller/bit_controller/sub_103/n52 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U110  ( .A1(
        \byte_controller/bit_controller/sub_103/n48 ), .A2(
        \byte_controller/bit_controller/sub_103/n45 ), .A3(
        \byte_controller/bit_controller/sub_103/n120 ), .ZN(
        \byte_controller/bit_controller/sub_103/n41 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U109  ( .A1(
        \byte_controller/bit_controller/sub_103/n44 ), .A2(
        \byte_controller/bit_controller/sub_103/n53 ), .A3(
        \byte_controller/bit_controller/sub_103/n45 ), .ZN(
        \byte_controller/bit_controller/sub_103/n43 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U108  ( .A(
        \byte_controller/bit_controller/sub_103/n40 ), .B(
        \byte_controller/bit_controller/sub_103/n41 ), .S(
        \byte_controller/bit_controller/n44 ), .Z(
        \byte_controller/bit_controller/N37 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U107  ( .A1(
        \byte_controller/bit_controller/sub_103/n35 ), .A2(
        \byte_controller/bit_controller/sub_103/n123 ), .A3(
        \byte_controller/bit_controller/sub_103/n38 ), .A4(
        \byte_controller/bit_controller/sub_103/n39 ), .ZN(
        \byte_controller/bit_controller/sub_103/n37 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U106  ( .A(
        \byte_controller/bit_controller/sub_103/n37 ), .B(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/N38 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U105  ( .A1(
        \byte_controller/bit_controller/sub_103/n48 ), .A2(
        \byte_controller/bit_controller/sub_103/n32 ), .ZN(
        \byte_controller/bit_controller/sub_103/n29 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U104  ( .A1(
        \byte_controller/bit_controller/sub_103/n38 ), .A2(
        \byte_controller/bit_controller/sub_103/n44 ), .ZN(
        \byte_controller/bit_controller/sub_103/n30 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U103  ( .A1(
        \byte_controller/bit_controller/sub_103/n23 ), .A2(
        \byte_controller/bit_controller/sub_103/n28 ), .ZN(
        \byte_controller/bit_controller/N39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U102  ( .A1(
        \byte_controller/bit_controller/sub_103/n13 ), .A2(
        \byte_controller/bit_controller/sub_103/n27 ), .ZN(
        \byte_controller/bit_controller/sub_103/n24 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U101  ( .A1(
        \byte_controller/bit_controller/sub_103/n26 ), .A2(
        \byte_controller/bit_controller/sub_103/n105 ), .ZN(
        \byte_controller/bit_controller/sub_103/n25 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U100  ( .A(
        \byte_controller/bit_controller/sub_103/n22 ), .B(
        \byte_controller/bit_controller/sub_103/n23 ), .S(
        \byte_controller/bit_controller/cnt [8]), .Z(
        \byte_controller/bit_controller/N40 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U99  ( .A1(
        \byte_controller/bit_controller/sub_103/n19 ), .A2(
        \byte_controller/bit_controller/sub_103/n20 ), .A3(
        \byte_controller/bit_controller/sub_103/n21 ), .ZN(
        \byte_controller/bit_controller/sub_103/n16 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U98  ( .A1(
        \byte_controller/bit_controller/sub_103/n26 ), .A2(
        \byte_controller/bit_controller/sub_103/n18 ), .ZN(
        \byte_controller/bit_controller/sub_103/n17 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_103/U97  ( .A1(
        \byte_controller/bit_controller/sub_103/n15 ), .A2(
        \byte_controller/bit_controller/sub_103/n14 ), .A3(
        \byte_controller/bit_controller/sub_103/n13 ), .ZN(
        \byte_controller/bit_controller/sub_103/n12 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_103/U96  ( .A(
        \byte_controller/bit_controller/sub_103/n11 ), .B(
        \byte_controller/bit_controller/sub_103/n12 ), .S(
        \byte_controller/bit_controller/cnt [9]), .Z(
        \byte_controller/bit_controller/N41 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_103/U95  ( .B1(
        \byte_controller/bit_controller/sub_103/n68 ), .B2(
        \byte_controller/bit_controller/sub_103/n69 ), .A(
        \byte_controller/bit_controller/sub_103/n67 ), .ZN(
        \byte_controller/bit_controller/N45 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U94  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n8 ), .ZN(
        \byte_controller/bit_controller/sub_103/n33 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_103/U93  ( .A1(
        \byte_controller/bit_controller/sub_103/n8 ), .A2(
        \byte_controller/bit_controller/cnt [11]), .A3(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n88 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U92  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n9 ), .ZN(
        \byte_controller/bit_controller/sub_103/n120 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U91  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n9 ), .ZN(
        \byte_controller/bit_controller/sub_103/n26 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U90  ( .A1(
        \byte_controller/bit_controller/cnt [10]), .A2(
        \byte_controller/bit_controller/sub_103/n8 ), .ZN(
        \byte_controller/bit_controller/sub_103/n100 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U89  ( .A(
        \byte_controller/bit_controller/sub_103/n9 ), .ZN(
        \byte_controller/bit_controller/sub_103/n44 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U88  ( .A1(
        \byte_controller/bit_controller/cnt [10]), .A2(
        \byte_controller/bit_controller/sub_103/n8 ), .ZN(
        \byte_controller/bit_controller/sub_103/n106 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_103/U87  ( .A1(
        \byte_controller/bit_controller/sub_103/n9 ), .A2(
        \byte_controller/bit_controller/sub_103/n7 ), .A3(
        \byte_controller/bit_controller/sub_103/n5 ), .ZN(
        \byte_controller/bit_controller/sub_103/n49 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U86  ( .A1(
        \byte_controller/bit_controller/n44 ), .A2(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/sub_103/n74 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U85  ( .A1(
        \byte_controller/bit_controller/n44 ), .A2(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/sub_103/n60 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U84  ( .A1(
        \byte_controller/bit_controller/n44 ), .A2(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/sub_103/n35 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_103/U83  ( .A1(
        \byte_controller/bit_controller/n40 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .A3(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/sub_103/n101 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U82  ( .A1(
        \byte_controller/bit_controller/n40 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n31 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U81  ( .A1(
        \byte_controller/bit_controller/n40 ), .A2(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n48 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U80  ( .A1(
        \byte_controller/bit_controller/n44 ), .A2(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/sub_103/n21 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U79  ( .A1(
        \byte_controller/bit_controller/n44 ), .A2(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/sub_103/n13 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U78  ( .A(
        \byte_controller/bit_controller/n40 ), .ZN(
        \byte_controller/bit_controller/sub_103/n95 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U77  ( .A1(
        \byte_controller/bit_controller/sub_103/n1 ), .A2(
        \byte_controller/bit_controller/sub_103/n47 ), .ZN(
        \byte_controller/bit_controller/sub_103/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U76  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n18 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U75  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U74  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U73  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n50 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U72  ( .A(
        \byte_controller/bit_controller/sub_103/n51 ), .B(
        \byte_controller/bit_controller/sub_103/n7 ), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U71  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n59 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U70  ( .A1(
        \byte_controller/bit_controller/cnt [2]), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n80 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U69  ( .A1(
        \byte_controller/bit_controller/sub_103/n7 ), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_103/n83 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_103/U68  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [3]), .A3(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n89 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U67  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n94 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U66  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n105 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U65  ( .A(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n45 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_103/U64  ( .B1(
        \byte_controller/bit_controller/sub_103/n49 ), .B2(
        \byte_controller/bit_controller/sub_103/n39 ), .A(
        \byte_controller/bit_controller/sub_103/n47 ), .ZN(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U63  ( .A1(
        \byte_controller/bit_controller/sub_103/n41 ), .A2(
        \byte_controller/bit_controller/sub_103/n46 ), .ZN(
        \byte_controller/bit_controller/N36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U62  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n75 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U61  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n20 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U60  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n61 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U59  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U58  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/sub_103/n32 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U57  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n84 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_103/U56  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [8]), .A3(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_103/n14 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U55  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_103/n27 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U54  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/sub_103/n122 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U53  ( .A(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n53 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_103/U52  ( .A(
        \byte_controller/bit_controller/sub_103/n67 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N46 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U51  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n76 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U50  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n115 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U49  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n62 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_103/U48  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n90 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_103/U47  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [9]), .A3(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n102 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U46  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n85 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U45  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n121 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U44  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n96 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U43  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_103/n107 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U42  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_103/n19 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U41  ( .A1(
        \byte_controller/bit_controller/sub_103/n53 ), .A2(
        \byte_controller/bit_controller/N32 ), .ZN(
        \byte_controller/bit_controller/sub_103/n51 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U40  ( .A1(
        \byte_controller/bit_controller/sub_103/n33 ), .A2(
        \byte_controller/bit_controller/sub_103/n50 ), .ZN(
        \byte_controller/bit_controller/sub_103/n47 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_103/U39  ( .A1(
        \byte_controller/bit_controller/sub_103/n33 ), .A2(
        \byte_controller/bit_controller/sub_103/n34 ), .A3(
        \byte_controller/bit_controller/sub_103/n35 ), .A4(
        \byte_controller/bit_controller/sub_103/n36 ), .ZN(
        \byte_controller/bit_controller/sub_103/n23 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U38  ( .A1(
        \byte_controller/bit_controller/sub_103/n51 ), .A2(
        \byte_controller/bit_controller/sub_103/n52 ), .ZN(
        \byte_controller/bit_controller/N33 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U37  ( .A1(
        \byte_controller/bit_controller/sub_103/n70 ), .A2(
        \byte_controller/bit_controller/sub_103/n71 ), .ZN(
        \byte_controller/bit_controller/sub_103/n67 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U36  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_103/n66 ) );
  BUF_X2 \byte_controller/bit_controller/sub_103/U35  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_103/n9 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U34  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n93 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U33  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_103/n64 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U32  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_103/n97 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U31  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_103/n65 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U30  ( .A1(
        \byte_controller/bit_controller/sub_103/n63 ), .A2(
        \byte_controller/bit_controller/sub_103/n78 ), .ZN(
        \byte_controller/bit_controller/sub_103/n55 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U29  ( .A1(
        \byte_controller/bit_controller/sub_103/n24 ), .A2(
        \byte_controller/bit_controller/sub_103/n25 ), .ZN(
        \byte_controller/bit_controller/sub_103/n22 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U28  ( .A1(
        \byte_controller/bit_controller/sub_103/n16 ), .A2(
        \byte_controller/bit_controller/sub_103/n17 ), .ZN(
        \byte_controller/bit_controller/sub_103/n11 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U27  ( .A(
        \byte_controller/bit_controller/n44 ), .ZN(
        \byte_controller/bit_controller/sub_103/n114 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_103/U26  ( .A1(
        \byte_controller/bit_controller/sub_103/n114 ), .A2(
        \byte_controller/bit_controller/sub_103/n20 ), .ZN(
        \byte_controller/bit_controller/sub_103/n113 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U25  ( .A1(
        \byte_controller/bit_controller/sub_103/n57 ), .A2(
        \byte_controller/bit_controller/sub_103/n58 ), .ZN(
        \byte_controller/bit_controller/sub_103/n56 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U24  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_103/n79 ) );
  OR2_X1 \byte_controller/bit_controller/sub_103/U23  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/sub_103/n1 ), .ZN(
        \byte_controller/bit_controller/sub_103/n42 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U22  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_103/n69 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U21  ( .A(
        \byte_controller/bit_controller/cnt [3]), .ZN(
        \byte_controller/bit_controller/sub_103/n39 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U20  ( .A1(
        \byte_controller/bit_controller/sub_103/n118 ), .A2(
        \byte_controller/bit_controller/sub_103/n119 ), .ZN(
        \byte_controller/bit_controller/sub_103/n108 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U19  ( .A1(
        \byte_controller/bit_controller/sub_103/n42 ), .A2(
        \byte_controller/bit_controller/sub_103/n43 ), .ZN(
        \byte_controller/bit_controller/sub_103/n40 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_103/U18  ( .B1(
        \byte_controller/bit_controller/sub_103/n29 ), .B2(
        \byte_controller/bit_controller/sub_103/n30 ), .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_103/n28 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U17  ( .A1(
        \byte_controller/bit_controller/sub_103/n116 ), .A2(
        \byte_controller/bit_controller/sub_103/n117 ), .ZN(
        \byte_controller/bit_controller/sub_103/n110 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U16  ( .A1(
        \byte_controller/bit_controller/sub_103/n112 ), .A2(
        \byte_controller/bit_controller/sub_103/n113 ), .ZN(
        \byte_controller/bit_controller/sub_103/n111 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U15  ( .A1(
        \byte_controller/bit_controller/sub_103/n72 ), .A2(
        \byte_controller/bit_controller/sub_103/n73 ), .ZN(
        \byte_controller/bit_controller/sub_103/n71 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U14  ( .A1(
        \byte_controller/bit_controller/sub_103/n77 ), .A2(
        \byte_controller/bit_controller/sub_103/n78 ), .ZN(
        \byte_controller/bit_controller/sub_103/n70 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U13  ( .A(
        \byte_controller/bit_controller/sub_103/n10 ), .ZN(
        \byte_controller/bit_controller/sub_103/n123 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U12  ( .A(
        \byte_controller/bit_controller/sub_103/n9 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  BUF_X1 \byte_controller/bit_controller/sub_103/U11  ( .A(
        \byte_controller/bit_controller/cnt [2]), .Z(
        \byte_controller/bit_controller/sub_103/n7 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_103/U10  ( .A(
        \byte_controller/bit_controller/cnt [1]), .Z(
        \byte_controller/bit_controller/sub_103/n5 ) );
  INV_X1 \byte_controller/bit_controller/sub_103/U9  ( .A(
        \byte_controller/bit_controller/sub_103/n5 ), .ZN(
        \byte_controller/bit_controller/sub_103/n4 ) );
  BUF_X1 \byte_controller/bit_controller/sub_103/U8  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_103/n10 ) );
  BUF_X1 \byte_controller/bit_controller/sub_103/U7  ( .A(
        \byte_controller/bit_controller/cnt [0]), .Z(
        \byte_controller/bit_controller/sub_103/n8 ) );
  OR2_X1 \byte_controller/bit_controller/sub_103/U6  ( .A1(
        \byte_controller/bit_controller/sub_103/n10 ), .A2(
        \byte_controller/bit_controller/cnt [1]), .ZN(
        \byte_controller/bit_controller/sub_103/n117 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U5  ( .A1(
        \byte_controller/bit_controller/cnt [3]), .A2(
        \byte_controller/bit_controller/cnt [2]), .ZN(
        \byte_controller/bit_controller/sub_103/n3 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_103/U4  ( .A1(
        \byte_controller/bit_controller/cnt [1]), .A2(
        \byte_controller/bit_controller/sub_103/n9 ), .ZN(
        \byte_controller/bit_controller/sub_103/n2 ) );
  AND2_X1 \byte_controller/bit_controller/sub_103/U3  ( .A1(
        \byte_controller/bit_controller/sub_103/n2 ), .A2(
        \byte_controller/bit_controller/sub_103/n3 ), .ZN(
        \byte_controller/bit_controller/sub_103/n15 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_103/U2  ( .A(
        \byte_controller/bit_controller/n40 ), .Z(
        \byte_controller/bit_controller/sub_103/n1 ) );
endmodule

