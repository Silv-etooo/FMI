{--
    week 9. task 7
    Define a predicate that checks whether a number is perfect.
        Implementation detail: Use list comprehension.
        Note: A number is perfect if and only if it is natural and equal to the sum of its divisors excluding the number itself.
--}

main :: IO()
main = do
    print $ isPerfect 1 == False
    print $ isPerfect 6 == True
    print $ isPerfect 495 == False
    print $ isPerfect 33550336 == True

isPerfect :: Int -> Bool
isPerfect x = if x > 0 && x == sum[y | y <- [1 .. x-1], mod x y == 0 ]  then True else False