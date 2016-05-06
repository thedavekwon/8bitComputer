module signexten(
          output reg [7:0] dout, //extended value
          input [4:0]      din);

   always @ (din) begin
    dout = {{3{din[4]}},din}; //concatenates number & 3 of its MSB
   end
endmodule

/*module test;
   reg [4:0] stuff_in;
   wire [7:0] stuff_out;

   signexten signextendedd(stuff_out, stuff_in);

   initial begin
      stuff_in = 5'b10101;
      $monitor("%b, %b",stuff_in, stuff_out);
      #40 stuff_in =5'b00100;

   end

   initial
     #100  $finish;

endmodule*/
