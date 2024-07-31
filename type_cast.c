#include <stdio.h>
#include <inttypes.h>

int main() {
    uint16_t test = 34;
    char val[10];
    uint8_t buf[3];
    uint16_t ac1_cal;

    sprintf(val,"%d", test);
    printf("%s \n", val);

    buf[0] = 130;
    buf[1] = 9;
    //ac1_cal = ((uint16_t)buf[1] | ((uint16_t)buf[0]<<8));
    ac1_cal = (buf[1] | (buf[0]<<8));
    sprintf(val, "%d" ,ac1_cal);
    printf("%s\n",val);
    buf[2] = 119<< 1;
    printf("%d\n",*(buf+2));

}