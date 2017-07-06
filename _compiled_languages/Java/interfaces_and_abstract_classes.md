# Interfaces and Abstract classes



```java
public class Main{
  
  	//
  	// Abstract class
  	//

  	static abstract class Inteligence { // The class needs to be 'static' so it can be used in the 'main' function
  		private String name;

  		public Inteligence(String name){
  			this.name = name;
  		}

  		public void foobar(){
  			System.out.println("foobar called!");
  		}

  		public abstract void bar(); // abstract methods cannot have a body
  	}

  	//
  	// Interface
  	//

  	static interface Student { // The class needs to be 'static' so it can be used in the 'main' function
    	public void study();
    	public void goToClass();
  	}

  	//
  	// Class
  	//
  	
  	static class Person extends Inteligence implements Student{ // The class needs to be 'static' so it can be used in the 'main' function
  		private String name;

  		public Person(String name){
  			super(name); // we need to instantiate the parent class too ???
  			this.name = name;
  		}

  		public void phone(){
  			System.out.println("phone called!");
  		}

  		//
  		// using the interface 'Student' functions
  		//

  		public void study(){
  			System.out.println("study called!");
  		}

  		public void goToClass(){
  			System.out.println("goToClass called!");
  		}

  		//
  		// using abstract methods from Inteligence class
  		//

  		public void bar(){
  			System.out.println("bar called!");
  		}
  	}
  

    public static void main(String[] args){
    	Person brian = new Person("Spinos");

    	// Inteligence inteligence = new Inteligence("Spinos"); // Inteligence is abstract; cannot be instantiated


        System.out.println(brian.name); // Spinos

        brian.study();
        brian.goToClass();
        brian.bar();
        brian.foobar();
        brian.phone();
    }
}

```
