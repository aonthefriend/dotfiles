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

# Função para git push com mensagem de commit
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

# Função para git commit e push com mensagem para o curso CWI
CWIpush() {
  echo -n "Mensagem do commit: "
  read msg
  if [ -z "$msg" ]; then
    echo "❌ Commit cancelado (mensagem vazia)."
    return 1
  fi

  git add .
  git commit -m "$msg" && git push && echo "✅ Commit e push feitos com sucesso!"
}


# Função para descompactar arquivos ZIP
descompact() {
  if [[ -z "$1" ]]; then
    echo "Uso: descompact caminho/para/arquivo.zip"
    return 1
  fi

  local ZIP_PATH="$1"

  if [[ ! -f "$ZIP_PATH" ]]; then
    echo "Erro: arquivo '$ZIP_PATH' não encontrado."
    return 2
  fi

  local BASENAME
  BASENAME=$(basename "$ZIP_PATH" .zip)
  local DIRNAME
  DIRNAME=$(dirname "$ZIP_PATH")
  local DEST_DIR="${DIRNAME}/${BASENAME}"

  mkdir -p "$DEST_DIR"

  unzip -o "$ZIP_PATH" -d "$DEST_DIR"

  echo "✅ Arquivo extraído em: $DEST_DIR"
}

# Função para compactar arquivos ou pastas em ZIP
compact() {
  if [[ -z "$1" ]]; then
    echo "Uso: compact caminho/para/arquivo_ou_pasta"
    return 1
  fi

  local TARGET_PATH="$1"

  if [[ ! -e "$TARGET_PATH" ]]; then
    echo "Erro: '$TARGET_PATH' não existe."
    return 2
  fi

  local DIRNAME
  DIRNAME=$(dirname "$TARGET_PATH")
  local BASENAME
  BASENAME=$(basename "$TARGET_PATH")
  local OUTPUT="${DIRNAME}/${BASENAME}.zip"

  zip -r "$OUTPUT" "$TARGET_PATH"

  echo "✅ Arquivo compactado em: $OUTPUT"
}

# Função para listar arquivos e diretórios com detalhes
listfiles() {
  if [[ -z "$1" ]]; then
    echo "Uso: list_files caminho/para/diretorio"
    return 1
  fi

  local DIR="$1"

  if [[ ! -d "$DIR" ]]; then
    echo "Erro: '$DIR' não é um diretório válido."
    return 2
  fi

  echo "Listando arquivos em: $DIR"
  ls -lh "$DIR"
}

# Função para verificar o status do sistema
systemstatus() {
  echo "🔍 Verificando status do sistema..."
  echo "📦 Uso de disco:"
  df -h

  echo ""
  echo "🧠 Uso de memória:"
  free -h

  echo ""
  echo "🔌 Conexões de rede:"
  netstat -tuln

  echo ""
  echo "📂 Arquivos abertos:"
  lsof | head -n 10
}
