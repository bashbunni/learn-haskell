-- TODO: change this to not be an array
leapYear :: [Int] -> Bool
leapYear x = if x `mod` 4 == 0 && x `mod` 100 /= 0 || x `mod` 400 == 0 then True else False

rockPaperScissors :: [] -> [Int]
rockPaperScissors = 
data Choice = Rock | Paper | Scissors deriving (Enum)

