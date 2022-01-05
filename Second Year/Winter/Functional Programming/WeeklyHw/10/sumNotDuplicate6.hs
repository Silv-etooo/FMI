{--
    week 10. task 6
    Write a function that sums the unique numbers in the sublists of a list.

--}

main :: IO()
main = do
    print $ sumUnique [[1,2,3,2],[-4,-4],[5]] == 9 -- (= 1 + 3 + 5)
    print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] == 0
    print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]]  == 45


sumUnique :: [[Int]] -> Int
sumUnique xss = helper (concat xss) [] 
 where
    helper :: [Int] -> [Int] -> Int
    helper [] ys = sum ys
    helper (x:xs) ys
     | elem x xs = helper (filter (\ z -> z /= x) xs) ys
     | otherwise = helper xs (x : ys)

--before email
{--
sumUnique :: [[Int]] -> Int
sumUnique xss = helper (concat xss) [] 
 where
    helper :: [Int] -> [Int] -> Int
    helper xs ys
     | null xs = sum ys
     | elem (head xs) (tail xs) = helper (filter (\ x -> x /= (head xs)) (tail xs)) ys
     | otherwise = helper (tail xs) (head xs : ys )
--}