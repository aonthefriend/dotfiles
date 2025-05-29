#!/bin/bash

set -e

BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Organizando dotfiles. Backups serão salvos em: $BACKUP_DIR"

move_dotfile() {
  src="$HOME/$1"
  dest="$HOME/dotfiles/$2"

  if [ -f "$src" ] || [ -d "$src" ]; then
    echo "Movendo $src → $dest"
    mv "$src" "$BACKUP_DIR/"
    mkdir -p "$(dirname "$dest")"
    cp -r "$BACKUP_DIR/$(basename "$src")" "$dest"
  else
    echo "Arquivo $src não encontrado, ignorando."
  fi
}

# Exemplos (adicione outros conforme necessário)
move_dotfile ".zshrc" "shell/.zshrc"
move_dotfile ".config/hypr/hyprland.conf" "hypr/hyprland.conf"
move_dotfile ".config/kitty/kitty.conf" "kitty/kitty.conf"

echo "Organização concluída."
