.syntax unified
.cpu cortex-m7
.thumb

.equ RCC_BASE,				0x58024400
.equ RCC_AHB4ENR,			0xe0
.equ RCC_AHB4ENR_GPIOEEN,	1 << 4

.equ GPIOE_BASE, 	0x58021000
.equ GPIO_MODER,	0x00
.equ GPIO_OTYPER,	0x04
.equ GPIO_PUPD,		0x0c
.equ GPIO_ODR,		0x14

.section .text
.global Reset_Handler

Reset_Handler: 

	@ Enable GPIOE through clock
	ldr r0, =RCC_BASE
	ldr r1, [r0, #RCC_AHB4ENR]
	orr r1, r1, RCC_AHB4ENR_GPIOEEN
	str r1, [r0, #RCC_AHB4ENR]

	@ Set output mode, output type, push pull for GPIOE
	ldr r0, =GPIOE_BASE
	
	ldr r1, [r0, #GPIO_MODER]
	bic r1, r1, 0b11 << 2
	orr r1, r1, 0b01 << 2
	str r1, [r0, #GPIO_MODER]

	ldr r1, [r0, #GPIO_OTYPER]
	bic r1, r1, 0b1 << 1
	str r1, [r0, #GPIO_OTYPER]

	ldr r1, [r0, #GPIO_PUPD]
	bic r1, r1, 0b11 << 2
	str r1, [r0, #GPIO_PUPD]

	mov r1, #0
	str r1, [r0, #GPIO_ODR]

blink:
	ldr r1, [r0, #GPIO_ODR]
	eor r1, r1, 0b1 << 1
	str r1, [r0, #GPIO_ODR]
	ldr r1, =0x500000

delay:
	sub r1, r1, #1
	cmp r1, #0
	bne delay
	b blink
