
#include <iostream>
using namespace std;

int main(){
    // break a for loop
    for(int i = 0; i <= 10; i+=1){
        if (i == 4){
            break;
        }
        cout << i << "\n";
    }

    cout << "\n";
    // continue for loop given condition
    for(int j = 0; j <= 10; j+=1){
        if (j == 4){
            continue;
        }
        cout << j << "\n";
    }
    cout << "\n";
    // simple arrays in c++
    string cars[6] = {"benz", "audi q3", "ford GTx", "toyota hilax", "tesla model y", "chinese byd"};
    for( int k = 0; k < sizeof(cars)/sizeof(string); k++){
        cout << k << "\t" << cars[k] << "\n" << "\n";
    }

    cout << "\n";

    // using for each loop
    int nums[4] = {4, 5, 2, 8};
    for( int b : nums){
        cout << b << "\n";
    }

    return 0;
}
