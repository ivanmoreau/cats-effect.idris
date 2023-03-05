{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    idris2_jvm.url = "github:ivanmoreau/idrisjvm-flake.nix";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem = { pkgs, lib, config, system, ... }: {
        packages.idris2_jvm = inputs.idris2_jvm.packages.${system}.idris2_jvm;
        devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              config.packages.idris2_jvm
              mill
            ];
          };
      };
    };
}
