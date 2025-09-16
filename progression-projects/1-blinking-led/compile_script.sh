set -e

arm-none-eabi-as -mcpu=cortex-m7 -mthumb main.s -o main.o
arm-none-eabi-as -mcpu=cortex-m7 -mthumb vectors.s -o vectors.o
arm-none-eabi-ld -T linker_script.ld main.o vectors.o -o main.elf

arm-none-eabi-objcopy -O binary main.elf main.bin

rm *.o
rm *.elf
