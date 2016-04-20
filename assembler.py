#acm		000
#acmi		001
#add		010
#nand		011
#bnz		100
#slt		101
#sw			110
#lw 		111

ENV = globals().copy() # Clean user environment
COMMANDS = [] # Result buffer

OP_SHIFT = 13
SLOT1_SHIFT = OP_SHIFT - 3
SLOT2_SHIFT = SLOT1_SHIFT - 3
SLOT3_SHIFT = SLOT2_SHIFT - 3

from inspect import getouterframes, currentframe
def here():
	'''Get file and line number in source file'''
	try:
		return getouterframes(currentframe())[3][1:3]
	except:
		return "???", 0

def out(type, file, line, msg):
	'''Output message'''
	print "%s:%d: %s: %s" % (file, line, type, msg)

def error(file, line, msg):
	'''Print error message'''
	out("error", file, line, msg)

def warn(file, line, msg):
	'''Print warning message'''
	out("warning", file, line, msg)

class ASM:
	'''Base ASM instruction'''
	def __init__(self):
		self.file, self.line = here()
		COMMANDS.append(self)

class ALU3(ASM):
	'''ALU instruction with 3 operands'''
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

class acm(ALU3):
	'''`add' instruction'''
	code = 0

class acmi(ALU3):
	'''`sub' instruction'''
	code = 1

class move(ASM):
	'''`move' instruction''' 
	def __init__(self, src, dest):
		ASM.__init__(self)
		self.src = src
		self.dest = dest

	def genbits(self):
		return (2 << OP_SHIFT) | \
			   (self.src << SLOT1_SHIFT) | \
			   (self.dest << SLOT2_SHIFT)

class MemOp(ASM):
	'''Memory operation'''
	def __init__(self, reg, addr):
		ASM.__init__(self)
		self.reg = reg
		if addr >= (1 << 16): # Check that address is valid
			warn(self.file, self.line, "0x%X too big, will truncate" % addr)
			addr &= ((1 << 16) - 1) # Mask all bits above 16
		self.addr = addr

	def genbits(self):
		return (self.code << OP_SHIFT) | \
			   (self.reg << SLOT1_SHIFT) | \
			   self.addr

class lw(MemOp):
	'''`load' instruction'''
	code = 3

class sw(MemOp):
	'''`store' instruction'''
	code = 4

class jmp(ASM):
	'''`jmp' instruction'''
	def __init__(self, dest):
		ASM.__init__(self)
		self.dest = dest

	def genbits(self):
		return (5 << OP_SHIFT) | self.dest

def label(name):
	'''Setting a label'''
	ENV[name] = len(COMMANDS)

# Setup user environment
# Add registers
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

# Add operators
for op in (acm, acmi, add, nand, bnz, slt, sw, lw):
	ENV[op.__name__] = op

def parse(fname):
	'''Parse file '''
	global COMMANDS
	COMMANDS = []
	execfile(fname, ENV, {})
	return COMMANDS

from os.path import splitext, isfile
from array import array
from sys import exc_info, byteorder
from optparse import OptionParser
parser = OptionParser(usage="usage: %prog [options] FILE", version="0.1")
parser.add_option("-o", "--output", help="output file", dest="outfile",
	default="")
parser.add_option("-g", help="create debug file", dest="debug",
	action="store_true", default=0)

opts, args = parser.parse_args()
if len(args) != 1:
	parser.error("wrong number of arguments") # Will exit

infile = args[0]
if not isfile(infile):
	raise SystemExit("can't find %s" % infile)

try:
	commands = parse(infile)
except SyntaxError, e:
	error(e.filename, e.lineno, e.msg)
	raise SystemExit(1)
except Exception, e:
	# Get last traceback and print it
	# Most of this code is taken from traceback.py:print_exception
	etype, value, tb = exc_info()
	while tb: # Find last traceback
		last = tb
		tb = tb.tb_next
	lineno = last.tb_lineno # Line number
	f = last.tb_frame
	co = f.f_code
	error(co.co_filename, lineno, e)
	etype = value = tb = None # Release objects (not sure this is required ...)
	raise SystemExit(1)

a = array("H")
for cmd in commands:
	a.append(cmd.genbits())
if byteorder == "little":
		a.byteswap()
if not opts.outfile:
	opts.outfile = splitext(infile)[0] + ".o"
open(opts.outfile, "wb").write(a.tostring())
if opts.debug: # Emit debug information
	dbg = open(splitext(infile)[0] + ".dbg", "w")
	for cmd in commands:
		print >> dbg, "%s:%s" % (cmd.file, cmd.line)