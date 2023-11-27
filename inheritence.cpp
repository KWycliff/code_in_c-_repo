
#include <iostream>
using namespace std;

// Base class
class Vechicle{
    public:
    string brand = "toyota";
    void sound(){
        cout << "out of the way tuut tuut";
    }
};
// Derived class
class Car: public Vehicle {
    public:
    string model = "Volkswagen";
};

int main(){
    Car mycar;
    mycar.sound();
    cout << mycar.brand + " " + mycar.model;
    return 0;
}
