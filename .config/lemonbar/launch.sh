#!/bin/sh

#pull stuff from xresource 

. "/home/voidz/readxcolors"

~/.config/lemonbar/main | lemonbar -g 1366x34x0x0 -p -d -F$foreground -B$background -f "DejaVu Sans Mono"-12 -f FontAwesome-14 &
