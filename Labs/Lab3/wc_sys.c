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
#include <ctype.h>

int main(int argc, char *argv[]){
        int filename = open(argv[1],O_RDONLY);
	char buf;
	int inword = 1;
        int word_count = 0;

	while (read(filename, &buf, 1)){	  if (isspace(buf)!=0 && inword==1){
	    inword = 0;
	    word_count++;
	    }
	  else if (isspace(buf)==0 && inword==0){
	    inword = 1;
	    }
	}
	close(filename);
	printf("%d\n",word_count);
	return 0;
}




