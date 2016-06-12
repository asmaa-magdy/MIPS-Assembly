.data
arr: .word -11, -5, 2, -9, 22,-45, 56, 100, -101, 54
endl : .asciiz "\n"
.text
.globl main
main:
li $t0, 0
  li $t1, 10
  la $a2, arr
  la $a3, arr 
  li $t4,0
jal replace_negative_array

Looop:
  beq $t4, $t1, Finish
  lw $a0, ($a3)
  li $v0, 1
  syscall
  li $v0,4
  la $a0,endl
  syscall
  addi $a3, $a3, 4
  addi $t4, 1
  j Looop
 Finish:
li $v0, 10
syscall

replace_negative_array:
	li $s3,0
  sub $sp, $sp, 4
  sw $ra, ($sp)  
  Loop:
    beq $t0, $t1, endodFun
    lw $a0, ($a2)
    jal is_negative
  
    bne $v0, 1, Label
	sw $s3, ($a2) 
	Label:
	addi $a2, $a2, 4
    addi $t0, $t0, 1
    j Loop 
	
	endodFun:
	  lw $ra, ($sp)
		addi $sp, $sp, 4
	jr $ra
is_negative:

  blt $a0, $0, Negative
  bgt $a0, $0, Positive
Negative:
  li $v0, 1
  jr $ra 
Positive:
  li $v0, 0
  jr $ra   
 
 
 
 