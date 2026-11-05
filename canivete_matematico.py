#! /usr/bin/env python3

class interface:
    def perguntas():
        print('--------------------------------------------------')
        print('-----------CANIVETE MATEMÁTICO - TUX OS-----------')
        print('--------------------------------------------------')

class core:
    def converter(n):
        s = int(n)
        return s

    def soma(n1, n2):
        n1 = converter(n1)
        n2 = converter(n2)
        resultado = n1 + n2
        return resultado
    
    def subtracao(n1, n2):
        n1 = converter(n1)
        n2 = converter(n2)
        resultado = n1 - n2
        return resultado

    def multiplicacao(n1, n2):
        n1 = converter(n1)
        n2 = converter(n2)
        resultado = n1 * n2
        return resultado

    def divisao(n1, n2):
        n1 = converter(n1)
        n2 = converter(n2)
        resultado = n1 / n2
        return resultado

interface.perguntas()
