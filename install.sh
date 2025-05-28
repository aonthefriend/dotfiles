#!/bin/bash

echo "🚀 Iniciando instalação dos dotfiles..."

# Pasta base do repositório
DOTFILES_DIR="$HOME/dotfiles"

# Função: organiza os arquivos para estrutura compatível com stow
organizar_dotfiles() {
  echo "📁 Organizando estrutura dos dotfiles..."

  mkdir -p "$DOTFILES_DIR/shell"
  mkdir -p "$DOTFILES_DIR/config"

  # Move .zshrc se existir
  if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$DOTFILES_DIR/shell/.zshrc"
    echo "✅ .zshrc movido para shell/"
  else
    echo "⚠️  .zshrc não encontrado em ~ — pulando shell."
  fi

  echo "✅ Dotfiles reorganizados com segurança."
}

# Função: aplica symlinks com stow
criar_symlinks() {
  echo "🔗 Criando symlinks com stow..."
  cd "$DOTFILES_DIR" || exit 1

  for pasta in gtk hypr kitty thunar shell; do
    if [ -d "$DOTFILES_DIR/config/$pasta" ]; then
      echo "→ stow $pasta (em config/)"
      stow --dir=config "$pasta"
    elif [ -d "$DOTFILES_DIR/$pasta" ]; then
      echo "→ stow $pasta"
      stow "$pasta"
    else
      echo "⏩ Pasta $pasta não existe, ignorando..."
    fi
  done

  # Link simbólico extra (reafirmação para evitar erros)
  mkdir -p "$HOME/.config/hypr"
  ln -sf "$DOTFILES_DIR/config/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"

  echo "✅ Instalação completa!"
}

# Execução
organizar_dotfiles
criar_symlinks
