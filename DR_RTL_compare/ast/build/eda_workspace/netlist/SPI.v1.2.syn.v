/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 07:37:14 2026
/////////////////////////////////////////////////////////////


module spi ( clk, rst, addr, we, write_data, re, read_data );
  input [2:0] addr;
  input [31:0] write_data;
  output [31:0] read_data;
  input clk, rst, we, re;
  wire   enable, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, cs, sck, mosi,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, \uut_master/n380 ,
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
         \uut_master/n340 , \uut_master/n338 , \uut_master/n337 ,
         \uut_master/n336 , \uut_master/n335 , \uut_master/n334 ,
         \uut_master/n333 , \uut_master/n332 , \uut_master/n331 ,
         \uut_master/n330 , \uut_master/n329 , \uut_master/n328 ,
         \uut_master/n327 , \uut_master/n326 , \uut_master/n325 ,
         \uut_master/n324 , \uut_master/n323 , \uut_master/n322 ,
         \uut_master/n321 , \uut_master/n320 , \uut_master/n319 ,
         \uut_master/n318 , \uut_master/n317 , \uut_master/n316 ,
         \uut_master/n315 , \uut_master/n314 , \uut_master/n313 ,
         \uut_master/n312 , \uut_master/n311 , \uut_master/n310 ,
         \uut_master/n309 , \uut_master/n308 , \uut_master/n307 ,
         \uut_master/n306 , \uut_master/n305 , \uut_master/n304 ,
         \uut_master/n303 , \uut_master/n302 , \uut_master/n301 ,
         \uut_master/n300 , \uut_master/n299 , \uut_master/n298 ,
         \uut_master/n297 , \uut_master/n296 , \uut_master/n295 ,
         \uut_master/n294 , \uut_master/n293 , \uut_master/n292 ,
         \uut_master/n291 , \uut_master/n290 , \uut_master/n289 ,
         \uut_master/n288 , \uut_master/n287 , \uut_master/n286 ,
         \uut_master/n285 , \uut_master/n284 , \uut_master/n283 ,
         \uut_master/n282 , \uut_master/n281 , \uut_master/n280 ,
         \uut_master/n279 , \uut_master/n278 , \uut_master/n277 ,
         \uut_master/n276 , \uut_master/n275 , \uut_master/n274 ,
         \uut_master/n273 , \uut_master/n272 , \uut_master/n271 ,
         \uut_master/n270 , \uut_master/n269 , \uut_master/n268 ,
         \uut_master/n267 , \uut_master/n266 , \uut_master/n265 ,
         \uut_master/n264 , \uut_master/n263 , \uut_master/n262 ,
         \uut_master/n261 , \uut_master/n260 , \uut_master/n259 ,
         \uut_master/n258 , \uut_master/n257 , \uut_master/n256 ,
         \uut_master/n255 , \uut_master/n254 , \uut_master/n253 ,
         \uut_master/n252 , \uut_master/n251 , \uut_master/n250 ,
         \uut_master/n249 , \uut_master/n248 , \uut_master/n247 ,
         \uut_master/n246 , \uut_master/n245 , \uut_master/n244 ,
         \uut_master/n243 , \uut_master/n242 , \uut_master/n241 ,
         \uut_master/n240 , \uut_master/n239 , \uut_master/n238 ,
         \uut_master/n237 , \uut_master/n236 , \uut_master/n235 ,
         \uut_master/n234 , \uut_master/n233 , \uut_master/n232 ,
         \uut_master/n231 , \uut_master/n230 , \uut_master/n229 ,
         \uut_master/n228 , \uut_master/n227 , \uut_master/n226 ,
         \uut_master/n225 , \uut_master/n224 , \uut_master/n223 ,
         \uut_master/n222 , \uut_master/n221 , \uut_master/n220 ,
         \uut_master/n219 , \uut_master/n218 , \uut_master/n217 ,
         \uut_master/n216 , \uut_master/n215 , \uut_master/n214 ,
         \uut_master/n213 , \uut_master/n212 , \uut_master/n211 ,
         \uut_master/n210 , \uut_master/n209 , \uut_master/n208 ,
         \uut_master/n207 , \uut_master/n206 , \uut_master/n205 ,
         \uut_master/n204 , \uut_master/n203 , \uut_master/n202 ,
         \uut_master/n201 , \uut_master/n200 , \uut_master/n199 ,
         \uut_master/n198 , \uut_master/n197 , \uut_master/n196 ,
         \uut_master/n195 , \uut_master/n194 , \uut_master/n193 ,
         \uut_master/n192 , \uut_master/n191 , \uut_master/n190 ,
         \uut_master/n189 , \uut_master/n188 , \uut_master/n187 ,
         \uut_master/n186 , \uut_master/n185 , \uut_master/n184 ,
         \uut_master/n183 , \uut_master/n182 , \uut_master/n181 ,
         \uut_master/n180 , \uut_master/n179 , \uut_master/n178 ,
         \uut_master/n177 , \uut_master/n176 , \uut_master/n175 ,
         \uut_master/n174 , \uut_master/n173 , \uut_master/n172 ,
         \uut_master/n171 , \uut_master/n170 , \uut_master/n169 ,
         \uut_master/n168 , \uut_master/n167 , \uut_master/n166 ,
         \uut_master/n165 , \uut_master/n164 , \uut_master/n163 ,
         \uut_master/n162 , \uut_master/n161 , \uut_master/n160 ,
         \uut_master/n159 , \uut_master/n158 , \uut_master/n157 ,
         \uut_master/n156 , \uut_master/n155 , \uut_master/n154 ,
         \uut_master/n153 , \uut_master/n152 , \uut_master/n151 ,
         \uut_master/n150 , \uut_master/n149 , \uut_master/n148 ,
         \uut_master/n147 , \uut_master/n146 , \uut_master/n145 ,
         \uut_master/n144 , \uut_master/n143 , \uut_master/n142 ,
         \uut_master/n141 , \uut_master/n140 , \uut_master/n139 ,
         \uut_master/n138 , \uut_master/n137 , \uut_master/n136 ,
         \uut_master/n135 , \uut_master/n134 , \uut_master/n133 ,
         \uut_master/n132 , \uut_master/n131 , \uut_master/n130 ,
         \uut_master/n129 , \uut_master/n128 , \uut_master/n127 ,
         \uut_master/n126 , \uut_master/n125 , \uut_master/n124 ,
         \uut_master/n123 , \uut_master/n122 , \uut_master/n121 ,
         \uut_master/n120 , \uut_master/n119 , \uut_master/n118 ,
         \uut_master/n117 , \uut_master/n116 , \uut_master/n115 ,
         \uut_master/n114 , \uut_master/n113 , \uut_master/n112 ,
         \uut_master/n110 , \uut_master/n109 , \uut_master/n108 ,
         \uut_master/n49 , \uut_master/n43 , \uut_master/n42 ,
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
         \uut_master/n107 , \uut_master/n106 , \uut_master/n105 ,
         \uut_master/n104 , \uut_master/n103 , \uut_master/n102 ,
         \uut_master/n101 , \uut_master/n100 , \uut_master/n99 ,
         \uut_master/n98 , \uut_master/n97 , \uut_master/n96 ,
         \uut_master/n95 , \uut_master/n94 , \uut_master/n93 ,
         \uut_master/n92 , \uut_master/n91 , \uut_master/n90 ,
         \uut_master/n89 , \uut_master/n88 , \uut_master/n87 ,
         \uut_master/n86 , \uut_master/n85 , \uut_master/n84 ,
         \uut_master/n83 , \uut_master/n82 , \uut_master/n81 ,
         \uut_master/n80 , \uut_master/n79 , \uut_master/n78 ,
         \uut_master/n77 , \uut_master/n76 , \uut_master/n75 ,
         \uut_master/n74 , \uut_master/n73 , \uut_master/n72 ,
         \uut_master/n71 , \uut_master/n70 , \uut_master/n69 ,
         \uut_master/n68 , \uut_master/n67 , \uut_master/n66 ,
         \uut_master/n65 , \uut_master/n64 , \uut_master/n63 ,
         \uut_master/n62 , \uut_master/n61 , \uut_master/n60 ,
         \uut_master/n59 , \uut_master/n58 , \uut_master/n57 ,
         \uut_master/n56 , \uut_master/n55 , \uut_master/n54 ,
         \uut_master/n53 , \uut_master/n52 , \uut_master/n51 ,
         \uut_master/n50 , \uut_master/n48 , \uut_master/n47 ,
         \uut_master/n46 , \uut_master/n45 , \uut_master/n44 ,
         \uut_master/N303 , \uut_master/N302 , \uut_master/N176 ,
         \uut_master/N175 , \uut_master/N174 , \uut_master/N173 ,
         \uut_master/N172 , \uut_master/N171 , \uut_master/N170 ,
         \uut_master/N161 , \uut_master/N160 , \uut_master/N159 ,
         \uut_master/N158 , \uut_master/N157 , \uut_master/N156 ,
         \uut_master/N155 , \uut_master/N154 , \uut_master/N153 ,
         \uut_master/N152 , \uut_master/N151 , \uut_master/N150 ,
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
         \uut_master/N107 , \uut_master/N14 , \uut_master/clock_count ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [5:0] \uut_master/data_count ;
  wire   [63:0] \uut_master/data_save ;
  wire   [1:0] \uut_master/current_state ;

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
  NAND2_X1 \uut_master/U318  ( .A1(\uut_master/n337 ), .A2(\uut_master/n338 ), 
        .ZN(\uut_master/n372 ) );
  NAND2_X1 \uut_master/U317  ( .A1(\uut_master/n128 ), .A2(
        \uut_master/data_save [0]), .ZN(\uut_master/n337 ) );
  NAND3_X1 \uut_master/U316  ( .A1(data_in[0]), .A2(\uut_master/n133 ), .A3(
        \uut_master/n336 ), .ZN(\uut_master/n338 ) );
  OAI221_X1 \uut_master/U315  ( .B1(\uut_master/n106 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n105 ), .C2(\uut_master/n334 ), .A(\uut_master/n333 ), 
        .ZN(\uut_master/N107 ) );
  NAND3_X1 \uut_master/U314  ( .A1(data_in[1]), .A2(\uut_master/n133 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n333 ) );
  OAI221_X1 \uut_master/U313  ( .B1(\uut_master/n105 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n104 ), .C2(\uut_master/n119 ), .A(\uut_master/n331 ), 
        .ZN(\uut_master/N108 ) );
  NAND3_X1 \uut_master/U312  ( .A1(data_in[2]), .A2(\uut_master/n133 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n331 ) );
  OAI221_X1 \uut_master/U311  ( .B1(\uut_master/n104 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n103 ), .C2(\uut_master/n334 ), .A(\uut_master/n330 ), 
        .ZN(\uut_master/N109 ) );
  NAND3_X1 \uut_master/U310  ( .A1(data_in[3]), .A2(\uut_master/n133 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n330 ) );
  OAI221_X1 \uut_master/U309  ( .B1(\uut_master/n103 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n102 ), .C2(\uut_master/n24 ), .A(\uut_master/n329 ), 
        .ZN(\uut_master/N110 ) );
  NAND3_X1 \uut_master/U308  ( .A1(data_in[4]), .A2(\uut_master/n133 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n329 ) );
  OAI221_X1 \uut_master/U307  ( .B1(\uut_master/n102 ), .B2(\uut_master/n4 ), 
        .C1(\uut_master/n101 ), .C2(\uut_master/n119 ), .A(\uut_master/n328 ), 
        .ZN(\uut_master/N111 ) );
  NAND3_X1 \uut_master/U306  ( .A1(data_in[5]), .A2(\uut_master/n133 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n328 ) );
  OAI221_X1 \uut_master/U305  ( .B1(\uut_master/n101 ), .B2(\uut_master/n5 ), 
        .C1(\uut_master/n100 ), .C2(\uut_master/n334 ), .A(\uut_master/n327 ), 
        .ZN(\uut_master/N112 ) );
  NAND3_X1 \uut_master/U304  ( .A1(\uut_master/n332 ), .A2(\uut_master/n133 ), 
        .A3(data_in[6]), .ZN(\uut_master/n327 ) );
  OAI221_X1 \uut_master/U303  ( .B1(\uut_master/n100 ), .B2(\uut_master/n5 ), 
        .C1(\uut_master/n99 ), .C2(\uut_master/n24 ), .A(\uut_master/n326 ), 
        .ZN(\uut_master/N113 ) );
  NAND3_X1 \uut_master/U302  ( .A1(data_in[7]), .A2(\uut_master/n133 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n326 ) );
  OAI221_X1 \uut_master/U301  ( .B1(\uut_master/n99 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n98 ), .C2(\uut_master/n334 ), .A(\uut_master/n325 ), 
        .ZN(\uut_master/N114 ) );
  NAND3_X1 \uut_master/U300  ( .A1(data_in[8]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n325 ) );
  OAI221_X1 \uut_master/U299  ( .B1(\uut_master/n98 ), .B2(\uut_master/n5 ), 
        .C1(\uut_master/n97 ), .C2(\uut_master/n334 ), .A(\uut_master/n324 ), 
        .ZN(\uut_master/N115 ) );
  NAND3_X1 \uut_master/U298  ( .A1(data_in[9]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n324 ) );
  OAI221_X1 \uut_master/U297  ( .B1(\uut_master/n97 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n96 ), .C2(\uut_master/n40 ), .A(\uut_master/n323 ), 
        .ZN(\uut_master/N116 ) );
  NAND3_X1 \uut_master/U296  ( .A1(data_in[10]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n323 ) );
  OAI221_X1 \uut_master/U295  ( .B1(\uut_master/n96 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n95 ), .C2(\uut_master/n115 ), .A(\uut_master/n322 ), 
        .ZN(\uut_master/N117 ) );
  NAND3_X1 \uut_master/U294  ( .A1(data_in[11]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n332 ), .ZN(\uut_master/n322 ) );
  OAI221_X1 \uut_master/U293  ( .B1(\uut_master/n95 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n94 ), .C2(\uut_master/n334 ), .A(\uut_master/n321 ), 
        .ZN(\uut_master/N118 ) );
  NAND3_X1 \uut_master/U292  ( .A1(data_in[12]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n332 ), .ZN(\uut_master/n321 ) );
  OAI221_X1 \uut_master/U291  ( .B1(\uut_master/n94 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n93 ), .C2(\uut_master/n40 ), .A(\uut_master/n320 ), 
        .ZN(\uut_master/N119 ) );
  NAND3_X1 \uut_master/U290  ( .A1(data_in[13]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n320 ) );
  OAI221_X1 \uut_master/U289  ( .B1(\uut_master/n93 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n92 ), .C2(\uut_master/n116 ), .A(\uut_master/n319 ), 
        .ZN(\uut_master/N120 ) );
  NAND3_X1 \uut_master/U288  ( .A1(data_in[14]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n332 ), .ZN(\uut_master/n319 ) );
  OAI221_X1 \uut_master/U287  ( .B1(\uut_master/n92 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n91 ), .C2(\uut_master/n334 ), .A(\uut_master/n318 ), 
        .ZN(\uut_master/N121 ) );
  NAND3_X1 \uut_master/U286  ( .A1(data_in[15]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n318 ) );
  OAI221_X1 \uut_master/U285  ( .B1(\uut_master/n91 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n90 ), .C2(\uut_master/n334 ), .A(\uut_master/n317 ), 
        .ZN(\uut_master/N122 ) );
  NAND3_X1 \uut_master/U284  ( .A1(data_in[16]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n317 ) );
  OAI221_X1 \uut_master/U283  ( .B1(\uut_master/n90 ), .B2(\uut_master/n6 ), 
        .C1(\uut_master/n89 ), .C2(\uut_master/n40 ), .A(\uut_master/n316 ), 
        .ZN(\uut_master/N123 ) );
  NAND3_X1 \uut_master/U282  ( .A1(data_in[17]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n316 ) );
  OAI221_X1 \uut_master/U281  ( .B1(\uut_master/n89 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n88 ), .C2(\uut_master/n115 ), .A(\uut_master/n315 ), 
        .ZN(\uut_master/N124 ) );
  NAND3_X1 \uut_master/U280  ( .A1(data_in[18]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n332 ), .ZN(\uut_master/n315 ) );
  OAI221_X1 \uut_master/U279  ( .B1(\uut_master/n88 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n87 ), .C2(\uut_master/n115 ), .A(\uut_master/n314 ), 
        .ZN(\uut_master/N125 ) );
  NAND3_X1 \uut_master/U278  ( .A1(data_in[19]), .A2(\uut_master/n132 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n314 ) );
  OAI221_X1 \uut_master/U277  ( .B1(\uut_master/n87 ), .B2(\uut_master/n6 ), 
        .C1(\uut_master/n86 ), .C2(\uut_master/n334 ), .A(\uut_master/n313 ), 
        .ZN(\uut_master/N126 ) );
  NAND3_X1 \uut_master/U276  ( .A1(\uut_master/n332 ), .A2(\uut_master/n131 ), 
        .A3(data_in[20]), .ZN(\uut_master/n313 ) );
  OAI221_X1 \uut_master/U275  ( .B1(\uut_master/n86 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n85 ), .C2(\uut_master/n116 ), .A(\uut_master/n312 ), 
        .ZN(\uut_master/N127 ) );
  NAND3_X1 \uut_master/U274  ( .A1(data_in[21]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n312 ) );
  OAI221_X1 \uut_master/U273  ( .B1(\uut_master/n85 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n84 ), .C2(\uut_master/n24 ), .A(\uut_master/n311 ), 
        .ZN(\uut_master/N128 ) );
  NAND3_X1 \uut_master/U272  ( .A1(data_in[22]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n311 ) );
  OAI221_X1 \uut_master/U271  ( .B1(\uut_master/n84 ), .B2(\uut_master/n13 ), 
        .C1(\uut_master/n83 ), .C2(\uut_master/n334 ), .A(\uut_master/n310 ), 
        .ZN(\uut_master/N129 ) );
  NAND3_X1 \uut_master/U270  ( .A1(data_in[23]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n310 ) );
  OAI221_X1 \uut_master/U269  ( .B1(\uut_master/n83 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n82 ), .C2(\uut_master/n115 ), .A(\uut_master/n309 ), 
        .ZN(\uut_master/N130 ) );
  NAND3_X1 \uut_master/U268  ( .A1(data_in[24]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n309 ) );
  OAI221_X1 \uut_master/U267  ( .B1(\uut_master/n82 ), .B2(\uut_master/n4 ), 
        .C1(\uut_master/n81 ), .C2(\uut_master/n334 ), .A(\uut_master/n308 ), 
        .ZN(\uut_master/N131 ) );
  NAND3_X1 \uut_master/U266  ( .A1(\uut_master/n332 ), .A2(\uut_master/n131 ), 
        .A3(data_in[25]), .ZN(\uut_master/n308 ) );
  OAI221_X1 \uut_master/U265  ( .B1(\uut_master/n81 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n80 ), .C2(\uut_master/n334 ), .A(\uut_master/n307 ), 
        .ZN(\uut_master/N132 ) );
  NAND3_X1 \uut_master/U264  ( .A1(data_in[26]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n307 ) );
  OAI221_X1 \uut_master/U263  ( .B1(\uut_master/n80 ), .B2(\uut_master/n4 ), 
        .C1(\uut_master/n79 ), .C2(\uut_master/n119 ), .A(\uut_master/n306 ), 
        .ZN(\uut_master/N133 ) );
  NAND3_X1 \uut_master/U262  ( .A1(data_in[27]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n124 ), .ZN(\uut_master/n306 ) );
  OAI221_X1 \uut_master/U261  ( .B1(\uut_master/n79 ), .B2(\uut_master/n4 ), 
        .C1(\uut_master/n78 ), .C2(\uut_master/n334 ), .A(\uut_master/n305 ), 
        .ZN(\uut_master/N134 ) );
  NAND3_X1 \uut_master/U260  ( .A1(\uut_master/n332 ), .A2(\uut_master/n131 ), 
        .A3(data_in[28]), .ZN(\uut_master/n305 ) );
  OAI221_X1 \uut_master/U259  ( .B1(\uut_master/n78 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n77 ), .C2(\uut_master/n334 ), .A(\uut_master/n304 ), 
        .ZN(\uut_master/N135 ) );
  NAND3_X1 \uut_master/U258  ( .A1(data_in[29]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n304 ) );
  OAI221_X1 \uut_master/U257  ( .B1(\uut_master/n77 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n76 ), .C2(\uut_master/n119 ), .A(\uut_master/n303 ), 
        .ZN(\uut_master/N136 ) );
  NAND3_X1 \uut_master/U256  ( .A1(data_in[30]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n125 ), .ZN(\uut_master/n303 ) );
  OAI221_X1 \uut_master/U255  ( .B1(\uut_master/n76 ), .B2(\uut_master/n246 ), 
        .C1(\uut_master/n75 ), .C2(\uut_master/n119 ), .A(\uut_master/n302 ), 
        .ZN(\uut_master/N137 ) );
  NAND3_X1 \uut_master/U254  ( .A1(data_in[31]), .A2(\uut_master/n131 ), .A3(
        \uut_master/n332 ), .ZN(\uut_master/n302 ) );
  NOR4_X1 \uut_master/U253  ( .A1(command[6]), .A2(command[7]), .A3(command[4]), .A4(command[5]), .ZN(\uut_master/n300 ) );
  NOR4_X1 \uut_master/U252  ( .A1(command[2]), .A2(command[3]), .A3(command[0]), .A4(command[1]), .ZN(\uut_master/n301 ) );
  OAI21_X1 \uut_master/U251  ( .B1(\uut_master/n74 ), .B2(\uut_master/n24 ), 
        .A(\uut_master/n299 ), .ZN(\uut_master/N138 ) );
  AOI22_X1 \uut_master/U250  ( .A1(\uut_master/n332 ), .A2(address[0]), .B1(
        \uut_master/n35 ), .B2(\uut_master/n298 ), .ZN(\uut_master/n299 ) );
  INV_X1 \uut_master/U249  ( .A(\uut_master/n297 ), .ZN(\uut_master/n332 ) );
  NAND2_X1 \uut_master/U248  ( .A1(\uut_master/n296 ), .A2(\uut_master/n295 ), 
        .ZN(\uut_master/n297 ) );
  OAI21_X1 \uut_master/U247  ( .B1(\uut_master/n73 ), .B2(\uut_master/n116 ), 
        .A(\uut_master/n294 ), .ZN(\uut_master/N139 ) );
  AOI22_X1 \uut_master/U246  ( .A1(address[1]), .A2(\uut_master/n336 ), .B1(
        \uut_master/n117 ), .B2(\uut_master/n293 ), .ZN(\uut_master/n294 ) );
  OAI21_X1 \uut_master/U245  ( .B1(\uut_master/n72 ), .B2(\uut_master/n116 ), 
        .A(\uut_master/n292 ), .ZN(\uut_master/N140 ) );
  AOI22_X1 \uut_master/U244  ( .A1(address[2]), .A2(\uut_master/n129 ), .B1(
        \uut_master/n114 ), .B2(\uut_master/n291 ), .ZN(\uut_master/n292 ) );
  OAI21_X1 \uut_master/U243  ( .B1(\uut_master/n71 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n290 ), .ZN(\uut_master/N141 ) );
  AOI22_X1 \uut_master/U242  ( .A1(address[3]), .A2(\uut_master/n113 ), .B1(
        \uut_master/n117 ), .B2(\uut_master/n289 ), .ZN(\uut_master/n290 ) );
  OAI21_X1 \uut_master/U241  ( .B1(\uut_master/n70 ), .B2(\uut_master/n334 ), 
        .A(\uut_master/n288 ), .ZN(\uut_master/N142 ) );
  AOI22_X1 \uut_master/U240  ( .A1(address[4]), .A2(\uut_master/n129 ), .B1(
        \uut_master/n117 ), .B2(\uut_master/n287 ), .ZN(\uut_master/n288 ) );
  OAI21_X1 \uut_master/U239  ( .B1(\uut_master/n69 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n286 ), .ZN(\uut_master/N143 ) );
  AOI22_X1 \uut_master/U238  ( .A1(address[5]), .A2(\uut_master/n113 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n285 ), .ZN(\uut_master/n286 ) );
  OAI21_X1 \uut_master/U237  ( .B1(\uut_master/n68 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n284 ), .ZN(\uut_master/N144 ) );
  AOI22_X1 \uut_master/U236  ( .A1(address[6]), .A2(\uut_master/n113 ), .B1(
        \uut_master/n29 ), .B2(\uut_master/n283 ), .ZN(\uut_master/n284 ) );
  OAI21_X1 \uut_master/U235  ( .B1(\uut_master/n67 ), .B2(\uut_master/n116 ), 
        .A(\uut_master/n282 ), .ZN(\uut_master/N145 ) );
  AOI22_X1 \uut_master/U234  ( .A1(address[7]), .A2(\uut_master/n129 ), .B1(
        \uut_master/n117 ), .B2(\uut_master/n281 ), .ZN(\uut_master/n282 ) );
  OAI21_X1 \uut_master/U233  ( .B1(\uut_master/n66 ), .B2(\uut_master/n115 ), 
        .A(\uut_master/n280 ), .ZN(\uut_master/N146 ) );
  AOI22_X1 \uut_master/U232  ( .A1(address[8]), .A2(\uut_master/n113 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n279 ), .ZN(\uut_master/n280 ) );
  OAI21_X1 \uut_master/U231  ( .B1(\uut_master/n65 ), .B2(\uut_master/n115 ), 
        .A(\uut_master/n278 ), .ZN(\uut_master/N147 ) );
  AOI22_X1 \uut_master/U230  ( .A1(address[9]), .A2(\uut_master/n112 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n277 ), .ZN(\uut_master/n278 ) );
  OAI21_X1 \uut_master/U229  ( .B1(\uut_master/n64 ), .B2(\uut_master/n115 ), 
        .A(\uut_master/n276 ), .ZN(\uut_master/N148 ) );
  AOI22_X1 \uut_master/U228  ( .A1(address[10]), .A2(\uut_master/n336 ), .B1(
        \uut_master/n114 ), .B2(\uut_master/n275 ), .ZN(\uut_master/n276 ) );
  OAI21_X1 \uut_master/U227  ( .B1(\uut_master/n63 ), .B2(\uut_master/n334 ), 
        .A(\uut_master/n274 ), .ZN(\uut_master/N149 ) );
  AOI22_X1 \uut_master/U226  ( .A1(address[11]), .A2(\uut_master/n112 ), .B1(
        \uut_master/n114 ), .B2(\uut_master/n273 ), .ZN(\uut_master/n274 ) );
  OAI21_X1 \uut_master/U225  ( .B1(\uut_master/n62 ), .B2(\uut_master/n24 ), 
        .A(\uut_master/n272 ), .ZN(\uut_master/N150 ) );
  AOI22_X1 \uut_master/U224  ( .A1(address[12]), .A2(\uut_master/n129 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n271 ), .ZN(\uut_master/n272 ) );
  OAI21_X1 \uut_master/U223  ( .B1(\uut_master/n61 ), .B2(\uut_master/n116 ), 
        .A(\uut_master/n270 ), .ZN(\uut_master/N151 ) );
  AOI22_X1 \uut_master/U222  ( .A1(address[13]), .A2(\uut_master/n113 ), .B1(
        \uut_master/n29 ), .B2(\uut_master/n269 ), .ZN(\uut_master/n270 ) );
  OAI21_X1 \uut_master/U221  ( .B1(\uut_master/n60 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n268 ), .ZN(\uut_master/N152 ) );
  AOI22_X1 \uut_master/U220  ( .A1(\uut_master/n129 ), .A2(address[14]), .B1(
        \uut_master/n35 ), .B2(\uut_master/n267 ), .ZN(\uut_master/n268 ) );
  OAI21_X1 \uut_master/U219  ( .B1(\uut_master/n59 ), .B2(\uut_master/n24 ), 
        .A(\uut_master/n266 ), .ZN(\uut_master/N153 ) );
  AOI22_X1 \uut_master/U218  ( .A1(address[15]), .A2(\uut_master/n336 ), .B1(
        \uut_master/n29 ), .B2(\uut_master/n265 ), .ZN(\uut_master/n266 ) );
  OAI21_X1 \uut_master/U217  ( .B1(\uut_master/n58 ), .B2(\uut_master/n115 ), 
        .A(\uut_master/n264 ), .ZN(\uut_master/N154 ) );
  AOI22_X1 \uut_master/U216  ( .A1(address[16]), .A2(\uut_master/n113 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n263 ), .ZN(\uut_master/n264 ) );
  OAI21_X1 \uut_master/U215  ( .B1(\uut_master/n57 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n262 ), .ZN(\uut_master/N155 ) );
  AOI22_X1 \uut_master/U214  ( .A1(\uut_master/n336 ), .A2(address[17]), .B1(
        \uut_master/n35 ), .B2(\uut_master/n261 ), .ZN(\uut_master/n262 ) );
  OAI21_X1 \uut_master/U213  ( .B1(\uut_master/n56 ), .B2(\uut_master/n24 ), 
        .A(\uut_master/n260 ), .ZN(\uut_master/N156 ) );
  AOI22_X1 \uut_master/U212  ( .A1(address[18]), .A2(\uut_master/n113 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n259 ), .ZN(\uut_master/n260 ) );
  OAI21_X1 \uut_master/U211  ( .B1(\uut_master/n55 ), .B2(\uut_master/n334 ), 
        .A(\uut_master/n258 ), .ZN(\uut_master/N157 ) );
  AOI22_X1 \uut_master/U210  ( .A1(address[19]), .A2(\uut_master/n112 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n257 ), .ZN(\uut_master/n258 ) );
  OAI21_X1 \uut_master/U209  ( .B1(\uut_master/n54 ), .B2(\uut_master/n116 ), 
        .A(\uut_master/n256 ), .ZN(\uut_master/N158 ) );
  AOI22_X1 \uut_master/U208  ( .A1(address[20]), .A2(\uut_master/n112 ), .B1(
        \uut_master/n35 ), .B2(\uut_master/n255 ), .ZN(\uut_master/n256 ) );
  OAI21_X1 \uut_master/U207  ( .B1(\uut_master/n53 ), .B2(\uut_master/n334 ), 
        .A(\uut_master/n254 ), .ZN(\uut_master/N159 ) );
  AOI22_X1 \uut_master/U206  ( .A1(address[21]), .A2(\uut_master/n336 ), .B1(
        \uut_master/n29 ), .B2(\uut_master/n253 ), .ZN(\uut_master/n254 ) );
  OAI21_X1 \uut_master/U205  ( .B1(\uut_master/n52 ), .B2(\uut_master/n334 ), 
        .A(\uut_master/n252 ), .ZN(\uut_master/N160 ) );
  AOI22_X1 \uut_master/U204  ( .A1(address[22]), .A2(\uut_master/n112 ), .B1(
        \uut_master/n117 ), .B2(\uut_master/n251 ), .ZN(\uut_master/n252 ) );
  OAI21_X1 \uut_master/U203  ( .B1(\uut_master/n51 ), .B2(\uut_master/n115 ), 
        .A(\uut_master/n250 ), .ZN(\uut_master/N161 ) );
  AOI22_X1 \uut_master/U202  ( .A1(address[23]), .A2(\uut_master/n112 ), .B1(
        \uut_master/n114 ), .B2(\uut_master/n249 ), .ZN(\uut_master/n250 ) );
  OAI21_X1 \uut_master/U201  ( .B1(\uut_master/n119 ), .B2(\uut_master/n248 ), 
        .A(\uut_master/n247 ), .ZN(\uut_master/n373 ) );
  AOI22_X1 \uut_master/U200  ( .A1(\uut_master/n129 ), .A2(command[0]), .B1(
        \uut_master/n35 ), .B2(\uut_master/data_save [55]), .ZN(
        \uut_master/n247 ) );
  INV_X1 \uut_master/U199  ( .A(\uut_master/n192 ), .ZN(\uut_master/n336 ) );
  OAI222_X1 \uut_master/U198  ( .A1(\uut_master/n13 ), .A2(\uut_master/n248 ), 
        .B1(\uut_master/n33 ), .B2(\uut_master/n244 ), .C1(\uut_master/n118 ), 
        .C2(\uut_master/n243 ), .ZN(\uut_master/n374 ) );
  INV_X1 \uut_master/U197  ( .A(command[1]), .ZN(\uut_master/n244 ) );
  OAI222_X1 \uut_master/U196  ( .A1(\uut_master/n246 ), .A2(\uut_master/n243 ), 
        .B1(\uut_master/n33 ), .B2(\uut_master/n242 ), .C1(\uut_master/n118 ), 
        .C2(\uut_master/n241 ), .ZN(\uut_master/n375 ) );
  INV_X1 \uut_master/U195  ( .A(command[2]), .ZN(\uut_master/n242 ) );
  OAI222_X1 \uut_master/U194  ( .A1(\uut_master/n246 ), .A2(\uut_master/n241 ), 
        .B1(\uut_master/n33 ), .B2(\uut_master/n240 ), .C1(\uut_master/n118 ), 
        .C2(\uut_master/n239 ), .ZN(\uut_master/n376 ) );
  INV_X1 \uut_master/U193  ( .A(command[3]), .ZN(\uut_master/n240 ) );
  OAI222_X1 \uut_master/U192  ( .A1(\uut_master/n6 ), .A2(\uut_master/n239 ), 
        .B1(\uut_master/n33 ), .B2(\uut_master/n238 ), .C1(\uut_master/n118 ), 
        .C2(\uut_master/n237 ), .ZN(\uut_master/n377 ) );
  INV_X1 \uut_master/U191  ( .A(command[4]), .ZN(\uut_master/n238 ) );
  OAI222_X1 \uut_master/U190  ( .A1(\uut_master/n13 ), .A2(\uut_master/n237 ), 
        .B1(\uut_master/n33 ), .B2(\uut_master/n236 ), .C1(\uut_master/n118 ), 
        .C2(\uut_master/n235 ), .ZN(\uut_master/n378 ) );
  INV_X1 \uut_master/U189  ( .A(command[5]), .ZN(\uut_master/n236 ) );
  OAI222_X1 \uut_master/U188  ( .A1(\uut_master/n6 ), .A2(\uut_master/n235 ), 
        .B1(\uut_master/n33 ), .B2(\uut_master/n234 ), .C1(\uut_master/n118 ), 
        .C2(\uut_master/n233 ), .ZN(\uut_master/n379 ) );
  INV_X1 \uut_master/U187  ( .A(command[6]), .ZN(\uut_master/n234 ) );
  OAI221_X1 \uut_master/U186  ( .B1(\uut_master/n33 ), .B2(\uut_master/n232 ), 
        .C1(\uut_master/n13 ), .C2(\uut_master/n233 ), .A(\uut_master/n231 ), 
        .ZN(\uut_master/n380 ) );
  NAND2_X1 \uut_master/U185  ( .A1(\uut_master/n126 ), .A2(
        \uut_master/data_save [63]), .ZN(\uut_master/n231 ) );
  INV_X1 \uut_master/U184  ( .A(command[7]), .ZN(\uut_master/n232 ) );
  NOR2_X1 \uut_master/U183  ( .A1(\uut_master/n50 ), .A2(\uut_master/n3 ), 
        .ZN(mosi) );
  OAI21_X1 \uut_master/U182  ( .B1(\uut_master/n30 ), .B2(\uut_master/n226 ), 
        .A(\uut_master/n225 ), .ZN(\uut_master/n371 ) );
  NAND3_X1 \uut_master/U181  ( .A1(\uut_master/n26 ), .A2(\uut_master/n120 ), 
        .A3(data_out[30]), .ZN(\uut_master/n225 ) );
  OAI21_X1 \uut_master/U180  ( .B1(\uut_master/n189 ), .B2(\uut_master/n223 ), 
        .A(\uut_master/n222 ), .ZN(\uut_master/n370 ) );
  NAND3_X1 \uut_master/U179  ( .A1(\uut_master/n15 ), .A2(\uut_master/n120 ), 
        .A3(data_out[29]), .ZN(\uut_master/n222 ) );
  OAI21_X1 \uut_master/U178  ( .B1(\uut_master/n189 ), .B2(\uut_master/n221 ), 
        .A(\uut_master/n220 ), .ZN(\uut_master/n369 ) );
  NAND3_X1 \uut_master/U177  ( .A1(\uut_master/n41 ), .A2(
        \uut_master/data_count [5]), .A3(data_out[28]), .ZN(\uut_master/n220 )
         );
  OAI21_X1 \uut_master/U176  ( .B1(\uut_master/n27 ), .B2(\uut_master/n219 ), 
        .A(\uut_master/n218 ), .ZN(\uut_master/n368 ) );
  NAND3_X1 \uut_master/U175  ( .A1(\uut_master/n15 ), .A2(\uut_master/n224 ), 
        .A3(data_out[27]), .ZN(\uut_master/n218 ) );
  OAI21_X1 \uut_master/U174  ( .B1(\uut_master/n227 ), .B2(\uut_master/n217 ), 
        .A(\uut_master/n216 ), .ZN(\uut_master/n367 ) );
  NAND3_X1 \uut_master/U173  ( .A1(\uut_master/n23 ), .A2(
        \uut_master/data_count [5]), .A3(data_out[26]), .ZN(\uut_master/n216 )
         );
  OAI21_X1 \uut_master/U172  ( .B1(\uut_master/n10 ), .B2(\uut_master/n215 ), 
        .A(\uut_master/n214 ), .ZN(\uut_master/n366 ) );
  NAND3_X1 \uut_master/U171  ( .A1(\uut_master/n26 ), .A2(\uut_master/n120 ), 
        .A3(data_out[25]), .ZN(\uut_master/n214 ) );
  OAI21_X1 \uut_master/U170  ( .B1(\uut_master/n227 ), .B2(\uut_master/n213 ), 
        .A(\uut_master/n212 ), .ZN(\uut_master/n365 ) );
  NAND3_X1 \uut_master/U169  ( .A1(\uut_master/n23 ), .A2(\uut_master/n224 ), 
        .A3(data_out[24]), .ZN(\uut_master/n212 ) );
  OAI21_X1 \uut_master/U168  ( .B1(\uut_master/n227 ), .B2(\uut_master/n211 ), 
        .A(\uut_master/n210 ), .ZN(\uut_master/n364 ) );
  NAND3_X1 \uut_master/U167  ( .A1(\uut_master/n41 ), .A2(
        \uut_master/data_count [5]), .A3(data_out[23]), .ZN(\uut_master/n210 )
         );
  OAI21_X1 \uut_master/U166  ( .B1(\uut_master/n189 ), .B2(\uut_master/n209 ), 
        .A(\uut_master/n208 ), .ZN(\uut_master/n363 ) );
  NAND3_X1 \uut_master/U165  ( .A1(\uut_master/n15 ), .A2(\uut_master/n120 ), 
        .A3(data_out[22]), .ZN(\uut_master/n208 ) );
  OAI21_X1 \uut_master/U164  ( .B1(\uut_master/n10 ), .B2(\uut_master/n207 ), 
        .A(\uut_master/n206 ), .ZN(\uut_master/n362 ) );
  NAND3_X1 \uut_master/U163  ( .A1(data_out[21]), .A2(\uut_master/n224 ), .A3(
        \uut_master/n127 ), .ZN(\uut_master/n206 ) );
  OAI21_X1 \uut_master/U162  ( .B1(\uut_master/n30 ), .B2(\uut_master/n205 ), 
        .A(\uut_master/n204 ), .ZN(\uut_master/n361 ) );
  NAND3_X1 \uut_master/U161  ( .A1(\uut_master/n128 ), .A2(\uut_master/n224 ), 
        .A3(data_out[20]), .ZN(\uut_master/n204 ) );
  OAI21_X1 \uut_master/U160  ( .B1(\uut_master/n27 ), .B2(\uut_master/n203 ), 
        .A(\uut_master/n202 ), .ZN(\uut_master/n360 ) );
  NAND3_X1 \uut_master/U159  ( .A1(\uut_master/n128 ), .A2(\uut_master/n120 ), 
        .A3(data_out[19]), .ZN(\uut_master/n202 ) );
  OAI21_X1 \uut_master/U158  ( .B1(\uut_master/n25 ), .B2(\uut_master/n201 ), 
        .A(\uut_master/n200 ), .ZN(\uut_master/n359 ) );
  NAND3_X1 \uut_master/U157  ( .A1(\uut_master/n127 ), .A2(
        \uut_master/data_count [5]), .A3(data_out[18]), .ZN(\uut_master/n200 )
         );
  OAI21_X1 \uut_master/U156  ( .B1(\uut_master/n10 ), .B2(\uut_master/n199 ), 
        .A(\uut_master/n198 ), .ZN(\uut_master/n358 ) );
  NAND3_X1 \uut_master/U155  ( .A1(data_out[17]), .A2(\uut_master/n224 ), .A3(
        \uut_master/n127 ), .ZN(\uut_master/n198 ) );
  OAI21_X1 \uut_master/U154  ( .B1(\uut_master/n189 ), .B2(\uut_master/n197 ), 
        .A(\uut_master/n196 ), .ZN(\uut_master/n357 ) );
  NAND3_X1 \uut_master/U153  ( .A1(\uut_master/n127 ), .A2(\uut_master/n120 ), 
        .A3(data_out[16]), .ZN(\uut_master/n196 ) );
  OAI21_X1 \uut_master/U152  ( .B1(\uut_master/n189 ), .B2(\uut_master/n195 ), 
        .A(\uut_master/n194 ), .ZN(\uut_master/n356 ) );
  NAND3_X1 \uut_master/U151  ( .A1(\uut_master/n128 ), .A2(\uut_master/n120 ), 
        .A3(data_out[15]), .ZN(\uut_master/n194 ) );
  NAND3_X1 \uut_master/U150  ( .A1(\uut_master/n245 ), .A2(\uut_master/n191 ), 
        .A3(\uut_master/n190 ), .ZN(\uut_master/n193 ) );
  OAI21_X1 \uut_master/U149  ( .B1(\uut_master/n30 ), .B2(\uut_master/n188 ), 
        .A(\uut_master/n187 ), .ZN(\uut_master/n355 ) );
  NAND3_X1 \uut_master/U148  ( .A1(\uut_master/n128 ), .A2(\uut_master/n120 ), 
        .A3(data_out[14]), .ZN(\uut_master/n187 ) );
  OAI21_X1 \uut_master/U147  ( .B1(\uut_master/n27 ), .B2(\uut_master/n186 ), 
        .A(\uut_master/n185 ), .ZN(\uut_master/n354 ) );
  NAND3_X1 \uut_master/U146  ( .A1(\uut_master/n128 ), .A2(\uut_master/n120 ), 
        .A3(data_out[13]), .ZN(\uut_master/n185 ) );
  OAI21_X1 \uut_master/U145  ( .B1(\uut_master/n227 ), .B2(\uut_master/n184 ), 
        .A(\uut_master/n183 ), .ZN(\uut_master/n353 ) );
  NAND3_X1 \uut_master/U144  ( .A1(\uut_master/n127 ), .A2(\uut_master/n224 ), 
        .A3(data_out[12]), .ZN(\uut_master/n183 ) );
  OAI21_X1 \uut_master/U143  ( .B1(\uut_master/n30 ), .B2(\uut_master/n182 ), 
        .A(\uut_master/n181 ), .ZN(\uut_master/n352 ) );
  NAND3_X1 \uut_master/U142  ( .A1(\uut_master/n127 ), .A2(\uut_master/n120 ), 
        .A3(data_out[11]), .ZN(\uut_master/n181 ) );
  OAI21_X1 \uut_master/U141  ( .B1(\uut_master/n25 ), .B2(\uut_master/n180 ), 
        .A(\uut_master/n179 ), .ZN(\uut_master/n351 ) );
  NAND3_X1 \uut_master/U140  ( .A1(data_out[10]), .A2(\uut_master/n224 ), .A3(
        \uut_master/n127 ), .ZN(\uut_master/n179 ) );
  OAI21_X1 \uut_master/U139  ( .B1(\uut_master/n27 ), .B2(\uut_master/n178 ), 
        .A(\uut_master/n177 ), .ZN(\uut_master/n350 ) );
  NAND3_X1 \uut_master/U138  ( .A1(\uut_master/n126 ), .A2(\uut_master/n120 ), 
        .A3(data_out[9]), .ZN(\uut_master/n177 ) );
  OAI21_X1 \uut_master/U137  ( .B1(\uut_master/n30 ), .B2(\uut_master/n176 ), 
        .A(\uut_master/n175 ), .ZN(\uut_master/n349 ) );
  NAND3_X1 \uut_master/U136  ( .A1(\uut_master/n128 ), .A2(\uut_master/n224 ), 
        .A3(data_out[8]), .ZN(\uut_master/n175 ) );
  OAI21_X1 \uut_master/U135  ( .B1(\uut_master/n25 ), .B2(\uut_master/n174 ), 
        .A(\uut_master/n173 ), .ZN(\uut_master/n348 ) );
  NAND3_X1 \uut_master/U134  ( .A1(data_out[7]), .A2(
        \uut_master/data_count [5]), .A3(\uut_master/n127 ), .ZN(
        \uut_master/n173 ) );
  OAI21_X1 \uut_master/U133  ( .B1(\uut_master/n30 ), .B2(\uut_master/n172 ), 
        .A(\uut_master/n171 ), .ZN(\uut_master/n347 ) );
  NAND3_X1 \uut_master/U132  ( .A1(\uut_master/n128 ), .A2(\uut_master/n120 ), 
        .A3(data_out[6]), .ZN(\uut_master/n171 ) );
  OAI21_X1 \uut_master/U131  ( .B1(\uut_master/n227 ), .B2(\uut_master/n170 ), 
        .A(\uut_master/n169 ), .ZN(\uut_master/n346 ) );
  NAND3_X1 \uut_master/U130  ( .A1(\uut_master/n128 ), .A2(\uut_master/n224 ), 
        .A3(data_out[5]), .ZN(\uut_master/n169 ) );
  OAI21_X1 \uut_master/U129  ( .B1(\uut_master/n25 ), .B2(\uut_master/n168 ), 
        .A(\uut_master/n167 ), .ZN(\uut_master/n345 ) );
  NAND3_X1 \uut_master/U128  ( .A1(\uut_master/n128 ), .A2(
        \uut_master/data_count [5]), .A3(data_out[4]), .ZN(\uut_master/n167 )
         );
  OAI21_X1 \uut_master/U127  ( .B1(\uut_master/n227 ), .B2(\uut_master/n166 ), 
        .A(\uut_master/n165 ), .ZN(\uut_master/n344 ) );
  NAND3_X1 \uut_master/U126  ( .A1(\uut_master/n127 ), .A2(\uut_master/n120 ), 
        .A3(data_out[3]), .ZN(\uut_master/n165 ) );
  OAI21_X1 \uut_master/U125  ( .B1(\uut_master/n27 ), .B2(\uut_master/n164 ), 
        .A(\uut_master/n163 ), .ZN(\uut_master/n343 ) );
  NAND3_X1 \uut_master/U124  ( .A1(\uut_master/n128 ), .A2(\uut_master/n224 ), 
        .A3(data_out[2]), .ZN(\uut_master/n163 ) );
  OAI21_X1 \uut_master/U123  ( .B1(\uut_master/n25 ), .B2(\uut_master/n162 ), 
        .A(\uut_master/n161 ), .ZN(\uut_master/n342 ) );
  NAND3_X1 \uut_master/U122  ( .A1(\uut_master/n127 ), .A2(
        \uut_master/data_count [5]), .A3(data_out[1]), .ZN(\uut_master/n161 )
         );
  OAI21_X1 \uut_master/U121  ( .B1(\uut_master/n10 ), .B2(\uut_master/n160 ), 
        .A(\uut_master/n159 ), .ZN(\uut_master/n341 ) );
  NAND3_X1 \uut_master/U120  ( .A1(data_out[0]), .A2(\uut_master/n224 ), .A3(
        \uut_master/n127 ), .ZN(\uut_master/n159 ) );
  OAI21_X1 \uut_master/U119  ( .B1(\uut_master/n27 ), .B2(\uut_master/n158 ), 
        .A(\uut_master/n157 ), .ZN(\uut_master/n340 ) );
  NAND3_X1 \uut_master/U118  ( .A1(1'b0), .A2(\uut_master/n109 ), .A3(
        \uut_master/n130 ), .ZN(\uut_master/n157 ) );
  NAND3_X1 \uut_master/U117  ( .A1(\uut_master/n245 ), .A2(\uut_master/n191 ), 
        .A3(\uut_master/n20 ), .ZN(\uut_master/n156 ) );
  OAI21_X1 \uut_master/U116  ( .B1(\uut_master/n14 ), .B2(\uut_master/n154 ), 
        .A(\uut_master/n295 ), .ZN(\uut_master/n190 ) );
  NAND2_X1 \uut_master/U115  ( .A1(\uut_master/n295 ), .A2(\uut_master/n44 ), 
        .ZN(\uut_master/n191 ) );
  NAND2_X1 \uut_master/U114  ( .A1(\uut_master/n229 ), .A2(\uut_master/n295 ), 
        .ZN(\uut_master/n192 ) );
  NAND2_X1 \uut_master/U113  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n108 ), .ZN(\uut_master/n229 ) );
  OAI21_X1 \uut_master/U112  ( .B1(\uut_master/n153 ), .B2(\uut_master/n11 ), 
        .A(\uut_master/n151 ), .ZN(\uut_master/N175 ) );
  NAND3_X1 \uut_master/U111  ( .A1(\uut_master/n18 ), .A2(
        \uut_master/data_count [5]), .A3(\uut_master/n150 ), .ZN(
        \uut_master/n151 ) );
  INV_X1 \uut_master/U110  ( .A(sck), .ZN(\uut_master/n150 ) );
  XOR2_X1 \uut_master/U109  ( .A(\uut_master/n149 ), .B(\uut_master/n120 ), 
        .Z(\uut_master/n153 ) );
  NAND4_X1 \uut_master/U108  ( .A1(\uut_master/data_count [2]), .A2(
        \uut_master/n36 ), .A3(\uut_master/data_count [4]), .A4(
        \uut_master/data_count [3]), .ZN(\uut_master/n149 ) );
  OAI211_X1 \uut_master/U107  ( .C1(\uut_master/n34 ), .C2(\uut_master/n16 ), 
        .A(\uut_master/n1 ), .B(\uut_master/n148 ), .ZN(sck) );
  OAI21_X1 \uut_master/U106  ( .B1(\uut_master/n34 ), .B2(\uut_master/n154 ), 
        .A(\uut_master/n16 ), .ZN(\uut_master/n148 ) );
  NOR2_X1 \uut_master/U105  ( .A1(\uut_master/n32 ), .A2(cs), .ZN(
        \uut_master/N14 ) );
  OAI21_X1 \uut_master/U104  ( .B1(\uut_master/n147 ), .B2(\uut_master/n146 ), 
        .A(\uut_master/n295 ), .ZN(cs) );
  INV_X1 \uut_master/U103  ( .A(\uut_master/n145 ), .ZN(\uut_master/n146 ) );
  OAI22_X1 \uut_master/U102  ( .A1(rst), .A2(\uut_master/n145 ), .B1(
        \uut_master/n228 ), .B2(\uut_master/n154 ), .ZN(\uut_master/N303 ) );
  INV_X1 \uut_master/U101  ( .A(\uut_master/n21 ), .ZN(\uut_master/n147 ) );
  NAND2_X1 \uut_master/U100  ( .A1(\uut_master/n108 ), .A2(
        \uut_master/current_state [1]), .ZN(\uut_master/n296 ) );
  INV_X1 \uut_master/U99  ( .A(\uut_master/n107 ), .ZN(\uut_master/n154 ) );
  NAND2_X1 \uut_master/U98  ( .A1(\uut_master/n34 ), .A2(
        \uut_master/current_state [0]), .ZN(\uut_master/n145 ) );
  NOR2_X1 \uut_master/U97  ( .A1(\uut_master/n5 ), .A2(\uut_master/n144 ), 
        .ZN(\uut_master/N176 ) );
  NAND4_X1 \uut_master/U96  ( .A1(\uut_master/n8 ), .A2(\uut_master/n120 ), 
        .A3(\uut_master/data_count [4]), .A4(\uut_master/n19 ), .ZN(
        \uut_master/n144 ) );
  OAI22_X1 \uut_master/U95  ( .A1(\uut_master/n11 ), .A2(\uut_master/n143 ), 
        .B1(\uut_master/n45 ), .B2(\uut_master/n40 ), .ZN(\uut_master/N174 )
         );
  NAND2_X1 \uut_master/U94  ( .A1(\uut_master/n141 ), .A2(
        \uut_master/data_count [3]), .ZN(\uut_master/n142 ) );
  INV_X1 \uut_master/U93  ( .A(\uut_master/n140 ), .ZN(\uut_master/n141 ) );
  OAI22_X1 \uut_master/U92  ( .A1(\uut_master/n11 ), .A2(\uut_master/n139 ), 
        .B1(\uut_master/n46 ), .B2(\uut_master/n40 ), .ZN(\uut_master/N173 )
         );
  XOR2_X1 \uut_master/U91  ( .A(\uut_master/n140 ), .B(
        \uut_master/data_count [3]), .Z(\uut_master/n139 ) );
  OAI22_X1 \uut_master/U90  ( .A1(\uut_master/n152 ), .A2(\uut_master/n138 ), 
        .B1(\uut_master/n47 ), .B2(\uut_master/n119 ), .ZN(\uut_master/N172 )
         );
  OAI22_X1 \uut_master/U89  ( .A1(\uut_master/n137 ), .A2(\uut_master/n152 ), 
        .B1(\uut_master/n48 ), .B2(\uut_master/n40 ), .ZN(\uut_master/N171 )
         );
  XOR2_X1 \uut_master/U88  ( .A(\uut_master/n7 ), .B(
        \uut_master/data_count [1]), .Z(\uut_master/n137 ) );
  OAI22_X1 \uut_master/U87  ( .A1(\uut_master/data_count [0]), .A2(
        \uut_master/n152 ), .B1(\uut_master/n115 ), .B2(\uut_master/n7 ), .ZN(
        \uut_master/N170 ) );
  NAND3_X1 \uut_master/U86  ( .A1(\uut_master/n135 ), .A2(\uut_master/n230 ), 
        .A3(\uut_master/n12 ), .ZN(\uut_master/n152 ) );
  NAND4_X1 \uut_master/U85  ( .A1(\uut_master/n19 ), .A2(
        \uut_master/data_count [4]), .A3(\uut_master/data_count [5]), .A4(
        \uut_master/n8 ), .ZN(\uut_master/n135 ) );
  NOR3_X1 \uut_master/U84  ( .A1(\uut_master/n134 ), .A2(
        \uut_master/current_state [0]), .A3(\uut_master/n17 ), .ZN(
        \uut_master/N302 ) );
  NAND2_X1 \uut_master/U83  ( .A1(enable), .A2(\uut_master/n295 ), .ZN(
        \uut_master/n134 ) );
  INV_X1 \uut_master/U82  ( .A(\uut_master/n192 ), .ZN(\uut_master/n129 ) );
  INV_X1 \uut_master/U81  ( .A(\uut_master/n297 ), .ZN(\uut_master/n125 ) );
  NAND2_X2 \uut_master/U80  ( .A1(\uut_master/n28 ), .A2(\uut_master/n230 ), 
        .ZN(\uut_master/n246 ) );
  NAND2_X1 \uut_master/U79  ( .A1(\uut_master/n37 ), .A2(\uut_master/n230 ), 
        .ZN(\uut_master/n123 ) );
  NAND2_X1 \uut_master/U78  ( .A1(\uut_master/n28 ), .A2(\uut_master/n230 ), 
        .ZN(\uut_master/n122 ) );
  CLKBUF_X1 \uut_master/U77  ( .A(\uut_master/n224 ), .Z(\uut_master/n130 ) );
  INV_X2 \uut_master/U76  ( .A(\uut_master/n44 ), .ZN(\uut_master/n224 ) );
  INV_X2 \uut_master/U75  ( .A(\uut_master/n44 ), .ZN(\uut_master/n120 ) );
  AND4_X2 \uut_master/U74  ( .A1(\uut_master/n49 ), .A2(\uut_master/n17 ), 
        .A3(\uut_master/n38 ), .A4(\uut_master/n107 ), .ZN(\uut_master/n121 )
         );
  INV_X2 \uut_master/U73  ( .A(\uut_master/n110 ), .ZN(\uut_master/n334 ) );
  INV_X1 \uut_master/U72  ( .A(\uut_master/n110 ), .ZN(\uut_master/n119 ) );
  INV_X1 \uut_master/U71  ( .A(\uut_master/n39 ), .ZN(\uut_master/n118 ) );
  INV_X1 \uut_master/U70  ( .A(\uut_master/n121 ), .ZN(\uut_master/n116 ) );
  INV_X1 \uut_master/U69  ( .A(\uut_master/n39 ), .ZN(\uut_master/n115 ) );
  INV_X1 \uut_master/U68  ( .A(\uut_master/n335 ), .ZN(\uut_master/n114 ) );
  INV_X1 \uut_master/U67  ( .A(\uut_master/n245 ), .ZN(\uut_master/n113 ) );
  INV_X1 \uut_master/U66  ( .A(\uut_master/n192 ), .ZN(\uut_master/n112 ) );
  AND4_X2 \uut_master/U65  ( .A1(\uut_master/n17 ), .A2(\uut_master/n43 ), 
        .A3(\uut_master/n108 ), .A4(\uut_master/n107 ), .ZN(\uut_master/n110 )
         );
  INV_X1 \uut_master/U64  ( .A(\uut_master/n334 ), .ZN(\uut_master/n109 ) );
  XNOR2_X1 \uut_master/U63  ( .A(\uut_master/n142 ), .B(\uut_master/n45 ), 
        .ZN(\uut_master/n143 ) );
  INV_X1 \uut_master/U62  ( .A(\uut_master/n335 ), .ZN(\uut_master/n117 ) );
  INV_X1 \uut_master/U61  ( .A(\uut_master/n297 ), .ZN(\uut_master/n124 ) );
  INV_X1 \uut_master/U60  ( .A(\uut_master/n121 ), .ZN(\uut_master/n40 ) );
  AND4_X2 \uut_master/U59  ( .A1(\uut_master/n38 ), .A2(\uut_master/n49 ), 
        .A3(\uut_master/n107 ), .A4(\uut_master/n17 ), .ZN(\uut_master/n39 )
         );
  INV_X1 \uut_master/U58  ( .A(rst), .ZN(\uut_master/n295 ) );
  NOR2_X1 \uut_master/U57  ( .A1(\uut_master/n155 ), .A2(rst), .ZN(
        \uut_master/n43 ) );
  NAND2_X1 \uut_master/U56  ( .A1(\uut_master/n37 ), .A2(\uut_master/n22 ), 
        .ZN(\uut_master/n335 ) );
  BUF_X1 \uut_master/U55  ( .A(\uut_master/n111 ), .Z(\uut_master/n34 ) );
  INV_X1 \uut_master/U54  ( .A(\uut_master/n14 ), .ZN(\uut_master/n32 ) );
  AND2_X2 \uut_master/U53  ( .A1(\uut_master/n37 ), .A2(\uut_master/n22 ), 
        .ZN(\uut_master/n35 ) );
  NOR2_X1 \uut_master/U52  ( .A1(\uut_master/n136 ), .A2(\uut_master/n47 ), 
        .ZN(\uut_master/n31 ) );
  NAND2_X1 \uut_master/U51  ( .A1(\uut_master/data_count [1]), .A2(
        \uut_master/n31 ), .ZN(\uut_master/n140 ) );
  INV_X1 \uut_master/U50  ( .A(\uut_master/n193 ), .ZN(\uut_master/n227 ) );
  INV_X1 \uut_master/U49  ( .A(\uut_master/n193 ), .ZN(\uut_master/n30 ) );
  INV_X1 \uut_master/U48  ( .A(\uut_master/n335 ), .ZN(\uut_master/n29 ) );
  AND3_X1 \uut_master/U47  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n295 ), .A3(\uut_master/n108 ), .ZN(\uut_master/n37 ) );
  AND3_X1 \uut_master/U46  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n295 ), .A3(\uut_master/n108 ), .ZN(\uut_master/n28 ) );
  INV_X1 \uut_master/U45  ( .A(\uut_master/n193 ), .ZN(\uut_master/n27 ) );
  BUF_X1 \uut_master/U44  ( .A(\uut_master/n121 ), .Z(\uut_master/n126 ) );
  BUF_X1 \uut_master/U43  ( .A(\uut_master/n121 ), .Z(\uut_master/n26 ) );
  INV_X1 \uut_master/U42  ( .A(\uut_master/n156 ), .ZN(\uut_master/n189 ) );
  INV_X1 \uut_master/U41  ( .A(\uut_master/n156 ), .ZN(\uut_master/n25 ) );
  INV_X1 \uut_master/U40  ( .A(\uut_master/n121 ), .ZN(\uut_master/n24 ) );
  BUF_X1 \uut_master/U39  ( .A(\uut_master/n121 ), .Z(\uut_master/n23 ) );
  BUF_X1 \uut_master/U38  ( .A(\uut_master/n108 ), .Z(\uut_master/n38 ) );
  OR2_X1 \uut_master/U37  ( .A1(\uut_master/n42 ), .A2(\uut_master/n155 ), 
        .ZN(\uut_master/n230 ) );
  OAI21_X1 \uut_master/U36  ( .B1(\uut_master/n14 ), .B2(\uut_master/n154 ), 
        .A(\uut_master/n295 ), .ZN(\uut_master/n20 ) );
  AND2_X1 \uut_master/U35  ( .A1(\uut_master/data_count [2]), .A2(
        \uut_master/data_count [3]), .ZN(\uut_master/n19 ) );
  XOR2_X1 \uut_master/U34  ( .A(\uut_master/n9 ), .B(\uut_master/n47 ), .Z(
        \uut_master/n138 ) );
  BUF_X1 \uut_master/U33  ( .A(\uut_master/n2 ), .Z(\uut_master/n133 ) );
  BUF_X1 \uut_master/U32  ( .A(\uut_master/n2 ), .Z(\uut_master/n131 ) );
  BUF_X1 \uut_master/U31  ( .A(\uut_master/n2 ), .Z(\uut_master/n132 ) );
  AND2_X1 \uut_master/U30  ( .A1(\uut_master/n147 ), .A2(\uut_master/n295 ), 
        .ZN(\uut_master/n18 ) );
  INV_X1 \uut_master/U29  ( .A(\uut_master/n111 ), .ZN(\uut_master/n17 ) );
  INV_X1 \uut_master/U28  ( .A(\uut_master/current_state [0]), .ZN(
        \uut_master/n16 ) );
  CLKBUF_X1 \uut_master/U27  ( .A(\uut_master/n39 ), .Z(\uut_master/n41 ) );
  BUF_X1 \uut_master/U26  ( .A(\uut_master/n39 ), .Z(\uut_master/n15 ) );
  INV_X1 \uut_master/U25  ( .A(\uut_master/clock_count ), .ZN(\uut_master/n14 ) );
  CLKBUF_X3 \uut_master/U24  ( .A(\uut_master/n110 ), .Z(\uut_master/n127 ) );
  CLKBUF_X3 \uut_master/U23  ( .A(\uut_master/n110 ), .Z(\uut_master/n128 ) );
  CLKBUF_X1 \uut_master/U22  ( .A(\uut_master/n296 ), .Z(\uut_master/n21 ) );
  OR2_X1 \uut_master/U21  ( .A1(\uut_master/n42 ), .A2(\uut_master/n155 ), 
        .ZN(\uut_master/n22 ) );
  NAND2_X1 \uut_master/U20  ( .A1(\uut_master/n229 ), .A2(\uut_master/n295 ), 
        .ZN(\uut_master/n245 ) );
  BUF_X2 \uut_master/U19  ( .A(\uut_master/n123 ), .Z(\uut_master/n13 ) );
  NAND3_X1 \uut_master/U18  ( .A1(\uut_master/n135 ), .A2(\uut_master/n230 ), 
        .A3(\uut_master/n12 ), .ZN(\uut_master/n11 ) );
  INV_X1 \uut_master/U17  ( .A(\uut_master/n156 ), .ZN(\uut_master/n10 ) );
  NOR2_X1 \uut_master/U16  ( .A1(\uut_master/n48 ), .A2(\uut_master/n136 ), 
        .ZN(\uut_master/n36 ) );
  NOR2_X1 \uut_master/U15  ( .A1(\uut_master/n48 ), .A2(\uut_master/n136 ), 
        .ZN(\uut_master/n9 ) );
  NOR2_X1 \uut_master/U14  ( .A1(\uut_master/n48 ), .A2(\uut_master/n136 ), 
        .ZN(\uut_master/n8 ) );
  INV_X1 \uut_master/U13  ( .A(\uut_master/data_count [0]), .ZN(
        \uut_master/n7 ) );
  OR2_X1 \uut_master/U12  ( .A1(\uut_master/n21 ), .A2(rst), .ZN(
        \uut_master/n228 ) );
  BUF_X1 \uut_master/U11  ( .A(\uut_master/n122 ), .Z(\uut_master/n6 ) );
  BUF_X1 \uut_master/U10  ( .A(\uut_master/n122 ), .Z(\uut_master/n5 ) );
  BUF_X1 \uut_master/U9  ( .A(\uut_master/n122 ), .Z(\uut_master/n4 ) );
  CLKBUF_X1 \uut_master/U8  ( .A(\uut_master/n228 ), .Z(\uut_master/n3 ) );
  AND2_X1 \uut_master/U7  ( .A1(\uut_master/n301 ), .A2(\uut_master/n300 ), 
        .ZN(\uut_master/n2 ) );
  AND2_X2 \uut_master/U6  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n295 ), .ZN(\uut_master/n49 ) );
  BUF_X1 \uut_master/U5  ( .A(\uut_master/n49 ), .Z(\uut_master/n1 ) );
  CLKBUF_X3 \uut_master/U4  ( .A(\uut_master/n192 ), .Z(\uut_master/n33 ) );
  BUF_X1 \uut_master/U3  ( .A(\uut_master/n28 ), .Z(\uut_master/n12 ) );
  DFF_X2 \uut_master/data_in_reg[5]  ( .D(\uut_master/n345 ), .CK(clk), .Q(
        data_out[5]), .QN(\uut_master/n168 ) );
  DFF_X2 \uut_master/data_save_reg[63]  ( .D(\uut_master/n380 ), .CK(clk), .Q(
        \uut_master/data_save [63]), .QN(\uut_master/n50 ) );
  DFF_X2 \uut_master/data_in_reg[2]  ( .D(\uut_master/n342 ), .CK(clk), .Q(
        data_out[2]), .QN(\uut_master/n162 ) );
  DFF_X2 \uut_master/data_in_reg[19]  ( .D(\uut_master/n359 ), .CK(clk), .Q(
        data_out[19]), .QN(\uut_master/n201 ) );
  DFF_X1 \uut_master/data_save_reg[14]  ( .D(\uut_master/N120 ), .CK(clk), 
        .QN(\uut_master/n92 ) );
  DFF_X2 \uut_master/data_in_reg[22]  ( .D(\uut_master/n362 ), .CK(clk), .Q(
        data_out[22]), .QN(\uut_master/n207 ) );
  DFF_X2 \uut_master/data_in_reg[18]  ( .D(\uut_master/n358 ), .CK(clk), .Q(
        data_out[18]), .QN(\uut_master/n199 ) );
  DFF_X2 \uut_master/data_in_reg[1]  ( .D(\uut_master/n341 ), .CK(clk), .Q(
        data_out[1]), .QN(\uut_master/n160 ) );
  DFF_X2 \uut_master/data_in_reg[11]  ( .D(\uut_master/n351 ), .CK(clk), .Q(
        data_out[11]), .QN(\uut_master/n180 ) );
  DFF_X2 \uut_master/data_save_reg[11]  ( .D(\uut_master/N117 ), .CK(clk), 
        .QN(\uut_master/n95 ) );
  DFF_X2 \uut_master/data_save_reg[33]  ( .D(\uut_master/N139 ), .CK(clk), .Q(
        \uut_master/n291 ), .QN(\uut_master/n73 ) );
  DFF_X2 \uut_master/data_save_reg[39]  ( .D(\uut_master/N145 ), .CK(clk), .Q(
        \uut_master/n279 ), .QN(\uut_master/n67 ) );
  DFF_X2 \uut_master/data_save_reg[6]  ( .D(\uut_master/N112 ), .CK(clk), .QN(
        \uut_master/n100 ) );
  DFF_X2 \uut_master/data_save_reg[20]  ( .D(\uut_master/N126 ), .CK(clk), 
        .QN(\uut_master/n86 ) );
  DFF_X2 \uut_master/data_save_reg[28]  ( .D(\uut_master/N134 ), .CK(clk), 
        .QN(\uut_master/n78 ) );
  DFF_X2 \uut_master/data_save_reg[25]  ( .D(\uut_master/N131 ), .CK(clk), 
        .QN(\uut_master/n81 ) );
  DFF_X2 \uut_master/data_in_reg[8]  ( .D(\uut_master/n348 ), .CK(clk), .Q(
        data_out[8]), .QN(\uut_master/n174 ) );
  DFF_X2 \uut_master/data_save_reg[7]  ( .D(\uut_master/N113 ), .CK(clk), .QN(
        \uut_master/n99 ) );
  DFF_X2 \uut_master/data_save_reg[3]  ( .D(\uut_master/N109 ), .CK(clk), .QN(
        \uut_master/n103 ) );
  DFF_X2 \uut_master/data_save_reg[4]  ( .D(\uut_master/N110 ), .CK(clk), .QN(
        \uut_master/n102 ) );
  DFF_X2 \uut_master/data_save_reg[13]  ( .D(\uut_master/N119 ), .CK(clk), 
        .QN(\uut_master/n93 ) );
  DFF_X2 \uut_master/data_save_reg[10]  ( .D(\uut_master/N116 ), .CK(clk), 
        .QN(\uut_master/n96 ) );
  DFF_X2 \uut_master/data_save_reg[24]  ( .D(\uut_master/N130 ), .CK(clk), 
        .QN(\uut_master/n82 ) );
  DFF_X2 \uut_master/data_save_reg[8]  ( .D(\uut_master/N114 ), .CK(clk), .QN(
        \uut_master/n98 ) );
  DFF_X2 \uut_master/data_save_reg[15]  ( .D(\uut_master/N121 ), .CK(clk), 
        .QN(\uut_master/n91 ) );
  DFF_X2 \uut_master/data_save_reg[29]  ( .D(\uut_master/N135 ), .CK(clk), 
        .QN(\uut_master/n77 ) );
  DFF_X2 \uut_master/data_save_reg[26]  ( .D(\uut_master/N132 ), .CK(clk), 
        .QN(\uut_master/n80 ) );
  DFF_X2 \uut_master/data_save_reg[16]  ( .D(\uut_master/N122 ), .CK(clk), 
        .QN(\uut_master/n90 ) );
  DFF_X2 \uut_master/data_save_reg[9]  ( .D(\uut_master/N115 ), .CK(clk), .QN(
        \uut_master/n97 ) );
  DFF_X2 \uut_master/data_save_reg[27]  ( .D(\uut_master/N133 ), .CK(clk), 
        .QN(\uut_master/n79 ) );
  DFF_X2 \uut_master/data_save_reg[17]  ( .D(\uut_master/N123 ), .CK(clk), 
        .QN(\uut_master/n89 ) );
  DFF_X2 \uut_master/data_save_reg[19]  ( .D(\uut_master/N125 ), .CK(clk), 
        .QN(\uut_master/n87 ) );
  DFF_X2 \uut_master/data_save_reg[22]  ( .D(\uut_master/N128 ), .CK(clk), 
        .QN(\uut_master/n84 ) );
  DFF_X2 \uut_master/data_save_reg[21]  ( .D(\uut_master/N127 ), .CK(clk), 
        .QN(\uut_master/n85 ) );
  DFF_X2 \uut_master/data_save_reg[23]  ( .D(\uut_master/N129 ), .CK(clk), 
        .QN(\uut_master/n83 ) );
  DFF_X1 \uut_master/data_count_reg[5]  ( .D(\uut_master/N175 ), .CK(clk), .Q(
        \uut_master/data_count [5]), .QN(\uut_master/n44 ) );
  DFF_X1 \uut_master/current_state_reg[1]  ( .D(\uut_master/N303 ), .CK(clk), 
        .Q(\uut_master/current_state [1]), .QN(\uut_master/n111 ) );
  DFF_X1 \uut_master/clock_count_reg  ( .D(\uut_master/N14 ), .CK(clk), .Q(
        \uut_master/clock_count ), .QN(\uut_master/n155 ) );
  DFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/N302 ), .CK(clk), 
        .Q(\uut_master/current_state [0]), .QN(\uut_master/n108 ) );
  DFF_X1 \uut_master/data_save_reg[2]  ( .D(\uut_master/N108 ), .CK(clk), .QN(
        \uut_master/n104 ) );
  DFF_X1 \uut_master/data_save_reg[5]  ( .D(\uut_master/N111 ), .CK(clk), .QN(
        \uut_master/n101 ) );
  DFF_X1 \uut_master/data_save_reg[18]  ( .D(\uut_master/N124 ), .CK(clk), 
        .QN(\uut_master/n88 ) );
  DFF_X1 \uut_master/data_save_reg[31]  ( .D(\uut_master/N137 ), .CK(clk), .Q(
        \uut_master/n298 ), .QN(\uut_master/n75 ) );
  DFF_X1 \uut_master/data_save_reg[35]  ( .D(\uut_master/N141 ), .CK(clk), .Q(
        \uut_master/n287 ), .QN(\uut_master/n71 ) );
  DFF_X1 \uut_master/data_save_reg[36]  ( .D(\uut_master/N142 ), .CK(clk), .Q(
        \uut_master/n285 ), .QN(\uut_master/n70 ) );
  DFF_X1 \uut_master/data_save_reg[54]  ( .D(\uut_master/N160 ), .CK(clk), .Q(
        \uut_master/n249 ), .QN(\uut_master/n52 ) );
  DFF_X1 \uut_master/data_save_reg[1]  ( .D(\uut_master/N107 ), .CK(clk), .QN(
        \uut_master/n105 ) );
  DFF_X1 \uut_master/data_save_reg[12]  ( .D(\uut_master/N118 ), .CK(clk), 
        .QN(\uut_master/n94 ) );
  DFF_X1 \uut_master/data_in_reg[24]  ( .D(\uut_master/n364 ), .CK(clk), .Q(
        data_out[24]), .QN(\uut_master/n211 ) );
  DFF_X1 \uut_master/data_save_reg[37]  ( .D(\uut_master/N143 ), .CK(clk), .Q(
        \uut_master/n283 ), .QN(\uut_master/n69 ) );
  DFF_X1 \uut_master/data_save_reg[38]  ( .D(\uut_master/N144 ), .CK(clk), .Q(
        \uut_master/n281 ), .QN(\uut_master/n68 ) );
  DFF_X1 \uut_master/data_save_reg[46]  ( .D(\uut_master/N152 ), .CK(clk), .Q(
        \uut_master/n265 ), .QN(\uut_master/n60 ) );
  DFF_X1 \uut_master/data_save_reg[49]  ( .D(\uut_master/N155 ), .CK(clk), .Q(
        \uut_master/n259 ), .QN(\uut_master/n57 ) );
  DFF_X1 \uut_master/data_save_reg[43]  ( .D(\uut_master/N149 ), .CK(clk), .Q(
        \uut_master/n271 ), .QN(\uut_master/n63 ) );
  DFF_X1 \uut_master/data_save_reg[51]  ( .D(\uut_master/N157 ), .CK(clk), .Q(
        \uut_master/n255 ), .QN(\uut_master/n55 ) );
  DFF_X1 \uut_master/data_save_reg[53]  ( .D(\uut_master/N159 ), .CK(clk), .Q(
        \uut_master/n251 ), .QN(\uut_master/n53 ) );
  DFF_X1 \uut_master/data_save_reg[40]  ( .D(\uut_master/N146 ), .CK(clk), .Q(
        \uut_master/n277 ), .QN(\uut_master/n66 ) );
  DFF_X1 \uut_master/data_save_reg[41]  ( .D(\uut_master/N147 ), .CK(clk), .Q(
        \uut_master/n275 ), .QN(\uut_master/n65 ) );
  DFF_X1 \uut_master/data_save_reg[42]  ( .D(\uut_master/N148 ), .CK(clk), .Q(
        \uut_master/n273 ), .QN(\uut_master/n64 ) );
  DFF_X1 \uut_master/data_save_reg[48]  ( .D(\uut_master/N154 ), .CK(clk), .Q(
        \uut_master/n261 ), .QN(\uut_master/n58 ) );
  DFF_X1 \uut_master/data_save_reg[30]  ( .D(\uut_master/N136 ), .CK(clk), 
        .QN(\uut_master/n76 ) );
  DFF_X1 \uut_master/data_save_reg[45]  ( .D(\uut_master/N151 ), .CK(clk), .Q(
        \uut_master/n267 ), .QN(\uut_master/n61 ) );
  DFF_X1 \uut_master/data_save_reg[50]  ( .D(\uut_master/N156 ), .CK(clk), .Q(
        \uut_master/n257 ), .QN(\uut_master/n56 ) );
  DFF_X1 \uut_master/data_save_reg[34]  ( .D(\uut_master/N140 ), .CK(clk), .Q(
        \uut_master/n289 ), .QN(\uut_master/n72 ) );
  DFF_X1 \uut_master/data_save_reg[52]  ( .D(\uut_master/N158 ), .CK(clk), .Q(
        \uut_master/n253 ), .QN(\uut_master/n54 ) );
  DFF_X1 \uut_master/data_save_reg[44]  ( .D(\uut_master/N150 ), .CK(clk), .Q(
        \uut_master/n269 ), .QN(\uut_master/n62 ) );
  DFF_X1 \uut_master/data_save_reg[47]  ( .D(\uut_master/N153 ), .CK(clk), .Q(
        \uut_master/n263 ), .QN(\uut_master/n59 ) );
  DFF_X1 \uut_master/data_save_reg[32]  ( .D(\uut_master/N138 ), .CK(clk), .Q(
        \uut_master/n293 ), .QN(\uut_master/n74 ) );
  DFF_X1 \uut_master/data_save_reg[55]  ( .D(\uut_master/N161 ), .CK(clk), .Q(
        \uut_master/data_save [55]), .QN(\uut_master/n51 ) );
  DFF_X1 \uut_master/data_count_reg[0]  ( .D(\uut_master/N170 ), .CK(clk), .Q(
        \uut_master/data_count [0]), .QN(\uut_master/n136 ) );
  DFF_X1 \uut_master/data_count_reg[3]  ( .D(\uut_master/N173 ), .CK(clk), .Q(
        \uut_master/data_count [3]), .QN(\uut_master/n46 ) );
  DFF_X1 \uut_master/data_count_reg[4]  ( .D(\uut_master/N174 ), .CK(clk), .Q(
        \uut_master/data_count [4]), .QN(\uut_master/n45 ) );
  DFF_X1 \uut_master/data_count_reg[1]  ( .D(\uut_master/N171 ), .CK(clk), .Q(
        \uut_master/data_count [1]), .QN(\uut_master/n48 ) );
  DFF_X1 \uut_master/data_in_reg[23]  ( .D(\uut_master/n363 ), .CK(clk), .Q(
        data_out[23]), .QN(\uut_master/n209 ) );
  DFF_X1 \uut_master/data_in_reg[30]  ( .D(\uut_master/n370 ), .CK(clk), .Q(
        data_out[30]), .QN(\uut_master/n223 ) );
  DFF_X1 \uut_master/data_save_reg[56]  ( .D(\uut_master/n373 ), .CK(clk), 
        .QN(\uut_master/n248 ) );
  DFF_X1 \uut_master/data_in_reg[28]  ( .D(\uut_master/n368 ), .CK(clk), .Q(
        data_out[28]), .QN(\uut_master/n219 ) );
  DFF_X1 \uut_master/data_in_reg[17]  ( .D(\uut_master/n357 ), .CK(clk), .Q(
        data_out[17]), .QN(\uut_master/n197 ) );
  DFF_X1 \uut_master/data_in_reg[4]  ( .D(\uut_master/n344 ), .CK(clk), .Q(
        data_out[4]), .QN(\uut_master/n166 ) );
  DFF_X1 \uut_master/data_in_reg[12]  ( .D(\uut_master/n352 ), .CK(clk), .Q(
        data_out[12]), .QN(\uut_master/n182 ) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n356 ), .CK(clk), .Q(
        data_out[16]), .QN(\uut_master/n195 ) );
  DFF_X1 \uut_master/data_in_reg[7]  ( .D(\uut_master/n347 ), .CK(clk), .Q(
        data_out[7]), .QN(\uut_master/n172 ) );
  DFF_X1 \uut_master/data_in_reg[14]  ( .D(\uut_master/n354 ), .CK(clk), .Q(
        data_out[14]), .QN(\uut_master/n186 ) );
  DFF_X1 \uut_master/data_in_reg[15]  ( .D(\uut_master/n355 ), .CK(clk), .Q(
        data_out[15]), .QN(\uut_master/n188 ) );
  DFF_X1 \uut_master/data_in_reg[20]  ( .D(\uut_master/n360 ), .CK(clk), .Q(
        data_out[20]), .QN(\uut_master/n203 ) );
  DFF_X1 \uut_master/data_in_reg[29]  ( .D(\uut_master/n369 ), .CK(clk), .Q(
        data_out[29]), .QN(\uut_master/n221 ) );
  DFF_X1 \uut_master/data_in_reg[6]  ( .D(\uut_master/n346 ), .CK(clk), .Q(
        data_out[6]), .QN(\uut_master/n170 ) );
  DFF_X1 \uut_master/data_in_reg[13]  ( .D(\uut_master/n353 ), .CK(clk), .Q(
        data_out[13]), .QN(\uut_master/n184 ) );
  DFF_X1 \uut_master/data_in_reg[21]  ( .D(\uut_master/n361 ), .CK(clk), .Q(
        data_out[21]), .QN(\uut_master/n205 ) );
  DFF_X1 \uut_master/data_in_reg[3]  ( .D(\uut_master/n343 ), .CK(clk), .Q(
        data_out[3]), .QN(\uut_master/n164 ) );
  DFF_X1 \uut_master/data_in_reg[9]  ( .D(\uut_master/n349 ), .CK(clk), .Q(
        data_out[9]), .QN(\uut_master/n176 ) );
  DFF_X1 \uut_master/data_in_reg[10]  ( .D(\uut_master/n350 ), .CK(clk), .Q(
        data_out[10]), .QN(\uut_master/n178 ) );
  DFF_X1 \uut_master/data_in_reg[26]  ( .D(\uut_master/n366 ), .CK(clk), .Q(
        data_out[26]), .QN(\uut_master/n215 ) );
  DFF_X1 \uut_master/data_in_reg[31]  ( .D(\uut_master/n371 ), .CK(clk), .Q(
        data_out[31]), .QN(\uut_master/n226 ) );
  DFF_X1 \uut_master/data_in_reg[27]  ( .D(\uut_master/n367 ), .CK(clk), .Q(
        data_out[27]), .QN(\uut_master/n217 ) );
  DFF_X1 \uut_master/data_in_reg[25]  ( .D(\uut_master/n365 ), .CK(clk), .Q(
        data_out[25]), .QN(\uut_master/n213 ) );
  DFF_X1 \uut_master/data_in_reg[0]  ( .D(\uut_master/n340 ), .CK(clk), .Q(
        data_out[0]), .QN(\uut_master/n158 ) );
  DFF_X1 \uut_master/data_save_reg[57]  ( .D(\uut_master/n374 ), .CK(clk), 
        .QN(\uut_master/n243 ) );
  DFF_X1 \uut_master/data_save_reg[58]  ( .D(\uut_master/n375 ), .CK(clk), 
        .QN(\uut_master/n241 ) );
  DFF_X1 \uut_master/data_save_reg[60]  ( .D(\uut_master/n377 ), .CK(clk), 
        .QN(\uut_master/n237 ) );
  DFF_X1 \uut_master/data_save_reg[61]  ( .D(\uut_master/n378 ), .CK(clk), 
        .QN(\uut_master/n235 ) );
  DFF_X1 \uut_master/data_save_reg[62]  ( .D(\uut_master/n379 ), .CK(clk), 
        .QN(\uut_master/n233 ) );
  DFF_X1 \uut_master/data_save_reg[59]  ( .D(\uut_master/n376 ), .CK(clk), 
        .QN(\uut_master/n239 ) );
  DFF_X1 \uut_master/data_count_reg[2]  ( .D(\uut_master/N172 ), .CK(clk), .Q(
        \uut_master/data_count [2]), .QN(\uut_master/n47 ) );
  DFF_X1 \uut_master/data_save_reg[0]  ( .D(\uut_master/n372 ), .CK(clk), .Q(
        \uut_master/data_save [0]), .QN(\uut_master/n106 ) );
  DFF_X1 \uut_master/data_end_reg  ( .D(\uut_master/N176 ), .CK(clk), .Q(
        \uut_master/n42 ), .QN(\uut_master/n107 ) );
endmodule

