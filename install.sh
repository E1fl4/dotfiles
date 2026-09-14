#!/bin/bash



sudo pacman -S --needed base-devel git stow zsh ttf-meslo-nerd neovim npm unzip python-pipx imagemagick awww rofi waybar swaync firefox man-db
git clone https://github.com/E1fl4/dotfiles.git ~/.dotfiles
git clone https://github.com/E1fl4/nvim-config.git ~/.dotfiles/.config/nvim
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
git clone https://github.com/hlissner/zsh-autopair.git ~/.zsh-autopair
pipx install pywal16



default_kb_layout=$(localectl | grep Keymap | cut -c 16-17)
read -p "Keyboard layout (default: $default_kb_layout): " kb_layout
if [ "$kb_layout" == "" ]; then kb_layout=$default_kb_layout; fi
sed -i "217s/no/$kb_layout/" ~/.dotfiles/.config/hypr/hyprland.lua

read -p "Scale (default: 1.25): " scale
if [ "$scale" == "" ]; then scale=1.25; fi
sed -i "12s/1.25/$scale/" ~/.dotfiles/.config/hypr/hyprland.lua



mkdir -p ~/Pictures/Wallpapers
mv ~/.dotfiles/wallhaven-wqkgkq_3840x2160.png ~/Pictures/Wallpapers

awww-daemon & disown

if test -e ~/.config; then rm -r ~/.config; fi
cd ~/.dotfiles
stow .

~/.local/bin/wal -t -i ~/Pictures/Wallpapers/wallhaven-wqkgkq_3840x2160.png

hyprctl reload

waybar & disown
pkill dunst
swaync & disown

sudo chsh -s /bin/zsh $(whoami)
