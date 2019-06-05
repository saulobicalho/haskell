#Exercicio 4 - Saulo Weikert Bicalho
"""Estrutura de dados iterável.
Como obter cada elemento de tal estrutura?
    Através de comandos for.
Iteradores possuem construtores.
Ocorrem chamadas aos construtores de iteradores.
A primeira chamada ao construtor de iterador permite a obtenção do primeiro
elemento de uma estrutura iterável.
Elementos seguintes de uma estrutura iterável são obtíveis através de
iterações do comando for, por meio do método next.
Exemplo de uso de iterador sobre lista (devolve cada de seus elementos).
Também se usa o iterador sobre cadeia de caracteres.
Também se usa sobre chaves de dicionário, embora em enunciado o prof. afirme
quanto à palavra reservada chave, não se sabe se existe.
O retorno em cada iteração de um dicionário parece não retornar todos os
campos de informação dessa estrutura.
Pode-se usar o iterador sobre arquivo-texto, para retornar linhas (usa-se o
termo lin).
Em todos os casos, a ação executada dentro do comando for é a de impressão,
print."""

class xrange_ :
    def __init__ (self , n):
        self.i = 0
        self.n = n

    def __iter__ ( self ):
        return self

    def next( self ):
        if self.i < self.n:
            i = self.i
            self.i += 1
            return i
        else :
            raise StopIteration ()
