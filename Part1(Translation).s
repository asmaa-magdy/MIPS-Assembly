.data
arr: .space 12
first: .asciiz "arr[0] : "
second: .asciiz "\narr[1] : "
third: .asciiz "\narr[2] : "
result: .asciiz "\nSo arr[2] = "
endl: .asciiz "\n"
.text
.globl main
.ent main
main: 

#--------------------Load Address--------------
la $t0, arr

la $a0, first
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, ($t0)

la $a0, second
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, 4($t0)

lw $s0, ($t0)
lw $s1, 4($t0)
add $s1, $s1, $s0

la $a0, third
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, 8($t0)

lw $s2, 8($t0)
add $s2, $s2, $s1

la $a0, result
li $v0, 4
syscall

add $a0, $s2, $0
li $v0, 1
syscall

la $a0, endl
li $v0, 4
syscall

li $v0, 10
syscall

