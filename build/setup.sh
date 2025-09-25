#!/bin/bash

OPTIONS=(
    "BUILD" "Construir o TuxOS" 
    "CLEAN" "Limpar arquivos de construcao"
    "EXIT" "Sair"
)

CHOICE=$(dialog --stdout \
                --title "Construir o TuxOS" \
                --menu "Escolha uma opcao:" \
                20 70 15 \
                "${OPTIONS[@]}")

clear