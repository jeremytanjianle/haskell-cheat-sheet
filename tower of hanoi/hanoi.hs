-- Tower of Hanoi
-- https://wiki.haskell.org/Common_Misunderstandings

hanoi :: a -> a -> a -> Int -> [(a,a)]
hanoi source using dest n
    | n ==1 = [(source, dest)]
    | otherwise = hanoi source dest using (n-1) ++ hanoi source using dest 1 ++ hanoi using source dest (n-1)


-- wrong hanoi_shower
-- it is wrong because it only matched the first element of the list
-- but didn't iterate over the list as intended.
-- hanoi_shower :: Show a => [(a,a)] -> String
-- hanoi_shower [(a,b)] = "Move " ++ show a ++ " to " ++ show b ++ "."

-- correct hanoi_shower with list comprehension
-- unlines converts the iterable of string into line-delimited string
hanoi_shower :: Show a => [(a, a)] -> String
hanoi_shower moves = unlines ["Move " ++ show a ++ " to "++ show b ++ "." | (a, b) <- moves]

-- alternatively, we can map the pairs with a function "move"
hanoi_shower :: Show a => [(a, a)] -> String
hanoi_shower moves = unlines (map move moves)
                     where move (a, b) = "Move " ++ show a ++ " to "++ show b ++ "."

-- iteration using higher-order functions 
hanoi_shower :: Show a => [(a, a)] -> String
hanoi_shower [] = ""
hanoi_shower ((a, b):moves) = unlines ["Move " ++ show a ++ " to "++ show b ++ "."] ++ hanoi_shower moves