module Learn where 
-- Definitions and Basic implementations
sayHello :: String -> IO ()
sayHello x = putStrLn ( "Hello, " ++ x ++ "!!" )

--- Definitions
triple :: Int -> Int
half :: Float -> Float
square :: Int -> Int
area :: Int -> Float
---

triple x = (*) x 3
half x = (/) x 2
square x = x * x
area x = pi * fromIntegral(square x)

areaCircle d = pi * (r * r)
  where r = d / 2

--- Example of Main
main :: IO ()
main = do
  putStrLn "Count to four for me:"
  putStr "One, two"
  putStr ", three, and"
  putStrLn " Four"
