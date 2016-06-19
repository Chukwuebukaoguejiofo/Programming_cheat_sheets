import Cocoa

//--------------- class
class Person {
    var age: Int

    init(age: Int) {
       self.age = age
    }

    func addFive(c: Int) -> Int 
    {
        return c + 5
    }
}

//--------------- instantiation
let brian = Person(age: 27)
print("brian is \(brian.age)\n")
print("brian: \(brian.addFive(10))\n")

