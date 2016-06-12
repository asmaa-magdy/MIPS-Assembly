.data 
.text
.globl main
.ent main
main:

li $v0,5
syscall

add $s1, $v0, $0

li $v0, 5
syscall

add $s2, $v0, $0

add $s3,$s2,$0  
li $s4, 1
loop:
beq $s3,$0, exit
mul $s4, $s4, $s1 
li $t0, 1
sub $s3,$s3,$t0 
j loop

exit:
add $a0, $s4,$0
li $v0, 1
syscall



li $v0, 10
syscall




.end main