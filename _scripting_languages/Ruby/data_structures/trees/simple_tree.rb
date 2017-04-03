class Node
    attr_accessor :key, :value, :left, :right
 
    def initialize(key, value)
        @key = key
        @value = value
        @left = nil
        @right = nil
    end
end
 
class Tree
    attr_accessor :root, :size

    def initialize
    	@root = nil
    	@size = 0
    end

    def insert(key, value)
    	insertIteratively(key, value)
    end

    def insertIteratively(key, value)

    	newNode = Node.new(key, value)

    	if @root == nil
    		@root = newNode
    		return
    	end

    	currentNode = @root

    	while(true)
	    	if key > currentNode.key
	    		if currentNode.right == nil
	    			currentNode.right = newNode
	    			break
	    		else
	    			currentNode = currentNode.right
	    		end
	    	else
	    		if currentNode.left == nil
	    			currentNode.left = newNode
	    			break
	    		else
	    			currentNode = currentNode.left
	    		end
	    	end
	    end
    	
    end
     
 
    def preOrder(node)
        if node != nil
            print "#{node.key} "
            preOrder(node.left)
            preOrder(node.right)
        end
    end

    def inOrder
    	inOrderRecursive(@root)
    end

   
    def inOrderRecursive(node)
        if node != nil
            inOrderRecursive(node.left)
            print "#{node.key} "
            inOrderRecursive(node.right)
        end
    end

    def postOrder(node)
        if node != nil
            postOrder(node.left)
            postOrder(node.right)
            print "#{node.key} "
        end
    end
end

#---------------------------------------------------
t = Tree.new
 

t.insert(10, 100)
t.insert(20, 200)
t.insert(30, 300)
t.insert(40, 400)
t.insert(50, 500)
t.insert(25, 600)


t.inOrder

