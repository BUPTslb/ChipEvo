/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sun Jun 14 08:17:39 2026
/////////////////////////////////////////////////////////////


module spi ( clk, rst, addr, we, write_data, re, read_data );
  input [2:0] addr;
  input [31:0] write_data;
  output [31:0] read_data;
  input clk, rst, we, re;
  wire   enable, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, cs, sck, miso,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, \uut_master/n76 , \uut_master/n75 ,
         \uut_master/n74 , \uut_master/n73 , \uut_master/n72 ,
         \uut_master/n71 , \uut_master/n70 , \uut_master/n69 ,
         \uut_master/n68 , \uut_master/n67 , \uut_master/n66 ,
         \uut_master/n65 , \uut_master/n64 , \uut_master/n63 ,
         \uut_master/n62 , \uut_master/n61 , \uut_master/n60 ,
         \uut_master/n59 , \uut_master/n58 , \uut_master/n57 ,
         \uut_master/n56 , \uut_master/n55 , \uut_master/n54 ,
         \uut_master/n53 , \uut_master/n52 , \uut_master/n51 ,
         \uut_master/n50 , \uut_master/n49 , \uut_master/n48 ,
         \uut_master/n47 , \uut_master/n46 , \uut_master/n45 ,
         \uut_master/n43 , \uut_master/n41 , \uut_master/n40 ,
         \uut_master/n39 , \uut_master/n38 , \uut_master/n37 ,
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
         \uut_master/n4 , \uut_master/n3 , \uut_master/n2 , \uut_master/n1 ,
         \uut_master/N17 , \uut_master/clock_count ,
         \uut_master/current_state[0] , \uut_slave/n253 , \uut_slave/n252 ,
         \uut_slave/n251 , \uut_slave/n250 , \uut_slave/n249 ,
         \uut_slave/n248 , \uut_slave/n247 , \uut_slave/n246 ,
         \uut_slave/n245 , \uut_slave/n244 , \uut_slave/n243 ,
         \uut_slave/n242 , \uut_slave/n241 , \uut_slave/n240 ,
         \uut_slave/n239 , \uut_slave/n238 , \uut_slave/n237 ,
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
         \uut_slave/n119 , \uut_slave/n116 , \uut_slave/n115 ,
         \uut_slave/n114 , \uut_slave/n113 , \uut_slave/n111 ,
         \uut_slave/n110 , \uut_slave/n108 , \uut_slave/n106 ,
         \uut_slave/n105 , \uut_slave/n103 , \uut_slave/n101 , \uut_slave/n98 ,
         \uut_slave/n97 , \uut_slave/n96 , \uut_slave/n95 , \uut_slave/n94 ,
         \uut_slave/n93 , \uut_slave/n92 , \uut_slave/n90 , \uut_slave/n11 ,
         \uut_slave/n10 , \uut_slave/n9 , \uut_slave/n8 , \uut_slave/n7 ,
         \uut_slave/n6 , \uut_slave/n5 , \uut_slave/n4 , \uut_slave/n3 ,
         \uut_slave/n2 , \uut_slave/n1 , \uut_slave/n199 , \uut_slave/n198 ,
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
         \uut_slave/n131 , \uut_slave/n130 , \uut_slave/n129 ,
         \uut_slave/n128 , \uut_slave/n127 , \uut_slave/n126 ,
         \uut_slave/n125 , \uut_slave/n124 , \uut_slave/n123 ,
         \uut_slave/n122 , \uut_slave/n118 , \uut_slave/n117 ,
         \uut_slave/n112 , \uut_slave/n109 , \uut_slave/n107 ,
         \uut_slave/n104 , \uut_slave/n102 , \uut_slave/n100 , \uut_slave/n99 ,
         \uut_slave/n91 , \uut_slave/n89 , \uut_slave/n88 , \uut_slave/n87 ,
         \uut_slave/n86 , \uut_slave/n85 , \uut_slave/n84 , \uut_slave/n83 ,
         \uut_slave/n82 , \uut_slave/n81 , \uut_slave/n80 , \uut_slave/n79 ,
         \uut_slave/n78 , \uut_slave/n77 , \uut_slave/n76 , \uut_slave/n75 ,
         \uut_slave/n74 , \uut_slave/n73 , \uut_slave/n72 , \uut_slave/n71 ,
         \uut_slave/n70 , \uut_slave/n69 , \uut_slave/n68 , \uut_slave/n67 ,
         \uut_slave/n66 , \uut_slave/n65 , \uut_slave/n64 , \uut_slave/n63 ,
         \uut_slave/n62 , \uut_slave/n61 , \uut_slave/n60 , \uut_slave/n59 ,
         \uut_slave/n58 , \uut_slave/n57 , \uut_slave/n56 , \uut_slave/n55 ,
         \uut_slave/n54 , \uut_slave/n53 , \uut_slave/n52 , \uut_slave/n51 ,
         \uut_slave/n50 , \uut_slave/n49 , \uut_slave/n48 , \uut_slave/n47 ,
         \uut_slave/n46 , \uut_slave/n45 , \uut_slave/n44 , \uut_slave/n43 ,
         \uut_slave/n42 , \uut_slave/n41 , \uut_slave/n40 , \uut_slave/n39 ,
         \uut_slave/n38 , \uut_slave/n37 , \uut_slave/n36 , \uut_slave/n35 ,
         \uut_slave/n34 , \uut_slave/n33 , \uut_slave/n32 , \uut_slave/n31 ,
         \uut_slave/n30 , \uut_slave/n29 , \uut_slave/n28 , \uut_slave/n27 ,
         \uut_slave/n26 , \uut_slave/n25 , \uut_slave/n24 , \uut_slave/n23 ,
         \uut_slave/n22 , \uut_slave/n21 , \uut_slave/n20 , \uut_slave/n19 ,
         \uut_slave/n18 , \uut_slave/n17 , \uut_slave/n16 , \uut_slave/n15 ,
         \uut_slave/n14 , \uut_slave/n13 , \uut_slave/n12 , \uut_slave/N173 ,
         \uut_slave/N172 , \uut_slave/data_out[31] , \uut_slave/N39 ,
         \uut_slave/data_count_gt_32 ;
  wire   [7:0] command;
  wire   [23:0] address;
  wire   [31:0] data_in;
  wire   [31:0] data_out;
  wire   [7:0] \uut_slave/command_save ;
  wire   [1:0] \uut_slave/current_state ;
  wire   [5:0] \uut_slave/data_count ;

  DLH_X1 \data_in_reg[31]  ( .G(n15), .D(N70), .Q(data_in[31]) );
  DLH_X1 \data_in_reg[30]  ( .G(n15), .D(N69), .Q(data_in[30]) );
  DLH_X1 \data_in_reg[29]  ( .G(n15), .D(N68), .Q(data_in[29]) );
  DLH_X1 \data_in_reg[28]  ( .G(n15), .D(N67), .Q(data_in[28]) );
  DLH_X1 \data_in_reg[27]  ( .G(n15), .D(N66), .Q(data_in[27]) );
  DLH_X1 \data_in_reg[26]  ( .G(n15), .D(N65), .Q(data_in[26]) );
  DLH_X1 \data_in_reg[25]  ( .G(n15), .D(N64), .Q(data_in[25]) );
  DLH_X1 \data_in_reg[24]  ( .G(n15), .D(N63), .Q(data_in[24]) );
  DLH_X1 \data_in_reg[23]  ( .G(n15), .D(N61), .Q(data_in[23]) );
  DLH_X1 \data_in_reg[22]  ( .G(n15), .D(N60), .Q(data_in[22]) );
  DLH_X1 \data_in_reg[21]  ( .G(n15), .D(N59), .Q(data_in[21]) );
  DLH_X1 \data_in_reg[20]  ( .G(n16), .D(N58), .Q(data_in[20]) );
  DLH_X1 \data_in_reg[19]  ( .G(n16), .D(N57), .Q(data_in[19]) );
  DLH_X1 \data_in_reg[18]  ( .G(n16), .D(N56), .Q(data_in[18]) );
  DLH_X1 \data_in_reg[17]  ( .G(n16), .D(N55), .Q(data_in[17]) );
  DLH_X1 \data_in_reg[16]  ( .G(n16), .D(N54), .Q(data_in[16]) );
  DLH_X1 \data_in_reg[15]  ( .G(n16), .D(N53), .Q(data_in[15]) );
  DLH_X1 \data_in_reg[14]  ( .G(n16), .D(N52), .Q(data_in[14]) );
  DLH_X1 \data_in_reg[13]  ( .G(n16), .D(N51), .Q(data_in[13]) );
  DLH_X1 \data_in_reg[12]  ( .G(n16), .D(N50), .Q(data_in[12]) );
  DLH_X1 \data_in_reg[11]  ( .G(n16), .D(N49), .Q(data_in[11]) );
  DLH_X1 \data_in_reg[10]  ( .G(n16), .D(N48), .Q(data_in[10]) );
  DLH_X1 \data_in_reg[9]  ( .G(n17), .D(N47), .Q(data_in[9]) );
  DLH_X1 \data_in_reg[8]  ( .G(n17), .D(N46), .Q(data_in[8]) );
  DLH_X1 \data_in_reg[7]  ( .G(n17), .D(N44), .Q(data_in[7]) );
  DLH_X1 \data_in_reg[6]  ( .G(n17), .D(N43), .Q(data_in[6]) );
  DLH_X1 \data_in_reg[5]  ( .G(n17), .D(N42), .Q(data_in[5]) );
  DLH_X1 \data_in_reg[4]  ( .G(n17), .D(N41), .Q(data_in[4]) );
  DLH_X1 \data_in_reg[3]  ( .G(n17), .D(N40), .Q(data_in[3]) );
  DLH_X1 \data_in_reg[2]  ( .G(n17), .D(N39), .Q(data_in[2]) );
  DLH_X1 \data_in_reg[1]  ( .G(n17), .D(N38), .Q(data_in[1]) );
  DLH_X1 \data_in_reg[0]  ( .G(n17), .D(N36), .Q(data_in[0]) );
  DLH_X1 \address_reg[23]  ( .G(n19), .D(N61), .Q(address[23]) );
  DLH_X1 \address_reg[22]  ( .G(n19), .D(N60), .Q(address[22]) );
  DLH_X1 \address_reg[21]  ( .G(n19), .D(N59), .Q(address[21]) );
  DLH_X1 \address_reg[20]  ( .G(n19), .D(N58), .Q(address[20]) );
  DLH_X1 \address_reg[19]  ( .G(n19), .D(N57), .Q(address[19]) );
  DLH_X1 \address_reg[18]  ( .G(n19), .D(N56), .Q(address[18]) );
  DLH_X1 \address_reg[17]  ( .G(n19), .D(N55), .Q(address[17]) );
  DLH_X1 \address_reg[16]  ( .G(n19), .D(N54), .Q(address[16]) );
  DLH_X1 \address_reg[15]  ( .G(n19), .D(N53), .Q(address[15]) );
  DLH_X1 \address_reg[14]  ( .G(n19), .D(N52), .Q(address[14]) );
  DLH_X1 \address_reg[13]  ( .G(n19), .D(N51), .Q(address[13]) );
  DLH_X1 \address_reg[12]  ( .G(n20), .D(N50), .Q(address[12]) );
  DLH_X1 \address_reg[11]  ( .G(n20), .D(N49), .Q(address[11]) );
  DLH_X1 \address_reg[10]  ( .G(n20), .D(N48), .Q(address[10]) );
  DLH_X1 \address_reg[9]  ( .G(n20), .D(N47), .Q(address[9]) );
  DLH_X1 \address_reg[8]  ( .G(n20), .D(N46), .Q(address[8]) );
  DLH_X1 \address_reg[7]  ( .G(n20), .D(N44), .Q(address[7]) );
  DLH_X1 \address_reg[6]  ( .G(n20), .D(N43), .Q(address[6]) );
  DLH_X1 \address_reg[5]  ( .G(n20), .D(N42), .Q(address[5]) );
  DLH_X1 \address_reg[4]  ( .G(n20), .D(N41), .Q(address[4]) );
  DLH_X1 \address_reg[3]  ( .G(n20), .D(N40), .Q(address[3]) );
  DLH_X1 \address_reg[2]  ( .G(n20), .D(N39), .Q(address[2]) );
  DLH_X1 \address_reg[1]  ( .G(n21), .D(N38), .Q(address[1]) );
  DLH_X1 \address_reg[0]  ( .G(n21), .D(N36), .Q(address[0]) );
  DLH_X1 enable_reg ( .G(N35), .D(N36), .Q(enable) );
  DLH_X1 \command_reg[7]  ( .G(N37), .D(N44), .Q(command[7]) );
  DLH_X1 \command_reg[6]  ( .G(N37), .D(N43), .Q(command[6]) );
  DLH_X1 \command_reg[5]  ( .G(N37), .D(N42), .Q(command[5]) );
  DLH_X1 \command_reg[4]  ( .G(N37), .D(N41), .Q(command[4]) );
  DLH_X1 \command_reg[3]  ( .G(N37), .D(N40), .Q(command[3]) );
  DLH_X1 \command_reg[2]  ( .G(N37), .D(N39), .Q(command[2]) );
  DLH_X1 \command_reg[1]  ( .G(N37), .D(N38), .Q(command[1]) );
  DLH_X1 \command_reg[0]  ( .G(N37), .D(N36), .Q(command[0]) );
  DLH_X1 \read_data_reg[0]  ( .G(n13), .D(data_out[0]), .Q(read_data[0]) );
  DLH_X1 \read_data_reg[1]  ( .G(n13), .D(data_out[1]), .Q(read_data[1]) );
  DLH_X1 \read_data_reg[2]  ( .G(n13), .D(data_out[2]), .Q(read_data[2]) );
  DLH_X1 \read_data_reg[3]  ( .G(n13), .D(data_out[3]), .Q(read_data[3]) );
  DLH_X1 \read_data_reg[4]  ( .G(n13), .D(data_out[4]), .Q(read_data[4]) );
  DLH_X1 \read_data_reg[5]  ( .G(n13), .D(data_out[5]), .Q(read_data[5]) );
  DLH_X1 \read_data_reg[6]  ( .G(n13), .D(data_out[6]), .Q(read_data[6]) );
  DLH_X1 \read_data_reg[7]  ( .G(n13), .D(data_out[7]), .Q(read_data[7]) );
  DLH_X1 \read_data_reg[8]  ( .G(n13), .D(data_out[8]), .Q(read_data[8]) );
  DLH_X1 \read_data_reg[9]  ( .G(n13), .D(data_out[9]), .Q(read_data[9]) );
  DLH_X1 \read_data_reg[10]  ( .G(n12), .D(data_out[10]), .Q(read_data[10]) );
  DLH_X1 \read_data_reg[11]  ( .G(n12), .D(data_out[11]), .Q(read_data[11]) );
  DLH_X1 \read_data_reg[12]  ( .G(n12), .D(data_out[12]), .Q(read_data[12]) );
  DLH_X1 \read_data_reg[13]  ( .G(n12), .D(data_out[13]), .Q(read_data[13]) );
  DLH_X1 \read_data_reg[14]  ( .G(n12), .D(data_out[14]), .Q(read_data[14]) );
  DLH_X1 \read_data_reg[15]  ( .G(n12), .D(data_out[15]), .Q(read_data[15]) );
  DLH_X1 \read_data_reg[16]  ( .G(n12), .D(data_out[16]), .Q(read_data[16]) );
  DLH_X1 \read_data_reg[17]  ( .G(n12), .D(data_out[17]), .Q(read_data[17]) );
  DLH_X1 \read_data_reg[18]  ( .G(n12), .D(data_out[18]), .Q(read_data[18]) );
  DLH_X1 \read_data_reg[19]  ( .G(n12), .D(data_out[19]), .Q(read_data[19]) );
  DLH_X1 \read_data_reg[20]  ( .G(n12), .D(data_out[20]), .Q(read_data[20]) );
  DLH_X1 \read_data_reg[21]  ( .G(n11), .D(data_out[21]), .Q(read_data[21]) );
  DLH_X1 \read_data_reg[22]  ( .G(n11), .D(data_out[22]), .Q(read_data[22]) );
  DLH_X1 \read_data_reg[23]  ( .G(n11), .D(data_out[23]), .Q(read_data[23]) );
  DLH_X1 \read_data_reg[24]  ( .G(n11), .D(data_out[24]), .Q(read_data[24]) );
  DLH_X1 \read_data_reg[25]  ( .G(n11), .D(data_out[25]), .Q(read_data[25]) );
  DLH_X1 \read_data_reg[26]  ( .G(n11), .D(data_out[26]), .Q(read_data[26]) );
  DLH_X1 \read_data_reg[27]  ( .G(n11), .D(data_out[27]), .Q(read_data[27]) );
  DLH_X1 \read_data_reg[28]  ( .G(n11), .D(data_out[28]), .Q(read_data[28]) );
  DLH_X1 \read_data_reg[29]  ( .G(n11), .D(data_out[29]), .Q(read_data[29]) );
  DLH_X1 \read_data_reg[30]  ( .G(n11), .D(data_out[30]), .Q(read_data[30]) );
  DLH_X1 \read_data_reg[31]  ( .G(n11), .D(data_out[31]), .Q(read_data[31]) );
  NAND3_X1 U46 ( .A1(addr[0]), .A2(n7), .A3(addr[1]), .ZN(n6) );
  NAND3_X1 U47 ( .A1(n7), .A2(n25), .A3(addr[1]), .ZN(n8) );
  NAND3_X1 U48 ( .A1(n7), .A2(n24), .A3(addr[0]), .ZN(n9) );
  NAND3_X1 U49 ( .A1(n25), .A2(n24), .A3(n7), .ZN(n10) );
  BUF_X1 U50 ( .A(N45), .Z(n22) );
  BUF_X1 U51 ( .A(N62), .Z(n18) );
  BUF_X1 U52 ( .A(N71), .Z(n14) );
  NAND2_X1 U53 ( .A1(n23), .A2(n10), .ZN(N35) );
  BUF_X1 U54 ( .A(n14), .Z(n11) );
  BUF_X1 U55 ( .A(n14), .Z(n12) );
  BUF_X1 U56 ( .A(n14), .Z(n13) );
  BUF_X1 U57 ( .A(n22), .Z(n20) );
  BUF_X1 U58 ( .A(n22), .Z(n19) );
  BUF_X1 U59 ( .A(n18), .Z(n16) );
  BUF_X1 U60 ( .A(n18), .Z(n15) );
  BUF_X1 U61 ( .A(n18), .Z(n17) );
  BUF_X1 U62 ( .A(n22), .Z(n21) );
  NOR2_X1 U63 ( .A1(n26), .A2(addr[2]), .ZN(n7) );
  INV_X1 U64 ( .A(we), .ZN(n26) );
  NAND2_X1 U65 ( .A1(n23), .A2(n9), .ZN(N37) );
  NOR4_X1 U66 ( .A1(n5), .A2(addr[0]), .A3(rst), .A4(addr[1]), .ZN(N71) );
  NAND2_X1 U67 ( .A1(re), .A2(addr[2]), .ZN(n5) );
  INV_X2 U68 ( .A(rst), .ZN(n23) );
  AND2_X1 U69 ( .A1(write_data[0]), .A2(n23), .ZN(N36) );
  NAND2_X1 U70 ( .A1(n23), .A2(n8), .ZN(N45) );
  NAND2_X1 U71 ( .A1(n23), .A2(n6), .ZN(N62) );
  AND2_X1 U72 ( .A1(write_data[1]), .A2(n23), .ZN(N38) );
  AND2_X1 U73 ( .A1(write_data[2]), .A2(n23), .ZN(N39) );
  AND2_X1 U74 ( .A1(write_data[3]), .A2(n23), .ZN(N40) );
  AND2_X1 U75 ( .A1(write_data[4]), .A2(n23), .ZN(N41) );
  AND2_X1 U76 ( .A1(write_data[5]), .A2(n23), .ZN(N42) );
  AND2_X1 U77 ( .A1(write_data[6]), .A2(n23), .ZN(N43) );
  AND2_X1 U78 ( .A1(write_data[7]), .A2(n23), .ZN(N44) );
  AND2_X1 U79 ( .A1(write_data[8]), .A2(n23), .ZN(N46) );
  AND2_X1 U80 ( .A1(write_data[9]), .A2(n23), .ZN(N47) );
  AND2_X1 U81 ( .A1(write_data[10]), .A2(n23), .ZN(N48) );
  AND2_X1 U82 ( .A1(write_data[11]), .A2(n23), .ZN(N49) );
  AND2_X1 U83 ( .A1(write_data[12]), .A2(n23), .ZN(N50) );
  AND2_X1 U84 ( .A1(write_data[13]), .A2(n23), .ZN(N51) );
  AND2_X1 U85 ( .A1(write_data[14]), .A2(n23), .ZN(N52) );
  AND2_X1 U86 ( .A1(write_data[15]), .A2(n23), .ZN(N53) );
  AND2_X1 U87 ( .A1(write_data[16]), .A2(n23), .ZN(N54) );
  AND2_X1 U88 ( .A1(write_data[17]), .A2(n23), .ZN(N55) );
  AND2_X1 U89 ( .A1(write_data[18]), .A2(n23), .ZN(N56) );
  AND2_X1 U90 ( .A1(write_data[19]), .A2(n23), .ZN(N57) );
  AND2_X1 U91 ( .A1(write_data[20]), .A2(n23), .ZN(N58) );
  AND2_X1 U92 ( .A1(write_data[21]), .A2(n23), .ZN(N59) );
  AND2_X1 U93 ( .A1(write_data[22]), .A2(n23), .ZN(N60) );
  AND2_X1 U94 ( .A1(write_data[23]), .A2(n23), .ZN(N61) );
  INV_X1 U95 ( .A(addr[1]), .ZN(n24) );
  INV_X1 U96 ( .A(addr[0]), .ZN(n25) );
  AND2_X1 U97 ( .A1(write_data[24]), .A2(n23), .ZN(N63) );
  AND2_X1 U98 ( .A1(write_data[25]), .A2(n23), .ZN(N64) );
  AND2_X1 U99 ( .A1(write_data[26]), .A2(n23), .ZN(N65) );
  AND2_X1 U100 ( .A1(write_data[27]), .A2(n23), .ZN(N66) );
  AND2_X1 U101 ( .A1(write_data[28]), .A2(n23), .ZN(N67) );
  AND2_X1 U102 ( .A1(write_data[29]), .A2(n23), .ZN(N68) );
  AND2_X1 U103 ( .A1(write_data[30]), .A2(n23), .ZN(N69) );
  AND2_X1 U104 ( .A1(write_data[31]), .A2(n23), .ZN(N70) );
  AND3_X1 \uut_master/U46  ( .A1(enable), .A2(\uut_master/n7 ), .A3(
        \uut_master/n41 ), .ZN(\uut_master/n43 ) );
  NOR2_X1 \uut_master/U45  ( .A1(\uut_master/n2 ), .A2(cs), .ZN(
        \uut_master/N17 ) );
  NAND2_X1 \uut_master/U44  ( .A1(\uut_master/n3 ), .A2(\uut_master/n7 ), .ZN(
        cs) );
  NAND3_X1 \uut_master/U43  ( .A1(\uut_master/clock_count ), .A2(
        \uut_master/n7 ), .A3(\uut_master/current_state[0] ), .ZN(sck) );
  NOR2_X1 \uut_master/U42  ( .A1(\uut_master/n5 ), .A2(\uut_master/n40 ), .ZN(
        \uut_master/n76 ) );
  NOR2_X1 \uut_master/U41  ( .A1(\uut_master/n5 ), .A2(\uut_master/n39 ), .ZN(
        \uut_master/n75 ) );
  NOR2_X1 \uut_master/U40  ( .A1(\uut_master/n5 ), .A2(\uut_master/n38 ), .ZN(
        \uut_master/n74 ) );
  NOR2_X1 \uut_master/U39  ( .A1(\uut_master/n5 ), .A2(\uut_master/n37 ), .ZN(
        \uut_master/n73 ) );
  NOR2_X1 \uut_master/U38  ( .A1(\uut_master/n5 ), .A2(\uut_master/n36 ), .ZN(
        \uut_master/n72 ) );
  NOR2_X1 \uut_master/U37  ( .A1(\uut_master/n5 ), .A2(\uut_master/n35 ), .ZN(
        \uut_master/n71 ) );
  NOR2_X1 \uut_master/U36  ( .A1(\uut_master/n5 ), .A2(\uut_master/n34 ), .ZN(
        \uut_master/n70 ) );
  NOR2_X1 \uut_master/U35  ( .A1(\uut_master/n5 ), .A2(\uut_master/n33 ), .ZN(
        \uut_master/n69 ) );
  NOR2_X1 \uut_master/U34  ( .A1(\uut_master/n4 ), .A2(\uut_master/n32 ), .ZN(
        \uut_master/n68 ) );
  NOR2_X1 \uut_master/U33  ( .A1(\uut_master/n4 ), .A2(\uut_master/n31 ), .ZN(
        \uut_master/n67 ) );
  NOR2_X1 \uut_master/U32  ( .A1(\uut_master/n4 ), .A2(\uut_master/n30 ), .ZN(
        \uut_master/n66 ) );
  NOR2_X1 \uut_master/U31  ( .A1(\uut_master/n4 ), .A2(\uut_master/n29 ), .ZN(
        \uut_master/n65 ) );
  NOR2_X1 \uut_master/U30  ( .A1(\uut_master/n4 ), .A2(\uut_master/n28 ), .ZN(
        \uut_master/n64 ) );
  NOR2_X1 \uut_master/U29  ( .A1(\uut_master/n4 ), .A2(\uut_master/n27 ), .ZN(
        \uut_master/n63 ) );
  NOR2_X1 \uut_master/U28  ( .A1(\uut_master/n4 ), .A2(\uut_master/n26 ), .ZN(
        \uut_master/n62 ) );
  NOR2_X1 \uut_master/U27  ( .A1(\uut_master/n4 ), .A2(\uut_master/n25 ), .ZN(
        \uut_master/n61 ) );
  NOR2_X1 \uut_master/U26  ( .A1(\uut_master/n4 ), .A2(\uut_master/n24 ), .ZN(
        \uut_master/n60 ) );
  NOR2_X1 \uut_master/U25  ( .A1(\uut_master/n4 ), .A2(\uut_master/n23 ), .ZN(
        \uut_master/n59 ) );
  NOR2_X1 \uut_master/U24  ( .A1(\uut_master/n4 ), .A2(\uut_master/n22 ), .ZN(
        \uut_master/n58 ) );
  NOR2_X1 \uut_master/U23  ( .A1(\uut_master/n4 ), .A2(\uut_master/n21 ), .ZN(
        \uut_master/n57 ) );
  NOR2_X1 \uut_master/U22  ( .A1(\uut_master/n5 ), .A2(\uut_master/n20 ), .ZN(
        \uut_master/n56 ) );
  NOR2_X1 \uut_master/U21  ( .A1(\uut_master/n5 ), .A2(\uut_master/n19 ), .ZN(
        \uut_master/n55 ) );
  NOR2_X1 \uut_master/U20  ( .A1(\uut_master/n5 ), .A2(\uut_master/n18 ), .ZN(
        \uut_master/n54 ) );
  NOR2_X1 \uut_master/U19  ( .A1(\uut_master/n5 ), .A2(\uut_master/n17 ), .ZN(
        \uut_master/n53 ) );
  NOR2_X1 \uut_master/U18  ( .A1(rst), .A2(\uut_master/n16 ), .ZN(
        \uut_master/n52 ) );
  NOR2_X1 \uut_master/U17  ( .A1(rst), .A2(\uut_master/n15 ), .ZN(
        \uut_master/n51 ) );
  NOR2_X1 \uut_master/U16  ( .A1(rst), .A2(\uut_master/n14 ), .ZN(
        \uut_master/n50 ) );
  NOR2_X1 \uut_master/U15  ( .A1(rst), .A2(\uut_master/n13 ), .ZN(
        \uut_master/n49 ) );
  NOR2_X1 \uut_master/U14  ( .A1(rst), .A2(\uut_master/n12 ), .ZN(
        \uut_master/n48 ) );
  NOR2_X1 \uut_master/U13  ( .A1(rst), .A2(\uut_master/n11 ), .ZN(
        \uut_master/n47 ) );
  NOR2_X1 \uut_master/U12  ( .A1(rst), .A2(\uut_master/n10 ), .ZN(
        \uut_master/n46 ) );
  NOR2_X1 \uut_master/U11  ( .A1(rst), .A2(\uut_master/n9 ), .ZN(
        \uut_master/n45 ) );
  INV_X1 \uut_master/U10  ( .A(rst), .ZN(\uut_master/n8 ) );
  BUF_X1 \uut_master/U9  ( .A(\uut_master/n8 ), .Z(\uut_master/n7 ) );
  INV_X1 \uut_master/U8  ( .A(\uut_master/n6 ), .ZN(\uut_master/n5 ) );
  INV_X1 \uut_master/U6  ( .A(\uut_master/n6 ), .ZN(\uut_master/n4 ) );
  INV_X1 \uut_master/U5  ( .A(\uut_master/n41 ), .ZN(\uut_master/n3 ) );
  BUF_X1 \uut_master/U4  ( .A(\uut_master/n8 ), .Z(\uut_master/n6 ) );
  INV_X1 \uut_master/U3  ( .A(\uut_master/n1 ), .ZN(\uut_master/n2 ) );
  DFF_X1 \uut_master/clock_count_reg  ( .D(\uut_master/N17 ), .CK(clk), .Q(
        \uut_master/clock_count ), .QN(\uut_master/n1 ) );
  DFF_X1 \uut_master/current_state_reg[0]  ( .D(\uut_master/n43 ), .CK(clk), 
        .Q(\uut_master/current_state[0] ), .QN(\uut_master/n41 ) );
  DFF_X1 \uut_master/data_in_reg[31]  ( .D(\uut_master/n76 ), .CK(clk), .Q(
        data_out[31]), .QN(\uut_master/n40 ) );
  DFF_X1 \uut_master/data_in_reg[30]  ( .D(\uut_master/n75 ), .CK(clk), .Q(
        data_out[30]), .QN(\uut_master/n39 ) );
  DFF_X1 \uut_master/data_in_reg[29]  ( .D(\uut_master/n74 ), .CK(clk), .Q(
        data_out[29]), .QN(\uut_master/n38 ) );
  DFF_X1 \uut_master/data_in_reg[28]  ( .D(\uut_master/n73 ), .CK(clk), .Q(
        data_out[28]), .QN(\uut_master/n37 ) );
  DFF_X1 \uut_master/data_in_reg[27]  ( .D(\uut_master/n72 ), .CK(clk), .Q(
        data_out[27]), .QN(\uut_master/n36 ) );
  DFF_X1 \uut_master/data_in_reg[26]  ( .D(\uut_master/n71 ), .CK(clk), .Q(
        data_out[26]), .QN(\uut_master/n35 ) );
  DFF_X1 \uut_master/data_in_reg[25]  ( .D(\uut_master/n70 ), .CK(clk), .Q(
        data_out[25]), .QN(\uut_master/n34 ) );
  DFF_X1 \uut_master/data_in_reg[24]  ( .D(\uut_master/n69 ), .CK(clk), .Q(
        data_out[24]), .QN(\uut_master/n33 ) );
  DFF_X1 \uut_master/data_in_reg[23]  ( .D(\uut_master/n68 ), .CK(clk), .Q(
        data_out[23]), .QN(\uut_master/n32 ) );
  DFF_X1 \uut_master/data_in_reg[22]  ( .D(\uut_master/n67 ), .CK(clk), .Q(
        data_out[22]), .QN(\uut_master/n31 ) );
  DFF_X1 \uut_master/data_in_reg[21]  ( .D(\uut_master/n66 ), .CK(clk), .Q(
        data_out[21]), .QN(\uut_master/n30 ) );
  DFF_X1 \uut_master/data_in_reg[20]  ( .D(\uut_master/n65 ), .CK(clk), .Q(
        data_out[20]), .QN(\uut_master/n29 ) );
  DFF_X1 \uut_master/data_in_reg[19]  ( .D(\uut_master/n64 ), .CK(clk), .Q(
        data_out[19]), .QN(\uut_master/n28 ) );
  DFF_X1 \uut_master/data_in_reg[18]  ( .D(\uut_master/n63 ), .CK(clk), .Q(
        data_out[18]), .QN(\uut_master/n27 ) );
  DFF_X1 \uut_master/data_in_reg[17]  ( .D(\uut_master/n62 ), .CK(clk), .Q(
        data_out[17]), .QN(\uut_master/n26 ) );
  DFF_X1 \uut_master/data_in_reg[16]  ( .D(\uut_master/n61 ), .CK(clk), .Q(
        data_out[16]), .QN(\uut_master/n25 ) );
  DFF_X1 \uut_master/data_in_reg[15]  ( .D(\uut_master/n60 ), .CK(clk), .Q(
        data_out[15]), .QN(\uut_master/n24 ) );
  DFF_X1 \uut_master/data_in_reg[14]  ( .D(\uut_master/n59 ), .CK(clk), .Q(
        data_out[14]), .QN(\uut_master/n23 ) );
  DFF_X1 \uut_master/data_in_reg[13]  ( .D(\uut_master/n58 ), .CK(clk), .Q(
        data_out[13]), .QN(\uut_master/n22 ) );
  DFF_X1 \uut_master/data_in_reg[12]  ( .D(\uut_master/n57 ), .CK(clk), .Q(
        data_out[12]), .QN(\uut_master/n21 ) );
  DFF_X1 \uut_master/data_in_reg[11]  ( .D(\uut_master/n56 ), .CK(clk), .Q(
        data_out[11]), .QN(\uut_master/n20 ) );
  DFF_X1 \uut_master/data_in_reg[10]  ( .D(\uut_master/n55 ), .CK(clk), .Q(
        data_out[10]), .QN(\uut_master/n19 ) );
  DFF_X1 \uut_master/data_in_reg[9]  ( .D(\uut_master/n54 ), .CK(clk), .Q(
        data_out[9]), .QN(\uut_master/n18 ) );
  DFF_X1 \uut_master/data_in_reg[8]  ( .D(\uut_master/n53 ), .CK(clk), .Q(
        data_out[8]), .QN(\uut_master/n17 ) );
  DFF_X1 \uut_master/data_in_reg[7]  ( .D(\uut_master/n52 ), .CK(clk), .Q(
        data_out[7]), .QN(\uut_master/n16 ) );
  DFF_X1 \uut_master/data_in_reg[6]  ( .D(\uut_master/n51 ), .CK(clk), .Q(
        data_out[6]), .QN(\uut_master/n15 ) );
  DFF_X1 \uut_master/data_in_reg[5]  ( .D(\uut_master/n50 ), .CK(clk), .Q(
        data_out[5]), .QN(\uut_master/n14 ) );
  DFF_X1 \uut_master/data_in_reg[4]  ( .D(\uut_master/n49 ), .CK(clk), .Q(
        data_out[4]), .QN(\uut_master/n13 ) );
  DFF_X1 \uut_master/data_in_reg[3]  ( .D(\uut_master/n48 ), .CK(clk), .Q(
        data_out[3]), .QN(\uut_master/n12 ) );
  DFF_X1 \uut_master/data_in_reg[2]  ( .D(\uut_master/n47 ), .CK(clk), .Q(
        data_out[2]), .QN(\uut_master/n11 ) );
  DFF_X1 \uut_master/data_in_reg[1]  ( .D(\uut_master/n46 ), .CK(clk), .Q(
        data_out[1]), .QN(\uut_master/n10 ) );
  DFF_X1 \uut_master/data_in_reg[0]  ( .D(\uut_master/n45 ), .CK(clk), .Q(
        data_out[0]), .QN(\uut_master/n9 ) );
  AOI21_X1 \uut_slave/U178  ( .B1(\uut_slave/n250 ), .B2(\uut_slave/n249 ), 
        .A(\uut_slave/n9 ), .ZN(\uut_slave/data_count_gt_32 ) );
  NOR3_X1 \uut_slave/U177  ( .A1(\uut_slave/n114 ), .A2(\uut_slave/n97 ), .A3(
        \uut_slave/n92 ), .ZN(\uut_slave/n249 ) );
  NOR2_X1 \uut_slave/U176  ( .A1(\uut_slave/n96 ), .A2(\uut_slave/n11 ), .ZN(
        \uut_slave/n250 ) );
  OAI21_X1 \uut_slave/U175  ( .B1(\uut_slave/n17 ), .B2(\uut_slave/n90 ), .A(
        \uut_slave/n247 ), .ZN(\uut_slave/N172 ) );
  NAND3_X1 \uut_slave/U174  ( .A1(\uut_slave/current_state [0]), .A2(
        \uut_slave/current_state [1]), .A3(\uut_slave/n101 ), .ZN(
        \uut_slave/n247 ) );
  NAND2_X1 \uut_slave/U173  ( .A1(\uut_slave/n90 ), .A2(\uut_slave/n246 ), 
        .ZN(\uut_slave/N173 ) );
  OAI21_X1 \uut_slave/U172  ( .B1(\uut_slave/current_state [1]), .B2(
        \uut_slave/n91 ), .A(\uut_slave/n101 ), .ZN(\uut_slave/n246 ) );
  OAI33_X1 \uut_slave/U171  ( .A1(\uut_slave/n222 ), .A2(\uut_slave/n11 ), 
        .A3(\uut_slave/n245 ), .B1(\uut_slave/n16 ), .B2(\uut_slave/n201 ), 
        .B3(\uut_slave/n248 ), .ZN(\uut_slave/n199 ) );
  OAI33_X1 \uut_slave/U170  ( .A1(\uut_slave/n222 ), .A2(\uut_slave/n244 ), 
        .A3(\uut_slave/n245 ), .B1(\uut_slave/n15 ), .B2(\uut_slave/n201 ), 
        .B3(\uut_slave/n248 ), .ZN(\uut_slave/n198 ) );
  XOR2_X1 \uut_slave/U169  ( .A(\uut_slave/n16 ), .B(\uut_slave/n10 ), .Z(
        \uut_slave/n244 ) );
  OAI33_X1 \uut_slave/U168  ( .A1(\uut_slave/n245 ), .A2(\uut_slave/n222 ), 
        .A3(\uut_slave/n243 ), .B1(\uut_slave/n8 ), .B2(\uut_slave/n201 ), 
        .B3(\uut_slave/n248 ), .ZN(\uut_slave/n197 ) );
  OAI21_X1 \uut_slave/U167  ( .B1(\uut_slave/n95 ), .B2(\uut_slave/n242 ), .A(
        \uut_slave/n241 ), .ZN(\uut_slave/n196 ) );
  NAND3_X1 \uut_slave/U166  ( .A1(\uut_slave/n240 ), .A2(\uut_slave/n4 ), .A3(
        \uut_slave/n115 ), .ZN(\uut_slave/n241 ) );
  NOR3_X1 \uut_slave/U165  ( .A1(\uut_slave/n15 ), .A2(\uut_slave/n16 ), .A3(
        \uut_slave/n14 ), .ZN(\uut_slave/n239 ) );
  OAI33_X1 \uut_slave/U164  ( .A1(\uut_slave/n90 ), .A2(\uut_slave/n7 ), .A3(
        \uut_slave/n115 ), .B1(\uut_slave/n238 ), .B2(\uut_slave/n245 ), .B3(
        \uut_slave/n223 ), .ZN(\uut_slave/n195 ) );
  OAI21_X1 \uut_slave/U163  ( .B1(\uut_slave/n9 ), .B2(\uut_slave/n242 ), .A(
        \uut_slave/n237 ), .ZN(\uut_slave/n194 ) );
  NAND3_X1 \uut_slave/U162  ( .A1(\uut_slave/n236 ), .A2(\uut_slave/n115 ), 
        .A3(\uut_slave/n204 ), .ZN(\uut_slave/n237 ) );
  NAND2_X1 \uut_slave/U161  ( .A1(\uut_slave/n205 ), .A2(\uut_slave/n121 ), 
        .ZN(\uut_slave/n245 ) );
  NAND2_X1 \uut_slave/U160  ( .A1(\uut_slave/n94 ), .A2(\uut_slave/n223 ), 
        .ZN(\uut_slave/n242 ) );
  OAI22_X1 \uut_slave/U159  ( .A1(\uut_slave/n253 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n25 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n193 ) );
  OAI22_X1 \uut_slave/U158  ( .A1(\uut_slave/n25 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n24 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n192 ) );
  OAI22_X1 \uut_slave/U157  ( .A1(\uut_slave/n24 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n23 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n191 ) );
  OAI22_X1 \uut_slave/U156  ( .A1(\uut_slave/n23 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n22 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n190 ) );
  OAI22_X1 \uut_slave/U155  ( .A1(\uut_slave/n22 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n21 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n189 ) );
  OAI22_X1 \uut_slave/U154  ( .A1(\uut_slave/n21 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n20 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n188 ) );
  OAI22_X1 \uut_slave/U153  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n19 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n187 ) );
  OAI22_X1 \uut_slave/U152  ( .A1(\uut_slave/n19 ), .A2(\uut_slave/n235 ), 
        .B1(\uut_slave/n18 ), .B2(\uut_slave/n234 ), .ZN(\uut_slave/n186 ) );
  NAND2_X1 \uut_slave/U151  ( .A1(\uut_slave/n234 ), .A2(\uut_slave/n113 ), 
        .ZN(\uut_slave/n235 ) );
  INV_X1 \uut_slave/U150  ( .A(\uut_slave/n233 ), .ZN(\uut_slave/n234 ) );
  OAI21_X1 \uut_slave/U149  ( .B1(\uut_slave/n112 ), .B2(\uut_slave/n90 ), .A(
        \uut_slave/n232 ), .ZN(\uut_slave/n233 ) );
  OAI22_X1 \uut_slave/U148  ( .A1(\uut_slave/n57 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n89 ), .B2(\uut_slave/n209 ), .ZN(\uut_slave/n153 ) );
  OAI222_X1 \uut_slave/U147  ( .A1(\uut_slave/n56 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n89 ), .B2(\uut_slave/n208 ), .C1(\uut_slave/n88 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n152 ) );
  OAI222_X1 \uut_slave/U146  ( .A1(\uut_slave/n55 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n88 ), .B2(\uut_slave/n208 ), .C1(\uut_slave/n87 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n151 ) );
  OAI222_X1 \uut_slave/U145  ( .A1(\uut_slave/n54 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n87 ), .B2(\uut_slave/n208 ), .C1(\uut_slave/n86 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n150 ) );
  OAI222_X1 \uut_slave/U144  ( .A1(\uut_slave/n53 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n86 ), .B2(\uut_slave/n208 ), .C1(\uut_slave/n85 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n149 ) );
  OAI222_X1 \uut_slave/U143  ( .A1(\uut_slave/n52 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n85 ), .B2(\uut_slave/n208 ), .C1(\uut_slave/n84 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n148 ) );
  OAI222_X1 \uut_slave/U142  ( .A1(\uut_slave/n51 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n84 ), .B2(\uut_slave/n208 ), .C1(\uut_slave/n83 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n147 ) );
  OAI222_X1 \uut_slave/U141  ( .A1(\uut_slave/n50 ), .A2(\uut_slave/n213 ), 
        .B1(\uut_slave/n83 ), .B2(\uut_slave/n208 ), .C1(\uut_slave/n82 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n146 ) );
  OAI222_X1 \uut_slave/U140  ( .A1(\uut_slave/n49 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n82 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n81 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n145 ) );
  OAI222_X1 \uut_slave/U139  ( .A1(\uut_slave/n48 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n81 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n80 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n144 ) );
  OAI222_X1 \uut_slave/U138  ( .A1(\uut_slave/n47 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n80 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n79 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n143 ) );
  OAI222_X1 \uut_slave/U137  ( .A1(\uut_slave/n46 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n79 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n78 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n142 ) );
  OAI222_X1 \uut_slave/U136  ( .A1(\uut_slave/n45 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n78 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n77 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n141 ) );
  OAI222_X1 \uut_slave/U135  ( .A1(\uut_slave/n44 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n77 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n76 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n140 ) );
  OAI222_X1 \uut_slave/U134  ( .A1(\uut_slave/n43 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n76 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n75 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n139 ) );
  OAI222_X1 \uut_slave/U133  ( .A1(\uut_slave/n42 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n75 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n74 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n138 ) );
  OAI222_X1 \uut_slave/U132  ( .A1(\uut_slave/n41 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n74 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n73 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n137 ) );
  OAI222_X1 \uut_slave/U131  ( .A1(\uut_slave/n40 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n73 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n72 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n136 ) );
  OAI222_X1 \uut_slave/U130  ( .A1(\uut_slave/n39 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n72 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n71 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n135 ) );
  OAI222_X1 \uut_slave/U129  ( .A1(\uut_slave/n38 ), .A2(\uut_slave/n212 ), 
        .B1(\uut_slave/n71 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n70 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n134 ) );
  OAI222_X1 \uut_slave/U128  ( .A1(\uut_slave/n37 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n70 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n69 ), 
        .C2(\uut_slave/n210 ), .ZN(\uut_slave/n133 ) );
  OAI222_X1 \uut_slave/U127  ( .A1(\uut_slave/n36 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n69 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n68 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n132 ) );
  OAI222_X1 \uut_slave/U126  ( .A1(\uut_slave/n35 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n68 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n67 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n131 ) );
  OAI222_X1 \uut_slave/U125  ( .A1(\uut_slave/n34 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n67 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n66 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n130 ) );
  OAI222_X1 \uut_slave/U123  ( .A1(\uut_slave/n33 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n66 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n65 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n129 ) );
  OAI222_X1 \uut_slave/U122  ( .A1(\uut_slave/n32 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n65 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n64 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n128 ) );
  OAI222_X1 \uut_slave/U121  ( .A1(\uut_slave/n31 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n64 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n63 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n127 ) );
  OAI222_X1 \uut_slave/U120  ( .A1(\uut_slave/n30 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n63 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n62 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n126 ) );
  OAI222_X1 \uut_slave/U119  ( .A1(\uut_slave/n29 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n62 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n61 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n125 ) );
  OAI222_X1 \uut_slave/U118  ( .A1(\uut_slave/n28 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n61 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n60 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n124 ) );
  OAI222_X1 \uut_slave/U117  ( .A1(\uut_slave/n27 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n60 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n59 ), 
        .C2(\uut_slave/n230 ), .ZN(\uut_slave/n123 ) );
  OAI222_X1 \uut_slave/U116  ( .A1(\uut_slave/n26 ), .A2(\uut_slave/n211 ), 
        .B1(\uut_slave/n59 ), .B2(\uut_slave/n229 ), .C1(\uut_slave/n58 ), 
        .C2(\uut_slave/n209 ), .ZN(\uut_slave/n122 ) );
  NAND3_X1 \uut_slave/U115  ( .A1(\uut_slave/n99 ), .A2(\uut_slave/n113 ), 
        .A3(\uut_slave/n209 ), .ZN(\uut_slave/n229 ) );
  NAND3_X1 \uut_slave/U114  ( .A1(\uut_slave/n252 ), .A2(\uut_slave/n113 ), 
        .A3(\uut_slave/n209 ), .ZN(\uut_slave/n231 ) );
  OAI21_X1 \uut_slave/U113  ( .B1(\uut_slave/n100 ), .B2(\uut_slave/n228 ), 
        .A(\uut_slave/n113 ), .ZN(\uut_slave/n230 ) );
  NOR3_X1 \uut_slave/U112  ( .A1(\uut_slave/n98 ), .A2(\uut_slave/n222 ), .A3(
        \uut_slave/n90 ), .ZN(\uut_slave/N39 ) );
  NAND2_X1 \uut_slave/U111  ( .A1(\uut_slave/n228 ), .A2(\uut_slave/n113 ), 
        .ZN(\uut_slave/n232 ) );
  NAND2_X1 \uut_slave/U110  ( .A1(\uut_slave/n91 ), .A2(
        \uut_slave/current_state [1]), .ZN(\uut_slave/n228 ) );
  OAI21_X1 \uut_slave/U109  ( .B1(\uut_slave/n102 ), .B2(\uut_slave/n107 ), 
        .A(\uut_slave/n94 ), .ZN(\uut_slave/n225 ) );
  NOR4_X1 \uut_slave/U108  ( .A1(\uut_slave/n224 ), .A2(\uut_slave/n117 ), 
        .A3(\uut_slave/n24 ), .A4(\uut_slave/n25 ), .ZN(miso) );
  NAND4_X1 \uut_slave/U107  ( .A1(\uut_slave/data_out[31] ), .A2(
        \uut_slave/n206 ), .A3(\uut_slave/n118 ), .A4(\uut_slave/n94 ), .ZN(
        \uut_slave/n224 ) );
  BUF_X2 \uut_slave/U106  ( .A(\uut_slave/n223 ), .Z(\uut_slave/n222 ) );
  CLKBUF_X1 \uut_slave/U105  ( .A(\uut_slave/n222 ), .Z(\uut_slave/n207 ) );
  AND2_X1 \uut_slave/U104  ( .A1(\uut_slave/n94 ), .A2(\uut_slave/n121 ), .ZN(
        \uut_slave/n204 ) );
  AND3_X1 \uut_slave/U103  ( .A1(\uut_slave/data_count [3]), .A2(
        \uut_slave/data_count [2]), .A3(\uut_slave/data_count [4]), .ZN(
        \uut_slave/n203 ) );
  NAND3_X1 \uut_slave/U102  ( .A1(\uut_slave/n203 ), .A2(\uut_slave/n6 ), .A3(
        \uut_slave/data_count [1]), .ZN(\uut_slave/n202 ) );
  XNOR2_X1 \uut_slave/U101  ( .A(\uut_slave/n202 ), .B(\uut_slave/n206 ), .ZN(
        \uut_slave/n236 ) );
  INV_X1 \uut_slave/U100  ( .A(sck), .ZN(\uut_slave/n223 ) );
  XNOR2_X1 \uut_slave/U99  ( .A(\uut_slave/n239 ), .B(\uut_slave/n95 ), .ZN(
        \uut_slave/n240 ) );
  OAI21_X1 \uut_slave/U98  ( .B1(\uut_slave/n114 ), .B2(\uut_slave/n96 ), .A(
        \uut_slave/n102 ), .ZN(\uut_slave/n99 ) );
  AND4_X1 \uut_slave/U97  ( .A1(\uut_slave/n93 ), .A2(
        \uut_slave/data_count [3]), .A3(\uut_slave/data_count [1]), .A4(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n200 ) );
  NOR2_X1 \uut_slave/U96  ( .A1(\uut_slave/n12 ), .A2(\uut_slave/n13 ), .ZN(
        \uut_slave/n226 ) );
  NAND4_X1 \uut_slave/U95  ( .A1(\uut_slave/n227 ), .A2(\uut_slave/n226 ), 
        .A3(\uut_slave/data_count [0]), .A4(\uut_slave/data_count [1]), .ZN(
        \uut_slave/n121 ) );
  NOR2_X1 \uut_slave/U94  ( .A1(\uut_slave/n14 ), .A2(\uut_slave/n251 ), .ZN(
        \uut_slave/n227 ) );
  CLKBUF_X1 \uut_slave/U93  ( .A(\uut_slave/n115 ), .Z(\uut_slave/n120 ) );
  INV_X1 \uut_slave/U92  ( .A(\uut_slave/n116 ), .ZN(\uut_slave/n119 ) );
  AND2_X1 \uut_slave/U91  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n9 ), .ZN(
        \uut_slave/n107 ) );
  CLKBUF_X1 \uut_slave/U90  ( .A(\uut_slave/data_count [2]), .Z(
        \uut_slave/n114 ) );
  XNOR2_X1 \uut_slave/U89  ( .A(\uut_slave/n200 ), .B(\uut_slave/n97 ), .ZN(
        \uut_slave/n238 ) );
  INV_X1 \uut_slave/U88  ( .A(1'b0), .ZN(\uut_slave/n253 ) );
  NAND2_X1 \uut_slave/U87  ( .A1(\uut_slave/n7 ), .A2(\uut_slave/n95 ), .ZN(
        \uut_slave/n109 ) );
  AOI21_X1 \uut_slave/U86  ( .B1(\uut_slave/data_count_gt_32 ), .B2(
        \uut_slave/n206 ), .A(\uut_slave/n252 ), .ZN(\uut_slave/n100 ) );
  NOR2_X1 \uut_slave/U85  ( .A1(\uut_slave/n109 ), .A2(\uut_slave/n206 ), .ZN(
        \uut_slave/n102 ) );
  OAI22_X1 \uut_slave/U84  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n57 ), .B1(
        \uut_slave/n218 ), .B2(\uut_slave/n253 ), .ZN(\uut_slave/n185 ) );
  NOR3_X1 \uut_slave/U83  ( .A1(\uut_slave/n20 ), .A2(\uut_slave/n19 ), .A3(
        \uut_slave/n18 ), .ZN(\uut_slave/n118 ) );
  OAI22_X1 \uut_slave/U82  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n56 ), .B1(
        \uut_slave/n57 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n183 ) );
  OAI22_X1 \uut_slave/U81  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n55 ), .B1(
        \uut_slave/n56 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n182 ) );
  OAI22_X1 \uut_slave/U80  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n54 ), .B1(
        \uut_slave/n55 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n181 ) );
  OAI22_X1 \uut_slave/U79  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n53 ), .B1(
        \uut_slave/n54 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n180 ) );
  OAI22_X1 \uut_slave/U78  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n52 ), .B1(
        \uut_slave/n53 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n179 ) );
  OAI22_X1 \uut_slave/U77  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n51 ), .B1(
        \uut_slave/n52 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n178 ) );
  OAI22_X1 \uut_slave/U76  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n50 ), .B1(
        \uut_slave/n51 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n177 ) );
  OAI22_X1 \uut_slave/U75  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n49 ), .B1(
        \uut_slave/n50 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n176 ) );
  OAI22_X1 \uut_slave/U74  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n48 ), .B1(
        \uut_slave/n49 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n175 ) );
  OAI22_X1 \uut_slave/U73  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n47 ), .B1(
        \uut_slave/n48 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n174 ) );
  OAI22_X1 \uut_slave/U72  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n46 ), .B1(
        \uut_slave/n47 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n173 ) );
  OAI22_X1 \uut_slave/U71  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n45 ), .B1(
        \uut_slave/n46 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n172 ) );
  OAI22_X1 \uut_slave/U70  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n44 ), .B1(
        \uut_slave/n45 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n171 ) );
  OAI22_X1 \uut_slave/U69  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n43 ), .B1(
        \uut_slave/n44 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n170 ) );
  OAI22_X1 \uut_slave/U68  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n42 ), .B1(
        \uut_slave/n43 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n169 ) );
  OAI22_X1 \uut_slave/U67  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n41 ), .B1(
        \uut_slave/n42 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n168 ) );
  OAI22_X1 \uut_slave/U66  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n40 ), .B1(
        \uut_slave/n41 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n167 ) );
  OAI22_X1 \uut_slave/U65  ( .A1(\uut_slave/n220 ), .A2(\uut_slave/n39 ), .B1(
        \uut_slave/n40 ), .B2(\uut_slave/n217 ), .ZN(\uut_slave/n166 ) );
  OAI22_X1 \uut_slave/U64  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n38 ), .B1(
        \uut_slave/n39 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n165 ) );
  OAI22_X1 \uut_slave/U63  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n37 ), .B1(
        \uut_slave/n38 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n164 ) );
  OAI22_X1 \uut_slave/U62  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n36 ), .B1(
        \uut_slave/n37 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n163 ) );
  OAI22_X1 \uut_slave/U61  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n35 ), .B1(
        \uut_slave/n36 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n162 ) );
  OAI22_X1 \uut_slave/U60  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n34 ), .B1(
        \uut_slave/n35 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n161 ) );
  OAI22_X1 \uut_slave/U59  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n33 ), .B1(
        \uut_slave/n34 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n160 ) );
  OAI22_X1 \uut_slave/U58  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n32 ), .B1(
        \uut_slave/n33 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n159 ) );
  OAI22_X1 \uut_slave/U57  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n31 ), .B1(
        \uut_slave/n32 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n158 ) );
  OAI22_X1 \uut_slave/U56  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n30 ), .B1(
        \uut_slave/n31 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n157 ) );
  OAI22_X1 \uut_slave/U55  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n29 ), .B1(
        \uut_slave/n30 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n156 ) );
  OAI22_X1 \uut_slave/U54  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n28 ), .B1(
        \uut_slave/n29 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n155 ) );
  OAI22_X1 \uut_slave/U53  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n27 ), .B1(
        \uut_slave/n28 ), .B2(\uut_slave/n218 ), .ZN(\uut_slave/n184 ) );
  OAI22_X1 \uut_slave/U52  ( .A1(\uut_slave/n219 ), .A2(\uut_slave/n26 ), .B1(
        \uut_slave/n27 ), .B2(\uut_slave/n216 ), .ZN(\uut_slave/n154 ) );
  NOR2_X1 \uut_slave/U51  ( .A1(\uut_slave/n206 ), .A2(\uut_slave/n107 ), .ZN(
        \uut_slave/n112 ) );
  AND2_X1 \uut_slave/U50  ( .A1(\uut_slave/data_count [1]), .A2(
        \uut_slave/data_count [0]), .ZN(\uut_slave/n103 ) );
  XNOR2_X1 \uut_slave/U49  ( .A(\uut_slave/n103 ), .B(\uut_slave/n114 ), .ZN(
        \uut_slave/n243 ) );
  BUF_X1 \uut_slave/U48  ( .A(\uut_slave/n230 ), .Z(\uut_slave/n210 ) );
  BUF_X1 \uut_slave/U47  ( .A(\uut_slave/n230 ), .Z(\uut_slave/n209 ) );
  INV_X1 \uut_slave/U46  ( .A(\uut_slave/n99 ), .ZN(\uut_slave/n252 ) );
  NOR2_X1 \uut_slave/U45  ( .A1(cs), .A2(\uut_slave/n111 ), .ZN(
        \uut_slave/n101 ) );
  BUF_X1 \uut_slave/U44  ( .A(sck), .Z(\uut_slave/n201 ) );
  BUF_X1 \uut_slave/U43  ( .A(\uut_slave/n229 ), .Z(\uut_slave/n208 ) );
  BUF_X1 \uut_slave/U42  ( .A(\uut_slave/n3 ), .Z(\uut_slave/n221 ) );
  BUF_X1 \uut_slave/U41  ( .A(\uut_slave/n3 ), .Z(\uut_slave/n220 ) );
  BUF_X1 \uut_slave/U40  ( .A(\uut_slave/n3 ), .Z(\uut_slave/n219 ) );
  BUF_X1 \uut_slave/U39  ( .A(rst), .Z(\uut_slave/n111 ) );
  INV_X1 \uut_slave/U38  ( .A(\uut_slave/n111 ), .ZN(\uut_slave/n113 ) );
  BUF_X1 \uut_slave/U37  ( .A(\uut_slave/n214 ), .Z(\uut_slave/n213 ) );
  BUF_X1 \uut_slave/U36  ( .A(\uut_slave/n214 ), .Z(\uut_slave/n212 ) );
  BUF_X1 \uut_slave/U35  ( .A(\uut_slave/n214 ), .Z(\uut_slave/n211 ) );
  BUF_X1 \uut_slave/U34  ( .A(\uut_slave/n207 ), .Z(\uut_slave/n105 ) );
  NAND2_X1 \uut_slave/U33  ( .A1(\uut_slave/n221 ), .A2(\uut_slave/n113 ), 
        .ZN(\uut_slave/n104 ) );
  BUF_X1 \uut_slave/U32  ( .A(\uut_slave/n215 ), .Z(\uut_slave/n218 ) );
  BUF_X1 \uut_slave/U31  ( .A(\uut_slave/n215 ), .Z(\uut_slave/n217 ) );
  BUF_X1 \uut_slave/U30  ( .A(\uut_slave/n215 ), .Z(\uut_slave/n216 ) );
  BUF_X1 \uut_slave/U29  ( .A(\uut_slave/n105 ), .Z(\uut_slave/n110 ) );
  INV_X1 \uut_slave/U28  ( .A(\uut_slave/n108 ), .ZN(\uut_slave/n106 ) );
  BUF_X1 \uut_slave/U27  ( .A(\uut_slave/n231 ), .Z(\uut_slave/n214 ) );
  BUF_X1 \uut_slave/U26  ( .A(\uut_slave/n104 ), .Z(\uut_slave/n215 ) );
  BUF_X1 \uut_slave/U25  ( .A(\uut_slave/n105 ), .Z(\uut_slave/n108 ) );
  CLKBUF_X1 \uut_slave/U24  ( .A(\uut_slave/n121 ), .Z(\uut_slave/n98 ) );
  BUF_X1 \uut_slave/U23  ( .A(sck), .Z(\uut_slave/n115 ) );
  CLKBUF_X1 \uut_slave/U22  ( .A(\uut_slave/n2 ), .Z(\uut_slave/n97 ) );
  CLKBUF_X1 \uut_slave/U21  ( .A(\uut_slave/n10 ), .Z(\uut_slave/n96 ) );
  INV_X1 \uut_slave/U20  ( .A(\uut_slave/n14 ), .ZN(\uut_slave/n93 ) );
  BUF_X1 \uut_slave/U19  ( .A(\uut_slave/n13 ), .Z(\uut_slave/n95 ) );
  INV_X1 \uut_slave/U18  ( .A(\uut_slave/n95 ), .ZN(\uut_slave/n92 ) );
  NAND3_X1 \uut_slave/U17  ( .A1(\uut_slave/n91 ), .A2(\uut_slave/n113 ), .A3(
        \uut_slave/current_state [1]), .ZN(\uut_slave/n248 ) );
  NAND3_X1 \uut_slave/U16  ( .A1(\uut_slave/n91 ), .A2(\uut_slave/n113 ), .A3(
        \uut_slave/current_state [1]), .ZN(\uut_slave/n90 ) );
  CLKBUF_X1 \uut_slave/U15  ( .A(\uut_slave/n6 ), .Z(\uut_slave/n11 ) );
  INV_X1 \uut_slave/U14  ( .A(\uut_slave/n15 ), .ZN(\uut_slave/n10 ) );
  CLKBUF_X1 \uut_slave/U13  ( .A(\uut_slave/n251 ), .Z(\uut_slave/n9 ) );
  INV_X1 \uut_slave/U12  ( .A(\uut_slave/n5 ), .ZN(\uut_slave/n8 ) );
  AND3_X1 \uut_slave/U11  ( .A1(\uut_slave/n91 ), .A2(\uut_slave/n113 ), .A3(
        \uut_slave/n119 ), .ZN(\uut_slave/n94 ) );
  BUF_X1 \uut_slave/U10  ( .A(\uut_slave/data_count [0]), .Z(\uut_slave/n6 )
         );
  NOR3_X1 \uut_slave/U9  ( .A1(\uut_slave/current_state [0]), .A2(
        \uut_slave/n111 ), .A3(\uut_slave/n116 ), .ZN(\uut_slave/n205 ) );
  CLKBUF_X1 \uut_slave/U8  ( .A(\uut_slave/n93 ), .Z(\uut_slave/n5 ) );
  AND2_X1 \uut_slave/U7  ( .A1(\uut_slave/n94 ), .A2(\uut_slave/n121 ), .ZN(
        \uut_slave/n4 ) );
  AND2_X1 \uut_slave/U6  ( .A1(\uut_slave/n225 ), .A2(\uut_slave/n232 ), .ZN(
        \uut_slave/n3 ) );
  INV_X1 \uut_slave/U5  ( .A(\uut_slave/n12 ), .ZN(\uut_slave/n2 ) );
  CLKBUF_X1 \uut_slave/U4  ( .A(\uut_slave/n1 ), .Z(\uut_slave/n7 ) );
  INV_X1 \uut_slave/U3  ( .A(\uut_slave/n2 ), .ZN(\uut_slave/n1 ) );
  DFF_X1 \uut_slave/current_state_reg[0]  ( .D(\uut_slave/N172 ), .CK(clk), 
        .Q(\uut_slave/current_state [0]), .QN(\uut_slave/n91 ) );
  DFF_X1 \uut_slave/data_count_reg[5]  ( .D(\uut_slave/n194 ), .CK(clk), .Q(
        \uut_slave/n206 ), .QN(\uut_slave/n251 ) );
  DFF_X1 \uut_slave/data_count_reg[4]  ( .D(\uut_slave/n195 ), .CK(clk), .Q(
        \uut_slave/data_count [4]), .QN(\uut_slave/n12 ) );
  DFF_X1 \uut_slave/data_count_reg[0]  ( .D(\uut_slave/n199 ), .CK(clk), .Q(
        \uut_slave/data_count [0]), .QN(\uut_slave/n16 ) );
  DFF_X1 \uut_slave/data_count_reg[2]  ( .D(\uut_slave/n197 ), .CK(clk), .Q(
        \uut_slave/data_count [2]), .QN(\uut_slave/n14 ) );
  DFF_X1 \uut_slave/data_count_reg[3]  ( .D(\uut_slave/n196 ), .CK(clk), .Q(
        \uut_slave/data_count [3]), .QN(\uut_slave/n13 ) );
  DFF_X1 \uut_slave/data_count_reg[1]  ( .D(\uut_slave/n198 ), .CK(clk), .Q(
        \uut_slave/data_count [1]), .QN(\uut_slave/n15 ) );
  NAND3_X1 \uut_slave/U124  ( .A1(\uut_slave/command_save [3]), .A2(
        \uut_slave/command_save [4]), .A3(\uut_slave/command_save [2]), .ZN(
        \uut_slave/n117 ) );
  DFF_X1 \uut_slave/data_end_reg  ( .D(\uut_slave/N39 ), .CK(clk), .QN(
        \uut_slave/n17 ) );
  DFF_X1 \uut_slave/data_out_reg[31]  ( .D(\uut_slave/n122 ), .CK(
        \uut_slave/n110 ), .Q(\uut_slave/data_out[31] ), .QN(\uut_slave/n58 )
         );
  DFF_X1 \uut_slave/data_out_reg[30]  ( .D(\uut_slave/n123 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n59 ) );
  DFF_X1 \uut_slave/data_out_reg[29]  ( .D(\uut_slave/n124 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n60 ) );
  DFF_X1 \uut_slave/data_out_reg[28]  ( .D(\uut_slave/n125 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n61 ) );
  DFF_X1 \uut_slave/data_out_reg[27]  ( .D(\uut_slave/n126 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n62 ) );
  DFF_X1 \uut_slave/data_out_reg[26]  ( .D(\uut_slave/n127 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n63 ) );
  DFF_X1 \uut_slave/data_out_reg[25]  ( .D(\uut_slave/n128 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n64 ) );
  DFF_X1 \uut_slave/data_out_reg[24]  ( .D(\uut_slave/n129 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n65 ) );
  DFF_X1 \uut_slave/data_out_reg[23]  ( .D(\uut_slave/n130 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n66 ) );
  DFF_X1 \uut_slave/data_out_reg[22]  ( .D(\uut_slave/n131 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n67 ) );
  DFF_X1 \uut_slave/data_out_reg[21]  ( .D(\uut_slave/n132 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n68 ) );
  DFF_X1 \uut_slave/data_out_reg[20]  ( .D(\uut_slave/n133 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n69 ) );
  DFF_X1 \uut_slave/data_out_reg[19]  ( .D(\uut_slave/n134 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n70 ) );
  DFF_X1 \uut_slave/data_out_reg[18]  ( .D(\uut_slave/n135 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n71 ) );
  DFF_X1 \uut_slave/data_out_reg[17]  ( .D(\uut_slave/n136 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n72 ) );
  DFF_X1 \uut_slave/data_out_reg[16]  ( .D(\uut_slave/n137 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n73 ) );
  DFF_X1 \uut_slave/data_out_reg[15]  ( .D(\uut_slave/n138 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n74 ) );
  DFF_X1 \uut_slave/data_out_reg[14]  ( .D(\uut_slave/n139 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n75 ) );
  DFF_X1 \uut_slave/data_out_reg[13]  ( .D(\uut_slave/n140 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n76 ) );
  DFF_X1 \uut_slave/data_out_reg[12]  ( .D(\uut_slave/n141 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n77 ) );
  DFF_X1 \uut_slave/data_out_reg[11]  ( .D(\uut_slave/n142 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n78 ) );
  DFF_X1 \uut_slave/data_out_reg[10]  ( .D(\uut_slave/n143 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n79 ) );
  DFF_X1 \uut_slave/data_out_reg[9]  ( .D(\uut_slave/n144 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n80 ) );
  DFF_X1 \uut_slave/data_out_reg[8]  ( .D(\uut_slave/n145 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n81 ) );
  DFF_X1 \uut_slave/data_out_reg[7]  ( .D(\uut_slave/n146 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n82 ) );
  DFF_X1 \uut_slave/data_out_reg[6]  ( .D(\uut_slave/n147 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n83 ) );
  DFF_X1 \uut_slave/data_out_reg[5]  ( .D(\uut_slave/n148 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n84 ) );
  DFF_X1 \uut_slave/data_out_reg[4]  ( .D(\uut_slave/n149 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n85 ) );
  DFF_X1 \uut_slave/data_out_reg[3]  ( .D(\uut_slave/n150 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n86 ) );
  DFF_X1 \uut_slave/data_out_reg[2]  ( .D(\uut_slave/n151 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n87 ) );
  DFF_X1 \uut_slave/data_out_reg[1]  ( .D(\uut_slave/n152 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n88 ) );
  DFF_X1 \uut_slave/data_out_reg[0]  ( .D(\uut_slave/n153 ), .CK(
        \uut_slave/n110 ), .QN(\uut_slave/n89 ) );
  DFF_X1 \uut_slave/command_save_reg[7]  ( .D(\uut_slave/n186 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n18 ) );
  DFF_X1 \uut_slave/command_save_reg[6]  ( .D(\uut_slave/n187 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n19 ) );
  DFF_X1 \uut_slave/command_save_reg[5]  ( .D(\uut_slave/n188 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n20 ) );
  DFF_X1 \uut_slave/command_save_reg[4]  ( .D(\uut_slave/n189 ), .CK(
        \uut_slave/n106 ), .Q(\uut_slave/command_save [4]), .QN(
        \uut_slave/n21 ) );
  DFF_X1 \uut_slave/command_save_reg[3]  ( .D(\uut_slave/n190 ), .CK(
        \uut_slave/n106 ), .Q(\uut_slave/command_save [3]), .QN(
        \uut_slave/n22 ) );
  DFF_X1 \uut_slave/command_save_reg[2]  ( .D(\uut_slave/n191 ), .CK(
        \uut_slave/n106 ), .Q(\uut_slave/command_save [2]), .QN(
        \uut_slave/n23 ) );
  DFF_X1 \uut_slave/command_save_reg[1]  ( .D(\uut_slave/n192 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n24 ) );
  DFF_X1 \uut_slave/command_save_reg[0]  ( .D(\uut_slave/n193 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n25 ) );
  DFF_X1 \uut_slave/data_save_reg[31]  ( .D(\uut_slave/n154 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n26 ) );
  DFF_X1 \uut_slave/data_save_reg[30]  ( .D(\uut_slave/n184 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n27 ) );
  DFF_X1 \uut_slave/data_save_reg[29]  ( .D(\uut_slave/n155 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n28 ) );
  DFF_X1 \uut_slave/data_save_reg[28]  ( .D(\uut_slave/n156 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n29 ) );
  DFF_X1 \uut_slave/data_save_reg[27]  ( .D(\uut_slave/n157 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n30 ) );
  DFF_X1 \uut_slave/data_save_reg[26]  ( .D(\uut_slave/n158 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n31 ) );
  DFF_X1 \uut_slave/data_save_reg[25]  ( .D(\uut_slave/n159 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n32 ) );
  DFF_X1 \uut_slave/data_save_reg[24]  ( .D(\uut_slave/n160 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n33 ) );
  DFF_X1 \uut_slave/data_save_reg[23]  ( .D(\uut_slave/n161 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n34 ) );
  DFF_X1 \uut_slave/data_save_reg[22]  ( .D(\uut_slave/n162 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n35 ) );
  DFF_X1 \uut_slave/data_save_reg[21]  ( .D(\uut_slave/n163 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n36 ) );
  DFF_X1 \uut_slave/data_save_reg[20]  ( .D(\uut_slave/n164 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n37 ) );
  DFF_X1 \uut_slave/data_save_reg[19]  ( .D(\uut_slave/n165 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n38 ) );
  DFF_X1 \uut_slave/data_save_reg[18]  ( .D(\uut_slave/n166 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n39 ) );
  DFF_X1 \uut_slave/data_save_reg[17]  ( .D(\uut_slave/n167 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n40 ) );
  DFF_X1 \uut_slave/data_save_reg[16]  ( .D(\uut_slave/n168 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n41 ) );
  DFF_X1 \uut_slave/data_save_reg[15]  ( .D(\uut_slave/n169 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n42 ) );
  DFF_X1 \uut_slave/data_save_reg[14]  ( .D(\uut_slave/n170 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n43 ) );
  DFF_X1 \uut_slave/data_save_reg[13]  ( .D(\uut_slave/n171 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n44 ) );
  DFF_X1 \uut_slave/data_save_reg[12]  ( .D(\uut_slave/n172 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n45 ) );
  DFF_X1 \uut_slave/data_save_reg[11]  ( .D(\uut_slave/n173 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n46 ) );
  DFF_X1 \uut_slave/data_save_reg[10]  ( .D(\uut_slave/n174 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n47 ) );
  DFF_X1 \uut_slave/data_save_reg[9]  ( .D(\uut_slave/n175 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n48 ) );
  DFF_X1 \uut_slave/data_save_reg[8]  ( .D(\uut_slave/n176 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n49 ) );
  DFF_X1 \uut_slave/data_save_reg[7]  ( .D(\uut_slave/n177 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n50 ) );
  DFF_X1 \uut_slave/data_save_reg[6]  ( .D(\uut_slave/n178 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n51 ) );
  DFF_X1 \uut_slave/data_save_reg[5]  ( .D(\uut_slave/n179 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n52 ) );
  DFF_X1 \uut_slave/data_save_reg[4]  ( .D(\uut_slave/n180 ), .CK(
        \uut_slave/n115 ), .QN(\uut_slave/n53 ) );
  DFF_X1 \uut_slave/data_save_reg[3]  ( .D(\uut_slave/n181 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n54 ) );
  DFF_X1 \uut_slave/data_save_reg[2]  ( .D(\uut_slave/n182 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n55 ) );
  DFF_X1 \uut_slave/data_save_reg[1]  ( .D(\uut_slave/n183 ), .CK(
        \uut_slave/n120 ), .QN(\uut_slave/n56 ) );
  DFF_X1 \uut_slave/data_save_reg[0]  ( .D(\uut_slave/n185 ), .CK(
        \uut_slave/n106 ), .QN(\uut_slave/n57 ) );
  DFF_X1 \uut_slave/current_state_reg[1]  ( .D(\uut_slave/N173 ), .CK(clk), 
        .Q(\uut_slave/current_state [1]), .QN(\uut_slave/n116 ) );
endmodule

