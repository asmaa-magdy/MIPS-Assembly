.data
arr: .space 500
.text
.globl main
.ent main
main:
la $a0, arr 
li $v0, 8
syscall

la $t0, arr 
li $t2, 0
li $t3, 0

Size:
lb $s0, ($t0)
beq $s0,10, Null
addi $t0, $t0, 1 
j Size

Null:
la $t1, arr
sub $s1, $t0, $t1

#addi $s1, $s1, -1 
la $t0, arr

Pair:
beq $t2, $s1, End
lb $s2, ($t0)
addi $t0, $t0, 8
lb $s3, ($t0)
addi $t0, $t0, -4
addi $t2, $t2, 1
beq $s2, $s3, Count
j Pair

Count:
addi $t3, $t3, 1 
j Pair

End:
move $a0, $t3
li $v0, 1
syscall
li $v0, 10
syscall
