{ config, pkgs, ... }:

{
  home.username = "nightowl";
  home.homeDirectory = "/Users/nightowl";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.zsh
    pkgs.curl
    pkgs.git
    pkgs.wget
    pkgs.stow
    pkgs.tmux
    pkgs.starship
    pkgs.ripgrep
    pkgs.fd
    pkgs.sd
    pkgs.bat
    pkgs.lsd
    pkgs.zoxide
    pkgs.fzf
    pkgs.jq
    pkgs.yq
    pkgs.delta
    pkgs.lazygit
    pkgs.ghq
    pkgs.terminal-notifier
    pkgs.plemoljp
    pkgs.plemoljp-nf
    pkgs.plemoljp-hs
    pkgs.mise
    pkgs.xplr
  ];

  home.file = {
    # nix
    ".config/nix/nix.conf".source = ../packages/nix/.config/nix/nix.conf;

    # zsh
    ".zshrc".source = ../packages/zsh/.zshrc;
    ".zsh".source = ../packages/zsh/.zsh;

    # starship
    ".config/starship.toml".source = ../packages/starship/.config/starship.toml;
    
    # lazygit
    ".config/lazygit".source = ../packages/lazygit/.config/lazygit;
    
    # tmux
    ".config/tmux/tmux.conf".source = ../packages/tmux/.config/tmux/tmux.conf;
    
    # # alacritty
    ".config/alacritty/alacritty.toml".source = ../packages/alacritty/.config/alacritty/alacritty.toml;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager のアクティベーション時に zcompile を実行する
  home.activation = {
    zcompile = ''
      echo "zcompile を実行中..."
      ${pkgs.zsh}/bin/zsh -c "zcompile $HOME/.zshrc"
    '';
    nvim-packer = ''
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    '';
  };
}
