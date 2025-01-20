{pkgs ? import <nixpkgs> {}}: let
  lut-apply = pkgs.writers.writePython3Bin "lut-apply" {} (builtins.readFile ./scripts/lutgen.py);
in
  pkgs.mkShell {
    nativeBuildInputs = with pkgs.buildPackages; [python3 lutgen lut-apply];
  }
