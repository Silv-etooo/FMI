{--
    week 10. task 5
    Define a function that takes a whole number and returns its ascending left suffix. 
    The ascending left suffix of a number is the number that forms a strictly ascending sequence, if read from right to left.

--}

main :: IO()
main = do
    print $ reverseOrdSuff 37563 == 36
    print $ reverseOrdSuff 32763 == 367
    print $ reverseOrdSuff 32567 == 7
    print $ reverseOrdSuff 32666 == 6   

reverseOrdSuff :: Int -> Int
reverseOrdSuff x = helper x []
 where
    helper :: Int -> [Int] -> Int
    helper 0 xs = fromDigits xs
    helper x [] = helper (div x 10) [mod x 10]
    helper x xs
     | mod x 10 > last xs = helper (div x 10) (xs ++ [mod x 10])
     | otherwise = fromDigits xs


{--
reverseOrdSuff :: Int -> Int
reverseOrdSuff x = helper x []
 where
    helper :: Int -> [Int] -> Int
    helper x xs
     | x == 0 = fromDigits xs
     | null xs = helper ( div x 10) ( xs ++ [mod x 10] )
     | mod x 10 > last xs = helper (div x 10) (xs ++ [mod x 10])
     | otherwise = fromDigits xs
--}
-- from
-- https://stackoverflow.com/questions/1918486/convert-list-of-integers-into-one-int-like-concat-in-haskell
fromDigits = foldl addDigit 0
   where addDigit num d = 10*num + d