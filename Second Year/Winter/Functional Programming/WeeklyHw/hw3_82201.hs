import Data.List

main :: IO()
main = do 
    print $ willItFly [1, 4, 2, 3]  == True -- |1-4|=3,|4-2|=2,|2-3|=1
    print $ willItFly [1, 4, 2, -1, 6]  == False

    print $ formatDuration 0  == "now"
    print $ formatDuration 1 == "1 second"
    print $ formatDuration 62  == "1 minute and 2 seconds"
    print $ formatDuration 120  == "2 minutes"
    print $ formatDuration 3600  == "1 hour"
    print $ formatDuration 3662  == "1 hour, 1 minute and 2 seconds"

{-------------------------------------Домашна 3. Задача 1.----------------------------------------}
{--
    Докато подготвяли подаръците за Коледа, елфите на дядо Коледа
    осъзнали, че имат проблем: подаръците трябва да бъдат подредени по специален
    начин в шейната, за да може тя да лети във въздуха. 
    
    Всеки подарък има уникален номер – цяло число. Целта е абсолютните стойности 
    на разликите между номерата на всеки два съседни подаръка да заемат всички 
    стойности между 1 и n-1, където n е броят на подаръците за нареждане. 
    
    Въпреки че елфите могат да измислят
    комбинации от подредби, подаръците са твърде много, за да преценят дали ще успеят
    да ги наредят по правилен начин от първия път. Помогнете им, като дефинирате
    предикат willItFly :: [Int] -> Bool, който получава наредба, предложена от
    елфите, и проверява дали тя е валидна.
--}


-- idea: will make a list with all absolute values, sort it and compare it to a list (1 - n-1)
willItFly :: [Int] -> Bool
willItFly (x:xs) = (sort $ helper x xs []) == [1 .. (length xs) ]
 where
    helper :: Int -> [Int] -> [Int] -> [Int]
    helper _ [] ys = ys
    helper x1 (x2:xs) ys = helper x2 xs ((abs(x2-x1)):ys)

{----------------------------------Домашна 3. Задача 2.------------------------------------------}
{--
    Намирането на правилна наредба на подаръците обаче не било
    единственият проблем. Оказало се, че часовникът на шейната, който показва на дядо
    Коледа колко време му остава, докато стигне до следващото послушно дете, на което
    трябва да остави подарък, се е развалил. Вместо да показва времето като комбинация
    от години, дни, часове, минути и секунди, часовникът показва единствено броя
    оставащи секунди. Екипът на дядо Коледа отново се нуждае от вашата помощ.
    
    Знаейки, че една година има 365 дни и един ден има 24 часа, дефинирайте функция
    formatDuration :: Int -> String, която приема време, представено като брой
    секунди, и връща времето в описаната комбинация. Ако n е нула, да се връща "now".   
--}


-- idea: make a list with the specific  [x day, x hour, x min, x second]. then add the text to the list. then add punctuation ("," & "and")
formatDuration :: Int -> [Char]
formatDuration 0 = "now"
formatDuration x = addPunctuation ( addWordedTime [ div x (86400), div (x - (div x 86400) * 86400) (3600), div ((x - (div x 86400 ) * 86400 ) - (div (x - (div x 86400 ) * 86400 ) 3600 )* 3600) 60 , ((x - (div x 86400 ) * 86400 ) - (div (x - (div x 86400 ) * 86400 ) 3600 )* 3600) - (div ((x - (div x 86400 ) * 86400 ) - (div (x - (div x 86400 ) * 86400 ) 3600 )* 3600) 60) * 60  ] [ "day", "hour", "minute", "second"] [[]] ) 
 where 
    addWordedTime :: [Int] -> [[Char]] -> [[Char]] -> [[Char]]
    addWordedTime [] _ zs = zs
    addWordedTime (x:xs) (y:ys) zs
     | x == 0 = addWordedTime xs ys zs
     | x == 1 = addWordedTime xs ys (zs ++ [concat([(show x)] ++ [" "] ++ [y])])
     | otherwise = addWordedTime xs ys (zs ++ [concat([(show x)] ++ [" "] ++ [y] ++ ["s"])])

    addPunctuation :: [[Char]] -> [Char]
    addPunctuation (x:xs) = helper xs (length xs) [[]]
     where 
        helper :: [[Char]] -> Int -> [[Char]] -> [Char]
        helper xs 1 ys = concat(ys ++ xs)
        helper (x:xs) 2 ys = concat(ys ++ [x] ++ [" and "] ++ xs)
        helper (x:xs) n ys = helper xs (n-1) ( ys ++ [x] ++ [", "])

    
        
        
-- x
-- Days = div x 86400
-- if Days > 0 => Days "days"

-- noDays = x - Days * 86400        // x - (div x 86400 ) * 86400 
-- Hours = div noDays 3600          // div (x - (div x 86400 ) * 86400 ) 3600
-- if Hours > 0 => Hours "hours"

-- noHours = noDays -  Hours* 3600  // (x - (div x 86400 ) * 86400 ) - (div (x - (div x 86400 ) * 86400 ) 3600 )* 3600
-- Min = div noHours 60             // div ((x - (div x 86400 ) * 86400 ) - (div (x - (div x 86400 ) * 86400 ) 3600 )* 3600) 60
-- if Min > 0 => Min "minutes"

-- noMin = noHours - Min *60        // ((x - (div x 86400 ) * 86400 ) - (div (x - (div x 86400 ) * 86400 ) 3600 )* 3600) - (div ((x - (div x 86400 ) * 86400 ) - (div (x - (div x 86400 ) * 86400 ) 3600 )* 3600) 60) * 60
-- Sec = noMin 
-- if Sec > 0 => Sec "seconds"
