acm		000
acmi	001
add		010
nand	011
bnz		100
slt		101
sw		110
lw 		111

ENV = globals().copy()

ENV["$zero"] = 0
ENV["v0"] = 1
ENV["v1"] = 2
ENV["v2"] = 3
ENV["v3"] = 4
ENV["a0"] = 5
ENV["a1"] = 6
ENV["a2"] = 7
ENV["a3"] = 8
ENV["s0"] = 9
ENV["s1"] = 10
ENV["s2"] = 11
ENV["s3"] = 12
ENV["s4"] = 13
ENV["s5"] = 14
ENV["s6"] = 15
ENV["s7"] = 16
ENV["t0"] = 17
ENV["t1"] = 18
ENV["t2"] = 19
ENV["t3"] = 20
ENV["t4"] = 21
ENV["t5"] = 22
ENV["t6"] = 23
ENV["t7"] = 24
ENV["t8"] = 25
ENV["t9"] = 26
ENV["t10"] = 27
ENV["$gp"]= 28
ENV["$sp"] = 29
ENV["$fp"] = 30
ENV["$ra"] = 31

for op in (acm, acmi, add, nand, bnz, slt, sw, lw): 
    ENV[op.__name__] = op

def parse(fname):
    global COMMANDS
	execfile(fname, ENV, {})
	return COMMANDS

class ASM:
	'''Base ASM instruction'''
	def __init__(self):
		COMMANDS.append(self)

OP_SHIFT = 13
SLOT1_SHIFT = OP_SHIFT - 3
LOT2_SHIFT = SLOT1_SHIFT - 3
SLOT3_SHIFT = SLOT2_SHIFT - 3
    
    class ALU3(ASM):
        def __init__(self, src1, src2, dest):
    		ASM.__init__(self)
            self.src1 = src1
            self.src2 = src2
            self.dest = dest
    
        def genbits(self):
            return (self.code << OP_SHIFT) | \
                   (self.src1 << SLOT1_SHIFT) | \
                   (self.src2 << SLOT2_SHIFT)  | \
                   (self.dest << SLOT3_SHIFT)		


	