// file name: Person.java

//--------------------------------------------------------------- class
public class Person {
    String name;  // instance variable //(if its outside a function, its an instance varialbe)
  
    /*
     * constructor
     */
    public Person(String name){
        // 'name' is the parameter, 'this.name' is the instance variable! (thats the difference)
        System.out.println("Name chosen is: " + name );
        this.name = name;
    }

    public void setName( String name ){
        this.name = name;
    }

    public void getName( ){
        System.out.println( this.name );
    }
  
    public static void main(String []args){
        /* Object creation */
        Person brian = new Person( "brian" );

        /* Call class method to set puppy's age */
        brian.setName( "erich" );

        /* Call another class method to get the Person's Name */
        brian.getName( );

        /* 
         * You can access instance variable as follows as well 
         * but its better to use encapsulation
         */
        System.out.println("Variable Value :" + brian.name );
    }
}
//--------------------------------------------------------------- abstract class


//--------------------------------------------------------------- interface


//--------------------------------------------------------------- compile
// $ javac Person.java
// run
// $ java Person


