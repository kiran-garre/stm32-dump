@ This file defines some useful constants used across files

.equ RCC_BASE,				0x58024400
.equ RCC_AHB4ENR,			0xe0
.equ RCC_AHB4ENR_GPIOEEN,	1 << 4

.equ GPIOE_BASE, 	0x58021000
.equ GPIO_MODER,	0x00
.equ GPIO_OTYPER,	0x04
.equ GPIO_PUPD,		0x0c
.equ GPIO_ODR,		0x14

.equ SYST_CSR,		0xe000e010
.equ SYST_RVR,		0xe000e014
.equ SYST_CVR, 		0xe000e018
