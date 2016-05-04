acmi 13  //init parameters
add $a0 //...
acmi 8  //...
add $a1 //...
acm $t0 MUL:
slt $t0 //init t0
acm $v0	//init return reg
slt $v0 //...
acmi -1 //adjust stack pointer
add $sp
acm $sp
sw $ra //store return addr
acmi -1
add $sp
acm $sp
sw $a0 //store param1
acmi -1
add $sp
acm $sp
sw $a1 //store param2
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
acmi 1
add $HR
