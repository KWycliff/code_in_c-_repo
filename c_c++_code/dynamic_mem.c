
// in this program, i am practising dynamic memory allocation techniques
// example: get the average of any numbers n
#include <stdio.h>
#include <stdlib.h>

int main(){
int num, *ptr;
int sum =0;
float average = 0;

ptr =(int*)calloc(num,sizeof(int));

// exit if ptr is null
if(ptr==NULL){
    printf("error: memory not allocated \n");
    exit(0);
}

printf("enter number of elements: \n");
scanf("%d",&num);

printf("enter the numbers: \n");

for(int i=0; i<num; i++){
    scanf("%d",ptr+i);
    sum += *(ptr+i);
}
average = ((float)sum)/((float)num);

printf("average is: %f ",average);

free(ptr);
    return 0;
}