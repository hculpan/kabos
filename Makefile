# $@ = target file
# $< = first dependency
# $^ = all dependencies

# First rule is the one executed when no parameters are fed to the Makefile
all: run

# Notice how dependencies are built as needed
kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel_entry.o: src/kernel_entry.asm
	nasm $< -f elf -o $@

kernel.o: src/kernel.c
	i386-elf-gcc -ffreestanding -c $< -o $@

# Rule to disassemble the kernel - may be useful to debug
kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

bootsect.bin: src/bootsect.asm
	nasm $< -f bin -o $@

os-image.bin: bootsect.bin kernel.bin
	cat $^ > os-image.bin

run: os-image.bin
	qemu-system-i386 -fda $<

clean:
	rm *.bin *.o *.dis
