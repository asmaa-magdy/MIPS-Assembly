.data
newString: .space 100
message: .asciiz "Enter your message\n"
Size: .asciiz "\nString size : "
Palindrom: .asciiz "\nPalindrom"
nott: .asciiz "\nNot palindrom"
.text
.globl main
.ent main
main:
la $a0, message
li $v0, 4
syscall
la $a0, newString
li $v0, 8
syscall
#------------------ load String ------------- t0 as pointer of newString 

move $t0, $a0

Loop:
lb $s0, ($t0)
beq $s0,10, Null
addi $t0, $t0, 1 
j Loop

Null:
la $a0, Size
li $v0, 4
syscall

la $s0, newString
sub $s1, $t0, $s0

add $a0, $s1, $0
li $v0, 1
syscall

la $s2, newString

div $s4, $s1, 2
sub $s1, $s1, 1
la $s3, newString
add $s3, $s3, $s1
li $t3, 0
Loop2:
beq $t3, $s4, equal 
lb $t1, ($s2)
lb $t2, ($s3)

addi $s2, $s2, 1 
sub $s3, $s3, 1 
addi $t3, $t3, 1 
beq $t1, $t2, Loop2
bne $t1, $t2, exit

j Loop2
equal:
la $a0, Palindrom
li $v0, 4
syscall
li $v0, 10
syscall 

exit:
la $a0, nott
li $v0, 4
syscall
li $v0, 10
syscall 

li $v0, 10
syscall
.end main 