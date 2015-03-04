# Makefile for CSCI 206 Computer Organization & Programming, Lab 1 
# Author: L. Felipe Perrone
# Date: 2015-01-26
#
# Copyright (c) 2015 Bucknell University
#
# Permission is hereby granted, free of charge, to any individual or
# institution obtaining a copy of this software and associated
# documentation files (the "Software"), to use, copy, modify, and
# distribute without restriction, provided that this copyright and
# permission notice is maintained, intact, in all copies and supporting
# documentation.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY CLAIM, DAMAGES
# OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

CC = gcc
override CFLAGS += -std=gnu99 -Wall -g 

EXECS = music1 music2 sorted

all: $(EXECS) 

doc:
	doxygen

snode.o: snode.h snode.c
	$(CC) $(CFLAGS) -c snode.c -o snode.o

slist.o: slist.h slist.c snode.o
	$(CC) $(CFLAGS) -c slist.c -o slist.o

music1: music1.c snode.o slist.o
	$(CC) $(CFLAGS) snode.o slist.o music1.c -o music1 -lreadline

music2: music2.c snode.o slist.o
	$(CC) $(CFLAGS) snode.o slist.o music2.c -o music2

sorted: sorted.c snode.o slist.o
	$(CC) $(CFLAGS) snode.o slist.o sorted.c -o sorted

.PHONY: clean
clean:
	/bin/rm -rf $(EXECS) *.o

