{-- Lista Exercicios 3--}
--Aluno: Saulo Weikert Bicalho

{--Questao 1:
Determine o tipo de λ x. λ y. λ z. x z (y z), usando a técnica-informal-de-inferência-de-tipos

A expressão é da forma tx -> tz -> (ty ->tz) ->tr
onde:
tx, tz e ty são variaveis que representam o tipo de x,z e y, respectivamente
tr é uma variavel que representa o tipo do resultado, x(z(y z))

Introduzindo as informações obtidas com o uso das variaveis x, y e z na expressão x(z(y z)):

- y tem tipo funcional (pois é aplicado a z), ou seja, é da forma t1 -> t2
- z tem tipo funcional (pois é aplicado a y z), ou seja, é da forma t3 -> t4
- x tem tipo funcional (pois é aplicado a z (y z)), ou seja, é da forma t5 -> t6

Reescrevendo:
t5 -> t6
ou  (t3->t4)->t6
ou ((t1->t2)->t4)->t6

- o tipo do resultado de y(z) é o mesmo do argumento de z (pois o resultado, yz, é aplicado a z), ou seja, t2=t3
- o tipo do resultado de z( y z) é o mesmo do argumento de x (pois o resultado, z(yz), é aplicado a x), ou seja, t4=t5
- o tipo de z é o mesmo do dominio de y, ou seja, t1 = tz
- o tipo de y é o mesmo do dominio de z, ou seja, t3 = ty

Reescrevendo:
tz-> (ty -> tz) ->tr

ou seja(substituindo tz por a, ty por b, tr por c):

a -> (b -> a) -> c

--}

{--Questao 2


--}
