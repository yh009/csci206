// program to show the behavior of malloc vs sbrk
#include <stdio.h>
#include <stdlib.h>
int main()
{
    int i;

    for (i = 0; i < 32; i++){
        printf ("i = %3d: malloc = %8p, sbrk  = %8p\n", 
                i, malloc(0x5000), sbrk(0));
    }
    
}
