.syntax unified
.cpu cortex-m7
.thumb

.include "constants.s"

.p2align 2

.section .text
.global Reset_Handler

Reset_Handler: 

bl copy_data

enable_led:

	@ Enable GPIOE through clock
	ldr r0, =RCC_BASE
	ldr r1, [r0, RCC_AHB4ENR]
	orr r1, r1, RCC_AHB4ENR_GPIOEEN
	str r1, [r0, RCC_AHB4ENR]

	@ Set output mode, output type, push pull for GPIOE
	ldr r0, =GPIOE_BASE
	
	ldr r1, [r0, GPIO_MODER]
	bic r1, r1, 0b11 << 2
	orr r1, r1, 0b01 << 2
	str r1, [r0, GPIO_MODER]

	ldr r1, [r0, GPIO_OTYPER]
	bic r1, r1, 0b1 << 1
	str r1, [r0, GPIO_OTYPER]

	ldr r1, [r0, GPIO_PUPD]
	bic r1, r1, 0b11 << 2
	str r1, [r0, GPIO_PUPD]

enable_systick:

	@ @ Bit 0: enables counter
	@ @ Bit 1: enables SysTick exceptions
	@ @ Bit 2: sets clock source to processor clock
	@ ldr r0, =SYST_CSR
	@ ldr r1, [r0]
	@ orr r1, r1, 0b111
	@ str r1, [r0]

	@ @ Interrupt occurs every 10ms
	@ ldr r0, =SYST_RVR
	@ ldr r1, =0x5F423
	@ str r1, [r0]

	@ @ Write to CVR to clear timer
	@ ldr r0, =SYST_CVR
	@ mov r1, 0
	@ str r1, [r0]

enable_interrupts:
	cpsie i

b flash

