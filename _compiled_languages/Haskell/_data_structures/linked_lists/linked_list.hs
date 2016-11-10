-- LinkedList in Haskell (still needs testing...)

-- functions need to start with lower-case
-- dont use tabs
-- be carefull with indentation


data Node value = EmptyNode | Node value (Node value) deriving (Show, Read, Eq)  -- Node x next


createNode :: value -> Node value  -- pass a x and returns a Node
createNode x = Node x EmptyNode  -- node creation! 
  
nodeInsert :: (Ord a) => a -> Node a -> Node a  -- pass a x and a Node  -- (Ord a) => means:  hey, 'a' can be ordered!
nodeInsert x EmptyNode = createNode x  -- if you pass a x and an 'empty Node' -> call createNode function
nodeInsert x (Node a nextNode)   -- if you pass a x and a Node, do the following: -- here you have access to the object's fields!!!
    | nextNode == EmptyNode = Node x (nodeInsert a nextNode)    -- if  nextNode == EmptyNode
    | otherwise = Node x (nodeInsert a nextNode)  -- Node a (nodeInsert x nextNode)  
    
isValueInList :: (Ord a) => a -> Node a -> Bool  -- pass in a value and a Node
isValueInList value EmptyNode = False            -- if you pass a value and an empty node, return False
isValueInList value (Node a nextNode)          -- if you pass in a value and a node, do the following:
    | value == a = True                           -- if value == value of the root, return true
    | value < a  = isValueInList value nextNode            -- if value < root value, recurse with left sub tree
    | value > a  = isValueInList value nextNode           -- if value > root value, recurse with right sub tree
    


main = do
    let nums = [1,2,3,4,5,6,7,8,9]  
    let numsNode = foldr nodeInsert EmptyNode nums  
    print numsNode
