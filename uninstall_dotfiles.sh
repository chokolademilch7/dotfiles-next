#! /bin/zsh

STOW_PACKAGES_DIR="./packages"

echo "GNU stowを使用して、ドットファイルのシンボリックリンクを削除します。"
echo "この操作は、すべてのインストールされたドットファイルのシンボリックリンクを削除します。"
echo "本当に実行しますか？ (y/N)"
read input
if [[ "$input" == "y" || "$input" == "yes" ]]; then
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" zsh
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" karabiner
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" nix
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" nvim
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" lazygit
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" yabai
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" skhd
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" tmux
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" alacritty
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" starship
  stow -D -d "$STOW_PACKAGES_DIR" -t "$HOME" neovide
  echo "アンインストールが完了しました。"
else
  echo "アンインストールを中止しました。"
  exit 1
fi
