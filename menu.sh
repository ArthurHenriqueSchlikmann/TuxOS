

#!/bin/bash

# --- Verifica se e root ---
if [[ $EUID -ne 0 ]]; then
   echo "Este script precisa ser executado como root para instalar programas."
   echo "Por favor, execute: sudo bash \"$0\"" # Usa "$0" para referenciar o proprio script
   echo "Pressione ENTER para fechar esta janela."
   read -r
   exit 1
fi

# --- Define as opcoes do menu ---
# Formato: "TAG" "Descricao visivel" "Status (ON/OFF)"
# O status ON/OFF define se o item vem pre-marcado
OPTIONS=(
    "STEAM" "Loja de jogos Steam" OFF
    "SUPERTUXKART" "Jogo 3d open souce de kart" OFF
    "GIMP" "Editor de imagem GNU Image Manipulation Program" OFF
    "GOOGLE_CHROME" "Navegador de internet google chrome" OFF
    "VLC" "Player de video e audio VLC media player" OFF
    "LIBREOFFICE" "Suite de escritorio LibreOffice (completa)" ON
    "CHROMIUM" "Navegador web Chromium (versao open source do Chrome)" ON
    "SHOTWELL" "Gerenciador de fotos Shotwell" ON
    "INKSCAPE" "Editor de graficos vetoriais Inkscape" OFF
    "BLENDER" "Programa open-source para modelagem 3d e animacao" OFF
    "AUDACITY" "Editor de audio Audacity" OFF
    "PROTONUP_QT" "Gerenciador de versoes customizadas do proton(steam)" OFF
    "LUTRIS" "Plataforma para gerenciar jogos" OFF
    "HEROIC_GAMES_LAUNCHER" "Epic games store no linux" OFF
    "WINE" "Camada de compatibilidade (execute apps e jogos Windows com isso)" OFF
)

# --- Exibe o menu usando dialog ---
# As opcoes como --title, --checklist, etc. configuram a aparencia do menu
# 20 70 15: altura, largura, altura da lista (numero de itens visiveis)
CHOICES=$(dialog --stdout \
                --title "Instalador de Programas do tuxOS" \
                --checklist "Selecione os programas que deseja instalar (use ESPACO para marcar/desmarcar, SETAS para navegar).\n\nPressione ENTER para continuar." \
                20 70 15 \
                "${OPTIONS[@]}")

# --- Verifica se o usuario cancelou ---
# Se o usuario apertar Cancelar ou Esc, $? sera diferente de 0
if [ $? -ne 0 ]; then
    echo "Instalacao cancelada pelo usuario."
    echo "Pressione ENTER para fechar esta janela."
    read -r
    exit 0
    clear
fi

clear # Limpa o menu da tela para exibir o progresso

echo "Programas selecionados para instalacao:"
echo "$CHOICES"
echo ""

# --- Atualiza a lista de pacotes antes de instalar ---
echo "Atualizando lista de pacotes (apt-get update)..."
apt-get update

# --- Instala os programas selecionados ---
for CHOICE in $CHOICES
do
    echo "Instalando: $CHOICE..."
    case $CHOICE in
        "STEAM")
            apt-get install steam -y
            ;;
        "GIMP")
            apt-get install gimp -y
            ;;
        "VLC")
            apt-get install vlc -y
            ;;
        "LIBREOFFICE")
            apt-get install libreoffice -y
            ;;
        "CHROMIUM")
            apt-get install chromium-browser -y # Pacote para Chromium no Ubuntu
            ;;
        "SHOTWELL")
            apt-get install shotwell -y
            ;;
        "INKSCAPE")
            apt-get install inkscape -y
            ;;
        "AUDACITY")
            apt-get install audacity -y
            ;;
	"GOOGLE_CHROME")
	    wget -O /tmp/google-chrome-stable.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	    apt install /tmp/google-chrome-stable.deb
	    rm /tmp/google-chrome-stable.deb
	    ;;
	"SUPERTUXKART")
	    snap install supertuxkart
	    ;;
	"PROTONUP_QT")
	    flatpak install net.davidotek.pupgui2
	    ;;
	"HEROIC_GAMES_LAUNCHER")
 	    flatpak install com.heroicgameslauncher.hgl
	    ;;
	"LUTRIS")
	    add-apt-repository ppa:lutris-team/lutris -y
	    apt-get update
	    apt-get install lutris
	    ;;
	"WINE")
	    dpkg --add-architecture i386
	    mkdir -pm755 /etc/apt/keyrings
	    wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
	    wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
	    apt-get update
	    apt-get install --install-recommends winehq-staging
        ;;
    "BLENDER")
        snap install --classic blender
    esac
    echo ""
done

echo "Todos os programas selecionados foram processados!"
echo "Pressione ENTER para fechar esta janela."
read -r # Espera o usuario pressionar Enter para fechar o terminal
clear
