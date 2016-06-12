.data
.text
.globl main
.ent main 
main:

li $v0, 5
syscall

add $t0, $v0, $0
li $s0, 0
li $s1, 1
li $s3, 1
li $s4,0 

li $s5, 0
sub $t0,$t0,1
Loop:
beq $s0, $t0,exit0 
beq $s1, $t0, exit


addi $s5,$s5, 1
beq $s5,$t0,Exit

add $t1, $s1, $s3
move $s1,$s3
move $s3,$t1

j Loop

Exit:
move $a0, $t1
li $v0,1 
syscall 
li $v0,10 
syscall 

exit0: 
li $a0,0
li $v0,1 
syscall 
li $v0,10 
syscall  


exit: 
li $a0, 1
li $v0,1 
syscall 
li $v0,10 
syscall  
.end main