/*
** AXISTORM PROJECT, 2024
** parser
** File description:
** A parser for minecraft-colorscripts by Axistorm
** github.com/Axistorm1
*/

#include <stdio.h>
#include <stdlib.h>

typedef unsigned short ushort;

FILE *file;

void write_to_file(const char filename[], const char content[])
{
    file = fopen(filename, "a");
    fputs(content, file);
    fclose(file);
}

void write_esc_rgb(const char file[], ushort red, ushort green, ushort blue)
{
    char content[48];

    sprintf(content, "\033[38;2;%hu;%hu;%hum██\033[0m", red, green, blue);
    write_to_file(file, content);
}

int main(int argc, char *argv[])
{
    ushort red = atoi(argv[2]);
    ushort green = atoi(argv[3]);
    ushort blue = atoi(argv[4]);

    write_esc_rgb(argv[1], red, green, blue);
}
