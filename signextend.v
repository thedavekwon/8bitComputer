module signexten(
          output reg [7:0] dout,
          input [4:0]      din,
          input            control);

   always @ (control) begin
    dout <= {{3{din[2]}},din};	  
   end
endmodule

module test;
   reg [4:0] stuff_in;
   wire [7:0] stuff_out;
   reg        control;

   signexten signextendedd(stuff_out, stuff_in, control);

   initial begin
      #1 control = 0;
      stuff_in = 5'b10101;
      $monitor("%b, %b, %b", control, stuff_in, stuff_out);
      #40 stuff_in =5'b00100;
  
   end
 
   always
     #1 control = !control;

   initial
     #100  $finish;

endmodule