
// practicing different concepts to do with pointers
#include <stdio.h>

int main(){
    int val;
    int val2;
    int *pval;
     
    val = 256; 
    val2 = 27;
    pval = &val;

    printf("val: %d pval: %p \n", val, pval);
    *pval = 128; // change value at the address
    printf("dereferenced val: %d \n", *pval);
    pval = &val2;
    printf("changed pointer val: %d \n", *pval);
    return 0;
}