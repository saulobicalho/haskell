#Lista de Exercicios 4 - Nome: Saulo Weikert Bicalho
#Exercicio 1

def LinhasMaioresQueN ( n,arqs ):
    for f in arqs :
        for lin in open(f):
            if (len(lin)>n):
                yield lin

def main1 (n, arqs ):
    for linha in LinhasMaioresQueN ( n,arqs ):
        print ( linha )

#Inicialização do main() para teste
#main1(40,["arq1.txt", "arq2.txt", "arq3.txt"])

#Exercicio 2

def ProcessaArquivo ( arqs ):
    totalAbsoluto =0
    for arq in arqs :
        totalLinhas=0
        for lin in open(arq):
            totalLinhas +=1
        totalAbsoluto += totalLinhas
        yield (arq, totalLinhas)
    print ("Total Absoluto:",totalAbsoluto)

def printSaidas ( arquivos ):
    for nome, nlinhas in arquivos :
        print ('Nome do Arquivo:  ' + nome + '  No de Linhas:  ' + str(nlinhas))

def main2 ( arqs ):
    arquivos = ProcessaArquivo ( arqs )
    printSaidas ( arquivos )

#Inicialização do main() para teste
#main2 ( ["arq1.txt", "arq2.txt", "arq3.txt"] )

#Exercicio3

def enumerate_( lista ):
    i=0
    for elemento in lista:
        yield i,elemento
        i=i+1

def main3(lista):
    listaEnumerada = enumerate_(lista)
    for ordem, elem in listaEnumerada:
        print (ordem, elem)

#Inicialização do main() para teste
#main3(["a","b","c"])
