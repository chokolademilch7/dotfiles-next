{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-darwin; # macOSの場合はこちら
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.git
          pkgs.curl
        ];
      };
    };
}