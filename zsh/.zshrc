# ─────────────────────────────────────────────────────────────
# ZSH - Configuração principal
# ─────────────────────────────────────────────────────────────

# Ativar o tema Powerlevel10k (instalado localmente)
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Carregar configurações do prompt (personalizadas)
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ─────────────────────────────────────────────────────────────
# Histórico
# ─────────────────────────────────────────────────────────────

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ─────────────────────────────────────────────────────────────
# Prompt
# ─────────────────────────────────────────────────────────────

export PROMPT_EOL_MARK=""
setopt prompt_subst

# ─────────────────────────────────────────────────────────────
# Modularização dos arquivos
# ─────────────────────────────────────────────────────────────

[[ -f ~/dotfiles/zsh/aliases.zsh   ]] && source ~/dotfiles/zsh/aliases.zsh
[[ -f ~/dotfiles/zsh/exports.zsh   ]] && source ~/dotfiles/zsh/exports.zsh
[[ -f ~/dotfiles/zsh/functions.zsh ]] && source ~/dotfiles/zsh/functions.zsh
