
function getImage()
{
    if ! command -v wget &> /dev/null; then
        dialog --title "ERRO CRITICO DE DEPENDENCIA" --msgbox "O comando 'wget' não foi encontrado, por favor, instale-o e tente novamente"
        return 1
    fi
    URL=$1
    LOCAL=$2
    echo "$LOCAL/base.iso"
    #wget "$URL" -O "$LOCAL/base.iso"
}