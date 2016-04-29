module alu (
            output reg [7:0] dataOut,
            input [7:0]  dataInACC,
            input [7:0]  dataIn,
            input [1:0]  control,
            input [7:0]  pc);

   always @ (dataInACC || dataIn || control)
     if(control == 2'b00) begin            //add
   		  dataOut = dataInACC + dataIn;
     end else if(control == 2'b01) begin   //nand
    	  dataOut = dataInACC ~& dataIn;
     end else if(control == 2'b10) begin   //branchAddr not zero
   		  if(dataInACC != /*dataIn*/ 8'b0000_0000) begin
   			   dataOut = /*8'b0000_0001*/ pc + 1;
   		  end else begin
   		     dataOut = /*8'b0000_0000*/ dataIn;
   		  end
     end else if(control == 2'b11) begin   //set less than
   		  if(dataInACC < dataIn) begin
   			  assign dataOut = 8'b0000_0001;
  	 	  end else begin
   			   assign dataOut = 8'b0000_0000;
   		  end
     end

   initial dataOut = 0;

endmodule
