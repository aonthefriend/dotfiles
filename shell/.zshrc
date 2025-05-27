source $ZSH/oh-my-zsh.sh

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
