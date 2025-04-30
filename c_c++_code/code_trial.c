// in this program am just trying out shit

#include <stdio.h>
# include <inttypes.h>
int main(){
    //uint8_t num;
    //uint8_t num2;
    //uint8_t buf[3] ={0};
//
    //uint16_t product;
//
    //num = 200;
    //num2 = 230;
//
    //product = num * num2;
//
    //printf("product of two numbers is, %d \n",product);

    //for(int i =0; i<8; i++){
    //    printf("%u\n",buf[0]);
    //    buf[0]++;
    //}

    uint8_t j =1;
    printf("val b4 shift %u\n",j);
    uint8_t k = j<<4;
    printf("val afta shift %u\n",k);

    return 0;
}