# ~/.zshrc

# ⏩ Powerlevel10k Instant Prompt (carregado o mais cedo possível)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 📂 Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# 🎨 Powerlevel10k config
[[ -f ~/dotfiles/shell/.p10k.zsh ]] && source ~/dotfiles/shell/.p10k.zsh

# 🧠 Histórico
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# ⚙️ Comportamento
setopt autocd
setopt correct
setopt hist_ignore_all_dups
setopt share_history

# 📦 PATH
export PATH="$HOME/.local/bin:$PATH"

# ⚡ Atalho para abrir dotfiles no VS Code
alias dot='cd ~/dotfiles && code .'

# 🚀 Função para commit e push rápido
dotpush() {
  cd ~/dotfiles || return
  git add -u
  git add .
  echo "Mensagem do commit:"
  read msg
  git commit -m "$msg"
  git push
  cd - || return
}

# ⚠️ Compatibilidade extra: fallback se ~/.p10k.zsh existir
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 🔗 Link simbólico manual para hyprland.conf
ln -sf ~/dotfiles/config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
f