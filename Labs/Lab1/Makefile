EXECS = snode-test
OBJ = bin
CFLAGS = -Wall

all: $(OBJ) $(EXECS) 

$(OBJ):
	mkdir -p $(OBJ)

$(OBJ)/snode.o: snode.h snode.c
	$(CC) $(CFLAGS) -c snode.c -o $(OBJ)/snode.o

snode-test: snode-test.c $(OBJ)/snode.o
	$(CC) $(CFLAGS) $(OBJ)/snode.o snode-test.c -o snode-test

clean:
	rm -rf $(EXECS) $(OBJ)/*


