
#------------------------------------------------------ strategy
# strategy: 1 class, and many strategies
# visitor: many classes, and many visitors with a method to do work for each class

# receives a strategy and uses its methods
# receives a visitor  and the visitor does its thing
# class is wrapped and its methods are inhanced

class Add
    def doOperation(n, m)
        n + m
    end
end

class Subtract
    def doOperation(n, m)
        n - m
    end
end

class Context
    def initialize(strategy)
        @strategy = strategy
    end

    def executeStrategy(n, m)
        return @strategy.doOperation(n, m)
    end
end


context = Context.new(Add.new)
puts "10 + 5 = #{context.executeStrategy(10, 5)}"

context = Context.new(Subtract.new)
puts "10 - 5 = #{context.executeStrategy(10, 5)}"

