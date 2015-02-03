/*
 * CSCI 206 Computer Organization & Programming
 * Author: L. Felipe Perrone
 * Date: 2015-01-26
 * Copyright (c) 2011 Bucknell University
 *
 * Permission is hereby granted, free of charge, to any individual or
 * institution obtaining a copy of this software and associated
 * on files (the "Software"), to use, copy, modify, and
 * distribute without restriction, provided that this copyright and
 * permission notice is maintained, intact, in all copies and supporting
 * documentation.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "snode.h"
#include "slist.h"

struct slist *
slist_create() {
	return calloc(1, sizeof(struct slist));
}

void 
slist_destroy(struct slist *l) {
	struct snode *p = l->front;

	do {
		l->front = l->front->next;
		free(p->str);
		free(p);
		p = l->front;
	}
	while (l->front != NULL);

	l->front = l->back = NULL;
	l->counter = 0;
}

void 
slist_obliterate(struct slist *l) {
	slist_destroy(l);
	free(l);
}

void 
slist_add_back(struct slist *l, char *str) {
	// WRITE THE CODE FOR THIS FUNCTION
        struct snode *p = malloc(sizeof(struct snode));
	p = snode_create(str);
	if (l->counter==0)
	  {l->front=l->back=p;
           l->counter++;
	  }
	else
	  {l->back->next=p;
	    l->back = p;
	    l->counter++;
	  }

}

void 
slist_add_front(struct slist *l, char *str) {
	// WRITE THE CODE FOR THIS FUNCTION
        struct snode *p = malloc(sizeof(struct snode));
	p = snode_create(str);
        if (l->counter==0)
	  {l->front=l->back=p;
	    l->counter++;
	  }
	else
	  {p->next=l->front;
	   l->front=p;
	   l->counter++;
	  }

}

void 
slist_traverse(struct slist *l) {
	// WRITE CODE FOR THIS FUNCTION
        int temp_counter = 1;
	struct snode *temp_str = l->front;
	do{
	  printf("node %d:%s - length:%d\n",temp_counter,temp_str->str,temp_str->length);
	  temp_str = temp_str->next;
	  temp_counter++;
	}while (temp_counter <= l->counter);
}

int 
slist_find(struct slist *l, char *str) {
	// WRITE CODE FOR THIS FUNCTION
	int temp_counter2 = 1;
	struct snode *temp_str2 = l->front;
	while (temp_str2 != NULL){
	  if (strcmp(temp_str2->str,str) == 0){
	    return 1;
	  }
	  temp_str2 = temp_str2->next;
	  temp_counter2++;
	}
  return 0;
}

uint32_t 
slist_num_elems(struct slist * l) {
	return l->counter;
}
