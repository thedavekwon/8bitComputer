Cooper Union Comp Arch 8bit computer project By: Do Hyung Kwon, Daniel Nakhimovich, Stephen Brett

Assembling and Linking
	The assembling and linking is performed all by the assembler.py python program. It can be run by either typing: 
		python2 assembler.py < “application.asm” > mem.bin 
	Or by using the makefile by running:
		make file=application.asm 

Timing
	By using the makefile and gtkwave by running: 
		make time
