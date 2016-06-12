.data
temp: .space 500
arr: .space 500
.text
.globl main
.ent main
main:
la $a0, temp 
li $v0, 8
syscall

la $t0, temp

Size:
lb $s0, ($t0)
beq $s0,10, Null
addi $t0, $t0, 1 
j Size

Null:
la $t1, temp
sub $s1, $t0, $t1

move $a1, $s1
la $t2, arr
li $s2, 0

reverse:
beq $s1, $s2, End
lb $a2, ($t0)
sw $a2, ($t2)
addi $t0, $t0, -1 
addi $t2, $t2, 1 
addi $s1, $s1, -1 
j reverse

End:
la $a0, arr
li $v0, 4
syscall
li $v0, 10
syscall