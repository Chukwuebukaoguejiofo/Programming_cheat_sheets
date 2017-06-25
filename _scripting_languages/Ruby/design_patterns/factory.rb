#
# Factory pattern
# The objective is to create an object
#
# the Shape interface: draw() 
#
class ShapeFactory
    
    def getShape(shapeType)
        if shapeType == nil
            return nil
        end 

        if shapeType == "circle"
            return Circle.new
        end

        if shapeType == "rectangle"
            return Rectangle.new
        end

        if shapeType == "square"
            return Square.new
        end

        return nil
    end
end

class Rectangle
    def draw
        puts 'Drawing a Rectangle!'
    end
end

class Square 
    def draw
        puts 'Drawing a Square!'
    end
end

class Circle 
    def draw
        puts 'Drawing a Circle!'
    end
end

#======= Usage:

shapeFactory = ShapeFactory.new

shape1 = shapeFactory.getShape("circle")
shape1.draw # 'Drawing a Circle!'

shape2 = shapeFactory.getShape("rectangle")
shape2.draw # 'Drawing a Rectangle!'

shape3 = shapeFactory.getShape("square")
shape3.draw # 'Drawing a Square!' 

