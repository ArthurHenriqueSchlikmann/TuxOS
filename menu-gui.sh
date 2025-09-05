#!/usr/bin/env bash
senha=`kdialog --title "Instalador de programas do TuxOS" --password "Digite sua senha"`
if [ $? -eq 1 ]; then
    kdialog --sorry "Operação cancelada pelo usuário"
    exit 1
fi
categoria=`kdialog --title "Instalador de programas do TuxOS" --radiolist "Selecione a categoria" \
1 "Desenvolvimento" off \
2 "Jogos" off \
3 "Utilidades" off \
4 "Internet" off` 
case $categoria in
    1)
    CHOISE=$(kdialog --title "Instaldor de programas do TuxOS" --checklist "Selecione o que deseja instalar" \
        1 "Arduino IDE" off \
        2 "Visual Studio Code" off \
        3 "Apache Netbeans IDE" off)
    ;;
esac
echo ""