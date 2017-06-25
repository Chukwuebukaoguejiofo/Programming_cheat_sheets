#
# Strategy Patterns
#     - have an object receive another object that encapsulates an algorithm.
#
# strategy: 1 class, and many strategies
# visitor: many classes, and many visitors with a method to do work for each class

# receives a strategy and uses its methods
# receives a visitor  and the visitor does its thing
# class is wrapped and its methods are inhanced

class Calculation
    attr_accessor :strategy

    def initialize(strategy)
        @strategy = strategy
    end

    def execute(n, m)
        return @strategy.execute(n, m)
    end
end

class Add
    def execute(n, m)
        n + m
    end
end

class Subtract
    def execute(n, m)
        n - m
    end
end


#======= Usage:


calculation = Calculation.new(Add.new)
calculation.execute(10, 5) # 15

calculation = Calculation.new(Subtract.new)
calculation.execute(10, 5) # 5
