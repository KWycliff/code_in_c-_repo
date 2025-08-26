#ifndef SHAPE_H
#define SHAPE_H

#include <stdio.h>
#include <inttypes.h>

// shape attributes
typedef struct{
    int16_t x;
    int16_t y;
} Shape;

// Shape's operations(esentially functions)
// shape constractor
// param, pointer to shape strut called me, points to same shape instance
void Shape_ctor(Shape * const me, int16_t x0, int16_t y0);
void Shape_moveby(Shape * const me, int16_t dx, int16_t dy);
uint16_t Shape_distanceFrom(Shape const * const me, Shape const * other );

#endif
