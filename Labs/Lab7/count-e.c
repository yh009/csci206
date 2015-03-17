//Yuxuan Huang
//Lab7

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    printf("Enter a string: ");
    char *str = malloc(sizeof(char)*100);
    scanf("%s",str);
    int count = counte(str);
    printf("There are %d e's\n",count);
    return 0;
}