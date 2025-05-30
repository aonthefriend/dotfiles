#!/bin/bash

set -e

# Cores para saída legível
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

# Função para backup de arquivos reais (não symlinks)
backup_file() {
  local file="$1"
  local full_path="$HOME/$file"

  if [[ -f "$full_path" && ! -L "$full_path" ]]; then
    local timestamp
    timestamp=$(date +%Y-%m-%d_%H-%M-%S)
    local backup_path="${full_path}.backup-${timestamp}"
    mv "$full_path" "$backup_path"
    echo -e "${GREEN}[~] Arquivo real '$file' movido para backup: $backup_path${NC}"
  fi
}

# Função para backup de arquivos em .config também
backup_config_file() {
  local file="$1"
  local full_path="$HOME/.config/$file"

  if [[ -f "$full_path" && ! -L "$full_path" ]]; then
    local timestamp
    timestamp=$(date +%Y-%m-%d_%H-%M-%S)
    local backup_path="${full_path}.backup-${timestamp}"
    mv "$full_path" "$backup_path"
    echo -e "${GREEN}[~] Arquivo real '$file' movido para backup: $backup_path${NC}"
  fi
}

echo -e "${GREEN}[+] Iniciando instalação de dotfiles...${NC}"

# Verifica se o stow está instalado
if ! command -v stow &> /dev/null; then
  echo -e "${RED}[-] 'stow' não está instalado. Instale com 'sudo pacman -S stow'${NC}"
  exit 1
fi

# Diretórios que realmente existem no repositório
DIRS=("shell" "gtk" "kitty" "thunar")

for dir in "${DIRS[@]}"; do
  if [ -d "$dir" ]; then
    echo -e "${GREEN}[+] Linkando $dir${NC}"

    # Fazer backup antes de linkar arquivos comuns
    case "$dir" in
      shell)
        backup_file ".zshrc"
        backup_file ".p10k.zsh"
        ;;
      kitty)
        backup_config_file "kitty/kitty.conf"
        ;;
      thunar)
        backup_config_file "Thunar/uca.xml"
        backup_config_file "Thunar/accels.scm"
        ;;
    esac

    stow -v -R -t "$HOME" "$dir"
  else
    echo -e "${RED}[!] Pasta '$dir' não encontrada. Ignorando...${NC}"
  fi
done

# Hypr deve ir para ~/.config/hypr/
if [ -d "hypr" ]; then
  echo -e "${GREEN}[+] Linkando hypr${NC}"
  mkdir -p "$HOME/.config/hypr"
  backup_config_file "hypr/hyprland.conf"
  stow -v -R -t "$HOME/.config" hypr
else
  echo -e "${RED}[!] Pasta 'hypr' não encontrada. Ignorando...${NC}"
fi

echo -e "${GREEN}[✓] Dotfiles instalados com sucesso.${NC}"
