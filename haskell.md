# Haskell Notes

## Basics

load package with ghci
`ghci`
`:l packagename`

### Functions

Everything is a function. `*` is a function that takes two numbers and multiplies them. 
*Infix* function -> `1 * 2`
- a function can be called as an infix if it has two parameters... So `div 21 10` becomes `92 \`div\` 10`
*Prefix* function -> min 8
*Definition* -> hello
- no parameters

- functions are called by writing the function name, a space, then the parameters, separated by spaces.
- parentheses are only used when doing g(f(x)) function calls
- function order doesn't matter in Haskell
- ' doesn't have special meaning in Haskell syntax. Often used for: strict functions (not lazy) or modified function or variable
- functions can't start with uppercase letters

### Lists

#### String Lists

```haskell
jokes :: [String]
jokes = ["when yo momma wore yellow, they yelled 'taxi'"]
```

#### Numeric Lists

e.g.
`let lostNums = [2, 4, 6, 8]`

- "hello" is syntactic sugar for ['h', 'e', 'l', 'l', 'o']

#### Working with lists

- `++` join two lists; not great for huge lists
- inserting with `:` is insantaneous. e.g. `5:[1, 2, 3, 4, 5] -> [5, 1, 2, 3, 4, 5]`

- `head [5, 4, 3, 2, 1]` => 5
- `tail [5, 4, 3, 2, 1]` => [4, 3, 2, 1]
- `last [5, 4, 3, 2, 1]` => 1
- `init [5, 4, 3, 2, 1]` => [5, 4, 3, 2]
- `length [5, 4, 3, 2, 1]` => 5
- `null [1, 2, 3]` => False || `null []` => True
- `reverse [5, 4, 3, 2, 1]` => [1, 2, 3, 4, 5]
- `maximum [5, 4, 3, 2, 1]` => 5
- `minimum [5, 4, 3, 2, 1]` => 1
- `sum [5, 4, 3, 2, 1]` => 15
- `product [6, 2, 1, 2]` => 24
- `elem 4 [3, 4, 5, 6]` => True (check if elem is in array)
- `10 \`elem\` [3, 4, 5, 6]` => False

##### take
takes a number and a list. It extracts n number of elements from the beginning of the list.
- `take 3 [5, 4, 3, 2, 1]` => [5, 4, 3]
- `take 1 [3, 9, 3]` => [3]
- `take 5 [1, 2]` => [1, 2]
- `take 5 [1, 2]` => [1, 2]

##### drop
drops n number of elements from the beginning of the list 
- `drop 3 [5, 4, 3, 2, 1]` => [2, 1]
- `drop 0 [3, 9, 1]` => [3, 9, 1]
- `drop 100 [3, 9, 1]` => []

##### Empty Lists Errors
```haskell
ghci> head []  
*** Exception: Prelude.head: empty list  
```

##### Texas Ranges
`ghci > [1..20]` => returns an array of all the values from 1 to 20, inclusive
`ghci > [2,4..20]` => [2, 4, 6, 8, 10, 12, 14, 16, 18, 20] - you can specify a step
- note: watch out when using floats. They are not completely precise by definition so their use in ranges can lead to weird outputs. *Not recommended*
    e.g. 
```bash
ghci> [0.1, 0.3 .. 1]  
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]
```

- *cycle* `ghci > take 10 (cycle [1,2,3])` -> [1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
    - takes a list and cycles it to an infinite list. You have to slice it to make it stop at a given point
- `take 10 (repeat 5)` -> [5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
    - takes an element and produces an infinite list of just that element.

## Logical operators

!= is actually /= in Haskell
|| -> or, && -> and, if condition then a else b

## Types
polymorphic functions - functions with type variables (similar to generics in other languages)
e.g. 
```
ghci> :t head  
head :: [a] -> a  
```

typeclasses - interfaces, but better
```
ghci> :t (==)  
(==) :: (Eq a) => a -> a -> Bool  
```
- all operators are functions, the above checks the type of the equality operator function

#### enums

enum members are sequentially ordered types; used in list ranges

#### Bounded
bounded members have an upper and lower bound

#### Nums
num is a numeric typeclass, so whole numbers are "polymorphic constants" TODO
- includes all numbers

`Integral` - a numeric typeclass that includes only integral/whole numbers (Int, Integer)

## Pattern Matching

non-exhaustive pattern; means we need to always include a catch-all pattern when making patterns

## Typeclass
*type constructor* - takes types as parameters to produce new types

`data Maybe a = Nothing | Just a  `

## Functors, Applicative Functors, and Monoids

### Typeclasses

- type names need to be capitalized
- define a new data type
```Haskell
data Bool = False | True  
```
data type = value constructors (False or True ^)
`data Shape = Circle Float Float Float | Rectangle Float Float Float Float` 
Circle constructor with 3 params


`data Shape = Circle Float Float Float | Rectangle Float Float deriving (Show)` -> make the data declaration part of the Show typeclass

Currying - `map (Circle 10 20) [4, 5, 6, 6]` -> creates new array of Circles with 4, 5, 6, 6 as the last argument for each of the new shapes (len array is 4)

> Not exporting the value constructors of a data types makes them more abstract in such a way that we hide their implementation. Also, whoever uses our module can't pattern match against the value constructors.

### Functor Typeclass
don't forget typeclass == fancy interface
- functor - things that can be mapped over
```haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
```

` (==) :: (Eq a) => a -> a -> Bool` -> a is a concrete type

### Record Syntax
`data Car = Car {company :: String, model :: String, year :: Int} deriving (Show)`
```Haskell
data Car = Car { company :: String
    , model :: String
    , year :: Int
    } deriving (Show)
```
which is the same as
`data Car = Car String String Int deriving (Show)`

### Type Parameters/Maybe
- not a concrete type - polymorphic
- a type constructor that takes one parameter to produce a concrete type

```haskell
data Person a b c = Person
  { username :: a,
    color :: b,
    editor :: c
  }
```
you might write a type constructor with type parameters if our data type will work regardless of the type of the value that it holds. 

`'a'` == type `Maybe Char`
`[Int]` is ok, but you can't have `[]`

## Monads

## Chat Tips
> Derek Banas' tutorials are really good. He does an hour of going through a language with a set of steps which make it like a rosetta stone of programming languages. So in an hour you just get bombarded with info on on your way to learning the language. It would be worth just looking at his Haskell tutorial (usually they are all just an hour)

## Piq Tips
`ghci > leapYear _` -> get information about what parameters are expected
`ghci > :t leapYear` -> get type of a function
- we like to declare types first, then implement, for readibility, maintainability
- if you don't know the implementation, you can define the types then just leave the implementation as `undefined` and the compiler will be happy to ignore it. so like `leapYear x = undefined`

## Phaazon Tips
- `ghci > :i leapYear` -> get information of a type

# Questions
> Still, here's a quick refresher: Functors are things that can be mapped over, like lists, Maybes, trees, and such. In Haskell, they're described by the typeclass Functor, which has only one typeclass method, namely fmap, which has a type of fmap :: (a -> b) -> f a -> f b. It says: give me a function that takes an a and returns a b and a box with an a (or several of them) inside it and I'll give you a box with a b (or several of them) inside it. It kind of applies the function to the element inside the box.
- I kind of get it because it's saying that to be mappable (!iterable bc order doesn't matter) means to process one thing at a time. What's confusing me right now is `f a` because I *think* it's saying `f a` is the parameter... Which makes sense because everything is a function... So it's basically saying it can be any single thing (any single function that takes a single parameter)
