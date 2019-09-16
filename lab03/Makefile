UNAME_S := $(shell uname -s)
CC=gcc
LD=gcc
CFLAGS=-ggdb -Wall -std=c99
LDFLAGS=

ifeq ($(UNAME_S), Darwin)
    MEMCHECK=valgrind --tool=memcheck --leak-check=full --track-origins=yes --dsymutil=yes --suppressions=osx_vector.supp
endif

ifeq ($(UNAME_S), Linux)
    MEMCHECK=valgrind --tool=memcheck --leak-check=full --track-origins=yes
endif

BIT_OPS_OBJS = bit_ops.o test_bit_ops.o
BIT_OPS_PROG = bit_ops

LSFR_OBJS = lsfr.o test_lsfr.o
LSFR_PROG = lsfr

VECTOR_OBJS=vector.o vector-test.o
VECTOR_PROG=vector-test

BINARIES=$(VECTOR_PROG) $(BIT_OPS_PROG) $(LSFR_PROG) 

all: $(BINARIES)

$(BIT_OPS_PROG): $(BIT_OPS_OBJS)
	$(CC) $(CFLAGS) -g -o $(BIT_OPS_PROG) $(BIT_OPS_OBJS) $(LDFLAGS)

$(LSFR_PROG): $(LSFR_OBJS)
	$(CC) $(CFLAGS) -g -o $(LSFR_PROG) $(LSFR_OBJS) $(LDFLAGS)

$(VECTOR_PROG): $(VECTOR_OBJS)
	$(LD) -g -o $(VECTOR_PROG) $(VECTOR_OBJS) $(LDFLAGS)

lsfr.c: lsfr.h
test_lsfr.c: lsfr.h

bit_ops.c: bit_ops.h
test_bit_ops.c: bit_ops.h

.c.o:
	$(CC) -c $(CFLAGS) $<

vector-memcheck: $(VECTOR_PROG)
	$(MEMCHECK) ./$(VECTOR_PROG)

clean: 
	-rm -rf core *.o *~ "#"*"#" Makefile.bak $(BINARIES) *.dSYM
        
vector.c: vector.h
vector-test.c: vector.h
