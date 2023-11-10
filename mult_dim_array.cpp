
#include <iostream>
using namespace std;

int main(){
//demonstration of a multi-dimensional array
    string multi_dim [2][4] = {
        {"apple", "pie", "order", "now"},
        {"meine", "schwester", "mutter", "vater"}
    };

    for (int i = 0; i < 2; i++){
        for (int j =0; j < 4; j++){
            cout << multi_dim[i][j] << "\n";
        }
    }
    return 0;
}
