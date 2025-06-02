# Powerlevel10k Instant Prompt (mais cedo possível)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# Powerlevel10k config
[[ -f ~/dotfiles/shell/.p10k.zsh ]] && source ~/dotfiles/shell/.p10k.zsh

# Completamento
setopt autocd
setopt correct
setopt hist_ignore_all_dups
setopt share_history

# 🛣️ PATH
export PATH="$HOME/.local/bin:$PATH"

# ⌨️ Atalho para abrir dotfiles no VS Code
alias dot='cd ~/dotfiles && code .'

# 🌀 Função para commit e push rápido
dotpush() {
  cd ~/dotfiles || return

  git add -u
  git add .

  echo -n "Mensagem do commit: "
  read msg

  if [ -z "$msg" ]; then
    echo "❌ Commit cancelado: mensagem vazia."
    cd - || return
    return 1
  fi

  git commit -m "$msg" && git push

  cd - || return
}

setupwallpaper() {
  local CONF="$HOME/.config/hypr/hyprland.conf"
  local BACKUP="$HOME/.config/hypr/hyprland.conf.bak"

  echo "Instalando hyprpaper..."
  sudo pacman -S --noconfirm hyprpaper

  echo "Digite o caminho completo para o seu wallpaper (ex: /home/usuario/Pictures/wallpaper.jpg):"
  read WALLPAPER

  if [ ! -f "$WALLPAPER" ]; then
    echo "Arquivo não encontrado: $WALLPAPER"
    return 1
  fi

  echo "Testando wallpaper..."
  hyprpaper --output "*" --image "$WALLPAPER" &
  sleep 2

  cp "$CONF" "$BACKUP"
  echo "Backup do hyprland.conf salvo em $BACKUP"

  # Remove linhas existentes com hyprpaper
  sed -i '/exec-once = hyprpaper/d' "$CONF"

  # Insere depois da última exec-once
  local LAST_EXEC_ONCE_LINE
  LAST_EXEC_ONCE_LINE=$(grep -n '^exec-once' "$CONF" | tail -1 | cut -d: -f1)

  if [ -z "$LAST_EXEC_ONCE_LINE" ]; then
    echo "exec-once = hyprpaper --output \"*\" --image \"$WALLPAPER\"" >> "$CONF"
  else
    sed -i "${LAST_EXEC_ONCE_LINE}a exec-once = hyprpaper --output \"*\" --image \"$WALLPAPER\"" "$CONF"
  fi

  echo "Configuração atualizada! Por favor, reinicie o Hyprland para aplicar."
}

# ⚙️ Compatibilidade extra: fallback se ~/.p10k.zsh existir
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 🧩 Carregar configurações modulares do shell (se existirem)
[[ -f ~/.config/zsh/aliases.zsh ]]   && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/env.zsh ]]       && source ~/.config/zsh/env.zsh
[[ -f ~/.config/zsh/exports.zsh ]]   && source ~/.config/zsh/exports.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh
[[ -f ~/.config/zsh/path.zsh ]]      && source ~/.config/zsh/path.zsh
