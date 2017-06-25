#
# Decorator
# - an object is wrapped inside another object, 
#   and the inner object's methods are inhanced by the wrapper object's methods
#
# strategy: 1 class, and many strategies
# visitor: many classes, and many visitors with a method to do work for each class
#
# receives a strategy and uses its methods
# receives a visitor  and the visitor does its thing
# 

#
# The wrapper class
#
class ShapeDecorator
    attr_accessor :shape

    def initialize(shape)
        @shape = shape
    end

    #
    # method that will inhance the inner object's method
    #
    def draw
        @shape.draw
        puts 'and more!'
    end
end

#
# The classes that will be wrapped
#

class Circle
    def draw
        puts 'circle'
    end
end

class Square
    def draw
        puts 'square'
    end
end

#======= Usage:

circle = Circle.new
square = Square.new

shapeDecorator1 = ShapeDecorator.new(circle)
shapeDecorator1.draw # circle and more!

shapeDecorator2 = ShapeDecorator.new(square)
shapeDecorator2.draw # square and more!


