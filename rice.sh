#! /bin/bash

## first, let's install some components
yay -S ttf-jetbrains-mono-nerd terminus-font ttf-roboto flat-remix-gtk flat-remix spicetify-cli shell-color-scripts-git

## now, let's rice!

cp -rv .config ~
cp -rv .local ~
cp -rv .vim ~
cp -rv .mpd ~
sudo cp -rv usr /
sudo cp -rv etc /

for i in .bashrc .vimrc .viminfo
    do 
        ln -rsfv $i ~/$i
        sudo ln -rsfv $i /root/~$i
    done

# spicetify backup apply enable-devtools
# spicetify config current_theme text
# spicetify config color_scheme FlatRemixEOS
