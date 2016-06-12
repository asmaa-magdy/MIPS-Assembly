.data
string: .space 100
char: .space 1 
#endl: .asciiz "\n"
size: .asciiz "\nSize: "
small: .asciiz "\nIn Small: "
index: .asciiz "\nIndex: "
.text
.globl main
.ent main
main:

la $a0, string
li $v0, 8
syscall

la $a0, char
li $v0, 8
syscall

la $t0, string
la $t2, char
lb $s3, ($t2)

Size:
lb $s0, ($t0)
beq $s0,10, Null
addi $t0, $t0, 1 
j Size

Null:
la $t1, string
sub $s1, $t0, $t1

la $a0, size
li $v0, 4
syscall
add $a0, $s1, $0
li $v0, 1
syscall

li $s4, 0
li $t3, 0
la $t4, string


blt $s3, 96, S

Capital:
beq $t3, $s1, Output
lb $t5, ($t4)
blt $t5, 96, Small
addi $t3, $t3, 1
addi $t4, $t4, 1 
j Capital 

Small:
addi $t5, $t5, 32
sb $t5, ($t4)
j Capital

S:
addi $s3, $s3, 32 
sb $s3, ($t2)
j Capital
 
Output:
la $a0, small
li $v0, 4
syscall
la $a0, string
li $v0, 4
syscall

la $a0, small
li $v0, 4
syscall
la $a0, char
li $v0, 4
syscall

li $t3, 0
LOOP:
beq $t3, $s1, NotFound
lb $s2, ($t1)
beq $s2, $s3, Found
addi $t3, $t3, 1
addi $t1, $t1, 1 
j LOOP 

Found:
la $a0, index
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall
li $v0, 10
syscall

NotFound:
la $a0, index
li $v0, 4
syscall
li $a0, -1
li $v0, 1
syscall
li $v0, 10
syscall