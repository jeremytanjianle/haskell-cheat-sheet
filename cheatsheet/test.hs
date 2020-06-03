-- Tutorial link
-- https://www.youtube.com/watch?v=02_H3LjqMr8

{-
Multi-line comments here
-}
-- single line comments


-- import two modules
import Data.List
import System.IO 
-- import Geometry

-- haskell uses type inference, defines types depends on the data stored in it
-- haskell is statistically typed, so we cant change things once theyre initiated
-- Int -2^63 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Double 
-- is only precise up to 11 digits
bigFloat = 3.99999999999 + 0.00000000005
impreciseBigFloat = 3.999999999999 + 0.000000000005

-- Bool which is either True or False
-- Char which is single unicode characters, denoted by single quotes
-- Tuple which usually only ever contains two values

always5 :: Int
always5 = 5

-- math functions
sumOfNums = sum [1..1000]
addEx = 5 + 4
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4

-- fromIntegral changes Int into 
num9 = 9 :: Int
sqrtOf9 = sqrt(fromIntegral num9)

-- booleans
trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

-- documentation, you can use :t to see the type declarations of the function
-- >>> :t (+)
-- (+) :: Num a => a -> a -> a



-- Lists
primeNumbers = [3, 5, 7, 11]
morePrime = primeNumbers ++ [13, 17, 19, 23, 29]
favNums = 2 : 7 : 21 : 66 : []
multList = [[3,5,7],[11,13,17]]
morePrimes2 = 2: morePrime
lenPrime = length morePrimes2
revPrime = reverse morePrimes2
isListEmpty = null morePrimes2

firstPrime = morePrime !! 0
secondPrime = morePrime !! 1
firstPrime2 = head morePrime
allButLastPrime = init morePrimes2
first3Primes = take 3 morePrimes2
afterFirst3Primes = drop 3 morePrimes2

-- backquotes can make a function 'infix' 
-- that is, the function can be used in the middle
-- https://stackoverflow.com/questions/20680779/sections-why-do-i-need-backticks-here
is7InList = 7 `elem` morePrimes2
is7InList2 = elem 7 morePrimes2


zeroToTen = [0..10]
evenList = [2,4..20]
letterList = ['A','C'..'Z']
listTimes2 = [x * 2| x <- [1..10] ]
divisBy9N13 = [x | x <- [1..500], x `mod` 9 ==0, x `mod` 13 == 0] -- you can make convoluted filtering

-- other list functions can be found such as product, sort, zipWith, filter, takeWhile
prodPrimes = product primeNumbers
sortedList = sort [5, 1, 7, 2]
sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]
listBiggerThan5 = filter (>5) morePrimes2
evensUpTo20 = takeWhile (<=20) [2,4..]
-- foldl runs a cumulative function, 
-- the second argument is the initial value
-- and it progressively moves forward along the list
multOfList = foldl (*) 10 [2,3,4,5] 


-- tuples
randTuple = (1, "Random Tuple")
bobSmith = ("Bob Smith", 52)
bobsName = fst bobSmith
bobsAge = snd bobSmith

names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "234 North", "567 South"]

namesNAddress = zip names addresses



-- FUNCTIONS
-- the first class citizen in haskell

-- start with a type declaration
addMe :: Int -> Int -> Int

-- funcName param1 param2 = operations (returned value)
addMe x y = x+y 

-- You can define functions without a type declaration
-- this works with floats
addMe2 x y = x+y 

-- recursions also work here in Haskell 
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- functions can hold "guards" for various conditions 
isOdd :: Int -> Bool
isOdd n 
    | n `mod` 2 == 0 = False 
    | otherwise = True

whatGrade :: Int -> String
whatGrade age 
    | (age >=5) && (age <=6) = "Kindergarten"
    | (age > 6) && (age <= 10) = "Elementary school"
    | otherwise = "Who knows"

-- where clause can help us avoid calculating the same thing over and over again
batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
    | avg <= 0.2 = "A"
    | avg <= 0.25 = "B"
    | otherwise = "C"
    where avg = hits / atBats

-- where clauses can really help build complicated math functions
-- https://www.tutorialspoint.com/haskell/haskell_functions.htm
roots :: (Float, Float, Float) -> (Float, Float)
roots (a,b,c) = (x1,x2) where
    x1 = e + sqrt d / (2*a)
    x2 = e - sqrt d / (2*a)
    d = b * b - 4 * a * c
    e = - b / (2*a)

-- pattern matching in functions
-- the show command changes anything into a string
-- xs can signify the rest of the list
getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list starts with" ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st items is " ++ show x ++ "and the rest are" ++ show xs

-- applying functions to other functions
-- we can map functions to a list
times4 :: Int -> Int
times4 x = x * 4
listTimes4 = map times4 [1,2,3,4,5]

-- we can also do a recursion 
-- below, times4 is progressively applied 1by1 on the elements of the list
multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

-- passing a function into a function
-- here do Mult is receiving a function and doing something with it
-- in the type declaration
-- the brackets denote a type declaration for the function that is to be used
doMult :: (Int -> Int) -> Int
doMult func = func 3
num3Times4 = doMult times4

-- lambdas - nameless functions
-- backslash denotes the lambda function
dbl1To10 = map (\x -> x*2) [1..10]

-- we can incorporate conditionals into our functions
doubleEvenNumber y = 
    if (y `mod` 2/= 0)
        then y
        else y * 2

-- conditionals can also come in the form of 'cases'
-- _ catches everything else
getClass :: Int -> String
getClass n = case n of 
    5 -> "Go to Kindergarten"
    6 -> "Go to elemnetary school"
    _ -> "Go away"



-- DATA TYPES 
-- they are like classes in python
-- Shape is the data type, while Circle and Rectangle are value constructors
-- Initializing the data class requires a list of value constructors 
data Shape = Circle Float Float Float | Rectangle Float Float Float Float   deriving (Show)

-- running :t on Circle looks like a function, 
-- in fact it can basically be used like a function
-- > print( map (Circle 10 20) [4,5,6,6]  )
-- [Circle 10.0 20.0 4.0,Circle 10.0 20.0 5.0,Circle 10.0 20.0 6.0,Circle 10.0 20.0 6.0]

-- Functions can take in a value constructor to give an output
-- Notice 2 things: 
-- (1) the type declaration takes in the data type, not the value constructor
-- (2) the function must take in the initiated instance of the value constructor
--     meaning that <surface (Circle _ _ r)> is correct but <surface Circle _ _ r> is wrong
surface :: Shape -> Float  
surface (Circle _ _ r) = pi * r ^ 2  
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)  

-- Intermediate data types can be used to make a date type more understandable
data Point = Point Float Float deriving (Show)  
data Shape2 = Circle2 Point Float | Rectangle2 Point Point deriving (Show)  
-- The function must also be edited to according to the new interface
-- notice that the new correct function takes the point as a single object
surface2 :: Shape2 -> Float
surface2 (Circle2 _ r) = pi * r ^ 2
surface2 (Rectangle2 (Point x1 y1) (Point x2 y2) ) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- functions can also return the data type 
-- 
baseCircle :: Float -> Shape2
baseCircle r = Circle2 (Point 0 0) r

baseRectangle :: Float -> Float -> Shape2
baseRectangle width height = Rectangle2 (Point 0 0) (Point width height)



-- RECORDS
-- records are basically a dictionary of data types
-- the person data type can hold key-value pairs
-- Note the curly braces
data Person = Person { firstName :: String,
                        lastName :: String,
                        age :: Int,
                        height :: Float,
                        phoneNumber :: String,
                        flavor :: String 
                        } deriving (Show)
-- To initialize an instance:
-- Car {company="Ford", model="Mustang", year=1967}  

-- Haskell allows us to check the type declarations of these key values
-- > :t firstName  
-- firstName :: Person -> String  



-- IO
-- We can write and read from files in acitonable scripts
writeToFile = do    
    
    -- Open the file from a handle
    theFile <- openFile "test.txt" WriteMode
    
    -- Put the text in the file
    hPutStrLn theFile ("Random line fo text")
    
    -- Close the file
    -- note the capital C
    hClose theFile

readToFile = do

    -- Read the file
    theFile2 <- openFile "test.txt" ReadMode

    -- pull contents from file
    contents <- hGetContents theFile2 
    print(contents)
    -- putStr takes a string and outputs it
    -- putStr contents

    -- close the handle again
    hClose theFile2



-- FIBONACCI
-- zip is the key function here
-- zip [1,2,3] [2,3] gives [(1,2),(2,3)]
-- meaning that it conveniently pairs the a list with a staggered version of itself
-- allowing us to easily add 1st to the second, and second to third and so on
fib = 1 : 1 : [a+b | (a,b) <- zip fib (tail fib) ]

-- this list comprehension isnt calculated to infinity immediately
-- because Haskell is lazy, it will only calculate when the list is called
-- > fib300 = fib !! 300
-- 359579325206583560961765665172189099052367214309267232255589801