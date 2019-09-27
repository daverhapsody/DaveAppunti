# Stampare tutti i valori compresi tra 1 e 100 :3
.data
    array: .word 2, 3, 5, 89, 34 # 00000002 00000003 00000005
    byte: .byte 0x43, 0x69, 0x61, 0x6f, 0x0
    spazio: .space 3
    string: .asciiz "Ciao\n"
    contatore: .byte 1
.text
.globl main
main:
#    -------------------------------------
stampa:
    li $v0, 1    # system call #1 - print int
    la $a0, contatore
    syscall
    li  $t1, contatore    # t1 = contatore
    addi $t1, 1
    slt $t1, 100, stampa
#    -------------------------------------
exit:
    li $v0, 10
    syscall
#    la    $t1, array #T1 punta ad array
#    lw    $t2, 0($t1)
#    lw    $t3, 16($t1)
#    add   $t4, $t2, $t3
#    la    $s0, result
#    sw    $t4, 2($s0)
#    li    $v0, 4         ori  $v0, $zero, 4
#    la    $a0, string
#    syscall
#    li    $v0, 4
#    la    $a0, byte
#    syscall
#    li    $v0, 10
#    syscall
#    li    $a0, 3
#    li    $a1, 5
#    -------------------------------------
#    COME FARE PER CHIAMARE UNA PROCEDURA
#    addi  $sp, $sp, -4
#    sw    $ra, 0($sp)
#    jal   sum
#    lw    $ra, 0($sp)
#    addi  $sp, $sp, 4
#    -------------------------------------
#    move  $a0, $v0
#    sum:
#    add   $v0, $a0, $a1
#    jr    $ra
