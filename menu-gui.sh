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
        3 "Apache Netbeans IDE" off \
        4 "GIMP" off \ 
        5 "Inkscape" off \
        6 "Audacity" off \
        7 "Blender" off)
        if [ -z "$CHOICE" ]; then
            kdialog --sorry "Nenhum programa selecionado"
            exit 1
        fi
    
        # Divide a string de IDs em um array e itera sobre cada escolha
        OIFS=$IFS
        IFS='|'
        for item in $CHOICE; do
            case $item in
                1)
                    echo "$senha" | sudo -S apt install arduino -y
                ;;
                2)
                    echo "$senha" | sudo -S wget -O /tmp/vscode.deb https://github.com/ArthurHenriqueSchlikmann/TuxOS/releases/download/vscode/code_1.103.2-1755709794_amd64.deb
                    echo "$senha" | sudo -S apt install ./vscode.deb -y
                ;;
                3)
                    echo "$senha" | sudo -S apt install openjdk-21-jdk
                    echo "$senha" | sudo -S snap install netbeans --classic
                ;;
            4)
                echo "$senha" | sudo -S apt install gimp -y
            ;;
            5)
                echo "$senha" | sudo -S apt install inkscape -y
            ;;
            6)
                echo "$senha" | sudo -S apt install audacity -y
            ;;
            7)
                echo "$senha" | sudo -S snap install blender --classic
            ;;
        esac
    done
    IFS=$OIFS
    ;;
esac

echo "Instalação concluída!"
    ;;
esac
echo ""