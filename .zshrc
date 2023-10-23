# ZSH things
source $HOME/.ss_zshrc
export ZSH="$HOME/.zsh"
export EDITOR="nvim"
export VISUAL="nvim"
fpath=("$ZSH/themes" "$fpath[@]")
fpath=("$ZSH/plugins" "$fpath[@]")

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# home end prev-page next-page supr maps
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# autoloads 
autoload -U colors && colors
autoload -Uz compinit vcs_info
compinit

# Vcs info Configs
#
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       'git:(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats 'git:(%b|%a%u%c)'

# Prompt Setup
setopt prompt_subst
precmd() { vcs_info && print -rP '%B%F{yellow}%K{yellow}%{█▓▒░%}%B%F{black}%K{yellow}%n@%m%b%F{red}%K{yellow}%{░▒▓█%}%b%F{red}%K{black}%{█▓▒░%}%B%F{white}%K{black} %D{%a %b %d} %D{%I:%M:%S%P} %}%B%F{white}%K{black}' }
PROMPT='%~/%b%f%k '
RPROMPT='${vcs_info_msg_0_}' 

# ALIASES
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias la="ls --color -la"
alias grep="grep --color"
alias egrep="egrep --color"
alias tree="tree -C"

alias wget="wget --hsts-file=~/.cache/wget/wget-hsts"
# alias startx="startx /usr/bin/i3"
alias feh="feh --no-fehbg"
alias xclip2clip="xclip -sel clip"

# Aliases config repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias config-status='config remote update && echo "\n\n" && config status'
function config-commit-push(){
	config commit -m $1
	config push
}
alias config-ls="cd ~ && nvim \$(config ls-tree --full-tree -r --name-only HEAD | grep -Ev 'completions' | fzf)"

# SSH auto-add
if [ -f ~/.ssh/id_rsa ]; then
    for i in ~/.ssh/id_rsa*; do
        [[ -f "$i" ]] && [[ ! "$i" == *".pub" ]] && ssh-add $i >& /dev/null
    done
fi

# add_plugin zsh-syntax-highlighting
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# completions
[ -f "$ZSH/completions/zsh-completions.zsh" ] && source "$ZSH/completions/zsh-completions.zsh"

# set options
setopt autocd autopushd

if builtin type -p "neofetch" >/dev/null 2>&1; then eval neofetch;fi

