import Data.List
{--
    week 10. task 3
    Define TWO functions - mergeLinearRec and mergeXs. They accept two sorted lists and combine them into one that is also sorted.

        mergeLinearRec should implement a linear recursive process!
        mergeXs should have only list manipulations!
        mergeXs should be solved with ONE line of code!
--}

main :: IO()
main = do
    print $ mergeLinearRec [1, 2, 3] [2, 3, 4, 5, 6]  == [1, 2, 3, 4, 5, 6]
    print $ mergeLinearRec [1, 2, 3] [2] == [1, 2, 3]
    print $ mergeLinearRec [1, 2, 3] [7, 8, 9] == [1, 2, 3, 7, 8, 9]
    print $ mergeLinearRec [2, 3, 4, 5, 6] [1, 2, 3] == [1,2,3,4,5,6]
    print $ mergeLinearRec [2] [1, 2, 3] == [1,2,3]
    print $ mergeLinearRec [7, 8, 9] [1, 2, 3] == [1,2,3,7,8,9]
    print $ mergeLinearRec [7, 9, 11] [8, 10, 12] == [7,8,9,10,11,12]

    print $ mergeXs [1, 2, 3] [2, 3, 4, 5, 6] == [1, 2, 3, 4, 5, 6]
    print $ mergeXs [1, 2, 3] [2] == [1, 2, 3]
    print $ mergeXs [1, 2, 3] [7, 8, 9] == [1, 2, 3, 7, 8, 9]
    print $ mergeXs [2, 3, 4, 5, 6] [1, 2, 3] == [1,2,3,4,5,6]
    print $ mergeXs [2] [1, 2, 3] == [1,2,3]
    print $ mergeXs [7, 8, 9] [1, 2, 3] == [1,2,3,7,8,9]
    print $ mergeXs [7, 9, 11] [8, 10, 12] == [7,8,9,10,11,12]




mergeLinearRec :: [Int] -> [Int] -> [Int]
mergeLinearRec [] ys = ys
mergeLinearRec xs [] = xs
mergeLinearRec (x:xs) (y:ys)
 | x < y = x : mergeLinearRec xs (y : ys)
 | y < x = y : mergeLinearRec (x : xs) ys
 | otherwise = x : mergeLinearRec (xs) (ys)


--before email
{--
mergeLinearRec :: [Int] -> [Int] -> [Int]
mergeLinearRec xs ys = helper xs ys 
 where
    helper :: [Int] -> [Int]  -> [Int]
    helper xs ys
     | null xs = ys
     | null ys = xs
     | head xs < head ys = [head xs] ++ helper (tail xs) ys
     | head ys < head xs = [head ys] ++ helper xs (tail ys)
     | head xs == head ys = [head xs] ++ helper (tail xs) (tail ys)
--}


mergeXs :: [Int] -> [Int] -> [Int]
mergeXs xs ys = sort $ nub $ xs ++ ys