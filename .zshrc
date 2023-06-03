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

# autoloads 
autoload -U colors && colors
autoload -U promptinit
autoload -Uz compinit
promptinit
compinit

# Prompt Setup
prompt fire yellow yellow red black white white 

# ALIASES
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias la="ls --color -la"
alias grep="grep --color"
alias egrep="egrep --color"
alias tree="tree -C"

alias wget="wget --hsts-file=~/.cache/wget/wget-hsts"
alias startx="startx /usr/bin/i3"
alias feh="feh --no-fehbg"
alias xclip2clip="xclip -sel clip"

function backup(){
    BACKUP_PATH="$1"
    printf 'You sure you want to perform a full system backup (may take some time) y/[N]: '

    read ANS

    if [ "$ANS" = "y" ] && [ -d "$BACKUP_PATH" ]; then 
        sudo rsync -aAXHv --exclude={"/home/*","/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / $BACKUP_PATH
    fi
}

# Aliases config repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias config-status='config remote update && echo "\n\n" && config status'
function config-commit-push(){
	config commit -m $1
	config push
}
alias config-ls="cd ~ && nvim \$(config ls-tree --full-tree -r --name-only HEAD | grep -Ev 'completions' | fzf)"

# SSH auto-add
for i in ~/.ssh/id_rsa*; do
    [[ -f "$i" ]] && [[ ! "$i" == *".pub" ]] && ssh-add $i &> /dev/null
done

# Plugins
function add_plugin(){
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ -d "$ZSH/plugins/$PLUGIN_NAME" ]; then
		source "$ZSH/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
		source "$ZSH/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
	fi
}

# add_plugin zsh-syntax-highlighting
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# completions
[ -f "$ZSH/completions/zsh-completions.zsh" ] && source "$ZSH/completions/zsh-completions.zsh"

# set options
setopt autocd autopushd

eval neofetch
