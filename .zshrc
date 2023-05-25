# ZSH things
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
alias config-ls="config ls-tree --full-tree -r --name-only HEAD"

# Plugins
function add_plugin(){
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ -d "$ZSH/plugins/$PLUGIN_NAME" ]; then
		source "$ZSH/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
		source "$ZSH/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
	fi
}
add_plugin zsh-syntax-highlighting

# completions
source "$ZSH/completions/zsh-completions.zsh"

# set options
setopt autocd autopushd

eval neofetch
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

