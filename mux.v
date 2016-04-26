module mux2to1(
               output reg [7:0] dout,
               input [7:0]  din1,
               input [7:0]  din2,
               input        select); //1-bit address

   always @ (select) begin
      if(select == 1'b0) begin
   	     dout = din1;
      end
      else if(select == 1'b1) begin
   	     dout = din2;
      end
   end
endmodule

/*module mux4to1(din1, din2, din3, din4, mCtrl, dout);

   input din1, din2, din3, din4;
   input [1:0] mCtrl;
   output      dout;

   if(mCtrl == 2'b00) begin
   	  dout = din1;
   end
   if(mCtrl == 2'b01) begin
   	  dout = din2;
   end
   if(mCtrl == 2'b10) begin
   	  dout = din3;
   end
   if(mCtrl == 2'b11) begin
   	  dout = din4;
   end
endmodule*/
