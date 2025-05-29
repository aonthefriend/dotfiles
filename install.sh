#!/bin/bash

set -e

# Cores para saída legível
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

echo -e "${GREEN}[+] Iniciando instalação de dotfiles...${NC}"

# Verifica se o stow está instalado
if ! command -v stow &> /dev/null; then
  echo -e "${RED}[-] 'stow' não está instalado. Instale com 'sudo pacman -S stow'${NC}"
  exit 1
fi

# Diretórios a serem linkados
DIRS=("shell" "zsh" "thunar" "kitty" "hypr")

for dir in "${DIRS[@]}"; do
  echo -e "${GREEN}[+] Linkando $dir${NC}"
  stow -v -R -t "$HOME" "$dir"
done

echo -e "${GREEN}[✓] Dotfiles instalados com sucesso.${NC}"
