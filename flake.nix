{
  description = "wallpapers- catppuccin-ified!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
  }: let
    inherit (nixpkgs) lib;

    genSystems = lib.genAttrs (import systems);
    pkgsFor = nixpkgs.legacyPackages;
    version = self.shortRev or "dirty";
  in {
    overlays.default = _: prev: let
      genFlavour = flavour:
        prev.callPackage ./nix/builder.nix {
          inherit flavour version;
        };
    in {
      full = genFlavour null;
      latte = genFlavour "latte";
      frappe = genFlavour "frappe";
      macchiato = genFlavour "macchiato";
      mocha = genFlavour "mocha";
    };

    packages = genSystems (system:
      (self.overlays.default null pkgsFor.${system})
      // {
        default = self.packages.${system}.full;
      });

    formatter = genSystems (system: pkgsFor.${system}.alejandra);
  };
}
