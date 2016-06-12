.data
TotalExecutionTime: .asciiz "\nTotal Executed time = "
EffectedTime: .asciiz "\nEffected time = "
Amount: .asciiz "\nAmount = "
Total: .asciiz "\n Total time = "
#__________________________________________________________________

.text
.globl main
.ent main
main:

#________________Print total message, take input from user and add it to s0______________

la $a0, Total
li $v0, 4
syscall

li $v0, 5
syscall

add $s0, $v0 , $0

#___________Print effected time message, take input from user and add it to s1___________

la $a0, EffectedTime
li $v0, 4
syscall

li $v0, 5
syscall

add $s1, $v0 , $0

#________________Print amount message, take input from user and add it to s2______________

la $a0, Amount
li $v0, 4
syscall

li $v0, 5
syscall

add $s2, $v0 , $0

#________________Print total execution time message______________

la $a0, TotalExecutionTime

li $v0, 4
syscall

#________________Calculate Total Execution Time ______________

div $t0, $s1, $s2
sub $t1, $s0, $s1
add $a0, $t1, $t0

li $v0, 1
syscall

li $v0, 10
syscall
.end main
