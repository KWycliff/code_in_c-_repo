
#include <iostream>
using namespace std;

//Trying different operations on strings

int main(){
    string surname = "Von Kaweesa";
    string first_name = "Wycliff";
    string name = first_name.append(surname);
    //string name = first_name + "  " + surname; // c++ uses + for both addition of numbers and concatenation of strings
    cout << name;

    cout << "\n";
    cout << "length of surname is: " << surname.length();
    cout << "\n";
    cout << "size of surname is: " << surname.size();
    cout << "\n";
    // accessing characters in a string
    cout << surname[0];
    surname[3] = '+';
    cout << "\n";
    cout << surname;
    cout << "\n";

    string fullname;
    cout << "enter your fullname:  ";
    //cin >> fullname; // this doesn't capture words after a space
    getline(cin, fullname); // this outputs all text in a line
    cout << fullname;

    return 0;
};
