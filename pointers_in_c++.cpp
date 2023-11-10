
#include <iostream>
using namespace std;

// a pointer is a variable that stores an adress as it's value
int main(){

    string doof = "schnitzel";
    string* ptr = &doof; // pointer type should match the type of variable you are working with

    cout << "string: " << doof << "  pointer: " << &doof << "  pointer_variable: " << *ptr << "\n";

    // modify pointer address

    string language = "Deutsch";
    string* pointer = &language;

    cout << "string: " << language << " pointer_variable: " << pointer << "\n";

    *pointer = "French";

    cout << "new_string: " << language << " address: " << pointer << " dereference: " << *pointer;
    return 0;
}
