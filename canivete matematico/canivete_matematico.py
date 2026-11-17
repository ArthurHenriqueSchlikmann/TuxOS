#! /usr/bin/env python3

# Classe que faz uma pequena interrface para o usuário
class Interface:
    def perguntas():
        print('-------------------------------------------------')
        print('----------CANIVETE MATEMÁTICO - TUX OS---------- ')
        print('-------------------------------------------------')
        print('- #1 - ADIÇÃO                                  - ')
        print('- #2 - SUBTRAÇÃO                               - ')
        print('- #3 - MULTIPLICAÇÃO                           - ')
        print('- #4 - DIVISÃO                                 - ')
        print('- #5 - ALGÉBRICA (em desenvolvimento)          - ')
        entrada = input('Digite um número [1-5]: ')
        print('-------------------------------------------------')
        Interface.escolhas(entrada)

# Aquilo que identifica a escolha do usuário e chama a função correspondente
    def escolhas(opcao):
        try:
            opcao = int(opcao)
        except ValueError:
            print('Erro: Digite um número entre 1 e 5')
            Core.tchau(5)
        if(opcao == 1 or opcao == 2 or opcao == 3 or opcao == 4):
            num1 = input('Digite o primeiro número: ')
            num2 = input('Digite o segundo número: ')
            if(opcao == 1):
                res = Core.soma(num1, num2)
                print(f'A resposta da operação {num1} + {num2} é {res}')
                Core.tchau(0)
            if(opcao == 2):
                res = Core.subtracao(num1, num2)
                print(f'A resposta da operação {num1} - {num2} é {res}')
                Core.tchau(0)
            if(opcao == 3):
               res = Core.multiplicacao(num1, num2)
               print(f'A resposta da operação {num1} X {num2} é {res}')
               Core.tchau(0)
            if(opcao == 4):
                num1 = Core.converter(num1)
                num2 = Core.converter(num2)
                if(num2 == 0):
                    print('Não tem como dividir por 0')
                    Core.tchau(0)
                else:
                    res = Core.divisao(num1, num2)
                    print(f'A resposta da operação {num1} / {num2} é igual a {res}')
                    Core.tchau(0)

        else:
            if(opcao == 5):
                Algebrica.interpretador()
            else:
                print('Erro: Digite um número válido')
                exit(1)

# Classe que faz as operações matemáticas e possui funções auxiliares do programa
class Core:
    def tchau(erro):
        print(f'Programa encerrado. Erro: {erro}')
        exit(erro)

    def converter(n):
        try:
            s = float(n)
            return s
        except ValueError:
            print('Erro: Digite um número')
            Core.tchau(2)

    def soma(n1, n2):
        n1 = Core.converter(n1)
        n2 = Core.converter(n2)
        resultado = n1 + n2
        return resultado
    
    def subtracao(n1, n2):
        n1 = Core.converter(n1)
        n2 = Core.converter(n2)
        resultado = n1 - n2
        return resultado

    def multiplicacao(n1, n2):
        n1 = Core.converter(n1)
        n2 = Core.converter(n2)
        resultado = n1 * n2
        return resultado

    def divisao(n1, n2):
        resultado = n1 / n2
        return resultado

# Pequeno teste de algébrica que está em desenvolvimento, mas já possui um interpretador de monômios falho
class Algebrica:
    def interpretador():
        monomio1 = input('Digite o primeiro monômio (máximo 2 monômios): ')
        monomio2 = input('Digite o segundo monômio: ')
        operacao = input('Digite a operação entre os monômios: [+/-]: ')
        correto = input(f'A expressão {monomio1} {operacao} {monomio2} está correta? [S/n] ')
        if(correto == 's' or correto == 'S'):
            expressao = Algebrica.parser(monomio1, monomio2, operacao)
            print('Em desenvolvimento')
            print('-----------------------------------------------')
        else:
            Core.tchau(1)

    def parser(monomio1, monomio2, calculo):
       tokens = [monomio1, monomio2, calculo]
       return tokens

#Inicia o programa
Interface.perguntas()