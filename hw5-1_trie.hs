module Trie where -- getting rid of ghc-mod error

import qualified Data.Map.Strict as M
import Data.Maybe

data Trie k v = Trie {
                        value    :: Maybe v,
                        children :: M.Map k (Trie k v)
                     }
                     deriving (Show, Eq)

-- creates an empty trie
empty :: Trie k v
empty = Trie { value = Nothing, children = M.empty }

-- creates a "path" trie from a single key and value
singleton :: [k] -> v -> Trie k v
singleton [] v = Trie (Just v) M.empty
singleton (x:xs) v = Trie Nothing (M.singleton x (singleton xs v))

-- | fromList [("a","x")])
-- constructs a trie from a list of pairs (key, value)
fromList :: (Ord k) => [([k], v)] -> Trie k v
fromList = foldr (uncurry insert) empty

-- | 'insertWith f ks new t'
-- inserts a key 'ks' with a value 'new' to a trie 't'.
-- If they key exists and contains a value 'old', the value is replaced
-- with the value 'f new old'.
insertWith :: (Ord k) => (v -> v -> v) -> [k] -> v -> Trie k v -> Trie k v
insertWith f [] new (Trie old c)
  -- for empty string (re)place the value in the root and keep the rest
  -- of the trie the same
  | isNothing old = Trie (Just new) c
  | isJust    old = Trie (Just (f new (fromJust old))) c
insertWith f (x:xs) new (Trie v c)
  -- if there already exists a path with the first ("current") character of the
  -- key, insert the rest of the key and the value to that subtrie, if not,
  -- create a singleton as a subtrie from the key with the value (that happens
  -- without calling singleton constructor in a similar way)
  = Trie v (M.alter alt x c)
  where
    alt = Just . insertWith f xs new . fromMaybe empty

-- | 'insert key value trie'
-- same as 'insertWith', only just replaces old values with new ones
insert :: (Ord k) => [k] -> v -> Trie k v -> Trie k v
insert
  = insertWith replace
  where
    replace _ b = b

-- | 'find key trie'
-- returns the value stored under the key (as Just value), if the key
-- does not exist, returns Nothing)
find :: (Ord k) => [k] -> Trie k v -> Maybe v
find [] t = value t
find (x:xs) (Trie _ c) =
  -- the check is just an optimalisation, would work without it, but it would
  -- have to recursively shorten the whole string until it would reach []
  if M.null c
    then Nothing
    else find xs t
  where
    t = fromMaybe empty (M.lookup x c)

-- | 'member key trie'
-- returns True if the key is in the trie, else False
member :: (Ord k) => [k] -> Trie k v -> Bool
member k t = isJust (find k t)

-- | 'isNull key trie'
-- returns True if the trie is empty
isNull :: Trie k v -> Bool -- "null" would clash with Prelude.null
isNull (Trie v c) = isNothing v && M.null c

-- | 'delete key trie'
-- deletes key and its value, if the key is not in the trie,
-- returns the original trie
delete :: Ord k => [k] -> Trie k v -> Trie k v
delete = (fromMaybe empty .) . foldr f i where
  i (Trie _ c) | M.null c  = Nothing
               | otherwise = Just (Trie Nothing c)
  f x maybeTrie = nilIfEmpty . applyToChildren (M.alter (maybeTrie =<<) x)

applyToChildren :: Ord k => (M.Map k (Trie k v) -> M.Map k (Trie k v)) -> Trie k v -> Trie k v
applyToChildren f (Trie v c) = Trie v (f c)   
 
nilIfEmpty :: Trie k v -> Maybe (Trie k v)
nilIfEmpty t | isNull t    = Nothing
             | otherwise   = Just t
