{-# LANGUAGE InstanceSigs, FlexibleInstances #-}


module Foldable where

import Data.Foldable
import Data.Monoid
import Data.Functor.Identity

sum5 = fold [Sum 1, Sum 2, Sum 3]
sum5Monoid = (Sum 1 <> Sum 2 <> mempty)
sumMconcat = mconcat [Sum 1, Sum 2, mempty ]


-- Identity
id1 = foldMap (*4) (Identity 1) :: Sum Integer

-- Maybe
foldMapNothingSum = foldMap (*5) Nothing :: Sum Integer
-- Sum {getSum = 0}

foldMapNothingProd = foldMap (*5) Nothing :: Product Integer
-- Sum {getProduct = 1}


data Optional a = Nada | Yep a

instance Foldable Optional where
    foldMap _ Nada = mempty
    foldMap f (Yep a) = f a

yep1 = foldMap (+1) (Yep 1) :: Sum Int
nada1 = foldMap (+1) Nada :: Sum Int

sizeYep = length $ Yep 1
sizeYepArray = length $ Yep [1,2,3,4]
sizeNada = length $ Nada 

nullLeft = null $ Left 1
nullRight = null $ Right 1


-- Another Example
data Tree a = Empty
            | Leaf a
            | Node (Tree a) a (Tree a)
  deriving (Show)

instance Foldable Tree where
   foldMap :: Monoid m => (a -> m) -> Tree a -> m
   foldMap _ Empty = mempty
   foldMap f (Leaf x) = f x
   foldMap f (Node l x r) = foldMap f l <> f x <> foldMap f r

tree = Node (Node (Leaf 1) 2 (Leaf 3)) 4 (Node (Leaf 5) 6 (Leaf 7))


---- Exercises
-- 1.
sum' :: (Foldable t, Num a) => t a -> a
sum' = getSum . foldMap Sum

product' :: (Foldable t, Num a) => t a -> a
product' = getProduct . foldMap Product

--elem' :: (Foldable t, Eq a) => a -> t a -> Bool
--elem' a = getAny . foldMap Any . fmap (== a) 
