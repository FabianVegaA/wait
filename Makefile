shell:
	nix-shell ./nix/shell.nix

build:
	nix-build ./nix/release.nix

update:
	cabal2nix . > ./nix/default.nix

test: build
	cabal test --test-show-details=direct