#!/bin/bash

# Name: Zitian Lin
# 10/29/19

rm *.o
rm *.out
rm *.lis

echo "Compile C file."
g++ -c -m64 -std=c++14 -Wall -fno-pie -no-pie -o stat.o statNum.cpp

echo "Compile asm file."
nasm -f elf64 -l stat.lis -o statasm.o statNum.asm

echo "Link c and asm file."
g++ -Wall -m64 -std=c++14 -fno-pie -no-pie -o stat.out statasm.o stat.o

echo "Run the program."
./stat.out

