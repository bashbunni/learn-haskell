-- record syntax
data Person = Person
  { username :: String,
    color :: String,
    editor :: String
  }
  deriving (Show)

george = Person "torontogeorge" "red" "Notepad"

ikiris = Person "ikiris" "red" "emacs"

describe :: Person -> String
describe (Person {username = u, color = c, editor = e}) = u ++ " likes " ++ c ++ " uses " ++ e

-- Algebraic Data Types
-- data Person = Person String String String deriving (Show)
-- username :: Person -> String
-- username (Person username _ _) = username
-- color :: Person -> String
-- color (Person _ color _) = color
-- editor :: Person -> String
-- editor (Person _ _ editor) = editor
