{--
    week 9. task 4
    Define a predicate that checks whether two numbers are amicable.

    Two numbers are amicable if the sum of the divisors of one of them is equal to the other.
--}

main :: IO()
main = do
    print $ areAmicable 200 300 == False
    print $ areAmicable 220 284 == True
    print $ areAmicable 284 220 == True
    print $ areAmicable 1184 1210 == True
    print $ areAmicable 2620 2924 == True
    print $ areAmicable 6232 6368 == True

areAmicable :: Int -> Int -> Bool
areAmicable x y = if (sumDiv x 1 0) == y || (sumDiv y 1 0) == x then True else False
    
sumDiv :: Int -> Int ->  Int -> Int
sumDiv x count sum
 | count == x = sum
 | otherwise = sumDiv x (count + 1) (sum + (if ((mod x count) == 0) then count else 0))