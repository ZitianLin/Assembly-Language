#!/bin/bash

# Author: Zitian Lin
# Date: 11/06/19

rm *.o
rm *.out
rm *.lis

echo "Compile C file."
gcc -c -m64 -std=gnu11 -Wall -fno-pie -no-pie -o main.o main.c
gcc -c -m64 -std=gnu11 -Wall -fno-pie -no-pie -o display.o display.c

echo "Compile C++ file."
g++ -c -m64 -std=c++14 -Wall -fno-pie -no-pie -o fill.o fill.cpp

echo "Compile asm file."
nasm -f elf64 -l control.lis -o control.o control.asm
nasm -f elf64 -l sum.lis -o sum.o sum.asm

echo "Link main.c and control.asm."
g++ -Wall -m64 -std=c++14 -fno-pie -no-pie -o main.out main.o control.o sum.o display.o fill.o

echo "Run the program."
./main.out


