
#------------------------------------------------------ visitor
# strategy: 1 class, and many strategies
# visitor: many classes, and many visitors with a method to do work for each class

# receives a strategy and uses its methods
# receives a visitor  and the visitor does its thing
# class is wrapped and its methods are inhanced


class Car # visitee
    def accept(visitor)
        visitor.visit(self)
    end

end

class Person # visitor
    def visit(car)
        puts "hey #{car} !"
    end
end

car = Car.new
car.accept(Person.new)
