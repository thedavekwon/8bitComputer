module controlunit(clk, instruction, con_inst, con_reg);
   
   input [7:0] instruction;
   input clk;
   output [1:0] con_inst;
   output [5:0] con_reg;
   
   wire [7:0] instruction;
   wire clk;
   reg [1:0] con_inst;
   reg [2:0] trunc_8_to_3;
   reg [5:0] con_reg; trunc_8_to_5;

   trunc_8_to_5 = instruction[5:0];
   trunc_8_to_3 = instruction[7:5];
   
   always @ (clk)
   begin
   	con_reg = trunc_8_to_5;
   	if(trunc_8_to_3 == 1)
   end
  
endmodule
