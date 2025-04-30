
// trying out stuff with strings
// a string is a squeance of characters terminated with a null character \0
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// stings and fuctions
void disp_str(char x_strg[]);
    
int main(){
    char strg[] = "a,b,c,d";
    printf("string is: %s \n",strg);

    char name[20];
    printf("enter your name: \n");
    fgets(name, sizeof(name),stdin);
    for(int i=0; i<strlen(name);i++){
        printf("%c",*(name+i));
    }
    disp_str(name);
    return 0;
}

// stings and fuctions
void disp_str(char x_strg[]){
    printf("your name is: ");
    puts(x_strg);
}