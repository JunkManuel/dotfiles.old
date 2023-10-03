#!/usr/bin/sh

# Yay (yet another yaourt) installation
if ! builtin type -p 'yay' >/dev/null 2>&1; then
    echo 'Install yay.'
    sudo pacman -S --needed base base-devel wget
    tmpdir="$(command mktemp -d)"
    command cd "${tmpdir}" || return 1
    dl_url="$(command curl -sfLS 'https://api.github.com/repos/Jguer/yay/releases/latest' |
        command grep 'browser_download_url' |
        command tail -1 |
        command cut -d '"' -f 4
    )"
    command wget "${dl_url}"
    command tar xzvf yay_*_x86_64.tar.gz
    command cd yay_*_x86_64 || return 1
    ./yay -Sy yay-bin
    rm -rf "${tmpdir}"
fi

packages=("git" "zsh" "zsh-completions" "zsh-syntax-highlighting-git" "brave" "neovim" "picom" "polybar" "gcc" "python" "python-ipykernel" "code" "alacritty" "rofi" "xournalpp" "networkmanager" "network-manager-applet" "jq" "udisks2" "ntfs-3g" "openssh" "syncthing" "keepassxc" "libreoffice-still" "onedrive-abraunegg" "go" "pcmanfm" "jupyter-notebook" "opentabletdriver" "maim" "wmctrl")

yay -Sy
yay -S ${packages[@]}

echo '\n-------------------------------------------------------\nExecute : \nsystemctl --user daemon-reload \nsystemctl --user enable opentabletdriver --now'
