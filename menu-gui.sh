#!/usr/bin/env bash
senha=`kdialog --title "Instalador de programas do TuxOS" --password "Digite sua senha"`
if [ $? -eq 1 ]; then
    kdialog --sorry "Operação cancelada pelo usuário"
    exit 1
fi
categoria=`kdialog --radiolist "Selecione a categoria" \
1 "Desenvolvimento" off \
2 "Jogos" off \
3 "Utilidades" off \
4 "Internet" off`
