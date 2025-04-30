
#include <iostream>
#include <stdlib.h>

//this is my first stack data structure
using namespace std;

#define MAX 10 // define a constant 10
int size = 0;

//create the stack
struct stack{
    int items[MAX];
    int top;
};

typedef struct stack st;

void create_empty_stack(st *s){
    s -> top = -1;
}
//check if stack is full
int isempty(st *s){
    if(s -> top == MAX -1)
        return 1;
    else 
         return 0;
}

//check if stack is empty
int isfull(st *s){
    if(s -> top == -1)
        return 1;
    else
        return 0;
}

// add elements into the stack
void push(st *s, int newitem){
    if (isfull(s)){
        cout << "stack full \n";
    }
    else{
        s -> top++;
        s -> items[s -> top] = newitem;
    }
    size++;
}

// remove element from stack
void pop(st *s){
    if(isempty(s)){
        cout << "stack empty \n";
    }
    else{
        cout << "item popped is " << s ->items[s->top];
        s->top--;
    }
    size--;
}

// print elements of stack
void printstack(st *s){
    cout << "stack elements: ";
    for(int i =0; i < size; i++){
        cout << s->items[i] << " ";
    }
}

int main(){
    int ch;
  st *s = (st *)malloc(sizeof(st));

  create_empty_stack(s);

  push(s, 1);
  push(s, 2);
  push(s, 3);
  push(s, 4);

  printstack(s);

  pop(s);

  cout << "\nAfter popping out\n";
  printstack(s);
}

