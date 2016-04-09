-- haskell tutorial

-- links
-- https://learnxinyminutes.com/docs/haskell/
-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses ???

-- ==================================================================== print statement
main = putStrLn "Hello World"

-- ==================================================================== multiple print statements
main = do
    putStrLn "Hello World1"
    putStrLn "Hello World2"
    putStrLn "Hello World3"

-- ==================================================================== variables (actualy constants)
myMessage :: String -- declaration not necessary
myMessage = "Hello World"
main = putStrLn myMessage -- Hello World

-- ==================================================================== functions
addMe :: Int -> Int -> Int -- declaration not necessary
addMe x y = x + y -- you can use any letters
result1 = print (addMe 1 3)
result2 = print (1 `addMe` 3) -- this also works

main = do
    result1 -- 4
    result2 -- 4
    print (addMe 1 3) -- 4
    print (1 `addMe` 3) -- 4

-- ====================================================================  custom data types
data Person = Person { 
    name :: String,
    address :: String,
    age :: Int
} deriving (Eq, Show)

-- ------- a function that operates on a structure
getAge :: Person -> Int
getAge (Person _ _ theAgeField) = theAgeField

-- ------- instatiation
brian = Person {name = "Brian Spinos", address = "123 Foo St", age = 27}
ana = Person {name = "Ana Claudia", address = "123 Foo St", age = 22}

-- ------- assigning a value to a variable (constant)
brianAge = print (getAge brian)

-- ------- the main function
main = do
    print brian  -- Person {name = "Brian Spinos", address = "123 Foo St", age = 27}
    brianAge -- 27

-- ====================================================================  Enums ?
data Color = Red | Blue | Green

-- a function called 'say' which takes as a parameter a 'Color' and returns a string
say :: Color -> String

say Red = "You are Red!"
say Blue = "You are Blue!"
say Green =  "You are Green!"

main = print (say Red) -- "You are Red!"

-- ==================================================================== 
sumOfValues = sum [1..3]
myNegativeNumber = (-10)  -- needs parenthesis
myBoolean = not(True)
listOfNumbers = [3, 5, 7, 11]
listOfNames = ["brian", "ana", "rick", "sandra"]

-- Get the number in index 2
thirdNumber = listOfNumbers !! 1

-- Get the name in index 0
firstName = listOfNames !! 0

main = do
    print sumOfValues -- 6
    print myNegativeNumber -- -10
    print myBoolean -- False
    print thirdNumber -- 7
    print firstName -- "brian"

-- ==================================================================== importing libraries 
import Data.List -- importing libraries
import System.IO

main = putStrLn "Hello World"

-- ==================================================================== 

-- ====================================================================  
    
-- ====================================================================  
