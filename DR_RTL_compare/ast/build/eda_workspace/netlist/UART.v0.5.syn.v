/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 14:07:31 2026
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
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, \uut_baud_rate/n93 ,
         \uut_baud_rate/n92 , \uut_baud_rate/n91 , \uut_baud_rate/n90 ,
         \uut_baud_rate/n89 , \uut_baud_rate/n88 , \uut_baud_rate/n87 ,
         \uut_baud_rate/n86 , \uut_baud_rate/n85 , \uut_baud_rate/n84 ,
         \uut_baud_rate/n83 , \uut_baud_rate/n82 , \uut_baud_rate/n81 ,
         \uut_baud_rate/n80 , \uut_baud_rate/n79 , \uut_baud_rate/n78 ,
         \uut_baud_rate/n77 , \uut_baud_rate/n76 , \uut_baud_rate/n75 ,
         \uut_baud_rate/n74 , \uut_baud_rate/n73 , \uut_baud_rate/n72 ,
         \uut_baud_rate/n71 , \uut_baud_rate/n70 , \uut_baud_rate/n69 ,
         \uut_baud_rate/n68 , \uut_baud_rate/n67 , \uut_baud_rate/n66 ,
         \uut_baud_rate/n65 , \uut_baud_rate/n64 , \uut_baud_rate/n63 ,
         \uut_baud_rate/n62 , \uut_baud_rate/n61 , \uut_baud_rate/n60 ,
         \uut_baud_rate/n59 , \uut_baud_rate/n58 , \uut_baud_rate/n57 ,
         \uut_baud_rate/n56 , \uut_baud_rate/n55 , \uut_baud_rate/n54 ,
         \uut_baud_rate/n53 , \uut_baud_rate/n52 , \uut_baud_rate/n51 ,
         \uut_baud_rate/n50 , \uut_baud_rate/n49 , \uut_baud_rate/n48 ,
         \uut_baud_rate/n47 , \uut_baud_rate/n46 , \uut_baud_rate/n45 ,
         \uut_baud_rate/n44 , \uut_baud_rate/n43 , \uut_baud_rate/n42 ,
         \uut_baud_rate/n41 , \uut_baud_rate/n40 , \uut_baud_rate/n39 ,
         \uut_baud_rate/n38 , \uut_baud_rate/n37 , \uut_baud_rate/n36 ,
         \uut_baud_rate/n35 , \uut_baud_rate/n34 , \uut_baud_rate/n33 ,
         \uut_baud_rate/n32 , \uut_baud_rate/n31 , \uut_baud_rate/n13 ,
         \uut_baud_rate/n12 , \uut_baud_rate/n11 , \uut_baud_rate/n10 ,
         \uut_baud_rate/n9 , \uut_baud_rate/n8 , \uut_baud_rate/n7 ,
         \uut_baud_rate/n6 , \uut_baud_rate/n5 , \uut_baud_rate/n4 ,
         \uut_baud_rate/n3 , \uut_baud_rate/n2 , \uut_baud_rate/n27 ,
         \uut_baud_rate/n26 , \uut_baud_rate/n25 , \uut_baud_rate/n24 ,
         \uut_baud_rate/n23 , \uut_baud_rate/n22 , \uut_baud_rate/n21 ,
         \uut_baud_rate/n20 , \uut_baud_rate/n19 , \uut_baud_rate/n18 ,
         \uut_baud_rate/n17 , \uut_baud_rate/N108 , \uut_baud_rate/N107 ,
         \uut_baud_rate/N106 , \uut_baud_rate/N105 , \uut_baud_rate/N104 ,
         \uut_baud_rate/N103 , \uut_baud_rate/N102 , \uut_baud_rate/N101 ,
         \uut_baud_rate/N100 , \uut_baud_rate/N98 , \uut_baud_rate/N97 ,
         \uut_baud_rate/N96 , \uut_baud_rate/N94 , \uut_baud_rate/N93 ,
         \uut_baud_rate/N92 , \uut_baud_rate/N91 , \uut_baud_rate/N90 ,
         \uut_baud_rate/N89 , \uut_baud_rate/N87 , \uut_baud_rate/N86 ,
         \uut_baud_rate/N84 , \uut_baud_rate/N83 , \uut_baud_rate/N82 ,
         \uut_baud_rate/N81 , \uut_baud_rate/N78 , \uut_baud_rate/N43 ,
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
         \uut_baud_rate/N12 , \uut_baud_rate/baud_count_at_max ,
         \uut_baud_rate/temp_en , \uut_baud_rate/add_165/n311 ,
         \uut_baud_rate/add_165/n310 , \uut_baud_rate/add_165/n309 ,
         \uut_baud_rate/add_165/n308 , \uut_baud_rate/add_165/n307 ,
         \uut_baud_rate/add_165/n306 , \uut_baud_rate/add_165/n305 ,
         \uut_baud_rate/add_165/n304 , \uut_baud_rate/add_165/n303 ,
         \uut_baud_rate/add_165/n302 , \uut_baud_rate/add_165/n301 ,
         \uut_baud_rate/add_165/n300 , \uut_baud_rate/add_165/n299 ,
         \uut_baud_rate/add_165/n298 , \uut_baud_rate/add_165/n297 ,
         \uut_baud_rate/add_165/n296 , \uut_baud_rate/add_165/n295 ,
         \uut_baud_rate/add_165/n294 , \uut_baud_rate/add_165/n293 ,
         \uut_baud_rate/add_165/n292 , \uut_baud_rate/add_165/n291 ,
         \uut_baud_rate/add_165/n290 , \uut_baud_rate/add_165/n289 ,
         \uut_baud_rate/add_165/n288 , \uut_baud_rate/add_165/n287 ,
         \uut_baud_rate/add_165/n286 , \uut_baud_rate/add_165/n285 ,
         \uut_baud_rate/add_165/n284 , \uut_baud_rate/add_165/n283 ,
         \uut_baud_rate/add_165/n282 , \uut_baud_rate/add_165/n281 ,
         \uut_baud_rate/add_165/n280 , \uut_baud_rate/add_165/n279 ,
         \uut_baud_rate/add_165/n278 , \uut_baud_rate/add_165/n277 ,
         \uut_baud_rate/add_165/n276 , \uut_baud_rate/add_165/n275 ,
         \uut_baud_rate/add_165/n274 , \uut_baud_rate/add_165/n273 ,
         \uut_baud_rate/add_165/n272 , \uut_baud_rate/add_165/n271 ,
         \uut_baud_rate/add_165/n270 , \uut_baud_rate/add_165/n269 ,
         \uut_baud_rate/add_165/n268 , \uut_baud_rate/add_165/n267 ,
         \uut_baud_rate/add_165/n266 , \uut_baud_rate/add_165/n265 ,
         \uut_baud_rate/add_165/n264 , \uut_baud_rate/add_165/n263 ,
         \uut_baud_rate/add_165/n262 , \uut_baud_rate/add_165/n261 ,
         \uut_baud_rate/add_165/n260 , \uut_baud_rate/add_165/n259 ,
         \uut_baud_rate/add_165/n258 , \uut_baud_rate/add_165/n257 ,
         \uut_baud_rate/add_165/n256 , \uut_baud_rate/add_165/n255 ,
         \uut_baud_rate/add_165/n254 , \uut_baud_rate/add_165/n253 ,
         \uut_baud_rate/add_165/n252 , \uut_baud_rate/add_165/n251 ,
         \uut_baud_rate/add_165/n250 , \uut_baud_rate/add_165/n249 ,
         \uut_baud_rate/add_165/n248 , \uut_baud_rate/add_165/n247 ,
         \uut_baud_rate/add_165/n246 , \uut_baud_rate/add_165/n245 ,
         \uut_baud_rate/add_165/n244 , \uut_baud_rate/add_165/n243 ,
         \uut_baud_rate/add_165/n242 , \uut_baud_rate/add_165/n241 ,
         \uut_baud_rate/add_165/n240 , \uut_baud_rate/add_165/n239 ,
         \uut_baud_rate/add_165/n238 , \uut_baud_rate/add_165/n237 ,
         \uut_baud_rate/add_165/n236 , \uut_baud_rate/add_165/n235 ,
         \uut_baud_rate/add_165/n234 , \uut_baud_rate/add_165/n233 ,
         \uut_baud_rate/add_165/n232 , \uut_baud_rate/add_165/n231 ,
         \uut_baud_rate/add_165/n230 , \uut_baud_rate/add_165/n229 ,
         \uut_baud_rate/add_165/n228 , \uut_baud_rate/add_165/n227 ,
         \uut_baud_rate/add_165/n226 , \uut_baud_rate/add_165/n225 ,
         \uut_baud_rate/add_165/n224 , \uut_baud_rate/add_165/n223 ,
         \uut_baud_rate/add_165/n222 , \uut_baud_rate/add_165/n221 ,
         \uut_baud_rate/add_165/n220 , \uut_baud_rate/add_165/n219 ,
         \uut_baud_rate/add_165/n218 , \uut_baud_rate/add_165/n217 ,
         \uut_baud_rate/add_165/n216 , \uut_baud_rate/add_165/n215 ,
         \uut_baud_rate/add_165/n214 , \uut_baud_rate/add_165/n213 ,
         \uut_baud_rate/add_165/n212 , \uut_baud_rate/add_165/n211 ,
         \uut_baud_rate/add_165/n210 , \uut_baud_rate/add_165/n209 ,
         \uut_baud_rate/add_165/n208 , \uut_baud_rate/add_165/n207 ,
         \uut_baud_rate/add_165/n206 , \uut_baud_rate/add_165/n205 ,
         \uut_baud_rate/add_165/n204 , \uut_baud_rate/add_165/n203 ,
         \uut_baud_rate/add_165/n202 , \uut_baud_rate/add_165/n201 ,
         \uut_baud_rate/add_165/n200 , \uut_baud_rate/add_165/n199 ,
         \uut_baud_rate/add_165/n198 , \uut_baud_rate/add_165/n197 ,
         \uut_baud_rate/add_165/n196 , \uut_baud_rate/add_165/n195 ,
         \uut_baud_rate/add_165/n194 , \uut_baud_rate/add_165/n193 ,
         \uut_baud_rate/add_165/n192 , \uut_baud_rate/add_165/n191 ,
         \uut_baud_rate/add_165/n190 , \uut_baud_rate/add_165/n189 ,
         \uut_baud_rate/add_165/n188 , \uut_baud_rate/add_165/n187 ,
         \uut_baud_rate/add_165/n186 , \uut_baud_rate/add_165/n185 ,
         \uut_baud_rate/add_165/n184 , \uut_baud_rate/add_165/n183 ,
         \uut_baud_rate/add_165/n182 , \uut_baud_rate/add_165/n181 ,
         \uut_baud_rate/add_165/n180 , \uut_baud_rate/add_165/n179 ,
         \uut_baud_rate/add_165/n178 , \uut_baud_rate/add_165/n177 ,
         \uut_baud_rate/add_165/n176 , \uut_baud_rate/add_165/n175 ,
         \uut_baud_rate/add_165/n174 , \uut_baud_rate/add_165/n173 ,
         \uut_baud_rate/add_165/n172 , \uut_baud_rate/add_165/n171 ,
         \uut_baud_rate/add_165/n170 , \uut_baud_rate/add_165/n169 ,
         \uut_baud_rate/add_165/n168 , \uut_baud_rate/add_165/n167 ,
         \uut_baud_rate/add_165/n166 , \uut_baud_rate/add_165/n165 ,
         \uut_baud_rate/add_165/n164 , \uut_baud_rate/add_165/n163 ,
         \uut_baud_rate/add_165/n162 , \uut_baud_rate/add_165/n161 ,
         \uut_baud_rate/add_165/n160 , \uut_baud_rate/add_165/n159 ,
         \uut_baud_rate/add_165/n158 , \uut_baud_rate/add_165/n157 ,
         \uut_baud_rate/add_165/n156 , \uut_baud_rate/add_165/n155 ,
         \uut_baud_rate/add_165/n154 , \uut_baud_rate/add_165/n153 ,
         \uut_baud_rate/add_165/n152 , \uut_baud_rate/add_165/n151 ,
         \uut_baud_rate/add_165/n150 , \uut_baud_rate/add_165/n149 ,
         \uut_baud_rate/add_165/n148 , \uut_baud_rate/add_165/n147 ,
         \uut_baud_rate/add_165/n146 , \uut_baud_rate/add_165/n145 ,
         \uut_baud_rate/add_165/n144 , \uut_baud_rate/add_165/n143 ,
         \uut_baud_rate/add_165/n142 , \uut_baud_rate/add_165/n141 ,
         \uut_baud_rate/add_165/n140 , \uut_baud_rate/add_165/n139 ,
         \uut_baud_rate/add_165/n138 , \uut_baud_rate/add_165/n137 ,
         \uut_baud_rate/add_165/n136 , \uut_baud_rate/add_165/n135 ,
         \uut_baud_rate/add_165/n134 , \uut_baud_rate/add_165/n133 ,
         \uut_baud_rate/add_165/n132 , \uut_baud_rate/add_165/n131 ,
         \uut_baud_rate/add_165/n130 , \uut_baud_rate/add_165/n129 ,
         \uut_baud_rate/add_165/n128 , \uut_baud_rate/add_165/n127 ,
         \uut_baud_rate/add_165/n126 , \uut_baud_rate/add_165/n125 ,
         \uut_baud_rate/add_165/n124 , \uut_baud_rate/add_165/n123 ,
         \uut_baud_rate/add_165/n122 , \uut_baud_rate/add_165/n121 ,
         \uut_baud_rate/add_165/n120 , \uut_baud_rate/add_165/n119 ,
         \uut_baud_rate/add_165/n118 , \uut_baud_rate/add_165/n117 ,
         \uut_baud_rate/add_165/n116 , \uut_baud_rate/add_165/n115 ,
         \uut_baud_rate/add_165/n114 , \uut_baud_rate/add_165/n113 ,
         \uut_baud_rate/add_165/n112 , \uut_baud_rate/add_165/n111 ,
         \uut_baud_rate/add_165/n110 , \uut_baud_rate/add_165/n109 ,
         \uut_baud_rate/add_165/n108 , \uut_baud_rate/add_165/n107 ,
         \uut_baud_rate/add_165/n106 , \uut_baud_rate/add_165/n105 ,
         \uut_baud_rate/add_165/n104 , \uut_baud_rate/add_165/n103 ,
         \uut_baud_rate/add_165/n102 , \uut_baud_rate/add_165/n101 ,
         \uut_baud_rate/add_165/n100 , \uut_baud_rate/add_165/n99 ,
         \uut_baud_rate/add_165/n98 , \uut_baud_rate/add_165/n97 ,
         \uut_baud_rate/add_165/n96 , \uut_baud_rate/add_165/n95 ,
         \uut_baud_rate/add_165/n94 , \uut_baud_rate/add_165/n93 ,
         \uut_baud_rate/add_165/n92 , \uut_baud_rate/add_165/n91 ,
         \uut_baud_rate/add_165/n90 , \uut_baud_rate/add_165/n89 ,
         \uut_baud_rate/add_165/n88 , \uut_baud_rate/add_165/n87 ,
         \uut_baud_rate/add_165/n86 , \uut_baud_rate/add_165/n85 ,
         \uut_baud_rate/add_165/n84 , \uut_baud_rate/add_165/n83 ,
         \uut_baud_rate/add_165/n82 , \uut_baud_rate/add_165/n81 ,
         \uut_baud_rate/add_165/n80 , \uut_baud_rate/add_165/n79 ,
         \uut_baud_rate/add_165/n78 , \uut_baud_rate/add_165/n77 ,
         \uut_baud_rate/add_165/n76 , \uut_baud_rate/add_165/n75 ,
         \uut_baud_rate/add_165/n74 , \uut_baud_rate/add_165/n73 ,
         \uut_baud_rate/add_165/n72 , \uut_baud_rate/add_165/n71 ,
         \uut_baud_rate/add_165/n70 , \uut_baud_rate/add_165/n69 ,
         \uut_baud_rate/add_165/n68 , \uut_baud_rate/add_165/n67 ,
         \uut_baud_rate/add_165/n66 , \uut_baud_rate/add_165/n65 ,
         \uut_baud_rate/add_165/n64 , \uut_baud_rate/add_165/n63 ,
         \uut_baud_rate/add_165/n62 , \uut_baud_rate/add_165/n61 ,
         \uut_baud_rate/add_165/n60 , \uut_baud_rate/add_165/n59 ,
         \uut_baud_rate/add_165/n58 , \uut_baud_rate/add_165/n57 ,
         \uut_baud_rate/add_165/n56 , \uut_baud_rate/add_165/n55 ,
         \uut_baud_rate/add_165/n54 , \uut_baud_rate/add_165/n53 ,
         \uut_baud_rate/add_165/n52 , \uut_baud_rate/add_165/n51 ,
         \uut_baud_rate/add_165/n50 , \uut_baud_rate/add_165/n49 ,
         \uut_baud_rate/add_165/n47 , \uut_baud_rate/add_165/n46 ,
         \uut_baud_rate/add_165/n45 , \uut_baud_rate/add_165/n44 ,
         \uut_baud_rate/add_165/n43 , \uut_baud_rate/add_165/n42 ,
         \uut_baud_rate/add_165/n41 , \uut_baud_rate/add_165/n40 ,
         \uut_baud_rate/add_165/n39 , \uut_baud_rate/add_165/n38 ,
         \uut_baud_rate/add_165/n37 , \uut_baud_rate/add_165/n36 ,
         \uut_baud_rate/add_165/n35 , \uut_baud_rate/add_165/n34 ,
         \uut_baud_rate/add_165/n33 , \uut_baud_rate/add_165/n32 ,
         \uut_baud_rate/add_165/n31 , \uut_baud_rate/add_165/n30 ,
         \uut_baud_rate/add_165/n29 , \uut_baud_rate/add_165/n28 ,
         \uut_baud_rate/add_165/n27 , \uut_baud_rate/add_165/n26 ,
         \uut_baud_rate/add_165/n25 , \uut_baud_rate/add_165/n24 ,
         \uut_baud_rate/add_165/n23 , \uut_baud_rate/add_165/n22 ,
         \uut_baud_rate/add_165/n21 , \uut_baud_rate/add_165/n20 ,
         \uut_baud_rate/add_165/n19 , \uut_baud_rate/add_165/n17 ,
         \uut_baud_rate/add_165/n16 , \uut_baud_rate/add_165/n15 ,
         \uut_baud_rate/add_165/n14 , \uut_baud_rate/add_165/n13 ,
         \uut_baud_rate/add_165/n12 , \uut_baud_rate/add_165/n11 ,
         \uut_baud_rate/add_165/n10 , \uut_baud_rate/add_165/n9 ,
         \uut_baud_rate/add_165/n8 , \uut_baud_rate/add_165/n7 ,
         \uut_baud_rate/add_165/n6 , \uut_baud_rate/add_165/n5 ,
         \uut_baud_rate/add_165/n4 , \uut_baud_rate/add_165/n3 ,
         \uut_baud_rate/add_165/n2 , \uut_baud_rate/add_165/n1 ,
         \uut_baud_rate/eq_147/n42 , \uut_baud_rate/eq_147/n41 ,
         \uut_baud_rate/eq_147/n40 , \uut_baud_rate/eq_147/n39 ,
         \uut_baud_rate/eq_147/n38 , \uut_baud_rate/eq_147/n37 ,
         \uut_baud_rate/eq_147/n36 , \uut_baud_rate/eq_147/n35 ,
         \uut_baud_rate/eq_147/n34 , \uut_baud_rate/eq_147/n33 ,
         \uut_baud_rate/eq_147/n32 , \uut_baud_rate/eq_147/n31 ,
         \uut_baud_rate/eq_147/n30 , \uut_baud_rate/eq_147/n29 ,
         \uut_baud_rate/eq_147/n28 , \uut_baud_rate/eq_147/n27 ,
         \uut_baud_rate/eq_147/n26 , \uut_baud_rate/eq_147/n25 ,
         \uut_baud_rate/eq_147/n24 , \uut_baud_rate/eq_147/n23 ,
         \uut_baud_rate/eq_147/n22 , \uut_baud_rate/eq_147/n21 ,
         \uut_baud_rate/eq_147/n20 , \uut_baud_rate/eq_147/n19 ,
         \uut_baud_rate/eq_147/n18 , \uut_baud_rate/eq_147/n17 ,
         \uut_baud_rate/eq_147/n16 , \uut_baud_rate/eq_147/n15 ,
         \uut_baud_rate/eq_147/n14 , \uut_baud_rate/eq_147/n13 ,
         \uut_baud_rate/eq_147/n12 , \uut_baud_rate/eq_147/n11 ,
         \uut_baud_rate/eq_147/n10 , \uut_baud_rate/eq_147/n9 ,
         \uut_baud_rate/eq_147/n8 , \uut_baud_rate/eq_147/n7 ,
         \uut_baud_rate/eq_147/n6 , \uut_baud_rate/eq_147/n5 ,
         \uut_baud_rate/eq_147/n4 , \uut_baud_rate/eq_147/n3 ,
         \uut_baud_rate/eq_147/n2 , \uut_baud_rate/eq_147/n1 , \uut_tx/n102 ,
         \uut_tx/n101 , \uut_tx/n100 , \uut_tx/n99 , \uut_tx/n98 ,
         \uut_tx/n97 , \uut_tx/n96 , \uut_tx/n95 , \uut_tx/n94 , \uut_tx/n93 ,
         \uut_tx/n92 , \uut_tx/n91 , \uut_tx/n90 , \uut_tx/n89 , \uut_tx/n88 ,
         \uut_tx/n87 , \uut_tx/n86 , \uut_tx/n85 , \uut_tx/n84 , \uut_tx/n83 ,
         \uut_tx/n82 , \uut_tx/n81 , \uut_tx/n80 , \uut_tx/n79 , \uut_tx/n78 ,
         \uut_tx/n77 , \uut_tx/n76 , \uut_tx/n61 , \uut_tx/n60 , \uut_tx/n59 ,
         \uut_tx/n58 , \uut_tx/n57 , \uut_tx/n56 , \uut_tx/n55 , \uut_tx/n54 ,
         \uut_tx/n53 , \uut_tx/n52 , \uut_tx/n51 , \uut_tx/n50 , \uut_tx/n49 ,
         \uut_tx/n48 , \uut_tx/n47 , \uut_tx/n46 , \uut_tx/n45 , \uut_tx/n44 ,
         \uut_tx/n43 , \uut_tx/n42 , \uut_tx/n41 , \uut_tx/n40 , \uut_tx/n39 ,
         \uut_tx/n38 , \uut_tx/n37 , \uut_tx/n36 , \uut_tx/n35 , \uut_tx/n34 ,
         \uut_tx/n33 , \uut_tx/n32 , \uut_tx/n31 , \uut_tx/n30 , \uut_tx/n29 ,
         \uut_tx/n28 , \uut_tx/n27 , \uut_tx/n26 , \uut_tx/n25 , \uut_tx/n23 ,
         \uut_tx/n21 , \uut_tx/n20 , \uut_tx/n10 , \uut_tx/n8 , \uut_tx/n7 ,
         \uut_tx/n6 , \uut_tx/n5 , \uut_tx/n4 , \uut_tx/n3 , \uut_tx/n2 ,
         \uut_tx/n1 , \uut_tx/n75 , \uut_tx/n74 , \uut_tx/n73 , \uut_tx/n72 ,
         \uut_tx/n71 , \uut_tx/n70 , \uut_tx/n69 , \uut_tx/n68 , \uut_tx/n67 ,
         \uut_tx/n66 , \uut_tx/n65 , \uut_tx/n64 , \uut_tx/n63 , \uut_tx/n62 ,
         \uut_tx/n24 , \uut_tx/n22 , \uut_tx/n19 , \uut_tx/n18 , \uut_tx/n17 ,
         \uut_tx/n16 , \uut_tx/n15 , \uut_tx/n14 , \uut_tx/n13 , \uut_tx/n12 ,
         \uut_tx/n11 , \uut_tx/n9 , \uut_tx/N82 , \uut_tx/N80 , \uut_tx/N76 ,
         \uut_tx/N68 , \uut_tx/N67 , \uut_tx/N55 , \uut_tx/count_8_indication ,
         \uut_tx/N37 , \uut_tx/count_16_indication , \uut_rx/n91 ,
         \uut_rx/n90 , \uut_rx/n89 , \uut_rx/n88 , \uut_rx/n87 , \uut_rx/n86 ,
         \uut_rx/n85 , \uut_rx/n84 , \uut_rx/n83 , \uut_rx/n82 , \uut_rx/n81 ,
         \uut_rx/n80 , \uut_rx/n79 , \uut_rx/n78 , \uut_rx/n77 , \uut_rx/n76 ,
         \uut_rx/n75 , \uut_rx/n74 , \uut_rx/n67 , \uut_rx/n66 , \uut_rx/n65 ,
         \uut_rx/n64 , \uut_rx/n63 , \uut_rx/n62 , \uut_rx/n61 , \uut_rx/n60 ,
         \uut_rx/n59 , \uut_rx/n58 , \uut_rx/n57 , \uut_rx/n56 , \uut_rx/n55 ,
         \uut_rx/n54 , \uut_rx/n53 , \uut_rx/n52 , \uut_rx/n51 , \uut_rx/n50 ,
         \uut_rx/n49 , \uut_rx/n48 , \uut_rx/n47 , \uut_rx/n46 , \uut_rx/n45 ,
         \uut_rx/n44 , \uut_rx/n43 , \uut_rx/n42 , \uut_rx/n41 , \uut_rx/n40 ,
         \uut_rx/n39 , \uut_rx/n38 , \uut_rx/n37 , \uut_rx/n36 , \uut_rx/n35 ,
         \uut_rx/n34 , \uut_rx/n33 , \uut_rx/n32 , \uut_rx/n31 , \uut_rx/n30 ,
         \uut_rx/n29 , \uut_rx/n28 , \uut_rx/n27 , \uut_rx/n25 , \uut_rx/n23 ,
         \uut_rx/n22 , \uut_rx/n20 , \uut_rx/n19 , \uut_rx/n17 , \uut_rx/n16 ,
         \uut_rx/n14 , \uut_rx/n13 , \uut_rx/n12 , \uut_rx/n11 , \uut_rx/n10 ,
         \uut_rx/n9 , \uut_rx/n8 , \uut_rx/n7 , \uut_rx/n6 , \uut_rx/n5 ,
         \uut_rx/n4 , \uut_rx/n3 , \uut_rx/n2 , \uut_rx/n1 , \uut_rx/n73 ,
         \uut_rx/n72 , \uut_rx/n71 , \uut_rx/n70 , \uut_rx/n69 , \uut_rx/n68 ,
         \uut_rx/n26 , \uut_rx/n24 , \uut_rx/n21 , \uut_rx/n18 , \uut_rx/n15 ,
         \uut_rx/N102 , \uut_rx/N100 , \uut_rx/N88 , \uut_rx/N87 ,
         \uut_rx/N86 , \uut_rx/N67 , \uut_rx/count_8_indication , \uut_rx/N48 ,
         \uut_rx/count_16_indication ;
  wire   [31:0] baud_division;
  wire   [7:0] data_out;
  wire   [7:0] data_in;
  wire   [31:0] \uut_baud_rate/baud_count ;
  wire   [1:0] \uut_tx/next_state ;
  wire   [7:0] \uut_tx/data_save ;
  wire   [2:0] \uut_tx/count_8 ;
  wire   [3:0] \uut_tx/count_16 ;
  wire   [1:0] \uut_tx/current_state ;
  wire   [1:0] \uut_rx/next_state ;
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
  OAI21_X1 \uut_baud_rate/U93  ( .B1(\uut_baud_rate/n92 ), .B2(
        \uut_baud_rate/n91 ), .A(\uut_baud_rate/n90 ), .ZN(\uut_baud_rate/n25 ) );
  NAND3_X1 \uut_baud_rate/U92  ( .A1(\uut_baud_rate/n49 ), .A2(
        \uut_baud_rate/n92 ), .A3(\uut_baud_rate/n89 ), .ZN(
        \uut_baud_rate/n90 ) );
  AND2_X1 \uut_baud_rate/U91  ( .A1(\uut_baud_rate/N43 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N108 ) );
  NAND2_X1 \uut_baud_rate/U90  ( .A1(\uut_baud_rate/n88 ), .A2(
        \uut_baud_rate/n92 ), .ZN(\uut_baud_rate/n93 ) );
  NAND2_X1 \uut_baud_rate/U89  ( .A1(\uut_baud_rate/n89 ), .A2(
        \uut_baud_rate/n86 ), .ZN(\uut_baud_rate/n92 ) );
  INV_X1 \uut_baud_rate/U88  ( .A(\uut_baud_rate/n85 ), .ZN(
        \uut_baud_rate/n86 ) );
  AND2_X1 \uut_baud_rate/U87  ( .A1(\uut_baud_rate/N13 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N78 ) );
  AND2_X1 \uut_baud_rate/U86  ( .A1(\uut_baud_rate/N16 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N81 ) );
  AND2_X1 \uut_baud_rate/U85  ( .A1(\uut_baud_rate/N17 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N82 ) );
  AND2_X1 \uut_baud_rate/U84  ( .A1(\uut_baud_rate/N18 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N83 ) );
  AND2_X1 \uut_baud_rate/U83  ( .A1(\uut_baud_rate/N19 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N84 ) );
  AND2_X1 \uut_baud_rate/U82  ( .A1(\uut_baud_rate/N21 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N86 ) );
  AND2_X1 \uut_baud_rate/U81  ( .A1(\uut_baud_rate/N22 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N87 ) );
  AND2_X1 \uut_baud_rate/U80  ( .A1(\uut_baud_rate/N24 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N89 ) );
  AND2_X1 \uut_baud_rate/U79  ( .A1(\uut_baud_rate/N25 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N90 ) );
  AND2_X1 \uut_baud_rate/U78  ( .A1(\uut_baud_rate/N26 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N91 ) );
  AND2_X1 \uut_baud_rate/U77  ( .A1(\uut_baud_rate/N27 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N92 ) );
  AND2_X1 \uut_baud_rate/U76  ( .A1(\uut_baud_rate/N28 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N93 ) );
  AND2_X1 \uut_baud_rate/U75  ( .A1(\uut_baud_rate/N29 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N94 ) );
  AND2_X1 \uut_baud_rate/U74  ( .A1(\uut_baud_rate/N31 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N96 ) );
  AND2_X1 \uut_baud_rate/U73  ( .A1(\uut_baud_rate/N32 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N97 ) );
  AND2_X1 \uut_baud_rate/U72  ( .A1(\uut_baud_rate/n9 ), .A2(
        \uut_baud_rate/N33 ), .ZN(\uut_baud_rate/N98 ) );
  AND2_X1 \uut_baud_rate/U71  ( .A1(\uut_baud_rate/N35 ), .A2(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/N100 ) );
  AND2_X1 \uut_baud_rate/U70  ( .A1(\uut_baud_rate/N36 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N101 ) );
  AND2_X1 \uut_baud_rate/U69  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/N37 ), .ZN(\uut_baud_rate/N102 ) );
  AND2_X1 \uut_baud_rate/U68  ( .A1(\uut_baud_rate/N38 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N103 ) );
  AND2_X1 \uut_baud_rate/U67  ( .A1(\uut_baud_rate/N39 ), .A2(
        \uut_baud_rate/n43 ), .ZN(\uut_baud_rate/N104 ) );
  AND2_X1 \uut_baud_rate/U66  ( .A1(\uut_baud_rate/n44 ), .A2(
        \uut_baud_rate/N40 ), .ZN(\uut_baud_rate/N105 ) );
  AND2_X1 \uut_baud_rate/U65  ( .A1(\uut_baud_rate/N41 ), .A2(
        \uut_baud_rate/n43 ), .ZN(\uut_baud_rate/N106 ) );
  AND2_X1 \uut_baud_rate/U64  ( .A1(\uut_baud_rate/N42 ), .A2(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/N107 ) );
  INV_X1 \uut_baud_rate/U63  ( .A(\uut_baud_rate/baud_count_at_max ), .ZN(
        \uut_baud_rate/n87 ) );
  INV_X1 \uut_baud_rate/U62  ( .A(\uut_baud_rate/n83 ), .ZN(
        \uut_baud_rate/n89 ) );
  OAI21_X1 \uut_baud_rate/U61  ( .B1(\uut_baud_rate/n82 ), .B2(
        \uut_baud_rate/n81 ), .A(\uut_baud_rate/n80 ), .ZN(\uut_baud_rate/n83 ) );
  NAND4_X1 \uut_baud_rate/U60  ( .A1(\uut_baud_rate/n19 ), .A2(
        \uut_baud_rate/n20 ), .A3(\uut_baud_rate/n17 ), .A4(
        \uut_baud_rate/n18 ), .ZN(\uut_baud_rate/n81 ) );
  NAND4_X1 \uut_baud_rate/U59  ( .A1(\uut_baud_rate/n23 ), .A2(
        \uut_baud_rate/n24 ), .A3(\uut_baud_rate/n21 ), .A4(
        \uut_baud_rate/n22 ), .ZN(\uut_baud_rate/n82 ) );
  AND2_X1 \uut_baud_rate/U58  ( .A1(\uut_baud_rate/temp_en ), .A2(
        \uut_baud_rate/n80 ), .ZN(\uut_baud_rate/n26 ) );
  INV_X1 \uut_baud_rate/U57  ( .A(rst), .ZN(\uut_baud_rate/n80 ) );
  NOR2_X1 \uut_baud_rate/U56  ( .A1(rst), .A2(\uut_baud_rate/n84 ), .ZN(
        \uut_baud_rate/n27 ) );
  INV_X1 \uut_baud_rate/U55  ( .A(enable), .ZN(\uut_baud_rate/n84 ) );
  INV_X2 \uut_baud_rate/U54  ( .A(\uut_baud_rate/n70 ), .ZN(
        \uut_baud_rate/n71 ) );
  INV_X2 \uut_baud_rate/U53  ( .A(\uut_baud_rate/n68 ), .ZN(
        \uut_baud_rate/n69 ) );
  INV_X2 \uut_baud_rate/U52  ( .A(\uut_baud_rate/n66 ), .ZN(
        \uut_baud_rate/n67 ) );
  INV_X2 \uut_baud_rate/U51  ( .A(\uut_baud_rate/n62 ), .ZN(
        \uut_baud_rate/n63 ) );
  INV_X2 \uut_baud_rate/U50  ( .A(\uut_baud_rate/n60 ), .ZN(
        \uut_baud_rate/n61 ) );
  INV_X2 \uut_baud_rate/U49  ( .A(\uut_baud_rate/n58 ), .ZN(
        \uut_baud_rate/n59 ) );
  INV_X2 \uut_baud_rate/U48  ( .A(\uut_baud_rate/n56 ), .ZN(
        \uut_baud_rate/n57 ) );
  INV_X2 \uut_baud_rate/U47  ( .A(\uut_baud_rate/n54 ), .ZN(
        \uut_baud_rate/n55 ) );
  INV_X2 \uut_baud_rate/U46  ( .A(\uut_baud_rate/n50 ), .ZN(
        \uut_baud_rate/n51 ) );
  INV_X1 \uut_baud_rate/U45  ( .A(\uut_baud_rate/n87 ), .ZN(
        \uut_baud_rate/n49 ) );
  INV_X1 \uut_baud_rate/U44  ( .A(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/n48 ) );
  INV_X1 \uut_baud_rate/U43  ( .A(\uut_baud_rate/n45 ), .ZN(
        \uut_baud_rate/n46 ) );
  INV_X1 \uut_baud_rate/U42  ( .A(\uut_baud_rate/n41 ), .ZN(
        \uut_baud_rate/n42 ) );
  INV_X1 \uut_baud_rate/U41  ( .A(\uut_baud_rate/n39 ), .ZN(
        \uut_baud_rate/n40 ) );
  INV_X1 \uut_baud_rate/U40  ( .A(\uut_baud_rate/n37 ), .ZN(
        \uut_baud_rate/n38 ) );
  INV_X1 \uut_baud_rate/U39  ( .A(\uut_baud_rate/n35 ), .ZN(
        \uut_baud_rate/n36 ) );
  INV_X1 \uut_baud_rate/U38  ( .A(\uut_baud_rate/n33 ), .ZN(
        \uut_baud_rate/n34 ) );
  INV_X1 \uut_baud_rate/U37  ( .A(\uut_baud_rate/n31 ), .ZN(
        \uut_baud_rate/n32 ) );
  INV_X1 \uut_baud_rate/U36  ( .A(\uut_baud_rate/n76 ), .ZN(
        \uut_baud_rate/n79 ) );
  INV_X1 \uut_baud_rate/U35  ( .A(\uut_baud_rate/n77 ), .ZN(
        \uut_baud_rate/n78 ) );
  NOR4_X1 \uut_baud_rate/U28  ( .A1(baud_division[5]), .A2(baud_division[4]), 
        .A3(baud_division[3]), .A4(baud_division[31]), .ZN(\uut_baud_rate/n23 ) );
  NOR4_X1 \uut_baud_rate/U27  ( .A1(baud_division[9]), .A2(baud_division[8]), 
        .A3(baud_division[7]), .A4(baud_division[6]), .ZN(\uut_baud_rate/n24 )
         );
  NOR4_X1 \uut_baud_rate/U26  ( .A1(baud_division[23]), .A2(baud_division[22]), 
        .A3(baud_division[21]), .A4(baud_division[20]), .ZN(
        \uut_baud_rate/n20 ) );
  NOR4_X1 \uut_baud_rate/U25  ( .A1(baud_division[27]), .A2(baud_division[26]), 
        .A3(baud_division[25]), .A4(baud_division[24]), .ZN(
        \uut_baud_rate/n21 ) );
  NOR4_X1 \uut_baud_rate/U24  ( .A1(baud_division[12]), .A2(baud_division[11]), 
        .A3(baud_division[10]), .A4(baud_division[0]), .ZN(\uut_baud_rate/n17 ) );
  NOR4_X1 \uut_baud_rate/U23  ( .A1(baud_division[30]), .A2(baud_division[2]), 
        .A3(baud_division[29]), .A4(baud_division[28]), .ZN(
        \uut_baud_rate/n22 ) );
  NOR4_X1 \uut_baud_rate/U22  ( .A1(baud_division[16]), .A2(baud_division[15]), 
        .A3(baud_division[14]), .A4(baud_division[13]), .ZN(
        \uut_baud_rate/n18 ) );
  NOR4_X1 \uut_baud_rate/U21  ( .A1(baud_division[1]), .A2(baud_division[19]), 
        .A3(baud_division[18]), .A4(baud_division[17]), .ZN(
        \uut_baud_rate/n19 ) );
  NAND2_X1 \uut_baud_rate/U20  ( .A1(\uut_baud_rate/n13 ), .A2(enable), .ZN(
        \uut_baud_rate/n85 ) );
  INV_X1 \uut_baud_rate/U19  ( .A(\uut_baud_rate/n52 ), .ZN(
        \uut_baud_rate/n53 ) );
  AND2_X2 \uut_baud_rate/U18  ( .A1(\uut_baud_rate/n89 ), .A2(
        \uut_baud_rate/n85 ), .ZN(\uut_baud_rate/n12 ) );
  AND2_X1 \uut_baud_rate/U17  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n12 ), .ZN(\uut_baud_rate/n44 ) );
  AND2_X1 \uut_baud_rate/U16  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n12 ), .ZN(\uut_baud_rate/n43 ) );
  AND2_X1 \uut_baud_rate/U15  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n12 ), .ZN(\uut_baud_rate/n10 ) );
  AND2_X1 \uut_baud_rate/U14  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n12 ), .ZN(\uut_baud_rate/n9 ) );
  CLKBUF_X3 \uut_baud_rate/U13  ( .A(\uut_baud_rate/baud_count [18]), .Z(
        \uut_baud_rate/n8 ) );
  CLKBUF_X3 \uut_baud_rate/U12  ( .A(\uut_baud_rate/baud_count [22]), .Z(
        \uut_baud_rate/n7 ) );
  INV_X1 \uut_baud_rate/U11  ( .A(\uut_baud_rate/n72 ), .ZN(
        \uut_baud_rate/n73 ) );
  NAND2_X1 \uut_baud_rate/U10  ( .A1(\uut_baud_rate/N12 ), .A2(
        \uut_baud_rate/n12 ), .ZN(\uut_baud_rate/n6 ) );
  INV_X1 \uut_baud_rate/U9  ( .A(\uut_baud_rate/n64 ), .ZN(\uut_baud_rate/n65 ) );
  OR2_X1 \uut_baud_rate/U8  ( .A1(\uut_baud_rate/n49 ), .A2(\uut_baud_rate/n6 ), .ZN(\uut_baud_rate/n88 ) );
  INV_X1 \uut_baud_rate/U7  ( .A(\uut_baud_rate/n4 ), .ZN(\uut_baud_rate/n5 )
         );
  INV_X1 \uut_baud_rate/U6  ( .A(\uut_baud_rate/n2 ), .ZN(\uut_baud_rate/n3 )
         );
  INV_X4 \uut_baud_rate/U4  ( .A(\uut_baud_rate/n74 ), .ZN(\uut_baud_rate/n75 ) );
  BUF_X4 \uut_baud_rate/U3  ( .A(\uut_baud_rate/baud_count [11]), .Z(
        \uut_baud_rate/n11 ) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[22]  ( .D(1'b0), .SI(
        \uut_baud_rate/n44 ), .SE(\uut_baud_rate/N34 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [22]) );
  DFF_X2 \uut_baud_rate/baud_tick_reg  ( .D(\uut_baud_rate/n25 ), .CK(clk), 
        .Q(baud_tick), .QN(\uut_baud_rate/n91 ) );
  SDFF_X1 \uut_baud_rate/baud_count_reg[11]  ( .D(1'b0), .SI(
        \uut_baud_rate/n43 ), .SE(\uut_baud_rate/N23 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [11]) );
  SDFF_X1 \uut_baud_rate/baud_count_reg[3]  ( .D(1'b0), .SI(
        \uut_baud_rate/n43 ), .SE(\uut_baud_rate/N15 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [3]) );
  SDFF_X1 \uut_baud_rate/baud_count_reg[18]  ( .D(1'b0), .SI(
        \uut_baud_rate/N30 ), .SE(\uut_baud_rate/n44 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [18]) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[8]  ( .D(1'b0), .SI(
        \uut_baud_rate/n44 ), .SE(\uut_baud_rate/N20 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [8]) );
  SDFF_X2 \uut_baud_rate/baud_count_reg[2]  ( .D(1'b0), .SI(
        \uut_baud_rate/n44 ), .SE(\uut_baud_rate/N14 ), .CK(clk), .Q(
        \uut_baud_rate/baud_count [2]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[5]  ( .D(\uut_baud_rate/N82 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [5]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[4]  ( .D(\uut_baud_rate/N81 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [4]), .QN(\uut_baud_rate/n4 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[6]  ( .D(\uut_baud_rate/N83 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [6]), .QN(\uut_baud_rate/n2 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[19]  ( .D(\uut_baud_rate/N96 ), .CK(clk), .Q(\uut_baud_rate/baud_count [19]), .QN(\uut_baud_rate/n60 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[13]  ( .D(\uut_baud_rate/N90 ), .CK(clk), .Q(\uut_baud_rate/baud_count [13]), .QN(\uut_baud_rate/n62 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[15]  ( .D(\uut_baud_rate/N92 ), .CK(clk), .Q(\uut_baud_rate/baud_count [15]), .QN(\uut_baud_rate/n64 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[16]  ( .D(\uut_baud_rate/N93 ), .CK(clk), .Q(\uut_baud_rate/baud_count [16]), .QN(\uut_baud_rate/n68 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[23]  ( .D(\uut_baud_rate/N100 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [23]), .QN(\uut_baud_rate/n56 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[24]  ( .D(\uut_baud_rate/N101 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [24]), .QN(\uut_baud_rate/n54 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[25]  ( .D(\uut_baud_rate/N102 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [25]), .QN(\uut_baud_rate/n50 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[26]  ( .D(\uut_baud_rate/N103 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [26]), .QN(\uut_baud_rate/n52 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[27]  ( .D(\uut_baud_rate/N104 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [27]), .QN(\uut_baud_rate/n47 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[28]  ( .D(\uut_baud_rate/N105 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [28]), .QN(\uut_baud_rate/n45 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[29]  ( .D(\uut_baud_rate/N106 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [29]), .QN(\uut_baud_rate/n39 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[30]  ( .D(\uut_baud_rate/N107 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [30]), .QN(\uut_baud_rate/n41 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[1]  ( .D(\uut_baud_rate/N78 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [1]), .QN(\uut_baud_rate/n76 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[7]  ( .D(\uut_baud_rate/N84 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [7]), .QN(\uut_baud_rate/n33 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[9]  ( .D(\uut_baud_rate/N86 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [9]), .QN(\uut_baud_rate/n37 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[10]  ( .D(\uut_baud_rate/N87 ), .CK(clk), .Q(\uut_baud_rate/baud_count [10]), .QN(\uut_baud_rate/n77 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[12]  ( .D(\uut_baud_rate/N89 ), .CK(clk), .Q(\uut_baud_rate/baud_count [12]), .QN(\uut_baud_rate/n74 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[14]  ( .D(\uut_baud_rate/N91 ), .CK(clk), .Q(\uut_baud_rate/baud_count [14]), .QN(\uut_baud_rate/n72 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[17]  ( .D(\uut_baud_rate/N94 ), .CK(clk), .Q(\uut_baud_rate/baud_count [17]), .QN(\uut_baud_rate/n70 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[20]  ( .D(\uut_baud_rate/N97 ), .CK(clk), .Q(\uut_baud_rate/baud_count [20]), .QN(\uut_baud_rate/n66 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[21]  ( .D(\uut_baud_rate/N98 ), .CK(clk), .Q(\uut_baud_rate/baud_count [21]), .QN(\uut_baud_rate/n58 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[31]  ( .D(\uut_baud_rate/N108 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [31]), .QN(\uut_baud_rate/n35 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[0]  ( .D(\uut_baud_rate/n93 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [0]), .QN(\uut_baud_rate/n31 ) );
  DFF_X1 \uut_baud_rate/delayed_en_reg  ( .D(\uut_baud_rate/n26 ), .CK(clk), 
        .QN(\uut_baud_rate/n13 ) );
  DFF_X1 \uut_baud_rate/temp_en_reg  ( .D(\uut_baud_rate/n27 ), .CK(clk), .Q(
        \uut_baud_rate/temp_en ) );
  NAND3_X1 \uut_baud_rate/add_165/U342  ( .A1(\uut_baud_rate/add_165/n39 ), 
        .A2(\uut_baud_rate/add_165/n3 ), .A3(\uut_baud_rate/add_165/n9 ), .ZN(
        \uut_baud_rate/add_165/n310 ) );
  NAND3_X1 \uut_baud_rate/add_165/U341  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n47 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n308 ) );
  NAND3_X1 \uut_baud_rate/add_165/U340  ( .A1(\uut_baud_rate/add_165/n9 ), 
        .A2(\uut_baud_rate/add_165/n57 ), .A3(\uut_baud_rate/add_165/n27 ), 
        .ZN(\uut_baud_rate/add_165/n303 ) );
  NAND3_X1 \uut_baud_rate/add_165/U339  ( .A1(\uut_baud_rate/add_165/n49 ), 
        .A2(\uut_baud_rate/add_165/n47 ), .A3(\uut_baud_rate/add_165/n35 ), 
        .ZN(\uut_baud_rate/add_165/n302 ) );
  NAND3_X1 \uut_baud_rate/add_165/U338  ( .A1(\uut_baud_rate/add_165/n39 ), 
        .A2(\uut_baud_rate/add_165/n16 ), .A3(\uut_baud_rate/add_165/n33 ), 
        .ZN(\uut_baud_rate/add_165/n298 ) );
  NAND3_X1 \uut_baud_rate/add_165/U337  ( .A1(\uut_baud_rate/add_165/n50 ), 
        .A2(\uut_baud_rate/add_165/n47 ), .A3(\uut_baud_rate/add_165/n35 ), 
        .ZN(\uut_baud_rate/add_165/n296 ) );
  NAND3_X1 \uut_baud_rate/add_165/U336  ( .A1(\uut_baud_rate/add_165/n52 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n297 ) );
  NAND2_X1 \uut_baud_rate/add_165/U335  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n29 ), .ZN(\uut_baud_rate/add_165/n291 ) );
  NAND2_X1 \uut_baud_rate/add_165/U334  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .ZN(\uut_baud_rate/add_165/n292 ) );
  NAND4_X1 \uut_baud_rate/add_165/U333  ( .A1(\uut_baud_rate/add_165/n287 ), 
        .A2(\uut_baud_rate/add_165/n288 ), .A3(\uut_baud_rate/add_165/n289 ), 
        .A4(\uut_baud_rate/add_165/n290 ), .ZN(\uut_baud_rate/add_165/n286 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U332  ( .A(\uut_baud_rate/add_165/n286 ), 
        .B(\uut_baud_rate/n63 ), .ZN(\uut_baud_rate/N25 ) );
  NAND2_X1 \uut_baud_rate/add_165/U331  ( .A1(\uut_baud_rate/add_165/n39 ), 
        .A2(\uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/add_165/n284 ) );
  NAND2_X1 \uut_baud_rate/add_165/U330  ( .A1(\uut_baud_rate/add_165/n27 ), 
        .A2(\uut_baud_rate/add_165/n8 ), .ZN(\uut_baud_rate/add_165/n285 ) );
  NAND2_X1 \uut_baud_rate/add_165/U329  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n29 ), .ZN(\uut_baud_rate/add_165/n282 ) );
  NAND2_X1 \uut_baud_rate/add_165/U328  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .ZN(\uut_baud_rate/add_165/n283 ) );
  NAND4_X1 \uut_baud_rate/add_165/U327  ( .A1(\uut_baud_rate/add_165/n278 ), 
        .A2(\uut_baud_rate/add_165/n279 ), .A3(\uut_baud_rate/add_165/n280 ), 
        .A4(\uut_baud_rate/add_165/n281 ), .ZN(\uut_baud_rate/add_165/n277 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U326  ( .A(\uut_baud_rate/add_165/n277 ), 
        .B(\uut_baud_rate/add_165/n12 ), .ZN(\uut_baud_rate/N26 ) );
  NAND2_X1 \uut_baud_rate/add_165/U325  ( .A1(\uut_baud_rate/add_165/n9 ), 
        .A2(\uut_baud_rate/add_165/n39 ), .ZN(\uut_baud_rate/add_165/n275 ) );
  NAND2_X1 \uut_baud_rate/add_165/U324  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/add_165/n27 ), .ZN(\uut_baud_rate/add_165/n276 ) );
  NAND2_X1 \uut_baud_rate/add_165/U323  ( .A1(\uut_baud_rate/add_165/n54 ), 
        .A2(\uut_baud_rate/add_165/n31 ), .ZN(\uut_baud_rate/add_165/n274 ) );
  NAND2_X1 \uut_baud_rate/add_165/U322  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n30 ), .ZN(\uut_baud_rate/add_165/n272 ) );
  NAND2_X1 \uut_baud_rate/add_165/U321  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n50 ), .ZN(\uut_baud_rate/add_165/n273 ) );
  NAND4_X1 \uut_baud_rate/add_165/U320  ( .A1(\uut_baud_rate/add_165/n270 ), 
        .A2(\uut_baud_rate/add_165/n269 ), .A3(\uut_baud_rate/add_165/n268 ), 
        .A4(\uut_baud_rate/add_165/n271 ), .ZN(\uut_baud_rate/add_165/n267 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U319  ( .A(\uut_baud_rate/add_165/n267 ), 
        .B(\uut_baud_rate/add_165/n10 ), .ZN(\uut_baud_rate/N27 ) );
  NAND2_X1 \uut_baud_rate/add_165/U318  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/n75 ), .ZN(\uut_baud_rate/add_165/n265 ) );
  NAND2_X1 \uut_baud_rate/add_165/U317  ( .A1(\uut_baud_rate/add_165/n10 ), 
        .A2(\uut_baud_rate/add_165/n12 ), .ZN(\uut_baud_rate/add_165/n266 ) );
  NAND2_X1 \uut_baud_rate/add_165/U316  ( .A1(\uut_baud_rate/add_165/n9 ), 
        .A2(\uut_baud_rate/add_165/n60 ), .ZN(\uut_baud_rate/add_165/n263 ) );
  NAND2_X1 \uut_baud_rate/add_165/U315  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/add_165/n28 ), .ZN(\uut_baud_rate/add_165/n264 ) );
  NAND2_X1 \uut_baud_rate/add_165/U314  ( .A1(\uut_baud_rate/add_165/n54 ), 
        .A2(\uut_baud_rate/add_165/n31 ), .ZN(\uut_baud_rate/add_165/n261 ) );
  NAND2_X1 \uut_baud_rate/add_165/U313  ( .A1(\uut_baud_rate/add_165/n34 ), 
        .A2(\uut_baud_rate/add_165/n16 ), .ZN(\uut_baud_rate/add_165/n262 ) );
  NAND2_X1 \uut_baud_rate/add_165/U312  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n30 ), .ZN(\uut_baud_rate/add_165/n259 ) );
  NAND2_X1 \uut_baud_rate/add_165/U311  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n50 ), .ZN(\uut_baud_rate/add_165/n260 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U310  ( .A(\uut_baud_rate/add_165/n254 ), 
        .B(\uut_baud_rate/n69 ), .ZN(\uut_baud_rate/N28 ) );
  NAND4_X1 \uut_baud_rate/add_165/U309  ( .A1(\uut_baud_rate/n75 ), .A2(
        \uut_baud_rate/n11 ), .A3(\uut_baud_rate/add_165/n27 ), .A4(
        \uut_baud_rate/add_165/n9 ), .ZN(\uut_baud_rate/add_165/n252 ) );
  NAND4_X1 \uut_baud_rate/add_165/U308  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/add_165/n10 ), .A3(\uut_baud_rate/add_165/n13 ), .A4(
        \uut_baud_rate/n63 ), .ZN(\uut_baud_rate/add_165/n253 ) );
  NOR2_X1 \uut_baud_rate/add_165/U307  ( .A1(\uut_baud_rate/add_165/n252 ), 
        .A2(\uut_baud_rate/add_165/n253 ), .ZN(\uut_baud_rate/add_165/n248 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U306  ( .A1(\uut_baud_rate/add_165/n39 ), 
        .A2(\uut_baud_rate/add_165/n34 ), .A3(\uut_baud_rate/add_165/n57 ), 
        .A4(\uut_baud_rate/add_165/n54 ), .ZN(\uut_baud_rate/add_165/n250 ) );
  NAND2_X1 \uut_baud_rate/add_165/U305  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .ZN(\uut_baud_rate/add_165/n251 ) );
  NOR2_X1 \uut_baud_rate/add_165/U304  ( .A1(\uut_baud_rate/add_165/n250 ), 
        .A2(\uut_baud_rate/add_165/n251 ), .ZN(\uut_baud_rate/add_165/n249 )
         );
  NAND3_X1 \uut_baud_rate/add_165/U303  ( .A1(\uut_baud_rate/add_165/n247 ), 
        .A2(\uut_baud_rate/add_165/n248 ), .A3(\uut_baud_rate/add_165/n249 ), 
        .ZN(\uut_baud_rate/add_165/n246 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U302  ( .A(\uut_baud_rate/add_165/n246 ), 
        .B(\uut_baud_rate/n71 ), .ZN(\uut_baud_rate/N29 ) );
  NAND3_X1 \uut_baud_rate/add_165/U301  ( .A1(\uut_baud_rate/add_165/n243 ), 
        .A2(\uut_baud_rate/add_165/n244 ), .A3(\uut_baud_rate/add_165/n245 ), 
        .ZN(\uut_baud_rate/add_165/n241 ) );
  NAND3_X1 \uut_baud_rate/add_165/U300  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/n75 ), .A3(\uut_baud_rate/add_165/n8 ), .ZN(
        \uut_baud_rate/add_165/n242 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U299  ( .A(\uut_baud_rate/add_165/n236 ), 
        .B(\uut_baud_rate/n8 ), .ZN(\uut_baud_rate/N30 ) );
  NAND2_X1 \uut_baud_rate/add_165/U298  ( .A1(\uut_baud_rate/add_165/n58 ), 
        .A2(\uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/add_165/n235 ) );
  NAND3_X1 \uut_baud_rate/add_165/U297  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n8 ), .A3(\uut_baud_rate/add_165/n11 ), .ZN(
        \uut_baud_rate/add_165/n232 ) );
  NAND2_X1 \uut_baud_rate/add_165/U296  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_165/n233 ) );
  NAND3_X1 \uut_baud_rate/add_165/U295  ( .A1(\uut_baud_rate/add_165/n12 ), 
        .A2(\uut_baud_rate/n63 ), .A3(\uut_baud_rate/add_165/n27 ), .ZN(
        \uut_baud_rate/add_165/n230 ) );
  NAND2_X1 \uut_baud_rate/add_165/U294  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/n75 ), .ZN(\uut_baud_rate/add_165/n231 ) );
  NAND3_X1 \uut_baud_rate/add_165/U293  ( .A1(\uut_baud_rate/add_165/n9 ), 
        .A2(\uut_baud_rate/add_165/n39 ), .A3(\uut_baud_rate/add_165/n53 ), 
        .ZN(\uut_baud_rate/add_165/n228 ) );
  NAND2_X1 \uut_baud_rate/add_165/U292  ( .A1(\uut_baud_rate/add_165/n58 ), 
        .A2(\uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/add_165/n229 ) );
  NAND3_X1 \uut_baud_rate/add_165/U291  ( .A1(\uut_baud_rate/add_165/n32 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n29 ), 
        .ZN(\uut_baud_rate/add_165/n226 ) );
  NAND2_X1 \uut_baud_rate/add_165/U290  ( .A1(\uut_baud_rate/add_165/n35 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .ZN(\uut_baud_rate/add_165/n227 ) );
  NAND4_X1 \uut_baud_rate/add_165/U289  ( .A1(\uut_baud_rate/add_165/n222 ), 
        .A2(\uut_baud_rate/add_165/n223 ), .A3(\uut_baud_rate/add_165/n224 ), 
        .A4(\uut_baud_rate/add_165/n225 ), .ZN(\uut_baud_rate/add_165/n221 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U288  ( .A(\uut_baud_rate/add_165/n221 ), 
        .B(\uut_baud_rate/n67 ), .ZN(\uut_baud_rate/N32 ) );
  NAND3_X1 \uut_baud_rate/add_165/U287  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n69 ), .A3(\uut_baud_rate/n67 ), .ZN(
        \uut_baud_rate/add_165/n219 ) );
  NAND3_X1 \uut_baud_rate/add_165/U286  ( .A1(\uut_baud_rate/add_165/n13 ), 
        .A2(\uut_baud_rate/n11 ), .A3(\uut_baud_rate/add_165/n11 ), .ZN(
        \uut_baud_rate/add_165/n217 ) );
  NAND3_X1 \uut_baud_rate/add_165/U285  ( .A1(\uut_baud_rate/add_165/n8 ), 
        .A2(\uut_baud_rate/add_165/n57 ), .A3(\uut_baud_rate/add_165/n27 ), 
        .ZN(\uut_baud_rate/add_165/n215 ) );
  NAND3_X1 \uut_baud_rate/add_165/U284  ( .A1(\uut_baud_rate/add_165/n53 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n214 ) );
  NAND3_X1 \uut_baud_rate/add_165/U283  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n59 ), .ZN(
        \uut_baud_rate/add_165/n207 ) );
  NAND3_X1 \uut_baud_rate/add_165/U282  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/n11 ), .A3(\uut_baud_rate/n75 ), .ZN(
        \uut_baud_rate/add_165/n205 ) );
  NAND3_X1 \uut_baud_rate/add_165/U281  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/add_165/n12 ), .A3(\uut_baud_rate/add_165/n11 ), .ZN(
        \uut_baud_rate/add_165/n206 ) );
  NAND3_X1 \uut_baud_rate/add_165/U280  ( .A1(\uut_baud_rate/add_165/n8 ), 
        .A2(\uut_baud_rate/add_165/n57 ), .A3(\uut_baud_rate/add_165/n28 ), 
        .ZN(\uut_baud_rate/add_165/n203 ) );
  NAND3_X1 \uut_baud_rate/add_165/U279  ( .A1(\uut_baud_rate/add_165/n49 ), 
        .A2(\uut_baud_rate/add_165/n29 ), .A3(\uut_baud_rate/add_165/n35 ), 
        .ZN(\uut_baud_rate/add_165/n201 ) );
  NAND3_X1 \uut_baud_rate/add_165/U278  ( .A1(\uut_baud_rate/add_165/n52 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n202 ) );
  NAND3_X1 \uut_baud_rate/add_165/U277  ( .A1(\uut_baud_rate/n59 ), .A2(
        \uut_baud_rate/n8 ), .A3(\uut_baud_rate/n7 ), .ZN(
        \uut_baud_rate/add_165/n194 ) );
  NAND3_X1 \uut_baud_rate/add_165/U276  ( .A1(\uut_baud_rate/add_165/n12 ), 
        .A2(\uut_baud_rate/n75 ), .A3(\uut_baud_rate/n63 ), .ZN(
        \uut_baud_rate/add_165/n192 ) );
  NAND3_X1 \uut_baud_rate/add_165/U275  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/add_165/n11 ), .A3(\uut_baud_rate/n69 ), .ZN(
        \uut_baud_rate/add_165/n193 ) );
  NAND3_X1 \uut_baud_rate/add_165/U274  ( .A1(\uut_baud_rate/add_165/n39 ), 
        .A2(\uut_baud_rate/add_165/n57 ), .A3(\uut_baud_rate/add_165/n33 ), 
        .ZN(\uut_baud_rate/add_165/n190 ) );
  NAND3_X1 \uut_baud_rate/add_165/U273  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/add_165/n8 ), .A3(\uut_baud_rate/add_165/n27 ), .ZN(
        \uut_baud_rate/add_165/n191 ) );
  NAND3_X1 \uut_baud_rate/add_165/U272  ( .A1(\uut_baud_rate/add_165/n49 ), 
        .A2(\uut_baud_rate/add_165/n47 ), .A3(\uut_baud_rate/add_165/n35 ), 
        .ZN(\uut_baud_rate/add_165/n188 ) );
  NAND3_X1 \uut_baud_rate/add_165/U271  ( .A1(\uut_baud_rate/add_165/n53 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n189 ) );
  NAND3_X1 \uut_baud_rate/add_165/U270  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n8 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_165/n181 ) );
  NAND3_X1 \uut_baud_rate/add_165/U269  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/n59 ), .A3(\uut_baud_rate/n7 ), .ZN(
        \uut_baud_rate/add_165/n182 ) );
  NAND3_X1 \uut_baud_rate/add_165/U268  ( .A1(\uut_baud_rate/add_165/n13 ), 
        .A2(\uut_baud_rate/n75 ), .A3(\uut_baud_rate/n63 ), .ZN(
        \uut_baud_rate/add_165/n179 ) );
  NAND3_X1 \uut_baud_rate/add_165/U267  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/add_165/n10 ), .A3(\uut_baud_rate/n69 ), .ZN(
        \uut_baud_rate/add_165/n180 ) );
  NAND3_X1 \uut_baud_rate/add_165/U266  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/add_165/n9 ), .A3(\uut_baud_rate/add_165/n28 ), .ZN(
        \uut_baud_rate/add_165/n178 ) );
  NAND3_X1 \uut_baud_rate/add_165/U265  ( .A1(\uut_baud_rate/add_165/n49 ), 
        .A2(\uut_baud_rate/add_165/n30 ), .A3(\uut_baud_rate/add_165/n35 ), 
        .ZN(\uut_baud_rate/add_165/n176 ) );
  NAND3_X1 \uut_baud_rate/add_165/U264  ( .A1(\uut_baud_rate/add_165/n53 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n177 ) );
  NAND3_X1 \uut_baud_rate/add_165/U263  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n59 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_165/n169 ) );
  NAND3_X1 \uut_baud_rate/add_165/U262  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/n55 ), .A3(\uut_baud_rate/n7 ), .ZN(
        \uut_baud_rate/add_165/n170 ) );
  NAND3_X1 \uut_baud_rate/add_165/U261  ( .A1(\uut_baud_rate/add_165/n13 ), 
        .A2(\uut_baud_rate/add_165/n11 ), .A3(\uut_baud_rate/n63 ), .ZN(
        \uut_baud_rate/add_165/n167 ) );
  NAND3_X1 \uut_baud_rate/add_165/U260  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n8 ), .A3(\uut_baud_rate/n69 ), .ZN(
        \uut_baud_rate/add_165/n168 ) );
  NAND3_X1 \uut_baud_rate/add_165/U259  ( .A1(\uut_baud_rate/add_165/n39 ), 
        .A2(\uut_baud_rate/add_165/n8 ), .A3(\uut_baud_rate/add_165/n33 ), 
        .ZN(\uut_baud_rate/add_165/n165 ) );
  NAND3_X1 \uut_baud_rate/add_165/U258  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/n75 ), .A3(\uut_baud_rate/add_165/n27 ), .ZN(
        \uut_baud_rate/add_165/n166 ) );
  NAND4_X1 \uut_baud_rate/add_165/U257  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .A3(\uut_baud_rate/add_165/n35 ), 
        .A4(\uut_baud_rate/add_165/n29 ), .ZN(\uut_baud_rate/add_165/n163 ) );
  NAND3_X1 \uut_baud_rate/add_165/U256  ( .A1(\uut_baud_rate/add_165/n52 ), 
        .A2(\uut_baud_rate/add_165/n57 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n164 ) );
  NOR2_X1 \uut_baud_rate/add_165/U255  ( .A1(\uut_baud_rate/add_165/n163 ), 
        .A2(\uut_baud_rate/add_165/n164 ), .ZN(\uut_baud_rate/add_165/n162 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U254  ( .A(\uut_baud_rate/add_165/n158 ), 
        .B(\uut_baud_rate/n51 ), .ZN(\uut_baud_rate/N37 ) );
  NAND3_X1 \uut_baud_rate/add_165/U253  ( .A1(\uut_baud_rate/n59 ), .A2(
        \uut_baud_rate/n7 ), .A3(\uut_baud_rate/n67 ), .ZN(
        \uut_baud_rate/add_165/n156 ) );
  NAND3_X1 \uut_baud_rate/add_165/U252  ( .A1(\uut_baud_rate/n55 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/n57 ), .ZN(
        \uut_baud_rate/add_165/n157 ) );
  NAND4_X1 \uut_baud_rate/add_165/U251  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/add_165/n11 ), .A3(\uut_baud_rate/add_165/n12 ), .A4(
        \uut_baud_rate/n63 ), .ZN(\uut_baud_rate/add_165/n154 ) );
  NAND3_X1 \uut_baud_rate/add_165/U250  ( .A1(\uut_baud_rate/n8 ), .A2(
        \uut_baud_rate/n61 ), .A3(\uut_baud_rate/n71 ), .ZN(
        \uut_baud_rate/add_165/n155 ) );
  NOR2_X1 \uut_baud_rate/add_165/U249  ( .A1(\uut_baud_rate/add_165/n154 ), 
        .A2(\uut_baud_rate/add_165/n155 ), .ZN(\uut_baud_rate/add_165/n150 )
         );
  NAND3_X1 \uut_baud_rate/add_165/U248  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/n75 ), .A3(\uut_baud_rate/add_165/n27 ), .ZN(
        \uut_baud_rate/add_165/n153 ) );
  NOR2_X1 \uut_baud_rate/add_165/U247  ( .A1(\uut_baud_rate/add_165/n163 ), 
        .A2(\uut_baud_rate/add_165/n129 ), .ZN(\uut_baud_rate/add_165/n152 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U246  ( .A1(\uut_baud_rate/add_165/n149 ), 
        .A2(\uut_baud_rate/add_165/n150 ), .A3(\uut_baud_rate/add_165/n151 ), 
        .A4(\uut_baud_rate/add_165/n152 ), .ZN(\uut_baud_rate/add_165/n148 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U245  ( .A(\uut_baud_rate/add_165/n148 ), 
        .B(\uut_baud_rate/n53 ), .ZN(\uut_baud_rate/N38 ) );
  NAND3_X1 \uut_baud_rate/add_165/U244  ( .A1(\uut_baud_rate/n7 ), .A2(
        \uut_baud_rate/n57 ), .A3(\uut_baud_rate/n59 ), .ZN(
        \uut_baud_rate/add_165/n146 ) );
  NAND3_X1 \uut_baud_rate/add_165/U243  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n53 ), .A3(\uut_baud_rate/n55 ), .ZN(
        \uut_baud_rate/add_165/n147 ) );
  NAND4_X1 \uut_baud_rate/add_165/U242  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n69 ), .A3(\uut_baud_rate/add_165/n10 ), .A4(
        \uut_baud_rate/add_165/n13 ), .ZN(\uut_baud_rate/add_165/n144 ) );
  NAND3_X1 \uut_baud_rate/add_165/U241  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n8 ), .ZN(
        \uut_baud_rate/add_165/n145 ) );
  NOR2_X1 \uut_baud_rate/add_165/U240  ( .A1(\uut_baud_rate/add_165/n144 ), 
        .A2(\uut_baud_rate/add_165/n145 ), .ZN(\uut_baud_rate/add_165/n138 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U239  ( .A1(\uut_baud_rate/add_165/n28 ), 
        .A2(\uut_baud_rate/add_165/n61 ), .A3(\uut_baud_rate/add_165/n60 ), 
        .A4(\uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/add_165/n142 ) );
  NAND3_X1 \uut_baud_rate/add_165/U238  ( .A1(\uut_baud_rate/n75 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/n11 ), .ZN(
        \uut_baud_rate/add_165/n143 ) );
  NOR2_X1 \uut_baud_rate/add_165/U237  ( .A1(\uut_baud_rate/add_165/n142 ), 
        .A2(\uut_baud_rate/add_165/n143 ), .ZN(\uut_baud_rate/add_165/n139 )
         );
  NAND3_X1 \uut_baud_rate/add_165/U236  ( .A1(\uut_baud_rate/add_165/n3 ), 
        .A2(\uut_baud_rate/add_165/n16 ), .A3(\uut_baud_rate/add_165/n31 ), 
        .ZN(\uut_baud_rate/add_165/n141 ) );
  NOR2_X1 \uut_baud_rate/add_165/U235  ( .A1(\uut_baud_rate/add_165/n85 ), 
        .A2(\uut_baud_rate/add_165/n141 ), .ZN(\uut_baud_rate/add_165/n140 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U234  ( .A(\uut_baud_rate/add_165/n136 ), 
        .B(\uut_baud_rate/n48 ), .ZN(\uut_baud_rate/N39 ) );
  NAND4_X1 \uut_baud_rate/add_165/U233  ( .A1(\uut_baud_rate/n55 ), .A2(
        \uut_baud_rate/n57 ), .A3(\uut_baud_rate/n7 ), .A4(\uut_baud_rate/n59 ), .ZN(\uut_baud_rate/add_165/n134 ) );
  NAND3_X1 \uut_baud_rate/add_165/U232  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/n48 ), .A3(\uut_baud_rate/n51 ), .ZN(
        \uut_baud_rate/add_165/n135 ) );
  NOR2_X1 \uut_baud_rate/add_165/U231  ( .A1(\uut_baud_rate/add_165/n134 ), 
        .A2(\uut_baud_rate/add_165/n135 ), .ZN(\uut_baud_rate/add_165/n125 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U230  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n69 ), .A3(\uut_baud_rate/add_165/n11 ), .A4(
        \uut_baud_rate/add_165/n12 ), .ZN(\uut_baud_rate/add_165/n132 ) );
  NAND3_X1 \uut_baud_rate/add_165/U229  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n8 ), .ZN(
        \uut_baud_rate/add_165/n133 ) );
  NOR2_X1 \uut_baud_rate/add_165/U228  ( .A1(\uut_baud_rate/add_165/n132 ), 
        .A2(\uut_baud_rate/add_165/n133 ), .ZN(\uut_baud_rate/add_165/n126 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U227  ( .A1(\uut_baud_rate/add_165/n28 ), 
        .A2(\uut_baud_rate/add_165/n61 ), .A3(\uut_baud_rate/add_165/n60 ), 
        .A4(\uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/add_165/n130 ) );
  NAND3_X1 \uut_baud_rate/add_165/U226  ( .A1(\uut_baud_rate/n75 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/n11 ), .ZN(
        \uut_baud_rate/add_165/n131 ) );
  NOR2_X1 \uut_baud_rate/add_165/U225  ( .A1(\uut_baud_rate/add_165/n130 ), 
        .A2(\uut_baud_rate/add_165/n131 ), .ZN(\uut_baud_rate/add_165/n127 )
         );
  NAND3_X1 \uut_baud_rate/add_165/U224  ( .A1(\uut_baud_rate/add_165/n53 ), 
        .A2(\uut_baud_rate/add_165/n58 ), .A3(\uut_baud_rate/add_165/n32 ), 
        .ZN(\uut_baud_rate/add_165/n129 ) );
  NOR2_X1 \uut_baud_rate/add_165/U223  ( .A1(\uut_baud_rate/add_165/n163 ), 
        .A2(\uut_baud_rate/add_165/n129 ), .ZN(\uut_baud_rate/add_165/n128 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U222  ( .A(\uut_baud_rate/add_165/n124 ), 
        .B(\uut_baud_rate/baud_count [28]), .ZN(\uut_baud_rate/N40 ) );
  NAND4_X1 \uut_baud_rate/add_165/U221  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n55 ), .A3(\uut_baud_rate/n57 ), .A4(\uut_baud_rate/n7 ), .ZN(\uut_baud_rate/add_165/n122 ) );
  NAND3_X1 \uut_baud_rate/add_165/U220  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/baud_count [28]), .A3(\uut_baud_rate/n53 ), .ZN(
        \uut_baud_rate/add_165/n123 ) );
  NOR2_X1 \uut_baud_rate/add_165/U219  ( .A1(\uut_baud_rate/add_165/n122 ), 
        .A2(\uut_baud_rate/add_165/n123 ), .ZN(\uut_baud_rate/add_165/n114 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U218  ( .A1(\uut_baud_rate/n8 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n69 ), .A4(
        \uut_baud_rate/add_165/n10 ), .ZN(\uut_baud_rate/add_165/n120 ) );
  NAND3_X1 \uut_baud_rate/add_165/U217  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n59 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_165/n121 ) );
  NOR2_X1 \uut_baud_rate/add_165/U216  ( .A1(\uut_baud_rate/add_165/n120 ), 
        .A2(\uut_baud_rate/add_165/n121 ), .ZN(\uut_baud_rate/add_165/n115 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U215  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/add_165/n28 ), .A3(\uut_baud_rate/add_165/n61 ), .A4(
        \uut_baud_rate/add_165/n60 ), .ZN(\uut_baud_rate/add_165/n118 ) );
  NAND3_X1 \uut_baud_rate/add_165/U214  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/add_165/n13 ), .A3(\uut_baud_rate/n75 ), .ZN(
        \uut_baud_rate/add_165/n119 ) );
  NOR2_X1 \uut_baud_rate/add_165/U213  ( .A1(\uut_baud_rate/add_165/n118 ), 
        .A2(\uut_baud_rate/add_165/n119 ), .ZN(\uut_baud_rate/add_165/n116 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U212  ( .A(\uut_baud_rate/add_165/n113 ), 
        .B(\uut_baud_rate/n40 ), .ZN(\uut_baud_rate/N41 ) );
  NAND4_X1 \uut_baud_rate/add_165/U211  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/n51 ), .A3(\uut_baud_rate/n55 ), .A4(
        \uut_baud_rate/n57 ), .ZN(\uut_baud_rate/add_165/n111 ) );
  NAND3_X1 \uut_baud_rate/add_165/U210  ( .A1(\uut_baud_rate/baud_count [28]), 
        .A2(\uut_baud_rate/n40 ), .A3(\uut_baud_rate/n48 ), .ZN(
        \uut_baud_rate/add_165/n112 ) );
  NOR2_X1 \uut_baud_rate/add_165/U209  ( .A1(\uut_baud_rate/add_165/n111 ), 
        .A2(\uut_baud_rate/add_165/n112 ), .ZN(\uut_baud_rate/add_165/n101 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U208  ( .A1(\uut_baud_rate/n8 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n69 ), .A4(
        \uut_baud_rate/add_165/n11 ), .ZN(\uut_baud_rate/add_165/n109 ) );
  NAND4_X1 \uut_baud_rate/add_165/U207  ( .A1(\uut_baud_rate/n7 ), .A2(
        \uut_baud_rate/n59 ), .A3(\uut_baud_rate/n67 ), .A4(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/add_165/n110 ) );
  NOR2_X1 \uut_baud_rate/add_165/U206  ( .A1(\uut_baud_rate/add_165/n109 ), 
        .A2(\uut_baud_rate/add_165/n110 ), .ZN(\uut_baud_rate/add_165/n102 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U205  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/add_165/n28 ), .A3(\uut_baud_rate/add_165/n61 ), .A4(
        \uut_baud_rate/add_165/n60 ), .ZN(\uut_baud_rate/add_165/n107 ) );
  NAND3_X1 \uut_baud_rate/add_165/U204  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/add_165/n12 ), .A3(\uut_baud_rate/n75 ), .ZN(
        \uut_baud_rate/add_165/n108 ) );
  NOR2_X1 \uut_baud_rate/add_165/U203  ( .A1(\uut_baud_rate/add_165/n107 ), 
        .A2(\uut_baud_rate/add_165/n108 ), .ZN(\uut_baud_rate/add_165/n103 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U202  ( .A1(\uut_baud_rate/add_165/n34 ), 
        .A2(\uut_baud_rate/add_165/n58 ), .A3(\uut_baud_rate/add_165/n53 ), 
        .A4(\uut_baud_rate/add_165/n31 ), .ZN(\uut_baud_rate/add_165/n106 ) );
  NOR2_X1 \uut_baud_rate/add_165/U201  ( .A1(\uut_baud_rate/add_165/n105 ), 
        .A2(\uut_baud_rate/add_165/n106 ), .ZN(\uut_baud_rate/add_165/n104 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U200  ( .A(\uut_baud_rate/add_165/n100 ), 
        .B(\uut_baud_rate/n42 ), .ZN(\uut_baud_rate/N42 ) );
  NAND4_X1 \uut_baud_rate/add_165/U199  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/n53 ), .A3(\uut_baud_rate/n51 ), .A4(
        \uut_baud_rate/n55 ), .ZN(\uut_baud_rate/add_165/n98 ) );
  NAND3_X1 \uut_baud_rate/add_165/U198  ( .A1(\uut_baud_rate/n40 ), .A2(
        \uut_baud_rate/n42 ), .A3(\uut_baud_rate/baud_count [28]), .ZN(
        \uut_baud_rate/add_165/n99 ) );
  NOR2_X1 \uut_baud_rate/add_165/U197  ( .A1(\uut_baud_rate/add_165/n98 ), 
        .A2(\uut_baud_rate/add_165/n99 ), .ZN(\uut_baud_rate/add_165/n90 ) );
  NAND4_X1 \uut_baud_rate/add_165/U196  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n8 ), .A3(\uut_baud_rate/n71 ), .A4(\uut_baud_rate/n69 ), .ZN(\uut_baud_rate/add_165/n96 ) );
  NAND4_X1 \uut_baud_rate/add_165/U195  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/n7 ), .A3(\uut_baud_rate/n59 ), .A4(\uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_165/n97 ) );
  NOR2_X1 \uut_baud_rate/add_165/U194  ( .A1(\uut_baud_rate/add_165/n96 ), 
        .A2(\uut_baud_rate/add_165/n97 ), .ZN(\uut_baud_rate/add_165/n91 ) );
  NAND4_X1 \uut_baud_rate/add_165/U193  ( .A1(\uut_baud_rate/add_165/n10 ), 
        .A2(\uut_baud_rate/add_165/n13 ), .A3(\uut_baud_rate/n63 ), .A4(
        \uut_baud_rate/n75 ), .ZN(\uut_baud_rate/add_165/n95 ) );
  NOR2_X1 \uut_baud_rate/add_165/U192  ( .A1(\uut_baud_rate/add_165/n7 ), .A2(
        \uut_baud_rate/add_165/n95 ), .ZN(\uut_baud_rate/add_165/n92 ) );
  NAND4_X1 \uut_baud_rate/add_165/U191  ( .A1(\uut_baud_rate/add_165/n34 ), 
        .A2(\uut_baud_rate/add_165/n58 ), .A3(\uut_baud_rate/add_165/n53 ), 
        .A4(\uut_baud_rate/add_165/n31 ), .ZN(\uut_baud_rate/add_165/n94 ) );
  NOR2_X1 \uut_baud_rate/add_165/U190  ( .A1(\uut_baud_rate/add_165/n85 ), 
        .A2(\uut_baud_rate/add_165/n94 ), .ZN(\uut_baud_rate/add_165/n93 ) );
  NAND4_X1 \uut_baud_rate/add_165/U189  ( .A1(\uut_baud_rate/add_165/n90 ), 
        .A2(\uut_baud_rate/add_165/n91 ), .A3(\uut_baud_rate/add_165/n92 ), 
        .A4(\uut_baud_rate/add_165/n93 ), .ZN(\uut_baud_rate/add_165/n89 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U188  ( .A(\uut_baud_rate/add_165/n89 ), .B(
        \uut_baud_rate/n36 ), .ZN(\uut_baud_rate/N43 ) );
  NAND4_X1 \uut_baud_rate/add_165/U187  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .A3(\uut_baud_rate/add_165/n35 ), 
        .A4(\uut_baud_rate/add_165/n30 ), .ZN(\uut_baud_rate/add_165/n85 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U186  ( .A(\uut_baud_rate/add_165/n85 ), .B(
        \uut_baud_rate/add_165/n31 ), .ZN(\uut_baud_rate/N16 ) );
  NAND3_X1 \uut_baud_rate/add_165/U185  ( .A1(\uut_baud_rate/add_165/n32 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n29 ), 
        .ZN(\uut_baud_rate/add_165/n83 ) );
  NAND2_X1 \uut_baud_rate/add_165/U184  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n50 ), .ZN(\uut_baud_rate/add_165/n84 ) );
  NAND3_X1 \uut_baud_rate/add_165/U183  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n50 ), .A3(\uut_baud_rate/add_165/n30 ), 
        .ZN(\uut_baud_rate/add_165/n80 ) );
  NAND3_X1 \uut_baud_rate/add_165/U182  ( .A1(\uut_baud_rate/add_165/n32 ), 
        .A2(\uut_baud_rate/add_165/n54 ), .A3(\uut_baud_rate/add_165/n51 ), 
        .ZN(\uut_baud_rate/add_165/n81 ) );
  NAND2_X1 \uut_baud_rate/add_165/U181  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n30 ), .ZN(\uut_baud_rate/add_165/n77 ) );
  NAND2_X1 \uut_baud_rate/add_165/U180  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n50 ), .ZN(\uut_baud_rate/add_165/n78 ) );
  NAND2_X1 \uut_baud_rate/add_165/U179  ( .A1(\uut_baud_rate/add_165/n75 ), 
        .A2(\uut_baud_rate/add_165/n76 ), .ZN(\uut_baud_rate/add_165/n74 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U178  ( .A(\uut_baud_rate/add_165/n74 ), .B(
        \uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/N19 ) );
  NAND2_X1 \uut_baud_rate/add_165/U177  ( .A1(\uut_baud_rate/add_165/n3 ), 
        .A2(\uut_baud_rate/add_165/n31 ), .ZN(\uut_baud_rate/add_165/n72 ) );
  NAND2_X1 \uut_baud_rate/add_165/U176  ( .A1(\uut_baud_rate/add_165/n33 ), 
        .A2(\uut_baud_rate/add_165/n57 ), .ZN(\uut_baud_rate/add_165/n73 ) );
  NAND2_X1 \uut_baud_rate/add_165/U175  ( .A1(\uut_baud_rate/add_165/n51 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .ZN(\uut_baud_rate/add_165/n71 ) );
  NAND2_X1 \uut_baud_rate/add_165/U174  ( .A1(\uut_baud_rate/add_165/n69 ), 
        .A2(\uut_baud_rate/add_165/n70 ), .ZN(\uut_baud_rate/add_165/n68 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U173  ( .A(\uut_baud_rate/add_165/n68 ), .B(
        \uut_baud_rate/add_165/n39 ), .ZN(\uut_baud_rate/N20 ) );
  NAND2_X1 \uut_baud_rate/add_165/U172  ( .A1(\uut_baud_rate/add_165/n58 ), 
        .A2(\uut_baud_rate/add_165/n54 ), .ZN(\uut_baud_rate/add_165/n66 ) );
  NAND2_X1 \uut_baud_rate/add_165/U171  ( .A1(\uut_baud_rate/add_165/n39 ), 
        .A2(\uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/add_165/n67 ) );
  NAND3_X1 \uut_baud_rate/add_165/U170  ( .A1(\uut_baud_rate/add_165/n63 ), 
        .A2(\uut_baud_rate/add_165/n64 ), .A3(\uut_baud_rate/add_165/n65 ), 
        .ZN(\uut_baud_rate/add_165/n62 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U169  ( .A(\uut_baud_rate/add_165/n62 ), .B(
        \uut_baud_rate/add_165/n8 ), .ZN(\uut_baud_rate/N21 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U168  ( .A(\uut_baud_rate/add_165/n234 ), 
        .B(\uut_baud_rate/n61 ), .ZN(\uut_baud_rate/N31 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U167  ( .A(\uut_baud_rate/add_165/n196 ), 
        .B(\uut_baud_rate/n7 ), .ZN(\uut_baud_rate/N34 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U166  ( .A(\uut_baud_rate/add_165/n171 ), 
        .B(\uut_baud_rate/n55 ), .ZN(\uut_baud_rate/N36 ) );
  NAND4_X1 \uut_baud_rate/add_165/U165  ( .A1(\uut_baud_rate/add_165/n172 ), 
        .A2(\uut_baud_rate/add_165/n173 ), .A3(\uut_baud_rate/add_165/n174 ), 
        .A4(\uut_baud_rate/add_165/n175 ), .ZN(\uut_baud_rate/add_165/n171 )
         );
  INV_X1 \uut_baud_rate/add_165/U164  ( .A(\uut_baud_rate/baud_count [5]), 
        .ZN(\uut_baud_rate/add_165/n56 ) );
  CLKBUF_X1 \uut_baud_rate/add_165/U163  ( .A(\uut_baud_rate/add_165/n2 ), .Z(
        \uut_baud_rate/add_165/n55 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U162  ( .A(\uut_baud_rate/add_165/n209 ), 
        .B(\uut_baud_rate/n59 ), .ZN(\uut_baud_rate/N33 ) );
  INV_X1 \uut_baud_rate/add_165/U161  ( .A(\uut_baud_rate/baud_count [0]), 
        .ZN(\uut_baud_rate/N12 ) );
  NAND2_X1 \uut_baud_rate/add_165/U160  ( .A1(\uut_baud_rate/add_165/n35 ), 
        .A2(\uut_baud_rate/add_165/n30 ), .ZN(\uut_baud_rate/add_165/n88 ) );
  INV_X1 \uut_baud_rate/add_165/U159  ( .A(\uut_baud_rate/add_165/n88 ), .ZN(
        \uut_baud_rate/add_165/n87 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U158  ( .A(\uut_baud_rate/add_165/n88 ), .B(
        \uut_baud_rate/add_165/n50 ), .ZN(\uut_baud_rate/N14 ) );
  INV_X1 \uut_baud_rate/add_165/U157  ( .A(\uut_baud_rate/baud_count [6]), 
        .ZN(\uut_baud_rate/add_165/n59 ) );
  BUF_X4 \uut_baud_rate/add_165/U156  ( .A(\uut_baud_rate/baud_count [3]), .Z(
        \uut_baud_rate/add_165/n51 ) );
  NAND4_X1 \uut_baud_rate/add_165/U155  ( .A1(\uut_baud_rate/add_165/n184 ), 
        .A2(\uut_baud_rate/add_165/n185 ), .A3(\uut_baud_rate/add_165/n186 ), 
        .A4(\uut_baud_rate/add_165/n187 ), .ZN(\uut_baud_rate/add_165/n183 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U154  ( .A(\uut_baud_rate/add_165/n183 ), 
        .B(\uut_baud_rate/n57 ), .ZN(\uut_baud_rate/N35 ) );
  INV_X1 \uut_baud_rate/add_165/U153  ( .A(\uut_baud_rate/add_165/n56 ), .ZN(
        \uut_baud_rate/add_165/n54 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U152  ( .A(\uut_baud_rate/add_165/n6 ), .B(
        \uut_baud_rate/add_165/n79 ), .ZN(\uut_baud_rate/N18 ) );
  CLKBUF_X1 \uut_baud_rate/add_165/U151  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_165/n50 ) );
  NAND2_X1 \uut_baud_rate/add_165/U150  ( .A1(\uut_baud_rate/n75 ), .A2(
        \uut_baud_rate/n63 ), .ZN(\uut_baud_rate/add_165/n218 ) );
  AND3_X1 \uut_baud_rate/add_165/U149  ( .A1(\uut_baud_rate/n75 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/n11 ), .ZN(
        \uut_baud_rate/add_165/n278 ) );
  AND3_X1 \uut_baud_rate/add_165/U148  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/add_165/n13 ), .A3(\uut_baud_rate/n75 ), .ZN(
        \uut_baud_rate/add_165/n268 ) );
  AND2_X1 \uut_baud_rate/add_165/U147  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/add_165/n243 ) );
  NAND2_X1 \uut_baud_rate/add_165/U146  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n8 ), .ZN(\uut_baud_rate/add_165/n220 ) );
  NAND2_X1 \uut_baud_rate/add_165/U145  ( .A1(\uut_baud_rate/n8 ), .A2(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/add_165/n208 ) );
  AND2_X1 \uut_baud_rate/add_165/U144  ( .A1(\uut_baud_rate/add_165/n10 ), 
        .A2(\uut_baud_rate/add_165/n12 ), .ZN(\uut_baud_rate/add_165/n244 ) );
  NAND2_X1 \uut_baud_rate/add_165/U143  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_165/n195 ) );
  AND3_X1 \uut_baud_rate/add_165/U142  ( .A1(\uut_baud_rate/add_165/n32 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n29 ), 
        .ZN(\uut_baud_rate/add_165/n65 ) );
  AND3_X1 \uut_baud_rate/add_165/U141  ( .A1(\uut_baud_rate/add_165/n32 ), 
        .A2(\uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n30 ), 
        .ZN(\uut_baud_rate/add_165/n247 ) );
  NOR2_X1 \uut_baud_rate/add_165/U140  ( .A1(\uut_baud_rate/add_165/n201 ), 
        .A2(\uut_baud_rate/add_165/n202 ), .ZN(\uut_baud_rate/add_165/n200 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U139  ( .A1(\uut_baud_rate/add_165/n197 ), 
        .A2(\uut_baud_rate/add_165/n198 ), .A3(\uut_baud_rate/add_165/n199 ), 
        .A4(\uut_baud_rate/add_165/n200 ), .ZN(\uut_baud_rate/add_165/n196 )
         );
  AND2_X1 \uut_baud_rate/add_165/U138  ( .A1(\uut_baud_rate/add_165/n57 ), 
        .A2(\uut_baud_rate/add_165/n52 ), .ZN(\uut_baud_rate/add_165/n239 ) );
  NAND2_X1 \uut_baud_rate/add_165/U137  ( .A1(\uut_baud_rate/add_165/n16 ), 
        .A2(\uut_baud_rate/add_165/n33 ), .ZN(\uut_baud_rate/add_165/n311 ) );
  AND3_X1 \uut_baud_rate/add_165/U136  ( .A1(\uut_baud_rate/add_165/n3 ), .A2(
        \uut_baud_rate/add_165/n57 ), .A3(\uut_baud_rate/add_165/n32 ), .ZN(
        \uut_baud_rate/add_165/n289 ) );
  AND3_X1 \uut_baud_rate/add_165/U135  ( .A1(\uut_baud_rate/add_165/n3 ), .A2(
        \uut_baud_rate/add_165/n16 ), .A3(\uut_baud_rate/add_165/n32 ), .ZN(
        \uut_baud_rate/add_165/n280 ) );
  AND3_X1 \uut_baud_rate/add_165/U134  ( .A1(\uut_baud_rate/add_165/n54 ), 
        .A2(\uut_baud_rate/add_165/n16 ), .A3(\uut_baud_rate/add_165/n32 ), 
        .ZN(\uut_baud_rate/add_165/n75 ) );
  NOR2_X1 \uut_baud_rate/add_165/U133  ( .A1(\uut_baud_rate/add_165/n146 ), 
        .A2(\uut_baud_rate/add_165/n147 ), .ZN(\uut_baud_rate/add_165/n137 )
         );
  NAND2_X1 \uut_baud_rate/add_165/U132  ( .A1(\uut_baud_rate/add_165/n38 ), 
        .A2(\uut_baud_rate/add_165/n140 ), .ZN(\uut_baud_rate/add_165/n136 )
         );
  NAND2_X1 \uut_baud_rate/add_165/U131  ( .A1(\uut_baud_rate/add_165/n117 ), 
        .A2(\uut_baud_rate/add_165/n19 ), .ZN(\uut_baud_rate/add_165/n113 ) );
  NOR2_X1 \uut_baud_rate/add_165/U130  ( .A1(\uut_baud_rate/add_165/n215 ), 
        .A2(\uut_baud_rate/add_165/n216 ), .ZN(\uut_baud_rate/add_165/n212 )
         );
  NAND4_X1 \uut_baud_rate/add_165/U129  ( .A1(\uut_baud_rate/add_165/n210 ), 
        .A2(\uut_baud_rate/add_165/n211 ), .A3(\uut_baud_rate/add_165/n212 ), 
        .A4(\uut_baud_rate/add_165/n213 ), .ZN(\uut_baud_rate/add_165/n209 )
         );
  AND3_X1 \uut_baud_rate/add_165/U128  ( .A1(\uut_baud_rate/add_165/n239 ), 
        .A2(\uut_baud_rate/add_165/n238 ), .A3(\uut_baud_rate/add_165/n240 ), 
        .ZN(\uut_baud_rate/add_165/n46 ) );
  NOR2_X1 \uut_baud_rate/add_165/U127  ( .A1(\uut_baud_rate/add_165/n251 ), 
        .A2(\uut_baud_rate/add_165/n235 ), .ZN(\uut_baud_rate/add_165/n45 ) );
  AND3_X1 \uut_baud_rate/add_165/U126  ( .A1(\uut_baud_rate/add_165/n9 ), .A2(
        \uut_baud_rate/add_165/n39 ), .A3(\uut_baud_rate/add_165/n52 ), .ZN(
        \uut_baud_rate/add_165/n44 ) );
  AND2_X1 \uut_baud_rate/add_165/U125  ( .A1(\uut_baud_rate/add_165/n44 ), 
        .A2(\uut_baud_rate/add_165/n45 ), .ZN(\uut_baud_rate/add_165/n42 ) );
  NAND2_X1 \uut_baud_rate/add_165/U124  ( .A1(\uut_baud_rate/add_165/n42 ), 
        .A2(\uut_baud_rate/add_165/n43 ), .ZN(\uut_baud_rate/add_165/n234 ) );
  NOR2_X1 \uut_baud_rate/add_165/U123  ( .A1(\uut_baud_rate/add_165/n274 ), 
        .A2(\uut_baud_rate/add_165/n262 ), .ZN(\uut_baud_rate/add_165/n270 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U122  ( .A1(\uut_baud_rate/add_165/n261 ), 
        .A2(\uut_baud_rate/add_165/n73 ), .ZN(\uut_baud_rate/add_165/n257 ) );
  NOR2_X1 \uut_baud_rate/add_165/U121  ( .A1(\uut_baud_rate/add_165/n190 ), 
        .A2(\uut_baud_rate/add_165/n191 ), .ZN(\uut_baud_rate/add_165/n186 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U120  ( .A1(\uut_baud_rate/add_165/n203 ), 
        .A2(\uut_baud_rate/add_165/n204 ), .ZN(\uut_baud_rate/add_165/n199 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U119  ( .A1(\uut_baud_rate/add_165/n190 ), 
        .A2(\uut_baud_rate/add_165/n178 ), .ZN(\uut_baud_rate/add_165/n174 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U118  ( .A1(\uut_baud_rate/add_165/n165 ), 
        .A2(\uut_baud_rate/add_165/n166 ), .ZN(\uut_baud_rate/add_165/n161 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U117  ( .A1(\uut_baud_rate/add_165/n167 ), 
        .A2(\uut_baud_rate/add_165/n168 ), .ZN(\uut_baud_rate/add_165/n160 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U116  ( .A1(\uut_baud_rate/add_165/n169 ), 
        .A2(\uut_baud_rate/add_165/n170 ), .ZN(\uut_baud_rate/add_165/n159 )
         );
  NAND3_X1 \uut_baud_rate/add_165/U115  ( .A1(\uut_baud_rate/add_165/n162 ), 
        .A2(\uut_baud_rate/add_165/n161 ), .A3(\uut_baud_rate/add_165/n23 ), 
        .ZN(\uut_baud_rate/add_165/n158 ) );
  NOR2_X1 \uut_baud_rate/add_165/U114  ( .A1(\uut_baud_rate/add_165/n298 ), 
        .A2(\uut_baud_rate/add_165/n178 ), .ZN(\uut_baud_rate/add_165/n294 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U113  ( .A1(\uut_baud_rate/add_165/n303 ), 
        .A2(\uut_baud_rate/add_165/n304 ), .ZN(\uut_baud_rate/add_165/n300 )
         );
  NAND2_X1 \uut_baud_rate/add_165/U112  ( .A1(\uut_baud_rate/add_165/n300 ), 
        .A2(\uut_baud_rate/add_165/n301 ), .ZN(\uut_baud_rate/add_165/n299 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U111  ( .A1(\uut_baud_rate/add_165/n310 ), 
        .A2(\uut_baud_rate/add_165/n311 ), .ZN(\uut_baud_rate/add_165/n306 )
         );
  NAND2_X1 \uut_baud_rate/add_165/U110  ( .A1(\uut_baud_rate/add_165/n306 ), 
        .A2(\uut_baud_rate/add_165/n307 ), .ZN(\uut_baud_rate/add_165/n305 )
         );
  NAND2_X1 \uut_baud_rate/add_165/U109  ( .A1(\uut_baud_rate/add_165/n294 ), 
        .A2(\uut_baud_rate/add_165/n295 ), .ZN(\uut_baud_rate/add_165/n293 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U108  ( .A1(\uut_baud_rate/add_165/n259 ), 
        .A2(\uut_baud_rate/add_165/n260 ), .ZN(\uut_baud_rate/add_165/n258 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U107  ( .A1(\uut_baud_rate/add_165/n263 ), 
        .A2(\uut_baud_rate/add_165/n264 ), .ZN(\uut_baud_rate/add_165/n256 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U106  ( .A1(\uut_baud_rate/add_165/n265 ), 
        .A2(\uut_baud_rate/add_165/n266 ), .ZN(\uut_baud_rate/add_165/n255 )
         );
  NAND3_X1 \uut_baud_rate/add_165/U105  ( .A1(\uut_baud_rate/add_165/n257 ), 
        .A2(\uut_baud_rate/add_165/n258 ), .A3(\uut_baud_rate/add_165/n21 ), 
        .ZN(\uut_baud_rate/add_165/n254 ) );
  NAND2_X1 \uut_baud_rate/add_165/U104  ( .A1(\uut_baud_rate/add_165/n37 ), 
        .A2(\uut_baud_rate/add_165/n128 ), .ZN(\uut_baud_rate/add_165/n124 )
         );
  NAND3_X1 \uut_baud_rate/add_165/U103  ( .A1(\uut_baud_rate/add_165/n29 ), 
        .A2(\uut_baud_rate/add_165/n50 ), .A3(\uut_baud_rate/add_165/n22 ), 
        .ZN(\uut_baud_rate/add_165/n105 ) );
  NAND2_X1 \uut_baud_rate/add_165/U102  ( .A1(\uut_baud_rate/add_165/n104 ), 
        .A2(\uut_baud_rate/add_165/n20 ), .ZN(\uut_baud_rate/add_165/n100 ) );
  AND2_X1 \uut_baud_rate/add_165/U101  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n49 ), .ZN(\uut_baud_rate/add_165/n240 ) );
  NAND2_X1 \uut_baud_rate/add_165/U100  ( .A1(\uut_baud_rate/add_165/n36 ), 
        .A2(\uut_baud_rate/add_165/n50 ), .ZN(\uut_baud_rate/add_165/n309 ) );
  AND2_X1 \uut_baud_rate/add_165/U99  ( .A1(\uut_baud_rate/add_165/n36 ), .A2(
        \uut_baud_rate/add_165/n50 ), .ZN(\uut_baud_rate/add_165/n63 ) );
  NAND2_X1 \uut_baud_rate/add_165/U98  ( .A1(\uut_baud_rate/add_165/n50 ), 
        .A2(\uut_baud_rate/add_165/n87 ), .ZN(\uut_baud_rate/add_165/n86 ) );
  AND3_X1 \uut_baud_rate/add_165/U97  ( .A1(\uut_baud_rate/add_165/n32 ), .A2(
        \uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n30 ), .ZN(
        \uut_baud_rate/add_165/n41 ) );
  AND2_X1 \uut_baud_rate/add_165/U96  ( .A1(\uut_baud_rate/add_165/n39 ), .A2(
        \uut_baud_rate/add_165/n34 ), .ZN(\uut_baud_rate/add_165/n238 ) );
  NAND2_X1 \uut_baud_rate/add_165/U95  ( .A1(\uut_baud_rate/add_165/n33 ), 
        .A2(\uut_baud_rate/add_165/n39 ), .ZN(\uut_baud_rate/add_165/n216 ) );
  NAND2_X1 \uut_baud_rate/add_165/U94  ( .A1(\uut_baud_rate/add_165/n33 ), 
        .A2(\uut_baud_rate/add_165/n39 ), .ZN(\uut_baud_rate/add_165/n204 ) );
  NAND2_X1 \uut_baud_rate/add_165/U93  ( .A1(\uut_baud_rate/add_165/n33 ), 
        .A2(\uut_baud_rate/add_165/n39 ), .ZN(\uut_baud_rate/add_165/n304 ) );
  AND3_X1 \uut_baud_rate/add_165/U92  ( .A1(\uut_baud_rate/add_165/n39 ), .A2(
        \uut_baud_rate/add_165/n8 ), .A3(\uut_baud_rate/add_165/n34 ), .ZN(
        \uut_baud_rate/add_165/n288 ) );
  AND2_X1 \uut_baud_rate/add_165/U91  ( .A1(\uut_baud_rate/add_165/n28 ), .A2(
        \uut_baud_rate/n11 ), .ZN(\uut_baud_rate/add_165/n245 ) );
  AND3_X1 \uut_baud_rate/add_165/U90  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/n75 ), .A3(\uut_baud_rate/add_165/n27 ), .ZN(
        \uut_baud_rate/add_165/n287 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U89  ( .A(\uut_baud_rate/add_165/n305 ), .B(
        \uut_baud_rate/add_165/n27 ), .ZN(\uut_baud_rate/N22 ) );
  AND3_X1 \uut_baud_rate/add_165/U88  ( .A1(\uut_baud_rate/add_165/n49 ), .A2(
        \uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n36 ), .ZN(
        \uut_baud_rate/add_165/n40 ) );
  CLKBUF_X1 \uut_baud_rate/add_165/U87  ( .A(\uut_baud_rate/baud_count [8]), 
        .Z(\uut_baud_rate/add_165/n60 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U86  ( .A(\uut_baud_rate/baud_count [8]), 
        .Z(\uut_baud_rate/add_165/n39 ) );
  NOR2_X1 \uut_baud_rate/add_165/U85  ( .A1(\uut_baud_rate/add_165/n241 ), 
        .A2(\uut_baud_rate/add_165/n242 ), .ZN(\uut_baud_rate/add_165/n237 )
         );
  AND3_X1 \uut_baud_rate/add_165/U84  ( .A1(\uut_baud_rate/add_165/n139 ), 
        .A2(\uut_baud_rate/add_165/n138 ), .A3(\uut_baud_rate/add_165/n137 ), 
        .ZN(\uut_baud_rate/add_165/n38 ) );
  AND3_X1 \uut_baud_rate/add_165/U83  ( .A1(\uut_baud_rate/add_165/n127 ), 
        .A2(\uut_baud_rate/add_165/n126 ), .A3(\uut_baud_rate/add_165/n125 ), 
        .ZN(\uut_baud_rate/add_165/n37 ) );
  CLKBUF_X1 \uut_baud_rate/add_165/U82  ( .A(\uut_baud_rate/baud_count [7]), 
        .Z(\uut_baud_rate/add_165/n34 ) );
  NOR2_X1 \uut_baud_rate/add_165/U81  ( .A1(\uut_baud_rate/add_165/n176 ), 
        .A2(\uut_baud_rate/add_165/n214 ), .ZN(\uut_baud_rate/add_165/n213 )
         );
  CLKBUF_X3 \uut_baud_rate/add_165/U80  ( .A(\uut_baud_rate/baud_count [4]), 
        .Z(\uut_baud_rate/add_165/n31 ) );
  CLKBUF_X1 \uut_baud_rate/add_165/U79  ( .A(\uut_baud_rate/baud_count [4]), 
        .Z(\uut_baud_rate/add_165/n32 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U78  ( .A(\uut_baud_rate/baud_count [0]), 
        .Z(\uut_baud_rate/add_165/n30 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U77  ( .A(\uut_baud_rate/n78 ), .Z(
        \uut_baud_rate/add_165/n28 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U76  ( .A(\uut_baud_rate/add_165/n299 ), .B(
        \uut_baud_rate/n11 ), .ZN(\uut_baud_rate/N23 ) );
  NOR2_X1 \uut_baud_rate/add_165/U75  ( .A1(\uut_baud_rate/add_165/n217 ), 
        .A2(\uut_baud_rate/add_165/n218 ), .ZN(\uut_baud_rate/add_165/n211 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U74  ( .A1(\uut_baud_rate/add_165/n230 ), 
        .A2(\uut_baud_rate/add_165/n231 ), .ZN(\uut_baud_rate/add_165/n223 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U73  ( .A1(\uut_baud_rate/add_165/n275 ), 
        .A2(\uut_baud_rate/add_165/n276 ), .ZN(\uut_baud_rate/add_165/n269 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U72  ( .A1(\uut_baud_rate/add_165/n165 ), 
        .A2(\uut_baud_rate/add_165/n153 ), .ZN(\uut_baud_rate/add_165/n151 )
         );
  CLKBUF_X3 \uut_baud_rate/add_165/U71  ( .A(\uut_baud_rate/baud_count [7]), 
        .Z(\uut_baud_rate/add_165/n33 ) );
  NAND2_X1 \uut_baud_rate/add_165/U70  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/n75 ), .ZN(\uut_baud_rate/add_165/n26 ) );
  NAND2_X1 \uut_baud_rate/add_165/U69  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/add_165/n10 ), .ZN(\uut_baud_rate/add_165/n25 ) );
  NAND2_X1 \uut_baud_rate/add_165/U68  ( .A1(\uut_baud_rate/n8 ), .A2(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_165/n24 ) );
  NOR2_X1 \uut_baud_rate/add_165/U67  ( .A1(\uut_baud_rate/add_165/n302 ), 
        .A2(\uut_baud_rate/add_165/n297 ), .ZN(\uut_baud_rate/add_165/n301 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U66  ( .A1(\uut_baud_rate/add_165/n205 ), 
        .A2(\uut_baud_rate/add_165/n206 ), .ZN(\uut_baud_rate/add_165/n198 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U65  ( .A1(\uut_baud_rate/add_165/n207 ), 
        .A2(\uut_baud_rate/add_165/n208 ), .ZN(\uut_baud_rate/add_165/n197 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U64  ( .A1(\uut_baud_rate/add_165/n179 ), 
        .A2(\uut_baud_rate/add_165/n180 ), .ZN(\uut_baud_rate/add_165/n173 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U63  ( .A1(\uut_baud_rate/add_165/n192 ), 
        .A2(\uut_baud_rate/add_165/n193 ), .ZN(\uut_baud_rate/add_165/n185 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U62  ( .A1(\uut_baud_rate/add_165/n66 ), .A2(
        \uut_baud_rate/add_165/n67 ), .ZN(\uut_baud_rate/add_165/n64 ) );
  BUF_X2 \uut_baud_rate/add_165/U61  ( .A(\uut_baud_rate/n79 ), .Z(
        \uut_baud_rate/add_165/n36 ) );
  NOR2_X1 \uut_baud_rate/add_165/U60  ( .A1(\uut_baud_rate/add_165/n284 ), 
        .A2(\uut_baud_rate/add_165/n285 ), .ZN(\uut_baud_rate/add_165/n279 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U59  ( .A1(\uut_baud_rate/add_165/n77 ), .A2(
        \uut_baud_rate/add_165/n78 ), .ZN(\uut_baud_rate/add_165/n76 ) );
  NOR2_X1 \uut_baud_rate/add_165/U58  ( .A1(\uut_baud_rate/add_165/n228 ), 
        .A2(\uut_baud_rate/add_165/n229 ), .ZN(\uut_baud_rate/add_165/n224 )
         );
  AND2_X1 \uut_baud_rate/add_165/U57  ( .A1(\uut_baud_rate/add_165/n160 ), 
        .A2(\uut_baud_rate/add_165/n159 ), .ZN(\uut_baud_rate/add_165/n23 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U56  ( .A(\uut_baud_rate/n79 ), .Z(
        \uut_baud_rate/add_165/n35 ) );
  NOR2_X1 \uut_baud_rate/add_165/U55  ( .A1(\uut_baud_rate/add_165/n188 ), 
        .A2(\uut_baud_rate/add_165/n189 ), .ZN(\uut_baud_rate/add_165/n187 )
         );
  AND2_X1 \uut_baud_rate/add_165/U54  ( .A1(\uut_baud_rate/add_165/n51 ), .A2(
        \uut_baud_rate/add_165/n35 ), .ZN(\uut_baud_rate/add_165/n22 ) );
  NOR2_X1 \uut_baud_rate/add_165/U53  ( .A1(\uut_baud_rate/add_165/n176 ), 
        .A2(\uut_baud_rate/add_165/n177 ), .ZN(\uut_baud_rate/add_165/n175 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U52  ( .A1(\uut_baud_rate/add_165/n226 ), 
        .A2(\uut_baud_rate/add_165/n227 ), .ZN(\uut_baud_rate/add_165/n225 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U51  ( .A(\uut_baud_rate/add_165/n86 ), .B(
        \uut_baud_rate/add_165/n51 ), .ZN(\uut_baud_rate/N15 ) );
  NOR2_X1 \uut_baud_rate/add_165/U50  ( .A1(\uut_baud_rate/add_165/n272 ), 
        .A2(\uut_baud_rate/add_165/n273 ), .ZN(\uut_baud_rate/add_165/n271 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U49  ( .A1(\uut_baud_rate/add_165/n282 ), 
        .A2(\uut_baud_rate/add_165/n283 ), .ZN(\uut_baud_rate/add_165/n281 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U48  ( .A1(\uut_baud_rate/add_165/n291 ), 
        .A2(\uut_baud_rate/add_165/n292 ), .ZN(\uut_baud_rate/add_165/n290 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U47  ( .A1(\uut_baud_rate/add_165/n72 ), .A2(
        \uut_baud_rate/add_165/n262 ), .ZN(\uut_baud_rate/add_165/n69 ) );
  NOR2_X1 \uut_baud_rate/add_165/U46  ( .A1(\uut_baud_rate/add_165/n259 ), 
        .A2(\uut_baud_rate/add_165/n71 ), .ZN(\uut_baud_rate/add_165/n70 ) );
  AND2_X1 \uut_baud_rate/add_165/U45  ( .A1(\uut_baud_rate/add_165/n256 ), 
        .A2(\uut_baud_rate/add_165/n255 ), .ZN(\uut_baud_rate/add_165/n21 ) );
  AND3_X1 \uut_baud_rate/add_165/U44  ( .A1(\uut_baud_rate/add_165/n103 ), 
        .A2(\uut_baud_rate/add_165/n102 ), .A3(\uut_baud_rate/add_165/n101 ), 
        .ZN(\uut_baud_rate/add_165/n20 ) );
  AND3_X1 \uut_baud_rate/add_165/U43  ( .A1(\uut_baud_rate/add_165/n116 ), 
        .A2(\uut_baud_rate/add_165/n115 ), .A3(\uut_baud_rate/add_165/n114 ), 
        .ZN(\uut_baud_rate/add_165/n19 ) );
  INV_X2 \uut_baud_rate/add_165/U42  ( .A(\uut_baud_rate/add_165/n59 ), .ZN(
        \uut_baud_rate/add_165/n57 ) );
  NOR2_X1 \uut_baud_rate/add_165/U41  ( .A1(\uut_baud_rate/add_165/n219 ), 
        .A2(\uut_baud_rate/add_165/n220 ), .ZN(\uut_baud_rate/add_165/n210 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U40  ( .A1(\uut_baud_rate/add_165/n194 ), 
        .A2(\uut_baud_rate/add_165/n195 ), .ZN(\uut_baud_rate/add_165/n184 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U39  ( .A1(\uut_baud_rate/add_165/n83 ), .A2(
        \uut_baud_rate/add_165/n84 ), .ZN(\uut_baud_rate/add_165/n82 ) );
  XNOR2_X1 \uut_baud_rate/add_165/U38  ( .A(\uut_baud_rate/add_165/n55 ), .B(
        \uut_baud_rate/add_165/n82 ), .ZN(\uut_baud_rate/N17 ) );
  NOR2_X1 \uut_baud_rate/add_165/U37  ( .A1(\uut_baud_rate/add_165/n232 ), 
        .A2(\uut_baud_rate/add_165/n233 ), .ZN(\uut_baud_rate/add_165/n222 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U36  ( .A1(\uut_baud_rate/add_165/n296 ), 
        .A2(\uut_baud_rate/add_165/n297 ), .ZN(\uut_baud_rate/add_165/n295 )
         );
  XNOR2_X1 \uut_baud_rate/add_165/U35  ( .A(\uut_baud_rate/add_165/n293 ), .B(
        \uut_baud_rate/n75 ), .ZN(\uut_baud_rate/N24 ) );
  NOR2_X1 \uut_baud_rate/add_165/U34  ( .A1(\uut_baud_rate/add_165/n80 ), .A2(
        \uut_baud_rate/add_165/n81 ), .ZN(\uut_baud_rate/add_165/n79 ) );
  NOR2_X1 \uut_baud_rate/add_165/U33  ( .A1(\uut_baud_rate/add_165/n156 ), 
        .A2(\uut_baud_rate/add_165/n157 ), .ZN(\uut_baud_rate/add_165/n149 )
         );
  NOR2_X1 \uut_baud_rate/add_165/U32  ( .A1(\uut_baud_rate/add_165/n181 ), 
        .A2(\uut_baud_rate/add_165/n182 ), .ZN(\uut_baud_rate/add_165/n172 )
         );
  XOR2_X1 \uut_baud_rate/add_165/U31  ( .A(\uut_baud_rate/add_165/n35 ), .B(
        \uut_baud_rate/add_165/n29 ), .Z(\uut_baud_rate/N13 ) );
  NOR2_X1 \uut_baud_rate/add_165/U30  ( .A1(\uut_baud_rate/add_165/n308 ), 
        .A2(\uut_baud_rate/add_165/n309 ), .ZN(\uut_baud_rate/add_165/n307 )
         );
  AND3_X1 \uut_baud_rate/add_165/U29  ( .A1(\uut_baud_rate/add_165/n32 ), .A2(
        \uut_baud_rate/add_165/n51 ), .A3(\uut_baud_rate/add_165/n30 ), .ZN(
        \uut_baud_rate/add_165/n17 ) );
  INV_X1 \uut_baud_rate/add_165/U28  ( .A(\uut_baud_rate/add_165/n59 ), .ZN(
        \uut_baud_rate/add_165/n16 ) );
  NOR3_X1 \uut_baud_rate/add_165/U27  ( .A1(\uut_baud_rate/add_165/n24 ), .A2(
        \uut_baud_rate/add_165/n25 ), .A3(\uut_baud_rate/add_165/n26 ), .ZN(
        \uut_baud_rate/add_165/n15 ) );
  AND2_X1 \uut_baud_rate/add_165/U26  ( .A1(\uut_baud_rate/add_165/n17 ), .A2(
        \uut_baud_rate/add_165/n1 ), .ZN(\uut_baud_rate/add_165/n14 ) );
  AND2_X1 \uut_baud_rate/add_165/U25  ( .A1(\uut_baud_rate/add_165/n14 ), .A2(
        \uut_baud_rate/add_165/n15 ), .ZN(\uut_baud_rate/add_165/n43 ) );
  BUF_X2 \uut_baud_rate/add_165/U24  ( .A(\uut_baud_rate/n73 ), .Z(
        \uut_baud_rate/add_165/n13 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U23  ( .A(\uut_baud_rate/n73 ), .Z(
        \uut_baud_rate/add_165/n12 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U22  ( .A(\uut_baud_rate/n65 ), .Z(
        \uut_baud_rate/add_165/n10 ) );
  NAND3_X1 \uut_baud_rate/add_165/U21  ( .A1(\uut_baud_rate/add_165/n46 ), 
        .A2(\uut_baud_rate/add_165/n237 ), .A3(\uut_baud_rate/add_165/n41 ), 
        .ZN(\uut_baud_rate/add_165/n236 ) );
  BUF_X1 \uut_baud_rate/add_165/U20  ( .A(\uut_baud_rate/n78 ), .Z(
        \uut_baud_rate/add_165/n27 ) );
  CLKBUF_X1 \uut_baud_rate/add_165/U19  ( .A(\uut_baud_rate/baud_count [9]), 
        .Z(\uut_baud_rate/add_165/n61 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U18  ( .A(\uut_baud_rate/baud_count [9]), 
        .Z(\uut_baud_rate/add_165/n9 ) );
  CLKBUF_X2 \uut_baud_rate/add_165/U17  ( .A(\uut_baud_rate/baud_count [9]), 
        .Z(\uut_baud_rate/add_165/n8 ) );
  NAND4_X1 \uut_baud_rate/add_165/U16  ( .A1(\uut_baud_rate/n11 ), .A2(
        \uut_baud_rate/add_165/n28 ), .A3(\uut_baud_rate/add_165/n9 ), .A4(
        \uut_baud_rate/add_165/n60 ), .ZN(\uut_baud_rate/add_165/n7 ) );
  INV_X1 \uut_baud_rate/add_165/U15  ( .A(\uut_baud_rate/add_165/n56 ), .ZN(
        \uut_baud_rate/add_165/n53 ) );
  INV_X1 \uut_baud_rate/add_165/U14  ( .A(\uut_baud_rate/add_165/n59 ), .ZN(
        \uut_baud_rate/add_165/n58 ) );
  INV_X1 \uut_baud_rate/add_165/U13  ( .A(\uut_baud_rate/add_165/n57 ), .ZN(
        \uut_baud_rate/add_165/n6 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U12  ( .A(\uut_baud_rate/n65 ), .Z(
        \uut_baud_rate/add_165/n11 ) );
  AND4_X1 \uut_baud_rate/add_165/U11  ( .A1(\uut_baud_rate/add_165/n34 ), .A2(
        \uut_baud_rate/add_165/n58 ), .A3(\uut_baud_rate/add_165/n54 ), .A4(
        \uut_baud_rate/add_165/n31 ), .ZN(\uut_baud_rate/add_165/n5 ) );
  AND2_X1 \uut_baud_rate/add_165/U10  ( .A1(\uut_baud_rate/add_165/n40 ), .A2(
        \uut_baud_rate/add_165/n29 ), .ZN(\uut_baud_rate/add_165/n4 ) );
  AND2_X1 \uut_baud_rate/add_165/U9  ( .A1(\uut_baud_rate/add_165/n4 ), .A2(
        \uut_baud_rate/add_165/n5 ), .ZN(\uut_baud_rate/add_165/n117 ) );
  INV_X1 \uut_baud_rate/add_165/U8  ( .A(\uut_baud_rate/add_165/n2 ), .ZN(
        \uut_baud_rate/add_165/n52 ) );
  INV_X1 \uut_baud_rate/add_165/U7  ( .A(\uut_baud_rate/add_165/n2 ), .ZN(
        \uut_baud_rate/add_165/n3 ) );
  INV_X1 \uut_baud_rate/add_165/U6  ( .A(\uut_baud_rate/baud_count [5]), .ZN(
        \uut_baud_rate/add_165/n2 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U5  ( .A(\uut_baud_rate/baud_count [0]), 
        .Z(\uut_baud_rate/add_165/n29 ) );
  AND3_X1 \uut_baud_rate/add_165/U4  ( .A1(\uut_baud_rate/add_165/n13 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/add_165/n28 ), .ZN(
        \uut_baud_rate/add_165/n1 ) );
  CLKBUF_X3 \uut_baud_rate/add_165/U3  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_165/n49 ) );
  INV_X1 \uut_baud_rate/add_165/U2  ( .A(\uut_baud_rate/N12 ), .ZN(
        \uut_baud_rate/add_165/n47 ) );
  NAND4_X1 \uut_baud_rate/eq_147/U43  ( .A1(\uut_baud_rate/eq_147/n25 ), .A2(
        \uut_baud_rate/eq_147/n24 ), .A3(\uut_baud_rate/eq_147/n26 ), .A4(
        \uut_baud_rate/eq_147/n23 ), .ZN(\uut_baud_rate/eq_147/n1 ) );
  NAND4_X1 \uut_baud_rate/eq_147/U42  ( .A1(\uut_baud_rate/eq_147/n3 ), .A2(
        \uut_baud_rate/eq_147/n4 ), .A3(\uut_baud_rate/eq_147/n6 ), .A4(
        \uut_baud_rate/eq_147/n5 ), .ZN(\uut_baud_rate/eq_147/n2 ) );
  NOR2_X1 \uut_baud_rate/eq_147/U41  ( .A1(\uut_baud_rate/eq_147/n1 ), .A2(
        \uut_baud_rate/eq_147/n2 ), .ZN(\uut_baud_rate/baud_count_at_max ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U40  ( .A(baud_division[6]), .B(
        \uut_baud_rate/n3 ), .ZN(\uut_baud_rate/eq_147/n32 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U39  ( .A(baud_division[5]), .B(
        \uut_baud_rate/baud_count [5]), .ZN(\uut_baud_rate/eq_147/n33 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U38  ( .A(baud_division[3]), .B(
        \uut_baud_rate/baud_count [3]), .ZN(\uut_baud_rate/eq_147/n27 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U37  ( .A(baud_division[2]), .B(
        \uut_baud_rate/baud_count [2]), .ZN(\uut_baud_rate/eq_147/n29 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U36  ( .A(baud_division[8]), .B(
        \uut_baud_rate/baud_count [8]), .ZN(\uut_baud_rate/eq_147/n38 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U35  ( .A(baud_division[4]), .B(
        \uut_baud_rate/n5 ), .ZN(\uut_baud_rate/eq_147/n34 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U34  ( .A(baud_division[7]), .B(
        \uut_baud_rate/n34 ), .ZN(\uut_baud_rate/eq_147/n31 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U33  ( .A(baud_division[9]), .B(
        \uut_baud_rate/n38 ), .ZN(\uut_baud_rate/eq_147/n36 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U32  ( .A(baud_division[11]), .B(
        \uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/eq_147/n35 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U31  ( .A(baud_division[12]), .B(
        \uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/eq_147/n42 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U30  ( .A(baud_division[14]), .B(
        \uut_baud_rate/baud_count [14]), .ZN(\uut_baud_rate/eq_147/n40 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U29  ( .A(baud_division[13]), .B(
        \uut_baud_rate/baud_count [13]), .ZN(\uut_baud_rate/eq_147/n41 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U28  ( .A(\uut_baud_rate/baud_count [16]), 
        .B(baud_division[16]), .ZN(\uut_baud_rate/eq_147/n10 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U27  ( .A(\uut_baud_rate/baud_count [18]), 
        .B(baud_division[18]), .ZN(\uut_baud_rate/eq_147/n8 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U26  ( .A(baud_division[15]), .B(
        \uut_baud_rate/baud_count [15]), .ZN(\uut_baud_rate/eq_147/n39 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U25  ( .A(baud_division[17]), .B(
        \uut_baud_rate/baud_count [17]), .ZN(\uut_baud_rate/eq_147/n9 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U24  ( .A(\uut_baud_rate/baud_count [19]), 
        .B(baud_division[19]), .ZN(\uut_baud_rate/eq_147/n7 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U23  ( .A(\uut_baud_rate/baud_count [20]), 
        .B(baud_division[20]), .ZN(\uut_baud_rate/eq_147/n14 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U22  ( .A(\uut_baud_rate/baud_count [22]), 
        .B(baud_division[22]), .ZN(\uut_baud_rate/eq_147/n12 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U21  ( .A(baud_division[21]), .B(
        \uut_baud_rate/baud_count [21]), .ZN(\uut_baud_rate/eq_147/n13 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U20  ( .A(\uut_baud_rate/baud_count [23]), 
        .B(baud_division[23]), .ZN(\uut_baud_rate/eq_147/n11 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U19  ( .A(baud_division[24]), .B(
        \uut_baud_rate/baud_count [24]), .ZN(\uut_baud_rate/eq_147/n18 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U18  ( .A(\uut_baud_rate/baud_count [26]), 
        .B(baud_division[26]), .ZN(\uut_baud_rate/eq_147/n16 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U17  ( .A(baud_division[25]), .B(
        \uut_baud_rate/baud_count [25]), .ZN(\uut_baud_rate/eq_147/n17 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U16  ( .A(\uut_baud_rate/baud_count [27]), 
        .B(baud_division[27]), .ZN(\uut_baud_rate/eq_147/n15 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U15  ( .A(baud_division[0]), .B(
        \uut_baud_rate/n32 ), .ZN(\uut_baud_rate/eq_147/n30 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U14  ( .A(baud_division[28]), .B(
        \uut_baud_rate/n46 ), .ZN(\uut_baud_rate/eq_147/n22 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U13  ( .A(baud_division[30]), .B(
        \uut_baud_rate/baud_count [30]), .ZN(\uut_baud_rate/eq_147/n20 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U12  ( .A(baud_division[29]), .B(
        \uut_baud_rate/baud_count [29]), .ZN(\uut_baud_rate/eq_147/n21 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U11  ( .A(baud_division[31]), .B(
        \uut_baud_rate/baud_count [31]), .ZN(\uut_baud_rate/eq_147/n19 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U10  ( .A(baud_division[10]), .B(
        \uut_baud_rate/baud_count [10]), .ZN(\uut_baud_rate/eq_147/n37 ) );
  AND4_X1 \uut_baud_rate/eq_147/U9  ( .A1(\uut_baud_rate/eq_147/n9 ), .A2(
        \uut_baud_rate/eq_147/n10 ), .A3(\uut_baud_rate/eq_147/n7 ), .A4(
        \uut_baud_rate/eq_147/n8 ), .ZN(\uut_baud_rate/eq_147/n6 ) );
  AND4_X1 \uut_baud_rate/eq_147/U8  ( .A1(\uut_baud_rate/eq_147/n38 ), .A2(
        \uut_baud_rate/eq_147/n37 ), .A3(\uut_baud_rate/eq_147/n36 ), .A4(
        \uut_baud_rate/eq_147/n35 ), .ZN(\uut_baud_rate/eq_147/n24 ) );
  AND4_X1 \uut_baud_rate/eq_147/U7  ( .A1(\uut_baud_rate/eq_147/n41 ), .A2(
        \uut_baud_rate/eq_147/n42 ), .A3(\uut_baud_rate/eq_147/n39 ), .A4(
        \uut_baud_rate/eq_147/n40 ), .ZN(\uut_baud_rate/eq_147/n23 ) );
  AND4_X1 \uut_baud_rate/eq_147/U6  ( .A1(\uut_baud_rate/eq_147/n17 ), .A2(
        \uut_baud_rate/eq_147/n18 ), .A3(\uut_baud_rate/eq_147/n15 ), .A4(
        \uut_baud_rate/eq_147/n16 ), .ZN(\uut_baud_rate/eq_147/n4 ) );
  AND4_X1 \uut_baud_rate/eq_147/U5  ( .A1(\uut_baud_rate/eq_147/n33 ), .A2(
        \uut_baud_rate/eq_147/n34 ), .A3(\uut_baud_rate/eq_147/n32 ), .A4(
        \uut_baud_rate/eq_147/n31 ), .ZN(\uut_baud_rate/eq_147/n25 ) );
  XNOR2_X1 \uut_baud_rate/eq_147/U4  ( .A(baud_division[1]), .B(
        \uut_baud_rate/baud_count [1]), .ZN(\uut_baud_rate/eq_147/n28 ) );
  AND4_X1 \uut_baud_rate/eq_147/U3  ( .A1(\uut_baud_rate/eq_147/n29 ), .A2(
        \uut_baud_rate/eq_147/n30 ), .A3(\uut_baud_rate/eq_147/n27 ), .A4(
        \uut_baud_rate/eq_147/n28 ), .ZN(\uut_baud_rate/eq_147/n26 ) );
  AND4_X1 \uut_baud_rate/eq_147/U2  ( .A1(\uut_baud_rate/eq_147/n21 ), .A2(
        \uut_baud_rate/eq_147/n22 ), .A3(\uut_baud_rate/eq_147/n19 ), .A4(
        \uut_baud_rate/eq_147/n20 ), .ZN(\uut_baud_rate/eq_147/n3 ) );
  AND4_X2 \uut_baud_rate/eq_147/U1  ( .A1(\uut_baud_rate/eq_147/n13 ), .A2(
        \uut_baud_rate/eq_147/n14 ), .A3(\uut_baud_rate/eq_147/n11 ), .A4(
        \uut_baud_rate/eq_147/n12 ), .ZN(\uut_baud_rate/eq_147/n5 ) );
  OAI21_X1 \uut_tx/U94  ( .B1(\uut_tx/n12 ), .B2(\uut_tx/n38 ), .A(
        \uut_tx/n101 ), .ZN(\uut_tx/N76 ) );
  INV_X1 \uut_tx/U93  ( .A(\uut_tx/n100 ), .ZN(\uut_tx/n101 ) );
  OAI21_X1 \uut_tx/U92  ( .B1(\uut_tx/n12 ), .B2(\uut_tx/n41 ), .A(
        \uut_tx/n98 ), .ZN(\uut_tx/n62 ) );
  OAI21_X1 \uut_tx/U91  ( .B1(\uut_tx/n13 ), .B2(\uut_tx/n41 ), .A(
        \uut_tx/n97 ), .ZN(\uut_tx/n68 ) );
  OAI21_X1 \uut_tx/U90  ( .B1(\uut_tx/n14 ), .B2(\uut_tx/n41 ), .A(
        \uut_tx/n96 ), .ZN(\uut_tx/n63 ) );
  OAI21_X1 \uut_tx/U89  ( .B1(\uut_tx/n16 ), .B2(\uut_tx/n41 ), .A(
        \uut_tx/n94 ), .ZN(\uut_tx/n65 ) );
  OAI21_X1 \uut_tx/U88  ( .B1(\uut_tx/n17 ), .B2(\uut_tx/n41 ), .A(
        \uut_tx/n93 ), .ZN(\uut_tx/n66 ) );
  OAI21_X1 \uut_tx/U87  ( .B1(\uut_tx/n18 ), .B2(\uut_tx/n41 ), .A(
        \uut_tx/n92 ), .ZN(\uut_tx/n67 ) );
  INV_X1 \uut_tx/U86  ( .A(\uut_tx/n91 ), .ZN(\uut_tx/n99 ) );
  INV_X1 \uut_tx/U85  ( .A(\uut_tx/n90 ), .ZN(\uut_tx/n102 ) );
  AOI22_X1 \uut_tx/U84  ( .A1(\uut_tx/data_save [0]), .A2(\uut_tx/n32 ), .B1(
        data_out[0]), .B2(\uut_tx/n33 ), .ZN(\uut_tx/n90 ) );
  AND2_X1 \uut_tx/U83  ( .A1(\uut_tx/next_state [0]), .A2(\uut_tx/n88 ), .ZN(
        \uut_tx/N67 ) );
  NAND2_X1 \uut_tx/U82  ( .A1(\uut_tx/n84 ), .A2(\uut_tx/n83 ), .ZN(
        \uut_tx/N80 ) );
  AOI22_X1 \uut_tx/U81  ( .A1(enable), .A2(\uut_tx/n4 ), .B1(
        \uut_tx/count_16_indication ), .B2(\uut_tx/n38 ), .ZN(\uut_tx/n83 ) );
  AOI21_X1 \uut_tx/U80  ( .B1(\uut_tx/count_8_indication ), .B2(\uut_tx/n82 ), 
        .A(rst), .ZN(\uut_tx/n84 ) );
  INV_X1 \uut_tx/U79  ( .A(\uut_tx/n89 ), .ZN(\uut_tx/n82 ) );
  NAND2_X1 \uut_tx/U78  ( .A1(\uut_tx/n21 ), .A2(\uut_tx/n27 ), .ZN(
        \uut_tx/n89 ) );
  NOR3_X1 \uut_tx/U77  ( .A1(\uut_tx/n4 ), .A2(rst), .A3(\uut_tx/n81 ), .ZN(
        \uut_tx/N37 ) );
  NOR3_X1 \uut_tx/U76  ( .A1(\uut_tx/n29 ), .A2(\uut_tx/n28 ), .A3(
        \uut_tx/n81 ), .ZN(\uut_tx/N55 ) );
  OAI22_X1 \uut_tx/U75  ( .A1(\uut_tx/n19 ), .A2(\uut_tx/n79 ), .B1(
        \uut_tx/n78 ), .B2(\uut_tx/n77 ), .ZN(\uut_tx/n69 ) );
  NOR2_X1 \uut_tx/U74  ( .A1(\uut_tx/n76 ), .A2(\uut_tx/n61 ), .ZN(
        \uut_tx/n79 ) );
  MUX2_X1 \uut_tx/U73  ( .A(\uut_tx/n60 ), .B(\uut_tx/n59 ), .S(\uut_tx/n78 ), 
        .Z(\uut_tx/n70 ) );
  INV_X1 \uut_tx/U72  ( .A(\uut_tx/n77 ), .ZN(\uut_tx/n59 ) );
  NAND3_X1 \uut_tx/U71  ( .A1(\uut_tx/n61 ), .A2(\uut_tx/n26 ), .A3(
        \uut_tx/n85 ), .ZN(\uut_tx/n77 ) );
  INV_X1 \uut_tx/U70  ( .A(\uut_tx/n58 ), .ZN(\uut_tx/n61 ) );
  OAI21_X1 \uut_tx/U69  ( .B1(\uut_tx/n26 ), .B2(\uut_tx/n58 ), .A(
        \uut_tx/n85 ), .ZN(\uut_tx/n60 ) );
  MUX2_X1 \uut_tx/U68  ( .A(\uut_tx/n76 ), .B(\uut_tx/n57 ), .S(\uut_tx/n22 ), 
        .Z(\uut_tx/n71 ) );
  NOR2_X1 \uut_tx/U67  ( .A1(\uut_tx/n76 ), .A2(\uut_tx/n58 ), .ZN(
        \uut_tx/n57 ) );
  NAND2_X1 \uut_tx/U66  ( .A1(\uut_tx/n36 ), .A2(\uut_tx/n28 ), .ZN(
        \uut_tx/n58 ) );
  NAND3_X1 \uut_tx/U65  ( .A1(\uut_tx/count_8 [2]), .A2(\uut_tx/count_8 [0]), 
        .A3(\uut_tx/count_8 [1]), .ZN(\uut_tx/n86 ) );
  INV_X1 \uut_tx/U64  ( .A(\uut_tx/n85 ), .ZN(\uut_tx/n76 ) );
  NAND2_X1 \uut_tx/U63  ( .A1(\uut_tx/n36 ), .A2(\uut_tx/n81 ), .ZN(
        \uut_tx/n85 ) );
  NAND2_X1 \uut_tx/U62  ( .A1(\uut_tx/n35 ), .A2(\uut_tx/n7 ), .ZN(
        \uut_tx/n81 ) );
  NAND2_X1 \uut_tx/U61  ( .A1(\uut_tx/n34 ), .A2(\uut_tx/current_state [1]), 
        .ZN(\uut_tx/n87 ) );
  NAND2_X1 \uut_tx/U60  ( .A1(\uut_tx/n53 ), .A2(\uut_tx/n54 ), .ZN(
        \uut_tx/n72 ) );
  OAI21_X1 \uut_tx/U59  ( .B1(\uut_tx/n52 ), .B2(\uut_tx/n8 ), .A(\uut_tx/n51 ), .ZN(\uut_tx/n53 ) );
  NAND3_X1 \uut_tx/U58  ( .A1(\uut_tx/count_16 [2]), .A2(\uut_tx/n30 ), .A3(
        \uut_tx/n10 ), .ZN(\uut_tx/n54 ) );
  MUX2_X1 \uut_tx/U57  ( .A(\uut_tx/n52 ), .B(\uut_tx/n49 ), .S(\uut_tx/n9 ), 
        .Z(\uut_tx/n73 ) );
  NOR2_X1 \uut_tx/U56  ( .A1(\uut_tx/n48 ), .A2(\uut_tx/n50 ), .ZN(
        \uut_tx/n49 ) );
  OAI21_X1 \uut_tx/U55  ( .B1(\uut_tx/n30 ), .B2(\uut_tx/n47 ), .A(
        \uut_tx/n46 ), .ZN(\uut_tx/n52 ) );
  OAI22_X1 \uut_tx/U54  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n50 ), .B1(
        \uut_tx/n46 ), .B2(\uut_tx/n48 ), .ZN(\uut_tx/n74 ) );
  INV_X1 \uut_tx/U53  ( .A(\uut_tx/n45 ), .ZN(\uut_tx/n46 ) );
  OAI21_X1 \uut_tx/U52  ( .B1(\uut_tx/n47 ), .B2(\uut_tx/n23 ), .A(
        \uut_tx/n44 ), .ZN(\uut_tx/n45 ) );
  NAND3_X1 \uut_tx/U51  ( .A1(\uut_tx/n23 ), .A2(\uut_tx/n8 ), .A3(
        \uut_tx/n44 ), .ZN(\uut_tx/n50 ) );
  MUX2_X1 \uut_tx/U50  ( .A(\uut_tx/n3 ), .B(\uut_tx/n43 ), .S(\uut_tx/n11 ), 
        .Z(\uut_tx/n75 ) );
  NOR2_X1 \uut_tx/U49  ( .A1(\uut_tx/n3 ), .A2(\uut_tx/n47 ), .ZN(\uut_tx/n43 ) );
  NAND4_X1 \uut_tx/U48  ( .A1(\uut_tx/count_16 [2]), .A2(\uut_tx/count_16 [1]), 
        .A3(\uut_tx/n51 ), .A4(\uut_tx/count_16 [0]), .ZN(\uut_tx/n56 ) );
  NAND2_X1 \uut_tx/U47  ( .A1(\uut_tx/n55 ), .A2(\uut_tx/n20 ), .ZN(
        \uut_tx/n80 ) );
  INV_X1 \uut_tx/U46  ( .A(\uut_tx/current_state [0]), .ZN(\uut_tx/n55 ) );
  NAND2_X1 \uut_tx/U45  ( .A1(\uut_tx/n42 ), .A2(\uut_tx/n88 ), .ZN(
        \uut_tx/n44 ) );
  INV_X1 \uut_tx/U44  ( .A(baud_tick), .ZN(\uut_tx/n42 ) );
  AND2_X1 \uut_tx/U43  ( .A1(\uut_tx/next_state [1]), .A2(\uut_tx/n88 ), .ZN(
        \uut_tx/N68 ) );
  INV_X1 \uut_tx/U42  ( .A(rst), .ZN(\uut_tx/n88 ) );
  NOR2_X1 \uut_tx/U41  ( .A1(rst), .A2(\uut_tx/n100 ), .ZN(\uut_tx/N82 ) );
  XOR2_X1 \uut_tx/U40  ( .A(\uut_tx/n6 ), .B(\uut_tx/n38 ), .Z(\uut_tx/n100 )
         );
  AND2_X1 \uut_tx/U39  ( .A1(\uut_tx/n99 ), .A2(\uut_tx/n36 ), .ZN(
        \uut_tx/n40 ) );
  INV_X1 \uut_tx/U38  ( .A(\uut_tx/n27 ), .ZN(\uut_tx/n38 ) );
  OR2_X1 \uut_tx/U37  ( .A1(\uut_tx/n87 ), .A2(\uut_tx/n86 ), .ZN(\uut_tx/n37 ) );
  AND2_X1 \uut_tx/U36  ( .A1(\uut_tx/n25 ), .A2(\uut_tx/n21 ), .ZN(
        \uut_tx/n36 ) );
  AND2_X1 \uut_tx/U35  ( .A1(\uut_tx/n89 ), .A2(\uut_tx/n88 ), .ZN(
        \uut_tx/n33 ) );
  AND2_X2 \uut_tx/U34  ( .A1(\uut_tx/n99 ), .A2(\uut_tx/n36 ), .ZN(
        \uut_tx/n39 ) );
  AOI22_X1 \uut_tx/U33  ( .A1(data_out[7]), .A2(\uut_tx/n33 ), .B1(
        \uut_tx/n40 ), .B2(\uut_tx/data_save [6]), .ZN(\uut_tx/n98 ) );
  AOI22_X1 \uut_tx/U32  ( .A1(data_out[5]), .A2(\uut_tx/n33 ), .B1(
        \uut_tx/n40 ), .B2(\uut_tx/data_save [4]), .ZN(\uut_tx/n96 ) );
  AOI22_X1 \uut_tx/U31  ( .A1(data_out[6]), .A2(\uut_tx/n33 ), .B1(
        \uut_tx/n40 ), .B2(\uut_tx/data_save [5]), .ZN(\uut_tx/n97 ) );
  AOI22_X1 \uut_tx/U30  ( .A1(data_out[4]), .A2(\uut_tx/n33 ), .B1(
        \uut_tx/n39 ), .B2(\uut_tx/data_save [3]), .ZN(\uut_tx/n95 ) );
  AOI22_X1 \uut_tx/U29  ( .A1(data_out[1]), .A2(\uut_tx/n33 ), .B1(
        \uut_tx/n39 ), .B2(\uut_tx/data_save [0]), .ZN(\uut_tx/n92 ) );
  AOI22_X1 \uut_tx/U28  ( .A1(data_out[2]), .A2(\uut_tx/n33 ), .B1(
        \uut_tx/n39 ), .B2(\uut_tx/data_save [1]), .ZN(\uut_tx/n93 ) );
  AOI22_X1 \uut_tx/U27  ( .A1(data_out[3]), .A2(\uut_tx/n33 ), .B1(
        \uut_tx/n39 ), .B2(\uut_tx/data_save [2]), .ZN(\uut_tx/n94 ) );
  OAI21_X1 \uut_tx/U26  ( .B1(\uut_tx/n31 ), .B2(\uut_tx/n5 ), .A(\uut_tx/n37 ), .ZN(\uut_tx/n91 ) );
  CLKBUF_X1 \uut_tx/U25  ( .A(\uut_tx/n99 ), .Z(\uut_tx/n41 ) );
  OAI21_X1 \uut_tx/U24  ( .B1(\uut_tx/n41 ), .B2(\uut_tx/n15 ), .A(
        \uut_tx/n95 ), .ZN(\uut_tx/n64 ) );
  CLKBUF_X1 \uut_tx/U23  ( .A(\uut_tx/n91 ), .Z(\uut_tx/n32 ) );
  AND2_X1 \uut_tx/U22  ( .A1(\uut_tx/n35 ), .A2(\uut_tx/n7 ), .ZN(\uut_tx/n31 ) );
  CLKBUF_X1 \uut_tx/U21  ( .A(\uut_tx/count_16 [1]), .Z(\uut_tx/n30 ) );
  INV_X1 \uut_tx/U20  ( .A(\uut_tx/n36 ), .ZN(\uut_tx/n29 ) );
  NAND3_X1 \uut_tx/U19  ( .A1(\uut_tx/count_8 [2]), .A2(\uut_tx/count_8 [0]), 
        .A3(\uut_tx/count_8 [1]), .ZN(\uut_tx/n28 ) );
  INV_X1 \uut_tx/U18  ( .A(\uut_tx/current_state [0]), .ZN(\uut_tx/n27 ) );
  INV_X1 \uut_tx/U17  ( .A(\uut_tx/n22 ), .ZN(\uut_tx/n26 ) );
  AND2_X1 \uut_tx/U16  ( .A1(\uut_tx/n24 ), .A2(\uut_tx/n88 ), .ZN(
        \uut_tx/n25 ) );
  INV_X1 \uut_tx/U15  ( .A(\uut_tx/n11 ), .ZN(\uut_tx/n23 ) );
  AND2_X1 \uut_tx/U14  ( .A1(\uut_tx/n24 ), .A2(\uut_tx/n88 ), .ZN(
        \uut_tx/n34 ) );
  INV_X1 \uut_tx/U13  ( .A(\uut_tx/n20 ), .ZN(\uut_tx/n21 ) );
  AND3_X1 \uut_tx/U12  ( .A1(\uut_tx/n44 ), .A2(\uut_tx/n8 ), .A3(\uut_tx/n23 ), .ZN(\uut_tx/n10 ) );
  NAND3_X1 \uut_tx/U11  ( .A1(\uut_tx/n80 ), .A2(\uut_tx/n56 ), .A3(
        \uut_tx/n88 ), .ZN(\uut_tx/n47 ) );
  AND3_X1 \uut_tx/U10  ( .A1(\uut_tx/n80 ), .A2(\uut_tx/n88 ), .A3(
        \uut_tx/n56 ), .ZN(\uut_tx/n8 ) );
  BUF_X1 \uut_tx/U9  ( .A(baud_tick), .Z(\uut_tx/n7 ) );
  CLKBUF_X1 \uut_tx/U8  ( .A(\uut_tx/n20 ), .Z(\uut_tx/n6 ) );
  AND4_X1 \uut_tx/U7  ( .A1(\uut_tx/count_16 [2]), .A2(\uut_tx/count_16 [1]), 
        .A3(\uut_tx/n2 ), .A4(\uut_tx/count_16 [0]), .ZN(\uut_tx/n35 ) );
  BUF_X1 \uut_tx/U6  ( .A(\uut_tx/n87 ), .Z(\uut_tx/n5 ) );
  AND2_X1 \uut_tx/U5  ( .A1(\uut_tx/n55 ), .A2(\uut_tx/n20 ), .ZN(\uut_tx/n4 )
         );
  AND2_X1 \uut_tx/U4  ( .A1(\uut_tx/n42 ), .A2(\uut_tx/n88 ), .ZN(\uut_tx/n3 )
         );
  INV_X1 \uut_tx/U3  ( .A(\uut_tx/n1 ), .ZN(\uut_tx/n2 ) );
  DFF_X1 \uut_tx/data_save_reg[5]  ( .D(\uut_tx/n63 ), .CK(clk), .Q(
        \uut_tx/data_save [5]), .QN(\uut_tx/n14 ) );
  DFF_X1 \uut_tx/data_save_reg[6]  ( .D(\uut_tx/n68 ), .CK(clk), .Q(
        \uut_tx/data_save [6]), .QN(\uut_tx/n13 ) );
  DFF_X1 \uut_tx/data_save_reg[7]  ( .D(\uut_tx/n62 ), .CK(clk), .QN(
        \uut_tx/n12 ) );
  DFF_X1 \uut_tx/data_save_reg[4]  ( .D(\uut_tx/n64 ), .CK(clk), .Q(
        \uut_tx/data_save [4]), .QN(\uut_tx/n15 ) );
  DFF_X1 \uut_tx/data_save_reg[3]  ( .D(\uut_tx/n65 ), .CK(clk), .Q(
        \uut_tx/data_save [3]), .QN(\uut_tx/n16 ) );
  DFF_X1 \uut_tx/data_save_reg[2]  ( .D(\uut_tx/n66 ), .CK(clk), .Q(
        \uut_tx/data_save [2]), .QN(\uut_tx/n17 ) );
  DFF_X1 \uut_tx/data_save_reg[1]  ( .D(\uut_tx/n67 ), .CK(clk), .Q(
        \uut_tx/data_save [1]), .QN(\uut_tx/n18 ) );
  DFF_X1 \uut_tx/count_16_reg[3]  ( .D(\uut_tx/n72 ), .CK(clk), .Q(
        \uut_tx/n51 ), .QN(\uut_tx/n1 ) );
  DFF_X1 \uut_tx/count_16_reg[1]  ( .D(\uut_tx/n74 ), .CK(clk), .Q(
        \uut_tx/count_16 [1]), .QN(\uut_tx/n48 ) );
  DFF_X1 \uut_tx/count_16_reg[2]  ( .D(\uut_tx/n73 ), .CK(clk), .Q(
        \uut_tx/count_16 [2]), .QN(\uut_tx/n9 ) );
  DFF_X1 \uut_tx/count_8_reg[0]  ( .D(\uut_tx/n71 ), .CK(clk), .Q(
        \uut_tx/count_8 [0]), .QN(\uut_tx/n22 ) );
  DFF_X1 \uut_tx/count_8_reg[1]  ( .D(\uut_tx/n70 ), .CK(clk), .Q(
        \uut_tx/count_8 [1]), .QN(\uut_tx/n78 ) );
  DFF_X1 \uut_tx/count_8_indication_reg  ( .D(\uut_tx/N55 ), .CK(clk), .Q(
        \uut_tx/count_8_indication ) );
  DLL_X1 \uut_tx/tx_reg  ( .D(\uut_tx/N76 ), .GN(rst), .Q(tx) );
  DFF_X1 \uut_tx/data_save_reg[0]  ( .D(\uut_tx/n102 ), .CK(clk), .Q(
        \uut_tx/data_save [0]) );
  DFF_X1 \uut_tx/count_8_reg[2]  ( .D(\uut_tx/n69 ), .CK(clk), .Q(
        \uut_tx/count_8 [2]), .QN(\uut_tx/n19 ) );
  DFF_X1 \uut_tx/current_state_reg[1]  ( .D(\uut_tx/N68 ), .CK(clk), .Q(
        \uut_tx/current_state [1]), .QN(\uut_tx/n20 ) );
  DLH_X1 \uut_tx/next_state_reg[1]  ( .G(\uut_tx/N80 ), .D(\uut_tx/N82 ), .Q(
        \uut_tx/next_state [1]) );
  DFF_X1 \uut_tx/count_16_indication_reg  ( .D(\uut_tx/N37 ), .CK(clk), .Q(
        \uut_tx/count_16_indication ) );
  DFF_X1 \uut_tx/count_16_reg[0]  ( .D(\uut_tx/n75 ), .CK(clk), .Q(
        \uut_tx/count_16 [0]), .QN(\uut_tx/n11 ) );
  DFF_X1 \uut_tx/current_state_reg[0]  ( .D(\uut_tx/N67 ), .CK(clk), .Q(
        \uut_tx/current_state [0]), .QN(\uut_tx/n24 ) );
  DLH_X1 \uut_tx/next_state_reg[0]  ( .G(\uut_tx/N80 ), .D(\uut_tx/n25 ), .Q(
        \uut_tx/next_state [0]) );
  NOR2_X1 \uut_rx/U88  ( .A1(rst), .A2(\uut_rx/n84 ), .ZN(\uut_rx/N86 ) );
  MUX2_X1 \uut_rx/U87  ( .A(\uut_rx/n25 ), .B(\uut_rx/data_save [7]), .S(
        \uut_rx/n83 ), .Z(\uut_rx/n85 ) );
  MUX2_X1 \uut_rx/U86  ( .A(\uut_rx/n27 ), .B(\uut_rx/data_save [6]), .S(
        \uut_rx/n37 ), .Z(\uut_rx/n86 ) );
  MUX2_X1 \uut_rx/U85  ( .A(\uut_rx/n28 ), .B(\uut_rx/data_save [5]), .S(
        \uut_rx/n37 ), .Z(\uut_rx/n87 ) );
  MUX2_X1 \uut_rx/U84  ( .A(\uut_rx/n29 ), .B(\uut_rx/data_save [4]), .S(
        \uut_rx/n37 ), .Z(\uut_rx/n88 ) );
  MUX2_X1 \uut_rx/U83  ( .A(\uut_rx/n30 ), .B(\uut_rx/data_save [3]), .S(
        \uut_rx/n83 ), .Z(\uut_rx/n89 ) );
  MUX2_X1 \uut_rx/U82  ( .A(\uut_rx/n31 ), .B(\uut_rx/data_save [2]), .S(
        \uut_rx/n83 ), .Z(\uut_rx/n90 ) );
  MUX2_X1 \uut_rx/U81  ( .A(\uut_rx/n32 ), .B(\uut_rx/data_save [1]), .S(
        \uut_rx/n83 ), .Z(\uut_rx/n91 ) );
  MUX2_X1 \uut_rx/U80  ( .A(\uut_rx/n80 ), .B(\uut_rx/n81 ), .S(\uut_rx/n37 ), 
        .Z(\uut_rx/n71 ) );
  INV_X1 \uut_rx/U79  ( .A(\uut_rx/n36 ), .ZN(\uut_rx/n83 ) );
  OAI21_X1 \uut_rx/U78  ( .B1(\uut_rx/n35 ), .B2(\uut_rx/n77 ), .A(
        \uut_rx/n82 ), .ZN(\uut_rx/n79 ) );
  NOR2_X1 \uut_rx/U77  ( .A1(rst), .A2(\uut_rx/n76 ), .ZN(\uut_rx/n80 ) );
  INV_X1 \uut_rx/U76  ( .A(rx), .ZN(\uut_rx/n76 ) );
  AND2_X1 \uut_rx/U75  ( .A1(\uut_rx/next_state [0]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/N87 ) );
  NAND4_X1 \uut_rx/U74  ( .A1(\uut_rx/n75 ), .A2(\uut_rx/n82 ), .A3(
        \uut_rx/n74 ), .A4(\uut_rx/n67 ), .ZN(\uut_rx/N100 ) );
  OAI211_X1 \uut_rx/U73  ( .C1(\uut_rx/n26 ), .C2(\uut_rx/count_16_indication ), .A(\uut_rx/n76 ), .B(\uut_rx/n24 ), .ZN(\uut_rx/n67 ) );
  NAND2_X1 \uut_rx/U72  ( .A1(\uut_rx/count_8_indication ), .A2(\uut_rx/n66 ), 
        .ZN(\uut_rx/n74 ) );
  INV_X1 \uut_rx/U71  ( .A(\uut_rx/n77 ), .ZN(\uut_rx/n66 ) );
  NAND4_X1 \uut_rx/U70  ( .A1(\uut_rx/current_state [0]), .A2(
        \uut_rx/current_state [1]), .A3(\uut_rx/count_16_indication ), .A4(rx), 
        .ZN(\uut_rx/n75 ) );
  NOR3_X1 \uut_rx/U69  ( .A1(\uut_rx/n65 ), .A2(\uut_rx/n78 ), .A3(
        \uut_rx/n64 ), .ZN(\uut_rx/N67 ) );
  OAI22_X1 \uut_rx/U68  ( .A1(\uut_rx/n18 ), .A2(\uut_rx/n63 ), .B1(
        \uut_rx/n61 ), .B2(\uut_rx/n62 ), .ZN(\uut_rx/n68 ) );
  NOR2_X1 \uut_rx/U67  ( .A1(\uut_rx/n34 ), .A2(\uut_rx/n11 ), .ZN(
        \uut_rx/n63 ) );
  NAND3_X1 \uut_rx/U66  ( .A1(\uut_rx/n11 ), .A2(\uut_rx/count_8 [0]), .A3(
        \uut_rx/n59 ), .ZN(\uut_rx/n61 ) );
  OAI21_X1 \uut_rx/U65  ( .B1(\uut_rx/count_8 [0]), .B2(\uut_rx/n58 ), .A(
        \uut_rx/n59 ), .ZN(\uut_rx/n60 ) );
  MUX2_X1 \uut_rx/U64  ( .A(\uut_rx/n34 ), .B(\uut_rx/n57 ), .S(\uut_rx/n21 ), 
        .Z(\uut_rx/n70 ) );
  NOR2_X1 \uut_rx/U63  ( .A1(\uut_rx/n34 ), .A2(\uut_rx/n58 ), .ZN(
        \uut_rx/n57 ) );
  NAND2_X1 \uut_rx/U62  ( .A1(\uut_rx/n1 ), .A2(\uut_rx/n64 ), .ZN(
        \uut_rx/n58 ) );
  NAND3_X1 \uut_rx/U61  ( .A1(\uut_rx/count_8 [2]), .A2(\uut_rx/count_8 [0]), 
        .A3(\uut_rx/count_8 [1]), .ZN(\uut_rx/n64 ) );
  NAND2_X1 \uut_rx/U60  ( .A1(\uut_rx/n1 ), .A2(\uut_rx/n78 ), .ZN(
        \uut_rx/n59 ) );
  NOR3_X1 \uut_rx/U59  ( .A1(\uut_rx/n56 ), .A2(rst), .A3(\uut_rx/n55 ), .ZN(
        \uut_rx/N48 ) );
  AOI22_X1 \uut_rx/U58  ( .A1(\uut_rx/n54 ), .A2(\uut_rx/n23 ), .B1(
        \uut_rx/n19 ), .B2(\uut_rx/current_state [1]), .ZN(\uut_rx/n56 ) );
  INV_X1 \uut_rx/U57  ( .A(\uut_rx/n53 ), .ZN(\uut_rx/n54 ) );
  MUX2_X1 \uut_rx/U56  ( .A(\uut_rx/n52 ), .B(\uut_rx/n51 ), .S(\uut_rx/n45 ), 
        .Z(\uut_rx/n73 ) );
  NOR2_X1 \uut_rx/U55  ( .A1(\uut_rx/n5 ), .A2(\uut_rx/n49 ), .ZN(\uut_rx/n51 ) );
  OAI22_X1 \uut_rx/U54  ( .A1(\uut_rx/n48 ), .A2(\uut_rx/n8 ), .B1(
        \uut_rx/n47 ), .B2(\uut_rx/n44 ), .ZN(\uut_rx/n72 ) );
  INV_X1 \uut_rx/U53  ( .A(\uut_rx/n52 ), .ZN(\uut_rx/n47 ) );
  OAI21_X1 \uut_rx/U52  ( .B1(\uut_rx/n49 ), .B2(\uut_rx/n10 ), .A(
        \uut_rx/n13 ), .ZN(\uut_rx/n52 ) );
  AOI21_X1 \uut_rx/U51  ( .B1(\uut_rx/count_16 [3]), .B2(\uut_rx/n45 ), .A(
        \uut_rx/n23 ), .ZN(\uut_rx/n48 ) );
  MUX2_X1 \uut_rx/U50  ( .A(\uut_rx/n46 ), .B(\uut_rx/n43 ), .S(\uut_rx/n15 ), 
        .Z(\uut_rx/n16 ) );
  NOR2_X1 \uut_rx/U49  ( .A1(\uut_rx/n49 ), .A2(\uut_rx/n42 ), .ZN(
        \uut_rx/n43 ) );
  NAND2_X1 \uut_rx/U48  ( .A1(\uut_rx/n41 ), .A2(\uut_rx/n2 ), .ZN(
        \uut_rx/n46 ) );
  NAND3_X1 \uut_rx/U47  ( .A1(\uut_rx/n39 ), .A2(\uut_rx/n82 ), .A3(
        \uut_rx/n42 ), .ZN(\uut_rx/n41 ) );
  OAI22_X1 \uut_rx/U46  ( .A1(\uut_rx/n9 ), .A2(\uut_rx/n8 ), .B1(\uut_rx/n42 ), .B2(\uut_rx/n2 ), .ZN(\uut_rx/n14 ) );
  NAND3_X1 \uut_rx/U45  ( .A1(\uut_rx/n39 ), .A2(\uut_rx/n82 ), .A3(
        \uut_rx/n40 ), .ZN(\uut_rx/n49 ) );
  NAND2_X1 \uut_rx/U44  ( .A1(\uut_rx/n82 ), .A2(\uut_rx/n55 ), .ZN(
        \uut_rx/n40 ) );
  INV_X1 \uut_rx/U43  ( .A(baud_tick), .ZN(\uut_rx/n55 ) );
  OAI21_X1 \uut_rx/U42  ( .B1(\uut_rx/n38 ), .B2(\uut_rx/n26 ), .A(
        \uut_rx/n24 ), .ZN(\uut_rx/n39 ) );
  NOR3_X1 \uut_rx/U41  ( .A1(\uut_rx/n50 ), .A2(\uut_rx/count_16 [3]), .A3(
        \uut_rx/n45 ), .ZN(\uut_rx/n38 ) );
  NAND2_X1 \uut_rx/U40  ( .A1(\uut_rx/count_16 [0]), .A2(\uut_rx/n33 ), .ZN(
        \uut_rx/n50 ) );
  AND2_X1 \uut_rx/U39  ( .A1(\uut_rx/next_state [1]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/N88 ) );
  AOI21_X1 \uut_rx/U38  ( .B1(\uut_rx/n53 ), .B2(\uut_rx/n77 ), .A(rst), .ZN(
        \uut_rx/N102 ) );
  NAND2_X1 \uut_rx/U37  ( .A1(\uut_rx/n26 ), .A2(\uut_rx/current_state [1]), 
        .ZN(\uut_rx/n77 ) );
  NAND2_X1 \uut_rx/U36  ( .A1(\uut_rx/n24 ), .A2(\uut_rx/current_state [0]), 
        .ZN(\uut_rx/n53 ) );
  INV_X1 \uut_rx/U35  ( .A(\uut_rx/n79 ), .ZN(\uut_rx/n37 ) );
  INV_X1 \uut_rx/U34  ( .A(rst), .ZN(\uut_rx/n82 ) );
  OAI21_X1 \uut_rx/U33  ( .B1(\uut_rx/n35 ), .B2(\uut_rx/n77 ), .A(
        \uut_rx/n82 ), .ZN(\uut_rx/n36 ) );
  AND2_X1 \uut_rx/U32  ( .A1(\uut_rx/n1 ), .A2(\uut_rx/n78 ), .ZN(\uut_rx/n34 ) );
  AND2_X1 \uut_rx/U31  ( .A1(\uut_rx/n81 ), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n32 ) );
  AND2_X1 \uut_rx/U30  ( .A1(\uut_rx/data_save [1]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n31 ) );
  AND2_X1 \uut_rx/U29  ( .A1(\uut_rx/data_save [2]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n30 ) );
  AND2_X1 \uut_rx/U28  ( .A1(\uut_rx/data_save [3]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n29 ) );
  AND2_X1 \uut_rx/U27  ( .A1(\uut_rx/data_save [4]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n28 ) );
  AND2_X1 \uut_rx/U26  ( .A1(\uut_rx/data_save [5]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n27 ) );
  AND2_X1 \uut_rx/U25  ( .A1(\uut_rx/data_save [6]), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n25 ) );
  AND2_X1 \uut_rx/U24  ( .A1(\uut_rx/n20 ), .A2(\uut_rx/n44 ), .ZN(
        \uut_rx/n23 ) );
  NAND2_X1 \uut_rx/U23  ( .A1(\uut_rx/n33 ), .A2(\uut_rx/count_16 [0]), .ZN(
        \uut_rx/n22 ) );
  NOR2_X1 \uut_rx/U22  ( .A1(\uut_rx/n22 ), .A2(\uut_rx/n45 ), .ZN(
        \uut_rx/n20 ) );
  AND2_X1 \uut_rx/U21  ( .A1(\uut_rx/n82 ), .A2(\uut_rx/n26 ), .ZN(
        \uut_rx/n17 ) );
  AND2_X1 \uut_rx/U20  ( .A1(\uut_rx/n41 ), .A2(\uut_rx/n40 ), .ZN(
        \uut_rx/n13 ) );
  AND3_X1 \uut_rx/U19  ( .A1(\uut_rx/n11 ), .A2(\uut_rx/count_8 [0]), .A3(
        \uut_rx/n59 ), .ZN(\uut_rx/n12 ) );
  AND2_X1 \uut_rx/U18  ( .A1(\uut_rx/n1 ), .A2(\uut_rx/n64 ), .ZN(\uut_rx/n11 ) );
  INV_X1 \uut_rx/U17  ( .A(\uut_rx/n15 ), .ZN(\uut_rx/n10 ) );
  AND2_X1 \uut_rx/U16  ( .A1(\uut_rx/n20 ), .A2(\uut_rx/count_16 [3]), .ZN(
        \uut_rx/n19 ) );
  INV_X1 \uut_rx/U15  ( .A(\uut_rx/n42 ), .ZN(\uut_rx/n9 ) );
  MUX2_X1 \uut_rx/U14  ( .A(\uut_rx/n12 ), .B(\uut_rx/n60 ), .S(
        \uut_rx/count_8 [1]), .Z(\uut_rx/n69 ) );
  AND2_X1 \uut_rx/U13  ( .A1(baud_tick), .A2(\uut_rx/count_16 [3]), .ZN(
        \uut_rx/n7 ) );
  NAND2_X1 \uut_rx/U12  ( .A1(\uut_rx/n6 ), .A2(\uut_rx/n7 ), .ZN(\uut_rx/n78 ) );
  NOR2_X1 \uut_rx/U11  ( .A1(\uut_rx/n22 ), .A2(\uut_rx/n45 ), .ZN(\uut_rx/n6 ) );
  CLKBUF_X1 \uut_rx/U10  ( .A(\uut_rx/n50 ), .Z(\uut_rx/n5 ) );
  AND2_X1 \uut_rx/U9  ( .A1(baud_tick), .A2(\uut_rx/count_16 [3]), .ZN(
        \uut_rx/n4 ) );
  NAND2_X1 \uut_rx/U8  ( .A1(\uut_rx/n3 ), .A2(\uut_rx/n4 ), .ZN(\uut_rx/n35 )
         );
  NOR2_X1 \uut_rx/U7  ( .A1(\uut_rx/n22 ), .A2(\uut_rx/n45 ), .ZN(\uut_rx/n3 )
         );
  CLKBUF_X1 \uut_rx/U6  ( .A(\uut_rx/n49 ), .Z(\uut_rx/n8 ) );
  CLKBUF_X1 \uut_rx/U5  ( .A(\uut_rx/n40 ), .Z(\uut_rx/n2 ) );
  AND2_X2 \uut_rx/U4  ( .A1(\uut_rx/n17 ), .A2(\uut_rx/current_state [1]), 
        .ZN(\uut_rx/n1 ) );
  INV_X1 \uut_rx/U3  ( .A(\uut_rx/n1 ), .ZN(\uut_rx/n65 ) );
  DFF_X1 \uut_rx/count_16_reg[0]  ( .D(\uut_rx/n14 ), .CK(clk), .Q(
        \uut_rx/count_16 [0]), .QN(\uut_rx/n42 ) );
  DFF_X1 \uut_rx/count_16_reg[1]  ( .D(\uut_rx/n16 ), .CK(clk), .Q(
        \uut_rx/n33 ), .QN(\uut_rx/n15 ) );
  DFF_X1 \uut_rx/data_save_reg[0]  ( .D(\uut_rx/n71 ), .CK(clk), .Q(
        \uut_rx/n81 ) );
  DFF_X1 \uut_rx/data_save_reg[4]  ( .D(\uut_rx/n88 ), .CK(clk), .Q(
        \uut_rx/data_save [4]) );
  DFF_X1 \uut_rx/data_save_reg[5]  ( .D(\uut_rx/n87 ), .CK(clk), .Q(
        \uut_rx/data_save [5]) );
  DFF_X1 \uut_rx/data_save_reg[6]  ( .D(\uut_rx/n86 ), .CK(clk), .Q(
        \uut_rx/data_save [6]) );
  DFF_X1 \uut_rx/data_save_reg[1]  ( .D(\uut_rx/n91 ), .CK(clk), .Q(
        \uut_rx/data_save [1]) );
  DFF_X1 \uut_rx/data_save_reg[2]  ( .D(\uut_rx/n90 ), .CK(clk), .Q(
        \uut_rx/data_save [2]) );
  DFF_X1 \uut_rx/data_save_reg[3]  ( .D(\uut_rx/n89 ), .CK(clk), .Q(
        \uut_rx/data_save [3]) );
  DFF_X1 \uut_rx/data_save_reg[7]  ( .D(\uut_rx/n85 ), .CK(clk), .Q(
        \uut_rx/data_save [7]), .QN(\uut_rx/n84 ) );
  DFF_X1 \uut_rx/count_8_reg[1]  ( .D(\uut_rx/n69 ), .CK(clk), .Q(
        \uut_rx/count_8 [1]), .QN(\uut_rx/n62 ) );
  DFF_X1 \uut_rx/count_16_reg[2]  ( .D(\uut_rx/n73 ), .CK(clk), .QN(
        \uut_rx/n45 ) );
  DFF_X1 \uut_rx/count_8_reg[2]  ( .D(\uut_rx/n68 ), .CK(clk), .Q(
        \uut_rx/count_8 [2]), .QN(\uut_rx/n18 ) );
  DFF_X1 \uut_rx/count_16_reg[3]  ( .D(\uut_rx/n72 ), .CK(clk), .Q(
        \uut_rx/count_16 [3]), .QN(\uut_rx/n44 ) );
  DFF_X1 \uut_rx/count_8_reg[0]  ( .D(\uut_rx/n70 ), .CK(clk), .Q(
        \uut_rx/count_8 [0]), .QN(\uut_rx/n21 ) );
  DFF_X1 \uut_rx/ext_data_out_reg[7]  ( .D(\uut_rx/N86 ), .CK(clk), .Q(
        data_in[7]) );
  DFF_X1 \uut_rx/ext_data_out_reg[6]  ( .D(\uut_rx/n25 ), .CK(clk), .Q(
        data_in[6]) );
  DFF_X1 \uut_rx/ext_data_out_reg[5]  ( .D(\uut_rx/n27 ), .CK(clk), .Q(
        data_in[5]) );
  DFF_X1 \uut_rx/ext_data_out_reg[4]  ( .D(\uut_rx/n28 ), .CK(clk), .Q(
        data_in[4]) );
  DFF_X1 \uut_rx/ext_data_out_reg[3]  ( .D(\uut_rx/n29 ), .CK(clk), .Q(
        data_in[3]) );
  DFF_X1 \uut_rx/ext_data_out_reg[2]  ( .D(\uut_rx/n30 ), .CK(clk), .Q(
        data_in[2]) );
  DFF_X1 \uut_rx/ext_data_out_reg[1]  ( .D(\uut_rx/n31 ), .CK(clk), .Q(
        data_in[1]) );
  DFF_X1 \uut_rx/ext_data_out_reg[0]  ( .D(\uut_rx/n32 ), .CK(clk), .Q(
        data_in[0]) );
  DFF_X1 \uut_rx/count_16_indication_reg  ( .D(\uut_rx/N48 ), .CK(clk), .Q(
        \uut_rx/count_16_indication ) );
  DFF_X1 \uut_rx/count_8_indication_reg  ( .D(\uut_rx/N67 ), .CK(clk), .Q(
        \uut_rx/count_8_indication ) );
  DFF_X1 \uut_rx/current_state_reg[1]  ( .D(\uut_rx/N88 ), .CK(clk), .Q(
        \uut_rx/current_state [1]), .QN(\uut_rx/n24 ) );
  DLH_X1 \uut_rx/next_state_reg[1]  ( .G(\uut_rx/N100 ), .D(\uut_rx/N102 ), 
        .Q(\uut_rx/next_state [1]) );
  DFF_X1 \uut_rx/current_state_reg[0]  ( .D(\uut_rx/N87 ), .CK(clk), .Q(
        \uut_rx/current_state [0]), .QN(\uut_rx/n26 ) );
  DLH_X1 \uut_rx/next_state_reg[0]  ( .G(\uut_rx/N100 ), .D(\uut_rx/n17 ), .Q(
        \uut_rx/next_state [0]) );
endmodule

