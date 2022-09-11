#! /bin/bash
if type stow >/dev/null 2>&1; then
  echo "stow is already installed."
  echo "Are you ready ? We're ready for you. y/N"
  read input
  if [ $input = "y" ] || [ $input = "yes" ]; then
    stow -d ./config -t $HOME nvim
    stow -d ./config -t $HOME lazygit
    stow -d ./config -t $HOME yabai
    stow -d ./config -t $HOME skhd
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
