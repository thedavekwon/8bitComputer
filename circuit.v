//: version "2.0-b10"
//: property encoding = "iso8859-1"
//: property locale = "en"
//: property prefix = "_GG"
//: property title = "new.v"
//: property timingViolationMode = 2
//: property initTime = "0 ns"

`timescale 1ns/1ns

//: /netlistBegin main
module main;    //: root_module
supply0 w10;    //: /sn:0 {0}(360,372)(374,372){1}
//: {2}(376,370)(376,362)(360,362){3}
//: {4}(376,374)(376,388){5}
wire w6;    //: /sn:0 {0}(974,309)(974,294){1}
wire w32;    //: /sn:0 {0}(514,301)(526,301)(526,300)(532,300){1}
wire [7:0] w7;    //: /sn:0 {0}(#:987,271)(1058,271)(1058,345)(1071,345){1}
wire w14;    //: /sn:0 {0}(586,513)(586,529)(619,529){1}
wire [2:0] w16;    //: /sn:0 {0}(1036,107)(1073,107)(1073,-20)(144,-20)(144,269)(#:250,269)(#:250,232){1}
wire [7:0] w4;    //: /sn:0 {0}(#:958,261)(904,261)(904,167){1}
//: {2}(904,163)(904,107)(925,107){3}
//: {4}(902,165)(#:856,165){5}
wire [7:0] w15;    //: /sn:0 {0}(#:789,309)(720,309)(720,384){1}
//: {2}(718,386)(667,386){3}
//: {4}(665,384)(665,290)(684,290){5}
//: {6}(663,386)(455,386)(455,350)(461,350){7}
//: {8}(720,388)(720,448)(#:689,448){9}
wire w19;    //: /sn:0 {0}(229,135)(176,135)(176,6)(668,6)(668,181)(716,181){1}
wire w51;    //: /sn:0 {0}(284,367)(250,367)(250,375)(235,375){1}
wire [7:0] w0;    //: /sn:0 {0}(#:624,270)(645,270){1}
//: {2}(649,270)(684,270){3}
//: {4}(647,272)(647,363)(#:789,363){5}
wire [7:0] w3;    //: /sn:0 {0}(#:713,280)(750,280)(750,232){1}
wire w34;    //: /sn:0 {0}(482,350)(484,350)(484,303)(493,303){1}
wire w21;    //: /sn:0 {0}(384,77)(467,77)(467,298)(493,298){1}
wire [7:0] w31;    //: /sn:0 {0}(321,357)(321,270)(#:532,270){1}
wire w20;    //: /sn:0 {0}(229,167)(192,167)(192,642)(974,642)(974,283){1}
wire w23;    //: /sn:0 {0}(384,108)(483,108)(483,159)(579,159){1}
wire w24;    //: /sn:0 {0}(384,135)(438,135)(438,404)(511,404)(511,425){1}
wire [7:0] w41;    //: /sn:0 {0}(#:789,336)(761,336)(761,576){1}
//: {2}(763,578)(1384,578)(1384,347){3}
//: {4}(#:1384,343)(1384,68)(708,68)(708,165)(716,165){5}
//: {6}(1382,345)(1250,345){7}
//: {8}(759,578)(321,578)(321,440){9}
//: {10}(323,438)(495,438){11}
//: {12}(321,436)(#:321,378){13}
wire w1;    //: /sn:0 {0}(1071,405)(943,405)(943,622)(88,622)(88,77)(229,77){1}
wire [1:0] w25;    //: /sn:0 {0}(#:384,167)(400,167)(400,558)(821,558)(#:821,408){1}
wire w35;    //: /sn:0 {0}(1088,472)(1088,500)(1188,500){1}
wire w18;    //: /sn:0 {0}(229,108)(109,108)(109,542)(538,542)(538,464)(565,464){1}
wire [7:0] w30;    //: /sn:0 {0}(#:902,309)(944,309)(944,281)(958,281){1}
wire w17;    //: /sn:0 {0}(531,190)(564,190)(564,164)(579,164){1}
wire [4:0] w53;    //: /sn:0 {0}(#:1036,139)(1083,139){1}
//: {2}(1087,139)(1135,139){3}
//: {4}(1085,141)(#:1085,222)(1038,222)(1038,375)(1071,375){5}
wire w2;    //: /sn:0 {0}(600,162)(641,162)(641,210)(700,210)(700,257){1}
wire [7:0] w12;    //: /sn:0 {0}(#:524,448)(#:565,448){1}
wire w33;    //: /sn:0 {0}(565,358)(557,358)(557,335){1}
wire w5;    //: /sn:0 {0}(971,185)(937,185)(937,160){1}
wire [7:0] w9;    //: /sn:0 {0}(1318,139)(1349,139)(1349,656)(355,656)(#:355,458)(495,458){1}
wire w42;    //: /sn:0 {0}(816,232)(816,257)(795,257){1}
//: enddecls

  signext g8 (.immediate(w53), .ext_imm(w9));   //: @(1136, 119) /sz:(181, 40) /sn:0 /p:[ Li0>3 Ro0<0 ]
  memory g4 (.regOut(w41), .memWE(w19), .mem_addr(w3), .clk(w42), .mem_out(w4));   //: @(717, 149) /sz:(138, 82) /sn:0 /p:[ Li0>5 Li1>1 Bi0>1 Bi1>0 Ro0<5 ]
  //: joint g13 (w15) @(665, 386) /w:[ 3 4 6 -1 ]
  PC g3 (.brnch_yes(w32), .regBuf(w31), .clk(w33), .addr(w0));   //: @(533, 240) /sz:(90, 94) /sn:0 /p:[ Li0>1 Li1>1 Bi0>1 Ro0<0 ]
  ALU g2 (.addr(w0), .regOut(w41), .acc_out(w15), .cntr_alu(w25), .alu_out(w30));   //: @(790, 283) /sz:(111, 124) /sn:0 /p:[ Li0>5 Li1>0 Li2>0 Bi0>1 Ro0<0 ]
  Control g1 (.opcode(w16), .regWE(w1), .accWE(w18), .memWE(w19), .lw(w20), .brnch(w21), .mem_sc(w23), .acc_sc(w24), .cntr_alu(w25));   //: @(230, 50) /sz:(153, 181) /sn:0 /p:[ Bi0>1 Lo0<1 Lo1<0 Lo2<0 Lo3<0 Ro0<0 Ro1<0 Ro2<0 Ro3<0 ]
  //: joint g11 (w4) @(904, 165) /w:[ -1 2 4 1 ]
  _GGCLOCK_P42_0_50 g16 (.Z(w17));   //: @(518,190) /sn:0 /w:[ 0 ] /omega:42 /phi:0 /duty:50
  _GGMUX2x8 #(8, 8) m2 (.I0(w4), .I1(w30), .S(w6), .Z(w7));   //: @(974,271) /R:1 /w:[ 0 1 1 0 ] /ss:0 /do:1
  _GGCLOCK_P42_0_50 g28 (.Z(w5));   //: @(984,186) /sn:0 /R:2 /w:[ 0 ] /omega:42 /phi:0 /duty:50
  instr_reg g10 (.instr(w4), .clk(w5), .opcode(w16), .immediate(w53));   //: @(926, 90) /sz:(109, 69) /sn:0 /p:[ Li0>3 Bi0>1 Ro0<0 Ro1<0 ]
  //: joint g27 (w53) @(1085, 139) /w:[ 2 -1 1 4 ]
  //: joint g19 (w0) @(647, 270) /w:[ 2 -1 1 4 ]
  _GGAND2 #(6) g6 (.I0(w21), .I1(w34), .Z(w32));   //: @(504,301) /sn:0 /w:[ 1 1 0 ]
  _GGMUX2x8 #(8, 8) m1 (.I0(w0), .I1(w15), .S(w2), .Z(w3));   //: @(700,280) /R:1 /w:[ 3 5 1 0 ] /ss:1 /do:1
  _GGAND2 #(6) g7 (.I0(w23), .I1(w17), .Z(w2));   //: @(590,162) /sn:0 /w:[ 1 1 0 ]
  //: GROUND g20 (w10) @(376,394) /sn:0 /w:[ 5 ]
  //: joint g15 (w41) @(321, 438) /w:[ 10 12 -1 9 ]
  _GGMUX2x8 #(8, 8) m3 (.I0(w41), .I1(w9), .S(w24), .Z(w12));   //: @(511,448) /R:1 /w:[ 11 1 1 0 ] /ss:1 /do:1
  _GGCLOCK_P42_0_50 g25 (.Z(w35));   //: @(1201,501) /sn:0 /R:2 /w:[ 1 ] /omega:42 /phi:0 /duty:50
  //: joint g17 (w15) @(720, 386) /w:[ -1 1 2 8 ]
  _GGCLOCK_P42_0_50 g14 (.Z(w51));   //: @(222,375) /sn:0 /w:[ 1 ] /omega:42 /phi:0 /duty:50
  shiftregs g5 (.regIn(w7), .immediate(w53), .regWE(w1), .clk(w35), .regOut(w41));   //: @(1072, 315) /sz:(177, 156) /sn:0 /p:[ Li0>1 Li1>5 Li2>0 Bi0>0 Ro0<7 ]
  _GGREG8 #(10, 10, 20) regBuf (.Q(w41), .D(w31), .EN(w10), .CLR(w10), .CK(w51));   //: @(321,367) /w:[ 13 0 0 3 0 ]
  _GGCLOCK_P42_0_50 g24 (.Z(w42));   //: @(782,257) /sn:0 /w:[ 1 ] /omega:42 /phi:0 /duty:50
  //: joint g21 (w10) @(376, 372) /w:[ -1 2 1 4 ]
  _GGCLOCK_P42_0_50 g23 (.Z(w33));   //: @(578,359) /sn:0 /R:2 /w:[ 0 ] /omega:42 /phi:0 /duty:50
  //: joint g26 (w41) @(1384, 345) /w:[ -1 4 6 3 ]
  _GGCLOCK_P42_0_50 g22 (.Z(w14));   //: @(632,530) /sn:0 /R:2 /w:[ 1 ] /omega:42 /phi:0 /duty:50
  accum g0 (.accWE(w18), .acc_in(w12), .clk(w14), .acc_out(w15));   //: @(566, 432) /sz:(122, 80) /sn:0 /p:[ Li0>1 Li1>1 Bi0>0 Ro0<9 ]
  _GGOR1x8 #(1) g12 (.I0(w15), .Z(w34));   //: @(472,350) /sn:0 /w:[ 7 0 ]
  //: joint g18 (w41) @(761, 578) /w:[ 2 1 8 -1 ]

endmodule
//: /netlistEnd

//: /netlistBegin PC
module PC();
//: interface  /sz:(87, 94) /bd:[ Li0>brnch_yes(60/94) Li1>regBuf[7:0](30/94) Bi0>clk(23/87) Ro0<addr[7:0](30/94) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin accum
module accum();
//: interface  /sz:(122, 80) /bd:[ Li0>accWE(32/80) Li1>acc_in[7:0](16/80) Bi0>clk(20/122) Ro0<acc_out[7:0](16/80) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin ALU
module ALU();
//: interface  /sz:(111, 124) /bd:[ Li0>addr[7:0](80/124) Li1>regOut[7:0](53/124) Li2>acc_out[7:0](26/124) Bi0>cntr_alu[1:0](31/111) Ro0<alu_out[7:0](26/124) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin instr_reg
module instr_reg();
//: interface  /sz:(186, 69) /bd:[ Li0>instr[7:0](17/69) Bi0>clk(20/186) Ro0<opcode[2:0](17/69) Ro1<immediate[4:0](49/69) ] /pd: 0 /pi: 0 /pe: 0 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin shiftregs
module shiftregs();
//: interface  /sz:(177, 156) /bd:[ Li0>regWE(90/156) Li1>immediate[4:0](60/156) Li2>regIn[7:0](30/156) Bi0>clk(16/177) Ro0<regOut[7:0](30/156) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin Control
module Control();
//: interface  /sz:(153, 181) /bd:[ Bi0>opcode[2:0](20/153) Lo0<lw(117/181) Lo1<memWE(85/181) Lo2<accWE(58/181) Lo3<regWE(27/181) Ro0<cntr_alu[1:0](117/181) Ro1<acc_sc(85/181) Ro2<mem_sc(58/181) Ro3<brnch(27/181) ] /pd: 0 /pi: 0 /pe: 0 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin memory
module memory();
//: interface  /sz:(138, 79) /bd:[ Li0>regOut[7:0](16/79) Li1>memWE(32/79) Bi0>mem_addr[7:0](33/138) Bi1>clk(99/138) Ro0<mem_out[7:0](16/79) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin signext
module signext();
//: interface  /sz:(181, 49) /bd:[ Li0>immediate[4:0](20/49) Ro0<ext_imm[7:0](20/49) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

