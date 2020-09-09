module Recursion where

import Data.List (intersperse)

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times -1) n)


applyTimes :: (Eq a, Num a) => a -> (b->b) -> b -> b
applyTimes 0 f b = b
-- Y combinator
applyTimes n f b = f (applyTimes (n - 1) f b)

incTimes' :: (Eq a, Num a) => a -> a -> a
-- times is n function is increment by one and b is n
incTimes' times n = applyTimes times (+1) n

f :: Bool -> Int
f True = error "Error"
f False = 0

f' :: Bool -> Maybe Int
f' False = Just 0
f' _ = Nothing

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci(x-1) + fibonacci(x-2)

fibonacci' n
           | n < 2 = n
           | otherwise = fibonacci'(n-1) + fibonacci'(n-2)

fibonacci'' x = go x
    where go n
            | n == 0 = 0
            | n == 1 = 1
            | otherwise = go(n-1) + go(n-2)

dividedBy :: Integer -> Integer -> (Integer, Integer)
dividedBy num denom = go num denom 0
    where go n d count
            | n < d = (count, n)
            | otherwise = go (n-d) d (count + 1)


-- Exercises
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy = flip cattyConny
appendCatty = cattyConny "woops"
frappe = flippy "haha"

sumRecursive' :: Integer -> Integer
sumRecursive' 0 = 0
sumRecursive' x = x + sumRecursive'(x-1)

sumRecursive :: Integer -> Integer
sumRecursive x = go 0 x
    where go acum num
            | num == 0 = acum
            | otherwise = go (acum + num) (num - 1)

---- Tests
testNums = [1,2,3,4,5]
compareSumFunctions x = sumRecursive x == sumRecursive' x
-- map compareSumFunctions testNums

multiplyBy :: Integer -> Integer -> Integer
multiplyBy x y = go x y 0
    where go mult mult2 acum
            | mult2 == 0 = acum
            | otherwise = go mult (mult2 - 1) (acum + mult)


-- intersperse a -> [a] -> [a]
digitToWord :: Int -> String
digitToWord n 
    | n == 0 = "zero"
    | n == 1 = "one"
    | n == 2 = "two"
    | n == 3 = "three"
    | n == 4 = "four"
    | n == 5 = "five"
    | n == 6 = "six"
    | n == 7 = "seven"
    | n == 8 = "eight"
    | n == 9 = "nine"
    | otherwise = ""

digits :: Int -> [Int]
digits n = go n []
    where go n acum
            | (div n 10) == 0 = (mod n 10):acum
            | (div n 10) > 0 = go (div n 10) ((mod n 10):acum)

wordNumber :: Int -> String
wordNumber n = concat.(intersperse "-") $ map (\x -> digitToWord x) (digits n)
