
// in this program, i am going to be pointing to functions in c

#include <stdio.h>

void func(int num){
    printf("the value is %d \n", num);
}

int main(){
void (*func_ptr)(int) = &func;

(*func_ptr)(280);

    return 0;
}