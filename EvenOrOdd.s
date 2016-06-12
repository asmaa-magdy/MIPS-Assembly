.data
even: .asciiz "\nSum of even numbers = "
odd: .asciiz "\nSum of odd numbers = "
arr: .word 13, 11, 2, 3, 4, 10
.text
.globl main
.ent main
main:

li $t1, 0
li $t2, 6

li $s2, 1
li $s3, 0


li $s4, 0
li $s5, 0
la $s1, arr
Loop:
beq $t1, $t2, els
lw $s6, ($s1)
andi $t0, $s6, 1
beq $t0, $s2, Odd
beq $t0, $s3, Even

Even:
add $s4, $s4, $s6 
j complete

Odd:
add $s5, $s5, $s6
j complete

complete: 
addi $s1, $s1, 4
addi $t1, $t1, 1 

j Loop
els:
li $v0, 4
la $a0, even
syscall
add $a0, $s4, $0
li $v0, 1
syscall 
li $v0, 4
la $a0, odd
syscall
add $a0, $s5, $0
li $v0, 1
syscall
li $v0, 10
syscall



.end main