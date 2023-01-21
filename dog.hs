-- breed color pettable
-- data Dog = Dog String String Bool

data Dog b c p = Dog
  { breed :: b,
    color :: c,
    pettable :: p
  }
  deriving (Show)
