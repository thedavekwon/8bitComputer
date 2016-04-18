module alu (regInSAR, regIn, regOut, control, branch);
   
   input [7:0] regInSAR, regIn; //regInA = Set Aside Register, regIn = register from instruction
   input [1:0] control;			//control = control from instruction 
   output [7:0] regOut;			//regOut = output from alu
   output branch;				//branch = 1 (branch), branch = 0 (not branch)

   reg [7:0] regOut;
   reg branch;
   wire [7:0] regInSAR, regIn;
   wire [1:0] control;
 
   always @ (regInSAR or regIn)

   if(control == 1'b00) begin            //add
   		regOut = regInSAR + regIn;
   end else if(control == 1'b01) begin   //nand
    	regOut = regInSAR ~& regIn;
   end else if(control == 1'b10) begin   //branch not zero
   		if(regInSAR == 1'b0) begin
   			branch = 1;
   		end else begin
   			branch = 0;
   		end
   end else if(control == 1'b11) begin   //set less than
   		if(regInSAR < regIn) begin
   			regOut = 1'b0000_0001;
  	 	end else begin
   			regOut = 1'b0000_0000;
   		end
   end
   
endmodule 
