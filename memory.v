module memory( //von Neumann architecture, combined DM and IM
	output reg [7:0] data_out, //either instruction or data
	input [7:0]      address, //input from mux determines whether address is to stack or text
 	input [7:0]      data_in, //input from accumulator
  input            write_enable, //control signal
  input            clk);

   reg [7:0]       mainmem [0:255]; //256 lines, 1 word per line, 1 byte per word

   integer         i;

   initial begin
      $readmemb("mem.bin", mainmem); //assembled instructions loaded into text segment
//for (i=0; i < 5; i=i+1)
//      $display("%d:%b",i,mainmem[i]);
   end

   always @ (address) begin
      data_out = mainmem[address]; //outputs instruction at pc
   end

   always @ (negedge clk) begin
      if (write_enable) begin
   	     mainmem[address] <= data_in; //write data on negative clock edge
      end
   end
endmodule

/*module test;
   reg [7:0] stuff_in;
   wire [7:0] stuff_out;
   reg [7:0]  addr;
   reg        clk, write_enable;

   memory mem(stuff_out, addr, stuff_in, write_enable, clk);

   initial begin
   	  #1 clk = 0;
   	   write_enable = 0;
   	   addr = 8'b0000_0010;
   	  $monitor("%b, %d, %b, %b: time: %d",clk, addr, stuff_in, stuff_out, $time);
      #10 write_enable = 1;
       stuff_in = 8'b1111111;
      #15 write_enable= 0;

      #20 addr = 8'b0000_0000;

   end

   always
     #1 clk = !clk;

   initial
     #100  $finish;

endmodule*/
