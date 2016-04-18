module single_adder();
reg a,b;
reg sum, carry;

always @ (a or b)
begin
	{carry,sum} = a+b;
end
