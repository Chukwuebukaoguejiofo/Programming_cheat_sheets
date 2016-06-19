import Cocoa

//--------------- class
class Person {
    var name: String
    var age: Int
    
    /*
     * constructor
     */
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func getName() -> String 
    {
        return self.name
    }
    
    func setName(name: String) 
    {
        self.name = name
    }

    func addFive(c: Int) -> Int 
    {
        return c + 5
    }
}

//--------------- instantiation
let brian = Person(name: "brian", age: 27)


print("name is \(brian.name)\n")
print("age: \(brian.age)\n")
brian.setName("Erich")
print("setting name to erich...\n")
print("new name: \(brian.name)\n")

print("addFive to 10: \(brian.addFive(10))\n")





