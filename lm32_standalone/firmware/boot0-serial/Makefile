LM32_CC=lm32-rtems4.11-gcc
LM32_LD=lm32-rtems4.11-ld
LM32_OBJCOPY=lm32-rtems4.11-objcopy
LM32_OBJDUMP=lm32-rtems4.11-objdump

SREC2VRAM ?= ../../tools/srec2vram/srec2vram
VRAMFILE=image.ram

CFLAGS=-MMD -O2 -Wall -g -s -fomit-frame-pointer -mbarrel-shift-enabled   -mmultiply-enabled -mdivide-enabled -msign-extend-enabled
LDFLAGS=-nostdlib -nodefaultlibs -Tlinker.ld 
SEGMENTS = -j .text -j .rodata -j .data

all: image.srec $(VRAMFILE) 

crt0ram.o: crt0ram.S
	$(LM32_CC) $(CFLAGS) -c crt0ram.S

main.o: main.c
	$(LM32_CC) $(CFLAGS) -c main.c

soc-hw.o: soc-hw.c
	$(LM32_CC) $(CFLAGS) -c soc-hw.c

image: crt0ram.o main.o soc-hw.o
	$(LM32_LD) $(LDFLAGS) -Map image.map -N -o image crt0ram.o main.o soc-hw.o

image.lst: image
	$(LM32_OBJDUMP) -h -S $< > $@

image.bin: image
	$(LM32_OBJCOPY) $(SEGMENTS) -O srec image image.bin
	$(LM32_OBJCOPY) $(SEGMENTS) -O binary image image_bin.bin

image.srec: image image.lst
	$(LM32_OBJCOPY) $(SEGMENTS) -O srec image image.srec

$(VHDLFILE): image.srec
	$(SREC2VHDL) image.srec > $(VHDLFILE)

$(VRAMFILE): image.srec
	$(SREC2VRAM) image.srec 0x00860000 0x10000 > $(VRAMFILE)

clean:
	rm -f image image.lst image.bin image.srec image.map  *.o *.d

bios:
	cp /home/cain/Embedded/lm32/m-labs/milkymist/software/bios/bios.elf .
	lm32-rtems4.11-objcopy -j .text -j .rodata -j .data -O srec bios.elf bios.srec
	lm32-rtems4.11-objcopy -j .text -j .rodata -j .data -O binary bios.elf bios.bin
	$(SREC2VRAM) bios.srec 0x00860000 0x10000 > bios.image


DEPS := $(wildcard *.d)
ifneq ($(DEPS),)
include $(DEPS)
endif

