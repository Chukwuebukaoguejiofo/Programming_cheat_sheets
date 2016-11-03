// this tutorial needs to be finished

#include <iostream>

using namespace std;


// the class definition usually goes in a *.h file

// multiple inheritance!
class Box: public Shape, public Item

{
    public:
        double length;   // Length of a box
        double breadth;  // Breadth of a box
        double height;   // Height of a box

        Box(); // constructor

        // Methods
        double area();
        double perim();
    private:
        double length2;      // Length of a box
        double breadth2;     // Breadth of a box
        double height2;      // Height of a box
};

int main( )
{
   Box Box1;        // Declare Box1 of type Box
   Box Box2;        // Declare Box2 of type Box
   double volume = 0.0;     // Store the volume of a box here

   // box 1 specification
   Box1.height = 5.0;
   Box1.length = 6.0;
   Box1.breadth = 7.0;

   // box 2 specification
   Box2.height = 10.0;
   Box2.length = 12.0;
   Box2.breadth = 13.0;
   // volume of box 1
   volume = Box1.height * Box1.length * Box1.breadth;
   cout << "Volume of Box1 : " << volume <<endl;

   // volume of box 2
   volume = Box2.height * Box2.length * Box2.breadth;
   cout << "Volume of Box2 : " << volume <<endl;
   return 0;
}

//------------------------------------------- class implementation  (foo.cpp)
#include "Box.h" // You include the class description

// Contructor
Box::Box()  // no return type!
{
   this->l = 0;
   this->w = 0;
}

// Methods
double Box::area()
{
   return this->w * this->l;
}

double Box::perim()
{
   return 2*this->w + 2*this->l;
}
