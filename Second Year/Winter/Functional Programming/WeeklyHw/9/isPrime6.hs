{--
    week 9. task 6
    Define a predicate that checks whether a number is prime.
        solve using guards;
        solve using list comprehension in ONE line.
--}

main :: IO()
main = do
    print $ isPrimeG 1 == False
    print $ isPrimeG 2 == True
    print $ isPrimeG 3 == True
    print $ isPrimeG 6 == False
    print $ isPrimeG 61 == True

    print $ isPrimeLC 1 == False
    print $ isPrimeLC 2 == True
    print $ isPrimeLC 3 == True
    print $ isPrimeLC 6 == False
    print $ isPrimeLC 61 == True

isPrimeG :: Int -> Bool
isPrimeG x
 | x == 1 = False
 | x == 2 = True
 | otherwise = helper x 0 1
 where
    helper :: Int -> Int -> Int -> Bool
    helper x i num
     | i == x && num == 2 = True
     | num == 3 = False
     | otherwise = helper x (i+1) (if (mod x num == 0) then num+1 else num)
    -- why doesnt this work?
    --helper _ x 2 = True
    --helper _ _ 3 = False
    --helper x i num = helper x (i+1) (if (mod x num == 0) then num+1 else num)




isPrimeLC :: Int -> Bool
isPrimeLC x =  2 == length [y | y <- [1 .. x], mod x y == 0 ] 