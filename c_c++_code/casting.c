
// in this program, i am trying out casting from one data type to another
#include <stdio.h>
#include <inttypes.h>
#include <string.h>

int main(){
    uint16_t ac6 = 17041;
    uint16_t ac5 = 24833;
    int16_t mc = -11786;
    int16_t md = 2922;

    int32_t ut = 26104;

    int32_t x1 = ut - (int32_t)ac6;
    //int32_t x1 = ;

    printf("%d",x1);

    return 0;
}