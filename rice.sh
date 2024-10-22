#! /bin/bash

## first, let's install some components
yay -S ttf-jetbrains-mono-nerd skeuos-gtk flat-remix-git spicetify-cli shell-color-scripts-git

## now let's rice!

cp -r .config ~
cp -r .local ~
cp -r .vim ~
cp -r .mpd ~
sudo cp -r usr /
sudo cp -e etc /

for i in .bashrc .vimrc .viminfo
    do 
        ln -rsfv $i ~/$i
        sudo ln -rsfv $i /root/~$i
    done

spicetify backup apply enable-devtools
spicetify config current_theme text
spicetify config color_scheme FlatRemixEOS
