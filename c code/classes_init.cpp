
#include <iostream>
using namespace std;

// class car (blue print)
class Car{
    public :
    string brand;
    string model;
    int year;
};

// class calculator
class Calculator{
    public :
    int x;
    int y;
    char p;

    float calc(float x, float y, char p){
        if (p == '+'){
            return x + y;
        }
        else if(p == '-'){
            return x - y;
        }
        else if(p == '*'){
            return x * y;
        }
        else if(p == '/'){
            return x / y;
        }
        else{
            cout << " invalid operand ";
        }
    }
};

int main(){
    // object 1 of class car
    Car c_obj1;
    c_obj1.brand = "Volkswagen";
    c_obj1.model = "Golf GTI";
    c_obj1.year  = 2019;

    // object 2 of class car
    Car c_obj2;
    c_obj2.brand = "BMW";
    c_obj2.model = "X3";
    c_obj2.year  = 2022;

    //print attribute values
    cout << c_obj1.brand << " " << c_obj1.model << " " << c_obj1.year << "\n";
    cout << c_obj2.brand << " " << c_obj2.model << " " << c_obj2.year << "\n";

    // value 1 for the calculator
    Calculator val1;
    float r = 1000;
    float s = 500;
    char t = 'm';
    cout << r << " " << t << " " << s << " = " << val1.calc(r,s,t) << "\n";
    cout << val1.calc(23,24,'+');
    return 0;
}
