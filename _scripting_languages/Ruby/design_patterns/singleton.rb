
#
# Singleton Pattern
#     - Uses only one instance of a class
#

class President

    #create an object of President
    @@instance = President.new

    # Make the constructor private so that this class 
    # cannot be instantiated
    private_class_method :new

    # Get the only object available
    def self.get_instance()
        return @@instance
    end

    def say_hello()
        puts 'Good morning America!'
    end
end

#
# president = President.new # Error!
#

# Get the only object available
president = President.get_instance
president.say_hello # 'Good morning America!'
