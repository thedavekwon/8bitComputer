all: run

run: mem processor.out
	./processor.out

processor.out:
	iverilog processor.v -o processor.out

time:
	gtkwave pcomp_vcd.vcd

mem:
	python2 assembler.py < ${file} > mem.bin

clean:
	rm *.out *.vcd mem.bin
