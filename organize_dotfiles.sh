#!/bin/bash

set -e

cd ~/dotfiles || { echo "Erro: ~/dotfiles não encontrado."; exit 1; }

# Hypr
if [ -f config/hypr/hyprland.conf ]; then
  mkdir -p hypr/.config/hypr
  mv config/hypr/hyprland.conf hypr/.config/hypr/
fi

# Kitty
if [ -f config/kitty/kitty.conf ]; then
  mkdir -p kitty/.config/kitty
  mv config/kitty/kitty.conf kitty/.config/kitty/
fi

# GTK
if [ -d config/gtk-3.0 ]; then
  mkdir -p gtk/.config/gtk-3.0
  mv config/gtk-3.0/* gtk/.config/gtk-3.0/ 2>/dev/null || true
fi

# Thunar
if [ -d Thunar ]; then
  mkdir -p thunar/.config/Thunar
  mv Thunar/* thunar/.config/Thunar/ 2>/dev/null || true
fi

# Zsh
if [ -f shell/.zshrc ]; then
  mkdir -p zsh
  mv shell/.zshrc zsh/.zshrc
fi

# Shell (.zshrc)
organizar_shell() {
  if [ -f ~/.zshrc ]; then
    mkdir -p shell
    mv ~/.zshrc shell/.zshrc
    echo "✅ .zshrc movido para shell/.zshrc"
  else
    echo "⚠️  .zshrc não encontrado em ~ — pulando shell."
  fi
}
organizar_shell

# Limpeza de pastas vazias
rm -rf config shell Thunar

echo "✅ Dotfiles reorganizados com segurança."
