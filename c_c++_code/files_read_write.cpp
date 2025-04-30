
#include <iostream>
#include <fstream>
using namespace std;

int main(){
    ////in this program, i am going to read and write from files
    //ofstream MyFile("my_first_c++_file.txt");
//
    ////write to the file
    //MyFile << "words can not describe what should be in this file  ha ha ha ";
//
    //for(int i=0; i < 10; i++){
    //    MyFile << i << " \n";
    //}
//
    ////close file after writing. it is good practise.
    //MyFile.close();

    // read from file
    string hold_text;

    ifstream MyReadFile("my_first_c++_file.txt");
    while (getline (MyReadFile, hold_text)) {
        cout << hold_text;
    }

    // Close the file
    MyReadFile.close();

    return 0;
}