lista4

1 Iteradores e Geradores
1.1 Iteradores
Iteradores s~ao usados em comandos for para obtenc~ao de cada elemento de uma estrutura de
dados iteravel, em cada iterac~ao do comando: o primeiro elemento e obtido pela chamada ao
construtor do iterador e o proximo elemento, em cada iterac~ao do comando for , e obtido por
chamada ao metodo next.
Por exemplo, pode-se usar comandos for para obter cada elemento de:
1. uma lista:
>>> for i in [1, 2, 3, 4]:
... print i,
...
1
2
3
4
2. caractere de uma cadeia de caracteres:
>>> for c in " abcd ":
... print c
...
a
b
c
d
3. chaves de um dicionario:
>>> for chave in {"a": 1, "b": 2}:
... print chave
...
a
b
4. linhas de um arquivo-texto:
>>> for lin in open("arq.txt"):
... print lin
...
primeira linha
segunda linha
1
Iteradores s~ao objetos de classes que denem metodos __iter__, para criar um objeto iterador,
e next, para retornar um (proximo) elemento a cada chamada. Por exemplo, considere a
denic~ao a seguir, de iterator que se comporta como a func~ao pre-denida xrange (xrange n~ao
gera toda a lista de valores, como a func~ao range, mas um iterador, i.e. gera os elementos da lista
um por um em vez de gerar toda a lista):
c l a s s xrange_ :
def __init__ (self , n):
self .i = 0
self .n = n
def __iter__ ( self ):
return self
def next( self ):
i f self .i < self .n:
i = self .i
self .i += 1
return i
e l s e :
rai s e StopIteration ()
Exemplo de uso de xrange_ e next:
>>> y = xrange_ (3)
>>> y.next()
0
>>> y.next()
1
>>> y.next()
2
>>> y.next()
Traceback ( most recent call last ):
File "<stdin >", line 1, in <module >
File "<stdin >", line 14, in next
StopIteration
Exemplos de func~oes que t^em iteradores como argumentos s~ao l i s t e join:
>>> ",". join (["a", "b", "c"])
'a,b,c'
>>> ",". join ({"x": 1, "y": 2})
'y,x'
>>> l i s t ("abc")
['a', 'b', 'c']
>>> l i s t ({"x": 1, "y": 2})
['y', 'x']
Note: i t e r sobre um dicionario e o mesmo que iterkeys: realiza iterac~ao sobre as chaves
do dicionario.
Chaves de um dicionario t^em uma ordem arbitraria (n~ao s~ao ordenadas necessariamente na
ordem em que aparecem no texto).
Geradores facilitam a gerac~ao de iteradores.
1.2 Geradores
Um gerador e um objeto iterador criado por meio do comando yield (veja explicac~ao a seguir)
ou por meio de uma express~ao geradora. Por exemplo, um objeto gerador pode ser denido
simplesmente como resultado de chamada a uma func~ao-geradora xrange_ denida como a seguir:
2
def xrange_ (n):
i = 0
whi le i < n:
yield i
i += 1
O comando yield retorna um objeto gerador (iterador criado via yield). Cada chamada a
next retorna um valor. Por exemplo:
>>> x_ = xrange_ (3)
>>> x_
<generator object xrange_ at ... >
>>> x_.next()
0
>>> x_.next()
1
>>> x_.next()
2
>>> x_.next()
Traceback ( most recent call last ):
File "<stdin >", line 1, in <module >
StopIteration
O uso de yield e um modo de implementar explicitamente a estrategia de avaliac~ao preguicosa
(um valor e obtido a cada chamada a next, em vez de ser obtido automaticamente quando e usado,
como ocorre no caso da estrategia de avaliac~ao preguicosa). Em ambos os casos o objetivo e a
otimizac~ao de espaco (i.e. evitar o armazenamento de todos os valores ao mesmo tempo).
1.3 Express~oes Geradoras
Express~oes generadoras geram valores como em uma lista denida por gerac~ao e ltragem, mas
usam par^enteses em vez de colchetes, criando um gerador (iterador gerado por express~ao geradora):
>>> xx = (x*x for x in range (10))
>>> xx
<generator object <genexpr > at ... >
>>> l i s t (xx)
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
1.4 Exerccio Resolvido
Escreva um programa que usa geradores para escrever func~ao que recebe uma cadeia de caracteres
(string) s e um iterador de nomes de arquivos-texto, e imprima o conteudo de cada linha de cada
arquivo-texto que contem a cadeia s.
Soluc~ao:
3
def ylins ( arqs ):
for f in arqs :
for lin in open(f):
yield lin
def grep (s, linhas ):
return (lin for lin in linhas i f s in lin)
def printLins ( lins ):
for lin in lins :
print lin
def main (s, arqs ):
lins = yLins ( arqs )
lins = grep (s, lins )
printLins ( lins )
1.5 Exerccios
Use geradores (gerados pelo comando yield) para implementar as func~oes a seguir.
1. Escreva uma func~ao que receba um inteiro n e uma lista de nomes de arquivos como argumentos
e imprima todas as linhas contidas nos arquivos com tamanho maior que n caracteres.
2. Escreva um programa que receba uma lista de nomes de arquivos como argumentos e imprima
i) para cada arquivo, seu nome e o numero de linhas contidas no arquivo, e ii) o numero total
de linhas contidas nos arquivos.
3. Escreva uma func~ao enumerate que se comporte como enumerate.
A func~ao enumerate recebe um iterador it e retorna um iterador sobre pares (i,v), onde i e
um ndice e v um valor, do iterador it .
Por exemplo:
>>> l i s t (enumerate(["a", "b", "c"])
[(0 , "a"), (1, "b"), (2, "c")]
>>> for i, c in enumerate(["a", "b", "c"]):
... print i, c
...
0 a
1 b
2 c
4

-------------------------------------------------------------------------------
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
