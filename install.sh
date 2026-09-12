#!/bin/bash

sudo pacman -S --needed base-devel git stow zsh ttf-meslo-nerd neovim npm python-pipx imagemagick awww waybar swaync firefox

git clone https://github.com/E1fl4/dotfiles.git ~/.dotfiles
git clone https://github.com/E1fl4/nvim-config.git ~/.dotfiles/.config/nvim
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
git clone https://github.com/hlissner/zsh-autopair.git ~/.zsh-autopair

if test -e ~/.config; then rm -r ~/.config; fi
cd ~/.dotfiles
stow .

mkdir -p ~/Pictures/Wallpapers
mv ~/.dotfiles/wallhaven-wqkgkq_3840x2160.png ~/Pictures/Wallpapers

awww-daemon & disown

pipx install pywal16
~/.local/bin/wal -t -i ~/Pictures/Wallpapers/wallhaven-wqkgkq_3840x2160.png

hyprctl reload

sudo chsh -s /bin/zsh $(whoami)
