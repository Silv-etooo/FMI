{--
    week 9. task 3
    Define a predicate that checks whether a non-negative number is a palindrome.
--}

main :: IO()
main = do
    print $ isPalindrome 6 == True
    print $ isPalindrome 1010 == False
    print $ isPalindrome 505 == True
    print $ isPalindrome 123321 == True
    print $ isPalindrome 654 == False   

isPalindrome :: Int -> Bool
--isPalindrome x = if x == (reversed x 0) then True else False
isPalindrome x = x == reversed x 0

reversed :: Int -> Int -> Int
reversed x y
 | x == 0 = y
 | otherwise = reversed (div x 10) (y*10 + (mod x 10))