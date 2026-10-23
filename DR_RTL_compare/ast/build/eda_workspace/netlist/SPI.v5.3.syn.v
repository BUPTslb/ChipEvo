/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 09:02:04 2026
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
         \uut_master/n118 , \uut_master/n117 , \uut_master/n116 ,
         \uut_master/n115 , \uut_master/n114 , \uut_master/n113 ,
         \uut_master/n112 , \uut_master/n47 , \uut_master/n42 ,
         \uut_master/n41 , \uut_master/n39 , \uut_master/n38 ,
         \uut_master/n37 , \uut_master/n36 , \uut_master/n34 ,
         \uut_master/n33 , \uut_master/n32 , \uut_master/n30 ,
         \uut_master/n29 , \uut_master/n28 , \uut_master/n27 ,
         \uut_master/n26 , \uut_master/n25 , \uut_master/n24 ,
         \uut_master/n23 , \uut_master/n22 , \uut_master/n21 ,
         \uut_master/n20 , \uut_master/n19 , \uut_master/n18 ,
         \uut_master/n17 , \uut_master/n16 , \uut_master/n15 ,
         \uut_master/n14 , \uut_master/n13 , \uut_master/n12 ,
         \uut_master/n11 , \uut_master/n10 , \uut_master/n9 , \uut_master/n8 ,
         \uut_master/n7 , \uut_master/n6 , \uut_master/n5 , \uut_master/n4 ,
         \uut_master/n3 , \uut_master/n2 , \uut_master/n1 , \uut_master/n111 ,
         \uut_master/n110 , \uut_master/n109 , \uut_master/n108 ,
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
         \uut_master/n50 , \uut_master/n49 , \uut_master/n48 ,
         \uut_master/n46 , \uut_master/n45 , \uut_master/n44 ,
         \uut_master/n43 , \uut_master/n35 , \uut_master/N346 ,
         \uut_master/N345 , \uut_master/N223 , \uut_master/N222 ,
         \uut_master/N221 , \uut_master/N220 , \uut_master/N219 ,
         \uut_master/N218 , \uut_master/N217 , \uut_master/N216 ,
         \uut_master/N215 , \uut_master/N214 , \uut_master/N213 ,
         \uut_master/N212 , \uut_master/N211 , \uut_master/N210 ,
         \uut_master/N209 , \uut_master/N208 , \uut_master/N207 ,
         \uut_master/N206 , \uut_master/N205 , \uut_master/N204 ,
         \uut_master/N203 , \uut_master/N202 , \uut_master/N201 ,
         \uut_master/N200 , \uut_master/N199 , \uut_master/N198 ,
         \uut_master/N197 , \uut_master/N196 , \uut_master/N195 ,
         \uut_master/N194 , \uut_master/N193 , \uut_master/N192 ,
         \uut_master/N191 , \uut_master/N190 , \uut_master/N189 ,
         \uut_master/N188 , \uut_master/N187 , \uut_master/N186 ,
         \uut_master/N185 , \uut_master/N184 , \uut_master/N183 ,
         \uut_master/N182 , \uut_master/N181 , \uut_master/N180 ,
         \uut_master/N179 , \uut_master/N178 , \uut_master/N177 ,
         \uut_master/N176 , \uut_master/N175 , \uut_master/N174 ,
         \uut_master/N173 , \uut_master/N172 , \uut_master/N171 ,
         \uut_master/N170 , \uut_master/N169 , \uut_master/N168 ,
         \uut_master/N167 , \uut_master/N166 , \uut_master/N165 ,
         \uut_master/N164 , \uut_master/N163 , \uut_master/N162 ,
         \uut_master/N161 , \uut_master/N160 , \uut_master/N159 ,
         \uut_master/N158 , \uut_master/N157 , \uut_master/N156 ,
         \uut_master/N155 , \uut_master/N154 , \uut_master/N153 ,
         \uut_master/data_end , \uut_master/N15 , \uut_master/clock_count ,
         \uut_slave/n249 , \uut_slave/n248 , \uut_slave/n247 ,
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
         \uut_slave/n207 , \uut_slave/n206 , \uut_slave/n205 ,
         \uut_slave/n204 , \uut_slave/n203 , \uut_slave/n202 ,
         \uut_slave/n123 , \uut_slave/n122 , \uut_slave/n121 ,
         \uut_slave/n120 , \uut_slave/n119 , \uut_slave/n118 ,
         \uut_slave/n117 , \uut_slave/n116 , \uut_slave/n115 ,
         \uut_slave/n114 , \uut_slave/n113 , \uut_slave/n112 ,
         \uut_slave/n111 , \uut_slave/n110 , \uut_slave/n109 ,
         \uut_slave/n108 , \uut_slave/n107 , \uut_slave/n106 ,
         \uut_slave/n105 , \uut_slave/n103 , \uut_slave/n102 ,
         \uut_slave/n101 , \uut_slave/n100 , \uut_slave/n99 , \uut_slave/n98 ,
         \uut_slave/n97 , \uut_slave/n96 , \uut_slave/n95 , \uut_slave/n94 ,
         \uut_slave/n93 , \uut_slave/n92 , \uut_slave/n90 , \uut_slave/n17 ,
         \uut_slave/n15 , \uut_slave/n13 , \uut_slave/n12 , \uut_slave/n11 ,
         \uut_slave/n10 , \uut_slave/n9 , \uut_slave/n8 , \uut_slave/n7 ,
         \uut_slave/n6 , \uut_slave/n5 , \uut_slave/n4 , \uut_slave/n3 ,
         \uut_slave/n2 , \uut_slave/n1 , \uut_slave/n201 , \uut_slave/n200 ,
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
         \uut_slave/n124 , \uut_slave/n104 , \uut_slave/n91 , \uut_slave/n89 ,
         \uut_slave/n88 , \uut_slave/n87 , \uut_slave/n86 , \uut_slave/n85 ,
         \uut_slave/n84 , \uut_slave/n83 , \uut_slave/n82 , \uut_slave/n81 ,
         \uut_slave/n80 , \uut_slave/n79 , \uut_slave/n78 , \uut_slave/n77 ,
         \uut_slave/n76 , \uut_slave/n75 , \uut_slave/n74 , \uut_slave/n73 ,
         \uut_slave/n72 , \uut_slave/n71 , \uut_slave/n70 , \uut_slave/n69 ,
         \uut_slave/n68 , \uut_slave/n67 , \uut_slave/n66 , \uut_slave/n65 ,
         \uut_slave/n64 , \uut_slave/n63 , \uut_slave/n62 , \uut_slave/n61 ,
         \uut_slave/n60 , \uut_slave/n59 , \uut_slave/n58 , \uut_slave/n57 ,
         \uut_slave/n56 , \uut_slave/n55 , \uut_slave/n54 , \uut_slave/n53 ,
         \uut_slave/n52 , \uut_slave/n51 , \uut_slave/n50 , \uut_slave/n49 ,
         \uut_slave/n48 , \uut_slave/n47 , \uut_slave/n46 , \uut_slave/n45 ,
         \uut_slave/n44 , \uut_slave/n43 , \uut_slave/n42 , \uut_slave/n41 ,
         \uut_slave/n40 , \uut_slave/n39 , \uut_slave/n38 , \uut_slave/n37 ,
         \uut_slave/n36 , \uut_slave/n35 , \uut_slave/n34 , \uut_slave/n33 ,
         \uut_slave/n32 , \uut_slave/n31 , \uut_slave/n30 , \uut_slave/n29 ,
         \uut_slave/n28 , \uut_slave/n27 , \uut_slave/n26 , \uut_slave/n25 ,
         \uut_slave/n24 , \uut_slave/n23 , \uut_slave/n22 , \uut_slave/n21 ,
         \uut_slave/n20 , \uut_slave/n19 , \uut_slave/n18 , \uut_slave/n16 ,
         \uut_slave/n14 , \uut_slave/N142 , \uut_slave/data_end ,
         \uut_slave/data_end_next ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [5:0] \uut_master/data_count ;
  wire   [1:0] \uut_master/current_state ;
  wire   [7:0] \uut_slave/command_save ;
  wire   [1:0] \uut_slave/current_state ;
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
  OAI222_X1 \uut_master/U285  ( .A1(\uut_master/n11 ), .A2(\uut_master/n307 ), 
        .B1(\uut_master/n48 ), .B2(\uut_master/n18 ), .C1(\uut_master/n118 ), 
        .C2(\uut_master/n49 ), .ZN(\uut_master/N216 ) );
  OAI222_X1 \uut_master/U284  ( .A1(\uut_master/n11 ), .A2(\uut_master/n306 ), 
        .B1(\uut_master/n49 ), .B2(\uut_master/n30 ), .C1(\uut_master/n127 ), 
        .C2(\uut_master/n50 ), .ZN(\uut_master/N215 ) );
  OAI222_X1 \uut_master/U283  ( .A1(\uut_master/n11 ), .A2(\uut_master/n305 ), 
        .B1(\uut_master/n50 ), .B2(\uut_master/n148 ), .C1(\uut_master/n127 ), 
        .C2(\uut_master/n51 ), .ZN(\uut_master/N214 ) );
  OAI222_X1 \uut_master/U282  ( .A1(\uut_master/n11 ), .A2(\uut_master/n304 ), 
        .B1(\uut_master/n51 ), .B2(\uut_master/n149 ), .C1(\uut_master/n127 ), 
        .C2(\uut_master/n52 ), .ZN(\uut_master/N213 ) );
  OAI222_X1 \uut_master/U281  ( .A1(\uut_master/n11 ), .A2(\uut_master/n303 ), 
        .B1(\uut_master/n52 ), .B2(\uut_master/n149 ), .C1(\uut_master/n20 ), 
        .C2(\uut_master/n53 ), .ZN(\uut_master/N212 ) );
  OAI222_X1 \uut_master/U280  ( .A1(\uut_master/n11 ), .A2(\uut_master/n302 ), 
        .B1(\uut_master/n53 ), .B2(\uut_master/n19 ), .C1(\uut_master/n127 ), 
        .C2(\uut_master/n54 ), .ZN(\uut_master/N211 ) );
  INV_X1 \uut_master/U279  ( .A(command[2]), .ZN(\uut_master/n302 ) );
  OAI222_X1 \uut_master/U278  ( .A1(\uut_master/n11 ), .A2(\uut_master/n301 ), 
        .B1(\uut_master/n54 ), .B2(\uut_master/n29 ), .C1(\uut_master/n127 ), 
        .C2(\uut_master/n55 ), .ZN(\uut_master/N210 ) );
  INV_X1 \uut_master/U277  ( .A(command[1]), .ZN(\uut_master/n301 ) );
  OAI222_X1 \uut_master/U276  ( .A1(\uut_master/n11 ), .A2(\uut_master/n300 ), 
        .B1(\uut_master/n55 ), .B2(\uut_master/n148 ), .C1(\uut_master/n127 ), 
        .C2(\uut_master/n56 ), .ZN(\uut_master/N209 ) );
  OAI21_X1 \uut_master/U275  ( .B1(\uut_master/n57 ), .B2(\uut_master/n118 ), 
        .A(\uut_master/n299 ), .ZN(\uut_master/N208 ) );
  AOI22_X1 \uut_master/U274  ( .A1(\uut_master/n112 ), .A2(\uut_master/n298 ), 
        .B1(address[23]), .B2(\uut_master/n120 ), .ZN(\uut_master/n299 ) );
  OAI21_X1 \uut_master/U273  ( .B1(\uut_master/n58 ), .B2(\uut_master/n128 ), 
        .A(\uut_master/n296 ), .ZN(\uut_master/N207 ) );
  AOI22_X1 \uut_master/U272  ( .A1(\uut_master/n112 ), .A2(\uut_master/n295 ), 
        .B1(address[22]), .B2(\uut_master/n9 ), .ZN(\uut_master/n296 ) );
  OAI21_X1 \uut_master/U271  ( .B1(\uut_master/n59 ), .B2(\uut_master/n129 ), 
        .A(\uut_master/n294 ), .ZN(\uut_master/N206 ) );
  AOI22_X1 \uut_master/U270  ( .A1(\uut_master/n123 ), .A2(\uut_master/n293 ), 
        .B1(address[21]), .B2(\uut_master/n120 ), .ZN(\uut_master/n294 ) );
  OAI21_X1 \uut_master/U269  ( .B1(\uut_master/n60 ), .B2(\uut_master/n23 ), 
        .A(\uut_master/n292 ), .ZN(\uut_master/N205 ) );
  AOI22_X1 \uut_master/U268  ( .A1(\uut_master/n123 ), .A2(\uut_master/n291 ), 
        .B1(address[20]), .B2(\uut_master/n120 ), .ZN(\uut_master/n292 ) );
  OAI21_X1 \uut_master/U267  ( .B1(\uut_master/n61 ), .B2(\uut_master/n129 ), 
        .A(\uut_master/n290 ), .ZN(\uut_master/N204 ) );
  AOI22_X1 \uut_master/U266  ( .A1(\uut_master/n123 ), .A2(\uut_master/n289 ), 
        .B1(address[19]), .B2(\uut_master/n120 ), .ZN(\uut_master/n290 ) );
  OAI21_X1 \uut_master/U265  ( .B1(\uut_master/n62 ), .B2(\uut_master/n23 ), 
        .A(\uut_master/n288 ), .ZN(\uut_master/N203 ) );
  AOI22_X1 \uut_master/U264  ( .A1(\uut_master/n123 ), .A2(\uut_master/n287 ), 
        .B1(address[18]), .B2(\uut_master/n120 ), .ZN(\uut_master/n288 ) );
  OAI21_X1 \uut_master/U263  ( .B1(\uut_master/n63 ), .B2(\uut_master/n128 ), 
        .A(\uut_master/n286 ), .ZN(\uut_master/N202 ) );
  AOI22_X1 \uut_master/U262  ( .A1(\uut_master/n123 ), .A2(\uut_master/n285 ), 
        .B1(address[17]), .B2(\uut_master/n120 ), .ZN(\uut_master/n286 ) );
  OAI21_X1 \uut_master/U261  ( .B1(\uut_master/n64 ), .B2(\uut_master/n23 ), 
        .A(\uut_master/n284 ), .ZN(\uut_master/N201 ) );
  AOI22_X1 \uut_master/U260  ( .A1(\uut_master/n123 ), .A2(\uut_master/n283 ), 
        .B1(address[16]), .B2(\uut_master/n47 ), .ZN(\uut_master/n284 ) );
  OAI21_X1 \uut_master/U259  ( .B1(\uut_master/n65 ), .B2(\uut_master/n128 ), 
        .A(\uut_master/n282 ), .ZN(\uut_master/N200 ) );
  AOI22_X1 \uut_master/U258  ( .A1(\uut_master/n123 ), .A2(\uut_master/n281 ), 
        .B1(address[15]), .B2(\uut_master/n120 ), .ZN(\uut_master/n282 ) );
  OAI21_X1 \uut_master/U257  ( .B1(\uut_master/n66 ), .B2(\uut_master/n118 ), 
        .A(\uut_master/n280 ), .ZN(\uut_master/N199 ) );
  AOI22_X1 \uut_master/U256  ( .A1(\uut_master/n112 ), .A2(\uut_master/n279 ), 
        .B1(address[14]), .B2(\uut_master/n9 ), .ZN(\uut_master/n280 ) );
  OAI21_X1 \uut_master/U255  ( .B1(\uut_master/n67 ), .B2(\uut_master/n23 ), 
        .A(\uut_master/n278 ), .ZN(\uut_master/N198 ) );
  AOI22_X1 \uut_master/U254  ( .A1(\uut_master/n112 ), .A2(\uut_master/n277 ), 
        .B1(address[13]), .B2(\uut_master/n9 ), .ZN(\uut_master/n278 ) );
  OAI21_X1 \uut_master/U253  ( .B1(\uut_master/n68 ), .B2(\uut_master/n118 ), 
        .A(\uut_master/n276 ), .ZN(\uut_master/N197 ) );
  AOI22_X1 \uut_master/U252  ( .A1(\uut_master/n112 ), .A2(\uut_master/n275 ), 
        .B1(address[12]), .B2(\uut_master/n120 ), .ZN(\uut_master/n276 ) );
  OAI21_X1 \uut_master/U251  ( .B1(\uut_master/n69 ), .B2(\uut_master/n23 ), 
        .A(\uut_master/n274 ), .ZN(\uut_master/N196 ) );
  AOI22_X1 \uut_master/U250  ( .A1(\uut_master/n112 ), .A2(\uut_master/n273 ), 
        .B1(address[11]), .B2(\uut_master/n9 ), .ZN(\uut_master/n274 ) );
  OAI21_X1 \uut_master/U249  ( .B1(\uut_master/n70 ), .B2(\uut_master/n128 ), 
        .A(\uut_master/n272 ), .ZN(\uut_master/N195 ) );
  AOI22_X1 \uut_master/U248  ( .A1(\uut_master/n123 ), .A2(\uut_master/n271 ), 
        .B1(address[10]), .B2(\uut_master/n120 ), .ZN(\uut_master/n272 ) );
  OAI21_X1 \uut_master/U247  ( .B1(\uut_master/n71 ), .B2(\uut_master/n118 ), 
        .A(\uut_master/n270 ), .ZN(\uut_master/N194 ) );
  AOI22_X1 \uut_master/U246  ( .A1(\uut_master/n112 ), .A2(\uut_master/n269 ), 
        .B1(address[9]), .B2(\uut_master/n9 ), .ZN(\uut_master/n270 ) );
  OAI21_X1 \uut_master/U245  ( .B1(\uut_master/n72 ), .B2(\uut_master/n118 ), 
        .A(\uut_master/n268 ), .ZN(\uut_master/N193 ) );
  AOI22_X1 \uut_master/U244  ( .A1(\uut_master/n123 ), .A2(\uut_master/n267 ), 
        .B1(address[8]), .B2(\uut_master/n47 ), .ZN(\uut_master/n268 ) );
  OAI21_X1 \uut_master/U243  ( .B1(\uut_master/n73 ), .B2(\uut_master/n128 ), 
        .A(\uut_master/n266 ), .ZN(\uut_master/N192 ) );
  AOI22_X1 \uut_master/U242  ( .A1(\uut_master/n112 ), .A2(\uut_master/n265 ), 
        .B1(address[7]), .B2(\uut_master/n121 ), .ZN(\uut_master/n266 ) );
  OAI21_X1 \uut_master/U241  ( .B1(\uut_master/n74 ), .B2(\uut_master/n128 ), 
        .A(\uut_master/n264 ), .ZN(\uut_master/N191 ) );
  AOI22_X1 \uut_master/U240  ( .A1(\uut_master/n112 ), .A2(\uut_master/n263 ), 
        .B1(address[6]), .B2(\uut_master/n47 ), .ZN(\uut_master/n264 ) );
  OAI21_X1 \uut_master/U239  ( .B1(\uut_master/n75 ), .B2(\uut_master/n128 ), 
        .A(\uut_master/n262 ), .ZN(\uut_master/N190 ) );
  AOI22_X1 \uut_master/U238  ( .A1(\uut_master/n123 ), .A2(\uut_master/n261 ), 
        .B1(address[5]), .B2(\uut_master/n120 ), .ZN(\uut_master/n262 ) );
  OAI21_X1 \uut_master/U237  ( .B1(\uut_master/n76 ), .B2(\uut_master/n129 ), 
        .A(\uut_master/n260 ), .ZN(\uut_master/N189 ) );
  AOI22_X1 \uut_master/U236  ( .A1(\uut_master/n112 ), .A2(\uut_master/n259 ), 
        .B1(address[4]), .B2(\uut_master/n9 ), .ZN(\uut_master/n260 ) );
  OAI21_X1 \uut_master/U235  ( .B1(\uut_master/n77 ), .B2(\uut_master/n129 ), 
        .A(\uut_master/n258 ), .ZN(\uut_master/N188 ) );
  AOI22_X1 \uut_master/U234  ( .A1(\uut_master/n112 ), .A2(\uut_master/n257 ), 
        .B1(address[3]), .B2(\uut_master/n121 ), .ZN(\uut_master/n258 ) );
  OAI21_X1 \uut_master/U233  ( .B1(\uut_master/n78 ), .B2(\uut_master/n130 ), 
        .A(\uut_master/n256 ), .ZN(\uut_master/N187 ) );
  AOI22_X1 \uut_master/U232  ( .A1(\uut_master/n123 ), .A2(\uut_master/n255 ), 
        .B1(address[2]), .B2(\uut_master/n121 ), .ZN(\uut_master/n256 ) );
  OAI21_X1 \uut_master/U231  ( .B1(\uut_master/n79 ), .B2(\uut_master/n118 ), 
        .A(\uut_master/n254 ), .ZN(\uut_master/N186 ) );
  AOI22_X1 \uut_master/U230  ( .A1(\uut_master/n112 ), .A2(\uut_master/n253 ), 
        .B1(address[1]), .B2(\uut_master/n120 ), .ZN(\uut_master/n254 ) );
  OAI21_X1 \uut_master/U229  ( .B1(\uut_master/n80 ), .B2(\uut_master/n23 ), 
        .A(\uut_master/n252 ), .ZN(\uut_master/N185 ) );
  AOI22_X1 \uut_master/U228  ( .A1(\uut_master/n123 ), .A2(\uut_master/n251 ), 
        .B1(address[0]), .B2(\uut_master/n121 ), .ZN(\uut_master/n252 ) );
  OAI221_X1 \uut_master/U227  ( .B1(\uut_master/n80 ), .B2(\uut_master/n29 ), 
        .C1(\uut_master/n81 ), .C2(\uut_master/n130 ), .A(\uut_master/n250 ), 
        .ZN(\uut_master/N184 ) );
  NAND3_X1 \uut_master/U226  ( .A1(data_in[31]), .A2(\uut_master/n152 ), .A3(
        \uut_master/n9 ), .ZN(\uut_master/n250 ) );
  OAI221_X1 \uut_master/U225  ( .B1(\uut_master/n81 ), .B2(\uut_master/n124 ), 
        .C1(\uut_master/n82 ), .C2(\uut_master/n129 ), .A(\uut_master/n248 ), 
        .ZN(\uut_master/N183 ) );
  NAND3_X1 \uut_master/U224  ( .A1(data_in[30]), .A2(\uut_master/n152 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n248 ) );
  OAI221_X1 \uut_master/U223  ( .B1(\uut_master/n82 ), .B2(\uut_master/n30 ), 
        .C1(\uut_master/n23 ), .C2(\uut_master/n83 ), .A(\uut_master/n247 ), 
        .ZN(\uut_master/N182 ) );
  NAND3_X1 \uut_master/U222  ( .A1(data_in[29]), .A2(\uut_master/n152 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n247 ) );
  OAI221_X1 \uut_master/U221  ( .B1(\uut_master/n83 ), .B2(\uut_master/n19 ), 
        .C1(\uut_master/n84 ), .C2(\uut_master/n128 ), .A(\uut_master/n246 ), 
        .ZN(\uut_master/N181 ) );
  NAND3_X1 \uut_master/U220  ( .A1(data_in[28]), .A2(\uut_master/n152 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n246 ) );
  OAI221_X1 \uut_master/U219  ( .B1(\uut_master/n84 ), .B2(\uut_master/n30 ), 
        .C1(\uut_master/n85 ), .C2(\uut_master/n130 ), .A(\uut_master/n245 ), 
        .ZN(\uut_master/N180 ) );
  NAND3_X1 \uut_master/U218  ( .A1(data_in[27]), .A2(\uut_master/n152 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n245 ) );
  OAI221_X1 \uut_master/U217  ( .B1(\uut_master/n85 ), .B2(\uut_master/n18 ), 
        .C1(\uut_master/n86 ), .C2(\uut_master/n128 ), .A(\uut_master/n244 ), 
        .ZN(\uut_master/N179 ) );
  NAND3_X1 \uut_master/U216  ( .A1(data_in[26]), .A2(\uut_master/n152 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n244 ) );
  OAI221_X1 \uut_master/U215  ( .B1(\uut_master/n86 ), .B2(\uut_master/n29 ), 
        .C1(\uut_master/n23 ), .C2(\uut_master/n87 ), .A(\uut_master/n243 ), 
        .ZN(\uut_master/N178 ) );
  NAND3_X1 \uut_master/U214  ( .A1(data_in[25]), .A2(\uut_master/n152 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n243 ) );
  OAI221_X1 \uut_master/U213  ( .B1(\uut_master/n87 ), .B2(\uut_master/n30 ), 
        .C1(\uut_master/n88 ), .C2(\uut_master/n129 ), .A(\uut_master/n242 ), 
        .ZN(\uut_master/N177 ) );
  NAND3_X1 \uut_master/U212  ( .A1(data_in[24]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n242 ) );
  OAI221_X1 \uut_master/U211  ( .B1(\uut_master/n88 ), .B2(\uut_master/n18 ), 
        .C1(\uut_master/n118 ), .C2(\uut_master/n89 ), .A(\uut_master/n241 ), 
        .ZN(\uut_master/N176 ) );
  NAND3_X1 \uut_master/U210  ( .A1(data_in[23]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n241 ) );
  OAI221_X1 \uut_master/U209  ( .B1(\uut_master/n89 ), .B2(\uut_master/n124 ), 
        .C1(\uut_master/n90 ), .C2(\uut_master/n130 ), .A(\uut_master/n240 ), 
        .ZN(\uut_master/N175 ) );
  NAND3_X1 \uut_master/U208  ( .A1(data_in[22]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n240 ) );
  OAI221_X1 \uut_master/U207  ( .B1(\uut_master/n90 ), .B2(\uut_master/n148 ), 
        .C1(\uut_master/n91 ), .C2(\uut_master/n129 ), .A(\uut_master/n239 ), 
        .ZN(\uut_master/N174 ) );
  NAND3_X1 \uut_master/U206  ( .A1(data_in[21]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n239 ) );
  OAI221_X1 \uut_master/U205  ( .B1(\uut_master/n91 ), .B2(\uut_master/n148 ), 
        .C1(\uut_master/n118 ), .C2(\uut_master/n92 ), .A(\uut_master/n238 ), 
        .ZN(\uut_master/N173 ) );
  NAND3_X1 \uut_master/U204  ( .A1(data_in[20]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n238 ) );
  OAI221_X1 \uut_master/U203  ( .B1(\uut_master/n92 ), .B2(\uut_master/n124 ), 
        .C1(\uut_master/n20 ), .C2(\uut_master/n93 ), .A(\uut_master/n237 ), 
        .ZN(\uut_master/N172 ) );
  NAND3_X1 \uut_master/U202  ( .A1(data_in[19]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n237 ) );
  OAI221_X1 \uut_master/U201  ( .B1(\uut_master/n93 ), .B2(\uut_master/n29 ), 
        .C1(\uut_master/n94 ), .C2(\uut_master/n128 ), .A(\uut_master/n236 ), 
        .ZN(\uut_master/N171 ) );
  NAND3_X1 \uut_master/U200  ( .A1(data_in[18]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n236 ) );
  OAI221_X1 \uut_master/U199  ( .B1(\uut_master/n94 ), .B2(\uut_master/n148 ), 
        .C1(\uut_master/n129 ), .C2(\uut_master/n95 ), .A(\uut_master/n235 ), 
        .ZN(\uut_master/N170 ) );
  NAND3_X1 \uut_master/U198  ( .A1(data_in[17]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n235 ) );
  OAI221_X1 \uut_master/U197  ( .B1(\uut_master/n95 ), .B2(\uut_master/n19 ), 
        .C1(\uut_master/n96 ), .C2(\uut_master/n128 ), .A(\uut_master/n234 ), 
        .ZN(\uut_master/N169 ) );
  NAND3_X1 \uut_master/U196  ( .A1(data_in[16]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n234 ) );
  OAI221_X1 \uut_master/U195  ( .B1(\uut_master/n96 ), .B2(\uut_master/n29 ), 
        .C1(\uut_master/n97 ), .C2(\uut_master/n130 ), .A(\uut_master/n233 ), 
        .ZN(\uut_master/N168 ) );
  NAND3_X1 \uut_master/U194  ( .A1(data_in[15]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n233 ) );
  OAI221_X1 \uut_master/U193  ( .B1(\uut_master/n97 ), .B2(\uut_master/n18 ), 
        .C1(\uut_master/n23 ), .C2(\uut_master/n98 ), .A(\uut_master/n232 ), 
        .ZN(\uut_master/N167 ) );
  NAND3_X1 \uut_master/U192  ( .A1(data_in[14]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n232 ) );
  OAI221_X1 \uut_master/U191  ( .B1(\uut_master/n98 ), .B2(\uut_master/n149 ), 
        .C1(\uut_master/n99 ), .C2(\uut_master/n128 ), .A(\uut_master/n231 ), 
        .ZN(\uut_master/N166 ) );
  NAND3_X1 \uut_master/U190  ( .A1(data_in[13]), .A2(\uut_master/n151 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n231 ) );
  OAI221_X1 \uut_master/U189  ( .B1(\uut_master/n99 ), .B2(\uut_master/n149 ), 
        .C1(\uut_master/n130 ), .C2(\uut_master/n100 ), .A(\uut_master/n230 ), 
        .ZN(\uut_master/N165 ) );
  NAND3_X1 \uut_master/U188  ( .A1(data_in[12]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n230 ) );
  OAI221_X1 \uut_master/U187  ( .B1(\uut_master/n100 ), .B2(\uut_master/n18 ), 
        .C1(\uut_master/n23 ), .C2(\uut_master/n101 ), .A(\uut_master/n229 ), 
        .ZN(\uut_master/N164 ) );
  NAND3_X1 \uut_master/U186  ( .A1(data_in[11]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n229 ) );
  OAI221_X1 \uut_master/U185  ( .B1(\uut_master/n101 ), .B2(\uut_master/n19 ), 
        .C1(\uut_master/n23 ), .C2(\uut_master/n102 ), .A(\uut_master/n228 ), 
        .ZN(\uut_master/N163 ) );
  NAND3_X1 \uut_master/U184  ( .A1(data_in[10]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n228 ) );
  OAI221_X1 \uut_master/U183  ( .B1(\uut_master/n102 ), .B2(\uut_master/n124 ), 
        .C1(\uut_master/n118 ), .C2(\uut_master/n103 ), .A(\uut_master/n227 ), 
        .ZN(\uut_master/N162 ) );
  NAND3_X1 \uut_master/U182  ( .A1(data_in[9]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n227 ) );
  OAI221_X1 \uut_master/U181  ( .B1(\uut_master/n103 ), .B2(\uut_master/n19 ), 
        .C1(\uut_master/n23 ), .C2(\uut_master/n104 ), .A(\uut_master/n226 ), 
        .ZN(\uut_master/N161 ) );
  NAND3_X1 \uut_master/U180  ( .A1(data_in[8]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n226 ) );
  OAI221_X1 \uut_master/U179  ( .B1(\uut_master/n30 ), .B2(\uut_master/n104 ), 
        .C1(\uut_master/n118 ), .C2(\uut_master/n105 ), .A(\uut_master/n225 ), 
        .ZN(\uut_master/N160 ) );
  NAND3_X1 \uut_master/U178  ( .A1(data_in[7]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n225 ) );
  OAI221_X1 \uut_master/U177  ( .B1(\uut_master/n105 ), .B2(\uut_master/n124 ), 
        .C1(\uut_master/n129 ), .C2(\uut_master/n106 ), .A(\uut_master/n224 ), 
        .ZN(\uut_master/N159 ) );
  OAI221_X1 \uut_master/U176  ( .B1(\uut_master/n106 ), .B2(\uut_master/n149 ), 
        .C1(\uut_master/n107 ), .C2(\uut_master/n130 ), .A(\uut_master/n223 ), 
        .ZN(\uut_master/N158 ) );
  NAND3_X1 \uut_master/U175  ( .A1(data_in[5]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n223 ) );
  OAI221_X1 \uut_master/U174  ( .B1(\uut_master/n107 ), .B2(\uut_master/n124 ), 
        .C1(\uut_master/n129 ), .C2(\uut_master/n108 ), .A(\uut_master/n222 ), 
        .ZN(\uut_master/N157 ) );
  NAND3_X1 \uut_master/U173  ( .A1(data_in[4]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n121 ), .ZN(\uut_master/n222 ) );
  OAI221_X1 \uut_master/U172  ( .B1(\uut_master/n108 ), .B2(\uut_master/n18 ), 
        .C1(\uut_master/n129 ), .C2(\uut_master/n109 ), .A(\uut_master/n221 ), 
        .ZN(\uut_master/N156 ) );
  NAND3_X1 \uut_master/U171  ( .A1(data_in[3]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n221 ) );
  OAI221_X1 \uut_master/U170  ( .B1(\uut_master/n109 ), .B2(\uut_master/n29 ), 
        .C1(\uut_master/n23 ), .C2(\uut_master/n110 ), .A(\uut_master/n220 ), 
        .ZN(\uut_master/N155 ) );
  NAND3_X1 \uut_master/U169  ( .A1(data_in[2]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n47 ), .ZN(\uut_master/n220 ) );
  OAI221_X1 \uut_master/U168  ( .B1(\uut_master/n110 ), .B2(\uut_master/n19 ), 
        .C1(\uut_master/n111 ), .C2(\uut_master/n129 ), .A(\uut_master/n219 ), 
        .ZN(\uut_master/N154 ) );
  NAND3_X1 \uut_master/U167  ( .A1(data_in[1]), .A2(\uut_master/n150 ), .A3(
        \uut_master/n297 ), .ZN(\uut_master/n219 ) );
  INV_X1 \uut_master/U166  ( .A(\uut_master/n218 ), .ZN(\uut_master/n249 ) );
  NAND4_X1 \uut_master/U165  ( .A1(\uut_master/n305 ), .A2(\uut_master/n304 ), 
        .A3(\uut_master/n8 ), .A4(\uut_master/n217 ), .ZN(\uut_master/n218 )
         );
  NOR4_X1 \uut_master/U164  ( .A1(command[2]), .A2(command[3]), .A3(command[0]), .A4(command[1]), .ZN(\uut_master/n217 ) );
  OAI22_X1 \uut_master/U163  ( .A1(\uut_master/n216 ), .A2(\uut_master/n215 ), 
        .B1(\uut_master/n111 ), .B2(\uut_master/n30 ), .ZN(\uut_master/N153 )
         );
  NAND4_X1 \uut_master/U162  ( .A1(data_in[0]), .A2(\uut_master/n9 ), .A3(
        \uut_master/n300 ), .A4(\uut_master/n212 ), .ZN(\uut_master/n215 ) );
  NOR2_X1 \uut_master/U161  ( .A1(command[1]), .A2(command[2]), .ZN(
        \uut_master/n212 ) );
  INV_X1 \uut_master/U160  ( .A(command[0]), .ZN(\uut_master/n300 ) );
  NAND4_X1 \uut_master/U159  ( .A1(\uut_master/n304 ), .A2(\uut_master/n303 ), 
        .A3(\uut_master/n305 ), .A4(\uut_master/n8 ), .ZN(\uut_master/n216 )
         );
  INV_X1 \uut_master/U158  ( .A(command[6]), .ZN(\uut_master/n306 ) );
  INV_X1 \uut_master/U157  ( .A(command[7]), .ZN(\uut_master/n307 ) );
  INV_X1 \uut_master/U156  ( .A(command[5]), .ZN(\uut_master/n305 ) );
  INV_X1 \uut_master/U155  ( .A(command[3]), .ZN(\uut_master/n303 ) );
  INV_X1 \uut_master/U154  ( .A(command[4]), .ZN(\uut_master/n304 ) );
  OAI22_X1 \uut_master/U153  ( .A1(\uut_master/n144 ), .A2(\uut_master/n209 ), 
        .B1(\uut_master/n113 ), .B2(\uut_master/n208 ), .ZN(\uut_master/n340 )
         );
  OAI22_X1 \uut_master/U152  ( .A1(\uut_master/n145 ), .A2(\uut_master/n207 ), 
        .B1(\uut_master/n7 ), .B2(\uut_master/n209 ), .ZN(\uut_master/n339 )
         );
  OAI22_X1 \uut_master/U151  ( .A1(\uut_master/n142 ), .A2(\uut_master/n206 ), 
        .B1(\uut_master/n135 ), .B2(\uut_master/n207 ), .ZN(\uut_master/n338 )
         );
  OAI22_X1 \uut_master/U150  ( .A1(\uut_master/n146 ), .A2(\uut_master/n205 ), 
        .B1(\uut_master/n135 ), .B2(\uut_master/n206 ), .ZN(\uut_master/n337 )
         );
  OAI22_X1 \uut_master/U149  ( .A1(\uut_master/n140 ), .A2(\uut_master/n204 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n205 ), .ZN(\uut_master/n336 )
         );
  OAI22_X1 \uut_master/U148  ( .A1(\uut_master/n141 ), .A2(\uut_master/n203 ), 
        .B1(\uut_master/n36 ), .B2(\uut_master/n204 ), .ZN(\uut_master/n335 )
         );
  OAI22_X1 \uut_master/U147  ( .A1(\uut_master/n146 ), .A2(\uut_master/n202 ), 
        .B1(\uut_master/n16 ), .B2(\uut_master/n203 ), .ZN(\uut_master/n334 )
         );
  OAI22_X1 \uut_master/U146  ( .A1(\uut_master/n142 ), .A2(\uut_master/n201 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n202 ), .ZN(\uut_master/n333 )
         );
  OAI22_X1 \uut_master/U145  ( .A1(\uut_master/n140 ), .A2(\uut_master/n200 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n201 ), .ZN(\uut_master/n332 )
         );
  OAI22_X1 \uut_master/U144  ( .A1(\uut_master/n141 ), .A2(\uut_master/n199 ), 
        .B1(\uut_master/n136 ), .B2(\uut_master/n200 ), .ZN(\uut_master/n331 )
         );
  OAI22_X1 \uut_master/U143  ( .A1(\uut_master/n142 ), .A2(\uut_master/n198 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n199 ), .ZN(\uut_master/n330 )
         );
  OAI22_X1 \uut_master/U142  ( .A1(\uut_master/n143 ), .A2(\uut_master/n197 ), 
        .B1(\uut_master/n7 ), .B2(\uut_master/n198 ), .ZN(\uut_master/n329 )
         );
  OAI22_X1 \uut_master/U141  ( .A1(\uut_master/n140 ), .A2(\uut_master/n196 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n197 ), .ZN(\uut_master/n328 )
         );
  OAI22_X1 \uut_master/U140  ( .A1(\uut_master/n145 ), .A2(\uut_master/n195 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n196 ), .ZN(\uut_master/n327 )
         );
  OAI22_X1 \uut_master/U139  ( .A1(\uut_master/n143 ), .A2(\uut_master/n194 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n195 ), .ZN(\uut_master/n326 )
         );
  OAI22_X1 \uut_master/U138  ( .A1(\uut_master/n146 ), .A2(\uut_master/n193 ), 
        .B1(\uut_master/n36 ), .B2(\uut_master/n194 ), .ZN(\uut_master/n325 )
         );
  OAI22_X1 \uut_master/U137  ( .A1(\uut_master/n140 ), .A2(\uut_master/n192 ), 
        .B1(\uut_master/n136 ), .B2(\uut_master/n193 ), .ZN(\uut_master/n324 )
         );
  OAI22_X1 \uut_master/U136  ( .A1(\uut_master/n144 ), .A2(\uut_master/n191 ), 
        .B1(\uut_master/n135 ), .B2(\uut_master/n192 ), .ZN(\uut_master/n323 )
         );
  OAI22_X1 \uut_master/U135  ( .A1(\uut_master/n141 ), .A2(\uut_master/n190 ), 
        .B1(\uut_master/n113 ), .B2(\uut_master/n191 ), .ZN(\uut_master/n322 )
         );
  OAI22_X1 \uut_master/U134  ( .A1(\uut_master/n146 ), .A2(\uut_master/n189 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n190 ), .ZN(\uut_master/n321 )
         );
  OAI22_X1 \uut_master/U133  ( .A1(\uut_master/n143 ), .A2(\uut_master/n188 ), 
        .B1(\uut_master/n16 ), .B2(\uut_master/n189 ), .ZN(\uut_master/n320 )
         );
  OAI22_X1 \uut_master/U132  ( .A1(\uut_master/n144 ), .A2(\uut_master/n187 ), 
        .B1(\uut_master/n36 ), .B2(\uut_master/n188 ), .ZN(\uut_master/n319 )
         );
  OAI22_X1 \uut_master/U131  ( .A1(\uut_master/n140 ), .A2(\uut_master/n186 ), 
        .B1(\uut_master/n135 ), .B2(\uut_master/n187 ), .ZN(\uut_master/n318 )
         );
  OAI22_X1 \uut_master/U130  ( .A1(\uut_master/n145 ), .A2(\uut_master/n185 ), 
        .B1(\uut_master/n135 ), .B2(\uut_master/n186 ), .ZN(\uut_master/n317 )
         );
  OAI22_X1 \uut_master/U129  ( .A1(\uut_master/n142 ), .A2(\uut_master/n184 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n185 ), .ZN(\uut_master/n316 )
         );
  OAI22_X1 \uut_master/U128  ( .A1(\uut_master/n143 ), .A2(\uut_master/n183 ), 
        .B1(\uut_master/n16 ), .B2(\uut_master/n184 ), .ZN(\uut_master/n315 )
         );
  OAI22_X1 \uut_master/U127  ( .A1(\uut_master/n144 ), .A2(\uut_master/n182 ), 
        .B1(\uut_master/n135 ), .B2(\uut_master/n183 ), .ZN(\uut_master/n314 )
         );
  OAI22_X1 \uut_master/U126  ( .A1(\uut_master/n141 ), .A2(\uut_master/n181 ), 
        .B1(\uut_master/n136 ), .B2(\uut_master/n182 ), .ZN(\uut_master/n313 )
         );
  OAI22_X1 \uut_master/U125  ( .A1(\uut_master/n142 ), .A2(\uut_master/n180 ), 
        .B1(\uut_master/n135 ), .B2(\uut_master/n181 ), .ZN(\uut_master/n312 )
         );
  OAI22_X1 \uut_master/U124  ( .A1(\uut_master/n143 ), .A2(\uut_master/n179 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n180 ), .ZN(\uut_master/n311 )
         );
  OAI22_X1 \uut_master/U123  ( .A1(\uut_master/n145 ), .A2(\uut_master/n178 ), 
        .B1(\uut_master/n134 ), .B2(\uut_master/n179 ), .ZN(\uut_master/n310 )
         );
  INV_X1 \uut_master/U122  ( .A(\uut_master/n176 ), .ZN(\uut_master/n309 ) );
  AOI22_X1 \uut_master/U121  ( .A1(data_out[0]), .A2(\uut_master/n133 ), .B1(
        \uut_master/n117 ), .B2(miso), .ZN(\uut_master/n176 ) );
  OAI222_X1 \uut_master/U120  ( .A1(\uut_master/n6 ), .A2(\uut_master/n119 ), 
        .B1(rst), .B2(\uut_master/n174 ), .C1(\uut_master/n119 ), .C2(
        \uut_master/n213 ), .ZN(\uut_master/n177 ) );
  NOR3_X1 \uut_master/U119  ( .A1(\uut_master/current_state [0]), .A2(
        \uut_master/n122 ), .A3(\uut_master/n173 ), .ZN(\uut_master/n174 ) );
  OAI22_X1 \uut_master/U118  ( .A1(rst), .A2(\uut_master/n171 ), .B1(
        \uut_master/data_end ), .B2(\uut_master/n25 ), .ZN(\uut_master/N346 )
         );
  NOR2_X1 \uut_master/U117  ( .A1(\uut_master/n127 ), .A2(\uut_master/n170 ), 
        .ZN(\uut_master/N223 ) );
  OAI22_X1 \uut_master/U116  ( .A1(\uut_master/n13 ), .A2(\uut_master/n169 ), 
        .B1(\uut_master/n37 ), .B2(\uut_master/n173 ), .ZN(\uut_master/N222 )
         );
  NAND2_X1 \uut_master/U115  ( .A1(\uut_master/data_count [4]), .A2(
        \uut_master/n32 ), .ZN(\uut_master/n168 ) );
  OAI22_X1 \uut_master/U114  ( .A1(\uut_master/n13 ), .A2(\uut_master/n166 ), 
        .B1(\uut_master/n37 ), .B2(\uut_master/n43 ), .ZN(\uut_master/N221 )
         );
  XOR2_X1 \uut_master/U113  ( .A(\uut_master/n167 ), .B(
        \uut_master/data_count [4]), .Z(\uut_master/n166 ) );
  NAND2_X1 \uut_master/U112  ( .A1(\uut_master/n159 ), .A2(\uut_master/n26 ), 
        .ZN(\uut_master/n167 ) );
  OAI22_X1 \uut_master/U111  ( .A1(\uut_master/n44 ), .A2(\uut_master/n37 ), 
        .B1(\uut_master/n14 ), .B2(\uut_master/n164 ), .ZN(\uut_master/N220 )
         );
  XOR2_X1 \uut_master/U110  ( .A(\uut_master/n165 ), .B(\uut_master/n159 ), 
        .Z(\uut_master/n164 ) );
  NAND2_X1 \uut_master/U109  ( .A1(\uut_master/data_count [2]), .A2(
        \uut_master/n42 ), .ZN(\uut_master/n165 ) );
  OAI22_X1 \uut_master/U108  ( .A1(\uut_master/n162 ), .A2(\uut_master/n14 ), 
        .B1(\uut_master/n37 ), .B2(\uut_master/n45 ), .ZN(\uut_master/N219 )
         );
  XOR2_X1 \uut_master/U107  ( .A(\uut_master/n163 ), .B(
        \uut_master/data_count [2]), .Z(\uut_master/n162 ) );
  OAI22_X1 \uut_master/U106  ( .A1(\uut_master/n46 ), .A2(\uut_master/n37 ), 
        .B1(\uut_master/n13 ), .B2(\uut_master/n161 ), .ZN(\uut_master/N218 )
         );
  XOR2_X1 \uut_master/U105  ( .A(\uut_master/n160 ), .B(
        \uut_master/data_count [1]), .Z(\uut_master/n161 ) );
  OAI22_X1 \uut_master/U104  ( .A1(\uut_master/n160 ), .A2(\uut_master/n37 ), 
        .B1(\uut_master/n14 ), .B2(\uut_master/data_count [0]), .ZN(
        \uut_master/N217 ) );
  NAND3_X1 \uut_master/U103  ( .A1(\uut_master/n158 ), .A2(
        \uut_master/data_count [2]), .A3(\uut_master/n159 ), .ZN(
        \uut_master/n170 ) );
  NOR3_X1 \uut_master/U102  ( .A1(\uut_master/n163 ), .A2(\uut_master/n173 ), 
        .A3(\uut_master/n43 ), .ZN(\uut_master/n158 ) );
  NAND2_X1 \uut_master/U101  ( .A1(\uut_master/n10 ), .A2(
        \uut_master/data_count [0]), .ZN(\uut_master/n163 ) );
  INV_X1 \uut_master/U100  ( .A(\uut_master/n119 ), .ZN(\uut_master/n214 ) );
  NOR2_X1 \uut_master/U99  ( .A1(\uut_master/n41 ), .A2(\uut_master/n24 ), 
        .ZN(\uut_master/N15 ) );
  OAI21_X1 \uut_master/U98  ( .B1(\uut_master/n155 ), .B2(\uut_master/n154 ), 
        .A(\uut_master/n210 ), .ZN(cs) );
  INV_X1 \uut_master/U97  ( .A(\uut_master/n171 ), .ZN(\uut_master/n154 ) );
  NAND2_X1 \uut_master/U96  ( .A1(\uut_master/n122 ), .A2(
        \uut_master/current_state [0]), .ZN(\uut_master/n171 ) );
  INV_X1 \uut_master/U95  ( .A(\uut_master/n211 ), .ZN(\uut_master/n155 ) );
  NAND2_X1 \uut_master/U94  ( .A1(\uut_master/n33 ), .A2(
        \uut_master/current_state [1]), .ZN(\uut_master/n211 ) );
  NOR3_X1 \uut_master/U93  ( .A1(\uut_master/n153 ), .A2(
        \uut_master/current_state [0]), .A3(\uut_master/n2 ), .ZN(
        \uut_master/N345 ) );
  NAND2_X1 \uut_master/U92  ( .A1(enable), .A2(\uut_master/n210 ), .ZN(
        \uut_master/n153 ) );
  AOI21_X1 \uut_master/U91  ( .B1(\uut_master/current_state [0]), .B2(
        \uut_master/current_state [1]), .A(\uut_master/n172 ), .ZN(
        \uut_master/n157 ) );
  INV_X1 \uut_master/U90  ( .A(\uut_master/n17 ), .ZN(\uut_master/n146 ) );
  INV_X1 \uut_master/U89  ( .A(\uut_master/n17 ), .ZN(\uut_master/n145 ) );
  INV_X1 \uut_master/U88  ( .A(\uut_master/n117 ), .ZN(\uut_master/n144 ) );
  INV_X1 \uut_master/U87  ( .A(\uut_master/n116 ), .ZN(\uut_master/n143 ) );
  INV_X1 \uut_master/U86  ( .A(\uut_master/n115 ), .ZN(\uut_master/n142 ) );
  INV_X1 \uut_master/U85  ( .A(\uut_master/n116 ), .ZN(\uut_master/n141 ) );
  INV_X1 \uut_master/U84  ( .A(\uut_master/n115 ), .ZN(\uut_master/n140 ) );
  NAND2_X1 \uut_master/U83  ( .A1(\uut_master/n211 ), .A2(\uut_master/n210 ), 
        .ZN(\uut_master/n137 ) );
  INV_X1 \uut_master/U82  ( .A(\uut_master/n22 ), .ZN(\uut_master/n132 ) );
  INV_X1 \uut_master/U81  ( .A(\uut_master/n177 ), .ZN(\uut_master/n131 ) );
  AOI21_X1 \uut_master/U80  ( .B1(\uut_master/n213 ), .B2(\uut_master/n38 ), 
        .A(\uut_master/n308 ), .ZN(\uut_master/n139 ) );
  BUF_X1 \uut_master/U79  ( .A(\uut_master/n114 ), .Z(\uut_master/n130 ) );
  INV_X1 \uut_master/U78  ( .A(\uut_master/n139 ), .ZN(\uut_master/n126 ) );
  NAND3_X1 \uut_master/U77  ( .A1(\uut_master/n33 ), .A2(
        \uut_master/current_state [1]), .A3(\uut_master/n210 ), .ZN(
        \uut_master/n308 ) );
  NAND2_X1 \uut_master/U76  ( .A1(\uut_master/n125 ), .A2(\uut_master/n33 ), 
        .ZN(\uut_master/n156 ) );
  NAND2_X1 \uut_master/U75  ( .A1(\uut_master/current_state [1]), .A2(
        \uut_master/n213 ), .ZN(\uut_master/n125 ) );
  INV_X2 \uut_master/U74  ( .A(\uut_master/n308 ), .ZN(\uut_master/n147 ) );
  NAND3_X1 \uut_master/U73  ( .A1(\uut_master/n210 ), .A2(
        \uut_master/current_state [1]), .A3(\uut_master/n33 ), .ZN(
        \uut_master/n119 ) );
  BUF_X2 \uut_master/U72  ( .A(\uut_master/n131 ), .Z(\uut_master/n135 ) );
  BUF_X2 \uut_master/U71  ( .A(\uut_master/n131 ), .Z(\uut_master/n134 ) );
  INV_X1 \uut_master/U70  ( .A(\uut_master/n139 ), .ZN(\uut_master/n114 ) );
  XNOR2_X1 \uut_master/U69  ( .A(\uut_master/n168 ), .B(\uut_master/n173 ), 
        .ZN(\uut_master/n169 ) );
  INV_X1 \uut_master/U68  ( .A(\uut_master/n133 ), .ZN(\uut_master/n113 ) );
  INV_X1 \uut_master/U67  ( .A(\uut_master/n137 ), .ZN(\uut_master/n120 ) );
  INV_X1 \uut_master/U66  ( .A(\uut_master/n137 ), .ZN(\uut_master/n47 ) );
  NAND2_X1 \uut_master/U65  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n210 ), .ZN(\uut_master/n172 ) );
  AND2_X1 \uut_master/U64  ( .A1(\uut_master/data_count [1]), .A2(
        \uut_master/data_count [0]), .ZN(\uut_master/n42 ) );
  CLKBUF_X1 \uut_master/U63  ( .A(\uut_master/n3 ), .Z(\uut_master/n41 ) );
  AND2_X1 \uut_master/U61  ( .A1(\uut_master/n39 ), .A2(\uut_master/n214 ), 
        .ZN(mosi) );
  INV_X1 \uut_master/U60  ( .A(rst), .ZN(\uut_master/n210 ) );
  BUF_X1 \uut_master/U59  ( .A(\uut_master/n249 ), .Z(\uut_master/n152 ) );
  BUF_X1 \uut_master/U58  ( .A(\uut_master/n249 ), .Z(\uut_master/n151 ) );
  BUF_X1 \uut_master/U57  ( .A(\uut_master/n249 ), .Z(\uut_master/n150 ) );
  BUF_X2 \uut_master/U56  ( .A(\uut_master/n114 ), .Z(\uut_master/n128 ) );
  BUF_X1 \uut_master/U55  ( .A(\uut_master/n132 ), .Z(\uut_master/n136 ) );
  NAND2_X1 \uut_master/U54  ( .A1(\uut_master/n21 ), .A2(\uut_master/n28 ), 
        .ZN(\uut_master/n37 ) );
  INV_X1 \uut_master/U53  ( .A(\uut_master/data_end ), .ZN(\uut_master/n34 )
         );
  AND2_X1 \uut_master/U52  ( .A1(\uut_master/n159 ), .A2(\uut_master/n26 ), 
        .ZN(\uut_master/n32 ) );
  AND3_X1 \uut_master/U51  ( .A1(\uut_master/n28 ), .A2(\uut_master/n175 ), 
        .A3(\uut_master/n214 ), .ZN(\uut_master/n116 ) );
  BUF_X2 \uut_master/U50  ( .A(\uut_master/n114 ), .Z(\uut_master/n129 ) );
  NAND2_X1 \uut_master/U49  ( .A1(\uut_master/n157 ), .A2(\uut_master/n156 ), 
        .ZN(sck) );
  NAND3_X1 \uut_master/U48  ( .A1(\uut_master/n147 ), .A2(\uut_master/n34 ), 
        .A3(\uut_master/n27 ), .ZN(\uut_master/n149 ) );
  NAND3_X1 \uut_master/U47  ( .A1(\uut_master/n147 ), .A2(\uut_master/n34 ), 
        .A3(\uut_master/n6 ), .ZN(\uut_master/n30 ) );
  NAND3_X1 \uut_master/U46  ( .A1(\uut_master/n147 ), .A2(\uut_master/n34 ), 
        .A3(\uut_master/n27 ), .ZN(\uut_master/n29 ) );
  NAND3_X1 \uut_master/U45  ( .A1(\uut_master/n147 ), .A2(\uut_master/n34 ), 
        .A3(\uut_master/n27 ), .ZN(\uut_master/n148 ) );
  NAND3_X1 \uut_master/U44  ( .A1(\uut_master/n147 ), .A2(\uut_master/n34 ), 
        .A3(\uut_master/n6 ), .ZN(\uut_master/n124 ) );
  AND2_X1 \uut_master/U43  ( .A1(\uut_master/data_count [2]), .A2(
        \uut_master/n42 ), .ZN(\uut_master/n26 ) );
  CLKBUF_X1 \uut_master/U42  ( .A(\uut_master/n5 ), .Z(\uut_master/n25 ) );
  OAI21_X1 \uut_master/U41  ( .B1(\uut_master/n155 ), .B2(\uut_master/n154 ), 
        .A(\uut_master/n210 ), .ZN(\uut_master/n24 ) );
  BUF_X2 \uut_master/U40  ( .A(\uut_master/n114 ), .Z(\uut_master/n23 ) );
  OAI222_X1 \uut_master/U39  ( .A1(\uut_master/n6 ), .A2(\uut_master/n119 ), 
        .B1(rst), .B2(\uut_master/n1 ), .C1(\uut_master/n119 ), .C2(
        \uut_master/n213 ), .ZN(\uut_master/n22 ) );
  AND3_X2 \uut_master/U38  ( .A1(\uut_master/n147 ), .A2(\uut_master/n213 ), 
        .A3(\uut_master/n6 ), .ZN(\uut_master/n112 ) );
  AND3_X2 \uut_master/U37  ( .A1(\uut_master/n147 ), .A2(\uut_master/n213 ), 
        .A3(\uut_master/n6 ), .ZN(\uut_master/n123 ) );
  CLKBUF_X1 \uut_master/U36  ( .A(\uut_master/n147 ), .Z(\uut_master/n21 ) );
  BUF_X1 \uut_master/U35  ( .A(\uut_master/n38 ), .Z(\uut_master/n27 ) );
  CLKBUF_X1 \uut_master/U34  ( .A(\uut_master/n114 ), .Z(\uut_master/n20 ) );
  INV_X2 \uut_master/U33  ( .A(\uut_master/n137 ), .ZN(\uut_master/n121 ) );
  NAND3_X1 \uut_master/U32  ( .A1(\uut_master/n147 ), .A2(\uut_master/n34 ), 
        .A3(\uut_master/n27 ), .ZN(\uut_master/n19 ) );
  NAND3_X1 \uut_master/U31  ( .A1(\uut_master/n147 ), .A2(\uut_master/n34 ), 
        .A3(\uut_master/n27 ), .ZN(\uut_master/n18 ) );
  BUF_X1 \uut_master/U30  ( .A(\uut_master/n132 ), .Z(\uut_master/n36 ) );
  BUF_X1 \uut_master/U29  ( .A(\uut_master/n22 ), .Z(\uut_master/n133 ) );
  AND3_X1 \uut_master/U28  ( .A1(\uut_master/n28 ), .A2(\uut_master/n175 ), 
        .A3(\uut_master/n214 ), .ZN(\uut_master/n115 ) );
  AND3_X1 \uut_master/U27  ( .A1(\uut_master/n214 ), .A2(\uut_master/n175 ), 
        .A3(\uut_master/n28 ), .ZN(\uut_master/n17 ) );
  BUF_X1 \uut_master/U26  ( .A(\uut_master/n132 ), .Z(\uut_master/n16 ) );
  AND3_X1 \uut_master/U25  ( .A1(\uut_master/n4 ), .A2(\uut_master/n170 ), 
        .A3(\uut_master/n147 ), .ZN(\uut_master/n15 ) );
  INV_X1 \uut_master/U24  ( .A(\uut_master/n15 ), .ZN(\uut_master/n14 ) );
  INV_X1 \uut_master/U23  ( .A(\uut_master/n15 ), .ZN(\uut_master/n13 ) );
  OR3_X1 \uut_master/U22  ( .A1(\uut_master/n12 ), .A2(\uut_master/n218 ), 
        .A3(\uut_master/n11 ), .ZN(\uut_master/n224 ) );
  NAND2_X1 \uut_master/U21  ( .A1(\uut_master/n211 ), .A2(\uut_master/n210 ), 
        .ZN(\uut_master/n138 ) );
  BUF_X2 \uut_master/U20  ( .A(\uut_master/n138 ), .Z(\uut_master/n11 ) );
  INV_X1 \uut_master/U19  ( .A(\uut_master/n46 ), .ZN(\uut_master/n10 ) );
  AND3_X1 \uut_master/U18  ( .A1(\uut_master/n214 ), .A2(\uut_master/n175 ), 
        .A3(\uut_master/n28 ), .ZN(\uut_master/n117 ) );
  INV_X1 \uut_master/U17  ( .A(\uut_master/n138 ), .ZN(\uut_master/n9 ) );
  AND2_X1 \uut_master/U16  ( .A1(\uut_master/n307 ), .A2(\uut_master/n306 ), 
        .ZN(\uut_master/n8 ) );
  INV_X1 \uut_master/U15  ( .A(data_in[6]), .ZN(\uut_master/n12 ) );
  AND2_X1 \uut_master/U14  ( .A1(\uut_master/n157 ), .A2(\uut_master/n156 ), 
        .ZN(\uut_master/n28 ) );
  INV_X1 \uut_master/U13  ( .A(\uut_master/n133 ), .ZN(\uut_master/n7 ) );
  BUF_X2 \uut_master/U12  ( .A(\uut_master/n126 ), .Z(\uut_master/n118 ) );
  BUF_X2 \uut_master/U11  ( .A(\uut_master/n126 ), .Z(\uut_master/n127 ) );
  NOR2_X1 \uut_master/U10  ( .A1(\uut_master/n35 ), .A2(rst), .ZN(
        \uut_master/n38 ) );
  NOR2_X2 \uut_master/U9  ( .A1(\uut_master/n35 ), .A2(rst), .ZN(
        \uut_master/n6 ) );
  INV_X2 \uut_master/U8  ( .A(\uut_master/n138 ), .ZN(\uut_master/n297 ) );
  INV_X1 \uut_master/U7  ( .A(\uut_master/n214 ), .ZN(\uut_master/n5 ) );
  CLKBUF_X1 \uut_master/U6  ( .A(sck), .Z(\uut_master/n4 ) );
  INV_X1 \uut_master/U5  ( .A(\uut_master/n35 ), .ZN(\uut_master/n3 ) );
  INV_X1 \uut_master/U4  ( .A(\uut_master/n122 ), .ZN(\uut_master/n2 ) );
  NOR3_X1 \uut_master/U3  ( .A1(\uut_master/current_state [0]), .A2(
        \uut_master/n122 ), .A3(\uut_master/n173 ), .ZN(\uut_master/n1 ) );
  DFF_X2 \uut_master/data_in_reg[9]  ( .D(\uut_master/n318 ), .CK(clk), .Q(
        data_out[9]), .QN(\uut_master/n187 ) );
  DFF_X2 \uut_master/data_in_reg[11]  ( .D(\uut_master/n320 ), .CK(clk), .Q(
        data_out[11]), .QN(\uut_master/n189 ) );
  DFF_X2 \uut_master/data_in_reg[15]  ( .D(\uut_master/n324 ), .CK(clk), .Q(
        data_out[15]), .QN(\uut_master/n193 ) );
  DFF_X2 \uut_master/data_in_reg[20]  ( .D(\uut_master/n329 ), .CK(clk), .Q(
        data_out[20]), .QN(\uut_master/n198 ) );
  DFF_X2 \uut_master/data_in_reg[31]  ( .D(\uut_master/n340 ), .CK(clk), .Q(
        data_out[31]), .QN(\uut_master/n208 ) );
  DFF_X2 \uut_master/data_save_reg[8]  ( .D(\uut_master/N161 ), .CK(clk), .QN(
        \uut_master/n103 ) );
  DFF_X2 \uut_master/data_save_reg[23]  ( .D(\uut_master/N176 ), .CK(clk), 
        .QN(\uut_master/n88 ) );
  DFF_X2 \uut_master/data_save_reg[27]  ( .D(\uut_master/N180 ), .CK(clk), 
        .QN(\uut_master/n84 ) );
  DFF_X2 \uut_master/data_save_reg[31]  ( .D(\uut_master/N184 ), .CK(clk), 
        .QN(\uut_master/n80 ) );
  DFF_X2 \uut_master/data_save_reg[21]  ( .D(\uut_master/N174 ), .CK(clk), 
        .QN(\uut_master/n90 ) );
  DFF_X2 \uut_master/data_save_reg[10]  ( .D(\uut_master/N163 ), .CK(clk), 
        .QN(\uut_master/n101 ) );
  DFF_X2 \uut_master/data_save_reg[25]  ( .D(\uut_master/N178 ), .CK(clk), 
        .QN(\uut_master/n86 ) );
  DFF_X2 \uut_master/data_save_reg[2]  ( .D(\uut_master/N155 ), .CK(clk), .QN(
        \uut_master/n109 ) );
  DFF_X2 \uut_master/data_save_reg[28]  ( .D(\uut_master/N181 ), .CK(clk), 
        .QN(\uut_master/n83 ) );
  DFF_X2 \uut_master/data_save_reg[26]  ( .D(\uut_master/N179 ), .CK(clk), 
        .QN(\uut_master/n85 ) );
  DFF_X2 \uut_master/data_save_reg[13]  ( .D(\uut_master/N166 ), .CK(clk), 
        .QN(\uut_master/n98 ) );
  DFF_X2 \uut_master/data_save_reg[18]  ( .D(\uut_master/N171 ), .CK(clk), 
        .QN(\uut_master/n93 ) );
  DFF_X2 \uut_master/data_save_reg[56]  ( .D(\uut_master/N209 ), .CK(clk), 
        .QN(\uut_master/n55 ) );
  DFF_X2 \uut_master/data_save_reg[60]  ( .D(\uut_master/N213 ), .CK(clk), 
        .QN(\uut_master/n51 ) );
  DFF_X2 \uut_master/data_save_reg[62]  ( .D(\uut_master/N215 ), .CK(clk), 
        .QN(\uut_master/n49 ) );
  DFF_X2 \uut_master/data_save_reg[61]  ( .D(\uut_master/N214 ), .CK(clk), 
        .QN(\uut_master/n50 ) );
  DFF_X2 \uut_master/data_save_reg[58]  ( .D(\uut_master/N211 ), .CK(clk), 
        .QN(\uut_master/n53 ) );
  DFF_X2 \uut_master/data_save_reg[57]  ( .D(\uut_master/N210 ), .CK(clk), 
        .QN(\uut_master/n54 ) );
  DFF_X2 \uut_master/data_save_reg[63]  ( .D(\uut_master/N216 ), .CK(clk), .Q(
        \uut_master/n39 ), .QN(\uut_master/n48 ) );
  DFF_X2 \uut_master/data_in_reg[29]  ( .D(\uut_master/n338 ), .CK(clk), .Q(
        data_out[29]), .QN(\uut_master/n207 ) );
  DFF_X2 \uut_master/data_save_reg[16]  ( .D(\uut_master/N169 ), .CK(clk), 
        .QN(\uut_master/n95 ) );
  DFF_X2 \uut_master/data_save_reg[14]  ( .D(\uut_master/N167 ), .CK(clk), 
        .QN(\uut_master/n97 ) );
  DFF_X2 \uut_master/data_save_reg[12]  ( .D(\uut_master/N165 ), .CK(clk), 
        .QN(\uut_master/n99 ) );
  DFF_X2 \uut_master/data_save_reg[24]  ( .D(\uut_master/N177 ), .CK(clk), 
        .QN(\uut_master/n87 ) );
  DFF_X2 \uut_master/data_save_reg[11]  ( .D(\uut_master/N164 ), .CK(clk), 
        .QN(\uut_master/n100 ) );
  DFF_X2 \uut_master/data_save_reg[20]  ( .D(\uut_master/N173 ), .CK(clk), 
        .QN(\uut_master/n91 ) );
  DFF_X2 \uut_master/data_save_reg[29]  ( .D(\uut_master/N182 ), .CK(clk), 
        .QN(\uut_master/n82 ) );
  DFF_X2 \uut_master/data_in_reg[4]  ( .D(\uut_master/n313 ), .CK(clk), .Q(
        data_out[4]), .QN(\uut_master/n182 ) );
  DFF_X2 \uut_master/data_in_reg[6]  ( .D(\uut_master/n315 ), .CK(clk), .Q(
        data_out[6]), .QN(\uut_master/n184 ) );
  DFF_X2 \uut_master/data_in_reg[26]  ( .D(\uut_master/n335 ), .CK(clk), .Q(
        data_out[26]), .QN(\uut_master/n204 ) );
  DFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/N345 ), .CK(clk), 
        .Q(\uut_master/current_state [0]), .QN(\uut_master/n33 ) );
  DFF_X1 \uut_master/data_save_reg[19]  ( .D(\uut_master/N172 ), .CK(clk), 
        .QN(\uut_master/n92 ) );
  DFF_X1 \uut_master/data_save_reg[22]  ( .D(\uut_master/N175 ), .CK(clk), 
        .QN(\uut_master/n89 ) );
  DFF_X1 \uut_master/data_save_reg[5]  ( .D(\uut_master/N158 ), .CK(clk), .QN(
        \uut_master/n106 ) );
  DFF_X1 \uut_master/data_save_reg[15]  ( .D(\uut_master/N168 ), .CK(clk), 
        .QN(\uut_master/n96 ) );
  DFF_X1 \uut_master/data_save_reg[4]  ( .D(\uut_master/N157 ), .CK(clk), .QN(
        \uut_master/n107 ) );
  DFF_X1 \uut_master/data_save_reg[30]  ( .D(\uut_master/N183 ), .CK(clk), 
        .QN(\uut_master/n81 ) );
  DFF_X1 \uut_master/data_save_reg[6]  ( .D(\uut_master/N159 ), .CK(clk), .QN(
        \uut_master/n105 ) );
  DFF_X1 \uut_master/data_save_reg[9]  ( .D(\uut_master/N162 ), .CK(clk), .QN(
        \uut_master/n102 ) );
  DFF_X1 \uut_master/data_save_reg[1]  ( .D(\uut_master/N154 ), .CK(clk), .QN(
        \uut_master/n110 ) );
  DFF_X1 \uut_master/data_save_reg[3]  ( .D(\uut_master/N156 ), .CK(clk), .QN(
        \uut_master/n108 ) );
  DFF_X1 \uut_master/data_save_reg[7]  ( .D(\uut_master/N160 ), .CK(clk), .QN(
        \uut_master/n104 ) );
  DFF_X1 \uut_master/data_save_reg[17]  ( .D(\uut_master/N170 ), .CK(clk), 
        .QN(\uut_master/n94 ) );
  DFF_X1 \uut_master/data_save_reg[59]  ( .D(\uut_master/N212 ), .CK(clk), 
        .QN(\uut_master/n52 ) );
  DFF_X1 \uut_master/data_count_reg[1]  ( .D(\uut_master/N218 ), .CK(clk), .Q(
        \uut_master/data_count [1]), .QN(\uut_master/n46 ) );
  DFF_X1 \uut_master/data_save_reg[34]  ( .D(\uut_master/N187 ), .CK(clk), .Q(
        \uut_master/n255 ), .QN(\uut_master/n77 ) );
  DFF_X1 \uut_master/data_save_reg[32]  ( .D(\uut_master/N185 ), .CK(clk), .Q(
        \uut_master/n251 ), .QN(\uut_master/n79 ) );
  DFF_X1 \uut_master/data_save_reg[36]  ( .D(\uut_master/N189 ), .CK(clk), .Q(
        \uut_master/n259 ), .QN(\uut_master/n75 ) );
  DFF_X1 \uut_master/data_save_reg[45]  ( .D(\uut_master/N198 ), .CK(clk), .Q(
        \uut_master/n277 ), .QN(\uut_master/n66 ) );
  DFF_X1 \uut_master/data_save_reg[54]  ( .D(\uut_master/N207 ), .CK(clk), .Q(
        \uut_master/n295 ), .QN(\uut_master/n57 ) );
  DFF_X1 \uut_master/data_save_reg[35]  ( .D(\uut_master/N188 ), .CK(clk), .Q(
        \uut_master/n257 ), .QN(\uut_master/n76 ) );
  DFF_X1 \uut_master/data_save_reg[39]  ( .D(\uut_master/N192 ), .CK(clk), .Q(
        \uut_master/n265 ), .QN(\uut_master/n72 ) );
  DFF_X1 \uut_master/data_save_reg[37]  ( .D(\uut_master/N190 ), .CK(clk), .Q(
        \uut_master/n261 ), .QN(\uut_master/n74 ) );
  DFF_X1 \uut_master/data_save_reg[47]  ( .D(\uut_master/N200 ), .CK(clk), .Q(
        \uut_master/n281 ), .QN(\uut_master/n64 ) );
  DFF_X1 \uut_master/data_save_reg[51]  ( .D(\uut_master/N204 ), .CK(clk), .Q(
        \uut_master/n289 ), .QN(\uut_master/n60 ) );
  DFF_X1 \uut_master/data_save_reg[33]  ( .D(\uut_master/N186 ), .CK(clk), .Q(
        \uut_master/n253 ), .QN(\uut_master/n78 ) );
  DFF_X1 \uut_master/data_save_reg[38]  ( .D(\uut_master/N191 ), .CK(clk), .Q(
        \uut_master/n263 ), .QN(\uut_master/n73 ) );
  DFF_X1 \uut_master/data_save_reg[40]  ( .D(\uut_master/N193 ), .CK(clk), .Q(
        \uut_master/n267 ), .QN(\uut_master/n71 ) );
  DFF_X1 \uut_master/data_save_reg[41]  ( .D(\uut_master/N194 ), .CK(clk), .Q(
        \uut_master/n269 ), .QN(\uut_master/n70 ) );
  DFF_X1 \uut_master/data_save_reg[42]  ( .D(\uut_master/N195 ), .CK(clk), .Q(
        \uut_master/n271 ), .QN(\uut_master/n69 ) );
  DFF_X1 \uut_master/data_save_reg[43]  ( .D(\uut_master/N196 ), .CK(clk), .Q(
        \uut_master/n273 ), .QN(\uut_master/n68 ) );
  DFF_X1 \uut_master/data_save_reg[44]  ( .D(\uut_master/N197 ), .CK(clk), .Q(
        \uut_master/n275 ), .QN(\uut_master/n67 ) );
  DFF_X1 \uut_master/data_save_reg[46]  ( .D(\uut_master/N199 ), .CK(clk), .Q(
        \uut_master/n279 ), .QN(\uut_master/n65 ) );
  DFF_X1 \uut_master/data_save_reg[48]  ( .D(\uut_master/N201 ), .CK(clk), .Q(
        \uut_master/n283 ), .QN(\uut_master/n63 ) );
  DFF_X1 \uut_master/data_save_reg[49]  ( .D(\uut_master/N202 ), .CK(clk), .Q(
        \uut_master/n285 ), .QN(\uut_master/n62 ) );
  DFF_X1 \uut_master/data_save_reg[50]  ( .D(\uut_master/N203 ), .CK(clk), .Q(
        \uut_master/n287 ), .QN(\uut_master/n61 ) );
  DFF_X1 \uut_master/data_save_reg[52]  ( .D(\uut_master/N205 ), .CK(clk), .Q(
        \uut_master/n291 ), .QN(\uut_master/n59 ) );
  DFF_X1 \uut_master/data_save_reg[53]  ( .D(\uut_master/N206 ), .CK(clk), .Q(
        \uut_master/n293 ), .QN(\uut_master/n58 ) );
  DFF_X1 \uut_master/data_save_reg[55]  ( .D(\uut_master/N208 ), .CK(clk), .Q(
        \uut_master/n298 ), .QN(\uut_master/n56 ) );
  DFF_X1 \uut_master/data_count_reg[2]  ( .D(\uut_master/N219 ), .CK(clk), .Q(
        \uut_master/data_count [2]), .QN(\uut_master/n45 ) );
  DFF_X1 \uut_master/data_count_reg[4]  ( .D(\uut_master/N221 ), .CK(clk), .Q(
        \uut_master/data_count [4]), .QN(\uut_master/n43 ) );
  DFF_X1 \uut_master/data_in_reg[25]  ( .D(\uut_master/n334 ), .CK(clk), .Q(
        data_out[25]), .QN(\uut_master/n203 ) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n325 ), .CK(clk), .Q(
        data_out[16]), .QN(\uut_master/n194 ) );
  DFF_X1 \uut_master/data_in_reg[30]  ( .D(\uut_master/n339 ), .CK(clk), .Q(
        data_out[30]), .QN(\uut_master/n209 ) );
  DFF_X1 \uut_master/data_in_reg[10]  ( .D(\uut_master/n319 ), .CK(clk), .Q(
        data_out[10]), .QN(\uut_master/n188 ) );
  DFF_X1 \uut_master/data_in_reg[0]  ( .D(\uut_master/n309 ), .CK(clk), .Q(
        data_out[0]), .QN(\uut_master/n178 ) );
  DFF_X1 \uut_master/data_in_reg[13]  ( .D(\uut_master/n322 ), .CK(clk), .Q(
        data_out[13]), .QN(\uut_master/n191 ) );
  DFF_X1 \uut_master/data_in_reg[22]  ( .D(\uut_master/n331 ), .CK(clk), .Q(
        data_out[22]), .QN(\uut_master/n200 ) );
  DFF_X1 \uut_master/data_in_reg[28]  ( .D(\uut_master/n337 ), .CK(clk), .Q(
        data_out[28]), .QN(\uut_master/n206 ) );
  DFF_X1 \uut_master/data_count_reg[3]  ( .D(\uut_master/N220 ), .CK(clk), .Q(
        \uut_master/n159 ), .QN(\uut_master/n44 ) );
  DFF_X1 \uut_master/data_count_reg[0]  ( .D(\uut_master/N217 ), .CK(clk), .Q(
        \uut_master/data_count [0]), .QN(\uut_master/n160 ) );
  DFF_X1 \uut_master/data_count_reg[5]  ( .D(\uut_master/N222 ), .CK(clk), .Q(
        \uut_master/n175 ), .QN(\uut_master/n173 ) );
  DFF_X2 \uut_master/data_in_reg[8]  ( .D(\uut_master/n317 ), .CK(clk), .Q(
        data_out[8]), .QN(\uut_master/n186 ) );
  DFF_X2 \uut_master/data_in_reg[18]  ( .D(\uut_master/n327 ), .CK(clk), .Q(
        data_out[18]), .QN(\uut_master/n196 ) );
  DFF_X2 \uut_master/data_in_reg[19]  ( .D(\uut_master/n328 ), .CK(clk), .Q(
        data_out[19]), .QN(\uut_master/n197 ) );
  DFF_X2 \uut_master/data_in_reg[1]  ( .D(\uut_master/n310 ), .CK(clk), .Q(
        data_out[1]), .QN(\uut_master/n179 ) );
  DFF_X2 \uut_master/data_in_reg[7]  ( .D(\uut_master/n316 ), .CK(clk), .Q(
        data_out[7]), .QN(\uut_master/n185 ) );
  DFF_X2 \uut_master/data_in_reg[27]  ( .D(\uut_master/n336 ), .CK(clk), .Q(
        data_out[27]), .QN(\uut_master/n205 ) );
  DFF_X2 \uut_master/data_in_reg[5]  ( .D(\uut_master/n314 ), .CK(clk), .Q(
        data_out[5]), .QN(\uut_master/n183 ) );
  DFF_X2 \uut_master/data_in_reg[24]  ( .D(\uut_master/n333 ), .CK(clk), .Q(
        data_out[24]), .QN(\uut_master/n202 ) );
  DFF_X2 \uut_master/data_in_reg[14]  ( .D(\uut_master/n323 ), .CK(clk), .Q(
        data_out[14]), .QN(\uut_master/n192 ) );
  DFF_X2 \uut_master/data_in_reg[23]  ( .D(\uut_master/n332 ), .CK(clk), .Q(
        data_out[23]), .QN(\uut_master/n201 ) );
  DFF_X2 \uut_master/data_in_reg[3]  ( .D(\uut_master/n312 ), .CK(clk), .Q(
        data_out[3]), .QN(\uut_master/n181 ) );
  DFF_X2 \uut_master/data_in_reg[12]  ( .D(\uut_master/n321 ), .CK(clk), .Q(
        data_out[12]), .QN(\uut_master/n190 ) );
  DFF_X2 \uut_master/data_in_reg[21]  ( .D(\uut_master/n330 ), .CK(clk), .Q(
        data_out[21]), .QN(\uut_master/n199 ) );
  DFF_X2 \uut_master/data_in_reg[2]  ( .D(\uut_master/n311 ), .CK(clk), .Q(
        data_out[2]), .QN(\uut_master/n180 ) );
  DFF_X2 \uut_master/data_in_reg[17]  ( .D(\uut_master/n326 ), .CK(clk), .Q(
        data_out[17]), .QN(\uut_master/n195 ) );
  DFF_X1 \uut_master/data_end_reg  ( .D(\uut_master/N223 ), .CK(clk), .Q(
        \uut_master/data_end ), .QN(\uut_master/n213 ) );
  DFF_X1 \uut_master/data_save_reg[0]  ( .D(\uut_master/N153 ), .CK(clk), .QN(
        \uut_master/n111 ) );
  SDFF_X1 \uut_master/current_state_reg[1]  ( .D(\uut_master/N346 ), .SI(1'b0), 
        .SE(1'b0), .CK(clk), .Q(\uut_master/current_state [1]), .QN(
        \uut_master/n122 ) );
  DFF_X1 \uut_master/clock_count_reg  ( .D(\uut_master/N15 ), .CK(clk), .Q(
        \uut_master/clock_count ), .QN(\uut_master/n35 ) );
  OAI21_X1 \uut_slave/U172  ( .B1(\uut_slave/n92 ), .B2(\uut_slave/n93 ), .A(
        \uut_slave/n96 ), .ZN(\uut_slave/n246 ) );
  OAI22_X1 \uut_slave/U171  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n18 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n188 ) );
  OAI22_X1 \uut_slave/U170  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n19 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n189 ) );
  OAI22_X1 \uut_slave/U169  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n20 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n190 ) );
  OAI22_X1 \uut_slave/U168  ( .A1(\uut_slave/n22 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n21 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n191 ) );
  OAI22_X1 \uut_slave/U167  ( .A1(\uut_slave/n23 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n22 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n192 ) );
  OAI22_X1 \uut_slave/U166  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n23 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n193 ) );
  OAI22_X1 \uut_slave/U165  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n24 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n194 ) );
  OAI22_X1 \uut_slave/U164  ( .A1(\uut_slave/n249 ), .A2(\uut_slave/n244 ), 
        .B1(\uut_slave/n25 ), .B2(\uut_slave/n90 ), .ZN(\uut_slave/n195 ) );
  NAND2_X1 \uut_slave/U163  ( .A1(\uut_slave/n90 ), .A2(\uut_slave/n247 ), 
        .ZN(\uut_slave/n244 ) );
  NAND2_X1 \uut_slave/U162  ( .A1(\uut_slave/n242 ), .A2(\uut_slave/n247 ), 
        .ZN(\uut_slave/n245 ) );
  OAI21_X1 \uut_slave/U161  ( .B1(\uut_slave/data_count [5]), .B2(
        \uut_slave/n93 ), .A(\uut_slave/n96 ), .ZN(\uut_slave/n243 ) );
  INV_X1 \uut_slave/U160  ( .A(mosi), .ZN(\uut_slave/n249 ) );
  OAI222_X1 \uut_slave/U159  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n59 ), .B2(\uut_slave/n114 ), .C1(\uut_slave/n58 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n124 ) );
  OAI222_X1 \uut_slave/U158  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n60 ), .B2(\uut_slave/n114 ), .C1(\uut_slave/n59 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n125 ) );
  OAI222_X1 \uut_slave/U157  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n61 ), .B2(\uut_slave/n114 ), .C1(\uut_slave/n60 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n126 ) );
  OAI222_X1 \uut_slave/U156  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n62 ), .B2(\uut_slave/n114 ), .C1(\uut_slave/n61 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n127 ) );
  OAI222_X1 \uut_slave/U155  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n63 ), .B2(\uut_slave/n114 ), .C1(\uut_slave/n62 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n128 ) );
  OAI222_X1 \uut_slave/U154  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n64 ), .B2(\uut_slave/n114 ), .C1(\uut_slave/n63 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n129 ) );
  OAI222_X1 \uut_slave/U153  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n65 ), .B2(\uut_slave/n114 ), .C1(\uut_slave/n64 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n130 ) );
  OAI222_X1 \uut_slave/U152  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n66 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n65 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n131 ) );
  OAI222_X1 \uut_slave/U151  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n67 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n66 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n132 ) );
  OAI222_X1 \uut_slave/U150  ( .A1(\uut_slave/n35 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n68 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n67 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n133 ) );
  OAI222_X1 \uut_slave/U149  ( .A1(\uut_slave/n36 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n69 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n68 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n134 ) );
  OAI222_X1 \uut_slave/U148  ( .A1(\uut_slave/n37 ), .A2(\uut_slave/n116 ), 
        .B1(\uut_slave/n70 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n69 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n135 ) );
  OAI222_X1 \uut_slave/U147  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n71 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n70 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n136 ) );
  OAI222_X1 \uut_slave/U146  ( .A1(\uut_slave/n39 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n72 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n71 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n137 ) );
  OAI222_X1 \uut_slave/U145  ( .A1(\uut_slave/n40 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n73 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n72 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n138 ) );
  OAI222_X1 \uut_slave/U144  ( .A1(\uut_slave/n41 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n74 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n73 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n139 ) );
  OAI222_X1 \uut_slave/U143  ( .A1(\uut_slave/n42 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n75 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n74 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n140 ) );
  OAI222_X1 \uut_slave/U142  ( .A1(\uut_slave/n43 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n76 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n75 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n141 ) );
  OAI222_X1 \uut_slave/U141  ( .A1(\uut_slave/n44 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n77 ), .B2(\uut_slave/n113 ), .C1(\uut_slave/n76 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n142 ) );
  OAI222_X1 \uut_slave/U140  ( .A1(\uut_slave/n45 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n78 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n77 ), 
        .C2(\uut_slave/n109 ), .ZN(\uut_slave/n143 ) );
  OAI222_X1 \uut_slave/U139  ( .A1(\uut_slave/n46 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n79 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n78 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n144 ) );
  OAI222_X1 \uut_slave/U138  ( .A1(\uut_slave/n47 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n80 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n79 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n145 ) );
  OAI222_X1 \uut_slave/U137  ( .A1(\uut_slave/n48 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n81 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n80 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n146 ) );
  OAI222_X1 \uut_slave/U136  ( .A1(\uut_slave/n49 ), .A2(\uut_slave/n117 ), 
        .B1(\uut_slave/n82 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n81 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n147 ) );
  OAI222_X1 \uut_slave/U135  ( .A1(\uut_slave/n50 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n83 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n82 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n148 ) );
  OAI222_X1 \uut_slave/U134  ( .A1(\uut_slave/n51 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n84 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n83 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n149 ) );
  OAI222_X1 \uut_slave/U133  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n85 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n84 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n150 ) );
  OAI222_X1 \uut_slave/U132  ( .A1(\uut_slave/n53 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n86 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n85 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n151 ) );
  OAI222_X1 \uut_slave/U131  ( .A1(\uut_slave/n54 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n87 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n86 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n152 ) );
  OAI222_X1 \uut_slave/U130  ( .A1(\uut_slave/n55 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n88 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n87 ), 
        .C2(\uut_slave/n110 ), .ZN(\uut_slave/n153 ) );
  OAI222_X1 \uut_slave/U129  ( .A1(\uut_slave/n56 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n89 ), .B2(\uut_slave/n112 ), .C1(\uut_slave/n88 ), 
        .C2(\uut_slave/n108 ), .ZN(\uut_slave/n154 ) );
  NAND3_X1 \uut_slave/U128  ( .A1(\uut_slave/n237 ), .A2(\uut_slave/n247 ), 
        .A3(\uut_slave/n108 ), .ZN(\uut_slave/n239 ) );
  OAI22_X1 \uut_slave/U127  ( .A1(\uut_slave/n57 ), .A2(\uut_slave/n118 ), 
        .B1(\uut_slave/n89 ), .B2(\uut_slave/n108 ), .ZN(\uut_slave/n155 ) );
  NAND3_X1 \uut_slave/U126  ( .A1(\uut_slave/n236 ), .A2(\uut_slave/n247 ), 
        .A3(\uut_slave/n108 ), .ZN(\uut_slave/n240 ) );
  OAI21_X1 \uut_slave/U125  ( .B1(\uut_slave/n235 ), .B2(\uut_slave/n242 ), 
        .A(\uut_slave/n247 ), .ZN(\uut_slave/n238 ) );
  AOI21_X1 \uut_slave/U124  ( .B1(\uut_slave/data_count [5]), .B2(
        \uut_slave/n234 ), .A(\uut_slave/n236 ), .ZN(\uut_slave/n235 ) );
  NAND3_X1 \uut_slave/U123  ( .A1(\uut_slave/n233 ), .A2(\uut_slave/n232 ), 
        .A3(\uut_slave/n231 ), .ZN(\uut_slave/n234 ) );
  NOR3_X1 \uut_slave/U122  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/data_count [2]), .A3(\uut_slave/n7 ), .ZN(\uut_slave/n231 )
         );
  INV_X1 \uut_slave/U121  ( .A(\uut_slave/n237 ), .ZN(\uut_slave/n236 ) );
  OAI21_X1 \uut_slave/U120  ( .B1(\uut_slave/data_count [2]), .B2(
        \uut_slave/data_count [1]), .A(\uut_slave/n92 ), .ZN(\uut_slave/n237 )
         );
  NAND2_X1 \uut_slave/U119  ( .A1(\uut_slave/n232 ), .A2(\uut_slave/n233 ), 
        .ZN(\uut_slave/n241 ) );
  OAI21_X1 \uut_slave/U118  ( .B1(\uut_slave/n230 ), .B2(\uut_slave/n17 ), .A(
        \uut_slave/n228 ), .ZN(\uut_slave/n201 ) );
  NAND3_X1 \uut_slave/U117  ( .A1(\uut_slave/n17 ), .A2(\uut_slave/n107 ), 
        .A3(\uut_slave/n227 ), .ZN(\uut_slave/n228 ) );
  NOR2_X1 \uut_slave/U116  ( .A1(\uut_slave/n97 ), .A2(\uut_slave/n215 ), .ZN(
        \uut_slave/n226 ) );
  INV_X1 \uut_slave/U115  ( .A(\uut_slave/n225 ), .ZN(\uut_slave/n248 ) );
  AOI21_X1 \uut_slave/U114  ( .B1(\uut_slave/data_end ), .B2(\uut_slave/n96 ), 
        .A(\uut_slave/n2 ), .ZN(\uut_slave/n225 ) );
  NAND3_X1 \uut_slave/U113  ( .A1(\uut_slave/n224 ), .A2(\uut_slave/n223 ), 
        .A3(\uut_slave/n222 ), .ZN(\uut_slave/N142 ) );
  NAND3_X1 \uut_slave/U112  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n247 ), 
        .A3(\uut_slave/n91 ), .ZN(\uut_slave/n222 ) );
  NAND4_X1 \uut_slave/U111  ( .A1(\uut_slave/n221 ), .A2(
        \uut_slave/current_state [1]), .A3(\uut_slave/n247 ), .A4(
        \uut_slave/current_state [0]), .ZN(\uut_slave/n224 ) );
  INV_X1 \uut_slave/U110  ( .A(cs), .ZN(\uut_slave/n221 ) );
  NOR2_X1 \uut_slave/U109  ( .A1(\uut_slave/n11 ), .A2(\uut_slave/n242 ), .ZN(
        \uut_slave/data_end_next ) );
  OAI21_X1 \uut_slave/U108  ( .B1(\uut_slave/n232 ), .B2(\uut_slave/n15 ), .A(
        \uut_slave/n219 ), .ZN(\uut_slave/n196 ) );
  NAND3_X1 \uut_slave/U107  ( .A1(\uut_slave/n229 ), .A2(\uut_slave/n106 ), 
        .A3(\uut_slave/n218 ), .ZN(\uut_slave/n219 ) );
  XOR2_X1 \uut_slave/U106  ( .A(\uut_slave/data_count [4]), .B(\uut_slave/n98 ), .Z(\uut_slave/n218 ) );
  OAI21_X1 \uut_slave/U105  ( .B1(\uut_slave/n233 ), .B2(\uut_slave/n17 ), .A(
        \uut_slave/n217 ), .ZN(\uut_slave/n197 ) );
  NAND3_X1 \uut_slave/U104  ( .A1(\uut_slave/n229 ), .A2(\uut_slave/n107 ), 
        .A3(\uut_slave/n216 ), .ZN(\uut_slave/n217 ) );
  OAI21_X1 \uut_slave/U103  ( .B1(\uut_slave/n14 ), .B2(\uut_slave/n15 ), .A(
        \uut_slave/n213 ), .ZN(\uut_slave/n198 ) );
  NAND3_X1 \uut_slave/U102  ( .A1(\uut_slave/n229 ), .A2(\uut_slave/n106 ), 
        .A3(\uut_slave/n212 ), .ZN(\uut_slave/n213 ) );
  XOR2_X1 \uut_slave/U101  ( .A(\uut_slave/data_count [2]), .B(
        \uut_slave/n214 ), .Z(\uut_slave/n212 ) );
  INV_X1 \uut_slave/U100  ( .A(\uut_slave/n211 ), .ZN(\uut_slave/n214 ) );
  OAI21_X1 \uut_slave/U99  ( .B1(\uut_slave/n99 ), .B2(\uut_slave/n15 ), .A(
        \uut_slave/n210 ), .ZN(\uut_slave/n199 ) );
  NAND3_X1 \uut_slave/U98  ( .A1(\uut_slave/n229 ), .A2(\uut_slave/n107 ), 
        .A3(\uut_slave/n209 ), .ZN(\uut_slave/n210 ) );
  XOR2_X1 \uut_slave/U97  ( .A(\uut_slave/data_count [1]), .B(
        \uut_slave/data_count [0]), .Z(\uut_slave/n209 ) );
  OAI21_X1 \uut_slave/U96  ( .B1(\uut_slave/n16 ), .B2(\uut_slave/n17 ), .A(
        \uut_slave/n208 ), .ZN(\uut_slave/n200 ) );
  NAND3_X1 \uut_slave/U95  ( .A1(\uut_slave/n15 ), .A2(\uut_slave/n106 ), .A3(
        \uut_slave/n16 ), .ZN(\uut_slave/n208 ) );
  NOR3_X1 \uut_slave/U94  ( .A1(\uut_slave/n232 ), .A2(\uut_slave/n230 ), .A3(
        \uut_slave/n211 ), .ZN(\uut_slave/n207 ) );
  NAND2_X1 \uut_slave/U93  ( .A1(\uut_slave/n13 ), .A2(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n211 ) );
  NAND2_X1 \uut_slave/U92  ( .A1(\uut_slave/n100 ), .A2(\uut_slave/n247 ), 
        .ZN(\uut_slave/n223 ) );
  NAND2_X1 \uut_slave/U91  ( .A1(\uut_slave/current_state [1]), .A2(
        \uut_slave/n91 ), .ZN(\uut_slave/n242 ) );
  INV_X1 \uut_slave/U90  ( .A(sck), .ZN(\uut_slave/n206 ) );
  CLKBUF_X1 \uut_slave/U89  ( .A(\uut_slave/n206 ), .Z(\uut_slave/n205 ) );
  AND2_X1 \uut_slave/U88  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n107 ) );
  AND2_X1 \uut_slave/U87  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n106 ) );
  AND2_X1 \uut_slave/U86  ( .A1(\uut_slave/n3 ), .A2(\uut_slave/n6 ), .ZN(
        \uut_slave/n101 ) );
  XNOR2_X1 \uut_slave/U85  ( .A(\uut_slave/n226 ), .B(\uut_slave/n230 ), .ZN(
        \uut_slave/n227 ) );
  AND2_X1 \uut_slave/U84  ( .A1(\uut_slave/n9 ), .A2(\uut_slave/n91 ), .ZN(
        \uut_slave/n100 ) );
  NOR2_X1 \uut_slave/U83  ( .A1(\uut_slave/n211 ), .A2(\uut_slave/n12 ), .ZN(
        \uut_slave/n98 ) );
  OR2_X1 \uut_slave/U82  ( .A1(\uut_slave/n233 ), .A2(\uut_slave/n232 ), .ZN(
        \uut_slave/n97 ) );
  BUF_X2 \uut_slave/U81  ( .A(\uut_slave/n10 ), .Z(\uut_slave/n96 ) );
  OR2_X1 \uut_slave/U80  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n20 ), .ZN(
        \uut_slave/n94 ) );
  NOR2_X1 \uut_slave/U79  ( .A1(\uut_slave/n94 ), .A2(\uut_slave/n25 ), .ZN(
        \uut_slave/n102 ) );
  AND2_X1 \uut_slave/U78  ( .A1(\uut_slave/n230 ), .A2(\uut_slave/n241 ), .ZN(
        \uut_slave/n93 ) );
  NOR2_X1 \uut_slave/U77  ( .A1(\uut_slave/n241 ), .A2(
        \uut_slave/data_count [5]), .ZN(\uut_slave/n92 ) );
  AND2_X1 \uut_slave/U76  ( .A1(\uut_slave/n243 ), .A2(\uut_slave/n245 ), .ZN(
        \uut_slave/n90 ) );
  OAI22_X1 \uut_slave/U75  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n57 ), .B1(
        \uut_slave/n123 ), .B2(\uut_slave/n249 ), .ZN(\uut_slave/n187 ) );
  OAI22_X1 \uut_slave/U74  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n56 ), .B1(
        \uut_slave/n57 ), .B2(\uut_slave/n123 ), .ZN(\uut_slave/n185 ) );
  OAI22_X1 \uut_slave/U73  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n55 ), .B1(
        \uut_slave/n56 ), .B2(\uut_slave/n123 ), .ZN(\uut_slave/n184 ) );
  OAI22_X1 \uut_slave/U72  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n54 ), .B1(
        \uut_slave/n55 ), .B2(\uut_slave/n123 ), .ZN(\uut_slave/n183 ) );
  OAI22_X1 \uut_slave/U71  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n53 ), .B1(
        \uut_slave/n54 ), .B2(\uut_slave/n123 ), .ZN(\uut_slave/n182 ) );
  OAI22_X1 \uut_slave/U70  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n52 ), .B1(
        \uut_slave/n53 ), .B2(\uut_slave/n123 ), .ZN(\uut_slave/n181 ) );
  OAI22_X1 \uut_slave/U69  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n51 ), .B1(
        \uut_slave/n52 ), .B2(\uut_slave/n123 ), .ZN(\uut_slave/n180 ) );
  OAI22_X1 \uut_slave/U68  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n50 ), .B1(
        \uut_slave/n51 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n179 ) );
  OAI22_X1 \uut_slave/U67  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n49 ), .B1(
        \uut_slave/n50 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n178 ) );
  OAI22_X1 \uut_slave/U66  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n48 ), .B1(
        \uut_slave/n49 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n177 ) );
  OAI22_X1 \uut_slave/U65  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n47 ), .B1(
        \uut_slave/n48 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n176 ) );
  OAI22_X1 \uut_slave/U64  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n46 ), .B1(
        \uut_slave/n47 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n175 ) );
  OAI22_X1 \uut_slave/U63  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n45 ), .B1(
        \uut_slave/n46 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n174 ) );
  OAI22_X1 \uut_slave/U62  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n44 ), .B1(
        \uut_slave/n45 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n173 ) );
  OAI22_X1 \uut_slave/U61  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n43 ), .B1(
        \uut_slave/n44 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n172 ) );
  OAI22_X1 \uut_slave/U60  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n42 ), .B1(
        \uut_slave/n43 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n171 ) );
  OAI22_X1 \uut_slave/U59  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n41 ), .B1(
        \uut_slave/n42 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n170 ) );
  OAI22_X1 \uut_slave/U58  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n40 ), .B1(
        \uut_slave/n41 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n169 ) );
  OAI22_X1 \uut_slave/U57  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n39 ), .B1(
        \uut_slave/n40 ), .B2(\uut_slave/n122 ), .ZN(\uut_slave/n168 ) );
  OAI22_X1 \uut_slave/U56  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n38 ), .B1(
        \uut_slave/n39 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n167 ) );
  OAI22_X1 \uut_slave/U55  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n37 ), .B1(
        \uut_slave/n38 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n166 ) );
  OAI22_X1 \uut_slave/U54  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n36 ), .B1(
        \uut_slave/n37 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n165 ) );
  OAI22_X1 \uut_slave/U53  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n35 ), .B1(
        \uut_slave/n36 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n164 ) );
  OAI22_X1 \uut_slave/U52  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n34 ), .B1(
        \uut_slave/n35 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n163 ) );
  OAI22_X1 \uut_slave/U51  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n33 ), .B1(
        \uut_slave/n34 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n162 ) );
  OAI22_X1 \uut_slave/U50  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n32 ), .B1(
        \uut_slave/n33 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n161 ) );
  OAI22_X1 \uut_slave/U49  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n31 ), .B1(
        \uut_slave/n32 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n160 ) );
  OAI22_X1 \uut_slave/U48  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n30 ), .B1(
        \uut_slave/n31 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n159 ) );
  OAI22_X1 \uut_slave/U47  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n29 ), .B1(
        \uut_slave/n30 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n158 ) );
  OAI22_X1 \uut_slave/U46  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n28 ), .B1(
        \uut_slave/n29 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n157 ) );
  OAI22_X1 \uut_slave/U45  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n27 ), .B1(
        \uut_slave/n28 ), .B2(\uut_slave/n123 ), .ZN(\uut_slave/n186 ) );
  OAI22_X1 \uut_slave/U44  ( .A1(\uut_slave/n202 ), .A2(\uut_slave/n26 ), .B1(
        \uut_slave/n27 ), .B2(\uut_slave/n121 ), .ZN(\uut_slave/n156 ) );
  NOR2_X1 \uut_slave/U43  ( .A1(\uut_slave/n58 ), .A2(\uut_slave/n230 ), .ZN(
        \uut_slave/n105 ) );
  AND4_X1 \uut_slave/U42  ( .A1(\uut_slave/command_save [3]), .A2(
        \uut_slave/n10 ), .A3(\uut_slave/command_save [4]), .A4(
        \uut_slave/command_save [2]), .ZN(\uut_slave/n103 ) );
  AND4_X1 \uut_slave/U41  ( .A1(\uut_slave/n101 ), .A2(\uut_slave/n102 ), .A3(
        \uut_slave/n103 ), .A4(\uut_slave/n105 ), .ZN(miso) );
  XNOR2_X1 \uut_slave/U40  ( .A(\uut_slave/data_count [3]), .B(
        \uut_slave/n215 ), .ZN(\uut_slave/n216 ) );
  BUF_X1 \uut_slave/U39  ( .A(\uut_slave/n111 ), .Z(\uut_slave/n110 ) );
  BUF_X1 \uut_slave/U38  ( .A(\uut_slave/n111 ), .Z(\uut_slave/n109 ) );
  BUF_X1 \uut_slave/U37  ( .A(\uut_slave/n111 ), .Z(\uut_slave/n108 ) );
  NAND2_X1 \uut_slave/U36  ( .A1(\uut_slave/n204 ), .A2(\uut_slave/n247 ), 
        .ZN(\uut_slave/n104 ) );
  BUF_X1 \uut_slave/U35  ( .A(\uut_slave/n115 ), .Z(\uut_slave/n114 ) );
  BUF_X1 \uut_slave/U34  ( .A(\uut_slave/n119 ), .Z(\uut_slave/n118 ) );
  BUF_X1 \uut_slave/U33  ( .A(\uut_slave/n119 ), .Z(\uut_slave/n117 ) );
  BUF_X1 \uut_slave/U32  ( .A(\uut_slave/n119 ), .Z(\uut_slave/n116 ) );
  BUF_X1 \uut_slave/U31  ( .A(\uut_slave/n115 ), .Z(\uut_slave/n112 ) );
  BUF_X1 \uut_slave/U30  ( .A(\uut_slave/n115 ), .Z(\uut_slave/n113 ) );
  BUF_X1 \uut_slave/U29  ( .A(\uut_slave/n120 ), .Z(\uut_slave/n123 ) );
  BUF_X1 \uut_slave/U28  ( .A(\uut_slave/n5 ), .Z(\uut_slave/n204 ) );
  BUF_X1 \uut_slave/U27  ( .A(\uut_slave/n5 ), .Z(\uut_slave/n203 ) );
  BUF_X1 \uut_slave/U26  ( .A(\uut_slave/n5 ), .Z(\uut_slave/n202 ) );
  BUF_X1 \uut_slave/U25  ( .A(\uut_slave/n120 ), .Z(\uut_slave/n122 ) );
  BUF_X1 \uut_slave/U24  ( .A(\uut_slave/n120 ), .Z(\uut_slave/n121 ) );
  BUF_X1 \uut_slave/U23  ( .A(\uut_slave/n238 ), .Z(\uut_slave/n111 ) );
  BUF_X1 \uut_slave/U22  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n120 ) );
  BUF_X1 \uut_slave/U21  ( .A(\uut_slave/n240 ), .Z(\uut_slave/n119 ) );
  BUF_X1 \uut_slave/U20  ( .A(\uut_slave/n239 ), .Z(\uut_slave/n115 ) );
  NAND3_X1 \uut_slave/U19  ( .A1(sck), .A2(\uut_slave/n4 ), .A3(
        \uut_slave/n207 ), .ZN(\uut_slave/n220 ) );
  NAND2_X1 \uut_slave/U18  ( .A1(\uut_slave/n206 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n229 ) );
  NAND2_X1 \uut_slave/U17  ( .A1(\uut_slave/n206 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n17 ) );
  NAND2_X1 \uut_slave/U16  ( .A1(\uut_slave/n206 ), .A2(\uut_slave/n96 ), .ZN(
        \uut_slave/n15 ) );
  INV_X1 \uut_slave/U15  ( .A(\uut_slave/n99 ), .ZN(\uut_slave/n13 ) );
  OR2_X1 \uut_slave/U14  ( .A1(\uut_slave/n14 ), .A2(\uut_slave/n233 ), .ZN(
        \uut_slave/n12 ) );
  CLKBUF_X1 \uut_slave/U13  ( .A(\uut_slave/n220 ), .Z(\uut_slave/n11 ) );
  AND2_X1 \uut_slave/U12  ( .A1(\uut_slave/n100 ), .A2(\uut_slave/n247 ), .ZN(
        \uut_slave/n10 ) );
  INV_X1 \uut_slave/U11  ( .A(\uut_slave/n8 ), .ZN(\uut_slave/n9 ) );
  INV_X1 \uut_slave/U10  ( .A(\uut_slave/n16 ), .ZN(\uut_slave/n7 ) );
  AND2_X1 \uut_slave/U9  ( .A1(\uut_slave/n246 ), .A2(\uut_slave/n245 ), .ZN(
        \uut_slave/n5 ) );
  AND2_X1 \uut_slave/U8  ( .A1(\uut_slave/data_count [2]), .A2(
        \uut_slave/data_count [3]), .ZN(\uut_slave/n4 ) );
  INV_X2 \uut_slave/U7  ( .A(\uut_slave/n205 ), .ZN(\uut_slave/n95 ) );
  INV_X4 \uut_slave/U6  ( .A(rst), .ZN(\uut_slave/n247 ) );
  AND4_X1 \uut_slave/U5  ( .A1(\uut_slave/n221 ), .A2(
        \uut_slave/current_state [1]), .A3(\uut_slave/n247 ), .A4(
        \uut_slave/current_state [0]), .ZN(\uut_slave/n2 ) );
  NOR2_X1 \uut_slave/U4  ( .A1(\uut_slave/n14 ), .A2(\uut_slave/n16 ), .ZN(
        \uut_slave/n1 ) );
  NAND2_X1 \uut_slave/U3  ( .A1(\uut_slave/data_count [1]), .A2(\uut_slave/n1 ), .ZN(\uut_slave/n215 ) );
  DFF_X1 \uut_slave/data_count_reg[5]  ( .D(\uut_slave/n201 ), .CK(clk), .Q(
        \uut_slave/data_count [5]), .QN(\uut_slave/n230 ) );
  DFF_X1 \uut_slave/data_count_reg[0]  ( .D(\uut_slave/n200 ), .CK(clk), .Q(
        \uut_slave/data_count [0]), .QN(\uut_slave/n16 ) );
  DFF_X1 \uut_slave/current_state_reg[0]  ( .D(\uut_slave/n248 ), .CK(clk), 
        .Q(\uut_slave/current_state [0]), .QN(\uut_slave/n91 ) );
  DFF_X1 \uut_slave/data_count_reg[1]  ( .D(\uut_slave/n199 ), .CK(clk), .Q(
        \uut_slave/data_count [1]), .QN(\uut_slave/n99 ) );
  DFF_X1 \uut_slave/data_count_reg[2]  ( .D(\uut_slave/n198 ), .CK(clk), .Q(
        \uut_slave/data_count [2]), .QN(\uut_slave/n14 ) );
  DFF_X1 \uut_slave/data_count_reg[3]  ( .D(\uut_slave/n197 ), .CK(clk), .Q(
        \uut_slave/data_count [3]), .QN(\uut_slave/n233 ) );
  DFF_X1 \uut_slave/data_count_reg[4]  ( .D(\uut_slave/n196 ), .CK(clk), .Q(
        \uut_slave/data_count [4]), .QN(\uut_slave/n232 ) );
  DFF_X1 \uut_slave/data_end_reg  ( .D(\uut_slave/data_end_next ), .CK(clk), 
        .Q(\uut_slave/data_end ) );
  DFF_X1 \uut_slave/command_save_reg[7]  ( .D(\uut_slave/n188 ), .CK(
        \uut_slave/n95 ), .Q(\uut_slave/n6 ), .QN(\uut_slave/n18 ) );
  DFF_X1 \uut_slave/command_save_reg[6]  ( .D(\uut_slave/n189 ), .CK(
        \uut_slave/n95 ), .Q(\uut_slave/n3 ), .QN(\uut_slave/n19 ) );
  DFF_X1 \uut_slave/command_save_reg[5]  ( .D(\uut_slave/n190 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n20 ) );
  DFF_X1 \uut_slave/command_save_reg[4]  ( .D(\uut_slave/n191 ), .CK(
        \uut_slave/n95 ), .Q(\uut_slave/command_save [4]), .QN(\uut_slave/n21 ) );
  DFF_X1 \uut_slave/command_save_reg[3]  ( .D(\uut_slave/n192 ), .CK(
        \uut_slave/n95 ), .Q(\uut_slave/command_save [3]), .QN(\uut_slave/n22 ) );
  DFF_X1 \uut_slave/command_save_reg[2]  ( .D(\uut_slave/n193 ), .CK(
        \uut_slave/n95 ), .Q(\uut_slave/command_save [2]), .QN(\uut_slave/n23 ) );
  DFF_X1 \uut_slave/command_save_reg[1]  ( .D(\uut_slave/n194 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n24 ) );
  DFF_X1 \uut_slave/command_save_reg[0]  ( .D(\uut_slave/n195 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n25 ) );
  DFF_X1 \uut_slave/data_out_reg[31]  ( .D(\uut_slave/n124 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n58 ) );
  DFF_X1 \uut_slave/data_save_reg[31]  ( .D(\uut_slave/n156 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n26 ) );
  DFF_X1 \uut_slave/data_out_reg[30]  ( .D(\uut_slave/n125 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n59 ) );
  DFF_X1 \uut_slave/data_save_reg[30]  ( .D(\uut_slave/n186 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n27 ) );
  DFF_X1 \uut_slave/data_out_reg[29]  ( .D(\uut_slave/n126 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n60 ) );
  DFF_X1 \uut_slave/data_save_reg[29]  ( .D(\uut_slave/n157 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n28 ) );
  DFF_X1 \uut_slave/data_out_reg[28]  ( .D(\uut_slave/n127 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n61 ) );
  DFF_X1 \uut_slave/data_save_reg[28]  ( .D(\uut_slave/n158 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n29 ) );
  DFF_X1 \uut_slave/data_out_reg[27]  ( .D(\uut_slave/n128 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n62 ) );
  DFF_X1 \uut_slave/data_save_reg[27]  ( .D(\uut_slave/n159 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n30 ) );
  DFF_X1 \uut_slave/data_out_reg[26]  ( .D(\uut_slave/n129 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n63 ) );
  DFF_X1 \uut_slave/data_save_reg[26]  ( .D(\uut_slave/n160 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n31 ) );
  DFF_X1 \uut_slave/data_out_reg[25]  ( .D(\uut_slave/n130 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n64 ) );
  DFF_X1 \uut_slave/data_save_reg[25]  ( .D(\uut_slave/n161 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n32 ) );
  DFF_X1 \uut_slave/data_out_reg[24]  ( .D(\uut_slave/n131 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n65 ) );
  DFF_X1 \uut_slave/data_save_reg[24]  ( .D(\uut_slave/n162 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n33 ) );
  DFF_X1 \uut_slave/data_out_reg[23]  ( .D(\uut_slave/n132 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n66 ) );
  DFF_X1 \uut_slave/data_save_reg[23]  ( .D(\uut_slave/n163 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n34 ) );
  DFF_X1 \uut_slave/data_out_reg[22]  ( .D(\uut_slave/n133 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n67 ) );
  DFF_X1 \uut_slave/data_save_reg[22]  ( .D(\uut_slave/n164 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n35 ) );
  DFF_X1 \uut_slave/data_out_reg[21]  ( .D(\uut_slave/n134 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n68 ) );
  DFF_X1 \uut_slave/data_save_reg[21]  ( .D(\uut_slave/n165 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n36 ) );
  DFF_X1 \uut_slave/data_out_reg[20]  ( .D(\uut_slave/n135 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n69 ) );
  DFF_X1 \uut_slave/data_save_reg[20]  ( .D(\uut_slave/n166 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n37 ) );
  DFF_X1 \uut_slave/data_out_reg[19]  ( .D(\uut_slave/n136 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n70 ) );
  DFF_X1 \uut_slave/data_save_reg[19]  ( .D(\uut_slave/n167 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n38 ) );
  DFF_X1 \uut_slave/data_out_reg[18]  ( .D(\uut_slave/n137 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n71 ) );
  DFF_X1 \uut_slave/data_save_reg[18]  ( .D(\uut_slave/n168 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n39 ) );
  DFF_X1 \uut_slave/data_out_reg[17]  ( .D(\uut_slave/n138 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n72 ) );
  DFF_X1 \uut_slave/data_save_reg[17]  ( .D(\uut_slave/n169 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n40 ) );
  DFF_X1 \uut_slave/data_out_reg[16]  ( .D(\uut_slave/n139 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n73 ) );
  DFF_X1 \uut_slave/data_save_reg[16]  ( .D(\uut_slave/n170 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n41 ) );
  DFF_X1 \uut_slave/data_out_reg[15]  ( .D(\uut_slave/n140 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n74 ) );
  DFF_X1 \uut_slave/data_save_reg[15]  ( .D(\uut_slave/n171 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n42 ) );
  DFF_X1 \uut_slave/data_out_reg[14]  ( .D(\uut_slave/n141 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n75 ) );
  DFF_X1 \uut_slave/data_save_reg[14]  ( .D(\uut_slave/n172 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n43 ) );
  DFF_X1 \uut_slave/data_out_reg[13]  ( .D(\uut_slave/n142 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n76 ) );
  DFF_X1 \uut_slave/data_save_reg[13]  ( .D(\uut_slave/n173 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n44 ) );
  DFF_X1 \uut_slave/data_out_reg[12]  ( .D(\uut_slave/n143 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n77 ) );
  DFF_X1 \uut_slave/data_save_reg[12]  ( .D(\uut_slave/n174 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n45 ) );
  DFF_X1 \uut_slave/data_out_reg[11]  ( .D(\uut_slave/n144 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n78 ) );
  DFF_X1 \uut_slave/data_save_reg[11]  ( .D(\uut_slave/n175 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n46 ) );
  DFF_X1 \uut_slave/data_out_reg[10]  ( .D(\uut_slave/n145 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n79 ) );
  DFF_X1 \uut_slave/data_save_reg[10]  ( .D(\uut_slave/n176 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n47 ) );
  DFF_X1 \uut_slave/data_out_reg[9]  ( .D(\uut_slave/n146 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n80 ) );
  DFF_X1 \uut_slave/data_save_reg[9]  ( .D(\uut_slave/n177 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n48 ) );
  DFF_X1 \uut_slave/data_out_reg[8]  ( .D(\uut_slave/n147 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n81 ) );
  DFF_X1 \uut_slave/data_save_reg[8]  ( .D(\uut_slave/n178 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n49 ) );
  DFF_X1 \uut_slave/data_out_reg[7]  ( .D(\uut_slave/n148 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n82 ) );
  DFF_X1 \uut_slave/data_save_reg[7]  ( .D(\uut_slave/n179 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n50 ) );
  DFF_X1 \uut_slave/data_out_reg[6]  ( .D(\uut_slave/n149 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n83 ) );
  DFF_X1 \uut_slave/data_save_reg[6]  ( .D(\uut_slave/n180 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n51 ) );
  DFF_X1 \uut_slave/data_out_reg[5]  ( .D(\uut_slave/n150 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n84 ) );
  DFF_X1 \uut_slave/data_save_reg[5]  ( .D(\uut_slave/n181 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n52 ) );
  DFF_X1 \uut_slave/data_out_reg[4]  ( .D(\uut_slave/n151 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n85 ) );
  DFF_X1 \uut_slave/data_save_reg[4]  ( .D(\uut_slave/n182 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n53 ) );
  DFF_X1 \uut_slave/data_out_reg[3]  ( .D(\uut_slave/n152 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n86 ) );
  DFF_X1 \uut_slave/data_save_reg[3]  ( .D(\uut_slave/n183 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n54 ) );
  DFF_X1 \uut_slave/data_out_reg[2]  ( .D(\uut_slave/n153 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n87 ) );
  DFF_X1 \uut_slave/data_save_reg[2]  ( .D(\uut_slave/n184 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n55 ) );
  DFF_X1 \uut_slave/data_out_reg[1]  ( .D(\uut_slave/n154 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n88 ) );
  DFF_X1 \uut_slave/data_save_reg[1]  ( .D(\uut_slave/n185 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n56 ) );
  DFF_X1 \uut_slave/data_out_reg[0]  ( .D(\uut_slave/n155 ), .CK(
        \uut_slave/n205 ), .QN(\uut_slave/n89 ) );
  DFF_X1 \uut_slave/data_save_reg[0]  ( .D(\uut_slave/n187 ), .CK(
        \uut_slave/n95 ), .QN(\uut_slave/n57 ) );
  DFF_X1 \uut_slave/current_state_reg[1]  ( .D(\uut_slave/N142 ), .CK(clk), 
        .Q(\uut_slave/current_state [1]), .QN(\uut_slave/n8 ) );
endmodule

