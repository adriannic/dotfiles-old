#!/bin/sh
echo "Installing yay"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
echo "Installing zsh and kitty"
yay -S zsh-you-should-use zsh zsh-autosuggestions thefuck exa zsh-theme-powerlevel10k-git zsh-syntax-highlighting ttf-meslo-nerd-font-powerlevel10k kitty --noconfirm
git clone https://github.com/adriannic/dotfiles
cp dotfiles/kitty.conf ~/.config/kitty/
cp dotfiles/.zshrc ~
cp dotfiles/.p10k.zsh ~
rm -rf dotfiles

