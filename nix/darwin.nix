{ config, pkgs, ... }:

{
  system = {
    stateVersion = 6;
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowScrollBars = "Always";
        InitialKeyRepeat = 11;
        KeyRepeat = 1;
      };
      dock = {
        autohide = true;
        orientation = "bottom";
      };
    };
  };
}
