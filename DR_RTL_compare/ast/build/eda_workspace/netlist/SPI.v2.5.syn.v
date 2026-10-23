/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 08:06:14 2026
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
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
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
         \uut_master/n109 , \uut_master/n108 , \uut_master/n49 ,
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
         \uut_master/n3 , \uut_master/n2 , \uut_master/n1 ,
         \uut_master/net6499 , \uut_master/net12420 , \uut_master/net12300 ,
         \uut_master/net10041 , \uut_master/net10039 , \uut_master/net6529 ,
         \uut_master/net6518 , \uut_master/net6519 , \uut_master/net6507 ,
         \uut_master/net6508 , \uut_master/net6500 , \uut_master/net6485 ,
         \uut_master/net6467 , \uut_master/net6426 , \uut_master/net6427 ,
         \uut_master/net6417 , \uut_master/net6418 , \uut_master/net6411 ,
         \uut_master/net6376 , \uut_master/net6377 , \uut_master/net6354 ,
         \uut_master/net6336 , \uut_master/net6192 , \uut_master/net6198 ,
         \uut_master/net6151 , \uut_master/net6123 , \uut_master/net6122 ,
         \uut_master/net6121 , \uut_master/net6120 , \uut_master/net6119 ,
         \uut_master/net6111 , \uut_master/net6057 , \uut_master/net6054 ,
         \uut_master/net6050 , \uut_master/net6049 , \uut_master/net2830 ,
         \uut_master/n111 , \uut_master/n107 , \uut_master/n106 ,
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
         \uut_master/n51 , \uut_master/n50 , \uut_master/n48 ,
         \uut_master/n47 , \uut_master/n46 , \uut_master/n45 ,
         \uut_master/N302 , \uut_master/N301 , \uut_master/N175 ,
         \uut_master/N174 , \uut_master/N173 , \uut_master/N172 ,
         \uut_master/N171 , \uut_master/N170 , \uut_master/N169 ,
         \uut_master/N160 , \uut_master/N159 , \uut_master/N158 ,
         \uut_master/N157 , \uut_master/N156 , \uut_master/N155 ,
         \uut_master/N154 , \uut_master/N153 , \uut_master/N152 ,
         \uut_master/N151 , \uut_master/N150 , \uut_master/N149 ,
         \uut_master/N148 , \uut_master/N147 , \uut_master/N146 ,
         \uut_master/N145 , \uut_master/N144 , \uut_master/N143 ,
         \uut_master/N142 , \uut_master/N141 , \uut_master/N140 ,
         \uut_master/N139 , \uut_master/N138 , \uut_master/N137 ,
         \uut_master/N136 , \uut_master/N135 , \uut_master/N134 ,
         \uut_master/N133 , \uut_master/N132 , \uut_master/N131 ,
         \uut_master/N130 , \uut_master/N129 , \uut_master/N128 ,
         \uut_master/N127 , \uut_master/N126 , \uut_master/N125 ,
         \uut_master/N124 , \uut_master/N123 , \uut_master/N122 ,
         \uut_master/N121 , \uut_master/N120 , \uut_master/N119 ,
         \uut_master/N118 , \uut_master/N117 , \uut_master/N116 ,
         \uut_master/N115 , \uut_master/N114 , \uut_master/N113 ,
         \uut_master/N112 , \uut_master/N111 , \uut_master/N110 ,
         \uut_master/N109 , \uut_master/N108 , \uut_master/N107 ,
         \uut_master/N106 , \uut_master/N13 , \uut_master/clock_count ,
         \uut_slave/n246 , \uut_slave/n245 , \uut_slave/n244 ,
         \uut_slave/n243 , \uut_slave/n242 , \uut_slave/n241 ,
         \uut_slave/n240 , \uut_slave/n239 , \uut_slave/n238 ,
         \uut_slave/n237 , \uut_slave/n236 , \uut_slave/n235 ,
         \uut_slave/n234 , \uut_slave/n233 , \uut_slave/n232 ,
         \uut_slave/n231 , \uut_slave/n230 , \uut_slave/n229 ,
         \uut_slave/n228 , \uut_slave/n227 , \uut_slave/n226 ,
         \uut_slave/n225 , \uut_slave/n224 , \uut_slave/n223 ,
         \uut_slave/n222 , \uut_slave/n221 , \uut_slave/n220 ,
         \uut_slave/n219 , \uut_slave/n218 , \uut_slave/n217 ,
         \uut_slave/n216 , \uut_slave/n215 , \uut_slave/n214 ,
         \uut_slave/n213 , \uut_slave/n212 , \uut_slave/n211 ,
         \uut_slave/n210 , \uut_slave/n209 , \uut_slave/n208 ,
         \uut_slave/n207 , \uut_slave/n206 , \uut_slave/n127 ,
         \uut_slave/n126 , \uut_slave/n125 , \uut_slave/n124 ,
         \uut_slave/n123 , \uut_slave/n122 , \uut_slave/n121 ,
         \uut_slave/n120 , \uut_slave/n119 , \uut_slave/n118 ,
         \uut_slave/n117 , \uut_slave/n116 , \uut_slave/n115 ,
         \uut_slave/n114 , \uut_slave/n113 , \uut_slave/n112 ,
         \uut_slave/n111 , \uut_slave/n110 , \uut_slave/n109 ,
         \uut_slave/n108 , \uut_slave/n107 , \uut_slave/n106 ,
         \uut_slave/n105 , \uut_slave/n104 , \uut_slave/n103 ,
         \uut_slave/n102 , \uut_slave/n101 , \uut_slave/n100 , \uut_slave/n99 ,
         \uut_slave/n98 , \uut_slave/n97 , \uut_slave/n95 , \uut_slave/n94 ,
         \uut_slave/n93 , \uut_slave/n92 , \uut_slave/n91 , \uut_slave/n90 ,
         \uut_slave/n89 , \uut_slave/n88 , \uut_slave/n87 , \uut_slave/n86 ,
         \uut_slave/n85 , \uut_slave/n84 , \uut_slave/n83 , \uut_slave/n82 ,
         \uut_slave/n81 , \uut_slave/n80 , \uut_slave/n79 , \uut_slave/n78 ,
         \uut_slave/n77 , \uut_slave/n76 , \uut_slave/n75 , \uut_slave/n74 ,
         \uut_slave/n73 , \uut_slave/n72 , \uut_slave/n71 , \uut_slave/n70 ,
         \uut_slave/n69 , \uut_slave/n68 , \uut_slave/n67 , \uut_slave/n66 ,
         \uut_slave/n65 , \uut_slave/n64 , \uut_slave/n62 , \uut_slave/n61 ,
         \uut_slave/n60 , \uut_slave/n59 , \uut_slave/n58 , \uut_slave/n57 ,
         \uut_slave/n56 , \uut_slave/n55 , \uut_slave/n54 , \uut_slave/n53 ,
         \uut_slave/n52 , \uut_slave/n51 , \uut_slave/n50 , \uut_slave/n49 ,
         \uut_slave/n48 , \uut_slave/n47 , \uut_slave/n46 , \uut_slave/n45 ,
         \uut_slave/n44 , \uut_slave/n43 , \uut_slave/n42 , \uut_slave/n41 ,
         \uut_slave/n40 , \uut_slave/n39 , \uut_slave/n38 , \uut_slave/n37 ,
         \uut_slave/n36 , \uut_slave/n35 , \uut_slave/n34 , \uut_slave/n33 ,
         \uut_slave/n32 , \uut_slave/n31 , \uut_slave/n30 , \uut_slave/n29 ,
         \uut_slave/n25 , \uut_slave/n24 , \uut_slave/n23 , \uut_slave/n17 ,
         \uut_slave/n16 , \uut_slave/n15 , \uut_slave/n14 , \uut_slave/n13 ,
         \uut_slave/n12 , \uut_slave/n11 , \uut_slave/n9 , \uut_slave/n8 ,
         \uut_slave/n7 , \uut_slave/n6 , \uut_slave/n5 , \uut_slave/n4 ,
         \uut_slave/n3 , \uut_slave/n2 , \uut_slave/n1 , \uut_slave/n205 ,
         \uut_slave/n204 , \uut_slave/n203 , \uut_slave/n202 ,
         \uut_slave/n201 , \uut_slave/n200 , \uut_slave/n199 ,
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
         \uut_slave/n129 , \uut_slave/n128 , \uut_slave/n96 , \uut_slave/n63 ,
         \uut_slave/n28 , \uut_slave/n27 , \uut_slave/n26 , \uut_slave/n22 ,
         \uut_slave/n21 , \uut_slave/n20 , \uut_slave/n19 , \uut_slave/n18 ,
         \uut_slave/n10 , \uut_slave/N211 , \uut_slave/N210 , \uut_slave/N41 ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [5:0] \uut_master/data_count ;
  wire   [63:0] \uut_master/data_save ;
  wire   [1:0] \uut_master/current_state ;
  wire   [5:0] \uut_slave/data_count ;

  DLH_X1 \data_in_reg[31]  ( .G(n19), .D(N70), .Q(data_in[31]) );
  DLH_X1 \data_in_reg[30]  ( .G(n19), .D(N69), .Q(data_in[30]) );
  DLH_X1 \data_in_reg[29]  ( .G(n19), .D(N68), .Q(data_in[29]) );
  DLH_X1 \data_in_reg[28]  ( .G(n19), .D(N67), .Q(data_in[28]) );
  DLH_X1 \data_in_reg[27]  ( .G(n19), .D(N66), .Q(data_in[27]) );
  DLH_X1 \data_in_reg[26]  ( .G(n19), .D(N65), .Q(data_in[26]) );
  DLH_X1 \data_in_reg[25]  ( .G(n19), .D(N64), .Q(data_in[25]) );
  DLH_X1 \data_in_reg[24]  ( .G(n19), .D(N63), .Q(data_in[24]) );
  DLH_X1 \data_in_reg[23]  ( .G(n19), .D(N61), .Q(data_in[23]) );
  DLH_X1 \data_in_reg[22]  ( .G(n19), .D(N60), .Q(data_in[22]) );
  DLH_X1 \data_in_reg[21]  ( .G(n19), .D(N59), .Q(data_in[21]) );
  DLH_X1 \data_in_reg[20]  ( .G(n20), .D(N58), .Q(data_in[20]) );
  DLH_X1 \data_in_reg[19]  ( .G(n20), .D(N57), .Q(data_in[19]) );
  DLH_X1 \data_in_reg[18]  ( .G(n20), .D(N56), .Q(data_in[18]) );
  DLH_X1 \data_in_reg[17]  ( .G(n20), .D(N55), .Q(data_in[17]) );
  DLH_X1 \data_in_reg[16]  ( .G(n20), .D(N54), .Q(data_in[16]) );
  DLH_X1 \data_in_reg[15]  ( .G(n20), .D(N53), .Q(data_in[15]) );
  DLH_X1 \data_in_reg[14]  ( .G(n20), .D(N52), .Q(data_in[14]) );
  DLH_X1 \data_in_reg[13]  ( .G(n20), .D(N51), .Q(data_in[13]) );
  DLH_X1 \data_in_reg[12]  ( .G(n20), .D(N50), .Q(data_in[12]) );
  DLH_X1 \data_in_reg[11]  ( .G(n20), .D(N49), .Q(data_in[11]) );
  DLH_X1 \data_in_reg[10]  ( .G(n20), .D(N48), .Q(data_in[10]) );
  DLH_X1 \data_in_reg[9]  ( .G(n21), .D(N47), .Q(data_in[9]) );
  DLH_X1 \data_in_reg[8]  ( .G(n21), .D(N46), .Q(data_in[8]) );
  DLH_X1 \data_in_reg[7]  ( .G(n21), .D(N44), .Q(data_in[7]) );
  DLH_X1 \data_in_reg[6]  ( .G(n21), .D(N43), .Q(data_in[6]) );
  DLH_X1 \data_in_reg[5]  ( .G(n21), .D(N42), .Q(data_in[5]) );
  DLH_X1 \data_in_reg[4]  ( .G(n21), .D(N41), .Q(data_in[4]) );
  DLH_X1 \data_in_reg[3]  ( .G(n21), .D(N40), .Q(data_in[3]) );
  DLH_X1 \data_in_reg[2]  ( .G(n21), .D(N39), .Q(data_in[2]) );
  DLH_X1 \data_in_reg[1]  ( .G(n21), .D(N38), .Q(data_in[1]) );
  DLH_X1 \data_in_reg[0]  ( .G(n21), .D(N36), .Q(data_in[0]) );
  DLH_X1 \address_reg[23]  ( .G(n23), .D(N61), .Q(address[23]) );
  DLH_X1 \address_reg[22]  ( .G(n23), .D(N60), .Q(address[22]) );
  DLH_X1 \address_reg[21]  ( .G(n23), .D(N59), .Q(address[21]) );
  DLH_X1 \address_reg[20]  ( .G(n23), .D(N58), .Q(address[20]) );
  DLH_X1 \address_reg[19]  ( .G(n23), .D(N57), .Q(address[19]) );
  DLH_X1 \address_reg[18]  ( .G(n23), .D(N56), .Q(address[18]) );
  DLH_X1 \address_reg[17]  ( .G(n23), .D(N55), .Q(address[17]) );
  DLH_X1 \address_reg[16]  ( .G(n23), .D(N54), .Q(address[16]) );
  DLH_X1 \address_reg[15]  ( .G(n23), .D(N53), .Q(address[15]) );
  DLH_X1 \address_reg[14]  ( .G(n23), .D(N52), .Q(address[14]) );
  DLH_X1 \address_reg[13]  ( .G(n23), .D(N51), .Q(address[13]) );
  DLH_X1 \address_reg[12]  ( .G(n24), .D(N50), .Q(address[12]) );
  DLH_X1 \address_reg[11]  ( .G(n24), .D(N49), .Q(address[11]) );
  DLH_X1 \address_reg[10]  ( .G(n24), .D(N48), .Q(address[10]) );
  DLH_X1 \address_reg[9]  ( .G(n24), .D(N47), .Q(address[9]) );
  DLH_X1 \address_reg[8]  ( .G(n24), .D(N46), .Q(address[8]) );
  DLH_X1 \address_reg[7]  ( .G(n24), .D(N44), .Q(address[7]) );
  DLH_X1 \address_reg[6]  ( .G(n24), .D(N43), .Q(address[6]) );
  DLH_X1 \address_reg[5]  ( .G(n24), .D(N42), .Q(address[5]) );
  DLH_X1 \address_reg[4]  ( .G(n24), .D(N41), .Q(address[4]) );
  DLH_X1 \address_reg[3]  ( .G(n24), .D(N40), .Q(address[3]) );
  DLH_X1 \address_reg[2]  ( .G(n24), .D(N39), .Q(address[2]) );
  DLH_X1 \address_reg[1]  ( .G(n25), .D(N38), .Q(address[1]) );
  DLH_X1 \address_reg[0]  ( .G(n25), .D(N36), .Q(address[0]) );
  DLH_X1 enable_reg ( .G(N35), .D(N36), .Q(enable) );
  DLH_X1 \command_reg[7]  ( .G(N37), .D(N44), .Q(command[7]) );
  DLH_X1 \command_reg[6]  ( .G(N37), .D(N43), .Q(command[6]) );
  DLH_X1 \command_reg[5]  ( .G(N37), .D(N42), .Q(command[5]) );
  DLH_X1 \command_reg[4]  ( .G(N37), .D(N41), .Q(command[4]) );
  DLH_X1 \command_reg[3]  ( .G(N37), .D(N40), .Q(command[3]) );
  DLH_X1 \command_reg[2]  ( .G(N37), .D(N39), .Q(command[2]) );
  DLH_X1 \command_reg[1]  ( .G(N37), .D(N38), .Q(command[1]) );
  DLH_X1 \command_reg[0]  ( .G(N37), .D(N36), .Q(command[0]) );
  DLH_X1 \read_data_reg[0]  ( .G(n17), .D(data_out[0]), .Q(read_data[0]) );
  DLH_X1 \read_data_reg[1]  ( .G(n17), .D(data_out[1]), .Q(read_data[1]) );
  DLH_X1 \read_data_reg[2]  ( .G(n17), .D(data_out[2]), .Q(read_data[2]) );
  DLH_X1 \read_data_reg[3]  ( .G(n17), .D(data_out[3]), .Q(read_data[3]) );
  DLH_X1 \read_data_reg[4]  ( .G(n17), .D(data_out[4]), .Q(read_data[4]) );
  DLH_X1 \read_data_reg[5]  ( .G(n17), .D(data_out[5]), .Q(read_data[5]) );
  DLH_X1 \read_data_reg[6]  ( .G(n17), .D(data_out[6]), .Q(read_data[6]) );
  DLH_X1 \read_data_reg[7]  ( .G(n17), .D(data_out[7]), .Q(read_data[7]) );
  DLH_X1 \read_data_reg[8]  ( .G(n17), .D(data_out[8]), .Q(read_data[8]) );
  DLH_X1 \read_data_reg[9]  ( .G(n17), .D(data_out[9]), .Q(read_data[9]) );
  DLH_X1 \read_data_reg[10]  ( .G(n16), .D(data_out[10]), .Q(read_data[10]) );
  DLH_X1 \read_data_reg[11]  ( .G(n16), .D(data_out[11]), .Q(read_data[11]) );
  DLH_X1 \read_data_reg[12]  ( .G(n16), .D(data_out[12]), .Q(read_data[12]) );
  DLH_X1 \read_data_reg[13]  ( .G(n16), .D(data_out[13]), .Q(read_data[13]) );
  DLH_X1 \read_data_reg[14]  ( .G(n16), .D(data_out[14]), .Q(read_data[14]) );
  DLH_X1 \read_data_reg[15]  ( .G(n16), .D(data_out[15]), .Q(read_data[15]) );
  DLH_X1 \read_data_reg[16]  ( .G(n16), .D(data_out[16]), .Q(read_data[16]) );
  DLH_X1 \read_data_reg[17]  ( .G(n16), .D(data_out[17]), .Q(read_data[17]) );
  DLH_X1 \read_data_reg[18]  ( .G(n16), .D(data_out[18]), .Q(read_data[18]) );
  DLH_X1 \read_data_reg[19]  ( .G(n16), .D(data_out[19]), .Q(read_data[19]) );
  DLH_X1 \read_data_reg[20]  ( .G(n16), .D(data_out[20]), .Q(read_data[20]) );
  DLH_X1 \read_data_reg[21]  ( .G(n15), .D(data_out[21]), .Q(read_data[21]) );
  DLH_X1 \read_data_reg[22]  ( .G(n15), .D(data_out[22]), .Q(read_data[22]) );
  DLH_X1 \read_data_reg[23]  ( .G(n15), .D(data_out[23]), .Q(read_data[23]) );
  DLH_X1 \read_data_reg[24]  ( .G(n15), .D(data_out[24]), .Q(read_data[24]) );
  DLH_X1 \read_data_reg[25]  ( .G(n15), .D(data_out[25]), .Q(read_data[25]) );
  DLH_X1 \read_data_reg[26]  ( .G(n15), .D(data_out[26]), .Q(read_data[26]) );
  DLH_X1 \read_data_reg[27]  ( .G(n15), .D(data_out[27]), .Q(read_data[27]) );
  DLH_X1 \read_data_reg[28]  ( .G(n15), .D(data_out[28]), .Q(read_data[28]) );
  DLH_X1 \read_data_reg[29]  ( .G(n15), .D(data_out[29]), .Q(read_data[29]) );
  DLH_X1 \read_data_reg[30]  ( .G(n15), .D(data_out[30]), .Q(read_data[30]) );
  DLH_X1 \read_data_reg[31]  ( .G(n15), .D(data_out[31]), .Q(read_data[31]) );
  NAND3_X1 U46 ( .A1(addr[0]), .A2(n7), .A3(addr[1]), .ZN(n6) );
  NAND3_X1 U47 ( .A1(n7), .A2(n29), .A3(addr[1]), .ZN(n8) );
  NAND3_X1 U48 ( .A1(n7), .A2(n28), .A3(addr[0]), .ZN(n9) );
  NAND3_X1 U49 ( .A1(n29), .A2(n28), .A3(n7), .ZN(n10) );
  BUF_X1 U50 ( .A(N45), .Z(n26) );
  BUF_X1 U51 ( .A(N62), .Z(n22) );
  BUF_X1 U52 ( .A(N71), .Z(n18) );
  BUF_X2 U53 ( .A(sck), .Z(n14) );
  NAND2_X1 U54 ( .A1(n11), .A2(n10), .ZN(N35) );
  BUF_X1 U55 ( .A(n27), .Z(n11) );
  BUF_X1 U56 ( .A(n27), .Z(n12) );
  BUF_X1 U57 ( .A(n18), .Z(n15) );
  BUF_X1 U58 ( .A(n18), .Z(n16) );
  BUF_X1 U59 ( .A(n18), .Z(n17) );
  BUF_X1 U60 ( .A(n26), .Z(n24) );
  BUF_X1 U61 ( .A(n26), .Z(n23) );
  BUF_X1 U62 ( .A(n22), .Z(n20) );
  BUF_X1 U63 ( .A(n22), .Z(n19) );
  BUF_X1 U64 ( .A(n22), .Z(n21) );
  BUF_X1 U65 ( .A(n27), .Z(n13) );
  BUF_X1 U66 ( .A(n26), .Z(n25) );
  NOR2_X1 U67 ( .A1(n30), .A2(addr[2]), .ZN(n7) );
  INV_X1 U68 ( .A(we), .ZN(n30) );
  NAND2_X1 U69 ( .A1(n11), .A2(n9), .ZN(N37) );
  NOR4_X1 U70 ( .A1(n5), .A2(addr[0]), .A3(rst), .A4(addr[1]), .ZN(N71) );
  NAND2_X1 U71 ( .A1(re), .A2(addr[2]), .ZN(n5) );
  AND2_X1 U72 ( .A1(write_data[0]), .A2(n11), .ZN(N36) );
  NAND2_X1 U73 ( .A1(n11), .A2(n8), .ZN(N45) );
  NAND2_X1 U74 ( .A1(n11), .A2(n6), .ZN(N62) );
  INV_X1 U75 ( .A(rst), .ZN(n27) );
  AND2_X1 U76 ( .A1(write_data[1]), .A2(n11), .ZN(N38) );
  AND2_X1 U77 ( .A1(write_data[2]), .A2(n11), .ZN(N39) );
  AND2_X1 U78 ( .A1(write_data[3]), .A2(n11), .ZN(N40) );
  AND2_X1 U79 ( .A1(write_data[4]), .A2(n11), .ZN(N41) );
  AND2_X1 U80 ( .A1(write_data[5]), .A2(n11), .ZN(N42) );
  AND2_X1 U81 ( .A1(write_data[6]), .A2(n12), .ZN(N43) );
  AND2_X1 U82 ( .A1(write_data[7]), .A2(n11), .ZN(N44) );
  AND2_X1 U83 ( .A1(write_data[8]), .A2(n11), .ZN(N46) );
  AND2_X1 U84 ( .A1(write_data[9]), .A2(n11), .ZN(N47) );
  AND2_X1 U85 ( .A1(write_data[10]), .A2(n11), .ZN(N48) );
  AND2_X1 U86 ( .A1(write_data[11]), .A2(n11), .ZN(N49) );
  AND2_X1 U87 ( .A1(write_data[12]), .A2(n12), .ZN(N50) );
  AND2_X1 U88 ( .A1(write_data[13]), .A2(n12), .ZN(N51) );
  AND2_X1 U89 ( .A1(write_data[14]), .A2(n12), .ZN(N52) );
  AND2_X1 U90 ( .A1(write_data[15]), .A2(n12), .ZN(N53) );
  AND2_X1 U91 ( .A1(write_data[16]), .A2(n12), .ZN(N54) );
  AND2_X1 U92 ( .A1(write_data[17]), .A2(n12), .ZN(N55) );
  AND2_X1 U93 ( .A1(write_data[18]), .A2(n12), .ZN(N56) );
  AND2_X1 U94 ( .A1(write_data[19]), .A2(n12), .ZN(N57) );
  AND2_X1 U95 ( .A1(write_data[20]), .A2(n12), .ZN(N58) );
  AND2_X1 U96 ( .A1(write_data[21]), .A2(n12), .ZN(N59) );
  AND2_X1 U97 ( .A1(write_data[22]), .A2(n12), .ZN(N60) );
  AND2_X1 U98 ( .A1(write_data[23]), .A2(n12), .ZN(N61) );
  INV_X1 U99 ( .A(addr[1]), .ZN(n28) );
  INV_X1 U100 ( .A(addr[0]), .ZN(n29) );
  AND2_X1 U101 ( .A1(write_data[24]), .A2(n12), .ZN(N63) );
  AND2_X1 U102 ( .A1(write_data[25]), .A2(n12), .ZN(N64) );
  AND2_X1 U103 ( .A1(write_data[26]), .A2(n12), .ZN(N65) );
  AND2_X1 U104 ( .A1(write_data[27]), .A2(n12), .ZN(N66) );
  AND2_X1 U105 ( .A1(write_data[28]), .A2(n12), .ZN(N67) );
  AND2_X1 U106 ( .A1(write_data[29]), .A2(n13), .ZN(N68) );
  AND2_X1 U107 ( .A1(write_data[30]), .A2(n13), .ZN(N69) );
  AND2_X1 U108 ( .A1(write_data[31]), .A2(n11), .ZN(N70) );
  NOR2_X1 \uut_master/U350  ( .A1(\uut_master/n50 ), .A2(\uut_master/n304 ), 
        .ZN(mosi) );
  NAND2_X1 \uut_master/U349  ( .A1(\uut_master/data_save [63]), .A2(
        \uut_master/n20 ), .ZN(\uut_master/n300 ) );
  OAI222_X1 \uut_master/U348  ( .A1(\uut_master/n38 ), .A2(\uut_master/n299 ), 
        .B1(\uut_master/n23 ), .B2(\uut_master/n298 ), .C1(\uut_master/n26 ), 
        .C2(\uut_master/n301 ), .ZN(\uut_master/n343 ) );
  OAI222_X1 \uut_master/U347  ( .A1(\uut_master/n27 ), .A2(\uut_master/n297 ), 
        .B1(\uut_master/n23 ), .B2(\uut_master/n296 ), .C1(\uut_master/n10 ), 
        .C2(\uut_master/n299 ), .ZN(\uut_master/n342 ) );
  OAI222_X1 \uut_master/U346  ( .A1(\uut_master/n35 ), .A2(\uut_master/n295 ), 
        .B1(\uut_master/n23 ), .B2(\uut_master/n294 ), .C1(\uut_master/n15 ), 
        .C2(\uut_master/n297 ), .ZN(\uut_master/n341 ) );
  OAI222_X1 \uut_master/U345  ( .A1(\uut_master/n24 ), .A2(\uut_master/n293 ), 
        .B1(\uut_master/n23 ), .B2(\uut_master/n292 ), .C1(\uut_master/n15 ), 
        .C2(\uut_master/n295 ), .ZN(\uut_master/n340 ) );
  OAI222_X1 \uut_master/U344  ( .A1(\uut_master/n38 ), .A2(\uut_master/n291 ), 
        .B1(\uut_master/n23 ), .B2(\uut_master/n290 ), .C1(\uut_master/n26 ), 
        .C2(\uut_master/n293 ), .ZN(\uut_master/n339 ) );
  OAI222_X1 \uut_master/U343  ( .A1(\uut_master/n43 ), .A2(\uut_master/n289 ), 
        .B1(\uut_master/n23 ), .B2(\uut_master/n288 ), .C1(\uut_master/n10 ), 
        .C2(\uut_master/n291 ), .ZN(\uut_master/n338 ) );
  OAI21_X1 \uut_master/U342  ( .B1(\uut_master/n42 ), .B2(\uut_master/n289 ), 
        .A(\uut_master/n287 ), .ZN(\uut_master/n337 ) );
  AOI22_X1 \uut_master/U341  ( .A1(command[0]), .A2(\uut_master/n36 ), .B1(
        \uut_master/data_save [55]), .B2(\uut_master/n21 ), .ZN(
        \uut_master/n287 ) );
  OAI21_X1 \uut_master/U340  ( .B1(\uut_master/n51 ), .B2(\uut_master/n14 ), 
        .A(\uut_master/n285 ), .ZN(\uut_master/N160 ) );
  AOI22_X1 \uut_master/U339  ( .A1(\uut_master/n37 ), .A2(address[23]), .B1(
        \uut_master/n25 ), .B2(\uut_master/n284 ), .ZN(\uut_master/n285 ) );
  OAI21_X1 \uut_master/U338  ( .B1(\uut_master/n52 ), .B2(\uut_master/n15 ), 
        .A(\uut_master/n283 ), .ZN(\uut_master/N159 ) );
  AOI22_X1 \uut_master/U337  ( .A1(address[22]), .A2(\uut_master/n109 ), .B1(
        \uut_master/n112 ), .B2(\uut_master/n282 ), .ZN(\uut_master/n283 ) );
  OAI21_X1 \uut_master/U336  ( .B1(\uut_master/n53 ), .B2(\uut_master/n39 ), 
        .A(\uut_master/n281 ), .ZN(\uut_master/N158 ) );
  AOI22_X1 \uut_master/U335  ( .A1(address[21]), .A2(\uut_master/n109 ), .B1(
        \uut_master/n33 ), .B2(\uut_master/n280 ), .ZN(\uut_master/n281 ) );
  OAI21_X1 \uut_master/U334  ( .B1(\uut_master/n54 ), .B2(\uut_master/n10 ), 
        .A(\uut_master/n279 ), .ZN(\uut_master/N157 ) );
  AOI22_X1 \uut_master/U333  ( .A1(address[20]), .A2(\uut_master/n108 ), .B1(
        \uut_master/n28 ), .B2(\uut_master/n278 ), .ZN(\uut_master/n279 ) );
  OAI21_X1 \uut_master/U332  ( .B1(\uut_master/n42 ), .B2(\uut_master/n55 ), 
        .A(\uut_master/n277 ), .ZN(\uut_master/N156 ) );
  AOI22_X1 \uut_master/U331  ( .A1(address[19]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n33 ), .B2(\uut_master/n276 ), .ZN(\uut_master/n277 ) );
  OAI21_X1 \uut_master/U330  ( .B1(\uut_master/n56 ), .B2(\uut_master/n15 ), 
        .A(\uut_master/n275 ), .ZN(\uut_master/N155 ) );
  AOI22_X1 \uut_master/U329  ( .A1(address[18]), .A2(\uut_master/n37 ), .B1(
        \uut_master/n21 ), .B2(\uut_master/n274 ), .ZN(\uut_master/n275 ) );
  OAI21_X1 \uut_master/U328  ( .B1(\uut_master/n57 ), .B2(\uut_master/n14 ), 
        .A(\uut_master/n273 ), .ZN(\uut_master/N154 ) );
  AOI22_X1 \uut_master/U327  ( .A1(address[17]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n25 ), .B2(\uut_master/n272 ), .ZN(\uut_master/n273 ) );
  OAI21_X1 \uut_master/U326  ( .B1(\uut_master/n58 ), .B2(\uut_master/n42 ), 
        .A(\uut_master/n271 ), .ZN(\uut_master/N153 ) );
  AOI22_X1 \uut_master/U325  ( .A1(address[16]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n270 ), .ZN(\uut_master/n271 ) );
  OAI21_X1 \uut_master/U324  ( .B1(\uut_master/n59 ), .B2(\uut_master/n39 ), 
        .A(\uut_master/n269 ), .ZN(\uut_master/N152 ) );
  AOI22_X1 \uut_master/U323  ( .A1(address[15]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n28 ), .B2(\uut_master/n268 ), .ZN(\uut_master/n269 ) );
  OAI21_X1 \uut_master/U322  ( .B1(\uut_master/n60 ), .B2(\uut_master/n15 ), 
        .A(\uut_master/n267 ), .ZN(\uut_master/N151 ) );
  AOI22_X1 \uut_master/U321  ( .A1(address[14]), .A2(\uut_master/n108 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n266 ), .ZN(\uut_master/n267 ) );
  OAI21_X1 \uut_master/U320  ( .B1(\uut_master/n61 ), .B2(\uut_master/n15 ), 
        .A(\uut_master/n265 ), .ZN(\uut_master/N150 ) );
  AOI22_X1 \uut_master/U319  ( .A1(address[13]), .A2(\uut_master/n36 ), .B1(
        \uut_master/n18 ), .B2(\uut_master/n264 ), .ZN(\uut_master/n265 ) );
  OAI21_X1 \uut_master/U318  ( .B1(\uut_master/n62 ), .B2(\uut_master/n39 ), 
        .A(\uut_master/n263 ), .ZN(\uut_master/N149 ) );
  AOI22_X1 \uut_master/U317  ( .A1(\uut_master/n36 ), .A2(address[12]), .B1(
        \uut_master/n34 ), .B2(\uut_master/n262 ), .ZN(\uut_master/n263 ) );
  OAI21_X1 \uut_master/U316  ( .B1(\uut_master/n63 ), .B2(\uut_master/n14 ), 
        .A(\uut_master/n261 ), .ZN(\uut_master/N148 ) );
  AOI22_X1 \uut_master/U315  ( .A1(address[11]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n33 ), .B2(\uut_master/n260 ), .ZN(\uut_master/n261 ) );
  OAI21_X1 \uut_master/U314  ( .B1(\uut_master/n64 ), .B2(\uut_master/n10 ), 
        .A(\uut_master/n259 ), .ZN(\uut_master/N147 ) );
  AOI22_X1 \uut_master/U313  ( .A1(address[10]), .A2(\uut_master/n36 ), .B1(
        \uut_master/n33 ), .B2(\uut_master/n258 ), .ZN(\uut_master/n259 ) );
  OAI21_X1 \uut_master/U312  ( .B1(\uut_master/n65 ), .B2(\uut_master/n10 ), 
        .A(\uut_master/n257 ), .ZN(\uut_master/N146 ) );
  AOI22_X1 \uut_master/U311  ( .A1(address[9]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n18 ), .B2(\uut_master/n256 ), .ZN(\uut_master/n257 ) );
  OAI21_X1 \uut_master/U310  ( .B1(\uut_master/n66 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n255 ), .ZN(\uut_master/N145 ) );
  AOI22_X1 \uut_master/U309  ( .A1(address[8]), .A2(\uut_master/n109 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n254 ), .ZN(\uut_master/n255 ) );
  OAI21_X1 \uut_master/U308  ( .B1(\uut_master/n67 ), .B2(\uut_master/n15 ), 
        .A(\uut_master/n253 ), .ZN(\uut_master/N144 ) );
  AOI22_X1 \uut_master/U307  ( .A1(address[7]), .A2(\uut_master/n37 ), .B1(
        \uut_master/n18 ), .B2(\uut_master/n252 ), .ZN(\uut_master/n253 ) );
  OAI21_X1 \uut_master/U306  ( .B1(\uut_master/n68 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n251 ), .ZN(\uut_master/N143 ) );
  AOI22_X1 \uut_master/U305  ( .A1(address[6]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n250 ), .ZN(\uut_master/n251 ) );
  OAI21_X1 \uut_master/U304  ( .B1(\uut_master/n69 ), .B2(\uut_master/n42 ), 
        .A(\uut_master/n249 ), .ZN(\uut_master/N142 ) );
  AOI22_X1 \uut_master/U303  ( .A1(address[5]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n248 ), .ZN(\uut_master/n249 ) );
  OAI21_X1 \uut_master/U302  ( .B1(\uut_master/n70 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n247 ), .ZN(\uut_master/N141 ) );
  AOI22_X1 \uut_master/U301  ( .A1(address[4]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n246 ), .ZN(\uut_master/n247 ) );
  OAI21_X1 \uut_master/U300  ( .B1(\uut_master/n71 ), .B2(\uut_master/n42 ), 
        .A(\uut_master/n245 ), .ZN(\uut_master/N140 ) );
  AOI22_X1 \uut_master/U299  ( .A1(\uut_master/n36 ), .A2(address[3]), .B1(
        \uut_master/n34 ), .B2(\uut_master/n244 ), .ZN(\uut_master/n245 ) );
  OAI21_X1 \uut_master/U298  ( .B1(\uut_master/n72 ), .B2(\uut_master/n10 ), 
        .A(\uut_master/n243 ), .ZN(\uut_master/N139 ) );
  AOI22_X1 \uut_master/U297  ( .A1(address[2]), .A2(\uut_master/n108 ), .B1(
        \uut_master/n33 ), .B2(\uut_master/n242 ), .ZN(\uut_master/n243 ) );
  OAI21_X1 \uut_master/U296  ( .B1(\uut_master/n73 ), .B2(\uut_master/n119 ), 
        .A(\uut_master/n241 ), .ZN(\uut_master/N138 ) );
  AOI22_X1 \uut_master/U295  ( .A1(address[1]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n240 ), .ZN(\uut_master/n241 ) );
  OAI21_X1 \uut_master/U294  ( .B1(\uut_master/n74 ), .B2(\uut_master/n14 ), 
        .A(\uut_master/n239 ), .ZN(\uut_master/N137 ) );
  AOI22_X1 \uut_master/U293  ( .A1(address[0]), .A2(\uut_master/n286 ), .B1(
        \uut_master/n34 ), .B2(\uut_master/n238 ), .ZN(\uut_master/n239 ) );
  OAI221_X1 \uut_master/U292  ( .B1(\uut_master/n76 ), .B2(\uut_master/n22 ), 
        .C1(\uut_master/n75 ), .C2(\uut_master/n14 ), .A(\uut_master/n237 ), 
        .ZN(\uut_master/N136 ) );
  NAND3_X1 \uut_master/U291  ( .A1(data_in[31]), .A2(\uut_master/n118 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n237 ) );
  OAI221_X1 \uut_master/U290  ( .B1(\uut_master/n77 ), .B2(\uut_master/n43 ), 
        .C1(\uut_master/n76 ), .C2(\uut_master/n119 ), .A(\uut_master/n236 ), 
        .ZN(\uut_master/N135 ) );
  NAND3_X1 \uut_master/U289  ( .A1(data_in[30]), .A2(\uut_master/n118 ), .A3(
        \uut_master/n36 ), .ZN(\uut_master/n236 ) );
  OAI221_X1 \uut_master/U288  ( .B1(\uut_master/n40 ), .B2(\uut_master/n78 ), 
        .C1(\uut_master/n77 ), .C2(\uut_master/n14 ), .A(\uut_master/n235 ), 
        .ZN(\uut_master/N134 ) );
  NAND3_X1 \uut_master/U287  ( .A1(data_in[29]), .A2(\uut_master/n118 ), .A3(
        \uut_master/n36 ), .ZN(\uut_master/n235 ) );
  OAI221_X1 \uut_master/U286  ( .B1(\uut_master/n79 ), .B2(\uut_master/n120 ), 
        .C1(\uut_master/n78 ), .C2(\uut_master/n15 ), .A(\uut_master/n234 ), 
        .ZN(\uut_master/N133 ) );
  NAND3_X1 \uut_master/U285  ( .A1(data_in[28]), .A2(\uut_master/n118 ), .A3(
        \uut_master/n109 ), .ZN(\uut_master/n234 ) );
  OAI221_X1 \uut_master/U284  ( .B1(\uut_master/n80 ), .B2(\uut_master/n38 ), 
        .C1(\uut_master/n79 ), .C2(\uut_master/n14 ), .A(\uut_master/n233 ), 
        .ZN(\uut_master/N132 ) );
  NAND3_X1 \uut_master/U283  ( .A1(data_in[27]), .A2(\uut_master/n118 ), .A3(
        \uut_master/n109 ), .ZN(\uut_master/n233 ) );
  OAI221_X1 \uut_master/U282  ( .B1(\uut_master/n81 ), .B2(\uut_master/n44 ), 
        .C1(\uut_master/n80 ), .C2(\uut_master/n14 ), .A(\uut_master/n232 ), 
        .ZN(\uut_master/N131 ) );
  NAND3_X1 \uut_master/U281  ( .A1(data_in[26]), .A2(\uut_master/n118 ), .A3(
        \uut_master/n36 ), .ZN(\uut_master/n232 ) );
  OAI221_X1 \uut_master/U280  ( .B1(\uut_master/n82 ), .B2(\uut_master/n38 ), 
        .C1(\uut_master/n42 ), .C2(\uut_master/n81 ), .A(\uut_master/n231 ), 
        .ZN(\uut_master/N130 ) );
  NAND3_X1 \uut_master/U279  ( .A1(data_in[25]), .A2(\uut_master/n118 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n231 ) );
  OAI221_X1 \uut_master/U278  ( .B1(\uut_master/n83 ), .B2(\uut_master/n22 ), 
        .C1(\uut_master/n42 ), .C2(\uut_master/n82 ), .A(\uut_master/n230 ), 
        .ZN(\uut_master/N129 ) );
  NAND3_X1 \uut_master/U277  ( .A1(data_in[24]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n230 ) );
  OAI221_X1 \uut_master/U276  ( .B1(\uut_master/n84 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n83 ), .C2(\uut_master/n14 ), .A(\uut_master/n229 ), 
        .ZN(\uut_master/N128 ) );
  NAND3_X1 \uut_master/U275  ( .A1(data_in[23]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n109 ), .ZN(\uut_master/n229 ) );
  OAI221_X1 \uut_master/U274  ( .B1(\uut_master/n22 ), .B2(\uut_master/n85 ), 
        .C1(\uut_master/n84 ), .C2(\uut_master/n14 ), .A(\uut_master/n228 ), 
        .ZN(\uut_master/N127 ) );
  NAND3_X1 \uut_master/U273  ( .A1(data_in[22]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n228 ) );
  OAI221_X1 \uut_master/U272  ( .B1(\uut_master/n86 ), .B2(\uut_master/n38 ), 
        .C1(\uut_master/n42 ), .C2(\uut_master/n85 ), .A(\uut_master/n227 ), 
        .ZN(\uut_master/N126 ) );
  NAND3_X1 \uut_master/U271  ( .A1(data_in[21]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n109 ), .ZN(\uut_master/n227 ) );
  OAI221_X1 \uut_master/U270  ( .B1(\uut_master/n87 ), .B2(\uut_master/n120 ), 
        .C1(\uut_master/n86 ), .C2(\uut_master/n15 ), .A(\uut_master/n226 ), 
        .ZN(\uut_master/N125 ) );
  NAND3_X1 \uut_master/U269  ( .A1(data_in[20]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n226 ) );
  OAI221_X1 \uut_master/U268  ( .B1(\uut_master/n88 ), .B2(\uut_master/n38 ), 
        .C1(\uut_master/n87 ), .C2(\uut_master/n119 ), .A(\uut_master/n225 ), 
        .ZN(\uut_master/N124 ) );
  NAND3_X1 \uut_master/U267  ( .A1(data_in[19]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n225 ) );
  OAI221_X1 \uut_master/U266  ( .B1(\uut_master/n89 ), .B2(\uut_master/n44 ), 
        .C1(\uut_master/n88 ), .C2(\uut_master/n39 ), .A(\uut_master/n224 ), 
        .ZN(\uut_master/N123 ) );
  NAND3_X1 \uut_master/U265  ( .A1(data_in[18]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n224 ) );
  OAI221_X1 \uut_master/U264  ( .B1(\uut_master/n90 ), .B2(\uut_master/n22 ), 
        .C1(\uut_master/n89 ), .C2(\uut_master/n119 ), .A(\uut_master/n223 ), 
        .ZN(\uut_master/N122 ) );
  NAND3_X1 \uut_master/U263  ( .A1(data_in[17]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n223 ) );
  OAI221_X1 \uut_master/U262  ( .B1(\uut_master/n91 ), .B2(\uut_master/n44 ), 
        .C1(\uut_master/n90 ), .C2(\uut_master/n119 ), .A(\uut_master/n222 ), 
        .ZN(\uut_master/N121 ) );
  NAND3_X1 \uut_master/U261  ( .A1(\uut_master/n109 ), .A2(\uut_master/n117 ), 
        .A3(data_in[16]), .ZN(\uut_master/n222 ) );
  OAI221_X1 \uut_master/U260  ( .B1(\uut_master/n92 ), .B2(\uut_master/n43 ), 
        .C1(\uut_master/n42 ), .C2(\uut_master/n91 ), .A(\uut_master/n221 ), 
        .ZN(\uut_master/N120 ) );
  NAND3_X1 \uut_master/U259  ( .A1(data_in[15]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n221 ) );
  OAI221_X1 \uut_master/U258  ( .B1(\uut_master/n93 ), .B2(\uut_master/n22 ), 
        .C1(\uut_master/n42 ), .C2(\uut_master/n92 ), .A(\uut_master/n220 ), 
        .ZN(\uut_master/N119 ) );
  NAND3_X1 \uut_master/U257  ( .A1(data_in[14]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n36 ), .ZN(\uut_master/n220 ) );
  OAI221_X1 \uut_master/U256  ( .B1(\uut_master/n94 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n93 ), .C2(\uut_master/n10 ), .A(\uut_master/n219 ), 
        .ZN(\uut_master/N118 ) );
  NAND3_X1 \uut_master/U255  ( .A1(data_in[13]), .A2(\uut_master/n117 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n219 ) );
  OAI221_X1 \uut_master/U254  ( .B1(\uut_master/n95 ), .B2(\uut_master/n27 ), 
        .C1(\uut_master/n94 ), .C2(\uut_master/n14 ), .A(\uut_master/n218 ), 
        .ZN(\uut_master/N117 ) );
  NAND3_X1 \uut_master/U253  ( .A1(data_in[12]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n218 ) );
  OAI221_X1 \uut_master/U252  ( .B1(\uut_master/n96 ), .B2(\uut_master/n40 ), 
        .C1(\uut_master/n95 ), .C2(\uut_master/n26 ), .A(\uut_master/n217 ), 
        .ZN(\uut_master/N116 ) );
  NAND3_X1 \uut_master/U251  ( .A1(data_in[11]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n217 ) );
  OAI221_X1 \uut_master/U250  ( .B1(\uut_master/n97 ), .B2(\uut_master/n44 ), 
        .C1(\uut_master/n96 ), .C2(\uut_master/n15 ), .A(\uut_master/n216 ), 
        .ZN(\uut_master/N115 ) );
  NAND3_X1 \uut_master/U249  ( .A1(data_in[10]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n109 ), .ZN(\uut_master/n216 ) );
  OAI221_X1 \uut_master/U248  ( .B1(\uut_master/n98 ), .B2(\uut_master/n120 ), 
        .C1(\uut_master/n97 ), .C2(\uut_master/n10 ), .A(\uut_master/n215 ), 
        .ZN(\uut_master/N114 ) );
  NAND3_X1 \uut_master/U247  ( .A1(data_in[9]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n36 ), .ZN(\uut_master/n215 ) );
  OAI221_X1 \uut_master/U246  ( .B1(\uut_master/n99 ), .B2(\uut_master/n43 ), 
        .C1(\uut_master/n98 ), .C2(\uut_master/n119 ), .A(\uut_master/n214 ), 
        .ZN(\uut_master/N113 ) );
  NAND3_X1 \uut_master/U245  ( .A1(data_in[8]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n214 ) );
  OAI221_X1 \uut_master/U244  ( .B1(\uut_master/n100 ), .B2(\uut_master/n35 ), 
        .C1(\uut_master/n42 ), .C2(\uut_master/n99 ), .A(\uut_master/n213 ), 
        .ZN(\uut_master/N112 ) );
  NAND3_X1 \uut_master/U243  ( .A1(data_in[7]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n213 ) );
  OAI221_X1 \uut_master/U242  ( .B1(\uut_master/n101 ), .B2(\uut_master/n40 ), 
        .C1(\uut_master/n100 ), .C2(\uut_master/n14 ), .A(\uut_master/n212 ), 
        .ZN(\uut_master/N111 ) );
  NAND3_X1 \uut_master/U241  ( .A1(data_in[6]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n109 ), .ZN(\uut_master/n212 ) );
  OAI221_X1 \uut_master/U240  ( .B1(\uut_master/n102 ), .B2(\uut_master/n40 ), 
        .C1(\uut_master/n101 ), .C2(\uut_master/n119 ), .A(\uut_master/n211 ), 
        .ZN(\uut_master/N110 ) );
  NAND3_X1 \uut_master/U239  ( .A1(data_in[5]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n109 ), .ZN(\uut_master/n211 ) );
  OAI221_X1 \uut_master/U238  ( .B1(\uut_master/n103 ), .B2(\uut_master/n27 ), 
        .C1(\uut_master/n102 ), .C2(\uut_master/n14 ), .A(\uut_master/n210 ), 
        .ZN(\uut_master/N109 ) );
  NAND3_X1 \uut_master/U237  ( .A1(data_in[4]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n36 ), .ZN(\uut_master/n210 ) );
  OAI221_X1 \uut_master/U236  ( .B1(\uut_master/n104 ), .B2(\uut_master/n27 ), 
        .C1(\uut_master/n103 ), .C2(\uut_master/n119 ), .A(\uut_master/n209 ), 
        .ZN(\uut_master/N108 ) );
  NAND3_X1 \uut_master/U235  ( .A1(data_in[3]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n37 ), .ZN(\uut_master/n209 ) );
  OAI221_X1 \uut_master/U234  ( .B1(\uut_master/n40 ), .B2(\uut_master/n105 ), 
        .C1(\uut_master/n104 ), .C2(\uut_master/n39 ), .A(\uut_master/n208 ), 
        .ZN(\uut_master/N107 ) );
  NAND3_X1 \uut_master/U233  ( .A1(data_in[2]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n36 ), .ZN(\uut_master/n208 ) );
  OAI221_X1 \uut_master/U232  ( .B1(\uut_master/n106 ), .B2(\uut_master/n27 ), 
        .C1(\uut_master/n10 ), .C2(\uut_master/n105 ), .A(\uut_master/n207 ), 
        .ZN(\uut_master/N106 ) );
  NAND3_X1 \uut_master/U231  ( .A1(data_in[1]), .A2(\uut_master/n116 ), .A3(
        \uut_master/n108 ), .ZN(\uut_master/n207 ) );
  NOR3_X1 \uut_master/U230  ( .A1(\uut_master/n205 ), .A2(command[4]), .A3(
        command[5]), .ZN(\uut_master/n206 ) );
  OAI21_X1 \uut_master/U229  ( .B1(\uut_master/n203 ), .B2(\uut_master/n204 ), 
        .A(\uut_master/n202 ), .ZN(\uut_master/n336 ) );
  NAND2_X1 \uut_master/U228  ( .A1(\uut_master/data_save [0]), .A2(
        \uut_master/n20 ), .ZN(\uut_master/n202 ) );
  NAND4_X1 \uut_master/U227  ( .A1(\uut_master/n36 ), .A2(data_in[0]), .A3(
        \uut_master/n12 ), .A4(\uut_master/n290 ), .ZN(\uut_master/n203 ) );
  INV_X1 \uut_master/U226  ( .A(command[2]), .ZN(\uut_master/n290 ) );
  INV_X1 \uut_master/U225  ( .A(command[0]), .ZN(\uut_master/n201 ) );
  INV_X1 \uut_master/U224  ( .A(command[1]), .ZN(\uut_master/n288 ) );
  NAND4_X1 \uut_master/U223  ( .A1(\uut_master/n294 ), .A2(\uut_master/n292 ), 
        .A3(\uut_master/n296 ), .A4(\uut_master/n200 ), .ZN(\uut_master/n204 )
         );
  INV_X1 \uut_master/U222  ( .A(\uut_master/n205 ), .ZN(\uut_master/n200 ) );
  NAND2_X1 \uut_master/U221  ( .A1(\uut_master/n302 ), .A2(\uut_master/n298 ), 
        .ZN(\uut_master/n205 ) );
  INV_X1 \uut_master/U220  ( .A(command[6]), .ZN(\uut_master/n298 ) );
  INV_X1 \uut_master/U219  ( .A(command[7]), .ZN(\uut_master/n302 ) );
  INV_X1 \uut_master/U218  ( .A(command[5]), .ZN(\uut_master/n296 ) );
  INV_X1 \uut_master/U217  ( .A(command[3]), .ZN(\uut_master/n292 ) );
  INV_X1 \uut_master/U216  ( .A(command[4]), .ZN(\uut_master/n294 ) );
  NAND3_X1 \uut_master/U215  ( .A1(\uut_master/net6427 ), .A2(
        \uut_master/net6376 ), .A3(data_out[28]), .ZN(\uut_master/n195 ) );
  NAND3_X1 \uut_master/U214  ( .A1(\uut_master/net6417 ), .A2(
        \uut_master/net6427 ), .A3(data_out[27]), .ZN(\uut_master/n193 ) );
  NAND3_X1 \uut_master/U213  ( .A1(\uut_master/net6427 ), .A2(
        \uut_master/net6500 ), .A3(data_out[26]), .ZN(\uut_master/n191 ) );
  NAND3_X1 \uut_master/U212  ( .A1(\uut_master/net6427 ), .A2(
        \uut_master/net6507 ), .A3(data_out[25]), .ZN(\uut_master/n189 ) );
  NAND3_X1 \uut_master/U211  ( .A1(\uut_master/net6192 ), .A2(
        \uut_master/net6427 ), .A3(data_out[24]), .ZN(\uut_master/n187 ) );
  NAND3_X1 \uut_master/U210  ( .A1(\uut_master/net6377 ), .A2(
        \uut_master/net6427 ), .A3(data_out[23]), .ZN(\uut_master/n185 ) );
  NAND3_X1 \uut_master/U209  ( .A1(\uut_master/net6508 ), .A2(
        \uut_master/net6518 ), .A3(data_out[22]), .ZN(\uut_master/n183 ) );
  NAND3_X1 \uut_master/U208  ( .A1(\uut_master/net6418 ), .A2(
        \uut_master/n197 ), .A3(data_out[21]), .ZN(\uut_master/n181 ) );
  NAND3_X1 \uut_master/U207  ( .A1(\uut_master/net6518 ), .A2(
        \uut_master/net6485 ), .A3(data_out[20]), .ZN(\uut_master/n179 ) );
  NAND3_X1 \uut_master/U206  ( .A1(\uut_master/net6426 ), .A2(
        \uut_master/net6485 ), .A3(data_out[19]), .ZN(\uut_master/n177 ) );
  NAND3_X1 \uut_master/U205  ( .A1(\uut_master/net6518 ), .A2(
        \uut_master/net6417 ), .A3(data_out[18]), .ZN(\uut_master/n175 ) );
  NAND3_X1 \uut_master/U204  ( .A1(\uut_master/net6507 ), .A2(
        \uut_master/net6519 ), .A3(data_out[17]), .ZN(\uut_master/n173 ) );
  NAND3_X1 \uut_master/U203  ( .A1(\uut_master/net6485 ), .A2(
        \uut_master/net6426 ), .A3(data_out[16]), .ZN(\uut_master/n171 ) );
  NAND3_X1 \uut_master/U202  ( .A1(\uut_master/net6500 ), .A2(
        \uut_master/n197 ), .A3(data_out[15]), .ZN(\uut_master/n169 ) );
  NAND3_X1 \uut_master/U201  ( .A1(\uut_master/n197 ), .A2(
        \uut_master/net6377 ), .A3(data_out[14]), .ZN(\uut_master/n167 ) );
  NAND3_X1 \uut_master/U200  ( .A1(\uut_master/net6519 ), .A2(
        \uut_master/net6507 ), .A3(data_out[13]), .ZN(\uut_master/n165 ) );
  NAND3_X1 \uut_master/U199  ( .A1(\uut_master/net6426 ), .A2(
        \uut_master/net6192 ), .A3(data_out[12]), .ZN(\uut_master/n163 ) );
  NAND3_X1 \uut_master/U198  ( .A1(\uut_master/net6519 ), .A2(
        \uut_master/net6192 ), .A3(data_out[11]), .ZN(\uut_master/n161 ) );
  NAND3_X1 \uut_master/U197  ( .A1(\uut_master/net6426 ), .A2(
        \uut_master/net6508 ), .A3(data_out[10]), .ZN(\uut_master/n159 ) );
  NAND3_X1 \uut_master/U196  ( .A1(\uut_master/net6518 ), .A2(
        \uut_master/net6411 ), .A3(data_out[9]), .ZN(\uut_master/n157 ) );
  NAND3_X1 \uut_master/U195  ( .A1(\uut_master/net6518 ), .A2(
        \uut_master/net6418 ), .A3(data_out[8]), .ZN(\uut_master/n155 ) );
  NAND3_X1 \uut_master/U194  ( .A1(\uut_master/net6518 ), .A2(
        \uut_master/net6417 ), .A3(data_out[7]), .ZN(\uut_master/n153 ) );
  NAND3_X1 \uut_master/U193  ( .A1(\uut_master/n197 ), .A2(
        \uut_master/net6418 ), .A3(data_out[6]), .ZN(\uut_master/n151 ) );
  NAND3_X1 \uut_master/U192  ( .A1(\uut_master/net6519 ), .A2(
        \uut_master/net6508 ), .A3(data_out[5]), .ZN(\uut_master/n149 ) );
  NAND3_X1 \uut_master/U191  ( .A1(\uut_master/net6519 ), .A2(
        \uut_master/net6500 ), .A3(data_out[4]), .ZN(\uut_master/n147 ) );
  NAND3_X1 \uut_master/U190  ( .A1(\uut_master/net6376 ), .A2(
        \uut_master/n197 ), .A3(data_out[1]), .ZN(\uut_master/n144 ) );
  NAND3_X1 \uut_master/U189  ( .A1(\uut_master/net6411 ), .A2(
        \uut_master/n197 ), .A3(data_out[0]), .ZN(\uut_master/n142 ) );
  INV_X1 \uut_master/U188  ( .A(\uut_master/net6122 ), .ZN(
        \uut_master/net6120 ) );
  NAND3_X1 \uut_master/U187  ( .A1(\uut_master/net6426 ), .A2(
        \uut_master/net6377 ), .A3(miso), .ZN(\uut_master/n140 ) );
  OAI22_X1 \uut_master/U186  ( .A1(\uut_master/n138 ), .A2(\uut_master/n137 ), 
        .B1(\uut_master/net10041 ), .B2(\uut_master/n29 ), .ZN(
        \uut_master/N174 ) );
  NAND2_X1 \uut_master/U185  ( .A1(\uut_master/data_count [4]), .A2(
        \uut_master/n135 ), .ZN(\uut_master/n136 ) );
  INV_X1 \uut_master/U184  ( .A(\uut_master/n134 ), .ZN(\uut_master/n135 ) );
  NOR2_X1 \uut_master/U183  ( .A1(cs), .A2(\uut_master/clock_count ), .ZN(
        \uut_master/N13 ) );
  OAI21_X1 \uut_master/U182  ( .B1(\uut_master/n133 ), .B2(
        \uut_master/net6119 ), .A(\uut_master/net6050 ), .ZN(cs) );
  INV_X1 \uut_master/U181  ( .A(\uut_master/n132 ), .ZN(\uut_master/n133 ) );
  NOR3_X1 \uut_master/U180  ( .A1(\uut_master/n131 ), .A2(
        \uut_master/current_state [0]), .A3(\uut_master/net10039 ), .ZN(
        \uut_master/N301 ) );
  NAND2_X1 \uut_master/U179  ( .A1(enable), .A2(\uut_master/net6050 ), .ZN(
        \uut_master/n131 ) );
  OAI22_X1 \uut_master/U178  ( .A1(rst), .A2(\uut_master/n13 ), .B1(
        \uut_master/n19 ), .B2(\uut_master/net12300 ), .ZN(\uut_master/N302 )
         );
  INV_X1 \uut_master/U177  ( .A(\uut_master/net6049 ), .ZN(
        \uut_master/net6119 ) );
  NAND2_X1 \uut_master/U176  ( .A1(\uut_master/net6354 ), .A2(
        \uut_master/net12420 ), .ZN(\uut_master/net6049 ) );
  NOR2_X1 \uut_master/U175  ( .A1(\uut_master/n38 ), .A2(\uut_master/n3 ), 
        .ZN(\uut_master/N175 ) );
  OAI22_X1 \uut_master/U174  ( .A1(\uut_master/n129 ), .A2(\uut_master/n137 ), 
        .B1(\uut_master/n10 ), .B2(\uut_master/n45 ), .ZN(\uut_master/N173 )
         );
  XOR2_X1 \uut_master/U173  ( .A(\uut_master/n134 ), .B(
        \uut_master/data_count [4]), .Z(\uut_master/n129 ) );
  OAI22_X1 \uut_master/U172  ( .A1(\uut_master/n137 ), .A2(\uut_master/n127 ), 
        .B1(\uut_master/n26 ), .B2(\uut_master/n46 ), .ZN(\uut_master/N172 )
         );
  XOR2_X1 \uut_master/U171  ( .A(\uut_master/n128 ), .B(\uut_master/n122 ), 
        .Z(\uut_master/n127 ) );
  NAND2_X1 \uut_master/U170  ( .A1(\uut_master/data_count [2]), .A2(
        \uut_master/n32 ), .ZN(\uut_master/n128 ) );
  OAI22_X1 \uut_master/U169  ( .A1(\uut_master/n137 ), .A2(\uut_master/n125 ), 
        .B1(\uut_master/n47 ), .B2(\uut_master/n26 ), .ZN(\uut_master/N171 )
         );
  XOR2_X1 \uut_master/U168  ( .A(\uut_master/n126 ), .B(
        \uut_master/data_count [2]), .Z(\uut_master/n125 ) );
  OAI22_X1 \uut_master/U167  ( .A1(\uut_master/n124 ), .A2(\uut_master/n137 ), 
        .B1(\uut_master/n48 ), .B2(\uut_master/n15 ), .ZN(\uut_master/N170 )
         );
  XOR2_X1 \uut_master/U166  ( .A(\uut_master/n123 ), .B(
        \uut_master/data_count [1]), .Z(\uut_master/n124 ) );
  OAI22_X1 \uut_master/U165  ( .A1(\uut_master/n137 ), .A2(
        \uut_master/data_count [0]), .B1(\uut_master/n26 ), .B2(
        \uut_master/n123 ), .ZN(\uut_master/N169 ) );
  NAND2_X1 \uut_master/U164  ( .A1(\uut_master/n112 ), .A2(\uut_master/n130 ), 
        .ZN(\uut_master/n137 ) );
  NAND3_X1 \uut_master/U163  ( .A1(\uut_master/n121 ), .A2(\uut_master/n122 ), 
        .A3(\uut_master/data_count [2]), .ZN(\uut_master/n130 ) );
  NOR3_X1 \uut_master/U162  ( .A1(\uut_master/n126 ), .A2(\uut_master/n45 ), 
        .A3(\uut_master/net6151 ), .ZN(\uut_master/n121 ) );
  NAND2_X1 \uut_master/U161  ( .A1(\uut_master/data_count [1]), .A2(
        \uut_master/data_count [0]), .ZN(\uut_master/n126 ) );
  NAND2_X1 \uut_master/U160  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n107 ), .ZN(\uut_master/net6122 ) );
  INV_X1 \uut_master/U159  ( .A(rst), .ZN(\uut_master/net6050 ) );
  AND3_X1 \uut_master/U158  ( .A1(\uut_master/n49 ), .A2(\uut_master/net6122 ), 
        .A3(\uut_master/net6354 ), .ZN(\uut_master/n115 ) );
  NAND2_X1 \uut_master/U157  ( .A1(\uut_master/n199 ), .A2(\uut_master/n198 ), 
        .ZN(\uut_master/n335 ) );
  OAI222_X4 \uut_master/U156  ( .A1(rst), .A2(\uut_master/net6119 ), .B1(
        \uut_master/data_count [5]), .B2(rst), .C1(\uut_master/net6120 ), .C2(
        \uut_master/net6121 ), .ZN(\uut_master/n110 ) );
  INV_X1 \uut_master/U155  ( .A(\uut_master/n113 ), .ZN(\uut_master/n119 ) );
  NAND2_X1 \uut_master/U154  ( .A1(\uut_master/net10039 ), .A2(\uut_master/n5 ), .ZN(\uut_master/n304 ) );
  INV_X1 \uut_master/U153  ( .A(\uut_master/n30 ), .ZN(\uut_master/n120 ) );
  INV_X1 \uut_master/U152  ( .A(\uut_master/n113 ), .ZN(\uut_master/n42 ) );
  INV_X1 \uut_master/U151  ( .A(\uut_master/net6198 ), .ZN(
        \uut_master/net6376 ) );
  INV_X1 \uut_master/U150  ( .A(\uut_master/n2 ), .ZN(\uut_master/net6411 ) );
  INV_X1 \uut_master/U149  ( .A(\uut_master/net6198 ), .ZN(
        \uut_master/net6192 ) );
  INV_X1 \uut_master/U148  ( .A(\uut_master/n2 ), .ZN(\uut_master/net6418 ) );
  INV_X1 \uut_master/U147  ( .A(\uut_master/n2 ), .ZN(\uut_master/net6417 ) );
  INV_X2 \uut_master/U146  ( .A(\uut_master/net6529 ), .ZN(
        \uut_master/net6427 ) );
  INV_X2 \uut_master/U145  ( .A(\uut_master/net6529 ), .ZN(
        \uut_master/net6426 ) );
  NOR3_X1 \uut_master/U144  ( .A1(\uut_master/n114 ), .A2(rst), .A3(
        \uut_master/net6336 ), .ZN(\uut_master/n41 ) );
  INV_X1 \uut_master/U143  ( .A(\uut_master/n112 ), .ZN(\uut_master/n40 ) );
  INV_X1 \uut_master/U142  ( .A(\uut_master/n41 ), .ZN(\uut_master/n39 ) );
  INV_X1 \uut_master/U141  ( .A(\uut_master/n31 ), .ZN(\uut_master/n43 ) );
  AND3_X2 \uut_master/U140  ( .A1(\uut_master/n49 ), .A2(\uut_master/net6122 ), 
        .A3(\uut_master/net6354 ), .ZN(\uut_master/n112 ) );
  INV_X1 \uut_master/U139  ( .A(\uut_master/n112 ), .ZN(\uut_master/n38 ) );
  INV_X1 \uut_master/U138  ( .A(\uut_master/n30 ), .ZN(\uut_master/n44 ) );
  INV_X1 \uut_master/U137  ( .A(\uut_master/n303 ), .ZN(\uut_master/n286 ) );
  INV_X1 \uut_master/U136  ( .A(\uut_master/n303 ), .ZN(\uut_master/n109 ) );
  INV_X1 \uut_master/U135  ( .A(\uut_master/n303 ), .ZN(\uut_master/n108 ) );
  XNOR2_X1 \uut_master/U134  ( .A(\uut_master/n136 ), .B(\uut_master/net6151 ), 
        .ZN(\uut_master/n138 ) );
  INV_X1 \uut_master/U133  ( .A(\uut_master/n31 ), .ZN(\uut_master/n35 ) );
  INV_X1 \uut_master/U132  ( .A(\uut_master/n2 ), .ZN(\uut_master/net6377 ) );
  INV_X1 \uut_master/U131  ( .A(\uut_master/net6198 ), .ZN(
        \uut_master/net6485 ) );
  AND2_X1 \uut_master/U130  ( .A1(\uut_master/n16 ), .A2(
        \uut_master/data_count [0]), .ZN(\uut_master/n32 ) );
  INV_X1 \uut_master/U129  ( .A(\uut_master/net6198 ), .ZN(
        \uut_master/net6500 ) );
  INV_X1 \uut_master/U128  ( .A(\uut_master/n2 ), .ZN(\uut_master/net6508 ) );
  INV_X1 \uut_master/U127  ( .A(\uut_master/n2 ), .ZN(\uut_master/net6507 ) );
  NAND2_X1 \uut_master/U126  ( .A1(data_out[31]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n198 ) );
  NAND2_X1 \uut_master/U125  ( .A1(data_out[3]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n145 ) );
  NAND2_X1 \uut_master/U124  ( .A1(data_out[27]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n190 ) );
  NAND2_X1 \uut_master/U123  ( .A1(data_out[21]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n178 ) );
  NAND2_X1 \uut_master/U122  ( .A1(data_out[15]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n166 ) );
  NAND2_X1 \uut_master/U121  ( .A1(data_out[30]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n196 ) );
  NAND2_X1 \uut_master/U120  ( .A1(data_out[13]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n162 ) );
  NAND2_X1 \uut_master/U119  ( .A1(data_out[28]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n192 ) );
  NAND2_X1 \uut_master/U118  ( .A1(data_out[22]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n180 ) );
  NAND2_X1 \uut_master/U117  ( .A1(data_out[7]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n150 ) );
  NAND2_X1 \uut_master/U116  ( .A1(data_out[1]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n141 ) );
  NAND2_X1 \uut_master/U115  ( .A1(data_out[25]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n186 ) );
  BUF_X1 \uut_master/U114  ( .A(\uut_master/n115 ), .Z(\uut_master/n31 ) );
  BUF_X1 \uut_master/U113  ( .A(\uut_master/n115 ), .Z(\uut_master/n30 ) );
  NAND2_X1 \uut_master/U112  ( .A1(data_out[24]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n184 ) );
  NAND2_X1 \uut_master/U111  ( .A1(data_out[17]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n170 ) );
  NAND2_X1 \uut_master/U110  ( .A1(data_out[11]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n158 ) );
  NAND2_X1 \uut_master/U109  ( .A1(\uut_master/net6054 ), .A2(data_out[0]), 
        .ZN(\uut_master/n139 ) );
  NAND2_X1 \uut_master/U108  ( .A1(data_out[16]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n168 ) );
  NAND2_X1 \uut_master/U107  ( .A1(data_out[2]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n143 ) );
  NAND2_X1 \uut_master/U106  ( .A1(data_out[26]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n188 ) );
  NAND2_X1 \uut_master/U105  ( .A1(data_out[20]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n176 ) );
  NAND2_X1 \uut_master/U104  ( .A1(data_out[8]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n152 ) );
  NAND2_X1 \uut_master/U103  ( .A1(data_out[5]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n146 ) );
  NAND2_X1 \uut_master/U102  ( .A1(data_out[29]), .A2(\uut_master/n1 ), .ZN(
        \uut_master/n194 ) );
  NAND2_X1 \uut_master/U101  ( .A1(data_out[23]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n182 ) );
  NAND2_X1 \uut_master/U100  ( .A1(data_out[18]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n172 ) );
  INV_X1 \uut_master/U99  ( .A(\uut_master/net6123 ), .ZN(\uut_master/net6518 ) );
  OR2_X1 \uut_master/U98  ( .A1(\uut_master/net6151 ), .A2(\uut_master/n304 ), 
        .ZN(\uut_master/net6123 ) );
  OR2_X2 \uut_master/U97  ( .A1(\uut_master/net6151 ), .A2(\uut_master/n19 ), 
        .ZN(\uut_master/net6529 ) );
  OR2_X1 \uut_master/U96  ( .A1(\uut_master/net6151 ), .A2(\uut_master/n304 ), 
        .ZN(\uut_master/n29 ) );
  CLKBUF_X1 \uut_master/U95  ( .A(\uut_master/n112 ), .Z(\uut_master/n28 ) );
  INV_X1 \uut_master/U94  ( .A(\uut_master/n112 ), .ZN(\uut_master/n27 ) );
  OAI221_X1 \uut_master/U93  ( .B1(\uut_master/n23 ), .B2(\uut_master/n302 ), 
        .C1(\uut_master/n24 ), .C2(\uut_master/n301 ), .A(\uut_master/n300 ), 
        .ZN(\uut_master/n344 ) );
  NAND2_X1 \uut_master/U92  ( .A1(\uut_master/n175 ), .A2(\uut_master/n174 ), 
        .ZN(\uut_master/n323 ) );
  NAND2_X1 \uut_master/U91  ( .A1(\uut_master/n165 ), .A2(\uut_master/n164 ), 
        .ZN(\uut_master/n318 ) );
  OR3_X2 \uut_master/U90  ( .A1(\uut_master/n114 ), .A2(rst), .A3(
        \uut_master/net6336 ), .ZN(\uut_master/n26 ) );
  CLKBUF_X1 \uut_master/U89  ( .A(\uut_master/n112 ), .Z(\uut_master/n25 ) );
  NAND2_X1 \uut_master/U88  ( .A1(\uut_master/n161 ), .A2(\uut_master/n160 ), 
        .ZN(\uut_master/n316 ) );
  NAND2_X1 \uut_master/U87  ( .A1(\uut_master/n147 ), .A2(\uut_master/n146 ), 
        .ZN(\uut_master/n309 ) );
  NAND2_X1 \uut_master/U86  ( .A1(\uut_master/n179 ), .A2(\uut_master/n178 ), 
        .ZN(\uut_master/n325 ) );
  NAND2_X1 \uut_master/U85  ( .A1(\uut_master/n157 ), .A2(\uut_master/n156 ), 
        .ZN(\uut_master/n314 ) );
  NAND2_X1 \uut_master/U84  ( .A1(\uut_master/n155 ), .A2(\uut_master/n154 ), 
        .ZN(\uut_master/n313 ) );
  NAND2_X1 \uut_master/U83  ( .A1(\uut_master/n153 ), .A2(\uut_master/n152 ), 
        .ZN(\uut_master/n312 ) );
  NAND2_X1 \uut_master/U82  ( .A1(\uut_master/n149 ), .A2(\uut_master/n148 ), 
        .ZN(\uut_master/n310 ) );
  NAND2_X1 \uut_master/U81  ( .A1(\uut_master/n167 ), .A2(\uut_master/n166 ), 
        .ZN(\uut_master/n319 ) );
  NAND2_X1 \uut_master/U80  ( .A1(\uut_master/n151 ), .A2(\uut_master/n150 ), 
        .ZN(\uut_master/n311 ) );
  NAND2_X1 \uut_master/U79  ( .A1(\uut_master/n142 ), .A2(\uut_master/n141 ), 
        .ZN(\uut_master/n306 ) );
  NAND2_X1 \uut_master/U78  ( .A1(\uut_master/n191 ), .A2(\uut_master/n190 ), 
        .ZN(\uut_master/n331 ) );
  NAND2_X1 \uut_master/U77  ( .A1(\uut_master/n195 ), .A2(\uut_master/n194 ), 
        .ZN(\uut_master/n333 ) );
  NAND2_X1 \uut_master/U76  ( .A1(\uut_master/n189 ), .A2(\uut_master/n188 ), 
        .ZN(\uut_master/n330 ) );
  NAND2_X1 \uut_master/U75  ( .A1(\uut_master/n140 ), .A2(\uut_master/n139 ), 
        .ZN(\uut_master/n305 ) );
  NAND2_X1 \uut_master/U74  ( .A1(\uut_master/n163 ), .A2(\uut_master/n162 ), 
        .ZN(\uut_master/n317 ) );
  NAND2_X1 \uut_master/U73  ( .A1(\uut_master/net6111 ), .A2(\uut_master/n145 ), .ZN(\uut_master/n308 ) );
  NAND2_X1 \uut_master/U72  ( .A1(\uut_master/n177 ), .A2(\uut_master/n176 ), 
        .ZN(\uut_master/n324 ) );
  NAND2_X1 \uut_master/U71  ( .A1(\uut_master/n159 ), .A2(\uut_master/n158 ), 
        .ZN(\uut_master/n315 ) );
  INV_X1 \uut_master/U70  ( .A(\uut_master/n33 ), .ZN(\uut_master/n24 ) );
  CLKBUF_X1 \uut_master/U69  ( .A(\uut_master/n303 ), .Z(\uut_master/n23 ) );
  INV_X1 \uut_master/U68  ( .A(\uut_master/n112 ), .ZN(\uut_master/n22 ) );
  BUF_X1 \uut_master/U67  ( .A(\uut_master/n41 ), .Z(\uut_master/n20 ) );
  NAND2_X1 \uut_master/U66  ( .A1(\uut_master/net6354 ), .A2(\uut_master/n49 ), 
        .ZN(\uut_master/n19 ) );
  NAND2_X1 \uut_master/U65  ( .A1(\uut_master/n185 ), .A2(\uut_master/n184 ), 
        .ZN(\uut_master/n328 ) );
  NAND2_X1 \uut_master/U64  ( .A1(\uut_master/n181 ), .A2(\uut_master/n180 ), 
        .ZN(\uut_master/n326 ) );
  NAND2_X1 \uut_master/U63  ( .A1(\uut_master/n144 ), .A2(\uut_master/n143 ), 
        .ZN(\uut_master/n307 ) );
  NAND2_X1 \uut_master/U62  ( .A1(\uut_master/n193 ), .A2(\uut_master/n192 ), 
        .ZN(\uut_master/n332 ) );
  NAND2_X1 \uut_master/U61  ( .A1(\uut_master/n169 ), .A2(\uut_master/n168 ), 
        .ZN(\uut_master/n320 ) );
  NAND2_X1 \uut_master/U60  ( .A1(\uut_master/net6057 ), .A2(\uut_master/n196 ), .ZN(\uut_master/n334 ) );
  NAND2_X1 \uut_master/U59  ( .A1(\uut_master/n187 ), .A2(\uut_master/n186 ), 
        .ZN(\uut_master/n329 ) );
  NAND2_X1 \uut_master/U58  ( .A1(\uut_master/n171 ), .A2(\uut_master/n170 ), 
        .ZN(\uut_master/n321 ) );
  OR2_X1 \uut_master/U57  ( .A1(\uut_master/net10039 ), .A2(
        \uut_master/net6354 ), .ZN(\uut_master/n132 ) );
  NAND2_X1 \uut_master/U56  ( .A1(\uut_master/n183 ), .A2(\uut_master/n182 ), 
        .ZN(\uut_master/n327 ) );
  NAND2_X1 \uut_master/U55  ( .A1(\uut_master/n173 ), .A2(\uut_master/n172 ), 
        .ZN(\uut_master/n322 ) );
  NAND2_X1 \uut_master/U54  ( .A1(data_out[10]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n156 ) );
  NAND2_X1 \uut_master/U53  ( .A1(data_out[6]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n148 ) );
  BUF_X1 \uut_master/U52  ( .A(\uut_master/n11 ), .Z(\uut_master/n118 ) );
  BUF_X1 \uut_master/U51  ( .A(\uut_master/n11 ), .Z(\uut_master/n116 ) );
  BUF_X1 \uut_master/U50  ( .A(\uut_master/n11 ), .Z(\uut_master/n117 ) );
  INV_X1 \uut_master/U49  ( .A(\uut_master/n111 ), .ZN(\uut_master/net10039 )
         );
  CLKBUF_X1 \uut_master/U48  ( .A(\uut_master/net6198 ), .Z(
        \uut_master/net10041 ) );
  INV_X2 \uut_master/U47  ( .A(\uut_master/n29 ), .ZN(\uut_master/n197 ) );
  NAND3_X1 \uut_master/U46  ( .A1(\uut_master/n197 ), .A2(\uut_master/net6376 ), .A3(data_out[30]), .ZN(\uut_master/n199 ) );
  NAND2_X2 \uut_master/U45  ( .A1(data_out[19]), .A2(\uut_master/n110 ), .ZN(
        \uut_master/n174 ) );
  NAND2_X2 \uut_master/U44  ( .A1(data_out[12]), .A2(\uut_master/n110 ), .ZN(
        \uut_master/n160 ) );
  NOR2_X1 \uut_master/U43  ( .A1(\uut_master/n47 ), .A2(\uut_master/n46 ), 
        .ZN(\uut_master/n17 ) );
  NAND2_X1 \uut_master/U42  ( .A1(\uut_master/n32 ), .A2(\uut_master/n17 ), 
        .ZN(\uut_master/n134 ) );
  INV_X1 \uut_master/U41  ( .A(\uut_master/n48 ), .ZN(\uut_master/n16 ) );
  BUF_X1 \uut_master/U40  ( .A(\uut_master/n112 ), .Z(\uut_master/n21 ) );
  BUF_X1 \uut_master/U39  ( .A(\uut_master/n112 ), .Z(\uut_master/n18 ) );
  OR3_X2 \uut_master/U38  ( .A1(\uut_master/current_state [0]), .A2(
        \uut_master/n111 ), .A3(\uut_master/net6467 ), .ZN(\uut_master/n114 )
         );
  CLKBUF_X1 \uut_master/U37  ( .A(\uut_master/net6467 ), .Z(
        \uut_master/net12300 ) );
  NOR2_X2 \uut_master/U36  ( .A1(\uut_master/n111 ), .A2(rst), .ZN(
        \uut_master/n49 ) );
  OR2_X1 \uut_master/U35  ( .A1(\uut_master/n111 ), .A2(rst), .ZN(
        \uut_master/net6121 ) );
  INV_X1 \uut_master/U34  ( .A(\uut_master/n303 ), .ZN(\uut_master/n37 ) );
  OR3_X2 \uut_master/U33  ( .A1(\uut_master/n114 ), .A2(\uut_master/net6336 ), 
        .A3(rst), .ZN(\uut_master/n15 ) );
  OR3_X2 \uut_master/U32  ( .A1(\uut_master/n114 ), .A2(rst), .A3(
        \uut_master/net6336 ), .ZN(\uut_master/n14 ) );
  AND2_X1 \uut_master/U31  ( .A1(\uut_master/n288 ), .A2(\uut_master/n201 ), 
        .ZN(\uut_master/n12 ) );
  AND4_X1 \uut_master/U30  ( .A1(\uut_master/n292 ), .A2(\uut_master/n290 ), 
        .A3(\uut_master/n12 ), .A4(\uut_master/n206 ), .ZN(\uut_master/n11 )
         );
  BUF_X2 \uut_master/U29  ( .A(\uut_master/n115 ), .Z(\uut_master/n33 ) );
  OR3_X2 \uut_master/U28  ( .A1(\uut_master/n114 ), .A2(\uut_master/net6336 ), 
        .A3(rst), .ZN(\uut_master/n10 ) );
  BUF_X2 \uut_master/U27  ( .A(\uut_master/n115 ), .Z(\uut_master/n34 ) );
  INV_X1 \uut_master/U26  ( .A(\uut_master/n111 ), .ZN(\uut_master/net12420 )
         );
  NAND2_X2 \uut_master/U25  ( .A1(data_out[9]), .A2(\uut_master/n110 ), .ZN(
        \uut_master/n154 ) );
  NAND2_X2 \uut_master/U24  ( .A1(data_out[14]), .A2(\uut_master/n110 ), .ZN(
        \uut_master/n164 ) );
  NAND3_X1 \uut_master/U23  ( .A1(\uut_master/net6499 ), .A2(
        \uut_master/net6427 ), .A3(data_out[29]), .ZN(\uut_master/net6057 ) );
  NAND3_X1 \uut_master/U22  ( .A1(\uut_master/net6426 ), .A2(
        \uut_master/net6499 ), .A3(data_out[2]), .ZN(\uut_master/net6111 ) );
  OAI222_X4 \uut_master/U21  ( .A1(rst), .A2(\uut_master/net6119 ), .B1(
        \uut_master/data_count [5]), .B2(rst), .C1(\uut_master/net6120 ), .C2(
        \uut_master/net6121 ), .ZN(\uut_master/net6054 ) );
  NAND2_X1 \uut_master/U20  ( .A1(data_out[4]), .A2(\uut_master/net6054 ), 
        .ZN(\uut_master/n9 ) );
  INV_X1 \uut_master/U19  ( .A(\uut_master/net6198 ), .ZN(\uut_master/net6499 ) );
  INV_X1 \uut_master/U18  ( .A(\uut_master/net6123 ), .ZN(\uut_master/net6519 ) );
  NAND3_X1 \uut_master/U17  ( .A1(\uut_master/net6519 ), .A2(
        \uut_master/net6499 ), .A3(data_out[3]), .ZN(\uut_master/n8 ) );
  NAND2_X1 \uut_master/U16  ( .A1(\uut_master/n8 ), .A2(\uut_master/n9 ), .ZN(
        \uut_master/net2830 ) );
  NAND2_X1 \uut_master/U15  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n107 ), .ZN(\uut_master/n7 ) );
  AOI221_X1 \uut_master/U14  ( .B1(\uut_master/current_state [1]), .B2(
        \uut_master/current_state [0]), .C1(\uut_master/n7 ), .C2(
        \uut_master/net6354 ), .A(rst), .ZN(\uut_master/n6 ) );
  NAND2_X1 \uut_master/U13  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n6 ), .ZN(sck) );
  BUF_X2 \uut_master/U12  ( .A(sck), .Z(\uut_master/net6198 ) );
  NAND2_X2 \uut_master/U11  ( .A1(\uut_master/net6049 ), .A2(
        \uut_master/net6050 ), .ZN(\uut_master/n303 ) );
  INV_X2 \uut_master/U10  ( .A(\uut_master/n303 ), .ZN(\uut_master/n36 ) );
  NOR3_X2 \uut_master/U9  ( .A1(\uut_master/n114 ), .A2(\uut_master/net6336 ), 
        .A3(rst), .ZN(\uut_master/n113 ) );
  INV_X1 \uut_master/U8  ( .A(rst), .ZN(\uut_master/n4 ) );
  AND2_X1 \uut_master/U7  ( .A1(\uut_master/net6354 ), .A2(\uut_master/n4 ), 
        .ZN(\uut_master/n5 ) );
  CLKBUF_X1 \uut_master/U6  ( .A(\uut_master/n130 ), .Z(\uut_master/n3 ) );
  BUF_X1 \uut_master/U5  ( .A(\uut_master/n132 ), .Z(\uut_master/n13 ) );
  BUF_X2 \uut_master/U4  ( .A(sck), .Z(\uut_master/n2 ) );
  OAI222_X4 \uut_master/U3  ( .A1(rst), .A2(\uut_master/net6119 ), .B1(
        \uut_master/data_count [5]), .B2(rst), .C1(\uut_master/net6120 ), .C2(
        \uut_master/net6121 ), .ZN(\uut_master/n1 ) );
  DFF_X1 \uut_master/data_save_reg[35]  ( .D(\uut_master/N140 ), .CK(clk), .Q(
        \uut_master/n246 ), .QN(\uut_master/n71 ) );
  DFF_X1 \uut_master/data_save_reg[38]  ( .D(\uut_master/N143 ), .CK(clk), .Q(
        \uut_master/n252 ), .QN(\uut_master/n68 ) );
  DFF_X1 \uut_master/data_save_reg[33]  ( .D(\uut_master/N138 ), .CK(clk), .Q(
        \uut_master/n242 ), .QN(\uut_master/n73 ) );
  DFF_X1 \uut_master/data_save_reg[46]  ( .D(\uut_master/N151 ), .CK(clk), .Q(
        \uut_master/n268 ), .QN(\uut_master/n60 ) );
  DFF_X1 \uut_master/data_save_reg[36]  ( .D(\uut_master/N141 ), .CK(clk), .Q(
        \uut_master/n248 ), .QN(\uut_master/n70 ) );
  DFF_X2 \uut_master/data_in_reg[11]  ( .D(\uut_master/n315 ), .CK(clk), .Q(
        data_out[11]) );
  DFF_X2 \uut_master/data_in_reg[20]  ( .D(\uut_master/n324 ), .CK(clk), .Q(
        data_out[20]) );
  DFF_X2 \uut_master/data_in_reg[3]  ( .D(\uut_master/n308 ), .CK(clk), .Q(
        data_out[3]) );
  DFF_X2 \uut_master/data_in_reg[13]  ( .D(\uut_master/n317 ), .CK(clk), .Q(
        data_out[13]) );
  DFF_X2 \uut_master/data_in_reg[0]  ( .D(\uut_master/n305 ), .CK(clk), .Q(
        data_out[0]) );
  DFF_X2 \uut_master/data_in_reg[26]  ( .D(\uut_master/n330 ), .CK(clk), .Q(
        data_out[26]) );
  DFF_X2 \uut_master/data_in_reg[29]  ( .D(\uut_master/n333 ), .CK(clk), .Q(
        data_out[29]) );
  DFF_X2 \uut_master/data_in_reg[27]  ( .D(\uut_master/n331 ), .CK(clk), .Q(
        data_out[27]) );
  DFF_X2 \uut_master/data_save_reg[10]  ( .D(\uut_master/N115 ), .CK(clk), 
        .QN(\uut_master/n96 ) );
  DFF_X2 \uut_master/data_in_reg[14]  ( .D(\uut_master/n318 ), .CK(clk), .Q(
        data_out[14]) );
  DFF_X2 \uut_master/data_in_reg[19]  ( .D(\uut_master/n323 ), .CK(clk), .Q(
        data_out[19]) );
  DFF_X2 \uut_master/data_in_reg[12]  ( .D(\uut_master/n316 ), .CK(clk), .Q(
        data_out[12]) );
  DFF_X2 \uut_master/data_in_reg[8]  ( .D(\uut_master/n312 ), .CK(clk), .Q(
        data_out[8]) );
  DFF_X2 \uut_master/data_in_reg[4]  ( .D(\uut_master/net2830 ), .CK(clk), .Q(
        data_out[4]) );
  DFF_X2 \uut_master/data_in_reg[21]  ( .D(\uut_master/n325 ), .CK(clk), .Q(
        data_out[21]) );
  DFF_X2 \uut_master/data_in_reg[9]  ( .D(\uut_master/n313 ), .CK(clk), .Q(
        data_out[9]) );
  DFF_X2 \uut_master/data_in_reg[5]  ( .D(\uut_master/n309 ), .CK(clk), .Q(
        data_out[5]) );
  DFF_X2 \uut_master/data_in_reg[6]  ( .D(\uut_master/n310 ), .CK(clk), .Q(
        data_out[6]) );
  DFF_X2 \uut_master/data_in_reg[31]  ( .D(\uut_master/n335 ), .CK(clk), .Q(
        data_out[31]) );
  DFF_X2 \uut_master/data_in_reg[15]  ( .D(\uut_master/n319 ), .CK(clk), .Q(
        data_out[15]) );
  DFF_X2 \uut_master/data_in_reg[7]  ( .D(\uut_master/n311 ), .CK(clk), .Q(
        data_out[7]) );
  DFF_X1 \uut_master/current_state_reg[1]  ( .D(\uut_master/N302 ), .CK(clk), 
        .Q(\uut_master/current_state [1]), .QN(\uut_master/n111 ) );
  DFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/N301 ), .CK(clk), 
        .Q(\uut_master/current_state [0]), .QN(\uut_master/net6354 ) );
  DFF_X1 \uut_master/data_count_reg[2]  ( .D(\uut_master/N171 ), .CK(clk), .Q(
        \uut_master/data_count [2]), .QN(\uut_master/n47 ) );
  DFF_X1 \uut_master/data_save_reg[41]  ( .D(\uut_master/N146 ), .CK(clk), .Q(
        \uut_master/n258 ), .QN(\uut_master/n65 ) );
  DFF_X1 \uut_master/data_save_reg[45]  ( .D(\uut_master/N150 ), .CK(clk), .Q(
        \uut_master/n266 ), .QN(\uut_master/n61 ) );
  DFF_X1 \uut_master/data_save_reg[40]  ( .D(\uut_master/N145 ), .CK(clk), .Q(
        \uut_master/n256 ), .QN(\uut_master/n66 ) );
  DFF_X1 \uut_master/data_save_reg[48]  ( .D(\uut_master/N153 ), .CK(clk), .Q(
        \uut_master/n272 ), .QN(\uut_master/n58 ) );
  DFF_X1 \uut_master/data_save_reg[30]  ( .D(\uut_master/N135 ), .CK(clk), 
        .QN(\uut_master/n76 ) );
  DFF_X1 \uut_master/data_save_reg[8]  ( .D(\uut_master/N113 ), .CK(clk), .QN(
        \uut_master/n98 ) );
  DFF_X1 \uut_master/data_save_reg[15]  ( .D(\uut_master/N120 ), .CK(clk), 
        .QN(\uut_master/n91 ) );
  DFF_X1 \uut_master/data_save_reg[43]  ( .D(\uut_master/N148 ), .CK(clk), .Q(
        \uut_master/n262 ), .QN(\uut_master/n63 ) );
  DFF_X1 \uut_master/data_save_reg[53]  ( .D(\uut_master/N158 ), .CK(clk), .Q(
        \uut_master/n282 ), .QN(\uut_master/n53 ) );
  DFF_X1 \uut_master/data_save_reg[39]  ( .D(\uut_master/N144 ), .CK(clk), .Q(
        \uut_master/n254 ), .QN(\uut_master/n67 ) );
  DFF_X1 \uut_master/data_save_reg[14]  ( .D(\uut_master/N119 ), .CK(clk), 
        .QN(\uut_master/n92 ) );
  DFF_X1 \uut_master/data_save_reg[51]  ( .D(\uut_master/N156 ), .CK(clk), .Q(
        \uut_master/n278 ), .QN(\uut_master/n55 ) );
  DFF_X1 \uut_master/data_save_reg[34]  ( .D(\uut_master/N139 ), .CK(clk), .Q(
        \uut_master/n244 ), .QN(\uut_master/n72 ) );
  DFF_X1 \uut_master/data_save_reg[5]  ( .D(\uut_master/N110 ), .CK(clk), .QN(
        \uut_master/n101 ) );
  DFF_X1 \uut_master/data_save_reg[6]  ( .D(\uut_master/N111 ), .CK(clk), .QN(
        \uut_master/n100 ) );
  DFF_X1 \uut_master/data_save_reg[31]  ( .D(\uut_master/N136 ), .CK(clk), .Q(
        \uut_master/n238 ), .QN(\uut_master/n75 ) );
  DFF_X1 \uut_master/data_save_reg[2]  ( .D(\uut_master/N107 ), .CK(clk), .QN(
        \uut_master/n104 ) );
  DFF_X1 \uut_master/data_save_reg[11]  ( .D(\uut_master/N116 ), .CK(clk), 
        .QN(\uut_master/n95 ) );
  DFF_X1 \uut_master/data_save_reg[17]  ( .D(\uut_master/N122 ), .CK(clk), 
        .QN(\uut_master/n89 ) );
  DFF_X1 \uut_master/data_save_reg[22]  ( .D(\uut_master/N127 ), .CK(clk), 
        .QN(\uut_master/n84 ) );
  DFF_X1 \uut_master/data_save_reg[29]  ( .D(\uut_master/N134 ), .CK(clk), 
        .QN(\uut_master/n77 ) );
  DFF_X1 \uut_master/data_save_reg[24]  ( .D(\uut_master/N129 ), .CK(clk), 
        .QN(\uut_master/n82 ) );
  DFF_X1 \uut_master/data_save_reg[42]  ( .D(\uut_master/N147 ), .CK(clk), .Q(
        \uut_master/n260 ), .QN(\uut_master/n64 ) );
  DFF_X1 \uut_master/data_in_reg[10]  ( .D(\uut_master/n314 ), .CK(clk), .Q(
        data_out[10]) );
  DFF_X1 \uut_master/data_in_reg[18]  ( .D(\uut_master/n322 ), .CK(clk), .Q(
        data_out[18]) );
  DFF_X1 \uut_master/data_in_reg[23]  ( .D(\uut_master/n327 ), .CK(clk), .Q(
        data_out[23]) );
  DFF_X1 \uut_master/data_save_reg[56]  ( .D(\uut_master/n337 ), .CK(clk), 
        .QN(\uut_master/n289 ) );
  DFF_X1 \uut_master/data_save_reg[59]  ( .D(\uut_master/n340 ), .CK(clk), 
        .QN(\uut_master/n295 ) );
  DFF_X1 \uut_master/data_in_reg[25]  ( .D(\uut_master/n329 ), .CK(clk), .Q(
        data_out[25]) );
  DFF_X1 \uut_master/data_in_reg[30]  ( .D(\uut_master/n334 ), .CK(clk), .Q(
        data_out[30]) );
  DFF_X1 \uut_master/data_in_reg[17]  ( .D(\uut_master/n321 ), .CK(clk), .Q(
        data_out[17]) );
  DFF_X1 \uut_master/data_save_reg[3]  ( .D(\uut_master/N108 ), .CK(clk), .QN(
        \uut_master/n103 ) );
  DFF_X1 \uut_master/data_save_reg[16]  ( .D(\uut_master/N121 ), .CK(clk), 
        .QN(\uut_master/n90 ) );
  DFF_X1 \uut_master/data_save_reg[19]  ( .D(\uut_master/N124 ), .CK(clk), 
        .QN(\uut_master/n87 ) );
  DFF_X1 \uut_master/data_save_reg[44]  ( .D(\uut_master/N149 ), .CK(clk), .Q(
        \uut_master/n264 ), .QN(\uut_master/n62 ) );
  DFF_X1 \uut_master/data_save_reg[7]  ( .D(\uut_master/N112 ), .CK(clk), .QN(
        \uut_master/n99 ) );
  DFF_X1 \uut_master/data_save_reg[25]  ( .D(\uut_master/N130 ), .CK(clk), 
        .QN(\uut_master/n81 ) );
  DFF_X1 \uut_master/data_save_reg[23]  ( .D(\uut_master/N128 ), .CK(clk), 
        .QN(\uut_master/n83 ) );
  DFF_X1 \uut_master/data_save_reg[21]  ( .D(\uut_master/N126 ), .CK(clk), 
        .QN(\uut_master/n85 ) );
  DFF_X1 \uut_master/data_save_reg[37]  ( .D(\uut_master/N142 ), .CK(clk), .Q(
        \uut_master/n250 ), .QN(\uut_master/n69 ) );
  DFF_X1 \uut_master/data_save_reg[32]  ( .D(\uut_master/N137 ), .CK(clk), .Q(
        \uut_master/n240 ), .QN(\uut_master/n74 ) );
  DFF_X1 \uut_master/data_save_reg[27]  ( .D(\uut_master/N132 ), .CK(clk), 
        .QN(\uut_master/n79 ) );
  DFF_X1 \uut_master/data_save_reg[9]  ( .D(\uut_master/N114 ), .CK(clk), .QN(
        \uut_master/n97 ) );
  DFF_X1 \uut_master/data_save_reg[13]  ( .D(\uut_master/N118 ), .CK(clk), 
        .QN(\uut_master/n93 ) );
  DFF_X1 \uut_master/data_save_reg[18]  ( .D(\uut_master/N123 ), .CK(clk), 
        .QN(\uut_master/n88 ) );
  DFF_X1 \uut_master/data_save_reg[20]  ( .D(\uut_master/N125 ), .CK(clk), 
        .QN(\uut_master/n86 ) );
  DFF_X1 \uut_master/data_save_reg[28]  ( .D(\uut_master/N133 ), .CK(clk), 
        .QN(\uut_master/n78 ) );
  DFF_X1 \uut_master/data_save_reg[26]  ( .D(\uut_master/N131 ), .CK(clk), 
        .QN(\uut_master/n80 ) );
  DFF_X1 \uut_master/data_save_reg[12]  ( .D(\uut_master/N117 ), .CK(clk), 
        .QN(\uut_master/n94 ) );
  DFF_X1 \uut_master/data_save_reg[1]  ( .D(\uut_master/N106 ), .CK(clk), .QN(
        \uut_master/n105 ) );
  DFF_X1 \uut_master/data_save_reg[52]  ( .D(\uut_master/N157 ), .CK(clk), .Q(
        \uut_master/n280 ), .QN(\uut_master/n54 ) );
  DFF_X1 \uut_master/data_save_reg[50]  ( .D(\uut_master/N155 ), .CK(clk), .Q(
        \uut_master/n276 ), .QN(\uut_master/n56 ) );
  DFF_X1 \uut_master/data_save_reg[49]  ( .D(\uut_master/N154 ), .CK(clk), .Q(
        \uut_master/n274 ), .QN(\uut_master/n57 ) );
  DFF_X1 \uut_master/data_save_reg[47]  ( .D(\uut_master/N152 ), .CK(clk), .Q(
        \uut_master/n270 ), .QN(\uut_master/n59 ) );
  DFF_X1 \uut_master/data_count_reg[0]  ( .D(\uut_master/N169 ), .CK(clk), .Q(
        \uut_master/data_count [0]), .QN(\uut_master/n123 ) );
  DFF_X1 \uut_master/data_count_reg[5]  ( .D(\uut_master/N174 ), .CK(clk), .Q(
        \uut_master/data_count [5]), .QN(\uut_master/net6151 ) );
  DFF_X1 \uut_master/data_save_reg[63]  ( .D(\uut_master/n344 ), .CK(clk), .Q(
        \uut_master/data_save [63]), .QN(\uut_master/n50 ) );
  DFF_X1 \uut_master/data_save_reg[55]  ( .D(\uut_master/N160 ), .CK(clk), .Q(
        \uut_master/data_save [55]), .QN(\uut_master/n51 ) );
  DFF_X1 \uut_master/data_save_reg[0]  ( .D(\uut_master/n336 ), .CK(clk), .Q(
        \uut_master/data_save [0]), .QN(\uut_master/n106 ) );
  DFF_X1 \uut_master/data_count_reg[1]  ( .D(\uut_master/N170 ), .CK(clk), .Q(
        \uut_master/data_count [1]), .QN(\uut_master/n48 ) );
  DFF_X1 \uut_master/data_save_reg[58]  ( .D(\uut_master/n339 ), .CK(clk), 
        .QN(\uut_master/n293 ) );
  DFF_X1 \uut_master/data_save_reg[62]  ( .D(\uut_master/n343 ), .CK(clk), 
        .QN(\uut_master/n301 ) );
  DFF_X1 \uut_master/data_in_reg[1]  ( .D(\uut_master/n306 ), .CK(clk), .Q(
        data_out[1]) );
  DFF_X1 \uut_master/data_save_reg[61]  ( .D(\uut_master/n342 ), .CK(clk), 
        .QN(\uut_master/n299 ) );
  DFF_X1 \uut_master/data_in_reg[22]  ( .D(\uut_master/n326 ), .CK(clk), .Q(
        data_out[22]) );
  DFF_X1 \uut_master/data_in_reg[2]  ( .D(\uut_master/n307 ), .CK(clk), .Q(
        data_out[2]) );
  DFF_X1 \uut_master/data_in_reg[24]  ( .D(\uut_master/n328 ), .CK(clk), .Q(
        data_out[24]) );
  DFF_X1 \uut_master/data_in_reg[28]  ( .D(\uut_master/n332 ), .CK(clk), .Q(
        data_out[28]) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n320 ), .CK(clk), .Q(
        data_out[16]) );
  DFF_X1 \uut_master/data_save_reg[57]  ( .D(\uut_master/n338 ), .CK(clk), 
        .QN(\uut_master/n291 ) );
  DFF_X1 \uut_master/data_save_reg[60]  ( .D(\uut_master/n341 ), .CK(clk), 
        .QN(\uut_master/n297 ) );
  DFF_X1 \uut_master/data_save_reg[4]  ( .D(\uut_master/N109 ), .CK(clk), .QN(
        \uut_master/n102 ) );
  DFF_X1 \uut_master/data_save_reg[54]  ( .D(\uut_master/N159 ), .CK(clk), .Q(
        \uut_master/n284 ), .QN(\uut_master/n52 ) );
  DFF_X1 \uut_master/data_count_reg[3]  ( .D(\uut_master/N172 ), .CK(clk), .Q(
        \uut_master/n122 ), .QN(\uut_master/n46 ) );
  DFF_X1 \uut_master/data_count_reg[4]  ( .D(\uut_master/N173 ), .CK(clk), .Q(
        \uut_master/data_count [4]), .QN(\uut_master/n45 ) );
  DFF_X1 \uut_master/data_end_reg  ( .D(\uut_master/N175 ), .CK(clk), .Q(
        \uut_master/net6467 ), .QN(\uut_master/n107 ) );
  DFF_X1 \uut_master/clock_count_reg  ( .D(\uut_master/N13 ), .CK(clk), .Q(
        \uut_master/clock_count ), .QN(\uut_master/net6336 ) );
  INV_X1 \uut_slave/U165  ( .A(mosi), .ZN(\uut_slave/n242 ) );
  OAI222_X1 \uut_slave/U164  ( .A1(\uut_slave/n63 ), .A2(\uut_slave/n109 ), 
        .B1(\uut_slave/n107 ), .B2(\uut_slave/n58 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n80 ), .ZN(\uut_slave/n128 ) );
  OAI22_X1 \uut_slave/U163  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n40 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n80 ), .ZN(\uut_slave/n160 ) );
  OAI222_X1 \uut_slave/U162  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n58 ), 
        .B1(\uut_slave/n107 ), .B2(\uut_slave/n79 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n40 ), .ZN(\uut_slave/n129 ) );
  OAI22_X1 \uut_slave/U161  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n17 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n40 ), .ZN(\uut_slave/n190 ) );
  OAI222_X1 \uut_slave/U160  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n79 ), 
        .B1(\uut_slave/n107 ), .B2(\uut_slave/n57 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n17 ), .ZN(\uut_slave/n130 ) );
  OAI22_X1 \uut_slave/U159  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n39 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n17 ), .ZN(\uut_slave/n161 ) );
  OAI222_X1 \uut_slave/U158  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n57 ), 
        .B1(\uut_slave/n107 ), .B2(\uut_slave/n78 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n39 ), .ZN(\uut_slave/n131 ) );
  OAI22_X1 \uut_slave/U157  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n16 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n39 ), .ZN(\uut_slave/n162 ) );
  OAI222_X1 \uut_slave/U156  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n78 ), 
        .B1(\uut_slave/n107 ), .B2(\uut_slave/n56 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n16 ), .ZN(\uut_slave/n132 ) );
  OAI22_X1 \uut_slave/U155  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n38 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n16 ), .ZN(\uut_slave/n163 ) );
  OAI222_X1 \uut_slave/U154  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n56 ), 
        .B1(\uut_slave/n107 ), .B2(\uut_slave/n77 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n38 ), .ZN(\uut_slave/n133 ) );
  OAI22_X1 \uut_slave/U153  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n15 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n38 ), .ZN(\uut_slave/n164 ) );
  OAI222_X1 \uut_slave/U152  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n77 ), 
        .B1(\uut_slave/n107 ), .B2(\uut_slave/n55 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n15 ), .ZN(\uut_slave/n134 ) );
  OAI22_X1 \uut_slave/U151  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n37 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n15 ), .ZN(\uut_slave/n165 ) );
  OAI222_X1 \uut_slave/U150  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n55 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n76 ), .C1(\uut_slave/n103 ), 
        .C2(\uut_slave/n37 ), .ZN(\uut_slave/n135 ) );
  OAI22_X1 \uut_slave/U149  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n14 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n37 ), .ZN(\uut_slave/n166 ) );
  OAI222_X1 \uut_slave/U148  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n76 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n54 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n14 ), .ZN(\uut_slave/n136 ) );
  OAI22_X1 \uut_slave/U147  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n36 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n14 ), .ZN(\uut_slave/n167 ) );
  OAI222_X1 \uut_slave/U146  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n54 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n75 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n36 ), .ZN(\uut_slave/n137 ) );
  OAI22_X1 \uut_slave/U145  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n13 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n36 ), .ZN(\uut_slave/n168 ) );
  OAI222_X1 \uut_slave/U144  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n75 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n53 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n13 ), .ZN(\uut_slave/n138 ) );
  OAI22_X1 \uut_slave/U143  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n35 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n13 ), .ZN(\uut_slave/n169 ) );
  OAI222_X1 \uut_slave/U142  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n53 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n74 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n35 ), .ZN(\uut_slave/n139 ) );
  OAI22_X1 \uut_slave/U141  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n12 ), .B1(
        \uut_slave/n93 ), .B2(\uut_slave/n35 ), .ZN(\uut_slave/n170 ) );
  OAI222_X1 \uut_slave/U140  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n74 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n52 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n12 ), .ZN(\uut_slave/n140 ) );
  OAI22_X1 \uut_slave/U139  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n34 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n12 ), .ZN(\uut_slave/n171 ) );
  OAI222_X1 \uut_slave/U138  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n52 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n73 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n34 ), .ZN(\uut_slave/n141 ) );
  OAI22_X1 \uut_slave/U137  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n11 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n34 ), .ZN(\uut_slave/n172 ) );
  OAI222_X1 \uut_slave/U136  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n73 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n51 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n11 ), .ZN(\uut_slave/n142 ) );
  OAI22_X1 \uut_slave/U135  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n33 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n11 ), .ZN(\uut_slave/n173 ) );
  OAI222_X1 \uut_slave/U134  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n51 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n72 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n33 ), .ZN(\uut_slave/n143 ) );
  OAI22_X1 \uut_slave/U133  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n9 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n33 ), .ZN(\uut_slave/n174 ) );
  OAI222_X1 \uut_slave/U132  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n72 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n50 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n9 ), .ZN(\uut_slave/n144 ) );
  OAI22_X1 \uut_slave/U131  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n32 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n9 ), .ZN(\uut_slave/n175 ) );
  OAI222_X1 \uut_slave/U130  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n50 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n71 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n32 ), .ZN(\uut_slave/n145 ) );
  OAI22_X1 \uut_slave/U129  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n8 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n32 ), .ZN(\uut_slave/n176 ) );
  OAI222_X1 \uut_slave/U128  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n71 ), 
        .B1(\uut_slave/n106 ), .B2(\uut_slave/n49 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n8 ), .ZN(\uut_slave/n146 ) );
  OAI22_X1 \uut_slave/U127  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n31 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n8 ), .ZN(\uut_slave/n177 ) );
  OAI222_X1 \uut_slave/U126  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n49 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n70 ), .C1(\uut_slave/n102 ), 
        .C2(\uut_slave/n31 ), .ZN(\uut_slave/n147 ) );
  OAI22_X1 \uut_slave/U125  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n7 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n31 ), .ZN(\uut_slave/n178 ) );
  OAI222_X1 \uut_slave/U124  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n70 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n48 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n7 ), .ZN(\uut_slave/n148 ) );
  OAI22_X1 \uut_slave/U123  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n30 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n7 ), .ZN(\uut_slave/n179 ) );
  OAI222_X1 \uut_slave/U122  ( .A1(\uut_slave/n110 ), .A2(\uut_slave/n48 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n69 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n30 ), .ZN(\uut_slave/n149 ) );
  OAI22_X1 \uut_slave/U121  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n6 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n30 ), .ZN(\uut_slave/n180 ) );
  OAI222_X1 \uut_slave/U120  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n69 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n47 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n6 ), .ZN(\uut_slave/n150 ) );
  OAI22_X1 \uut_slave/U119  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n29 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n6 ), .ZN(\uut_slave/n181 ) );
  OAI222_X1 \uut_slave/U118  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n47 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n68 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n29 ), .ZN(\uut_slave/n151 ) );
  OAI22_X1 \uut_slave/U117  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n5 ), .B1(
        \uut_slave/n94 ), .B2(\uut_slave/n29 ), .ZN(\uut_slave/n182 ) );
  OAI222_X1 \uut_slave/U116  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n68 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n46 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n5 ), .ZN(\uut_slave/n152 ) );
  OAI22_X1 \uut_slave/U115  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n25 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n5 ), .ZN(\uut_slave/n183 ) );
  OAI222_X1 \uut_slave/U114  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n46 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n67 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n25 ), .ZN(\uut_slave/n153 ) );
  OAI22_X1 \uut_slave/U113  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n4 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n25 ), .ZN(\uut_slave/n184 ) );
  OAI222_X1 \uut_slave/U112  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n67 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n45 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n4 ), .ZN(\uut_slave/n154 ) );
  OAI22_X1 \uut_slave/U111  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n24 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n4 ), .ZN(\uut_slave/n185 ) );
  OAI222_X1 \uut_slave/U110  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n45 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n66 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n24 ), .ZN(\uut_slave/n155 ) );
  OAI22_X1 \uut_slave/U109  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n3 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n24 ), .ZN(\uut_slave/n186 ) );
  OAI222_X1 \uut_slave/U108  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n66 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n44 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n3 ), .ZN(\uut_slave/n156 ) );
  OAI22_X1 \uut_slave/U107  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n23 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n3 ), .ZN(\uut_slave/n187 ) );
  OAI222_X1 \uut_slave/U106  ( .A1(\uut_slave/n111 ), .A2(\uut_slave/n44 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n65 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n23 ), .ZN(\uut_slave/n157 ) );
  OAI22_X1 \uut_slave/U105  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n2 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n23 ), .ZN(\uut_slave/n188 ) );
  OAI222_X1 \uut_slave/U104  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n65 ), 
        .B1(\uut_slave/n105 ), .B2(\uut_slave/n43 ), .C1(\uut_slave/n101 ), 
        .C2(\uut_slave/n2 ), .ZN(\uut_slave/n158 ) );
  NAND3_X1 \uut_slave/U103  ( .A1(\uut_slave/n231 ), .A2(\uut_slave/n230 ), 
        .A3(\uut_slave/n229 ), .ZN(\uut_slave/n235 ) );
  INV_X1 \uut_slave/U102  ( .A(\uut_slave/n228 ), .ZN(\uut_slave/n231 ) );
  OAI22_X1 \uut_slave/U101  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n59 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n2 ), .ZN(\uut_slave/n189 ) );
  OAI22_X1 \uut_slave/U100  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n43 ), 
        .B1(\uut_slave/n101 ), .B2(\uut_slave/n59 ), .ZN(\uut_slave/n159 ) );
  NAND4_X1 \uut_slave/U99  ( .A1(\uut_slave/n227 ), .A2(\uut_slave/n230 ), 
        .A3(\uut_slave/n226 ), .A4(\uut_slave/n229 ), .ZN(\uut_slave/n234 ) );
  OAI211_X1 \uut_slave/U98  ( .C1(\uut_slave/n224 ), .C2(\uut_slave/n223 ), 
        .A(\uut_slave/n230 ), .B(\uut_slave/n228 ), .ZN(\uut_slave/n225 ) );
  NAND2_X1 \uut_slave/U97  ( .A1(\uut_slave/n222 ), .A2(\uut_slave/n221 ), 
        .ZN(\uut_slave/n228 ) );
  NAND3_X1 \uut_slave/U96  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n86 ), .A3(
        \uut_slave/n224 ), .ZN(\uut_slave/n222 ) );
  INV_X1 \uut_slave/U95  ( .A(\uut_slave/n226 ), .ZN(\uut_slave/n224 ) );
  NAND2_X1 \uut_slave/U94  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n20 ), .ZN(
        \uut_slave/n226 ) );
  OAI22_X1 \uut_slave/U93  ( .A1(\uut_slave/n242 ), .A2(\uut_slave/n99 ), .B1(
        \uut_slave/n95 ), .B2(\uut_slave/n59 ), .ZN(\uut_slave/n191 ) );
  NAND2_X1 \uut_slave/U92  ( .A1(\uut_slave/n95 ), .A2(\uut_slave/n230 ), .ZN(
        \uut_slave/n233 ) );
  INV_X1 \uut_slave/U91  ( .A(\uut_slave/n220 ), .ZN(\uut_slave/n232 ) );
  OAI21_X1 \uut_slave/U90  ( .B1(\uut_slave/n91 ), .B2(\uut_slave/n221 ), .A(
        \uut_slave/n229 ), .ZN(\uut_slave/n220 ) );
  OAI22_X1 \uut_slave/U89  ( .A1(\uut_slave/n41 ), .A2(\uut_slave/n219 ), .B1(
        \uut_slave/n218 ), .B2(\uut_slave/n61 ), .ZN(\uut_slave/n192 ) );
  OAI22_X1 \uut_slave/U88  ( .A1(\uut_slave/n62 ), .A2(\uut_slave/n219 ), .B1(
        \uut_slave/n218 ), .B2(\uut_slave/n41 ), .ZN(\uut_slave/n193 ) );
  OAI22_X1 \uut_slave/U87  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n219 ), .B1(
        \uut_slave/n218 ), .B2(\uut_slave/n62 ), .ZN(\uut_slave/n194 ) );
  OAI22_X1 \uut_slave/U86  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n219 ), .B1(
        \uut_slave/n26 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n195 ) );
  OAI22_X1 \uut_slave/U85  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n219 ), .B1(
        \uut_slave/n27 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n196 ) );
  OAI22_X1 \uut_slave/U84  ( .A1(\uut_slave/n64 ), .A2(\uut_slave/n219 ), .B1(
        \uut_slave/n28 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n197 ) );
  OAI22_X1 \uut_slave/U83  ( .A1(\uut_slave/n42 ), .A2(\uut_slave/n219 ), .B1(
        \uut_slave/n218 ), .B2(\uut_slave/n64 ), .ZN(\uut_slave/n198 ) );
  OAI22_X1 \uut_slave/U82  ( .A1(\uut_slave/n242 ), .A2(\uut_slave/n219 ), 
        .B1(\uut_slave/n218 ), .B2(\uut_slave/n42 ), .ZN(\uut_slave/n199 ) );
  NAND2_X1 \uut_slave/U81  ( .A1(\uut_slave/n218 ), .A2(\uut_slave/n230 ), 
        .ZN(\uut_slave/n219 ) );
  INV_X1 \uut_slave/U80  ( .A(\uut_slave/n217 ), .ZN(\uut_slave/n218 ) );
  OAI21_X1 \uut_slave/U79  ( .B1(\uut_slave/n227 ), .B2(\uut_slave/n91 ), .A(
        \uut_slave/n229 ), .ZN(\uut_slave/n217 ) );
  NAND2_X1 \uut_slave/U78  ( .A1(\uut_slave/n216 ), .A2(\uut_slave/n230 ), 
        .ZN(\uut_slave/n229 ) );
  INV_X1 \uut_slave/U77  ( .A(\uut_slave/n223 ), .ZN(\uut_slave/n227 ) );
  NAND2_X1 \uut_slave/U76  ( .A1(\uut_slave/n10 ), .A2(\uut_slave/n86 ), .ZN(
        \uut_slave/n223 ) );
  NOR3_X1 \uut_slave/U75  ( .A1(\uut_slave/n213 ), .A2(\uut_slave/n113 ), .A3(
        \uut_slave/n91 ), .ZN(\uut_slave/N41 ) );
  OAI21_X1 \uut_slave/U74  ( .B1(\uut_slave/n212 ), .B2(\uut_slave/n10 ), .A(
        \uut_slave/n211 ), .ZN(\uut_slave/n200 ) );
  NAND3_X1 \uut_slave/U73  ( .A1(\uut_slave/n210 ), .A2(n14), .A3(
        \uut_slave/n83 ), .ZN(\uut_slave/n211 ) );
  NOR2_X1 \uut_slave/U72  ( .A1(\uut_slave/n89 ), .A2(\uut_slave/n124 ), .ZN(
        \uut_slave/n209 ) );
  OAI21_X1 \uut_slave/U71  ( .B1(\uut_slave/n212 ), .B2(\uut_slave/n208 ), .A(
        \uut_slave/n207 ), .ZN(\uut_slave/n201 ) );
  NAND3_X1 \uut_slave/U70  ( .A1(\uut_slave/n83 ), .A2(n14), .A3(
        \uut_slave/n206 ), .ZN(\uut_slave/n207 ) );
  OAI21_X1 \uut_slave/U69  ( .B1(\uut_slave/n122 ), .B2(\uut_slave/n18 ), .A(
        \uut_slave/n126 ), .ZN(\uut_slave/n202 ) );
  NAND3_X1 \uut_slave/U68  ( .A1(\uut_slave/n83 ), .A2(n14), .A3(
        \uut_slave/n125 ), .ZN(\uut_slave/n126 ) );
  XOR2_X1 \uut_slave/U67  ( .A(\uut_slave/data_count [3]), .B(\uut_slave/n127 ), .Z(\uut_slave/n125 ) );
  INV_X1 \uut_slave/U66  ( .A(\uut_slave/n124 ), .ZN(\uut_slave/n127 ) );
  NAND2_X1 \uut_slave/U65  ( .A1(\uut_slave/data_count [2]), .A2(
        \uut_slave/n85 ), .ZN(\uut_slave/n124 ) );
  OAI21_X1 \uut_slave/U64  ( .B1(\uut_slave/n82 ), .B2(\uut_slave/n19 ), .A(
        \uut_slave/n121 ), .ZN(\uut_slave/n203 ) );
  NAND3_X1 \uut_slave/U63  ( .A1(\uut_slave/n83 ), .A2(n14), .A3(
        \uut_slave/n120 ), .ZN(\uut_slave/n121 ) );
  XOR2_X1 \uut_slave/U62  ( .A(\uut_slave/data_count [2]), .B(\uut_slave/n85 ), 
        .Z(\uut_slave/n120 ) );
  OAI21_X1 \uut_slave/U61  ( .B1(\uut_slave/n122 ), .B2(\uut_slave/n20 ), .A(
        \uut_slave/n119 ), .ZN(\uut_slave/n204 ) );
  NAND3_X1 \uut_slave/U60  ( .A1(\uut_slave/n83 ), .A2(n14), .A3(
        \uut_slave/n118 ), .ZN(\uut_slave/n119 ) );
  XOR2_X1 \uut_slave/U59  ( .A(\uut_slave/data_count [1]), .B(\uut_slave/n116 ), .Z(\uut_slave/n118 ) );
  OAI21_X1 \uut_slave/U58  ( .B1(\uut_slave/n82 ), .B2(\uut_slave/n21 ), .A(
        \uut_slave/n117 ), .ZN(\uut_slave/n205 ) );
  NAND3_X1 \uut_slave/U57  ( .A1(\uut_slave/n83 ), .A2(\uut_slave/n21 ), .A3(
        n14), .ZN(\uut_slave/n117 ) );
  NAND4_X1 \uut_slave/U56  ( .A1(\uut_slave/n116 ), .A2(
        \uut_slave/data_count [1]), .A3(\uut_slave/data_count [2]), .A4(
        \uut_slave/n115 ), .ZN(\uut_slave/n213 ) );
  NOR3_X1 \uut_slave/U55  ( .A1(\uut_slave/n10 ), .A2(\uut_slave/n208 ), .A3(
        \uut_slave/n18 ), .ZN(\uut_slave/n115 ) );
  INV_X1 \uut_slave/U54  ( .A(\uut_slave/n236 ), .ZN(\uut_slave/n123 ) );
  NAND2_X1 \uut_slave/U53  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n91 ), .ZN(
        \uut_slave/N211 ) );
  OAI21_X1 \uut_slave/U52  ( .B1(\uut_slave/n96 ), .B2(\uut_slave/n214 ), .A(
        \uut_slave/n84 ), .ZN(\uut_slave/n114 ) );
  INV_X1 \uut_slave/U51  ( .A(rst), .ZN(\uut_slave/n230 ) );
  NAND2_X1 \uut_slave/U50  ( .A1(\uut_slave/n96 ), .A2(\uut_slave/n90 ), .ZN(
        \uut_slave/n216 ) );
  INV_X1 \uut_slave/U49  ( .A(\uut_slave/n246 ), .ZN(\uut_slave/n214 ) );
  INV_X1 \uut_slave/U48  ( .A(n14), .ZN(\uut_slave/n113 ) );
  CLKBUF_X1 \uut_slave/U47  ( .A(\uut_slave/n1 ), .Z(\uut_slave/n112 ) );
  OAI22_X1 \uut_slave/U46  ( .A1(\uut_slave/n215 ), .A2(\uut_slave/n96 ), .B1(
        \uut_slave/n22 ), .B2(\uut_slave/n91 ), .ZN(\uut_slave/N210 ) );
  NAND4_X1 \uut_slave/U45  ( .A1(\uut_slave/n245 ), .A2(\uut_slave/n239 ), 
        .A3(\uut_slave/n238 ), .A4(\uut_slave/n237 ), .ZN(\uut_slave/n241 ) );
  NOR3_X1 \uut_slave/U44  ( .A1(\uut_slave/n61 ), .A2(\uut_slave/n236 ), .A3(
        \uut_slave/n41 ), .ZN(\uut_slave/n239 ) );
  NOR2_X1 \uut_slave/U43  ( .A1(\uut_slave/n241 ), .A2(\uut_slave/n240 ), .ZN(
        miso) );
  OR2_X2 \uut_slave/U42  ( .A1(\uut_slave/n216 ), .A2(rst), .ZN(
        \uut_slave/n236 ) );
  BUF_X2 \uut_slave/U41  ( .A(\uut_slave/n236 ), .Z(\uut_slave/n91 ) );
  XNOR2_X1 \uut_slave/U40  ( .A(\uut_slave/n10 ), .B(\uut_slave/n209 ), .ZN(
        \uut_slave/n210 ) );
  OR2_X1 \uut_slave/U39  ( .A1(\uut_slave/n18 ), .A2(\uut_slave/n208 ), .ZN(
        \uut_slave/n89 ) );
  CLKBUF_X1 \uut_slave/U38  ( .A(n14), .Z(\uut_slave/n92 ) );
  NAND2_X1 \uut_slave/U37  ( .A1(\uut_slave/data_count [3]), .A2(
        \uut_slave/n127 ), .ZN(\uut_slave/n88 ) );
  XNOR2_X1 \uut_slave/U36  ( .A(\uut_slave/data_count [4]), .B(\uut_slave/n88 ), .ZN(\uut_slave/n206 ) );
  OR2_X1 \uut_slave/U35  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n63 ), .ZN(
        \uut_slave/n240 ) );
  AND2_X1 \uut_slave/U34  ( .A1(\uut_slave/n208 ), .A2(\uut_slave/n18 ), .ZN(
        \uut_slave/n86 ) );
  NOR3_X1 \uut_slave/U33  ( .A1(\uut_slave/n10 ), .A2(\uut_slave/n28 ), .A3(
        \uut_slave/n27 ), .ZN(\uut_slave/n237 ) );
  AND2_X1 \uut_slave/U32  ( .A1(\uut_slave/n244 ), .A2(\uut_slave/n243 ), .ZN(
        \uut_slave/n238 ) );
  AND2_X1 \uut_slave/U31  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/n116 ), .ZN(\uut_slave/n85 ) );
  NOR2_X1 \uut_slave/U30  ( .A1(cs), .A2(rst), .ZN(\uut_slave/n84 ) );
  BUF_X1 \uut_slave/U29  ( .A(\uut_slave/n232 ), .Z(\uut_slave/n95 ) );
  BUF_X1 \uut_slave/U28  ( .A(\uut_slave/n232 ), .Z(\uut_slave/n94 ) );
  BUF_X1 \uut_slave/U27  ( .A(\uut_slave/n232 ), .Z(\uut_slave/n93 ) );
  AND2_X2 \uut_slave/U26  ( .A1(\uut_slave/n123 ), .A2(\uut_slave/n213 ), .ZN(
        \uut_slave/n83 ) );
  BUF_X1 \uut_slave/U25  ( .A(\uut_slave/n108 ), .Z(\uut_slave/n107 ) );
  BUF_X1 \uut_slave/U24  ( .A(\uut_slave/n60 ), .Z(\uut_slave/n111 ) );
  BUF_X1 \uut_slave/U23  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n103 ) );
  BUF_X1 \uut_slave/U22  ( .A(\uut_slave/n100 ), .Z(\uut_slave/n99 ) );
  BUF_X1 \uut_slave/U21  ( .A(\uut_slave/n60 ), .Z(\uut_slave/n110 ) );
  BUF_X1 \uut_slave/U20  ( .A(\uut_slave/n60 ), .Z(\uut_slave/n109 ) );
  BUF_X1 \uut_slave/U19  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n102 ) );
  BUF_X1 \uut_slave/U18  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n101 ) );
  BUF_X1 \uut_slave/U17  ( .A(\uut_slave/n108 ), .Z(\uut_slave/n105 ) );
  BUF_X1 \uut_slave/U16  ( .A(\uut_slave/n108 ), .Z(\uut_slave/n106 ) );
  BUF_X1 \uut_slave/U15  ( .A(\uut_slave/n100 ), .Z(\uut_slave/n98 ) );
  BUF_X1 \uut_slave/U14  ( .A(\uut_slave/n100 ), .Z(\uut_slave/n97 ) );
  INV_X1 \uut_slave/U13  ( .A(\uut_slave/n112 ), .ZN(\uut_slave/n87 ) );
  BUF_X1 \uut_slave/U12  ( .A(\uut_slave/n235 ), .Z(\uut_slave/n108 ) );
  BUF_X1 \uut_slave/U11  ( .A(\uut_slave/n233 ), .Z(\uut_slave/n100 ) );
  BUF_X1 \uut_slave/U10  ( .A(\uut_slave/n234 ), .Z(\uut_slave/n104 ) );
  OR2_X1 \uut_slave/U9  ( .A1(n14), .A2(\uut_slave/n91 ), .ZN(\uut_slave/n122 ) );
  OR2_X1 \uut_slave/U8  ( .A1(n14), .A2(\uut_slave/n91 ), .ZN(\uut_slave/n82 )
         );
  NAND2_X1 \uut_slave/U7  ( .A1(\uut_slave/n214 ), .A2(\uut_slave/n230 ), .ZN(
        \uut_slave/n81 ) );
  OR2_X1 \uut_slave/U6  ( .A1(cs), .A2(\uut_slave/n81 ), .ZN(\uut_slave/n215 )
         );
  AND2_X1 \uut_slave/U5  ( .A1(\uut_slave/n225 ), .A2(\uut_slave/n229 ), .ZN(
        \uut_slave/n60 ) );
  OR2_X1 \uut_slave/U4  ( .A1(n14), .A2(\uut_slave/n91 ), .ZN(\uut_slave/n212 ) );
  INV_X1 \uut_slave/U3  ( .A(\uut_slave/n92 ), .ZN(\uut_slave/n1 ) );
  DFF_X2 \uut_slave/data_count_reg[2]  ( .D(\uut_slave/n203 ), .CK(clk), .Q(
        \uut_slave/data_count [2]), .QN(\uut_slave/n19 ) );
  DFF_X2 \uut_slave/data_count_reg[4]  ( .D(\uut_slave/n201 ), .CK(clk), .Q(
        \uut_slave/data_count [4]), .QN(\uut_slave/n208 ) );
  DFF_X1 \uut_slave/data_count_reg[0]  ( .D(\uut_slave/n205 ), .CK(clk), .Q(
        \uut_slave/n116 ), .QN(\uut_slave/n21 ) );
  DFF_X2 \uut_slave/data_count_reg[3]  ( .D(\uut_slave/n202 ), .CK(clk), .Q(
        \uut_slave/data_count [3]), .QN(\uut_slave/n18 ) );
  DFF_X2 \uut_slave/data_count_reg[5]  ( .D(\uut_slave/n200 ), .CK(clk), .Q(
        \uut_slave/n221 ), .QN(\uut_slave/n10 ) );
  DFF_X1 \uut_slave/current_state_reg[0]  ( .D(\uut_slave/N210 ), .CK(clk), 
        .QN(\uut_slave/n96 ) );
  DFF_X1 \uut_slave/data_count_reg[1]  ( .D(\uut_slave/n204 ), .CK(clk), .Q(
        \uut_slave/data_count [1]), .QN(\uut_slave/n20 ) );
  DFF_X1 \uut_slave/data_end_reg  ( .D(\uut_slave/N41 ), .CK(clk), .QN(
        \uut_slave/n22 ) );
  DFF_X1 \uut_slave/data_out_reg[31]  ( .D(\uut_slave/n128 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n63 ) );
  DFF_X1 \uut_slave/data_out_reg[30]  ( .D(\uut_slave/n129 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n58 ) );
  DFF_X1 \uut_slave/data_out_reg[29]  ( .D(\uut_slave/n130 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n79 ) );
  DFF_X1 \uut_slave/data_out_reg[28]  ( .D(\uut_slave/n131 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n57 ) );
  DFF_X1 \uut_slave/data_out_reg[27]  ( .D(\uut_slave/n132 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n78 ) );
  DFF_X1 \uut_slave/data_out_reg[26]  ( .D(\uut_slave/n133 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n56 ) );
  DFF_X1 \uut_slave/data_out_reg[25]  ( .D(\uut_slave/n134 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n77 ) );
  DFF_X1 \uut_slave/data_out_reg[24]  ( .D(\uut_slave/n135 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n55 ) );
  DFF_X1 \uut_slave/data_out_reg[23]  ( .D(\uut_slave/n136 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n76 ) );
  DFF_X1 \uut_slave/data_out_reg[22]  ( .D(\uut_slave/n137 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n54 ) );
  DFF_X1 \uut_slave/data_out_reg[21]  ( .D(\uut_slave/n138 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n75 ) );
  DFF_X1 \uut_slave/data_out_reg[20]  ( .D(\uut_slave/n139 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n53 ) );
  DFF_X1 \uut_slave/data_out_reg[19]  ( .D(\uut_slave/n140 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n74 ) );
  DFF_X1 \uut_slave/data_out_reg[18]  ( .D(\uut_slave/n141 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n52 ) );
  DFF_X1 \uut_slave/data_out_reg[17]  ( .D(\uut_slave/n142 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n73 ) );
  DFF_X1 \uut_slave/data_out_reg[16]  ( .D(\uut_slave/n143 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n51 ) );
  DFF_X1 \uut_slave/data_out_reg[15]  ( .D(\uut_slave/n144 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n72 ) );
  DFF_X1 \uut_slave/data_out_reg[14]  ( .D(\uut_slave/n145 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n50 ) );
  DFF_X1 \uut_slave/data_out_reg[13]  ( .D(\uut_slave/n146 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n71 ) );
  DFF_X1 \uut_slave/data_out_reg[12]  ( .D(\uut_slave/n147 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n49 ) );
  DFF_X1 \uut_slave/data_out_reg[11]  ( .D(\uut_slave/n148 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n70 ) );
  DFF_X1 \uut_slave/data_out_reg[10]  ( .D(\uut_slave/n149 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n48 ) );
  DFF_X1 \uut_slave/data_out_reg[9]  ( .D(\uut_slave/n150 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n69 ) );
  DFF_X1 \uut_slave/data_out_reg[8]  ( .D(\uut_slave/n151 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n47 ) );
  DFF_X1 \uut_slave/data_out_reg[7]  ( .D(\uut_slave/n152 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n68 ) );
  DFF_X1 \uut_slave/data_out_reg[6]  ( .D(\uut_slave/n153 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n46 ) );
  DFF_X1 \uut_slave/data_out_reg[5]  ( .D(\uut_slave/n154 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n67 ) );
  DFF_X1 \uut_slave/data_out_reg[4]  ( .D(\uut_slave/n155 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n45 ) );
  DFF_X1 \uut_slave/data_out_reg[3]  ( .D(\uut_slave/n156 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n66 ) );
  DFF_X1 \uut_slave/data_out_reg[2]  ( .D(\uut_slave/n157 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n44 ) );
  DFF_X1 \uut_slave/data_out_reg[1]  ( .D(\uut_slave/n158 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n65 ) );
  DFF_X1 \uut_slave/data_out_reg[0]  ( .D(\uut_slave/n159 ), .CK(
        \uut_slave/n112 ), .QN(\uut_slave/n43 ) );
  DFF_X1 \uut_slave/command_save_reg[7]  ( .D(\uut_slave/n192 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n61 ) );
  DFF_X1 \uut_slave/command_save_reg[6]  ( .D(\uut_slave/n193 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n41 ) );
  DFF_X1 \uut_slave/command_save_reg[5]  ( .D(\uut_slave/n194 ), .CK(
        \uut_slave/n92 ), .Q(\uut_slave/n245 ), .QN(\uut_slave/n62 ) );
  DFF_X1 \uut_slave/command_save_reg[4]  ( .D(\uut_slave/n195 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n26 ) );
  DFF_X1 \uut_slave/command_save_reg[3]  ( .D(\uut_slave/n196 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n27 ) );
  DFF_X1 \uut_slave/command_save_reg[2]  ( .D(\uut_slave/n197 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n28 ) );
  DFF_X1 \uut_slave/command_save_reg[1]  ( .D(\uut_slave/n198 ), .CK(
        \uut_slave/n92 ), .Q(\uut_slave/n244 ), .QN(\uut_slave/n64 ) );
  DFF_X1 \uut_slave/command_save_reg[0]  ( .D(\uut_slave/n199 ), .CK(
        \uut_slave/n92 ), .Q(\uut_slave/n243 ), .QN(\uut_slave/n42 ) );
  DFF_X1 \uut_slave/data_save_reg[31]  ( .D(\uut_slave/n160 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n80 ) );
  DFF_X1 \uut_slave/data_save_reg[30]  ( .D(\uut_slave/n190 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n40 ) );
  DFF_X1 \uut_slave/data_save_reg[29]  ( .D(\uut_slave/n161 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n17 ) );
  DFF_X1 \uut_slave/data_save_reg[28]  ( .D(\uut_slave/n162 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n39 ) );
  DFF_X1 \uut_slave/data_save_reg[27]  ( .D(\uut_slave/n163 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n16 ) );
  DFF_X1 \uut_slave/data_save_reg[26]  ( .D(\uut_slave/n164 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n38 ) );
  DFF_X1 \uut_slave/data_save_reg[25]  ( .D(\uut_slave/n165 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n15 ) );
  DFF_X1 \uut_slave/data_save_reg[24]  ( .D(\uut_slave/n166 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n37 ) );
  DFF_X1 \uut_slave/data_save_reg[23]  ( .D(\uut_slave/n167 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n14 ) );
  DFF_X1 \uut_slave/data_save_reg[22]  ( .D(\uut_slave/n168 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n36 ) );
  DFF_X1 \uut_slave/data_save_reg[21]  ( .D(\uut_slave/n169 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n13 ) );
  DFF_X1 \uut_slave/data_save_reg[20]  ( .D(\uut_slave/n170 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n35 ) );
  DFF_X1 \uut_slave/data_save_reg[19]  ( .D(\uut_slave/n171 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n12 ) );
  DFF_X1 \uut_slave/data_save_reg[18]  ( .D(\uut_slave/n172 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n34 ) );
  DFF_X1 \uut_slave/data_save_reg[17]  ( .D(\uut_slave/n173 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n11 ) );
  DFF_X1 \uut_slave/data_save_reg[16]  ( .D(\uut_slave/n174 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n33 ) );
  DFF_X1 \uut_slave/data_save_reg[15]  ( .D(\uut_slave/n175 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n9 ) );
  DFF_X1 \uut_slave/data_save_reg[14]  ( .D(\uut_slave/n176 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n32 ) );
  DFF_X1 \uut_slave/data_save_reg[13]  ( .D(\uut_slave/n177 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n8 ) );
  DFF_X1 \uut_slave/data_save_reg[12]  ( .D(\uut_slave/n178 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n31 ) );
  DFF_X1 \uut_slave/data_save_reg[11]  ( .D(\uut_slave/n179 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n7 ) );
  DFF_X1 \uut_slave/data_save_reg[10]  ( .D(\uut_slave/n180 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n30 ) );
  DFF_X1 \uut_slave/data_save_reg[9]  ( .D(\uut_slave/n181 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n6 ) );
  DFF_X1 \uut_slave/data_save_reg[8]  ( .D(\uut_slave/n182 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n29 ) );
  DFF_X1 \uut_slave/data_save_reg[7]  ( .D(\uut_slave/n183 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n5 ) );
  DFF_X1 \uut_slave/data_save_reg[6]  ( .D(\uut_slave/n184 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n25 ) );
  DFF_X1 \uut_slave/data_save_reg[5]  ( .D(\uut_slave/n185 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n4 ) );
  DFF_X1 \uut_slave/data_save_reg[4]  ( .D(\uut_slave/n186 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n24 ) );
  DFF_X1 \uut_slave/data_save_reg[3]  ( .D(\uut_slave/n187 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n3 ) );
  DFF_X1 \uut_slave/data_save_reg[2]  ( .D(\uut_slave/n188 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n23 ) );
  DFF_X1 \uut_slave/data_save_reg[1]  ( .D(\uut_slave/n189 ), .CK(
        \uut_slave/n92 ), .QN(\uut_slave/n2 ) );
  DFF_X1 \uut_slave/data_save_reg[0]  ( .D(\uut_slave/n191 ), .CK(
        \uut_slave/n87 ), .QN(\uut_slave/n59 ) );
  DFF_X1 \uut_slave/current_state_reg[1]  ( .D(\uut_slave/N211 ), .CK(clk), 
        .Q(\uut_slave/n90 ), .QN(\uut_slave/n246 ) );
endmodule

