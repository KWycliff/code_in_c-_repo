// in this program, am testing crc
#include <stdio.h>
#include <inttypes.h>

int main(){
    uint16_t crc = 0xabcd;
    uint8_t low = (uint8_t)crc;
    uint8_t high = (uint8_t)(crc>>8);
    printf("low %u\n",low);
    printf("high %u",high);
    return 0;
}