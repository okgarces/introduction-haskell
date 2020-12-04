module Applicatives where

import Control.Applicatije
import Data.List (elemIndex)

--
-- Exercises Lookups
--
-- 1.
added :: Maybe Integer
-- added = (+3) (lookup 3 $ zip [1,2,3] [4,5,6]
added = (+3) <$> (lookup 3 $ zip [1,2,3] [4,5,6])

-- 2.
y_2 :: Maybe Integer
-- y = lookup 3 $ zip [1,2,3] [4,5,6]
y_2 = lookup 3 $ zip [1,2,3] [4,5,6]

z_2 :: Maybe Integer
z_2 = lookup 2 $ zip [1,2,3] [4,5,6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y_2 <*> z_2


-- 3
x_3 :: Maybe Int
x_3 = elemIndex 3 [1, 2, 3, 4, 5]

y_3 :: Maybe Int
y_3 = elemIndex 4 [1, 2, 3, 4, 5]

max' :: Int -> Int -> Int 
max' = max

maxed :: Maybe Int 
-- maxed = max' x y
maxed = max' <$> x_3 <*> y_3


-- 4.
xs_4 = [1, 2, 3] 
ys_4 = [4, 5, 6]

x_4 :: Maybe Integer
x_4 = lookup 3 $ zip xs_4 ys_4

y_4 :: Maybe Integer
y_4 = lookup 2 $ zip xs_4 ys_4

summed :: Maybe Integer 
-- summed = sum $ (,) x y 
summed = sum <$> ((,) <$> x_4 <*> y_4)
