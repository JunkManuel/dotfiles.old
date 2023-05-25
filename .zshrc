# ZSH things
setopt autocd
export ZSH="$HOME/.zsh"
export EDITOR="nvim"
fpath=("$ZSH/themes" "$fpath[@]")
fpath=("$ZSH/plugins" "$fpath[@]")

# autoloads 
autoload -U promptinit
autoload -Uz compinit
promptinit
compinit

# Prompt Setup
prompt fire yellow yellow red black white white 

# ls ALIASES
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias la="ls --color -la"
alias grep="grep --color"
alias egrep="egrep --color"
alias startx="startx /usr/bin/i3"
alias feh="feh --no-fehbg"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias config-s='config status'
function config-commit-push(){
	config commit -m $1
	config push
}
alias config-ls="cd ~ && nvim \$(config ls-tree --full-tree -r --name-only HEAD | grep -Ev 'completions' | fzf)"

# Plugins
function add_plugin(){
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ -d "$ZSH/plugins/$PLUGIN_NAME" ]; then
		source "$ZSH/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
		source "$ZSH/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
	fi
}

# add_plugin zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# completions
source "$ZSH/completions/zsh-completions.zsh"

# set options
setopt autocd autopushd

eval neofetch
