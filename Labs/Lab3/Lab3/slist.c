/*
 * CSCI 206 Computer Organization & Programming
 * Author: L. Felipe Perrone
 * Revised by: Alan Marchiori
 * Date: 2014-01-28
 * Copyright (c) 2014 Bucknell University
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

#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "snode.h"
#include "slist.h"

struct slist *slist_create()
{
    return calloc(1, sizeof(struct slist));
}

struct slist *slist_create_persist(char* filename)
{
	int f = open(filename, O_RDONLY);
	if (f < 0){
		// failed to open file create an empty slist
		return slist_create();
	} else {
		// FINISH THIS FUNCTION TO LOAD FROM FILENAME in EXERCISE 3
	
		return NULL; // you will want to change this line
	}
}

void slist_persist(char* filename, struct slist *s)
{
	int f = open(filename, 
				 O_WRONLY | O_CREAT,
				 S_IRWXU | S_IRGRP);
	
	// write out the slist structure 
	write(f, &s->count, sizeof(s->count));
	for (struct snode *at = s->front; at != NULL; at = at->next){	
		int len = strlen(at->text) + 1;	// include null
		write(f, &len, sizeof(len));	// write length
		write(f, &at->text[0], len);	// write data
		// uncomment the next line, once you add count to your snode struct
		write(f, &at->count, sizeof(at->count)); // write count
	}

	close(f);
}

void slist_destroy(struct slist *l)
{
    struct snode *p = l->front;

    do {
#ifdef DEBUG
        printf("destroying list\n");
#endif
        l->front = l->front->next;
		free(p->text);
		free(p);
		p = l->front;
    }
    while (l->front != NULL);

    l->front = l->back = NULL;
    l->count = 0;
}

void slist_obliterate(struct slist *l)
{
    slist_destroy(l);
    free(l);
}

void slist_add_back(struct slist *l, char *str)
{
    // create a new node and store string
    struct snode *node = snode_create(str);

    node->text = malloc(strlen(str)+1);
    strcpy(node->text, str);

    if (NULL == l->front) {
	// special case for first item
		l->front = node;
		l->back = node;
#ifdef DEBUG
		printf("  added first item\n");
#endif
    } else {
		// replace back item
		l->back->next = node;
		l->back = node;

#ifdef DEBUG
		printf("  added next item\n");
#endif
    }
    // increment count either way
    l->count += 1;

#ifdef DEBUG
    // fixed bug here, counter printed ptr which doesnt exit
    printf("counter= %d\n", l->counter);
    // thest both used l->ptr->data instead of text
    printf("front= %p\n", (char *) l->front);
    printf("back= %p\n\n", (char *) l->back);
#endif				/* DEBUG */
}

void slist_traverse(struct slist *l, int c)
{
    // what does traverse do?
    struct snode *at = l->front;
    int count = 0;
#ifdef DEBUG
    printf("traversing %d items\n", l->counter);
    printf("front = %p\n", l->front);
    printf("back = %p\n", l->back);
#else
    printf("here is your list:\n");
#endif
    while (at != NULL) {
                //printf("%d: %20s\n", count++, at->text);
		// remove the previous printf and uncomment the one below
		// after you add a count to your struct snode
      if(at->count >= c){
		printf("%d: %20s ---> %5d\n", count++, at->text, at->count);
      }
		at = at->next;
    }
}


int slist_find(struct slist *l, char *str)
{
  struct snode *at = l->front;

  while (at != NULL){
    if (strcmp(str, at->text) == 0){
      return 1;
    }
    at = at->next;
  }

  return 0;
}

struct snode *slist_getnode(struct slist *l, char *str)
{
	// WRITE CODE FOR THIS FUNCTION
  struct snode *at = l->front;
  while (at !=NULL){
    if (strcmp(str, at->text) == 0){
      return at;
    }
    at = at->next;
  }
  	return NULL; // corret this line
}

uint32_t slist_num_elems(struct slist * l)
{
    return l->count;
}
