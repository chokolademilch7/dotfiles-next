#! /bin/bash
setupStow() {
  if ! type stow >/dev/null 2>&1; then
    echo "stow is not installed."
    echo "This script will required GNU stow command."
    echo "For mac command is here. → brew install stow"
    exit 1;
  fi
  stow -d ./packages -t $HOME nvim
  stow -d ./packages -t $HOME lazygit
  stow -d ./packages -t $HOME yabai
  stow -d ./packages -t $HOME skhd
  stow -d ./packages -t $HOME tmux
  stow -d ./packages -t $HOME alacrity
  stow -d ./packages -t $HOME starship
  echo "Success!!"
  exit 0;
}

case "$(eval echo '$'{$#})" in
  setup-stow)
    setupStow
    exit 0
    ;;
  setup-brew)
    echo "setup brew"
    exit 0
    ;;
  *)
    echo "This is 4mac.sh"
    exit 0
    ;;
esac
