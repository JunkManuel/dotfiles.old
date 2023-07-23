#!/usr/bin/env sh

if ! builtin type -p 'zsh' >/dev/null 2>&1; then
    chsh -s /usr/bin/zsh
fi
cd ~ && mkdir dotfiles && cd dotfiles && git init --bare

alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
config pull https://github.com/JunkManuel/dotfiles
