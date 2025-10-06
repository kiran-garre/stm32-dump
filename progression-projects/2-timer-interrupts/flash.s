.syntax unified
.cpu cortex-m7
.thumb
.thumb_func

.include "constants.s"

.p2align 2
.section .text
.global flash

flash:
	ldr r0, =GPIOE_BASE
	cmp r1, 1 << 1	@ pin is already set
	beq clear_pin

set_pin: 
	mov r1, 1 << 1
	str r1, [r0, GPIO_BSRR]
	b begin_delay

clear_pin:
	mov r1, (1 << (1 + 16))
	str r1, [r0, GPIO_BSRR]

begin_delay:
	ldr r2, =1000000

delay:
	sub r2, r2, 1
	cmp r2, 0
	bne delay
	b flash
