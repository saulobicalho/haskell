lista1

1. Escreva func~ao map:: (a->b) -> [a] -> [b] que recebe func~ao f e lista
x e retorna a lista resultante de aplicar f a cada elemento de x.
Use:
import Prelude hiding (map)
para esconder a denic~ao de map existente no modulo Prelude(denic~oes
no Prelude s~ao importadas automaticamente em programas Haskell).
2. Escreva func~ao mudaPraMinusc:: String-> String que transforma toda
letra minuscula no argumento em letra maiuscula, conservando sem mudan
ca os demais caracteres.
Use toLower (denida em Data.Char) e map.
3. Escreva a func~ao dropWhile::(a->Bool) -> [a] -> [a], que recebe um
predicado (func~ao que retorna valor de tipo Bool ) p e uma lista x e remove
cada elemento a de x para o qual p a e verdadeiro, a partir do primeiro,
ate encontrar um valor b para o qual p b e falso.
Exemplos: dropWhile(<0) [-1,2,-3,4] retorna [2,-3,4].
dropWhile(>0) [-1,2,-3,4] retorna [-1,2,-3,4].
4. Escreva a func~ao break::(a -> Bool) -> [a] -> ([a],[a]), que recebe
um predicado p e uma lista x e particiona a lista x em duas sublistas x1 ,
x2 , sendo x1 a lista contendo os elementos de x ate que o predicado seja
verdadeiro e x2 o restante dos elementos de x, do elemento para o qual o
predicado retorna verdadeiro seguido dos elementos restantes de x.
Exemplos: break(<0) [-1,2,-3,4] retorna ([],[-1,2,-3,4]).
break(>0) [-1,2,-3,4] retorna ([-1],[2,-3,4]).
5. Considere a func~ao splitWith:: (a->Bool) -> [a] -> [[a]], denida a
seguir:
1
splitWith p = splitWith' p . dropWhile p
splitWith' p [] = []
splitWith' p x = x1 : splitWith p x2
where (x1 ,x2 ) = break p x
Dena a func~ao words:: String -> [String], que recebe uma cadeia de
caracteres s e retorna a lista de palavras em s.
Uma palavra e separada de outra por um ou mais caracteres c para os
quais isSpace c retorna verdadeiro (True).
A func~ao isSpace e denida em Data.Char.
6. Escreva func~ao contaOcs:: [String] -> [(Int,String)] que recebe uma
lista ordenada de cadeias de caracteres xs e retorna uma lista de pares
(n; x) onde n e o numero de vezes que x ocorre na lista ordenada (n > 0).
Exemplo: contaOcs["a", "a", "b", "c", "c", "c", "d"] retorna:
[(2,"a"), (1,"b"), (3,"c"), (1,"d")]

7. Escreva func~ao concat:: [[a]] -> [a], que recebe uma lista de listas
xi (i = 1; : : : ; n) e retorna o resultado de concatenar os elementos em
todas as listas xi.

Exemplo: concat[[1,2],[3,4,5],[6]] retorna [1,2,3,4,5,6].
8. Escreva func~ao palavrasMaisComuns:: Int -> String-> String que recebe
um inteito n e uma cadeia de caracteres texto e retorne a lista das
n palavras mais comuns em texto; para cada uma das n palavras mais
comuns deve ser retornda uma linha contendo a palavra e o numero de
ocorr^encias dessa palavra em texto.
Use: mudaPraMinusc, words, sort, contaOcs, sortBy, take, map, concat:
encadeie chamadas dessas func~oes com a func~ao (.) de composic~ao de
func~oes.

----------------------------------------------------------------------------
lista 3
1)
Determine o tipo de λ x. λ y. λ z. x z (y z), usando a técnica-informal-de-inferência-de-tipos.
