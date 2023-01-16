data Person = Person String String String deriving (Show)
george = Person "torontogeorge" "red" "Notepad"
ikiris = Person "ikiris" "red" "emacs"

username :: Person -> String  
username (Person username _ _ ) = username  
  
color :: Person -> String  
color (Person _ color _) = color  
  
editor :: Person -> String  
editor (Person _ _ editor) = editor  
