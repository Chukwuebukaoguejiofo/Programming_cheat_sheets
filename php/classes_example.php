<?php
//------------------------------------------------------ parent class
class Mamal{
    var $foo;
    var $bar = "bar here";

    function __construct($name){ // function Mamal(){}
        $this->name = $name;
    }

    function __destruct(){ // function Mamal(){}
        echo "Goodbye!\n";
    }

    function getName(){
        echo "My name is $this->name!\n";
    }
    function setName($name){
        $this->name = $name;
    }

    function baz(){
        echo "hello from parent\n";
    }
}
//------------------------------------------------------ child class
class Dog extends Mamal implements Feed{
    const MyConstant = "HERE IS A CONSTAT!!!\n";

    function baz(){  // overriding parent function!
        echo "hello from child\n";
    }

    function eat(){
        echo $name . "$this->name is eating...\n";
    }

    function showConstant(){
        echo Dog::MyConstant;
    }
}
//------------------------------------------------------ interface
interface Feed{
    function eat();
}




$dog = new Dog("Buddy");  // you can omit the parenthesis is the constructor doesnt need them...
$dog->getName();
$dog->setName("brian");
$dog->getName();
$dog->baz();
$dog->eat();
$dog->showConstant();

$dog = null; // calls destructor


?>