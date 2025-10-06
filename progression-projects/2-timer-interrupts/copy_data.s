.syntax unified
.cpu cortex-m7
.thumb
.thumb_func

.include "constants.s"

.p2align 2
.section .text
.global copy_data

copy_data:
	ldr r0, =_sidata
	ldr r1, =_sdata
	ldr r2, =_edata

loop:
	cmp r1, r2
	bge done
	ldr r3, [r0]
	str r3, [r1]
	add r0, r0, 4
	add r1, r1, 4
	b loop
	
done:
	bx lr


