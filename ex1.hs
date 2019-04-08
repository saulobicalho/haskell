{-- Exercicio Lista 1--}
{-- queestao 1 --}
import Prelude hiding (map)
import Data.Char

map::(a->b)->[a]->[b]
map f [] = []
map f (x:xs) = f x : map f (xs)

{--Questao 2--}

mudaPraMinusc:: String -> String
mudaPraMinusc = map toLower
 where toLower
  | [] = []
  | [x:xs] = toLower x : map toLower [xs]
