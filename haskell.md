# Haskell Notes

## Basics

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
##### take
takes a number and a list. It extracts n number of elements from the beginning of the list.
- `take 3 [5, 4, 3, 2, 1]` => [5, 4, 3]
- `take 1 [3, 9, 3]` => [3]
- `take 5 [1, 2]` => [1, 2]
- `take 5 [1, 2]` => [1, 2]
```haskell
ghci> head []  
*** Exception: Prelude.head: empty list  
```
