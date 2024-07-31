

// testing and experimenting with null or void ponters
#include <stdio.h>

int main(){
    void* ptr;
    int num = 4;
    float num2 = 3.14;
    ptr = &num;
    printf("num is %d \n",*(int*)ptr);
    ptr = &num2;
    printf("num2 is %f \n",*(float*)ptr);
    return 0;
}