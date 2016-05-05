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
wire w6;    //: /sn:0 {0}(359,221)(374,221){1}
wire [7:0] w7;    //: /sn:0 {0}(#:397,234)(397,249){1}
wire [7:0] w16;    //: /sn:0 {0}(#:537,354)(522,354){1}
wire [7:0] w14;    //: /sn:0 {0}(#:319,354)(334,354){1}
wire w19;    //: /sn:0 {0}(222,540)(222,525){1}
wire w15;    //: /sn:0 {0}(355,450)(355,435){1}
wire [7:0] w4;    //: /sn:0 {0}(#:387,189)(387,205){1}
wire [7:0] w0;    //: /sn:0 {0}(#:264,185)(264,200){1}
wire [7:0] w3;    //: /sn:0 {0}(#:274,229)(274,244){1}
wire [7:0] w20;    //: /sn:0 {0}(#:340,460)(325,460){1}
wire [7:0] w1;    //: /sn:0 {0}(#:284,185)(284,200){1}
wire [7:0] w18;    //: /sn:0 {0}(#:186,460)(201,460){1}
wire [7:0] w8;    //: /sn:0 {0}(#:492,173)(492,188){1}
wire w17;    //: /sn:0 {0}(186,476)(201,476){1}
wire w12;    //: /sn:0 {0}(319,386)(334,386){1}
wire [7:0] w11;    //: /sn:0 {0}(#:502,217)(502,232){1}
wire w2;    //: /sn:0 {0}(236,216)(251,216){1}
wire w10;    //: /sn:0 {0}(464,204)(479,204){1}
wire [4:0] w13;    //: /sn:0 {0}(#:319,370)(334,370){1}
wire [7:0] w5;    //: /sn:0 {0}(#:407,190)(407,205){1}
wire [7:0] w9;    //: /sn:0 {0}(#:512,173)(512,188){1}
//: enddecls

  accum g1 (.acc_in(w18), .accWE(w17), .clk(w19), .acc_out(w20));   //: @(202, 444) /sz:(122, 80) /sn:0 /p:[ Li0>1 Li1>1 Bi0>1 Ro0<1 ]
  _GGMUX2x8 #(8, 8) m2 (.I0(w4), .I1(w5), .S(w6), .Z(w7));   //: @(397,221) /w:[ 1 1 1 0 ] /ss:0 /do:0
  _GGMUX2x8 #(8, 8) m1 (.I0(w0), .I1(w1), .S(w2), .Z(w3));   //: @(274,216) /w:[ 1 1 1 0 ] /ss:0 /do:0
  _GGMUX2x8 #(8, 8) m3 (.I0(w8), .I1(w9), .S(w10), .Z(w11));   //: @(502,204) /w:[ 1 1 1 0 ] /ss:0 /do:0
  shiftregs g0 (.regIn(w14), .immediate(w13), .regWE(w12), .clk(w15), .regOut(w16));   //: @(335, 338) /sz:(186, 96) /sn:0 /p:[ Li0>1 Li1>1 Li2>1 Bi0>1 Ri0>1 ]

endmodule
//: /netlistEnd

//: /netlistBegin regfile
module regfile();
//: interface  /sz:(40, 40) /bd:[ ] /pd: 0 /pi: 0 /pe: 0 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin accum
module accum();
//: interface  /sz:(122, 80) /bd:[ Li0>accWE(32/80) Li1>acc_in[7:0](16/80) Bi0>clk(20/122) Ro0<acc_out[7:0](16/80) ] /pd: 0 /pi: 0 /pe: 1 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

//: /netlistBegin shiftregs
module shiftregs();
//: interface  /sz:(186, 96) /bd:[ Li0>regWE(48/96) Li1>immediate[4:0](32/96) Li2>regIn[7:0](16/96) Bi0>clk(20/186) Ri0>regOut[7:0](16/96) ] /pd: 0 /pi: 0 /pe: 0 /pp: 1
//: enddecls


endmodule
//: /netlistEnd

