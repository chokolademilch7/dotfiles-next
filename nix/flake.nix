{
  description = "Development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # devShellsをpackagesに変更し、defaultPackageを追加
        packages.default = pkgs.buildEnv {
          name = "default-env";
          paths = with pkgs; [
            git
            curl
            zsh
          ];
        };

        # devShellsは残しておく
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            git
            curl
            zsh
          ];
          
          shellHook = ''
            exec zsh
          '';
        };
      }
    );
}