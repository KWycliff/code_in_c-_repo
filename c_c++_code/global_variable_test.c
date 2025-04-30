// in this progam, i am testing global variables 
#include <stdio.h>
int glob_x;
int func1(void);
int func2(void);
int main(){
func1();
printf("%d \n",glob_x);
func2();
printf("%d \n",glob_x);
    return 0;
}

int func1(void){
int x = 5;
int y = 4;
glob_x = x+y;
return glob_x;
};

int func2(void){
int x = 8;
int y = 9;
glob_x = x+y;
return glob_x;
};
