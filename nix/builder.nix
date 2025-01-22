# full credit to https://github.com/NotAShelf/wallpkgs/blob/e5a34ff48313b6ae38ac72da02f889ed8985d76b/nix/builder.nix
# license: MIT
{
  lib,
  stdenvNoCC,
  flavour ? null,
  version,
  pkgs,
  ...
}: let
  pname =
    if (flavour == null)
    then "wallpapers"
    else "wallpapers-${flavour}";

  lutApply = pkgs.writers.writePython3Bin "lut-apply" {} (
    pkgs.replaceVars ../scripts/lutgen.py {
      lutgen = lib.getExe pkgs.lutgen;
    }
  );
in
  stdenvNoCC.mkDerivation {
    inherit pname version;

    src = builtins.path {
      path = ../wallpapers;
      name = "${pname}-${version}";
    };

    strictDeps = true;

    preInstall = ''
      mkdir -p $out/share/wallpapers
    '';

    installPhase = ''
      runHook preInstall
      ${lib.getExe lutApply} $src $out/share/wallpapers ${
        if flavour != null
        then flavour
        else ""
      }
      runHook postInstall
    '';

    meta = {
      description = "wallpapers- catppuccin-ified!";
      license = lib.licenses.mit;
      platforms = lib.platforms.all;
      # maintainers = with lib.maintainers; [_42willow]; TODO)) maintain a nixpkg
    };
  }
