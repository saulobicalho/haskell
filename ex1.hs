{-- Exercicio Lista 1--}
{-- queestao 1 --}
import Prelude hiding (map, dropWhile,break)
import Data.Char

map::(a->b)->[a]->[b]
map f [] = []
map f (x:xs) = f x : map f (xs)

{--Questao 2--}

mudaPraMinusc:: String -> String
mudaPraMinusc = map toLower

{--Questao 3--}

dropWhile::(a -> Bool) -> [a] -> [a]
dropWhile p [] = []
dropWhile p (a:x)
 | p a = dropWhile p x
 | otherwise = a : x

{--Questao 4--}

break::(a-> Bool) -> [a] -> ([a],[a])
break p = span (not.p)
