-- Data declaration
data Mood = Blah | Woot deriving Show
--
-- Type declaration
changeMood :: Mood -> Mood

-- Term Level
changeMood Blah = Woot
changeMood _ = Blah


-- Exercises
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]

expectedLA = length awesome == 3
expectedLAA = length alsoAwesome == 2
expectedLALL = length allAwesome == 2
expectedLCONCAT = length (concat allAwesome) == 5


expected1 = length allAwesome + length awesome == 5 -- works
expected2 = (8 == 8) && ('b' < 'a') == False -- works


isPalindrome :: (Eq a) => [a] -> Bool -- Important the constraint (Eq) otherwise cannot use == operator
isPalindrome x = reverse x == x 


myAbs :: Integer -> Integer
myAbs x = if x < 0 then x * (-1) else x

f :: (a,b) -> (c,d) -> ((b,d), (a,c))
f x y = ((snd x, snd y), (fst x, fst y))


-- How to convert an array to tuple
-- 1. fromArrayToTuple :: (Integral a) => [a] -> (a,a)
fromArrayToTuple :: (Integral a) => [a] -> (a,a)
fromIntArrayToTupleToInt :: (Integral a, Num b) => [a] -> b


fromArrayToTuple x = (x !! 0, x !! 1)
fromIntArrayToTupleToInt x = fromIntegral(fst (fromArrayToTuple x))
-- fromIntArrayToTupleToInt x = fst (fromArrayToTuple x)

