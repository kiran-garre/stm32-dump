.syntax unified
.cpu cortex-m7
.thumb

.section .vectors, "ax"
.align 4
.global _vectors

@ Initial stack pointer
.equ _estack,  0x24020000

_vectors:
	.word _estack
	.word Reset_Handler + 1
	.word 0
	