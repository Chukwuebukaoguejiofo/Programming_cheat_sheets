using System;  // the keyword `using` means that the program is using a namespace, 
// so you dont need to prepend everything with the namespace...

// just as the name implies, its just a namespace
namespace MyWorld 
{ 
   //---------------------------- enum
   enum Days { Sun, Mon, Tue, Wed, Thu, Fri, Sat };
   // int foo = (int)Days.Sun; // 0
   // int bar = (int)Days.Mon; // 1 
   //---------------------------- interface
   public interface AbilityInterface
   {
      // interface members
      void bark();
      void swim();
      // void swap(ref int x, ref int y); // pass by reference
   }
   //---------------------------- base class
   class Animal
   {
      //constant
      const double pi = 3.14159;   

      // array
      double [] balanceA = new double[10];
      //balanceA[0] = 4500.0; // not working ?
     
      double[] balanceB = { 2340.0, 4523.69, 3421.0};

      // attributes:
      string name;
      int age;

      // methods:
      public void walk()
      {
         // Console.WriteLine("walking: {0} {1} {2}", foo, bar, baz);
         Console.WriteLine("walking...");
      } 

      // casting
      // double d = 123.45;
      // int x = (int)d;
   }

   //---------------------------- derived class
   // inheritance and interface usage
   class Dog : Animal, AbilityInterface
   {
      // constructor
      public Dog(string color)  //Parameterized constructor
      {
         Console.WriteLine("Object is being created, color = {0}", color);
         color = color;
      }

      // attributes
      string color;

      public void bark()
      {
         Console.WriteLine("barking...");
      }
      public void swim()
      {
         Console.WriteLine("swimming...");
      }

      //getters and setters
      public void setColor(string color)
      {
         color = color;
      }
      public string getColor()
      {
         return color;
      }
   }
   
   class ExecuteThisStuff  // main class 
   {
      static void Main(string[] args) // main function
      {
         Dog pup = new Dog("red");
         pup.walk();
         pup.bark();
         pup.getColor();
      }
   }
}
