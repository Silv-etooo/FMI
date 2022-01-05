{--
    week 9. task 5
    Define a predicate that checks whether the digits of a non-negative whole number are ordered in an ascending order.
--}


main :: IO()
main = do
    print $ hasIncDigits 1244 == True
    print $ hasIncDigits 12443 == False


hasIncDigits :: Int -> Bool
hasIncDigits x
 | x < 10 = True
 | (mod (div x 10) 10) > (mod x 10) = False
 | otherwise = hasIncDigits (div x 10)