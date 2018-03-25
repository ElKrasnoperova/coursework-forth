# ------------------------------------------------
# Forthress, a Forth dialect 
#
# Author: igorjirkov@gmail.com
# Date  : 15-10-2016
#
# ------------------------------------------------

ASM			= nasm
FLAGS		= -felf64 -g -Isrc/ 
LINKER 		= ld

all: bin/forthress
	
bin/forthress: obj/forthress.o obj/util.o
	mkdir -p bin 
	ld -o bin/forthress obj/forthress.o obj/util.o

obj/test.o: src/test.asm 
	mkdir -p obj
	$(ASM) $(FLAGS) test.asm -o obj/test.o
obj/util.o: src/util.inc src/util.asm
	mkdir -p obj
	$(ASM) $(FLAGS) src/util.asm -o obj/util.o
clean: 
	rm -rf build obj

.PHONY: clean
