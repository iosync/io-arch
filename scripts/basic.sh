#!/bin/bash


# Establecemos algunos colores colores
CNT="[\e[1;36mNOTA\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATENCION\e[0m]"
CWR="[\e[1;35mADVERTENCIA\e[0m]"
CAC="[\e[1;33mACCION\e[0m]"
INSTLOG="install.log"
clear


echo -ne "
-----------------------------------------------------------------
    ██╗ ██████╗                █████╗ ██████╗  ██████╗██╗  ██╗
    ██║██╔═══██╗              ██╔══██╗██╔══██╗██╔════╝██║  ██║
    ██║██║   ██║    █████╗    ███████║██████╔╝██║     ███████║
    ██║██║   ██║    ╚════╝    ██╔══██║██╔══██╗██║     ██╔══██║
    ██║╚██████╔╝              ██║  ██║██║  ██║╚██████╗██║  ██║
    ╚═╝ ╚═════╝               ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝
-----------------------------------------------------------------
        Automated Arch Linux Minimal Installations
            Autor: iosync
-----------------------------------------------------------------
"


sleep 2

### Instalacion de YAY ###

read -n1 -rep $'[\e[1;33mACCION\e[0m] - Quieres instalar YAY (s,n) ' INSTYAY
if [[ $INSTYAY == "S" || $INSTYAY == "s" ]]; then
    git clone https://aur.archlinux.org/yay.git &>> $INSTLOG
    cd yay-git
    makepkg -si --noconfirm &>> ../$INSTLOG
    cd ..
    
else
    echo -e "$CWR - Omitiendo la instalacion de YAY"
fi

sleep 2
 
### Instalacion de componentes de xorg ###

read -n1 -rep $'[\e[1;33mACCION\e[0m] - Quieres instalar Instalando Componentes de Xorg?" (s,n) ' INSTXORG
if [[ $INSTXORG == "S" || $INSTXORG == "s" ]]; then
    sudo pacman -S xorg xorg-xinit xorg-xinput
    echo -e "$COK - Xorg, xorg-init, xorg-xinput,Instalado."
else
    echo -e "$CWR - Omitiendo la instalacion de Xorg"
fi

sleep 2




### Instalacion de Drivers de Video ###
echo -e "[\e[1;33mACCION\e[0m] - Quieres instalar Drivers de Video?"
options=("1. Nvidia" "2. AMD(mesa)" "3. Intel")
select opt in "${options[@]}"
do
    case $opt in
        "1. Nvidia")
            sudo pacman -S nvidia
            break
        ;;
        "2. AMD(mesa)")
            sudo pacman -S mesa
            break
        ;;
        "3. Intel")
            sudo pacman -S xf86-video-intel
            break
        ;;
        *) 
            echo -e "$CWR - Omitiendo la instalacion de Drivers de video"
            break
        ;;
    esac
done
echo -e "$CNT - La Instalacion del Script ha Finalizado!\n\n"

###  OpenSource  ###
# sudo pacman -S xf86-video-nouveau mesa