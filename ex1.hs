{-- Exercicio Lista 1--}
{-- queestao 1 --}
import Prelude hiding (map)

map::(a->b)->[a]->[b]
map f [] = []
map f (x:xs) = f x : map f (xs)

{--Questao 2--}

mudaPraMinusc:: String -> String
mudaPraMinusc = map toLower
 | map toLower [] = []
 | map toLower [x:xs] = toLower x : map toLower xs
