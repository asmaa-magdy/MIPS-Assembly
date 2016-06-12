.data
Radius: .asciiz  "Enter radius\n"
Area: .asciiz "\nArea is: "
Circumfrance: .asciiz "\nCircumfrance is: "
Pi: .word 3
.text
.globl main
.ent main

main:

li $v0, 4
la $a0, Radius
syscall 

li $v0, 5
add $s0, $v0, $0
syscall

li $v0, 4
la $a0, Area
syscall

lw $t0, Pi
mul $s1, $s0, $s0
mul $s2, $s1, $t0
add $a0, $s2, $0
li $v0, 1
syscall

li $v0, 4
la $a0, Circumfrance
syscall

li $t1, 2
mul $s3, $t1, $t0
mul $s3, $s3, $s0
add $a0, $s3, $0
li $v0, 1
syscall

la $v0, 10
syscall