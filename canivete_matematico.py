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
        print('#5 - ALGÉBRICA')
        entrada = input('Digite um número [1-5]: ')
        interface.escolhas(entrada)

    def escolhas(opcao):
        opcao = int(opcao)
        if(opcao == 1 or opcao == 2 or opcao == 3 or opcao == 4 or opcao == 5):
            num1 = input('Digite o primeiro número: ')
            num2 = input('Digite o segundo número: ')
            if(opcao == 1):
                res = core.soma(num1, num2)
                print('A resposta é', res) 
            if(opcao == 2):
                res = core.subtracao(num1, num2)
                print('A resposta é', res)
            if(opcao == 3):
               res = core.multiplicacao(num1, num2)
               print('A resposta é', res)
            if(opcao == 4):
               res = core.divisao(num1, num2)
               print('A resposta é', res)
            if(opcao == 5):
                algebrica.interpretador()

        else:
            print('Erro: Digite um número válido')
            exit(1)

class core:
    def converter(n):
        s = int(n)
        return s

    def soma(n1, n2):
        n1 = core.converter(n1)
        n2 = core.converter(n2)
        resultado = n1 + n2
        return resultado
    
    def subtracao(n1, n2):
        n1 = core.converter(n1)
        n2 = core.converter(n2)
        resultado = n1 - n2
        return resultado

    def multiplicacao(n1, n2):
        n1 = core.converter(n1)
        n2 = core.converter(n2)
        resultado = n1 * n2
        return resultado

    def divisao(n1, n2):
        n1 = core.converter(n1)
        n2 = core.converter(n2)
        resultado = n1 / n2
        return resultado

class algebrica:
    def interpretador():
        monomio1 = input('Digite o primeiro monômio (máximo 2 monômios): ')
        monomio2 = input('Digite o segundo monômio: ')
        operacao = input('Digite a operação entre os monômios: [+/-]: ')
        correto = input('A expressão', monomio1, operacao ,monomio2, 'está correta? [S/n] ')
        if(correto == 's' or correto == 'S'):
            print('Em desenvolvimento')
        else:
            print('Fim do programa')

interface.perguntas()
