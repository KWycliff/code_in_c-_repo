
//calculate standard deviation of ten numbers

#include <stdio.h>
#include <math.h>

int squared(int num){
    return num*num;
}

int main(){
    int num_v = 10;
    int arr[num_v];
    int sum = 0;
    float mean = 0;
    float sq_val = 0;
    float sq_sum = 0;
    float n = 10;
    float accum = 0;
    float variance = 0;
    float std_div = 0;
    printf("enter 10 numbers to find there standard deviation \n");
    
    for(int i =0; i<num_v; i++){
        scanf("%d",&arr[i]);
    }

    for(int j=0; j<num_v; j++){
        sum += *(arr+j);
    }

    mean = ((float)sum)/n;

    for(int k=0; k<num_v; k++){
        sq_val = (((float)arr[k]) - mean);
        sq_sum = squared(sq_val);
        accum += sq_sum;
    }
    variance = accum/(n-1);
    std_div = sqrt(variance);

    printf("mean is: %f \n",std_div);

    return 0;
}