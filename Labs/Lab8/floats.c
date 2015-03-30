/*
 * CSCI 206 Computer Organization & Programming
 * Author: Alan Marchiori
 * Date: 2014-03-01
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

#include <stdio.h>

/* Forward declaration for our assembly functions
 * so gcc knows the return type (the return type defaults
 * to int so, it would look in the $v0 register w/o this).
 * Knowning the return type is a float/double gcc will
 * look in the $f0 (float) or $f0-$f1 (double) registers.
 */
float one_half_single(void);
double one_half_double(void);
void inspect_float(float f);
void inspect_double(double d);
unsigned int f2u(float f);
unsigned long long d2u(double d);
float u2f(unsigned int u);
double u2d(unsigned long long u);
void precision();

int main()
{ 
    printf ("0.5 (single) = %f\n", u2f(f2u(one_half_single())));
    inspect_float(one_half_single());
    printf ("0.5 (double) = %lf\n", u2d(d2u(one_half_double())));
    inspect_double(one_half_double());
    precision();
            
}

void inspect_float(float f){
    unsigned int flo = f2u(f);
    unsigned int sign = flo >> 31;
    unsigned int exponent = ((flo << 1) >> 24) & 0xFF;
    unsigned int fraction = flo & 0x7FFFFF;
    printf("sign = %1d, exponent = 0x%02x, fraction = 0x%06x\n", sign,
        exponent, fraction);
}

void inspect_double(double d){
    unsigned long long k = d2u(d);
    unsigned int sign = (k >> 63) & 0x1;
    unsigned int exponent = ((k << 1) >> 53) & 0x7FF;
    unsigned long long fraction = k & 0x1FFFFFFFFFFFFF;
    printf("sign = %1d, exponent = 0x%03x, fraction = 0x%013x\n", sign,
        exponent, fraction);
}

void precision (){
    float f = 1.0;
    float f1 = u2f(f2u(f) +1);
    printf("The next floating number is :\n");
    inspect_float(f1);
    printf("The precision is: %.20f\n",f1-f);
    //The precision is: 0.00000011920928955078
    f = 20.345;
    f1 = u2f(f2u(f)+1);
    printf("The precision is: %.20f\n",f1-f);
    //The precision is: 0.00000190734863281250
    //The precision depends on the real value of the number. 
    //The larger the number, the less precision it gets.
}


