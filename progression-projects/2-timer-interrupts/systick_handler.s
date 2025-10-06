.syntax unified
.cpu cortex-m7
.thumb

.include "constants.s"

.p2align 2
.section .text
.global SysTick_Handler

SysTick_Handler:

	@ mrs r0, IPSR       @ get current exception number
    @ bkpt #0            @ stop in debugger so you can inspect r0	

	cpsid i
	
	@ Turn on LED and loop as a visual indicator
	
	ldr r0, =GPIOE_BASE
	mov r1, 0b0 << 1
	str r1, [r0, GPIO_ODR]
	ldr r1, =0x5000

	delay:
		sub r1, r1, #1
		cmp r1, #0
		bne delay

	bx lr
