module pc(
          output reg [7:0] dout,
          input [7:0]      din,
          input            clk,
          input            control);

   always @ (posedge clk) begin
   	  if(control == 1)begin
   		   dout = din;
   	  end else begin
   		   dout = dout + 1;
      end
   end
endmodule

module test;
   reg [7:0] stuff_in;
   wire [7:0] stuff_out;
   reg        clk, control;

   pc pcounter(stuff_out, stuff_in, clk, control);

   initial begin
   	  #1 clk = 0;
   	  control = 1;
   	  stuff_in = 8'b1010_1010;
   	  $monitor("%b, %d, %b, %b: time: %d",clk, control, stuff_in, stuff_out, $time);
      #40 control = 0;


   end

   always
     #1 clk = !clk;

   initial
     #100  $finish;

endmodule
