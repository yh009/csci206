//Yuxuan Huang
//Lab3
//1pm

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
	FILE *file;
	file = fopen(argv[1], "r");
	char *buf;
	buf = malloc(sizeof(char) * 5000);
	int a;
	for (a = 0; a < 10; ++a){
		fgets(buf, 5000, file);
		printf("%s", buf);
	}
	return 0;
}
