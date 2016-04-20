module alu (
            input [7:0]  dataInACC
            input [7:0]  dataIn; //dataInA = Set Aside Register, dataIn = register from instruction
            input [1:0]  control; //control = control from instruction
            output [7:0] dataOut);	//dataOut = output from alu

   reg [7:0]             dataOut;
   reg [7:0]             branchAddr;
   wire [7:0]            dataInACC, dataIn;
   wire [1:0]            control;

   always @ (dataInACC or dataIn)

     if(control == 2'b00) begin            //add
   		  dataOut = dataInACC + dataIn;
     end else if(control == 2'b01) begin   //nand
    	  dataOut = dataInACC ~& dataIn;
     end else if(control == 2'b10) begin   //branchAddr not zero
   		  if(dataInACC == 0) begin
   			   dataOut = dataIn[4:0];
   		  end else begin
   		     dataOut = 1;
   		  end
     end else if(control == 2'b11) begin   //set less than
   		  if(dataInACC < dataIn) begin
   			   dataOut = 8'b0000_0001;
  	 	  end else begin
   			   dataOut = 8'b0000_0000;
   		  end
     end

endmodule
