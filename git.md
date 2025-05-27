# Git - Anotações Pessoais

## Comandos principais (alias)

```sh
alias dot='cd ~/dotfiles && code .'
alias dotpush='git add . && git commit -m "feat: adiciona config de blur no Hyprland" && git push'
alias dotcheck='git status && git diff'
```

## Fluxo de trabalho (VS Code + Git)

1. Abrir o diretório:

   ```sh
   dot
   ```
2. Fazer alterações normalmente no VS Code.
3. Commitar via VS Code (botão "Commit" no Source Control ou atalho `Ctrl+Enter`).
4. Push pode ser feito via VS Code ou terminal com:

   ```sh
   git push
   # ou usar o alias
   dotpush
   ```

## Boas práticas

* Usar mensagens de commit no formato:

  ```
  tipo: resumo curto
  # Ex: feat: adiciona config de blur no Hyprland
  ```
* Salvar arquivos no VS Code antes de commitar (`Ctrl+S` ou `File > Save All`).
* Pode ativar o stage automático ao commitar ("Always" na janela de prompt).
* Permitir `git fetch` periódico (ajuda a manter atualizações remotas visíveis).

## Tipos de commit sugeridos

* `feat`: nova funcionalidade
* `fix`: correção de bug
* `docs`: mudanças em documentação
* `style`: formatação, espaços, ponto e vírgula etc (sem alteração de código)
* `refactor`: refatoramento de código
* `chore`: tarefas diversas, sem impacto no código

## Dica extra

* Deixe este arquivo salvo no seu repositório `dotfiles`, assim você nunca esquece seus comandos!
