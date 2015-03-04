//Yuxuan Huang
//Lab4
#include <stdio.h>
#include <stdlib.h>

int unused = 0xDEADBEEF;
int x = 89;

int main(int argc, char *argv[]) {

  int t0=0+0;
  int t1=0+0;
  int *t2;

  for (t0=0;t0<=10;t0++){
    t1=t1+t0;
  }

  t2 = &x;
  *t2=t1;

  return 0;
}

