#!/bin/bash

echo "Criando links simbólicos..."

ln -sf ~/dotfiles/config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf ~/dotfiles/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc

echo "Pronto!"
