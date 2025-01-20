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
    command = ['lutgen', 'apply']
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
