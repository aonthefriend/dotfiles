# Cria diretórios necessários
mkdir -p ~/.config/hypr
mkdir -p ~/.config/kitty
mkdir -p ~/.config/zsh

# Cria symlinks dos arquivos versionados
ln -sf "$HOME/dotfiles/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
ln -sf "$HOME/dotfiles/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.p10k.zsh" "$HOME/.config/zsh/.p10k.zsh"

# Mensagem de sucesso
echo "Symlinks criados com sucesso."
