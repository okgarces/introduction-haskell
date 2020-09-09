-- Chapter 6: Examples in Book
data Trivial = Trivial'
instance Eq Trivial where
    Trivial' == Trivial' = True

data DayOfWeek = Mon | Tue | Weds | Thu | Fri | Sat | Sun deriving Show
data Date = Date DayOfWeek Int deriving Show


instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Weds Weds = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _ = False

instance Eq Date where
    (==) (Date weekday dayOfMonth) (Date weekday' dayOfMonth') =
            weekday == weekday' && dayOfMonth == dayOfMonth'


--- Exercises
data TisAnInteger = TisAn Integer
data TwoIntegers = Two Integer Integer
data StringOrInt = TisAnInt Int | TisAString String
data Pair a = Pair a a
data Tuple a b = Tuple a b

instance Eq TisAnInteger where
    (==) (TisAn integer) (TisAn integer') =
        integer == integer'

instance Eq TwoIntegers where
    (==) (Two first second) (Two first' second') =
        first == first' && second == second'

instance Eq StringOrInt where 
    (==) (TisAnInt int) (TisAnInt int') =
        int == int'
    (==) (TisAString str) (TisAString str') =
        str == str'
    (==) _ _ = False

instance (Eq a) => Eq (Pair a) where 
    (==) (Pair a a') (Pair b b') =
        a == b && a' == b' 

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple a b) (Tuple a' b') =
        a == a' && b == b'


-- Chapte exercises
-- 1.
data Person = Person Bool deriving Show
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2.
data Mood = Blah | Woot deriving (Show, Eq)
settleDown x = if x == Woot then Blah else x

-- 4.
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)
s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


-- 5.
data Rocks = Rocks String deriving (Eq, Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)


-- Type-Known-Do Two
chk :: Eq b => (a->b) -> a -> b -> Bool
chk f a b = (f a) == b
example  = chk fromIntegral 4 5.0

arith :: Num b => (a->b) -> Integer -> a -> b
arith f int int' = f (int' + int)
exampleArith = arith ((/) 5) 5 4 -- Num 


