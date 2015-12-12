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
-- a's must be Integrals
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Recursive function example, with pattern matching
recursiveLength :: (Num b) => [a] -> b
recursiveLength [] = 0
recursiveLength (_:xs) = 1 + recursiveLength xs

-- Function guards, basically case statements (which also exist)
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

-- Interesting recursive magic with pattern matching (x:xs = x is the first element of list, xs is the rest)
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

-- Curried functions (functions are partially applied if not enough parameters are given)
compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100

-- Infix curried functions (parameter goes to the left of the / sign)
divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)

-- Functions as parameters
applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x) 

-- Taking in a function - getting more complex
-- zip with applies a function between members of 2 lists
-- The colon (:) does an append
-- _ means any parameter goes
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 

-- Simpler function parameter example
-- Also check out filter
map' :: (a -> b) -> [a] -> [b]  
map' _ [] = []  
map' f (x:xs) = f x : map' f xs

-- foldl keeps an accumulator (Fold function)
-- Also showcases lambdas
-- Folds are vey useful for traversing a list to return a result
sum' :: (Num a) => [a] -> a  
sum' xs = foldl (\acc x -> acc + x) 0 xs 

-- Or check out scanning which puts intermediate values in a list
-- scanl (+) 0 [3,5,2,1]  
-- [0,3,8,10,11]

-- $ weakens the precedence of function applications
-- sum (map sqrt [1..130])
-- sum $ map sqrt [1..130]

-- . is function composition
-- map (negate . abs) [5,-3,-6,7,-3,2,-19,24]  
-- [-5,-3,-6,-7,-3,-2,-19,-24] 