{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = [
    pkgs.cabal-install
    pkgs.ghc
    pkgs.haskellPackages.cabal2nix
    pkgs.haskellPackages.cabal-fmt
    pkgs.nixfmt
    pkgs.ormolu
  ];
}
