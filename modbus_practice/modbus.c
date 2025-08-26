// testing interfaces in c
#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

//------- base shape
typedef struct Shape {
    float (*area)(struct Shape *); // area function pointer which accepts structure shape
} Shape;

// -- circle-----
typedef struct {
    Shape base; // "inherits " from shape
    float radius;
} Circle;

float circle_area(Shape *s){
    Circle *c = (Circle *)s; // downcast to circle
    return 3.14159 * c->radius * c-> radius;
}
// --------- Rectangle ------------
typedef struct {
    Shape base; // inherits from shape 
    float width;
    float height;
} Rectangle; 

float rectangle_area(Shape *s){
    Rectangle *r = (Rectangle *)s; // downcast to Rectangle 
    return r ->width * r->height;
}

Circle* create_circle(float radius){
    Circle* circle;
    circle->base.area = circle_area;
    circle->radius = radius;
    return circle;
}

Rectangle* create_rectangle(float width, float height){
    Rectangle* rect;
    rect->base.area= rectangle_area;
    rect->height = height;
    rect->width = width; 
    return rect;
}

int main(){
    //create a circle 
    Circle c = {{circle_area},5.0};
    // create rectangle 
    Rectangle r = {{rectangle_area},4.0,6.0};

    //Circle* c = create_circle(5.0);
    //Rectangle* r = create_rectangle(3.001,4.5);

    // treat them both as Shape
    Shape *shapes[2];
    shapes[0] = (Shape *)&c;
    shapes[1] = (Shape *)&r;

    // polymorphic call 
    for(int i = 0; i<2; i++){
        printf("Area = %.2f \n",shapes[i]->area(shapes[i]));
    }
    
    return 0;
}