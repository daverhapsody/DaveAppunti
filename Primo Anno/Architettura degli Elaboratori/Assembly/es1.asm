.data
	.globl	main
	.text
main:
	# mettere le istruzioni per caricare i valori
	# 10 5 20 e 100 rispettivamente nei registri
	# $s0 $s1 $s2 $s3
	li $s0, 10
	li $s1, 5
	li $s2, 20
	li $s3, 100

	add $t0, $s0, $s1 # t0 = 15
	add $t1, $s2, $s3 # t1 = 120
	add $t2, $t1, $t0 # t2 = 135
  move $t3, $t2
	# Cosa c'e' nel registro $t2? 135
	# finisce il programma (syscall exit)
	li	$v0, 10
	syscall
