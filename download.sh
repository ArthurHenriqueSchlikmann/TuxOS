release=0
read -p "Informe o item desejado para baixar(codigo, pkg.tar.gz ou iso): " release
if [[$release = "codigo"]] then
	wget https://github.com/ArthurHenriqueSchlikmann/TuxOS/archive/refs/tags/tag.tar.gz	
fi
if [[$release = "pkg.tar.gz"]]
	https://github.com/ArthurHenriqueSchlikmann/TuxOS/releases/download/tag/pkg.tar.xz
fi

