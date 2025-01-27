{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.git
          pkgs.curl
        ];
      };
    };
}