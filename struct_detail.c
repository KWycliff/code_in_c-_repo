
// dynamic memory allocation for structures
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct person_info{
    char name[20];
    int age;
    char school[20];
};

int main(){
    struct person_info* ptr;
    int i, n;

    printf("enter number of people whose details you want to enter: \n");
    scanf("%d",&n);

    ptr = (struct person_info*)malloc(n*sizeof(struct person_info));

    for(i=0; i<n; i++){
        printf("enter name age school \n");
        scanf("%s %d %s", (ptr+i)->name,&(ptr+i)->age,(ptr+i)->school);
    }

    for(i=0; i<n; i++){
        printf("name %s \nage %d \nschool %s \n",(ptr+i)->name,(ptr+i)->age,(ptr+i)->school);
    }

    free(ptr);
    return 0;
}