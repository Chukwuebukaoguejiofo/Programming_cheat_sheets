
#include <iostream>
#include <string>

// #include "Person.h" // You should include the class declarations

using namespace std;

//
// Base class
//

class Human {

    public:

    string gender;
    int height;

    //
    // Constructor
    // in base class, the constructor parameters need to have a default value
    //
    Human(string gender = "", int height = 0);

    //
    // Methods
    //

    void setHeight(int height);
    int getHeight();

    private:

    char dna[100];
};


/**
* Contructor
* (constructor has no return type.)
*/
Human::Human(string gender, int height){
    this->gender = gender;
    this->height = height;
}


//
// Methods
//

int Human::getHeight(){
    return this->height;
}

void Human::setHeight(int height){
    this->height = height;
}

//
// Derived class
//

class Person: public Human {

    public:

    string name;
    string address;
    int age;

    // constructor
    Person(string name, int age); 

    //
    // Methods
    //

    void setName(string name);
    string getName();

    private:

    char password[100];
    char ssn[100];
};


/**
 * Contructor
 * (constructor has no return type.)
 */
Person::Person(string name, int age){
   this->name = name;
   this->age = age;
}

//
// Methods
//

string Person::getName(){
    return this->name;
}

void Person::setName(string name){
    this->name = name;
}

//
// Main function
//

int main(){

    Person brian("Brian", 28);
    Person erich("Erich", 25);

    brian.name = "Brian2";

    erich.name = "Erich2";
    
    string msg;

    msg = brian.name;
    cout << "Name of Person #1: " << msg <<endl;
    // Name of Person #1: Brian2


    msg = erich.name;
    cout << "Name of Person #2: " << msg <<endl;
    // Name of Person #2: Erich2

   return 0;
}

