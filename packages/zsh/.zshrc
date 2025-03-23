# import settings files
source $HOME/.zsh/.zshrc.init
source $HOME/.zsh/.zshrc.alias
source $HOME/.zsh/.zshrc.keybind

# secret settings
# nix is not linked to zshrc.secret. user should create a new file on home directory
# source $HOME/.zshrc.secret

# define
export TERM=tmux-256color
export EDITOR=nvim
export HOME_MANAGER_DIR=$HOME/.config/home-manager
export DARWIN_HOSTNAME=$(hostname -s)

# path
export PATH="/usr/local/go/bin:$PATH"

