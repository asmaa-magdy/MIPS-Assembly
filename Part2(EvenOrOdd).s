.data
Input: .asciiz "\nEnter Your Number : "
number: .asciiz "\nYour number after calculations : "
Output: .asciiz "\n\nNumber of Operations : "
.text
.globl main
.ent main
main:

la $a0, Input
li $v0, 4
syscall
#--------------------- for checking "Stopping loop"----------------------
li $t0, 1

#--------------------- to compare with the result of addition to 1 (even or odd) ---------------
li $t1, 0

#--------------------- counter ------------------
li $t2, 0 

li $v0, 5
syscall 
add $s0, $v0, $0
#---------------------------------------------------------------------------------------------
Loop:

beq $s0, $t0, exit
andi $s1, $s0, 1
addi $t2, $t2, 1
beq $s1, $t0, Odd
beq $s1, $t1, Even
j Loop

 #---------------------------------------------------------------------------------------------- 
 
Odd: 
mul $s0, $s0, 3
addi $s0, $s0, 1 
j Op


Even:
div $s0, $s0, 2 
j Op 

#-----------------------------------------------------------------------------------------------

exit:
la $a0, Output
li $v0, 4 
syscall
add $a0, $t2, $0 
li $v0, 1
syscall
li $v0, 10
syscall

Op:
la $a0, number
li $v0, 4
syscall
add $a0, $s0, $0
li $v0, 1
syscall
j Loop


li $v0, 10
syscall


.end main
