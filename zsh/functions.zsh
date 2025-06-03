# Funções customizadas

# Função para verificar se um comando está instalado
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1" ;;
      *.tar.gz)    tar xzf "$1" ;;
      *.bz2)       bunzip2 "$1" ;;
      *.rar)       unrar x "$1" ;;
      *.gz)        gunzip "$1" ;;
      *.tar)       tar xf "$1" ;;
      *.tbz2)      tar xjf "$1" ;;
      *.tgz)       tar xzf "$1" ;;
      *.zip)       unzip "$1" ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1" ;;
      *)           echo "'$1' não pode ser extraído via extract()" ;;
    esac
  else
    echo "'$1' não é um arquivo válido"
  fi
}

# Função para abrir o diretório de dotfiles
dotpush() {
  echo "📦 Indo para: $(pwd)"
  echo "📄 Status do repositório:"
  git status
  echo ""

  echo "✏️  Digite a mensagem do commit (ou pressione ENTER para cancelar):"
  read commit_msg

  if [[ -z "$commit_msg" ]]; then
    echo "⚠️  Commit cancelado: mensagem vazia."
    return 1
  fi

  git add .
  git commit -m "$commit_msg"
  git push
}


