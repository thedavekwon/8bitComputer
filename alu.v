module alu (
            output reg [7:0] dataOut,
            input [7:0]  dataInACC, //output of accumulator a.k.a. data_out
            input [7:0]  dataIn, //input from mux controled by selAluIn
            input [1:0]  control, //determines function, cntr_alu from controlunit
            input [7:0]  pc);

   always @ (pc or control or dataIn or dataInACC) begin
   	 if(control == 2'b00) begin            //add
   		  dataOut = dataInACC + dataIn;
     end else if(control == 2'b01) begin   //nand
    	  dataOut = dataInACC ~& dataIn;
     end else if(control == 2'b10) begin   //branchAddr not zero
   		  if(dataInACC != /*dataIn*/ 8'b0000_0000) begin
   			   dataOut = /*8'b0000_0001*/ pc;
   		  end else begin
   		     dataOut = /*8'b0000_0000*/ dataIn;
   		  end
     end else if(control == 2'b11) begin   //set less than
   		  if(dataInACC < dataIn) begin
   			   dataOut = 8'b0000_0001;
  	 	  end else begin
   			   dataOut = 8'b0000_0000;
   		  end
     end
    end

   initial dataOut = 8'b0000_0000;

endmodule
