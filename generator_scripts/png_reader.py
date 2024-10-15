#!/usr/bin/env python3
import os
from PIL import Image
from pathlib import Path
import sys

def parse_file(filename, texture_pack, path, home_dir):
    img = Image.open(f"{path}/{filename}.png")
    img = img.convert('RGBA')
    pix = img.load()
    file = open(f"{home_dir}/minecraft-colorscripts/colorscripts/{texture_pack}/{filename}.txt", "a")

    for x in range(img.width):
        for y in range(img.height):
            red, green, blue, alpha = pix[y, x]
            # print(red, blue, green)
            string = f"\x1b[38;2;{red};{green};{blue}m██\x1b[0m"
            if alpha < 128:
                string = f"\x1b[38;2;{red};{green};{blue}m  \x1b[0m"
            file.write(string)
        file.write('\n')
    return

def parse_texture_pack(texture_pack, directory, path, home_dir):

    try:
        pack_path = f"{home_dir}/minecraft-colorscripts/colorscripts/{texture_pack}"
        os.mkdir(pack_path)
        print(f"Directory '{texture_pack}' created successfully.")
    except FileExistsError:
        print(f"Directory '{texture_pack}' already exists. Ignore this warning.")

    for file in directory:
        filename = Path(file).stem
        parse_file(filename, texture_pack, path, home_dir)

def main():
    if not sys.argv[1]:
        print("Invalid pack name")
        return
    home_dir = os.path.expanduser('~')
    texture_pack = sys.argv[1]
    print("Generating", texture_pack, "colorscripts.")
    path = f"{home_dir}/minecraft-colorscripts/textures/{texture_pack}/"
    dir_list = os.listdir(path)
    parse_texture_pack(texture_pack, dir_list, path, home_dir)
    print("Generated", texture_pack, "textures.")

main()
