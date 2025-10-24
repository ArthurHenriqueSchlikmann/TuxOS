#!/bin/bash

compile() {

}


wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.55.tar.xz -O ./files/kernel.tar.xz
if [[$? -eq 0]] then
    tar -xvf kernel.tar.xz
    compile
else
    dialog --title "TuxOS Kernel Compiler" --msgbox "The kernel failure to download, please try again" 20 40
    exit 1