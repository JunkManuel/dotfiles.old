#!/usr/bin/env zsh
if [ -d ~/Pictures/bg ]; then
	feh --bg-scale --no-fehbg ~/Picures/bg/$1
fi
if [ -d ~/.local/share/bg ]; then
	feh --bg-scale --no-fehbg ~/.local/share/bg/$1
fi
