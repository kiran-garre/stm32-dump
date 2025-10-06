.syntax unified
.cpu cortex-m7
.thumb

.include "constants.s"

.p2align 2
.section .text
.global SysTick_Handler

SysTick_Handler:
	
	@ Turn on LED and loop as a visual indicator
	ldr r0, =GPIOE_BASE
	mov r1, 1 << 1
	str r1, [r0, GPIO_BSRR]
	ldr r1, =0x5000

delay:
	sub r1, r1, #1
	cmp r1, #0
	bne delay

	bx lr
