import Data.Char
{--
    week 10. task 2
    Define a function sumSpecialPrimes n d that returns the sum of the first n 
    prime numbers that contain a digit d.

--}

main :: IO()
main = do
    print $ sumSpecialPrimes 5 2  == 392
    print $ sumSpecialPrimes 5 3  == 107
    print $ sumSpecialPrimes 10 3  == 462


sumSpecialPrimes :: Int -> Int -> Int
sumSpecialPrimes n d = helper n d 0 0 
 where
    helper :: Int -> Int -> Int -> Int -> Int
    helper 0 _ _ sum = sum
    helper n d num sum
     | isPrimeContainD num d = helper (n-1) (d) (num + 1) (sum + num)
     | otherwise = helper (n) (d) (num + 1) (sum)

isPrimeContainD :: Int -> Int -> Bool
isPrimeContainD x d =  ( 2 == length [y | y <- [1 .. x], mod x y == 0 ]) && (elem (intToDigit d) $ show x)

-- before email
{--
sumSpecialPrimes :: Int -> Int -> Int
sumSpecialPrimes n d = helper n d 0 0 
 where
    helper :: Int -> Int -> Int -> Int -> Int
    helper 0 _ _ sum = sum
    helper n d num sum = helper (if (isPrimeContainD num d ) then (n-1) else n) (d) (num + 1) (if (isPrimeContainD num d) then (sum + num) else sum)

isPrimeContainD :: Int -> Int -> Bool
isPrimeContainD x d =  ( 2 == length [y | y <- [1 .. x], mod x y == 0 ]) && (elem (intToDigit d) $ show x)
--}