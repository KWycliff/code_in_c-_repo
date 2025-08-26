
#include <iostream>
#include <math.h>

using namespace std;

int main(){
    cout << max(7,10);
    cout << "\n";
    cout << min(5,8);
    cout << "\n";
    cout << sqrt(144);
    cout << "\n";
    cout << floor(3.1456);
    cout << "\n";


    // calculator with if statement
    float x;
    float y;
    char c;
    cout << " val_x: ";
    cin >> x;
    cout << "\n";
    cout << " val_y: ";
    cin >> y;
    cout << "\n";
    cout << " operand: ";
    cin >> c;
    cout << "\n";


    if (c == '+'){
        cout << x + y;
    }
    else if (c == '*'){
        cout << x * y;
    }
    else if (c == '-'){
        cout << x - y;
    }
    else if (c == '/'){
        cout << x/y;
    }
    else{
        cout << "invalid input, enter operands + - / or *";
    }
    cout << "\n";
    return 0;
};
