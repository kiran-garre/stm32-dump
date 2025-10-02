.syntax unified
.cpu cortex-m7
.thumb
.thumb_func

.include "constants.s"

.align 2
.section .text
.global flash

flash:

	ldr r0, =GPIOE_BASE
	ldr r1, [r0, GPIO_ODR]
	eor r1, r1, 0b1 << 1
	mov r1, 2
	str r1, [r0, GPIO_ODR]
	ldr r1, =0x50000

delay:
	sub r1, r1, 1
	cmp r1, 0
	bne delay
	b flash
