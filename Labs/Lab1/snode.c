//Yuxuan Huang
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "snode.h"
struct snode *snode_create(char* ps, int lenS){
            struct snode *new_snode;
            new_snode = malloc(sizeof(struct snode));
            strcpy(new_snode->str,ps);
            new_snode -> length = lenS;
            new_snode -> next = NULL;
            return new_snode;
}


