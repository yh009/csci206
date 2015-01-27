//Yuxuan Huang
#include <stdio.h>
#include <stdlib.h>

struct snode{
             char str[101];
             int length;
             struct snode *next;
};
struct snode *snode_create(char *s, int length);


