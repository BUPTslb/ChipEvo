/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 13:54:21 2026
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
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, \uut_baud_rate/n85 ,
         \uut_baud_rate/n84 , \uut_baud_rate/n83 , \uut_baud_rate/n82 ,
         \uut_baud_rate/n81 , \uut_baud_rate/n80 , \uut_baud_rate/n79 ,
         \uut_baud_rate/n78 , \uut_baud_rate/n77 , \uut_baud_rate/n76 ,
         \uut_baud_rate/n75 , \uut_baud_rate/n74 , \uut_baud_rate/n73 ,
         \uut_baud_rate/n72 , \uut_baud_rate/n71 , \uut_baud_rate/n70 ,
         \uut_baud_rate/n69 , \uut_baud_rate/n68 , \uut_baud_rate/n67 ,
         \uut_baud_rate/n66 , \uut_baud_rate/n65 , \uut_baud_rate/n64 ,
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
         \uut_baud_rate/n30 , \uut_baud_rate/n29 , \uut_baud_rate/n28 ,
         \uut_baud_rate/n16 , \uut_baud_rate/n15 , \uut_baud_rate/n14 ,
         \uut_baud_rate/n13 , \uut_baud_rate/n12 , \uut_baud_rate/n11 ,
         \uut_baud_rate/n10 , \uut_baud_rate/n9 , \uut_baud_rate/n8 ,
         \uut_baud_rate/n7 , \uut_baud_rate/n6 , \uut_baud_rate/n5 ,
         \uut_baud_rate/n4 , \uut_baud_rate/n3 , \uut_baud_rate/n27 ,
         \uut_baud_rate/n26 , \uut_baud_rate/n25 , \uut_baud_rate/n24 ,
         \uut_baud_rate/n23 , \uut_baud_rate/n22 , \uut_baud_rate/n21 ,
         \uut_baud_rate/n20 , \uut_baud_rate/n19 , \uut_baud_rate/n18 ,
         \uut_baud_rate/n17 , \uut_baud_rate/N111 , \uut_baud_rate/N110 ,
         \uut_baud_rate/N109 , \uut_baud_rate/N108 , \uut_baud_rate/N107 ,
         \uut_baud_rate/N106 , \uut_baud_rate/N105 , \uut_baud_rate/N104 ,
         \uut_baud_rate/N103 , \uut_baud_rate/N102 , \uut_baud_rate/N101 ,
         \uut_baud_rate/N100 , \uut_baud_rate/N99 , \uut_baud_rate/N98 ,
         \uut_baud_rate/N97 , \uut_baud_rate/N96 , \uut_baud_rate/N95 ,
         \uut_baud_rate/N94 , \uut_baud_rate/N93 , \uut_baud_rate/N92 ,
         \uut_baud_rate/N91 , \uut_baud_rate/N90 , \uut_baud_rate/N89 ,
         \uut_baud_rate/N88 , \uut_baud_rate/N87 , \uut_baud_rate/N86 ,
         \uut_baud_rate/N85 , \uut_baud_rate/N84 , \uut_baud_rate/N83 ,
         \uut_baud_rate/N82 , \uut_baud_rate/N81 , \uut_baud_rate/N46 ,
         \uut_baud_rate/N45 , \uut_baud_rate/N44 , \uut_baud_rate/N43 ,
         \uut_baud_rate/N42 , \uut_baud_rate/N41 , \uut_baud_rate/N40 ,
         \uut_baud_rate/N39 , \uut_baud_rate/N38 , \uut_baud_rate/N37 ,
         \uut_baud_rate/N36 , \uut_baud_rate/N35 , \uut_baud_rate/N34 ,
         \uut_baud_rate/N33 , \uut_baud_rate/N32 , \uut_baud_rate/N31 ,
         \uut_baud_rate/N30 , \uut_baud_rate/N29 , \uut_baud_rate/N28 ,
         \uut_baud_rate/N27 , \uut_baud_rate/N26 , \uut_baud_rate/N25 ,
         \uut_baud_rate/N24 , \uut_baud_rate/N23 , \uut_baud_rate/N22 ,
         \uut_baud_rate/N21 , \uut_baud_rate/N20 , \uut_baud_rate/N19 ,
         \uut_baud_rate/N18 , \uut_baud_rate/N17 , \uut_baud_rate/N16 ,
         \uut_baud_rate/N15 , \uut_baud_rate/N12 , \uut_baud_rate/temp_en ,
         \uut_baud_rate/add_149/n332 , \uut_baud_rate/add_149/n331 ,
         \uut_baud_rate/add_149/n330 , \uut_baud_rate/add_149/n329 ,
         \uut_baud_rate/add_149/n328 , \uut_baud_rate/add_149/n327 ,
         \uut_baud_rate/add_149/n326 , \uut_baud_rate/add_149/n325 ,
         \uut_baud_rate/add_149/n324 , \uut_baud_rate/add_149/n323 ,
         \uut_baud_rate/add_149/n322 , \uut_baud_rate/add_149/n321 ,
         \uut_baud_rate/add_149/n320 , \uut_baud_rate/add_149/n319 ,
         \uut_baud_rate/add_149/n318 , \uut_baud_rate/add_149/n317 ,
         \uut_baud_rate/add_149/n316 , \uut_baud_rate/add_149/n315 ,
         \uut_baud_rate/add_149/n314 , \uut_baud_rate/add_149/n313 ,
         \uut_baud_rate/add_149/n312 , \uut_baud_rate/add_149/n311 ,
         \uut_baud_rate/add_149/n310 , \uut_baud_rate/add_149/n309 ,
         \uut_baud_rate/add_149/n308 , \uut_baud_rate/add_149/n307 ,
         \uut_baud_rate/add_149/n306 , \uut_baud_rate/add_149/n305 ,
         \uut_baud_rate/add_149/n304 , \uut_baud_rate/add_149/n303 ,
         \uut_baud_rate/add_149/n302 , \uut_baud_rate/add_149/n301 ,
         \uut_baud_rate/add_149/n300 , \uut_baud_rate/add_149/n299 ,
         \uut_baud_rate/add_149/n298 , \uut_baud_rate/add_149/n297 ,
         \uut_baud_rate/add_149/n296 , \uut_baud_rate/add_149/n295 ,
         \uut_baud_rate/add_149/n294 , \uut_baud_rate/add_149/n293 ,
         \uut_baud_rate/add_149/n292 , \uut_baud_rate/add_149/n291 ,
         \uut_baud_rate/add_149/n290 , \uut_baud_rate/add_149/n289 ,
         \uut_baud_rate/add_149/n288 , \uut_baud_rate/add_149/n287 ,
         \uut_baud_rate/add_149/n286 , \uut_baud_rate/add_149/n285 ,
         \uut_baud_rate/add_149/n284 , \uut_baud_rate/add_149/n283 ,
         \uut_baud_rate/add_149/n282 , \uut_baud_rate/add_149/n281 ,
         \uut_baud_rate/add_149/n280 , \uut_baud_rate/add_149/n279 ,
         \uut_baud_rate/add_149/n278 , \uut_baud_rate/add_149/n277 ,
         \uut_baud_rate/add_149/n276 , \uut_baud_rate/add_149/n275 ,
         \uut_baud_rate/add_149/n274 , \uut_baud_rate/add_149/n273 ,
         \uut_baud_rate/add_149/n272 , \uut_baud_rate/add_149/n271 ,
         \uut_baud_rate/add_149/n270 , \uut_baud_rate/add_149/n269 ,
         \uut_baud_rate/add_149/n268 , \uut_baud_rate/add_149/n267 ,
         \uut_baud_rate/add_149/n266 , \uut_baud_rate/add_149/n265 ,
         \uut_baud_rate/add_149/n264 , \uut_baud_rate/add_149/n263 ,
         \uut_baud_rate/add_149/n262 , \uut_baud_rate/add_149/n261 ,
         \uut_baud_rate/add_149/n260 , \uut_baud_rate/add_149/n259 ,
         \uut_baud_rate/add_149/n258 , \uut_baud_rate/add_149/n257 ,
         \uut_baud_rate/add_149/n256 , \uut_baud_rate/add_149/n255 ,
         \uut_baud_rate/add_149/n254 , \uut_baud_rate/add_149/n253 ,
         \uut_baud_rate/add_149/n252 , \uut_baud_rate/add_149/n251 ,
         \uut_baud_rate/add_149/n250 , \uut_baud_rate/add_149/n249 ,
         \uut_baud_rate/add_149/n248 , \uut_baud_rate/add_149/n247 ,
         \uut_baud_rate/add_149/n246 , \uut_baud_rate/add_149/n245 ,
         \uut_baud_rate/add_149/n244 , \uut_baud_rate/add_149/n243 ,
         \uut_baud_rate/add_149/n242 , \uut_baud_rate/add_149/n241 ,
         \uut_baud_rate/add_149/n240 , \uut_baud_rate/add_149/n239 ,
         \uut_baud_rate/add_149/n238 , \uut_baud_rate/add_149/n237 ,
         \uut_baud_rate/add_149/n236 , \uut_baud_rate/add_149/n235 ,
         \uut_baud_rate/add_149/n234 , \uut_baud_rate/add_149/n233 ,
         \uut_baud_rate/add_149/n232 , \uut_baud_rate/add_149/n231 ,
         \uut_baud_rate/add_149/n230 , \uut_baud_rate/add_149/n229 ,
         \uut_baud_rate/add_149/n228 , \uut_baud_rate/add_149/n227 ,
         \uut_baud_rate/add_149/n226 , \uut_baud_rate/add_149/n225 ,
         \uut_baud_rate/add_149/n224 , \uut_baud_rate/add_149/n223 ,
         \uut_baud_rate/add_149/n222 , \uut_baud_rate/add_149/n221 ,
         \uut_baud_rate/add_149/n220 , \uut_baud_rate/add_149/n219 ,
         \uut_baud_rate/add_149/n218 , \uut_baud_rate/add_149/n217 ,
         \uut_baud_rate/add_149/n216 , \uut_baud_rate/add_149/n215 ,
         \uut_baud_rate/add_149/n214 , \uut_baud_rate/add_149/n213 ,
         \uut_baud_rate/add_149/n212 , \uut_baud_rate/add_149/n211 ,
         \uut_baud_rate/add_149/n210 , \uut_baud_rate/add_149/n209 ,
         \uut_baud_rate/add_149/n208 , \uut_baud_rate/add_149/n207 ,
         \uut_baud_rate/add_149/n206 , \uut_baud_rate/add_149/n205 ,
         \uut_baud_rate/add_149/n204 , \uut_baud_rate/add_149/n203 ,
         \uut_baud_rate/add_149/n202 , \uut_baud_rate/add_149/n201 ,
         \uut_baud_rate/add_149/n200 , \uut_baud_rate/add_149/n199 ,
         \uut_baud_rate/add_149/n198 , \uut_baud_rate/add_149/n197 ,
         \uut_baud_rate/add_149/n196 , \uut_baud_rate/add_149/n195 ,
         \uut_baud_rate/add_149/n194 , \uut_baud_rate/add_149/n193 ,
         \uut_baud_rate/add_149/n192 , \uut_baud_rate/add_149/n191 ,
         \uut_baud_rate/add_149/n190 , \uut_baud_rate/add_149/n189 ,
         \uut_baud_rate/add_149/n188 , \uut_baud_rate/add_149/n187 ,
         \uut_baud_rate/add_149/n186 , \uut_baud_rate/add_149/n185 ,
         \uut_baud_rate/add_149/n184 , \uut_baud_rate/add_149/n183 ,
         \uut_baud_rate/add_149/n182 , \uut_baud_rate/add_149/n181 ,
         \uut_baud_rate/add_149/n180 , \uut_baud_rate/add_149/n179 ,
         \uut_baud_rate/add_149/n178 , \uut_baud_rate/add_149/n177 ,
         \uut_baud_rate/add_149/n176 , \uut_baud_rate/add_149/n175 ,
         \uut_baud_rate/add_149/n174 , \uut_baud_rate/add_149/n173 ,
         \uut_baud_rate/add_149/n172 , \uut_baud_rate/add_149/n171 ,
         \uut_baud_rate/add_149/n170 , \uut_baud_rate/add_149/n169 ,
         \uut_baud_rate/add_149/n168 , \uut_baud_rate/add_149/n167 ,
         \uut_baud_rate/add_149/n166 , \uut_baud_rate/add_149/n165 ,
         \uut_baud_rate/add_149/n164 , \uut_baud_rate/add_149/n163 ,
         \uut_baud_rate/add_149/n162 , \uut_baud_rate/add_149/n161 ,
         \uut_baud_rate/add_149/n160 , \uut_baud_rate/add_149/n159 ,
         \uut_baud_rate/add_149/n158 , \uut_baud_rate/add_149/n157 ,
         \uut_baud_rate/add_149/n156 , \uut_baud_rate/add_149/n155 ,
         \uut_baud_rate/add_149/n154 , \uut_baud_rate/add_149/n153 ,
         \uut_baud_rate/add_149/n152 , \uut_baud_rate/add_149/n151 ,
         \uut_baud_rate/add_149/n150 , \uut_baud_rate/add_149/n149 ,
         \uut_baud_rate/add_149/n148 , \uut_baud_rate/add_149/n147 ,
         \uut_baud_rate/add_149/n146 , \uut_baud_rate/add_149/n145 ,
         \uut_baud_rate/add_149/n144 , \uut_baud_rate/add_149/n143 ,
         \uut_baud_rate/add_149/n142 , \uut_baud_rate/add_149/n141 ,
         \uut_baud_rate/add_149/n140 , \uut_baud_rate/add_149/n139 ,
         \uut_baud_rate/add_149/n138 , \uut_baud_rate/add_149/n137 ,
         \uut_baud_rate/add_149/n136 , \uut_baud_rate/add_149/n135 ,
         \uut_baud_rate/add_149/n134 , \uut_baud_rate/add_149/n133 ,
         \uut_baud_rate/add_149/n132 , \uut_baud_rate/add_149/n131 ,
         \uut_baud_rate/add_149/n130 , \uut_baud_rate/add_149/n129 ,
         \uut_baud_rate/add_149/n128 , \uut_baud_rate/add_149/n127 ,
         \uut_baud_rate/add_149/n126 , \uut_baud_rate/add_149/n125 ,
         \uut_baud_rate/add_149/n124 , \uut_baud_rate/add_149/n123 ,
         \uut_baud_rate/add_149/n122 , \uut_baud_rate/add_149/n121 ,
         \uut_baud_rate/add_149/n120 , \uut_baud_rate/add_149/n119 ,
         \uut_baud_rate/add_149/n118 , \uut_baud_rate/add_149/n117 ,
         \uut_baud_rate/add_149/n116 , \uut_baud_rate/add_149/n115 ,
         \uut_baud_rate/add_149/n114 , \uut_baud_rate/add_149/n113 ,
         \uut_baud_rate/add_149/n112 , \uut_baud_rate/add_149/n111 ,
         \uut_baud_rate/add_149/n110 , \uut_baud_rate/add_149/n109 ,
         \uut_baud_rate/add_149/n108 , \uut_baud_rate/add_149/n107 ,
         \uut_baud_rate/add_149/n106 , \uut_baud_rate/add_149/n105 ,
         \uut_baud_rate/add_149/n104 , \uut_baud_rate/add_149/n103 ,
         \uut_baud_rate/add_149/n102 , \uut_baud_rate/add_149/n101 ,
         \uut_baud_rate/add_149/n100 , \uut_baud_rate/add_149/n99 ,
         \uut_baud_rate/add_149/n98 , \uut_baud_rate/add_149/n97 ,
         \uut_baud_rate/add_149/n96 , \uut_baud_rate/add_149/n95 ,
         \uut_baud_rate/add_149/n94 , \uut_baud_rate/add_149/n93 ,
         \uut_baud_rate/add_149/n92 , \uut_baud_rate/add_149/n91 ,
         \uut_baud_rate/add_149/n90 , \uut_baud_rate/add_149/n89 ,
         \uut_baud_rate/add_149/n88 , \uut_baud_rate/add_149/n87 ,
         \uut_baud_rate/add_149/n86 , \uut_baud_rate/add_149/n85 ,
         \uut_baud_rate/add_149/n84 , \uut_baud_rate/add_149/n83 ,
         \uut_baud_rate/add_149/n82 , \uut_baud_rate/add_149/n81 ,
         \uut_baud_rate/add_149/n80 , \uut_baud_rate/add_149/n79 ,
         \uut_baud_rate/add_149/n78 , \uut_baud_rate/add_149/n77 ,
         \uut_baud_rate/add_149/n76 , \uut_baud_rate/add_149/n75 ,
         \uut_baud_rate/add_149/n74 , \uut_baud_rate/add_149/n73 ,
         \uut_baud_rate/add_149/n72 , \uut_baud_rate/add_149/n71 ,
         \uut_baud_rate/add_149/n70 , \uut_baud_rate/add_149/n69 ,
         \uut_baud_rate/add_149/n68 , \uut_baud_rate/add_149/n67 ,
         \uut_baud_rate/add_149/n66 , \uut_baud_rate/add_149/n65 ,
         \uut_baud_rate/add_149/n64 , \uut_baud_rate/add_149/n63 ,
         \uut_baud_rate/add_149/n62 , \uut_baud_rate/add_149/n61 ,
         \uut_baud_rate/add_149/n60 , \uut_baud_rate/add_149/n59 ,
         \uut_baud_rate/add_149/n58 , \uut_baud_rate/add_149/n57 ,
         \uut_baud_rate/add_149/n56 , \uut_baud_rate/add_149/n55 ,
         \uut_baud_rate/add_149/n54 , \uut_baud_rate/add_149/n53 ,
         \uut_baud_rate/add_149/n52 , \uut_baud_rate/add_149/n50 ,
         \uut_baud_rate/add_149/n49 , \uut_baud_rate/add_149/n48 ,
         \uut_baud_rate/add_149/n47 , \uut_baud_rate/add_149/n46 ,
         \uut_baud_rate/add_149/n45 , \uut_baud_rate/add_149/n44 ,
         \uut_baud_rate/add_149/n43 , \uut_baud_rate/add_149/n42 ,
         \uut_baud_rate/add_149/n41 , \uut_baud_rate/add_149/n40 ,
         \uut_baud_rate/add_149/n39 , \uut_baud_rate/add_149/n38 ,
         \uut_baud_rate/add_149/n37 , \uut_baud_rate/add_149/n36 ,
         \uut_baud_rate/add_149/n35 , \uut_baud_rate/add_149/n34 ,
         \uut_baud_rate/add_149/n33 , \uut_baud_rate/add_149/n32 ,
         \uut_baud_rate/add_149/n31 , \uut_baud_rate/add_149/n30 ,
         \uut_baud_rate/add_149/n29 , \uut_baud_rate/add_149/n28 ,
         \uut_baud_rate/add_149/n27 , \uut_baud_rate/add_149/n26 ,
         \uut_baud_rate/add_149/n25 , \uut_baud_rate/add_149/n24 ,
         \uut_baud_rate/add_149/n23 , \uut_baud_rate/add_149/n22 ,
         \uut_baud_rate/add_149/n20 , \uut_baud_rate/add_149/n19 ,
         \uut_baud_rate/add_149/n18 , \uut_baud_rate/add_149/n17 ,
         \uut_baud_rate/add_149/n16 , \uut_baud_rate/add_149/n15 ,
         \uut_baud_rate/add_149/n14 , \uut_baud_rate/add_149/n13 ,
         \uut_baud_rate/add_149/n12 , \uut_baud_rate/add_149/n11 ,
         \uut_baud_rate/add_149/n10 , \uut_baud_rate/add_149/n9 ,
         \uut_baud_rate/add_149/n8 , \uut_baud_rate/add_149/n7 ,
         \uut_baud_rate/add_149/n6 , \uut_baud_rate/add_149/n5 ,
         \uut_baud_rate/add_149/n4 , \uut_baud_rate/add_149/n3 ,
         \uut_baud_rate/add_149/n2 , \uut_baud_rate/add_149/n1 ,
         \uut_baud_rate/eq_144/n46 , \uut_baud_rate/eq_144/n45 ,
         \uut_baud_rate/eq_144/n44 , \uut_baud_rate/eq_144/n43 ,
         \uut_baud_rate/eq_144/n42 , \uut_baud_rate/eq_144/n41 ,
         \uut_baud_rate/eq_144/n40 , \uut_baud_rate/eq_144/n39 ,
         \uut_baud_rate/eq_144/n38 , \uut_baud_rate/eq_144/n37 ,
         \uut_baud_rate/eq_144/n36 , \uut_baud_rate/eq_144/n35 ,
         \uut_baud_rate/eq_144/n34 , \uut_baud_rate/eq_144/n33 ,
         \uut_baud_rate/eq_144/n32 , \uut_baud_rate/eq_144/n31 ,
         \uut_baud_rate/eq_144/n30 , \uut_baud_rate/eq_144/n29 ,
         \uut_baud_rate/eq_144/n28 , \uut_baud_rate/eq_144/n27 ,
         \uut_baud_rate/eq_144/n26 , \uut_baud_rate/eq_144/n25 ,
         \uut_baud_rate/eq_144/n24 , \uut_baud_rate/eq_144/n23 ,
         \uut_baud_rate/eq_144/n22 , \uut_baud_rate/eq_144/n21 ,
         \uut_baud_rate/eq_144/n20 , \uut_baud_rate/eq_144/n19 ,
         \uut_baud_rate/eq_144/n18 , \uut_baud_rate/eq_144/n17 ,
         \uut_baud_rate/eq_144/n16 , \uut_baud_rate/eq_144/n15 ,
         \uut_baud_rate/eq_144/n14 , \uut_baud_rate/eq_144/n13 ,
         \uut_baud_rate/eq_144/n12 , \uut_baud_rate/eq_144/n11 ,
         \uut_baud_rate/eq_144/n10 , \uut_baud_rate/eq_144/n9 ,
         \uut_baud_rate/eq_144/n8 , \uut_baud_rate/eq_144/n7 ,
         \uut_baud_rate/eq_144/n6 , \uut_baud_rate/eq_144/n5 ,
         \uut_baud_rate/eq_144/n4 , \uut_baud_rate/eq_144/n3 ,
         \uut_baud_rate/eq_144/n2 , \uut_baud_rate/eq_144/n1 , \uut_tx/n90 ,
         \uut_tx/n89 , \uut_tx/n88 , \uut_tx/n87 , \uut_tx/n86 , \uut_tx/n85 ,
         \uut_tx/n84 , \uut_tx/n83 , \uut_tx/n82 , \uut_tx/n81 , \uut_tx/n80 ,
         \uut_tx/n79 , \uut_tx/n78 , \uut_tx/n77 , \uut_tx/n76 , \uut_tx/n75 ,
         \uut_tx/n74 , \uut_tx/n73 , \uut_tx/n72 , \uut_tx/n71 , \uut_tx/n70 ,
         \uut_tx/n69 , \uut_tx/n68 , \uut_tx/n67 , \uut_tx/n66 , \uut_tx/n65 ,
         \uut_tx/n64 , \uut_tx/n63 , \uut_tx/n62 , \uut_tx/n61 , \uut_tx/n56 ,
         \uut_tx/n55 , \uut_tx/n54 , \uut_tx/n53 , \uut_tx/n52 , \uut_tx/n51 ,
         \uut_tx/n50 , \uut_tx/n49 , \uut_tx/n48 , \uut_tx/n47 , \uut_tx/n46 ,
         \uut_tx/n45 , \uut_tx/n44 , \uut_tx/n43 , \uut_tx/n42 , \uut_tx/n41 ,
         \uut_tx/n40 , \uut_tx/n39 , \uut_tx/n38 , \uut_tx/n37 , \uut_tx/n36 ,
         \uut_tx/n35 , \uut_tx/n34 , \uut_tx/n33 , \uut_tx/n32 , \uut_tx/n31 ,
         \uut_tx/n30 , \uut_tx/n29 , \uut_tx/n28 , \uut_tx/n27 , \uut_tx/n26 ,
         \uut_tx/n25 , \uut_tx/n24 , \uut_tx/n23 , \uut_tx/n21 , \uut_tx/n20 ,
         \uut_tx/n12 , \uut_tx/n8 , \uut_tx/n6 , \uut_tx/n5 , \uut_tx/n4 ,
         \uut_tx/n3 , \uut_tx/n2 , \uut_tx/n1 , \uut_tx/n60 , \uut_tx/n59 ,
         \uut_tx/n58 , \uut_tx/n57 , \uut_tx/n22 , \uut_tx/n19 , \uut_tx/n18 ,
         \uut_tx/n17 , \uut_tx/n16 , \uut_tx/n15 , \uut_tx/n14 , \uut_tx/n13 ,
         \uut_tx/n11 , \uut_tx/n10 , \uut_tx/n9 , \uut_tx/n7 , \uut_tx/N98 ,
         \uut_tx/N96 , \uut_tx/N92 , \uut_tx/N84 , \uut_tx/N83 , \uut_tx/N80 ,
         \uut_tx/N79 , \uut_tx/N78 , \uut_tx/N77 , \uut_tx/N76 , \uut_tx/N75 ,
         \uut_tx/N74 , \uut_tx/N73 , \uut_tx/N72 , \uut_tx/N71 , \uut_tx/N70 ,
         \uut_tx/N69 , \uut_tx/count_8_indication , \uut_tx/N33 ,
         \uut_tx/count_16_indication , \uut_rx/n110 , \uut_rx/n109 ,
         \uut_rx/n108 , \uut_rx/n107 , \uut_rx/n106 , \uut_rx/n105 ,
         \uut_rx/n104 , \uut_rx/n103 , \uut_rx/n102 , \uut_rx/n101 ,
         \uut_rx/n100 , \uut_rx/n99 , \uut_rx/n98 , \uut_rx/n97 , \uut_rx/n96 ,
         \uut_rx/n95 , \uut_rx/n94 , \uut_rx/n93 , \uut_rx/n92 , \uut_rx/n91 ,
         \uut_rx/n90 , \uut_rx/n89 , \uut_rx/n88 , \uut_rx/n87 , \uut_rx/n86 ,
         \uut_rx/n85 , \uut_rx/n84 , \uut_rx/n83 , \uut_rx/n82 , \uut_rx/n81 ,
         \uut_rx/n80 , \uut_rx/n79 , \uut_rx/n78 , \uut_rx/n77 , \uut_rx/n65 ,
         \uut_rx/n64 , \uut_rx/n63 , \uut_rx/n62 , \uut_rx/n61 , \uut_rx/n60 ,
         \uut_rx/n59 , \uut_rx/n58 , \uut_rx/n57 , \uut_rx/n56 , \uut_rx/n55 ,
         \uut_rx/n54 , \uut_rx/n53 , \uut_rx/n52 , \uut_rx/n51 , \uut_rx/n50 ,
         \uut_rx/n49 , \uut_rx/n48 , \uut_rx/n47 , \uut_rx/n46 , \uut_rx/n45 ,
         \uut_rx/n44 , \uut_rx/n43 , \uut_rx/n42 , \uut_rx/n41 , \uut_rx/n40 ,
         \uut_rx/n39 , \uut_rx/n38 , \uut_rx/n37 , \uut_rx/n36 , \uut_rx/n35 ,
         \uut_rx/n34 , \uut_rx/n33 , \uut_rx/n30 , \uut_rx/n29 , \uut_rx/n28 ,
         \uut_rx/n24 , \uut_rx/n22 , \uut_rx/n20 , \uut_rx/n18 , \uut_rx/n16 ,
         \uut_rx/n14 , \uut_rx/n12 , \uut_rx/n10 , \uut_rx/n9 , \uut_rx/n8 ,
         \uut_rx/n7 , \uut_rx/n5 , \uut_rx/n4 , \uut_rx/n3 , \uut_rx/n2 ,
         \uut_rx/n1 , \uut_rx/n76 , \uut_rx/n75 , \uut_rx/n74 , \uut_rx/n73 ,
         \uut_rx/n72 , \uut_rx/n71 , \uut_rx/n70 , \uut_rx/n69 , \uut_rx/n68 ,
         \uut_rx/n67 , \uut_rx/n66 , \uut_rx/n32 , \uut_rx/n31 , \uut_rx/n27 ,
         \uut_rx/n26 , \uut_rx/n25 , \uut_rx/n23 , \uut_rx/n21 , \uut_rx/n19 ,
         \uut_rx/n17 , \uut_rx/n15 , \uut_rx/n13 , \uut_rx/n11 , \uut_rx/n6 ,
         \uut_rx/N112 , \uut_rx/N110 , \uut_rx/N98 , \uut_rx/N97 ,
         \uut_rx/N78 , \uut_rx/N77 , \uut_rx/N76 , \uut_rx/N75 ,
         \uut_rx/count_8_indication , \uut_rx/count_8[1] , \uut_rx/N47 ,
         \uut_rx/count_16_indication ;
  wire   [31:0] baud_division;
  wire   [7:0] data_out;
  wire   [7:0] data_in;
  wire   [31:0] \uut_baud_rate/baud_count ;
  wire   [1:0] \uut_tx/next_state ;
  wire   [2:0] \uut_tx/count_8 ;
  wire   [1:0] \uut_tx/current_state ;
  wire   [1:0] \uut_rx/next_state ;
  wire   [1:0] \uut_rx/current_state ;
  wire   [3:0] \uut_rx/count_16 ;

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
  OAI21_X1 \uut_baud_rate/U90  ( .B1(\uut_baud_rate/n84 ), .B2(
        \uut_baud_rate/n83 ), .A(\uut_baud_rate/n82 ), .ZN(\uut_baud_rate/n25 ) );
  NAND3_X1 \uut_baud_rate/U89  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n84 ), .A3(\uut_baud_rate/n81 ), .ZN(
        \uut_baud_rate/n82 ) );
  AND2_X1 \uut_baud_rate/U88  ( .A1(\uut_baud_rate/N46 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N111 ) );
  NAND2_X1 \uut_baud_rate/U87  ( .A1(\uut_baud_rate/n80 ), .A2(
        \uut_baud_rate/n84 ), .ZN(\uut_baud_rate/n85 ) );
  NAND3_X1 \uut_baud_rate/U86  ( .A1(\uut_baud_rate/n70 ), .A2(
        \uut_baud_rate/N15 ), .A3(\uut_baud_rate/n66 ), .ZN(
        \uut_baud_rate/n80 ) );
  NAND2_X1 \uut_baud_rate/U85  ( .A1(\uut_baud_rate/n81 ), .A2(
        \uut_baud_rate/n78 ), .ZN(\uut_baud_rate/n84 ) );
  INV_X1 \uut_baud_rate/U84  ( .A(\uut_baud_rate/n77 ), .ZN(
        \uut_baud_rate/n78 ) );
  AND2_X1 \uut_baud_rate/U83  ( .A1(\uut_baud_rate/N16 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N81 ) );
  AND2_X1 \uut_baud_rate/U82  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/N17 ), .ZN(\uut_baud_rate/N82 ) );
  AND2_X1 \uut_baud_rate/U81  ( .A1(\uut_baud_rate/N18 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N83 ) );
  AND2_X1 \uut_baud_rate/U80  ( .A1(\uut_baud_rate/N19 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N84 ) );
  AND2_X1 \uut_baud_rate/U79  ( .A1(\uut_baud_rate/N20 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N85 ) );
  AND2_X1 \uut_baud_rate/U78  ( .A1(\uut_baud_rate/N21 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N86 ) );
  AND2_X1 \uut_baud_rate/U77  ( .A1(\uut_baud_rate/N22 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N87 ) );
  AND2_X1 \uut_baud_rate/U76  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/N23 ), .ZN(\uut_baud_rate/N88 ) );
  AND2_X1 \uut_baud_rate/U75  ( .A1(\uut_baud_rate/N24 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N89 ) );
  AND2_X1 \uut_baud_rate/U74  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/N25 ), .ZN(\uut_baud_rate/N90 ) );
  AND2_X1 \uut_baud_rate/U73  ( .A1(\uut_baud_rate/N26 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N91 ) );
  AND2_X1 \uut_baud_rate/U72  ( .A1(\uut_baud_rate/N27 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N92 ) );
  AND2_X1 \uut_baud_rate/U71  ( .A1(\uut_baud_rate/N28 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N93 ) );
  AND2_X1 \uut_baud_rate/U70  ( .A1(\uut_baud_rate/N29 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N94 ) );
  AND2_X1 \uut_baud_rate/U69  ( .A1(\uut_baud_rate/N30 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N95 ) );
  AND2_X1 \uut_baud_rate/U68  ( .A1(\uut_baud_rate/N31 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N96 ) );
  AND2_X1 \uut_baud_rate/U67  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/N32 ), .ZN(\uut_baud_rate/N97 ) );
  AND2_X1 \uut_baud_rate/U66  ( .A1(\uut_baud_rate/N33 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N98 ) );
  AND2_X1 \uut_baud_rate/U65  ( .A1(\uut_baud_rate/N34 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N99 ) );
  AND2_X1 \uut_baud_rate/U64  ( .A1(\uut_baud_rate/N35 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N100 ) );
  AND2_X1 \uut_baud_rate/U63  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/N36 ), .ZN(\uut_baud_rate/N101 ) );
  AND2_X1 \uut_baud_rate/U62  ( .A1(\uut_baud_rate/N37 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N102 ) );
  AND2_X1 \uut_baud_rate/U61  ( .A1(\uut_baud_rate/N38 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N103 ) );
  AND2_X1 \uut_baud_rate/U60  ( .A1(\uut_baud_rate/N39 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N104 ) );
  AND2_X1 \uut_baud_rate/U59  ( .A1(\uut_baud_rate/N40 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N105 ) );
  AND2_X1 \uut_baud_rate/U58  ( .A1(\uut_baud_rate/N41 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N106 ) );
  AND2_X1 \uut_baud_rate/U57  ( .A1(\uut_baud_rate/N42 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N107 ) );
  AND2_X1 \uut_baud_rate/U56  ( .A1(\uut_baud_rate/N43 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N108 ) );
  AND2_X1 \uut_baud_rate/U55  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/N44 ), .ZN(\uut_baud_rate/N109 ) );
  AND2_X1 \uut_baud_rate/U54  ( .A1(\uut_baud_rate/N45 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/N110 ) );
  INV_X1 \uut_baud_rate/U53  ( .A(\uut_baud_rate/N12 ), .ZN(
        \uut_baud_rate/n79 ) );
  INV_X1 \uut_baud_rate/U52  ( .A(\uut_baud_rate/n75 ), .ZN(
        \uut_baud_rate/n81 ) );
  OAI21_X1 \uut_baud_rate/U51  ( .B1(\uut_baud_rate/n74 ), .B2(
        \uut_baud_rate/n73 ), .A(\uut_baud_rate/n72 ), .ZN(\uut_baud_rate/n75 ) );
  NAND4_X1 \uut_baud_rate/U50  ( .A1(\uut_baud_rate/n19 ), .A2(
        \uut_baud_rate/n20 ), .A3(\uut_baud_rate/n17 ), .A4(
        \uut_baud_rate/n18 ), .ZN(\uut_baud_rate/n73 ) );
  NAND4_X1 \uut_baud_rate/U49  ( .A1(\uut_baud_rate/n23 ), .A2(
        \uut_baud_rate/n24 ), .A3(\uut_baud_rate/n21 ), .A4(
        \uut_baud_rate/n22 ), .ZN(\uut_baud_rate/n74 ) );
  AND2_X1 \uut_baud_rate/U48  ( .A1(\uut_baud_rate/temp_en ), .A2(
        \uut_baud_rate/n72 ), .ZN(\uut_baud_rate/n26 ) );
  INV_X1 \uut_baud_rate/U47  ( .A(rst), .ZN(\uut_baud_rate/n72 ) );
  NOR2_X1 \uut_baud_rate/U46  ( .A1(rst), .A2(\uut_baud_rate/n76 ), .ZN(
        \uut_baud_rate/n27 ) );
  INV_X1 \uut_baud_rate/U45  ( .A(enable), .ZN(\uut_baud_rate/n76 ) );
  INV_X1 \uut_baud_rate/U44  ( .A(\uut_baud_rate/n79 ), .ZN(
        \uut_baud_rate/n71 ) );
  INV_X1 \uut_baud_rate/U43  ( .A(\uut_baud_rate/n71 ), .ZN(
        \uut_baud_rate/n70 ) );
  AND2_X2 \uut_baud_rate/U42  ( .A1(\uut_baud_rate/n79 ), .A2(
        \uut_baud_rate/n66 ), .ZN(\uut_baud_rate/n69 ) );
  AND2_X2 \uut_baud_rate/U41  ( .A1(\uut_baud_rate/n79 ), .A2(
        \uut_baud_rate/n66 ), .ZN(\uut_baud_rate/n68 ) );
  NOR4_X1 \uut_baud_rate/U40  ( .A1(baud_division[5]), .A2(baud_division[4]), 
        .A3(baud_division[3]), .A4(baud_division[31]), .ZN(\uut_baud_rate/n23 ) );
  NOR4_X1 \uut_baud_rate/U39  ( .A1(baud_division[9]), .A2(baud_division[8]), 
        .A3(baud_division[7]), .A4(baud_division[6]), .ZN(\uut_baud_rate/n24 )
         );
  NOR4_X1 \uut_baud_rate/U38  ( .A1(baud_division[23]), .A2(baud_division[22]), 
        .A3(baud_division[21]), .A4(baud_division[20]), .ZN(
        \uut_baud_rate/n20 ) );
  NOR4_X1 \uut_baud_rate/U37  ( .A1(baud_division[27]), .A2(baud_division[26]), 
        .A3(baud_division[25]), .A4(baud_division[24]), .ZN(
        \uut_baud_rate/n21 ) );
  NOR4_X1 \uut_baud_rate/U36  ( .A1(baud_division[12]), .A2(baud_division[11]), 
        .A3(baud_division[10]), .A4(baud_division[0]), .ZN(\uut_baud_rate/n17 ) );
  NOR4_X1 \uut_baud_rate/U35  ( .A1(baud_division[30]), .A2(baud_division[2]), 
        .A3(baud_division[29]), .A4(baud_division[28]), .ZN(
        \uut_baud_rate/n22 ) );
  NOR4_X1 \uut_baud_rate/U34  ( .A1(baud_division[16]), .A2(baud_division[15]), 
        .A3(baud_division[14]), .A4(baud_division[13]), .ZN(
        \uut_baud_rate/n18 ) );
  NOR4_X1 \uut_baud_rate/U33  ( .A1(baud_division[1]), .A2(baud_division[19]), 
        .A3(baud_division[18]), .A4(baud_division[17]), .ZN(
        \uut_baud_rate/n19 ) );
  NAND2_X1 \uut_baud_rate/U32  ( .A1(\uut_baud_rate/n67 ), .A2(enable), .ZN(
        \uut_baud_rate/n77 ) );
  AND2_X2 \uut_baud_rate/U31  ( .A1(\uut_baud_rate/n81 ), .A2(
        \uut_baud_rate/n77 ), .ZN(\uut_baud_rate/n66 ) );
  INV_X2 \uut_baud_rate/U30  ( .A(\uut_baud_rate/n56 ), .ZN(
        \uut_baud_rate/n57 ) );
  INV_X2 \uut_baud_rate/U29  ( .A(\uut_baud_rate/n54 ), .ZN(
        \uut_baud_rate/n55 ) );
  INV_X2 \uut_baud_rate/U28  ( .A(\uut_baud_rate/n52 ), .ZN(
        \uut_baud_rate/n53 ) );
  INV_X2 \uut_baud_rate/U27  ( .A(\uut_baud_rate/n50 ), .ZN(
        \uut_baud_rate/n51 ) );
  INV_X2 \uut_baud_rate/U26  ( .A(\uut_baud_rate/n48 ), .ZN(
        \uut_baud_rate/n49 ) );
  INV_X2 \uut_baud_rate/U25  ( .A(\uut_baud_rate/n46 ), .ZN(
        \uut_baud_rate/n47 ) );
  INV_X2 \uut_baud_rate/U24  ( .A(\uut_baud_rate/n44 ), .ZN(
        \uut_baud_rate/n45 ) );
  INV_X2 \uut_baud_rate/U23  ( .A(\uut_baud_rate/n42 ), .ZN(
        \uut_baud_rate/n43 ) );
  INV_X2 \uut_baud_rate/U22  ( .A(\uut_baud_rate/n40 ), .ZN(
        \uut_baud_rate/n41 ) );
  INV_X2 \uut_baud_rate/U21  ( .A(\uut_baud_rate/n38 ), .ZN(
        \uut_baud_rate/n39 ) );
  INV_X2 \uut_baud_rate/U20  ( .A(\uut_baud_rate/n36 ), .ZN(
        \uut_baud_rate/n37 ) );
  INV_X2 \uut_baud_rate/U19  ( .A(\uut_baud_rate/n34 ), .ZN(
        \uut_baud_rate/n35 ) );
  INV_X2 \uut_baud_rate/U18  ( .A(\uut_baud_rate/n32 ), .ZN(
        \uut_baud_rate/n33 ) );
  INV_X1 \uut_baud_rate/U17  ( .A(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/n65 ) );
  INV_X1 \uut_baud_rate/U16  ( .A(\uut_baud_rate/n62 ), .ZN(
        \uut_baud_rate/n63 ) );
  INV_X1 \uut_baud_rate/U15  ( .A(\uut_baud_rate/n30 ), .ZN(
        \uut_baud_rate/n31 ) );
  INV_X1 \uut_baud_rate/U14  ( .A(\uut_baud_rate/n58 ), .ZN(
        \uut_baud_rate/n59 ) );
  INV_X1 \uut_baud_rate/U13  ( .A(\uut_baud_rate/n28 ), .ZN(
        \uut_baud_rate/n29 ) );
  INV_X1 \uut_baud_rate/U12  ( .A(\uut_baud_rate/n15 ), .ZN(
        \uut_baud_rate/n16 ) );
  INV_X1 \uut_baud_rate/U11  ( .A(\uut_baud_rate/n13 ), .ZN(
        \uut_baud_rate/n14 ) );
  INV_X1 \uut_baud_rate/U10  ( .A(\uut_baud_rate/n11 ), .ZN(
        \uut_baud_rate/n12 ) );
  INV_X1 \uut_baud_rate/U9  ( .A(\uut_baud_rate/n9 ), .ZN(\uut_baud_rate/n10 )
         );
  INV_X1 \uut_baud_rate/U8  ( .A(\uut_baud_rate/n7 ), .ZN(\uut_baud_rate/n8 )
         );
  INV_X1 \uut_baud_rate/U7  ( .A(\uut_baud_rate/n5 ), .ZN(\uut_baud_rate/n6 )
         );
  INV_X1 \uut_baud_rate/U6  ( .A(\uut_baud_rate/n3 ), .ZN(\uut_baud_rate/n4 )
         );
  INV_X2 \uut_baud_rate/U3  ( .A(\uut_baud_rate/n60 ), .ZN(\uut_baud_rate/n61 ) );
  DFFRS_X1 \uut_baud_rate/baud_count_reg[0]  ( .D(\uut_baud_rate/n85 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [0]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[21]  ( .D(\uut_baud_rate/N101 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [21]), .QN(\uut_baud_rate/n36 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[22]  ( .D(\uut_baud_rate/N102 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [22]), .QN(\uut_baud_rate/n38 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[20]  ( .D(\uut_baud_rate/N100 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [20]), .QN(\uut_baud_rate/n42 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[19]  ( .D(\uut_baud_rate/N99 ), .CK(clk), .Q(\uut_baud_rate/baud_count [19]), .QN(\uut_baud_rate/n46 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[17]  ( .D(\uut_baud_rate/N97 ), .CK(clk), .Q(\uut_baud_rate/baud_count [17]), .QN(\uut_baud_rate/n48 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[18]  ( .D(\uut_baud_rate/N98 ), .CK(clk), .Q(\uut_baud_rate/baud_count [18]), .QN(\uut_baud_rate/n50 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[16]  ( .D(\uut_baud_rate/N96 ), .CK(clk), .Q(\uut_baud_rate/baud_count [16]), .QN(\uut_baud_rate/n52 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[15]  ( .D(\uut_baud_rate/N95 ), .CK(clk), .Q(\uut_baud_rate/baud_count [15]), .QN(\uut_baud_rate/n54 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[13]  ( .D(\uut_baud_rate/N93 ), .CK(clk), .Q(\uut_baud_rate/baud_count [13]), .QN(\uut_baud_rate/n56 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[14]  ( .D(\uut_baud_rate/N94 ), .CK(clk), .Q(\uut_baud_rate/baud_count [14]), .QN(\uut_baud_rate/n58 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[12]  ( .D(\uut_baud_rate/N92 ), .CK(clk), .Q(\uut_baud_rate/baud_count [12]), .QN(\uut_baud_rate/n60 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[11]  ( .D(\uut_baud_rate/N91 ), .CK(clk), .Q(\uut_baud_rate/baud_count [11]), .QN(\uut_baud_rate/n62 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[10]  ( .D(\uut_baud_rate/N90 ), .CK(clk), .Q(\uut_baud_rate/baud_count [10]), .QN(\uut_baud_rate/n64 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[27]  ( .D(\uut_baud_rate/N107 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [27]), .QN(\uut_baud_rate/n30 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[24]  ( .D(\uut_baud_rate/N104 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [24]), .QN(\uut_baud_rate/n40 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[26]  ( .D(\uut_baud_rate/N106 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [26]), .QN(\uut_baud_rate/n32 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[25]  ( .D(\uut_baud_rate/N105 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [25]), .QN(\uut_baud_rate/n34 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[23]  ( .D(\uut_baud_rate/N103 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [23]), .QN(\uut_baud_rate/n44 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[1]  ( .D(\uut_baud_rate/N81 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [1]), .QN(\uut_baud_rate/n5 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[6]  ( .D(\uut_baud_rate/N86 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [6]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[7]  ( .D(\uut_baud_rate/N87 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [7]), .QN(\uut_baud_rate/n3 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[9]  ( .D(\uut_baud_rate/N89 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [9]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[31]  ( .D(\uut_baud_rate/N111 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [31]), .QN(\uut_baud_rate/n9 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[2]  ( .D(\uut_baud_rate/N82 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [2]), .QN(\uut_baud_rate/n13 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[3]  ( .D(\uut_baud_rate/N83 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [3]), .QN(\uut_baud_rate/n7 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[4]  ( .D(\uut_baud_rate/N84 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [4]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[5]  ( .D(\uut_baud_rate/N85 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [5]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[28]  ( .D(\uut_baud_rate/N108 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [28]), .QN(\uut_baud_rate/n28 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[29]  ( .D(\uut_baud_rate/N109 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [29]), .QN(\uut_baud_rate/n15 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[8]  ( .D(\uut_baud_rate/N88 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [8]) );
  DFF_X1 \uut_baud_rate/baud_tick_reg  ( .D(\uut_baud_rate/n25 ), .CK(clk), 
        .Q(baud_tick), .QN(\uut_baud_rate/n83 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[30]  ( .D(\uut_baud_rate/N110 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [30]), .QN(\uut_baud_rate/n11 ) );
  DFF_X1 \uut_baud_rate/delayed_en_reg  ( .D(\uut_baud_rate/n26 ), .CK(clk), 
        .QN(\uut_baud_rate/n67 ) );
  DFF_X1 \uut_baud_rate/temp_en_reg  ( .D(\uut_baud_rate/n27 ), .CK(clk), .Q(
        \uut_baud_rate/temp_en ) );
  NAND3_X1 \uut_baud_rate/add_149/U363  ( .A1(\uut_baud_rate/add_149/n8 ), 
        .A2(\uut_baud_rate/add_149/n59 ), .A3(\uut_baud_rate/add_149/n68 ), 
        .ZN(\uut_baud_rate/add_149/n331 ) );
  NAND3_X1 \uut_baud_rate/add_149/U362  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n50 ), .A3(\uut_baud_rate/add_149/n37 ), 
        .ZN(\uut_baud_rate/add_149/n329 ) );
  NAND3_X1 \uut_baud_rate/add_149/U361  ( .A1(\uut_baud_rate/add_149/n68 ), 
        .A2(\uut_baud_rate/add_149/n46 ), .A3(\uut_baud_rate/add_149/n20 ), 
        .ZN(\uut_baud_rate/add_149/n324 ) );
  NAND3_X1 \uut_baud_rate/add_149/U360  ( .A1(\uut_baud_rate/add_149/n54 ), 
        .A2(\uut_baud_rate/add_149/n50 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .ZN(\uut_baud_rate/add_149/n323 ) );
  NAND3_X1 \uut_baud_rate/add_149/U359  ( .A1(\uut_baud_rate/add_149/n42 ), 
        .A2(\uut_baud_rate/add_149/n62 ), .A3(\uut_baud_rate/add_149/n40 ), 
        .ZN(\uut_baud_rate/add_149/n318 ) );
  NAND3_X1 \uut_baud_rate/add_149/U358  ( .A1(\uut_baud_rate/add_149/n17 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n19 ), 
        .ZN(\uut_baud_rate/add_149/n319 ) );
  NAND3_X1 \uut_baud_rate/add_149/U357  ( .A1(\uut_baud_rate/add_149/n54 ), 
        .A2(\uut_baud_rate/add_149/n50 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .ZN(\uut_baud_rate/add_149/n317 ) );
  NAND2_X1 \uut_baud_rate/add_149/U356  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n312 ) );
  NAND2_X1 \uut_baud_rate/add_149/U355  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .ZN(\uut_baud_rate/add_149/n313 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U354  ( .A(\uut_baud_rate/add_149/n307 ), 
        .B(\uut_baud_rate/n57 ), .ZN(\uut_baud_rate/N28 ) );
  NAND2_X1 \uut_baud_rate/add_149/U353  ( .A1(\uut_baud_rate/add_149/n42 ), 
        .A2(\uut_baud_rate/add_149/n40 ), .ZN(\uut_baud_rate/add_149/n305 ) );
  NAND2_X1 \uut_baud_rate/add_149/U352  ( .A1(\uut_baud_rate/add_149/n19 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .ZN(\uut_baud_rate/add_149/n306 ) );
  NAND2_X1 \uut_baud_rate/add_149/U351  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n303 ) );
  NAND2_X1 \uut_baud_rate/add_149/U350  ( .A1(\uut_baud_rate/add_149/n29 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .ZN(\uut_baud_rate/add_149/n304 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U349  ( .A(\uut_baud_rate/add_149/n298 ), 
        .B(\uut_baud_rate/add_149/n14 ), .ZN(\uut_baud_rate/N29 ) );
  NAND2_X1 \uut_baud_rate/add_149/U348  ( .A1(\uut_baud_rate/add_149/n68 ), 
        .A2(\uut_baud_rate/add_149/n8 ), .ZN(\uut_baud_rate/add_149/n296 ) );
  NAND2_X1 \uut_baud_rate/add_149/U347  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/add_149/n19 ), .ZN(\uut_baud_rate/add_149/n297 ) );
  NAND2_X1 \uut_baud_rate/add_149/U346  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n37 ), .ZN(\uut_baud_rate/add_149/n294 ) );
  NAND2_X1 \uut_baud_rate/add_149/U345  ( .A1(\uut_baud_rate/add_149/n40 ), 
        .A2(\uut_baud_rate/add_149/n46 ), .ZN(\uut_baud_rate/add_149/n295 ) );
  NAND2_X1 \uut_baud_rate/add_149/U344  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n292 ) );
  NAND2_X1 \uut_baud_rate/add_149/U343  ( .A1(\uut_baud_rate/add_149/n29 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .ZN(\uut_baud_rate/add_149/n293 ) );
  NAND4_X1 \uut_baud_rate/add_149/U342  ( .A1(\uut_baud_rate/add_149/n291 ), 
        .A2(\uut_baud_rate/add_149/n289 ), .A3(\uut_baud_rate/add_149/n290 ), 
        .A4(\uut_baud_rate/add_149/n288 ), .ZN(\uut_baud_rate/add_149/n287 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U341  ( .A(\uut_baud_rate/add_149/n287 ), 
        .B(\uut_baud_rate/add_149/n13 ), .ZN(\uut_baud_rate/N30 ) );
  NAND2_X1 \uut_baud_rate/add_149/U340  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/add_149/n285 ) );
  NAND2_X1 \uut_baud_rate/add_149/U339  ( .A1(\uut_baud_rate/add_149/n13 ), 
        .A2(\uut_baud_rate/add_149/n14 ), .ZN(\uut_baud_rate/add_149/n286 ) );
  NAND2_X1 \uut_baud_rate/add_149/U338  ( .A1(\uut_baud_rate/add_149/n68 ), 
        .A2(\uut_baud_rate/add_149/n8 ), .ZN(\uut_baud_rate/add_149/n283 ) );
  NAND2_X1 \uut_baud_rate/add_149/U337  ( .A1(\uut_baud_rate/add_149/n17 ), 
        .A2(\uut_baud_rate/add_149/n20 ), .ZN(\uut_baud_rate/add_149/n284 ) );
  NAND2_X1 \uut_baud_rate/add_149/U336  ( .A1(\uut_baud_rate/add_149/n59 ), 
        .A2(\uut_baud_rate/add_149/n37 ), .ZN(\uut_baud_rate/add_149/n281 ) );
  NAND2_X1 \uut_baud_rate/add_149/U335  ( .A1(\uut_baud_rate/add_149/n9 ), 
        .A2(\uut_baud_rate/add_149/n62 ), .ZN(\uut_baud_rate/add_149/n282 ) );
  NAND2_X1 \uut_baud_rate/add_149/U334  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n279 ) );
  NAND2_X1 \uut_baud_rate/add_149/U333  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .ZN(\uut_baud_rate/add_149/n280 ) );
  NAND4_X1 \uut_baud_rate/add_149/U332  ( .A1(\uut_baud_rate/add_149/n275 ), 
        .A2(\uut_baud_rate/add_149/n276 ), .A3(\uut_baud_rate/add_149/n277 ), 
        .A4(\uut_baud_rate/add_149/n278 ), .ZN(\uut_baud_rate/add_149/n274 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U331  ( .A(\uut_baud_rate/add_149/n274 ), 
        .B(\uut_baud_rate/add_149/n12 ), .ZN(\uut_baud_rate/N31 ) );
  NAND4_X1 \uut_baud_rate/add_149/U330  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/add_149/n17 ), .A3(\uut_baud_rate/add_149/n19 ), .A4(
        \uut_baud_rate/add_149/n68 ), .ZN(\uut_baud_rate/add_149/n272 ) );
  NAND4_X1 \uut_baud_rate/add_149/U329  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/n55 ), .A3(\uut_baud_rate/add_149/n14 ), .A4(
        \uut_baud_rate/n57 ), .ZN(\uut_baud_rate/add_149/n273 ) );
  NOR2_X1 \uut_baud_rate/add_149/U328  ( .A1(\uut_baud_rate/add_149/n272 ), 
        .A2(\uut_baud_rate/add_149/n273 ), .ZN(\uut_baud_rate/add_149/n268 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U327  ( .A1(\uut_baud_rate/add_149/n42 ), 
        .A2(\uut_baud_rate/add_149/n40 ), .A3(\uut_baud_rate/add_149/n62 ), 
        .A4(\uut_baud_rate/add_149/n58 ), .ZN(\uut_baud_rate/add_149/n270 ) );
  NAND2_X1 \uut_baud_rate/add_149/U326  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .ZN(\uut_baud_rate/add_149/n271 ) );
  NOR2_X1 \uut_baud_rate/add_149/U325  ( .A1(\uut_baud_rate/add_149/n270 ), 
        .A2(\uut_baud_rate/add_149/n271 ), .ZN(\uut_baud_rate/add_149/n269 )
         );
  NAND3_X1 \uut_baud_rate/add_149/U324  ( .A1(\uut_baud_rate/add_149/n269 ), 
        .A2(\uut_baud_rate/add_149/n268 ), .A3(\uut_baud_rate/add_149/n267 ), 
        .ZN(\uut_baud_rate/add_149/n266 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U323  ( .A(\uut_baud_rate/add_149/n266 ), 
        .B(\uut_baud_rate/n49 ), .ZN(\uut_baud_rate/N32 ) );
  NAND3_X1 \uut_baud_rate/add_149/U322  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/n61 ), .A3(\uut_baud_rate/add_149/n68 ), .ZN(
        \uut_baud_rate/add_149/n265 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U321  ( .A(\uut_baud_rate/add_149/n259 ), 
        .B(\uut_baud_rate/n51 ), .ZN(\uut_baud_rate/N33 ) );
  NAND3_X1 \uut_baud_rate/add_149/U320  ( .A1(\uut_baud_rate/add_149/n15 ), 
        .A2(\uut_baud_rate/n57 ), .A3(\uut_baud_rate/add_149/n20 ), .ZN(
        \uut_baud_rate/add_149/n258 ) );
  NAND3_X1 \uut_baud_rate/add_149/U319  ( .A1(\uut_baud_rate/add_149/n68 ), 
        .A2(\uut_baud_rate/add_149/n41 ), .A3(\uut_baud_rate/add_149/n57 ), 
        .ZN(\uut_baud_rate/add_149/n256 ) );
  NAND2_X1 \uut_baud_rate/add_149/U318  ( .A1(\uut_baud_rate/add_149/n63 ), 
        .A2(\uut_baud_rate/add_149/n39 ), .ZN(\uut_baud_rate/add_149/n257 ) );
  NAND3_X1 \uut_baud_rate/add_149/U317  ( .A1(\uut_baud_rate/add_149/n38 ), 
        .A2(\uut_baud_rate/add_149/n36 ), .A3(\uut_baud_rate/add_149/n11 ), 
        .ZN(\uut_baud_rate/add_149/n254 ) );
  NAND2_X1 \uut_baud_rate/add_149/U316  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .ZN(\uut_baud_rate/add_149/n255 ) );
  NAND3_X1 \uut_baud_rate/add_149/U315  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/add_149/n13 ), .ZN(
        \uut_baud_rate/add_149/n247 ) );
  NAND2_X1 \uut_baud_rate/add_149/U314  ( .A1(\uut_baud_rate/add_149/n12 ), 
        .A2(\uut_baud_rate/n49 ), .ZN(\uut_baud_rate/add_149/n248 ) );
  NAND3_X1 \uut_baud_rate/add_149/U313  ( .A1(\uut_baud_rate/add_149/n14 ), 
        .A2(\uut_baud_rate/n57 ), .A3(\uut_baud_rate/add_149/n20 ), .ZN(
        \uut_baud_rate/add_149/n245 ) );
  NAND2_X1 \uut_baud_rate/add_149/U312  ( .A1(\uut_baud_rate/add_149/n17 ), 
        .A2(\uut_baud_rate/n61 ), .ZN(\uut_baud_rate/add_149/n246 ) );
  NAND3_X1 \uut_baud_rate/add_149/U311  ( .A1(\uut_baud_rate/add_149/n68 ), 
        .A2(\uut_baud_rate/add_149/n8 ), .A3(\uut_baud_rate/add_149/n57 ), 
        .ZN(\uut_baud_rate/add_149/n243 ) );
  NAND2_X1 \uut_baud_rate/add_149/U310  ( .A1(\uut_baud_rate/add_149/n46 ), 
        .A2(\uut_baud_rate/add_149/n9 ), .ZN(\uut_baud_rate/add_149/n244 ) );
  NAND3_X1 \uut_baud_rate/add_149/U309  ( .A1(\uut_baud_rate/add_149/n37 ), 
        .A2(\uut_baud_rate/add_149/n30 ), .A3(\uut_baud_rate/add_149/n31 ), 
        .ZN(\uut_baud_rate/add_149/n241 ) );
  NAND2_X1 \uut_baud_rate/add_149/U308  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .ZN(\uut_baud_rate/add_149/n242 ) );
  NAND4_X1 \uut_baud_rate/add_149/U307  ( .A1(\uut_baud_rate/add_149/n240 ), 
        .A2(\uut_baud_rate/add_149/n238 ), .A3(\uut_baud_rate/add_149/n239 ), 
        .A4(\uut_baud_rate/add_149/n237 ), .ZN(\uut_baud_rate/add_149/n236 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U306  ( .A(\uut_baud_rate/add_149/n236 ), 
        .B(\uut_baud_rate/n43 ), .ZN(\uut_baud_rate/N35 ) );
  NAND3_X1 \uut_baud_rate/add_149/U305  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n53 ), .A3(\uut_baud_rate/n43 ), .ZN(
        \uut_baud_rate/add_149/n234 ) );
  NAND3_X1 \uut_baud_rate/add_149/U304  ( .A1(\uut_baud_rate/add_149/n15 ), 
        .A2(\uut_baud_rate/add_149/n18 ), .A3(\uut_baud_rate/add_149/n13 ), 
        .ZN(\uut_baud_rate/add_149/n232 ) );
  NAND3_X1 \uut_baud_rate/add_149/U303  ( .A1(\uut_baud_rate/add_149/n68 ), 
        .A2(\uut_baud_rate/add_149/n46 ), .A3(\uut_baud_rate/add_149/n19 ), 
        .ZN(\uut_baud_rate/add_149/n230 ) );
  NAND3_X1 \uut_baud_rate/add_149/U302  ( .A1(\uut_baud_rate/add_149/n54 ), 
        .A2(\uut_baud_rate/add_149/n50 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .ZN(\uut_baud_rate/add_149/n229 ) );
  NAND3_X1 \uut_baud_rate/add_149/U301  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n49 ), .A3(\uut_baud_rate/n37 ), .ZN(
        \uut_baud_rate/add_149/n222 ) );
  NAND3_X1 \uut_baud_rate/add_149/U300  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/add_149/n17 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_149/n220 ) );
  NAND3_X1 \uut_baud_rate/add_149/U299  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/add_149/n15 ), .A3(\uut_baud_rate/n55 ), .ZN(
        \uut_baud_rate/add_149/n221 ) );
  NAND3_X1 \uut_baud_rate/add_149/U298  ( .A1(\uut_baud_rate/add_149/n68 ), 
        .A2(\uut_baud_rate/add_149/n63 ), .A3(\uut_baud_rate/add_149/n20 ), 
        .ZN(\uut_baud_rate/add_149/n218 ) );
  NAND3_X1 \uut_baud_rate/add_149/U297  ( .A1(\uut_baud_rate/add_149/n54 ), 
        .A2(\uut_baud_rate/add_149/n31 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .ZN(\uut_baud_rate/add_149/n216 ) );
  NAND3_X1 \uut_baud_rate/add_149/U296  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n36 ), .A3(\uut_baud_rate/add_149/n38 ), 
        .ZN(\uut_baud_rate/add_149/n217 ) );
  NAND3_X1 \uut_baud_rate/add_149/U295  ( .A1(\uut_baud_rate/n37 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/n39 ), .ZN(
        \uut_baud_rate/add_149/n209 ) );
  NAND3_X1 \uut_baud_rate/add_149/U294  ( .A1(\uut_baud_rate/add_149/n14 ), 
        .A2(\uut_baud_rate/n61 ), .A3(\uut_baud_rate/n57 ), .ZN(
        \uut_baud_rate/add_149/n207 ) );
  NAND3_X1 \uut_baud_rate/add_149/U293  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n55 ), .A3(\uut_baud_rate/n53 ), .ZN(
        \uut_baud_rate/add_149/n208 ) );
  NAND3_X1 \uut_baud_rate/add_149/U292  ( .A1(\uut_baud_rate/add_149/n8 ), 
        .A2(\uut_baud_rate/add_149/n63 ), .A3(\uut_baud_rate/add_149/n10 ), 
        .ZN(\uut_baud_rate/add_149/n205 ) );
  NAND3_X1 \uut_baud_rate/add_149/U291  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n20 ), 
        .ZN(\uut_baud_rate/add_149/n206 ) );
  NAND3_X1 \uut_baud_rate/add_149/U290  ( .A1(\uut_baud_rate/add_149/n54 ), 
        .A2(\uut_baud_rate/add_149/n50 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .ZN(\uut_baud_rate/add_149/n203 ) );
  NAND3_X1 \uut_baud_rate/add_149/U289  ( .A1(\uut_baud_rate/add_149/n59 ), 
        .A2(\uut_baud_rate/add_149/n36 ), .A3(\uut_baud_rate/add_149/n38 ), 
        .ZN(\uut_baud_rate/add_149/n204 ) );
  NAND3_X1 \uut_baud_rate/add_149/U288  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/add_149/n196 ) );
  NAND3_X1 \uut_baud_rate/add_149/U287  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/n37 ), .A3(\uut_baud_rate/n39 ), .ZN(
        \uut_baud_rate/add_149/n197 ) );
  NAND3_X1 \uut_baud_rate/add_149/U286  ( .A1(\uut_baud_rate/add_149/n15 ), 
        .A2(\uut_baud_rate/n61 ), .A3(\uut_baud_rate/n57 ), .ZN(
        \uut_baud_rate/add_149/n194 ) );
  NAND3_X1 \uut_baud_rate/add_149/U285  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n55 ), .A3(\uut_baud_rate/n53 ), .ZN(
        \uut_baud_rate/add_149/n195 ) );
  NAND3_X1 \uut_baud_rate/add_149/U284  ( .A1(\uut_baud_rate/add_149/n42 ), 
        .A2(\uut_baud_rate/add_149/n62 ), .A3(\uut_baud_rate/add_149/n9 ), 
        .ZN(\uut_baud_rate/add_149/n192 ) );
  NAND3_X1 \uut_baud_rate/add_149/U283  ( .A1(\uut_baud_rate/add_149/n17 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n19 ), 
        .ZN(\uut_baud_rate/add_149/n193 ) );
  NAND3_X1 \uut_baud_rate/add_149/U282  ( .A1(\uut_baud_rate/add_149/n54 ), 
        .A2(\uut_baud_rate/add_149/n31 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .ZN(\uut_baud_rate/add_149/n190 ) );
  NAND3_X1 \uut_baud_rate/add_149/U281  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n36 ), .A3(\uut_baud_rate/add_149/n38 ), 
        .ZN(\uut_baud_rate/add_149/n191 ) );
  NAND3_X1 \uut_baud_rate/add_149/U280  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n37 ), .A3(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/add_149/n183 ) );
  NAND3_X1 \uut_baud_rate/add_149/U279  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/n41 ), .A3(\uut_baud_rate/n39 ), .ZN(
        \uut_baud_rate/add_149/n184 ) );
  NAND3_X1 \uut_baud_rate/add_149/U278  ( .A1(\uut_baud_rate/add_149/n15 ), 
        .A2(\uut_baud_rate/n55 ), .A3(\uut_baud_rate/n57 ), .ZN(
        \uut_baud_rate/add_149/n181 ) );
  NAND3_X1 \uut_baud_rate/add_149/U277  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/n53 ), .ZN(
        \uut_baud_rate/add_149/n182 ) );
  NAND3_X1 \uut_baud_rate/add_149/U276  ( .A1(\uut_baud_rate/add_149/n41 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n39 ), 
        .ZN(\uut_baud_rate/add_149/n179 ) );
  NAND3_X1 \uut_baud_rate/add_149/U275  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/n61 ), .A3(\uut_baud_rate/add_149/n19 ), .ZN(
        \uut_baud_rate/add_149/n180 ) );
  NAND4_X1 \uut_baud_rate/add_149/U274  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .A4(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n177 ) );
  NAND3_X1 \uut_baud_rate/add_149/U273  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n46 ), .A3(\uut_baud_rate/add_149/n37 ), 
        .ZN(\uut_baud_rate/add_149/n178 ) );
  NOR2_X1 \uut_baud_rate/add_149/U272  ( .A1(\uut_baud_rate/add_149/n164 ), 
        .A2(\uut_baud_rate/add_149/n178 ), .ZN(\uut_baud_rate/add_149/n176 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U271  ( .A(\uut_baud_rate/add_149/n172 ), 
        .B(\uut_baud_rate/n35 ), .ZN(\uut_baud_rate/N40 ) );
  NAND3_X1 \uut_baud_rate/add_149/U270  ( .A1(\uut_baud_rate/n37 ), .A2(
        \uut_baud_rate/n39 ), .A3(\uut_baud_rate/n43 ), .ZN(
        \uut_baud_rate/add_149/n170 ) );
  NAND3_X1 \uut_baud_rate/add_149/U269  ( .A1(\uut_baud_rate/n41 ), .A2(
        \uut_baud_rate/n35 ), .A3(\uut_baud_rate/n45 ), .ZN(
        \uut_baud_rate/add_149/n171 ) );
  NAND4_X1 \uut_baud_rate/add_149/U268  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/n55 ), .A3(\uut_baud_rate/add_149/n14 ), .A4(
        \uut_baud_rate/n57 ), .ZN(\uut_baud_rate/add_149/n168 ) );
  NAND3_X1 \uut_baud_rate/add_149/U267  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n47 ), .A3(\uut_baud_rate/n49 ), .ZN(
        \uut_baud_rate/add_149/n169 ) );
  NOR2_X1 \uut_baud_rate/add_149/U266  ( .A1(\uut_baud_rate/add_149/n168 ), 
        .A2(\uut_baud_rate/add_149/n169 ), .ZN(\uut_baud_rate/add_149/n161 )
         );
  NAND3_X1 \uut_baud_rate/add_149/U265  ( .A1(\uut_baud_rate/add_149/n42 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n10 ), 
        .ZN(\uut_baud_rate/add_149/n166 ) );
  NAND3_X1 \uut_baud_rate/add_149/U264  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/n61 ), .A3(\uut_baud_rate/add_149/n19 ), .ZN(
        \uut_baud_rate/add_149/n167 ) );
  NAND4_X1 \uut_baud_rate/add_149/U263  ( .A1(\uut_baud_rate/add_149/n36 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .A4(\uut_baud_rate/add_149/n31 ), .ZN(\uut_baud_rate/add_149/n164 ) );
  NAND3_X1 \uut_baud_rate/add_149/U262  ( .A1(\uut_baud_rate/add_149/n59 ), 
        .A2(\uut_baud_rate/add_149/n62 ), .A3(\uut_baud_rate/add_149/n37 ), 
        .ZN(\uut_baud_rate/add_149/n165 ) );
  NOR2_X1 \uut_baud_rate/add_149/U261  ( .A1(\uut_baud_rate/add_149/n164 ), 
        .A2(\uut_baud_rate/add_149/n165 ), .ZN(\uut_baud_rate/add_149/n163 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U260  ( .A(\uut_baud_rate/add_149/n159 ), 
        .B(\uut_baud_rate/n33 ), .ZN(\uut_baud_rate/N41 ) );
  NAND3_X1 \uut_baud_rate/add_149/U259  ( .A1(\uut_baud_rate/n39 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n37 ), .ZN(
        \uut_baud_rate/add_149/n157 ) );
  NAND3_X1 \uut_baud_rate/add_149/U258  ( .A1(\uut_baud_rate/n35 ), .A2(
        \uut_baud_rate/n33 ), .A3(\uut_baud_rate/n41 ), .ZN(
        \uut_baud_rate/add_149/n158 ) );
  NAND4_X1 \uut_baud_rate/add_149/U257  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n53 ), .A3(\uut_baud_rate/n55 ), .A4(
        \uut_baud_rate/add_149/n15 ), .ZN(\uut_baud_rate/add_149/n155 ) );
  NAND3_X1 \uut_baud_rate/add_149/U256  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n43 ), .A3(\uut_baud_rate/n51 ), .ZN(
        \uut_baud_rate/add_149/n156 ) );
  NOR2_X1 \uut_baud_rate/add_149/U255  ( .A1(\uut_baud_rate/add_149/n155 ), 
        .A2(\uut_baud_rate/add_149/n156 ), .ZN(\uut_baud_rate/add_149/n148 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U254  ( .A1(\uut_baud_rate/add_149/n20 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n8 ), 
        .A4(\uut_baud_rate/add_149/n10 ), .ZN(\uut_baud_rate/add_149/n153 ) );
  NAND3_X1 \uut_baud_rate/add_149/U253  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n57 ), .A3(\uut_baud_rate/add_149/n18 ), .ZN(
        \uut_baud_rate/add_149/n154 ) );
  NOR2_X1 \uut_baud_rate/add_149/U252  ( .A1(\uut_baud_rate/add_149/n153 ), 
        .A2(\uut_baud_rate/add_149/n154 ), .ZN(\uut_baud_rate/add_149/n149 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U251  ( .A1(\uut_baud_rate/add_149/n36 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .A4(\uut_baud_rate/add_149/n31 ), .ZN(\uut_baud_rate/add_149/n151 ) );
  NAND3_X1 \uut_baud_rate/add_149/U250  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n46 ), .A3(\uut_baud_rate/add_149/n37 ), 
        .ZN(\uut_baud_rate/add_149/n152 ) );
  NOR2_X1 \uut_baud_rate/add_149/U249  ( .A1(\uut_baud_rate/add_149/n151 ), 
        .A2(\uut_baud_rate/add_149/n152 ), .ZN(\uut_baud_rate/add_149/n150 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U248  ( .A(\uut_baud_rate/add_149/n146 ), 
        .B(\uut_baud_rate/baud_count [27]), .ZN(\uut_baud_rate/N42 ) );
  NAND4_X1 \uut_baud_rate/add_149/U247  ( .A1(\uut_baud_rate/n41 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n39 ), .A4(
        \uut_baud_rate/n37 ), .ZN(\uut_baud_rate/add_149/n144 ) );
  NAND3_X1 \uut_baud_rate/add_149/U246  ( .A1(\uut_baud_rate/n33 ), .A2(
        \uut_baud_rate/baud_count [27]), .A3(\uut_baud_rate/n35 ), .ZN(
        \uut_baud_rate/add_149/n145 ) );
  NOR2_X1 \uut_baud_rate/add_149/U245  ( .A1(\uut_baud_rate/add_149/n144 ), 
        .A2(\uut_baud_rate/add_149/n145 ), .ZN(\uut_baud_rate/add_149/n135 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U244  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n53 ), .A3(\uut_baud_rate/n55 ), .A4(
        \uut_baud_rate/add_149/n15 ), .ZN(\uut_baud_rate/add_149/n143 ) );
  NOR2_X1 \uut_baud_rate/add_149/U243  ( .A1(\uut_baud_rate/add_149/n143 ), 
        .A2(\uut_baud_rate/add_149/n156 ), .ZN(\uut_baud_rate/add_149/n136 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U242  ( .A1(\uut_baud_rate/add_149/n20 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n41 ), 
        .A4(\uut_baud_rate/add_149/n39 ), .ZN(\uut_baud_rate/add_149/n141 ) );
  NAND3_X1 \uut_baud_rate/add_149/U241  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n57 ), .A3(\uut_baud_rate/add_149/n18 ), .ZN(
        \uut_baud_rate/add_149/n142 ) );
  NOR2_X1 \uut_baud_rate/add_149/U240  ( .A1(\uut_baud_rate/add_149/n141 ), 
        .A2(\uut_baud_rate/add_149/n142 ), .ZN(\uut_baud_rate/add_149/n137 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U239  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .A4(\uut_baud_rate/add_149/n31 ), .ZN(\uut_baud_rate/add_149/n139 ) );
  NAND3_X1 \uut_baud_rate/add_149/U238  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n63 ), .A3(\uut_baud_rate/add_149/n37 ), 
        .ZN(\uut_baud_rate/add_149/n140 ) );
  NOR2_X1 \uut_baud_rate/add_149/U237  ( .A1(\uut_baud_rate/add_149/n114 ), 
        .A2(\uut_baud_rate/add_149/n140 ), .ZN(\uut_baud_rate/add_149/n138 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U236  ( .A1(\uut_baud_rate/add_149/n138 ), 
        .A2(\uut_baud_rate/add_149/n136 ), .A3(\uut_baud_rate/add_149/n137 ), 
        .A4(\uut_baud_rate/add_149/n135 ), .ZN(\uut_baud_rate/add_149/n134 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U235  ( .A(\uut_baud_rate/add_149/n134 ), 
        .B(\uut_baud_rate/baud_count [28]), .ZN(\uut_baud_rate/N43 ) );
  NAND4_X1 \uut_baud_rate/add_149/U234  ( .A1(\uut_baud_rate/n35 ), .A2(
        \uut_baud_rate/n41 ), .A3(\uut_baud_rate/n45 ), .A4(
        \uut_baud_rate/n39 ), .ZN(\uut_baud_rate/add_149/n132 ) );
  NAND3_X1 \uut_baud_rate/add_149/U233  ( .A1(\uut_baud_rate/baud_count [27]), 
        .A2(\uut_baud_rate/baud_count [28]), .A3(\uut_baud_rate/n33 ), .ZN(
        \uut_baud_rate/add_149/n133 ) );
  NOR2_X1 \uut_baud_rate/add_149/U232  ( .A1(\uut_baud_rate/add_149/n132 ), 
        .A2(\uut_baud_rate/add_149/n133 ), .ZN(\uut_baud_rate/add_149/n123 )
         );
  NAND3_X1 \uut_baud_rate/add_149/U231  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n37 ), .A3(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/add_149/n131 ) );
  NOR2_X1 \uut_baud_rate/add_149/U230  ( .A1(\uut_baud_rate/add_149/n118 ), 
        .A2(\uut_baud_rate/add_149/n131 ), .ZN(\uut_baud_rate/add_149/n124 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U229  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/add_149/n20 ), .A3(\uut_baud_rate/add_149/n68 ), 
        .A4(\uut_baud_rate/add_149/n8 ), .ZN(\uut_baud_rate/add_149/n129 ) );
  NAND3_X1 \uut_baud_rate/add_149/U228  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/add_149/n15 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_149/n130 ) );
  NOR2_X1 \uut_baud_rate/add_149/U227  ( .A1(\uut_baud_rate/add_149/n129 ), 
        .A2(\uut_baud_rate/add_149/n130 ), .ZN(\uut_baud_rate/add_149/n125 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U226  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .A4(\uut_baud_rate/add_149/n31 ), .ZN(\uut_baud_rate/add_149/n127 ) );
  NAND4_X1 \uut_baud_rate/add_149/U225  ( .A1(\uut_baud_rate/add_149/n10 ), 
        .A2(\uut_baud_rate/add_149/n63 ), .A3(\uut_baud_rate/add_149/n57 ), 
        .A4(\uut_baud_rate/add_149/n38 ), .ZN(\uut_baud_rate/add_149/n128 ) );
  NOR2_X1 \uut_baud_rate/add_149/U224  ( .A1(\uut_baud_rate/add_149/n127 ), 
        .A2(\uut_baud_rate/add_149/n128 ), .ZN(\uut_baud_rate/add_149/n126 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U223  ( .A(\uut_baud_rate/add_149/n122 ), 
        .B(\uut_baud_rate/n16 ), .ZN(\uut_baud_rate/N44 ) );
  NAND4_X1 \uut_baud_rate/add_149/U222  ( .A1(\uut_baud_rate/n33 ), .A2(
        \uut_baud_rate/n35 ), .A3(\uut_baud_rate/n41 ), .A4(
        \uut_baud_rate/n45 ), .ZN(\uut_baud_rate/add_149/n120 ) );
  NAND3_X1 \uut_baud_rate/add_149/U221  ( .A1(\uut_baud_rate/baud_count [28]), 
        .A2(\uut_baud_rate/n16 ), .A3(\uut_baud_rate/baud_count [27]), .ZN(
        \uut_baud_rate/add_149/n121 ) );
  NOR2_X1 \uut_baud_rate/add_149/U220  ( .A1(\uut_baud_rate/add_149/n120 ), 
        .A2(\uut_baud_rate/add_149/n121 ), .ZN(\uut_baud_rate/add_149/n110 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U219  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n49 ), .A3(\uut_baud_rate/n53 ), .A4(
        \uut_baud_rate/n55 ), .ZN(\uut_baud_rate/add_149/n118 ) );
  NAND4_X1 \uut_baud_rate/add_149/U218  ( .A1(\uut_baud_rate/n39 ), .A2(
        \uut_baud_rate/n37 ), .A3(\uut_baud_rate/n43 ), .A4(
        \uut_baud_rate/n47 ), .ZN(\uut_baud_rate/add_149/n119 ) );
  NOR2_X1 \uut_baud_rate/add_149/U217  ( .A1(\uut_baud_rate/add_149/n118 ), 
        .A2(\uut_baud_rate/add_149/n119 ), .ZN(\uut_baud_rate/add_149/n111 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U216  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/add_149/n20 ), .A3(\uut_baud_rate/add_149/n68 ), 
        .A4(\uut_baud_rate/add_149/n41 ), .ZN(\uut_baud_rate/add_149/n116 ) );
  NAND3_X1 \uut_baud_rate/add_149/U215  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/add_149/n14 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_149/n117 ) );
  NOR2_X1 \uut_baud_rate/add_149/U214  ( .A1(\uut_baud_rate/add_149/n116 ), 
        .A2(\uut_baud_rate/add_149/n117 ), .ZN(\uut_baud_rate/add_149/n112 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U213  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .A4(\uut_baud_rate/add_149/n31 ), .ZN(\uut_baud_rate/add_149/n114 ) );
  NAND4_X1 \uut_baud_rate/add_149/U212  ( .A1(\uut_baud_rate/add_149/n39 ), 
        .A2(\uut_baud_rate/add_149/n63 ), .A3(\uut_baud_rate/add_149/n57 ), 
        .A4(\uut_baud_rate/add_149/n37 ), .ZN(\uut_baud_rate/add_149/n115 ) );
  NOR2_X1 \uut_baud_rate/add_149/U211  ( .A1(\uut_baud_rate/add_149/n101 ), 
        .A2(\uut_baud_rate/add_149/n115 ), .ZN(\uut_baud_rate/add_149/n113 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U210  ( .A(\uut_baud_rate/add_149/n109 ), 
        .B(\uut_baud_rate/n12 ), .ZN(\uut_baud_rate/N45 ) );
  NAND4_X1 \uut_baud_rate/add_149/U209  ( .A1(\uut_baud_rate/baud_count [27]), 
        .A2(\uut_baud_rate/n33 ), .A3(\uut_baud_rate/n35 ), .A4(
        \uut_baud_rate/n41 ), .ZN(\uut_baud_rate/add_149/n107 ) );
  NAND3_X1 \uut_baud_rate/add_149/U208  ( .A1(\uut_baud_rate/n16 ), .A2(
        \uut_baud_rate/n12 ), .A3(\uut_baud_rate/baud_count [28]), .ZN(
        \uut_baud_rate/add_149/n108 ) );
  NOR2_X1 \uut_baud_rate/add_149/U207  ( .A1(\uut_baud_rate/add_149/n107 ), 
        .A2(\uut_baud_rate/add_149/n108 ), .ZN(\uut_baud_rate/add_149/n97 ) );
  NAND4_X1 \uut_baud_rate/add_149/U206  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/n49 ), .A4(
        \uut_baud_rate/n53 ), .ZN(\uut_baud_rate/add_149/n105 ) );
  NAND4_X1 \uut_baud_rate/add_149/U205  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/n39 ), .A3(\uut_baud_rate/n37 ), .A4(
        \uut_baud_rate/n43 ), .ZN(\uut_baud_rate/add_149/n106 ) );
  NOR2_X1 \uut_baud_rate/add_149/U204  ( .A1(\uut_baud_rate/add_149/n105 ), 
        .A2(\uut_baud_rate/add_149/n106 ), .ZN(\uut_baud_rate/add_149/n98 ) );
  NAND4_X1 \uut_baud_rate/add_149/U203  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/add_149/n20 ), .A3(\uut_baud_rate/add_149/n68 ), 
        .A4(\uut_baud_rate/add_149/n41 ), .ZN(\uut_baud_rate/add_149/n103 ) );
  NAND4_X1 \uut_baud_rate/add_149/U202  ( .A1(\uut_baud_rate/n55 ), .A2(
        \uut_baud_rate/add_149/n14 ), .A3(\uut_baud_rate/n57 ), .A4(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/add_149/n104 ) );
  NOR2_X1 \uut_baud_rate/add_149/U201  ( .A1(\uut_baud_rate/add_149/n103 ), 
        .A2(\uut_baud_rate/add_149/n104 ), .ZN(\uut_baud_rate/add_149/n99 ) );
  NAND4_X1 \uut_baud_rate/add_149/U200  ( .A1(\uut_baud_rate/add_149/n36 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .A3(\uut_baud_rate/add_149/n44 ), 
        .A4(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n101 ) );
  NAND4_X1 \uut_baud_rate/add_149/U199  ( .A1(\uut_baud_rate/add_149/n39 ), 
        .A2(\uut_baud_rate/add_149/n63 ), .A3(\uut_baud_rate/add_149/n57 ), 
        .A4(\uut_baud_rate/add_149/n38 ), .ZN(\uut_baud_rate/add_149/n102 ) );
  NOR2_X1 \uut_baud_rate/add_149/U198  ( .A1(\uut_baud_rate/add_149/n139 ), 
        .A2(\uut_baud_rate/add_149/n102 ), .ZN(\uut_baud_rate/add_149/n100 )
         );
  NAND4_X1 \uut_baud_rate/add_149/U197  ( .A1(\uut_baud_rate/add_149/n100 ), 
        .A2(\uut_baud_rate/add_149/n98 ), .A3(\uut_baud_rate/add_149/n99 ), 
        .A4(\uut_baud_rate/add_149/n97 ), .ZN(\uut_baud_rate/add_149/n96 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U196  ( .A(\uut_baud_rate/add_149/n96 ), .B(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N46 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U195  ( .A(\uut_baud_rate/add_149/n177 ), 
        .B(\uut_baud_rate/add_149/n37 ), .ZN(\uut_baud_rate/N19 ) );
  NAND3_X1 \uut_baud_rate/add_149/U194  ( .A1(\uut_baud_rate/add_149/n37 ), 
        .A2(\uut_baud_rate/add_149/n30 ), .A3(\uut_baud_rate/add_149/n32 ), 
        .ZN(\uut_baud_rate/add_149/n91 ) );
  NAND2_X1 \uut_baud_rate/add_149/U193  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .ZN(\uut_baud_rate/add_149/n92 ) );
  NAND3_X1 \uut_baud_rate/add_149/U192  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .A3(\uut_baud_rate/add_149/n32 ), 
        .ZN(\uut_baud_rate/add_149/n88 ) );
  NAND3_X1 \uut_baud_rate/add_149/U191  ( .A1(\uut_baud_rate/add_149/n37 ), 
        .A2(\uut_baud_rate/add_149/n59 ), .A3(\uut_baud_rate/add_149/n29 ), 
        .ZN(\uut_baud_rate/add_149/n89 ) );
  NAND2_X1 \uut_baud_rate/add_149/U190  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n85 ) );
  NAND2_X1 \uut_baud_rate/add_149/U189  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .ZN(\uut_baud_rate/add_149/n86 ) );
  NAND2_X1 \uut_baud_rate/add_149/U188  ( .A1(\uut_baud_rate/add_149/n83 ), 
        .A2(\uut_baud_rate/add_149/n84 ), .ZN(\uut_baud_rate/add_149/n82 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U187  ( .A(\uut_baud_rate/add_149/n82 ), .B(
        \uut_baud_rate/add_149/n40 ), .ZN(\uut_baud_rate/N22 ) );
  NAND2_X1 \uut_baud_rate/add_149/U186  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n37 ), .ZN(\uut_baud_rate/add_149/n80 ) );
  NAND2_X1 \uut_baud_rate/add_149/U185  ( .A1(\uut_baud_rate/add_149/n10 ), 
        .A2(\uut_baud_rate/add_149/n46 ), .ZN(\uut_baud_rate/add_149/n81 ) );
  NAND2_X1 \uut_baud_rate/add_149/U184  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n78 ) );
  NAND2_X1 \uut_baud_rate/add_149/U183  ( .A1(\uut_baud_rate/add_149/n30 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .ZN(\uut_baud_rate/add_149/n79 ) );
  NAND2_X1 \uut_baud_rate/add_149/U182  ( .A1(\uut_baud_rate/add_149/n76 ), 
        .A2(\uut_baud_rate/add_149/n77 ), .ZN(\uut_baud_rate/add_149/n75 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U181  ( .A(\uut_baud_rate/add_149/n75 ), .B(
        \uut_baud_rate/add_149/n42 ), .ZN(\uut_baud_rate/N23 ) );
  NAND2_X1 \uut_baud_rate/add_149/U180  ( .A1(\uut_baud_rate/add_149/n62 ), 
        .A2(\uut_baud_rate/add_149/n59 ), .ZN(\uut_baud_rate/add_149/n73 ) );
  NAND2_X1 \uut_baud_rate/add_149/U179  ( .A1(\uut_baud_rate/add_149/n8 ), 
        .A2(\uut_baud_rate/add_149/n9 ), .ZN(\uut_baud_rate/add_149/n74 ) );
  NAND3_X1 \uut_baud_rate/add_149/U178  ( .A1(\uut_baud_rate/add_149/n70 ), 
        .A2(\uut_baud_rate/add_149/n71 ), .A3(\uut_baud_rate/add_149/n72 ), 
        .ZN(\uut_baud_rate/add_149/n69 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U177  ( .A(\uut_baud_rate/add_149/n69 ), .B(
        \uut_baud_rate/add_149/n68 ), .ZN(\uut_baud_rate/N24 ) );
  NAND2_X1 \uut_baud_rate/add_149/U176  ( .A1(\uut_baud_rate/add_149/n250 ), 
        .A2(\uut_baud_rate/add_149/n251 ), .ZN(\uut_baud_rate/add_149/n249 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U175  ( .A(\uut_baud_rate/add_149/n249 ), 
        .B(\uut_baud_rate/n47 ), .ZN(\uut_baud_rate/N34 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U174  ( .A(\uut_baud_rate/add_149/n211 ), 
        .B(\uut_baud_rate/n39 ), .ZN(\uut_baud_rate/N37 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U173  ( .A(\uut_baud_rate/add_149/n185 ), 
        .B(\uut_baud_rate/n41 ), .ZN(\uut_baud_rate/N39 ) );
  NAND4_X1 \uut_baud_rate/add_149/U172  ( .A1(\uut_baud_rate/add_149/n186 ), 
        .A2(\uut_baud_rate/add_149/n187 ), .A3(\uut_baud_rate/add_149/n188 ), 
        .A4(\uut_baud_rate/add_149/n189 ), .ZN(\uut_baud_rate/add_149/n185 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U171  ( .A1(\uut_baud_rate/add_149/n256 ), 
        .A2(\uut_baud_rate/add_149/n257 ), .ZN(\uut_baud_rate/add_149/n252 )
         );
  INV_X1 \uut_baud_rate/add_149/U170  ( .A(\uut_baud_rate/baud_count [5]), 
        .ZN(\uut_baud_rate/add_149/n61 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U169  ( .A(\uut_baud_rate/add_149/n61 ), 
        .Z(\uut_baud_rate/add_149/n60 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U168  ( .A(\uut_baud_rate/add_149/n224 ), 
        .B(\uut_baud_rate/n37 ), .ZN(\uut_baud_rate/N36 ) );
  INV_X1 \uut_baud_rate/add_149/U167  ( .A(\uut_baud_rate/baud_count [0]), 
        .ZN(\uut_baud_rate/add_149/n52 ) );
  NAND2_X1 \uut_baud_rate/add_149/U166  ( .A1(\uut_baud_rate/add_149/n45 ), 
        .A2(\uut_baud_rate/add_149/n32 ), .ZN(\uut_baud_rate/add_149/n95 ) );
  INV_X1 \uut_baud_rate/add_149/U165  ( .A(\uut_baud_rate/add_149/n95 ), .ZN(
        \uut_baud_rate/add_149/n94 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U164  ( .A(\uut_baud_rate/add_149/n95 ), .B(
        \uut_baud_rate/add_149/n34 ), .ZN(\uut_baud_rate/N17 ) );
  INV_X1 \uut_baud_rate/add_149/U163  ( .A(\uut_baud_rate/baud_count [6]), 
        .ZN(\uut_baud_rate/add_149/n65 ) );
  INV_X1 \uut_baud_rate/add_149/U162  ( .A(\uut_baud_rate/N15 ), .ZN(
        \uut_baud_rate/add_149/n50 ) );
  NAND4_X1 \uut_baud_rate/add_149/U161  ( .A1(\uut_baud_rate/add_149/n199 ), 
        .A2(\uut_baud_rate/add_149/n200 ), .A3(\uut_baud_rate/add_149/n201 ), 
        .A4(\uut_baud_rate/add_149/n202 ), .ZN(\uut_baud_rate/add_149/n198 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U160  ( .A(\uut_baud_rate/add_149/n198 ), 
        .B(\uut_baud_rate/n45 ), .ZN(\uut_baud_rate/N38 ) );
  INV_X1 \uut_baud_rate/add_149/U159  ( .A(\uut_baud_rate/add_149/n61 ), .ZN(
        \uut_baud_rate/add_149/n59 ) );
  INV_X2 \uut_baud_rate/add_149/U158  ( .A(\uut_baud_rate/add_149/n61 ), .ZN(
        \uut_baud_rate/add_149/n58 ) );
  BUF_X4 \uut_baud_rate/add_149/U157  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_149/n68 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U156  ( .A(\uut_baud_rate/add_149/n64 ), .B(
        \uut_baud_rate/add_149/n87 ), .ZN(\uut_baud_rate/N21 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U155  ( .A(\uut_baud_rate/add_149/n53 ), 
        .Z(\uut_baud_rate/add_149/n54 ) );
  NAND2_X1 \uut_baud_rate/add_149/U154  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n57 ), .ZN(\uut_baud_rate/add_149/n233 ) );
  AND3_X1 \uut_baud_rate/add_149/U153  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n57 ), .A3(\uut_baud_rate/add_149/n18 ), .ZN(
        \uut_baud_rate/add_149/n299 ) );
  AND3_X1 \uut_baud_rate/add_149/U152  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/add_149/n15 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_149/n288 ) );
  NAND2_X1 \uut_baud_rate/add_149/U151  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n51 ), .ZN(\uut_baud_rate/add_149/n235 ) );
  NAND2_X1 \uut_baud_rate/add_149/U150  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n47 ), .ZN(\uut_baud_rate/add_149/n223 ) );
  NAND2_X1 \uut_baud_rate/add_149/U149  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n43 ), .ZN(\uut_baud_rate/add_149/n210 ) );
  NOR2_X1 \uut_baud_rate/add_149/U148  ( .A1(\uut_baud_rate/add_149/n254 ), 
        .A2(\uut_baud_rate/add_149/n255 ), .ZN(\uut_baud_rate/add_149/n253 )
         );
  AND3_X1 \uut_baud_rate/add_149/U147  ( .A1(\uut_baud_rate/add_149/n37 ), 
        .A2(\uut_baud_rate/add_149/n36 ), .A3(\uut_baud_rate/add_149/n32 ), 
        .ZN(\uut_baud_rate/add_149/n72 ) );
  AND3_X1 \uut_baud_rate/add_149/U146  ( .A1(\uut_baud_rate/add_149/n37 ), 
        .A2(\uut_baud_rate/add_149/n36 ), .A3(\uut_baud_rate/add_149/n32 ), 
        .ZN(\uut_baud_rate/add_149/n267 ) );
  NAND4_X1 \uut_baud_rate/add_149/U145  ( .A1(\uut_baud_rate/add_149/n212 ), 
        .A2(\uut_baud_rate/add_149/n213 ), .A3(\uut_baud_rate/add_149/n214 ), 
        .A4(\uut_baud_rate/add_149/n215 ), .ZN(\uut_baud_rate/add_149/n211 )
         );
  AND2_X1 \uut_baud_rate/add_149/U144  ( .A1(\uut_baud_rate/add_149/n253 ), 
        .A2(\uut_baud_rate/add_149/n252 ), .ZN(\uut_baud_rate/add_149/n251 )
         );
  AND2_X1 \uut_baud_rate/add_149/U143  ( .A1(\uut_baud_rate/add_149/n62 ), 
        .A2(\uut_baud_rate/add_149/n59 ), .ZN(\uut_baud_rate/add_149/n262 ) );
  NAND2_X1 \uut_baud_rate/add_149/U142  ( .A1(\uut_baud_rate/add_149/n62 ), 
        .A2(\uut_baud_rate/add_149/n9 ), .ZN(\uut_baud_rate/add_149/n332 ) );
  AND3_X1 \uut_baud_rate/add_149/U141  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n62 ), .A3(\uut_baud_rate/add_149/n38 ), 
        .ZN(\uut_baud_rate/add_149/n310 ) );
  AND3_X1 \uut_baud_rate/add_149/U140  ( .A1(\uut_baud_rate/add_149/n58 ), 
        .A2(\uut_baud_rate/add_149/n62 ), .A3(\uut_baud_rate/add_149/n38 ), 
        .ZN(\uut_baud_rate/add_149/n301 ) );
  AND3_X1 \uut_baud_rate/add_149/U139  ( .A1(\uut_baud_rate/add_149/n59 ), 
        .A2(\uut_baud_rate/add_149/n46 ), .A3(\uut_baud_rate/add_149/n37 ), 
        .ZN(\uut_baud_rate/add_149/n83 ) );
  NAND4_X1 \uut_baud_rate/add_149/U138  ( .A1(\uut_baud_rate/add_149/n225 ), 
        .A2(\uut_baud_rate/add_149/n226 ), .A3(\uut_baud_rate/add_149/n227 ), 
        .A4(\uut_baud_rate/add_149/n228 ), .ZN(\uut_baud_rate/add_149/n224 )
         );
  AND3_X1 \uut_baud_rate/add_149/U137  ( .A1(\uut_baud_rate/add_149/n261 ), 
        .A2(\uut_baud_rate/add_149/n262 ), .A3(\uut_baud_rate/add_149/n263 ), 
        .ZN(\uut_baud_rate/add_149/n47 ) );
  NAND2_X1 \uut_baud_rate/add_149/U136  ( .A1(\uut_baud_rate/add_149/n47 ), 
        .A2(\uut_baud_rate/add_149/n48 ), .ZN(\uut_baud_rate/add_149/n259 ) );
  NOR2_X1 \uut_baud_rate/add_149/U135  ( .A1(\uut_baud_rate/add_149/n230 ), 
        .A2(\uut_baud_rate/add_149/n231 ), .ZN(\uut_baud_rate/add_149/n227 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U134  ( .A1(\uut_baud_rate/add_149/n205 ), 
        .A2(\uut_baud_rate/add_149/n206 ), .ZN(\uut_baud_rate/add_149/n201 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U133  ( .A1(\uut_baud_rate/add_149/n294 ), 
        .A2(\uut_baud_rate/add_149/n295 ), .ZN(\uut_baud_rate/add_149/n290 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U132  ( .A1(\uut_baud_rate/add_149/n281 ), 
        .A2(\uut_baud_rate/add_149/n282 ), .ZN(\uut_baud_rate/add_149/n277 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U131  ( .A1(\uut_baud_rate/add_149/n183 ), 
        .A2(\uut_baud_rate/add_149/n184 ), .ZN(\uut_baud_rate/add_149/n173 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U130  ( .A1(\uut_baud_rate/add_149/n179 ), 
        .A2(\uut_baud_rate/add_149/n180 ), .ZN(\uut_baud_rate/add_149/n175 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U129  ( .A1(\uut_baud_rate/add_149/n181 ), 
        .A2(\uut_baud_rate/add_149/n182 ), .ZN(\uut_baud_rate/add_149/n174 )
         );
  NAND2_X1 \uut_baud_rate/add_149/U128  ( .A1(\uut_baud_rate/add_149/n176 ), 
        .A2(\uut_baud_rate/add_149/n23 ), .ZN(\uut_baud_rate/add_149/n172 ) );
  NOR2_X1 \uut_baud_rate/add_149/U127  ( .A1(\uut_baud_rate/add_149/n166 ), 
        .A2(\uut_baud_rate/add_149/n167 ), .ZN(\uut_baud_rate/add_149/n162 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U126  ( .A1(\uut_baud_rate/add_149/n170 ), 
        .A2(\uut_baud_rate/add_149/n171 ), .ZN(\uut_baud_rate/add_149/n160 )
         );
  NAND3_X1 \uut_baud_rate/add_149/U125  ( .A1(\uut_baud_rate/add_149/n163 ), 
        .A2(\uut_baud_rate/add_149/n162 ), .A3(\uut_baud_rate/add_149/n24 ), 
        .ZN(\uut_baud_rate/add_149/n159 ) );
  NOR2_X1 \uut_baud_rate/add_149/U124  ( .A1(\uut_baud_rate/add_149/n218 ), 
        .A2(\uut_baud_rate/add_149/n219 ), .ZN(\uut_baud_rate/add_149/n214 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U123  ( .A1(\uut_baud_rate/add_149/n192 ), 
        .A2(\uut_baud_rate/add_149/n193 ), .ZN(\uut_baud_rate/add_149/n188 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U122  ( .A1(\uut_baud_rate/add_149/n157 ), 
        .A2(\uut_baud_rate/add_149/n158 ), .ZN(\uut_baud_rate/add_149/n147 )
         );
  NAND3_X1 \uut_baud_rate/add_149/U121  ( .A1(\uut_baud_rate/add_149/n150 ), 
        .A2(\uut_baud_rate/add_149/n149 ), .A3(\uut_baud_rate/add_149/n25 ), 
        .ZN(\uut_baud_rate/add_149/n146 ) );
  NOR2_X1 \uut_baud_rate/add_149/U120  ( .A1(\uut_baud_rate/add_149/n318 ), 
        .A2(\uut_baud_rate/add_149/n319 ), .ZN(\uut_baud_rate/add_149/n315 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U119  ( .A1(\uut_baud_rate/add_149/n324 ), 
        .A2(\uut_baud_rate/add_149/n325 ), .ZN(\uut_baud_rate/add_149/n321 )
         );
  NAND2_X1 \uut_baud_rate/add_149/U118  ( .A1(\uut_baud_rate/add_149/n321 ), 
        .A2(\uut_baud_rate/add_149/n322 ), .ZN(\uut_baud_rate/add_149/n320 )
         );
  AND2_X1 \uut_baud_rate/add_149/U117  ( .A1(\uut_baud_rate/add_149/n8 ), .A2(
        \uut_baud_rate/add_149/n40 ), .ZN(\uut_baud_rate/add_149/n261 ) );
  NAND2_X1 \uut_baud_rate/add_149/U116  ( .A1(\uut_baud_rate/add_149/n9 ), 
        .A2(\uut_baud_rate/add_149/n8 ), .ZN(\uut_baud_rate/add_149/n231 ) );
  NAND2_X1 \uut_baud_rate/add_149/U115  ( .A1(\uut_baud_rate/add_149/n39 ), 
        .A2(\uut_baud_rate/add_149/n42 ), .ZN(\uut_baud_rate/add_149/n219 ) );
  NAND2_X1 \uut_baud_rate/add_149/U114  ( .A1(\uut_baud_rate/add_149/n10 ), 
        .A2(\uut_baud_rate/add_149/n8 ), .ZN(\uut_baud_rate/add_149/n325 ) );
  AND3_X1 \uut_baud_rate/add_149/U113  ( .A1(\uut_baud_rate/add_149/n42 ), 
        .A2(\uut_baud_rate/add_149/n68 ), .A3(\uut_baud_rate/add_149/n9 ), 
        .ZN(\uut_baud_rate/add_149/n309 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U112  ( .A(\uut_baud_rate/add_149/n326 ), 
        .B(\uut_baud_rate/add_149/n19 ), .ZN(\uut_baud_rate/N25 ) );
  AND3_X1 \uut_baud_rate/add_149/U111  ( .A1(\uut_baud_rate/add_149/n18 ), 
        .A2(\uut_baud_rate/n61 ), .A3(\uut_baud_rate/add_149/n20 ), .ZN(
        \uut_baud_rate/add_149/n308 ) );
  INV_X1 \uut_baud_rate/add_149/U110  ( .A(\uut_baud_rate/add_149/n52 ), .ZN(
        \uut_baud_rate/add_149/n49 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U109  ( .A(\uut_baud_rate/add_149/n49 ), 
        .Z(\uut_baud_rate/add_149/n31 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U108  ( .A(\uut_baud_rate/add_149/n66 ), 
        .Z(\uut_baud_rate/add_149/n40 ) );
  AND2_X1 \uut_baud_rate/add_149/U107  ( .A1(\uut_baud_rate/add_149/n44 ), 
        .A2(\uut_baud_rate/add_149/n33 ), .ZN(\uut_baud_rate/add_149/n263 ) );
  NAND2_X1 \uut_baud_rate/add_149/U106  ( .A1(\uut_baud_rate/add_149/n44 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .ZN(\uut_baud_rate/add_149/n330 ) );
  AND2_X1 \uut_baud_rate/add_149/U105  ( .A1(\uut_baud_rate/add_149/n44 ), 
        .A2(\uut_baud_rate/add_149/n34 ), .ZN(\uut_baud_rate/add_149/n70 ) );
  NAND2_X1 \uut_baud_rate/add_149/U104  ( .A1(\uut_baud_rate/add_149/n34 ), 
        .A2(\uut_baud_rate/add_149/n94 ), .ZN(\uut_baud_rate/add_149/n93 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U103  ( .A(\uut_baud_rate/add_149/n93 ), .B(
        \uut_baud_rate/add_149/n29 ), .ZN(\uut_baud_rate/N18 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U102  ( .A(\uut_baud_rate/add_149/n35 ), 
        .Z(\uut_baud_rate/add_149/n29 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U101  ( .A(\uut_baud_rate/add_149/n320 ), 
        .B(\uut_baud_rate/add_149/n17 ), .ZN(\uut_baud_rate/N26 ) );
  NOR2_X1 \uut_baud_rate/add_149/U100  ( .A1(\uut_baud_rate/add_149/n194 ), 
        .A2(\uut_baud_rate/add_149/n195 ), .ZN(\uut_baud_rate/add_149/n187 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U99  ( .A1(\uut_baud_rate/add_149/n207 ), 
        .A2(\uut_baud_rate/add_149/n208 ), .ZN(\uut_baud_rate/add_149/n200 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U98  ( .A1(\uut_baud_rate/add_149/n220 ), 
        .A2(\uut_baud_rate/add_149/n221 ), .ZN(\uut_baud_rate/add_149/n213 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U97  ( .A1(\uut_baud_rate/add_149/n232 ), 
        .A2(\uut_baud_rate/add_149/n233 ), .ZN(\uut_baud_rate/add_149/n226 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U96  ( .A1(\uut_baud_rate/add_149/n245 ), 
        .A2(\uut_baud_rate/add_149/n246 ), .ZN(\uut_baud_rate/add_149/n238 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U95  ( .A1(\uut_baud_rate/add_149/n305 ), 
        .A2(\uut_baud_rate/add_149/n306 ), .ZN(\uut_baud_rate/add_149/n300 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U94  ( .A1(\uut_baud_rate/add_149/n283 ), 
        .A2(\uut_baud_rate/add_149/n284 ), .ZN(\uut_baud_rate/add_149/n276 )
         );
  NAND2_X1 \uut_baud_rate/add_149/U93  ( .A1(\uut_baud_rate/add_149/n17 ), 
        .A2(\uut_baud_rate/n61 ), .ZN(\uut_baud_rate/add_149/n28 ) );
  NAND2_X1 \uut_baud_rate/add_149/U92  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/n55 ), .ZN(\uut_baud_rate/add_149/n27 ) );
  NAND2_X1 \uut_baud_rate/add_149/U91  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n49 ), .ZN(\uut_baud_rate/add_149/n26 ) );
  NOR2_X1 \uut_baud_rate/add_149/U90  ( .A1(\uut_baud_rate/add_149/n296 ), 
        .A2(\uut_baud_rate/add_149/n297 ), .ZN(\uut_baud_rate/add_149/n289 )
         );
  BUF_X1 \uut_baud_rate/add_149/U89  ( .A(\uut_baud_rate/baud_count [3]), .Z(
        \uut_baud_rate/add_149/n55 ) );
  BUF_X1 \uut_baud_rate/add_149/U88  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_149/n53 ) );
  BUF_X1 \uut_baud_rate/add_149/U87  ( .A(\uut_baud_rate/baud_count [4]), .Z(
        \uut_baud_rate/add_149/n56 ) );
  NOR2_X1 \uut_baud_rate/add_149/U86  ( .A1(\uut_baud_rate/add_149/n247 ), 
        .A2(\uut_baud_rate/add_149/n248 ), .ZN(\uut_baud_rate/add_149/n237 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U85  ( .A1(\uut_baud_rate/add_149/n285 ), 
        .A2(\uut_baud_rate/add_149/n286 ), .ZN(\uut_baud_rate/add_149/n275 )
         );
  NAND2_X1 \uut_baud_rate/add_149/U84  ( .A1(\uut_baud_rate/add_149/n315 ), 
        .A2(\uut_baud_rate/add_149/n316 ), .ZN(\uut_baud_rate/add_149/n314 )
         );
  XNOR2_X1 \uut_baud_rate/add_149/U83  ( .A(\uut_baud_rate/add_149/n314 ), .B(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/N27 ) );
  NOR2_X1 \uut_baud_rate/add_149/U82  ( .A1(\uut_baud_rate/add_149/n331 ), 
        .A2(\uut_baud_rate/add_149/n332 ), .ZN(\uut_baud_rate/add_149/n327 )
         );
  NAND2_X1 \uut_baud_rate/add_149/U81  ( .A1(\uut_baud_rate/add_149/n327 ), 
        .A2(\uut_baud_rate/add_149/n328 ), .ZN(\uut_baud_rate/add_149/n326 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U80  ( .A1(\uut_baud_rate/add_149/n196 ), 
        .A2(\uut_baud_rate/add_149/n197 ), .ZN(\uut_baud_rate/add_149/n186 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U79  ( .A1(\uut_baud_rate/add_149/n209 ), 
        .A2(\uut_baud_rate/add_149/n210 ), .ZN(\uut_baud_rate/add_149/n199 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U78  ( .A1(\uut_baud_rate/add_149/n222 ), 
        .A2(\uut_baud_rate/add_149/n223 ), .ZN(\uut_baud_rate/add_149/n212 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U77  ( .A1(\uut_baud_rate/add_149/n234 ), 
        .A2(\uut_baud_rate/add_149/n235 ), .ZN(\uut_baud_rate/add_149/n225 )
         );
  AND2_X1 \uut_baud_rate/add_149/U76  ( .A1(\uut_baud_rate/add_149/n148 ), 
        .A2(\uut_baud_rate/add_149/n147 ), .ZN(\uut_baud_rate/add_149/n25 ) );
  AND2_X1 \uut_baud_rate/add_149/U75  ( .A1(\uut_baud_rate/add_149/n161 ), 
        .A2(\uut_baud_rate/add_149/n160 ), .ZN(\uut_baud_rate/add_149/n24 ) );
  AND3_X1 \uut_baud_rate/add_149/U74  ( .A1(\uut_baud_rate/add_149/n175 ), 
        .A2(\uut_baud_rate/add_149/n173 ), .A3(\uut_baud_rate/add_149/n174 ), 
        .ZN(\uut_baud_rate/add_149/n23 ) );
  NOR2_X1 \uut_baud_rate/add_149/U73  ( .A1(\uut_baud_rate/add_149/n243 ), 
        .A2(\uut_baud_rate/add_149/n244 ), .ZN(\uut_baud_rate/add_149/n239 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U72  ( .A1(\uut_baud_rate/add_149/n264 ), 
        .A2(\uut_baud_rate/add_149/n265 ), .ZN(\uut_baud_rate/add_149/n260 )
         );
  AND3_X1 \uut_baud_rate/add_149/U71  ( .A1(\uut_baud_rate/add_149/n37 ), .A2(
        \uut_baud_rate/add_149/n29 ), .A3(\uut_baud_rate/add_149/n31 ), .ZN(
        \uut_baud_rate/add_149/n22 ) );
  AND2_X1 \uut_baud_rate/add_149/U70  ( .A1(\uut_baud_rate/add_149/n260 ), 
        .A2(\uut_baud_rate/add_149/n22 ), .ZN(\uut_baud_rate/add_149/n48 ) );
  NOR2_X1 \uut_baud_rate/add_149/U69  ( .A1(\uut_baud_rate/add_149/n73 ), .A2(
        \uut_baud_rate/add_149/n74 ), .ZN(\uut_baud_rate/add_149/n71 ) );
  NOR2_X1 \uut_baud_rate/add_149/U68  ( .A1(\uut_baud_rate/add_149/n85 ), .A2(
        \uut_baud_rate/add_149/n86 ), .ZN(\uut_baud_rate/add_149/n84 ) );
  NOR2_X1 \uut_baud_rate/add_149/U67  ( .A1(\uut_baud_rate/add_149/n80 ), .A2(
        \uut_baud_rate/add_149/n81 ), .ZN(\uut_baud_rate/add_149/n76 ) );
  NOR2_X1 \uut_baud_rate/add_149/U66  ( .A1(\uut_baud_rate/add_149/n323 ), 
        .A2(\uut_baud_rate/add_149/n191 ), .ZN(\uut_baud_rate/add_149/n322 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U65  ( .A1(\uut_baud_rate/add_149/n329 ), 
        .A2(\uut_baud_rate/add_149/n330 ), .ZN(\uut_baud_rate/add_149/n328 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U64  ( .A1(\uut_baud_rate/add_149/n216 ), 
        .A2(\uut_baud_rate/add_149/n217 ), .ZN(\uut_baud_rate/add_149/n215 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U63  ( .A1(\uut_baud_rate/add_149/n229 ), 
        .A2(\uut_baud_rate/add_149/n217 ), .ZN(\uut_baud_rate/add_149/n228 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U62  ( .A1(\uut_baud_rate/add_149/n190 ), 
        .A2(\uut_baud_rate/add_149/n191 ), .ZN(\uut_baud_rate/add_149/n189 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U61  ( .A1(\uut_baud_rate/add_149/n203 ), 
        .A2(\uut_baud_rate/add_149/n204 ), .ZN(\uut_baud_rate/add_149/n202 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U60  ( .A1(\uut_baud_rate/add_149/n303 ), 
        .A2(\uut_baud_rate/add_149/n304 ), .ZN(\uut_baud_rate/add_149/n302 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U59  ( .A1(\uut_baud_rate/add_149/n279 ), 
        .A2(\uut_baud_rate/add_149/n280 ), .ZN(\uut_baud_rate/add_149/n278 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U58  ( .A1(\uut_baud_rate/add_149/n241 ), 
        .A2(\uut_baud_rate/add_149/n242 ), .ZN(\uut_baud_rate/add_149/n240 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U57  ( .A1(\uut_baud_rate/add_149/n312 ), 
        .A2(\uut_baud_rate/add_149/n313 ), .ZN(\uut_baud_rate/add_149/n311 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U56  ( .A1(\uut_baud_rate/add_149/n292 ), 
        .A2(\uut_baud_rate/add_149/n293 ), .ZN(\uut_baud_rate/add_149/n291 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U55  ( .A1(\uut_baud_rate/add_149/n317 ), 
        .A2(\uut_baud_rate/add_149/n191 ), .ZN(\uut_baud_rate/add_149/n316 )
         );
  NOR2_X1 \uut_baud_rate/add_149/U54  ( .A1(\uut_baud_rate/add_149/n78 ), .A2(
        \uut_baud_rate/add_149/n79 ), .ZN(\uut_baud_rate/add_149/n77 ) );
  NOR2_X1 \uut_baud_rate/add_149/U53  ( .A1(\uut_baud_rate/add_149/n88 ), .A2(
        \uut_baud_rate/add_149/n89 ), .ZN(\uut_baud_rate/add_149/n87 ) );
  NOR2_X1 \uut_baud_rate/add_149/U52  ( .A1(\uut_baud_rate/add_149/n91 ), .A2(
        \uut_baud_rate/add_149/n92 ), .ZN(\uut_baud_rate/add_149/n90 ) );
  XNOR2_X1 \uut_baud_rate/add_149/U51  ( .A(\uut_baud_rate/add_149/n60 ), .B(
        \uut_baud_rate/add_149/n90 ), .ZN(\uut_baud_rate/N20 ) );
  XOR2_X1 \uut_baud_rate/add_149/U50  ( .A(\uut_baud_rate/add_149/n44 ), .B(
        \uut_baud_rate/add_149/n32 ), .Z(\uut_baud_rate/N16 ) );
  BUF_X1 \uut_baud_rate/add_149/U49  ( .A(\uut_baud_rate/baud_count [1]), .Z(
        \uut_baud_rate/add_149/n43 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U48  ( .A(\uut_baud_rate/add_149/n56 ), .Z(
        \uut_baud_rate/add_149/n37 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U47  ( .A(\uut_baud_rate/add_149/n43 ), .Z(
        \uut_baud_rate/add_149/n44 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U46  ( .A(\uut_baud_rate/add_149/n35 ), .Z(
        \uut_baud_rate/add_149/n30 ) );
  INV_X2 \uut_baud_rate/add_149/U45  ( .A(\uut_baud_rate/add_149/n65 ), .ZN(
        \uut_baud_rate/add_149/n63 ) );
  INV_X2 \uut_baud_rate/add_149/U44  ( .A(\uut_baud_rate/add_149/n65 ), .ZN(
        \uut_baud_rate/add_149/n62 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U43  ( .A(\uut_baud_rate/n65 ), .Z(
        \uut_baud_rate/add_149/n20 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U42  ( .A(\uut_baud_rate/n65 ), .Z(
        \uut_baud_rate/add_149/n19 ) );
  INV_X2 \uut_baud_rate/add_149/U41  ( .A(\uut_baud_rate/add_149/n65 ), .ZN(
        \uut_baud_rate/add_149/n46 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U40  ( .A(\uut_baud_rate/add_149/n65 ), .Z(
        \uut_baud_rate/add_149/n64 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U39  ( .A(\uut_baud_rate/n63 ), .Z(
        \uut_baud_rate/add_149/n18 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U38  ( .A(\uut_baud_rate/n63 ), .Z(
        \uut_baud_rate/add_149/n17 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U37  ( .A(\uut_baud_rate/n63 ), .Z(
        \uut_baud_rate/add_149/n16 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U36  ( .A(\uut_baud_rate/n59 ), .Z(
        \uut_baud_rate/add_149/n15 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U35  ( .A(\uut_baud_rate/n59 ), .Z(
        \uut_baud_rate/add_149/n14 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U34  ( .A(\uut_baud_rate/n55 ), .Z(
        \uut_baud_rate/add_149/n13 ) );
  INV_X1 \uut_baud_rate/add_149/U33  ( .A(\uut_baud_rate/add_149/n61 ), .ZN(
        \uut_baud_rate/add_149/n57 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U32  ( .A(\uut_baud_rate/add_149/n43 ), .Z(
        \uut_baud_rate/add_149/n45 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U31  ( .A(\uut_baud_rate/add_149/n56 ), .Z(
        \uut_baud_rate/add_149/n38 ) );
  NAND3_X1 \uut_baud_rate/add_149/U30  ( .A1(\uut_baud_rate/add_149/n126 ), 
        .A2(\uut_baud_rate/add_149/n125 ), .A3(\uut_baud_rate/add_149/n3 ), 
        .ZN(\uut_baud_rate/add_149/n122 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U29  ( .A(\uut_baud_rate/n53 ), .Z(
        \uut_baud_rate/add_149/n12 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U28  ( .A(\uut_baud_rate/add_149/n55 ), .Z(
        \uut_baud_rate/add_149/n36 ) );
  NAND3_X1 \uut_baud_rate/add_149/U27  ( .A1(\uut_baud_rate/add_149/n311 ), 
        .A2(\uut_baud_rate/add_149/n309 ), .A3(\uut_baud_rate/add_149/n1 ), 
        .ZN(\uut_baud_rate/add_149/n307 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U26  ( .A(\uut_baud_rate/add_149/n49 ), .Z(
        \uut_baud_rate/add_149/n32 ) );
  BUF_X1 \uut_baud_rate/add_149/U25  ( .A(\uut_baud_rate/add_149/n52 ), .Z(
        \uut_baud_rate/N15 ) );
  INV_X1 \uut_baud_rate/add_149/U24  ( .A(\uut_baud_rate/N15 ), .ZN(
        \uut_baud_rate/add_149/n11 ) );
  BUF_X2 \uut_baud_rate/add_149/U23  ( .A(\uut_baud_rate/baud_count [7]), .Z(
        \uut_baud_rate/add_149/n66 ) );
  CLKBUF_X1 \uut_baud_rate/add_149/U22  ( .A(\uut_baud_rate/add_149/n66 ), .Z(
        \uut_baud_rate/add_149/n10 ) );
  BUF_X2 \uut_baud_rate/add_149/U21  ( .A(\uut_baud_rate/add_149/n66 ), .Z(
        \uut_baud_rate/add_149/n9 ) );
  BUF_X2 \uut_baud_rate/add_149/U20  ( .A(\uut_baud_rate/add_149/n67 ), .Z(
        \uut_baud_rate/add_149/n42 ) );
  NAND3_X1 \uut_baud_rate/add_149/U19  ( .A1(\uut_baud_rate/add_149/n302 ), 
        .A2(\uut_baud_rate/add_149/n300 ), .A3(\uut_baud_rate/add_149/n2 ), 
        .ZN(\uut_baud_rate/add_149/n298 ) );
  AND2_X1 \uut_baud_rate/add_149/U18  ( .A1(\uut_baud_rate/add_149/n19 ), .A2(
        \uut_baud_rate/add_149/n16 ), .ZN(\uut_baud_rate/add_149/n7 ) );
  AND2_X1 \uut_baud_rate/add_149/U17  ( .A1(\uut_baud_rate/n55 ), .A2(
        \uut_baud_rate/add_149/n15 ), .ZN(\uut_baud_rate/add_149/n6 ) );
  AND2_X1 \uut_baud_rate/add_149/U16  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n53 ), .ZN(\uut_baud_rate/add_149/n5 ) );
  NAND3_X1 \uut_baud_rate/add_149/U15  ( .A1(\uut_baud_rate/add_149/n5 ), .A2(
        \uut_baud_rate/add_149/n6 ), .A3(\uut_baud_rate/add_149/n7 ), .ZN(
        \uut_baud_rate/add_149/n264 ) );
  NAND3_X1 \uut_baud_rate/add_149/U14  ( .A1(\uut_baud_rate/add_149/n113 ), 
        .A2(\uut_baud_rate/add_149/n112 ), .A3(\uut_baud_rate/add_149/n4 ), 
        .ZN(\uut_baud_rate/add_149/n109 ) );
  NOR4_X1 \uut_baud_rate/add_149/U13  ( .A1(\uut_baud_rate/add_149/n26 ), .A2(
        \uut_baud_rate/add_149/n27 ), .A3(\uut_baud_rate/add_149/n28 ), .A4(
        \uut_baud_rate/add_149/n258 ), .ZN(\uut_baud_rate/add_149/n250 ) );
  CLKBUF_X2 \uut_baud_rate/add_149/U12  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_149/n33 ) );
  BUF_X1 \uut_baud_rate/add_149/U11  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_149/n34 ) );
  BUF_X1 \uut_baud_rate/add_149/U10  ( .A(\uut_baud_rate/add_149/n55 ), .Z(
        \uut_baud_rate/add_149/n35 ) );
  BUF_X1 \uut_baud_rate/add_149/U9  ( .A(\uut_baud_rate/add_149/n67 ), .Z(
        \uut_baud_rate/add_149/n41 ) );
  AND2_X1 \uut_baud_rate/add_149/U8  ( .A1(\uut_baud_rate/add_149/n111 ), .A2(
        \uut_baud_rate/add_149/n110 ), .ZN(\uut_baud_rate/add_149/n4 ) );
  AND2_X1 \uut_baud_rate/add_149/U7  ( .A1(\uut_baud_rate/add_149/n124 ), .A2(
        \uut_baud_rate/add_149/n123 ), .ZN(\uut_baud_rate/add_149/n3 ) );
  AND2_X1 \uut_baud_rate/add_149/U6  ( .A1(\uut_baud_rate/add_149/n301 ), .A2(
        \uut_baud_rate/add_149/n299 ), .ZN(\uut_baud_rate/add_149/n2 ) );
  AND2_X1 \uut_baud_rate/add_149/U5  ( .A1(\uut_baud_rate/add_149/n310 ), .A2(
        \uut_baud_rate/add_149/n308 ), .ZN(\uut_baud_rate/add_149/n1 ) );
  BUF_X2 \uut_baud_rate/add_149/U4  ( .A(\uut_baud_rate/add_149/n66 ), .Z(
        \uut_baud_rate/add_149/n39 ) );
  BUF_X2 \uut_baud_rate/add_149/U3  ( .A(\uut_baud_rate/baud_count [8]), .Z(
        \uut_baud_rate/add_149/n67 ) );
  CLKBUF_X3 \uut_baud_rate/add_149/U2  ( .A(\uut_baud_rate/add_149/n67 ), .Z(
        \uut_baud_rate/add_149/n8 ) );
  NAND4_X1 \uut_baud_rate/eq_144/U47  ( .A1(\uut_baud_rate/eq_144/n28 ), .A2(
        \uut_baud_rate/eq_144/n29 ), .A3(\uut_baud_rate/eq_144/n30 ), .A4(
        \uut_baud_rate/eq_144/n27 ), .ZN(\uut_baud_rate/eq_144/n5 ) );
  NAND4_X1 \uut_baud_rate/eq_144/U46  ( .A1(\uut_baud_rate/eq_144/n8 ), .A2(
        \uut_baud_rate/eq_144/n7 ), .A3(\uut_baud_rate/eq_144/n9 ), .A4(
        \uut_baud_rate/eq_144/n10 ), .ZN(\uut_baud_rate/eq_144/n6 ) );
  NOR2_X1 \uut_baud_rate/eq_144/U45  ( .A1(\uut_baud_rate/eq_144/n5 ), .A2(
        \uut_baud_rate/eq_144/n6 ), .ZN(\uut_baud_rate/N12 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U44  ( .A(\uut_baud_rate/baud_count [6]), .B(
        baud_division[6]), .ZN(\uut_baud_rate/eq_144/n36 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U43  ( .A(baud_division[5]), .B(
        \uut_baud_rate/baud_count [5]), .ZN(\uut_baud_rate/eq_144/n37 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U42  ( .A(\uut_baud_rate/n8 ), .B(
        baud_division[3]), .ZN(\uut_baud_rate/eq_144/n31 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U41  ( .A(baud_division[2]), .B(
        \uut_baud_rate/n14 ), .ZN(\uut_baud_rate/eq_144/n33 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U40  ( .A(baud_division[8]), .B(
        \uut_baud_rate/baud_count [8]), .ZN(\uut_baud_rate/eq_144/n42 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U39  ( .A(baud_division[4]), .B(
        \uut_baud_rate/baud_count [4]), .ZN(\uut_baud_rate/eq_144/n38 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U38  ( .A(baud_division[7]), .B(
        \uut_baud_rate/n4 ), .ZN(\uut_baud_rate/eq_144/n35 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U37  ( .A(baud_division[9]), .B(
        \uut_baud_rate/baud_count [9]), .ZN(\uut_baud_rate/eq_144/n40 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U36  ( .A(baud_division[12]), .B(
        \uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/eq_144/n46 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U35  ( .A(baud_division[14]), .B(
        \uut_baud_rate/baud_count [14]), .ZN(\uut_baud_rate/eq_144/n44 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U34  ( .A(baud_division[13]), .B(
        \uut_baud_rate/baud_count [13]), .ZN(\uut_baud_rate/eq_144/n45 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U33  ( .A(\uut_baud_rate/baud_count [16]), 
        .B(baud_division[16]), .ZN(\uut_baud_rate/eq_144/n14 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U32  ( .A(\uut_baud_rate/baud_count [18]), 
        .B(baud_division[18]), .ZN(\uut_baud_rate/eq_144/n12 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U31  ( .A(baud_division[15]), .B(
        \uut_baud_rate/baud_count [15]), .ZN(\uut_baud_rate/eq_144/n43 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U30  ( .A(baud_division[17]), .B(
        \uut_baud_rate/baud_count [17]), .ZN(\uut_baud_rate/eq_144/n13 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U29  ( .A(\uut_baud_rate/baud_count [19]), 
        .B(baud_division[19]), .ZN(\uut_baud_rate/eq_144/n11 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U28  ( .A(\uut_baud_rate/baud_count [20]), 
        .B(baud_division[20]), .ZN(\uut_baud_rate/eq_144/n18 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U27  ( .A(\uut_baud_rate/baud_count [22]), 
        .B(baud_division[22]), .ZN(\uut_baud_rate/eq_144/n16 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U26  ( .A(baud_division[21]), .B(
        \uut_baud_rate/baud_count [21]), .ZN(\uut_baud_rate/eq_144/n17 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U25  ( .A(\uut_baud_rate/baud_count [23]), 
        .B(baud_division[23]), .ZN(\uut_baud_rate/eq_144/n15 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U24  ( .A(baud_division[24]), .B(
        \uut_baud_rate/baud_count [24]), .ZN(\uut_baud_rate/eq_144/n22 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U23  ( .A(baud_division[26]), .B(
        \uut_baud_rate/baud_count [26]), .ZN(\uut_baud_rate/eq_144/n20 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U22  ( .A(baud_division[25]), .B(
        \uut_baud_rate/baud_count [25]), .ZN(\uut_baud_rate/eq_144/n21 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U21  ( .A(baud_division[0]), .B(
        \uut_baud_rate/baud_count [0]), .ZN(\uut_baud_rate/eq_144/n34 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U20  ( .A(baud_division[28]), .B(
        \uut_baud_rate/n29 ), .ZN(\uut_baud_rate/eq_144/n26 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U19  ( .A(\uut_baud_rate/baud_count [31]), 
        .B(baud_division[31]), .ZN(\uut_baud_rate/eq_144/n23 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U18  ( .A(baud_division[29]), .B(
        \uut_baud_rate/baud_count [29]), .ZN(\uut_baud_rate/eq_144/n25 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U17  ( .A(\uut_baud_rate/baud_count [30]), 
        .B(baud_division[30]), .ZN(\uut_baud_rate/eq_144/n24 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U16  ( .A(\uut_baud_rate/n6 ), .B(
        baud_division[1]), .ZN(\uut_baud_rate/eq_144/n32 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U15  ( .A(baud_division[27]), .B(
        \uut_baud_rate/n31 ), .ZN(\uut_baud_rate/eq_144/n19 ) );
  NAND2_X1 \uut_baud_rate/eq_144/U14  ( .A1(\uut_baud_rate/eq_144/n3 ), .A2(
        \uut_baud_rate/eq_144/n4 ), .ZN(\uut_baud_rate/eq_144/n39 ) );
  NAND2_X1 \uut_baud_rate/eq_144/U13  ( .A1(baud_division[11]), .A2(
        \uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/eq_144/n3 ) );
  AND4_X1 \uut_baud_rate/eq_144/U12  ( .A1(\uut_baud_rate/eq_144/n21 ), .A2(
        \uut_baud_rate/eq_144/n22 ), .A3(\uut_baud_rate/eq_144/n19 ), .A4(
        \uut_baud_rate/eq_144/n20 ), .ZN(\uut_baud_rate/eq_144/n8 ) );
  AND4_X1 \uut_baud_rate/eq_144/U11  ( .A1(\uut_baud_rate/eq_144/n17 ), .A2(
        \uut_baud_rate/eq_144/n18 ), .A3(\uut_baud_rate/eq_144/n15 ), .A4(
        \uut_baud_rate/eq_144/n16 ), .ZN(\uut_baud_rate/eq_144/n9 ) );
  INV_X1 \uut_baud_rate/eq_144/U10  ( .A(baud_division[11]), .ZN(
        \uut_baud_rate/eq_144/n2 ) );
  INV_X1 \uut_baud_rate/eq_144/U9  ( .A(\uut_baud_rate/baud_count [11]), .ZN(
        \uut_baud_rate/eq_144/n1 ) );
  NAND2_X1 \uut_baud_rate/eq_144/U8  ( .A1(\uut_baud_rate/eq_144/n1 ), .A2(
        \uut_baud_rate/eq_144/n2 ), .ZN(\uut_baud_rate/eq_144/n4 ) );
  AND4_X1 \uut_baud_rate/eq_144/U7  ( .A1(\uut_baud_rate/eq_144/n37 ), .A2(
        \uut_baud_rate/eq_144/n38 ), .A3(\uut_baud_rate/eq_144/n35 ), .A4(
        \uut_baud_rate/eq_144/n36 ), .ZN(\uut_baud_rate/eq_144/n29 ) );
  XNOR2_X1 \uut_baud_rate/eq_144/U6  ( .A(baud_division[10]), .B(
        \uut_baud_rate/baud_count [10]), .ZN(\uut_baud_rate/eq_144/n41 ) );
  AND4_X1 \uut_baud_rate/eq_144/U5  ( .A1(\uut_baud_rate/eq_144/n45 ), .A2(
        \uut_baud_rate/eq_144/n46 ), .A3(\uut_baud_rate/eq_144/n43 ), .A4(
        \uut_baud_rate/eq_144/n44 ), .ZN(\uut_baud_rate/eq_144/n27 ) );
  AND4_X1 \uut_baud_rate/eq_144/U4  ( .A1(\uut_baud_rate/eq_144/n39 ), .A2(
        \uut_baud_rate/eq_144/n40 ), .A3(\uut_baud_rate/eq_144/n42 ), .A4(
        \uut_baud_rate/eq_144/n41 ), .ZN(\uut_baud_rate/eq_144/n28 ) );
  AND4_X1 \uut_baud_rate/eq_144/U3  ( .A1(\uut_baud_rate/eq_144/n33 ), .A2(
        \uut_baud_rate/eq_144/n34 ), .A3(\uut_baud_rate/eq_144/n31 ), .A4(
        \uut_baud_rate/eq_144/n32 ), .ZN(\uut_baud_rate/eq_144/n30 ) );
  AND4_X1 \uut_baud_rate/eq_144/U2  ( .A1(\uut_baud_rate/eq_144/n26 ), .A2(
        \uut_baud_rate/eq_144/n25 ), .A3(\uut_baud_rate/eq_144/n23 ), .A4(
        \uut_baud_rate/eq_144/n24 ), .ZN(\uut_baud_rate/eq_144/n7 ) );
  AND4_X2 \uut_baud_rate/eq_144/U1  ( .A1(\uut_baud_rate/eq_144/n13 ), .A2(
        \uut_baud_rate/eq_144/n14 ), .A3(\uut_baud_rate/eq_144/n11 ), .A4(
        \uut_baud_rate/eq_144/n12 ), .ZN(\uut_baud_rate/eq_144/n10 ) );
  OAI21_X1 \uut_tx/U84  ( .B1(\uut_tx/n13 ), .B2(\uut_tx/current_state [0]), 
        .A(\uut_tx/n90 ), .ZN(\uut_tx/N92 ) );
  INV_X1 \uut_tx/U83  ( .A(\uut_tx/n89 ), .ZN(\uut_tx/n90 ) );
  OAI21_X1 \uut_tx/U82  ( .B1(\uut_tx/n13 ), .B2(\uut_tx/n25 ), .A(
        \uut_tx/n87 ), .ZN(\uut_tx/N80 ) );
  AOI22_X1 \uut_tx/U81  ( .A1(data_out[7]), .A2(\uut_tx/n32 ), .B1(\uut_tx/n6 ), .B2(\uut_tx/n86 ), .ZN(\uut_tx/n87 ) );
  OAI21_X1 \uut_tx/U80  ( .B1(\uut_tx/n14 ), .B2(\uut_tx/n25 ), .A(
        \uut_tx/n85 ), .ZN(\uut_tx/N79 ) );
  AOI22_X1 \uut_tx/U79  ( .A1(data_out[6]), .A2(\uut_tx/n32 ), .B1(\uut_tx/n6 ), .B2(\uut_tx/n84 ), .ZN(\uut_tx/n85 ) );
  OAI21_X1 \uut_tx/U78  ( .B1(\uut_tx/n15 ), .B2(\uut_tx/n25 ), .A(
        \uut_tx/n83 ), .ZN(\uut_tx/N78 ) );
  AOI22_X1 \uut_tx/U77  ( .A1(data_out[5]), .A2(\uut_tx/n32 ), .B1(\uut_tx/n6 ), .B2(\uut_tx/n82 ), .ZN(\uut_tx/n83 ) );
  OAI21_X1 \uut_tx/U76  ( .B1(\uut_tx/n16 ), .B2(\uut_tx/n25 ), .A(
        \uut_tx/n81 ), .ZN(\uut_tx/N77 ) );
  AOI22_X1 \uut_tx/U75  ( .A1(data_out[4]), .A2(\uut_tx/n32 ), .B1(\uut_tx/n6 ), .B2(\uut_tx/n80 ), .ZN(\uut_tx/n81 ) );
  OAI21_X1 \uut_tx/U74  ( .B1(\uut_tx/n17 ), .B2(\uut_tx/n25 ), .A(
        \uut_tx/n79 ), .ZN(\uut_tx/N76 ) );
  AOI22_X1 \uut_tx/U73  ( .A1(data_out[3]), .A2(\uut_tx/n32 ), .B1(\uut_tx/n2 ), .B2(\uut_tx/n78 ), .ZN(\uut_tx/n79 ) );
  OAI21_X1 \uut_tx/U72  ( .B1(\uut_tx/n18 ), .B2(\uut_tx/n25 ), .A(
        \uut_tx/n77 ), .ZN(\uut_tx/N75 ) );
  AOI22_X1 \uut_tx/U71  ( .A1(data_out[2]), .A2(\uut_tx/n32 ), .B1(\uut_tx/n2 ), .B2(\uut_tx/n76 ), .ZN(\uut_tx/n77 ) );
  OAI21_X1 \uut_tx/U70  ( .B1(\uut_tx/n19 ), .B2(\uut_tx/n25 ), .A(
        \uut_tx/n75 ), .ZN(\uut_tx/N74 ) );
  AOI22_X1 \uut_tx/U69  ( .A1(data_out[1]), .A2(\uut_tx/n32 ), .B1(\uut_tx/n2 ), .B2(\uut_tx/n74 ), .ZN(\uut_tx/n75 ) );
  INV_X1 \uut_tx/U68  ( .A(\uut_tx/n73 ), .ZN(\uut_tx/N73 ) );
  AOI22_X1 \uut_tx/U67  ( .A1(\uut_tx/n72 ), .A2(\uut_tx/n74 ), .B1(
        data_out[0]), .B2(\uut_tx/n32 ), .ZN(\uut_tx/n73 ) );
  INV_X1 \uut_tx/U66  ( .A(\uut_tx/n24 ), .ZN(\uut_tx/n72 ) );
  OAI21_X1 \uut_tx/U65  ( .B1(\uut_tx/n69 ), .B2(\uut_tx/n68 ), .A(
        \uut_tx/n29 ), .ZN(\uut_tx/n88 ) );
  AND2_X1 \uut_tx/U64  ( .A1(\uut_tx/next_state [0]), .A2(\uut_tx/n70 ), .ZN(
        \uut_tx/N83 ) );
  NAND2_X1 \uut_tx/U63  ( .A1(\uut_tx/n67 ), .A2(\uut_tx/n66 ), .ZN(
        \uut_tx/N96 ) );
  AOI22_X1 \uut_tx/U62  ( .A1(enable), .A2(\uut_tx/n8 ), .B1(
        \uut_tx/count_16_indication ), .B2(\uut_tx/current_state [0]), .ZN(
        \uut_tx/n66 ) );
  AOI21_X1 \uut_tx/U61  ( .B1(\uut_tx/count_8_indication ), .B2(\uut_tx/n65 ), 
        .A(rst), .ZN(\uut_tx/n67 ) );
  INV_X1 \uut_tx/U60  ( .A(\uut_tx/n71 ), .ZN(\uut_tx/n65 ) );
  NAND2_X1 \uut_tx/U59  ( .A1(\uut_tx/current_state [1]), .A2(\uut_tx/n22 ), 
        .ZN(\uut_tx/n71 ) );
  NOR3_X1 \uut_tx/U58  ( .A1(\uut_tx/n8 ), .A2(rst), .A3(\uut_tx/n68 ), .ZN(
        \uut_tx/N33 ) );
  NOR2_X1 \uut_tx/U57  ( .A1(\uut_tx/n20 ), .A2(\uut_tx/n63 ), .ZN(
        \uut_tx/N72 ) );
  OAI33_X1 \uut_tx/U56  ( .A1(\uut_tx/n10 ), .A2(\uut_tx/n62 ), .A3(
        \uut_tx/n20 ), .B1(\uut_tx/n55 ), .B2(\uut_tx/n11 ), .B3(\uut_tx/n27 ), 
        .ZN(\uut_tx/N71 ) );
  INV_X1 \uut_tx/U55  ( .A(\uut_tx/n63 ), .ZN(\uut_tx/n62 ) );
  NAND2_X1 \uut_tx/U54  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n69 ), .ZN(
        \uut_tx/n63 ) );
  INV_X1 \uut_tx/U53  ( .A(\uut_tx/n61 ), .ZN(\uut_tx/n69 ) );
  OAI33_X1 \uut_tx/U52  ( .A1(\uut_tx/n11 ), .A2(\uut_tx/n56 ), .A3(
        \uut_tx/n20 ), .B1(\uut_tx/n28 ), .B2(\uut_tx/count_8 [1]), .B3(
        \uut_tx/n55 ), .ZN(\uut_tx/N70 ) );
  NOR2_X1 \uut_tx/U51  ( .A1(\uut_tx/n68 ), .A2(\uut_tx/n55 ), .ZN(
        \uut_tx/n56 ) );
  MUX2_X1 \uut_tx/U50  ( .A(\uut_tx/n6 ), .B(\uut_tx/n54 ), .S(
        \uut_tx/count_8 [0]), .Z(\uut_tx/N69 ) );
  NOR2_X1 \uut_tx/U49  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n20 ), .ZN(
        \uut_tx/n54 ) );
  NAND3_X1 \uut_tx/U48  ( .A1(\uut_tx/count_8 [1]), .A2(\uut_tx/count_8 [0]), 
        .A3(\uut_tx/count_8 [2]), .ZN(\uut_tx/n61 ) );
  NAND2_X1 \uut_tx/U47  ( .A1(baud_tick), .A2(\uut_tx/n4 ), .ZN(\uut_tx/n68 )
         );
  NAND2_X1 \uut_tx/U46  ( .A1(\uut_tx/n50 ), .A2(\uut_tx/n51 ), .ZN(
        \uut_tx/n57 ) );
  OAI21_X1 \uut_tx/U45  ( .B1(\uut_tx/n48 ), .B2(\uut_tx/n49 ), .A(
        \uut_tx/n47 ), .ZN(\uut_tx/n50 ) );
  NAND3_X1 \uut_tx/U44  ( .A1(\uut_tx/n46 ), .A2(\uut_tx/n12 ), .A3(
        \uut_tx/n35 ), .ZN(\uut_tx/n51 ) );
  INV_X1 \uut_tx/U43  ( .A(\uut_tx/n45 ), .ZN(\uut_tx/n46 ) );
  MUX2_X1 \uut_tx/U42  ( .A(\uut_tx/n48 ), .B(\uut_tx/n44 ), .S(\uut_tx/n7 ), 
        .Z(\uut_tx/n58 ) );
  NOR2_X1 \uut_tx/U41  ( .A1(\uut_tx/n43 ), .A2(\uut_tx/n45 ), .ZN(
        \uut_tx/n44 ) );
  OAI21_X1 \uut_tx/U40  ( .B1(\uut_tx/n12 ), .B2(\uut_tx/n23 ), .A(
        \uut_tx/n41 ), .ZN(\uut_tx/n48 ) );
  OAI22_X1 \uut_tx/U39  ( .A1(\uut_tx/n12 ), .A2(\uut_tx/n45 ), .B1(
        \uut_tx/n43 ), .B2(\uut_tx/n41 ), .ZN(\uut_tx/n59 ) );
  INV_X1 \uut_tx/U38  ( .A(\uut_tx/n40 ), .ZN(\uut_tx/n41 ) );
  OAI21_X1 \uut_tx/U37  ( .B1(\uut_tx/n42 ), .B2(\uut_tx/n39 ), .A(
        \uut_tx/n38 ), .ZN(\uut_tx/n40 ) );
  NAND3_X1 \uut_tx/U36  ( .A1(\uut_tx/n21 ), .A2(\uut_tx/n39 ), .A3(
        \uut_tx/n49 ), .ZN(\uut_tx/n45 ) );
  INV_X1 \uut_tx/U35  ( .A(\uut_tx/n42 ), .ZN(\uut_tx/n49 ) );
  MUX2_X1 \uut_tx/U34  ( .A(\uut_tx/n37 ), .B(\uut_tx/n36 ), .S(\uut_tx/n3 ), 
        .Z(\uut_tx/n60 ) );
  NOR2_X1 \uut_tx/U33  ( .A1(\uut_tx/n37 ), .A2(\uut_tx/n23 ), .ZN(
        \uut_tx/n36 ) );
  NAND4_X1 \uut_tx/U32  ( .A1(\uut_tx/n35 ), .A2(\uut_tx/n47 ), .A3(
        \uut_tx/n39 ), .A4(\uut_tx/n34 ), .ZN(\uut_tx/n52 ) );
  NAND2_X1 \uut_tx/U31  ( .A1(\uut_tx/n1 ), .A2(\uut_tx/n22 ), .ZN(
        \uut_tx/n64 ) );
  INV_X1 \uut_tx/U30  ( .A(\uut_tx/current_state [0]), .ZN(\uut_tx/n53 ) );
  INV_X1 \uut_tx/U29  ( .A(\uut_tx/n21 ), .ZN(\uut_tx/n37 ) );
  NAND2_X1 \uut_tx/U28  ( .A1(\uut_tx/n70 ), .A2(\uut_tx/n33 ), .ZN(
        \uut_tx/n38 ) );
  INV_X1 \uut_tx/U27  ( .A(baud_tick), .ZN(\uut_tx/n33 ) );
  AND2_X1 \uut_tx/U26  ( .A1(\uut_tx/next_state [1]), .A2(\uut_tx/n70 ), .ZN(
        \uut_tx/N84 ) );
  NOR2_X1 \uut_tx/U25  ( .A1(rst), .A2(\uut_tx/n89 ), .ZN(\uut_tx/N98 ) );
  XOR2_X1 \uut_tx/U24  ( .A(\uut_tx/n1 ), .B(\uut_tx/current_state [0]), .Z(
        \uut_tx/n89 ) );
  AND2_X1 \uut_tx/U23  ( .A1(\uut_tx/n71 ), .A2(\uut_tx/n70 ), .ZN(
        \uut_tx/n32 ) );
  AND2_X1 \uut_tx/U22  ( .A1(\uut_tx/n70 ), .A2(\uut_tx/n53 ), .ZN(
        \uut_tx/n31 ) );
  AND2_X2 \uut_tx/U21  ( .A1(\uut_tx/n26 ), .A2(baud_tick), .ZN(\uut_tx/n30 )
         );
  NAND3_X1 \uut_tx/U20  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n29 ), .A3(
        \uut_tx/n61 ), .ZN(\uut_tx/n28 ) );
  NAND3_X1 \uut_tx/U19  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n29 ), .A3(
        \uut_tx/n61 ), .ZN(\uut_tx/n27 ) );
  BUF_X2 \uut_tx/U18  ( .A(\uut_tx/n88 ), .Z(\uut_tx/n25 ) );
  OAI21_X1 \uut_tx/U17  ( .B1(\uut_tx/n69 ), .B2(\uut_tx/n68 ), .A(
        \uut_tx/n29 ), .ZN(\uut_tx/n24 ) );
  NAND3_X1 \uut_tx/U16  ( .A1(\uut_tx/n64 ), .A2(\uut_tx/n70 ), .A3(
        \uut_tx/n52 ), .ZN(\uut_tx/n42 ) );
  CLKBUF_X1 \uut_tx/U15  ( .A(\uut_tx/n42 ), .Z(\uut_tx/n23 ) );
  BUF_X1 \uut_tx/U14  ( .A(\uut_tx/n38 ), .Z(\uut_tx/n21 ) );
  INV_X1 \uut_tx/U13  ( .A(\uut_tx/n29 ), .ZN(\uut_tx/n20 ) );
  CLKBUF_X1 \uut_tx/U12  ( .A(\uut_tx/n34 ), .Z(\uut_tx/n12 ) );
  AND2_X1 \uut_tx/U11  ( .A1(\uut_tx/n1 ), .A2(\uut_tx/n53 ), .ZN(\uut_tx/n8 )
         );
  INV_X1 \uut_tx/U10  ( .A(\uut_tx/n9 ), .ZN(\uut_tx/n5 ) );
  AND3_X2 \uut_tx/U9  ( .A1(\uut_tx/n70 ), .A2(\uut_tx/n22 ), .A3(
        \uut_tx/current_state [1]), .ZN(\uut_tx/n29 ) );
  AND4_X1 \uut_tx/U8  ( .A1(\uut_tx/n35 ), .A2(\uut_tx/n47 ), .A3(\uut_tx/n5 ), 
        .A4(\uut_tx/n34 ), .ZN(\uut_tx/n26 ) );
  AND4_X1 \uut_tx/U7  ( .A1(\uut_tx/n35 ), .A2(\uut_tx/n47 ), .A3(\uut_tx/n5 ), 
        .A4(\uut_tx/n34 ), .ZN(\uut_tx/n4 ) );
  CLKBUF_X1 \uut_tx/U6  ( .A(\uut_tx/n9 ), .Z(\uut_tx/n3 ) );
  AND3_X2 \uut_tx/U5  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n29 ), .A3(\uut_tx/n61 ), .ZN(\uut_tx/n6 ) );
  AND3_X1 \uut_tx/U4  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n29 ), .A3(\uut_tx/n61 ), .ZN(\uut_tx/n2 ) );
  INV_X1 \uut_tx/U3  ( .A(rst), .ZN(\uut_tx/n70 ) );
  DFF_X1 \uut_tx/data_save_reg[2]  ( .D(\uut_tx/N75 ), .CK(clk), .Q(
        \uut_tx/n78 ), .QN(\uut_tx/n18 ) );
  DFF_X1 \uut_tx/data_save_reg[1]  ( .D(\uut_tx/N74 ), .CK(clk), .Q(
        \uut_tx/n76 ), .QN(\uut_tx/n19 ) );
  DFF_X1 \uut_tx/data_save_reg[3]  ( .D(\uut_tx/N76 ), .CK(clk), .Q(
        \uut_tx/n80 ), .QN(\uut_tx/n17 ) );
  DFF_X2 \uut_tx/data_save_reg[5]  ( .D(\uut_tx/N78 ), .CK(clk), .Q(
        \uut_tx/n84 ), .QN(\uut_tx/n15 ) );
  DFF_X2 \uut_tx/data_save_reg[7]  ( .D(\uut_tx/N80 ), .CK(clk), .QN(
        \uut_tx/n13 ) );
  DFF_X2 \uut_tx/count_8_reg[2]  ( .D(\uut_tx/N71 ), .CK(clk), .Q(
        \uut_tx/count_8 [2]), .QN(\uut_tx/n10 ) );
  DFF_X2 \uut_tx/data_save_reg[6]  ( .D(\uut_tx/N79 ), .CK(clk), .Q(
        \uut_tx/n86 ), .QN(\uut_tx/n14 ) );
  DFF_X2 \uut_tx/data_save_reg[4]  ( .D(\uut_tx/N77 ), .CK(clk), .Q(
        \uut_tx/n82 ), .QN(\uut_tx/n16 ) );
  DFF_X1 \uut_tx/count_8_reg[0]  ( .D(\uut_tx/N69 ), .CK(clk), .Q(
        \uut_tx/count_8 [0]), .QN(\uut_tx/n55 ) );
  DFF_X1 \uut_tx/count_16_reg[0]  ( .D(\uut_tx/n60 ), .CK(clk), .Q(
        \uut_tx/n39 ), .QN(\uut_tx/n9 ) );
  DFF_X1 \uut_tx/count_16_reg[1]  ( .D(\uut_tx/n59 ), .CK(clk), .Q(
        \uut_tx/n34 ), .QN(\uut_tx/n43 ) );
  DFF_X1 \uut_tx/count_16_reg[2]  ( .D(\uut_tx/n58 ), .CK(clk), .Q(
        \uut_tx/n35 ), .QN(\uut_tx/n7 ) );
  DFF_X1 \uut_tx/data_save_reg[0]  ( .D(\uut_tx/N73 ), .CK(clk), .Q(
        \uut_tx/n74 ) );
  DLL_X1 \uut_tx/tx_reg  ( .D(\uut_tx/N92 ), .GN(rst), .Q(tx) );
  DFF_X1 \uut_tx/count_8_indication_reg  ( .D(\uut_tx/N72 ), .CK(clk), .Q(
        \uut_tx/count_8_indication ) );
  DFF_X1 \uut_tx/count_8_reg[1]  ( .D(\uut_tx/N70 ), .CK(clk), .Q(
        \uut_tx/count_8 [1]), .QN(\uut_tx/n11 ) );
  DFF_X1 \uut_tx/current_state_reg[1]  ( .D(\uut_tx/N84 ), .CK(clk), .Q(
        \uut_tx/current_state [1]), .QN(\uut_tx/n1 ) );
  DLH_X1 \uut_tx/next_state_reg[1]  ( .G(\uut_tx/N96 ), .D(\uut_tx/N98 ), .Q(
        \uut_tx/next_state [1]) );
  DFF_X1 \uut_tx/count_16_indication_reg  ( .D(\uut_tx/N33 ), .CK(clk), .Q(
        \uut_tx/count_16_indication ) );
  DFF_X1 \uut_tx/count_16_reg[3]  ( .D(\uut_tx/n57 ), .CK(clk), .Q(
        \uut_tx/n47 ) );
  DFF_X1 \uut_tx/current_state_reg[0]  ( .D(\uut_tx/N83 ), .CK(clk), .Q(
        \uut_tx/current_state [0]), .QN(\uut_tx/n22 ) );
  DLH_X1 \uut_tx/next_state_reg[0]  ( .G(\uut_tx/N96 ), .D(\uut_tx/n31 ), .Q(
        \uut_tx/next_state [0]) );
  INV_X1 \uut_rx/U93  ( .A(\uut_rx/n100 ), .ZN(\uut_rx/n101 ) );
  OAI222_X1 \uut_rx/U92  ( .A1(\uut_rx/n11 ), .A2(\uut_rx/n99 ), .B1(
        \uut_rx/n7 ), .B2(\uut_rx/n97 ), .C1(\uut_rx/n34 ), .C2(\uut_rx/n100 ), 
        .ZN(\uut_rx/n66 ) );
  NAND2_X1 \uut_rx/U91  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n94 ), .ZN(
        \uut_rx/n100 ) );
  INV_X1 \uut_rx/U90  ( .A(\uut_rx/n97 ), .ZN(\uut_rx/n102 ) );
  OAI222_X1 \uut_rx/U89  ( .A1(\uut_rx/n13 ), .A2(\uut_rx/n99 ), .B1(
        \uut_rx/n8 ), .B2(\uut_rx/n93 ), .C1(\uut_rx/n33 ), .C2(\uut_rx/n97 ), 
        .ZN(\uut_rx/n67 ) );
  NAND2_X1 \uut_rx/U88  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n92 ), .ZN(
        \uut_rx/n97 ) );
  INV_X1 \uut_rx/U87  ( .A(\uut_rx/n93 ), .ZN(\uut_rx/n103 ) );
  OAI222_X1 \uut_rx/U86  ( .A1(\uut_rx/n15 ), .A2(\uut_rx/n99 ), .B1(
        \uut_rx/n35 ), .B2(\uut_rx/n91 ), .C1(\uut_rx/n34 ), .C2(\uut_rx/n93 ), 
        .ZN(\uut_rx/n68 ) );
  NAND2_X1 \uut_rx/U85  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n90 ), .ZN(
        \uut_rx/n93 ) );
  INV_X1 \uut_rx/U84  ( .A(\uut_rx/n91 ), .ZN(\uut_rx/n104 ) );
  OAI222_X1 \uut_rx/U83  ( .A1(\uut_rx/n17 ), .A2(\uut_rx/n99 ), .B1(
        \uut_rx/n35 ), .B2(\uut_rx/n89 ), .C1(\uut_rx/n33 ), .C2(\uut_rx/n91 ), 
        .ZN(\uut_rx/n69 ) );
  NAND2_X1 \uut_rx/U82  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n88 ), .ZN(
        \uut_rx/n91 ) );
  INV_X1 \uut_rx/U81  ( .A(\uut_rx/n89 ), .ZN(\uut_rx/n105 ) );
  OAI222_X1 \uut_rx/U80  ( .A1(\uut_rx/n19 ), .A2(\uut_rx/n99 ), .B1(
        \uut_rx/n35 ), .B2(\uut_rx/n87 ), .C1(\uut_rx/n34 ), .C2(\uut_rx/n89 ), 
        .ZN(\uut_rx/n70 ) );
  NAND2_X1 \uut_rx/U79  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n86 ), .ZN(
        \uut_rx/n89 ) );
  INV_X1 \uut_rx/U78  ( .A(\uut_rx/n87 ), .ZN(\uut_rx/n106 ) );
  OAI222_X1 \uut_rx/U77  ( .A1(\uut_rx/n21 ), .A2(\uut_rx/n99 ), .B1(
        \uut_rx/n8 ), .B2(\uut_rx/n85 ), .C1(\uut_rx/n33 ), .C2(\uut_rx/n87 ), 
        .ZN(\uut_rx/n71 ) );
  NAND2_X1 \uut_rx/U76  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n87 ) );
  INV_X1 \uut_rx/U75  ( .A(\uut_rx/n85 ), .ZN(\uut_rx/n107 ) );
  OAI222_X1 \uut_rx/U74  ( .A1(\uut_rx/n23 ), .A2(\uut_rx/n99 ), .B1(
        \uut_rx/n7 ), .B2(\uut_rx/n83 ), .C1(\uut_rx/n34 ), .C2(\uut_rx/n85 ), 
        .ZN(\uut_rx/n72 ) );
  NAND2_X1 \uut_rx/U73  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n85 ) );
  INV_X1 \uut_rx/U72  ( .A(\uut_rx/n83 ), .ZN(\uut_rx/n108 ) );
  OAI221_X1 \uut_rx/U71  ( .B1(\uut_rx/n25 ), .B2(\uut_rx/n99 ), .C1(
        \uut_rx/n33 ), .C2(\uut_rx/n83 ), .A(\uut_rx/n81 ), .ZN(\uut_rx/n73 )
         );
  NAND3_X1 \uut_rx/U70  ( .A1(rx), .A2(\uut_rx/n80 ), .A3(\uut_rx/n95 ), .ZN(
        \uut_rx/n81 ) );
  INV_X1 \uut_rx/U69  ( .A(\uut_rx/n98 ), .ZN(\uut_rx/n80 ) );
  NAND2_X1 \uut_rx/U68  ( .A1(\uut_rx/n96 ), .A2(\uut_rx/n99 ), .ZN(
        \uut_rx/n98 ) );
  NAND2_X1 \uut_rx/U67  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n79 ), .ZN(
        \uut_rx/n83 ) );
  OAI22_X1 \uut_rx/U66  ( .A1(\uut_rx/n77 ), .A2(\uut_rx/n28 ), .B1(
        \uut_rx/n64 ), .B2(\uut_rx/n1 ), .ZN(\uut_rx/n110 ) );
  AOI21_X1 \uut_rx/U65  ( .B1(\uut_rx/count_16 [3]), .B2(\uut_rx/n62 ), .A(
        \uut_rx/n4 ), .ZN(\uut_rx/n77 ) );
  AND2_X1 \uut_rx/U64  ( .A1(\uut_rx/next_state [1]), .A2(\uut_rx/n95 ), .ZN(
        \uut_rx/N98 ) );
  OAI21_X1 \uut_rx/U63  ( .B1(\uut_rx/n31 ), .B2(\uut_rx/n61 ), .A(
        \uut_rx/n60 ), .ZN(\uut_rx/N112 ) );
  NAND3_X1 \uut_rx/U62  ( .A1(\uut_rx/n59 ), .A2(\uut_rx/n95 ), .A3(
        \uut_rx/n58 ), .ZN(\uut_rx/N110 ) );
  MUX2_X1 \uut_rx/U61  ( .A(\uut_rx/n57 ), .B(\uut_rx/n56 ), .S(rx), .Z(
        \uut_rx/n58 ) );
  NAND3_X1 \uut_rx/U60  ( .A1(\uut_rx/current_state [1]), .A2(
        \uut_rx/current_state [0]), .A3(\uut_rx/count_16_indication ), .ZN(
        \uut_rx/n56 ) );
  OAI21_X1 \uut_rx/U59  ( .B1(\uut_rx/count_16_indication ), .B2(\uut_rx/n32 ), 
        .A(\uut_rx/n31 ), .ZN(\uut_rx/n57 ) );
  NAND3_X1 \uut_rx/U58  ( .A1(\uut_rx/count_8_indication ), .A2(\uut_rx/n32 ), 
        .A3(\uut_rx/n55 ), .ZN(\uut_rx/n59 ) );
  OAI33_X1 \uut_rx/U57  ( .A1(\uut_rx/n14 ), .A2(\uut_rx/n53 ), .A3(
        \uut_rx/n60 ), .B1(rst), .B2(\uut_rx/n78 ), .B3(\uut_rx/n52 ), .ZN(
        \uut_rx/N47 ) );
  NAND3_X1 \uut_rx/U56  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n51 ), .A3(
        \uut_rx/n52 ), .ZN(\uut_rx/n60 ) );
  INV_X1 \uut_rx/U55  ( .A(\uut_rx/current_state [1]), .ZN(\uut_rx/n52 ) );
  INV_X1 \uut_rx/U54  ( .A(\uut_rx/n32 ), .ZN(\uut_rx/n51 ) );
  OAI22_X1 \uut_rx/U53  ( .A1(\uut_rx/n50 ), .A2(\uut_rx/n28 ), .B1(
        \uut_rx/n49 ), .B2(\uut_rx/n6 ), .ZN(\uut_rx/n74 ) );
  INV_X1 \uut_rx/U52  ( .A(\uut_rx/n48 ), .ZN(\uut_rx/n49 ) );
  MUX2_X1 \uut_rx/U51  ( .A(\uut_rx/n47 ), .B(\uut_rx/n46 ), .S(\uut_rx/n6 ), 
        .Z(\uut_rx/n50 ) );
  NAND2_X1 \uut_rx/U50  ( .A1(\uut_rx/count_16 [0]), .A2(\uut_rx/n47 ), .ZN(
        \uut_rx/n46 ) );
  NOR2_X1 \uut_rx/U49  ( .A1(\uut_rx/n30 ), .A2(\uut_rx/n44 ), .ZN(
        \uut_rx/n45 ) );
  OAI21_X1 \uut_rx/U48  ( .B1(\uut_rx/n65 ), .B2(\uut_rx/n29 ), .A(
        \uut_rx/n63 ), .ZN(\uut_rx/n48 ) );
  OAI22_X1 \uut_rx/U47  ( .A1(\uut_rx/n29 ), .A2(\uut_rx/n30 ), .B1(
        \uut_rx/n44 ), .B2(\uut_rx/n1 ), .ZN(\uut_rx/n76 ) );
  NAND2_X1 \uut_rx/U46  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n53 ), .ZN(
        \uut_rx/n63 ) );
  INV_X1 \uut_rx/U45  ( .A(baud_tick), .ZN(\uut_rx/n53 ) );
  INV_X1 \uut_rx/U44  ( .A(\uut_rx/n31 ), .ZN(\uut_rx/n55 ) );
  NAND2_X1 \uut_rx/U43  ( .A1(\uut_rx/n20 ), .A2(\uut_rx/n64 ), .ZN(
        \uut_rx/n54 ) );
  NOR3_X1 \uut_rx/U42  ( .A1(\uut_rx/n42 ), .A2(\uut_rx/n41 ), .A3(
        \uut_rx/n40 ), .ZN(\uut_rx/N78 ) );
  NOR2_X1 \uut_rx/U41  ( .A1(\uut_rx/n39 ), .A2(\uut_rx/n41 ), .ZN(
        \uut_rx/N77 ) );
  NOR2_X1 \uut_rx/U40  ( .A1(\uut_rx/n38 ), .A2(\uut_rx/n41 ), .ZN(
        \uut_rx/N76 ) );
  NOR2_X1 \uut_rx/U39  ( .A1(\uut_rx/n41 ), .A2(\uut_rx/n37 ), .ZN(
        \uut_rx/N75 ) );
  NAND3_X1 \uut_rx/U38  ( .A1(\uut_rx/n16 ), .A2(baud_tick), .A3(
        \uut_rx/count_16 [3]), .ZN(\uut_rx/n78 ) );
  NAND3_X1 \uut_rx/U37  ( .A1(\uut_rx/n47 ), .A2(\uut_rx/n2 ), .A3(
        \uut_rx/n29 ), .ZN(\uut_rx/n62 ) );
  NAND2_X1 \uut_rx/U36  ( .A1(\uut_rx/current_state [1]), .A2(\uut_rx/n109 ), 
        .ZN(\uut_rx/n41 ) );
  AND2_X1 \uut_rx/U35  ( .A1(\uut_rx/next_state [0]), .A2(\uut_rx/n95 ), .ZN(
        \uut_rx/N97 ) );
  INV_X1 \uut_rx/U34  ( .A(\uut_rx/n61 ), .ZN(\uut_rx/n109 ) );
  NAND2_X1 \uut_rx/U33  ( .A1(\uut_rx/n95 ), .A2(\uut_rx/n32 ), .ZN(
        \uut_rx/n61 ) );
  OAI211_X1 \uut_rx/U32  ( .C1(\uut_rx/n43 ), .C2(\uut_rx/n55 ), .A(
        \uut_rx/n63 ), .B(\uut_rx/n95 ), .ZN(\uut_rx/n65 ) );
  INV_X1 \uut_rx/U31  ( .A(rst), .ZN(\uut_rx/n95 ) );
  XNOR2_X1 \uut_rx/U30  ( .A(\uut_rx/n78 ), .B(\uut_rx/n27 ), .ZN(\uut_rx/n37 ) );
  XNOR2_X1 \uut_rx/U29  ( .A(\uut_rx/n42 ), .B(\uut_rx/n40 ), .ZN(\uut_rx/n39 ) );
  MUX2_X1 \uut_rx/U28  ( .A(\uut_rx/n45 ), .B(\uut_rx/n48 ), .S(\uut_rx/n9 ), 
        .Z(\uut_rx/n75 ) );
  OAI211_X1 \uut_rx/U27  ( .C1(\uut_rx/n43 ), .C2(\uut_rx/n55 ), .A(
        \uut_rx/n63 ), .B(\uut_rx/n95 ), .ZN(\uut_rx/n30 ) );
  CLKBUF_X1 \uut_rx/U26  ( .A(\uut_rx/n96 ), .Z(\uut_rx/n33 ) );
  CLKBUF_X1 \uut_rx/U25  ( .A(\uut_rx/n96 ), .Z(\uut_rx/n34 ) );
  AND2_X1 \uut_rx/U24  ( .A1(\uut_rx/n3 ), .A2(\uut_rx/n18 ), .ZN(\uut_rx/n96 ) );
  INV_X1 \uut_rx/U23  ( .A(\uut_rx/n44 ), .ZN(\uut_rx/n29 ) );
  OAI211_X1 \uut_rx/U22  ( .C1(\uut_rx/n43 ), .C2(\uut_rx/n55 ), .A(
        \uut_rx/n63 ), .B(\uut_rx/n95 ), .ZN(\uut_rx/n28 ) );
  INV_X1 \uut_rx/U21  ( .A(\uut_rx/n22 ), .ZN(\uut_rx/n24 ) );
  AND3_X2 \uut_rx/U20  ( .A1(\uut_rx/n54 ), .A2(\uut_rx/n52 ), .A3(
        \uut_rx/n51 ), .ZN(\uut_rx/n43 ) );
  AND2_X1 \uut_rx/U19  ( .A1(baud_tick), .A2(\uut_rx/count_16 [3]), .ZN(
        \uut_rx/n18 ) );
  AND3_X1 \uut_rx/U18  ( .A1(\uut_rx/n47 ), .A2(\uut_rx/n36 ), .A3(
        \uut_rx/count_16 [0]), .ZN(\uut_rx/n16 ) );
  INV_X1 \uut_rx/U17  ( .A(\uut_rx/n4 ), .ZN(\uut_rx/n14 ) );
  NAND2_X1 \uut_rx/U16  ( .A1(\uut_rx/n10 ), .A2(\uut_rx/count_8[1] ), .ZN(
        \uut_rx/n12 ) );
  OR2_X1 \uut_rx/U15  ( .A1(\uut_rx/n12 ), .A2(\uut_rx/n78 ), .ZN(\uut_rx/n42 ) );
  CLKBUF_X1 \uut_rx/U14  ( .A(\uut_rx/n24 ), .Z(\uut_rx/n9 ) );
  BUF_X1 \uut_rx/U13  ( .A(\uut_rx/n98 ), .Z(\uut_rx/n35 ) );
  CLKBUF_X1 \uut_rx/U12  ( .A(\uut_rx/n98 ), .Z(\uut_rx/n8 ) );
  CLKBUF_X1 \uut_rx/U11  ( .A(\uut_rx/n98 ), .Z(\uut_rx/n7 ) );
  OR2_X1 \uut_rx/U10  ( .A1(\uut_rx/n27 ), .A2(\uut_rx/n78 ), .ZN(\uut_rx/n5 )
         );
  MUX2_X1 \uut_rx/U9  ( .A(\uut_rx/count_8[1] ), .B(\uut_rx/n26 ), .S(
        \uut_rx/n5 ), .Z(\uut_rx/n38 ) );
  OAI21_X2 \uut_rx/U8  ( .B1(\uut_rx/n31 ), .B2(\uut_rx/current_state [0]), 
        .A(\uut_rx/n95 ), .ZN(\uut_rx/n99 ) );
  AND2_X1 \uut_rx/U7  ( .A1(\uut_rx/n3 ), .A2(\uut_rx/n64 ), .ZN(\uut_rx/n4 )
         );
  AND3_X1 \uut_rx/U6  ( .A1(\uut_rx/count_16 [0]), .A2(\uut_rx/n24 ), .A3(
        \uut_rx/n36 ), .ZN(\uut_rx/n20 ) );
  AND3_X1 \uut_rx/U5  ( .A1(\uut_rx/count_16 [0]), .A2(\uut_rx/n24 ), .A3(
        \uut_rx/n36 ), .ZN(\uut_rx/n3 ) );
  INV_X1 \uut_rx/U4  ( .A(\uut_rx/n6 ), .ZN(\uut_rx/n2 ) );
  BUF_X1 \uut_rx/U3  ( .A(\uut_rx/n63 ), .Z(\uut_rx/n1 ) );
  DFF_X2 \uut_rx/count_8_reg[1]  ( .D(\uut_rx/N76 ), .CK(clk), .Q(
        \uut_rx/count_8[1] ), .QN(\uut_rx/n26 ) );
  DFF_X2 \uut_rx/data_save_reg[7]  ( .D(\uut_rx/n66 ), .CK(clk), .Q(
        \uut_rx/n94 ), .QN(\uut_rx/n11 ) );
  DFF_X2 \uut_rx/data_save_reg[2]  ( .D(\uut_rx/n71 ), .CK(clk), .Q(
        \uut_rx/n84 ), .QN(\uut_rx/n21 ) );
  DFF_X2 \uut_rx/data_save_reg[5]  ( .D(\uut_rx/n68 ), .CK(clk), .Q(
        \uut_rx/n90 ), .QN(\uut_rx/n15 ) );
  DFF_X2 \uut_rx/data_save_reg[3]  ( .D(\uut_rx/n70 ), .CK(clk), .Q(
        \uut_rx/n86 ), .QN(\uut_rx/n19 ) );
  DFF_X2 \uut_rx/data_save_reg[6]  ( .D(\uut_rx/n67 ), .CK(clk), .Q(
        \uut_rx/n92 ), .QN(\uut_rx/n13 ) );
  DFF_X2 \uut_rx/data_save_reg[1]  ( .D(\uut_rx/n72 ), .CK(clk), .Q(
        \uut_rx/n82 ), .QN(\uut_rx/n23 ) );
  DFF_X2 \uut_rx/data_save_reg[4]  ( .D(\uut_rx/n69 ), .CK(clk), .Q(
        \uut_rx/n88 ), .QN(\uut_rx/n17 ) );
  DFF_X2 \uut_rx/data_save_reg[0]  ( .D(\uut_rx/n73 ), .CK(clk), .Q(
        \uut_rx/n79 ), .QN(\uut_rx/n25 ) );
  DFF_X1 \uut_rx/count_16_reg[3]  ( .D(\uut_rx/n110 ), .CK(clk), .Q(
        \uut_rx/count_16 [3]), .QN(\uut_rx/n64 ) );
  DFF_X1 \uut_rx/count_16_reg[0]  ( .D(\uut_rx/n76 ), .CK(clk), .Q(
        \uut_rx/count_16 [0]), .QN(\uut_rx/n44 ) );
  DFF_X1 \uut_rx/count_16_reg[1]  ( .D(\uut_rx/n75 ), .CK(clk), .Q(
        \uut_rx/n47 ), .QN(\uut_rx/n22 ) );
  DFF_X1 \uut_rx/count_8_reg[2]  ( .D(\uut_rx/N77 ), .CK(clk), .QN(
        \uut_rx/n40 ) );
  DFF_X1 \uut_rx/count_16_reg[2]  ( .D(\uut_rx/n74 ), .CK(clk), .Q(
        \uut_rx/n36 ), .QN(\uut_rx/n6 ) );
  DFF_X1 \uut_rx/count_16_indication_reg  ( .D(\uut_rx/N47 ), .CK(clk), .Q(
        \uut_rx/count_16_indication ) );
  DFF_X1 \uut_rx/count_8_indication_reg  ( .D(\uut_rx/N78 ), .CK(clk), .Q(
        \uut_rx/count_8_indication ) );
  DFF_X1 \uut_rx/count_8_reg[0]  ( .D(\uut_rx/N75 ), .CK(clk), .Q(\uut_rx/n10 ), .QN(\uut_rx/n27 ) );
  DFF_X1 \uut_rx/ext_data_out_reg[7]  ( .D(\uut_rx/n101 ), .CK(clk), .Q(
        data_in[7]) );
  DFF_X1 \uut_rx/ext_data_out_reg[6]  ( .D(\uut_rx/n102 ), .CK(clk), .Q(
        data_in[6]) );
  DFF_X1 \uut_rx/ext_data_out_reg[5]  ( .D(\uut_rx/n103 ), .CK(clk), .Q(
        data_in[5]) );
  DFF_X1 \uut_rx/ext_data_out_reg[4]  ( .D(\uut_rx/n104 ), .CK(clk), .Q(
        data_in[4]) );
  DFF_X1 \uut_rx/ext_data_out_reg[3]  ( .D(\uut_rx/n105 ), .CK(clk), .Q(
        data_in[3]) );
  DFF_X1 \uut_rx/ext_data_out_reg[2]  ( .D(\uut_rx/n106 ), .CK(clk), .Q(
        data_in[2]) );
  DFF_X1 \uut_rx/ext_data_out_reg[1]  ( .D(\uut_rx/n107 ), .CK(clk), .Q(
        data_in[1]) );
  DFF_X1 \uut_rx/ext_data_out_reg[0]  ( .D(\uut_rx/n108 ), .CK(clk), .Q(
        data_in[0]) );
  DFF_X1 \uut_rx/current_state_reg[1]  ( .D(\uut_rx/N98 ), .CK(clk), .Q(
        \uut_rx/current_state [1]), .QN(\uut_rx/n31 ) );
  DLH_X1 \uut_rx/next_state_reg[1]  ( .G(\uut_rx/N110 ), .D(\uut_rx/N112 ), 
        .Q(\uut_rx/next_state [1]) );
  DFF_X1 \uut_rx/current_state_reg[0]  ( .D(\uut_rx/N97 ), .CK(clk), .Q(
        \uut_rx/current_state [0]), .QN(\uut_rx/n32 ) );
  DLH_X1 \uut_rx/next_state_reg[0]  ( .G(\uut_rx/N110 ), .D(\uut_rx/n109 ), 
        .Q(\uut_rx/next_state [0]) );
endmodule

