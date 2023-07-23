#!/usr/bin/sh

packages=("zsh" "git" "firefox" "neovim" "picom" "polybar" "gcc" "python" "code" "alacritty" "rofi" "xournalpp" "networkmanager" "network-manager-applet" "jq" "udisks2" "ntfs-3g" "openssh" "syncthing" "keepassxc")

pacman -Sy
pacman -S ${packages[@]}
