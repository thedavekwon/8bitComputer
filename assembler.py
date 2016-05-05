import sys

def check(value): #function for translation of registers
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
	if(value == "$ra"):
		return "11110"
	if(value == "$HR"):
		return "11111"

# fp = open("mult.asm" ,"r")
fp = sys.stdin

bin5 = lambda x : ''.join(reversed( [str((x >> i) & 1) for i in range(5)] ) )

links = {}

num = 0
for link in fp:
		# print link
		link = link.strip()
		# print link
		if (link[-1] == ":"):
				links[link[-4:-1]]=num
		num = num + 1
# print links

fp.seek(0,0)
output = ""

count = 0
for code in fp: #translation of instruction 
	# code = code.strip()
	if(code[0:4] == "acm "):
		output = "000" + check(code[4:7]) #(output = operation + register)
	elif(code[0:4] == "acmi"):
		output = "001" + bin5(int(code[5:7])) #(output = operation + immediate)
	elif(code[0:3] == "add"):
		output = "010" + check(code[4:7])
	elif(code[0:3] == "nand"):
		output = "011" + check(code[4:7])
	elif(code[0:4] == "bnzl"):
		if(links.get(code[5:8]) != None):
			onum = links.get(code[5:8])
			linesadded = 3 + (onum/15) + ((onum/15)>0) + (2*((onum%15)>0))
			num = onum if (onum < count) else onum + linesadded
			prevnum = onum
			while prevnum != num:
					prevnum = num
					# print num
					linesadded = 3 + (num/15) + ((num/15)>0) + (2*((num%15)>0))
					# print linesadded
					num = onum + linesadded
			print "00011110"
			print "10111110"
			if (num > 15):
				print "00101111"
				for loop in range(num/15):
					print "01011110"
			if (num % 15 != 0):
				print "001" + bin5(num % 15)
				print "01011110"
			comp = code[9:12]
			if (comp[0] == "$"):
				print "000" + check(code[9:12])
			else:
				print "001" + bin5(int(comp))
			for ind in links:
				if (links[ind] > count):
					links[ind] = links[ind] + linesadded
			count =  count + linesadded
			output = "10011110"
		else:
			output = "100" + check(code[5:8])
	elif(code[0:3] == "slt"):
		output = "101" + check(code[4:7])
	elif(code[0:2] == "sw"):
		output =  "110" + check(code[3:6])
	elif(code[0:2] == "lw"):
		output = "111" + check(code[3:6])
	else:
		output = "error"
	count = count + 1
	print output #+ " " + code

while (count != 256):
	output = "00000000"
	count = count + 1
	print output

fp.close()
