
// passing pointers as arguments to functions
#include <stdio.h>

void swap_num(int *a, int *b);
int main(){
    int x = 3;
    int y = 4;
    swap_num(&x,&y);
    printf("swapped is %d  %d \n", x, y);
    return 0;
}
void swap_num(int *a, int *b){
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
};
