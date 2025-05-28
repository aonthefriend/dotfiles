#!/usr/bin/env bash

# Cria os diretórios necessários no ~/.config
mkdir -p ~/.config/hypr
mkdir -p ~/.config/kitty
mkdir -p ~/.config/zsh
mkdir -p ~/.config/Code
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/Thunar

# Cria symlinks dos arquivos versionados
ln -sf "$HOME/dotfiles/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
ln -sf "$HOME/dotfiles/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
ln -sf "$HOME/dotfiles/config/Code" "$HOME/.config/Code"
ln -sf "$HOME/dotfiles/config/gtk-3.0" "$HOME/.config/gtk-3.0"
ln -sf "$HOME/dotfiles/config/Thunar" "$HOME/.config/Thunar"

# Mensagem de sucesso
echo "Symlinks criados com sucesso."
