module controlunit(clk, instruction, con_inst, con_reg);
   
   input [7:0] instruction;
   input clk;
   output [1:0] con_inst;
   output [4:0] con_reg;
   
   wire [7:0] instruction;
   wire clk;
   reg [1:0] con_inst;
   reg [2:0] three_inst;
   reg [4:0] con_reg, five_reg;

   always @ (instruction)
   	{three_inst,five_reg} = instruction;
   
   always @ (clk)
   begin
   	con_reg = five_reg;
   	if(three_inst == 3'b010) begin
   		con_inst = 2'b00;
   	end else if(three_inst == 3'b011) begin
   		con_inst = 2'b01;
   	end else if(three_inst == 3'b100) begin
   		con_inst = 2'b10;
   	end else if(three_inst == 3'b101) begin
   		con_inst = 2'b11;
   	end
   end
endmodule


module test;
   reg [7:0] stuff_in;
   wire [4:0] reg_out;
   wire [1:0] inst_out;
   reg        clk, write_enable;

   controlunit contr(clk, stuff_in, inst_out, reg_out);

   initial begin
   	  #1 clk = 0;
   	  stuff_in = 8'b1101_0011;
   	  $monitor("%b, %b, %b, %b: time: %d",clk, stuff_in, inst_out, reg_out, $time);
      #50 stuff_in = 8'b01111111;
   end

   always
     #1 clk = !clk;

   initial
     #100  $finish;

endmodule
