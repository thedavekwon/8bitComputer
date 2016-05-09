all: run

run: mem processor
	./processor.out

processor:
	iverilog processor.v -o processor.out

time:
	gtkwave proc_vcd.vcd

mem:
	python2 assembler.py < ${file} > mem.bin

clean:
	rm *.out *.vcd mem.bin
