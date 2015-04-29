//Yuxuan Huang
//csci206 Lab3

#include <stdio.h>
#include <stdlib.h>
#include <string.h>



int main(int argc, char *argv[]){
  FILE * fp;
  fp = fopen(argv[1], "r");
  char str[100];
  int word_count = 0;


  while (fscanf(fp,"%s",str)==1){
    word_count++;
  }
  fclose(fp);
  printf("%d\n",word_count);
  return 0;
}

