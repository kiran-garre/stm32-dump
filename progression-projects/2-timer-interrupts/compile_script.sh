#! /usr/bin/bash
set -e

arm-none-eabi-as -mcpu=cortex-m7 -mthumb -g main.s -o main.o
arm-none-eabi-as -mcpu=cortex-m7 -mthumb -g copy_data.s -o copy_data.o
arm-none-eabi-as -mcpu=cortex-m7 -mthumb -g vectors.s -o vectors.o
arm-none-eabi-as -mcpu=cortex-m7 -mthumb -g systick_handler.s -o systick_handler.o
arm-none-eabi-as -mcpu=cortex-m7 -mthumb -g flash.s -o flash.o

arm-none-eabi-ld -T linker_script.ld main.o copy_data.o vectors.o systick_handler.o flash.o -o main.elf

arm-none-eabi-objcopy -O binary main.elf main.bin

rm *.o
