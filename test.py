def check(value):
	if(value == "$z0"):
		return "00000"
	if(value == "$v0"):
		return "00001"
	if(value == "$v1"):
		return "00010"
	if(value == "$v2"):
		return "00011"
	if(value == "$v3"):
		return "00100"
	if(value == "$a0"):
		return "00101"
	if(value == "$a1"):
		return "00110"
	if(value == "$a2"):
		return "00111"
	if(value == "$a3"):
		return "01000"
	if(value == "$s0"):
		return "01001"
	if(value == "$s1"):
		return "01010"
	if(value == "$s2"):
		return "01011"
	if(value == "$s3"):
		return "01100"
	if(value == "$s4"):
		return "01101"
	if(value == "$s5"):
		return "01110"
	if(value == "$s6"):
		return "01111"
	if(value == "$s7"):
		return "10000"
	if(value == "$t0"):
		return "10001"
	if(value == "$t1"):
		return "10010"
	if(value == "$t2"):
		return "10011"
	if(value == "$t3"):
		return "10100"
	if(value == "$t4"):
		return "10101"
	if(value == "$t5"):
		return "10110"
	if(value == "$t6"):
		return "10111"
	if(value == "$t7"):
		return "11000"
	if(value == "$t8"):
		return "11001"
	if(value == "$t9"):
		return "11010"
	if(value == "$t10"):
		return "11011"
	if(value == "$gp"):
		return "11100"
	if(value == "$sp"):
		return "11101"
	if(value == "$fp"):
		return "11110"
	if(value == "$ra"):
		return "11111"



fp = open("machine.asm" ,"r")

bin5 = lambda x : ''.join(reversed( [str((x >> i) & 1) for i in range(5)] ) )

for code in fp:
#	code = p.readline()
	if(code[0:4] == "acm "):
		output = "000" + check(code[4:7])
	elif(code[0:4] == "acmi"):
		output = "001" + bin5(int(code[5:]))

	elif(code[0:3] == "add"):
		output = "010" + check(code[4:7])
	elif(code[0:3] == "nand"):
		output = "011" + check(code[4:7])
	elif(code[0:3] == "bnz"):
		output = "100" + check(code[4:7])
	elif(code[0:3] == "slt"):
		output = "101" + check(code[4:7])
	elif(code[0:2] == "sw"):
		output =  "110" + check(code[3:6])
	elif(code[0:2] == "lw"):
		output = "111" + check(code[3:6])
	else:
		output = "error"
	print output

fp.close()
