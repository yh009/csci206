#include <stdio.h>
#include <time.h>
 
int main(void)
{
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
 
    printf ("it is now: %s\n", asctime(tm));
    int i;
    for (i = 0; i < 2345; ++i){
        add_second(&t);
    }
    return 0;
}
