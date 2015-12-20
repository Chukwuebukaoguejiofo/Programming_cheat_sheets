// JavaScript OOP


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

Person.prototype = new Human;  // inheritance

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





