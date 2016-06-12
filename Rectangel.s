.data
Height: .asciiz  "Enter first numeber\n"
Width: .asciiz "Enter second number\n"
Area: .asciiz "\nArea is: "
Circumference: .asciiz "Circumference is: "
  #__________________________________________________________________

.text
.globl main
.ent main

main:
li $v0, 4
la $a0, Height
syscall

#____________________ take input from user and add it to s0 ______________________

li $v0, 5
syscall
add $s0, $v0, $0

#_________________________Print message "Width"____________________________

li $v0, 4
la $a0, Width
syscall

#_____________________take input from user and add it to s1_______________________

li $v0, 5
syscall
add $s1, $v0, $0

#_________________________Calculate the circumference___________________________

add $s2, $s1, $s0
li $t0, 2
mul $s2, $s2, $t0

li $v0, 4
la $a0, Circumference 
syscall

add $a0, $s2, $0
li $v0,1
syscall

#____________________________Calculate the Area_______________________________

li $v0, 4
la $a0, Area
syscall
mul $s2, $s1, $s0
add $a0, $s2, $0
li $v0, 1
syscall


li $v0, 10
syscall
.end main