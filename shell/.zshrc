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

# command code ~/dotfiles
alias dot='cd ~/dotfiles && code .'

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