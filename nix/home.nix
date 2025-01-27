{ config, pkgs, ... }:

{
  home.username = "test";
  home.homeDirectory = "/Users/test";

  home.stateVersion = "24.11";

  home.packages = [
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
    pkgs.neovim
    pkgs.lazygit
    pkgs.delta
    pkgs.gh
    pkgs.ghq
    pkgs.yabai
    pkgs.skhd
    pkgs.terminal-notifier
    pkgs.plemoljp
    pkgs.plemoljp-nf
    pkgs.plemoljp-hs
  ];

  home.file = {
    # zsh
    ".zshrc".source = ../packages/zsh/.zshrc;
    ".zsh".source = ../packages/zsh/.zsh;
    
    # karabiner
    ".config/karabiner/karabiner.json".source = ../packages/karabiner/.config/karabiner/karabiner.json;
    
    # nvim
    ".config/nvim".source = ../packages/nvim/.config/nvim;
    
    # lazygit
    ".config/lazygit".source = ../packages/lazygit/.config/lazygit;
    
    # yabai
    ".config/yabai".source = ../packages/yabai/.config/yabai;
    
    # skhd
    ".config/skhd".source = ../packages/skhd/.config/skhd;
    
    # tmux
    ".tmux.conf".source = ../packages/tmux/.tmux.conf;
    
    # alacritty
    ".config/alacritty".source = ../packages/alacritty/.config/alacritty;
    
    # starship
    ".config/starship.toml".source = ../packages/starship/.config/starship.toml;
    
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
