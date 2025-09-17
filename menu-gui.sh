#!/usr/bin/env bash

# Solicita a senha do usuário
senha=$(kdialog --title "Instalador de programas do TuxOS" --password "Digite sua senha")
if [ $? -eq 1 ]; then
    kdialog --title "Instalador de programas do TuxOS" --sorry "Operação cancelada pelo usuário"
    exit 1
fi

# Solicita a categoria
categoria=$(kdialog --title "Instalador de programas do TuxOS" --radiolist "Selecione a categoria" \
1 "Desenvolvimento" off \
2 "Jogos" off \
3 "Utilidades" off \
4 "Internet" off) 

# Usa uma barra de progresso para a instalação
case $categoria in
    "1")
        # Captura as escolhas em um array de forma segura
        readarray -t choices <<< $(kdialog --title "Instalador de programas do TuxOS" --checklist "Selecione o que deseja instalar" \
            1 "Arduino IDE" off \
            2 "Visual Studio Code" off \
            3 "Apache Netbeans IDE" off \
            4 "GIMP" off \
            5 "Inkscape" off \
            6 "Audacity" off \
            7 "Blender" off | tr '|' '\n')
   
        # O loop agora itera sobre cada item do array de forma segura
        (
        for item in "${choices[@]}"; do
            case $item in
                "1")
                    echo "# Instalando Arduino IDE"
                    echo "$senha" | sudo -S apt install arduino -y 
                ;;
                "2")
                    echo "# Instalando Visual Studio Code"
                    echo "$senha" | sudo -S wget -O /tmp/vscode.deb https://github.com/ArthurHenriqueSchlikmann/TuxOS/releases/download/vscode/code_1.103.2-1755709794_amd64.deb
                    echo "$senha" | sudo -S apt install /tmp/vscode.deb -y
                ;;
                "3")
                    echo "# Instalando Apache Netbeans IDE"
                    echo "$senha" | sudo -S apt install openjdk-21-jdk -y
                    echo "$senha" | sudo -S snap install netbeans --classic
                ;;
                "4")
                    echo "# Instalando GIMP"
                    echo "$senha" | sudo -S apt install gimp -y
                ;;
                "5")
                    echo "# Instalando Inkscape"
                    echo "$senha" | sudo -S apt install inkscape -y
                ;;
                "6")
                    echo "# Instalando Audacity"
                    echo "$senha" | sudo -S apt install audacity -y
                ;;
                "7")
                    echo "# Instalando Blender"
                    echo "$senha" | sudo -S snap install blender --classic
                ;;
            esac
        done
    # Adicione aqui os cases para as outras categorias (Jogos, Utilidades, etc.)
    esac

echo "Instalação concluída!"
echo ""
) | kdialog --title "Progresso da Instalação" --progressbar ""

kdialog --title "Instalação" --msgbox "Instalação concluída com sucesso!"