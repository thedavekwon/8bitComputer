module controlunit(
                   input            clk,
                   input [7:0]      instruction,
                   output reg [1:0] cntr_alu,
                   output reg       regWE,
                   output reg       memWE,
                   output reg       brnch,
                   output reg       selAluIn,
                   output reg       lw,
                   output reg       accWE,
                   output reg       selAccIn,
                   output reg       selMemIn);
   reg [2:0]                        three_inst;
   reg [4:0]                        five_reg;

   always @ (instruction)
   	 {three_inst,five_reg} = instruction;

   always @ (three_inst) begin
      case (three_inst)
        3'b000: begin
           memWE = 0;
           regWE = 0;
           brnch = 0;
           accWE = 1;
           selAccIn = 0;
           selMemIn = 0;
        end
        3'b001: begin
           memWE = 0;
           regWE = 0;
           brnch = 0;
           accWE = 1;
           selAccIn = 1;
           selMemIn = 0;
        end
        3'b010: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
   		     cntr_alu = 2'b00;
           selMemIn = 0;
        end
        3'b011: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
           cntr_alu = 2'b01;
           selMemIn = 0;
        end
        3'b100: begin
           memWE = 0;
           regWE = 1; //Changed
           brnch = 1;
           accWE = 0;
           selAluIn = 0;
   		     cntr_alu = 2'b10;
           selMemIn = 0;
        end
        3'b101: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
   		     cntr_alu = 2'b11;
           selMemIn = 0;
        end
        3'b110: begin
           memWE = 1;
           regWE = 0;
           brnch = 0;
           accWE = 0;
           selMemIn = 1;
        end
        3'b111: begin
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           lw = 1;
           selMemIn = 1;
        end
   	  endcase
   end
endmodule
