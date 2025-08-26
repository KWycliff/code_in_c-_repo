#include "rectangle.h"

void Rectangle_ctor(Rectangle * const me, int16_t x0, int16_t y0, uint16_t w0, uint16_t l0){
    Shape_ctor(&me->super,x0,y0); // base class constructor

    // initialize attributes added to this class
    me->length = l0;
    me->width = w0;
};

uint32_t Rectangle_area(Rectangle const * const me){
    return (uint32_t)me->length * (uint32_t)me->width;
};