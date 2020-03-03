.data
nome: .word 123
.text
.globl main
main:
    la $t1, nome
    move $t2, $t1
    add $s0, $t1, $t2
    li $s0, 1
    lw $s0, nome
stampa:
    li $v0, 1
    move $a0, $s0
    syscall
exit:
    li $v0, 10
    syscall
