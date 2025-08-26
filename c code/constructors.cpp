
#include <iostream>
using namespace std;

// A constructor is a special method in c++, that is automatically called when an object is created: it 
// uses the same name as the class

class Car{
    public :
    string brand;
    string model;
    int year;

    Car(string a, string b, int c){
        brand = a;
        model = b;
        year = c;
    }
};

int main(){

// create the objects
Car obj1("Cadlarc", "beast", 2023);
Car obj2("Ford", "Mustang", 2019);

cout << obj1.brand << " " << obj1.model << " " << obj1.year << "\n";
cout << obj2.brand << " " << obj2.model << " " << obj2.year << "\n";
    return 0;
}