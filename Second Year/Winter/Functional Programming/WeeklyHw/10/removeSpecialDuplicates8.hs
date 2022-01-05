import Data.Char
{--
    week 10. task 8
    Define a function that accepts a string and removes all duplicate letters

    Two characters are duplicate, if:
    - they represent the same character;
    - they are next to each other;
    - the first is upper-case and the second - lower-case (or vice versa).
--}

main :: IO()
main = do
    print $ reduceStr "dabAcCaCBAcCcaDD"  == "dabCBAcaDD" -- dabA cC aCBAcCcaDD -> dab Aa CBAcCcaDD -> dabCBA cC caDD -> dabCBAcaDD

reduceStr :: String -> String
reduceStr txt = helper txt 0
 where 
    helper :: [Char] -> Int -> String
    helper xs i
     | (i+1) == length xs =  xs
     | isLower (xs !! i) && isUpper (xs !! (i+1)) && ((xs !! i) == toLower (xs !! (i+1))) = helper ((take i xs) ++ (drop (i+2) xs)) (i-1)
     | isUpper (xs !! i) && isLower (xs !! (i+1)) && (toLower (xs !! i) == (xs !! (i+1))) = helper ((take i xs) ++ (drop (i+2) xs)) (i-1)
     | otherwise = helper xs (i + 1)

