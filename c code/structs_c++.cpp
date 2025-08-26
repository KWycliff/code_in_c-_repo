
#include <iostream>
using namespace std;

// i am trying out structures in this code

// a named structure

    struct car{
      string manuf;
      string make;
      int time;
    };

int main(){
    struct{
        int number;
        string word;
    } mystruct;

    mystruct.number = 25;
    mystruct.word = "my first structure";

    cout << mystruct.number << "\n";
    cout << mystruct.word << "\n";

    // use structures to represent cars

    struct{
        string brand;
        string model;
        int year;
    }car1, car2; // these are structure variables

    // car1 information
    car1.brand = "Mercedes";
    car1.model = "hatchback";
    car1.year = 2023;

    // car2 information
    car2.brand = "toyota";
    car2.model = "fielder";
    car2.year = 2019;

    // pass out the car information
    cout << car1.brand << " " << car1.model << " " << car1.year << "\n";
    cout << car2.brand << " " << car2.model << " " << car2.year << "\n";

    // global structure
    car carx;
    carx.manuf = "volkswagen";
    carx.make = "golf gti";
    carx.time = 2022;

    car cary;
    cary.manuf = "BMW";
    cary.make = "X9";
    cary.time = 2019;

    // output the car information
    cout << carx.manuf << " " << carx.make << " " << carx.time << " " << &carx.time << "\n";
    cout << cary.manuf << " " << cary.make << " " << cary.time<< " " << &cary.time << "\n";


    return 0;
}
