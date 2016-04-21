module accumulator(
	               output reg [7:0] data_out,
 	               input [7:0]      data_in,
                 input            enable,
                 input            clk);

   reg [7:0]                      acc;

   always @ (posedge clk) begin
      data_out = acc;
   end

   always @ (negedge clk) begin
      if (enable) begin
   	     acc = data_in;
      end
   end
endmodule

/*module test;
   reg [7:0] stuff_in;
   wire [7:0] stuff_out;
   reg [7:0]  addr;
   reg        clk, enable;

   shiftregs rFile(stuff_out, addr, stuff_in, enable, clk);

   initial begin
   	  clk = 0;
   	  enable = 0;
   	  addr = 5'b00010;
   	  $monitor("%b, %d, %b, %b: time: %d",clk, addr, stuff_in, stuff_out, $time);
      #10 enable = 1;
      stuff_in = 8'b1111111;
      #15 enable= 0;

      #20 addr = 5'b00000;

   end

   always
     #1 clk = !clk;

   initial
     #100  $finish;

endmodule*/
