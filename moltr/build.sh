#!/bin/sh

#export CC=/usr/local/opt/llvm/bin/clang++
#export CC=/usr/bin/g++
export CC=/usr/bin/clang++-13

if [ -f "$CC" ]; then
	"$CC" -c -fPIC argsort.cpp
	ar rcs libargsort.a argsort.o
	rm argsort.o
	python3 setup.py build_ext --inplace
	rm lambdaobj.c libargsort.a
	rm -rf build
else
	echo "LLVM is required (please run 'brew install llvm')."
fi
