/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 14:20:02 2026
/////////////////////////////////////////////////////////////


module uart_top_design ( clk, rst, address, write_data, we, tx, rx, re, 
        read_data );
  input [1:0] address;
  input [31:0] write_data;
  output [7:0] read_data;
  input clk, rst, we, rx, re;
  output tx;
  wire   enable, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45,
         N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, baud_tick, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, \uut_baud_rate/n145 ,
         \uut_baud_rate/n144 , \uut_baud_rate/n143 , \uut_baud_rate/n142 ,
         \uut_baud_rate/n141 , \uut_baud_rate/n140 , \uut_baud_rate/n139 ,
         \uut_baud_rate/n138 , \uut_baud_rate/n137 , \uut_baud_rate/n136 ,
         \uut_baud_rate/n135 , \uut_baud_rate/n134 , \uut_baud_rate/n133 ,
         \uut_baud_rate/n132 , \uut_baud_rate/n131 , \uut_baud_rate/n130 ,
         \uut_baud_rate/n129 , \uut_baud_rate/n128 , \uut_baud_rate/n127 ,
         \uut_baud_rate/n126 , \uut_baud_rate/n125 , \uut_baud_rate/n124 ,
         \uut_baud_rate/n123 , \uut_baud_rate/n122 , \uut_baud_rate/n121 ,
         \uut_baud_rate/n120 , \uut_baud_rate/n119 , \uut_baud_rate/n118 ,
         \uut_baud_rate/n117 , \uut_baud_rate/n116 , \uut_baud_rate/n115 ,
         \uut_baud_rate/n114 , \uut_baud_rate/n113 , \uut_baud_rate/n112 ,
         \uut_baud_rate/n111 , \uut_baud_rate/n110 , \uut_baud_rate/n109 ,
         \uut_baud_rate/n108 , \uut_baud_rate/n107 , \uut_baud_rate/n106 ,
         \uut_baud_rate/n105 , \uut_baud_rate/n104 , \uut_baud_rate/n103 ,
         \uut_baud_rate/n102 , \uut_baud_rate/n101 , \uut_baud_rate/n100 ,
         \uut_baud_rate/n99 , \uut_baud_rate/n98 , \uut_baud_rate/n97 ,
         \uut_baud_rate/n96 , \uut_baud_rate/n95 , \uut_baud_rate/n94 ,
         \uut_baud_rate/n93 , \uut_baud_rate/n92 , \uut_baud_rate/n91 ,
         \uut_baud_rate/n90 , \uut_baud_rate/n89 , \uut_baud_rate/n88 ,
         \uut_baud_rate/n87 , \uut_baud_rate/n86 , \uut_baud_rate/n85 ,
         \uut_baud_rate/n84 , \uut_baud_rate/n83 , \uut_baud_rate/n82 ,
         \uut_baud_rate/n81 , \uut_baud_rate/n80 , \uut_baud_rate/n79 ,
         \uut_baud_rate/n78 , \uut_baud_rate/n77 , \uut_baud_rate/n76 ,
         \uut_baud_rate/n75 , \uut_baud_rate/n74 , \uut_baud_rate/n73 ,
         \uut_baud_rate/n63 , \uut_baud_rate/n62 , \uut_baud_rate/n61 ,
         \uut_baud_rate/n60 , \uut_baud_rate/n59 , \uut_baud_rate/n58 ,
         \uut_baud_rate/n57 , \uut_baud_rate/n56 , \uut_baud_rate/n55 ,
         \uut_baud_rate/n54 , \uut_baud_rate/n53 , \uut_baud_rate/n52 ,
         \uut_baud_rate/n51 , \uut_baud_rate/n50 , \uut_baud_rate/n49 ,
         \uut_baud_rate/n48 , \uut_baud_rate/n47 , \uut_baud_rate/n46 ,
         \uut_baud_rate/n45 , \uut_baud_rate/n44 , \uut_baud_rate/n43 ,
         \uut_baud_rate/n42 , \uut_baud_rate/n41 , \uut_baud_rate/n40 ,
         \uut_baud_rate/n39 , \uut_baud_rate/n38 , \uut_baud_rate/n37 ,
         \uut_baud_rate/n36 , \uut_baud_rate/n35 , \uut_baud_rate/n34 ,
         \uut_baud_rate/n33 , \uut_baud_rate/n32 , \uut_baud_rate/n31 ,
         \uut_baud_rate/n30 , \uut_baud_rate/n18 , \uut_baud_rate/n17 ,
         \uut_baud_rate/n16 , \uut_baud_rate/n15 , \uut_baud_rate/n14 ,
         \uut_baud_rate/n13 , \uut_baud_rate/n11 , \uut_baud_rate/n10 ,
         \uut_baud_rate/n9 , \uut_baud_rate/n8 , \uut_baud_rate/n7 ,
         \uut_baud_rate/n6 , \uut_baud_rate/n5 , \uut_baud_rate/n4 ,
         \uut_baud_rate/n3 , \uut_baud_rate/n2 , \uut_baud_rate/n1 ,
         \uut_baud_rate/n29 , \uut_baud_rate/n28 , \uut_baud_rate/n27 ,
         \uut_baud_rate/n26 , \uut_baud_rate/n25 , \uut_baud_rate/n24 ,
         \uut_baud_rate/n23 , \uut_baud_rate/n22 , \uut_baud_rate/n21 ,
         \uut_baud_rate/n20 , \uut_baud_rate/n19 , \uut_baud_rate/N108 ,
         \uut_baud_rate/N107 , \uut_baud_rate/N106 , \uut_baud_rate/N105 ,
         \uut_baud_rate/N104 , \uut_baud_rate/N103 , \uut_baud_rate/N102 ,
         \uut_baud_rate/N101 , \uut_baud_rate/N100 , \uut_baud_rate/N98 ,
         \uut_baud_rate/N96 , \uut_baud_rate/N87 , \uut_baud_rate/N86 ,
         \uut_baud_rate/N85 , \uut_baud_rate/N84 , \uut_baud_rate/N83 ,
         \uut_baud_rate/N82 , \uut_baud_rate/N81 , \uut_baud_rate/N80 ,
         \uut_baud_rate/N79 , \uut_baud_rate/N78 , \uut_baud_rate/N43 ,
         \uut_baud_rate/N42 , \uut_baud_rate/N41 , \uut_baud_rate/N40 ,
         \uut_baud_rate/N39 , \uut_baud_rate/N38 , \uut_baud_rate/N37 ,
         \uut_baud_rate/N36 , \uut_baud_rate/N35 , \uut_baud_rate/N34 ,
         \uut_baud_rate/N33 , \uut_baud_rate/N32 , \uut_baud_rate/N31 ,
         \uut_baud_rate/N30 , \uut_baud_rate/N29 , \uut_baud_rate/N28 ,
         \uut_baud_rate/N27 , \uut_baud_rate/N26 , \uut_baud_rate/N25 ,
         \uut_baud_rate/N24 , \uut_baud_rate/N23 , \uut_baud_rate/N22 ,
         \uut_baud_rate/N21 , \uut_baud_rate/N20 , \uut_baud_rate/N19 ,
         \uut_baud_rate/N18 , \uut_baud_rate/N17 , \uut_baud_rate/N16 ,
         \uut_baud_rate/N15 , \uut_baud_rate/N14 , \uut_baud_rate/N13 ,
         \uut_baud_rate/N12 , \uut_baud_rate/temp_en ,
         \uut_baud_rate/add_176/n307 , \uut_baud_rate/add_176/n306 ,
         \uut_baud_rate/add_176/n305 , \uut_baud_rate/add_176/n304 ,
         \uut_baud_rate/add_176/n303 , \uut_baud_rate/add_176/n302 ,
         \uut_baud_rate/add_176/n301 , \uut_baud_rate/add_176/n300 ,
         \uut_baud_rate/add_176/n299 , \uut_baud_rate/add_176/n298 ,
         \uut_baud_rate/add_176/n297 , \uut_baud_rate/add_176/n296 ,
         \uut_baud_rate/add_176/n295 , \uut_baud_rate/add_176/n294 ,
         \uut_baud_rate/add_176/n293 , \uut_baud_rate/add_176/n292 ,
         \uut_baud_rate/add_176/n291 , \uut_baud_rate/add_176/n290 ,
         \uut_baud_rate/add_176/n289 , \uut_baud_rate/add_176/n288 ,
         \uut_baud_rate/add_176/n287 , \uut_baud_rate/add_176/n286 ,
         \uut_baud_rate/add_176/n285 , \uut_baud_rate/add_176/n284 ,
         \uut_baud_rate/add_176/n283 , \uut_baud_rate/add_176/n282 ,
         \uut_baud_rate/add_176/n281 , \uut_baud_rate/add_176/n280 ,
         \uut_baud_rate/add_176/n279 , \uut_baud_rate/add_176/n278 ,
         \uut_baud_rate/add_176/n277 , \uut_baud_rate/add_176/n276 ,
         \uut_baud_rate/add_176/n275 , \uut_baud_rate/add_176/n274 ,
         \uut_baud_rate/add_176/n273 , \uut_baud_rate/add_176/n272 ,
         \uut_baud_rate/add_176/n271 , \uut_baud_rate/add_176/n270 ,
         \uut_baud_rate/add_176/n269 , \uut_baud_rate/add_176/n268 ,
         \uut_baud_rate/add_176/n267 , \uut_baud_rate/add_176/n266 ,
         \uut_baud_rate/add_176/n265 , \uut_baud_rate/add_176/n264 ,
         \uut_baud_rate/add_176/n263 , \uut_baud_rate/add_176/n262 ,
         \uut_baud_rate/add_176/n261 , \uut_baud_rate/add_176/n260 ,
         \uut_baud_rate/add_176/n259 , \uut_baud_rate/add_176/n258 ,
         \uut_baud_rate/add_176/n257 , \uut_baud_rate/add_176/n256 ,
         \uut_baud_rate/add_176/n255 , \uut_baud_rate/add_176/n254 ,
         \uut_baud_rate/add_176/n253 , \uut_baud_rate/add_176/n252 ,
         \uut_baud_rate/add_176/n251 , \uut_baud_rate/add_176/n250 ,
         \uut_baud_rate/add_176/n249 , \uut_baud_rate/add_176/n248 ,
         \uut_baud_rate/add_176/n247 , \uut_baud_rate/add_176/n246 ,
         \uut_baud_rate/add_176/n245 , \uut_baud_rate/add_176/n244 ,
         \uut_baud_rate/add_176/n243 , \uut_baud_rate/add_176/n242 ,
         \uut_baud_rate/add_176/n241 , \uut_baud_rate/add_176/n240 ,
         \uut_baud_rate/add_176/n239 , \uut_baud_rate/add_176/n238 ,
         \uut_baud_rate/add_176/n237 , \uut_baud_rate/add_176/n236 ,
         \uut_baud_rate/add_176/n235 , \uut_baud_rate/add_176/n234 ,
         \uut_baud_rate/add_176/n233 , \uut_baud_rate/add_176/n232 ,
         \uut_baud_rate/add_176/n231 , \uut_baud_rate/add_176/n230 ,
         \uut_baud_rate/add_176/n229 , \uut_baud_rate/add_176/n228 ,
         \uut_baud_rate/add_176/n227 , \uut_baud_rate/add_176/n226 ,
         \uut_baud_rate/add_176/n225 , \uut_baud_rate/add_176/n224 ,
         \uut_baud_rate/add_176/n223 , \uut_baud_rate/add_176/n222 ,
         \uut_baud_rate/add_176/n221 , \uut_baud_rate/add_176/n220 ,
         \uut_baud_rate/add_176/n219 , \uut_baud_rate/add_176/n218 ,
         \uut_baud_rate/add_176/n217 , \uut_baud_rate/add_176/n216 ,
         \uut_baud_rate/add_176/n215 , \uut_baud_rate/add_176/n214 ,
         \uut_baud_rate/add_176/n213 , \uut_baud_rate/add_176/n212 ,
         \uut_baud_rate/add_176/n211 , \uut_baud_rate/add_176/n210 ,
         \uut_baud_rate/add_176/n209 , \uut_baud_rate/add_176/n208 ,
         \uut_baud_rate/add_176/n207 , \uut_baud_rate/add_176/n206 ,
         \uut_baud_rate/add_176/n205 , \uut_baud_rate/add_176/n204 ,
         \uut_baud_rate/add_176/n203 , \uut_baud_rate/add_176/n202 ,
         \uut_baud_rate/add_176/n201 , \uut_baud_rate/add_176/n200 ,
         \uut_baud_rate/add_176/n199 , \uut_baud_rate/add_176/n198 ,
         \uut_baud_rate/add_176/n197 , \uut_baud_rate/add_176/n196 ,
         \uut_baud_rate/add_176/n195 , \uut_baud_rate/add_176/n194 ,
         \uut_baud_rate/add_176/n193 , \uut_baud_rate/add_176/n192 ,
         \uut_baud_rate/add_176/n191 , \uut_baud_rate/add_176/n190 ,
         \uut_baud_rate/add_176/n189 , \uut_baud_rate/add_176/n188 ,
         \uut_baud_rate/add_176/n187 , \uut_baud_rate/add_176/n186 ,
         \uut_baud_rate/add_176/n185 , \uut_baud_rate/add_176/n184 ,
         \uut_baud_rate/add_176/n183 , \uut_baud_rate/add_176/n182 ,
         \uut_baud_rate/add_176/n181 , \uut_baud_rate/add_176/n180 ,
         \uut_baud_rate/add_176/n179 , \uut_baud_rate/add_176/n178 ,
         \uut_baud_rate/add_176/n177 , \uut_baud_rate/add_176/n176 ,
         \uut_baud_rate/add_176/n175 , \uut_baud_rate/add_176/n174 ,
         \uut_baud_rate/add_176/n173 , \uut_baud_rate/add_176/n172 ,
         \uut_baud_rate/add_176/n171 , \uut_baud_rate/add_176/n170 ,
         \uut_baud_rate/add_176/n169 , \uut_baud_rate/add_176/n168 ,
         \uut_baud_rate/add_176/n167 , \uut_baud_rate/add_176/n166 ,
         \uut_baud_rate/add_176/n165 , \uut_baud_rate/add_176/n164 ,
         \uut_baud_rate/add_176/n163 , \uut_baud_rate/add_176/n162 ,
         \uut_baud_rate/add_176/n161 , \uut_baud_rate/add_176/n160 ,
         \uut_baud_rate/add_176/n159 , \uut_baud_rate/add_176/n158 ,
         \uut_baud_rate/add_176/n157 , \uut_baud_rate/add_176/n156 ,
         \uut_baud_rate/add_176/n155 , \uut_baud_rate/add_176/n154 ,
         \uut_baud_rate/add_176/n153 , \uut_baud_rate/add_176/n152 ,
         \uut_baud_rate/add_176/n151 , \uut_baud_rate/add_176/n150 ,
         \uut_baud_rate/add_176/n149 , \uut_baud_rate/add_176/n148 ,
         \uut_baud_rate/add_176/n147 , \uut_baud_rate/add_176/n146 ,
         \uut_baud_rate/add_176/n145 , \uut_baud_rate/add_176/n144 ,
         \uut_baud_rate/add_176/n143 , \uut_baud_rate/add_176/n142 ,
         \uut_baud_rate/add_176/n141 , \uut_baud_rate/add_176/n140 ,
         \uut_baud_rate/add_176/n139 , \uut_baud_rate/add_176/n138 ,
         \uut_baud_rate/add_176/n137 , \uut_baud_rate/add_176/n136 ,
         \uut_baud_rate/add_176/n135 , \uut_baud_rate/add_176/n134 ,
         \uut_baud_rate/add_176/n133 , \uut_baud_rate/add_176/n132 ,
         \uut_baud_rate/add_176/n131 , \uut_baud_rate/add_176/n130 ,
         \uut_baud_rate/add_176/n129 , \uut_baud_rate/add_176/n128 ,
         \uut_baud_rate/add_176/n127 , \uut_baud_rate/add_176/n126 ,
         \uut_baud_rate/add_176/n125 , \uut_baud_rate/add_176/n124 ,
         \uut_baud_rate/add_176/n123 , \uut_baud_rate/add_176/n122 ,
         \uut_baud_rate/add_176/n121 , \uut_baud_rate/add_176/n120 ,
         \uut_baud_rate/add_176/n119 , \uut_baud_rate/add_176/n118 ,
         \uut_baud_rate/add_176/n117 , \uut_baud_rate/add_176/n116 ,
         \uut_baud_rate/add_176/n115 , \uut_baud_rate/add_176/n114 ,
         \uut_baud_rate/add_176/n113 , \uut_baud_rate/add_176/n112 ,
         \uut_baud_rate/add_176/n111 , \uut_baud_rate/add_176/n110 ,
         \uut_baud_rate/add_176/n109 , \uut_baud_rate/add_176/n108 ,
         \uut_baud_rate/add_176/n107 , \uut_baud_rate/add_176/n106 ,
         \uut_baud_rate/add_176/n105 , \uut_baud_rate/add_176/n104 ,
         \uut_baud_rate/add_176/n103 , \uut_baud_rate/add_176/n102 ,
         \uut_baud_rate/add_176/n101 , \uut_baud_rate/add_176/n100 ,
         \uut_baud_rate/add_176/n99 , \uut_baud_rate/add_176/n98 ,
         \uut_baud_rate/add_176/n97 , \uut_baud_rate/add_176/n96 ,
         \uut_baud_rate/add_176/n95 , \uut_baud_rate/add_176/n94 ,
         \uut_baud_rate/add_176/n93 , \uut_baud_rate/add_176/n92 ,
         \uut_baud_rate/add_176/n91 , \uut_baud_rate/add_176/n90 ,
         \uut_baud_rate/add_176/n89 , \uut_baud_rate/add_176/n88 ,
         \uut_baud_rate/add_176/n87 , \uut_baud_rate/add_176/n86 ,
         \uut_baud_rate/add_176/n85 , \uut_baud_rate/add_176/n84 ,
         \uut_baud_rate/add_176/n83 , \uut_baud_rate/add_176/n82 ,
         \uut_baud_rate/add_176/n81 , \uut_baud_rate/add_176/n80 ,
         \uut_baud_rate/add_176/n79 , \uut_baud_rate/add_176/n78 ,
         \uut_baud_rate/add_176/n77 , \uut_baud_rate/add_176/n76 ,
         \uut_baud_rate/add_176/n75 , \uut_baud_rate/add_176/n74 ,
         \uut_baud_rate/add_176/n73 , \uut_baud_rate/add_176/n72 ,
         \uut_baud_rate/add_176/n71 , \uut_baud_rate/add_176/n70 ,
         \uut_baud_rate/add_176/n69 , \uut_baud_rate/add_176/n68 ,
         \uut_baud_rate/add_176/n67 , \uut_baud_rate/add_176/n65 ,
         \uut_baud_rate/add_176/n64 , \uut_baud_rate/add_176/n63 ,
         \uut_baud_rate/add_176/n62 , \uut_baud_rate/add_176/n61 ,
         \uut_baud_rate/add_176/n60 , \uut_baud_rate/add_176/n59 ,
         \uut_baud_rate/add_176/n58 , \uut_baud_rate/add_176/n57 ,
         \uut_baud_rate/add_176/n56 , \uut_baud_rate/add_176/n55 ,
         \uut_baud_rate/add_176/n54 , \uut_baud_rate/add_176/n53 ,
         \uut_baud_rate/add_176/n52 , \uut_baud_rate/add_176/n51 ,
         \uut_baud_rate/add_176/n50 , \uut_baud_rate/add_176/n49 ,
         \uut_baud_rate/add_176/n48 , \uut_baud_rate/add_176/n47 ,
         \uut_baud_rate/add_176/n46 , \uut_baud_rate/add_176/n45 ,
         \uut_baud_rate/add_176/n44 , \uut_baud_rate/add_176/n43 ,
         \uut_baud_rate/add_176/n42 , \uut_baud_rate/add_176/n41 ,
         \uut_baud_rate/add_176/n40 , \uut_baud_rate/add_176/n38 ,
         \uut_baud_rate/add_176/n37 , \uut_baud_rate/add_176/n36 ,
         \uut_baud_rate/add_176/n35 , \uut_baud_rate/add_176/n34 ,
         \uut_baud_rate/add_176/n33 , \uut_baud_rate/add_176/n32 ,
         \uut_baud_rate/add_176/n31 , \uut_baud_rate/add_176/n30 ,
         \uut_baud_rate/add_176/n29 , \uut_baud_rate/add_176/n28 ,
         \uut_baud_rate/add_176/n27 , \uut_baud_rate/add_176/n26 ,
         \uut_baud_rate/add_176/n25 , \uut_baud_rate/add_176/n24 ,
         \uut_baud_rate/add_176/n23 , \uut_baud_rate/add_176/n22 ,
         \uut_baud_rate/add_176/n21 , \uut_baud_rate/add_176/n20 ,
         \uut_baud_rate/add_176/n19 , \uut_baud_rate/add_176/n18 ,
         \uut_baud_rate/add_176/n17 , \uut_baud_rate/add_176/n16 ,
         \uut_baud_rate/add_176/n15 , \uut_baud_rate/add_176/n14 ,
         \uut_baud_rate/add_176/n13 , \uut_baud_rate/add_176/n12 ,
         \uut_baud_rate/add_176/n11 , \uut_baud_rate/add_176/n10 ,
         \uut_baud_rate/add_176/n9 , \uut_baud_rate/add_176/n8 ,
         \uut_baud_rate/add_176/n7 , \uut_baud_rate/add_176/n6 ,
         \uut_baud_rate/add_176/n5 , \uut_baud_rate/add_176/n4 ,
         \uut_baud_rate/add_176/n3 , \uut_baud_rate/add_176/n2 ,
         \uut_baud_rate/add_176/n1 , \uut_tx/n62 , \uut_tx/n61 , \uut_tx/n60 ,
         \uut_tx/n59 , \uut_tx/n58 , \uut_tx/n57 , \uut_tx/n56 , \uut_tx/n55 ,
         \uut_tx/n54 , \uut_tx/n53 , \uut_tx/n52 , \uut_tx/n51 , \uut_tx/n41 ,
         \uut_tx/n40 , \uut_tx/n39 , \uut_tx/n38 , \uut_tx/n37 , \uut_tx/n36 ,
         \uut_tx/n35 , \uut_tx/n34 , \uut_tx/n33 , \uut_tx/n32 , \uut_tx/n31 ,
         \uut_tx/n30 , \uut_tx/n29 , \uut_tx/n28 , \uut_tx/n27 , \uut_tx/n26 ,
         \uut_tx/n25 , \uut_tx/n24 , \uut_tx/n23 , \uut_tx/n22 , \uut_tx/n21 ,
         \uut_tx/n20 , \uut_tx/n19 , \uut_tx/n18 , \uut_tx/n17 , \uut_tx/n15 ,
         \uut_tx/n13 , \uut_tx/n11 , \uut_tx/n5 , \uut_tx/n4 , \uut_tx/n3 ,
         \uut_tx/n2 , \uut_tx/n1 , \uut_tx/n50 , \uut_tx/n49 , \uut_tx/n48 ,
         \uut_tx/n47 , \uut_tx/n46 , \uut_tx/n45 , \uut_tx/n44 , \uut_tx/n43 ,
         \uut_tx/n42 , \uut_tx/n16 , \uut_tx/n14 , \uut_tx/n12 , \uut_tx/n10 ,
         \uut_tx/n9 , \uut_tx/n8 , \uut_tx/n7 , \uut_tx/n6 , \uut_tx/N52 ,
         \uut_tx/N34 , \uut_tx/count_16_indication , \uut_rx/n94 ,
         \uut_rx/n93 , \uut_rx/n92 , \uut_rx/n91 , \uut_rx/n90 , \uut_rx/n89 ,
         \uut_rx/n88 , \uut_rx/n87 , \uut_rx/n86 , \uut_rx/n85 , \uut_rx/n84 ,
         \uut_rx/n83 , \uut_rx/n82 , \uut_rx/n81 , \uut_rx/n80 , \uut_rx/n79 ,
         \uut_rx/n78 , \uut_rx/n77 , \uut_rx/n67 , \uut_rx/n66 , \uut_rx/n65 ,
         \uut_rx/n64 , \uut_rx/n63 , \uut_rx/n62 , \uut_rx/n61 , \uut_rx/n60 ,
         \uut_rx/n59 , \uut_rx/n58 , \uut_rx/n57 , \uut_rx/n56 , \uut_rx/n55 ,
         \uut_rx/n54 , \uut_rx/n53 , \uut_rx/n52 , \uut_rx/n51 , \uut_rx/n50 ,
         \uut_rx/n49 , \uut_rx/n48 , \uut_rx/n47 , \uut_rx/n46 , \uut_rx/n45 ,
         \uut_rx/n44 , \uut_rx/n43 , \uut_rx/n42 , \uut_rx/n41 , \uut_rx/n40 ,
         \uut_rx/n39 , \uut_rx/n38 , \uut_rx/n37 , \uut_rx/n36 , \uut_rx/n35 ,
         \uut_rx/n34 , \uut_rx/n33 , \uut_rx/n32 , \uut_rx/n31 , \uut_rx/n30 ,
         \uut_rx/n29 , \uut_rx/n28 , \uut_rx/n27 , \uut_rx/n26 , \uut_rx/n24 ,
         \uut_rx/n23 , \uut_rx/n21 , \uut_rx/n20 , \uut_rx/n18 , \uut_rx/n17 ,
         \uut_rx/n15 , \uut_rx/n14 , \uut_rx/n12 , \uut_rx/n11 , \uut_rx/n10 ,
         \uut_rx/n9 , \uut_rx/n8 , \uut_rx/n7 , \uut_rx/n6 , \uut_rx/n5 ,
         \uut_rx/n4 , \uut_rx/n3 , \uut_rx/n2 , \uut_rx/n1 , \uut_rx/n76 ,
         \uut_rx/n75 , \uut_rx/n74 , \uut_rx/n73 , \uut_rx/n72 , \uut_rx/n71 ,
         \uut_rx/n70 , \uut_rx/n69 , \uut_rx/n68 , \uut_rx/n25 , \uut_rx/n22 ,
         \uut_rx/n19 , \uut_rx/n16 , \uut_rx/n13 , \uut_rx/N82 , \uut_rx/N64 ,
         \uut_rx/count_8_indication , \uut_rx/N45 ,
         \uut_rx/count_16_indication ;
  wire   [31:0] baud_division;
  wire   [7:0] data_out;
  wire   [7:0] data_in;
  wire   [31:0] \uut_baud_rate/baud_count ;
  wire   [2:0] \uut_tx/count_8 ;
  wire   [3:0] \uut_tx/count_16 ;
  wire   [1:0] \uut_tx/current_state ;
  wire   [7:0] \uut_rx/data_save ;
  wire   [2:0] \uut_rx/count_8 ;
  wire   [3:0] \uut_rx/count_16 ;
  wire   [1:0] \uut_rx/current_state ;

  DLH_X1 enable_reg ( .G(N53), .D(N21), .Q(enable) );
  DLH_X1 \baud_division_reg[31]  ( .G(n9), .D(N52), .Q(baud_division[31]) );
  DLH_X1 \baud_division_reg[30]  ( .G(n9), .D(N51), .Q(baud_division[30]) );
  DLH_X1 \baud_division_reg[29]  ( .G(n9), .D(N50), .Q(baud_division[29]) );
  DLH_X1 \baud_division_reg[28]  ( .G(n9), .D(N49), .Q(baud_division[28]) );
  DLH_X1 \baud_division_reg[27]  ( .G(n9), .D(N48), .Q(baud_division[27]) );
  DLH_X1 \baud_division_reg[26]  ( .G(n9), .D(N47), .Q(baud_division[26]) );
  DLH_X1 \baud_division_reg[25]  ( .G(n9), .D(N46), .Q(baud_division[25]) );
  DLH_X1 \baud_division_reg[24]  ( .G(n9), .D(N45), .Q(baud_division[24]) );
  DLH_X1 \baud_division_reg[23]  ( .G(n9), .D(N44), .Q(baud_division[23]) );
  DLH_X1 \baud_division_reg[22]  ( .G(n9), .D(N43), .Q(baud_division[22]) );
  DLH_X1 \baud_division_reg[21]  ( .G(n9), .D(N42), .Q(baud_division[21]) );
  DLH_X1 \baud_division_reg[20]  ( .G(n10), .D(N41), .Q(baud_division[20]) );
  DLH_X1 \baud_division_reg[19]  ( .G(n10), .D(N40), .Q(baud_division[19]) );
  DLH_X1 \baud_division_reg[18]  ( .G(n10), .D(N39), .Q(baud_division[18]) );
  DLH_X1 \baud_division_reg[17]  ( .G(n10), .D(N38), .Q(baud_division[17]) );
  DLH_X1 \baud_division_reg[16]  ( .G(n10), .D(N37), .Q(baud_division[16]) );
  DLH_X1 \baud_division_reg[15]  ( .G(n10), .D(N36), .Q(baud_division[15]) );
  DLH_X1 \baud_division_reg[14]  ( .G(n10), .D(N35), .Q(baud_division[14]) );
  DLH_X1 \baud_division_reg[13]  ( .G(n10), .D(N34), .Q(baud_division[13]) );
  DLH_X1 \baud_division_reg[12]  ( .G(n10), .D(N33), .Q(baud_division[12]) );
  DLH_X1 \baud_division_reg[11]  ( .G(n10), .D(N32), .Q(baud_division[11]) );
  DLH_X1 \baud_division_reg[10]  ( .G(n10), .D(N31), .Q(baud_division[10]) );
  DLH_X1 \baud_division_reg[9]  ( .G(n11), .D(N30), .Q(baud_division[9]) );
  DLH_X1 \baud_division_reg[8]  ( .G(n11), .D(N29), .Q(baud_division[8]) );
  DLH_X1 \baud_division_reg[7]  ( .G(n11), .D(N28), .Q(baud_division[7]) );
  DLH_X1 \baud_division_reg[6]  ( .G(n11), .D(N27), .Q(baud_division[6]) );
  DLH_X1 \baud_division_reg[5]  ( .G(n11), .D(N26), .Q(baud_division[5]) );
  DLH_X1 \baud_division_reg[4]  ( .G(n11), .D(N25), .Q(baud_division[4]) );
  DLH_X1 \baud_division_reg[3]  ( .G(n11), .D(N24), .Q(baud_division[3]) );
  DLH_X1 \baud_division_reg[2]  ( .G(n11), .D(N23), .Q(baud_division[2]) );
  DLH_X1 \baud_division_reg[1]  ( .G(n11), .D(N22), .Q(baud_division[1]) );
  DLH_X1 \baud_division_reg[0]  ( .G(n11), .D(N21), .Q(baud_division[0]) );
  DLH_X1 \read_data_reg[7]  ( .G(N55), .D(data_in[7]), .Q(read_data[7]) );
  DLH_X1 \read_data_reg[6]  ( .G(N55), .D(data_in[6]), .Q(read_data[6]) );
  DLH_X1 \read_data_reg[5]  ( .G(N55), .D(data_in[5]), .Q(read_data[5]) );
  DLH_X1 \read_data_reg[4]  ( .G(N55), .D(data_in[4]), .Q(read_data[4]) );
  DLH_X1 \read_data_reg[3]  ( .G(N55), .D(data_in[3]), .Q(read_data[3]) );
  DLH_X1 \read_data_reg[2]  ( .G(N55), .D(data_in[2]), .Q(read_data[2]) );
  DLH_X1 \read_data_reg[1]  ( .G(N55), .D(data_in[1]), .Q(read_data[1]) );
  DLH_X1 \read_data_reg[0]  ( .G(N55), .D(data_in[0]), .Q(read_data[0]) );
  DLH_X1 \data_out_reg[7]  ( .G(N54), .D(N28), .Q(data_out[7]) );
  DLH_X1 \data_out_reg[6]  ( .G(N54), .D(N27), .Q(data_out[6]) );
  DLH_X1 \data_out_reg[5]  ( .G(N54), .D(N26), .Q(data_out[5]) );
  DLH_X1 \data_out_reg[4]  ( .G(N54), .D(N25), .Q(data_out[4]) );
  DLH_X1 \data_out_reg[3]  ( .G(N54), .D(N24), .Q(data_out[3]) );
  DLH_X1 \data_out_reg[2]  ( .G(N54), .D(N23), .Q(data_out[2]) );
  DLH_X1 \data_out_reg[1]  ( .G(N54), .D(N22), .Q(data_out[1]) );
  DLH_X1 \data_out_reg[0]  ( .G(N54), .D(N21), .Q(data_out[0]) );
  NAND3_X1 U42 ( .A1(address[1]), .A2(n15), .A3(we), .ZN(n4) );
  NAND3_X1 U43 ( .A1(address[0]), .A2(n14), .A3(we), .ZN(n5) );
  NAND3_X1 U44 ( .A1(n15), .A2(n14), .A3(we), .ZN(n6) );
  BUF_X1 U45 ( .A(N20), .Z(n12) );
  BUF_X1 U46 ( .A(n13), .Z(n7) );
  BUF_X1 U47 ( .A(n13), .Z(n8) );
  BUF_X1 U48 ( .A(n12), .Z(n10) );
  BUF_X1 U49 ( .A(n12), .Z(n9) );
  BUF_X1 U50 ( .A(n12), .Z(n11) );
  NAND2_X1 U51 ( .A1(n7), .A2(n4), .ZN(N54) );
  AND4_X1 U52 ( .A1(re), .A2(address[1]), .A3(address[0]), .A4(n7), .ZN(N55)
         );
  NAND2_X1 U53 ( .A1(n7), .A2(n6), .ZN(N20) );
  AND2_X1 U54 ( .A1(write_data[0]), .A2(n7), .ZN(N21) );
  NAND2_X1 U55 ( .A1(n7), .A2(n5), .ZN(N53) );
  INV_X1 U56 ( .A(rst), .ZN(n13) );
  AND2_X1 U57 ( .A1(write_data[1]), .A2(n7), .ZN(N22) );
  AND2_X1 U58 ( .A1(write_data[2]), .A2(n7), .ZN(N23) );
  AND2_X1 U59 ( .A1(write_data[3]), .A2(n7), .ZN(N24) );
  AND2_X1 U60 ( .A1(write_data[4]), .A2(n7), .ZN(N25) );
  AND2_X1 U61 ( .A1(write_data[5]), .A2(n7), .ZN(N26) );
  AND2_X1 U62 ( .A1(write_data[6]), .A2(n7), .ZN(N27) );
  AND2_X1 U63 ( .A1(write_data[7]), .A2(n8), .ZN(N28) );
  INV_X1 U64 ( .A(address[1]), .ZN(n14) );
  INV_X1 U65 ( .A(address[0]), .ZN(n15) );
  AND2_X1 U66 ( .A1(write_data[8]), .A2(n7), .ZN(N29) );
  AND2_X1 U67 ( .A1(write_data[9]), .A2(n7), .ZN(N30) );
  AND2_X1 U68 ( .A1(write_data[10]), .A2(n7), .ZN(N31) );
  AND2_X1 U69 ( .A1(write_data[11]), .A2(n7), .ZN(N32) );
  AND2_X1 U70 ( .A1(write_data[12]), .A2(n7), .ZN(N33) );
  AND2_X1 U71 ( .A1(write_data[13]), .A2(n7), .ZN(N34) );
  AND2_X1 U72 ( .A1(write_data[14]), .A2(n7), .ZN(N35) );
  AND2_X1 U73 ( .A1(write_data[15]), .A2(n8), .ZN(N36) );
  AND2_X1 U74 ( .A1(write_data[16]), .A2(n8), .ZN(N37) );
  AND2_X1 U75 ( .A1(write_data[17]), .A2(n8), .ZN(N38) );
  AND2_X1 U76 ( .A1(write_data[18]), .A2(n8), .ZN(N39) );
  AND2_X1 U77 ( .A1(write_data[19]), .A2(n8), .ZN(N40) );
  AND2_X1 U78 ( .A1(write_data[20]), .A2(n8), .ZN(N41) );
  AND2_X1 U79 ( .A1(write_data[21]), .A2(n8), .ZN(N42) );
  AND2_X1 U80 ( .A1(write_data[22]), .A2(n8), .ZN(N43) );
  AND2_X1 U81 ( .A1(write_data[23]), .A2(n8), .ZN(N44) );
  AND2_X1 U82 ( .A1(write_data[24]), .A2(n8), .ZN(N45) );
  AND2_X1 U83 ( .A1(write_data[25]), .A2(n8), .ZN(N46) );
  AND2_X1 U84 ( .A1(write_data[26]), .A2(n8), .ZN(N47) );
  AND2_X1 U85 ( .A1(write_data[27]), .A2(n8), .ZN(N48) );
  AND2_X1 U86 ( .A1(write_data[28]), .A2(n8), .ZN(N49) );
  AND2_X1 U87 ( .A1(write_data[29]), .A2(n8), .ZN(N50) );
  AND2_X1 U88 ( .A1(write_data[30]), .A2(n8), .ZN(N51) );
  AND2_X1 U89 ( .A1(write_data[31]), .A2(n7), .ZN(N52) );
  NOR2_X1 \uut_baud_rate/U138  ( .A1(\uut_baud_rate/n144 ), .A2(
        \uut_baud_rate/n143 ), .ZN(\uut_baud_rate/n27 ) );
  AND2_X1 \uut_baud_rate/U137  ( .A1(\uut_baud_rate/n6 ), .A2(
        \uut_baud_rate/N15 ), .ZN(\uut_baud_rate/N80 ) );
  OAI21_X1 \uut_baud_rate/U136  ( .B1(\uut_baud_rate/n143 ), .B2(
        \uut_baud_rate/n140 ), .A(\uut_baud_rate/n139 ), .ZN(
        \uut_baud_rate/n145 ) );
  NAND3_X1 \uut_baud_rate/U135  ( .A1(\uut_baud_rate/n10 ), .A2(
        \uut_baud_rate/N12 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/n139 ) );
  AND2_X1 \uut_baud_rate/U134  ( .A1(\uut_baud_rate/n5 ), .A2(
        \uut_baud_rate/N13 ), .ZN(\uut_baud_rate/N78 ) );
  AND2_X1 \uut_baud_rate/U133  ( .A1(\uut_baud_rate/n38 ), .A2(
        \uut_baud_rate/N14 ), .ZN(\uut_baud_rate/N79 ) );
  AND2_X1 \uut_baud_rate/U132  ( .A1(\uut_baud_rate/n38 ), .A2(
        \uut_baud_rate/N16 ), .ZN(\uut_baud_rate/N81 ) );
  AND2_X1 \uut_baud_rate/U131  ( .A1(\uut_baud_rate/n38 ), .A2(
        \uut_baud_rate/N17 ), .ZN(\uut_baud_rate/N82 ) );
  AND2_X1 \uut_baud_rate/U130  ( .A1(\uut_baud_rate/n5 ), .A2(
        \uut_baud_rate/N18 ), .ZN(\uut_baud_rate/N83 ) );
  AND2_X1 \uut_baud_rate/U129  ( .A1(\uut_baud_rate/n5 ), .A2(
        \uut_baud_rate/N19 ), .ZN(\uut_baud_rate/N84 ) );
  AND2_X1 \uut_baud_rate/U128  ( .A1(\uut_baud_rate/n6 ), .A2(
        \uut_baud_rate/N20 ), .ZN(\uut_baud_rate/N85 ) );
  AND2_X1 \uut_baud_rate/U127  ( .A1(\uut_baud_rate/n37 ), .A2(
        \uut_baud_rate/N21 ), .ZN(\uut_baud_rate/N86 ) );
  AND2_X1 \uut_baud_rate/U126  ( .A1(\uut_baud_rate/n36 ), .A2(
        \uut_baud_rate/N22 ), .ZN(\uut_baud_rate/N87 ) );
  AND2_X1 \uut_baud_rate/U125  ( .A1(\uut_baud_rate/n37 ), .A2(
        \uut_baud_rate/N31 ), .ZN(\uut_baud_rate/N96 ) );
  AND2_X1 \uut_baud_rate/U124  ( .A1(\uut_baud_rate/n79 ), .A2(
        \uut_baud_rate/N33 ), .ZN(\uut_baud_rate/N98 ) );
  AND2_X1 \uut_baud_rate/U123  ( .A1(\uut_baud_rate/n38 ), .A2(
        \uut_baud_rate/N35 ), .ZN(\uut_baud_rate/N100 ) );
  AND2_X1 \uut_baud_rate/U122  ( .A1(\uut_baud_rate/n6 ), .A2(
        \uut_baud_rate/N36 ), .ZN(\uut_baud_rate/N101 ) );
  AND2_X1 \uut_baud_rate/U121  ( .A1(\uut_baud_rate/n5 ), .A2(
        \uut_baud_rate/N37 ), .ZN(\uut_baud_rate/N102 ) );
  AND2_X1 \uut_baud_rate/U120  ( .A1(\uut_baud_rate/n38 ), .A2(
        \uut_baud_rate/N38 ), .ZN(\uut_baud_rate/N103 ) );
  AND2_X1 \uut_baud_rate/U119  ( .A1(\uut_baud_rate/n6 ), .A2(
        \uut_baud_rate/N39 ), .ZN(\uut_baud_rate/N104 ) );
  AND2_X1 \uut_baud_rate/U118  ( .A1(\uut_baud_rate/n5 ), .A2(
        \uut_baud_rate/N40 ), .ZN(\uut_baud_rate/N105 ) );
  AND2_X1 \uut_baud_rate/U117  ( .A1(\uut_baud_rate/n6 ), .A2(
        \uut_baud_rate/N41 ), .ZN(\uut_baud_rate/N106 ) );
  AND2_X1 \uut_baud_rate/U116  ( .A1(\uut_baud_rate/n6 ), .A2(
        \uut_baud_rate/N42 ), .ZN(\uut_baud_rate/N107 ) );
  AND2_X1 \uut_baud_rate/U115  ( .A1(\uut_baud_rate/N43 ), .A2(
        \uut_baud_rate/n79 ), .ZN(\uut_baud_rate/N108 ) );
  NAND3_X1 \uut_baud_rate/U114  ( .A1(\uut_baud_rate/n138 ), .A2(
        \uut_baud_rate/n136 ), .A3(\uut_baud_rate/n137 ), .ZN(
        \uut_baud_rate/n142 ) );
  INV_X1 \uut_baud_rate/U113  ( .A(\uut_baud_rate/n143 ), .ZN(
        \uut_baud_rate/n104 ) );
  OAI21_X1 \uut_baud_rate/U112  ( .B1(\uut_baud_rate/n102 ), .B2(
        \uut_baud_rate/n101 ), .A(\uut_baud_rate/n100 ), .ZN(
        \uut_baud_rate/n143 ) );
  NAND4_X1 \uut_baud_rate/U111  ( .A1(\uut_baud_rate/n21 ), .A2(
        \uut_baud_rate/n22 ), .A3(\uut_baud_rate/n19 ), .A4(
        \uut_baud_rate/n20 ), .ZN(\uut_baud_rate/n101 ) );
  NAND4_X1 \uut_baud_rate/U110  ( .A1(\uut_baud_rate/n25 ), .A2(
        \uut_baud_rate/n26 ), .A3(\uut_baud_rate/n23 ), .A4(
        \uut_baud_rate/n24 ), .ZN(\uut_baud_rate/n102 ) );
  AND2_X1 \uut_baud_rate/U109  ( .A1(\uut_baud_rate/temp_en ), .A2(
        \uut_baud_rate/n100 ), .ZN(\uut_baud_rate/n28 ) );
  INV_X1 \uut_baud_rate/U108  ( .A(rst), .ZN(\uut_baud_rate/n100 ) );
  NOR2_X1 \uut_baud_rate/U107  ( .A1(rst), .A2(\uut_baud_rate/n103 ), .ZN(
        \uut_baud_rate/n29 ) );
  INV_X1 \uut_baud_rate/U106  ( .A(enable), .ZN(\uut_baud_rate/n103 ) );
  XNOR2_X1 \uut_baud_rate/U105  ( .A(\uut_baud_rate/baud_count [6]), .B(
        baud_division[6]), .ZN(\uut_baud_rate/n122 ) );
  XNOR2_X1 \uut_baud_rate/U104  ( .A(baud_division[3]), .B(\uut_baud_rate/n34 ), .ZN(\uut_baud_rate/n125 ) );
  XNOR2_X1 \uut_baud_rate/U103  ( .A(\uut_baud_rate/baud_count [8]), .B(
        baud_division[8]), .ZN(\uut_baud_rate/n117 ) );
  XNOR2_X1 \uut_baud_rate/U102  ( .A(baud_division[4]), .B(\uut_baud_rate/n4 ), 
        .ZN(\uut_baud_rate/n115 ) );
  XNOR2_X1 \uut_baud_rate/U101  ( .A(\uut_baud_rate/n2 ), .B(baud_division[7]), 
        .ZN(\uut_baud_rate/n116 ) );
  XNOR2_X1 \uut_baud_rate/U100  ( .A(\uut_baud_rate/n16 ), .B(baud_division[9]), .ZN(\uut_baud_rate/n118 ) );
  INV_X2 \uut_baud_rate/U99  ( .A(\uut_baud_rate/n94 ), .ZN(
        \uut_baud_rate/n95 ) );
  INV_X2 \uut_baud_rate/U98  ( .A(\uut_baud_rate/n92 ), .ZN(
        \uut_baud_rate/n93 ) );
  INV_X2 \uut_baud_rate/U97  ( .A(\uut_baud_rate/n88 ), .ZN(
        \uut_baud_rate/n89 ) );
  INV_X1 \uut_baud_rate/U96  ( .A(\uut_baud_rate/n86 ), .ZN(
        \uut_baud_rate/n87 ) );
  INV_X2 \uut_baud_rate/U95  ( .A(\uut_baud_rate/n84 ), .ZN(
        \uut_baud_rate/n85 ) );
  INV_X2 \uut_baud_rate/U94  ( .A(\uut_baud_rate/n82 ), .ZN(
        \uut_baud_rate/n83 ) );
  INV_X1 \uut_baud_rate/U93  ( .A(\uut_baud_rate/n80 ), .ZN(
        \uut_baud_rate/n81 ) );
  XNOR2_X1 \uut_baud_rate/U92  ( .A(\uut_baud_rate/baud_count [20]), .B(
        baud_division[20]), .ZN(\uut_baud_rate/n129 ) );
  INV_X1 \uut_baud_rate/U91  ( .A(\uut_baud_rate/n75 ), .ZN(
        \uut_baud_rate/n76 ) );
  XNOR2_X1 \uut_baud_rate/U90  ( .A(\uut_baud_rate/baud_count [31]), .B(
        baud_division[31]), .ZN(\uut_baud_rate/n134 ) );
  XNOR2_X1 \uut_baud_rate/U89  ( .A(\uut_baud_rate/baud_count [21]), .B(
        baud_division[21]), .ZN(\uut_baud_rate/n130 ) );
  XNOR2_X1 \uut_baud_rate/U88  ( .A(\uut_baud_rate/baud_count [22]), .B(
        baud_division[22]), .ZN(\uut_baud_rate/n131 ) );
  INV_X1 \uut_baud_rate/U87  ( .A(\uut_baud_rate/n73 ), .ZN(
        \uut_baud_rate/n74 ) );
  XNOR2_X1 \uut_baud_rate/U86  ( .A(\uut_baud_rate/baud_count [30]), .B(
        baud_division[30]), .ZN(\uut_baud_rate/n133 ) );
  XNOR2_X1 \uut_baud_rate/U85  ( .A(\uut_baud_rate/baud_count [23]), .B(
        baud_division[23]), .ZN(\uut_baud_rate/n132 ) );
  NOR4_X1 \uut_baud_rate/U75  ( .A1(baud_division[1]), .A2(baud_division[19]), 
        .A3(baud_division[18]), .A4(baud_division[17]), .ZN(
        \uut_baud_rate/n21 ) );
  NOR4_X1 \uut_baud_rate/U74  ( .A1(baud_division[9]), .A2(baud_division[8]), 
        .A3(baud_division[7]), .A4(baud_division[6]), .ZN(\uut_baud_rate/n26 )
         );
  NOR4_X1 \uut_baud_rate/U73  ( .A1(baud_division[23]), .A2(baud_division[22]), 
        .A3(baud_division[21]), .A4(baud_division[20]), .ZN(
        \uut_baud_rate/n22 ) );
  NOR4_X1 \uut_baud_rate/U72  ( .A1(baud_division[27]), .A2(baud_division[26]), 
        .A3(baud_division[25]), .A4(baud_division[24]), .ZN(
        \uut_baud_rate/n23 ) );
  NOR4_X1 \uut_baud_rate/U71  ( .A1(baud_division[12]), .A2(baud_division[11]), 
        .A3(baud_division[10]), .A4(baud_division[0]), .ZN(\uut_baud_rate/n19 ) );
  NOR4_X1 \uut_baud_rate/U70  ( .A1(baud_division[16]), .A2(baud_division[15]), 
        .A3(baud_division[14]), .A4(baud_division[13]), .ZN(
        \uut_baud_rate/n20 ) );
  NOR4_X1 \uut_baud_rate/U69  ( .A1(baud_division[30]), .A2(baud_division[2]), 
        .A3(baud_division[29]), .A4(baud_division[28]), .ZN(
        \uut_baud_rate/n24 ) );
  NOR4_X1 \uut_baud_rate/U68  ( .A1(baud_division[5]), .A2(baud_division[4]), 
        .A3(baud_division[3]), .A4(baud_division[31]), .ZN(\uut_baud_rate/n25 ) );
  INV_X1 \uut_baud_rate/U67  ( .A(\uut_baud_rate/n77 ), .ZN(
        \uut_baud_rate/n78 ) );
  NAND2_X1 \uut_baud_rate/U66  ( .A1(\uut_baud_rate/n63 ), .A2(enable), .ZN(
        \uut_baud_rate/n140 ) );
  XNOR2_X1 \uut_baud_rate/U65  ( .A(baud_division[0]), .B(
        \uut_baud_rate/baud_count [0]), .ZN(\uut_baud_rate/n124 ) );
  XNOR2_X1 \uut_baud_rate/U64  ( .A(baud_division[1]), .B(
        \uut_baud_rate/baud_count [1]), .ZN(\uut_baud_rate/n126 ) );
  XNOR2_X1 \uut_baud_rate/U63  ( .A(\uut_baud_rate/baud_count [10]), .B(
        baud_division[10]), .ZN(\uut_baud_rate/n119 ) );
  XNOR2_X1 \uut_baud_rate/U62  ( .A(\uut_baud_rate/baud_count [24]), .B(
        baud_division[24]), .ZN(\uut_baud_rate/n120 ) );
  XNOR2_X1 \uut_baud_rate/U61  ( .A(\uut_baud_rate/baud_count [25]), .B(
        baud_division[25]), .ZN(\uut_baud_rate/n121 ) );
  INV_X1 \uut_baud_rate/U60  ( .A(\uut_baud_rate/n98 ), .ZN(
        \uut_baud_rate/n99 ) );
  XNOR2_X1 \uut_baud_rate/U59  ( .A(\uut_baud_rate/baud_count [19]), .B(
        baud_division[19]), .ZN(\uut_baud_rate/n135 ) );
  MUX2_X1 \uut_baud_rate/U58  ( .A(\uut_baud_rate/n141 ), .B(
        \uut_baud_rate/n35 ), .S(\uut_baud_rate/n140 ), .Z(
        \uut_baud_rate/n144 ) );
  XNOR2_X1 \uut_baud_rate/U57  ( .A(\uut_baud_rate/baud_count [28]), .B(
        baud_division[28]), .ZN(\uut_baud_rate/n107 ) );
  XNOR2_X1 \uut_baud_rate/U56  ( .A(\uut_baud_rate/baud_count [29]), .B(
        baud_division[29]), .ZN(\uut_baud_rate/n108 ) );
  XNOR2_X1 \uut_baud_rate/U55  ( .A(baud_division[27]), .B(
        \uut_baud_rate/baud_count [27]), .ZN(\uut_baud_rate/n113 ) );
  XOR2_X1 \uut_baud_rate/U54  ( .A(baud_division[26]), .B(\uut_baud_rate/n90 ), 
        .Z(\uut_baud_rate/n111 ) );
  AND2_X2 \uut_baud_rate/U53  ( .A1(\uut_baud_rate/n104 ), .A2(
        \uut_baud_rate/n140 ), .ZN(\uut_baud_rate/n61 ) );
  AND3_X2 \uut_baud_rate/U52  ( .A1(\uut_baud_rate/n135 ), .A2(
        \uut_baud_rate/n134 ), .A3(\uut_baud_rate/n133 ), .ZN(
        \uut_baud_rate/n56 ) );
  AND2_X1 \uut_baud_rate/U51  ( .A1(\uut_baud_rate/n128 ), .A2(
        \uut_baud_rate/n127 ), .ZN(\uut_baud_rate/n54 ) );
  AND4_X2 \uut_baud_rate/U50  ( .A1(\uut_baud_rate/n126 ), .A2(
        \uut_baud_rate/n125 ), .A3(\uut_baud_rate/n124 ), .A4(
        \uut_baud_rate/n123 ), .ZN(\uut_baud_rate/n53 ) );
  AND4_X2 \uut_baud_rate/U49  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/n54 ), .A3(\uut_baud_rate/n55 ), .A4(
        \uut_baud_rate/n56 ), .ZN(\uut_baud_rate/n136 ) );
  CLKBUF_X3 \uut_baud_rate/U48  ( .A(\uut_baud_rate/baud_count [20]), .Z(
        \uut_baud_rate/n51 ) );
  AND2_X1 \uut_baud_rate/U47  ( .A1(\uut_baud_rate/n106 ), .A2(
        \uut_baud_rate/n105 ), .ZN(\uut_baud_rate/n50 ) );
  XOR2_X1 \uut_baud_rate/U46  ( .A(baud_division[12]), .B(\uut_baud_rate/n62 ), 
        .Z(\uut_baud_rate/n49 ) );
  CLKBUF_X3 \uut_baud_rate/U45  ( .A(\uut_baud_rate/baud_count [22]), .Z(
        \uut_baud_rate/n45 ) );
  NAND3_X1 \uut_baud_rate/U44  ( .A1(\uut_baud_rate/n42 ), .A2(
        \uut_baud_rate/n137 ), .A3(\uut_baud_rate/n7 ), .ZN(
        \uut_baud_rate/n43 ) );
  AND4_X1 \uut_baud_rate/U43  ( .A1(\uut_baud_rate/n132 ), .A2(
        \uut_baud_rate/n131 ), .A3(\uut_baud_rate/n130 ), .A4(
        \uut_baud_rate/n129 ), .ZN(\uut_baud_rate/n55 ) );
  INV_X1 \uut_baud_rate/U42  ( .A(\uut_baud_rate/n96 ), .ZN(
        \uut_baud_rate/n97 ) );
  AND3_X1 \uut_baud_rate/U41  ( .A1(\uut_baud_rate/n122 ), .A2(
        \uut_baud_rate/n121 ), .A3(\uut_baud_rate/n120 ), .ZN(
        \uut_baud_rate/n41 ) );
  AND4_X1 \uut_baud_rate/U40  ( .A1(\uut_baud_rate/n119 ), .A2(
        \uut_baud_rate/n118 ), .A3(\uut_baud_rate/n117 ), .A4(
        \uut_baud_rate/n116 ), .ZN(\uut_baud_rate/n40 ) );
  AND2_X1 \uut_baud_rate/U39  ( .A1(\uut_baud_rate/n115 ), .A2(
        \uut_baud_rate/n114 ), .ZN(\uut_baud_rate/n39 ) );
  AND2_X1 \uut_baud_rate/U38  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/n79 ) );
  AND2_X1 \uut_baud_rate/U37  ( .A1(\uut_baud_rate/n35 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/n37 ) );
  AND2_X1 \uut_baud_rate/U36  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/n36 ) );
  NAND3_X1 \uut_baud_rate/U35  ( .A1(\uut_baud_rate/n42 ), .A2(
        \uut_baud_rate/n137 ), .A3(\uut_baud_rate/n136 ), .ZN(
        \uut_baud_rate/n35 ) );
  AND4_X2 \uut_baud_rate/U34  ( .A1(\uut_baud_rate/n8 ), .A2(
        \uut_baud_rate/n48 ), .A3(\uut_baud_rate/n49 ), .A4(
        \uut_baud_rate/n50 ), .ZN(\uut_baud_rate/n42 ) );
  INV_X1 \uut_baud_rate/U33  ( .A(\uut_baud_rate/n33 ), .ZN(
        \uut_baud_rate/n34 ) );
  XOR2_X1 \uut_baud_rate/U32  ( .A(\uut_baud_rate/n57 ), .B(baud_division[13]), 
        .Z(\uut_baud_rate/n110 ) );
  AND4_X2 \uut_baud_rate/U31  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n48 ), .A3(\uut_baud_rate/n49 ), .A4(
        \uut_baud_rate/n50 ), .ZN(\uut_baud_rate/n138 ) );
  AND3_X2 \uut_baud_rate/U30  ( .A1(\uut_baud_rate/n39 ), .A2(
        \uut_baud_rate/n40 ), .A3(\uut_baud_rate/n41 ), .ZN(
        \uut_baud_rate/n137 ) );
  XOR2_X1 \uut_baud_rate/U29  ( .A(baud_division[2]), .B(\uut_baud_rate/n32 ), 
        .Z(\uut_baud_rate/n123 ) );
  XOR2_X1 \uut_baud_rate/U28  ( .A(baud_division[5]), .B(\uut_baud_rate/n31 ), 
        .Z(\uut_baud_rate/n114 ) );
  XNOR2_X1 \uut_baud_rate/U27  ( .A(\uut_baud_rate/n52 ), .B(
        \uut_baud_rate/n30 ), .ZN(\uut_baud_rate/n109 ) );
  XNOR2_X1 \uut_baud_rate/U26  ( .A(\uut_baud_rate/n18 ), .B(
        \uut_baud_rate/n44 ), .ZN(\uut_baud_rate/n127 ) );
  XNOR2_X1 \uut_baud_rate/U25  ( .A(\uut_baud_rate/n17 ), .B(
        \uut_baud_rate/n46 ), .ZN(\uut_baud_rate/n128 ) );
  INV_X1 \uut_baud_rate/U24  ( .A(\uut_baud_rate/n15 ), .ZN(
        \uut_baud_rate/n16 ) );
  INV_X1 \uut_baud_rate/U23  ( .A(\uut_baud_rate/n14 ), .ZN(
        \uut_baud_rate/n112 ) );
  XNOR2_X1 \uut_baud_rate/U22  ( .A(\uut_baud_rate/n58 ), .B(baud_division[11]), .ZN(\uut_baud_rate/n14 ) );
  AND2_X1 \uut_baud_rate/U21  ( .A1(\uut_baud_rate/n37 ), .A2(
        \uut_baud_rate/N25 ), .ZN(\uut_baud_rate/n13 ) );
  XNOR2_X1 \uut_baud_rate/U19  ( .A(\uut_baud_rate/n11 ), .B(
        \uut_baud_rate/n59 ), .ZN(\uut_baud_rate/n105 ) );
  NAND3_X1 \uut_baud_rate/U18  ( .A1(\uut_baud_rate/n138 ), .A2(
        \uut_baud_rate/n7 ), .A3(\uut_baud_rate/n137 ), .ZN(
        \uut_baud_rate/n10 ) );
  XNOR2_X1 \uut_baud_rate/U17  ( .A(\uut_baud_rate/n9 ), .B(
        \uut_baud_rate/n60 ), .ZN(\uut_baud_rate/n106 ) );
  AND4_X1 \uut_baud_rate/U16  ( .A1(\uut_baud_rate/n112 ), .A2(
        \uut_baud_rate/n110 ), .A3(\uut_baud_rate/n111 ), .A4(
        \uut_baud_rate/n113 ), .ZN(\uut_baud_rate/n8 ) );
  AND4_X2 \uut_baud_rate/U15  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/n54 ), .A3(\uut_baud_rate/n55 ), .A4(
        \uut_baud_rate/n56 ), .ZN(\uut_baud_rate/n7 ) );
  AND2_X1 \uut_baud_rate/U14  ( .A1(\uut_baud_rate/n142 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/n38 ) );
  AND2_X1 \uut_baud_rate/U13  ( .A1(\uut_baud_rate/n142 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/n6 ) );
  AND2_X1 \uut_baud_rate/U12  ( .A1(\uut_baud_rate/n142 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/n5 ) );
  AND4_X1 \uut_baud_rate/U11  ( .A1(\uut_baud_rate/n112 ), .A2(
        \uut_baud_rate/n110 ), .A3(\uut_baud_rate/n111 ), .A4(
        \uut_baud_rate/n113 ), .ZN(\uut_baud_rate/n47 ) );
  INV_X1 \uut_baud_rate/U10  ( .A(\uut_baud_rate/n3 ), .ZN(\uut_baud_rate/n4 )
         );
  INV_X1 \uut_baud_rate/U9  ( .A(\uut_baud_rate/n1 ), .ZN(\uut_baud_rate/n2 )
         );
  INV_X1 \uut_baud_rate/U8  ( .A(baud_division[17]), .ZN(\uut_baud_rate/n17 )
         );
  INV_X1 \uut_baud_rate/U7  ( .A(baud_division[14]), .ZN(\uut_baud_rate/n9 )
         );
  INV_X1 \uut_baud_rate/U6  ( .A(baud_division[18]), .ZN(\uut_baud_rate/n18 )
         );
  INV_X1 \uut_baud_rate/U5  ( .A(baud_division[15]), .ZN(\uut_baud_rate/n11 )
         );
  INV_X1 \uut_baud_rate/U4  ( .A(baud_division[16]), .ZN(\uut_baud_rate/n30 )
         );
  AND3_X2 \uut_baud_rate/U3  ( .A1(\uut_baud_rate/n109 ), .A2(
        \uut_baud_rate/n108 ), .A3(\uut_baud_rate/n107 ), .ZN(
        \uut_baud_rate/n48 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[20]  ( .D(1'b0), .SI(
        \uut_baud_rate/n36 ), .SE(\uut_baud_rate/N32 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [20]) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[22]  ( .D(1'b0), .SI(
        \uut_baud_rate/n79 ), .SE(\uut_baud_rate/N34 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [22]) );
  DFFRS_X1 \uut_baud_rate/baud_count_reg[8]  ( .D(\uut_baud_rate/N85 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [8]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[13]  ( .D(\uut_baud_rate/n13 ), .CK(clk), .Q(\uut_baud_rate/baud_count [13]), .QN(\uut_baud_rate/n57 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[26]  ( .D(\uut_baud_rate/N103 ), .CK(
        clk), .Q(\uut_baud_rate/n91 ), .QN(\uut_baud_rate/n90 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[12]  ( .D(1'b0), .SI(
        \uut_baud_rate/n36 ), .SE(\uut_baud_rate/N24 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [12]), .QN(\uut_baud_rate/n62 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[15]  ( .D(1'b0), .SI(
        \uut_baud_rate/n79 ), .SE(\uut_baud_rate/N27 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [15]), .QN(\uut_baud_rate/n59 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[16]  ( .D(1'b0), .SI(
        \uut_baud_rate/n36 ), .SE(\uut_baud_rate/N28 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [16]), .QN(\uut_baud_rate/n52 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[11]  ( .D(1'b0), .SI(
        \uut_baud_rate/n79 ), .SE(\uut_baud_rate/N23 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [11]), .QN(\uut_baud_rate/n58 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[14]  ( .D(1'b0), .SI(
        \uut_baud_rate/n36 ), .SE(\uut_baud_rate/N26 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [14]), .QN(\uut_baud_rate/n60 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[18]  ( .D(1'b0), .SI(
        \uut_baud_rate/n37 ), .SE(\uut_baud_rate/N30 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [18]), .QN(\uut_baud_rate/n44 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[17]  ( .D(1'b0), .SI(
        \uut_baud_rate/n37 ), .SE(\uut_baud_rate/N29 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [17]), .QN(\uut_baud_rate/n46 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[3]  ( .D(\uut_baud_rate/N80 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [3]), .QN(\uut_baud_rate/n33 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[6]  ( .D(\uut_baud_rate/N83 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [6]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[2]  ( .D(\uut_baud_rate/N79 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [2]), .QN(\uut_baud_rate/n32 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[4]  ( .D(\uut_baud_rate/N81 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [4]), .QN(\uut_baud_rate/n3 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[5]  ( .D(\uut_baud_rate/N82 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [5]), .QN(\uut_baud_rate/n31 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[7]  ( .D(\uut_baud_rate/N84 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [7]), .QN(\uut_baud_rate/n1 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[9]  ( .D(\uut_baud_rate/N86 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [9]), .QN(\uut_baud_rate/n15 ) );
  DFF_X1 \uut_baud_rate/baud_tick_reg  ( .D(\uut_baud_rate/n27 ), .CK(clk), 
        .Q(baud_tick), .QN(\uut_baud_rate/n141 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[23]  ( .D(\uut_baud_rate/N100 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [23]), .QN(\uut_baud_rate/n88 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[24]  ( .D(\uut_baud_rate/N101 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [24]), .QN(\uut_baud_rate/n84 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[25]  ( .D(\uut_baud_rate/N102 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [25]), .QN(\uut_baud_rate/n82 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[27]  ( .D(\uut_baud_rate/N104 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [27]), .QN(\uut_baud_rate/n86 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[28]  ( .D(\uut_baud_rate/N105 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [28]), .QN(\uut_baud_rate/n77 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[29]  ( .D(\uut_baud_rate/N106 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [29]), .QN(\uut_baud_rate/n75 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[30]  ( .D(\uut_baud_rate/N107 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [30]), .QN(\uut_baud_rate/n80 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[1]  ( .D(\uut_baud_rate/N78 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [1]), .QN(\uut_baud_rate/n98 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[10]  ( .D(\uut_baud_rate/N87 ), .CK(clk), .Q(\uut_baud_rate/baud_count [10]), .QN(\uut_baud_rate/n96 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[19]  ( .D(\uut_baud_rate/N96 ), .CK(clk), .Q(\uut_baud_rate/baud_count [19]), .QN(\uut_baud_rate/n94 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[21]  ( .D(\uut_baud_rate/N98 ), .CK(clk), .Q(\uut_baud_rate/baud_count [21]), .QN(\uut_baud_rate/n92 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[31]  ( .D(\uut_baud_rate/N108 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [31]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[0]  ( .D(\uut_baud_rate/n145 ), .CK(clk), .Q(\uut_baud_rate/baud_count [0]), .QN(\uut_baud_rate/n73 ) );
  DFF_X1 \uut_baud_rate/delayed_en_reg  ( .D(\uut_baud_rate/n28 ), .CK(clk), 
        .QN(\uut_baud_rate/n63 ) );
  DFF_X1 \uut_baud_rate/temp_en_reg  ( .D(\uut_baud_rate/n29 ), .CK(clk), .Q(
        \uut_baud_rate/temp_en ) );
  NAND3_X1 \uut_baud_rate/add_176/U338  ( .A1(\uut_baud_rate/add_176/n53 ), 
        .A2(\uut_baud_rate/add_176/n31 ), .A3(\uut_baud_rate/add_176/n77 ), 
        .ZN(\uut_baud_rate/add_176/n306 ) );
  NAND3_X1 \uut_baud_rate/add_176/U337  ( .A1(\uut_baud_rate/add_176/n48 ), 
        .A2(\uut_baud_rate/add_176/n15 ), .A3(\uut_baud_rate/add_176/n49 ), 
        .ZN(\uut_baud_rate/add_176/n304 ) );
  NAND3_X1 \uut_baud_rate/add_176/U336  ( .A1(\uut_baud_rate/add_176/n18 ), 
        .A2(\uut_baud_rate/add_176/n13 ), .A3(\uut_baud_rate/add_176/n38 ), 
        .ZN(\uut_baud_rate/add_176/n299 ) );
  NAND3_X1 \uut_baud_rate/add_176/U335  ( .A1(\uut_baud_rate/add_176/n46 ), 
        .A2(\uut_baud_rate/add_176/n15 ), .A3(\uut_baud_rate/add_176/n29 ), 
        .ZN(\uut_baud_rate/add_176/n297 ) );
  NAND3_X1 \uut_baud_rate/add_176/U334  ( .A1(\uut_baud_rate/add_176/n34 ), 
        .A2(\uut_baud_rate/add_176/n48 ), .A3(\uut_baud_rate/add_176/n50 ), 
        .ZN(\uut_baud_rate/add_176/n298 ) );
  NAND3_X1 \uut_baud_rate/add_176/U333  ( .A1(\uut_baud_rate/add_176/n53 ), 
        .A2(\uut_baud_rate/add_176/n72 ), .A3(\uut_baud_rate/add_176/n51 ), 
        .ZN(\uut_baud_rate/add_176/n293 ) );
  NAND3_X1 \uut_baud_rate/add_176/U332  ( .A1(\uut_baud_rate/add_176/n27 ), 
        .A2(\uut_baud_rate/add_176/n15 ), .A3(\uut_baud_rate/add_176/n56 ), 
        .ZN(\uut_baud_rate/add_176/n292 ) );
  NAND2_X1 \uut_baud_rate/add_176/U331  ( .A1(\uut_baud_rate/add_176/n55 ), 
        .A2(\uut_baud_rate/add_176/n16 ), .ZN(\uut_baud_rate/add_176/n288 ) );
  NAND4_X1 \uut_baud_rate/add_176/U330  ( .A1(\uut_baud_rate/add_176/n287 ), 
        .A2(\uut_baud_rate/add_176/n286 ), .A3(\uut_baud_rate/add_176/n89 ), 
        .A4(\uut_baud_rate/add_176/n285 ), .ZN(\uut_baud_rate/add_176/n284 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U329  ( .A(\uut_baud_rate/add_176/n284 ), 
        .B(\uut_baud_rate/add_176/n23 ), .ZN(\uut_baud_rate/N25 ) );
  NAND2_X1 \uut_baud_rate/add_176/U328  ( .A1(\uut_baud_rate/add_176/n2 ), 
        .A2(\uut_baud_rate/add_176/n52 ), .ZN(\uut_baud_rate/add_176/n282 ) );
  NAND2_X1 \uut_baud_rate/add_176/U327  ( .A1(\uut_baud_rate/add_176/n38 ), 
        .A2(\uut_baud_rate/add_176/n35 ), .ZN(\uut_baud_rate/add_176/n283 ) );
  NAND2_X1 \uut_baud_rate/add_176/U326  ( .A1(\uut_baud_rate/add_176/n55 ), 
        .A2(\uut_baud_rate/add_176/n17 ), .ZN(\uut_baud_rate/add_176/n281 ) );
  NAND4_X1 \uut_baud_rate/add_176/U325  ( .A1(\uut_baud_rate/add_176/n278 ), 
        .A2(\uut_baud_rate/add_176/n280 ), .A3(\uut_baud_rate/add_176/n279 ), 
        .A4(\uut_baud_rate/add_176/n277 ), .ZN(\uut_baud_rate/add_176/n276 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U324  ( .A(\uut_baud_rate/add_176/n276 ), 
        .B(\uut_baud_rate/add_176/n1 ), .ZN(\uut_baud_rate/N26 ) );
  NAND2_X1 \uut_baud_rate/add_176/U323  ( .A1(\uut_baud_rate/baud_count [11]), 
        .A2(\uut_baud_rate/add_176/n37 ), .ZN(\uut_baud_rate/add_176/n275 ) );
  NAND2_X1 \uut_baud_rate/add_176/U322  ( .A1(\uut_baud_rate/add_176/n31 ), 
        .A2(\uut_baud_rate/add_176/n49 ), .ZN(\uut_baud_rate/add_176/n273 ) );
  NAND2_X1 \uut_baud_rate/add_176/U321  ( .A1(\uut_baud_rate/add_176/n51 ), 
        .A2(\uut_baud_rate/add_176/n19 ), .ZN(\uut_baud_rate/add_176/n274 ) );
  NAND2_X1 \uut_baud_rate/add_176/U320  ( .A1(\uut_baud_rate/add_176/n55 ), 
        .A2(\uut_baud_rate/add_176/n16 ), .ZN(\uut_baud_rate/add_176/n271 ) );
  NAND2_X1 \uut_baud_rate/add_176/U319  ( .A1(\uut_baud_rate/add_176/n48 ), 
        .A2(\uut_baud_rate/add_176/n45 ), .ZN(\uut_baud_rate/add_176/n272 ) );
  NAND4_X1 \uut_baud_rate/add_176/U318  ( .A1(\uut_baud_rate/add_176/n270 ), 
        .A2(\uut_baud_rate/add_176/n269 ), .A3(\uut_baud_rate/add_176/n267 ), 
        .A4(\uut_baud_rate/add_176/n268 ), .ZN(\uut_baud_rate/add_176/n266 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U317  ( .A(\uut_baud_rate/add_176/n266 ), 
        .B(\uut_baud_rate/baud_count [15]), .ZN(\uut_baud_rate/N27 ) );
  NAND2_X1 \uut_baud_rate/add_176/U316  ( .A1(\uut_baud_rate/add_176/n24 ), 
        .A2(\uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/add_176/n264 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U315  ( .A1(\uut_baud_rate/baud_count [15]), 
        .A2(\uut_baud_rate/baud_count [14]), .ZN(\uut_baud_rate/add_176/n265 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U314  ( .A1(\uut_baud_rate/add_176/n54 ), 
        .A2(\uut_baud_rate/add_176/n77 ), .ZN(\uut_baud_rate/add_176/n263 ) );
  NAND2_X1 \uut_baud_rate/add_176/U313  ( .A1(\uut_baud_rate/add_176/n31 ), 
        .A2(\uut_baud_rate/add_176/n49 ), .ZN(\uut_baud_rate/add_176/n261 ) );
  NAND2_X1 \uut_baud_rate/add_176/U312  ( .A1(\uut_baud_rate/add_176/n28 ), 
        .A2(\uut_baud_rate/add_176/n19 ), .ZN(\uut_baud_rate/add_176/n262 ) );
  NAND2_X1 \uut_baud_rate/add_176/U311  ( .A1(\uut_baud_rate/add_176/n48 ), 
        .A2(\uut_baud_rate/add_176/n68 ), .ZN(\uut_baud_rate/add_176/n260 ) );
  NAND4_X1 \uut_baud_rate/add_176/U310  ( .A1(\uut_baud_rate/add_176/n259 ), 
        .A2(\uut_baud_rate/add_176/n258 ), .A3(\uut_baud_rate/add_176/n256 ), 
        .A4(\uut_baud_rate/add_176/n257 ), .ZN(\uut_baud_rate/add_176/n255 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U309  ( .A(\uut_baud_rate/add_176/n255 ), 
        .B(\uut_baud_rate/baud_count [16]), .ZN(\uut_baud_rate/N28 ) );
  NAND4_X1 \uut_baud_rate/add_176/U308  ( .A1(\uut_baud_rate/baud_count [12]), 
        .A2(\uut_baud_rate/baud_count [11]), .A3(\uut_baud_rate/add_176/n38 ), 
        .A4(\uut_baud_rate/add_176/n36 ), .ZN(\uut_baud_rate/add_176/n253 ) );
  NAND4_X1 \uut_baud_rate/add_176/U307  ( .A1(\uut_baud_rate/baud_count [16]), 
        .A2(\uut_baud_rate/baud_count [15]), .A3(
        \uut_baud_rate/baud_count [14]), .A4(\uut_baud_rate/add_176/n23 ), 
        .ZN(\uut_baud_rate/add_176/n254 ) );
  NOR2_X1 \uut_baud_rate/add_176/U306  ( .A1(\uut_baud_rate/add_176/n253 ), 
        .A2(\uut_baud_rate/add_176/n254 ), .ZN(\uut_baud_rate/add_176/n250 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U305  ( .A1(\uut_baud_rate/add_176/n53 ), 
        .A2(\uut_baud_rate/add_176/n20 ), .A3(\uut_baud_rate/add_176/n19 ), 
        .A4(\uut_baud_rate/add_176/n34 ), .ZN(\uut_baud_rate/add_176/n252 ) );
  NOR2_X1 \uut_baud_rate/add_176/U304  ( .A1(\uut_baud_rate/add_176/n252 ), 
        .A2(\uut_baud_rate/add_176/n237 ), .ZN(\uut_baud_rate/add_176/n251 )
         );
  NAND3_X1 \uut_baud_rate/add_176/U303  ( .A1(\uut_baud_rate/add_176/n251 ), 
        .A2(\uut_baud_rate/add_176/n250 ), .A3(\uut_baud_rate/add_176/n249 ), 
        .ZN(\uut_baud_rate/add_176/n248 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U302  ( .A(\uut_baud_rate/add_176/n248 ), 
        .B(\uut_baud_rate/baud_count [17]), .ZN(\uut_baud_rate/N29 ) );
  NAND3_X1 \uut_baud_rate/add_176/U301  ( .A1(\uut_baud_rate/add_176/n50 ), 
        .A2(\uut_baud_rate/add_176/n33 ), .A3(\uut_baud_rate/add_176/n17 ), 
        .ZN(\uut_baud_rate/add_176/n241 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U300  ( .A(\uut_baud_rate/add_176/n240 ), 
        .B(\uut_baud_rate/baud_count [18]), .ZN(\uut_baud_rate/N30 ) );
  NAND3_X1 \uut_baud_rate/add_176/U299  ( .A1(\uut_baud_rate/add_176/n35 ), 
        .A2(\uut_baud_rate/add_176/n3 ), .A3(\uut_baud_rate/add_176/n31 ), 
        .ZN(\uut_baud_rate/add_176/n238 ) );
  NAND2_X1 \uut_baud_rate/add_176/U298  ( .A1(\uut_baud_rate/add_176/n19 ), 
        .A2(\uut_baud_rate/add_176/n51 ), .ZN(\uut_baud_rate/add_176/n239 ) );
  NAND3_X1 \uut_baud_rate/add_176/U297  ( .A1(\uut_baud_rate/add_176/n50 ), 
        .A2(\uut_baud_rate/add_176/n43 ), .A3(\uut_baud_rate/add_176/n17 ), 
        .ZN(\uut_baud_rate/add_176/n236 ) );
  NAND2_X1 \uut_baud_rate/add_176/U296  ( .A1(\uut_baud_rate/add_176/n55 ), 
        .A2(\uut_baud_rate/add_176/n26 ), .ZN(\uut_baud_rate/add_176/n237 ) );
  NAND3_X1 \uut_baud_rate/add_176/U295  ( .A1(\uut_baud_rate/n95 ), .A2(
        \uut_baud_rate/baud_count [18]), .A3(\uut_baud_rate/baud_count [15]), 
        .ZN(\uut_baud_rate/add_176/n231 ) );
  NAND2_X1 \uut_baud_rate/add_176/U294  ( .A1(\uut_baud_rate/baud_count [16]), 
        .A2(\uut_baud_rate/baud_count [17]), .ZN(\uut_baud_rate/add_176/n232 )
         );
  NAND3_X1 \uut_baud_rate/add_176/U293  ( .A1(\uut_baud_rate/baud_count [14]), 
        .A2(\uut_baud_rate/add_176/n23 ), .A3(\uut_baud_rate/add_176/n37 ), 
        .ZN(\uut_baud_rate/add_176/n230 ) );
  NAND3_X1 \uut_baud_rate/add_176/U292  ( .A1(\uut_baud_rate/add_176/n14 ), 
        .A2(\uut_baud_rate/add_176/n36 ), .A3(\uut_baud_rate/add_176/n69 ), 
        .ZN(\uut_baud_rate/add_176/n228 ) );
  NAND2_X1 \uut_baud_rate/add_176/U291  ( .A1(\uut_baud_rate/add_176/n19 ), 
        .A2(\uut_baud_rate/add_176/n52 ), .ZN(\uut_baud_rate/add_176/n229 ) );
  NAND3_X1 \uut_baud_rate/add_176/U290  ( .A1(\uut_baud_rate/add_176/n50 ), 
        .A2(\uut_baud_rate/add_176/n48 ), .A3(\uut_baud_rate/add_176/n58 ), 
        .ZN(\uut_baud_rate/add_176/n226 ) );
  NAND2_X1 \uut_baud_rate/add_176/U289  ( .A1(\uut_baud_rate/add_176/n55 ), 
        .A2(\uut_baud_rate/add_176/n45 ), .ZN(\uut_baud_rate/add_176/n227 ) );
  NAND4_X1 \uut_baud_rate/add_176/U288  ( .A1(\uut_baud_rate/add_176/n224 ), 
        .A2(\uut_baud_rate/add_176/n225 ), .A3(\uut_baud_rate/add_176/n223 ), 
        .A4(\uut_baud_rate/add_176/n222 ), .ZN(\uut_baud_rate/add_176/n221 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U287  ( .A(\uut_baud_rate/add_176/n221 ), 
        .B(\uut_baud_rate/n51 ), .ZN(\uut_baud_rate/N32 ) );
  NAND3_X1 \uut_baud_rate/add_176/U286  ( .A1(\uut_baud_rate/n95 ), .A2(
        \uut_baud_rate/baud_count [16]), .A3(\uut_baud_rate/n51 ), .ZN(
        \uut_baud_rate/add_176/n219 ) );
  NAND3_X1 \uut_baud_rate/add_176/U285  ( .A1(\uut_baud_rate/baud_count [14]), 
        .A2(\uut_baud_rate/baud_count [11]), .A3(
        \uut_baud_rate/baud_count [15]), .ZN(\uut_baud_rate/add_176/n217 ) );
  NAND3_X1 \uut_baud_rate/add_176/U284  ( .A1(\uut_baud_rate/add_176/n35 ), 
        .A2(\uut_baud_rate/add_176/n13 ), .A3(\uut_baud_rate/add_176/n38 ), 
        .ZN(\uut_baud_rate/add_176/n215 ) );
  NAND3_X1 \uut_baud_rate/add_176/U283  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/baud_count [17]), .A3(\uut_baud_rate/n93 ), .ZN(
        \uut_baud_rate/add_176/n208 ) );
  NAND3_X1 \uut_baud_rate/add_176/U282  ( .A1(\uut_baud_rate/add_176/n24 ), 
        .A2(\uut_baud_rate/baud_count [11]), .A3(
        \uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/add_176/n206 ) );
  NAND3_X1 \uut_baud_rate/add_176/U281  ( .A1(\uut_baud_rate/baud_count [16]), 
        .A2(\uut_baud_rate/baud_count [14]), .A3(
        \uut_baud_rate/baud_count [15]), .ZN(\uut_baud_rate/add_176/n207 ) );
  NAND3_X1 \uut_baud_rate/add_176/U280  ( .A1(\uut_baud_rate/add_176/n36 ), 
        .A2(\uut_baud_rate/add_176/n19 ), .A3(\uut_baud_rate/add_176/n38 ), 
        .ZN(\uut_baud_rate/add_176/n205 ) );
  NAND3_X1 \uut_baud_rate/add_176/U279  ( .A1(\uut_baud_rate/add_176/n45 ), 
        .A2(\uut_baud_rate/add_176/n16 ), .A3(\uut_baud_rate/add_176/n55 ), 
        .ZN(\uut_baud_rate/add_176/n203 ) );
  NAND3_X1 \uut_baud_rate/add_176/U278  ( .A1(\uut_baud_rate/add_176/n31 ), 
        .A2(\uut_baud_rate/add_176/n48 ), .A3(\uut_baud_rate/add_176/n49 ), 
        .ZN(\uut_baud_rate/add_176/n204 ) );
  NAND3_X1 \uut_baud_rate/add_176/U277  ( .A1(\uut_baud_rate/n93 ), .A2(
        \uut_baud_rate/baud_count [18]), .A3(\uut_baud_rate/n45 ), .ZN(
        \uut_baud_rate/add_176/n196 ) );
  NAND3_X1 \uut_baud_rate/add_176/U276  ( .A1(\uut_baud_rate/baud_count [17]), 
        .A2(\uut_baud_rate/baud_count [15]), .A3(
        \uut_baud_rate/baud_count [16]), .ZN(\uut_baud_rate/add_176/n195 ) );
  NAND3_X1 \uut_baud_rate/add_176/U275  ( .A1(\uut_baud_rate/add_176/n14 ), 
        .A2(\uut_baud_rate/add_176/n12 ), .A3(\uut_baud_rate/add_176/n51 ), 
        .ZN(\uut_baud_rate/add_176/n194 ) );
  NAND3_X1 \uut_baud_rate/add_176/U274  ( .A1(\uut_baud_rate/add_176/n46 ), 
        .A2(\uut_baud_rate/add_176/n15 ), .A3(\uut_baud_rate/add_176/n56 ), 
        .ZN(\uut_baud_rate/add_176/n193 ) );
  NAND3_X1 \uut_baud_rate/add_176/U273  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/baud_count [18]), .A3(\uut_baud_rate/n95 ), .ZN(
        \uut_baud_rate/add_176/n186 ) );
  NAND3_X1 \uut_baud_rate/add_176/U272  ( .A1(\uut_baud_rate/n89 ), .A2(
        \uut_baud_rate/n93 ), .A3(\uut_baud_rate/n45 ), .ZN(
        \uut_baud_rate/add_176/n187 ) );
  NAND3_X1 \uut_baud_rate/add_176/U271  ( .A1(\uut_baud_rate/baud_count [14]), 
        .A2(\uut_baud_rate/baud_count [12]), .A3(\uut_baud_rate/add_176/n24 ), 
        .ZN(\uut_baud_rate/add_176/n185 ) );
  NAND3_X1 \uut_baud_rate/add_176/U270  ( .A1(\uut_baud_rate/baud_count [11]), 
        .A2(\uut_baud_rate/add_176/n35 ), .A3(\uut_baud_rate/add_176/n37 ), 
        .ZN(\uut_baud_rate/add_176/n184 ) );
  NAND3_X1 \uut_baud_rate/add_176/U269  ( .A1(\uut_baud_rate/add_176/n25 ), 
        .A2(\uut_baud_rate/add_176/n33 ), .A3(\uut_baud_rate/add_176/n49 ), 
        .ZN(\uut_baud_rate/add_176/n183 ) );
  NAND3_X1 \uut_baud_rate/add_176/U268  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n93 ), .A3(\uut_baud_rate/n95 ), .ZN(
        \uut_baud_rate/add_176/n176 ) );
  NAND3_X1 \uut_baud_rate/add_176/U267  ( .A1(\uut_baud_rate/n89 ), .A2(
        \uut_baud_rate/n85 ), .A3(\uut_baud_rate/n45 ), .ZN(
        \uut_baud_rate/add_176/n177 ) );
  NAND3_X1 \uut_baud_rate/add_176/U266  ( .A1(\uut_baud_rate/baud_count [14]), 
        .A2(\uut_baud_rate/baud_count [15]), .A3(\uut_baud_rate/add_176/n24 ), 
        .ZN(\uut_baud_rate/add_176/n174 ) );
  NAND3_X1 \uut_baud_rate/add_176/U265  ( .A1(\uut_baud_rate/baud_count [17]), 
        .A2(\uut_baud_rate/baud_count [18]), .A3(
        \uut_baud_rate/baud_count [16]), .ZN(\uut_baud_rate/add_176/n175 ) );
  NAND3_X1 \uut_baud_rate/add_176/U264  ( .A1(\uut_baud_rate/add_176/n3 ), 
        .A2(\uut_baud_rate/add_176/n77 ), .A3(\uut_baud_rate/add_176/n21 ), 
        .ZN(\uut_baud_rate/add_176/n172 ) );
  NAND3_X1 \uut_baud_rate/add_176/U263  ( .A1(\uut_baud_rate/baud_count [11]), 
        .A2(\uut_baud_rate/baud_count [12]), .A3(\uut_baud_rate/add_176/n38 ), 
        .ZN(\uut_baud_rate/add_176/n173 ) );
  NAND3_X1 \uut_baud_rate/add_176/U262  ( .A1(\uut_baud_rate/add_176/n34 ), 
        .A2(\uut_baud_rate/add_176/n72 ), .A3(\uut_baud_rate/add_176/n49 ), 
        .ZN(\uut_baud_rate/add_176/n171 ) );
  NOR2_X1 \uut_baud_rate/add_176/U261  ( .A1(\uut_baud_rate/add_176/n151 ), 
        .A2(\uut_baud_rate/add_176/n171 ), .ZN(\uut_baud_rate/add_176/n170 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U260  ( .A(\uut_baud_rate/add_176/n166 ), 
        .B(\uut_baud_rate/n83 ), .ZN(\uut_baud_rate/N37 ) );
  NAND3_X1 \uut_baud_rate/add_176/U259  ( .A1(\uut_baud_rate/n93 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n51 ), .ZN(
        \uut_baud_rate/add_176/n164 ) );
  NAND3_X1 \uut_baud_rate/add_176/U258  ( .A1(\uut_baud_rate/n85 ), .A2(
        \uut_baud_rate/n83 ), .A3(\uut_baud_rate/n89 ), .ZN(
        \uut_baud_rate/add_176/n165 ) );
  NAND3_X1 \uut_baud_rate/add_176/U257  ( .A1(\uut_baud_rate/baud_count [18]), 
        .A2(\uut_baud_rate/n95 ), .A3(\uut_baud_rate/baud_count [17]), .ZN(
        \uut_baud_rate/add_176/n163 ) );
  NOR2_X1 \uut_baud_rate/add_176/U256  ( .A1(\uut_baud_rate/add_176/n254 ), 
        .A2(\uut_baud_rate/add_176/n163 ), .ZN(\uut_baud_rate/add_176/n159 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U255  ( .A1(\uut_baud_rate/add_176/n44 ), 
        .A2(\uut_baud_rate/add_176/n45 ), .A3(\uut_baud_rate/add_176/n56 ), 
        .A4(\uut_baud_rate/add_176/n57 ), .ZN(\uut_baud_rate/add_176/n162 ) );
  NOR2_X1 \uut_baud_rate/add_176/U254  ( .A1(\uut_baud_rate/add_176/n162 ), 
        .A2(\uut_baud_rate/add_176/n171 ), .ZN(\uut_baud_rate/add_176/n161 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U253  ( .A1(\uut_baud_rate/add_176/n161 ), 
        .A2(\uut_baud_rate/add_176/n159 ), .A3(\uut_baud_rate/add_176/n160 ), 
        .A4(\uut_baud_rate/add_176/n158 ), .ZN(\uut_baud_rate/add_176/n157 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U252  ( .A(\uut_baud_rate/add_176/n157 ), 
        .B(\uut_baud_rate/n91 ), .ZN(\uut_baud_rate/N38 ) );
  NAND3_X1 \uut_baud_rate/add_176/U251  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/n89 ), .A3(\uut_baud_rate/n93 ), .ZN(
        \uut_baud_rate/add_176/n155 ) );
  NAND3_X1 \uut_baud_rate/add_176/U250  ( .A1(\uut_baud_rate/n83 ), .A2(
        \uut_baud_rate/n91 ), .A3(\uut_baud_rate/n85 ), .ZN(
        \uut_baud_rate/add_176/n156 ) );
  NAND4_X1 \uut_baud_rate/add_176/U249  ( .A1(\uut_baud_rate/baud_count [17]), 
        .A2(\uut_baud_rate/baud_count [16]), .A3(
        \uut_baud_rate/baud_count [15]), .A4(\uut_baud_rate/baud_count [14]), 
        .ZN(\uut_baud_rate/add_176/n153 ) );
  NAND3_X1 \uut_baud_rate/add_176/U248  ( .A1(\uut_baud_rate/n95 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/baud_count [18]), .ZN(
        \uut_baud_rate/add_176/n154 ) );
  NOR2_X1 \uut_baud_rate/add_176/U247  ( .A1(\uut_baud_rate/add_176/n153 ), 
        .A2(\uut_baud_rate/add_176/n154 ), .ZN(\uut_baud_rate/add_176/n148 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U246  ( .A1(\uut_baud_rate/add_176/n38 ), 
        .A2(\uut_baud_rate/add_176/n35 ), .A3(\uut_baud_rate/add_176/n30 ), 
        .A4(\uut_baud_rate/add_176/n28 ), .ZN(\uut_baud_rate/add_176/n152 ) );
  NOR2_X1 \uut_baud_rate/add_176/U245  ( .A1(\uut_baud_rate/add_176/n152 ), 
        .A2(\uut_baud_rate/add_176/n142 ), .ZN(\uut_baud_rate/add_176/n149 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U244  ( .A1(\uut_baud_rate/add_176/n48 ), 
        .A2(\uut_baud_rate/add_176/n26 ), .A3(\uut_baud_rate/add_176/n55 ), 
        .A4(\uut_baud_rate/add_176/n58 ), .ZN(\uut_baud_rate/add_176/n151 ) );
  NOR2_X1 \uut_baud_rate/add_176/U243  ( .A1(\uut_baud_rate/add_176/n151 ), 
        .A2(\uut_baud_rate/add_176/n140 ), .ZN(\uut_baud_rate/add_176/n150 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U242  ( .A1(\uut_baud_rate/add_176/n150 ), 
        .A2(\uut_baud_rate/add_176/n148 ), .A3(\uut_baud_rate/add_176/n149 ), 
        .A4(\uut_baud_rate/add_176/n147 ), .ZN(\uut_baud_rate/add_176/n146 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U241  ( .A(\uut_baud_rate/add_176/n146 ), 
        .B(\uut_baud_rate/n87 ), .ZN(\uut_baud_rate/N39 ) );
  NAND4_X1 \uut_baud_rate/add_176/U240  ( .A1(\uut_baud_rate/n85 ), .A2(
        \uut_baud_rate/n89 ), .A3(\uut_baud_rate/n45 ), .A4(
        \uut_baud_rate/n93 ), .ZN(\uut_baud_rate/add_176/n144 ) );
  NAND3_X1 \uut_baud_rate/add_176/U239  ( .A1(\uut_baud_rate/n91 ), .A2(
        \uut_baud_rate/n87 ), .A3(\uut_baud_rate/n83 ), .ZN(
        \uut_baud_rate/add_176/n145 ) );
  NOR2_X1 \uut_baud_rate/add_176/U238  ( .A1(\uut_baud_rate/add_176/n144 ), 
        .A2(\uut_baud_rate/add_176/n145 ), .ZN(\uut_baud_rate/add_176/n135 )
         );
  NAND3_X1 \uut_baud_rate/add_176/U237  ( .A1(\uut_baud_rate/n95 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/baud_count [18]), .ZN(
        \uut_baud_rate/add_176/n143 ) );
  NOR2_X1 \uut_baud_rate/add_176/U236  ( .A1(\uut_baud_rate/add_176/n153 ), 
        .A2(\uut_baud_rate/add_176/n143 ), .ZN(\uut_baud_rate/add_176/n136 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U235  ( .A1(\uut_baud_rate/add_176/n38 ), 
        .A2(\uut_baud_rate/add_176/n36 ), .A3(\uut_baud_rate/add_176/n3 ), 
        .A4(\uut_baud_rate/add_176/n52 ), .ZN(\uut_baud_rate/add_176/n141 ) );
  NAND3_X1 \uut_baud_rate/add_176/U234  ( .A1(\uut_baud_rate/baud_count [12]), 
        .A2(\uut_baud_rate/add_176/n24 ), .A3(\uut_baud_rate/baud_count [11]), 
        .ZN(\uut_baud_rate/add_176/n142 ) );
  NOR2_X1 \uut_baud_rate/add_176/U233  ( .A1(\uut_baud_rate/add_176/n141 ), 
        .A2(\uut_baud_rate/add_176/n142 ), .ZN(\uut_baud_rate/add_176/n137 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U232  ( .A1(\uut_baud_rate/add_176/n32 ), 
        .A2(\uut_baud_rate/add_176/n27 ), .A3(\uut_baud_rate/add_176/n55 ), 
        .A4(\uut_baud_rate/add_176/n65 ), .ZN(\uut_baud_rate/add_176/n139 ) );
  NAND3_X1 \uut_baud_rate/add_176/U231  ( .A1(\uut_baud_rate/add_176/n31 ), 
        .A2(\uut_baud_rate/add_176/n19 ), .A3(\uut_baud_rate/add_176/n49 ), 
        .ZN(\uut_baud_rate/add_176/n140 ) );
  NOR2_X1 \uut_baud_rate/add_176/U230  ( .A1(\uut_baud_rate/add_176/n140 ), 
        .A2(\uut_baud_rate/add_176/n139 ), .ZN(\uut_baud_rate/add_176/n138 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U229  ( .A(\uut_baud_rate/add_176/n134 ), 
        .B(\uut_baud_rate/n78 ), .ZN(\uut_baud_rate/N40 ) );
  NAND4_X1 \uut_baud_rate/add_176/U228  ( .A1(\uut_baud_rate/n83 ), .A2(
        \uut_baud_rate/n85 ), .A3(\uut_baud_rate/n89 ), .A4(
        \uut_baud_rate/n45 ), .ZN(\uut_baud_rate/add_176/n132 ) );
  NAND3_X1 \uut_baud_rate/add_176/U227  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n78 ), .A3(\uut_baud_rate/n91 ), .ZN(
        \uut_baud_rate/add_176/n133 ) );
  NOR2_X1 \uut_baud_rate/add_176/U226  ( .A1(\uut_baud_rate/add_176/n132 ), 
        .A2(\uut_baud_rate/add_176/n133 ), .ZN(\uut_baud_rate/add_176/n124 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U225  ( .A1(\uut_baud_rate/baud_count [18]), 
        .A2(\uut_baud_rate/baud_count [17]), .A3(
        \uut_baud_rate/baud_count [16]), .A4(\uut_baud_rate/baud_count [15]), 
        .ZN(\uut_baud_rate/add_176/n130 ) );
  NAND3_X1 \uut_baud_rate/add_176/U224  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n93 ), .A3(\uut_baud_rate/n95 ), .ZN(
        \uut_baud_rate/add_176/n131 ) );
  NOR2_X1 \uut_baud_rate/add_176/U223  ( .A1(\uut_baud_rate/add_176/n130 ), 
        .A2(\uut_baud_rate/add_176/n131 ), .ZN(\uut_baud_rate/add_176/n125 )
         );
  NAND3_X1 \uut_baud_rate/add_176/U222  ( .A1(\uut_baud_rate/add_176/n24 ), 
        .A2(\uut_baud_rate/baud_count [14]), .A3(
        \uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/add_176/n129 ) );
  NAND4_X1 \uut_baud_rate/add_176/U221  ( .A1(\uut_baud_rate/add_176/n48 ), 
        .A2(\uut_baud_rate/add_176/n68 ), .A3(\uut_baud_rate/add_176/n55 ), 
        .A4(\uut_baud_rate/add_176/n58 ), .ZN(\uut_baud_rate/add_176/n127 ) );
  NAND4_X1 \uut_baud_rate/add_176/U220  ( .A1(\uut_baud_rate/add_176/n20 ), 
        .A2(\uut_baud_rate/add_176/n19 ), .A3(\uut_baud_rate/add_176/n69 ), 
        .A4(\uut_baud_rate/add_176/n49 ), .ZN(\uut_baud_rate/add_176/n128 ) );
  NOR2_X1 \uut_baud_rate/add_176/U219  ( .A1(\uut_baud_rate/add_176/n127 ), 
        .A2(\uut_baud_rate/add_176/n128 ), .ZN(\uut_baud_rate/add_176/n126 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U218  ( .A1(\uut_baud_rate/add_176/n126 ), 
        .A2(\uut_baud_rate/add_176/n125 ), .A3(\uut_baud_rate/add_176/n116 ), 
        .A4(\uut_baud_rate/add_176/n124 ), .ZN(\uut_baud_rate/add_176/n123 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U217  ( .A(\uut_baud_rate/add_176/n123 ), 
        .B(\uut_baud_rate/n76 ), .ZN(\uut_baud_rate/N41 ) );
  NAND4_X1 \uut_baud_rate/add_176/U216  ( .A1(\uut_baud_rate/n91 ), .A2(
        \uut_baud_rate/n83 ), .A3(\uut_baud_rate/n85 ), .A4(
        \uut_baud_rate/n89 ), .ZN(\uut_baud_rate/add_176/n121 ) );
  NAND3_X1 \uut_baud_rate/add_176/U215  ( .A1(\uut_baud_rate/n78 ), .A2(
        \uut_baud_rate/n76 ), .A3(\uut_baud_rate/n87 ), .ZN(
        \uut_baud_rate/add_176/n122 ) );
  NOR2_X1 \uut_baud_rate/add_176/U214  ( .A1(\uut_baud_rate/add_176/n121 ), 
        .A2(\uut_baud_rate/add_176/n122 ), .ZN(\uut_baud_rate/add_176/n114 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U213  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/n93 ), .A3(\uut_baud_rate/n51 ), .A4(
        \uut_baud_rate/n95 ), .ZN(\uut_baud_rate/add_176/n120 ) );
  NOR2_X1 \uut_baud_rate/add_176/U212  ( .A1(\uut_baud_rate/add_176/n130 ), 
        .A2(\uut_baud_rate/add_176/n120 ), .ZN(\uut_baud_rate/add_176/n115 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U211  ( .A1(\uut_baud_rate/add_176/n54 ), 
        .A2(\uut_baud_rate/add_176/n37 ), .A3(\uut_baud_rate/add_176/n76 ), 
        .A4(\uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/add_176/n119 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U210  ( .A1(\uut_baud_rate/add_176/n119 ), 
        .A2(\uut_baud_rate/add_176/n129 ), .ZN(\uut_baud_rate/add_176/n116 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U209  ( .A1(\uut_baud_rate/add_176/n28 ), 
        .A2(\uut_baud_rate/add_176/n19 ), .A3(\uut_baud_rate/add_176/n25 ), 
        .A4(\uut_baud_rate/add_176/n49 ), .ZN(\uut_baud_rate/add_176/n118 ) );
  NOR2_X1 \uut_baud_rate/add_176/U208  ( .A1(\uut_baud_rate/add_176/n127 ), 
        .A2(\uut_baud_rate/add_176/n118 ), .ZN(\uut_baud_rate/add_176/n117 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U207  ( .A(\uut_baud_rate/add_176/n113 ), 
        .B(\uut_baud_rate/n81 ), .ZN(\uut_baud_rate/N42 ) );
  NAND4_X1 \uut_baud_rate/add_176/U206  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n91 ), .A3(\uut_baud_rate/n83 ), .A4(
        \uut_baud_rate/n85 ), .ZN(\uut_baud_rate/add_176/n111 ) );
  NAND3_X1 \uut_baud_rate/add_176/U205  ( .A1(\uut_baud_rate/n76 ), .A2(
        \uut_baud_rate/n81 ), .A3(\uut_baud_rate/n78 ), .ZN(
        \uut_baud_rate/add_176/n112 ) );
  NOR2_X1 \uut_baud_rate/add_176/U204  ( .A1(\uut_baud_rate/add_176/n111 ), 
        .A2(\uut_baud_rate/add_176/n112 ), .ZN(\uut_baud_rate/add_176/n102 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U203  ( .A1(\uut_baud_rate/n95 ), .A2(
        \uut_baud_rate/baud_count [18]), .A3(\uut_baud_rate/baud_count [17]), 
        .A4(\uut_baud_rate/baud_count [16]), .ZN(\uut_baud_rate/add_176/n109 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U202  ( .A1(\uut_baud_rate/n89 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n93 ), .A4(
        \uut_baud_rate/n51 ), .ZN(\uut_baud_rate/add_176/n110 ) );
  NOR2_X1 \uut_baud_rate/add_176/U201  ( .A1(\uut_baud_rate/add_176/n109 ), 
        .A2(\uut_baud_rate/add_176/n110 ), .ZN(\uut_baud_rate/add_176/n103 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U200  ( .A1(\uut_baud_rate/baud_count [15]), 
        .A2(\uut_baud_rate/baud_count [14]), .A3(\uut_baud_rate/add_176/n23 ), 
        .A4(\uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/add_176/n108 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U199  ( .A1(\uut_baud_rate/add_176/n119 ), 
        .A2(\uut_baud_rate/add_176/n108 ), .ZN(\uut_baud_rate/add_176/n104 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U198  ( .A1(\uut_baud_rate/add_176/n44 ), 
        .A2(\uut_baud_rate/add_176/n26 ), .A3(\uut_baud_rate/add_176/n29 ), 
        .A4(\uut_baud_rate/add_176/n57 ), .ZN(\uut_baud_rate/add_176/n106 ) );
  NAND4_X1 \uut_baud_rate/add_176/U197  ( .A1(\uut_baud_rate/add_176/n21 ), 
        .A2(\uut_baud_rate/add_176/n19 ), .A3(\uut_baud_rate/add_176/n25 ), 
        .A4(\uut_baud_rate/add_176/n49 ), .ZN(\uut_baud_rate/add_176/n107 ) );
  NOR2_X1 \uut_baud_rate/add_176/U196  ( .A1(\uut_baud_rate/add_176/n106 ), 
        .A2(\uut_baud_rate/add_176/n107 ), .ZN(\uut_baud_rate/add_176/n105 )
         );
  NAND4_X1 \uut_baud_rate/add_176/U195  ( .A1(\uut_baud_rate/add_176/n105 ), 
        .A2(\uut_baud_rate/add_176/n103 ), .A3(\uut_baud_rate/add_176/n104 ), 
        .A4(\uut_baud_rate/add_176/n102 ), .ZN(\uut_baud_rate/add_176/n101 )
         );
  XNOR2_X1 \uut_baud_rate/add_176/U194  ( .A(\uut_baud_rate/add_176/n101 ), 
        .B(\uut_baud_rate/baud_count [31]), .ZN(\uut_baud_rate/N43 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U193  ( .A(\uut_baud_rate/add_176/n139 ), 
        .B(\uut_baud_rate/add_176/n50 ), .ZN(\uut_baud_rate/N16 ) );
  NAND3_X1 \uut_baud_rate/add_176/U192  ( .A1(\uut_baud_rate/add_176/n50 ), 
        .A2(\uut_baud_rate/add_176/n32 ), .A3(\uut_baud_rate/add_176/n65 ), 
        .ZN(\uut_baud_rate/add_176/n96 ) );
  NAND2_X1 \uut_baud_rate/add_176/U191  ( .A1(\uut_baud_rate/add_176/n56 ), 
        .A2(\uut_baud_rate/add_176/n68 ), .ZN(\uut_baud_rate/add_176/n97 ) );
  NAND3_X1 \uut_baud_rate/add_176/U190  ( .A1(\uut_baud_rate/add_176/n29 ), 
        .A2(\uut_baud_rate/add_176/n45 ), .A3(\uut_baud_rate/add_176/n57 ), 
        .ZN(\uut_baud_rate/add_176/n93 ) );
  NAND3_X1 \uut_baud_rate/add_176/U189  ( .A1(\uut_baud_rate/add_176/n31 ), 
        .A2(\uut_baud_rate/add_176/n50 ), .A3(\uut_baud_rate/add_176/n43 ), 
        .ZN(\uut_baud_rate/add_176/n94 ) );
  NAND2_X1 \uut_baud_rate/add_176/U188  ( .A1(\uut_baud_rate/add_176/n29 ), 
        .A2(\uut_baud_rate/add_176/n65 ), .ZN(\uut_baud_rate/add_176/n91 ) );
  NAND2_X1 \uut_baud_rate/add_176/U187  ( .A1(\uut_baud_rate/add_176/n89 ), 
        .A2(\uut_baud_rate/add_176/n90 ), .ZN(\uut_baud_rate/add_176/n88 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U186  ( .A(\uut_baud_rate/add_176/n88 ), .B(
        \uut_baud_rate/add_176/n21 ), .ZN(\uut_baud_rate/N19 ) );
  NAND2_X1 \uut_baud_rate/add_176/U185  ( .A1(\uut_baud_rate/add_176/n31 ), 
        .A2(\uut_baud_rate/add_176/n49 ), .ZN(\uut_baud_rate/add_176/n86 ) );
  NAND2_X1 \uut_baud_rate/add_176/U184  ( .A1(\uut_baud_rate/add_176/n20 ), 
        .A2(\uut_baud_rate/add_176/n12 ), .ZN(\uut_baud_rate/add_176/n87 ) );
  NAND2_X1 \uut_baud_rate/add_176/U183  ( .A1(\uut_baud_rate/add_176/n48 ), 
        .A2(\uut_baud_rate/add_176/n27 ), .ZN(\uut_baud_rate/add_176/n85 ) );
  NAND2_X1 \uut_baud_rate/add_176/U182  ( .A1(\uut_baud_rate/add_176/n83 ), 
        .A2(\uut_baud_rate/add_176/n84 ), .ZN(\uut_baud_rate/add_176/n82 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U181  ( .A(\uut_baud_rate/add_176/n82 ), .B(
        \uut_baud_rate/add_176/n11 ), .ZN(\uut_baud_rate/N20 ) );
  NAND2_X1 \uut_baud_rate/add_176/U180  ( .A1(\uut_baud_rate/add_176/n13 ), 
        .A2(\uut_baud_rate/add_176/n31 ), .ZN(\uut_baud_rate/add_176/n81 ) );
  NAND3_X1 \uut_baud_rate/add_176/U179  ( .A1(\uut_baud_rate/add_176/n79 ), 
        .A2(\uut_baud_rate/add_176/n80 ), .A3(\uut_baud_rate/add_176/n249 ), 
        .ZN(\uut_baud_rate/add_176/n78 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U178  ( .A(\uut_baud_rate/add_176/n78 ), .B(
        \uut_baud_rate/add_176/n36 ), .ZN(\uut_baud_rate/N21 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U177  ( .A(\uut_baud_rate/add_176/n233 ), 
        .B(\uut_baud_rate/n95 ), .ZN(\uut_baud_rate/N31 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U176  ( .A(\uut_baud_rate/add_176/n198 ), 
        .B(\uut_baud_rate/n45 ), .ZN(\uut_baud_rate/N34 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U175  ( .A(\uut_baud_rate/add_176/n178 ), 
        .B(\uut_baud_rate/n85 ), .ZN(\uut_baud_rate/N36 ) );
  NAND4_X1 \uut_baud_rate/add_176/U174  ( .A1(\uut_baud_rate/add_176/n181 ), 
        .A2(\uut_baud_rate/add_176/n180 ), .A3(\uut_baud_rate/add_176/n179 ), 
        .A4(\uut_baud_rate/add_176/n182 ), .ZN(\uut_baud_rate/add_176/n178 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U173  ( .A1(\uut_baud_rate/add_176/n238 ), 
        .A2(\uut_baud_rate/add_176/n239 ), .ZN(\uut_baud_rate/add_176/n234 )
         );
  INV_X1 \uut_baud_rate/add_176/U172  ( .A(\uut_baud_rate/baud_count [5]), 
        .ZN(\uut_baud_rate/add_176/n71 ) );
  CLKBUF_X1 \uut_baud_rate/add_176/U171  ( .A(\uut_baud_rate/add_176/n71 ), 
        .Z(\uut_baud_rate/add_176/n70 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U170  ( .A(\uut_baud_rate/add_176/n210 ), 
        .B(\uut_baud_rate/n93 ), .ZN(\uut_baud_rate/N33 ) );
  INV_X1 \uut_baud_rate/add_176/U169  ( .A(\uut_baud_rate/n74 ), .ZN(
        \uut_baud_rate/add_176/n67 ) );
  NAND2_X1 \uut_baud_rate/add_176/U168  ( .A1(\uut_baud_rate/add_176/n29 ), 
        .A2(\uut_baud_rate/add_176/n16 ), .ZN(\uut_baud_rate/add_176/n100 ) );
  INV_X1 \uut_baud_rate/add_176/U167  ( .A(\uut_baud_rate/add_176/n100 ), .ZN(
        \uut_baud_rate/add_176/n99 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U166  ( .A(\uut_baud_rate/add_176/n100 ), 
        .B(\uut_baud_rate/add_176/n45 ), .ZN(\uut_baud_rate/N14 ) );
  INV_X1 \uut_baud_rate/add_176/U165  ( .A(\uut_baud_rate/baud_count [6]), 
        .ZN(\uut_baud_rate/add_176/n74 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U164  ( .A(\uut_baud_rate/add_176/n188 ), 
        .B(\uut_baud_rate/n89 ), .ZN(\uut_baud_rate/N35 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U163  ( .A(\uut_baud_rate/add_176/n73 ), .B(
        \uut_baud_rate/add_176/n92 ), .ZN(\uut_baud_rate/N18 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U162  ( .A(\uut_baud_rate/add_176/n301 ), 
        .B(\uut_baud_rate/add_176/n38 ), .ZN(\uut_baud_rate/N22 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U161  ( .A(\uut_baud_rate/add_176/n289 ), 
        .B(\uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/N24 ) );
  NOR2_X1 \uut_baud_rate/add_176/U160  ( .A1(\uut_baud_rate/add_176/n236 ), 
        .A2(\uut_baud_rate/add_176/n237 ), .ZN(\uut_baud_rate/add_176/n235 )
         );
  AND3_X1 \uut_baud_rate/add_176/U159  ( .A1(\uut_baud_rate/add_176/n50 ), 
        .A2(\uut_baud_rate/add_176/n48 ), .A3(\uut_baud_rate/add_176/n57 ), 
        .ZN(\uut_baud_rate/add_176/n249 ) );
  NOR2_X1 \uut_baud_rate/add_176/U158  ( .A1(\uut_baud_rate/add_176/n292 ), 
        .A2(\uut_baud_rate/add_176/n298 ), .ZN(\uut_baud_rate/add_176/n202 )
         );
  INV_X1 \uut_baud_rate/add_176/U157  ( .A(\uut_baud_rate/n74 ), .ZN(
        \uut_baud_rate/add_176/n64 ) );
  AND2_X1 \uut_baud_rate/add_176/U156  ( .A1(\uut_baud_rate/add_176/n19 ), 
        .A2(\uut_baud_rate/add_176/n34 ), .ZN(\uut_baud_rate/add_176/n243 ) );
  NAND2_X1 \uut_baud_rate/add_176/U155  ( .A1(\uut_baud_rate/add_176/n13 ), 
        .A2(\uut_baud_rate/add_176/n52 ), .ZN(\uut_baud_rate/add_176/n307 ) );
  AND3_X1 \uut_baud_rate/add_176/U154  ( .A1(\uut_baud_rate/add_176/n31 ), 
        .A2(\uut_baud_rate/add_176/n12 ), .A3(\uut_baud_rate/add_176/n50 ), 
        .ZN(\uut_baud_rate/add_176/n279 ) );
  AND3_X1 \uut_baud_rate/add_176/U153  ( .A1(\uut_baud_rate/add_176/n12 ), 
        .A2(\uut_baud_rate/add_176/n31 ), .A3(\uut_baud_rate/add_176/n50 ), 
        .ZN(\uut_baud_rate/add_176/n89 ) );
  NOR2_X1 \uut_baud_rate/add_176/U152  ( .A1(\uut_baud_rate/add_176/n215 ), 
        .A2(\uut_baud_rate/add_176/n300 ), .ZN(\uut_baud_rate/add_176/n213 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U151  ( .A1(\uut_baud_rate/add_176/n59 ), 
        .A2(\uut_baud_rate/add_176/n241 ), .ZN(\uut_baud_rate/add_176/n63 ) );
  AND3_X1 \uut_baud_rate/add_176/U150  ( .A1(\uut_baud_rate/add_176/n242 ), 
        .A2(\uut_baud_rate/add_176/n244 ), .A3(\uut_baud_rate/add_176/n243 ), 
        .ZN(\uut_baud_rate/add_176/n62 ) );
  NAND2_X1 \uut_baud_rate/add_176/U149  ( .A1(\uut_baud_rate/add_176/n63 ), 
        .A2(\uut_baud_rate/add_176/n62 ), .ZN(\uut_baud_rate/add_176/n240 ) );
  NOR2_X1 \uut_baud_rate/add_176/U148  ( .A1(\uut_baud_rate/add_176/n273 ), 
        .A2(\uut_baud_rate/add_176/n274 ), .ZN(\uut_baud_rate/add_176/n269 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U147  ( .A1(\uut_baud_rate/add_176/n261 ), 
        .A2(\uut_baud_rate/add_176/n262 ), .ZN(\uut_baud_rate/add_176/n258 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U146  ( .A1(\uut_baud_rate/add_176/n216 ), 
        .A2(\uut_baud_rate/add_176/n205 ), .ZN(\uut_baud_rate/add_176/n201 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U145  ( .A1(\uut_baud_rate/add_176/n194 ), 
        .A2(\uut_baud_rate/add_176/n184 ), .ZN(\uut_baud_rate/add_176/n191 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U144  ( .A1(\uut_baud_rate/add_176/n194 ), 
        .A2(\uut_baud_rate/add_176/n184 ), .ZN(\uut_baud_rate/add_176/n181 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U143  ( .A1(\uut_baud_rate/add_176/n299 ), 
        .A2(\uut_baud_rate/add_176/n300 ), .ZN(\uut_baud_rate/add_176/n295 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U142  ( .A1(\uut_baud_rate/add_176/n296 ), 
        .A2(\uut_baud_rate/add_176/n295 ), .ZN(\uut_baud_rate/add_176/n294 )
         );
  CLKBUF_X1 \uut_baud_rate/add_176/U141  ( .A(\uut_baud_rate/add_176/n74 ), 
        .Z(\uut_baud_rate/add_176/n73 ) );
  AND3_X1 \uut_baud_rate/add_176/U140  ( .A1(\uut_baud_rate/add_176/n30 ), 
        .A2(\uut_baud_rate/add_176/n18 ), .A3(\uut_baud_rate/add_176/n28 ), 
        .ZN(\uut_baud_rate/add_176/n286 ) );
  AND3_X1 \uut_baud_rate/add_176/U139  ( .A1(\uut_baud_rate/add_176/n24 ), 
        .A2(\uut_baud_rate/baud_count [12]), .A3(\uut_baud_rate/add_176/n76 ), 
        .ZN(\uut_baud_rate/add_176/n61 ) );
  AND3_X1 \uut_baud_rate/add_176/U138  ( .A1(\uut_baud_rate/add_176/n246 ), 
        .A2(\uut_baud_rate/add_176/n247 ), .A3(\uut_baud_rate/add_176/n245 ), 
        .ZN(\uut_baud_rate/add_176/n60 ) );
  NAND2_X1 \uut_baud_rate/add_176/U137  ( .A1(\uut_baud_rate/add_176/n60 ), 
        .A2(\uut_baud_rate/add_176/n61 ), .ZN(\uut_baud_rate/add_176/n59 ) );
  INV_X1 \uut_baud_rate/add_176/U136  ( .A(\uut_baud_rate/add_176/n64 ), .ZN(
        \uut_baud_rate/add_176/n65 ) );
  INV_X1 \uut_baud_rate/add_176/U135  ( .A(\uut_baud_rate/add_176/n64 ), .ZN(
        \uut_baud_rate/add_176/n57 ) );
  CLKBUF_X1 \uut_baud_rate/add_176/U134  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_176/n46 ) );
  AND2_X1 \uut_baud_rate/add_176/U133  ( .A1(\uut_baud_rate/add_176/n55 ), 
        .A2(\uut_baud_rate/add_176/n27 ), .ZN(\uut_baud_rate/add_176/n244 ) );
  NAND2_X1 \uut_baud_rate/add_176/U132  ( .A1(\uut_baud_rate/add_176/n56 ), 
        .A2(\uut_baud_rate/add_176/n26 ), .ZN(\uut_baud_rate/add_176/n305 ) );
  AND2_X1 \uut_baud_rate/add_176/U131  ( .A1(\uut_baud_rate/add_176/n29 ), 
        .A2(\uut_baud_rate/add_176/n46 ), .ZN(\uut_baud_rate/add_176/n79 ) );
  NAND2_X1 \uut_baud_rate/add_176/U130  ( .A1(\uut_baud_rate/add_176/n26 ), 
        .A2(\uut_baud_rate/add_176/n99 ), .ZN(\uut_baud_rate/add_176/n98 ) );
  CLKBUF_X1 \uut_baud_rate/add_176/U129  ( .A(\uut_baud_rate/add_176/n47 ), 
        .Z(\uut_baud_rate/add_176/n43 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U128  ( .A(\uut_baud_rate/add_176/n294 ), 
        .B(\uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/N23 ) );
  AND2_X1 \uut_baud_rate/add_176/U127  ( .A1(\uut_baud_rate/n97 ), .A2(
        \uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/add_176/n247 ) );
  AND3_X1 \uut_baud_rate/add_176/U126  ( .A1(\uut_baud_rate/baud_count [12]), 
        .A2(\uut_baud_rate/add_176/n23 ), .A3(\uut_baud_rate/baud_count [11]), 
        .ZN(\uut_baud_rate/add_176/n277 ) );
  AND3_X1 \uut_baud_rate/add_176/U125  ( .A1(\uut_baud_rate/baud_count [11]), 
        .A2(\uut_baud_rate/baud_count [12]), .A3(\uut_baud_rate/add_176/n38 ), 
        .ZN(\uut_baud_rate/add_176/n285 ) );
  NOR2_X1 \uut_baud_rate/add_176/U124  ( .A1(\uut_baud_rate/add_176/n174 ), 
        .A2(\uut_baud_rate/add_176/n175 ), .ZN(\uut_baud_rate/add_176/n168 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U123  ( .A1(\uut_baud_rate/baud_count [17]), 
        .A2(\uut_baud_rate/baud_count [18]), .ZN(\uut_baud_rate/add_176/n220 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U122  ( .A1(\uut_baud_rate/n95 ), .A2(
        \uut_baud_rate/n51 ), .ZN(\uut_baud_rate/add_176/n197 ) );
  NOR2_X1 \uut_baud_rate/add_176/U121  ( .A1(\uut_baud_rate/add_176/n185 ), 
        .A2(\uut_baud_rate/add_176/n195 ), .ZN(\uut_baud_rate/add_176/n180 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U120  ( .A1(\uut_baud_rate/add_176/n185 ), 
        .A2(\uut_baud_rate/add_176/n195 ), .ZN(\uut_baud_rate/add_176/n190 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U119  ( .A1(\uut_baud_rate/baud_count [12]), 
        .A2(\uut_baud_rate/add_176/n24 ), .ZN(\uut_baud_rate/add_176/n218 ) );
  NOR2_X1 \uut_baud_rate/add_176/U118  ( .A1(\uut_baud_rate/add_176/n217 ), 
        .A2(\uut_baud_rate/add_176/n218 ), .ZN(\uut_baud_rate/add_176/n212 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U117  ( .A1(\uut_baud_rate/baud_count [11]), 
        .A2(\uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/add_176/n42 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U116  ( .A1(\uut_baud_rate/baud_count [16]), 
        .A2(\uut_baud_rate/baud_count [15]), .ZN(\uut_baud_rate/add_176/n41 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U115  ( .A1(\uut_baud_rate/baud_count [18]), 
        .A2(\uut_baud_rate/baud_count [17]), .ZN(\uut_baud_rate/add_176/n40 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U114  ( .A1(\uut_baud_rate/baud_count [18]), 
        .A2(\uut_baud_rate/n95 ), .ZN(\uut_baud_rate/add_176/n209 ) );
  NOR2_X1 \uut_baud_rate/add_176/U113  ( .A1(\uut_baud_rate/add_176/n172 ), 
        .A2(\uut_baud_rate/add_176/n173 ), .ZN(\uut_baud_rate/add_176/n160 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U112  ( .A1(\uut_baud_rate/add_176/n172 ), 
        .A2(\uut_baud_rate/add_176/n173 ), .ZN(\uut_baud_rate/add_176/n169 )
         );
  AND2_X1 \uut_baud_rate/add_176/U111  ( .A1(\uut_baud_rate/baud_count [15]), 
        .A2(\uut_baud_rate/baud_count [14]), .ZN(\uut_baud_rate/add_176/n246 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U110  ( .A1(\uut_baud_rate/add_176/n22 ), 
        .A2(\uut_baud_rate/add_176/n193 ), .ZN(\uut_baud_rate/add_176/n296 )
         );
  AND2_X1 \uut_baud_rate/add_176/U109  ( .A1(\uut_baud_rate/baud_count [17]), 
        .A2(\uut_baud_rate/baud_count [16]), .ZN(\uut_baud_rate/add_176/n245 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U108  ( .A1(\uut_baud_rate/add_176/n282 ), 
        .A2(\uut_baud_rate/add_176/n283 ), .ZN(\uut_baud_rate/add_176/n278 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U107  ( .A1(\uut_baud_rate/add_176/n208 ), 
        .A2(\uut_baud_rate/add_176/n209 ), .ZN(\uut_baud_rate/add_176/n199 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U106  ( .A1(\uut_baud_rate/add_176/n206 ), 
        .A2(\uut_baud_rate/add_176/n207 ), .ZN(\uut_baud_rate/add_176/n200 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U105  ( .A1(\uut_baud_rate/add_176/n263 ), 
        .A2(\uut_baud_rate/add_176/n275 ), .ZN(\uut_baud_rate/add_176/n257 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U104  ( .A1(\uut_baud_rate/add_176/n264 ), 
        .A2(\uut_baud_rate/add_176/n265 ), .ZN(\uut_baud_rate/add_176/n256 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U103  ( .A1(\uut_baud_rate/add_176/n263 ), 
        .A2(\uut_baud_rate/add_176/n275 ), .ZN(\uut_baud_rate/add_176/n268 )
         );
  AND3_X1 \uut_baud_rate/add_176/U102  ( .A1(\uut_baud_rate/add_176/n23 ), 
        .A2(\uut_baud_rate/baud_count [14]), .A3(
        \uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/add_176/n267 ) );
  NOR2_X1 \uut_baud_rate/add_176/U101  ( .A1(\uut_baud_rate/add_176/n230 ), 
        .A2(\uut_baud_rate/add_176/n42 ), .ZN(\uut_baud_rate/add_176/n223 ) );
  NOR2_X1 \uut_baud_rate/add_176/U100  ( .A1(\uut_baud_rate/add_176/n231 ), 
        .A2(\uut_baud_rate/add_176/n232 ), .ZN(\uut_baud_rate/add_176/n222 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U99  ( .A1(\uut_baud_rate/add_176/n204 ), 
        .A2(\uut_baud_rate/add_176/n297 ), .ZN(\uut_baud_rate/add_176/n291 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U98  ( .A1(\uut_baud_rate/add_176/n293 ), 
        .A2(\uut_baud_rate/add_176/n184 ), .ZN(\uut_baud_rate/add_176/n290 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U97  ( .A1(\uut_baud_rate/add_176/n291 ), 
        .A2(\uut_baud_rate/add_176/n290 ), .ZN(\uut_baud_rate/add_176/n289 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U96  ( .A1(\uut_baud_rate/add_176/n20 ), 
        .A2(\uut_baud_rate/add_176/n30 ), .ZN(\uut_baud_rate/add_176/n216 ) );
  NOR2_X1 \uut_baud_rate/add_176/U95  ( .A1(\uut_baud_rate/add_176/n297 ), 
        .A2(\uut_baud_rate/add_176/n22 ), .ZN(\uut_baud_rate/add_176/n214 ) );
  NOR2_X1 \uut_baud_rate/add_176/U94  ( .A1(\uut_baud_rate/add_176/n193 ), 
        .A2(\uut_baud_rate/add_176/n183 ), .ZN(\uut_baud_rate/add_176/n182 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U93  ( .A1(\uut_baud_rate/add_176/n204 ), 
        .A2(\uut_baud_rate/add_176/n203 ), .ZN(\uut_baud_rate/add_176/n192 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U92  ( .A1(\uut_baud_rate/add_176/n219 ), 
        .A2(\uut_baud_rate/add_176/n220 ), .ZN(\uut_baud_rate/add_176/n211 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U91  ( .A1(\uut_baud_rate/add_176/n304 ), 
        .A2(\uut_baud_rate/add_176/n305 ), .ZN(\uut_baud_rate/add_176/n303 )
         );
  NAND2_X1 \uut_baud_rate/add_176/U90  ( .A1(\uut_baud_rate/add_176/n302 ), 
        .A2(\uut_baud_rate/add_176/n303 ), .ZN(\uut_baud_rate/add_176/n301 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U89  ( .A1(\uut_baud_rate/add_176/n164 ), 
        .A2(\uut_baud_rate/add_176/n165 ), .ZN(\uut_baud_rate/add_176/n158 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U88  ( .A1(\uut_baud_rate/add_176/n176 ), 
        .A2(\uut_baud_rate/add_176/n177 ), .ZN(\uut_baud_rate/add_176/n167 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U87  ( .A1(\uut_baud_rate/add_176/n155 ), 
        .A2(\uut_baud_rate/add_176/n156 ), .ZN(\uut_baud_rate/add_176/n147 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U86  ( .A1(\uut_baud_rate/add_176/n186 ), 
        .A2(\uut_baud_rate/add_176/n187 ), .ZN(\uut_baud_rate/add_176/n179 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U85  ( .A1(\uut_baud_rate/add_176/n196 ), 
        .A2(\uut_baud_rate/add_176/n197 ), .ZN(\uut_baud_rate/add_176/n189 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U84  ( .A1(\uut_baud_rate/add_176/n282 ), 
        .A2(\uut_baud_rate/add_176/n81 ), .ZN(\uut_baud_rate/add_176/n80 ) );
  NOR2_X1 \uut_baud_rate/add_176/U83  ( .A1(\uut_baud_rate/add_176/n91 ), .A2(
        \uut_baud_rate/add_176/n260 ), .ZN(\uut_baud_rate/add_176/n90 ) );
  AND2_X1 \uut_baud_rate/add_176/U82  ( .A1(\uut_baud_rate/add_176/n14 ), .A2(
        \uut_baud_rate/add_176/n51 ), .ZN(\uut_baud_rate/add_176/n242 ) );
  NOR2_X1 \uut_baud_rate/add_176/U81  ( .A1(\uut_baud_rate/add_176/n86 ), .A2(
        \uut_baud_rate/add_176/n87 ), .ZN(\uut_baud_rate/add_176/n83 ) );
  NAND2_X1 \uut_baud_rate/add_176/U80  ( .A1(\uut_baud_rate/add_176/n2 ), .A2(
        \uut_baud_rate/add_176/n52 ), .ZN(\uut_baud_rate/add_176/n300 ) );
  NOR2_X1 \uut_baud_rate/add_176/U79  ( .A1(\uut_baud_rate/add_176/n306 ), 
        .A2(\uut_baud_rate/add_176/n307 ), .ZN(\uut_baud_rate/add_176/n302 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U78  ( .A1(\uut_baud_rate/add_176/n228 ), 
        .A2(\uut_baud_rate/add_176/n229 ), .ZN(\uut_baud_rate/add_176/n224 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U77  ( .A1(\uut_baud_rate/add_176/n281 ), 
        .A2(\uut_baud_rate/add_176/n85 ), .ZN(\uut_baud_rate/add_176/n280 ) );
  NOR2_X1 \uut_baud_rate/add_176/U76  ( .A1(\uut_baud_rate/add_176/n288 ), 
        .A2(\uut_baud_rate/add_176/n260 ), .ZN(\uut_baud_rate/add_176/n287 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U75  ( .A1(\uut_baud_rate/add_176/n272 ), 
        .A2(\uut_baud_rate/add_176/n91 ), .ZN(\uut_baud_rate/add_176/n259 ) );
  NOR2_X1 \uut_baud_rate/add_176/U74  ( .A1(\uut_baud_rate/add_176/n271 ), 
        .A2(\uut_baud_rate/add_176/n272 ), .ZN(\uut_baud_rate/add_176/n270 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U73  ( .A1(\uut_baud_rate/add_176/n226 ), 
        .A2(\uut_baud_rate/add_176/n227 ), .ZN(\uut_baud_rate/add_176/n225 )
         );
  NOR2_X1 \uut_baud_rate/add_176/U72  ( .A1(\uut_baud_rate/add_176/n96 ), .A2(
        \uut_baud_rate/add_176/n97 ), .ZN(\uut_baud_rate/add_176/n95 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U71  ( .A(\uut_baud_rate/add_176/n70 ), .B(
        \uut_baud_rate/add_176/n95 ), .ZN(\uut_baud_rate/N17 ) );
  XOR2_X1 \uut_baud_rate/add_176/U70  ( .A(\uut_baud_rate/add_176/n56 ), .B(
        \uut_baud_rate/add_176/n57 ), .Z(\uut_baud_rate/N13 ) );
  NOR2_X1 \uut_baud_rate/add_176/U69  ( .A1(\uut_baud_rate/add_176/n93 ), .A2(
        \uut_baud_rate/add_176/n94 ), .ZN(\uut_baud_rate/add_176/n92 ) );
  XNOR2_X1 \uut_baud_rate/add_176/U68  ( .A(\uut_baud_rate/add_176/n98 ), .B(
        \uut_baud_rate/add_176/n44 ), .ZN(\uut_baud_rate/N15 ) );
  NOR2_X1 \uut_baud_rate/add_176/U67  ( .A1(\uut_baud_rate/add_176/n85 ), .A2(
        \uut_baud_rate/add_176/n100 ), .ZN(\uut_baud_rate/add_176/n84 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U66  ( .A(\uut_baud_rate/baud_count [4]), 
        .Z(\uut_baud_rate/add_176/n49 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U65  ( .A(\uut_baud_rate/n99 ), .Z(
        \uut_baud_rate/add_176/n55 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U64  ( .A(\uut_baud_rate/baud_count [5]), 
        .Z(\uut_baud_rate/add_176/n34 ) );
  BUF_X2 \uut_baud_rate/add_176/U63  ( .A(\uut_baud_rate/baud_count [3]), .Z(
        \uut_baud_rate/add_176/n47 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U62  ( .A(\uut_baud_rate/baud_count [5]), 
        .Z(\uut_baud_rate/add_176/n31 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U61  ( .A(\uut_baud_rate/baud_count [4]), 
        .Z(\uut_baud_rate/add_176/n50 ) );
  BUF_X2 \uut_baud_rate/add_176/U60  ( .A(\uut_baud_rate/baud_count [7]), .Z(
        \uut_baud_rate/add_176/n52 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U59  ( .A(\uut_baud_rate/baud_count [3]), 
        .Z(\uut_baud_rate/add_176/n48 ) );
  INV_X1 \uut_baud_rate/add_176/U58  ( .A(\uut_baud_rate/add_176/n71 ), .ZN(
        \uut_baud_rate/add_176/n69 ) );
  INV_X1 \uut_baud_rate/add_176/U57  ( .A(\uut_baud_rate/add_176/n71 ), .ZN(
        \uut_baud_rate/add_176/n25 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U56  ( .A(\uut_baud_rate/baud_count [13]), 
        .Z(\uut_baud_rate/add_176/n24 ) );
  CLKBUF_X2 \uut_baud_rate/add_176/U55  ( .A(\uut_baud_rate/baud_count [13]), 
        .Z(\uut_baud_rate/add_176/n23 ) );
  NAND3_X1 \uut_baud_rate/add_176/U54  ( .A1(\uut_baud_rate/add_176/n214 ), 
        .A2(\uut_baud_rate/add_176/n213 ), .A3(\uut_baud_rate/add_176/n6 ), 
        .ZN(\uut_baud_rate/add_176/n210 ) );
  NAND3_X1 \uut_baud_rate/add_176/U53  ( .A1(\uut_baud_rate/add_176/n116 ), 
        .A2(\uut_baud_rate/add_176/n117 ), .A3(\uut_baud_rate/add_176/n5 ), 
        .ZN(\uut_baud_rate/add_176/n113 ) );
  NAND4_X1 \uut_baud_rate/add_176/U52  ( .A1(\uut_baud_rate/add_176/n235 ), 
        .A2(\uut_baud_rate/add_176/n4 ), .A3(\uut_baud_rate/add_176/n234 ), 
        .A4(\uut_baud_rate/add_176/n10 ), .ZN(\uut_baud_rate/add_176/n233 ) );
  NAND4_X1 \uut_baud_rate/add_176/U51  ( .A1(\uut_baud_rate/add_176/n201 ), 
        .A2(\uut_baud_rate/add_176/n202 ), .A3(\uut_baud_rate/add_176/n199 ), 
        .A4(\uut_baud_rate/add_176/n200 ), .ZN(\uut_baud_rate/add_176/n198 )
         );
  NAND3_X1 \uut_baud_rate/add_176/U50  ( .A1(\uut_baud_rate/add_176/n138 ), 
        .A2(\uut_baud_rate/add_176/n137 ), .A3(\uut_baud_rate/add_176/n9 ), 
        .ZN(\uut_baud_rate/add_176/n134 ) );
  NAND3_X1 \uut_baud_rate/add_176/U49  ( .A1(\uut_baud_rate/add_176/n192 ), 
        .A2(\uut_baud_rate/add_176/n191 ), .A3(\uut_baud_rate/add_176/n8 ), 
        .ZN(\uut_baud_rate/add_176/n188 ) );
  NAND3_X1 \uut_baud_rate/add_176/U48  ( .A1(\uut_baud_rate/add_176/n50 ), 
        .A2(\uut_baud_rate/add_176/n48 ), .A3(\uut_baud_rate/add_176/n34 ), 
        .ZN(\uut_baud_rate/add_176/n22 ) );
  BUF_X2 \uut_baud_rate/add_176/U47  ( .A(\uut_baud_rate/baud_count [8]), .Z(
        \uut_baud_rate/add_176/n75 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U46  ( .A(\uut_baud_rate/baud_count [7]), 
        .Z(\uut_baud_rate/add_176/n21 ) );
  NAND3_X1 \uut_baud_rate/add_176/U45  ( .A1(\uut_baud_rate/add_176/n170 ), 
        .A2(\uut_baud_rate/add_176/n169 ), .A3(\uut_baud_rate/add_176/n7 ), 
        .ZN(\uut_baud_rate/add_176/n166 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U44  ( .A(\uut_baud_rate/baud_count [6]), 
        .Z(\uut_baud_rate/add_176/n19 ) );
  BUF_X2 \uut_baud_rate/add_176/U43  ( .A(\uut_baud_rate/add_176/n47 ), .Z(
        \uut_baud_rate/add_176/n44 ) );
  BUF_X2 \uut_baud_rate/add_176/U42  ( .A(\uut_baud_rate/baud_count [7]), .Z(
        \uut_baud_rate/add_176/n20 ) );
  BUF_X2 \uut_baud_rate/add_176/U41  ( .A(\uut_baud_rate/baud_count [7]), .Z(
        \uut_baud_rate/add_176/n28 ) );
  BUF_X2 \uut_baud_rate/add_176/U40  ( .A(\uut_baud_rate/baud_count [7]), .Z(
        \uut_baud_rate/add_176/n51 ) );
  CLKBUF_X2 \uut_baud_rate/add_176/U39  ( .A(\uut_baud_rate/n99 ), .Z(
        \uut_baud_rate/add_176/n29 ) );
  BUF_X1 \uut_baud_rate/add_176/U38  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_176/n76 ) );
  BUF_X1 \uut_baud_rate/add_176/U37  ( .A(\uut_baud_rate/add_176/n47 ), .Z(
        \uut_baud_rate/add_176/n32 ) );
  INV_X1 \uut_baud_rate/add_176/U36  ( .A(\uut_baud_rate/add_176/n64 ), .ZN(
        \uut_baud_rate/add_176/n58 ) );
  INV_X1 \uut_baud_rate/add_176/U35  ( .A(\uut_baud_rate/add_176/n64 ), .ZN(
        \uut_baud_rate/add_176/n17 ) );
  INV_X1 \uut_baud_rate/add_176/U34  ( .A(\uut_baud_rate/add_176/n64 ), .ZN(
        \uut_baud_rate/add_176/n16 ) );
  BUF_X1 \uut_baud_rate/add_176/U33  ( .A(\uut_baud_rate/add_176/n75 ), .Z(
        \uut_baud_rate/add_176/n53 ) );
  INV_X1 \uut_baud_rate/add_176/U32  ( .A(\uut_baud_rate/add_176/n74 ), .ZN(
        \uut_baud_rate/add_176/n72 ) );
  INV_X1 \uut_baud_rate/add_176/U31  ( .A(\uut_baud_rate/add_176/n74 ), .ZN(
        \uut_baud_rate/add_176/n13 ) );
  INV_X1 \uut_baud_rate/add_176/U30  ( .A(\uut_baud_rate/add_176/n74 ), .ZN(
        \uut_baud_rate/add_176/n12 ) );
  CLKBUF_X1 \uut_baud_rate/add_176/U29  ( .A(\uut_baud_rate/add_176/n30 ), .Z(
        \uut_baud_rate/add_176/n11 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U28  ( .A(\uut_baud_rate/n99 ), .Z(
        \uut_baud_rate/add_176/n56 ) );
  AND3_X1 \uut_baud_rate/add_176/U27  ( .A1(\uut_baud_rate/baud_count [14]), 
        .A2(\uut_baud_rate/add_176/n24 ), .A3(\uut_baud_rate/add_176/n38 ), 
        .ZN(\uut_baud_rate/add_176/n10 ) );
  CLKBUF_X1 \uut_baud_rate/add_176/U26  ( .A(\uut_baud_rate/add_176/n67 ), .Z(
        \uut_baud_rate/N12 ) );
  AND2_X1 \uut_baud_rate/add_176/U25  ( .A1(\uut_baud_rate/add_176/n136 ), 
        .A2(\uut_baud_rate/add_176/n135 ), .ZN(\uut_baud_rate/add_176/n9 ) );
  AND2_X1 \uut_baud_rate/add_176/U24  ( .A1(\uut_baud_rate/add_176/n190 ), 
        .A2(\uut_baud_rate/add_176/n189 ), .ZN(\uut_baud_rate/add_176/n8 ) );
  AND2_X1 \uut_baud_rate/add_176/U23  ( .A1(\uut_baud_rate/add_176/n168 ), 
        .A2(\uut_baud_rate/add_176/n167 ), .ZN(\uut_baud_rate/add_176/n7 ) );
  AND2_X1 \uut_baud_rate/add_176/U22  ( .A1(\uut_baud_rate/add_176/n211 ), 
        .A2(\uut_baud_rate/add_176/n212 ), .ZN(\uut_baud_rate/add_176/n6 ) );
  AND2_X1 \uut_baud_rate/add_176/U21  ( .A1(\uut_baud_rate/add_176/n115 ), 
        .A2(\uut_baud_rate/add_176/n114 ), .ZN(\uut_baud_rate/add_176/n5 ) );
  NOR3_X1 \uut_baud_rate/add_176/U20  ( .A1(\uut_baud_rate/add_176/n42 ), .A2(
        \uut_baud_rate/add_176/n41 ), .A3(\uut_baud_rate/add_176/n40 ), .ZN(
        \uut_baud_rate/add_176/n4 ) );
  BUF_X2 \uut_baud_rate/add_176/U19  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_176/n35 ) );
  BUF_X1 \uut_baud_rate/add_176/U18  ( .A(\uut_baud_rate/add_176/n47 ), .Z(
        \uut_baud_rate/add_176/n33 ) );
  BUF_X1 \uut_baud_rate/add_176/U17  ( .A(\uut_baud_rate/add_176/n75 ), .Z(
        \uut_baud_rate/add_176/n30 ) );
  BUF_X1 \uut_baud_rate/add_176/U16  ( .A(\uut_baud_rate/add_176/n75 ), .Z(
        \uut_baud_rate/add_176/n54 ) );
  BUF_X1 \uut_baud_rate/add_176/U15  ( .A(\uut_baud_rate/add_176/n75 ), .Z(
        \uut_baud_rate/add_176/n3 ) );
  BUF_X1 \uut_baud_rate/add_176/U14  ( .A(\uut_baud_rate/add_176/n75 ), .Z(
        \uut_baud_rate/add_176/n2 ) );
  BUF_X1 \uut_baud_rate/add_176/U13  ( .A(\uut_baud_rate/add_176/n75 ), .Z(
        \uut_baud_rate/add_176/n14 ) );
  CLKBUF_X1 \uut_baud_rate/add_176/U12  ( .A(\uut_baud_rate/baud_count [14]), 
        .Z(\uut_baud_rate/add_176/n1 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U11  ( .A(\uut_baud_rate/n97 ), .Z(
        \uut_baud_rate/add_176/n38 ) );
  BUF_X1 \uut_baud_rate/add_176/U10  ( .A(\uut_baud_rate/n97 ), .Z(
        \uut_baud_rate/add_176/n37 ) );
  BUF_X1 \uut_baud_rate/add_176/U9  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_176/n68 ) );
  BUF_X1 \uut_baud_rate/add_176/U8  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_176/n27 ) );
  BUF_X1 \uut_baud_rate/add_176/U7  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_176/n26 ) );
  CLKBUF_X3 \uut_baud_rate/add_176/U6  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_176/n45 ) );
  BUF_X1 \uut_baud_rate/add_176/U5  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_176/n77 ) );
  BUF_X1 \uut_baud_rate/add_176/U4  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_176/n18 ) );
  BUF_X1 \uut_baud_rate/add_176/U3  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_176/n36 ) );
  INV_X1 \uut_baud_rate/add_176/U2  ( .A(\uut_baud_rate/add_176/n67 ), .ZN(
        \uut_baud_rate/add_176/n15 ) );
  OAI21_X1 \uut_tx/U56  ( .B1(rst), .B2(\uut_tx/n62 ), .A(\uut_tx/n1 ), .ZN(
        \uut_tx/n49 ) );
  MUX2_X1 \uut_tx/U55  ( .A(\uut_tx/n14 ), .B(\uut_tx/n60 ), .S(
        \uut_tx/count_16_indication ), .Z(\uut_tx/n62 ) );
  NAND2_X1 \uut_tx/U54  ( .A1(\uut_tx/current_state [0]), .A2(\uut_tx/n14 ), 
        .ZN(\uut_tx/n60 ) );
  OAI211_X1 \uut_tx/U53  ( .C1(\uut_tx/n9 ), .C2(\uut_tx/n1 ), .A(\uut_tx/n59 ), .B(tx), .ZN(\uut_tx/n50 ) );
  NAND3_X1 \uut_tx/U52  ( .A1(enable), .A2(\uut_tx/n58 ), .A3(\uut_tx/n57 ), 
        .ZN(tx) );
  NAND3_X1 \uut_tx/U51  ( .A1(\uut_tx/n57 ), .A2(\uut_tx/n56 ), .A3(
        \uut_tx/n55 ), .ZN(\uut_tx/n59 ) );
  INV_X1 \uut_tx/U50  ( .A(\uut_tx/n16 ), .ZN(\uut_tx/n55 ) );
  NOR3_X1 \uut_tx/U49  ( .A1(\uut_tx/n1 ), .A2(\uut_tx/n54 ), .A3(\uut_tx/n53 ), .ZN(\uut_tx/N52 ) );
  OAI22_X1 \uut_tx/U48  ( .A1(\uut_tx/n10 ), .A2(\uut_tx/n52 ), .B1(
        \uut_tx/n12 ), .B2(\uut_tx/n51 ), .ZN(\uut_tx/n42 ) );
  NOR2_X1 \uut_tx/U47  ( .A1(\uut_tx/n15 ), .A2(\uut_tx/n2 ), .ZN(\uut_tx/n52 ) );
  MUX2_X1 \uut_tx/U46  ( .A(\uut_tx/n41 ), .B(\uut_tx/n4 ), .S(\uut_tx/n12 ), 
        .Z(\uut_tx/n43 ) );
  NAND3_X1 \uut_tx/U45  ( .A1(\uut_tx/n2 ), .A2(\uut_tx/count_8 [0]), .A3(
        \uut_tx/n40 ), .ZN(\uut_tx/n51 ) );
  OAI21_X1 \uut_tx/U44  ( .B1(\uut_tx/count_8 [0]), .B2(\uut_tx/n39 ), .A(
        \uut_tx/n40 ), .ZN(\uut_tx/n41 ) );
  NOR2_X1 \uut_tx/U43  ( .A1(\uut_tx/n15 ), .A2(\uut_tx/n39 ), .ZN(
        \uut_tx/n38 ) );
  NAND2_X1 \uut_tx/U42  ( .A1(\uut_tx/n37 ), .A2(\uut_tx/n53 ), .ZN(
        \uut_tx/n39 ) );
  NAND3_X1 \uut_tx/U41  ( .A1(\uut_tx/count_8 [2]), .A2(\uut_tx/count_8 [0]), 
        .A3(\uut_tx/count_8 [1]), .ZN(\uut_tx/n53 ) );
  NAND2_X1 \uut_tx/U40  ( .A1(\uut_tx/n37 ), .A2(\uut_tx/n54 ), .ZN(
        \uut_tx/n40 ) );
  INV_X1 \uut_tx/U39  ( .A(\uut_tx/n61 ), .ZN(\uut_tx/n37 ) );
  NAND3_X1 \uut_tx/U38  ( .A1(\uut_tx/current_state [1]), .A2(\uut_tx/n16 ), 
        .A3(\uut_tx/n57 ), .ZN(\uut_tx/n61 ) );
  NOR3_X1 \uut_tx/U37  ( .A1(\uut_tx/n58 ), .A2(rst), .A3(\uut_tx/n54 ), .ZN(
        \uut_tx/N34 ) );
  NAND2_X1 \uut_tx/U36  ( .A1(baud_tick), .A2(\uut_tx/n13 ), .ZN(\uut_tx/n54 )
         );
  INV_X1 \uut_tx/U35  ( .A(\uut_tx/n35 ), .ZN(\uut_tx/n58 ) );
  NAND2_X1 \uut_tx/U34  ( .A1(\uut_tx/n33 ), .A2(\uut_tx/n34 ), .ZN(
        \uut_tx/n45 ) );
  OAI21_X1 \uut_tx/U33  ( .B1(\uut_tx/n31 ), .B2(\uut_tx/n3 ), .A(\uut_tx/n30 ), .ZN(\uut_tx/n33 ) );
  NOR2_X1 \uut_tx/U32  ( .A1(\uut_tx/n5 ), .A2(\uut_tx/n29 ), .ZN(\uut_tx/n28 ) );
  OAI21_X1 \uut_tx/U31  ( .B1(\uut_tx/count_16 [1]), .B2(\uut_tx/n17 ), .A(
        \uut_tx/n26 ), .ZN(\uut_tx/n31 ) );
  OAI22_X1 \uut_tx/U30  ( .A1(\uut_tx/n29 ), .A2(\uut_tx/count_16 [1]), .B1(
        \uut_tx/n5 ), .B2(\uut_tx/n26 ), .ZN(\uut_tx/n47 ) );
  INV_X1 \uut_tx/U29  ( .A(\uut_tx/n25 ), .ZN(\uut_tx/n26 ) );
  OAI21_X1 \uut_tx/U28  ( .B1(\uut_tx/n27 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n23 ), .ZN(\uut_tx/n25 ) );
  NAND3_X1 \uut_tx/U27  ( .A1(\uut_tx/count_16 [0]), .A2(\uut_tx/n32 ), .A3(
        \uut_tx/n23 ), .ZN(\uut_tx/n29 ) );
  INV_X1 \uut_tx/U26  ( .A(\uut_tx/n27 ), .ZN(\uut_tx/n32 ) );
  MUX2_X1 \uut_tx/U25  ( .A(\uut_tx/n22 ), .B(\uut_tx/n21 ), .S(\uut_tx/n11 ), 
        .Z(\uut_tx/n48 ) );
  NOR2_X1 \uut_tx/U24  ( .A1(\uut_tx/n22 ), .A2(\uut_tx/n17 ), .ZN(
        \uut_tx/n21 ) );
  NAND3_X1 \uut_tx/U23  ( .A1(\uut_tx/n36 ), .A2(\uut_tx/n57 ), .A3(
        \uut_tx/n35 ), .ZN(\uut_tx/n27 ) );
  NAND4_X1 \uut_tx/U22  ( .A1(\uut_tx/n20 ), .A2(\uut_tx/n30 ), .A3(
        \uut_tx/n19 ), .A4(\uut_tx/count_16 [0]), .ZN(\uut_tx/n36 ) );
  INV_X1 \uut_tx/U21  ( .A(\uut_tx/n7 ), .ZN(\uut_tx/n19 ) );
  INV_X1 \uut_tx/U20  ( .A(\uut_tx/n8 ), .ZN(\uut_tx/n24 ) );
  INV_X1 \uut_tx/U19  ( .A(\uut_tx/n23 ), .ZN(\uut_tx/n22 ) );
  NAND2_X1 \uut_tx/U18  ( .A1(\uut_tx/n57 ), .A2(\uut_tx/n18 ), .ZN(
        \uut_tx/n23 ) );
  INV_X1 \uut_tx/U17  ( .A(baud_tick), .ZN(\uut_tx/n18 ) );
  INV_X1 \uut_tx/U16  ( .A(rst), .ZN(\uut_tx/n57 ) );
  MUX2_X1 \uut_tx/U15  ( .A(\uut_tx/n38 ), .B(\uut_tx/n15 ), .S(
        \uut_tx/count_8 [0]), .Z(\uut_tx/n44 ) );
  OR3_X1 \uut_tx/U14  ( .A1(\uut_tx/n29 ), .A2(\uut_tx/n5 ), .A3(\uut_tx/n6 ), 
        .ZN(\uut_tx/n34 ) );
  BUF_X1 \uut_tx/U13  ( .A(\uut_tx/n27 ), .Z(\uut_tx/n17 ) );
  AND2_X1 \uut_tx/U12  ( .A1(\uut_tx/n37 ), .A2(\uut_tx/n54 ), .ZN(
        \uut_tx/n15 ) );
  AND4_X1 \uut_tx/U11  ( .A1(\uut_tx/n19 ), .A2(\uut_tx/n30 ), .A3(
        \uut_tx/n24 ), .A4(\uut_tx/n20 ), .ZN(\uut_tx/n13 ) );
  INV_X1 \uut_tx/U10  ( .A(\uut_tx/count_16 [0]), .ZN(\uut_tx/n11 ) );
  BUF_X1 \uut_tx/U9  ( .A(\uut_tx/n7 ), .Z(\uut_tx/n5 ) );
  AND3_X1 \uut_tx/U8  ( .A1(\uut_tx/n2 ), .A2(\uut_tx/count_8 [0]), .A3(
        \uut_tx/n40 ), .ZN(\uut_tx/n4 ) );
  MUX2_X1 \uut_tx/U7  ( .A(\uut_tx/n31 ), .B(\uut_tx/n28 ), .S(\uut_tx/n6 ), 
        .Z(\uut_tx/n46 ) );
  INV_X1 \uut_tx/U6  ( .A(\uut_tx/n17 ), .ZN(\uut_tx/n3 ) );
  OR2_X1 \uut_tx/U5  ( .A1(\uut_tx/current_state [1]), .A2(
        \uut_tx/current_state [0]), .ZN(\uut_tx/n35 ) );
  AND2_X1 \uut_tx/U4  ( .A1(\uut_tx/n37 ), .A2(\uut_tx/n53 ), .ZN(\uut_tx/n2 )
         );
  CLKBUF_X1 \uut_tx/U3  ( .A(\uut_tx/n61 ), .Z(\uut_tx/n1 ) );
  DFF_X1 \uut_tx/count_16_reg[3]  ( .D(\uut_tx/n45 ), .CK(clk), .Q(
        \uut_tx/n30 ) );
  DFF_X1 \uut_tx/count_16_reg[2]  ( .D(\uut_tx/n46 ), .CK(clk), .Q(
        \uut_tx/n20 ), .QN(\uut_tx/n6 ) );
  DFF_X1 \uut_tx/count_8_indication_reg  ( .D(\uut_tx/N52 ), .CK(clk), .QN(
        \uut_tx/n9 ) );
  DFF_X1 \uut_tx/count_16_indication_reg  ( .D(\uut_tx/N34 ), .CK(clk), .Q(
        \uut_tx/count_16_indication ), .QN(\uut_tx/n56 ) );
  DFF_X1 \uut_tx/count_8_reg[1]  ( .D(\uut_tx/n43 ), .CK(clk), .Q(
        \uut_tx/count_8 [1]), .QN(\uut_tx/n12 ) );
  DFF_X1 \uut_tx/count_8_reg[2]  ( .D(\uut_tx/n42 ), .CK(clk), .Q(
        \uut_tx/count_8 [2]), .QN(\uut_tx/n10 ) );
  DFF_X1 \uut_tx/count_8_reg[0]  ( .D(\uut_tx/n44 ), .CK(clk), .Q(
        \uut_tx/count_8 [0]) );
  DFF_X1 \uut_tx/current_state_reg[1]  ( .D(\uut_tx/n49 ), .CK(clk), .Q(
        \uut_tx/current_state [1]), .QN(\uut_tx/n14 ) );
  DFF_X1 \uut_tx/count_16_reg[1]  ( .D(\uut_tx/n47 ), .CK(clk), .Q(
        \uut_tx/count_16 [1]), .QN(\uut_tx/n7 ) );
  DFF_X1 \uut_tx/count_16_reg[0]  ( .D(\uut_tx/n48 ), .CK(clk), .Q(
        \uut_tx/count_16 [0]), .QN(\uut_tx/n8 ) );
  DFF_X1 \uut_tx/current_state_reg[0]  ( .D(\uut_tx/n50 ), .CK(clk), .Q(
        \uut_tx/current_state [0]), .QN(\uut_tx/n16 ) );
  NOR2_X1 \uut_rx/U86  ( .A1(rst), .A2(\uut_rx/n86 ), .ZN(\uut_rx/N82 ) );
  MUX2_X1 \uut_rx/U85  ( .A(\uut_rx/n18 ), .B(\uut_rx/data_save [7]), .S(
        \uut_rx/n11 ), .Z(\uut_rx/n88 ) );
  MUX2_X1 \uut_rx/U84  ( .A(\uut_rx/n20 ), .B(\uut_rx/data_save [6]), .S(
        \uut_rx/n11 ), .Z(\uut_rx/n89 ) );
  MUX2_X1 \uut_rx/U83  ( .A(\uut_rx/n21 ), .B(\uut_rx/data_save [5]), .S(
        \uut_rx/n11 ), .Z(\uut_rx/n90 ) );
  MUX2_X1 \uut_rx/U82  ( .A(\uut_rx/n23 ), .B(\uut_rx/data_save [4]), .S(
        \uut_rx/n11 ), .Z(\uut_rx/n91 ) );
  MUX2_X1 \uut_rx/U81  ( .A(\uut_rx/n24 ), .B(\uut_rx/data_save [3]), .S(
        \uut_rx/n85 ), .Z(\uut_rx/n92 ) );
  MUX2_X1 \uut_rx/U80  ( .A(\uut_rx/n26 ), .B(\uut_rx/data_save [2]), .S(
        \uut_rx/n85 ), .Z(\uut_rx/n93 ) );
  MUX2_X1 \uut_rx/U79  ( .A(\uut_rx/n27 ), .B(\uut_rx/data_save [1]), .S(
        \uut_rx/n85 ), .Z(\uut_rx/n94 ) );
  MUX2_X1 \uut_rx/U78  ( .A(\uut_rx/n82 ), .B(\uut_rx/n83 ), .S(\uut_rx/n85 ), 
        .Z(\uut_rx/n71 ) );
  INV_X1 \uut_rx/U77  ( .A(\uut_rx/n81 ), .ZN(\uut_rx/n85 ) );
  OAI21_X1 \uut_rx/U76  ( .B1(\uut_rx/n80 ), .B2(\uut_rx/n79 ), .A(
        \uut_rx/n84 ), .ZN(\uut_rx/n81 ) );
  NOR2_X1 \uut_rx/U75  ( .A1(rst), .A2(\uut_rx/n78 ), .ZN(\uut_rx/n82 ) );
  MUX2_X1 \uut_rx/U74  ( .A(\uut_rx/n77 ), .B(\uut_rx/n67 ), .S(\uut_rx/n37 ), 
        .Z(\uut_rx/n73 ) );
  NOR2_X1 \uut_rx/U73  ( .A1(\uut_rx/n29 ), .A2(\uut_rx/n32 ), .ZN(
        \uut_rx/n67 ) );
  OAI22_X1 \uut_rx/U72  ( .A1(\uut_rx/n32 ), .A2(\uut_rx/n7 ), .B1(\uut_rx/n9 ), .B2(\uut_rx/n30 ), .ZN(\uut_rx/n87 ) );
  OAI22_X1 \uut_rx/U71  ( .A1(rst), .A2(\uut_rx/n64 ), .B1(\uut_rx/n56 ), .B2(
        \uut_rx/n63 ), .ZN(\uut_rx/n75 ) );
  NOR3_X1 \uut_rx/U70  ( .A1(rst), .A2(\uut_rx/n62 ), .A3(\uut_rx/n61 ), .ZN(
        \uut_rx/N45 ) );
  MUX2_X1 \uut_rx/U69  ( .A(\uut_rx/n60 ), .B(\uut_rx/n1 ), .S(\uut_rx/n12 ), 
        .Z(\uut_rx/n62 ) );
  NAND2_X1 \uut_rx/U68  ( .A1(\uut_rx/n17 ), .A2(\uut_rx/current_state [0]), 
        .ZN(\uut_rx/n60 ) );
  OAI22_X1 \uut_rx/U67  ( .A1(rst), .A2(\uut_rx/n58 ), .B1(\uut_rx/n25 ), .B2(
        \uut_rx/n63 ), .ZN(\uut_rx/n76 ) );
  NAND3_X1 \uut_rx/U66  ( .A1(\uut_rx/n57 ), .A2(\uut_rx/n84 ), .A3(
        \uut_rx/n64 ), .ZN(\uut_rx/n63 ) );
  NAND4_X1 \uut_rx/U65  ( .A1(\uut_rx/count_16_indication ), .A2(\uut_rx/n78 ), 
        .A3(\uut_rx/n56 ), .A4(\uut_rx/current_state [0]), .ZN(\uut_rx/n64 )
         );
  INV_X1 \uut_rx/U64  ( .A(rx), .ZN(\uut_rx/n78 ) );
  NAND4_X1 \uut_rx/U63  ( .A1(\uut_rx/current_state [0]), .A2(\uut_rx/n12 ), 
        .A3(\uut_rx/count_16_indication ), .A4(rx), .ZN(\uut_rx/n57 ) );
  AOI22_X1 \uut_rx/U62  ( .A1(\uut_rx/n55 ), .A2(\uut_rx/n25 ), .B1(
        \uut_rx/count_8_indication ), .B2(\uut_rx/n5 ), .ZN(\uut_rx/n58 ) );
  NOR2_X1 \uut_rx/U61  ( .A1(\uut_rx/n12 ), .A2(rx), .ZN(\uut_rx/n55 ) );
  NOR3_X1 \uut_rx/U60  ( .A1(\uut_rx/n3 ), .A2(\uut_rx/n54 ), .A3(\uut_rx/n53 ), .ZN(\uut_rx/N64 ) );
  OAI22_X1 \uut_rx/U59  ( .A1(\uut_rx/n19 ), .A2(\uut_rx/n52 ), .B1(
        \uut_rx/n50 ), .B2(\uut_rx/n51 ), .ZN(\uut_rx/n68 ) );
  NAND3_X1 \uut_rx/U58  ( .A1(\uut_rx/n47 ), .A2(\uut_rx/count_8 [0]), .A3(
        \uut_rx/n49 ), .ZN(\uut_rx/n50 ) );
  INV_X1 \uut_rx/U57  ( .A(\uut_rx/n46 ), .ZN(\uut_rx/n49 ) );
  OAI21_X1 \uut_rx/U56  ( .B1(\uut_rx/count_8 [0]), .B2(\uut_rx/n46 ), .A(
        \uut_rx/n47 ), .ZN(\uut_rx/n48 ) );
  MUX2_X1 \uut_rx/U55  ( .A(\uut_rx/n2 ), .B(\uut_rx/n45 ), .S(\uut_rx/n22 ), 
        .Z(\uut_rx/n70 ) );
  NOR2_X1 \uut_rx/U54  ( .A1(\uut_rx/n2 ), .A2(\uut_rx/n46 ), .ZN(\uut_rx/n45 ) );
  NAND3_X1 \uut_rx/U53  ( .A1(\uut_rx/count_8 [2]), .A2(\uut_rx/count_8 [0]), 
        .A3(\uut_rx/count_8 [1]), .ZN(\uut_rx/n53 ) );
  NAND2_X1 \uut_rx/U52  ( .A1(\uut_rx/n6 ), .A2(\uut_rx/n79 ), .ZN(
        \uut_rx/n47 ) );
  NAND2_X1 \uut_rx/U51  ( .A1(\uut_rx/n44 ), .A2(baud_tick), .ZN(\uut_rx/n79 )
         );
  INV_X1 \uut_rx/U50  ( .A(\uut_rx/n59 ), .ZN(\uut_rx/n44 ) );
  NAND3_X1 \uut_rx/U49  ( .A1(\uut_rx/n15 ), .A2(\uut_rx/count_16 [2]), .A3(
        \uut_rx/n43 ), .ZN(\uut_rx/n59 ) );
  NAND2_X1 \uut_rx/U48  ( .A1(\uut_rx/n5 ), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n54 ) );
  OAI22_X1 \uut_rx/U47  ( .A1(\uut_rx/n42 ), .A2(\uut_rx/n33 ), .B1(
        \uut_rx/n41 ), .B2(\uut_rx/n13 ), .ZN(\uut_rx/n72 ) );
  INV_X1 \uut_rx/U46  ( .A(\uut_rx/n77 ), .ZN(\uut_rx/n41 ) );
  OAI21_X1 \uut_rx/U45  ( .B1(\uut_rx/n33 ), .B2(\uut_rx/n8 ), .A(\uut_rx/n39 ), .ZN(\uut_rx/n77 ) );
  INV_X1 \uut_rx/U44  ( .A(\uut_rx/n38 ), .ZN(\uut_rx/n39 ) );
  AOI21_X1 \uut_rx/U43  ( .B1(\uut_rx/n37 ), .B2(\uut_rx/n43 ), .A(
        \uut_rx/n17 ), .ZN(\uut_rx/n42 ) );
  MUX2_X1 \uut_rx/U42  ( .A(\uut_rx/n31 ), .B(\uut_rx/n36 ), .S(\uut_rx/n16 ), 
        .Z(\uut_rx/n74 ) );
  NOR2_X1 \uut_rx/U41  ( .A1(\uut_rx/n33 ), .A2(\uut_rx/n30 ), .ZN(
        \uut_rx/n36 ) );
  OAI21_X1 \uut_rx/U40  ( .B1(\uut_rx/n66 ), .B2(\uut_rx/n7 ), .A(\uut_rx/n65 ), .ZN(\uut_rx/n38 ) );
  NAND2_X1 \uut_rx/U39  ( .A1(\uut_rx/n84 ), .A2(\uut_rx/n61 ), .ZN(
        \uut_rx/n65 ) );
  INV_X1 \uut_rx/U38  ( .A(baud_tick), .ZN(\uut_rx/n61 ) );
  OAI211_X1 \uut_rx/U37  ( .C1(\uut_rx/n35 ), .C2(\uut_rx/current_state [1]), 
        .A(\uut_rx/n84 ), .B(\uut_rx/n65 ), .ZN(\uut_rx/n66 ) );
  INV_X1 \uut_rx/U36  ( .A(rst), .ZN(\uut_rx/n84 ) );
  OAI211_X1 \uut_rx/U35  ( .C1(\uut_rx/n28 ), .C2(\uut_rx/current_state [1]), 
        .A(\uut_rx/n84 ), .B(\uut_rx/n9 ), .ZN(\uut_rx/n33 ) );
  OAI211_X1 \uut_rx/U34  ( .C1(\uut_rx/n28 ), .C2(\uut_rx/n12 ), .A(
        \uut_rx/n84 ), .B(\uut_rx/n9 ), .ZN(\uut_rx/n32 ) );
  CLKBUF_X1 \uut_rx/U33  ( .A(\uut_rx/n38 ), .Z(\uut_rx/n31 ) );
  AND2_X1 \uut_rx/U32  ( .A1(\uut_rx/n34 ), .A2(\uut_rx/current_state [0]), 
        .ZN(\uut_rx/n35 ) );
  INV_X1 \uut_rx/U31  ( .A(\uut_rx/n15 ), .ZN(\uut_rx/n29 ) );
  AND2_X1 \uut_rx/U30  ( .A1(\uut_rx/n34 ), .A2(\uut_rx/current_state [0]), 
        .ZN(\uut_rx/n28 ) );
  AND2_X1 \uut_rx/U29  ( .A1(\uut_rx/n83 ), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n27 ) );
  AND2_X1 \uut_rx/U28  ( .A1(\uut_rx/data_save [1]), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n26 ) );
  AND2_X1 \uut_rx/U27  ( .A1(\uut_rx/data_save [2]), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n24 ) );
  AND2_X1 \uut_rx/U26  ( .A1(\uut_rx/data_save [3]), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n23 ) );
  AND2_X1 \uut_rx/U25  ( .A1(\uut_rx/data_save [4]), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n21 ) );
  AND2_X1 \uut_rx/U24  ( .A1(\uut_rx/data_save [5]), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n20 ) );
  AND2_X1 \uut_rx/U23  ( .A1(\uut_rx/data_save [6]), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n18 ) );
  NAND3_X1 \uut_rx/U22  ( .A1(\uut_rx/n14 ), .A2(\uut_rx/count_16 [2]), .A3(
        \uut_rx/n13 ), .ZN(\uut_rx/n34 ) );
  AND3_X1 \uut_rx/U21  ( .A1(\uut_rx/n15 ), .A2(\uut_rx/count_16 [2]), .A3(
        \uut_rx/n13 ), .ZN(\uut_rx/n17 ) );
  AND2_X1 \uut_rx/U20  ( .A1(\uut_rx/count_16 [0]), .A2(\uut_rx/n40 ), .ZN(
        \uut_rx/n14 ) );
  NAND3_X1 \uut_rx/U19  ( .A1(\uut_rx/n5 ), .A2(\uut_rx/n84 ), .A3(
        \uut_rx/n53 ), .ZN(\uut_rx/n46 ) );
  INV_X1 \uut_rx/U18  ( .A(\uut_rx/n56 ), .ZN(\uut_rx/n12 ) );
  INV_X1 \uut_rx/U17  ( .A(\uut_rx/n10 ), .ZN(\uut_rx/n11 ) );
  OAI21_X1 \uut_rx/U16  ( .B1(\uut_rx/n3 ), .B2(\uut_rx/n80 ), .A(\uut_rx/n84 ), .ZN(\uut_rx/n10 ) );
  NAND2_X1 \uut_rx/U15  ( .A1(\uut_rx/n84 ), .A2(\uut_rx/n61 ), .ZN(
        \uut_rx/n9 ) );
  INV_X1 \uut_rx/U14  ( .A(\uut_rx/n16 ), .ZN(\uut_rx/n8 ) );
  INV_X1 \uut_rx/U13  ( .A(\uut_rx/n30 ), .ZN(\uut_rx/n7 ) );
  AND2_X1 \uut_rx/U12  ( .A1(\uut_rx/n5 ), .A2(\uut_rx/n84 ), .ZN(\uut_rx/n6 )
         );
  AND2_X2 \uut_rx/U11  ( .A1(\uut_rx/n25 ), .A2(\uut_rx/current_state [1]), 
        .ZN(\uut_rx/n5 ) );
  AND3_X1 \uut_rx/U10  ( .A1(\uut_rx/n47 ), .A2(\uut_rx/count_8 [0]), .A3(
        \uut_rx/n49 ), .ZN(\uut_rx/n4 ) );
  AND2_X1 \uut_rx/U9  ( .A1(\uut_rx/n47 ), .A2(\uut_rx/n46 ), .ZN(\uut_rx/n52 ) );
  AND2_X2 \uut_rx/U8  ( .A1(\uut_rx/n40 ), .A2(\uut_rx/count_16 [0]), .ZN(
        \uut_rx/n15 ) );
  INV_X1 \uut_rx/U7  ( .A(\uut_rx/n5 ), .ZN(\uut_rx/n80 ) );
  AND2_X1 \uut_rx/U6  ( .A1(\uut_rx/n6 ), .A2(\uut_rx/n79 ), .ZN(\uut_rx/n2 )
         );
  CLKBUF_X1 \uut_rx/U5  ( .A(\uut_rx/n59 ), .Z(\uut_rx/n1 ) );
  MUX2_X1 \uut_rx/U4  ( .A(\uut_rx/n4 ), .B(\uut_rx/n48 ), .S(
        \uut_rx/count_8 [1]), .Z(\uut_rx/n69 ) );
  OR2_X1 \uut_rx/U3  ( .A1(\uut_rx/n59 ), .A2(\uut_rx/n61 ), .ZN(\uut_rx/n3 )
         );
  DFF_X1 \uut_rx/count_16_reg[1]  ( .D(\uut_rx/n74 ), .CK(clk), .Q(
        \uut_rx/n40 ), .QN(\uut_rx/n16 ) );
  DFF_X1 \uut_rx/count_16_reg[0]  ( .D(\uut_rx/n87 ), .CK(clk), .Q(
        \uut_rx/count_16 [0]), .QN(\uut_rx/n30 ) );
  DFF_X1 \uut_rx/current_state_reg[1]  ( .D(\uut_rx/n75 ), .CK(clk), .Q(
        \uut_rx/current_state [1]), .QN(\uut_rx/n56 ) );
  DFF_X1 \uut_rx/data_save_reg[1]  ( .D(\uut_rx/n94 ), .CK(clk), .Q(
        \uut_rx/data_save [1]) );
  DFF_X1 \uut_rx/data_save_reg[2]  ( .D(\uut_rx/n93 ), .CK(clk), .Q(
        \uut_rx/data_save [2]) );
  DFF_X1 \uut_rx/data_save_reg[3]  ( .D(\uut_rx/n92 ), .CK(clk), .Q(
        \uut_rx/data_save [3]) );
  DFF_X1 \uut_rx/data_save_reg[4]  ( .D(\uut_rx/n91 ), .CK(clk), .Q(
        \uut_rx/data_save [4]) );
  DFF_X1 \uut_rx/data_save_reg[5]  ( .D(\uut_rx/n90 ), .CK(clk), .Q(
        \uut_rx/data_save [5]) );
  DFF_X1 \uut_rx/data_save_reg[6]  ( .D(\uut_rx/n89 ), .CK(clk), .Q(
        \uut_rx/data_save [6]) );
  DFF_X1 \uut_rx/data_save_reg[7]  ( .D(\uut_rx/n88 ), .CK(clk), .Q(
        \uut_rx/data_save [7]), .QN(\uut_rx/n86 ) );
  DFF_X1 \uut_rx/count_16_reg[2]  ( .D(\uut_rx/n73 ), .CK(clk), .Q(
        \uut_rx/count_16 [2]), .QN(\uut_rx/n37 ) );
  DFF_X1 \uut_rx/count_16_reg[3]  ( .D(\uut_rx/n72 ), .CK(clk), .Q(
        \uut_rx/n43 ), .QN(\uut_rx/n13 ) );
  DFF_X1 \uut_rx/count_8_reg[1]  ( .D(\uut_rx/n69 ), .CK(clk), .Q(
        \uut_rx/count_8 [1]), .QN(\uut_rx/n51 ) );
  DFF_X1 \uut_rx/count_8_reg[2]  ( .D(\uut_rx/n68 ), .CK(clk), .Q(
        \uut_rx/count_8 [2]), .QN(\uut_rx/n19 ) );
  DFF_X1 \uut_rx/count_8_reg[0]  ( .D(\uut_rx/n70 ), .CK(clk), .Q(
        \uut_rx/count_8 [0]), .QN(\uut_rx/n22 ) );
  DFF_X1 \uut_rx/count_16_indication_reg  ( .D(\uut_rx/N45 ), .CK(clk), .Q(
        \uut_rx/count_16_indication ) );
  DFF_X1 \uut_rx/count_8_indication_reg  ( .D(\uut_rx/N64 ), .CK(clk), .Q(
        \uut_rx/count_8_indication ) );
  DFF_X1 \uut_rx/ext_data_out_reg[7]  ( .D(\uut_rx/N82 ), .CK(clk), .Q(
        data_in[7]) );
  DFF_X1 \uut_rx/ext_data_out_reg[6]  ( .D(\uut_rx/n18 ), .CK(clk), .Q(
        data_in[6]) );
  DFF_X1 \uut_rx/ext_data_out_reg[5]  ( .D(\uut_rx/n20 ), .CK(clk), .Q(
        data_in[5]) );
  DFF_X1 \uut_rx/ext_data_out_reg[4]  ( .D(\uut_rx/n21 ), .CK(clk), .Q(
        data_in[4]) );
  DFF_X1 \uut_rx/ext_data_out_reg[3]  ( .D(\uut_rx/n23 ), .CK(clk), .Q(
        data_in[3]) );
  DFF_X1 \uut_rx/ext_data_out_reg[2]  ( .D(\uut_rx/n24 ), .CK(clk), .Q(
        data_in[2]) );
  DFF_X1 \uut_rx/ext_data_out_reg[1]  ( .D(\uut_rx/n26 ), .CK(clk), .Q(
        data_in[1]) );
  DFF_X1 \uut_rx/ext_data_out_reg[0]  ( .D(\uut_rx/n27 ), .CK(clk), .Q(
        data_in[0]) );
  DFF_X1 \uut_rx/data_save_reg[0]  ( .D(\uut_rx/n71 ), .CK(clk), .Q(
        \uut_rx/n83 ) );
  DFF_X1 \uut_rx/current_state_reg[0]  ( .D(\uut_rx/n76 ), .CK(clk), .Q(
        \uut_rx/current_state [0]), .QN(\uut_rx/n25 ) );
endmodule

