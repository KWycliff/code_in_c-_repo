
// in this program, am going to be going crazy with structures
#include <stdio.h>
#include <string.h>

typedef struct person_info{
    char name[20];
    int age;
    int paddress;
}people;

int main(){
    struct person_info *ptr;
    people person1, person2;
    ptr=&person2;
    ptr->age = 34;
    ptr->paddress = 254;
    strcpy(ptr->name,"ykee check");
    // enter person1 name
    ptr=&person1;
    strcpy(ptr->name, "Kaweesa Wycliff");
    ptr->age = 24;
    ptr->paddress = 256;
    

    printf("person1 name is: %s\n", person1.name);

    return 0;
}