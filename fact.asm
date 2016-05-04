bnzl STR 001
acmi 1
add $HR
acmi 4 STR: 
add $a0
acmi 1
add $v0	
acmi -1 FAC:
add $sp
acm $sp
sw $ra //
acmi -1	
add $sp	
acm $sp	
sw $a0 //
acm $t1
slt $t1	
acmi 1
add $t1		
acm $a0
slt $t1
acmi -1
add $t1
bnzl L01 $t1
acm $sp	
lw $ra
acmi 2
add $sp
acmi 1
bnzl $ra		
acmi -1 L01:
add $a0
bnzl FAC 001
acm $sp
lw $a0 //
acmi 1
add $sp
acm $a1
slt $a1
acm $v0
add $a1
bnzl MUL 001	
acm $sp	
lw $a0 //
acmi 1
add $sp
acmi 1
acm $sp
lw $ra
bnzl $ra
acm $t0 MUL:
slt $t0 //init t0
acm $v0	//init return reg
slt $v0 //...	
acmi -1 //adjust stack pointer
add $sp
acm $sp
sw $ra //store return addr
acm $a0 ML1:
add $v0
acmi -1
add $a1
acm $t2 //reset t1
slt $t2 //...
acm $a1
add $t2 //put a1 into t1
acmi 0
slt $t2 //compare 0 < a1
bnzl ML1 $t1
acm $sp
lw $ra
acmi 1
add $sp
acmi 1
bnzl $ra
