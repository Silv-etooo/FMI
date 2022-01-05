{--
    week 9. task 1
    Define a function that returns the average of the sum of the squares of two whole numbers.
--}


main :: IO()
main = do
    print $ sqAvg 5 0 == 12.5
    print $ sqAvg 10 13 == 134.5

sqAvg :: Int -> Int -> Double
sqAvg x y = (fromIntegral $ x*x + y*y) /2