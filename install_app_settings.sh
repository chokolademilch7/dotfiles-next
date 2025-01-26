#!/bin/zsh

STOW_PACKAGES_DIR="./packages"
APPLICATION_DIR="$HOME/Library/Application Support"

if type stow >/dev/null 2>&1; then
  echo "stow is already installed."
  echo "Are you ready ? We're ready for you. y/N"
  read input
  if [ $input = "y" ] || [ $input = "yes" ]; then
    stow -d $STOW_PACKAGES_DIR -t $HOME $APPLICATION_DIR/Cursor cursor
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
