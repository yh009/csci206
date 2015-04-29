#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <stdlib.h>
#include "snode.h"
#include "slist.h"
#include <string.h>



int main(int argc, char *argv[]) {
  char *prompt_str = "enter song title:";
  char *song_title;
  struct slist *the_slist1 = slist_create();
  printf("Testing add_back\n");
  while (true) {
             song_title = readline(prompt_str);
	     if (song_title == NULL){
	       break;
	     }
	     else{
	       slist_add_back(the_slist1,song_title);
	     }
    }
  printf("\n");
  slist_traverse(the_slist1);

  struct slist* the_slist2 = slist_create();
  printf("Testing add_front\n");
  while (true) {
             song_title = readline(prompt_str);
             if (song_title == NULL){
	       break;
	     }
	     else{
	       slist_add_front(the_slist2,song_title);
	     }
    }
  printf("\n");
  slist_traverse(the_slist2);
  return 0;

}

