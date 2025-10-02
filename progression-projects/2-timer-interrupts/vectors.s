.syntax unified
.cpu cortex-m7
.thumb

.section .vectors, "ax"
.align 5
.global _vectors

@ Initial stack pointer
.equ _estack,  0x24020000

_vectors:
	.word _estack
	.word Reset_Handler + 1		
	.word 0		@ NMI
	.word 0		@ HardFault
	.word 0		@ MemManage
	.word 0		@ BusFault
	.word 0		@ UsageFault

	.word 0 	@ Reserved (0x1c)
	.word 0 	@ Reserved (0x20)
	.word 0		@ Reserved (0x24)
	.word 0		@ Reserved (0x28)

	.word 0		@ SVCall
	.word 0		@ DebugMonitor
	.word 0 	@ Reserved
	.word 0		@ PendSV
	.word SysTick_Handler + 1

	