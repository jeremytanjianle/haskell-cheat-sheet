import Data.List
import System.IO 

module SampFunctions (getClass, doubleEvenNumbers) where 
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
