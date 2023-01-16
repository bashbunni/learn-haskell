module Shapes 
( Shape(..)
, surface
) where
 -- why do I need the .. -> it's exporting ALL the shapes

data Shape = Circle Float Float Float | Rectangle Float Float deriving (Show)

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x y) = x * y

