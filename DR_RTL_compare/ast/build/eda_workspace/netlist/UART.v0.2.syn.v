/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 14:04:03 2026
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
         \uut_baud_rate/n44 , \uut_baud_rate/n36 , \uut_baud_rate/n35 ,
         \uut_baud_rate/n34 , \uut_baud_rate/n33 , \uut_baud_rate/n32 ,
         \uut_baud_rate/n31 , \uut_baud_rate/n30 , \uut_baud_rate/n29 ,
         \uut_baud_rate/n28 , \uut_baud_rate/n16 , \uut_baud_rate/n15 ,
         \uut_baud_rate/n14 , \uut_baud_rate/n13 , \uut_baud_rate/n12 ,
         \uut_baud_rate/n11 , \uut_baud_rate/n10 , \uut_baud_rate/n9 ,
         \uut_baud_rate/n8 , \uut_baud_rate/n7 , \uut_baud_rate/n6 ,
         \uut_baud_rate/n5 , \uut_baud_rate/n4 , \uut_baud_rate/n3 ,
         \uut_baud_rate/n2 , \uut_baud_rate/n27 , \uut_baud_rate/n26 ,
         \uut_baud_rate/n25 , \uut_baud_rate/n24 , \uut_baud_rate/n23 ,
         \uut_baud_rate/n22 , \uut_baud_rate/n21 , \uut_baud_rate/n20 ,
         \uut_baud_rate/n19 , \uut_baud_rate/n18 , \uut_baud_rate/n17 ,
         \uut_baud_rate/N77 , \uut_baud_rate/N76 , \uut_baud_rate/N75 ,
         \uut_baud_rate/N74 , \uut_baud_rate/N73 , \uut_baud_rate/N72 ,
         \uut_baud_rate/N71 , \uut_baud_rate/N70 , \uut_baud_rate/N69 ,
         \uut_baud_rate/N68 , \uut_baud_rate/N67 , \uut_baud_rate/N66 ,
         \uut_baud_rate/N65 , \uut_baud_rate/N64 , \uut_baud_rate/N63 ,
         \uut_baud_rate/N62 , \uut_baud_rate/N61 , \uut_baud_rate/N60 ,
         \uut_baud_rate/N59 , \uut_baud_rate/N58 , \uut_baud_rate/N57 ,
         \uut_baud_rate/N56 , \uut_baud_rate/N55 , \uut_baud_rate/N54 ,
         \uut_baud_rate/N53 , \uut_baud_rate/N52 , \uut_baud_rate/N51 ,
         \uut_baud_rate/N50 , \uut_baud_rate/N49 , \uut_baud_rate/N48 ,
         \uut_baud_rate/N47 , \uut_baud_rate/baud_hit ,
         \uut_baud_rate/temp_en , \uut_baud_rate/add_135/n314 ,
         \uut_baud_rate/add_135/n313 , \uut_baud_rate/add_135/n312 ,
         \uut_baud_rate/add_135/n311 , \uut_baud_rate/add_135/n310 ,
         \uut_baud_rate/add_135/n309 , \uut_baud_rate/add_135/n308 ,
         \uut_baud_rate/add_135/n307 , \uut_baud_rate/add_135/n306 ,
         \uut_baud_rate/add_135/n305 , \uut_baud_rate/add_135/n304 ,
         \uut_baud_rate/add_135/n303 , \uut_baud_rate/add_135/n302 ,
         \uut_baud_rate/add_135/n301 , \uut_baud_rate/add_135/n300 ,
         \uut_baud_rate/add_135/n299 , \uut_baud_rate/add_135/n298 ,
         \uut_baud_rate/add_135/n297 , \uut_baud_rate/add_135/n296 ,
         \uut_baud_rate/add_135/n295 , \uut_baud_rate/add_135/n294 ,
         \uut_baud_rate/add_135/n293 , \uut_baud_rate/add_135/n292 ,
         \uut_baud_rate/add_135/n291 , \uut_baud_rate/add_135/n290 ,
         \uut_baud_rate/add_135/n289 , \uut_baud_rate/add_135/n288 ,
         \uut_baud_rate/add_135/n287 , \uut_baud_rate/add_135/n286 ,
         \uut_baud_rate/add_135/n285 , \uut_baud_rate/add_135/n284 ,
         \uut_baud_rate/add_135/n283 , \uut_baud_rate/add_135/n282 ,
         \uut_baud_rate/add_135/n281 , \uut_baud_rate/add_135/n280 ,
         \uut_baud_rate/add_135/n279 , \uut_baud_rate/add_135/n278 ,
         \uut_baud_rate/add_135/n277 , \uut_baud_rate/add_135/n276 ,
         \uut_baud_rate/add_135/n275 , \uut_baud_rate/add_135/n274 ,
         \uut_baud_rate/add_135/n273 , \uut_baud_rate/add_135/n272 ,
         \uut_baud_rate/add_135/n271 , \uut_baud_rate/add_135/n270 ,
         \uut_baud_rate/add_135/n269 , \uut_baud_rate/add_135/n268 ,
         \uut_baud_rate/add_135/n267 , \uut_baud_rate/add_135/n266 ,
         \uut_baud_rate/add_135/n265 , \uut_baud_rate/add_135/n264 ,
         \uut_baud_rate/add_135/n263 , \uut_baud_rate/add_135/n262 ,
         \uut_baud_rate/add_135/n261 , \uut_baud_rate/add_135/n260 ,
         \uut_baud_rate/add_135/n259 , \uut_baud_rate/add_135/n258 ,
         \uut_baud_rate/add_135/n257 , \uut_baud_rate/add_135/n256 ,
         \uut_baud_rate/add_135/n255 , \uut_baud_rate/add_135/n254 ,
         \uut_baud_rate/add_135/n253 , \uut_baud_rate/add_135/n252 ,
         \uut_baud_rate/add_135/n251 , \uut_baud_rate/add_135/n250 ,
         \uut_baud_rate/add_135/n249 , \uut_baud_rate/add_135/n248 ,
         \uut_baud_rate/add_135/n247 , \uut_baud_rate/add_135/n246 ,
         \uut_baud_rate/add_135/n245 , \uut_baud_rate/add_135/n244 ,
         \uut_baud_rate/add_135/n243 , \uut_baud_rate/add_135/n242 ,
         \uut_baud_rate/add_135/n241 , \uut_baud_rate/add_135/n240 ,
         \uut_baud_rate/add_135/n239 , \uut_baud_rate/add_135/n238 ,
         \uut_baud_rate/add_135/n237 , \uut_baud_rate/add_135/n236 ,
         \uut_baud_rate/add_135/n235 , \uut_baud_rate/add_135/n234 ,
         \uut_baud_rate/add_135/n233 , \uut_baud_rate/add_135/n232 ,
         \uut_baud_rate/add_135/n231 , \uut_baud_rate/add_135/n230 ,
         \uut_baud_rate/add_135/n229 , \uut_baud_rate/add_135/n228 ,
         \uut_baud_rate/add_135/n227 , \uut_baud_rate/add_135/n226 ,
         \uut_baud_rate/add_135/n225 , \uut_baud_rate/add_135/n224 ,
         \uut_baud_rate/add_135/n223 , \uut_baud_rate/add_135/n222 ,
         \uut_baud_rate/add_135/n221 , \uut_baud_rate/add_135/n220 ,
         \uut_baud_rate/add_135/n219 , \uut_baud_rate/add_135/n218 ,
         \uut_baud_rate/add_135/n217 , \uut_baud_rate/add_135/n216 ,
         \uut_baud_rate/add_135/n215 , \uut_baud_rate/add_135/n214 ,
         \uut_baud_rate/add_135/n213 , \uut_baud_rate/add_135/n212 ,
         \uut_baud_rate/add_135/n211 , \uut_baud_rate/add_135/n210 ,
         \uut_baud_rate/add_135/n209 , \uut_baud_rate/add_135/n208 ,
         \uut_baud_rate/add_135/n207 , \uut_baud_rate/add_135/n206 ,
         \uut_baud_rate/add_135/n205 , \uut_baud_rate/add_135/n204 ,
         \uut_baud_rate/add_135/n203 , \uut_baud_rate/add_135/n202 ,
         \uut_baud_rate/add_135/n201 , \uut_baud_rate/add_135/n200 ,
         \uut_baud_rate/add_135/n199 , \uut_baud_rate/add_135/n198 ,
         \uut_baud_rate/add_135/n197 , \uut_baud_rate/add_135/n196 ,
         \uut_baud_rate/add_135/n195 , \uut_baud_rate/add_135/n194 ,
         \uut_baud_rate/add_135/n193 , \uut_baud_rate/add_135/n192 ,
         \uut_baud_rate/add_135/n191 , \uut_baud_rate/add_135/n190 ,
         \uut_baud_rate/add_135/n189 , \uut_baud_rate/add_135/n188 ,
         \uut_baud_rate/add_135/n187 , \uut_baud_rate/add_135/n186 ,
         \uut_baud_rate/add_135/n185 , \uut_baud_rate/add_135/n184 ,
         \uut_baud_rate/add_135/n183 , \uut_baud_rate/add_135/n182 ,
         \uut_baud_rate/add_135/n181 , \uut_baud_rate/add_135/n180 ,
         \uut_baud_rate/add_135/n179 , \uut_baud_rate/add_135/n178 ,
         \uut_baud_rate/add_135/n177 , \uut_baud_rate/add_135/n176 ,
         \uut_baud_rate/add_135/n175 , \uut_baud_rate/add_135/n174 ,
         \uut_baud_rate/add_135/n173 , \uut_baud_rate/add_135/n172 ,
         \uut_baud_rate/add_135/n171 , \uut_baud_rate/add_135/n170 ,
         \uut_baud_rate/add_135/n169 , \uut_baud_rate/add_135/n168 ,
         \uut_baud_rate/add_135/n167 , \uut_baud_rate/add_135/n166 ,
         \uut_baud_rate/add_135/n165 , \uut_baud_rate/add_135/n164 ,
         \uut_baud_rate/add_135/n163 , \uut_baud_rate/add_135/n162 ,
         \uut_baud_rate/add_135/n161 , \uut_baud_rate/add_135/n160 ,
         \uut_baud_rate/add_135/n159 , \uut_baud_rate/add_135/n158 ,
         \uut_baud_rate/add_135/n157 , \uut_baud_rate/add_135/n156 ,
         \uut_baud_rate/add_135/n155 , \uut_baud_rate/add_135/n154 ,
         \uut_baud_rate/add_135/n153 , \uut_baud_rate/add_135/n152 ,
         \uut_baud_rate/add_135/n151 , \uut_baud_rate/add_135/n150 ,
         \uut_baud_rate/add_135/n149 , \uut_baud_rate/add_135/n148 ,
         \uut_baud_rate/add_135/n147 , \uut_baud_rate/add_135/n146 ,
         \uut_baud_rate/add_135/n145 , \uut_baud_rate/add_135/n144 ,
         \uut_baud_rate/add_135/n143 , \uut_baud_rate/add_135/n142 ,
         \uut_baud_rate/add_135/n141 , \uut_baud_rate/add_135/n140 ,
         \uut_baud_rate/add_135/n139 , \uut_baud_rate/add_135/n138 ,
         \uut_baud_rate/add_135/n137 , \uut_baud_rate/add_135/n136 ,
         \uut_baud_rate/add_135/n135 , \uut_baud_rate/add_135/n134 ,
         \uut_baud_rate/add_135/n133 , \uut_baud_rate/add_135/n132 ,
         \uut_baud_rate/add_135/n131 , \uut_baud_rate/add_135/n130 ,
         \uut_baud_rate/add_135/n129 , \uut_baud_rate/add_135/n128 ,
         \uut_baud_rate/add_135/n127 , \uut_baud_rate/add_135/n126 ,
         \uut_baud_rate/add_135/n125 , \uut_baud_rate/add_135/n124 ,
         \uut_baud_rate/add_135/n123 , \uut_baud_rate/add_135/n122 ,
         \uut_baud_rate/add_135/n121 , \uut_baud_rate/add_135/n120 ,
         \uut_baud_rate/add_135/n119 , \uut_baud_rate/add_135/n118 ,
         \uut_baud_rate/add_135/n117 , \uut_baud_rate/add_135/n116 ,
         \uut_baud_rate/add_135/n115 , \uut_baud_rate/add_135/n114 ,
         \uut_baud_rate/add_135/n113 , \uut_baud_rate/add_135/n112 ,
         \uut_baud_rate/add_135/n111 , \uut_baud_rate/add_135/n110 ,
         \uut_baud_rate/add_135/n109 , \uut_baud_rate/add_135/n108 ,
         \uut_baud_rate/add_135/n107 , \uut_baud_rate/add_135/n106 ,
         \uut_baud_rate/add_135/n105 , \uut_baud_rate/add_135/n104 ,
         \uut_baud_rate/add_135/n103 , \uut_baud_rate/add_135/n102 ,
         \uut_baud_rate/add_135/n101 , \uut_baud_rate/add_135/n100 ,
         \uut_baud_rate/add_135/n99 , \uut_baud_rate/add_135/n98 ,
         \uut_baud_rate/add_135/n97 , \uut_baud_rate/add_135/n96 ,
         \uut_baud_rate/add_135/n95 , \uut_baud_rate/add_135/n94 ,
         \uut_baud_rate/add_135/n93 , \uut_baud_rate/add_135/n92 ,
         \uut_baud_rate/add_135/n91 , \uut_baud_rate/add_135/n90 ,
         \uut_baud_rate/add_135/n89 , \uut_baud_rate/add_135/n88 ,
         \uut_baud_rate/add_135/n87 , \uut_baud_rate/add_135/n86 ,
         \uut_baud_rate/add_135/n85 , \uut_baud_rate/add_135/n84 ,
         \uut_baud_rate/add_135/n83 , \uut_baud_rate/add_135/n82 ,
         \uut_baud_rate/add_135/n81 , \uut_baud_rate/add_135/n80 ,
         \uut_baud_rate/add_135/n79 , \uut_baud_rate/add_135/n78 ,
         \uut_baud_rate/add_135/n77 , \uut_baud_rate/add_135/n76 ,
         \uut_baud_rate/add_135/n75 , \uut_baud_rate/add_135/n74 ,
         \uut_baud_rate/add_135/n73 , \uut_baud_rate/add_135/n72 ,
         \uut_baud_rate/add_135/n71 , \uut_baud_rate/add_135/n70 ,
         \uut_baud_rate/add_135/n69 , \uut_baud_rate/add_135/n68 ,
         \uut_baud_rate/add_135/n67 , \uut_baud_rate/add_135/n66 ,
         \uut_baud_rate/add_135/n65 , \uut_baud_rate/add_135/n64 ,
         \uut_baud_rate/add_135/n63 , \uut_baud_rate/add_135/n62 ,
         \uut_baud_rate/add_135/n61 , \uut_baud_rate/add_135/n60 ,
         \uut_baud_rate/add_135/n59 , \uut_baud_rate/add_135/n58 ,
         \uut_baud_rate/add_135/n57 , \uut_baud_rate/add_135/n56 ,
         \uut_baud_rate/add_135/n55 , \uut_baud_rate/add_135/n54 ,
         \uut_baud_rate/add_135/n53 , \uut_baud_rate/add_135/n52 ,
         \uut_baud_rate/add_135/n51 , \uut_baud_rate/add_135/n50 ,
         \uut_baud_rate/add_135/n49 , \uut_baud_rate/add_135/n48 ,
         \uut_baud_rate/add_135/n47 , \uut_baud_rate/add_135/n46 ,
         \uut_baud_rate/add_135/n45 , \uut_baud_rate/add_135/n44 ,
         \uut_baud_rate/add_135/n43 , \uut_baud_rate/add_135/n42 ,
         \uut_baud_rate/add_135/n41 , \uut_baud_rate/add_135/n39 ,
         \uut_baud_rate/add_135/n38 , \uut_baud_rate/add_135/n37 ,
         \uut_baud_rate/add_135/n36 , \uut_baud_rate/add_135/n35 ,
         \uut_baud_rate/add_135/n34 , \uut_baud_rate/add_135/n33 ,
         \uut_baud_rate/add_135/n32 , \uut_baud_rate/add_135/n31 ,
         \uut_baud_rate/add_135/n30 , \uut_baud_rate/add_135/n29 ,
         \uut_baud_rate/add_135/n28 , \uut_baud_rate/add_135/n27 ,
         \uut_baud_rate/add_135/n26 , \uut_baud_rate/add_135/n25 ,
         \uut_baud_rate/add_135/n24 , \uut_baud_rate/add_135/n23 ,
         \uut_baud_rate/add_135/n22 , \uut_baud_rate/add_135/n21 ,
         \uut_baud_rate/add_135/n20 , \uut_baud_rate/add_135/n19 ,
         \uut_baud_rate/add_135/n18 , \uut_baud_rate/add_135/n17 ,
         \uut_baud_rate/add_135/n16 , \uut_baud_rate/add_135/n15 ,
         \uut_baud_rate/add_135/n14 , \uut_baud_rate/add_135/n13 ,
         \uut_baud_rate/add_135/n11 , \uut_baud_rate/add_135/n10 ,
         \uut_baud_rate/add_135/n9 , \uut_baud_rate/add_135/n8 ,
         \uut_baud_rate/add_135/n7 , \uut_baud_rate/add_135/n6 ,
         \uut_baud_rate/add_135/n5 , \uut_baud_rate/add_135/n4 ,
         \uut_baud_rate/add_135/n3 , \uut_baud_rate/add_135/n2 ,
         \uut_baud_rate/add_135/n1 , \uut_baud_rate/eq_134/n60 ,
         \uut_baud_rate/eq_134/n59 , \uut_baud_rate/eq_134/n58 ,
         \uut_baud_rate/eq_134/n57 , \uut_baud_rate/eq_134/n56 ,
         \uut_baud_rate/eq_134/n55 , \uut_baud_rate/eq_134/n54 ,
         \uut_baud_rate/eq_134/n53 , \uut_baud_rate/eq_134/n52 ,
         \uut_baud_rate/eq_134/n51 , \uut_baud_rate/eq_134/n50 ,
         \uut_baud_rate/eq_134/n49 , \uut_baud_rate/eq_134/n48 ,
         \uut_baud_rate/eq_134/n47 , \uut_baud_rate/eq_134/n46 ,
         \uut_baud_rate/eq_134/n45 , \uut_baud_rate/eq_134/n44 ,
         \uut_baud_rate/eq_134/n43 , \uut_baud_rate/eq_134/n42 ,
         \uut_baud_rate/eq_134/n41 , \uut_baud_rate/eq_134/n40 ,
         \uut_baud_rate/eq_134/n39 , \uut_baud_rate/eq_134/n38 ,
         \uut_baud_rate/eq_134/n37 , \uut_baud_rate/eq_134/n36 ,
         \uut_baud_rate/eq_134/n35 , \uut_baud_rate/eq_134/n34 ,
         \uut_baud_rate/eq_134/n33 , \uut_baud_rate/eq_134/n32 ,
         \uut_baud_rate/eq_134/n31 , \uut_baud_rate/eq_134/n30 ,
         \uut_baud_rate/eq_134/n29 , \uut_baud_rate/eq_134/n28 ,
         \uut_baud_rate/eq_134/n27 , \uut_baud_rate/eq_134/n26 ,
         \uut_baud_rate/eq_134/n25 , \uut_baud_rate/eq_134/n24 ,
         \uut_baud_rate/eq_134/n23 , \uut_baud_rate/eq_134/n22 ,
         \uut_baud_rate/eq_134/n21 , \uut_baud_rate/eq_134/n20 ,
         \uut_baud_rate/eq_134/n19 , \uut_baud_rate/eq_134/n18 ,
         \uut_baud_rate/eq_134/n17 , \uut_baud_rate/eq_134/n16 ,
         \uut_baud_rate/eq_134/n15 , \uut_baud_rate/eq_134/n14 ,
         \uut_baud_rate/eq_134/n13 , \uut_baud_rate/eq_134/n12 ,
         \uut_baud_rate/eq_134/n11 , \uut_baud_rate/eq_134/n10 ,
         \uut_baud_rate/eq_134/n9 , \uut_baud_rate/eq_134/n8 ,
         \uut_baud_rate/eq_134/n7 , \uut_baud_rate/eq_134/n6 ,
         \uut_baud_rate/eq_134/n5 , \uut_baud_rate/eq_134/n4 ,
         \uut_baud_rate/eq_134/n3 , \uut_baud_rate/eq_134/n2 ,
         \uut_baud_rate/eq_134/n1 , \uut_tx/n89 , \uut_tx/n88 , \uut_tx/n87 ,
         \uut_tx/n86 , \uut_tx/n85 , \uut_tx/n84 , \uut_tx/n83 , \uut_tx/n82 ,
         \uut_tx/n81 , \uut_tx/n80 , \uut_tx/n79 , \uut_tx/n78 , \uut_tx/n77 ,
         \uut_tx/n76 , \uut_tx/n75 , \uut_tx/n74 , \uut_tx/n73 , \uut_tx/n72 ,
         \uut_tx/n71 , \uut_tx/n70 , \uut_tx/n69 , \uut_tx/n68 , \uut_tx/n67 ,
         \uut_tx/n66 , \uut_tx/n65 , \uut_tx/n64 , \uut_tx/n63 , \uut_tx/n62 ,
         \uut_tx/n61 , \uut_tx/n56 , \uut_tx/n55 , \uut_tx/n54 , \uut_tx/n53 ,
         \uut_tx/n52 , \uut_tx/n51 , \uut_tx/n50 , \uut_tx/n49 , \uut_tx/n48 ,
         \uut_tx/n47 , \uut_tx/n46 , \uut_tx/n45 , \uut_tx/n44 , \uut_tx/n43 ,
         \uut_tx/n42 , \uut_tx/n41 , \uut_tx/n40 , \uut_tx/n39 , \uut_tx/n38 ,
         \uut_tx/n37 , \uut_tx/n36 , \uut_tx/n35 , \uut_tx/n34 , \uut_tx/n33 ,
         \uut_tx/n32 , \uut_tx/n31 , \uut_tx/n30 , \uut_tx/n29 , \uut_tx/n28 ,
         \uut_tx/n27 , \uut_tx/n26 , \uut_tx/n25 , \uut_tx/n24 , \uut_tx/n23 ,
         \uut_tx/n21 , \uut_tx/n20 , \uut_tx/n8 , \uut_tx/n6 , \uut_tx/n5 ,
         \uut_tx/n4 , \uut_tx/n3 , \uut_tx/n2 , \uut_tx/n1 , \uut_tx/n60 ,
         \uut_tx/n59 , \uut_tx/n58 , \uut_tx/n57 , \uut_tx/n22 , \uut_tx/n19 ,
         \uut_tx/n18 , \uut_tx/n17 , \uut_tx/n16 , \uut_tx/n15 , \uut_tx/n14 ,
         \uut_tx/n13 , \uut_tx/n12 , \uut_tx/n11 , \uut_tx/n10 , \uut_tx/n9 ,
         \uut_tx/n7 , \uut_tx/N98 , \uut_tx/N96 , \uut_tx/N92 , \uut_tx/N84 ,
         \uut_tx/N83 , \uut_tx/N80 , \uut_tx/N79 , \uut_tx/N78 , \uut_tx/N77 ,
         \uut_tx/N76 , \uut_tx/N75 , \uut_tx/N74 , \uut_tx/N73 , \uut_tx/N72 ,
         \uut_tx/N71 , \uut_tx/N70 , \uut_tx/N69 , \uut_tx/count_8_indication ,
         \uut_tx/N33 , \uut_tx/count_16_indication , \uut_rx/n107 ,
         \uut_rx/n106 , \uut_rx/n105 , \uut_rx/n104 , \uut_rx/n103 ,
         \uut_rx/n102 , \uut_rx/n101 , \uut_rx/n100 , \uut_rx/n99 ,
         \uut_rx/n98 , \uut_rx/n97 , \uut_rx/n96 , \uut_rx/n95 , \uut_rx/n94 ,
         \uut_rx/n93 , \uut_rx/n92 , \uut_rx/n91 , \uut_rx/n90 , \uut_rx/n89 ,
         \uut_rx/n88 , \uut_rx/n87 , \uut_rx/n86 , \uut_rx/n85 , \uut_rx/n84 ,
         \uut_rx/n83 , \uut_rx/n82 , \uut_rx/n81 , \uut_rx/n80 , \uut_rx/n79 ,
         \uut_rx/n78 , \uut_rx/n77 , \uut_rx/n65 , \uut_rx/n64 , \uut_rx/n63 ,
         \uut_rx/n62 , \uut_rx/n61 , \uut_rx/n60 , \uut_rx/n59 , \uut_rx/n58 ,
         \uut_rx/n57 , \uut_rx/n56 , \uut_rx/n55 , \uut_rx/n54 , \uut_rx/n53 ,
         \uut_rx/n52 , \uut_rx/n51 , \uut_rx/n50 , \uut_rx/n49 , \uut_rx/n48 ,
         \uut_rx/n47 , \uut_rx/n46 , \uut_rx/n45 , \uut_rx/n44 , \uut_rx/n43 ,
         \uut_rx/n42 , \uut_rx/n41 , \uut_rx/n40 , \uut_rx/n39 , \uut_rx/n38 ,
         \uut_rx/n37 , \uut_rx/n36 , \uut_rx/n35 , \uut_rx/n34 , \uut_rx/n33 ,
         \uut_rx/n30 , \uut_rx/n29 , \uut_rx/n28 , \uut_rx/n24 , \uut_rx/n22 ,
         \uut_rx/n20 , \uut_rx/n18 , \uut_rx/n16 , \uut_rx/n14 , \uut_rx/n12 ,
         \uut_rx/n10 , \uut_rx/n9 , \uut_rx/n7 , \uut_rx/n5 , \uut_rx/n4 ,
         \uut_rx/n3 , \uut_rx/n2 , \uut_rx/n1 , \uut_rx/n76 , \uut_rx/n75 ,
         \uut_rx/n74 , \uut_rx/n73 , \uut_rx/n72 , \uut_rx/n71 , \uut_rx/n70 ,
         \uut_rx/n69 , \uut_rx/n68 , \uut_rx/n67 , \uut_rx/n66 , \uut_rx/n32 ,
         \uut_rx/n31 , \uut_rx/n27 , \uut_rx/n26 , \uut_rx/n25 , \uut_rx/n23 ,
         \uut_rx/n21 , \uut_rx/n19 , \uut_rx/n17 , \uut_rx/n15 , \uut_rx/n13 ,
         \uut_rx/n11 , \uut_rx/n8 , \uut_rx/n6 , \uut_rx/N112 , \uut_rx/N110 ,
         \uut_rx/N98 , \uut_rx/N97 , \uut_rx/N78 , \uut_rx/N77 , \uut_rx/N76 ,
         \uut_rx/N75 , \uut_rx/count_8_indication , \uut_rx/count_8[1] ,
         \uut_rx/N47 , \uut_rx/count_16_indication ;
  wire   [31:0] baud_division;
  wire   [7:0] data_out;
  wire   [7:0] data_in;
  wire   [31:0] \uut_baud_rate/baud_count_next ;
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
  NAND3_X1 \uut_baud_rate/U99  ( .A1(\uut_baud_rate/n51 ), .A2(
        \uut_baud_rate/n92 ), .A3(\uut_baud_rate/n89 ), .ZN(
        \uut_baud_rate/n90 ) );
  AND2_X1 \uut_baud_rate/U98  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/baud_count_next [31]), .ZN(\uut_baud_rate/N77 ) );
  NAND2_X1 \uut_baud_rate/U97  ( .A1(\uut_baud_rate/n88 ), .A2(
        \uut_baud_rate/n92 ), .ZN(\uut_baud_rate/n93 ) );
  NAND3_X1 \uut_baud_rate/U96  ( .A1(\uut_baud_rate/n57 ), .A2(
        \uut_baud_rate/baud_count_next [0]), .A3(\uut_baud_rate/n35 ), .ZN(
        \uut_baud_rate/n88 ) );
  NAND2_X1 \uut_baud_rate/U95  ( .A1(\uut_baud_rate/n89 ), .A2(
        \uut_baud_rate/n86 ), .ZN(\uut_baud_rate/n92 ) );
  INV_X1 \uut_baud_rate/U94  ( .A(\uut_baud_rate/n85 ), .ZN(
        \uut_baud_rate/n86 ) );
  AND2_X1 \uut_baud_rate/U93  ( .A1(\uut_baud_rate/n46 ), .A2(
        \uut_baud_rate/baud_count_next [1]), .ZN(\uut_baud_rate/N47 ) );
  AND2_X1 \uut_baud_rate/U92  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/baud_count_next [2]), .ZN(\uut_baud_rate/N48 ) );
  AND2_X1 \uut_baud_rate/U91  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/baud_count_next [3]), .ZN(\uut_baud_rate/N49 ) );
  AND2_X1 \uut_baud_rate/U90  ( .A1(\uut_baud_rate/n44 ), .A2(
        \uut_baud_rate/baud_count_next [4]), .ZN(\uut_baud_rate/N50 ) );
  AND2_X1 \uut_baud_rate/U89  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/baud_count_next [5]), .ZN(\uut_baud_rate/N51 ) );
  AND2_X1 \uut_baud_rate/U88  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/baud_count_next [6]), .ZN(\uut_baud_rate/N52 ) );
  AND2_X1 \uut_baud_rate/U87  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/baud_count_next [7]), .ZN(\uut_baud_rate/N53 ) );
  AND2_X1 \uut_baud_rate/U86  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/baud_count_next [8]), .ZN(\uut_baud_rate/N54 ) );
  AND2_X1 \uut_baud_rate/U85  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/baud_count_next [9]), .ZN(\uut_baud_rate/N55 ) );
  AND2_X1 \uut_baud_rate/U84  ( .A1(\uut_baud_rate/n46 ), .A2(
        \uut_baud_rate/baud_count_next [10]), .ZN(\uut_baud_rate/N56 ) );
  AND2_X1 \uut_baud_rate/U83  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/baud_count_next [11]), .ZN(\uut_baud_rate/N57 ) );
  AND2_X1 \uut_baud_rate/U82  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/baud_count_next [12]), .ZN(\uut_baud_rate/N58 ) );
  AND2_X1 \uut_baud_rate/U81  ( .A1(\uut_baud_rate/n44 ), .A2(
        \uut_baud_rate/baud_count_next [13]), .ZN(\uut_baud_rate/N59 ) );
  AND2_X1 \uut_baud_rate/U80  ( .A1(\uut_baud_rate/n44 ), .A2(
        \uut_baud_rate/baud_count_next [14]), .ZN(\uut_baud_rate/N60 ) );
  AND2_X1 \uut_baud_rate/U79  ( .A1(\uut_baud_rate/n44 ), .A2(
        \uut_baud_rate/baud_count_next [15]), .ZN(\uut_baud_rate/N61 ) );
  AND2_X1 \uut_baud_rate/U78  ( .A1(\uut_baud_rate/n46 ), .A2(
        \uut_baud_rate/baud_count_next [16]), .ZN(\uut_baud_rate/N62 ) );
  AND2_X1 \uut_baud_rate/U77  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/baud_count_next [17]), .ZN(\uut_baud_rate/N63 ) );
  AND2_X1 \uut_baud_rate/U76  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/baud_count_next [18]), .ZN(\uut_baud_rate/N64 ) );
  AND2_X1 \uut_baud_rate/U75  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/baud_count_next [19]), .ZN(\uut_baud_rate/N65 ) );
  AND2_X1 \uut_baud_rate/U74  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/baud_count_next [20]), .ZN(\uut_baud_rate/N66 ) );
  AND2_X1 \uut_baud_rate/U73  ( .A1(\uut_baud_rate/n44 ), .A2(
        \uut_baud_rate/baud_count_next [21]), .ZN(\uut_baud_rate/N67 ) );
  AND2_X1 \uut_baud_rate/U72  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/baud_count_next [22]), .ZN(\uut_baud_rate/N68 ) );
  AND2_X1 \uut_baud_rate/U71  ( .A1(\uut_baud_rate/n46 ), .A2(
        \uut_baud_rate/baud_count_next [23]), .ZN(\uut_baud_rate/N69 ) );
  AND2_X1 \uut_baud_rate/U70  ( .A1(\uut_baud_rate/n53 ), .A2(
        \uut_baud_rate/baud_count_next [24]), .ZN(\uut_baud_rate/N70 ) );
  AND2_X1 \uut_baud_rate/U69  ( .A1(\uut_baud_rate/n46 ), .A2(
        \uut_baud_rate/baud_count_next [25]), .ZN(\uut_baud_rate/N71 ) );
  AND2_X1 \uut_baud_rate/U68  ( .A1(\uut_baud_rate/n46 ), .A2(
        \uut_baud_rate/baud_count_next [26]), .ZN(\uut_baud_rate/N72 ) );
  AND2_X1 \uut_baud_rate/U67  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/baud_count_next [27]), .ZN(\uut_baud_rate/N73 ) );
  AND2_X1 \uut_baud_rate/U66  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/baud_count_next [28]), .ZN(\uut_baud_rate/N74 ) );
  AND2_X1 \uut_baud_rate/U65  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/baud_count_next [29]), .ZN(\uut_baud_rate/N75 ) );
  AND2_X1 \uut_baud_rate/U64  ( .A1(\uut_baud_rate/n44 ), .A2(
        \uut_baud_rate/baud_count_next [30]), .ZN(\uut_baud_rate/N76 ) );
  INV_X1 \uut_baud_rate/U63  ( .A(\uut_baud_rate/baud_hit ), .ZN(
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
  INV_X2 \uut_baud_rate/U51  ( .A(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/n65 ) );
  INV_X2 \uut_baud_rate/U50  ( .A(\uut_baud_rate/n62 ), .ZN(
        \uut_baud_rate/n63 ) );
  INV_X2 \uut_baud_rate/U49  ( .A(\uut_baud_rate/n60 ), .ZN(
        \uut_baud_rate/n61 ) );
  INV_X2 \uut_baud_rate/U48  ( .A(\uut_baud_rate/n58 ), .ZN(
        \uut_baud_rate/n59 ) );
  INV_X1 \uut_baud_rate/U47  ( .A(\uut_baud_rate/n51 ), .ZN(
        \uut_baud_rate/n57 ) );
  NAND2_X1 \uut_baud_rate/U46  ( .A1(\uut_baud_rate/n90 ), .A2(
        \uut_baud_rate/n54 ), .ZN(\uut_baud_rate/n25 ) );
  OR2_X1 \uut_baud_rate/U45  ( .A1(\uut_baud_rate/n92 ), .A2(
        \uut_baud_rate/n91 ), .ZN(\uut_baud_rate/n54 ) );
  INV_X1 \uut_baud_rate/U44  ( .A(\uut_baud_rate/n49 ), .ZN(
        \uut_baud_rate/n50 ) );
  INV_X1 \uut_baud_rate/U43  ( .A(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/n48 ) );
  AND2_X1 \uut_baud_rate/U42  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n35 ), .ZN(\uut_baud_rate/n52 ) );
  AND2_X2 \uut_baud_rate/U41  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n35 ), .ZN(\uut_baud_rate/n45 ) );
  AND2_X1 \uut_baud_rate/U40  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n35 ), .ZN(\uut_baud_rate/n46 ) );
  AND2_X1 \uut_baud_rate/U39  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n35 ), .ZN(\uut_baud_rate/n53 ) );
  AND2_X1 \uut_baud_rate/U38  ( .A1(\uut_baud_rate/n87 ), .A2(
        \uut_baud_rate/n35 ), .ZN(\uut_baud_rate/n44 ) );
  NOR4_X1 \uut_baud_rate/U30  ( .A1(baud_division[5]), .A2(baud_division[4]), 
        .A3(baud_division[3]), .A4(baud_division[31]), .ZN(\uut_baud_rate/n23 ) );
  NOR4_X1 \uut_baud_rate/U29  ( .A1(baud_division[9]), .A2(baud_division[8]), 
        .A3(baud_division[7]), .A4(baud_division[6]), .ZN(\uut_baud_rate/n24 )
         );
  NOR4_X1 \uut_baud_rate/U28  ( .A1(baud_division[23]), .A2(baud_division[22]), 
        .A3(baud_division[21]), .A4(baud_division[20]), .ZN(
        \uut_baud_rate/n20 ) );
  NOR4_X1 \uut_baud_rate/U27  ( .A1(baud_division[12]), .A2(baud_division[11]), 
        .A3(baud_division[10]), .A4(baud_division[0]), .ZN(\uut_baud_rate/n17 ) );
  NOR4_X1 \uut_baud_rate/U26  ( .A1(baud_division[27]), .A2(baud_division[26]), 
        .A3(baud_division[25]), .A4(baud_division[24]), .ZN(
        \uut_baud_rate/n21 ) );
  NOR4_X1 \uut_baud_rate/U25  ( .A1(baud_division[30]), .A2(baud_division[2]), 
        .A3(baud_division[29]), .A4(baud_division[28]), .ZN(
        \uut_baud_rate/n22 ) );
  NOR4_X1 \uut_baud_rate/U24  ( .A1(baud_division[16]), .A2(baud_division[15]), 
        .A3(baud_division[14]), .A4(baud_division[13]), .ZN(
        \uut_baud_rate/n18 ) );
  NOR4_X1 \uut_baud_rate/U23  ( .A1(baud_division[1]), .A2(baud_division[19]), 
        .A3(baud_division[18]), .A4(baud_division[17]), .ZN(
        \uut_baud_rate/n19 ) );
  NAND2_X1 \uut_baud_rate/U22  ( .A1(\uut_baud_rate/n36 ), .A2(enable), .ZN(
        \uut_baud_rate/n85 ) );
  INV_X1 \uut_baud_rate/U21  ( .A(\uut_baud_rate/n55 ), .ZN(
        \uut_baud_rate/n56 ) );
  INV_X1 \uut_baud_rate/U20  ( .A(\uut_baud_rate/n76 ), .ZN(
        \uut_baud_rate/n79 ) );
  AND2_X2 \uut_baud_rate/U19  ( .A1(\uut_baud_rate/n89 ), .A2(
        \uut_baud_rate/n85 ), .ZN(\uut_baud_rate/n35 ) );
  INV_X2 \uut_baud_rate/U18  ( .A(\uut_baud_rate/n33 ), .ZN(
        \uut_baud_rate/n34 ) );
  INV_X2 \uut_baud_rate/U17  ( .A(\uut_baud_rate/n31 ), .ZN(
        \uut_baud_rate/n32 ) );
  INV_X2 \uut_baud_rate/U16  ( .A(\uut_baud_rate/n29 ), .ZN(
        \uut_baud_rate/n30 ) );
  INV_X2 \uut_baud_rate/U15  ( .A(\uut_baud_rate/n16 ), .ZN(
        \uut_baud_rate/n28 ) );
  INV_X2 \uut_baud_rate/U14  ( .A(\uut_baud_rate/n14 ), .ZN(
        \uut_baud_rate/n15 ) );
  INV_X2 \uut_baud_rate/U13  ( .A(\uut_baud_rate/n12 ), .ZN(
        \uut_baud_rate/n13 ) );
  INV_X1 \uut_baud_rate/U12  ( .A(\uut_baud_rate/n10 ), .ZN(
        \uut_baud_rate/n11 ) );
  INV_X1 \uut_baud_rate/U11  ( .A(\uut_baud_rate/n8 ), .ZN(\uut_baud_rate/n9 )
         );
  INV_X1 \uut_baud_rate/U10  ( .A(\uut_baud_rate/n6 ), .ZN(\uut_baud_rate/n7 )
         );
  INV_X1 \uut_baud_rate/U9  ( .A(\uut_baud_rate/n4 ), .ZN(\uut_baud_rate/n5 )
         );
  INV_X1 \uut_baud_rate/U8  ( .A(\uut_baud_rate/n2 ), .ZN(\uut_baud_rate/n3 )
         );
  CLKBUF_X1 \uut_baud_rate/U7  ( .A(\uut_baud_rate/baud_hit ), .Z(
        \uut_baud_rate/n51 ) );
  INV_X1 \uut_baud_rate/U6  ( .A(\uut_baud_rate/n77 ), .ZN(\uut_baud_rate/n78 ) );
  INV_X1 \uut_baud_rate/U4  ( .A(\uut_baud_rate/n74 ), .ZN(\uut_baud_rate/n75 ) );
  INV_X2 \uut_baud_rate/U3  ( .A(\uut_baud_rate/n72 ), .ZN(\uut_baud_rate/n73 ) );
  DFFRS_X2 \uut_baud_rate/baud_count_reg[7]  ( .D(\uut_baud_rate/N53 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [7]) );
  DFFRS_X1 \uut_baud_rate/baud_count_reg[3]  ( .D(\uut_baud_rate/N49 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [3]) );
  DFF_X1 \uut_baud_rate/baud_tick_reg  ( .D(\uut_baud_rate/n25 ), .CK(clk), 
        .Q(baud_tick), .QN(\uut_baud_rate/n91 ) );
  DFFRS_X2 \uut_baud_rate/baud_count_reg[31]  ( .D(\uut_baud_rate/N77 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [31]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[18]  ( .D(\uut_baud_rate/N64 ), .CK(clk), .Q(\uut_baud_rate/baud_count [18]), .QN(\uut_baud_rate/n12 ) );
  DFFRS_X1 \uut_baud_rate/baud_count_reg[8]  ( .D(\uut_baud_rate/N54 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [8]) );
  DFFRS_X1 \uut_baud_rate/baud_count_reg[4]  ( .D(\uut_baud_rate/N50 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [4]) );
  DFFRS_X1 \uut_baud_rate/baud_count_reg[5]  ( .D(\uut_baud_rate/N51 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [5]) );
  DFFRS_X1 \uut_baud_rate/baud_count_reg[6]  ( .D(\uut_baud_rate/N52 ), .CK(
        clk), .RN(1'b1), .SN(1'b1), .Q(\uut_baud_rate/baud_count [6]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[27]  ( .D(\uut_baud_rate/N73 ), .CK(clk), .Q(\uut_baud_rate/baud_count [27]), .QN(\uut_baud_rate/n10 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[29]  ( .D(\uut_baud_rate/N75 ), .CK(clk), .Q(\uut_baud_rate/baud_count [29]), .QN(\uut_baud_rate/n6 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[28]  ( .D(\uut_baud_rate/N74 ), .CK(clk), .Q(\uut_baud_rate/baud_count [28]), .QN(\uut_baud_rate/n8 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[20]  ( .D(\uut_baud_rate/N66 ), .CK(clk), .Q(\uut_baud_rate/baud_count [20]), .QN(\uut_baud_rate/n31 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[22]  ( .D(\uut_baud_rate/N68 ), .CK(clk), .Q(\uut_baud_rate/baud_count [22]), .QN(\uut_baud_rate/n29 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[24]  ( .D(\uut_baud_rate/N70 ), .CK(clk), .Q(\uut_baud_rate/baud_count [24]), .QN(\uut_baud_rate/n16 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[19]  ( .D(\uut_baud_rate/N65 ), .CK(clk), .Q(\uut_baud_rate/baud_count [19]), .QN(\uut_baud_rate/n33 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[26]  ( .D(\uut_baud_rate/N72 ), .CK(clk), .Q(\uut_baud_rate/baud_count [26]), .QN(\uut_baud_rate/n14 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[30]  ( .D(\uut_baud_rate/N76 ), .CK(clk), .Q(\uut_baud_rate/baud_count [30]), .QN(\uut_baud_rate/n4 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[15]  ( .D(\uut_baud_rate/N61 ), .CK(clk), .Q(\uut_baud_rate/baud_count [15]), .QN(\uut_baud_rate/n62 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[16]  ( .D(\uut_baud_rate/N62 ), .CK(clk), .Q(\uut_baud_rate/baud_count [16]), .QN(\uut_baud_rate/n64 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[1]  ( .D(\uut_baud_rate/N47 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [1]), .QN(\uut_baud_rate/n76 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[2]  ( .D(\uut_baud_rate/N48 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [2]), .QN(\uut_baud_rate/n47 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[9]  ( .D(\uut_baud_rate/N55 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [9]), .QN(\uut_baud_rate/n2 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[10]  ( .D(\uut_baud_rate/N56 ), .CK(clk), .Q(\uut_baud_rate/baud_count [10]), .QN(\uut_baud_rate/n77 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[11]  ( .D(\uut_baud_rate/N57 ), .CK(clk), .Q(\uut_baud_rate/baud_count [11]), .QN(\uut_baud_rate/n74 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[12]  ( .D(\uut_baud_rate/N58 ), .CK(clk), .Q(\uut_baud_rate/baud_count [12]), .QN(\uut_baud_rate/n72 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[13]  ( .D(\uut_baud_rate/N59 ), .CK(clk), .Q(\uut_baud_rate/baud_count [13]), .QN(\uut_baud_rate/n68 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[14]  ( .D(\uut_baud_rate/N60 ), .CK(clk), .Q(\uut_baud_rate/baud_count [14]), .QN(\uut_baud_rate/n70 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[17]  ( .D(\uut_baud_rate/N63 ), .CK(clk), .Q(\uut_baud_rate/baud_count [17]), .QN(\uut_baud_rate/n66 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[21]  ( .D(\uut_baud_rate/N67 ), .CK(clk), .Q(\uut_baud_rate/baud_count [21]), .QN(\uut_baud_rate/n60 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[23]  ( .D(\uut_baud_rate/N69 ), .CK(clk), .Q(\uut_baud_rate/baud_count [23]), .QN(\uut_baud_rate/n58 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[25]  ( .D(\uut_baud_rate/N71 ), .CK(clk), .Q(\uut_baud_rate/baud_count [25]), .QN(\uut_baud_rate/n55 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[0]  ( .D(\uut_baud_rate/n93 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [0]), .QN(\uut_baud_rate/n49 ) );
  DFF_X1 \uut_baud_rate/delayed_en_reg  ( .D(\uut_baud_rate/n26 ), .CK(clk), 
        .QN(\uut_baud_rate/n36 ) );
  DFF_X1 \uut_baud_rate/temp_en_reg  ( .D(\uut_baud_rate/n27 ), .CK(clk), .Q(
        \uut_baud_rate/temp_en ) );
  NAND3_X1 \uut_baud_rate/add_135/U345  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n39 ), .A3(\uut_baud_rate/add_135/n27 ), 
        .ZN(\uut_baud_rate/add_135/n313 ) );
  NAND3_X1 \uut_baud_rate/add_135/U344  ( .A1(\uut_baud_rate/add_135/n56 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n6 ), 
        .ZN(\uut_baud_rate/add_135/n308 ) );
  NAND3_X1 \uut_baud_rate/add_135/U343  ( .A1(\uut_baud_rate/add_135/n43 ), 
        .A2(\uut_baud_rate/add_135/n39 ), .A3(\uut_baud_rate/add_135/n33 ), 
        .ZN(\uut_baud_rate/add_135/n306 ) );
  NAND3_X1 \uut_baud_rate/add_135/U342  ( .A1(\uut_baud_rate/add_135/n48 ), 
        .A2(\uut_baud_rate/add_135/n26 ), .A3(\uut_baud_rate/add_135/n7 ), 
        .ZN(\uut_baud_rate/add_135/n307 ) );
  NAND3_X1 \uut_baud_rate/add_135/U341  ( .A1(\uut_baud_rate/add_135/n32 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n20 ), 
        .ZN(\uut_baud_rate/add_135/n301 ) );
  NAND3_X1 \uut_baud_rate/add_135/U340  ( .A1(\uut_baud_rate/add_135/n2 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n5 ), 
        .ZN(\uut_baud_rate/add_135/n302 ) );
  NAND3_X1 \uut_baud_rate/add_135/U339  ( .A1(\uut_baud_rate/add_135/n43 ), 
        .A2(\uut_baud_rate/add_135/n39 ), .A3(\uut_baud_rate/add_135/n35 ), 
        .ZN(\uut_baud_rate/add_135/n299 ) );
  NAND3_X1 \uut_baud_rate/add_135/U338  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n26 ), .A3(\uut_baud_rate/add_135/n7 ), 
        .ZN(\uut_baud_rate/add_135/n300 ) );
  NAND2_X1 \uut_baud_rate/add_135/U337  ( .A1(\uut_baud_rate/add_135/n35 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n294 ) );
  NAND2_X1 \uut_baud_rate/add_135/U336  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n295 ) );
  NAND4_X1 \uut_baud_rate/add_135/U335  ( .A1(\uut_baud_rate/add_135/n290 ), 
        .A2(\uut_baud_rate/add_135/n291 ), .A3(\uut_baud_rate/add_135/n292 ), 
        .A4(\uut_baud_rate/add_135/n293 ), .ZN(\uut_baud_rate/add_135/n289 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U334  ( .A(\uut_baud_rate/add_135/n289 ), 
        .B(\uut_baud_rate/n69 ), .ZN(\uut_baud_rate/baud_count_next [13]) );
  NAND2_X1 \uut_baud_rate/add_135/U333  ( .A1(\uut_baud_rate/add_135/n31 ), 
        .A2(\uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/add_135/n287 ) );
  NAND2_X1 \uut_baud_rate/add_135/U332  ( .A1(\uut_baud_rate/add_135/n6 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .ZN(\uut_baud_rate/add_135/n288 ) );
  NAND2_X1 \uut_baud_rate/add_135/U331  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n285 ) );
  NAND2_X1 \uut_baud_rate/add_135/U330  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n286 ) );
  NAND4_X1 \uut_baud_rate/add_135/U329  ( .A1(\uut_baud_rate/add_135/n281 ), 
        .A2(\uut_baud_rate/add_135/n282 ), .A3(\uut_baud_rate/add_135/n283 ), 
        .A4(\uut_baud_rate/add_135/n284 ), .ZN(\uut_baud_rate/add_135/n280 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U328  ( .A(\uut_baud_rate/add_135/n280 ), 
        .B(\uut_baud_rate/n71 ), .ZN(\uut_baud_rate/baud_count_next [14]) );
  NAND2_X1 \uut_baud_rate/add_135/U327  ( .A1(\uut_baud_rate/add_135/n56 ), 
        .A2(\uut_baud_rate/add_135/n31 ), .ZN(\uut_baud_rate/add_135/n278 ) );
  NAND2_X1 \uut_baud_rate/add_135/U326  ( .A1(\uut_baud_rate/add_135/n2 ), 
        .A2(\uut_baud_rate/add_135/n6 ), .ZN(\uut_baud_rate/add_135/n279 ) );
  NAND2_X1 \uut_baud_rate/add_135/U325  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n7 ), .ZN(\uut_baud_rate/add_135/n276 ) );
  NAND2_X1 \uut_baud_rate/add_135/U324  ( .A1(\uut_baud_rate/add_135/n20 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .ZN(\uut_baud_rate/add_135/n277 ) );
  NAND2_X1 \uut_baud_rate/add_135/U323  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n274 ) );
  NAND2_X1 \uut_baud_rate/add_135/U322  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n275 ) );
  NAND4_X1 \uut_baud_rate/add_135/U321  ( .A1(\uut_baud_rate/add_135/n272 ), 
        .A2(\uut_baud_rate/add_135/n271 ), .A3(\uut_baud_rate/add_135/n270 ), 
        .A4(\uut_baud_rate/add_135/n273 ), .ZN(\uut_baud_rate/add_135/n269 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U320  ( .A(\uut_baud_rate/add_135/n269 ), 
        .B(\uut_baud_rate/n63 ), .ZN(\uut_baud_rate/baud_count_next [15]) );
  NAND2_X1 \uut_baud_rate/add_135/U319  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/n73 ), .ZN(\uut_baud_rate/add_135/n267 ) );
  NAND2_X1 \uut_baud_rate/add_135/U318  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_135/n268 ) );
  NAND2_X1 \uut_baud_rate/add_135/U317  ( .A1(\uut_baud_rate/add_135/n56 ), 
        .A2(\uut_baud_rate/add_135/n31 ), .ZN(\uut_baud_rate/add_135/n265 ) );
  NAND2_X1 \uut_baud_rate/add_135/U316  ( .A1(\uut_baud_rate/add_135/n3 ), 
        .A2(\uut_baud_rate/add_135/n5 ), .ZN(\uut_baud_rate/add_135/n266 ) );
  NAND2_X1 \uut_baud_rate/add_135/U315  ( .A1(\uut_baud_rate/add_135/n48 ), 
        .A2(\uut_baud_rate/add_135/n27 ), .ZN(\uut_baud_rate/add_135/n263 ) );
  NAND2_X1 \uut_baud_rate/add_135/U314  ( .A1(\uut_baud_rate/add_135/n20 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .ZN(\uut_baud_rate/add_135/n264 ) );
  NAND2_X1 \uut_baud_rate/add_135/U313  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n261 ) );
  NAND2_X1 \uut_baud_rate/add_135/U312  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n262 ) );
  NAND4_X1 \uut_baud_rate/add_135/U311  ( .A1(\uut_baud_rate/add_135/n259 ), 
        .A2(\uut_baud_rate/add_135/n258 ), .A3(\uut_baud_rate/add_135/n257 ), 
        .A4(\uut_baud_rate/add_135/n260 ), .ZN(\uut_baud_rate/add_135/n256 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U310  ( .A(\uut_baud_rate/add_135/n256 ), 
        .B(\uut_baud_rate/n65 ), .ZN(\uut_baud_rate/baud_count_next [16]) );
  NAND4_X1 \uut_baud_rate/add_135/U309  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/add_135/n3 ), .A3(\uut_baud_rate/add_135/n5 ), .A4(
        \uut_baud_rate/add_135/n56 ), .ZN(\uut_baud_rate/add_135/n254 ) );
  NAND4_X1 \uut_baud_rate/add_135/U308  ( .A1(\uut_baud_rate/n65 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/n71 ), .A4(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/add_135/n255 ) );
  NOR2_X1 \uut_baud_rate/add_135/U307  ( .A1(\uut_baud_rate/add_135/n254 ), 
        .A2(\uut_baud_rate/add_135/n255 ), .ZN(\uut_baud_rate/add_135/n250 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U306  ( .A1(\uut_baud_rate/add_135/n32 ), 
        .A2(\uut_baud_rate/add_135/n19 ), .A3(\uut_baud_rate/add_135/n51 ), 
        .A4(\uut_baud_rate/add_135/n48 ), .ZN(\uut_baud_rate/add_135/n252 ) );
  NAND2_X1 \uut_baud_rate/add_135/U305  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n253 ) );
  NOR2_X1 \uut_baud_rate/add_135/U304  ( .A1(\uut_baud_rate/add_135/n252 ), 
        .A2(\uut_baud_rate/add_135/n253 ), .ZN(\uut_baud_rate/add_135/n251 )
         );
  NAND3_X1 \uut_baud_rate/add_135/U303  ( .A1(\uut_baud_rate/add_135/n251 ), 
        .A2(\uut_baud_rate/add_135/n250 ), .A3(\uut_baud_rate/add_135/n249 ), 
        .ZN(\uut_baud_rate/add_135/n248 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U302  ( .A(\uut_baud_rate/add_135/n248 ), 
        .B(\uut_baud_rate/n67 ), .ZN(\uut_baud_rate/baud_count_next [17]) );
  NAND3_X1 \uut_baud_rate/add_135/U301  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/n73 ), .A3(\uut_baud_rate/add_135/n56 ), .ZN(
        \uut_baud_rate/add_135/n247 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U300  ( .A(\uut_baud_rate/add_135/n241 ), 
        .B(\uut_baud_rate/n13 ), .ZN(\uut_baud_rate/baud_count_next [18]) );
  NAND3_X1 \uut_baud_rate/add_135/U299  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n69 ), .A3(\uut_baud_rate/add_135/n6 ), .ZN(
        \uut_baud_rate/add_135/n240 ) );
  NAND3_X1 \uut_baud_rate/add_135/U298  ( .A1(\uut_baud_rate/add_135/n56 ), 
        .A2(\uut_baud_rate/add_135/n31 ), .A3(\uut_baud_rate/add_135/n47 ), 
        .ZN(\uut_baud_rate/add_135/n237 ) );
  NAND2_X1 \uut_baud_rate/add_135/U297  ( .A1(\uut_baud_rate/add_135/n52 ), 
        .A2(\uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/add_135/n238 ) );
  NAND3_X1 \uut_baud_rate/add_135/U296  ( .A1(\uut_baud_rate/add_135/n28 ), 
        .A2(\uut_baud_rate/add_135/n25 ), .A3(\uut_baud_rate/add_135/n22 ), 
        .ZN(\uut_baud_rate/add_135/n235 ) );
  NAND2_X1 \uut_baud_rate/add_135/U295  ( .A1(\uut_baud_rate/add_135/n34 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n236 ) );
  NAND3_X1 \uut_baud_rate/add_135/U294  ( .A1(\uut_baud_rate/n34 ), .A2(
        \uut_baud_rate/n13 ), .A3(\uut_baud_rate/n63 ), .ZN(
        \uut_baud_rate/add_135/n228 ) );
  NAND2_X1 \uut_baud_rate/add_135/U293  ( .A1(\uut_baud_rate/n65 ), .A2(
        \uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_135/n229 ) );
  NAND2_X1 \uut_baud_rate/add_135/U292  ( .A1(\uut_baud_rate/add_135/n2 ), 
        .A2(\uut_baud_rate/n73 ), .ZN(\uut_baud_rate/add_135/n227 ) );
  NAND3_X1 \uut_baud_rate/add_135/U291  ( .A1(\uut_baud_rate/add_135/n56 ), 
        .A2(\uut_baud_rate/add_135/n31 ), .A3(\uut_baud_rate/add_135/n47 ), 
        .ZN(\uut_baud_rate/add_135/n225 ) );
  NAND2_X1 \uut_baud_rate/add_135/U290  ( .A1(\uut_baud_rate/add_135/n52 ), 
        .A2(\uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/add_135/n226 ) );
  NAND3_X1 \uut_baud_rate/add_135/U289  ( .A1(\uut_baud_rate/add_135/n27 ), 
        .A2(\uut_baud_rate/add_135/n25 ), .A3(\uut_baud_rate/add_135/n22 ), 
        .ZN(\uut_baud_rate/add_135/n223 ) );
  NAND2_X1 \uut_baud_rate/add_135/U288  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n224 ) );
  NAND4_X1 \uut_baud_rate/add_135/U287  ( .A1(\uut_baud_rate/add_135/n219 ), 
        .A2(\uut_baud_rate/add_135/n220 ), .A3(\uut_baud_rate/add_135/n221 ), 
        .A4(\uut_baud_rate/add_135/n222 ), .ZN(\uut_baud_rate/add_135/n218 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U286  ( .A(\uut_baud_rate/add_135/n218 ), 
        .B(\uut_baud_rate/n32 ), .ZN(\uut_baud_rate/baud_count_next [20]) );
  NAND3_X1 \uut_baud_rate/add_135/U285  ( .A1(\uut_baud_rate/n34 ), .A2(
        \uut_baud_rate/n65 ), .A3(\uut_baud_rate/n32 ), .ZN(
        \uut_baud_rate/add_135/n216 ) );
  NAND3_X1 \uut_baud_rate/add_135/U284  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/add_135/n2 ), .A3(\uut_baud_rate/n63 ), .ZN(
        \uut_baud_rate/add_135/n214 ) );
  NAND3_X1 \uut_baud_rate/add_135/U283  ( .A1(\uut_baud_rate/add_135/n56 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n5 ), 
        .ZN(\uut_baud_rate/add_135/n212 ) );
  NAND3_X1 \uut_baud_rate/add_135/U282  ( .A1(\uut_baud_rate/add_135/n43 ), 
        .A2(\uut_baud_rate/add_135/n39 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .ZN(\uut_baud_rate/add_135/n210 ) );
  NAND3_X1 \uut_baud_rate/add_135/U281  ( .A1(\uut_baud_rate/add_135/n46 ), 
        .A2(\uut_baud_rate/add_135/n25 ), .A3(\uut_baud_rate/add_135/n27 ), 
        .ZN(\uut_baud_rate/add_135/n211 ) );
  NAND3_X1 \uut_baud_rate/add_135/U280  ( .A1(\uut_baud_rate/n32 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_135/n203 ) );
  NAND3_X1 \uut_baud_rate/add_135/U279  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/add_135/n3 ), .A3(\uut_baud_rate/n73 ), .ZN(
        \uut_baud_rate/add_135/n201 ) );
  NAND3_X1 \uut_baud_rate/add_135/U278  ( .A1(\uut_baud_rate/n65 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n63 ), .ZN(
        \uut_baud_rate/add_135/n202 ) );
  NAND3_X1 \uut_baud_rate/add_135/U277  ( .A1(\uut_baud_rate/add_135/n56 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n6 ), 
        .ZN(\uut_baud_rate/add_135/n199 ) );
  NAND3_X1 \uut_baud_rate/add_135/U276  ( .A1(\uut_baud_rate/add_135/n43 ), 
        .A2(\uut_baud_rate/add_135/n22 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .ZN(\uut_baud_rate/add_135/n197 ) );
  NAND3_X1 \uut_baud_rate/add_135/U275  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n25 ), .A3(\uut_baud_rate/add_135/n7 ), 
        .ZN(\uut_baud_rate/add_135/n198 ) );
  NAND3_X1 \uut_baud_rate/add_135/U274  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n13 ), .A3(\uut_baud_rate/n30 ), .ZN(
        \uut_baud_rate/add_135/n190 ) );
  NAND3_X1 \uut_baud_rate/add_135/U273  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n73 ), .A3(\uut_baud_rate/n69 ), .ZN(
        \uut_baud_rate/add_135/n188 ) );
  NAND3_X1 \uut_baud_rate/add_135/U272  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/n65 ), .ZN(
        \uut_baud_rate/add_135/n189 ) );
  NAND3_X1 \uut_baud_rate/add_135/U271  ( .A1(\uut_baud_rate/add_135/n2 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n6 ), 
        .ZN(\uut_baud_rate/add_135/n187 ) );
  NAND3_X1 \uut_baud_rate/add_135/U270  ( .A1(\uut_baud_rate/add_135/n43 ), 
        .A2(\uut_baud_rate/add_135/n39 ), .A3(\uut_baud_rate/add_135/n33 ), 
        .ZN(\uut_baud_rate/add_135/n185 ) );
  NAND3_X1 \uut_baud_rate/add_135/U269  ( .A1(\uut_baud_rate/add_135/n46 ), 
        .A2(\uut_baud_rate/add_135/n25 ), .A3(\uut_baud_rate/add_135/n27 ), 
        .ZN(\uut_baud_rate/add_135/n186 ) );
  NAND3_X1 \uut_baud_rate/add_135/U268  ( .A1(\uut_baud_rate/n32 ), .A2(
        \uut_baud_rate/n13 ), .A3(\uut_baud_rate/n34 ), .ZN(
        \uut_baud_rate/add_135/n178 ) );
  NAND3_X1 \uut_baud_rate/add_135/U267  ( .A1(\uut_baud_rate/n59 ), .A2(
        \uut_baud_rate/n61 ), .A3(\uut_baud_rate/n30 ), .ZN(
        \uut_baud_rate/add_135/n179 ) );
  NAND3_X1 \uut_baud_rate/add_135/U266  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/n65 ), .ZN(
        \uut_baud_rate/add_135/n177 ) );
  NAND3_X1 \uut_baud_rate/add_135/U265  ( .A1(\uut_baud_rate/add_135/n32 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n29 ), 
        .ZN(\uut_baud_rate/add_135/n175 ) );
  NAND3_X1 \uut_baud_rate/add_135/U264  ( .A1(\uut_baud_rate/add_135/n3 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n5 ), 
        .ZN(\uut_baud_rate/add_135/n176 ) );
  NAND3_X1 \uut_baud_rate/add_135/U263  ( .A1(\uut_baud_rate/add_135/n43 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .A3(\uut_baud_rate/add_135/n35 ), 
        .ZN(\uut_baud_rate/add_135/n173 ) );
  NAND3_X1 \uut_baud_rate/add_135/U262  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n25 ), .A3(\uut_baud_rate/add_135/n7 ), 
        .ZN(\uut_baud_rate/add_135/n174 ) );
  NAND3_X1 \uut_baud_rate/add_135/U261  ( .A1(\uut_baud_rate/n32 ), .A2(
        \uut_baud_rate/n61 ), .A3(\uut_baud_rate/n34 ), .ZN(
        \uut_baud_rate/add_135/n166 ) );
  NAND3_X1 \uut_baud_rate/add_135/U260  ( .A1(\uut_baud_rate/n59 ), .A2(
        \uut_baud_rate/n28 ), .A3(\uut_baud_rate/n30 ), .ZN(
        \uut_baud_rate/add_135/n167 ) );
  NAND3_X1 \uut_baud_rate/add_135/U259  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n63 ), .A3(\uut_baud_rate/n69 ), .ZN(
        \uut_baud_rate/add_135/n164 ) );
  NAND3_X1 \uut_baud_rate/add_135/U258  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n13 ), .A3(\uut_baud_rate/n65 ), .ZN(
        \uut_baud_rate/add_135/n165 ) );
  NAND3_X1 \uut_baud_rate/add_135/U257  ( .A1(\uut_baud_rate/add_135/n32 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n29 ), 
        .ZN(\uut_baud_rate/add_135/n162 ) );
  NAND3_X1 \uut_baud_rate/add_135/U256  ( .A1(\uut_baud_rate/add_135/n3 ), 
        .A2(\uut_baud_rate/n73 ), .A3(\uut_baud_rate/add_135/n5 ), .ZN(
        \uut_baud_rate/add_135/n163 ) );
  NAND4_X1 \uut_baud_rate/add_135/U255  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n24 ), .A3(\uut_baud_rate/add_135/n33 ), 
        .A4(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n161 ) );
  NOR2_X1 \uut_baud_rate/add_135/U254  ( .A1(\uut_baud_rate/add_135/n161 ), 
        .A2(\uut_baud_rate/add_135/n150 ), .ZN(\uut_baud_rate/add_135/n160 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U253  ( .A(\uut_baud_rate/add_135/n156 ), 
        .B(\uut_baud_rate/n56 ), .ZN(\uut_baud_rate/baud_count_next [25]) );
  NAND3_X1 \uut_baud_rate/add_135/U252  ( .A1(\uut_baud_rate/n61 ), .A2(
        \uut_baud_rate/n30 ), .A3(\uut_baud_rate/n32 ), .ZN(
        \uut_baud_rate/add_135/n154 ) );
  NAND3_X1 \uut_baud_rate/add_135/U251  ( .A1(\uut_baud_rate/n28 ), .A2(
        \uut_baud_rate/n56 ), .A3(\uut_baud_rate/n59 ), .ZN(
        \uut_baud_rate/add_135/n155 ) );
  NAND3_X1 \uut_baud_rate/add_135/U250  ( .A1(\uut_baud_rate/n13 ), .A2(
        \uut_baud_rate/n34 ), .A3(\uut_baud_rate/n67 ), .ZN(
        \uut_baud_rate/add_135/n153 ) );
  NOR2_X1 \uut_baud_rate/add_135/U249  ( .A1(\uut_baud_rate/add_135/n255 ), 
        .A2(\uut_baud_rate/add_135/n153 ), .ZN(\uut_baud_rate/add_135/n146 )
         );
  NAND3_X1 \uut_baud_rate/add_135/U248  ( .A1(\uut_baud_rate/add_135/n31 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n29 ), 
        .ZN(\uut_baud_rate/add_135/n151 ) );
  NAND3_X1 \uut_baud_rate/add_135/U247  ( .A1(\uut_baud_rate/add_135/n2 ), 
        .A2(\uut_baud_rate/n73 ), .A3(\uut_baud_rate/add_135/n5 ), .ZN(
        \uut_baud_rate/add_135/n152 ) );
  NAND4_X1 \uut_baud_rate/add_135/U246  ( .A1(\uut_baud_rate/add_135/n25 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .A4(\uut_baud_rate/add_135/n22 ), .ZN(\uut_baud_rate/add_135/n149 ) );
  NAND3_X1 \uut_baud_rate/add_135/U245  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n7 ), 
        .ZN(\uut_baud_rate/add_135/n150 ) );
  NOR2_X1 \uut_baud_rate/add_135/U244  ( .A1(\uut_baud_rate/add_135/n149 ), 
        .A2(\uut_baud_rate/add_135/n126 ), .ZN(\uut_baud_rate/add_135/n148 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U243  ( .A1(\uut_baud_rate/add_135/n145 ), 
        .A2(\uut_baud_rate/add_135/n146 ), .A3(\uut_baud_rate/add_135/n147 ), 
        .A4(\uut_baud_rate/add_135/n148 ), .ZN(\uut_baud_rate/add_135/n144 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U242  ( .A(\uut_baud_rate/add_135/n144 ), 
        .B(\uut_baud_rate/n15 ), .ZN(\uut_baud_rate/baud_count_next [26]) );
  NAND3_X1 \uut_baud_rate/add_135/U241  ( .A1(\uut_baud_rate/n30 ), .A2(
        \uut_baud_rate/n59 ), .A3(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/add_135/n142 ) );
  NAND3_X1 \uut_baud_rate/add_135/U240  ( .A1(\uut_baud_rate/n56 ), .A2(
        \uut_baud_rate/n15 ), .A3(\uut_baud_rate/n28 ), .ZN(
        \uut_baud_rate/add_135/n143 ) );
  NAND4_X1 \uut_baud_rate/add_135/U239  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n65 ), .A3(\uut_baud_rate/n63 ), .A4(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_135/n140 ) );
  NAND3_X1 \uut_baud_rate/add_135/U238  ( .A1(\uut_baud_rate/n34 ), .A2(
        \uut_baud_rate/n32 ), .A3(\uut_baud_rate/n13 ), .ZN(
        \uut_baud_rate/add_135/n141 ) );
  NOR2_X1 \uut_baud_rate/add_135/U237  ( .A1(\uut_baud_rate/add_135/n140 ), 
        .A2(\uut_baud_rate/add_135/n141 ), .ZN(\uut_baud_rate/add_135/n134 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U236  ( .A1(\uut_baud_rate/add_135/n6 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n31 ), 
        .A4(\uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/add_135/n138 ) );
  NAND3_X1 \uut_baud_rate/add_135/U235  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/n69 ), .A3(\uut_baud_rate/add_135/n3 ), .ZN(
        \uut_baud_rate/add_135/n139 ) );
  NOR2_X1 \uut_baud_rate/add_135/U234  ( .A1(\uut_baud_rate/add_135/n138 ), 
        .A2(\uut_baud_rate/add_135/n139 ), .ZN(\uut_baud_rate/add_135/n135 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U233  ( .A1(\uut_baud_rate/add_135/n25 ), 
        .A2(\uut_baud_rate/add_135/n24 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .A4(\uut_baud_rate/add_135/n22 ), .ZN(\uut_baud_rate/add_135/n137 ) );
  NOR2_X1 \uut_baud_rate/add_135/U232  ( .A1(\uut_baud_rate/add_135/n137 ), 
        .A2(\uut_baud_rate/add_135/n126 ), .ZN(\uut_baud_rate/add_135/n136 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U231  ( .A1(\uut_baud_rate/add_135/n133 ), 
        .A2(\uut_baud_rate/add_135/n134 ), .A3(\uut_baud_rate/add_135/n135 ), 
        .A4(\uut_baud_rate/add_135/n136 ), .ZN(\uut_baud_rate/add_135/n132 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U230  ( .A(\uut_baud_rate/add_135/n132 ), 
        .B(\uut_baud_rate/baud_count [27]), .ZN(
        \uut_baud_rate/baud_count_next [27]) );
  NAND4_X1 \uut_baud_rate/add_135/U229  ( .A1(\uut_baud_rate/n28 ), .A2(
        \uut_baud_rate/n59 ), .A3(\uut_baud_rate/n30 ), .A4(
        \uut_baud_rate/n61 ), .ZN(\uut_baud_rate/add_135/n130 ) );
  NAND3_X1 \uut_baud_rate/add_135/U228  ( .A1(\uut_baud_rate/n15 ), .A2(
        \uut_baud_rate/baud_count [27]), .A3(\uut_baud_rate/n56 ), .ZN(
        \uut_baud_rate/add_135/n131 ) );
  NOR2_X1 \uut_baud_rate/add_135/U227  ( .A1(\uut_baud_rate/add_135/n130 ), 
        .A2(\uut_baud_rate/add_135/n131 ), .ZN(\uut_baud_rate/add_135/n121 )
         );
  NAND3_X1 \uut_baud_rate/add_135/U226  ( .A1(\uut_baud_rate/n34 ), .A2(
        \uut_baud_rate/n32 ), .A3(\uut_baud_rate/n13 ), .ZN(
        \uut_baud_rate/add_135/n129 ) );
  NOR2_X1 \uut_baud_rate/add_135/U225  ( .A1(\uut_baud_rate/add_135/n140 ), 
        .A2(\uut_baud_rate/add_135/n129 ), .ZN(\uut_baud_rate/add_135/n122 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U224  ( .A1(\uut_baud_rate/add_135/n6 ), 
        .A2(\uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n31 ), 
        .A4(\uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/add_135/n127 ) );
  NAND3_X1 \uut_baud_rate/add_135/U223  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/n69 ), .A3(\uut_baud_rate/add_135/n3 ), .ZN(
        \uut_baud_rate/add_135/n128 ) );
  NOR2_X1 \uut_baud_rate/add_135/U222  ( .A1(\uut_baud_rate/add_135/n127 ), 
        .A2(\uut_baud_rate/add_135/n128 ), .ZN(\uut_baud_rate/add_135/n123 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U221  ( .A1(\uut_baud_rate/add_135/n25 ), 
        .A2(\uut_baud_rate/add_135/n24 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .A4(\uut_baud_rate/add_135/n22 ), .ZN(\uut_baud_rate/add_135/n125 ) );
  NAND3_X1 \uut_baud_rate/add_135/U220  ( .A1(\uut_baud_rate/add_135/n46 ), 
        .A2(\uut_baud_rate/add_135/n52 ), .A3(\uut_baud_rate/add_135/n28 ), 
        .ZN(\uut_baud_rate/add_135/n126 ) );
  NOR2_X1 \uut_baud_rate/add_135/U219  ( .A1(\uut_baud_rate/add_135/n125 ), 
        .A2(\uut_baud_rate/add_135/n126 ), .ZN(\uut_baud_rate/add_135/n124 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U218  ( .A1(\uut_baud_rate/add_135/n121 ), 
        .A2(\uut_baud_rate/add_135/n122 ), .A3(\uut_baud_rate/add_135/n123 ), 
        .A4(\uut_baud_rate/add_135/n124 ), .ZN(\uut_baud_rate/add_135/n120 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U217  ( .A(\uut_baud_rate/add_135/n120 ), 
        .B(\uut_baud_rate/baud_count [28]), .ZN(
        \uut_baud_rate/baud_count_next [28]) );
  NAND4_X1 \uut_baud_rate/add_135/U216  ( .A1(\uut_baud_rate/n56 ), .A2(
        \uut_baud_rate/n28 ), .A3(\uut_baud_rate/n59 ), .A4(
        \uut_baud_rate/n30 ), .ZN(\uut_baud_rate/add_135/n118 ) );
  NAND3_X1 \uut_baud_rate/add_135/U215  ( .A1(\uut_baud_rate/baud_count [27]), 
        .A2(\uut_baud_rate/baud_count [28]), .A3(\uut_baud_rate/n15 ), .ZN(
        \uut_baud_rate/add_135/n119 ) );
  NOR2_X1 \uut_baud_rate/add_135/U214  ( .A1(\uut_baud_rate/add_135/n118 ), 
        .A2(\uut_baud_rate/add_135/n119 ), .ZN(\uut_baud_rate/add_135/n108 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U213  ( .A1(\uut_baud_rate/n13 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n65 ), .A4(
        \uut_baud_rate/n63 ), .ZN(\uut_baud_rate/add_135/n116 ) );
  NAND3_X1 \uut_baud_rate/add_135/U212  ( .A1(\uut_baud_rate/n32 ), .A2(
        \uut_baud_rate/n61 ), .A3(\uut_baud_rate/n34 ), .ZN(
        \uut_baud_rate/add_135/n117 ) );
  NOR2_X1 \uut_baud_rate/add_135/U211  ( .A1(\uut_baud_rate/add_135/n116 ), 
        .A2(\uut_baud_rate/add_135/n117 ), .ZN(\uut_baud_rate/add_135/n109 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U210  ( .A1(\uut_baud_rate/add_135/n3 ), 
        .A2(\uut_baud_rate/add_135/n6 ), .A3(\uut_baud_rate/add_135/n56 ), 
        .A4(\uut_baud_rate/add_135/n31 ), .ZN(\uut_baud_rate/add_135/n114 ) );
  NAND3_X1 \uut_baud_rate/add_135/U209  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n73 ), .ZN(
        \uut_baud_rate/add_135/n115 ) );
  NOR2_X1 \uut_baud_rate/add_135/U208  ( .A1(\uut_baud_rate/add_135/n114 ), 
        .A2(\uut_baud_rate/add_135/n115 ), .ZN(\uut_baud_rate/add_135/n110 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U207  ( .A1(\uut_baud_rate/add_135/n25 ), 
        .A2(\uut_baud_rate/add_135/n24 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .A4(\uut_baud_rate/add_135/n22 ), .ZN(\uut_baud_rate/add_135/n112 ) );
  NAND4_X1 \uut_baud_rate/add_135/U206  ( .A1(\uut_baud_rate/add_135/n19 ), 
        .A2(\uut_baud_rate/add_135/n52 ), .A3(\uut_baud_rate/add_135/n46 ), 
        .A4(\uut_baud_rate/add_135/n28 ), .ZN(\uut_baud_rate/add_135/n113 ) );
  NOR2_X1 \uut_baud_rate/add_135/U205  ( .A1(\uut_baud_rate/add_135/n112 ), 
        .A2(\uut_baud_rate/add_135/n113 ), .ZN(\uut_baud_rate/add_135/n111 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U204  ( .A1(\uut_baud_rate/add_135/n108 ), 
        .A2(\uut_baud_rate/add_135/n109 ), .A3(\uut_baud_rate/add_135/n110 ), 
        .A4(\uut_baud_rate/add_135/n111 ), .ZN(\uut_baud_rate/add_135/n107 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U203  ( .A(\uut_baud_rate/add_135/n107 ), 
        .B(\uut_baud_rate/n7 ), .ZN(\uut_baud_rate/baud_count_next [29]) );
  NAND4_X1 \uut_baud_rate/add_135/U202  ( .A1(\uut_baud_rate/n15 ), .A2(
        \uut_baud_rate/n56 ), .A3(\uut_baud_rate/n28 ), .A4(
        \uut_baud_rate/n59 ), .ZN(\uut_baud_rate/add_135/n105 ) );
  NAND3_X1 \uut_baud_rate/add_135/U201  ( .A1(\uut_baud_rate/baud_count [28]), 
        .A2(\uut_baud_rate/n7 ), .A3(\uut_baud_rate/baud_count [27]), .ZN(
        \uut_baud_rate/add_135/n106 ) );
  NOR2_X1 \uut_baud_rate/add_135/U200  ( .A1(\uut_baud_rate/add_135/n105 ), 
        .A2(\uut_baud_rate/add_135/n106 ), .ZN(\uut_baud_rate/add_135/n97 ) );
  NAND4_X1 \uut_baud_rate/add_135/U199  ( .A1(\uut_baud_rate/n13 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n65 ), .A4(
        \uut_baud_rate/n63 ), .ZN(\uut_baud_rate/add_135/n103 ) );
  NAND4_X1 \uut_baud_rate/add_135/U198  ( .A1(\uut_baud_rate/n30 ), .A2(
        \uut_baud_rate/n61 ), .A3(\uut_baud_rate/n32 ), .A4(
        \uut_baud_rate/n34 ), .ZN(\uut_baud_rate/add_135/n104 ) );
  NOR2_X1 \uut_baud_rate/add_135/U197  ( .A1(\uut_baud_rate/add_135/n103 ), 
        .A2(\uut_baud_rate/add_135/n104 ), .ZN(\uut_baud_rate/add_135/n98 ) );
  NOR2_X1 \uut_baud_rate/add_135/U196  ( .A1(\uut_baud_rate/add_135/n90 ), 
        .A2(\uut_baud_rate/add_135/n115 ), .ZN(\uut_baud_rate/add_135/n99 ) );
  NAND4_X1 \uut_baud_rate/add_135/U195  ( .A1(\uut_baud_rate/add_135/n25 ), 
        .A2(\uut_baud_rate/add_135/n24 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .A4(\uut_baud_rate/add_135/n22 ), .ZN(\uut_baud_rate/add_135/n101 ) );
  NAND4_X1 \uut_baud_rate/add_135/U194  ( .A1(\uut_baud_rate/add_135/n19 ), 
        .A2(\uut_baud_rate/add_135/n52 ), .A3(\uut_baud_rate/add_135/n46 ), 
        .A4(\uut_baud_rate/add_135/n7 ), .ZN(\uut_baud_rate/add_135/n102 ) );
  NOR2_X1 \uut_baud_rate/add_135/U193  ( .A1(\uut_baud_rate/add_135/n101 ), 
        .A2(\uut_baud_rate/add_135/n102 ), .ZN(\uut_baud_rate/add_135/n100 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U192  ( .A1(\uut_baud_rate/add_135/n97 ), 
        .A2(\uut_baud_rate/add_135/n98 ), .A3(\uut_baud_rate/add_135/n99 ), 
        .A4(\uut_baud_rate/add_135/n100 ), .ZN(\uut_baud_rate/add_135/n96 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U191  ( .A(\uut_baud_rate/add_135/n96 ), .B(
        \uut_baud_rate/n5 ), .ZN(\uut_baud_rate/baud_count_next [30]) );
  NAND4_X1 \uut_baud_rate/add_135/U190  ( .A1(\uut_baud_rate/baud_count [27]), 
        .A2(\uut_baud_rate/n15 ), .A3(\uut_baud_rate/n56 ), .A4(
        \uut_baud_rate/n28 ), .ZN(\uut_baud_rate/add_135/n94 ) );
  NAND3_X1 \uut_baud_rate/add_135/U189  ( .A1(\uut_baud_rate/n7 ), .A2(
        \uut_baud_rate/n5 ), .A3(\uut_baud_rate/baud_count [28]), .ZN(
        \uut_baud_rate/add_135/n95 ) );
  NOR2_X1 \uut_baud_rate/add_135/U188  ( .A1(\uut_baud_rate/add_135/n94 ), 
        .A2(\uut_baud_rate/add_135/n95 ), .ZN(\uut_baud_rate/add_135/n84 ) );
  NAND4_X1 \uut_baud_rate/add_135/U187  ( .A1(\uut_baud_rate/n34 ), .A2(
        \uut_baud_rate/n13 ), .A3(\uut_baud_rate/n67 ), .A4(
        \uut_baud_rate/n65 ), .ZN(\uut_baud_rate/add_135/n92 ) );
  NAND4_X1 \uut_baud_rate/add_135/U186  ( .A1(\uut_baud_rate/n59 ), .A2(
        \uut_baud_rate/n30 ), .A3(\uut_baud_rate/n61 ), .A4(
        \uut_baud_rate/n32 ), .ZN(\uut_baud_rate/add_135/n93 ) );
  NOR2_X1 \uut_baud_rate/add_135/U185  ( .A1(\uut_baud_rate/add_135/n92 ), 
        .A2(\uut_baud_rate/add_135/n93 ), .ZN(\uut_baud_rate/add_135/n85 ) );
  NAND4_X1 \uut_baud_rate/add_135/U184  ( .A1(\uut_baud_rate/add_135/n3 ), 
        .A2(\uut_baud_rate/add_135/n6 ), .A3(\uut_baud_rate/add_135/n56 ), 
        .A4(\uut_baud_rate/add_135/n31 ), .ZN(\uut_baud_rate/add_135/n90 ) );
  NAND4_X1 \uut_baud_rate/add_135/U183  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n69 ), .A4(
        \uut_baud_rate/n73 ), .ZN(\uut_baud_rate/add_135/n91 ) );
  NOR2_X1 \uut_baud_rate/add_135/U182  ( .A1(\uut_baud_rate/add_135/n114 ), 
        .A2(\uut_baud_rate/add_135/n91 ), .ZN(\uut_baud_rate/add_135/n86 ) );
  NAND4_X1 \uut_baud_rate/add_135/U181  ( .A1(\uut_baud_rate/add_135/n25 ), 
        .A2(\uut_baud_rate/add_135/n24 ), .A3(\uut_baud_rate/add_135/n34 ), 
        .A4(\uut_baud_rate/add_135/n22 ), .ZN(\uut_baud_rate/add_135/n88 ) );
  NAND4_X1 \uut_baud_rate/add_135/U180  ( .A1(\uut_baud_rate/add_135/n19 ), 
        .A2(\uut_baud_rate/add_135/n52 ), .A3(\uut_baud_rate/add_135/n46 ), 
        .A4(\uut_baud_rate/add_135/n27 ), .ZN(\uut_baud_rate/add_135/n89 ) );
  NOR2_X1 \uut_baud_rate/add_135/U179  ( .A1(\uut_baud_rate/add_135/n88 ), 
        .A2(\uut_baud_rate/add_135/n89 ), .ZN(\uut_baud_rate/add_135/n87 ) );
  NAND4_X1 \uut_baud_rate/add_135/U178  ( .A1(\uut_baud_rate/add_135/n84 ), 
        .A2(\uut_baud_rate/add_135/n85 ), .A3(\uut_baud_rate/add_135/n86 ), 
        .A4(\uut_baud_rate/add_135/n87 ), .ZN(\uut_baud_rate/add_135/n83 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U177  ( .A(\uut_baud_rate/add_135/n83 ), .B(
        \uut_baud_rate/baud_count [31]), .ZN(
        \uut_baud_rate/baud_count_next [31]) );
  NAND4_X1 \uut_baud_rate/add_135/U176  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .A3(\uut_baud_rate/add_135/n33 ), 
        .A4(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n79 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U175  ( .A(\uut_baud_rate/add_135/n79 ), .B(
        \uut_baud_rate/add_135/n27 ), .ZN(\uut_baud_rate/baud_count_next [4])
         );
  NAND2_X1 \uut_baud_rate/add_135/U174  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n78 ) );
  NAND3_X1 \uut_baud_rate/add_135/U173  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .A3(\uut_baud_rate/add_135/n21 ), 
        .ZN(\uut_baud_rate/add_135/n75 ) );
  NAND3_X1 \uut_baud_rate/add_135/U172  ( .A1(\uut_baud_rate/add_135/n27 ), 
        .A2(\uut_baud_rate/add_135/n48 ), .A3(\uut_baud_rate/add_135/n26 ), 
        .ZN(\uut_baud_rate/add_135/n76 ) );
  NAND2_X1 \uut_baud_rate/add_135/U171  ( .A1(\uut_baud_rate/add_135/n35 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n73 ) );
  NAND2_X1 \uut_baud_rate/add_135/U170  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n74 ) );
  NAND2_X1 \uut_baud_rate/add_135/U169  ( .A1(\uut_baud_rate/add_135/n71 ), 
        .A2(\uut_baud_rate/add_135/n72 ), .ZN(\uut_baud_rate/add_135/n70 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U168  ( .A(\uut_baud_rate/add_135/n70 ), .B(
        \uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/baud_count_next [7])
         );
  NAND2_X1 \uut_baud_rate/add_135/U167  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n7 ), .ZN(\uut_baud_rate/add_135/n68 ) );
  NAND2_X1 \uut_baud_rate/add_135/U166  ( .A1(\uut_baud_rate/add_135/n20 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .ZN(\uut_baud_rate/add_135/n69 ) );
  NAND2_X1 \uut_baud_rate/add_135/U165  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n66 ) );
  NAND2_X1 \uut_baud_rate/add_135/U164  ( .A1(\uut_baud_rate/add_135/n26 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n67 ) );
  NAND2_X1 \uut_baud_rate/add_135/U163  ( .A1(\uut_baud_rate/add_135/n64 ), 
        .A2(\uut_baud_rate/add_135/n65 ), .ZN(\uut_baud_rate/add_135/n63 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U162  ( .A(\uut_baud_rate/add_135/n63 ), .B(
        \uut_baud_rate/add_135/n32 ), .ZN(\uut_baud_rate/baud_count_next [8])
         );
  NAND2_X1 \uut_baud_rate/add_135/U161  ( .A1(\uut_baud_rate/add_135/n52 ), 
        .A2(\uut_baud_rate/add_135/n48 ), .ZN(\uut_baud_rate/add_135/n61 ) );
  NAND2_X1 \uut_baud_rate/add_135/U160  ( .A1(\uut_baud_rate/add_135/n32 ), 
        .A2(\uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/add_135/n62 ) );
  NAND3_X1 \uut_baud_rate/add_135/U159  ( .A1(\uut_baud_rate/add_135/n58 ), 
        .A2(\uut_baud_rate/add_135/n59 ), .A3(\uut_baud_rate/add_135/n60 ), 
        .ZN(\uut_baud_rate/add_135/n57 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U158  ( .A(\uut_baud_rate/add_135/n57 ), .B(
        \uut_baud_rate/add_135/n56 ), .ZN(\uut_baud_rate/baud_count_next [9])
         );
  NAND2_X1 \uut_baud_rate/add_135/U157  ( .A1(\uut_baud_rate/add_135/n231 ), 
        .A2(\uut_baud_rate/add_135/n232 ), .ZN(\uut_baud_rate/add_135/n230 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U156  ( .A(\uut_baud_rate/add_135/n230 ), 
        .B(\uut_baud_rate/n34 ), .ZN(\uut_baud_rate/baud_count_next [19]) );
  XNOR2_X1 \uut_baud_rate/add_135/U155  ( .A(\uut_baud_rate/add_135/n192 ), 
        .B(\uut_baud_rate/n30 ), .ZN(\uut_baud_rate/baud_count_next [22]) );
  XNOR2_X1 \uut_baud_rate/add_135/U154  ( .A(\uut_baud_rate/add_135/n168 ), 
        .B(\uut_baud_rate/n28 ), .ZN(\uut_baud_rate/baud_count_next [24]) );
  NAND4_X1 \uut_baud_rate/add_135/U153  ( .A1(\uut_baud_rate/add_135/n171 ), 
        .A2(\uut_baud_rate/add_135/n170 ), .A3(\uut_baud_rate/add_135/n169 ), 
        .A4(\uut_baud_rate/add_135/n172 ), .ZN(\uut_baud_rate/add_135/n168 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U152  ( .A1(\uut_baud_rate/add_135/n237 ), 
        .A2(\uut_baud_rate/add_135/n238 ), .ZN(\uut_baud_rate/add_135/n233 )
         );
  INV_X1 \uut_baud_rate/add_135/U151  ( .A(\uut_baud_rate/baud_count [5]), 
        .ZN(\uut_baud_rate/add_135/n50 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U150  ( .A(\uut_baud_rate/add_135/n50 ), 
        .Z(\uut_baud_rate/add_135/n49 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U149  ( .A(\uut_baud_rate/add_135/n205 ), 
        .B(\uut_baud_rate/n61 ), .ZN(\uut_baud_rate/baud_count_next [21]) );
  INV_X1 \uut_baud_rate/add_135/U148  ( .A(\uut_baud_rate/baud_count [0]), 
        .ZN(\uut_baud_rate/add_135/n41 ) );
  NAND2_X1 \uut_baud_rate/add_135/U147  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n21 ), .ZN(\uut_baud_rate/add_135/n82 ) );
  INV_X1 \uut_baud_rate/add_135/U146  ( .A(\uut_baud_rate/add_135/n82 ), .ZN(
        \uut_baud_rate/add_135/n81 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U145  ( .A(\uut_baud_rate/add_135/n82 ), .B(
        \uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/baud_count_next [2])
         );
  INV_X1 \uut_baud_rate/add_135/U144  ( .A(\uut_baud_rate/baud_count [6]), 
        .ZN(\uut_baud_rate/add_135/n53 ) );
  INV_X1 \uut_baud_rate/add_135/U143  ( .A(\uut_baud_rate/baud_count_next [0]), 
        .ZN(\uut_baud_rate/add_135/n39 ) );
  NAND4_X1 \uut_baud_rate/add_135/U142  ( .A1(\uut_baud_rate/add_135/n183 ), 
        .A2(\uut_baud_rate/add_135/n182 ), .A3(\uut_baud_rate/add_135/n181 ), 
        .A4(\uut_baud_rate/add_135/n184 ), .ZN(\uut_baud_rate/add_135/n180 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U141  ( .A(\uut_baud_rate/add_135/n180 ), 
        .B(\uut_baud_rate/n59 ), .ZN(\uut_baud_rate/baud_count_next [23]) );
  INV_X1 \uut_baud_rate/add_135/U140  ( .A(\uut_baud_rate/add_135/n50 ), .ZN(
        \uut_baud_rate/add_135/n48 ) );
  INV_X2 \uut_baud_rate/add_135/U139  ( .A(\uut_baud_rate/add_135/n50 ), .ZN(
        \uut_baud_rate/add_135/n47 ) );
  BUF_X4 \uut_baud_rate/add_135/U138  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_135/n56 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U137  ( .A(\uut_baud_rate/add_135/n42 ), 
        .Z(\uut_baud_rate/add_135/n43 ) );
  NAND2_X1 \uut_baud_rate/add_135/U136  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/n69 ), .ZN(\uut_baud_rate/add_135/n215 ) );
  AND3_X1 \uut_baud_rate/add_135/U135  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/n69 ), .A3(\uut_baud_rate/add_135/n3 ), .ZN(
        \uut_baud_rate/add_135/n281 ) );
  AND3_X1 \uut_baud_rate/add_135/U134  ( .A1(\uut_baud_rate/n69 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n73 ), .ZN(
        \uut_baud_rate/add_135/n270 ) );
  NAND2_X1 \uut_baud_rate/add_135/U133  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n13 ), .ZN(\uut_baud_rate/add_135/n217 ) );
  NAND2_X1 \uut_baud_rate/add_135/U132  ( .A1(\uut_baud_rate/n13 ), .A2(
        \uut_baud_rate/n34 ), .ZN(\uut_baud_rate/add_135/n204 ) );
  NAND2_X1 \uut_baud_rate/add_135/U131  ( .A1(\uut_baud_rate/n34 ), .A2(
        \uut_baud_rate/n32 ), .ZN(\uut_baud_rate/add_135/n191 ) );
  NOR2_X1 \uut_baud_rate/add_135/U130  ( .A1(\uut_baud_rate/add_135/n235 ), 
        .A2(\uut_baud_rate/add_135/n236 ), .ZN(\uut_baud_rate/add_135/n234 )
         );
  AND3_X1 \uut_baud_rate/add_135/U129  ( .A1(\uut_baud_rate/add_135/n27 ), 
        .A2(\uut_baud_rate/add_135/n26 ), .A3(\uut_baud_rate/add_135/n21 ), 
        .ZN(\uut_baud_rate/add_135/n60 ) );
  AND3_X1 \uut_baud_rate/add_135/U128  ( .A1(\uut_baud_rate/add_135/n7 ), .A2(
        \uut_baud_rate/add_135/n26 ), .A3(\uut_baud_rate/add_135/n21 ), .ZN(
        \uut_baud_rate/add_135/n249 ) );
  NAND4_X1 \uut_baud_rate/add_135/U127  ( .A1(\uut_baud_rate/add_135/n195 ), 
        .A2(\uut_baud_rate/add_135/n194 ), .A3(\uut_baud_rate/add_135/n193 ), 
        .A4(\uut_baud_rate/add_135/n196 ), .ZN(\uut_baud_rate/add_135/n192 )
         );
  AND2_X1 \uut_baud_rate/add_135/U126  ( .A1(\uut_baud_rate/add_135/n233 ), 
        .A2(\uut_baud_rate/add_135/n234 ), .ZN(\uut_baud_rate/add_135/n232 )
         );
  BUF_X1 \uut_baud_rate/add_135/U125  ( .A(\uut_baud_rate/add_135/n41 ), .Z(
        \uut_baud_rate/baud_count_next [0]) );
  AND2_X1 \uut_baud_rate/add_135/U124  ( .A1(\uut_baud_rate/add_135/n51 ), 
        .A2(\uut_baud_rate/add_135/n47 ), .ZN(\uut_baud_rate/add_135/n244 ) );
  AND3_X1 \uut_baud_rate/add_135/U123  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n27 ), 
        .ZN(\uut_baud_rate/add_135/n292 ) );
  AND3_X1 \uut_baud_rate/add_135/U122  ( .A1(\uut_baud_rate/add_135/n47 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n27 ), 
        .ZN(\uut_baud_rate/add_135/n283 ) );
  AND3_X1 \uut_baud_rate/add_135/U121  ( .A1(\uut_baud_rate/add_135/n48 ), 
        .A2(\uut_baud_rate/add_135/n51 ), .A3(\uut_baud_rate/add_135/n7 ), 
        .ZN(\uut_baud_rate/add_135/n71 ) );
  NOR2_X1 \uut_baud_rate/add_135/U120  ( .A1(\uut_baud_rate/add_135/n212 ), 
        .A2(\uut_baud_rate/add_135/n213 ), .ZN(\uut_baud_rate/add_135/n208 )
         );
  NAND4_X1 \uut_baud_rate/add_135/U119  ( .A1(\uut_baud_rate/add_135/n208 ), 
        .A2(\uut_baud_rate/add_135/n207 ), .A3(\uut_baud_rate/add_135/n206 ), 
        .A4(\uut_baud_rate/add_135/n209 ), .ZN(\uut_baud_rate/add_135/n205 )
         );
  AND3_X1 \uut_baud_rate/add_135/U118  ( .A1(\uut_baud_rate/add_135/n243 ), 
        .A2(\uut_baud_rate/add_135/n244 ), .A3(\uut_baud_rate/add_135/n245 ), 
        .ZN(\uut_baud_rate/add_135/n37 ) );
  NAND2_X1 \uut_baud_rate/add_135/U117  ( .A1(\uut_baud_rate/add_135/n37 ), 
        .A2(\uut_baud_rate/add_135/n38 ), .ZN(\uut_baud_rate/add_135/n241 ) );
  NOR2_X1 \uut_baud_rate/add_135/U116  ( .A1(\uut_baud_rate/add_135/n276 ), 
        .A2(\uut_baud_rate/add_135/n277 ), .ZN(\uut_baud_rate/add_135/n272 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U115  ( .A1(\uut_baud_rate/add_135/n263 ), 
        .A2(\uut_baud_rate/add_135/n264 ), .ZN(\uut_baud_rate/add_135/n259 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U114  ( .A1(\uut_baud_rate/add_135/n175 ), 
        .A2(\uut_baud_rate/add_135/n187 ), .ZN(\uut_baud_rate/add_135/n183 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U113  ( .A1(\uut_baud_rate/add_135/n199 ), 
        .A2(\uut_baud_rate/add_135/n200 ), .ZN(\uut_baud_rate/add_135/n195 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U112  ( .A1(\uut_baud_rate/add_135/n175 ), 
        .A2(\uut_baud_rate/add_135/n176 ), .ZN(\uut_baud_rate/add_135/n171 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U111  ( .A1(\uut_baud_rate/add_135/n162 ), 
        .A2(\uut_baud_rate/add_135/n163 ), .ZN(\uut_baud_rate/add_135/n159 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U110  ( .A1(\uut_baud_rate/add_135/n164 ), 
        .A2(\uut_baud_rate/add_135/n165 ), .ZN(\uut_baud_rate/add_135/n158 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U109  ( .A1(\uut_baud_rate/add_135/n166 ), 
        .A2(\uut_baud_rate/add_135/n167 ), .ZN(\uut_baud_rate/add_135/n157 )
         );
  NAND3_X1 \uut_baud_rate/add_135/U108  ( .A1(\uut_baud_rate/add_135/n160 ), 
        .A2(\uut_baud_rate/add_135/n159 ), .A3(\uut_baud_rate/add_135/n13 ), 
        .ZN(\uut_baud_rate/add_135/n156 ) );
  NOR2_X1 \uut_baud_rate/add_135/U107  ( .A1(\uut_baud_rate/add_135/n301 ), 
        .A2(\uut_baud_rate/add_135/n302 ), .ZN(\uut_baud_rate/add_135/n297 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U106  ( .A1(\uut_baud_rate/add_135/n308 ), 
        .A2(\uut_baud_rate/add_135/n309 ), .ZN(\uut_baud_rate/add_135/n304 )
         );
  NAND2_X1 \uut_baud_rate/add_135/U105  ( .A1(\uut_baud_rate/add_135/n297 ), 
        .A2(\uut_baud_rate/add_135/n298 ), .ZN(\uut_baud_rate/add_135/n296 )
         );
  NAND2_X1 \uut_baud_rate/add_135/U104  ( .A1(\uut_baud_rate/add_135/n304 ), 
        .A2(\uut_baud_rate/add_135/n305 ), .ZN(\uut_baud_rate/add_135/n303 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U103  ( .A(\uut_baud_rate/add_135/n310 ), 
        .B(\uut_baud_rate/add_135/n5 ), .ZN(
        \uut_baud_rate/baud_count_next [10]) );
  NOR2_X1 \uut_baud_rate/add_135/U102  ( .A1(\uut_baud_rate/add_135/n197 ), 
        .A2(\uut_baud_rate/add_135/n198 ), .ZN(\uut_baud_rate/add_135/n196 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U101  ( .A1(\uut_baud_rate/add_135/n173 ), 
        .A2(\uut_baud_rate/add_135/n174 ), .ZN(\uut_baud_rate/add_135/n172 )
         );
  AND3_X1 \uut_baud_rate/add_135/U100  ( .A1(\uut_baud_rate/add_135/n3 ), .A2(
        \uut_baud_rate/n73 ), .A3(\uut_baud_rate/add_135/n6 ), .ZN(
        \uut_baud_rate/add_135/n290 ) );
  AND3_X1 \uut_baud_rate/add_135/U99  ( .A1(\uut_baud_rate/add_135/n7 ), .A2(
        \uut_baud_rate/add_135/n25 ), .A3(\uut_baud_rate/add_135/n21 ), .ZN(
        \uut_baud_rate/add_135/n36 ) );
  AND2_X1 \uut_baud_rate/add_135/U98  ( .A1(\uut_baud_rate/add_135/n242 ), 
        .A2(\uut_baud_rate/add_135/n36 ), .ZN(\uut_baud_rate/add_135/n38 ) );
  AND2_X1 \uut_baud_rate/add_135/U97  ( .A1(\uut_baud_rate/add_135/n35 ), .A2(
        \uut_baud_rate/add_135/n24 ), .ZN(\uut_baud_rate/add_135/n245 ) );
  NAND2_X1 \uut_baud_rate/add_135/U96  ( .A1(\uut_baud_rate/add_135/n33 ), 
        .A2(\uut_baud_rate/add_135/n23 ), .ZN(\uut_baud_rate/add_135/n314 ) );
  AND2_X1 \uut_baud_rate/add_135/U95  ( .A1(\uut_baud_rate/add_135/n35 ), .A2(
        \uut_baud_rate/add_135/n24 ), .ZN(\uut_baud_rate/add_135/n58 ) );
  NAND2_X1 \uut_baud_rate/add_135/U94  ( .A1(\uut_baud_rate/add_135/n23 ), 
        .A2(\uut_baud_rate/add_135/n81 ), .ZN(\uut_baud_rate/add_135/n80 ) );
  NAND2_X1 \uut_baud_rate/add_135/U93  ( .A1(\uut_baud_rate/add_135/n311 ), 
        .A2(\uut_baud_rate/add_135/n312 ), .ZN(\uut_baud_rate/add_135/n310 )
         );
  INV_X2 \uut_baud_rate/add_135/U92  ( .A(\uut_baud_rate/add_135/n53 ), .ZN(
        \uut_baud_rate/add_135/n51 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U91  ( .A(\uut_baud_rate/add_135/n80 ), .B(
        \uut_baud_rate/add_135/n26 ), .ZN(\uut_baud_rate/baud_count_next [3])
         );
  CLKBUF_X3 \uut_baud_rate/add_135/U90  ( .A(\uut_baud_rate/baud_count [0]), 
        .Z(\uut_baud_rate/add_135/n21 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U89  ( .A(\uut_baud_rate/add_135/n45 ), .Z(
        \uut_baud_rate/add_135/n28 ) );
  BUF_X2 \uut_baud_rate/add_135/U88  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_135/n24 ) );
  BUF_X1 \uut_baud_rate/add_135/U87  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_135/n42 ) );
  BUF_X1 \uut_baud_rate/add_135/U86  ( .A(\uut_baud_rate/add_135/n54 ), .Z(
        \uut_baud_rate/add_135/n30 ) );
  BUF_X1 \uut_baud_rate/add_135/U85  ( .A(\uut_baud_rate/add_135/n30 ), .Z(
        \uut_baud_rate/add_135/n20 ) );
  NOR2_X1 \uut_baud_rate/add_135/U84  ( .A1(\uut_baud_rate/add_135/n190 ), 
        .A2(\uut_baud_rate/add_135/n191 ), .ZN(\uut_baud_rate/add_135/n181 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U83  ( .A1(\uut_baud_rate/add_135/n178 ), 
        .A2(\uut_baud_rate/add_135/n179 ), .ZN(\uut_baud_rate/add_135/n169 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U82  ( .A1(\uut_baud_rate/add_135/n216 ), 
        .A2(\uut_baud_rate/add_135/n217 ), .ZN(\uut_baud_rate/add_135/n206 )
         );
  CLKBUF_X3 \uut_baud_rate/add_135/U81  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_135/n23 ) );
  NAND2_X1 \uut_baud_rate/add_135/U80  ( .A1(\uut_baud_rate/add_135/n3 ), .A2(
        \uut_baud_rate/n73 ), .ZN(\uut_baud_rate/add_135/n18 ) );
  NAND2_X1 \uut_baud_rate/add_135/U79  ( .A1(\uut_baud_rate/n65 ), .A2(
        \uut_baud_rate/n63 ), .ZN(\uut_baud_rate/add_135/n17 ) );
  NAND2_X1 \uut_baud_rate/add_135/U78  ( .A1(\uut_baud_rate/n13 ), .A2(
        \uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_135/n16 ) );
  OR3_X1 \uut_baud_rate/add_135/U77  ( .A1(\uut_baud_rate/add_135/n18 ), .A2(
        \uut_baud_rate/add_135/n17 ), .A3(\uut_baud_rate/add_135/n16 ), .ZN(
        \uut_baud_rate/add_135/n239 ) );
  BUF_X1 \uut_baud_rate/add_135/U76  ( .A(\uut_baud_rate/baud_count [7]), .Z(
        \uut_baud_rate/add_135/n54 ) );
  BUF_X1 \uut_baud_rate/add_135/U75  ( .A(\uut_baud_rate/baud_count [3]), .Z(
        \uut_baud_rate/add_135/n44 ) );
  BUF_X1 \uut_baud_rate/add_135/U74  ( .A(\uut_baud_rate/baud_count [4]), .Z(
        \uut_baud_rate/add_135/n45 ) );
  NOR2_X1 \uut_baud_rate/add_135/U73  ( .A1(\uut_baud_rate/add_135/n154 ), 
        .A2(\uut_baud_rate/add_135/n155 ), .ZN(\uut_baud_rate/add_135/n145 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U72  ( .A1(\uut_baud_rate/add_135/n239 ), 
        .A2(\uut_baud_rate/add_135/n240 ), .ZN(\uut_baud_rate/add_135/n231 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U71  ( .A1(\uut_baud_rate/add_135/n188 ), 
        .A2(\uut_baud_rate/add_135/n177 ), .ZN(\uut_baud_rate/add_135/n170 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U70  ( .A1(\uut_baud_rate/add_135/n203 ), 
        .A2(\uut_baud_rate/add_135/n204 ), .ZN(\uut_baud_rate/add_135/n193 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U69  ( .A1(\uut_baud_rate/add_135/n228 ), 
        .A2(\uut_baud_rate/add_135/n229 ), .ZN(\uut_baud_rate/add_135/n219 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U68  ( .A1(\uut_baud_rate/add_135/n142 ), 
        .A2(\uut_baud_rate/add_135/n143 ), .ZN(\uut_baud_rate/add_135/n133 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U67  ( .A1(\uut_baud_rate/add_135/n240 ), 
        .A2(\uut_baud_rate/add_135/n227 ), .ZN(\uut_baud_rate/add_135/n220 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U66  ( .A1(\uut_baud_rate/add_135/n201 ), 
        .A2(\uut_baud_rate/add_135/n202 ), .ZN(\uut_baud_rate/add_135/n194 )
         );
  AND3_X1 \uut_baud_rate/add_135/U65  ( .A1(\uut_baud_rate/add_135/n32 ), .A2(
        \uut_baud_rate/add_135/n56 ), .A3(\uut_baud_rate/add_135/n29 ), .ZN(
        \uut_baud_rate/add_135/n291 ) );
  NOR2_X1 \uut_baud_rate/add_135/U64  ( .A1(\uut_baud_rate/add_135/n73 ), .A2(
        \uut_baud_rate/add_135/n74 ), .ZN(\uut_baud_rate/add_135/n72 ) );
  NAND2_X1 \uut_baud_rate/add_135/U63  ( .A1(\uut_baud_rate/add_135/n51 ), 
        .A2(\uut_baud_rate/add_135/n20 ), .ZN(\uut_baud_rate/add_135/n15 ) );
  NAND3_X1 \uut_baud_rate/add_135/U62  ( .A1(\uut_baud_rate/add_135/n32 ), 
        .A2(\uut_baud_rate/add_135/n48 ), .A3(\uut_baud_rate/add_135/n56 ), 
        .ZN(\uut_baud_rate/add_135/n14 ) );
  NOR2_X1 \uut_baud_rate/add_135/U61  ( .A1(\uut_baud_rate/add_135/n14 ), .A2(
        \uut_baud_rate/add_135/n15 ), .ZN(\uut_baud_rate/add_135/n311 ) );
  INV_X1 \uut_baud_rate/add_135/U60  ( .A(\uut_baud_rate/add_135/n53 ), .ZN(
        \uut_baud_rate/add_135/n52 ) );
  INV_X1 \uut_baud_rate/add_135/U59  ( .A(\uut_baud_rate/add_135/n50 ), .ZN(
        \uut_baud_rate/add_135/n46 ) );
  AND2_X1 \uut_baud_rate/add_135/U58  ( .A1(\uut_baud_rate/add_135/n158 ), 
        .A2(\uut_baud_rate/add_135/n157 ), .ZN(\uut_baud_rate/add_135/n13 ) );
  NOR2_X1 \uut_baud_rate/add_135/U57  ( .A1(\uut_baud_rate/add_135/n287 ), 
        .A2(\uut_baud_rate/add_135/n288 ), .ZN(\uut_baud_rate/add_135/n282 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U56  ( .A1(\uut_baud_rate/add_135/n265 ), 
        .A2(\uut_baud_rate/add_135/n266 ), .ZN(\uut_baud_rate/add_135/n258 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U55  ( .A1(\uut_baud_rate/add_135/n278 ), 
        .A2(\uut_baud_rate/add_135/n279 ), .ZN(\uut_baud_rate/add_135/n271 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U54  ( .A1(\uut_baud_rate/add_135/n299 ), 
        .A2(\uut_baud_rate/add_135/n300 ), .ZN(\uut_baud_rate/add_135/n298 )
         );
  NAND2_X1 \uut_baud_rate/add_135/U53  ( .A1(\uut_baud_rate/add_135/n29 ), 
        .A2(\uut_baud_rate/add_135/n32 ), .ZN(\uut_baud_rate/add_135/n309 ) );
  NOR2_X1 \uut_baud_rate/add_135/U52  ( .A1(\uut_baud_rate/add_135/n261 ), 
        .A2(\uut_baud_rate/add_135/n262 ), .ZN(\uut_baud_rate/add_135/n260 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U51  ( .A1(\uut_baud_rate/add_135/n274 ), 
        .A2(\uut_baud_rate/add_135/n275 ), .ZN(\uut_baud_rate/add_135/n273 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U50  ( .A1(\uut_baud_rate/add_135/n285 ), 
        .A2(\uut_baud_rate/add_135/n286 ), .ZN(\uut_baud_rate/add_135/n284 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U49  ( .A1(\uut_baud_rate/add_135/n294 ), 
        .A2(\uut_baud_rate/add_135/n295 ), .ZN(\uut_baud_rate/add_135/n293 )
         );
  NAND2_X1 \uut_baud_rate/add_135/U48  ( .A1(\uut_baud_rate/add_135/n29 ), 
        .A2(\uut_baud_rate/add_135/n32 ), .ZN(\uut_baud_rate/add_135/n213 ) );
  NOR2_X1 \uut_baud_rate/add_135/U47  ( .A1(\uut_baud_rate/add_135/n151 ), 
        .A2(\uut_baud_rate/add_135/n152 ), .ZN(\uut_baud_rate/add_135/n147 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U46  ( .A1(\uut_baud_rate/add_135/n223 ), 
        .A2(\uut_baud_rate/add_135/n224 ), .ZN(\uut_baud_rate/add_135/n222 )
         );
  NAND2_X1 \uut_baud_rate/add_135/U45  ( .A1(\uut_baud_rate/add_135/n29 ), 
        .A2(\uut_baud_rate/add_135/n32 ), .ZN(\uut_baud_rate/add_135/n200 ) );
  NOR2_X1 \uut_baud_rate/add_135/U44  ( .A1(\uut_baud_rate/add_135/n225 ), 
        .A2(\uut_baud_rate/add_135/n226 ), .ZN(\uut_baud_rate/add_135/n221 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U43  ( .A1(\uut_baud_rate/add_135/n185 ), 
        .A2(\uut_baud_rate/add_135/n186 ), .ZN(\uut_baud_rate/add_135/n184 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U42  ( .A1(\uut_baud_rate/add_135/n210 ), 
        .A2(\uut_baud_rate/add_135/n211 ), .ZN(\uut_baud_rate/add_135/n209 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U41  ( .A1(\uut_baud_rate/add_135/n246 ), 
        .A2(\uut_baud_rate/add_135/n247 ), .ZN(\uut_baud_rate/add_135/n242 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U40  ( .A1(\uut_baud_rate/add_135/n214 ), 
        .A2(\uut_baud_rate/add_135/n215 ), .ZN(\uut_baud_rate/add_135/n207 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U39  ( .A1(\uut_baud_rate/add_135/n306 ), 
        .A2(\uut_baud_rate/add_135/n307 ), .ZN(\uut_baud_rate/add_135/n305 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U38  ( .A(\uut_baud_rate/add_135/n303 ), .B(
        \uut_baud_rate/add_135/n2 ), .ZN(\uut_baud_rate/baud_count_next [11])
         );
  NOR2_X1 \uut_baud_rate/add_135/U37  ( .A1(\uut_baud_rate/add_135/n188 ), 
        .A2(\uut_baud_rate/add_135/n189 ), .ZN(\uut_baud_rate/add_135/n182 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U36  ( .A1(\uut_baud_rate/add_135/n267 ), 
        .A2(\uut_baud_rate/add_135/n268 ), .ZN(\uut_baud_rate/add_135/n257 )
         );
  XNOR2_X1 \uut_baud_rate/add_135/U35  ( .A(\uut_baud_rate/add_135/n296 ), .B(
        \uut_baud_rate/n73 ), .ZN(\uut_baud_rate/baud_count_next [12]) );
  NOR2_X1 \uut_baud_rate/add_135/U34  ( .A1(\uut_baud_rate/add_135/n313 ), 
        .A2(\uut_baud_rate/add_135/n314 ), .ZN(\uut_baud_rate/add_135/n312 )
         );
  NOR2_X1 \uut_baud_rate/add_135/U33  ( .A1(\uut_baud_rate/add_135/n223 ), 
        .A2(\uut_baud_rate/add_135/n78 ), .ZN(\uut_baud_rate/add_135/n77 ) );
  XNOR2_X1 \uut_baud_rate/add_135/U32  ( .A(\uut_baud_rate/add_135/n49 ), .B(
        \uut_baud_rate/add_135/n77 ), .ZN(\uut_baud_rate/baud_count_next [5])
         );
  NOR2_X1 \uut_baud_rate/add_135/U31  ( .A1(\uut_baud_rate/add_135/n68 ), .A2(
        \uut_baud_rate/add_135/n69 ), .ZN(\uut_baud_rate/add_135/n64 ) );
  NOR2_X1 \uut_baud_rate/add_135/U30  ( .A1(\uut_baud_rate/add_135/n61 ), .A2(
        \uut_baud_rate/add_135/n62 ), .ZN(\uut_baud_rate/add_135/n59 ) );
  AND2_X1 \uut_baud_rate/add_135/U29  ( .A1(\uut_baud_rate/add_135/n31 ), .A2(
        \uut_baud_rate/add_135/n29 ), .ZN(\uut_baud_rate/add_135/n243 ) );
  XOR2_X1 \uut_baud_rate/add_135/U28  ( .A(\uut_baud_rate/add_135/n35 ), .B(
        \uut_baud_rate/add_135/n21 ), .Z(\uut_baud_rate/baud_count_next [1])
         );
  NOR2_X1 \uut_baud_rate/add_135/U27  ( .A1(\uut_baud_rate/add_135/n66 ), .A2(
        \uut_baud_rate/add_135/n67 ), .ZN(\uut_baud_rate/add_135/n65 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U26  ( .A(\uut_baud_rate/n79 ), .Z(
        \uut_baud_rate/add_135/n34 ) );
  AND2_X1 \uut_baud_rate/add_135/U25  ( .A1(\uut_baud_rate/add_135/n4 ), .A2(
        \uut_baud_rate/add_135/n1 ), .ZN(\uut_baud_rate/add_135/n11 ) );
  AND2_X1 \uut_baud_rate/add_135/U24  ( .A1(\uut_baud_rate/n63 ), .A2(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_135/n10 ) );
  AND2_X1 \uut_baud_rate/add_135/U23  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n65 ), .ZN(\uut_baud_rate/add_135/n9 ) );
  NAND3_X1 \uut_baud_rate/add_135/U22  ( .A1(\uut_baud_rate/add_135/n9 ), .A2(
        \uut_baud_rate/add_135/n10 ), .A3(\uut_baud_rate/add_135/n11 ), .ZN(
        \uut_baud_rate/add_135/n246 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U21  ( .A(\uut_baud_rate/add_135/n54 ), .Z(
        \uut_baud_rate/add_135/n29 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U20  ( .A(\uut_baud_rate/add_135/n44 ), .Z(
        \uut_baud_rate/add_135/n25 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U19  ( .A(\uut_baud_rate/add_135/n45 ), .Z(
        \uut_baud_rate/add_135/n27 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U18  ( .A(\uut_baud_rate/add_135/n55 ), .Z(
        \uut_baud_rate/add_135/n31 ) );
  NOR2_X1 \uut_baud_rate/add_135/U17  ( .A1(\uut_baud_rate/add_135/n75 ), .A2(
        \uut_baud_rate/add_135/n76 ), .ZN(\uut_baud_rate/add_135/n8 ) );
  XOR2_X1 \uut_baud_rate/add_135/U16  ( .A(\uut_baud_rate/add_135/n51 ), .B(
        \uut_baud_rate/add_135/n8 ), .Z(\uut_baud_rate/baud_count_next [6]) );
  CLKBUF_X3 \uut_baud_rate/add_135/U15  ( .A(\uut_baud_rate/n79 ), .Z(
        \uut_baud_rate/add_135/n33 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U14  ( .A(\uut_baud_rate/add_135/n45 ), .Z(
        \uut_baud_rate/add_135/n7 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U13  ( .A(\uut_baud_rate/add_135/n55 ), .Z(
        \uut_baud_rate/add_135/n32 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U12  ( .A(\uut_baud_rate/baud_count [0]), 
        .Z(\uut_baud_rate/add_135/n22 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U11  ( .A(\uut_baud_rate/baud_count [8]), 
        .Z(\uut_baud_rate/add_135/n55 ) );
  CLKBUF_X2 \uut_baud_rate/add_135/U10  ( .A(\uut_baud_rate/add_135/n44 ), .Z(
        \uut_baud_rate/add_135/n26 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U9  ( .A(\uut_baud_rate/n78 ), .Z(
        \uut_baud_rate/add_135/n6 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U8  ( .A(\uut_baud_rate/n78 ), .Z(
        \uut_baud_rate/add_135/n5 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U7  ( .A(\uut_baud_rate/n78 ), .Z(
        \uut_baud_rate/add_135/n4 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U6  ( .A(\uut_baud_rate/n79 ), .Z(
        \uut_baud_rate/add_135/n35 ) );
  BUF_X2 \uut_baud_rate/add_135/U5  ( .A(\uut_baud_rate/add_135/n30 ), .Z(
        \uut_baud_rate/add_135/n19 ) );
  CLKBUF_X3 \uut_baud_rate/add_135/U4  ( .A(\uut_baud_rate/n75 ), .Z(
        \uut_baud_rate/add_135/n3 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U3  ( .A(\uut_baud_rate/n75 ), .Z(
        \uut_baud_rate/add_135/n2 ) );
  CLKBUF_X1 \uut_baud_rate/add_135/U2  ( .A(\uut_baud_rate/n75 ), .Z(
        \uut_baud_rate/add_135/n1 ) );
  NAND4_X1 \uut_baud_rate/eq_134/U61  ( .A1(\uut_baud_rate/eq_134/n37 ), .A2(
        \uut_baud_rate/eq_134/n36 ), .A3(\uut_baud_rate/eq_134/n35 ), .A4(
        \uut_baud_rate/eq_134/n38 ), .ZN(\uut_baud_rate/eq_134/n7 ) );
  NAND4_X1 \uut_baud_rate/eq_134/U60  ( .A1(\uut_baud_rate/eq_134/n10 ), .A2(
        \uut_baud_rate/eq_134/n9 ), .A3(\uut_baud_rate/eq_134/n11 ), .A4(
        \uut_baud_rate/eq_134/n12 ), .ZN(\uut_baud_rate/eq_134/n8 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U59  ( .A1(\uut_baud_rate/eq_134/n8 ), .A2(
        \uut_baud_rate/eq_134/n7 ), .ZN(\uut_baud_rate/baud_hit ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U58  ( .A(\uut_baud_rate/baud_count [6]), .B(
        baud_division[6]), .ZN(\uut_baud_rate/eq_134/n46 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U57  ( .A(\uut_baud_rate/baud_count [5]), .B(
        baud_division[5]), .ZN(\uut_baud_rate/eq_134/n47 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U56  ( .A(\uut_baud_rate/baud_count [3]), .B(
        baud_division[3]), .ZN(\uut_baud_rate/eq_134/n39 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U55  ( .A(\uut_baud_rate/n48 ), .B(
        baud_division[2]), .ZN(\uut_baud_rate/eq_134/n41 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U54  ( .A(\uut_baud_rate/baud_count [8]), .B(
        baud_division[8]), .ZN(\uut_baud_rate/eq_134/n54 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U53  ( .A(baud_division[4]), .B(
        \uut_baud_rate/baud_count [4]), .ZN(\uut_baud_rate/eq_134/n48 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U52  ( .A(baud_division[7]), .B(
        \uut_baud_rate/baud_count [7]), .ZN(\uut_baud_rate/eq_134/n45 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U51  ( .A(baud_division[9]), .B(
        \uut_baud_rate/n3 ), .ZN(\uut_baud_rate/eq_134/n52 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U50  ( .A(baud_division[11]), .B(
        \uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/eq_134/n51 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U49  ( .A1(\uut_baud_rate/eq_134/n52 ), .A2(
        \uut_baud_rate/eq_134/n51 ), .ZN(\uut_baud_rate/eq_134/n50 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U48  ( .A(baud_division[12]), .B(
        \uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/eq_134/n60 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U47  ( .A1(\uut_baud_rate/eq_134/n59 ), .A2(
        \uut_baud_rate/eq_134/n60 ), .ZN(\uut_baud_rate/eq_134/n55 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U46  ( .A(\uut_baud_rate/baud_count [14]), 
        .B(baud_division[14]), .ZN(\uut_baud_rate/eq_134/n58 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U45  ( .A1(\uut_baud_rate/eq_134/n57 ), .A2(
        \uut_baud_rate/eq_134/n58 ), .ZN(\uut_baud_rate/eq_134/n56 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U44  ( .A(baud_division[13]), .B(
        \uut_baud_rate/baud_count [13]), .ZN(\uut_baud_rate/eq_134/n59 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U43  ( .A(baud_division[16]), .B(
        \uut_baud_rate/baud_count [16]), .ZN(\uut_baud_rate/eq_134/n16 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U42  ( .A(\uut_baud_rate/baud_count [18]), 
        .B(baud_division[18]), .ZN(\uut_baud_rate/eq_134/n14 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U41  ( .A(\uut_baud_rate/baud_count [15]), 
        .B(baud_division[15]), .ZN(\uut_baud_rate/eq_134/n57 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U40  ( .A(baud_division[17]), .B(
        \uut_baud_rate/baud_count [17]), .ZN(\uut_baud_rate/eq_134/n15 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U39  ( .A1(\uut_baud_rate/eq_134/n15 ), .A2(
        \uut_baud_rate/eq_134/n16 ), .ZN(\uut_baud_rate/eq_134/n13 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U38  ( .A(baud_division[20]), .B(
        \uut_baud_rate/baud_count [20]), .ZN(\uut_baud_rate/eq_134/n22 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U37  ( .A(baud_division[22]), .B(
        \uut_baud_rate/baud_count [22]), .ZN(\uut_baud_rate/eq_134/n20 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U36  ( .A(baud_division[21]), .B(
        \uut_baud_rate/baud_count [21]), .ZN(\uut_baud_rate/eq_134/n21 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U35  ( .A(baud_division[23]), .B(
        \uut_baud_rate/baud_count [23]), .ZN(\uut_baud_rate/eq_134/n19 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U34  ( .A1(\uut_baud_rate/eq_134/n21 ), .A2(
        \uut_baud_rate/eq_134/n22 ), .ZN(\uut_baud_rate/eq_134/n17 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U33  ( .A(baud_division[24]), .B(
        \uut_baud_rate/baud_count [24]), .ZN(\uut_baud_rate/eq_134/n28 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U32  ( .A1(\uut_baud_rate/eq_134/n19 ), .A2(
        \uut_baud_rate/eq_134/n20 ), .ZN(\uut_baud_rate/eq_134/n18 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U31  ( .A(baud_division[26]), .B(
        \uut_baud_rate/baud_count [26]), .ZN(\uut_baud_rate/eq_134/n26 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U30  ( .A1(\uut_baud_rate/eq_134/n27 ), .A2(
        \uut_baud_rate/eq_134/n28 ), .ZN(\uut_baud_rate/eq_134/n23 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U29  ( .A(\uut_baud_rate/n11 ), .B(
        baud_division[27]), .ZN(\uut_baud_rate/eq_134/n25 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U28  ( .A1(\uut_baud_rate/eq_134/n25 ), .A2(
        \uut_baud_rate/eq_134/n26 ), .ZN(\uut_baud_rate/eq_134/n24 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U27  ( .A(baud_division[0]), .B(
        \uut_baud_rate/n50 ), .ZN(\uut_baud_rate/eq_134/n42 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U26  ( .A(baud_division[28]), .B(
        \uut_baud_rate/n9 ), .ZN(\uut_baud_rate/eq_134/n34 ) );
  INV_X1 \uut_baud_rate/eq_134/U25  ( .A(\uut_baud_rate/baud_count [25]), .ZN(
        \uut_baud_rate/eq_134/n4 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U24  ( .A1(\uut_baud_rate/eq_134/n5 ), .A2(
        \uut_baud_rate/eq_134/n6 ), .ZN(\uut_baud_rate/eq_134/n27 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U23  ( .A1(\uut_baud_rate/eq_134/n3 ), .A2(
        \uut_baud_rate/eq_134/n4 ), .ZN(\uut_baud_rate/eq_134/n6 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U22  ( .A1(baud_division[25]), .A2(
        \uut_baud_rate/baud_count [25]), .ZN(\uut_baud_rate/eq_134/n5 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U21  ( .A1(\uut_baud_rate/eq_134/n46 ), .A2(
        \uut_baud_rate/eq_134/n45 ), .ZN(\uut_baud_rate/eq_134/n44 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U20  ( .A1(\uut_baud_rate/eq_134/n44 ), .A2(
        \uut_baud_rate/eq_134/n43 ), .ZN(\uut_baud_rate/eq_134/n37 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U19  ( .A(baud_division[31]), .B(
        \uut_baud_rate/baud_count [31]), .ZN(\uut_baud_rate/eq_134/n31 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U18  ( .A1(\uut_baud_rate/eq_134/n48 ), .A2(
        \uut_baud_rate/eq_134/n47 ), .ZN(\uut_baud_rate/eq_134/n43 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U17  ( .A(baud_division[30]), .B(
        \uut_baud_rate/baud_count [30]), .ZN(\uut_baud_rate/eq_134/n32 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U16  ( .A1(\uut_baud_rate/eq_134/n31 ), .A2(
        \uut_baud_rate/eq_134/n32 ), .ZN(\uut_baud_rate/eq_134/n30 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U15  ( .A1(\uut_baud_rate/eq_134/n53 ), .A2(
        \uut_baud_rate/eq_134/n54 ), .ZN(\uut_baud_rate/eq_134/n49 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U14  ( .A(baud_division[29]), .B(
        \uut_baud_rate/baud_count [29]), .ZN(\uut_baud_rate/eq_134/n33 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U13  ( .A1(\uut_baud_rate/eq_134/n33 ), .A2(
        \uut_baud_rate/eq_134/n34 ), .ZN(\uut_baud_rate/eq_134/n29 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U12  ( .A(\uut_baud_rate/baud_count [1]), .B(
        baud_division[1]), .ZN(\uut_baud_rate/eq_134/n40 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U11  ( .A1(\uut_baud_rate/eq_134/n55 ), .A2(
        \uut_baud_rate/eq_134/n56 ), .ZN(\uut_baud_rate/eq_134/n35 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U10  ( .A(\uut_baud_rate/baud_count [10]), 
        .B(baud_division[10]), .ZN(\uut_baud_rate/eq_134/n53 ) );
  INV_X1 \uut_baud_rate/eq_134/U9  ( .A(baud_division[25]), .ZN(
        \uut_baud_rate/eq_134/n3 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U8  ( .A1(\uut_baud_rate/eq_134/n50 ), .A2(
        \uut_baud_rate/eq_134/n49 ), .ZN(\uut_baud_rate/eq_134/n36 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U7  ( .A1(\uut_baud_rate/eq_134/n29 ), .A2(
        \uut_baud_rate/eq_134/n30 ), .ZN(\uut_baud_rate/eq_134/n9 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U6  ( .A1(\uut_baud_rate/eq_134/n23 ), .A2(
        \uut_baud_rate/eq_134/n24 ), .ZN(\uut_baud_rate/eq_134/n10 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U5  ( .A1(\uut_baud_rate/eq_134/n17 ), .A2(
        \uut_baud_rate/eq_134/n18 ), .ZN(\uut_baud_rate/eq_134/n11 ) );
  XNOR2_X1 \uut_baud_rate/eq_134/U4  ( .A(\uut_baud_rate/baud_count [19]), .B(
        baud_division[19]), .ZN(\uut_baud_rate/eq_134/n2 ) );
  NAND2_X1 \uut_baud_rate/eq_134/U3  ( .A1(\uut_baud_rate/eq_134/n2 ), .A2(
        \uut_baud_rate/eq_134/n14 ), .ZN(\uut_baud_rate/eq_134/n1 ) );
  NOR2_X1 \uut_baud_rate/eq_134/U2  ( .A1(\uut_baud_rate/eq_134/n13 ), .A2(
        \uut_baud_rate/eq_134/n1 ), .ZN(\uut_baud_rate/eq_134/n12 ) );
  AND4_X1 \uut_baud_rate/eq_134/U1  ( .A1(\uut_baud_rate/eq_134/n42 ), .A2(
        \uut_baud_rate/eq_134/n41 ), .A3(\uut_baud_rate/eq_134/n39 ), .A4(
        \uut_baud_rate/eq_134/n40 ), .ZN(\uut_baud_rate/eq_134/n38 ) );
  OAI21_X1 \uut_tx/U83  ( .B1(\uut_tx/n13 ), .B2(\uut_tx/current_state [0]), 
        .A(\uut_tx/n88 ), .ZN(\uut_tx/N92 ) );
  INV_X1 \uut_tx/U82  ( .A(\uut_tx/n87 ), .ZN(\uut_tx/n88 ) );
  OAI21_X1 \uut_tx/U81  ( .B1(\uut_tx/n13 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n85 ), .ZN(\uut_tx/N80 ) );
  AOI22_X1 \uut_tx/U80  ( .A1(data_out[7]), .A2(\uut_tx/n21 ), .B1(
        \uut_tx/n25 ), .B2(\uut_tx/n84 ), .ZN(\uut_tx/n85 ) );
  OAI21_X1 \uut_tx/U79  ( .B1(\uut_tx/n14 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n83 ), .ZN(\uut_tx/N79 ) );
  AOI22_X1 \uut_tx/U78  ( .A1(data_out[6]), .A2(\uut_tx/n21 ), .B1(
        \uut_tx/n25 ), .B2(\uut_tx/n82 ), .ZN(\uut_tx/n83 ) );
  OAI21_X1 \uut_tx/U77  ( .B1(\uut_tx/n15 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n81 ), .ZN(\uut_tx/N78 ) );
  AOI22_X1 \uut_tx/U76  ( .A1(data_out[5]), .A2(\uut_tx/n21 ), .B1(
        \uut_tx/n20 ), .B2(\uut_tx/n80 ), .ZN(\uut_tx/n81 ) );
  OAI21_X1 \uut_tx/U75  ( .B1(\uut_tx/n16 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n79 ), .ZN(\uut_tx/N77 ) );
  AOI22_X1 \uut_tx/U74  ( .A1(data_out[4]), .A2(\uut_tx/n21 ), .B1(\uut_tx/n8 ), .B2(\uut_tx/n78 ), .ZN(\uut_tx/n79 ) );
  OAI21_X1 \uut_tx/U73  ( .B1(\uut_tx/n17 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n77 ), .ZN(\uut_tx/N76 ) );
  AOI22_X1 \uut_tx/U72  ( .A1(data_out[3]), .A2(\uut_tx/n21 ), .B1(
        \uut_tx/n20 ), .B2(\uut_tx/n76 ), .ZN(\uut_tx/n77 ) );
  OAI21_X1 \uut_tx/U71  ( .B1(\uut_tx/n18 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n75 ), .ZN(\uut_tx/N75 ) );
  AOI22_X1 \uut_tx/U70  ( .A1(data_out[2]), .A2(\uut_tx/n21 ), .B1(\uut_tx/n8 ), .B2(\uut_tx/n74 ), .ZN(\uut_tx/n75 ) );
  OAI21_X1 \uut_tx/U69  ( .B1(\uut_tx/n19 ), .B2(\uut_tx/n24 ), .A(
        \uut_tx/n73 ), .ZN(\uut_tx/N74 ) );
  AOI22_X1 \uut_tx/U68  ( .A1(data_out[1]), .A2(\uut_tx/n21 ), .B1(
        \uut_tx/n20 ), .B2(\uut_tx/n72 ), .ZN(\uut_tx/n73 ) );
  INV_X1 \uut_tx/U67  ( .A(\uut_tx/n71 ), .ZN(\uut_tx/N73 ) );
  AOI22_X1 \uut_tx/U66  ( .A1(\uut_tx/n70 ), .A2(\uut_tx/n72 ), .B1(
        data_out[0]), .B2(\uut_tx/n21 ), .ZN(\uut_tx/n71 ) );
  INV_X1 \uut_tx/U65  ( .A(\uut_tx/n23 ), .ZN(\uut_tx/n70 ) );
  OAI21_X1 \uut_tx/U64  ( .B1(\uut_tx/n66 ), .B2(\uut_tx/n67 ), .A(
        \uut_tx/n26 ), .ZN(\uut_tx/n86 ) );
  AND2_X1 \uut_tx/U63  ( .A1(\uut_tx/next_state [0]), .A2(\uut_tx/n68 ), .ZN(
        \uut_tx/N83 ) );
  NAND2_X1 \uut_tx/U62  ( .A1(\uut_tx/n65 ), .A2(\uut_tx/n64 ), .ZN(
        \uut_tx/N96 ) );
  AOI22_X1 \uut_tx/U61  ( .A1(enable), .A2(\uut_tx/n63 ), .B1(
        \uut_tx/count_16_indication ), .B2(\uut_tx/current_state [0]), .ZN(
        \uut_tx/n64 ) );
  AOI21_X1 \uut_tx/U60  ( .B1(\uut_tx/count_8_indication ), .B2(\uut_tx/n62 ), 
        .A(rst), .ZN(\uut_tx/n65 ) );
  INV_X1 \uut_tx/U59  ( .A(\uut_tx/n69 ), .ZN(\uut_tx/n62 ) );
  NAND2_X1 \uut_tx/U58  ( .A1(\uut_tx/current_state [1]), .A2(\uut_tx/n22 ), 
        .ZN(\uut_tx/n69 ) );
  NOR3_X1 \uut_tx/U57  ( .A1(\uut_tx/n66 ), .A2(rst), .A3(\uut_tx/n63 ), .ZN(
        \uut_tx/N33 ) );
  INV_X1 \uut_tx/U56  ( .A(\uut_tx/n61 ), .ZN(\uut_tx/n63 ) );
  NOR2_X1 \uut_tx/U55  ( .A1(\uut_tx/n56 ), .A2(\uut_tx/n55 ), .ZN(
        \uut_tx/N72 ) );
  OAI33_X1 \uut_tx/U54  ( .A1(\uut_tx/n10 ), .A2(\uut_tx/n54 ), .A3(
        \uut_tx/n56 ), .B1(\uut_tx/n53 ), .B2(\uut_tx/n11 ), .B3(\uut_tx/n12 ), 
        .ZN(\uut_tx/N71 ) );
  INV_X1 \uut_tx/U53  ( .A(\uut_tx/n55 ), .ZN(\uut_tx/n54 ) );
  NAND2_X1 \uut_tx/U52  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n67 ), .ZN(
        \uut_tx/n55 ) );
  INV_X1 \uut_tx/U51  ( .A(\uut_tx/n52 ), .ZN(\uut_tx/n67 ) );
  OAI33_X1 \uut_tx/U50  ( .A1(\uut_tx/n11 ), .A2(\uut_tx/n51 ), .A3(
        \uut_tx/n56 ), .B1(\uut_tx/n53 ), .B2(\uut_tx/count_8 [1]), .B3(
        \uut_tx/n12 ), .ZN(\uut_tx/N70 ) );
  NOR2_X1 \uut_tx/U49  ( .A1(\uut_tx/n66 ), .A2(\uut_tx/n50 ), .ZN(
        \uut_tx/n51 ) );
  INV_X1 \uut_tx/U48  ( .A(\uut_tx/count_8 [0]), .ZN(\uut_tx/n50 ) );
  MUX2_X1 \uut_tx/U47  ( .A(\uut_tx/n8 ), .B(\uut_tx/n49 ), .S(
        \uut_tx/count_8 [0]), .Z(\uut_tx/N69 ) );
  NOR2_X1 \uut_tx/U46  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n56 ), .ZN(\uut_tx/n49 ) );
  NAND3_X1 \uut_tx/U45  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n26 ), .A3(
        \uut_tx/n52 ), .ZN(\uut_tx/n53 ) );
  NAND3_X1 \uut_tx/U44  ( .A1(\uut_tx/count_8 [1]), .A2(\uut_tx/count_8 [0]), 
        .A3(\uut_tx/count_8 [2]), .ZN(\uut_tx/n52 ) );
  INV_X1 \uut_tx/U43  ( .A(\uut_tx/n48 ), .ZN(\uut_tx/n89 ) );
  NAND2_X1 \uut_tx/U42  ( .A1(\uut_tx/n68 ), .A2(\uut_tx/n22 ), .ZN(
        \uut_tx/n48 ) );
  NAND2_X1 \uut_tx/U41  ( .A1(\uut_tx/n3 ), .A2(baud_tick), .ZN(\uut_tx/n66 )
         );
  NAND2_X1 \uut_tx/U40  ( .A1(\uut_tx/n45 ), .A2(\uut_tx/n46 ), .ZN(
        \uut_tx/n57 ) );
  OAI21_X1 \uut_tx/U39  ( .B1(\uut_tx/n43 ), .B2(\uut_tx/n44 ), .A(
        \uut_tx/n42 ), .ZN(\uut_tx/n45 ) );
  NAND3_X1 \uut_tx/U38  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n5 ), .A3(
        \uut_tx/n41 ), .ZN(\uut_tx/n46 ) );
  INV_X1 \uut_tx/U37  ( .A(\uut_tx/n40 ), .ZN(\uut_tx/n41 ) );
  MUX2_X1 \uut_tx/U36  ( .A(\uut_tx/n43 ), .B(\uut_tx/n39 ), .S(\uut_tx/n7 ), 
        .Z(\uut_tx/n58 ) );
  NOR2_X1 \uut_tx/U35  ( .A1(\uut_tx/n40 ), .A2(\uut_tx/n38 ), .ZN(
        \uut_tx/n39 ) );
  OAI21_X1 \uut_tx/U34  ( .B1(\uut_tx/n5 ), .B2(\uut_tx/n4 ), .A(\uut_tx/n36 ), 
        .ZN(\uut_tx/n43 ) );
  OAI22_X1 \uut_tx/U33  ( .A1(\uut_tx/n40 ), .A2(\uut_tx/n5 ), .B1(
        \uut_tx/n38 ), .B2(\uut_tx/n36 ), .ZN(\uut_tx/n59 ) );
  INV_X1 \uut_tx/U32  ( .A(\uut_tx/n35 ), .ZN(\uut_tx/n36 ) );
  OAI21_X1 \uut_tx/U31  ( .B1(\uut_tx/n37 ), .B2(\uut_tx/n34 ), .A(
        \uut_tx/n33 ), .ZN(\uut_tx/n35 ) );
  NAND3_X1 \uut_tx/U30  ( .A1(\uut_tx/n34 ), .A2(\uut_tx/n44 ), .A3(
        \uut_tx/n33 ), .ZN(\uut_tx/n40 ) );
  INV_X1 \uut_tx/U29  ( .A(\uut_tx/n37 ), .ZN(\uut_tx/n44 ) );
  MUX2_X1 \uut_tx/U28  ( .A(\uut_tx/n32 ), .B(\uut_tx/n31 ), .S(\uut_tx/n1 ), 
        .Z(\uut_tx/n60 ) );
  NOR2_X1 \uut_tx/U27  ( .A1(\uut_tx/n32 ), .A2(\uut_tx/n4 ), .ZN(\uut_tx/n31 ) );
  NAND3_X1 \uut_tx/U26  ( .A1(\uut_tx/n61 ), .A2(\uut_tx/n68 ), .A3(
        \uut_tx/n47 ), .ZN(\uut_tx/n37 ) );
  NAND4_X1 \uut_tx/U25  ( .A1(\uut_tx/n29 ), .A2(\uut_tx/n42 ), .A3(
        \uut_tx/n34 ), .A4(\uut_tx/n30 ), .ZN(\uut_tx/n47 ) );
  NAND2_X1 \uut_tx/U24  ( .A1(\uut_tx/n27 ), .A2(\uut_tx/n22 ), .ZN(
        \uut_tx/n61 ) );
  INV_X1 \uut_tx/U23  ( .A(\uut_tx/n33 ), .ZN(\uut_tx/n32 ) );
  NAND2_X1 \uut_tx/U22  ( .A1(\uut_tx/n68 ), .A2(\uut_tx/n28 ), .ZN(
        \uut_tx/n33 ) );
  INV_X1 \uut_tx/U21  ( .A(baud_tick), .ZN(\uut_tx/n28 ) );
  AND2_X1 \uut_tx/U20  ( .A1(\uut_tx/next_state [1]), .A2(\uut_tx/n68 ), .ZN(
        \uut_tx/N84 ) );
  INV_X1 \uut_tx/U19  ( .A(rst), .ZN(\uut_tx/n68 ) );
  NOR2_X1 \uut_tx/U18  ( .A1(rst), .A2(\uut_tx/n87 ), .ZN(\uut_tx/N98 ) );
  XOR2_X1 \uut_tx/U17  ( .A(\uut_tx/n27 ), .B(\uut_tx/current_state [0]), .Z(
        \uut_tx/n87 ) );
  NOR2_X2 \uut_tx/U16  ( .A1(\uut_tx/n48 ), .A2(\uut_tx/n27 ), .ZN(
        \uut_tx/n26 ) );
  AND2_X1 \uut_tx/U15  ( .A1(\uut_tx/n69 ), .A2(\uut_tx/n68 ), .ZN(
        \uut_tx/n21 ) );
  INV_X1 \uut_tx/U14  ( .A(\uut_tx/n26 ), .ZN(\uut_tx/n56 ) );
  AND3_X1 \uut_tx/U13  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n26 ), .A3(\uut_tx/n52 ), .ZN(\uut_tx/n25 ) );
  AND3_X1 \uut_tx/U12  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n26 ), .A3(\uut_tx/n52 ), .ZN(\uut_tx/n20 ) );
  AND3_X1 \uut_tx/U11  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n26 ), .A3(\uut_tx/n52 ), .ZN(\uut_tx/n8 ) );
  AND2_X2 \uut_tx/U10  ( .A1(\uut_tx/n3 ), .A2(baud_tick), .ZN(\uut_tx/n6 ) );
  CLKBUF_X1 \uut_tx/U9  ( .A(\uut_tx/n29 ), .Z(\uut_tx/n5 ) );
  CLKBUF_X1 \uut_tx/U8  ( .A(\uut_tx/n37 ), .Z(\uut_tx/n4 ) );
  BUF_X1 \uut_tx/U7  ( .A(\uut_tx/n86 ), .Z(\uut_tx/n23 ) );
  BUF_X2 \uut_tx/U6  ( .A(\uut_tx/n86 ), .Z(\uut_tx/n24 ) );
  AND4_X2 \uut_tx/U5  ( .A1(\uut_tx/n30 ), .A2(\uut_tx/n42 ), .A3(\uut_tx/n2 ), 
        .A4(\uut_tx/n29 ), .ZN(\uut_tx/n3 ) );
  INV_X1 \uut_tx/U4  ( .A(\uut_tx/n9 ), .ZN(\uut_tx/n2 ) );
  CLKBUF_X1 \uut_tx/U3  ( .A(\uut_tx/n9 ), .Z(\uut_tx/n1 ) );
  DFF_X1 \uut_tx/data_save_reg[3]  ( .D(\uut_tx/N76 ), .CK(clk), .Q(
        \uut_tx/n78 ), .QN(\uut_tx/n17 ) );
  DFF_X1 \uut_tx/data_save_reg[7]  ( .D(\uut_tx/N80 ), .CK(clk), .QN(
        \uut_tx/n13 ) );
  DFF_X1 \uut_tx/data_save_reg[6]  ( .D(\uut_tx/N79 ), .CK(clk), .Q(
        \uut_tx/n84 ), .QN(\uut_tx/n14 ) );
  DFF_X1 \uut_tx/data_save_reg[5]  ( .D(\uut_tx/N78 ), .CK(clk), .Q(
        \uut_tx/n82 ), .QN(\uut_tx/n15 ) );
  DFF_X1 \uut_tx/data_save_reg[4]  ( .D(\uut_tx/N77 ), .CK(clk), .Q(
        \uut_tx/n80 ), .QN(\uut_tx/n16 ) );
  DFF_X1 \uut_tx/data_save_reg[2]  ( .D(\uut_tx/N75 ), .CK(clk), .Q(
        \uut_tx/n76 ), .QN(\uut_tx/n18 ) );
  DFF_X1 \uut_tx/data_save_reg[1]  ( .D(\uut_tx/N74 ), .CK(clk), .Q(
        \uut_tx/n74 ), .QN(\uut_tx/n19 ) );
  DFF_X2 \uut_tx/count_8_reg[2]  ( .D(\uut_tx/N71 ), .CK(clk), .Q(
        \uut_tx/count_8 [2]), .QN(\uut_tx/n10 ) );
  DFF_X1 \uut_tx/count_16_reg[0]  ( .D(\uut_tx/n60 ), .CK(clk), .Q(
        \uut_tx/n34 ), .QN(\uut_tx/n9 ) );
  DFF_X1 \uut_tx/count_16_reg[1]  ( .D(\uut_tx/n59 ), .CK(clk), .Q(
        \uut_tx/n29 ), .QN(\uut_tx/n38 ) );
  DFF_X1 \uut_tx/count_16_reg[2]  ( .D(\uut_tx/n58 ), .CK(clk), .Q(
        \uut_tx/n30 ), .QN(\uut_tx/n7 ) );
  DFF_X1 \uut_tx/count_8_reg[1]  ( .D(\uut_tx/N70 ), .CK(clk), .Q(
        \uut_tx/count_8 [1]), .QN(\uut_tx/n11 ) );
  DFF_X1 \uut_tx/data_save_reg[0]  ( .D(\uut_tx/N73 ), .CK(clk), .Q(
        \uut_tx/n72 ) );
  DLL_X1 \uut_tx/tx_reg  ( .D(\uut_tx/N92 ), .GN(rst), .Q(tx) );
  DFF_X1 \uut_tx/count_8_indication_reg  ( .D(\uut_tx/N72 ), .CK(clk), .Q(
        \uut_tx/count_8_indication ) );
  DFF_X1 \uut_tx/count_8_reg[0]  ( .D(\uut_tx/N69 ), .CK(clk), .Q(
        \uut_tx/count_8 [0]), .QN(\uut_tx/n12 ) );
  DFF_X1 \uut_tx/current_state_reg[1]  ( .D(\uut_tx/N84 ), .CK(clk), .Q(
        \uut_tx/current_state [1]), .QN(\uut_tx/n27 ) );
  DLH_X1 \uut_tx/next_state_reg[1]  ( .G(\uut_tx/N96 ), .D(\uut_tx/N98 ), .Q(
        \uut_tx/next_state [1]) );
  DFF_X1 \uut_tx/count_16_indication_reg  ( .D(\uut_tx/N33 ), .CK(clk), .Q(
        \uut_tx/count_16_indication ) );
  DFF_X1 \uut_tx/count_16_reg[3]  ( .D(\uut_tx/n57 ), .CK(clk), .Q(
        \uut_tx/n42 ) );
  DFF_X1 \uut_tx/current_state_reg[0]  ( .D(\uut_tx/N83 ), .CK(clk), .Q(
        \uut_tx/current_state [0]), .QN(\uut_tx/n22 ) );
  DLH_X1 \uut_tx/next_state_reg[0]  ( .G(\uut_tx/N96 ), .D(\uut_tx/n89 ), .Q(
        \uut_tx/next_state [0]) );
  INV_X1 \uut_rx/U90  ( .A(\uut_rx/n97 ), .ZN(\uut_rx/n98 ) );
  OAI222_X1 \uut_rx/U89  ( .A1(\uut_rx/n11 ), .A2(\uut_rx/n96 ), .B1(
        \uut_rx/n28 ), .B2(\uut_rx/n95 ), .C1(\uut_rx/n20 ), .C2(\uut_rx/n97 ), 
        .ZN(\uut_rx/n66 ) );
  NAND2_X1 \uut_rx/U88  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n92 ), .ZN(
        \uut_rx/n97 ) );
  INV_X1 \uut_rx/U87  ( .A(\uut_rx/n95 ), .ZN(\uut_rx/n99 ) );
  OAI222_X1 \uut_rx/U86  ( .A1(\uut_rx/n13 ), .A2(\uut_rx/n96 ), .B1(
        \uut_rx/n29 ), .B2(\uut_rx/n91 ), .C1(\uut_rx/n20 ), .C2(\uut_rx/n95 ), 
        .ZN(\uut_rx/n67 ) );
  NAND2_X1 \uut_rx/U85  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n90 ), .ZN(
        \uut_rx/n95 ) );
  INV_X1 \uut_rx/U84  ( .A(\uut_rx/n91 ), .ZN(\uut_rx/n100 ) );
  OAI222_X1 \uut_rx/U83  ( .A1(\uut_rx/n15 ), .A2(\uut_rx/n96 ), .B1(
        \uut_rx/n28 ), .B2(\uut_rx/n89 ), .C1(\uut_rx/n20 ), .C2(\uut_rx/n91 ), 
        .ZN(\uut_rx/n68 ) );
  NAND2_X1 \uut_rx/U82  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n88 ), .ZN(
        \uut_rx/n91 ) );
  INV_X1 \uut_rx/U81  ( .A(\uut_rx/n89 ), .ZN(\uut_rx/n101 ) );
  OAI222_X1 \uut_rx/U80  ( .A1(\uut_rx/n17 ), .A2(\uut_rx/n96 ), .B1(
        \uut_rx/n29 ), .B2(\uut_rx/n87 ), .C1(\uut_rx/n20 ), .C2(\uut_rx/n89 ), 
        .ZN(\uut_rx/n69 ) );
  NAND2_X1 \uut_rx/U79  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n86 ), .ZN(
        \uut_rx/n89 ) );
  INV_X1 \uut_rx/U78  ( .A(\uut_rx/n87 ), .ZN(\uut_rx/n102 ) );
  OAI222_X1 \uut_rx/U77  ( .A1(\uut_rx/n19 ), .A2(\uut_rx/n96 ), .B1(
        \uut_rx/n28 ), .B2(\uut_rx/n85 ), .C1(\uut_rx/n20 ), .C2(\uut_rx/n87 ), 
        .ZN(\uut_rx/n70 ) );
  NAND2_X1 \uut_rx/U76  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n84 ), .ZN(
        \uut_rx/n87 ) );
  INV_X1 \uut_rx/U75  ( .A(\uut_rx/n85 ), .ZN(\uut_rx/n103 ) );
  OAI222_X1 \uut_rx/U74  ( .A1(\uut_rx/n21 ), .A2(\uut_rx/n96 ), .B1(
        \uut_rx/n29 ), .B2(\uut_rx/n83 ), .C1(\uut_rx/n1 ), .C2(\uut_rx/n85 ), 
        .ZN(\uut_rx/n71 ) );
  NAND2_X1 \uut_rx/U73  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n82 ), .ZN(
        \uut_rx/n85 ) );
  INV_X1 \uut_rx/U72  ( .A(\uut_rx/n83 ), .ZN(\uut_rx/n104 ) );
  OAI222_X1 \uut_rx/U71  ( .A1(\uut_rx/n23 ), .A2(\uut_rx/n96 ), .B1(
        \uut_rx/n28 ), .B2(\uut_rx/n81 ), .C1(\uut_rx/n94 ), .C2(\uut_rx/n83 ), 
        .ZN(\uut_rx/n72 ) );
  NAND2_X1 \uut_rx/U70  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n80 ), .ZN(
        \uut_rx/n83 ) );
  INV_X1 \uut_rx/U69  ( .A(\uut_rx/n81 ), .ZN(\uut_rx/n105 ) );
  OAI221_X1 \uut_rx/U68  ( .B1(\uut_rx/n25 ), .B2(\uut_rx/n96 ), .C1(
        \uut_rx/n20 ), .C2(\uut_rx/n81 ), .A(\uut_rx/n79 ), .ZN(\uut_rx/n73 )
         );
  NAND3_X1 \uut_rx/U67  ( .A1(rx), .A2(\uut_rx/n24 ), .A3(\uut_rx/n93 ), .ZN(
        \uut_rx/n79 ) );
  NAND2_X1 \uut_rx/U66  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n78 ), .ZN(
        \uut_rx/n81 ) );
  OAI22_X1 \uut_rx/U65  ( .A1(\uut_rx/n65 ), .A2(\uut_rx/n33 ), .B1(
        \uut_rx/n4 ), .B2(\uut_rx/n5 ), .ZN(\uut_rx/n107 ) );
  AOI21_X1 \uut_rx/U64  ( .B1(\uut_rx/count_16 [3]), .B2(\uut_rx/n62 ), .A(
        \uut_rx/n61 ), .ZN(\uut_rx/n65 ) );
  AND2_X1 \uut_rx/U63  ( .A1(\uut_rx/next_state [1]), .A2(\uut_rx/n93 ), .ZN(
        \uut_rx/N98 ) );
  OAI21_X1 \uut_rx/U62  ( .B1(\uut_rx/n31 ), .B2(\uut_rx/n60 ), .A(
        \uut_rx/n59 ), .ZN(\uut_rx/N112 ) );
  NAND3_X1 \uut_rx/U61  ( .A1(\uut_rx/n58 ), .A2(\uut_rx/n93 ), .A3(
        \uut_rx/n57 ), .ZN(\uut_rx/N110 ) );
  MUX2_X1 \uut_rx/U60  ( .A(\uut_rx/n56 ), .B(\uut_rx/n55 ), .S(rx), .Z(
        \uut_rx/n57 ) );
  NAND3_X1 \uut_rx/U59  ( .A1(\uut_rx/current_state [1]), .A2(
        \uut_rx/current_state [0]), .A3(\uut_rx/count_16_indication ), .ZN(
        \uut_rx/n55 ) );
  OAI21_X1 \uut_rx/U58  ( .B1(\uut_rx/count_16_indication ), .B2(\uut_rx/n32 ), 
        .A(\uut_rx/n31 ), .ZN(\uut_rx/n56 ) );
  NAND3_X1 \uut_rx/U57  ( .A1(\uut_rx/count_8_indication ), .A2(\uut_rx/n32 ), 
        .A3(\uut_rx/n54 ), .ZN(\uut_rx/n58 ) );
  OAI33_X1 \uut_rx/U56  ( .A1(\uut_rx/n18 ), .A2(\uut_rx/n52 ), .A3(
        \uut_rx/n59 ), .B1(rst), .B2(\uut_rx/n34 ), .B3(\uut_rx/n51 ), .ZN(
        \uut_rx/N47 ) );
  NAND3_X1 \uut_rx/U55  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n50 ), .A3(
        \uut_rx/n51 ), .ZN(\uut_rx/n59 ) );
  INV_X1 \uut_rx/U54  ( .A(\uut_rx/current_state [1]), .ZN(\uut_rx/n51 ) );
  INV_X1 \uut_rx/U53  ( .A(\uut_rx/n32 ), .ZN(\uut_rx/n50 ) );
  OAI22_X1 \uut_rx/U52  ( .A1(\uut_rx/n49 ), .A2(\uut_rx/n30 ), .B1(
        \uut_rx/n48 ), .B2(\uut_rx/n6 ), .ZN(\uut_rx/n74 ) );
  INV_X1 \uut_rx/U51  ( .A(\uut_rx/n47 ), .ZN(\uut_rx/n48 ) );
  MUX2_X1 \uut_rx/U50  ( .A(\uut_rx/n10 ), .B(\uut_rx/n45 ), .S(\uut_rx/n6 ), 
        .Z(\uut_rx/n49 ) );
  NAND2_X1 \uut_rx/U49  ( .A1(\uut_rx/n16 ), .A2(\uut_rx/n10 ), .ZN(
        \uut_rx/n45 ) );
  MUX2_X1 \uut_rx/U48  ( .A(\uut_rx/n47 ), .B(\uut_rx/n44 ), .S(\uut_rx/n8 ), 
        .Z(\uut_rx/n75 ) );
  NOR2_X1 \uut_rx/U47  ( .A1(\uut_rx/n33 ), .A2(\uut_rx/n43 ), .ZN(
        \uut_rx/n44 ) );
  OAI21_X1 \uut_rx/U46  ( .B1(\uut_rx/n64 ), .B2(\uut_rx/n16 ), .A(
        \uut_rx/n63 ), .ZN(\uut_rx/n47 ) );
  OAI22_X1 \uut_rx/U45  ( .A1(\uut_rx/n16 ), .A2(\uut_rx/n30 ), .B1(
        \uut_rx/n43 ), .B2(\uut_rx/n5 ), .ZN(\uut_rx/n76 ) );
  NAND2_X1 \uut_rx/U44  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n52 ), .ZN(
        \uut_rx/n63 ) );
  INV_X1 \uut_rx/U43  ( .A(baud_tick), .ZN(\uut_rx/n52 ) );
  INV_X1 \uut_rx/U42  ( .A(\uut_rx/n31 ), .ZN(\uut_rx/n54 ) );
  INV_X1 \uut_rx/U41  ( .A(\uut_rx/n18 ), .ZN(\uut_rx/n61 ) );
  NAND2_X1 \uut_rx/U40  ( .A1(\uut_rx/n14 ), .A2(\uut_rx/n4 ), .ZN(
        \uut_rx/n53 ) );
  NOR3_X1 \uut_rx/U39  ( .A1(\uut_rx/n41 ), .A2(\uut_rx/n40 ), .A3(
        \uut_rx/n39 ), .ZN(\uut_rx/N78 ) );
  NOR2_X1 \uut_rx/U38  ( .A1(\uut_rx/n38 ), .A2(\uut_rx/n40 ), .ZN(
        \uut_rx/N77 ) );
  NOR2_X1 \uut_rx/U37  ( .A1(\uut_rx/n37 ), .A2(\uut_rx/n40 ), .ZN(
        \uut_rx/N76 ) );
  MUX2_X1 \uut_rx/U36  ( .A(\uut_rx/n26 ), .B(\uut_rx/count_8[1] ), .S(
        \uut_rx/n22 ), .Z(\uut_rx/n37 ) );
  NOR2_X1 \uut_rx/U35  ( .A1(\uut_rx/n40 ), .A2(\uut_rx/n36 ), .ZN(
        \uut_rx/N75 ) );
  NAND3_X1 \uut_rx/U34  ( .A1(\uut_rx/n12 ), .A2(baud_tick), .A3(
        \uut_rx/count_16 [3]), .ZN(\uut_rx/n77 ) );
  NAND3_X1 \uut_rx/U33  ( .A1(\uut_rx/n10 ), .A2(\uut_rx/n7 ), .A3(
        \uut_rx/n16 ), .ZN(\uut_rx/n62 ) );
  NAND2_X1 \uut_rx/U32  ( .A1(\uut_rx/current_state [1]), .A2(\uut_rx/n106 ), 
        .ZN(\uut_rx/n40 ) );
  AND2_X1 \uut_rx/U31  ( .A1(\uut_rx/next_state [0]), .A2(\uut_rx/n93 ), .ZN(
        \uut_rx/N97 ) );
  INV_X1 \uut_rx/U30  ( .A(\uut_rx/n60 ), .ZN(\uut_rx/n106 ) );
  NAND2_X1 \uut_rx/U29  ( .A1(\uut_rx/n93 ), .A2(\uut_rx/n32 ), .ZN(
        \uut_rx/n60 ) );
  OAI211_X1 \uut_rx/U28  ( .C1(\uut_rx/n42 ), .C2(\uut_rx/n54 ), .A(
        \uut_rx/n63 ), .B(\uut_rx/n93 ), .ZN(\uut_rx/n64 ) );
  INV_X1 \uut_rx/U27  ( .A(rst), .ZN(\uut_rx/n93 ) );
  OAI211_X1 \uut_rx/U26  ( .C1(\uut_rx/n9 ), .C2(\uut_rx/n54 ), .A(
        \uut_rx/n63 ), .B(\uut_rx/n93 ), .ZN(\uut_rx/n33 ) );
  OAI211_X1 \uut_rx/U25  ( .C1(\uut_rx/n9 ), .C2(\uut_rx/n54 ), .A(
        \uut_rx/n63 ), .B(\uut_rx/n93 ), .ZN(\uut_rx/n30 ) );
  NAND2_X1 \uut_rx/U24  ( .A1(\uut_rx/n94 ), .A2(\uut_rx/n96 ), .ZN(
        \uut_rx/n29 ) );
  NAND2_X1 \uut_rx/U23  ( .A1(\uut_rx/n94 ), .A2(\uut_rx/n96 ), .ZN(
        \uut_rx/n28 ) );
  XNOR2_X1 \uut_rx/U22  ( .A(\uut_rx/n41 ), .B(\uut_rx/n39 ), .ZN(\uut_rx/n38 ) );
  XNOR2_X1 \uut_rx/U21  ( .A(\uut_rx/n34 ), .B(\uut_rx/n27 ), .ZN(\uut_rx/n36 ) );
  AND2_X1 \uut_rx/U20  ( .A1(\uut_rx/n94 ), .A2(\uut_rx/n96 ), .ZN(
        \uut_rx/n24 ) );
  NOR2_X1 \uut_rx/U19  ( .A1(\uut_rx/n27 ), .A2(\uut_rx/n77 ), .ZN(
        \uut_rx/n22 ) );
  INV_X1 \uut_rx/U18  ( .A(\uut_rx/n77 ), .ZN(\uut_rx/n94 ) );
  BUF_X1 \uut_rx/U17  ( .A(\uut_rx/n77 ), .Z(\uut_rx/n34 ) );
  INV_X1 \uut_rx/U16  ( .A(\uut_rx/n34 ), .ZN(\uut_rx/n20 ) );
  CLKBUF_X1 \uut_rx/U15  ( .A(\uut_rx/n53 ), .Z(\uut_rx/n18 ) );
  INV_X1 \uut_rx/U14  ( .A(\uut_rx/n43 ), .ZN(\uut_rx/n16 ) );
  AND3_X1 \uut_rx/U13  ( .A1(\uut_rx/n46 ), .A2(\uut_rx/n35 ), .A3(
        \uut_rx/count_16 [0]), .ZN(\uut_rx/n14 ) );
  AND3_X1 \uut_rx/U12  ( .A1(\uut_rx/count_16 [0]), .A2(\uut_rx/n35 ), .A3(
        \uut_rx/n46 ), .ZN(\uut_rx/n12 ) );
  INV_X1 \uut_rx/U11  ( .A(\uut_rx/n8 ), .ZN(\uut_rx/n10 ) );
  AND3_X1 \uut_rx/U10  ( .A1(\uut_rx/n53 ), .A2(\uut_rx/n31 ), .A3(
        \uut_rx/current_state [0]), .ZN(\uut_rx/n42 ) );
  AND3_X1 \uut_rx/U9  ( .A1(\uut_rx/n53 ), .A2(\uut_rx/n31 ), .A3(
        \uut_rx/current_state [0]), .ZN(\uut_rx/n9 ) );
  OAI21_X2 \uut_rx/U8  ( .B1(\uut_rx/n31 ), .B2(\uut_rx/current_state [0]), 
        .A(\uut_rx/n93 ), .ZN(\uut_rx/n96 ) );
  INV_X1 \uut_rx/U7  ( .A(\uut_rx/n6 ), .ZN(\uut_rx/n7 ) );
  CLKBUF_X1 \uut_rx/U6  ( .A(\uut_rx/n63 ), .Z(\uut_rx/n5 ) );
  NAND2_X1 \uut_rx/U5  ( .A1(\uut_rx/n2 ), .A2(\uut_rx/count_8[1] ), .ZN(
        \uut_rx/n3 ) );
  OR2_X1 \uut_rx/U4  ( .A1(\uut_rx/n77 ), .A2(\uut_rx/n3 ), .ZN(\uut_rx/n41 )
         );
  BUF_X1 \uut_rx/U3  ( .A(\uut_rx/n94 ), .Z(\uut_rx/n1 ) );
  DFF_X2 \uut_rx/count_8_reg[2]  ( .D(\uut_rx/N77 ), .CK(clk), .QN(
        \uut_rx/n39 ) );
  DFF_X2 \uut_rx/data_save_reg[0]  ( .D(\uut_rx/n73 ), .CK(clk), .Q(
        \uut_rx/n78 ), .QN(\uut_rx/n25 ) );
  DFF_X1 \uut_rx/data_save_reg[2]  ( .D(\uut_rx/n71 ), .CK(clk), .Q(
        \uut_rx/n82 ), .QN(\uut_rx/n21 ) );
  DFF_X1 \uut_rx/data_save_reg[4]  ( .D(\uut_rx/n69 ), .CK(clk), .Q(
        \uut_rx/n86 ), .QN(\uut_rx/n17 ) );
  DFF_X1 \uut_rx/data_save_reg[6]  ( .D(\uut_rx/n67 ), .CK(clk), .Q(
        \uut_rx/n90 ), .QN(\uut_rx/n13 ) );
  DFF_X1 \uut_rx/count_8_reg[0]  ( .D(\uut_rx/N75 ), .CK(clk), .Q(\uut_rx/n2 ), 
        .QN(\uut_rx/n27 ) );
  DFF_X1 \uut_rx/count_16_reg[0]  ( .D(\uut_rx/n76 ), .CK(clk), .Q(
        \uut_rx/count_16 [0]), .QN(\uut_rx/n43 ) );
  DFF_X1 \uut_rx/count_16_reg[1]  ( .D(\uut_rx/n75 ), .CK(clk), .Q(
        \uut_rx/n46 ), .QN(\uut_rx/n8 ) );
  DFF_X1 \uut_rx/count_16_reg[2]  ( .D(\uut_rx/n74 ), .CK(clk), .Q(
        \uut_rx/n35 ), .QN(\uut_rx/n6 ) );
  DFF_X1 \uut_rx/count_8_reg[1]  ( .D(\uut_rx/N76 ), .CK(clk), .Q(
        \uut_rx/count_8[1] ), .QN(\uut_rx/n26 ) );
  DFF_X1 \uut_rx/data_save_reg[1]  ( .D(\uut_rx/n72 ), .CK(clk), .Q(
        \uut_rx/n80 ), .QN(\uut_rx/n23 ) );
  DFF_X1 \uut_rx/data_save_reg[3]  ( .D(\uut_rx/n70 ), .CK(clk), .Q(
        \uut_rx/n84 ), .QN(\uut_rx/n19 ) );
  DFF_X1 \uut_rx/data_save_reg[5]  ( .D(\uut_rx/n68 ), .CK(clk), .Q(
        \uut_rx/n88 ), .QN(\uut_rx/n15 ) );
  DFF_X1 \uut_rx/data_save_reg[7]  ( .D(\uut_rx/n66 ), .CK(clk), .Q(
        \uut_rx/n92 ), .QN(\uut_rx/n11 ) );
  DFF_X1 \uut_rx/count_16_indication_reg  ( .D(\uut_rx/N47 ), .CK(clk), .Q(
        \uut_rx/count_16_indication ) );
  DFF_X1 \uut_rx/count_8_indication_reg  ( .D(\uut_rx/N78 ), .CK(clk), .Q(
        \uut_rx/count_8_indication ) );
  DFF_X1 \uut_rx/ext_data_out_reg[7]  ( .D(\uut_rx/n98 ), .CK(clk), .Q(
        data_in[7]) );
  DFF_X1 \uut_rx/ext_data_out_reg[6]  ( .D(\uut_rx/n99 ), .CK(clk), .Q(
        data_in[6]) );
  DFF_X1 \uut_rx/ext_data_out_reg[5]  ( .D(\uut_rx/n100 ), .CK(clk), .Q(
        data_in[5]) );
  DFF_X1 \uut_rx/ext_data_out_reg[4]  ( .D(\uut_rx/n101 ), .CK(clk), .Q(
        data_in[4]) );
  DFF_X1 \uut_rx/ext_data_out_reg[3]  ( .D(\uut_rx/n102 ), .CK(clk), .Q(
        data_in[3]) );
  DFF_X1 \uut_rx/ext_data_out_reg[2]  ( .D(\uut_rx/n103 ), .CK(clk), .Q(
        data_in[2]) );
  DFF_X1 \uut_rx/ext_data_out_reg[1]  ( .D(\uut_rx/n104 ), .CK(clk), .Q(
        data_in[1]) );
  DFF_X1 \uut_rx/ext_data_out_reg[0]  ( .D(\uut_rx/n105 ), .CK(clk), .Q(
        data_in[0]) );
  DFF_X1 \uut_rx/count_16_reg[3]  ( .D(\uut_rx/n107 ), .CK(clk), .Q(
        \uut_rx/count_16 [3]), .QN(\uut_rx/n4 ) );
  DFF_X1 \uut_rx/current_state_reg[1]  ( .D(\uut_rx/N98 ), .CK(clk), .Q(
        \uut_rx/current_state [1]), .QN(\uut_rx/n31 ) );
  DLH_X1 \uut_rx/next_state_reg[1]  ( .G(\uut_rx/N110 ), .D(\uut_rx/N112 ), 
        .Q(\uut_rx/next_state [1]) );
  DFF_X1 \uut_rx/current_state_reg[0]  ( .D(\uut_rx/N97 ), .CK(clk), .Q(
        \uut_rx/current_state [0]), .QN(\uut_rx/n32 ) );
  DLH_X1 \uut_rx/next_state_reg[0]  ( .G(\uut_rx/N110 ), .D(\uut_rx/n106 ), 
        .Q(\uut_rx/next_state [0]) );
endmodule

