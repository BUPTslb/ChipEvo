/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP2
// Date      : Sat Jun 13 23:23:00 2026
/////////////////////////////////////////////////////////////


module fifo ( dataOut, full, empty, dataIn, insert, flush, clk_in, rst, remove, 
        clk_out );
  output [31:0] dataOut;
  input [31:0] dataIn;
  input insert, flush, clk_in, rst, remove, clk_out;
  output full, empty;
  wire   \r2w_uut/n1 , \w2r_uut/n1 , \read_uut/n58 , \read_uut/n57 ,
         \read_uut/n56 , \read_uut/n55 , \read_uut/n54 , \read_uut/n53 ,
         \read_uut/n52 , \read_uut/n51 , \read_uut/n50 , \read_uut/n49 ,
         \read_uut/n48 , \read_uut/n47 , \read_uut/n40 , \read_uut/n21 ,
         \read_uut/n20 , \read_uut/n19 , \read_uut/n18 , \read_uut/n17 ,
         \read_uut/n16 , \read_uut/n15 , \read_uut/n14 , \read_uut/n13 ,
         \read_uut/n12 , \read_uut/n11 , \read_uut/n10 , \read_uut/n9 ,
         \read_uut/n8 , \read_uut/n7 , \read_uut/n6 , \read_uut/n5 ,
         \read_uut/n4 , \read_uut/n2 , \read_uut/n1 , \read_uut/n46 ,
         \read_uut/n45 , \read_uut/n44 , \read_uut/n43 , \read_uut/n42 ,
         \read_uut/n41 , \read_uut/n39 , \read_uut/n38 , \read_uut/n37 ,
         \read_uut/n36 , \read_uut/n35 , \read_uut/n34 , \read_uut/n33 ,
         \read_uut/n32 , \read_uut/n31 , \read_uut/n30 , \read_uut/n29 ,
         \read_uut/n28 , \read_uut/n27 , \read_uut/n26 , \read_uut/n25 ,
         \read_uut/n24 , \read_uut/n23 , \read_uut/n22 , \read_uut/n3 ,
         \read_uut/N54 , \read_uut/N53 , \read_uut/N52 , \read_uut/N51 ,
         \read_uut/N50 , \read_uut/N49 , \read_uut/N48 , \read_uut/N47 ,
         \read_uut/N46 , \read_uut/N45 , \read_uut/N44 , \read_uut/N43 ,
         \read_uut/N42 , \read_uut/N41 , \read_uut/N40 , \read_uut/N39 ,
         \read_uut/N38 , \read_uut/N37 , \read_uut/N36 , \read_uut/N35 ,
         \read_uut/rgraycmp , \read_uut/rbin[8] , \write_uut/n126 ,
         \write_uut/n125 , \write_uut/n124 , \write_uut/n123 ,
         \write_uut/n122 , \write_uut/n121 , \write_uut/n120 ,
         \write_uut/n119 , \write_uut/n118 , \write_uut/n117 ,
         \write_uut/n116 , \write_uut/n115 , \write_uut/n114 ,
         \write_uut/n113 , \write_uut/n112 , \write_uut/n111 ,
         \write_uut/n110 , \write_uut/n109 , \write_uut/n108 ,
         \write_uut/n107 , \write_uut/n106 , \write_uut/n105 ,
         \write_uut/n104 , \write_uut/n103 , \write_uut/n102 ,
         \write_uut/n101 , \write_uut/n100 , \write_uut/n99 , \write_uut/n98 ,
         \write_uut/n97 , \write_uut/n96 , \write_uut/n95 , \write_uut/n94 ,
         \write_uut/n93 , \write_uut/n92 , \write_uut/n91 , \write_uut/n90 ,
         \write_uut/n89 , \write_uut/n88 , \write_uut/n87 , \write_uut/n86 ,
         \write_uut/n85 , \write_uut/n84 , \write_uut/n83 , \write_uut/n82 ,
         \write_uut/n81 , \write_uut/n80 , \write_uut/n79 , \write_uut/n78 ,
         \write_uut/n77 , \write_uut/n76 , \write_uut/n75 , \write_uut/n74 ,
         \write_uut/n73 , \write_uut/n72 , \write_uut/n71 , \write_uut/n70 ,
         \write_uut/n69 , \write_uut/n68 , \write_uut/n67 , \write_uut/n66 ,
         \write_uut/n65 , \write_uut/n64 , \write_uut/n63 , \write_uut/n62 ,
         \write_uut/n61 , \write_uut/n60 , \write_uut/n59 , \write_uut/n58 ,
         \write_uut/n53 , \write_uut/n52 , \write_uut/n51 , \write_uut/n50 ,
         \write_uut/n49 , \write_uut/n48 , \write_uut/n47 , \write_uut/n46 ,
         \write_uut/n45 , \write_uut/n44 , \write_uut/n43 , \write_uut/n42 ,
         \write_uut/n41 , \write_uut/n40 , \write_uut/n39 , \write_uut/n38 ,
         \write_uut/n37 , \write_uut/n36 , \write_uut/n35 , \write_uut/n34 ,
         \write_uut/n33 , \write_uut/n32 , \write_uut/n27 , \write_uut/n26 ,
         \write_uut/n25 , \write_uut/n24 , \write_uut/n23 , \write_uut/n22 ,
         \write_uut/n21 , \write_uut/n20 , \write_uut/n19 , \write_uut/n18 ,
         \write_uut/n17 , \write_uut/n16 , \write_uut/n15 , \write_uut/n14 ,
         \write_uut/n13 , \write_uut/n12 , \write_uut/n11 , \write_uut/n10 ,
         \write_uut/n9 , \write_uut/n8 , \write_uut/n7 , \write_uut/n6 ,
         \write_uut/n5 , \write_uut/n4 , \write_uut/n3 , \write_uut/n2 ,
         \write_uut/n1 , \write_uut/n57 , \write_uut/n56 , \write_uut/n55 ,
         \write_uut/n54 , \write_uut/n31 , \write_uut/n30 , \write_uut/n29 ,
         \write_uut/n28 , \write_uut/N36 , \write_uut/wbin[8] ,
         \write_uut/add_168/n18 , \write_uut/add_168/n17 ,
         \write_uut/add_168/n16 , \write_uut/add_168/n15 ,
         \write_uut/add_168/n14 , \write_uut/add_168/n13 ,
         \write_uut/add_168/n12 , \write_uut/add_168/n11 ,
         \write_uut/add_168/n10 , \write_uut/add_168/n9 ,
         \write_uut/add_168/n8 , \write_uut/add_168/n7 ,
         \write_uut/add_168/n6 , \write_uut/add_168/n5 ,
         \write_uut/add_168/n4 , \write_uut/add_168/n3 ,
         \write_uut/add_168/n2 , \write_uut/add_168/n1 ;
  wire   [8:0] sync_rdptr;
  wire   [8:0] rdptr;
  wire   [8:0] sync_wrptr;
  wire   [8:0] wrptr;
  wire   [8:0] \r2w_uut/r0 ;
  wire   [8:0] \r2w_uut/effective_r0 ;
  wire   [8:0] \w2r_uut/w0 ;
  wire   [8:0] \w2r_uut/effective_w0 ;
  wire   [7:0] \read_uut/rgraynext ;
  wire   [8:0] \read_uut/rbinnext ;
  wire   [8:2] \read_uut/add_266/carry ;
  wire   [8:0] \write_uut/wbinnext ;
  tri   [31:0] dataOut;
  tri   [31:0] dataIn;
  tri   flush;
  tri   clk_in;
  tri   rst;
  tri   clk_out;
  tri   sync_flush;
  tri   [7:0] wraddr;
  tri   [7:0] rdaddr;
  tri   wren;
  tri   rden;

  memory mem_uut ( .dataOut(dataOut), .dataIn(dataIn), .wraddr(wraddr), 
        .rdaddr(rdaddr), .rst(rst), .clk_in(clk_in), .flush(flush), .clk_out(
        clk_out), .wren(wren), .rden(rden), .sync_flush(1'b0) );
  INV_X1 \r2w_uut/U12  ( .A(1'b0), .ZN(\r2w_uut/n1 ) );
  AND2_X1 \r2w_uut/U11  ( .A1(rdptr[8]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [8]) );
  AND2_X1 \r2w_uut/U10  ( .A1(rdptr[7]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [7]) );
  AND2_X1 \r2w_uut/U9  ( .A1(rdptr[6]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [6]) );
  AND2_X1 \r2w_uut/U8  ( .A1(rdptr[5]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [5]) );
  AND2_X1 \r2w_uut/U7  ( .A1(rdptr[4]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [4]) );
  AND2_X1 \r2w_uut/U6  ( .A1(rdptr[3]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [3]) );
  AND2_X1 \r2w_uut/U5  ( .A1(rdptr[2]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [2]) );
  AND2_X1 \r2w_uut/U4  ( .A1(rdptr[1]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [1]) );
  AND2_X1 \r2w_uut/U3  ( .A1(rdptr[0]), .A2(\r2w_uut/n1 ), .ZN(
        \r2w_uut/effective_r0 [0]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[0]  ( .D(\r2w_uut/r0 [0]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[0]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[1]  ( .D(\r2w_uut/r0 [1]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[1]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[2]  ( .D(\r2w_uut/r0 [2]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[2]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[3]  ( .D(\r2w_uut/r0 [3]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[3]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[4]  ( .D(\r2w_uut/r0 [4]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[4]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[5]  ( .D(\r2w_uut/r0 [5]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[5]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[6]  ( .D(\r2w_uut/r0 [6]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[6]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[7]  ( .D(\r2w_uut/r0 [7]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[7]) );
  DFFR_X1 \r2w_uut/sync_rdptr_reg[8]  ( .D(\r2w_uut/r0 [8]), .CK(clk_out), 
        .RN(rst), .Q(sync_rdptr[8]) );
  DFFR_X1 \r2w_uut/r0_reg[0]  ( .D(\r2w_uut/effective_r0 [0]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [0]) );
  DFFR_X1 \r2w_uut/r0_reg[1]  ( .D(\r2w_uut/effective_r0 [1]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [1]) );
  DFFR_X1 \r2w_uut/r0_reg[2]  ( .D(\r2w_uut/effective_r0 [2]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [2]) );
  DFFR_X1 \r2w_uut/r0_reg[3]  ( .D(\r2w_uut/effective_r0 [3]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [3]) );
  DFFR_X1 \r2w_uut/r0_reg[4]  ( .D(\r2w_uut/effective_r0 [4]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [4]) );
  DFFR_X1 \r2w_uut/r0_reg[5]  ( .D(\r2w_uut/effective_r0 [5]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [5]) );
  DFFR_X1 \r2w_uut/r0_reg[6]  ( .D(\r2w_uut/effective_r0 [6]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [6]) );
  DFFR_X1 \r2w_uut/r0_reg[7]  ( .D(\r2w_uut/effective_r0 [7]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [7]) );
  DFFR_X1 \r2w_uut/r0_reg[8]  ( .D(\r2w_uut/effective_r0 [8]), .CK(clk_out), 
        .RN(rst), .Q(\r2w_uut/r0 [8]) );
  AND2_X1 \w2r_uut/U12  ( .A1(wrptr[8]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [8]) );
  AND2_X1 \w2r_uut/U11  ( .A1(wrptr[7]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [7]) );
  AND2_X1 \w2r_uut/U10  ( .A1(wrptr[6]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [6]) );
  AND2_X1 \w2r_uut/U9  ( .A1(wrptr[5]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [5]) );
  AND2_X1 \w2r_uut/U8  ( .A1(wrptr[4]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [4]) );
  AND2_X1 \w2r_uut/U7  ( .A1(wrptr[3]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [3]) );
  AND2_X1 \w2r_uut/U6  ( .A1(wrptr[2]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [2]) );
  AND2_X1 \w2r_uut/U5  ( .A1(wrptr[1]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [1]) );
  AND2_X1 \w2r_uut/U4  ( .A1(wrptr[0]), .A2(\w2r_uut/n1 ), .ZN(
        \w2r_uut/effective_w0 [0]) );
  INV_X1 \w2r_uut/U3  ( .A(flush), .ZN(\w2r_uut/n1 ) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[0]  ( .D(\w2r_uut/w0 [0]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[0]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[1]  ( .D(\w2r_uut/w0 [1]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[1]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[2]  ( .D(\w2r_uut/w0 [2]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[2]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[3]  ( .D(\w2r_uut/w0 [3]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[3]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[4]  ( .D(\w2r_uut/w0 [4]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[4]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[5]  ( .D(\w2r_uut/w0 [5]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[5]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[6]  ( .D(\w2r_uut/w0 [6]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[6]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[7]  ( .D(\w2r_uut/w0 [7]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[7]) );
  DFFR_X1 \w2r_uut/sync_wrptr_reg[8]  ( .D(\w2r_uut/w0 [8]), .CK(clk_in), .RN(
        rst), .Q(sync_wrptr[8]) );
  DFFR_X1 \w2r_uut/w0_reg[0]  ( .D(\w2r_uut/effective_w0 [0]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [0]) );
  DFFR_X1 \w2r_uut/w0_reg[1]  ( .D(\w2r_uut/effective_w0 [1]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [1]) );
  DFFR_X1 \w2r_uut/w0_reg[2]  ( .D(\w2r_uut/effective_w0 [2]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [2]) );
  DFFR_X1 \w2r_uut/w0_reg[3]  ( .D(\w2r_uut/effective_w0 [3]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [3]) );
  DFFR_X1 \w2r_uut/w0_reg[4]  ( .D(\w2r_uut/effective_w0 [4]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [4]) );
  DFFR_X1 \w2r_uut/w0_reg[5]  ( .D(\w2r_uut/effective_w0 [5]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [5]) );
  DFFR_X1 \w2r_uut/w0_reg[6]  ( .D(\w2r_uut/effective_w0 [6]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [6]) );
  DFFR_X1 \w2r_uut/w0_reg[7]  ( .D(\w2r_uut/effective_w0 [7]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [7]) );
  DFFR_X1 \w2r_uut/w0_reg[8]  ( .D(\w2r_uut/effective_w0 [8]), .CK(clk_in), 
        .RN(rst), .Q(\w2r_uut/w0 [8]) );
  NOR4_X1 \read_uut/U70  ( .A1(\read_uut/n14 ), .A2(\read_uut/n13 ), .A3(
        \read_uut/n12 ), .A4(\read_uut/n11 ), .ZN(\read_uut/rgraycmp ) );
  XOR2_X1 \read_uut/U69  ( .A(sync_wrptr[4]), .B(\read_uut/rgraynext [4]), .Z(
        \read_uut/n11 ) );
  XOR2_X1 \read_uut/U68  ( .A(sync_wrptr[3]), .B(\read_uut/rgraynext [3]), .Z(
        \read_uut/n12 ) );
  NAND3_X1 \read_uut/U67  ( .A1(\read_uut/n10 ), .A2(\read_uut/n9 ), .A3(
        \read_uut/n8 ), .ZN(\read_uut/n13 ) );
  XNOR2_X1 \read_uut/U66  ( .A(sync_wrptr[2]), .B(\read_uut/rgraynext [2]), 
        .ZN(\read_uut/n8 ) );
  OAI22_X1 \read_uut/U65  ( .A1(\read_uut/rgraynext [1]), .A2(\read_uut/n7 ), 
        .B1(\read_uut/n7 ), .B2(\read_uut/n16 ), .ZN(\read_uut/n9 ) );
  AND2_X1 \read_uut/U64  ( .A1(\read_uut/rgraynext [0]), .A2(\read_uut/n15 ), 
        .ZN(\read_uut/n7 ) );
  OAI22_X1 \read_uut/U63  ( .A1(\read_uut/n6 ), .A2(\read_uut/n17 ), .B1(
        sync_wrptr[1]), .B2(\read_uut/n6 ), .ZN(\read_uut/n10 ) );
  NOR2_X1 \read_uut/U62  ( .A1(\read_uut/n15 ), .A2(\read_uut/rgraynext [0]), 
        .ZN(\read_uut/n6 ) );
  NAND4_X1 \read_uut/U61  ( .A1(\read_uut/n5 ), .A2(\read_uut/n4 ), .A3(
        \read_uut/n2 ), .A4(\read_uut/n1 ), .ZN(\read_uut/n14 ) );
  XNOR2_X1 \read_uut/U60  ( .A(sync_wrptr[5]), .B(\read_uut/rgraynext [5]), 
        .ZN(\read_uut/n1 ) );
  XNOR2_X1 \read_uut/U59  ( .A(sync_wrptr[6]), .B(\read_uut/rgraynext [6]), 
        .ZN(\read_uut/n2 ) );
  XNOR2_X1 \read_uut/U58  ( .A(sync_wrptr[7]), .B(\read_uut/rgraynext [7]), 
        .ZN(\read_uut/n4 ) );
  XNOR2_X1 \read_uut/U57  ( .A(sync_wrptr[8]), .B(\read_uut/rbinnext [8]), 
        .ZN(\read_uut/n5 ) );
  INV_X1 \read_uut/U56  ( .A(sync_wrptr[1]), .ZN(\read_uut/n16 ) );
  INV_X1 \read_uut/U55  ( .A(sync_wrptr[0]), .ZN(\read_uut/n15 ) );
  XNOR2_X1 \read_uut/U54  ( .A(\read_uut/rbinnext [0]), .B(\read_uut/n57 ), 
        .ZN(\read_uut/rgraynext [0]) );
  OAI22_X1 \read_uut/U53  ( .A1(\read_uut/n41 ), .A2(\read_uut/n29 ), .B1(
        rdaddr[0]), .B2(\read_uut/n42 ), .ZN(\read_uut/N37 ) );
  OAI22_X1 \read_uut/U52  ( .A1(\read_uut/n41 ), .A2(\read_uut/n28 ), .B1(
        \read_uut/n57 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N38 ) );
  OAI22_X1 \read_uut/U51  ( .A1(\read_uut/n41 ), .A2(\read_uut/n27 ), .B1(
        \read_uut/n56 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N39 ) );
  OAI22_X1 \read_uut/U50  ( .A1(\read_uut/n41 ), .A2(\read_uut/n26 ), .B1(
        \read_uut/n55 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N40 ) );
  OAI22_X1 \read_uut/U49  ( .A1(\read_uut/n41 ), .A2(\read_uut/n25 ), .B1(
        \read_uut/n53 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N41 ) );
  OAI22_X1 \read_uut/U48  ( .A1(\read_uut/n41 ), .A2(\read_uut/n24 ), .B1(
        \read_uut/n51 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N42 ) );
  OAI22_X1 \read_uut/U47  ( .A1(\read_uut/n41 ), .A2(\read_uut/n23 ), .B1(
        \read_uut/n49 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N43 ) );
  OAI22_X1 \read_uut/U46  ( .A1(\read_uut/n41 ), .A2(\read_uut/n22 ), .B1(
        \read_uut/n47 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N44 ) );
  OAI22_X1 \read_uut/U45  ( .A1(\read_uut/n41 ), .A2(\read_uut/n3 ), .B1(
        \read_uut/n21 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N45 ) );
  OAI22_X1 \read_uut/U44  ( .A1(\read_uut/n41 ), .A2(\read_uut/n31 ), .B1(
        \read_uut/n21 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N54 ) );
  INV_X1 \read_uut/U43  ( .A(\read_uut/rgraynext [7]), .ZN(\read_uut/n20 ) );
  OAI22_X1 \read_uut/U42  ( .A1(\read_uut/n41 ), .A2(\read_uut/n32 ), .B1(
        \read_uut/n20 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N53 ) );
  INV_X1 \read_uut/U41  ( .A(\read_uut/rgraynext [6]), .ZN(\read_uut/n40 ) );
  OAI22_X1 \read_uut/U40  ( .A1(\read_uut/n41 ), .A2(\read_uut/n33 ), .B1(
        \read_uut/n40 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N52 ) );
  INV_X1 \read_uut/U39  ( .A(\read_uut/rgraynext [5]), .ZN(\read_uut/n48 ) );
  OAI22_X1 \read_uut/U38  ( .A1(\read_uut/n41 ), .A2(\read_uut/n34 ), .B1(
        \read_uut/n48 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N51 ) );
  INV_X1 \read_uut/U37  ( .A(\read_uut/rgraynext [4]), .ZN(\read_uut/n50 ) );
  OAI22_X1 \read_uut/U36  ( .A1(\read_uut/n41 ), .A2(\read_uut/n35 ), .B1(
        \read_uut/n50 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N50 ) );
  INV_X1 \read_uut/U35  ( .A(\read_uut/rgraynext [3]), .ZN(\read_uut/n52 ) );
  OAI22_X1 \read_uut/U34  ( .A1(\read_uut/n41 ), .A2(\read_uut/n36 ), .B1(
        \read_uut/n52 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N49 ) );
  INV_X1 \read_uut/U33  ( .A(\read_uut/rgraynext [2]), .ZN(\read_uut/n54 ) );
  OAI22_X1 \read_uut/U32  ( .A1(\read_uut/n41 ), .A2(\read_uut/n37 ), .B1(
        \read_uut/n54 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N48 ) );
  OAI22_X1 \read_uut/U31  ( .A1(\read_uut/n41 ), .A2(\read_uut/n38 ), .B1(
        \read_uut/n17 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N47 ) );
  INV_X1 \read_uut/U30  ( .A(\read_uut/rgraynext [0]), .ZN(\read_uut/n19 ) );
  OAI22_X1 \read_uut/U29  ( .A1(\read_uut/n41 ), .A2(\read_uut/n39 ), .B1(
        \read_uut/n19 ), .B2(\read_uut/n42 ), .ZN(\read_uut/N46 ) );
  AOI21_X1 \read_uut/U28  ( .B1(\read_uut/n30 ), .B2(remove), .A(1'b0), .ZN(
        \read_uut/n44 ) );
  NAND4_X1 \read_uut/U27  ( .A1(rdaddr[3]), .A2(rdaddr[2]), .A3(rdaddr[1]), 
        .A4(rdaddr[0]), .ZN(\read_uut/n46 ) );
  NOR4_X1 \read_uut/U26  ( .A1(\read_uut/n46 ), .A2(\read_uut/n23 ), .A3(
        \read_uut/n25 ), .A4(\read_uut/n24 ), .ZN(\read_uut/n45 ) );
  NOR3_X1 \read_uut/U25  ( .A1(\read_uut/rgraycmp ), .A2(rdaddr[7]), .A3(
        \read_uut/n45 ), .ZN(\read_uut/n43 ) );
  INV_X1 \read_uut/U24  ( .A(remove), .ZN(\read_uut/n58 ) );
  NOR3_X1 \read_uut/U23  ( .A1(empty), .A2(1'b0), .A3(\read_uut/n58 ), .ZN(
        \read_uut/N35 ) );
  INV_X1 \read_uut/U22  ( .A(\read_uut/rbinnext [5]), .ZN(\read_uut/n51 ) );
  INV_X1 \read_uut/U21  ( .A(\read_uut/rbinnext [4]), .ZN(\read_uut/n53 ) );
  INV_X1 \read_uut/U20  ( .A(\read_uut/rbinnext [3]), .ZN(\read_uut/n55 ) );
  INV_X1 \read_uut/U19  ( .A(\read_uut/rbinnext [2]), .ZN(\read_uut/n56 ) );
  INV_X1 \read_uut/U18  ( .A(\read_uut/rbinnext [7]), .ZN(\read_uut/n47 ) );
  INV_X1 \read_uut/U17  ( .A(\read_uut/rbinnext [6]), .ZN(\read_uut/n49 ) );
  INV_X1 \read_uut/U16  ( .A(\read_uut/rbinnext [1]), .ZN(\read_uut/n57 ) );
  INV_X1 \read_uut/U15  ( .A(\read_uut/rbinnext [8]), .ZN(\read_uut/n21 ) );
  OAI21_X1 \read_uut/U14  ( .B1(\read_uut/N35 ), .B2(\read_uut/n44 ), .A(
        \read_uut/n43 ), .ZN(\read_uut/N36 ) );
  XNOR2_X1 \read_uut/U13  ( .A(\read_uut/rbinnext [4]), .B(\read_uut/n51 ), 
        .ZN(\read_uut/rgraynext [4]) );
  XNOR2_X1 \read_uut/U12  ( .A(\read_uut/rbinnext [3]), .B(\read_uut/n53 ), 
        .ZN(\read_uut/rgraynext [3]) );
  XNOR2_X1 \read_uut/U11  ( .A(\read_uut/rbinnext [6]), .B(\read_uut/n47 ), 
        .ZN(\read_uut/rgraynext [6]) );
  XNOR2_X1 \read_uut/U10  ( .A(\read_uut/rbinnext [5]), .B(\read_uut/n49 ), 
        .ZN(\read_uut/rgraynext [5]) );
  XNOR2_X1 \read_uut/U9  ( .A(\read_uut/rbinnext [2]), .B(\read_uut/n55 ), 
        .ZN(\read_uut/rgraynext [2]) );
  XNOR2_X1 \read_uut/U8  ( .A(\read_uut/rbinnext [7]), .B(\read_uut/n21 ), 
        .ZN(\read_uut/rgraynext [7]) );
  XNOR2_X1 \read_uut/U7  ( .A(\read_uut/rbinnext [1]), .B(\read_uut/n56 ), 
        .ZN(\read_uut/rgraynext [1]) );
  NAND2_X1 \read_uut/U6  ( .A1(\read_uut/N35 ), .A2(\read_uut/n43 ), .ZN(
        \read_uut/n42 ) );
  INV_X1 \read_uut/U5  ( .A(\read_uut/n43 ), .ZN(\read_uut/n18 ) );
  AOI21_X2 \read_uut/U4  ( .B1(\read_uut/n18 ), .B2(\read_uut/N35 ), .A(
        \read_uut/n44 ), .ZN(\read_uut/n41 ) );
  INV_X1 \read_uut/U3  ( .A(\read_uut/rgraynext [1]), .ZN(\read_uut/n17 ) );
  DFFR_X1 \read_uut/rdptr_reg[0]  ( .D(\read_uut/N46 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[0]), .QN(\read_uut/n39 ) );
  DFFR_X1 \read_uut/rdptr_reg[1]  ( .D(\read_uut/N47 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[1]), .QN(\read_uut/n38 ) );
  DFFR_X1 \read_uut/rdptr_reg[2]  ( .D(\read_uut/N48 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[2]), .QN(\read_uut/n37 ) );
  DFFR_X1 \read_uut/rdptr_reg[3]  ( .D(\read_uut/N49 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[3]), .QN(\read_uut/n36 ) );
  DFFR_X1 \read_uut/rdptr_reg[4]  ( .D(\read_uut/N50 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[4]), .QN(\read_uut/n35 ) );
  DFFR_X1 \read_uut/rdptr_reg[5]  ( .D(\read_uut/N51 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[5]), .QN(\read_uut/n34 ) );
  DFFR_X1 \read_uut/rdptr_reg[6]  ( .D(\read_uut/N52 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[6]), .QN(\read_uut/n33 ) );
  DFFR_X1 \read_uut/rdptr_reg[7]  ( .D(\read_uut/N53 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[7]), .QN(\read_uut/n32 ) );
  DFFR_X1 \read_uut/rdptr_reg[8]  ( .D(\read_uut/N54 ), .CK(clk_out), .RN(rst), 
        .Q(rdptr[8]), .QN(\read_uut/n31 ) );
  DFFR_X1 \read_uut/rbin_reg[8]  ( .D(\read_uut/N45 ), .CK(clk_out), .RN(rst), 
        .Q(\read_uut/rbin[8] ), .QN(\read_uut/n3 ) );
  DFFR_X1 \read_uut/rbin_reg[7]  ( .D(\read_uut/N44 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[7]), .QN(\read_uut/n22 ) );
  DFFR_X1 \read_uut/rbin_reg[6]  ( .D(\read_uut/N43 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[6]), .QN(\read_uut/n23 ) );
  DFFR_X1 \read_uut/rbin_reg[5]  ( .D(\read_uut/N42 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[5]), .QN(\read_uut/n24 ) );
  DFFR_X1 \read_uut/rbin_reg[4]  ( .D(\read_uut/N41 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[4]), .QN(\read_uut/n25 ) );
  DFFR_X1 \read_uut/rbin_reg[3]  ( .D(\read_uut/N40 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[3]), .QN(\read_uut/n26 ) );
  DFFR_X1 \read_uut/rbin_reg[2]  ( .D(\read_uut/N39 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[2]), .QN(\read_uut/n27 ) );
  DFFR_X1 \read_uut/rbin_reg[1]  ( .D(\read_uut/N38 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[1]), .QN(\read_uut/n28 ) );
  DFFR_X1 \read_uut/rbin_reg[0]  ( .D(\read_uut/N37 ), .CK(clk_out), .RN(rst), 
        .Q(rdaddr[0]), .QN(\read_uut/n29 ) );
  DFFR_X1 \read_uut/rden_reg  ( .D(\read_uut/N35 ), .CK(clk_out), .RN(rst), 
        .Q(rden) );
  DFFS_X1 \read_uut/empty_reg  ( .D(\read_uut/N36 ), .CK(clk_out), .SN(rst), 
        .Q(empty), .QN(\read_uut/n30 ) );
  XOR2_X1 \read_uut/add_266/U2  ( .A(\read_uut/add_266/carry [8]), .B(
        \read_uut/rbin[8] ), .Z(\read_uut/rbinnext [8]) );
  INV_X1 \read_uut/add_266/U1  ( .A(rdaddr[0]), .ZN(\read_uut/rbinnext [0]) );
  HA_X1 \read_uut/add_266/U1_1_1  ( .A(rdaddr[1]), .B(rdaddr[0]), .CO(
        \read_uut/add_266/carry [2]), .S(\read_uut/rbinnext [1]) );
  HA_X1 \read_uut/add_266/U1_1_2  ( .A(rdaddr[2]), .B(
        \read_uut/add_266/carry [2]), .CO(\read_uut/add_266/carry [3]), .S(
        \read_uut/rbinnext [2]) );
  HA_X1 \read_uut/add_266/U1_1_3  ( .A(rdaddr[3]), .B(
        \read_uut/add_266/carry [3]), .CO(\read_uut/add_266/carry [4]), .S(
        \read_uut/rbinnext [3]) );
  HA_X1 \read_uut/add_266/U1_1_4  ( .A(rdaddr[4]), .B(
        \read_uut/add_266/carry [4]), .CO(\read_uut/add_266/carry [5]), .S(
        \read_uut/rbinnext [4]) );
  HA_X1 \read_uut/add_266/U1_1_5  ( .A(rdaddr[5]), .B(
        \read_uut/add_266/carry [5]), .CO(\read_uut/add_266/carry [6]), .S(
        \read_uut/rbinnext [5]) );
  HA_X1 \read_uut/add_266/U1_1_6  ( .A(rdaddr[6]), .B(
        \read_uut/add_266/carry [6]), .CO(\read_uut/add_266/carry [7]), .S(
        \read_uut/rbinnext [6]) );
  HA_X1 \read_uut/add_266/U1_1_7  ( .A(rdaddr[7]), .B(
        \read_uut/add_266/carry [7]), .CO(\read_uut/add_266/carry [8]), .S(
        \read_uut/rbinnext [7]) );
  OAI21_X1 \write_uut/U115  ( .B1(\write_uut/n20 ), .B2(\write_uut/n110 ), .A(
        \write_uut/n109 ), .ZN(\write_uut/n113 ) );
  NAND3_X1 \write_uut/U114  ( .A1(\write_uut/wbinnext [0]), .A2(
        \write_uut/n112 ), .A3(\write_uut/n8 ), .ZN(\write_uut/n109 ) );
  OAI21_X1 \write_uut/U113  ( .B1(\write_uut/n28 ), .B2(\write_uut/n111 ), .A(
        \write_uut/n108 ), .ZN(\write_uut/n57 ) );
  OAI21_X1 \write_uut/U112  ( .B1(\write_uut/n20 ), .B2(\write_uut/n107 ), .A(
        \write_uut/n106 ), .ZN(\write_uut/n118 ) );
  NAND3_X1 \write_uut/U111  ( .A1(\write_uut/n1 ), .A2(\write_uut/n112 ), .A3(
        \write_uut/n8 ), .ZN(\write_uut/n106 ) );
  OAI21_X1 \write_uut/U110  ( .B1(\write_uut/n20 ), .B2(\write_uut/n105 ), .A(
        \write_uut/n104 ), .ZN(\write_uut/n117 ) );
  NAND3_X1 \write_uut/U109  ( .A1(\write_uut/n26 ), .A2(\write_uut/n112 ), 
        .A3(\write_uut/n8 ), .ZN(\write_uut/n104 ) );
  OAI21_X1 \write_uut/U108  ( .B1(\write_uut/n20 ), .B2(\write_uut/n103 ), .A(
        \write_uut/n102 ), .ZN(\write_uut/n116 ) );
  NAND3_X1 \write_uut/U107  ( .A1(\write_uut/wbinnext [3]), .A2(
        \write_uut/n112 ), .A3(\write_uut/n12 ), .ZN(\write_uut/n102 ) );
  OAI21_X1 \write_uut/U106  ( .B1(\write_uut/n30 ), .B2(\write_uut/n111 ), .A(
        \write_uut/n101 ), .ZN(\write_uut/n55 ) );
  NAND3_X1 \write_uut/U105  ( .A1(\write_uut/n12 ), .A2(\write_uut/n112 ), 
        .A3(\write_uut/n25 ), .ZN(\write_uut/n101 ) );
  OAI21_X1 \write_uut/U104  ( .B1(\write_uut/n29 ), .B2(\write_uut/n111 ), .A(
        \write_uut/n100 ), .ZN(\write_uut/n56 ) );
  NAND3_X1 \write_uut/U103  ( .A1(\write_uut/n12 ), .A2(\write_uut/n112 ), 
        .A3(\write_uut/n18 ), .ZN(\write_uut/n100 ) );
  OAI21_X1 \write_uut/U102  ( .B1(\write_uut/n99 ), .B2(\write_uut/n98 ), .A(
        \write_uut/n97 ), .ZN(\write_uut/n115 ) );
  NAND3_X1 \write_uut/U101  ( .A1(\write_uut/wbinnext [7]), .A2(
        \write_uut/n112 ), .A3(\write_uut/n12 ), .ZN(\write_uut/n97 ) );
  OAI22_X1 \write_uut/U100  ( .A1(\write_uut/n31 ), .A2(\write_uut/n96 ), .B1(
        \write_uut/n19 ), .B2(\write_uut/n95 ), .ZN(\write_uut/n54 ) );
  OAI21_X1 \write_uut/U99  ( .B1(\write_uut/n23 ), .B2(\write_uut/n94 ), .A(
        \write_uut/n93 ), .ZN(\write_uut/n126 ) );
  NAND3_X1 \write_uut/U98  ( .A1(\write_uut/n112 ), .A2(\write_uut/n92 ), .A3(
        \write_uut/n8 ), .ZN(\write_uut/n93 ) );
  INV_X1 \write_uut/U97  ( .A(\write_uut/n91 ), .ZN(\write_uut/n92 ) );
  OAI21_X1 \write_uut/U96  ( .B1(\write_uut/n23 ), .B2(\write_uut/n90 ), .A(
        \write_uut/n89 ), .ZN(\write_uut/n125 ) );
  NAND3_X1 \write_uut/U95  ( .A1(\write_uut/n112 ), .A2(\write_uut/n88 ), .A3(
        \write_uut/n12 ), .ZN(\write_uut/n89 ) );
  INV_X1 \write_uut/U94  ( .A(\write_uut/n2 ), .ZN(\write_uut/n88 ) );
  OAI21_X1 \write_uut/U93  ( .B1(\write_uut/n23 ), .B2(\write_uut/n86 ), .A(
        \write_uut/n85 ), .ZN(\write_uut/n124 ) );
  NAND3_X1 \write_uut/U92  ( .A1(\write_uut/n112 ), .A2(\write_uut/n84 ), .A3(
        \write_uut/n8 ), .ZN(\write_uut/n85 ) );
  XOR2_X1 \write_uut/U91  ( .A(\write_uut/n3 ), .B(\write_uut/n17 ), .Z(
        \write_uut/n84 ) );
  OAI21_X1 \write_uut/U90  ( .B1(\write_uut/n23 ), .B2(\write_uut/n83 ), .A(
        \write_uut/n82 ), .ZN(\write_uut/n123 ) );
  NAND3_X1 \write_uut/U89  ( .A1(\write_uut/n112 ), .A2(\write_uut/n81 ), .A3(
        \write_uut/n12 ), .ZN(\write_uut/n82 ) );
  XOR2_X1 \write_uut/U88  ( .A(\write_uut/n25 ), .B(\write_uut/n17 ), .Z(
        \write_uut/n81 ) );
  OAI21_X1 \write_uut/U87  ( .B1(\write_uut/n23 ), .B2(\write_uut/n80 ), .A(
        \write_uut/n79 ), .ZN(\write_uut/n122 ) );
  NAND3_X1 \write_uut/U86  ( .A1(\write_uut/n112 ), .A2(\write_uut/n78 ), .A3(
        \write_uut/n8 ), .ZN(\write_uut/n79 ) );
  XOR2_X1 \write_uut/U85  ( .A(\write_uut/wbinnext [3]), .B(\write_uut/n25 ), 
        .Z(\write_uut/n78 ) );
  OAI21_X1 \write_uut/U84  ( .B1(\write_uut/n20 ), .B2(\write_uut/n77 ), .A(
        \write_uut/n76 ), .ZN(\write_uut/n121 ) );
  NAND3_X1 \write_uut/U83  ( .A1(\write_uut/n112 ), .A2(\write_uut/n75 ), .A3(
        \write_uut/n12 ), .ZN(\write_uut/n76 ) );
  XOR2_X1 \write_uut/U82  ( .A(\write_uut/n26 ), .B(\write_uut/wbinnext [3]), 
        .Z(\write_uut/n75 ) );
  OAI21_X1 \write_uut/U81  ( .B1(\write_uut/n96 ), .B2(\write_uut/n74 ), .A(
        \write_uut/n73 ), .ZN(\write_uut/n120 ) );
  NAND3_X1 \write_uut/U80  ( .A1(\write_uut/n112 ), .A2(\write_uut/n72 ), .A3(
        \write_uut/n12 ), .ZN(\write_uut/n73 ) );
  XOR2_X1 \write_uut/U79  ( .A(\write_uut/n26 ), .B(\write_uut/n1 ), .Z(
        \write_uut/n72 ) );
  OAI21_X1 \write_uut/U78  ( .B1(\write_uut/n96 ), .B2(\write_uut/n71 ), .A(
        \write_uut/n70 ), .ZN(\write_uut/n119 ) );
  NAND3_X1 \write_uut/U77  ( .A1(\write_uut/n112 ), .A2(\write_uut/n69 ), .A3(
        \write_uut/n12 ), .ZN(\write_uut/n70 ) );
  INV_X1 \write_uut/U76  ( .A(\write_uut/n67 ), .ZN(\write_uut/n69 ) );
  NAND2_X1 \write_uut/U75  ( .A1(\write_uut/n65 ), .A2(\write_uut/n99 ), .ZN(
        \write_uut/n66 ) );
  OAI22_X1 \write_uut/U74  ( .A1(\write_uut/n111 ), .A2(\write_uut/n64 ), .B1(
        \write_uut/n19 ), .B2(\write_uut/n95 ), .ZN(\write_uut/n114 ) );
  NAND2_X1 \write_uut/U73  ( .A1(\write_uut/n13 ), .A2(\write_uut/n112 ), .ZN(
        \write_uut/n95 ) );
  INV_X1 \write_uut/U72  ( .A(\write_uut/n63 ), .ZN(\write_uut/n111 ) );
  NAND2_X1 \write_uut/U71  ( .A1(\write_uut/n65 ), .A2(\write_uut/n99 ), .ZN(
        \write_uut/n63 ) );
  NOR4_X1 \write_uut/U70  ( .A1(\write_uut/n24 ), .A2(\write_uut/n60 ), .A3(
        \write_uut/n59 ), .A4(\write_uut/n58 ), .ZN(\write_uut/n61 ) );
  INV_X1 \write_uut/U69  ( .A(\write_uut/n51 ), .ZN(\write_uut/n99 ) );
  OAI21_X1 \write_uut/U68  ( .B1(\write_uut/n16 ), .B2(\write_uut/n52 ), .A(
        \write_uut/n50 ), .ZN(\write_uut/n51 ) );
  AOI21_X1 \write_uut/U67  ( .B1(\write_uut/n50 ), .B2(\write_uut/n52 ), .A(
        \write_uut/n12 ), .ZN(\write_uut/N36 ) );
  NAND3_X1 \write_uut/U66  ( .A1(\write_uut/n49 ), .A2(\write_uut/n53 ), .A3(
        \write_uut/n62 ), .ZN(\write_uut/n68 ) );
  NAND4_X1 \write_uut/U65  ( .A1(\write_uut/n48 ), .A2(\write_uut/n47 ), .A3(
        \write_uut/n46 ), .A4(\write_uut/n45 ), .ZN(\write_uut/n60 ) );
  XOR2_X1 \write_uut/U64  ( .A(\write_uut/n44 ), .B(\write_uut/wbinnext [3]), 
        .Z(\write_uut/n46 ) );
  INV_X1 \write_uut/U63  ( .A(\write_uut/wbinnext [1]), .ZN(\write_uut/n43 )
         );
  INV_X1 \write_uut/U62  ( .A(\write_uut/n41 ), .ZN(\write_uut/n58 ) );
  INV_X1 \write_uut/U61  ( .A(\write_uut/wbinnext [4]), .ZN(\write_uut/n40 )
         );
  XOR2_X1 \write_uut/U60  ( .A(\write_uut/n87 ), .B(sync_rdptr[6]), .Z(
        \write_uut/n62 ) );
  INV_X1 \write_uut/U59  ( .A(wraddr[7]), .ZN(\write_uut/n98 ) );
  NAND4_X1 \write_uut/U58  ( .A1(\write_uut/n38 ), .A2(\write_uut/n37 ), .A3(
        \write_uut/n36 ), .A4(\write_uut/n35 ), .ZN(\write_uut/n39 ) );
  NOR4_X1 \write_uut/U57  ( .A1(\write_uut/n105 ), .A2(\write_uut/n103 ), .A3(
        \write_uut/n110 ), .A4(\write_uut/n107 ), .ZN(\write_uut/n35 ) );
  INV_X1 \write_uut/U56  ( .A(wraddr[1]), .ZN(\write_uut/n107 ) );
  INV_X1 \write_uut/U55  ( .A(wraddr[0]), .ZN(\write_uut/n110 ) );
  INV_X1 \write_uut/U54  ( .A(wraddr[3]), .ZN(\write_uut/n103 ) );
  INV_X1 \write_uut/U53  ( .A(wraddr[2]), .ZN(\write_uut/n105 ) );
  INV_X1 \write_uut/U52  ( .A(\write_uut/n28 ), .ZN(\write_uut/n36 ) );
  INV_X1 \write_uut/U51  ( .A(\write_uut/n30 ), .ZN(\write_uut/n37 ) );
  INV_X1 \write_uut/U50  ( .A(\write_uut/n29 ), .ZN(\write_uut/n38 ) );
  NAND2_X1 \write_uut/U49  ( .A1(\write_uut/n34 ), .A2(\write_uut/n33 ), .ZN(
        \write_uut/n52 ) );
  INV_X1 \write_uut/U48  ( .A(\write_uut/n32 ), .ZN(\write_uut/n34 ) );
  NAND2_X1 \write_uut/U47  ( .A1(\write_uut/n32 ), .A2(\write_uut/n33 ), .ZN(
        \write_uut/n50 ) );
  INV_X1 \write_uut/U46  ( .A(flush), .ZN(\write_uut/n33 ) );
  NAND2_X1 \write_uut/U45  ( .A1(insert), .A2(\write_uut/n27 ), .ZN(
        \write_uut/n32 ) );
  INV_X2 \write_uut/U44  ( .A(\write_uut/n52 ), .ZN(\write_uut/n112 ) );
  XNOR2_X1 \write_uut/U43  ( .A(\write_uut/wbinnext [5]), .B(sync_rdptr[5]), 
        .ZN(\write_uut/n42 ) );
  XNOR2_X1 \write_uut/U42  ( .A(\write_uut/n4 ), .B(\write_uut/n3 ), .ZN(
        \write_uut/n59 ) );
  INV_X1 \write_uut/U41  ( .A(\write_uut/n40 ), .ZN(\write_uut/n25 ) );
  XNOR2_X1 \write_uut/U40  ( .A(\write_uut/wbinnext [2]), .B(sync_rdptr[2]), 
        .ZN(\write_uut/n44 ) );
  XNOR2_X1 \write_uut/U39  ( .A(\write_uut/n91 ), .B(sync_rdptr[7]), .ZN(
        \write_uut/n24 ) );
  INV_X1 \write_uut/U38  ( .A(\write_uut/n66 ), .ZN(\write_uut/n96 ) );
  INV_X1 \write_uut/U37  ( .A(\write_uut/n66 ), .ZN(\write_uut/n23 ) );
  XOR2_X1 \write_uut/U36  ( .A(\write_uut/n22 ), .B(\write_uut/n25 ), .Z(
        \write_uut/n21 ) );
  XNOR2_X1 \write_uut/U35  ( .A(\write_uut/wbinnext [8]), .B(sync_rdptr[8]), 
        .ZN(\write_uut/n45 ) );
  INV_X1 \write_uut/U34  ( .A(\write_uut/n63 ), .ZN(\write_uut/n20 ) );
  INV_X1 \write_uut/U33  ( .A(\write_uut/n8 ), .ZN(\write_uut/n19 ) );
  CLKBUF_X1 \write_uut/U32  ( .A(\write_uut/n17 ), .Z(\write_uut/n18 ) );
  CLKBUF_X1 \write_uut/U31  ( .A(\write_uut/wbinnext [5]), .Z(\write_uut/n17 )
         );
  INV_X1 \write_uut/U30  ( .A(\write_uut/n24 ), .ZN(\write_uut/n53 ) );
  AND2_X1 \write_uut/U29  ( .A1(\write_uut/n39 ), .A2(\write_uut/n98 ), .ZN(
        \write_uut/n16 ) );
  XOR2_X1 \write_uut/U28  ( .A(\write_uut/wbinnext [3]), .B(sync_rdptr[3]), 
        .Z(\write_uut/n22 ) );
  XNOR2_X1 \write_uut/U27  ( .A(\write_uut/n43 ), .B(sync_rdptr[1]), .ZN(
        \write_uut/n15 ) );
  XNOR2_X1 \write_uut/U26  ( .A(\write_uut/n15 ), .B(\write_uut/n26 ), .ZN(
        \write_uut/n47 ) );
  XNOR2_X1 \write_uut/U25  ( .A(\write_uut/wbinnext [6]), .B(
        \write_uut/wbinnext [7]), .ZN(\write_uut/n87 ) );
  XNOR2_X1 \write_uut/U24  ( .A(\write_uut/wbinnext [0]), .B(
        \write_uut/wbinnext [1]), .ZN(\write_uut/n67 ) );
  XNOR2_X1 \write_uut/U23  ( .A(\write_uut/n67 ), .B(\write_uut/n14 ), .ZN(
        \write_uut/n48 ) );
  BUF_X2 \write_uut/U22  ( .A(\write_uut/wbinnext [2]), .Z(\write_uut/n26 ) );
  NAND2_X1 \write_uut/U21  ( .A1(\write_uut/n61 ), .A2(\write_uut/n7 ), .ZN(
        \write_uut/n65 ) );
  AND2_X2 \write_uut/U20  ( .A1(\write_uut/n68 ), .A2(\write_uut/n16 ), .ZN(
        \write_uut/n12 ) );
  NAND2_X1 \write_uut/U19  ( .A1(\write_uut/n12 ), .A2(\write_uut/n9 ), .ZN(
        \write_uut/n108 ) );
  XNOR2_X1 \write_uut/U18  ( .A(\write_uut/wbinnext [7]), .B(
        \write_uut/wbinnext [8]), .ZN(\write_uut/n91 ) );
  INV_X1 \write_uut/U17  ( .A(\write_uut/n21 ), .ZN(\write_uut/n10 ) );
  AND4_X1 \write_uut/U16  ( .A1(\write_uut/n5 ), .A2(\write_uut/n11 ), .A3(
        \write_uut/n41 ), .A4(\write_uut/n10 ), .ZN(\write_uut/n49 ) );
  AND4_X1 \write_uut/U15  ( .A1(\write_uut/n48 ), .A2(\write_uut/n45 ), .A3(
        \write_uut/n47 ), .A4(\write_uut/n46 ), .ZN(\write_uut/n11 ) );
  AND2_X1 \write_uut/U14  ( .A1(\write_uut/n3 ), .A2(\write_uut/n112 ), .ZN(
        \write_uut/n9 ) );
  AND3_X1 \write_uut/U13  ( .A1(\write_uut/n62 ), .A2(\write_uut/n10 ), .A3(
        \write_uut/n112 ), .ZN(\write_uut/n7 ) );
  INV_X1 \write_uut/U12  ( .A(sync_rdptr[0]), .ZN(\write_uut/n14 ) );
  XNOR2_X1 \write_uut/U11  ( .A(\write_uut/wbinnext [5]), .B(\write_uut/n6 ), 
        .ZN(\write_uut/n41 ) );
  XOR2_X1 \write_uut/U10  ( .A(\write_uut/n42 ), .B(\write_uut/n3 ), .Z(
        \write_uut/n5 ) );
  XNOR2_X1 \write_uut/U9  ( .A(\write_uut/wbinnext [5]), .B(sync_rdptr[5]), 
        .ZN(\write_uut/n4 ) );
  BUF_X2 \write_uut/U8  ( .A(\write_uut/wbinnext [6]), .Z(\write_uut/n3 ) );
  BUF_X1 \write_uut/U7  ( .A(\write_uut/n87 ), .Z(\write_uut/n2 ) );
  CLKBUF_X1 \write_uut/U6  ( .A(\write_uut/wbinnext [8]), .Z(\write_uut/n13 )
         );
  XOR2_X1 \write_uut/U5  ( .A(\write_uut/wbinnext [4]), .B(sync_rdptr[4]), .Z(
        \write_uut/n6 ) );
  INV_X1 \write_uut/U4  ( .A(\write_uut/n43 ), .ZN(\write_uut/n1 ) );
  AND2_X2 \write_uut/U3  ( .A1(\write_uut/n68 ), .A2(\write_uut/n16 ), .ZN(
        \write_uut/n8 ) );
  DFFR_X1 \write_uut/wrptr_reg[8]  ( .D(\write_uut/n54 ), .CK(clk_in), .RN(rst), .Q(wrptr[8]), .QN(\write_uut/n31 ) );
  DFFR_X1 \write_uut/wrptr_reg[4]  ( .D(\write_uut/n123 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[4]), .QN(\write_uut/n83 ) );
  DFFR_X1 \write_uut/wrptr_reg[5]  ( .D(\write_uut/n124 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[5]), .QN(\write_uut/n86 ) );
  DFFR_X1 \write_uut/wrptr_reg[6]  ( .D(\write_uut/n125 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[6]), .QN(\write_uut/n90 ) );
  DFFR_X1 \write_uut/wrptr_reg[7]  ( .D(\write_uut/n126 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[7]), .QN(\write_uut/n94 ) );
  DFFR_X1 \write_uut/wrptr_reg[2]  ( .D(\write_uut/n121 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[2]), .QN(\write_uut/n77 ) );
  DFFR_X1 \write_uut/wrptr_reg[3]  ( .D(\write_uut/n122 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[3]), .QN(\write_uut/n80 ) );
  DFFR_X1 \write_uut/wrptr_reg[0]  ( .D(\write_uut/n119 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[0]), .QN(\write_uut/n71 ) );
  DFFR_X1 \write_uut/wrptr_reg[1]  ( .D(\write_uut/n120 ), .CK(clk_in), .RN(
        rst), .Q(wrptr[1]), .QN(\write_uut/n74 ) );
  DFFR_X1 \write_uut/wbin_reg[8]  ( .D(\write_uut/n114 ), .CK(clk_in), .RN(rst), .Q(\write_uut/wbin[8] ), .QN(\write_uut/n64 ) );
  DFFR_X1 \write_uut/wren_reg  ( .D(\write_uut/n112 ), .CK(clk_in), .RN(rst), 
        .Q(wren) );
  DFFR_X1 \write_uut/wbin_reg[7]  ( .D(\write_uut/n115 ), .CK(clk_in), .RN(rst), .Q(wraddr[7]) );
  DFFR_X1 \write_uut/wbin_reg[5]  ( .D(\write_uut/n56 ), .CK(clk_in), .RN(rst), 
        .Q(wraddr[5]), .QN(\write_uut/n29 ) );
  DFFR_X1 \write_uut/wbin_reg[4]  ( .D(\write_uut/n55 ), .CK(clk_in), .RN(rst), 
        .Q(wraddr[4]), .QN(\write_uut/n30 ) );
  DFFR_X1 \write_uut/wbin_reg[3]  ( .D(\write_uut/n116 ), .CK(clk_in), .RN(rst), .Q(wraddr[3]) );
  DFFR_X1 \write_uut/wbin_reg[2]  ( .D(\write_uut/n117 ), .CK(clk_in), .RN(rst), .Q(wraddr[2]) );
  DFFR_X1 \write_uut/wbin_reg[1]  ( .D(\write_uut/n118 ), .CK(clk_in), .RN(rst), .Q(wraddr[1]) );
  DFFR_X1 \write_uut/wbin_reg[6]  ( .D(\write_uut/n57 ), .CK(clk_in), .RN(rst), 
        .Q(wraddr[6]), .QN(\write_uut/n28 ) );
  DFFR_X1 \write_uut/full_reg  ( .D(\write_uut/N36 ), .CK(clk_in), .RN(rst), 
        .Q(full), .QN(\write_uut/n27 ) );
  DFFR_X1 \write_uut/wbin_reg[0]  ( .D(\write_uut/n113 ), .CK(clk_in), .RN(rst), .Q(wraddr[0]) );
  XNOR2_X1 \write_uut/add_168/U28  ( .A(\write_uut/add_168/n5 ), .B(wraddr[2]), 
        .ZN(\write_uut/wbinnext [2]) );
  NAND3_X1 \write_uut/add_168/U27  ( .A1(wraddr[1]), .A2(wraddr[0]), .A3(
        wraddr[2]), .ZN(\write_uut/add_168/n17 ) );
  NAND3_X1 \write_uut/add_168/U26  ( .A1(\write_uut/add_168/n1 ), .A2(
        wraddr[4]), .A3(wraddr[5]), .ZN(\write_uut/add_168/n14 ) );
  NAND2_X1 \write_uut/add_168/U25  ( .A1(wraddr[1]), .A2(wraddr[0]), .ZN(
        \write_uut/add_168/n12 ) );
  NAND2_X1 \write_uut/add_168/U24  ( .A1(wraddr[3]), .A2(wraddr[2]), .ZN(
        \write_uut/add_168/n13 ) );
  NAND2_X1 \write_uut/add_168/U23  ( .A1(\write_uut/add_168/n10 ), .A2(
        \write_uut/add_168/n11 ), .ZN(\write_uut/add_168/n9 ) );
  XNOR2_X1 \write_uut/add_168/U22  ( .A(\write_uut/add_168/n9 ), .B(wraddr[7]), 
        .ZN(\write_uut/wbinnext [7]) );
  NAND2_X1 \write_uut/add_168/U21  ( .A1(wraddr[5]), .A2(wraddr[4]), .ZN(
        \write_uut/add_168/n7 ) );
  NAND2_X1 \write_uut/add_168/U20  ( .A1(wraddr[7]), .A2(wraddr[6]), .ZN(
        \write_uut/add_168/n8 ) );
  NAND2_X1 \write_uut/add_168/U19  ( .A1(wraddr[1]), .A2(wraddr[0]), .ZN(
        \write_uut/add_168/n5 ) );
  NAND2_X1 \write_uut/add_168/U18  ( .A1(wraddr[3]), .A2(wraddr[2]), .ZN(
        \write_uut/add_168/n6 ) );
  NAND2_X1 \write_uut/add_168/U17  ( .A1(\write_uut/add_168/n4 ), .A2(
        \write_uut/add_168/n3 ), .ZN(\write_uut/add_168/n2 ) );
  NAND4_X1 \write_uut/add_168/U16  ( .A1(wraddr[3]), .A2(wraddr[2]), .A3(
        wraddr[1]), .A4(wraddr[0]), .ZN(\write_uut/add_168/n15 ) );
  XNOR2_X1 \write_uut/add_168/U15  ( .A(\write_uut/add_168/n18 ), .B(wraddr[0]), .ZN(\write_uut/wbinnext [1]) );
  XNOR2_X1 \write_uut/add_168/U14  ( .A(\write_uut/add_168/n15 ), .B(wraddr[4]), .ZN(\write_uut/wbinnext [4]) );
  INV_X1 \write_uut/add_168/U13  ( .A(wraddr[0]), .ZN(\write_uut/wbinnext [0])
         );
  NAND2_X1 \write_uut/add_168/U12  ( .A1(\write_uut/add_168/n1 ), .A2(
        wraddr[4]), .ZN(\write_uut/add_168/n16 ) );
  NOR2_X1 \write_uut/add_168/U11  ( .A1(\write_uut/add_168/n12 ), .A2(
        \write_uut/add_168/n13 ), .ZN(\write_uut/add_168/n11 ) );
  NOR2_X1 \write_uut/add_168/U10  ( .A1(\write_uut/add_168/n5 ), .A2(
        \write_uut/add_168/n6 ), .ZN(\write_uut/add_168/n4 ) );
  INV_X1 \write_uut/add_168/U9  ( .A(wraddr[1]), .ZN(\write_uut/add_168/n18 )
         );
  XNOR2_X2 \write_uut/add_168/U8  ( .A(\write_uut/add_168/n17 ), .B(wraddr[3]), 
        .ZN(\write_uut/wbinnext [3]) );
  AND3_X1 \write_uut/add_168/U7  ( .A1(wraddr[5]), .A2(wraddr[6]), .A3(
        wraddr[4]), .ZN(\write_uut/add_168/n10 ) );
  NOR2_X1 \write_uut/add_168/U6  ( .A1(\write_uut/add_168/n7 ), .A2(
        \write_uut/add_168/n8 ), .ZN(\write_uut/add_168/n3 ) );
  AND4_X1 \write_uut/add_168/U5  ( .A1(wraddr[3]), .A2(wraddr[2]), .A3(
        wraddr[1]), .A4(wraddr[0]), .ZN(\write_uut/add_168/n1 ) );
  XNOR2_X2 \write_uut/add_168/U4  ( .A(\write_uut/add_168/n16 ), .B(wraddr[5]), 
        .ZN(\write_uut/wbinnext [5]) );
  XNOR2_X1 \write_uut/add_168/U3  ( .A(\write_uut/add_168/n14 ), .B(wraddr[6]), 
        .ZN(\write_uut/wbinnext [6]) );
  XNOR2_X2 \write_uut/add_168/U2  ( .A(\write_uut/add_168/n2 ), .B(
        \write_uut/wbin[8] ), .ZN(\write_uut/wbinnext [8]) );
endmodule

