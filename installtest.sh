#!/bin/bash
cd ~
echo "beginning installation..."
echo "-----------------------------------------------"
echo "installing git and base-devel"
sudo pacman -S --needed --noconfirm git base-devel
echo "-----------------------------------------------"
echo "loading programms from list:"
programmlist=$(cat pacman-programm-list.txt) 
programmlist=${programmlist//$'\n'}

cat pacman-programm-list.txt
echo "-----------------------------------------------"
#pacman -S --noconfirm micro exa tldr fish mc code fzf gnome-shell-extensions alacritty kicad freecad discord teamspeak3 spotify-launcher inkscape btop
# pacman --noconfirm | cat pacman-programm-list.txt

# install all programms from the list
sudo pacman -S --noconfirm - < pacman-programm-list.txt

# install yay
echo "-----------------------------------------------"
echo "installing yay"
cd ~
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg --syncdeps --install --needed --noconfirm
echo "-----------------------------------------------"
cd ~


echo "-----------------------------------------------"
echo "downloading themes"
# download themes
# gedit
# alacritty
# starship
# 

echo "-----------------------------------------------"
echo "moving configs"
#move all configs to the right directory

#configs to move
#fish
#pacman
#alacritty

