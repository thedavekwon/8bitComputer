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
wire w32;    //: /sn:0 {0}(66,337)(51,337){1}
wire w6;    //: /sn:0 {0}(404,321)(404,306){1}
wire [7:0] w7;    //: /sn:0 {0}(#:417,283)(432,283){1}
wire [2:0] w16;    //: /sn:0 {0}(#:503,472)(503,487){1}
wire w14;    //: /sn:0 {0}(433,635)(433,650){1}
wire w19;    //: /sn:0 {0}(482,375)(467,375){1}
wire [7:0] w15;    //: /sn:0 {0}(#:536,570)(551,570){1}
wire [7:0] w4;    //: /sn:0 {0}(#:372,293)(388,293){1}
wire w38;    //: /sn:0 {0}(121,729)(121,744){1}
wire [7:0] w3;    //: /sn:0 {0}(#:287,216)(302,216){1}
wire [7:0] w0;    //: /sn:0 {0}(#:243,226)(258,226){1}
wire w37;    //: /sn:0 {0}(104,662)(89,662){1}
wire [7:0] w34;    //: /sn:0 {0}(#:155,307)(170,307){1}
wire [7:0] w43;    //: /sn:0 {0}(#:131,166)(131,151){1}
wire w21;    //: /sn:0 {0}(637,317)(652,317){1}
wire [7:0] w31;    //: /sn:0 {0}(#:66,307)(51,307){1}
wire [7:0] w28;    //: /sn:0 {0}(#:205,470)(190,470){1}
wire [4:0] w36;    //: /sn:0 {0}(#:104,632)(89,632){1}
wire [7:0] w41;    //: /sn:0 {0}(#:82,87)(97,87){1}
wire w24;    //: /sn:0 {0}(637,407)(652,407){1}
wire w23;    //: /sn:0 {0}(637,375)(652,375){1}
wire w20;    //: /sn:0 {0}(482,407)(467,407){1}
wire [7:0] w1;    //: /sn:0 {0}(#:243,206)(258,206){1}
wire [1:0] w25;    //: /sn:0 {0}(#:637,438)(652,438){1}
wire [7:0] w35;    //: /sn:0 {0}(#:104,602)(89,602){1}
wire w40;    //: /sn:0 {0}(82,103)(97,103){1}
wire w18;    //: /sn:0 {0}(482,348)(467,348){1}
wire [7:0] w8;    //: /sn:0 {0}(#:410,170)(425,170){1}
wire [7:0] w30;    //: /sn:0 {0}(#:318,416)(333,416){1}
wire w22;    //: /sn:0 {0}(637,348)(652,348){1}
wire w17;    //: /sn:0 {0}(482,317)(467,317){1}
wire [7:0] w44;    //: /sn:0 {0}(#:252,87)(237,87){1}
wire [7:0] w12;    //: /sn:0 {0}(#:412,570)(397,570){1}
wire w2;    //: /sn:0 {0}(274,254)(274,239){1}
wire [7:0] w11;    //: /sn:0 {0}(#:454,160)(469,160){1}
wire w10;    //: /sn:0 {0}(441,198)(441,183){1}
wire [7:0] w27;    //: /sn:0 {0}(#:205,443)(190,443){1}
wire w13;    //: /sn:0 {0}(412,586)(397,586){1}
wire w33;    //: /sn:0 {0}(91,372)(91,387){1}
wire [7:0] w5;    //: /sn:0 {0}(#:373,273)(388,273){1}
wire [1:0] w29;    //: /sn:0 {0}(#:237,515)(237,530){1}
wire w42;    //: /sn:0 {0}(197,166)(197,151){1}
wire [7:0] w9;    //: /sn:0 {0}(#:410,150)(425,150){1}
wire [7:0] w39;    //: /sn:0 {0}(#:242,602)(257,602){1}
wire [7:0] w26;    //: /sn:0 {0}(#:205,416)(190,416){1}
//: enddecls

  memory g4 (.regOut(w41), .memWE(w40), .mem_addr(w43), .clk(w42), .mem_out(w44));   //: @(98, 71) /sz:(138, 79) /sn:0 /p:[ Li0>1 Li1>1 Bi0>1 Bi1>1 Ro0<1 ]
  PC g3 (.brnch_yes(w32), .regBuf(w31), .clk(w33), .addr(w34));   //: @(67, 277) /sz:(87, 94) /sn:0 /p:[ Li0>0 Li1>0 Bi0>0 Ro0<0 ]
  ALU g2 (.addr(w28), .regOut(w27), .acc_out(w26), .cntr_alu(w29), .alu_out(w30));   //: @(206, 390) /sz:(111, 124) /sn:0 /p:[ Li0>0 Li1>0 Li2>0 Bi0>0 Ro0<0 ]
  Control g1 (.opcode(w16), .lw(w20), .memWE(w19), .accWE(w18), .regWE(w17), .cntr_alu(w25), .alu_sc(w24), .mem_sc(w23), .acc_sc(w22), .brnch(w21));   //: @(483, 290) /sz:(153, 181) /sn:0 /p:[ Bi0>0 Lo0<0 Lo1<0 Lo2<0 Lo3<0 Ro0<0 Ro1<0 Ro2<0 Ro3<0 Ro4<0 ]
  _GGMUX2x8 #(8, 8) m2 (.I0(w4), .I1(w5), .S(w6), .Z(w7));   //: @(404,283) /R:1 /w:[ 1 1 1 0 ] /ss:0 /do:0
  _GGMUX2x8 #(8, 8) m1 (.I0(w0), .I1(w1), .S(w2), .Z(w3));   //: @(274,216) /R:1 /w:[ 1 1 1 0 ] /ss:0 /do:0
  _GGMUX2x8 #(8, 8) m3 (.I0(w8), .I1(w9), .S(w10), .Z(w11));   //: @(441,160) /R:1 /w:[ 1 1 1 0 ] /ss:0 /do:0
  shiftregs g5 (.regWE(w37), .immediate(w36), .regIn(w35), .clk(w38), .regOut(w39));   //: @(105, 572) /sz:(136, 156) /sn:0 /p:[ Li0>0 Li1>0 Li2>0 Bi0>0 Ri0>0 ]
  accum g0 (.accWE(w13), .acc_in(w12), .clk(w14), .acc_out(w15));   //: @(413, 554) /sz:(122, 80) /sn:0 /p:[ Li0>0 Li1>0 Bi0>0 Ro0<0 ]

endmodule
//: /netlistEnd

//: /netlistBegin PC
module PC();
//: interface  /sz:(87, 94) /bd:[ Li0>regBuf[7:0](30/94) Li1>brnch_yes(60/94) Bi0>clk(23/87) Ro0<addr[7:0](30/94) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin accum
module accum();
//: interface  /sz:(122, 80) /bd:[ Li0>acc_in[7:0](16/80) Li1>accWE(32/80) Bi0>clk(20/122) Ro0<acc_out[7:0](16/80) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin ALU
module ALU();
//: interface  /sz:(111, 124) /bd:[ Li0>acc_out[7:0](26/124) Li1>regOut[7:0](53/124) Li2>addr[7:0](80/124) Bi0>cntr_alu[1:0](31/111) Ro0<alu_out[7:0](26/124) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin memory
module memory();
//: interface  /sz:(138, 79) /bd:[ Li0>memWE(32/79) Li1>regOut[7:0](16/79) Bi0>clk(99/138) Bi1>mem_addr[7:0](33/138) Ro0<mem_out[7:0](16/79) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin Control
module Control();
//: interface  /sz:(153, 181) /bd:[ Bi0>opcode[2:0](20/153) Lo0<regWE(27/181) Lo1<accWE(58/181) Lo2<memWE(85/181) Lo3<lw(117/181) Ro0<brnch(27/181) Ro1<acc_sc(58/181) Ro2<mem_sc(85/181) Ro3<alu_sc(117/181) Ro4<cntr_alu[1:0](148/181) ] /pd: 0 /pi: 0 /pe: 0 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin shiftregs
module shiftregs();
//: interface  /sz:(136, 156) /bd:[ Li0>regIn[7:0](30/156) Li1>immediate[4:0](60/156) Li2>regWE(90/156) Bi0>clk(16/136) Ri0>regOut[7:0](30/156) ] /pd: 0 /pi: 0 /pe: 0 /pp: 0
//: property pptype=0
//: enddecls


endmodule
//: /netlistEnd

