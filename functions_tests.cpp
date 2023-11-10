
#include <iostream>
using namespace std;

void myfunc(){
    cout << "my first function in c++ \n";
}

void func2(string name, int age, string cclass){
    cout << "My name is " << name << " " << age << " years old" << " in class " << cclass << "\n";
}

int returnfunc(int x, int y){
    return x * y;
}


int main(){
    myfunc();

    // parameters in function declaration
    func2("Kaweesa", 23, "S6");
    func2("Wycliff", 25, "working");

    // return values
    cout << returnfunc(4, 9);


    return 0;
}
