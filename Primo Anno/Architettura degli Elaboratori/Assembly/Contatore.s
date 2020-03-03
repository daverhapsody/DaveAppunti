.data
    contatore: .byte 0
    termine: .byte 10
    hello_string:  .asciiz  "Hello World!"
.text
.globl main
main:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    jal loop
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
#    -------------------------------------
exit:
    li $v0, 10
    syscall
loop:
    lb $t0, contatore
    lb $t1, termine
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    while:
      move $a1, $t0
      jal stampaInt
      jal aCapo
      addi $t0, $t0, 1
      bne $t0, $t1, while
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra
stampaString:
    li $v0, 4
    syscall
    jr $ra
stampaInt:
    li $v0, 1
    move $a0, $a1
    syscall
    jr $ra
aCapo:
    li $v0, 11
    li $a0, 10
    syscall
    jr $ra
