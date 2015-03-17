#include <stdio.h>

#define MAX 10020

int is_prime(int n)
{
   // return 1 if n is prime, 0 otherwise
    int m;
    
    for (m = 2; m < n; m++){
      if ((n % m) == 0){
	     return 0;
      }
    }

    return 1;
}

int main (void)
{
    int i, n = 0;

    for (i = 2; n < MAX; i++){
        if (is_prime(i)){
            if ((n % 10) == 0){
                printf("\n");
            }
            printf("%7d", i);
            n++;
        }
    }
    printf("\n");
    return 0;
}

// Run time no assembly :
//   real    0m34.636s
//   user    0m17.333s
//   sys     0m0.380s

// Run time using assembly:
//   real    0m11.224s
//   user    0m7.596s
//   sys     0m0.168s

// Assembly code is faster, because assembly is a lower level code
// and the mips machine needs less convertion to perform.

