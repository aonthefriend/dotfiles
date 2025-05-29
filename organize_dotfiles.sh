#!/bin/bash

set -e

printf "\n📁 Organizando estrutura dos dotfiles...\n"

# Define origem e destino
HOME_DIR="$HOME"
DOTFILES_DIR="$HOME_DIR/dotfiles"

# Função para mover arquivo, se existir
move_file() {
  local source_file="$1"
  local dest_dir="$2"
  local filename
  filename=$(basename "$source_file")

  if [[ -f "$source_file" && ! -L "$source_file" ]]; then
    mkdir -p "$DOTFILES_DIR/$dest_dir"
    mv "$source_file" "$DOTFILES_DIR/$dest_dir/$filename"
    printf "✅ %s movido para %s/\n" "$filename" "$dest_dir"
  else
    printf "⚠️  %s não encontrado em ~ — pulando %s.\n" "$filename" "$dest_dir"
  fi
}

# Organiza arquivos principais
move_file "$HOME_DIR/.zshrc" "shell"
move_file "$HOME_DIR/.p10k.zsh" "shell"

printf "✅ Dotfiles reorganizados com segurança.\n"
