#!/usr/bin/env python3
import os
from PIL import Image
from pathlib import Path

home_dir = os.path.expanduser('~')

path = f"{home_dir}/minecraft-colorscripts/base-textures/"

dir_list = os.listdir(path)

def parse_file(filename):
    img = Image.open(f"{path}/{filename}.png")
    img = img.convert('RGBA')
    pix = img.load()
    file = open(f"{home_dir}/minecraft-colorscripts/colorscripts/{filename}.txt", "a")

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

for file in dir_list:
    filename = Path(file).stem
    parse_file(filename)
