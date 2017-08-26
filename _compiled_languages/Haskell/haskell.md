# Haskell


###### Type constructor

```Haskell

--  define a type  (like Int)


-- 'User' is a 'nullary type constructor'
data User = Name | LastName 

-- A type constructor may have zero or more arguments
data User x = Name x | LastName x 
```


###### Data/value constructor

```Haskell


-- with two nullary 'data/value constructors' True and False, or simply a constant
-- they are not types! but they are values
data Bool = False | True 

```


###### Functor

```
A Functor is any data type that defines how fmap applies to it.
```

###### Applicative

```Haskell

```

###### Monad

```Haskell

```


