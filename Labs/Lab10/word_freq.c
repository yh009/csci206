/*
 * CSCI 206 Computer Organization & Programming
 * Author: Alan Marchiori
 * Date: 2013-03-21
 * Copyright (c) 2013 Bucknell University
 *
 * Permission is hereby granted, free of charge, to any individual or
 * institution obtaining a copy of this software and associated
 * documentation files (the "Software"), to use, copy, modify, and
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
#include <ctype.h> // for tolower
#include <stdint.h> // for uint32_t
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FALSE 0
#define TRUE 1
/**
 * Node in a singly-linked list.
 */
struct snode {
	struct snode *next; // next node (or null)
	char *text;         // pointer to string
	int count;          // count for this node
};

/**
 * Singly-linked list.
 */
struct slist {
	struct snode *front; // front node
	struct snode *back;  // back node
	uint32_t counter;    // number of nodes
};


struct slist *slist_create()
{
    return calloc(1, sizeof(struct slist));
}

struct snode *snode_create() 
{
	return calloc(1, sizeof(struct snode));
}

void slist_add_back(struct slist *l, char *str)
{
    // create a new node and store string
    struct snode *node = snode_create();
    node->text = str;

    if (NULL == l->front) {
	    // special case for first item
		l->front = node;
		l->back = node;
    } else {
		// replace back item
		l->back->next = node;
		l->back = node;
    }
    // increment count either way
    l->counter += 1;
}

struct snode *slist_getnode(struct slist *l, char *str)
{
  struct snode *at = l->front;

  while (at != NULL){
    if (strcmp(str, at->text) == 0){
      return at;
    }
    at = at->next;
  }

  return NULL;
}

void str_make_lower(char *s)
{
	while(*s != '\0'){
		*s = tolower(*s);
		s++;
	}
}

int main(int argc, char* argv[])
{
    FILE *f;
    int count = 0;
    int number;         // threshold for printing results
    char buffer[80];
    struct slist *list = slist_create();

    // check for sufficient arguments
    if (argc <= 2) {
        printf("Please give a filename and count on the command line.\n");
        printf("Usage: %s <input file> ##\n", argv[0]);
        printf("  where ## is an integer\n");

        return EXIT_FAILURE;
    }
    
    // process command line arguments
    f = fopen(argv[1], "r");    // open the input file
    number = atoi(argv[2]);     // convert string of number to an int

    if (NULL == f) {
        printf("Could not open %s.\n", argv[1]);
        return EXIT_FAILURE;
    }

    // read the input file one word at a time
    while (fscanf(f, "%s", buffer) != EOF){       
		str_make_lower(buffer);
		struct snode *s = slist_getnode(list, buffer);

        if (NULL == s){
			// make a copy of the string
			char *tmp = strdup(buffer);

            slist_add_back(list, tmp);
            slist_getnode(list, tmp)->count = 1;
        } else {
            s->count++;
        }
        count++;
    }

    fclose(f);

    // print only the nodes with count > our threshold
    struct snode *at = list->front;
    count = 0;
    while (at != NULL) {
        if (at->count > number){
        	printf("%d: '%s' ---> %5d\n", count++, at->text, at->count);
        }
        at = at->next;        
    }

    // this program does not free any memory.

	return EXIT_SUCCESS;
}
