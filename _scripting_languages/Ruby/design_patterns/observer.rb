

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



