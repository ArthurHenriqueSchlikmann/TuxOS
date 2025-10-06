#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")


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

    if [ "$CHOICE" == "BUILD" ]; then 
        source "$SCRIPT_DIR/lib/build.sh"
        getImage https://cdimage.ubuntu.com/ubuntu-unity/noble/daily-live/current/noble-desktop-amd64.iso "$SCRIPT_DIR/build"
    fi
dialog --title "Construir o TuxOS" --msgbox "Script terminado com saída 0"
#clear