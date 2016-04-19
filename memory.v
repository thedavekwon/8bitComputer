module memory(address, data);
   input [7:0] address;
   output [7:0] data;

   reg [7:0]    data;
   reg [7:0] mainmem [0:256];

   initial begin
      $readmemb("mem.bin", mainmem);

   end
   always @ (address) begin
      data = mainmem[address];
   end
endmodule

module test;
   wire [7:0] stuff;
   reg [7:0] addr;

   memory mem(addr, stuff);

   initial begin
      $display("Test: %d", stuff);
      #5 addr = 8'b00000010;
      #6 $display("Test: %d", stuff);
   end
endmodule
