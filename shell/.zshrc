# Powerlevel10k Instant Prompt (mais cedo possível)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# Powerlevel10k custom config do dotfiles
[[ -f ~/dotfiles/shell/.p10k.zsh ]] && source ~/dotfiles/shell/.p10k.zsh

# Alias para abrir dotfiles no VS Code
alias dot='cd ~/dotfiles && code .'

# Função para dar push com mensagem
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

# ---------- Hyprland / Wayland Configs ---------- #

# Direciona todos apps para usar dotfiles/config
export XDG_CONFIG_HOME="$HOME/dotfiles/config"

# Link simbólico automático do hyprland.conf
[[ -d ~/.config/hypr ]] || mkdir -p ~/.config/hypr
ln -sf ~/dotfiles/config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf

# Tema do cursor (opcional)
export XCURSOR_THEME="Bibata-Modern-Classic"
export XCURSOR_SIZE=24

# Log de debug (opcional)
export HYPRLAND_LOG_WLR=1

# Atalho útil
alias hyprreload='hyprctl reload'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
