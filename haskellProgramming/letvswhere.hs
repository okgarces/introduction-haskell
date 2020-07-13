module LetVsWhere where 

-- using where declares plusTwo
printInc n = print plusTwo
  where plusTwo = n + 2

-- Using let and a list of expressions
printIncLet n = let plusTwo = n + 2
                in print plusTwo

-- Let and where exercises
exer1Let = let x = 3; y = 1000 in 3 * x + y
exer1 = 3 * x + y
  where x = 3
        y = 1000

---- Chapter Exercises
z = 7
x = y ^ 2
waxOn = x * 5
y = z + 8
-- As a where
waxOnWhere = 5 * innerOperation
  where innerOperation = ((7 + 8) ^ 2)

triple x = 3 * x

waxOff x = triple x
