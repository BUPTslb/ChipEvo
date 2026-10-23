/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 06:00:25 2026
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
  wire   N21, sr_1, sr_0, N25, N26, N27, N28, N29, N30, N31, N32, done, i2c_al,
         irxack, N79, N80, N81, N82, N86, n1, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n33, n34, n40, n41, n43, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260,
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
         \byte_controller/n28 , \byte_controller/n27 , \byte_controller/n25 ,
         \byte_controller/n24 , \byte_controller/n23 , \byte_controller/n22 ,
         \byte_controller/n21 , \byte_controller/n19 , \byte_controller/n18 ,
         \byte_controller/n16 , \byte_controller/n13 , \byte_controller/n12 ,
         \byte_controller/n11 , \byte_controller/n10 , \byte_controller/n9 ,
         \byte_controller/n8 , \byte_controller/n7 , \byte_controller/n6 ,
         \byte_controller/n4 , \byte_controller/n3 , \byte_controller/n2 ,
         \byte_controller/n1 , \byte_controller/n111 , \byte_controller/n110 ,
         \byte_controller/n109 , \byte_controller/n108 ,
         \byte_controller/n107 , \byte_controller/n106 ,
         \byte_controller/n105 , \byte_controller/n104 ,
         \byte_controller/n103 , \byte_controller/n102 ,
         \byte_controller/n101 , \byte_controller/n100 , \byte_controller/n99 ,
         \byte_controller/n98 , \byte_controller/n97 , \byte_controller/n96 ,
         \byte_controller/n26 , \byte_controller/n20 , \byte_controller/n17 ,
         \byte_controller/n15 , \byte_controller/n14 , \byte_controller/n5 ,
         \byte_controller/N181 , \byte_controller/N180 ,
         \byte_controller/N179 , \byte_controller/N178 ,
         \byte_controller/N177 , \byte_controller/N176 ,
         \byte_controller/N175 , \byte_controller/N174 ,
         \byte_controller/N173 , \byte_controller/dcnt[1] ,
         \byte_controller/ld , \byte_controller/core_rxd ,
         \byte_controller/core_txd , \byte_controller/core_ack ,
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
         \byte_controller/bit_controller/n136 ,
         \byte_controller/bit_controller/n135 ,
         \byte_controller/bit_controller/n134 ,
         \byte_controller/bit_controller/n127 ,
         \byte_controller/bit_controller/n116 ,
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
         \byte_controller/bit_controller/n93 ,
         \byte_controller/bit_controller/n92 ,
         \byte_controller/bit_controller/n91 ,
         \byte_controller/bit_controller/n90 ,
         \byte_controller/bit_controller/n87 ,
         \byte_controller/bit_controller/n86 ,
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
         \byte_controller/bit_controller/n133 ,
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
         \byte_controller/bit_controller/n89 ,
         \byte_controller/bit_controller/n88 ,
         \byte_controller/bit_controller/n85 ,
         \byte_controller/bit_controller/n84 ,
         \byte_controller/bit_controller/n83 ,
         \byte_controller/bit_controller/n82 ,
         \byte_controller/bit_controller/n81 ,
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
         \byte_controller/bit_controller/dscl_oen ,
         \byte_controller/bit_controller/sub_105/n146 ,
         \byte_controller/bit_controller/sub_105/n145 ,
         \byte_controller/bit_controller/sub_105/n144 ,
         \byte_controller/bit_controller/sub_105/n143 ,
         \byte_controller/bit_controller/sub_105/n142 ,
         \byte_controller/bit_controller/sub_105/n141 ,
         \byte_controller/bit_controller/sub_105/n140 ,
         \byte_controller/bit_controller/sub_105/n139 ,
         \byte_controller/bit_controller/sub_105/n138 ,
         \byte_controller/bit_controller/sub_105/n137 ,
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
         \byte_controller/bit_controller/sub_105/n2 ,
         \byte_controller/bit_controller/sub_105/n1 ,
         \byte_controller/bit_controller/sub_105/n147 ;
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
  DFFR_X1 \ctr_reg[7]  ( .D(n152), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[7]), 
        .QN(n3) );
  DFFR_X1 \ctr_reg[2]  ( .D(n147), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[2]), 
        .QN(n8) );
  DFFR_X1 \ctr_reg[0]  ( .D(n145), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[0]), 
        .QN(n10) );
  DFFS_X1 \prer_reg[15]  ( .D(n144), .CK(wb_clk_i), .SN(arst_i), .Q(prer[15]), 
        .QN(n11) );
  DFFS_X1 \prer_reg[14]  ( .D(n143), .CK(wb_clk_i), .SN(arst_i), .Q(prer[14]), 
        .QN(n12) );
  DFFS_X1 \prer_reg[12]  ( .D(n258), .CK(wb_clk_i), .SN(arst_i), .Q(prer[12]), 
        .QN(n189) );
  DFFS_X1 \prer_reg[11]  ( .D(n259), .CK(wb_clk_i), .SN(arst_i), .Q(prer[11]), 
        .QN(n187) );
  DFFS_X1 \prer_reg[10]  ( .D(n260), .CK(wb_clk_i), .SN(arst_i), .Q(prer[10]), 
        .QN(n185) );
  DFFS_X1 \prer_reg[9]  ( .D(n141), .CK(wb_clk_i), .SN(arst_i), .Q(prer[9]), 
        .QN(n17) );
  DFFS_X1 \prer_reg[7]  ( .D(n139), .CK(wb_clk_i), .SN(arst_i), .Q(prer[7]), 
        .QN(n19) );
  DFFS_X1 \prer_reg[6]  ( .D(n138), .CK(wb_clk_i), .SN(arst_i), .Q(prer[6]), 
        .QN(n20) );
  DFFR_X1 \txr_reg[4]  ( .D(n128), .CK(wb_clk_i), .RN(arst_i), .Q(txr[4]), 
        .QN(n30) );
  DFFR_X1 \txr_reg[3]  ( .D(n127), .CK(wb_clk_i), .RN(arst_i), .Q(txr[3]), 
        .QN(n31) );
  DFFR_X1 \txr_reg[1]  ( .D(n125), .CK(wb_clk_i), .RN(arst_i), .Q(txr[1]), 
        .QN(n33) );
  DFF_X1 \wb_dat_o_reg[6]  ( .D(N31), .CK(wb_clk_i), .Q(wb_dat_o[6]) );
  DFFR_X1 \cr_reg[5]  ( .D(n121), .CK(wb_clk_i), .RN(arst_i), .Q(cr[5]), .QN(
        n238) );
  DFF_X1 \wb_dat_o_reg[4]  ( .D(N29), .CK(wb_clk_i), .Q(wb_dat_o[4]) );
  DFF_X1 \wb_dat_o_reg[3]  ( .D(N28), .CK(wb_clk_i), .Q(wb_dat_o[3]) );
  DFF_X1 \wb_dat_o_reg[2]  ( .D(N27), .CK(wb_clk_i), .Q(wb_dat_o[2]) );
  DFF_X1 \wb_dat_o_reg[5]  ( .D(N30), .CK(wb_clk_i), .Q(wb_dat_o[5]) );
  DFFR_X1 rxack_reg ( .D(N80), .CK(wb_clk_i), .RN(arst_i), .Q(sr[7]) );
  DFF_X1 \wb_dat_o_reg[7]  ( .D(N32), .CK(wb_clk_i), .Q(wb_dat_o[7]) );
  DFFR_X1 tip_reg ( .D(N81), .CK(wb_clk_i), .RN(arst_i), .Q(sr_1) );
  DFF_X1 \wb_dat_o_reg[1]  ( .D(N26), .CK(wb_clk_i), .Q(wb_dat_o[1]) );
  DFF_X1 \wb_dat_o_reg[0]  ( .D(N25), .CK(wb_clk_i), .Q(wb_dat_o[0]) );
  DFFR_X1 wb_inta_o_reg ( .D(N86), .CK(wb_clk_i), .RN(arst_i), .Q(wb_inta_o)
         );
  DFFR_X1 al_reg ( .D(N79), .CK(wb_clk_i), .RN(arst_i), .Q(sr[5]), .QN(n242)
         );
  DFFR_X1 \txr_reg[2]  ( .D(n126), .CK(wb_clk_i), .RN(arst_i), .Q(txr[2]), 
        .QN(n222) );
  DFFR_X1 \ctr_reg[5]  ( .D(n150), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[5]), 
        .QN(n5) );
  DFFR_X1 irq_flag_reg ( .D(N82), .CK(wb_clk_i), .RN(arst_i), .Q(sr_0), .QN(
        n43) );
  DFFR_X1 \txr_reg[5]  ( .D(n129), .CK(wb_clk_i), .RN(arst_i), .Q(txr[5]), 
        .QN(n29) );
  DFFR_X1 \ctr_reg[6]  ( .D(n151), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[6]), 
        .QN(n4) );
  DFFR_X1 \ctr_reg[1]  ( .D(n146), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[1]), 
        .QN(n9) );
  DFFS_X1 \prer_reg[2]  ( .D(n134), .CK(wb_clk_i), .SN(arst_i), .Q(prer[2]), 
        .QN(n24) );
  DFFS_X1 \prer_reg[1]  ( .D(n133), .CK(wb_clk_i), .SN(arst_i), .Q(prer[1]), 
        .QN(n25) );
  DFFS_X1 \prer_reg[8]  ( .D(n140), .CK(wb_clk_i), .SN(arst_i), .Q(prer[8]), 
        .QN(n18) );
  DFFS_X1 \prer_reg[0]  ( .D(n132), .CK(wb_clk_i), .SN(arst_i), .Q(prer[0]), 
        .QN(n26) );
  DFFS_X1 \prer_reg[13]  ( .D(n142), .CK(wb_clk_i), .SN(arst_i), .Q(prer[13]), 
        .QN(n13) );
  DFFS_X1 \prer_reg[4]  ( .D(n136), .CK(wb_clk_i), .SN(arst_i), .Q(prer[4]), 
        .QN(n22) );
  DFFS_X1 \prer_reg[3]  ( .D(n135), .CK(wb_clk_i), .SN(arst_i), .Q(prer[3]), 
        .QN(n23) );
  DFFS_X1 \prer_reg[5]  ( .D(n137), .CK(wb_clk_i), .SN(arst_i), .Q(prer[5]), 
        .QN(n21) );
  DFFR_X1 \ctr_reg[4]  ( .D(n149), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[4]), 
        .QN(n6) );
  DFFR_X1 \ctr_reg[3]  ( .D(n148), .CK(wb_clk_i), .RN(arst_i), .Q(ctr[3]), 
        .QN(n7) );
  DFFR_X1 \txr_reg[7]  ( .D(n131), .CK(wb_clk_i), .RN(arst_i), .Q(txr[7]), 
        .QN(n27) );
  DFFR_X1 \txr_reg[6]  ( .D(n130), .CK(wb_clk_i), .RN(arst_i), .Q(txr[6]), 
        .QN(n28) );
  DFFR_X1 \txr_reg[0]  ( .D(n124), .CK(wb_clk_i), .RN(arst_i), .Q(txr[0]), 
        .QN(n34) );
  DFFR_X1 \cr_reg[3]  ( .D(n123), .CK(wb_clk_i), .RN(arst_i), .Q(cr[3]), .QN(
        n227) );
  DFFR_X1 \cr_reg[1]  ( .D(n117), .CK(wb_clk_i), .RN(arst_i), .Q(cr[1]), .QN(
        n41) );
  DFFR_X1 \cr_reg[0]  ( .D(n116), .CK(wb_clk_i), .RN(arst_i), .Q(cr[0]), .QN(
        n205) );
  DFFR_X1 \cr_reg[2]  ( .D(n118), .CK(wb_clk_i), .RN(arst_i), .Q(cr[2]), .QN(
        n40) );
  DFFR_X1 \cr_reg[7]  ( .D(n119), .CK(wb_clk_i), .RN(arst_i), .Q(cr[7]), .QN(
        n249) );
  DFFR_X1 \cr_reg[6]  ( .D(n120), .CK(wb_clk_i), .RN(arst_i), .Q(cr[6]), .QN(
        n244) );
  DFFR_X1 \cr_reg[4]  ( .D(n122), .CK(wb_clk_i), .RN(arst_i), .Q(cr[4]), .QN(
        n232) );
  AND2_X1 U130 ( .A1(n158), .A2(n201), .ZN(n153) );
  AND2_X1 U131 ( .A1(n196), .A2(n229), .ZN(n154) );
  AND3_X1 U132 ( .A1(n196), .A2(n182), .A3(n181), .ZN(n155) );
  AND2_X1 U133 ( .A1(n198), .A2(n251), .ZN(n156) );
  AND2_X1 U134 ( .A1(n196), .A2(n248), .ZN(n157) );
  AND2_X1 U135 ( .A1(n199), .A2(n207), .ZN(n158) );
  INV_X1 U136 ( .A(n3), .ZN(n159) );
  AND2_X1 U137 ( .A1(n168), .A2(n248), .ZN(n160) );
  OAI21_X1 U138 ( .B1(n196), .B2(n162), .A(n160), .ZN(n161) );
  OAI21_X1 U139 ( .B1(n196), .B2(n162), .A(n160), .ZN(n170) );
  NOR2_X1 U140 ( .A1(i2c_al), .A2(done), .ZN(n162) );
  INV_X1 U141 ( .A(wb_rst_i), .ZN(n248) );
  INV_X1 U143 ( .A(wb_dat_i[0]), .ZN(n197) );
  INV_X1 U144 ( .A(wb_adr_i[2]), .ZN(n172) );
  NAND2_X1 U145 ( .A1(wb_adr_i[0]), .A2(n172), .ZN(n200) );
  INV_X1 U146 ( .A(n200), .ZN(n182) );
  NAND3_X1 U147 ( .A1(wb_stb_i), .A2(wb_we_i), .A3(wb_cyc_i), .ZN(n167) );
  INV_X1 U148 ( .A(n167), .ZN(n196) );
  NAND3_X1 U149 ( .A1(wb_adr_i[1]), .A2(n182), .A3(n196), .ZN(n164) );
  NAND2_X1 U150 ( .A1(n164), .A2(n248), .ZN(n165) );
  NAND2_X1 U151 ( .A1(n165), .A2(n248), .ZN(n166) );
  OAI22_X1 U152 ( .A1(n197), .A2(n166), .B1(n34), .B2(n165), .ZN(n124) );
  INV_X1 U153 ( .A(wb_dat_i[1]), .ZN(n211) );
  OAI22_X1 U154 ( .A1(n211), .A2(n166), .B1(n33), .B2(n165), .ZN(n125) );
  INV_X1 U155 ( .A(wb_dat_i[2]), .ZN(n218) );
  OAI22_X1 U156 ( .A1(n218), .A2(n166), .B1(n222), .B2(n165), .ZN(n126) );
  INV_X1 U157 ( .A(wb_dat_i[3]), .ZN(n224) );
  OAI22_X1 U158 ( .A1(n224), .A2(n166), .B1(n31), .B2(n165), .ZN(n127) );
  INV_X1 U159 ( .A(wb_dat_i[4]), .ZN(n228) );
  OAI22_X1 U160 ( .A1(n228), .A2(n166), .B1(n30), .B2(n165), .ZN(n128) );
  INV_X1 U161 ( .A(wb_dat_i[5]), .ZN(n234) );
  OAI22_X1 U162 ( .A1(n234), .A2(n166), .B1(n29), .B2(n165), .ZN(n129) );
  INV_X1 U163 ( .A(wb_dat_i[6]), .ZN(n195) );
  OAI22_X1 U164 ( .A1(n195), .A2(n166), .B1(n28), .B2(n165), .ZN(n130) );
  INV_X1 U165 ( .A(wb_dat_i[7]), .ZN(n193) );
  OAI22_X1 U166 ( .A1(n193), .A2(n166), .B1(n27), .B2(n165), .ZN(n131) );
  INV_X1 U167 ( .A(wb_adr_i[0]), .ZN(n203) );
  NAND3_X1 U168 ( .A1(wb_adr_i[1]), .A2(n203), .A3(n172), .ZN(n207) );
  OAI21_X1 U169 ( .B1(n207), .B2(n167), .A(n248), .ZN(n233) );
  NAND2_X1 U170 ( .A1(n233), .A2(n248), .ZN(n235) );
  OAI22_X1 U171 ( .A1(n235), .A2(n193), .B1(n3), .B2(n233), .ZN(n152) );
  INV_X1 U172 ( .A(wb_adr_i[1]), .ZN(n181) );
  NAND2_X1 U173 ( .A1(wb_adr_i[2]), .A2(n181), .ZN(n202) );
  INV_X1 U174 ( .A(n202), .ZN(n208) );
  NAND2_X1 U175 ( .A1(n208), .A2(n203), .ZN(n243) );
  INV_X1 U176 ( .A(n243), .ZN(n255) );
  NAND3_X1 U177 ( .A1(n255), .A2(ctr[7]), .A3(n196), .ZN(n168) );
  NAND2_X1 U178 ( .A1(n168), .A2(n248), .ZN(n169) );
  NAND2_X1 U179 ( .A1(n157), .A2(n169), .ZN(n216) );
  OAI22_X1 U180 ( .A1(n224), .A2(n216), .B1(n227), .B2(n169), .ZN(n123) );
  NAND2_X1 U181 ( .A1(n157), .A2(n170), .ZN(n171) );
  OAI22_X1 U182 ( .A1(n228), .A2(n171), .B1(n232), .B2(n161), .ZN(n122) );
  OAI22_X1 U183 ( .A1(n234), .A2(n171), .B1(n238), .B2(n161), .ZN(n121) );
  OAI22_X1 U184 ( .A1(n195), .A2(n171), .B1(n244), .B2(n161), .ZN(n120) );
  OAI22_X1 U185 ( .A1(n171), .A2(n193), .B1(n249), .B2(n161), .ZN(n119) );
  NAND3_X1 U186 ( .A1(n172), .A2(n203), .A3(n181), .ZN(n251) );
  INV_X1 U187 ( .A(n251), .ZN(n229) );
  MUX2_X1 U188 ( .A(n26), .B(n197), .S(n154), .Z(n173) );
  NAND2_X1 U189 ( .A1(n248), .A2(n173), .ZN(n132) );
  MUX2_X1 U190 ( .A(n25), .B(n211), .S(n154), .Z(n174) );
  NAND2_X1 U191 ( .A1(n248), .A2(n174), .ZN(n133) );
  MUX2_X1 U192 ( .A(n24), .B(n218), .S(n154), .Z(n175) );
  NAND2_X1 U193 ( .A1(n248), .A2(n175), .ZN(n134) );
  MUX2_X1 U194 ( .A(n23), .B(n224), .S(n154), .Z(n176) );
  NAND2_X1 U195 ( .A1(n248), .A2(n176), .ZN(n135) );
  MUX2_X1 U196 ( .A(n22), .B(n228), .S(n154), .Z(n177) );
  NAND2_X1 U197 ( .A1(n248), .A2(n177), .ZN(n136) );
  MUX2_X1 U198 ( .A(n21), .B(n234), .S(n154), .Z(n178) );
  NAND2_X1 U199 ( .A1(n248), .A2(n178), .ZN(n137) );
  MUX2_X1 U200 ( .A(n20), .B(n195), .S(n154), .Z(n179) );
  NAND2_X1 U201 ( .A1(n248), .A2(n179), .ZN(n138) );
  MUX2_X1 U202 ( .A(n19), .B(n193), .S(n154), .Z(n180) );
  NAND2_X1 U203 ( .A1(n248), .A2(n180), .ZN(n139) );
  MUX2_X1 U204 ( .A(n18), .B(n197), .S(n155), .Z(n183) );
  NAND2_X1 U205 ( .A1(n248), .A2(n183), .ZN(n140) );
  MUX2_X1 U206 ( .A(n17), .B(n211), .S(n155), .Z(n184) );
  NAND2_X1 U207 ( .A1(n248), .A2(n184), .ZN(n141) );
  MUX2_X1 U208 ( .A(n185), .B(n218), .S(n155), .Z(n186) );
  NAND2_X1 U209 ( .A1(n248), .A2(n186), .ZN(n260) );
  MUX2_X1 U210 ( .A(n187), .B(n224), .S(n155), .Z(n188) );
  NAND2_X1 U211 ( .A1(n248), .A2(n188), .ZN(n259) );
  MUX2_X1 U212 ( .A(n189), .B(n228), .S(n155), .Z(n190) );
  NAND2_X1 U213 ( .A1(n248), .A2(n190), .ZN(n258) );
  MUX2_X1 U214 ( .A(n13), .B(n234), .S(n155), .Z(n191) );
  NAND2_X1 U215 ( .A1(n248), .A2(n191), .ZN(n142) );
  MUX2_X1 U216 ( .A(n12), .B(n195), .S(n155), .Z(n192) );
  NAND2_X1 U217 ( .A1(n248), .A2(n192), .ZN(n143) );
  MUX2_X1 U218 ( .A(n11), .B(n193), .S(n155), .Z(n194) );
  NAND2_X1 U219 ( .A1(n248), .A2(n194), .ZN(n144) );
  OAI22_X1 U220 ( .A1(n235), .A2(n195), .B1(n4), .B2(n233), .ZN(n151) );
  NAND2_X1 U221 ( .A1(n160), .A2(n196), .ZN(n217) );
  OAI22_X1 U222 ( .A1(n205), .A2(n217), .B1(n216), .B2(n197), .ZN(n116) );
  AOI211_X1 U223 ( .C1(n43), .C2(n162), .A(cr[0]), .B(wb_rst_i), .ZN(N82) );
  NOR3_X1 U224 ( .A1(n43), .A2(n4), .A3(wb_rst_i), .ZN(N86) );
  AND3_X1 U225 ( .A1(wb_cyc_i), .A2(wb_stb_i), .A3(n1), .ZN(N21) );
  OAI22_X1 U226 ( .A1(n235), .A2(n197), .B1(n10), .B2(n233), .ZN(n145) );
  OAI21_X1 U227 ( .B1(wb_adr_i[1]), .B2(n200), .A(n251), .ZN(n198) );
  INV_X1 U228 ( .A(n198), .ZN(n199) );
  NAND2_X1 U229 ( .A1(n158), .A2(n200), .ZN(n201) );
  INV_X1 U230 ( .A(n201), .ZN(n204) );
  NAND3_X1 U231 ( .A1(n204), .A2(n203), .A3(n202), .ZN(n250) );
  OAI22_X1 U232 ( .A1(n26), .A2(n251), .B1(n250), .B2(n205), .ZN(n206) );
  AOI221_X1 U233 ( .B1(n156), .B2(prer[8]), .C1(rxr[0]), .C2(n153), .A(n206), 
        .ZN(n210) );
  INV_X1 U234 ( .A(n207), .ZN(n254) );
  NAND2_X1 U235 ( .A1(n208), .A2(n243), .ZN(n223) );
  INV_X1 U236 ( .A(n223), .ZN(n253) );
  AOI222_X1 U237 ( .A1(sr_0), .A2(n255), .B1(ctr[0]), .B2(n254), .C1(n253), 
        .C2(txr[0]), .ZN(n209) );
  NAND2_X1 U238 ( .A1(n210), .A2(n209), .ZN(N25) );
  OAI22_X1 U239 ( .A1(n41), .A2(n217), .B1(n216), .B2(n211), .ZN(n117) );
  OAI22_X1 U240 ( .A1(n235), .A2(n211), .B1(n9), .B2(n233), .ZN(n146) );
  AOI21_X1 U241 ( .B1(n238), .B2(n232), .A(wb_rst_i), .ZN(N81) );
  INV_X1 U242 ( .A(n17), .ZN(n212) );
  AOI22_X1 U243 ( .A1(n156), .A2(n212), .B1(rxr[1]), .B2(n153), .ZN(n215) );
  INV_X1 U244 ( .A(n250), .ZN(n219) );
  AOI22_X1 U245 ( .A1(cr[1]), .A2(n219), .B1(n229), .B2(prer[1]), .ZN(n214) );
  AOI222_X1 U246 ( .A1(sr_1), .A2(n255), .B1(ctr[1]), .B2(n254), .C1(n253), 
        .C2(txr[1]), .ZN(n213) );
  NAND3_X1 U247 ( .A1(n215), .A2(n214), .A3(n213), .ZN(N26) );
  OAI22_X1 U248 ( .A1(n40), .A2(n217), .B1(n218), .B2(n216), .ZN(n118) );
  OAI22_X1 U249 ( .A1(n235), .A2(n218), .B1(n8), .B2(n233), .ZN(n147) );
  AOI22_X1 U250 ( .A1(n229), .A2(prer[2]), .B1(ctr[2]), .B2(n254), .ZN(n221)
         );
  AOI222_X1 U251 ( .A1(cr[2]), .A2(n219), .B1(prer[10]), .B2(n156), .C1(rxr[2]), .C2(n153), .ZN(n220) );
  OAI211_X1 U252 ( .C1(n223), .C2(n222), .A(n221), .B(n220), .ZN(N27) );
  OAI22_X1 U253 ( .A1(n235), .A2(n224), .B1(n7), .B2(n233), .ZN(n148) );
  AOI22_X1 U254 ( .A1(prer[11]), .A2(n156), .B1(rxr[3]), .B2(n153), .ZN(n226)
         );
  AOI222_X1 U255 ( .A1(txr[3]), .A2(n253), .B1(n229), .B2(prer[3]), .C1(ctr[3]), .C2(n254), .ZN(n225) );
  OAI211_X1 U256 ( .C1(n250), .C2(n227), .A(n226), .B(n225), .ZN(N28) );
  OAI22_X1 U257 ( .A1(n235), .A2(n228), .B1(n6), .B2(n233), .ZN(n149) );
  AOI22_X1 U258 ( .A1(prer[12]), .A2(n156), .B1(rxr[4]), .B2(n153), .ZN(n231)
         );
  AOI222_X1 U259 ( .A1(txr[4]), .A2(n253), .B1(n229), .B2(prer[4]), .C1(ctr[4]), .C2(n254), .ZN(n230) );
  OAI211_X1 U260 ( .C1(n250), .C2(n232), .A(n231), .B(n230), .ZN(N29) );
  OAI22_X1 U261 ( .A1(n235), .A2(n234), .B1(n5), .B2(n233), .ZN(n150) );
  NAND2_X1 U262 ( .A1(n249), .A2(sr[5]), .ZN(n237) );
  INV_X1 U263 ( .A(i2c_al), .ZN(n236) );
  AOI21_X1 U264 ( .B1(n237), .B2(n236), .A(wb_rst_i), .ZN(N79) );
  AOI22_X1 U265 ( .A1(ctr[5]), .A2(n254), .B1(n253), .B2(txr[5]), .ZN(n241) );
  OAI22_X1 U266 ( .A1(n21), .A2(n251), .B1(n250), .B2(n238), .ZN(n239) );
  AOI221_X1 U267 ( .B1(n156), .B2(prer[13]), .C1(rxr[5]), .C2(n153), .A(n239), 
        .ZN(n240) );
  OAI211_X1 U268 ( .C1(n243), .C2(n242), .A(n241), .B(n240), .ZN(N30) );
  OAI22_X1 U269 ( .A1(n20), .A2(n251), .B1(n250), .B2(n244), .ZN(n245) );
  AOI221_X1 U270 ( .B1(n156), .B2(prer[14]), .C1(rxr[6]), .C2(n153), .A(n245), 
        .ZN(n247) );
  AOI222_X1 U271 ( .A1(sr[6]), .A2(n255), .B1(ctr[6]), .B2(n254), .C1(n253), 
        .C2(txr[6]), .ZN(n246) );
  NAND2_X1 U272 ( .A1(n247), .A2(n246), .ZN(N31) );
  AND2_X1 U273 ( .A1(irxack), .A2(n248), .ZN(N80) );
  OAI22_X1 U274 ( .A1(n19), .A2(n251), .B1(n250), .B2(n249), .ZN(n252) );
  AOI221_X1 U275 ( .B1(n156), .B2(prer[15]), .C1(rxr[7]), .C2(n153), .A(n252), 
        .ZN(n257) );
  AOI222_X1 U276 ( .A1(sr[7]), .A2(n255), .B1(n159), .B2(n254), .C1(n253), 
        .C2(txr[7]), .ZN(n256) );
  NAND2_X1 U277 ( .A1(n257), .A2(n256), .ZN(N32) );
  OAI21_X1 \byte_controller/U153  ( .B1(\byte_controller/n167 ), .B2(
        \byte_controller/n166 ), .A(\byte_controller/n165 ), .ZN(
        \byte_controller/n96 ) );
  NAND3_X1 \byte_controller/U152  ( .A1(irxack), .A2(\byte_controller/n24 ), 
        .A3(\byte_controller/n164 ), .ZN(\byte_controller/n165 ) );
  OAI21_X1 \byte_controller/U151  ( .B1(\byte_controller/n52 ), .B2(
        \byte_controller/n162 ), .A(\byte_controller/n161 ), .ZN(
        \byte_controller/n97 ) );
  NAND3_X1 \byte_controller/U150  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n160 ), .A3(\byte_controller/n38 ), .ZN(
        \byte_controller/n161 ) );
  OAI211_X1 \byte_controller/U149  ( .C1(\byte_controller/n40 ), .C2(
        \byte_controller/n30 ), .A(\byte_controller/n158 ), .B(
        \byte_controller/n157 ), .ZN(\byte_controller/n160 ) );
  NAND3_X1 \byte_controller/U148  ( .A1(\byte_controller/n29 ), .A2(
        \byte_controller/n156 ), .A3(\byte_controller/n1 ), .ZN(
        \byte_controller/n157 ) );
  MUX2_X1 \byte_controller/U147  ( .A(\byte_controller/n42 ), .B(
        \byte_controller/n39 ), .S(\byte_controller/n12 ), .Z(
        \byte_controller/n158 ) );
  OAI21_X1 \byte_controller/U146  ( .B1(\byte_controller/n52 ), .B2(
        \byte_controller/n154 ), .A(\byte_controller/n153 ), .ZN(
        \byte_controller/n98 ) );
  NAND4_X1 \byte_controller/U145  ( .A1(\byte_controller/n163 ), .A2(
        \byte_controller/n152 ), .A3(\byte_controller/n151 ), .A4(
        \byte_controller/n24 ), .ZN(\byte_controller/n153 ) );
  NAND3_X1 \byte_controller/U144  ( .A1(\byte_controller/n150 ), .A2(
        \byte_controller/n149 ), .A3(\byte_controller/n148 ), .ZN(
        \byte_controller/n151 ) );
  NAND3_X1 \byte_controller/U143  ( .A1(\byte_controller/n150 ), .A2(
        \byte_controller/n149 ), .A3(\byte_controller/n2 ), .ZN(
        \byte_controller/n152 ) );
  MUX2_X1 \byte_controller/U142  ( .A(\byte_controller/n39 ), .B(
        \byte_controller/n42 ), .S(\byte_controller/n12 ), .Z(
        \byte_controller/n149 ) );
  NAND2_X1 \byte_controller/U141  ( .A1(\byte_controller/n30 ), .A2(
        \byte_controller/n35 ), .ZN(\byte_controller/n150 ) );
  OAI21_X1 \byte_controller/U140  ( .B1(\byte_controller/n52 ), .B2(
        \byte_controller/n146 ), .A(\byte_controller/n145 ), .ZN(
        \byte_controller/n99 ) );
  NAND3_X1 \byte_controller/U139  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n144 ), .A3(\byte_controller/n38 ), .ZN(
        \byte_controller/n145 ) );
  OAI22_X1 \byte_controller/U138  ( .A1(\byte_controller/n37 ), .A2(
        \byte_controller/n13 ), .B1(\byte_controller/n25 ), .B2(
        \byte_controller/n148 ), .ZN(\byte_controller/n144 ) );
  OAI21_X1 \byte_controller/U137  ( .B1(\byte_controller/n38 ), .B2(
        \byte_controller/n141 ), .A(\byte_controller/n140 ), .ZN(
        \byte_controller/n100 ) );
  NAND3_X1 \byte_controller/U136  ( .A1(\byte_controller/n34 ), .A2(
        \byte_controller/n24 ), .A3(cr[7]), .ZN(\byte_controller/n140 ) );
  OAI211_X1 \byte_controller/U135  ( .C1(\byte_controller/n1 ), .C2(
        \byte_controller/n9 ), .A(\byte_controller/n24 ), .B(
        \byte_controller/n32 ), .ZN(\byte_controller/n163 ) );
  OAI211_X1 \byte_controller/U134  ( .C1(\byte_controller/n137 ), .C2(
        \byte_controller/n136 ), .A(\byte_controller/n135 ), .B(
        \byte_controller/n167 ), .ZN(\byte_controller/N173 ) );
  NAND3_X1 \byte_controller/U133  ( .A1(cr[3]), .A2(\byte_controller/n33 ), 
        .A3(\byte_controller/c_state [1]), .ZN(\byte_controller/n135 ) );
  AOI22_X1 \byte_controller/U132  ( .A1(rxr[7]), .A2(\byte_controller/n134 ), 
        .B1(cr[3]), .B2(\byte_controller/c_state [3]), .ZN(
        \byte_controller/n137 ) );
  OAI211_X1 \byte_controller/U131  ( .C1(\byte_controller/n11 ), .C2(
        \byte_controller/n41 ), .A(\byte_controller/n6 ), .B(
        \byte_controller/n133 ), .ZN(\byte_controller/n134 ) );
  OAI221_X1 \byte_controller/U130  ( .B1(\byte_controller/n5 ), .B2(
        \byte_controller/n22 ), .C1(\byte_controller/n131 ), .C2(
        \byte_controller/n130 ), .A(\byte_controller/n129 ), .ZN(
        \byte_controller/n104 ) );
  NAND2_X1 \byte_controller/U129  ( .A1(txr[7]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n129 ) );
  OAI221_X1 \byte_controller/U128  ( .B1(\byte_controller/n130 ), .B2(
        \byte_controller/n23 ), .C1(\byte_controller/n131 ), .C2(
        \byte_controller/n127 ), .A(\byte_controller/n126 ), .ZN(
        \byte_controller/n105 ) );
  NAND2_X1 \byte_controller/U127  ( .A1(txr[6]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n126 ) );
  OAI221_X1 \byte_controller/U126  ( .B1(\byte_controller/n127 ), .B2(
        \byte_controller/n22 ), .C1(\byte_controller/n131 ), .C2(
        \byte_controller/n125 ), .A(\byte_controller/n124 ), .ZN(
        \byte_controller/n106 ) );
  NAND2_X1 \byte_controller/U125  ( .A1(txr[5]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n124 ) );
  OAI221_X1 \byte_controller/U124  ( .B1(\byte_controller/n125 ), .B2(
        \byte_controller/n23 ), .C1(\byte_controller/n131 ), .C2(
        \byte_controller/n123 ), .A(\byte_controller/n122 ), .ZN(
        \byte_controller/n107 ) );
  NAND2_X1 \byte_controller/U123  ( .A1(txr[4]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n122 ) );
  OAI221_X1 \byte_controller/U122  ( .B1(\byte_controller/n123 ), .B2(
        \byte_controller/n22 ), .C1(\byte_controller/n131 ), .C2(
        \byte_controller/n121 ), .A(\byte_controller/n120 ), .ZN(
        \byte_controller/n108 ) );
  NAND2_X1 \byte_controller/U121  ( .A1(txr[3]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n120 ) );
  OAI221_X1 \byte_controller/U120  ( .B1(\byte_controller/n121 ), .B2(
        \byte_controller/n21 ), .C1(\byte_controller/n131 ), .C2(
        \byte_controller/n119 ), .A(\byte_controller/n118 ), .ZN(
        \byte_controller/n109 ) );
  NAND2_X1 \byte_controller/U119  ( .A1(txr[2]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n118 ) );
  OAI221_X1 \byte_controller/U118  ( .B1(\byte_controller/n119 ), .B2(
        \byte_controller/n21 ), .C1(\byte_controller/n131 ), .C2(
        \byte_controller/n117 ), .A(\byte_controller/n116 ), .ZN(
        \byte_controller/n111 ) );
  NAND2_X1 \byte_controller/U117  ( .A1(txr[1]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n116 ) );
  OAI221_X1 \byte_controller/U116  ( .B1(\byte_controller/n117 ), .B2(
        \byte_controller/n21 ), .C1(\byte_controller/n166 ), .C2(
        \byte_controller/n131 ), .A(\byte_controller/n115 ), .ZN(
        \byte_controller/n110 ) );
  NAND2_X1 \byte_controller/U115  ( .A1(txr[0]), .A2(\byte_controller/n128 ), 
        .ZN(\byte_controller/n115 ) );
  INV_X1 \byte_controller/U114  ( .A(\byte_controller/n114 ), .ZN(
        \byte_controller/n128 ) );
  INV_X1 \byte_controller/U113  ( .A(\byte_controller/core_rxd ), .ZN(
        \byte_controller/n166 ) );
  NAND3_X1 \byte_controller/U112  ( .A1(\byte_controller/n131 ), .A2(
        \byte_controller/n113 ), .A3(\byte_controller/n114 ), .ZN(
        \byte_controller/n132 ) );
  OAI21_X1 \byte_controller/U111  ( .B1(\byte_controller/n112 ), .B2(
        \byte_controller/n30 ), .A(\byte_controller/n95 ), .ZN(
        \byte_controller/N178 ) );
  NAND3_X1 \byte_controller/U110  ( .A1(\byte_controller/n94 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/c_state [1]), .ZN(
        \byte_controller/n95 ) );
  OAI211_X1 \byte_controller/U109  ( .C1(\byte_controller/n41 ), .C2(
        \byte_controller/n7 ), .A(\byte_controller/n91 ), .B(
        \byte_controller/n92 ), .ZN(\byte_controller/n94 ) );
  NAND3_X1 \byte_controller/U108  ( .A1(\byte_controller/n51 ), .A2(
        \byte_controller/n37 ), .A3(\byte_controller/n28 ), .ZN(
        \byte_controller/n92 ) );
  AOI22_X1 \byte_controller/U107  ( .A1(\byte_controller/n90 ), .A2(
        \byte_controller/n34 ), .B1(\byte_controller/n89 ), .B2(
        \byte_controller/n33 ), .ZN(\byte_controller/n112 ) );
  NOR2_X1 \byte_controller/U106  ( .A1(cr[7]), .A2(\byte_controller/n136 ), 
        .ZN(\byte_controller/n90 ) );
  OAI33_X1 \byte_controller/U105  ( .A1(\byte_controller/n8 ), .A2(
        \byte_controller/n88 ), .A3(\byte_controller/n28 ), .B1(
        \byte_controller/n87 ), .B2(\byte_controller/n37 ), .B3(
        \byte_controller/n136 ), .ZN(\byte_controller/N180 ) );
  INV_X1 \byte_controller/U104  ( .A(\byte_controller/n86 ), .ZN(
        \byte_controller/n87 ) );
  OAI221_X1 \byte_controller/U103  ( .B1(\byte_controller/n85 ), .B2(
        \byte_controller/n131 ), .C1(\byte_controller/n14 ), .C2(
        \byte_controller/n84 ), .A(\byte_controller/n114 ), .ZN(
        \byte_controller/n101 ) );
  AOI21_X1 \byte_controller/U102  ( .B1(\byte_controller/dcnt[1] ), .B2(
        \byte_controller/n27 ), .A(\byte_controller/n12 ), .ZN(
        \byte_controller/n85 ) );
  OAI211_X1 \byte_controller/U101  ( .C1(\byte_controller/n15 ), .C2(
        \byte_controller/n84 ), .A(\byte_controller/n83 ), .B(
        \byte_controller/n114 ), .ZN(\byte_controller/n103 ) );
  NAND3_X1 \byte_controller/U100  ( .A1(\byte_controller/n82 ), .A2(
        \byte_controller/n17 ), .A3(\byte_controller/n81 ), .ZN(
        \byte_controller/n83 ) );
  INV_X1 \byte_controller/U99  ( .A(\byte_controller/dcnt[1] ), .ZN(
        \byte_controller/n81 ) );
  OAI21_X1 \byte_controller/U98  ( .B1(\byte_controller/n80 ), .B2(
        \byte_controller/n131 ), .A(\byte_controller/n113 ), .ZN(
        \byte_controller/n84 ) );
  NAND2_X1 \byte_controller/U97  ( .A1(\byte_controller/n114 ), .A2(
        \byte_controller/n79 ), .ZN(\byte_controller/n102 ) );
  MUX2_X1 \byte_controller/U96  ( .A(\byte_controller/n78 ), .B(
        \byte_controller/n80 ), .S(\byte_controller/n82 ), .Z(
        \byte_controller/n79 ) );
  INV_X1 \byte_controller/U95  ( .A(\byte_controller/n131 ), .ZN(
        \byte_controller/n82 ) );
  NAND2_X1 \byte_controller/U94  ( .A1(\byte_controller/n113 ), .A2(
        \byte_controller/n80 ), .ZN(\byte_controller/n78 ) );
  NAND2_X1 \byte_controller/U93  ( .A1(\byte_controller/n18 ), .A2(
        \byte_controller/n113 ), .ZN(\byte_controller/n114 ) );
  AOI21_X1 \byte_controller/U92  ( .B1(\byte_controller/n77 ), .B2(
        \byte_controller/n11 ), .A(\byte_controller/n88 ), .ZN(
        \byte_controller/N174 ) );
  NAND2_X1 \byte_controller/U91  ( .A1(\byte_controller/c_state [2]), .A2(
        \byte_controller/n28 ), .ZN(\byte_controller/n77 ) );
  OAI21_X1 \byte_controller/U90  ( .B1(\byte_controller/n40 ), .B2(
        \byte_controller/n88 ), .A(\byte_controller/n76 ), .ZN(
        \byte_controller/N175 ) );
  OAI21_X1 \byte_controller/U89  ( .B1(\byte_controller/n156 ), .B2(
        \byte_controller/n76 ), .A(\byte_controller/n75 ), .ZN(
        \byte_controller/N177 ) );
  NAND3_X1 \byte_controller/U88  ( .A1(\byte_controller/n53 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/n35 ), .ZN(
        \byte_controller/n75 ) );
  NAND2_X1 \byte_controller/U87  ( .A1(\byte_controller/n19 ), .A2(
        \byte_controller/n31 ), .ZN(\byte_controller/n76 ) );
  NAND2_X1 \byte_controller/U86  ( .A1(\byte_controller/n46 ), .A2(
        \byte_controller/n48 ), .ZN(\byte_controller/n138 ) );
  OAI211_X1 \byte_controller/U85  ( .C1(\byte_controller/n25 ), .C2(
        \byte_controller/n74 ), .A(\byte_controller/n72 ), .B(
        \byte_controller/n73 ), .ZN(\byte_controller/N181 ) );
  NAND3_X1 \byte_controller/U84  ( .A1(\byte_controller/n53 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/c_state [4]), .ZN(
        \byte_controller/n72 ) );
  NAND4_X1 \byte_controller/U83  ( .A1(\byte_controller/n3 ), .A2(
        \byte_controller/n11 ), .A3(\byte_controller/n6 ), .A4(
        \byte_controller/n71 ), .ZN(\byte_controller/n73 ) );
  INV_X1 \byte_controller/U82  ( .A(\byte_controller/n167 ), .ZN(
        \byte_controller/n71 ) );
  OAI221_X1 \byte_controller/U81  ( .B1(\byte_controller/n70 ), .B2(
        \byte_controller/n88 ), .C1(\byte_controller/n74 ), .C2(
        \byte_controller/n2 ), .A(\byte_controller/n69 ), .ZN(
        \byte_controller/N179 ) );
  NAND3_X1 \byte_controller/U80  ( .A1(\byte_controller/n53 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/c_state [2]), .ZN(
        \byte_controller/n69 ) );
  INV_X1 \byte_controller/U79  ( .A(\byte_controller/n68 ), .ZN(
        \byte_controller/n91 ) );
  OAI211_X1 \byte_controller/U78  ( .C1(\byte_controller/n67 ), .C2(
        \byte_controller/n41 ), .A(\byte_controller/n65 ), .B(
        \byte_controller/n66 ), .ZN(\byte_controller/n68 ) );
  NAND3_X1 \byte_controller/U77  ( .A1(\byte_controller/n64 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/n143 ), .ZN(
        \byte_controller/n65 ) );
  NOR3_X1 \byte_controller/U76  ( .A1(\byte_controller/c_state [1]), .A2(
        \byte_controller/c_state [2]), .A3(\byte_controller/c_state [0]), .ZN(
        \byte_controller/n64 ) );
  NAND4_X1 \byte_controller/U75  ( .A1(\byte_controller/n51 ), .A2(
        \byte_controller/n139 ), .A3(\byte_controller/c_state [3]), .A4(
        \byte_controller/n42 ), .ZN(\byte_controller/n66 ) );
  INV_X1 \byte_controller/U74  ( .A(\byte_controller/core_ack ), .ZN(
        \byte_controller/n139 ) );
  NAND3_X1 \byte_controller/U73  ( .A1(\byte_controller/n60 ), .A2(
        \byte_controller/n39 ), .A3(\byte_controller/n62 ), .ZN(
        \byte_controller/n93 ) );
  NOR3_X1 \byte_controller/U72  ( .A1(\byte_controller/c_state [4]), .A2(
        \byte_controller/c_state [3]), .A3(\byte_controller/n155 ), .ZN(
        \byte_controller/n60 ) );
  NAND3_X1 \byte_controller/U71  ( .A1(\byte_controller/n59 ), .A2(
        \byte_controller/n24 ), .A3(\byte_controller/n31 ), .ZN(
        \byte_controller/n74 ) );
  INV_X1 \byte_controller/U70  ( .A(cr[6]), .ZN(\byte_controller/n142 ) );
  INV_X1 \byte_controller/U69  ( .A(cr[4]), .ZN(\byte_controller/n147 ) );
  INV_X1 \byte_controller/U68  ( .A(\byte_controller/n148 ), .ZN(
        \byte_controller/n59 ) );
  NAND4_X1 \byte_controller/U67  ( .A1(\byte_controller/n47 ), .A2(
        \byte_controller/n49 ), .A3(\byte_controller/n30 ), .A4(
        \byte_controller/n156 ), .ZN(\byte_controller/n148 ) );
  INV_X1 \byte_controller/U66  ( .A(cr[7]), .ZN(\byte_controller/n156 ) );
  AOI22_X1 \byte_controller/U65  ( .A1(\byte_controller/n89 ), .A2(
        \byte_controller/n30 ), .B1(\byte_controller/n58 ), .B2(
        \byte_controller/n28 ), .ZN(\byte_controller/n70 ) );
  INV_X1 \byte_controller/U64  ( .A(\byte_controller/n61 ), .ZN(
        \byte_controller/n58 ) );
  NAND4_X1 \byte_controller/U63  ( .A1(\byte_controller/n57 ), .A2(
        \byte_controller/n62 ), .A3(\byte_controller/c_state [2]), .A4(
        \byte_controller/n63 ), .ZN(\byte_controller/n61 ) );
  INV_X1 \byte_controller/U62  ( .A(\byte_controller/n133 ), .ZN(
        \byte_controller/n57 ) );
  NAND2_X1 \byte_controller/U61  ( .A1(\byte_controller/n155 ), .A2(
        \byte_controller/n143 ), .ZN(\byte_controller/n133 ) );
  INV_X1 \byte_controller/U60  ( .A(\byte_controller/n36 ), .ZN(
        \byte_controller/n89 ) );
  NAND3_X1 \byte_controller/U59  ( .A1(\byte_controller/n56 ), .A2(
        \byte_controller/n143 ), .A3(\byte_controller/n63 ), .ZN(
        \byte_controller/n67 ) );
  OAI22_X1 \byte_controller/U58  ( .A1(\byte_controller/n3 ), .A2(
        \byte_controller/n167 ), .B1(\byte_controller/n88 ), .B2(
        \byte_controller/n4 ), .ZN(\byte_controller/N176 ) );
  NAND2_X1 \byte_controller/U57  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n41 ), .ZN(\byte_controller/n88 ) );
  NAND2_X1 \byte_controller/U56  ( .A1(\byte_controller/n55 ), .A2(
        \byte_controller/n24 ), .ZN(\byte_controller/n167 ) );
  INV_X1 \byte_controller/U55  ( .A(wb_rst_i), .ZN(\byte_controller/n113 ) );
  INV_X1 \byte_controller/U54  ( .A(i2c_al), .ZN(\byte_controller/n54 ) );
  INV_X1 \byte_controller/U53  ( .A(\byte_controller/n164 ), .ZN(
        \byte_controller/n55 ) );
  NAND2_X1 \byte_controller/U52  ( .A1(\byte_controller/c_state [3]), .A2(
        \byte_controller/n41 ), .ZN(\byte_controller/n164 ) );
  OR3_X2 \byte_controller/U51  ( .A1(\byte_controller/ld ), .A2(wb_rst_i), 
        .A3(\byte_controller/n20 ), .ZN(\byte_controller/n131 ) );
  OAI21_X1 \byte_controller/U50  ( .B1(\byte_controller/n45 ), .B2(
        \byte_controller/n41 ), .A(\byte_controller/n91 ), .ZN(
        \byte_controller/n86 ) );
  OAI21_X1 \byte_controller/U49  ( .B1(\byte_controller/n45 ), .B2(
        \byte_controller/n41 ), .A(\byte_controller/n91 ), .ZN(
        \byte_controller/n53 ) );
  AND3_X1 \byte_controller/U48  ( .A1(\byte_controller/c_state [0]), .A2(
        \byte_controller/n26 ), .A3(\byte_controller/n155 ), .ZN(
        \byte_controller/n56 ) );
  BUF_X1 \byte_controller/U47  ( .A(\byte_controller/n163 ), .Z(
        \byte_controller/n52 ) );
  BUF_X2 \byte_controller/U46  ( .A(arst_i), .Z(\byte_controller/n50 ) );
  AND2_X1 \byte_controller/U45  ( .A1(\byte_controller/n62 ), .A2(
        \byte_controller/n26 ), .ZN(\byte_controller/n49 ) );
  AND3_X1 \byte_controller/U44  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n26 ), .A3(\byte_controller/n62 ), .ZN(
        \byte_controller/n51 ) );
  AND3_X1 \byte_controller/U43  ( .A1(\byte_controller/n143 ), .A2(
        \byte_controller/n63 ), .A3(\byte_controller/n155 ), .ZN(
        \byte_controller/n47 ) );
  AND2_X1 \byte_controller/U42  ( .A1(\byte_controller/n61 ), .A2(
        \byte_controller/n93 ), .ZN(\byte_controller/n45 ) );
  NAND3_X1 \byte_controller/U41  ( .A1(\byte_controller/n142 ), .A2(
        \byte_controller/n147 ), .A3(\byte_controller/n159 ), .ZN(
        \byte_controller/n43 ) );
  AND2_X1 \byte_controller/U40  ( .A1(\byte_controller/n43 ), .A2(
        \byte_controller/n44 ), .ZN(\byte_controller/n48 ) );
  CLKBUF_X1 \byte_controller/U39  ( .A(\byte_controller/n62 ), .Z(
        \byte_controller/n40 ) );
  CLKBUF_X1 \byte_controller/U38  ( .A(\byte_controller/n26 ), .Z(
        \byte_controller/n39 ) );
  OAI211_X1 \byte_controller/U37  ( .C1(\byte_controller/n9 ), .C2(
        \byte_controller/n1 ), .A(\byte_controller/n24 ), .B(
        \byte_controller/n138 ), .ZN(\byte_controller/n38 ) );
  CLKBUF_X1 \byte_controller/U36  ( .A(\byte_controller/n143 ), .Z(
        \byte_controller/n37 ) );
  CLKBUF_X1 \byte_controller/U35  ( .A(\byte_controller/n67 ), .Z(
        \byte_controller/n36 ) );
  INV_X1 \byte_controller/U34  ( .A(\byte_controller/n40 ), .ZN(
        \byte_controller/n35 ) );
  BUF_X1 \byte_controller/U33  ( .A(\byte_controller/n155 ), .Z(
        \byte_controller/n42 ) );
  BUF_X2 \byte_controller/U32  ( .A(\byte_controller/core_ack ), .Z(
        \byte_controller/n41 ) );
  AND2_X1 \byte_controller/U31  ( .A1(\byte_controller/n24 ), .A2(
        \byte_controller/n10 ), .ZN(\byte_controller/n33 ) );
  NAND2_X1 \byte_controller/U30  ( .A1(\byte_controller/n46 ), .A2(
        \byte_controller/n48 ), .ZN(\byte_controller/n32 ) );
  AND2_X1 \byte_controller/U29  ( .A1(\byte_controller/n43 ), .A2(
        \byte_controller/n44 ), .ZN(\byte_controller/n31 ) );
  INV_X1 \byte_controller/U28  ( .A(cr[5]), .ZN(\byte_controller/n159 ) );
  INV_X1 \byte_controller/U27  ( .A(cr[5]), .ZN(\byte_controller/n30 ) );
  INV_X1 \byte_controller/U26  ( .A(\byte_controller/n30 ), .ZN(
        \byte_controller/n29 ) );
  NAND3_X1 \byte_controller/U25  ( .A1(\byte_controller/n14 ), .A2(
        \byte_controller/n15 ), .A3(\byte_controller/n17 ), .ZN(
        \byte_controller/n28 ) );
  CLKBUF_X1 \byte_controller/U24  ( .A(cr[4]), .Z(\byte_controller/n25 ) );
  INV_X1 \byte_controller/U23  ( .A(\byte_controller/n24 ), .ZN(
        \byte_controller/n136 ) );
  AND2_X4 \byte_controller/U22  ( .A1(\byte_controller/n54 ), .A2(
        \byte_controller/n113 ), .ZN(\byte_controller/n24 ) );
  BUF_X1 \byte_controller/U21  ( .A(\byte_controller/n132 ), .Z(
        \byte_controller/n23 ) );
  BUF_X1 \byte_controller/U20  ( .A(\byte_controller/n132 ), .Z(
        \byte_controller/n22 ) );
  BUF_X1 \byte_controller/U19  ( .A(\byte_controller/n132 ), .Z(
        \byte_controller/n21 ) );
  AND2_X1 \byte_controller/U18  ( .A1(\byte_controller/n1 ), .A2(
        \byte_controller/n24 ), .ZN(\byte_controller/n19 ) );
  AND2_X1 \byte_controller/U17  ( .A1(\byte_controller/n1 ), .A2(
        \byte_controller/n31 ), .ZN(\byte_controller/n34 ) );
  INV_X1 \byte_controller/U16  ( .A(\byte_controller/n16 ), .ZN(
        \byte_controller/n18 ) );
  CLKBUF_X1 \byte_controller/U15  ( .A(\byte_controller/n142 ), .Z(
        \byte_controller/n13 ) );
  AND3_X1 \byte_controller/U14  ( .A1(\byte_controller/n14 ), .A2(
        \byte_controller/n15 ), .A3(\byte_controller/n17 ), .ZN(
        \byte_controller/n12 ) );
  BUF_X1 \byte_controller/U13  ( .A(\byte_controller/n42 ), .Z(
        \byte_controller/n11 ) );
  INV_X1 \byte_controller/U12  ( .A(\byte_controller/n139 ), .ZN(
        \byte_controller/n10 ) );
  BUF_X1 \byte_controller/U11  ( .A(\byte_controller/n139 ), .Z(
        \byte_controller/n9 ) );
  CLKBUF_X1 \byte_controller/U10  ( .A(\byte_controller/n45 ), .Z(
        \byte_controller/n8 ) );
  CLKBUF_X1 \byte_controller/U9  ( .A(\byte_controller/n93 ), .Z(
        \byte_controller/n7 ) );
  AND3_X1 \byte_controller/U8  ( .A1(\byte_controller/n63 ), .A2(
        \byte_controller/n26 ), .A3(\byte_controller/n62 ), .ZN(
        \byte_controller/n6 ) );
  INV_X1 \byte_controller/U7  ( .A(\byte_controller/c_state [4]), .ZN(
        \byte_controller/n4 ) );
  BUF_X1 \byte_controller/U6  ( .A(cr[6]), .Z(\byte_controller/n3 ) );
  BUF_X1 \byte_controller/U5  ( .A(\byte_controller/n147 ), .Z(
        \byte_controller/n2 ) );
  AND2_X1 \byte_controller/U4  ( .A1(\byte_controller/n47 ), .A2(
        \byte_controller/n49 ), .ZN(\byte_controller/n46 ) );
  AND2_X2 \byte_controller/U3  ( .A1(\byte_controller/n47 ), .A2(
        \byte_controller/n49 ), .ZN(\byte_controller/n1 ) );
  DFFR_X2 \byte_controller/c_state_reg[3]  ( .D(\byte_controller/N180 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(\byte_controller/c_state [3]), .QN(\byte_controller/n143 ) );
  DFFR_X1 \byte_controller/c_state_reg[1]  ( .D(\byte_controller/N178 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [1]), .QN(
        \byte_controller/n155 ) );
  DFFR_X1 \byte_controller/c_state_reg[2]  ( .D(\byte_controller/N179 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(\byte_controller/c_state [2]), .QN(\byte_controller/n26 ) );
  DFFR_X1 \byte_controller/c_state_reg[4]  ( .D(\byte_controller/N181 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(\byte_controller/c_state [4]), .QN(\byte_controller/n63 ) );
  DFFR_X1 \byte_controller/dcnt_reg[0]  ( .D(\byte_controller/n102 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(\byte_controller/n80 ), .QN(
        \byte_controller/n17 ) );
  DFFR_X1 \byte_controller/shift_reg  ( .D(\byte_controller/N174 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .QN(\byte_controller/n20 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[1]  ( .D(\byte_controller/n99 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(
        \byte_controller/core_cmd [1]), .QN(\byte_controller/n146 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[2]  ( .D(\byte_controller/n98 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(
        \byte_controller/core_cmd [2]), .QN(\byte_controller/n154 ) );
  DFFR_X1 \byte_controller/core_cmd_reg[3]  ( .D(\byte_controller/n97 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/core_cmd [3]), .QN(
        \byte_controller/n162 ) );
  DFFR_X1 \byte_controller/cmd_ack_reg  ( .D(\byte_controller/N176 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(done), .QN(
        \byte_controller/n44 ) );
  DFFR_X1 \byte_controller/sr_reg[0]  ( .D(\byte_controller/n110 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[0]), .QN(
        \byte_controller/n117 ) );
  DFFR_X1 \byte_controller/sr_reg[1]  ( .D(\byte_controller/n111 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[1]), .QN(
        \byte_controller/n119 ) );
  DFFR_X1 \byte_controller/sr_reg[2]  ( .D(\byte_controller/n109 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[2]), .QN(
        \byte_controller/n121 ) );
  DFFR_X1 \byte_controller/sr_reg[3]  ( .D(\byte_controller/n108 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[3]), .QN(
        \byte_controller/n123 ) );
  DFFR_X1 \byte_controller/sr_reg[4]  ( .D(\byte_controller/n107 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[4]), .QN(
        \byte_controller/n125 ) );
  DFFR_X1 \byte_controller/sr_reg[5]  ( .D(\byte_controller/n106 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[5]), .QN(
        \byte_controller/n127 ) );
  DFFR_X1 \byte_controller/sr_reg[6]  ( .D(\byte_controller/n105 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[6]), .QN(
        \byte_controller/n130 ) );
  DFFR_X1 \byte_controller/sr_reg[7]  ( .D(\byte_controller/n104 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(rxr[7]), .QN(
        \byte_controller/n5 ) );
  DFFR_X1 \byte_controller/c_state_reg[0]  ( .D(\byte_controller/N177 ), .CK(
        wb_clk_i), .RN(arst_i), .Q(\byte_controller/c_state [0]), .QN(
        \byte_controller/n62 ) );
  DFFR_X1 \byte_controller/ack_out_reg  ( .D(\byte_controller/n96 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(irxack) );
  DFFR_X1 \byte_controller/core_cmd_reg[0]  ( .D(\byte_controller/n100 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(
        \byte_controller/core_cmd [0]), .QN(\byte_controller/n141 ) );
  DFFR_X1 \byte_controller/core_txd_reg  ( .D(\byte_controller/N173 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(\byte_controller/core_txd )
         );
  DFFR_X1 \byte_controller/dcnt_reg[2]  ( .D(\byte_controller/n101 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(\byte_controller/n27 ), .QN(
        \byte_controller/n14 ) );
  DFFR_X1 \byte_controller/dcnt_reg[1]  ( .D(\byte_controller/n103 ), .CK(
        wb_clk_i), .RN(\byte_controller/n50 ), .Q(\byte_controller/dcnt[1] ), 
        .QN(\byte_controller/n15 ) );
  DFFR_X1 \byte_controller/ld_reg  ( .D(\byte_controller/N175 ), .CK(wb_clk_i), 
        .RN(\byte_controller/n50 ), .Q(\byte_controller/ld ), .QN(
        \byte_controller/n16 ) );
  NOR3_X1 \byte_controller/bit_controller/U161  ( .A1(
        \byte_controller/bit_controller/n89 ), .A2(
        \byte_controller/bit_controller/n60 ), .A3(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/N154 ) );
  AOI211_X1 \byte_controller/bit_controller/U160  ( .C1(
        \byte_controller/bit_controller/n83 ), .C2(
        \byte_controller/bit_controller/n82 ), .A(
        \byte_controller/bit_controller/sto_condition ), .B(wb_rst_i), .ZN(
        \byte_controller/bit_controller/N75 ) );
  NOR3_X1 \byte_controller/bit_controller/U159  ( .A1(
        \byte_controller/bit_controller/n106 ), .A2(
        \byte_controller/bit_controller/n108 ), .A3(
        \byte_controller/bit_controller/N69 ), .ZN(
        \byte_controller/bit_controller/N72 ) );
  MUX2_X1 \byte_controller/bit_controller/U158  ( .A(sda_padoen_o), .B(
        \byte_controller/bit_controller/n210 ), .S(
        \byte_controller/bit_controller/n209 ), .Z(
        \byte_controller/bit_controller/n160 ) );
  AOI21_X1 \byte_controller/bit_controller/U157  ( .B1(
        \byte_controller/bit_controller/n57 ), .B2(
        \byte_controller/bit_controller/n208 ), .A(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n209 ) );
  NAND4_X1 \byte_controller/bit_controller/U156  ( .A1(
        \byte_controller/bit_controller/n206 ), .A2(
        \byte_controller/bit_controller/n114 ), .A3(
        \byte_controller/bit_controller/n2 ), .A4(
        \byte_controller/bit_controller/n126 ), .ZN(
        \byte_controller/bit_controller/n210 ) );
  AOI211_X1 \byte_controller/bit_controller/U155  ( .C1(
        \byte_controller/core_txd ), .C2(\byte_controller/bit_controller/n205 ), .A(\byte_controller/bit_controller/n211 ), .B(
        \byte_controller/bit_controller/n204 ), .ZN(
        \byte_controller/bit_controller/n206 ) );
  NAND3_X1 \byte_controller/bit_controller/U154  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n110 ), .A3(
        \byte_controller/bit_controller/n9 ), .ZN(
        \byte_controller/bit_controller/n205 ) );
  NAND4_X1 \byte_controller/bit_controller/U153  ( .A1(
        \byte_controller/bit_controller/n199 ), .A2(
        \byte_controller/bit_controller/n200 ), .A3(
        \byte_controller/core_cmd [0]), .A4(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n202 ) );
  OAI22_X1 \byte_controller/bit_controller/U152  ( .A1(
        \byte_controller/bit_controller/n120 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n119 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n153 ) );
  OAI33_X1 \byte_controller/bit_controller/U151  ( .A1(
        \byte_controller/bit_controller/n197 ), .A2(
        \byte_controller/bit_controller/n111 ), .A3(
        \byte_controller/bit_controller/n112 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/N69 ), .B3(
        \byte_controller/bit_controller/n196 ), .ZN(
        \byte_controller/bit_controller/N83 ) );
  NAND3_X1 \byte_controller/bit_controller/U150  ( .A1(
        \byte_controller/bit_controller/sto_condition ), .A2(
        \byte_controller/bit_controller/n84 ), .A3(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n197 ) );
  OAI22_X1 \byte_controller/bit_controller/U149  ( .A1(
        \byte_controller/bit_controller/n9 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n109 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n143 ) );
  NOR2_X1 \byte_controller/bit_controller/U148  ( .A1(wb_rst_i), .A2(
        \byte_controller/bit_controller/n194 ), .ZN(
        \byte_controller/bit_controller/n161 ) );
  MUX2_X1 \byte_controller/bit_controller/U147  ( .A(
        \byte_controller/bit_controller/n193 ), .B(
        \byte_controller/bit_controller/n84 ), .S(
        \byte_controller/bit_controller/n89 ), .Z(
        \byte_controller/bit_controller/n194 ) );
  NAND2_X1 \byte_controller/bit_controller/U146  ( .A1(
        \byte_controller/bit_controller/n192 ), .A2(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n193 ) );
  INV_X1 \byte_controller/bit_controller/U145  ( .A(
        \byte_controller/bit_controller/n190 ), .ZN(
        \byte_controller/bit_controller/n192 ) );
  AOI21_X1 \byte_controller/bit_controller/U144  ( .B1(
        \byte_controller/bit_controller/n74 ), .B2(
        \byte_controller/bit_controller/n195 ), .A(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n212 ) );
  INV_X1 \byte_controller/bit_controller/U143  ( .A(
        \byte_controller/bit_controller/n189 ), .ZN(
        \byte_controller/bit_controller/n162 ) );
  AOI222_X1 \byte_controller/bit_controller/U142  ( .A1(
        \byte_controller/bit_controller/N43 ), .A2(
        \byte_controller/bit_controller/n100 ), .B1(
        \byte_controller/bit_controller/n22 ), .B2(
        \byte_controller/bit_controller/cnt [15]), .C1(prer[15]), .C2(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n189 ) );
  INV_X1 \byte_controller/bit_controller/U141  ( .A(
        \byte_controller/bit_controller/n188 ), .ZN(
        \byte_controller/bit_controller/n142 ) );
  AOI222_X1 \byte_controller/bit_controller/U140  ( .A1(prer[0]), .A2(
        \byte_controller/bit_controller/n32 ), .B1(
        \byte_controller/bit_controller/n17 ), .B2(
        \byte_controller/bit_controller/n31 ), .C1(
        \byte_controller/bit_controller/n99 ), .C2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/n188 ) );
  INV_X1 \byte_controller/bit_controller/U139  ( .A(
        \byte_controller/bit_controller/n187 ), .ZN(
        \byte_controller/bit_controller/n141 ) );
  AOI222_X1 \byte_controller/bit_controller/U138  ( .A1(prer[1]), .A2(
        \byte_controller/bit_controller/n32 ), .B1(
        \byte_controller/bit_controller/n17 ), .B2(
        \byte_controller/bit_controller/n26 ), .C1(
        \byte_controller/bit_controller/n99 ), .C2(
        \byte_controller/bit_controller/N29 ), .ZN(
        \byte_controller/bit_controller/n187 ) );
  INV_X1 \byte_controller/bit_controller/U137  ( .A(
        \byte_controller/bit_controller/n186 ), .ZN(
        \byte_controller/bit_controller/n140 ) );
  AOI222_X1 \byte_controller/bit_controller/U136  ( .A1(
        \byte_controller/bit_controller/n32 ), .A2(prer[2]), .B1(
        \byte_controller/bit_controller/n22 ), .B2(
        \byte_controller/bit_controller/n13 ), .C1(
        \byte_controller/bit_controller/N30 ), .C2(
        \byte_controller/bit_controller/n99 ), .ZN(
        \byte_controller/bit_controller/n186 ) );
  INV_X1 \byte_controller/bit_controller/U135  ( .A(
        \byte_controller/bit_controller/n185 ), .ZN(
        \byte_controller/bit_controller/n139 ) );
  AOI222_X1 \byte_controller/bit_controller/U134  ( .A1(prer[3]), .A2(
        \byte_controller/bit_controller/n32 ), .B1(
        \byte_controller/bit_controller/n17 ), .B2(
        \byte_controller/bit_controller/n76 ), .C1(
        \byte_controller/bit_controller/N31 ), .C2(
        \byte_controller/bit_controller/n99 ), .ZN(
        \byte_controller/bit_controller/n185 ) );
  INV_X1 \byte_controller/bit_controller/U133  ( .A(
        \byte_controller/bit_controller/n184 ), .ZN(
        \byte_controller/bit_controller/n138 ) );
  AOI222_X1 \byte_controller/bit_controller/U132  ( .A1(prer[4]), .A2(
        \byte_controller/bit_controller/n32 ), .B1(
        \byte_controller/bit_controller/n22 ), .B2(
        \byte_controller/bit_controller/n16 ), .C1(
        \byte_controller/bit_controller/N32 ), .C2(
        \byte_controller/bit_controller/n99 ), .ZN(
        \byte_controller/bit_controller/n184 ) );
  INV_X1 \byte_controller/bit_controller/U131  ( .A(
        \byte_controller/bit_controller/n183 ), .ZN(
        \byte_controller/bit_controller/n137 ) );
  AOI222_X1 \byte_controller/bit_controller/U130  ( .A1(
        \byte_controller/bit_controller/N33 ), .A2(
        \byte_controller/bit_controller/n100 ), .B1(
        \byte_controller/bit_controller/n32 ), .B2(prer[5]), .C1(
        \byte_controller/bit_controller/n18 ), .C2(
        \byte_controller/bit_controller/n14 ), .ZN(
        \byte_controller/bit_controller/n183 ) );
  INV_X1 \byte_controller/bit_controller/U129  ( .A(
        \byte_controller/bit_controller/n182 ), .ZN(
        \byte_controller/bit_controller/n133 ) );
  AOI222_X1 \byte_controller/bit_controller/U128  ( .A1(
        \byte_controller/bit_controller/N37 ), .A2(
        \byte_controller/bit_controller/n100 ), .B1(
        \byte_controller/bit_controller/n32 ), .B2(prer[9]), .C1(
        \byte_controller/bit_controller/n18 ), .C2(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/n182 ) );
  INV_X1 \byte_controller/bit_controller/U127  ( .A(
        \byte_controller/bit_controller/n181 ), .ZN(
        \byte_controller/bit_controller/n132 ) );
  AOI222_X1 \byte_controller/bit_controller/U126  ( .A1(
        \byte_controller/bit_controller/N38 ), .A2(
        \byte_controller/bit_controller/n19 ), .B1(prer[10]), .B2(
        \byte_controller/bit_controller/n32 ), .C1(
        \byte_controller/bit_controller/n18 ), .C2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/n181 ) );
  INV_X1 \byte_controller/bit_controller/U125  ( .A(
        \byte_controller/bit_controller/n180 ), .ZN(
        \byte_controller/bit_controller/n131 ) );
  AOI222_X1 \byte_controller/bit_controller/U124  ( .A1(
        \byte_controller/bit_controller/N39 ), .A2(
        \byte_controller/bit_controller/n100 ), .B1(prer[11]), .B2(
        \byte_controller/bit_controller/n32 ), .C1(
        \byte_controller/bit_controller/n18 ), .C2(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/n180 ) );
  INV_X1 \byte_controller/bit_controller/U123  ( .A(
        \byte_controller/bit_controller/n179 ), .ZN(
        \byte_controller/bit_controller/n130 ) );
  AOI222_X1 \byte_controller/bit_controller/U122  ( .A1(
        \byte_controller/bit_controller/N40 ), .A2(
        \byte_controller/bit_controller/n19 ), .B1(prer[12]), .B2(
        \byte_controller/bit_controller/n32 ), .C1(
        \byte_controller/bit_controller/n17 ), .C2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/n179 ) );
  INV_X1 \byte_controller/bit_controller/U121  ( .A(
        \byte_controller/bit_controller/n178 ), .ZN(
        \byte_controller/bit_controller/n129 ) );
  AOI222_X1 \byte_controller/bit_controller/U120  ( .A1(
        \byte_controller/bit_controller/N41 ), .A2(
        \byte_controller/bit_controller/n19 ), .B1(
        \byte_controller/bit_controller/n22 ), .B2(
        \byte_controller/bit_controller/cnt [13]), .C1(prer[13]), .C2(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n178 ) );
  INV_X1 \byte_controller/bit_controller/U119  ( .A(
        \byte_controller/bit_controller/n177 ), .ZN(
        \byte_controller/bit_controller/n128 ) );
  AOI222_X1 \byte_controller/bit_controller/U118  ( .A1(
        \byte_controller/bit_controller/N42 ), .A2(
        \byte_controller/bit_controller/n100 ), .B1(
        \byte_controller/bit_controller/n22 ), .B2(
        \byte_controller/bit_controller/cnt [14]), .C1(prer[14]), .C2(
        \byte_controller/bit_controller/n32 ), .ZN(
        \byte_controller/bit_controller/n177 ) );
  NAND2_X1 \byte_controller/bit_controller/U117  ( .A1(
        \byte_controller/bit_controller/n175 ), .A2(n159), .ZN(
        \byte_controller/bit_controller/n176 ) );
  NAND4_X1 \byte_controller/bit_controller/U116  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n171 ), .A3(
        \byte_controller/bit_controller/n3 ), .A4(
        \byte_controller/bit_controller/n172 ), .ZN(
        \byte_controller/bit_controller/n175 ) );
  NAND2_X1 \byte_controller/bit_controller/U115  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/N68 ) );
  AOI21_X1 \byte_controller/bit_controller/U114  ( .B1(
        \byte_controller/bit_controller/n169 ), .B2(
        \byte_controller/bit_controller/n208 ), .A(
        \byte_controller/bit_controller/n207 ), .ZN(
        \byte_controller/bit_controller/n170 ) );
  INV_X1 \byte_controller/bit_controller/U113  ( .A(
        \byte_controller/bit_controller/n203 ), .ZN(
        \byte_controller/bit_controller/n207 ) );
  NAND2_X1 \byte_controller/bit_controller/U112  ( .A1(
        \byte_controller/bit_controller/n168 ), .A2(
        \byte_controller/bit_controller/n126 ), .ZN(
        \byte_controller/bit_controller/n169 ) );
  NAND4_X1 \byte_controller/bit_controller/U111  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(
        \byte_controller/bit_controller/n9 ), .A3(
        \byte_controller/bit_controller/n53 ), .A4(
        \byte_controller/bit_controller/n119 ), .ZN(
        \byte_controller/bit_controller/n168 ) );
  NAND3_X1 \byte_controller/bit_controller/U110  ( .A1(
        \byte_controller/bit_controller/n120 ), .A2(
        \byte_controller/bit_controller/n119 ), .A3(
        \byte_controller/bit_controller/n118 ), .ZN(
        \byte_controller/bit_controller/n165 ) );
  NAND4_X1 \byte_controller/bit_controller/U109  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n125 ), .A3(
        \byte_controller/bit_controller/n123 ), .A4(
        \byte_controller/bit_controller/n79 ), .ZN(
        \byte_controller/bit_controller/n166 ) );
  OAI22_X1 \byte_controller/bit_controller/U108  ( .A1(
        \byte_controller/bit_controller/n21 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n114 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n148 ) );
  OAI22_X1 \byte_controller/bit_controller/U107  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n110 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n144 ) );
  OAI22_X1 \byte_controller/bit_controller/U106  ( .A1(
        \byte_controller/bit_controller/n123 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n122 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n155 ) );
  OAI22_X1 \byte_controller/bit_controller/U105  ( .A1(
        \byte_controller/bit_controller/n8 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n111 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n145 ) );
  OAI22_X1 \byte_controller/bit_controller/U104  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n112 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n146 ) );
  NAND4_X1 \byte_controller/bit_controller/U103  ( .A1(
        \byte_controller/bit_controller/n199 ), .A2(
        \byte_controller/bit_controller/n163 ), .A3(
        \byte_controller/core_cmd [2]), .A4(
        \byte_controller/bit_controller/n201 ), .ZN(
        \byte_controller/bit_controller/n164 ) );
  INV_X1 \byte_controller/bit_controller/U102  ( .A(
        \byte_controller/core_cmd [1]), .ZN(
        \byte_controller/bit_controller/n201 ) );
  OAI22_X1 \byte_controller/bit_controller/U101  ( .A1(
        \byte_controller/bit_controller/n119 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n2 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n152 ) );
  OAI22_X1 \byte_controller/bit_controller/U100  ( .A1(
        \byte_controller/bit_controller/n121 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n120 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n154 ) );
  OAI22_X1 \byte_controller/bit_controller/U99  ( .A1(
        \byte_controller/bit_controller/n136 ), .A2(
        \byte_controller/bit_controller/n190 ), .B1(
        \byte_controller/bit_controller/n121 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n88 ) );
  NAND3_X1 \byte_controller/bit_controller/U98  ( .A1(
        \byte_controller/core_cmd [1]), .A2(
        \byte_controller/bit_controller/n163 ), .A3(
        \byte_controller/bit_controller/n200 ), .ZN(
        \byte_controller/bit_controller/n190 ) );
  INV_X1 \byte_controller/bit_controller/U97  ( .A(
        \byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n200 ) );
  INV_X1 \byte_controller/bit_controller/U96  ( .A(
        \byte_controller/core_cmd [0]), .ZN(
        \byte_controller/bit_controller/n163 ) );
  NAND3_X1 \byte_controller/bit_controller/U95  ( .A1(
        \byte_controller/bit_controller/n30 ), .A2(
        \byte_controller/bit_controller/n73 ), .A3(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n136 ) );
  INV_X1 \byte_controller/bit_controller/U94  ( .A(
        \byte_controller/core_cmd [3]), .ZN(
        \byte_controller/bit_controller/n191 ) );
  OAI22_X1 \byte_controller/bit_controller/U93  ( .A1(
        \byte_controller/bit_controller/n24 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n21 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n149 ) );
  OAI22_X1 \byte_controller/bit_controller/U92  ( .A1(
        \byte_controller/bit_controller/n117 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n24 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n150 ) );
  OAI21_X1 \byte_controller/bit_controller/U91  ( .B1(
        \byte_controller/bit_controller/n117 ), .B2(
        \byte_controller/bit_controller/n11 ), .A(
        \byte_controller/bit_controller/n135 ), .ZN(
        \byte_controller/bit_controller/n151 ) );
  NAND4_X1 \byte_controller/bit_controller/U90  ( .A1(
        \byte_controller/bit_controller/n57 ), .A2(
        \byte_controller/core_cmd [3]), .A3(
        \byte_controller/bit_controller/n73 ), .A4(
        \byte_controller/bit_controller/n134 ), .ZN(
        \byte_controller/bit_controller/n135 ) );
  NOR3_X1 \byte_controller/bit_controller/U89  ( .A1(
        \byte_controller/core_cmd [1]), .A2(\byte_controller/core_cmd [0]), 
        .A3(\byte_controller/core_cmd [2]), .ZN(
        \byte_controller/bit_controller/n134 ) );
  NOR3_X1 \byte_controller/bit_controller/U88  ( .A1(
        \byte_controller/bit_controller/n167 ), .A2(
        \byte_controller/bit_controller/n116 ), .A3(
        \byte_controller/bit_controller/n5 ), .ZN(
        \byte_controller/bit_controller/n127 ) );
  NAND2_X1 \byte_controller/bit_controller/U87  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/n167 ) );
  NOR3_X1 \byte_controller/bit_controller/U86  ( .A1(
        \byte_controller/bit_controller/n104 ), .A2(
        \byte_controller/bit_controller/n103 ), .A3(
        \byte_controller/bit_controller/n102 ), .ZN(
        \byte_controller/bit_controller/n105 ) );
  NAND3_X1 \byte_controller/bit_controller/U85  ( .A1(
        \byte_controller/bit_controller/n117 ), .A2(
        \byte_controller/bit_controller/n125 ), .A3(
        \byte_controller/bit_controller/n79 ), .ZN(
        \byte_controller/bit_controller/n204 ) );
  OAI22_X1 \byte_controller/bit_controller/U84  ( .A1(
        \byte_controller/bit_controller/n124 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n123 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n156 ) );
  OAI22_X1 \byte_controller/bit_controller/U83  ( .A1(
        \byte_controller/bit_controller/n125 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n124 ), .B2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n157 ) );
  OAI22_X1 \byte_controller/bit_controller/U82  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n198 ), .B1(
        \byte_controller/bit_controller/n125 ), .B2(
        \byte_controller/bit_controller/n12 ), .ZN(
        \byte_controller/bit_controller/n158 ) );
  INV_X1 \byte_controller/bit_controller/U81  ( .A(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n208 ) );
  NOR4_X1 \byte_controller/bit_controller/U80  ( .A1(
        \byte_controller/bit_controller/n108 ), .A2(
        \byte_controller/bit_controller/n107 ), .A3(wb_rst_i), .A4(
        \byte_controller/bit_controller/n101 ), .ZN(
        \byte_controller/bit_controller/N73 ) );
  OR2_X1 \byte_controller/bit_controller/U79  ( .A1(wb_rst_i), .A2(scl_pad_i), 
        .ZN(\byte_controller/bit_controller/N66 ) );
  NAND2_X1 \byte_controller/bit_controller/U78  ( .A1(
        \byte_controller/bit_controller/n107 ), .A2(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/N69 ) );
  INV_X1 \byte_controller/bit_controller/U77  ( .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n195 ) );
  OR2_X1 \byte_controller/bit_controller/U76  ( .A1(wb_rst_i), .A2(sda_pad_i), 
        .ZN(\byte_controller/bit_controller/N67 ) );
  NAND2_X1 \byte_controller/bit_controller/U75  ( .A1(
        \byte_controller/bit_controller/N36 ), .A2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n97 ) );
  NAND2_X1 \byte_controller/bit_controller/U74  ( .A1(
        \byte_controller/bit_controller/n22 ), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/n96 ) );
  NAND2_X1 \byte_controller/bit_controller/U73  ( .A1(
        \byte_controller/bit_controller/n32 ), .A2(prer[8]), .ZN(
        \byte_controller/bit_controller/n95 ) );
  NAND3_X1 \byte_controller/bit_controller/U72  ( .A1(
        \byte_controller/bit_controller/n95 ), .A2(
        \byte_controller/bit_controller/n96 ), .A3(
        \byte_controller/bit_controller/n97 ), .ZN(
        \byte_controller/bit_controller/n94 ) );
  NAND2_X1 \byte_controller/bit_controller/U71  ( .A1(
        \byte_controller/bit_controller/N35 ), .A2(
        \byte_controller/bit_controller/n19 ), .ZN(
        \byte_controller/bit_controller/n93 ) );
  NAND2_X1 \byte_controller/bit_controller/U70  ( .A1(
        \byte_controller/bit_controller/n17 ), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/n92 ) );
  NAND2_X1 \byte_controller/bit_controller/U69  ( .A1(
        \byte_controller/bit_controller/n32 ), .A2(prer[7]), .ZN(
        \byte_controller/bit_controller/n91 ) );
  AND2_X1 \byte_controller/bit_controller/U68  ( .A1(
        \byte_controller/bit_controller/n27 ), .A2(n159), .ZN(
        \byte_controller/bit_controller/n90 ) );
  NAND2_X1 \byte_controller/bit_controller/U67  ( .A1(
        \byte_controller/bit_controller/n202 ), .A2(
        \byte_controller/bit_controller/n87 ), .ZN(
        \byte_controller/bit_controller/n159 ) );
  OR2_X1 \byte_controller/bit_controller/U66  ( .A1(
        \byte_controller/bit_controller/n126 ), .A2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n87 ) );
  NAND2_X1 \byte_controller/bit_controller/U65  ( .A1(
        \byte_controller/bit_controller/n164 ), .A2(
        \byte_controller/bit_controller/n86 ), .ZN(
        \byte_controller/bit_controller/n147 ) );
  OR2_X1 \byte_controller/bit_controller/U64  ( .A1(
        \byte_controller/bit_controller/n113 ), .A2(
        \byte_controller/bit_controller/n11 ), .ZN(
        \byte_controller/bit_controller/n86 ) );
  AND2_X1 \byte_controller/bit_controller/U63  ( .A1(
        \byte_controller/bit_controller/n30 ), .A2(
        \byte_controller/bit_controller/n52 ), .ZN(
        \byte_controller/bit_controller/n199 ) );
  AND2_X1 \byte_controller/bit_controller/U62  ( .A1(
        \byte_controller/bit_controller/n80 ), .A2(
        \byte_controller/bit_controller/n115 ), .ZN(
        \byte_controller/bit_controller/n79 ) );
  AND2_X1 \byte_controller/bit_controller/U61  ( .A1(
        \byte_controller/bit_controller/n115 ), .A2(
        \byte_controller/bit_controller/n80 ), .ZN(
        \byte_controller/bit_controller/n78 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U60  ( .A(
        \byte_controller/bit_controller/n46 ), .Z(
        \byte_controller/bit_controller/n76 ) );
  NAND3_X1 \byte_controller/bit_controller/U59  ( .A1(
        \byte_controller/bit_controller/n93 ), .A2(
        \byte_controller/bit_controller/n92 ), .A3(
        \byte_controller/bit_controller/n91 ), .ZN(
        \byte_controller/bit_controller/n75 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U58  ( .A(
        \byte_controller/bit_controller/n90 ), .Z(
        \byte_controller/bit_controller/n74 ) );
  NOR2_X2 \byte_controller/bit_controller/U57  ( .A1(
        \byte_controller/bit_controller/n211 ), .A2(
        \byte_controller/bit_controller/n89 ), .ZN(
        \byte_controller/bit_controller/n73 ) );
  NAND2_X1 \byte_controller/bit_controller/U56  ( .A1(
        \byte_controller/bit_controller/n85 ), .A2(
        \byte_controller/bit_controller/n6 ), .ZN(
        \byte_controller/bit_controller/n66 ) );
  MUX2_X1 \byte_controller/bit_controller/U55  ( .A(
        \byte_controller/bit_controller/n65 ), .B(\byte_controller/core_rxd ), 
        .S(\byte_controller/bit_controller/n66 ), .Z(
        \byte_controller/bit_controller/n64 ) );
  AND3_X1 \byte_controller/bit_controller/U54  ( .A1(
        \byte_controller/bit_controller/n105 ), .A2(
        \byte_controller/bit_controller/n121 ), .A3(
        \byte_controller/bit_controller/n120 ), .ZN(
        \byte_controller/bit_controller/n63 ) );
  NOR2_X1 \byte_controller/bit_controller/U53  ( .A1(
        \byte_controller/bit_controller/n62 ), .A2(
        \byte_controller/bit_controller/N68 ), .ZN(
        \byte_controller/bit_controller/n61 ) );
  OR4_X1 \byte_controller/bit_controller/U52  ( .A1(
        \byte_controller/bit_controller/n166 ), .A2(
        \byte_controller/bit_controller/n165 ), .A3(
        \byte_controller/bit_controller/n211 ), .A4(
        \byte_controller/bit_controller/n167 ), .ZN(
        \byte_controller/bit_controller/n59 ) );
  MUX2_X1 \byte_controller/bit_controller/U51  ( .A(scl_padoen_o), .B(
        \byte_controller/bit_controller/n59 ), .S(
        \byte_controller/bit_controller/n170 ), .Z(
        \byte_controller/bit_controller/n58 ) );
  AND3_X1 \byte_controller/bit_controller/U50  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(
        \byte_controller/bit_controller/n10 ), .A3(
        \byte_controller/bit_controller/n127 ), .ZN(
        \byte_controller/bit_controller/n57 ) );
  NAND2_X1 \byte_controller/bit_controller/U49  ( .A1(
        \byte_controller/bit_controller/n19 ), .A2(
        \byte_controller/bit_controller/N34 ), .ZN(
        \byte_controller/bit_controller/n56 ) );
  NAND2_X1 \byte_controller/bit_controller/U48  ( .A1(
        \byte_controller/bit_controller/n17 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/n55 ) );
  NAND2_X1 \byte_controller/bit_controller/U47  ( .A1(
        \byte_controller/bit_controller/n32 ), .A2(prer[6]), .ZN(
        \byte_controller/bit_controller/n54 ) );
  NAND3_X1 \byte_controller/bit_controller/U46  ( .A1(
        \byte_controller/bit_controller/n54 ), .A2(
        \byte_controller/bit_controller/n55 ), .A3(
        \byte_controller/bit_controller/n56 ), .ZN(
        \byte_controller/bit_controller/n77 ) );
  BUF_X1 \byte_controller/bit_controller/U45  ( .A(\byte_controller/n50 ), .Z(
        \byte_controller/bit_controller/n67 ) );
  INV_X2 \byte_controller/bit_controller/U44  ( .A(
        \byte_controller/bit_controller/n73 ), .ZN(
        \byte_controller/bit_controller/n198 ) );
  AND2_X1 \byte_controller/bit_controller/U43  ( .A1(
        \byte_controller/bit_controller/n73 ), .A2(
        \byte_controller/bit_controller/n191 ), .ZN(
        \byte_controller/bit_controller/n52 ) );
  BUF_X1 \byte_controller/bit_controller/U42  ( .A(
        \byte_controller/bit_controller/n67 ), .Z(
        \byte_controller/bit_controller/n72 ) );
  BUF_X1 \byte_controller/bit_controller/U41  ( .A(
        \byte_controller/bit_controller/n72 ), .Z(
        \byte_controller/bit_controller/n68 ) );
  BUF_X1 \byte_controller/bit_controller/U40  ( .A(
        \byte_controller/bit_controller/n71 ), .Z(
        \byte_controller/bit_controller/n70 ) );
  BUF_X1 \byte_controller/bit_controller/U39  ( .A(
        \byte_controller/bit_controller/n71 ), .Z(
        \byte_controller/bit_controller/n69 ) );
  BUF_X1 \byte_controller/bit_controller/U38  ( .A(
        \byte_controller/bit_controller/n67 ), .Z(
        \byte_controller/bit_controller/n71 ) );
  AOI221_X4 \byte_controller/bit_controller/U37  ( .B1(
        \byte_controller/bit_controller/n108 ), .B2(
        \byte_controller/bit_controller/dscl_oen ), .C1(
        \byte_controller/bit_controller/n28 ), .C2(n159), .A(wb_rst_i), .ZN(
        \byte_controller/bit_controller/n32 ) );
  INV_X1 \byte_controller/bit_controller/U36  ( .A(
        \byte_controller/bit_controller/n41 ), .ZN(
        \byte_controller/bit_controller/n31 ) );
  NAND2_X2 \byte_controller/bit_controller/U35  ( .A1(
        \byte_controller/bit_controller/n81 ), .A2(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n211 ) );
  AND4_X2 \byte_controller/bit_controller/U34  ( .A1(
        \byte_controller/bit_controller/n41 ), .A2(
        \byte_controller/bit_controller/n48 ), .A3(
        \byte_controller/bit_controller/n50 ), .A4(
        \byte_controller/bit_controller/n33 ), .ZN(
        \byte_controller/bit_controller/n174 ) );
  NAND4_X1 \byte_controller/bit_controller/U33  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n173 ), .A3(
        \byte_controller/bit_controller/n172 ), .A4(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n28 ) );
  NAND4_X1 \byte_controller/bit_controller/U32  ( .A1(
        \byte_controller/bit_controller/n174 ), .A2(
        \byte_controller/bit_controller/n4 ), .A3(
        \byte_controller/bit_controller/n172 ), .A4(
        \byte_controller/bit_controller/n171 ), .ZN(
        \byte_controller/bit_controller/n27 ) );
  AND4_X2 \byte_controller/bit_controller/U31  ( .A1(
        \byte_controller/bit_controller/n40 ), .A2(
        \byte_controller/bit_controller/n39 ), .A3(
        \byte_controller/bit_controller/n38 ), .A4(
        \byte_controller/bit_controller/n98 ), .ZN(
        \byte_controller/bit_controller/n172 ) );
  INV_X1 \byte_controller/bit_controller/U30  ( .A(
        \byte_controller/bit_controller/n48 ), .ZN(
        \byte_controller/bit_controller/n26 ) );
  AND2_X1 \byte_controller/bit_controller/U29  ( .A1(n159), .A2(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n25 ) );
  AND2_X1 \byte_controller/bit_controller/U28  ( .A1(
        \byte_controller/bit_controller/n27 ), .A2(
        \byte_controller/bit_controller/n25 ), .ZN(
        \byte_controller/bit_controller/n99 ) );
  INV_X1 \byte_controller/bit_controller/U27  ( .A(
        \byte_controller/bit_controller/n23 ), .ZN(
        \byte_controller/bit_controller/n24 ) );
  INV_X1 \byte_controller/bit_controller/U26  ( .A(
        \byte_controller/bit_controller/n20 ), .ZN(
        \byte_controller/bit_controller/n21 ) );
  AND2_X2 \byte_controller/bit_controller/U25  ( .A1(
        \byte_controller/bit_controller/n90 ), .A2(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n19 ) );
  AND2_X1 \byte_controller/bit_controller/U24  ( .A1(
        \byte_controller/bit_controller/n176 ), .A2(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n18 ) );
  AND2_X2 \byte_controller/bit_controller/U23  ( .A1(
        \byte_controller/bit_controller/n176 ), .A2(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n17 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U22  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/n16 ) );
  AND3_X1 \byte_controller/bit_controller/U21  ( .A1(
        \byte_controller/bit_controller/n78 ), .A2(
        \byte_controller/bit_controller/n125 ), .A3(
        \byte_controller/bit_controller/n117 ), .ZN(
        \byte_controller/bit_controller/n15 ) );
  AND2_X2 \byte_controller/bit_controller/U20  ( .A1(
        \byte_controller/bit_controller/n90 ), .A2(
        \byte_controller/bit_controller/n195 ), .ZN(
        \byte_controller/bit_controller/n100 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U19  ( .A(
        \byte_controller/bit_controller/cnt [5]), .Z(
        \byte_controller/bit_controller/n14 ) );
  CLKBUF_X1 \byte_controller/bit_controller/U18  ( .A(
        \byte_controller/bit_controller/n51 ), .Z(
        \byte_controller/bit_controller/n13 ) );
  AND2_X1 \byte_controller/bit_controller/U17  ( .A1(
        \byte_controller/bit_controller/n176 ), .A2(
        \byte_controller/bit_controller/n61 ), .ZN(
        \byte_controller/bit_controller/n22 ) );
  AND3_X1 \byte_controller/bit_controller/U16  ( .A1(
        \byte_controller/bit_controller/n63 ), .A2(
        \byte_controller/bit_controller/n10 ), .A3(
        \byte_controller/bit_controller/n127 ), .ZN(
        \byte_controller/bit_controller/n30 ) );
  OR2_X1 \byte_controller/bit_controller/U15  ( .A1(
        \byte_controller/bit_controller/n29 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n203 ) );
  OR2_X1 \byte_controller/bit_controller/U14  ( .A1(
        \byte_controller/bit_controller/n29 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n12 ) );
  OR2_X2 \byte_controller/bit_controller/U13  ( .A1(
        \byte_controller/bit_controller/n29 ), .A2(
        \byte_controller/bit_controller/n211 ), .ZN(
        \byte_controller/bit_controller/n11 ) );
  AND2_X1 \byte_controller/bit_controller/U12  ( .A1(
        \byte_controller/bit_controller/n60 ), .A2(
        \byte_controller/bit_controller/n15 ), .ZN(
        \byte_controller/bit_controller/n53 ) );
  AND2_X1 \byte_controller/bit_controller/U11  ( .A1(
        \byte_controller/bit_controller/n15 ), .A2(
        \byte_controller/bit_controller/n60 ), .ZN(
        \byte_controller/bit_controller/n10 ) );
  AND2_X1 \byte_controller/bit_controller/U10  ( .A1(
        \byte_controller/bit_controller/n111 ), .A2(
        \byte_controller/bit_controller/n112 ), .ZN(
        \byte_controller/bit_controller/n9 ) );
  INV_X1 \byte_controller/bit_controller/U9  ( .A(
        \byte_controller/bit_controller/n7 ), .ZN(
        \byte_controller/bit_controller/n8 ) );
  AND4_X2 \byte_controller/bit_controller/U8  ( .A1(
        \byte_controller/bit_controller/n110 ), .A2(
        \byte_controller/bit_controller/n122 ), .A3(
        \byte_controller/bit_controller/n114 ), .A4(
        \byte_controller/bit_controller/n118 ), .ZN(
        \byte_controller/bit_controller/n60 ) );
  AND4_X1 \byte_controller/bit_controller/U7  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n44 ), .A3(
        \byte_controller/bit_controller/n47 ), .A4(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/n173 ) );
  AND4_X1 \byte_controller/bit_controller/U6  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n44 ), .A3(
        \byte_controller/bit_controller/n47 ), .A4(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/n4 ) );
  AND4_X1 \byte_controller/bit_controller/U5  ( .A1(
        \byte_controller/bit_controller/n43 ), .A2(
        \byte_controller/bit_controller/n44 ), .A3(
        \byte_controller/bit_controller/n47 ), .A4(
        \byte_controller/bit_controller/n45 ), .ZN(
        \byte_controller/bit_controller/n3 ) );
  AND4_X2 \byte_controller/bit_controller/U4  ( .A1(
        \byte_controller/bit_controller/n34 ), .A2(
        \byte_controller/bit_controller/n35 ), .A3(
        \byte_controller/bit_controller/n36 ), .A4(
        \byte_controller/bit_controller/n37 ), .ZN(
        \byte_controller/bit_controller/n171 ) );
  INV_X1 \byte_controller/bit_controller/U3  ( .A(
        \byte_controller/bit_controller/n1 ), .ZN(
        \byte_controller/bit_controller/n2 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[1]  ( .D(
        \byte_controller/bit_controller/n158 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .QN(
        \byte_controller/bit_controller/n125 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[0]  ( .D(
        \byte_controller/bit_controller/n159 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .Q(
        \byte_controller/bit_controller/n116 ), .QN(
        \byte_controller/bit_controller/n126 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[13]  ( .D(
        \byte_controller/bit_controller/n147 ), .CK(wb_clk_i), .RN(
        \byte_controller/n50 ), .Q(\byte_controller/bit_controller/n104 ), 
        .QN(\byte_controller/bit_controller/n113 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[14]  ( .D(
        \byte_controller/bit_controller/n146 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .Q(
        \byte_controller/bit_controller/n7 ), .QN(
        \byte_controller/bit_controller/n112 ) );
  DFFR_X2 \byte_controller/bit_controller/c_state_reg[15]  ( .D(
        \byte_controller/bit_controller/n145 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n111 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[7]  ( .D(
        \byte_controller/bit_controller/n75 ), .CK(wb_clk_i), .RN(
        \byte_controller/n50 ), .Q(\byte_controller/bit_controller/cnt [7]), 
        .QN(\byte_controller/bit_controller/n98 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[9]  ( .D(
        \byte_controller/bit_controller/n133 ), .CK(wb_clk_i), .RN(
        \byte_controller/n50 ), .Q(\byte_controller/bit_controller/cnt [9]), 
        .QN(\byte_controller/bit_controller/n39 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[4]  ( .D(
        \byte_controller/bit_controller/n138 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [4]), .QN(
        \byte_controller/bit_controller/n47 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[3]  ( .D(
        \byte_controller/bit_controller/n139 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/n46 ), .QN(
        \byte_controller/bit_controller/n45 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[2]  ( .D(
        \byte_controller/bit_controller/n140 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/n51 ), .QN(
        \byte_controller/bit_controller/n50 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[1]  ( .D(
        \byte_controller/bit_controller/n141 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/n49 ), .QN(
        \byte_controller/bit_controller/n48 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[0]  ( .D(
        \byte_controller/bit_controller/n142 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/n42 ), .QN(
        \byte_controller/bit_controller/n41 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[13]  ( .D(
        \byte_controller/bit_controller/n129 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [13]), .QN(
        \byte_controller/bit_controller/n35 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[14]  ( .D(
        \byte_controller/bit_controller/n128 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [14]), .QN(
        \byte_controller/bit_controller/n34 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[15]  ( .D(
        \byte_controller/bit_controller/n162 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [15]), .QN(
        \byte_controller/bit_controller/n33 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[12]  ( .D(
        \byte_controller/bit_controller/n130 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .Q(
        \byte_controller/bit_controller/cnt [12]), .QN(
        \byte_controller/bit_controller/n36 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[11]  ( .D(
        \byte_controller/bit_controller/n131 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [11]), .QN(
        \byte_controller/bit_controller/n37 ) );
  DFFR_X1 \byte_controller/bit_controller/cnt_reg[10]  ( .D(
        \byte_controller/bit_controller/n132 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [10]), .QN(
        \byte_controller/bit_controller/n38 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[10]  ( .D(
        \byte_controller/bit_controller/n150 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .Q(
        \byte_controller/bit_controller/n23 ), .QN(
        \byte_controller/bit_controller/n80 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[11]  ( .D(
        \byte_controller/bit_controller/n149 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .Q(
        \byte_controller/bit_controller/n20 ), .QN(
        \byte_controller/bit_controller/n115 ) );
  DFFS_X1 \byte_controller/bit_controller/sda_oen_reg  ( .D(
        \byte_controller/bit_controller/n160 ), .CK(wb_clk_i), .SN(
        \byte_controller/n50 ), .Q(sda_padoen_o), .QN(
        \byte_controller/bit_controller/n196 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[8]  ( .D(
        \byte_controller/bit_controller/n152 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .Q(
        \byte_controller/bit_controller/n1 ), .QN(
        \byte_controller/bit_controller/n118 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[9]  ( .D(
        \byte_controller/bit_controller/n151 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n117 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[5]  ( .D(
        \byte_controller/bit_controller/n88 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n121 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[6]  ( .D(
        \byte_controller/bit_controller/n154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n120 ) );
  DFFR_X1 \byte_controller/bit_controller/sda_chk_reg  ( .D(
        \byte_controller/bit_controller/n143 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n109 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_stop_reg  ( .D(
        \byte_controller/bit_controller/n161 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .QN(
        \byte_controller/bit_controller/n84 ) );
  DFFR_X1 \byte_controller/bit_controller/busy_reg  ( .D(
        \byte_controller/bit_controller/N75 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .Q(sr[6]), .QN(
        \byte_controller/bit_controller/n83 ) );
  DFFS_X1 \byte_controller/bit_controller/dSDA_reg  ( .D(
        \byte_controller/bit_controller/N69 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n70 ), .Q(
        \byte_controller/bit_controller/n101 ), .QN(
        \byte_controller/bit_controller/n106 ) );
  DFFS_X1 \byte_controller/bit_controller/dSCL_reg  ( .D(
        \byte_controller/bit_controller/N68 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n70 ), .QN(
        \byte_controller/bit_controller/n85 ) );
  DFFR_X1 \byte_controller/bit_controller/sto_condition_reg  ( .D(
        \byte_controller/bit_controller/N73 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .Q(
        \byte_controller/bit_controller/sto_condition ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[6]  ( .D(
        \byte_controller/bit_controller/n77 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [6]), .QN(
        \byte_controller/bit_controller/n43 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[5]  ( .D(
        \byte_controller/bit_controller/n137 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(
        \byte_controller/bit_controller/cnt [5]), .QN(
        \byte_controller/bit_controller/n44 ) );
  DFFR_X2 \byte_controller/bit_controller/cnt_reg[8]  ( .D(
        \byte_controller/bit_controller/n94 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .Q(
        \byte_controller/bit_controller/cnt [8]), .QN(
        \byte_controller/bit_controller/n40 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[3]  ( .D(
        \byte_controller/bit_controller/n156 ), .CK(wb_clk_i), .RN(
        \byte_controller/n50 ), .Q(\byte_controller/bit_controller/n102 ), 
        .QN(\byte_controller/bit_controller/n123 ) );
  DFFR_X1 \byte_controller/bit_controller/al_reg  ( .D(
        \byte_controller/bit_controller/N83 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .Q(i2c_al), .QN(
        \byte_controller/bit_controller/n81 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[2]  ( .D(
        \byte_controller/bit_controller/n157 ), .CK(wb_clk_i), .RN(
        \byte_controller/n50 ), .Q(\byte_controller/bit_controller/n103 ), 
        .QN(\byte_controller/bit_controller/n124 ) );
  DFFR_X1 \byte_controller/bit_controller/cmd_ack_reg  ( .D(
        \byte_controller/bit_controller/N154 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n68 ), .Q(\byte_controller/core_ack )
         );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[7]  ( .D(
        \byte_controller/bit_controller/n153 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .Q(
        \byte_controller/bit_controller/n5 ), .QN(
        \byte_controller/bit_controller/n119 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[12]  ( .D(
        \byte_controller/bit_controller/n148 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n114 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[16]  ( .D(
        \byte_controller/bit_controller/n144 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n69 ), .QN(
        \byte_controller/bit_controller/n110 ) );
  DFFR_X1 \byte_controller/bit_controller/c_state_reg[4]  ( .D(
        \byte_controller/bit_controller/n155 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .QN(
        \byte_controller/bit_controller/n122 ) );
  DFFS_X1 \byte_controller/bit_controller/clk_en_reg  ( .D(
        \byte_controller/bit_controller/n212 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n72 ), .Q(
        \byte_controller/bit_controller/n29 ), .QN(
        \byte_controller/bit_controller/n89 ) );
  DFF_X1 \byte_controller/bit_controller/dscl_oen_reg  ( .D(scl_padoen_o), 
        .CK(wb_clk_i), .Q(\byte_controller/bit_controller/dscl_oen ), .QN(
        \byte_controller/bit_controller/n62 ) );
  DFFS_X1 \byte_controller/bit_controller/scl_oen_reg  ( .D(
        \byte_controller/bit_controller/n58 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n70 ), .Q(scl_padoen_o) );
  DFF_X1 \byte_controller/bit_controller/dout_reg  ( .D(
        \byte_controller/bit_controller/n64 ), .CK(wb_clk_i), .Q(
        \byte_controller/core_rxd ) );
  DFFR_X1 \byte_controller/bit_controller/sta_condition_reg  ( .D(
        \byte_controller/bit_controller/N72 ), .CK(wb_clk_i), .RN(
        \byte_controller/bit_controller/n70 ), .QN(
        \byte_controller/bit_controller/n82 ) );
  DFFS_X1 \byte_controller/bit_controller/sSCL_reg  ( .D(
        \byte_controller/bit_controller/N66 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n70 ), .Q(
        \byte_controller/bit_controller/n6 ), .QN(
        \byte_controller/bit_controller/n108 ) );
  DFFS_X1 \byte_controller/bit_controller/sSDA_reg  ( .D(
        \byte_controller/bit_controller/N67 ), .CK(wb_clk_i), .SN(
        \byte_controller/bit_controller/n70 ), .Q(
        \byte_controller/bit_controller/n65 ), .QN(
        \byte_controller/bit_controller/n107 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U163  ( .A1(
        \byte_controller/bit_controller/sub_105/n146 ), .A2(
        \byte_controller/bit_controller/sub_105/n63 ), .ZN(
        \byte_controller/bit_controller/sub_105/n144 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U162  ( .A1(
        \byte_controller/bit_controller/sub_105/n143 ), .A2(
        \byte_controller/bit_controller/sub_105/n120 ), .ZN(
        \byte_controller/bit_controller/sub_105/n141 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U161  ( .A1(
        \byte_controller/bit_controller/sub_105/n137 ), .A2(
        \byte_controller/bit_controller/sub_105/n138 ), .A3(
        \byte_controller/bit_controller/sub_105/n70 ), .ZN(
        \byte_controller/bit_controller/sub_105/n135 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U160  ( .A1(
        \byte_controller/bit_controller/sub_105/n133 ), .A2(
        \byte_controller/bit_controller/sub_105/n134 ), .A3(
        \byte_controller/bit_controller/sub_105/n120 ), .ZN(
        \byte_controller/bit_controller/sub_105/n129 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U159  ( .A1(
        \byte_controller/bit_controller/sub_105/n131 ), .A2(
        \byte_controller/bit_controller/sub_105/n132 ), .A3(
        \byte_controller/bit_controller/sub_105/n13 ), .ZN(
        \byte_controller/bit_controller/sub_105/n130 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U158  ( .A1(
        \byte_controller/bit_controller/sub_105/n124 ), .A2(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n121 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U157  ( .A1(
        \byte_controller/bit_controller/sub_105/n123 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n122 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U156  ( .A1(
        \byte_controller/bit_controller/sub_105/n119 ), .A2(
        \byte_controller/bit_controller/sub_105/n120 ), .ZN(
        \byte_controller/bit_controller/sub_105/n116 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U155  ( .A1(
        \byte_controller/bit_controller/sub_105/n118 ), .A2(
        \byte_controller/bit_controller/sub_105/n41 ), .ZN(
        \byte_controller/bit_controller/sub_105/n117 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U154  ( .B1(
        \byte_controller/bit_controller/sub_105/n7 ), .B2(
        \byte_controller/bit_controller/sub_105/n113 ), .A(
        \byte_controller/bit_controller/sub_105/n112 ), .ZN(
        \byte_controller/bit_controller/N39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U153  ( .A1(
        \byte_controller/bit_controller/sub_105/n111 ), .A2(
        \byte_controller/bit_controller/sub_105/n24 ), .ZN(
        \byte_controller/bit_controller/sub_105/n108 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U152  ( .A1(
        \byte_controller/bit_controller/sub_105/n110 ), .A2(
        \byte_controller/bit_controller/sub_105/n147 ), .ZN(
        \byte_controller/bit_controller/sub_105/n109 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U151  ( .A1(
        \byte_controller/bit_controller/sub_105/n106 ), .A2(
        \byte_controller/bit_controller/sub_105/n107 ), .ZN(
        \byte_controller/bit_controller/sub_105/n103 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U150  ( .A1(
        \byte_controller/bit_controller/sub_105/n105 ), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n104 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U149  ( .B1(
        \byte_controller/bit_controller/sub_105/n10 ), .B2(
        \byte_controller/bit_controller/sub_105/n100 ), .A(
        \byte_controller/bit_controller/sub_105/n99 ), .ZN(
        \byte_controller/bit_controller/N40 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U148  ( .A1(
        \byte_controller/bit_controller/sub_105/n97 ), .A2(
        \byte_controller/bit_controller/sub_105/n98 ), .ZN(
        \byte_controller/bit_controller/sub_105/n94 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U147  ( .A1(
        \byte_controller/bit_controller/sub_105/n96 ), .A2(
        \byte_controller/bit_controller/sub_105/n147 ), .ZN(
        \byte_controller/bit_controller/sub_105/n95 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U146  ( .A1(
        \byte_controller/bit_controller/sub_105/n92 ), .A2(
        \byte_controller/bit_controller/sub_105/n93 ), .ZN(
        \byte_controller/bit_controller/sub_105/n89 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U145  ( .A1(
        \byte_controller/bit_controller/sub_105/n91 ), .A2(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n90 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U144  ( .B1(
        \byte_controller/bit_controller/sub_105/n8 ), .B2(
        \byte_controller/bit_controller/sub_105/n86 ), .A(
        \byte_controller/bit_controller/sub_105/n85 ), .ZN(
        \byte_controller/bit_controller/N41 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U143  ( .A1(
        \byte_controller/bit_controller/sub_105/n83 ), .A2(
        \byte_controller/bit_controller/sub_105/n84 ), .ZN(
        \byte_controller/bit_controller/sub_105/n80 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U142  ( .A1(
        \byte_controller/bit_controller/sub_105/n82 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n81 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U141  ( .A1(
        \byte_controller/bit_controller/sub_105/n78 ), .A2(
        \byte_controller/bit_controller/sub_105/n79 ), .ZN(
        \byte_controller/bit_controller/sub_105/n74 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U140  ( .A1(
        \byte_controller/bit_controller/sub_105/n76 ), .A2(
        \byte_controller/bit_controller/sub_105/n77 ), .ZN(
        \byte_controller/bit_controller/sub_105/n75 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U139  ( .A1(
        \byte_controller/bit_controller/sub_105/n73 ), .A2(
        \byte_controller/bit_controller/sub_105/n72 ), .ZN(
        \byte_controller/bit_controller/sub_105/n71 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U138  ( .A(
        \byte_controller/bit_controller/sub_105/n71 ), .B(
        \byte_controller/bit_controller/cnt [15]), .ZN(
        \byte_controller/bit_controller/N43 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U137  ( .A1(
        \byte_controller/bit_controller/sub_105/n2 ), .A2(
        \byte_controller/bit_controller/sub_105/n17 ), .ZN(
        \byte_controller/bit_controller/sub_105/n69 ) );
  NAND3_X1 \byte_controller/bit_controller/sub_105/U136  ( .A1(
        \byte_controller/bit_controller/sub_105/n146 ), .A2(
        \byte_controller/bit_controller/sub_105/n63 ), .A3(
        \byte_controller/bit_controller/sub_105/n64 ), .ZN(
        \byte_controller/bit_controller/sub_105/n59 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U135  ( .A(
        \byte_controller/bit_controller/sub_105/n59 ), .ZN(
        \byte_controller/bit_controller/sub_105/n55 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U134  ( .B1(
        \byte_controller/bit_controller/sub_105/n55 ), .B2(
        \byte_controller/bit_controller/sub_105/n131 ), .A(
        \byte_controller/bit_controller/sub_105/n54 ), .ZN(
        \byte_controller/bit_controller/N33 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U133  ( .A1(
        \byte_controller/bit_controller/sub_105/n62 ), .A2(
        \byte_controller/bit_controller/sub_105/n53 ), .ZN(
        \byte_controller/bit_controller/sub_105/n51 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U132  ( .A1(
        \byte_controller/bit_controller/sub_105/n56 ), .A2(
        \byte_controller/bit_controller/N28 ), .ZN(
        \byte_controller/bit_controller/sub_105/n52 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U131  ( .A1(
        \byte_controller/bit_controller/sub_105/n56 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .A3(
        \byte_controller/bit_controller/sub_105/n49 ), .A4(
        \byte_controller/bit_controller/sub_105/n50 ), .ZN(
        \byte_controller/bit_controller/sub_105/n48 ) );
  MUX2_X1 \byte_controller/bit_controller/sub_105/U130  ( .A(
        \byte_controller/bit_controller/sub_105/n47 ), .B(
        \byte_controller/bit_controller/sub_105/n48 ), .S(
        \byte_controller/bit_controller/sub_105/n15 ), .Z(
        \byte_controller/bit_controller/N35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U129  ( .A1(
        \byte_controller/bit_controller/sub_105/n43 ), .A2(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n39 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U128  ( .A1(
        \byte_controller/bit_controller/sub_105/n35 ), .A2(
        \byte_controller/bit_controller/sub_105/n36 ), .ZN(
        \byte_controller/bit_controller/sub_105/n32 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U127  ( .A1(
        \byte_controller/bit_controller/sub_105/n45 ), .A2(
        \byte_controller/bit_controller/sub_105/n34 ), .ZN(
        \byte_controller/bit_controller/sub_105/n33 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U126  ( .A1(
        \byte_controller/bit_controller/sub_105/n30 ), .A2(
        \byte_controller/bit_controller/sub_105/n31 ), .ZN(
        \byte_controller/bit_controller/N36 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U125  ( .A(
        \byte_controller/bit_controller/sub_105/n54 ), .B(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/N34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U124  ( .A1(
        \byte_controller/bit_controller/sub_105/n26 ), .A2(
        \byte_controller/bit_controller/sub_105/n12 ), .ZN(
        \byte_controller/bit_controller/sub_105/n34 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U123  ( .A1(
        \byte_controller/bit_controller/sub_105/n20 ), .A2(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n46 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U122  ( .A1(
        \byte_controller/bit_controller/n51 ), .A2(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n56 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U121  ( .A1(
        \byte_controller/bit_controller/sub_105/n19 ), .A2(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n67 ) );
  NOR3_X1 \byte_controller/bit_controller/sub_105/U120  ( .A1(
        \byte_controller/bit_controller/sub_105/n17 ), .A2(
        \byte_controller/bit_controller/sub_105/n12 ), .A3(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n65 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U119  ( .A(
        \byte_controller/bit_controller/sub_105/n68 ), .B(
        \byte_controller/bit_controller/sub_105/n23 ), .ZN(
        \byte_controller/bit_controller/N30 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U118  ( .A1(
        \byte_controller/bit_controller/n51 ), .A2(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n76 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U117  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n98 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U116  ( .A1(
        \byte_controller/bit_controller/n51 ), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n111 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U115  ( .A1(
        \byte_controller/bit_controller/n46 ), .A2(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n124 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U114  ( .A(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n137 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U113  ( .A(
        \byte_controller/bit_controller/n51 ), .ZN(
        \byte_controller/bit_controller/sub_105/n63 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U112  ( .B1(
        \byte_controller/bit_controller/sub_105/n6 ), .B2(
        \byte_controller/bit_controller/sub_105/n134 ), .A(
        \byte_controller/bit_controller/sub_105/n29 ), .ZN(
        \byte_controller/bit_controller/N37 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U111  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n91 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U110  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n41 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U109  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n105 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U108  ( .A1(
        \byte_controller/bit_controller/cnt [4]), .A2(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n146 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U107  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/sub_105/n25 ), .ZN(
        \byte_controller/bit_controller/sub_105/n57 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U106  ( .A1(
        \byte_controller/bit_controller/cnt [5]), .A2(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n77 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U105  ( .A1(
        \byte_controller/bit_controller/sub_105/n16 ), .A2(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n49 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U104  ( .A1(
        \byte_controller/bit_controller/sub_105/n5 ), .A2(
        \byte_controller/bit_controller/sub_105/n21 ), .ZN(
        \byte_controller/bit_controller/sub_105/n62 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U103  ( .A1(
        \byte_controller/bit_controller/sub_105/n11 ), .A2(
        \byte_controller/bit_controller/sub_105/n16 ), .ZN(
        \byte_controller/bit_controller/sub_105/n35 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U102  ( .A1(
        \byte_controller/bit_controller/sub_105/n61 ), .A2(
        \byte_controller/bit_controller/sub_105/n14 ), .ZN(
        \byte_controller/bit_controller/sub_105/n60 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U101  ( .B1(
        \byte_controller/bit_controller/sub_105/n9 ), .B2(
        \byte_controller/bit_controller/sub_105/n126 ), .A(
        \byte_controller/bit_controller/sub_105/n125 ), .ZN(
        \byte_controller/bit_controller/N38 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U100  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n45 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U99  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n64 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U98  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n66 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U97  ( .A1(
        \byte_controller/bit_controller/sub_105/n45 ), .A2(
        \byte_controller/bit_controller/sub_105/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n37 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U96  ( .A1(
        \byte_controller/bit_controller/sub_105/n67 ), .A2(
        \byte_controller/bit_controller/sub_105/n66 ), .ZN(
        \byte_controller/bit_controller/sub_105/n61 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U95  ( .B1(
        \byte_controller/bit_controller/sub_105/n65 ), .B2(
        \byte_controller/bit_controller/sub_105/n18 ), .A(
        \byte_controller/bit_controller/sub_105/n61 ), .ZN(
        \byte_controller/bit_controller/N31 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U94  ( .A1(
        \byte_controller/bit_controller/sub_105/n68 ), .A2(
        \byte_controller/bit_controller/sub_105/n69 ), .ZN(
        \byte_controller/bit_controller/N29 ) );
  NAND4_X1 \byte_controller/bit_controller/sub_105/U93  ( .A1(
        \byte_controller/bit_controller/sub_105/n56 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .A3(
        \byte_controller/bit_controller/sub_105/n57 ), .A4(
        \byte_controller/bit_controller/sub_105/n58 ), .ZN(
        \byte_controller/bit_controller/sub_105/n54 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U92  ( .A1(
        \byte_controller/bit_controller/sub_105/n24 ), .A2(
        \byte_controller/bit_controller/sub_105/n27 ), .ZN(
        \byte_controller/bit_controller/sub_105/n68 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U91  ( .A1(
        \byte_controller/bit_controller/sub_105/n147 ), .A2(
        \byte_controller/bit_controller/sub_105/n126 ), .ZN(
        \byte_controller/bit_controller/sub_105/n136 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U90  ( .A1(
        \byte_controller/bit_controller/N28 ), .A2(
        \byte_controller/bit_controller/sub_105/n70 ), .ZN(
        \byte_controller/bit_controller/sub_105/n145 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U89  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n143 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U88  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n119 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U87  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n107 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U86  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n93 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U85  ( .A1(
        \byte_controller/bit_controller/cnt [9]), .A2(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n79 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U84  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n50 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U83  ( .A1(
        \byte_controller/bit_controller/sub_105/n15 ), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n36 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U82  ( .A1(
        \byte_controller/bit_controller/sub_105/n51 ), .A2(
        \byte_controller/bit_controller/sub_105/n52 ), .ZN(
        \byte_controller/bit_controller/sub_105/n47 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U81  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n53 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U80  ( .A(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n133 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U79  ( .A(
        \byte_controller/bit_controller/cnt [9]), .ZN(
        \byte_controller/bit_controller/sub_105/n134 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U78  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n82 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U77  ( .A(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n126 ) );
  OAI21_X1 \byte_controller/bit_controller/sub_105/U76  ( .B1(
        \byte_controller/bit_controller/sub_105/n32 ), .B2(
        \byte_controller/bit_controller/sub_105/n33 ), .A(
        \byte_controller/bit_controller/cnt [8]), .ZN(
        \byte_controller/bit_controller/sub_105/n31 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U75  ( .A1(
        \byte_controller/bit_controller/n49 ), .A2(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/sub_105/n84 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U74  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n120 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U73  ( .A1(
        \byte_controller/bit_controller/sub_105/n74 ), .A2(
        \byte_controller/bit_controller/sub_105/n75 ), .ZN(
        \byte_controller/bit_controller/sub_105/n73 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U72  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n78 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U71  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n83 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U70  ( .A1(
        \byte_controller/bit_controller/sub_105/n81 ), .A2(
        \byte_controller/bit_controller/sub_105/n80 ), .ZN(
        \byte_controller/bit_controller/sub_105/n72 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U69  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n118 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U68  ( .A1(
        \byte_controller/bit_controller/cnt [8]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n43 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U67  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n132 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U66  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n131 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U65  ( .A1(
        \byte_controller/bit_controller/cnt [7]), .A2(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n106 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U64  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n110 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U63  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n123 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U62  ( .A1(
        \byte_controller/bit_controller/sub_105/n39 ), .A2(
        \byte_controller/bit_controller/sub_105/n40 ), .ZN(
        \byte_controller/bit_controller/sub_105/n38 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U61  ( .A1(
        \byte_controller/bit_controller/sub_105/n37 ), .A2(
        \byte_controller/bit_controller/sub_105/n38 ), .ZN(
        \byte_controller/bit_controller/sub_105/n30 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U60  ( .A(
        \byte_controller/bit_controller/cnt [5]), .ZN(
        \byte_controller/bit_controller/sub_105/n42 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U59  ( .A1(
        \byte_controller/bit_controller/cnt [13]), .A2(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n97 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U58  ( .A(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n58 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U57  ( .A(
        \byte_controller/bit_controller/cnt [6]), .ZN(
        \byte_controller/bit_controller/sub_105/n44 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U56  ( .A1(
        \byte_controller/bit_controller/cnt [6]), .A2(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n92 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U55  ( .A(
        \byte_controller/bit_controller/n46 ), .ZN(
        \byte_controller/bit_controller/sub_105/n138 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U54  ( .A(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n70 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U53  ( .A1(
        \byte_controller/bit_controller/cnt [11]), .A2(
        \byte_controller/bit_controller/cnt [10]), .ZN(
        \byte_controller/bit_controller/sub_105/n96 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U52  ( .A1(
        \byte_controller/bit_controller/sub_105/n60 ), .A2(
        \byte_controller/bit_controller/sub_105/n59 ), .ZN(
        \byte_controller/bit_controller/N32 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U51  ( .A(
        \byte_controller/bit_controller/cnt [12]), .ZN(
        \byte_controller/bit_controller/sub_105/n100 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U50  ( .A(
        \byte_controller/bit_controller/cnt [11]), .ZN(
        \byte_controller/bit_controller/sub_105/n113 ) );
  XNOR2_X1 \byte_controller/bit_controller/sub_105/U49  ( .A(
        \byte_controller/bit_controller/sub_105/n85 ), .B(
        \byte_controller/bit_controller/cnt [14]), .ZN(
        \byte_controller/bit_controller/N42 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U48  ( .A(
        \byte_controller/bit_controller/cnt [13]), .ZN(
        \byte_controller/bit_controller/sub_105/n86 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U47  ( .A1(
        \byte_controller/bit_controller/sub_105/n41 ), .A2(
        \byte_controller/bit_controller/sub_105/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n40 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U46  ( .A1(
        \byte_controller/bit_controller/sub_105/n108 ), .A2(
        \byte_controller/bit_controller/sub_105/n109 ), .ZN(
        \byte_controller/bit_controller/sub_105/n101 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U45  ( .A1(
        \byte_controller/bit_controller/sub_105/n103 ), .A2(
        \byte_controller/bit_controller/sub_105/n104 ), .ZN(
        \byte_controller/bit_controller/sub_105/n102 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U44  ( .A1(
        \byte_controller/bit_controller/sub_105/n101 ), .A2(
        \byte_controller/bit_controller/sub_105/n102 ), .ZN(
        \byte_controller/bit_controller/sub_105/n99 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U43  ( .A1(
        \byte_controller/bit_controller/sub_105/n121 ), .A2(
        \byte_controller/bit_controller/sub_105/n122 ), .ZN(
        \byte_controller/bit_controller/sub_105/n114 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U42  ( .A1(
        \byte_controller/bit_controller/sub_105/n116 ), .A2(
        \byte_controller/bit_controller/sub_105/n117 ), .ZN(
        \byte_controller/bit_controller/sub_105/n115 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U41  ( .A1(
        \byte_controller/bit_controller/sub_105/n114 ), .A2(
        \byte_controller/bit_controller/sub_105/n115 ), .ZN(
        \byte_controller/bit_controller/sub_105/n112 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U40  ( .A1(
        \byte_controller/bit_controller/sub_105/n42 ), .A2(
        \byte_controller/bit_controller/sub_105/n44 ), .ZN(
        \byte_controller/bit_controller/sub_105/n142 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U39  ( .A1(
        \byte_controller/bit_controller/sub_105/n144 ), .A2(
        \byte_controller/bit_controller/sub_105/n145 ), .ZN(
        \byte_controller/bit_controller/sub_105/n139 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U38  ( .A1(
        \byte_controller/bit_controller/sub_105/n141 ), .A2(
        \byte_controller/bit_controller/sub_105/n142 ), .ZN(
        \byte_controller/bit_controller/sub_105/n140 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U37  ( .A1(
        \byte_controller/bit_controller/sub_105/n4 ), .A2(
        \byte_controller/bit_controller/sub_105/n140 ), .ZN(
        \byte_controller/bit_controller/sub_105/n29 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U36  ( .A1(
        \byte_controller/bit_controller/sub_105/n135 ), .A2(
        \byte_controller/bit_controller/sub_105/n136 ), .ZN(
        \byte_controller/bit_controller/sub_105/n127 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U35  ( .A1(
        \byte_controller/bit_controller/sub_105/n129 ), .A2(
        \byte_controller/bit_controller/sub_105/n130 ), .ZN(
        \byte_controller/bit_controller/sub_105/n128 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U34  ( .A1(
        \byte_controller/bit_controller/sub_105/n3 ), .A2(
        \byte_controller/bit_controller/sub_105/n127 ), .ZN(
        \byte_controller/bit_controller/sub_105/n125 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U33  ( .A1(
        \byte_controller/bit_controller/sub_105/n94 ), .A2(
        \byte_controller/bit_controller/sub_105/n95 ), .ZN(
        \byte_controller/bit_controller/sub_105/n87 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U32  ( .A1(
        \byte_controller/bit_controller/sub_105/n89 ), .A2(
        \byte_controller/bit_controller/sub_105/n90 ), .ZN(
        \byte_controller/bit_controller/sub_105/n88 ) );
  NAND2_X1 \byte_controller/bit_controller/sub_105/U31  ( .A1(
        \byte_controller/bit_controller/sub_105/n88 ), .A2(
        \byte_controller/bit_controller/sub_105/n87 ), .ZN(
        \byte_controller/bit_controller/sub_105/n85 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U30  ( .A(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n147 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U29  ( .A(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/N28 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U28  ( .A(
        \byte_controller/bit_controller/n42 ), .ZN(
        \byte_controller/bit_controller/sub_105/n27 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U27  ( .A(
        \byte_controller/bit_controller/sub_105/n138 ), .ZN(
        \byte_controller/bit_controller/sub_105/n26 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U26  ( .A(
        \byte_controller/bit_controller/n49 ), .ZN(
        \byte_controller/bit_controller/sub_105/n24 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U25  ( .A(
        \byte_controller/bit_controller/sub_105/n137 ), .ZN(
        \byte_controller/bit_controller/sub_105/n23 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U24  ( .A(
        \byte_controller/bit_controller/n46 ), .Z(
        \byte_controller/bit_controller/sub_105/n22 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U23  ( .A(
        \byte_controller/bit_controller/n46 ), .Z(
        \byte_controller/bit_controller/sub_105/n20 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U22  ( .A(
        \byte_controller/bit_controller/sub_105/n22 ), .ZN(
        \byte_controller/bit_controller/sub_105/n18 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U21  ( .A(
        \byte_controller/bit_controller/n42 ), .Z(
        \byte_controller/bit_controller/sub_105/n17 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U20  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n25 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U19  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n16 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U18  ( .A(
        \byte_controller/bit_controller/sub_105/n1 ), .ZN(
        \byte_controller/bit_controller/sub_105/n15 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U17  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n14 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U16  ( .A(
        \byte_controller/bit_controller/n46 ), .Z(
        \byte_controller/bit_controller/sub_105/n19 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U15  ( .A(
        \byte_controller/bit_controller/cnt [4]), .ZN(
        \byte_controller/bit_controller/sub_105/n13 ) );
  BUF_X1 \byte_controller/bit_controller/sub_105/U14  ( .A(
        \byte_controller/bit_controller/cnt [5]), .Z(
        \byte_controller/bit_controller/sub_105/n11 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U13  ( .A1(
        \byte_controller/bit_controller/sub_105/n114 ), .A2(
        \byte_controller/bit_controller/sub_105/n115 ), .ZN(
        \byte_controller/bit_controller/sub_105/n10 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U12  ( .A1(
        \byte_controller/bit_controller/sub_105/n139 ), .A2(
        \byte_controller/bit_controller/sub_105/n140 ), .ZN(
        \byte_controller/bit_controller/sub_105/n9 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U11  ( .A1(
        \byte_controller/bit_controller/sub_105/n102 ), .A2(
        \byte_controller/bit_controller/sub_105/n101 ), .ZN(
        \byte_controller/bit_controller/sub_105/n8 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U10  ( .A(
        \byte_controller/bit_controller/n51 ), .Z(
        \byte_controller/bit_controller/sub_105/n12 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U9  ( .A1(
        \byte_controller/bit_controller/sub_105/n128 ), .A2(
        \byte_controller/bit_controller/sub_105/n127 ), .ZN(
        \byte_controller/bit_controller/sub_105/n7 ) );
  AND2_X1 \byte_controller/bit_controller/sub_105/U8  ( .A1(
        \byte_controller/bit_controller/sub_105/n37 ), .A2(
        \byte_controller/bit_controller/sub_105/n38 ), .ZN(
        \byte_controller/bit_controller/sub_105/n6 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U7  ( .A(
        \byte_controller/bit_controller/cnt [4]), .Z(
        \byte_controller/bit_controller/sub_105/n5 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U6  ( .A1(
        \byte_controller/bit_controller/sub_105/n144 ), .A2(
        \byte_controller/bit_controller/sub_105/n145 ), .ZN(
        \byte_controller/bit_controller/sub_105/n4 ) );
  NOR2_X1 \byte_controller/bit_controller/sub_105/U5  ( .A1(
        \byte_controller/bit_controller/sub_105/n129 ), .A2(
        \byte_controller/bit_controller/sub_105/n130 ), .ZN(
        \byte_controller/bit_controller/sub_105/n3 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U4  ( .A(
        \byte_controller/bit_controller/n49 ), .Z(
        \byte_controller/bit_controller/sub_105/n2 ) );
  CLKBUF_X1 \byte_controller/bit_controller/sub_105/U3  ( .A(
        \byte_controller/bit_controller/n46 ), .Z(
        \byte_controller/bit_controller/sub_105/n21 ) );
  INV_X1 \byte_controller/bit_controller/sub_105/U2  ( .A(
        \byte_controller/bit_controller/cnt [7]), .ZN(
        \byte_controller/bit_controller/sub_105/n1 ) );
endmodule

