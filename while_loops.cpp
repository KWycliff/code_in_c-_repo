
#include <iostream>
using namespace std;

int main(){
    int x = 0;
    int y = 0;

    while (x <= 10){
        cout << x << "\n";
        x++;}

    cout << "begin do while loop \t";
    do{
       cout << y << "\t";
        y++;
    }
    while(y <= 10);
    return 0;
}
