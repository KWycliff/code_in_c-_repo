# include <iostream>
using namespace std;

int main(){
    // display the ascii characters mapped by these following numbers
    char a = 40;
    char b = 41;
    char c = 42;

    cout << a;
    cout << "\n";
    cout << b;
    cout << "\n";
    cout << c;

    // operators in c++
    float x = 40;
    float y = 23;
    float sum = x + y;
    float sub = x - y;
    float mult = x * y;
    float div = x/y;
    //int modulo = x%y;
    //float increm = ++x;
    //float decre = --x;

    cout << "\n";
    cout << x << " + " << y << " = " << sum;
    cout << "\n";
    cout << x << " - " << y << " = " << sub;
    cout << "\n";
    cout << x << " * " << y << " = " << mult;
    cout << "\n";
    cout << x << " / " << y << " = " << div;
    cout << "\n";
    //cout << x << " % " << y << " = " << modulo;
    //cout << "\n";
    //cout << x << " increment " << " = " << increm;
    //cout << "\n";
    //cout << x << " decrement " << " = " << decre;

    // bitwise shift right by one bit
    int m = 4;
    m >>= 1;
    cout << "\n";
    cout << m;


    return 0;
};
