/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 07:12:16 2026
/////////////////////////////////////////////////////////////


module spi ( clk, rst, addr, we, write_data, re, read_data );
  input [2:0] addr;
  input [31:0] write_data;
  output [31:0] read_data;
  input clk, rst, we, re;
  wire   enable, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, cs, sck, mosi,
         miso, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         \uut_master/n364 , \uut_master/n363 , \uut_master/n362 ,
         \uut_master/n361 , \uut_master/n360 , \uut_master/n359 ,
         \uut_master/n358 , \uut_master/n357 , \uut_master/n356 ,
         \uut_master/n355 , \uut_master/n354 , \uut_master/n353 ,
         \uut_master/n352 , \uut_master/n351 , \uut_master/n350 ,
         \uut_master/n349 , \uut_master/n348 , \uut_master/n347 ,
         \uut_master/n346 , \uut_master/n345 , \uut_master/n344 ,
         \uut_master/n343 , \uut_master/n342 , \uut_master/n341 ,
         \uut_master/n340 , \uut_master/n339 , \uut_master/n338 ,
         \uut_master/n337 , \uut_master/n336 , \uut_master/n335 ,
         \uut_master/n334 , \uut_master/n333 , \uut_master/n332 ,
         \uut_master/n331 , \uut_master/n330 , \uut_master/n329 ,
         \uut_master/n328 , \uut_master/n327 , \uut_master/n326 ,
         \uut_master/n325 , \uut_master/n324 , \uut_master/n323 ,
         \uut_master/n322 , \uut_master/n321 , \uut_master/n320 ,
         \uut_master/n319 , \uut_master/n318 , \uut_master/n317 ,
         \uut_master/n316 , \uut_master/n315 , \uut_master/n314 ,
         \uut_master/n313 , \uut_master/n312 , \uut_master/n311 ,
         \uut_master/n310 , \uut_master/n309 , \uut_master/n308 ,
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
         \uut_master/n116 , \uut_master/n115 , \uut_master/n113 ,
         \uut_master/n112 , \uut_master/n111 , \uut_master/n110 ,
         \uut_master/n109 , \uut_master/n108 , \uut_master/n107 ,
         \uut_master/n106 , \uut_master/n13 , \uut_master/n12 ,
         \uut_master/n11 , \uut_master/n9 , \uut_master/n8 , \uut_master/n7 ,
         \uut_master/n6 , \uut_master/n5 , \uut_master/n4 , \uut_master/n3 ,
         \uut_master/n2 , \uut_master/n1 , \uut_master/net11648 ,
         \uut_master/net11925 , \uut_master/net11926 , \uut_master/net11928 ,
         \uut_master/net11929 , \uut_master/net11931 , \uut_master/net11933 ,
         \uut_master/net11934 , \uut_master/net11935 , \uut_master/net11936 ,
         \uut_master/net11937 , \uut_master/net11939 , \uut_master/net11940 ,
         \uut_master/net11942 , \uut_master/net11943 , \uut_master/net11904 ,
         \uut_master/net11869 , \uut_master/net11870 , \uut_master/net11797 ,
         \uut_master/net11741 , \uut_master/net11735 , \uut_master/net11731 ,
         \uut_master/net11723 , \uut_master/net11724 , \uut_master/net11614 ,
         \uut_master/net11615 , \uut_master/net11616 , \uut_master/net11617 ,
         \uut_master/net11618 , \uut_master/net11620 , \uut_master/net11622 ,
         \uut_master/net11623 , \uut_master/net11624 , \uut_master/net11626 ,
         \uut_master/net11628 , \uut_master/net11630 , \uut_master/net11631 ,
         \uut_master/net11632 , \uut_master/net11634 , \uut_master/net11635 ,
         \uut_master/net11636 , \uut_master/net11637 , \uut_master/net11638 ,
         \uut_master/net11639 , \uut_master/net11640 , \uut_master/net11641 ,
         \uut_master/net11642 , \uut_master/net11643 , \uut_master/net11644 ,
         \uut_master/net11645 , \uut_master/net11646 , \uut_master/net11649 ,
         \uut_master/net11606 , \uut_master/net11605 , \uut_master/net11476 ,
         \uut_master/net11478 , \uut_master/net11480 , \uut_master/net11482 ,
         \uut_master/net11486 , \uut_master/net11488 , \uut_master/net11490 ,
         \uut_master/net11464 , \uut_master/net11369 , \uut_master/net11368 ,
         \uut_master/net11335 , \uut_master/net11333 , \uut_master/net11308 ,
         \uut_master/net11298 , \uut_master/n307 , \uut_master/n306 ,
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
         \uut_master/n114 , \uut_master/n105 , \uut_master/n104 ,
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
         \uut_master/n52 , \uut_master/n51 , \uut_master/n50 ,
         \uut_master/n49 , \uut_master/n48 , \uut_master/n47 ,
         \uut_master/n46 , \uut_master/n45 , \uut_master/n44 ,
         \uut_master/n43 , \uut_master/n42 , \uut_master/n41 ,
         \uut_master/n40 , \uut_master/n39 , \uut_master/n38 ,
         \uut_master/n37 , \uut_master/n36 , \uut_master/n35 ,
         \uut_master/n34 , \uut_master/n33 , \uut_master/n32 ,
         \uut_master/n31 , \uut_master/n30 , \uut_master/n29 ,
         \uut_master/n28 , \uut_master/n27 , \uut_master/n26 ,
         \uut_master/n25 , \uut_master/n24 , \uut_master/n23 ,
         \uut_master/n22 , \uut_master/n21 , \uut_master/n20 ,
         \uut_master/n19 , \uut_master/n18 , \uut_master/n17 ,
         \uut_master/n16 , \uut_master/n15 , \uut_master/n14 ,
         \uut_master/n10 , \uut_master/N171 , \uut_master/N170 ,
         \uut_master/N168 , \uut_master/N164 , \uut_master/N163 ,
         \uut_master/N151 , \uut_master/N150 , \uut_master/N107 ,
         \uut_master/data_end , \uut_master/N15 , \uut_master/clock_count ,
         \uut_slave/n245 , \uut_slave/n244 , \uut_slave/n243 ,
         \uut_slave/n242 , \uut_slave/n241 , \uut_slave/n240 ,
         \uut_slave/n239 , \uut_slave/n238 , \uut_slave/n237 ,
         \uut_slave/n236 , \uut_slave/n235 , \uut_slave/n234 ,
         \uut_slave/n233 , \uut_slave/n232 , \uut_slave/n231 ,
         \uut_slave/n230 , \uut_slave/n229 , \uut_slave/n228 ,
         \uut_slave/n227 , \uut_slave/n226 , \uut_slave/n225 ,
         \uut_slave/n224 , \uut_slave/n223 , \uut_slave/n222 ,
         \uut_slave/n221 , \uut_slave/n220 , \uut_slave/n219 ,
         \uut_slave/n218 , \uut_slave/n217 , \uut_slave/n216 ,
         \uut_slave/n215 , \uut_slave/n214 , \uut_slave/n213 ,
         \uut_slave/n212 , \uut_slave/n211 , \uut_slave/n210 ,
         \uut_slave/n209 , \uut_slave/n208 , \uut_slave/n207 ,
         \uut_slave/n206 , \uut_slave/n205 , \uut_slave/n204 ,
         \uut_slave/n203 , \uut_slave/n124 , \uut_slave/n123 ,
         \uut_slave/n122 , \uut_slave/n121 , \uut_slave/n120 ,
         \uut_slave/n119 , \uut_slave/n118 , \uut_slave/n117 ,
         \uut_slave/n116 , \uut_slave/n115 , \uut_slave/n114 ,
         \uut_slave/n113 , \uut_slave/n112 , \uut_slave/n111 ,
         \uut_slave/n110 , \uut_slave/n109 , \uut_slave/n108 ,
         \uut_slave/n107 , \uut_slave/n106 , \uut_slave/n105 ,
         \uut_slave/n104 , \uut_slave/n103 , \uut_slave/n102 ,
         \uut_slave/n101 , \uut_slave/n100 , \uut_slave/n99 , \uut_slave/n98 ,
         \uut_slave/n97 , \uut_slave/n96 , \uut_slave/n95 , \uut_slave/n94 ,
         \uut_slave/n93 , \uut_slave/n92 , \uut_slave/n91 , \uut_slave/n90 ,
         \uut_slave/n89 , \uut_slave/n88 , \uut_slave/n87 , \uut_slave/n86 ,
         \uut_slave/n85 , \uut_slave/n84 , \uut_slave/n83 , \uut_slave/n82 ,
         \uut_slave/n81 , \uut_slave/n80 , \uut_slave/n79 , \uut_slave/n78 ,
         \uut_slave/n77 , \uut_slave/n76 , \uut_slave/n75 , \uut_slave/n74 ,
         \uut_slave/n73 , \uut_slave/n72 , \uut_slave/n71 , \uut_slave/n70 ,
         \uut_slave/n69 , \uut_slave/n68 , \uut_slave/n67 , \uut_slave/n66 ,
         \uut_slave/n65 , \uut_slave/n64 , \uut_slave/n63 , \uut_slave/n62 ,
         \uut_slave/n61 , \uut_slave/n60 , \uut_slave/n59 , \uut_slave/n58 ,
         \uut_slave/n51 , \uut_slave/n50 , \uut_slave/n49 , \uut_slave/n48 ,
         \uut_slave/n47 , \uut_slave/n46 , \uut_slave/n45 , \uut_slave/n44 ,
         \uut_slave/n43 , \uut_slave/n42 , \uut_slave/n41 , \uut_slave/n40 ,
         \uut_slave/n39 , \uut_slave/n38 , \uut_slave/n37 , \uut_slave/n36 ,
         \uut_slave/n35 , \uut_slave/n34 , \uut_slave/n33 , \uut_slave/n32 ,
         \uut_slave/n31 , \uut_slave/n30 , \uut_slave/n29 , \uut_slave/n28 ,
         \uut_slave/n27 , \uut_slave/n26 , \uut_slave/n25 , \uut_slave/n24 ,
         \uut_slave/n23 , \uut_slave/n22 , \uut_slave/n21 , \uut_slave/n20 ,
         \uut_slave/n19 , \uut_slave/n18 , \uut_slave/n17 , \uut_slave/n12 ,
         \uut_slave/n11 , \uut_slave/n10 , \uut_slave/n9 , \uut_slave/n8 ,
         \uut_slave/n7 , \uut_slave/n5 , \uut_slave/n4 , \uut_slave/n3 ,
         \uut_slave/n2 , \uut_slave/n1 , \uut_slave/n202 , \uut_slave/n201 ,
         \uut_slave/n200 , \uut_slave/n199 , \uut_slave/n198 ,
         \uut_slave/n197 , \uut_slave/n196 , \uut_slave/n195 ,
         \uut_slave/n194 , \uut_slave/n193 , \uut_slave/n192 ,
         \uut_slave/n191 , \uut_slave/n190 , \uut_slave/n189 ,
         \uut_slave/n188 , \uut_slave/n187 , \uut_slave/n186 ,
         \uut_slave/n185 , \uut_slave/n184 , \uut_slave/n183 ,
         \uut_slave/n182 , \uut_slave/n181 , \uut_slave/n180 ,
         \uut_slave/n179 , \uut_slave/n178 , \uut_slave/n177 ,
         \uut_slave/n176 , \uut_slave/n175 , \uut_slave/n174 ,
         \uut_slave/n173 , \uut_slave/n172 , \uut_slave/n171 ,
         \uut_slave/n170 , \uut_slave/n169 , \uut_slave/n168 ,
         \uut_slave/n167 , \uut_slave/n166 , \uut_slave/n165 ,
         \uut_slave/n164 , \uut_slave/n163 , \uut_slave/n162 ,
         \uut_slave/n161 , \uut_slave/n160 , \uut_slave/n159 ,
         \uut_slave/n158 , \uut_slave/n157 , \uut_slave/n156 ,
         \uut_slave/n155 , \uut_slave/n154 , \uut_slave/n153 ,
         \uut_slave/n152 , \uut_slave/n151 , \uut_slave/n150 ,
         \uut_slave/n149 , \uut_slave/n148 , \uut_slave/n147 ,
         \uut_slave/n146 , \uut_slave/n145 , \uut_slave/n144 ,
         \uut_slave/n143 , \uut_slave/n142 , \uut_slave/n141 ,
         \uut_slave/n140 , \uut_slave/n139 , \uut_slave/n138 ,
         \uut_slave/n137 , \uut_slave/n136 , \uut_slave/n135 ,
         \uut_slave/n134 , \uut_slave/n133 , \uut_slave/n132 ,
         \uut_slave/n131 , \uut_slave/n130 , \uut_slave/n129 ,
         \uut_slave/n128 , \uut_slave/n127 , \uut_slave/n126 ,
         \uut_slave/n125 , \uut_slave/n57 , \uut_slave/n56 , \uut_slave/n55 ,
         \uut_slave/n54 , \uut_slave/n53 , \uut_slave/n52 , \uut_slave/n16 ,
         \uut_slave/n15 , \uut_slave/n14 , \uut_slave/n13 , \uut_slave/n6 ,
         \uut_slave/N226 , \uut_slave/N225 , \uut_slave/N224 ,
         \uut_slave/N223 , \uut_slave/N219 , \uut_slave/N204 , \uut_slave/N41 ,
         \uut_slave/data_end ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [1:0] \uut_master/next_state ;
  wire   [5:0] \uut_master/data_count ;
  wire   [1:0] \uut_master/current_state ;
  wire   [1:0] \uut_slave/next_state ;
  wire   [5:0] \uut_slave/data_count ;

  DLH_X1 \data_in_reg[31]  ( .G(n18), .D(N70), .Q(data_in[31]) );
  DLH_X1 \data_in_reg[30]  ( .G(n18), .D(N69), .Q(data_in[30]) );
  DLH_X1 \data_in_reg[29]  ( .G(n18), .D(N68), .Q(data_in[29]) );
  DLH_X1 \data_in_reg[28]  ( .G(n18), .D(N67), .Q(data_in[28]) );
  DLH_X1 \data_in_reg[27]  ( .G(n18), .D(N66), .Q(data_in[27]) );
  DLH_X1 \data_in_reg[26]  ( .G(n18), .D(N65), .Q(data_in[26]) );
  DLH_X1 \data_in_reg[25]  ( .G(n18), .D(N64), .Q(data_in[25]) );
  DLH_X1 \data_in_reg[24]  ( .G(n18), .D(N63), .Q(data_in[24]) );
  DLH_X1 \data_in_reg[23]  ( .G(n18), .D(N61), .Q(data_in[23]) );
  DLH_X1 \data_in_reg[22]  ( .G(n18), .D(N60), .Q(data_in[22]) );
  DLH_X1 \data_in_reg[21]  ( .G(n18), .D(N59), .Q(data_in[21]) );
  DLH_X1 \data_in_reg[20]  ( .G(n19), .D(N58), .Q(data_in[20]) );
  DLH_X1 \data_in_reg[19]  ( .G(n19), .D(N57), .Q(data_in[19]) );
  DLH_X1 \data_in_reg[18]  ( .G(n19), .D(N56), .Q(data_in[18]) );
  DLH_X1 \data_in_reg[17]  ( .G(n19), .D(N55), .Q(data_in[17]) );
  DLH_X1 \data_in_reg[16]  ( .G(n19), .D(N54), .Q(data_in[16]) );
  DLH_X1 \data_in_reg[15]  ( .G(n19), .D(N53), .Q(data_in[15]) );
  DLH_X1 \data_in_reg[14]  ( .G(n19), .D(N52), .Q(data_in[14]) );
  DLH_X1 \data_in_reg[13]  ( .G(n19), .D(N51), .Q(data_in[13]) );
  DLH_X1 \data_in_reg[12]  ( .G(n19), .D(N50), .Q(data_in[12]) );
  DLH_X1 \data_in_reg[11]  ( .G(n19), .D(N49), .Q(data_in[11]) );
  DLH_X1 \data_in_reg[10]  ( .G(n19), .D(N48), .Q(data_in[10]) );
  DLH_X1 \data_in_reg[9]  ( .G(n20), .D(N47), .Q(data_in[9]) );
  DLH_X1 \data_in_reg[8]  ( .G(n20), .D(N46), .Q(data_in[8]) );
  DLH_X1 \data_in_reg[7]  ( .G(n20), .D(N44), .Q(data_in[7]) );
  DLH_X1 \data_in_reg[6]  ( .G(n20), .D(N43), .Q(data_in[6]) );
  DLH_X1 \data_in_reg[5]  ( .G(n20), .D(N42), .Q(data_in[5]) );
  DLH_X1 \data_in_reg[4]  ( .G(n20), .D(N41), .Q(data_in[4]) );
  DLH_X1 \data_in_reg[3]  ( .G(n20), .D(N40), .Q(data_in[3]) );
  DLH_X1 \data_in_reg[2]  ( .G(n20), .D(N39), .Q(data_in[2]) );
  DLH_X1 \data_in_reg[1]  ( .G(n20), .D(N38), .Q(data_in[1]) );
  DLH_X1 \data_in_reg[0]  ( .G(n20), .D(N36), .Q(data_in[0]) );
  DLH_X1 \address_reg[23]  ( .G(n22), .D(N61), .Q(address[23]) );
  DLH_X1 \address_reg[22]  ( .G(n22), .D(N60), .Q(address[22]) );
  DLH_X1 \address_reg[21]  ( .G(n22), .D(N59), .Q(address[21]) );
  DLH_X1 \address_reg[20]  ( .G(n22), .D(N58), .Q(address[20]) );
  DLH_X1 \address_reg[19]  ( .G(n22), .D(N57), .Q(address[19]) );
  DLH_X1 \address_reg[18]  ( .G(n22), .D(N56), .Q(address[18]) );
  DLH_X1 \address_reg[17]  ( .G(n22), .D(N55), .Q(address[17]) );
  DLH_X1 \address_reg[16]  ( .G(n22), .D(N54), .Q(address[16]) );
  DLH_X1 \address_reg[15]  ( .G(n22), .D(N53), .Q(address[15]) );
  DLH_X1 \address_reg[14]  ( .G(n22), .D(N52), .Q(address[14]) );
  DLH_X1 \address_reg[13]  ( .G(n22), .D(N51), .Q(address[13]) );
  DLH_X1 \address_reg[12]  ( .G(n23), .D(N50), .Q(address[12]) );
  DLH_X1 \address_reg[11]  ( .G(n23), .D(N49), .Q(address[11]) );
  DLH_X1 \address_reg[10]  ( .G(n23), .D(N48), .Q(address[10]) );
  DLH_X1 \address_reg[9]  ( .G(n23), .D(N47), .Q(address[9]) );
  DLH_X1 \address_reg[8]  ( .G(n23), .D(N46), .Q(address[8]) );
  DLH_X1 \address_reg[7]  ( .G(n23), .D(N44), .Q(address[7]) );
  DLH_X1 \address_reg[6]  ( .G(n23), .D(N43), .Q(address[6]) );
  DLH_X1 \address_reg[5]  ( .G(n23), .D(N42), .Q(address[5]) );
  DLH_X1 \address_reg[4]  ( .G(n23), .D(N41), .Q(address[4]) );
  DLH_X1 \address_reg[3]  ( .G(n23), .D(N40), .Q(address[3]) );
  DLH_X1 \address_reg[2]  ( .G(n23), .D(N39), .Q(address[2]) );
  DLH_X1 \address_reg[1]  ( .G(n24), .D(N38), .Q(address[1]) );
  DLH_X1 \address_reg[0]  ( .G(n24), .D(N36), .Q(address[0]) );
  DLH_X1 enable_reg ( .G(N35), .D(N36), .Q(enable) );
  DLH_X1 \command_reg[7]  ( .G(N37), .D(N44), .Q(command[7]) );
  DLH_X1 \command_reg[6]  ( .G(N37), .D(N43), .Q(command[6]) );
  DLH_X1 \command_reg[5]  ( .G(N37), .D(N42), .Q(command[5]) );
  DLH_X1 \command_reg[4]  ( .G(N37), .D(N41), .Q(command[4]) );
  DLH_X1 \command_reg[3]  ( .G(N37), .D(N40), .Q(command[3]) );
  DLH_X1 \command_reg[2]  ( .G(N37), .D(N39), .Q(command[2]) );
  DLH_X1 \command_reg[1]  ( .G(N37), .D(N38), .Q(command[1]) );
  DLH_X1 \command_reg[0]  ( .G(N37), .D(N36), .Q(command[0]) );
  DLH_X1 \read_data_reg[0]  ( .G(n16), .D(data_out[0]), .Q(read_data[0]) );
  DLH_X1 \read_data_reg[1]  ( .G(n16), .D(data_out[1]), .Q(read_data[1]) );
  DLH_X1 \read_data_reg[2]  ( .G(n16), .D(data_out[2]), .Q(read_data[2]) );
  DLH_X1 \read_data_reg[3]  ( .G(n16), .D(data_out[3]), .Q(read_data[3]) );
  DLH_X1 \read_data_reg[4]  ( .G(n16), .D(data_out[4]), .Q(read_data[4]) );
  DLH_X1 \read_data_reg[5]  ( .G(n16), .D(data_out[5]), .Q(read_data[5]) );
  DLH_X1 \read_data_reg[6]  ( .G(n16), .D(data_out[6]), .Q(read_data[6]) );
  DLH_X1 \read_data_reg[7]  ( .G(n16), .D(data_out[7]), .Q(read_data[7]) );
  DLH_X1 \read_data_reg[8]  ( .G(n16), .D(data_out[8]), .Q(read_data[8]) );
  DLH_X1 \read_data_reg[9]  ( .G(n16), .D(data_out[9]), .Q(read_data[9]) );
  DLH_X1 \read_data_reg[10]  ( .G(n15), .D(data_out[10]), .Q(read_data[10]) );
  DLH_X1 \read_data_reg[11]  ( .G(n15), .D(data_out[11]), .Q(read_data[11]) );
  DLH_X1 \read_data_reg[12]  ( .G(n15), .D(data_out[12]), .Q(read_data[12]) );
  DLH_X1 \read_data_reg[13]  ( .G(n15), .D(data_out[13]), .Q(read_data[13]) );
  DLH_X1 \read_data_reg[14]  ( .G(n15), .D(data_out[14]), .Q(read_data[14]) );
  DLH_X1 \read_data_reg[15]  ( .G(n15), .D(data_out[15]), .Q(read_data[15]) );
  DLH_X1 \read_data_reg[16]  ( .G(n15), .D(data_out[16]), .Q(read_data[16]) );
  DLH_X1 \read_data_reg[17]  ( .G(n15), .D(data_out[17]), .Q(read_data[17]) );
  DLH_X1 \read_data_reg[18]  ( .G(n15), .D(data_out[18]), .Q(read_data[18]) );
  DLH_X1 \read_data_reg[19]  ( .G(n15), .D(data_out[19]), .Q(read_data[19]) );
  DLH_X1 \read_data_reg[20]  ( .G(n15), .D(data_out[20]), .Q(read_data[20]) );
  DLH_X1 \read_data_reg[21]  ( .G(n14), .D(data_out[21]), .Q(read_data[21]) );
  DLH_X1 \read_data_reg[22]  ( .G(n14), .D(data_out[22]), .Q(read_data[22]) );
  DLH_X1 \read_data_reg[23]  ( .G(n14), .D(data_out[23]), .Q(read_data[23]) );
  DLH_X1 \read_data_reg[24]  ( .G(n14), .D(data_out[24]), .Q(read_data[24]) );
  DLH_X1 \read_data_reg[25]  ( .G(n14), .D(data_out[25]), .Q(read_data[25]) );
  DLH_X1 \read_data_reg[26]  ( .G(n14), .D(data_out[26]), .Q(read_data[26]) );
  DLH_X1 \read_data_reg[27]  ( .G(n14), .D(data_out[27]), .Q(read_data[27]) );
  DLH_X1 \read_data_reg[28]  ( .G(n14), .D(data_out[28]), .Q(read_data[28]) );
  DLH_X1 \read_data_reg[29]  ( .G(n14), .D(data_out[29]), .Q(read_data[29]) );
  DLH_X1 \read_data_reg[30]  ( .G(n14), .D(data_out[30]), .Q(read_data[30]) );
  DLH_X1 \read_data_reg[31]  ( .G(n14), .D(data_out[31]), .Q(read_data[31]) );
  NAND3_X1 U46 ( .A1(addr[0]), .A2(n7), .A3(addr[1]), .ZN(n6) );
  NAND3_X1 U47 ( .A1(n7), .A2(n28), .A3(addr[1]), .ZN(n8) );
  NAND3_X1 U48 ( .A1(n7), .A2(n27), .A3(addr[0]), .ZN(n9) );
  NAND3_X1 U49 ( .A1(n28), .A2(n27), .A3(n7), .ZN(n10) );
  BUF_X1 U50 ( .A(N45), .Z(n25) );
  BUF_X1 U51 ( .A(N62), .Z(n21) );
  BUF_X1 U52 ( .A(N71), .Z(n17) );
  NAND2_X1 U53 ( .A1(n11), .A2(n10), .ZN(N35) );
  BUF_X1 U54 ( .A(n26), .Z(n11) );
  BUF_X1 U55 ( .A(n26), .Z(n12) );
  BUF_X1 U56 ( .A(n17), .Z(n14) );
  BUF_X1 U57 ( .A(n17), .Z(n15) );
  BUF_X1 U58 ( .A(n17), .Z(n16) );
  BUF_X1 U59 ( .A(n25), .Z(n23) );
  BUF_X1 U60 ( .A(n25), .Z(n22) );
  BUF_X1 U61 ( .A(n21), .Z(n19) );
  BUF_X1 U62 ( .A(n21), .Z(n18) );
  BUF_X1 U63 ( .A(n21), .Z(n20) );
  BUF_X1 U64 ( .A(n26), .Z(n13) );
  BUF_X1 U65 ( .A(n25), .Z(n24) );
  NOR2_X1 U66 ( .A1(n29), .A2(addr[2]), .ZN(n7) );
  INV_X1 U67 ( .A(we), .ZN(n29) );
  NAND2_X1 U68 ( .A1(n11), .A2(n9), .ZN(N37) );
  NOR4_X1 U69 ( .A1(n5), .A2(addr[0]), .A3(rst), .A4(addr[1]), .ZN(N71) );
  NAND2_X1 U70 ( .A1(re), .A2(addr[2]), .ZN(n5) );
  AND2_X1 U71 ( .A1(write_data[0]), .A2(n11), .ZN(N36) );
  NAND2_X1 U72 ( .A1(n11), .A2(n8), .ZN(N45) );
  NAND2_X1 U73 ( .A1(n11), .A2(n6), .ZN(N62) );
  INV_X1 U74 ( .A(rst), .ZN(n26) );
  AND2_X1 U75 ( .A1(write_data[1]), .A2(n11), .ZN(N38) );
  AND2_X1 U76 ( .A1(write_data[2]), .A2(n11), .ZN(N39) );
  AND2_X1 U77 ( .A1(write_data[3]), .A2(n11), .ZN(N40) );
  AND2_X1 U78 ( .A1(write_data[4]), .A2(n11), .ZN(N41) );
  AND2_X1 U79 ( .A1(write_data[5]), .A2(n11), .ZN(N42) );
  AND2_X1 U80 ( .A1(write_data[6]), .A2(n12), .ZN(N43) );
  AND2_X1 U81 ( .A1(write_data[7]), .A2(n11), .ZN(N44) );
  AND2_X1 U82 ( .A1(write_data[8]), .A2(n11), .ZN(N46) );
  AND2_X1 U83 ( .A1(write_data[9]), .A2(n11), .ZN(N47) );
  AND2_X1 U84 ( .A1(write_data[10]), .A2(n11), .ZN(N48) );
  AND2_X1 U85 ( .A1(write_data[11]), .A2(n11), .ZN(N49) );
  AND2_X1 U86 ( .A1(write_data[12]), .A2(n12), .ZN(N50) );
  AND2_X1 U87 ( .A1(write_data[13]), .A2(n12), .ZN(N51) );
  AND2_X1 U88 ( .A1(write_data[14]), .A2(n12), .ZN(N52) );
  AND2_X1 U89 ( .A1(write_data[15]), .A2(n12), .ZN(N53) );
  AND2_X1 U90 ( .A1(write_data[16]), .A2(n12), .ZN(N54) );
  AND2_X1 U91 ( .A1(write_data[17]), .A2(n12), .ZN(N55) );
  AND2_X1 U92 ( .A1(write_data[18]), .A2(n12), .ZN(N56) );
  AND2_X1 U93 ( .A1(write_data[19]), .A2(n12), .ZN(N57) );
  AND2_X1 U94 ( .A1(write_data[20]), .A2(n12), .ZN(N58) );
  AND2_X1 U95 ( .A1(write_data[21]), .A2(n12), .ZN(N59) );
  AND2_X1 U96 ( .A1(write_data[22]), .A2(n12), .ZN(N60) );
  AND2_X1 U97 ( .A1(write_data[23]), .A2(n12), .ZN(N61) );
  INV_X1 U98 ( .A(addr[1]), .ZN(n27) );
  INV_X1 U99 ( .A(addr[0]), .ZN(n28) );
  AND2_X1 U100 ( .A1(write_data[24]), .A2(n12), .ZN(N63) );
  AND2_X1 U101 ( .A1(write_data[25]), .A2(n12), .ZN(N64) );
  AND2_X1 U102 ( .A1(write_data[26]), .A2(n12), .ZN(N65) );
  AND2_X1 U103 ( .A1(write_data[27]), .A2(n12), .ZN(N66) );
  AND2_X1 U104 ( .A1(write_data[28]), .A2(n12), .ZN(N67) );
  AND2_X1 U105 ( .A1(write_data[29]), .A2(n13), .ZN(N68) );
  AND2_X1 U106 ( .A1(write_data[30]), .A2(n13), .ZN(N69) );
  AND2_X1 U107 ( .A1(write_data[31]), .A2(n11), .ZN(N70) );
  NOR2_X1 \uut_master/U337  ( .A1(\uut_master/n14 ), .A2(\uut_master/n137 ), 
        .ZN(\uut_master/N164 ) );
  OAI222_X1 \uut_master/U336  ( .A1(\uut_master/net11615 ), .A2(
        \uut_master/n15 ), .B1(\uut_master/n14 ), .B2(\uut_master/n141 ), .C1(
        \uut_master/n118 ), .C2(\uut_master/n357 ), .ZN(\uut_master/n244 ) );
  OAI222_X1 \uut_master/U335  ( .A1(\uut_master/net11618 ), .A2(
        \uut_master/n16 ), .B1(\uut_master/n15 ), .B2(\uut_master/net11940 ), 
        .C1(\uut_master/n118 ), .C2(\uut_master/n356 ), .ZN(\uut_master/n245 )
         );
  OAI222_X1 \uut_master/U334  ( .A1(\uut_master/net11617 ), .A2(
        \uut_master/n17 ), .B1(\uut_master/n16 ), .B2(\uut_master/n141 ), .C1(
        \uut_master/n136 ), .C2(\uut_master/n355 ), .ZN(\uut_master/n246 ) );
  OAI222_X1 \uut_master/U333  ( .A1(\uut_master/n18 ), .A2(
        \uut_master/net11628 ), .B1(\uut_master/n17 ), .B2(
        \uut_master/net11929 ), .C1(\uut_master/n136 ), .C2(\uut_master/n354 ), 
        .ZN(\uut_master/n247 ) );
  OAI222_X1 \uut_master/U332  ( .A1(\uut_master/n19 ), .A2(
        \uut_master/net11476 ), .B1(\uut_master/n18 ), .B2(\uut_master/n139 ), 
        .C1(\uut_master/n136 ), .C2(\uut_master/n353 ), .ZN(\uut_master/n248 )
         );
  INV_X1 \uut_master/U331  ( .A(command[3]), .ZN(\uut_master/n353 ) );
  OAI222_X1 \uut_master/U330  ( .A1(\uut_master/net11616 ), .A2(
        \uut_master/n20 ), .B1(\uut_master/n19 ), .B2(\uut_master/net11931 ), 
        .C1(\uut_master/n118 ), .C2(\uut_master/n352 ), .ZN(\uut_master/n249 )
         );
  INV_X1 \uut_master/U329  ( .A(command[2]), .ZN(\uut_master/n352 ) );
  OAI222_X1 \uut_master/U328  ( .A1(\uut_master/n21 ), .A2(
        \uut_master/net11620 ), .B1(\uut_master/n20 ), .B2(\uut_master/n143 ), 
        .C1(\uut_master/n136 ), .C2(\uut_master/n351 ), .ZN(\uut_master/n250 )
         );
  OAI222_X1 \uut_master/U327  ( .A1(\uut_master/net11614 ), .A2(
        \uut_master/n22 ), .B1(\uut_master/n21 ), .B2(\uut_master/n141 ), .C1(
        \uut_master/n118 ), .C2(\uut_master/n350 ), .ZN(\uut_master/n251 ) );
  NAND2_X1 \uut_master/U326  ( .A1(address[23]), .A2(\uut_master/n157 ), .ZN(
        \uut_master/net11308 ) );
  OAI221_X1 \uut_master/U325  ( .B1(\uut_master/n23 ), .B2(
        \uut_master/net11943 ), .C1(\uut_master/net11644 ), .C2(
        \uut_master/n24 ), .A(\uut_master/n349 ), .ZN(\uut_master/n253 ) );
  NAND2_X1 \uut_master/U324  ( .A1(address[22]), .A2(\uut_master/n160 ), .ZN(
        \uut_master/n349 ) );
  OAI221_X1 \uut_master/U323  ( .B1(\uut_master/n24 ), .B2(
        \uut_master/net11929 ), .C1(\uut_master/net11645 ), .C2(
        \uut_master/n25 ), .A(\uut_master/n348 ), .ZN(\uut_master/n254 ) );
  NAND2_X1 \uut_master/U322  ( .A1(address[21]), .A2(\uut_master/n159 ), .ZN(
        \uut_master/n348 ) );
  OAI221_X1 \uut_master/U321  ( .B1(\uut_master/n25 ), .B2(
        \uut_master/net11929 ), .C1(\uut_master/net11646 ), .C2(
        \uut_master/n26 ), .A(\uut_master/n347 ), .ZN(\uut_master/n255 ) );
  NAND2_X1 \uut_master/U320  ( .A1(address[20]), .A2(\uut_master/n158 ), .ZN(
        \uut_master/n347 ) );
  OAI221_X1 \uut_master/U319  ( .B1(\uut_master/n26 ), .B2(\uut_master/n142 ), 
        .C1(\uut_master/net11643 ), .C2(\uut_master/n27 ), .A(
        \uut_master/n346 ), .ZN(\uut_master/n256 ) );
  NAND2_X1 \uut_master/U318  ( .A1(address[19]), .A2(\uut_master/n160 ), .ZN(
        \uut_master/n346 ) );
  OAI221_X1 \uut_master/U317  ( .B1(\uut_master/n27 ), .B2(\uut_master/n143 ), 
        .C1(\uut_master/net11644 ), .C2(\uut_master/n28 ), .A(
        \uut_master/n345 ), .ZN(\uut_master/n257 ) );
  NAND2_X1 \uut_master/U316  ( .A1(address[18]), .A2(\uut_master/n157 ), .ZN(
        \uut_master/n345 ) );
  OAI221_X1 \uut_master/U315  ( .B1(\uut_master/n28 ), .B2(
        \uut_master/net11931 ), .C1(\uut_master/net11641 ), .C2(
        \uut_master/n29 ), .A(\uut_master/n344 ), .ZN(\uut_master/n258 ) );
  NAND2_X1 \uut_master/U314  ( .A1(address[17]), .A2(\uut_master/n158 ), .ZN(
        \uut_master/n344 ) );
  OAI221_X1 \uut_master/U313  ( .B1(\uut_master/n29 ), .B2(
        \uut_master/net11943 ), .C1(\uut_master/net11642 ), .C2(
        \uut_master/n30 ), .A(\uut_master/n343 ), .ZN(\uut_master/n259 ) );
  NAND2_X1 \uut_master/U312  ( .A1(address[16]), .A2(\uut_master/n159 ), .ZN(
        \uut_master/n343 ) );
  OAI221_X1 \uut_master/U311  ( .B1(\uut_master/n30 ), .B2(
        \uut_master/net11942 ), .C1(\uut_master/net11639 ), .C2(
        \uut_master/n31 ), .A(\uut_master/n342 ), .ZN(\uut_master/n260 ) );
  NAND2_X1 \uut_master/U310  ( .A1(address[15]), .A2(\uut_master/n160 ), .ZN(
        \uut_master/n342 ) );
  OAI221_X1 \uut_master/U309  ( .B1(\uut_master/n31 ), .B2(\uut_master/n107 ), 
        .C1(\uut_master/net11640 ), .C2(\uut_master/n32 ), .A(
        \uut_master/n341 ), .ZN(\uut_master/n261 ) );
  NAND2_X1 \uut_master/U308  ( .A1(address[14]), .A2(\uut_master/n159 ), .ZN(
        \uut_master/n341 ) );
  OAI221_X1 \uut_master/U307  ( .B1(\uut_master/n32 ), .B2(\uut_master/n142 ), 
        .C1(\uut_master/net11639 ), .C2(\uut_master/n33 ), .A(
        \uut_master/n340 ), .ZN(\uut_master/n262 ) );
  NAND2_X1 \uut_master/U306  ( .A1(address[13]), .A2(\uut_master/n158 ), .ZN(
        \uut_master/n340 ) );
  OAI221_X1 \uut_master/U305  ( .B1(\uut_master/n33 ), .B2(
        \uut_master/net11933 ), .C1(\uut_master/net11638 ), .C2(
        \uut_master/n34 ), .A(\uut_master/n339 ), .ZN(\uut_master/n263 ) );
  NAND2_X1 \uut_master/U304  ( .A1(address[12]), .A2(\uut_master/n157 ), .ZN(
        \uut_master/n339 ) );
  OAI221_X1 \uut_master/U303  ( .B1(\uut_master/n34 ), .B2(
        \uut_master/net11933 ), .C1(\uut_master/net11631 ), .C2(
        \uut_master/n35 ), .A(\uut_master/n338 ), .ZN(\uut_master/n264 ) );
  NAND2_X1 \uut_master/U302  ( .A1(address[11]), .A2(\uut_master/n160 ), .ZN(
        \uut_master/n338 ) );
  OAI221_X1 \uut_master/U301  ( .B1(\uut_master/n35 ), .B2(\uut_master/n141 ), 
        .C1(\uut_master/n36 ), .C2(\uut_master/net11622 ), .A(
        \uut_master/n337 ), .ZN(\uut_master/n265 ) );
  NAND2_X1 \uut_master/U300  ( .A1(address[10]), .A2(\uut_master/n160 ), .ZN(
        \uut_master/n337 ) );
  OAI221_X1 \uut_master/U299  ( .B1(\uut_master/n36 ), .B2(\uut_master/n144 ), 
        .C1(\uut_master/net11628 ), .C2(\uut_master/n37 ), .A(
        \uut_master/n336 ), .ZN(\uut_master/n266 ) );
  NAND2_X1 \uut_master/U298  ( .A1(address[9]), .A2(\uut_master/n159 ), .ZN(
        \uut_master/n336 ) );
  OAI221_X1 \uut_master/U297  ( .B1(\uut_master/n37 ), .B2(\uut_master/n142 ), 
        .C1(\uut_master/net11622 ), .C2(\uut_master/n38 ), .A(
        \uut_master/n335 ), .ZN(\uut_master/n267 ) );
  NAND2_X1 \uut_master/U296  ( .A1(address[8]), .A2(\uut_master/n158 ), .ZN(
        \uut_master/n335 ) );
  OAI221_X1 \uut_master/U295  ( .B1(\uut_master/n38 ), .B2(
        \uut_master/net11943 ), .C1(\uut_master/net11643 ), .C2(
        \uut_master/n39 ), .A(\uut_master/n334 ), .ZN(\uut_master/n268 ) );
  NAND2_X1 \uut_master/U294  ( .A1(address[7]), .A2(\uut_master/n157 ), .ZN(
        \uut_master/n334 ) );
  OAI221_X1 \uut_master/U293  ( .B1(\uut_master/n39 ), .B2(
        \uut_master/net11934 ), .C1(\uut_master/n40 ), .C2(
        \uut_master/net11631 ), .A(\uut_master/n333 ), .ZN(\uut_master/n269 )
         );
  NAND2_X1 \uut_master/U292  ( .A1(address[6]), .A2(\uut_master/n158 ), .ZN(
        \uut_master/n333 ) );
  OAI221_X1 \uut_master/U291  ( .B1(\uut_master/n40 ), .B2(\uut_master/n144 ), 
        .C1(\uut_master/net11642 ), .C2(\uut_master/n41 ), .A(
        \uut_master/n332 ), .ZN(\uut_master/n270 ) );
  NAND2_X1 \uut_master/U290  ( .A1(address[5]), .A2(\uut_master/n157 ), .ZN(
        \uut_master/n332 ) );
  OAI221_X1 \uut_master/U289  ( .B1(\uut_master/n41 ), .B2(
        \uut_master/net11943 ), .C1(\uut_master/n119 ), .C2(\uut_master/n42 ), 
        .A(\uut_master/n331 ), .ZN(\uut_master/n271 ) );
  NAND2_X1 \uut_master/U288  ( .A1(address[4]), .A2(\uut_master/n159 ), .ZN(
        \uut_master/n331 ) );
  OAI221_X1 \uut_master/U287  ( .B1(\uut_master/n42 ), .B2(\uut_master/n142 ), 
        .C1(\uut_master/net11641 ), .C2(\uut_master/n43 ), .A(
        \uut_master/n330 ), .ZN(\uut_master/n272 ) );
  NAND2_X1 \uut_master/U286  ( .A1(address[3]), .A2(\uut_master/n160 ), .ZN(
        \uut_master/n330 ) );
  OAI221_X1 \uut_master/U285  ( .B1(\uut_master/n43 ), .B2(
        \uut_master/net11933 ), .C1(\uut_master/net11623 ), .C2(
        \uut_master/n44 ), .A(\uut_master/n329 ), .ZN(\uut_master/n273 ) );
  NAND2_X1 \uut_master/U284  ( .A1(address[2]), .A2(\uut_master/n159 ), .ZN(
        \uut_master/n329 ) );
  OAI221_X1 \uut_master/U283  ( .B1(\uut_master/n44 ), .B2(
        \uut_master/net11928 ), .C1(\uut_master/net11640 ), .C2(
        \uut_master/n45 ), .A(\uut_master/n328 ), .ZN(\uut_master/n274 ) );
  NAND2_X1 \uut_master/U282  ( .A1(address[1]), .A2(\uut_master/n158 ), .ZN(
        \uut_master/n328 ) );
  OAI221_X1 \uut_master/U281  ( .B1(\uut_master/n45 ), .B2(\uut_master/n144 ), 
        .C1(\uut_master/net11624 ), .C2(\uut_master/n46 ), .A(
        \uut_master/n327 ), .ZN(\uut_master/n275 ) );
  NAND2_X1 \uut_master/U280  ( .A1(address[0]), .A2(\uut_master/n157 ), .ZN(
        \uut_master/n327 ) );
  OAI221_X1 \uut_master/U279  ( .B1(\uut_master/n46 ), .B2(
        \uut_master/net11931 ), .C1(\uut_master/net11638 ), .C2(
        \uut_master/n47 ), .A(\uut_master/n326 ), .ZN(\uut_master/n276 ) );
  NAND2_X1 \uut_master/U278  ( .A1(data_in[31]), .A2(\uut_master/net11723 ), 
        .ZN(\uut_master/n326 ) );
  OAI221_X1 \uut_master/U277  ( .B1(\uut_master/n47 ), .B2(\uut_master/n139 ), 
        .C1(\uut_master/n48 ), .C2(\uut_master/net11623 ), .A(
        \uut_master/n325 ), .ZN(\uut_master/n277 ) );
  NAND2_X1 \uut_master/U276  ( .A1(data_in[30]), .A2(\uut_master/net11870 ), 
        .ZN(\uut_master/n325 ) );
  OAI221_X1 \uut_master/U275  ( .B1(\uut_master/n48 ), .B2(\uut_master/n142 ), 
        .C1(\uut_master/net11645 ), .C2(\uut_master/n49 ), .A(
        \uut_master/n324 ), .ZN(\uut_master/n278 ) );
  NAND2_X1 \uut_master/U274  ( .A1(data_in[29]), .A2(\uut_master/n120 ), .ZN(
        \uut_master/n324 ) );
  OAI221_X1 \uut_master/U273  ( .B1(\uut_master/n49 ), .B2(\uut_master/n140 ), 
        .C1(\uut_master/net11631 ), .C2(\uut_master/n50 ), .A(
        \uut_master/n323 ), .ZN(\uut_master/n279 ) );
  NAND2_X1 \uut_master/U272  ( .A1(data_in[28]), .A2(\uut_master/net11869 ), 
        .ZN(\uut_master/n323 ) );
  OAI221_X1 \uut_master/U271  ( .B1(\uut_master/n50 ), .B2(\uut_master/n142 ), 
        .C1(\uut_master/net11630 ), .C2(\uut_master/n51 ), .A(
        \uut_master/n322 ), .ZN(\uut_master/n280 ) );
  NAND2_X1 \uut_master/U270  ( .A1(data_in[27]), .A2(\uut_master/net11335 ), 
        .ZN(\uut_master/n322 ) );
  OAI221_X1 \uut_master/U269  ( .B1(\uut_master/n51 ), .B2(
        \uut_master/net11933 ), .C1(\uut_master/net11623 ), .C2(
        \uut_master/n52 ), .A(\uut_master/n321 ), .ZN(\uut_master/n281 ) );
  NAND2_X1 \uut_master/U268  ( .A1(data_in[26]), .A2(\uut_master/net11724 ), 
        .ZN(\uut_master/n321 ) );
  OAI221_X1 \uut_master/U267  ( .B1(\uut_master/net11928 ), .B2(
        \uut_master/n52 ), .C1(\uut_master/net11620 ), .C2(\uut_master/n53 ), 
        .A(\uut_master/n320 ), .ZN(\uut_master/n282 ) );
  NAND2_X1 \uut_master/U266  ( .A1(data_in[25]), .A2(\uut_master/net11869 ), 
        .ZN(\uut_master/n320 ) );
  OAI221_X1 \uut_master/U265  ( .B1(\uut_master/net11929 ), .B2(
        \uut_master/n53 ), .C1(\uut_master/net11622 ), .C2(\uut_master/n54 ), 
        .A(\uut_master/n319 ), .ZN(\uut_master/n283 ) );
  NAND2_X1 \uut_master/U264  ( .A1(data_in[24]), .A2(\uut_master/n120 ), .ZN(
        \uut_master/n319 ) );
  OAI221_X1 \uut_master/U263  ( .B1(\uut_master/n54 ), .B2(\uut_master/n141 ), 
        .C1(\uut_master/n55 ), .C2(\uut_master/net11626 ), .A(
        \uut_master/n318 ), .ZN(\uut_master/n284 ) );
  NAND2_X1 \uut_master/U262  ( .A1(data_in[23]), .A2(\uut_master/net11335 ), 
        .ZN(\uut_master/n318 ) );
  OAI221_X1 \uut_master/U261  ( .B1(\uut_master/n55 ), .B2(
        \uut_master/net11943 ), .C1(\uut_master/n119 ), .C2(\uut_master/n56 ), 
        .A(\uut_master/n317 ), .ZN(\uut_master/n285 ) );
  NAND2_X1 \uut_master/U260  ( .A1(data_in[22]), .A2(\uut_master/net11723 ), 
        .ZN(\uut_master/n317 ) );
  OAI221_X1 \uut_master/U259  ( .B1(\uut_master/n56 ), .B2(\uut_master/n143 ), 
        .C1(\uut_master/n57 ), .C2(\uut_master/net11630 ), .A(
        \uut_master/n316 ), .ZN(\uut_master/n286 ) );
  NAND2_X1 \uut_master/U258  ( .A1(data_in[21]), .A2(\uut_master/n120 ), .ZN(
        \uut_master/n316 ) );
  OAI221_X1 \uut_master/U257  ( .B1(\uut_master/n57 ), .B2(
        \uut_master/net11928 ), .C1(\uut_master/net11649 ), .C2(
        \uut_master/n58 ), .A(\uut_master/n315 ), .ZN(\uut_master/n287 ) );
  NAND2_X1 \uut_master/U256  ( .A1(data_in[20]), .A2(\uut_master/net11869 ), 
        .ZN(\uut_master/n315 ) );
  OAI221_X1 \uut_master/U255  ( .B1(\uut_master/n58 ), .B2(\uut_master/n143 ), 
        .C1(\uut_master/net11630 ), .C2(\uut_master/n59 ), .A(
        \uut_master/n314 ), .ZN(\uut_master/n288 ) );
  NAND2_X1 \uut_master/U254  ( .A1(\uut_master/net11724 ), .A2(data_in[19]), 
        .ZN(\uut_master/n314 ) );
  OAI221_X1 \uut_master/U253  ( .B1(\uut_master/n107 ), .B2(\uut_master/n59 ), 
        .C1(\uut_master/net11618 ), .C2(\uut_master/n60 ), .A(
        \uut_master/n313 ), .ZN(\uut_master/n289 ) );
  NAND2_X1 \uut_master/U252  ( .A1(data_in[18]), .A2(\uut_master/n120 ), .ZN(
        \uut_master/n313 ) );
  OAI221_X1 \uut_master/U251  ( .B1(\uut_master/n60 ), .B2(
        \uut_master/net11939 ), .C1(\uut_master/n61 ), .C2(
        \uut_master/net11617 ), .A(\uut_master/n312 ), .ZN(\uut_master/n290 )
         );
  NAND2_X1 \uut_master/U250  ( .A1(data_in[17]), .A2(\uut_master/net11335 ), 
        .ZN(\uut_master/n312 ) );
  OAI221_X1 \uut_master/U249  ( .B1(\uut_master/n61 ), .B2(\uut_master/n140 ), 
        .C1(\uut_master/n62 ), .C2(\uut_master/net11620 ), .A(
        \uut_master/n311 ), .ZN(\uut_master/n291 ) );
  NAND2_X1 \uut_master/U248  ( .A1(data_in[16]), .A2(\uut_master/net11870 ), 
        .ZN(\uut_master/n311 ) );
  OAI221_X1 \uut_master/U247  ( .B1(\uut_master/n62 ), .B2(\uut_master/n139 ), 
        .C1(\uut_master/n63 ), .C2(\uut_master/net11616 ), .A(
        \uut_master/n310 ), .ZN(\uut_master/n292 ) );
  NAND2_X1 \uut_master/U246  ( .A1(data_in[15]), .A2(\uut_master/net11869 ), 
        .ZN(\uut_master/n310 ) );
  OAI221_X1 \uut_master/U245  ( .B1(\uut_master/n107 ), .B2(\uut_master/n63 ), 
        .C1(\uut_master/net11615 ), .C2(\uut_master/n64 ), .A(
        \uut_master/n309 ), .ZN(\uut_master/n293 ) );
  NAND2_X1 \uut_master/U244  ( .A1(data_in[14]), .A2(\uut_master/net11335 ), 
        .ZN(\uut_master/n309 ) );
  OAI221_X1 \uut_master/U243  ( .B1(\uut_master/n64 ), .B2(
        \uut_master/net11940 ), .C1(\uut_master/n65 ), .C2(
        \uut_master/net11614 ), .A(\uut_master/n308 ), .ZN(\uut_master/n294 )
         );
  NAND2_X1 \uut_master/U242  ( .A1(data_in[13]), .A2(\uut_master/net11724 ), 
        .ZN(\uut_master/n308 ) );
  OAI221_X1 \uut_master/U241  ( .B1(\uut_master/n65 ), .B2(\uut_master/n140 ), 
        .C1(\uut_master/net11637 ), .C2(\uut_master/n66 ), .A(
        \uut_master/n209 ), .ZN(\uut_master/n295 ) );
  NAND2_X1 \uut_master/U240  ( .A1(data_in[12]), .A2(\uut_master/net11724 ), 
        .ZN(\uut_master/n209 ) );
  OAI221_X1 \uut_master/U239  ( .B1(\uut_master/n66 ), .B2(
        \uut_master/net11939 ), .C1(\uut_master/net11636 ), .C2(
        \uut_master/n67 ), .A(\uut_master/n208 ), .ZN(\uut_master/n296 ) );
  NAND2_X1 \uut_master/U238  ( .A1(data_in[11]), .A2(\uut_master/net11723 ), 
        .ZN(\uut_master/n208 ) );
  OAI221_X1 \uut_master/U237  ( .B1(\uut_master/n67 ), .B2(
        \uut_master/net11937 ), .C1(\uut_master/net11635 ), .C2(
        \uut_master/n68 ), .A(\uut_master/n207 ), .ZN(\uut_master/n297 ) );
  NAND2_X1 \uut_master/U236  ( .A1(data_in[10]), .A2(\uut_master/net11724 ), 
        .ZN(\uut_master/n207 ) );
  OAI221_X1 \uut_master/U235  ( .B1(\uut_master/n68 ), .B2(
        \uut_master/net11934 ), .C1(\uut_master/net11634 ), .C2(
        \uut_master/n69 ), .A(\uut_master/n206 ), .ZN(\uut_master/n298 ) );
  NAND2_X1 \uut_master/U234  ( .A1(data_in[9]), .A2(\uut_master/net11724 ), 
        .ZN(\uut_master/n206 ) );
  OAI221_X1 \uut_master/U233  ( .B1(\uut_master/n69 ), .B2(\uut_master/n141 ), 
        .C1(\uut_master/n70 ), .C2(\uut_master/n106 ), .A(\uut_master/n205 ), 
        .ZN(\uut_master/n299 ) );
  NAND2_X1 \uut_master/U232  ( .A1(data_in[8]), .A2(\uut_master/net11723 ), 
        .ZN(\uut_master/n205 ) );
  OAI221_X1 \uut_master/U231  ( .B1(\uut_master/n70 ), .B2(\uut_master/n140 ), 
        .C1(\uut_master/net11632 ), .C2(\uut_master/n71 ), .A(
        \uut_master/n204 ), .ZN(\uut_master/n300 ) );
  NAND2_X1 \uut_master/U230  ( .A1(data_in[7]), .A2(\uut_master/net11335 ), 
        .ZN(\uut_master/n204 ) );
  OAI221_X1 \uut_master/U229  ( .B1(\uut_master/n71 ), .B2(\uut_master/n143 ), 
        .C1(\uut_master/net11649 ), .C2(\uut_master/n72 ), .A(
        \uut_master/n203 ), .ZN(\uut_master/n301 ) );
  NAND2_X1 \uut_master/U228  ( .A1(data_in[6]), .A2(\uut_master/net11723 ), 
        .ZN(\uut_master/n203 ) );
  OAI221_X1 \uut_master/U227  ( .B1(\uut_master/n72 ), .B2(\uut_master/n143 ), 
        .C1(\uut_master/n73 ), .C2(\uut_master/net11626 ), .A(
        \uut_master/n202 ), .ZN(\uut_master/n302 ) );
  NAND2_X1 \uut_master/U226  ( .A1(\uut_master/net11335 ), .A2(data_in[5]), 
        .ZN(\uut_master/n202 ) );
  OAI221_X1 \uut_master/U225  ( .B1(\uut_master/n73 ), .B2(\uut_master/n143 ), 
        .C1(\uut_master/n74 ), .C2(\uut_master/net11624 ), .A(
        \uut_master/n201 ), .ZN(\uut_master/n303 ) );
  NAND2_X1 \uut_master/U224  ( .A1(data_in[4]), .A2(\uut_master/net11870 ), 
        .ZN(\uut_master/n201 ) );
  OAI221_X1 \uut_master/U223  ( .B1(\uut_master/n74 ), .B2(
        \uut_master/net11937 ), .C1(\uut_master/net11646 ), .C2(
        \uut_master/n75 ), .A(\uut_master/n200 ), .ZN(\uut_master/n304 ) );
  NAND2_X1 \uut_master/U222  ( .A1(data_in[3]), .A2(\uut_master/net11869 ), 
        .ZN(\uut_master/n200 ) );
  OAI221_X1 \uut_master/U221  ( .B1(\uut_master/n75 ), .B2(
        \uut_master/net11942 ), .C1(\uut_master/net11624 ), .C2(
        \uut_master/n76 ), .A(\uut_master/n199 ), .ZN(\uut_master/n305 ) );
  NAND2_X1 \uut_master/U220  ( .A1(\uut_master/net11869 ), .A2(data_in[2]), 
        .ZN(\uut_master/n199 ) );
  INV_X1 \uut_master/U219  ( .A(\uut_master/n198 ), .ZN(\uut_master/n307 ) );
  AOI22_X1 \uut_master/U218  ( .A1(\uut_master/n138 ), .A2(
        \uut_master/net11368 ), .B1(data_in[0]), .B2(\uut_master/net11870 ), 
        .ZN(\uut_master/n198 ) );
  INV_X1 \uut_master/U217  ( .A(\uut_master/n4 ), .ZN(\uut_master/net11335 )
         );
  NOR4_X1 \uut_master/U216  ( .A1(\uut_master/n196 ), .A2(\uut_master/n195 ), 
        .A3(command[2]), .A4(command[3]), .ZN(\uut_master/n197 ) );
  NAND3_X1 \uut_master/U215  ( .A1(\uut_master/net11333 ), .A2(
        \uut_master/n350 ), .A3(\uut_master/n351 ), .ZN(\uut_master/n195 ) );
  INV_X1 \uut_master/U214  ( .A(command[1]), .ZN(\uut_master/n351 ) );
  INV_X1 \uut_master/U213  ( .A(command[0]), .ZN(\uut_master/n350 ) );
  NAND4_X1 \uut_master/U212  ( .A1(\uut_master/n355 ), .A2(\uut_master/n354 ), 
        .A3(\uut_master/n357 ), .A4(\uut_master/n356 ), .ZN(\uut_master/n196 )
         );
  INV_X1 \uut_master/U211  ( .A(command[6]), .ZN(\uut_master/n356 ) );
  INV_X1 \uut_master/U210  ( .A(command[7]), .ZN(\uut_master/n357 ) );
  INV_X1 \uut_master/U209  ( .A(command[4]), .ZN(\uut_master/n354 ) );
  INV_X1 \uut_master/U208  ( .A(command[5]), .ZN(\uut_master/n355 ) );
  OAI22_X1 \uut_master/U207  ( .A1(\uut_master/n162 ), .A2(\uut_master/n194 ), 
        .B1(\uut_master/n79 ), .B2(\uut_master/n155 ), .ZN(\uut_master/n210 )
         );
  OAI22_X1 \uut_master/U206  ( .A1(\uut_master/n79 ), .A2(\uut_master/n112 ), 
        .B1(\uut_master/n152 ), .B2(\uut_master/n80 ), .ZN(\uut_master/n211 )
         );
  OAI22_X1 \uut_master/U205  ( .A1(\uut_master/n80 ), .A2(\uut_master/n126 ), 
        .B1(\uut_master/n81 ), .B2(\uut_master/n154 ), .ZN(\uut_master/n212 )
         );
  OAI22_X1 \uut_master/U204  ( .A1(\uut_master/n162 ), .A2(\uut_master/n81 ), 
        .B1(\uut_master/n82 ), .B2(\uut_master/n150 ), .ZN(\uut_master/n213 )
         );
  OAI22_X1 \uut_master/U203  ( .A1(\uut_master/n82 ), .A2(\uut_master/n117 ), 
        .B1(\uut_master/n83 ), .B2(\uut_master/n150 ), .ZN(\uut_master/n214 )
         );
  OAI22_X1 \uut_master/U202  ( .A1(\uut_master/n126 ), .A2(\uut_master/n83 ), 
        .B1(\uut_master/n84 ), .B2(\uut_master/n150 ), .ZN(\uut_master/n215 )
         );
  OAI22_X1 \uut_master/U201  ( .A1(\uut_master/n84 ), .A2(\uut_master/n116 ), 
        .B1(\uut_master/n85 ), .B2(\uut_master/n155 ), .ZN(\uut_master/n216 )
         );
  OAI22_X1 \uut_master/U200  ( .A1(\uut_master/n163 ), .A2(\uut_master/n85 ), 
        .B1(\uut_master/n86 ), .B2(\uut_master/n151 ), .ZN(\uut_master/n217 )
         );
  OAI22_X1 \uut_master/U199  ( .A1(\uut_master/n86 ), .A2(\uut_master/n163 ), 
        .B1(\uut_master/n87 ), .B2(\uut_master/n150 ), .ZN(\uut_master/n218 )
         );
  OAI22_X1 \uut_master/U198  ( .A1(\uut_master/n111 ), .A2(\uut_master/n87 ), 
        .B1(\uut_master/n88 ), .B2(\uut_master/n151 ), .ZN(\uut_master/n219 )
         );
  OAI22_X1 \uut_master/U197  ( .A1(\uut_master/n88 ), .A2(\uut_master/n116 ), 
        .B1(\uut_master/n89 ), .B2(\uut_master/n151 ), .ZN(\uut_master/n220 )
         );
  OAI22_X1 \uut_master/U196  ( .A1(\uut_master/n89 ), .A2(\uut_master/n163 ), 
        .B1(\uut_master/n90 ), .B2(\uut_master/n154 ), .ZN(\uut_master/n221 )
         );
  OAI22_X1 \uut_master/U195  ( .A1(\uut_master/n90 ), .A2(\uut_master/n161 ), 
        .B1(\uut_master/n91 ), .B2(\uut_master/n151 ), .ZN(\uut_master/n222 )
         );
  OAI22_X1 \uut_master/U194  ( .A1(\uut_master/n91 ), .A2(\uut_master/n127 ), 
        .B1(\uut_master/n92 ), .B2(\uut_master/n150 ), .ZN(\uut_master/n223 )
         );
  OAI22_X1 \uut_master/U193  ( .A1(\uut_master/n115 ), .A2(\uut_master/n92 ), 
        .B1(\uut_master/n155 ), .B2(\uut_master/n93 ), .ZN(\uut_master/n224 )
         );
  OAI22_X1 \uut_master/U192  ( .A1(\uut_master/n116 ), .A2(\uut_master/n93 ), 
        .B1(\uut_master/n94 ), .B2(\uut_master/n153 ), .ZN(\uut_master/n225 )
         );
  OAI22_X1 \uut_master/U191  ( .A1(\uut_master/n94 ), .A2(\uut_master/n161 ), 
        .B1(\uut_master/n95 ), .B2(\uut_master/n155 ), .ZN(\uut_master/n226 )
         );
  OAI22_X1 \uut_master/U190  ( .A1(\uut_master/n127 ), .A2(\uut_master/n95 ), 
        .B1(\uut_master/n96 ), .B2(\uut_master/n151 ), .ZN(\uut_master/n227 )
         );
  OAI22_X1 \uut_master/U189  ( .A1(\uut_master/n111 ), .A2(\uut_master/n96 ), 
        .B1(\uut_master/n97 ), .B2(\uut_master/n153 ), .ZN(\uut_master/n228 )
         );
  OAI22_X1 \uut_master/U188  ( .A1(\uut_master/n117 ), .A2(\uut_master/n97 ), 
        .B1(\uut_master/n98 ), .B2(\uut_master/n152 ), .ZN(\uut_master/n229 )
         );
  OAI22_X1 \uut_master/U187  ( .A1(\uut_master/n98 ), .A2(\uut_master/n162 ), 
        .B1(\uut_master/n99 ), .B2(\uut_master/n155 ), .ZN(\uut_master/n230 )
         );
  OAI22_X1 \uut_master/U186  ( .A1(\uut_master/n113 ), .A2(\uut_master/n99 ), 
        .B1(\uut_master/n100 ), .B2(\uut_master/n152 ), .ZN(\uut_master/n231 )
         );
  OAI22_X1 \uut_master/U185  ( .A1(\uut_master/n113 ), .A2(\uut_master/n100 ), 
        .B1(\uut_master/n101 ), .B2(\uut_master/n152 ), .ZN(\uut_master/n232 )
         );
  OAI22_X1 \uut_master/U184  ( .A1(\uut_master/n101 ), .A2(\uut_master/n127 ), 
        .B1(\uut_master/n102 ), .B2(\uut_master/n155 ), .ZN(\uut_master/n233 )
         );
  OAI22_X1 \uut_master/U183  ( .A1(\uut_master/n102 ), .A2(\uut_master/n115 ), 
        .B1(\uut_master/n103 ), .B2(\uut_master/n154 ), .ZN(\uut_master/n234 )
         );
  OAI22_X1 \uut_master/U182  ( .A1(\uut_master/n161 ), .A2(\uut_master/n103 ), 
        .B1(\uut_master/n104 ), .B2(\uut_master/n153 ), .ZN(\uut_master/n235 )
         );
  OAI22_X1 \uut_master/U181  ( .A1(\uut_master/n104 ), .A2(\uut_master/n117 ), 
        .B1(\uut_master/n105 ), .B2(\uut_master/n154 ), .ZN(\uut_master/n236 )
         );
  OAI22_X1 \uut_master/U180  ( .A1(\uut_master/n105 ), .A2(\uut_master/n126 ), 
        .B1(\uut_master/n192 ), .B2(\uut_master/n153 ), .ZN(\uut_master/n237 )
         );
  OAI22_X1 \uut_master/U179  ( .A1(\uut_master/n111 ), .A2(\uut_master/n192 ), 
        .B1(\uut_master/n152 ), .B2(\uut_master/n191 ), .ZN(\uut_master/n363 )
         );
  OAI22_X1 \uut_master/U178  ( .A1(\uut_master/n113 ), .A2(\uut_master/n191 ), 
        .B1(\uut_master/n153 ), .B2(\uut_master/n190 ), .ZN(\uut_master/n362 )
         );
  OAI22_X1 \uut_master/U177  ( .A1(\uut_master/n115 ), .A2(\uut_master/n190 ), 
        .B1(\uut_master/n154 ), .B2(\uut_master/n189 ), .ZN(\uut_master/n361 )
         );
  NAND4_X1 \uut_master/U176  ( .A1(\uut_master/n13 ), .A2(
        \uut_master/current_state [1]), .A3(\uut_master/net11464 ), .A4(
        \uut_master/data_count [5]), .ZN(\uut_master/n193 ) );
  OAI22_X1 \uut_master/U175  ( .A1(\uut_master/n188 ), .A2(
        \uut_master/net11628 ), .B1(\uut_master/n125 ), .B2(
        \uut_master/net11934 ), .ZN(\uut_master/n238 ) );
  OAI221_X1 \uut_master/U174  ( .B1(\uut_master/data_count [5]), .B2(
        \uut_master/data_count [4]), .C1(\uut_master/data_count [5]), .C2(
        \uut_master/n1 ), .A(\uut_master/n187 ), .ZN(\uut_master/n188 ) );
  AOI21_X1 \uut_master/U173  ( .B1(\uut_master/n133 ), .B2(\uut_master/n186 ), 
        .A(\uut_master/n11 ), .ZN(\uut_master/n187 ) );
  NOR2_X1 \uut_master/U172  ( .A1(\uut_master/n183 ), .A2(\uut_master/n184 ), 
        .ZN(\uut_master/n186 ) );
  AND2_X1 \uut_master/U171  ( .A1(\uut_master/next_state [0]), .A2(
        \uut_master/net11333 ), .ZN(\uut_master/N150 ) );
  INV_X1 \uut_master/U170  ( .A(\uut_master/n182 ), .ZN(\uut_master/n364 ) );
  NAND3_X1 \uut_master/U169  ( .A1(\uut_master/n12 ), .A2(
        \uut_master/net11333 ), .A3(\uut_master/n181 ), .ZN(\uut_master/N168 )
         );
  AOI22_X1 \uut_master/U168  ( .A1(enable), .A2(\uut_master/n360 ), .B1(
        \uut_master/data_end ), .B2(\uut_master/net11735 ), .ZN(
        \uut_master/n181 ) );
  OAI21_X1 \uut_master/U167  ( .B1(\uut_master/n184 ), .B2(
        \uut_master/net11939 ), .A(\uut_master/n180 ), .ZN(\uut_master/n239 )
         );
  NAND3_X1 \uut_master/U166  ( .A1(\uut_master/net11797 ), .A2(
        \uut_master/n179 ), .A3(\uut_master/n148 ), .ZN(\uut_master/n180 ) );
  XOR2_X1 \uut_master/U165  ( .A(\uut_master/data_count [4]), .B(
        \uut_master/n133 ), .Z(\uut_master/n179 ) );
  OAI21_X1 \uut_master/U164  ( .B1(\uut_master/n10 ), .B2(
        \uut_master/net11943 ), .A(\uut_master/n178 ), .ZN(\uut_master/n240 )
         );
  NAND3_X1 \uut_master/U163  ( .A1(\uut_master/net11797 ), .A2(
        \uut_master/n177 ), .A3(\uut_master/n148 ), .ZN(\uut_master/n178 ) );
  XOR2_X1 \uut_master/U162  ( .A(\uut_master/data_count [3]), .B(
        \uut_master/n176 ), .Z(\uut_master/n177 ) );
  NOR3_X1 \uut_master/U161  ( .A1(\uut_master/n175 ), .A2(\uut_master/n174 ), 
        .A3(\uut_master/n173 ), .ZN(\uut_master/n176 ) );
  OAI21_X1 \uut_master/U160  ( .B1(\uut_master/n174 ), .B2(
        \uut_master/net11940 ), .A(\uut_master/n172 ), .ZN(\uut_master/n241 )
         );
  NAND3_X1 \uut_master/U159  ( .A1(\uut_master/n171 ), .A2(\uut_master/n148 ), 
        .A3(\uut_master/net11490 ), .ZN(\uut_master/n172 ) );
  XOR2_X1 \uut_master/U158  ( .A(\uut_master/data_count [2]), .B(
        \uut_master/n170 ), .Z(\uut_master/n171 ) );
  NOR2_X1 \uut_master/U157  ( .A1(\uut_master/n175 ), .A2(\uut_master/n128 ), 
        .ZN(\uut_master/n170 ) );
  OAI21_X1 \uut_master/U156  ( .B1(\uut_master/n128 ), .B2(
        \uut_master/net11943 ), .A(\uut_master/n169 ), .ZN(\uut_master/n242 )
         );
  NAND3_X1 \uut_master/U155  ( .A1(\uut_master/net11797 ), .A2(
        \uut_master/n148 ), .A3(\uut_master/n168 ), .ZN(\uut_master/n169 ) );
  XOR2_X1 \uut_master/U154  ( .A(\uut_master/data_count [1]), .B(
        \uut_master/data_count [0]), .Z(\uut_master/n168 ) );
  OAI21_X1 \uut_master/U153  ( .B1(\uut_master/n124 ), .B2(
        \uut_master/net11937 ), .A(\uut_master/n167 ), .ZN(\uut_master/n243 )
         );
  NAND3_X1 \uut_master/U152  ( .A1(\uut_master/net11797 ), .A2(
        \uut_master/n124 ), .A3(\uut_master/n148 ), .ZN(\uut_master/n167 ) );
  NAND4_X1 \uut_master/U151  ( .A1(\uut_master/n6 ), .A2(
        \uut_master/data_count [2]), .A3(\uut_master/data_count [4]), .A4(
        \uut_master/data_count [3]), .ZN(\uut_master/n185 ) );
  NOR3_X1 \uut_master/U150  ( .A1(\uut_master/n175 ), .A2(\uut_master/n183 ), 
        .A3(\uut_master/n173 ), .ZN(\uut_master/n166 ) );
  NAND2_X1 \uut_master/U149  ( .A1(\uut_master/n7 ), .A2(\uut_master/net11741 ), .ZN(\uut_master/net11298 ) );
  OAI211_X1 \uut_master/U148  ( .C1(\uut_master/n78 ), .C2(\uut_master/n137 ), 
        .A(\uut_master/n123 ), .B(\uut_master/n165 ), .ZN(\uut_master/N163 )
         );
  OAI21_X1 \uut_master/U147  ( .B1(rst), .B2(\uut_master/n121 ), .A(
        \uut_master/n182 ), .ZN(\uut_master/N171 ) );
  NAND2_X1 \uut_master/U146  ( .A1(\uut_master/n360 ), .A2(
        \uut_master/net11333 ), .ZN(\uut_master/n182 ) );
  INV_X1 \uut_master/U145  ( .A(\uut_master/n165 ), .ZN(\uut_master/n360 ) );
  OR2_X1 \uut_master/U144  ( .A1(\uut_master/n130 ), .A2(\uut_master/net11735 ), .ZN(\uut_master/n165 ) );
  AND2_X1 \uut_master/U143  ( .A1(\uut_master/next_state [1]), .A2(
        \uut_master/net11333 ), .ZN(\uut_master/N151 ) );
  NOR2_X1 \uut_master/U142  ( .A1(rst), .A2(\uut_master/n164 ), .ZN(
        \uut_master/N170 ) );
  NAND2_X1 \uut_master/U141  ( .A1(\uut_master/n7 ), .A2(\uut_master/net11741 ), .ZN(\uut_master/net11606 ) );
  INV_X1 \uut_master/U140  ( .A(\uut_master/n110 ), .ZN(\uut_master/net11478 )
         );
  INV_X1 \uut_master/U139  ( .A(\uut_master/net11488 ), .ZN(
        \uut_master/net11476 ) );
  INV_X1 \uut_master/U138  ( .A(\uut_master/net11904 ), .ZN(
        \uut_master/net11482 ) );
  INV_X1 \uut_master/U137  ( .A(\uut_master/n110 ), .ZN(\uut_master/net11486 )
         );
  BUF_X1 \uut_master/U136  ( .A(\uut_master/net11480 ), .Z(
        \uut_master/net11649 ) );
  BUF_X1 \uut_master/U135  ( .A(\uut_master/net11480 ), .Z(
        \uut_master/net11646 ) );
  BUF_X1 \uut_master/U134  ( .A(\uut_master/net11480 ), .Z(
        \uut_master/net11645 ) );
  BUF_X1 \uut_master/U133  ( .A(\uut_master/net11480 ), .Z(
        \uut_master/net11644 ) );
  BUF_X1 \uut_master/U132  ( .A(\uut_master/net11478 ), .Z(
        \uut_master/net11643 ) );
  BUF_X1 \uut_master/U131  ( .A(\uut_master/net11478 ), .Z(
        \uut_master/net11642 ) );
  BUF_X1 \uut_master/U130  ( .A(\uut_master/net11478 ), .Z(
        \uut_master/net11641 ) );
  BUF_X1 \uut_master/U129  ( .A(\uut_master/net11478 ), .Z(
        \uut_master/net11640 ) );
  BUF_X1 \uut_master/U128  ( .A(\uut_master/net11478 ), .Z(
        \uut_master/net11639 ) );
  BUF_X1 \uut_master/U127  ( .A(\uut_master/net11478 ), .Z(
        \uut_master/net11638 ) );
  BUF_X1 \uut_master/U126  ( .A(\uut_master/net11476 ), .Z(
        \uut_master/net11637 ) );
  BUF_X1 \uut_master/U125  ( .A(\uut_master/net11476 ), .Z(
        \uut_master/net11636 ) );
  BUF_X1 \uut_master/U124  ( .A(\uut_master/net11476 ), .Z(
        \uut_master/net11635 ) );
  BUF_X1 \uut_master/U123  ( .A(\uut_master/net11476 ), .Z(
        \uut_master/net11634 ) );
  BUF_X1 \uut_master/U122  ( .A(\uut_master/net11476 ), .Z(
        \uut_master/net11632 ) );
  BUF_X1 \uut_master/U121  ( .A(\uut_master/net11482 ), .Z(
        \uut_master/net11631 ) );
  BUF_X1 \uut_master/U120  ( .A(\uut_master/n109 ), .Z(\uut_master/net11630 )
         );
  BUF_X1 \uut_master/U119  ( .A(\uut_master/n109 ), .Z(\uut_master/net11628 )
         );
  BUF_X1 \uut_master/U118  ( .A(\uut_master/net11482 ), .Z(
        \uut_master/net11626 ) );
  BUF_X1 \uut_master/U117  ( .A(\uut_master/net11482 ), .Z(
        \uut_master/net11624 ) );
  BUF_X1 \uut_master/U116  ( .A(\uut_master/net11482 ), .Z(
        \uut_master/net11623 ) );
  BUF_X1 \uut_master/U115  ( .A(\uut_master/n109 ), .Z(\uut_master/net11622 )
         );
  BUF_X1 \uut_master/U114  ( .A(\uut_master/n109 ), .Z(\uut_master/net11620 )
         );
  BUF_X1 \uut_master/U113  ( .A(\uut_master/net11486 ), .Z(
        \uut_master/net11618 ) );
  BUF_X1 \uut_master/U112  ( .A(\uut_master/net11486 ), .Z(
        \uut_master/net11617 ) );
  BUF_X1 \uut_master/U111  ( .A(\uut_master/net11486 ), .Z(
        \uut_master/net11616 ) );
  BUF_X1 \uut_master/U110  ( .A(\uut_master/net11486 ), .Z(
        \uut_master/net11615 ) );
  BUF_X1 \uut_master/U109  ( .A(\uut_master/net11486 ), .Z(
        \uut_master/net11614 ) );
  INV_X1 \uut_master/U108  ( .A(\uut_master/n2 ), .ZN(\uut_master/n160 ) );
  INV_X1 \uut_master/U107  ( .A(\uut_master/n2 ), .ZN(\uut_master/n159 ) );
  INV_X1 \uut_master/U106  ( .A(\uut_master/n3 ), .ZN(\uut_master/n158 ) );
  INV_X1 \uut_master/U105  ( .A(\uut_master/n3 ), .ZN(\uut_master/n157 ) );
  INV_X1 \uut_master/U104  ( .A(\uut_master/net11369 ), .ZN(
        \uut_master/net11724 ) );
  INV_X1 \uut_master/U103  ( .A(\uut_master/n5 ), .ZN(\uut_master/net11723 )
         );
  INV_X1 \uut_master/U102  ( .A(\uut_master/current_state [0]), .ZN(
        \uut_master/net11731 ) );
  AND2_X1 \uut_master/U101  ( .A1(\uut_master/n114 ), .A2(
        \uut_master/net11333 ), .ZN(\uut_master/n156 ) );
  INV_X1 \uut_master/U100  ( .A(\uut_master/net11605 ), .ZN(
        \uut_master/net11741 ) );
  INV_X1 \uut_master/U99  ( .A(\uut_master/n129 ), .ZN(\uut_master/n155 ) );
  INV_X1 \uut_master/U98  ( .A(\uut_master/n129 ), .ZN(\uut_master/n154 ) );
  INV_X1 \uut_master/U97  ( .A(\uut_master/n129 ), .ZN(\uut_master/n153 ) );
  INV_X1 \uut_master/U96  ( .A(\uut_master/n129 ), .ZN(\uut_master/n152 ) );
  INV_X1 \uut_master/U95  ( .A(\uut_master/n129 ), .ZN(\uut_master/n151 ) );
  INV_X1 \uut_master/U94  ( .A(\uut_master/n129 ), .ZN(\uut_master/n150 ) );
  INV_X1 \uut_master/U93  ( .A(\uut_master/net11369 ), .ZN(
        \uut_master/net11869 ) );
  INV_X1 \uut_master/U92  ( .A(\uut_master/n145 ), .ZN(\uut_master/net11943 )
         );
  INV_X1 \uut_master/U91  ( .A(\uut_master/net11935 ), .ZN(
        \uut_master/net11940 ) );
  INV_X1 \uut_master/U90  ( .A(\uut_master/net11935 ), .ZN(
        \uut_master/net11939 ) );
  INV_X1 \uut_master/U89  ( .A(\uut_master/net11935 ), .ZN(
        \uut_master/net11937 ) );
  INV_X1 \uut_master/U88  ( .A(\uut_master/net11606 ), .ZN(
        \uut_master/net11936 ) );
  INV_X1 \uut_master/U87  ( .A(\uut_master/net11606 ), .ZN(
        \uut_master/net11935 ) );
  INV_X1 \uut_master/U86  ( .A(\uut_master/net11936 ), .ZN(
        \uut_master/net11934 ) );
  INV_X1 \uut_master/U85  ( .A(\uut_master/n8 ), .ZN(\uut_master/net11933 ) );
  INV_X1 \uut_master/U84  ( .A(\uut_master/net11936 ), .ZN(
        \uut_master/net11931 ) );
  INV_X1 \uut_master/U83  ( .A(\uut_master/net11925 ), .ZN(
        \uut_master/net11929 ) );
  INV_X1 \uut_master/U82  ( .A(\uut_master/net11925 ), .ZN(
        \uut_master/net11928 ) );
  INV_X1 \uut_master/U81  ( .A(\uut_master/net11298 ), .ZN(
        \uut_master/net11926 ) );
  INV_X1 \uut_master/U80  ( .A(\uut_master/net11298 ), .ZN(
        \uut_master/net11925 ) );
  INV_X1 \uut_master/U79  ( .A(\uut_master/n8 ), .ZN(\uut_master/n144 ) );
  INV_X1 \uut_master/U78  ( .A(\uut_master/n145 ), .ZN(\uut_master/n143 ) );
  INV_X1 \uut_master/U77  ( .A(\uut_master/n145 ), .ZN(\uut_master/n142 ) );
  INV_X1 \uut_master/U76  ( .A(\uut_master/n145 ), .ZN(\uut_master/n141 ) );
  INV_X1 \uut_master/U75  ( .A(\uut_master/n145 ), .ZN(\uut_master/n140 ) );
  INV_X1 \uut_master/U74  ( .A(\uut_master/net11926 ), .ZN(\uut_master/n139 )
         );
  INV_X1 \uut_master/U73  ( .A(\uut_master/n140 ), .ZN(\uut_master/n138 ) );
  CLKBUF_X1 \uut_master/U72  ( .A(\uut_master/n359 ), .Z(\uut_master/n147 ) );
  CLKBUF_X1 \uut_master/U71  ( .A(\uut_master/n147 ), .Z(\uut_master/n137 ) );
  CLKBUF_X1 \uut_master/U70  ( .A(\uut_master/n358 ), .Z(\uut_master/n136 ) );
  OAI22_X1 \uut_master/U69  ( .A1(\uut_master/n135 ), .A2(\uut_master/n154 ), 
        .B1(\uut_master/n112 ), .B2(\uut_master/n189 ), .ZN(\uut_master/n134 )
         );
  INV_X1 \uut_master/U68  ( .A(sck), .ZN(\uut_master/net11464 ) );
  OR2_X1 \uut_master/U67  ( .A1(\uut_master/net11731 ), .A2(
        \uut_master/net11741 ), .ZN(\uut_master/n164 ) );
  INV_X1 \uut_master/U66  ( .A(miso), .ZN(\uut_master/n135 ) );
  AND2_X1 \uut_master/U65  ( .A1(\uut_master/n164 ), .A2(\uut_master/n147 ), 
        .ZN(\uut_master/n132 ) );
  OAI221_X1 \uut_master/U64  ( .B1(\uut_master/n22 ), .B2(
        \uut_master/net11928 ), .C1(\uut_master/net11648 ), .C2(
        \uut_master/n23 ), .A(\uut_master/net11308 ), .ZN(\uut_master/n252 )
         );
  INV_X1 \uut_master/U63  ( .A(\uut_master/net11488 ), .ZN(
        \uut_master/net11480 ) );
  INV_X1 \uut_master/U62  ( .A(\uut_master/n4 ), .ZN(\uut_master/net11870 ) );
  NAND2_X1 \uut_master/U61  ( .A1(data_in[1]), .A2(\uut_master/n120 ), .ZN(
        \uut_master/n131 ) );
  BUF_X1 \uut_master/U60  ( .A(\uut_master/net11480 ), .Z(
        \uut_master/net11648 ) );
  INV_X1 \uut_master/U59  ( .A(\uut_master/net11936 ), .ZN(
        \uut_master/net11942 ) );
  OAI221_X1 \uut_master/U58  ( .B1(\uut_master/n76 ), .B2(
        \uut_master/net11942 ), .C1(\uut_master/net11648 ), .C2(
        \uut_master/n77 ), .A(\uut_master/n131 ), .ZN(\uut_master/n306 ) );
  INV_X1 \uut_master/U57  ( .A(rst), .ZN(\uut_master/net11333 ) );
  AND3_X2 \uut_master/U56  ( .A1(\uut_master/n9 ), .A2(\uut_master/n156 ), 
        .A3(\uut_master/current_state [1]), .ZN(\uut_master/net11488 ) );
  AND3_X1 \uut_master/U55  ( .A1(\uut_master/n114 ), .A2(\uut_master/net11333 ), .A3(\uut_master/net11464 ), .ZN(\uut_master/n149 ) );
  OR2_X2 \uut_master/U54  ( .A1(\uut_master/current_state [0]), .A2(
        \uut_master/net11605 ), .ZN(\uut_master/n359 ) );
  CLKBUF_X1 \uut_master/U53  ( .A(\uut_master/net11904 ), .Z(
        \uut_master/net11490 ) );
  INV_X1 \uut_master/U52  ( .A(\uut_master/n12 ), .ZN(\uut_master/n130 ) );
  AND4_X1 \uut_master/U51  ( .A1(\uut_master/net11731 ), .A2(sck), .A3(
        \uut_master/net11333 ), .A4(\uut_master/current_state [1]), .ZN(
        \uut_master/net11904 ) );
  AND2_X2 \uut_master/U50  ( .A1(\uut_master/n193 ), .A2(\uut_master/net11333 ), .ZN(\uut_master/n146 ) );
  BUF_X2 \uut_master/U49  ( .A(\uut_master/n185 ), .Z(\uut_master/n148 ) );
  INV_X1 \uut_master/U48  ( .A(\uut_master/data_count [1]), .ZN(
        \uut_master/n128 ) );
  INV_X1 \uut_master/U47  ( .A(\uut_master/n146 ), .ZN(\uut_master/n127 ) );
  INV_X1 \uut_master/U46  ( .A(\uut_master/n146 ), .ZN(\uut_master/n126 ) );
  CLKBUF_X1 \uut_master/U45  ( .A(\uut_master/n183 ), .Z(\uut_master/n125 ) );
  CLKBUF_X1 \uut_master/U44  ( .A(\uut_master/n175 ), .Z(\uut_master/n124 ) );
  OR2_X1 \uut_master/U43  ( .A1(\uut_master/n121 ), .A2(
        \uut_master/clock_count ), .ZN(\uut_master/n123 ) );
  OR2_X1 \uut_master/U42  ( .A1(\uut_master/clock_count ), .A2(rst), .ZN(
        \uut_master/n122 ) );
  NOR2_X1 \uut_master/U41  ( .A1(\uut_master/n132 ), .A2(\uut_master/n122 ), 
        .ZN(\uut_master/N15 ) );
  CLKBUF_X1 \uut_master/U40  ( .A(\uut_master/n132 ), .Z(\uut_master/n121 ) );
  INV_X1 \uut_master/U39  ( .A(\uut_master/n146 ), .ZN(\uut_master/n163 ) );
  AND2_X2 \uut_master/U38  ( .A1(\uut_master/n149 ), .A2(
        \uut_master/current_state [1]), .ZN(\uut_master/n145 ) );
  AND4_X2 \uut_master/U37  ( .A1(\uut_master/n156 ), .A2(
        \uut_master/current_state [1]), .A3(\uut_master/net11464 ), .A4(
        \uut_master/data_count [5]), .ZN(\uut_master/n129 ) );
  INV_X1 \uut_master/U36  ( .A(\uut_master/n5 ), .ZN(\uut_master/n120 ) );
  INV_X1 \uut_master/U35  ( .A(\uut_master/net11490 ), .ZN(\uut_master/n119 )
         );
  CLKBUF_X1 \uut_master/U34  ( .A(\uut_master/net11741 ), .Z(
        \uut_master/net11735 ) );
  INV_X1 \uut_master/U33  ( .A(\uut_master/n146 ), .ZN(\uut_master/n117 ) );
  INV_X1 \uut_master/U32  ( .A(\uut_master/n146 ), .ZN(\uut_master/n116 ) );
  INV_X1 \uut_master/U31  ( .A(\uut_master/n146 ), .ZN(\uut_master/n161 ) );
  INV_X1 \uut_master/U30  ( .A(\uut_master/n146 ), .ZN(\uut_master/n162 ) );
  INV_X1 \uut_master/U29  ( .A(\uut_master/n146 ), .ZN(\uut_master/n115 ) );
  INV_X1 \uut_master/U28  ( .A(\uut_master/n146 ), .ZN(\uut_master/n113 ) );
  INV_X1 \uut_master/U27  ( .A(\uut_master/n146 ), .ZN(\uut_master/n112 ) );
  INV_X1 \uut_master/U26  ( .A(\uut_master/n146 ), .ZN(\uut_master/n111 ) );
  AND4_X1 \uut_master/U25  ( .A1(\uut_master/n11 ), .A2(\uut_master/net11735 ), 
        .A3(\uut_master/n13 ), .A4(sck), .ZN(\uut_master/N107 ) );
  CLKBUF_X1 \uut_master/U24  ( .A(\uut_master/n358 ), .Z(\uut_master/n118 ) );
  NAND4_X1 \uut_master/U23  ( .A1(\uut_master/net11731 ), .A2(sck), .A3(
        \uut_master/net11333 ), .A4(\uut_master/current_state [1]), .ZN(
        \uut_master/n109 ) );
  AND3_X1 \uut_master/U22  ( .A1(\uut_master/n13 ), .A2(\uut_master/n9 ), .A3(
        \uut_master/current_state [1]), .ZN(\uut_master/n110 ) );
  OR2_X2 \uut_master/U21  ( .A1(\uut_master/current_state [0]), .A2(
        \uut_master/net11605 ), .ZN(\uut_master/n108 ) );
  INV_X1 \uut_master/U20  ( .A(\uut_master/net11926 ), .ZN(\uut_master/n107 )
         );
  BUF_X2 \uut_master/U19  ( .A(\uut_master/net11488 ), .Z(
        \uut_master/net11797 ) );
  INV_X1 \uut_master/U18  ( .A(\uut_master/net11797 ), .ZN(\uut_master/n106 )
         );
  AND2_X1 \uut_master/U17  ( .A1(\uut_master/n114 ), .A2(\uut_master/net11333 ), .ZN(\uut_master/n13 ) );
  CLKBUF_X1 \uut_master/U16  ( .A(\uut_master/net11731 ), .Z(\uut_master/n12 )
         );
  AND4_X1 \uut_master/U15  ( .A1(\uut_master/n166 ), .A2(
        \uut_master/data_count [2]), .A3(\uut_master/data_count [4]), .A4(
        \uut_master/data_count [3]), .ZN(\uut_master/n11 ) );
  NAND3_X1 \uut_master/U14  ( .A1(\uut_master/n114 ), .A2(
        \uut_master/net11464 ), .A3(\uut_master/net11333 ), .ZN(
        \uut_master/n9 ) );
  INV_X1 \uut_master/U13  ( .A(\uut_master/net11298 ), .ZN(\uut_master/n8 ) );
  AND3_X1 \uut_master/U12  ( .A1(\uut_master/n114 ), .A2(\uut_master/net11333 ), .A3(\uut_master/net11464 ), .ZN(\uut_master/n7 ) );
  NOR3_X1 \uut_master/U11  ( .A1(\uut_master/n175 ), .A2(\uut_master/n183 ), 
        .A3(\uut_master/n173 ), .ZN(\uut_master/n6 ) );
  NAND2_X1 \uut_master/U10  ( .A1(\uut_master/n197 ), .A2(\uut_master/n108 ), 
        .ZN(\uut_master/net11369 ) );
  NAND2_X1 \uut_master/U9  ( .A1(\uut_master/n197 ), .A2(\uut_master/n108 ), 
        .ZN(\uut_master/n5 ) );
  NAND2_X1 \uut_master/U8  ( .A1(\uut_master/n197 ), .A2(\uut_master/n108 ), 
        .ZN(\uut_master/n4 ) );
  NAND2_X1 \uut_master/U7  ( .A1(\uut_master/n359 ), .A2(\uut_master/net11333 ), .ZN(\uut_master/n358 ) );
  NAND2_X1 \uut_master/U6  ( .A1(\uut_master/n359 ), .A2(\uut_master/net11333 ), .ZN(\uut_master/n3 ) );
  NAND2_X1 \uut_master/U5  ( .A1(\uut_master/n359 ), .A2(\uut_master/net11333 ), .ZN(\uut_master/n2 ) );
  AND4_X2 \uut_master/U4  ( .A1(\uut_master/data_count [3]), .A2(
        \uut_master/data_count [2]), .A3(\uut_master/data_count [1]), .A4(
        \uut_master/data_count [0]), .ZN(\uut_master/n133 ) );
  CLKBUF_X1 \uut_master/U3  ( .A(\uut_master/n133 ), .Z(\uut_master/n1 ) );
  DFF_X2 \uut_master/data_save_reg[4]  ( .D(\uut_master/n303 ), .CK(clk), .QN(
        \uut_master/n73 ) );
  DFF_X2 \uut_master/data_save_reg[38]  ( .D(\uut_master/n269 ), .CK(clk), 
        .QN(\uut_master/n39 ) );
  DFF_X2 \uut_master/data_save_reg[13]  ( .D(\uut_master/n294 ), .CK(clk), 
        .QN(\uut_master/n64 ) );
  DFF_X2 \uut_master/data_save_reg[17]  ( .D(\uut_master/n290 ), .CK(clk), 
        .QN(\uut_master/n60 ) );
  DFF_X2 \uut_master/data_save_reg[15]  ( .D(\uut_master/n292 ), .CK(clk), 
        .QN(\uut_master/n62 ) );
  DFF_X2 \uut_master/data_save_reg[8]  ( .D(\uut_master/n299 ), .CK(clk), .QN(
        \uut_master/n69 ) );
  DFF_X2 \uut_master/data_save_reg[33]  ( .D(\uut_master/n274 ), .CK(clk), 
        .QN(\uut_master/n44 ) );
  DFF_X2 \uut_master/data_save_reg[20]  ( .D(\uut_master/n287 ), .CK(clk), 
        .QN(\uut_master/n57 ) );
  DFF_X2 \uut_master/data_save_reg[52]  ( .D(\uut_master/n255 ), .CK(clk), 
        .QN(\uut_master/n25 ) );
  DFF_X2 \uut_master/data_save_reg[53]  ( .D(\uut_master/n254 ), .CK(clk), 
        .QN(\uut_master/n24 ) );
  DFF_X2 \uut_master/data_save_reg[43]  ( .D(\uut_master/n264 ), .CK(clk), 
        .QN(\uut_master/n34 ) );
  DFF_X2 \uut_master/data_save_reg[55]  ( .D(\uut_master/n252 ), .CK(clk), 
        .QN(\uut_master/n22 ) );
  DFF_X1 \uut_master/data_count_reg[4]  ( .D(\uut_master/n239 ), .CK(clk), .Q(
        \uut_master/data_count [4]), .QN(\uut_master/n184 ) );
  DFF_X2 \uut_master/data_save_reg[30]  ( .D(\uut_master/n277 ), .CK(clk), 
        .QN(\uut_master/n47 ) );
  DFF_X2 \uut_master/data_save_reg[60]  ( .D(\uut_master/n247 ), .CK(clk), 
        .QN(\uut_master/n17 ) );
  DFF_X2 \uut_master/data_save_reg[57]  ( .D(\uut_master/n250 ), .CK(clk), 
        .QN(\uut_master/n20 ) );
  DFF_X2 \uut_master/data_save_reg[63]  ( .D(\uut_master/n244 ), .CK(clk), 
        .QN(\uut_master/n14 ) );
  DFF_X1 \uut_master/data_save_reg[5]  ( .D(\uut_master/n302 ), .CK(clk), .QN(
        \uut_master/n72 ) );
  DFF_X1 \uut_master/data_save_reg[27]  ( .D(\uut_master/n280 ), .CK(clk), 
        .QN(\uut_master/n50 ) );
  DFF_X1 \uut_master/data_save_reg[62]  ( .D(\uut_master/n245 ), .CK(clk), 
        .QN(\uut_master/n15 ) );
  DFF_X1 \uut_master/data_save_reg[56]  ( .D(\uut_master/n251 ), .CK(clk), 
        .QN(\uut_master/n21 ) );
  DFF_X2 \uut_master/data_end_reg  ( .D(\uut_master/N107 ), .CK(clk), .Q(
        \uut_master/data_end ), .QN(\uut_master/n78 ) );
  DFF_X2 \uut_master/clock_count_reg  ( .D(\uut_master/N15 ), .CK(clk), .Q(
        \uut_master/clock_count ) );
  DFF_X1 \uut_master/data_save_reg[16]  ( .D(\uut_master/n291 ), .CK(clk), 
        .QN(\uut_master/n61 ) );
  DFF_X1 \uut_master/data_in_reg[5]  ( .D(\uut_master/n236 ), .CK(clk), .Q(
        data_out[5]), .QN(\uut_master/n104 ) );
  DFF_X1 \uut_master/data_in_reg[15]  ( .D(\uut_master/n226 ), .CK(clk), .Q(
        data_out[15]), .QN(\uut_master/n94 ) );
  DFF_X1 \uut_master/data_save_reg[58]  ( .D(\uut_master/n249 ), .CK(clk), 
        .QN(\uut_master/n19 ) );
  DFF_X1 \uut_master/data_in_reg[11]  ( .D(\uut_master/n230 ), .CK(clk), .Q(
        data_out[11]), .QN(\uut_master/n98 ) );
  DFF_X1 \uut_master/data_save_reg[42]  ( .D(\uut_master/n265 ), .CK(clk), 
        .QN(\uut_master/n35 ) );
  DFF_X1 \uut_master/data_save_reg[35]  ( .D(\uut_master/n272 ), .CK(clk), 
        .QN(\uut_master/n42 ) );
  DFF_X1 \uut_master/data_save_reg[37]  ( .D(\uut_master/n270 ), .CK(clk), 
        .QN(\uut_master/n40 ) );
  DFF_X1 \uut_master/data_save_reg[54]  ( .D(\uut_master/n253 ), .CK(clk), 
        .QN(\uut_master/n23 ) );
  DFF_X1 \uut_master/data_save_reg[39]  ( .D(\uut_master/n268 ), .CK(clk), 
        .QN(\uut_master/n38 ) );
  DFF_X1 \uut_master/data_save_reg[44]  ( .D(\uut_master/n263 ), .CK(clk), 
        .QN(\uut_master/n33 ) );
  DFF_X1 \uut_master/data_save_reg[45]  ( .D(\uut_master/n262 ), .CK(clk), 
        .QN(\uut_master/n32 ) );
  DFF_X1 \uut_master/data_save_reg[46]  ( .D(\uut_master/n261 ), .CK(clk), 
        .QN(\uut_master/n31 ) );
  DFF_X1 \uut_master/data_save_reg[47]  ( .D(\uut_master/n260 ), .CK(clk), 
        .QN(\uut_master/n30 ) );
  DFF_X1 \uut_master/data_save_reg[48]  ( .D(\uut_master/n259 ), .CK(clk), 
        .QN(\uut_master/n29 ) );
  DFF_X1 \uut_master/data_save_reg[50]  ( .D(\uut_master/n257 ), .CK(clk), 
        .QN(\uut_master/n27 ) );
  DFF_X1 \uut_master/data_save_reg[51]  ( .D(\uut_master/n256 ), .CK(clk), 
        .QN(\uut_master/n26 ) );
  DFF_X1 \uut_master/data_save_reg[32]  ( .D(\uut_master/n275 ), .CK(clk), 
        .QN(\uut_master/n45 ) );
  DFF_X1 \uut_master/data_save_reg[34]  ( .D(\uut_master/n273 ), .CK(clk), 
        .QN(\uut_master/n43 ) );
  DFF_X1 \uut_master/data_save_reg[40]  ( .D(\uut_master/n267 ), .CK(clk), 
        .QN(\uut_master/n37 ) );
  DFF_X1 \uut_master/data_save_reg[41]  ( .D(\uut_master/n266 ), .CK(clk), 
        .QN(\uut_master/n36 ) );
  DFF_X1 \uut_master/data_save_reg[59]  ( .D(\uut_master/n248 ), .CK(clk), 
        .QN(\uut_master/n18 ) );
  DFF_X1 \uut_master/data_save_reg[2]  ( .D(\uut_master/n305 ), .CK(clk), .QN(
        \uut_master/n75 ) );
  DFF_X1 \uut_master/data_save_reg[3]  ( .D(\uut_master/n304 ), .CK(clk), .QN(
        \uut_master/n74 ) );
  DFF_X1 \uut_master/data_save_reg[7]  ( .D(\uut_master/n300 ), .CK(clk), .QN(
        \uut_master/n70 ) );
  DFF_X1 \uut_master/data_save_reg[11]  ( .D(\uut_master/n296 ), .CK(clk), 
        .QN(\uut_master/n66 ) );
  DFF_X1 \uut_master/data_save_reg[14]  ( .D(\uut_master/n293 ), .CK(clk), 
        .QN(\uut_master/n63 ) );
  DFF_X1 \uut_master/data_save_reg[19]  ( .D(\uut_master/n288 ), .CK(clk), 
        .QN(\uut_master/n58 ) );
  DFF_X1 \uut_master/data_save_reg[28]  ( .D(\uut_master/n279 ), .CK(clk), 
        .QN(\uut_master/n49 ) );
  DFF_X1 \uut_master/data_save_reg[12]  ( .D(\uut_master/n295 ), .CK(clk), 
        .QN(\uut_master/n65 ) );
  DFF_X1 \uut_master/data_save_reg[23]  ( .D(\uut_master/n284 ), .CK(clk), 
        .QN(\uut_master/n54 ) );
  DFF_X1 \uut_master/data_save_reg[1]  ( .D(\uut_master/n306 ), .CK(clk), .QN(
        \uut_master/n76 ) );
  DFF_X1 \uut_master/data_save_reg[31]  ( .D(\uut_master/n276 ), .CK(clk), 
        .QN(\uut_master/n46 ) );
  DFF_X1 \uut_master/data_save_reg[61]  ( .D(\uut_master/n246 ), .CK(clk), 
        .QN(\uut_master/n16 ) );
  DFF_X1 \uut_master/data_save_reg[49]  ( .D(\uut_master/n258 ), .CK(clk), 
        .QN(\uut_master/n28 ) );
  DFF_X1 \uut_master/data_save_reg[36]  ( .D(\uut_master/n271 ), .CK(clk), 
        .QN(\uut_master/n41 ) );
  DFF_X1 \uut_master/data_save_reg[21]  ( .D(\uut_master/n286 ), .CK(clk), 
        .QN(\uut_master/n56 ) );
  DFF_X1 \uut_master/data_save_reg[24]  ( .D(\uut_master/n283 ), .CK(clk), 
        .QN(\uut_master/n53 ) );
  DFF_X1 \uut_master/data_save_reg[6]  ( .D(\uut_master/n301 ), .CK(clk), .QN(
        \uut_master/n71 ) );
  DFF_X1 \uut_master/data_save_reg[22]  ( .D(\uut_master/n285 ), .CK(clk), 
        .QN(\uut_master/n55 ) );
  DFF_X1 \uut_master/data_save_reg[25]  ( .D(\uut_master/n282 ), .CK(clk), 
        .QN(\uut_master/n52 ) );
  DFF_X1 \uut_master/data_save_reg[26]  ( .D(\uut_master/n281 ), .CK(clk), 
        .QN(\uut_master/n51 ) );
  DFF_X1 \uut_master/data_save_reg[29]  ( .D(\uut_master/n278 ), .CK(clk), 
        .QN(\uut_master/n48 ) );
  DFF_X1 \uut_master/data_save_reg[10]  ( .D(\uut_master/n297 ), .CK(clk), 
        .QN(\uut_master/n67 ) );
  DFF_X1 \uut_master/data_save_reg[9]  ( .D(\uut_master/n298 ), .CK(clk), .QN(
        \uut_master/n68 ) );
  DFF_X1 \uut_master/data_save_reg[18]  ( .D(\uut_master/n289 ), .CK(clk), 
        .QN(\uut_master/n59 ) );
  DFF_X1 \uut_master/data_in_reg[7]  ( .D(\uut_master/n234 ), .CK(clk), .Q(
        data_out[7]), .QN(\uut_master/n102 ) );
  DFF_X1 \uut_master/data_in_reg[8]  ( .D(\uut_master/n233 ), .CK(clk), .Q(
        data_out[8]), .QN(\uut_master/n101 ) );
  DFF_X1 \uut_master/data_in_reg[10]  ( .D(\uut_master/n231 ), .CK(clk), .Q(
        data_out[10]), .QN(\uut_master/n99 ) );
  DFF_X1 \uut_master/data_in_reg[20]  ( .D(\uut_master/n221 ), .CK(clk), .Q(
        data_out[20]), .QN(\uut_master/n89 ) );
  DFF_X1 \uut_master/data_in_reg[25]  ( .D(\uut_master/n216 ), .CK(clk), .Q(
        data_out[25]), .QN(\uut_master/n84 ) );
  DFF_X1 \uut_master/data_in_reg[29]  ( .D(\uut_master/n212 ), .CK(clk), .Q(
        data_out[29]), .QN(\uut_master/n80 ) );
  DFF_X1 \uut_master/data_in_reg[4]  ( .D(\uut_master/n237 ), .CK(clk), .Q(
        data_out[4]), .QN(\uut_master/n105 ) );
  DFF_X1 \uut_master/data_in_reg[6]  ( .D(\uut_master/n235 ), .CK(clk), .Q(
        data_out[6]), .QN(\uut_master/n103 ) );
  DFF_X1 \uut_master/data_in_reg[9]  ( .D(\uut_master/n232 ), .CK(clk), .Q(
        data_out[9]), .QN(\uut_master/n100 ) );
  DFF_X1 \uut_master/data_in_reg[30]  ( .D(\uut_master/n211 ), .CK(clk), .Q(
        data_out[30]), .QN(\uut_master/n79 ) );
  DFF_X1 \uut_master/data_in_reg[0]  ( .D(\uut_master/n134 ), .CK(clk), .Q(
        data_out[0]), .QN(\uut_master/n189 ) );
  DFF_X1 \uut_master/data_in_reg[13]  ( .D(\uut_master/n228 ), .CK(clk), .Q(
        data_out[13]), .QN(\uut_master/n96 ) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n225 ), .CK(clk), .Q(
        data_out[16]), .QN(\uut_master/n93 ) );
  DFF_X1 \uut_master/data_in_reg[18]  ( .D(\uut_master/n223 ), .CK(clk), .Q(
        data_out[18]), .QN(\uut_master/n91 ) );
  DFF_X1 \uut_master/data_in_reg[21]  ( .D(\uut_master/n220 ), .CK(clk), .Q(
        data_out[21]), .QN(\uut_master/n88 ) );
  DFF_X1 \uut_master/data_in_reg[26]  ( .D(\uut_master/n215 ), .CK(clk), .Q(
        data_out[26]), .QN(\uut_master/n83 ) );
  DFF_X1 \uut_master/data_in_reg[14]  ( .D(\uut_master/n227 ), .CK(clk), .Q(
        data_out[14]), .QN(\uut_master/n95 ) );
  DFF_X1 \uut_master/data_in_reg[17]  ( .D(\uut_master/n224 ), .CK(clk), .Q(
        data_out[17]), .QN(\uut_master/n92 ) );
  DFF_X1 \uut_master/data_in_reg[19]  ( .D(\uut_master/n222 ), .CK(clk), .Q(
        data_out[19]), .QN(\uut_master/n90 ) );
  DFF_X1 \uut_master/data_in_reg[22]  ( .D(\uut_master/n219 ), .CK(clk), .Q(
        data_out[22]), .QN(\uut_master/n87 ) );
  DFF_X1 \uut_master/data_in_reg[23]  ( .D(\uut_master/n218 ), .CK(clk), .Q(
        data_out[23]), .QN(\uut_master/n86 ) );
  DFF_X1 \uut_master/data_in_reg[27]  ( .D(\uut_master/n214 ), .CK(clk), .Q(
        data_out[27]), .QN(\uut_master/n82 ) );
  DFF_X1 \uut_master/data_in_reg[12]  ( .D(\uut_master/n229 ), .CK(clk), .Q(
        data_out[12]), .QN(\uut_master/n97 ) );
  DFF_X1 \uut_master/data_in_reg[24]  ( .D(\uut_master/n217 ), .CK(clk), .Q(
        data_out[24]), .QN(\uut_master/n85 ) );
  DFF_X1 \uut_master/data_in_reg[28]  ( .D(\uut_master/n213 ), .CK(clk), .Q(
        data_out[28]), .QN(\uut_master/n81 ) );
  DFF_X1 \uut_master/data_save_reg[0]  ( .D(\uut_master/n307 ), .CK(clk), .Q(
        \uut_master/net11368 ), .QN(\uut_master/n77 ) );
  DFF_X1 \uut_master/data_in_reg[1]  ( .D(\uut_master/n361 ), .CK(clk), .Q(
        data_out[1]), .QN(\uut_master/n190 ) );
  DFF_X1 \uut_master/data_count_reg[1]  ( .D(\uut_master/n242 ), .CK(clk), .Q(
        \uut_master/data_count [1]), .QN(\uut_master/n173 ) );
  DFF_X1 \uut_master/data_in_reg[3]  ( .D(\uut_master/n363 ), .CK(clk), .Q(
        data_out[3]), .QN(\uut_master/n192 ) );
  DFF_X1 \uut_master/data_in_reg[31]  ( .D(\uut_master/n210 ), .CK(clk), .Q(
        data_out[31]), .QN(\uut_master/n194 ) );
  DFF_X1 \uut_master/data_in_reg[2]  ( .D(\uut_master/n362 ), .CK(clk), .Q(
        data_out[2]), .QN(\uut_master/n191 ) );
  DFF_X1 \uut_master/data_count_reg[5]  ( .D(\uut_master/n238 ), .CK(clk), .Q(
        \uut_master/data_count [5]), .QN(\uut_master/n183 ) );
  DFF_X1 \uut_master/data_count_reg[2]  ( .D(\uut_master/n241 ), .CK(clk), .Q(
        \uut_master/data_count [2]), .QN(\uut_master/n174 ) );
  DFF_X1 \uut_master/data_count_reg[0]  ( .D(\uut_master/n243 ), .CK(clk), .Q(
        \uut_master/data_count [0]), .QN(\uut_master/n175 ) );
  DFF_X1 \uut_master/data_count_reg[3]  ( .D(\uut_master/n240 ), .CK(clk), .Q(
        \uut_master/data_count [3]), .QN(\uut_master/n10 ) );
  DLH_X1 \uut_master/cs_reg  ( .G(\uut_master/N171 ), .D(\uut_master/n360 ), 
        .Q(cs) );
  DLH_X1 \uut_master/mosi_reg  ( .G(\uut_master/N171 ), .D(\uut_master/N164 ), 
        .Q(mosi) );
  DFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/N150 ), .CK(clk), 
        .Q(\uut_master/current_state [0]), .QN(\uut_master/n114 ) );
  DLH_X1 \uut_master/next_state_reg[0]  ( .G(\uut_master/N168 ), .D(
        \uut_master/n364 ), .Q(\uut_master/next_state [0]) );
  DFF_X1 \uut_master/current_state_reg[1]  ( .D(\uut_master/N151 ), .CK(clk), 
        .Q(\uut_master/current_state [1]), .QN(\uut_master/net11605 ) );
  DLH_X1 \uut_master/next_state_reg[1]  ( .G(\uut_master/N168 ), .D(
        \uut_master/N170 ), .Q(\uut_master/next_state [1]) );
  DLH_X1 \uut_master/sck_reg  ( .G(\uut_master/N171 ), .D(\uut_master/N163 ), 
        .Q(sck) );
  OR3_X1 \uut_slave/U169  ( .A1(\uut_slave/n55 ), .A2(\uut_slave/n56 ), .A3(
        \uut_slave/n54 ), .ZN(\uut_slave/n239 ) );
  OR3_X1 \uut_slave/U168  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n53 ), .A3(
        \uut_slave/n39 ), .ZN(\uut_slave/n240 ) );
  NAND3_X1 \uut_slave/U167  ( .A1(\uut_slave/n244 ), .A2(\uut_slave/n245 ), 
        .A3(\uut_slave/next_state [1]), .ZN(\uut_slave/n241 ) );
  INV_X1 \uut_slave/U166  ( .A(cs), .ZN(\uut_slave/n238 ) );
  MUX2_X1 \uut_slave/U165  ( .A(\uut_slave/n237 ), .B(\uut_slave/n238 ), .S(
        \uut_slave/next_state [0]), .Z(\uut_slave/n236 ) );
  OAI211_X1 \uut_slave/U164  ( .C1(\uut_slave/next_state [1]), .C2(cs), .A(
        \uut_slave/n232 ), .B(\uut_slave/n236 ), .ZN(\uut_slave/N223 ) );
  NOR2_X1 \uut_slave/U163  ( .A1(\uut_slave/next_state [0]), .A2(rst), .ZN(
        \uut_slave/N225 ) );
  AND2_X1 \uut_slave/U162  ( .A1(\uut_slave/next_state [1]), .A2(
        \uut_slave/N225 ), .ZN(\uut_slave/N224 ) );
  OR2_X1 \uut_slave/U161  ( .A1(\uut_slave/N225 ), .A2(\uut_slave/n78 ), .ZN(
        \uut_slave/N226 ) );
  OAI222_X1 \uut_slave/U160  ( .A1(\uut_slave/n35 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n79 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n60 ), .ZN(\uut_slave/n125 ) );
  OAI222_X1 \uut_slave/U159  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n60 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n77 ), .ZN(\uut_slave/n126 ) );
  OAI222_X1 \uut_slave/U158  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n77 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n59 ), .ZN(\uut_slave/n127 ) );
  OAI222_X1 \uut_slave/U157  ( .A1(\uut_slave/n18 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n59 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n76 ), .ZN(\uut_slave/n128 ) );
  OAI222_X1 \uut_slave/U156  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n76 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n58 ), .ZN(\uut_slave/n129 ) );
  OAI222_X1 \uut_slave/U155  ( .A1(\uut_slave/n17 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n58 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n75 ), .ZN(\uut_slave/n130 ) );
  OAI222_X1 \uut_slave/U154  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n75 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n51 ), .ZN(\uut_slave/n131 ) );
  OAI222_X1 \uut_slave/U153  ( .A1(\uut_slave/n12 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n103 ), .B2(\uut_slave/n51 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n74 ), .ZN(\uut_slave/n132 ) );
  OAI222_X1 \uut_slave/U152  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n74 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n50 ), .ZN(\uut_slave/n133 ) );
  OAI222_X1 \uut_slave/U151  ( .A1(\uut_slave/n11 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n50 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n73 ), .ZN(\uut_slave/n134 ) );
  OAI222_X1 \uut_slave/U150  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n73 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n49 ), .ZN(\uut_slave/n135 ) );
  OAI222_X1 \uut_slave/U149  ( .A1(\uut_slave/n10 ), .A2(\uut_slave/n104 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n49 ), .C1(\uut_slave/n108 ), 
        .C2(\uut_slave/n72 ), .ZN(\uut_slave/n136 ) );
  OAI222_X1 \uut_slave/U148  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n72 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n48 ), .ZN(\uut_slave/n137 ) );
  OAI222_X1 \uut_slave/U147  ( .A1(\uut_slave/n9 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n48 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n71 ), .ZN(\uut_slave/n138 ) );
  OAI222_X1 \uut_slave/U146  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n71 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n47 ), .ZN(\uut_slave/n139 ) );
  OAI222_X1 \uut_slave/U145  ( .A1(\uut_slave/n8 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n47 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n70 ), .ZN(\uut_slave/n140 ) );
  OAI222_X1 \uut_slave/U144  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n70 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n46 ), .ZN(\uut_slave/n141 ) );
  OAI222_X1 \uut_slave/U143  ( .A1(\uut_slave/n7 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n46 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n69 ), .ZN(\uut_slave/n142 ) );
  OAI222_X1 \uut_slave/U142  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n69 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n45 ), .ZN(\uut_slave/n143 ) );
  OAI222_X1 \uut_slave/U141  ( .A1(\uut_slave/n5 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n102 ), .B2(\uut_slave/n45 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n68 ), .ZN(\uut_slave/n144 ) );
  OAI222_X1 \uut_slave/U140  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n68 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n44 ), .ZN(\uut_slave/n145 ) );
  OAI222_X1 \uut_slave/U139  ( .A1(\uut_slave/n4 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n44 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n67 ), .ZN(\uut_slave/n146 ) );
  OAI222_X1 \uut_slave/U138  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n67 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n43 ), .ZN(\uut_slave/n147 ) );
  OAI222_X1 \uut_slave/U137  ( .A1(\uut_slave/n3 ), .A2(\uut_slave/n105 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n43 ), .C1(\uut_slave/n109 ), 
        .C2(\uut_slave/n66 ), .ZN(\uut_slave/n148 ) );
  OAI222_X1 \uut_slave/U136  ( .A1(\uut_slave/n23 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n66 ), .C1(\uut_slave/n110 ), 
        .C2(\uut_slave/n42 ), .ZN(\uut_slave/n149 ) );
  OAI222_X1 \uut_slave/U135  ( .A1(\uut_slave/n2 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n42 ), .C1(\uut_slave/n110 ), 
        .C2(\uut_slave/n65 ), .ZN(\uut_slave/n150 ) );
  OAI222_X1 \uut_slave/U134  ( .A1(\uut_slave/n22 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n65 ), .C1(\uut_slave/n110 ), 
        .C2(\uut_slave/n41 ), .ZN(\uut_slave/n151 ) );
  OAI222_X1 \uut_slave/U133  ( .A1(\uut_slave/n1 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n41 ), .C1(\uut_slave/n110 ), 
        .C2(\uut_slave/n64 ), .ZN(\uut_slave/n152 ) );
  OAI222_X1 \uut_slave/U132  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n64 ), .C1(\uut_slave/n110 ), 
        .C2(\uut_slave/n40 ), .ZN(\uut_slave/n153 ) );
  OAI222_X1 \uut_slave/U131  ( .A1(\uut_slave/n62 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n40 ), .C1(\uut_slave/n36 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n154 ) );
  OAI222_X1 \uut_slave/U130  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n36 ), .C1(\uut_slave/n63 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n155 ) );
  OAI22_X1 \uut_slave/U129  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n63 ), .ZN(\uut_slave/n156 ) );
  INV_X1 \uut_slave/U128  ( .A(mosi), .ZN(\uut_slave/n233 ) );
  NOR4_X1 \uut_slave/U127  ( .A1(\uut_slave/n230 ), .A2(\uut_slave/n241 ), 
        .A3(\uut_slave/n57 ), .A4(\uut_slave/n6 ), .ZN(\uut_slave/N219 ) );
  OR3_X1 \uut_slave/U126  ( .A1(\uut_slave/n239 ), .A2(\uut_slave/n240 ), .A3(
        \uut_slave/next_state [0]), .ZN(\uut_slave/n230 ) );
  OAI22_X1 \uut_slave/U125  ( .A1(\uut_slave/n39 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n228 ), .B2(\uut_slave/n80 ), .ZN(\uut_slave/n189 ) );
  OAI22_X1 \uut_slave/U124  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n39 ), .B2(\uut_slave/n228 ), .ZN(\uut_slave/n196 ) );
  OAI22_X1 \uut_slave/U123  ( .A1(\uut_slave/n53 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n52 ), .B2(\uut_slave/n228 ), .ZN(\uut_slave/n190 ) );
  OAI22_X1 \uut_slave/U122  ( .A1(\uut_slave/n54 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n53 ), .B2(\uut_slave/n228 ), .ZN(\uut_slave/n191 ) );
  OAI22_X1 \uut_slave/U121  ( .A1(\uut_slave/n55 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n54 ), .B2(\uut_slave/n228 ), .ZN(\uut_slave/n192 ) );
  OAI22_X1 \uut_slave/U120  ( .A1(\uut_slave/n56 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n55 ), .B2(\uut_slave/n228 ), .ZN(\uut_slave/n193 ) );
  OAI22_X1 \uut_slave/U119  ( .A1(\uut_slave/n57 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n56 ), .B2(\uut_slave/n228 ), .ZN(\uut_slave/n194 ) );
  OAI22_X1 \uut_slave/U118  ( .A1(\uut_slave/n233 ), .A2(\uut_slave/n229 ), 
        .B1(\uut_slave/n57 ), .B2(\uut_slave/n228 ), .ZN(\uut_slave/n195 ) );
  NAND2_X1 \uut_slave/U117  ( .A1(\uut_slave/n228 ), .A2(\uut_slave/n232 ), 
        .ZN(\uut_slave/n229 ) );
  INV_X1 \uut_slave/U116  ( .A(\uut_slave/n227 ), .ZN(\uut_slave/n228 ) );
  OAI21_X1 \uut_slave/U115  ( .B1(\uut_slave/n226 ), .B2(\uut_slave/n86 ), .A(
        \uut_slave/n224 ), .ZN(\uut_slave/n227 ) );
  NAND2_X1 \uut_slave/U114  ( .A1(\uut_slave/data_end ), .A2(
        \uut_slave/next_state [1]), .ZN(\uut_slave/n237 ) );
  NOR3_X1 \uut_slave/U113  ( .A1(\uut_slave/n223 ), .A2(\uut_slave/n115 ), 
        .A3(\uut_slave/n225 ), .ZN(\uut_slave/N41 ) );
  OAI22_X1 \uut_slave/U112  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n35 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n157 ) );
  OAI22_X1 \uut_slave/U111  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n19 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n158 ) );
  OAI22_X1 \uut_slave/U110  ( .A1(\uut_slave/n18 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n34 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n159 ) );
  OAI22_X1 \uut_slave/U109  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n18 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n160 ) );
  OAI22_X1 \uut_slave/U108  ( .A1(\uut_slave/n17 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n33 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n161 ) );
  OAI22_X1 \uut_slave/U107  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n17 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n162 ) );
  OAI22_X1 \uut_slave/U106  ( .A1(\uut_slave/n12 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n32 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n163 ) );
  OAI22_X1 \uut_slave/U105  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n12 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n164 ) );
  OAI22_X1 \uut_slave/U104  ( .A1(\uut_slave/n11 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n31 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n165 ) );
  OAI22_X1 \uut_slave/U103  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n11 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n166 ) );
  OAI22_X1 \uut_slave/U102  ( .A1(\uut_slave/n10 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n30 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n167 ) );
  OAI22_X1 \uut_slave/U101  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n10 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n168 ) );
  OAI22_X1 \uut_slave/U100  ( .A1(\uut_slave/n9 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n29 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n169 ) );
  OAI22_X1 \uut_slave/U99  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n9 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n170 ) );
  OAI22_X1 \uut_slave/U98  ( .A1(\uut_slave/n8 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n28 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n171 ) );
  OAI22_X1 \uut_slave/U97  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n8 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n172 ) );
  OAI22_X1 \uut_slave/U96  ( .A1(\uut_slave/n7 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n27 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n173 ) );
  OAI22_X1 \uut_slave/U95  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n7 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n174 ) );
  OAI22_X1 \uut_slave/U94  ( .A1(\uut_slave/n5 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n26 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n175 ) );
  OAI22_X1 \uut_slave/U93  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n5 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n176 ) );
  OAI22_X1 \uut_slave/U92  ( .A1(\uut_slave/n4 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n25 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n177 ) );
  OAI22_X1 \uut_slave/U91  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n4 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n178 ) );
  OAI22_X1 \uut_slave/U90  ( .A1(\uut_slave/n3 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n24 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n179 ) );
  OAI22_X1 \uut_slave/U89  ( .A1(\uut_slave/n23 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n3 ), .B2(\uut_slave/n95 ), .ZN(\uut_slave/n180 ) );
  OAI22_X1 \uut_slave/U88  ( .A1(\uut_slave/n2 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n23 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n181 ) );
  OAI22_X1 \uut_slave/U87  ( .A1(\uut_slave/n22 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n2 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n182 ) );
  OAI22_X1 \uut_slave/U86  ( .A1(\uut_slave/n1 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n22 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n183 ) );
  OAI22_X1 \uut_slave/U85  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n1 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n184 ) );
  OAI22_X1 \uut_slave/U84  ( .A1(\uut_slave/n62 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n21 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n185 ) );
  OAI22_X1 \uut_slave/U83  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n62 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n186 ) );
  NAND3_X1 \uut_slave/U82  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n232 ), 
        .A3(\uut_slave/n224 ), .ZN(\uut_slave/n235 ) );
  INV_X1 \uut_slave/U81  ( .A(\uut_slave/n219 ), .ZN(\uut_slave/n220 ) );
  OAI22_X1 \uut_slave/U80  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n38 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n187 ) );
  INV_X1 \uut_slave/U79  ( .A(\uut_slave/n218 ), .ZN(\uut_slave/n231 ) );
  OAI21_X1 \uut_slave/U78  ( .B1(rst), .B2(\uut_slave/n217 ), .A(
        \uut_slave/n224 ), .ZN(\uut_slave/n218 ) );
  AOI21_X1 \uut_slave/U77  ( .B1(\uut_slave/n219 ), .B2(\uut_slave/n216 ), .A(
        \uut_slave/n215 ), .ZN(\uut_slave/n217 ) );
  INV_X1 \uut_slave/U76  ( .A(\uut_slave/n214 ), .ZN(\uut_slave/n215 ) );
  NAND2_X1 \uut_slave/U75  ( .A1(\uut_slave/n213 ), .A2(\uut_slave/n212 ), 
        .ZN(\uut_slave/n219 ) );
  NAND4_X1 \uut_slave/U74  ( .A1(\uut_slave/n121 ), .A2(\uut_slave/n16 ), .A3(
        \uut_slave/n15 ), .A4(\uut_slave/n89 ), .ZN(\uut_slave/n213 ) );
  NAND4_X1 \uut_slave/U73  ( .A1(\uut_slave/n226 ), .A2(\uut_slave/n232 ), 
        .A3(\uut_slave/n214 ), .A4(\uut_slave/n224 ), .ZN(\uut_slave/n234 ) );
  NAND3_X1 \uut_slave/U72  ( .A1(\uut_slave/n15 ), .A2(\uut_slave/n16 ), .A3(
        \uut_slave/n226 ), .ZN(\uut_slave/n214 ) );
  INV_X1 \uut_slave/U71  ( .A(\uut_slave/n216 ), .ZN(\uut_slave/n226 ) );
  NAND2_X1 \uut_slave/U70  ( .A1(\uut_slave/n6 ), .A2(\uut_slave/n89 ), .ZN(
        \uut_slave/n216 ) );
  OAI22_X1 \uut_slave/U69  ( .A1(\uut_slave/n233 ), .A2(\uut_slave/n97 ), .B1(
        \uut_slave/n20 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n188 ) );
  NAND2_X1 \uut_slave/U68  ( .A1(\uut_slave/n96 ), .A2(\uut_slave/n232 ), .ZN(
        \uut_slave/n222 ) );
  INV_X1 \uut_slave/U67  ( .A(\uut_slave/n211 ), .ZN(\uut_slave/n221 ) );
  OAI21_X1 \uut_slave/U66  ( .B1(\uut_slave/n212 ), .B2(\uut_slave/n86 ), .A(
        \uut_slave/n224 ), .ZN(\uut_slave/n211 ) );
  OAI21_X1 \uut_slave/U65  ( .B1(\uut_slave/n242 ), .B2(\uut_slave/n243 ), .A(
        \uut_slave/n232 ), .ZN(\uut_slave/n224 ) );
  OAI22_X1 \uut_slave/U64  ( .A1(\uut_slave/n210 ), .A2(\uut_slave/n209 ), 
        .B1(\uut_slave/n6 ), .B2(\uut_slave/n93 ), .ZN(\uut_slave/n197 ) );
  NAND2_X1 \uut_slave/U63  ( .A1(\uut_slave/data_count [4]), .A2(
        \uut_slave/n206 ), .ZN(\uut_slave/n207 ) );
  OAI22_X1 \uut_slave/U62  ( .A1(\uut_slave/n209 ), .A2(\uut_slave/n204 ), 
        .B1(\uut_slave/n13 ), .B2(\uut_slave/n93 ), .ZN(\uut_slave/n198 ) );
  XOR2_X1 \uut_slave/U61  ( .A(\uut_slave/n205 ), .B(\uut_slave/data_count [4]), .Z(\uut_slave/n204 ) );
  NAND3_X1 \uut_slave/U60  ( .A1(\uut_slave/data_count [3]), .A2(
        \uut_slave/n84 ), .A3(\uut_slave/n85 ), .ZN(\uut_slave/n205 ) );
  OAI22_X1 \uut_slave/U59  ( .A1(\uut_slave/n209 ), .A2(\uut_slave/n203 ), 
        .B1(\uut_slave/n14 ), .B2(\uut_slave/n93 ), .ZN(\uut_slave/n199 ) );
  OAI22_X1 \uut_slave/U58  ( .A1(\uut_slave/n209 ), .A2(\uut_slave/n123 ), 
        .B1(\uut_slave/n15 ), .B2(\uut_slave/n93 ), .ZN(\uut_slave/n200 ) );
  XOR2_X1 \uut_slave/U57  ( .A(\uut_slave/n124 ), .B(\uut_slave/n84 ), .Z(
        \uut_slave/n123 ) );
  NAND2_X1 \uut_slave/U56  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n124 ) );
  OAI22_X1 \uut_slave/U55  ( .A1(\uut_slave/n209 ), .A2(\uut_slave/n122 ), 
        .B1(\uut_slave/n16 ), .B2(\uut_slave/n93 ), .ZN(\uut_slave/n201 ) );
  XOR2_X1 \uut_slave/U54  ( .A(\uut_slave/n121 ), .B(\uut_slave/n87 ), .Z(
        \uut_slave/n122 ) );
  MUX2_X1 \uut_slave/U53  ( .A(\uut_slave/n82 ), .B(\uut_slave/n92 ), .S(
        \uut_slave/n121 ), .Z(\uut_slave/n202 ) );
  NAND3_X1 \uut_slave/U52  ( .A1(\uut_slave/n119 ), .A2(\uut_slave/n223 ), 
        .A3(\uut_slave/n208 ), .ZN(\uut_slave/n209 ) );
  NAND4_X1 \uut_slave/U51  ( .A1(\uut_slave/data_count [0]), .A2(
        \uut_slave/n87 ), .A3(\uut_slave/n84 ), .A4(\uut_slave/n118 ), .ZN(
        \uut_slave/n223 ) );
  NOR3_X1 \uut_slave/U50  ( .A1(\uut_slave/n6 ), .A2(\uut_slave/n14 ), .A3(
        \uut_slave/n13 ), .ZN(\uut_slave/n118 ) );
  INV_X1 \uut_slave/U49  ( .A(\uut_slave/n225 ), .ZN(\uut_slave/n119 ) );
  NAND3_X1 \uut_slave/U48  ( .A1(\uut_slave/n232 ), .A2(\uut_slave/n37 ), .A3(
        \uut_slave/n81 ), .ZN(\uut_slave/n225 ) );
  INV_X1 \uut_slave/U47  ( .A(\uut_slave/n208 ), .ZN(\uut_slave/n120 ) );
  NAND4_X1 \uut_slave/U46  ( .A1(\uut_slave/n232 ), .A2(\uut_slave/n116 ), 
        .A3(\uut_slave/n37 ), .A4(\uut_slave/n81 ), .ZN(\uut_slave/n208 ) );
  NOR2_X1 \uut_slave/U45  ( .A1(rst), .A2(\uut_slave/n117 ), .ZN(
        \uut_slave/N204 ) );
  INV_X1 \uut_slave/U44  ( .A(\uut_slave/next_state [0]), .ZN(\uut_slave/n117 ) );
  INV_X1 \uut_slave/U43  ( .A(\uut_slave/n120 ), .ZN(\uut_slave/n93 ) );
  XNOR2_X1 \uut_slave/U42  ( .A(\uut_slave/n207 ), .B(\uut_slave/n6 ), .ZN(
        \uut_slave/n210 ) );
  AND3_X1 \uut_slave/U41  ( .A1(\uut_slave/n223 ), .A2(\uut_slave/n208 ), .A3(
        \uut_slave/n119 ), .ZN(\uut_slave/n92 ) );
  AND2_X1 \uut_slave/U40  ( .A1(\uut_slave/n13 ), .A2(\uut_slave/n14 ), .ZN(
        \uut_slave/n89 ) );
  INV_X1 \uut_slave/U39  ( .A(rst), .ZN(\uut_slave/n232 ) );
  AND2_X1 \uut_slave/U38  ( .A1(\uut_slave/n85 ), .A2(\uut_slave/n84 ), .ZN(
        \uut_slave/n88 ) );
  XNOR2_X1 \uut_slave/U37  ( .A(\uut_slave/n88 ), .B(\uut_slave/n83 ), .ZN(
        \uut_slave/n203 ) );
  BUF_X1 \uut_slave/U36  ( .A(\uut_slave/n231 ), .Z(\uut_slave/n103 ) );
  BUF_X1 \uut_slave/U35  ( .A(\uut_slave/n221 ), .Z(\uut_slave/n96 ) );
  BUF_X1 \uut_slave/U34  ( .A(\uut_slave/n221 ), .Z(\uut_slave/n95 ) );
  BUF_X1 \uut_slave/U33  ( .A(\uut_slave/n221 ), .Z(\uut_slave/n94 ) );
  BUF_X1 \uut_slave/U32  ( .A(\uut_slave/n231 ), .Z(\uut_slave/n102 ) );
  BUF_X1 \uut_slave/U31  ( .A(\uut_slave/n231 ), .Z(\uut_slave/n101 ) );
  INV_X1 \uut_slave/U30  ( .A(sck), .ZN(\uut_slave/n116 ) );
  BUF_X1 \uut_slave/U29  ( .A(\uut_slave/n111 ), .Z(\uut_slave/n110 ) );
  BUF_X1 \uut_slave/U28  ( .A(\uut_slave/n100 ), .Z(\uut_slave/n99 ) );
  BUF_X1 \uut_slave/U27  ( .A(\uut_slave/n107 ), .Z(\uut_slave/n106 ) );
  BUF_X1 \uut_slave/U26  ( .A(\uut_slave/n107 ), .Z(\uut_slave/n105 ) );
  BUF_X1 \uut_slave/U25  ( .A(\uut_slave/n107 ), .Z(\uut_slave/n104 ) );
  BUF_X1 \uut_slave/U24  ( .A(\uut_slave/n100 ), .Z(\uut_slave/n97 ) );
  BUF_X1 \uut_slave/U23  ( .A(\uut_slave/n100 ), .Z(\uut_slave/n98 ) );
  BUF_X1 \uut_slave/U22  ( .A(\uut_slave/n111 ), .Z(\uut_slave/n109 ) );
  BUF_X1 \uut_slave/U21  ( .A(\uut_slave/n111 ), .Z(\uut_slave/n108 ) );
  INV_X1 \uut_slave/U20  ( .A(\uut_slave/n115 ), .ZN(\uut_slave/n91 ) );
  INV_X1 \uut_slave/U19  ( .A(\uut_slave/n114 ), .ZN(\uut_slave/n113 ) );
  INV_X1 \uut_slave/U18  ( .A(\uut_slave/n114 ), .ZN(\uut_slave/n112 ) );
  INV_X1 \uut_slave/U17  ( .A(sck), .ZN(\uut_slave/n90 ) );
  CLKBUF_X1 \uut_slave/U16  ( .A(\uut_slave/data_count [1]), .Z(
        \uut_slave/n87 ) );
  AND2_X1 \uut_slave/U15  ( .A1(\uut_slave/n85 ), .A2(\uut_slave/n61 ), .ZN(
        \uut_slave/n206 ) );
  BUF_X1 \uut_slave/U14  ( .A(\uut_slave/n222 ), .Z(\uut_slave/n100 ) );
  BUF_X1 \uut_slave/U13  ( .A(\uut_slave/n235 ), .Z(\uut_slave/n111 ) );
  BUF_X1 \uut_slave/U12  ( .A(\uut_slave/n234 ), .Z(\uut_slave/n107 ) );
  BUF_X1 \uut_slave/U11  ( .A(\uut_slave/n116 ), .Z(\uut_slave/n114 ) );
  BUF_X1 \uut_slave/U10  ( .A(\uut_slave/n116 ), .Z(\uut_slave/n115 ) );
  CLKBUF_X1 \uut_slave/U9  ( .A(\uut_slave/n225 ), .Z(\uut_slave/n86 ) );
  AND2_X1 \uut_slave/U8  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n85 ) );
  INV_X1 \uut_slave/U7  ( .A(\uut_slave/n15 ), .ZN(\uut_slave/n84 ) );
  CLKBUF_X1 \uut_slave/U6  ( .A(\uut_slave/data_count [3]), .Z(\uut_slave/n83 ) );
  CLKBUF_X1 \uut_slave/U5  ( .A(\uut_slave/n120 ), .Z(\uut_slave/n82 ) );
  AND2_X1 \uut_slave/U4  ( .A1(\uut_slave/next_state [1]), .A2(
        \uut_slave/n232 ), .ZN(\uut_slave/n78 ) );
  AND2_X1 \uut_slave/U3  ( .A1(\uut_slave/data_count [2]), .A2(
        \uut_slave/data_count [3]), .ZN(\uut_slave/n61 ) );
  DFF_X1 \uut_slave/data_count_reg[5]  ( .D(\uut_slave/n197 ), .CK(clk), .Q(
        \uut_slave/n212 ), .QN(\uut_slave/n6 ) );
  DFF_X1 \uut_slave/data_count_reg[1]  ( .D(\uut_slave/n201 ), .CK(clk), .Q(
        \uut_slave/data_count [1]), .QN(\uut_slave/n16 ) );
  DFF_X1 \uut_slave/data_count_reg[0]  ( .D(\uut_slave/n202 ), .CK(clk), .Q(
        \uut_slave/data_count [0]), .QN(\uut_slave/n121 ) );
  DFF_X1 \uut_slave/data_count_reg[2]  ( .D(\uut_slave/n200 ), .CK(clk), .Q(
        \uut_slave/data_count [2]), .QN(\uut_slave/n15 ) );
  DFF_X1 \uut_slave/data_count_reg[4]  ( .D(\uut_slave/n198 ), .CK(clk), .Q(
        \uut_slave/data_count [4]), .QN(\uut_slave/n13 ) );
  DLH_X1 \uut_slave/miso_reg  ( .G(\uut_slave/N226 ), .D(\uut_slave/N219 ), 
        .Q(miso) );
  DFF_X1 \uut_slave/data_end_reg  ( .D(\uut_slave/N41 ), .CK(clk), .Q(
        \uut_slave/data_end ) );
  DFF_X1 \uut_slave/data_out_reg[31]  ( .D(\uut_slave/n125 ), .CK(
        \uut_slave/n90 ), .Q(\uut_slave/n244 ), .QN(\uut_slave/n79 ) );
  DFF_X1 \uut_slave/data_out_reg[30]  ( .D(\uut_slave/n126 ), .CK(
        \uut_slave/n114 ), .QN(\uut_slave/n60 ) );
  DFF_X1 \uut_slave/data_out_reg[29]  ( .D(\uut_slave/n127 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n77 ) );
  DFF_X1 \uut_slave/data_out_reg[28]  ( .D(\uut_slave/n128 ), .CK(
        \uut_slave/n116 ), .QN(\uut_slave/n59 ) );
  DFF_X1 \uut_slave/data_out_reg[27]  ( .D(\uut_slave/n129 ), .CK(
        \uut_slave/n116 ), .QN(\uut_slave/n76 ) );
  DFF_X1 \uut_slave/data_out_reg[26]  ( .D(\uut_slave/n130 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n58 ) );
  DFF_X1 \uut_slave/data_out_reg[25]  ( .D(\uut_slave/n131 ), .CK(
        \uut_slave/n116 ), .QN(\uut_slave/n75 ) );
  DFF_X1 \uut_slave/data_out_reg[24]  ( .D(\uut_slave/n132 ), .CK(
        \uut_slave/n114 ), .QN(\uut_slave/n51 ) );
  DFF_X1 \uut_slave/data_out_reg[23]  ( .D(\uut_slave/n133 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n74 ) );
  DFF_X1 \uut_slave/data_out_reg[22]  ( .D(\uut_slave/n134 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n50 ) );
  DFF_X1 \uut_slave/data_out_reg[21]  ( .D(\uut_slave/n135 ), .CK(
        \uut_slave/n116 ), .QN(\uut_slave/n73 ) );
  DFF_X1 \uut_slave/data_out_reg[20]  ( .D(\uut_slave/n136 ), .CK(
        \uut_slave/n114 ), .QN(\uut_slave/n49 ) );
  DFF_X1 \uut_slave/data_out_reg[19]  ( .D(\uut_slave/n137 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n72 ) );
  DFF_X1 \uut_slave/data_out_reg[18]  ( .D(\uut_slave/n138 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n48 ) );
  DFF_X1 \uut_slave/data_out_reg[17]  ( .D(\uut_slave/n139 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n71 ) );
  DFF_X1 \uut_slave/data_out_reg[16]  ( .D(\uut_slave/n140 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n47 ) );
  DFF_X1 \uut_slave/data_out_reg[15]  ( .D(\uut_slave/n141 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n70 ) );
  DFF_X1 \uut_slave/data_out_reg[14]  ( .D(\uut_slave/n142 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n46 ) );
  DFF_X1 \uut_slave/data_out_reg[13]  ( .D(\uut_slave/n143 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n69 ) );
  DFF_X1 \uut_slave/data_out_reg[12]  ( .D(\uut_slave/n144 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n45 ) );
  DFF_X1 \uut_slave/data_out_reg[11]  ( .D(\uut_slave/n145 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n68 ) );
  DFF_X1 \uut_slave/data_out_reg[10]  ( .D(\uut_slave/n146 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n44 ) );
  DFF_X1 \uut_slave/data_out_reg[9]  ( .D(\uut_slave/n147 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n67 ) );
  DFF_X1 \uut_slave/data_out_reg[8]  ( .D(\uut_slave/n148 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n43 ) );
  DFF_X1 \uut_slave/data_out_reg[7]  ( .D(\uut_slave/n149 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n66 ) );
  DFF_X1 \uut_slave/data_out_reg[6]  ( .D(\uut_slave/n150 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n42 ) );
  DFF_X1 \uut_slave/data_out_reg[5]  ( .D(\uut_slave/n151 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n65 ) );
  DFF_X1 \uut_slave/data_out_reg[4]  ( .D(\uut_slave/n152 ), .CK(
        \uut_slave/n90 ), .QN(\uut_slave/n41 ) );
  DFF_X1 \uut_slave/data_out_reg[3]  ( .D(\uut_slave/n153 ), .CK(
        \uut_slave/n116 ), .QN(\uut_slave/n64 ) );
  DFF_X1 \uut_slave/data_out_reg[2]  ( .D(\uut_slave/n154 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n40 ) );
  DFF_X1 \uut_slave/data_out_reg[1]  ( .D(\uut_slave/n155 ), .CK(
        \uut_slave/n116 ), .QN(\uut_slave/n36 ) );
  DFF_X1 \uut_slave/data_out_reg[0]  ( .D(\uut_slave/n156 ), .CK(
        \uut_slave/n114 ), .QN(\uut_slave/n63 ) );
  DFF_X1 \uut_slave/command_save_reg[7]  ( .D(\uut_slave/n189 ), .CK(
        \uut_slave/n91 ), .Q(\uut_slave/n245 ), .QN(\uut_slave/n80 ) );
  DFF_X1 \uut_slave/command_save_reg[6]  ( .D(\uut_slave/n196 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n39 ) );
  DFF_X1 \uut_slave/command_save_reg[5]  ( .D(\uut_slave/n190 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n52 ) );
  DFF_X1 \uut_slave/command_save_reg[4]  ( .D(\uut_slave/n191 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n53 ) );
  DFF_X1 \uut_slave/command_save_reg[3]  ( .D(\uut_slave/n192 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n54 ) );
  DFF_X1 \uut_slave/command_save_reg[2]  ( .D(\uut_slave/n193 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n55 ) );
  DFF_X1 \uut_slave/command_save_reg[1]  ( .D(\uut_slave/n194 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n56 ) );
  DFF_X1 \uut_slave/command_save_reg[0]  ( .D(\uut_slave/n195 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n57 ) );
  DFF_X1 \uut_slave/data_save_reg[31]  ( .D(\uut_slave/n157 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n35 ) );
  DFF_X1 \uut_slave/data_save_reg[30]  ( .D(\uut_slave/n158 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n19 ) );
  DFF_X1 \uut_slave/data_save_reg[29]  ( .D(\uut_slave/n159 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n34 ) );
  DFF_X1 \uut_slave/data_save_reg[28]  ( .D(\uut_slave/n160 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n18 ) );
  DFF_X1 \uut_slave/data_save_reg[27]  ( .D(\uut_slave/n161 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n33 ) );
  DFF_X1 \uut_slave/data_save_reg[26]  ( .D(\uut_slave/n162 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n17 ) );
  DFF_X1 \uut_slave/data_save_reg[25]  ( .D(\uut_slave/n163 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n32 ) );
  DFF_X1 \uut_slave/data_save_reg[24]  ( .D(\uut_slave/n164 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n12 ) );
  DFF_X1 \uut_slave/data_save_reg[23]  ( .D(\uut_slave/n165 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n31 ) );
  DFF_X1 \uut_slave/data_save_reg[22]  ( .D(\uut_slave/n166 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n11 ) );
  DFF_X1 \uut_slave/data_save_reg[21]  ( .D(\uut_slave/n167 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n30 ) );
  DFF_X1 \uut_slave/data_save_reg[20]  ( .D(\uut_slave/n168 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n10 ) );
  DFF_X1 \uut_slave/data_save_reg[19]  ( .D(\uut_slave/n169 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n29 ) );
  DFF_X1 \uut_slave/data_save_reg[18]  ( .D(\uut_slave/n170 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n9 ) );
  DFF_X1 \uut_slave/data_save_reg[17]  ( .D(\uut_slave/n171 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n28 ) );
  DFF_X1 \uut_slave/data_save_reg[16]  ( .D(\uut_slave/n172 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n8 ) );
  DFF_X1 \uut_slave/data_save_reg[15]  ( .D(\uut_slave/n173 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n27 ) );
  DFF_X1 \uut_slave/data_save_reg[14]  ( .D(\uut_slave/n174 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n7 ) );
  DFF_X1 \uut_slave/data_save_reg[13]  ( .D(\uut_slave/n175 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n26 ) );
  DFF_X1 \uut_slave/data_save_reg[12]  ( .D(\uut_slave/n176 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n5 ) );
  DFF_X1 \uut_slave/data_save_reg[11]  ( .D(\uut_slave/n177 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n25 ) );
  DFF_X1 \uut_slave/data_save_reg[10]  ( .D(\uut_slave/n178 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n4 ) );
  DFF_X1 \uut_slave/data_save_reg[9]  ( .D(\uut_slave/n179 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n24 ) );
  DFF_X1 \uut_slave/data_save_reg[8]  ( .D(\uut_slave/n180 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n3 ) );
  DFF_X1 \uut_slave/data_save_reg[7]  ( .D(\uut_slave/n181 ), .CK(
        \uut_slave/n113 ), .QN(\uut_slave/n23 ) );
  DFF_X1 \uut_slave/data_save_reg[6]  ( .D(\uut_slave/n182 ), .CK(sck), .QN(
        \uut_slave/n2 ) );
  DFF_X1 \uut_slave/data_save_reg[5]  ( .D(\uut_slave/n183 ), .CK(sck), .QN(
        \uut_slave/n22 ) );
  DFF_X1 \uut_slave/data_save_reg[4]  ( .D(\uut_slave/n184 ), .CK(sck), .QN(
        \uut_slave/n1 ) );
  DFF_X1 \uut_slave/data_save_reg[3]  ( .D(\uut_slave/n185 ), .CK(sck), .QN(
        \uut_slave/n21 ) );
  DFF_X1 \uut_slave/data_save_reg[2]  ( .D(\uut_slave/n186 ), .CK(sck), .QN(
        \uut_slave/n62 ) );
  DFF_X1 \uut_slave/data_save_reg[1]  ( .D(\uut_slave/n187 ), .CK(sck), .QN(
        \uut_slave/n38 ) );
  DFF_X1 \uut_slave/data_save_reg[0]  ( .D(\uut_slave/n188 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n20 ) );
  DFF_X1 \uut_slave/data_count_reg[3]  ( .D(\uut_slave/n199 ), .CK(clk), .Q(
        \uut_slave/data_count [3]), .QN(\uut_slave/n14 ) );
  DFF_X1 \uut_slave/current_state_reg[1]  ( .D(\uut_slave/n78 ), .CK(clk), .Q(
        \uut_slave/n37 ), .QN(\uut_slave/n243 ) );
  DLH_X1 \uut_slave/next_state_reg[1]  ( .G(\uut_slave/N223 ), .D(
        \uut_slave/N225 ), .Q(\uut_slave/next_state [1]) );
  DFF_X1 \uut_slave/current_state_reg[0]  ( .D(\uut_slave/N204 ), .CK(clk), 
        .Q(\uut_slave/n242 ), .QN(\uut_slave/n81 ) );
  DLH_X1 \uut_slave/next_state_reg[0]  ( .G(\uut_slave/N223 ), .D(
        \uut_slave/N224 ), .Q(\uut_slave/next_state [0]) );
endmodule

