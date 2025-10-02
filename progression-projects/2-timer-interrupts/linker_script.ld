MEMORY {
	FLASH 	(rx) : ORIGIN = 0x08000000, LENGTH = 1024K
	RAM 	(rx) : ORIGIN = 0x24000000, LENGTH = 128K
}

SECTIONS {
	.vectors ORIGIN(FLASH) : {
		KEEP(*(.vectors))
	} > FLASH
	
    .text : { 
		*(.text)
	} > FLASH
}