`include "pc.v"
`include "alu.v"
`include "mux.v"
`include "memory.v"
`include "controlunit.v"
`include "shiftregs.v"
`include "signextend.v"
`include "accumulator.v"

module processor;

   reg clk;
   wire regWE, memWE, brnch, alu_sc, lw, accWE, acc_sc, mem_sc;
   reg [2:0] opcode;
   reg [4:0] immediate;
   reg [7:0] instr;
   wire [1:0] cntr_alu;
   wire [7:0] addr, ext_imm, mem_addr, mem_out, regIn, regOut, alu_out, acc_out, acc_in, alu_in;


   controlunit cu(clk, opcode, cntr_alu, regWE, memWE, brnch, alu_sc, lw, accWE, acc_sc, mem_sc);

   pc pc(addr, regOut, clk, brnch);

   and(mem_scAdj, mem_sc, clk);
   mux2to1 m1(mem_addr, addr, acc_out, mem_scAdj);
   memory mem(mem_out, mem_addr, regOut, memWE, clk);

   mux2to1 m2(regIn, alu_out, mem_out, lw);
   shiftregs regfile(regOut, immediate, regIn, regWE, clk);

   mux2to1 m3(acc_in, regOut, ext_imm, acc_sc);
   accumulator accum(acc_out, acc_in, accWE, clk);

   //mux2to1 m4(alu_in, 8'b0000_0000, regOut, alu_sc);
   alu alu(alu_out, acc_out, /*alu_in*/regOut, cntr_alu, addr);

   signexten se(ext_imm, immediate);
   always @ (instr)
   	 {opcode,immediate} = instr;

   always @ (addr) begin
      //if(~(memWE || lw)) begin
         instr = mem_out;
      //end
   end

   always #2 clk = !clk;

   initial begin
      clk = 0;
   end


   initial begin
      $dumpfile("proc_vcd.vcd");
	    $dumpvars(1, processor);
      #3000 immediate = 00001;
      #1 $display("$v0: %d", regOut);
      #1 $finish;
   end

endmodule
