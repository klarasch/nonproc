import Data.Char

-- takehalf returns first half of a list
takehalf :: [a] -> [a]
takehalf xs = take (length xs `div` 2) xs

-- drophalf returns second half of a list
drophalf :: [a] -> [a]
drophalf xs = drop (length xs `div` 2) xs

-- mergeWith
-- =========
-- merges two lists ordered with a given operator into a new ordered list
mergeWith :: (a -> a -> Bool) -> [a] -> [a] -> [a]
-- two empty lists result in an empty list, an element with an empty list result with the element
mergeWith boolOp [] [] = []
mergeWith boolOp x [] = x
mergeWith boolOp [] x = x
-- otherwise, for two lists, compare first elements and move "the winner" in a new one and apply the mergeWith recursively again 
mergeWith boolOp (x:xs) (y:ys) 
         | (x `boolOp` y)  = x:(mergeWith boolOp xs (y:ys)) 
         | otherwise = y:(mergeWith boolOp (x:xs) ys)

-- sortWith
-- ========
-- sortWith sorts a list with a given comparator using mergesort (uses mergeWith)		 
sortWith :: (a -> a -> Bool) -> [a] -> [a]
sortWith boolOp [] = []
sortWith boolOp [x] = [x]
sortWith boolOp x = mergeWith boolOp (sortWith boolOp (takehalf x)) (sortWith boolOp (drophalf x))

-- ciLess
-- ======
-- case insensitive string less comparator
ciLess :: String -> String -> Bool
a `ciLess` b =
    a' < b'
    where
        a' = map toLower a
        b' = map toLower b
    
-- ciSort
-- ======
-- case insensitive string ordering using sortWith / mergesort (ascending order)
ciSort :: [String] -> [String]
ciSort xs = sortWith (ciLess) xs