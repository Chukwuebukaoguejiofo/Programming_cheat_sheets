-- https://learnxinyminutes.com/docs/haskell/
-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses ???


-- ------------------------------------------------------ functions
add x y = x + y

main = print (add 1 3)
-- main = print (2 `add` 3) -- this also works
-- ------------------------------------------------------ custom datatyps

data Color = Red | Blue | Green

-- a function called 'say' which takes as a parameter a 'Color' and returns a string
say :: Color -> String

say Red = "You are Red!"
say Blue = "You are Blue!"
say Green =  "You are Green!"

main = print (say Red)
-- ------------------------------------------------------ function declaration ???
addMe :: Int -> Int -> Int

addMe x y = x + y


x :: String
x = "aaa"
main = putStrLn x
-- main = print (addMe 4 5)


-- ------------------------------------------------------
main = putStrLn "hello world"

-- ------------------------------------------------------
data Player = Player String



-- ------------------------------------------------------


-- ------------------------------------------------------
import Data.List
import System.IO

-- dont use 'let' here, just in the REPL

addMe :: Int -> Int -> Int
addMe x y = x + y
x = addMe 1 3

sumOfVals = sum [1..10]
neg = (-10)  -- needs parenthesis
notTrue = not(True)
list = [3,5,7,11]

-- Get the number in index 1
index1 = list !! 1



data Employee = Employee { name :: String,
                           position :: String,
                           idNum :: Int
                           } deriving (Eq, Show)

samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 1000}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 1001}


myGetId :: Employee -> Int
myGetId (Employee _ _ b) = b

foo = print (myGetId samSmith)


main = do
    print index1
    print notTrue
    print x
    print samSmith  -- Employee {name="SamSmith", position="Manager", idNum=1000}
    foo -- 1000




