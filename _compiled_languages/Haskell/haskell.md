# Haskell


###### Type constructor

```Haskell

--  define a type  (like Int)


-- Example of type constructors
-- Int, Integer, Float, Double, Bool, Char


-- 'User' is a 'nullary type constructor'
data User = Name | LastName 

-- A type constructor may have zero or more arguments
data User x = Name x | LastName x 


-- Maybe is a type constructor.
-- Maybe Int is a type.
-- Just is a value constructor.
-- Just 42 is a value.
```


###### Data/value constructor (or simple 'constructor')

```Haskell


-- with two nullary 'data/value constructors' True and False, or simply a constant
-- they are not types! but they are values
data Bool = False | True 


-- Here is an example of a type with just one data constructor: 
data Point a = Pt a a


-- Maybe is a type constructor.
-- Maybe Int is a type.
-- Just is a value constructor.
-- Just 42 is a value.
```



###### Typeclass  (Haskell's interfaces)

```Haskell
-- (A typeclass is a sort of interface that defines some behavior.)
-- (you can create custom typeclasses)

-- example of typeclasses:
-- Eq, Ord, Show, Read, Enum, Bounded, Num, Integral, Floating
-- Functor, Applicatiive, Monads, Monoids



-- declaration of a typeclass:
class YesNo a where  
    yesno :: a -> Bool 
    
-- an implementation:
instance YesNo Int where  
    yesno 0 = False  
    yesno _ = True 

-- the actual declaration of the 'functor' typeclass
class Functor f where  
    fmap :: (a -> b) -> f a -> f b 


```


###### Functor

```haskell
-- A functor is a typeclass (haskell's equivalent of an interface)
-- A Functor is any data type that defines how fmap applies to it.
-- functors: you apply a function to a wrapped value using fmap or <$>


-- the actual declaration of the 'functor' typeclass
class Functor f where  
    fmap :: (a -> b) -> f a -> f b 



```

###### Applicative

```Haskell
--  An applicative is a data type that implements the Applicative typeclass.
-- applicatives: you apply a wrapped function to a wrapped value using <*> or liftA

Just (+3) <*> Just 2 == Just 5
-- the functions are also wrapped in a context (Just)

```

###### Monad

```Haskell

```


###### Newtype (like an alias?)

```Haskell
newtype Natural = MakeNatural Integer
```









