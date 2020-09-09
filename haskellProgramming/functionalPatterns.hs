module FunctionalPatteerns where

--- Exercises Grab Bag
addOneIfOdd n = case odd n of 
                  True -> f n
                  False -> n 
                  where f = \n -> n + 1

addFive = \x -> \y -> (if x > y then y else x) + 5


-- Registered Users
newtype Username = Username String
newtype AccountNumber = AccountNumber Integer

data User = UnregisteredUser
            | Registered Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn"Unregistered"
printUser (Registered (Username name) (AccountNumber number))
    = putStrLn $ name ++ " # " ++ show number

-- Where Penguins lives
data WherePenguinsLive =
    Galapagos
    | Antarctica
    | Australia
    | SouthAfrica
    | SouthAmerica deriving (Eq, Show)

data Penguin =
    Peng WherePenguinsLive deriving (Eq, Show)

isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _ = False

whereThePenguinsLive :: Penguin -> WherePenguinsLive
whereThePenguinsLive (Peng whereItLives) = whereItLives


-- Rewrite to Case expressions
-- functionC x y = if (x > y) then x else y
functionC x y = case f of
              True -> x
              False -> y
              where f = x > y

nums x = case compare x 0 of 
           LT -> -1 
           GT -> 1
           EQ -> 0

-- Exercises Guard Duty
avgGrade :: (Fractional a, Ord a) => a -> Char 
avgGrade x
  | y>=0.9 ='A' 
  | y>=0.8 ='B' 
  | y>=0.7 ='C' 
  | y >= 0.59 = 'D' 
  | otherwise ='F' 
  where y = x / 100

--------------------
-- Chapter Exercises
--------------------
-- TensDigit use divMod
tensDigit :: Integral a => a -> a
--tensDigit' x = d
--    where xLast = x `div` 10
--          d = xLast `mod` 10
tensDigit = snd . (`divMod` 10) . (`div` 10)

-- Huns Digit
hunsDigit :: Integral a => a -> a
hunsDigit = snd . (`divMod` 10) . (`div` 100)

-- foldBool using case
foldBool :: a -> a -> Bool -> a
foldBool x y z =  case z of 
                    True -> x 
                    False -> y
-- Pattern Mathching over tuples
g :: (a->b) -> (a,c) -> (b,c)
g f (a,c) = (f a, c)
gApplied = g (*1000)

-- pointfree
roundTrip :: (Show a, Read a) => a -> a 
roundTrip a = read (show a)


roundTripPF :: (Show a, Read a) => a -> a 
roundTripPF = read . show


roundTripNext :: (Show a, Read b) => a -> b
roundTripNext = read . show  
printTo x = print ((roundTripNext x) :: Int)
