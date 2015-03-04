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
        int filename = open(argv[1],O_RDONLY);
	char buf[50];
	Bool inword = true;
	int line_count = 0;
	int word_count = 0;
	int char_count = 0;


	while (true){
	  temp = read(filename, &buf, 50);
	  for i in temp


