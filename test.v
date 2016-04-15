module rom (address, data);        

	input [1:0] address;
	output [1:0] data;

	reg [1:0] data;
   
	always @ (address) begin
		case (address)
			2'b00: data = 2'b00;
			2'b01: data = 2'b01;
			2'b10: data = 2'b00;
			2'b11: data = 2'b10;
		endcase
	end
endmodule

module papercomp (clock, reg_0, reg_of, pc_);
   
	input clock;
	output reg_of;
	output [1:0] pc_, reg_0;

	reg [1:0] reg_0;
	reg reg_of;
	reg [1:0] pc_;
	wire [1:0] instr;
	reg [1:0] buffinstr;
	reg [1:0] addr;
	reg ovr;


	rom mem (addr, instr);

	always @ (posedge clock) begin
		buffinstr = instr;
	end

	always @ (buffinstr) begin
		if (buffinstr != 2'b01) begin
			ovr = 0;
		end
		case (buffinstr) 
			2'b00: inc();
			2'b01: jno1();
			2'b10: ;//hlt
			2'b11: ;//noop
		endcase
	end

	always @ (negedge clock) begin
		addr = pc_;
	end

	always @ (ovr) begin
		if (ovr == 1) begin
			jno2();
		end
	end

	task inc;
		begin
			pc_ = pc_ + 2'b01;
			if (reg_0 == 2'b11) begin
				reg_of = reg_of + 2'b01;
			end
			reg_0 = reg_0 + 2'b01;	
		end
	endtask

	task jno1;
		begin
			addr = addr + 2'b01;
			ovr = 1;
		end
	endtask

	task jno2;
		begin
			if (reg_of != 1) begin
				pc_ = instr;
				//$display ("pc <- instr %b",pc_);
			end else begin
				pc_ = addr + 2'b01;
				//$display ("pc <- %b //",pc_);
			end
		end
	endtask

	initial begin
		reg_0 = 2'b00;
		reg_of = 2'b00;
		pc_ = 2'b00;
		addr = 2'b00;
		ovr = 0;
		buffinstr = 0;
	end
  
endmodule

module test;

	reg clock;
	wire [1:0] reg0;
	wire regof;
	wire [1:0] pc;

	initial begin
		$dumpfile("pcomp_vcd.vcd");
		$dumpvars(1, test.pcomp);
		$monitor ("reg0=%b,regof=%b,pc=%b", reg0,regof,pc);
		clock = 2'b00;
		#500  $finish;
	end

	papercomp pcomp (clock, reg0, regof, pc);

	always begin
		#10 clock = !clock;
	end

endmodule 