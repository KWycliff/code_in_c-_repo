
#include <stdlib.h>
#include <stdio.h>
#include "mult_by_header.h"


int main(){
    int a;
    int b;
    printf("enter two numbers for a product: \n");
    scanf("%d", &a);
    scanf("%d", &b);
    int product = mult_div(a,b);
    printf("the product is: %d",product);

    return 0;

}
