module memory( 
	output reg [7:0] data_out,
	input [7:0] address,
 	input [7:0] data_in, 
    input write_enable,
    input clk);
	
   reg [7:0] mainmem [0:255];

   initial begin
      $readmemb("mem.bin", mainmem);

   end
   always @ (posedge clk) begin
      data_out <= mainmem[address];
   end

   always @ (negedge clk & write_enable) begin
   	  mainmem[address] <= data_in;
   end
endmodule

module test;
   reg [7:0] stuff_in;
   wire [7:0] stuff_out;
   reg [7:0] addr;
   reg clk, write_enable;

   memory mem(stuff_out, addr, stuff_in, write_enable, clk);


  
   initial begin 
   	  clk = 0;
   	  write_enable = 0;
   	  addr = 8'b0000_0010;
   	  $monitor("%d, address: %d",clk, addr);
      #6 $display("Test: %d", stuff_out);
      #8 $display("Test: %d", stuff_out);
      #10 write_enable = 1;
      #10 stuff_in = 8'b11111111;
      #11$display("Test: %d", stuff_out);
      #16 $display("Test: %d", stuff_out);
   end
    
   always 
    #2 clk = !clk;

   initial 
      #100  $finish; 
  
endmodule
