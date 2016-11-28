#include <iostream>

using namespace std;

class Person{
    public:
    
        // constructor
        Person(string name, int age); 
        
        // attributes
        string name;
        int age;
   
        // methods
        string sayHello();
        string sayName();
    
    private:
    
        string password;
};

// constructor implementation (no return type allowed)
Person::Person(string name, int age){
    this->name = name;
    this->age = age;
}

string Person::sayHello(){
    return "Hello there";
}

string Person::sayName(){
    string x = "my name is ";
    x += this->name;
    return x;
}

int main(){
    
   // instantiation
   Person * brian = new Person("Brian", 28);

   cout << brian->name << endl; 
   cout << brian->age << endl; 
   cout << brian->sayHello() << endl; 
   cout << brian->sayName() << endl; 
   
   delete brian;
   
   return 0;
}

