//Yuxuan Huang
//Lab3
//1pm

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char *argv[]){
	int dest = open(argv[1], O_RDONLY);
	char buf[11];
	int num;
	num = read(dest, &buf, 10);
	buf[10] = '\0';
	printf("%s\n", buf);
	close(dest);
	return 0;
}
