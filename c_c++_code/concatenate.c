
#include <stdio.h>
#include <stdlib.h>

int main(){
    unsigned char a, b;
    short h;
    a = 246;
    b = 3;
    h = a<<8 | b;
    
    printf("%d",h);

    return 0;
}