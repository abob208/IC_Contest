
module DT_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module DT_DW01_inc_1 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module DT_DW01_inc_2 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module DT_DW01_inc_3 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_4 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  OAI21X1 U1 ( .A0(n2), .A1(n1), .B0(n15), .Y(SUM[11]) );
  OAI21X1 U2 ( .A0(n6), .A1(n3), .B0(n16), .Y(SUM[10]) );
  CLKINVX1 U3 ( .A(n16), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U5 ( .A(A[10]), .Y(n3) );
  CLKINVX1 U6 ( .A(A[11]), .Y(n1) );
  AO21X1 U7 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  OAI2BB1X1 U8 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1X1 U9 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1X1 U10 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1X1 U11 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1X1 U12 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1X1 U13 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1X1 U14 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1X1 U15 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  XOR2X1 U16 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  NOR2X1 U17 ( .A(A[12]), .B(n15), .Y(n14) );
  XNOR2X1 U18 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  NAND2X1 U19 ( .A(n2), .B(n1), .Y(n15) );
  NAND2X1 U20 ( .A(n6), .B(n3), .Y(n16) );
  NOR2X1 U21 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2X1 U22 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2X1 U23 ( .A(n8), .B(A[7]), .Y(n7) );
  OR2X1 U24 ( .A(n9), .B(A[6]), .Y(n8) );
  OR2X1 U25 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2X1 U26 ( .A(n11), .B(A[4]), .Y(n10) );
  OR2X1 U27 ( .A(n12), .B(A[3]), .Y(n11) );
  OR2X1 U28 ( .A(n13), .B(A[2]), .Y(n12) );
  NAND2BX1 U29 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
endmodule


module DT_DW01_inc_5 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [13:2] carry;

  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_11 ( .A(A[11]), .B(n1), .CO(carry[12]), .S(SUM[11]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(n3), .CO(carry[3]), .S(SUM[2]) );
  CLKXOR2X1 U1 ( .A(A[1]), .B(A[0]), .Y(SUM[1]) );
  AND2X6 U2 ( .A(A[1]), .B(A[0]), .Y(n3) );
  XOR2X1 U3 ( .A(A[12]), .B(carry[12]), .Y(SUM[12]) );
  NAND2X1 U4 ( .A(n7), .B(n8), .Y(SUM[13]) );
  NAND2X1 U5 ( .A(n5), .B(A[13]), .Y(n8) );
  AND2X2 U6 ( .A(A[10]), .B(n2), .Y(n1) );
  AND2X2 U7 ( .A(A[9]), .B(carry[9]), .Y(n2) );
  AND2X6 U8 ( .A(A[11]), .B(n1), .Y(n4) );
  XOR2X1 U9 ( .A(A[9]), .B(carry[9]), .Y(SUM[9]) );
  XOR2X1 U10 ( .A(A[10]), .B(n2), .Y(SUM[10]) );
  NAND2XL U11 ( .A(carry[13]), .B(n6), .Y(n7) );
  CLKINVX1 U12 ( .A(n5), .Y(carry[13]) );
  NAND2X1 U13 ( .A(A[12]), .B(n4), .Y(n5) );
  CLKINVX1 U14 ( .A(A[13]), .Y(n6) );
  CLKINVX1 U15 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di, fwpass_finish );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd, fwpass_finish;
  wire   N105, N106, N107, N108, N109, N110, N111, N112, N113, N114, N136,
         N137, N138, N139, N140, N141, N142, N143, N144, N145, N146, N147,
         N148, N149, N171, N172, N173, N174, N175, N176, N177, N178, N179,
         N180, N181, N182, N183, N184, N189, N190, N191, N192, N193, N194,
         N195, N196, N197, N198, N199, N200, N201, N203, N204, N205, N206,
         N207, N208, N209, N211, N212, N213, N214, N215, N216, N220, N221,
         N222, N223, N224, N225, N226, N227, N228, N229, N230, N231, N235,
         N236, N237, N238, N239, N240, N241, N242, N243, N244, N245, N246,
         N247, N248, N249, N250, N307, N308, N309, N310, N311, N312, N313,
         N314, N315, N316, N317, N318, N319, N320, N399, N400, N401, N402,
         N403, N404, N405, N406, N407, N408, N409, N410, N411, N421, N422,
         N423, N424, N425, N426, N429, N430, N431, N432, N433, N434, N435,
         N436, N437, N438, N439, N440, N441, N452, N453, N465, N466, N468,
         N469, N470, N471, N472, N473, N474, N475, N484, N485, N486, N487,
         N488, N489, N490, N491, N562, N563, N564, N565, N566, N567, N568,
         N569, N570, N571, N572, N573, N574, N575, N576, N577, N578, N579,
         N580, N581, N582, N583, N584, N585, N586, N587, N588, N589, N590,
         N591, N593, N594, N595, N596, N597, N598, N599, N600, N601, N602,
         N603, N604, N605, N606, N607, N608, N609, N610, N611, N612, N613,
         N614, N615, N616, N617, N618, N619, N620, N621, N622, N623,
         \add_165/carry[2] , \add_165/carry[3] , \add_165/carry[4] ,
         \add_165/carry[5] , \add_165/carry[6] , \add_165/carry[7] ,
         \add_165/carry[8] , \add_165/carry[9] , \add_165/carry[10] ,
         \add_165/carry[11] , \add_165/carry[12] , \add_165/carry[13] ,
         \add_156/carry[13] , \add_156/carry[12] , \add_156/carry[11] ,
         \add_156/carry[10] , \add_156/carry[9] , \add_147/carry[2] ,
         \add_147/carry[3] , \add_147/carry[4] , \add_147/carry[5] ,
         \add_147/carry[6] , \add_147/carry[7] , \add_147/carry[8] ,
         \add_147/carry[9] , \add_147/carry[10] , \add_147/carry[11] ,
         \add_147/carry[12] , \add_147/carry[13] , \sub_87/carry[2] ,
         \sub_87/carry[3] , \sub_87/carry[4] , \sub_87/carry[5] ,
         \sub_87/carry[6] , \sub_87/carry[7] , \sub_87/carry[8] ,
         \sub_87/carry[9] , \sub_87/carry[10] , \sub_87/carry[11] ,
         \sub_87/carry[12] , \sub_87/carry[13] , \sub_78/carry[13] ,
         \sub_78/carry[12] , \sub_78/carry[11] , \sub_78/carry[10] ,
         \sub_78/carry[9] , \sub_69/carry[2] , \sub_69/carry[3] ,
         \sub_69/carry[4] , \sub_69/carry[5] , \sub_69/carry[6] ,
         \sub_69/carry[7] , \sub_69/carry[8] , \sub_69/carry[9] ,
         \sub_69/carry[10] , \sub_69/carry[11] , \sub_69/carry[12] ,
         \sub_69/carry[13] , \r420/carry[13] , \r420/carry[12] ,
         \r420/carry[11] , \r420/carry[10] , \r420/carry[9] , \r420/carry[8] ,
         \r420/carry[7] , \r420/carry[6] , \r420/carry[5] , \r420/carry[4] ,
         \r420/carry[3] , \r420/carry[2] , \r420/carry[1] , \r420/B[0] , n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531;
  wire   [13:0] count;
  wire   [3:0] state;
  wire   [7:0] bc_pixel;

  DT_DW01_inc_0 add_185 ( .A(res_do), .SUM({N491, N490, N489, N488, N487, N486, 
        N485, N484}) );
  DT_DW01_inc_1 add_177 ( .A(res_di), .SUM({N475, N474, N473, N472, N471, N470, 
        N469, N468}) );
  DT_DW01_inc_2 add_42 ( .A(sti_addr), .SUM({N114, N113, N112, N111, N110, 
        N109, N108, N107, N106, N105}) );
  DT_DW01_inc_3 r427 ( .A({1'b0, res_do}), .SUM({N452, N250, N249, N248, N247, 
        N246, N245, N244, N243}) );
  DT_DW01_inc_4 r426 ( .A({1'b0, res_di}), .SUM({N465, N242, N241, N240, N239, 
        N238, N237, N236, N235}) );
  DT_DW01_dec_0 r421 ( .A({count[13], n291, n290, n289, n288, n287, n286, n285, 
        n284, n283, n282, n281, n474, n358}), .SUM({N184, N183, N182, N181, 
        N180, N179, N178, N177, N176, N175, N174, N173, N172, N171}) );
  DT_DW01_inc_5 r418 ( .A({count[13], n291, n290, n289, n288, n287, n286, n285, 
        n284, n283, n282, n281, N204, N203}), .SUM({N149, N148, N147, N146, 
        N145, N144, N143, N142, N141, N140, N139, N138, N137, N136}) );
  EDFFX1 \sti_addr_reg[9]  ( .D(N575), .E(n279), .CK(clk), .Q(sti_addr[9]) );
  EDFFX1 \sti_addr_reg[4]  ( .D(N570), .E(n279), .CK(clk), .Q(sti_addr[4]) );
  EDFFX1 \sti_addr_reg[5]  ( .D(N571), .E(n279), .CK(clk), .Q(sti_addr[5]) );
  EDFFX1 \sti_addr_reg[6]  ( .D(N572), .E(n279), .CK(clk), .Q(sti_addr[6]) );
  EDFFX1 \sti_addr_reg[7]  ( .D(N573), .E(n279), .CK(clk), .Q(sti_addr[7]) );
  EDFFX1 \sti_addr_reg[8]  ( .D(N574), .E(n279), .CK(clk), .Q(sti_addr[8]) );
  EDFFX1 \sti_addr_reg[1]  ( .D(N567), .E(n279), .CK(clk), .Q(sti_addr[1]) );
  EDFFX1 \sti_addr_reg[2]  ( .D(N568), .E(n279), .CK(clk), .Q(sti_addr[2]) );
  EDFFX1 \sti_addr_reg[3]  ( .D(N569), .E(n279), .CK(clk), .Q(sti_addr[3]) );
  EDFFX1 \sti_addr_reg[0]  ( .D(N566), .E(n279), .CK(clk), .Q(sti_addr[0]) );
  EDFFX1 \bc_pixel_reg[7]  ( .D(res_di[7]), .E(n292), .CK(clk), .Q(bc_pixel[7]) );
  EDFFX1 \bc_pixel_reg[0]  ( .D(res_di[0]), .E(n292), .CK(clk), .Q(bc_pixel[0]) );
  EDFFX1 \state_reg[1]  ( .D(N622), .E(N620), .CK(clk), .Q(state[1]), .QN(n258) );
  EDFFX1 \bc_pixel_reg[6]  ( .D(res_di[6]), .E(n292), .CK(clk), .Q(bc_pixel[6]), .QN(n263) );
  EDFFX1 \bc_pixel_reg[1]  ( .D(res_di[1]), .E(n292), .CK(clk), .Q(bc_pixel[1]) );
  EDFFX1 \state_reg[0]  ( .D(N621), .E(N620), .CK(clk), .Q(state[0]) );
  EDFFX1 \bc_pixel_reg[3]  ( .D(res_di[3]), .E(n292), .CK(clk), .Q(bc_pixel[3]) );
  EDFFX1 \state_reg[2]  ( .D(N623), .E(N620), .CK(clk), .Q(state[2]), .QN(n257) );
  EDFFX1 \bc_pixel_reg[4]  ( .D(res_di[4]), .E(n292), .CK(clk), .Q(bc_pixel[4]) );
  EDFFX1 \bc_pixel_reg[2]  ( .D(res_di[2]), .E(n292), .CK(clk), .Q(bc_pixel[2]) );
  EDFFX1 \res_do_reg[7]  ( .D(N603), .E(N595), .CK(clk), .Q(res_do[7]), .QN(
        n264) );
  EDFFX1 \bc_pixel_reg[5]  ( .D(res_di[5]), .E(n292), .CK(clk), .Q(bc_pixel[5]) );
  EDFFX1 done_reg ( .D(n280), .E(N562), .CK(clk), .Q(done), .QN(n524) );
  EDFFX1 fwpass_finish_reg ( .D(n278), .E(N604), .CK(clk), .Q(fwpass_finish), 
        .QN(n525) );
  EDFFX1 \count_reg[10]  ( .D(N616), .E(n267), .CK(clk), .Q(count[10]) );
  EDFFX1 \count_reg[9]  ( .D(N615), .E(n267), .CK(clk), .Q(count[9]) );
  EDFFX1 \count_reg[8]  ( .D(N614), .E(n267), .CK(clk), .Q(count[8]) );
  EDFFX1 \count_reg[7]  ( .D(N613), .E(n267), .CK(clk), .Q(count[7]), .QN(n520) );
  EDFFX1 \count_reg[6]  ( .D(N612), .E(n267), .CK(clk), .Q(N209), .QN(n521) );
  EDFFX1 \count_reg[5]  ( .D(N611), .E(n267), .CK(clk), .Q(N208), .QN(n523) );
  EDFFX1 \count_reg[4]  ( .D(N610), .E(n267), .CK(clk), .Q(N207), .QN(n522) );
  EDFFX1 \count_reg[3]  ( .D(N609), .E(n267), .CK(clk), .Q(N206), .QN(n526) );
  EDFFX1 sti_rd_reg ( .D(n278), .E(n279), .CK(clk), .Q(sti_rd) );
  EDFFX1 \res_do_reg[6]  ( .D(N602), .E(N595), .CK(clk), .Q(res_do[6]), .QN(
        n260) );
  EDFFX1 \res_do_reg[3]  ( .D(N599), .E(N595), .CK(clk), .Q(res_do[3]), .QN(
        n259) );
  EDFFX1 \res_do_reg[2]  ( .D(N598), .E(N595), .CK(clk), .Q(res_do[2]) );
  EDFFX1 \res_do_reg[1]  ( .D(N597), .E(N595), .CK(clk), .Q(res_do[1]), .QN(
        n261) );
  EDFFX1 \res_do_reg[0]  ( .D(N596), .E(N595), .CK(clk), .Q(res_do[0]), .QN(
        n530) );
  EDFFX1 \res_do_reg[4]  ( .D(N600), .E(N595), .CK(clk), .Q(res_do[4]) );
  EDFFX1 \res_do_reg[5]  ( .D(N601), .E(N595), .CK(clk), .Q(res_do[5]) );
  EDFFX1 res_rd_reg ( .D(N594), .E(N593), .CK(clk), .Q(res_rd) );
  EDFFX1 \res_addr_reg[13]  ( .D(N590), .E(n276), .CK(clk), .Q(res_addr[13])
         );
  EDFFX1 \res_addr_reg[12]  ( .D(N589), .E(n276), .CK(clk), .Q(res_addr[12])
         );
  EDFFX1 \res_addr_reg[11]  ( .D(N588), .E(n276), .CK(clk), .Q(res_addr[11])
         );
  EDFFX1 \res_addr_reg[10]  ( .D(N587), .E(n276), .CK(clk), .Q(res_addr[10])
         );
  EDFFX1 \res_addr_reg[9]  ( .D(N586), .E(n276), .CK(clk), .Q(res_addr[9]) );
  EDFFX1 \res_addr_reg[8]  ( .D(N585), .E(n276), .CK(clk), .Q(res_addr[8]) );
  EDFFX1 \res_addr_reg[7]  ( .D(N584), .E(n276), .CK(clk), .Q(res_addr[7]) );
  EDFFX1 \res_addr_reg[6]  ( .D(N583), .E(n276), .CK(clk), .Q(res_addr[6]) );
  EDFFX1 \res_addr_reg[5]  ( .D(N582), .E(n276), .CK(clk), .Q(res_addr[5]) );
  EDFFX1 \res_addr_reg[4]  ( .D(N581), .E(n276), .CK(clk), .Q(res_addr[4]) );
  EDFFX1 \res_addr_reg[3]  ( .D(N580), .E(n276), .CK(clk), .Q(res_addr[3]) );
  EDFFX1 \res_addr_reg[2]  ( .D(N579), .E(n276), .CK(clk), .Q(res_addr[2]) );
  EDFFX1 \res_addr_reg[1]  ( .D(N578), .E(n276), .CK(clk), .Q(res_addr[1]) );
  EDFFX1 \res_addr_reg[0]  ( .D(N577), .E(n276), .CK(clk), .Q(res_addr[0]) );
  EDFFX1 res_wr_reg ( .D(n531), .E(N591), .CK(clk), .Q(res_wr) );
  EDFFX2 \count_reg[13]  ( .D(N619), .E(n267), .CK(clk), .Q(count[13]) );
  EDFFX2 \count_reg[0]  ( .D(N606), .E(n267), .CK(clk), .Q(N203), .QN(n527) );
  EDFFXL \count_reg[11]  ( .D(N617), .E(n267), .CK(clk), .Q(count[11]) );
  EDFFXL \count_reg[12]  ( .D(N618), .E(n267), .CK(clk), .Q(count[12]) );
  EDFFX1 \count_reg[2]  ( .D(N608), .E(n267), .CK(clk), .Q(N205), .QN(n529) );
  EDFFX2 \count_reg[1]  ( .D(N607), .E(n267), .CK(clk), .Q(N204), .QN(n528) );
  NAND4X4 U274 ( .A(n363), .B(n364), .C(n365), .D(n366), .Y(n350) );
  OR2X1 U275 ( .A(n350), .B(N136), .Y(\r420/carry[1] ) );
  OR2X1 U276 ( .A(N142), .B(\r420/carry[6] ), .Y(\r420/carry[7] ) );
  CLKINVX1 U277 ( .A(n350), .Y(\r420/B[0] ) );
  NOR2X1 U278 ( .A(n504), .B(n484), .Y(n262) );
  NOR2BX2 U279 ( .AN(n389), .B(n345), .Y(n372) );
  NOR2X2 U280 ( .A(n333), .B(n390), .Y(n374) );
  CLKINVX1 U281 ( .A(n391), .Y(n390) );
  NOR2X2 U282 ( .A(n391), .B(n333), .Y(n370) );
  OAI22X1 U283 ( .A0(n395), .A1(n396), .B0(res_di[7]), .B1(n264), .Y(n391) );
  NOR3X2 U284 ( .A(n390), .B(N466), .C(n345), .Y(n373) );
  OAI31X1 U285 ( .A0(n349), .A1(n528), .A2(n527), .B0(n350), .Y(n332) );
  OAI211X4 U286 ( .A0(n340), .A1(n392), .B0(n331), .C0(reset), .Y(N595) );
  NOR3X2 U287 ( .A(n391), .B(N453), .C(n345), .Y(n371) );
  OR2X1 U288 ( .A(N141), .B(\r420/carry[5] ), .Y(\r420/carry[6] ) );
  XNOR2X1 U289 ( .A(\r420/carry[10] ), .B(N146), .Y(N317) );
  OR2X1 U290 ( .A(\r420/carry[8] ), .B(N144), .Y(n265) );
  OR2X1 U291 ( .A(n265), .B(n266), .Y(\r420/carry[11] ) );
  OR2X1 U292 ( .A(N145), .B(\r420/carry[9] ), .Y(\r420/carry[10] ) );
  CLKBUFX3 U293 ( .A(count[9]), .Y(n288) );
  INVX3 U294 ( .A(n527), .Y(n358) );
  CLKBUFX3 U295 ( .A(count[10]), .Y(n289) );
  OR2X1 U296 ( .A(N146), .B(N145), .Y(n266) );
  CLKBUFX3 U297 ( .A(N206), .Y(n282) );
  CLKBUFX3 U298 ( .A(N205), .Y(n281) );
  XNOR2XL U299 ( .A(\r420/carry[11] ), .B(N147), .Y(N318) );
  INVX3 U300 ( .A(n528), .Y(n474) );
  OAI211XL U301 ( .A0(n332), .A1(n333), .B0(n334), .C0(n335), .Y(N622) );
  OR2X1 U302 ( .A(N147), .B(\r420/carry[11] ), .Y(\r420/carry[12] ) );
  XNOR2X1 U303 ( .A(N149), .B(\r420/carry[13] ), .Y(N320) );
  AOI22XL U304 ( .A0(N439), .A1(n275), .B0(n274), .B1(N182), .Y(n432) );
  AOI22XL U305 ( .A0(N438), .A1(n275), .B0(n274), .B1(N181), .Y(n436) );
  INVXL U306 ( .A(n332), .Y(n344) );
  NOR2XL U307 ( .A(n355), .B(n413), .Y(n337) );
  CLKBUFX3 U308 ( .A(N208), .Y(n284) );
  CLKBUFX3 U309 ( .A(N207), .Y(n283) );
  OR4XL U310 ( .A(N181), .B(N182), .C(N183), .D(N184), .Y(n512) );
  AOI211XL U311 ( .A0(n348), .A1(n332), .B0(n336), .C0(n292), .Y(n347) );
  CLKBUFX3 U312 ( .A(count[12]), .Y(n291) );
  XNOR2XL U313 ( .A(\r420/carry[8] ), .B(N144), .Y(N315) );
  XNOR2XL U314 ( .A(\r420/carry[9] ), .B(N145), .Y(N316) );
  XNOR2XL U315 ( .A(\r420/carry[5] ), .B(N141), .Y(N312) );
  XNOR2XL U316 ( .A(\r420/carry[6] ), .B(N142), .Y(N313) );
  XNOR2XL U317 ( .A(\r420/carry[3] ), .B(N139), .Y(N310) );
  XNOR2XL U318 ( .A(\r420/carry[4] ), .B(N140), .Y(N311) );
  XNOR2XL U319 ( .A(\r420/carry[1] ), .B(N137), .Y(N308) );
  XNOR2XL U320 ( .A(\r420/carry[2] ), .B(N138), .Y(N309) );
  AOI22X1 U321 ( .A0(N411), .A1(n271), .B0(N149), .B1(n292), .Y(n414) );
  AOI22XL U322 ( .A0(N408), .A1(n271), .B0(N146), .B1(n292), .Y(n434) );
  AOI22XL U323 ( .A0(N407), .A1(n271), .B0(N145), .B1(n292), .Y(n438) );
  AND3X2 U324 ( .A(N149), .B(N147), .C(N148), .Y(n363) );
  OAI211XL U325 ( .A0(n355), .A1(n356), .B0(n357), .C0(reset), .Y(N613) );
  XNOR2XL U326 ( .A(\r420/carry[7] ), .B(N143), .Y(N314) );
  OAI211XL U327 ( .A0(n358), .A1(n355), .B0(n359), .C0(reset), .Y(N606) );
  XNOR2XL U328 ( .A(N136), .B(n350), .Y(N307) );
  OAI2BB1XL U329 ( .A0N(n360), .A1N(n333), .B0(\r420/B[0] ), .Y(n362) );
  XNOR2XL U330 ( .A(\r420/carry[12] ), .B(N148), .Y(N319) );
  OR2XL U331 ( .A(N204), .B(N203), .Y(\sub_69/carry[2] ) );
  AND2XL U332 ( .A(N203), .B(N204), .Y(\sub_87/carry[2] ) );
  OR2XL U333 ( .A(n474), .B(N203), .Y(\add_165/carry[2] ) );
  AND2XL U334 ( .A(N203), .B(N204), .Y(\add_147/carry[2] ) );
  AND2X2 U335 ( .A(n353), .B(N594), .Y(N623) );
  CLKBUFX3 U336 ( .A(N576), .Y(n276) );
  NAND2BX1 U337 ( .AN(N593), .B(n331), .Y(N576) );
  CLKBUFX3 U338 ( .A(n422), .Y(n274) );
  OAI21XL U339 ( .A0(n483), .A1(n484), .B0(n485), .Y(n422) );
  CLKBUFX3 U340 ( .A(n419), .Y(n268) );
  NAND3X1 U341 ( .A(n333), .B(n412), .C(n345), .Y(n419) );
  CLKBUFX3 U342 ( .A(n262), .Y(n292) );
  CLKINVX1 U343 ( .A(N248), .Y(n309) );
  CLKBUFX3 U344 ( .A(N565), .Y(n278) );
  CLKINVX1 U345 ( .A(n481), .Y(N565) );
  CLKBUFX3 U346 ( .A(N563), .Y(n280) );
  INVXL U347 ( .A(n355), .Y(N563) );
  CLKINVX1 U348 ( .A(N246), .Y(n308) );
  CLKBUFX3 U349 ( .A(N605), .Y(n267) );
  NAND3X1 U350 ( .A(n331), .B(n360), .C(n361), .Y(N605) );
  CLKBUFX3 U351 ( .A(n423), .Y(n269) );
  NOR2XL U352 ( .A(n341), .B(n355), .Y(n423) );
  CLKBUFX3 U353 ( .A(n421), .Y(n275) );
  NOR2XL U354 ( .A(n480), .B(n355), .Y(n421) );
  CLKBUFX3 U355 ( .A(n425), .Y(n271) );
  NOR2XL U356 ( .A(n394), .B(n355), .Y(n425) );
  CLKBUFX3 U357 ( .A(n424), .Y(n270) );
  NOR2XL U358 ( .A(n480), .B(n481), .Y(n424) );
  CLKBUFX3 U359 ( .A(n418), .Y(n272) );
  NOR2XL U360 ( .A(n341), .B(n481), .Y(n418) );
  CLKBUFX3 U361 ( .A(n420), .Y(n273) );
  NOR2XL U362 ( .A(n394), .B(n481), .Y(n420) );
  CLKBUFX3 U363 ( .A(n505), .Y(n277) );
  NOR2XL U364 ( .A(n481), .B(n506), .Y(n505) );
  CLKINVX1 U365 ( .A(N240), .Y(n328) );
  CLKINVX1 U366 ( .A(N238), .Y(n327) );
  CLKBUFX3 U367 ( .A(count[7]), .Y(n286) );
  CLKBUFX3 U368 ( .A(N209), .Y(n285) );
  CLKBUFX3 U369 ( .A(count[8]), .Y(n287) );
  CLKBUFX3 U370 ( .A(count[11]), .Y(n290) );
  CLKINVX1 U371 ( .A(N452), .Y(n311) );
  CLKINVX1 U372 ( .A(N250), .Y(n310) );
  CLKINVX1 U373 ( .A(N465), .Y(n330) );
  CLKINVX1 U374 ( .A(N242), .Y(n329) );
  CLKINVX1 U375 ( .A(N244), .Y(n307) );
  CLKINVX1 U376 ( .A(N236), .Y(n326) );
  CLKBUFX3 U377 ( .A(N564), .Y(n279) );
  OAI21XL U378 ( .A0(n481), .A1(n487), .B0(reset), .Y(N564) );
  XNOR2X1 U379 ( .A(count[13]), .B(\sub_69/carry[13] ), .Y(N201) );
  OR2X1 U380 ( .A(n291), .B(\sub_69/carry[12] ), .Y(\sub_69/carry[13] ) );
  XNOR2X1 U381 ( .A(\sub_69/carry[12] ), .B(n291), .Y(N200) );
  OR2X1 U382 ( .A(n290), .B(\sub_69/carry[11] ), .Y(\sub_69/carry[12] ) );
  XNOR2X1 U383 ( .A(\sub_69/carry[11] ), .B(n290), .Y(N199) );
  OR2X1 U384 ( .A(n289), .B(\sub_69/carry[10] ), .Y(\sub_69/carry[11] ) );
  XNOR2X1 U385 ( .A(\sub_69/carry[10] ), .B(n289), .Y(N198) );
  OR2X1 U386 ( .A(n288), .B(\sub_69/carry[9] ), .Y(\sub_69/carry[10] ) );
  XNOR2X1 U387 ( .A(\sub_69/carry[9] ), .B(n288), .Y(N197) );
  OR2X1 U388 ( .A(n287), .B(\sub_69/carry[8] ), .Y(\sub_69/carry[9] ) );
  XNOR2X1 U389 ( .A(\sub_69/carry[8] ), .B(n287), .Y(N196) );
  AND2X1 U390 ( .A(\sub_69/carry[7] ), .B(n286), .Y(\sub_69/carry[8] ) );
  XOR2X1 U391 ( .A(n286), .B(\sub_69/carry[7] ), .Y(N195) );
  OR2X1 U392 ( .A(n285), .B(\sub_69/carry[6] ), .Y(\sub_69/carry[7] ) );
  XNOR2X1 U393 ( .A(\sub_69/carry[6] ), .B(n285), .Y(N194) );
  OR2X1 U394 ( .A(n284), .B(\sub_69/carry[5] ), .Y(\sub_69/carry[6] ) );
  XNOR2X1 U395 ( .A(\sub_69/carry[5] ), .B(n284), .Y(N193) );
  OR2X1 U396 ( .A(n283), .B(\sub_69/carry[4] ), .Y(\sub_69/carry[5] ) );
  XNOR2X1 U397 ( .A(\sub_69/carry[4] ), .B(n283), .Y(N192) );
  OR2X1 U398 ( .A(n282), .B(\sub_69/carry[3] ), .Y(\sub_69/carry[4] ) );
  XNOR2X1 U399 ( .A(\sub_69/carry[3] ), .B(n282), .Y(N191) );
  OR2X1 U400 ( .A(n281), .B(\sub_69/carry[2] ), .Y(\sub_69/carry[3] ) );
  XNOR2X1 U401 ( .A(\sub_69/carry[2] ), .B(n281), .Y(N190) );
  XNOR2X1 U402 ( .A(N203), .B(n474), .Y(N189) );
  XNOR2X1 U403 ( .A(count[13]), .B(\sub_78/carry[13] ), .Y(N216) );
  OR2X1 U404 ( .A(n291), .B(\sub_78/carry[12] ), .Y(\sub_78/carry[13] ) );
  XNOR2X1 U405 ( .A(\sub_78/carry[12] ), .B(n291), .Y(N215) );
  OR2X1 U406 ( .A(n290), .B(\sub_78/carry[11] ), .Y(\sub_78/carry[12] ) );
  XNOR2X1 U407 ( .A(\sub_78/carry[11] ), .B(n290), .Y(N214) );
  OR2X1 U408 ( .A(n289), .B(\sub_78/carry[10] ), .Y(\sub_78/carry[11] ) );
  XNOR2X1 U409 ( .A(\sub_78/carry[10] ), .B(n289), .Y(N213) );
  OR2X1 U410 ( .A(n288), .B(\sub_78/carry[9] ), .Y(\sub_78/carry[10] ) );
  XNOR2X1 U411 ( .A(\sub_78/carry[9] ), .B(n288), .Y(N212) );
  OR2X1 U412 ( .A(n287), .B(n286), .Y(\sub_78/carry[9] ) );
  XNOR2X1 U413 ( .A(n286), .B(n287), .Y(N211) );
  XOR2X1 U414 ( .A(count[13]), .B(\add_165/carry[13] ), .Y(N441) );
  AND2X1 U415 ( .A(\add_165/carry[12] ), .B(n291), .Y(\add_165/carry[13] ) );
  XOR2X1 U416 ( .A(n291), .B(\add_165/carry[12] ), .Y(N440) );
  AND2X1 U417 ( .A(\add_165/carry[11] ), .B(n290), .Y(\add_165/carry[12] ) );
  XOR2X1 U418 ( .A(n290), .B(\add_165/carry[11] ), .Y(N439) );
  AND2X1 U419 ( .A(\add_165/carry[10] ), .B(n289), .Y(\add_165/carry[11] ) );
  XOR2X1 U420 ( .A(n289), .B(\add_165/carry[10] ), .Y(N438) );
  AND2X1 U421 ( .A(\add_165/carry[9] ), .B(n288), .Y(\add_165/carry[10] ) );
  XOR2X1 U422 ( .A(n288), .B(\add_165/carry[9] ), .Y(N437) );
  AND2X1 U423 ( .A(\add_165/carry[8] ), .B(n287), .Y(\add_165/carry[9] ) );
  XOR2X1 U424 ( .A(n287), .B(\add_165/carry[8] ), .Y(N436) );
  AND2X1 U425 ( .A(\add_165/carry[7] ), .B(n286), .Y(\add_165/carry[8] ) );
  XOR2X1 U426 ( .A(n286), .B(\add_165/carry[7] ), .Y(N435) );
  OR2X1 U427 ( .A(n285), .B(\add_165/carry[6] ), .Y(\add_165/carry[7] ) );
  XNOR2X1 U428 ( .A(\add_165/carry[6] ), .B(n285), .Y(N434) );
  OR2X1 U429 ( .A(n284), .B(\add_165/carry[5] ), .Y(\add_165/carry[6] ) );
  XNOR2X1 U430 ( .A(\add_165/carry[5] ), .B(n284), .Y(N433) );
  OR2X1 U431 ( .A(n283), .B(\add_165/carry[4] ), .Y(\add_165/carry[5] ) );
  XNOR2X1 U432 ( .A(\add_165/carry[4] ), .B(n283), .Y(N432) );
  OR2X1 U433 ( .A(n282), .B(\add_165/carry[3] ), .Y(\add_165/carry[4] ) );
  XNOR2X1 U434 ( .A(\add_165/carry[3] ), .B(n282), .Y(N431) );
  OR2X1 U435 ( .A(n281), .B(\add_165/carry[2] ), .Y(\add_165/carry[3] ) );
  XNOR2X1 U436 ( .A(\add_165/carry[2] ), .B(n281), .Y(N430) );
  XNOR2X1 U437 ( .A(N203), .B(n474), .Y(N429) );
  XNOR2X1 U438 ( .A(count[13]), .B(\sub_87/carry[13] ), .Y(N231) );
  OR2X1 U439 ( .A(n291), .B(\sub_87/carry[12] ), .Y(\sub_87/carry[13] ) );
  XNOR2X1 U440 ( .A(\sub_87/carry[12] ), .B(n291), .Y(N230) );
  OR2X1 U441 ( .A(n290), .B(\sub_87/carry[11] ), .Y(\sub_87/carry[12] ) );
  XNOR2X1 U442 ( .A(\sub_87/carry[11] ), .B(n290), .Y(N229) );
  OR2X1 U443 ( .A(n289), .B(\sub_87/carry[10] ), .Y(\sub_87/carry[11] ) );
  XNOR2X1 U444 ( .A(\sub_87/carry[10] ), .B(n289), .Y(N228) );
  OR2X1 U445 ( .A(n288), .B(\sub_87/carry[9] ), .Y(\sub_87/carry[10] ) );
  XNOR2X1 U446 ( .A(\sub_87/carry[9] ), .B(n288), .Y(N227) );
  OR2X1 U447 ( .A(n287), .B(\sub_87/carry[8] ), .Y(\sub_87/carry[9] ) );
  XNOR2X1 U448 ( .A(\sub_87/carry[8] ), .B(n287), .Y(N226) );
  OR2X1 U449 ( .A(n286), .B(\sub_87/carry[7] ), .Y(\sub_87/carry[8] ) );
  XNOR2X1 U450 ( .A(\sub_87/carry[7] ), .B(n286), .Y(N225) );
  AND2X1 U451 ( .A(\sub_87/carry[6] ), .B(n285), .Y(\sub_87/carry[7] ) );
  XOR2X1 U452 ( .A(n285), .B(\sub_87/carry[6] ), .Y(N224) );
  AND2X1 U453 ( .A(\sub_87/carry[5] ), .B(n284), .Y(\sub_87/carry[6] ) );
  XOR2X1 U454 ( .A(n284), .B(\sub_87/carry[5] ), .Y(N223) );
  AND2X1 U455 ( .A(\sub_87/carry[4] ), .B(n283), .Y(\sub_87/carry[5] ) );
  XOR2X1 U456 ( .A(n283), .B(\sub_87/carry[4] ), .Y(N222) );
  AND2X1 U457 ( .A(\sub_87/carry[3] ), .B(n282), .Y(\sub_87/carry[4] ) );
  XOR2X1 U458 ( .A(n282), .B(\sub_87/carry[3] ), .Y(N221) );
  AND2X1 U459 ( .A(\sub_87/carry[2] ), .B(n281), .Y(\sub_87/carry[3] ) );
  XOR2X1 U460 ( .A(n281), .B(\sub_87/carry[2] ), .Y(N220) );
  XOR2X1 U461 ( .A(count[13]), .B(\add_156/carry[13] ), .Y(N426) );
  AND2X1 U462 ( .A(\add_156/carry[12] ), .B(n291), .Y(\add_156/carry[13] ) );
  XOR2X1 U463 ( .A(n291), .B(\add_156/carry[12] ), .Y(N425) );
  AND2X1 U464 ( .A(\add_156/carry[11] ), .B(n290), .Y(\add_156/carry[12] ) );
  XOR2X1 U465 ( .A(n290), .B(\add_156/carry[11] ), .Y(N424) );
  AND2X1 U466 ( .A(\add_156/carry[10] ), .B(n289), .Y(\add_156/carry[11] ) );
  XOR2X1 U467 ( .A(n289), .B(\add_156/carry[10] ), .Y(N423) );
  AND2X1 U468 ( .A(\add_156/carry[9] ), .B(n288), .Y(\add_156/carry[10] ) );
  XOR2X1 U469 ( .A(n288), .B(\add_156/carry[9] ), .Y(N422) );
  AND2X1 U470 ( .A(n286), .B(n287), .Y(\add_156/carry[9] ) );
  XOR2X1 U471 ( .A(n287), .B(n286), .Y(N421) );
  XOR2X1 U472 ( .A(count[13]), .B(\add_147/carry[13] ), .Y(N411) );
  AND2X1 U473 ( .A(\add_147/carry[12] ), .B(n291), .Y(\add_147/carry[13] ) );
  XOR2X1 U474 ( .A(n291), .B(\add_147/carry[12] ), .Y(N410) );
  AND2X1 U475 ( .A(\add_147/carry[11] ), .B(n290), .Y(\add_147/carry[12] ) );
  XOR2X1 U476 ( .A(n290), .B(\add_147/carry[11] ), .Y(N409) );
  AND2X1 U477 ( .A(\add_147/carry[10] ), .B(n289), .Y(\add_147/carry[11] ) );
  XOR2X1 U478 ( .A(n289), .B(\add_147/carry[10] ), .Y(N408) );
  AND2X1 U479 ( .A(\add_147/carry[9] ), .B(n288), .Y(\add_147/carry[10] ) );
  XOR2X1 U480 ( .A(n288), .B(\add_147/carry[9] ), .Y(N407) );
  AND2X1 U481 ( .A(\add_147/carry[8] ), .B(n287), .Y(\add_147/carry[9] ) );
  XOR2X1 U482 ( .A(n287), .B(\add_147/carry[8] ), .Y(N406) );
  OR2X1 U483 ( .A(n286), .B(\add_147/carry[7] ), .Y(\add_147/carry[8] ) );
  XNOR2X1 U484 ( .A(\add_147/carry[7] ), .B(n286), .Y(N405) );
  AND2X1 U485 ( .A(\add_147/carry[6] ), .B(n285), .Y(\add_147/carry[7] ) );
  XOR2X1 U486 ( .A(n285), .B(\add_147/carry[6] ), .Y(N404) );
  AND2X1 U487 ( .A(\add_147/carry[5] ), .B(n284), .Y(\add_147/carry[6] ) );
  XOR2X1 U488 ( .A(n284), .B(\add_147/carry[5] ), .Y(N403) );
  AND2X1 U489 ( .A(\add_147/carry[4] ), .B(n283), .Y(\add_147/carry[5] ) );
  XOR2X1 U490 ( .A(n283), .B(\add_147/carry[4] ), .Y(N402) );
  AND2X1 U491 ( .A(\add_147/carry[3] ), .B(n282), .Y(\add_147/carry[4] ) );
  XOR2X1 U492 ( .A(n282), .B(\add_147/carry[3] ), .Y(N401) );
  AND2X1 U493 ( .A(\add_147/carry[2] ), .B(n281), .Y(\add_147/carry[3] ) );
  XOR2X1 U494 ( .A(n281), .B(\add_147/carry[2] ), .Y(N400) );
  XOR2X1 U495 ( .A(n474), .B(N203), .Y(N399) );
  OR2X1 U496 ( .A(N148), .B(\r420/carry[12] ), .Y(\r420/carry[13] ) );
  OR2X1 U497 ( .A(N144), .B(\r420/carry[8] ), .Y(\r420/carry[9] ) );
  OR2X1 U498 ( .A(N143), .B(\r420/carry[7] ), .Y(\r420/carry[8] ) );
  OR2X1 U499 ( .A(N140), .B(\r420/carry[4] ), .Y(\r420/carry[5] ) );
  OR2X1 U500 ( .A(N139), .B(\r420/carry[3] ), .Y(\r420/carry[4] ) );
  OR2X1 U501 ( .A(N138), .B(\r420/carry[2] ), .Y(\r420/carry[3] ) );
  OR2X1 U502 ( .A(N137), .B(\r420/carry[1] ), .Y(\r420/carry[2] ) );
  NAND2BX1 U503 ( .AN(bc_pixel[4]), .B(N247), .Y(n293) );
  OAI222XL U504 ( .A0(bc_pixel[5]), .A1(n309), .B0(bc_pixel[5]), .B1(n293), 
        .C0(n309), .C1(n293), .Y(n294) );
  OAI222XL U505 ( .A0(N249), .A1(n294), .B0(n263), .B1(n294), .C0(N249), .C1(
        n263), .Y(n305) );
  NAND2BX1 U506 ( .AN(bc_pixel[2]), .B(N245), .Y(n297) );
  OAI22XL U507 ( .A0(bc_pixel[3]), .A1(n308), .B0(bc_pixel[3]), .B1(n297), .Y(
        n303) );
  NOR2BX1 U508 ( .AN(bc_pixel[2]), .B(N245), .Y(n295) );
  OA22X1 U509 ( .A0(n295), .A1(bc_pixel[3]), .B0(n295), .B1(n308), .Y(n299) );
  AOI21X1 U510 ( .A0(bc_pixel[1]), .A1(n307), .B0(bc_pixel[0]), .Y(n296) );
  AOI2BB2X1 U511 ( .B0(n296), .B1(N243), .A0N(bc_pixel[1]), .A1N(n307), .Y(
        n298) );
  OAI22XL U512 ( .A0(n299), .A1(n298), .B0(n297), .B1(n308), .Y(n302) );
  NOR2BX1 U513 ( .AN(bc_pixel[4]), .B(N247), .Y(n300) );
  OAI22XL U514 ( .A0(n300), .A1(n309), .B0(bc_pixel[5]), .B1(n300), .Y(n301)
         );
  OAI221XL U515 ( .A0(N249), .A1(n263), .B0(n303), .B1(n302), .C0(n301), .Y(
        n304) );
  AO22X1 U516 ( .A0(n310), .A1(bc_pixel[7]), .B0(n305), .B1(n304), .Y(n306) );
  OAI211X1 U517 ( .A0(bc_pixel[7]), .A1(n310), .B0(n311), .C0(n306), .Y(N453)
         );
  NAND2BX1 U518 ( .AN(bc_pixel[4]), .B(N239), .Y(n312) );
  OAI222XL U519 ( .A0(bc_pixel[5]), .A1(n328), .B0(bc_pixel[5]), .B1(n312), 
        .C0(n328), .C1(n312), .Y(n313) );
  OAI222XL U520 ( .A0(N241), .A1(n313), .B0(n263), .B1(n313), .C0(N241), .C1(
        n263), .Y(n324) );
  NAND2BX1 U521 ( .AN(bc_pixel[2]), .B(N237), .Y(n316) );
  OAI22XL U522 ( .A0(bc_pixel[3]), .A1(n327), .B0(bc_pixel[3]), .B1(n316), .Y(
        n322) );
  NOR2BX1 U523 ( .AN(bc_pixel[2]), .B(N237), .Y(n314) );
  OA22X1 U524 ( .A0(n314), .A1(bc_pixel[3]), .B0(n314), .B1(n327), .Y(n318) );
  AOI21X1 U525 ( .A0(bc_pixel[1]), .A1(n326), .B0(bc_pixel[0]), .Y(n315) );
  AOI2BB2X1 U526 ( .B0(n315), .B1(N235), .A0N(bc_pixel[1]), .A1N(n326), .Y(
        n317) );
  OAI22XL U527 ( .A0(n318), .A1(n317), .B0(n316), .B1(n327), .Y(n321) );
  NOR2BX1 U528 ( .AN(bc_pixel[4]), .B(N239), .Y(n319) );
  OAI22XL U529 ( .A0(n319), .A1(n328), .B0(bc_pixel[5]), .B1(n319), .Y(n320)
         );
  OAI221XL U530 ( .A0(N241), .A1(n263), .B0(n322), .B1(n321), .C0(n320), .Y(
        n323) );
  AO22X1 U531 ( .A0(n329), .A1(bc_pixel[7]), .B0(n324), .B1(n323), .Y(n325) );
  OAI211X1 U532 ( .A0(bc_pixel[7]), .A1(n329), .B0(n330), .C0(n325), .Y(N466)
         );
  CLKINVX1 U533 ( .A(n331), .Y(n531) );
  NOR2X1 U534 ( .A(n336), .B(n337), .Y(n335) );
  OAI21XL U535 ( .A0(n338), .A1(n339), .B0(N594), .Y(n334) );
  OAI211X1 U536 ( .A0(n340), .A1(n341), .B0(n342), .C0(n343), .Y(N621) );
  OA21XL U537 ( .A0(n333), .A1(n344), .B0(n345), .Y(n343) );
  OAI211X1 U538 ( .A0(n340), .A1(n346), .B0(reset), .C0(n347), .Y(N620) );
  NAND2X1 U539 ( .A(n351), .B(n352), .Y(n349) );
  NOR3X1 U540 ( .A(n353), .B(n354), .C(n339), .Y(n346) );
  AO22X1 U541 ( .A0(n280), .A1(N184), .B0(N320), .B1(n278), .Y(N619) );
  AO22X1 U542 ( .A0(n280), .A1(N183), .B0(N319), .B1(n278), .Y(N618) );
  AO22X1 U543 ( .A0(n280), .A1(N182), .B0(N318), .B1(n278), .Y(N617) );
  AO22X1 U544 ( .A0(n280), .A1(N181), .B0(N317), .B1(n278), .Y(N616) );
  AO22X1 U545 ( .A0(n280), .A1(N180), .B0(N316), .B1(n278), .Y(N615) );
  AO22X1 U546 ( .A0(n280), .A1(N179), .B0(N315), .B1(n278), .Y(N614) );
  NAND2X1 U547 ( .A(N314), .B(n278), .Y(n357) );
  CLKINVX1 U548 ( .A(N178), .Y(n356) );
  AO22X1 U549 ( .A0(n280), .A1(N177), .B0(N313), .B1(n278), .Y(N612) );
  AO22X1 U550 ( .A0(n280), .A1(N176), .B0(N312), .B1(n278), .Y(N611) );
  AO22X1 U551 ( .A0(n280), .A1(N175), .B0(N311), .B1(n278), .Y(N610) );
  AO22X1 U552 ( .A0(n280), .A1(N174), .B0(N310), .B1(n278), .Y(N609) );
  AO22X1 U553 ( .A0(n280), .A1(N173), .B0(N309), .B1(n278), .Y(N608) );
  AO22X1 U554 ( .A0(n280), .A1(N172), .B0(N308), .B1(n278), .Y(N607) );
  NAND2X1 U555 ( .A(N307), .B(n278), .Y(n359) );
  NAND2X1 U556 ( .A(reset), .B(n362), .Y(N604) );
  NOR4BBX1 U557 ( .AN(N137), .BN(N138), .C(N143), .D(n358), .Y(n366) );
  AND3X1 U558 ( .A(N141), .B(N139), .C(N140), .Y(n365) );
  AND4X1 U559 ( .A(N142), .B(N144), .C(N145), .D(N146), .Y(n364) );
  NAND2X1 U560 ( .A(n348), .B(n367), .Y(n360) );
  NAND2X1 U561 ( .A(n368), .B(n369), .Y(N603) );
  AOI222XL U562 ( .A0(N250), .A1(n370), .B0(N491), .B1(n371), .C0(n372), .C1(
        bc_pixel[7]), .Y(n369) );
  AOI222XL U563 ( .A0(N623), .A1(res_di[7]), .B0(N475), .B1(n373), .C0(N242), 
        .C1(n374), .Y(n368) );
  NAND2X1 U564 ( .A(n375), .B(n376), .Y(N602) );
  AOI222XL U565 ( .A0(N249), .A1(n370), .B0(N490), .B1(n371), .C0(n372), .C1(
        bc_pixel[6]), .Y(n376) );
  AOI222XL U566 ( .A0(N623), .A1(res_di[6]), .B0(N474), .B1(n373), .C0(N241), 
        .C1(n374), .Y(n375) );
  NAND2X1 U567 ( .A(n377), .B(n378), .Y(N601) );
  AOI222XL U568 ( .A0(N248), .A1(n370), .B0(N489), .B1(n371), .C0(n372), .C1(
        bc_pixel[5]), .Y(n378) );
  AOI222XL U569 ( .A0(N623), .A1(res_di[5]), .B0(N473), .B1(n373), .C0(N240), 
        .C1(n374), .Y(n377) );
  NAND2X1 U570 ( .A(n379), .B(n380), .Y(N600) );
  AOI222XL U571 ( .A0(N247), .A1(n370), .B0(N488), .B1(n371), .C0(n372), .C1(
        bc_pixel[4]), .Y(n380) );
  AOI222XL U572 ( .A0(N623), .A1(res_di[4]), .B0(N472), .B1(n373), .C0(N239), 
        .C1(n374), .Y(n379) );
  NAND2X1 U573 ( .A(n381), .B(n382), .Y(N599) );
  AOI222XL U574 ( .A0(N246), .A1(n370), .B0(N487), .B1(n371), .C0(n372), .C1(
        bc_pixel[3]), .Y(n382) );
  AOI222XL U575 ( .A0(N623), .A1(res_di[3]), .B0(N471), .B1(n373), .C0(N238), 
        .C1(n374), .Y(n381) );
  NAND2X1 U576 ( .A(n383), .B(n384), .Y(N598) );
  AOI222XL U577 ( .A0(N245), .A1(n370), .B0(N486), .B1(n371), .C0(n372), .C1(
        bc_pixel[2]), .Y(n384) );
  AOI222XL U578 ( .A0(N623), .A1(res_di[2]), .B0(N470), .B1(n373), .C0(N237), 
        .C1(n374), .Y(n383) );
  NAND2X1 U579 ( .A(n385), .B(n386), .Y(N597) );
  AOI222XL U580 ( .A0(N244), .A1(n370), .B0(N485), .B1(n371), .C0(n372), .C1(
        bc_pixel[1]), .Y(n386) );
  AOI222XL U581 ( .A0(N623), .A1(res_di[1]), .B0(N469), .B1(n373), .C0(N236), 
        .C1(n374), .Y(n385) );
  NAND2X1 U582 ( .A(n387), .B(n388), .Y(N596) );
  AOI222XL U583 ( .A0(N243), .A1(n370), .B0(N484), .B1(n371), .C0(n372), .C1(
        bc_pixel[0]), .Y(n388) );
  CLKMX2X2 U584 ( .A(N466), .B(N453), .S0(n390), .Y(n389) );
  AOI222XL U585 ( .A0(res_di[0]), .A1(N623), .B0(N468), .B1(n373), .C0(N235), 
        .C1(n374), .Y(n387) );
  OA21XL U586 ( .A0(n393), .A1(n390), .B0(n394), .Y(n392) );
  AND2X1 U587 ( .A(res_di[7]), .B(n264), .Y(n396) );
  AOI32X1 U588 ( .A0(n397), .A1(n398), .A2(n399), .B0(n400), .B1(n401), .Y(
        n395) );
  OAI21XL U589 ( .A0(n402), .A1(res_di[6]), .B0(n260), .Y(n401) );
  NAND2X1 U590 ( .A(n402), .B(res_di[6]), .Y(n400) );
  AOI32X1 U591 ( .A0(res_do[4]), .A1(n403), .A2(n398), .B0(n404), .B1(
        res_do[5]), .Y(n402) );
  AOI2BB2X1 U592 ( .B0(res_di[6]), .B1(n260), .A0N(n403), .A1N(res_do[4]), .Y(
        n399) );
  CLKINVX1 U593 ( .A(res_di[4]), .Y(n403) );
  OR2X1 U594 ( .A(res_do[5]), .B(n404), .Y(n398) );
  CLKINVX1 U595 ( .A(res_di[5]), .Y(n404) );
  OAI211X1 U596 ( .A0(n405), .A1(n259), .B0(n406), .C0(n407), .Y(n397) );
  OAI2BB1X1 U597 ( .A0N(n259), .A1N(n405), .B0(n408), .Y(n407) );
  OAI222XL U598 ( .A0(res_do[3]), .A1(n408), .B0(res_do[2]), .B1(n409), .C0(
        n410), .C1(n411), .Y(n406) );
  NOR2X1 U599 ( .A(res_di[1]), .B(n261), .Y(n411) );
  AOI211X1 U600 ( .A0(res_di[1]), .A1(n261), .B0(n530), .C0(res_di[0]), .Y(
        n410) );
  CLKINVX1 U601 ( .A(res_di[3]), .Y(n408) );
  NAND2X1 U602 ( .A(res_do[2]), .B(n409), .Y(n405) );
  CLKINVX1 U603 ( .A(res_di[2]), .Y(n409) );
  NAND3X1 U604 ( .A(n331), .B(n412), .C(n342), .Y(N591) );
  OA21XL U605 ( .A0(n340), .A1(n413), .B0(reset), .Y(n342) );
  NAND4X1 U606 ( .A(n414), .B(n415), .C(n416), .D(n417), .Y(N590) );
  AOI222XL U607 ( .A0(N216), .A1(n272), .B0(n268), .B1(count[13]), .C0(N201), 
        .C1(n273), .Y(n417) );
  AOI22X1 U608 ( .A0(N441), .A1(n275), .B0(n274), .B1(N184), .Y(n416) );
  AOI22X1 U609 ( .A0(N426), .A1(n269), .B0(N231), .B1(n270), .Y(n415) );
  NAND4X1 U610 ( .A(n426), .B(n427), .C(n428), .D(n429), .Y(N589) );
  AOI222XL U611 ( .A0(N215), .A1(n272), .B0(n268), .B1(n291), .C0(N200), .C1(
        n273), .Y(n429) );
  AOI22X1 U612 ( .A0(N440), .A1(n275), .B0(n274), .B1(N183), .Y(n428) );
  AOI22X1 U613 ( .A0(N425), .A1(n269), .B0(N230), .B1(n270), .Y(n427) );
  AOI22X1 U614 ( .A0(N410), .A1(n271), .B0(N148), .B1(n262), .Y(n426) );
  NAND4X1 U615 ( .A(n430), .B(n431), .C(n432), .D(n433), .Y(N588) );
  AOI222XL U616 ( .A0(N214), .A1(n272), .B0(n268), .B1(n290), .C0(N199), .C1(
        n273), .Y(n433) );
  AOI22X1 U617 ( .A0(N424), .A1(n269), .B0(N229), .B1(n270), .Y(n431) );
  AOI22X1 U618 ( .A0(N409), .A1(n271), .B0(N147), .B1(n292), .Y(n430) );
  NAND4X1 U619 ( .A(n434), .B(n435), .C(n436), .D(n437), .Y(N587) );
  AOI222XL U620 ( .A0(N213), .A1(n272), .B0(n268), .B1(n289), .C0(N198), .C1(
        n273), .Y(n437) );
  AOI22X1 U621 ( .A0(N423), .A1(n269), .B0(N228), .B1(n270), .Y(n435) );
  NAND4X1 U622 ( .A(n438), .B(n439), .C(n440), .D(n441), .Y(N586) );
  AOI222XL U623 ( .A0(N212), .A1(n272), .B0(n268), .B1(n288), .C0(N197), .C1(
        n273), .Y(n441) );
  AOI22X1 U624 ( .A0(N437), .A1(n275), .B0(n274), .B1(N180), .Y(n440) );
  AOI22X1 U625 ( .A0(N422), .A1(n269), .B0(N227), .B1(n270), .Y(n439) );
  NAND4X1 U626 ( .A(n442), .B(n443), .C(n444), .D(n445), .Y(N585) );
  AOI222XL U627 ( .A0(N211), .A1(n272), .B0(n268), .B1(count[8]), .C0(N196), 
        .C1(n273), .Y(n445) );
  AOI22X1 U628 ( .A0(N436), .A1(n275), .B0(n274), .B1(N179), .Y(n444) );
  AOI22X1 U629 ( .A0(N421), .A1(n269), .B0(N226), .B1(n270), .Y(n443) );
  AOI22X1 U630 ( .A0(N406), .A1(n271), .B0(N144), .B1(n292), .Y(n442) );
  NAND4X1 U631 ( .A(n446), .B(n447), .C(n448), .D(n449), .Y(N584) );
  AOI222XL U632 ( .A0(n520), .A1(n272), .B0(n268), .B1(n286), .C0(N195), .C1(
        n273), .Y(n449) );
  AOI22X1 U633 ( .A0(N435), .A1(n275), .B0(n274), .B1(N178), .Y(n448) );
  AOI22X1 U634 ( .A0(n520), .A1(n269), .B0(N225), .B1(n270), .Y(n447) );
  AOI22X1 U635 ( .A0(N405), .A1(n271), .B0(n292), .B1(N143), .Y(n446) );
  NAND4X1 U636 ( .A(n450), .B(n451), .C(n452), .D(n453), .Y(N583) );
  AOI222XL U637 ( .A0(n285), .A1(n272), .B0(n268), .B1(N209), .C0(N194), .C1(
        n273), .Y(n453) );
  AOI22X1 U638 ( .A0(N434), .A1(n275), .B0(n274), .B1(N177), .Y(n452) );
  AOI22X1 U639 ( .A0(n285), .A1(n269), .B0(N224), .B1(n270), .Y(n451) );
  AOI22X1 U640 ( .A0(N404), .A1(n271), .B0(N142), .B1(n262), .Y(n450) );
  NAND4X1 U641 ( .A(n454), .B(n455), .C(n456), .D(n457), .Y(N582) );
  AOI222XL U642 ( .A0(n284), .A1(n272), .B0(n268), .B1(n284), .C0(N193), .C1(
        n273), .Y(n457) );
  AOI22X1 U643 ( .A0(N433), .A1(n275), .B0(n274), .B1(N176), .Y(n456) );
  AOI22X1 U644 ( .A0(n284), .A1(n269), .B0(N223), .B1(n270), .Y(n455) );
  AOI22X1 U645 ( .A0(N403), .A1(n271), .B0(N141), .B1(n262), .Y(n454) );
  NAND4X1 U646 ( .A(n458), .B(n459), .C(n460), .D(n461), .Y(N581) );
  AOI222XL U647 ( .A0(n283), .A1(n272), .B0(n268), .B1(n283), .C0(N192), .C1(
        n273), .Y(n461) );
  AOI22X1 U648 ( .A0(N432), .A1(n275), .B0(n274), .B1(N175), .Y(n460) );
  AOI22X1 U649 ( .A0(n283), .A1(n269), .B0(N222), .B1(n270), .Y(n459) );
  AOI22X1 U650 ( .A0(N402), .A1(n271), .B0(N140), .B1(n292), .Y(n458) );
  NAND4X1 U651 ( .A(n462), .B(n463), .C(n464), .D(n465), .Y(N580) );
  AOI222XL U652 ( .A0(n282), .A1(n272), .B0(n268), .B1(n352), .C0(N191), .C1(
        n273), .Y(n465) );
  AOI22X1 U653 ( .A0(N431), .A1(n275), .B0(n274), .B1(N174), .Y(n464) );
  AOI22X1 U654 ( .A0(n282), .A1(n269), .B0(N221), .B1(n270), .Y(n463) );
  AOI22X1 U655 ( .A0(N401), .A1(n271), .B0(N139), .B1(n292), .Y(n462) );
  NAND4X1 U656 ( .A(n466), .B(n467), .C(n468), .D(n469), .Y(N579) );
  AOI222XL U657 ( .A0(n281), .A1(n272), .B0(n268), .B1(n351), .C0(N190), .C1(
        n273), .Y(n469) );
  AOI22X1 U658 ( .A0(N430), .A1(n275), .B0(n274), .B1(N173), .Y(n468) );
  AOI22X1 U659 ( .A0(n281), .A1(n269), .B0(N220), .B1(n270), .Y(n467) );
  AOI22X1 U660 ( .A0(N400), .A1(n271), .B0(N138), .B1(n292), .Y(n466) );
  NAND4X1 U661 ( .A(n470), .B(n471), .C(n472), .D(n473), .Y(N578) );
  AOI222XL U662 ( .A0(n474), .A1(n272), .B0(n268), .B1(n474), .C0(N189), .C1(
        n273), .Y(n473) );
  AOI22X1 U663 ( .A0(N429), .A1(n275), .B0(n274), .B1(N172), .Y(n472) );
  AOI22X1 U664 ( .A0(n474), .A1(n269), .B0(N399), .B1(n270), .Y(n471) );
  AOI22X1 U665 ( .A0(N399), .A1(n271), .B0(N137), .B1(n292), .Y(n470) );
  NAND3X1 U666 ( .A(n475), .B(n476), .C(n477), .Y(N577) );
  AOI211X1 U667 ( .A0(n527), .A1(n271), .B0(n478), .C0(n479), .Y(n477) );
  CLKMX2X2 U668 ( .A(n268), .B(n292), .S0(n527), .Y(n479) );
  NAND2X1 U669 ( .A(n278), .B(n354), .Y(n333) );
  AO22X1 U670 ( .A0(n527), .A1(n270), .B0(N203), .B1(n269), .Y(n478) );
  AOI22X1 U671 ( .A0(n527), .A1(n273), .B0(n358), .B1(n272), .Y(n476) );
  CLKINVX1 U672 ( .A(n482), .Y(n341) );
  AOI22X1 U673 ( .A0(n527), .A1(n275), .B0(n274), .B1(N171), .Y(n475) );
  NAND2X1 U674 ( .A(n354), .B(N594), .Y(n331) );
  NAND4BX1 U675 ( .AN(n262), .B(n361), .C(n486), .D(n412), .Y(N593) );
  NAND2X1 U676 ( .A(n339), .B(n280), .Y(n412) );
  CLKINVX1 U677 ( .A(n487), .Y(n339) );
  NOR2X1 U678 ( .A(N623), .B(n336), .Y(n486) );
  NOR2X1 U679 ( .A(n485), .B(n367), .Y(n336) );
  NAND2X1 U680 ( .A(n488), .B(n489), .Y(n367) );
  MXI4X1 U681 ( .A(n490), .B(n491), .C(n492), .D(n493), .S0(n352), .S1(n527), 
        .Y(n488) );
  OAI221XL U682 ( .A0(sti_di[3]), .A1(n494), .B0(sti_di[7]), .B1(n495), .C0(
        n496), .Y(n493) );
  OA22X1 U683 ( .A0(sti_di[1]), .A1(n497), .B0(sti_di[5]), .B1(n498), .Y(n496)
         );
  OAI221XL U684 ( .A0(sti_di[11]), .A1(n494), .B0(sti_di[15]), .B1(n495), .C0(
        n499), .Y(n492) );
  OA22X1 U685 ( .A0(sti_di[9]), .A1(n497), .B0(sti_di[13]), .B1(n498), .Y(n499) );
  OAI221XL U686 ( .A0(sti_di[2]), .A1(n494), .B0(sti_di[6]), .B1(n495), .C0(
        n500), .Y(n491) );
  OAI21XL U687 ( .A0(n501), .A1(n502), .B0(n474), .Y(n500) );
  MXI2X1 U688 ( .A(sti_di[4]), .B(sti_di[0]), .S0(n351), .Y(n502) );
  OAI221XL U689 ( .A0(sti_di[10]), .A1(n494), .B0(sti_di[14]), .B1(n495), .C0(
        n503), .Y(n490) );
  OA22X1 U690 ( .A0(sti_di[8]), .A1(n497), .B0(sti_di[12]), .B1(n498), .Y(n503) );
  NAND2X1 U691 ( .A(n529), .B(n474), .Y(n498) );
  NAND2X1 U692 ( .A(n351), .B(n474), .Y(n497) );
  NAND2X1 U693 ( .A(n528), .B(n351), .Y(n494) );
  CLKINVX1 U694 ( .A(n529), .Y(n351) );
  CLKINVX1 U695 ( .A(n348), .Y(n485) );
  NOR2X1 U696 ( .A(n481), .B(n413), .Y(n348) );
  CLKINVX1 U697 ( .A(n340), .Y(N594) );
  NOR2X1 U698 ( .A(n278), .B(n280), .Y(n340) );
  NAND2X1 U699 ( .A(n393), .B(n394), .Y(n353) );
  NAND3X1 U700 ( .A(state[1]), .B(n257), .C(state[0]), .Y(n394) );
  NOR2X1 U701 ( .A(n482), .B(n338), .Y(n393) );
  CLKINVX1 U702 ( .A(n480), .Y(n338) );
  NAND3X1 U703 ( .A(state[2]), .B(n258), .C(state[0]), .Y(n480) );
  NOR3X1 U704 ( .A(state[0]), .B(state[1]), .C(n257), .Y(n482) );
  OA21XL U705 ( .A0(n483), .A1(n484), .B0(reset), .Y(n361) );
  AND2X1 U706 ( .A(N114), .B(n277), .Y(N575) );
  AND2X1 U707 ( .A(N113), .B(n277), .Y(N574) );
  AND2X1 U708 ( .A(N112), .B(n277), .Y(N573) );
  AND2X1 U709 ( .A(N111), .B(n277), .Y(N572) );
  AND2X1 U710 ( .A(N110), .B(n277), .Y(N571) );
  AND2X1 U711 ( .A(N109), .B(n277), .Y(N570) );
  OA21XL U712 ( .A0(n506), .A1(N108), .B0(n278), .Y(N569) );
  AND2X1 U713 ( .A(N107), .B(n277), .Y(N568) );
  AND2X1 U714 ( .A(N106), .B(n277), .Y(N567) );
  AND2X1 U715 ( .A(N105), .B(n277), .Y(N566) );
  AND4X1 U716 ( .A(n507), .B(n508), .C(n509), .D(n510), .Y(n506) );
  NOR4X1 U717 ( .A(n520), .B(n527), .C(n495), .D(n352), .Y(n510) );
  NOR3X1 U718 ( .A(n285), .B(n284), .C(n283), .Y(n509) );
  NOR3X1 U719 ( .A(n291), .B(n289), .C(count[13]), .Y(n508) );
  NOR3X1 U720 ( .A(n287), .B(n290), .C(n288), .Y(n507) );
  NAND3X1 U721 ( .A(n258), .B(n257), .C(state[0]), .Y(n487) );
  NAND2X1 U722 ( .A(n525), .B(reset), .Y(n481) );
  OAI31XL U723 ( .A0(n511), .A1(n512), .A2(n513), .B0(reset), .Y(N562) );
  OR4X1 U724 ( .A(N176), .B(N177), .C(N179), .D(N180), .Y(n513) );
  NAND4BX1 U725 ( .AN(N171), .B(n514), .C(N178), .D(n515), .Y(n511) );
  NOR4X1 U726 ( .A(N175), .B(N174), .C(N173), .D(N172), .Y(n515) );
  OAI21XL U727 ( .A0(n483), .A1(n484), .B0(n345), .Y(n514) );
  NAND2X1 U728 ( .A(n280), .B(n354), .Y(n345) );
  NOR3X1 U729 ( .A(n258), .B(state[0]), .C(n257), .Y(n354) );
  CLKINVX1 U730 ( .A(n337), .Y(n484) );
  NAND3BX1 U731 ( .AN(state[0]), .B(n257), .C(state[1]), .Y(n413) );
  NAND3BX1 U732 ( .AN(n525), .B(n524), .C(reset), .Y(n355) );
  CLKINVX1 U733 ( .A(n504), .Y(n483) );
  OAI211X1 U734 ( .A0(n516), .A1(n517), .B0(n489), .C0(n518), .Y(n504) );
  NAND4X1 U735 ( .A(n501), .B(n474), .C(n358), .D(n352), .Y(n518) );
  NOR4X1 U736 ( .A(n529), .B(n523), .C(n522), .D(n521), .Y(n501) );
  NAND4X1 U737 ( .A(n522), .B(n523), .C(n521), .D(n519), .Y(n489) );
  NOR3X1 U738 ( .A(n352), .B(n495), .C(n358), .Y(n519) );
  NAND2X1 U739 ( .A(n528), .B(n529), .Y(n495) );
  CLKINVX1 U740 ( .A(n526), .Y(n352) );
  OR4X1 U741 ( .A(res_di[0]), .B(res_di[1]), .C(res_di[2]), .D(res_di[3]), .Y(
        n517) );
  OR4X1 U742 ( .A(res_di[4]), .B(res_di[5]), .C(res_di[6]), .D(res_di[7]), .Y(
        n516) );
endmodule

