
// arrays and pointers
#include <stdio.h>

int main(){ 
    int arr[4];  // array
    int i; // index

    for( i =0; i<4; i++){
        printf("addressx[%d] = %p \n", i, &arr[i]);
    }
    printf("add of arr is: %p \n", arr);

    int arr2[4] = {1,2,3,4};
    int sum1 = 0;
    int sum2 = 0;
    for(int j =0; j<4; j++){
        sum1 += *(arr2 + j);  // deference the values at the respective indices
        sum2 += arr2[j];   // use the actual indices
    }
    printf("sum1 = %d \n",sum1);
    printf("sum2 = %d \n",sum2);

    int arr3[4] = {17,18,19,20};
    int *aptr;
    aptr = &arr3[2];

    printf("index 2: %d \n", *aptr);
    printf("index 1: %d \n", *(aptr-1));
    printf("index 3: %d \n", *(aptr+1));
    return 0;
}