bnzl STR 001 //branch to start
acmi 1 //Accumulate one into halt register
add $HR //...
acmi 3 STR:
add $a0 //set factorial parameter
acmi -1 FAC:
add $sp
acm $sp
sw $ra //store return address
acmi -1 //adjust stack
add $sp //...
acm $sp
sw $a0 //store parameter
acm $t1 //reset t1
slt $t1 //...
acm $a0
add $t1 //set t1 to a0
acmi 1
slt $t1 //or 1 < a0
bnzl L01 $t1 // if a0 > 1 branch to L01
acmi 1 //else return 1
add $v0 //...
add $sp //pop
acm $sp
lw $ra //load return address
acmi 1
add $sp //pop
bnzl $ra //jump to ra
acmi -1 L01:
add $a0 //subtract 1 from a0
bnzl FAC 001 //run FAC again
acm $sp
lw $a0 //load parameter
acm $a1 //reset a1
slt $a1 //...
acm $v0 //put v0 into a1
add $a1
bnzl MUL 001 //multiply a0 and a1 = v0
acmi 1
add $sp
acm $sp
lw $ra //load return address
acmi 1
add $sp //pop
bnzl $ra //branch to ra
acm $v0	MUL:
slt $v0 //init return reg
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
bnzl ML1 $t2
acm $sp
lw $ra
acmi 1
add $sp
bnzl $ra //branch to return address
