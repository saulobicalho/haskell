{-- Lista Exercicios 3--}
--Aluno: Saulo Weikert Bicalho

{--Questao 1:
Determine o tipo de λ x. λ y. λ z. x z (y z), usando a técnica-informal-de-inferência-de-tipos

A expressão é da forma tz -> (ty ->tz) ->tr
onde:
tz e ty são variaveis que representam o tipo de z e y, respectivamente
tr é uma variavel que representa o tipo do resultado, x(z(y z))

Introduzindo as informações obtidas com o uso das variaveis x, y e z na expressão x(z(y z)):

- y tem tipo funcional (pois é aplicado a z), ou seja, é da forma tz -> tr'
- z tem tipo funcional (pois é aplicado a y z), ou seja, é da forma tr' -> tr''
- x tem tipo funcional (pois é aplicado a z (y z)), ou seja, é da forma tr'' -> tr

Reescrevendo:
tr''-> tr
ou (tr' -> tr'')->tr
ou ((tz->tr')->tr'')->tr

- o tipo do resultado de y(z) é o mesmo do argumento de z (pois o resultado, yz, é aplicado a z)
- o tipo do resultado de z( y z) é o mesmo do argumento de x (pois o resultado, z(yz), é aplicado a x)
- o tipo de z é o mesmo do dominio de y, ou seja, tz = tr' -> tr''
- o tipo de y é o mesmo do dominio de z, ou seja, ty = tz -> tr'

Considerando:
(tr'-> tr'')->tr

ou seja(substituindo tr' por a, tr'' por b, tr por c):

(a -> b) -> c

--}

{--Questao 2

A expressão na 1a linha é da forma tf -> tg -> tl -> tx ->tr
    onde:
    tf, tg e tl são variaveis que representam o tipo de f, g e (Left x), respectivamente
    tr é uma variavel que representa o tipo do resultado, f(g(Left x))

Pode-se inferir que:

    - f tem tipo funcional (pois é aplicado a (g(Left x))), ou seja, é da forma t1 ->tr'
    - g tem tipo funcional (pois é aplicado a (Left x)), ou seja, é da forma t2 -> tr''
    - tl tem tipo funcional (pois é aplicado a x), ou seja, é da forma tx -> tr'''
    - o tipo de parametro da funcao f é do tipo de x, pois f é aplicado a x no lado direito, ou seja, tx= tr'' = t1
    - o resultado da expressão (funcao either) tem o mesmo tipo do resultado de f, ou seja, tr= tr'
    - o resultado de tl é do mesmo tipo do parametro de g, ou seja, tr''' = t2

    Reescrevendo a expressao da 1a linha:
    tf -> tg -> tl -> tr
    (t1->tr')->(t2->tr'')->(tx -> tr''')->tr
    (tx->tr)->(t2->tr'')->(tx -> tr''')->tr

A expressao na 2a linha é da forma tf -> tg -> td -> ty ->tr
  onde:
  tf, tg e td são variaveis que representam o tipo de f, g e (Rigth y), respectivamente
  tr é uma variavel que representa o tipo do resultado, f(g(Rigth y))

Pode-se inferir que:

    - td tem tipo funcional (pois é aplicado a y), ou seja, é da forma ty -> tr''''
    - o tipo de tr é o mesmo do tipo do resultado de tg, ou seja, tr''=tr=tr'
    - o tipo ty é o mesmo do parametro de g, ou seja, t2=ty


ou seja (unificando para as duas expressoes):
(tx->tr)->(ty->tr)->(tx -> tr''')->tr  na 1a equacao
(tx->tr)->(ty->tr)->(ty -> tr'''')->tr  na 2a equacao

    - o resultado de td é do mesmo tipo do parametro de g, ou seja, tr'''' = t2
    como o parametro de g, t2, é tx na 1a equacao, e ty na 2equacao, entao:

  (tx->tr)->(ty->tr)->(Either tx ty)->tr

  reescrevendo tx=a, ty=b, tr=c, entao:


  (a->c)->(b->c)->Either a b -> c


--}

--Questao 3

--a)
f:: (Ord a, Show a) => a -> a -> String
f x y
  | x<= y = show x
  |otherwise = show y

--b)
g::(a -> b -> c) -> b -> a -> c
g  f1 = f2
  where
    f2 x y = f1 y x

--c)
h::(a -> b, a -> c) -> a -> (b,c)
h (f1, f2) a = h'
  where
    h' = (f1 a, f2 a)

--d)
l::(a -> b, b -> d) -> (a,b) -> (c,d)
l (f1,f2) (a,b) = (undefined, f2 (f1 a))

--e)
i::(b -> c) -> (a->b) -> a -> c
i f2 f1 a = f2(f1 a)

--f)
j::[(a, b)] -> ([a], [b])
j xs = foldr j' x xs
  where
    j' (a,b) (as,bs) = (a:as, b:bs)
    x               = ([],[])

--g)
k::(a -> b -> a) -> a -> [b] -> [a]
k funcao a [b]= map (k' a) [b]
  where
    k' a _ = a
