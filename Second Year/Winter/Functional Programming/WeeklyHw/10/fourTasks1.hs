{--
    week 10. task 1
    Define a function that accepts a list of whole numbers - xs and a number - n and:

        adds that number to every element in the list;
        calculates (x + n)2 using function composition (x spans xs).
        divides every number in xs by n. The declaration should be divByN :: [Int] -> Int -> [Double];
        removes all numbers smaller than n from xs.

    All implementations should use partial function application!
    Include a test case where n is a negative number in *divByN*!
--}

main :: IO()
main = do
    print $ addN [1, 2, 3, 4, 5] 9999999999999999999999 == [10000000000000000000000,10000000000000000000001,10000000000000000000002,10000000000000000000003,10000000000000000000004]
    print $ sqAddN [1, 2, 3, 4, 5] 5 == [36,49,64,81,100]
    print $ divByN [1, 2, 3, 4, 5] 5 == [0.2,0.4,0.6,0.8,1.0]
    print $ divByN [1, 2, 3, 4, 5] (-5) == [-0.2,-0.4,-0.6,-0.8,-1.0]
    print $ filterByN [1, 2, 3, 4, 5] 3 == [3,4,5]


addN :: [Integer] -> Integer -> [Integer]
addN xs n = map( + n) xs

sqAddN :: [Integer] -> Integer -> [Integer]
sqAddN xs n = map (^2 ) $ map( + n) xs

divByN :: [Int] -> Int -> [Double]
divByN xs n = map( / (fromIntegral n)) $ map (fromIntegral)xs

filterByN :: [Int] -> Int -> [Int]
filterByN xs n = filter ( >= n ) xs