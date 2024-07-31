
#include <stdio.h>
#include <string.h>
#include <stdint.h>

int main(){
    uint8_t buf[12];

    for(int i=0; i<12; i++){
        buf[i]='A'+ i;
    }

buf[11] = '\0';
    printf("buf contents are: %s\n", (char*)buf);
    printf("hello ykee");

    return 0;
}