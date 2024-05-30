if[[$(whoami) = "root"]] then
dire="null"
cd /tmp/
wget https://github.com/ArthurHenriqueSchlikmann/TuxOS/releases/download/tag/pkg.tar.xz
tar -xvf pkg.tar.gz
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
apt update
apt install winehq-stable
wine 3d-pinball-space-cadet-1.0-installer.exe
apt install ubuntu-unity-desktop
read -p "Diretório para salvar o arquivo do dash(qualquer um): " dire
cp /usr/share/unity/icons/launcher_bfb.png $dire
cp ./launcher_bfb.png /usr/share/unity/icons/launcher_bfb.png
apt install steam
apt install arduino
rm /etc/apt/preferences.d/nosnap.pref
apt update
apt install snapd
apt install idle
systemctl start snapd
systemctl enable snapd
snap install pycharm-community
flatpak install edu.mit.Scratch
flatpak install org.apache.netbeans
else
	echo "Você precisa ser root para executar a instalação do TuxOS"
fi
