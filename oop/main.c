// pratice oop in c 
// project trial one
// test cmake files

//we can create many instances of a class, called objects

#include <inttypes.h>
#include <stdlib.h>
#include "components/rectangle.h"
#include "components/shape.h"

// create objects from the class
Shape s1; // statically allocated
Rectangle r1;
uint32_t area;

int main(){
    Shape s2; // dynamically allocated
    Shape *ps3 = malloc(sizeof(Shape)); // dynamic allocation

    // initialize the objects using the constructor function
    Shape_ctor(&s1, 1, 2);
    Shape_ctor(&s2, 3, 4);
    Shape_ctor(ps3,1,2);

    // initialize the rectangle
    Rectangle_ctor(&r1,1,2,15,10);

    // perform operations on rectangle
    area = Rectangle_area(&r1);

    printf("\n the area of the rectangle is %d \n", area);

    // now perform defined operations on the objects
    Shape_moveby(&s1,7,8);
    Shape_moveby(&s2,9,10);
    Shape_moveby(ps3,-1,-2);
    free(ps3);


}





