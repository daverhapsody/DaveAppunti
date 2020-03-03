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
test:
    lw    $t0, contatore
loop:
    li    $v0, 1
    move  $a0, $t0
    syscall
#    -------------------------------------
    li    $v0, 11
    li    $a0, 9
    syscall
#    -------------------------------------
    addi   $t0, $t0, 1
    blt   $t0, 101, loop # Branch (Loop) if $t0 is less than 101
exit:
    li $v0, 10
    syscall
# 000000 01010 01011 01001 00000 100000
# 0000 0001 0100 1011 0100 1000 0010 0000
# 0x014B4820
# 3,25
# 11,01
# 1,101 * 2^(1)
# 0 10000000 10100000000000000000000
