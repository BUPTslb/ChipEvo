/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 09:45:26 2026
/////////////////////////////////////////////////////////////


module spi ( clk, rst, addr, we, write_data, re, read_data );
  input [2:0] addr;
  input [31:0] write_data;
  output [31:0] read_data;
  input clk, rst, we, re;
  wire   enable, cs, sck, mosi, miso, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269,
         \uut_master/n344 , \uut_master/n343 , \uut_master/n342 ,
         \uut_master/n341 , \uut_master/n340 , \uut_master/n339 ,
         \uut_master/n338 , \uut_master/n337 , \uut_master/n336 ,
         \uut_master/n335 , \uut_master/n334 , \uut_master/n333 ,
         \uut_master/n332 , \uut_master/n331 , \uut_master/n330 ,
         \uut_master/n329 , \uut_master/n328 , \uut_master/n327 ,
         \uut_master/n326 , \uut_master/n325 , \uut_master/n324 ,
         \uut_master/n323 , \uut_master/n322 , \uut_master/n321 ,
         \uut_master/n320 , \uut_master/n319 , \uut_master/n318 ,
         \uut_master/n317 , \uut_master/n316 , \uut_master/n315 ,
         \uut_master/n314 , \uut_master/n313 , \uut_master/n312 ,
         \uut_master/n311 , \uut_master/n310 , \uut_master/n309 ,
         \uut_master/n308 , \uut_master/n307 , \uut_master/n306 ,
         \uut_master/n305 , \uut_master/n304 , \uut_master/n303 ,
         \uut_master/n302 , \uut_master/n301 , \uut_master/n300 ,
         \uut_master/n299 , \uut_master/n298 , \uut_master/n297 ,
         \uut_master/n296 , \uut_master/n295 , \uut_master/n294 ,
         \uut_master/n293 , \uut_master/n292 , \uut_master/n291 ,
         \uut_master/n290 , \uut_master/n289 , \uut_master/n288 ,
         \uut_master/n287 , \uut_master/n286 , \uut_master/n285 ,
         \uut_master/n284 , \uut_master/n283 , \uut_master/n282 ,
         \uut_master/n281 , \uut_master/n280 , \uut_master/n279 ,
         \uut_master/n278 , \uut_master/n277 , \uut_master/n276 ,
         \uut_master/n275 , \uut_master/n274 , \uut_master/n273 ,
         \uut_master/n272 , \uut_master/n271 , \uut_master/n270 ,
         \uut_master/n269 , \uut_master/n268 , \uut_master/n267 ,
         \uut_master/n266 , \uut_master/n265 , \uut_master/n264 ,
         \uut_master/n263 , \uut_master/n262 , \uut_master/n261 ,
         \uut_master/n260 , \uut_master/n259 , \uut_master/n258 ,
         \uut_master/n257 , \uut_master/n256 , \uut_master/n255 ,
         \uut_master/n254 , \uut_master/n253 , \uut_master/n252 ,
         \uut_master/n251 , \uut_master/n250 , \uut_master/n249 ,
         \uut_master/n248 , \uut_master/n247 , \uut_master/n246 ,
         \uut_master/n245 , \uut_master/n244 , \uut_master/n243 ,
         \uut_master/n242 , \uut_master/n241 , \uut_master/n240 ,
         \uut_master/n239 , \uut_master/n238 , \uut_master/n237 ,
         \uut_master/n236 , \uut_master/n235 , \uut_master/n234 ,
         \uut_master/n233 , \uut_master/n232 , \uut_master/n231 ,
         \uut_master/n230 , \uut_master/n229 , \uut_master/n228 ,
         \uut_master/n227 , \uut_master/n226 , \uut_master/n225 ,
         \uut_master/n224 , \uut_master/n223 , \uut_master/n222 ,
         \uut_master/n221 , \uut_master/n220 , \uut_master/n219 ,
         \uut_master/n218 , \uut_master/n217 , \uut_master/n216 ,
         \uut_master/n215 , \uut_master/n214 , \uut_master/n213 ,
         \uut_master/n212 , \uut_master/n211 , \uut_master/n210 ,
         \uut_master/n209 , \uut_master/n208 , \uut_master/n207 ,
         \uut_master/n206 , \uut_master/n205 , \uut_master/n204 ,
         \uut_master/n203 , \uut_master/n202 , \uut_master/n201 ,
         \uut_master/n200 , \uut_master/n199 , \uut_master/n198 ,
         \uut_master/n197 , \uut_master/n196 , \uut_master/n195 ,
         \uut_master/n194 , \uut_master/n193 , \uut_master/n192 ,
         \uut_master/n191 , \uut_master/n190 , \uut_master/n189 ,
         \uut_master/n188 , \uut_master/n187 , \uut_master/n186 ,
         \uut_master/n185 , \uut_master/n184 , \uut_master/n183 ,
         \uut_master/n182 , \uut_master/n181 , \uut_master/n180 ,
         \uut_master/n179 , \uut_master/n178 , \uut_master/n177 ,
         \uut_master/n176 , \uut_master/n175 , \uut_master/n174 ,
         \uut_master/n173 , \uut_master/n172 , \uut_master/n171 ,
         \uut_master/n170 , \uut_master/n169 , \uut_master/n168 ,
         \uut_master/n167 , \uut_master/n166 , \uut_master/n165 ,
         \uut_master/n164 , \uut_master/n163 , \uut_master/n162 ,
         \uut_master/n161 , \uut_master/n160 , \uut_master/n159 ,
         \uut_master/n158 , \uut_master/n157 , \uut_master/n156 ,
         \uut_master/n155 , \uut_master/n154 , \uut_master/n153 ,
         \uut_master/n152 , \uut_master/n151 , \uut_master/n150 ,
         \uut_master/n149 , \uut_master/n148 , \uut_master/n147 ,
         \uut_master/n146 , \uut_master/n145 , \uut_master/n144 ,
         \uut_master/n143 , \uut_master/n142 , \uut_master/n141 ,
         \uut_master/n140 , \uut_master/n139 , \uut_master/n138 ,
         \uut_master/n137 , \uut_master/n136 , \uut_master/n135 ,
         \uut_master/n134 , \uut_master/n133 , \uut_master/n132 ,
         \uut_master/n131 , \uut_master/n130 , \uut_master/n129 ,
         \uut_master/n128 , \uut_master/n127 , \uut_master/n126 ,
         \uut_master/n125 , \uut_master/n124 , \uut_master/n123 ,
         \uut_master/n122 , \uut_master/n121 , \uut_master/n120 ,
         \uut_master/n119 , \uut_master/n118 , \uut_master/n117 ,
         \uut_master/n116 , \uut_master/n115 , \uut_master/n114 ,
         \uut_master/n113 , \uut_master/n112 , \uut_master/n110 ,
         \uut_master/n109 , \uut_master/n52 , \uut_master/n47 ,
         \uut_master/n46 , \uut_master/n45 , \uut_master/n44 ,
         \uut_master/n43 , \uut_master/n34 , \uut_master/n32 ,
         \uut_master/n31 , \uut_master/n30 , \uut_master/n28 ,
         \uut_master/n27 , \uut_master/n26 , \uut_master/n25 ,
         \uut_master/n24 , \uut_master/n23 , \uut_master/n22 ,
         \uut_master/n21 , \uut_master/n20 , \uut_master/n19 ,
         \uut_master/n18 , \uut_master/n17 , \uut_master/n16 ,
         \uut_master/n15 , \uut_master/n14 , \uut_master/n13 ,
         \uut_master/n12 , \uut_master/n11 , \uut_master/n10 , \uut_master/n9 ,
         \uut_master/n8 , \uut_master/n7 , \uut_master/n6 , \uut_master/n5 ,
         \uut_master/n4 , \uut_master/n3 , \uut_master/n2 , \uut_master/n1 ,
         \uut_master/n111 , \uut_master/n108 , \uut_master/n107 ,
         \uut_master/n106 , \uut_master/n105 , \uut_master/n104 ,
         \uut_master/n103 , \uut_master/n102 , \uut_master/n101 ,
         \uut_master/n100 , \uut_master/n99 , \uut_master/n98 ,
         \uut_master/n97 , \uut_master/n96 , \uut_master/n95 ,
         \uut_master/n94 , \uut_master/n93 , \uut_master/n92 ,
         \uut_master/n91 , \uut_master/n90 , \uut_master/n89 ,
         \uut_master/n88 , \uut_master/n87 , \uut_master/n86 ,
         \uut_master/n85 , \uut_master/n84 , \uut_master/n83 ,
         \uut_master/n82 , \uut_master/n81 , \uut_master/n80 ,
         \uut_master/n79 , \uut_master/n78 , \uut_master/n77 ,
         \uut_master/n76 , \uut_master/n75 , \uut_master/n74 ,
         \uut_master/n73 , \uut_master/n72 , \uut_master/n71 ,
         \uut_master/n70 , \uut_master/n69 , \uut_master/n68 ,
         \uut_master/n67 , \uut_master/n66 , \uut_master/n65 ,
         \uut_master/n64 , \uut_master/n63 , \uut_master/n62 ,
         \uut_master/n61 , \uut_master/n60 , \uut_master/n59 ,
         \uut_master/n58 , \uut_master/n57 , \uut_master/n56 ,
         \uut_master/n55 , \uut_master/n54 , \uut_master/n53 ,
         \uut_master/n51 , \uut_master/n50 , \uut_master/n49 ,
         \uut_master/n48 , \uut_master/n42 , \uut_master/n41 ,
         \uut_master/n40 , \uut_master/n39 , \uut_master/n38 ,
         \uut_master/n37 , \uut_master/n36 , \uut_master/n35 ,
         \uut_master/n33 , \uut_master/N150 , \uut_master/N100 ,
         \uut_master/N99 , \uut_master/N98 , \uut_master/N97 ,
         \uut_master/N96 , \uut_master/N95 , \uut_master/N94 ,
         \uut_master/N85 , \uut_master/N84 , \uut_master/N83 ,
         \uut_master/N82 , \uut_master/N81 , \uut_master/N80 ,
         \uut_master/N79 , \uut_master/N78 , \uut_master/N77 ,
         \uut_master/N76 , \uut_master/N75 , \uut_master/N74 ,
         \uut_master/N73 , \uut_master/N72 , \uut_master/N71 ,
         \uut_master/N70 , \uut_master/N69 , \uut_master/N68 ,
         \uut_master/N67 , \uut_master/N66 , \uut_master/N65 ,
         \uut_master/N64 , \uut_master/N63 , \uut_master/N62 ,
         \uut_master/N61 , \uut_master/N60 , \uut_master/N59 ,
         \uut_master/N58 , \uut_master/N57 , \uut_master/N56 ,
         \uut_master/N55 , \uut_master/N54 , \uut_master/N53 ,
         \uut_master/N52 , \uut_master/N51 , \uut_master/N50 ,
         \uut_master/N49 , \uut_master/N48 , \uut_master/N47 ,
         \uut_master/N46 , \uut_master/N45 , \uut_master/N44 ,
         \uut_master/N43 , \uut_master/N42 , \uut_master/N41 ,
         \uut_master/N40 , \uut_master/N39 , \uut_master/N38 ,
         \uut_master/N37 , \uut_master/N36 , \uut_master/N35 ,
         \uut_master/N34 , \uut_master/N33 , \uut_master/N32 ,
         \uut_master/N31 , \uut_master/data_end , \uut_master/N20 ,
         \uut_master/clock_count , \uut_slave/n252 , \uut_slave/n251 ,
         \uut_slave/n250 , \uut_slave/n249 , \uut_slave/n248 ,
         \uut_slave/n247 , \uut_slave/n246 , \uut_slave/n245 ,
         \uut_slave/n244 , \uut_slave/n243 , \uut_slave/n242 ,
         \uut_slave/n241 , \uut_slave/n240 , \uut_slave/n239 ,
         \uut_slave/n238 , \uut_slave/n237 , \uut_slave/n236 ,
         \uut_slave/n235 , \uut_slave/n234 , \uut_slave/n233 ,
         \uut_slave/n232 , \uut_slave/n231 , \uut_slave/n230 ,
         \uut_slave/n229 , \uut_slave/n228 , \uut_slave/n227 ,
         \uut_slave/n226 , \uut_slave/n225 , \uut_slave/n224 ,
         \uut_slave/n223 , \uut_slave/n222 , \uut_slave/n221 ,
         \uut_slave/n220 , \uut_slave/n219 , \uut_slave/n218 ,
         \uut_slave/n217 , \uut_slave/n216 , \uut_slave/n215 ,
         \uut_slave/n214 , \uut_slave/n213 , \uut_slave/n212 ,
         \uut_slave/n211 , \uut_slave/n210 , \uut_slave/n209 ,
         \uut_slave/n208 , \uut_slave/n207 , \uut_slave/n206 ,
         \uut_slave/n205 , \uut_slave/n204 , \uut_slave/n203 ,
         \uut_slave/n202 , \uut_slave/n201 , \uut_slave/n200 ,
         \uut_slave/n199 , \uut_slave/n120 , \uut_slave/n119 ,
         \uut_slave/n118 , \uut_slave/n117 , \uut_slave/n116 ,
         \uut_slave/n115 , \uut_slave/n114 , \uut_slave/n113 ,
         \uut_slave/n112 , \uut_slave/n111 , \uut_slave/n110 ,
         \uut_slave/n109 , \uut_slave/n108 , \uut_slave/n107 ,
         \uut_slave/n106 , \uut_slave/n105 , \uut_slave/n104 ,
         \uut_slave/n103 , \uut_slave/n102 , \uut_slave/n101 ,
         \uut_slave/n100 , \uut_slave/n99 , \uut_slave/n98 , \uut_slave/n97 ,
         \uut_slave/n96 , \uut_slave/n95 , \uut_slave/n94 , \uut_slave/n93 ,
         \uut_slave/n92 , \uut_slave/n91 , \uut_slave/n90 , \uut_slave/n89 ,
         \uut_slave/n88 , \uut_slave/n87 , \uut_slave/n14 , \uut_slave/n10 ,
         \uut_slave/n9 , \uut_slave/n8 , \uut_slave/n7 , \uut_slave/n6 ,
         \uut_slave/n5 , \uut_slave/n4 , \uut_slave/n2 , \uut_slave/n1 ,
         \uut_slave/n198 , \uut_slave/n197 , \uut_slave/n196 ,
         \uut_slave/n195 , \uut_slave/n194 , \uut_slave/n193 ,
         \uut_slave/n192 , \uut_slave/n191 , \uut_slave/n190 ,
         \uut_slave/n189 , \uut_slave/n188 , \uut_slave/n187 ,
         \uut_slave/n186 , \uut_slave/n185 , \uut_slave/n184 ,
         \uut_slave/n183 , \uut_slave/n182 , \uut_slave/n181 ,
         \uut_slave/n180 , \uut_slave/n179 , \uut_slave/n178 ,
         \uut_slave/n177 , \uut_slave/n176 , \uut_slave/n175 ,
         \uut_slave/n174 , \uut_slave/n173 , \uut_slave/n172 ,
         \uut_slave/n171 , \uut_slave/n170 , \uut_slave/n169 ,
         \uut_slave/n168 , \uut_slave/n167 , \uut_slave/n166 ,
         \uut_slave/n165 , \uut_slave/n164 , \uut_slave/n163 ,
         \uut_slave/n162 , \uut_slave/n161 , \uut_slave/n160 ,
         \uut_slave/n159 , \uut_slave/n158 , \uut_slave/n157 ,
         \uut_slave/n156 , \uut_slave/n155 , \uut_slave/n154 ,
         \uut_slave/n153 , \uut_slave/n152 , \uut_slave/n151 ,
         \uut_slave/n150 , \uut_slave/n149 , \uut_slave/n148 ,
         \uut_slave/n147 , \uut_slave/n146 , \uut_slave/n145 ,
         \uut_slave/n144 , \uut_slave/n143 , \uut_slave/n142 ,
         \uut_slave/n141 , \uut_slave/n140 , \uut_slave/n139 ,
         \uut_slave/n138 , \uut_slave/n137 , \uut_slave/n136 ,
         \uut_slave/n135 , \uut_slave/n134 , \uut_slave/n133 ,
         \uut_slave/n132 , \uut_slave/n131 , \uut_slave/n130 ,
         \uut_slave/n129 , \uut_slave/n128 , \uut_slave/n127 ,
         \uut_slave/n126 , \uut_slave/n125 , \uut_slave/n124 ,
         \uut_slave/n123 , \uut_slave/n122 , \uut_slave/n121 , \uut_slave/n86 ,
         \uut_slave/n85 , \uut_slave/n84 , \uut_slave/n83 , \uut_slave/n82 ,
         \uut_slave/n81 , \uut_slave/n80 , \uut_slave/n79 , \uut_slave/n78 ,
         \uut_slave/n77 , \uut_slave/n76 , \uut_slave/n75 , \uut_slave/n74 ,
         \uut_slave/n73 , \uut_slave/n72 , \uut_slave/n71 , \uut_slave/n70 ,
         \uut_slave/n69 , \uut_slave/n68 , \uut_slave/n67 , \uut_slave/n66 ,
         \uut_slave/n65 , \uut_slave/n64 , \uut_slave/n63 , \uut_slave/n62 ,
         \uut_slave/n61 , \uut_slave/n60 , \uut_slave/n59 , \uut_slave/n58 ,
         \uut_slave/n57 , \uut_slave/n56 , \uut_slave/n55 , \uut_slave/n54 ,
         \uut_slave/n53 , \uut_slave/n52 , \uut_slave/n51 , \uut_slave/n50 ,
         \uut_slave/n49 , \uut_slave/n48 , \uut_slave/n47 , \uut_slave/n46 ,
         \uut_slave/n45 , \uut_slave/n44 , \uut_slave/n43 , \uut_slave/n42 ,
         \uut_slave/n41 , \uut_slave/n40 , \uut_slave/n39 , \uut_slave/n38 ,
         \uut_slave/n37 , \uut_slave/n36 , \uut_slave/n35 , \uut_slave/n34 ,
         \uut_slave/n33 , \uut_slave/n32 , \uut_slave/n31 , \uut_slave/n30 ,
         \uut_slave/n29 , \uut_slave/n28 , \uut_slave/n27 , \uut_slave/n26 ,
         \uut_slave/n25 , \uut_slave/n24 , \uut_slave/n23 , \uut_slave/n22 ,
         \uut_slave/n21 , \uut_slave/n20 , \uut_slave/n19 , \uut_slave/n18 ,
         \uut_slave/n17 , \uut_slave/n16 , \uut_slave/n15 , \uut_slave/n13 ,
         \uut_slave/n12 , \uut_slave/n11 , \uut_slave/n3 , \uut_slave/N96 ,
         \uut_slave/N95 , \uut_slave/data_out[31] , \uut_slave/data_end ,
         \uut_slave/data_end_next , \uut_slave/current_state[1] ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [63:1] \uut_master/data_save_shifted ;
  wire   [5:0] \uut_master/data_count ;
  wire   [1:0] \uut_master/current_state ;
  wire   [7:0] \uut_slave/command_save ;
  wire   [5:0] \uut_slave/data_count ;

  DLL_X1 \read_data_reg[31]  ( .D(n233), .GN(rst), .Q(read_data[31]) );
  DLL_X1 \read_data_reg[30]  ( .D(n232), .GN(rst), .Q(read_data[30]) );
  DLL_X1 \read_data_reg[29]  ( .D(n231), .GN(rst), .Q(read_data[29]) );
  DLL_X1 \read_data_reg[28]  ( .D(n230), .GN(rst), .Q(read_data[28]) );
  DLL_X1 \read_data_reg[27]  ( .D(n229), .GN(rst), .Q(read_data[27]) );
  DLL_X1 \read_data_reg[26]  ( .D(n228), .GN(rst), .Q(read_data[26]) );
  DLL_X1 \read_data_reg[25]  ( .D(n227), .GN(rst), .Q(read_data[25]) );
  DLL_X1 \read_data_reg[24]  ( .D(n226), .GN(rst), .Q(read_data[24]) );
  DLL_X1 \read_data_reg[23]  ( .D(n225), .GN(rst), .Q(read_data[23]) );
  DLL_X1 \read_data_reg[22]  ( .D(n224), .GN(rst), .Q(read_data[22]) );
  DLL_X1 \read_data_reg[21]  ( .D(n223), .GN(rst), .Q(read_data[21]) );
  DLL_X1 \read_data_reg[20]  ( .D(n222), .GN(rst), .Q(read_data[20]) );
  DLL_X1 \read_data_reg[19]  ( .D(n221), .GN(rst), .Q(read_data[19]) );
  DLL_X1 \read_data_reg[18]  ( .D(n220), .GN(rst), .Q(read_data[18]) );
  DLL_X1 \read_data_reg[17]  ( .D(n219), .GN(rst), .Q(read_data[17]) );
  DLL_X1 \read_data_reg[16]  ( .D(n218), .GN(rst), .Q(read_data[16]) );
  DLL_X1 \read_data_reg[15]  ( .D(n217), .GN(rst), .Q(read_data[15]) );
  DLL_X1 \read_data_reg[14]  ( .D(n216), .GN(rst), .Q(read_data[14]) );
  DLL_X1 \read_data_reg[13]  ( .D(n215), .GN(rst), .Q(read_data[13]) );
  DLL_X1 \read_data_reg[12]  ( .D(n214), .GN(rst), .Q(read_data[12]) );
  DLL_X1 \read_data_reg[11]  ( .D(n213), .GN(rst), .Q(read_data[11]) );
  DLL_X1 \read_data_reg[10]  ( .D(n212), .GN(rst), .Q(read_data[10]) );
  DLL_X1 \read_data_reg[9]  ( .D(n211), .GN(rst), .Q(read_data[9]) );
  DLL_X1 \read_data_reg[8]  ( .D(n210), .GN(rst), .Q(read_data[8]) );
  DLL_X1 \read_data_reg[7]  ( .D(n209), .GN(rst), .Q(read_data[7]) );
  DLL_X1 \read_data_reg[6]  ( .D(n208), .GN(rst), .Q(read_data[6]) );
  DLL_X1 \read_data_reg[5]  ( .D(n207), .GN(rst), .Q(read_data[5]) );
  DLL_X1 \read_data_reg[4]  ( .D(n206), .GN(rst), .Q(read_data[4]) );
  DLL_X1 \read_data_reg[3]  ( .D(n205), .GN(rst), .Q(read_data[3]) );
  DLL_X1 \read_data_reg[2]  ( .D(n204), .GN(rst), .Q(read_data[2]) );
  DLL_X1 \read_data_reg[1]  ( .D(n203), .GN(rst), .Q(read_data[1]) );
  DLL_X1 \read_data_reg[0]  ( .D(n202), .GN(rst), .Q(read_data[0]) );
  AOI22_X2 U3 ( .A1(write_data[0]), .A2(n234), .B1(enable), .B2(n72), .ZN(n71)
         );
  OAI22_X2 U4 ( .A1(n269), .A2(n198), .B1(n196), .B2(n76), .ZN(data_in[0]) );
  INV_X2 U5 ( .A(data_in[0]), .ZN(n76) );
  OAI22_X2 U6 ( .A1(n198), .A2(n268), .B1(n196), .B2(n77), .ZN(data_in[1]) );
  INV_X2 U7 ( .A(data_in[1]), .ZN(n77) );
  OAI22_X2 U8 ( .A1(n198), .A2(n267), .B1(n196), .B2(n78), .ZN(data_in[2]) );
  INV_X2 U9 ( .A(data_in[2]), .ZN(n78) );
  OAI22_X2 U10 ( .A1(n198), .A2(n266), .B1(n196), .B2(n79), .ZN(data_in[3]) );
  INV_X2 U11 ( .A(data_in[3]), .ZN(n79) );
  OAI22_X2 U12 ( .A1(n198), .A2(n265), .B1(n196), .B2(n80), .ZN(data_in[4]) );
  INV_X2 U13 ( .A(data_in[4]), .ZN(n80) );
  OAI22_X2 U14 ( .A1(n198), .A2(n264), .B1(n196), .B2(n81), .ZN(data_in[5]) );
  INV_X2 U15 ( .A(data_in[5]), .ZN(n81) );
  OAI22_X2 U16 ( .A1(n198), .A2(n263), .B1(n196), .B2(n82), .ZN(data_in[6]) );
  INV_X2 U17 ( .A(data_in[6]), .ZN(n82) );
  OAI22_X2 U18 ( .A1(n198), .A2(n262), .B1(n196), .B2(n83), .ZN(data_in[7]) );
  INV_X2 U19 ( .A(data_in[7]), .ZN(n83) );
  OAI22_X2 U20 ( .A1(n198), .A2(n261), .B1(n195), .B2(n84), .ZN(data_in[8]) );
  INV_X2 U21 ( .A(data_in[8]), .ZN(n84) );
  OAI22_X2 U22 ( .A1(n198), .A2(n260), .B1(n195), .B2(n85), .ZN(data_in[9]) );
  INV_X2 U23 ( .A(data_in[9]), .ZN(n85) );
  OAI22_X2 U24 ( .A1(n198), .A2(n259), .B1(n195), .B2(n86), .ZN(data_in[10])
         );
  INV_X2 U25 ( .A(data_in[10]), .ZN(n86) );
  OAI22_X2 U26 ( .A1(n198), .A2(n258), .B1(n195), .B2(n87), .ZN(data_in[11])
         );
  INV_X2 U27 ( .A(data_in[11]), .ZN(n87) );
  OAI22_X2 U28 ( .A1(n198), .A2(n257), .B1(n195), .B2(n88), .ZN(data_in[12])
         );
  INV_X2 U29 ( .A(data_in[12]), .ZN(n88) );
  OAI22_X2 U30 ( .A1(n199), .A2(n256), .B1(n195), .B2(n89), .ZN(data_in[13])
         );
  INV_X2 U31 ( .A(data_in[13]), .ZN(n89) );
  OAI22_X2 U32 ( .A1(n199), .A2(n255), .B1(n195), .B2(n90), .ZN(data_in[14])
         );
  INV_X2 U33 ( .A(data_in[14]), .ZN(n90) );
  OAI22_X2 U34 ( .A1(n199), .A2(n254), .B1(n195), .B2(n91), .ZN(data_in[15])
         );
  INV_X2 U35 ( .A(data_in[15]), .ZN(n91) );
  OAI22_X2 U36 ( .A1(n199), .A2(n253), .B1(n195), .B2(n92), .ZN(data_in[16])
         );
  INV_X2 U37 ( .A(data_in[16]), .ZN(n92) );
  OAI22_X2 U38 ( .A1(n199), .A2(n252), .B1(n195), .B2(n93), .ZN(data_in[17])
         );
  INV_X2 U39 ( .A(data_in[17]), .ZN(n93) );
  OAI22_X2 U40 ( .A1(n199), .A2(n251), .B1(n195), .B2(n94), .ZN(data_in[18])
         );
  INV_X2 U41 ( .A(data_in[18]), .ZN(n94) );
  OAI22_X2 U42 ( .A1(n199), .A2(n250), .B1(n195), .B2(n95), .ZN(data_in[19])
         );
  INV_X2 U43 ( .A(data_in[19]), .ZN(n95) );
  OAI22_X2 U44 ( .A1(n199), .A2(n249), .B1(n194), .B2(n96), .ZN(data_in[20])
         );
  INV_X2 U45 ( .A(data_in[20]), .ZN(n96) );
  OAI22_X2 U46 ( .A1(n199), .A2(n248), .B1(n194), .B2(n97), .ZN(data_in[21])
         );
  INV_X2 U47 ( .A(data_in[21]), .ZN(n97) );
  OAI22_X2 U48 ( .A1(n199), .A2(n247), .B1(n194), .B2(n98), .ZN(data_in[22])
         );
  INV_X2 U49 ( .A(data_in[22]), .ZN(n98) );
  OAI22_X2 U50 ( .A1(n199), .A2(n246), .B1(n194), .B2(n99), .ZN(data_in[23])
         );
  INV_X2 U51 ( .A(data_in[23]), .ZN(n99) );
  OAI22_X2 U52 ( .A1(n199), .A2(n245), .B1(n194), .B2(n100), .ZN(data_in[24])
         );
  INV_X2 U53 ( .A(data_in[24]), .ZN(n100) );
  OAI22_X2 U54 ( .A1(n199), .A2(n244), .B1(n194), .B2(n101), .ZN(data_in[25])
         );
  INV_X2 U55 ( .A(data_in[25]), .ZN(n101) );
  OAI22_X2 U56 ( .A1(n200), .A2(n243), .B1(n194), .B2(n102), .ZN(data_in[26])
         );
  INV_X2 U57 ( .A(data_in[26]), .ZN(n102) );
  OAI22_X2 U58 ( .A1(n200), .A2(n242), .B1(n194), .B2(n103), .ZN(data_in[27])
         );
  INV_X2 U59 ( .A(data_in[27]), .ZN(n103) );
  OAI22_X2 U60 ( .A1(n200), .A2(n241), .B1(n194), .B2(n104), .ZN(data_in[28])
         );
  INV_X2 U61 ( .A(data_in[28]), .ZN(n104) );
  OAI22_X2 U62 ( .A1(n200), .A2(n240), .B1(n194), .B2(n105), .ZN(data_in[29])
         );
  INV_X2 U63 ( .A(data_in[29]), .ZN(n105) );
  OAI22_X2 U64 ( .A1(n200), .A2(n239), .B1(n194), .B2(n106), .ZN(data_in[30])
         );
  INV_X2 U65 ( .A(data_in[30]), .ZN(n106) );
  OAI22_X2 U66 ( .A1(n200), .A2(n238), .B1(n194), .B2(n107), .ZN(data_in[31])
         );
  INV_X2 U67 ( .A(data_in[31]), .ZN(n107) );
  OAI22_X2 U70 ( .A1(n269), .A2(n109), .B1(n110), .B2(n111), .ZN(command[0])
         );
  INV_X2 U71 ( .A(command[0]), .ZN(n111) );
  OAI22_X2 U72 ( .A1(n268), .A2(n109), .B1(n110), .B2(n112), .ZN(command[1])
         );
  INV_X2 U73 ( .A(command[1]), .ZN(n112) );
  OAI22_X2 U74 ( .A1(n267), .A2(n109), .B1(n110), .B2(n113), .ZN(command[2])
         );
  INV_X2 U75 ( .A(command[2]), .ZN(n113) );
  OAI22_X2 U76 ( .A1(n266), .A2(n109), .B1(n110), .B2(n114), .ZN(command[3])
         );
  INV_X2 U77 ( .A(command[3]), .ZN(n114) );
  OAI22_X2 U78 ( .A1(n265), .A2(n109), .B1(n110), .B2(n115), .ZN(command[4])
         );
  INV_X2 U79 ( .A(command[4]), .ZN(n115) );
  OAI22_X2 U80 ( .A1(n264), .A2(n109), .B1(n110), .B2(n116), .ZN(command[5])
         );
  INV_X2 U81 ( .A(command[5]), .ZN(n116) );
  OAI22_X2 U82 ( .A1(n263), .A2(n109), .B1(n110), .B2(n117), .ZN(command[6])
         );
  INV_X2 U83 ( .A(command[6]), .ZN(n117) );
  OAI22_X2 U84 ( .A1(n262), .A2(n109), .B1(n110), .B2(n118), .ZN(command[7])
         );
  INV_X2 U85 ( .A(command[7]), .ZN(n118) );
  OAI22_X2 U88 ( .A1(n269), .A2(n191), .B1(n188), .B2(n122), .ZN(address[0])
         );
  INV_X2 U89 ( .A(address[0]), .ZN(n122) );
  OAI22_X2 U90 ( .A1(n268), .A2(n191), .B1(n188), .B2(n123), .ZN(address[1])
         );
  INV_X2 U91 ( .A(address[1]), .ZN(n123) );
  OAI22_X2 U92 ( .A1(n267), .A2(n191), .B1(n188), .B2(n124), .ZN(address[2])
         );
  INV_X2 U93 ( .A(address[2]), .ZN(n124) );
  OAI22_X2 U94 ( .A1(n266), .A2(n191), .B1(n188), .B2(n125), .ZN(address[3])
         );
  INV_X2 U95 ( .A(address[3]), .ZN(n125) );
  OAI22_X2 U96 ( .A1(n265), .A2(n191), .B1(n188), .B2(n126), .ZN(address[4])
         );
  INV_X2 U97 ( .A(address[4]), .ZN(n126) );
  OAI22_X2 U98 ( .A1(n264), .A2(n191), .B1(n188), .B2(n127), .ZN(address[5])
         );
  INV_X2 U99 ( .A(address[5]), .ZN(n127) );
  OAI22_X2 U100 ( .A1(n263), .A2(n191), .B1(n188), .B2(n128), .ZN(address[6])
         );
  INV_X2 U101 ( .A(address[6]), .ZN(n128) );
  OAI22_X2 U102 ( .A1(n262), .A2(n191), .B1(n188), .B2(n129), .ZN(address[7])
         );
  INV_X2 U103 ( .A(address[7]), .ZN(n129) );
  OAI22_X2 U104 ( .A1(n261), .A2(n191), .B1(n188), .B2(n130), .ZN(address[8])
         );
  INV_X2 U105 ( .A(address[8]), .ZN(n130) );
  OAI22_X2 U106 ( .A1(n260), .A2(n191), .B1(n188), .B2(n131), .ZN(address[9])
         );
  INV_X2 U107 ( .A(address[9]), .ZN(n131) );
  OAI22_X2 U108 ( .A1(n259), .A2(n191), .B1(n188), .B2(n132), .ZN(address[10])
         );
  INV_X2 U109 ( .A(address[10]), .ZN(n132) );
  OAI22_X2 U110 ( .A1(n258), .A2(n191), .B1(n188), .B2(n133), .ZN(address[11])
         );
  INV_X2 U111 ( .A(address[11]), .ZN(n133) );
  OAI22_X2 U112 ( .A1(n257), .A2(n192), .B1(n189), .B2(n134), .ZN(address[12])
         );
  INV_X2 U113 ( .A(address[12]), .ZN(n134) );
  OAI22_X2 U114 ( .A1(n256), .A2(n192), .B1(n189), .B2(n135), .ZN(address[13])
         );
  INV_X2 U115 ( .A(address[13]), .ZN(n135) );
  OAI22_X2 U116 ( .A1(n255), .A2(n192), .B1(n189), .B2(n136), .ZN(address[14])
         );
  INV_X2 U117 ( .A(address[14]), .ZN(n136) );
  OAI22_X2 U118 ( .A1(n254), .A2(n192), .B1(n189), .B2(n137), .ZN(address[15])
         );
  INV_X2 U119 ( .A(address[15]), .ZN(n137) );
  OAI22_X2 U120 ( .A1(n253), .A2(n192), .B1(n189), .B2(n138), .ZN(address[16])
         );
  INV_X2 U121 ( .A(address[16]), .ZN(n138) );
  OAI22_X2 U122 ( .A1(n252), .A2(n192), .B1(n189), .B2(n139), .ZN(address[17])
         );
  INV_X2 U123 ( .A(address[17]), .ZN(n139) );
  OAI22_X2 U124 ( .A1(n251), .A2(n192), .B1(n189), .B2(n140), .ZN(address[18])
         );
  INV_X2 U125 ( .A(address[18]), .ZN(n140) );
  OAI22_X2 U126 ( .A1(n250), .A2(n192), .B1(n189), .B2(n141), .ZN(address[19])
         );
  INV_X2 U127 ( .A(address[19]), .ZN(n141) );
  OAI22_X2 U128 ( .A1(n249), .A2(n192), .B1(n189), .B2(n142), .ZN(address[20])
         );
  INV_X2 U129 ( .A(address[20]), .ZN(n142) );
  OAI22_X2 U130 ( .A1(n248), .A2(n192), .B1(n189), .B2(n143), .ZN(address[21])
         );
  INV_X2 U131 ( .A(address[21]), .ZN(n143) );
  OAI22_X2 U132 ( .A1(n247), .A2(n192), .B1(n189), .B2(n144), .ZN(address[22])
         );
  INV_X2 U133 ( .A(address[22]), .ZN(n144) );
  OAI22_X2 U134 ( .A1(n246), .A2(n192), .B1(n189), .B2(n145), .ZN(address[23])
         );
  INV_X2 U135 ( .A(address[23]), .ZN(n145) );
  NAND3_X1 U242 ( .A1(n236), .A2(n235), .A3(n73), .ZN(n72) );
  NAND3_X1 U243 ( .A1(addr[0]), .A2(n73), .A3(addr[1]), .ZN(n108) );
  NAND3_X1 U244 ( .A1(n73), .A2(n235), .A3(addr[0]), .ZN(n119) );
  NAND3_X1 U245 ( .A1(n73), .A2(n236), .A3(addr[1]), .ZN(n146) );
  BUF_X1 U246 ( .A(n180), .Z(n186) );
  BUF_X1 U247 ( .A(n180), .Z(n187) );
  BUF_X1 U248 ( .A(n75), .Z(n193) );
  BUF_X1 U249 ( .A(n74), .Z(n197) );
  INV_X1 U250 ( .A(rst), .ZN(n201) );
  INV_X1 U251 ( .A(n72), .ZN(n234) );
  BUF_X1 U252 ( .A(n120), .Z(n192) );
  BUF_X1 U253 ( .A(n120), .Z(n191) );
  BUF_X1 U254 ( .A(n197), .Z(n198) );
  BUF_X1 U255 ( .A(n197), .Z(n199) );
  BUF_X1 U256 ( .A(n187), .Z(n181) );
  BUF_X1 U257 ( .A(n187), .Z(n182) );
  BUF_X1 U258 ( .A(n193), .Z(n194) );
  BUF_X1 U259 ( .A(n193), .Z(n195) );
  BUF_X1 U260 ( .A(n190), .Z(n189) );
  BUF_X1 U261 ( .A(n190), .Z(n188) );
  INV_X1 U262 ( .A(n186), .ZN(n184) );
  INV_X1 U263 ( .A(n186), .ZN(n185) );
  BUF_X1 U264 ( .A(n187), .Z(n183) );
  BUF_X1 U265 ( .A(n193), .Z(n196) );
  BUF_X1 U266 ( .A(n197), .Z(n200) );
  OR2_X1 U267 ( .A1(n146), .A2(rst), .ZN(n120) );
  NAND2_X1 U268 ( .A1(n119), .A2(n201), .ZN(n110) );
  OR2_X1 U269 ( .A1(n119), .A2(rst), .ZN(n109) );
  NAND2_X1 U270 ( .A1(n108), .A2(n201), .ZN(n75) );
  OR2_X1 U271 ( .A1(n108), .A2(rst), .ZN(n74) );
  BUF_X1 U272 ( .A(n121), .Z(n190) );
  NAND2_X1 U273 ( .A1(n146), .A2(n201), .ZN(n121) );
  NOR2_X1 U274 ( .A1(n237), .A2(addr[2]), .ZN(n73) );
  INV_X1 U275 ( .A(we), .ZN(n237) );
  AND4_X1 U276 ( .A1(re), .A2(addr[2]), .A3(n236), .A4(n235), .ZN(n180) );
  NOR2_X1 U277 ( .A1(rst), .A2(n71), .ZN(enable) );
  INV_X1 U278 ( .A(write_data[7]), .ZN(n262) );
  INV_X1 U279 ( .A(write_data[6]), .ZN(n263) );
  INV_X1 U280 ( .A(write_data[5]), .ZN(n264) );
  INV_X1 U281 ( .A(write_data[4]), .ZN(n265) );
  INV_X1 U282 ( .A(write_data[3]), .ZN(n266) );
  INV_X1 U283 ( .A(write_data[2]), .ZN(n267) );
  INV_X1 U284 ( .A(write_data[1]), .ZN(n268) );
  INV_X1 U285 ( .A(write_data[0]), .ZN(n269) );
  INV_X1 U286 ( .A(addr[1]), .ZN(n235) );
  INV_X1 U287 ( .A(addr[0]), .ZN(n236) );
  INV_X1 U288 ( .A(write_data[23]), .ZN(n246) );
  INV_X1 U289 ( .A(write_data[22]), .ZN(n247) );
  INV_X1 U290 ( .A(write_data[21]), .ZN(n248) );
  INV_X1 U291 ( .A(write_data[20]), .ZN(n249) );
  INV_X1 U292 ( .A(write_data[19]), .ZN(n250) );
  INV_X1 U293 ( .A(write_data[18]), .ZN(n251) );
  INV_X1 U294 ( .A(write_data[17]), .ZN(n252) );
  INV_X1 U295 ( .A(write_data[16]), .ZN(n253) );
  INV_X1 U296 ( .A(write_data[15]), .ZN(n254) );
  INV_X1 U297 ( .A(write_data[14]), .ZN(n255) );
  INV_X1 U298 ( .A(write_data[13]), .ZN(n256) );
  INV_X1 U299 ( .A(write_data[12]), .ZN(n257) );
  INV_X1 U300 ( .A(write_data[11]), .ZN(n258) );
  INV_X1 U301 ( .A(write_data[10]), .ZN(n259) );
  INV_X1 U302 ( .A(write_data[9]), .ZN(n260) );
  INV_X1 U303 ( .A(write_data[8]), .ZN(n261) );
  INV_X1 U304 ( .A(write_data[31]), .ZN(n238) );
  INV_X1 U305 ( .A(write_data[30]), .ZN(n239) );
  INV_X1 U306 ( .A(write_data[29]), .ZN(n240) );
  INV_X1 U307 ( .A(write_data[28]), .ZN(n241) );
  INV_X1 U308 ( .A(write_data[27]), .ZN(n242) );
  INV_X1 U309 ( .A(write_data[26]), .ZN(n243) );
  INV_X1 U310 ( .A(write_data[25]), .ZN(n244) );
  INV_X1 U311 ( .A(write_data[24]), .ZN(n245) );
  INV_X1 U312 ( .A(n163), .ZN(n202) );
  AOI22_X1 U313 ( .A1(read_data[0]), .A2(n185), .B1(data_out[0]), .B2(n182), 
        .ZN(n163) );
  INV_X1 U314 ( .A(n162), .ZN(n203) );
  AOI22_X1 U315 ( .A1(read_data[1]), .A2(n185), .B1(data_out[1]), .B2(n182), 
        .ZN(n162) );
  INV_X1 U316 ( .A(n161), .ZN(n204) );
  AOI22_X1 U317 ( .A1(read_data[2]), .A2(n185), .B1(data_out[2]), .B2(n182), 
        .ZN(n161) );
  INV_X1 U318 ( .A(n160), .ZN(n205) );
  AOI22_X1 U319 ( .A1(read_data[3]), .A2(n185), .B1(data_out[3]), .B2(n182), 
        .ZN(n160) );
  INV_X1 U320 ( .A(n159), .ZN(n206) );
  AOI22_X1 U321 ( .A1(read_data[4]), .A2(n185), .B1(data_out[4]), .B2(n182), 
        .ZN(n159) );
  INV_X1 U322 ( .A(n158), .ZN(n207) );
  AOI22_X1 U323 ( .A1(read_data[5]), .A2(n185), .B1(data_out[5]), .B2(n182), 
        .ZN(n158) );
  INV_X1 U324 ( .A(n157), .ZN(n208) );
  AOI22_X1 U325 ( .A1(read_data[6]), .A2(n185), .B1(data_out[6]), .B2(n182), 
        .ZN(n157) );
  INV_X1 U326 ( .A(n156), .ZN(n209) );
  AOI22_X1 U327 ( .A1(read_data[7]), .A2(n185), .B1(data_out[7]), .B2(n182), 
        .ZN(n156) );
  INV_X1 U328 ( .A(n155), .ZN(n210) );
  AOI22_X1 U329 ( .A1(read_data[8]), .A2(n184), .B1(data_out[8]), .B2(n183), 
        .ZN(n155) );
  INV_X1 U330 ( .A(n154), .ZN(n211) );
  AOI22_X1 U331 ( .A1(read_data[9]), .A2(n185), .B1(data_out[9]), .B2(n183), 
        .ZN(n154) );
  INV_X1 U332 ( .A(n153), .ZN(n212) );
  AOI22_X1 U333 ( .A1(read_data[10]), .A2(n184), .B1(data_out[10]), .B2(n183), 
        .ZN(n153) );
  INV_X1 U334 ( .A(n152), .ZN(n213) );
  AOI22_X1 U335 ( .A1(read_data[11]), .A2(n185), .B1(data_out[11]), .B2(n183), 
        .ZN(n152) );
  INV_X1 U336 ( .A(n151), .ZN(n214) );
  AOI22_X1 U337 ( .A1(read_data[12]), .A2(n184), .B1(data_out[12]), .B2(n183), 
        .ZN(n151) );
  INV_X1 U338 ( .A(n150), .ZN(n215) );
  AOI22_X1 U339 ( .A1(read_data[13]), .A2(n185), .B1(data_out[13]), .B2(n183), 
        .ZN(n150) );
  INV_X1 U340 ( .A(n149), .ZN(n216) );
  AOI22_X1 U341 ( .A1(read_data[14]), .A2(n184), .B1(data_out[14]), .B2(n183), 
        .ZN(n149) );
  INV_X1 U342 ( .A(n147), .ZN(n217) );
  AOI22_X1 U343 ( .A1(read_data[15]), .A2(n185), .B1(data_out[15]), .B2(n183), 
        .ZN(n147) );
  INV_X1 U344 ( .A(n179), .ZN(n218) );
  AOI22_X1 U345 ( .A1(read_data[16]), .A2(n184), .B1(data_out[16]), .B2(n181), 
        .ZN(n179) );
  INV_X1 U346 ( .A(n178), .ZN(n219) );
  AOI22_X1 U347 ( .A1(read_data[17]), .A2(n184), .B1(data_out[17]), .B2(n181), 
        .ZN(n178) );
  INV_X1 U348 ( .A(n177), .ZN(n220) );
  AOI22_X1 U349 ( .A1(read_data[18]), .A2(n184), .B1(data_out[18]), .B2(n181), 
        .ZN(n177) );
  INV_X1 U350 ( .A(n176), .ZN(n221) );
  AOI22_X1 U351 ( .A1(read_data[19]), .A2(n184), .B1(data_out[19]), .B2(n181), 
        .ZN(n176) );
  INV_X1 U352 ( .A(n175), .ZN(n222) );
  AOI22_X1 U353 ( .A1(read_data[20]), .A2(n184), .B1(data_out[20]), .B2(n181), 
        .ZN(n175) );
  INV_X1 U354 ( .A(n174), .ZN(n223) );
  AOI22_X1 U355 ( .A1(read_data[21]), .A2(n184), .B1(data_out[21]), .B2(n181), 
        .ZN(n174) );
  INV_X1 U356 ( .A(n173), .ZN(n224) );
  AOI22_X1 U357 ( .A1(read_data[22]), .A2(n184), .B1(data_out[22]), .B2(n181), 
        .ZN(n173) );
  INV_X1 U358 ( .A(n172), .ZN(n225) );
  AOI22_X1 U359 ( .A1(read_data[23]), .A2(n184), .B1(data_out[23]), .B2(n181), 
        .ZN(n172) );
  INV_X1 U360 ( .A(n171), .ZN(n226) );
  AOI22_X1 U361 ( .A1(read_data[24]), .A2(n184), .B1(data_out[24]), .B2(n181), 
        .ZN(n171) );
  INV_X1 U362 ( .A(n170), .ZN(n227) );
  AOI22_X1 U363 ( .A1(read_data[25]), .A2(n184), .B1(data_out[25]), .B2(n181), 
        .ZN(n170) );
  INV_X1 U364 ( .A(n169), .ZN(n228) );
  AOI22_X1 U365 ( .A1(read_data[26]), .A2(n184), .B1(data_out[26]), .B2(n181), 
        .ZN(n169) );
  INV_X1 U366 ( .A(n168), .ZN(n229) );
  AOI22_X1 U367 ( .A1(read_data[27]), .A2(n184), .B1(data_out[27]), .B2(n181), 
        .ZN(n168) );
  INV_X1 U368 ( .A(n167), .ZN(n230) );
  AOI22_X1 U369 ( .A1(read_data[28]), .A2(n185), .B1(data_out[28]), .B2(n182), 
        .ZN(n167) );
  INV_X1 U370 ( .A(n166), .ZN(n231) );
  AOI22_X1 U371 ( .A1(read_data[29]), .A2(n185), .B1(data_out[29]), .B2(n182), 
        .ZN(n166) );
  INV_X1 U372 ( .A(n165), .ZN(n232) );
  AOI22_X1 U373 ( .A1(read_data[30]), .A2(n185), .B1(data_out[30]), .B2(n182), 
        .ZN(n165) );
  INV_X1 U374 ( .A(n164), .ZN(n233) );
  AOI22_X1 U375 ( .A1(read_data[31]), .A2(n185), .B1(data_out[31]), .B2(n182), 
        .ZN(n164) );
  NOR3_X1 \uut_master/U307  ( .A1(\uut_master/n45 ), .A2(\uut_master/n3 ), 
        .A3(\uut_master/n306 ), .ZN(mosi) );
  OAI222_X1 \uut_master/U306  ( .A1(\uut_master/n47 ), .A2(\uut_master/n306 ), 
        .B1(\uut_master/n31 ), .B2(\uut_master/n303 ), .C1(\uut_master/n15 ), 
        .C2(\uut_master/n301 ), .ZN(\uut_master/n42 ) );
  OAI222_X1 \uut_master/U305  ( .A1(\uut_master/n121 ), .A2(\uut_master/n303 ), 
        .B1(\uut_master/n32 ), .B2(\uut_master/n300 ), .C1(\uut_master/n15 ), 
        .C2(\uut_master/n299 ), .ZN(\uut_master/n41 ) );
  OAI222_X1 \uut_master/U304  ( .A1(\uut_master/n121 ), .A2(\uut_master/n300 ), 
        .B1(\uut_master/n32 ), .B2(\uut_master/n298 ), .C1(\uut_master/n125 ), 
        .C2(\uut_master/n297 ), .ZN(\uut_master/n40 ) );
  OAI222_X1 \uut_master/U303  ( .A1(\uut_master/n121 ), .A2(\uut_master/n298 ), 
        .B1(\uut_master/n11 ), .B2(\uut_master/n296 ), .C1(\uut_master/n125 ), 
        .C2(\uut_master/n295 ), .ZN(\uut_master/n39 ) );
  OAI222_X1 \uut_master/U302  ( .A1(\uut_master/n121 ), .A2(\uut_master/n296 ), 
        .B1(\uut_master/n32 ), .B2(\uut_master/n294 ), .C1(\uut_master/n125 ), 
        .C2(\uut_master/n293 ), .ZN(\uut_master/n38 ) );
  INV_X1 \uut_master/U301  ( .A(command[3]), .ZN(\uut_master/n293 ) );
  OAI222_X1 \uut_master/U300  ( .A1(\uut_master/n110 ), .A2(\uut_master/n294 ), 
        .B1(\uut_master/n12 ), .B2(\uut_master/n292 ), .C1(\uut_master/n125 ), 
        .C2(\uut_master/n291 ), .ZN(\uut_master/n37 ) );
  INV_X1 \uut_master/U299  ( .A(command[2]), .ZN(\uut_master/n291 ) );
  OAI222_X1 \uut_master/U298  ( .A1(\uut_master/n34 ), .A2(\uut_master/n292 ), 
        .B1(\uut_master/n31 ), .B2(\uut_master/n290 ), .C1(\uut_master/n125 ), 
        .C2(\uut_master/n289 ), .ZN(\uut_master/n36 ) );
  OAI21_X1 \uut_master/U297  ( .B1(\uut_master/n15 ), .B2(\uut_master/n288 ), 
        .A(\uut_master/n287 ), .ZN(\uut_master/n35 ) );
  AOI22_X1 \uut_master/U296  ( .A1(\uut_master/data_save_shifted [56]), .A2(
        \uut_master/n136 ), .B1(\uut_master/data_save_shifted [57]), .B2(
        \uut_master/n140 ), .ZN(\uut_master/n287 ) );
  INV_X1 \uut_master/U295  ( .A(\uut_master/n286 ), .ZN(\uut_master/N85 ) );
  AOI221_X1 \uut_master/U294  ( .B1(address[23]), .B2(\uut_master/n122 ), .C1(
        \uut_master/n136 ), .C2(\uut_master/data_save_shifted [55]), .A(
        \uut_master/n285 ), .ZN(\uut_master/n286 ) );
  NOR2_X1 \uut_master/U293  ( .A1(\uut_master/n53 ), .A2(\uut_master/n43 ), 
        .ZN(\uut_master/n285 ) );
  INV_X1 \uut_master/U292  ( .A(\uut_master/n284 ), .ZN(\uut_master/N84 ) );
  AOI221_X1 \uut_master/U291  ( .B1(address[22]), .B2(\uut_master/n17 ), .C1(
        \uut_master/data_save_shifted [54]), .C2(\uut_master/n135 ), .A(
        \uut_master/n283 ), .ZN(\uut_master/n284 ) );
  NOR2_X1 \uut_master/U290  ( .A1(\uut_master/n54 ), .A2(\uut_master/n124 ), 
        .ZN(\uut_master/n283 ) );
  INV_X1 \uut_master/U289  ( .A(\uut_master/n282 ), .ZN(\uut_master/N83 ) );
  AOI221_X1 \uut_master/U288  ( .B1(address[21]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [53]), .C2(\uut_master/n136 ), .A(
        \uut_master/n281 ), .ZN(\uut_master/n282 ) );
  NOR2_X1 \uut_master/U287  ( .A1(\uut_master/n112 ), .A2(\uut_master/n55 ), 
        .ZN(\uut_master/n281 ) );
  INV_X1 \uut_master/U286  ( .A(\uut_master/n280 ), .ZN(\uut_master/N82 ) );
  AOI221_X1 \uut_master/U285  ( .B1(address[20]), .B2(\uut_master/n130 ), .C1(
        \uut_master/data_save_shifted [52]), .C2(\uut_master/n135 ), .A(
        \uut_master/n279 ), .ZN(\uut_master/n280 ) );
  NOR2_X1 \uut_master/U284  ( .A1(\uut_master/n56 ), .A2(\uut_master/n4 ), 
        .ZN(\uut_master/n279 ) );
  INV_X1 \uut_master/U283  ( .A(\uut_master/n278 ), .ZN(\uut_master/N81 ) );
  AOI221_X1 \uut_master/U282  ( .B1(address[19]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [51]), .C2(\uut_master/n136 ), .A(
        \uut_master/n277 ), .ZN(\uut_master/n278 ) );
  NOR2_X1 \uut_master/U281  ( .A1(\uut_master/n57 ), .A2(\uut_master/n134 ), 
        .ZN(\uut_master/n277 ) );
  INV_X1 \uut_master/U280  ( .A(\uut_master/n276 ), .ZN(\uut_master/N80 ) );
  AOI221_X1 \uut_master/U279  ( .B1(address[18]), .B2(\uut_master/n130 ), .C1(
        \uut_master/data_save_shifted [50]), .C2(\uut_master/n135 ), .A(
        \uut_master/n275 ), .ZN(\uut_master/n276 ) );
  NOR2_X1 \uut_master/U278  ( .A1(\uut_master/n58 ), .A2(\uut_master/n4 ), 
        .ZN(\uut_master/n275 ) );
  INV_X1 \uut_master/U277  ( .A(\uut_master/n274 ), .ZN(\uut_master/N79 ) );
  AOI221_X1 \uut_master/U276  ( .B1(address[17]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [49]), .C2(\uut_master/n135 ), .A(
        \uut_master/n273 ), .ZN(\uut_master/n274 ) );
  NOR2_X1 \uut_master/U275  ( .A1(\uut_master/n59 ), .A2(\uut_master/n134 ), 
        .ZN(\uut_master/n273 ) );
  INV_X1 \uut_master/U274  ( .A(\uut_master/n272 ), .ZN(\uut_master/N78 ) );
  AOI221_X1 \uut_master/U273  ( .B1(address[16]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [48]), .C2(\uut_master/n135 ), .A(
        \uut_master/n271 ), .ZN(\uut_master/n272 ) );
  NOR2_X1 \uut_master/U272  ( .A1(\uut_master/n112 ), .A2(\uut_master/n60 ), 
        .ZN(\uut_master/n271 ) );
  INV_X1 \uut_master/U271  ( .A(\uut_master/n270 ), .ZN(\uut_master/N77 ) );
  AOI221_X1 \uut_master/U270  ( .B1(address[15]), .B2(\uut_master/n17 ), .C1(
        \uut_master/data_save_shifted [47]), .C2(\uut_master/n136 ), .A(
        \uut_master/n269 ), .ZN(\uut_master/n270 ) );
  NOR2_X1 \uut_master/U269  ( .A1(\uut_master/n61 ), .A2(\uut_master/n134 ), 
        .ZN(\uut_master/n269 ) );
  INV_X1 \uut_master/U268  ( .A(\uut_master/n268 ), .ZN(\uut_master/N76 ) );
  AOI221_X1 \uut_master/U267  ( .B1(address[14]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [46]), .C2(\uut_master/n136 ), .A(
        \uut_master/n267 ), .ZN(\uut_master/n268 ) );
  NOR2_X1 \uut_master/U266  ( .A1(\uut_master/n62 ), .A2(\uut_master/n124 ), 
        .ZN(\uut_master/n267 ) );
  INV_X1 \uut_master/U265  ( .A(\uut_master/n266 ), .ZN(\uut_master/N75 ) );
  AOI221_X1 \uut_master/U264  ( .B1(address[13]), .B2(\uut_master/n17 ), .C1(
        \uut_master/data_save_shifted [45]), .C2(\uut_master/n135 ), .A(
        \uut_master/n265 ), .ZN(\uut_master/n266 ) );
  NOR2_X1 \uut_master/U263  ( .A1(\uut_master/n63 ), .A2(\uut_master/n43 ), 
        .ZN(\uut_master/n265 ) );
  INV_X1 \uut_master/U262  ( .A(\uut_master/n264 ), .ZN(\uut_master/N74 ) );
  AOI221_X1 \uut_master/U261  ( .B1(\uut_master/n120 ), .B2(address[12]), .C1(
        \uut_master/n136 ), .C2(\uut_master/data_save_shifted [44]), .A(
        \uut_master/n263 ), .ZN(\uut_master/n264 ) );
  NOR2_X1 \uut_master/U260  ( .A1(\uut_master/n16 ), .A2(\uut_master/n64 ), 
        .ZN(\uut_master/n263 ) );
  INV_X1 \uut_master/U259  ( .A(\uut_master/n262 ), .ZN(\uut_master/N73 ) );
  AOI221_X1 \uut_master/U258  ( .B1(address[11]), .B2(\uut_master/n17 ), .C1(
        \uut_master/data_save_shifted [43]), .C2(\uut_master/n135 ), .A(
        \uut_master/n261 ), .ZN(\uut_master/n262 ) );
  NOR2_X1 \uut_master/U257  ( .A1(\uut_master/n65 ), .A2(\uut_master/n34 ), 
        .ZN(\uut_master/n261 ) );
  INV_X1 \uut_master/U256  ( .A(\uut_master/n260 ), .ZN(\uut_master/N72 ) );
  AOI221_X1 \uut_master/U255  ( .B1(address[10]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [42]), .C2(\uut_master/n135 ), .A(
        \uut_master/n259 ), .ZN(\uut_master/n260 ) );
  NOR2_X1 \uut_master/U254  ( .A1(\uut_master/n34 ), .A2(\uut_master/n66 ), 
        .ZN(\uut_master/n259 ) );
  INV_X1 \uut_master/U253  ( .A(\uut_master/n258 ), .ZN(\uut_master/N71 ) );
  AOI221_X1 \uut_master/U252  ( .B1(address[9]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [41]), .C2(\uut_master/n136 ), .A(
        \uut_master/n257 ), .ZN(\uut_master/n258 ) );
  NOR2_X1 \uut_master/U251  ( .A1(\uut_master/n67 ), .A2(\uut_master/n4 ), 
        .ZN(\uut_master/n257 ) );
  INV_X1 \uut_master/U250  ( .A(\uut_master/n256 ), .ZN(\uut_master/N70 ) );
  AOI221_X1 \uut_master/U249  ( .B1(address[8]), .B2(\uut_master/n130 ), .C1(
        \uut_master/data_save_shifted [40]), .C2(\uut_master/n136 ), .A(
        \uut_master/n255 ), .ZN(\uut_master/n256 ) );
  NOR2_X1 \uut_master/U248  ( .A1(\uut_master/n68 ), .A2(\uut_master/n110 ), 
        .ZN(\uut_master/n255 ) );
  INV_X1 \uut_master/U247  ( .A(\uut_master/n254 ), .ZN(\uut_master/N69 ) );
  AOI221_X1 \uut_master/U246  ( .B1(address[7]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [39]), .C2(\uut_master/n135 ), .A(
        \uut_master/n253 ), .ZN(\uut_master/n254 ) );
  NOR2_X1 \uut_master/U245  ( .A1(\uut_master/n69 ), .A2(\uut_master/n124 ), 
        .ZN(\uut_master/n253 ) );
  INV_X1 \uut_master/U244  ( .A(\uut_master/n252 ), .ZN(\uut_master/N68 ) );
  AOI221_X1 \uut_master/U243  ( .B1(address[6]), .B2(\uut_master/n120 ), .C1(
        \uut_master/data_save_shifted [38]), .C2(\uut_master/n135 ), .A(
        \uut_master/n251 ), .ZN(\uut_master/n252 ) );
  NOR2_X1 \uut_master/U242  ( .A1(\uut_master/n70 ), .A2(\uut_master/n110 ), 
        .ZN(\uut_master/n251 ) );
  INV_X1 \uut_master/U241  ( .A(\uut_master/n250 ), .ZN(\uut_master/N67 ) );
  AOI221_X1 \uut_master/U240  ( .B1(address[5]), .B2(\uut_master/n122 ), .C1(
        \uut_master/n136 ), .C2(\uut_master/data_save_shifted [37]), .A(
        \uut_master/n249 ), .ZN(\uut_master/n250 ) );
  NOR2_X1 \uut_master/U239  ( .A1(\uut_master/n71 ), .A2(\uut_master/n237 ), 
        .ZN(\uut_master/n249 ) );
  INV_X1 \uut_master/U238  ( .A(\uut_master/n248 ), .ZN(\uut_master/N66 ) );
  AOI221_X1 \uut_master/U237  ( .B1(address[4]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [36]), .C2(\uut_master/n136 ), .A(
        \uut_master/n247 ), .ZN(\uut_master/n248 ) );
  NOR2_X1 \uut_master/U236  ( .A1(\uut_master/n72 ), .A2(\uut_master/n16 ), 
        .ZN(\uut_master/n247 ) );
  INV_X1 \uut_master/U235  ( .A(\uut_master/n246 ), .ZN(\uut_master/N65 ) );
  AOI221_X1 \uut_master/U234  ( .B1(address[3]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [35]), .C2(\uut_master/n135 ), .A(
        \uut_master/n245 ), .ZN(\uut_master/n246 ) );
  NOR2_X1 \uut_master/U233  ( .A1(\uut_master/n73 ), .A2(\uut_master/n305 ), 
        .ZN(\uut_master/n245 ) );
  INV_X1 \uut_master/U232  ( .A(\uut_master/n244 ), .ZN(\uut_master/N64 ) );
  AOI221_X1 \uut_master/U231  ( .B1(address[2]), .B2(\uut_master/n130 ), .C1(
        \uut_master/data_save_shifted [34]), .C2(\uut_master/n136 ), .A(
        \uut_master/n243 ), .ZN(\uut_master/n244 ) );
  NOR2_X1 \uut_master/U230  ( .A1(\uut_master/n74 ), .A2(\uut_master/n237 ), 
        .ZN(\uut_master/n243 ) );
  INV_X1 \uut_master/U229  ( .A(\uut_master/n242 ), .ZN(\uut_master/N63 ) );
  AOI221_X1 \uut_master/U228  ( .B1(\uut_master/n120 ), .B2(address[1]), .C1(
        \uut_master/data_save_shifted [33]), .C2(\uut_master/n136 ), .A(
        \uut_master/n241 ), .ZN(\uut_master/n242 ) );
  NOR2_X1 \uut_master/U227  ( .A1(\uut_master/n75 ), .A2(\uut_master/n305 ), 
        .ZN(\uut_master/n241 ) );
  INV_X1 \uut_master/U226  ( .A(\uut_master/n239 ), .ZN(\uut_master/N62 ) );
  AOI221_X1 \uut_master/U225  ( .B1(address[0]), .B2(\uut_master/n122 ), .C1(
        \uut_master/data_save_shifted [32]), .C2(\uut_master/n135 ), .A(
        \uut_master/n238 ), .ZN(\uut_master/n239 ) );
  NOR2_X1 \uut_master/U224  ( .A1(\uut_master/n76 ), .A2(\uut_master/n16 ), 
        .ZN(\uut_master/n238 ) );
  NAND2_X1 \uut_master/U223  ( .A1(\uut_master/n307 ), .A2(\uut_master/n44 ), 
        .ZN(\uut_master/n302 ) );
  OAI221_X1 \uut_master/U222  ( .B1(\uut_master/n78 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n77 ), .A(\uut_master/n236 ), 
        .ZN(\uut_master/N61 ) );
  NAND2_X1 \uut_master/U221  ( .A1(data_in[31]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n236 ) );
  OAI221_X1 \uut_master/U220  ( .B1(\uut_master/n79 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n78 ), .A(\uut_master/n235 ), 
        .ZN(\uut_master/N60 ) );
  NAND2_X1 \uut_master/U219  ( .A1(data_in[30]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n235 ) );
  OAI221_X1 \uut_master/U218  ( .B1(\uut_master/n80 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n13 ), .C2(\uut_master/n79 ), .A(\uut_master/n234 ), 
        .ZN(\uut_master/N59 ) );
  NAND2_X1 \uut_master/U217  ( .A1(data_in[29]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n234 ) );
  OAI221_X1 \uut_master/U216  ( .B1(\uut_master/n81 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n80 ), .A(\uut_master/n233 ), 
        .ZN(\uut_master/N58 ) );
  NAND2_X1 \uut_master/U215  ( .A1(data_in[28]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n233 ) );
  OAI221_X1 \uut_master/U214  ( .B1(\uut_master/n82 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n81 ), .A(\uut_master/n232 ), 
        .ZN(\uut_master/N57 ) );
  NAND2_X1 \uut_master/U213  ( .A1(data_in[27]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n232 ) );
  OAI221_X1 \uut_master/U212  ( .B1(\uut_master/n83 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n82 ), .C2(\uut_master/n112 ), .A(\uut_master/n231 ), 
        .ZN(\uut_master/N56 ) );
  NAND2_X1 \uut_master/U211  ( .A1(data_in[26]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n231 ) );
  OAI221_X1 \uut_master/U210  ( .B1(\uut_master/n84 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n83 ), .A(\uut_master/n230 ), 
        .ZN(\uut_master/N55 ) );
  NAND2_X1 \uut_master/U209  ( .A1(data_in[25]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n230 ) );
  OAI221_X1 \uut_master/U208  ( .B1(\uut_master/n85 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n13 ), .C2(\uut_master/n84 ), .A(\uut_master/n229 ), 
        .ZN(\uut_master/N54 ) );
  NAND2_X1 \uut_master/U207  ( .A1(data_in[24]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n229 ) );
  OAI221_X1 \uut_master/U206  ( .B1(\uut_master/n31 ), .B2(\uut_master/n86 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n85 ), .A(\uut_master/n228 ), 
        .ZN(\uut_master/N53 ) );
  NAND2_X1 \uut_master/U205  ( .A1(data_in[23]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n228 ) );
  OAI221_X1 \uut_master/U204  ( .B1(\uut_master/n87 ), .B2(\uut_master/n12 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n86 ), .A(\uut_master/n227 ), 
        .ZN(\uut_master/N52 ) );
  NAND2_X1 \uut_master/U203  ( .A1(data_in[22]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n227 ) );
  OAI221_X1 \uut_master/U202  ( .B1(\uut_master/n88 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n87 ), .A(\uut_master/n226 ), 
        .ZN(\uut_master/N51 ) );
  NAND2_X1 \uut_master/U201  ( .A1(data_in[21]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n226 ) );
  OAI221_X1 \uut_master/U200  ( .B1(\uut_master/n89 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n13 ), .C2(\uut_master/n88 ), .A(\uut_master/n225 ), 
        .ZN(\uut_master/N50 ) );
  NAND2_X1 \uut_master/U199  ( .A1(data_in[20]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n225 ) );
  OAI221_X1 \uut_master/U198  ( .B1(\uut_master/n90 ), .B2(\uut_master/n30 ), 
        .C1(\uut_master/n89 ), .C2(\uut_master/n121 ), .A(\uut_master/n224 ), 
        .ZN(\uut_master/N49 ) );
  NAND2_X1 \uut_master/U197  ( .A1(data_in[19]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n224 ) );
  OAI221_X1 \uut_master/U196  ( .B1(\uut_master/n31 ), .B2(\uut_master/n91 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n90 ), .A(\uut_master/n223 ), 
        .ZN(\uut_master/N48 ) );
  NAND2_X1 \uut_master/U195  ( .A1(data_in[18]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n223 ) );
  OAI221_X1 \uut_master/U194  ( .B1(\uut_master/n32 ), .B2(\uut_master/n92 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n91 ), .A(\uut_master/n222 ), 
        .ZN(\uut_master/N47 ) );
  NAND2_X1 \uut_master/U193  ( .A1(data_in[17]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n222 ) );
  OAI221_X1 \uut_master/U192  ( .B1(\uut_master/n93 ), .B2(\uut_master/n10 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n92 ), .A(\uut_master/n221 ), 
        .ZN(\uut_master/N46 ) );
  NAND2_X1 \uut_master/U191  ( .A1(data_in[16]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n221 ) );
  OAI221_X1 \uut_master/U190  ( .B1(\uut_master/n94 ), .B2(\uut_master/n10 ), 
        .C1(\uut_master/n13 ), .C2(\uut_master/n93 ), .A(\uut_master/n220 ), 
        .ZN(\uut_master/N45 ) );
  NAND2_X1 \uut_master/U189  ( .A1(data_in[15]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n220 ) );
  OAI221_X1 \uut_master/U188  ( .B1(\uut_master/n95 ), .B2(\uut_master/n11 ), 
        .C1(\uut_master/n94 ), .C2(\uut_master/n13 ), .A(\uut_master/n219 ), 
        .ZN(\uut_master/N44 ) );
  NAND2_X1 \uut_master/U187  ( .A1(data_in[14]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n219 ) );
  OAI221_X1 \uut_master/U186  ( .B1(\uut_master/n96 ), .B2(\uut_master/n30 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n95 ), .A(\uut_master/n218 ), 
        .ZN(\uut_master/N43 ) );
  NAND2_X1 \uut_master/U185  ( .A1(data_in[13]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n218 ) );
  OAI221_X1 \uut_master/U184  ( .B1(\uut_master/n97 ), .B2(\uut_master/n10 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n96 ), .A(\uut_master/n217 ), 
        .ZN(\uut_master/N42 ) );
  NAND2_X1 \uut_master/U183  ( .A1(data_in[12]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n217 ) );
  OAI221_X1 \uut_master/U182  ( .B1(\uut_master/n98 ), .B2(\uut_master/n30 ), 
        .C1(\uut_master/n97 ), .C2(\uut_master/n121 ), .A(\uut_master/n216 ), 
        .ZN(\uut_master/N41 ) );
  NAND2_X1 \uut_master/U181  ( .A1(data_in[11]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n216 ) );
  OAI221_X1 \uut_master/U180  ( .B1(\uut_master/n99 ), .B2(\uut_master/n12 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n98 ), .A(\uut_master/n215 ), 
        .ZN(\uut_master/N40 ) );
  NAND2_X1 \uut_master/U179  ( .A1(data_in[10]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n215 ) );
  OAI221_X1 \uut_master/U178  ( .B1(\uut_master/n100 ), .B2(\uut_master/n30 ), 
        .C1(\uut_master/n99 ), .C2(\uut_master/n47 ), .A(\uut_master/n214 ), 
        .ZN(\uut_master/N39 ) );
  NAND2_X1 \uut_master/U177  ( .A1(data_in[9]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n214 ) );
  OAI221_X1 \uut_master/U176  ( .B1(\uut_master/n101 ), .B2(\uut_master/n11 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n100 ), .A(\uut_master/n213 ), 
        .ZN(\uut_master/N38 ) );
  NAND2_X1 \uut_master/U175  ( .A1(data_in[8]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n213 ) );
  OAI221_X1 \uut_master/U174  ( .B1(\uut_master/n32 ), .B2(\uut_master/n102 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n101 ), .A(\uut_master/n212 ), 
        .ZN(\uut_master/N37 ) );
  NAND2_X1 \uut_master/U173  ( .A1(data_in[7]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n212 ) );
  OAI221_X1 \uut_master/U172  ( .B1(\uut_master/n103 ), .B2(\uut_master/n10 ), 
        .C1(\uut_master/n13 ), .C2(\uut_master/n102 ), .A(\uut_master/n211 ), 
        .ZN(\uut_master/N36 ) );
  NAND2_X1 \uut_master/U171  ( .A1(data_in[6]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n211 ) );
  OAI221_X1 \uut_master/U170  ( .B1(\uut_master/n104 ), .B2(\uut_master/n12 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n103 ), .A(\uut_master/n210 ), 
        .ZN(\uut_master/N35 ) );
  NAND2_X1 \uut_master/U169  ( .A1(data_in[5]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n210 ) );
  OAI221_X1 \uut_master/U168  ( .B1(\uut_master/n105 ), .B2(\uut_master/n11 ), 
        .C1(\uut_master/n47 ), .C2(\uut_master/n104 ), .A(\uut_master/n209 ), 
        .ZN(\uut_master/N34 ) );
  NAND2_X1 \uut_master/U167  ( .A1(data_in[4]), .A2(\uut_master/n129 ), .ZN(
        \uut_master/n209 ) );
  OAI221_X1 \uut_master/U166  ( .B1(\uut_master/n106 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n105 ), .A(\uut_master/n208 ), 
        .ZN(\uut_master/N33 ) );
  NAND2_X1 \uut_master/U165  ( .A1(data_in[3]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n208 ) );
  OAI221_X1 \uut_master/U164  ( .B1(\uut_master/n107 ), .B2(\uut_master/n304 ), 
        .C1(\uut_master/n52 ), .C2(\uut_master/n106 ), .A(\uut_master/n207 ), 
        .ZN(\uut_master/N32 ) );
  NAND2_X1 \uut_master/U163  ( .A1(data_in[2]), .A2(\uut_master/n128 ), .ZN(
        \uut_master/n207 ) );
  OAI221_X1 \uut_master/U162  ( .B1(\uut_master/n31 ), .B2(\uut_master/n108 ), 
        .C1(\uut_master/n13 ), .C2(\uut_master/n107 ), .A(\uut_master/n206 ), 
        .ZN(\uut_master/N31 ) );
  NAND2_X1 \uut_master/U161  ( .A1(data_in[1]), .A2(\uut_master/n127 ), .ZN(
        \uut_master/n206 ) );
  NAND2_X1 \uut_master/U160  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n46 ), .ZN(\uut_master/n240 ) );
  INV_X1 \uut_master/U159  ( .A(\uut_master/n205 ), .ZN(\uut_master/n33 ) );
  AOI22_X1 \uut_master/U158  ( .A1(\uut_master/data_save_shifted [1]), .A2(
        \uut_master/n140 ), .B1(\uut_master/n129 ), .B2(data_in[0]), .ZN(
        \uut_master/n205 ) );
  NAND2_X1 \uut_master/U157  ( .A1(\uut_master/n203 ), .A2(\uut_master/n307 ), 
        .ZN(\uut_master/n204 ) );
  NOR4_X1 \uut_master/U156  ( .A1(\uut_master/n202 ), .A2(\uut_master/n201 ), 
        .A3(command[2]), .A4(command[3]), .ZN(\uut_master/n203 ) );
  NAND3_X1 \uut_master/U155  ( .A1(\uut_master/n44 ), .A2(\uut_master/n288 ), 
        .A3(\uut_master/n289 ), .ZN(\uut_master/n201 ) );
  INV_X1 \uut_master/U154  ( .A(command[1]), .ZN(\uut_master/n289 ) );
  INV_X1 \uut_master/U153  ( .A(command[0]), .ZN(\uut_master/n288 ) );
  NAND4_X1 \uut_master/U152  ( .A1(\uut_master/n297 ), .A2(\uut_master/n295 ), 
        .A3(\uut_master/n301 ), .A4(\uut_master/n299 ), .ZN(\uut_master/n202 )
         );
  INV_X1 \uut_master/U151  ( .A(command[6]), .ZN(\uut_master/n299 ) );
  INV_X1 \uut_master/U150  ( .A(command[7]), .ZN(\uut_master/n301 ) );
  INV_X1 \uut_master/U149  ( .A(command[4]), .ZN(\uut_master/n295 ) );
  INV_X1 \uut_master/U148  ( .A(command[5]), .ZN(\uut_master/n297 ) );
  NAND2_X1 \uut_master/U147  ( .A1(\uut_master/n23 ), .A2(\uut_master/n27 ), 
        .ZN(\uut_master/n237 ) );
  OAI22_X1 \uut_master/U146  ( .A1(\uut_master/n115 ), .A2(\uut_master/n200 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n199 ), .ZN(\uut_master/n344 )
         );
  OAI22_X1 \uut_master/U145  ( .A1(\uut_master/n116 ), .A2(\uut_master/n198 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n200 ), .ZN(\uut_master/n343 )
         );
  OAI22_X1 \uut_master/U144  ( .A1(\uut_master/n138 ), .A2(\uut_master/n197 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n198 ), .ZN(\uut_master/n342 )
         );
  OAI22_X1 \uut_master/U143  ( .A1(\uut_master/n115 ), .A2(\uut_master/n196 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n197 ), .ZN(\uut_master/n341 )
         );
  OAI22_X1 \uut_master/U142  ( .A1(\uut_master/n137 ), .A2(\uut_master/n195 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n196 ), .ZN(\uut_master/n340 )
         );
  OAI22_X1 \uut_master/U141  ( .A1(\uut_master/n139 ), .A2(\uut_master/n194 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n195 ), .ZN(\uut_master/n339 )
         );
  OAI22_X1 \uut_master/U140  ( .A1(\uut_master/n115 ), .A2(\uut_master/n193 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n194 ), .ZN(\uut_master/n338 )
         );
  OAI22_X1 \uut_master/U139  ( .A1(\uut_master/n137 ), .A2(\uut_master/n192 ), 
        .B1(\uut_master/n8 ), .B2(\uut_master/n193 ), .ZN(\uut_master/n337 )
         );
  OAI22_X1 \uut_master/U138  ( .A1(\uut_master/n116 ), .A2(\uut_master/n191 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n192 ), .ZN(\uut_master/n336 )
         );
  OAI22_X1 \uut_master/U137  ( .A1(\uut_master/n139 ), .A2(\uut_master/n190 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n191 ), .ZN(\uut_master/n335 )
         );
  OAI22_X1 \uut_master/U136  ( .A1(\uut_master/n139 ), .A2(\uut_master/n189 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n190 ), .ZN(\uut_master/n334 )
         );
  OAI22_X1 \uut_master/U135  ( .A1(\uut_master/n137 ), .A2(\uut_master/n188 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n189 ), .ZN(\uut_master/n333 )
         );
  OAI22_X1 \uut_master/U134  ( .A1(\uut_master/n138 ), .A2(\uut_master/n187 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n188 ), .ZN(\uut_master/n332 )
         );
  OAI22_X1 \uut_master/U133  ( .A1(\uut_master/n138 ), .A2(\uut_master/n186 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n187 ), .ZN(\uut_master/n331 )
         );
  OAI22_X1 \uut_master/U132  ( .A1(\uut_master/n116 ), .A2(\uut_master/n185 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n186 ), .ZN(\uut_master/n330 )
         );
  OAI22_X1 \uut_master/U131  ( .A1(\uut_master/n138 ), .A2(\uut_master/n184 ), 
        .B1(\uut_master/n9 ), .B2(\uut_master/n185 ), .ZN(\uut_master/n329 )
         );
  OAI22_X1 \uut_master/U130  ( .A1(\uut_master/n115 ), .A2(\uut_master/n180 ), 
        .B1(\uut_master/n18 ), .B2(\uut_master/n184 ), .ZN(\uut_master/n328 )
         );
  OAI22_X1 \uut_master/U129  ( .A1(\uut_master/n138 ), .A2(\uut_master/n178 ), 
        .B1(\uut_master/n19 ), .B2(\uut_master/n180 ), .ZN(\uut_master/n327 )
         );
  OAI22_X1 \uut_master/U128  ( .A1(\uut_master/n116 ), .A2(\uut_master/n177 ), 
        .B1(\uut_master/n18 ), .B2(\uut_master/n178 ), .ZN(\uut_master/n326 )
         );
  OAI22_X1 \uut_master/U127  ( .A1(\uut_master/n116 ), .A2(\uut_master/n176 ), 
        .B1(\uut_master/n19 ), .B2(\uut_master/n177 ), .ZN(\uut_master/n325 )
         );
  OAI22_X1 \uut_master/U126  ( .A1(\uut_master/n115 ), .A2(\uut_master/n175 ), 
        .B1(\uut_master/n18 ), .B2(\uut_master/n176 ), .ZN(\uut_master/n324 )
         );
  OAI22_X1 \uut_master/U125  ( .A1(\uut_master/n139 ), .A2(\uut_master/n174 ), 
        .B1(\uut_master/n19 ), .B2(\uut_master/n175 ), .ZN(\uut_master/n323 )
         );
  OAI22_X1 \uut_master/U124  ( .A1(\uut_master/n138 ), .A2(\uut_master/n173 ), 
        .B1(\uut_master/n18 ), .B2(\uut_master/n174 ), .ZN(\uut_master/n322 )
         );
  OAI22_X1 \uut_master/U123  ( .A1(\uut_master/n137 ), .A2(\uut_master/n172 ), 
        .B1(\uut_master/n19 ), .B2(\uut_master/n173 ), .ZN(\uut_master/n321 )
         );
  OAI22_X1 \uut_master/U122  ( .A1(\uut_master/n116 ), .A2(\uut_master/n171 ), 
        .B1(\uut_master/n18 ), .B2(\uut_master/n172 ), .ZN(\uut_master/n320 )
         );
  OAI22_X1 \uut_master/U121  ( .A1(\uut_master/n139 ), .A2(\uut_master/n170 ), 
        .B1(\uut_master/n19 ), .B2(\uut_master/n171 ), .ZN(\uut_master/n319 )
         );
  OAI22_X1 \uut_master/U120  ( .A1(\uut_master/n137 ), .A2(\uut_master/n169 ), 
        .B1(\uut_master/n179 ), .B2(\uut_master/n170 ), .ZN(\uut_master/n318 )
         );
  OAI22_X1 \uut_master/U119  ( .A1(\uut_master/n139 ), .A2(\uut_master/n168 ), 
        .B1(\uut_master/n179 ), .B2(\uut_master/n169 ), .ZN(\uut_master/n317 )
         );
  OAI22_X1 \uut_master/U118  ( .A1(\uut_master/n115 ), .A2(\uut_master/n167 ), 
        .B1(\uut_master/n179 ), .B2(\uut_master/n168 ), .ZN(\uut_master/n316 )
         );
  OAI22_X1 \uut_master/U117  ( .A1(\uut_master/n137 ), .A2(\uut_master/n166 ), 
        .B1(\uut_master/n179 ), .B2(\uut_master/n167 ), .ZN(\uut_master/n315 )
         );
  OAI22_X1 \uut_master/U116  ( .A1(\uut_master/n116 ), .A2(\uut_master/n165 ), 
        .B1(\uut_master/n179 ), .B2(\uut_master/n166 ), .ZN(\uut_master/n314 )
         );
  INV_X1 \uut_master/U115  ( .A(\uut_master/n163 ), .ZN(\uut_master/n313 ) );
  AOI22_X1 \uut_master/U114  ( .A1(data_out[0]), .A2(\uut_master/n164 ), .B1(
        miso), .B2(\uut_master/n131 ), .ZN(\uut_master/n163 ) );
  NAND3_X1 \uut_master/U113  ( .A1(\uut_master/n183 ), .A2(\uut_master/n182 ), 
        .A3(\uut_master/n181 ), .ZN(\uut_master/n164 ) );
  OAI21_X1 \uut_master/U112  ( .B1(\uut_master/n22 ), .B2(\uut_master/n126 ), 
        .A(\uut_master/n44 ), .ZN(\uut_master/n181 ) );
  NAND2_X1 \uut_master/U111  ( .A1(\uut_master/n44 ), .A2(\uut_master/n161 ), 
        .ZN(\uut_master/n182 ) );
  OAI21_X1 \uut_master/U110  ( .B1(\uut_master/n21 ), .B2(
        \uut_master/data_end ), .A(\uut_master/n44 ), .ZN(\uut_master/n183 )
         );
  OAI33_X1 \uut_master/U109  ( .A1(\uut_master/n160 ), .A2(\uut_master/n158 ), 
        .A3(\uut_master/n159 ), .B1(\uut_master/n157 ), .B2(\uut_master/n161 ), 
        .B3(\uut_master/n3 ), .ZN(\uut_master/N99 ) );
  OAI33_X1 \uut_master/U108  ( .A1(\uut_master/n160 ), .A2(\uut_master/n159 ), 
        .A3(\uut_master/n155 ), .B1(\uut_master/n157 ), .B2(\uut_master/n48 ), 
        .B3(\uut_master/n3 ), .ZN(\uut_master/N98 ) );
  XOR2_X1 \uut_master/U107  ( .A(\uut_master/n156 ), .B(
        \uut_master/data_count [4]), .Z(\uut_master/n155 ) );
  NAND4_X1 \uut_master/U106  ( .A1(\uut_master/data_count [1]), .A2(
        \uut_master/data_count [2]), .A3(\uut_master/data_count [0]), .A4(
        \uut_master/data_count [3]), .ZN(\uut_master/n156 ) );
  OAI33_X1 \uut_master/U105  ( .A1(\uut_master/n160 ), .A2(\uut_master/n159 ), 
        .A3(\uut_master/n154 ), .B1(\uut_master/n2 ), .B2(\uut_master/n50 ), 
        .B3(\uut_master/n157 ), .ZN(\uut_master/N96 ) );
  XOR2_X1 \uut_master/U104  ( .A(\uut_master/n153 ), .B(
        \uut_master/data_count [2]), .Z(\uut_master/n154 ) );
  OAI33_X1 \uut_master/U103  ( .A1(\uut_master/n160 ), .A2(\uut_master/n159 ), 
        .A3(\uut_master/data_count [0]), .B1(\uut_master/n157 ), .B2(
        \uut_master/n151 ), .B3(\uut_master/n2 ), .ZN(\uut_master/N94 ) );
  OAI33_X1 \uut_master/U102  ( .A1(\uut_master/n160 ), .A2(\uut_master/n159 ), 
        .A3(\uut_master/n152 ), .B1(\uut_master/n51 ), .B2(\uut_master/n157 ), 
        .B3(\uut_master/n2 ), .ZN(\uut_master/N95 ) );
  XOR2_X1 \uut_master/U101  ( .A(\uut_master/n151 ), .B(
        \uut_master/data_count [1]), .Z(\uut_master/n152 ) );
  OAI33_X1 \uut_master/U100  ( .A1(\uut_master/n160 ), .A2(\uut_master/n159 ), 
        .A3(\uut_master/n150 ), .B1(\uut_master/n157 ), .B2(\uut_master/n49 ), 
        .B3(\uut_master/n2 ), .ZN(\uut_master/N97 ) );
  XOR2_X1 \uut_master/U99  ( .A(\uut_master/n149 ), .B(\uut_master/n6 ), .Z(
        \uut_master/n150 ) );
  NAND2_X1 \uut_master/U98  ( .A1(\uut_master/n148 ), .A2(
        \uut_master/data_count [2]), .ZN(\uut_master/n149 ) );
  INV_X1 \uut_master/U97  ( .A(\uut_master/n153 ), .ZN(\uut_master/n148 ) );
  NAND2_X1 \uut_master/U96  ( .A1(\uut_master/data_count [0]), .A2(
        \uut_master/data_count [1]), .ZN(\uut_master/n153 ) );
  INV_X1 \uut_master/U95  ( .A(\uut_master/n147 ), .ZN(\uut_master/n159 ) );
  NAND3_X1 \uut_master/U94  ( .A1(\uut_master/n157 ), .A2(\uut_master/n146 ), 
        .A3(\uut_master/n44 ), .ZN(\uut_master/n160 ) );
  NOR3_X1 \uut_master/U93  ( .A1(\uut_master/n145 ), .A2(\uut_master/n5 ), 
        .A3(\uut_master/n22 ), .ZN(\uut_master/N150 ) );
  NAND2_X1 \uut_master/U92  ( .A1(enable), .A2(\uut_master/n44 ), .ZN(
        \uut_master/n145 ) );
  OAI21_X1 \uut_master/U91  ( .B1(\uut_master/n45 ), .B2(\uut_master/n14 ), 
        .A(\uut_master/n144 ), .ZN(\uut_master/n312 ) );
  NAND3_X1 \uut_master/U90  ( .A1(\uut_master/n143 ), .A2(\uut_master/n118 ), 
        .A3(\uut_master/n46 ), .ZN(\uut_master/n144 ) );
  INV_X1 \uut_master/U89  ( .A(\uut_master/n109 ), .ZN(\uut_master/n143 ) );
  NAND2_X1 \uut_master/U88  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n44 ), .ZN(\uut_master/n308 ) );
  NOR4_X1 \uut_master/U87  ( .A1(\uut_master/n147 ), .A2(\uut_master/n3 ), 
        .A3(\uut_master/n142 ), .A4(\uut_master/n45 ), .ZN(\uut_master/N100 )
         );
  INV_X1 \uut_master/U86  ( .A(\uut_master/n157 ), .ZN(\uut_master/n142 ) );
  NAND3_X1 \uut_master/U85  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n44 ), .A3(\uut_master/n46 ), .ZN(\uut_master/n157 ) );
  NAND3_X1 \uut_master/U84  ( .A1(\uut_master/data_count [4]), .A2(
        \uut_master/data_count [3]), .A3(\uut_master/n141 ), .ZN(
        \uut_master/n147 ) );
  NOR4_X1 \uut_master/U83  ( .A1(\uut_master/n161 ), .A2(\uut_master/n151 ), 
        .A3(\uut_master/n50 ), .A4(\uut_master/n51 ), .ZN(\uut_master/n141 )
         );
  NOR2_X1 \uut_master/U82  ( .A1(\uut_master/n1 ), .A2(cs), .ZN(
        \uut_master/N20 ) );
  OAI21_X1 \uut_master/U81  ( .B1(\uut_master/n146 ), .B2(\uut_master/n7 ), 
        .A(\uut_master/n44 ), .ZN(cs) );
  INV_X1 \uut_master/U80  ( .A(\uut_master/n307 ), .ZN(\uut_master/n146 ) );
  NOR2_X1 \uut_master/U79  ( .A1(\uut_master/n308 ), .A2(\uut_master/n20 ), 
        .ZN(\uut_master/n310 ) );
  AND2_X2 \uut_master/U78  ( .A1(\uut_master/n26 ), .A2(\uut_master/n240 ), 
        .ZN(\uut_master/n136 ) );
  INV_X1 \uut_master/U77  ( .A(\uut_master/n237 ), .ZN(\uut_master/n140 ) );
  AND2_X1 \uut_master/U76  ( .A1(\uut_master/n118 ), .A2(
        \uut_master/data_count [5]), .ZN(\uut_master/n133 ) );
  AND4_X1 \uut_master/U75  ( .A1(\uut_master/n162 ), .A2(\uut_master/n44 ), 
        .A3(\uut_master/clock_count ), .A4(\uut_master/n46 ), .ZN(
        \uut_master/n132 ) );
  INV_X1 \uut_master/U74  ( .A(\uut_master/n24 ), .ZN(\uut_master/n138 ) );
  AND2_X1 \uut_master/U73  ( .A1(\uut_master/n132 ), .A2(\uut_master/n133 ), 
        .ZN(\uut_master/n131 ) );
  INV_X1 \uut_master/U72  ( .A(\uut_master/n111 ), .ZN(\uut_master/n162 ) );
  INV_X1 \uut_master/U71  ( .A(\uut_master/n302 ), .ZN(\uut_master/n130 ) );
  INV_X1 \uut_master/U70  ( .A(\uut_master/n204 ), .ZN(\uut_master/n129 ) );
  INV_X1 \uut_master/U69  ( .A(\uut_master/n204 ), .ZN(\uut_master/n128 ) );
  INV_X1 \uut_master/U68  ( .A(\uut_master/n204 ), .ZN(\uut_master/n127 ) );
  AOI22_X1 \uut_master/U67  ( .A1(\uut_master/n310 ), .A2(\uut_master/n311 ), 
        .B1(\uut_master/n309 ), .B2(\uut_master/n20 ), .ZN(sck) );
  INV_X1 \uut_master/U66  ( .A(\uut_master/n302 ), .ZN(\uut_master/n120 ) );
  NAND2_X1 \uut_master/U65  ( .A1(\uut_master/n27 ), .A2(\uut_master/n117 ), 
        .ZN(\uut_master/n305 ) );
  AND3_X2 \uut_master/U64  ( .A1(\uut_master/n162 ), .A2(\uut_master/n44 ), 
        .A3(\uut_master/n46 ), .ZN(\uut_master/n117 ) );
  INV_X1 \uut_master/U63  ( .A(\uut_master/n24 ), .ZN(\uut_master/n137 ) );
  INV_X1 \uut_master/U62  ( .A(\uut_master/n131 ), .ZN(\uut_master/n139 ) );
  INV_X1 \uut_master/U61  ( .A(\uut_master/n24 ), .ZN(\uut_master/n116 ) );
  INV_X1 \uut_master/U60  ( .A(\uut_master/n131 ), .ZN(\uut_master/n115 ) );
  NAND2_X2 \uut_master/U59  ( .A1(\uut_master/n26 ), .A2(\uut_master/n240 ), 
        .ZN(\uut_master/n304 ) );
  NAND2_X1 \uut_master/U58  ( .A1(\uut_master/n26 ), .A2(\uut_master/n240 ), 
        .ZN(\uut_master/n113 ) );
  NAND2_X1 \uut_master/U57  ( .A1(\uut_master/n23 ), .A2(\uut_master/n27 ), 
        .ZN(\uut_master/n134 ) );
  NAND2_X1 \uut_master/U56  ( .A1(\uut_master/n27 ), .A2(\uut_master/n117 ), 
        .ZN(\uut_master/n124 ) );
  NAND2_X1 \uut_master/U55  ( .A1(\uut_master/n27 ), .A2(\uut_master/n23 ), 
        .ZN(\uut_master/n123 ) );
  NAND2_X1 \uut_master/U54  ( .A1(\uut_master/n27 ), .A2(\uut_master/n117 ), 
        .ZN(\uut_master/n112 ) );
  NAND2_X1 \uut_master/U53  ( .A1(\uut_master/n27 ), .A2(\uut_master/n117 ), 
        .ZN(\uut_master/n110 ) );
  NOR3_X1 \uut_master/U52  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n126 ), .A3(\uut_master/n45 ), .ZN(\uut_master/n309 ) );
  CLKBUF_X1 \uut_master/U51  ( .A(\uut_master/n308 ), .Z(\uut_master/n109 ) );
  BUF_X2 \uut_master/U50  ( .A(\uut_master/n123 ), .Z(\uut_master/n52 ) );
  BUF_X2 \uut_master/U49  ( .A(\uut_master/n43 ), .Z(\uut_master/n47 ) );
  OR2_X2 \uut_master/U48  ( .A1(\uut_master/n111 ), .A2(
        \uut_master/current_state [0]), .ZN(\uut_master/n307 ) );
  AND2_X2 \uut_master/U47  ( .A1(\uut_master/n26 ), .A2(\uut_master/n240 ), 
        .ZN(\uut_master/n135 ) );
  NAND2_X1 \uut_master/U46  ( .A1(\uut_master/n23 ), .A2(\uut_master/n27 ), 
        .ZN(\uut_master/n43 ) );
  NAND2_X1 \uut_master/U45  ( .A1(\uut_master/n27 ), .A2(\uut_master/n117 ), 
        .ZN(\uut_master/n34 ) );
  BUF_X1 \uut_master/U44  ( .A(\uut_master/n113 ), .Z(\uut_master/n32 ) );
  BUF_X1 \uut_master/U43  ( .A(\uut_master/n113 ), .Z(\uut_master/n31 ) );
  BUF_X1 \uut_master/U42  ( .A(\uut_master/n113 ), .Z(\uut_master/n30 ) );
  XNOR2_X1 \uut_master/U40  ( .A(\uut_master/n28 ), .B(
        \uut_master/data_count [5]), .ZN(\uut_master/n158 ) );
  AND2_X2 \uut_master/U39  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n118 ), .ZN(\uut_master/n27 ) );
  AND3_X2 \uut_master/U38  ( .A1(\uut_master/n162 ), .A2(\uut_master/n44 ), 
        .A3(\uut_master/n118 ), .ZN(\uut_master/n26 ) );
  NOR2_X1 \uut_master/U37  ( .A1(\uut_master/data_end ), .A2(\uut_master/n126 ), .ZN(\uut_master/n311 ) );
  INV_X1 \uut_master/U36  ( .A(\uut_master/n45 ), .ZN(\uut_master/n44 ) );
  AND2_X2 \uut_master/U35  ( .A1(\uut_master/n307 ), .A2(\uut_master/n44 ), 
        .ZN(\uut_master/n122 ) );
  AND2_X2 \uut_master/U34  ( .A1(\uut_master/n132 ), .A2(\uut_master/n133 ), 
        .ZN(\uut_master/n24 ) );
  BUF_X1 \uut_master/U33  ( .A(rst), .Z(\uut_master/n45 ) );
  AND3_X2 \uut_master/U32  ( .A1(\uut_master/n162 ), .A2(\uut_master/n44 ), 
        .A3(\uut_master/n46 ), .ZN(\uut_master/n23 ) );
  BUF_X1 \uut_master/U31  ( .A(\uut_master/current_state [0]), .Z(
        \uut_master/n20 ) );
  INV_X1 \uut_master/U30  ( .A(\uut_master/n164 ), .ZN(\uut_master/n179 ) );
  INV_X1 \uut_master/U29  ( .A(\uut_master/n164 ), .ZN(\uut_master/n19 ) );
  INV_X1 \uut_master/U28  ( .A(\uut_master/n164 ), .ZN(\uut_master/n18 ) );
  INV_X1 \uut_master/U27  ( .A(\uut_master/n302 ), .ZN(\uut_master/n17 ) );
  CLKBUF_X1 \uut_master/U26  ( .A(\uut_master/n111 ), .Z(\uut_master/n21 ) );
  NAND2_X1 \uut_master/U25  ( .A1(\uut_master/n23 ), .A2(\uut_master/n27 ), 
        .ZN(\uut_master/n16 ) );
  INV_X1 \uut_master/U24  ( .A(\uut_master/n122 ), .ZN(\uut_master/n125 ) );
  INV_X1 \uut_master/U23  ( .A(\uut_master/n122 ), .ZN(\uut_master/n15 ) );
  BUF_X1 \uut_master/U22  ( .A(\uut_master/current_state [0]), .Z(
        \uut_master/n22 ) );
  INV_X1 \uut_master/U21  ( .A(\uut_master/n7 ), .ZN(\uut_master/n14 ) );
  BUF_X1 \uut_master/U20  ( .A(\uut_master/n123 ), .Z(\uut_master/n121 ) );
  BUF_X1 \uut_master/U19  ( .A(\uut_master/n123 ), .Z(\uut_master/n13 ) );
  NAND2_X1 \uut_master/U18  ( .A1(\uut_master/n26 ), .A2(\uut_master/n240 ), 
        .ZN(\uut_master/n114 ) );
  BUF_X1 \uut_master/U17  ( .A(\uut_master/n114 ), .Z(\uut_master/n12 ) );
  BUF_X1 \uut_master/U16  ( .A(\uut_master/n114 ), .Z(\uut_master/n11 ) );
  BUF_X1 \uut_master/U15  ( .A(\uut_master/n114 ), .Z(\uut_master/n10 ) );
  AND3_X1 \uut_master/U14  ( .A1(\uut_master/n183 ), .A2(\uut_master/n182 ), 
        .A3(\uut_master/n181 ), .ZN(\uut_master/n25 ) );
  CLKBUF_X3 \uut_master/U13  ( .A(\uut_master/n25 ), .Z(\uut_master/n8 ) );
  AND2_X1 \uut_master/U12  ( .A1(\uut_master/n21 ), .A2(\uut_master/n22 ), 
        .ZN(\uut_master/n7 ) );
  NOR2_X1 \uut_master/U11  ( .A1(\uut_master/n156 ), .A2(\uut_master/n48 ), 
        .ZN(\uut_master/n28 ) );
  INV_X1 \uut_master/U10  ( .A(\uut_master/n49 ), .ZN(\uut_master/n6 ) );
  INV_X1 \uut_master/U9  ( .A(\uut_master/n21 ), .ZN(\uut_master/n5 ) );
  NAND2_X1 \uut_master/U8  ( .A1(\uut_master/n27 ), .A2(\uut_master/n117 ), 
        .ZN(\uut_master/n4 ) );
  CLKBUF_X1 \uut_master/U7  ( .A(\uut_master/n307 ), .Z(\uut_master/n119 ) );
  CLKBUF_X3 \uut_master/U6  ( .A(\uut_master/n25 ), .Z(\uut_master/n9 ) );
  BUF_X1 \uut_master/U5  ( .A(\uut_master/n119 ), .Z(\uut_master/n3 ) );
  BUF_X1 \uut_master/U4  ( .A(\uut_master/n119 ), .Z(\uut_master/n2 ) );
  INV_X1 \uut_master/U3  ( .A(\uut_master/n126 ), .ZN(\uut_master/n1 ) );
  DFF_X2 \uut_master/data_save_reg[26]  ( .D(\uut_master/N56 ), .CK(clk), .QN(
        \uut_master/n82 ) );
  DFF_X2 \uut_master/data_save_reg[30]  ( .D(\uut_master/N60 ), .CK(clk), .QN(
        \uut_master/n78 ) );
  DFF_X2 \uut_master/data_save_reg[14]  ( .D(\uut_master/N44 ), .CK(clk), .QN(
        \uut_master/n94 ) );
  DFF_X2 \uut_master/data_save_reg[56]  ( .D(\uut_master/n35 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [57]), .QN(\uut_master/n290 ) );
  DFF_X2 \uut_master/data_save_reg[62]  ( .D(\uut_master/n41 ), .CK(clk), .QN(
        \uut_master/n303 ) );
  DFF_X2 \uut_master/data_save_reg[63]  ( .D(\uut_master/n42 ), .CK(clk), .QN(
        \uut_master/n306 ) );
  DFF_X1 \uut_master/data_in_reg[0]  ( .D(\uut_master/n313 ), .CK(clk), .Q(
        data_out[0]), .QN(\uut_master/n165 ) );
  SDFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/N150 ), .SI(1'b0), 
        .SE(1'b0), .CK(clk), .Q(\uut_master/current_state [0]), .QN(
        \uut_master/n118 ) );
  DFF_X1 \uut_master/current_state_reg[1]  ( .D(\uut_master/n312 ), .CK(clk), 
        .Q(\uut_master/current_state [1]), .QN(\uut_master/n111 ) );
  DFF_X1 \uut_master/clock_count_reg  ( .D(\uut_master/N20 ), .CK(clk), .Q(
        \uut_master/clock_count ), .QN(\uut_master/n126 ) );
  DFF_X1 \uut_master/data_end_reg  ( .D(\uut_master/N100 ), .CK(clk), .Q(
        \uut_master/data_end ), .QN(\uut_master/n46 ) );
  DFF_X1 \uut_master/data_count_reg[0]  ( .D(\uut_master/N94 ), .CK(clk), .Q(
        \uut_master/data_count [0]), .QN(\uut_master/n151 ) );
  DFF_X1 \uut_master/data_save_reg[3]  ( .D(\uut_master/N33 ), .CK(clk), .QN(
        \uut_master/n105 ) );
  DFF_X1 \uut_master/data_save_reg[29]  ( .D(\uut_master/N59 ), .CK(clk), .QN(
        \uut_master/n79 ) );
  DFF_X1 \uut_master/data_save_reg[8]  ( .D(\uut_master/N38 ), .CK(clk), .QN(
        \uut_master/n100 ) );
  DFF_X1 \uut_master/data_save_reg[10]  ( .D(\uut_master/N40 ), .CK(clk), .QN(
        \uut_master/n98 ) );
  DFF_X1 \uut_master/data_save_reg[11]  ( .D(\uut_master/N41 ), .CK(clk), .QN(
        \uut_master/n97 ) );
  DFF_X1 \uut_master/data_save_reg[13]  ( .D(\uut_master/N43 ), .CK(clk), .QN(
        \uut_master/n95 ) );
  DFF_X1 \uut_master/data_save_reg[17]  ( .D(\uut_master/N47 ), .CK(clk), .QN(
        \uut_master/n91 ) );
  DFF_X1 \uut_master/data_save_reg[18]  ( .D(\uut_master/N48 ), .CK(clk), .QN(
        \uut_master/n90 ) );
  DFF_X1 \uut_master/data_save_reg[19]  ( .D(\uut_master/N49 ), .CK(clk), .QN(
        \uut_master/n89 ) );
  DFF_X1 \uut_master/data_save_reg[21]  ( .D(\uut_master/N51 ), .CK(clk), .QN(
        \uut_master/n87 ) );
  DFF_X1 \uut_master/data_save_reg[25]  ( .D(\uut_master/N55 ), .CK(clk), .QN(
        \uut_master/n83 ) );
  DFF_X1 \uut_master/data_save_reg[28]  ( .D(\uut_master/N58 ), .CK(clk), .QN(
        \uut_master/n80 ) );
  DFF_X1 \uut_master/data_save_reg[4]  ( .D(\uut_master/N34 ), .CK(clk), .QN(
        \uut_master/n104 ) );
  DFF_X1 \uut_master/data_save_reg[5]  ( .D(\uut_master/N35 ), .CK(clk), .QN(
        \uut_master/n103 ) );
  DFF_X1 \uut_master/data_save_reg[16]  ( .D(\uut_master/N46 ), .CK(clk), .QN(
        \uut_master/n92 ) );
  DFF_X1 \uut_master/data_save_reg[9]  ( .D(\uut_master/N39 ), .CK(clk), .QN(
        \uut_master/n99 ) );
  DFF_X1 \uut_master/data_save_reg[23]  ( .D(\uut_master/N53 ), .CK(clk), .QN(
        \uut_master/n85 ) );
  DFF_X1 \uut_master/data_save_reg[1]  ( .D(\uut_master/N31 ), .CK(clk), .QN(
        \uut_master/n107 ) );
  DFF_X1 \uut_master/data_save_reg[20]  ( .D(\uut_master/N50 ), .CK(clk), .QN(
        \uut_master/n88 ) );
  DFF_X1 \uut_master/data_save_reg[24]  ( .D(\uut_master/N54 ), .CK(clk), .QN(
        \uut_master/n84 ) );
  DFF_X1 \uut_master/data_save_reg[6]  ( .D(\uut_master/N36 ), .CK(clk), .QN(
        \uut_master/n102 ) );
  DFF_X1 \uut_master/data_save_reg[15]  ( .D(\uut_master/N45 ), .CK(clk), .QN(
        \uut_master/n93 ) );
  DFF_X1 \uut_master/data_save_reg[2]  ( .D(\uut_master/N32 ), .CK(clk), .QN(
        \uut_master/n106 ) );
  DFF_X1 \uut_master/data_save_reg[27]  ( .D(\uut_master/N57 ), .CK(clk), .QN(
        \uut_master/n81 ) );
  DFF_X1 \uut_master/data_save_reg[12]  ( .D(\uut_master/N42 ), .CK(clk), .QN(
        \uut_master/n96 ) );
  DFF_X1 \uut_master/data_save_reg[22]  ( .D(\uut_master/N52 ), .CK(clk), .QN(
        \uut_master/n86 ) );
  DFF_X1 \uut_master/data_save_reg[7]  ( .D(\uut_master/N37 ), .CK(clk), .QN(
        \uut_master/n101 ) );
  DFF_X1 \uut_master/data_save_reg[61]  ( .D(\uut_master/n40 ), .CK(clk), .QN(
        \uut_master/n300 ) );
  DFF_X1 \uut_master/data_save_reg[60]  ( .D(\uut_master/n39 ), .CK(clk), .QN(
        \uut_master/n298 ) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n329 ), .CK(clk), .Q(
        data_out[16]), .QN(\uut_master/n185 ) );
  DFF_X1 \uut_master/data_in_reg[18]  ( .D(\uut_master/n331 ), .CK(clk), .Q(
        data_out[18]), .QN(\uut_master/n187 ) );
  DFF_X1 \uut_master/data_in_reg[19]  ( .D(\uut_master/n332 ), .CK(clk), .Q(
        data_out[19]), .QN(\uut_master/n188 ) );
  DFF_X1 \uut_master/data_in_reg[29]  ( .D(\uut_master/n342 ), .CK(clk), .Q(
        data_out[29]), .QN(\uut_master/n198 ) );
  DFF_X1 \uut_master/data_in_reg[1]  ( .D(\uut_master/n314 ), .CK(clk), .Q(
        data_out[1]), .QN(\uut_master/n166 ) );
  DFF_X1 \uut_master/data_in_reg[9]  ( .D(\uut_master/n322 ), .CK(clk), .Q(
        data_out[9]), .QN(\uut_master/n174 ) );
  DFF_X1 \uut_master/data_in_reg[14]  ( .D(\uut_master/n327 ), .CK(clk), .Q(
        data_out[14]), .QN(\uut_master/n180 ) );
  DFF_X1 \uut_master/data_save_reg[57]  ( .D(\uut_master/n36 ), .CK(clk), .QN(
        \uut_master/n292 ) );
  DFF_X1 \uut_master/data_save_reg[59]  ( .D(\uut_master/n38 ), .CK(clk), .QN(
        \uut_master/n296 ) );
  DFF_X1 \uut_master/data_in_reg[17]  ( .D(\uut_master/n330 ), .CK(clk), .Q(
        data_out[17]), .QN(\uut_master/n186 ) );
  DFF_X1 \uut_master/data_in_reg[20]  ( .D(\uut_master/n333 ), .CK(clk), .Q(
        data_out[20]), .QN(\uut_master/n189 ) );
  DFF_X1 \uut_master/data_in_reg[21]  ( .D(\uut_master/n334 ), .CK(clk), .Q(
        data_out[21]), .QN(\uut_master/n190 ) );
  DFF_X1 \uut_master/data_in_reg[22]  ( .D(\uut_master/n335 ), .CK(clk), .Q(
        data_out[22]), .QN(\uut_master/n191 ) );
  DFF_X1 \uut_master/data_in_reg[23]  ( .D(\uut_master/n336 ), .CK(clk), .Q(
        data_out[23]), .QN(\uut_master/n192 ) );
  DFF_X1 \uut_master/data_in_reg[24]  ( .D(\uut_master/n337 ), .CK(clk), .Q(
        data_out[24]), .QN(\uut_master/n193 ) );
  DFF_X1 \uut_master/data_in_reg[25]  ( .D(\uut_master/n338 ), .CK(clk), .Q(
        data_out[25]), .QN(\uut_master/n194 ) );
  DFF_X1 \uut_master/data_in_reg[26]  ( .D(\uut_master/n339 ), .CK(clk), .Q(
        data_out[26]), .QN(\uut_master/n195 ) );
  DFF_X1 \uut_master/data_in_reg[27]  ( .D(\uut_master/n340 ), .CK(clk), .Q(
        data_out[27]), .QN(\uut_master/n196 ) );
  DFF_X1 \uut_master/data_in_reg[28]  ( .D(\uut_master/n341 ), .CK(clk), .Q(
        data_out[28]), .QN(\uut_master/n197 ) );
  DFF_X1 \uut_master/data_in_reg[30]  ( .D(\uut_master/n343 ), .CK(clk), .Q(
        data_out[30]), .QN(\uut_master/n200 ) );
  DFF_X1 \uut_master/data_in_reg[31]  ( .D(\uut_master/n344 ), .CK(clk), .Q(
        data_out[31]), .QN(\uut_master/n199 ) );
  DFF_X1 \uut_master/data_in_reg[2]  ( .D(\uut_master/n315 ), .CK(clk), .Q(
        data_out[2]), .QN(\uut_master/n167 ) );
  DFF_X1 \uut_master/data_in_reg[3]  ( .D(\uut_master/n316 ), .CK(clk), .Q(
        data_out[3]), .QN(\uut_master/n168 ) );
  DFF_X1 \uut_master/data_in_reg[4]  ( .D(\uut_master/n317 ), .CK(clk), .Q(
        data_out[4]), .QN(\uut_master/n169 ) );
  DFF_X1 \uut_master/data_in_reg[5]  ( .D(\uut_master/n318 ), .CK(clk), .Q(
        data_out[5]), .QN(\uut_master/n170 ) );
  DFF_X1 \uut_master/data_in_reg[6]  ( .D(\uut_master/n319 ), .CK(clk), .Q(
        data_out[6]), .QN(\uut_master/n171 ) );
  DFF_X1 \uut_master/data_in_reg[7]  ( .D(\uut_master/n320 ), .CK(clk), .Q(
        data_out[7]), .QN(\uut_master/n172 ) );
  DFF_X1 \uut_master/data_in_reg[8]  ( .D(\uut_master/n321 ), .CK(clk), .Q(
        data_out[8]), .QN(\uut_master/n173 ) );
  DFF_X1 \uut_master/data_in_reg[10]  ( .D(\uut_master/n323 ), .CK(clk), .Q(
        data_out[10]), .QN(\uut_master/n175 ) );
  DFF_X1 \uut_master/data_in_reg[11]  ( .D(\uut_master/n324 ), .CK(clk), .Q(
        data_out[11]), .QN(\uut_master/n176 ) );
  DFF_X1 \uut_master/data_in_reg[12]  ( .D(\uut_master/n325 ), .CK(clk), .Q(
        data_out[12]), .QN(\uut_master/n177 ) );
  DFF_X1 \uut_master/data_in_reg[13]  ( .D(\uut_master/n326 ), .CK(clk), .Q(
        data_out[13]), .QN(\uut_master/n178 ) );
  DFF_X1 \uut_master/data_in_reg[15]  ( .D(\uut_master/n328 ), .CK(clk), .Q(
        data_out[15]), .QN(\uut_master/n184 ) );
  DFF_X1 \uut_master/data_save_reg[58]  ( .D(\uut_master/n37 ), .CK(clk), .QN(
        \uut_master/n294 ) );
  DFF_X1 \uut_master/data_save_reg[32]  ( .D(\uut_master/N62 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [33]), .QN(\uut_master/n76 ) );
  DFF_X1 \uut_master/data_save_reg[33]  ( .D(\uut_master/N63 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [34]), .QN(\uut_master/n75 ) );
  DFF_X1 \uut_master/data_save_reg[34]  ( .D(\uut_master/N64 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [35]), .QN(\uut_master/n74 ) );
  DFF_X1 \uut_master/data_save_reg[35]  ( .D(\uut_master/N65 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [36]), .QN(\uut_master/n73 ) );
  DFF_X1 \uut_master/data_save_reg[37]  ( .D(\uut_master/N67 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [38]), .QN(\uut_master/n71 ) );
  DFF_X1 \uut_master/data_save_reg[38]  ( .D(\uut_master/N68 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [39]), .QN(\uut_master/n70 ) );
  DFF_X1 \uut_master/data_save_reg[39]  ( .D(\uut_master/N69 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [40]), .QN(\uut_master/n69 ) );
  DFF_X1 \uut_master/data_save_reg[40]  ( .D(\uut_master/N70 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [41]), .QN(\uut_master/n68 ) );
  DFF_X1 \uut_master/data_save_reg[41]  ( .D(\uut_master/N71 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [42]), .QN(\uut_master/n67 ) );
  DFF_X1 \uut_master/data_save_reg[42]  ( .D(\uut_master/N72 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [43]), .QN(\uut_master/n66 ) );
  DFF_X1 \uut_master/data_save_reg[43]  ( .D(\uut_master/N73 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [44]), .QN(\uut_master/n65 ) );
  DFF_X1 \uut_master/data_save_reg[44]  ( .D(\uut_master/N74 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [45]), .QN(\uut_master/n64 ) );
  DFF_X1 \uut_master/data_save_reg[45]  ( .D(\uut_master/N75 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [46]), .QN(\uut_master/n63 ) );
  DFF_X1 \uut_master/data_save_reg[46]  ( .D(\uut_master/N76 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [47]), .QN(\uut_master/n62 ) );
  DFF_X1 \uut_master/data_save_reg[47]  ( .D(\uut_master/N77 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [48]), .QN(\uut_master/n61 ) );
  DFF_X1 \uut_master/data_save_reg[49]  ( .D(\uut_master/N79 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [50]), .QN(\uut_master/n59 ) );
  DFF_X1 \uut_master/data_save_reg[50]  ( .D(\uut_master/N80 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [51]), .QN(\uut_master/n58 ) );
  DFF_X1 \uut_master/data_save_reg[51]  ( .D(\uut_master/N81 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [52]), .QN(\uut_master/n57 ) );
  DFF_X1 \uut_master/data_save_reg[52]  ( .D(\uut_master/N82 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [53]), .QN(\uut_master/n56 ) );
  DFF_X1 \uut_master/data_save_reg[53]  ( .D(\uut_master/N83 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [54]), .QN(\uut_master/n55 ) );
  DFF_X1 \uut_master/data_save_reg[54]  ( .D(\uut_master/N84 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [55]), .QN(\uut_master/n54 ) );
  DFF_X1 \uut_master/data_save_reg[36]  ( .D(\uut_master/N66 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [37]), .QN(\uut_master/n72 ) );
  DFF_X1 \uut_master/data_save_reg[48]  ( .D(\uut_master/N78 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [49]), .QN(\uut_master/n60 ) );
  DFF_X1 \uut_master/data_save_reg[55]  ( .D(\uut_master/N85 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [56]), .QN(\uut_master/n53 ) );
  DFF_X1 \uut_master/data_save_reg[31]  ( .D(\uut_master/N61 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [32]), .QN(\uut_master/n77 ) );
  DFF_X1 \uut_master/data_count_reg[5]  ( .D(\uut_master/N99 ), .CK(clk), .Q(
        \uut_master/data_count [5]), .QN(\uut_master/n161 ) );
  DFF_X1 \uut_master/data_save_reg[0]  ( .D(\uut_master/n33 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [1]), .QN(\uut_master/n108 ) );
  DFF_X1 \uut_master/data_count_reg[3]  ( .D(\uut_master/N97 ), .CK(clk), .Q(
        \uut_master/data_count [3]), .QN(\uut_master/n49 ) );
  DFF_X1 \uut_master/data_count_reg[2]  ( .D(\uut_master/N96 ), .CK(clk), .Q(
        \uut_master/data_count [2]), .QN(\uut_master/n50 ) );
  DFF_X1 \uut_master/data_count_reg[1]  ( .D(\uut_master/N95 ), .CK(clk), .Q(
        \uut_master/data_count [1]), .QN(\uut_master/n51 ) );
  DFF_X1 \uut_master/data_count_reg[4]  ( .D(\uut_master/N98 ), .CK(clk), .Q(
        \uut_master/data_count [4]), .QN(\uut_master/n48 ) );
  NOR4_X1 \uut_slave/U174  ( .A1(\uut_slave/n252 ), .A2(\uut_slave/n251 ), 
        .A3(\uut_slave/n250 ), .A4(\uut_slave/n249 ), .ZN(miso) );
  NAND2_X1 \uut_slave/U173  ( .A1(\uut_slave/command_save [6]), .A2(
        \uut_slave/data_out[31] ), .ZN(\uut_slave/n249 ) );
  NAND3_X1 \uut_slave/U172  ( .A1(\uut_slave/command_save [3]), .A2(
        \uut_slave/n7 ), .A3(\uut_slave/command_save [4]), .ZN(
        \uut_slave/n250 ) );
  NAND4_X1 \uut_slave/U171  ( .A1(\uut_slave/command_save [2]), .A2(
        \uut_slave/n8 ), .A3(\uut_slave/n6 ), .A4(\uut_slave/n5 ), .ZN(
        \uut_slave/n251 ) );
  OAI222_X1 \uut_slave/U170  ( .A1(\uut_slave/n23 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n56 ), .B2(\uut_slave/n111 ), .C1(\uut_slave/n55 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n121 ) );
  OAI22_X1 \uut_slave/U169  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n23 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n153 ) );
  OAI222_X1 \uut_slave/U168  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n57 ), .B2(\uut_slave/n111 ), .C1(\uut_slave/n56 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n122 ) );
  OAI22_X1 \uut_slave/U167  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n24 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n154 ) );
  OAI222_X1 \uut_slave/U166  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n58 ), .B2(\uut_slave/n111 ), .C1(\uut_slave/n57 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n123 ) );
  OAI22_X1 \uut_slave/U165  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n25 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n155 ) );
  OAI222_X1 \uut_slave/U164  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n59 ), .B2(\uut_slave/n111 ), .C1(\uut_slave/n58 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n124 ) );
  OAI22_X1 \uut_slave/U163  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n26 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n156 ) );
  OAI222_X1 \uut_slave/U162  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n60 ), .B2(\uut_slave/n111 ), .C1(\uut_slave/n59 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n125 ) );
  OAI22_X1 \uut_slave/U161  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n27 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n157 ) );
  OAI222_X1 \uut_slave/U160  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n61 ), .B2(\uut_slave/n111 ), .C1(\uut_slave/n60 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n126 ) );
  OAI22_X1 \uut_slave/U159  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n28 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n158 ) );
  OAI222_X1 \uut_slave/U158  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n62 ), .B2(\uut_slave/n111 ), .C1(\uut_slave/n61 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n127 ) );
  OAI22_X1 \uut_slave/U157  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n29 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n159 ) );
  OAI222_X1 \uut_slave/U156  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n63 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n62 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n128 ) );
  OAI22_X1 \uut_slave/U155  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n30 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n160 ) );
  OAI222_X1 \uut_slave/U154  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n64 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n63 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n129 ) );
  OAI22_X1 \uut_slave/U153  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n31 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n161 ) );
  OAI222_X1 \uut_slave/U152  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n65 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n64 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n130 ) );
  OAI22_X1 \uut_slave/U151  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n32 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n162 ) );
  OAI222_X1 \uut_slave/U150  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n66 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n65 ), 
        .C2(\uut_slave/n246 ), .ZN(\uut_slave/n131 ) );
  OAI22_X1 \uut_slave/U149  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n33 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n163 ) );
  OAI222_X1 \uut_slave/U148  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n113 ), 
        .B1(\uut_slave/n67 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n66 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n132 ) );
  OAI22_X1 \uut_slave/U147  ( .A1(\uut_slave/n35 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n34 ), .B2(\uut_slave/n98 ), .ZN(\uut_slave/n164 ) );
  OAI222_X1 \uut_slave/U146  ( .A1(\uut_slave/n35 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n68 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n67 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n133 ) );
  OAI22_X1 \uut_slave/U145  ( .A1(\uut_slave/n36 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n35 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n165 ) );
  OAI222_X1 \uut_slave/U144  ( .A1(\uut_slave/n36 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n69 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n68 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n134 ) );
  OAI22_X1 \uut_slave/U143  ( .A1(\uut_slave/n37 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n36 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n166 ) );
  OAI222_X1 \uut_slave/U142  ( .A1(\uut_slave/n37 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n70 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n69 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n135 ) );
  OAI22_X1 \uut_slave/U141  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n37 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n167 ) );
  OAI222_X1 \uut_slave/U140  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n71 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n70 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n136 ) );
  OAI22_X1 \uut_slave/U139  ( .A1(\uut_slave/n39 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n38 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n168 ) );
  OAI222_X1 \uut_slave/U138  ( .A1(\uut_slave/n39 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n72 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n71 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n137 ) );
  OAI22_X1 \uut_slave/U137  ( .A1(\uut_slave/n40 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n39 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n169 ) );
  OAI222_X1 \uut_slave/U136  ( .A1(\uut_slave/n40 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n73 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n72 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n138 ) );
  OAI22_X1 \uut_slave/U135  ( .A1(\uut_slave/n41 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n40 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n170 ) );
  OAI222_X1 \uut_slave/U134  ( .A1(\uut_slave/n41 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n74 ), .B2(\uut_slave/n110 ), .C1(\uut_slave/n73 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n139 ) );
  OAI22_X1 \uut_slave/U133  ( .A1(\uut_slave/n42 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n41 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n171 ) );
  OAI222_X1 \uut_slave/U132  ( .A1(\uut_slave/n42 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n75 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n74 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n140 ) );
  OAI22_X1 \uut_slave/U131  ( .A1(\uut_slave/n43 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n42 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n172 ) );
  OAI222_X1 \uut_slave/U130  ( .A1(\uut_slave/n43 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n76 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n75 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n141 ) );
  OAI22_X1 \uut_slave/U129  ( .A1(\uut_slave/n44 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n43 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n173 ) );
  OAI222_X1 \uut_slave/U128  ( .A1(\uut_slave/n44 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n77 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n76 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n142 ) );
  OAI22_X1 \uut_slave/U127  ( .A1(\uut_slave/n45 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n44 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n174 ) );
  OAI222_X1 \uut_slave/U126  ( .A1(\uut_slave/n45 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n78 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n77 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n143 ) );
  OAI22_X1 \uut_slave/U125  ( .A1(\uut_slave/n46 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n45 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n175 ) );
  OAI222_X1 \uut_slave/U124  ( .A1(\uut_slave/n46 ), .A2(\uut_slave/n114 ), 
        .B1(\uut_slave/n79 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n78 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n144 ) );
  OAI22_X1 \uut_slave/U123  ( .A1(\uut_slave/n47 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n46 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n176 ) );
  OAI222_X1 \uut_slave/U122  ( .A1(\uut_slave/n47 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n80 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n79 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n145 ) );
  OAI22_X1 \uut_slave/U121  ( .A1(\uut_slave/n48 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n47 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n177 ) );
  OAI222_X1 \uut_slave/U120  ( .A1(\uut_slave/n48 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n81 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n80 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n146 ) );
  OAI22_X1 \uut_slave/U119  ( .A1(\uut_slave/n49 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n48 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n178 ) );
  OAI222_X1 \uut_slave/U118  ( .A1(\uut_slave/n49 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n82 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n81 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n147 ) );
  OAI22_X1 \uut_slave/U117  ( .A1(\uut_slave/n50 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n49 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n179 ) );
  OAI222_X1 \uut_slave/U116  ( .A1(\uut_slave/n50 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n83 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n82 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n148 ) );
  OAI22_X1 \uut_slave/U115  ( .A1(\uut_slave/n51 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n50 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n180 ) );
  OAI222_X1 \uut_slave/U114  ( .A1(\uut_slave/n51 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n84 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n83 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n149 ) );
  OAI22_X1 \uut_slave/U113  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n51 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n181 ) );
  OAI222_X1 \uut_slave/U112  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n85 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n84 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n150 ) );
  OAI22_X1 \uut_slave/U111  ( .A1(\uut_slave/n53 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n52 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n182 ) );
  OAI222_X1 \uut_slave/U110  ( .A1(\uut_slave/n53 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n86 ), .B2(\uut_slave/n109 ), .C1(\uut_slave/n85 ), 
        .C2(\uut_slave/n106 ), .ZN(\uut_slave/n151 ) );
  NAND2_X1 \uut_slave/U109  ( .A1(\uut_slave/n106 ), .A2(\uut_slave/n243 ), 
        .ZN(\uut_slave/n247 ) );
  OAI22_X1 \uut_slave/U108  ( .A1(\uut_slave/n54 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n53 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n183 ) );
  OAI22_X1 \uut_slave/U107  ( .A1(\uut_slave/n54 ), .A2(\uut_slave/n115 ), 
        .B1(\uut_slave/n86 ), .B2(\uut_slave/n106 ), .ZN(\uut_slave/n152 ) );
  NAND3_X1 \uut_slave/U106  ( .A1(\uut_slave/n89 ), .A2(\uut_slave/n229 ), 
        .A3(\uut_slave/n242 ), .ZN(\uut_slave/n248 ) );
  NOR3_X1 \uut_slave/U105  ( .A1(\uut_slave/n108 ), .A2(\uut_slave/n95 ), .A3(
        \uut_slave/n241 ), .ZN(\uut_slave/n242 ) );
  INV_X1 \uut_slave/U104  ( .A(\uut_slave/n240 ), .ZN(\uut_slave/n241 ) );
  OAI21_X1 \uut_slave/U103  ( .B1(\uut_slave/n239 ), .B2(\uut_slave/n252 ), 
        .A(\uut_slave/n243 ), .ZN(\uut_slave/n246 ) );
  OAI21_X1 \uut_slave/U102  ( .B1(\uut_slave/n95 ), .B2(\uut_slave/n240 ), .A(
        \uut_slave/n238 ), .ZN(\uut_slave/n243 ) );
  NOR4_X1 \uut_slave/U101  ( .A1(\uut_slave/data_count [4]), .A2(
        \uut_slave/data_count [3]), .A3(\uut_slave/data_count [0]), .A4(
        \uut_slave/n240 ), .ZN(\uut_slave/n239 ) );
  NAND2_X1 \uut_slave/U100  ( .A1(\uut_slave/n13 ), .A2(\uut_slave/n12 ), .ZN(
        \uut_slave/n240 ) );
  OAI22_X1 \uut_slave/U99  ( .A1(\uut_slave/n102 ), .A2(\uut_slave/n237 ), 
        .B1(\uut_slave/n54 ), .B2(\uut_slave/n100 ), .ZN(\uut_slave/n184 ) );
  NAND2_X1 \uut_slave/U98  ( .A1(\uut_slave/n100 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n245 ) );
  NAND2_X1 \uut_slave/U97  ( .A1(\uut_slave/n252 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n244 ) );
  NAND3_X1 \uut_slave/U96  ( .A1(\uut_slave/n90 ), .A2(\uut_slave/n87 ), .A3(
        \uut_slave/data_count [5]), .ZN(\uut_slave/n252 ) );
  OAI22_X1 \uut_slave/U95  ( .A1(\uut_slave/n16 ), .A2(\uut_slave/n236 ), .B1(
        \uut_slave/n15 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n185 ) );
  OAI22_X1 \uut_slave/U94  ( .A1(\uut_slave/n17 ), .A2(\uut_slave/n236 ), .B1(
        \uut_slave/n16 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n186 ) );
  OAI22_X1 \uut_slave/U93  ( .A1(\uut_slave/n18 ), .A2(\uut_slave/n236 ), .B1(
        \uut_slave/n17 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n187 ) );
  OAI22_X1 \uut_slave/U92  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n236 ), .B1(
        \uut_slave/n18 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n188 ) );
  OAI22_X1 \uut_slave/U91  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n236 ), .B1(
        \uut_slave/n19 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n189 ) );
  OAI22_X1 \uut_slave/U90  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n236 ), .B1(
        \uut_slave/n20 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n190 ) );
  OAI22_X1 \uut_slave/U89  ( .A1(\uut_slave/n22 ), .A2(\uut_slave/n236 ), .B1(
        \uut_slave/n21 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n191 ) );
  OAI22_X1 \uut_slave/U88  ( .A1(\uut_slave/n237 ), .A2(\uut_slave/n236 ), 
        .B1(\uut_slave/n22 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n192 ) );
  NAND2_X1 \uut_slave/U87  ( .A1(\uut_slave/n238 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n236 ) );
  NAND3_X1 \uut_slave/U86  ( .A1(\uut_slave/n229 ), .A2(\uut_slave/n10 ), .A3(
        \uut_slave/n89 ), .ZN(\uut_slave/n235 ) );
  INV_X1 \uut_slave/U85  ( .A(mosi), .ZN(\uut_slave/n237 ) );
  OAI33_X1 \uut_slave/U84  ( .A1(\uut_slave/n88 ), .A2(\uut_slave/n3 ), .A3(
        \uut_slave/n234 ), .B1(\uut_slave/n14 ), .B2(\uut_slave/n233 ), .B3(
        \uut_slave/n232 ), .ZN(\uut_slave/n198 ) );
  NAND2_X1 \uut_slave/U83  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n91 ), .ZN(
        \uut_slave/n232 ) );
  NOR3_X1 \uut_slave/U82  ( .A1(\uut_slave/n229 ), .A2(\uut_slave/n12 ), .A3(
        \uut_slave/n11 ), .ZN(\uut_slave/n230 ) );
  NOR3_X1 \uut_slave/U81  ( .A1(\uut_slave/n2 ), .A2(\uut_slave/n92 ), .A3(
        \uut_slave/n222 ), .ZN(\uut_slave/data_end_next ) );
  NAND3_X1 \uut_slave/U80  ( .A1(\uut_slave/n218 ), .A2(\uut_slave/n88 ), .A3(
        \uut_slave/n217 ), .ZN(\uut_slave/n221 ) );
  INV_X1 \uut_slave/U79  ( .A(\uut_slave/n213 ), .ZN(\uut_slave/n214 ) );
  NAND3_X1 \uut_slave/U78  ( .A1(\uut_slave/data_count [0]), .A2(
        \uut_slave/data_count [2]), .A3(\uut_slave/data_count [1]), .ZN(
        \uut_slave/n213 ) );
  OAI33_X1 \uut_slave/U77  ( .A1(\uut_slave/n88 ), .A2(\uut_slave/n12 ), .A3(
        \uut_slave/n234 ), .B1(\uut_slave/n14 ), .B2(\uut_slave/n207 ), .B3(
        \uut_slave/n206 ), .ZN(\uut_slave/n195 ) );
  NAND2_X1 \uut_slave/U76  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n91 ), .ZN(
        \uut_slave/n206 ) );
  XOR2_X1 \uut_slave/U75  ( .A(\uut_slave/n205 ), .B(\uut_slave/data_count [2]), .Z(\uut_slave/n207 ) );
  NAND2_X1 \uut_slave/U74  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n205 ) );
  OAI33_X1 \uut_slave/U73  ( .A1(\uut_slave/n88 ), .A2(\uut_slave/n13 ), .A3(
        \uut_slave/n234 ), .B1(\uut_slave/n14 ), .B2(\uut_slave/n204 ), .B3(
        \uut_slave/n203 ), .ZN(\uut_slave/n196 ) );
  NAND2_X1 \uut_slave/U72  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n91 ), .ZN(
        \uut_slave/n203 ) );
  XOR2_X1 \uut_slave/U71  ( .A(\uut_slave/n1 ), .B(\uut_slave/data_count [1]), 
        .Z(\uut_slave/n204 ) );
  OAI33_X1 \uut_slave/U70  ( .A1(\uut_slave/n88 ), .A2(\uut_slave/n1 ), .A3(
        \uut_slave/n234 ), .B1(\uut_slave/n14 ), .B2(\uut_slave/data_count [0]), .B3(\uut_slave/n201 ), .ZN(\uut_slave/n197 ) );
  NAND2_X1 \uut_slave/U69  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n91 ), .ZN(
        \uut_slave/n201 ) );
  NAND4_X1 \uut_slave/U68  ( .A1(\uut_slave/n200 ), .A2(
        \uut_slave/data_count [2]), .A3(\uut_slave/data_count [4]), .A4(
        \uut_slave/data_count [3]), .ZN(\uut_slave/n231 ) );
  NOR3_X1 \uut_slave/U67  ( .A1(\uut_slave/n3 ), .A2(\uut_slave/n13 ), .A3(
        \uut_slave/n202 ), .ZN(\uut_slave/n200 ) );
  NAND2_X1 \uut_slave/U66  ( .A1(\uut_slave/n10 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n234 ) );
  AOI21_X1 \uut_slave/U65  ( .B1(\uut_slave/n120 ), .B2(\uut_slave/n199 ), .A(
        \uut_slave/n95 ), .ZN(\uut_slave/N96 ) );
  OAI21_X1 \uut_slave/U64  ( .B1(\uut_slave/n87 ), .B2(\uut_slave/n226 ), .A(
        \uut_slave/n225 ), .ZN(\uut_slave/n120 ) );
  INV_X1 \uut_slave/U63  ( .A(cs), .ZN(\uut_slave/n225 ) );
  NAND2_X1 \uut_slave/U62  ( .A1(\uut_slave/n226 ), .A2(\uut_slave/n224 ), 
        .ZN(\uut_slave/n199 ) );
  NAND2_X1 \uut_slave/U61  ( .A1(\uut_slave/n224 ), .A2(\uut_slave/n222 ), 
        .ZN(\uut_slave/n226 ) );
  NAND2_X1 \uut_slave/U60  ( .A1(\uut_slave/n90 ), .A2(
        \uut_slave/current_state[1] ), .ZN(\uut_slave/n222 ) );
  NAND2_X1 \uut_slave/U59  ( .A1(\uut_slave/n90 ), .A2(\uut_slave/n119 ), .ZN(
        \uut_slave/n224 ) );
  NOR2_X1 \uut_slave/U58  ( .A1(\uut_slave/n117 ), .A2(\uut_slave/n229 ), .ZN(
        \uut_slave/n219 ) );
  NOR2_X1 \uut_slave/U57  ( .A1(\uut_slave/n117 ), .A2(\uut_slave/n11 ), .ZN(
        \uut_slave/n209 ) );
  NAND4_X1 \uut_slave/U56  ( .A1(\uut_slave/n4 ), .A2(\uut_slave/n97 ), .A3(
        \uut_slave/n210 ), .A4(\uut_slave/n92 ), .ZN(\uut_slave/n211 ) );
  NAND2_X1 \uut_slave/U55  ( .A1(\uut_slave/n209 ), .A2(\uut_slave/n208 ), 
        .ZN(\uut_slave/n212 ) );
  NAND2_X1 \uut_slave/U54  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n208 ), 
        .ZN(\uut_slave/n220 ) );
  NAND2_X1 \uut_slave/U53  ( .A1(\uut_slave/n212 ), .A2(\uut_slave/n211 ), 
        .ZN(\uut_slave/n194 ) );
  INV_X1 \uut_slave/U52  ( .A(sck), .ZN(\uut_slave/n118 ) );
  NAND2_X1 \uut_slave/U51  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n221 ), 
        .ZN(\uut_slave/n193 ) );
  AND2_X2 \uut_slave/U50  ( .A1(\uut_slave/n10 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n97 ) );
  INV_X1 \uut_slave/U49  ( .A(\uut_slave/n118 ), .ZN(\uut_slave/n117 ) );
  CLKBUF_X1 \uut_slave/U48  ( .A(\uut_slave/n2 ), .Z(\uut_slave/n93 ) );
  BUF_X1 \uut_slave/U47  ( .A(\uut_slave/n231 ), .Z(\uut_slave/n92 ) );
  BUF_X1 \uut_slave/U46  ( .A(\uut_slave/n231 ), .Z(\uut_slave/n91 ) );
  NOR2_X1 \uut_slave/U45  ( .A1(\uut_slave/n216 ), .A2(\uut_slave/n234 ), .ZN(
        \uut_slave/n217 ) );
  INV_X1 \uut_slave/U44  ( .A(\uut_slave/n234 ), .ZN(\uut_slave/n208 ) );
  XNOR2_X1 \uut_slave/U43  ( .A(\uut_slave/n215 ), .B(
        \uut_slave/data_count [4]), .ZN(\uut_slave/n218 ) );
  NOR2_X1 \uut_slave/U42  ( .A1(\uut_slave/n227 ), .A2(\uut_slave/n228 ), .ZN(
        \uut_slave/N95 ) );
  INV_X1 \uut_slave/U41  ( .A(\uut_slave/n246 ), .ZN(\uut_slave/n108 ) );
  AND2_X1 \uut_slave/U40  ( .A1(\uut_slave/n11 ), .A2(\uut_slave/n3 ), .ZN(
        \uut_slave/n89 ) );
  NAND2_X1 \uut_slave/U39  ( .A1(\uut_slave/n235 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n238 ) );
  NAND2_X1 \uut_slave/U38  ( .A1(\uut_slave/n214 ), .A2(
        \uut_slave/data_count [3]), .ZN(\uut_slave/n215 ) );
  INV_X1 \uut_slave/U37  ( .A(\uut_slave/n226 ), .ZN(\uut_slave/n223 ) );
  OAI211_X1 \uut_slave/U36  ( .C1(\uut_slave/n225 ), .C2(\uut_slave/n226 ), 
        .A(\uut_slave/n87 ), .B(\uut_slave/n96 ), .ZN(\uut_slave/n227 ) );
  AOI21_X1 \uut_slave/U35  ( .B1(\uut_slave/data_end ), .B2(\uut_slave/n224 ), 
        .A(\uut_slave/n223 ), .ZN(\uut_slave/n228 ) );
  XNOR2_X1 \uut_slave/U34  ( .A(\uut_slave/n213 ), .B(
        \uut_slave/data_count [3]), .ZN(\uut_slave/n210 ) );
  BUF_X1 \uut_slave/U33  ( .A(\uut_slave/n116 ), .Z(\uut_slave/n115 ) );
  BUF_X1 \uut_slave/U32  ( .A(\uut_slave/n116 ), .Z(\uut_slave/n114 ) );
  BUF_X1 \uut_slave/U31  ( .A(\uut_slave/n116 ), .Z(\uut_slave/n113 ) );
  BUF_X1 \uut_slave/U30  ( .A(\uut_slave/n101 ), .Z(\uut_slave/n100 ) );
  INV_X1 \uut_slave/U29  ( .A(\uut_slave/n107 ), .ZN(\uut_slave/n106 ) );
  BUF_X1 \uut_slave/U28  ( .A(\uut_slave/n101 ), .Z(\uut_slave/n99 ) );
  BUF_X1 \uut_slave/U27  ( .A(\uut_slave/n101 ), .Z(\uut_slave/n98 ) );
  BUF_X1 \uut_slave/U26  ( .A(rst), .Z(\uut_slave/n95 ) );
  INV_X1 \uut_slave/U25  ( .A(\uut_slave/n92 ), .ZN(\uut_slave/n216 ) );
  INV_X1 \uut_slave/U24  ( .A(\uut_slave/n95 ), .ZN(\uut_slave/n96 ) );
  BUF_X1 \uut_slave/U23  ( .A(\uut_slave/n112 ), .Z(\uut_slave/n111 ) );
  BUF_X1 \uut_slave/U22  ( .A(\uut_slave/n112 ), .Z(\uut_slave/n109 ) );
  BUF_X1 \uut_slave/U21  ( .A(\uut_slave/n112 ), .Z(\uut_slave/n110 ) );
  INV_X2 \uut_slave/U20  ( .A(\uut_slave/n93 ), .ZN(\uut_slave/n94 ) );
  BUF_X1 \uut_slave/U19  ( .A(\uut_slave/n105 ), .Z(\uut_slave/n104 ) );
  BUF_X1 \uut_slave/U18  ( .A(\uut_slave/n105 ), .Z(\uut_slave/n103 ) );
  BUF_X1 \uut_slave/U17  ( .A(\uut_slave/n105 ), .Z(\uut_slave/n102 ) );
  INV_X1 \uut_slave/U16  ( .A(\uut_slave/n118 ), .ZN(\uut_slave/n88 ) );
  BUF_X1 \uut_slave/U15  ( .A(\uut_slave/n248 ), .Z(\uut_slave/n116 ) );
  BUF_X1 \uut_slave/U14  ( .A(\uut_slave/n108 ), .Z(\uut_slave/n107 ) );
  BUF_X1 \uut_slave/U13  ( .A(\uut_slave/n244 ), .Z(\uut_slave/n101 ) );
  BUF_X1 \uut_slave/U12  ( .A(\uut_slave/n247 ), .Z(\uut_slave/n112 ) );
  BUF_X1 \uut_slave/U11  ( .A(\uut_slave/n245 ), .Z(\uut_slave/n105 ) );
  INV_X1 \uut_slave/U10  ( .A(\uut_slave/n119 ), .ZN(\uut_slave/n87 ) );
  INV_X1 \uut_slave/U9  ( .A(sck), .ZN(\uut_slave/n14 ) );
  AND2_X2 \uut_slave/U8  ( .A1(\uut_slave/n90 ), .A2(
        \uut_slave/current_state[1] ), .ZN(\uut_slave/n10 ) );
  AND3_X1 \uut_slave/U7  ( .A1(\uut_slave/n230 ), .A2(
        \uut_slave/data_count [0]), .A3(\uut_slave/data_count [1]), .ZN(
        \uut_slave/n9 ) );
  XOR2_X1 \uut_slave/U6  ( .A(\uut_slave/n9 ), .B(\uut_slave/n3 ), .Z(
        \uut_slave/n233 ) );
  INV_X1 \uut_slave/U5  ( .A(\uut_slave/n14 ), .ZN(\uut_slave/n4 ) );
  BUF_X1 \uut_slave/U4  ( .A(\uut_slave/n202 ), .Z(\uut_slave/n1 ) );
  BUF_X1 \uut_slave/U3  ( .A(\uut_slave/n14 ), .Z(\uut_slave/n2 ) );
  DFF_X1 \uut_slave/current_state_reg[0]  ( .D(\uut_slave/N95 ), .CK(clk), 
        .QN(\uut_slave/n90 ) );
  DFF_X1 \uut_slave/data_end_reg  ( .D(\uut_slave/data_end_next ), .CK(clk), 
        .Q(\uut_slave/data_end ) );
  DFF_X1 \uut_slave/data_count_reg[4]  ( .D(\uut_slave/n193 ), .CK(clk), .Q(
        \uut_slave/data_count [4]), .QN(\uut_slave/n229 ) );
  DFF_X1 \uut_slave/current_state_reg[1]  ( .D(\uut_slave/N96 ), .CK(clk), .Q(
        \uut_slave/current_state[1] ), .QN(\uut_slave/n119 ) );
  DFF_X1 \uut_slave/data_count_reg[5]  ( .D(\uut_slave/n198 ), .CK(clk), .Q(
        \uut_slave/data_count [5]), .QN(\uut_slave/n3 ) );
  DFF_X1 \uut_slave/data_count_reg[0]  ( .D(\uut_slave/n197 ), .CK(clk), .Q(
        \uut_slave/data_count [0]), .QN(\uut_slave/n202 ) );
  DFF_X1 \uut_slave/data_count_reg[1]  ( .D(\uut_slave/n196 ), .CK(clk), .Q(
        \uut_slave/data_count [1]), .QN(\uut_slave/n13 ) );
  DFF_X1 \uut_slave/data_count_reg[2]  ( .D(\uut_slave/n195 ), .CK(clk), .Q(
        \uut_slave/data_count [2]), .QN(\uut_slave/n12 ) );
  DFF_X1 \uut_slave/data_count_reg[3]  ( .D(\uut_slave/n194 ), .CK(clk), .Q(
        \uut_slave/data_count [3]), .QN(\uut_slave/n11 ) );
  DFF_X1 \uut_slave/data_out_reg[31]  ( .D(\uut_slave/n121 ), .CK(
        \uut_slave/n93 ), .Q(\uut_slave/data_out[31] ), .QN(\uut_slave/n55 )
         );
  DFF_X1 \uut_slave/data_save_reg[31]  ( .D(\uut_slave/n153 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n23 ) );
  DFF_X1 \uut_slave/data_out_reg[30]  ( .D(\uut_slave/n122 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n56 ) );
  DFF_X1 \uut_slave/data_save_reg[30]  ( .D(\uut_slave/n154 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n24 ) );
  DFF_X1 \uut_slave/data_out_reg[29]  ( .D(\uut_slave/n123 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n57 ) );
  DFF_X1 \uut_slave/data_save_reg[29]  ( .D(\uut_slave/n155 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n25 ) );
  DFF_X1 \uut_slave/data_out_reg[28]  ( .D(\uut_slave/n124 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n58 ) );
  DFF_X1 \uut_slave/data_save_reg[28]  ( .D(\uut_slave/n156 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n26 ) );
  DFF_X1 \uut_slave/data_out_reg[27]  ( .D(\uut_slave/n125 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n59 ) );
  DFF_X1 \uut_slave/data_save_reg[27]  ( .D(\uut_slave/n157 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n27 ) );
  DFF_X1 \uut_slave/data_out_reg[26]  ( .D(\uut_slave/n126 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n60 ) );
  DFF_X1 \uut_slave/data_save_reg[26]  ( .D(\uut_slave/n158 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n28 ) );
  DFF_X1 \uut_slave/data_out_reg[25]  ( .D(\uut_slave/n127 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n61 ) );
  DFF_X1 \uut_slave/data_save_reg[25]  ( .D(\uut_slave/n159 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n29 ) );
  DFF_X1 \uut_slave/data_out_reg[24]  ( .D(\uut_slave/n128 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n62 ) );
  DFF_X1 \uut_slave/data_save_reg[24]  ( .D(\uut_slave/n160 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n30 ) );
  DFF_X1 \uut_slave/data_out_reg[23]  ( .D(\uut_slave/n129 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n63 ) );
  DFF_X1 \uut_slave/data_save_reg[23]  ( .D(\uut_slave/n161 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n31 ) );
  DFF_X1 \uut_slave/data_out_reg[22]  ( .D(\uut_slave/n130 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n64 ) );
  DFF_X1 \uut_slave/data_save_reg[22]  ( .D(\uut_slave/n162 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n32 ) );
  DFF_X1 \uut_slave/data_out_reg[21]  ( .D(\uut_slave/n131 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n65 ) );
  DFF_X1 \uut_slave/data_save_reg[21]  ( .D(\uut_slave/n163 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n33 ) );
  DFF_X1 \uut_slave/data_out_reg[20]  ( .D(\uut_slave/n132 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n66 ) );
  DFF_X1 \uut_slave/data_save_reg[20]  ( .D(\uut_slave/n164 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n34 ) );
  DFF_X1 \uut_slave/data_out_reg[19]  ( .D(\uut_slave/n133 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n67 ) );
  DFF_X1 \uut_slave/data_save_reg[19]  ( .D(\uut_slave/n165 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n35 ) );
  DFF_X1 \uut_slave/data_out_reg[18]  ( .D(\uut_slave/n134 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n68 ) );
  DFF_X1 \uut_slave/data_save_reg[18]  ( .D(\uut_slave/n166 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n36 ) );
  DFF_X1 \uut_slave/data_out_reg[17]  ( .D(\uut_slave/n135 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n69 ) );
  DFF_X1 \uut_slave/data_save_reg[17]  ( .D(\uut_slave/n167 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n37 ) );
  DFF_X1 \uut_slave/data_out_reg[16]  ( .D(\uut_slave/n136 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n70 ) );
  DFF_X1 \uut_slave/data_save_reg[16]  ( .D(\uut_slave/n168 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n38 ) );
  DFF_X1 \uut_slave/data_out_reg[15]  ( .D(\uut_slave/n137 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n71 ) );
  DFF_X1 \uut_slave/data_save_reg[15]  ( .D(\uut_slave/n169 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n39 ) );
  DFF_X1 \uut_slave/data_out_reg[14]  ( .D(\uut_slave/n138 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n72 ) );
  DFF_X1 \uut_slave/data_save_reg[14]  ( .D(\uut_slave/n170 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n40 ) );
  DFF_X1 \uut_slave/data_out_reg[13]  ( .D(\uut_slave/n139 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n73 ) );
  DFF_X1 \uut_slave/data_save_reg[13]  ( .D(\uut_slave/n171 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n41 ) );
  DFF_X1 \uut_slave/data_out_reg[12]  ( .D(\uut_slave/n140 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n74 ) );
  DFF_X1 \uut_slave/data_save_reg[12]  ( .D(\uut_slave/n172 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n42 ) );
  DFF_X1 \uut_slave/data_out_reg[11]  ( .D(\uut_slave/n141 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n75 ) );
  DFF_X1 \uut_slave/data_save_reg[11]  ( .D(\uut_slave/n173 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n43 ) );
  DFF_X1 \uut_slave/data_out_reg[10]  ( .D(\uut_slave/n142 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n76 ) );
  DFF_X1 \uut_slave/data_save_reg[10]  ( .D(\uut_slave/n174 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n44 ) );
  DFF_X1 \uut_slave/data_out_reg[9]  ( .D(\uut_slave/n143 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n77 ) );
  DFF_X1 \uut_slave/data_save_reg[9]  ( .D(\uut_slave/n175 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n45 ) );
  DFF_X1 \uut_slave/data_out_reg[8]  ( .D(\uut_slave/n144 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n78 ) );
  DFF_X1 \uut_slave/data_save_reg[8]  ( .D(\uut_slave/n176 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n46 ) );
  DFF_X1 \uut_slave/data_out_reg[7]  ( .D(\uut_slave/n145 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n79 ) );
  DFF_X1 \uut_slave/data_save_reg[7]  ( .D(\uut_slave/n177 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n47 ) );
  DFF_X1 \uut_slave/data_out_reg[6]  ( .D(\uut_slave/n146 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n80 ) );
  DFF_X1 \uut_slave/data_save_reg[6]  ( .D(\uut_slave/n178 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n48 ) );
  DFF_X1 \uut_slave/data_out_reg[5]  ( .D(\uut_slave/n147 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n81 ) );
  DFF_X1 \uut_slave/data_save_reg[5]  ( .D(\uut_slave/n179 ), .CK(
        \uut_slave/n88 ), .QN(\uut_slave/n49 ) );
  DFF_X1 \uut_slave/data_out_reg[4]  ( .D(\uut_slave/n148 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n82 ) );
  DFF_X1 \uut_slave/data_save_reg[4]  ( .D(\uut_slave/n180 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n50 ) );
  DFF_X1 \uut_slave/data_out_reg[3]  ( .D(\uut_slave/n149 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n83 ) );
  DFF_X1 \uut_slave/data_save_reg[3]  ( .D(\uut_slave/n181 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n51 ) );
  DFF_X1 \uut_slave/data_out_reg[2]  ( .D(\uut_slave/n150 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n84 ) );
  DFF_X1 \uut_slave/data_save_reg[2]  ( .D(\uut_slave/n182 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n52 ) );
  DFF_X1 \uut_slave/data_out_reg[1]  ( .D(\uut_slave/n151 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n85 ) );
  DFF_X1 \uut_slave/data_save_reg[1]  ( .D(\uut_slave/n183 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n53 ) );
  DFF_X1 \uut_slave/data_out_reg[0]  ( .D(\uut_slave/n152 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n86 ) );
  DFF_X1 \uut_slave/data_save_reg[0]  ( .D(\uut_slave/n184 ), .CK(
        \uut_slave/n94 ), .QN(\uut_slave/n54 ) );
  DFF_X1 \uut_slave/command_save_reg[7]  ( .D(\uut_slave/n185 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/n8 ), .QN(\uut_slave/n15 ) );
  DFF_X1 \uut_slave/command_save_reg[6]  ( .D(\uut_slave/n186 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/command_save [6]), .QN(\uut_slave/n16 ) );
  DFF_X1 \uut_slave/command_save_reg[5]  ( .D(\uut_slave/n187 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/n5 ), .QN(\uut_slave/n17 ) );
  DFF_X1 \uut_slave/command_save_reg[4]  ( .D(\uut_slave/n188 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/command_save [4]), .QN(\uut_slave/n18 ) );
  DFF_X1 \uut_slave/command_save_reg[3]  ( .D(\uut_slave/n189 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/command_save [3]), .QN(\uut_slave/n19 ) );
  DFF_X1 \uut_slave/command_save_reg[2]  ( .D(\uut_slave/n190 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/command_save [2]), .QN(\uut_slave/n20 ) );
  DFF_X1 \uut_slave/command_save_reg[1]  ( .D(\uut_slave/n191 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/n6 ), .QN(\uut_slave/n21 ) );
  DFF_X1 \uut_slave/command_save_reg[0]  ( .D(\uut_slave/n192 ), .CK(
        \uut_slave/n94 ), .Q(\uut_slave/n7 ), .QN(\uut_slave/n22 ) );
endmodule

