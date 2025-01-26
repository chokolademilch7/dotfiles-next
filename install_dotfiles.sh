#!/bin/zsh

STOW_PACKAGES_DIR="./packages"

if ! type brew >/dev/null 2>&1; then
  echo "brew is not installed."
fi
if type stow >/dev/null 2>&1; then
  echo "stow is already installed."
  echo "Are you ready ? We're ready for you. y/N"
  read input
  if [ $input = "y" ] || [ $input = "yes" ]; then
    stow -d $STOW_PACKAGES_DIR -t $HOME zsh
    stow -d $STOW_PACKAGES_DIR -t $HOME karabiner
    stow -d $STOW_PACKAGES_DIR -t $HOME nvim
    stow -d $STOW_PACKAGES_DIR -t $HOME lazygit
    stow -d $STOW_PACKAGES_DIR -t $HOME yabai
    stow -d $STOW_PACKAGES_DIR -t $HOME skhd
    stow -d $STOW_PACKAGES_DIR -t $HOME tmux
    stow -d $STOW_PACKAGES_DIR -t $HOME alacritty
    stow -d $STOW_PACKAGES_DIR -t $HOME starship
    stow -d $STOW_PACKAGES_DIR -t $HOME neovide
    echo "Success!!"
  elif [ $input = "n" ] || [ $input = "no" ]; then
    echo "See you later."
    exit 1
  fi
else
  echo "stow is not installed."
  echo "This script will required GNU stow command."
  echo "For mac command is here. → brew install stow"
fi
