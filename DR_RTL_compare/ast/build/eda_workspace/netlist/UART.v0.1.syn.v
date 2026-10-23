/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 13:58:56 2026
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
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, \uut_baud_rate/n90 ,
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
         \uut_baud_rate/n32 , \uut_baud_rate/n31 , \uut_baud_rate/n30 ,
         \uut_baud_rate/n29 , \uut_baud_rate/n28 , \uut_baud_rate/n16 ,
         \uut_baud_rate/n15 , \uut_baud_rate/n14 , \uut_baud_rate/n13 ,
         \uut_baud_rate/n12 , \uut_baud_rate/n11 , \uut_baud_rate/n10 ,
         \uut_baud_rate/n9 , \uut_baud_rate/n6 , \uut_baud_rate/n5 ,
         \uut_baud_rate/n4 , \uut_baud_rate/n3 , \uut_baud_rate/n2 ,
         \uut_baud_rate/n27 , \uut_baud_rate/n26 , \uut_baud_rate/n25 ,
         \uut_baud_rate/n24 , \uut_baud_rate/n23 , \uut_baud_rate/n22 ,
         \uut_baud_rate/n21 , \uut_baud_rate/n20 , \uut_baud_rate/n19 ,
         \uut_baud_rate/n18 , \uut_baud_rate/n17 , \uut_baud_rate/N109 ,
         \uut_baud_rate/N108 , \uut_baud_rate/N107 , \uut_baud_rate/N106 ,
         \uut_baud_rate/N105 , \uut_baud_rate/N104 , \uut_baud_rate/N103 ,
         \uut_baud_rate/N102 , \uut_baud_rate/N101 , \uut_baud_rate/N100 ,
         \uut_baud_rate/N99 , \uut_baud_rate/N98 , \uut_baud_rate/N97 ,
         \uut_baud_rate/N96 , \uut_baud_rate/N95 , \uut_baud_rate/N94 ,
         \uut_baud_rate/N93 , \uut_baud_rate/N92 , \uut_baud_rate/N91 ,
         \uut_baud_rate/N90 , \uut_baud_rate/N89 , \uut_baud_rate/N88 ,
         \uut_baud_rate/N87 , \uut_baud_rate/N86 , \uut_baud_rate/N85 ,
         \uut_baud_rate/N83 , \uut_baud_rate/N82 , \uut_baud_rate/N81 ,
         \uut_baud_rate/N80 , \uut_baud_rate/N79 , \uut_baud_rate/N44 ,
         \uut_baud_rate/N43 , \uut_baud_rate/N42 , \uut_baud_rate/N41 ,
         \uut_baud_rate/N40 , \uut_baud_rate/N39 , \uut_baud_rate/N38 ,
         \uut_baud_rate/N37 , \uut_baud_rate/N36 , \uut_baud_rate/N35 ,
         \uut_baud_rate/N34 , \uut_baud_rate/N33 , \uut_baud_rate/N32 ,
         \uut_baud_rate/N31 , \uut_baud_rate/N30 , \uut_baud_rate/N29 ,
         \uut_baud_rate/N28 , \uut_baud_rate/N27 , \uut_baud_rate/N26 ,
         \uut_baud_rate/N25 , \uut_baud_rate/N24 , \uut_baud_rate/N23 ,
         \uut_baud_rate/N22 , \uut_baud_rate/N21 , \uut_baud_rate/N20 ,
         \uut_baud_rate/N19 , \uut_baud_rate/N18 , \uut_baud_rate/N17 ,
         \uut_baud_rate/N16 , \uut_baud_rate/N15 , \uut_baud_rate/N14 ,
         \uut_baud_rate/N13 , \uut_baud_rate/tc_reached ,
         \uut_baud_rate/temp_en , \uut_baud_rate/add_154/n303 ,
         \uut_baud_rate/add_154/n302 , \uut_baud_rate/add_154/n301 ,
         \uut_baud_rate/add_154/n300 , \uut_baud_rate/add_154/n299 ,
         \uut_baud_rate/add_154/n298 , \uut_baud_rate/add_154/n297 ,
         \uut_baud_rate/add_154/n296 , \uut_baud_rate/add_154/n295 ,
         \uut_baud_rate/add_154/n294 , \uut_baud_rate/add_154/n293 ,
         \uut_baud_rate/add_154/n292 , \uut_baud_rate/add_154/n291 ,
         \uut_baud_rate/add_154/n290 , \uut_baud_rate/add_154/n289 ,
         \uut_baud_rate/add_154/n288 , \uut_baud_rate/add_154/n287 ,
         \uut_baud_rate/add_154/n286 , \uut_baud_rate/add_154/n285 ,
         \uut_baud_rate/add_154/n284 , \uut_baud_rate/add_154/n283 ,
         \uut_baud_rate/add_154/n282 , \uut_baud_rate/add_154/n281 ,
         \uut_baud_rate/add_154/n280 , \uut_baud_rate/add_154/n279 ,
         \uut_baud_rate/add_154/n278 , \uut_baud_rate/add_154/n277 ,
         \uut_baud_rate/add_154/n276 , \uut_baud_rate/add_154/n275 ,
         \uut_baud_rate/add_154/n274 , \uut_baud_rate/add_154/n273 ,
         \uut_baud_rate/add_154/n272 , \uut_baud_rate/add_154/n271 ,
         \uut_baud_rate/add_154/n270 , \uut_baud_rate/add_154/n269 ,
         \uut_baud_rate/add_154/n268 , \uut_baud_rate/add_154/n267 ,
         \uut_baud_rate/add_154/n266 , \uut_baud_rate/add_154/n265 ,
         \uut_baud_rate/add_154/n264 , \uut_baud_rate/add_154/n263 ,
         \uut_baud_rate/add_154/n262 , \uut_baud_rate/add_154/n261 ,
         \uut_baud_rate/add_154/n260 , \uut_baud_rate/add_154/n259 ,
         \uut_baud_rate/add_154/n258 , \uut_baud_rate/add_154/n257 ,
         \uut_baud_rate/add_154/n256 , \uut_baud_rate/add_154/n255 ,
         \uut_baud_rate/add_154/n254 , \uut_baud_rate/add_154/n253 ,
         \uut_baud_rate/add_154/n252 , \uut_baud_rate/add_154/n251 ,
         \uut_baud_rate/add_154/n250 , \uut_baud_rate/add_154/n249 ,
         \uut_baud_rate/add_154/n248 , \uut_baud_rate/add_154/n247 ,
         \uut_baud_rate/add_154/n246 , \uut_baud_rate/add_154/n245 ,
         \uut_baud_rate/add_154/n244 , \uut_baud_rate/add_154/n243 ,
         \uut_baud_rate/add_154/n242 , \uut_baud_rate/add_154/n241 ,
         \uut_baud_rate/add_154/n240 , \uut_baud_rate/add_154/n239 ,
         \uut_baud_rate/add_154/n238 , \uut_baud_rate/add_154/n237 ,
         \uut_baud_rate/add_154/n236 , \uut_baud_rate/add_154/n235 ,
         \uut_baud_rate/add_154/n234 , \uut_baud_rate/add_154/n233 ,
         \uut_baud_rate/add_154/n232 , \uut_baud_rate/add_154/n231 ,
         \uut_baud_rate/add_154/n230 , \uut_baud_rate/add_154/n229 ,
         \uut_baud_rate/add_154/n228 , \uut_baud_rate/add_154/n227 ,
         \uut_baud_rate/add_154/n226 , \uut_baud_rate/add_154/n225 ,
         \uut_baud_rate/add_154/n224 , \uut_baud_rate/add_154/n223 ,
         \uut_baud_rate/add_154/n222 , \uut_baud_rate/add_154/n221 ,
         \uut_baud_rate/add_154/n220 , \uut_baud_rate/add_154/n219 ,
         \uut_baud_rate/add_154/n218 , \uut_baud_rate/add_154/n217 ,
         \uut_baud_rate/add_154/n216 , \uut_baud_rate/add_154/n215 ,
         \uut_baud_rate/add_154/n214 , \uut_baud_rate/add_154/n213 ,
         \uut_baud_rate/add_154/n212 , \uut_baud_rate/add_154/n211 ,
         \uut_baud_rate/add_154/n210 , \uut_baud_rate/add_154/n209 ,
         \uut_baud_rate/add_154/n208 , \uut_baud_rate/add_154/n207 ,
         \uut_baud_rate/add_154/n206 , \uut_baud_rate/add_154/n205 ,
         \uut_baud_rate/add_154/n204 , \uut_baud_rate/add_154/n203 ,
         \uut_baud_rate/add_154/n202 , \uut_baud_rate/add_154/n201 ,
         \uut_baud_rate/add_154/n200 , \uut_baud_rate/add_154/n199 ,
         \uut_baud_rate/add_154/n198 , \uut_baud_rate/add_154/n197 ,
         \uut_baud_rate/add_154/n196 , \uut_baud_rate/add_154/n195 ,
         \uut_baud_rate/add_154/n194 , \uut_baud_rate/add_154/n193 ,
         \uut_baud_rate/add_154/n192 , \uut_baud_rate/add_154/n191 ,
         \uut_baud_rate/add_154/n190 , \uut_baud_rate/add_154/n189 ,
         \uut_baud_rate/add_154/n188 , \uut_baud_rate/add_154/n187 ,
         \uut_baud_rate/add_154/n186 , \uut_baud_rate/add_154/n185 ,
         \uut_baud_rate/add_154/n184 , \uut_baud_rate/add_154/n183 ,
         \uut_baud_rate/add_154/n182 , \uut_baud_rate/add_154/n181 ,
         \uut_baud_rate/add_154/n180 , \uut_baud_rate/add_154/n179 ,
         \uut_baud_rate/add_154/n178 , \uut_baud_rate/add_154/n177 ,
         \uut_baud_rate/add_154/n176 , \uut_baud_rate/add_154/n175 ,
         \uut_baud_rate/add_154/n174 , \uut_baud_rate/add_154/n173 ,
         \uut_baud_rate/add_154/n172 , \uut_baud_rate/add_154/n171 ,
         \uut_baud_rate/add_154/n170 , \uut_baud_rate/add_154/n169 ,
         \uut_baud_rate/add_154/n168 , \uut_baud_rate/add_154/n167 ,
         \uut_baud_rate/add_154/n166 , \uut_baud_rate/add_154/n165 ,
         \uut_baud_rate/add_154/n164 , \uut_baud_rate/add_154/n163 ,
         \uut_baud_rate/add_154/n162 , \uut_baud_rate/add_154/n161 ,
         \uut_baud_rate/add_154/n160 , \uut_baud_rate/add_154/n159 ,
         \uut_baud_rate/add_154/n158 , \uut_baud_rate/add_154/n157 ,
         \uut_baud_rate/add_154/n156 , \uut_baud_rate/add_154/n155 ,
         \uut_baud_rate/add_154/n154 , \uut_baud_rate/add_154/n153 ,
         \uut_baud_rate/add_154/n152 , \uut_baud_rate/add_154/n151 ,
         \uut_baud_rate/add_154/n150 , \uut_baud_rate/add_154/n149 ,
         \uut_baud_rate/add_154/n148 , \uut_baud_rate/add_154/n147 ,
         \uut_baud_rate/add_154/n146 , \uut_baud_rate/add_154/n145 ,
         \uut_baud_rate/add_154/n144 , \uut_baud_rate/add_154/n143 ,
         \uut_baud_rate/add_154/n142 , \uut_baud_rate/add_154/n141 ,
         \uut_baud_rate/add_154/n140 , \uut_baud_rate/add_154/n139 ,
         \uut_baud_rate/add_154/n138 , \uut_baud_rate/add_154/n137 ,
         \uut_baud_rate/add_154/n136 , \uut_baud_rate/add_154/n135 ,
         \uut_baud_rate/add_154/n134 , \uut_baud_rate/add_154/n133 ,
         \uut_baud_rate/add_154/n132 , \uut_baud_rate/add_154/n131 ,
         \uut_baud_rate/add_154/n130 , \uut_baud_rate/add_154/n129 ,
         \uut_baud_rate/add_154/n128 , \uut_baud_rate/add_154/n127 ,
         \uut_baud_rate/add_154/n126 , \uut_baud_rate/add_154/n125 ,
         \uut_baud_rate/add_154/n124 , \uut_baud_rate/add_154/n123 ,
         \uut_baud_rate/add_154/n122 , \uut_baud_rate/add_154/n121 ,
         \uut_baud_rate/add_154/n120 , \uut_baud_rate/add_154/n119 ,
         \uut_baud_rate/add_154/n118 , \uut_baud_rate/add_154/n117 ,
         \uut_baud_rate/add_154/n116 , \uut_baud_rate/add_154/n115 ,
         \uut_baud_rate/add_154/n114 , \uut_baud_rate/add_154/n113 ,
         \uut_baud_rate/add_154/n112 , \uut_baud_rate/add_154/n111 ,
         \uut_baud_rate/add_154/n110 , \uut_baud_rate/add_154/n109 ,
         \uut_baud_rate/add_154/n108 , \uut_baud_rate/add_154/n107 ,
         \uut_baud_rate/add_154/n106 , \uut_baud_rate/add_154/n105 ,
         \uut_baud_rate/add_154/n104 , \uut_baud_rate/add_154/n103 ,
         \uut_baud_rate/add_154/n102 , \uut_baud_rate/add_154/n101 ,
         \uut_baud_rate/add_154/n100 , \uut_baud_rate/add_154/n99 ,
         \uut_baud_rate/add_154/n98 , \uut_baud_rate/add_154/n97 ,
         \uut_baud_rate/add_154/n96 , \uut_baud_rate/add_154/n95 ,
         \uut_baud_rate/add_154/n94 , \uut_baud_rate/add_154/n93 ,
         \uut_baud_rate/add_154/n92 , \uut_baud_rate/add_154/n91 ,
         \uut_baud_rate/add_154/n90 , \uut_baud_rate/add_154/n89 ,
         \uut_baud_rate/add_154/n88 , \uut_baud_rate/add_154/n87 ,
         \uut_baud_rate/add_154/n86 , \uut_baud_rate/add_154/n85 ,
         \uut_baud_rate/add_154/n84 , \uut_baud_rate/add_154/n83 ,
         \uut_baud_rate/add_154/n82 , \uut_baud_rate/add_154/n81 ,
         \uut_baud_rate/add_154/n80 , \uut_baud_rate/add_154/n79 ,
         \uut_baud_rate/add_154/n78 , \uut_baud_rate/add_154/n77 ,
         \uut_baud_rate/add_154/n76 , \uut_baud_rate/add_154/n75 ,
         \uut_baud_rate/add_154/n74 , \uut_baud_rate/add_154/n73 ,
         \uut_baud_rate/add_154/n72 , \uut_baud_rate/add_154/n71 ,
         \uut_baud_rate/add_154/n70 , \uut_baud_rate/add_154/n69 ,
         \uut_baud_rate/add_154/n68 , \uut_baud_rate/add_154/n67 ,
         \uut_baud_rate/add_154/n66 , \uut_baud_rate/add_154/n65 ,
         \uut_baud_rate/add_154/n64 , \uut_baud_rate/add_154/n63 ,
         \uut_baud_rate/add_154/n62 , \uut_baud_rate/add_154/n61 ,
         \uut_baud_rate/add_154/n60 , \uut_baud_rate/add_154/n59 ,
         \uut_baud_rate/add_154/n58 , \uut_baud_rate/add_154/n57 ,
         \uut_baud_rate/add_154/n56 , \uut_baud_rate/add_154/n55 ,
         \uut_baud_rate/add_154/n54 , \uut_baud_rate/add_154/n53 ,
         \uut_baud_rate/add_154/n52 , \uut_baud_rate/add_154/n51 ,
         \uut_baud_rate/add_154/n50 , \uut_baud_rate/add_154/n49 ,
         \uut_baud_rate/add_154/n48 , \uut_baud_rate/add_154/n47 ,
         \uut_baud_rate/add_154/n46 , \uut_baud_rate/add_154/n45 ,
         \uut_baud_rate/add_154/n44 , \uut_baud_rate/add_154/n43 ,
         \uut_baud_rate/add_154/n42 , \uut_baud_rate/add_154/n41 ,
         \uut_baud_rate/add_154/n40 , \uut_baud_rate/add_154/n39 ,
         \uut_baud_rate/add_154/n38 , \uut_baud_rate/add_154/n37 ,
         \uut_baud_rate/add_154/n36 , \uut_baud_rate/add_154/n35 ,
         \uut_baud_rate/add_154/n34 , \uut_baud_rate/add_154/n32 ,
         \uut_baud_rate/add_154/n31 , \uut_baud_rate/add_154/n30 ,
         \uut_baud_rate/add_154/n29 , \uut_baud_rate/add_154/n28 ,
         \uut_baud_rate/add_154/n27 , \uut_baud_rate/add_154/n26 ,
         \uut_baud_rate/add_154/n25 , \uut_baud_rate/add_154/n24 ,
         \uut_baud_rate/add_154/n23 , \uut_baud_rate/add_154/n22 ,
         \uut_baud_rate/add_154/n21 , \uut_baud_rate/add_154/n20 ,
         \uut_baud_rate/add_154/n19 , \uut_baud_rate/add_154/n18 ,
         \uut_baud_rate/add_154/n17 , \uut_baud_rate/add_154/n16 ,
         \uut_baud_rate/add_154/n15 , \uut_baud_rate/add_154/n14 ,
         \uut_baud_rate/add_154/n13 , \uut_baud_rate/add_154/n12 ,
         \uut_baud_rate/add_154/n11 , \uut_baud_rate/add_154/n9 ,
         \uut_baud_rate/add_154/n8 , \uut_baud_rate/add_154/n7 ,
         \uut_baud_rate/add_154/n6 , \uut_baud_rate/add_154/n5 ,
         \uut_baud_rate/add_154/n4 , \uut_baud_rate/add_154/n3 ,
         \uut_baud_rate/add_154/n2 , \uut_baud_rate/add_154/n1 ,
         \uut_baud_rate/eq_136/n65 , \uut_baud_rate/eq_136/n64 ,
         \uut_baud_rate/eq_136/n63 , \uut_baud_rate/eq_136/n62 ,
         \uut_baud_rate/eq_136/n61 , \uut_baud_rate/eq_136/n60 ,
         \uut_baud_rate/eq_136/n59 , \uut_baud_rate/eq_136/n58 ,
         \uut_baud_rate/eq_136/n57 , \uut_baud_rate/eq_136/n56 ,
         \uut_baud_rate/eq_136/n55 , \uut_baud_rate/eq_136/n54 ,
         \uut_baud_rate/eq_136/n53 , \uut_baud_rate/eq_136/n52 ,
         \uut_baud_rate/eq_136/n51 , \uut_baud_rate/eq_136/n50 ,
         \uut_baud_rate/eq_136/n49 , \uut_baud_rate/eq_136/n48 ,
         \uut_baud_rate/eq_136/n47 , \uut_baud_rate/eq_136/n46 ,
         \uut_baud_rate/eq_136/n45 , \uut_baud_rate/eq_136/n44 ,
         \uut_baud_rate/eq_136/n43 , \uut_baud_rate/eq_136/n42 ,
         \uut_baud_rate/eq_136/n41 , \uut_baud_rate/eq_136/n40 ,
         \uut_baud_rate/eq_136/n39 , \uut_baud_rate/eq_136/n38 ,
         \uut_baud_rate/eq_136/n37 , \uut_baud_rate/eq_136/n36 ,
         \uut_baud_rate/eq_136/n35 , \uut_baud_rate/eq_136/n34 ,
         \uut_baud_rate/eq_136/n33 , \uut_baud_rate/eq_136/n32 ,
         \uut_baud_rate/eq_136/n31 , \uut_baud_rate/eq_136/n30 ,
         \uut_baud_rate/eq_136/n29 , \uut_baud_rate/eq_136/n28 ,
         \uut_baud_rate/eq_136/n27 , \uut_baud_rate/eq_136/n26 ,
         \uut_baud_rate/eq_136/n25 , \uut_baud_rate/eq_136/n24 ,
         \uut_baud_rate/eq_136/n23 , \uut_baud_rate/eq_136/n22 ,
         \uut_baud_rate/eq_136/n21 , \uut_baud_rate/eq_136/n20 ,
         \uut_baud_rate/eq_136/n19 , \uut_baud_rate/eq_136/n18 ,
         \uut_baud_rate/eq_136/n17 , \uut_baud_rate/eq_136/n16 ,
         \uut_baud_rate/eq_136/n15 , \uut_baud_rate/eq_136/n14 ,
         \uut_baud_rate/eq_136/n13 , \uut_baud_rate/eq_136/n12 ,
         \uut_baud_rate/eq_136/n11 , \uut_baud_rate/eq_136/n10 ,
         \uut_baud_rate/eq_136/n9 , \uut_baud_rate/eq_136/n8 ,
         \uut_baud_rate/eq_136/n7 , \uut_baud_rate/eq_136/n6 ,
         \uut_baud_rate/eq_136/n5 , \uut_baud_rate/eq_136/n4 ,
         \uut_baud_rate/eq_136/n3 , \uut_baud_rate/eq_136/n2 ,
         \uut_baud_rate/eq_136/n1 , \uut_tx/n76 , \uut_tx/n75 , \uut_tx/n74 ,
         \uut_tx/n73 , \uut_tx/n72 , \uut_tx/n71 , \uut_tx/n70 , \uut_tx/n69 ,
         \uut_tx/n68 , \uut_tx/n67 , \uut_tx/n66 , \uut_tx/n65 , \uut_tx/n64 ,
         \uut_tx/n63 , \uut_tx/n62 , \uut_tx/n61 , \uut_tx/n60 , \uut_tx/n48 ,
         \uut_tx/n47 , \uut_tx/n46 , \uut_tx/n45 , \uut_tx/n44 , \uut_tx/n43 ,
         \uut_tx/n42 , \uut_tx/n41 , \uut_tx/n40 , \uut_tx/n39 , \uut_tx/n38 ,
         \uut_tx/n37 , \uut_tx/n36 , \uut_tx/n35 , \uut_tx/n34 , \uut_tx/n33 ,
         \uut_tx/n32 , \uut_tx/n31 , \uut_tx/n30 , \uut_tx/n29 , \uut_tx/n28 ,
         \uut_tx/n27 , \uut_tx/n26 , \uut_tx/n25 , \uut_tx/n24 , \uut_tx/n23 ,
         \uut_tx/n22 , \uut_tx/n21 , \uut_tx/n20 , \uut_tx/n18 , \uut_tx/n17 ,
         \uut_tx/n6 , \uut_tx/n5 , \uut_tx/n4 , \uut_tx/n3 , \uut_tx/n2 ,
         \uut_tx/n59 , \uut_tx/n58 , \uut_tx/n57 , \uut_tx/n56 , \uut_tx/n55 ,
         \uut_tx/n54 , \uut_tx/n53 , \uut_tx/n52 , \uut_tx/n51 , \uut_tx/n50 ,
         \uut_tx/n49 , \uut_tx/n19 , \uut_tx/n16 , \uut_tx/n15 , \uut_tx/n14 ,
         \uut_tx/n13 , \uut_tx/n12 , \uut_tx/n11 , \uut_tx/n10 , \uut_tx/n9 ,
         \uut_tx/n8 , \uut_tx/n7 , \uut_tx/n1 , \uut_tx/N68 , \uut_tx/N66 ,
         \uut_tx/N62 , \uut_tx/N54 , \uut_tx/N53 , \uut_tx/N41 ,
         \uut_tx/count_8_indication , \uut_tx/N35 ,
         \uut_tx/count_16_indication , \uut_rx/n94 , \uut_rx/n93 ,
         \uut_rx/n92 , \uut_rx/n91 , \uut_rx/n90 , \uut_rx/n89 , \uut_rx/n88 ,
         \uut_rx/n87 , \uut_rx/n86 , \uut_rx/n85 , \uut_rx/n84 , \uut_rx/n83 ,
         \uut_rx/n82 , \uut_rx/n81 , \uut_rx/n80 , \uut_rx/n79 , \uut_rx/n78 ,
         \uut_rx/n77 , \uut_rx/n76 , \uut_rx/n67 , \uut_rx/n66 , \uut_rx/n65 ,
         \uut_rx/n64 , \uut_rx/n63 , \uut_rx/n62 , \uut_rx/n61 , \uut_rx/n60 ,
         \uut_rx/n59 , \uut_rx/n58 , \uut_rx/n57 , \uut_rx/n56 , \uut_rx/n55 ,
         \uut_rx/n54 , \uut_rx/n53 , \uut_rx/n52 , \uut_rx/n51 , \uut_rx/n50 ,
         \uut_rx/n49 , \uut_rx/n48 , \uut_rx/n47 , \uut_rx/n46 , \uut_rx/n45 ,
         \uut_rx/n44 , \uut_rx/n43 , \uut_rx/n42 , \uut_rx/n41 , \uut_rx/n40 ,
         \uut_rx/n39 , \uut_rx/n38 , \uut_rx/n37 , \uut_rx/n36 , \uut_rx/n35 ,
         \uut_rx/n34 , \uut_rx/n33 , \uut_rx/n32 , \uut_rx/n31 , \uut_rx/n30 ,
         \uut_rx/n29 , \uut_rx/n28 , \uut_rx/n27 , \uut_rx/n24 , \uut_rx/n23 ,
         \uut_rx/n22 , \uut_rx/n21 , \uut_rx/n20 , \uut_rx/n19 , \uut_rx/n17 ,
         \uut_rx/n16 , \uut_rx/n14 , \uut_rx/n11 , \uut_rx/n10 , \uut_rx/n9 ,
         \uut_rx/n8 , \uut_rx/n7 , \uut_rx/n6 , \uut_rx/n5 , \uut_rx/n4 ,
         \uut_rx/n3 , \uut_rx/n2 , \uut_rx/n1 , \uut_rx/n75 , \uut_rx/n74 ,
         \uut_rx/n73 , \uut_rx/n72 , \uut_rx/n71 , \uut_rx/n70 , \uut_rx/n69 ,
         \uut_rx/n68 , \uut_rx/n26 , \uut_rx/n25 , \uut_rx/n18 , \uut_rx/n15 ,
         \uut_rx/n13 , \uut_rx/n12 , \uut_rx/N101 , \uut_rx/N99 , \uut_rx/N87 ,
         \uut_rx/N86 , \uut_rx/N85 , \uut_rx/N66 , \uut_rx/count_8_indication ,
         \uut_rx/N47 , \uut_rx/count_16_indication ;
  wire   [31:0] baud_division;
  wire   [7:0] data_out;
  wire   [7:0] data_in;
  wire   [31:0] \uut_baud_rate/baud_count ;
  wire   [1:0] \uut_tx/next_state ;
  wire   [7:0] \uut_tx/data_save ;
  wire   [3:0] \uut_tx/count_16 ;
  wire   [1:0] \uut_tx/current_state ;
  wire   [1:0] \uut_rx/next_state ;
  wire   [2:0] \uut_rx/count_8 ;
  wire   [7:0] \uut_rx/data_save ;
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
  OAI21_X1 \uut_baud_rate/U95  ( .B1(\uut_baud_rate/n89 ), .B2(
        \uut_baud_rate/n88 ), .A(\uut_baud_rate/n87 ), .ZN(\uut_baud_rate/n25 ) );
  NAND3_X1 \uut_baud_rate/U94  ( .A1(\uut_baud_rate/n65 ), .A2(
        \uut_baud_rate/n89 ), .A3(\uut_baud_rate/n86 ), .ZN(
        \uut_baud_rate/n87 ) );
  AND2_X1 \uut_baud_rate/U93  ( .A1(\uut_baud_rate/n72 ), .A2(
        \uut_baud_rate/N44 ), .ZN(\uut_baud_rate/N109 ) );
  NAND2_X1 \uut_baud_rate/U92  ( .A1(\uut_baud_rate/n84 ), .A2(
        \uut_baud_rate/n89 ), .ZN(\uut_baud_rate/n90 ) );
  NAND3_X1 \uut_baud_rate/U91  ( .A1(\uut_baud_rate/n2 ), .A2(
        \uut_baud_rate/N13 ), .A3(\uut_baud_rate/n68 ), .ZN(
        \uut_baud_rate/n84 ) );
  NAND2_X1 \uut_baud_rate/U90  ( .A1(\uut_baud_rate/n86 ), .A2(
        \uut_baud_rate/n82 ), .ZN(\uut_baud_rate/n89 ) );
  INV_X1 \uut_baud_rate/U89  ( .A(\uut_baud_rate/n81 ), .ZN(
        \uut_baud_rate/n82 ) );
  AND2_X1 \uut_baud_rate/U88  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/N14 ), .ZN(\uut_baud_rate/N79 ) );
  AND2_X1 \uut_baud_rate/U87  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N15 ), .ZN(\uut_baud_rate/N80 ) );
  AND2_X1 \uut_baud_rate/U86  ( .A1(\uut_baud_rate/n72 ), .A2(
        \uut_baud_rate/N16 ), .ZN(\uut_baud_rate/N81 ) );
  AND2_X1 \uut_baud_rate/U85  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N17 ), .ZN(\uut_baud_rate/N82 ) );
  AND2_X1 \uut_baud_rate/U84  ( .A1(\uut_baud_rate/n85 ), .A2(
        \uut_baud_rate/N18 ), .ZN(\uut_baud_rate/N83 ) );
  AND2_X1 \uut_baud_rate/U83  ( .A1(\uut_baud_rate/n72 ), .A2(
        \uut_baud_rate/N20 ), .ZN(\uut_baud_rate/N85 ) );
  AND2_X1 \uut_baud_rate/U82  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/N21 ), .ZN(\uut_baud_rate/N86 ) );
  AND2_X1 \uut_baud_rate/U81  ( .A1(\uut_baud_rate/n74 ), .A2(
        \uut_baud_rate/N22 ), .ZN(\uut_baud_rate/N87 ) );
  AND2_X1 \uut_baud_rate/U80  ( .A1(\uut_baud_rate/n72 ), .A2(
        \uut_baud_rate/N23 ), .ZN(\uut_baud_rate/N88 ) );
  AND2_X1 \uut_baud_rate/U79  ( .A1(\uut_baud_rate/n72 ), .A2(
        \uut_baud_rate/N24 ), .ZN(\uut_baud_rate/N89 ) );
  AND2_X1 \uut_baud_rate/U78  ( .A1(\uut_baud_rate/n74 ), .A2(
        \uut_baud_rate/N25 ), .ZN(\uut_baud_rate/N90 ) );
  AND2_X1 \uut_baud_rate/U77  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/N26 ), .ZN(\uut_baud_rate/N91 ) );
  AND2_X1 \uut_baud_rate/U76  ( .A1(\uut_baud_rate/n85 ), .A2(
        \uut_baud_rate/N27 ), .ZN(\uut_baud_rate/N92 ) );
  AND2_X1 \uut_baud_rate/U75  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/N28 ), .ZN(\uut_baud_rate/N93 ) );
  AND2_X1 \uut_baud_rate/U74  ( .A1(\uut_baud_rate/n73 ), .A2(
        \uut_baud_rate/N29 ), .ZN(\uut_baud_rate/N94 ) );
  AND2_X1 \uut_baud_rate/U73  ( .A1(\uut_baud_rate/n85 ), .A2(
        \uut_baud_rate/N30 ), .ZN(\uut_baud_rate/N95 ) );
  AND2_X1 \uut_baud_rate/U72  ( .A1(\uut_baud_rate/n74 ), .A2(
        \uut_baud_rate/N31 ), .ZN(\uut_baud_rate/N96 ) );
  AND2_X1 \uut_baud_rate/U71  ( .A1(\uut_baud_rate/n85 ), .A2(
        \uut_baud_rate/N32 ), .ZN(\uut_baud_rate/N97 ) );
  AND2_X1 \uut_baud_rate/U70  ( .A1(\uut_baud_rate/n85 ), .A2(
        \uut_baud_rate/N33 ), .ZN(\uut_baud_rate/N98 ) );
  AND2_X1 \uut_baud_rate/U69  ( .A1(\uut_baud_rate/n74 ), .A2(
        \uut_baud_rate/N34 ), .ZN(\uut_baud_rate/N99 ) );
  NAND2_X1 \uut_baud_rate/U68  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/n83 ), .ZN(\uut_baud_rate/n80 ) );
  AND2_X1 \uut_baud_rate/U67  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N35 ), .ZN(\uut_baud_rate/N100 ) );
  AND2_X1 \uut_baud_rate/U66  ( .A1(\uut_baud_rate/n74 ), .A2(
        \uut_baud_rate/N36 ), .ZN(\uut_baud_rate/N101 ) );
  AND2_X1 \uut_baud_rate/U65  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N37 ), .ZN(\uut_baud_rate/N102 ) );
  AND2_X1 \uut_baud_rate/U64  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N38 ), .ZN(\uut_baud_rate/N103 ) );
  AND2_X1 \uut_baud_rate/U63  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N39 ), .ZN(\uut_baud_rate/N104 ) );
  AND2_X1 \uut_baud_rate/U62  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N40 ), .ZN(\uut_baud_rate/N105 ) );
  AND2_X1 \uut_baud_rate/U61  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N41 ), .ZN(\uut_baud_rate/N106 ) );
  AND2_X1 \uut_baud_rate/U60  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N42 ), .ZN(\uut_baud_rate/N107 ) );
  AND2_X1 \uut_baud_rate/U59  ( .A1(\uut_baud_rate/n48 ), .A2(
        \uut_baud_rate/N43 ), .ZN(\uut_baud_rate/N108 ) );
  INV_X1 \uut_baud_rate/U58  ( .A(\uut_baud_rate/tc_reached ), .ZN(
        \uut_baud_rate/n83 ) );
  INV_X1 \uut_baud_rate/U57  ( .A(\uut_baud_rate/n78 ), .ZN(
        \uut_baud_rate/n86 ) );
  OAI21_X1 \uut_baud_rate/U56  ( .B1(\uut_baud_rate/n77 ), .B2(
        \uut_baud_rate/n76 ), .A(\uut_baud_rate/n75 ), .ZN(\uut_baud_rate/n78 ) );
  NAND4_X1 \uut_baud_rate/U55  ( .A1(\uut_baud_rate/n19 ), .A2(
        \uut_baud_rate/n20 ), .A3(\uut_baud_rate/n17 ), .A4(
        \uut_baud_rate/n18 ), .ZN(\uut_baud_rate/n76 ) );
  NAND4_X1 \uut_baud_rate/U54  ( .A1(\uut_baud_rate/n23 ), .A2(
        \uut_baud_rate/n24 ), .A3(\uut_baud_rate/n21 ), .A4(
        \uut_baud_rate/n22 ), .ZN(\uut_baud_rate/n77 ) );
  AND2_X1 \uut_baud_rate/U53  ( .A1(\uut_baud_rate/temp_en ), .A2(
        \uut_baud_rate/n75 ), .ZN(\uut_baud_rate/n26 ) );
  INV_X1 \uut_baud_rate/U52  ( .A(rst), .ZN(\uut_baud_rate/n75 ) );
  NOR2_X1 \uut_baud_rate/U51  ( .A1(rst), .A2(\uut_baud_rate/n79 ), .ZN(
        \uut_baud_rate/n27 ) );
  INV_X1 \uut_baud_rate/U50  ( .A(enable), .ZN(\uut_baud_rate/n79 ) );
  INV_X1 \uut_baud_rate/U49  ( .A(\uut_baud_rate/n70 ), .ZN(
        \uut_baud_rate/n74 ) );
  INV_X1 \uut_baud_rate/U48  ( .A(\uut_baud_rate/n80 ), .ZN(
        \uut_baud_rate/n85 ) );
  INV_X1 \uut_baud_rate/U47  ( .A(\uut_baud_rate/n80 ), .ZN(
        \uut_baud_rate/n73 ) );
  INV_X1 \uut_baud_rate/U46  ( .A(\uut_baud_rate/n70 ), .ZN(
        \uut_baud_rate/n72 ) );
  NAND2_X1 \uut_baud_rate/U45  ( .A1(\uut_baud_rate/n68 ), .A2(
        \uut_baud_rate/n83 ), .ZN(\uut_baud_rate/n70 ) );
  NOR4_X1 \uut_baud_rate/U44  ( .A1(baud_division[5]), .A2(baud_division[4]), 
        .A3(baud_division[3]), .A4(baud_division[31]), .ZN(\uut_baud_rate/n23 ) );
  NOR4_X1 \uut_baud_rate/U43  ( .A1(baud_division[9]), .A2(baud_division[8]), 
        .A3(baud_division[7]), .A4(baud_division[6]), .ZN(\uut_baud_rate/n24 )
         );
  NOR4_X1 \uut_baud_rate/U42  ( .A1(baud_division[23]), .A2(baud_division[22]), 
        .A3(baud_division[21]), .A4(baud_division[20]), .ZN(
        \uut_baud_rate/n20 ) );
  NOR4_X1 \uut_baud_rate/U41  ( .A1(baud_division[27]), .A2(baud_division[26]), 
        .A3(baud_division[25]), .A4(baud_division[24]), .ZN(
        \uut_baud_rate/n21 ) );
  NOR4_X1 \uut_baud_rate/U40  ( .A1(baud_division[12]), .A2(baud_division[11]), 
        .A3(baud_division[10]), .A4(baud_division[0]), .ZN(\uut_baud_rate/n17 ) );
  NOR4_X1 \uut_baud_rate/U39  ( .A1(baud_division[30]), .A2(baud_division[2]), 
        .A3(baud_division[29]), .A4(baud_division[28]), .ZN(
        \uut_baud_rate/n22 ) );
  NOR4_X1 \uut_baud_rate/U38  ( .A1(baud_division[16]), .A2(baud_division[15]), 
        .A3(baud_division[14]), .A4(baud_division[13]), .ZN(
        \uut_baud_rate/n18 ) );
  NOR4_X1 \uut_baud_rate/U37  ( .A1(baud_division[1]), .A2(baud_division[19]), 
        .A3(baud_division[18]), .A4(baud_division[17]), .ZN(
        \uut_baud_rate/n19 ) );
  NAND2_X1 \uut_baud_rate/U36  ( .A1(\uut_baud_rate/n69 ), .A2(enable), .ZN(
        \uut_baud_rate/n81 ) );
  CLKBUF_X2 \uut_baud_rate/U35  ( .A(\uut_baud_rate/baud_count [13]), .Z(
        \uut_baud_rate/n71 ) );
  AND2_X2 \uut_baud_rate/U34  ( .A1(\uut_baud_rate/n86 ), .A2(
        \uut_baud_rate/n81 ), .ZN(\uut_baud_rate/n68 ) );
  INV_X2 \uut_baud_rate/U33  ( .A(\uut_baud_rate/n66 ), .ZN(
        \uut_baud_rate/n67 ) );
  INV_X1 \uut_baud_rate/U32  ( .A(\uut_baud_rate/n83 ), .ZN(
        \uut_baud_rate/n65 ) );
  INV_X4 \uut_baud_rate/U31  ( .A(\uut_baud_rate/n63 ), .ZN(
        \uut_baud_rate/n64 ) );
  INV_X2 \uut_baud_rate/U30  ( .A(\uut_baud_rate/n61 ), .ZN(
        \uut_baud_rate/n62 ) );
  INV_X2 \uut_baud_rate/U29  ( .A(\uut_baud_rate/n59 ), .ZN(
        \uut_baud_rate/n60 ) );
  INV_X2 \uut_baud_rate/U28  ( .A(\uut_baud_rate/n57 ), .ZN(
        \uut_baud_rate/n58 ) );
  INV_X2 \uut_baud_rate/U27  ( .A(\uut_baud_rate/n55 ), .ZN(
        \uut_baud_rate/n56 ) );
  INV_X2 \uut_baud_rate/U26  ( .A(\uut_baud_rate/n53 ), .ZN(
        \uut_baud_rate/n54 ) );
  INV_X2 \uut_baud_rate/U25  ( .A(\uut_baud_rate/n51 ), .ZN(
        \uut_baud_rate/n52 ) );
  INV_X2 \uut_baud_rate/U24  ( .A(\uut_baud_rate/n49 ), .ZN(
        \uut_baud_rate/n50 ) );
  INV_X2 \uut_baud_rate/U23  ( .A(\uut_baud_rate/n46 ), .ZN(
        \uut_baud_rate/n47 ) );
  INV_X2 \uut_baud_rate/U22  ( .A(\uut_baud_rate/n44 ), .ZN(
        \uut_baud_rate/n45 ) );
  AND2_X1 \uut_baud_rate/U21  ( .A1(\uut_baud_rate/n83 ), .A2(
        \uut_baud_rate/n68 ), .ZN(\uut_baud_rate/n48 ) );
  INV_X4 \uut_baud_rate/U20  ( .A(\uut_baud_rate/n42 ), .ZN(
        \uut_baud_rate/n43 ) );
  INV_X2 \uut_baud_rate/U19  ( .A(\uut_baud_rate/n40 ), .ZN(
        \uut_baud_rate/n41 ) );
  INV_X2 \uut_baud_rate/U18  ( .A(\uut_baud_rate/n38 ), .ZN(
        \uut_baud_rate/n39 ) );
  INV_X2 \uut_baud_rate/U17  ( .A(\uut_baud_rate/n36 ), .ZN(
        \uut_baud_rate/n37 ) );
  INV_X1 \uut_baud_rate/U16  ( .A(\uut_baud_rate/n34 ), .ZN(
        \uut_baud_rate/n35 ) );
  INV_X1 \uut_baud_rate/U15  ( .A(\uut_baud_rate/n32 ), .ZN(
        \uut_baud_rate/n33 ) );
  INV_X1 \uut_baud_rate/U14  ( .A(\uut_baud_rate/n28 ), .ZN(
        \uut_baud_rate/n29 ) );
  INV_X1 \uut_baud_rate/U13  ( .A(\uut_baud_rate/n15 ), .ZN(
        \uut_baud_rate/n16 ) );
  INV_X1 \uut_baud_rate/U12  ( .A(\uut_baud_rate/n13 ), .ZN(
        \uut_baud_rate/n14 ) );
  INV_X1 \uut_baud_rate/U11  ( .A(\uut_baud_rate/n11 ), .ZN(
        \uut_baud_rate/n12 ) );
  INV_X1 \uut_baud_rate/U10  ( .A(\uut_baud_rate/n9 ), .ZN(\uut_baud_rate/n10 ) );
  INV_X1 \uut_baud_rate/U7  ( .A(\uut_baud_rate/n5 ), .ZN(\uut_baud_rate/n6 )
         );
  INV_X2 \uut_baud_rate/U6  ( .A(\uut_baud_rate/n3 ), .ZN(\uut_baud_rate/n4 )
         );
  INV_X1 \uut_baud_rate/U4  ( .A(\uut_baud_rate/n65 ), .ZN(\uut_baud_rate/n2 )
         );
  INV_X1 \uut_baud_rate/U3  ( .A(\uut_baud_rate/n30 ), .ZN(\uut_baud_rate/n31 ) );
  SDFFR_X2 \uut_baud_rate/baud_count_reg[6]  ( .D(1'b0), .SI(
        \uut_baud_rate/n48 ), .SE(\uut_baud_rate/N19 ), .CK(clk), .RN(1'b1), 
        .Q(\uut_baud_rate/baud_count [6]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[13]  ( .D(\uut_baud_rate/N91 ), .CK(clk), .Q(\uut_baud_rate/baud_count [13]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[8]  ( .D(\uut_baud_rate/N86 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [8]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[9]  ( .D(\uut_baud_rate/N87 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [9]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[12]  ( .D(\uut_baud_rate/N90 ), .CK(clk), .Q(\uut_baud_rate/baud_count [12]), .QN(\uut_baud_rate/n3 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[31]  ( .D(\uut_baud_rate/N109 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [31]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[2]  ( .D(\uut_baud_rate/N80 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [2]), .QN(\uut_baud_rate/n5 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[29]  ( .D(\uut_baud_rate/N107 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [29]) );
  DFF_X1 \uut_baud_rate/baud_count_reg[30]  ( .D(\uut_baud_rate/N108 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [30]) );
  DFF_X1 \uut_baud_rate/baud_tick_reg  ( .D(\uut_baud_rate/n25 ), .CK(clk), 
        .Q(baud_tick), .QN(\uut_baud_rate/n88 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[11]  ( .D(\uut_baud_rate/N89 ), .CK(clk), .Q(\uut_baud_rate/baud_count [11]), .QN(\uut_baud_rate/n42 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[21]  ( .D(\uut_baud_rate/N99 ), .CK(clk), .Q(\uut_baud_rate/baud_count [21]), .QN(\uut_baud_rate/n44 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[22]  ( .D(\uut_baud_rate/N100 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [22]), .QN(\uut_baud_rate/n46 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[20]  ( .D(\uut_baud_rate/N98 ), .CK(clk), .Q(\uut_baud_rate/baud_count [20]), .QN(\uut_baud_rate/n51 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[17]  ( .D(\uut_baud_rate/N95 ), .CK(clk), .Q(\uut_baud_rate/baud_count [17]), .QN(\uut_baud_rate/n53 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[16]  ( .D(\uut_baud_rate/N94 ), .CK(clk), .Q(\uut_baud_rate/baud_count [16]), .QN(\uut_baud_rate/n55 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[18]  ( .D(\uut_baud_rate/N96 ), .CK(clk), .Q(\uut_baud_rate/baud_count [18]), .QN(\uut_baud_rate/n57 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[15]  ( .D(\uut_baud_rate/N93 ), .CK(clk), .Q(\uut_baud_rate/baud_count [15]), .QN(\uut_baud_rate/n61 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[10]  ( .D(\uut_baud_rate/N88 ), .CK(clk), .Q(\uut_baud_rate/baud_count [10]), .QN(\uut_baud_rate/n63 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[14]  ( .D(\uut_baud_rate/N92 ), .CK(clk), .Q(\uut_baud_rate/baud_count [14]), .QN(\uut_baud_rate/n66 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[26]  ( .D(\uut_baud_rate/N104 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [26]), .QN(\uut_baud_rate/n36 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[25]  ( .D(\uut_baud_rate/N103 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [25]), .QN(\uut_baud_rate/n38 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[27]  ( .D(\uut_baud_rate/N105 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [27]), .QN(\uut_baud_rate/n30 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[24]  ( .D(\uut_baud_rate/N102 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [24]), .QN(\uut_baud_rate/n40 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[23]  ( .D(\uut_baud_rate/N101 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [23]), .QN(\uut_baud_rate/n49 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[1]  ( .D(\uut_baud_rate/N79 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [1]), .QN(\uut_baud_rate/n32 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[19]  ( .D(\uut_baud_rate/N97 ), .CK(clk), .Q(\uut_baud_rate/baud_count [19]), .QN(\uut_baud_rate/n59 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[28]  ( .D(\uut_baud_rate/N106 ), .CK(
        clk), .Q(\uut_baud_rate/baud_count [28]), .QN(\uut_baud_rate/n9 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[3]  ( .D(\uut_baud_rate/N81 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [3]), .QN(\uut_baud_rate/n28 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[5]  ( .D(\uut_baud_rate/N83 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [5]), .QN(\uut_baud_rate/n15 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[7]  ( .D(\uut_baud_rate/N85 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [7]), .QN(\uut_baud_rate/n34 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[4]  ( .D(\uut_baud_rate/N82 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [4]), .QN(\uut_baud_rate/n11 ) );
  DFF_X1 \uut_baud_rate/baud_count_reg[0]  ( .D(\uut_baud_rate/n90 ), .CK(clk), 
        .Q(\uut_baud_rate/baud_count [0]), .QN(\uut_baud_rate/n13 ) );
  DFF_X1 \uut_baud_rate/delayed_en_reg  ( .D(\uut_baud_rate/n26 ), .CK(clk), 
        .QN(\uut_baud_rate/n69 ) );
  DFF_X1 \uut_baud_rate/temp_en_reg  ( .D(\uut_baud_rate/n27 ), .CK(clk), .Q(
        \uut_baud_rate/temp_en ) );
  NAND3_X1 \uut_baud_rate/add_154/U334  ( .A1(\uut_baud_rate/add_154/n28 ), 
        .A2(\uut_baud_rate/add_154/n7 ), .A3(\uut_baud_rate/add_154/n46 ), 
        .ZN(\uut_baud_rate/add_154/n302 ) );
  NAND3_X1 \uut_baud_rate/add_154/U333  ( .A1(\uut_baud_rate/add_154/n23 ), 
        .A2(\uut_baud_rate/add_154/n32 ), .A3(\uut_baud_rate/add_154/n25 ), 
        .ZN(\uut_baud_rate/add_154/n300 ) );
  NAND3_X1 \uut_baud_rate/add_154/U332  ( .A1(\uut_baud_rate/add_154/n47 ), 
        .A2(\uut_baud_rate/add_154/n9 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n295 ) );
  NAND3_X1 \uut_baud_rate/add_154/U331  ( .A1(\uut_baud_rate/add_154/n35 ), 
        .A2(\uut_baud_rate/add_154/n32 ), .A3(\uut_baud_rate/add_154/n5 ), 
        .ZN(\uut_baud_rate/add_154/n294 ) );
  NAND3_X1 \uut_baud_rate/add_154/U330  ( .A1(\uut_baud_rate/add_154/n29 ), 
        .A2(\uut_baud_rate/add_154/n18 ), .A3(\uut_baud_rate/add_154/n26 ), 
        .ZN(\uut_baud_rate/add_154/n289 ) );
  NAND3_X1 \uut_baud_rate/add_154/U329  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/add_154/n46 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n290 ) );
  NAND3_X1 \uut_baud_rate/add_154/U328  ( .A1(\uut_baud_rate/add_154/n35 ), 
        .A2(\uut_baud_rate/add_154/n32 ), .A3(\uut_baud_rate/add_154/n5 ), 
        .ZN(\uut_baud_rate/add_154/n288 ) );
  NAND2_X1 \uut_baud_rate/add_154/U327  ( .A1(\uut_baud_rate/add_154/n31 ), 
        .A2(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n284 ) );
  NAND4_X1 \uut_baud_rate/add_154/U326  ( .A1(\uut_baud_rate/add_154/n280 ), 
        .A2(\uut_baud_rate/add_154/n281 ), .A3(\uut_baud_rate/add_154/n282 ), 
        .A4(\uut_baud_rate/add_154/n283 ), .ZN(\uut_baud_rate/add_154/n279 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U325  ( .A(\uut_baud_rate/add_154/n279 ), 
        .B(\uut_baud_rate/n71 ), .ZN(\uut_baud_rate/N26 ) );
  NAND2_X1 \uut_baud_rate/add_154/U324  ( .A1(\uut_baud_rate/add_154/n28 ), 
        .A2(\uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n277 ) );
  NAND2_X1 \uut_baud_rate/add_154/U323  ( .A1(\uut_baud_rate/n64 ), .A2(
        \uut_baud_rate/add_154/n46 ), .ZN(\uut_baud_rate/add_154/n278 ) );
  NAND2_X1 \uut_baud_rate/add_154/U322  ( .A1(\uut_baud_rate/add_154/n5 ), 
        .A2(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n275 ) );
  NAND2_X1 \uut_baud_rate/add_154/U321  ( .A1(\uut_baud_rate/add_154/n23 ), 
        .A2(\uut_baud_rate/add_154/n22 ), .ZN(\uut_baud_rate/add_154/n276 ) );
  NAND4_X1 \uut_baud_rate/add_154/U320  ( .A1(\uut_baud_rate/add_154/n271 ), 
        .A2(\uut_baud_rate/add_154/n272 ), .A3(\uut_baud_rate/add_154/n273 ), 
        .A4(\uut_baud_rate/add_154/n274 ), .ZN(\uut_baud_rate/add_154/n270 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U319  ( .A(\uut_baud_rate/add_154/n270 ), 
        .B(\uut_baud_rate/n67 ), .ZN(\uut_baud_rate/N27 ) );
  NAND2_X1 \uut_baud_rate/add_154/U318  ( .A1(\uut_baud_rate/add_154/n46 ), 
        .A2(\uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n268 ) );
  NAND2_X1 \uut_baud_rate/add_154/U317  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n64 ), .ZN(\uut_baud_rate/add_154/n269 ) );
  NAND2_X1 \uut_baud_rate/add_154/U316  ( .A1(\uut_baud_rate/add_154/n3 ), 
        .A2(\uut_baud_rate/add_154/n24 ), .ZN(\uut_baud_rate/add_154/n266 ) );
  NAND2_X1 \uut_baud_rate/add_154/U315  ( .A1(\uut_baud_rate/add_154/n27 ), 
        .A2(\uut_baud_rate/add_154/n18 ), .ZN(\uut_baud_rate/add_154/n267 ) );
  NAND2_X1 \uut_baud_rate/add_154/U314  ( .A1(\uut_baud_rate/add_154/n6 ), 
        .A2(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n265 ) );
  NAND4_X1 \uut_baud_rate/add_154/U313  ( .A1(\uut_baud_rate/add_154/n261 ), 
        .A2(\uut_baud_rate/add_154/n262 ), .A3(\uut_baud_rate/add_154/n263 ), 
        .A4(\uut_baud_rate/add_154/n264 ), .ZN(\uut_baud_rate/add_154/n260 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U312  ( .A(\uut_baud_rate/add_154/n260 ), 
        .B(\uut_baud_rate/n62 ), .ZN(\uut_baud_rate/N28 ) );
  NAND2_X1 \uut_baud_rate/add_154/U311  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n4 ), .ZN(\uut_baud_rate/add_154/n258 ) );
  NAND2_X1 \uut_baud_rate/add_154/U310  ( .A1(\uut_baud_rate/n62 ), .A2(
        \uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_154/n259 ) );
  NAND2_X1 \uut_baud_rate/add_154/U309  ( .A1(\uut_baud_rate/add_154/n46 ), 
        .A2(\uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n256 ) );
  NAND2_X1 \uut_baud_rate/add_154/U308  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n64 ), .ZN(\uut_baud_rate/add_154/n257 ) );
  NAND2_X1 \uut_baud_rate/add_154/U307  ( .A1(\uut_baud_rate/add_154/n37 ), 
        .A2(\uut_baud_rate/add_154/n24 ), .ZN(\uut_baud_rate/add_154/n254 ) );
  NAND2_X1 \uut_baud_rate/add_154/U306  ( .A1(\uut_baud_rate/add_154/n27 ), 
        .A2(\uut_baud_rate/add_154/n18 ), .ZN(\uut_baud_rate/add_154/n255 ) );
  NAND2_X1 \uut_baud_rate/add_154/U305  ( .A1(\uut_baud_rate/add_154/n31 ), 
        .A2(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n253 ) );
  NAND4_X1 \uut_baud_rate/add_154/U304  ( .A1(\uut_baud_rate/add_154/n249 ), 
        .A2(\uut_baud_rate/add_154/n250 ), .A3(\uut_baud_rate/add_154/n251 ), 
        .A4(\uut_baud_rate/add_154/n252 ), .ZN(\uut_baud_rate/add_154/n248 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U303  ( .A(\uut_baud_rate/add_154/n248 ), 
        .B(\uut_baud_rate/n56 ), .ZN(\uut_baud_rate/N29 ) );
  NAND4_X1 \uut_baud_rate/add_154/U302  ( .A1(\uut_baud_rate/n4 ), .A2(
        \uut_baud_rate/n43 ), .A3(\uut_baud_rate/n64 ), .A4(
        \uut_baud_rate/add_154/n46 ), .ZN(\uut_baud_rate/add_154/n246 ) );
  NAND4_X1 \uut_baud_rate/add_154/U301  ( .A1(\uut_baud_rate/n56 ), .A2(
        \uut_baud_rate/n62 ), .A3(\uut_baud_rate/n67 ), .A4(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_154/n247 ) );
  NOR2_X1 \uut_baud_rate/add_154/U300  ( .A1(\uut_baud_rate/add_154/n246 ), 
        .A2(\uut_baud_rate/add_154/n247 ), .ZN(\uut_baud_rate/add_154/n242 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U299  ( .A1(\uut_baud_rate/add_154/n29 ), 
        .A2(\uut_baud_rate/add_154/n27 ), .A3(\uut_baud_rate/add_154/n18 ), 
        .A4(\uut_baud_rate/add_154/n38 ), .ZN(\uut_baud_rate/add_154/n244 ) );
  NAND2_X1 \uut_baud_rate/add_154/U298  ( .A1(\uut_baud_rate/add_154/n6 ), 
        .A2(\uut_baud_rate/add_154/n8 ), .ZN(\uut_baud_rate/add_154/n245 ) );
  NOR2_X1 \uut_baud_rate/add_154/U297  ( .A1(\uut_baud_rate/add_154/n244 ), 
        .A2(\uut_baud_rate/add_154/n245 ), .ZN(\uut_baud_rate/add_154/n243 )
         );
  NAND3_X1 \uut_baud_rate/add_154/U296  ( .A1(\uut_baud_rate/add_154/n52 ), 
        .A2(\uut_baud_rate/add_154/n242 ), .A3(\uut_baud_rate/add_154/n243 ), 
        .ZN(\uut_baud_rate/add_154/n241 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U295  ( .A(\uut_baud_rate/add_154/n241 ), 
        .B(\uut_baud_rate/n54 ), .ZN(\uut_baud_rate/N30 ) );
  NAND3_X1 \uut_baud_rate/add_154/U294  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n4 ), .A3(\uut_baud_rate/add_154/n46 ), .ZN(
        \uut_baud_rate/add_154/n240 ) );
  NAND3_X1 \uut_baud_rate/add_154/U293  ( .A1(\uut_baud_rate/add_154/n236 ), 
        .A2(\uut_baud_rate/add_154/n237 ), .A3(\uut_baud_rate/add_154/n238 ), 
        .ZN(\uut_baud_rate/add_154/n235 ) );
  NAND2_X1 \uut_baud_rate/add_154/U292  ( .A1(\uut_baud_rate/add_154/n233 ), 
        .A2(\uut_baud_rate/add_154/n234 ), .ZN(\uut_baud_rate/add_154/n232 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U291  ( .A(\uut_baud_rate/add_154/n232 ), 
        .B(\uut_baud_rate/n58 ), .ZN(\uut_baud_rate/N31 ) );
  NAND3_X1 \uut_baud_rate/add_154/U290  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n231 ) );
  NAND3_X1 \uut_baud_rate/add_154/U289  ( .A1(\uut_baud_rate/add_154/n47 ), 
        .A2(\uut_baud_rate/add_154/n28 ), .A3(\uut_baud_rate/add_154/n4 ), 
        .ZN(\uut_baud_rate/add_154/n228 ) );
  NAND2_X1 \uut_baud_rate/add_154/U288  ( .A1(\uut_baud_rate/add_154/n43 ), 
        .A2(\uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n229 ) );
  NAND3_X1 \uut_baud_rate/add_154/U287  ( .A1(\uut_baud_rate/add_154/n25 ), 
        .A2(\uut_baud_rate/add_154/n23 ), .A3(\uut_baud_rate/add_154/n20 ), 
        .ZN(\uut_baud_rate/add_154/n226 ) );
  NAND2_X1 \uut_baud_rate/add_154/U286  ( .A1(\uut_baud_rate/add_154/n30 ), 
        .A2(\uut_baud_rate/add_154/n22 ), .ZN(\uut_baud_rate/add_154/n227 ) );
  NAND3_X1 \uut_baud_rate/add_154/U285  ( .A1(\uut_baud_rate/n60 ), .A2(
        \uut_baud_rate/n58 ), .A3(\uut_baud_rate/n62 ), .ZN(
        \uut_baud_rate/add_154/n219 ) );
  NAND2_X1 \uut_baud_rate/add_154/U284  ( .A1(\uut_baud_rate/n56 ), .A2(
        \uut_baud_rate/n54 ), .ZN(\uut_baud_rate/add_154/n220 ) );
  NAND3_X1 \uut_baud_rate/add_154/U283  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n217 ) );
  NAND2_X1 \uut_baud_rate/add_154/U282  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n4 ), .ZN(\uut_baud_rate/add_154/n218 ) );
  NAND3_X1 \uut_baud_rate/add_154/U281  ( .A1(\uut_baud_rate/add_154/n47 ), 
        .A2(\uut_baud_rate/add_154/n28 ), .A3(\uut_baud_rate/add_154/n7 ), 
        .ZN(\uut_baud_rate/add_154/n215 ) );
  NAND2_X1 \uut_baud_rate/add_154/U280  ( .A1(\uut_baud_rate/add_154/n43 ), 
        .A2(\uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n216 ) );
  NAND4_X1 \uut_baud_rate/add_154/U279  ( .A1(\uut_baud_rate/add_154/n211 ), 
        .A2(\uut_baud_rate/add_154/n212 ), .A3(\uut_baud_rate/add_154/n213 ), 
        .A4(\uut_baud_rate/add_154/n214 ), .ZN(\uut_baud_rate/add_154/n210 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U278  ( .A(\uut_baud_rate/add_154/n210 ), 
        .B(\uut_baud_rate/n52 ), .ZN(\uut_baud_rate/N33 ) );
  NAND3_X1 \uut_baud_rate/add_154/U277  ( .A1(\uut_baud_rate/n60 ), .A2(
        \uut_baud_rate/n56 ), .A3(\uut_baud_rate/n52 ), .ZN(
        \uut_baud_rate/add_154/n208 ) );
  NAND3_X1 \uut_baud_rate/add_154/U276  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n43 ), .A3(\uut_baud_rate/n62 ), .ZN(
        \uut_baud_rate/add_154/n206 ) );
  NAND3_X1 \uut_baud_rate/add_154/U275  ( .A1(\uut_baud_rate/add_154/n47 ), 
        .A2(\uut_baud_rate/add_154/n17 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n204 ) );
  NAND3_X1 \uut_baud_rate/add_154/U274  ( .A1(\uut_baud_rate/add_154/n35 ), 
        .A2(\uut_baud_rate/add_154/n32 ), .A3(\uut_baud_rate/add_154/n5 ), 
        .ZN(\uut_baud_rate/add_154/n202 ) );
  NAND3_X1 \uut_baud_rate/add_154/U273  ( .A1(\uut_baud_rate/add_154/n38 ), 
        .A2(\uut_baud_rate/add_154/n23 ), .A3(\uut_baud_rate/add_154/n24 ), 
        .ZN(\uut_baud_rate/add_154/n203 ) );
  NAND3_X1 \uut_baud_rate/add_154/U272  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/n54 ), .A3(\uut_baud_rate/n45 ), .ZN(
        \uut_baud_rate/add_154/n195 ) );
  NAND3_X1 \uut_baud_rate/add_154/U271  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n43 ), .A3(\uut_baud_rate/n4 ), .ZN(
        \uut_baud_rate/add_154/n193 ) );
  NAND3_X1 \uut_baud_rate/add_154/U270  ( .A1(\uut_baud_rate/n56 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n62 ), .ZN(
        \uut_baud_rate/add_154/n194 ) );
  NAND3_X1 \uut_baud_rate/add_154/U269  ( .A1(\uut_baud_rate/add_154/n47 ), 
        .A2(\uut_baud_rate/add_154/n9 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n191 ) );
  NAND3_X1 \uut_baud_rate/add_154/U268  ( .A1(\uut_baud_rate/add_154/n35 ), 
        .A2(\uut_baud_rate/add_154/n20 ), .A3(\uut_baud_rate/add_154/n6 ), 
        .ZN(\uut_baud_rate/add_154/n190 ) );
  NAND3_X1 \uut_baud_rate/add_154/U267  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/n58 ), .A3(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/add_154/n183 ) );
  NAND3_X1 \uut_baud_rate/add_154/U266  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n4 ), .A3(\uut_baud_rate/n71 ), .ZN(
        \uut_baud_rate/add_154/n181 ) );
  NAND3_X1 \uut_baud_rate/add_154/U265  ( .A1(\uut_baud_rate/n54 ), .A2(
        \uut_baud_rate/n62 ), .A3(\uut_baud_rate/n56 ), .ZN(
        \uut_baud_rate/add_154/n182 ) );
  NAND3_X1 \uut_baud_rate/add_154/U264  ( .A1(\uut_baud_rate/add_154/n29 ), 
        .A2(\uut_baud_rate/add_154/n17 ), .A3(\uut_baud_rate/add_154/n26 ), 
        .ZN(\uut_baud_rate/add_154/n179 ) );
  NAND3_X1 \uut_baud_rate/add_154/U263  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/add_154/n46 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n180 ) );
  NAND3_X1 \uut_baud_rate/add_154/U262  ( .A1(\uut_baud_rate/add_154/n35 ), 
        .A2(\uut_baud_rate/add_154/n32 ), .A3(\uut_baud_rate/add_154/n31 ), 
        .ZN(\uut_baud_rate/add_154/n177 ) );
  NAND3_X1 \uut_baud_rate/add_154/U261  ( .A1(\uut_baud_rate/add_154/n1 ), 
        .A2(\uut_baud_rate/add_154/n23 ), .A3(\uut_baud_rate/add_154/n24 ), 
        .ZN(\uut_baud_rate/add_154/n178 ) );
  NAND3_X1 \uut_baud_rate/add_154/U260  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/n58 ), .A3(\uut_baud_rate/n60 ), .ZN(
        \uut_baud_rate/add_154/n170 ) );
  NAND3_X1 \uut_baud_rate/add_154/U259  ( .A1(\uut_baud_rate/n50 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/add_154/n171 ) );
  NAND3_X1 \uut_baud_rate/add_154/U258  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n4 ), .A3(\uut_baud_rate/n71 ), .ZN(
        \uut_baud_rate/add_154/n168 ) );
  NAND3_X1 \uut_baud_rate/add_154/U257  ( .A1(\uut_baud_rate/n54 ), .A2(
        \uut_baud_rate/n62 ), .A3(\uut_baud_rate/n56 ), .ZN(
        \uut_baud_rate/add_154/n169 ) );
  NAND3_X1 \uut_baud_rate/add_154/U256  ( .A1(\uut_baud_rate/add_154/n29 ), 
        .A2(\uut_baud_rate/add_154/n18 ), .A3(\uut_baud_rate/add_154/n27 ), 
        .ZN(\uut_baud_rate/add_154/n166 ) );
  NAND3_X1 \uut_baud_rate/add_154/U255  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/add_154/n46 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n167 ) );
  NAND3_X1 \uut_baud_rate/add_154/U254  ( .A1(\uut_baud_rate/add_154/n35 ), 
        .A2(\uut_baud_rate/add_154/n20 ), .A3(\uut_baud_rate/add_154/n5 ), 
        .ZN(\uut_baud_rate/add_154/n165 ) );
  NAND3_X1 \uut_baud_rate/add_154/U253  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n60 ), .ZN(
        \uut_baud_rate/add_154/n158 ) );
  NAND3_X1 \uut_baud_rate/add_154/U252  ( .A1(\uut_baud_rate/n50 ), .A2(
        \uut_baud_rate/n41 ), .A3(\uut_baud_rate/n47 ), .ZN(
        \uut_baud_rate/add_154/n159 ) );
  NAND3_X1 \uut_baud_rate/add_154/U251  ( .A1(\uut_baud_rate/n67 ), .A2(
        \uut_baud_rate/n62 ), .A3(\uut_baud_rate/n71 ), .ZN(
        \uut_baud_rate/add_154/n156 ) );
  NAND3_X1 \uut_baud_rate/add_154/U250  ( .A1(\uut_baud_rate/n54 ), .A2(
        \uut_baud_rate/n58 ), .A3(\uut_baud_rate/n56 ), .ZN(
        \uut_baud_rate/add_154/n157 ) );
  NAND3_X1 \uut_baud_rate/add_154/U249  ( .A1(\uut_baud_rate/add_154/n29 ), 
        .A2(\uut_baud_rate/add_154/n46 ), .A3(\uut_baud_rate/add_154/n26 ), 
        .ZN(\uut_baud_rate/add_154/n154 ) );
  NAND3_X1 \uut_baud_rate/add_154/U248  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n4 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n155 ) );
  NAND4_X1 \uut_baud_rate/add_154/U247  ( .A1(\uut_baud_rate/add_154/n23 ), 
        .A2(\uut_baud_rate/add_154/n8 ), .A3(\uut_baud_rate/add_154/n30 ), 
        .A4(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n152 ) );
  NAND3_X1 \uut_baud_rate/add_154/U246  ( .A1(\uut_baud_rate/add_154/n37 ), 
        .A2(\uut_baud_rate/add_154/n17 ), .A3(\uut_baud_rate/add_154/n25 ), 
        .ZN(\uut_baud_rate/add_154/n153 ) );
  NOR2_X1 \uut_baud_rate/add_154/U245  ( .A1(\uut_baud_rate/add_154/n152 ), 
        .A2(\uut_baud_rate/add_154/n153 ), .ZN(\uut_baud_rate/add_154/n151 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U244  ( .A1(\uut_baud_rate/add_154/n148 ), 
        .A2(\uut_baud_rate/add_154/n149 ), .A3(\uut_baud_rate/add_154/n150 ), 
        .A4(\uut_baud_rate/add_154/n151 ), .ZN(\uut_baud_rate/add_154/n147 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U243  ( .A(\uut_baud_rate/add_154/n147 ), 
        .B(\uut_baud_rate/n39 ), .ZN(\uut_baud_rate/N38 ) );
  NAND3_X1 \uut_baud_rate/add_154/U242  ( .A1(\uut_baud_rate/n45 ), .A2(
        \uut_baud_rate/n47 ), .A3(\uut_baud_rate/n52 ), .ZN(
        \uut_baud_rate/add_154/n145 ) );
  NAND3_X1 \uut_baud_rate/add_154/U241  ( .A1(\uut_baud_rate/n41 ), .A2(
        \uut_baud_rate/n39 ), .A3(\uut_baud_rate/n50 ), .ZN(
        \uut_baud_rate/add_154/n146 ) );
  NAND4_X1 \uut_baud_rate/add_154/U240  ( .A1(\uut_baud_rate/n56 ), .A2(
        \uut_baud_rate/n62 ), .A3(\uut_baud_rate/n67 ), .A4(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_154/n143 ) );
  NAND3_X1 \uut_baud_rate/add_154/U239  ( .A1(\uut_baud_rate/n58 ), .A2(
        \uut_baud_rate/n60 ), .A3(\uut_baud_rate/n54 ), .ZN(
        \uut_baud_rate/add_154/n144 ) );
  NOR2_X1 \uut_baud_rate/add_154/U238  ( .A1(\uut_baud_rate/add_154/n143 ), 
        .A2(\uut_baud_rate/add_154/n144 ), .ZN(\uut_baud_rate/add_154/n137 )
         );
  NAND3_X1 \uut_baud_rate/add_154/U237  ( .A1(\uut_baud_rate/add_154/n29 ), 
        .A2(\uut_baud_rate/add_154/n46 ), .A3(\uut_baud_rate/add_154/n26 ), 
        .ZN(\uut_baud_rate/add_154/n141 ) );
  NAND3_X1 \uut_baud_rate/add_154/U236  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n4 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n142 ) );
  NAND3_X1 \uut_baud_rate/add_154/U235  ( .A1(\uut_baud_rate/add_154/n4 ), 
        .A2(\uut_baud_rate/add_154/n9 ), .A3(\uut_baud_rate/add_154/n25 ), 
        .ZN(\uut_baud_rate/add_154/n140 ) );
  NOR2_X1 \uut_baud_rate/add_154/U234  ( .A1(\uut_baud_rate/add_154/n115 ), 
        .A2(\uut_baud_rate/add_154/n140 ), .ZN(\uut_baud_rate/add_154/n139 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U233  ( .A(\uut_baud_rate/add_154/n135 ), 
        .B(\uut_baud_rate/n37 ), .ZN(\uut_baud_rate/N39 ) );
  NAND3_X1 \uut_baud_rate/add_154/U232  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n50 ), .A3(\uut_baud_rate/n45 ), .ZN(
        \uut_baud_rate/add_154/n133 ) );
  NAND3_X1 \uut_baud_rate/add_154/U231  ( .A1(\uut_baud_rate/n39 ), .A2(
        \uut_baud_rate/n37 ), .A3(\uut_baud_rate/n41 ), .ZN(
        \uut_baud_rate/add_154/n134 ) );
  NAND4_X1 \uut_baud_rate/add_154/U230  ( .A1(\uut_baud_rate/n54 ), .A2(
        \uut_baud_rate/n56 ), .A3(\uut_baud_rate/n62 ), .A4(
        \uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_154/n131 ) );
  NAND3_X1 \uut_baud_rate/add_154/U229  ( .A1(\uut_baud_rate/n60 ), .A2(
        \uut_baud_rate/n52 ), .A3(\uut_baud_rate/n58 ), .ZN(
        \uut_baud_rate/add_154/n132 ) );
  NOR2_X1 \uut_baud_rate/add_154/U228  ( .A1(\uut_baud_rate/add_154/n131 ), 
        .A2(\uut_baud_rate/add_154/n132 ), .ZN(\uut_baud_rate/add_154/n125 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U227  ( .A1(\uut_baud_rate/n64 ), .A2(
        \uut_baud_rate/add_154/n47 ), .A3(\uut_baud_rate/add_154/n28 ), .A4(
        \uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n129 ) );
  NAND3_X1 \uut_baud_rate/add_154/U226  ( .A1(\uut_baud_rate/n4 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n43 ), .ZN(
        \uut_baud_rate/add_154/n130 ) );
  NOR2_X1 \uut_baud_rate/add_154/U225  ( .A1(\uut_baud_rate/add_154/n129 ), 
        .A2(\uut_baud_rate/add_154/n130 ), .ZN(\uut_baud_rate/add_154/n126 )
         );
  NAND3_X1 \uut_baud_rate/add_154/U224  ( .A1(\uut_baud_rate/add_154/n36 ), 
        .A2(\uut_baud_rate/add_154/n9 ), .A3(\uut_baud_rate/add_154/n25 ), 
        .ZN(\uut_baud_rate/add_154/n128 ) );
  NOR2_X1 \uut_baud_rate/add_154/U223  ( .A1(\uut_baud_rate/add_154/n115 ), 
        .A2(\uut_baud_rate/add_154/n128 ), .ZN(\uut_baud_rate/add_154/n127 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U222  ( .A(\uut_baud_rate/add_154/n123 ), 
        .B(\uut_baud_rate/n31 ), .ZN(\uut_baud_rate/N40 ) );
  NAND4_X1 \uut_baud_rate/add_154/U221  ( .A1(\uut_baud_rate/n41 ), .A2(
        \uut_baud_rate/n50 ), .A3(\uut_baud_rate/n47 ), .A4(
        \uut_baud_rate/n45 ), .ZN(\uut_baud_rate/add_154/n121 ) );
  NAND3_X1 \uut_baud_rate/add_154/U220  ( .A1(\uut_baud_rate/n37 ), .A2(
        \uut_baud_rate/n31 ), .A3(\uut_baud_rate/n39 ), .ZN(
        \uut_baud_rate/add_154/n122 ) );
  NOR2_X1 \uut_baud_rate/add_154/U219  ( .A1(\uut_baud_rate/add_154/n121 ), 
        .A2(\uut_baud_rate/add_154/n122 ), .ZN(\uut_baud_rate/add_154/n111 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U218  ( .A1(\uut_baud_rate/n54 ), .A2(
        \uut_baud_rate/n56 ), .A3(\uut_baud_rate/n62 ), .A4(
        \uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_154/n119 ) );
  NAND3_X1 \uut_baud_rate/add_154/U217  ( .A1(\uut_baud_rate/n60 ), .A2(
        \uut_baud_rate/n52 ), .A3(\uut_baud_rate/n58 ), .ZN(
        \uut_baud_rate/add_154/n120 ) );
  NOR2_X1 \uut_baud_rate/add_154/U216  ( .A1(\uut_baud_rate/add_154/n119 ), 
        .A2(\uut_baud_rate/add_154/n120 ), .ZN(\uut_baud_rate/add_154/n112 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U215  ( .A1(\uut_baud_rate/n64 ), .A2(
        \uut_baud_rate/add_154/n47 ), .A3(\uut_baud_rate/add_154/n28 ), .A4(
        \uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n117 ) );
  NAND3_X1 \uut_baud_rate/add_154/U214  ( .A1(\uut_baud_rate/n4 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n43 ), .ZN(
        \uut_baud_rate/add_154/n118 ) );
  NOR2_X1 \uut_baud_rate/add_154/U213  ( .A1(\uut_baud_rate/add_154/n117 ), 
        .A2(\uut_baud_rate/add_154/n118 ), .ZN(\uut_baud_rate/add_154/n113 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U212  ( .A1(\uut_baud_rate/add_154/n23 ), 
        .A2(\uut_baud_rate/add_154/n21 ), .A3(\uut_baud_rate/add_154/n30 ), 
        .A4(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n115 ) );
  NAND3_X1 \uut_baud_rate/add_154/U211  ( .A1(\uut_baud_rate/add_154/n36 ), 
        .A2(\uut_baud_rate/add_154/n43 ), .A3(\uut_baud_rate/add_154/n25 ), 
        .ZN(\uut_baud_rate/add_154/n116 ) );
  NOR2_X1 \uut_baud_rate/add_154/U210  ( .A1(\uut_baud_rate/add_154/n115 ), 
        .A2(\uut_baud_rate/add_154/n116 ), .ZN(\uut_baud_rate/add_154/n114 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U209  ( .A1(\uut_baud_rate/add_154/n111 ), 
        .A2(\uut_baud_rate/add_154/n112 ), .A3(\uut_baud_rate/add_154/n113 ), 
        .A4(\uut_baud_rate/add_154/n114 ), .ZN(\uut_baud_rate/add_154/n110 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U208  ( .A(\uut_baud_rate/add_154/n110 ), 
        .B(\uut_baud_rate/baud_count [28]), .ZN(\uut_baud_rate/N41 ) );
  NAND4_X1 \uut_baud_rate/add_154/U207  ( .A1(\uut_baud_rate/n39 ), .A2(
        \uut_baud_rate/n41 ), .A3(\uut_baud_rate/n50 ), .A4(
        \uut_baud_rate/n47 ), .ZN(\uut_baud_rate/add_154/n108 ) );
  NAND3_X1 \uut_baud_rate/add_154/U206  ( .A1(\uut_baud_rate/n31 ), .A2(
        \uut_baud_rate/baud_count [28]), .A3(\uut_baud_rate/n37 ), .ZN(
        \uut_baud_rate/add_154/n109 ) );
  NOR2_X1 \uut_baud_rate/add_154/U205  ( .A1(\uut_baud_rate/add_154/n108 ), 
        .A2(\uut_baud_rate/add_154/n109 ), .ZN(\uut_baud_rate/add_154/n98 ) );
  NAND4_X1 \uut_baud_rate/add_154/U204  ( .A1(\uut_baud_rate/n58 ), .A2(
        \uut_baud_rate/n54 ), .A3(\uut_baud_rate/n56 ), .A4(
        \uut_baud_rate/n62 ), .ZN(\uut_baud_rate/add_154/n106 ) );
  NAND3_X1 \uut_baud_rate/add_154/U203  ( .A1(\uut_baud_rate/n52 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n60 ), .ZN(
        \uut_baud_rate/add_154/n107 ) );
  NOR2_X1 \uut_baud_rate/add_154/U202  ( .A1(\uut_baud_rate/add_154/n106 ), 
        .A2(\uut_baud_rate/add_154/n107 ), .ZN(\uut_baud_rate/add_154/n99 ) );
  NAND4_X1 \uut_baud_rate/add_154/U201  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n64 ), .A3(\uut_baud_rate/add_154/n46 ), .A4(
        \uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n104 ) );
  NAND3_X1 \uut_baud_rate/add_154/U200  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n4 ), .ZN(
        \uut_baud_rate/add_154/n105 ) );
  NOR2_X1 \uut_baud_rate/add_154/U199  ( .A1(\uut_baud_rate/add_154/n104 ), 
        .A2(\uut_baud_rate/add_154/n105 ), .ZN(\uut_baud_rate/add_154/n100 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U198  ( .A1(\uut_baud_rate/add_154/n23 ), 
        .A2(\uut_baud_rate/add_154/n8 ), .A3(\uut_baud_rate/add_154/n30 ), 
        .A4(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n102 ) );
  NAND4_X1 \uut_baud_rate/add_154/U197  ( .A1(\uut_baud_rate/add_154/n27 ), 
        .A2(\uut_baud_rate/add_154/n43 ), .A3(\uut_baud_rate/add_154/n37 ), 
        .A4(\uut_baud_rate/add_154/n24 ), .ZN(\uut_baud_rate/add_154/n103 ) );
  NOR2_X1 \uut_baud_rate/add_154/U196  ( .A1(\uut_baud_rate/add_154/n102 ), 
        .A2(\uut_baud_rate/add_154/n103 ), .ZN(\uut_baud_rate/add_154/n101 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U195  ( .A1(\uut_baud_rate/add_154/n98 ), 
        .A2(\uut_baud_rate/add_154/n99 ), .A3(\uut_baud_rate/add_154/n100 ), 
        .A4(\uut_baud_rate/add_154/n101 ), .ZN(\uut_baud_rate/add_154/n97 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U194  ( .A(\uut_baud_rate/add_154/n97 ), .B(
        \uut_baud_rate/baud_count [29]), .ZN(\uut_baud_rate/N42 ) );
  NAND4_X1 \uut_baud_rate/add_154/U193  ( .A1(\uut_baud_rate/n37 ), .A2(
        \uut_baud_rate/n39 ), .A3(\uut_baud_rate/n41 ), .A4(
        \uut_baud_rate/n50 ), .ZN(\uut_baud_rate/add_154/n95 ) );
  NAND3_X1 \uut_baud_rate/add_154/U192  ( .A1(\uut_baud_rate/baud_count [28]), 
        .A2(\uut_baud_rate/baud_count [29]), .A3(\uut_baud_rate/n31 ), .ZN(
        \uut_baud_rate/add_154/n96 ) );
  NOR2_X1 \uut_baud_rate/add_154/U191  ( .A1(\uut_baud_rate/add_154/n95 ), 
        .A2(\uut_baud_rate/add_154/n96 ), .ZN(\uut_baud_rate/add_154/n86 ) );
  NAND4_X1 \uut_baud_rate/add_154/U190  ( .A1(\uut_baud_rate/n58 ), .A2(
        \uut_baud_rate/n54 ), .A3(\uut_baud_rate/n56 ), .A4(
        \uut_baud_rate/n62 ), .ZN(\uut_baud_rate/add_154/n93 ) );
  NAND4_X1 \uut_baud_rate/add_154/U189  ( .A1(\uut_baud_rate/n47 ), .A2(
        \uut_baud_rate/n45 ), .A3(\uut_baud_rate/n52 ), .A4(
        \uut_baud_rate/n60 ), .ZN(\uut_baud_rate/add_154/n94 ) );
  NOR2_X1 \uut_baud_rate/add_154/U188  ( .A1(\uut_baud_rate/add_154/n93 ), 
        .A2(\uut_baud_rate/add_154/n94 ), .ZN(\uut_baud_rate/add_154/n87 ) );
  NAND4_X1 \uut_baud_rate/add_154/U187  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n64 ), .A3(\uut_baud_rate/add_154/n46 ), .A4(
        \uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n91 ) );
  NAND3_X1 \uut_baud_rate/add_154/U186  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n4 ), .ZN(
        \uut_baud_rate/add_154/n92 ) );
  NOR2_X1 \uut_baud_rate/add_154/U185  ( .A1(\uut_baud_rate/add_154/n91 ), 
        .A2(\uut_baud_rate/add_154/n92 ), .ZN(\uut_baud_rate/add_154/n88 ) );
  NAND4_X1 \uut_baud_rate/add_154/U184  ( .A1(\uut_baud_rate/add_154/n27 ), 
        .A2(\uut_baud_rate/add_154/n43 ), .A3(\uut_baud_rate/add_154/n3 ), 
        .A4(\uut_baud_rate/add_154/n24 ), .ZN(\uut_baud_rate/add_154/n90 ) );
  NOR2_X1 \uut_baud_rate/add_154/U183  ( .A1(\uut_baud_rate/add_154/n102 ), 
        .A2(\uut_baud_rate/add_154/n90 ), .ZN(\uut_baud_rate/add_154/n89 ) );
  NAND4_X1 \uut_baud_rate/add_154/U182  ( .A1(\uut_baud_rate/add_154/n86 ), 
        .A2(\uut_baud_rate/add_154/n87 ), .A3(\uut_baud_rate/add_154/n88 ), 
        .A4(\uut_baud_rate/add_154/n89 ), .ZN(\uut_baud_rate/add_154/n85 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U181  ( .A(\uut_baud_rate/add_154/n85 ), .B(
        \uut_baud_rate/baud_count [30]), .ZN(\uut_baud_rate/N43 ) );
  NAND4_X1 \uut_baud_rate/add_154/U180  ( .A1(\uut_baud_rate/n31 ), .A2(
        \uut_baud_rate/n37 ), .A3(\uut_baud_rate/n39 ), .A4(
        \uut_baud_rate/n41 ), .ZN(\uut_baud_rate/add_154/n83 ) );
  NAND3_X1 \uut_baud_rate/add_154/U179  ( .A1(\uut_baud_rate/baud_count [29]), 
        .A2(\uut_baud_rate/baud_count [30]), .A3(
        \uut_baud_rate/baud_count [28]), .ZN(\uut_baud_rate/add_154/n84 ) );
  NOR2_X1 \uut_baud_rate/add_154/U178  ( .A1(\uut_baud_rate/add_154/n83 ), 
        .A2(\uut_baud_rate/add_154/n84 ), .ZN(\uut_baud_rate/add_154/n74 ) );
  NAND4_X1 \uut_baud_rate/add_154/U177  ( .A1(\uut_baud_rate/n60 ), .A2(
        \uut_baud_rate/n58 ), .A3(\uut_baud_rate/n54 ), .A4(
        \uut_baud_rate/n56 ), .ZN(\uut_baud_rate/add_154/n81 ) );
  NAND4_X1 \uut_baud_rate/add_154/U176  ( .A1(\uut_baud_rate/n50 ), .A2(
        \uut_baud_rate/n47 ), .A3(\uut_baud_rate/n45 ), .A4(
        \uut_baud_rate/n52 ), .ZN(\uut_baud_rate/add_154/n82 ) );
  NOR2_X1 \uut_baud_rate/add_154/U175  ( .A1(\uut_baud_rate/add_154/n81 ), 
        .A2(\uut_baud_rate/add_154/n82 ), .ZN(\uut_baud_rate/add_154/n75 ) );
  NAND4_X1 \uut_baud_rate/add_154/U174  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n64 ), .A3(\uut_baud_rate/add_154/n46 ), .A4(
        \uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n79 ) );
  NAND4_X1 \uut_baud_rate/add_154/U173  ( .A1(\uut_baud_rate/n62 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n71 ), .A4(\uut_baud_rate/n4 ), .ZN(\uut_baud_rate/add_154/n80 ) );
  NOR2_X1 \uut_baud_rate/add_154/U172  ( .A1(\uut_baud_rate/add_154/n79 ), 
        .A2(\uut_baud_rate/add_154/n80 ), .ZN(\uut_baud_rate/add_154/n76 ) );
  NAND4_X1 \uut_baud_rate/add_154/U171  ( .A1(\uut_baud_rate/add_154/n27 ), 
        .A2(\uut_baud_rate/add_154/n43 ), .A3(\uut_baud_rate/add_154/n36 ), 
        .A4(\uut_baud_rate/add_154/n24 ), .ZN(\uut_baud_rate/add_154/n78 ) );
  NOR2_X1 \uut_baud_rate/add_154/U170  ( .A1(\uut_baud_rate/add_154/n102 ), 
        .A2(\uut_baud_rate/add_154/n78 ), .ZN(\uut_baud_rate/add_154/n77 ) );
  NAND4_X1 \uut_baud_rate/add_154/U169  ( .A1(\uut_baud_rate/add_154/n74 ), 
        .A2(\uut_baud_rate/add_154/n75 ), .A3(\uut_baud_rate/add_154/n76 ), 
        .A4(\uut_baud_rate/add_154/n77 ), .ZN(\uut_baud_rate/add_154/n73 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U168  ( .A(\uut_baud_rate/add_154/n73 ), .B(
        \uut_baud_rate/baud_count [31]), .ZN(\uut_baud_rate/N44 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U167  ( .A(\uut_baud_rate/add_154/n152 ), 
        .B(\uut_baud_rate/add_154/n24 ), .ZN(\uut_baud_rate/N17 ) );
  NAND2_X1 \uut_baud_rate/add_154/U166  ( .A1(\uut_baud_rate/add_154/n5 ), 
        .A2(\uut_baud_rate/add_154/n22 ), .ZN(\uut_baud_rate/add_154/n69 ) );
  NAND3_X1 \uut_baud_rate/add_154/U165  ( .A1(\uut_baud_rate/add_154/n31 ), 
        .A2(\uut_baud_rate/add_154/n21 ), .A3(\uut_baud_rate/add_154/n20 ), 
        .ZN(\uut_baud_rate/add_154/n66 ) );
  NAND3_X1 \uut_baud_rate/add_154/U164  ( .A1(\uut_baud_rate/add_154/n25 ), 
        .A2(\uut_baud_rate/add_154/n3 ), .A3(\uut_baud_rate/add_154/n23 ), 
        .ZN(\uut_baud_rate/add_154/n67 ) );
  NAND2_X1 \uut_baud_rate/add_154/U163  ( .A1(\uut_baud_rate/add_154/n6 ), 
        .A2(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n64 ) );
  NAND2_X1 \uut_baud_rate/add_154/U162  ( .A1(\uut_baud_rate/add_154/n62 ), 
        .A2(\uut_baud_rate/add_154/n63 ), .ZN(\uut_baud_rate/add_154/n61 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U161  ( .A(\uut_baud_rate/add_154/n61 ), .B(
        \uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/N20 ) );
  NAND2_X1 \uut_baud_rate/add_154/U160  ( .A1(\uut_baud_rate/add_154/n4 ), 
        .A2(\uut_baud_rate/add_154/n24 ), .ZN(\uut_baud_rate/add_154/n59 ) );
  NAND2_X1 \uut_baud_rate/add_154/U159  ( .A1(\uut_baud_rate/add_154/n27 ), 
        .A2(\uut_baud_rate/add_154/n18 ), .ZN(\uut_baud_rate/add_154/n60 ) );
  NAND2_X1 \uut_baud_rate/add_154/U158  ( .A1(\uut_baud_rate/add_154/n31 ), 
        .A2(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n58 ) );
  NAND2_X1 \uut_baud_rate/add_154/U157  ( .A1(\uut_baud_rate/add_154/n56 ), 
        .A2(\uut_baud_rate/add_154/n57 ), .ZN(\uut_baud_rate/add_154/n55 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U156  ( .A(\uut_baud_rate/add_154/n55 ), .B(
        \uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/N21 ) );
  NAND2_X1 \uut_baud_rate/add_154/U155  ( .A1(\uut_baud_rate/add_154/n43 ), 
        .A2(\uut_baud_rate/add_154/n36 ), .ZN(\uut_baud_rate/add_154/n53 ) );
  NAND2_X1 \uut_baud_rate/add_154/U154  ( .A1(\uut_baud_rate/add_154/n28 ), 
        .A2(\uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n54 ) );
  NAND3_X1 \uut_baud_rate/add_154/U153  ( .A1(\uut_baud_rate/add_154/n50 ), 
        .A2(\uut_baud_rate/add_154/n51 ), .A3(\uut_baud_rate/add_154/n52 ), 
        .ZN(\uut_baud_rate/add_154/n49 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U152  ( .A(\uut_baud_rate/add_154/n49 ), .B(
        \uut_baud_rate/add_154/n46 ), .ZN(\uut_baud_rate/N22 ) );
  NAND2_X1 \uut_baud_rate/add_154/U151  ( .A1(\uut_baud_rate/add_154/n222 ), 
        .A2(\uut_baud_rate/add_154/n223 ), .ZN(\uut_baud_rate/add_154/n221 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U150  ( .A(\uut_baud_rate/add_154/n221 ), 
        .B(\uut_baud_rate/n60 ), .ZN(\uut_baud_rate/N32 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U149  ( .A(\uut_baud_rate/add_154/n185 ), 
        .B(\uut_baud_rate/n47 ), .ZN(\uut_baud_rate/N35 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U148  ( .A(\uut_baud_rate/add_154/n160 ), 
        .B(\uut_baud_rate/n41 ), .ZN(\uut_baud_rate/N37 ) );
  NAND4_X1 \uut_baud_rate/add_154/U147  ( .A1(\uut_baud_rate/add_154/n161 ), 
        .A2(\uut_baud_rate/add_154/n162 ), .A3(\uut_baud_rate/add_154/n163 ), 
        .A4(\uut_baud_rate/add_154/n164 ), .ZN(\uut_baud_rate/add_154/n160 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U146  ( .A1(\uut_baud_rate/add_154/n228 ), 
        .A2(\uut_baud_rate/add_154/n229 ), .ZN(\uut_baud_rate/add_154/n224 )
         );
  INV_X1 \uut_baud_rate/add_154/U145  ( .A(\uut_baud_rate/baud_count [5]), 
        .ZN(\uut_baud_rate/add_154/n41 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U144  ( .A(\uut_baud_rate/add_154/n197 ), 
        .B(\uut_baud_rate/n45 ), .ZN(\uut_baud_rate/N34 ) );
  INV_X1 \uut_baud_rate/add_154/U143  ( .A(\uut_baud_rate/n14 ), .ZN(
        \uut_baud_rate/N13 ) );
  NAND2_X1 \uut_baud_rate/add_154/U142  ( .A1(\uut_baud_rate/add_154/n6 ), 
        .A2(\uut_baud_rate/add_154/n19 ), .ZN(\uut_baud_rate/add_154/n72 ) );
  INV_X1 \uut_baud_rate/add_154/U141  ( .A(\uut_baud_rate/add_154/n72 ), .ZN(
        \uut_baud_rate/add_154/n71 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U140  ( .A(\uut_baud_rate/add_154/n72 ), .B(
        \uut_baud_rate/add_154/n21 ), .ZN(\uut_baud_rate/N15 ) );
  INV_X1 \uut_baud_rate/add_154/U139  ( .A(\uut_baud_rate/baud_count [6]), 
        .ZN(\uut_baud_rate/add_154/n44 ) );
  INV_X1 \uut_baud_rate/add_154/U138  ( .A(\uut_baud_rate/N13 ), .ZN(
        \uut_baud_rate/add_154/n32 ) );
  NAND4_X1 \uut_baud_rate/add_154/U137  ( .A1(\uut_baud_rate/add_154/n173 ), 
        .A2(\uut_baud_rate/add_154/n174 ), .A3(\uut_baud_rate/add_154/n175 ), 
        .A4(\uut_baud_rate/add_154/n176 ), .ZN(\uut_baud_rate/add_154/n172 )
         );
  XNOR2_X1 \uut_baud_rate/add_154/U136  ( .A(\uut_baud_rate/add_154/n172 ), 
        .B(\uut_baud_rate/n50 ), .ZN(\uut_baud_rate/N36 ) );
  BUF_X2 \uut_baud_rate/add_154/U135  ( .A(\uut_baud_rate/add_154/n41 ), .Z(
        \uut_baud_rate/add_154/n39 ) );
  INV_X1 \uut_baud_rate/add_154/U134  ( .A(\uut_baud_rate/add_154/n39 ), .ZN(
        \uut_baud_rate/add_154/n38 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U133  ( .A(\uut_baud_rate/add_154/n44 ), .B(
        \uut_baud_rate/add_154/n65 ), .ZN(\uut_baud_rate/N19 ) );
  AND3_X1 \uut_baud_rate/add_154/U132  ( .A1(\uut_baud_rate/n4 ), .A2(
        \uut_baud_rate/n71 ), .A3(\uut_baud_rate/n43 ), .ZN(
        \uut_baud_rate/add_154/n271 ) );
  AND3_X1 \uut_baud_rate/add_154/U131  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n4 ), .A3(\uut_baud_rate/n64 ), .ZN(
        \uut_baud_rate/add_154/n280 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U130  ( .A(\uut_baud_rate/add_154/n291 ), 
        .B(\uut_baud_rate/n43 ), .ZN(\uut_baud_rate/N24 ) );
  NOR2_X1 \uut_baud_rate/add_154/U129  ( .A1(\uut_baud_rate/add_154/n289 ), 
        .A2(\uut_baud_rate/add_154/n290 ), .ZN(\uut_baud_rate/add_154/n286 )
         );
  BUF_X1 \uut_baud_rate/add_154/U128  ( .A(\uut_baud_rate/baud_count [9]), .Z(
        \uut_baud_rate/add_154/n48 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U127  ( .A(\uut_baud_rate/add_154/n48 ), 
        .Z(\uut_baud_rate/add_154/n46 ) );
  NAND2_X1 \uut_baud_rate/add_154/U126  ( .A1(\uut_baud_rate/n4 ), .A2(
        \uut_baud_rate/n71 ), .ZN(\uut_baud_rate/add_154/n207 ) );
  AND3_X1 \uut_baud_rate/add_154/U125  ( .A1(\uut_baud_rate/n71 ), .A2(
        \uut_baud_rate/n67 ), .A3(\uut_baud_rate/n4 ), .ZN(
        \uut_baud_rate/add_154/n261 ) );
  NAND2_X1 \uut_baud_rate/add_154/U124  ( .A1(\uut_baud_rate/n54 ), .A2(
        \uut_baud_rate/n58 ), .ZN(\uut_baud_rate/add_154/n209 ) );
  NAND2_X1 \uut_baud_rate/add_154/U123  ( .A1(\uut_baud_rate/n58 ), .A2(
        \uut_baud_rate/n60 ), .ZN(\uut_baud_rate/add_154/n196 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U122  ( .A(\uut_baud_rate/add_154/n285 ), 
        .B(\uut_baud_rate/n4 ), .ZN(\uut_baud_rate/N25 ) );
  NAND2_X1 \uut_baud_rate/add_154/U121  ( .A1(\uut_baud_rate/n60 ), .A2(
        \uut_baud_rate/n52 ), .ZN(\uut_baud_rate/add_154/n184 ) );
  NOR2_X1 \uut_baud_rate/add_154/U120  ( .A1(\uut_baud_rate/add_154/n226 ), 
        .A2(\uut_baud_rate/add_154/n227 ), .ZN(\uut_baud_rate/add_154/n225 )
         );
  AND3_X1 \uut_baud_rate/add_154/U119  ( .A1(\uut_baud_rate/add_154/n25 ), 
        .A2(\uut_baud_rate/add_154/n23 ), .A3(\uut_baud_rate/add_154/n20 ), 
        .ZN(\uut_baud_rate/add_154/n52 ) );
  NAND4_X1 \uut_baud_rate/add_154/U118  ( .A1(\uut_baud_rate/add_154/n186 ), 
        .A2(\uut_baud_rate/add_154/n187 ), .A3(\uut_baud_rate/add_154/n188 ), 
        .A4(\uut_baud_rate/add_154/n189 ), .ZN(\uut_baud_rate/add_154/n185 )
         );
  AND2_X1 \uut_baud_rate/add_154/U117  ( .A1(\uut_baud_rate/add_154/n224 ), 
        .A2(\uut_baud_rate/add_154/n225 ), .ZN(\uut_baud_rate/add_154/n223 )
         );
  CLKBUF_X3 \uut_baud_rate/add_154/U116  ( .A(\uut_baud_rate/n14 ), .Z(
        \uut_baud_rate/add_154/n19 ) );
  CLKBUF_X1 \uut_baud_rate/add_154/U115  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_154/n22 ) );
  CLKBUF_X1 \uut_baud_rate/add_154/U114  ( .A(\uut_baud_rate/add_154/n45 ), 
        .Z(\uut_baud_rate/add_154/n29 ) );
  CLKBUF_X1 \uut_baud_rate/add_154/U113  ( .A(\uut_baud_rate/n35 ), .Z(
        \uut_baud_rate/add_154/n27 ) );
  INV_X1 \uut_baud_rate/add_154/U112  ( .A(\uut_baud_rate/add_154/n44 ), .ZN(
        \uut_baud_rate/add_154/n42 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U111  ( .A(\uut_baud_rate/add_154/n42 ), 
        .Z(\uut_baud_rate/add_154/n18 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U110  ( .A(\uut_baud_rate/add_154/n297 ), 
        .B(\uut_baud_rate/n64 ), .ZN(\uut_baud_rate/N23 ) );
  NOR2_X1 \uut_baud_rate/add_154/U109  ( .A1(\uut_baud_rate/add_154/n156 ), 
        .A2(\uut_baud_rate/add_154/n157 ), .ZN(\uut_baud_rate/add_154/n149 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U108  ( .A1(\uut_baud_rate/add_154/n193 ), 
        .A2(\uut_baud_rate/add_154/n194 ), .ZN(\uut_baud_rate/add_154/n187 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U107  ( .A1(\uut_baud_rate/add_154/n168 ), 
        .A2(\uut_baud_rate/add_154/n169 ), .ZN(\uut_baud_rate/add_154/n162 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U106  ( .A1(\uut_baud_rate/add_154/n181 ), 
        .A2(\uut_baud_rate/add_154/n182 ), .ZN(\uut_baud_rate/add_154/n174 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U105  ( .A1(\uut_baud_rate/add_154/n217 ), 
        .A2(\uut_baud_rate/add_154/n218 ), .ZN(\uut_baud_rate/add_154/n212 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U104  ( .A1(\uut_baud_rate/n64 ), .A2(
        \uut_baud_rate/n43 ), .ZN(\uut_baud_rate/add_154/n16 ) );
  NAND2_X1 \uut_baud_rate/add_154/U103  ( .A1(\uut_baud_rate/n62 ), .A2(
        \uut_baud_rate/n67 ), .ZN(\uut_baud_rate/add_154/n15 ) );
  NAND2_X1 \uut_baud_rate/add_154/U102  ( .A1(\uut_baud_rate/n54 ), .A2(
        \uut_baud_rate/n56 ), .ZN(\uut_baud_rate/add_154/n14 ) );
  OR3_X1 \uut_baud_rate/add_154/U101  ( .A1(\uut_baud_rate/add_154/n14 ), .A2(
        \uut_baud_rate/add_154/n15 ), .A3(\uut_baud_rate/add_154/n16 ), .ZN(
        \uut_baud_rate/add_154/n239 ) );
  NOR2_X1 \uut_baud_rate/add_154/U100  ( .A1(\uut_baud_rate/add_154/n268 ), 
        .A2(\uut_baud_rate/add_154/n269 ), .ZN(\uut_baud_rate/add_154/n262 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U99  ( .A1(\uut_baud_rate/add_154/n256 ), 
        .A2(\uut_baud_rate/add_154/n257 ), .ZN(\uut_baud_rate/add_154/n250 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U98  ( .A1(\uut_baud_rate/add_154/n277 ), 
        .A2(\uut_baud_rate/add_154/n278 ), .ZN(\uut_baud_rate/add_154/n272 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U97  ( .A1(\uut_baud_rate/add_154/n206 ), 
        .A2(\uut_baud_rate/add_154/n207 ), .ZN(\uut_baud_rate/add_154/n199 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U96  ( .A1(\uut_baud_rate/add_154/n141 ), 
        .A2(\uut_baud_rate/add_154/n142 ), .ZN(\uut_baud_rate/add_154/n138 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U95  ( .A1(\uut_baud_rate/add_154/n154 ), 
        .A2(\uut_baud_rate/add_154/n155 ), .ZN(\uut_baud_rate/add_154/n150 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U94  ( .A1(\uut_baud_rate/n43 ), .A2(
        \uut_baud_rate/n4 ), .ZN(\uut_baud_rate/add_154/n13 ) );
  NAND2_X1 \uut_baud_rate/add_154/U93  ( .A1(\uut_baud_rate/n56 ), .A2(
        \uut_baud_rate/n62 ), .ZN(\uut_baud_rate/add_154/n12 ) );
  NAND2_X1 \uut_baud_rate/add_154/U92  ( .A1(\uut_baud_rate/n58 ), .A2(
        \uut_baud_rate/n54 ), .ZN(\uut_baud_rate/add_154/n11 ) );
  OR3_X1 \uut_baud_rate/add_154/U91  ( .A1(\uut_baud_rate/add_154/n11 ), .A2(
        \uut_baud_rate/add_154/n12 ), .A3(\uut_baud_rate/add_154/n13 ), .ZN(
        \uut_baud_rate/add_154/n230 ) );
  BUF_X1 \uut_baud_rate/add_154/U90  ( .A(\uut_baud_rate/baud_count [8]), .Z(
        \uut_baud_rate/add_154/n45 ) );
  BUF_X1 \uut_baud_rate/add_154/U89  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_154/n34 ) );
  NOR2_X1 \uut_baud_rate/add_154/U88  ( .A1(\uut_baud_rate/add_154/n179 ), 
        .A2(\uut_baud_rate/add_154/n180 ), .ZN(\uut_baud_rate/add_154/n175 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U87  ( .A1(\uut_baud_rate/add_154/n26 ), 
        .A2(\uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n296 ) );
  NOR2_X1 \uut_baud_rate/add_154/U86  ( .A1(\uut_baud_rate/add_154/n295 ), 
        .A2(\uut_baud_rate/add_154/n296 ), .ZN(\uut_baud_rate/add_154/n292 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U85  ( .A1(\uut_baud_rate/add_154/n26 ), 
        .A2(\uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n205 ) );
  NOR2_X1 \uut_baud_rate/add_154/U84  ( .A1(\uut_baud_rate/add_154/n204 ), 
        .A2(\uut_baud_rate/add_154/n205 ), .ZN(\uut_baud_rate/add_154/n200 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U83  ( .A1(\uut_baud_rate/add_154/n166 ), 
        .A2(\uut_baud_rate/add_154/n167 ), .ZN(\uut_baud_rate/add_154/n163 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U82  ( .A1(\uut_baud_rate/add_154/n26 ), 
        .A2(\uut_baud_rate/add_154/n28 ), .ZN(\uut_baud_rate/add_154/n192 ) );
  NOR2_X1 \uut_baud_rate/add_154/U81  ( .A1(\uut_baud_rate/add_154/n191 ), 
        .A2(\uut_baud_rate/add_154/n192 ), .ZN(\uut_baud_rate/add_154/n188 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U80  ( .A1(\uut_baud_rate/add_154/n208 ), 
        .A2(\uut_baud_rate/add_154/n209 ), .ZN(\uut_baud_rate/add_154/n198 )
         );
  NAND4_X1 \uut_baud_rate/add_154/U79  ( .A1(\uut_baud_rate/add_154/n198 ), 
        .A2(\uut_baud_rate/add_154/n199 ), .A3(\uut_baud_rate/add_154/n200 ), 
        .A4(\uut_baud_rate/add_154/n201 ), .ZN(\uut_baud_rate/add_154/n197 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U78  ( .A1(\uut_baud_rate/add_154/n258 ), 
        .A2(\uut_baud_rate/add_154/n259 ), .ZN(\uut_baud_rate/add_154/n249 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U77  ( .A1(\uut_baud_rate/add_154/n230 ), 
        .A2(\uut_baud_rate/add_154/n231 ), .ZN(\uut_baud_rate/add_154/n222 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U76  ( .A1(\uut_baud_rate/add_154/n170 ), 
        .A2(\uut_baud_rate/add_154/n171 ), .ZN(\uut_baud_rate/add_154/n161 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U75  ( .A1(\uut_baud_rate/add_154/n195 ), 
        .A2(\uut_baud_rate/add_154/n196 ), .ZN(\uut_baud_rate/add_154/n186 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U74  ( .A1(\uut_baud_rate/add_154/n219 ), 
        .A2(\uut_baud_rate/add_154/n220 ), .ZN(\uut_baud_rate/add_154/n211 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U73  ( .A1(\uut_baud_rate/add_154/n239 ), 
        .A2(\uut_baud_rate/add_154/n240 ), .ZN(\uut_baud_rate/add_154/n233 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U72  ( .A1(\uut_baud_rate/add_154/n300 ), 
        .A2(\uut_baud_rate/add_154/n301 ), .ZN(\uut_baud_rate/add_154/n299 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U71  ( .A1(\uut_baud_rate/add_154/n298 ), 
        .A2(\uut_baud_rate/add_154/n299 ), .ZN(\uut_baud_rate/add_154/n297 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U70  ( .A1(\uut_baud_rate/add_154/n183 ), 
        .A2(\uut_baud_rate/add_154/n184 ), .ZN(\uut_baud_rate/add_154/n173 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U69  ( .A1(\uut_baud_rate/add_154/n294 ), 
        .A2(\uut_baud_rate/add_154/n203 ), .ZN(\uut_baud_rate/add_154/n293 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U68  ( .A1(\uut_baud_rate/add_154/n292 ), 
        .A2(\uut_baud_rate/add_154/n293 ), .ZN(\uut_baud_rate/add_154/n291 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U67  ( .A1(\uut_baud_rate/add_154/n133 ), 
        .A2(\uut_baud_rate/add_154/n134 ), .ZN(\uut_baud_rate/add_154/n124 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U66  ( .A1(\uut_baud_rate/add_154/n145 ), 
        .A2(\uut_baud_rate/add_154/n146 ), .ZN(\uut_baud_rate/add_154/n136 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U65  ( .A1(\uut_baud_rate/add_154/n158 ), 
        .A2(\uut_baud_rate/add_154/n159 ), .ZN(\uut_baud_rate/add_154/n148 )
         );
  BUF_X2 \uut_baud_rate/add_154/U64  ( .A(\uut_baud_rate/add_154/n48 ), .Z(
        \uut_baud_rate/add_154/n47 ) );
  NOR2_X1 \uut_baud_rate/add_154/U63  ( .A1(\uut_baud_rate/add_154/n288 ), 
        .A2(\uut_baud_rate/add_154/n178 ), .ZN(\uut_baud_rate/add_154/n287 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U62  ( .A1(\uut_baud_rate/add_154/n286 ), 
        .A2(\uut_baud_rate/add_154/n287 ), .ZN(\uut_baud_rate/add_154/n285 )
         );
  AND3_X1 \uut_baud_rate/add_154/U61  ( .A1(\uut_baud_rate/add_154/n28 ), .A2(
        \uut_baud_rate/add_154/n46 ), .A3(\uut_baud_rate/add_154/n26 ), .ZN(
        \uut_baud_rate/add_154/n281 ) );
  NOR2_X1 \uut_baud_rate/add_154/U60  ( .A1(\uut_baud_rate/add_154/n53 ), .A2(
        \uut_baud_rate/add_154/n54 ), .ZN(\uut_baud_rate/add_154/n51 ) );
  AND3_X1 \uut_baud_rate/add_154/U59  ( .A1(\uut_baud_rate/add_154/n38 ), .A2(
        \uut_baud_rate/add_154/n18 ), .A3(\uut_baud_rate/add_154/n24 ), .ZN(
        \uut_baud_rate/add_154/n62 ) );
  NOR2_X1 \uut_baud_rate/add_154/U58  ( .A1(\uut_baud_rate/add_154/n284 ), 
        .A2(\uut_baud_rate/add_154/n276 ), .ZN(\uut_baud_rate/add_154/n283 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U57  ( .A1(\uut_baud_rate/add_154/n265 ), 
        .A2(\uut_baud_rate/add_154/n276 ), .ZN(\uut_baud_rate/add_154/n264 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U56  ( .A1(\uut_baud_rate/add_154/n275 ), 
        .A2(\uut_baud_rate/add_154/n276 ), .ZN(\uut_baud_rate/add_154/n274 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U55  ( .A1(\uut_baud_rate/add_154/n215 ), 
        .A2(\uut_baud_rate/add_154/n216 ), .ZN(\uut_baud_rate/add_154/n213 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U54  ( .A1(\uut_baud_rate/add_154/n253 ), 
        .A2(\uut_baud_rate/add_154/n276 ), .ZN(\uut_baud_rate/add_154/n252 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U53  ( .A1(\uut_baud_rate/add_154/n190 ), 
        .A2(\uut_baud_rate/add_154/n178 ), .ZN(\uut_baud_rate/add_154/n189 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U52  ( .A1(\uut_baud_rate/add_154/n226 ), 
        .A2(\uut_baud_rate/add_154/n301 ), .ZN(\uut_baud_rate/add_154/n214 )
         );
  INV_X1 \uut_baud_rate/add_154/U51  ( .A(\uut_baud_rate/add_154/n44 ), .ZN(
        \uut_baud_rate/add_154/n43 ) );
  NAND2_X1 \uut_baud_rate/add_154/U50  ( .A1(\uut_baud_rate/add_154/n6 ), .A2(
        \uut_baud_rate/add_154/n35 ), .ZN(\uut_baud_rate/add_154/n301 ) );
  NOR2_X1 \uut_baud_rate/add_154/U49  ( .A1(\uut_baud_rate/add_154/n165 ), 
        .A2(\uut_baud_rate/add_154/n203 ), .ZN(\uut_baud_rate/add_154/n164 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U48  ( .A1(\uut_baud_rate/add_154/n177 ), 
        .A2(\uut_baud_rate/add_154/n178 ), .ZN(\uut_baud_rate/add_154/n176 )
         );
  AND3_X1 \uut_baud_rate/add_154/U47  ( .A1(\uut_baud_rate/add_154/n4 ), .A2(
        \uut_baud_rate/add_154/n9 ), .A3(\uut_baud_rate/add_154/n24 ), .ZN(
        \uut_baud_rate/add_154/n282 ) );
  AND3_X1 \uut_baud_rate/add_154/U46  ( .A1(\uut_baud_rate/add_154/n38 ), .A2(
        \uut_baud_rate/add_154/n9 ), .A3(\uut_baud_rate/add_154/n24 ), .ZN(
        \uut_baud_rate/add_154/n273 ) );
  NOR2_X1 \uut_baud_rate/add_154/U45  ( .A1(\uut_baud_rate/add_154/n59 ), .A2(
        \uut_baud_rate/add_154/n60 ), .ZN(\uut_baud_rate/add_154/n56 ) );
  AND2_X1 \uut_baud_rate/add_154/U44  ( .A1(\uut_baud_rate/add_154/n30 ), .A2(
        \uut_baud_rate/add_154/n21 ), .ZN(\uut_baud_rate/add_154/n238 ) );
  NOR2_X1 \uut_baud_rate/add_154/U43  ( .A1(\uut_baud_rate/add_154/n254 ), 
        .A2(\uut_baud_rate/add_154/n255 ), .ZN(\uut_baud_rate/add_154/n251 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U42  ( .A1(\uut_baud_rate/add_154/n202 ), 
        .A2(\uut_baud_rate/add_154/n203 ), .ZN(\uut_baud_rate/add_154/n201 )
         );
  AND2_X1 \uut_baud_rate/add_154/U41  ( .A1(\uut_baud_rate/add_154/n28 ), .A2(
        \uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n236 ) );
  NOR2_X1 \uut_baud_rate/add_154/U40  ( .A1(\uut_baud_rate/add_154/n235 ), 
        .A2(\uut_baud_rate/add_154/n226 ), .ZN(\uut_baud_rate/add_154/n234 )
         );
  NAND2_X1 \uut_baud_rate/add_154/U39  ( .A1(\uut_baud_rate/add_154/n9 ), .A2(
        \uut_baud_rate/add_154/n26 ), .ZN(\uut_baud_rate/add_154/n303 ) );
  NOR2_X1 \uut_baud_rate/add_154/U38  ( .A1(\uut_baud_rate/add_154/n302 ), 
        .A2(\uut_baud_rate/add_154/n303 ), .ZN(\uut_baud_rate/add_154/n298 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U37  ( .A1(\uut_baud_rate/add_154/n266 ), 
        .A2(\uut_baud_rate/add_154/n267 ), .ZN(\uut_baud_rate/add_154/n263 )
         );
  NOR2_X1 \uut_baud_rate/add_154/U36  ( .A1(\uut_baud_rate/add_154/n67 ), .A2(
        \uut_baud_rate/add_154/n66 ), .ZN(\uut_baud_rate/add_154/n65 ) );
  AND2_X1 \uut_baud_rate/add_154/U35  ( .A1(\uut_baud_rate/add_154/n6 ), .A2(
        \uut_baud_rate/add_154/n21 ), .ZN(\uut_baud_rate/add_154/n50 ) );
  NOR2_X1 \uut_baud_rate/add_154/U34  ( .A1(\uut_baud_rate/add_154/n58 ), .A2(
        \uut_baud_rate/add_154/n276 ), .ZN(\uut_baud_rate/add_154/n57 ) );
  NOR2_X1 \uut_baud_rate/add_154/U33  ( .A1(\uut_baud_rate/add_154/n64 ), .A2(
        \uut_baud_rate/add_154/n276 ), .ZN(\uut_baud_rate/add_154/n63 ) );
  NOR2_X1 \uut_baud_rate/add_154/U32  ( .A1(\uut_baud_rate/add_154/n226 ), 
        .A2(\uut_baud_rate/add_154/n69 ), .ZN(\uut_baud_rate/add_154/n68 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U31  ( .A(\uut_baud_rate/add_154/n40 ), .B(
        \uut_baud_rate/add_154/n68 ), .ZN(\uut_baud_rate/N18 ) );
  NAND2_X1 \uut_baud_rate/add_154/U30  ( .A1(\uut_baud_rate/add_154/n8 ), .A2(
        \uut_baud_rate/add_154/n71 ), .ZN(\uut_baud_rate/add_154/n70 ) );
  XNOR2_X1 \uut_baud_rate/add_154/U29  ( .A(\uut_baud_rate/add_154/n70 ), .B(
        \uut_baud_rate/add_154/n23 ), .ZN(\uut_baud_rate/N16 ) );
  XOR2_X1 \uut_baud_rate/add_154/U28  ( .A(\uut_baud_rate/add_154/n31 ), .B(
        \uut_baud_rate/add_154/n19 ), .Z(\uut_baud_rate/N14 ) );
  AND2_X1 \uut_baud_rate/add_154/U27  ( .A1(\uut_baud_rate/add_154/n17 ), .A2(
        \uut_baud_rate/add_154/n38 ), .ZN(\uut_baud_rate/add_154/n237 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U26  ( .A(\uut_baud_rate/n12 ), .Z(
        \uut_baud_rate/add_154/n24 ) );
  BUF_X4 \uut_baud_rate/add_154/U25  ( .A(\uut_baud_rate/baud_count [3]), .Z(
        \uut_baud_rate/add_154/n23 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U24  ( .A(\uut_baud_rate/add_154/n45 ), .Z(
        \uut_baud_rate/add_154/n28 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U23  ( .A(\uut_baud_rate/n33 ), .Z(
        \uut_baud_rate/add_154/n30 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U22  ( .A(\uut_baud_rate/n35 ), .Z(
        \uut_baud_rate/add_154/n26 ) );
  BUF_X2 \uut_baud_rate/add_154/U21  ( .A(\uut_baud_rate/add_154/n42 ), .Z(
        \uut_baud_rate/add_154/n17 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U20  ( .A(\uut_baud_rate/add_154/n42 ), .Z(
        \uut_baud_rate/add_154/n9 ) );
  NAND4_X1 \uut_baud_rate/add_154/U19  ( .A1(\uut_baud_rate/add_154/n137 ), 
        .A2(\uut_baud_rate/add_154/n139 ), .A3(\uut_baud_rate/add_154/n138 ), 
        .A4(\uut_baud_rate/add_154/n136 ), .ZN(\uut_baud_rate/add_154/n135 )
         );
  CLKBUF_X3 \uut_baud_rate/add_154/U18  ( .A(\uut_baud_rate/n14 ), .Z(
        \uut_baud_rate/add_154/n20 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U17  ( .A(\uut_baud_rate/n12 ), .Z(
        \uut_baud_rate/add_154/n25 ) );
  NAND3_X1 \uut_baud_rate/add_154/U16  ( .A1(\uut_baud_rate/add_154/n127 ), 
        .A2(\uut_baud_rate/add_154/n126 ), .A3(\uut_baud_rate/add_154/n2 ), 
        .ZN(\uut_baud_rate/add_154/n123 ) );
  INV_X1 \uut_baud_rate/add_154/U15  ( .A(\uut_baud_rate/add_154/n39 ), .ZN(
        \uut_baud_rate/add_154/n36 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U14  ( .A(\uut_baud_rate/add_154/n34 ), .Z(
        \uut_baud_rate/add_154/n35 ) );
  CLKBUF_X1 \uut_baud_rate/add_154/U13  ( .A(\uut_baud_rate/baud_count [2]), 
        .Z(\uut_baud_rate/add_154/n8 ) );
  INV_X1 \uut_baud_rate/add_154/U12  ( .A(\uut_baud_rate/add_154/n39 ), .ZN(
        \uut_baud_rate/add_154/n37 ) );
  INV_X1 \uut_baud_rate/add_154/U11  ( .A(\uut_baud_rate/add_154/n39 ), .ZN(
        \uut_baud_rate/add_154/n7 ) );
  BUF_X1 \uut_baud_rate/add_154/U10  ( .A(\uut_baud_rate/n33 ), .Z(
        \uut_baud_rate/add_154/n6 ) );
  CLKBUF_X3 \uut_baud_rate/add_154/U9  ( .A(\uut_baud_rate/n33 ), .Z(
        \uut_baud_rate/add_154/n5 ) );
  INV_X1 \uut_baud_rate/add_154/U8  ( .A(\uut_baud_rate/add_154/n39 ), .ZN(
        \uut_baud_rate/add_154/n4 ) );
  INV_X1 \uut_baud_rate/add_154/U7  ( .A(\uut_baud_rate/add_154/n40 ), .ZN(
        \uut_baud_rate/add_154/n3 ) );
  BUF_X2 \uut_baud_rate/add_154/U6  ( .A(\uut_baud_rate/n33 ), .Z(
        \uut_baud_rate/add_154/n31 ) );
  AND2_X1 \uut_baud_rate/add_154/U5  ( .A1(\uut_baud_rate/add_154/n125 ), .A2(
        \uut_baud_rate/add_154/n124 ), .ZN(\uut_baud_rate/add_154/n2 ) );
  BUF_X2 \uut_baud_rate/add_154/U4  ( .A(\uut_baud_rate/baud_count [2]), .Z(
        \uut_baud_rate/add_154/n21 ) );
  BUF_X1 \uut_baud_rate/add_154/U3  ( .A(\uut_baud_rate/add_154/n41 ), .Z(
        \uut_baud_rate/add_154/n40 ) );
  INV_X1 \uut_baud_rate/add_154/U2  ( .A(\uut_baud_rate/add_154/n40 ), .ZN(
        \uut_baud_rate/add_154/n1 ) );
  NAND4_X1 \uut_baud_rate/eq_136/U66  ( .A1(\uut_baud_rate/eq_136/n19 ), .A2(
        \uut_baud_rate/eq_136/n17 ), .A3(\uut_baud_rate/eq_136/n18 ), .A4(
        \uut_baud_rate/eq_136/n16 ), .ZN(\uut_baud_rate/eq_136/n15 ) );
  NOR2_X1 \uut_baud_rate/eq_136/U65  ( .A1(\uut_baud_rate/eq_136/n15 ), .A2(
        \uut_baud_rate/eq_136/n14 ), .ZN(\uut_baud_rate/tc_reached ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U64  ( .A(\uut_baud_rate/baud_count [6]), .B(
        baud_division[6]), .ZN(\uut_baud_rate/eq_136/n53 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U63  ( .A(\uut_baud_rate/n16 ), .B(
        baud_division[5]), .ZN(\uut_baud_rate/eq_136/n54 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U62  ( .A(\uut_baud_rate/n29 ), .B(
        baud_division[3]), .ZN(\uut_baud_rate/eq_136/n48 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U61  ( .A(baud_division[2]), .B(
        \uut_baud_rate/n6 ), .ZN(\uut_baud_rate/eq_136/n50 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U60  ( .A(baud_division[8]), .B(
        \uut_baud_rate/baud_count [8]), .ZN(\uut_baud_rate/eq_136/n59 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U59  ( .A(\uut_baud_rate/baud_count [4]), .B(
        baud_division[4]), .ZN(\uut_baud_rate/eq_136/n55 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U58  ( .A(\uut_baud_rate/baud_count [7]), .B(
        baud_division[7]), .ZN(\uut_baud_rate/eq_136/n52 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U57  ( .A(baud_division[12]), .B(
        \uut_baud_rate/baud_count [12]), .ZN(\uut_baud_rate/eq_136/n65 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U56  ( .A1(\uut_baud_rate/eq_136/n64 ), .A2(
        \uut_baud_rate/eq_136/n65 ), .ZN(\uut_baud_rate/eq_136/n60 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U55  ( .A1(\uut_baud_rate/eq_136/n62 ), .A2(
        \uut_baud_rate/eq_136/n63 ), .ZN(\uut_baud_rate/eq_136/n61 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U54  ( .A(baud_division[13]), .B(
        \uut_baud_rate/baud_count [13]), .ZN(\uut_baud_rate/eq_136/n64 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U53  ( .A(\uut_baud_rate/baud_count [16]), 
        .B(baud_division[16]), .ZN(\uut_baud_rate/eq_136/n25 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U52  ( .A(baud_division[18]), .B(
        \uut_baud_rate/baud_count [18]), .ZN(\uut_baud_rate/eq_136/n23 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U51  ( .A1(\uut_baud_rate/eq_136/n22 ), .A2(
        \uut_baud_rate/eq_136/n23 ), .ZN(\uut_baud_rate/eq_136/n21 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U50  ( .A(\uut_baud_rate/baud_count [15]), 
        .B(baud_division[15]), .ZN(\uut_baud_rate/eq_136/n62 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U49  ( .A(baud_division[17]), .B(
        \uut_baud_rate/baud_count [17]), .ZN(\uut_baud_rate/eq_136/n24 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U48  ( .A1(\uut_baud_rate/eq_136/n25 ), .A2(
        \uut_baud_rate/eq_136/n24 ), .ZN(\uut_baud_rate/eq_136/n20 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U47  ( .A(baud_division[19]), .B(
        \uut_baud_rate/baud_count [19]), .ZN(\uut_baud_rate/eq_136/n22 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U46  ( .A1(\uut_baud_rate/eq_136/n30 ), .A2(
        \uut_baud_rate/eq_136/n31 ), .ZN(\uut_baud_rate/eq_136/n26 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U45  ( .A(baud_division[20]), .B(
        \uut_baud_rate/baud_count [20]), .ZN(\uut_baud_rate/eq_136/n31 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U44  ( .A(baud_division[22]), .B(
        \uut_baud_rate/baud_count [22]), .ZN(\uut_baud_rate/eq_136/n29 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U43  ( .A(baud_division[23]), .B(
        \uut_baud_rate/baud_count [23]), .ZN(\uut_baud_rate/eq_136/n28 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U42  ( .A(baud_division[24]), .B(
        \uut_baud_rate/baud_count [24]), .ZN(\uut_baud_rate/eq_136/n37 ) );
  NOR2_X1 \uut_baud_rate/eq_136/U41  ( .A1(\uut_baud_rate/eq_136/n20 ), .A2(
        \uut_baud_rate/eq_136/n21 ), .ZN(\uut_baud_rate/eq_136/n19 ) );
  NOR2_X1 \uut_baud_rate/eq_136/U40  ( .A1(\uut_baud_rate/eq_136/n26 ), .A2(
        \uut_baud_rate/eq_136/n27 ), .ZN(\uut_baud_rate/eq_136/n18 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U39  ( .A(\uut_baud_rate/baud_count [0]), .B(
        baud_division[0]), .ZN(\uut_baud_rate/eq_136/n51 ) );
  NOR2_X1 \uut_baud_rate/eq_136/U38  ( .A1(\uut_baud_rate/eq_136/n38 ), .A2(
        \uut_baud_rate/eq_136/n39 ), .ZN(\uut_baud_rate/eq_136/n16 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U37  ( .A(baud_division[30]), .B(
        \uut_baud_rate/baud_count [30]), .ZN(\uut_baud_rate/eq_136/n41 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U36  ( .A(baud_division[31]), .B(
        \uut_baud_rate/baud_count [31]), .ZN(\uut_baud_rate/eq_136/n40 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U35  ( .A1(\uut_baud_rate/eq_136/n40 ), .A2(
        \uut_baud_rate/eq_136/n41 ), .ZN(\uut_baud_rate/eq_136/n39 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U34  ( .A(\uut_baud_rate/baud_count [1]), .B(
        baud_division[1]), .ZN(\uut_baud_rate/eq_136/n49 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U33  ( .A(baud_division[28]), .B(
        \uut_baud_rate/n10 ), .ZN(\uut_baud_rate/eq_136/n43 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U32  ( .A(baud_division[29]), .B(
        \uut_baud_rate/baud_count [29]), .ZN(\uut_baud_rate/eq_136/n42 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U31  ( .A1(\uut_baud_rate/eq_136/n42 ), .A2(
        \uut_baud_rate/eq_136/n43 ), .ZN(\uut_baud_rate/eq_136/n38 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U30  ( .A(baud_division[27]), .B(
        \uut_baud_rate/baud_count [27]), .ZN(\uut_baud_rate/eq_136/n34 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U29  ( .A(baud_division[21]), .B(
        \uut_baud_rate/baud_count [21]), .ZN(\uut_baud_rate/eq_136/n30 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U28  ( .A1(\uut_baud_rate/eq_136/n28 ), .A2(
        \uut_baud_rate/eq_136/n29 ), .ZN(\uut_baud_rate/eq_136/n27 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U27  ( .A(baud_division[25]), .B(
        \uut_baud_rate/baud_count [25]), .ZN(\uut_baud_rate/eq_136/n36 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U26  ( .A1(\uut_baud_rate/eq_136/n34 ), .A2(
        \uut_baud_rate/eq_136/n35 ), .ZN(\uut_baud_rate/eq_136/n33 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U25  ( .A1(\uut_baud_rate/eq_136/n36 ), .A2(
        \uut_baud_rate/eq_136/n37 ), .ZN(\uut_baud_rate/eq_136/n32 ) );
  NOR2_X1 \uut_baud_rate/eq_136/U24  ( .A1(\uut_baud_rate/eq_136/n32 ), .A2(
        \uut_baud_rate/eq_136/n33 ), .ZN(\uut_baud_rate/eq_136/n17 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U23  ( .A(baud_division[26]), .B(
        \uut_baud_rate/baud_count [26]), .ZN(\uut_baud_rate/eq_136/n35 ) );
  NOR2_X1 \uut_baud_rate/eq_136/U22  ( .A1(\uut_baud_rate/eq_136/n60 ), .A2(
        \uut_baud_rate/eq_136/n61 ), .ZN(\uut_baud_rate/eq_136/n44 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U21  ( .A1(\uut_baud_rate/eq_136/n58 ), .A2(
        \uut_baud_rate/eq_136/n59 ), .ZN(\uut_baud_rate/eq_136/n56 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U20  ( .A1(\uut_baud_rate/eq_136/n12 ), .A2(
        \uut_baud_rate/eq_136/n13 ), .ZN(\uut_baud_rate/eq_136/n57 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U19  ( .A1(baud_division[11]), .A2(
        \uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/eq_136/n12 ) );
  OR2_X1 \uut_baud_rate/eq_136/U18  ( .A1(baud_division[11]), .A2(
        \uut_baud_rate/baud_count [11]), .ZN(\uut_baud_rate/eq_136/n13 ) );
  INV_X1 \uut_baud_rate/eq_136/U17  ( .A(\uut_baud_rate/baud_count [10]), .ZN(
        \uut_baud_rate/eq_136/n9 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U16  ( .A1(\uut_baud_rate/eq_136/n11 ), .A2(
        \uut_baud_rate/eq_136/n10 ), .ZN(\uut_baud_rate/eq_136/n58 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U15  ( .A1(baud_division[10]), .A2(
        \uut_baud_rate/baud_count [10]), .ZN(\uut_baud_rate/eq_136/n10 ) );
  INV_X1 \uut_baud_rate/eq_136/U14  ( .A(baud_division[10]), .ZN(
        \uut_baud_rate/eq_136/n8 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U13  ( .A1(\uut_baud_rate/eq_136/n9 ), .A2(
        \uut_baud_rate/eq_136/n8 ), .ZN(\uut_baud_rate/eq_136/n11 ) );
  NAND3_X1 \uut_baud_rate/eq_136/U12  ( .A1(\uut_baud_rate/eq_136/n3 ), .A2(
        \uut_baud_rate/eq_136/n44 ), .A3(\uut_baud_rate/eq_136/n45 ), .ZN(
        \uut_baud_rate/eq_136/n14 ) );
  INV_X1 \uut_baud_rate/eq_136/U11  ( .A(\uut_baud_rate/baud_count [14]), .ZN(
        \uut_baud_rate/eq_136/n5 ) );
  INV_X1 \uut_baud_rate/eq_136/U10  ( .A(baud_division[14]), .ZN(
        \uut_baud_rate/eq_136/n4 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U9  ( .A1(\uut_baud_rate/eq_136/n6 ), .A2(
        \uut_baud_rate/eq_136/n7 ), .ZN(\uut_baud_rate/eq_136/n63 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U8  ( .A1(\uut_baud_rate/eq_136/n4 ), .A2(
        \uut_baud_rate/eq_136/n5 ), .ZN(\uut_baud_rate/eq_136/n7 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U7  ( .A1(baud_division[14]), .A2(
        \uut_baud_rate/baud_count [14]), .ZN(\uut_baud_rate/eq_136/n6 ) );
  AND2_X1 \uut_baud_rate/eq_136/U6  ( .A1(\uut_baud_rate/eq_136/n47 ), .A2(
        \uut_baud_rate/eq_136/n46 ), .ZN(\uut_baud_rate/eq_136/n3 ) );
  XNOR2_X1 \uut_baud_rate/eq_136/U5  ( .A(baud_division[9]), .B(
        \uut_baud_rate/baud_count [9]), .ZN(\uut_baud_rate/eq_136/n2 ) );
  NAND2_X1 \uut_baud_rate/eq_136/U4  ( .A1(\uut_baud_rate/eq_136/n2 ), .A2(
        \uut_baud_rate/eq_136/n57 ), .ZN(\uut_baud_rate/eq_136/n1 ) );
  NOR2_X1 \uut_baud_rate/eq_136/U3  ( .A1(\uut_baud_rate/eq_136/n56 ), .A2(
        \uut_baud_rate/eq_136/n1 ), .ZN(\uut_baud_rate/eq_136/n45 ) );
  AND4_X1 \uut_baud_rate/eq_136/U2  ( .A1(\uut_baud_rate/eq_136/n50 ), .A2(
        \uut_baud_rate/eq_136/n48 ), .A3(\uut_baud_rate/eq_136/n51 ), .A4(
        \uut_baud_rate/eq_136/n49 ), .ZN(\uut_baud_rate/eq_136/n47 ) );
  AND4_X1 \uut_baud_rate/eq_136/U1  ( .A1(\uut_baud_rate/eq_136/n54 ), .A2(
        \uut_baud_rate/eq_136/n53 ), .A3(\uut_baud_rate/eq_136/n52 ), .A4(
        \uut_baud_rate/eq_136/n55 ), .ZN(\uut_baud_rate/eq_136/n46 ) );
  OAI21_X1 \uut_tx/U72  ( .B1(\uut_tx/n10 ), .B2(\uut_tx/n18 ), .A(
        \uut_tx/n75 ), .ZN(\uut_tx/N62 ) );
  INV_X1 \uut_tx/U71  ( .A(\uut_tx/n74 ), .ZN(\uut_tx/n75 ) );
  OAI21_X1 \uut_tx/U70  ( .B1(\uut_tx/n10 ), .B2(\uut_tx/n21 ), .A(
        \uut_tx/n72 ), .ZN(\uut_tx/n49 ) );
  AOI22_X1 \uut_tx/U69  ( .A1(data_out[7]), .A2(\uut_tx/n24 ), .B1(
        \uut_tx/data_save [6]), .B2(\uut_tx/n22 ), .ZN(\uut_tx/n72 ) );
  OAI21_X1 \uut_tx/U68  ( .B1(\uut_tx/n11 ), .B2(\uut_tx/n21 ), .A(
        \uut_tx/n71 ), .ZN(\uut_tx/n50 ) );
  AOI22_X1 \uut_tx/U67  ( .A1(data_out[6]), .A2(\uut_tx/n24 ), .B1(
        \uut_tx/data_save [5]), .B2(\uut_tx/n22 ), .ZN(\uut_tx/n71 ) );
  OAI21_X1 \uut_tx/U66  ( .B1(\uut_tx/n12 ), .B2(\uut_tx/n21 ), .A(
        \uut_tx/n70 ), .ZN(\uut_tx/n51 ) );
  AOI22_X1 \uut_tx/U65  ( .A1(data_out[5]), .A2(\uut_tx/n24 ), .B1(
        \uut_tx/data_save [4]), .B2(\uut_tx/n22 ), .ZN(\uut_tx/n70 ) );
  OAI21_X1 \uut_tx/U64  ( .B1(\uut_tx/n13 ), .B2(\uut_tx/n21 ), .A(
        \uut_tx/n69 ), .ZN(\uut_tx/n52 ) );
  AOI22_X1 \uut_tx/U63  ( .A1(data_out[4]), .A2(\uut_tx/n24 ), .B1(
        \uut_tx/data_save [3]), .B2(\uut_tx/n22 ), .ZN(\uut_tx/n69 ) );
  OAI21_X1 \uut_tx/U62  ( .B1(\uut_tx/n14 ), .B2(\uut_tx/n21 ), .A(
        \uut_tx/n68 ), .ZN(\uut_tx/n53 ) );
  AOI22_X1 \uut_tx/U61  ( .A1(data_out[3]), .A2(\uut_tx/n24 ), .B1(
        \uut_tx/data_save [2]), .B2(\uut_tx/n22 ), .ZN(\uut_tx/n68 ) );
  OAI21_X1 \uut_tx/U60  ( .B1(\uut_tx/n15 ), .B2(\uut_tx/n21 ), .A(
        \uut_tx/n67 ), .ZN(\uut_tx/n54 ) );
  AOI22_X1 \uut_tx/U59  ( .A1(data_out[2]), .A2(\uut_tx/n24 ), .B1(
        \uut_tx/data_save [1]), .B2(\uut_tx/n22 ), .ZN(\uut_tx/n67 ) );
  OAI21_X1 \uut_tx/U58  ( .B1(\uut_tx/n16 ), .B2(\uut_tx/n21 ), .A(
        \uut_tx/n66 ), .ZN(\uut_tx/n55 ) );
  AOI22_X1 \uut_tx/U57  ( .A1(data_out[1]), .A2(\uut_tx/n24 ), .B1(
        \uut_tx/data_save [0]), .B2(\uut_tx/n22 ), .ZN(\uut_tx/n66 ) );
  INV_X1 \uut_tx/U56  ( .A(\uut_tx/n65 ), .ZN(\uut_tx/n76 ) );
  AOI22_X1 \uut_tx/U55  ( .A1(\uut_tx/data_save [0]), .A2(\uut_tx/n64 ), .B1(
        data_out[0]), .B2(\uut_tx/n24 ), .ZN(\uut_tx/n65 ) );
  INV_X1 \uut_tx/U54  ( .A(\uut_tx/n73 ), .ZN(\uut_tx/n64 ) );
  AND2_X1 \uut_tx/U53  ( .A1(\uut_tx/next_state [0]), .A2(\uut_tx/n62 ), .ZN(
        \uut_tx/N53 ) );
  NAND2_X1 \uut_tx/U52  ( .A1(\uut_tx/n47 ), .A2(\uut_tx/n46 ), .ZN(
        \uut_tx/N66 ) );
  AOI22_X1 \uut_tx/U51  ( .A1(enable), .A2(\uut_tx/n45 ), .B1(
        \uut_tx/count_16_indication ), .B2(\uut_tx/n18 ), .ZN(\uut_tx/n46 ) );
  INV_X1 \uut_tx/U50  ( .A(\uut_tx/n20 ), .ZN(\uut_tx/n45 ) );
  AOI21_X1 \uut_tx/U49  ( .B1(\uut_tx/count_8_indication ), .B2(\uut_tx/n43 ), 
        .A(rst), .ZN(\uut_tx/n47 ) );
  INV_X1 \uut_tx/U48  ( .A(\uut_tx/n63 ), .ZN(\uut_tx/n43 ) );
  NAND2_X1 \uut_tx/U47  ( .A1(\uut_tx/current_state [1]), .A2(\uut_tx/n19 ), 
        .ZN(\uut_tx/n63 ) );
  NOR2_X1 \uut_tx/U46  ( .A1(rst), .A2(\uut_tx/n42 ), .ZN(\uut_tx/N35 ) );
  NOR2_X1 \uut_tx/U45  ( .A1(\uut_tx/n48 ), .A2(\uut_tx/n42 ), .ZN(
        \uut_tx/N41 ) );
  NAND3_X1 \uut_tx/U44  ( .A1(\uut_tx/n4 ), .A2(baud_tick), .A3(\uut_tx/n20 ), 
        .ZN(\uut_tx/n42 ) );
  NAND2_X1 \uut_tx/U43  ( .A1(\uut_tx/n23 ), .A2(\uut_tx/current_state [1]), 
        .ZN(\uut_tx/n48 ) );
  OAI21_X1 \uut_tx/U42  ( .B1(\uut_tx/n39 ), .B2(\uut_tx/n1 ), .A(\uut_tx/n38 ), .ZN(\uut_tx/n56 ) );
  NAND3_X1 \uut_tx/U41  ( .A1(\uut_tx/n37 ), .A2(\uut_tx/count_16 [1]), .A3(
        \uut_tx/count_16 [2]), .ZN(\uut_tx/n38 ) );
  INV_X1 \uut_tx/U40  ( .A(\uut_tx/n36 ), .ZN(\uut_tx/n37 ) );
  NOR2_X1 \uut_tx/U39  ( .A1(\uut_tx/n34 ), .A2(\uut_tx/n35 ), .ZN(
        \uut_tx/n39 ) );
  MUX2_X1 \uut_tx/U38  ( .A(\uut_tx/n34 ), .B(\uut_tx/n33 ), .S(\uut_tx/n7 ), 
        .Z(\uut_tx/n57 ) );
  NOR2_X1 \uut_tx/U37  ( .A1(\uut_tx/n32 ), .A2(\uut_tx/n36 ), .ZN(
        \uut_tx/n33 ) );
  INV_X1 \uut_tx/U36  ( .A(\uut_tx/count_16 [1]), .ZN(\uut_tx/n32 ) );
  OAI21_X1 \uut_tx/U35  ( .B1(\uut_tx/count_16 [1]), .B2(\uut_tx/n31 ), .A(
        \uut_tx/n30 ), .ZN(\uut_tx/n34 ) );
  OAI22_X1 \uut_tx/U34  ( .A1(\uut_tx/count_16 [1]), .A2(\uut_tx/n36 ), .B1(
        \uut_tx/n8 ), .B2(\uut_tx/n3 ), .ZN(\uut_tx/n58 ) );
  INV_X1 \uut_tx/U33  ( .A(\uut_tx/n29 ), .ZN(\uut_tx/n30 ) );
  OAI21_X1 \uut_tx/U32  ( .B1(\uut_tx/n31 ), .B2(\uut_tx/n28 ), .A(
        \uut_tx/n27 ), .ZN(\uut_tx/n29 ) );
  INV_X1 \uut_tx/U31  ( .A(\uut_tx/n9 ), .ZN(\uut_tx/n28 ) );
  NAND3_X1 \uut_tx/U30  ( .A1(\uut_tx/n35 ), .A2(\uut_tx/count_16 [0]), .A3(
        \uut_tx/n27 ), .ZN(\uut_tx/n36 ) );
  INV_X1 \uut_tx/U29  ( .A(\uut_tx/n31 ), .ZN(\uut_tx/n35 ) );
  MUX2_X1 \uut_tx/U28  ( .A(\uut_tx/n26 ), .B(\uut_tx/n25 ), .S(\uut_tx/n9 ), 
        .Z(\uut_tx/n59 ) );
  NOR2_X1 \uut_tx/U27  ( .A1(\uut_tx/n26 ), .A2(\uut_tx/n31 ), .ZN(
        \uut_tx/n25 ) );
  NAND2_X1 \uut_tx/U26  ( .A1(\uut_tx/n41 ), .A2(\uut_tx/n44 ), .ZN(
        \uut_tx/n61 ) );
  NAND2_X1 \uut_tx/U25  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n19 ), .ZN(
        \uut_tx/n44 ) );
  INV_X1 \uut_tx/U24  ( .A(\uut_tx/current_state [0]), .ZN(\uut_tx/n40 ) );
  NAND4_X1 \uut_tx/U23  ( .A1(\uut_tx/n17 ), .A2(\uut_tx/count_16 [0]), .A3(
        \uut_tx/count_16 [2]), .A4(\uut_tx/count_16 [3]), .ZN(\uut_tx/n41 ) );
  INV_X1 \uut_tx/U22  ( .A(\uut_tx/n27 ), .ZN(\uut_tx/n26 ) );
  NAND2_X1 \uut_tx/U21  ( .A1(\uut_tx/n62 ), .A2(\uut_tx/n60 ), .ZN(
        \uut_tx/n27 ) );
  INV_X1 \uut_tx/U20  ( .A(baud_tick), .ZN(\uut_tx/n60 ) );
  AND2_X1 \uut_tx/U19  ( .A1(\uut_tx/next_state [1]), .A2(\uut_tx/n62 ), .ZN(
        \uut_tx/N54 ) );
  INV_X1 \uut_tx/U18  ( .A(rst), .ZN(\uut_tx/n62 ) );
  NOR2_X1 \uut_tx/U17  ( .A1(rst), .A2(\uut_tx/n74 ), .ZN(\uut_tx/N68 ) );
  XOR2_X1 \uut_tx/U16  ( .A(\uut_tx/n6 ), .B(\uut_tx/n18 ), .Z(\uut_tx/n74 )
         );
  AND2_X1 \uut_tx/U15  ( .A1(\uut_tx/n63 ), .A2(\uut_tx/n62 ), .ZN(
        \uut_tx/n24 ) );
  AND2_X1 \uut_tx/U14  ( .A1(\uut_tx/n62 ), .A2(\uut_tx/n19 ), .ZN(
        \uut_tx/n23 ) );
  OAI21_X1 \uut_tx/U13  ( .B1(\uut_tx/n61 ), .B2(\uut_tx/n60 ), .A(\uut_tx/n5 ), .ZN(\uut_tx/n73 ) );
  INV_X1 \uut_tx/U12  ( .A(\uut_tx/n64 ), .ZN(\uut_tx/n21 ) );
  NAND2_X1 \uut_tx/U11  ( .A1(\uut_tx/n6 ), .A2(\uut_tx/n40 ), .ZN(
        \uut_tx/n20 ) );
  CLKBUF_X1 \uut_tx/U10  ( .A(\uut_tx/current_state [0]), .Z(\uut_tx/n18 ) );
  INV_X1 \uut_tx/U9  ( .A(\uut_tx/n8 ), .ZN(\uut_tx/n17 ) );
  AND2_X2 \uut_tx/U8  ( .A1(\uut_tx/n73 ), .A2(\uut_tx/n5 ), .ZN(\uut_tx/n22 )
         );
  AND2_X1 \uut_tx/U7  ( .A1(\uut_tx/n23 ), .A2(\uut_tx/current_state [1]), 
        .ZN(\uut_tx/n5 ) );
  AND4_X1 \uut_tx/U6  ( .A1(\uut_tx/n17 ), .A2(\uut_tx/count_16 [0]), .A3(
        \uut_tx/count_16 [3]), .A4(\uut_tx/count_16 [2]), .ZN(\uut_tx/n4 ) );
  CLKBUF_X1 \uut_tx/U5  ( .A(\uut_tx/n30 ), .Z(\uut_tx/n3 ) );
  AND2_X1 \uut_tx/U4  ( .A1(\uut_tx/n44 ), .A2(\uut_tx/n62 ), .ZN(\uut_tx/n2 )
         );
  NAND2_X1 \uut_tx/U3  ( .A1(\uut_tx/n41 ), .A2(\uut_tx/n2 ), .ZN(\uut_tx/n31 ) );
  DFF_X1 \uut_tx/data_save_reg[0]  ( .D(\uut_tx/n76 ), .CK(clk), .Q(
        \uut_tx/data_save [0]) );
  DFF_X1 \uut_tx/data_save_reg[1]  ( .D(\uut_tx/n55 ), .CK(clk), .Q(
        \uut_tx/data_save [1]), .QN(\uut_tx/n16 ) );
  DFF_X1 \uut_tx/data_save_reg[2]  ( .D(\uut_tx/n54 ), .CK(clk), .Q(
        \uut_tx/data_save [2]), .QN(\uut_tx/n15 ) );
  DFF_X1 \uut_tx/data_save_reg[3]  ( .D(\uut_tx/n53 ), .CK(clk), .Q(
        \uut_tx/data_save [3]), .QN(\uut_tx/n14 ) );
  DFF_X1 \uut_tx/data_save_reg[4]  ( .D(\uut_tx/n52 ), .CK(clk), .Q(
        \uut_tx/data_save [4]), .QN(\uut_tx/n13 ) );
  DFF_X1 \uut_tx/data_save_reg[5]  ( .D(\uut_tx/n51 ), .CK(clk), .Q(
        \uut_tx/data_save [5]), .QN(\uut_tx/n12 ) );
  DFF_X1 \uut_tx/data_save_reg[6]  ( .D(\uut_tx/n50 ), .CK(clk), .Q(
        \uut_tx/data_save [6]), .QN(\uut_tx/n11 ) );
  DFF_X1 \uut_tx/count_8_indication_reg  ( .D(\uut_tx/N41 ), .CK(clk), .Q(
        \uut_tx/count_8_indication ) );
  DLL_X1 \uut_tx/tx_reg  ( .D(\uut_tx/N62 ), .GN(rst), .Q(tx) );
  DFF_X1 \uut_tx/data_save_reg[7]  ( .D(\uut_tx/n49 ), .CK(clk), .QN(
        \uut_tx/n10 ) );
  DFF_X1 \uut_tx/current_state_reg[1]  ( .D(\uut_tx/N54 ), .CK(clk), .Q(
        \uut_tx/current_state [1]), .QN(\uut_tx/n6 ) );
  DLH_X1 \uut_tx/next_state_reg[1]  ( .G(\uut_tx/N66 ), .D(\uut_tx/N68 ), .Q(
        \uut_tx/next_state [1]) );
  DFF_X1 \uut_tx/count_16_indication_reg  ( .D(\uut_tx/N35 ), .CK(clk), .Q(
        \uut_tx/count_16_indication ) );
  DFF_X1 \uut_tx/count_16_reg[3]  ( .D(\uut_tx/n56 ), .CK(clk), .Q(
        \uut_tx/count_16 [3]), .QN(\uut_tx/n1 ) );
  DFF_X1 \uut_tx/count_16_reg[2]  ( .D(\uut_tx/n57 ), .CK(clk), .Q(
        \uut_tx/count_16 [2]), .QN(\uut_tx/n7 ) );
  DFF_X1 \uut_tx/count_16_reg[1]  ( .D(\uut_tx/n58 ), .CK(clk), .Q(
        \uut_tx/count_16 [1]), .QN(\uut_tx/n8 ) );
  DFF_X1 \uut_tx/count_16_reg[0]  ( .D(\uut_tx/n59 ), .CK(clk), .Q(
        \uut_tx/count_16 [0]), .QN(\uut_tx/n9 ) );
  DFF_X1 \uut_tx/current_state_reg[0]  ( .D(\uut_tx/N53 ), .CK(clk), .Q(
        \uut_tx/current_state [0]), .QN(\uut_tx/n19 ) );
  DLH_X1 \uut_tx/next_state_reg[0]  ( .G(\uut_tx/N66 ), .D(\uut_tx/n23 ), .Q(
        \uut_tx/next_state [0]) );
  NOR2_X1 \uut_rx/U91  ( .A1(rst), .A2(\uut_rx/n87 ), .ZN(\uut_rx/N85 ) );
  MUX2_X1 \uut_rx/U90  ( .A(\uut_rx/n28 ), .B(\uut_rx/data_save [7]), .S(
        \uut_rx/n21 ), .Z(\uut_rx/n88 ) );
  MUX2_X1 \uut_rx/U89  ( .A(\uut_rx/n29 ), .B(\uut_rx/data_save [6]), .S(
        \uut_rx/n21 ), .Z(\uut_rx/n89 ) );
  MUX2_X1 \uut_rx/U88  ( .A(\uut_rx/n30 ), .B(\uut_rx/data_save [5]), .S(
        \uut_rx/n21 ), .Z(\uut_rx/n90 ) );
  MUX2_X1 \uut_rx/U87  ( .A(\uut_rx/n31 ), .B(\uut_rx/data_save [4]), .S(
        \uut_rx/n86 ), .Z(\uut_rx/n91 ) );
  MUX2_X1 \uut_rx/U86  ( .A(\uut_rx/n32 ), .B(\uut_rx/data_save [3]), .S(
        \uut_rx/n86 ), .Z(\uut_rx/n92 ) );
  MUX2_X1 \uut_rx/U85  ( .A(\uut_rx/n33 ), .B(\uut_rx/data_save [2]), .S(
        \uut_rx/n86 ), .Z(\uut_rx/n93 ) );
  MUX2_X1 \uut_rx/U84  ( .A(\uut_rx/n34 ), .B(\uut_rx/data_save [1]), .S(
        \uut_rx/n86 ), .Z(\uut_rx/n94 ) );
  MUX2_X1 \uut_rx/U83  ( .A(\uut_rx/n83 ), .B(\uut_rx/n84 ), .S(\uut_rx/n21 ), 
        .Z(\uut_rx/n71 ) );
  INV_X1 \uut_rx/U82  ( .A(\uut_rx/n82 ), .ZN(\uut_rx/n86 ) );
  OAI21_X1 \uut_rx/U81  ( .B1(\uut_rx/n14 ), .B2(\uut_rx/n80 ), .A(
        \uut_rx/n85 ), .ZN(\uut_rx/n82 ) );
  NOR2_X1 \uut_rx/U80  ( .A1(rst), .A2(\uut_rx/n79 ), .ZN(\uut_rx/n83 ) );
  INV_X1 \uut_rx/U79  ( .A(rx), .ZN(\uut_rx/n79 ) );
  AND2_X1 \uut_rx/U78  ( .A1(\uut_rx/next_state [0]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/N86 ) );
  NAND4_X1 \uut_rx/U77  ( .A1(\uut_rx/n78 ), .A2(\uut_rx/n85 ), .A3(
        \uut_rx/n77 ), .A4(\uut_rx/n76 ), .ZN(\uut_rx/N99 ) );
  OAI211_X1 \uut_rx/U76  ( .C1(\uut_rx/n26 ), .C2(\uut_rx/count_16_indication ), .A(\uut_rx/n79 ), .B(\uut_rx/n25 ), .ZN(\uut_rx/n76 ) );
  NAND2_X1 \uut_rx/U75  ( .A1(\uut_rx/count_8_indication ), .A2(\uut_rx/n67 ), 
        .ZN(\uut_rx/n77 ) );
  INV_X1 \uut_rx/U74  ( .A(\uut_rx/n80 ), .ZN(\uut_rx/n67 ) );
  NAND4_X1 \uut_rx/U73  ( .A1(\uut_rx/current_state [0]), .A2(
        \uut_rx/current_state [1]), .A3(\uut_rx/count_16_indication ), .A4(rx), 
        .ZN(\uut_rx/n78 ) );
  NOR3_X1 \uut_rx/U72  ( .A1(\uut_rx/n66 ), .A2(\uut_rx/n81 ), .A3(
        \uut_rx/n65 ), .ZN(\uut_rx/N66 ) );
  OAI22_X1 \uut_rx/U71  ( .A1(\uut_rx/n18 ), .A2(\uut_rx/n64 ), .B1(
        \uut_rx/n63 ), .B2(\uut_rx/n62 ), .ZN(\uut_rx/n68 ) );
  NOR2_X1 \uut_rx/U70  ( .A1(\uut_rx/n16 ), .A2(\uut_rx/n61 ), .ZN(
        \uut_rx/n64 ) );
  NAND3_X1 \uut_rx/U69  ( .A1(\uut_rx/n61 ), .A2(\uut_rx/count_8 [0]), .A3(
        \uut_rx/n59 ), .ZN(\uut_rx/n62 ) );
  INV_X1 \uut_rx/U68  ( .A(\uut_rx/n58 ), .ZN(\uut_rx/n61 ) );
  OAI21_X1 \uut_rx/U67  ( .B1(\uut_rx/count_8 [0]), .B2(\uut_rx/n10 ), .A(
        \uut_rx/n59 ), .ZN(\uut_rx/n60 ) );
  NOR2_X1 \uut_rx/U66  ( .A1(\uut_rx/n16 ), .A2(\uut_rx/n10 ), .ZN(
        \uut_rx/n57 ) );
  NAND2_X1 \uut_rx/U65  ( .A1(\uut_rx/n6 ), .A2(\uut_rx/n65 ), .ZN(
        \uut_rx/n58 ) );
  NAND3_X1 \uut_rx/U64  ( .A1(\uut_rx/count_8 [2]), .A2(\uut_rx/count_8 [0]), 
        .A3(\uut_rx/count_8 [1]), .ZN(\uut_rx/n65 ) );
  NAND2_X1 \uut_rx/U63  ( .A1(\uut_rx/n6 ), .A2(\uut_rx/n81 ), .ZN(
        \uut_rx/n59 ) );
  NAND2_X1 \uut_rx/U62  ( .A1(\uut_rx/n24 ), .A2(\uut_rx/n9 ), .ZN(
        \uut_rx/n81 ) );
  NAND2_X1 \uut_rx/U61  ( .A1(\uut_rx/n23 ), .A2(\uut_rx/current_state [1]), 
        .ZN(\uut_rx/n66 ) );
  NOR3_X1 \uut_rx/U60  ( .A1(\uut_rx/n56 ), .A2(rst), .A3(\uut_rx/n55 ), .ZN(
        \uut_rx/N47 ) );
  AOI22_X1 \uut_rx/U59  ( .A1(\uut_rx/n54 ), .A2(\uut_rx/n27 ), .B1(
        \uut_rx/n22 ), .B2(\uut_rx/current_state [1]), .ZN(\uut_rx/n56 ) );
  INV_X1 \uut_rx/U58  ( .A(\uut_rx/n52 ), .ZN(\uut_rx/n54 ) );
  MUX2_X1 \uut_rx/U57  ( .A(\uut_rx/n51 ), .B(\uut_rx/n50 ), .S(\uut_rx/n43 ), 
        .Z(\uut_rx/n73 ) );
  NOR2_X1 \uut_rx/U56  ( .A1(\uut_rx/n19 ), .A2(\uut_rx/n48 ), .ZN(
        \uut_rx/n50 ) );
  OAI22_X1 \uut_rx/U55  ( .A1(\uut_rx/n47 ), .A2(\uut_rx/n1 ), .B1(
        \uut_rx/n46 ), .B2(\uut_rx/n12 ), .ZN(\uut_rx/n72 ) );
  INV_X1 \uut_rx/U54  ( .A(\uut_rx/n51 ), .ZN(\uut_rx/n46 ) );
  OAI21_X1 \uut_rx/U53  ( .B1(\uut_rx/n48 ), .B2(\uut_rx/n5 ), .A(\uut_rx/n17 ), .ZN(\uut_rx/n51 ) );
  AOI21_X1 \uut_rx/U52  ( .B1(\uut_rx/n53 ), .B2(\uut_rx/n43 ), .A(
        \uut_rx/n27 ), .ZN(\uut_rx/n47 ) );
  INV_X1 \uut_rx/U51  ( .A(\uut_rx/count_16 [3]), .ZN(\uut_rx/n42 ) );
  INV_X1 \uut_rx/U50  ( .A(\uut_rx/n12 ), .ZN(\uut_rx/n53 ) );
  MUX2_X1 \uut_rx/U49  ( .A(\uut_rx/n44 ), .B(\uut_rx/n41 ), .S(\uut_rx/n2 ), 
        .Z(\uut_rx/n74 ) );
  NOR2_X1 \uut_rx/U48  ( .A1(\uut_rx/n48 ), .A2(\uut_rx/n4 ), .ZN(\uut_rx/n41 ) );
  NAND2_X1 \uut_rx/U47  ( .A1(\uut_rx/n39 ), .A2(\uut_rx/n38 ), .ZN(
        \uut_rx/n44 ) );
  NAND3_X1 \uut_rx/U46  ( .A1(\uut_rx/n37 ), .A2(\uut_rx/n85 ), .A3(
        \uut_rx/n40 ), .ZN(\uut_rx/n39 ) );
  OAI22_X1 \uut_rx/U45  ( .A1(\uut_rx/n7 ), .A2(\uut_rx/n48 ), .B1(\uut_rx/n4 ), .B2(\uut_rx/n38 ), .ZN(\uut_rx/n75 ) );
  NAND3_X1 \uut_rx/U44  ( .A1(\uut_rx/n37 ), .A2(\uut_rx/n85 ), .A3(
        \uut_rx/n38 ), .ZN(\uut_rx/n48 ) );
  NAND2_X1 \uut_rx/U43  ( .A1(\uut_rx/n85 ), .A2(\uut_rx/n55 ), .ZN(
        \uut_rx/n38 ) );
  INV_X1 \uut_rx/U42  ( .A(baud_tick), .ZN(\uut_rx/n55 ) );
  OAI21_X1 \uut_rx/U41  ( .B1(\uut_rx/n36 ), .B2(\uut_rx/n26 ), .A(
        \uut_rx/n25 ), .ZN(\uut_rx/n37 ) );
  NOR3_X1 \uut_rx/U40  ( .A1(\uut_rx/n49 ), .A2(\uut_rx/n13 ), .A3(
        \uut_rx/count_16 [3]), .ZN(\uut_rx/n36 ) );
  NAND2_X1 \uut_rx/U39  ( .A1(\uut_rx/n35 ), .A2(\uut_rx/n45 ), .ZN(
        \uut_rx/n49 ) );
  INV_X1 \uut_rx/U38  ( .A(\uut_rx/count_16 [2]), .ZN(\uut_rx/n43 ) );
  AND2_X1 \uut_rx/U37  ( .A1(\uut_rx/next_state [1]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/N87 ) );
  AOI21_X1 \uut_rx/U36  ( .B1(\uut_rx/n52 ), .B2(\uut_rx/n80 ), .A(rst), .ZN(
        \uut_rx/N101 ) );
  NAND2_X1 \uut_rx/U35  ( .A1(\uut_rx/n26 ), .A2(\uut_rx/current_state [1]), 
        .ZN(\uut_rx/n80 ) );
  NAND2_X1 \uut_rx/U34  ( .A1(\uut_rx/n25 ), .A2(\uut_rx/current_state [0]), 
        .ZN(\uut_rx/n52 ) );
  INV_X1 \uut_rx/U33  ( .A(rst), .ZN(\uut_rx/n85 ) );
  AND2_X1 \uut_rx/U32  ( .A1(\uut_rx/n84 ), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/n34 ) );
  AND2_X1 \uut_rx/U31  ( .A1(\uut_rx/data_save [1]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/n33 ) );
  AND2_X1 \uut_rx/U30  ( .A1(\uut_rx/data_save [2]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/n32 ) );
  AND2_X1 \uut_rx/U29  ( .A1(\uut_rx/data_save [3]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/n31 ) );
  AND2_X1 \uut_rx/U28  ( .A1(\uut_rx/data_save [4]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/n30 ) );
  AND2_X1 \uut_rx/U27  ( .A1(\uut_rx/data_save [5]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/n29 ) );
  AND2_X1 \uut_rx/U26  ( .A1(\uut_rx/data_save [6]), .A2(\uut_rx/n85 ), .ZN(
        \uut_rx/n28 ) );
  AND2_X1 \uut_rx/U25  ( .A1(\uut_rx/n24 ), .A2(\uut_rx/n42 ), .ZN(
        \uut_rx/n27 ) );
  MUX2_X1 \uut_rx/U24  ( .A(\uut_rx/n11 ), .B(\uut_rx/n60 ), .S(
        \uut_rx/count_8 [1]), .Z(\uut_rx/n69 ) );
  MUX2_X1 \uut_rx/U23  ( .A(\uut_rx/n57 ), .B(\uut_rx/n16 ), .S(
        \uut_rx/count_8 [0]), .Z(\uut_rx/n70 ) );
  AND2_X1 \uut_rx/U22  ( .A1(\uut_rx/n85 ), .A2(\uut_rx/n26 ), .ZN(
        \uut_rx/n23 ) );
  INV_X1 \uut_rx/U21  ( .A(\uut_rx/n20 ), .ZN(\uut_rx/n21 ) );
  OAI21_X1 \uut_rx/U20  ( .B1(\uut_rx/n14 ), .B2(\uut_rx/n80 ), .A(
        \uut_rx/n85 ), .ZN(\uut_rx/n20 ) );
  CLKBUF_X1 \uut_rx/U19  ( .A(\uut_rx/n49 ), .Z(\uut_rx/n19 ) );
  AND2_X1 \uut_rx/U18  ( .A1(\uut_rx/n39 ), .A2(\uut_rx/n38 ), .ZN(
        \uut_rx/n17 ) );
  AND2_X1 \uut_rx/U17  ( .A1(\uut_rx/n6 ), .A2(\uut_rx/n81 ), .ZN(\uut_rx/n16 ) );
  NAND2_X1 \uut_rx/U16  ( .A1(baud_tick), .A2(\uut_rx/n22 ), .ZN(\uut_rx/n14 )
         );
  AND3_X1 \uut_rx/U15  ( .A1(\uut_rx/n61 ), .A2(\uut_rx/count_8 [0]), .A3(
        \uut_rx/n59 ), .ZN(\uut_rx/n11 ) );
  BUF_X1 \uut_rx/U14  ( .A(\uut_rx/n58 ), .Z(\uut_rx/n10 ) );
  AND2_X1 \uut_rx/U13  ( .A1(baud_tick), .A2(\uut_rx/n53 ), .ZN(\uut_rx/n9 )
         );
  NOR2_X1 \uut_rx/U12  ( .A1(\uut_rx/n15 ), .A2(\uut_rx/n13 ), .ZN(\uut_rx/n8 ) );
  INV_X1 \uut_rx/U11  ( .A(\uut_rx/n40 ), .ZN(\uut_rx/n7 ) );
  AND2_X1 \uut_rx/U10  ( .A1(\uut_rx/n23 ), .A2(\uut_rx/current_state [1]), 
        .ZN(\uut_rx/n6 ) );
  AND2_X1 \uut_rx/U9  ( .A1(\uut_rx/n3 ), .A2(\uut_rx/n8 ), .ZN(\uut_rx/n22 )
         );
  INV_X1 \uut_rx/U8  ( .A(\uut_rx/n2 ), .ZN(\uut_rx/n5 ) );
  INV_X1 \uut_rx/U7  ( .A(\uut_rx/n7 ), .ZN(\uut_rx/n4 ) );
  AND2_X1 \uut_rx/U6  ( .A1(\uut_rx/n7 ), .A2(\uut_rx/n8 ), .ZN(\uut_rx/n24 )
         );
  AND2_X1 \uut_rx/U5  ( .A1(\uut_rx/n7 ), .A2(\uut_rx/n53 ), .ZN(\uut_rx/n3 )
         );
  CLKBUF_X1 \uut_rx/U4  ( .A(\uut_rx/n15 ), .Z(\uut_rx/n2 ) );
  CLKBUF_X1 \uut_rx/U3  ( .A(\uut_rx/n48 ), .Z(\uut_rx/n1 ) );
  DFF_X1 \uut_rx/data_save_reg[0]  ( .D(\uut_rx/n71 ), .CK(clk), .Q(
        \uut_rx/n84 ) );
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
  DFF_X1 \uut_rx/count_8_reg[1]  ( .D(\uut_rx/n69 ), .CK(clk), .Q(
        \uut_rx/count_8 [1]), .QN(\uut_rx/n63 ) );
  DFF_X1 \uut_rx/count_8_reg[0]  ( .D(\uut_rx/n70 ), .CK(clk), .Q(
        \uut_rx/count_8 [0]) );
  DFF_X1 \uut_rx/count_8_indication_reg  ( .D(\uut_rx/N66 ), .CK(clk), .Q(
        \uut_rx/count_8_indication ) );
  DFF_X1 \uut_rx/count_16_indication_reg  ( .D(\uut_rx/N47 ), .CK(clk), .Q(
        \uut_rx/count_16_indication ) );
  DFF_X1 \uut_rx/data_save_reg[7]  ( .D(\uut_rx/n88 ), .CK(clk), .Q(
        \uut_rx/data_save [7]), .QN(\uut_rx/n87 ) );
  DFF_X1 \uut_rx/count_16_reg[0]  ( .D(\uut_rx/n75 ), .CK(clk), .Q(
        \uut_rx/n35 ), .QN(\uut_rx/n40 ) );
  DFF_X1 \uut_rx/ext_data_out_reg[7]  ( .D(\uut_rx/N85 ), .CK(clk), .Q(
        data_in[7]) );
  DFF_X1 \uut_rx/ext_data_out_reg[6]  ( .D(\uut_rx/n28 ), .CK(clk), .Q(
        data_in[6]) );
  DFF_X1 \uut_rx/ext_data_out_reg[5]  ( .D(\uut_rx/n29 ), .CK(clk), .Q(
        data_in[5]) );
  DFF_X1 \uut_rx/ext_data_out_reg[4]  ( .D(\uut_rx/n30 ), .CK(clk), .Q(
        data_in[4]) );
  DFF_X1 \uut_rx/ext_data_out_reg[3]  ( .D(\uut_rx/n31 ), .CK(clk), .Q(
        data_in[3]) );
  DFF_X1 \uut_rx/ext_data_out_reg[2]  ( .D(\uut_rx/n32 ), .CK(clk), .Q(
        data_in[2]) );
  DFF_X1 \uut_rx/ext_data_out_reg[1]  ( .D(\uut_rx/n33 ), .CK(clk), .Q(
        data_in[1]) );
  DFF_X1 \uut_rx/ext_data_out_reg[0]  ( .D(\uut_rx/n34 ), .CK(clk), .Q(
        data_in[0]) );
  DFF_X1 \uut_rx/count_8_reg[2]  ( .D(\uut_rx/n68 ), .CK(clk), .Q(
        \uut_rx/count_8 [2]), .QN(\uut_rx/n18 ) );
  DFF_X1 \uut_rx/count_16_reg[3]  ( .D(\uut_rx/n72 ), .CK(clk), .Q(
        \uut_rx/count_16 [3]), .QN(\uut_rx/n12 ) );
  DFF_X1 \uut_rx/count_16_reg[2]  ( .D(\uut_rx/n73 ), .CK(clk), .Q(
        \uut_rx/count_16 [2]), .QN(\uut_rx/n13 ) );
  DFF_X1 \uut_rx/count_16_reg[1]  ( .D(\uut_rx/n74 ), .CK(clk), .Q(
        \uut_rx/n45 ), .QN(\uut_rx/n15 ) );
  DFF_X1 \uut_rx/current_state_reg[1]  ( .D(\uut_rx/N87 ), .CK(clk), .Q(
        \uut_rx/current_state [1]), .QN(\uut_rx/n25 ) );
  DLH_X1 \uut_rx/next_state_reg[1]  ( .G(\uut_rx/N99 ), .D(\uut_rx/N101 ), .Q(
        \uut_rx/next_state [1]) );
  DFF_X1 \uut_rx/current_state_reg[0]  ( .D(\uut_rx/N86 ), .CK(clk), .Q(
        \uut_rx/current_state [0]), .QN(\uut_rx/n26 ) );
  DLH_X1 \uut_rx/next_state_reg[0]  ( .G(\uut_rx/N99 ), .D(\uut_rx/n23 ), .Q(
        \uut_rx/next_state [0]) );
endmodule

