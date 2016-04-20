module controlunit(
                   input        clk,
                   input [7:0]  instruction,
                   output [1:0] cntr_alu,
                   output       regWE,
                   output       memWE,
                   output       brnch,
                   output       selAluIn,
                   output       lw,
                   output       accWE,
                   output       selAccIn);
   wire                         three_inst;
   wire                         five_reg;

   always @ (instruction)
   	 {three_inst,five_reg} = instruction;

   always begin
      case (three_inst)
        3'b000: begin
           memWE = 0;
           regWE = 0;
           brnch = 0;
           accWE = 1;
           selAccIn = 0;
        end
        3'b001: begin
           memWE = 0;
           regWE = 0;
           brnch = 0;
           accWE = 1;
           selAccIn = 1;
        end
        3'b010: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
   		     cntr_alu = 2'b00;
        end
        3'b011: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
           cntr_alu = 2'b01;
        end
        3'b100: begin
           memWE = 0;
           regWE = 0;
           brnch = 1;
           accWE = 0;
           selAluIn = 0;
   		     cntr_alu = 2'b10;
        end
        3'b101: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
   		     cntr_alu = 2'b11;
        end
        3'b110: begin
           memWE = 1;
           regWE = 0;
           brnch = 0;
           accWE = 0;
        end
        3'b111: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           lw = 1;
        end
   	  endcase
   end
endmodule
