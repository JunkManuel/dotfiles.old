#!/usr/bin/env sh

#Change shell to zsh
if builtin type -p 'zsh' >/dev/null 2>&1; then
    chsh -s /usr/bin/zsh
fi

#Install configured neovim plugins
if builtin type -p 'nvim' >/dev/null 2>&1; then
    nvim --headless +PlugInstall +qa
fi

#Pull dotfiles git
mkdir -p ~/dotfiles && cd dotfiles && git init --bare
/usr/bin/git --git-dir=~/dofiles --work-tree=~/ pull https://github.com/JunkManuel/dotfiles
