MEMORY {
	FLASH 	(rx) : ORIGIN = 0x08000000, LENGTH = 1024K
	RAM 	(rwx) : ORIGIN = 0x24000000, LENGTH = 128K
}

SECTIONS {
	.vectors ORIGIN(FLASH) : {
		KEEP(*(.vectors))
	} > FLASH
	
    .text : { 
		*(.text)
	} > FLASH

	.data : {
		_sdata = .;
		*(.data)
		_edata = .;
	} > RAM AT > FLASH

	_sidata = LOADADDR(.data);
	_estack = ORIGIN(RAM) + LENGTH(RAM);
}