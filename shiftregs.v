module shiftregs(
	               output reg [7:0] data_out,
	               input [4:0]      address,
 	               input [7:0]      data_in,
                 input            enable,
                 input            clk);

   reg [7:0]                      regfile [0:31];

   always @ (address or data_in or enable or clk) begin
     data_out = regfile[address];
   end

   always @ (negedge clk) begin
      if (enable) begin
   	     regfile[address] = data_in;
      end
   end

   integer i;
   initial begin
      for (i = 0;i<32;i=i+1)
        regfile[i] = 0;
      regfile[29] = 8'b1111_1111;
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
