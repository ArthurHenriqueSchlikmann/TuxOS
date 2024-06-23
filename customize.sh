read -p "Diretório para salvar o arquivo do dash(qualquer um): " dire
cp /usr/share/unity/icons/launcher_bfb.png $dire
cp ./launcher_bfb.png /usr/share/unity/icons/launcher_bfb.png
echo "Agora você podera customizar o sistema!!"
sleep 5
unity-tweak-tool
