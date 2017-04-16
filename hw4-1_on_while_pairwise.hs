-- `on` operator
-- =============
-- "on f g" applies g on both arguments and then applies f
on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
on f g x y = f (g x) (g y)

-- "while"
-- =======
-- "while c f a" is applying function f on its argument while
-- it satisfies condition given by function c
while :: (a -> Bool) -> (a -> a) -> a -> a
while c f a = if c a then while c f (f a) else a

-- "pairwise"
-- ==========
-- "pairwise f" applies function f on pairs in a given list and
-- results puts in a new list, if the list length is odd, the last
-- element is not changed
pairwise :: (a -> a -> a) -> [a] -> [a]
-- empty list results in empty list
pairwise f [] = []
-- one-element lists stay unchanged (needed for the lists with odd length in recursion)
pairwise f [x] = [x]
-- apply function on the first two elements and call the function for the rest recursively
pairwise f (fst:snd:rest) = (f fst snd) : (pairwise f rest) -- parenthesis redundant on the RHS