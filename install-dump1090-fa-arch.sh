#!/bin/bash

sudo pacman -S git --needed

git clone https://github.com/abcd567a/dump1090-fa-arch.git

cd dump1090-fa-arch

makepkg -si
