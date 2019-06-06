{-- Exercicio Lista 5
Aluno: Saulo Weikert Bicalho--}

{--

Os itens 1,2, e 3 foram implementados no arquivo Exercicio5.py

O item 4 está implementado no código abaixo.

Item 5: No caso de Haskell, observou-se que o grau de dificuldade na manipulação
de tipos e de funções é inverso ao das linguagens imperativas.
Aqui, a declaração de um novo tipo foi feita com facilidade, bastando a inserção
de um novo termo na declaração de tipo algébrico (enquanto em Python a declaração
de novo tipo foi custosa, requerendo edição em diversos pontos do código)
A declaração de nova função, por sua vez, foi trabalhosa, pois exigiu a manipulação
de vários pontos, uma vez que foi preciso instanciar tal função para cada tipo
previsto na declaração de tipo algébrico (enquanto em Python a declaração de novo
método é feita de modo simples, na classe ancestral, em um único ponto do código)

--}

type Lado = Float
type Raio = Float
data Forma = Quadrado Lado | Circulo Raio | Triangulo Ladoa Ladob Ladoc

area ( Quadrado lado ) = lado * lado
area ( Circulo raio ) = pi * raio * raio
area ( Triangulo ladoa, Triangulo ladob, Triangulo ladoc ) = (ladoa * ladob)/2

perimetro ( Quadrado lado ) = lado * 4
perimetro ( Circulo raio ) = pi * raio * 2
perimetro ( Triangulo ladoa, Triangulo ladob, Triangulo ladoc ) = ladoa + ladob + ladoc


quadrado :: IO Forma
quadrado = do print (" Digite valor ( para lado de quadrado ): ")
  s <- getLine
  return . Quadrado $ read s

circulo :: IO Forma
circulo = do print (" Digite valor ( para raio de circulo ): ")
  s <- getLine
  return . Circulo $ read s

  triangulo :: IO Forma
  triangulo = do print (" Digite valor ( para lados de triangulo ): ")
    s <- getLine
    t <- getLine
    u <- getLine
    return . Quadrado $ read s read t read u


main = do print (" Digite q para quadrado , c para circulo : ")
  f <- getChar
  let (nome , criaForma )
    | f== 'q' = (" quadrado ", quadrado )
    | f== 'c' = (" circulo ", circulo )
    | f== 't' = (" triangulo ", triangulo )

  forma <- criaForma

  let areaForma = show $ area forma
  let perimetroForma = show $ perimetro forma

  print (" area de " ++ nome ++ " igual a = " ++ areaForma )
  print (" perimetro de " ++ nome ++ " igual a = " ++ perimetroForma )
