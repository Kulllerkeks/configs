#!/bin/bash
echo "beginning installation..."
echo "moving pacman config"
yes | sudo cp configs/pacman/pacman.conf /etc/pacman.conf
sudo pacman -Syy
sudo pacman -Syu
echo "-----------------------------------------------"
echo "installing git and base-devel"
sudo pacman -S --needed --noconfirm git base-devel
echo "-----------------------------------------------"
echo "installing additional packages for lutris "
sudo pacman -S --noconfirm wine winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs
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
echo "installing yay-bin"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg --syncdeps --install --needed --noconfirm
echo "-----------------------------------------------"
cd ..

echo "-----------------------------------------------"
echo "setting default shell"
chsh -s $(which fish)

echo "-----------------------------------------------"
echo "downloading themes"

mkdir themes
cd themes
# download themes
# gedit

echo "-----------------------------------------------"
echo "moving configs"
#move all configs to the right directory

#fish
yes | cp configs/fish/config.fish ~/.config/fish/config.fish
# btop
yes | cp configs/btop/btop.conf ~/.config/btop/btop.conf
#alacritty
yes | cp configs/alacritty/alacritty.yml~/.config/alacritty/alacritty.yml
# starship
yes | cp configs/starship/starship.toml ~/.config/starship.toml
# micro settings
yes | cp configs/micro/settings.json ~/.config/micro/settings.json
# midnigt commander
yes | cp configs/mc/ini ~/.config/mc/ini

echo "-----------------------------------------------"
echo "installing programs from the aur"
yay --save --answerclean All --answerdiff None --noprovides --batchinstall --clean --removemake
yay -S - < yay-programm-list.txt
echo "-----------------------------------------------"
echo "finished!"
