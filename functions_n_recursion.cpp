
#include <iostream>
using namespace std;

float addn(float x, float y){
    return x +y;
}

float subt(float x, float y){
    return x-y;
}

float mult(float x, float y){
    return x * y;
}

float div(float x, float y){
    return x/y;
}

int recur(int r){
    if (r == 0){
        return 1;
    }
    else{
        return r * recur(r - 1);
    }

}
int main(){
    float x;
    float y;
    char p;
    cout << "enter x: ";
    cin >> x;
    cout << "\n";
    cout << "enter y: ";
    cin >> y;
    cout << "\n";
    cout << "enter operand: ";
    cin >> p;

    switch(p){
        case '+':
            cout << x << " + " << y << " = " << addn(x,y);
            break;
        case '-':
            cout << x << " - " << y << " = " << subt(x,y);
            break;
        case '*':
            cout << x << " * " << y << " = " << mult(x,y);
            break;
        case '/':
            cout << x << " / " << y << " = " << div(x,y);
            break;
        default:
            cout << "enter correct operand";
    }

    // Recursion and making a function call itself
    cout << "\n";
    int num = 5;
    if (num < 0){
        cout << "invalid factorial for negative numbers ";
    }
    else {
       cout << recur(num);
    }
    return 0;
}
