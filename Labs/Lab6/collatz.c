#include <stdio.h>
#define MAX_ITEMS 100

int collatz(int n)
{
    if (n == 1){
        return 1;
    }
    else if (n % 2){
        return 3 * n + 1;
    }
    else{
        return n / 2;
    }
}

int find_length(int n)
{
    if (n == 1){
        return 1;
    }
    else {
        return 1 + find_length(collatz(n));
    }
}

int main(void)
{
    int i;

    for (i=1; i<MAX_ITEMS; i++){
        printf ("%d ==> %d\n", i, find_length(i));
    }

    return 0;
}
