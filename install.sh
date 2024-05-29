cd /tmp/
wget https://github.com/ArthurHenriqueSchlikmann/TuxOS/releases/download/tag/pkg.tar.xz
tar -xvf pkg.tar.gz
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
apt update
apt install winehq-stable

