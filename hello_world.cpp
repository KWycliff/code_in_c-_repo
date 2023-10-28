
#include <iostream>
using namespace std;

// this is my first c++ program
/*
this is multi
line
comment*/

int main() {
  cout << "Hello World! \n\t\"";
  cout << "My first c++ program is fun\"\n";

  int num_1 = 5;
  cout << num_1;
  cout << "\n";

  char charact = 'r';
  cout << charact;
  cout << "\n";

  double num_2 = 78.098756;
  cout << num_2;
  cout << "\n";

  string hey = "hey every one \n";
  cout << hey;

  int x;
  cout << "enter any number of choice: ";
  cin >> x;
  cout << "your number of choice is: " << x;

  bool this_is_fun = true;
  bool this_is_not_cool = false;

  cout << "\n";

  cout << this_is_fun;
  cout << "\n";
  cout << this_is_not_cool;
  cout << "\n";
  cout << hey;

  return 0;
}
