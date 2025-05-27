#!/usr/bin/env bash

# Cria diretórios necessários no ~/.config
mkdir -p ~/.config/hypr
mkdir -p ~/.config/kitty
mkdir -p ~/.config/zsh
mkdir -p ~/.hidden/code

# Cria symlinks dos arquivos versionados
ln -sf "$HOME/dotfiles/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
ln -sf "$HOME/dotfiles/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
ln -s ~/.hidden/code ~/code

# Mensagem de sucesso
echo "Symlinks criados com sucesso."
