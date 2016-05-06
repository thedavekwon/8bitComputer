acmi 11
add $a3
acmi 1
add $a2
add $a3
acmi -1 FIB:
add $a3
acm $a1 
add $v0			//$v0 = $v0 + $a1
acm $a2	
acm $v0			//$v0 = $v0 + $a2
acm $a1
slt $a1	
acm $a2		
add $a1			//$a1 = $a2
acm $a2
slt $a2
acm $v0
add $a2			//$a2 = $v0
acm $t1 //reset t1
slt $t1 //...
acm $a3
add $t1 //set t1 to a0
acmi 0
slt $t1 //or 0 < a0
bnzl FIB $t1 // if a0 > 0 branch to L01
acmi 1
add $HR