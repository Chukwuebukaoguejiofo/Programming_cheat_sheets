#
# Person class
#
class Person:
    "this is a person class"
    personCount = 0 # class attribute
    
    def __init__(self, name, age):
        self.name = name 
        self.age = age 
        Person.personCount += 1 
    
    def sayHello(self):
        print("hello there! my name is: " + self.name)
        
    def sayAge(self):
        print("I am " + str(self.age) + " years old.")

#
# API
#

brian = Person("Brian Spinos", 28)
brian.sayHello()
brian.sayAge()

erich = Person("erich Spinos", 25)
erich.sayHello()
erich.sayAge()

print(Person.personCount) # 2
print(Person.__doc__) # "this is a person class"
