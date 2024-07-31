#include <iostream>
using namespace std;

int main(){
    for (int i=0; i <= 10; i+=2){
        cout << i<< "\n";
    }

    // nested for loop
    for (int j = 0; j <=2; j+=1){
        cout << j ;
        for (int k = 0; k <= 2; k+=1){
            cout << k;
        }
    }
    return 0;
};
