

#------------------------------------------------------ singleton
# use only one instance

class SingleObject


    #create an object of SingleObject
    @@instance = SingleObject.new

    #make the constructor private so that this class cannot be
    #instantiated
    private_class_method :new



    #Get the only object available
    def self.getInstance()
        return @@instance
    end

    def foo()
        puts 'hello world'
    end
end

# object = SingleObject.new # Error!

#Get the only object available
object = SingleObject.getInstance

#show the message
object.foo


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


#------------------------------------------------------ observer


class Subject
    def initialize
        @observers = []
        @val1, @val2, @val3 = nil,nil,nil
    end

    def register(observer)
        @observers << observer
    end

    def unregister(observer)
        @observers - [observer]
    end

    def notifyObservers()
        @observers.each do |o|
            o.update(@val1, @val2, @val3)
        end
    end

    #---
    def setVal1(val1)
        @val1 = val1
        notifyObservers
    end

    def setVal2(val2)
        @val2 = val2
        notifyObservers
    end

    def setVal3(val3)
        @val3 = val3
        notifyObservers
    end

end

# The Observers update method is called when the Subject changes
class Observer
    @val1, @val2, @val3 = nil, nil, nil
    def initialize(subject)
        @subject = subject
        @subject.register(self)

    end
    def update(val1, val2, val3)
        @val1, @val2, @val3 = val1, val2, val3
        puts "\n\nhere: #{@val1} #{@val2} #{@val3} "
    end
end



# Create the Subject object
# It will handle updating all observers
# as well as deleting and adding them

subject = Subject.new

# Create an Observer that will be sent updates from Subject

observer1 = Observer.new(subject)

subject.setVal1(22)
subject.setVal2(33)
subject.setVal3(44)

observer2 = Observer.new(subject)

subject.setVal1(99)
subject.setVal2(88)
subject.setVal3(77)

# Delete one of the observers

subject.unregister(observer2)

subject.setVal1(197)
subject.setVal2(677)
subject.setVal3(676)





#------------------------------------------------------

#------------------------------------------------------


#------------------------------------------------------ recursion
def foo(n)

    if n == 10 # base case
        return 10
    else
        # puts n # normal flow
        foo(n + 1) # recursive call with changed parameter
        #puts n # reverse flow
    end
end

foo(1)


