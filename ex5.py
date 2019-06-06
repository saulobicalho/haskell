#Lista de Exercicio5 - Nome: Saulo Weikert Bicalho
'''
Os itens 1 e 2 foram implementados no código abaixo

Item 3:
Em python, a dificuldade para declarar uma nova operação foi mínima.
Uma vez que Python é uma linguagem orientada a objetos, a declaração da operação,
que se quer comum a todas as subclasses de uma determinada classe, é possível de
ser feita uma única vez, em um único local, na definição da classe ancestral.
A declaração de um novo tipo, porém, é trabalhosa pois requer a implementação
dos métodos herdados da classe ancestral, e não implementados. Dessa forma, foi
preciso alterar o código em vários pontos.

Item 4:
A implementação em python segue em arquivo separado, Exercicio5.hs
'''

from math import pi

class Forma :

    def area ( self ):
        print (" area nao implementada ")

    def perimetro ( self ):
        print (" perimetro nao implementado ")

class Quadrado ( Forma ):

    def __init__ ( self ):
        self.lado = float (input('Digite valor ( para lado de quadrado ): '))

    def area ( self ):
        return self.lado * self.lado

    def perimetro ( self ):
        return self.lado * 4

    def nome ( self ):
        return " quadrado "

class Circulo ( Forma ):

    def __init__ ( self ):
        self.raio = float (input('Digite valor ( para raio de circulo ): '))

    def area ( self ):
        return pi * self.raio * self.raio

    def perimetro ( self ):
        return 2 * pi * self.raio

    def nome ( self ):
        return " circulo "

class Triangulo ( Forma ):

    def __init__ ( self ):
        self.ladoa = float (input('Digite valor ( para lado a de quadrado ): '))
        self.ladob = float (input('Digite valor ( para lado b de quadrado ): '))
        self.ladoc = float (input('Digite valor ( para lado c de quadrado ): '))

    def area ( self ):
        semiperimetro = (self.ladoa + self.ladob + self.ladoc)/2
        return  semiperimetro * (semiperimetro - self.ladoa) * (semiperimetro - self.ladob) * (semiperimetro - self.ladoc)

    def perimetro ( self ):
        return self.ladoa + self.ladob + self.ladoc

    def nome ( self ):
        return " quadrado "


def main ():
    f = input('Digite q para quadrado , c para circulo, t para triangulo : ')
    while True :
        if f== 'q':
            forma = Quadrado ()
            break
        elif f== 'c':
            forma = Circulo ()
            break
        elif f== 't':
            forma = Triangulo ()
            break
    print ('area de {0} igual a = {1} '.format( forma.nome (), forma.area ()))
    print ('perimetro de {0} igual a = {1} '.format( forma.nome (), forma.perimetro ()))

main ()
