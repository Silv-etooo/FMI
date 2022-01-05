{--
    week 10. task 4
    Define a function that returns a list of the prime numbers in a given interval.

        Use list comprehension wherever possible!
--}

main :: IO()
main = do
    print $ primesInRange 1 100 == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
    print $ primesInRange 100 1 == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]

primesInRange :: Int -> Int -> [Int]
primesInRange x y = [ z | z <- [ min x y  .. max x y], isPrime z]  


isPrime :: Int -> Bool
isPrime x =  2 == length [y | y <- [1 .. x], mod x y == 0 ] 