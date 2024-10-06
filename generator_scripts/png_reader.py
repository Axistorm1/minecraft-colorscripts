#!/usr/bin/env python3
import os
from PIL import Image
from pathlib import Path

home_dir = os.path.expanduser('~')

path = f"{home_dir}/minecraft-colorscripts/base-textures/"

dir_list = os.listdir(path)

def parse_file(filename):
    img = Image.open(f"{path}/{filename}.png")
    pix = img.load()
    file = open(f"{home_dir}/minecraft-colorscripts/colorscripts/{filename}.txt", "a")

    for x in range(img.width):
        for y in range(img.height):
            pixel_color = img.getpixel((y, x))
            red = pixel_color[0]
            green = pixel_color[1]
            blue = pixel_color[2]
            # print(red, blue, green)
            string = f"\x1b[38;2;{red};{green};{blue}m██\x1b[0m"
            file.write(string)
        file.write('\n')
    return

for file in dir_list:
    filename = Path(file).stem
    parse_file(filename)
