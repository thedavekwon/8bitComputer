fact:
	acm $ra
	nand $ra
	acm $s0 #$ra saved initially in $s1
	add $ra
	acmi -8
	add $sp
	acm $t0
	slt $t0
	acm $sp
	add $t0
	acmi 4
	add $t0
	acm $t0
	sw $ra
	acmi 4
	add $t0
	acm $t0
	sw $a0

	acm $t1
	slt $t1
	acmi 1
	add $t1
	acm $a0
	slt $t1
	acmi 1
	nand $t1
	bnzl L1

	acm $v0
	slt $v0
	acmi 1
	nand $v0
	acmi 8
	add $sp
	bnzl $ra


L1:
	acmi -1
	add $a0
	bnzl fact #fact saved in $s0
	acm $sp
	lw $a0
	acmi 4
	add $sp
	acm $sp
	lw $ra
	acmi 4
	add $sp
	acm $a0
	mul $v0 #pseudocode
	acmi 1
	bnzl $ra
