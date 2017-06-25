

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
