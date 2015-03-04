#include "snode.h"
#include "slist.h"
#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <stdlib.h>
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
	     else if (slist_find(the_slist1,song_title) == 1){
	       printf("song title %s is a dupe.\n",song_title);
	     }
	     else{
	       slist_add_back(the_slist1,song_title);
	     }
    }
  printf("\n");
  slist_traverse(the_slist1);
  free(the_slist1);

  struct slist* the_slist2 = slist_create();
  printf("Testing add_front\n");
  while (true) {
             song_title = readline(prompt_str);
             if (song_title == NULL){
	       break;
	     }
	     else if (slist_find(the_slist2,song_title) == 1){
	       printf("song title %s is a dupe.\n",song_title);
	     }
	     else{
	       slist_add_front(the_slist2,song_title);
	     }
    }
  printf("\n");
  slist_traverse(the_slist2);
  free(the_slist2);
  return 0;

}
  


