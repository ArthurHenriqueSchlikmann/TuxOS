add_ppa() {
    echo "Adicionando o ppa $1 e instalando o pacote $2"
    add-apt-repository "$1"
    apt-get update
    apt-get install "$2"
    
}
