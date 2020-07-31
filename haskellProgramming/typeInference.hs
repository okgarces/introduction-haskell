module Types where

-- What would happen with an impossible function
impossible :: (Fractional a, Integral a) => a -> a
impossible x = x + 1.0

f :: Num a => a -> a -> a
f x y = x + y + 3

myConcat x = x ++ "YO"
myMult x = (x/3) * 5

example = 1

exercise1a = (* 9) 6
exercise1b = head [(0,"doge"),(1,"kitteh")]
exercise1c = head [(0 :: Integer ,"doge"),(1,"kitteh")] 
exercise1d = if False then True else False
exercise1e = length [1, 2, 3, 4, 5]
exercise1f = (length [1, 2, 3, 4]) > (length "TACOCAT")


-- Fix the code First
-- fstString :: [Char] ++ [Char]
fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

-- sndString :: [Char] -> Char
sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

--sing = if (x > y) then fstString x or sndString y
sing = if (x > y) then fstString x else sndString y
        where x = "Singin"
              --x = "Somewhere"
              y = "Somewhere"

--- Fix the code Second
main :: IO () 
--Main = do
main = do
    print (1 + 2)
    -- putStrLn 10
    putStrLn "10"
    -- print (negate -1) 
    print (negate (-1))
    print ((+) 0 blah) 
        where blah = negate 1


-- Complete the Code First
completeFirst_f :: Int -> String
completeFirst_f = undefined

completeFirst_g :: String -> Char
completeFirst_g = undefined

completeFirst_h :: Int -> Char
completeFirst_h x = completeFirst_g (completeFirst_f x) 

-- Complete The Code Second
data CompleteSecond_A 
data CompleteSecond_B 
data CompleteSecond_C

completeSecond_q :: CompleteSecond_A -> CompleteSecond_B
completeSecond_q = undefined

completeSecond_w :: CompleteSecond_B -> CompleteSecond_C
completeSecond_w = undefined

completeSecond_e :: CompleteSecond_A -> CompleteSecond_C 
completeSecond_e x = completeSecond_w (completeSecond_q x)

-- Complete The Code Third
data CompleteThird_X 
data CompleteThird_Y 
data CompleteThird_Z

completeThird_xz :: CompleteThird_X -> CompleteThird_Z 
completeThird_xz = undefined

completeThird_yz :: CompleteThird_Y -> CompleteThird_Z 
completeThird_yz = undefined

completeThird_xform :: (CompleteThird_X, CompleteThird_Y) -> (CompleteThird_Z, CompleteThird_Z) 
completeThird_xform (x,y) = (completeThird_xz x, completeThird_yz y)


-- Complete the Code Fourth
munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge xtoy ytowz x = fst (ytowz (xtoy x))


