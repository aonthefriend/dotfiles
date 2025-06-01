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

# ⚙️ Compatibilidade extra: fallback se ~/.p10k.zsh existir
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 🧩 Carregar configurações modulares do shell (se existirem)
[[ -f ~/.config/zsh/aliases.zsh ]]   && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/env.zsh ]]       && source ~/.config/zsh/env.zsh
[[ -f ~/.config/zsh/exports.zsh ]]   && source ~/.config/zsh/exports.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh
[[ -f ~/.config/zsh/path.zsh ]]      && source ~/.config/zsh/path.zsh
