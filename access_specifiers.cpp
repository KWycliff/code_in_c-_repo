
#include <iostream>
using namespace std;

// public keyword is access specifier. there are others like "private" and "protected"
//public : members are accessed from outside the class
//private : members cannot be accessed from outside the class
//protected : members cannot from outside the class but are accessed from the inherited class

class MyClass{
    public : // publc access specifier
    int x; // public attribute
    private : //private access specifier
    int y;  // private attribute
};

// Encapsulation is where sensitive data is hidden from users. therefore all class attributes should be private by default

class Employee{
    private :
    int salary;

    public :
    //seter
    void setsalary(int s){
        salary = s; 
    }
    // getter
    int getsalary(){
        return salary;
    }
};

int main(){
    MyClass obj1;
    obj1.x = 23;    //allowed
    //obj1.y = 24;    // not allowed, brings an error when you try to run the code

    Employee myobj;
    myobj.setsalary(15000000);
    cout << myobj.getsalary();
    return 0;
}
