// this tutorial needs to be finished

#include <iostream>
#include <string> // string foo; ???
#include <cstring> // for strcpy();

using namespace std;


// the class definition usually goes in a *.h file

// multiple inheritance!
class Person
{
    public:
        Person(); // constructor
        ~Person(); // destructor
        char name[100];
        int age;
        string city;
        const char * address;  // c++ does not like 'char *', it needs to be a 'const char *'

        // Methods
        string walk();
        void talk();
    protected:
        char password[100];
    private:
        double length2;
};



//------------------------------------------- constructor
Person::Person(void)  // no return type!  // the function needs to be in the declaration
{
   // this->foo = 0;
   // this->bar = 0;
    cout << "hello"  <<endl;
};
//------------------------------------------- destructor
Person::~Person(void)  // no return type!  // the function needs to be in the declaration
{
   // this->foo = 0;
   // this->bar = 0;
    cout << "Object is being deleted"  <<endl;
};
//------------------------------------------- function implementation
string Person::walk(void)  // no return type!  // the function needs to be in the declaration
{
    return "walking";
};
//------------------------------------------- main function
int main( )
{
     Person brian;        // Declare brian of type Person
     // brian.name = "brian j spinos";  //  does not work
     strcpy( brian.name, "brian j spinos");
     brian.city = "phoenix";  // assigning a 'string' variable
     brian.address = "123 foobar st";  // assigning a 'char *' variable
     brian.age = 27;


     Person erich;        // Declare erich of type Person
     // erich.name = "erich e spinos"; //  does not work
     strcpy( erich.name, "erich e spinos");
     erich.age = 25;

     cout << "brian's full name is: " << brian.name <<endl;
     cout << "brian's age is: " << brian.age <<endl;
     cout << "brian's city is: " << brian.city <<endl;
     cout << "brian's address is: " << brian.address <<endl;
     cout << "brian's action is: " << brian.walk() <<endl;

     cout << "erich's full name is: " << erich.name <<endl;
     cout << "erich's age is: " << erich.age <<endl;
     cout << "erich's action is: " << erich.walk() <<endl;

     return 0;
};


//------------------------------------------- compile and run
// $ g++ test.cpp -o test
// $ ./test





