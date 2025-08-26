#ifndef RECTANGLE_H
#define RECTANGLE_H

#include "shape.h"

typedef struct{
  Shape super; // inherited class

  // attributes specific to this class
  uint16_t width; 
  uint16_t length;

} Rectangle;

// rectangle operations
// constructor
void Rectangle_ctor(Rectangle * const me, int16_t x0, int16_t y0, uint16_t w0, uint16_t l0);

uint32_t Rectangle_area(Rectangle const * const me);

#endif