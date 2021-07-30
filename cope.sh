#!/bin/sh

cp /home/voidz/.profile .
cp /home/voidz/.bashrc .

mkdir -p /home/voidz/dotfiles/.config/
cd /home/voidz/dotfiles/.config 

mkdir -p /home/voidz/dotfiles/.config/foot/ .
cp -r /home/voidz/.config/foot/ .

mkdir -p /home/voidz/dotfiles/.config/nvim/ .
cp -r /home/voidz/.config/nvim/ .

mkdir -p /home/voidz/dotfiles/.config/sway/ .
cp -r /home/voidz/.config/sway/ .
