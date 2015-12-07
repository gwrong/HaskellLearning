-- Reference sheet to http://learnyouahaskell.com/

-- Testing simple functions
doubleMe x = x + x
doubleSmallNumber x = if x > 100 then x else x*2
helloWorld = "Hello " ++ "World"
addToNumbers x = x : [1, 2, 3, 4, 5]
oneTo100 = [1..100]
allCombinations list1 list2 = [word1 ++ " " ++ word2 | word1 <- list1, word2 <- list2]
getOnlyEven numbers = [x | x <- numbers, even x]
add1ToLength list = fromIntegral(length list) + 1

-- Trying out declaring types
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Recursive function example, with pattern matching
recursiveLength :: (Num b) => [a] -> b
recursiveLength [] = 0
recursiveLength (_:xs) = 1 + recursiveLength xs

-- Function guards!
heightTell :: Int -> Int -> String  
heightTell feet inches  
    | (feet * 12) + inches <= 64 = "You're really short!"  
    | (feet * 12) + inches <= 68 = "You're about average height!"  
    | (feet * 12) + inches <= 74 = "You're tall!"  
    | otherwise     = "You're very tall!" 

-- Check out let bindings (also check out where bindings, not shown here)
circleArea :: (RealFloat a) => a -> a
circleArea r =
    let area = pi * r^2
    in area

-- Interesting recursive magic with pattern matching
maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs) = max x (maximum' xs)

-- quicksort using list comprehensions!
quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted

-- Curried functions
compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100

-- Infix curried functions
divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)

-- Function parameters
applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x) 

-- Taking in a function - getting more complex
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys  