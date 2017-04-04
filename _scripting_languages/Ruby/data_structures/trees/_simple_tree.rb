class Node
    attr_accessor :key,
                  :value,
                  :left,
                  :right

    def initialize(key, value)
        @key = key
        @value = value
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :size,
                  :root

    def initialize
        @root = nil
        @size = 0
    end

    def insert(key, value)
        insertIteratively(@root, key, value)

        # insertRecursively(@root, key, value)
    end

    def inOrder(node)
        if node != nil
            inOrder(node.left)
            print "Node: #{node.key} \n\n"
            inOrder(node.right)
        end
    end

    # private

    def insertIteratively(root, key, value)

        if(@root == nil)
            @root = Node.new(key, value)
            return
        end

        currentNode = @root

        while true
            if key > currentNode.key
                if currentNode.right == nil
                    currentNode.right = Node.new(key, value)
                    break
                else
                    currentNode = currentNode.right
                end
            else
                if currentNode.left == nil
                    currentNode.left = Node.new(key, value)
                    break
                else
                    currentNode = currentNode.left
                end
            end
        end
    end

    #
    # Ruby does not pass by reference, so there is no way of inserting
    # recursively in an OOP way
    #
    def insertRecursively(currentNode, key, value)

        if currentNode == nil
            currentNode = Node.new(key, value)
            return currentNode
        end

        if key > currentNode.key
            currentNode.right = insertRecursively(currentNode.right, key, value)
        else
            currentNode.left = insertRecursively(currentNode.left, key, value)
        end

        return currentNode
    end

end

t = Tree.new

#------------------------------------------------ insert
# t.insert(1, 100)
# t.insert(2, 200)
# t.insert(3, 300)
# t.insert(4, 400)
# t.insert(5, 500)
# t.insert(6, 600)
# t.insert(7, 700)
# t.insert(8, 800)
# t.insert(9, 900)
# t.insert(10, 1000)

# t.inOrder(t.root)

#------------------------------------------------ insertRecursively
t.root = t.insertRecursively(t.root, 1, 100)
t.root = t.insertRecursively(t.root, 2, 200)
t.root = t.insertRecursively(t.root, 3, 300)
t.root = t.insertRecursively(t.root, 4, 400)
t.root = t.insertRecursively(t.root, 5, 500)
t.root = t.insertRecursively(t.root, 6, 600)
t.root = t.insertRecursively(t.root, 7, 700)
t.root = t.insertRecursively(t.root, 8, 800)
t.root = t.insertRecursively(t.root, 9, 900)
t.root = t.insertRecursively(t.root, 10, 1000)

t.inOrder(t.root)
