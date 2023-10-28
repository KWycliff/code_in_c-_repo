
#include <iostream>
using namespace std;
// calaculator design using the switch statement
int main(){
    float x;
    float y;
    char c;

    cout << "val_x: ";
    cin >> x;
    cout << "\n";
    cout << "val_y: ";
    cin >> y;
    cout << "\n";
    cout << "operand: ";
    cin >> c;

    switch(c){
        case '+':
        cout << x << " + " << y << " = " << x + y;
        break;
        case '-':
        cout << x << " - " << y << " = " << x - y;
        break;
        case '*':
        cout << x << " * " << y << " = " << x * y;
        break;
        case '/':
        cout << x << " / " << y << " = " << x / y;
        break;
        default:
        cout << "invalid operand: enter one of these + - * /";
    }

    return 0;
};
