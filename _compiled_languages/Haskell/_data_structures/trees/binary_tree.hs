-- Haskell binary tree (comments may not be correct...)

-- functions need to start with lower-case
-- dont use tabs
-- be carefull with indentation

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)  


createNode :: a -> Tree a  -- pass a value and returns a tree
createNode value = Node value EmptyTree EmptyTree  -- node creation! 
  
treeInsert :: (Ord a) => a -> Tree a -> Tree a  -- pass a value and a tree
treeInsert value EmptyTree = createNode value  -- if you pass a value and an 'empty tree' -> call createNode function
treeInsert value (Node a left right)   -- if you pass a value and a full tree, do the following:
    | value == a = Node value left right    -- if the value == the value of the tree
    | value < a  = Node a (treeInsert value left) right  -- if value is less:  return the root, but recurse on the root's left value
    | value > a  = Node a left (treeInsert value right)  -- if value is greater:  return the root, but recurse on the root's right value
    
treeElem :: (Ord a) => a -> Tree a -> Bool  -- pass in a value and a tree
treeElem value EmptyTree = False            -- if you pass a value and an empty tree, return False
treeElem value (Node a left right)          -- if you pass in a value and a tree, do the following:
    | value == a = True                           -- if value == value of the root, return true
    | value < a  = treeElem value left            -- if value < root value, recurse with left sub tree
    | value > a  = treeElem value right           -- if value > root value, recurse with right sub tree
    


main = do
    let nums = [8,6,4,1,7,3,5]  
    let numsTree = foldr treeInsert EmptyTree nums  
    print numsTree 
