# Typescript

```typescript

// Each line of instruction is called a statement. 
// Semicolons are optional in TypeScript.

//--------------------------------------------------------------------- types:
let message:string = "Hello World"  // string type
let myVariableA:number = 123;
let myVariableB:string = "aaa";
let myVariableC:void = null;
let myVariableD:void = undefined;
let myVariableE:boolean = true;
let myVariableF:any = 123;
let myVariableG:null = null;
let myVariableH:undefined = undefined;
let myVariableI:number[] = [1,2,3]
let myVariableJ:Array<number> = [1,2,3]
let myVariableK:object  = {foo:1, bar:2}
let myVariableL:Date  = new Date('10/12/2000')
let myVariableM:{x:number, y:number}  = {x:1, y:2}
let myVariableN:any = 123
let myVariableO:any = 'abc'

//--------------------------------------------------------------------- Constants:
class Foo {
    readonly MY_CONSTANT:number = 123;

    bar() {
        console.log(this.MY_CONSTANT);
    }
}

let f = new Foo()
f.bar() // 123

//-------

class Person { 
    static readonly POPULATION = 7000000;
}

alert(Person.POPULATION) // 7000000
alert(Person.POPULATION += 1) // ERROR

//--------------------------------------------------------------------- Casting:
let x = '123'
let y = Number(x)
alert(typeof y) // number


let z = 123
let w = String(z)
alert(typeof w) // string

//--------------------------------------------------------------------- Enum:
enum Colors { 
    Red = 0,
    Green = 1,
    Blue = 2
}

let x = Colors.Red

//--------------------------------------------------------------------- function return type
class Greeting { 
    greet():number { // this function returns a number
        return 123
    } 
} 

//--------------------------------------------------------------------- function parameter type
class Person { 
    getWeight<T>(weight:T) { // the user of the function defines what type the parameter should be
        return weight;
    }
}

let brian = new Person();
let x = 123.45
brian.getWeight<number>(x); // expect x as a number

//--------------------------------------------------------------------- type assertion
// This is NOT type casting, because we cannot change the type, only assert it!
let x = 123;
let y = <number>x;

// These are the same:
let square = <Square>{};
let square = {} as Square;

var msg:any = 'hello';
var msg2 = <string> msg; // msg2 is now of type "string"

//--------------------------------------------------------------------- static fields and functions
class Person {  
   static num:number; 
   
   static funcB():void { 
      console.log("The value of num is"+ Person.num) 
   } 
} 

Person.num = 12     // initialize the static variable 
Person.funcB()      // invoke the static method

//--------------------------------------------------------------------- Array destructuring
var arr:number[] = [12,13] 
var[x,y] = arr 
console.log(x) 
console.log(y)

//--------------------------------------------------------------------- tuples
var mytuple = [10, "Hello"];

//--------------------------------------------------------------------- union
let x1:number | string = "abc"
let x2:number | string = 123

//--------------------------------------------------------------------- interfaces
interface IBar { 
    name: string
    myfn: (x: number, y: number) => number
    readonly address:string
}


class Foo implements IBar { 
    name: string = 'brian'
    address: string = '123 foobar st'

    myfn(x: number, y: number) : number{ 
        return x + y
    }
}

//---------------------------------------
interface IPerson { 
   firstName:string, 
   lastName:string, 
   sayHi: ()=>string 
} 

var customer:IPerson = { 
   firstName:"Tom",
   lastName:"Hanks", 
   sayHi: ():string =>{return "Hi there"} 
} 

//----------------------------------------
interface Shape {
    name: string;
    width: number;
    height: number;
    color?: string;
}
 
function area(shape : Shape) {
    var area = shape.width * shape.height;
    return "I'm " + shape.name + " with area " + area + " cm squared";
}
 
console.log( area( {name: "rectangle", width: 30, height: 15} ) );
console.log( area( {name: "square", width: 30, height: 30, color: "blue"} ) );

//--------------------------------------------------------------------- interfaces and classes
interface ILoan { 
   interest:number 
} 

class AgriLoan implements ILoan { 
   interest:number 
   rebate:number 
   
   constructor(interest:number,rebate:number) { 
      this.interest = interest 
      this.rebate = rebate 
   } 
} 

var obj = new AgriLoan(10, 1) 
console.log("Interest is : "+obj.interest+" Rebate is : "+obj.rebate )

//--------------------------------------------------------------------- classes
class Car { 
   engine:string; 
 
   constructor(engine:string) { 
      this.engine = engine 
   }  

   disp():void { 
      console.log("Engine is  :   "+this.engine) 
   } 
}

//--------------------------------------------------------------------- Inheritance
class Shape { 
   Area:number 
   
   constructor(a:number) { 
      this.Area = a 
   } 
} 

class Circle extends Shape { 
   disp():void { 
      console.log("Area of the circle:  "+this.Area) 
   } 
}
  
var obj = new Circle(123); 
obj.disp()

//--------------------------------------------------------------------- namespace
namespace MyNamespace { 
    class Person { 
        draw() { return 1}; 
   }
} 

//--------------------------------------------------------------------- spread operator
let copy = { ...original };
let merged = { ...foo, ...bar, ...baz };

//--------------------------------------------------------------------- generics
class Greeter<T> {
    greeting: T;
    constructor(message: T) {
        this.greeting = message;
    }
    greet() {
        return this.greeting;
    }
}

let greeter = new Greeter<string>("Hello, world");

greeter.greet();

//--------------------------------------------------------------------- interpolation
let user = "Brian"
let msg = `Hello ${user}`

//--------------------------------------------------------------------- imports
import * as types from '../someFile'
import { ADD_TODO, DELETE_TODO } from '../someFile'  
import Foo from '../someFile'  

export function addTodo(text) {  
  return { type: types.ADD_TODO, text }
}

export const foo = function add(a, b){
  return a + b;
}

//--------------------------------------------------------------------- Generators

function* foo(){
    yield "One"
    yield "Two"
    yield "Three"

    return "Four"
}

let fooGenerator = foo()

console.log(fooGenerator.next()) // {value: "One", done: false}
console.log(fooGenerator.next()) // {value: "Two", done: false}
console.log(fooGenerator.next()) // {value: "Three", done: false}
console.log(fooGenerator.next()) // {value: "Four", done: true}
console.log(fooGenerator.next()) // {value: "undefined", done: true}


//-------

function* bar(){
    let name = yield
    console.log(`Hello ${name}`);

    return "DONE!"
}

var gen = bar();

// the first call of next executes from the start of the function
// until the first yield statement
gen.next(); // {value: undefined, done: false}
gen.next('Brian'); // Hello Brian  // {value: "DONE!", done: true}

//---------------------------------------------------------------------


```
