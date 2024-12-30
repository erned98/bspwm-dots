#! /bin/bash

## before we start...

echo -e '\n\e[1;91mWARNING!\e[1;97m This script assumes you have access to AUR (Arch User Repository). \e[0m\n\nYou can continue running this script if you have AUR helper installed (in this case, yay).\nIf not, exit the script and install AUR helper as follows: \n\n1. git clone https://aur.archlinux.org/yay.git \n2. cd yay \n3. makepkg -si \n\nAlso, bear in mind that script can install the apps you define in the last section. \n\e[1;97mIt might be a good idea to step back and examine the script if you have not done it yet.\e[0m\n\n'

while true; do
    read -p "Do you wish to continue running the script? (yes / no) " yn
    case $yn in
        [yes]* )
            ## first of all, let's take care of mirrors
            sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
            eos-rankmirrors --verbose       # comment out if you don't use EndeavourOS
            yay -Syyu

            ## now, let's install!
            # let's install graphical environment
            echo -e '\e[1;96mInstalling basic graphical environment...\e[0m'
            PS3='Please choose your video drivers: '
            options=("Intel" "AMD" "Nvidia" "QXL" "Abort")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Intel")
                        yay -S xorg xorg-xinit kitty bspwm sxhkd nitrogen picom rofi rofi-power-menu dunst polybar xf86-video-intel polkit-gnome && break
                        ;;
                    "AMD")
                        yay -S xorg xorg-xinit kitty bspwm sxhkd nitrogen picom rofi rofi-power-menu dunst polybar xf86-video-amdgpu polkit-gnome && break
                        ;;
                    "Nvidia")
                        yay -S xorg xorg-xinit kitty bspwm sxhkd nitrogen picom rofi rofi-power-menu dunst polybar nvidia nvidia-utils polkit-gnome && break
                        ;;
                    "QXL")
                        yay -S xorg xorg-xinit kitty bspwm sxhkd nitrogen picom rofi rofi-power-menu dunst polybar xf86-video-qxl polkit-gnome && break
                        ;;
                    "VMWare")
                        yay -S xorg xorg-xinit kitty bspwm sxhkd nitrogen picom rofi rofi-power-menu dunst polybar xf86-video-vmware polkit-gnome && break
                        ;;
                    "Abort")
                        echo -e '\e[1;31mInstallation aborted.' ; exit
                        ;;
                    *) echo "Option invalid. $REPLY";;
                esac
            done

            # let's install other under-the-hood utilities
            echo -e '\e[1;96mInstalling under-the-hood utilities...'
            yay -S pulsemixer ly betterlockscreen pipewire pipewire-pulse pipewire-alsa pipewire-jack ufw
            
            # let's install basic apps
            echo -e '\e[1;96mInstalling basic applications...'
            yay -S firefox feh ncmpcpp mpd mpc zathura zathura-pdf-mupdf ranger fastfetch mpv mplayer gvim timeshift scrot lxappearance-gtk3 htop

            # let's install some additional apps
            echo -e '\e[1;96mInstalling user-defined applications...'
            yay -S android-tools libreoffice-fresh qalculate-gtk spotify-launcher calcurse newsboat redshift mp3gain ffmpeg gimp audacity

            # let's turn on some services
            sudo systemctl enable ly.service
            sudo systemctl enable ufw.service
            
            # now, let's rice!
            echo -e '\e[1;32mThe installation has completed. \e[1;97mNow, run the script rice.sh to start applying customisations to your desktop.\e[0m' ; exit
            ;;
        [no]* ) echo -e '\e[1;91mInstallation aborted.' ; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

