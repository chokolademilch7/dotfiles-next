#!/bin/zsh
mkdir -p $HOME/.config
[ -L $HOME/.config/home-manager ] && rm $HOME/.config/home-manager
echo "Creating symlink for home-manager config"
if [ ! -d "$(pwd)/nix" ]; then
    echo "Error: nix directory not found in $(pwd)"
    exit 1
fi
if [ ! -f "$(pwd)/nix/flake.nix" ]; then
    echo "Error: flake.nix not found in $(pwd)/nix"
    exit 1
fi
ln -s "$(pwd)/nix" $HOME/.config/home-manager
echo "Do you want to switch to the new home-manager config? (y/n)"
read -r REPLY
if [[ $REPLY =~ ^[Yy]$ ]]
then
    nix run github:nix-community/home-manager --experimental-features "nix-command flakes" switch -- --experimental-features "nix-command flakes"
fi
