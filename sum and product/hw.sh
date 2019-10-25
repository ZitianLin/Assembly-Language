#!/bin/bash

# Name: Zitian Lin
# 10/23/2019

rm *.o
rm *.out

echo "Compile Cpp file"
g++ -c -m64 -Wall -std=c++14 -fno-pie -no-pie -o arith.o arithmetic.cpp

echo "Compile asm file"
nasm -f elf64 -l arithmetic.lis -o arithmetic.o arithmetic.asm

echo "Connect cpp and asm file"
g++ -Wall -m64 -std=c++14 -fno-pie -no-pie -o arith.out arithmetic.o arith.o

echo "Run the program."
./arith.out



