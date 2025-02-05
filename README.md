# Overview
This repository contains my dotfiles and applications.
## Install Applications
- dynamic applications → Homebrew
- static applications → Nix-flake + Home-manager

## Install Dotfiles
- dynamic dotfiles → GNU stow
- static dotfiles → Nix-flake + Home-manager

# Setup Homebrew & Nix
- Homebrew: https://brew.sh/ja  
- Nix: https://nixos.org/download/

# Install Dotfiles
```
./install_dotfiles.sh
./install_nix.sh
```

## Setup Applications
neovim init
1. nvim open
2. `<leader><leader>z`

tmux init
1. tmux pane open
2. `M-o I`

# Additional Settings for macOS
## alt + tab
systemsettings -> keyboard -> shortcut -> keyboard -> next window ctl

`defaults write -g InitialKeyRepeat -int 11`

`defaults write -g KeyRepeat -int 1`
