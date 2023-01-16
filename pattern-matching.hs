lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "sorry, you're out of luck, loser!"

-- can i use a list and see if value is in list
oneToFive :: (Integral a) => a -> String
oneToFive x = if x <= 5 && x > 0 then "you did ok" else "you suck, do better"

-- oneToFive 1 = "you did ok"
-- oneToFive 2 = "you did ok"
-- oneToFive 3 = "you did ok"
-- oneToFive 4 = "you did ok"
-- oneToFive 5 = "you did ok"
-- oneToFive x = "you suck, do better"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

getRandomJoke :: [String] -> String
getRandomJoke = jokes

jokes :: [String]
jokes = ["when yo momma wore yellow, they yelled 'taxi'", "yoo momma said are you even listening, weird way to start a convo", "Yo momma's so fat and old when God said, 'Let there be light,' he asked your mother to move out of the way.", "yo mama so stupid it took her a hour to cook minute rice", "Yo momma is so fat, I took a picture of her last Christmas and it's still printing.", "yo mama so fat, she goes over 80 char limit", "yo mama so fat she has 2 ZIP codes"]
