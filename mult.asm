acmi 6  //init parameters
add $a0 //...
acmi 7  //...
add $a1 //...
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
acm $t1 //reset t1
slt $t1 //...
acm $a1
add $t1 //put a1 into t1
acmi 0
slt $t1 //compare 0 < a1
bnzl ML1 $t1
acm $sp
lw $ra #restore return address
acmi 1
add $sp #restore stack pointer
add $HR #stop program
