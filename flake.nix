{
  description = "Reproduction of a but where cloning a custom branch breaks Flake evaluation.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      package =
        ({ runCommandNoCC }:
          runCommandNoCC "example" {} ''
						touch $out
					''
        );
    in
    {
      packages.${system}.example = nixpkgs.legacyPackages.${system}.callPackage package { };
    };
}
