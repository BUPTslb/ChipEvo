/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 09:30:12 2026
/////////////////////////////////////////////////////////////


module spi ( clk, rst, addr, we, write_data, re, read_data );
  input [2:0] addr;
  input [31:0] write_data;
  output [31:0] read_data;
  input clk, rst, we, re;
  wire   enable, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, cs, sck, mosi,
         miso, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         \uut_master/n442 , \uut_master/n441 , \uut_master/n440 ,
         \uut_master/n439 , \uut_master/n438 , \uut_master/n437 ,
         \uut_master/n436 , \uut_master/n435 , \uut_master/n434 ,
         \uut_master/n433 , \uut_master/n432 , \uut_master/n431 ,
         \uut_master/n430 , \uut_master/n429 , \uut_master/n428 ,
         \uut_master/n427 , \uut_master/n426 , \uut_master/n425 ,
         \uut_master/n424 , \uut_master/n423 , \uut_master/n422 ,
         \uut_master/n421 , \uut_master/n420 , \uut_master/n419 ,
         \uut_master/n418 , \uut_master/n417 , \uut_master/n416 ,
         \uut_master/n415 , \uut_master/n414 , \uut_master/n413 ,
         \uut_master/n412 , \uut_master/n411 , \uut_master/n410 ,
         \uut_master/n409 , \uut_master/n408 , \uut_master/n407 ,
         \uut_master/n406 , \uut_master/n405 , \uut_master/n404 ,
         \uut_master/n403 , \uut_master/n402 , \uut_master/n401 ,
         \uut_master/n400 , \uut_master/n399 , \uut_master/n398 ,
         \uut_master/n397 , \uut_master/n396 , \uut_master/n395 ,
         \uut_master/n394 , \uut_master/n393 , \uut_master/n392 ,
         \uut_master/n391 , \uut_master/n390 , \uut_master/n389 ,
         \uut_master/n388 , \uut_master/n387 , \uut_master/n386 ,
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
         \uut_master/n117 , \uut_master/n116 , \uut_master/n114 ,
         \uut_master/n113 , \uut_master/n112 , \uut_master/n111 ,
         \uut_master/n110 , \uut_master/n44 , \uut_master/n38 ,
         \uut_master/n37 , \uut_master/n4 , \uut_master/n3 , \uut_master/n2 ,
         \uut_master/n1 , \uut_master/n115 , \uut_master/n109 ,
         \uut_master/n108 , \uut_master/n107 , \uut_master/n106 ,
         \uut_master/n105 , \uut_master/n104 , \uut_master/n103 ,
         \uut_master/n102 , \uut_master/n101 , \uut_master/n100 ,
         \uut_master/n99 , \uut_master/n98 , \uut_master/n97 ,
         \uut_master/n96 , \uut_master/n95 , \uut_master/n94 ,
         \uut_master/n93 , \uut_master/n92 , \uut_master/n91 ,
         \uut_master/n90 , \uut_master/n89 , \uut_master/n88 ,
         \uut_master/n87 , \uut_master/n86 , \uut_master/n85 ,
         \uut_master/n84 , \uut_master/n83 , \uut_master/n82 ,
         \uut_master/n81 , \uut_master/n80 , \uut_master/n79 ,
         \uut_master/n78 , \uut_master/n77 , \uut_master/n76 ,
         \uut_master/n75 , \uut_master/n74 , \uut_master/n73 ,
         \uut_master/n72 , \uut_master/n71 , \uut_master/n70 ,
         \uut_master/n69 , \uut_master/n68 , \uut_master/n67 ,
         \uut_master/n66 , \uut_master/n65 , \uut_master/n64 ,
         \uut_master/n63 , \uut_master/n62 , \uut_master/n61 ,
         \uut_master/n60 , \uut_master/n59 , \uut_master/n58 ,
         \uut_master/n57 , \uut_master/n56 , \uut_master/n55 ,
         \uut_master/n54 , \uut_master/n53 , \uut_master/n52 ,
         \uut_master/n51 , \uut_master/n50 , \uut_master/n49 ,
         \uut_master/n48 , \uut_master/n47 , \uut_master/n46 ,
         \uut_master/n45 , \uut_master/n43 , \uut_master/n42 ,
         \uut_master/n41 , \uut_master/n40 , \uut_master/n39 ,
         \uut_master/n36 , \uut_master/n35 , \uut_master/n34 ,
         \uut_master/n33 , \uut_master/n32 , \uut_master/n31 ,
         \uut_master/n30 , \uut_master/n29 , \uut_master/n28 ,
         \uut_master/n27 , \uut_master/n26 , \uut_master/n25 ,
         \uut_master/n24 , \uut_master/n23 , \uut_master/n22 ,
         \uut_master/n21 , \uut_master/n20 , \uut_master/n19 ,
         \uut_master/n18 , \uut_master/n17 , \uut_master/n16 ,
         \uut_master/n15 , \uut_master/n14 , \uut_master/n13 ,
         \uut_master/n12 , \uut_master/n11 , \uut_master/n10 , \uut_master/n9 ,
         \uut_master/n8 , \uut_master/n7 , \uut_master/n6 , \uut_master/n5 ,
         \uut_master/N349 , \uut_master/N348 , \uut_master/N226 ,
         \uut_master/N225 , \uut_master/N224 , \uut_master/N223 ,
         \uut_master/N222 , \uut_master/N221 , \uut_master/N220 ,
         \uut_master/N219 , \uut_master/N218 , \uut_master/N217 ,
         \uut_master/N216 , \uut_master/N215 , \uut_master/N214 ,
         \uut_master/N213 , \uut_master/N212 , \uut_master/N211 ,
         \uut_master/N210 , \uut_master/N209 , \uut_master/N208 ,
         \uut_master/N207 , \uut_master/N206 , \uut_master/N205 ,
         \uut_master/N204 , \uut_master/N203 , \uut_master/N202 ,
         \uut_master/N201 , \uut_master/N200 , \uut_master/N199 ,
         \uut_master/N198 , \uut_master/N197 , \uut_master/N196 ,
         \uut_master/N195 , \uut_master/N194 , \uut_master/N193 ,
         \uut_master/N192 , \uut_master/N191 , \uut_master/N190 ,
         \uut_master/N189 , \uut_master/N188 , \uut_master/N156 ,
         \uut_master/N17 , \uut_master/clock_count , \uut_master/n443 ,
         \uut_slave/n259 , \uut_slave/n258 , \uut_slave/n257 ,
         \uut_slave/n256 , \uut_slave/n255 , \uut_slave/n254 ,
         \uut_slave/n253 , \uut_slave/n252 , \uut_slave/n251 ,
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
         \uut_slave/n208 , \uut_slave/n207 , \uut_slave/n129 ,
         \uut_slave/n128 , \uut_slave/n127 , \uut_slave/n126 ,
         \uut_slave/n125 , \uut_slave/n124 , \uut_slave/n123 ,
         \uut_slave/n122 , \uut_slave/n121 , \uut_slave/n120 ,
         \uut_slave/n119 , \uut_slave/n118 , \uut_slave/n117 ,
         \uut_slave/n116 , \uut_slave/n115 , \uut_slave/n114 ,
         \uut_slave/n113 , \uut_slave/n112 , \uut_slave/n111 ,
         \uut_slave/n110 , \uut_slave/n109 , \uut_slave/n108 ,
         \uut_slave/n107 , \uut_slave/n106 , \uut_slave/n105 ,
         \uut_slave/n104 , \uut_slave/n101 , \uut_slave/n100 , \uut_slave/n99 ,
         \uut_slave/n98 , \uut_slave/n97 , \uut_slave/n96 , \uut_slave/n95 ,
         \uut_slave/n94 , \uut_slave/n93 , \uut_slave/n92 , \uut_slave/n90 ,
         \uut_slave/n89 , \uut_slave/n88 , \uut_slave/n86 , \uut_slave/n85 ,
         \uut_slave/n11 , \uut_slave/n10 , \uut_slave/n7 , \uut_slave/n6 ,
         \uut_slave/n5 , \uut_slave/n4 , \uut_slave/n3 , \uut_slave/n2 ,
         \uut_slave/n1 , \uut_slave/n206 , \uut_slave/n205 , \uut_slave/n204 ,
         \uut_slave/n203 , \uut_slave/n202 , \uut_slave/n201 ,
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
         \uut_slave/n131 , \uut_slave/n130 , \uut_slave/n103 ,
         \uut_slave/n102 , \uut_slave/n91 , \uut_slave/n87 , \uut_slave/n84 ,
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
         \uut_slave/n19 , \uut_slave/n18 , \uut_slave/n17 , \uut_slave/n16 ,
         \uut_slave/n15 , \uut_slave/n14 , \uut_slave/n13 , \uut_slave/n12 ,
         \uut_slave/n9 , \uut_slave/n8 , \uut_slave/N144 , \uut_slave/N143 ,
         \uut_slave/data_end_next , \uut_slave/current_state[1] ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [2:0] \uut_master/data_count_hi ;
  wire   [2:0] \uut_master/data_count_lo ;
  wire   [1:0] \uut_master/current_state ;
  wire   [7:0] \uut_slave/command_save ;
  wire   [2:0] \uut_slave/data_count_hi ;
  wire   [2:0] \uut_slave/data_count_lo ;

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
  NAND3_X1 U47 ( .A1(n7), .A2(n3), .A3(addr[1]), .ZN(n8) );
  NAND3_X1 U48 ( .A1(n7), .A2(n2), .A3(addr[0]), .ZN(n9) );
  NAND3_X1 U49 ( .A1(n3), .A2(n2), .A3(n7), .ZN(n10) );
  BUF_X1 U50 ( .A(N45), .Z(n25) );
  BUF_X1 U51 ( .A(N62), .Z(n21) );
  BUF_X1 U52 ( .A(N71), .Z(n17) );
  NAND2_X1 U53 ( .A1(n11), .A2(n10), .ZN(N35) );
  BUF_X1 U54 ( .A(n1), .Z(n11) );
  BUF_X1 U55 ( .A(n1), .Z(n12) );
  BUF_X1 U56 ( .A(n17), .Z(n14) );
  BUF_X1 U57 ( .A(n17), .Z(n15) );
  BUF_X1 U58 ( .A(n17), .Z(n16) );
  BUF_X1 U59 ( .A(n25), .Z(n23) );
  BUF_X1 U60 ( .A(n25), .Z(n22) );
  BUF_X1 U61 ( .A(n21), .Z(n19) );
  BUF_X1 U62 ( .A(n21), .Z(n18) );
  BUF_X1 U63 ( .A(n21), .Z(n20) );
  BUF_X1 U64 ( .A(n1), .Z(n13) );
  BUF_X1 U65 ( .A(n25), .Z(n24) );
  NOR2_X1 U66 ( .A1(n4), .A2(addr[2]), .ZN(n7) );
  INV_X1 U67 ( .A(we), .ZN(n4) );
  NAND2_X1 U68 ( .A1(n11), .A2(n9), .ZN(N37) );
  NOR4_X1 U69 ( .A1(n5), .A2(addr[0]), .A3(rst), .A4(addr[1]), .ZN(N71) );
  NAND2_X1 U70 ( .A1(re), .A2(addr[2]), .ZN(n5) );
  AND2_X1 U71 ( .A1(write_data[0]), .A2(n11), .ZN(N36) );
  NAND2_X1 U72 ( .A1(n11), .A2(n8), .ZN(N45) );
  NAND2_X1 U73 ( .A1(n11), .A2(n6), .ZN(N62) );
  INV_X1 U74 ( .A(rst), .ZN(n1) );
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
  INV_X1 U98 ( .A(addr[1]), .ZN(n2) );
  INV_X1 U99 ( .A(addr[0]), .ZN(n3) );
  AND2_X1 U100 ( .A1(write_data[24]), .A2(n12), .ZN(N63) );
  AND2_X1 U101 ( .A1(write_data[25]), .A2(n12), .ZN(N64) );
  AND2_X1 U102 ( .A1(write_data[26]), .A2(n12), .ZN(N65) );
  AND2_X1 U103 ( .A1(write_data[27]), .A2(n12), .ZN(N66) );
  AND2_X1 U104 ( .A1(write_data[28]), .A2(n12), .ZN(N67) );
  AND2_X1 U105 ( .A1(write_data[29]), .A2(n13), .ZN(N68) );
  AND2_X1 U106 ( .A1(write_data[30]), .A2(n13), .ZN(N69) );
  AND2_X1 U107 ( .A1(write_data[31]), .A2(n11), .ZN(N70) );
  NOR2_X1 \uut_master/U327  ( .A1(\uut_master/n46 ), .A2(\uut_master/n138 ), 
        .ZN(mosi) );
  OAI222_X1 \uut_master/U326  ( .A1(\uut_master/n144 ), .A2(\uut_master/n155 ), 
        .B1(\uut_master/n148 ), .B2(\uut_master/n46 ), .C1(\uut_master/n47 ), 
        .C2(\uut_master/n180 ), .ZN(\uut_master/N219 ) );
  OAI222_X1 \uut_master/U325  ( .A1(\uut_master/n144 ), .A2(\uut_master/n408 ), 
        .B1(\uut_master/n148 ), .B2(\uut_master/n47 ), .C1(\uut_master/n48 ), 
        .C2(\uut_master/n180 ), .ZN(\uut_master/N218 ) );
  OAI222_X1 \uut_master/U324  ( .A1(\uut_master/n144 ), .A2(\uut_master/n407 ), 
        .B1(\uut_master/n48 ), .B2(\uut_master/n409 ), .C1(\uut_master/n180 ), 
        .C2(\uut_master/n49 ), .ZN(\uut_master/N217 ) );
  OAI222_X1 \uut_master/U323  ( .A1(\uut_master/n144 ), .A2(\uut_master/n406 ), 
        .B1(\uut_master/n49 ), .B2(\uut_master/n409 ), .C1(\uut_master/n180 ), 
        .C2(\uut_master/n50 ), .ZN(\uut_master/N216 ) );
  OAI222_X1 \uut_master/U322  ( .A1(\uut_master/n144 ), .A2(\uut_master/n405 ), 
        .B1(\uut_master/n50 ), .B2(\uut_master/n38 ), .C1(\uut_master/n180 ), 
        .C2(\uut_master/n51 ), .ZN(\uut_master/N215 ) );
  OAI222_X1 \uut_master/U321  ( .A1(\uut_master/n144 ), .A2(\uut_master/n404 ), 
        .B1(\uut_master/n51 ), .B2(\uut_master/n38 ), .C1(\uut_master/n180 ), 
        .C2(\uut_master/n52 ), .ZN(\uut_master/N214 ) );
  OAI222_X1 \uut_master/U320  ( .A1(\uut_master/n144 ), .A2(\uut_master/n403 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n52 ), .C1(\uut_master/n180 ), 
        .C2(\uut_master/n53 ), .ZN(\uut_master/N213 ) );
  INV_X1 \uut_master/U319  ( .A(command[1]), .ZN(\uut_master/n403 ) );
  INV_X1 \uut_master/U318  ( .A(command[0]), .ZN(\uut_master/n402 ) );
  OAI21_X1 \uut_master/U317  ( .B1(\uut_master/n55 ), .B2(\uut_master/n180 ), 
        .A(\uut_master/n401 ), .ZN(\uut_master/N211 ) );
  AOI22_X1 \uut_master/U316  ( .A1(\uut_master/n185 ), .A2(\uut_master/n400 ), 
        .B1(address[23]), .B2(\uut_master/n399 ), .ZN(\uut_master/n401 ) );
  OAI21_X1 \uut_master/U315  ( .B1(\uut_master/n56 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n398 ), .ZN(\uut_master/N210 ) );
  AOI22_X1 \uut_master/U314  ( .A1(\uut_master/n149 ), .A2(\uut_master/n397 ), 
        .B1(address[22]), .B2(\uut_master/n182 ), .ZN(\uut_master/n398 ) );
  OAI21_X1 \uut_master/U313  ( .B1(\uut_master/n57 ), .B2(\uut_master/n181 ), 
        .A(\uut_master/n396 ), .ZN(\uut_master/N209 ) );
  AOI22_X1 \uut_master/U312  ( .A1(\uut_master/n186 ), .A2(\uut_master/n395 ), 
        .B1(address[21]), .B2(\uut_master/n399 ), .ZN(\uut_master/n396 ) );
  OAI21_X1 \uut_master/U311  ( .B1(\uut_master/n58 ), .B2(\uut_master/n179 ), 
        .A(\uut_master/n394 ), .ZN(\uut_master/N208 ) );
  AOI22_X1 \uut_master/U310  ( .A1(\uut_master/n189 ), .A2(\uut_master/n393 ), 
        .B1(address[20]), .B2(\uut_master/n399 ), .ZN(\uut_master/n394 ) );
  OAI21_X1 \uut_master/U309  ( .B1(\uut_master/n177 ), .B2(\uut_master/n59 ), 
        .A(\uut_master/n392 ), .ZN(\uut_master/N207 ) );
  AOI22_X1 \uut_master/U308  ( .A1(\uut_master/n185 ), .A2(\uut_master/n391 ), 
        .B1(address[19]), .B2(\uut_master/n399 ), .ZN(\uut_master/n392 ) );
  OAI21_X1 \uut_master/U307  ( .B1(\uut_master/n177 ), .B2(\uut_master/n60 ), 
        .A(\uut_master/n390 ), .ZN(\uut_master/N206 ) );
  AOI22_X1 \uut_master/U306  ( .A1(\uut_master/n186 ), .A2(\uut_master/n389 ), 
        .B1(address[18]), .B2(\uut_master/n399 ), .ZN(\uut_master/n390 ) );
  OAI21_X1 \uut_master/U305  ( .B1(\uut_master/n61 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n388 ), .ZN(\uut_master/N205 ) );
  AOI22_X1 \uut_master/U304  ( .A1(\uut_master/n111 ), .A2(\uut_master/n387 ), 
        .B1(address[17]), .B2(\uut_master/n182 ), .ZN(\uut_master/n388 ) );
  OAI21_X1 \uut_master/U303  ( .B1(\uut_master/n145 ), .B2(\uut_master/n62 ), 
        .A(\uut_master/n386 ), .ZN(\uut_master/N204 ) );
  AOI22_X1 \uut_master/U302  ( .A1(\uut_master/n191 ), .A2(\uut_master/n385 ), 
        .B1(address[16]), .B2(\uut_master/n182 ), .ZN(\uut_master/n386 ) );
  OAI21_X1 \uut_master/U301  ( .B1(\uut_master/n179 ), .B2(\uut_master/n63 ), 
        .A(\uut_master/n384 ), .ZN(\uut_master/N203 ) );
  AOI22_X1 \uut_master/U300  ( .A1(\uut_master/n185 ), .A2(\uut_master/n383 ), 
        .B1(address[15]), .B2(\uut_master/n399 ), .ZN(\uut_master/n384 ) );
  OAI21_X1 \uut_master/U299  ( .B1(\uut_master/n179 ), .B2(\uut_master/n64 ), 
        .A(\uut_master/n382 ), .ZN(\uut_master/N202 ) );
  AOI22_X1 \uut_master/U298  ( .A1(\uut_master/n185 ), .A2(\uut_master/n381 ), 
        .B1(address[14]), .B2(\uut_master/n182 ), .ZN(\uut_master/n382 ) );
  OAI21_X1 \uut_master/U297  ( .B1(\uut_master/n65 ), .B2(\uut_master/n177 ), 
        .A(\uut_master/n380 ), .ZN(\uut_master/N201 ) );
  AOI22_X1 \uut_master/U296  ( .A1(\uut_master/n154 ), .A2(\uut_master/n379 ), 
        .B1(address[13]), .B2(\uut_master/n399 ), .ZN(\uut_master/n380 ) );
  OAI21_X1 \uut_master/U295  ( .B1(\uut_master/n179 ), .B2(\uut_master/n66 ), 
        .A(\uut_master/n378 ), .ZN(\uut_master/N200 ) );
  AOI22_X1 \uut_master/U294  ( .A1(\uut_master/n186 ), .A2(\uut_master/n377 ), 
        .B1(address[12]), .B2(\uut_master/n399 ), .ZN(\uut_master/n378 ) );
  OAI21_X1 \uut_master/U293  ( .B1(\uut_master/n179 ), .B2(\uut_master/n67 ), 
        .A(\uut_master/n376 ), .ZN(\uut_master/N199 ) );
  AOI22_X1 \uut_master/U292  ( .A1(\uut_master/n150 ), .A2(\uut_master/n375 ), 
        .B1(\uut_master/n182 ), .B2(address[11]), .ZN(\uut_master/n376 ) );
  OAI21_X1 \uut_master/U291  ( .B1(\uut_master/n179 ), .B2(\uut_master/n68 ), 
        .A(\uut_master/n374 ), .ZN(\uut_master/N198 ) );
  AOI22_X1 \uut_master/U290  ( .A1(\uut_master/n193 ), .A2(\uut_master/n373 ), 
        .B1(address[10]), .B2(\uut_master/n182 ), .ZN(\uut_master/n374 ) );
  OAI21_X1 \uut_master/U289  ( .B1(\uut_master/n69 ), .B2(\uut_master/n181 ), 
        .A(\uut_master/n372 ), .ZN(\uut_master/N197 ) );
  AOI22_X1 \uut_master/U288  ( .A1(\uut_master/n191 ), .A2(\uut_master/n371 ), 
        .B1(address[9]), .B2(\uut_master/n399 ), .ZN(\uut_master/n372 ) );
  OAI21_X1 \uut_master/U287  ( .B1(\uut_master/n177 ), .B2(\uut_master/n70 ), 
        .A(\uut_master/n370 ), .ZN(\uut_master/N196 ) );
  AOI22_X1 \uut_master/U286  ( .A1(\uut_master/n193 ), .A2(\uut_master/n369 ), 
        .B1(address[8]), .B2(\uut_master/n399 ), .ZN(\uut_master/n370 ) );
  OAI21_X1 \uut_master/U285  ( .B1(\uut_master/n177 ), .B2(\uut_master/n71 ), 
        .A(\uut_master/n368 ), .ZN(\uut_master/N195 ) );
  AOI22_X1 \uut_master/U284  ( .A1(\uut_master/n185 ), .A2(\uut_master/n367 ), 
        .B1(address[7]), .B2(\uut_master/n182 ), .ZN(\uut_master/n368 ) );
  OAI21_X1 \uut_master/U283  ( .B1(\uut_master/n145 ), .B2(\uut_master/n72 ), 
        .A(\uut_master/n366 ), .ZN(\uut_master/N194 ) );
  AOI22_X1 \uut_master/U282  ( .A1(\uut_master/n186 ), .A2(\uut_master/n365 ), 
        .B1(address[6]), .B2(\uut_master/n399 ), .ZN(\uut_master/n366 ) );
  OAI21_X1 \uut_master/U281  ( .B1(\uut_master/n73 ), .B2(\uut_master/n145 ), 
        .A(\uut_master/n364 ), .ZN(\uut_master/N193 ) );
  AOI22_X1 \uut_master/U280  ( .A1(\uut_master/n190 ), .A2(\uut_master/n363 ), 
        .B1(address[5]), .B2(\uut_master/n182 ), .ZN(\uut_master/n364 ) );
  OAI21_X1 \uut_master/U279  ( .B1(\uut_master/n145 ), .B2(\uut_master/n74 ), 
        .A(\uut_master/n362 ), .ZN(\uut_master/N192 ) );
  AOI22_X1 \uut_master/U278  ( .A1(\uut_master/n185 ), .A2(\uut_master/n361 ), 
        .B1(address[4]), .B2(\uut_master/n182 ), .ZN(\uut_master/n362 ) );
  OAI21_X1 \uut_master/U277  ( .B1(\uut_master/n75 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n360 ), .ZN(\uut_master/N191 ) );
  AOI22_X1 \uut_master/U276  ( .A1(\uut_master/n192 ), .A2(\uut_master/n359 ), 
        .B1(address[3]), .B2(\uut_master/n182 ), .ZN(\uut_master/n360 ) );
  OAI21_X1 \uut_master/U275  ( .B1(\uut_master/n177 ), .B2(\uut_master/n76 ), 
        .A(\uut_master/n358 ), .ZN(\uut_master/N190 ) );
  AOI22_X1 \uut_master/U274  ( .A1(\uut_master/n150 ), .A2(\uut_master/n357 ), 
        .B1(address[2]), .B2(\uut_master/n399 ), .ZN(\uut_master/n358 ) );
  OAI21_X1 \uut_master/U273  ( .B1(\uut_master/n77 ), .B2(\uut_master/n145 ), 
        .A(\uut_master/n356 ), .ZN(\uut_master/N189 ) );
  AOI22_X1 \uut_master/U272  ( .A1(\uut_master/n143 ), .A2(\uut_master/n355 ), 
        .B1(address[1]), .B2(\uut_master/n182 ), .ZN(\uut_master/n356 ) );
  OAI21_X1 \uut_master/U271  ( .B1(\uut_master/n179 ), .B2(\uut_master/n78 ), 
        .A(\uut_master/n354 ), .ZN(\uut_master/N188 ) );
  AOI22_X1 \uut_master/U270  ( .A1(\uut_master/n185 ), .A2(\uut_master/n353 ), 
        .B1(address[0]), .B2(\uut_master/n182 ), .ZN(\uut_master/n354 ) );
  INV_X1 \uut_master/U269  ( .A(\uut_master/n410 ), .ZN(\uut_master/n399 ) );
  NAND2_X1 \uut_master/U268  ( .A1(\uut_master/n352 ), .A2(\uut_master/n351 ), 
        .ZN(\uut_master/n410 ) );
  OAI21_X1 \uut_master/U267  ( .B1(\uut_master/n79 ), .B2(\uut_master/n145 ), 
        .A(\uut_master/n349 ), .ZN(\uut_master/n412 ) );
  AOI22_X1 \uut_master/U266  ( .A1(\uut_master/n119 ), .A2(data_in[31]), .B1(
        \uut_master/n186 ), .B2(\uut_master/n348 ), .ZN(\uut_master/n349 ) );
  OAI21_X1 \uut_master/U265  ( .B1(\uut_master/n178 ), .B2(\uut_master/n80 ), 
        .A(\uut_master/n347 ), .ZN(\uut_master/n413 ) );
  AOI22_X1 \uut_master/U264  ( .A1(data_in[30]), .A2(\uut_master/n161 ), .B1(
        \uut_master/n120 ), .B2(\uut_master/n346 ), .ZN(\uut_master/n347 ) );
  OAI21_X1 \uut_master/U263  ( .B1(\uut_master/n81 ), .B2(\uut_master/n181 ), 
        .A(\uut_master/n345 ), .ZN(\uut_master/n414 ) );
  AOI22_X1 \uut_master/U262  ( .A1(data_in[29]), .A2(\uut_master/n122 ), .B1(
        \uut_master/n190 ), .B2(\uut_master/n344 ), .ZN(\uut_master/n345 ) );
  OAI21_X1 \uut_master/U261  ( .B1(\uut_master/n177 ), .B2(\uut_master/n82 ), 
        .A(\uut_master/n343 ), .ZN(\uut_master/n415 ) );
  AOI22_X1 \uut_master/U260  ( .A1(\uut_master/n157 ), .A2(data_in[28]), .B1(
        \uut_master/n154 ), .B2(\uut_master/n342 ), .ZN(\uut_master/n343 ) );
  OAI21_X1 \uut_master/U259  ( .B1(\uut_master/n178 ), .B2(\uut_master/n83 ), 
        .A(\uut_master/n341 ), .ZN(\uut_master/n416 ) );
  AOI22_X1 \uut_master/U258  ( .A1(data_in[27]), .A2(\uut_master/n119 ), .B1(
        \uut_master/n121 ), .B2(\uut_master/n340 ), .ZN(\uut_master/n341 ) );
  OAI21_X1 \uut_master/U257  ( .B1(\uut_master/n84 ), .B2(\uut_master/n179 ), 
        .A(\uut_master/n339 ), .ZN(\uut_master/n417 ) );
  AOI22_X1 \uut_master/U256  ( .A1(data_in[26]), .A2(\uut_master/n122 ), .B1(
        \uut_master/n186 ), .B2(\uut_master/n338 ), .ZN(\uut_master/n339 ) );
  OAI21_X1 \uut_master/U255  ( .B1(\uut_master/n85 ), .B2(\uut_master/n181 ), 
        .A(\uut_master/n337 ), .ZN(\uut_master/n418 ) );
  AOI22_X1 \uut_master/U254  ( .A1(\uut_master/n157 ), .A2(data_in[25]), .B1(
        \uut_master/n187 ), .B2(\uut_master/n336 ), .ZN(\uut_master/n337 ) );
  OAI21_X1 \uut_master/U253  ( .B1(\uut_master/n178 ), .B2(\uut_master/n86 ), 
        .A(\uut_master/n335 ), .ZN(\uut_master/n419 ) );
  AOI22_X1 \uut_master/U252  ( .A1(\uut_master/n37 ), .A2(data_in[24]), .B1(
        \uut_master/n121 ), .B2(\uut_master/n334 ), .ZN(\uut_master/n335 ) );
  OAI21_X1 \uut_master/U251  ( .B1(\uut_master/n87 ), .B2(\uut_master/n179 ), 
        .A(\uut_master/n333 ), .ZN(\uut_master/n420 ) );
  AOI22_X1 \uut_master/U250  ( .A1(data_in[23]), .A2(\uut_master/n157 ), .B1(
        \uut_master/n189 ), .B2(\uut_master/n332 ), .ZN(\uut_master/n333 ) );
  OAI21_X1 \uut_master/U249  ( .B1(\uut_master/n88 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n331 ), .ZN(\uut_master/n421 ) );
  AOI22_X1 \uut_master/U248  ( .A1(\uut_master/n37 ), .A2(data_in[22]), .B1(
        \uut_master/n187 ), .B2(\uut_master/n330 ), .ZN(\uut_master/n331 ) );
  OAI21_X1 \uut_master/U247  ( .B1(\uut_master/n89 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n329 ), .ZN(\uut_master/n422 ) );
  AOI22_X1 \uut_master/U246  ( .A1(data_in[21]), .A2(\uut_master/n44 ), .B1(
        \uut_master/n186 ), .B2(\uut_master/n328 ), .ZN(\uut_master/n329 ) );
  OAI21_X1 \uut_master/U245  ( .B1(\uut_master/n90 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n327 ), .ZN(\uut_master/n423 ) );
  AOI22_X1 \uut_master/U244  ( .A1(data_in[20]), .A2(\uut_master/n44 ), .B1(
        \uut_master/n193 ), .B2(\uut_master/n326 ), .ZN(\uut_master/n327 ) );
  OAI21_X1 \uut_master/U243  ( .B1(\uut_master/n91 ), .B2(\uut_master/n145 ), 
        .A(\uut_master/n325 ), .ZN(\uut_master/n424 ) );
  AOI22_X1 \uut_master/U242  ( .A1(data_in[19]), .A2(\uut_master/n44 ), .B1(
        \uut_master/n187 ), .B2(\uut_master/n324 ), .ZN(\uut_master/n325 ) );
  OAI21_X1 \uut_master/U241  ( .B1(\uut_master/n178 ), .B2(\uut_master/n92 ), 
        .A(\uut_master/n323 ), .ZN(\uut_master/n425 ) );
  AOI22_X1 \uut_master/U240  ( .A1(data_in[18]), .A2(\uut_master/n161 ), .B1(
        \uut_master/n150 ), .B2(\uut_master/n322 ), .ZN(\uut_master/n323 ) );
  OAI21_X1 \uut_master/U239  ( .B1(\uut_master/n145 ), .B2(\uut_master/n93 ), 
        .A(\uut_master/n321 ), .ZN(\uut_master/n426 ) );
  AOI22_X1 \uut_master/U238  ( .A1(data_in[17]), .A2(\uut_master/n44 ), .B1(
        \uut_master/n120 ), .B2(\uut_master/n320 ), .ZN(\uut_master/n321 ) );
  OAI21_X1 \uut_master/U237  ( .B1(\uut_master/n177 ), .B2(\uut_master/n94 ), 
        .A(\uut_master/n319 ), .ZN(\uut_master/n427 ) );
  AOI22_X1 \uut_master/U236  ( .A1(\uut_master/n119 ), .A2(data_in[16]), .B1(
        \uut_master/n193 ), .B2(\uut_master/n318 ), .ZN(\uut_master/n319 ) );
  OAI21_X1 \uut_master/U235  ( .B1(\uut_master/n95 ), .B2(\uut_master/n145 ), 
        .A(\uut_master/n317 ), .ZN(\uut_master/n428 ) );
  AOI22_X1 \uut_master/U234  ( .A1(data_in[15]), .A2(\uut_master/n161 ), .B1(
        \uut_master/n185 ), .B2(\uut_master/n316 ), .ZN(\uut_master/n317 ) );
  OAI21_X1 \uut_master/U233  ( .B1(\uut_master/n96 ), .B2(\uut_master/n180 ), 
        .A(\uut_master/n315 ), .ZN(\uut_master/n429 ) );
  AOI22_X1 \uut_master/U232  ( .A1(data_in[14]), .A2(\uut_master/n161 ), .B1(
        \uut_master/n120 ), .B2(\uut_master/n314 ), .ZN(\uut_master/n315 ) );
  OAI21_X1 \uut_master/U231  ( .B1(\uut_master/n179 ), .B2(\uut_master/n97 ), 
        .A(\uut_master/n313 ), .ZN(\uut_master/n430 ) );
  AOI22_X1 \uut_master/U230  ( .A1(data_in[13]), .A2(\uut_master/n119 ), .B1(
        \uut_master/n121 ), .B2(\uut_master/n312 ), .ZN(\uut_master/n313 ) );
  OAI21_X1 \uut_master/U229  ( .B1(\uut_master/n98 ), .B2(\uut_master/n181 ), 
        .A(\uut_master/n311 ), .ZN(\uut_master/n431 ) );
  AOI22_X1 \uut_master/U228  ( .A1(data_in[12]), .A2(\uut_master/n44 ), .B1(
        \uut_master/n187 ), .B2(\uut_master/n310 ), .ZN(\uut_master/n311 ) );
  OAI21_X1 \uut_master/U227  ( .B1(\uut_master/n99 ), .B2(\uut_master/n179 ), 
        .A(\uut_master/n309 ), .ZN(\uut_master/n432 ) );
  AOI22_X1 \uut_master/U226  ( .A1(\uut_master/n37 ), .A2(data_in[11]), .B1(
        \uut_master/n130 ), .B2(\uut_master/n308 ), .ZN(\uut_master/n309 ) );
  OAI21_X1 \uut_master/U225  ( .B1(\uut_master/n100 ), .B2(\uut_master/n181 ), 
        .A(\uut_master/n307 ), .ZN(\uut_master/n433 ) );
  AOI22_X1 \uut_master/U224  ( .A1(data_in[10]), .A2(\uut_master/n161 ), .B1(
        \uut_master/n193 ), .B2(\uut_master/n306 ), .ZN(\uut_master/n307 ) );
  OAI21_X1 \uut_master/U223  ( .B1(\uut_master/n101 ), .B2(\uut_master/n177 ), 
        .A(\uut_master/n305 ), .ZN(\uut_master/n434 ) );
  AOI22_X1 \uut_master/U222  ( .A1(\uut_master/n37 ), .A2(data_in[9]), .B1(
        \uut_master/n187 ), .B2(\uut_master/n304 ), .ZN(\uut_master/n305 ) );
  OAI21_X1 \uut_master/U221  ( .B1(\uut_master/n102 ), .B2(\uut_master/n177 ), 
        .A(\uut_master/n303 ), .ZN(\uut_master/n435 ) );
  AOI22_X1 \uut_master/U220  ( .A1(\uut_master/n157 ), .A2(data_in[8]), .B1(
        \uut_master/n130 ), .B2(\uut_master/n302 ), .ZN(\uut_master/n303 ) );
  OAI21_X1 \uut_master/U219  ( .B1(\uut_master/n103 ), .B2(\uut_master/n177 ), 
        .A(\uut_master/n301 ), .ZN(\uut_master/n436 ) );
  AOI22_X1 \uut_master/U218  ( .A1(data_in[7]), .A2(\uut_master/n122 ), .B1(
        \uut_master/n185 ), .B2(\uut_master/n300 ), .ZN(\uut_master/n301 ) );
  OAI21_X1 \uut_master/U217  ( .B1(\uut_master/n179 ), .B2(\uut_master/n104 ), 
        .A(\uut_master/n299 ), .ZN(\uut_master/n437 ) );
  AOI22_X1 \uut_master/U216  ( .A1(data_in[6]), .A2(\uut_master/n122 ), .B1(
        \uut_master/n154 ), .B2(\uut_master/n298 ), .ZN(\uut_master/n299 ) );
  OAI21_X1 \uut_master/U215  ( .B1(\uut_master/n105 ), .B2(\uut_master/n177 ), 
        .A(\uut_master/n297 ), .ZN(\uut_master/n438 ) );
  AOI22_X1 \uut_master/U214  ( .A1(data_in[5]), .A2(\uut_master/n37 ), .B1(
        \uut_master/n187 ), .B2(\uut_master/n296 ), .ZN(\uut_master/n297 ) );
  OAI21_X1 \uut_master/U213  ( .B1(\uut_master/n106 ), .B2(\uut_master/n145 ), 
        .A(\uut_master/n295 ), .ZN(\uut_master/n439 ) );
  AOI22_X1 \uut_master/U212  ( .A1(data_in[4]), .A2(\uut_master/n122 ), .B1(
        \uut_master/n130 ), .B2(\uut_master/n294 ), .ZN(\uut_master/n295 ) );
  OAI21_X1 \uut_master/U211  ( .B1(\uut_master/n107 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n293 ), .ZN(\uut_master/n440 ) );
  AOI22_X1 \uut_master/U210  ( .A1(\uut_master/n157 ), .A2(data_in[3]), .B1(
        \uut_master/n186 ), .B2(\uut_master/n292 ), .ZN(\uut_master/n293 ) );
  OAI21_X1 \uut_master/U209  ( .B1(\uut_master/n108 ), .B2(\uut_master/n145 ), 
        .A(\uut_master/n291 ), .ZN(\uut_master/n441 ) );
  AOI22_X1 \uut_master/U208  ( .A1(data_in[2]), .A2(\uut_master/n157 ), .B1(
        \uut_master/n186 ), .B2(\uut_master/n290 ), .ZN(\uut_master/n291 ) );
  OAI21_X1 \uut_master/U207  ( .B1(\uut_master/n145 ), .B2(\uut_master/n109 ), 
        .A(\uut_master/n289 ), .ZN(\uut_master/n442 ) );
  AOI22_X1 \uut_master/U206  ( .A1(data_in[1]), .A2(\uut_master/n122 ), .B1(
        \uut_master/n189 ), .B2(\uut_master/n288 ), .ZN(\uut_master/n289 ) );
  INV_X1 \uut_master/U205  ( .A(\uut_master/n287 ), .ZN(\uut_master/N156 ) );
  AOI22_X1 \uut_master/U204  ( .A1(\uut_master/n188 ), .A2(\uut_master/n286 ), 
        .B1(data_in[0]), .B2(\uut_master/n119 ), .ZN(\uut_master/n287 ) );
  INV_X1 \uut_master/U203  ( .A(command[6]), .ZN(\uut_master/n408 ) );
  INV_X1 \uut_master/U202  ( .A(command[5]), .ZN(\uut_master/n407 ) );
  INV_X1 \uut_master/U201  ( .A(command[4]), .ZN(\uut_master/n406 ) );
  NOR3_X1 \uut_master/U200  ( .A1(command[1]), .A2(command[0]), .A3(rst), .ZN(
        \uut_master/n285 ) );
  INV_X1 \uut_master/U199  ( .A(command[3]), .ZN(\uut_master/n405 ) );
  INV_X1 \uut_master/U198  ( .A(command[2]), .ZN(\uut_master/n404 ) );
  OAI21_X1 \uut_master/U197  ( .B1(\uut_master/n183 ), .B2(\uut_master/n281 ), 
        .A(\uut_master/n280 ), .ZN(\uut_master/n36 ) );
  NAND3_X1 \uut_master/U196  ( .A1(data_out[30]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n190 ), .ZN(\uut_master/n280 ) );
  OAI21_X1 \uut_master/U195  ( .B1(\uut_master/n113 ), .B2(\uut_master/n278 ), 
        .A(\uut_master/n277 ), .ZN(\uut_master/n35 ) );
  NAND3_X1 \uut_master/U194  ( .A1(data_out[29]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n188 ), .ZN(\uut_master/n277 ) );
  OAI21_X1 \uut_master/U193  ( .B1(\uut_master/n282 ), .B2(\uut_master/n276 ), 
        .A(\uut_master/n275 ), .ZN(\uut_master/n34 ) );
  NAND3_X1 \uut_master/U192  ( .A1(data_out[28]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n143 ), .ZN(\uut_master/n275 ) );
  OAI21_X1 \uut_master/U191  ( .B1(\uut_master/n166 ), .B2(\uut_master/n274 ), 
        .A(\uut_master/n273 ), .ZN(\uut_master/n33 ) );
  NAND3_X1 \uut_master/U190  ( .A1(data_out[27]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n192 ), .ZN(\uut_master/n273 ) );
  OAI21_X1 \uut_master/U189  ( .B1(\uut_master/n183 ), .B2(\uut_master/n272 ), 
        .A(\uut_master/n271 ), .ZN(\uut_master/n32 ) );
  NAND3_X1 \uut_master/U188  ( .A1(data_out[26]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n120 ), .ZN(\uut_master/n271 ) );
  OAI21_X1 \uut_master/U187  ( .B1(\uut_master/n163 ), .B2(\uut_master/n270 ), 
        .A(\uut_master/n269 ), .ZN(\uut_master/n31 ) );
  NAND3_X1 \uut_master/U186  ( .A1(data_out[25]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n193 ), .ZN(\uut_master/n269 ) );
  OAI21_X1 \uut_master/U185  ( .B1(\uut_master/n166 ), .B2(\uut_master/n268 ), 
        .A(\uut_master/n267 ), .ZN(\uut_master/n30 ) );
  NAND3_X1 \uut_master/U184  ( .A1(data_out[24]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n267 ) );
  OAI21_X1 \uut_master/U183  ( .B1(\uut_master/n162 ), .B2(\uut_master/n266 ), 
        .A(\uut_master/n265 ), .ZN(\uut_master/n29 ) );
  NAND3_X1 \uut_master/U182  ( .A1(data_out[23]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n186 ), .ZN(\uut_master/n265 ) );
  OAI21_X1 \uut_master/U181  ( .B1(\uut_master/n282 ), .B2(\uut_master/n264 ), 
        .A(\uut_master/n263 ), .ZN(\uut_master/n28 ) );
  NAND3_X1 \uut_master/U180  ( .A1(data_out[22]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n185 ), .ZN(\uut_master/n263 ) );
  OAI21_X1 \uut_master/U179  ( .B1(\uut_master/n139 ), .B2(\uut_master/n262 ), 
        .A(\uut_master/n261 ), .ZN(\uut_master/n27 ) );
  NAND3_X1 \uut_master/U178  ( .A1(\uut_master/n186 ), .A2(\uut_master/n176 ), 
        .A3(data_out[21]), .ZN(\uut_master/n261 ) );
  OAI21_X1 \uut_master/U177  ( .B1(\uut_master/n184 ), .B2(\uut_master/n260 ), 
        .A(\uut_master/n259 ), .ZN(\uut_master/n26 ) );
  NAND3_X1 \uut_master/U176  ( .A1(data_out[20]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n120 ), .ZN(\uut_master/n259 ) );
  OAI21_X1 \uut_master/U175  ( .B1(\uut_master/n164 ), .B2(\uut_master/n258 ), 
        .A(\uut_master/n257 ), .ZN(\uut_master/n25 ) );
  NAND3_X1 \uut_master/U174  ( .A1(data_out[19]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n193 ), .ZN(\uut_master/n257 ) );
  OAI21_X1 \uut_master/U173  ( .B1(\uut_master/n129 ), .B2(\uut_master/n256 ), 
        .A(\uut_master/n255 ), .ZN(\uut_master/n24 ) );
  NAND3_X1 \uut_master/U172  ( .A1(data_out[18]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n111 ), .ZN(\uut_master/n255 ) );
  OAI21_X1 \uut_master/U171  ( .B1(\uut_master/n139 ), .B2(\uut_master/n254 ), 
        .A(\uut_master/n253 ), .ZN(\uut_master/n23 ) );
  NAND3_X1 \uut_master/U170  ( .A1(data_out[17]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n192 ), .ZN(\uut_master/n253 ) );
  OAI21_X1 \uut_master/U169  ( .B1(\uut_master/n166 ), .B2(\uut_master/n252 ), 
        .A(\uut_master/n251 ), .ZN(\uut_master/n22 ) );
  NAND3_X1 \uut_master/U168  ( .A1(data_out[16]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n251 ) );
  OAI21_X1 \uut_master/U167  ( .B1(\uut_master/n282 ), .B2(\uut_master/n250 ), 
        .A(\uut_master/n249 ), .ZN(\uut_master/n21 ) );
  NAND3_X1 \uut_master/U166  ( .A1(data_out[15]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n193 ), .ZN(\uut_master/n249 ) );
  OAI21_X1 \uut_master/U165  ( .B1(\uut_master/n113 ), .B2(\uut_master/n248 ), 
        .A(\uut_master/n247 ), .ZN(\uut_master/n20 ) );
  NAND3_X1 \uut_master/U164  ( .A1(\uut_master/n185 ), .A2(\uut_master/n176 ), 
        .A3(data_out[14]), .ZN(\uut_master/n247 ) );
  OAI21_X1 \uut_master/U163  ( .B1(\uut_master/n140 ), .B2(\uut_master/n246 ), 
        .A(\uut_master/n245 ), .ZN(\uut_master/n19 ) );
  NAND3_X1 \uut_master/U162  ( .A1(data_out[13]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n185 ), .ZN(\uut_master/n245 ) );
  OAI21_X1 \uut_master/U161  ( .B1(\uut_master/n183 ), .B2(\uut_master/n244 ), 
        .A(\uut_master/n243 ), .ZN(\uut_master/n18 ) );
  NAND3_X1 \uut_master/U160  ( .A1(data_out[12]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n185 ), .ZN(\uut_master/n243 ) );
  OAI21_X1 \uut_master/U159  ( .B1(\uut_master/n162 ), .B2(\uut_master/n242 ), 
        .A(\uut_master/n241 ), .ZN(\uut_master/n17 ) );
  NAND3_X1 \uut_master/U158  ( .A1(data_out[11]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n186 ), .ZN(\uut_master/n241 ) );
  OAI21_X1 \uut_master/U157  ( .B1(\uut_master/n139 ), .B2(\uut_master/n240 ), 
        .A(\uut_master/n239 ), .ZN(\uut_master/n16 ) );
  NAND3_X1 \uut_master/U156  ( .A1(data_out[10]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n188 ), .ZN(\uut_master/n239 ) );
  OAI21_X1 \uut_master/U155  ( .B1(\uut_master/n140 ), .B2(\uut_master/n238 ), 
        .A(\uut_master/n237 ), .ZN(\uut_master/n15 ) );
  NAND3_X1 \uut_master/U154  ( .A1(data_out[9]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n111 ), .ZN(\uut_master/n237 ) );
  OAI21_X1 \uut_master/U153  ( .B1(\uut_master/n163 ), .B2(\uut_master/n236 ), 
        .A(\uut_master/n235 ), .ZN(\uut_master/n14 ) );
  NAND3_X1 \uut_master/U152  ( .A1(data_out[8]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n154 ), .ZN(\uut_master/n235 ) );
  OAI21_X1 \uut_master/U151  ( .B1(\uut_master/n129 ), .B2(\uut_master/n234 ), 
        .A(\uut_master/n233 ), .ZN(\uut_master/n13 ) );
  NAND3_X1 \uut_master/U150  ( .A1(data_out[7]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n143 ), .ZN(\uut_master/n233 ) );
  OAI21_X1 \uut_master/U149  ( .B1(\uut_master/n129 ), .B2(\uut_master/n232 ), 
        .A(\uut_master/n231 ), .ZN(\uut_master/n12 ) );
  NAND3_X1 \uut_master/U148  ( .A1(data_out[6]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n186 ), .ZN(\uut_master/n231 ) );
  OAI21_X1 \uut_master/U147  ( .B1(\uut_master/n163 ), .B2(\uut_master/n230 ), 
        .A(\uut_master/n229 ), .ZN(\uut_master/n11 ) );
  NAND3_X1 \uut_master/U146  ( .A1(data_out[5]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n191 ), .ZN(\uut_master/n229 ) );
  OAI21_X1 \uut_master/U145  ( .B1(\uut_master/n164 ), .B2(\uut_master/n228 ), 
        .A(\uut_master/n227 ), .ZN(\uut_master/n10 ) );
  NAND3_X1 \uut_master/U144  ( .A1(data_out[4]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n143 ), .ZN(\uut_master/n227 ) );
  OAI21_X1 \uut_master/U143  ( .B1(\uut_master/n184 ), .B2(\uut_master/n226 ), 
        .A(\uut_master/n225 ), .ZN(\uut_master/n9 ) );
  NAND3_X1 \uut_master/U142  ( .A1(data_out[3]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n190 ), .ZN(\uut_master/n225 ) );
  OAI21_X1 \uut_master/U141  ( .B1(\uut_master/n164 ), .B2(\uut_master/n224 ), 
        .A(\uut_master/n223 ), .ZN(\uut_master/n8 ) );
  NAND3_X1 \uut_master/U140  ( .A1(data_out[2]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n193 ), .ZN(\uut_master/n223 ) );
  OAI21_X1 \uut_master/U139  ( .B1(\uut_master/n140 ), .B2(\uut_master/n222 ), 
        .A(\uut_master/n221 ), .ZN(\uut_master/n7 ) );
  NAND3_X1 \uut_master/U138  ( .A1(data_out[1]), .A2(\uut_master/n175 ), .A3(
        \uut_master/n193 ), .ZN(\uut_master/n221 ) );
  OAI21_X1 \uut_master/U137  ( .B1(\uut_master/n162 ), .B2(\uut_master/n220 ), 
        .A(\uut_master/n219 ), .ZN(\uut_master/n6 ) );
  NAND3_X1 \uut_master/U136  ( .A1(data_out[0]), .A2(\uut_master/n176 ), .A3(
        \uut_master/n193 ), .ZN(\uut_master/n219 ) );
  NAND3_X1 \uut_master/U135  ( .A1(miso), .A2(\uut_master/n175 ), .A3(
        \uut_master/n154 ), .ZN(\uut_master/n218 ) );
  INV_X1 \uut_master/U134  ( .A(\uut_master/n135 ), .ZN(\uut_master/n282 ) );
  OAI22_X1 \uut_master/U133  ( .A1(rst), .A2(\uut_master/n215 ), .B1(
        \uut_master/n411 ), .B2(\uut_master/n125 ), .ZN(\uut_master/N349 ) );
  NOR2_X1 \uut_master/U132  ( .A1(\uut_master/n180 ), .A2(\uut_master/n214 ), 
        .ZN(\uut_master/N226 ) );
  OAI21_X1 \uut_master/U131  ( .B1(\uut_master/n39 ), .B2(\uut_master/n213 ), 
        .A(\uut_master/n212 ), .ZN(\uut_master/N225 ) );
  OAI22_X1 \uut_master/U130  ( .A1(\uut_master/n211 ), .A2(\uut_master/n112 ), 
        .B1(\uut_master/n213 ), .B2(\uut_master/n40 ), .ZN(\uut_master/N224 )
         );
  INV_X1 \uut_master/U129  ( .A(\uut_master/n210 ), .ZN(\uut_master/n213 ) );
  MUX2_X1 \uut_master/U128  ( .A(\uut_master/data_count_hi [0]), .B(
        \uut_master/n209 ), .S(\uut_master/n40 ), .Z(\uut_master/n211 ) );
  NAND2_X1 \uut_master/U127  ( .A1(\uut_master/n131 ), .A2(
        \uut_master/data_count_hi [0]), .ZN(\uut_master/n209 ) );
  MUX2_X1 \uut_master/U126  ( .A(\uut_master/n210 ), .B(\uut_master/n208 ), 
        .S(\uut_master/n41 ), .Z(\uut_master/N223 ) );
  NOR3_X1 \uut_master/U125  ( .A1(\uut_master/n206 ), .A2(\uut_master/n194 ), 
        .A3(\uut_master/n207 ), .ZN(\uut_master/n208 ) );
  OAI21_X1 \uut_master/U124  ( .B1(\uut_master/n153 ), .B2(\uut_master/n131 ), 
        .A(\uut_master/n146 ), .ZN(\uut_master/n210 ) );
  OAI22_X1 \uut_master/U123  ( .A1(\uut_master/n205 ), .A2(\uut_master/n112 ), 
        .B1(\uut_master/n204 ), .B2(\uut_master/n42 ), .ZN(\uut_master/N222 )
         );
  AOI21_X1 \uut_master/U122  ( .B1(\uut_master/n203 ), .B2(\uut_master/n202 ), 
        .A(\uut_master/n149 ), .ZN(\uut_master/n204 ) );
  MUX2_X1 \uut_master/U121  ( .A(\uut_master/n137 ), .B(\uut_master/n201 ), 
        .S(\uut_master/n42 ), .Z(\uut_master/n205 ) );
  NAND2_X1 \uut_master/U120  ( .A1(\uut_master/n137 ), .A2(\uut_master/n142 ), 
        .ZN(\uut_master/n201 ) );
  NOR3_X1 \uut_master/U119  ( .A1(\uut_master/n202 ), .A2(\uut_master/n194 ), 
        .A3(\uut_master/n207 ), .ZN(\uut_master/n199 ) );
  AOI22_X1 \uut_master/U118  ( .A1(\uut_master/n142 ), .A2(\uut_master/n198 ), 
        .B1(\uut_master/n153 ), .B2(\uut_master/n409 ), .ZN(\uut_master/n200 )
         );
  NAND2_X1 \uut_master/U117  ( .A1(\uut_master/n128 ), .A2(
        \uut_master/clock_count ), .ZN(\uut_master/n198 ) );
  OAI22_X1 \uut_master/U116  ( .A1(\uut_master/n112 ), .A2(\uut_master/n142 ), 
        .B1(\uut_master/n202 ), .B2(\uut_master/n134 ), .ZN(\uut_master/N220 )
         );
  INV_X1 \uut_master/U115  ( .A(\uut_master/n153 ), .ZN(\uut_master/n203 ) );
  NAND2_X1 \uut_master/U114  ( .A1(\uut_master/n160 ), .A2(
        \uut_master/data_count_hi [2]), .ZN(\uut_master/n214 ) );
  INV_X1 \uut_master/U113  ( .A(\uut_master/n39 ), .ZN(\uut_master/n279 ) );
  OAI211_X1 \uut_master/U112  ( .C1(\uut_master/n115 ), .C2(\uut_master/n168 ), 
        .A(\uut_master/n196 ), .B(\uut_master/n169 ), .ZN(\uut_master/n443 )
         );
  OAI21_X1 \uut_master/U111  ( .B1(\uut_master/n115 ), .B2(\uut_master/n173 ), 
        .A(\uut_master/n168 ), .ZN(\uut_master/n196 ) );
  NOR2_X1 \uut_master/U110  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n4 ), .ZN(\uut_master/N17 ) );
  OAI21_X1 \uut_master/U109  ( .B1(\uut_master/n3 ), .B2(\uut_master/n283 ), 
        .A(\uut_master/n351 ), .ZN(cs) );
  NAND2_X1 \uut_master/U108  ( .A1(\uut_master/n110 ), .A2(\uut_master/n114 ), 
        .ZN(\uut_master/n215 ) );
  INV_X1 \uut_master/U107  ( .A(\uut_master/n1 ), .ZN(\uut_master/n283 ) );
  NAND2_X1 \uut_master/U106  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n2 ), .ZN(\uut_master/n352 ) );
  NOR3_X1 \uut_master/U105  ( .A1(\uut_master/n195 ), .A2(\uut_master/n110 ), 
        .A3(\uut_master/n117 ), .ZN(\uut_master/N348 ) );
  NAND2_X1 \uut_master/U104  ( .A1(enable), .A2(\uut_master/n351 ), .ZN(
        \uut_master/n195 ) );
  INV_X1 \uut_master/U103  ( .A(rst), .ZN(\uut_master/n351 ) );
  INV_X1 \uut_master/U102  ( .A(sck), .ZN(\uut_master/n194 ) );
  CLKBUF_X1 \uut_master/U101  ( .A(\uut_master/n172 ), .Z(\uut_master/n187 )
         );
  NAND2_X1 \uut_master/U100  ( .A1(\uut_master/n443 ), .A2(\uut_master/n158 ), 
        .ZN(\uut_master/n350 ) );
  CLKBUF_X3 \uut_master/U99  ( .A(\uut_master/n279 ), .Z(\uut_master/n176 ) );
  AND3_X2 \uut_master/U98  ( .A1(\uut_master/n132 ), .A2(\uut_master/n147 ), 
        .A3(\uut_master/clock_count ), .ZN(\uut_master/n172 ) );
  NAND2_X1 \uut_master/U97  ( .A1(\uut_master/n171 ), .A2(\uut_master/n218 ), 
        .ZN(\uut_master/n5 ) );
  AND2_X1 \uut_master/U96  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n351 ), .ZN(\uut_master/n170 ) );
  NOR2_X1 \uut_master/U95  ( .A1(\uut_master/n174 ), .A2(rst), .ZN(
        \uut_master/n169 ) );
  INV_X1 \uut_master/U94  ( .A(\uut_master/n136 ), .ZN(\uut_master/n183 ) );
  INV_X1 \uut_master/U93  ( .A(\uut_master/n133 ), .ZN(\uut_master/n184 ) );
  INV_X1 \uut_master/U92  ( .A(\uut_master/n217 ), .ZN(\uut_master/n166 ) );
  INV_X1 \uut_master/U91  ( .A(\uut_master/n135 ), .ZN(\uut_master/n164 ) );
  INV_X1 \uut_master/U90  ( .A(\uut_master/n217 ), .ZN(\uut_master/n163 ) );
  INV_X1 \uut_master/U89  ( .A(\uut_master/n135 ), .ZN(\uut_master/n162 ) );
  OAI222_X1 \uut_master/U88  ( .A1(\uut_master/n144 ), .A2(\uut_master/n402 ), 
        .B1(\uut_master/n148 ), .B2(\uut_master/n53 ), .C1(\uut_master/n54 ), 
        .C2(\uut_master/n180 ), .ZN(\uut_master/N212 ) );
  INV_X1 \uut_master/U87  ( .A(\uut_master/n172 ), .ZN(\uut_master/n409 ) );
  NAND2_X1 \uut_master/U86  ( .A1(\uut_master/n214 ), .A2(\uut_master/n158 ), 
        .ZN(\uut_master/n207 ) );
  INV_X1 \uut_master/U85  ( .A(\uut_master/n410 ), .ZN(\uut_master/n182 ) );
  CLKBUF_X3 \uut_master/U84  ( .A(\uut_master/n279 ), .Z(\uut_master/n175 ) );
  NAND2_X1 \uut_master/U83  ( .A1(\uut_master/n123 ), .A2(\uut_master/n159 ), 
        .ZN(\uut_master/n212 ) );
  OR2_X1 \uut_master/U82  ( .A1(\uut_master/n175 ), .A2(\uut_master/n160 ), 
        .ZN(\uut_master/n159 ) );
  AND3_X1 \uut_master/U81  ( .A1(\uut_master/n406 ), .A2(\uut_master/n407 ), 
        .A3(\uut_master/n408 ), .ZN(\uut_master/n156 ) );
  AND3_X1 \uut_master/U80  ( .A1(\uut_master/n352 ), .A2(\uut_master/n155 ), 
        .A3(\uut_master/n156 ), .ZN(\uut_master/n284 ) );
  NAND2_X1 \uut_master/U79  ( .A1(\uut_master/n152 ), .A2(\uut_master/n158 ), 
        .ZN(\uut_master/n153 ) );
  AND3_X1 \uut_master/U78  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n168 ), .A3(\uut_master/n351 ), .ZN(\uut_master/n158 ) );
  NAND2_X1 \uut_master/U77  ( .A1(\uut_master/n160 ), .A2(
        \uut_master/data_count_hi [2]), .ZN(\uut_master/n152 ) );
  CLKBUF_X3 \uut_master/U76  ( .A(\uut_master/n127 ), .Z(\uut_master/n193 ) );
  INV_X1 \uut_master/U75  ( .A(\uut_master/n131 ), .ZN(\uut_master/n206 ) );
  INV_X1 \uut_master/U74  ( .A(\uut_master/n127 ), .ZN(\uut_master/n148 ) );
  INV_X1 \uut_master/U73  ( .A(\uut_master/current_state [0]), .ZN(
        \uut_master/n147 ) );
  INV_X1 \uut_master/U72  ( .A(\uut_master/n172 ), .ZN(\uut_master/n146 ) );
  CLKBUF_X3 \uut_master/U71  ( .A(\uut_master/n350 ), .Z(\uut_master/n145 ) );
  INV_X1 \uut_master/U70  ( .A(\uut_master/n146 ), .ZN(\uut_master/n143 ) );
  CLKBUF_X3 \uut_master/U69  ( .A(\uut_master/n172 ), .Z(\uut_master/n185 ) );
  CLKBUF_X3 \uut_master/U68  ( .A(\uut_master/n172 ), .Z(\uut_master/n186 ) );
  INV_X1 \uut_master/U67  ( .A(\uut_master/n202 ), .ZN(\uut_master/n142 ) );
  INV_X1 \uut_master/U66  ( .A(command[7]), .ZN(\uut_master/n155 ) );
  AND3_X1 \uut_master/U65  ( .A1(\uut_master/n352 ), .A2(\uut_master/n155 ), 
        .A3(\uut_master/n156 ), .ZN(\uut_master/n141 ) );
  INV_X1 \uut_master/U64  ( .A(\uut_master/n136 ), .ZN(\uut_master/n140 ) );
  INV_X1 \uut_master/U63  ( .A(\uut_master/n217 ), .ZN(\uut_master/n139 ) );
  OR3_X2 \uut_master/U62  ( .A1(\uut_master/current_state [0]), .A2(
        \uut_master/n115 ), .A3(rst), .ZN(\uut_master/n411 ) );
  CLKBUF_X1 \uut_master/U61  ( .A(\uut_master/n411 ), .Z(\uut_master/n138 ) );
  INV_X1 \uut_master/U60  ( .A(\uut_master/n43 ), .ZN(\uut_master/n137 ) );
  OAI222_X1 \uut_master/U59  ( .A1(\uut_master/n128 ), .A2(\uut_master/n411 ), 
        .B1(\uut_master/n170 ), .B2(\uut_master/n411 ), .C1(\uut_master/n124 ), 
        .C2(rst), .ZN(\uut_master/n217 ) );
  OAI222_X1 \uut_master/U58  ( .A1(\uut_master/n116 ), .A2(\uut_master/n411 ), 
        .B1(\uut_master/n170 ), .B2(\uut_master/n411 ), .C1(\uut_master/n124 ), 
        .C2(rst), .ZN(\uut_master/n136 ) );
  OAI222_X1 \uut_master/U57  ( .A1(\uut_master/n116 ), .A2(\uut_master/n411 ), 
        .B1(\uut_master/n170 ), .B2(\uut_master/n411 ), .C1(\uut_master/n216 ), 
        .C2(rst), .ZN(\uut_master/n135 ) );
  BUF_X1 \uut_master/U56  ( .A(\uut_master/n167 ), .Z(\uut_master/n190 ) );
  OAI222_X1 \uut_master/U55  ( .A1(\uut_master/n116 ), .A2(\uut_master/n411 ), 
        .B1(\uut_master/n170 ), .B2(\uut_master/n411 ), .C1(\uut_master/n216 ), 
        .C2(rst), .ZN(\uut_master/n133 ) );
  AND3_X1 \uut_master/U54  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n351 ), .A3(\uut_master/n45 ), .ZN(\uut_master/n132 ) );
  BUF_X2 \uut_master/U53  ( .A(\uut_master/n350 ), .Z(\uut_master/n180 ) );
  MUX2_X1 \uut_master/U52  ( .A(\uut_master/n199 ), .B(\uut_master/n200 ), .S(
        \uut_master/n137 ), .Z(\uut_master/N221 ) );
  AND3_X1 \uut_master/U51  ( .A1(\uut_master/data_count_lo [0]), .A2(
        \uut_master/n165 ), .A3(\uut_master/data_count_lo [1]), .ZN(
        \uut_master/n151 ) );
  INV_X1 \uut_master/U50  ( .A(\uut_master/n136 ), .ZN(\uut_master/n129 ) );
  CLKBUF_X1 \uut_master/U49  ( .A(\uut_master/n45 ), .Z(\uut_master/n128 ) );
  AND3_X1 \uut_master/U48  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n147 ), .A3(\uut_master/n197 ), .ZN(\uut_master/n127 ) );
  AND3_X1 \uut_master/U47  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n147 ), .A3(\uut_master/n197 ), .ZN(\uut_master/n126 ) );
  INV_X1 \uut_master/U46  ( .A(\uut_master/n45 ), .ZN(\uut_master/n125 ) );
  AND3_X1 \uut_master/U45  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n45 ), .A3(\uut_master/n351 ), .ZN(\uut_master/n197 ) );
  AND3_X1 \uut_master/U44  ( .A1(\uut_master/data_count_lo [1]), .A2(
        \uut_master/n165 ), .A3(\uut_master/data_count_lo [0]), .ZN(
        \uut_master/n131 ) );
  AND2_X1 \uut_master/U43  ( .A1(\uut_master/n158 ), .A2(
        \uut_master/data_count_hi [2]), .ZN(\uut_master/n216 ) );
  CLKBUF_X3 \uut_master/U42  ( .A(\uut_master/n350 ), .Z(\uut_master/n179 ) );
  AND2_X1 \uut_master/U41  ( .A1(\uut_master/n158 ), .A2(
        \uut_master/data_count_hi [2]), .ZN(\uut_master/n124 ) );
  CLKBUF_X3 \uut_master/U40  ( .A(\uut_master/n350 ), .Z(\uut_master/n177 ) );
  INV_X1 \uut_master/U39  ( .A(\uut_master/n146 ), .ZN(\uut_master/n130 ) );
  NOR2_X1 \uut_master/U38  ( .A1(\uut_master/n207 ), .A2(\uut_master/n194 ), 
        .ZN(\uut_master/n123 ) );
  CLKBUF_X3 \uut_master/U37  ( .A(\uut_master/n350 ), .Z(\uut_master/n178 ) );
  AND4_X2 \uut_master/U36  ( .A1(\uut_master/n141 ), .A2(\uut_master/n405 ), 
        .A3(\uut_master/n285 ), .A4(\uut_master/n404 ), .ZN(\uut_master/n161 )
         );
  AND4_X2 \uut_master/U35  ( .A1(\uut_master/n284 ), .A2(\uut_master/n405 ), 
        .A3(\uut_master/n285 ), .A4(\uut_master/n404 ), .ZN(\uut_master/n119 )
         );
  AND4_X2 \uut_master/U34  ( .A1(\uut_master/n141 ), .A2(\uut_master/n405 ), 
        .A3(\uut_master/n285 ), .A4(\uut_master/n404 ), .ZN(\uut_master/n122 )
         );
  BUF_X1 \uut_master/U33  ( .A(\uut_master/n409 ), .Z(\uut_master/n134 ) );
  CLKBUF_X1 \uut_master/U32  ( .A(\uut_master/n350 ), .Z(\uut_master/n181 ) );
  AND4_X2 \uut_master/U31  ( .A1(\uut_master/n284 ), .A2(\uut_master/n405 ), 
        .A3(\uut_master/n285 ), .A4(\uut_master/n404 ), .ZN(\uut_master/n157 )
         );
  CLKBUF_X1 \uut_master/U30  ( .A(\uut_master/current_state [1]), .Z(
        \uut_master/n117 ) );
  INV_X1 \uut_master/U29  ( .A(\uut_master/n125 ), .ZN(\uut_master/n116 ) );
  AND3_X2 \uut_master/U28  ( .A1(\uut_master/n197 ), .A2(
        \uut_master/clock_count ), .A3(\uut_master/n147 ), .ZN(
        \uut_master/n167 ) );
  AND3_X2 \uut_master/U27  ( .A1(\uut_master/n151 ), .A2(
        \uut_master/data_count_hi [0]), .A3(\uut_master/data_count_hi [1]), 
        .ZN(\uut_master/n160 ) );
  NAND2_X1 \uut_master/U26  ( .A1(\uut_master/n133 ), .A2(data_out[0]), .ZN(
        \uut_master/n171 ) );
  CLKBUF_X1 \uut_master/U25  ( .A(\uut_master/n115 ), .Z(\uut_master/n114 ) );
  INV_X1 \uut_master/U24  ( .A(\uut_master/n133 ), .ZN(\uut_master/n113 ) );
  OR2_X1 \uut_master/U23  ( .A1(\uut_master/n207 ), .A2(\uut_master/n194 ), 
        .ZN(\uut_master/n112 ) );
  INV_X1 \uut_master/U22  ( .A(\uut_master/n146 ), .ZN(\uut_master/n111 ) );
  BUF_X1 \uut_master/U21  ( .A(\uut_master/current_state [0]), .Z(
        \uut_master/n110 ) );
  CLKBUF_X3 \uut_master/U20  ( .A(\uut_master/n410 ), .Z(\uut_master/n144 ) );
  AND4_X2 \uut_master/U19  ( .A1(\uut_master/n141 ), .A2(\uut_master/n405 ), 
        .A3(\uut_master/n285 ), .A4(\uut_master/n404 ), .ZN(\uut_master/n44 )
         );
  BUF_X1 \uut_master/U18  ( .A(\uut_master/n409 ), .Z(\uut_master/n38 ) );
  BUF_X2 \uut_master/U17  ( .A(\uut_master/n126 ), .Z(\uut_master/n120 ) );
  BUF_X2 \uut_master/U16  ( .A(\uut_master/n126 ), .Z(\uut_master/n121 ) );
  AND4_X2 \uut_master/U15  ( .A1(\uut_master/n284 ), .A2(\uut_master/n405 ), 
        .A3(\uut_master/n285 ), .A4(\uut_master/n404 ), .ZN(\uut_master/n37 )
         );
  CLKBUF_X3 \uut_master/U14  ( .A(\uut_master/n126 ), .Z(\uut_master/n154 ) );
  BUF_X1 \uut_master/U13  ( .A(\uut_master/n167 ), .Z(\uut_master/n149 ) );
  BUF_X1 \uut_master/U12  ( .A(\uut_master/n167 ), .Z(\uut_master/n189 ) );
  BUF_X1 \uut_master/U11  ( .A(\uut_master/n167 ), .Z(\uut_master/n192 ) );
  BUF_X1 \uut_master/U10  ( .A(\uut_master/n167 ), .Z(\uut_master/n191 ) );
  BUF_X1 \uut_master/U9  ( .A(\uut_master/n167 ), .Z(\uut_master/n188 ) );
  BUF_X1 \uut_master/U8  ( .A(\uut_master/n167 ), .Z(\uut_master/n150 ) );
  OAI21_X1 \uut_master/U7  ( .B1(\uut_master/n3 ), .B2(\uut_master/n283 ), .A(
        \uut_master/n351 ), .ZN(\uut_master/n4 ) );
  AND2_X1 \uut_master/U6  ( .A1(\uut_master/n110 ), .A2(\uut_master/n114 ), 
        .ZN(\uut_master/n3 ) );
  BUF_X2 \uut_master/U5  ( .A(\uut_master/n443 ), .Z(sck) );
  BUF_X1 \uut_master/U4  ( .A(\uut_master/n168 ), .Z(\uut_master/n2 ) );
  CLKBUF_X1 \uut_master/U3  ( .A(\uut_master/n352 ), .Z(\uut_master/n1 ) );
  DFF_X2 \uut_master/data_save_reg[62]  ( .D(\uut_master/N218 ), .CK(clk), 
        .QN(\uut_master/n47 ) );
  DFF_X2 \uut_master/data_save_reg[56]  ( .D(\uut_master/N212 ), .CK(clk), 
        .QN(\uut_master/n53 ) );
  DFF_X1 \uut_master/data_save_reg[43]  ( .D(\uut_master/N199 ), .CK(clk), .Q(
        \uut_master/n375 ), .QN(\uut_master/n66 ) );
  DFF_X2 \uut_master/data_save_reg[63]  ( .D(\uut_master/N219 ), .CK(clk), 
        .QN(\uut_master/n46 ) );
  DFF_X1 \uut_master/data_save_reg[9]  ( .D(\uut_master/n434 ), .CK(clk), .Q(
        \uut_master/n304 ), .QN(\uut_master/n100 ) );
  DFF_X2 \uut_master/data_save_reg[37]  ( .D(\uut_master/N193 ), .CK(clk), .Q(
        \uut_master/n363 ), .QN(\uut_master/n72 ) );
  DFF_X1 \uut_master/data_save_reg[16]  ( .D(\uut_master/n427 ), .CK(clk), .Q(
        \uut_master/n318 ), .QN(\uut_master/n93 ) );
  DFF_X1 \uut_master/data_save_reg[28]  ( .D(\uut_master/n415 ), .CK(clk), .Q(
        \uut_master/n342 ), .QN(\uut_master/n81 ) );
  DFF_X1 \uut_master/data_save_reg[24]  ( .D(\uut_master/n419 ), .CK(clk), .Q(
        \uut_master/n334 ), .QN(\uut_master/n85 ) );
  DFF_X1 \uut_master/data_save_reg[20]  ( .D(\uut_master/n423 ), .CK(clk), .Q(
        \uut_master/n326 ), .QN(\uut_master/n89 ) );
  DFF_X1 \uut_master/data_save_reg[30]  ( .D(\uut_master/n413 ), .CK(clk), .Q(
        \uut_master/n346 ), .QN(\uut_master/n79 ) );
  DFF_X1 \uut_master/data_save_reg[22]  ( .D(\uut_master/n421 ), .CK(clk), .Q(
        \uut_master/n330 ), .QN(\uut_master/n87 ) );
  DFF_X1 \uut_master/data_save_reg[3]  ( .D(\uut_master/n440 ), .CK(clk), .Q(
        \uut_master/n292 ), .QN(\uut_master/n106 ) );
  DFF_X1 \uut_master/data_save_reg[12]  ( .D(\uut_master/n431 ), .CK(clk), .Q(
        \uut_master/n310 ), .QN(\uut_master/n97 ) );
  DFF_X1 \uut_master/data_save_reg[25]  ( .D(\uut_master/n418 ), .CK(clk), .Q(
        \uut_master/n336 ), .QN(\uut_master/n84 ) );
  DFF_X1 \uut_master/data_save_reg[26]  ( .D(\uut_master/n417 ), .CK(clk), .Q(
        \uut_master/n338 ), .QN(\uut_master/n83 ) );
  DFF_X1 \uut_master/data_save_reg[17]  ( .D(\uut_master/n426 ), .CK(clk), .Q(
        \uut_master/n320 ), .QN(\uut_master/n92 ) );
  DFF_X1 \uut_master/data_save_reg[31]  ( .D(\uut_master/n412 ), .CK(clk), .Q(
        \uut_master/n348 ), .QN(\uut_master/n78 ) );
  DFF_X1 \uut_master/data_save_reg[19]  ( .D(\uut_master/n424 ), .CK(clk), .Q(
        \uut_master/n324 ), .QN(\uut_master/n90 ) );
  DFF_X2 \uut_master/data_save_reg[4]  ( .D(\uut_master/n439 ), .CK(clk), .Q(
        \uut_master/n294 ), .QN(\uut_master/n105 ) );
  DFF_X2 \uut_master/data_save_reg[11]  ( .D(\uut_master/n432 ), .CK(clk), .Q(
        \uut_master/n308 ), .QN(\uut_master/n98 ) );
  DFF_X1 \uut_master/data_save_reg[13]  ( .D(\uut_master/n430 ), .CK(clk), .Q(
        \uut_master/n312 ), .QN(\uut_master/n96 ) );
  DFF_X1 \uut_master/data_save_reg[5]  ( .D(\uut_master/n438 ), .CK(clk), .Q(
        \uut_master/n296 ), .QN(\uut_master/n104 ) );
  DFF_X1 \uut_master/data_save_reg[27]  ( .D(\uut_master/n416 ), .CK(clk), .Q(
        \uut_master/n340 ), .QN(\uut_master/n82 ) );
  DFF_X1 \uut_master/data_save_reg[2]  ( .D(\uut_master/n441 ), .CK(clk), .Q(
        \uut_master/n290 ), .QN(\uut_master/n107 ) );
  DFF_X1 \uut_master/data_save_reg[42]  ( .D(\uut_master/N198 ), .CK(clk), .Q(
        \uut_master/n373 ), .QN(\uut_master/n67 ) );
  DFF_X1 \uut_master/data_save_reg[52]  ( .D(\uut_master/N208 ), .CK(clk), .Q(
        \uut_master/n393 ), .QN(\uut_master/n57 ) );
  DFF_X1 \uut_master/data_save_reg[58]  ( .D(\uut_master/N214 ), .CK(clk), 
        .QN(\uut_master/n51 ) );
  DFF_X1 \uut_master/data_save_reg[59]  ( .D(\uut_master/N215 ), .CK(clk), 
        .QN(\uut_master/n50 ) );
  DFF_X1 \uut_master/data_save_reg[60]  ( .D(\uut_master/N216 ), .CK(clk), 
        .QN(\uut_master/n49 ) );
  DFF_X1 \uut_master/data_save_reg[61]  ( .D(\uut_master/N217 ), .CK(clk), 
        .QN(\uut_master/n48 ) );
  DFF_X1 \uut_master/data_save_reg[57]  ( .D(\uut_master/N213 ), .CK(clk), 
        .QN(\uut_master/n52 ) );
  DFF_X1 \uut_master/data_save_reg[53]  ( .D(\uut_master/N209 ), .CK(clk), .Q(
        \uut_master/n395 ), .QN(\uut_master/n56 ) );
  DFF_X1 \uut_master/data_in_reg[11]  ( .D(\uut_master/n16 ), .CK(clk), .Q(
        data_out[11]), .QN(\uut_master/n240 ) );
  DFF_X1 \uut_master/data_in_reg[18]  ( .D(\uut_master/n23 ), .CK(clk), .Q(
        data_out[18]), .QN(\uut_master/n254 ) );
  DFF_X1 \uut_master/data_save_reg[8]  ( .D(\uut_master/n435 ), .CK(clk), .Q(
        \uut_master/n302 ), .QN(\uut_master/n101 ) );
  DFF_X1 \uut_master/data_save_reg[18]  ( .D(\uut_master/n425 ), .CK(clk), .Q(
        \uut_master/n322 ), .QN(\uut_master/n91 ) );
  DFF_X1 \uut_master/data_in_reg[0]  ( .D(\uut_master/n5 ), .CK(clk), .Q(
        data_out[0]) );
  DFF_X1 \uut_master/data_in_reg[1]  ( .D(\uut_master/n6 ), .CK(clk), .Q(
        data_out[1]), .QN(\uut_master/n220 ) );
  DFF_X1 \uut_master/data_in_reg[2]  ( .D(\uut_master/n7 ), .CK(clk), .Q(
        data_out[2]), .QN(\uut_master/n222 ) );
  DFF_X1 \uut_master/data_in_reg[3]  ( .D(\uut_master/n8 ), .CK(clk), .Q(
        data_out[3]), .QN(\uut_master/n224 ) );
  DFF_X1 \uut_master/data_in_reg[5]  ( .D(\uut_master/n10 ), .CK(clk), .Q(
        data_out[5]), .QN(\uut_master/n228 ) );
  DFF_X1 \uut_master/data_in_reg[7]  ( .D(\uut_master/n12 ), .CK(clk), .Q(
        data_out[7]), .QN(\uut_master/n232 ) );
  DFF_X1 \uut_master/data_in_reg[8]  ( .D(\uut_master/n13 ), .CK(clk), .Q(
        data_out[8]), .QN(\uut_master/n234 ) );
  DFF_X1 \uut_master/data_in_reg[9]  ( .D(\uut_master/n14 ), .CK(clk), .Q(
        data_out[9]), .QN(\uut_master/n236 ) );
  DFF_X1 \uut_master/data_in_reg[10]  ( .D(\uut_master/n15 ), .CK(clk), .Q(
        data_out[10]), .QN(\uut_master/n238 ) );
  DFF_X1 \uut_master/data_in_reg[12]  ( .D(\uut_master/n17 ), .CK(clk), .Q(
        data_out[12]), .QN(\uut_master/n242 ) );
  DFF_X1 \uut_master/data_in_reg[13]  ( .D(\uut_master/n18 ), .CK(clk), .Q(
        data_out[13]), .QN(\uut_master/n244 ) );
  DFF_X1 \uut_master/data_in_reg[14]  ( .D(\uut_master/n19 ), .CK(clk), .Q(
        data_out[14]), .QN(\uut_master/n246 ) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n21 ), .CK(clk), .Q(
        data_out[16]), .QN(\uut_master/n250 ) );
  DFF_X1 \uut_master/data_in_reg[17]  ( .D(\uut_master/n22 ), .CK(clk), .Q(
        data_out[17]), .QN(\uut_master/n252 ) );
  DFF_X1 \uut_master/data_in_reg[19]  ( .D(\uut_master/n24 ), .CK(clk), .Q(
        data_out[19]), .QN(\uut_master/n256 ) );
  DFF_X1 \uut_master/data_in_reg[20]  ( .D(\uut_master/n25 ), .CK(clk), .Q(
        data_out[20]), .QN(\uut_master/n258 ) );
  DFF_X1 \uut_master/data_in_reg[22]  ( .D(\uut_master/n27 ), .CK(clk), .Q(
        data_out[22]), .QN(\uut_master/n262 ) );
  DFF_X2 \uut_master/data_save_reg[29]  ( .D(\uut_master/n414 ), .CK(clk), .Q(
        \uut_master/n344 ), .QN(\uut_master/n80 ) );
  DFF_X2 \uut_master/data_save_reg[23]  ( .D(\uut_master/n420 ), .CK(clk), .Q(
        \uut_master/n332 ), .QN(\uut_master/n86 ) );
  DFF_X1 \uut_master/data_count_reg[2]  ( .D(\uut_master/N222 ), .CK(clk), .Q(
        \uut_master/n165 ), .QN(\uut_master/n42 ) );
  DFF_X1 \uut_master/data_count_reg[0]  ( .D(\uut_master/N220 ), .CK(clk), .Q(
        \uut_master/data_count_lo [0]), .QN(\uut_master/n202 ) );
  DFF_X1 \uut_master/current_state_reg[1]  ( .D(\uut_master/N349 ), .CK(clk), 
        .Q(\uut_master/current_state [1]), .QN(\uut_master/n115 ) );
  DFF_X1 \uut_master/data_count_reg[1]  ( .D(\uut_master/N221 ), .CK(clk), .Q(
        \uut_master/data_count_lo [1]), .QN(\uut_master/n43 ) );
  DFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/N348 ), .CK(clk), 
        .Q(\uut_master/current_state [0]), .QN(\uut_master/n168 ) );
  DFF_X1 \uut_master/data_in_reg[4]  ( .D(\uut_master/n9 ), .CK(clk), .Q(
        data_out[4]), .QN(\uut_master/n226 ) );
  DFF_X1 \uut_master/data_in_reg[6]  ( .D(\uut_master/n11 ), .CK(clk), .Q(
        data_out[6]), .QN(\uut_master/n230 ) );
  DFF_X1 \uut_master/data_in_reg[21]  ( .D(\uut_master/n26 ), .CK(clk), .Q(
        data_out[21]), .QN(\uut_master/n260 ) );
  DFF_X1 \uut_master/data_in_reg[25]  ( .D(\uut_master/n30 ), .CK(clk), .Q(
        data_out[25]), .QN(\uut_master/n268 ) );
  DFF_X1 \uut_master/data_in_reg[26]  ( .D(\uut_master/n31 ), .CK(clk), .Q(
        data_out[26]), .QN(\uut_master/n270 ) );
  DFF_X1 \uut_master/data_in_reg[27]  ( .D(\uut_master/n32 ), .CK(clk), .Q(
        data_out[27]), .QN(\uut_master/n272 ) );
  DFF_X1 \uut_master/data_in_reg[28]  ( .D(\uut_master/n33 ), .CK(clk), .Q(
        data_out[28]), .QN(\uut_master/n274 ) );
  DFF_X1 \uut_master/data_in_reg[29]  ( .D(\uut_master/n34 ), .CK(clk), .Q(
        data_out[29]), .QN(\uut_master/n276 ) );
  DFF_X1 \uut_master/data_in_reg[30]  ( .D(\uut_master/n35 ), .CK(clk), .Q(
        data_out[30]), .QN(\uut_master/n278 ) );
  DFF_X1 \uut_master/data_in_reg[31]  ( .D(\uut_master/n36 ), .CK(clk), .Q(
        data_out[31]), .QN(\uut_master/n281 ) );
  DFF_X1 \uut_master/data_end_reg  ( .D(\uut_master/N226 ), .CK(clk), .Q(
        \uut_master/n173 ), .QN(\uut_master/n45 ) );
  DFF_X1 \uut_master/clock_count_reg  ( .D(\uut_master/N17 ), .CK(clk), .Q(
        \uut_master/clock_count ), .QN(\uut_master/n174 ) );
  DFF_X1 \uut_master/data_count_reg[4]  ( .D(\uut_master/N224 ), .CK(clk), .Q(
        \uut_master/data_count_hi [1]), .QN(\uut_master/n40 ) );
  DFF_X1 \uut_master/data_count_reg[3]  ( .D(\uut_master/N223 ), .CK(clk), .Q(
        \uut_master/data_count_hi [0]), .QN(\uut_master/n41 ) );
  DFF_X1 \uut_master/data_save_reg[6]  ( .D(\uut_master/n437 ), .CK(clk), .Q(
        \uut_master/n298 ), .QN(\uut_master/n103 ) );
  DFF_X1 \uut_master/data_save_reg[15]  ( .D(\uut_master/n428 ), .CK(clk), .Q(
        \uut_master/n316 ), .QN(\uut_master/n94 ) );
  DFF_X1 \uut_master/data_save_reg[7]  ( .D(\uut_master/n436 ), .CK(clk), .Q(
        \uut_master/n300 ), .QN(\uut_master/n102 ) );
  DFF_X1 \uut_master/data_save_reg[21]  ( .D(\uut_master/n422 ), .CK(clk), .Q(
        \uut_master/n328 ), .QN(\uut_master/n88 ) );
  DFF_X1 \uut_master/data_save_reg[36]  ( .D(\uut_master/N192 ), .CK(clk), .Q(
        \uut_master/n361 ), .QN(\uut_master/n73 ) );
  DFF_X1 \uut_master/data_save_reg[38]  ( .D(\uut_master/N194 ), .CK(clk), .Q(
        \uut_master/n365 ), .QN(\uut_master/n71 ) );
  DFF_X1 \uut_master/data_save_reg[39]  ( .D(\uut_master/N195 ), .CK(clk), .Q(
        \uut_master/n367 ), .QN(\uut_master/n70 ) );
  DFF_X1 \uut_master/data_save_reg[40]  ( .D(\uut_master/N196 ), .CK(clk), .Q(
        \uut_master/n369 ), .QN(\uut_master/n69 ) );
  DFF_X1 \uut_master/data_save_reg[46]  ( .D(\uut_master/N202 ), .CK(clk), .Q(
        \uut_master/n381 ), .QN(\uut_master/n63 ) );
  DFF_X1 \uut_master/data_save_reg[1]  ( .D(\uut_master/n442 ), .CK(clk), .Q(
        \uut_master/n288 ), .QN(\uut_master/n108 ) );
  DFF_X1 \uut_master/data_save_reg[41]  ( .D(\uut_master/N197 ), .CK(clk), .Q(
        \uut_master/n371 ), .QN(\uut_master/n68 ) );
  DFF_X1 \uut_master/data_save_reg[44]  ( .D(\uut_master/N200 ), .CK(clk), .Q(
        \uut_master/n377 ), .QN(\uut_master/n65 ) );
  DFF_X1 \uut_master/data_save_reg[47]  ( .D(\uut_master/N203 ), .CK(clk), .Q(
        \uut_master/n383 ), .QN(\uut_master/n62 ) );
  DFF_X1 \uut_master/data_save_reg[48]  ( .D(\uut_master/N204 ), .CK(clk), .Q(
        \uut_master/n385 ), .QN(\uut_master/n61 ) );
  DFF_X1 \uut_master/data_save_reg[49]  ( .D(\uut_master/N205 ), .CK(clk), .Q(
        \uut_master/n387 ), .QN(\uut_master/n60 ) );
  DFF_X1 \uut_master/data_save_reg[50]  ( .D(\uut_master/N206 ), .CK(clk), .Q(
        \uut_master/n389 ), .QN(\uut_master/n59 ) );
  DFF_X1 \uut_master/data_save_reg[51]  ( .D(\uut_master/N207 ), .CK(clk), .Q(
        \uut_master/n391 ), .QN(\uut_master/n58 ) );
  DFF_X1 \uut_master/data_save_reg[10]  ( .D(\uut_master/n433 ), .CK(clk), .Q(
        \uut_master/n306 ), .QN(\uut_master/n99 ) );
  DFF_X1 \uut_master/data_save_reg[14]  ( .D(\uut_master/n429 ), .CK(clk), .Q(
        \uut_master/n314 ), .QN(\uut_master/n95 ) );
  DFF_X1 \uut_master/data_save_reg[0]  ( .D(\uut_master/N156 ), .CK(clk), .Q(
        \uut_master/n286 ), .QN(\uut_master/n109 ) );
  DFF_X1 \uut_master/data_save_reg[32]  ( .D(\uut_master/N188 ), .CK(clk), .Q(
        \uut_master/n353 ), .QN(\uut_master/n77 ) );
  DFF_X1 \uut_master/data_save_reg[33]  ( .D(\uut_master/N189 ), .CK(clk), .Q(
        \uut_master/n355 ), .QN(\uut_master/n76 ) );
  DFF_X1 \uut_master/data_save_reg[34]  ( .D(\uut_master/N190 ), .CK(clk), .Q(
        \uut_master/n357 ), .QN(\uut_master/n75 ) );
  DFF_X1 \uut_master/data_save_reg[35]  ( .D(\uut_master/N191 ), .CK(clk), .Q(
        \uut_master/n359 ), .QN(\uut_master/n74 ) );
  DFF_X1 \uut_master/data_save_reg[45]  ( .D(\uut_master/N201 ), .CK(clk), .Q(
        \uut_master/n379 ), .QN(\uut_master/n64 ) );
  DFF_X1 \uut_master/data_save_reg[55]  ( .D(\uut_master/N211 ), .CK(clk), .Q(
        \uut_master/n400 ), .QN(\uut_master/n54 ) );
  DFF_X1 \uut_master/data_save_reg[54]  ( .D(\uut_master/N210 ), .CK(clk), .Q(
        \uut_master/n397 ), .QN(\uut_master/n55 ) );
  DFF_X1 \uut_master/data_in_reg[15]  ( .D(\uut_master/n20 ), .CK(clk), .Q(
        data_out[15]), .QN(\uut_master/n248 ) );
  DFF_X1 \uut_master/data_in_reg[23]  ( .D(\uut_master/n28 ), .CK(clk), .Q(
        data_out[23]), .QN(\uut_master/n264 ) );
  DFF_X1 \uut_master/data_in_reg[24]  ( .D(\uut_master/n29 ), .CK(clk), .Q(
        data_out[24]), .QN(\uut_master/n266 ) );
  DFF_X1 \uut_master/data_count_reg[5]  ( .D(\uut_master/N225 ), .CK(clk), .Q(
        \uut_master/data_count_hi [2]), .QN(\uut_master/n39 ) );
  INV_X1 \uut_slave/U184  ( .A(\uut_slave/n257 ), .ZN(\uut_slave/n102 ) );
  OAI21_X1 \uut_slave/U183  ( .B1(\uut_slave/n256 ), .B2(\uut_slave/n255 ), 
        .A(\uut_slave/n254 ), .ZN(\uut_slave/n257 ) );
  AOI21_X1 \uut_slave/U182  ( .B1(\uut_slave/n253 ), .B2(\uut_slave/n252 ), 
        .A(\uut_slave/n97 ), .ZN(\uut_slave/n256 ) );
  OAI22_X1 \uut_slave/U181  ( .A1(\uut_slave/n14 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n13 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n194 ) );
  OAI22_X1 \uut_slave/U180  ( .A1(\uut_slave/n15 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n14 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n195 ) );
  OAI22_X1 \uut_slave/U179  ( .A1(\uut_slave/n16 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n15 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n196 ) );
  OAI22_X1 \uut_slave/U178  ( .A1(\uut_slave/n17 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n16 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n197 ) );
  OAI22_X1 \uut_slave/U177  ( .A1(\uut_slave/n18 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n17 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n198 ) );
  OAI22_X1 \uut_slave/U176  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n18 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n199 ) );
  OAI22_X1 \uut_slave/U175  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n19 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n200 ) );
  OAI22_X1 \uut_slave/U174  ( .A1(\uut_slave/n91 ), .A2(\uut_slave/n251 ), 
        .B1(\uut_slave/n20 ), .B2(\uut_slave/n99 ), .ZN(\uut_slave/n201 ) );
  NAND2_X1 \uut_slave/U173  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n259 ), 
        .ZN(\uut_slave/n251 ) );
  OAI21_X1 \uut_slave/U172  ( .B1(\uut_slave/data_count_hi [2]), .B2(
        \uut_slave/n253 ), .A(\uut_slave/n93 ), .ZN(\uut_slave/n250 ) );
  INV_X1 \uut_slave/U171  ( .A(mosi), .ZN(\uut_slave/n91 ) );
  OAI222_X1 \uut_slave/U170  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n54 ), .B2(\uut_slave/n117 ), .C1(\uut_slave/n53 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n130 ) );
  OAI222_X1 \uut_slave/U169  ( .A1(\uut_slave/n22 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n55 ), .B2(\uut_slave/n117 ), .C1(\uut_slave/n54 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n131 ) );
  OAI222_X1 \uut_slave/U168  ( .A1(\uut_slave/n23 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n56 ), .B2(\uut_slave/n117 ), .C1(\uut_slave/n55 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n132 ) );
  OAI222_X1 \uut_slave/U167  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n57 ), .B2(\uut_slave/n117 ), .C1(\uut_slave/n56 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n133 ) );
  OAI222_X1 \uut_slave/U166  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n58 ), .B2(\uut_slave/n117 ), .C1(\uut_slave/n57 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n134 ) );
  OAI222_X1 \uut_slave/U165  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n59 ), .B2(\uut_slave/n117 ), .C1(\uut_slave/n58 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n135 ) );
  OAI222_X1 \uut_slave/U164  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n60 ), .B2(\uut_slave/n117 ), .C1(\uut_slave/n59 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n136 ) );
  OAI222_X1 \uut_slave/U163  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n61 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n60 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n137 ) );
  OAI222_X1 \uut_slave/U162  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n62 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n61 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n138 ) );
  OAI222_X1 \uut_slave/U161  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n63 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n62 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n139 ) );
  OAI222_X1 \uut_slave/U160  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n64 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n63 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n140 ) );
  OAI222_X1 \uut_slave/U159  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n119 ), 
        .B1(\uut_slave/n65 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n64 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n141 ) );
  OAI222_X1 \uut_slave/U158  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n66 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n65 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n142 ) );
  OAI222_X1 \uut_slave/U157  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n67 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n66 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n143 ) );
  OAI222_X1 \uut_slave/U156  ( .A1(\uut_slave/n35 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n68 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n67 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n144 ) );
  OAI222_X1 \uut_slave/U155  ( .A1(\uut_slave/n36 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n69 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n68 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n145 ) );
  OAI222_X1 \uut_slave/U154  ( .A1(\uut_slave/n37 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n70 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n69 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n146 ) );
  OAI222_X1 \uut_slave/U153  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n71 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n70 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n147 ) );
  OAI222_X1 \uut_slave/U152  ( .A1(\uut_slave/n39 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n72 ), .B2(\uut_slave/n116 ), .C1(\uut_slave/n71 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n148 ) );
  OAI222_X1 \uut_slave/U151  ( .A1(\uut_slave/n40 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n73 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n72 ), 
        .C2(\uut_slave/n112 ), .ZN(\uut_slave/n149 ) );
  OAI222_X1 \uut_slave/U150  ( .A1(\uut_slave/n41 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n74 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n73 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n150 ) );
  OAI222_X1 \uut_slave/U149  ( .A1(\uut_slave/n42 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n75 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n74 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n151 ) );
  OAI222_X1 \uut_slave/U148  ( .A1(\uut_slave/n43 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n76 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n75 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n152 ) );
  OAI222_X1 \uut_slave/U147  ( .A1(\uut_slave/n44 ), .A2(\uut_slave/n120 ), 
        .B1(\uut_slave/n77 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n76 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n153 ) );
  OAI222_X1 \uut_slave/U146  ( .A1(\uut_slave/n45 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n78 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n77 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n154 ) );
  OAI222_X1 \uut_slave/U145  ( .A1(\uut_slave/n46 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n79 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n78 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n155 ) );
  OAI222_X1 \uut_slave/U144  ( .A1(\uut_slave/n47 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n80 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n79 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n156 ) );
  OAI222_X1 \uut_slave/U143  ( .A1(\uut_slave/n48 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n81 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n80 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n157 ) );
  OAI222_X1 \uut_slave/U142  ( .A1(\uut_slave/n49 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n82 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n81 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n158 ) );
  OAI222_X1 \uut_slave/U141  ( .A1(\uut_slave/n50 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n83 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n82 ), 
        .C2(\uut_slave/n113 ), .ZN(\uut_slave/n159 ) );
  OAI222_X1 \uut_slave/U140  ( .A1(\uut_slave/n51 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n84 ), .B2(\uut_slave/n115 ), .C1(\uut_slave/n83 ), 
        .C2(\uut_slave/n111 ), .ZN(\uut_slave/n160 ) );
  NAND3_X1 \uut_slave/U139  ( .A1(\uut_slave/n246 ), .A2(\uut_slave/n259 ), 
        .A3(\uut_slave/n111 ), .ZN(\uut_slave/n248 ) );
  OAI22_X1 \uut_slave/U138  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n121 ), 
        .B1(\uut_slave/n84 ), .B2(\uut_slave/n111 ), .ZN(\uut_slave/n161 ) );
  NAND3_X1 \uut_slave/U137  ( .A1(\uut_slave/n245 ), .A2(\uut_slave/n259 ), 
        .A3(\uut_slave/n111 ), .ZN(\uut_slave/n249 ) );
  OAI21_X1 \uut_slave/U136  ( .B1(\uut_slave/n244 ), .B2(\uut_slave/n243 ), 
        .A(\uut_slave/n259 ), .ZN(\uut_slave/n247 ) );
  AOI21_X1 \uut_slave/U135  ( .B1(\uut_slave/data_count_hi [2]), .B2(
        \uut_slave/n242 ), .A(\uut_slave/n245 ), .ZN(\uut_slave/n244 ) );
  NAND3_X1 \uut_slave/U134  ( .A1(\uut_slave/n211 ), .A2(\uut_slave/n241 ), 
        .A3(\uut_slave/n240 ), .ZN(\uut_slave/n242 ) );
  INV_X1 \uut_slave/U133  ( .A(\uut_slave/n239 ), .ZN(\uut_slave/n240 ) );
  INV_X1 \uut_slave/U132  ( .A(\uut_slave/n246 ), .ZN(\uut_slave/n245 ) );
  NAND2_X1 \uut_slave/U131  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n239 ), 
        .ZN(\uut_slave/n246 ) );
  OR2_X1 \uut_slave/U130  ( .A1(\uut_slave/data_count_lo [2]), .A2(
        \uut_slave/data_count_lo [1]), .ZN(\uut_slave/n239 ) );
  INV_X1 \uut_slave/U129  ( .A(\uut_slave/n253 ), .ZN(\uut_slave/n241 ) );
  INV_X1 \uut_slave/U128  ( .A(\uut_slave/n237 ), .ZN(\uut_slave/n258 ) );
  OAI22_X1 \uut_slave/U127  ( .A1(\uut_slave/n11 ), .A2(\uut_slave/n98 ), .B1(
        \uut_slave/n11 ), .B2(\uut_slave/n236 ), .ZN(\uut_slave/n237 ) );
  NOR3_X1 \uut_slave/U126  ( .A1(\uut_slave/n207 ), .A2(\uut_slave/n238 ), 
        .A3(\uut_slave/n235 ), .ZN(\uut_slave/n236 ) );
  OAI21_X1 \uut_slave/U125  ( .B1(\uut_slave/n12 ), .B2(\uut_slave/n255 ), .A(
        \uut_slave/n233 ), .ZN(\uut_slave/N143 ) );
  NAND3_X1 \uut_slave/U124  ( .A1(\uut_slave/n231 ), .A2(\uut_slave/n92 ), 
        .A3(\uut_slave/n232 ), .ZN(\uut_slave/n233 ) );
  INV_X1 \uut_slave/U123  ( .A(\uut_slave/n254 ), .ZN(\uut_slave/n232 ) );
  NAND2_X1 \uut_slave/U122  ( .A1(\uut_slave/n243 ), .A2(\uut_slave/n259 ), 
        .ZN(\uut_slave/n254 ) );
  NOR3_X1 \uut_slave/U121  ( .A1(\uut_slave/n2 ), .A2(\uut_slave/n243 ), .A3(
        \uut_slave/n230 ), .ZN(\uut_slave/data_end_next ) );
  NAND2_X1 \uut_slave/U120  ( .A1(\uut_slave/n229 ), .A2(\uut_slave/n228 ), 
        .ZN(\uut_slave/n203 ) );
  NAND4_X1 \uut_slave/U119  ( .A1(\uut_slave/n227 ), .A2(\uut_slave/n238 ), 
        .A3(\uut_slave/n98 ), .A4(\uut_slave/n226 ), .ZN(\uut_slave/n228 ) );
  AOI221_X1 \uut_slave/U118  ( .B1(\uut_slave/n89 ), .B2(\uut_slave/n225 ), 
        .C1(\uut_slave/n235 ), .C2(\uut_slave/data_count_hi [1]), .A(
        \uut_slave/n224 ), .ZN(\uut_slave/n229 ) );
  NOR3_X1 \uut_slave/U117  ( .A1(\uut_slave/n255 ), .A2(\uut_slave/n238 ), 
        .A3(sck), .ZN(\uut_slave/n224 ) );
  INV_X1 \uut_slave/U116  ( .A(\uut_slave/n227 ), .ZN(\uut_slave/n235 ) );
  NAND2_X1 \uut_slave/U115  ( .A1(\uut_slave/n106 ), .A2(\uut_slave/n223 ), 
        .ZN(\uut_slave/n227 ) );
  NOR3_X1 \uut_slave/U114  ( .A1(\uut_slave/n255 ), .A2(\uut_slave/n238 ), 
        .A3(\uut_slave/n222 ), .ZN(\uut_slave/n225 ) );
  OAI221_X1 \uut_slave/U113  ( .B1(\uut_slave/n221 ), .B2(\uut_slave/n8 ), 
        .C1(\uut_slave/n5 ), .C2(\uut_slave/n220 ), .A(\uut_slave/n219 ), .ZN(
        \uut_slave/n202 ) );
  NAND3_X1 \uut_slave/U112  ( .A1(\uut_slave/n223 ), .A2(\uut_slave/n222 ), 
        .A3(\uut_slave/n94 ), .ZN(\uut_slave/n219 ) );
  INV_X1 \uut_slave/U111  ( .A(\uut_slave/n8 ), .ZN(\uut_slave/n222 ) );
  NAND4_X1 \uut_slave/U110  ( .A1(\uut_slave/n8 ), .A2(\uut_slave/n88 ), .A3(
        \uut_slave/n93 ), .A4(\uut_slave/n230 ), .ZN(\uut_slave/n220 ) );
  OAI211_X1 \uut_slave/U109  ( .C1(\uut_slave/n6 ), .C2(\uut_slave/n218 ), .A(
        \uut_slave/n217 ), .B(\uut_slave/n216 ), .ZN(\uut_slave/n206 ) );
  NAND3_X1 \uut_slave/U108  ( .A1(\uut_slave/n94 ), .A2(\uut_slave/n215 ), 
        .A3(\uut_slave/n1 ), .ZN(\uut_slave/n216 ) );
  OAI22_X1 \uut_slave/U107  ( .A1(\uut_slave/n9 ), .A2(
        \uut_slave/data_count_lo [1]), .B1(\uut_slave/n9 ), .B2(
        \uut_slave/data_count_lo [0]), .ZN(\uut_slave/n215 ) );
  NAND3_X1 \uut_slave/U106  ( .A1(\uut_slave/n96 ), .A2(
        \uut_slave/data_count_lo [2]), .A3(\uut_slave/n93 ), .ZN(
        \uut_slave/n217 ) );
  NAND4_X1 \uut_slave/U105  ( .A1(\uut_slave/n7 ), .A2(\uut_slave/n94 ), .A3(
        \uut_slave/n9 ), .A4(\uut_slave/data_count_lo [1]), .ZN(
        \uut_slave/n218 ) );
  OAI22_X1 \uut_slave/U104  ( .A1(\uut_slave/n214 ), .A2(\uut_slave/n6 ), .B1(
        \uut_slave/n213 ), .B2(\uut_slave/n210 ), .ZN(\uut_slave/n204 ) );
  AOI22_X1 \uut_slave/U103  ( .A1(\uut_slave/n212 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n94 ), .B2(\uut_slave/n96 ), .ZN(\uut_slave/n213 ) );
  NOR2_X1 \uut_slave/U102  ( .A1(\uut_slave/n105 ), .A2(\uut_slave/n255 ), 
        .ZN(\uut_slave/n212 ) );
  NAND4_X1 \uut_slave/U101  ( .A1(\uut_slave/n7 ), .A2(\uut_slave/n210 ), .A3(
        \uut_slave/n93 ), .A4(\uut_slave/n89 ), .ZN(\uut_slave/n214 ) );
  NAND2_X1 \uut_slave/U100  ( .A1(sck), .A2(\uut_slave/n105 ), .ZN(
        \uut_slave/n234 ) );
  NAND4_X1 \uut_slave/U99  ( .A1(\uut_slave/data_count_hi [0]), .A2(
        \uut_slave/data_count_hi [1]), .A3(\uut_slave/n88 ), .A4(
        \uut_slave/data_count_hi [2]), .ZN(\uut_slave/n230 ) );
  NAND3_X1 \uut_slave/U98  ( .A1(\uut_slave/data_count_lo [0]), .A2(
        \uut_slave/data_count_lo [1]), .A3(\uut_slave/data_count_lo [2]), .ZN(
        \uut_slave/n223 ) );
  NAND2_X1 \uut_slave/U97  ( .A1(\uut_slave/n2 ), .A2(\uut_slave/n93 ), .ZN(
        \uut_slave/n221 ) );
  OAI21_X1 \uut_slave/U96  ( .B1(\uut_slave/n211 ), .B2(\uut_slave/n226 ), .A(
        \uut_slave/n209 ), .ZN(\uut_slave/n205 ) );
  NAND3_X1 \uut_slave/U95  ( .A1(\uut_slave/n86 ), .A2(\uut_slave/n211 ), .A3(
        \uut_slave/n94 ), .ZN(\uut_slave/n209 ) );
  NAND2_X1 \uut_slave/U94  ( .A1(\uut_slave/n207 ), .A2(\uut_slave/n94 ), .ZN(
        \uut_slave/n226 ) );
  NAND2_X1 \uut_slave/U93  ( .A1(\uut_slave/n208 ), .A2(\uut_slave/n255 ), 
        .ZN(\uut_slave/N144 ) );
  OAI211_X1 \uut_slave/U92  ( .C1(\uut_slave/n92 ), .C2(\uut_slave/n87 ), .A(
        \uut_slave/n231 ), .B(\uut_slave/n259 ), .ZN(\uut_slave/n208 ) );
  INV_X1 \uut_slave/U91  ( .A(cs), .ZN(\uut_slave/n231 ) );
  INV_X1 \uut_slave/U90  ( .A(sck), .ZN(\uut_slave/n207 ) );
  CLKBUF_X1 \uut_slave/U89  ( .A(\uut_slave/n96 ), .Z(\uut_slave/n101 ) );
  NOR2_X1 \uut_slave/U88  ( .A1(\uut_slave/n14 ), .A2(\uut_slave/n13 ), .ZN(
        \uut_slave/n107 ) );
  OR2_X1 \uut_slave/U87  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n15 ), .ZN(
        \uut_slave/n100 ) );
  NOR2_X1 \uut_slave/U86  ( .A1(\uut_slave/n100 ), .A2(\uut_slave/n20 ), .ZN(
        \uut_slave/n108 ) );
  OR2_X1 \uut_slave/U85  ( .A1(\uut_slave/data_count_hi [1]), .A2(
        \uut_slave/data_count_hi [0]), .ZN(\uut_slave/n253 ) );
  AND2_X1 \uut_slave/U84  ( .A1(\uut_slave/n250 ), .A2(\uut_slave/n254 ), .ZN(
        \uut_slave/n99 ) );
  OAI22_X1 \uut_slave/U83  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n52 ), .B1(
        \uut_slave/n126 ), .B2(\uut_slave/n91 ), .ZN(\uut_slave/n193 ) );
  OAI22_X1 \uut_slave/U82  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n51 ), .B1(
        \uut_slave/n52 ), .B2(\uut_slave/n126 ), .ZN(\uut_slave/n192 ) );
  OAI22_X1 \uut_slave/U81  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n38 ), .B1(
        \uut_slave/n39 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n179 ) );
  OAI22_X1 \uut_slave/U80  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n37 ), .B1(
        \uut_slave/n38 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n178 ) );
  OAI22_X1 \uut_slave/U79  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n36 ), .B1(
        \uut_slave/n37 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n177 ) );
  OAI22_X1 \uut_slave/U78  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n35 ), .B1(
        \uut_slave/n36 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n176 ) );
  OAI22_X1 \uut_slave/U77  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n34 ), .B1(
        \uut_slave/n35 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n175 ) );
  OAI22_X1 \uut_slave/U76  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n33 ), .B1(
        \uut_slave/n34 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n174 ) );
  OAI22_X1 \uut_slave/U75  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n32 ), .B1(
        \uut_slave/n33 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n173 ) );
  OAI22_X1 \uut_slave/U74  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n31 ), .B1(
        \uut_slave/n32 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n172 ) );
  OAI22_X1 \uut_slave/U73  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n30 ), .B1(
        \uut_slave/n31 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n171 ) );
  OAI22_X1 \uut_slave/U72  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n29 ), .B1(
        \uut_slave/n30 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n170 ) );
  OAI22_X1 \uut_slave/U71  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n28 ), .B1(
        \uut_slave/n29 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n169 ) );
  OAI22_X1 \uut_slave/U70  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n27 ), .B1(
        \uut_slave/n28 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n168 ) );
  OAI22_X1 \uut_slave/U69  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n26 ), .B1(
        \uut_slave/n27 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n167 ) );
  OAI22_X1 \uut_slave/U68  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n25 ), .B1(
        \uut_slave/n26 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n166 ) );
  OAI22_X1 \uut_slave/U67  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n24 ), .B1(
        \uut_slave/n25 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n165 ) );
  OAI22_X1 \uut_slave/U66  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n23 ), .B1(
        \uut_slave/n24 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n164 ) );
  OAI22_X1 \uut_slave/U65  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n22 ), .B1(
        \uut_slave/n23 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n163 ) );
  OAI22_X1 \uut_slave/U64  ( .A1(\uut_slave/n127 ), .A2(\uut_slave/n21 ), .B1(
        \uut_slave/n22 ), .B2(\uut_slave/n124 ), .ZN(\uut_slave/n162 ) );
  OAI22_X1 \uut_slave/U63  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n50 ), .B1(
        \uut_slave/n51 ), .B2(\uut_slave/n126 ), .ZN(\uut_slave/n191 ) );
  OAI22_X1 \uut_slave/U62  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n49 ), .B1(
        \uut_slave/n50 ), .B2(\uut_slave/n126 ), .ZN(\uut_slave/n190 ) );
  OAI22_X1 \uut_slave/U61  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n48 ), .B1(
        \uut_slave/n49 ), .B2(\uut_slave/n126 ), .ZN(\uut_slave/n189 ) );
  OAI22_X1 \uut_slave/U60  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n47 ), .B1(
        \uut_slave/n48 ), .B2(\uut_slave/n126 ), .ZN(\uut_slave/n188 ) );
  OAI22_X1 \uut_slave/U59  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n46 ), .B1(
        \uut_slave/n47 ), .B2(\uut_slave/n126 ), .ZN(\uut_slave/n187 ) );
  OAI22_X1 \uut_slave/U58  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n45 ), .B1(
        \uut_slave/n46 ), .B2(\uut_slave/n126 ), .ZN(\uut_slave/n186 ) );
  OAI22_X1 \uut_slave/U57  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n44 ), .B1(
        \uut_slave/n45 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n185 ) );
  OAI22_X1 \uut_slave/U56  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n43 ), .B1(
        \uut_slave/n44 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n184 ) );
  OAI22_X1 \uut_slave/U55  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n42 ), .B1(
        \uut_slave/n43 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n183 ) );
  OAI22_X1 \uut_slave/U54  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n41 ), .B1(
        \uut_slave/n42 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n182 ) );
  OAI22_X1 \uut_slave/U53  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n40 ), .B1(
        \uut_slave/n41 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n181 ) );
  OAI22_X1 \uut_slave/U52  ( .A1(\uut_slave/n128 ), .A2(\uut_slave/n39 ), .B1(
        \uut_slave/n40 ), .B2(\uut_slave/n125 ), .ZN(\uut_slave/n180 ) );
  INV_X1 \uut_slave/U51  ( .A(rst), .ZN(\uut_slave/n259 ) );
  NOR2_X1 \uut_slave/U50  ( .A1(\uut_slave/n53 ), .A2(\uut_slave/n252 ), .ZN(
        \uut_slave/n110 ) );
  AND3_X1 \uut_slave/U49  ( .A1(\uut_slave/data_count_hi [0]), .A2(
        \uut_slave/n94 ), .A3(\uut_slave/n230 ), .ZN(\uut_slave/n98 ) );
  AND4_X1 \uut_slave/U48  ( .A1(\uut_slave/command_save [3]), .A2(
        \uut_slave/n106 ), .A3(\uut_slave/command_save [4]), .A4(
        \uut_slave/command_save [2]), .ZN(\uut_slave/n109 ) );
  AND4_X1 \uut_slave/U47  ( .A1(\uut_slave/n107 ), .A2(\uut_slave/n108 ), .A3(
        \uut_slave/n109 ), .A4(\uut_slave/n110 ), .ZN(miso) );
  BUF_X1 \uut_slave/U46  ( .A(\uut_slave/n114 ), .Z(\uut_slave/n113 ) );
  BUF_X1 \uut_slave/U45  ( .A(\uut_slave/n114 ), .Z(\uut_slave/n112 ) );
  BUF_X1 \uut_slave/U44  ( .A(\uut_slave/n114 ), .Z(\uut_slave/n111 ) );
  BUF_X1 \uut_slave/U43  ( .A(\uut_slave/n102 ), .Z(\uut_slave/n129 ) );
  BUF_X1 \uut_slave/U42  ( .A(\uut_slave/n102 ), .Z(\uut_slave/n128 ) );
  BUF_X1 \uut_slave/U41  ( .A(\uut_slave/n102 ), .Z(\uut_slave/n127 ) );
  NAND2_X1 \uut_slave/U40  ( .A1(\uut_slave/n129 ), .A2(\uut_slave/n259 ), 
        .ZN(\uut_slave/n103 ) );
  NAND2_X1 \uut_slave/U39  ( .A1(\uut_slave/n3 ), .A2(\uut_slave/n259 ), .ZN(
        \uut_slave/n255 ) );
  BUF_X1 \uut_slave/U38  ( .A(\uut_slave/n118 ), .Z(\uut_slave/n117 ) );
  BUF_X1 \uut_slave/U37  ( .A(\uut_slave/n122 ), .Z(\uut_slave/n121 ) );
  BUF_X1 \uut_slave/U36  ( .A(\uut_slave/n122 ), .Z(\uut_slave/n120 ) );
  BUF_X1 \uut_slave/U35  ( .A(\uut_slave/n122 ), .Z(\uut_slave/n119 ) );
  BUF_X1 \uut_slave/U34  ( .A(\uut_slave/n118 ), .Z(\uut_slave/n115 ) );
  BUF_X1 \uut_slave/U33  ( .A(\uut_slave/n118 ), .Z(\uut_slave/n116 ) );
  BUF_X1 \uut_slave/U32  ( .A(\uut_slave/n123 ), .Z(\uut_slave/n126 ) );
  BUF_X1 \uut_slave/U31  ( .A(\uut_slave/n123 ), .Z(\uut_slave/n125 ) );
  BUF_X1 \uut_slave/U30  ( .A(\uut_slave/n123 ), .Z(\uut_slave/n124 ) );
  AND2_X1 \uut_slave/U29  ( .A1(\uut_slave/n252 ), .A2(\uut_slave/n241 ), .ZN(
        \uut_slave/n97 ) );
  BUF_X1 \uut_slave/U28  ( .A(\uut_slave/n247 ), .Z(\uut_slave/n114 ) );
  BUF_X1 \uut_slave/U27  ( .A(\uut_slave/n103 ), .Z(\uut_slave/n123 ) );
  BUF_X1 \uut_slave/U26  ( .A(\uut_slave/n249 ), .Z(\uut_slave/n122 ) );
  BUF_X1 \uut_slave/U25  ( .A(\uut_slave/n248 ), .Z(\uut_slave/n118 ) );
  INV_X1 \uut_slave/U24  ( .A(sck), .ZN(\uut_slave/n96 ) );
  AND3_X1 \uut_slave/U23  ( .A1(\uut_slave/data_count_hi [2]), .A2(
        \uut_slave/data_count_hi [1]), .A3(\uut_slave/data_count_hi [0]), .ZN(
        \uut_slave/n95 ) );
  AND2_X1 \uut_slave/U22  ( .A1(\uut_slave/n85 ), .A2(\uut_slave/n259 ), .ZN(
        \uut_slave/n106 ) );
  AND2_X2 \uut_slave/U21  ( .A1(\uut_slave/n4 ), .A2(\uut_slave/n259 ), .ZN(
        \uut_slave/n94 ) );
  INV_X1 \uut_slave/U20  ( .A(\uut_slave/n90 ), .ZN(\uut_slave/n92 ) );
  NAND2_X1 \uut_slave/U19  ( .A1(sck), .A2(\uut_slave/n105 ), .ZN(
        \uut_slave/n89 ) );
  AND3_X2 \uut_slave/U18  ( .A1(\uut_slave/data_count_lo [0]), .A2(
        \uut_slave/n10 ), .A3(\uut_slave/data_count_lo [2]), .ZN(
        \uut_slave/n88 ) );
  INV_X1 \uut_slave/U17  ( .A(\uut_slave/n2 ), .ZN(\uut_slave/n86 ) );
  INV_X1 \uut_slave/U16  ( .A(\uut_slave/n210 ), .ZN(\uut_slave/n10 ) );
  CLKBUF_X1 \uut_slave/U15  ( .A(\uut_slave/data_count_lo [0]), .Z(
        \uut_slave/n7 ) );
  AND2_X1 \uut_slave/U14  ( .A1(\uut_slave/n96 ), .A2(\uut_slave/n93 ), .ZN(
        \uut_slave/n6 ) );
  AND2_X1 \uut_slave/U13  ( .A1(\uut_slave/n94 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n5 ) );
  AND2_X1 \uut_slave/U12  ( .A1(\uut_slave/n4 ), .A2(\uut_slave/n259 ), .ZN(
        \uut_slave/n93 ) );
  INV_X1 \uut_slave/U11  ( .A(\uut_slave/n3 ), .ZN(\uut_slave/n243 ) );
  INV_X2 \uut_slave/U10  ( .A(\uut_slave/n101 ), .ZN(\uut_slave/n104 ) );
  AND2_X1 \uut_slave/U9  ( .A1(\uut_slave/current_state[1] ), .A2(
        \uut_slave/n87 ), .ZN(\uut_slave/n85 ) );
  AND2_X1 \uut_slave/U8  ( .A1(\uut_slave/current_state[1] ), .A2(
        \uut_slave/n87 ), .ZN(\uut_slave/n4 ) );
  AND2_X1 \uut_slave/U7  ( .A1(\uut_slave/current_state[1] ), .A2(
        \uut_slave/n87 ), .ZN(\uut_slave/n3 ) );
  AND2_X2 \uut_slave/U6  ( .A1(\uut_slave/n88 ), .A2(\uut_slave/n95 ), .ZN(
        \uut_slave/n105 ) );
  INV_X1 \uut_slave/U5  ( .A(sck), .ZN(\uut_slave/n2 ) );
  AND3_X2 \uut_slave/U4  ( .A1(\uut_slave/n234 ), .A2(
        \uut_slave/data_count_hi [2]), .A3(\uut_slave/n93 ), .ZN(
        \uut_slave/n11 ) );
  BUF_X1 \uut_slave/U3  ( .A(\uut_slave/n234 ), .Z(\uut_slave/n1 ) );
  DFF_X1 \uut_slave/data_count_reg[5]  ( .D(\uut_slave/n258 ), .CK(clk), .Q(
        \uut_slave/data_count_hi [2]), .QN(\uut_slave/n252 ) );
  DFF_X1 \uut_slave/data_count_reg[2]  ( .D(\uut_slave/n206 ), .CK(clk), .Q(
        \uut_slave/data_count_lo [2]), .QN(\uut_slave/n9 ) );
  DFF_X1 \uut_slave/data_count_reg[0]  ( .D(\uut_slave/n205 ), .CK(clk), .Q(
        \uut_slave/data_count_lo [0]), .QN(\uut_slave/n211 ) );
  DFF_X1 \uut_slave/data_count_reg[1]  ( .D(\uut_slave/n204 ), .CK(clk), .Q(
        \uut_slave/data_count_lo [1]), .QN(\uut_slave/n210 ) );
  DFF_X1 \uut_slave/data_count_reg[4]  ( .D(\uut_slave/n203 ), .CK(clk), .Q(
        \uut_slave/data_count_hi [1]), .QN(\uut_slave/n238 ) );
  DFF_X1 \uut_slave/data_end_reg  ( .D(\uut_slave/data_end_next ), .CK(clk), 
        .QN(\uut_slave/n12 ) );
  DFF_X1 \uut_slave/command_save_reg[7]  ( .D(\uut_slave/n194 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n13 ) );
  DFF_X1 \uut_slave/command_save_reg[6]  ( .D(\uut_slave/n195 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n14 ) );
  DFF_X1 \uut_slave/command_save_reg[5]  ( .D(\uut_slave/n196 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n15 ) );
  DFF_X1 \uut_slave/command_save_reg[4]  ( .D(\uut_slave/n197 ), .CK(
        \uut_slave/n104 ), .Q(\uut_slave/command_save [4]), .QN(
        \uut_slave/n16 ) );
  DFF_X1 \uut_slave/command_save_reg[3]  ( .D(\uut_slave/n198 ), .CK(
        \uut_slave/n104 ), .Q(\uut_slave/command_save [3]), .QN(
        \uut_slave/n17 ) );
  DFF_X1 \uut_slave/command_save_reg[2]  ( .D(\uut_slave/n199 ), .CK(
        \uut_slave/n104 ), .Q(\uut_slave/command_save [2]), .QN(
        \uut_slave/n18 ) );
  DFF_X1 \uut_slave/command_save_reg[1]  ( .D(\uut_slave/n200 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n19 ) );
  DFF_X1 \uut_slave/command_save_reg[0]  ( .D(\uut_slave/n201 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n20 ) );
  DFF_X1 \uut_slave/data_out_reg[31]  ( .D(\uut_slave/n130 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n53 ) );
  DFF_X1 \uut_slave/data_save_reg[31]  ( .D(\uut_slave/n162 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n21 ) );
  DFF_X1 \uut_slave/data_out_reg[30]  ( .D(\uut_slave/n131 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n54 ) );
  DFF_X1 \uut_slave/data_save_reg[30]  ( .D(\uut_slave/n163 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n22 ) );
  DFF_X1 \uut_slave/data_out_reg[29]  ( .D(\uut_slave/n132 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n55 ) );
  DFF_X1 \uut_slave/data_save_reg[29]  ( .D(\uut_slave/n164 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n23 ) );
  DFF_X1 \uut_slave/data_out_reg[28]  ( .D(\uut_slave/n133 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n56 ) );
  DFF_X1 \uut_slave/data_save_reg[28]  ( .D(\uut_slave/n165 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n24 ) );
  DFF_X1 \uut_slave/data_out_reg[27]  ( .D(\uut_slave/n134 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n57 ) );
  DFF_X1 \uut_slave/data_save_reg[27]  ( .D(\uut_slave/n166 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n25 ) );
  DFF_X1 \uut_slave/data_out_reg[26]  ( .D(\uut_slave/n135 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n58 ) );
  DFF_X1 \uut_slave/data_save_reg[26]  ( .D(\uut_slave/n167 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n26 ) );
  DFF_X1 \uut_slave/data_out_reg[25]  ( .D(\uut_slave/n136 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n59 ) );
  DFF_X1 \uut_slave/data_save_reg[25]  ( .D(\uut_slave/n168 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n27 ) );
  DFF_X1 \uut_slave/data_out_reg[24]  ( .D(\uut_slave/n137 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n60 ) );
  DFF_X1 \uut_slave/data_save_reg[24]  ( .D(\uut_slave/n169 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n28 ) );
  DFF_X1 \uut_slave/data_out_reg[23]  ( .D(\uut_slave/n138 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n61 ) );
  DFF_X1 \uut_slave/data_save_reg[23]  ( .D(\uut_slave/n170 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n29 ) );
  DFF_X1 \uut_slave/data_out_reg[22]  ( .D(\uut_slave/n139 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n62 ) );
  DFF_X1 \uut_slave/data_save_reg[22]  ( .D(\uut_slave/n171 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n30 ) );
  DFF_X1 \uut_slave/data_out_reg[21]  ( .D(\uut_slave/n140 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n63 ) );
  DFF_X1 \uut_slave/data_save_reg[21]  ( .D(\uut_slave/n172 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n31 ) );
  DFF_X1 \uut_slave/data_out_reg[20]  ( .D(\uut_slave/n141 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n64 ) );
  DFF_X1 \uut_slave/data_save_reg[20]  ( .D(\uut_slave/n173 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n32 ) );
  DFF_X1 \uut_slave/data_out_reg[19]  ( .D(\uut_slave/n142 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n65 ) );
  DFF_X1 \uut_slave/data_save_reg[19]  ( .D(\uut_slave/n174 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n33 ) );
  DFF_X1 \uut_slave/data_out_reg[18]  ( .D(\uut_slave/n143 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n66 ) );
  DFF_X1 \uut_slave/data_save_reg[18]  ( .D(\uut_slave/n175 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n34 ) );
  DFF_X1 \uut_slave/data_out_reg[17]  ( .D(\uut_slave/n144 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n67 ) );
  DFF_X1 \uut_slave/data_save_reg[17]  ( .D(\uut_slave/n176 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n35 ) );
  DFF_X1 \uut_slave/data_out_reg[16]  ( .D(\uut_slave/n145 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n68 ) );
  DFF_X1 \uut_slave/data_save_reg[16]  ( .D(\uut_slave/n177 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n36 ) );
  DFF_X1 \uut_slave/data_out_reg[15]  ( .D(\uut_slave/n146 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n69 ) );
  DFF_X1 \uut_slave/data_save_reg[15]  ( .D(\uut_slave/n178 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n37 ) );
  DFF_X1 \uut_slave/data_out_reg[14]  ( .D(\uut_slave/n147 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n70 ) );
  DFF_X1 \uut_slave/data_save_reg[14]  ( .D(\uut_slave/n179 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n38 ) );
  DFF_X1 \uut_slave/data_out_reg[13]  ( .D(\uut_slave/n148 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n71 ) );
  DFF_X1 \uut_slave/data_save_reg[13]  ( .D(\uut_slave/n180 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n39 ) );
  DFF_X1 \uut_slave/data_out_reg[12]  ( .D(\uut_slave/n149 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n72 ) );
  DFF_X1 \uut_slave/data_save_reg[12]  ( .D(\uut_slave/n181 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n40 ) );
  DFF_X1 \uut_slave/data_out_reg[11]  ( .D(\uut_slave/n150 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n73 ) );
  DFF_X1 \uut_slave/data_save_reg[11]  ( .D(\uut_slave/n182 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n41 ) );
  DFF_X1 \uut_slave/data_out_reg[10]  ( .D(\uut_slave/n151 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n74 ) );
  DFF_X1 \uut_slave/data_save_reg[10]  ( .D(\uut_slave/n183 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n42 ) );
  DFF_X1 \uut_slave/data_out_reg[9]  ( .D(\uut_slave/n152 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n75 ) );
  DFF_X1 \uut_slave/data_save_reg[9]  ( .D(\uut_slave/n184 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n43 ) );
  DFF_X1 \uut_slave/data_out_reg[8]  ( .D(\uut_slave/n153 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n76 ) );
  DFF_X1 \uut_slave/data_save_reg[8]  ( .D(\uut_slave/n185 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n44 ) );
  DFF_X1 \uut_slave/data_out_reg[7]  ( .D(\uut_slave/n154 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n77 ) );
  DFF_X1 \uut_slave/data_save_reg[7]  ( .D(\uut_slave/n186 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n45 ) );
  DFF_X1 \uut_slave/data_out_reg[6]  ( .D(\uut_slave/n155 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n78 ) );
  DFF_X1 \uut_slave/data_save_reg[6]  ( .D(\uut_slave/n187 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n46 ) );
  DFF_X1 \uut_slave/data_out_reg[5]  ( .D(\uut_slave/n156 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n79 ) );
  DFF_X1 \uut_slave/data_save_reg[5]  ( .D(\uut_slave/n188 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n47 ) );
  DFF_X1 \uut_slave/data_out_reg[4]  ( .D(\uut_slave/n157 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n80 ) );
  DFF_X1 \uut_slave/data_save_reg[4]  ( .D(\uut_slave/n189 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n48 ) );
  DFF_X1 \uut_slave/data_out_reg[3]  ( .D(\uut_slave/n158 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n81 ) );
  DFF_X1 \uut_slave/data_save_reg[3]  ( .D(\uut_slave/n190 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n49 ) );
  DFF_X1 \uut_slave/data_out_reg[2]  ( .D(\uut_slave/n159 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n82 ) );
  DFF_X1 \uut_slave/data_save_reg[2]  ( .D(\uut_slave/n191 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n50 ) );
  DFF_X1 \uut_slave/data_out_reg[1]  ( .D(\uut_slave/n160 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n83 ) );
  DFF_X1 \uut_slave/data_save_reg[1]  ( .D(\uut_slave/n192 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n51 ) );
  DFF_X1 \uut_slave/data_out_reg[0]  ( .D(\uut_slave/n161 ), .CK(
        \uut_slave/n101 ), .QN(\uut_slave/n84 ) );
  DFF_X1 \uut_slave/data_save_reg[0]  ( .D(\uut_slave/n193 ), .CK(
        \uut_slave/n104 ), .QN(\uut_slave/n52 ) );
  DFF_X1 \uut_slave/data_count_reg[3]  ( .D(\uut_slave/n202 ), .CK(clk), .Q(
        \uut_slave/data_count_hi [0]), .QN(\uut_slave/n8 ) );
  DFF_X1 \uut_slave/current_state_reg[1]  ( .D(\uut_slave/N144 ), .CK(clk), 
        .Q(\uut_slave/current_state[1] ), .QN(\uut_slave/n90 ) );
  DFF_X1 \uut_slave/current_state_reg[0]  ( .D(\uut_slave/N143 ), .CK(clk), 
        .QN(\uut_slave/n87 ) );
endmodule

