

#------------------------------------------------------ decorator
# strategy: 1 class, and many strategies
# visitor: many classes, and many visitors with a method to do work for each class

# receives a strategy and uses its methods
# receives a visitor  and the visitor does its thing
# class is wrapped and its methods are inhanced

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


class ShapeDecorator
    def initialize(shape)
        @shape = shape
    end

    def draw
        @shape.draw
        puts 'and more!'
    end
end

circle = Circle.new
square = Square.new

shapeDecorator1 = ShapeDecorator.new(circle)
shapeDecorator1.draw

shapeDecorator2 = ShapeDecorator.new(square)
shapeDecorator2.draw

