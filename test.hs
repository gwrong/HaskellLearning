doubleMe x = x + x
doubleSmallNumber x = if x > 100 then x else x*2
helloWorld = "Hello " ++ "World"
addToNumbers x = x : [1, 2, 3, 4, 5]
oneTo100 = [1..100]
allCombinations list1 list2 = [word1 ++ " " ++ word2 | word1 <- list1, word2 <- list2]
getOnlyEven numbers = [x | x <- numbers, even x]
add1ToLength list = fromIntegral(length list) + 1

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

recursiveLength :: (Num b) => [a] -> b
recursiveLength [] = 0
recursiveLength (_:xs) = 1 + recursiveLength xs

heightTell :: Int -> Int -> String  
heightTell feet inches  
    | (feet * 12) + inches <= 64 = "You're really short!"  
    | (feet * 12) + inches <= 68 = "You're about average height!"  
    | (feet * 12) + inches <= 74 = "You're tall!"  
    | otherwise     = "You're very tall!" 

