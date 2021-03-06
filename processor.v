`include "pc.v"
`include "alu.v"
`include "mux.v"
`include "memory.v"
`include "controlunit.v"
`include "shiftregs.v"
`include "signextend.v"
`include "accumulator.v"

module processor;

    reg clk, acc_n0;
    wire regWE, memWE, brnch, alu_sc, lw, accWE, acc_sc, mem_sc;
    reg [2:0] opcode;
    reg [4:0] immediate;
    reg [7:0] instr, regBuf;
    wire [1:0] cntr_alu;
    wire [7:0] addr, ext_imm, mem_addr, mem_out, regIn, regOut, alu_out, acc_out, acc_in, alu_in;


    controlunit cu(clk, opcode, cntr_alu, regWE, memWE, brnch, alu_sc, lw, accWE, acc_sc, mem_sc);

    and(brnch_yes, acc_n0, brnch); //branch taken if control signal && ACM != 0
    pc pc(addr, regBuf, clk, brnch_yes);

    and(mem_scAdj, mem_sc, clk); //DM accessed if clock HIGH && control signal
    mux2to1 m1(mem_addr, addr, acc_out, mem_scAdj); //determines source of memory address, pc or accumulator
    memory mem(mem_out, mem_addr, regOut, memWE, clk);

    mux2to1 m2(regIn, alu_out, mem_out, lw); //determines source of RF write, ALU or DM
    shiftregs regfile(regOut, immediate, regIn, regWE, clk); //RF

    mux2to1 m3(acc_in, regOut, ext_imm, acc_sc); //determines soucre of next ACM value, RF or instruction[4:0]
    accumulator accum(acc_out, acc_in, accWE, clk);

    //mux2to1 m4(alu_in, 8'b0000_0000, regOut, alu_sc);
    alu alu(alu_out, acc_out, /*alu_in*/regOut, cntr_alu, addr);

    signexten se(ext_imm, immediate);
    always @ (instr) begin
        {opcode,immediate} = instr;
        if (regfile.regfile[31] != 8'b0000_0000) begin //If HLT, stop
            $display("TIME DONE: %d", $time);
            $finish;
        end
    end

    always @ (acc_out) begin
        acc_n0 = acc_out[0] | acc_out[1] | acc_out[2] | acc_out[3] | acc_out[4] | acc_out[5] | acc_out[6] | acc_out[7];
    end

    always @ (regOut) begin
        if (clk)
        regBuf <= regOut;
    end
    always @ (posedge clk) begin //read instructions from text segment
        instr <= mem_out;
    end

    always #1 clk = !clk;

    initial begin
        clk = 1;
    end
    wire signed [7:0] print;
    assign print = $signed(regfile.regfile[1]);

    initial begin
        $monitor("$v0: %d "/*,t1: %d, $a0: %d, $a1 %d, $ra: %d $sp: %d"*/, print);//, regfile.regfile[18], regfile.regfile[5], regfile.regfile[6], regfile.regfile[30], regfile.regfile[29]);
        $dumpfile("proc_vcd.vcd");
        $dumpvars(1, processor);
        #10000 $finish;
    end

endmodule
