module eight_bit_adder();

reg[7:0] a,b;
reg[7:0] sum;
reg carry;

always @ (a or b)
begin
	{carry,sum} = a+b;
end

endmodule
