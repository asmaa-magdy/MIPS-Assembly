.data
arr: .space 800
space: .asciiz " "
.text
.globl main
.ent main
main:

la $a1, arr
li $t0, 0

li $s3, 0
la $a3, arr

Input:
li $v0, 5
syscall
beq $v0, $0, Sort
sw $v0, ($a1)
addi $a1, $a1, 4
addi $t0, $t0, 1
j Input


Sort:
li $t1, 1
la $a1 ,arr
addi $a1, $a1, 4

Insertion:
beq $t1, $t0, Output
lw $s0, ($a1)
move $t3, $s0
move $t2, $t1
move $a2, $a1
addi $a1, $a1, -4
lw $s1, ($a1)

While:
beq $t2, $0, loop
ble $s1, $t3, loop
addi $a1, $a1, 4
sw $s1, ($a1)
addi $t2, $t2, -1
addi $a1, $a1, -8
lw $s1, ($a1)
j While

loop:
addi $a1, $a1, 4
sw $t3, ($a1)
addi $t1, $t1, 1
move $a1, $a2
addi $a1, $a1, 4
j Insertion

Output:
beq $s3, $t0, Termination
lw $a0, ($a3)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
addi $a3, $a3, 4
addi $s3, $s3, 1
j Output


Termination:
li $v0, 10
syscall
.end main