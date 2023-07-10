#! /bin/bash
if ! type brew >/dev/null 2>&1; then
  echo "brew is not installed."
fi
if type stow >/dev/null 2>&1; then
  echo "stow is already installed."
  echo "Are you ready ? We're ready for you. y/N"
  read input
  if [ $input = "y" ] || [ $input = "yes" ]; then
    stow -d ./packages -t $HOME nvim
    stow -d ./packages -t $HOME lazygit
    stow -d ./packages -t $HOME yabai
    stow -d ./packages -t $HOME skhd
    stow -d ./packages -t $HOME tmux
    stow -d ./packages -t $HOME alacrity
    stow -d ./packages -t $HOME starship
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
