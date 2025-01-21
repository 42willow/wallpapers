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

  pathsToCopy =
    if (flavour == null)
    then "./*"
    else "./${flavour}";

  lutApply = pkgs.writers.writePython3Bin "lut-apply" {} ''
    import os
    import sys
    import subprocess

    CTP_FLAVOURS = ["latte", "frappe", "macchiato", "mocha"]


    def main():
        if len(sys.argv) != 3:
            print("usage: python lutgen.py <input_dir> <output_dir>")
            sys.exit(1)

        input_dir = sys.argv[1]
        output_dir = sys.argv[2]

        # clean output directory
        os.system(f'rm -r {output_dir}/*')

        for flavour in CTP_FLAVOURS:
            os.makedirs(os.path.join(output_dir, flavour), exist_ok=True)
            # for every file in the input directory and its subdirectories
            for root, dirs, files in os.walk(input_dir):
                for file in files:
                    if any(file.endswith(ext) for ext in ["jpg", "jpeg", "png"]):
                        input_path = os.path.join(root, file)
                        # print("input_path: " + input_path)
                        relative_path = os.path.relpath(input_path, input_dir)
                        output_path = os.path.join(
                            output_dir,
                            flavour,
                            relative_path
                        )
                        # print("output_path: " + output_path)
                        apply_lutgen(
                            [input_path],
                            output_path=output_path,
                            palette=f"catppuccin-{flavour}"
                        )


    def apply_lutgen(images, output_path=None, palette=None, level=10):
        command = [
          '${pkgs.lutgen}/bin/lutgen',
          'apply'
        ]
        if output_path:
            command.append(f'--output={output_path}')
        if palette:
            command.append(f'--palette={palette}')
        command.append(f'--level={level}')
        command.extend(images)
        try:
            result = subprocess.run(
                command,
                check=True,
                text=True,
                capture_output=True
            )
            print("[lutgen] output: ", result.stdout)
        except subprocess.CalledProcessError as e:
            print("[lutgen] error: ", e.stderr)
            sys.exit(e.returncode)


    if __name__ == "__main__":
        main()
  '';
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
      # TODO)) use "flavour"
      ${lib.getExe lutApply} $src $out/share/wallpapers
      runHook postInstall
    '';

    meta = {
      description = "wallpapers- catppuccin-ified!";
      license = lib.licenses.mit;
      platforms = lib.platforms.all;
      # maintainers = with lib.maintainers; [_42willow]; TODO)) maintain a nixpkg
    };
  }
