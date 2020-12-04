module Lists where

-- Imports
import Data.Char

getThisForThat ::  (a -> b -> c) -> b -> a -> c
getThisForThat = flip

eftBool :: Bool -> Bool -> [Bool] 
eftBool x y = (x : y : []) 

eftOrd :: Ordering -> Ordering -> [Ordering] 
eftOrd x y = go x [] 
    where go a arr
            | a < y = go (succ a) (arr ++ [a]) 
            | otherwise = arr ++ [a]

eftInt :: Int -> Int -> [Int] 
eftInt x y = go x []
    where go a arr
            | a <= y = go (a + 1) (arr ++ [a]) 
            | otherwise = arr

eftChar :: Char -> Char -> [Char] 
eftChar x y = go x []
    where go a arr
            | a <= y = go (succ a) (arr ++ a : [])
            | otherwise = arr


-- The Fearful Symmetry
splitWords :: String -> Char -> [String]
splitWords words char = go words []
    where go y array
            | y == "" = array
            | otherwise = go (drop 1 (dropWhile (/=char) y)) (array ++ [(takeWhile (/=char) y)])

myWords :: String -> [String]
myWords x = splitWords x ' '

firstSen = "Tyger Tyger, burning bright\n" 
secondSen = "In the forests of the night\n" 
thirdSen = "What immortal hand or eye\n" 
fourthSen = "Could frame thy fearful symmetry?" 
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

-- putStrLn sentences -- should print -- Tyger Tyger, burning bright
-- In the forests of the night
-- What immortal hand or eye
-- Could frame thy fearful symmetry?
-- Implement this
myLines :: String -> [String] 
myLines x = splitWords x '\n'


-- What we want 'myLines sentences' to equal
shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?" ]

result = (myLines sentences == shouldEqual)

--
-- Filtering lists
--
--1. 
mult3Filter = filter (\x -> (rem x 3) == 0)
mult3List xs = [x | x <- xs, (rem x 3) == 0]

-- 2.
lengthAndMult3 = length . filter (\x -> (rem x 3) == 0)

-- 3. 
myFilter = filter (\x -> not (elem x ["the","a", "an"]))  . myWords
myFilterList xs = [x | x <- myWords xs, not (elem x ["the","a", "an"])]


--
-- Zipping lists
--
-- 1.
samesAsZip :: [a] -> [b] -> [(a, b)]
samesAsZip [] _ = []
samesAsZip _ [] = []
samesAsZip (x:xs) (y:ys) = (x,y) : samesAsZip xs ys

samesAsZipWith :: (a->b->c) -> [a] -> [b] -> [c]
samesAsZipWith _ [] _ = []
samesAsZipWith _ _ [] = []
samesAsZipWith f (x:xs) (y:ys) = f x y : samesAsZipWith f xs ys

samesAsZipRewritten = samesAsZipWith (,)


-- Chapter Exercises  -------
-- 1. filter uppers
filterUppers :: [Char] -> [Char]
filterUppers word = [x | x <- word, isUpper x]

firstCapital :: [Char] -> [Char]
firstCapital (x:xs) = toUpper x : xs

capitalize :: [Char] -> [Char]
capitalize [] = []
capitalize (x:xs) = toUpper x : capitalize xs

capitalizeHead = head . capitalize
