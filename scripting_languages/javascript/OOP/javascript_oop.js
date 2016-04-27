//----------------------------------------------- class variables and methods

function Person(name){
    this.name = name;
}

Person.specie = "Human"; // class variable

Person.breath = function(){ // class method
	return "I am breathing..."
};

Person.specie; // "Human"
Person.breath(); // "I am breathing..."

brian = new Person('brian');
brian.specie; // undefined  (since 'specie' is not an 'instance variable')
brian.breath(); // Uncaught TypeError: brian.breath is not a function(…)  (since 'breath()' is not an 'instance method')

brian.constructor.specie; // "Human"
brian.constructor.breath(); // "I am breathing..."

//----------------------------------------------- JavaScript OOP

function Human(name){
    var lifespan = 100;
    this.name = name;
    this.walk = function(speed){
        console.log("walking " + speed + "!\n")
    }
    this.eat = function(food){
        console.log("Yummy " + food + "!\n")
    }
}

function Person(name, age){
    var country = "USA";  // class variable
    this.name = name;
    this.age = age;
    this.socialize = function(who){
        console.log("hello " + who + "! how are ya?\n");
    }
    this.getName = function(){
        console.log(this.name);
    }
    this.getAge = function(){
        console.log(this.age);
    }
    this.getCountry = function(){
        console.log(country);
    }
}

Person.prototype = new Human;  // inheritance (Person instance will inherit from Human)

Person.prototype.foo = "bar";  // add aditional stuff ouside of a definition!

var brian = new Person("brian spinos", 27);
brian.getName();
brian.getAge();
brian.getCountry();
brian.socialize("Erich");
brian.walk("fast");
brian.eat("burger");

brian.foo;
brian.__proto__.bar = 123;
brian.bar  // 123

brian.constructor == Human; // true

brian instanceof Person;     // true
brian instanceof Human; // true

// constructor function
function Person(name){
    this.name = name

    this.talk = function(){
        console.log('Hi, my name is ' + this.name + '!');
    }
}

var brian = new Person('brian');

Person.prototype.fly = function(){
    console.log('I am flying!');
}

brian.__proto__.run = function(){
    console.log('I am running!');
}

brian.talk(); // Hi, my name is brian!
brian.fly();  // 'I am flying!'
brian.run();  // 'I am running!'



brian.__proto__  //  the 'parent object'
brian.__proto__  === Person.prototype // true
brian.__proto__.constructor === brian.constructor // true
brian.constructor // the constructor function: function Person(...){ ...}  // same as brian.__proto__.constructor
brian.constructor === Person

typeof brian.__proto__  // "object"
typeof Person.prototype  // "object"
typeof Person  // "function"

