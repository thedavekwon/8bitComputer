module controlunit(
                   input            clk,
                   input [7:0]      instruction,
                   output reg [1:0] cntr_alu, /*2-bit, determines alu operation
                                               00 - Add
                                               01 - Nand
                                               10 - != 0
                                               11 - Less*/
                   output reg       regWE, //1 - enables RF write
                   output reg       memWE, //1 - enables write to DM
                   output reg       brnch, //1 - branch, determines next pc value
                   output reg       selAluIn, /*mux determining 2nd input to ALU 
                                                0 - 0
                                                1 - from RF*/
                   output reg       lw, /*mux determines source of RF write 
                                          0 - ALU
                                          1 - DM*/
                   output reg       accWE, //1 - enables write to accumulator
                   output reg       selAccIn, /*mux determines source of accumulator write 
                                                0 - RF
                                                1 - Immediate, inst[4:0]*/
                   output reg       selMemIn); 
   reg [2:0]                        three_inst;
   reg [4:0]                        five_reg;

   always @ (instruction)
   	 {three_inst,five_reg} = instruction;

   always @ (three_inst) begin
      case (three_inst)
        3'b000: begin //ACM
           memWE = 0;
           regWE = 0;
           brnch = 0;
           accWE = 1;
           selAccIn = 0;
           selMemIn = 0;
        end
        3'b001: begin //ACMI
           memWE = 0;
           regWE = 0;
           brnch = 0;
           accWE = 1;
           selAccIn = 1;
           selMemIn = 0;
        end
        3'b010: begin //ADD
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
   		     cntr_alu = 2'b00;
           selMemIn = 0;
        end
        3'b011: begin //NAND
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
           cntr_alu = 2'b01;
           selMemIn = 0;
        end
        3'b100: begin //BNZ
           memWE = 0;
           regWE = 1; //Changed
           brnch = 1;
           accWE = 0;
           selAluIn = 0;
   		     cntr_alu = 2'b10;
           selMemIn = 0;
        end
        3'b101: begin //SLT
           memWE = 0;
           regWE = 1;
           brnch = 0;
           accWE = 0;
           selAluIn = 1;
           lw = 0;
   		     cntr_alu = 2'b11;
           selMemIn = 0;
        end
        3'b110: begin //SW
           memWE = 1;
           regWE = 0;
           brnch = 0;
           accWE = 0;
           selMemIn = 1;
        end
        3'b111: begin //LW
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
