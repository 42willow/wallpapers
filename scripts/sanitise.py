import os
import glob

def sanitise_filenames(file_patterns):
    files = []
    for pattern in file_patterns:
        files.extend(glob.glob(pattern, recursive=True))

    for old_file in files:
        name, ext = os.path.splitext(old_file)
        sanitised_name = name.lower().replace(' ', '_').replace('-', '_')
        if ext.lower() == '.jpeg':
            ext = '.jpg'
        new_filename = sanitised_name + ext
        if old_file != new_filename:
            os.rename(old_file, new_filename)
            print(f'Renamed: "{old_file}" to "{new_filename}"')

file_patterns_input = input("Enter files:")
file_patterns = file_patterns_input.split()

sanitise_filenames(file_patterns)
