#!/bin/bash

# Author: Zitian Lin
# 10/24/19

rm *.o
rm *.out
rm *.lis

echo "Compile C file."
gcc -c -m64 -std=gnu11 -Wall -fno-pie -no-pie -o div.o division.c

echo "Compile asm file."
nasm -f elf64 -l div.lis -o divasm.o division.asm

echo "Link c and asm file."
gcc -Wall -m64 -std=gnu11 -fno-pie -no-pie -o div.out divasm.o div.o

echo "Run the program."
./div.out

