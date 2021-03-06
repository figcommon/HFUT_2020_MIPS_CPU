	.org 0x0
	.set noat
	.set noreorder			#不进行指令调度
	.set nomacro
	.global __start
__start:
	# 注意，MIPS编译时，会将rs和rt的二进制位置互换，写法上是rt,rs，指令码是opcode rs rt(写入rt)
	# 用ori指令作为开始标志
	# start code
	# ori $0, $0, 0x0000
	# 3400 0000
	# 此处开始书写代码
	.org 0x0000
	ori $0, $0, 0x0000
	
	# 真正的代码
	addi  $2 $0 1
	addiu $3 $0 2
	andi  $4 $2 2
	ori   $5 $2 2
	xori  $6 $2 2
	lui   $7 5
	j label1
	add  $8 $2 $3
	addu $9 $2 $3
	sub  $10 $2 $3
	subu $11 $2 $3

	label1:
	sll $12 $2 4
	srl $13 $7 4
	sra $14 $7 4

	slt  $22 $2 $5
	sltu $23 $2 $5

	blez $0 label2

	sllv $15 $2 $2 
	srlv $16 $7 $2
	srav $17 $7 $2

	label2:

	and $18 $2 $5
	or  $19 $2 $5
	xor $20 $2 $5
	nor $21 $2 $5
	
	# end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000