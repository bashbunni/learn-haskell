main :: IO () 
main = do
    urMom

urMom :: IO ()
urMom = do
    putStrLn "What's your name miiista"
    name <- getLine

    putStrLn ("Well, " ++ name ++ " guess what? ur mom")


sumListItr xs = sum [ x | x <- xs ]
length' xs = sum [1 | _ <- xs]  -- where we don't care about the value of the element 

sumList :: [Int] -> Int
sumList [] = 0  
sumList (x:xs) = x + sumList xs

    -- return the sum of the list 
    
