#! /usr/bin/env python3

class interface:
    def perguntas():
        print('-------------------------------------------------')
        print('-----------CANIVETE MATEMÁTICO - TUX OS--------- ')
        print('-------------------------------------------------')
        print('')
        print('#1 - ADIÇÃO')
        print('#2 - SUBTRAÇÃO')
        print('#3 - MULTIPLICAÇÃO')
        print('#4 - DIVISÃO')
        entrada = input('Digite um número [1-4]: ')
        escolhas(entrada)

    def escolhas(opcao):
        if(opcao == '1' | opcao == '2' | opcao == '3' | opcao == '4'):
            num1 = input('Digite o primeiro número: ')
            num2 = input('Digite o segundo número: ')
            if(opcao == '1'):
                core.soma(num1, num2)
            if(opcao == '2'):
                core.subtracao(num1, num2)
            if(opcao == '3'):
                core.multiplicacao(num1, num2)
            if(opcao == '4'):
                core.divisao(num1, num2)
        else:
            print('Erro: Digite um número válido')
            exit(1)

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
