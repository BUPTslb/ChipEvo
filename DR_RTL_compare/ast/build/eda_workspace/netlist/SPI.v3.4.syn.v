/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 08:20:46 2026
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
         \uut_master/n428 , \uut_master/n427 , \uut_master/n426 ,
         \uut_master/n425 , \uut_master/n424 , \uut_master/n423 ,
         \uut_master/n422 , \uut_master/n421 , \uut_master/n420 ,
         \uut_master/n419 , \uut_master/n418 , \uut_master/n417 ,
         \uut_master/n416 , \uut_master/n415 , \uut_master/n414 ,
         \uut_master/n413 , \uut_master/n412 , \uut_master/n411 ,
         \uut_master/n410 , \uut_master/n409 , \uut_master/n408 ,
         \uut_master/n407 , \uut_master/n406 , \uut_master/n405 ,
         \uut_master/n404 , \uut_master/n403 , \uut_master/n402 ,
         \uut_master/n401 , \uut_master/n400 , \uut_master/n399 ,
         \uut_master/n398 , \uut_master/n397 , \uut_master/n396 ,
         \uut_master/n395 , \uut_master/n394 , \uut_master/n393 ,
         \uut_master/n392 , \uut_master/n391 , \uut_master/n390 ,
         \uut_master/n389 , \uut_master/n388 , \uut_master/n386 ,
         \uut_master/n385 , \uut_master/n384 , \uut_master/n383 ,
         \uut_master/n382 , \uut_master/n381 , \uut_master/n380 ,
         \uut_master/n379 , \uut_master/n378 , \uut_master/n377 ,
         \uut_master/n376 , \uut_master/n375 , \uut_master/n374 ,
         \uut_master/n373 , \uut_master/n372 , \uut_master/n371 ,
         \uut_master/n370 , \uut_master/n369 , \uut_master/n368 ,
         \uut_master/n367 , \uut_master/n366 , \uut_master/n365 ,
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
         \uut_master/n307 , \uut_master/n306 , \uut_master/n305 ,
         \uut_master/n304 , \uut_master/n303 , \uut_master/n302 ,
         \uut_master/n301 , \uut_master/n300 , \uut_master/n299 ,
         \uut_master/n298 , \uut_master/n297 , \uut_master/n296 ,
         \uut_master/n295 , \uut_master/n294 , \uut_master/n293 ,
         \uut_master/n292 , \uut_master/n291 , \uut_master/n290 ,
         \uut_master/n289 , \uut_master/n288 , \uut_master/n287 ,
         \uut_master/n286 , \uut_master/n285 , \uut_master/n284 ,
         \uut_master/n283 , \uut_master/n282 , \uut_master/n281 ,
         \uut_master/n280 , \uut_master/n279 , \uut_master/n278 ,
         \uut_master/n277 , \uut_master/n276 , \uut_master/n275 ,
         \uut_master/n274 , \uut_master/n273 , \uut_master/n272 ,
         \uut_master/n271 , \uut_master/n270 , \uut_master/n269 ,
         \uut_master/n268 , \uut_master/n267 , \uut_master/n266 ,
         \uut_master/n265 , \uut_master/n264 , \uut_master/n263 ,
         \uut_master/n262 , \uut_master/n261 , \uut_master/n260 ,
         \uut_master/n259 , \uut_master/n258 , \uut_master/n257 ,
         \uut_master/n256 , \uut_master/n255 , \uut_master/n254 ,
         \uut_master/n253 , \uut_master/n252 , \uut_master/n251 ,
         \uut_master/n250 , \uut_master/n249 , \uut_master/n248 ,
         \uut_master/n247 , \uut_master/n246 , \uut_master/n245 ,
         \uut_master/n244 , \uut_master/n243 , \uut_master/n242 ,
         \uut_master/n241 , \uut_master/n240 , \uut_master/n239 ,
         \uut_master/n238 , \uut_master/n237 , \uut_master/n236 ,
         \uut_master/n235 , \uut_master/n234 , \uut_master/n233 ,
         \uut_master/n232 , \uut_master/n231 , \uut_master/n230 ,
         \uut_master/n229 , \uut_master/n228 , \uut_master/n227 ,
         \uut_master/n226 , \uut_master/n225 , \uut_master/n224 ,
         \uut_master/n223 , \uut_master/n222 , \uut_master/n221 ,
         \uut_master/n220 , \uut_master/n219 , \uut_master/n218 ,
         \uut_master/n217 , \uut_master/n216 , \uut_master/n215 ,
         \uut_master/n214 , \uut_master/n213 , \uut_master/n212 ,
         \uut_master/n211 , \uut_master/n210 , \uut_master/n209 ,
         \uut_master/n208 , \uut_master/n207 , \uut_master/n206 ,
         \uut_master/n205 , \uut_master/n204 , \uut_master/n203 ,
         \uut_master/n202 , \uut_master/n201 , \uut_master/n200 ,
         \uut_master/n199 , \uut_master/n198 , \uut_master/n197 ,
         \uut_master/n196 , \uut_master/n195 , \uut_master/n194 ,
         \uut_master/n193 , \uut_master/n192 , \uut_master/n191 ,
         \uut_master/n190 , \uut_master/n189 , \uut_master/n188 ,
         \uut_master/n187 , \uut_master/n186 , \uut_master/n185 ,
         \uut_master/n184 , \uut_master/n183 , \uut_master/n182 ,
         \uut_master/n181 , \uut_master/n180 , \uut_master/n179 ,
         \uut_master/n178 , \uut_master/n177 , \uut_master/n176 ,
         \uut_master/n175 , \uut_master/n174 , \uut_master/n173 ,
         \uut_master/n172 , \uut_master/n171 , \uut_master/n170 ,
         \uut_master/n169 , \uut_master/n168 , \uut_master/n167 ,
         \uut_master/n166 , \uut_master/n165 , \uut_master/n164 ,
         \uut_master/n163 , \uut_master/n162 , \uut_master/n161 ,
         \uut_master/n160 , \uut_master/n159 , \uut_master/n158 ,
         \uut_master/n157 , \uut_master/n156 , \uut_master/n155 ,
         \uut_master/n154 , \uut_master/n153 , \uut_master/n152 ,
         \uut_master/n151 , \uut_master/n150 , \uut_master/n149 ,
         \uut_master/n148 , \uut_master/n147 , \uut_master/n146 ,
         \uut_master/n145 , \uut_master/n144 , \uut_master/n143 ,
         \uut_master/n142 , \uut_master/n141 , \uut_master/n140 ,
         \uut_master/n139 , \uut_master/n138 , \uut_master/n137 ,
         \uut_master/n136 , \uut_master/n135 , \uut_master/n134 ,
         \uut_master/n133 , \uut_master/n132 , \uut_master/n131 ,
         \uut_master/n130 , \uut_master/n129 , \uut_master/n128 ,
         \uut_master/n127 , \uut_master/n126 , \uut_master/n125 ,
         \uut_master/n124 , \uut_master/n123 , \uut_master/n122 ,
         \uut_master/n121 , \uut_master/n120 , \uut_master/n119 ,
         \uut_master/n118 , \uut_master/n116 , \uut_master/n115 ,
         \uut_master/n114 , \uut_master/n113 , \uut_master/n112 ,
         \uut_master/n110 , \uut_master/n109 , \uut_master/n108 ,
         \uut_master/n107 , \uut_master/n49 , \uut_master/n47 ,
         \uut_master/n44 , \uut_master/n43 , \uut_master/n42 ,
         \uut_master/n41 , \uut_master/n40 , \uut_master/n39 ,
         \uut_master/n38 , \uut_master/n37 , \uut_master/n36 ,
         \uut_master/n35 , \uut_master/n34 , \uut_master/n33 ,
         \uut_master/n32 , \uut_master/n31 , \uut_master/n30 ,
         \uut_master/n29 , \uut_master/n28 , \uut_master/n27 ,
         \uut_master/n26 , \uut_master/n25 , \uut_master/n24 ,
         \uut_master/n23 , \uut_master/n22 , \uut_master/n21 ,
         \uut_master/n20 , \uut_master/n19 , \uut_master/n18 ,
         \uut_master/n17 , \uut_master/n16 , \uut_master/n15 ,
         \uut_master/n14 , \uut_master/n13 , \uut_master/n12 ,
         \uut_master/n11 , \uut_master/n10 , \uut_master/n9 , \uut_master/n8 ,
         \uut_master/n7 , \uut_master/n6 , \uut_master/n5 , \uut_master/n4 ,
         \uut_master/n3 , \uut_master/n2 , \uut_master/n1 , \uut_master/n111 ,
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
         \uut_master/n52 , \uut_master/n51 , \uut_master/n50 ,
         \uut_master/n48 , \uut_master/n46 , \uut_master/n45 ,
         \uut_master/N288 , \uut_master/N287 , \uut_master/N164 ,
         \uut_master/N163 , \uut_master/N162 , \uut_master/N161 ,
         \uut_master/N160 , \uut_master/N159 , \uut_master/N158 ,
         \uut_master/N149 , \uut_master/N148 , \uut_master/N147 ,
         \uut_master/N146 , \uut_master/N145 , \uut_master/N144 ,
         \uut_master/N143 , \uut_master/N142 , \uut_master/N141 ,
         \uut_master/N140 , \uut_master/N139 , \uut_master/N138 ,
         \uut_master/N137 , \uut_master/N136 , \uut_master/N135 ,
         \uut_master/N134 , \uut_master/N133 , \uut_master/N132 ,
         \uut_master/N131 , \uut_master/N130 , \uut_master/N129 ,
         \uut_master/N128 , \uut_master/N127 , \uut_master/N126 ,
         \uut_master/N125 , \uut_master/N124 , \uut_master/N123 ,
         \uut_master/N122 , \uut_master/N121 , \uut_master/N120 ,
         \uut_master/N119 , \uut_master/N118 , \uut_master/N117 ,
         \uut_master/N116 , \uut_master/N115 , \uut_master/N114 ,
         \uut_master/N113 , \uut_master/N112 , \uut_master/N111 ,
         \uut_master/N110 , \uut_master/N109 , \uut_master/N108 ,
         \uut_master/N107 , \uut_master/N106 , \uut_master/N105 ,
         \uut_master/N104 , \uut_master/N103 , \uut_master/N102 ,
         \uut_master/N101 , \uut_master/N100 , \uut_master/N99 ,
         \uut_master/N98 , \uut_master/N97 , \uut_master/N96 ,
         \uut_master/N95 , \uut_master/data_save[63] , \uut_master/N17 ,
         \uut_master/clock_count , \uut_slave/n238 , \uut_slave/n237 ,
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
         \uut_slave/n203 , \uut_slave/n202 , \uut_slave/n201 ,
         \uut_slave/n200 , \uut_slave/n121 , \uut_slave/n120 ,
         \uut_slave/n119 , \uut_slave/n118 , \uut_slave/n117 ,
         \uut_slave/n116 , \uut_slave/n115 , \uut_slave/n114 ,
         \uut_slave/n113 , \uut_slave/n112 , \uut_slave/n111 ,
         \uut_slave/n110 , \uut_slave/n109 , \uut_slave/n108 ,
         \uut_slave/n107 , \uut_slave/n106 , \uut_slave/n103 ,
         \uut_slave/n102 , \uut_slave/n101 , \uut_slave/n100 , \uut_slave/n99 ,
         \uut_slave/n98 , \uut_slave/n97 , \uut_slave/n96 , \uut_slave/n95 ,
         \uut_slave/n94 , \uut_slave/n93 , \uut_slave/n92 , \uut_slave/n91 ,
         \uut_slave/n90 , \uut_slave/n16 , \uut_slave/n15 , \uut_slave/n14 ,
         \uut_slave/n13 , \uut_slave/n12 , \uut_slave/n11 , \uut_slave/n10 ,
         \uut_slave/n9 , \uut_slave/n8 , \uut_slave/n7 , \uut_slave/n6 ,
         \uut_slave/n4 , \uut_slave/n3 , \uut_slave/n2 , \uut_slave/n1 ,
         \uut_slave/n199 , \uut_slave/n198 , \uut_slave/n197 ,
         \uut_slave/n196 , \uut_slave/n195 , \uut_slave/n194 ,
         \uut_slave/n193 , \uut_slave/n192 , \uut_slave/n191 ,
         \uut_slave/n190 , \uut_slave/n189 , \uut_slave/n188 ,
         \uut_slave/n187 , \uut_slave/n186 , \uut_slave/n185 ,
         \uut_slave/n184 , \uut_slave/n183 , \uut_slave/n182 ,
         \uut_slave/n181 , \uut_slave/n180 , \uut_slave/n179 ,
         \uut_slave/n178 , \uut_slave/n177 , \uut_slave/n176 ,
         \uut_slave/n175 , \uut_slave/n174 , \uut_slave/n173 ,
         \uut_slave/n172 , \uut_slave/n171 , \uut_slave/n170 ,
         \uut_slave/n169 , \uut_slave/n168 , \uut_slave/n167 ,
         \uut_slave/n166 , \uut_slave/n165 , \uut_slave/n164 ,
         \uut_slave/n163 , \uut_slave/n162 , \uut_slave/n161 ,
         \uut_slave/n160 , \uut_slave/n159 , \uut_slave/n158 ,
         \uut_slave/n157 , \uut_slave/n156 , \uut_slave/n155 ,
         \uut_slave/n154 , \uut_slave/n153 , \uut_slave/n152 ,
         \uut_slave/n151 , \uut_slave/n150 , \uut_slave/n149 ,
         \uut_slave/n148 , \uut_slave/n147 , \uut_slave/n146 ,
         \uut_slave/n145 , \uut_slave/n144 , \uut_slave/n143 ,
         \uut_slave/n142 , \uut_slave/n141 , \uut_slave/n140 ,
         \uut_slave/n139 , \uut_slave/n138 , \uut_slave/n137 ,
         \uut_slave/n136 , \uut_slave/n135 , \uut_slave/n134 ,
         \uut_slave/n133 , \uut_slave/n132 , \uut_slave/n131 ,
         \uut_slave/n130 , \uut_slave/n129 , \uut_slave/n128 ,
         \uut_slave/n127 , \uut_slave/n126 , \uut_slave/n125 ,
         \uut_slave/n124 , \uut_slave/n123 , \uut_slave/n122 ,
         \uut_slave/n105 , \uut_slave/n104 , \uut_slave/n89 , \uut_slave/n88 ,
         \uut_slave/n87 , \uut_slave/n86 , \uut_slave/n85 , \uut_slave/n84 ,
         \uut_slave/n83 , \uut_slave/n82 , \uut_slave/n81 , \uut_slave/n80 ,
         \uut_slave/n79 , \uut_slave/n78 , \uut_slave/n77 , \uut_slave/n76 ,
         \uut_slave/n75 , \uut_slave/n74 , \uut_slave/n73 , \uut_slave/n72 ,
         \uut_slave/n71 , \uut_slave/n70 , \uut_slave/n69 , \uut_slave/n68 ,
         \uut_slave/n67 , \uut_slave/n66 , \uut_slave/n65 , \uut_slave/n64 ,
         \uut_slave/n63 , \uut_slave/n62 , \uut_slave/n61 , \uut_slave/n60 ,
         \uut_slave/n59 , \uut_slave/n58 , \uut_slave/n57 , \uut_slave/n56 ,
         \uut_slave/n55 , \uut_slave/n54 , \uut_slave/n53 , \uut_slave/n52 ,
         \uut_slave/n51 , \uut_slave/n50 , \uut_slave/n49 , \uut_slave/n48 ,
         \uut_slave/n47 , \uut_slave/n46 , \uut_slave/n45 , \uut_slave/n44 ,
         \uut_slave/n43 , \uut_slave/n42 , \uut_slave/n41 , \uut_slave/n40 ,
         \uut_slave/n39 , \uut_slave/n38 , \uut_slave/n37 , \uut_slave/n36 ,
         \uut_slave/n35 , \uut_slave/n34 , \uut_slave/n33 , \uut_slave/n32 ,
         \uut_slave/n31 , \uut_slave/n30 , \uut_slave/n29 , \uut_slave/n28 ,
         \uut_slave/n27 , \uut_slave/n26 , \uut_slave/n25 , \uut_slave/n24 ,
         \uut_slave/n23 , \uut_slave/n22 , \uut_slave/n21 , \uut_slave/n20 ,
         \uut_slave/n19 , \uut_slave/n18 , \uut_slave/n17 , \uut_slave/n5 ,
         \uut_slave/N166 , \uut_slave/N165 , \uut_slave/N32 ,
         \uut_slave/current_state[1] ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [63:1] \uut_master/data_save_shifted ;
  wire   [5:0] \uut_master/data_count ;
  wire   [1:0] \uut_master/current_state ;
  wire   [7:0] \uut_slave/command_save ;
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
  AND3_X1 \uut_master/U365  ( .A1(\uut_master/n286 ), .A2(
        \uut_master/data_save[63] ), .A3(\uut_master/n37 ), .ZN(mosi) );
  OAI222_X1 \uut_master/U364  ( .A1(\uut_master/n385 ), .A2(\uut_master/n34 ), 
        .B1(\uut_master/n31 ), .B2(\uut_master/n384 ), .C1(\uut_master/n173 ), 
        .C2(\uut_master/n382 ), .ZN(\uut_master/n389 ) );
  INV_X1 \uut_master/U363  ( .A(command[7]), .ZN(\uut_master/n384 ) );
  OAI222_X1 \uut_master/U362  ( .A1(\uut_master/n32 ), .A2(\uut_master/n382 ), 
        .B1(\uut_master/n125 ), .B2(\uut_master/n381 ), .C1(\uut_master/n128 ), 
        .C2(\uut_master/n380 ), .ZN(\uut_master/n390 ) );
  INV_X1 \uut_master/U361  ( .A(command[6]), .ZN(\uut_master/n381 ) );
  OAI222_X1 \uut_master/U360  ( .A1(\uut_master/n32 ), .A2(\uut_master/n380 ), 
        .B1(\uut_master/n10 ), .B2(\uut_master/n379 ), .C1(\uut_master/n173 ), 
        .C2(\uut_master/n378 ), .ZN(\uut_master/n391 ) );
  INV_X1 \uut_master/U359  ( .A(command[5]), .ZN(\uut_master/n379 ) );
  OAI222_X1 \uut_master/U358  ( .A1(\uut_master/n32 ), .A2(\uut_master/n378 ), 
        .B1(\uut_master/n141 ), .B2(\uut_master/n377 ), .C1(\uut_master/n173 ), 
        .C2(\uut_master/n376 ), .ZN(\uut_master/n392 ) );
  INV_X1 \uut_master/U357  ( .A(command[4]), .ZN(\uut_master/n377 ) );
  OAI222_X1 \uut_master/U356  ( .A1(\uut_master/n32 ), .A2(\uut_master/n376 ), 
        .B1(\uut_master/n10 ), .B2(\uut_master/n375 ), .C1(\uut_master/n173 ), 
        .C2(\uut_master/n374 ), .ZN(\uut_master/n393 ) );
  INV_X1 \uut_master/U355  ( .A(command[3]), .ZN(\uut_master/n375 ) );
  OAI222_X1 \uut_master/U354  ( .A1(\uut_master/n32 ), .A2(\uut_master/n374 ), 
        .B1(\uut_master/n31 ), .B2(\uut_master/n373 ), .C1(\uut_master/n5 ), 
        .C2(\uut_master/n372 ), .ZN(\uut_master/n394 ) );
  INV_X1 \uut_master/U353  ( .A(command[2]), .ZN(\uut_master/n373 ) );
  OAI222_X1 \uut_master/U352  ( .A1(\uut_master/n34 ), .A2(\uut_master/n372 ), 
        .B1(\uut_master/n154 ), .B2(\uut_master/n371 ), .C1(\uut_master/n5 ), 
        .C2(\uut_master/n370 ), .ZN(\uut_master/n395 ) );
  INV_X1 \uut_master/U351  ( .A(command[1]), .ZN(\uut_master/n371 ) );
  OAI221_X1 \uut_master/U350  ( .B1(\uut_master/n141 ), .B2(\uut_master/n369 ), 
        .C1(\uut_master/n32 ), .C2(\uut_master/n370 ), .A(\uut_master/n368 ), 
        .ZN(\uut_master/n396 ) );
  NAND2_X1 \uut_master/U349  ( .A1(\uut_master/n122 ), .A2(
        \uut_master/data_save_shifted [56]), .ZN(\uut_master/n368 ) );
  INV_X1 \uut_master/U348  ( .A(command[0]), .ZN(\uut_master/n369 ) );
  OAI221_X1 \uut_master/U347  ( .B1(\uut_master/n51 ), .B2(\uut_master/n34 ), 
        .C1(\uut_master/n174 ), .C2(\uut_master/n52 ), .A(\uut_master/n367 ), 
        .ZN(\uut_master/N149 ) );
  NAND2_X1 \uut_master/U346  ( .A1(address[23]), .A2(\uut_master/n188 ), .ZN(
        \uut_master/n367 ) );
  OAI21_X1 \uut_master/U345  ( .B1(\uut_master/n53 ), .B2(\uut_master/n175 ), 
        .A(\uut_master/n366 ), .ZN(\uut_master/N148 ) );
  AOI22_X1 \uut_master/U344  ( .A1(address[22]), .A2(\uut_master/n155 ), .B1(
        \uut_master/n16 ), .B2(\uut_master/n365 ), .ZN(\uut_master/n366 ) );
  OAI21_X1 \uut_master/U343  ( .B1(\uut_master/n54 ), .B2(\uut_master/n8 ), 
        .A(\uut_master/n364 ), .ZN(\uut_master/N147 ) );
  AOI22_X1 \uut_master/U342  ( .A1(address[21]), .A2(\uut_master/n156 ), .B1(
        \uut_master/n181 ), .B2(\uut_master/n363 ), .ZN(\uut_master/n364 ) );
  OAI21_X1 \uut_master/U341  ( .B1(\uut_master/n55 ), .B2(\uut_master/n175 ), 
        .A(\uut_master/n362 ), .ZN(\uut_master/N146 ) );
  AOI22_X1 \uut_master/U340  ( .A1(address[20]), .A2(\uut_master/n148 ), .B1(
        \uut_master/n16 ), .B2(\uut_master/n361 ), .ZN(\uut_master/n362 ) );
  AOI22_X1 \uut_master/U339  ( .A1(address[19]), .A2(\uut_master/n165 ), .B1(
        \uut_master/n7 ), .B2(\uut_master/n359 ), .ZN(\uut_master/n360 ) );
  OAI21_X1 \uut_master/U338  ( .B1(\uut_master/n57 ), .B2(\uut_master/n3 ), 
        .A(\uut_master/n358 ), .ZN(\uut_master/N144 ) );
  AOI22_X1 \uut_master/U337  ( .A1(address[18]), .A2(\uut_master/n166 ), .B1(
        \uut_master/n41 ), .B2(\uut_master/n357 ), .ZN(\uut_master/n358 ) );
  OAI21_X1 \uut_master/U336  ( .B1(\uut_master/n58 ), .B2(\uut_master/n124 ), 
        .A(\uut_master/n356 ), .ZN(\uut_master/N143 ) );
  AOI22_X1 \uut_master/U335  ( .A1(address[17]), .A2(\uut_master/n163 ), .B1(
        \uut_master/n178 ), .B2(\uut_master/n355 ), .ZN(\uut_master/n356 ) );
  OAI21_X1 \uut_master/U334  ( .B1(\uut_master/n59 ), .B2(\uut_master/n172 ), 
        .A(\uut_master/n354 ), .ZN(\uut_master/N142 ) );
  AOI22_X1 \uut_master/U333  ( .A1(address[16]), .A2(\uut_master/n159 ), .B1(
        \uut_master/n180 ), .B2(\uut_master/n353 ), .ZN(\uut_master/n354 ) );
  OAI21_X1 \uut_master/U332  ( .B1(\uut_master/n60 ), .B2(\uut_master/n172 ), 
        .A(\uut_master/n352 ), .ZN(\uut_master/N141 ) );
  AOI22_X1 \uut_master/U331  ( .A1(address[15]), .A2(\uut_master/n160 ), .B1(
        \uut_master/n6 ), .B2(\uut_master/n351 ), .ZN(\uut_master/n352 ) );
  OAI21_X1 \uut_master/U330  ( .B1(\uut_master/n61 ), .B2(\uut_master/n174 ), 
        .A(\uut_master/n350 ), .ZN(\uut_master/N140 ) );
  AOI22_X1 \uut_master/U329  ( .A1(address[14]), .A2(\uut_master/n156 ), .B1(
        \uut_master/n181 ), .B2(\uut_master/n349 ), .ZN(\uut_master/n350 ) );
  OAI21_X1 \uut_master/U328  ( .B1(\uut_master/n62 ), .B2(\uut_master/n120 ), 
        .A(\uut_master/n348 ), .ZN(\uut_master/N139 ) );
  AOI22_X1 \uut_master/U327  ( .A1(address[13]), .A2(\uut_master/n162 ), .B1(
        \uut_master/n14 ), .B2(\uut_master/n347 ), .ZN(\uut_master/n348 ) );
  OAI21_X1 \uut_master/U326  ( .B1(\uut_master/n63 ), .B2(\uut_master/n172 ), 
        .A(\uut_master/n346 ), .ZN(\uut_master/N138 ) );
  AOI22_X1 \uut_master/U325  ( .A1(address[12]), .A2(\uut_master/n152 ), .B1(
        \uut_master/n178 ), .B2(\uut_master/n345 ), .ZN(\uut_master/n346 ) );
  OAI21_X1 \uut_master/U324  ( .B1(\uut_master/n64 ), .B2(\uut_master/n175 ), 
        .A(\uut_master/n344 ), .ZN(\uut_master/N137 ) );
  AOI22_X1 \uut_master/U323  ( .A1(address[11]), .A2(\uut_master/n165 ), .B1(
        \uut_master/n180 ), .B2(\uut_master/n343 ), .ZN(\uut_master/n344 ) );
  OAI21_X1 \uut_master/U322  ( .B1(\uut_master/n65 ), .B2(\uut_master/n8 ), 
        .A(\uut_master/n342 ), .ZN(\uut_master/N136 ) );
  AOI22_X1 \uut_master/U321  ( .A1(address[10]), .A2(\uut_master/n151 ), .B1(
        \uut_master/n41 ), .B2(\uut_master/n341 ), .ZN(\uut_master/n342 ) );
  OAI21_X1 \uut_master/U320  ( .B1(\uut_master/n66 ), .B2(\uut_master/n124 ), 
        .A(\uut_master/n340 ), .ZN(\uut_master/N135 ) );
  AOI22_X1 \uut_master/U319  ( .A1(address[9]), .A2(\uut_master/n155 ), .B1(
        \uut_master/n15 ), .B2(\uut_master/n339 ), .ZN(\uut_master/n340 ) );
  OAI21_X1 \uut_master/U318  ( .B1(\uut_master/n67 ), .B2(\uut_master/n36 ), 
        .A(\uut_master/n338 ), .ZN(\uut_master/N134 ) );
  AOI22_X1 \uut_master/U317  ( .A1(address[8]), .A2(\uut_master/n155 ), .B1(
        \uut_master/n15 ), .B2(\uut_master/n337 ), .ZN(\uut_master/n338 ) );
  OAI21_X1 \uut_master/U316  ( .B1(\uut_master/n68 ), .B2(\uut_master/n120 ), 
        .A(\uut_master/n336 ), .ZN(\uut_master/N133 ) );
  AOI22_X1 \uut_master/U315  ( .A1(address[7]), .A2(\uut_master/n166 ), .B1(
        \uut_master/n177 ), .B2(\uut_master/n335 ), .ZN(\uut_master/n336 ) );
  OAI21_X1 \uut_master/U314  ( .B1(\uut_master/n69 ), .B2(\uut_master/n174 ), 
        .A(\uut_master/n334 ), .ZN(\uut_master/N132 ) );
  AOI22_X1 \uut_master/U313  ( .A1(address[6]), .A2(\uut_master/n166 ), .B1(
        \uut_master/n179 ), .B2(\uut_master/n333 ), .ZN(\uut_master/n334 ) );
  OAI21_X1 \uut_master/U312  ( .B1(\uut_master/n70 ), .B2(\uut_master/n172 ), 
        .A(\uut_master/n332 ), .ZN(\uut_master/N131 ) );
  AOI22_X1 \uut_master/U311  ( .A1(address[5]), .A2(\uut_master/n156 ), .B1(
        \uut_master/n13 ), .B2(\uut_master/n331 ), .ZN(\uut_master/n332 ) );
  OAI21_X1 \uut_master/U310  ( .B1(\uut_master/n71 ), .B2(\uut_master/n174 ), 
        .A(\uut_master/n330 ), .ZN(\uut_master/N130 ) );
  AOI22_X1 \uut_master/U309  ( .A1(address[4]), .A2(\uut_master/n162 ), .B1(
        \uut_master/n7 ), .B2(\uut_master/n329 ), .ZN(\uut_master/n330 ) );
  OAI21_X1 \uut_master/U308  ( .B1(\uut_master/n72 ), .B2(\uut_master/n3 ), 
        .A(\uut_master/n328 ), .ZN(\uut_master/N129 ) );
  AOI22_X1 \uut_master/U307  ( .A1(address[3]), .A2(\uut_master/n168 ), .B1(
        \uut_master/n179 ), .B2(\uut_master/n327 ), .ZN(\uut_master/n328 ) );
  OAI21_X1 \uut_master/U306  ( .B1(\uut_master/n73 ), .B2(\uut_master/n8 ), 
        .A(\uut_master/n326 ), .ZN(\uut_master/N128 ) );
  AOI22_X1 \uut_master/U305  ( .A1(address[2]), .A2(\uut_master/n150 ), .B1(
        \uut_master/n177 ), .B2(\uut_master/n325 ), .ZN(\uut_master/n326 ) );
  OAI21_X1 \uut_master/U304  ( .B1(\uut_master/n74 ), .B2(\uut_master/n127 ), 
        .A(\uut_master/n324 ), .ZN(\uut_master/N127 ) );
  AOI22_X1 \uut_master/U303  ( .A1(address[1]), .A2(\uut_master/n162 ), .B1(
        \uut_master/n14 ), .B2(\uut_master/n323 ), .ZN(\uut_master/n324 ) );
  OAI21_X1 \uut_master/U302  ( .B1(\uut_master/n75 ), .B2(\uut_master/n124 ), 
        .A(\uut_master/n322 ), .ZN(\uut_master/N126 ) );
  AOI22_X1 \uut_master/U301  ( .A1(address[0]), .A2(\uut_master/n162 ), .B1(
        \uut_master/n6 ), .B2(\uut_master/n321 ), .ZN(\uut_master/n322 ) );
  OAI221_X1 \uut_master/U300  ( .B1(\uut_master/n75 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n76 ), .C2(\uut_master/n3 ), .A(\uut_master/n320 ), 
        .ZN(\uut_master/N125 ) );
  NAND3_X1 \uut_master/U299  ( .A1(data_in[31]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n147 ), .ZN(\uut_master/n320 ) );
  OAI221_X1 \uut_master/U298  ( .B1(\uut_master/n76 ), .B2(\uut_master/n28 ), 
        .C1(\uut_master/n77 ), .C2(\uut_master/n172 ), .A(\uut_master/n319 ), 
        .ZN(\uut_master/N124 ) );
  NAND3_X1 \uut_master/U297  ( .A1(data_in[30]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n165 ), .ZN(\uut_master/n319 ) );
  OAI221_X1 \uut_master/U296  ( .B1(\uut_master/n77 ), .B2(\uut_master/n28 ), 
        .C1(\uut_master/n3 ), .C2(\uut_master/n78 ), .A(\uut_master/n318 ), 
        .ZN(\uut_master/N123 ) );
  NAND3_X1 \uut_master/U295  ( .A1(data_in[29]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n153 ), .ZN(\uut_master/n318 ) );
  OAI221_X1 \uut_master/U294  ( .B1(\uut_master/n78 ), .B2(\uut_master/n28 ), 
        .C1(\uut_master/n128 ), .C2(\uut_master/n79 ), .A(\uut_master/n317 ), 
        .ZN(\uut_master/N122 ) );
  NAND3_X1 \uut_master/U293  ( .A1(data_in[28]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n147 ), .ZN(\uut_master/n317 ) );
  OAI221_X1 \uut_master/U292  ( .B1(\uut_master/n79 ), .B2(\uut_master/n28 ), 
        .C1(\uut_master/n36 ), .C2(\uut_master/n80 ), .A(\uut_master/n316 ), 
        .ZN(\uut_master/N121 ) );
  NAND3_X1 \uut_master/U291  ( .A1(data_in[27]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n169 ), .ZN(\uut_master/n316 ) );
  OAI221_X1 \uut_master/U290  ( .B1(\uut_master/n80 ), .B2(\uut_master/n28 ), 
        .C1(\uut_master/n81 ), .C2(\uut_master/n172 ), .A(\uut_master/n315 ), 
        .ZN(\uut_master/N120 ) );
  NAND3_X1 \uut_master/U289  ( .A1(data_in[26]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n158 ), .ZN(\uut_master/n315 ) );
  OAI221_X1 \uut_master/U288  ( .B1(\uut_master/n81 ), .B2(\uut_master/n34 ), 
        .C1(\uut_master/n82 ), .C2(\uut_master/n123 ), .A(\uut_master/n314 ), 
        .ZN(\uut_master/N119 ) );
  NAND3_X1 \uut_master/U287  ( .A1(data_in[25]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n157 ), .ZN(\uut_master/n314 ) );
  OAI221_X1 \uut_master/U286  ( .B1(\uut_master/n82 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n83 ), .C2(\uut_master/n128 ), .A(\uut_master/n313 ), 
        .ZN(\uut_master/N118 ) );
  NAND3_X1 \uut_master/U285  ( .A1(data_in[24]), .A2(\uut_master/n187 ), .A3(
        \uut_master/n188 ), .ZN(\uut_master/n313 ) );
  OAI221_X1 \uut_master/U284  ( .B1(\uut_master/n83 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n84 ), .C2(\uut_master/n8 ), .A(\uut_master/n312 ), 
        .ZN(\uut_master/N117 ) );
  NAND3_X1 \uut_master/U283  ( .A1(data_in[23]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n146 ), .ZN(\uut_master/n312 ) );
  OAI221_X1 \uut_master/U282  ( .B1(\uut_master/n84 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n85 ), .C2(\uut_master/n8 ), .A(\uut_master/n311 ), 
        .ZN(\uut_master/N116 ) );
  NAND3_X1 \uut_master/U281  ( .A1(data_in[22]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n146 ), .ZN(\uut_master/n311 ) );
  OAI221_X1 \uut_master/U280  ( .B1(\uut_master/n85 ), .B2(\uut_master/n176 ), 
        .C1(\uut_master/n86 ), .C2(\uut_master/n8 ), .A(\uut_master/n310 ), 
        .ZN(\uut_master/N115 ) );
  NAND3_X1 \uut_master/U279  ( .A1(data_in[21]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n145 ), .ZN(\uut_master/n310 ) );
  OAI221_X1 \uut_master/U278  ( .B1(\uut_master/n86 ), .B2(\uut_master/n32 ), 
        .C1(\uut_master/n87 ), .C2(\uut_master/n8 ), .A(\uut_master/n309 ), 
        .ZN(\uut_master/N114 ) );
  NAND3_X1 \uut_master/U277  ( .A1(data_in[20]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n188 ), .ZN(\uut_master/n309 ) );
  OAI221_X1 \uut_master/U276  ( .B1(\uut_master/n87 ), .B2(\uut_master/n32 ), 
        .C1(\uut_master/n88 ), .C2(\uut_master/n8 ), .A(\uut_master/n308 ), 
        .ZN(\uut_master/N113 ) );
  NAND3_X1 \uut_master/U275  ( .A1(data_in[19]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n145 ), .ZN(\uut_master/n308 ) );
  OAI221_X1 \uut_master/U274  ( .B1(\uut_master/n88 ), .B2(\uut_master/n176 ), 
        .C1(\uut_master/n89 ), .C2(\uut_master/n172 ), .A(\uut_master/n307 ), 
        .ZN(\uut_master/N112 ) );
  NAND3_X1 \uut_master/U273  ( .A1(data_in[18]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n152 ), .ZN(\uut_master/n307 ) );
  OAI221_X1 \uut_master/U272  ( .B1(\uut_master/n32 ), .B2(\uut_master/n89 ), 
        .C1(\uut_master/n90 ), .C2(\uut_master/n128 ), .A(\uut_master/n306 ), 
        .ZN(\uut_master/N111 ) );
  NAND3_X1 \uut_master/U271  ( .A1(data_in[17]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n188 ), .ZN(\uut_master/n306 ) );
  OAI221_X1 \uut_master/U270  ( .B1(\uut_master/n90 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n36 ), .C2(\uut_master/n91 ), .A(\uut_master/n305 ), 
        .ZN(\uut_master/N110 ) );
  NAND3_X1 \uut_master/U269  ( .A1(data_in[16]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n153 ), .ZN(\uut_master/n305 ) );
  OAI221_X1 \uut_master/U268  ( .B1(\uut_master/n91 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n92 ), .C2(\uut_master/n36 ), .A(\uut_master/n304 ), 
        .ZN(\uut_master/N109 ) );
  NAND3_X1 \uut_master/U267  ( .A1(data_in[15]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n151 ), .ZN(\uut_master/n304 ) );
  OAI221_X1 \uut_master/U266  ( .B1(\uut_master/n92 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n93 ), .C2(\uut_master/n123 ), .A(\uut_master/n303 ), 
        .ZN(\uut_master/N108 ) );
  NAND3_X1 \uut_master/U265  ( .A1(data_in[14]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n160 ), .ZN(\uut_master/n303 ) );
  OAI221_X1 \uut_master/U264  ( .B1(\uut_master/n93 ), .B2(\uut_master/n176 ), 
        .C1(\uut_master/n5 ), .C2(\uut_master/n94 ), .A(\uut_master/n302 ), 
        .ZN(\uut_master/N107 ) );
  NAND3_X1 \uut_master/U263  ( .A1(data_in[13]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n145 ), .ZN(\uut_master/n302 ) );
  OAI221_X1 \uut_master/U262  ( .B1(\uut_master/n94 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n175 ), .C2(\uut_master/n95 ), .A(\uut_master/n301 ), 
        .ZN(\uut_master/N106 ) );
  NAND3_X1 \uut_master/U261  ( .A1(data_in[12]), .A2(\uut_master/n186 ), .A3(
        \uut_master/n147 ), .ZN(\uut_master/n301 ) );
  OAI221_X1 \uut_master/U260  ( .B1(\uut_master/n95 ), .B2(\uut_master/n34 ), 
        .C1(\uut_master/n96 ), .C2(\uut_master/n123 ), .A(\uut_master/n300 ), 
        .ZN(\uut_master/N105 ) );
  NAND3_X1 \uut_master/U259  ( .A1(data_in[11]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n160 ), .ZN(\uut_master/n300 ) );
  OAI221_X1 \uut_master/U258  ( .B1(\uut_master/n96 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n97 ), .C2(\uut_master/n124 ), .A(\uut_master/n299 ), 
        .ZN(\uut_master/N104 ) );
  NAND3_X1 \uut_master/U257  ( .A1(data_in[10]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n159 ), .ZN(\uut_master/n299 ) );
  OAI221_X1 \uut_master/U256  ( .B1(\uut_master/n97 ), .B2(\uut_master/n34 ), 
        .C1(\uut_master/n98 ), .C2(\uut_master/n127 ), .A(\uut_master/n298 ), 
        .ZN(\uut_master/N103 ) );
  NAND3_X1 \uut_master/U255  ( .A1(data_in[9]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n150 ), .ZN(\uut_master/n298 ) );
  OAI221_X1 \uut_master/U254  ( .B1(\uut_master/n98 ), .B2(\uut_master/n34 ), 
        .C1(\uut_master/n99 ), .C2(\uut_master/n175 ), .A(\uut_master/n297 ), 
        .ZN(\uut_master/N102 ) );
  NAND3_X1 \uut_master/U253  ( .A1(data_in[8]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n158 ), .ZN(\uut_master/n297 ) );
  OAI221_X1 \uut_master/U252  ( .B1(\uut_master/n99 ), .B2(\uut_master/n34 ), 
        .C1(\uut_master/n100 ), .C2(\uut_master/n172 ), .A(\uut_master/n296 ), 
        .ZN(\uut_master/N101 ) );
  NAND3_X1 \uut_master/U251  ( .A1(data_in[7]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n157 ), .ZN(\uut_master/n296 ) );
  OAI221_X1 \uut_master/U250  ( .B1(\uut_master/n100 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n124 ), .C2(\uut_master/n101 ), .A(\uut_master/n295 ), 
        .ZN(\uut_master/N100 ) );
  NAND3_X1 \uut_master/U249  ( .A1(data_in[6]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n168 ), .ZN(\uut_master/n295 ) );
  OAI221_X1 \uut_master/U248  ( .B1(\uut_master/n101 ), .B2(\uut_master/n34 ), 
        .C1(\uut_master/n102 ), .C2(\uut_master/n123 ), .A(\uut_master/n294 ), 
        .ZN(\uut_master/N99 ) );
  NAND3_X1 \uut_master/U247  ( .A1(data_in[5]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n148 ), .ZN(\uut_master/n294 ) );
  OAI221_X1 \uut_master/U246  ( .B1(\uut_master/n102 ), .B2(\uut_master/n176 ), 
        .C1(\uut_master/n103 ), .C2(\uut_master/n127 ), .A(\uut_master/n293 ), 
        .ZN(\uut_master/N98 ) );
  NAND3_X1 \uut_master/U245  ( .A1(data_in[4]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n168 ), .ZN(\uut_master/n293 ) );
  OAI221_X1 \uut_master/U244  ( .B1(\uut_master/n32 ), .B2(\uut_master/n103 ), 
        .C1(\uut_master/n104 ), .C2(\uut_master/n5 ), .A(\uut_master/n292 ), 
        .ZN(\uut_master/N97 ) );
  NAND3_X1 \uut_master/U243  ( .A1(data_in[3]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n169 ), .ZN(\uut_master/n292 ) );
  OAI221_X1 \uut_master/U242  ( .B1(\uut_master/n32 ), .B2(\uut_master/n104 ), 
        .C1(\uut_master/n105 ), .C2(\uut_master/n5 ), .A(\uut_master/n291 ), 
        .ZN(\uut_master/N96 ) );
  NAND3_X1 \uut_master/U241  ( .A1(data_in[2]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n169 ), .ZN(\uut_master/n291 ) );
  OAI221_X1 \uut_master/U240  ( .B1(\uut_master/n105 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n106 ), .C2(\uut_master/n174 ), .A(\uut_master/n290 ), 
        .ZN(\uut_master/N95 ) );
  NAND3_X1 \uut_master/U239  ( .A1(data_in[1]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n148 ), .ZN(\uut_master/n290 ) );
  NAND2_X1 \uut_master/U238  ( .A1(\uut_master/n288 ), .A2(\uut_master/n289 ), 
        .ZN(\uut_master/n428 ) );
  NAND2_X1 \uut_master/U237  ( .A1(\uut_master/data_save_shifted [1]), .A2(
        \uut_master/n13 ), .ZN(\uut_master/n288 ) );
  NAND3_X1 \uut_master/U236  ( .A1(data_in[0]), .A2(\uut_master/n185 ), .A3(
        \uut_master/n188 ), .ZN(\uut_master/n289 ) );
  NOR4_X1 \uut_master/U235  ( .A1(command[6]), .A2(command[7]), .A3(command[4]), .A4(command[5]), .ZN(\uut_master/n284 ) );
  NOR4_X1 \uut_master/U234  ( .A1(command[2]), .A2(command[3]), .A3(command[0]), .A4(command[1]), .ZN(\uut_master/n285 ) );
  OAI21_X1 \uut_master/U233  ( .B1(\uut_master/n135 ), .B2(\uut_master/n283 ), 
        .A(\uut_master/n282 ), .ZN(\uut_master/n427 ) );
  NAND3_X1 \uut_master/U232  ( .A1(data_out[30]), .A2(\uut_master/n112 ), .A3(
        \uut_master/n190 ), .ZN(\uut_master/n282 ) );
  OAI21_X1 \uut_master/U231  ( .B1(\uut_master/n136 ), .B2(\uut_master/n281 ), 
        .A(\uut_master/n280 ), .ZN(\uut_master/n426 ) );
  NAND3_X1 \uut_master/U230  ( .A1(data_out[29]), .A2(\uut_master/n113 ), .A3(
        \uut_master/n1 ), .ZN(\uut_master/n280 ) );
  OAI21_X1 \uut_master/U229  ( .B1(\uut_master/n23 ), .B2(\uut_master/n279 ), 
        .A(\uut_master/n278 ), .ZN(\uut_master/n425 ) );
  NAND3_X1 \uut_master/U228  ( .A1(\uut_master/n12 ), .A2(\uut_master/n113 ), 
        .A3(data_out[28]), .ZN(\uut_master/n278 ) );
  OAI21_X1 \uut_master/U227  ( .B1(\uut_master/n140 ), .B2(\uut_master/n277 ), 
        .A(\uut_master/n276 ), .ZN(\uut_master/n424 ) );
  NAND3_X1 \uut_master/U226  ( .A1(\uut_master/n4 ), .A2(\uut_master/n110 ), 
        .A3(data_out[27]), .ZN(\uut_master/n276 ) );
  OAI21_X1 \uut_master/U225  ( .B1(\uut_master/n137 ), .B2(\uut_master/n275 ), 
        .A(\uut_master/n274 ), .ZN(\uut_master/n423 ) );
  NAND3_X1 \uut_master/U224  ( .A1(data_out[26]), .A2(\uut_master/n112 ), .A3(
        \uut_master/n126 ), .ZN(\uut_master/n274 ) );
  OAI21_X1 \uut_master/U223  ( .B1(\uut_master/n137 ), .B2(\uut_master/n273 ), 
        .A(\uut_master/n272 ), .ZN(\uut_master/n422 ) );
  NAND3_X1 \uut_master/U222  ( .A1(data_out[25]), .A2(\uut_master/n110 ), .A3(
        \uut_master/n25 ), .ZN(\uut_master/n272 ) );
  OAI21_X1 \uut_master/U221  ( .B1(\uut_master/n137 ), .B2(\uut_master/n271 ), 
        .A(\uut_master/n270 ), .ZN(\uut_master/n421 ) );
  NAND3_X1 \uut_master/U220  ( .A1(data_out[24]), .A2(\uut_master/n110 ), .A3(
        \uut_master/n12 ), .ZN(\uut_master/n270 ) );
  OAI21_X1 \uut_master/U219  ( .B1(\uut_master/n135 ), .B2(\uut_master/n269 ), 
        .A(\uut_master/n268 ), .ZN(\uut_master/n420 ) );
  NAND3_X1 \uut_master/U218  ( .A1(data_out[23]), .A2(\uut_master/n112 ), .A3(
        \uut_master/n190 ), .ZN(\uut_master/n268 ) );
  OAI21_X1 \uut_master/U217  ( .B1(\uut_master/n23 ), .B2(\uut_master/n267 ), 
        .A(\uut_master/n266 ), .ZN(\uut_master/n419 ) );
  OAI21_X1 \uut_master/U216  ( .B1(\uut_master/n139 ), .B2(\uut_master/n265 ), 
        .A(\uut_master/n264 ), .ZN(\uut_master/n418 ) );
  NAND3_X1 \uut_master/U215  ( .A1(data_out[21]), .A2(\uut_master/n112 ), .A3(
        \uut_master/n1 ), .ZN(\uut_master/n264 ) );
  OAI21_X1 \uut_master/U214  ( .B1(\uut_master/n23 ), .B2(\uut_master/n263 ), 
        .A(\uut_master/n262 ), .ZN(\uut_master/n417 ) );
  NAND3_X1 \uut_master/U213  ( .A1(\uut_master/n4 ), .A2(\uut_master/n113 ), 
        .A3(data_out[20]), .ZN(\uut_master/n262 ) );
  OAI21_X1 \uut_master/U212  ( .B1(\uut_master/n137 ), .B2(\uut_master/n261 ), 
        .A(\uut_master/n260 ), .ZN(\uut_master/n416 ) );
  NAND3_X1 \uut_master/U211  ( .A1(data_out[19]), .A2(\uut_master/n112 ), .A3(
        \uut_master/n2 ), .ZN(\uut_master/n260 ) );
  OAI21_X1 \uut_master/U210  ( .B1(\uut_master/n137 ), .B2(\uut_master/n259 ), 
        .A(\uut_master/n258 ), .ZN(\uut_master/n415 ) );
  NAND3_X1 \uut_master/U209  ( .A1(\uut_master/n17 ), .A2(\uut_master/n112 ), 
        .A3(data_out[18]), .ZN(\uut_master/n258 ) );
  OAI21_X1 \uut_master/U208  ( .B1(\uut_master/n136 ), .B2(\uut_master/n257 ), 
        .A(\uut_master/n256 ), .ZN(\uut_master/n414 ) );
  NAND3_X1 \uut_master/U207  ( .A1(\uut_master/n26 ), .A2(\uut_master/n112 ), 
        .A3(data_out[17]), .ZN(\uut_master/n256 ) );
  OAI21_X1 \uut_master/U206  ( .B1(\uut_master/n135 ), .B2(\uut_master/n255 ), 
        .A(\uut_master/n254 ), .ZN(\uut_master/n413 ) );
  NAND3_X1 \uut_master/U205  ( .A1(data_out[16]), .A2(\uut_master/n113 ), .A3(
        \uut_master/n26 ), .ZN(\uut_master/n254 ) );
  OAI21_X1 \uut_master/U204  ( .B1(\uut_master/n135 ), .B2(\uut_master/n253 ), 
        .A(\uut_master/n252 ), .ZN(\uut_master/n412 ) );
  NAND3_X1 \uut_master/U203  ( .A1(\uut_master/n25 ), .A2(\uut_master/n110 ), 
        .A3(data_out[15]), .ZN(\uut_master/n252 ) );
  OAI21_X1 \uut_master/U202  ( .B1(\uut_master/n135 ), .B2(\uut_master/n251 ), 
        .A(\uut_master/n250 ), .ZN(\uut_master/n411 ) );
  NAND3_X1 \uut_master/U201  ( .A1(\uut_master/n25 ), .A2(\uut_master/n110 ), 
        .A3(data_out[14]), .ZN(\uut_master/n250 ) );
  OAI21_X1 \uut_master/U200  ( .B1(\uut_master/n23 ), .B2(\uut_master/n249 ), 
        .A(\uut_master/n248 ), .ZN(\uut_master/n410 ) );
  NAND3_X1 \uut_master/U199  ( .A1(data_out[13]), .A2(\uut_master/n113 ), .A3(
        \uut_master/n17 ), .ZN(\uut_master/n248 ) );
  OAI21_X1 \uut_master/U198  ( .B1(\uut_master/n139 ), .B2(\uut_master/n247 ), 
        .A(\uut_master/n246 ), .ZN(\uut_master/n409 ) );
  NAND3_X1 \uut_master/U197  ( .A1(data_out[12]), .A2(\uut_master/n110 ), .A3(
        \uut_master/n2 ), .ZN(\uut_master/n246 ) );
  OAI21_X1 \uut_master/U196  ( .B1(\uut_master/n140 ), .B2(\uut_master/n245 ), 
        .A(\uut_master/n244 ), .ZN(\uut_master/n408 ) );
  NAND3_X1 \uut_master/U195  ( .A1(\uut_master/n126 ), .A2(\uut_master/n110 ), 
        .A3(data_out[11]), .ZN(\uut_master/n244 ) );
  OAI21_X1 \uut_master/U194  ( .B1(\uut_master/n136 ), .B2(\uut_master/n243 ), 
        .A(\uut_master/n242 ), .ZN(\uut_master/n407 ) );
  NAND3_X1 \uut_master/U193  ( .A1(data_out[10]), .A2(\uut_master/n113 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n242 ) );
  OAI21_X1 \uut_master/U192  ( .B1(\uut_master/n137 ), .B2(\uut_master/n241 ), 
        .A(\uut_master/n240 ), .ZN(\uut_master/n406 ) );
  NAND3_X1 \uut_master/U191  ( .A1(data_out[9]), .A2(\uut_master/n113 ), .A3(
        \uut_master/n126 ), .ZN(\uut_master/n240 ) );
  OAI21_X1 \uut_master/U190  ( .B1(\uut_master/n137 ), .B2(\uut_master/n239 ), 
        .A(\uut_master/n238 ), .ZN(\uut_master/n405 ) );
  NAND3_X1 \uut_master/U189  ( .A1(data_out[8]), .A2(\uut_master/n112 ), .A3(
        \uut_master/n27 ), .ZN(\uut_master/n238 ) );
  OAI21_X1 \uut_master/U188  ( .B1(\uut_master/n135 ), .B2(\uut_master/n237 ), 
        .A(\uut_master/n236 ), .ZN(\uut_master/n404 ) );
  NAND3_X1 \uut_master/U187  ( .A1(data_out[7]), .A2(\uut_master/n113 ), .A3(
        \uut_master/n24 ), .ZN(\uut_master/n236 ) );
  OAI21_X1 \uut_master/U186  ( .B1(\uut_master/n135 ), .B2(\uut_master/n235 ), 
        .A(\uut_master/n234 ), .ZN(\uut_master/n403 ) );
  NAND3_X1 \uut_master/U185  ( .A1(data_out[6]), .A2(\uut_master/n110 ), .A3(
        \uut_master/n1 ), .ZN(\uut_master/n234 ) );
  OAI21_X1 \uut_master/U184  ( .B1(\uut_master/n135 ), .B2(\uut_master/n233 ), 
        .A(\uut_master/n232 ), .ZN(\uut_master/n402 ) );
  NAND3_X1 \uut_master/U183  ( .A1(data_out[5]), .A2(\uut_master/n110 ), .A3(
        \uut_master/n2 ), .ZN(\uut_master/n232 ) );
  OAI21_X1 \uut_master/U182  ( .B1(\uut_master/n23 ), .B2(\uut_master/n231 ), 
        .A(\uut_master/n230 ), .ZN(\uut_master/n401 ) );
  NAND3_X1 \uut_master/U181  ( .A1(data_out[4]), .A2(\uut_master/n113 ), .A3(
        \uut_master/n27 ), .ZN(\uut_master/n230 ) );
  OAI21_X1 \uut_master/U180  ( .B1(\uut_master/n136 ), .B2(\uut_master/n229 ), 
        .A(\uut_master/n228 ), .ZN(\uut_master/n400 ) );
  NAND3_X1 \uut_master/U179  ( .A1(data_out[3]), .A2(\uut_master/n112 ), .A3(
        \uut_master/n190 ), .ZN(\uut_master/n228 ) );
  OAI21_X1 \uut_master/U178  ( .B1(\uut_master/n135 ), .B2(\uut_master/n227 ), 
        .A(\uut_master/n226 ), .ZN(\uut_master/n399 ) );
  NAND3_X1 \uut_master/U177  ( .A1(data_out[2]), .A2(\uut_master/n110 ), .A3(
        \uut_master/n17 ), .ZN(\uut_master/n226 ) );
  OAI21_X1 \uut_master/U176  ( .B1(\uut_master/n135 ), .B2(\uut_master/n225 ), 
        .A(\uut_master/n224 ), .ZN(\uut_master/n398 ) );
  OAI21_X1 \uut_master/U175  ( .B1(\uut_master/n135 ), .B2(\uut_master/n223 ), 
        .A(\uut_master/n222 ), .ZN(\uut_master/n397 ) );
  OAI21_X1 \uut_master/U174  ( .B1(\uut_master/n23 ), .B2(\uut_master/n221 ), 
        .A(\uut_master/n220 ), .ZN(\uut_master/n388 ) );
  NAND3_X1 \uut_master/U173  ( .A1(\uut_master/n24 ), .A2(\uut_master/n112 ), 
        .A3(miso), .ZN(\uut_master/n220 ) );
  OAI22_X1 \uut_master/U172  ( .A1(\uut_master/n218 ), .A2(rst), .B1(
        \uut_master/n217 ), .B2(rst), .ZN(\uut_master/n219 ) );
  NOR3_X1 \uut_master/U171  ( .A1(\uut_master/n216 ), .A2(
        \uut_master/current_state [0]), .A3(\uut_master/n215 ), .ZN(
        \uut_master/n217 ) );
  INV_X1 \uut_master/U170  ( .A(\uut_master/n132 ), .ZN(\uut_master/n218 ) );
  OAI33_X1 \uut_master/U169  ( .A1(\uut_master/n127 ), .A2(\uut_master/n213 ), 
        .A3(\uut_master/n212 ), .B1(\uut_master/n191 ), .B2(\uut_master/n129 ), 
        .B3(\uut_master/n215 ), .ZN(\uut_master/N163 ) );
  XOR2_X1 \uut_master/U168  ( .A(\uut_master/n211 ), .B(
        \uut_master/data_count [5]), .Z(\uut_master/n212 ) );
  NAND2_X1 \uut_master/U167  ( .A1(\uut_master/data_count [4]), .A2(
        \uut_master/n116 ), .ZN(\uut_master/n211 ) );
  INV_X1 \uut_master/U166  ( .A(\uut_master/n210 ), .ZN(\uut_master/n213 ) );
  OAI22_X1 \uut_master/U165  ( .A1(\uut_master/n109 ), .A2(\uut_master/n44 ), 
        .B1(\uut_master/n214 ), .B2(\uut_master/current_state [0]), .ZN(
        \uut_master/n209 ) );
  OAI21_X1 \uut_master/U164  ( .B1(\uut_master/n45 ), .B2(\uut_master/n176 ), 
        .A(\uut_master/n208 ), .ZN(\uut_master/N162 ) );
  NAND3_X1 \uut_master/U163  ( .A1(\uut_master/n207 ), .A2(\uut_master/n210 ), 
        .A3(\uut_master/n121 ), .ZN(\uut_master/n208 ) );
  XOR2_X1 \uut_master/U162  ( .A(\uut_master/data_count [4]), .B(
        \uut_master/n116 ), .Z(\uut_master/n207 ) );
  OAI21_X1 \uut_master/U161  ( .B1(\uut_master/n46 ), .B2(\uut_master/n28 ), 
        .A(\uut_master/n206 ), .ZN(\uut_master/N161 ) );
  NAND3_X1 \uut_master/U160  ( .A1(\uut_master/n205 ), .A2(\uut_master/n210 ), 
        .A3(\uut_master/n122 ), .ZN(\uut_master/n206 ) );
  XOR2_X1 \uut_master/U159  ( .A(\uut_master/n193 ), .B(\uut_master/n204 ), 
        .Z(\uut_master/n205 ) );
  NOR2_X1 \uut_master/U158  ( .A1(\uut_master/n203 ), .A2(\uut_master/n202 ), 
        .ZN(\uut_master/n204 ) );
  OAI21_X1 \uut_master/U157  ( .B1(\uut_master/n202 ), .B2(\uut_master/n34 ), 
        .A(\uut_master/n201 ), .ZN(\uut_master/N160 ) );
  NAND3_X1 \uut_master/U156  ( .A1(\uut_master/n200 ), .A2(\uut_master/n210 ), 
        .A3(\uut_master/n121 ), .ZN(\uut_master/n201 ) );
  OAI22_X1 \uut_master/U155  ( .A1(\uut_master/n199 ), .A2(\uut_master/n3 ), 
        .B1(\uut_master/n48 ), .B2(\uut_master/n176 ), .ZN(\uut_master/N159 )
         );
  XOR2_X1 \uut_master/U154  ( .A(\uut_master/n198 ), .B(
        \uut_master/data_count [1]), .Z(\uut_master/n199 ) );
  OAI22_X1 \uut_master/U153  ( .A1(\uut_master/n36 ), .A2(
        \uut_master/data_count [0]), .B1(\uut_master/n198 ), .B2(
        \uut_master/n34 ), .ZN(\uut_master/N158 ) );
  NOR2_X1 \uut_master/U152  ( .A1(\uut_master/n11 ), .A2(\uut_master/n33 ), 
        .ZN(\uut_master/N17 ) );
  OAI21_X1 \uut_master/U151  ( .B1(\uut_master/n39 ), .B2(\uut_master/n9 ), 
        .A(\uut_master/n286 ), .ZN(cs) );
  AOI21_X1 \uut_master/U150  ( .B1(\uut_master/n196 ), .B2(\uut_master/n197 ), 
        .A(rst), .ZN(\uut_master/N288 ) );
  NAND2_X1 \uut_master/U149  ( .A1(\uut_master/n50 ), .A2(\uut_master/n37 ), 
        .ZN(\uut_master/n196 ) );
  NOR3_X1 \uut_master/U148  ( .A1(\uut_master/n195 ), .A2(\uut_master/n118 ), 
        .A3(\uut_master/n43 ), .ZN(\uut_master/N287 ) );
  NAND2_X1 \uut_master/U147  ( .A1(enable), .A2(\uut_master/n286 ), .ZN(
        \uut_master/n195 ) );
  NOR2_X1 \uut_master/U146  ( .A1(\uut_master/n128 ), .A2(\uut_master/n210 ), 
        .ZN(\uut_master/N164 ) );
  NAND3_X1 \uut_master/U145  ( .A1(\uut_master/n192 ), .A2(\uut_master/n193 ), 
        .A3(\uut_master/n194 ), .ZN(\uut_master/n210 ) );
  NOR3_X1 \uut_master/U144  ( .A1(\uut_master/n203 ), .A2(\uut_master/n215 ), 
        .A3(\uut_master/n45 ), .ZN(\uut_master/n192 ) );
  NAND2_X1 \uut_master/U143  ( .A1(\uut_master/data_count [1]), .A2(
        \uut_master/data_count [0]), .ZN(\uut_master/n203 ) );
  OAI211_X1 \uut_master/U142  ( .C1(\uut_master/n132 ), .C2(\uut_master/n18 ), 
        .A(\uut_master/n386 ), .B(\uut_master/n286 ), .ZN(\uut_master/n383 )
         );
  INV_X1 \uut_master/U141  ( .A(\uut_master/n287 ), .ZN(\uut_master/n386 ) );
  NAND2_X1 \uut_master/U140  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n131 ), .ZN(\uut_master/n287 ) );
  NAND2_X1 \uut_master/U139  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n50 ), .ZN(\uut_master/n214 ) );
  NAND2_X1 \uut_master/U138  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n286 ), .ZN(\uut_master/n216 ) );
  INV_X1 \uut_master/U137  ( .A(rst), .ZN(\uut_master/n286 ) );
  NAND2_X1 \uut_master/U136  ( .A1(\uut_master/n40 ), .A2(\uut_master/n209 ), 
        .ZN(sck) );
  INV_X1 \uut_master/U135  ( .A(\uut_master/n22 ), .ZN(\uut_master/n181 ) );
  INV_X1 \uut_master/U134  ( .A(\uut_master/n115 ), .ZN(\uut_master/n180 ) );
  INV_X1 \uut_master/U133  ( .A(\uut_master/n21 ), .ZN(\uut_master/n179 ) );
  INV_X1 \uut_master/U132  ( .A(\uut_master/n21 ), .ZN(\uut_master/n178 ) );
  INV_X1 \uut_master/U131  ( .A(\uut_master/n22 ), .ZN(\uut_master/n177 ) );
  INV_X1 \uut_master/U130  ( .A(\uut_master/n170 ), .ZN(\uut_master/n175 ) );
  INV_X1 \uut_master/U129  ( .A(\uut_master/n383 ), .ZN(\uut_master/n171 ) );
  INV_X1 \uut_master/U128  ( .A(\uut_master/n167 ), .ZN(\uut_master/n169 ) );
  INV_X1 \uut_master/U127  ( .A(\uut_master/n167 ), .ZN(\uut_master/n168 ) );
  INV_X1 \uut_master/U126  ( .A(\uut_master/n30 ), .ZN(\uut_master/n167 ) );
  INV_X1 \uut_master/U125  ( .A(\uut_master/n164 ), .ZN(\uut_master/n166 ) );
  INV_X1 \uut_master/U124  ( .A(\uut_master/n164 ), .ZN(\uut_master/n165 ) );
  INV_X1 \uut_master/U123  ( .A(\uut_master/n30 ), .ZN(\uut_master/n164 ) );
  INV_X1 \uut_master/U122  ( .A(\uut_master/n161 ), .ZN(\uut_master/n163 ) );
  INV_X1 \uut_master/U121  ( .A(\uut_master/n161 ), .ZN(\uut_master/n162 ) );
  INV_X1 \uut_master/U120  ( .A(\uut_master/n30 ), .ZN(\uut_master/n161 ) );
  INV_X1 \uut_master/U119  ( .A(\uut_master/n143 ), .ZN(\uut_master/n160 ) );
  INV_X1 \uut_master/U118  ( .A(\uut_master/n141 ), .ZN(\uut_master/n159 ) );
  INV_X1 \uut_master/U117  ( .A(\uut_master/n154 ), .ZN(\uut_master/n158 ) );
  INV_X1 \uut_master/U116  ( .A(\uut_master/n154 ), .ZN(\uut_master/n157 ) );
  INV_X1 \uut_master/U115  ( .A(\uut_master/n144 ), .ZN(\uut_master/n156 ) );
  INV_X1 \uut_master/U114  ( .A(\uut_master/n144 ), .ZN(\uut_master/n155 ) );
  INV_X1 \uut_master/U113  ( .A(\uut_master/n30 ), .ZN(\uut_master/n154 ) );
  INV_X1 \uut_master/U112  ( .A(\uut_master/n141 ), .ZN(\uut_master/n153 ) );
  INV_X1 \uut_master/U111  ( .A(\uut_master/n149 ), .ZN(\uut_master/n152 ) );
  INV_X1 \uut_master/U110  ( .A(\uut_master/n149 ), .ZN(\uut_master/n151 ) );
  INV_X1 \uut_master/U109  ( .A(\uut_master/n149 ), .ZN(\uut_master/n150 ) );
  INV_X1 \uut_master/U108  ( .A(\uut_master/n30 ), .ZN(\uut_master/n149 ) );
  INV_X1 \uut_master/U107  ( .A(\uut_master/n125 ), .ZN(\uut_master/n148 ) );
  INV_X1 \uut_master/U106  ( .A(\uut_master/n142 ), .ZN(\uut_master/n147 ) );
  INV_X1 \uut_master/U105  ( .A(\uut_master/n141 ), .ZN(\uut_master/n146 ) );
  INV_X1 \uut_master/U104  ( .A(\uut_master/n143 ), .ZN(\uut_master/n145 ) );
  INV_X1 \uut_master/U103  ( .A(\uut_master/n30 ), .ZN(\uut_master/n143 ) );
  INV_X1 \uut_master/U102  ( .A(\uut_master/n30 ), .ZN(\uut_master/n142 ) );
  INV_X1 \uut_master/U101  ( .A(\uut_master/n30 ), .ZN(\uut_master/n141 ) );
  INV_X1 \uut_master/U100  ( .A(\uut_master/n138 ), .ZN(\uut_master/n140 ) );
  INV_X1 \uut_master/U99  ( .A(\uut_master/n138 ), .ZN(\uut_master/n139 ) );
  INV_X1 \uut_master/U98  ( .A(\uut_master/n133 ), .ZN(\uut_master/n138 ) );
  INV_X1 \uut_master/U97  ( .A(\uut_master/n219 ), .ZN(\uut_master/n134 ) );
  INV_X1 \uut_master/U96  ( .A(\uut_master/n219 ), .ZN(\uut_master/n133 ) );
  NAND2_X1 \uut_master/U95  ( .A1(\uut_master/n130 ), .A2(\uut_master/n360 ), 
        .ZN(\uut_master/N145 ) );
  OR2_X1 \uut_master/U94  ( .A1(\uut_master/n127 ), .A2(\uut_master/n56 ), 
        .ZN(\uut_master/n130 ) );
  INV_X1 \uut_master/U93  ( .A(\uut_master/n37 ), .ZN(\uut_master/n129 ) );
  INV_X1 \uut_master/U92  ( .A(\uut_master/n171 ), .ZN(\uut_master/n128 ) );
  INV_X1 \uut_master/U91  ( .A(\uut_master/n171 ), .ZN(\uut_master/n127 ) );
  INV_X1 \uut_master/U90  ( .A(\uut_master/n49 ), .ZN(\uut_master/n170 ) );
  INV_X1 \uut_master/U89  ( .A(\uut_master/n30 ), .ZN(\uut_master/n125 ) );
  INV_X1 \uut_master/U88  ( .A(\uut_master/n170 ), .ZN(\uut_master/n124 ) );
  INV_X1 \uut_master/U87  ( .A(\uut_master/n170 ), .ZN(\uut_master/n123 ) );
  INV_X2 \uut_master/U86  ( .A(\uut_master/n107 ), .ZN(\uut_master/n172 ) );
  INV_X1 \uut_master/U85  ( .A(\uut_master/n122 ), .ZN(\uut_master/n120 ) );
  INV_X1 \uut_master/U84  ( .A(\uut_master/n44 ), .ZN(\uut_master/n118 ) );
  AND4_X2 \uut_master/U82  ( .A1(\uut_master/n194 ), .A2(
        \uut_master/data_count [1]), .A3(\uut_master/n193 ), .A4(
        \uut_master/data_count [0]), .ZN(\uut_master/n116 ) );
  XNOR2_X1 \uut_master/U81  ( .A(\uut_master/n194 ), .B(\uut_master/n203 ), 
        .ZN(\uut_master/n200 ) );
  BUF_X1 \uut_master/U80  ( .A(\uut_master/n29 ), .Z(\uut_master/n187 ) );
  BUF_X1 \uut_master/U79  ( .A(\uut_master/n29 ), .Z(\uut_master/n185 ) );
  BUF_X1 \uut_master/U78  ( .A(\uut_master/n29 ), .Z(\uut_master/n186 ) );
  AND2_X1 \uut_master/U77  ( .A1(\uut_master/n19 ), .A2(
        \uut_master/data_count [5]), .ZN(\uut_master/n114 ) );
  BUF_X2 \uut_master/U76  ( .A(\uut_master/n114 ), .Z(\uut_master/n110 ) );
  BUF_X2 \uut_master/U75  ( .A(\uut_master/n114 ), .Z(\uut_master/n112 ) );
  BUF_X2 \uut_master/U74  ( .A(\uut_master/n114 ), .Z(\uut_master/n113 ) );
  OR3_X2 \uut_master/U73  ( .A1(\uut_master/n108 ), .A2(\uut_master/n182 ), 
        .A3(rst), .ZN(\uut_master/n115 ) );
  OR2_X1 \uut_master/U72  ( .A1(\uut_master/n184 ), .A2(\uut_master/n183 ), 
        .ZN(\uut_master/n108 ) );
  INV_X1 \uut_master/U71  ( .A(\uut_master/n49 ), .ZN(\uut_master/n107 ) );
  OAI211_X1 \uut_master/U70  ( .C1(\uut_master/n132 ), .C2(\uut_master/n18 ), 
        .A(\uut_master/n386 ), .B(\uut_master/n286 ), .ZN(\uut_master/n49 ) );
  INV_X1 \uut_master/U69  ( .A(\uut_master/n191 ), .ZN(\uut_master/n47 ) );
  BUF_X1 \uut_master/U68  ( .A(\uut_master/n131 ), .Z(\uut_master/n44 ) );
  CLKBUF_X1 \uut_master/U67  ( .A(\uut_master/current_state [1]), .Z(
        \uut_master/n109 ) );
  INV_X1 \uut_master/U66  ( .A(\uut_master/n111 ), .ZN(\uut_master/n43 ) );
  INV_X1 \uut_master/U65  ( .A(\uut_master/n19 ), .ZN(\uut_master/n42 ) );
  INV_X1 \uut_master/U64  ( .A(\uut_master/n115 ), .ZN(\uut_master/n41 ) );
  AND2_X1 \uut_master/U63  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n286 ), .ZN(\uut_master/n40 ) );
  BUF_X2 \uut_master/U62  ( .A(\uut_master/n133 ), .Z(\uut_master/n135 ) );
  BUF_X1 \uut_master/U61  ( .A(\uut_master/n214 ), .Z(\uut_master/n132 ) );
  INV_X1 \uut_master/U60  ( .A(\uut_master/n42 ), .ZN(\uut_master/n39 ) );
  NAND3_X1 \uut_master/U59  ( .A1(\uut_master/n27 ), .A2(data_out[0]), .A3(
        \uut_master/n20 ), .ZN(\uut_master/n222 ) );
  NAND3_X1 \uut_master/U58  ( .A1(\uut_master/n47 ), .A2(data_out[22]), .A3(
        \uut_master/n20 ), .ZN(\uut_master/n266 ) );
  NAND3_X1 \uut_master/U57  ( .A1(\uut_master/n12 ), .A2(data_out[1]), .A3(
        \uut_master/n20 ), .ZN(\uut_master/n224 ) );
  INV_X1 \uut_master/U56  ( .A(\uut_master/n42 ), .ZN(\uut_master/n37 ) );
  INV_X1 \uut_master/U55  ( .A(\uut_master/n170 ), .ZN(\uut_master/n174 ) );
  INV_X1 \uut_master/U54  ( .A(\uut_master/n170 ), .ZN(\uut_master/n36 ) );
  BUF_X1 \uut_master/U53  ( .A(\uut_master/n171 ), .Z(\uut_master/n122 ) );
  OR4_X2 \uut_master/U52  ( .A1(\uut_master/n38 ), .A2(\uut_master/n183 ), 
        .A3(rst), .A4(\uut_master/n184 ), .ZN(\uut_master/n35 ) );
  OR4_X2 \uut_master/U51  ( .A1(\uut_master/n38 ), .A2(\uut_master/n183 ), 
        .A3(rst), .A4(\uut_master/n184 ), .ZN(\uut_master/n34 ) );
  OAI21_X1 \uut_master/U50  ( .B1(\uut_master/n9 ), .B2(\uut_master/n39 ), .A(
        \uut_master/n286 ), .ZN(\uut_master/n33 ) );
  INV_X1 \uut_master/U49  ( .A(\uut_master/n30 ), .ZN(\uut_master/n144 ) );
  OR4_X2 \uut_master/U48  ( .A1(\uut_master/n38 ), .A2(\uut_master/n183 ), 
        .A3(rst), .A4(\uut_master/n184 ), .ZN(\uut_master/n32 ) );
  CLKBUF_X1 \uut_master/U47  ( .A(\uut_master/n30 ), .Z(\uut_master/n188 ) );
  INV_X1 \uut_master/U46  ( .A(\uut_master/n163 ), .ZN(\uut_master/n31 ) );
  AND2_X2 \uut_master/U45  ( .A1(\uut_master/n287 ), .A2(\uut_master/n286 ), 
        .ZN(\uut_master/n30 ) );
  BUF_X1 \uut_master/U44  ( .A(\uut_master/n171 ), .Z(\uut_master/n121 ) );
  OR4_X2 \uut_master/U43  ( .A1(\uut_master/n38 ), .A2(\uut_master/n183 ), 
        .A3(rst), .A4(\uut_master/n184 ), .ZN(\uut_master/n176 ) );
  AND2_X1 \uut_master/U42  ( .A1(\uut_master/n285 ), .A2(\uut_master/n284 ), 
        .ZN(\uut_master/n29 ) );
  OR4_X2 \uut_master/U41  ( .A1(\uut_master/n182 ), .A2(\uut_master/n183 ), 
        .A3(rst), .A4(\uut_master/n184 ), .ZN(\uut_master/n28 ) );
  BUF_X1 \uut_master/U40  ( .A(sck), .Z(\uut_master/n119 ) );
  INV_X1 \uut_master/U39  ( .A(\uut_master/n119 ), .ZN(\uut_master/n27 ) );
  INV_X1 \uut_master/U38  ( .A(\uut_master/n191 ), .ZN(\uut_master/n26 ) );
  INV_X1 \uut_master/U37  ( .A(\uut_master/n119 ), .ZN(\uut_master/n25 ) );
  INV_X1 \uut_master/U36  ( .A(\uut_master/n191 ), .ZN(\uut_master/n24 ) );
  BUF_X1 \uut_master/U35  ( .A(sck), .Z(\uut_master/n189 ) );
  OR2_X2 \uut_master/U34  ( .A1(\uut_master/n111 ), .A2(
        \uut_master/current_state [0]), .ZN(\uut_master/n182 ) );
  OR3_X2 \uut_master/U33  ( .A1(\uut_master/n108 ), .A2(\uut_master/n182 ), 
        .A3(rst), .ZN(\uut_master/n22 ) );
  OR3_X2 \uut_master/U32  ( .A1(\uut_master/n108 ), .A2(\uut_master/n182 ), 
        .A3(rst), .ZN(\uut_master/n21 ) );
  BUF_X1 \uut_master/U31  ( .A(\uut_master/n114 ), .Z(\uut_master/n20 ) );
  INV_X1 \uut_master/U30  ( .A(\uut_master/n287 ), .ZN(\uut_master/n19 ) );
  INV_X1 \uut_master/U29  ( .A(\uut_master/n189 ), .ZN(\uut_master/n190 ) );
  BUF_X1 \uut_master/U28  ( .A(sck), .Z(\uut_master/n191 ) );
  BUF_X2 \uut_master/U27  ( .A(\uut_master/n134 ), .Z(\uut_master/n137 ) );
  BUF_X2 \uut_master/U26  ( .A(\uut_master/n134 ), .Z(\uut_master/n23 ) );
  NAND2_X1 \uut_master/U25  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n286 ), .ZN(\uut_master/n18 ) );
  INV_X1 \uut_master/U24  ( .A(\uut_master/n119 ), .ZN(\uut_master/n17 ) );
  INV_X1 \uut_master/U23  ( .A(\uut_master/n189 ), .ZN(\uut_master/n126 ) );
  INV_X1 \uut_master/U22  ( .A(\uut_master/n21 ), .ZN(\uut_master/n16 ) );
  INV_X1 \uut_master/U21  ( .A(\uut_master/n21 ), .ZN(\uut_master/n15 ) );
  INV_X1 \uut_master/U20  ( .A(\uut_master/n22 ), .ZN(\uut_master/n14 ) );
  INV_X1 \uut_master/U19  ( .A(\uut_master/n22 ), .ZN(\uut_master/n13 ) );
  INV_X1 \uut_master/U18  ( .A(\uut_master/n119 ), .ZN(\uut_master/n12 ) );
  CLKBUF_X1 \uut_master/U17  ( .A(\uut_master/clock_count ), .Z(
        \uut_master/n11 ) );
  INV_X1 \uut_master/U16  ( .A(\uut_master/n166 ), .ZN(\uut_master/n10 ) );
  INV_X2 \uut_master/U15  ( .A(\uut_master/n9 ), .ZN(\uut_master/n197 ) );
  AND2_X2 \uut_master/U14  ( .A1(\uut_master/n111 ), .A2(\uut_master/n118 ), 
        .ZN(\uut_master/n9 ) );
  OR2_X1 \uut_master/U13  ( .A1(\uut_master/n111 ), .A2(
        \uut_master/current_state [0]), .ZN(\uut_master/n38 ) );
  INV_X1 \uut_master/U12  ( .A(\uut_master/n107 ), .ZN(\uut_master/n173 ) );
  INV_X2 \uut_master/U11  ( .A(\uut_master/n107 ), .ZN(\uut_master/n8 ) );
  INV_X1 \uut_master/U10  ( .A(\uut_master/n115 ), .ZN(\uut_master/n7 ) );
  INV_X1 \uut_master/U9  ( .A(\uut_master/n115 ), .ZN(\uut_master/n6 ) );
  INV_X1 \uut_master/U8  ( .A(\uut_master/n171 ), .ZN(\uut_master/n5 ) );
  INV_X1 \uut_master/U7  ( .A(\uut_master/n191 ), .ZN(\uut_master/n4 ) );
  INV_X1 \uut_master/U6  ( .A(\uut_master/n170 ), .ZN(\uut_master/n3 ) );
  INV_X1 \uut_master/U5  ( .A(\uut_master/n189 ), .ZN(\uut_master/n2 ) );
  INV_X1 \uut_master/U4  ( .A(\uut_master/n189 ), .ZN(\uut_master/n1 ) );
  BUF_X1 \uut_master/U3  ( .A(\uut_master/n134 ), .Z(\uut_master/n136 ) );
  DFF_X2 \uut_master/data_save_reg[61]  ( .D(\uut_master/n391 ), .CK(clk), 
        .QN(\uut_master/n380 ) );
  DFF_X2 \uut_master/data_in_reg[14]  ( .D(\uut_master/n410 ), .CK(clk), .Q(
        data_out[14]), .QN(\uut_master/n249 ) );
  DFF_X1 \uut_master/data_save_reg[59]  ( .D(\uut_master/n393 ), .CK(clk), 
        .QN(\uut_master/n376 ) );
  DFF_X1 \uut_master/data_save_reg[60]  ( .D(\uut_master/n392 ), .CK(clk), 
        .QN(\uut_master/n378 ) );
  DFF_X1 \uut_master/data_save_reg[57]  ( .D(\uut_master/n395 ), .CK(clk), 
        .QN(\uut_master/n372 ) );
  DFF_X1 \uut_master/data_save_reg[62]  ( .D(\uut_master/n390 ), .CK(clk), 
        .QN(\uut_master/n382 ) );
  DFF_X2 \uut_master/data_in_reg[15]  ( .D(\uut_master/n411 ), .CK(clk), .Q(
        data_out[15]), .QN(\uut_master/n251 ) );
  DFF_X1 \uut_master/data_save_reg[63]  ( .D(\uut_master/n389 ), .CK(clk), .Q(
        \uut_master/data_save[63] ), .QN(\uut_master/n385 ) );
  DFF_X2 \uut_master/data_in_reg[9]  ( .D(\uut_master/n405 ), .CK(clk), .Q(
        data_out[9]), .QN(\uut_master/n239 ) );
  DFF_X2 \uut_master/data_in_reg[0]  ( .D(\uut_master/n388 ), .CK(clk), .Q(
        data_out[0]), .QN(\uut_master/n221 ) );
  DFF_X2 \uut_master/data_in_reg[28]  ( .D(\uut_master/n424 ), .CK(clk), .Q(
        data_out[28]), .QN(\uut_master/n277 ) );
  DFF_X2 \uut_master/data_in_reg[22]  ( .D(\uut_master/n418 ), .CK(clk), .Q(
        data_out[22]), .QN(\uut_master/n265 ) );
  DFF_X2 \uut_master/data_in_reg[4]  ( .D(\uut_master/n400 ), .CK(clk), .Q(
        data_out[4]), .QN(\uut_master/n229 ) );
  DFF_X2 \uut_master/data_in_reg[13]  ( .D(\uut_master/n409 ), .CK(clk), .Q(
        data_out[13]), .QN(\uut_master/n247 ) );
  DFF_X2 \uut_master/data_in_reg[7]  ( .D(\uut_master/n403 ), .CK(clk), .Q(
        data_out[7]), .QN(\uut_master/n235 ) );
  DFF_X2 \uut_master/data_in_reg[6]  ( .D(\uut_master/n402 ), .CK(clk), .Q(
        data_out[6]), .QN(\uut_master/n233 ) );
  DFF_X2 \uut_master/data_in_reg[31]  ( .D(\uut_master/n427 ), .CK(clk), .Q(
        data_out[31]), .QN(\uut_master/n283 ) );
  DFF_X1 \uut_master/data_save_reg[29]  ( .D(\uut_master/N123 ), .CK(clk), 
        .QN(\uut_master/n77 ) );
  DFF_X1 \uut_master/data_save_reg[28]  ( .D(\uut_master/N122 ), .CK(clk), 
        .QN(\uut_master/n78 ) );
  DFF_X1 \uut_master/data_save_reg[55]  ( .D(\uut_master/N149 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [56]), .QN(\uut_master/n51 ) );
  DFF_X1 \uut_master/data_save_reg[18]  ( .D(\uut_master/N112 ), .CK(clk), 
        .QN(\uut_master/n88 ) );
  DFF_X1 \uut_master/data_save_reg[19]  ( .D(\uut_master/N113 ), .CK(clk), 
        .QN(\uut_master/n87 ) );
  DFF_X1 \uut_master/data_save_reg[30]  ( .D(\uut_master/N124 ), .CK(clk), 
        .QN(\uut_master/n76 ) );
  DFF_X2 \uut_master/data_save_reg[17]  ( .D(\uut_master/N111 ), .CK(clk), 
        .QN(\uut_master/n89 ) );
  DFF_X2 \uut_master/data_save_reg[2]  ( .D(\uut_master/N96 ), .CK(clk), .QN(
        \uut_master/n104 ) );
  DFF_X1 \uut_master/data_save_reg[13]  ( .D(\uut_master/N107 ), .CK(clk), 
        .QN(\uut_master/n93 ) );
  DFF_X1 \uut_master/data_save_reg[47]  ( .D(\uut_master/N141 ), .CK(clk), .Q(
        \uut_master/n351 ), .QN(\uut_master/n59 ) );
  DFF_X2 \uut_master/data_save_reg[54]  ( .D(\uut_master/N148 ), .CK(clk), .Q(
        \uut_master/n365 ), .QN(\uut_master/n52 ) );
  DFF_X2 \uut_master/data_save_reg[53]  ( .D(\uut_master/N147 ), .CK(clk), .Q(
        \uut_master/n363 ), .QN(\uut_master/n53 ) );
  DFF_X2 \uut_master/data_save_reg[52]  ( .D(\uut_master/N146 ), .CK(clk), .Q(
        \uut_master/n361 ), .QN(\uut_master/n54 ) );
  DFF_X2 \uut_master/data_save_reg[32]  ( .D(\uut_master/N126 ), .CK(clk), .Q(
        \uut_master/n321 ), .QN(\uut_master/n74 ) );
  DFF_X2 \uut_master/data_save_reg[39]  ( .D(\uut_master/N133 ), .CK(clk), .Q(
        \uut_master/n335 ), .QN(\uut_master/n67 ) );
  DFF_X2 \uut_master/data_save_reg[42]  ( .D(\uut_master/N136 ), .CK(clk), .Q(
        \uut_master/n341 ), .QN(\uut_master/n64 ) );
  DFF_X2 \uut_master/data_save_reg[49]  ( .D(\uut_master/N143 ), .CK(clk), .Q(
        \uut_master/n355 ), .QN(\uut_master/n57 ) );
  DFF_X2 \uut_master/data_save_reg[45]  ( .D(\uut_master/N139 ), .CK(clk), .Q(
        \uut_master/n347 ), .QN(\uut_master/n61 ) );
  DFF_X2 \uut_master/data_save_reg[44]  ( .D(\uut_master/N138 ), .CK(clk), .Q(
        \uut_master/n345 ), .QN(\uut_master/n62 ) );
  DFF_X2 \uut_master/data_save_reg[48]  ( .D(\uut_master/N142 ), .CK(clk), .Q(
        \uut_master/n353 ), .QN(\uut_master/n58 ) );
  DFF_X2 \uut_master/data_save_reg[37]  ( .D(\uut_master/N131 ), .CK(clk), .Q(
        \uut_master/n331 ), .QN(\uut_master/n69 ) );
  DFF_X2 \uut_master/data_save_reg[35]  ( .D(\uut_master/N129 ), .CK(clk), .Q(
        \uut_master/n327 ), .QN(\uut_master/n71 ) );
  DFF_X2 \uut_master/data_save_reg[36]  ( .D(\uut_master/N130 ), .CK(clk), .Q(
        \uut_master/n329 ), .QN(\uut_master/n70 ) );
  DFF_X2 \uut_master/data_save_reg[38]  ( .D(\uut_master/N132 ), .CK(clk), .Q(
        \uut_master/n333 ), .QN(\uut_master/n68 ) );
  DFF_X2 \uut_master/data_save_reg[50]  ( .D(\uut_master/N144 ), .CK(clk), .Q(
        \uut_master/n357 ), .QN(\uut_master/n56 ) );
  DFF_X2 \uut_master/data_save_reg[43]  ( .D(\uut_master/N137 ), .CK(clk), .Q(
        \uut_master/n343 ), .QN(\uut_master/n63 ) );
  DFF_X2 \uut_master/data_save_reg[41]  ( .D(\uut_master/N135 ), .CK(clk), .Q(
        \uut_master/n339 ), .QN(\uut_master/n65 ) );
  DFF_X2 \uut_master/data_save_reg[40]  ( .D(\uut_master/N134 ), .CK(clk), .Q(
        \uut_master/n337 ), .QN(\uut_master/n66 ) );
  DFF_X2 \uut_master/data_save_reg[34]  ( .D(\uut_master/N128 ), .CK(clk), .Q(
        \uut_master/n325 ), .QN(\uut_master/n72 ) );
  DFF_X2 \uut_master/data_save_reg[33]  ( .D(\uut_master/N127 ), .CK(clk), .Q(
        \uut_master/n323 ), .QN(\uut_master/n73 ) );
  DFF_X2 \uut_master/data_save_reg[46]  ( .D(\uut_master/N140 ), .CK(clk), .Q(
        \uut_master/n349 ), .QN(\uut_master/n60 ) );
  DFF_X2 \uut_master/data_in_reg[5]  ( .D(\uut_master/n401 ), .CK(clk), .Q(
        data_out[5]), .QN(\uut_master/n231 ) );
  DFF_X2 \uut_master/data_in_reg[8]  ( .D(\uut_master/n404 ), .CK(clk), .Q(
        data_out[8]), .QN(\uut_master/n237 ) );
  DFF_X2 \uut_master/data_in_reg[10]  ( .D(\uut_master/n406 ), .CK(clk), .Q(
        data_out[10]), .QN(\uut_master/n241 ) );
  DFF_X2 \uut_master/data_in_reg[30]  ( .D(\uut_master/n426 ), .CK(clk), .Q(
        data_out[30]), .QN(\uut_master/n281 ) );
  DFF_X2 \uut_master/data_in_reg[17]  ( .D(\uut_master/n413 ), .CK(clk), .Q(
        data_out[17]), .QN(\uut_master/n255 ) );
  DFF_X2 \uut_master/data_in_reg[11]  ( .D(\uut_master/n407 ), .CK(clk), .Q(
        data_out[11]), .QN(\uut_master/n243 ) );
  DFF_X2 \uut_master/data_in_reg[29]  ( .D(\uut_master/n425 ), .CK(clk), .Q(
        data_out[29]), .QN(\uut_master/n279 ) );
  DFF_X1 \uut_master/data_save_reg[25]  ( .D(\uut_master/N119 ), .CK(clk), 
        .QN(\uut_master/n81 ) );
  DFF_X1 \uut_master/data_save_reg[27]  ( .D(\uut_master/N121 ), .CK(clk), 
        .QN(\uut_master/n79 ) );
  DFF_X1 \uut_master/data_save_reg[1]  ( .D(\uut_master/N95 ), .CK(clk), .QN(
        \uut_master/n105 ) );
  DFF_X1 \uut_master/data_save_reg[11]  ( .D(\uut_master/N105 ), .CK(clk), 
        .QN(\uut_master/n95 ) );
  DFF_X1 \uut_master/data_save_reg[14]  ( .D(\uut_master/N108 ), .CK(clk), 
        .QN(\uut_master/n92 ) );
  DFF_X1 \uut_master/data_save_reg[15]  ( .D(\uut_master/N109 ), .CK(clk), 
        .QN(\uut_master/n91 ) );
  DFF_X1 \uut_master/data_save_reg[16]  ( .D(\uut_master/N110 ), .CK(clk), 
        .QN(\uut_master/n90 ) );
  DFF_X1 \uut_master/data_save_reg[5]  ( .D(\uut_master/N99 ), .CK(clk), .QN(
        \uut_master/n101 ) );
  DFF_X1 \uut_master/data_save_reg[21]  ( .D(\uut_master/N115 ), .CK(clk), 
        .QN(\uut_master/n85 ) );
  DFF_X1 \uut_master/data_save_reg[22]  ( .D(\uut_master/N116 ), .CK(clk), 
        .QN(\uut_master/n84 ) );
  DFF_X1 \uut_master/data_save_reg[23]  ( .D(\uut_master/N117 ), .CK(clk), 
        .QN(\uut_master/n83 ) );
  DFF_X1 \uut_master/data_save_reg[31]  ( .D(\uut_master/N125 ), .CK(clk), 
        .QN(\uut_master/n75 ) );
  DFF_X1 \uut_master/data_save_reg[8]  ( .D(\uut_master/N102 ), .CK(clk), .QN(
        \uut_master/n98 ) );
  DFF_X1 \uut_master/data_save_reg[10]  ( .D(\uut_master/N104 ), .CK(clk), 
        .QN(\uut_master/n96 ) );
  DFF_X1 \uut_master/data_save_reg[12]  ( .D(\uut_master/N106 ), .CK(clk), 
        .QN(\uut_master/n94 ) );
  DFF_X1 \uut_master/data_save_reg[26]  ( .D(\uut_master/N120 ), .CK(clk), 
        .QN(\uut_master/n80 ) );
  DFF_X1 \uut_master/data_save_reg[20]  ( .D(\uut_master/N114 ), .CK(clk), 
        .QN(\uut_master/n86 ) );
  DFF_X1 \uut_master/data_save_reg[4]  ( .D(\uut_master/N98 ), .CK(clk), .QN(
        \uut_master/n102 ) );
  DFF_X1 \uut_master/data_save_reg[7]  ( .D(\uut_master/N101 ), .CK(clk), .QN(
        \uut_master/n99 ) );
  DFF_X1 \uut_master/data_save_reg[9]  ( .D(\uut_master/N103 ), .CK(clk), .QN(
        \uut_master/n97 ) );
  DFF_X1 \uut_master/data_save_reg[24]  ( .D(\uut_master/N118 ), .CK(clk), 
        .QN(\uut_master/n82 ) );
  DFF_X1 \uut_master/data_save_reg[6]  ( .D(\uut_master/N100 ), .CK(clk), .QN(
        \uut_master/n100 ) );
  DFF_X1 \uut_master/data_save_reg[3]  ( .D(\uut_master/N97 ), .CK(clk), .QN(
        \uut_master/n103 ) );
  DFF_X1 \uut_master/data_save_reg[56]  ( .D(\uut_master/n396 ), .CK(clk), 
        .QN(\uut_master/n370 ) );
  DFF_X1 \uut_master/data_save_reg[58]  ( .D(\uut_master/n394 ), .CK(clk), 
        .QN(\uut_master/n374 ) );
  DFF_X2 \uut_master/data_in_reg[19]  ( .D(\uut_master/n415 ), .CK(clk), .Q(
        data_out[19]), .QN(\uut_master/n259 ) );
  DFF_X2 \uut_master/data_in_reg[27]  ( .D(\uut_master/n423 ), .CK(clk), .Q(
        data_out[27]), .QN(\uut_master/n275 ) );
  DFF_X2 \uut_master/data_in_reg[24]  ( .D(\uut_master/n420 ), .CK(clk), .Q(
        data_out[24]), .QN(\uut_master/n269 ) );
  DFF_X2 \uut_master/data_in_reg[26]  ( .D(\uut_master/n422 ), .CK(clk), .Q(
        data_out[26]), .QN(\uut_master/n273 ) );
  DFF_X2 \uut_master/data_in_reg[18]  ( .D(\uut_master/n414 ), .CK(clk), .Q(
        data_out[18]), .QN(\uut_master/n257 ) );
  DFF_X2 \uut_master/data_in_reg[3]  ( .D(\uut_master/n399 ), .CK(clk), .Q(
        data_out[3]), .QN(\uut_master/n227 ) );
  DFF_X2 \uut_master/data_in_reg[20]  ( .D(\uut_master/n416 ), .CK(clk), .Q(
        data_out[20]), .QN(\uut_master/n261 ) );
  DFF_X2 \uut_master/data_in_reg[25]  ( .D(\uut_master/n421 ), .CK(clk), .Q(
        data_out[25]), .QN(\uut_master/n271 ) );
  SDFF_X1 \uut_master/current_state_reg[1]  ( .D(\uut_master/N288 ), .SI(1'b0), 
        .SE(1'b0), .CK(clk), .Q(\uut_master/current_state [1]), .QN(
        \uut_master/n111 ) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n412 ), .CK(clk), .Q(
        data_out[16]), .QN(\uut_master/n253 ) );
  DFF_X1 \uut_master/data_in_reg[1]  ( .D(\uut_master/n397 ), .CK(clk), .Q(
        data_out[1]), .QN(\uut_master/n223 ) );
  DFF_X1 \uut_master/data_in_reg[2]  ( .D(\uut_master/n398 ), .CK(clk), .Q(
        data_out[2]), .QN(\uut_master/n225 ) );
  DFF_X1 \uut_master/data_in_reg[12]  ( .D(\uut_master/n408 ), .CK(clk), .Q(
        data_out[12]), .QN(\uut_master/n245 ) );
  DFF_X1 \uut_master/data_in_reg[21]  ( .D(\uut_master/n417 ), .CK(clk), .Q(
        data_out[21]), .QN(\uut_master/n263 ) );
  DFF_X1 \uut_master/data_in_reg[23]  ( .D(\uut_master/n419 ), .CK(clk), .Q(
        data_out[23]), .QN(\uut_master/n267 ) );
  DFF_X1 \uut_master/data_count_reg[2]  ( .D(\uut_master/N160 ), .CK(clk), .Q(
        \uut_master/n194 ), .QN(\uut_master/n202 ) );
  DFF_X1 \uut_master/data_count_reg[3]  ( .D(\uut_master/N161 ), .CK(clk), .Q(
        \uut_master/n193 ), .QN(\uut_master/n46 ) );
  DFF_X1 \uut_master/data_count_reg[5]  ( .D(\uut_master/N163 ), .CK(clk), .Q(
        \uut_master/data_count [5]), .QN(\uut_master/n215 ) );
  DFF_X1 \uut_master/data_count_reg[0]  ( .D(\uut_master/N158 ), .CK(clk), .Q(
        \uut_master/data_count [0]), .QN(\uut_master/n198 ) );
  DFF_X1 \uut_master/data_count_reg[1]  ( .D(\uut_master/N159 ), .CK(clk), .Q(
        \uut_master/data_count [1]), .QN(\uut_master/n48 ) );
  DFF_X1 \uut_master/data_save_reg[51]  ( .D(\uut_master/N145 ), .CK(clk), .Q(
        \uut_master/n359 ), .QN(\uut_master/n55 ) );
  DFF_X1 \uut_master/data_end_reg  ( .D(\uut_master/N164 ), .CK(clk), .Q(
        \uut_master/n184 ), .QN(\uut_master/n50 ) );
  DFF_X1 \uut_master/clock_count_reg  ( .D(\uut_master/N17 ), .CK(clk), .Q(
        \uut_master/clock_count ), .QN(\uut_master/n183 ) );
  DFF_X1 \uut_master/data_save_reg[0]  ( .D(\uut_master/n428 ), .CK(clk), .Q(
        \uut_master/data_save_shifted [1]), .QN(\uut_master/n106 ) );
  DFF_X1 \uut_master/data_count_reg[4]  ( .D(\uut_master/N162 ), .CK(clk), .Q(
        \uut_master/data_count [4]), .QN(\uut_master/n45 ) );
  DFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/N287 ), .CK(clk), 
        .Q(\uut_master/current_state [0]), .QN(\uut_master/n131 ) );
  INV_X1 \uut_slave/U159  ( .A(\uut_slave/n236 ), .ZN(\uut_slave/n104 ) );
  OAI21_X1 \uut_slave/U158  ( .B1(\uut_slave/n235 ), .B2(\uut_slave/n92 ), .A(
        \uut_slave/n233 ), .ZN(\uut_slave/n236 ) );
  AOI21_X1 \uut_slave/U157  ( .B1(\uut_slave/n232 ), .B2(\uut_slave/n231 ), 
        .A(\uut_slave/n90 ), .ZN(\uut_slave/n235 ) );
  NOR4_X1 \uut_slave/U156  ( .A1(\uut_slave/n234 ), .A2(\uut_slave/n5 ), .A3(
        \uut_slave/n230 ), .A4(\uut_slave/n229 ), .ZN(miso) );
  NAND4_X1 \uut_slave/U155  ( .A1(\uut_slave/command_save [0]), .A2(
        \uut_slave/command_save [2]), .A3(\uut_slave/n4 ), .A4(\uut_slave/n2 ), 
        .ZN(\uut_slave/n229 ) );
  NAND3_X1 \uut_slave/U154  ( .A1(\uut_slave/command_save [7]), .A2(
        \uut_slave/n3 ), .A3(\uut_slave/n228 ), .ZN(\uut_slave/n230 ) );
  AND3_X1 \uut_slave/U153  ( .A1(\uut_slave/command_save [6]), .A2(
        \uut_slave/n6 ), .A3(\uut_slave/command_save [1]), .ZN(
        \uut_slave/n228 ) );
  OAI22_X1 \uut_slave/U152  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n18 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n122 ) );
  OAI22_X1 \uut_slave/U151  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n19 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n123 ) );
  OAI22_X1 \uut_slave/U150  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n20 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n124 ) );
  OAI22_X1 \uut_slave/U149  ( .A1(\uut_slave/n22 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n21 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n125 ) );
  OAI22_X1 \uut_slave/U148  ( .A1(\uut_slave/n23 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n22 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n126 ) );
  OAI222_X1 \uut_slave/U147  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n59 ), .B2(\uut_slave/n100 ), .C1(\uut_slave/n58 ), 
        .C2(\uut_slave/n95 ), .ZN(\uut_slave/n129 ) );
  OAI222_X1 \uut_slave/U146  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n60 ), .B2(\uut_slave/n100 ), .C1(\uut_slave/n59 ), 
        .C2(\uut_slave/n94 ), .ZN(\uut_slave/n130 ) );
  OAI222_X1 \uut_slave/U145  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n61 ), .B2(\uut_slave/n100 ), .C1(\uut_slave/n60 ), 
        .C2(\uut_slave/n94 ), .ZN(\uut_slave/n131 ) );
  OAI222_X1 \uut_slave/U144  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n62 ), .B2(\uut_slave/n100 ), .C1(\uut_slave/n61 ), 
        .C2(\uut_slave/n94 ), .ZN(\uut_slave/n132 ) );
  OAI222_X1 \uut_slave/U143  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n63 ), .B2(\uut_slave/n100 ), .C1(\uut_slave/n62 ), 
        .C2(\uut_slave/n94 ), .ZN(\uut_slave/n133 ) );
  OAI222_X1 \uut_slave/U142  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n64 ), .B2(\uut_slave/n100 ), .C1(\uut_slave/n63 ), 
        .C2(\uut_slave/n94 ), .ZN(\uut_slave/n134 ) );
  OAI222_X1 \uut_slave/U141  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n65 ), .B2(\uut_slave/n100 ), .C1(\uut_slave/n64 ), 
        .C2(\uut_slave/n94 ), .ZN(\uut_slave/n135 ) );
  OAI222_X1 \uut_slave/U140  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n66 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n65 ), .C2(
        \uut_slave/n94 ), .ZN(\uut_slave/n136 ) );
  OAI222_X1 \uut_slave/U139  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n67 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n66 ), .C2(
        \uut_slave/n94 ), .ZN(\uut_slave/n137 ) );
  OAI222_X1 \uut_slave/U138  ( .A1(\uut_slave/n35 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n68 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n67 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n138 ) );
  OAI222_X1 \uut_slave/U137  ( .A1(\uut_slave/n36 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n69 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n68 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n139 ) );
  OAI222_X1 \uut_slave/U136  ( .A1(\uut_slave/n37 ), .A2(\uut_slave/n102 ), 
        .B1(\uut_slave/n70 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n69 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n140 ) );
  OAI222_X1 \uut_slave/U135  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n71 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n70 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n141 ) );
  OAI222_X1 \uut_slave/U134  ( .A1(\uut_slave/n39 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n72 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n71 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n142 ) );
  OAI222_X1 \uut_slave/U133  ( .A1(\uut_slave/n40 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n73 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n72 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n143 ) );
  OAI222_X1 \uut_slave/U132  ( .A1(\uut_slave/n41 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n74 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n73 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n144 ) );
  OAI222_X1 \uut_slave/U131  ( .A1(\uut_slave/n42 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n75 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n74 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n145 ) );
  OAI222_X1 \uut_slave/U130  ( .A1(\uut_slave/n43 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n76 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n75 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n146 ) );
  OAI222_X1 \uut_slave/U129  ( .A1(\uut_slave/n44 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n77 ), .B2(\uut_slave/n99 ), .C1(\uut_slave/n76 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n147 ) );
  OAI222_X1 \uut_slave/U128  ( .A1(\uut_slave/n45 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n78 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n77 ), .C2(
        \uut_slave/n95 ), .ZN(\uut_slave/n148 ) );
  OAI222_X1 \uut_slave/U127  ( .A1(\uut_slave/n46 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n79 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n78 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n149 ) );
  OAI222_X1 \uut_slave/U126  ( .A1(\uut_slave/n47 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n80 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n79 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n150 ) );
  OAI222_X1 \uut_slave/U125  ( .A1(\uut_slave/n48 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n81 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n80 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n151 ) );
  OAI222_X1 \uut_slave/U124  ( .A1(\uut_slave/n49 ), .A2(\uut_slave/n103 ), 
        .B1(\uut_slave/n82 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n81 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n152 ) );
  OAI222_X1 \uut_slave/U123  ( .A1(\uut_slave/n50 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n83 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n82 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n153 ) );
  OAI222_X1 \uut_slave/U122  ( .A1(\uut_slave/n51 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n84 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n83 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n154 ) );
  OAI222_X1 \uut_slave/U121  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n85 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n84 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n155 ) );
  OAI222_X1 \uut_slave/U120  ( .A1(\uut_slave/n53 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n86 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n85 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n156 ) );
  OAI222_X1 \uut_slave/U119  ( .A1(\uut_slave/n54 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n87 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n86 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n157 ) );
  OAI222_X1 \uut_slave/U118  ( .A1(\uut_slave/n55 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n88 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n87 ), .C2(
        \uut_slave/n96 ), .ZN(\uut_slave/n158 ) );
  OAI222_X1 \uut_slave/U117  ( .A1(\uut_slave/n56 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n89 ), .B2(\uut_slave/n98 ), .C1(\uut_slave/n88 ), .C2(
        \uut_slave/n94 ), .ZN(\uut_slave/n159 ) );
  NAND3_X1 \uut_slave/U116  ( .A1(\uut_slave/n223 ), .A2(\uut_slave/n237 ), 
        .A3(\uut_slave/n94 ), .ZN(\uut_slave/n225 ) );
  OAI22_X1 \uut_slave/U115  ( .A1(\uut_slave/n57 ), .A2(\uut_slave/n106 ), 
        .B1(\uut_slave/n89 ), .B2(\uut_slave/n94 ), .ZN(\uut_slave/n160 ) );
  NAND3_X1 \uut_slave/U114  ( .A1(\uut_slave/n222 ), .A2(\uut_slave/n237 ), 
        .A3(\uut_slave/n94 ), .ZN(\uut_slave/n226 ) );
  OAI21_X1 \uut_slave/U113  ( .B1(\uut_slave/n221 ), .B2(\uut_slave/n220 ), 
        .A(\uut_slave/n237 ), .ZN(\uut_slave/n224 ) );
  AOI21_X1 \uut_slave/U112  ( .B1(\uut_slave/data_count [5]), .B2(
        \uut_slave/n219 ), .A(\uut_slave/n222 ), .ZN(\uut_slave/n221 ) );
  NAND3_X1 \uut_slave/U111  ( .A1(\uut_slave/n218 ), .A2(\uut_slave/n217 ), 
        .A3(\uut_slave/n216 ), .ZN(\uut_slave/n219 ) );
  INV_X1 \uut_slave/U110  ( .A(\uut_slave/n215 ), .ZN(\uut_slave/n216 ) );
  INV_X1 \uut_slave/U109  ( .A(\uut_slave/n223 ), .ZN(\uut_slave/n222 ) );
  NAND2_X1 \uut_slave/U108  ( .A1(\uut_slave/n90 ), .A2(\uut_slave/n215 ), 
        .ZN(\uut_slave/n223 ) );
  NAND2_X1 \uut_slave/U107  ( .A1(\uut_slave/n214 ), .A2(\uut_slave/n213 ), 
        .ZN(\uut_slave/n215 ) );
  INV_X1 \uut_slave/U106  ( .A(\uut_slave/n232 ), .ZN(\uut_slave/n218 ) );
  OAI22_X1 \uut_slave/U105  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n23 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n127 ) );
  OAI22_X1 \uut_slave/U104  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n24 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n128 ) );
  OAI22_X1 \uut_slave/U103  ( .A1(\uut_slave/n238 ), .A2(\uut_slave/n227 ), 
        .B1(\uut_slave/n25 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n193 ) );
  NAND2_X1 \uut_slave/U102  ( .A1(\uut_slave/n16 ), .A2(\uut_slave/n237 ), 
        .ZN(\uut_slave/n227 ) );
  NAND2_X1 \uut_slave/U101  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n237 ), 
        .ZN(\uut_slave/n233 ) );
  NAND2_X1 \uut_slave/U100  ( .A1(\uut_slave/current_state[1] ), .A2(
        \uut_slave/n208 ), .ZN(\uut_slave/n220 ) );
  OAI21_X1 \uut_slave/U99  ( .B1(\uut_slave/data_count [5]), .B2(
        \uut_slave/n232 ), .A(\uut_slave/n211 ), .ZN(\uut_slave/n212 ) );
  NAND2_X1 \uut_slave/U98  ( .A1(\uut_slave/n210 ), .A2(\uut_slave/n209 ), 
        .ZN(\uut_slave/n232 ) );
  NOR3_X1 \uut_slave/U97  ( .A1(\uut_slave/n7 ), .A2(\uut_slave/n206 ), .A3(
        \uut_slave/n92 ), .ZN(\uut_slave/N32 ) );
  OAI33_X1 \uut_slave/U96  ( .A1(\uut_slave/n205 ), .A2(\uut_slave/n7 ), .A3(
        \uut_slave/n204 ), .B1(\uut_slave/n13 ), .B2(\uut_slave/n5 ), .B3(
        \uut_slave/n92 ), .ZN(\uut_slave/n194 ) );
  OAI33_X1 \uut_slave/U95  ( .A1(\uut_slave/n13 ), .A2(\uut_slave/n209 ), .A3(
        \uut_slave/n92 ), .B1(\uut_slave/n116 ), .B2(\uut_slave/n204 ), .B3(
        \uut_slave/n203 ), .ZN(\uut_slave/n195 ) );
  OAI33_X1 \uut_slave/U94  ( .A1(\uut_slave/n115 ), .A2(\uut_slave/n210 ), 
        .A3(\uut_slave/n92 ), .B1(\uut_slave/n116 ), .B2(\uut_slave/n202 ), 
        .B3(\uut_slave/n204 ), .ZN(\uut_slave/n196 ) );
  XOR2_X1 \uut_slave/U93  ( .A(\uut_slave/n201 ), .B(\uut_slave/data_count [3]), .Z(\uut_slave/n202 ) );
  NAND2_X1 \uut_slave/U92  ( .A1(\uut_slave/data_count [2]), .A2(
        \uut_slave/n10 ), .ZN(\uut_slave/n201 ) );
  OAI33_X1 \uut_slave/U91  ( .A1(\uut_slave/n115 ), .A2(\uut_slave/n213 ), 
        .A3(\uut_slave/n92 ), .B1(\uut_slave/n116 ), .B2(\uut_slave/n204 ), 
        .B3(\uut_slave/n200 ), .ZN(\uut_slave/n197 ) );
  XOR2_X1 \uut_slave/U90  ( .A(\uut_slave/n121 ), .B(\uut_slave/data_count [2]), .Z(\uut_slave/n200 ) );
  OAI33_X1 \uut_slave/U89  ( .A1(\uut_slave/n115 ), .A2(\uut_slave/n214 ), 
        .A3(\uut_slave/n92 ), .B1(\uut_slave/n7 ), .B2(\uut_slave/n120 ), .B3(
        \uut_slave/n204 ), .ZN(\uut_slave/n198 ) );
  XOR2_X1 \uut_slave/U88  ( .A(\uut_slave/n217 ), .B(\uut_slave/data_count [1]), .Z(\uut_slave/n120 ) );
  OAI33_X1 \uut_slave/U87  ( .A1(\uut_slave/n115 ), .A2(\uut_slave/n217 ), 
        .A3(\uut_slave/n92 ), .B1(\uut_slave/n116 ), .B2(
        \uut_slave/data_count [0]), .B3(\uut_slave/n204 ), .ZN(
        \uut_slave/n199 ) );
  NAND2_X1 \uut_slave/U86  ( .A1(\uut_slave/n211 ), .A2(\uut_slave/n206 ), 
        .ZN(\uut_slave/n204 ) );
  NAND2_X1 \uut_slave/U85  ( .A1(\uut_slave/n119 ), .A2(\uut_slave/n10 ), .ZN(
        \uut_slave/n206 ) );
  NAND2_X1 \uut_slave/U84  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n121 ) );
  NOR4_X1 \uut_slave/U83  ( .A1(\uut_slave/n231 ), .A2(\uut_slave/n209 ), .A3(
        \uut_slave/n213 ), .A4(\uut_slave/n210 ), .ZN(\uut_slave/n119 ) );
  INV_X1 \uut_slave/U82  ( .A(\uut_slave/data_count [5]), .ZN(\uut_slave/n231 ) );
  INV_X1 \uut_slave/U81  ( .A(\uut_slave/n234 ), .ZN(\uut_slave/n211 ) );
  NAND2_X1 \uut_slave/U80  ( .A1(\uut_slave/n118 ), .A2(\uut_slave/n92 ), .ZN(
        \uut_slave/N166 ) );
  OAI21_X1 \uut_slave/U79  ( .B1(\uut_slave/current_state[1] ), .B2(
        \uut_slave/n208 ), .A(\uut_slave/n14 ), .ZN(\uut_slave/n118 ) );
  INV_X1 \uut_slave/U78  ( .A(rst), .ZN(\uut_slave/n237 ) );
  INV_X1 \uut_slave/U77  ( .A(sck), .ZN(\uut_slave/n117 ) );
  INV_X1 \uut_slave/U76  ( .A(\uut_slave/n1 ), .ZN(\uut_slave/n93 ) );
  NAND3_X1 \uut_slave/U75  ( .A1(\uut_slave/n208 ), .A2(\uut_slave/n237 ), 
        .A3(\uut_slave/current_state[1] ), .ZN(\uut_slave/n234 ) );
  INV_X1 \uut_slave/U74  ( .A(\uut_slave/n211 ), .ZN(\uut_slave/n92 ) );
  XOR2_X1 \uut_slave/U73  ( .A(\uut_slave/n15 ), .B(\uut_slave/n209 ), .Z(
        \uut_slave/n203 ) );
  INV_X1 \uut_slave/U72  ( .A(mosi), .ZN(\uut_slave/n238 ) );
  AND2_X1 \uut_slave/U71  ( .A1(\uut_slave/n5 ), .A2(\uut_slave/n218 ), .ZN(
        \uut_slave/n90 ) );
  AND2_X1 \uut_slave/U70  ( .A1(\uut_slave/n212 ), .A2(\uut_slave/n233 ), .ZN(
        \uut_slave/n16 ) );
  OAI22_X1 \uut_slave/U69  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n57 ), .B1(
        \uut_slave/n111 ), .B2(\uut_slave/n238 ), .ZN(\uut_slave/n192 ) );
  OAI22_X1 \uut_slave/U68  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n56 ), .B1(
        \uut_slave/n57 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n191 ) );
  OAI22_X1 \uut_slave/U67  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n55 ), .B1(
        \uut_slave/n56 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n190 ) );
  OAI22_X1 \uut_slave/U66  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n54 ), .B1(
        \uut_slave/n55 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n189 ) );
  OAI22_X1 \uut_slave/U65  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n53 ), .B1(
        \uut_slave/n54 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n188 ) );
  OAI22_X1 \uut_slave/U64  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n52 ), .B1(
        \uut_slave/n53 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n187 ) );
  OAI22_X1 \uut_slave/U63  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n51 ), .B1(
        \uut_slave/n52 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n186 ) );
  OAI22_X1 \uut_slave/U62  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n50 ), .B1(
        \uut_slave/n51 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n185 ) );
  OAI22_X1 \uut_slave/U61  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n49 ), .B1(
        \uut_slave/n50 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n184 ) );
  OAI22_X1 \uut_slave/U60  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n48 ), .B1(
        \uut_slave/n49 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n183 ) );
  OAI22_X1 \uut_slave/U59  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n47 ), .B1(
        \uut_slave/n48 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n182 ) );
  OAI22_X1 \uut_slave/U58  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n46 ), .B1(
        \uut_slave/n47 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n181 ) );
  OAI22_X1 \uut_slave/U57  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n45 ), .B1(
        \uut_slave/n46 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n180 ) );
  OAI22_X1 \uut_slave/U56  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n44 ), .B1(
        \uut_slave/n45 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n179 ) );
  OAI22_X1 \uut_slave/U55  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n43 ), .B1(
        \uut_slave/n44 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n178 ) );
  OAI22_X1 \uut_slave/U54  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n42 ), .B1(
        \uut_slave/n43 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n177 ) );
  OAI22_X1 \uut_slave/U53  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n41 ), .B1(
        \uut_slave/n42 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n176 ) );
  OAI22_X1 \uut_slave/U52  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n40 ), .B1(
        \uut_slave/n41 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n175 ) );
  OAI22_X1 \uut_slave/U51  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n39 ), .B1(
        \uut_slave/n40 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n174 ) );
  OAI22_X1 \uut_slave/U50  ( .A1(\uut_slave/n113 ), .A2(\uut_slave/n38 ), .B1(
        \uut_slave/n39 ), .B2(\uut_slave/n110 ), .ZN(\uut_slave/n173 ) );
  OAI22_X1 \uut_slave/U49  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n37 ), .B1(
        \uut_slave/n38 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n172 ) );
  OAI22_X1 \uut_slave/U48  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n36 ), .B1(
        \uut_slave/n37 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n171 ) );
  OAI22_X1 \uut_slave/U47  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n35 ), .B1(
        \uut_slave/n36 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n170 ) );
  OAI22_X1 \uut_slave/U46  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n34 ), .B1(
        \uut_slave/n35 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n169 ) );
  OAI22_X1 \uut_slave/U45  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n33 ), .B1(
        \uut_slave/n34 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n168 ) );
  OAI22_X1 \uut_slave/U44  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n32 ), .B1(
        \uut_slave/n33 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n167 ) );
  OAI22_X1 \uut_slave/U43  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n31 ), .B1(
        \uut_slave/n32 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n166 ) );
  OAI22_X1 \uut_slave/U42  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n30 ), .B1(
        \uut_slave/n31 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n165 ) );
  OAI22_X1 \uut_slave/U41  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n29 ), .B1(
        \uut_slave/n30 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n164 ) );
  OAI22_X1 \uut_slave/U40  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n28 ), .B1(
        \uut_slave/n29 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n163 ) );
  OAI22_X1 \uut_slave/U39  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n27 ), .B1(
        \uut_slave/n28 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n162 ) );
  OAI22_X1 \uut_slave/U38  ( .A1(\uut_slave/n112 ), .A2(\uut_slave/n26 ), .B1(
        \uut_slave/n27 ), .B2(\uut_slave/n109 ), .ZN(\uut_slave/n161 ) );
  NOR3_X1 \uut_slave/U37  ( .A1(\uut_slave/n210 ), .A2(\uut_slave/n213 ), .A3(
        \uut_slave/n121 ), .ZN(\uut_slave/n15 ) );
  NOR2_X1 \uut_slave/U36  ( .A1(cs), .A2(rst), .ZN(\uut_slave/n14 ) );
  OAI22_X1 \uut_slave/U35  ( .A1(\uut_slave/n207 ), .A2(\uut_slave/n208 ), 
        .B1(\uut_slave/n17 ), .B2(\uut_slave/n92 ), .ZN(\uut_slave/N165 ) );
  BUF_X1 \uut_slave/U34  ( .A(\uut_slave/n97 ), .Z(\uut_slave/n96 ) );
  BUF_X1 \uut_slave/U33  ( .A(\uut_slave/n97 ), .Z(\uut_slave/n95 ) );
  BUF_X1 \uut_slave/U32  ( .A(\uut_slave/n97 ), .Z(\uut_slave/n94 ) );
  NAND2_X1 \uut_slave/U31  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n237 ), 
        .ZN(\uut_slave/n105 ) );
  BUF_X1 \uut_slave/U30  ( .A(\uut_slave/n101 ), .Z(\uut_slave/n100 ) );
  BUF_X1 \uut_slave/U29  ( .A(\uut_slave/n107 ), .Z(\uut_slave/n106 ) );
  BUF_X1 \uut_slave/U28  ( .A(\uut_slave/n107 ), .Z(\uut_slave/n103 ) );
  BUF_X1 \uut_slave/U27  ( .A(\uut_slave/n107 ), .Z(\uut_slave/n102 ) );
  BUF_X1 \uut_slave/U26  ( .A(\uut_slave/n101 ), .Z(\uut_slave/n98 ) );
  BUF_X1 \uut_slave/U25  ( .A(\uut_slave/n101 ), .Z(\uut_slave/n99 ) );
  BUF_X1 \uut_slave/U24  ( .A(\uut_slave/n108 ), .Z(\uut_slave/n111 ) );
  BUF_X1 \uut_slave/U23  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n114 ) );
  BUF_X1 \uut_slave/U22  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n113 ) );
  BUF_X1 \uut_slave/U21  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n112 ) );
  BUF_X1 \uut_slave/U20  ( .A(\uut_slave/n108 ), .Z(\uut_slave/n110 ) );
  BUF_X1 \uut_slave/U19  ( .A(\uut_slave/n108 ), .Z(\uut_slave/n109 ) );
  INV_X1 \uut_slave/U18  ( .A(\uut_slave/n117 ), .ZN(\uut_slave/n115 ) );
  INV_X1 \uut_slave/U17  ( .A(\uut_slave/n93 ), .ZN(\uut_slave/n91 ) );
  BUF_X1 \uut_slave/U16  ( .A(\uut_slave/n224 ), .Z(\uut_slave/n97 ) );
  BUF_X1 \uut_slave/U15  ( .A(\uut_slave/n105 ), .Z(\uut_slave/n108 ) );
  BUF_X1 \uut_slave/U14  ( .A(\uut_slave/n226 ), .Z(\uut_slave/n107 ) );
  BUF_X1 \uut_slave/U13  ( .A(\uut_slave/n225 ), .Z(\uut_slave/n101 ) );
  INV_X1 \uut_slave/U12  ( .A(\uut_slave/n117 ), .ZN(\uut_slave/n13 ) );
  AND2_X1 \uut_slave/U11  ( .A1(\uut_slave/data_count [4]), .A2(
        \uut_slave/n11 ), .ZN(\uut_slave/n12 ) );
  XOR2_X1 \uut_slave/U10  ( .A(\uut_slave/n12 ), .B(\uut_slave/n5 ), .Z(
        \uut_slave/n205 ) );
  NOR3_X1 \uut_slave/U9  ( .A1(\uut_slave/n210 ), .A2(\uut_slave/n213 ), .A3(
        \uut_slave/n121 ), .ZN(\uut_slave/n11 ) );
  AND2_X1 \uut_slave/U8  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n10 ) );
  OR2_X1 \uut_slave/U7  ( .A1(rst), .A2(\uut_slave/n9 ), .ZN(\uut_slave/n8 )
         );
  OR2_X1 \uut_slave/U6  ( .A1(cs), .A2(\uut_slave/n8 ), .ZN(\uut_slave/n207 )
         );
  BUF_X1 \uut_slave/U5  ( .A(\uut_slave/n117 ), .Z(\uut_slave/n116 ) );
  CLKBUF_X1 \uut_slave/U4  ( .A(\uut_slave/n115 ), .Z(\uut_slave/n1 ) );
  CLKBUF_X1 \uut_slave/U3  ( .A(\uut_slave/n117 ), .Z(\uut_slave/n7 ) );
  DFF_X1 \uut_slave/command_save_reg[7]  ( .D(\uut_slave/n122 ), .CK(
        \uut_slave/n91 ), .Q(\uut_slave/command_save [7]), .QN(\uut_slave/n18 ) );
  DFF_X2 \uut_slave/command_save_reg[3]  ( .D(\uut_slave/n126 ), .CK(
        \uut_slave/n115 ), .Q(\uut_slave/n6 ), .QN(\uut_slave/n22 ) );
  DFF_X2 \uut_slave/command_save_reg[6]  ( .D(\uut_slave/n123 ), .CK(
        \uut_slave/n115 ), .Q(\uut_slave/command_save [6]), .QN(
        \uut_slave/n19 ) );
  DFF_X2 \uut_slave/command_save_reg[2]  ( .D(\uut_slave/n127 ), .CK(
        \uut_slave/n115 ), .Q(\uut_slave/command_save [2]), .QN(
        \uut_slave/n23 ) );
  DFF_X2 \uut_slave/command_save_reg[5]  ( .D(\uut_slave/n124 ), .CK(
        \uut_slave/n1 ), .Q(\uut_slave/n2 ), .QN(\uut_slave/n20 ) );
  DFF_X2 \uut_slave/command_save_reg[1]  ( .D(\uut_slave/n128 ), .CK(
        \uut_slave/n115 ), .Q(\uut_slave/command_save [1]), .QN(
        \uut_slave/n24 ) );
  DFF_X2 \uut_slave/command_save_reg[4]  ( .D(\uut_slave/n125 ), .CK(
        \uut_slave/n115 ), .Q(\uut_slave/n3 ), .QN(\uut_slave/n21 ) );
  DFF_X2 \uut_slave/command_save_reg[0]  ( .D(\uut_slave/n193 ), .CK(
        \uut_slave/n115 ), .Q(\uut_slave/command_save [0]), .QN(
        \uut_slave/n25 ) );
  DFF_X2 \uut_slave/current_state_reg[0]  ( .D(\uut_slave/N165 ), .CK(clk), 
        .QN(\uut_slave/n208 ) );
  DFF_X1 \uut_slave/data_end_reg  ( .D(\uut_slave/N32 ), .CK(clk), .QN(
        \uut_slave/n17 ) );
  DFF_X1 \uut_slave/data_count_reg[5]  ( .D(\uut_slave/n194 ), .CK(clk), .Q(
        \uut_slave/data_count [5]), .QN(\uut_slave/n5 ) );
  DFF_X1 \uut_slave/data_count_reg[0]  ( .D(\uut_slave/n199 ), .CK(clk), .Q(
        \uut_slave/data_count [0]), .QN(\uut_slave/n217 ) );
  DFF_X1 \uut_slave/data_count_reg[1]  ( .D(\uut_slave/n198 ), .CK(clk), .Q(
        \uut_slave/data_count [1]), .QN(\uut_slave/n214 ) );
  DFF_X1 \uut_slave/data_count_reg[3]  ( .D(\uut_slave/n196 ), .CK(clk), .Q(
        \uut_slave/data_count [3]), .QN(\uut_slave/n210 ) );
  DFF_X1 \uut_slave/data_count_reg[4]  ( .D(\uut_slave/n195 ), .CK(clk), .Q(
        \uut_slave/data_count [4]), .QN(\uut_slave/n209 ) );
  DFF_X1 \uut_slave/data_count_reg[2]  ( .D(\uut_slave/n197 ), .CK(clk), .Q(
        \uut_slave/data_count [2]), .QN(\uut_slave/n213 ) );
  DFF_X1 \uut_slave/data_out_reg[31]  ( .D(\uut_slave/n129 ), .CK(
        \uut_slave/n93 ), .Q(\uut_slave/n4 ), .QN(\uut_slave/n58 ) );
  DFF_X1 \uut_slave/data_out_reg[30]  ( .D(\uut_slave/n130 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n59 ) );
  DFF_X1 \uut_slave/data_out_reg[29]  ( .D(\uut_slave/n131 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n60 ) );
  DFF_X1 \uut_slave/data_out_reg[28]  ( .D(\uut_slave/n132 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n61 ) );
  DFF_X1 \uut_slave/data_out_reg[27]  ( .D(\uut_slave/n133 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n62 ) );
  DFF_X1 \uut_slave/data_out_reg[26]  ( .D(\uut_slave/n134 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n63 ) );
  DFF_X1 \uut_slave/data_out_reg[25]  ( .D(\uut_slave/n135 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n64 ) );
  DFF_X1 \uut_slave/data_out_reg[24]  ( .D(\uut_slave/n136 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n65 ) );
  DFF_X1 \uut_slave/data_out_reg[23]  ( .D(\uut_slave/n137 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n66 ) );
  DFF_X1 \uut_slave/data_out_reg[22]  ( .D(\uut_slave/n138 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n67 ) );
  DFF_X1 \uut_slave/data_out_reg[21]  ( .D(\uut_slave/n139 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n68 ) );
  DFF_X1 \uut_slave/data_out_reg[20]  ( .D(\uut_slave/n140 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n69 ) );
  DFF_X1 \uut_slave/data_out_reg[19]  ( .D(\uut_slave/n141 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n70 ) );
  DFF_X1 \uut_slave/data_out_reg[18]  ( .D(\uut_slave/n142 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n71 ) );
  DFF_X1 \uut_slave/data_out_reg[17]  ( .D(\uut_slave/n143 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n72 ) );
  DFF_X1 \uut_slave/data_out_reg[16]  ( .D(\uut_slave/n144 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n73 ) );
  DFF_X1 \uut_slave/data_out_reg[15]  ( .D(\uut_slave/n145 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n74 ) );
  DFF_X1 \uut_slave/data_out_reg[14]  ( .D(\uut_slave/n146 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n75 ) );
  DFF_X1 \uut_slave/data_out_reg[13]  ( .D(\uut_slave/n147 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n76 ) );
  DFF_X1 \uut_slave/data_out_reg[12]  ( .D(\uut_slave/n148 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n77 ) );
  DFF_X1 \uut_slave/data_out_reg[11]  ( .D(\uut_slave/n149 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n78 ) );
  DFF_X1 \uut_slave/data_out_reg[10]  ( .D(\uut_slave/n150 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n79 ) );
  DFF_X1 \uut_slave/data_out_reg[9]  ( .D(\uut_slave/n151 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n80 ) );
  DFF_X1 \uut_slave/data_out_reg[8]  ( .D(\uut_slave/n152 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n81 ) );
  DFF_X1 \uut_slave/data_out_reg[7]  ( .D(\uut_slave/n153 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n82 ) );
  DFF_X1 \uut_slave/data_out_reg[6]  ( .D(\uut_slave/n154 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n83 ) );
  DFF_X1 \uut_slave/data_out_reg[5]  ( .D(\uut_slave/n155 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n84 ) );
  DFF_X1 \uut_slave/data_out_reg[4]  ( .D(\uut_slave/n156 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n85 ) );
  DFF_X1 \uut_slave/data_out_reg[3]  ( .D(\uut_slave/n157 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n86 ) );
  DFF_X1 \uut_slave/data_out_reg[2]  ( .D(\uut_slave/n158 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n87 ) );
  DFF_X1 \uut_slave/data_out_reg[1]  ( .D(\uut_slave/n159 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n88 ) );
  DFF_X1 \uut_slave/data_out_reg[0]  ( .D(\uut_slave/n160 ), .CK(
        \uut_slave/n93 ), .QN(\uut_slave/n89 ) );
  DFF_X1 \uut_slave/data_save_reg[31]  ( .D(\uut_slave/n161 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n26 ) );
  DFF_X1 \uut_slave/data_save_reg[30]  ( .D(\uut_slave/n162 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n27 ) );
  DFF_X1 \uut_slave/data_save_reg[29]  ( .D(\uut_slave/n163 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n28 ) );
  DFF_X1 \uut_slave/data_save_reg[28]  ( .D(\uut_slave/n164 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n29 ) );
  DFF_X1 \uut_slave/data_save_reg[27]  ( .D(\uut_slave/n165 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n30 ) );
  DFF_X1 \uut_slave/data_save_reg[26]  ( .D(\uut_slave/n166 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n31 ) );
  DFF_X1 \uut_slave/data_save_reg[25]  ( .D(\uut_slave/n167 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n32 ) );
  DFF_X1 \uut_slave/data_save_reg[24]  ( .D(\uut_slave/n168 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n33 ) );
  DFF_X1 \uut_slave/data_save_reg[23]  ( .D(\uut_slave/n169 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n34 ) );
  DFF_X1 \uut_slave/data_save_reg[22]  ( .D(\uut_slave/n170 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n35 ) );
  DFF_X1 \uut_slave/data_save_reg[21]  ( .D(\uut_slave/n171 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n36 ) );
  DFF_X1 \uut_slave/data_save_reg[20]  ( .D(\uut_slave/n172 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n37 ) );
  DFF_X1 \uut_slave/data_save_reg[19]  ( .D(\uut_slave/n173 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n38 ) );
  DFF_X1 \uut_slave/data_save_reg[18]  ( .D(\uut_slave/n174 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n39 ) );
  DFF_X1 \uut_slave/data_save_reg[17]  ( .D(\uut_slave/n175 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n40 ) );
  DFF_X1 \uut_slave/data_save_reg[16]  ( .D(\uut_slave/n176 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n41 ) );
  DFF_X1 \uut_slave/data_save_reg[15]  ( .D(\uut_slave/n177 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n42 ) );
  DFF_X1 \uut_slave/data_save_reg[14]  ( .D(\uut_slave/n178 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n43 ) );
  DFF_X1 \uut_slave/data_save_reg[13]  ( .D(\uut_slave/n179 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n44 ) );
  DFF_X1 \uut_slave/data_save_reg[12]  ( .D(\uut_slave/n180 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n45 ) );
  DFF_X1 \uut_slave/data_save_reg[11]  ( .D(\uut_slave/n181 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n46 ) );
  DFF_X1 \uut_slave/data_save_reg[10]  ( .D(\uut_slave/n182 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n47 ) );
  DFF_X1 \uut_slave/data_save_reg[9]  ( .D(\uut_slave/n183 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n48 ) );
  DFF_X1 \uut_slave/data_save_reg[8]  ( .D(\uut_slave/n184 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n49 ) );
  DFF_X1 \uut_slave/data_save_reg[7]  ( .D(\uut_slave/n185 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n50 ) );
  DFF_X1 \uut_slave/data_save_reg[6]  ( .D(\uut_slave/n186 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n51 ) );
  DFF_X1 \uut_slave/data_save_reg[5]  ( .D(\uut_slave/n187 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n52 ) );
  DFF_X1 \uut_slave/data_save_reg[4]  ( .D(\uut_slave/n188 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n53 ) );
  DFF_X1 \uut_slave/data_save_reg[3]  ( .D(\uut_slave/n189 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n54 ) );
  DFF_X1 \uut_slave/data_save_reg[2]  ( .D(\uut_slave/n190 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n55 ) );
  DFF_X1 \uut_slave/data_save_reg[1]  ( .D(\uut_slave/n191 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n56 ) );
  DFF_X1 \uut_slave/data_save_reg[0]  ( .D(\uut_slave/n192 ), .CK(
        \uut_slave/n91 ), .QN(\uut_slave/n57 ) );
  DFF_X1 \uut_slave/current_state_reg[1]  ( .D(\uut_slave/N166 ), .CK(clk), 
        .Q(\uut_slave/current_state[1] ), .QN(\uut_slave/n9 ) );
endmodule

