using System;  // the keyword `using` means that the program is using a namespace, 
// so you dont need to prepend everything with the namespace...

// just as the name implies, its just a namespace
namespace MyWorld 
{ 
   class Animal
   {
      // attributes:
      string name;
      int age;

      // methods:
      public void walk()
      {
         // Console.WriteLine("walking: {0}", length);
         Console.WriteLine("walking...");
      } 
   }

   // inheritance
   class Dog : Animal 
   {
      // attributes
      string color;

      public void bark()
      {
         Console.WriteLine("barking...");
      }
   }
   
   class ExecuteThisStuff  // main class 
   {
      static void Main(string[] args) // main function
      {
         Dog pup = new Dog();
         pup.walk();
         pup.bark();
      }
   }
}
