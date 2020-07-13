module Strings where
--- First
firstExercise x = tail x
firstExercise1 x = drop 1 x
firstExerciseA x = concat [x, "!"]
firstExerciseB x = (!!) x 5
firstExerciseC x = drop 9 x

thirdLetter :: [Char] -> Char
letterIndex :: Int -> Char
thirdLetter x = (!!) x 2
letterIndex x = curryIsAwesome !! x 

curryIsAwesome = "Curry is awesome"
rvrs  = concat [drop9 curryIsAwesome, drop5 (take9 curryIsAwesome), take5 curryIsAwesome]
    where take5 x = take 5 x
          take9 x = take 9 x
          drop9 x = drop 9 x
          drop5 x = drop 5 x
